@interface ACXCompanionApplication
+ (BOOL)supportsSecureCoding;
- (ACXCompanionApplication)init;
- (ACXCompanionApplication)initWithApplicationRecord:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5;
- (ACXCompanionApplication)initWithBundleID:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5;
- (ACXCompanionApplication)initWithCoder:(id)a3;
- (ACXCompanionApplication)initWithSerializedDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForTesting;
- (id)serialize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ACXCompanionApplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACXCompanionApplication)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ACXCompanionApplication;
  return [(ACXCompanionApplication *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ACXCompanionApplication;
  [(ACXCompanionApplication *)&v3 encodeWithCoder:a3];
}

- (ACXCompanionApplication)init
{
  v3.receiver = self;
  v3.super_class = (Class)ACXCompanionApplication;
  return [(ACXCompanionApplication *)&v3 init];
}

- (ACXCompanionApplication)initWithApplicationRecord:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ACXCompanionApplication;
  v10 = [(ACXCompanionApplication *)&v23 initWithApplicationRecord:v8 databaseUUID:v9 sequenceNumber:a5];
  if (!v10) {
    goto LABEL_7;
  }
  v11 = [v8 bundleIdentifier];
  [(ACXCompanionApplication *)v10 setBundleIdentifier:v11];

  [(ACXCompanionApplication *)v10 setDatabaseUUID:v9];
  [(ACXCompanionApplication *)v10 setSequenceNumber:a5];
  v12 = [v8 counterpartIdentifiers];
  [(ACXCompanionApplication *)v10 setCounterpartIdentifiers:v12];

  v13 = [v8 typeForInstallMachinery];
  if ([v13 isEqualToString:LSUserApplicationType])
  {
    uint64_t v14 = 2;
LABEL_6:
    [(ACXCompanionApplication *)v10 setApplicationType:v14];
    -[ACXCompanionApplication setIsDeletable:](v10, "setIsDeletable:", [v8 isDeletable]);
    v15 = [(id)objc_opt_class() localizedAppNameFromRecord:v8];
    [(ACXCompanionApplication *)v10 setApplicationName:v15];

    v16 = objc_opt_class();
    v17 = [v8 URL];
    v18 = [v16 buildLocalizedInfoPlistStringsDictForAppBundleURL:v17 watchKitExtensionURL:0];
    [(ACXCompanionApplication *)v10 setLocalizedInfoPlistStrings:v18];

    v19 = objc_msgSend(v8, "ACX_externalVersionIdentifier");
    [(ACXCompanionApplication *)v10 setExternalVersionIdentifier:v19];

    -[ACXCompanionApplication setSupportsAlwaysOnDisplay:](v10, "setSupportsAlwaysOnDisplay:", [v8 supportsAlwaysOnDisplay]);
    -[ACXCompanionApplication setDefaultsToPrivateAlwaysOnDisplayTreatment:](v10, "setDefaultsToPrivateAlwaysOnDisplayTreatment:", [v8 defaultsToPrivateAlwaysOnDisplayTreatment]);
    -[ACXCompanionApplication setIsEligibleForWatchAppInstall:](v10, "setIsEligibleForWatchAppInstall:", [v8 isEligibleForWatchAppInstall]);

LABEL_7:
    v20 = v10;
    goto LABEL_8;
  }
  if ([v13 isEqualToString:LSSystemApplicationType])
  {
    uint64_t v14 = 1;
    goto LABEL_6;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    v22 = [(ACXCompanionApplication *)v10 bundleIdentifier];
    MOLogWrite();
  }
  v20 = 0;
LABEL_8:

  return v20;
}

- (ACXCompanionApplication)initWithBundleID:(id)a3 databaseUUID:(id)a4 sequenceNumber:(unint64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)ACXCompanionApplication;
  return [(ACXCompanionApplication *)&v6 initWithBundleID:a3 databaseUUID:a4 sequenceNumber:a5];
}

- (id)initForTesting
{
  v3.receiver = self;
  v3.super_class = (Class)ACXCompanionApplication;
  return [(ACXCompanionApplication *)&v3 initForTesting];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ACXCompanionApplication;
  id v3 = [(ACXCompanionApplication *)&v7 copyWithZone:a3];
  objc_super v4 = v3;
  if (v3) {
    id v5 = v3;
  }

  return v4;
}

- (ACXCompanionApplication)initWithSerializedDictionary:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ACXCompanionApplication;
  return [(ACXCompanionApplication *)&v4 initWithSerializedDictionary:a3];
}

- (id)serialize
{
  v4.receiver = self;
  v4.super_class = (Class)ACXCompanionApplication;
  v2 = [(ACXCompanionApplication *)&v4 serialize];

  return v2;
}

@end