@interface CTAppProperties
- (ACXRemoteApplication)remoteAppInfo;
- (BOOL)isInstalledApp;
- (BOOL)isInternalApp;
- (BOOL)isRemoteApp;
- (BOOL)isSystemService;
- (BOOL)isUninstalledApp;
- (LSApplicationRecord)lsAppRecord;
- (NSString)givenBundleId;
- (id)bundleId;
- (id)init:(id)a3;
- (id)localizedName:(id)a3;
- (id)remoteLocalizedName:(id)a3;
- (int)bucketOverride;
- (void)setBucketOverride:(int)a3;
- (void)setGivenBundleId:(id)a3;
- (void)setLsAppRecord:(id)a3;
- (void)setRemoteAppInfo:(id)a3;
@end

@implementation CTAppProperties

- (id)init:(id)a3
{
  v3 = a3;
  id v44 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CTAppProperties;
  v5 = [(CTAppProperties *)&v49 init];
  if (!v5) {
    goto LABEL_42;
  }
  v6 = (LSApplicationRecord *)[objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v44 allowPlaceholder:1 error:0];
  lsAppRecord = v5->_lsAppRecord;
  v5->_lsAppRecord = v6;

  remoteAppInfo = v5->_remoteAppInfo;
  location = (id *)&v5->_remoteAppInfo;
  v5->_remoteAppInfo = 0;

  v9 = v5->_lsAppRecord;
  v10 = v9;
  if (!v9)
  {
    int v13 = 0;
    goto LABEL_15;
  }
  v11 = [(LSApplicationRecord *)v9 entitlements];
  v12 = [v11 objectForKey:@"com.apple.private.data-usage-classification-override" ofClass:objc_opt_class()];

  if (!v12) {
    goto LABEL_13;
  }
  if (([v12 isEqualToString:@"app"] & 1) == 0)
  {
    if ([v12 isEqualToString:@"internal app"])
    {
      int v13 = 2;
      goto LABEL_14;
    }
    if ([v12 isEqualToString:@"system service"])
    {
      int v13 = 3;
      goto LABEL_14;
    }
    v14 = sCTOsLogDefault;
    if (os_log_type_enabled(sCTOsLogDefault, OS_LOG_TYPE_FAULT)) {
      sub_10004B744((uint64_t)v12, v14);
    }
LABEL_13:
    int v13 = 0;
    goto LABEL_14;
  }
  int v13 = 1;
LABEL_14:

LABEL_15:
  v5->_bucketOverride = v13;
  objc_storeStrong((id *)&v5->_givenBundleId, v3);
  v15 = v5->_lsAppRecord;
  if (v15)
  {
    v3 = [(LSApplicationRecord *)v5->_lsAppRecord applicationState];
    if ([v3 isValid]) {
      goto LABEL_41;
    }
  }
  if (qword_100079598 != -1) {
    dispatch_once(&qword_100079598, &stru_10006D0B8);
  }
  if (v15)
  {
    BOOL v16 = byte_1000795A0 == 0;

    if (v16) {
      goto LABEL_42;
    }
LABEL_23:
    v3 = +[ACXDeviceConnection sharedDeviceConnection];
    v17 = +[NRPairedDeviceRegistry sharedInstance];
    v18 = [v17 getPairedDevices];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v19 = v18;
    id v20 = [v19 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (!v20) {
      goto LABEL_32;
    }
    uint64_t v21 = *(void *)v46;
    uint64_t v22 = NRDevicePropertyIsAltAccount;
LABEL_25:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v46 != v21) {
        objc_enumerationMutation(v19);
      }
      id v24 = *(id *)(*((void *)&v45 + 1) + 8 * v23);
      v25 = [v24 valueForProperty:v22];
      unsigned __int8 v26 = [v25 BOOLValue];

      if ((v26 & 1) == 0)
      {
        v27 = [v3 applicationOnPairedDevice:v24 withBundleID:v44 error:0];
        if (v27) {
          break;
        }
      }

      if (v20 == (id)++v23)
      {
        id v20 = [v19 countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (v20) {
          goto LABEL_25;
        }
LABEL_32:
        v27 = 0;
        v28 = v19;
LABEL_39:

        goto LABEL_40;
      }
    }

    objc_storeStrong(location, v27);
    v29 = [*location companionAppBundleID];
    BOOL v30 = v29 == 0;

    if (!v30)
    {
      id v31 = objc_alloc((Class)LSApplicationRecord);
      v32 = [*location companionAppBundleID];
      v33 = (LSApplicationRecord *)[v31 initWithBundleIdentifier:v32 allowPlaceholder:1 error:0];
      v34 = v5->_lsAppRecord;
      v5->_lsAppRecord = v33;

      v28 = [(CTAppProperties *)v5 lsAppRecord];
      v35 = [v28 applicationState];
      if ([v35 isValid])
      {
        v36 = [(CTAppProperties *)v5 lsAppRecord];
        v37 = [v36 applicationState];
        if ([v37 isInstalled])
        {

          goto LABEL_39;
        }
        v39 = [(CTAppProperties *)v5 lsAppRecord];
        if ([v39 isPlaceholder])
        {

          goto LABEL_39;
        }
        locationa = [(CTAppProperties *)v5 lsAppRecord];
        v40 = [locationa applicationState];
        unsigned __int8 v41 = [v40 isPlaceholder];

        if (v41)
        {
LABEL_40:

LABEL_41:
          goto LABEL_42;
        }
      }
      else
      {
      }
    }
    v28 = v5->_lsAppRecord;
    v5->_lsAppRecord = 0;
    goto LABEL_39;
  }
  if (byte_1000795A0) {
    goto LABEL_23;
  }
LABEL_42:

  return v5;
}

