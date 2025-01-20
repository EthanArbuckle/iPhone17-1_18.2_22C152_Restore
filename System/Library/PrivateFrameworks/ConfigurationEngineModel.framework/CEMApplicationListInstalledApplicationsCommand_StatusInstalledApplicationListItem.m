@interface CEMApplicationListInstalledApplicationsCommand_StatusInstalledApplicationListItem
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnlyWithBundleIdentifier:(id)a3 withExternalVersionIdentifier:(id)a4 withVersion:(id)a5 withShortVersion:(id)a6 withName:(id)a7 withAppStoreVendable:(id)a8 withDeviceBasedVPP:(id)a9 withBetaApp:(id)a10 withAdHocCodeSigned:(id)a11 withHasUpdateAvailable:(id)a12;
+ (id)buildWithBundleIdentifier:(id)a3 withExternalVersionIdentifier:(id)a4 withVersion:(id)a5 withShortVersion:(id)a6 withName:(id)a7 withBundleSize:(id)a8 withDynamicSize:(id)a9 withIsValidated:(id)a10 withInstalling:(id)a11 withAppStoreVendable:(id)a12 withDeviceBasedVPP:(id)a13 withBetaApp:(id)a14 withAdHocCodeSigned:(id)a15 withHasUpdateAvailable:(id)a16 withDownloadFailed:(id)a17 withDownloadWaiting:(id)a18 withDownloadPaused:(id)a19 withDownloadCancelled:(id)a20;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSNumber)statusAdHocCodeSigned;
- (NSNumber)statusAppStoreVendable;
- (NSNumber)statusBetaApp;
- (NSNumber)statusDeviceBasedVPP;
- (NSNumber)statusDownloadCancelled;
- (NSNumber)statusDownloadFailed;
- (NSNumber)statusDownloadPaused;
- (NSNumber)statusDownloadWaiting;
- (NSNumber)statusHasUpdateAvailable;
- (NSNumber)statusInstalling;
- (NSNumber)statusIsValidated;
- (NSString)statusBundleIdentifier;
- (NSString)statusBundleSize;
- (NSString)statusDynamicSize;
- (NSString)statusExternalVersionIdentifier;
- (NSString)statusName;
- (NSString)statusShortVersion;
- (NSString)statusVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setStatusAdHocCodeSigned:(id)a3;
- (void)setStatusAppStoreVendable:(id)a3;
- (void)setStatusBetaApp:(id)a3;
- (void)setStatusBundleIdentifier:(id)a3;
- (void)setStatusBundleSize:(id)a3;
- (void)setStatusDeviceBasedVPP:(id)a3;
- (void)setStatusDownloadCancelled:(id)a3;
- (void)setStatusDownloadFailed:(id)a3;
- (void)setStatusDownloadPaused:(id)a3;
- (void)setStatusDownloadWaiting:(id)a3;
- (void)setStatusDynamicSize:(id)a3;
- (void)setStatusExternalVersionIdentifier:(id)a3;
- (void)setStatusHasUpdateAvailable:(id)a3;
- (void)setStatusInstalling:(id)a3;
- (void)setStatusIsValidated:(id)a3;
- (void)setStatusName:(id)a3;
- (void)setStatusShortVersion:(id)a3;
- (void)setStatusVersion:(id)a3;
@end

@implementation CEMApplicationListInstalledApplicationsCommand_StatusInstalledApplicationListItem

