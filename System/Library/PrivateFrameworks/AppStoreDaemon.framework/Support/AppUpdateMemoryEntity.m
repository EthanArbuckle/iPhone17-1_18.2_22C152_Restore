@interface AppUpdateMemoryEntity
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (AppUpdateMemoryEntity)init;
- (AppUpdateMemoryEntity)initWithUpdateDictionary:(id)a3;
- (BOOL)isAppClip;
- (BOOL)isBackground;
- (BOOL)isCodeSignatureUpdate;
- (BOOL)isOffloaded;
- (BOOL)isPerDevice;
- (NSDate)currentVersionReleaseDate;
- (NSDate)installDate;
- (NSDate)releaseDate;
- (NSNumber)evid;
- (NSNumber)itemID;
- (NSString)bundleID;
- (NSString)buyParams;
- (NSString)description;
- (NSString)parentalControlsName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)purchaseInfoForUpdateUserInitiated:(BOOL)a3;
- (id)purchase_purchaseInfoForUpdateUserInitiated:(BOOL)a3;
- (id)rawUpdateDictionary;
- (int64_t)packageType;
- (int64_t)parentalControlsRank;
- (int64_t)softwarePlatform;
- (void)setBackground:(BOOL)a3;
- (void)setCodeSignatureUpdate:(BOOL)a3;
- (void)setInstallDate:(id)a3;
- (void)setMetricsData:(id)a3;
- (void)setOffloaded:(BOOL)a3;
- (void)setPerDevice:(BOOL)a3;
- (void)setUpdateState:(int64_t)a3;
@end

@implementation AppUpdateMemoryEntity

- (AppUpdateMemoryEntity)init
{
  v3.receiver = self;
  v3.super_class = (Class)AppUpdateMemoryEntity;
  return [(SQLiteMemoryEntity *)&v3 init];
}

