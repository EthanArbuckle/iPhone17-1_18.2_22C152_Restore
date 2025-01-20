@interface IXSPlaceholder
+ (BOOL)supportsSecureCoding;
+ (id)_metadataFromPromise:(id)a3;
- (BOOL)_internal_checkInitWithSeed:(id)a3 error:(id *)a4;
- (BOOL)_isReadyToMaterialize;
- (BOOL)_materialize;
- (BOOL)_validateClientEntitlements:(id *)a3;
- (BOOL)awakeFromSerializationWithLookupBlock:(id)a3 error:(id *)a4;
- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5;
- (BOOL)configurationComplete;
- (BOOL)creatorHadWebPlaceholderInstallEntitlement;
- (BOOL)isComplete;
- (BOOL)sentDidBegin;
- (IXPlaceholderAttributes)attributes;
- (IXSOwnedDataPromise)entitlements;
- (IXSOwnedDataPromise)icon;
- (IXSOwnedDataPromise)infoPlistLoctable;
- (IXSPlaceholder)initWithCoder:(id)a3;
- (IXSPlaceholder)initWithSeed:(id)a3 fromConnection:(id)a4 error:(id *)a5;
- (IXSPromisedInMemoryData)metadataPromise;
- (IXSPromisedInMemoryData)sinfPromise;
- (IXSPromisedInMemoryDictionary)infoPlistIconContentPromise;
- (IXSPromisedInMemoryDictionary)localizationDictionaryPromise;
- (IXSPromisedTransferToPath)iconResourcesPromise;
- (MIStoreMetadata)metadata;
- (NSArray)appExtensionPlaceholders;
- (NSArray)appExtensionPlaceholdersPromiseUUIDs;
- (NSData)sinfData;
- (NSDictionary)localizationDictionary;
- (NSError)awakeningError;
- (NSString)bundleID;
- (NSString)bundleName;
- (NSString)description;
- (NSUUID)entitlementsPromiseUUID;
- (NSUUID)iconPromiseUUID;
- (NSUUID)iconResourcesPromiseUUID;
- (NSUUID)infoPlistIconContentPromiseUUID;
- (NSUUID)infoPlistLoctablePromiseUUID;
- (NSUUID)localizationDictionaryPromiseUUID;
- (NSUUID)metadataPromiseUUID;
- (NSUUID)sinfPromiseUUID;
- (double)percentComplete;
- (id)_promiseUUIDsForPromise:(id)a3;
- (id)subPromiseUUIDs;
- (unint64_t)installType;
- (unint64_t)totalBytesNeededOnDisk;
- (void)_cancelPromise:(id)a3 forReason:(id)a4 client:(unint64_t)a5;
- (void)_decommissionPromise:(id)a3;
- (void)_materializeIfReady;
- (void)_remote_getAppExtensionPlaceholderPromises:(id)a3;
- (void)_remote_getAttributesWithCompletion:(id)a3;
- (void)_remote_getEntitlementsPromise:(id)a3;
- (void)_remote_getIconPromise:(id)a3;
- (void)_remote_getIconResourcesPromiseAndInfoPlistContent:(id)a3;
- (void)_remote_getInfoPlistLoctablePromise:(id)a3;
- (void)_remote_getLaunchProhibitedWithCompletion:(id)a3;
- (void)_remote_getLocalizationDictionary:(id)a3;
- (void)_remote_getMetadataWithCompletion:(id)a3;
- (void)_remote_getSinfDataWithCompletion:(id)a3;
- (void)_remote_hasAppExtensionPlaceholderPromises:(id)a3;
- (void)_remote_hasEntitlementsPromise:(id)a3;
- (void)_remote_hasIconPromise:(id)a3;
- (void)_remote_hasIconResourcesPromise:(id)a3;
- (void)_remote_hasInfoPlistLoctablePromise:(id)a3;
- (void)_remote_setAppExtensionPlaceholderPromiseUUIDs:(id)a3 completion:(id)a4;
- (void)_remote_setAttributes:(id)a3 completion:(id)a4;
- (void)_remote_setConfigurationCompleteWithCompletion:(id)a3;
- (void)_remote_setEntitlementsPromiseUUID:(id)a3 completion:(id)a4;
- (void)_remote_setIconPromiseUUID:(id)a3 completion:(id)a4;
- (void)_remote_setIconResourcesPromiseUUID:(id)a3 infoPlistIconContentPromiseUUID:(id)a4 completion:(id)a5;
- (void)_remote_setInfoPlistLoctablePromiseUUID:(id)a3 completion:(id)a4;
- (void)_remote_setLaunchProhibited:(BOOL)a3 completion:(id)a4;
- (void)_remote_setLocalizationPromiseUUID:(id)a3 completion:(id)a4;
- (void)_remote_setMetadataPromiseUUID:(id)a3 fromConnection:(id)a4 completion:(id)a5;
- (void)_remote_setSinfPromiseUUID:(id)a3 completion:(id)a4;
- (void)decommission;
- (void)encodeWithCoder:(id)a3;
- (void)promise:(id)a3 didCancelForReason:(id)a4 client:(unint64_t)a5;
- (void)promise:(id)a3 didUpdateProgress:(double)a4;
- (void)promiseDidBegin:(id)a3;
- (void)promiseDidComplete:(id)a3;
- (void)promiseDidReset:(id)a3;
- (void)setAppExtensionPlaceholders:(id)a3;
- (void)setAppExtensionPlaceholdersPromiseUUIDs:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setAwakeningError:(id)a3;
- (void)setComplete:(BOOL)a3;
- (void)setConfigurationComplete:(BOOL)a3;
- (void)setEntitlements:(id)a3;
- (void)setEntitlementsPromiseUUID:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIconPromiseUUID:(id)a3;
- (void)setIconResourcesPromise:(id)a3;
- (void)setIconResourcesPromise:(id)a3 andInfoPlistIconContentPromise:(id)a4;
- (void)setIconResourcesPromiseUUID:(id)a3;
- (void)setInfoPlistIconContentPromise:(id)a3;
- (void)setInfoPlistIconContentPromiseUUID:(id)a3;
- (void)setInfoPlistLoctable:(id)a3;
- (void)setInfoPlistLoctablePromiseUUID:(id)a3;
- (void)setLocalizationDictionaryPromise:(id)a3;
- (void)setLocalizationDictionaryPromiseUUID:(id)a3;
- (void)setMetadataPromise:(id)a3;
- (void)setMetadataPromiseUUID:(id)a3;
- (void)setPercentComplete:(double)a3;
- (void)setSentDidBegin:(BOOL)a3;
- (void)setSinfPromise:(id)a3;
- (void)setSinfPromiseUUID:(id)a3;
@end

@implementation IXSPlaceholder

- (BOOL)_internal_checkInitWithSeed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 bundleName];

  if (v6)
  {
    v7 = [v5 bundleID];

    if (v7)
    {
      id v8 = 0;
      BOOL v9 = 1;
      goto LABEL_13;
    }
    v14 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10008DD10();
    }

    v12 = @"Attempting to initialize IXSPlaceholder with seed that has a nil bundleID; failing.";
    uint64_t v13 = 87;
  }
  else
  {
    v10 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10008DC98();
    }

    v12 = @"Attempting to initialize IXSPlaceholder with seed that has a nil bundleName; failing.";
    uint64_t v13 = 82;
  }
  sub_10003DAE4((uint64_t)"-[IXSPlaceholder _internal_checkInitWithSeed:error:]", v13, @"IXErrorDomain", 1uLL, 0, 0, v12, v11, v16);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    id v8 = v8;
    BOOL v9 = 0;
    *a4 = v8;
  }
  else
  {
    BOOL v9 = 0;
  }
LABEL_13:

  return v9;
}

- (IXSPlaceholder)initWithSeed:(id)a3 fromConnection:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IXSPlaceholder;
  v10 = [(IXSOwnedDataPromise *)&v14 initWithSeed:v8 error:a5];
  uint64_t v11 = v10;
  if (v10)
  {
    if (![(IXSPlaceholder *)v10 _internal_checkInitWithSeed:v8 error:a5])
    {
      v12 = 0;
      goto LABEL_6;
    }
    v11->_creatorHadWebPlaceholderInstallEntitlement = sub_10000D448(v9, @"com.apple.private.appinstall.install-webkit-push-placeholder");
  }
  v12 = v11;
LABEL_6:

  return v12;
}

