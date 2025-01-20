@interface HDClinicalGateway
+ (BOOL)validateContent:(id)a3 error:(id *)a4;
+ (id)schemaName;
+ (int64_t)_pkceAlgorithmForRawType:(id)a3;
+ (int64_t)_statusForRawStatus:(id)a3;
+ (int64_t)_typeForRawType:(id)a3;
- (HDClinicalGateway)initWithContent:(id)a3;
- (HDClinicalGateway)initWithRawContent:(id)a3;
- (HDClinicalGateway)initWithoutValidatingContent:(id)a3;
- (HDConcreteSyncIdentity)syncIdentity;
- (HKClinicalBrand)brand;
- (HKClinicalGateway)hkGateway;
- (HKFHIRVersion)FHIRVersion;
- (NSArray)authSchemaDefinitions;
- (NSArray)featureDefinitions;
- (NSArray)gatewayVersions;
- (NSArray)resourceSchemaDefinitions;
- (NSString)batchID;
- (NSString)country;
- (NSString)displayableDescription;
- (NSString)externalID;
- (NSString)phoneNumber;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)baseURL;
- (NSURL)informationURL;
- (NSURL)passwordResetURL;
- (NSURL)patientPortalURL;
- (NSURL)signupURL;
- (id)_URLForKey:(id)a3;
- (id)authScopeWithError:(id *)a3;
- (id)authenticationInformation;
- (id)authorizeSchemaWithError:(id *)a3;
- (id)clientID;
- (id)clientSecret;
- (id)connectionInformationWithAccountIdentifier:(id)a3 credential:(id)a4 error:(id *)a5;
- (id)description;
- (int64_t)PKCEAlgorithm;
- (int64_t)lastReportedStatus;
- (int64_t)minCompatibleAPIVersion;
- (int64_t)type;
- (void)setSyncIdentity:(id)a3;
@end

@implementation HDClinicalGateway

- (HKClinicalGateway)hkGateway
{
  id v2 = [objc_alloc((Class)HKClinicalGateway) initWithDaemonClinicalGateway:self];

  return (HKClinicalGateway *)v2;
}

- (HDClinicalGateway)initWithContent:(id)a3
{
  v4 = sub_7B914(a3);
  v7.receiver = self;
  v7.super_class = (Class)HDClinicalGateway;
  v5 = [(HDClinicalProviderServiceModel *)&v7 initWithContent:v4];

  return v5;
}

- (HDClinicalGateway)initWithoutValidatingContent:(id)a3
{
  v4 = sub_7B914(a3);
  v7.receiver = self;
  v7.super_class = (Class)HDClinicalGateway;
  v5 = [(HDClinicalProviderServiceModel *)&v7 initWithoutValidatingContent:v4];

  return v5;
}

- (HDClinicalGateway)initWithRawContent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HDClinicalGateway;
  return [(HDClinicalProviderServiceModel *)&v4 initWithoutValidatingContent:a3];
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(HDClinicalGateway *)self externalID];
  v6 = [(HDClinicalGateway *)self title];
  id v7 = objc_msgSend(v3, "initWithFormat:", @"<%@:%p externalID: %@; name: %@; revision: %lld; status: %zd;>",
         v4,
         self,
         v5,
         v6,
         [(HDClinicalProviderServiceModel *)self revision],
         [(HDClinicalGateway *)self lastReportedStatus]);

  return v7;
}

- (id)authorizeSchemaWithError:(id *)a3
{
  v5 = [(HDClinicalGateway *)self authenticationInformation];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = [(HDClinicalGateway *)self authSchemaDefinitions];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = +[HDFHIREndpointSchema schemaWithDefinition:*(void *)(*((void *)&v14 + 1) + 8 * i) authenticationInformation:v5 error:a3];
        v12 = v11;
        if (v11 && [v11 authorizationEndpointType] == (char *)&dword_0 + 2)
        {

          goto LABEL_12;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  +[NSError hk_assignError:a3 code:100 format:@"No authorization schema found"];
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)authenticationInformation
{
  id v3 = objc_alloc((Class)HKFHIRServerAuthenticationInformation);
  uint64_t v4 = [(HDClinicalGateway *)self clientID];
  v5 = [(HDClinicalGateway *)self clientSecret];
  id v6 = objc_msgSend(v3, "initWithClientID:clientSecret:PKCEAlgorithm:", v4, v5, -[HDClinicalGateway PKCEAlgorithm](self, "PKCEAlgorithm"));

  return v6;
}

- (id)connectionInformationWithAccountIdentifier:(id)a3 credential:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [objc_alloc((Class)HKClinicalGateway) initWithDaemonClinicalGateway:self];
  if (v9)
  {
    v11 = [v9 credentialWithPopulatedAccessTokenWithError:a5];
    if (!v11)
    {
      id v12 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    v11 = 0;
  }
  id v13 = objc_alloc((Class)HKClinicalAccountConnectionInformation);
  long long v14 = [(HDClinicalGateway *)self authenticationInformation];
  long long v15 = [(HDClinicalGateway *)self authSchemaDefinitions];
  long long v16 = [(HDClinicalGateway *)self resourceSchemaDefinitions];
  id v12 = [v13 initWithAccountIdentifier:v8 gateway:v10 authorization:v11 authentication:v14 authSchemaDefinitions:v15 resourceSchemaDefinitions:v16];

LABEL_6:

  return v12;
}

+ (id)schemaName
{
  return @"GatewaySchema";
}

+ (BOOL)validateContent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___HDClinicalGateway;
  if (objc_msgSendSuper2(&v11, "validateContent:error:", v6, a4))
  {
    id v7 = v6;
    if (v7)
    {
      objc_opt_class();
      id v8 = HKSafeObject();
      char v9 = v8 != 0;
    }
    else
    {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)authScopeWithError:(id *)a3
{
  uint64_t v4 = -[HDClinicalGateway authorizeSchemaWithError:](self, "authorizeSchemaWithError:");
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 currentScopeStringWithError:a3];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      _HKInitializeLogging();
      id v10 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B234C(v10);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    char v9 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B22B4(v9);
    }
    id v7 = 0;
  }

  return v7;
}

