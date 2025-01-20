@interface DMTWiFiPayload
+ (NSSet)supportedPayloadTypes;
- (BOOL)autoJoin;
- (DMTWiFiPayload)initWithDictionary:(id)a3 error:(id *)a4;
- (NSArray)acceptEAPTypes;
- (NSArray)certificateAnchorUUID;
- (NSDictionary)eapClientConfiguration;
- (NSString)encryptionType;
- (NSString)ssid;
@end

@implementation DMTWiFiPayload

+ (NSSet)supportedPayloadTypes
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithObject:@"com.apple.wifi.managed"];
}

- (DMTWiFiPayload)initWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v48.receiver = self;
  v48.super_class = (Class)DMTWiFiPayload;
  v7 = [(DMTConfigurationPrimitive *)&v48 initWithDictionary:v6 error:a4];
  if (v7)
  {
    v7->_autoJoin = DMTValidateProfileBoolean(v6, @"AutoJoin", 1, 1, a4);
    uint64_t v8 = DMTValidateProfileString(v6, @"EncryptionType", 1, a4);
    encryptionType = v7->_encryptionType;
    v7->_encryptionType = (NSString *)v8;

    uint64_t v10 = DMTValidateProfileString(v6, @"SSID_STR", 1, a4);
    ssid = v7->_ssid;
    v7->_ssid = (NSString *)v10;

    uint64_t v12 = DMTValidateProfileDictionary(v6, @"EAPClientConfiguration", 1, a4);
    eapClientConfiguration = v7->_eapClientConfiguration;
    v7->_eapClientConfiguration = (NSDictionary *)v12;

    if (!*a4)
    {
      v16 = v7->_eapClientConfiguration;
      if (v16)
      {
        uint64_t v17 = DMTValidateProfileArray(v16, @"AcceptEAPTypes", 0, a4);
        acceptEAPTypes = v7->_acceptEAPTypes;
        v7->_acceptEAPTypes = (NSArray *)v17;

        v19 = v7->_acceptEAPTypes;
        if (!v19) {
          goto LABEL_3;
        }
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        obuint64_t j = v19;
        uint64_t v20 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v50 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v45;
          while (2)
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v45 != v22) {
                objc_enumerationMutation(obj);
              }
              id v24 = *(id *)(*((void *)&v44 + 1) + 8 * i);
              if (v24)
              {
                v25 = v24;
                CFTypeID v26 = CFGetTypeID(v24);
                CFTypeID TypeID = CFNumberGetTypeID();

                if (v26 == TypeID) {
                  continue;
                }
              }
              DMTErrorWithCodeAndUserInfo(71, &unk_26E115868);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_3;
            }
            uint64_t v21 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v50 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }

        uint64_t v28 = DMTValidateProfileArray(v7->_eapClientConfiguration, @"PayloadCertificateAnchorUUID", 1, a4);
        certificateAnchorUUID = v7->_certificateAnchorUUID;
        v7->_certificateAnchorUUID = (NSArray *)v28;

        if (*a4) {
          goto LABEL_3;
        }
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        v30 = v7->_certificateAnchorUUID;
        uint64_t v31 = [(NSArray *)v30 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v41;
          while (2)
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v41 != v33) {
                objc_enumerationMutation(v30);
              }
              id v35 = *(id *)(*((void *)&v40 + 1) + 8 * j);
              if (v35)
              {
                v36 = v35;
                CFTypeID v37 = CFGetTypeID(v35);
                CFTypeID v38 = CFStringGetTypeID();

                if (v37 == v38) {
                  continue;
                }
              }
              DMTErrorWithCodeAndUserInfo(71, &unk_26E115890);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_3;
            }
            uint64_t v32 = [(NSArray *)v30 countByEnumeratingWithState:&v40 objects:v49 count:16];
            if (v32) {
              continue;
            }
            break;
          }
        }
      }
      v14 = v7;
      goto LABEL_4;
    }
  }
LABEL_3:
  v14 = 0;
LABEL_4:

  return v14;
}

- (BOOL)autoJoin
{
  return self->_autoJoin;
}

- (NSString)encryptionType
{
  return self->_encryptionType;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (NSDictionary)eapClientConfiguration
{
  return self->_eapClientConfiguration;
}

- (NSArray)acceptEAPTypes
{
  return self->_acceptEAPTypes;
}

- (NSArray)certificateAnchorUUID
{
  return self->_certificateAnchorUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateAnchorUUID, 0);
  objc_storeStrong((id *)&self->_acceptEAPTypes, 0);
  objc_storeStrong((id *)&self->_eapClientConfiguration, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_encryptionType, 0);
}

@end