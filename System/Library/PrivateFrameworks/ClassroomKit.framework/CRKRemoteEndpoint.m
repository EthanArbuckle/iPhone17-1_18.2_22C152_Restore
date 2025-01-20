@interface CRKRemoteEndpoint
- (BOOL)isEqual:(id)a3;
- (CRKRemoteEndpoint)init;
- (CRKRemoteEndpoint)initWithIPAddress:(id)a3 port:(unsigned __int16)a4;
- (NSString)IPAddress;
- (NSString)stringValue;
- (id)description;
- (unint64_t)hash;
- (unsigned)port;
@end

@implementation CRKRemoteEndpoint

- (CRKRemoteEndpoint)init
{
  return [(CRKRemoteEndpoint *)self initWithIPAddress:@"0.0.0.0" port:0];
}

- (CRKRemoteEndpoint)initWithIPAddress:(id)a3 port:(unsigned __int16)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKRemoteEndpoint;
  v7 = [(CRKRemoteEndpoint *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    IPAddress = v7->_IPAddress;
    v7->_IPAddress = (NSString *)v8;

    v7->_port = a4;
  }

  return v7;
}

- (NSString)stringValue
{
  v3 = NSString;
  v4 = [(CRKRemoteEndpoint *)self IPAddress];
  v5 = [v3 stringWithFormat:@"%@:%d", v4, -[CRKRemoteEndpoint port](self, "port")];

  return (NSString *)v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CRKRemoteEndpoint *)self IPAddress];
  id v6 = [v3 stringWithFormat:@"<%@: %p { IPAddress = %@, port = %d }>", v4, self, v5, -[CRKRemoteEndpoint port](self, "port")];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(CRKRemoteEndpoint *)self IPAddress];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = v4 ^ [(CRKRemoteEndpoint *)self port];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v4 = (CRKRemoteEndpoint *)a3;
  if (v4 == self)
  {
    BOOL v21 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = objc_msgSend(@"IPAddress, port", "componentsSeparatedByString:", @",");
      id v6 = (void *)[v5 mutableCopy];

      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __crk_tokenized_properties_block_invoke_6;
      v29[3] = &unk_2646F3750;
      id v7 = v6;
      id v30 = v7;
      [v7 enumerateObjectsUsingBlock:v29];

      uint64_t v8 = self;
      v9 = v4;
      id v10 = v7;
      if ([(CRKRemoteEndpoint *)v9 isMemberOfClass:objc_opt_class()])
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          id v23 = v10;
          v24 = v4;
          uint64_t v14 = *(void *)v26;
          while (2)
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v26 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(id *)(*((void *)&v25 + 1) + 8 * i);
              v17 = v9;
              uint64_t v18 = [(CRKRemoteEndpoint *)v8 valueForKey:v16];
              uint64_t v19 = [(CRKRemoteEndpoint *)v17 valueForKey:v16];

              if (v18 | v19)
              {
                int v20 = [(id)v18 isEqual:v19];

                if (!v20)
                {
                  BOOL v21 = 0;
                  goto LABEL_18;
                }
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
            if (v13) {
              continue;
            }
            break;
          }
          BOOL v21 = 1;
LABEL_18:
          id v10 = v23;
          uint64_t v4 = v24;
        }
        else
        {
          BOOL v21 = 1;
        }
      }
      else
      {
        BOOL v21 = 0;
      }
    }
    else
    {
      BOOL v21 = 0;
    }
  }

  return v21;
}

- (NSString)IPAddress
{
  return self->_IPAddress;
}

- (unsigned)port
{
  return self->_port;
}

- (void).cxx_destruct
{
}

@end