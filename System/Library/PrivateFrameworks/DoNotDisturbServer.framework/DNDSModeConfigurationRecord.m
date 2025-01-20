@interface DNDSModeConfigurationRecord
+ (id)dictionaryRepresentationWithCKRecord:(id)a3 partitionType:(unint64_t)a4;
+ (id)newWithCKRecord:(id)a3;
+ (id)newWithCKRecord:(id)a3 currentRecord:(id)a4;
+ (id)newWithDNDSIDSRecord:(id)a3;
+ (id)newWithDNDSIDSRecord:(id)a3 currentRecord:(id)a4;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
+ (id)newWithDictionaryRepresentation:(id)a3 partitionedDictionaryRepresentation:(id)a4 context:(id)a5;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)lastModifiedByVersion;
- (BOOL)hasSecureData;
- (BOOL)isAutomaticallyGenerated;
- (BOOL)isEqual:(id)a3;
- (BOOL)populateDNDSIDSRecord:(id)a3;
- (BOOL)wasLastModifiedByThisDevice;
- (DNDSConfigurationRecord)configuration;
- (DNDSConfigurationSecureRecord)secureConfiguration;
- (DNDSModeConfigurationRecord)init;
- (DNDSModeConfigurationTriggersRecord)triggers;
- (DNDSModeRecord)mode;
- (NSDate)created;
- (NSDate)lastModified;
- (NSString)description;
- (NSString)lastModifiedByDeviceID;
- (id)_initWithMode:(id)a3 configuration:(id)a4 secureConfiguration:(id)a5 triggers:(id)a6 impactsAvailability:(unint64_t)a7 dimsLockScreen:(unint64_t)a8 created:(id)a9 lastModified:(id)a10 lastModifiedByVersion:(id *)a11 lastModifiedByDeviceID:(id)a12 automaticallyGenerated:(BOOL)a13 compatibilityVersion:(int64_t)a14 ephemeralResolvedCompatibilityVersion:(int64_t)a15 hasSecureData:(BOOL)a16;
- (id)_initWithRecord:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)shortDescription;
- (int64_t)compatibilityVersion;
- (int64_t)ephemeralResolvedCompatibilityVersion;
- (int64_t)populateCKRecord:(id)a3 lastChanceRecord:(id)a4;
- (unint64_t)dimsLockScreen;
- (unint64_t)hash;
- (unint64_t)impactsAvailability;
- (void)log:(id)a3 withMessage:(id)a4;
@end

@implementation DNDSModeConfigurationRecord

- (DNDSModeConfigurationRecord)init
{
  return (DNDSModeConfigurationRecord *)[(DNDSModeConfigurationRecord *)self _initWithRecord:0];
}

- (id)_initWithRecord:(id)a3
{
  id v3 = a3;
  v20 = [v3 mode];
  v19 = [v3 configuration];
  v4 = [v3 secureConfiguration];
  v5 = [v3 triggers];
  uint64_t v17 = [v3 impactsAvailability];
  uint64_t v6 = [v3 dimsLockScreen];
  v7 = [v3 created];
  v8 = [v3 lastModified];
  if (v3) {
    [v3 lastModifiedByVersion];
  }
  else {
    memset(v21, 0, sizeof(v21));
  }
  v9 = [v3 lastModifiedByDeviceID];
  char v10 = [v3 isAutomaticallyGenerated];
  uint64_t v11 = [v3 compatibilityVersion];
  uint64_t v12 = [v3 ephemeralResolvedCompatibilityVersion];
  LOBYTE(v16) = [v3 hasSecureData];
  LOBYTE(v15) = v10;
  id v13 = [(DNDSModeConfigurationRecord *)self _initWithMode:v20 configuration:v19 secureConfiguration:v4 triggers:v5 impactsAvailability:v17 dimsLockScreen:v6 created:v7 lastModified:v8 lastModifiedByVersion:v21 lastModifiedByDeviceID:v9 automaticallyGenerated:v15 compatibilityVersion:v11 ephemeralResolvedCompatibilityVersion:v12 hasSecureData:v16];

  return v13;
}

- (id)_initWithMode:(id)a3 configuration:(id)a4 secureConfiguration:(id)a5 triggers:(id)a6 impactsAvailability:(unint64_t)a7 dimsLockScreen:(unint64_t)a8 created:(id)a9 lastModified:(id)a10 lastModifiedByVersion:(id *)a11 lastModifiedByDeviceID:(id)a12 automaticallyGenerated:(BOOL)a13 compatibilityVersion:(int64_t)a14 ephemeralResolvedCompatibilityVersion:(int64_t)a15 hasSecureData:(BOOL)a16
{
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a6;
  id v25 = a9;
  id v26 = a10;
  id v27 = a12;
  v46.receiver = self;
  v46.super_class = (Class)DNDSModeConfigurationRecord;
  v28 = [(DNDSModeConfigurationRecord *)&v46 init];
  if (v28)
  {
    uint64_t v29 = [v21 copy];
    v30 = (void *)*((void *)v28 + 1);
    *((void *)v28 + 1) = v29;

    uint64_t v31 = [v22 copy];
    v32 = (void *)*((void *)v28 + 2);
    *((void *)v28 + 2) = v31;

    uint64_t v33 = [v23 copy];
    v34 = (void *)*((void *)v28 + 3);
    *((void *)v28 + 3) = v33;

    uint64_t v35 = [v24 copy];
    v36 = (void *)*((void *)v28 + 4);
    *((void *)v28 + 4) = v35;

    *((void *)v28 + 5) = a7;
    *((void *)v28 + 6) = a8;
    uint64_t v37 = [v25 copy];
    v38 = (void *)*((void *)v28 + 7);
    *((void *)v28 + 7) = v37;

    uint64_t v39 = [v26 copy];
    v40 = (void *)*((void *)v28 + 8);
    *((void *)v28 + 8) = v39;

    long long v41 = *(_OWORD *)&a11->var0;
    *((void *)v28 + 11) = a11->var2;
    *(_OWORD *)(v28 + 72) = v41;
    uint64_t v42 = [v27 copy];
    v43 = (void *)*((void *)v28 + 12);
    *((void *)v28 + 12) = v42;

    v28[104] = a13;
    *((void *)v28 + 14) = a14;
    *((void *)v28 + 15) = a15;
    v28[105] = a16;
  }

  return v28;
}

