@interface BCInternalAuthenticationResponse
- (BCError)error;
- (BCInternalAuthenticationResponse)initWithBusinessIdentifier:(id)a3 groupIdentifier:(id)a4 credentials:(id)a5 error:(id)a6;
- (BCInternalAuthenticationResponse)initWithDictionary:(id)a3;
- (NSArray)errors;
- (NSDictionary)dictionaryValue;
- (NSString)businessIdentifier;
- (NSString)credentials;
- (NSString)groupIdentifier;
- (NSString)status;
- (id)responseMessageFor:(id)a3 message:(id)a4;
@end

@implementation BCInternalAuthenticationResponse

- (BCInternalAuthenticationResponse)initWithDictionary:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)BCInternalAuthenticationResponse;
  v5 = [(BCInternalAuthenticationResponse *)&v45 init];
  if (v5)
  {
    v6 = LogCategory_Daemon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v4 description];
      *(_DWORD *)buf = 138412290;
      v48 = v7;
      _os_log_impl(&dword_228C26000, v6, OS_LOG_TYPE_DEFAULT, "BCInternalAuthenticationResponse: initWithDictionary %@", buf, 0xCu);
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

    v14 = [v4 objectForKeyedSubscript:@"credentials"];
    v15 = [MEMORY[0x263EFF9D0] null];
    if (v14 == v15)
    {
      v16 = 0;
    }
    else
    {
      v16 = [v4 objectForKeyedSubscript:@"credentials"];
    }

    v17 = [v4 objectForKeyedSubscript:@"errors"];
    v18 = [MEMORY[0x263EFF9D0] null];
    if (v17 == v18)
    {
      v19 = 0;
    }
    else
    {
      v19 = [v4 objectForKeyedSubscript:@"errors"];
    }

    if (v10)
    {
      if (v13)
      {
        if (v19)
        {
          v38 = v16;
          v39 = v13;
          v40 = v10;
          v20 = (NSArray *)objc_opt_new();
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v21 = v19;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v46 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v42;
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v42 != v24) {
                  objc_enumerationMutation(v21);
                }
                v26 = [[BCError alloc] initWithDictionary:*(void *)(*((void *)&v41 + 1) + 8 * i)];
                if (v26) {
                  [(NSArray *)v20 addObject:v26];
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v41 objects:v46 count:16];
            }
            while (v23);
          }

          errors = v5->_errors;
          v5->_errors = v20;

          v13 = v39;
          v10 = v40;
          v16 = v38;
        }
        businessIdentifier = v5->_businessIdentifier;
        v5->_businessIdentifier = v10;
        v29 = v10;

        groupIdentifier = v5->_groupIdentifier;
        v5->_groupIdentifier = v13;
        v31 = v13;

        v32 = @"authenticated";
        if (!v16) {
          v32 = @"failed";
        }
        v5->_status = &v32->isa;
        credentials = v5->_credentials;
        v5->_credentials = v16;

        goto LABEL_32;
      }
      v35 = LogCategory_Daemon();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
LABEL_36:

        v34 = 0;
        goto LABEL_37;
      }
      *(_WORD *)buf = 0;
      v36 = "Unable to create  BCInternalAuthenticationResponse: missing 'groupIdentifier' in payload";
    }
    else
    {
      v35 = LogCategory_Daemon();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      v36 = "Unable to create BCInternalAuthenticationResponse: missing 'business identifier' in payload";
    }
    _os_log_error_impl(&dword_228C26000, v35, OS_LOG_TYPE_ERROR, v36, buf, 2u);
    goto LABEL_36;
  }
LABEL_32:
  v34 = v5;
LABEL_37:

  return v34;
}

- (BCInternalAuthenticationResponse)initWithBusinessIdentifier:(id)a3 groupIdentifier:(id)a4 credentials:(id)a5 error:(id)a6
{
  v27[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)BCInternalAuthenticationResponse;
  v15 = [(BCInternalAuthenticationResponse *)&v26 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_businessIdentifier, a3);
    objc_storeStrong((id *)&v16->_groupIdentifier, a4);
    objc_storeStrong((id *)&v16->_credentials, a5);
    v17 = @"authenticated";
    if (!v13) {
      v17 = @"failed";
    }
    v16->_status = &v17->isa;
    if (v14)
    {
      v18 = [BCError alloc];
      v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "code"));
      v20 = [v14 domain];
      id v21 = [v14 localizedDescription];
      uint64_t v22 = [(BCError *)v18 initWithCode:v19 domain:v20 message:v21];

      v27[0] = v22;
      uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
      errors = v16->_errors;
      v16->_errors = (NSArray *)v23;
    }
  }

  return v16;
}