- (AppUpdateMemoryEntity)initWithUpdateDictionary:(id)a3
{
  id v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)AppUpdateMemoryEntity;
  v5 = [(SQLiteMemoryEntity *)&v65 init];
  if (v5)
  {
    id v6 = v4;
    if (!v6)
    {
LABEL_73:

      goto LABEL_74;
    }
    [(SQLiteMemoryEntity *)v5 setValue:v6 forProperty:@"store_item_data"];
    v7 = [v6 objectForKey:@"bundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (NSString *)[v7 copy];
      bundleID = v5->_bundleID;
      v5->_bundleID = v8;
      v10 = v7;
    }
    else
    {
      v10 = [v6 objectForKey:@"bundle-id"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_8;
      }
      v11 = (NSString *)[v10 copy];
      bundleID = v5->_bundleID;
      v5->_bundleID = v11;
    }

LABEL_8:
    v12 = v5->_bundleID;
    if (v12) {
      [(SQLiteMemoryEntity *)v5 setValue:v12 forProperty:@"bundle_id"];
    }
    uint64_t v13 = [v6 objectForKey:@"currentVersionReleaseDateTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = objc_alloc_init((Class)NSDateFormatter);
      [v14 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
      [v14 setLenient:1];
      v15 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
      [v14 setTimeZone:v15];

      v16 = [v14 dateFromString:v13];
      if (v16) {
        [(SQLiteMemoryEntity *)v5 setValue:v16 forProperty:@"current_version_release_date"];
      }
    }
    v60 = (void *)v13;
    id v61 = v6;
    id v17 = v6;
    id v18 = [v17 objectForKey:@"externalId"];
    v19 = &_s7Network11NWInterfaceV13InterfaceTypeO8loopbackyA2EmFWC_ptr;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v18;
      v20 = v18;
LABEL_27:

      if (v20)
      {
        v25 = (NSNumber *)[v20 copy];
        evid = v5->_evid;
        v5->_evid = v25;

        [(SQLiteMemoryEntity *)v5 setValue:v5->_evid forProperty:@"store_software_version_id"];
      }
      v63 = v20;
      v27 = [v17 objectForKey:@"id"];

      if (objc_opt_respondsToSelector())
      {
        uint64_t v28 = objc_msgSend(v19[508], "numberWithLongLong:", objc_msgSend(v27, "longLongValue"));
        itemID = v5->_itemID;
        v5->_itemID = (NSNumber *)v28;

        [(SQLiteMemoryEntity *)v5 setValue:v5->_itemID forProperty:@"store_item_id"];
      }
      v62 = v27;
      v64 = v17;
      v30 = sub_100267F88(v17, @"deviceFamilies");
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v31 = [v30 countByEnumeratingWithState:&v66 objects:v70 count:16];
      if (v31)
      {
        id v32 = v31;
        unint64_t v33 = 0;
        uint64_t v34 = *(void *)v67;
        do
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            if (*(void *)v67 != v34) {
              objc_enumerationMutation(v30);
            }
            v36 = *(void **)(*((void *)&v66 + 1) + 8 * i);
            if ((unint64_t)[v36 length] >= 3)
            {
              v37 = [v36 substringToIndex:3];
              v38 = [v37 lowercaseString];

              if ([v38 isEqualToString:@"ipa"])
              {
                uint64_t v39 = 2;
              }
              else if ([v38 isEqualToString:@"iph"])
              {
                uint64_t v39 = 4;
              }
              else if ([v38 isEqualToString:@"ipo"])
              {
                uint64_t v39 = 8;
              }
              else if ([v38 isEqualToString:@"tvo"])
              {
                uint64_t v39 = 16;
              }
              else if ([v38 isEqualToString:@"wat"])
              {
                uint64_t v39 = 32;
              }
              else
              {
                uint64_t v39 = [v38 isEqualToString:@"mac"];
              }
              v33 |= v39;
            }
          }
          id v32 = [v30 countByEnumeratingWithState:&v66 objects:v70 count:16];
        }
        while (v32);
      }
      else
      {
        unint64_t v33 = 0;
      }
      if (v33 <= 1) {
        uint64_t v40 = 1;
      }
      else {
        uint64_t v40 = v33;
      }
      v41 = +[NSNumber numberWithInteger:v40];
      [(SQLiteMemoryEntity *)v5 setValue:v41 forProperty:@"device_families"];

      v42 = +[NSNumber numberWithInteger:1];
      [(SQLiteMemoryEntity *)v5 setValue:v42 forProperty:@"software_platform"];

      v43 = sub_1002E1588(v64);
      v44 = [v43 objectForKey:@"value"];
      if (objc_opt_respondsToSelector()) {
        id v45 = [v44 integerValue];
      }
      else {
        id v45 = 0;
      }
      id v6 = v61;

      v5->_parentalControlsRank = (int64_t)v45;
      v46 = [v64 objectForKey:@"releaseDate"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v46 length])
      {
        id v47 = objc_alloc_init((Class)NSDateFormatter);
        [v47 setDateStyle:2];
        [v47 setTimeStyle:0];
        uint64_t v48 = [v47 dateFromString:v46];
        releaseDate = v5->_releaseDate;
        v5->_releaseDate = (NSDate *)v48;
      }
      v50 = v5->_releaseDate;
      if (v50) {
        [(SQLiteMemoryEntity *)v5 setValue:v50 forProperty:@"release_date"];
      }
      v51 = [v64 objectForKeyedSubscript:@"is_app_clip"];

      if (v51)
      {
        v52 = [v64 objectForKeyedSubscript:@"is_app_clip"];
        [(SQLiteMemoryEntity *)v5 setValue:v52 forExternalProperty:@"is_app_clip"];
      }
      v53 = [v64 objectForKeyedSubscript:@"is_offloaded"];

      if (v53)
      {
        v54 = [v64 objectForKeyedSubscript:@"is_offloaded"];
        [(SQLiteMemoryEntity *)v5 setValue:v54 forProperty:@"is_offloaded"];
      }
      v55 = [v64 objectForKeyedSubscript:@"is_per_device"];

      if (v55)
      {
        v56 = [v64 objectForKeyedSubscript:@"is_per_device"];
        [(SQLiteMemoryEntity *)v5 setValue:v56 forProperty:@"is_per_device"];
      }
      v57 = [v64 objectForKeyedSubscript:@"is_b2b_custom_app"];

      if (v57)
      {
        v58 = [v64 objectForKeyedSubscript:@"is_b2b_custom_app"];
        [(SQLiteMemoryEntity *)v5 setValue:v58 forProperty:@"is_b2b_custom_app"];
      }
      goto LABEL_73;
    }
    v21 = [v17 objectForKey:@"offers"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v21 count])
    {
      v22 = [v21 firstObject];
      v23 = [v22 objectForKey:@"version"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [v23 objectForKey:@"externalId"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {

          v19 = &_s7Network11NWInterfaceV13InterfaceTypeO8loopbackyA2EmFWC_ptr;
LABEL_26:

          goto LABEL_27;
        }
      }
      v19 = &_s7Network11NWInterfaceV13InterfaceTypeO8loopbackyA2EmFWC_ptr;
    }
    v24 = [v17 objectForKey:@"versionId"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v24;
      v20 = v18;
    }
    else
    {
      v20 = 0;
      id v18 = v24;
    }
    goto LABEL_26;
  }
LABEL_74:

  return v5;
}

- (NSString)bundleID
{
  return (NSString *)sub_10026E95C(self, @"bundle_id");
}

