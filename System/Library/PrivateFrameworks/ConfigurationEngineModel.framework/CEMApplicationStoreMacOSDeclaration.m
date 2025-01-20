@interface CEMApplicationStoreMacOSDeclaration
+ (NSSet)allowedPayloadKeys;
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)buildRequiredOnlyWithIdentifier:(id)a3;
+ (id)buildWithIdentifier:(id)a3 withRestrictStoreRequireAdminToInstall:(id)a4 withRestrictStoreSoftwareupdateOnly:(id)a5 withRestrictStoreDisableAppAdoption:(id)a6 withDisableSoftwareUpdateNotifications:(id)a7 withRestrictStoreMdmInstallSoftwareupdateOnly:(id)a8;
+ (id)profileType;
+ (id)restrictionPayloadKeys;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (BOOL)multipleAllowed;
- (BOOL)mustBeSupervised;
- (NSNumber)payloadDisableSoftwareUpdateNotifications;
- (NSNumber)payloadRestrictStoreDisableAppAdoption;
- (NSNumber)payloadRestrictStoreMdmInstallSoftwareupdateOnly;
- (NSNumber)payloadRestrictStoreRequireAdminToInstall;
- (NSNumber)payloadRestrictStoreSoftwareupdateOnly;
- (id)assetReferences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayloadWithAssetProviders:(id)a3;
- (int)activationLevel;
- (void)setPayloadDisableSoftwareUpdateNotifications:(id)a3;
- (void)setPayloadRestrictStoreDisableAppAdoption:(id)a3;
- (void)setPayloadRestrictStoreMdmInstallSoftwareupdateOnly:(id)a3;
- (void)setPayloadRestrictStoreRequireAdminToInstall:(id)a3;
- (void)setPayloadRestrictStoreSoftwareupdateOnly:(id)a3;
@end

@implementation CEMApplicationStoreMacOSDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)@"Declarations";
}

+ (NSString)registeredIdentifier
{
  return (NSString *)@"com.apple.configuration.application.store.macos";
}

+ (id)profileType
{
  return @"com.apple.appstore";
}

