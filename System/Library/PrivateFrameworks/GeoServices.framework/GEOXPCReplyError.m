@interface GEOXPCReplyError
- (BOOL)isValid;
- (GEOXPCReplyError)initWithReplyObject:(id)a3 error:(id)a4 mode:(unint64_t)a5;
- (GEOXPCReplyError)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSError)error;
- (NSString)description;
- (void)encodeToXPCDictionary:(id)a3;
- (void)send;
@end

@implementation GEOXPCReplyError

- (GEOXPCReplyError)initWithReplyObject:(id)a3 error:(id)a4 mode:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = 0;
  if (v10 && v9 && a5 != 2)
  {
    v15.receiver = self;
    v15.super_class = (Class)GEOXPCReplyError;
    v12 = [(GEOXPCReplyError *)&v15 init];
    v13 = v12;
    if (v12)
    {
      v12->_flags = 2;
      objc_storeStrong((id *)&v12->_object, a3);
      objc_storeStrong((id *)&v13->_error, a4);
      v13->_mode = a5;
    }
    self = v13;
    v11 = self;
  }

  return v11;
}

- (GEOXPCReplyError)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v51.receiver = self;
  v51.super_class = (Class)GEOXPCReplyError;
  v7 = [(GEOXPCReplyError *)&v51 init];
  v8 = v7;
  if (!v7) {
    goto LABEL_30;
  }
  v7->_flags = 1;
  int64_t int64 = xpc_dictionary_get_int64(v6, "__em__");
  v8->_mode = int64;
  switch(int64)
  {
    case 2:
      goto LABEL_30;
    case 1:
      *(void *)length = 0;
      data = xpc_dictionary_get_data(v6, "__error", (size_t *)length);
      if (!data || !*(void *)length) {
        goto LABEL_30;
      }
      v17 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:*(void *)length freeWhenDone:0];
      v18 = (void *)MEMORY[0x1E4F28DC0];
      v19 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v20 = objc_opt_class();
      v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
      uint64_t v22 = [v18 unarchivedObjectOfClasses:v21 fromData:v17 error:a4];
      error = v8->_error;
      v8->_error = (NSError *)v22;

      break;
    case 0:
      xpc_dictionary_get_value(v6, "userInfo");
      id v10 = (GEOXPCReplyError *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10) {
        goto LABEL_31;
      }
      uint64_t v12 = xpc_dictionary_get_value(v10, "err");
      if (!v12)
      {

        goto LABEL_30;
      }
      v13 = (void *)v12;
      uint64_t v14 = _geo_NSErrorFromXPCDictionaryRepresentationCopy();
      objc_super v15 = v8->_error;
      v8->_error = (NSError *)v14;

      break;
  }
  v24 = v8->_error;
  if (!v24)
  {
LABEL_30:
    v11 = 0;
    goto LABEL_31;
  }
  v25 = v24;
  if ([(NSError *)v25 code] == -3)
  {
    v26 = [(NSError *)v25 domain];
    v27 = GEOErrorDomain();
    int v28 = [v26 isEqual:v27];

    if (v28)
    {
      v29 = [(NSError *)v25 userInfo];
      v30 = [v29 objectForKeyedSubscript:@"requestKind"];

      unsigned int v31 = [v30 intValue];
      unsigned int v32 = (v31 >> 8) & 0x7F;
      BOOL v33 = v32 > 0xB;
      int v34 = (1 << v32) & 0xC05;
      if (v33 || v34 == 0 || v31 != 1)
      {
        v37 = [(NSError *)v25 userInfo];
        v38 = [v37 objectForKeyedSubscript:@"details"];
        v39 = [v38 firstObject];

        if ([v39 count])
        {
          v40 = [v39 objectForKeyedSubscript:@"maxRequests"];
          uint64_t v41 = [v40 unsignedIntValue];

          v42 = [v39 objectForKeyedSubscript:@"windowSize"];
          uint64_t v43 = [v42 unsignedIntValue];

          v44 = [v39 objectForKeyedSubscript:@"timeUntilReset"];
          uint64_t v45 = [v44 unsignedIntValue];

          v46 = [NSString stringWithFormat:@"Tried to make more than %u requests in %u seconds, will reset in %u seconds", v41, v43, v45];
        }
        else
        {
          v46 = @"No details found";
        }
        v47 = [(NSError *)v25 userInfo];
        v48 = [v47 objectForKeyedSubscript:@"requestKindString"];

        v49 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOXPC");
        if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)length = 138412802;
          *(void *)&length[4] = v48;
          __int16 v53 = 2112;
          v54 = v46;
          __int16 v55 = 2112;
          v56 = v25;
          _os_log_impl(&dword_188D96000, v49, OS_LOG_TYPE_FAULT, "Throttled \"%@\" request: %@ - %@", length, 0x20u);
        }
      }
    }
  }

  v11 = v8;
LABEL_31:

  return v11;
}

- (void)encodeToXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  if ((self->_flags & 2) != 0)
  {
    error = self->_error;
    if (error)
    {
      int64_t mode = self->_mode;
      if (mode != 2)
      {
        if (mode == 1)
        {
          v8 = (void *)MEMORY[0x1E4F28DB0];
          id v9 = _geo_NSErrorXPCSafeRepresentationCopy(error);
          id v10 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];

          id v6 = v10;
          xpc_dictionary_set_data(xdict, "__error", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
        }
        else
        {
          if (mode)
          {
LABEL_9:
            xpc_dictionary_set_int64(xdict, "__em__", mode);
            goto LABEL_10;
          }
          _geo_NSErrorXPCDictionaryRepresentationCopy(error);
          id v6 = (id)objc_claimAutoreleasedReturnValue();
          xpc_object_t empty = xpc_dictionary_create_empty();
          xpc_dictionary_set_value(empty, "err", v6);
          xpc_dictionary_set_value(xdict, "userInfo", empty);
        }
        int64_t mode = self->_mode;
        goto LABEL_9;
      }
    }
  }
LABEL_10:
}

- (BOOL)isValid
{
  v2 = [(GEOXPCReplyError *)self error];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)description
{
  BOOL v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p {flags: 0x%x object: %@ error: %@}>", v5, self, self->_flags, self->_object, self->_error];

  return (NSString *)v6;
}

- (void)send
{
  if ((self->_flags & 2) != 0)
  {
    if ([(GEOXPCReplyError *)self isValid])
    {
      object = self->_object;
      if (object)
      {
        if (self->_mode == 1) {
          GEOEncodeModernXPCMessage(self, object);
        }
        else {
          [(GEOXPCReplyError *)self encodeToXPCDictionary:self->_object];
        }
        xpc_dictionary_get_remote_connection(self->_object);
        v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          v5 = v4;
          xpc_connection_send_message(v4, self->_object);
          v4 = v5;
        }
      }
    }
  }
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_object, 0);
}

@end