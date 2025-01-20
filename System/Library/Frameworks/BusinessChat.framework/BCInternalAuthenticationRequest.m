@interface BCInternalAuthenticationRequest
+ (BOOL)supportsSecureCoding;
- (BCInternalAuthenticationRequest)initWithCoder:(id)a3;
- (BCInternalAuthenticationRequest)initWithDictionary:(id)a3;
- (NSArray)retrieve;
- (NSDictionary)dictionaryValue;
- (NSDictionary)labels;
- (NSString)businessIdentifier;
- (NSString)groupIdentifier;
- (NSString)responseEncryptionKey;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCInternalAuthenticationRequest

- (BCInternalAuthenticationRequest)initWithDictionary:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)BCInternalAuthenticationRequest;
  v5 = [(BCInternalAuthenticationRequest *)&v54 init];
  if (v5)
  {
    v6 = LogCategory_Daemon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v4 description];
      *(_DWORD *)buf = 138412290;
      v57 = v7;
      _os_log_impl(&dword_228C26000, v6, OS_LOG_TYPE_DEFAULT, "BCInternalAuthenticationRequest: initWithDictionary %@", buf, 0xCu);
    }
    v8 = [v4 objectForKeyedSubscript:@"businessIdentifier"];
    v9 = [MEMORY[0x263EFF9D0] null];
    if (v8 == v9)
    {
      v10 = 0;
    }
    else
    {
      v10 = [v4 objectForKeyedSubscript:@"businessIdentifier"];
    }

    v11 = [v4 objectForKeyedSubscript:@"groupIdentifier"];
    v12 = [MEMORY[0x263EFF9D0] null];
    if (v11 == v12)
    {
      v13 = 0;
    }
    else
    {
      v13 = [v4 objectForKeyedSubscript:@"groupIdentifier"];
    }

    v14 = [v4 objectForKeyedSubscript:@"responseEncryptionKey"];
    v15 = [MEMORY[0x263EFF9D0] null];
    if (v14 == v15)
    {
      v16 = 0;
    }
    else
    {
      v16 = [v4 objectForKeyedSubscript:@"responseEncryptionKey"];
    }

    v17 = [v4 objectForKeyedSubscript:@"retrieve"];
    v18 = [MEMORY[0x263EFF9D0] null];
    if (v17 == v18)
    {
      v19 = 0;
    }
    else
    {
      v19 = [v4 objectForKeyedSubscript:@"retrieve"];
    }

    v20 = [v4 objectForKeyedSubscript:@"labels"];
    v21 = [MEMORY[0x263EFF9D0] null];
    if (v20 == v21)
    {
      v22 = 0;
    }
    else
    {
      v22 = [v4 objectForKeyedSubscript:@"labels"];
    }

    v23 = (NSDictionary *)objc_opt_new();
    if (v10)
    {
      if (v13)
      {
        if (v16)
        {
          if (v19)
          {
            v45 = v19;
            v46 = v16;
            v47 = v13;
            v48 = v10;
            v49 = v5;
            long long v52 = 0u;
            long long v53 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            id v24 = v22;
            uint64_t v25 = [v24 countByEnumeratingWithState:&v50 objects:v55 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v51;
              do
              {
                for (uint64_t i = 0; i != v26; ++i)
                {
                  if (*(void *)v51 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  uint64_t v29 = *(void *)(*((void *)&v50 + 1) + 8 * i);
                  v30 = [v24 objectForKeyedSubscript:v29];
                  if (v30)
                  {
                    v31 = [[BCAuthenticationLabels alloc] initWithDictionary:v30];
                    [(NSDictionary *)v23 setObject:v31 forKeyedSubscript:v29];
                  }
                }
                uint64_t v26 = [v24 countByEnumeratingWithState:&v50 objects:v55 count:16];
              }
              while (v26);
            }

            v5 = v49;
            businessIdentifier = v49->_businessIdentifier;
            v49->_businessIdentifier = v48;
            v33 = v48;

            groupIdentifier = v49->_groupIdentifier;
            v49->_groupIdentifier = v47;
            v35 = v47;

            responseEncryptionKey = v49->_responseEncryptionKey;
            v49->_responseEncryptionKey = v46;
            v37 = v46;

            retrieve = v49->_retrieve;
            v49->_retrieve = v45;
            v39 = v45;

            labels = v49->_labels;
            v49->_labels = v23;

            goto LABEL_33;
          }
          v42 = LogCategory_Daemon();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v43 = "Unable to create  BCInternalAuthenticationRequest: missing 'retrieve' in payload";
            goto LABEL_42;
          }
LABEL_43:

          v41 = 0;
          goto LABEL_44;
        }
        v42 = LogCategory_Daemon();
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          goto LABEL_43;
        }
        *(_WORD *)buf = 0;
        v43 = "Unable to create  BCInternalAuthenticationRequest: missing 'responseEncryptionKey' in payload";
      }
      else
      {
        v42 = LogCategory_Daemon();
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          goto LABEL_43;
        }
        *(_WORD *)buf = 0;
        v43 = "Unable to create  BCInternalAuthenticationRequest: missing 'groupIdentifier' in payload";
      }
    }
    else
    {
      v42 = LogCategory_Daemon();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        goto LABEL_43;
      }
      *(_WORD *)buf = 0;
      v43 = "Unable to create BCInternalAuthenticationRequest: missing 'business identifier' in payload";
    }