+ (NSSet)allowedStatusKeys
{
  v6[18] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"BundleIdentifier";
  v6[1] = @"ExternalVersionIdentifier";
  v6[2] = @"Version";
  v6[3] = @"ShortVersion";
  v6[4] = @"Name";
  v6[5] = @"BundleSize";
  v6[6] = @"DynamicSize";
  v6[7] = @"IsValidated";
  v6[8] = @"Installing";
  v6[9] = @"AppStoreVendable";
  v6[10] = @"DeviceBasedVPP";
  v6[11] = @"BetaApp";
  v6[12] = @"AdHocCodeSigned";
  v6[13] = @"HasUpdateAvailable";
  v6[14] = @"DownloadFailed";
  v6[15] = @"DownloadWaiting";
  v6[16] = @"DownloadPaused";
  v6[17] = @"DownloadCancelled";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:18];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithBundleIdentifier:(id)a3 withExternalVersionIdentifier:(id)a4 withVersion:(id)a5 withShortVersion:(id)a6 withName:(id)a7 withBundleSize:(id)a8 withDynamicSize:(id)a9 withIsValidated:(id)a10 withInstalling:(id)a11 withAppStoreVendable:(id)a12 withDeviceBasedVPP:(id)a13 withBetaApp:(id)a14 withAdHocCodeSigned:(id)a15 withHasUpdateAvailable:(id)a16 withDownloadFailed:(id)a17 withDownloadWaiting:(id)a18 withDownloadPaused:(id)a19 withDownloadCancelled:(id)a20
{
  id v53 = a20;
  id v52 = a19;
  id v51 = a18;
  id v50 = a17;
  id v49 = a16;
  id v48 = a15;
  id v47 = a14;
  id v46 = a13;
  id v45 = a12;
  id v20 = a11;
  id v21 = a10;
  id v22 = a9;
  id v23 = a8;
  id v24 = a7;
  id v25 = a6;
  id v26 = a5;
  id v27 = a4;
  id v28 = a3;
  v29 = objc_opt_new();
  [v29 setStatusBundleIdentifier:v28];

  [v29 setStatusExternalVersionIdentifier:v27];
  [v29 setStatusVersion:v26];

  [v29 setStatusShortVersion:v25];
  [v29 setStatusName:v24];

  [v29 setStatusBundleSize:v23];
  [v29 setStatusDynamicSize:v22];

  v30 = (void *)MEMORY[0x263EFFA88];
  if (v21) {
    id v31 = v21;
  }
  else {
    id v31 = (id)MEMORY[0x263EFFA88];
  }
  [v29 setStatusIsValidated:v31];

  if (v20) {
    id v32 = v20;
  }
  else {
    id v32 = v30;
  }
  [v29 setStatusInstalling:v32];

  [v29 setStatusAppStoreVendable:v45];
  [v29 setStatusDeviceBasedVPP:v46];

  [v29 setStatusBetaApp:v47];
  [v29 setStatusAdHocCodeSigned:v48];

  [v29 setStatusHasUpdateAvailable:v49];
  v33 = (void *)MEMORY[0x263EFFA80];
  if (v50) {
    id v34 = v50;
  }
  else {
    id v34 = (id)MEMORY[0x263EFFA80];
  }
  [v29 setStatusDownloadFailed:v34];

  if (v51) {
    id v35 = v51;
  }
  else {
    id v35 = v33;
  }
  [v29 setStatusDownloadWaiting:v35];

  if (v52) {
    id v36 = v52;
  }
  else {
    id v36 = v33;
  }
  [v29 setStatusDownloadPaused:v36];

  if (v53) {
    id v37 = v53;
  }
  else {
    id v37 = v33;
  }
  [v29 setStatusDownloadCancelled:v37];

  return v29;
}

