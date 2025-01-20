@interface CEMDeviceInformationCommand_StatusQueryResponsesOSUpdateSettings
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithCatalogURL:(id)a3 withIsDefaultCatalog:(id)a4 withPreviousScanDate:(id)a5 withPreviousScanResult:(id)a6 withPerformPeriodicCheck:(id)a7 withAutomaticCheckEnabled:(id)a8 withBackgroundDownloadEnabled:(id)a9 withAutomaticAppInstallationEnabled:(id)a10 withAutomaticOSInstallationEnabled:(id)a11 withAutomaticSecurityUpdatesEnabled:(id)a12;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (NSDate)statusPreviousScanDate;
- (NSNumber)statusAutomaticAppInstallationEnabled;
- (NSNumber)statusAutomaticCheckEnabled;
- (NSNumber)statusAutomaticOSInstallationEnabled;
- (NSNumber)statusAutomaticSecurityUpdatesEnabled;
- (NSNumber)statusBackgroundDownloadEnabled;
- (NSNumber)statusIsDefaultCatalog;
- (NSNumber)statusPerformPeriodicCheck;
- (NSString)statusCatalogURL;
- (NSString)statusPreviousScanResult;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setStatusAutomaticAppInstallationEnabled:(id)a3;
- (void)setStatusAutomaticCheckEnabled:(id)a3;
- (void)setStatusAutomaticOSInstallationEnabled:(id)a3;
- (void)setStatusAutomaticSecurityUpdatesEnabled:(id)a3;
- (void)setStatusBackgroundDownloadEnabled:(id)a3;
- (void)setStatusCatalogURL:(id)a3;
- (void)setStatusIsDefaultCatalog:(id)a3;
- (void)setStatusPerformPeriodicCheck:(id)a3;
- (void)setStatusPreviousScanDate:(id)a3;
- (void)setStatusPreviousScanResult:(id)a3;
@end

@implementation CEMDeviceInformationCommand_StatusQueryResponsesOSUpdateSettings

