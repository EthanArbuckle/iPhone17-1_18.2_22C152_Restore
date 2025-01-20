@interface DNDModeConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)defaultModeConfiguration;
+ (id)defaultReduceInterruptionsMode;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)lastModifiedByVersion;
- (BOOL)_containsSecureTriggers:(id)a3;
- (BOOL)hasSecureData;
- (BOOL)isAutomaticallyGenerated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupportedConfiguration;
- (DNDConfiguration)configuration;
- (DNDMode)mode;
- (DNDModeConfiguration)initWithCoder:(id)a3;
- (DNDModeConfiguration)initWithMode:(id)a3 configuration:(id)a4 triggers:(id)a5;
- (DNDModeConfiguration)initWithMode:(id)a3 configuration:(id)a4 triggers:(id)a5 impactsAvailability:(unint64_t)a6 dimsLockScreen:(unint64_t)a7 created:(id)a8 lastModified:(id)a9 automaticallyGenerated:(BOOL)a10 compatibilityVersion:(int64_t)a11 lastModifiedByVersion:(id *)a12 lastModifiedByDeviceID:(id)a13;
- (NSArray)triggers;
- (NSDate)created;
- (NSDate)lastModified;
- (NSString)description;
- (NSString)lastModifiedByDeviceID;
- (id)_initWithModeConfiguration:(id)a3;
- (id)mergeDecision:(id)a3 reason:(id)a4;
- (id)mergeWithRemoteModeConfiguration:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)shortDescription;
- (int64_t)_maxTriggerCompatibilityVersion:(id)a3;
- (int64_t)compatibilityVersion;
- (int64_t)rawResolvedCompatibilityVersion;
- (int64_t)resolvedCompatibilityVersion;
- (unint64_t)allowSmartEntry;
- (unint64_t)dimsLockScreen;
- (unint64_t)hash;
- (unint64_t)impactsAvailability;
- (void)diffAgainstObject:(id)a3 usingDiffBuilder:(id)a4 withDescription:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)log:(id)a3 withMessage:(id)a4;
@end

@implementation DNDModeConfiguration

+ (id)defaultModeConfiguration
{
  v2 = +[DNDMode defaultMode];
  v3 = +[DNDMutableConfiguration defaultConfiguration];
  v4 = [DNDMutableModeConfiguration alloc];
  v5 = [(DNDModeConfiguration *)v4 initWithMode:v2 configuration:v3 triggers:MEMORY[0x1E4F1CBF0]];
  [(DNDMutableModeConfiguration *)v5 setAutomaticallyGenerated:1];

  return v5;
}

+ (id)defaultReduceInterruptionsMode
{
  v2 = +[DNDMode defaultReduceInterruptionsMode];
  v3 = +[DNDMutableConfiguration defaultConfiguration];
  [v3 setAllowIntelligentManagement:2];
  [v3 setHideApplicationBadges:1];
  v4 = [v3 phoneCallBypassSettings];
  v5 = (void *)[v4 mutableCopy];

  [v5 setImmediateBypassEventSourceType:1];
  [v3 setPhoneCallBypassSettings:v5];
  v6 = [DNDMutableModeConfiguration alloc];
  v7 = [(DNDModeConfiguration *)v6 initWithMode:v2 configuration:v3 triggers:MEMORY[0x1E4F1CBF0]];
  [(DNDMutableModeConfiguration *)v7 setAutomaticallyGenerated:1];

  return v7;
}

- (DNDModeConfiguration)initWithMode:(id)a3 configuration:(id)a4 triggers:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F1C9C8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 date];
  long long v16 = DNDOperatingSystemVersionNotSet;
  uint64_t v17 = -1;
  LOBYTE(v15) = 0;
  v13 = [(DNDModeConfiguration *)self initWithMode:v11 configuration:v10 triggers:v9 impactsAvailability:0 dimsLockScreen:0 created:v12 lastModified:v12 automaticallyGenerated:v15 compatibilityVersion:2 lastModifiedByVersion:&v16 lastModifiedByDeviceID:0];

  return v13;
}