- (void)log:(id)a3 withMessage:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a3;
  id v7 = a4;
  v8 = [(DNDSModeConfigurationRecord *)self mode];
  v9 = [v8 modeIdentifier];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v26 = v9;
    __int16 v27 = 2114;
    id v28 = v7;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Begin: %{public}@", buf, 0x16u);
  }
  char v10 = v6;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(DNDSModeConfigurationRecord *)self shortDescription];
    *(_DWORD *)buf = 138543618;
    id v26 = v9;
    __int16 v27 = 2114;
    id v28 = v11;
    _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@", buf, 0x16u);
  }
  uint64_t v12 = v10;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(DNDSModeConfigurationRecord *)self created];
    v14 = [(DNDSModeConfigurationRecord *)self lastModified];
    [(DNDSModeConfigurationRecord *)self lastModifiedByVersion];
    uint64_t v15 = DNDStringFromOperatingSystemVersion();
    uint64_t v16 = [(DNDSModeConfigurationRecord *)self lastModifiedByDeviceID];
    BOOL v17 = [(DNDSModeConfigurationRecord *)self isAutomaticallyGenerated];
    v18 = objc_msgSend(NSNumber, "numberWithInteger:", -[DNDSModeConfigurationRecord compatibilityVersion](self, "compatibilityVersion"));
    BOOL v19 = [(DNDSModeConfigurationRecord *)self hasSecureData];
    *(_DWORD *)buf = 138545154;
    id v26 = v9;
    __int16 v27 = 2114;
    id v28 = v13;
    __int16 v29 = 2114;
    v30 = v14;
    __int16 v31 = 2114;
    v32 = v15;
    __int16 v33 = 2112;
    v34 = v16;
    __int16 v35 = 1026;
    BOOL v36 = v17;
    __int16 v37 = 2114;
    v38 = v18;
    __int16 v39 = 1026;
    BOOL v40 = v19;
    _os_log_impl(&dword_1D3052000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] created: %{public}@; lastModified: %{public}@; lastModifiedByVersion: %{public}@; lastModifiedByDevic"
      "eID: %@; isAutomaticallyGenerated: %{public}d; compatibilityVersion: %{public}@; hasSecureData: %{public}d; ",
      buf,
      0x4Au);
  }
  v20 = v12;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [(DNDSModeConfigurationRecord *)self triggers];
    *(_DWORD *)buf = 138543619;
    id v26 = v9;
    __int16 v27 = 2113;
    id v28 = v21;
    _os_log_impl(&dword_1D3052000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] triggers: %{private}@", buf, 0x16u);
  }
  id v22 = v20;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = [(DNDSModeConfigurationRecord *)self configuration];
    *(_DWORD *)buf = 138543619;
    id v26 = v9;
    __int16 v27 = 2113;
    id v28 = v23;
    _os_log_impl(&dword_1D3052000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] configuration: %{private}@", buf, 0x16u);
  }
  id v24 = [(DNDSModeConfigurationRecord *)self secureConfiguration];
  [v24 log:v22 withPrefix:v9];

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v9;
    _os_log_impl(&dword_1D3052000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] End", buf, 0xCu);
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(DNDSModeRecord *)self->_mode hash];
  unint64_t v4 = [(DNDSConfigurationRecord *)self->_configuration hash] ^ v3;
  unint64_t v5 = [(DNDSConfigurationSecureRecord *)self->_secureConfiguration hash];
  unint64_t v6 = v4 ^ v5 ^ [(DNDSModeConfigurationTriggersRecord *)self->_triggers hash];
  unint64_t v7 = self->_impactsAvailability ^ self->_dimsLockScreen;
  uint64_t v8 = v7 ^ [(NSDate *)self->_created hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSDate *)self->_lastModified hash];
  return v9 ^ [(NSString *)self->_lastModifiedByDeviceID hash] ^ self->_automaticallyGenerated ^ self->_compatibilityVersion ^ self->_hasSecureData;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5 = (DNDSModeConfigurationRecord *)a3;
  if (self == v5)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v6 = v5;
      unint64_t v7 = [(DNDSModeConfigurationRecord *)self created];
      uint64_t v8 = [(DNDSModeConfigurationRecord *)v6 created];
      if (v7 == v8) {
        goto LABEL_10;
      }
      uint64_t v9 = [(DNDSModeConfigurationRecord *)self created];
      if (!v9) {
        goto LABEL_53;
      }
      char v10 = (void *)v9;
      uint64_t v11 = [(DNDSModeConfigurationRecord *)v6 created];
      if (v11)
      {
        uint64_t v12 = [(DNDSModeConfigurationRecord *)self created];
        unint64_t v3 = [(DNDSModeConfigurationRecord *)v6 created];
        if ([v12 isEqual:v3])
        {
          v91 = v10;
          v92 = v3;
          v93 = v12;
          v94 = v11;
LABEL_10:
          v14 = [(DNDSModeConfigurationRecord *)self lastModified];
          uint64_t v15 = [(DNDSModeConfigurationRecord *)v6 lastModified];
          if (v14 != v15)
          {
            uint64_t v16 = [(DNDSModeConfigurationRecord *)self lastModified];
            if (!v16)
            {

              goto LABEL_49;
            }
            BOOL v17 = (void *)v16;
            v95 = v14;
            uint64_t v18 = [(DNDSModeConfigurationRecord *)v6 lastModified];
            if (v18)
            {
              BOOL v19 = (void *)v18;
              v20 = [(DNDSModeConfigurationRecord *)self lastModified];
              unint64_t v3 = [(DNDSModeConfigurationRecord *)v6 lastModified];
              if ([v20 isEqual:v3])
              {
                v88 = v3;
                v89 = v20;
                v86 = v19;
                v87 = v17;
                goto LABEL_16;
              }
            }
            goto LABEL_49;
          }
          v95 = v14;
LABEL_16:
          id v21 = [(DNDSModeConfigurationRecord *)self lastModifiedByDeviceID];
          id v22 = [(DNDSModeConfigurationRecord *)v6 lastModifiedByDeviceID];
          if (v21 == v22) {
            goto LABEL_24;
          }
          uint64_t v23 = [(DNDSModeConfigurationRecord *)self lastModifiedByDeviceID];
          if (v23)
          {
            v90 = (void *)v23;
            uint64_t v24 = [(DNDSModeConfigurationRecord *)v6 lastModifiedByDeviceID];
            if (v24)
            {
              v85 = (void *)v24;
              id v25 = [(DNDSModeConfigurationRecord *)self lastModifiedByDeviceID];
              unint64_t v3 = [(DNDSModeConfigurationRecord *)v6 lastModifiedByDeviceID];
              if ([v25 isEqual:v3])
              {
                v84 = v25;
LABEL_24:
                [(DNDSModeConfigurationRecord *)self lastModifiedByVersion];
                if (v6) {
                  [(DNDSModeConfigurationRecord *)v6 lastModifiedByVersion];
                }
                if (DNDOperatingSystemVersionCompare())
                {
                  LOBYTE(v13) = 0;
LABEL_30:
                  if (v21 == v22)
                  {
LABEL_33:

                    if (v95 != v15)
                    {
                    }
                    if (v7 == v8) {
                      goto LABEL_54;
                    }

                    goto LABEL_51;
                  }

LABEL_32:
                  goto LABEL_33;
                }
                id v26 = [(DNDSModeConfigurationRecord *)self mode];
                v83 = [(DNDSModeConfigurationRecord *)v6 mode];
                if (v26 == v83)
                {
                  v82 = v26;
LABEL_57:
                  __int16 v33 = [(DNDSModeConfigurationRecord *)self configuration];
                  v78 = [(DNDSModeConfigurationRecord *)v6 configuration];
                  v79 = v33;
                  v81 = v3;
                  if (v33 == v78) {
                    goto LABEL_62;
                  }
                  uint64_t v34 = [(DNDSModeConfigurationRecord *)self configuration];
                  if (v34)
                  {
                    v73 = (void *)v34;
                    uint64_t v35 = [(DNDSModeConfigurationRecord *)v6 configuration];
                    if (!v35)
                    {

                      if (v82 == v83)
                      {
                      }
                      else
                      {
                      }
LABEL_110:
                      if (v21 != v22)
                      {
                      }
                      __int16 v31 = v95;
                      if (v95 == v15) {
                        goto LABEL_46;
                      }
                      goto LABEL_45;
                    }
                    v70 = (void *)v35;
                    BOOL v36 = [(DNDSModeConfigurationRecord *)self configuration];
                    __int16 v37 = [(DNDSModeConfigurationRecord *)v6 configuration];
                    if ([v36 isEqual:v37])
                    {
                      v65 = v37;
                      v66 = v36;
                      unint64_t v3 = v81;
LABEL_62:
                      uint64_t v38 = [(DNDSModeConfigurationRecord *)self secureConfiguration];
                      uint64_t v39 = [(DNDSModeConfigurationRecord *)v6 secureConfiguration];
                      v74 = (void *)v38;
                      BOOL v40 = v38 == v39;
                      uint64_t v41 = (void *)v39;
                      if (v40)
                      {
                        v71 = (void *)v39;
                        goto LABEL_79;
                      }
                      uint64_t v42 = [(DNDSModeConfigurationRecord *)self secureConfiguration];
                      if (v42)
                      {
                        v67 = (void *)v42;
                        uint64_t v43 = [(DNDSModeConfigurationRecord *)v6 secureConfiguration];
                        if (v43)
                        {
                          v71 = v41;
                          v64 = (void *)v43;
                          uint64_t v44 = [(DNDSModeConfigurationRecord *)self secureConfiguration];
                          uint64_t v45 = [(DNDSModeConfigurationRecord *)v6 secureConfiguration];
                          v63 = (void *)v44;
                          objc_super v46 = (void *)v44;
                          v47 = (void *)v45;
                          if ([v46 isEqual:v45])
                          {
                            v61 = v47;
LABEL_79:
                            v50 = [(DNDSModeConfigurationRecord *)self triggers];
                            v68 = [(DNDSModeConfigurationRecord *)v6 triggers];
                            v69 = v50;
                            if (v50 != v68)
                            {
                              uint64_t v51 = [(DNDSModeConfigurationRecord *)self triggers];
                              if (!v51)
                              {

                                LOBYTE(v13) = 0;
LABEL_127:
                                if (v74 != v71)
                                {
                                }
                                if (v79 != v78)
                                {
                                }
                                if (v82 != v83)
                                {
                                }
                                if (v21 == v22) {
                                  goto LABEL_33;
                                }

                                goto LABEL_32;
                              }
                              v62 = (void *)v51;
                              uint64_t v52 = [(DNDSModeConfigurationRecord *)v6 triggers];
                              if (!v52)
                              {
                                LOBYTE(v13) = 0;
LABEL_126:

                                goto LABEL_127;
                              }
                              v60 = (void *)v52;
                              v53 = [(DNDSModeConfigurationRecord *)self triggers];
                              v58 = [(DNDSModeConfigurationRecord *)v6 triggers];
                              v59 = v53;
                              if (!objc_msgSend(v53, "isEqual:"))
                              {
                                LOBYTE(v13) = 0;
LABEL_125:

                                goto LABEL_126;
                              }
                            }
                            unint64_t v54 = [(DNDSModeConfigurationRecord *)self impactsAvailability];
                            if (v54 == [(DNDSModeConfigurationRecord *)v6 impactsAvailability]
                              && (unint64_t v55 = [(DNDSModeConfigurationRecord *)self dimsLockScreen],
                                  v55 == [(DNDSModeConfigurationRecord *)v6 dimsLockScreen])
                              && (BOOL v56 = [(DNDSModeConfigurationRecord *)self isAutomaticallyGenerated], v56 == [(DNDSModeConfigurationRecord *)v6 isAutomaticallyGenerated]))
                            {
                              BOOL v57 = [(DNDSModeConfigurationRecord *)self hasSecureData];
                              BOOL v13 = v57 ^ [(DNDSModeConfigurationRecord *)v6 hasSecureData] ^ 1;
                              if (v69 != v68) {
                                goto LABEL_125;
                              }
                            }
                            else
                            {
                              if (v69 != v68)
                              {

                                LOBYTE(v13) = 0;
LABEL_116:
                                if (v74 != v71)
                                {
                                }
                                if (v79 != v78)
                                {
                                }
                                if (v82 != v83)
                                {
                                }
                                goto LABEL_30;
                              }
                              LOBYTE(v13) = 0;
                            }

                            goto LABEL_116;
                          }

LABEL_98:
                          if (v79 == v78)
                          {
                          }
                          else
                          {
                          }
                          if (v82 != v83)
                          {
                          }
                          if (v21 != v22)
                          {
                          }
                          __int16 v31 = v95;
                          if (v95 == v15) {
                            goto LABEL_46;
                          }
                          goto LABEL_45;
                        }
                      }
                      goto LABEL_98;
                    }

                    v48 = v82;
                    v49 = v83;
                    if (v82 != v83) {
                      goto LABEL_87;
                    }
                  }
                  else
                  {

                    v48 = v82;
                    v49 = v83;
                    if (v82 != v83)
                    {
LABEL_87:

LABEL_89:
                      goto LABEL_110;
                    }
                  }

                  goto LABEL_89;
                }
                uint64_t v27 = [(DNDSModeConfigurationRecord *)self mode];
                if (v27)
                {
                  v77 = (void *)v27;
                  uint64_t v28 = [(DNDSModeConfigurationRecord *)v6 mode];
                  if (v28)
                  {
                    v80 = v3;
                    v82 = v26;
                    v76 = (void *)v28;
                    __int16 v29 = [(DNDSModeConfigurationRecord *)self mode];
                    v30 = [(DNDSModeConfigurationRecord *)v6 mode];
                    if ([v29 isEqual:v30])
                    {
                      v75 = v29;
                      v72 = v30;
                      unint64_t v3 = v80;
                      goto LABEL_57;
                    }

                    if (v21 != v22)
                    {

                      goto LABEL_72;
                    }
                    goto LABEL_73;
                  }
                }
                if (v21 != v22)
                {

LABEL_72:
                  goto LABEL_74;
                }
LABEL_73:

LABEL_74:
                __int16 v31 = v95;
                if (v95 == v15) {
                  goto LABEL_46;
                }
                goto LABEL_45;
              }
            }
          }

          __int16 v31 = v95;
          if (v95 == v15)
          {

            goto LABEL_48;
          }
LABEL_45:

LABEL_46:
LABEL_48:

LABEL_49:
          if (v7 != v8)
          {

            LOBYTE(v13) = 0;
LABEL_51:
            char v10 = v91;
            goto LABEL_52;
          }
LABEL_53:
          LOBYTE(v13) = 0;
          goto LABEL_54;
        }
      }
      LOBYTE(v13) = 0;
