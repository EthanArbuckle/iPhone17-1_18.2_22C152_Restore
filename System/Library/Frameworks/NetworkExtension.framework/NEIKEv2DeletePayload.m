@interface NEIKEv2DeletePayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
@end

@implementation NEIKEv2DeletePayload

- (void).cxx_destruct
{
}

- (BOOL)parsePayloadData
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!self || !objc_getProperty(self, a2, 16, 1))
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[NEIKEv2DeletePayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_23;
    }
LABEL_7:

    return 0;
  }
  if ((unint64_t)objc_msgSend(objc_getProperty(self, v3, 16, 1), "length") <= 3)
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[NEIKEv2DeletePayload parsePayloadData]";
      v6 = "%s called with null (self.payloadData.length >= sizeof(ikev2_payload_delete_hdr_t))";
LABEL_23:
      _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, v6, buf, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  int v20 = 0;
  objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v20, 4);
  uint64_t v9 = v20;
  self->_protocol = v20;
  if (v9 == 3)
  {
    if (BYTE1(v20) == 4)
    {
      if (HIWORD(v20))
      {
        unint64_t v10 = 0;
        unint64_t v11 = 4;
        do
        {
          if (objc_msgSend(objc_getProperty(self, v8, 16, 1), "length") < v11) {
            break;
          }
          id v13 = objc_getProperty(self, v12, 16, 1);
          v14 = -[NEIKEv2ESPSPI initWithValue:]([NEIKEv2ESPSPI alloc], "initWithValue:", *(unsigned int *)([v13 bytes] + 4 * v10 + 4));
          if (objc_getProperty(self, v15, 32, 1))
          {
            objc_msgSend(objc_getProperty(self, v16, 32, 1), "arrayByAddingObject:", v14);
          }
          else
          {
            v21 = v14;
            [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
          v17 = };
          objc_setProperty_atomic(self, v18, v17, 32);

          ++v10;
          v11 += 4;
        }
        while (v10 < bswap32(HIWORD(v20)) >> 16);
      }
    }
    else
    {
      v19 = ne_log_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = BYTE1(v20);
        _os_log_error_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_ERROR, "Invalid DELETE SPI length %u", buf, 8u);
      }
    }
  }
  return [(NEIKEv2DeletePayload *)self hasRequiredFields];
}

- (BOOL)generatePayloadData
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    if (objc_getProperty(self, a2, 16, 1)) {
      return objc_getProperty(self, v3, 16, 1) != 0;
    }
    if ([(NEIKEv2DeletePayload *)self hasRequiredFields])
    {
      int v24 = 0;
      unint64_t protocol = self->_protocol;
      int v24 = protocol;
      if (protocol == 3)
      {
        BYTE1(v24) = 4;
        HIWORD(v24) = bswap32(objc_msgSend(objc_getProperty(self, v5, 32, 1), "count")) >> 16;
        v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", 4 * objc_msgSend(objc_getProperty(self, v9, 32, 1), "count") + 4);
        [v8 appendBytes:&v24 length:4];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = objc_getProperty(self, v10, 32, 1);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
              *(_DWORD *)buf = 0;
              *(_DWORD *)buf = objc_msgSend(v16, "value", (void)v20);
              [v8 appendBytes:buf length:4];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v27 count:16];
          }
          while (v13);
        }

        goto LABEL_16;
      }
      if (protocol == 1)
      {
        BYTE1(v24) = 0;
        HIWORD(v24) = 0;
        v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v24 length:4];
LABEL_16:
        objc_setProperty_atomic(self, v7, v8, 16);

        return objc_getProperty(self, v3, 16, 1) != 0;
      }
      goto LABEL_19;
    }
LABEL_21:
    SEL v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_ERROR, "Delete payload missing required fields", buf, 2u);
    }

    return 0;
  }
  if (([0 hasRequiredFields] & 1) == 0) {
    goto LABEL_21;
  }
  int v24 = 0;
LABEL_19:
  v17 = ne_log_obj();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    if (self) {
      unint64_t v19 = self->_protocol;
    }
    else {
      LODWORD(v19) = 0;
    }
    *(_DWORD *)buf = 67109120;
    int v26 = v19;
    _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, "Unsupported DELETE protocol type %u", buf, 8u);
  }

  return 0;
}

- (BOOL)hasRequiredFields
{
  if (self) {
    LOBYTE(self) = self->_protocol != 0;
  }
  return (char)self;
}

- (id)description
{
  return [(NEIKEv2DeletePayload *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self)
  {
    [v7 appendPrettyInt:self->_protocol withName:@"Protocol" andIndent:v5 options:a4];
    id Property = objc_getProperty(self, v9, 32, 1);
  }
  else
  {
    [v7 appendPrettyInt:0 withName:@"Protocol" andIndent:v5 options:a4];
    id Property = 0;
  }
  [v7 appendPrettyObject:Property withName:@"SPIs" andIndent:v5 options:a4];

  return v7;
}

- (unint64_t)type
{
  return 42;
}

+ (id)copyTypeDescription
{
  return @"Delete";
}

@end