- (NSString)buyParams
{
  id v3 = [(AppUpdateMemoryEntity *)self rawUpdateDictionary];
  id v4 = v3;
  if (self)
  {
    v5 = [v3 objectForKey:@"buyParams"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
LABEL_6:
      v7 = v6;
      v8 = v6;
LABEL_19:

      goto LABEL_20;
    }
    v7 = [v4 objectForKey:@"action-params"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v7;
      goto LABEL_6;
    }
    v9 = [v4 objectForKey:@"offers"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v10 = [v9 firstObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v11 = [v10 valueForKey:@"buyParams"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v12 = [v10 objectForKey:@"action-params"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = 0;
        goto LABEL_16;
      }
      v11 = v12;
    }
    id v12 = v11;
    v8 = v12;
LABEL_16:

    goto LABEL_17;
  }
  v8 = 0;
LABEL_20:

  return (NSString *)v8;
}

- (NSDate)currentVersionReleaseDate
{
  return (NSDate *)[(SQLiteMemoryEntity *)self valueForProperty:@"current_version_release_date"];
}

- (NSNumber)evid
{
  return (NSNumber *)sub_10026E82C(self, @"store_software_version_id");
}

- (NSDate)installDate
{
  return (NSDate *)[(SQLiteMemoryEntity *)self valueForProperty:@"install_date"];
}

- (NSNumber)itemID
{
  return (NSNumber *)sub_10026E82C(self, @"store_item_id");
}

- (BOOL)isAppClip
{
  v2 = [(SQLiteMemoryEntity *)self valueForExternalProperty:@"is_app_clip"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isBackground
{
  return sub_10026E7EC(self, @"is_background");
}

- (BOOL)isCodeSignatureUpdate
{
  return sub_10026E7EC(self, @"is_code_signature_update");
}

- (BOOL)isOffloaded
{
  return sub_10026E7EC(self, @"is_offloaded");
}

- (BOOL)isPerDevice
{
  return sub_10026E7EC(self, @"is_per_device");
}

- (int64_t)packageType
{
  v2 = [(SQLiteMemoryEntity *)self valueForProperty:@"package_type"];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (NSString)parentalControlsName
{
  id v3 = [(AppUpdateMemoryEntity *)self rawUpdateDictionary];
  id v4 = v3;
  if (self)
  {
    v5 = sub_1002E1588(v3);
    id v6 = [v5 objectForKey:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return (NSString *)v7;
}

- (id)rawUpdateDictionary
{
  return [(SQLiteMemoryEntity *)self valueForProperty:@"store_item_data"];
}

- (void)setOffloaded:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(SQLiteMemoryEntity *)self setValue:v4 forProperty:@"is_offloaded"];
}

- (void)setBackground:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(SQLiteMemoryEntity *)self setValue:v4 forProperty:@"is_background"];
}

- (void)setCodeSignatureUpdate:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(SQLiteMemoryEntity *)self setValue:v4 forProperty:@"is_code_signature_update"];
}

- (void)setInstallDate:(id)a3
{
}

- (void)setMetricsData:(id)a3
{
}

- (void)setPerDevice:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(SQLiteMemoryEntity *)self setValue:v4 forProperty:@"is_per_device"];
}

- (void)setUpdateState:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  [(SQLiteMemoryEntity *)self setValue:v4 forProperty:@"update_state"];
}

- (int64_t)softwarePlatform
{
  return 1;
}