LABEL_52:

LABEL_54:
      goto LABEL_55;
    }
    LOBYTE(v13) = 0;
  }
LABEL_55:

  return v13;
}

- (NSString)description
{
  uint64_t v16 = NSString;
  uint64_t v15 = objc_opt_class();
  v14 = [(DNDSModeConfigurationRecord *)self mode];
  BOOL v19 = [(DNDSModeConfigurationRecord *)self configuration];
  uint64_t v18 = [(DNDSModeConfigurationRecord *)self secureConfiguration];
  BOOL v17 = [(DNDSModeConfigurationRecord *)self triggers];
  [(DNDSModeConfigurationRecord *)self impactsAvailability];
  uint64_t v12 = DNDEnabledSettingToString();
  [(DNDSModeConfigurationRecord *)self dimsLockScreen];
  BOOL v13 = DNDEnabledSettingToString();
  unint64_t v3 = [(DNDSModeConfigurationRecord *)self created];
  unint64_t v4 = [(DNDSModeConfigurationRecord *)self lastModified];
  [(DNDSModeConfigurationRecord *)self lastModifiedByVersion];
  unint64_t v5 = DNDStringFromOperatingSystemVersion();
  unint64_t v6 = [(DNDSModeConfigurationRecord *)self lastModifiedByDeviceID];
  unint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSModeConfigurationRecord isAutomaticallyGenerated](self, "isAutomaticallyGenerated"));
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[DNDSModeConfigurationRecord compatibilityVersion](self, "compatibilityVersion"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDSModeConfigurationRecord hasSecureData](self, "hasSecureData"));
  objc_msgSend(v16, "stringWithFormat:", @"<%@: %p; mode: %@; configuration: %@; secureConfiguration: %@; triggers: %@; impactsAvailability: %@; dimsLockScreen: %@; created: %@; lastModified: %@; lastModifiedByVersion: %@; lastModifiedByDeviceID: %@; automaticallyGenerated: %@; compatibilityVersion: %@; hasSecureData: %@>",
    v15,
    self,
    v14,
    v19,
    v18,
    v17,
    v12,
    v13,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
  char v10 = v9);

  return (NSString *)v10;
}