- (NSString)externalID
{
  id v2 = [(HDClinicalProviderServiceModel *)self content];
  id v3 = [v2 objectForKeyedSubscript:@"gatewayID"];

  return (NSString *)v3;
}

- (NSString)batchID
{
  id v2 = [(HDClinicalProviderServiceModel *)self content];
  id v3 = [v2 objectForKeyedSubscript:@"gatewayBatchID"];

  return (NSString *)v3;
}

- (NSString)title
{
  id v2 = [(HDClinicalProviderServiceModel *)self content];
  id v3 = [v2 objectForKeyedSubscript:@"title"];

  return (NSString *)v3;
}

- (NSString)subtitle
{
  id v2 = [(HDClinicalProviderServiceModel *)self content];
  id v3 = [v2 objectForKeyedSubscript:@"subtitle"];

  return (NSString *)v3;
}

- (NSString)displayableDescription
{
  id v2 = [(HDClinicalProviderServiceModel *)self content];
  id v3 = [v2 objectForKeyedSubscript:@"displayableDescription"];

  return (NSString *)v3;
}

- (id)clientID
{
  id v2 = [(HDClinicalProviderServiceModel *)self content];
  id v3 = [v2 objectForKeyedSubscript:@"clientID"];

  return v3;
}

- (id)clientSecret
{
  id v2 = [(HDClinicalProviderServiceModel *)self content];
  id v3 = [v2 objectForKeyedSubscript:@"clientSecret"];
  id v4 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v3 options:0];
  if (!v4)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    char v9 = +[NSString stringWithUTF8String:"NSString * _Nonnull _decryptClientSecret(NSString * _Nonnull __strong)"];
    [v8 handleFailureInFunction:v9 file:@"HDClinicalGateway.m" lineNumber:330 description:@"Decoding failed"];
  }
  v5 = sub_7CCF4(v4);
  id v6 = [objc_alloc((Class)NSString) initWithData:v5 encoding:4];
  if (!v6)
  {
    id v10 = +[NSAssertionHandler currentHandler];
    objc_super v11 = +[NSString stringWithUTF8String:"NSString * _Nonnull _decryptClientSecret(NSString * _Nonnull __strong)"];
    [v10 handleFailureInFunction:v11 file:@"HDClinicalGateway.m" lineNumber:335 description:@"Encoding failed"];
  }

  return v6;
}

- (NSArray)authSchemaDefinitions
{
  id v2 = [(HDClinicalProviderServiceModel *)self content];
  id v3 = [v2 objectForKeyedSubscript:@"authSchemas"];

  return (NSArray *)v3;
}

- (NSArray)resourceSchemaDefinitions
{
  id v2 = [(HDClinicalProviderServiceModel *)self content];
  id v3 = [v2 objectForKeyedSubscript:@"resourceSchemas"];

  return (NSArray *)v3;
}

- (NSArray)featureDefinitions
{
  id v2 = [(HDClinicalProviderServiceModel *)self content];
  id v3 = [v2 objectForKeyedSubscript:@"features"];
  id v4 = v3;
  if (!v3) {
    id v3 = &__NSArray0__struct;
  }
  v5 = v3;

  return v5;
}

- (NSArray)gatewayVersions
{
  id v2 = [(HDClinicalProviderServiceModel *)self content];
  id v3 = [v2 objectForKeyedSubscript:@"gatewayVersions"];
  id v4 = v3;
  if (!v3) {
    id v3 = &__NSArray0__struct;
  }
  v5 = v3;

  return v5;
}