- (IXSPlaceholder)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)IXSPlaceholder;
  id v5 = [(IXSOwnedDataPromise *)&v31 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconPromiseUUID"];
    iconPromiseUUID = v5->_iconPromiseUUID;
    v5->_iconPromiseUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconResourcesPromiseUUID"];
    iconResourcesPromiseUUID = v5->_iconResourcesPromiseUUID;
    v5->_iconResourcesPromiseUUID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"infoPlistIconContentPromiseUUID"];
    infoPlistIconContentPromiseUUID = v5->_infoPlistIconContentPromiseUUID;
    v5->_infoPlistIconContentPromiseUUID = (NSUUID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entitlementsPromiseUUID"];
    entitlementsPromiseUUID = v5->_entitlementsPromiseUUID;
    v5->_entitlementsPromiseUUID = (NSUUID *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"infoPlistLoctablePromiseUUID"];
    infoPlistLoctablePromiseUUID = v5->_infoPlistLoctablePromiseUUID;
    v5->_infoPlistLoctablePromiseUUID = (NSUUID *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadataPromiseUUID"];
    metadataPromiseUUID = v5->_metadataPromiseUUID;
    v5->_metadataPromiseUUID = (NSUUID *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sinfPromiseUUID"];
    sinfPromiseUUID = v5->_sinfPromiseUUID;
    v5->_sinfPromiseUUID = (NSUUID *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizationDictionaryPromiseUUID"];
    localizationDictionaryPromiseUUID = v5->_localizationDictionaryPromiseUUID;
    v5->_localizationDictionaryPromiseUUID = (NSUUID *)v20;

    unsigned int v22 = [v4 containsValueForKey:@"appExtensionPlaceholdersPromiseUUIDs"];
    uint64_t v23 = objc_opt_class();
    v24 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v23, objc_opt_class(), 0);
    if (v22) {
      CFStringRef v25 = @"appExtensionPlaceholdersPromiseUUIDs";
    }
    else {
      CFStringRef v25 = @"plugInPlaceholdersPromiseUUIDs";
    }
    uint64_t v26 = [v4 decodeObjectOfClasses:v24 forKey:v25];
    appExtensionPlaceholdersPromiseUUIDs = v5->_appExtensionPlaceholdersPromiseUUIDs;
    v5->_appExtensionPlaceholdersPromiseUUIDs = (NSArray *)v26;

    v5->_sentDidBegin = [v4 decodeBoolForKey:@"sentDidBegin"];
    v5->_configurationComplete = [v4 decodeBoolForKey:@"configurationComplete"];
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributes"];
    attributes = v5->_attributes;
    v5->_attributes = (IXPlaceholderAttributes *)v28;

    v5->_creatorHadWebPlaceholderInstallEntitlement = [v4 decodeBoolForKey:@"creatorHadWebPlaceholderInstallEntitlement"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  v16.receiver = self;
  v16.super_class = (Class)IXSPlaceholder;
  [(IXSOwnedDataPromise *)&v16 encodeWithCoder:v4];
  uint64_t v6 = [(IXSPlaceholder *)self iconPromiseUUID];
  [v4 encodeObject:v6 forKey:@"iconPromiseUUID"];

  v7 = [(IXSPlaceholder *)self iconResourcesPromiseUUID];
  [v4 encodeObject:v7 forKey:@"iconResourcesPromiseUUID"];

  uint64_t v8 = [(IXSPlaceholder *)self infoPlistIconContentPromiseUUID];
  [v4 encodeObject:v8 forKey:@"infoPlistIconContentPromiseUUID"];

  id v9 = [(IXSPlaceholder *)self entitlementsPromiseUUID];
  [v4 encodeObject:v9 forKey:@"entitlementsPromiseUUID"];

  uint64_t v10 = [(IXSPlaceholder *)self infoPlistLoctablePromiseUUID];
  [v4 encodeObject:v10 forKey:@"infoPlistLoctablePromiseUUID"];

  uint64_t v11 = [(IXSPlaceholder *)self metadataPromiseUUID];
  [v4 encodeObject:v11 forKey:@"metadataPromiseUUID"];

  uint64_t v12 = [(IXSPlaceholder *)self sinfPromiseUUID];
  [v4 encodeObject:v12 forKey:@"sinfPromiseUUID"];

  uint64_t v13 = [(IXSPlaceholder *)self localizationDictionaryPromiseUUID];
  [v4 encodeObject:v13 forKey:@"localizationDictionaryPromiseUUID"];

  uint64_t v14 = [(IXSPlaceholder *)self appExtensionPlaceholdersPromiseUUIDs];
  [v4 encodeObject:v14 forKey:@"appExtensionPlaceholdersPromiseUUIDs"];

  objc_msgSend(v4, "encodeBool:forKey:", -[IXSPlaceholder sentDidBegin](self, "sentDidBegin"), @"sentDidBegin");
  objc_msgSend(v4, "encodeBool:forKey:", -[IXSPlaceholder configurationComplete](self, "configurationComplete"), @"configurationComplete");
  v15 = [(IXSPlaceholder *)self attributes];
  [v4 encodeObject:v15 forKey:@"attributes"];

  objc_msgSend(v4, "encodeBool:forKey:", -[IXSPlaceholder creatorHadWebPlaceholderInstallEntitlement](self, "creatorHadWebPlaceholderInstallEntitlement"), @"creatorHadWebPlaceholderInstallEntitlement");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)awakeFromSerializationWithLookupBlock:(id)a3 error:(id *)a4
{
  v168 = (void (**)(id, void *, uint64_t))a3;
  uint64_t v204 = 0;
  v205 = &v204;
  uint64_t v206 = 0x3032000000;
  v207 = sub_10001E110;
  v208 = sub_10001E120;
  id v209 = 0;
  id v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);
  v167 = self;

  uint64_t v6 = [(IXSPlaceholder *)self awakeningError];

  if (!v6)
  {
    if (![(IXSDataPromise *)self isTracked] || [(IXSDataPromise *)self didAwake]) {
      goto LABEL_101;
    }
    [(IXSDataPromise *)self setDidAwake:1];
    uint64_t v8 = [(IXSPlaceholder *)self iconPromiseUUID];

    if (v8)
    {
      id v9 = [(IXSPlaceholder *)self iconPromiseUUID];
      uint64_t v10 = objc_opt_class();
      v168[2](v168, v9, v10);
      uint64_t v11 = (IXSOwnedDataPromise *)objc_claimAutoreleasedReturnValue();
      icon = self->_icon;
      self->_icon = v11;

      uint64_t v13 = self->_icon;
      if (v13)
      {
        uint64_t v14 = [(IXSDataPromise *)v13 accessQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10001E128;
        block[3] = &unk_1000E9698;
        block[4] = self;
        v202 = v168;
        v203 = &v204;
        dispatch_sync(v14, block);
      }
      else
      {
        v15 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          [(IXSDataPromise *)self name];
          objc_claimAutoreleasedReturnValue();
          [(IXSPlaceholder *)self iconPromiseUUID];
          objc_claimAutoreleasedReturnValue();
          sub_10008E068();
        }

        objc_super v16 = [(IXSDataPromise *)self name];
        v155 = [(IXSPlaceholder *)self iconPromiseUUID];
        uint64_t v18 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]", 195, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Failed to locate icon promise with UUID %@", v17, (uint64_t)v16);

        v19 = (void *)v205[5];
        v205[5] = v18;

        [(IXSPlaceholder *)self setIconPromiseUUID:0];
      }
    }
    uint64_t v20 = [(IXSPlaceholder *)self iconResourcesPromiseUUID];

    if (v20)
    {
      v21 = [(IXSPlaceholder *)self iconResourcesPromiseUUID];
      uint64_t v22 = objc_opt_class();
      v168[2](v168, v21, v22);
      uint64_t v23 = (IXSPromisedTransferToPath *)objc_claimAutoreleasedReturnValue();
      iconResourcesPromise = self->_iconResourcesPromise;
      self->_iconResourcesPromise = v23;

      CFStringRef v25 = self->_iconResourcesPromise;
      if (v25)
      {
        uint64_t v26 = [(IXSDataPromise *)v25 accessQueue];
        v198[0] = _NSConcreteStackBlock;
        v198[1] = 3221225472;
        v198[2] = sub_10001E1D4;
        v198[3] = &unk_1000E9698;
        v198[4] = self;
        v199 = v168;
        v200 = &v204;
        dispatch_sync(v26, v198);
      }
      else
      {
        v27 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          [(IXSDataPromise *)self name];
          objc_claimAutoreleasedReturnValue();
          [(IXSPlaceholder *)self iconResourcesPromiseUUID];
          objc_claimAutoreleasedReturnValue();
          sub_10008E014();
        }

        uint64_t v28 = [(IXSDataPromise *)self name];
        v156 = [(IXSPlaceholder *)self iconResourcesPromiseUUID];
        uint64_t v30 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]", 214, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Failed to locate icon resources promise with UUID %@", v29, (uint64_t)v28);

        objc_super v31 = (void *)v205[5];
        v205[5] = v30;

        [(IXSPlaceholder *)self setIconResourcesPromiseUUID:0];
      }
    }
    v32 = [(IXSPlaceholder *)self infoPlistIconContentPromiseUUID];

    v33 = self;
    if (v32)
    {
      v34 = [(IXSPlaceholder *)self infoPlistIconContentPromiseUUID];
      uint64_t v35 = objc_opt_class();
      v168[2](v168, v34, v35);
      v36 = (IXSPromisedInMemoryDictionary *)objc_claimAutoreleasedReturnValue();
      infoPlistIconContentPromise = self->_infoPlistIconContentPromise;
      self->_infoPlistIconContentPromise = v36;

      v38 = self->_infoPlistIconContentPromise;
      if (v38)
      {
        v39 = [(IXSDataPromise *)v38 accessQueue];
        v195[0] = _NSConcreteStackBlock;
        v195[1] = 3221225472;
        v195[2] = sub_10001E280;
        v195[3] = &unk_1000E9698;
        v195[4] = self;
        v196 = v168;
        v197 = &v204;
        dispatch_sync(v39, v195);

        v33 = self;
      }
      else
      {
        v40 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          [(IXSDataPromise *)self name];
          objc_claimAutoreleasedReturnValue();
          [(IXSPlaceholder *)self iconResourcesPromiseUUID];
          objc_claimAutoreleasedReturnValue();
          sub_10008E014();
        }

        v41 = [(IXSDataPromise *)self name];
        v157 = [(IXSPlaceholder *)self iconResourcesPromiseUUID];
        uint64_t v43 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]", 233, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Failed to locate icon resources promise with UUID %@", v42, (uint64_t)v41);

        v44 = (void *)v205[5];
        v205[5] = v43;

        v33 = self;
        [(IXSPlaceholder *)self setInfoPlistIconContentPromiseUUID:0];
      }
    }
    v45 = [(IXSPlaceholder *)v33 iconResourcesPromise];
    if (v45
      && ([(IXSPlaceholder *)v33 infoPlistIconContentPromise],
          v46 = objc_claimAutoreleasedReturnValue(),
          BOOL v47 = v46 == 0,
          v46,
          v45,
          v33 = v167,
          v47))
    {
      [(IXSPlaceholder *)v167 setIconResourcesPromise:0];
      [(IXSPlaceholder *)v167 setIconResourcesPromiseUUID:0];
      v54 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        sub_10008DFA0();
      }

      uint64_t v53 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]", 252, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Found icon resources promise but not info plist icon content promise", v55, (uint64_t)v167);
    }
    else
    {
      v48 = [(IXSPlaceholder *)v33 iconResourcesPromise];
      if (v48)
      {
LABEL_36:

LABEL_37:
        v57 = [(IXSPlaceholder *)v167 entitlementsPromiseUUID];

        v58 = v167;
        if (v57)
        {
          v59 = [(IXSPlaceholder *)v167 entitlementsPromiseUUID];
          uint64_t v60 = objc_opt_class();
          uint64_t v61 = v168[2](v168, v59, v60);
          entitlements = v167->_entitlements;
          v167->_entitlements = (IXSOwnedDataPromise *)v61;

          v63 = v167->_entitlements;
          if (v63)
          {
            v64 = [(IXSDataPromise *)v63 accessQueue];
            v192[0] = _NSConcreteStackBlock;
            v192[1] = 3221225472;
            v192[2] = sub_10001E32C;
            v192[3] = &unk_1000E9698;
            v192[4] = v167;
            v193 = v168;
            v194 = &v204;
            dispatch_sync(v64, v192);

            v58 = v167;
          }
          else
          {
            v65 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
            {
              [(IXSDataPromise *)v167 name];
              objc_claimAutoreleasedReturnValue();
              [(IXSPlaceholder *)v167 entitlementsPromiseUUID];
              objc_claimAutoreleasedReturnValue();
              sub_10008DED8();
            }

            v66 = [(IXSDataPromise *)v167 name];
            v158 = [(IXSPlaceholder *)v167 entitlementsPromiseUUID];
            uint64_t v68 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]", 262, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Failed to locate entitlements promise with UUID %@", v67, (uint64_t)v66);

            v69 = (void *)v205[5];
            v205[5] = v68;

            v58 = v167;
            [(IXSPlaceholder *)v167 setEntitlementsPromiseUUID:0];
          }
        }
        v70 = [(IXSPlaceholder *)v58 infoPlistLoctablePromiseUUID];

        v71 = v167;
        if (v70)
        {
          v72 = [(IXSPlaceholder *)v167 infoPlistLoctablePromiseUUID];
          uint64_t v73 = objc_opt_class();
          uint64_t v74 = v168[2](v168, v72, v73);
          infoPlistLoctable = v167->_infoPlistLoctable;
          v167->_infoPlistLoctable = (IXSOwnedDataPromise *)v74;

          v76 = v167->_infoPlistLoctable;
          if (v76)
          {
            v77 = [(IXSDataPromise *)v76 accessQueue];
            v189[0] = _NSConcreteStackBlock;
            v189[1] = 3221225472;
            v189[2] = sub_10001E3D8;
            v189[3] = &unk_1000E9698;
            v189[4] = v167;
            v190 = v168;
            v191 = &v204;
            dispatch_sync(v77, v189);

            v71 = v167;
          }
          else
          {
            v78 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              [(IXSDataPromise *)v167 name];
              objc_claimAutoreleasedReturnValue();
              [(IXSPlaceholder *)v167 infoPlistLoctablePromiseUUID];
              objc_claimAutoreleasedReturnValue();
              sub_10008DE84();
            }

            v79 = [(IXSDataPromise *)v167 name];
            v159 = [(IXSPlaceholder *)v167 infoPlistLoctablePromiseUUID];
            uint64_t v81 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]", 281, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Failed to locate loctable promise with UUID %@", v80, (uint64_t)v79);

            v82 = (void *)v205[5];
            v205[5] = v81;

            v71 = v167;
            [(IXSPlaceholder *)v167 setInfoPlistLoctablePromiseUUID:0];
          }
        }
        v83 = [(IXSPlaceholder *)v71 metadataPromiseUUID];

        v84 = v167;
        if (v83)
        {
          v85 = [(IXSPlaceholder *)v167 metadataPromiseUUID];
          uint64_t v86 = objc_opt_class();
          uint64_t v87 = v168[2](v168, v85, v86);
          metadataPromise = v167->_metadataPromise;
          v167->_metadataPromise = (IXSPromisedInMemoryData *)v87;

          v89 = v167->_metadataPromise;
          if (v89)
          {
            v90 = [(IXSDataPromise *)v89 accessQueue];
            v186[0] = _NSConcreteStackBlock;
            v186[1] = 3221225472;
            v186[2] = sub_10001E484;
            v186[3] = &unk_1000E9698;
            v186[4] = v167;
            v187 = v168;
            v188 = &v204;
            dispatch_sync(v90, v186);

            v84 = v167;
          }
          else
          {
            v91 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
            {
              [(IXSDataPromise *)v167 name];
              objc_claimAutoreleasedReturnValue();
              [(IXSPlaceholder *)v167 metadataPromiseUUID];
              objc_claimAutoreleasedReturnValue();
              sub_10008DE30();
            }

            v92 = [(IXSDataPromise *)v167 name];
            v160 = [(IXSPlaceholder *)v167 metadataPromiseUUID];
            uint64_t v94 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]", 300, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Failed to locate metadata promise with UUID %@", v93, (uint64_t)v92);

            v95 = (void *)v205[5];
            v205[5] = v94;

            v84 = v167;
            [(IXSPlaceholder *)v167 setMetadataPromiseUUID:0];
          }
        }
        v96 = [(IXSPlaceholder *)v84 sinfPromiseUUID];

        v97 = v167;
        if (v96)
        {
          v98 = [(IXSPlaceholder *)v167 sinfPromiseUUID];
          uint64_t v99 = objc_opt_class();
          uint64_t v100 = v168[2](v168, v98, v99);
          sinfPromise = v167->_sinfPromise;
          v167->_sinfPromise = (IXSPromisedInMemoryData *)v100;

          v102 = v167->_sinfPromise;
          if (v102)
          {
            v103 = [(IXSDataPromise *)v102 accessQueue];
            v183[0] = _NSConcreteStackBlock;
            v183[1] = 3221225472;
            v183[2] = sub_10001E530;
            v183[3] = &unk_1000E9698;
            v183[4] = v167;
            v184 = v168;
            v185 = &v204;
            dispatch_sync(v103, v183);

            v97 = v167;
          }
          else
          {
            v104 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
            {
              [(IXSDataPromise *)v167 name];
              objc_claimAutoreleasedReturnValue();
              [(IXSPlaceholder *)v167 sinfPromiseUUID];
              objc_claimAutoreleasedReturnValue();
              sub_10008DE30();
            }

            v105 = [(IXSDataPromise *)v167 name];
            v161 = [(IXSPlaceholder *)v167 sinfPromiseUUID];
            uint64_t v107 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]", 319, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Failed to locate metadata promise with UUID %@", v106, (uint64_t)v105);

            v108 = (void *)v205[5];
            v205[5] = v107;

            v97 = v167;
            [(IXSPlaceholder *)v167 setSinfPromiseUUID:0];
          }
        }
        v109 = [(IXSPlaceholder *)v97 localizationDictionaryPromiseUUID];

        v110 = v167;
        if (v109)
        {
          v111 = [(IXSPlaceholder *)v167 localizationDictionaryPromiseUUID];
          uint64_t v112 = objc_opt_class();
          uint64_t v113 = v168[2](v168, v111, v112);
          localizationDictionaryPromise = v167->_localizationDictionaryPromise;
          v167->_localizationDictionaryPromise = (IXSPromisedInMemoryDictionary *)v113;

          v115 = v167->_localizationDictionaryPromise;
          if (v115)
          {
            v116 = [(IXSDataPromise *)v115 accessQueue];
            v180[0] = _NSConcreteStackBlock;
            v180[1] = 3221225472;
            v180[2] = sub_10001E5DC;
            v180[3] = &unk_1000E9698;
            v180[4] = v167;
            v181 = v168;
            v182 = &v204;
            dispatch_sync(v116, v180);

            v110 = v167;
          }
          else
          {
            v117 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
            {
              [(IXSDataPromise *)v167 name];
              objc_claimAutoreleasedReturnValue();
              [(IXSPlaceholder *)v167 localizationDictionaryPromiseUUID];
              objc_claimAutoreleasedReturnValue();
              sub_10008DDDC();
            }

            v118 = [(IXSDataPromise *)v167 name];
            v162 = [(IXSPlaceholder *)v167 localizationDictionaryPromiseUUID];
            uint64_t v120 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]", 338, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Failed to locate localization dictionary promise with UUID %@", v119, (uint64_t)v118);

            v121 = (void *)v205[5];
            v205[5] = v120;

            v110 = v167;
            [(IXSPlaceholder *)v167 setLocalizationDictionaryPromiseUUID:0];
          }
        }
        v122 = [(IXSPlaceholder *)v110 appExtensionPlaceholdersPromiseUUIDs];

        if (v122)
        {
          v166 = objc_opt_new();
          v123 = objc_opt_new();
          long long v178 = 0u;
          long long v179 = 0u;
          long long v176 = 0u;
          long long v177 = 0u;
          v124 = [(IXSPlaceholder *)v167 appExtensionPlaceholdersPromiseUUIDs];
          id v125 = [v124 countByEnumeratingWithState:&v176 objects:v218 count:16];
          if (v125)
          {
            uint64_t v126 = *(void *)v177;
            id obj = v124;
            do
            {
              for (i = 0; i != v125; i = (char *)i + 1)
              {
                if (*(void *)v177 != v126) {
                  objc_enumerationMutation(obj);
                }
                v128 = *(void **)(*((void *)&v176 + 1) + 8 * i);
                uint64_t v129 = objc_opt_class();
                v130 = v168[2](v168, v128, v129);
                if (v130)
                {
                  [v166 addObject:v130];
                  v131 = [v130 accessQueue];
                  v169[0] = _NSConcreteStackBlock;
                  v169[1] = 3221225472;
                  v169[2] = sub_10001E688;
                  v169[3] = &unk_1000E96C0;
                  id v170 = v130;
                  v132 = v168;
                  v171 = v167;
                  v174 = v132;
                  v175 = &v204;
                  id v172 = v123;
                  v173 = v128;
                  dispatch_sync(v131, v169);
                }
                else
                {
                  v133 = sub_100004B28((uint64_t)off_100109BB8);
                  if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
                  {
                    v138 = [(IXSDataPromise *)v167 name];
                    *(_DWORD *)buf = 136315906;
                    v211 = "-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]";
                    __int16 v212 = 2112;
                    v213 = v138;
                    __int16 v214 = 2112;
                    v215 = v128;
                    __int16 v216 = 2112;
                    uint64_t v217 = 0;
                    _os_log_error_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_ERROR, "%s: %@: Failed to locate placeholder promise with UUID %@ : %@", buf, 0x2Au);
                  }
                  v134 = [(IXSDataPromise *)v167 name];
                  uint64_t v136 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]", 372, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Failed to locate placeholder promise with UUID %@", v135, (uint64_t)v134);

                  v137 = (void *)v205[5];
                  v205[5] = v136;

                  [v123 addObject:v128];
                }
              }
              v124 = obj;
              id v125 = [obj countByEnumeratingWithState:&v176 objects:v218 count:16];
            }
            while (v125);
          }

          v139 = [(IXSPlaceholder *)v167 appExtensionPlaceholdersPromiseUUIDs];
          id v140 = [v139 mutableCopy];

          [v140 removeObjectsInArray:v123];
          if ([v140 count])
          {
            id v141 = [v140 copy];
            [(IXSPlaceholder *)v167 setAppExtensionPlaceholdersPromiseUUIDs:v141];
          }
          else
          {
            [(IXSPlaceholder *)v167 setAppExtensionPlaceholdersPromiseUUIDs:0];
          }
          if ([v166 count]) {
            objc_storeStrong((id *)&v167->_appExtensionPlaceholders, v166);
          }
        }
        v142 = v167;
        if (!v205[5]
          && [(IXSPlaceholder *)v167 isComplete]
          && ![(IXSOwnedDataPromise *)v167 stagedPathMayNotExistWhenAwakening])
        {
          v143 = [(IXSOwnedDataPromise *)v167 stagedPath];
          v144 = [(IXSOwnedDataPromise *)v167 targetLastPathComponent];
          if (v144)
          {
            uint64_t v145 = [v143 URLByAppendingPathComponent:v144 isDirectory:1];

            v143 = (void *)v145;
          }
          v146 = +[IXFileManager defaultManager];
          unsigned __int8 v147 = [v146 itemExistsAtURL:v143];

          if ((v147 & 1) == 0)
          {
            v148 = sub_100004B28((uint64_t)off_100109BB8);
            if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
            {
              [(IXSDataPromise *)v167 uniqueIdentifier];
              objc_claimAutoreleasedReturnValue();
              [v143 path];
              objc_claimAutoreleasedReturnValue();
              sub_10008DD88();
            }

            v149 = [(IXSDataPromise *)v167 uniqueIdentifier];
            v163 = [v143 path];
            uint64_t v151 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]", 402, @"IXErrorDomain", 3uLL, 0, 0, @"IXSPlaceholderPromise with UUID %@ was complete but found nothing at %@", v150, (uint64_t)v149);

            v152 = (void *)v205[5];
            v205[5] = v151;
          }
          v142 = v167;
        }
        v153 = (void *)v205[5];
        if (a4 && v153)
        {
          *a4 = v153;
          v153 = (void *)v205[5];
          v142 = v167;
        }
        if (v153)
        {
          -[IXSPlaceholder setAwakeningError:](v142, "setAwakeningError:");
          [(IXSPlaceholder *)v142 cancelForReason:v205[5] client:15 error:0];
          BOOL v7 = v205[5] == 0;
          goto LABEL_102;
        }