- (BOOL)isInstalledApp
{
  unsigned int v3 = [(CTAppProperties *)self bucketOverride];
  BOOL v4 = v3 == 1;
  unsigned int v5 = [(CTAppProperties *)self bucketOverride];
  uint64_t v6 = [(CTAppProperties *)self lsAppRecord];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [(CTAppProperties *)self lsAppRecord];
    v9 = [v8 applicationState];
    unsigned int v10 = [v9 isValid];

    if (v10)
    {
      v11 = [(CTAppProperties *)self lsAppRecord];
      v12 = [v11 compatibilityObject];
      if (v12)
      {
        v27 = [(CTAppProperties *)self lsAppRecord];
        unsigned __int8 v26 = [v27 compatibilityObject];
        int v13 = [v26 applicationType];
        if ([v13 isEqual:LSUserApplicationType])
        {
          int v14 = 1;
        }
        else
        {
          v25 = [(CTAppProperties *)self lsAppRecord];
          id v24 = [v25 compatibilityObject];
          v15 = [v24 applicationType];
          if ([v15 isEqual:LSSystemApplicationType])
          {
            uint64_t v23 = [(CTAppProperties *)self lsAppRecord];
            BOOL v16 = [v23 appTags];
            int v14 = !sub_100006564(v16);
          }
          else
          {
            int v14 = 0;
          }
        }
      }
      else
      {
        int v14 = 0;
      }

      if (v3 != 1 && !v5)
      {
        v17 = [(CTAppProperties *)self lsAppRecord];
        v18 = [v17 applicationState];
        if (([v18 isInstalled] & 1) == 0)
        {
          id v19 = [(CTAppProperties *)self lsAppRecord];
          if (([v19 isPlaceholder] & 1) == 0)
          {
            id v20 = [(CTAppProperties *)self lsAppRecord];
            uint64_t v21 = [v20 applicationState];
            v14 &= [v21 isPlaceholder];
          }
        }

        return v14;
      }
    }
  }
  return v4;
}

- (BOOL)isUninstalledApp
{
  unsigned int v3 = [(CTAppProperties *)self bucketOverride];
  uint64_t v4 = [(CTAppProperties *)self lsAppRecord];
  if (!v4) {
    goto LABEL_5;
  }
  unsigned int v5 = (void *)v4;
  uint64_t v6 = [(CTAppProperties *)self lsAppRecord];
  v7 = [v6 applicationState];
  unsigned int v8 = [v7 isValid];

  if (v8)
  {
    v9 = [(CTAppProperties *)self lsAppRecord];
    unsigned int v10 = [v9 applicationState];
    if ([v10 isInstalled])
    {
      unsigned __int8 v11 = 0;
    }
    else
    {
      v12 = [(CTAppProperties *)self lsAppRecord];
      if ([v12 isPlaceholder])
      {
        unsigned __int8 v11 = 0;
      }
      else
      {
        int v13 = [(CTAppProperties *)self lsAppRecord];
        int v14 = [v13 applicationState];
        if ([v14 isPlaceholder])
        {
          unsigned __int8 v11 = 0;
        }
        else
        {
          v15 = [(CTAppProperties *)self lsAppRecord];
          unsigned __int8 v11 = [v15 isDeletable];
        }
      }
    }
  }
  else
  {
LABEL_5:
    unsigned __int8 v11 = 1;
  }
  BOOL v16 = [(CTAppProperties *)self remoteAppInfo];

  unsigned __int8 v17 = [(CTAppProperties *)self isSystemService];
  if (v3) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = v16 == 0;
  }
  if (v18) {
    char v19 = v17;
  }
  else {
    char v19 = 1;
  }
  return v11 & ~v19;
}