- (id)shortDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(DNDSModeConfigurationRecord *)self mode];
  [(DNDSModeConfigurationRecord *)self impactsAvailability];
  unint64_t v6 = DNDEnabledSettingToString();
  [(DNDSModeConfigurationRecord *)self dimsLockScreen];
  unint64_t v7 = DNDEnabledSettingToString();
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; mode: %@; impactsAvailability: %@; dimsLockScreen: %@>",
    v4,
    self,
    v5,
    v6,
  uint64_t v8 = v7);

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableModeConfigurationRecord alloc];
  return [(DNDSModeConfigurationRecord *)v4 _initWithRecord:self];
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 currentRecord];
  v60 = (objc_class *)a1;
  if (v8)
  {
    uint64_t v9 = [v7 currentRecord];
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {

      uint64_t v8 = 0;
    }
  }
  uint64_t v11 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"mode", objc_opt_class());
  uint64_t v12 = [v8 mode];
  BOOL v13 = (void *)[v7 copyWithCurrentRecord:v12];
  v63 = (void *)v11;
  id v62 = +[DNDSModeRecord newWithDictionaryRepresentation:v11 context:v13];

  uint64_t v14 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"configuration", objc_opt_class());
  uint64_t v15 = [v8 configuration];
  uint64_t v16 = (void *)[v7 copyWithCurrentRecord:v15];
  v59 = (void *)v14;
  id v58 = +[DNDSConfigurationRecord newWithDictionaryRepresentation:v14 context:v16];

  BOOL v17 = [v8 secureConfiguration];
  uint64_t v18 = (void *)[v7 copyWithCurrentRecord:v17];
  id v57 = +[DNDSConfigurationSecureRecord newWithDictionaryRepresentation:MEMORY[0x1E4F1CC08] context:v18];

  uint64_t v19 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"triggers", objc_opt_class());
  v20 = [v8 triggers];
  id v21 = (void *)[v7 copyWithCurrentRecord:v20];
  BOOL v56 = (void *)v19;
  id v55 = +[DNDSModeConfigurationTriggersRecord newWithDictionaryRepresentation:v19 context:v21];

  id v22 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"impactsAvailability", objc_opt_class());
  unint64_t v54 = v22;
  if (v22) {
    uint64_t v52 = [v22 unsignedIntegerValue];
  }
  else {
    uint64_t v52 = 0;
  }
  uint64_t v23 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"dimsLockScreen", objc_opt_class());
  v53 = v23;
  if (v23) {
    uint64_t v50 = [v23 unsignedIntegerValue];
  }
  else {
    uint64_t v50 = 0;
  }
  uint64_t v24 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"lastModified", objc_opt_class());
  id v25 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v51 = v24;
  [v24 doubleValue];
  id v26 = objc_msgSend(v25, "dateWithTimeIntervalSince1970:");
  objc_msgSend(v6, "bs_safeStringForKey:", @"lastModifiedByVersion");
  long long v68 = 0uLL;
  uint64_t v69 = 0;
  v49 = v65 = v7;
  if (v49)
  {
    DNDOperatingSystemVersionFromString();
  }
  else
  {
    long long v68 = *MEMORY[0x1E4F5F540];
    uint64_t v69 = *(void *)(MEMORY[0x1E4F5F540] + 16);
  }
  uint64_t v27 = objc_msgSend(v6, "bs_safeStringForKey:", @"lastModifiedByDeviceID");
  uint64_t v28 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"created", objc_opt_class());
  v48 = v28;
  if (v28)
  {
    __int16 v29 = (void *)MEMORY[0x1E4F1C9C8];
    [v28 doubleValue];
    objc_msgSend(v29, "dateWithTimeIntervalSince1970:");
    id v30 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v30 = v26;
  }
  __int16 v31 = v30;
  v32 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"automaticallyGenerated", objc_opt_class());
  v47 = v32;
  __int16 v33 = v26;
  if (v32) {
    char v46 = [v32 BOOLValue];
  }
  else {
    char v46 = 0;
  }
  uint64_t v34 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"compatibilityVersion", objc_opt_class());
  uint64_t v35 = v34;
  if (v34) {
    uint64_t v36 = [v34 integerValue];
  }
  else {
    uint64_t v36 = 2;
  }
  __int16 v37 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"resolvedCompatibilityVersion", objc_opt_class());
  uint64_t v38 = v37;
  if (v37) {
    uint64_t v39 = [v37 integerValue];
  }
  else {
    uint64_t v39 = 2;
  }
  v64 = v8;
  BOOL v40 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"hasSecureData", objc_opt_class());
  uint64_t v41 = v40;
  if (v40) {
    char v42 = [v40 BOOLValue];
  }
  else {
    char v42 = 0;
  }
  long long v66 = v68;
  uint64_t v67 = v69;
  LOBYTE(v45) = v42;
  LOBYTE(v44) = v46;
  Class v61 = (Class)[[v60 alloc] _initWithMode:v62 configuration:v58 secureConfiguration:v57 triggers:v55 impactsAvailability:v52 dimsLockScreen:v50 created:v31 lastModified:v33 lastModifiedByVersion:&v66 lastModifiedByDeviceID:v27 automaticallyGenerated:v44 compatibilityVersion:v36 ephemeralResolvedCompatibilityVersion:v39 hasSecureData:v45];

  return v61;
}