LABEL_101:
        BOOL v7 = 1;
        goto LABEL_102;
      }
      v49 = [(IXSPlaceholder *)v33 infoPlistIconContentPromise];
      BOOL v50 = v49 == 0;

      if (v50) {
        goto LABEL_37;
      }
      [(IXSPlaceholder *)v167 setInfoPlistIconContentPromise:0];
      [(IXSPlaceholder *)v167 setInfoPlistIconContentPromiseUUID:0];
      v51 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        sub_10008DF2C();
      }

      uint64_t v53 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder awakeFromSerializationWithLookupBlock:error:]", 256, @"IXErrorDomain", 3uLL, 0, 0, @"%@: Found info plist icon content promise but not icon resources promise", v52, (uint64_t)v167);
    }
    uint64_t v56 = v53;
    v48 = (void *)v205[5];
    v205[5] = v56;
    goto LABEL_36;
  }
  if (a4)
  {
    [(IXSPlaceholder *)self awakeningError];
    BOOL v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v7 = 0;
  }
LABEL_102:
  _Block_object_dispose(&v204, 8);

  return v7;
}

- (void)setIcon:(id)a3
{
  id v5 = (IXSOwnedDataPromise *)a3;
  uint64_t v6 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v6);

  p_icon = &self->_icon;
  if (self->_icon != v5)
  {
    uint64_t v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v17 = "-[IXSPlaceholder setIcon:]";
      __int16 v18 = 2112;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@: setting icon promise to %@", buf, 0x20u);
    }

    if (*p_icon)
    {
      id v9 = [(IXSDataPromise *)*p_icon accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001E940;
      block[3] = &unk_1000E8FA8;
      block[4] = self;
      dispatch_sync(v9, block);
    }
    objc_storeStrong((id *)&self->_icon, a3);
    if (v5)
    {
      uint64_t v10 = [(IXSDataPromise *)v5 accessQueue];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10001E954;
      v12[3] = &unk_1000E8E08;
      uint64_t v13 = v5;
      uint64_t v14 = self;
      dispatch_sync(v10, v12);
    }
    uint64_t v11 = [(IXSDataPromise *)v5 uniqueIdentifier];
    [(IXSPlaceholder *)self setIconPromiseUUID:v11];

    [(IXSDataPromise *)self saveState];
    [(IXSPlaceholder *)self _materializeIfReady];
  }
}

- (void)setIconResourcesPromise:(id)a3
{
  id v5 = (IXSPromisedTransferToPath *)a3;
  uint64_t v6 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v6);

  p_iconResourcesPromise = &self->_iconResourcesPromise;
  if (self->_iconResourcesPromise != v5)
  {
    uint64_t v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v17 = "-[IXSPlaceholder setIconResourcesPromise:]";
      __int16 v18 = 2112;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@: setting icon resources promise to %@", buf, 0x20u);
    }

    if (*p_iconResourcesPromise)
    {
      id v9 = [(IXSDataPromise *)*p_iconResourcesPromise accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001EBB8;
      block[3] = &unk_1000E8FA8;
      block[4] = self;
      dispatch_sync(v9, block);
    }
    objc_storeStrong((id *)&self->_iconResourcesPromise, a3);
    if (v5)
    {
      uint64_t v10 = [(IXSDataPromise *)v5 accessQueue];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10001EBCC;
      v12[3] = &unk_1000E8E08;
      uint64_t v13 = v5;
      uint64_t v14 = self;
      dispatch_sync(v10, v12);
    }
    uint64_t v11 = [(IXSDataPromise *)v5 uniqueIdentifier];
    [(IXSPlaceholder *)self setIconResourcesPromiseUUID:v11];
  }
}

- (void)setInfoPlistIconContentPromise:(id)a3
{
  id v5 = (IXSPromisedInMemoryDictionary *)a3;
  uint64_t v6 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v6);

  p_infoPlistIconContentPromise = &self->_infoPlistIconContentPromise;
  if (self->_infoPlistIconContentPromise != v5)
  {
    uint64_t v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v17 = "-[IXSPlaceholder setInfoPlistIconContentPromise:]";
      __int16 v18 = 2112;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@: setting Info.plist icon content promise to %@", buf, 0x20u);
    }

    if (*p_infoPlistIconContentPromise)
    {
      id v9 = [(IXSDataPromise *)*p_infoPlistIconContentPromise accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001EE30;
      block[3] = &unk_1000E8FA8;
      block[4] = self;
      dispatch_sync(v9, block);
    }
    objc_storeStrong((id *)&self->_infoPlistIconContentPromise, a3);
    if (v5)
    {
      uint64_t v10 = [(IXSDataPromise *)v5 accessQueue];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10001EE44;
      v12[3] = &unk_1000E8E08;
      uint64_t v13 = v5;
      uint64_t v14 = self;
      dispatch_sync(v10, v12);
    }
    uint64_t v11 = [(IXSDataPromise *)v5 uniqueIdentifier];
    [(IXSPlaceholder *)self setInfoPlistIconContentPromiseUUID:v11];
  }
}

- (void)setIconResourcesPromise:(id)a3 andInfoPlistIconContentPromise:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v8);

  [(IXSPlaceholder *)self setIconResourcesPromise:v7];
  [(IXSPlaceholder *)self setInfoPlistIconContentPromise:v6];

  [(IXSDataPromise *)self saveState];

  [(IXSPlaceholder *)self _materializeIfReady];
}

- (void)setMetadataPromise:(id)a3
{
  id v5 = (IXSPromisedInMemoryData *)a3;
  id v6 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v6);

  p_metadataPromise = &self->_metadataPromise;
  if (self->_metadataPromise != v5)
  {
    uint64_t v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v17 = "-[IXSPlaceholder setMetadataPromise:]";
      __int16 v18 = 2112;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@: setting metadata promise to %@", buf, 0x20u);
    }

    if (*p_metadataPromise)
    {
      id v9 = [(IXSDataPromise *)*p_metadataPromise accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001F140;
      block[3] = &unk_1000E8FA8;
      block[4] = self;
      dispatch_sync(v9, block);
    }
    objc_storeStrong((id *)&self->_metadataPromise, a3);
    if (v5)
    {
      uint64_t v10 = [(IXSDataPromise *)v5 accessQueue];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10001F154;
      v12[3] = &unk_1000E8E08;
      uint64_t v13 = v5;
      uint64_t v14 = self;
      dispatch_sync(v10, v12);
    }
    uint64_t v11 = [(IXSDataPromise *)v5 uniqueIdentifier];
    [(IXSPlaceholder *)self setMetadataPromiseUUID:v11];

    [(IXSDataPromise *)self saveState];
  }
}

- (void)setSinfPromise:(id)a3
{
  id v5 = (IXSPromisedInMemoryData *)a3;
  id v6 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v6);

  p_sinfPromise = &self->_sinfPromise;
  if (self->_sinfPromise != v5)
  {
    uint64_t v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v17 = "-[IXSPlaceholder setSinfPromise:]";
      __int16 v18 = 2112;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@: setting sinf promise to %@", buf, 0x20u);
    }

    if (*p_sinfPromise)
    {
      id v9 = [(IXSDataPromise *)*p_sinfPromise accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001F3C0;
      block[3] = &unk_1000E8FA8;
      block[4] = self;
      dispatch_sync(v9, block);
    }
    objc_storeStrong((id *)&self->_sinfPromise, a3);
    if (v5)
    {
      uint64_t v10 = [(IXSDataPromise *)v5 accessQueue];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10001F3D4;
      v12[3] = &unk_1000E8E08;
      uint64_t v13 = v5;
      uint64_t v14 = self;
      dispatch_sync(v10, v12);
    }
    uint64_t v11 = [(IXSDataPromise *)v5 uniqueIdentifier];
    [(IXSPlaceholder *)self setSinfPromiseUUID:v11];

    [(IXSDataPromise *)self saveState];
  }
}

