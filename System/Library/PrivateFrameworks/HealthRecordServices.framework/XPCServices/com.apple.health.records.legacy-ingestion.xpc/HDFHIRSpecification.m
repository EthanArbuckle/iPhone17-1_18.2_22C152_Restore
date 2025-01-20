@interface HDFHIRSpecification
+ (id)endpointSchemasWithConnectionInformation:(id)a3;
+ (id)specificationWithConnectionInformation:(id)a3 error:(id *)a4;
- (BOOL)shouldRefreshTokenForCredentialedTaskError:(id)a3;
- (BOOL)shouldRetryFailedResourceTaskWithError:(id)a3;
- (HDFHIRSpecification)init;
- (HDFHIRSpecification)initWithConnectionInformation:(id)a3;
- (HKClinicalAccountConnectionInformation)connection;
- (NSArray)resourceSchemas;
- (NSDictionary)authorizationSchemas;
- (id)authorizationSchemaForType:(int64_t)a3;
- (id)errorForAuthorizationRequest:(id)a3 response:(id)a4 data:(id)a5;
- (id)errorForResourceRequest:(id)a3 response:(id)a4 data:(id)a5;
- (void)_parseEndpointSchemas;
@end

@implementation HDFHIRSpecification

+ (id)specificationWithConnectionInformation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 gateway];
  id v8 = [v7 type];

  if (v8 == (id)1)
  {
    id v9 = [objc_alloc((Class)a1) initWithConnectionInformation:v6];
  }
  else
  {
    v10 = [v6 gateway];
    +[NSError hk_assignError:a4, 3, @"Attempting to instantiate FHIR specification for non-FHIR gateway: %@", v10 code format];

    id v9 = 0;
  }

  return v9;
}

- (HDFHIRSpecification)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDFHIRSpecification)initWithConnectionInformation:(id)a3
{
  id v5 = a3;
  id v6 = [v5 gateway];
  id v7 = [v6 type];

  if (v7 != (id)1)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HDFHIRSpecification.m", 51, @"Invalid parameter not satisfying: %@", @"connection.gateway.type == HKClinicalGatewayTypeFHIR" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)HDFHIRSpecification;
  id v8 = [(HDFHIRSpecification *)&v13 init];
  if (v8)
  {
    id v9 = (HKClinicalAccountConnectionInformation *)[v5 copy];
    connection = v8->_connection;
    v8->_connection = v9;

    [(HDFHIRSpecification *)v8 _parseEndpointSchemas];
  }

  return v8;
}

+ (id)endpointSchemasWithConnectionInformation:(id)a3
{
  id v3 = a3;
  id v28 = objc_alloc_init((Class)NSMutableDictionary);
  id v27 = objc_alloc_init((Class)NSMutableArray);
  v4 = [v3 authentication];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v26 = v3;
  id v5 = [v3 resourceSchemaDefinitions];
  id v6 = [v5 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v35 + 1) + 8 * (void)v9);
        id v34 = 0;
        v11 = +[HDFHIREndpointSchema schemaWithDefinition:v10 authenticationInformation:v4 error:&v34];
        id v12 = v34;
        if (v11)
        {
          [v27 addObject:v11];
        }
        else
        {
          _HKInitializeLogging();
          objc_super v13 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v41 = v12;
            _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Error instantiating resource schema: %@", buf, 0xCu);
          }
        }

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v7);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v14 = [v26 authSchemaDefinitions];
  id v15 = [v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v31;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v18);
        id v29 = 0;
        v20 = +[HDFHIREndpointSchema schemaWithDefinition:v19 authenticationInformation:v4 error:&v29];
        id v21 = v29;
        if (v20)
        {
          v22 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v20 authorizationEndpointType]);
          [v28 setObject:v20 forKeyedSubscript:v22];
        }
        else
        {
          _HKInitializeLogging();
          v23 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v41 = v21;
            _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "Error instantiating resource schema: %@", buf, 0xCu);
          }
        }

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v16);
  }

  v24 = objc_alloc_init(HDFHIREndpointSchemaParseResult);
  [(HDFHIREndpointSchemaParseResult *)v24 setAuthorizationSchemas:v28];
  [(HDFHIREndpointSchemaParseResult *)v24 setResourceSchemas:v27];

  return v24;
}