+ (id)newWithDictionaryRepresentation:(id)a3 partitionedDictionaryRepresentation:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [v9 currentRecord];
  long long v66 = (objc_class *)a1;
  if (v11)
  {
    uint64_t v12 = [v9 currentRecord];
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {

      uint64_t v11 = 0;
    }
  }
  uint64_t v14 = objc_msgSend(v8, "bs_safeObjectForKey:ofType:", @"mode", objc_opt_class());
  uint64_t v15 = [v11 mode];
  uint64_t v16 = (void *)[v9 copyWithCurrentRecord:v15];
  uint64_t v69 = (void *)v14;
  id v68 = +[DNDSModeRecord newWithDictionaryRepresentation:v14 context:v16];

  uint64_t v17 = objc_msgSend(v8, "bs_safeObjectForKey:ofType:", @"configuration", objc_opt_class());
  uint64_t v18 = [v11 configuration];
  uint64_t v19 = (void *)[v9 copyWithCurrentRecord:v18];
  v65 = (void *)v17;
  id v64 = +[DNDSConfigurationRecord newWithDictionaryRepresentation:v17 context:v19];

  uint64_t v20 = objc_msgSend(v10, "bs_safeObjectForKey:ofType:", @"secureConfiguration", objc_opt_class());
  id v21 = [v11 secureConfiguration];
  id v22 = (void *)[v9 copyWithCurrentRecord:v21];
  v63 = (void *)v20;
  id v62 = +[DNDSConfigurationSecureRecord newWithDictionaryRepresentation:v20 context:v22];

  uint64_t v23 = objc_msgSend(v8, "bs_safeObjectForKey:ofType:", @"triggers", objc_opt_class());
  uint64_t v24 = objc_msgSend(v10, "bs_safeObjectForKey:ofType:", @"secureTriggers", objc_opt_class());

  id v25 = [v11 triggers];
  id v26 = (void *)[v9 copyWithCurrentRecord:v25];
  v60 = (void *)v24;
  Class v61 = (void *)v23;
  id v59 = +[DNDSModeConfigurationTriggersRecord newWithDictionaryRepresentation:v23 partitionedDictionaryRepresentation:v24 context:v26];

  uint64_t v27 = objc_msgSend(v8, "bs_safeObjectForKey:ofType:", @"impactsAvailability", objc_opt_class());
  id v58 = v27;
  if (v27) {
    uint64_t v56 = [v27 unsignedIntegerValue];
  }
  else {
    uint64_t v56 = 0;
  }
  uint64_t v28 = objc_msgSend(v8, "bs_safeObjectForKey:ofType:", @"dimsLockScreen", objc_opt_class());
  id v57 = v28;
  if (v28) {
    uint64_t v54 = [v28 unsignedIntegerValue];
  }
  else {
    uint64_t v54 = 0;
  }
  __int16 v29 = objc_msgSend(v8, "bs_safeObjectForKey:ofType:", @"lastModified", objc_opt_class());
  id v30 = (void *)MEMORY[0x1E4F1C9C8];
  id v55 = v29;
  [v29 doubleValue];
  __int16 v31 = objc_msgSend(v30, "dateWithTimeIntervalSince1970:");
  objc_msgSend(v8, "bs_safeStringForKey:", @"lastModifiedByVersion");
  long long v74 = 0uLL;
  v53 = uint64_t v75 = 0;
  if (v53)
  {
    DNDOperatingSystemVersionFromString();
  }
  else
  {
    long long v74 = *MEMORY[0x1E4F5F540];
    uint64_t v75 = *(void *)(MEMORY[0x1E4F5F540] + 16);
  }
  v71 = v9;
  v32 = objc_msgSend(v8, "bs_safeStringForKey:", @"lastModifiedByDeviceID");
  __int16 v33 = objc_msgSend(v8, "bs_safeObjectForKey:ofType:", @"created", objc_opt_class());
  uint64_t v52 = v33;
  if (v33)
  {
    uint64_t v34 = (void *)MEMORY[0x1E4F1C9C8];
    [v33 doubleValue];
    objc_msgSend(v34, "dateWithTimeIntervalSince1970:");
    id v35 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v35 = v31;
  }
  uint64_t v36 = v35;
  __int16 v37 = objc_msgSend(v8, "bs_safeObjectForKey:ofType:", @"automaticallyGenerated", objc_opt_class());
  v70 = v11;
  uint64_t v51 = v37;
  if (v37) {
    char v50 = [v37 BOOLValue];
  }
  else {
    char v50 = 0;
  }
  uint64_t v38 = objc_msgSend(v8, "bs_safeObjectForKey:ofType:", @"compatibilityVersion", objc_opt_class());
  uint64_t v39 = v38;
  if (v38) {
    uint64_t v40 = [v38 integerValue];
  }
  else {
    uint64_t v40 = 2;
  }
  uint64_t v41 = objc_msgSend(v8, "bs_safeObjectForKey:ofType:", @"resolvedCompatibilityVersion", objc_opt_class());
  char v42 = v41;
  if (v41) {
    uint64_t v43 = [v41 integerValue];
  }
  else {
    uint64_t v43 = 2;
  }
  uint64_t v44 = objc_msgSend(v8, "bs_safeObjectForKey:ofType:", @"hasSecureData", objc_opt_class());
  uint64_t v45 = v44;
  if (v44) {
    char v46 = [v44 BOOLValue];
  }
  else {
    char v46 = 0;
  }
  long long v72 = v74;
  uint64_t v73 = v75;
  LOBYTE(v49) = v46;
  LOBYTE(v48) = v50;
  uint64_t v67 = (void *)[[v66 alloc] _initWithMode:v68 configuration:v64 secureConfiguration:v62 triggers:v59 impactsAvailability:v56 dimsLockScreen:v54 created:v36 lastModified:v31 lastModifiedByVersion:&v72 lastModifiedByDeviceID:v32 automaticallyGenerated:v48 compatibilityVersion:v40 ephemeralResolvedCompatibilityVersion:v43 hasSecureData:v49];

  return v67;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 healingSource];
  id v6 = (void *)[v5 mutableCopy];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v9 = v8;

  if (([v4 partitionType] & 2) != 0)
  {
    [v9 setDictionaryRepresentationOfRecord:self->_secureConfiguration forKey:@"secureConfiguration" context:v4];
    [v9 setDictionaryRepresentationOfRecord:self->_triggers forKey:@"secureTriggers" context:v4];
    id v10 = (void *)[(NSString *)self->_lastModifiedByDeviceID copy];
    [v9 setObject:v10 forKeyedSubscript:@"lastModifiedByDeviceID"];
  }
  if ([v4 partitionType])
  {
    [v9 setDictionaryRepresentationOfRecord:self->_mode forKey:@"mode" context:v4];
    [v9 setDictionaryRepresentationOfRecord:self->_configuration forKey:@"configuration" context:v4];
    [v9 setDictionaryRepresentationOfRecord:self->_triggers forKey:@"triggers" context:v4];
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:self->_impactsAvailability];
    [v9 setObject:v11 forKeyedSubscript:@"impactsAvailability"];

    uint64_t v12 = [NSNumber numberWithUnsignedInteger:self->_dimsLockScreen];
    [v9 setObject:v12 forKeyedSubscript:@"dimsLockScreen"];

    BOOL v13 = NSNumber;
    [(NSDate *)self->_created timeIntervalSince1970];
    uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
    [v9 setObject:v14 forKeyedSubscript:@"created"];

    uint64_t v15 = NSNumber;
    [(NSDate *)self->_lastModified timeIntervalSince1970];
    uint64_t v16 = objc_msgSend(v15, "numberWithDouble:");
    [v9 setObject:v16 forKeyedSubscript:@"lastModified"];

    uint64_t v17 = [NSNumber numberWithBool:self->_automaticallyGenerated];
    [v9 setObject:v17 forKeyedSubscript:@"automaticallyGenerated"];

    uint64_t v18 = [NSNumber numberWithInteger:self->_compatibilityVersion];
    [v9 setObject:v18 forKeyedSubscript:@"compatibilityVersion"];

    uint64_t v19 = [NSNumber numberWithInteger:self->_ephemeralResolvedCompatibilityVersion];
    [v9 setObject:v19 forKeyedSubscript:@"resolvedCompatibilityVersion"];

    uint64_t v20 = [NSNumber numberWithBool:self->_hasSecureData];
    [v9 setObject:v20 forKeyedSubscript:@"hasSecureData"];

    long long v23 = *(_OWORD *)&self->_lastModifiedByVersion.majorVersion;
    int64_t patchVersion = self->_lastModifiedByVersion.patchVersion;
    id v21 = DNDStringFromOperatingSystemVersion();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, @"lastModifiedByVersion", v23, patchVersion);

    [v9 setObject:self->_lastModifiedByDeviceID forKeyedSubscript:@"lastModifiedByDeviceID"];
  }

  return v9;
}