- (void)setLocalizationDictionaryPromise:(id)a3
{
  id v5 = (IXSPromisedInMemoryDictionary *)a3;
  id v6 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v6);

  p_localizationDictionaryPromise = &self->_localizationDictionaryPromise;
  if (self->_localizationDictionaryPromise != v5)
  {
    uint64_t v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v17 = "-[IXSPlaceholder setLocalizationDictionaryPromise:]";
      __int16 v18 = 2112;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@: setting localization dict promise to %@", buf, 0x20u);
    }

    if (*p_localizationDictionaryPromise)
    {
      id v9 = [(IXSDataPromise *)*p_localizationDictionaryPromise accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001F640;
      block[3] = &unk_1000E8FA8;
      block[4] = self;
      dispatch_sync(v9, block);
    }
    objc_storeStrong((id *)&self->_localizationDictionaryPromise, a3);
    if (v5)
    {
      uint64_t v10 = [(IXSDataPromise *)v5 accessQueue];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10001F654;
      v12[3] = &unk_1000E8E08;
      uint64_t v13 = v5;
      uint64_t v14 = self;
      dispatch_sync(v10, v12);
    }
    uint64_t v11 = [(IXSDataPromise *)v5 uniqueIdentifier];
    [(IXSPlaceholder *)self setLocalizationDictionaryPromiseUUID:v11];

    [(IXSDataPromise *)self saveState];
  }
}

- (void)setEntitlements:(id)a3
{
  id v5 = (IXSOwnedDataPromise *)a3;
  id v6 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v6);

  p_entitlements = &self->_entitlements;
  if (self->_entitlements != v5)
  {
    uint64_t v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v17 = "-[IXSPlaceholder setEntitlements:]";
      __int16 v18 = 2112;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@: setting entitlements promise to %@", buf, 0x20u);
    }

    if (*p_entitlements)
    {
      id v9 = [(IXSDataPromise *)*p_entitlements accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001F8C8;
      block[3] = &unk_1000E8FA8;
      block[4] = self;
      dispatch_sync(v9, block);
    }
    objc_storeStrong((id *)&self->_entitlements, a3);
    if (v5)
    {
      uint64_t v10 = [(IXSDataPromise *)v5 accessQueue];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10001F8DC;
      v12[3] = &unk_1000E8E08;
      uint64_t v13 = v5;
      uint64_t v14 = self;
      dispatch_sync(v10, v12);
    }
    uint64_t v11 = [(IXSDataPromise *)v5 uniqueIdentifier];
    [(IXSPlaceholder *)self setEntitlementsPromiseUUID:v11];

    [(IXSDataPromise *)self saveState];
    [(IXSPlaceholder *)self _materializeIfReady];
  }
}

- (void)setInfoPlistLoctable:(id)a3
{
  id v5 = (IXSOwnedDataPromise *)a3;
  id v6 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v6);

  p_infoPlistLoctable = &self->_infoPlistLoctable;
  if (self->_infoPlistLoctable != v5)
  {
    uint64_t v8 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v17 = "-[IXSPlaceholder setInfoPlistLoctable:]";
      __int16 v18 = 2112;
      v19 = self;
      __int16 v20 = 2112;
      v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@: setting loctable promise to %@", buf, 0x20u);
    }

    if (*p_infoPlistLoctable)
    {
      id v9 = [(IXSDataPromise *)*p_infoPlistLoctable accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001FB50;
      block[3] = &unk_1000E8FA8;
      block[4] = self;
      dispatch_sync(v9, block);
    }
    objc_storeStrong((id *)&self->_infoPlistLoctable, a3);
    if (v5)
    {
      uint64_t v10 = [(IXSDataPromise *)v5 accessQueue];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10001FB64;
      v12[3] = &unk_1000E8E08;
      uint64_t v13 = v5;
      uint64_t v14 = self;
      dispatch_sync(v10, v12);
    }
    uint64_t v11 = [(IXSDataPromise *)v5 uniqueIdentifier];
    [(IXSPlaceholder *)self setInfoPlistLoctablePromiseUUID:v11];

    [(IXSDataPromise *)self saveState];
    [(IXSPlaceholder *)self _materializeIfReady];
  }
}

- (void)setAppExtensionPlaceholders:(id)a3
{
  id v4 = a3;
  id v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  CFStringRef v25 = objc_opt_new();
  id v6 = self;
  id v7 = [(IXSPlaceholder *)self bundleID];
  v24 = +[NSString stringWithFormat:@"%@.", v7];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v8 = (NSArray *)v4;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v14 = [v13 accessQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10001FF68;
        block[3] = &unk_1000E9328;
        block[4] = v13;
        id v32 = v24;
        v33 = self;
        id v34 = v25;
        dispatch_sync(v14, block);
      }
      id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v10);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v15 = self->_appExtensionPlaceholders;
  id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v27 objects:v45 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v28;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        __int16 v20 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
        if (![(NSArray *)v8 containsObject:v20])
        {
          v21 = [v20 accessQueue];
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_100020150;
          v26[3] = &unk_1000E8FA8;
          v26[4] = v20;
          dispatch_sync(v21, v26);
        }
      }
      id v17 = [(NSArray *)v15 countByEnumeratingWithState:&v27 objects:v45 count:16];
    }
    while (v17);
  }

  uint64_t v22 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v40 = "-[IXSPlaceholder setAppExtensionPlaceholders:]";
    __int16 v41 = 2112;
    uint64_t v42 = v6;
    __int16 v43 = 2112;
    v44 = v8;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: %@: setting app extension placeholder promises to %@", buf, 0x20u);
  }

  appExtensionPlaceholders = v6->_appExtensionPlaceholders;
  v6->_appExtensionPlaceholders = v8;

  [(IXSPlaceholder *)v6 setAppExtensionPlaceholdersPromiseUUIDs:v25];
  [(IXSDataPromise *)v6 saveState];
  [(IXSPlaceholder *)v6 _materializeIfReady];
}

- (void)setConfigurationComplete:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_configurationComplete != v3)
  {
    id v6 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      id v9 = "-[IXSPlaceholder setConfigurationComplete:]";
      if (v3) {
        int v7 = 89;
      }
      else {
        int v7 = 78;
      }
      __int16 v10 = 2112;
      uint64_t v11 = self;
      __int16 v12 = 1024;
      int v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@: setting configuration complete to %c", (uint8_t *)&v8, 0x1Cu);
    }

    self->_configurationComplete = v3;
    [(IXSDataPromise *)self saveState];
    [(IXSPlaceholder *)self _materializeIfReady];
  }
}

- (void)setAttributes:(id)a3
{
  id v5 = a3;
  id v6 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v6);

  if (!self->_attributes || (objc_msgSend(v5, "isEqual:") & 1) == 0)
  {
    int v7 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      id v9 = "-[IXSPlaceholder setAttributes:]";
      __int16 v10 = 2112;
      uint64_t v11 = self;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %@: setting placeholder attributes to %@", (uint8_t *)&v8, 0x20u);
    }

    objc_storeStrong((id *)&self->_attributes, a3);
    [(IXSDataPromise *)self saveState];
  }
}

+ (id)_metadataFromPromise:(id)a3
{
  id v3 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_10001E110;
  long long v27 = sub_10001E120;
  id v28 = 0;
  id v4 = [v3 accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000206E0;
  block[3] = &unk_1000E90A8;
  uint64_t v22 = &v23;
  id v5 = v3;
  id v21 = v5;
  dispatch_sync(v4, block);

  if (!v24[5])
  {
    id v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [v5 uniqueIdentifier];
      sub_10008E0BC(v14, buf, v13);
    }
    id v6 = 0;
    id v10 = 0;
    goto LABEL_13;
  }
  id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  id v7 = objc_alloc((Class)NSKeyedUnarchiver);
  uint64_t v8 = v24[5];
  id v19 = 0;
  id v9 = [v7 initForReadingFromData:v8 error:&v19];
  id v10 = v19;
  if (!v9)
  {
    id v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = [v5 uniqueIdentifier];
      sub_10008E128(v15, (uint64_t)v10, buf);
    }
LABEL_13:

    id v9 = 0;
    uint64_t v11 = 0;
    goto LABEL_14;
  }
  uint64_t v11 = [v9 decodeObjectOfClasses:v6 forKey:NSKeyedArchiveRootObjectKey];
  if (!v11)
  {
    __int16 v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [v5 uniqueIdentifier];
      objc_claimAutoreleasedReturnValue();
      [v9 error];
      objc_claimAutoreleasedReturnValue();
      sub_10008E184();
    }
  }
  [v9 finishDecoding];
LABEL_14:
  id v16 = v21;
  id v17 = v11;

  _Block_object_dispose(&v23, 8);

  return v17;
}

- (MIStoreMetadata)metadata
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(IXSPlaceholder *)self metadataPromise];
  if (v4)
  {
    id v5 = [(id)objc_opt_class() _metadataFromPromise:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (MIStoreMetadata *)v5;
}

- (NSData)sinfData
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10001E110;
  id v17 = sub_10001E120;
  id v18 = 0;
  id v4 = [(IXSPlaceholder *)self sinfPromise];

  if (v4)
  {
    id v5 = [(IXSPlaceholder *)self sinfPromise];
    id v6 = [v5 accessQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000209E8;
    v12[3] = &unk_1000E90A8;
    void v12[4] = self;
    v12[5] = &v13;
    dispatch_sync(v6, v12);

    if (!v14[5])
    {
      id v7 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [(IXSPlaceholder *)self sinfPromise];
        id v9 = [v8 uniqueIdentifier];
        *(_DWORD *)buf = 136315394;
        __int16 v20 = "-[IXSPlaceholder sinfData]";
        __int16 v21 = 2112;
        uint64_t v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: No data on the sinf promise %@", buf, 0x16u);
      }
    }
  }
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (NSData *)v10;
}

- (NSDictionary)localizationDictionary
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10001E110;
  id v17 = sub_10001E120;
  id v18 = 0;
  id v4 = [(IXSPlaceholder *)self localizationDictionaryPromise];

  if (v4)
  {
    id v5 = [(IXSPlaceholder *)self localizationDictionaryPromise];
    id v6 = [v5 accessQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100020C8C;
    v12[3] = &unk_1000E90A8;
    void v12[4] = self;
    v12[5] = &v13;
    dispatch_sync(v6, v12);

    if (!v14[5])
    {
      id v7 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [(IXSPlaceholder *)self localizationDictionaryPromise];
        id v9 = [v8 uniqueIdentifier];
        *(_DWORD *)buf = 136315394;
        __int16 v20 = "-[IXSPlaceholder localizationDictionary]";
        __int16 v21 = 2112;
        uint64_t v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: No dictionary on the localization dict promise %@", buf, 0x16u);
      }
    }
  }
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return (NSDictionary *)v10;
}

- (BOOL)_isReadyToMaterialize
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(IXSDataPromise *)self error];

  if (v4)
  {
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10008E270(self);
    }
LABEL_25:
    BOOL v25 = 0;
    goto LABEL_26;
  }
  if (![(IXSPlaceholder *)self configurationComplete])
  {
    id v5 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10008E1DC(self);
    }
    goto LABEL_25;
  }
  id v6 = [(IXSPlaceholder *)self icon];
  id v5 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v7 = [v6 accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000212B4;
  block[3] = &unk_1000E96E8;
  uint64_t v8 = v5;
  uint64_t v42 = self;
  __int16 v43 = &v44;
  __int16 v41 = v8;
  dispatch_sync((dispatch_queue_t)v7, block);

  LOBYTE(v7) = *((unsigned char *)v45 + 24) == 0;
  _Block_object_dispose(&v44, 8);
  if (v7)
  {
    BOOL v25 = 0;
    id v5 = v8;
  }
  else
  {
LABEL_7:
    long long v27 = [(IXSPlaceholder *)self iconResourcesPromise];
    if (v27)
    {
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x2020000000;
      char v47 = 0;
      id v9 = [v27 accessQueue];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100021348;
      v36[3] = &unk_1000E96E8;
      long long v38 = self;
      v39 = &v44;
      id v37 = v27;
      dispatch_sync(v9, v36);

      BOOL v10 = *((unsigned char *)v45 + 24) == 0;
      _Block_object_dispose(&v44, 8);
      if (v10) {
        goto LABEL_27;
      }
    }
    uint64_t v11 = [(IXSPlaceholder *)self entitlements];

    if (v11)
    {
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x2020000000;
      char v47 = 0;
      __int16 v12 = [(IXSPlaceholder *)self entitlements];
      uint64_t v13 = [v12 accessQueue];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1000213DC;
      v35[3] = &unk_1000E9230;
      v35[4] = self;
      v35[5] = &v44;
      dispatch_sync(v13, v35);

      int v14 = *((unsigned __int8 *)v45 + 24);
      _Block_object_dispose(&v44, 8);
      if (!v14) {
        goto LABEL_27;
      }
    }
    uint64_t v15 = [(IXSPlaceholder *)self infoPlistLoctable];

    if (!v15) {
      goto LABEL_13;
    }
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    char v47 = 0;
    id v16 = [(IXSPlaceholder *)self infoPlistLoctable];
    id v17 = [v16 accessQueue];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100021478;
    v34[3] = &unk_1000E9230;
    v34[4] = self;
    v34[5] = &v44;
    dispatch_sync(v17, v34);

    int v18 = *((unsigned __int8 *)v45 + 24);
    _Block_object_dispose(&v44, 8);
    if (!v18)
    {
LABEL_27:
      BOOL v25 = 0;
    }
    else
    {
LABEL_13:
      id v19 = [(IXSPlaceholder *)self appExtensionPlaceholders];

      if (v19)
      {
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id obj = [(IXSPlaceholder *)self appExtensionPlaceholders];
        id v20 = [obj countByEnumeratingWithState:&v30 objects:v48 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v31;
          while (2)
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v31 != v21) {
                objc_enumerationMutation(obj);
              }
              uint64_t v23 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              uint64_t v44 = 0;
              v45 = &v44;
              uint64_t v46 = 0x2020000000;
              char v47 = 0;
              v24 = [v23 accessQueue];
              v29[0] = _NSConcreteStackBlock;
              v29[1] = 3221225472;
              v29[2] = sub_100021514;
              v29[3] = &unk_1000E96E8;
              v29[5] = self;
              v29[6] = &v44;
              v29[4] = v23;
              dispatch_sync(v24, v29);

              LODWORD(v23) = *((unsigned __int8 *)v45 + 24);
              _Block_object_dispose(&v44, 8);
              if (!v23)
              {
                BOOL v25 = 0;
                goto LABEL_30;
              }
            }
            id v20 = [obj countByEnumeratingWithState:&v30 objects:v48 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }
        BOOL v25 = 1;
LABEL_30:
      }
      else
      {
        BOOL v25 = 1;
      }
    }
  }
