@interface HDFHIREndpointSchema
+ (BOOL)_queryItemsShouldIncludeParameterItem:(id)a3 queryMode:(int64_t)a4;
+ (BOOL)_validateAuthValue:(id)a3 error:(id *)a4;
+ (BOOL)_validateMethodValue:(id)a3 error:(id *)a4;
+ (BOOL)_validateMinCompatibleAPIVersion:(id)a3 error:(id *)a4;
+ (BOOL)_validateNameValue:(id)a3 error:(id *)a4;
+ (BOOL)_validateParameterArray:(id)a3 error:(id *)a4;
+ (BOOL)_validateParameterItem:(id)a3 error:(id *)a4;
+ (BOOL)_validateQueryMode:(id)a3 error:(id *)a4;
+ (BOOL)_validateRootKey:(id)a3 value:(id)a4 error:(id *)a5;
+ (BOOL)_validateURLValue:(id)a3 error:(id *)a4;
+ (BOOL)validateDefinition:(id)a3 error:(id *)a4;
+ (BOOL)validateName:(id)a3 error:(id *)a4;
+ (id)_percentEncodedQueryStringFromQueryItems:(id)a3 additionalEncodableCharacters:(id)a4;
+ (id)_queryItemsFromParametersArray:(id)a3 bindings:(id)a4 queryMode:(int64_t)a5 error:(id *)a6;
+ (id)_requiredRootKeys;
+ (id)_valueForParameterItem:(id)a3 bindings:(id)a4 error:(id *)a5;
+ (id)schemaWithDefinition:(id)a3 authenticationInformation:(id)a4 error:(id *)a5;
- (BOOL)_addHTTPBodyToRequest:(id)a3 bindings:(id)a4 queryMode:(int64_t)a5 error:(id *)a6;
- (BOOL)_applyAuthToRequest:(id)a3 credential:(id)a4 error:(id *)a5;
- (BOOL)_applyHeadersToRequest:(id)a3 bindings:(id)a4 queryMode:(int64_t)a5 error:(id *)a6;
- (BOOL)isEnabled;
- (HDFHIREndpointSchema)init;
- (HDFHIREndpointSchema)initWithDefinition:(id)a3 authenticationInformation:(id)a4;
- (HKFHIRServerAuthenticationInformation)authenticationInformation;
- (NSArray)bodyParameters;
- (NSArray)headerParameters;
- (NSArray)queryParameters;
- (NSDictionary)definition;
- (NSString)method;
- (NSString)name;
- (NSURL)baseURL;
- (id)_URLWithBindings:(id)a3 queryMode:(int64_t)a4 error:(id *)a5;
- (id)_bindingsWithCredential:(id)a3;
- (id)_createRequestWithCredential:(id)a3 bindings:(id)a4 orFullURL:(id)a5 queryMode:(int64_t)a6 error:(id *)a7;
- (id)createRequestWithBindings:(id)a3 queryMode:(int64_t)a4 error:(id *)a5;
- (id)createRequestWithCredential:(id)a3 bindings:(id)a4 queryMode:(int64_t)a5 error:(id *)a6;
- (id)createRequestWithCredential:(id)a3 requestURL:(id)a4 error:(id *)a5;
- (id)currentScopeStringWithError:(id *)a3;
- (int64_t)authType;
- (int64_t)minCompatibleAPIVersion;
@end

@implementation HDFHIREndpointSchema

- (HDFHIREndpointSchema)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDFHIREndpointSchema)initWithDefinition:(id)a3 authenticationInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDFHIREndpointSchema;
  v8 = [(HDFHIREndpointSchema *)&v14 init];
  if (v8)
  {
    v9 = (NSDictionary *)[v6 copy];
    definition = v8->_definition;
    v8->_definition = v9;

    v11 = (HKFHIRServerAuthenticationInformation *)[v7 copy];
    authenticationInformation = v8->_authenticationInformation;
    v8->_authenticationInformation = v11;
  }
  return v8;
}

+ (id)schemaWithDefinition:(id)a3 authenticationInformation:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if ((id)objc_opt_class() == a1)
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"HDFHIREndpointSchema.m", 95, @"Attempting to instantiate abstract class: %@", a1 object file lineNumber description];
  }
  if ([a1 validateDefinition:v9 error:a5]) {
    id v12 = [objc_alloc((Class)a1) initWithDefinition:v9 authenticationInformation:v10];
  }
  else {
    id v12 = 0;
  }

  return v12;
}