- (DNDModeConfiguration)initWithMode:(id)a3 configuration:(id)a4 triggers:(id)a5 impactsAvailability:(unint64_t)a6 dimsLockScreen:(unint64_t)a7 created:(id)a8 lastModified:(id)a9 automaticallyGenerated:(BOOL)a10 compatibilityVersion:(int64_t)a11 lastModifiedByVersion:(id *)a12 lastModifiedByDeviceID:(id)a13
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a8;
  id v23 = a9;
  id v24 = a13;
  v41.receiver = self;
  v41.super_class = (Class)DNDModeConfiguration;
  v25 = [(DNDModeConfiguration *)&v41 init];
  if (v25)
  {
    uint64_t v26 = [v19 copy];
    mode = v25->_mode;
    v25->_mode = (DNDMode *)v26;

    uint64_t v28 = [v20 copy];
    configuration = v25->_configuration;
    v25->_configuration = (DNDConfiguration *)v28;

    uint64_t v30 = [v21 copy];
    triggers = v25->_triggers;
    v25->_triggers = (NSArray *)v30;

    v25->_impactsAvailability = a6;
    v25->_dimsLockScreen = a7;
    uint64_t v32 = [v22 copy];
    created = v25->_created;
    v25->_created = (NSDate *)v32;

    uint64_t v34 = [v23 copy];
    lastModified = v25->_lastModified;
    v25->_lastModified = (NSDate *)v34;

    v25->_automaticallyGenerated = a10;
    v25->_compatibilityVersion = a11;
    long long v36 = *(_OWORD *)&a12->var0;
    v25->_lastModifiedByVersion.patchVersion = a12->var2;
    *(_OWORD *)&v25->_lastModifiedByVersion.majorVersion = v36;
    uint64_t v37 = [v24 copy];
    lastModifiedByDeviceID = v25->_lastModifiedByDeviceID;
    v25->_lastModifiedByDeviceID = (NSString *)v37;

    if ([v20 hasSecureData]) {
      char v39 = 1;
    }
    else {
      char v39 = [(DNDModeConfiguration *)v25 _containsSecureTriggers:v21];
    }
    v25->_hasSecureData = v39;
  }

  return v25;
}

- (id)_initWithModeConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v17 = [v3 mode];
  v4 = [v3 configuration];
  v5 = [v3 triggers];
  uint64_t v6 = [v3 impactsAvailability];
  uint64_t v7 = [v3 dimsLockScreen];
  v8 = [v3 created];
  id v9 = [v3 lastModified];
  char v10 = [v3 isAutomaticallyGenerated];
  uint64_t v11 = [v3 compatibilityVersion];
  if (v3) {
    [v3 lastModifiedByVersion];
  }
  else {
    memset(v18, 0, sizeof(v18));
  }
  v12 = [v3 lastModifiedByDeviceID];
  LOBYTE(v15) = v10;
  v13 = [(DNDModeConfiguration *)self initWithMode:v17 configuration:v4 triggers:v5 impactsAvailability:v6 dimsLockScreen:v7 created:v8 lastModified:v9 automaticallyGenerated:v15 compatibilityVersion:v11 lastModifiedByVersion:v18 lastModifiedByDeviceID:v12];

  return v13;
}

- (unint64_t)allowSmartEntry
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_triggers;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    unint64_t v6 = 2;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v13 != v5) {
        objc_enumerationMutation(v2);
      }
      v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
      uint64_t v9 = objc_opt_class();
      id v10 = v8;
      if (v9)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v9 = (uint64_t)v10;
        }
        else {
          uint64_t v9 = 0;
        }
      }

      if (v9) {
        break;
      }
      if (v4 == ++v7)
      {
        uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    unint64_t v6 = 1;
  }

  return v6;
}

- (id)mergeDecision:(id)a3 reason:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (DNDModeConfiguration *)a3;
  id v7 = a4;
  v8 = DNDLogModeConfiguration;
  BOOL v9 = os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT);
  if (v6 == self)
  {
    if (!v9) {
      goto LABEL_7;
    }
    int v12 = 138543362;
    id v13 = v7;
    id v10 = "Merge decision: self; reason: %{public}@";
  }
  else
  {
    if (!v9) {
      goto LABEL_7;
    }
    int v12 = 138543362;
    id v13 = v7;
    id v10 = "Merge decision: other; reason: %{public}@";
  }
  _os_log_impl(&dword_19CC2C000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0xCu);