- (BOOL)isInternalApp
{
  unsigned int v3 = [(CTAppProperties *)self bucketOverride];
  BOOL v4 = v3 == 2;
  unsigned int v5 = [(CTAppProperties *)self bucketOverride];
  uint64_t v6 = [(CTAppProperties *)self lsAppRecord];
  if (v6)
  {
    v7 = (void *)v6;
    unsigned int v8 = [(CTAppProperties *)self lsAppRecord];
    v9 = [v8 applicationState];
    unsigned int v10 = [v9 isValid];

    if (v10)
    {
      unsigned __int8 v11 = [(CTAppProperties *)self lsAppRecord];
      v12 = [v11 compatibilityObject];
      if (v12)
      {
        int v13 = [(CTAppProperties *)self lsAppRecord];
        int v14 = [v13 compatibilityObject];
        v15 = [v14 applicationType];
        unsigned int v16 = [v15 isEqual:LSInternalApplicationType];
      }
      else
      {
        unsigned int v16 = 0;
      }

      if (v3 != 2 && !v5)
      {
        unsigned __int8 v17 = [(CTAppProperties *)self lsAppRecord];
        BOOL v18 = [v17 applicationState];
        if (([v18 isInstalled] & 1) == 0)
        {
          char v19 = [(CTAppProperties *)self lsAppRecord];
          if (([v19 isPlaceholder] & 1) == 0)
          {
            id v20 = [(CTAppProperties *)self lsAppRecord];
            uint64_t v21 = [v20 applicationState];
            v16 &= [v21 isPlaceholder];
          }
        }

        return v16;
      }
    }
  }
  return v4;
}

- (BOOL)isRemoteApp
{
  if ([(CTAppProperties *)self bucketOverride]) {
    return 0;
  }
  BOOL v4 = [(CTAppProperties *)self lsAppRecord];
  if (v4)
  {
    BOOL v3 = 0;
  }
  else
  {
    unsigned int v5 = [(CTAppProperties *)self remoteAppInfo];
    BOOL v3 = v5 != 0;
  }
  return v3;
}

- (BOOL)isSystemService
{
  unsigned int v3 = [(CTAppProperties *)self bucketOverride];
  unsigned int v4 = [(CTAppProperties *)self bucketOverride];
  unsigned int v5 = [(CTAppProperties *)self remoteAppInfo];

  uint64_t v6 = [(CTAppProperties *)self lsAppRecord];

  if (v6)
  {
    v7 = [(CTAppProperties *)self lsAppRecord];
    unsigned int v8 = [v7 applicationState];
    unsigned __int8 v9 = [v8 isValid];

    unsigned int v10 = [(CTAppProperties *)self lsAppRecord];
    unsigned __int8 v11 = v10;
    if (v9)
    {
      v12 = [v10 applicationState];
      unsigned __int8 v31 = [v12 isInstalled];
      if (v31)
      {
        int v30 = 0;
      }
      else
      {
        unsigned __int8 v26 = [(CTAppProperties *)self lsAppRecord];
        if ([v26 isPlaceholder])
        {
          int v30 = 0;
        }
        else
        {
          v25 = [(CTAppProperties *)self lsAppRecord];
          id v24 = [v25 applicationState];
          if (([v24 isPlaceholder] & 1) == 0)
          {

            BOOL v14 = 0;
LABEL_27:

            goto LABEL_28;
          }
          int v30 = 1;
        }
      }
      v15 = [(CTAppProperties *)self lsAppRecord];
      unsigned int v16 = [v15 compatibilityObject];
      if (v16)
      {
        v29 = [(CTAppProperties *)self lsAppRecord];
        v28 = [v29 compatibilityObject];
        v27 = [v28 applicationType];
        if ([v27 isEqual:LSHiddenAppType])
        {
          BOOL v14 = 1;
        }
        else
        {
          uint64_t v23 = [(CTAppProperties *)self lsAppRecord];
          uint64_t v22 = [v23 compatibilityObject];
          uint64_t v21 = [v22 applicationType];
          if ([v21 isEqual:LSSystemApplicationType])
          {
            id v20 = [(CTAppProperties *)self lsAppRecord];
            unsigned __int8 v17 = [v20 appTags];
            BOOL v14 = sub_100006564(v17);
          }
          else
          {
            BOOL v14 = 0;
          }
        }
        if (v30) {
          goto LABEL_23;
        }
      }
      else
      {

        BOOL v14 = 0;
        if (v30)
        {
LABEL_23:
        }
      }
      if (v31) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
    v12 = [v10 bundleIdentifier];
  }
  else
  {
    v12 = [(CTAppProperties *)self givenBundleId];
    unsigned __int8 v11 = v12;
  }
  int v13 = sub_100005C14((uint64_t)v12);
  BOOL v14 = v13 != 0;

  if (v6) {
LABEL_28:
  }

  if (v5) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = v14;
  }
  if (v4) {
    BOOL v18 = v3 == 3;
  }
  return v3 == 3 || v18;
}