LABEL_42:
    _os_log_error_impl(&dword_228C26000, v42, OS_LOG_TYPE_ERROR, v43, buf, 2u);
    goto LABEL_43;
  }
LABEL_33:
  v41 = v5;
LABEL_44:

  return v41;
}

- (void)encodeWithCoder:(id)a3
{
  businessIdentifier = self->_businessIdentifier;
  id v5 = a3;
  [v5 encodeObject:businessIdentifier forKey:@"businessIdentifier"];
  [v5 encodeObject:self->_groupIdentifier forKey:@"groupIdentifier"];
  [v5 encodeObject:self->_responseEncryptionKey forKey:@"responseEncryptionKey"];
  [v5 encodeObject:self->_retrieve forKey:@"retrieve"];
  [v5 encodeObject:self->_labels forKey:@"labels"];
}

- (BCInternalAuthenticationRequest)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BCInternalAuthenticationRequest;
  id v5 = [(BCInternalAuthenticationRequest *)&v18 init];
  if (v5)
  {
    v6 = LogCategory_Daemon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl(&dword_228C26000, v6, OS_LOG_TYPE_DEFAULT, "BCInternalAuthenticationRequest: initWithCoder %@", buf, 0xCu);
    }

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"businessIdentifier"];
    businessIdentifier = v5->_businessIdentifier;
    v5->_businessIdentifier = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupIdentifier"];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"responseEncryptionKey"];
    responseEncryptionKey = v5->_responseEncryptionKey;
    v5->_responseEncryptionKey = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"retrieve"];
    retrieve = v5->_retrieve;
    v5->_retrieve = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"labels"];
    labels = v5->_labels;
    v5->_labels = (NSDictionary *)v15;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)dictionaryValue
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  id v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_labels;
  uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = -[NSDictionary objectForKeyedSubscript:](self->_labels, "objectForKeyedSubscript:", v10, (void)v15);
        v12 = [v11 dictionaryValue];
        [v4 setObject:v12 forKeyedSubscript:v10];
      }
      uint64_t v7 = [(NSDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [v3 setObject:self->_businessIdentifier forKeyedSubscript:@"businessIdentifier"];
  [v3 setObject:self->_groupIdentifier forKeyedSubscript:@"groupIdentifier"];
  [v3 setObject:self->_responseEncryptionKey forKeyedSubscript:@"responseEncryptionKey"];
  [v3 setObject:self->_retrieve forKeyedSubscript:@"retrieve"];
  [v3 setObject:v4 forKeyedSubscript:@"labels"];
  uint64_t v13 = (void *)[v3 copy];

  return (NSDictionary *)v13;
}

- (NSString)businessIdentifier
{
  return self->_businessIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)responseEncryptionKey
{
  return self->_responseEncryptionKey;
}

- (NSArray)retrieve
{
  return self->_retrieve;
}

- (NSDictionary)labels
{
  return self->_labels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_retrieve, 0);
  objc_storeStrong((id *)&self->_responseEncryptionKey, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);

  objc_storeStrong((id *)&self->_businessIdentifier, 0);
}

@end