- (id)createRequestWithBindings:(id)a3 queryMode:(int64_t)a4 error:(id *)a5
{
  return [(HDFHIREndpointSchema *)self _createRequestWithCredential:0 bindings:a3 orFullURL:0 queryMode:a4 error:a5];
}

- (id)createRequestWithCredential:(id)a3 requestURL:(id)a4 error:(id *)a5
{
  return [(HDFHIREndpointSchema *)self _createRequestWithCredential:a3 bindings:0 orFullURL:a4 queryMode:0 error:a5];
}

- (id)createRequestWithCredential:(id)a3 bindings:(id)a4 queryMode:(int64_t)a5 error:(id *)a6
{
  return [(HDFHIREndpointSchema *)self _createRequestWithCredential:a3 bindings:a4 orFullURL:0 queryMode:a5 error:a6];
}

- (id)_createRequestWithCredential:(id)a3 bindings:(id)a4 orFullURL:(id)a5 queryMode:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (![(HDFHIREndpointSchema *)self isEnabled])
  {
    id v18 = [(HDFHIREndpointSchema *)self name];
    +[NSError hk_assignError:a7, 3, @"Endpoint %@ not enabled", v18 code format];
    id v19 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v15 = &__NSDictionary0__struct;
  if (v13) {
    v15 = v13;
  }
  id v16 = v15;

  v17 = [(HDFHIREndpointSchema *)self _bindingsWithCredential:v12];
  objc_msgSend(v16, "hk_dictionaryByAddingEntriesFromDictionary:", v17);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    id v18 = v14;
    goto LABEL_8;
  }
  id v18 = [(HDFHIREndpointSchema *)self _URLWithBindings:v13 queryMode:a6 error:a7];
  if (v18)
  {
LABEL_8:
    id v20 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v18];
    [v20 setAttribution:1];
    v21 = [(HDFHIREndpointSchema *)self method];
    [v20 setHTTPMethod:v21];

    if ([(HDFHIREndpointSchema *)self _applyAuthToRequest:v20 credential:v12 error:a7]&& [(HDFHIREndpointSchema *)self _applyHeadersToRequest:v20 bindings:v13 queryMode:a6 error:a7]&& [(HDFHIREndpointSchema *)self _addHTTPBodyToRequest:v20 bindings:v13 queryMode:a6 error:a7])
    {
      id v19 = v20;
    }
    else
    {
      id v19 = 0;
    }

    goto LABEL_14;
  }
  id v19 = 0;
LABEL_15:

  return v19;
}

- (BOOL)_applyAuthToRequest:(id)a3 credential:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(HDFHIREndpointSchema *)self authType];
  switch(v10)
  {
    case 0:
      v11 = [(HDFHIREndpointSchema *)self name];
      v25 = v11;
      CFStringRef v22 = @"Encountered unexpected auth type for endpoint %@";
      goto LABEL_15;
    case 2:
      if (v9)
      {
        v11 = [v9 accessToken];
        if (v11)
        {
          id v23 = [objc_alloc((Class)NSString) initWithFormat:@"Bearer %@", v11];
          [v8 setValue:v23 forHTTPHeaderField:@"Authorization"];

          BOOL v21 = 1;
LABEL_17:

          goto LABEL_18;
        }
        +[NSError hk_assignError:a5, 3, @"Credential %@ does not have an access token", v9 code format];
LABEL_16:
        BOOL v21 = 0;
        goto LABEL_17;
      }
      v11 = [(HDFHIREndpointSchema *)self name];
      v25 = v11;
      CFStringRef v22 = @"Endpoint %@ requires a credential for a \"Bearer\" auth request";
LABEL_15:
      +[NSError hk_assignError:code:format:](NSError, "hk_assignError:code:format:", a5, 3, v22, v25);
      goto LABEL_16;
    case 1:
      v11 = self->_authenticationInformation;
      uint64_t v12 = [(HKFHIRServerAuthenticationInformation *)v11 clientID];
      if (v12
        && (id v13 = (void *)v12,
            [(HKFHIRServerAuthenticationInformation *)v11 clientSecret],
            id v14 = objc_claimAutoreleasedReturnValue(),
            v14,
            v13,
            v14))
      {
        v15 = [(HKFHIRServerAuthenticationInformation *)v11 clientID];
        id v16 = [(HKFHIRServerAuthenticationInformation *)v11 clientSecret];
        v17 = +[NSString stringWithFormat:@"%@:%@", v15, v16];

        id v18 = [v17 dataUsingEncoding:4];
        id v19 = [v18 base64EncodedStringWithOptions:0];
        id v20 = +[NSString stringWithFormat:@"Basic %@", v19];
        [v8 setValue:v20 forHTTPHeaderField:@"Authorization"];

        BOOL v21 = 1;
      }
      else
      {
        v17 = [(HDFHIREndpointSchema *)self name];
        +[NSError hk_assignError:a5, 3, @"Endpoint %@ requires clientID and clientSecret for a \"Basic\" auth request", v17 code format];
        BOOL v21 = 0;
      }

      goto LABEL_17;
  }
  BOOL v21 = 1;
