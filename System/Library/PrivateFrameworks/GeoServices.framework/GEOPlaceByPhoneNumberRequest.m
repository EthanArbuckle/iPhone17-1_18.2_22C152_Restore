@interface GEOPlaceByPhoneNumberRequest
+ (Class)replyClass;
- (BOOL)allowCellular;
- (BOOL)isValid;
- (GEOPlaceByPhoneNumberRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOPlaceByPhoneNumberRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSArray)phoneNumbers;
- (NSUUID)requestUUID;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setAllowCellular:(BOOL)a3;
- (void)setPhoneNumbers:(id)a3;
- (void)setRequestUUID:(id)a3;
@end

@implementation GEOPlaceByPhoneNumberRequest

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumbers, 0);

  objc_storeStrong((id *)&self->_requestUUID, 0);
}

- (void)setRequestUUID:(id)a3
{
}

- (void)setPhoneNumbers:(id)a3
{
}

- (void)setAllowCellular:(BOOL)a3
{
  self->_allowCellular = a3;
}

- (unint64_t)reply
{
  return 1;
}

- (BOOL)isValid
{
  v3 = [(GEOPlaceByPhoneNumberRequest *)self requestUUID];
  if (v3)
  {
    v4 = [(GEOPlaceByPhoneNumberRequest *)self phoneNumbers];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (GEOPlaceByPhoneNumberRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GEOPlaceByPhoneNumberRequest;
  v7 = [(GEOXPCRequest *)&v21 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    uuid = xpc_dictionary_get_uuid(v6, "requestUUID");
    if (uuid)
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uuid];
      requestUUID = v7->_requestUUID;
      v7->_requestUUID = (NSUUID *)v9;
    }
    v11 = xpc_dictionary_get_array(v6, "phs");
    size_t count = xpc_array_get_count(v11);
    v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:count];
    if (count)
    {
      for (size_t i = 0; i != count; ++i)
      {
        string = xpc_array_get_string(v11, i);
        if (string)
        {
          v16 = [NSString stringWithUTF8String:string];
          [v13 addObject:v16];
        }
      }
    }
    uint64_t v17 = [v13 count];
    if (v17) {
      v18 = (void *)[v13 copy];
    }
    else {
      v18 = 0;
    }
    objc_storeStrong((id *)&v7->_phoneNumbers, v18);
    if (v17) {

    }
    v7->_allowCellular = xpc_dictionary_get_BOOL(v6, "cell");
    v19 = v7;
  }

  return v7;
}

- (GEOPlaceByPhoneNumberRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"placedata.requestPhoneNumbers" traits:a3 auditToken:a4 throttleToken:a5];
}

- (void)encodeToXPCDictionary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOPlaceByPhoneNumberRequest;
  [(GEOXPCRequest *)&v18 encodeToXPCDictionary:v4];
  requestUUID = self->_requestUUID;
  if (requestUUID)
  {
    *(void *)uuid = 0;
    uint64_t v21 = 0;
    [(NSUUID *)requestUUID getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v4, "requestUUID", uuid);
  }
  if ([(NSArray *)self->_phoneNumbers count])
  {
    xpc_object_t v6 = xpc_array_create(0, 0);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_phoneNumbers;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(id *)(*((void *)&v14 + 1) + 8 * i);
          v13 = (const char *)objc_msgSend(v12, "UTF8String", (void)v14);
          if (v13) {
            xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, v13);
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }

    if (xpc_array_get_count(v6)) {
      xpc_dictionary_set_value(v4, "phs", v6);
    }
  }
  xpc_dictionary_set_BOOL(v4, "cell", self->_allowCellular);
}

- (BOOL)allowCellular
{
  return self->_allowCellular;
}

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

@end