- (NSString)description
{
  id v3 = [(AppUpdateMemoryEntity *)self bundleID];
  id v4 = [(AppUpdateMemoryEntity *)self itemID];
  v5 = [(AppUpdateMemoryEntity *)self evid];
  id v6 = [(AppUpdateMemoryEntity *)self currentVersionReleaseDate];
  id v7 = sub_1002826D4(v6);
  v8 = +[NSString stringWithFormat:@"{ bundleID: %@ itemID: %@ evid: %@ currentReleaseDate: %@ }", v3, v4, v5, v7];

  return (NSString *)v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AppUpdateMemoryEntity;
  return [(SQLiteMemoryEntity *)&v4 copyWithZone:a3];
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultProperties
{
  return sub_100243654();
}

- (id)purchaseInfoForUpdateUserInitiated:(BOOL)a3
{
  return [(AppUpdateMemoryEntity *)self purchase_purchaseInfoForUpdateUserInitiated:a3];
}

- (int64_t)parentalControlsRank
{
  return self->_parentalControlsRank;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_evid, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (id)purchase_purchaseInfoForUpdateUserInitiated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_opt_new();
  id v6 = [(AppUpdateMemoryEntity *)self bundleID];
  [v5 setBundleID:v6];

  id v7 = [objc_alloc((Class)AMSProcessInfo) initWithBundleIdentifier:@"com.apple.AppStore"];
  [v5 setClientInfo:v7];

  v8 = +[NSUUID UUID];
  [v5 setExternalID:v8];

  v9 = [(AppUpdateMemoryEntity *)self itemID];
  [v5 setItemID:v9];

  [v5 setDiscoveredUpdate:1];
  [v5 setDisableBoosting:1];
  if (v3)
  {
    [v5 setPriority:0];
    [v5 setUpdateType:2];
    [v5 setLogCode:@"UPD"];
    [v5 setMetricsType:&off_10054CB70];
    [v5 setPurchaseType:4];
    [v5 setSuppressEvaluatorDialogs:1];
  }
  else
  {
    [v5 setPriority:-2];
    [v5 setUpdateType:1];
    [v5 setDiscretionary:1];
    [v5 setSuppressDialogs:1];
    [v5 setSuppressEvaluatorDialogs:1];
    [v5 setLogCode:@"UPA"];
    [v5 setMetricsType:&off_10054CB88];
    [v5 setPurchaseType:1];
  }
  v10 = [(AppUpdateMemoryEntity *)self buyParams];
  if (v10)
  {
    v11 = +[AMSBuyParams buyParamsWithString:v10];
    id v12 = [(AppUpdateMemoryEntity *)self parentalControlsName];
    if (v12) {
      [v11 setParameter:v12 forKey:@"installedSoftwareRatingName"];
    }
    if (!v3) {
      [v11 setParameter:@"1" forKey:AMSBuyParamPropertyIsBackground];
    }
    [v5 setBuyParams:v11];
  }
  uint64_t v13 = [(AppUpdateMemoryEntity *)self itemID];
  unsigned int v14 = +[UpdatesManager isTVProviderApp:](UpdatesManager, "isTVProviderApp:", [v13 integerValue]);

  id v15 = objc_alloc((Class)LSApplicationRecord);
  v16 = [(AppUpdateMemoryEntity *)self itemID];
  id v17 = objc_msgSend(v15, "initWithStoreItemIdentifier:error:", objc_msgSend(v16, "unsignedLongLongValue"), 0);

  if (v17)
  {
    id v18 = [v17 iTunesMetadata];
    v19 = [v18 itemName];
    [v5 setItemName:v19];

    v20 = [v17 iTunesMetadata];
    v21 = [v20 artistName];
    [v5 setVendorName:v21];

    id v22 = [v17 applicationDSID];
    if (!v14
      || ([v17 isProfileValidated] & 1) != 0
      || ([v17 applicationHasMIDBasedSINF] & 1) == 0)
    {
      goto LABEL_22;
    }
  }
  else
  {
    id v22 = 0;
    if (!v14) {
      goto LABEL_22;
    }
  }
  [v5 setLogCode:@"PTV"];
  [v5 setPurchaseType:2];
  [v5 setMetricsType:&off_10054CBA0];
  if (!v17) {
    [v5 setUpdateType:0];
  }
  [v5 setMachineBased:1];
  v23 = [v5 buyParams];
  v24 = [v23 parameterForKey:AMSBuyParamPropertyAppExtVrsId];

  v25 = [v5 buyParams];
  uint64_t v26 = AMSBuyParamPropertyExternalVersionId;
  v27 = [v25 parameterForKey:AMSBuyParamPropertyExternalVersionId];

  if (!v27 && v24)
  {
    uint64_t v28 = [v5 buyParams];
    [v28 setParameter:v24 forKey:v26];
  }
LABEL_22:
  objc_msgSend(v5, "setExpectedSoftwarePlatform:", -[AppUpdateMemoryEntity softwarePlatform](self, "softwarePlatform"));
  v29 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    int v35 = 134218240;
    v36 = self;
    __int16 v37 = 2048;
    id v38 = [v5 expectedSoftwarePlatform];
    _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "(AppUpdateMemoryEntity) [%p] expectedSoftwarePlatform=%lu", (uint8_t *)&v35, 0x16u);
  }

  if ([v5 expectedSoftwarePlatform] != (id)2)
  {
    uint64_t v30 = 2;
    [v5 setCoordinatorIntent:2];
    if (!v3)
    {
      if (_os_feature_enabled_impl()) {
        uint64_t v30 = 4;
      }
      else {
        uint64_t v30 = 1;
      }
    }
    [v5 setCoordinatorImportance:v30];
  }
  [v5 updateGeneratedProperties];
  if (v22)
  {
    id v31 = +[ACAccountStore ams_sharedAccountStore];
    id v32 = +[NSNumber numberWithUnsignedLongLong:v22];
    unint64_t v33 = objc_msgSend(v31, "ams_iTunesAccountWithDSID:", v32);

    if (v33) {
      [v5 setAccount:v33];
    }
  }
  return v5;
}

@end