LABEL_18:

  return v21;
}

- (BOOL)_applyHeadersToRequest:(id)a3 bindings:(id)a4 queryMode:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(HDFHIREndpointSchema *)self headerParameters];
  if (v12)
  {
    id v13 = [(id)objc_opt_class() _queryItemsFromParametersArray:v12 bindings:v11 queryMode:a5 error:a6];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v19 = [v18 value];
          id v20 = [v18 name];
          [v10 addValue:v19 forHTTPHeaderField:v20];
        }
        id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }
  }
  return 1;
}

- (BOOL)_addHTTPBodyToRequest:(id)a3 bindings:(id)a4 queryMode:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(HDFHIREndpointSchema *)self bodyParameters];
  if (v12)
  {
    id v13 = [(id)objc_opt_class() _queryItemsFromParametersArray:v12 bindings:v11 queryMode:a5 error:a6];
    if (v13)
    {
      id v14 = [(id)objc_opt_class() _percentEncodedQueryStringFromQueryItems:v13 additionalEncodableCharacters:@"+/"];
      id v15 = [v14 dataUsingEncoding:4];
      char v16 = v15 != 0;
      if (v15) {
        [v10 setHTTPBody:v15];
      }
      else {
        +[NSError hk_assignError:a6, 100, @"Unable to serialize HTTP body string: %@", v14 code format];
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 1;
  }

  return v16;
}

- (id)_bindingsWithCredential:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  if (v3)
  {
    v5 = [v3 patientID];
    [v4 setObject:v5 forKeyedSubscript:@"patient"];
  }

  return v4;
}

- (id)_URLWithBindings:(id)a3 queryMode:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(HDFHIREndpointSchema *)self baseURL];
  if (v9)
  {
    id v10 = [(HDFHIREndpointSchema *)self queryParameters];
    if (v10)
    {
      id v11 = [(id)objc_opt_class() _queryItemsFromParametersArray:v10 bindings:v8 queryMode:a4 error:a5];
      if (v11)
      {
        uint64_t v12 = [(id)objc_opt_class() _percentEncodedQueryStringFromQueryItems:v11 additionalEncodableCharacters:@"+/"];
        id v13 = objc_alloc((Class)NSString);
        id v14 = [v9 absoluteString];
        id v15 = [v13 initWithFormat:@"%@?%@", v14, v12];

        id v16 = [objc_alloc((Class)NSURL) initWithString:v15];
        id v17 = v16;
        if (v16) {
          id v18 = v16;
        }
        else {
          +[NSError hk_assignError:a5, 100, @"Unable to create URL from URL string: %@", v15 code format];
        }
      }
      else
      {
        id v17 = 0;
      }
    }
    else
    {
      id v17 = v9;
    }
  }
  else
  {
    id v10 = [(HDFHIREndpointSchema *)self name];
    +[NSError hk_assignError:a5, 100, @"Unable to determine base URL for endpoint %@", v10 code format];
    id v17 = 0;
  }

  return v17;
}

+ (id)_requiredRootKeys
{
  return &off_11D6C0;
}