LABEL_26:

  return v25;
}

- (void)_materializeIfReady
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  if ([(IXSPlaceholder *)self _isReadyToMaterialize])
  {
    id v4 = [(IXSOwnedDataPromise *)self stagedPath];

    if (!v4)
    {
      if ([(IXSPlaceholder *)self _materialize])
      {
        id v5 = [(IXSDataPromise *)self delegate];
        if (v5)
        {
          if (objc_opt_respondsToSelector())
          {
            id v6 = [(IXSDataPromise *)self delegateDeliveryQueue];
            v7[0] = _NSConcreteStackBlock;
            v7[1] = 3221225472;
            v7[2] = sub_1000216B4;
            v7[3] = &unk_1000E8E08;
            id v8 = v5;
            id v9 = self;
            sub_100066F24(v6, v7);
          }
        }
      }
    }
  }
}

- (BOOL)isComplete
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  if (![(IXSPlaceholder *)self _isReadyToMaterialize]) {
    return 0;
  }
  id v4 = [(IXSOwnedDataPromise *)self stagedPath];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)setComplete:(BOOL)a3
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);
}

- (double)percentComplete
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(IXSDataPromise *)self error];

  double v5 = 0.0;
  if (!v4 && [(IXSPlaceholder *)self configurationComplete])
  {
    long long v27 = [(IXSPlaceholder *)self icon];
    uint64_t v26 = [(IXSPlaceholder *)self iconResourcesPromise];
    id v6 = v27;
    if (v27 || (id v6 = v26) != 0)
    {
      id v7 = v6;
      uint64_t v41 = 0;
      uint64_t v42 = (double *)&v41;
      uint64_t v43 = 0x2020000000;
      uint64_t v44 = 0;
      id v8 = [v7 accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100021BC0;
      block[3] = &unk_1000E90A8;
      v40 = &v41;
      id v24 = v7;
      id v39 = v24;
      dispatch_sync(v8, block);

      double v9 = v42[3];
      double v10 = v9 + 0.0;
      _Block_object_dispose(&v41, 8);
      [(IXSPlaceholder *)self entitlements];
    }
    else
    {
      double v10 = 0.300000012;
      [(IXSPlaceholder *)self entitlements];
    uint64_t v11 = };

    if (v11)
    {
      uint64_t v41 = 0;
      uint64_t v42 = (double *)&v41;
      uint64_t v43 = 0x2020000000;
      uint64_t v44 = 0;
      __int16 v12 = [(IXSPlaceholder *)self entitlements];
      uint64_t v13 = [v12 accessQueue];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100021C00;
      v37[3] = &unk_1000E90A8;
      v37[4] = self;
      v37[5] = &v41;
      dispatch_sync(v13, v37);

      double v14 = v42[3];
      _Block_object_dispose(&v41, 8);
    }
    else
    {
      double v14 = 0.200000003;
    }
    uint64_t v15 = [(IXSPlaceholder *)self appExtensionPlaceholders];

    if (v15)
    {
      uint64_t v41 = 0;
      uint64_t v42 = (double *)&v41;
      uint64_t v43 = 0x2020000000;
      uint64_t v44 = 0;
      uint64_t v33 = 0;
      id v34 = (double *)&v33;
      uint64_t v35 = 0x2020000000;
      uint64_t v36 = 0;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v16 = [(IXSPlaceholder *)self appExtensionPlaceholders];
      id v17 = [v16 countByEnumeratingWithState:&v29 objects:v45 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v30;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v30 != v18) {
              objc_enumerationMutation(v16);
            }
            id v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v21 = [v20 accessQueue];
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472;
            v28[2] = sub_100021C68;
            v28[3] = &unk_1000E9710;
            v28[4] = v20;
            v28[5] = &v41;
            v28[6] = &v33;
            dispatch_sync(v21, v28);
          }
          id v17 = [v16 countByEnumeratingWithState:&v29 objects:v45 count:16];
        }
        while (v17);
      }

      double v22 = v42[3] / v34[3] * 0.5;
      _Block_object_dispose(&v33, 8);
      _Block_object_dispose(&v41, 8);
    }
    else
    {
      double v22 = 0.5;
    }
    if (v10 + v14 + v22 <= 1.0) {
      double v5 = v10 + v14 + v22;
    }
    else {
      double v5 = 1.0;
    }
  }
  return v5;
}

- (void)setPercentComplete:(double)a3
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);
}

- (void)_cancelPromise:(id)a3 forReason:(id)a4 client:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    double v9 = [v7 accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100021DD0;
    block[3] = &unk_1000E9738;
    id v11 = v7;
    id v12 = v8;
    unint64_t v13 = a5;
    dispatch_sync(v9, block);
  }
}

- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  double v9 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v9);

  if (!v8)
  {
    uint64_t v26 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_10008E628();
    }

    id v28 = @"Reason passed to -[IXSPlaceholder cancelForReason:] was nil";
    uint64_t v29 = 1059;
LABEL_20:
    sub_10003DAE4((uint64_t)"-[IXSPlaceholder cancelForReason:client:error:]", v29, @"IXErrorDomain", 0x35uLL, 0, 0, v28, v27, v32);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v24 = 0;
    if (!a5) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  if (!a4)
  {
    long long v30 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10008E6A0();
    }

    id v28 = @"Client passed to -[IXSPlaceholder cancelForReason:] was IXClientNone (0)";
    uint64_t v29 = 1064;
    goto LABEL_20;
  }
  double v10 = [(IXSPlaceholder *)self icon];
  [(IXSPlaceholder *)self _cancelPromise:v10 forReason:v8 client:a4];

  id v11 = [(IXSPlaceholder *)self iconResourcesPromise];
  [(IXSPlaceholder *)self _cancelPromise:v11 forReason:v8 client:a4];

  id v12 = [(IXSPlaceholder *)self infoPlistIconContentPromise];
  [(IXSPlaceholder *)self _cancelPromise:v12 forReason:v8 client:a4];

  unint64_t v13 = [(IXSPlaceholder *)self entitlements];
  [(IXSPlaceholder *)self _cancelPromise:v13 forReason:v8 client:a4];

  double v14 = [(IXSPlaceholder *)self infoPlistLoctable];
  [(IXSPlaceholder *)self _cancelPromise:v14 forReason:v8 client:a4];

  uint64_t v15 = [(IXSPlaceholder *)self metadataPromise];
  [(IXSPlaceholder *)self _cancelPromise:v15 forReason:v8 client:a4];

  id v16 = [(IXSPlaceholder *)self sinfPromise];
  [(IXSPlaceholder *)self _cancelPromise:v16 forReason:v8 client:a4];

  id v17 = [(IXSPlaceholder *)self localizationDictionaryPromise];
  [(IXSPlaceholder *)self _cancelPromise:v17 forReason:v8 client:a4];

  uint64_t v18 = [(IXSPlaceholder *)self appExtensionPlaceholders];

  if (v18)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v19 = [(IXSPlaceholder *)self appExtensionPlaceholders];
    id v20 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v36;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(v19);
          }
          [(IXSPlaceholder *)self _cancelPromise:*(void *)(*((void *)&v35 + 1) + 8 * i) forReason:v8 client:a4];
        }
        id v21 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v21);
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)IXSPlaceholder;
  id v34 = 0;
  BOOL v24 = [(IXSOwnedDataPromise *)&v33 cancelForReason:v8 client:a4 error:&v34];
  id v25 = v34;
  if (a5)
  {
LABEL_21:
    if (!v24) {
      *a5 = v25;
    }
  }
LABEL_23:

  return v24;
}

- (NSString)bundleName
{
  v2 = [(IXSDataPromise *)self seed];
  id v3 = [v2 bundleName];
  id v4 = [v3 copy];

  return (NSString *)v4;
}

- (NSString)bundleID
{
  v2 = [(IXSDataPromise *)self seed];
  id v3 = [v2 bundleID];
  id v4 = [v3 copy];

  return (NSString *)v4;
}

- (unint64_t)installType
{
  v2 = [(IXSDataPromise *)self seed];
  id v3 = [v2 installType];

  return (unint64_t)v3;
}

- (unint64_t)totalBytesNeededOnDisk
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  unint64_t v23 = 0;
  id v4 = [(IXSPlaceholder *)self icon];
  sub_100022504(v4, (uint64_t)&v23);

  double v5 = [(IXSPlaceholder *)self iconResourcesPromise];
  sub_100022504(v5, (uint64_t)&v23);

  id v6 = [(IXSPlaceholder *)self infoPlistIconContentPromise];
  sub_100022504(v6, (uint64_t)&v23);

  id v7 = [(IXSPlaceholder *)self entitlements];
  sub_100022504(v7, (uint64_t)&v23);

  id v8 = [(IXSPlaceholder *)self infoPlistLoctable];
  sub_100022504(v8, (uint64_t)&v23);

  double v9 = [(IXSPlaceholder *)self metadataPromise];
  sub_100022504(v9, (uint64_t)&v23);

  double v10 = [(IXSPlaceholder *)self sinfPromise];
  sub_100022504(v10, (uint64_t)&v23);

  id v11 = [(IXSPlaceholder *)self localizationDictionaryPromise];
  sub_100022504(v11, (uint64_t)&v23);

  id v12 = [(IXSPlaceholder *)self appExtensionPlaceholders];

  if (v12)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    unint64_t v13 = [(IXSPlaceholder *)self appExtensionPlaceholders];
    id v14 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        id v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          sub_100022504(*(void **)(*((void *)&v19 + 1) + 8 * (void)v17), (uint64_t)&v23);
          id v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v15);
    }
  }
  return v23;
}

- (id)_promiseUUIDsForPromise:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_10001E110;
  id v17 = sub_10001E120;
  id v18 = 0;
  if (v3)
  {
    double v5 = [v3 accessQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100022718;
    v10[3] = &unk_1000E90A8;
    id v12 = &v13;
    id v11 = v4;
    dispatch_sync(v5, v10);

    id v6 = v11;
  }
  else
  {
    uint64_t v7 = +[NSSet set];
    id v6 = (void *)v14[5];
    v14[5] = v7;
  }

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (id)subPromiseUUIDs
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_opt_new();
  double v5 = [(IXSPlaceholder *)self icon];
  id v6 = [(IXSPlaceholder *)self _promiseUUIDsForPromise:v5];
  [v4 unionSet:v6];

  uint64_t v7 = [(IXSPlaceholder *)self iconResourcesPromise];
  id v8 = [(IXSPlaceholder *)self _promiseUUIDsForPromise:v7];
  [v4 unionSet:v8];

  double v9 = [(IXSPlaceholder *)self infoPlistIconContentPromise];
  double v10 = [(IXSPlaceholder *)self _promiseUUIDsForPromise:v9];
  [v4 unionSet:v10];

  id v11 = [(IXSPlaceholder *)self entitlements];
  id v12 = [(IXSPlaceholder *)self _promiseUUIDsForPromise:v11];
  [v4 unionSet:v12];

  uint64_t v13 = [(IXSPlaceholder *)self infoPlistLoctable];
  id v14 = [(IXSPlaceholder *)self _promiseUUIDsForPromise:v13];
  [v4 unionSet:v14];

  uint64_t v15 = [(IXSPlaceholder *)self metadataPromise];
  uint64_t v16 = [(IXSPlaceholder *)self _promiseUUIDsForPromise:v15];
  [v4 unionSet:v16];

  id v17 = [(IXSPlaceholder *)self sinfPromise];
  id v18 = [(IXSPlaceholder *)self _promiseUUIDsForPromise:v17];
  [v4 unionSet:v18];

  long long v19 = [(IXSPlaceholder *)self localizationDictionaryPromise];
  long long v20 = [(IXSPlaceholder *)self _promiseUUIDsForPromise:v19];
  [v4 unionSet:v20];

  long long v21 = [(IXSPlaceholder *)self appExtensionPlaceholders];

  if (v21)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v22 = [(IXSPlaceholder *)self appExtensionPlaceholders];
    id v23 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = [(IXSPlaceholder *)self _promiseUUIDsForPromise:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          [v4 unionSet:v27];
        }
        id v24 = [v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v24);
    }
  }
  id v28 = [v4 copy];

  return v28;
}

- (void)_decommissionPromise:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    double v5 = [v3 accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100022B7C;
    block[3] = &unk_1000E8FA8;
    id v7 = v4;
    dispatch_sync(v5, block);
  }
}