LABEL_7:

  return v6;
}

- (id)mergeWithRemoteModeConfiguration:(id)a3
{
  uint64_t v4 = (DNDModeConfiguration *)a3;
  if (!v4)
  {
    id v10 = @"nothing to merge with";
    goto LABEL_10;
  }
  unint64_t v5 = [(DNDMode *)self->_mode visibility];
  unint64_t v6 = [(DNDModeConfiguration *)v4 mode];
  uint64_t v7 = [v6 visibility];

  if (self->_automaticallyGenerated != v4->_automaticallyGenerated)
  {
    if (v5 == v7)
    {
      if (!v5)
      {
        id v10 = @"automaticallyGenerated";
        if (self->_automaticallyGenerated) {
          goto LABEL_30;
        }
        goto LABEL_10;
      }
    }
    else
    {
      if (!v5 && !self->_automaticallyGenerated)
      {
        id v10 = @"visibility";
        goto LABEL_10;
      }
      if (!v7 && !v4->_automaticallyGenerated)
      {
        id v10 = @"visibility";
        goto LABEL_30;
      }
    }
  }
  if (v5 == v7)
  {
    uint64_t v8 = [(DNDModeConfiguration *)self resolvedCompatibilityVersion];
    uint64_t v9 = [(DNDModeConfiguration *)v4 rawResolvedCompatibilityVersion];
    if (v8 != v9)
    {
      if (v8 < 3 && v9 > 3)
      {
        id v10 = @"compatibilityVersion";
        goto LABEL_30;
      }
      if (v9 < 3 && v8 > 3)
      {
        id v10 = @"compatibilityVersion";
        goto LABEL_10;
      }
    }
  }
  if (![(NSDate *)v4->_lastModified isEqualToDate:self->_lastModified])
  {
    lastModified = self->_lastModified;
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] distantPast];
    LODWORD(lastModified) = [(NSDate *)lastModified isEqualToDate:v14];

    if (lastModified)
    {
      id v10 = @"lastModified distantPast";
    }
    else
    {
      long long v16 = [(NSDate *)v4->_lastModified laterDate:self->_lastModified];
      int v17 = [v16 isEqualToDate:v4->_lastModified];

      if (v17)
      {
        id v10 = @"lastModified";
        goto LABEL_30;
      }
      id v10 = @"fallthrough";
    }
LABEL_10:
    uint64_t v11 = self;
    int v12 = self;
    goto LABEL_31;
  }
  id v10 = @"lastModified same";
LABEL_30:
  uint64_t v11 = self;
  int v12 = v4;
LABEL_31:
  v18 = [(DNDModeConfiguration *)v11 mergeDecision:v12 reason:v10];

  return v18;
}

- (BOOL)hasSecureData
{
  return self->_hasSecureData;
}

- (BOOL)isSupportedConfiguration
{
  uint64_t v3 = [(DNDModeConfiguration *)self mode];
  char v4 = [v3 isPlaceholder];

  if (v4) {
    return 1;
  }
  uint64_t v6 = [(DNDModeConfiguration *)self resolvedCompatibilityVersion];
  return v6 < 21 && v6 >= 2;
}

- (int64_t)resolvedCompatibilityVersion
{
  uint64_t v3 = [(DNDModeConfiguration *)self compatibilityVersion];
  if (v3 >= 2) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 2;
  }
  unint64_t v5 = [(DNDModeConfiguration *)self configuration];
  int64_t v6 = [v5 compatibilityVersion];

  if (v4 > v6) {
    int64_t v6 = v4;
  }
  uint64_t v7 = [(DNDModeConfiguration *)self triggers];
  int64_t v8 = [(DNDModeConfiguration *)self _maxTriggerCompatibilityVersion:v7];

  if (v6 <= v8) {
    return v8;
  }
  else {
    return v6;
  }
}

- (int64_t)rawResolvedCompatibilityVersion
{
  uint64_t v3 = [(DNDModeConfiguration *)self compatibilityVersion];
  if (v3 >= 2) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 2;
  }
  unint64_t v5 = [(DNDModeConfiguration *)self configuration];
  int64_t v6 = [v5 rawCompatibilityVersion];

  if (v4 > v6) {
    int64_t v6 = v4;
  }
  uint64_t v7 = [(DNDModeConfiguration *)self triggers];
  int64_t v8 = [(DNDModeConfiguration *)self _maxTriggerCompatibilityVersion:v7];

  if (v6 <= v8) {
    return v8;
  }
  else {
    return v6;
  }
}