+ (NSSet)allowedStatusKeys
{
  v6[10] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"CatalogURL";
  v6[1] = @"IsDefaultCatalog";
  v6[2] = @"PreviousScanDate";
  v6[3] = @"PreviousScanResult";
  v6[4] = @"PerformPeriodicCheck";
  v6[5] = @"AutomaticCheckEnabled";
  v6[6] = @"BackgroundDownloadEnabled";
  v6[7] = @"AutomaticAppInstallationEnabled";
  v6[8] = @"AutomaticOSInstallationEnabled";
  v6[9] = @"AutomaticSecurityUpdatesEnabled";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:10];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithCatalogURL:(id)a3 withIsDefaultCatalog:(id)a4 withPreviousScanDate:(id)a5 withPreviousScanResult:(id)a6 withPerformPeriodicCheck:(id)a7 withAutomaticCheckEnabled:(id)a8 withBackgroundDownloadEnabled:(id)a9 withAutomaticAppInstallationEnabled:(id)a10 withAutomaticOSInstallationEnabled:(id)a11 withAutomaticSecurityUpdatesEnabled:(id)a12
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
  v26 = objc_opt_new();
  [v26 setStatusCatalogURL:v25];

  [v26 setStatusIsDefaultCatalog:v24];
  [v26 setStatusPreviousScanDate:v23];

  [v26 setStatusPreviousScanResult:v22];
  [v26 setStatusPerformPeriodicCheck:v21];

  [v26 setStatusAutomaticCheckEnabled:v20];
  [v26 setStatusBackgroundDownloadEnabled:v19];

  [v26 setStatusAutomaticAppInstallationEnabled:v18];
  [v26 setStatusAutomaticOSInstallationEnabled:v28];

  [v26 setStatusAutomaticSecurityUpdatesEnabled:v29];

  return v26;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v47[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMDeviceInformationCommand_StatusQueryResponsesOSUpdateSettings allowedStatusKeys];
  [v9 minusSet:v10];

  if ([v9 count])
  {
    if (!a4)
    {
      BOOL v14 = 0;
      goto LABEL_19;
    }
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v46 = *MEMORY[0x263F08320];
    id v12 = [NSString stringWithFormat:@"Unexpected payload keys: %@", v9];
    v47[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
    *a4 = [v11 errorWithDomain:@"error" code:1 userInfo:v13];

    BOOL v14 = 0;
  }
  else
  {
    id v45 = 0;
    v15 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CatalogURL" isRequired:0 defaultValue:0 error:&v45];
    id v12 = v45;
    statusCatalogURL = self->_statusCatalogURL;
    self->_statusCatalogURL = v15;

    if (!v12)
    {
      id v44 = 0;
      v17 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"IsDefaultCatalog" isRequired:0 defaultValue:0 error:&v44];
      id v12 = v44;
      statusIsDefaultCatalog = self->_statusIsDefaultCatalog;
      self->_statusIsDefaultCatalog = v17;

      if (!v12)
      {
        id v43 = 0;
        id v19 = [(CEMPayloadBase *)self loadDateFromDictionary:v6 withKey:@"PreviousScanDate" isRequired:0 defaultValue:0 error:&v43];
        id v12 = v43;
        statusPreviousScanDate = self->_statusPreviousScanDate;
        self->_statusPreviousScanDate = v19;

        if (!v12)
        {
          id v42 = 0;
          id v21 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"PreviousScanResult" isRequired:0 defaultValue:0 error:&v42];
          id v12 = v42;
          statusPreviousScanResult = self->_statusPreviousScanResult;
          self->_statusPreviousScanResult = v21;

          if (!v12)
          {
            id v41 = 0;
            id v23 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"PerformPeriodicCheck" isRequired:0 defaultValue:0 error:&v41];
            id v12 = v41;
            statusPerformPeriodicCheck = self->_statusPerformPeriodicCheck;
            self->_statusPerformPeriodicCheck = v23;

            if (!v12)
            {
              id v40 = 0;
              id v25 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AutomaticCheckEnabled" isRequired:0 defaultValue:0 error:&v40];
              id v12 = v40;
              statusAutomaticCheckEnabled = self->_statusAutomaticCheckEnabled;
              self->_statusAutomaticCheckEnabled = v25;

              if (!v12)
              {
                id v39 = 0;
                v27 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"BackgroundDownloadEnabled" isRequired:0 defaultValue:0 error:&v39];
                id v12 = v39;
                statusBackgroundDownloadEnabled = self->_statusBackgroundDownloadEnabled;
                self->_statusBackgroundDownloadEnabled = v27;

                if (!v12)
                {
                  id v38 = 0;
                  id v29 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AutomaticAppInstallationEnabled" isRequired:0 defaultValue:0 error:&v38];
                  id v12 = v38;
                  statusAutomaticAppInstallationEnabled = self->_statusAutomaticAppInstallationEnabled;
                  self->_statusAutomaticAppInstallationEnabled = v29;

                  if (!v12)
                  {
                    id v37 = 0;
                    v31 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AutomaticOSInstallationEnabled" isRequired:0 defaultValue:0 error:&v37];
                    id v12 = v37;
                    statusAutomaticOSInstallationEnabled = self->_statusAutomaticOSInstallationEnabled;
                    self->_statusAutomaticOSInstallationEnabled = v31;

                    if (!v12)
                    {
                      id v36 = 0;
                      v33 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AutomaticSecurityUpdatesEnabled" isRequired:0 defaultValue:0 error:&v36];
                      id v12 = v36;
                      statusAutomaticSecurityUpdatesEnabled = self->_statusAutomaticSecurityUpdatesEnabled;
                      self->_statusAutomaticSecurityUpdatesEnabled = v33;
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

LABEL_19:
  return v14;
}

- (id)serializePayload
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"CatalogURL" withValue:self->_statusCatalogURL isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"IsDefaultCatalog" withValue:self->_statusIsDefaultCatalog isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeDateIntoDictionary:v3 withKey:@"PreviousScanDate" withValue:self->_statusPreviousScanDate isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"PreviousScanResult" withValue:self->_statusPreviousScanResult isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"PerformPeriodicCheck" withValue:self->_statusPerformPeriodicCheck isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"AutomaticCheckEnabled" withValue:self->_statusAutomaticCheckEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"BackgroundDownloadEnabled" withValue:self->_statusBackgroundDownloadEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"AutomaticAppInstallationEnabled" withValue:self->_statusAutomaticAppInstallationEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"AutomaticOSInstallationEnabled" withValue:self->_statusAutomaticOSInstallationEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"AutomaticSecurityUpdatesEnabled" withValue:self->_statusAutomaticSecurityUpdatesEnabled isRequired:0 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v26.receiver = self;
  v26.super_class = (Class)CEMDeviceInformationCommand_StatusQueryResponsesOSUpdateSettings;
  v4 = [(CEMPayloadBase *)&v26 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusCatalogURL copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSNumber *)self->_statusIsDefaultCatalog copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSDate *)self->_statusPreviousScanDate copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSString *)self->_statusPreviousScanResult copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_statusPerformPeriodicCheck copy];
  BOOL v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSNumber *)self->_statusAutomaticCheckEnabled copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSNumber *)self->_statusBackgroundDownloadEnabled copy];
  id v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSNumber *)self->_statusAutomaticAppInstallationEnabled copy];
  id v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSNumber *)self->_statusAutomaticOSInstallationEnabled copy];
  id v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSNumber *)self->_statusAutomaticSecurityUpdatesEnabled copy];
  id v24 = (void *)v4[11];
  v4[11] = v23;

  return v4;
}

