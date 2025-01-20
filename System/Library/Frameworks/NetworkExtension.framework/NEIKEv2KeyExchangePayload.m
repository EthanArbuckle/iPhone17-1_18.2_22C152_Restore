@interface NEIKEv2KeyExchangePayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
@end

@implementation NEIKEv2KeyExchangePayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keData, 0);

  objc_storeStrong((id *)&self->_kem, 0);
}

- (BOOL)parsePayloadData
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!self || !objc_getProperty(self, a2, 16, 1))
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136315138;
      v18 = "-[NEIKEv2KeyExchangePayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_11;
    }
LABEL_7:

    return 0;
  }
  if ((unint64_t)objc_msgSend(objc_getProperty(self, v3, 16, 1), "length") <= 3)
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136315138;
      v18 = "-[NEIKEv2KeyExchangePayload parsePayloadData]";
      v6 = "%s called with null (self.payloadData.length >= sizeof(ikev2_payload_ke_hdr_t))";
LABEL_11:
      _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, v6, (uint8_t *)&v17, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  int v17 = 0;
  objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v17, 4);
  v8 = [NEIKEv2KEMProtocol alloc];
  v9 = [(NEIKEv2KEMProtocol *)v8 initWithMethod:bswap32((unsigned __int16)v17) >> 16];
  objc_setProperty_atomic(self, v10, v9, 24);

  id v12 = objc_getProperty(self, v11, 16, 1);
  id v14 = objc_getProperty(self, v13, 16, 1);
  v15 = objc_msgSend(v12, "subdataWithRange:", 4, objc_msgSend(v14, "length") - 4);

  objc_setProperty_atomic(self, v16, v15, 32);
  return [(NEIKEv2KeyExchangePayload *)self hasRequiredFields];
}

- (BOOL)generatePayloadData
{
  if (self)
  {
    if (objc_getProperty(self, a2, 16, 1)) {
      goto LABEL_7;
    }
    if ([(NEIKEv2KeyExchangePayload *)self hasRequiredFields])
    {
      __int16 v16 = 0;
      __int16 v15 = bswap32(objc_msgSend(objc_getProperty(self, v4, 24, 1), "method")) >> 16;
      id Property = objc_getProperty(self, v5, 32, 1);
LABEL_5:
      uint64_t v7 = [Property length] + 4;
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v7];
      [v8 appendBytes:&v15 length:4];
      if (!self)
      {
        [v8 appendData:0];

        id v11 = 0;
        return v11 != 0;
      }
      objc_msgSend(v8, "appendData:", objc_getProperty(self, v9, 32, 1));
      objc_setProperty_atomic(self, v10, v8, 16);

LABEL_7:
      id v11 = objc_getProperty(self, v3, 16, 1);
      return v11 != 0;
    }
  }
  else if ([0 hasRequiredFields])
  {
    __int16 v16 = 0;
    unsigned int v13 = [0 method];
    id Property = 0;
    __int16 v15 = bswap32(v13) >> 16;
    goto LABEL_5;
  }
  id v14 = ne_log_obj();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "KE payload missing required fields", buf, 2u);
  }

  return 0;
}

- (BOOL)hasRequiredFields
{
  v2 = self;
  if (self)
  {
    id v3 = objc_getProperty(self, a2, 24, 1);
    if (v3)
    {
      SEL v5 = v3;
      LOBYTE(v2) = objc_getProperty(v2, v4, 32, 1) != 0;
    }
    else
    {
      LOBYTE(v2) = 0;
    }
  }
  return (char)v2;
}

- (id)description
{
  return [(NEIKEv2KeyExchangePayload *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self)
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v9, 24, 1), @"Method", v5, a4);
    id Property = objc_getProperty(self, v10, 32, 1);
  }
  else
  {
    [v7 appendPrettyObject:0 withName:@"Method" andIndent:v5 options:a4];
    id Property = 0;
  }
  [v7 appendPrettyObject:Property withName:@"Data" andIndent:v5 options:a4];

  return v7;
}

- (unint64_t)type
{
  return 34;
}

+ (id)copyTypeDescription
{
  return @"KE";
}

@end