- (void)decommission
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(IXSPlaceholder *)self icon];
  [(IXSPlaceholder *)self _decommissionPromise:v4];

  double v5 = [(IXSPlaceholder *)self iconResourcesPromise];
  [(IXSPlaceholder *)self _decommissionPromise:v5];

  id v6 = [(IXSPlaceholder *)self infoPlistIconContentPromise];
  [(IXSPlaceholder *)self _decommissionPromise:v6];

  id v7 = [(IXSPlaceholder *)self entitlements];
  [(IXSPlaceholder *)self _decommissionPromise:v7];

  id v8 = [(IXSPlaceholder *)self infoPlistLoctable];
  [(IXSPlaceholder *)self _decommissionPromise:v8];

  double v9 = [(IXSPlaceholder *)self metadataPromise];
  [(IXSPlaceholder *)self _decommissionPromise:v9];

  double v10 = [(IXSPlaceholder *)self sinfPromise];
  [(IXSPlaceholder *)self _decommissionPromise:v10];

  id v11 = [(IXSPlaceholder *)self localizationDictionaryPromise];
  [(IXSPlaceholder *)self _decommissionPromise:v11];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = [(IXSPlaceholder *)self appExtensionPlaceholders];
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        [(IXSPlaceholder *)self _decommissionPromise:*(void *)(*((void *)&v18 + 1) + 8 * (void)v16)];
        uint64_t v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  v17.receiver = self;
  v17.super_class = (Class)IXSPlaceholder;
  [(IXSOwnedDataPromise *)&v17 decommission];
}

- (BOOL)_validateClientEntitlements:(id *)a3
{
  double v5 = [(IXSPlaceholder *)self entitlements];
  id v6 = [v5 accessQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(IXSPlaceholder *)self entitlements];
  id v8 = [v7 stagedPath];

  double v9 = +[NSDictionary dictionaryWithContentsOfURL:v8 error:0];
  double v10 = v9;
  if (!v9) {
    goto LABEL_9;
  }
  id v11 = [v9 objectForKeyedSubscript:@"com.apple.private.webkit.pushbundle"];
  unsigned __int8 v12 = sub_100082F48(v11, 0);

  id v13 = [v10 objectForKeyedSubscript:@"com.apple.developer.app-management-domain"];
  objc_opt_class();
  id v14 = v13;
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }

  if ((v12 & 1) == 0 && ![v15 isEqualToString:@"com.apple.WebKit.PushBundles"]
    || [(IXSPlaceholder *)self creatorHadWebPlaceholderInstallEntitlement])
  {

LABEL_9:
    id v16 = 0;
    BOOL v17 = 1;
    goto LABEL_10;
  }
  long long v19 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10008E718(self);
  }

  long long v20 = IXStringForClientID([(IXSDataPromise *)self creatorIdentifier]);
  sub_10003DAE4((uint64_t)"-[IXSPlaceholder _validateClientEntitlements:]", 1228, @"IXErrorDomain", 0x19uLL, 0, 0, @"The creator of placeholder %@ is missing the entitlement \"%@\" = TRUE which is required to create a web notification placeholder.", v21, (uint64_t)v20);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    id v16 = v16;
    BOOL v17 = 0;
    *a3 = v16;
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_10:

  return v17;
}

- (BOOL)_materialize
{
  id v3 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[IXFileManager defaultManager];
  uint64_t v87 = [(IXSPlaceholder *)self icon];
  v89 = [(IXSPlaceholder *)self iconResourcesPromise];
  v88 = [(IXSPlaceholder *)self infoPlistIconContentPromise];
  double v5 = [(IXSDataPromise *)self seed];
  unsigned __int8 v6 = [v5 isAppExtension];

  if (v6)
  {
    id v7 = [(IXSPlaceholder *)self bundleID];
    id v8 = +[NSString stringWithFormat:@"%@.appex", v7];
  }
  else
  {
    double v9 = [(IXSPlaceholder *)self bundleName];
    double v10 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    id v11 = [v9 stringByTrimmingCharactersInSet:v10];

    if (![v11 length])
    {
      uint64_t v12 = [(IXSPlaceholder *)self bundleID];

      id v11 = (void *)v12;
    }
    id v13 = [v11 stringByReplacingOccurrencesOfString:@"/" withString:@":"];

    id v14 = v13;
    if (strlen((const char *)[(__CFString *)v14 fileSystemRepresentation]) - 251 <= 0xFFFFFFFFFFFFFF00)
    {
      id v15 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10008E920();
      }

      CFStringRef v16 = sub_100013520(v14, 250);
      id v14 = (__CFString *)v16;
      if (!v16)
      {
        id v14 = [(IXSPlaceholder *)self bundleID];
      }
    }
    id v8 = +[NSString stringWithFormat:@"%@.app", v14];
  }
  BOOL v17 = [(IXSOwnedDataPromise *)self stagingBaseDir];
  long long v18 = [v17 URLByAppendingPathComponent:v8 isDirectory:1];

  v90 = [v18 URLByAppendingPathComponent:@"Info.plist" isDirectory:0];
  v85 = [v18 URLByAppendingPathComponent:@"Icon.png" isDirectory:0];
  uint64_t v86 = [v18 URLByAppendingPathComponent:@"PlaceholderEntitlements.plist" isDirectory:0];
  v84 = [v18 URLByAppendingPathComponent:@"InfoPlist.loctable" isDirectory:0];
  long long v19 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    long long v20 = [(IXSOwnedDataPromise *)self stagingBaseDir];
    uint64_t v21 = [v20 path];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[IXSPlaceholder _materialize]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v150 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: %@: Materializing placeholder at %@", buf, 0x20u);
  }
  id v141 = 0;
  unsigned __int8 v22 = [v4 createDirectoryAtURL:v18 withIntermediateDirectories:1 mode:493 class:4 error:&v141];
  id v23 = v141;
  if ((v22 & 1) == 0)
  {
    id v28 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10008E878(v18, (uint64_t)v23, v28);
    }

    uint64_t v29 = [v18 path];
    sub_10003DAE4((uint64_t)"-[IXSPlaceholder _materialize]", 1292, @"IXErrorDomain", 0x14uLL, v23, 0, @"Failed to create bundle directory at %@", v30, (uint64_t)v29);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    id v27 = 0;
    goto LABEL_38;
  }
  if (v89)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v150 = sub_10001E110;
    uint64_t v151 = sub_10001E120;
    id v152 = 0;
    id v24 = [v88 accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100024228;
    block[3] = &unk_1000E90A8;
    id v140 = buf;
    id v139 = v88;
    dispatch_sync(v24, block);

    if (*(void *)(*(void *)&buf[8] + 40))
    {
      uint64_t v25 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&buf[8] + 40);
        *(_DWORD *)v143 = 136315650;
        *(void *)&v143[4] = "-[IXSPlaceholder _materialize]";
        *(_WORD *)&v143[12] = 2112;
        *(void *)&v143[14] = self;
        *(_WORD *)&v143[22] = 2112;
        v144 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: %@: Using Info.plist icon content: %@", v143, 0x20u);
      }

      id v27 = [*(id *)(*(void *)&buf[8] + 40) mutableCopy];
    }
    else
    {
      id v27 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v27 = 0;
  }
  if (v87)
  {
    uint64_t v147 = _kCFBundleIconFileKey;
    CFStringRef v148 = @"Icon";
    long long v32 = +[NSDictionary dictionaryWithObjects:&v148 forKeys:&v147 count:1];
    id v33 = [v32 mutableCopy];

    id v27 = v33;
  }
  if (!v27) {
    id v27 = (id)objc_opt_new();
  }
  id v34 = [(IXSPlaceholder *)self bundleID];
  [v27 setObject:v34 forKeyedSubscript:kCFBundleIdentifierKey];

  long long v35 = [(IXSPlaceholder *)self bundleName];
  [v27 setObject:v35 forKeyedSubscript:kCFBundleNameKey];

  [v27 setObject:@"Executable" forKeyedSubscript:kCFBundleExecutableKey];
  long long v36 = [(IXSPlaceholder *)self bundleName];
  [v27 setObject:v36 forKeyedSubscript:_kCFBundleDisplayNameKey];

  long long v37 = [(IXSPlaceholder *)self attributes];

  if (v37)
  {
    long long v38 = [(IXSPlaceholder *)self attributes];
    id v39 = [v38 infoPlistContent];
    [v27 addEntriesFromDictionary:v39];
  }
  id v137 = v23;
  unsigned __int8 v40 = objc_msgSend(v27, "IX_writeToURL:format:options:error:", v90, 200, 1, &v137);
  id v41 = v137;

  if ((v40 & 1) == 0)
  {
    uint64_t v44 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_10008E7D0(v90, (uint64_t)v41, v44);
    }

    uint64_t v29 = [v90 path];
    sub_10003DAE4((uint64_t)"-[IXSPlaceholder _materialize]", 1327, @"IXErrorDomain", 0x14uLL, v41, 0, @"Failed to write bundle Info.plist to %@", v45, (uint64_t)v29);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = v41;
LABEL_38:

    goto LABEL_39;
  }
  if (v89)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v150 = sub_10001E110;
    uint64_t v151 = sub_10001E120;
    id v152 = 0;
    uint64_t v42 = [v89 accessQueue];
    v131[0] = _NSConcreteStackBlock;
    v131[1] = 3221225472;
    v131[2] = sub_100024274;
    v131[3] = &unk_1000E9760;
    id v132 = v89;
    id v133 = v4;
    uint64_t v136 = buf;
    id v134 = v18;
    uint64_t v135 = self;
    dispatch_sync(v42, v131);

    uint64_t v43 = *(void **)(*(void *)&buf[8] + 40);
    if (v43)
    {
      id v31 = v43;
    }
    else
    {
      id v31 = v41;
    }

    _Block_object_dispose(buf, 8);
    if (!v43) {
      goto LABEL_51;
    }
LABEL_39:
    uint64_t v46 = 0;
    goto LABEL_40;
  }
  if (v87)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v150 = sub_10001E110;
    uint64_t v151 = sub_10001E120;
    id v152 = 0;
    v49 = [v87 accessQueue];
    v125[0] = _NSConcreteStackBlock;
    v125[1] = 3221225472;
    v125[2] = sub_100024734;
    v125[3] = &unk_1000E9788;
    id v126 = v87;
    id v127 = v4;
    id v128 = v85;
    uint64_t v129 = self;
    v130 = buf;
    dispatch_sync(v49, v125);

    BOOL v50 = *(void **)(*(void *)&buf[8] + 40);
    if (v50)
    {
      id v31 = v50;
    }
    else
    {
      id v31 = v41;
    }

    _Block_object_dispose(buf, 8);
    if (!v50) {
      goto LABEL_51;
    }
    goto LABEL_39;
  }
  id v31 = v41;
LABEL_51:
  v51 = [(IXSPlaceholder *)self entitlements];

  if (v51)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v150 = sub_10001E110;
    uint64_t v151 = sub_10001E120;
    id v152 = 0;
    uint64_t v52 = [(IXSPlaceholder *)self entitlements];
    uint64_t v53 = [v52 accessQueue];
    v120[0] = _NSConcreteStackBlock;
    v120[1] = 3221225472;
    v120[2] = sub_100024A68;
    v120[3] = &unk_1000E9788;
    v120[4] = self;
    id v121 = v4;
    id v122 = v86;
    id v31 = v31;
    id v123 = v31;
    v124 = buf;
    dispatch_sync(v53, v120);

    v54 = *(void **)(*(void *)&buf[8] + 40);
    if (v54)
    {
      id v55 = v54;

      id v31 = v55;
    }

    _Block_object_dispose(buf, 8);
    if (v54) {
      goto LABEL_39;
    }
  }
  uint64_t v56 = [(IXSPlaceholder *)self infoPlistLoctable];
  uint64_t v46 = v56;
  if (!v56) {
    goto LABEL_60;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v150 = sub_10001E110;
  uint64_t v151 = sub_10001E120;
  id v152 = 0;
  v57 = [v56 accessQueue];
  v114[0] = _NSConcreteStackBlock;
  v114[1] = 3221225472;
  v114[2] = sub_100024E18;
  v114[3] = &unk_1000E9788;
  id v115 = v4;
  id v58 = v46;
  id v116 = v58;
  id v117 = v84;
  v118 = self;
  uint64_t v119 = buf;
  dispatch_sync(v57, v114);

  v59 = *(void **)(*(void *)&buf[8] + 40);
  if (v59)
  {
    id v60 = v59;

    id v31 = v60;
  }

  _Block_object_dispose(buf, 8);
  if (v59)
  {
    uint64_t v46 = v58;
  }
  else
  {
LABEL_60:
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v150 = sub_10001E110;
    uint64_t v151 = sub_10001E120;
    id v152 = 0;
    uint64_t v61 = [(IXSPlaceholder *)self localizationDictionary];
    v62 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = v61;
      v64 = [v61 allKeys];
      *(_DWORD *)v143 = 136315650;
      *(void *)&v143[4] = "-[IXSPlaceholder _materialize]";
      *(_WORD *)&v143[12] = 2112;
      *(void *)&v143[14] = self;
      *(_WORD *)&v143[22] = 2112;
      v144 = v64;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%s: %@: Including lproj localizations for %@", v143, 0x20u);

      uint64_t v61 = v63;
    }

    v109[0] = _NSConcreteStackBlock;
    v109[1] = 3221225472;
    v109[2] = sub_100025138;
    v109[3] = &unk_1000E97B0;
    id v83 = v18;
    id v110 = v83;
    id v82 = v4;
    id v111 = v82;
    uint64_t v112 = buf;
    BOOL v113 = v46 != 0;
    [v61 enumerateKeysAndObjectsUsingBlock:v109];
    v65 = *(void **)(*(void *)&buf[8] + 40);
    if (v65)
    {
      id v66 = v65;

      id v31 = v66;
    }

    _Block_object_dispose(buf, 8);
    if (!v65)
    {
      uint64_t v67 = [(IXSDataPromise *)self seed];
      if ([v67 isAppExtension])
      {
      }
      else
      {
        uint64_t v68 = [(IXSPlaceholder *)self appExtensionPlaceholders];
        BOOL v69 = [v68 count] == 0;

        if (!v69)
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          uint64_t v150 = sub_10001E110;
          uint64_t v151 = sub_10001E120;
          id v152 = 0;
          *(void *)v143 = 0;
          *(void *)&v143[8] = v143;
          *(void *)&v143[16] = 0x3032000000;
          v144 = sub_10001E110;
          uint64_t v145 = sub_10001E120;
          id v146 = 0;
          long long v105 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          v70 = [(IXSPlaceholder *)self appExtensionPlaceholders];
          id v71 = [v70 countByEnumeratingWithState:&v105 objects:v142 count:16];
          if (v71)
          {
            id obj = v70;
            uint64_t v80 = *(void *)v106;
            v79 = v4;
LABEL_70:
            uint64_t v72 = 0;
            id v78 = v71;
            while (1)
            {
              if (*(void *)v106 != v80) {
                objc_enumerationMutation(obj);
              }
              uint64_t v73 = *(void **)(*((void *)&v105 + 1) + 8 * v72);
              uint64_t v99 = 0;
              uint64_t v100 = &v99;
              uint64_t v101 = 0x3032000000;
              v102 = sub_10001E110;
              v103 = sub_10001E120;
              id v104 = 0;
              uint64_t v74 = [v73 accessQueue];
              v91[0] = _NSConcreteStackBlock;
              v91[1] = 3221225472;
              v91[2] = sub_1000253C4;
              v91[3] = &unk_1000E97D8;
              v91[4] = v73;
              v96 = v143;
              id v92 = v83;
              v97 = buf;
              v98 = &v99;
              id v93 = v82;
              uint64_t v94 = self;
              id v31 = v31;
              id v95 = v31;
              dispatch_sync(v74, v91);

              id v4 = v79;
              v75 = (void *)v100[5];
              if (v75)
              {
                id v76 = v75;

                int v81 = 2;
                id v31 = v76;
              }
              else
              {
                int v81 = 0;
              }

              _Block_object_dispose(&v99, 8);
              if (v75) {
                break;
              }
              if (v78 == (id)++v72)
              {
                id v71 = [obj countByEnumeratingWithState:&v105 objects:v142 count:16];
                if (v71) {
                  goto LABEL_70;
                }
                int v81 = 0;
                break;
              }
            }
            v70 = obj;
          }
          else
          {
            int v81 = 0;
          }

          _Block_object_dispose(v143, 8);
          _Block_object_dispose(buf, 8);

          if (v81) {
            goto LABEL_40;
          }
        }
      }
      [(IXSOwnedDataPromise *)self setStagedPath:v83];
      char v47 = 1;
      goto LABEL_41;
    }
  }