- (int64_t)compatibilityVersion
{
  uint64_t compatibilityVersion = self->_compatibilityVersion;
  if (compatibilityVersion <= 20)
  {
    uint64_t v3 = [(DNDModeConfiguration *)self mode];
    uint64_t v4 = [v3 semanticType];

    if (v4 == 9) {
      return 20;
    }
  }
  return compatibilityVersion;
}

- (void)log:(id)a3 withMessage:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int64_t v6 = a3;
  id v7 = a4;
  int64_t v8 = [(DNDModeConfiguration *)self mode];
  uint64_t v9 = [v8 modeIdentifier];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543618;
    id v21 = v9;
    __int16 v22 = 2114;
    id v23 = v7;
    _os_log_impl(&dword_19CC2C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Begin: %{public}@", (uint8_t *)&v20, 0x16u);
  }
  id v10 = v6;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(DNDModeConfiguration *)self shortDescription];
    int v20 = 138543618;
    id v21 = v9;
    __int16 v22 = 2114;
    id v23 = v11;
    _os_log_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@", (uint8_t *)&v20, 0x16u);
  }
  int v12 = v10;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(DNDModeConfiguration *)self created];
    uint64_t v14 = [(DNDModeConfiguration *)self lastModified];
    BOOL v15 = [(DNDModeConfiguration *)self isAutomaticallyGenerated];
    BOOL v16 = [(DNDModeConfiguration *)self hasSecureData];
    int v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[DNDModeConfiguration compatibilityVersion](self, "compatibilityVersion"));
    int v20 = 138544642;
    id v21 = v9;
    __int16 v22 = 2114;
    id v23 = v13;
    __int16 v24 = 2114;
    v25 = v14;
    __int16 v26 = 1026;
    BOOL v27 = v15;
    __int16 v28 = 1026;
    BOOL v29 = v16;
    __int16 v30 = 2114;
    v31 = v17;
    _os_log_impl(&dword_19CC2C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] created: %{public}@; lastModified: %{public}@; isAutomaticallyGenerated: %{public}d; hasSecureData: %"
      "{public}d; compatibilityVersion: %{public}@; ",
      (uint8_t *)&v20,
      0x36u);
  }
  v18 = v12;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [(DNDModeConfiguration *)self triggers];
    int v20 = 138543619;
    id v21 = v9;
    __int16 v22 = 2113;
    id v23 = v19;
    _os_log_impl(&dword_19CC2C000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] triggers: %{private}@", (uint8_t *)&v20, 0x16u);
  }
  [(DNDConfiguration *)self->_configuration log:v18 withPrefix:v9];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543362;
    id v21 = v9;
    _os_log_impl(&dword_19CC2C000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] End", (uint8_t *)&v20, 0xCu);
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(DNDModeConfiguration *)self mode];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(DNDModeConfiguration *)self configuration];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(DNDModeConfiguration *)self triggers];
  uint64_t v8 = [v7 hash];
  unint64_t v9 = v6 ^ v8 ^ [(DNDModeConfiguration *)self impactsAvailability];
  unint64_t v10 = [(DNDModeConfiguration *)self dimsLockScreen];
  uint64_t v11 = [(DNDModeConfiguration *)self created];
  uint64_t v12 = v10 ^ [v11 hash];
  id v13 = [(DNDModeConfiguration *)self lastModified];
  uint64_t v14 = v9 ^ v12 ^ [v13 hash];
  uint64_t v15 = [(DNDModeConfiguration *)self isAutomaticallyGenerated];
  int64_t v16 = v15 ^ [(DNDModeConfiguration *)self compatibilityVersion];
  unint64_t v17 = v14 ^ v16 ^ [(DNDModeConfiguration *)self hasSecureData];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDModeConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      uint64_t v6 = [(DNDModeConfiguration *)self created];
      id v7 = [(DNDModeConfiguration *)v5 created];
      if (v6 != v7)
      {
        uint64_t v8 = [(DNDModeConfiguration *)self created];
        if (!v8)
        {
          LOBYTE(v12) = 0;
          goto LABEL_92;
        }
        unint64_t v9 = (void *)v8;
        v80 = [(DNDModeConfiguration *)v5 created];
        if (!v80)
        {
          LOBYTE(v12) = 0;
LABEL_91:

          goto LABEL_92;
        }
        unint64_t v10 = [(DNDModeConfiguration *)self created];
        uint64_t v11 = [(DNDModeConfiguration *)v5 created];
        if (![v10 isEqual:v11])
        {
          LOBYTE(v12) = 0;
LABEL_90:

          goto LABEL_91;
        }
        v77 = v9;
        v78 = v11;
        v79 = v10;
      }
      id v13 = [(DNDModeConfiguration *)self lastModified];
      uint64_t v14 = [(DNDModeConfiguration *)v5 lastModified];
      if (v13 == v14) {
        goto LABEL_16;
      }
      uint64_t v15 = [(DNDModeConfiguration *)self lastModified];
      if (v15)
      {
        int64_t v16 = (void *)v15;
        uint64_t v17 = [(DNDModeConfiguration *)v5 lastModified];
        if (v17)
        {
          v18 = v13;
          v74 = (void *)v17;
          id v19 = [(DNDModeConfiguration *)self lastModified];
          int v20 = [(DNDModeConfiguration *)v5 lastModified];
          if (([v19 isEqual:v20] & 1) == 0)
          {

LABEL_88:
            LOBYTE(v12) = 0;
LABEL_89:
            uint64_t v11 = v78;
            unint64_t v10 = v79;
            unint64_t v9 = v77;
            if (v6 != v7) {
              goto LABEL_90;
            }
LABEL_92:

            goto LABEL_93;
          }
          v70 = v16;
          v71 = v19;
          v75 = v20;
          id v13 = v18;
LABEL_16:
          id v21 = [(DNDModeConfiguration *)self mode];
          __int16 v22 = [(DNDModeConfiguration *)v5 mode];
          v76 = v21;
          if (v21 == v22)
          {
            BOOL v27 = v75;
LABEL_24:
            uint64_t v28 = [(DNDModeConfiguration *)self configuration];
            uint64_t v29 = [(DNDModeConfiguration *)v5 configuration];
            v73 = (void *)v28;
            BOOL v30 = v28 == v29;
            v31 = (void *)v29;
            if (v30)
            {
              v65 = v22;
              long long v36 = v27;
LABEL_34:
              uint64_t v37 = [(DNDModeConfiguration *)self triggers];
              [(DNDModeConfiguration *)v5 triggers];
              v67 = v66 = v37;
              if (v37 == v67)
              {
                v64 = v31;
                v75 = v36;
                v59 = v13;
                v42 = v68;
              }
              else
              {
                uint64_t v38 = [(DNDModeConfiguration *)self triggers];
                if (!v38)
                {

                  LOBYTE(v12) = 0;
                  v51 = v73;
                  v44 = v65;
                  if (v73 == v31)
                  {
LABEL_76:

                    if (v76 != v44)
                    {
                    }
                    if (v13 == v14) {
                      goto LABEL_80;
                    }
LABEL_79:

LABEL_80:
                    goto LABEL_89;
                  }
LABEL_75:

                  goto LABEL_76;
                }
                char v39 = (void *)v38;
                uint64_t v40 = [(DNDModeConfiguration *)v5 triggers];
                v58 = v39;
                if (!v40)
                {
                  LOBYTE(v12) = 0;
                  v51 = v73;
                  v44 = v65;
                  goto LABEL_74;
                }
                v55 = (void *)v40;
                objc_super v41 = [(DNDModeConfiguration *)self triggers];
                v53 = [(DNDModeConfiguration *)v5 triggers];
                v54 = v41;
                if (!objc_msgSend(v41, "isEqual:"))
                {
                  LOBYTE(v12) = 0;
                  v44 = v65;
LABEL_73:

                  v51 = v73;
LABEL_74:

                  if (v51 == v31) {
                    goto LABEL_76;
                  }
                  goto LABEL_75;
                }
                v64 = v31;
                v75 = v36;
                v59 = v13;
                v42 = v68;
              }
              unint64_t v43 = [(DNDModeConfiguration *)self impactsAvailability];
              v44 = v65;
              v68 = v42;
              if (v43 != [(DNDModeConfiguration *)v5 impactsAvailability]
                || (unint64_t v45 = [(DNDModeConfiguration *)self dimsLockScreen],
                    v45 != [(DNDModeConfiguration *)v5 dimsLockScreen])
                || (BOOL v46 = [(DNDModeConfiguration *)self isAutomaticallyGenerated],
                    v46 != [(DNDModeConfiguration *)v5 isAutomaticallyGenerated])
                || (int64_t v47 = [(DNDModeConfiguration *)self compatibilityVersion],
                    v47 != [(DNDModeConfiguration *)v5 compatibilityVersion]))
              {
                if (v66 != v67)
                {

                  LOBYTE(v12) = 0;
                  v49 = v73;
                  v31 = v64;
                  id v13 = v59;
                  if (v73 == v64) {
                    goto LABEL_53;
                  }
                  goto LABEL_52;
                }
                LOBYTE(v12) = 0;
                id v13 = v59;
                v31 = v64;
LABEL_69:

                v49 = v73;
                if (v73 == v31)
                {
LABEL_53:

                  if (v76 != v65)
                  {
                  }
                  if (v13 == v14) {
                    goto LABEL_80;
                  }
                  goto LABEL_79;
                }
LABEL_52:

                goto LABEL_53;
              }
              BOOL v48 = [(DNDModeConfiguration *)self hasSecureData];
              BOOL v12 = v48 ^ [(DNDModeConfiguration *)v5 hasSecureData] ^ 1;
              id v13 = v59;
              v31 = v64;
              if (v66 == v67) {
                goto LABEL_69;
              }
              goto LABEL_73;
            }
            uint64_t v32 = [(DNDModeConfiguration *)self configuration];
            if (v32)
            {
              v62 = (void *)v32;
              uint64_t v33 = [(DNDModeConfiguration *)v5 configuration];
              if (v33)
              {
                v63 = v31;
                v75 = v27;
                v60 = (void *)v33;
                uint64_t v34 = [(DNDModeConfiguration *)self configuration];
                v35 = [(DNDModeConfiguration *)v5 configuration];
                if ([v34 isEqual:v35])
                {
                  v65 = v22;
                  v56 = v35;
                  v57 = v34;
                  long long v36 = v75;
                  v31 = v63;
                  goto LABEL_34;
                }

                if (v76 == v22)
                {
                }
                else
                {
                }
                v50 = v71;
                if (v13 == v14) {
                  goto LABEL_86;
                }

LABEL_84:
                goto LABEL_85;
              }
            }
            if (v76 == v22)
            {
            }
            else
            {
            }
            v50 = v71;
            if (v13 == v14) {
              goto LABEL_86;
            }

            goto LABEL_84;
          }
          uint64_t v23 = [(DNDModeConfiguration *)self mode];
          if (v23)
          {
            v72 = (void *)v23;
            uint64_t v24 = [(DNDModeConfiguration *)v5 mode];
            if (v24)
            {
              v69 = (void *)v24;
              v25 = [(DNDModeConfiguration *)self mode];
              __int16 v26 = [(DNDModeConfiguration *)v5 mode];
              if ([v25 isEqual:v26])
              {
                v61 = v25;
                v68 = v26;
                BOOL v27 = v75;
                goto LABEL_24;
              }
            }
            if (v13 != v14)
            {

LABEL_87:
              goto LABEL_88;
            }
          }
          else
          {

            if (v13 != v14)
            {

LABEL_85:
              goto LABEL_86;
            }
          }

          goto LABEL_87;
        }
      }