- (id)responseMessageFor:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v44 = v6;
  v8 = [v6 authenticationRequest];
  v9 = [v8 labels];
  v10 = [v9 objectForKeyedSubscript:@"success"];

  id v11 = [v7 replyMessage];
  id v12 = [v7 receivedMessage];
  id v13 = [v11 imageIdentifier];
  if (v13) {
    id v14 = v11;
  }
  else {
    id v14 = v12;
  }
  long long v43 = [v14 imageIdentifier];

  v15 = [v11 imageDescription];
  if (v15) {
    v16 = v11;
  }
  else {
    v16 = v12;
  }
  long long v41 = [v16 imageDescription];

  long long v42 = v10;
  v17 = [v10 title];
  if (!v17)
  {
    v39 = self;
    v18 = objc_opt_new();
    v19 = [v44 lastName];
    [v18 setFamilyName:v19];

    v20 = [v44 firstName];
    [v18 setGivenName:v20];

    id v21 = objc_opt_new();
    [v21 setStyle:0];
    uint64_t v22 = NSString;
    uint64_t v23 = +[BCShared classBundle]();
    uint64_t v24 = [v23 localizedStringForKey:@"SIGNED_IN" value:&stru_26DD2B2A8 table:0];
    v25 = [v21 stringFromPersonNameComponents:v18];
    v17 = objc_msgSend(v22, "stringWithFormat:", v24, v25);

    self = v39;
  }
  objc_super v26 = [(BCInternalAuthenticationResponse *)self status];
  int v27 = [v26 isEqualToString:@"failed"];

  if (v27)
  {
    v40 = self;
    v28 = [v44 authenticationRequest];
    v29 = [v28 labels];
    v30 = [v29 objectForKeyedSubscript:@"failure"];

    v31 = [v30 title];
    if (v31)
    {
      uint64_t v32 = [v30 title];
    }
    else
    {
      v33 = +[BCShared classBundle]();
      uint64_t v32 = [v33 localizedStringForKey:@"ERROR_INTERNAL_AUTHENTICATION_FAILED" value:&stru_26DD2B2A8 table:0];

      v17 = v33;
    }

    v17 = (void *)v32;
    self = v40;
  }
  v34 = [[BCMessageInfo alloc] initWithTitle:v17 subtitle:0 style:@"icon" alternateTitle:0 imageIdentifier:v43 imageDescription:v41];

  v35 = [BCMessage alloc];
  v36 = [v7 rootKey];
  id v37 = [(BCMessage *)v35 initFromOriginalMessage:v7 rootKey:v36 rootObject:self receivedMessage:v12 replyMessage:v34];

  return v37;
}

- (NSDictionary)dictionaryValue
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  [v3 setObject:self->_businessIdentifier forKeyedSubscript:@"businessIdentifier"];
  [v3 setObject:self->_groupIdentifier forKeyedSubscript:@"groupIdentifier"];
  [v3 setObject:self->_status forKeyedSubscript:@"status"];
  [v3 setObject:self->_credentials forKeyedSubscript:@"credentials"];
  id v4 = [(BCInternalAuthenticationResponse *)self errors];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [(BCInternalAuthenticationResponse *)self errors];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
          id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryValue];
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"errors"];
  }

  return (NSDictionary *)v3;
}

- (BCError)error
{
  v2 = [(BCInternalAuthenticationResponse *)self errors];
  v3 = [v2 firstObject];

  return (BCError *)v3;
}

- (NSString)status
{
  return self->_status;
}

- (NSString)businessIdentifier
{
  return self->_businessIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)credentials
{
  return self->_credentials;
}

- (NSArray)errors
{
  return self->_errors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);

  objc_storeStrong((id *)&self->_businessIdentifier, 0);
}

@end