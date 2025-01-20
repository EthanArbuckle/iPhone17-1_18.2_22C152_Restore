@interface AALoginResponseAppleAccountInfo
- (AALoginResponseAppleAccountInfo)initWithDictionary:(id)a3;
- (BOOL)hasOptionalTerms;
- (BOOL)isFamilyEligible;
- (BOOL)isManagedAppleID;
- (BOOL)isSandboxAccount;
- (NSArray)appleIDAliases;
- (NSNumber)cloudDocsMigrated;
- (NSNumber)notesMigrated;
- (NSNumber)primaryEmailVerified;
- (NSNumber)remindersAutoMigratableToCK;
- (NSNumber)remindersMigrated;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)personID;
- (NSString)primaryEmail;
@end

@implementation AALoginResponseAppleAccountInfo

- (AALoginResponseAppleAccountInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)AALoginResponseAppleAccountInfo;
  v5 = [(AALoginResponseAppleAccountInfo *)&v37 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"dsid"];
    personID = v5->_personID;
    v5->_personID = (NSString *)v6;

    if (!v5->_personID)
    {
      uint64_t v8 = [v4 objectForKey:@"dsPrsID"];
      v9 = v5->_personID;
      v5->_personID = (NSString *)v8;
    }
    uint64_t v10 = [v4 objectForKey:@"aDsID"];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v10;

    uint64_t v12 = [v4 objectForKey:@"appleId"];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v12;

    uint64_t v14 = [v4 objectForKey:@"appleIdAliases"];
    appleIDAliases = v5->_appleIDAliases;
    v5->_appleIDAliases = (NSArray *)v14;

    uint64_t v16 = [v4 objectForKey:@"firstName"];
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v16;

    uint64_t v18 = [v4 objectForKey:@"lastName"];
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v18;

    uint64_t v20 = [v4 objectForKey:@"primaryEmail"];
    primaryEmail = v5->_primaryEmail;
    v5->_primaryEmail = (NSString *)v20;

    uint64_t v22 = [v4 objectForKey:@"primaryEmailVerified"];
    primaryEmailVerified = v5->_primaryEmailVerified;
    v5->_primaryEmailVerified = (NSNumber *)v22;

    uint64_t v24 = [v4 objectForKey:@"brMigrated"];
    cloudDocsMigrated = v5->_cloudDocsMigrated;
    v5->_cloudDocsMigrated = (NSNumber *)v24;

    uint64_t v26 = [v4 objectForKey:@"notesMigrated"];
    notesMigrated = v5->_notesMigrated;
    v5->_notesMigrated = (NSNumber *)v26;

    uint64_t v28 = [v4 objectForKey:@"tantorMigrated"];
    remindersMigrated = v5->_remindersMigrated;
    v5->_remindersMigrated = (NSNumber *)v28;

    uint64_t v30 = [v4 objectForKey:@"autoMigrateToTantor"];
    remindersAutoMigratableToCK = v5->_remindersAutoMigratableToCK;
    v5->_remindersAutoMigratableToCK = (NSNumber *)v30;

    v32 = [v4 objectForKey:@"isManagedAppleID"];
    v5->_managedAppleID = [v32 BOOLValue];

    v33 = [v4 objectForKey:@"isSandboxAcct"];
    v5->_sandboxAccount = [v33 BOOLValue];

    v34 = [v4 objectForKey:@"hasOptionalTerms"];
    v5->_optionalTerms = [v34 BOOLValue];

    v35 = [v4 objectForKey:@"familyEligible"];
    v5->_familyEligible = [v35 BOOLValue];
  }
  return v5;
}

- (NSString)personID
{
  return self->_personID;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSArray)appleIDAliases
{
  return self->_appleIDAliases;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)primaryEmail
{
  return self->_primaryEmail;
}

- (NSNumber)primaryEmailVerified
{
  return self->_primaryEmailVerified;
}

- (NSNumber)cloudDocsMigrated
{
  return self->_cloudDocsMigrated;
}

- (NSNumber)notesMigrated
{
  return self->_notesMigrated;
}

- (NSNumber)remindersMigrated
{
  return self->_remindersMigrated;
}

- (NSNumber)remindersAutoMigratableToCK
{
  return self->_remindersAutoMigratableToCK;
}

- (BOOL)isManagedAppleID
{
  return self->_managedAppleID;
}

- (BOOL)isSandboxAccount
{
  return self->_sandboxAccount;
}

- (BOOL)hasOptionalTerms
{
  return self->_optionalTerms;
}

- (BOOL)isFamilyEligible
{
  return self->_familyEligible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remindersAutoMigratableToCK, 0);
  objc_storeStrong((id *)&self->_remindersMigrated, 0);
  objc_storeStrong((id *)&self->_notesMigrated, 0);
  objc_storeStrong((id *)&self->_cloudDocsMigrated, 0);
  objc_storeStrong((id *)&self->_primaryEmailVerified, 0);
  objc_storeStrong((id *)&self->_primaryEmail, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_appleIDAliases, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_personID, 0);
}

@end