LABEL_86:

      goto LABEL_87;
    }
    LOBYTE(v12) = 0;
  }
LABEL_93:

  return v12;
}

- (NSString)description
{
  uint64_t v17 = NSString;
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = [(DNDModeConfiguration *)self mode];
  id v19 = [(DNDModeConfiguration *)self configuration];
  v18 = [(DNDModeConfiguration *)self triggers];
  id v13 = DNDEnabledSettingToString([(DNDModeConfiguration *)self impactsAvailability]);
  uint64_t v14 = DNDEnabledSettingToString([(DNDModeConfiguration *)self dimsLockScreen]);
  BOOL v12 = [(DNDModeConfiguration *)self created];
  uint64_t v3 = [(DNDModeConfiguration *)self lastModified];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDModeConfiguration isAutomaticallyGenerated](self, "isAutomaticallyGenerated"));
  unint64_t v5 = DNDCompatibilityVersionToString([(DNDModeConfiguration *)self compatibilityVersion]);
  uint64_t v6 = DNDCompatibilityVersionToString([(DNDModeConfiguration *)self resolvedCompatibilityVersion]);
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDModeConfiguration hasSecureData](self, "hasSecureData"));
  [(DNDModeConfiguration *)self lastModifiedByVersion];
  uint64_t v8 = DNDStringFromOperatingSystemVersion(v20);
  unint64_t v9 = [(DNDModeConfiguration *)self lastModifiedByDeviceID];
  objc_msgSend(v17, "stringWithFormat:", @"<%@: %p; mode: %@; configuration: %@; triggers: %@; impactsAvailability: %@; dimsLockScreen: %@; created: %@; lastModified: %@; automaticallyGenerated: %@; compatibilityVersion: %@; resolvedCompatibilityVersion: %@; hasSecureData: %@; modFrameworkVersion: %@; modDeviceID: %@>",
    v16,
    self,
    v15,
    v19,
    v18,
    v13,
    v14,
    v12,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
  unint64_t v10 = v9);

  return (NSString *)v10;
}