- (NSURL)baseURL
{
  id v3 = objc_alloc((Class)NSURL);
  id v4 = [(HDClinicalProviderServiceModel *)self content];
  v5 = [v4 objectForKeyedSubscript:@"baseURL"];
  id v6 = [v3 initWithString:v5];

  return (NSURL *)v6;
}

- (HKClinicalBrand)brand
{
  id v2 = [(HDClinicalProviderServiceModel *)self content];
  id v3 = [v2 objectForKeyedSubscript:@"brand"];

  id v4 = [v3 objectForKeyedSubscript:@"brandID"];
  v5 = [v3 objectForKeyedSubscript:@"brandBatchID"];
  id v6 = [objc_alloc((Class)HKClinicalBrand) initWithExternalID:v4 batchID:v5];

  return (HKClinicalBrand *)v6;
}

- (NSString)country
{
  id v2 = [(HDClinicalProviderServiceModel *)self content];
  id v3 = [v2 objectForKeyedSubscript:HDClinicalGatewayContentCountryKey];
  id v4 = v3;
  if (!v3) {
    id v3 = @"US";
  }
  v5 = v3;

  return v5;
}

- (HKFHIRVersion)FHIRVersion
{
  id v2 = [(HDClinicalProviderServiceModel *)self content];
  uint64_t v3 = [v2 objectForKeyedSubscript:HDClinicalGatewayContentFHIRVersionKey];
  id v4 = (void *)v3;
  v5 = @"unknown";
  if (v3) {
    v5 = (__CFString *)v3;
  }
  id v6 = v5;

  id v7 = +[HKFHIRVersion versionFromVersionString:v6];

  return (HKFHIRVersion *)v7;
}

- (NSString)phoneNumber
{
  id v2 = [(HDClinicalProviderServiceModel *)self content];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"phoneNumber"];

  return (NSString *)v3;
}

- (NSURL)informationURL
{
  return (NSURL *)[(HDClinicalGateway *)self _URLForKey:@"info"];
}

- (NSURL)signupURL
{
  return (NSURL *)[(HDClinicalGateway *)self _URLForKey:@"signup"];
}

- (NSURL)passwordResetURL
{
  return (NSURL *)[(HDClinicalGateway *)self _URLForKey:@"forgot"];
}

- (NSURL)patientPortalURL
{
  return (NSURL *)[(HDClinicalGateway *)self _URLForKey:@"patientportal"];
}

- (int64_t)lastReportedStatus
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(HDClinicalProviderServiceModel *)self content];
  v5 = [v4 objectForKeyedSubscript:@"status"];
  id v6 = [v3 _statusForRawStatus:v5];

  return (int64_t)v6;
}

- (int64_t)type
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(HDClinicalProviderServiceModel *)self content];
  v5 = [v4 objectForKeyedSubscript:@"type"];
  id v6 = [v3 _typeForRawType:v5];

  return (int64_t)v6;
}

- (int64_t)PKCEAlgorithm
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(HDClinicalProviderServiceModel *)self content];
  v5 = [v4 objectForKeyedSubscript:@"pkceAlgorithm"];
  id v6 = [v3 _pkceAlgorithmForRawType:v5];

  return (int64_t)v6;
}

- (int64_t)minCompatibleAPIVersion
{
  id v2 = [(HDClinicalProviderServiceModel *)self content];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"minCompatibleApiVersion"];

  id v4 = [v3 integerValue];
  return (int64_t)v4;
}

+ (int64_t)_statusForRawStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Active"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Disabled"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Removed"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (int64_t)_typeForRawType:(id)a3
{
  return [a3 isEqualToString:@"FHIR"];
}

+ (int64_t)_pkceAlgorithmForRawType:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    objc_opt_class();
    v5 = HKSafeObject();

    id v6 = 0;
    if (v5)
    {
      int64_t v7 = HKFHIRServerAuthenticationPKCEAlgorithmFromNSString();
      if (v7 != 3)
      {
LABEL_10:

        return v7;
      }
      _HKInitializeLogging();
      id v8 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
        sub_B24A4((uint64_t)v5, v8);
      }
    }
    else
    {
      _HKInitializeLogging();
      char v9 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B23E4(v9, a1, (uint64_t)v6);
      }
    }
    int64_t v7 = 3;
    goto LABEL_10;
  }
  return 0;
}

- (id)_URLForKey:(id)a3
{
  id v4 = a3;
  v5 = [(HDClinicalProviderServiceModel *)self content];
  id v6 = [v5 objectForKeyedSubscript:@"urls"];

  if (v6)
  {
    int64_t v7 = [v6 objectForKeyedSubscript:v4];
    if (v7)
    {
      id v8 = [objc_alloc((Class)NSURLComponents) initWithString:v7];
      char v9 = [v8 URL];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (HDConcreteSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end