+ (BOOL)validateDefinition:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = HKSafeObject();
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 allKeys];
    id v10 = [a1 _requiredRootKeys];
    if (objc_msgSend(v9, "hk_containsObjectsInArray:", v10))
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v11 = v9;
      uint64_t v12 = (char *)[v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v24;
        BOOL v21 = v9;
        id v22 = v6;
        id v20 = v10;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v11);
            }
            objc_opt_class();
            id v16 = HKSafeObject();
            if (!v16) {
              goto LABEL_17;
            }
            id v17 = [v8 objectForKeyedSubscript:v16];
            unsigned int v18 = [a1 _validateRootKey:v16 value:v17 error:a4];

            if (!v18)
            {
              LOBYTE(v16) = 0;
LABEL_17:
              id v9 = v21;
              id v6 = v22;
              id v10 = v20;
              goto LABEL_18;
            }
          }
          id v13 = (char *)[v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
          LOBYTE(v16) = 1;
          id v9 = v21;
          id v6 = v22;
          id v10 = v20;
          if (v13) {
            continue;
          }
          break;
        }
      }
      else
      {
        LOBYTE(v16) = 1;
      }
LABEL_18:
    }
    else
    {
      +[NSError hk_assignError:a4, 3, @"Endpoint schema definition missing required key in %@. Got: %@", v10, v9 code format];
      LOBYTE(v16) = 0;
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return (char)v16;
}

+ (BOOL)_validateRootKey:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"auth"])
  {
    unsigned __int8 v10 = [a1 _validateAuthValue:v9 error:a5];
    goto LABEL_8;
  }
  if (![v8 isEqualToString:@"enabled"])
  {
    if (![v8 isEqualToString:@"form"]
      && ![v8 isEqualToString:@"headers"])
    {
      if ([v8 isEqualToString:@"method"])
      {
        unsigned __int8 v10 = [a1 _validateMethodValue:v9 error:a5];
        goto LABEL_8;
      }
      if ([v8 isEqualToString:@"name"])
      {
        unsigned __int8 v10 = [a1 _validateNameValue:v9 error:a5];
        goto LABEL_8;
      }
      if (![v8 isEqualToString:@"query"])
      {
        if ([v8 isEqualToString:@"url"])
        {
          unsigned __int8 v10 = [a1 _validateURLValue:v9 error:a5];
        }
        else
        {
          if (![v8 isEqualToString:@"minCompatibleApiVersion"])
          {
            char v12 = 1;
            goto LABEL_9;
          }
          unsigned __int8 v10 = [a1 _validateMinCompatibleAPIVersion:v9 error:a5];
        }
        goto LABEL_8;
      }
    }
    unsigned __int8 v10 = [a1 _validateParameterArray:v9 error:a5];
LABEL_8:
    char v12 = v10;
    goto LABEL_9;
  }
  objc_opt_class();
  id v11 = HKSafeObject();
  char v12 = v11 != 0;

LABEL_9:
  return v12;
}

+ (BOOL)_validateMinCompatibleAPIVersion:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  id v6 = HKSafeObject();

  if (!v6) {
    goto LABEL_5;
  }
  id v7 = [v6 integerValue];
  if ((uint64_t)v7 <= 0)
  {
    +[NSError hk_assignError:a4, 3, @"Invalid minCompatibleApiVersion: %ld", v7 code format];
LABEL_5:
    BOOL v8 = 0;
    goto LABEL_6;
  }
  BOOL v8 = 1;
LABEL_6:

  return v8;
}

+ (BOOL)_validateAuthValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  id v6 = HKSafeObject();

  if (!v6) {
    goto LABEL_5;
  }
  if (!sub_9A548((uint64_t)v6))
  {
    +[NSError hk_assignError:a4, 3, @"Invalid auth value: %@", v6 code format];
LABEL_5:
    BOOL v7 = 0;
    goto LABEL_6;
  }
  BOOL v7 = 1;
LABEL_6:

  return v7;
}