- (id)shortDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(DNDModeConfiguration *)self mode];
  uint64_t v6 = DNDEnabledSettingToString([(DNDModeConfiguration *)self impactsAvailability]);
  id v7 = DNDEnabledSettingToString([(DNDModeConfiguration *)self dimsLockScreen]);
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
  uint64_t v4 = +[DNDMutableModeConfiguration allocWithZone:a3];
  return [(DNDModeConfiguration *)v4 _initWithModeConfiguration:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  id v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"mode"];
  id v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v18 = [v3 decodeObjectOfClasses:v6 forKey:@"triggers"];

  uint64_t v7 = 0;
  if ([v3 containsValueForKey:@"impactsAvailability"]) {
    uint64_t v7 = [v3 decodeIntegerForKey:@"impactsAvailability"];
  }
  if ([v3 containsValueForKey:@"dimsLockScreen"]) {
    uint64_t v17 = [v3 decodeIntegerForKey:@"dimsLockScreen"];
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"created"];
  unint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"lastModified"];
  unint64_t v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"lastModifiedByVersion"];
  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"lastModifiedByDeviceID"];
  char v12 = [v3 decodeBoolForKey:@"automaticallyGenerated"];
  uint64_t v13 = [v3 decodeIntegerForKey:@"compatibilityVersion"];
  DNDOperatingSystemVersionFromString(v10, v22);
  LOBYTE(v16) = v12;
  uint64_t v14 = [(DNDModeConfiguration *)self initWithMode:v21 configuration:v19 triggers:v18 impactsAvailability:v7 dimsLockScreen:v17 created:v8 lastModified:v9 automaticallyGenerated:v16 compatibilityVersion:v13 lastModifiedByVersion:v22 lastModifiedByDeviceID:v11];

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DNDModeConfiguration *)self mode];
  [v4 encodeObject:v5 forKey:@"mode"];

  uint64_t v6 = [(DNDModeConfiguration *)self configuration];
  [v4 encodeObject:v6 forKey:@"configuration"];

  uint64_t v7 = [(DNDModeConfiguration *)self triggers];
  [v4 encodeObject:v7 forKey:@"triggers"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDModeConfiguration impactsAvailability](self, "impactsAvailability"), @"impactsAvailability");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDModeConfiguration dimsLockScreen](self, "dimsLockScreen"), @"dimsLockScreen");
  uint64_t v8 = [(DNDModeConfiguration *)self created];
  [v4 encodeObject:v8 forKey:@"created"];

  unint64_t v9 = [(DNDModeConfiguration *)self lastModified];
  [v4 encodeObject:v9 forKey:@"lastModified"];

  [(DNDModeConfiguration *)self lastModifiedByVersion];
  unint64_t v10 = DNDStringFromOperatingSystemVersion(v12);
  [v4 encodeObject:v10 forKey:@"lastModifiedByVersion"];

  uint64_t v11 = [(DNDModeConfiguration *)self lastModifiedByDeviceID];
  [v4 encodeObject:v11 forKey:@"lastModifiedByDeviceID"];

  objc_msgSend(v4, "encodeBool:forKey:", -[DNDModeConfiguration isAutomaticallyGenerated](self, "isAutomaticallyGenerated"), @"automaticallyGenerated");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DNDModeConfiguration compatibilityVersion](self, "compatibilityVersion"), @"compatibilityVersion");
}

