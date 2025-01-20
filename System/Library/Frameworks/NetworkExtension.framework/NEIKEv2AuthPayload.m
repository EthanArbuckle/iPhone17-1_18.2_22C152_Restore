@interface NEIKEv2AuthPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
- (void)setAuthProtocol:(uint64_t)a1;
- (void)setAuthenticationData:(uint64_t)a1;
@end

@implementation NEIKEv2AuthPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationData, 0);

  objc_storeStrong((id *)&self->_authProtocol, 0);
}

- (BOOL)parsePayloadData
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self && objc_getProperty(self, a2, 16, 1))
  {
    int v17 = 0;
    if ((unint64_t)objc_msgSend(objc_getProperty(self, v3, 16, 1), "length") > 3)
    {
      objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v17, 4);
      if (objc_msgSend(objc_getProperty(self, v7, 16, 1), "length") == 4)
      {
        v5 = ne_log_obj();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        String = NEIKEv2AuthenticationMethodCreateString(v17);
        *(_DWORD *)buf = 138412290;
        v19 = (const char *)String;
        v10 = "Auth payload with method %@ does not have any data";
      }
      else
      {
        id v11 = objc_getProperty(self, v8, 16, 1);
        id v13 = objc_getProperty(self, v12, 16, 1);
        v14 = objc_msgSend(v11, "subdataWithRange:", 4, objc_msgSend(v13, "length") - 4);

        -[NEIKEv2AuthPayload setAuthenticationData:]((uint64_t)self, v14);
        v15 = +[NEIKEv2Crypto copyAuthenticationProtocolForAuthMethod:authData:]((uint64_t)NEIKEv2Crypto, v17, self->_authenticationData);
        objc_storeStrong((id *)&self->_authProtocol, v15);

        if (self->_authProtocol) {
          return [(NEIKEv2AuthPayload *)self hasRequiredFields];
        }
        v5 = ne_log_obj();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        String = NEIKEv2AuthenticationMethodCreateString(v17);
        *(_DWORD *)buf = 138412290;
        v19 = (const char *)String;
        v10 = "Failed to parse authentication protocol for method %@";
      }
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);

      goto LABEL_15;
    }
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[NEIKEv2AuthPayload parsePayloadData]";
      v6 = "%s called with null (self.payloadData.length >= sizeof(header))";
LABEL_8:
      _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, v6, buf, 0xCu);
    }
  }
  else
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[NEIKEv2AuthPayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_8;
    }
  }
LABEL_15:

  return 0;
}

- (void)setAuthenticationData:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setAuthProtocol:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (BOOL)generatePayloadData
{
  if (self)
  {
    if (objc_getProperty(self, a2, 16, 1)) {
      goto LABEL_7;
    }
    if ([(NEIKEv2AuthPayload *)self hasRequiredFields])
    {
      int v13 = 0;
      char v4 = [(NEIKEv2AuthenticationProtocol *)self->_authProtocol method];
      authenticationData = self->_authenticationData;
LABEL_5:
      LOBYTE(v13) = v4;
      v6 = authenticationData;
      uint64_t v7 = [(NSData *)v6 length] + 4;
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v7];
      [v8 appendBytes:&v13 length:4];
      [v8 appendData:v6];

      if (!self)
      {

        id Property = 0;
        return Property != 0;
      }
      objc_setProperty_atomic(self, v9, v8, 16);

LABEL_7:
      id Property = objc_getProperty(self, v3, 16, 1);
      return Property != 0;
    }
  }
  else if ([0 hasRequiredFields])
  {
    char v4 = 0;
    authenticationData = 0;
    int v13 = 0;
    goto LABEL_5;
  }
  SEL v12 = ne_log_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, "Auth payload missing required fields", buf, 2u);
  }

  return 0;
}

- (BOOL)hasRequiredFields
{
  v2 = self;
  if (self)
  {
    v3 = self->_authenticationData;
    if (v3)
    {
      char v4 = v3;
      authProtocol = v2->_authProtocol;
      if (authProtocol)
      {
        v6 = authProtocol;
        LOBYTE(v2) = [(NEIKEv2AuthenticationProtocol *)v6 method] != 0;
      }
      else
      {
        LOBYTE(v2) = 0;
      }
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
  return [(NEIKEv2AuthPayload *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self)
  {
    [v7 appendPrettyObject:self->_authProtocol withName:@"Authentication Protocol" andIndent:v5 options:a4];
    authenticationData = self->_authenticationData;
  }
  else
  {
    [v7 appendPrettyObject:0 withName:@"Authentication Protocol" andIndent:v5 options:a4];
    authenticationData = 0;
  }
  [v7 appendPrettyObject:authenticationData withName:@"Authentication Data" andIndent:v5 options:a4];

  return v7;
}

- (unint64_t)type
{
  return 39;
}

+ (id)copyTypeDescription
{
  return @"Auth";
}

@end