+ (BOOL)_validateMethodValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  id v6 = HKSafeObject();

  if (v6)
  {
    v10[0] = @"GET";
    v10[1] = @"POST";
    BOOL v7 = +[NSArray arrayWithObjects:v10 count:2];
    unsigned __int8 v8 = [v7 containsObject:v6];
    if ((v8 & 1) == 0) {
      +[NSError hk_assignError:a4, 3, @"Invalid method value: %@", v6 code format];
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

+ (BOOL)_validateNameValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  BOOL v7 = HKSafeObject();

  if (v7) {
    unsigned __int8 v8 = [a1 validateName:v7 error:a4];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

+ (BOOL)_validateParameterArray:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  BOOL v7 = HKSafeObject();
  unsigned __int8 v8 = v7;
  if (v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          if (!objc_msgSend(a1, "_validateParameterItem:error:", *(void *)(*((void *)&v16 + 1) + 8 * i), a4, (void)v16))
          {
            BOOL v14 = 0;
            goto LABEL_12;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 1;
LABEL_12:
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (BOOL)_validateParameterItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  BOOL v7 = HKSafeObject();

  if (v7)
  {
    unsigned __int8 v8 = [v7 objectForKeyedSubscript:@"param"];
    objc_opt_class();
    id v9 = HKSafeObject();

    if (v9)
    {
      uint64_t v10 = [v7 objectForKeyedSubscript:@"literal"];
      if (v10)
      {
        id v11 = (void *)v10;
        objc_opt_class();
        uint64_t v12 = HKSafeObject();
      }
      else
      {
        uint64_t v12 = 0;
      }
      uint64_t v14 = [v7 objectForKeyedSubscript:@"variable"];
      if (v14)
      {
        id v15 = (void *)v14;
        objc_opt_class();
        uint64_t v16 = HKSafeObject();
      }
      else
      {
        uint64_t v16 = 0;
      }
      if (v16 | v12 && (!v16 || !v12))
      {
        long long v18 = [v7 objectForKeyedSubscript:@"mode"];
        BOOL v13 = !v18 || [a1 _validateQueryMode:v18 error:a4];

        goto LABEL_15;
      }
      +[NSError hk_assignError:a4, 3, @"Parameter array item must have exactly one of 'literal', 'variable': %@", v7 code format];
    }
    BOOL v13 = 0;
LABEL_15:

    goto LABEL_16;
  }
  BOOL v13 = 0;
LABEL_16:

  return v13;
}

+ (BOOL)_validateQueryMode:(id)a3 error:(id *)a4
{
  id v4 = a3;
  objc_opt_class();
  id v5 = HKSafeObject();
  id v6 = v5;
  if (v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v5;
    unsigned __int8 v8 = (char *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_opt_class();
          uint64_t v12 = HKSafeObject();

          if (!v12)
          {
            BOOL v13 = 0;
            goto LABEL_12;
          }
        }
        id v9 = (char *)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 1;
LABEL_12:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)_validateURLValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  id v6 = HKSafeObject();

  if (v6)
  {
    id v7 = [objc_alloc((Class)NSURL) initWithString:v6];
    BOOL v8 = v7 != 0;
    if (!v7) {
      +[NSError hk_assignError:a4, 3, @"Invalid URL specified: %@", v6 code format];
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)_percentEncodedQueryStringFromQueryItems:(id)a3 additionalEncodableCharacters:(id)a4
{
  id v5 = &stru_1152E8;
  if (a4) {
    id v5 = (__CFString *)a4;
  }
  id v6 = v5;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSURLComponents);
  [v8 setQueryItems:v7];

  id v9 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  id v10 = [v9 mutableCopy];

  [v10 removeCharactersInString:v6];
  id v11 = [v8 query];
  uint64_t v12 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v10];

  return v12;
}

+ (id)_queryItemsFromParametersArray:(id)a3 bindings:(id)a4 queryMode:(int64_t)a5 error:(id *)a6
{
  long long v23 = a6;
  id v9 = a3;
  id v24 = a4;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v26;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (objc_msgSend(a1, "_queryItemsShouldIncludeParameterItem:queryMode:", v16, a5, v23))
        {
          long long v17 = [v16 objectForKeyedSubscript:@"param"];
          uint64_t v18 = [a1 _valueForParameterItem:v16 bindings:v24 error:v23];
          if (!v18)
          {

            id v21 = 0;
            goto LABEL_13;
          }
          long long v19 = (void *)v18;
          id v20 = [objc_alloc((Class)NSURLQueryItem) initWithName:v17 value:v18];
          [v10 addObject:v20];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  id v21 = v10;
LABEL_13:

  return v21;
}

+ (id)_valueForParameterItem:(id)a3 bindings:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 objectForKeyedSubscript:@"literal"];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v12 = [v7 objectForKeyedSubscript:@"variable"];
    id v11 = [v8 objectForKeyedSubscript:v12];
    if (!v11) {
      +[NSError hk_assignError:a5, 3, @"Unbound variable: %@", v12 code format];
    }
  }

  return v11;
}

+ (BOOL)_queryItemsShouldIncludeParameterItem:(id)a3 queryMode:(int64_t)a4
{
  id v5 = [a3 objectForKeyedSubscript:@"mode"];
  id v6 = v5;
  if (!v5) {
    goto LABEL_9;
  }
  CFStringRef v7 = @"update";
  if (a4 != 2) {
    CFStringRef v7 = 0;
  }
  if (a4 == 1 ? @"full" : (__CFString *)v7) {
    unsigned __int8 v9 = objc_msgSend(v5, "containsObject:");
  }
  else {
LABEL_9:
  }
    unsigned __int8 v9 = 1;

  return v9;
}

- (int64_t)authType
{
  v2 = [(HDFHIREndpointSchema *)self definition];
  id v3 = [v2 objectForKey:@"auth"];

  id v4 = sub_9A548((uint64_t)v3);
  return (int64_t)v4;
}

- (NSURL)baseURL
{
  v2 = [(HDFHIREndpointSchema *)self definition];
  id v3 = [v2 objectForKey:@"url"];

  id v4 = +[NSURL URLWithString:v3];

  return (NSURL *)v4;
}

- (NSArray)bodyParameters
{
  v2 = [(HDFHIREndpointSchema *)self definition];
  id v3 = [v2 objectForKey:@"form"];

  return (NSArray *)v3;
}

- (BOOL)isEnabled
{
  v2 = [(HDFHIREndpointSchema *)self definition];
  id v3 = [v2 objectForKey:@"enabled"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (int64_t)minCompatibleAPIVersion
{
  v2 = [(HDFHIREndpointSchema *)self definition];
  id v3 = [v2 objectForKey:@"minCompatibleApiVersion"];
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (NSArray)headerParameters
{
  v2 = [(HDFHIREndpointSchema *)self definition];
  id v3 = [v2 objectForKey:@"headers"];

  return (NSArray *)v3;
}

- (NSString)method
{
  v2 = [(HDFHIREndpointSchema *)self definition];
  id v3 = [v2 objectForKey:@"method"];

  return (NSString *)v3;
}

- (NSString)name
{
  v2 = [(HDFHIREndpointSchema *)self definition];
  id v3 = [v2 objectForKey:@"name"];

  return (NSString *)v3;
}

- (NSArray)queryParameters
{
  v2 = [(HDFHIREndpointSchema *)self definition];
  id v3 = [v2 objectForKey:@"query"];

  return (NSArray *)v3;
}

- (id)currentScopeStringWithError:(id *)a3
{
  [(HDFHIREndpointSchema *)self queryParameters];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned __int8 v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [v9 objectForKeyedSubscript:@"param"];
        objc_opt_class();
        id v11 = HKSafeObject();

        if ([v11 isEqualToString:@"scope"])
        {
          id v13 = [v9 objectForKeyedSubscript:@"literal"];
          id v12 = v13;
          if (v13) {
            id v14 = v13;
          }
          else {
            +[NSError hk_assignError:a3, 100, @"Scope parameter item did not have a literal key-value pair %@", v9 code format];
          }

          goto LABEL_14;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  +[NSError hk_assignError:a3 code:118 format:@"Unable to find scope query parameter"];
  id v12 = 0;
LABEL_14:

  return v12;
}

- (NSDictionary)definition
{
  return self->_definition;
}

- (HKFHIRServerAuthenticationInformation)authenticationInformation
{
  return self->_authenticationInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationInformation, 0);

  objc_storeStrong((id *)&self->_definition, 0);
}

+ (BOOL)validateName:(id)a3 error:(id *)a4
{
  return 0;
}

@end