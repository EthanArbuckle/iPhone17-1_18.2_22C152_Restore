@interface AAProvisioningResponse
- (AAProvisioningResponse)initWithDictionary:(id)a3;
- (AAProvisioningResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (BOOL)hasOptionalTerms;
- (BOOL)isCloudDocsMigrated;
- (BOOL)isFamilyEligible;
- (BOOL)isManagedAppleID;
- (BOOL)isNotesMigrated;
- (BOOL)isRemindersAutoMigratableToCK;
- (BOOL)isRemindersMigrated;
- (BOOL)isSandboxAccount;
- (NSArray)appleIDAliases;
- (NSArray)provisionedDataclasses;
- (NSDictionary)dataclassProperties;
- (NSDictionary)regionInfo;
- (NSNumber)primaryEmailVerified;
- (NSString)appleID;
- (NSString)firstName;
- (NSString)fmipAppToken;
- (NSString)fmipAuthToken;
- (NSString)fmipSiriToken;
- (NSString)iCloudAuthToken;
- (NSString)keyTransparencyToken;
- (NSString)lastName;
- (NSString)primaryEmail;
- (NSString)searchPartyToken;
- (unint64_t)ageCategory;
@end

@implementation AAProvisioningResponse

- (AAProvisioningResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)AAProvisioningResponse;
  v4 = [(AAAuthenticationResponse *)&v13 initWithHTTPResponse:a3 data:a4];
  v5 = v4;
  if (v4)
  {
    httpResponse = v4->super.super._httpResponse;
    if (httpResponse)
    {
      if ([(NSHTTPURLResponse *)httpResponse statusCode] == 200)
      {
        v7 = [(AAResponse *)v5 responseDictionary];

        if (v7)
        {
          v8 = [(AAResponse *)v5 responseDictionary];
          v9 = [v8 objectForKey:@"com.apple.mobileme"];
          uint64_t v10 = [v9 copy];
          icloud = v5->_icloud;
          v5->_icloud = (NSDictionary *)v10;
        }
        [(AAResponse *)v5 setError:0];
      }
    }
  }
  return v5;
}

- (AAProvisioningResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AAProvisioningResponse;
  v5 = [(AAProvisioningResponse *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    responseDictionary = v5->super.super._responseDictionary;
    v5->super.super._responseDictionary = (NSDictionary *)v6;

    v8 = [(AAResponse *)v5 responseDictionary];

    if (v8)
    {
      v9 = [(AAResponse *)v5 responseDictionary];
      uint64_t v10 = [v9 objectForKey:@"com.apple.mobileme"];
      uint64_t v11 = [v10 copy];
      icloud = v5->_icloud;
      v5->_icloud = (NSDictionary *)v11;

      objc_super v13 = [(AAResponse *)v5 responseDictionary];
      v14 = [v13 objectForKey:@"appleAccountInfo"];
      uint64_t v15 = [v14 copy];
      appleAccount = v5->super._appleAccount;
      v5->super._appleAccount = (NSDictionary *)v15;

      v17 = [(AAResponse *)v5 responseDictionary];
      v18 = [v17 objectForKey:@"tokens"];
      uint64_t v19 = [v18 copy];
      tokens = v5->super._tokens;
      v5->super._tokens = (NSDictionary *)v19;
    }
  }

  return v5;
}

- (NSArray)provisionedDataclasses
{
  return (NSArray *)[(NSDictionary *)self->_icloud objectForKey:@"availableFeatures"];
}

- (NSDictionary)dataclassProperties
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = [(AAProvisioningResponse *)self provisionedDataclasses];
  v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(NSDictionary *)self->_icloud allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 hasPrefix:@"com.apple.Dataclass"])
        {
          v12 = [(NSDictionary *)self->_icloud objectForKey:v11];
          if (v12) {
            [v5 setObject:v12 forKey:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return (NSDictionary *)v5;
}

- (NSString)appleID
{
  return (NSString *)[(NSDictionary *)self->super._appleAccount objectForKey:@"appleId"];
}

- (NSArray)appleIDAliases
{
  return (NSArray *)[(NSDictionary *)self->super._appleAccount objectForKey:@"appleIdAliases"];
}

- (NSString)firstName
{
  return (NSString *)[(NSDictionary *)self->super._appleAccount objectForKey:@"firstName"];
}

- (NSString)lastName
{
  return (NSString *)[(NSDictionary *)self->super._appleAccount objectForKey:@"lastName"];
}

- (NSString)primaryEmail
{
  return (NSString *)[(NSDictionary *)self->super._appleAccount objectForKey:@"primaryEmail"];
}

- (NSNumber)primaryEmailVerified
{
  return (NSNumber *)[(NSDictionary *)self->super._appleAccount objectForKey:@"primaryEmailVerified"];
}

- (NSString)iCloudAuthToken
{
  return (NSString *)[(NSDictionary *)self->super._tokens objectForKey:@"mmeAuthToken"];
}

- (NSString)fmipAuthToken
{
  return (NSString *)[(NSDictionary *)self->super._tokens objectForKey:@"mmeFMIPToken"];
}

- (NSString)fmipSiriToken
{
  return (NSString *)[(NSDictionary *)self->super._tokens objectForKey:@"mmeFMIPSiriToken"];
}

- (NSString)searchPartyToken
{
  return (NSString *)[(NSDictionary *)self->super._tokens objectForKey:@"searchPartyToken"];
}

- (NSString)keyTransparencyToken
{
  return (NSString *)[(NSDictionary *)self->super._tokens objectForKey:@"keyTransparencyToken"];
}

- (NSString)fmipAppToken
{
  return (NSString *)[(NSDictionary *)self->super._tokens objectForKey:@"mmeFMIPAppToken"];
}

- (NSDictionary)regionInfo
{
  return (NSDictionary *)[(NSDictionary *)self->super.super._responseDictionary objectForKey:@"regionInfo"];
}

- (BOOL)isManagedAppleID
{
  v2 = [(NSDictionary *)self->super._appleAccount objectForKey:@"isManagedAppleID"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isNotesMigrated
{
  v2 = [(NSDictionary *)self->super._appleAccount objectForKey:@"notesMigrated"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isRemindersMigrated
{
  v2 = [(NSDictionary *)self->super._appleAccount objectForKey:@"tantorMigrated"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isRemindersAutoMigratableToCK
{
  v2 = [(NSDictionary *)self->super._appleAccount objectForKey:@"autoMigrateToTantor"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isSandboxAccount
{
  v2 = [(NSDictionary *)self->super._appleAccount objectForKey:@"isSandboxAcct"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isCloudDocsMigrated
{
  v2 = [(NSDictionary *)self->super._appleAccount objectForKey:@"brMigrated"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)hasOptionalTerms
{
  v2 = [(NSDictionary *)self->super._appleAccount objectForKey:@"hasOptionalTerms"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isFamilyEligible
{
  v2 = [(NSDictionary *)self->super._appleAccount objectForKey:@"familyEligible"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (unint64_t)ageCategory
{
  v2 = [(NSDictionary *)self->super._appleAccount objectForKey:@"ageCategory"];
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (void).cxx_destruct
{
}

@end