- (void)_parseEndpointSchemas
{
  id v3 = [(id)objc_opt_class() endpointSchemasWithConnectionInformation:self->_connection];
  id v11 = v3;
  if (v3)
  {
    v4 = [v3 authorizationSchemas];
    id v5 = (NSDictionary *)[v4 copy];
    authorizationSchemas = self->_authorizationSchemas;
    self->_authorizationSchemas = v5;

    id v7 = [v11 resourceSchemas];
    uint64_t v8 = (NSArray *)[v7 copy];
    resourceSchemas = self->_resourceSchemas;
    self->_resourceSchemas = v8;
  }
  else
  {
    uint64_t v10 = self->_authorizationSchemas;
    self->_authorizationSchemas = (NSDictionary *)&__NSDictionary0__struct;

    id v7 = self->_resourceSchemas;
    self->_resourceSchemas = (NSArray *)&__NSArray0__struct;
  }
}

- (NSArray)resourceSchemas
{
  return self->_resourceSchemas;
}

- (id)authorizationSchemaForType:(int64_t)a3
{
  authorizationSchemas = self->_authorizationSchemas;
  v4 = +[NSNumber numberWithInteger:a3];
  id v5 = [(NSDictionary *)authorizationSchemas objectForKeyedSubscript:v4];

  return v5;
}

- (BOOL)shouldRefreshTokenForCredentialedTaskError:(id)a3
{
  return objc_msgSend(a3, "hk_OAuth2_isBearerAuthenticationError");
}

- (BOOL)shouldRetryFailedResourceTaskWithError:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "hrs_hasAuthorizationFailure"))
  {
    if (objc_msgSend(v4, "hk_OAuth2_isOAuth2Error"))
    {
      LOBYTE(self) = [(HDFHIRSpecification *)self shouldRefreshTokenForCredentialedTaskError:v4];
    }
    else
    {
      id v5 = objc_msgSend(v4, "hrs_accumulatedAuthorizationFailures");
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100009FCC;
      v8[3] = &unk_1000146F0;
      v8[4] = self;
      id v6 = objc_msgSend(v5, "hk_filter:", v8);

      LOBYTE(self) = [v6 count] != 0;
    }
  }
  else
  {
    LODWORD(self) = objc_msgSend(v4, "hrs_hasResourceFetchErrorsIndicatingRateLimitation") ^ 1;
  }

  return (char)self;
}

- (id)errorForAuthorizationRequest:(id)a3 response:(id)a4 data:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[NSError hk_OAuth2_errorForRequest:v7 response:v8 data:a5];
  if (!v9)
  {
    id v9 = +[NSError hk_HTTPErrorRepresentingResponse:v8 request:v7];
  }

  return v9;
}

- (id)errorForResourceRequest:(id)a3 response:(id)a4 data:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[NSError hk_OAuth2_errorForRequest:v8 response:v9 data:a5];
  if (v10
    && [(HDFHIRSpecification *)self shouldRetryFailedResourceTaskWithError:v10])
  {
    id v11 = v10;
  }
  else
  {
    id v11 = +[NSError hk_HTTPErrorRepresentingResponse:v9 request:v8];
  }
  id v12 = v11;

  return v12;
}

- (HKClinicalAccountConnectionInformation)connection
{
  return self->_connection;
}

- (NSDictionary)authorizationSchemas
{
  return self->_authorizationSchemas;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_resourceSchemas, 0);

  objc_storeStrong((id *)&self->_authorizationSchemas, 0);
}

@end