+ (id)buildRequiredOnlyWithBundleIdentifier:(id)a3 withExternalVersionIdentifier:(id)a4 withVersion:(id)a5 withShortVersion:(id)a6 withName:(id)a7 withAppStoreVendable:(id)a8 withDeviceBasedVPP:(id)a9 withBetaApp:(id)a10 withAdHocCodeSigned:(id)a11 withHasUpdateAvailable:(id)a12
{
  id v29 = a12;
  id v28 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  id v26 = objc_opt_new();
  [v26 setStatusBundleIdentifier:v25];

  [v26 setStatusExternalVersionIdentifier:v24];
  [v26 setStatusVersion:v23];

  [v26 setStatusShortVersion:v22];
  [v26 setStatusName:v21];

  [v26 setStatusAppStoreVendable:v20];
  [v26 setStatusDeviceBasedVPP:v19];

  [v26 setStatusBetaApp:v18];
  [v26 setStatusAdHocCodeSigned:v28];

  [v26 setStatusHasUpdateAvailable:v29];

  return v26;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v71[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMApplicationListInstalledApplicationsCommand_StatusInstalledApplicationListItem allowedStatusKeys];
  [v9 minusSet:v10];

  if ([v9 count])
  {
    if (!a4)
    {
      BOOL v14 = 0;
      goto LABEL_27;
    }
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v70 = *MEMORY[0x263F08320];
    id v12 = [NSString stringWithFormat:@"Unexpected payload keys: %@", v9];
    v71[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v71 forKeys:&v70 count:1];
    *a4 = [v11 errorWithDomain:@"error" code:1 userInfo:v13];

    BOOL v14 = 0;
  }
  else
  {
    id v69 = 0;
    v15 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"BundleIdentifier" isRequired:1 defaultValue:0 error:&v69];
    id v12 = v69;
    statusBundleIdentifier = self->_statusBundleIdentifier;
    self->_statusBundleIdentifier = v15;

    if (!v12)
    {
      id v68 = 0;
      v17 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ExternalVersionIdentifier" isRequired:1 defaultValue:0 error:&v68];
      id v12 = v68;
      statusExternalVersionIdentifier = self->_statusExternalVersionIdentifier;
      self->_statusExternalVersionIdentifier = v17;

      if (!v12)
      {
        id v67 = 0;
        id v19 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Version" isRequired:1 defaultValue:0 error:&v67];
        id v12 = v67;
        statusVersion = self->_statusVersion;
        self->_statusVersion = v19;

        if (!v12)
        {
          id v66 = 0;
          id v21 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ShortVersion" isRequired:1 defaultValue:0 error:&v66];
          id v12 = v66;
          statusShortVersion = self->_statusShortVersion;
          self->_statusShortVersion = v21;

          if (!v12)
          {
            id v65 = 0;
            id v23 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Name" isRequired:1 defaultValue:0 error:&v65];
            id v12 = v65;
            statusName = self->_statusName;
            self->_statusName = v23;

            if (!v12)
            {
              id v64 = 0;
              id v25 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"BundleSize" isRequired:0 defaultValue:0 error:&v64];
              id v12 = v64;
              statusBundleSize = self->_statusBundleSize;
              self->_statusBundleSize = v25;

              if (!v12)
              {
                id v63 = 0;
                id v27 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DynamicSize" isRequired:0 defaultValue:0 error:&v63];
                id v12 = v63;
                statusDynamicSize = self->_statusDynamicSize;
                self->_statusDynamicSize = v27;

                if (!v12)
                {
                  id v62 = 0;
                  id v29 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"IsValidated" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v62];
                  id v12 = v62;
                  statusIsValidated = self->_statusIsValidated;
                  self->_statusIsValidated = v29;

                  if (!v12)
                  {
                    id v61 = 0;
                    id v31 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"Installing" isRequired:0 defaultValue:MEMORY[0x263EFFA88] error:&v61];
                    id v12 = v61;
                    statusInstalling = self->_statusInstalling;
                    self->_statusInstalling = v31;

                    if (!v12)
                    {
                      id v60 = 0;
                      v33 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AppStoreVendable" isRequired:1 defaultValue:0 error:&v60];
                      id v12 = v60;
                      statusAppStoreVendable = self->_statusAppStoreVendable;
                      self->_statusAppStoreVendable = v33;

                      if (!v12)
                      {
                        id v59 = 0;
                        id v35 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DeviceBasedVPP" isRequired:1 defaultValue:0 error:&v59];
                        id v12 = v59;
                        statusDeviceBasedVPP = self->_statusDeviceBasedVPP;
                        self->_statusDeviceBasedVPP = v35;

                        if (!v12)
                        {
                          id v58 = 0;
                          id v37 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"BetaApp" isRequired:1 defaultValue:0 error:&v58];
                          id v12 = v58;
                          statusBetaApp = self->_statusBetaApp;
                          self->_statusBetaApp = v37;

                          if (!v12)
                          {
                            id v57 = 0;
                            v39 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AdHocCodeSigned" isRequired:1 defaultValue:0 error:&v57];
                            id v12 = v57;
                            statusAdHocCodeSigned = self->_statusAdHocCodeSigned;
                            self->_statusAdHocCodeSigned = v39;

                            if (!v12)
                            {
                              id v56 = 0;
                              v41 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"HasUpdateAvailable" isRequired:1 defaultValue:0 error:&v56];
                              id v12 = v56;
                              statusHasUpdateAvailable = self->_statusHasUpdateAvailable;
                              self->_statusHasUpdateAvailable = v41;

                              if (!v12)
                              {
                                id v55 = 0;
                                v43 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DownloadFailed" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v55];
                                id v12 = v55;
                                statusDownloadFailed = self->_statusDownloadFailed;
                                self->_statusDownloadFailed = v43;

                                if (!v12)
                                {
                                  id v54 = 0;
                                  id v45 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DownloadWaiting" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v54];
                                  id v12 = v54;
                                  statusDownloadWaiting = self->_statusDownloadWaiting;
                                  self->_statusDownloadWaiting = v45;

                                  if (!v12)
                                  {
                                    id v53 = 0;
                                    id v47 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DownloadPaused" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v53];
                                    id v12 = v53;
                                    statusDownloadPaused = self->_statusDownloadPaused;
                                    self->_statusDownloadPaused = v47;

                                    if (!v12)
                                    {
                                      id v52 = 0;
                                      id v49 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DownloadCancelled" isRequired:0 defaultValue:MEMORY[0x263EFFA80] error:&v52];
                                      id v12 = v52;
                                      statusDownloadCancelled = self->_statusDownloadCancelled;
                                      self->_statusDownloadCancelled = v49;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    BOOL v14 = v12 == 0;
    if (a4 && v12)
    {
      id v12 = v12;
      BOOL v14 = 0;
      *a4 = v12;
    }
  }

LABEL_27:
  return v14;
}

- (id)serializePayload
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"BundleIdentifier" withValue:self->_statusBundleIdentifier isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"ExternalVersionIdentifier" withValue:self->_statusExternalVersionIdentifier isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"Version" withValue:self->_statusVersion isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"ShortVersion" withValue:self->_statusShortVersion isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"Name" withValue:self->_statusName isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"BundleSize" withValue:self->_statusBundleSize isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"DynamicSize" withValue:self->_statusDynamicSize isRequired:0 defaultValue:0];
  uint64_t v4 = MEMORY[0x263EFFA88];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"IsValidated" withValue:self->_statusIsValidated isRequired:0 defaultValue:MEMORY[0x263EFFA88]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"Installing" withValue:self->_statusInstalling isRequired:0 defaultValue:v4];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"AppStoreVendable" withValue:self->_statusAppStoreVendable isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"DeviceBasedVPP" withValue:self->_statusDeviceBasedVPP isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"BetaApp" withValue:self->_statusBetaApp isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"AdHocCodeSigned" withValue:self->_statusAdHocCodeSigned isRequired:1 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"HasUpdateAvailable" withValue:self->_statusHasUpdateAvailable isRequired:1 defaultValue:0];
  uint64_t v5 = MEMORY[0x263EFFA80];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"DownloadFailed" withValue:self->_statusDownloadFailed isRequired:0 defaultValue:MEMORY[0x263EFFA80]];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"DownloadWaiting" withValue:self->_statusDownloadWaiting isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"DownloadPaused" withValue:self->_statusDownloadPaused isRequired:0 defaultValue:v5];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"DownloadCancelled" withValue:self->_statusDownloadCancelled isRequired:0 defaultValue:v5];
  id v6 = (void *)[v3 copy];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v42.receiver = self;
  v42.super_class = (Class)CEMApplicationListInstalledApplicationsCommand_StatusInstalledApplicationListItem;
  uint64_t v4 = [(CEMPayloadBase *)&v42 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusBundleIdentifier copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSString *)self->_statusExternalVersionIdentifier copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_statusVersion copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_statusShortVersion copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSString *)self->_statusName copy];
  BOOL v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSString *)self->_statusBundleSize copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSString *)self->_statusDynamicSize copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSNumber *)self->_statusIsValidated copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSNumber *)self->_statusInstalling copy];
  id v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSNumber *)self->_statusAppStoreVendable copy];
  id v24 = (void *)v4[11];
  v4[11] = v23;

  uint64_t v25 = [(NSNumber *)self->_statusDeviceBasedVPP copy];
  id v26 = (void *)v4[12];
  v4[12] = v25;

  uint64_t v27 = [(NSNumber *)self->_statusBetaApp copy];
  id v28 = (void *)v4[13];
  v4[13] = v27;

  uint64_t v29 = [(NSNumber *)self->_statusAdHocCodeSigned copy];
  v30 = (void *)v4[14];
  v4[14] = v29;

  uint64_t v31 = [(NSNumber *)self->_statusHasUpdateAvailable copy];
  id v32 = (void *)v4[15];
  v4[15] = v31;

  uint64_t v33 = [(NSNumber *)self->_statusDownloadFailed copy];
  id v34 = (void *)v4[16];
  v4[16] = v33;

  uint64_t v35 = [(NSNumber *)self->_statusDownloadWaiting copy];
  id v36 = (void *)v4[17];
  v4[17] = v35;

  uint64_t v37 = [(NSNumber *)self->_statusDownloadPaused copy];
  v38 = (void *)v4[18];
  v4[18] = v37;

  uint64_t v39 = [(NSNumber *)self->_statusDownloadCancelled copy];
  v40 = (void *)v4[19];
  v4[19] = v39;

  return v4;
}