- (void)diffAgainstObject:(id)a3 usingDiffBuilder:(id)a4 withDescription:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    unint64_t v10 = [(DNDModeConfiguration *)self mode];
    uint64_t v11 = [v9 mode];
    [v8 diffObject:v10 againstObject:v11 withDescription:@"mode"];

    char v12 = [(DNDModeConfiguration *)self configuration];
    uint64_t v13 = [v9 configuration];
    [v8 diffObject:v12 againstObject:v13 withDescription:@"configuration"];

    uint64_t v14 = [(DNDModeConfiguration *)self triggers];
    uint64_t v15 = [v9 triggers];
    [v8 diffObject:v14 againstObject:v15 withDescription:@"triggers"];

    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DNDModeConfiguration impactsAvailability](self, "impactsAvailability"));
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "impactsAvailability"));
    [v8 diffObject:v16 againstObject:v17 withDescription:@"impactsAvailability"];

    v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DNDModeConfiguration dimsLockScreen](self, "dimsLockScreen"));
    id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "dimsLockScreen"));
    [v8 diffObject:v18 againstObject:v19 withDescription:@"dimsLockScreen"];

    int v20 = [(DNDModeConfiguration *)self created];
    id v21 = [v9 created];
    [v8 diffObject:v20 againstObject:v21 withDescription:@"created"];

    __int16 v22 = [(DNDModeConfiguration *)self lastModified];
    uint64_t v23 = [v9 lastModified];
    [v8 diffObject:v22 againstObject:v23 withDescription:@"lastModified"];

    [(DNDModeConfiguration *)self lastModifiedByVersion];
    uint64_t v24 = DNDStringFromOperatingSystemVersion(v33);
    if (v9) {
      [v9 lastModifiedByVersion];
    }
    else {
      memset(v32, 0, sizeof(v32));
    }
    v25 = DNDStringFromOperatingSystemVersion(v32);
    [v8 diffObject:v24 againstObject:v25 withDescription:@"lastModifiedByVersion"];

    __int16 v26 = [(DNDModeConfiguration *)self lastModifiedByDeviceID];
    BOOL v27 = [v9 lastModifiedByDeviceID];
    [v8 diffObject:v26 againstObject:v27 withDescription:@"lastModifiedByDeviceID"];

    uint64_t v28 = objc_msgSend(NSNumber, "numberWithBool:", -[DNDModeConfiguration isAutomaticallyGenerated](self, "isAutomaticallyGenerated"));
    uint64_t v29 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "isAutomaticallyGenerated"));
    [v8 diffObject:v28 againstObject:v29 withDescription:@"isAutomaticallyGenerated"];

    BOOL v30 = objc_msgSend(NSNumber, "numberWithInteger:", -[DNDModeConfiguration compatibilityVersion](self, "compatibilityVersion"));
    v31 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "compatibilityVersion"));
    [v8 diffObject:v30 againstObject:v31 withDescription:@"compatibilityVersion"];
  }
}

- (BOOL)_containsSecureTriggers:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "hasSecureData", (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (int64_t)_maxTriggerCompatibilityVersion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int64_t v4 = 2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) compatibilityVersion];
        if (v4 <= v9) {
          int64_t v4 = v9;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v4;
}

- (DNDMode)mode
{
  return self->_mode;
}

- (DNDConfiguration)configuration
{
  return self->_configuration;
}

- (NSArray)triggers
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
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = *($A44FF20282FB96BA82CF1B0FF6945C38 *)((char *)self + 64);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedByDeviceID, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

@end