- (BOOL)wasLastModifiedByThisDevice
{
  unint64_t v3 = [(DNDSModeConfigurationRecord *)self lastModifiedByDeviceID];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    [(DNDSModeConfigurationRecord *)self lastModifiedByVersion];
    BOOL v4 = DNDOperatingSystemVersionCompare() != 0;
  }

  return v4;
}

- (DNDSModeRecord)mode
{
  return self->_mode;
}

- (DNDSConfigurationRecord)configuration
{
  return self->_configuration;
}

- (DNDSConfigurationSecureRecord)secureConfiguration
{
  return self->_secureConfiguration;
}

- (DNDSModeConfigurationTriggersRecord)triggers
{
  return self->_triggers;
}

- (unint64_t)impactsAvailability
{
  return self->_impactsAvailability;
}

- (unint64_t)dimsLockScreen
{
  return self->_dimsLockScreen;
}

- (NSDate)created
{
  return self->_created;
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)lastModifiedByVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[3];
  return self;
}

- (NSString)lastModifiedByDeviceID
{
  return self->_lastModifiedByDeviceID;
}

- (BOOL)isAutomaticallyGenerated
{
  return self->_automaticallyGenerated;
}

- (BOOL)hasSecureData
{
  return self->_hasSecureData;
}

- (int64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (int64_t)ephemeralResolvedCompatibilityVersion
{
  return self->_ephemeralResolvedCompatibilityVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedByDeviceID, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_secureConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

+ (id)dictionaryRepresentationWithCKRecord:(id)a3 partitionType:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a4 == 1)
  {
    id v6 = @"Main";
    id v7 = kDNDSModeConfigurationsRecordMainPartitionKey;
  }
  else
  {
    if (a4 != 2)
    {
      id v14 = 0;
      goto LABEL_17;
    }
    id v6 = @"Secondary";
    id v7 = kDNDSModeConfigurationsRecordSecondaryPartitionKey;
  }
  id v8 = *v7;
  id v9 = [v5 encryptedValues];
  id v10 = [v9 objectForKey:v8];

  if (v10)
  {
    id v20 = 0;
    uint64_t v11 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v10 options:0 error:&v20];
    id v12 = v20;
    if (v12)
    {
      BOOL v13 = (void *)DNDSLogModeConfigurations;
      if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = v13;
        uint64_t v18 = [v5 recordID];
        uint64_t v19 = [v18 recordName];
        *(_DWORD *)buf = 138412802;
        id v22 = v6;
        __int16 v23 = 2114;
        uint64_t v24 = v19;
        __int16 v25 = 2114;
        id v26 = v12;
        _os_log_error_impl(&dword_1D3052000, v17, OS_LOG_TYPE_ERROR, "Failed to decode %@ partition data %{public}@: %{public}@", buf, 0x20u);
      }
      id v14 = 0;
    }
    else
    {
      id v14 = v11;
    }
  }
  else
  {
    uint64_t v15 = (void *)DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
      +[DNDSModeConfigurationRecord(CKRecord) dictionaryRepresentationWithCKRecord:partitionType:]((uint64_t)v6, v15, v5);
    }
    id v14 = 0;
  }