LABEL_40:
  [v4 removeItemAtURL:v18 error:0];
  [(IXSPlaceholder *)self cancelForReason:v31 client:15 error:0];
  char v47 = 0;
LABEL_41:

  return v47 & 1;
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  double v5 = [(IXSDataPromise *)self name];
  unsigned __int8 v6 = IXStringForClientID([(IXSDataPromise *)self creatorIdentifier]);
  id v7 = [(IXSDataPromise *)self uniqueIdentifier];
  id v8 = +[NSString stringWithFormat:@"<%@(%p) Name:%@ Creator:%@ UUID:%@>", v4, self, v5, v6, v7];

  return (NSString *)v8;
}

- (void)promiseDidBegin:(id)a3
{
  id v4 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v4);

  double v5 = [(IXSDataPromise *)self accessQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100025B10;
  v6[3] = &unk_1000E8FA8;
  v6[4] = self;
  sub_100066F24(v5, v6);
}

- (void)promiseDidComplete:(id)a3
{
  id v4 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v4);

  double v5 = [(IXSDataPromise *)self accessQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100025CA8;
  v6[3] = &unk_1000E8FA8;
  v6[4] = self;
  sub_100066F24(v5, v6);
}

- (void)promiseDidReset:(id)a3
{
  id v4 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v4);

  double v5 = [(IXSDataPromise *)self accessQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100025D50;
  v6[3] = &unk_1000E8FA8;
  v6[4] = self;
  sub_100066F24(v5, v6);
}

- (void)promise:(id)a3 didUpdateProgress:(double)a4
{
  double v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  unsigned __int8 v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100025ED0;
  v7[3] = &unk_1000E8FA8;
  void v7[4] = self;
  sub_100066F24(v6, v7);
}

- (void)promise:(id)a3 didCancelForReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v10);

  id v11 = [(IXSDataPromise *)self accessQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000260C8;
  v14[3] = &unk_1000E9408;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a5;
  id v12 = v9;
  id v13 = v8;
  sub_100066F24(v11, v14);
}

- (NSUUID)iconPromiseUUID
{
  return self->_iconPromiseUUID;
}

- (void)setIconPromiseUUID:(id)a3
{
}

- (NSUUID)iconResourcesPromiseUUID
{
  return self->_iconResourcesPromiseUUID;
}

- (void)setIconResourcesPromiseUUID:(id)a3
{
}

- (NSUUID)infoPlistIconContentPromiseUUID
{
  return self->_infoPlistIconContentPromiseUUID;
}

- (void)setInfoPlistIconContentPromiseUUID:(id)a3
{
}

- (NSUUID)entitlementsPromiseUUID
{
  return self->_entitlementsPromiseUUID;
}

- (void)setEntitlementsPromiseUUID:(id)a3
{
}

- (NSUUID)infoPlistLoctablePromiseUUID
{
  return self->_infoPlistLoctablePromiseUUID;
}

- (void)setInfoPlistLoctablePromiseUUID:(id)a3
{
}

- (NSUUID)metadataPromiseUUID
{
  return self->_metadataPromiseUUID;
}

- (void)setMetadataPromiseUUID:(id)a3
{
}

- (NSUUID)sinfPromiseUUID
{
  return self->_sinfPromiseUUID;
}

- (void)setSinfPromiseUUID:(id)a3
{
}

- (NSArray)appExtensionPlaceholdersPromiseUUIDs
{
  return self->_appExtensionPlaceholdersPromiseUUIDs;
}

- (void)setAppExtensionPlaceholdersPromiseUUIDs:(id)a3
{
}

- (NSUUID)localizationDictionaryPromiseUUID
{
  return self->_localizationDictionaryPromiseUUID;
}

- (void)setLocalizationDictionaryPromiseUUID:(id)a3
{
}

- (BOOL)sentDidBegin
{
  return self->_sentDidBegin;
}

- (void)setSentDidBegin:(BOOL)a3
{
  self->_sentDidBegin = a3;
}

- (BOOL)configurationComplete
{
  return self->_configurationComplete;
}

- (IXSOwnedDataPromise)icon
{
  return self->_icon;
}

- (IXSPromisedTransferToPath)iconResourcesPromise
{
  return self->_iconResourcesPromise;
}

- (IXSPromisedInMemoryDictionary)infoPlistIconContentPromise
{
  return self->_infoPlistIconContentPromise;
}

- (IXSOwnedDataPromise)entitlements
{
  return self->_entitlements;
}

- (IXSOwnedDataPromise)infoPlistLoctable
{
  return self->_infoPlistLoctable;
}

- (NSArray)appExtensionPlaceholders
{
  return self->_appExtensionPlaceholders;
}

- (IXPlaceholderAttributes)attributes
{
  return self->_attributes;
}

- (IXSPromisedInMemoryData)metadataPromise
{
  return self->_metadataPromise;
}

- (IXSPromisedInMemoryData)sinfPromise
{
  return self->_sinfPromise;
}

- (IXSPromisedInMemoryDictionary)localizationDictionaryPromise
{
  return self->_localizationDictionaryPromise;
}

- (NSError)awakeningError
{
  return self->_awakeningError;
}

- (void)setAwakeningError:(id)a3
{
}

- (BOOL)creatorHadWebPlaceholderInstallEntitlement
{
  return self->_creatorHadWebPlaceholderInstallEntitlement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awakeningError, 0);
  objc_storeStrong((id *)&self->_localizationDictionaryPromise, 0);
  objc_storeStrong((id *)&self->_sinfPromise, 0);
  objc_storeStrong((id *)&self->_metadataPromise, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_appExtensionPlaceholders, 0);
  objc_storeStrong((id *)&self->_infoPlistLoctable, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_infoPlistIconContentPromise, 0);
  objc_storeStrong((id *)&self->_iconResourcesPromise, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_localizationDictionaryPromiseUUID, 0);
  objc_storeStrong((id *)&self->_appExtensionPlaceholdersPromiseUUIDs, 0);
  objc_storeStrong((id *)&self->_sinfPromiseUUID, 0);
  objc_storeStrong((id *)&self->_metadataPromiseUUID, 0);
  objc_storeStrong((id *)&self->_infoPlistLoctablePromiseUUID, 0);
  objc_storeStrong((id *)&self->_entitlementsPromiseUUID, 0);
  objc_storeStrong((id *)&self->_infoPlistIconContentPromiseUUID, 0);
  objc_storeStrong((id *)&self->_iconResourcesPromiseUUID, 0);

  objc_storeStrong((id *)&self->_iconPromiseUUID, 0);
}

- (void)_remote_setMetadataPromiseUUID:(id)a3 fromConnection:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = (void (**)(id, id))a5;
  id v11 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v11);

  if (v8)
  {
    uint64_t v46 = 0;
    char v47 = &v46;
    uint64_t v48 = 0x2020000000;
    char v49 = 0;
    id v12 = +[IXSDataPromiseManager sharedInstance];
    id v13 = [v12 promiseForUUID:v8 ofType:objc_opt_class()];

    if (v13)
    {
      id v14 = [v13 accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100026C30;
      block[3] = &unk_1000E90A8;
      uint64_t v45 = &v46;
      id v15 = v13;
      id v44 = v15;
      dispatch_sync(v14, block);

      if (*((unsigned char *)v47 + 24))
      {
        id v16 = [(id)objc_opt_class() _metadataFromPromise:v15];
        unint64_t v17 = v16;
        if (v16)
        {
          id v42 = 0;
          long long v18 = sub_10000D83C(v16, v9, @"placeholder metadata", &v42);
          id v19 = v42;
          if (v18)
          {
            if (([v18 isEqual:v17] & 1) == 0)
            {
              id v41 = v19;
              long long v35 = sub_10003D560(v18, &v41);
              id v20 = v41;

              if (v35)
              {
                id v34 = v20;
                uint64_t v21 = [v15 accessQueue];
                v39[0] = _NSConcreteStackBlock;
                v39[1] = 3221225472;
                v39[2] = sub_100026C64;
                v39[3] = &unk_1000E8FA8;
                id v22 = v15;
                id v40 = v22;
                dispatch_sync(v21, v39);

                id v23 = [IXSPromisedInMemoryData alloc];
                id v38 = v34;
                id v15 = [(IXSPromisedInMemoryData *)v23 updatedPromiseWithData:v35 error:&v38];
                id v19 = v38;

                if (v15)
                {

                  goto LABEL_10;
                }
              }
              else
              {
                id v19 = v20;
              }
              uint64_t v25 = v35;
              goto LABEL_27;
            }
LABEL_10:
            id v24 = [(IXSDataPromise *)self accessQueue];
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            v36[2] = sub_100026C6C;
            v36[3] = &unk_1000E8E08;
            void v36[4] = self;
            id v15 = v15;
            id v37 = v15;
            dispatch_sync(v24, v36);

            uint64_t v25 = v37;
LABEL_27:
          }
LABEL_23:
          v10[2](v10, v19);

          _Block_object_dispose(&v46, 8);
          goto LABEL_24;
        }
        uint64_t v29 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_10008ECD8();
        }
        uint64_t v30 = @"Metadata promise %@ did not contain a decodeable MIStoreMetadata instance.";
        uint64_t v31 = 1679;
        unint64_t v32 = 53;
      }
      else
      {
        uint64_t v29 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_10008EC64();
        }
        uint64_t v30 = @"Client attempted to set metadata promise that was not complete: %@";
        uint64_t v31 = 1673;
        unint64_t v32 = 3;
      }

      sub_10003DAE4((uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setMetadataPromiseUUID:fromConnection:completion:]", v31, @"IXErrorDomain", v32, 0, 0, v30, v33, (uint64_t)v15);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v27 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_10008EBF0();
      }

      sub_10003DAE4((uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setMetadataPromiseUUID:fromConnection:completion:]", 1662, @"IXErrorDomain", 3uLL, 0, 0, @"Could not find metadata promise with UUID %@", v28, (uint64_t)v8);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      id v15 = 0;
    }
    unint64_t v17 = 0;
    long long v18 = 0;
    goto LABEL_23;
  }
  uint64_t v26 = [(IXSDataPromise *)self accessQueue];
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_100026C24;
  v50[3] = &unk_1000E8FA8;
  v50[4] = self;
  dispatch_sync(v26, v50);

  v10[2](v10, 0);
LABEL_24:
}