+ (NSSet)allowedPayloadKeys
{
  v6[5] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"restrict-store-require-admin-to-install";
  v6[1] = @"restrict-store-softwareupdate-only";
  v6[2] = @"restrict-store-disable-app-adoption";
  v6[3] = @"DisableSoftwareUpdateNotifications";
  v6[4] = @"restrict-store-mdm-install-softwareupdate-only";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)[MEMORY[0x263EFFA08] setWithArray:MEMORY[0x263EFFA68]];
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)buildWithIdentifier:(id)a3 withRestrictStoreRequireAdminToInstall:(id)a4 withRestrictStoreSoftwareupdateOnly:(id)a5 withRestrictStoreDisableAppAdoption:(id)a6 withDisableSoftwareUpdateNotifications:(id)a7 withRestrictStoreMdmInstallSoftwareupdateOnly:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  v19 = objc_opt_new();
  [v19 setDeclarationType:@"com.apple.configuration.application.store.macos"];
  if (v13)
  {
    [v19 setDeclarationIdentifier:v13];
  }
  else
  {
    v20 = [MEMORY[0x263F08C38] UUID];
    v21 = [v20 UUIDString];
    [v19 setDeclarationIdentifier:v21];
  }
  v22 = (void *)MEMORY[0x263EFFA80];
  if (v18) {
    id v23 = v18;
  }
  else {
    id v23 = (id)MEMORY[0x263EFFA80];
  }
  [v19 setPayloadRestrictStoreRequireAdminToInstall:v23];

  if (v17) {
    id v24 = v17;
  }
  else {
    id v24 = v22;
  }
  [v19 setPayloadRestrictStoreSoftwareupdateOnly:v24];

  if (v16) {
    id v25 = v16;
  }
  else {
    id v25 = v22;
  }
  [v19 setPayloadRestrictStoreDisableAppAdoption:v25];

  if (v15) {
    id v26 = v15;
  }
  else {
    id v26 = v22;
  }
  [v19 setPayloadDisableSoftwareUpdateNotifications:v26];

  if (v14) {
    id v27 = v14;
  }
  else {
    id v27 = v22;
  }
  [v19 setPayloadRestrictStoreMdmInstallSoftwareupdateOnly:v27];

  [v19 updateServerHash];

  return v19;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDeclarationType:@"com.apple.configuration.application.store.macos"];
  if (v3)
  {
    [v4 setDeclarationIdentifier:v3];
  }
  else
  {
    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    [v4 setDeclarationIdentifier:v6];
  }
  [v4 updateServerHash];

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMApplicationStoreMacOSDeclaration allowedPayloadKeys];
  [v9 minusSet:v10];

  v11 = (NSSet *)[v9 copy];
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  id v29 = 0;
  id v13 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"restrict-store-require-admin-to-install" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v29];
  id v14 = v29;
  payloadRestrictStoreRequireAdminToInstall = self->_payloadRestrictStoreRequireAdminToInstall;
  self->_payloadRestrictStoreRequireAdminToInstall = v13;

  if (!v14)
  {
    id v28 = 0;
    id v16 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"restrict-store-softwareupdate-only" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v28];
    id v14 = v28;
    payloadRestrictStoreSoftwareupdateOnly = self->_payloadRestrictStoreSoftwareupdateOnly;
    self->_payloadRestrictStoreSoftwareupdateOnly = v16;

    if (!v14)
    {
      id v27 = 0;
      id v18 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"restrict-store-disable-app-adoption" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v27];
      id v14 = v27;
      payloadRestrictStoreDisableAppAdoption = self->_payloadRestrictStoreDisableAppAdoption;
      self->_payloadRestrictStoreDisableAppAdoption = v18;

      if (!v14)
      {
        id v26 = 0;
        v20 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DisableSoftwareUpdateNotifications" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v26];
        id v14 = v26;
        payloadDisableSoftwareUpdateNotifications = self->_payloadDisableSoftwareUpdateNotifications;
        self->_payloadDisableSoftwareUpdateNotifications = v20;

        if (!v14)
        {
          id v25 = 0;
          v22 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"restrict-store-mdm-install-softwareupdate-only" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v25];
          id v14 = v25;
          payloadRestrictStoreMdmInstallSoftwareupdateOnly = self->_payloadRestrictStoreMdmInstallSoftwareupdateOnly;
          self->_payloadRestrictStoreMdmInstallSoftwareupdateOnly = v22;
        }
      }
    }
  }
  if (a4 && v14) {
    *a4 = v14;
  }

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  uint64_t v5 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"restrict-store-require-admin-to-install" withValue:self->_payloadRestrictStoreRequireAdminToInstall isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"restrict-store-softwareupdate-only" withValue:self->_payloadRestrictStoreSoftwareupdateOnly isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"restrict-store-disable-app-adoption" withValue:self->_payloadRestrictStoreDisableAppAdoption isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"DisableSoftwareUpdateNotifications" withValue:self->_payloadDisableSoftwareUpdateNotifications isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v4 withKey:@"restrict-store-mdm-install-softwareupdate-only" withValue:self->_payloadRestrictStoreMdmInstallSoftwareupdateOnly isRequired:0 defaultValue:v5];
  id v6 = (void *)[v4 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CEMApplicationStoreMacOSDeclaration;
  v4 = [(CEMDeclarationBase *)&v16 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_payloadRestrictStoreRequireAdminToInstall copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSNumber *)self->_payloadRestrictStoreSoftwareupdateOnly copy];
  v8 = (void *)v4[10];
  v4[10] = v7;

  uint64_t v9 = [(NSNumber *)self->_payloadRestrictStoreDisableAppAdoption copy];
  v10 = (void *)v4[11];
  v4[11] = v9;

  uint64_t v11 = [(NSNumber *)self->_payloadDisableSoftwareUpdateNotifications copy];
  v12 = (void *)v4[12];
  v4[12] = v11;

  uint64_t v13 = [(NSNumber *)self->_payloadRestrictStoreMdmInstallSoftwareupdateOnly copy];
  id v14 = (void *)v4[13];
  v4[13] = v13;

  return v4;
}

- (NSNumber)payloadRestrictStoreRequireAdminToInstall
{
  return self->_payloadRestrictStoreRequireAdminToInstall;
}

- (void)setPayloadRestrictStoreRequireAdminToInstall:(id)a3
{
}

- (NSNumber)payloadRestrictStoreSoftwareupdateOnly
{
  return self->_payloadRestrictStoreSoftwareupdateOnly;
}

- (void)setPayloadRestrictStoreSoftwareupdateOnly:(id)a3
{
}

- (NSNumber)payloadRestrictStoreDisableAppAdoption
{
  return self->_payloadRestrictStoreDisableAppAdoption;
}

- (void)setPayloadRestrictStoreDisableAppAdoption:(id)a3
{
}

- (NSNumber)payloadDisableSoftwareUpdateNotifications
{
  return self->_payloadDisableSoftwareUpdateNotifications;
}

- (void)setPayloadDisableSoftwareUpdateNotifications:(id)a3
{
}

- (NSNumber)payloadRestrictStoreMdmInstallSoftwareupdateOnly
{
  return self->_payloadRestrictStoreMdmInstallSoftwareupdateOnly;
}

- (void)setPayloadRestrictStoreMdmInstallSoftwareupdateOnly:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadRestrictStoreMdmInstallSoftwareupdateOnly, 0);
  objc_storeStrong((id *)&self->_payloadDisableSoftwareUpdateNotifications, 0);
  objc_storeStrong((id *)&self->_payloadRestrictStoreDisableAppAdoption, 0);
  objc_storeStrong((id *)&self->_payloadRestrictStoreSoftwareupdateOnly, 0);

  objc_storeStrong((id *)&self->_payloadRestrictStoreRequireAdminToInstall, 0);
}

@end