LABEL_17:
  return v14;
}

+ (id)newWithCKRecord:(id)a3
{
  return (id)[a1 newWithCKRecord:a3 currentRecord:0];
}

+ (id)newWithCKRecord:(id)a3 currentRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 dictionaryRepresentationWithCKRecord:v6 partitionType:1];
  if (v8)
  {
    id v9 = [a1 dictionaryRepresentationWithCKRecord:v6 partitionType:2];
    if (v9)
    {
      id v10 = objc_alloc_init(DNDSApplicationIdentifierMapper);
      uint64_t v11 = objc_alloc_init(DNDSContactProvider);
      id v12 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:1 partitionType:3 currentRecord:v7 redactSensitiveData:0 contactProvider:v11 applicationIdentifierMapper:v10];
      id v13 = +[DNDSModeConfigurationRecord newWithDictionaryRepresentation:v8 partitionedDictionaryRepresentation:v9 context:v12];
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (int64_t)populateCKRecord:(id)a3 lastChanceRecord:(id)a4
{
  id v37 = a3;
  id v6 = a4;
  id v7 = [v6 creationDate];

  id v8 = [(DNDSModeConfigurationRecord *)self created];
  id v9 = [v6 creationDate];
  uint64_t v10 = [v8 compare:v9];

  int64_t v11 = [(DNDSModeConfigurationRecord *)self ephemeralResolvedCompatibilityVersion];
  id v12 = [v6 objectForKeyedSubscript:@"DNDSModeConfigurationsVersion"];
  uint64_t v13 = [v12 integerValue];
  if (v7) {
    BOOL v14 = v10 == 1;
  }
  else {
    BOOL v14 = 1;
  }
  int v16 = !v14 && v11 >= v13;

  int v35 = v16;
  if (v16 == 1)
  {
    uint64_t v17 = [(id)objc_opt_class() dictionaryRepresentationWithCKRecord:v6 partitionType:1];
    uint64_t v18 = [(id)objc_opt_class() dictionaryRepresentationWithCKRecord:v6 partitionType:2];
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v17 = 0;
  }
  uint64_t v19 = objc_alloc_init(DNDSApplicationIdentifierMapper);
  id v20 = objc_alloc_init(DNDSContactProvider);
  id v21 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:0 partitionType:1 healingSource:v17 redactSensitiveData:0 contactProvider:v20 applicationIdentifierMapper:v19];
  id v22 = [(DNDSModeConfigurationRecord *)self dictionaryRepresentationWithContext:v21];
  uint64_t v36 = (void *)v18;
  __int16 v23 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:0 partitionType:2 healingSource:v18 redactSensitiveData:0 contactProvider:v20 applicationIdentifierMapper:v19];

  uint64_t v24 = [(DNDSModeConfigurationRecord *)self dictionaryRepresentationWithContext:v23];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v22]
    && [MEMORY[0x1E4F28D90] isValidJSONObject:v24])
  {
    uint64_t v34 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v22 options:0 error:0];
    __int16 v33 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v24 options:0 error:0];
    __int16 v25 = [v37 encryptedValues];
    [v25 setObject:v34 forKey:@"DNDSModeConfigurationsRecordMainPartition"];

    id v26 = [v37 encryptedValues];
    [v26 setObject:v33 forKey:@"DNDSModeConfigurationsRecordSecondaryPartition"];

    uint64_t v27 = objc_msgSend(NSNumber, "numberWithInteger:", -[DNDSModeConfigurationRecord ephemeralResolvedCompatibilityVersion](self, "ephemeralResolvedCompatibilityVersion"));
    [v37 setObject:v27 forKeyedSubscript:@"DNDSModeConfigurationsVersion"];

    uint64_t v28 = objc_msgSend(NSNumber, "numberWithInteger:", -[DNDSModeConfigurationRecord ephemeralResolvedCompatibilityVersion](self, "ephemeralResolvedCompatibilityVersion"));
    __int16 v29 = DNDSModeConfigurationsMinimumRequiredVersionForConfigurationVersion(v28);
    [v37 setObject:v29 forKeyedSubscript:@"DNDSModeConfigurationsMinimumRequiredVersion"];

    if (v35) {
      int64_t v30 = 2;
    }
    else {
      int64_t v30 = 1;
    }
  }
  else
  {
    __int16 v31 = (void *)DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
      -[DNDSModeConfigurationRecord(CKRecord) populateCKRecord:lastChanceRecord:].cold.4(v31, v37);
    }
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
      -[DNDSModeConfigurationRecord(CKRecord) populateCKRecord:lastChanceRecord:]();
    }
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
      -[DNDSModeConfigurationRecord(CKRecord) populateCKRecord:lastChanceRecord:]();
    }
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
      -[DNDSModeConfigurationRecord(CKRecord) populateCKRecord:lastChanceRecord:]();
    }
    int64_t v30 = 0;
  }

  return v30;
}