- (id)localizedName:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CTAppProperties *)self lsAppRecord];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [(CTAppProperties *)self lsAppRecord];
  v7 = [v6 applicationState];
  unsigned int v8 = [v7 isValid];

  if (v8)
  {
    unsigned __int8 v9 = [(CTAppProperties *)self lsAppRecord];
    unsigned int v10 = [v9 localizedNameWithPreferredLocalizations:v4];
  }
  else
  {
LABEL_4:
    unsigned __int8 v11 = [(CTAppProperties *)self remoteAppInfo];

    if (v11)
    {
      unsigned int v10 = [(CTAppProperties *)self remoteLocalizedName:v4];
    }
    else
    {
      unsigned int v10 = 0;
    }
  }

  return v10;
}

- (id)bundleId
{
  uint64_t v3 = [(CTAppProperties *)self lsAppRecord];
  if (v3)
  {
    id v4 = (void *)v3;
    unsigned int v5 = [(CTAppProperties *)self lsAppRecord];
    uint64_t v6 = [v5 applicationState];
    unsigned int v7 = [v6 isValid];

    if (v7)
    {
      unsigned int v8 = [(CTAppProperties *)self lsAppRecord];
      uint64_t v9 = [v8 bundleIdentifier];
LABEL_6:
      unsigned __int8 v11 = (void *)v9;

      goto LABEL_8;
    }
  }
  unsigned int v10 = [(CTAppProperties *)self remoteAppInfo];

  if (v10)
  {
    unsigned int v8 = [(CTAppProperties *)self remoteAppInfo];
    uint64_t v9 = [v8 bundleIdentifier];
    goto LABEL_6;
  }
  unsigned __int8 v11 = [(CTAppProperties *)self givenBundleId];
LABEL_8:

  return v11;
}

- (id)remoteLocalizedName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _kCFBundleDisplayNameKey;
  uint64_t v6 = +[NSSet setWithObject:_kCFBundleDisplayNameKey];
  unsigned int v7 = [(CTAppProperties *)self remoteAppInfo];
  unsigned int v8 = [v7 localizedInfoPlistStringsForKeys:v6 fetchingFirstMatchingLocalizationInList:v4];

  if (v8)
  {
    uint64_t v9 = [v8 objectForKey:v5];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (LSApplicationRecord)lsAppRecord
{
  return (LSApplicationRecord *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLsAppRecord:(id)a3
{
}

- (ACXRemoteApplication)remoteAppInfo
{
  return (ACXRemoteApplication *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRemoteAppInfo:(id)a3
{
}

- (int)bucketOverride
{
  return self->_bucketOverride;
}

- (void)setBucketOverride:(int)a3
{
  self->_bucketOverride = a3;
}

- (NSString)givenBundleId
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setGivenBundleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_givenBundleId, 0);
  objc_storeStrong((id *)&self->_remoteAppInfo, 0);

  objc_storeStrong((id *)&self->_lsAppRecord, 0);
}

@end