- (NSString)statusBundleIdentifier
{
  return self->_statusBundleIdentifier;
}

- (void)setStatusBundleIdentifier:(id)a3
{
}

- (NSString)statusExternalVersionIdentifier
{
  return self->_statusExternalVersionIdentifier;
}

- (void)setStatusExternalVersionIdentifier:(id)a3
{
}

- (NSString)statusVersion
{
  return self->_statusVersion;
}

- (void)setStatusVersion:(id)a3
{
}

- (NSString)statusShortVersion
{
  return self->_statusShortVersion;
}

- (void)setStatusShortVersion:(id)a3
{
}

- (NSString)statusName
{
  return self->_statusName;
}

- (void)setStatusName:(id)a3
{
}

- (NSString)statusBundleSize
{
  return self->_statusBundleSize;
}

- (void)setStatusBundleSize:(id)a3
{
}

- (NSString)statusDynamicSize
{
  return self->_statusDynamicSize;
}

- (void)setStatusDynamicSize:(id)a3
{
}

- (NSNumber)statusIsValidated
{
  return self->_statusIsValidated;
}

- (void)setStatusIsValidated:(id)a3
{
}

- (NSNumber)statusInstalling
{
  return self->_statusInstalling;
}

- (void)setStatusInstalling:(id)a3
{
}