- (NSString)statusCatalogURL
{
  return self->_statusCatalogURL;
}

- (void)setStatusCatalogURL:(id)a3
{
}

- (NSNumber)statusIsDefaultCatalog
{
  return self->_statusIsDefaultCatalog;
}

- (void)setStatusIsDefaultCatalog:(id)a3
{
}

- (NSDate)statusPreviousScanDate
{
  return self->_statusPreviousScanDate;
}

- (void)setStatusPreviousScanDate:(id)a3
{
}

- (NSString)statusPreviousScanResult
{
  return self->_statusPreviousScanResult;
}

- (void)setStatusPreviousScanResult:(id)a3
{
}

- (NSNumber)statusPerformPeriodicCheck
{
  return self->_statusPerformPeriodicCheck;
}

- (void)setStatusPerformPeriodicCheck:(id)a3
{
}

- (NSNumber)statusAutomaticCheckEnabled
{
  return self->_statusAutomaticCheckEnabled;
}

- (void)setStatusAutomaticCheckEnabled:(id)a3
{
}

- (NSNumber)statusBackgroundDownloadEnabled
{
  return self->_statusBackgroundDownloadEnabled;
}

- (void)setStatusBackgroundDownloadEnabled:(id)a3
{
}

- (NSNumber)statusAutomaticAppInstallationEnabled
{
  return self->_statusAutomaticAppInstallationEnabled;
}

- (void)setStatusAutomaticAppInstallationEnabled:(id)a3
{
}

- (NSNumber)statusAutomaticOSInstallationEnabled
{
  return self->_statusAutomaticOSInstallationEnabled;
}

- (void)setStatusAutomaticOSInstallationEnabled:(id)a3
{
}

- (NSNumber)statusAutomaticSecurityUpdatesEnabled
{
  return self->_statusAutomaticSecurityUpdatesEnabled;
}

- (void)setStatusAutomaticSecurityUpdatesEnabled:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusAutomaticSecurityUpdatesEnabled, 0);
  objc_storeStrong((id *)&self->_statusAutomaticOSInstallationEnabled, 0);
  objc_storeStrong((id *)&self->_statusAutomaticAppInstallationEnabled, 0);
  objc_storeStrong((id *)&self->_statusBackgroundDownloadEnabled, 0);
  objc_storeStrong((id *)&self->_statusAutomaticCheckEnabled, 0);
  objc_storeStrong((id *)&self->_statusPerformPeriodicCheck, 0);
  objc_storeStrong((id *)&self->_statusPreviousScanResult, 0);
  objc_storeStrong((id *)&self->_statusPreviousScanDate, 0);
  objc_storeStrong((id *)&self->_statusIsDefaultCatalog, 0);

  objc_storeStrong((id *)&self->_statusCatalogURL, 0);
}

@end