+ (id)newWithDNDSIDSRecord:(id)a3
{
  return (id)[a1 newWithDNDSIDSRecord:a3 currentRecord:0];
}

+ (id)newWithDNDSIDSRecord:(id)a3 currentRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKey:@"DNDSModeConfigurationsRecordData"];
  uint64_t v8 = [v5 objectForKey:@"DNDSModeConfigurationsRecordPartitionedData"];
  id v9 = (void *)v8;
  if (!v7)
  {
    uint64_t v15 = (void *)DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
      +[DNDSModeConfigurationRecord(DNDSIDSRecord) newWithDNDSIDSRecord:currentRecord:](v15, v5);
    }
    goto LABEL_11;
  }
  if (!v8)
  {
    int v16 = (void *)DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
      +[DNDSModeConfigurationRecord(DNDSIDSRecord) newWithDNDSIDSRecord:currentRecord:](v16, v5);
    }
LABEL_11:
    id v14 = 0;
    goto LABEL_19;
  }
  id v24 = 0;
  uint64_t v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v24];
  id v11 = v24;
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = (void *)DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
      +[DNDSModeConfigurationRecord(DNDSIDSRecord) newWithDNDSIDSRecord:currentRecord:].cold.4(v13, v5);
    }
    id v14 = 0;
  }
  else
  {
    id v23 = 0;
    uint64_t v17 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v9 options:0 error:&v23];
    id v12 = v23;
    if (v12)
    {
      uint64_t v18 = (void *)DNDSLogModeConfigurations;
      if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
        +[DNDSModeConfigurationRecord(DNDSIDSRecord) newWithDNDSIDSRecord:currentRecord:](v18, v5);
      }
      id v14 = 0;
    }
    else
    {
      id v22 = objc_alloc_init(DNDSApplicationIdentifierMapper);
      uint64_t v19 = objc_alloc_init(DNDSContactProvider);
      id v20 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:1 partitionType:3 currentRecord:v6 redactSensitiveData:0 contactProvider:v19 applicationIdentifierMapper:v22];
      id v14 = +[DNDSModeConfigurationRecord newWithDictionaryRepresentation:v10 partitionedDictionaryRepresentation:v17 context:v20];
    }
  }

LABEL_19:
  return v14;
}

- (BOOL)populateDNDSIDSRecord:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(DNDSApplicationIdentifierMapper);
  id v6 = objc_alloc_init(DNDSContactProvider);
  id v7 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:0 partitionType:1 redactSensitiveData:0 contactProvider:v6 applicationIdentifierMapper:v5];
  uint64_t v8 = [(DNDSModeConfigurationRecord *)self dictionaryRepresentationWithContext:v7];
  id v9 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:0 partitionType:2 redactSensitiveData:0 contactProvider:v6 applicationIdentifierMapper:v5];

  uint64_t v10 = [(DNDSModeConfigurationRecord *)self dictionaryRepresentationWithContext:v9];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v8]
    && [MEMORY[0x1E4F28D90] isValidJSONObject:v10])
  {
    id v11 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v8 options:0 error:0];
    id v12 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v10 options:0 error:0];
    [v4 setObject:v11 forKey:@"DNDSModeConfigurationsRecordData"];
    [v4 setObject:v12 forKey:@"DNDSModeConfigurationsRecordPartitionedData"];
    [v4 setObject:&unk_1F2A5DA90 forKey:@"DNDSModeConfigurationsVersion"];
    [v4 setObject:&unk_1F2A5DA90 forKey:@"DNDSModeConfigurationsMinimumRequiredVersion"];

    BOOL v13 = 1;
  }
  else
  {
    id v14 = (void *)DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
      -[DNDSModeConfigurationRecord(DNDSIDSRecord) populateDNDSIDSRecord:].cold.4(v14, v4);
    }
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
      -[DNDSModeConfigurationRecord(DNDSIDSRecord) populateDNDSIDSRecord:]();
    }
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
      -[DNDSModeConfigurationRecord(DNDSIDSRecord) populateDNDSIDSRecord:]();
    }
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
      -[DNDSModeConfigurationRecord(DNDSIDSRecord) populateDNDSIDSRecord:]();
    }
    BOOL v13 = 0;
  }

  return v13;
}

@end