- (void)_remote_getMetadataWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  double v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_10001E110;
  id v12 = sub_10001E120;
  id v13 = 0;
  unsigned __int8 v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100026DB0;
  v7[3] = &unk_1000E90A8;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, v9[5], 0);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setSinfPromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v8);

  if (!v6)
  {
    uint64_t v10 = 0;
    goto LABEL_7;
  }
  id v9 = +[IXSDataPromiseManager sharedInstance];
  uint64_t v10 = [v9 promiseForUUID:v6 ofType:objc_opt_class()];

  if (v10)
  {
LABEL_7:
    id v14 = [(IXSDataPromise *)self accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100026FCC;
    block[3] = &unk_1000E8E08;
    void block[4] = self;
    id v16 = v10;
    id v13 = v10;
    dispatch_sync(v14, block);

    v7[2](v7, 0);
    goto LABEL_8;
  }
  id v11 = sub_100004B28((uint64_t)off_100109BB8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10008ED4C();
  }

  sub_10003DAE4((uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setSinfPromiseUUID:completion:]", 1738, @"IXErrorDomain", 3uLL, 0, 0, @"Could not find sinf promise with UUID %@", v12, (uint64_t)v6);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, id))v7)[2](v7, v13);
LABEL_8:
}

- (void)_remote_getSinfDataWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  double v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_10001E110;
  uint64_t v12 = sub_10001E120;
  id v13 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027110;
  v7[3] = &unk_1000E90A8;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, v9[5], 0);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setLaunchProhibited:(BOOL)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v8 = [(IXSDataPromise *)self accessQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100027230;
  v9[3] = &unk_1000E9800;
  v9[4] = self;
  BOOL v10 = a3;
  dispatch_sync(v8, v9);

  v6[2](v6, 0);
}

- (void)_remote_getLaunchProhibitedWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000273C8;
  v7[3] = &unk_1000E90A8;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v9 + 24), 0);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v8);

  id v9 = [(IXSDataPromise *)self accessQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100027514;
  v11[3] = &unk_1000E8E08;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_sync(v9, v11);

  v7[2](v7, 0);
}

- (void)_remote_getAttributesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  double v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = sub_10001E110;
  id v12 = sub_10001E120;
  id v13 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027658;
  v7[3] = &unk_1000E90A8;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, v9[5], 0);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setIconPromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v8);

  id v9 = +[IXSDataPromiseManager sharedInstance];
  uint64_t v10 = [v9 promiseForUUID:v6 ofType:objc_opt_class()];

  if (v10)
  {
    char v11 = [(IXSDataPromise *)self accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100027874;
    block[3] = &unk_1000E8E08;
    void block[4] = self;
    id v16 = v10;
    dispatch_sync(v11, block);

    v7[2](v7, 0);
  }
  else
  {
    id v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10008EDC0();
    }

    id v14 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setIconPromiseUUID:completion:]", 1820, @"IXErrorDomain", 3uLL, 0, 0, @"Could not find icon promise with UUID %@", v13, (uint64_t)v6);
    ((void (**)(id, void *))v7)[2](v7, v14);
  }
}

- (void)_remote_hasIconPromise:(id)a3
{
  id v4 = a3;
  double v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002798C;
  v7[3] = &unk_1000E90A8;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v9 + 24), 0);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_getIconPromise:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  double v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = sub_10001E110;
  id v12 = sub_10001E120;
  id v13 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027B18;
  v7[3] = &unk_1000E9230;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, v9[5], 0);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setIconResourcesPromiseUUID:(id)a3 infoPlistIconContentPromiseUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  char v11 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v11);

  id v12 = +[IXSDataPromiseManager sharedInstance];
  id v13 = [v12 promiseForUUID:v8 ofType:objc_opt_class()];

  if (v13)
  {
    id v14 = +[IXSDataPromiseManager sharedInstance];
    id v15 = [v14 promiseForUUID:v9 ofType:objc_opt_class()];

    if (v15)
    {
      id v16 = [(IXSDataPromise *)self accessQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100027EEC;
      block[3] = &unk_1000E9140;
      void block[4] = self;
      id v23 = v13;
      id v15 = v15;
      id v24 = v15;
      dispatch_sync(v16, block);

      v10[2](v10, 0);
    }
    else
    {
      id v19 = sub_100004B28((uint64_t)off_100109BB8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10008EEA8();
      }

      uint64_t v21 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setIconResourcesPromiseUUID:infoPlistIconContentPromiseUUID:completion:]", 1873, @"IXErrorDomain", 3uLL, 0, 0, @"Could not find Info.plist icon content promise with UUID %@", v20, (uint64_t)v9);
      ((void (**)(id, void *))v10)[2](v10, v21);
    }
  }
  else
  {
    unint64_t v17 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10008EE34();
    }

    sub_10003DAE4((uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setIconResourcesPromiseUUID:infoPlistIconContentPromiseUUID:completion:]", 1866, @"IXErrorDomain", 3uLL, 0, 0, @"Could not find icon resources promise with UUID %@", v18, (uint64_t)v8);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id))v10)[2](v10, v15);
  }
}

- (void)_remote_hasIconResourcesPromise:(id)a3
{
  id v4 = a3;
  double v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002800C;
  v7[3] = &unk_1000E90A8;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v9 + 24), 0);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_getIconResourcesPromiseAndInfoPlistContent:(id)a3
{
  id v4 = (void (**)(id, uint64_t, uint64_t, void))a3;
  double v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  unint64_t v17 = sub_10001E110;
  uint64_t v18 = sub_10001E120;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = sub_10001E110;
  id v12 = sub_10001E120;
  id v13 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028200;
  block[3] = &unk_1000E9828;
  void block[4] = self;
  void block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(v6, block);

  v4[2](v4, v15[5], v9[5], 0);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

- (void)_remote_setLocalizationPromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v8);

  id v9 = +[IXSDataPromiseManager sharedInstance];
  uint64_t v10 = [v9 promiseForUUID:v6 ofType:objc_opt_class()];

  if (v10)
  {
    char v11 = [(IXSDataPromise *)self accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000285E4;
    block[3] = &unk_1000E8E08;
    void block[4] = self;
    id v16 = v10;
    dispatch_sync(v11, block);

    v7[2](v7, 0);
  }
  else
  {
    id v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10008EF1C();
    }

    uint64_t v14 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setLocalizationPromiseUUID:completion:]", 1931, @"IXErrorDomain", 3uLL, 0, 0, @"Could not find localization dictionary promise with UUID %@", v13, (uint64_t)v6);
    ((void (**)(id, void *))v7)[2](v7, v14);
  }
}

- (void)_remote_getLocalizationDictionary:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  double v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = sub_10001E110;
  id v12 = sub_10001E120;
  id v13 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100028728;
  v7[3] = &unk_1000E90A8;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, v9[5], 0);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setEntitlementsPromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v8);

  id v9 = +[IXSDataPromiseManager sharedInstance];
  uint64_t v10 = [v9 promiseForUUID:v6 ofType:objc_opt_class()];

  if (v10)
  {
    char v11 = [(IXSDataPromise *)self accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100028944;
    block[3] = &unk_1000E8E08;
    void block[4] = self;
    id v16 = v10;
    dispatch_sync(v11, block);

    v7[2](v7, 0);
  }
  else
  {
    id v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10008EF90();
    }

    uint64_t v14 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setEntitlementsPromiseUUID:completion:]", 1961, @"IXErrorDomain", 3uLL, 0, 0, @"Could not find entitlements promise with UUID %@", v13, (uint64_t)v6);
    ((void (**)(id, void *))v7)[2](v7, v14);
  }
}

- (void)_remote_hasEntitlementsPromise:(id)a3
{
  id v4 = a3;
  double v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100028A5C;
  v7[3] = &unk_1000E90A8;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v9 + 24), 0);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_getEntitlementsPromise:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  double v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = sub_10001E110;
  id v12 = sub_10001E120;
  id v13 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100028BE8;
  v7[3] = &unk_1000E9230;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, v9[5], 0);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setInfoPlistLoctablePromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v8 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v8);

  id v9 = +[IXSDataPromiseManager sharedInstance];
  uint64_t v10 = [v9 promiseForUUID:v6 ofType:objc_opt_class()];

  if (v10)
  {
    char v11 = [(IXSDataPromise *)self accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100028EC8;
    block[3] = &unk_1000E8E08;
    void block[4] = self;
    id v16 = v10;
    dispatch_sync(v11, block);

    v7[2](v7, 0);
  }
  else
  {
    id v12 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10008F004();
    }

    uint64_t v14 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setInfoPlistLoctablePromiseUUID:completion:]", 2006, @"IXErrorDomain", 3uLL, 0, 0, @"Could not find loctable promise with UUID %@", v13, (uint64_t)v6);
    ((void (**)(id, void *))v7)[2](v7, v14);
  }
}

- (void)_remote_hasInfoPlistLoctablePromise:(id)a3
{
  id v4 = a3;
  double v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100028FE0;
  v7[3] = &unk_1000E90A8;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v9 + 24), 0);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_getInfoPlistLoctablePromise:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  double v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = sub_10001E110;
  id v12 = sub_10001E120;
  id v13 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002916C;
  v7[3] = &unk_1000E9230;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, v9[5], 0);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setAppExtensionPlaceholderPromiseUUIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  uint64_t v8 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v8);

  id v9 = objc_opt_new();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v54;
    p_vtable = &OBJC_METACLASS___IXSPromisedInMemoryData.vtable;
    uint64_t v45 = v9;
    uint64_t v46 = v7;
    id v44 = v10;
    uint64_t v41 = *(void *)v54;
    id v42 = self;
LABEL_3:
    uint64_t v14 = 0;
    id v43 = v11;
    while (1)
    {
      if (*(void *)v54 != v12) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void *)(*((void *)&v53 + 1) + 8 * (void)v14);
      id v16 = [p_vtable + 122 sharedInstance];
      unint64_t v17 = [v16 promiseForUUID:v15 ofType:objc_opt_class()];

      if (!v17) {
        break;
      }
      uint64_t v18 = [(IXSPlaceholder *)self bundleID];
      id v19 = +[NSString stringWithFormat:@"%@.", v18];

      uint64_t v20 = [v17 bundleID];
      unsigned __int8 v21 = [v20 hasPrefix:v19];

      if ((v21 & 1) == 0)
      {
        id v37 = v10;
        id v38 = sub_100004B28((uint64_t)off_100109BB8);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_10008F184();
        }

        id v39 = [v17 bundleID];
        sub_10003DAE4((uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setAppExtensionPlaceholderPromiseUUIDs:completion:]", 2059, @"IXErrorDomain", 8uLL, 0, 0, @"Cannot complete attempt to set app extension placeholder with bundle ID %@ because it does not have the parent placeholder's required bundle ID prefix of %@", v40, (uint64_t)v39);
        id v22 = (id)objc_claimAutoreleasedReturnValue();

        v7[2](v7, v22);
        id v10 = v37;
LABEL_22:

        goto LABEL_23;
      }
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v22 = v9;
      id v23 = [v22 countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v50;
        while (2)
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v50 != v25) {
              objc_enumerationMutation(v22);
            }
            id v27 = [*(id *)(*((void *)&v49 + 1) + 8 * i) bundleID];
            uint64_t v28 = [v17 bundleID];
            unsigned int v29 = [v27 isEqualToString:v28];

            if (v29)
            {
              uint64_t v31 = sub_100004B28((uint64_t)off_100109BB8);
              id v7 = v46;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                sub_10008F0EC(v17, v31);
              }

              unint64_t v32 = [v17 bundleID];
              id v34 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setAppExtensionPlaceholderPromiseUUIDs:completion:]", 2066, @"IXErrorDomain", 9uLL, 0, 0, @"App extension placeholders array has multiple placeholders with the same bundleID of %@", v33, (uint64_t)v32);

              v46[2](v46, v34);
              id v10 = v44;
              id v9 = v45;
              goto LABEL_22;
            }
          }
          id v24 = [v22 countByEnumeratingWithState:&v49 objects:v57 count:16];
          if (v24) {
            continue;
          }
          break;
        }
      }

      [v22 addObject:v17];
      uint64_t v14 = (char *)v14 + 1;
      id v10 = v44;
      id v9 = v45;
      id v7 = v46;
      uint64_t v12 = v41;
      self = v42;
      p_vtable = (void **)(&OBJC_METACLASS___IXSPromisedInMemoryData + 24);
      if (v14 == v43)
      {
        id v11 = [v44 countByEnumeratingWithState:&v53 objects:v58 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
    long long v35 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_10008F078();
    }

    unint64_t v17 = sub_10003DAE4((uint64_t)"-[IXSPlaceholder(IXSPlaceholderIPCMethods) _remote_setAppExtensionPlaceholderPromiseUUIDs:completion:]", 2053, @"IXErrorDomain", 3uLL, 0, 0, @"Could not find placeholder promise with UUID %@", v36, v15);
    v7[2](v7, v17);
LABEL_23:

    goto LABEL_24;
  }
LABEL_18:

  uint64_t v30 = [(IXSDataPromise *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000297CC;
  block[3] = &unk_1000E8E08;
  void block[4] = self;
  id v48 = v9;
  dispatch_sync(v30, block);

  v7[2](v7, 0);
LABEL_24:
}

- (void)_remote_hasAppExtensionPlaceholderPromises:(id)a3
{
  id v4 = a3;
  double v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000298E4;
  v7[3] = &unk_1000E90A8;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v9 + 24), 0);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_getAppExtensionPlaceholderPromises:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  double v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = sub_10001E110;
  uint64_t v12 = sub_10001E120;
  id v13 = 0;
  id v6 = [(IXSDataPromise *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100029A70;
  v7[3] = &unk_1000E9230;
  void v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v6, v7);

  v4[2](v4, v9[5], 0);
  _Block_object_dispose(&v8, 8);
}

- (void)_remote_setConfigurationCompleteWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  double v5 = [(IXSDataPromise *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [(IXSDataPromise *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029D60;
  block[3] = &unk_1000E8FA8;
  void block[4] = self;
  dispatch_sync(v6, block);

  v4[2](v4, 0);
}

@end