- (NSNumber)statusAppStoreVendable
{
  return self->_statusAppStoreVendable;
}

- (void)setStatusAppStoreVendable:(id)a3
{
}

- (NSNumber)statusDeviceBasedVPP
{
  return self->_statusDeviceBasedVPP;
}

- (void)setStatusDeviceBasedVPP:(id)a3
{
}

- (NSNumber)statusBetaApp
{
  return self->_statusBetaApp;
}

- (void)setStatusBetaApp:(id)a3
{
}

- (NSNumber)statusAdHocCodeSigned
{
  return self->_statusAdHocCodeSigned;
}

- (void)setStatusAdHocCodeSigned:(id)a3
{
}

- (NSNumber)statusHasUpdateAvailable
{
  return self->_statusHasUpdateAvailable;
}

- (void)setStatusHasUpdateAvailable:(id)a3
{
}

- (NSNumber)statusDownloadFailed
{
  return self->_statusDownloadFailed;
}

- (void)setStatusDownloadFailed:(id)a3
{
}

- (NSNumber)statusDownloadWaiting
{
  return self->_statusDownloadWaiting;
}

- (void)setStatusDownloadWaiting:(id)a3
{
}

- (NSNumber)statusDownloadPaused
{
  return self->_statusDownloadPaused;
}

- (void)setStatusDownloadPaused:(id)a3
{
}

- (NSNumber)statusDownloadCancelled
{
  return self->_statusDownloadCancelled;
}

- (void)setStatusDownloadCancelled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDownloadCancelled, 0);
  objc_storeStrong((id *)&self->_statusDownloadPaused, 0);
  objc_storeStrong((id *)&self->_statusDownloadWaiting, 0);
  objc_storeStrong((id *)&self->_statusDownloadFailed, 0);
  objc_storeStrong((id *)&self->_statusHasUpdateAvailable, 0);
  objc_storeStrong((id *)&self->_statusAdHocCodeSigned, 0);
  objc_storeStrong((id *)&self->_statusBetaApp, 0);
  objc_storeStrong((id *)&self->_statusDeviceBasedVPP, 0);
  objc_storeStrong((id *)&self->_statusAppStoreVendable, 0);
  objc_storeStrong((id *)&self->_statusInstalling, 0);
  objc_storeStrong((id *)&self->_statusIsValidated, 0);
  objc_storeStrong((id *)&self->_statusDynamicSize, 0);
  objc_storeStrong((id *)&self->_statusBundleSize, 0);
  objc_storeStrong((id *)&self->_statusName, 0);
  objc_storeStrong((id *)&self->_statusShortVersion, 0);
  objc_storeStrong((id *)&self->_statusVersion, 0);
  objc_storeStrong((id *)&self->_statusExternalVersionIdentifier, 0);

  objc_storeStrong((id *)&self->_statusBundleIdentifier, 0);
}

@end