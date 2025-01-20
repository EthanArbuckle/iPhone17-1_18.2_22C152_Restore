@interface CKSettingsAppNameImage
+ (id)_cachedDisplayNameForBundleID:(id)a3;
+ (id)_cachedImageForBundleID:(id)a3;
+ (id)_displayNameCache;
+ (id)_imageCache;
+ (void)_setCachedDisplayName:(id)a3 forBundleID:(id)a4;
+ (void)_setCachedImage:(id)a3 forBundleID:(id)a4;
+ (void)lookUpAppNameImagesForApplicationBundleIDs:(id)a3 completionHandler:(id)a4;
- (NSString)appDisplayName;
- (UIImage)appImage;
- (void)setAppDisplayName:(id)a3;
- (void)setAppImage:(id)a3;
@end

@implementation CKSettingsAppNameImage

+ (id)_imageCache
{
  if (qword_19960 != -1) {
    dispatch_once(&qword_19960, &stru_14510);
  }
  v2 = (void *)qword_19958;

  return v2;
}

+ (id)_cachedImageForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _imageCache];
  objc_sync_enter(v5);
  v6 = [v5 objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

+ (void)_setCachedImage:(id)a3 forBundleID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [a1 _imageCache];
  objc_sync_enter(v7);
  if (v8) {
    [v7 setObject:v8 forKeyedSubscript:v6];
  }
  objc_sync_exit(v7);
}

+ (id)_displayNameCache
{
  if (qword_19970 != -1) {
    dispatch_once(&qword_19970, &stru_14530);
  }
  v2 = (void *)qword_19968;

  return v2;
}

+ (id)_cachedDisplayNameForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _displayNameCache];
  objc_sync_enter(v5);
  id v6 = [v5 objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

+ (void)_setCachedDisplayName:(id)a3 forBundleID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [a1 _displayNameCache];
  objc_sync_enter(v7);
  if (v8) {
    [v7 setObject:v8 forKeyedSubscript:v6];
  }
  objc_sync_exit(v7);
}

+ (void)lookUpAppNameImagesForApplicationBundleIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v35 = a4;
  v36 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v49;
    uint64_t v37 = kISImageDescriptorTableUIName;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v10);
        v12 = [a1 _cachedDisplayNameForBundleID:v11];
        if (!v12)
        {
          id v13 = objc_alloc((Class)LSApplicationRecord);
          id v47 = 0;
          id v14 = [v13 initWithBundleIdentifier:v11 allowPlaceholder:0 error:&v47];
          id v15 = v47;
          if (v15)
          {
            if (ck_log_initialization_predicate != -1) {
              dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            v16 = ck_log_facility_ck;
            if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v53 = v11;
              __int16 v54 = 2112;
              id v55 = v15;
              _os_log_error_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "Failed to initialize LSApplicationRecord for app image lookup with bundle id %@: %@", buf, 0x16u);
            }
LABEL_15:

            [v36 addObject:v11];
            v12 = 0;
          }
          else
          {
            v17 = [v14 applicationState];
            unsigned int v18 = [v17 isInstalled];

            if (!v18) {
              goto LABEL_15;
            }
            uint64_t v19 = [v14 localizedName];
            if (!v19) {
              goto LABEL_15;
            }
            v12 = (void *)v19;
            [a1 _setCachedDisplayName:v19 forBundleID:v11];
          }
        }
        id v20 = [a1 _cachedImageForBundleID:v11];
        if (!v20)
        {
          id v21 = [objc_alloc((Class)ISIcon) initWithBundleIdentifier:v11];
          v22 = +[ISImageDescriptor imageDescriptorNamed:v37];
          v23 = [v21 prepareImageForDescriptor:v22];

          id v24 = objc_alloc((Class)UIImage);
          id v25 = [v23 CGImage];
          [v23 scale];
          id v20 = objc_msgSend(v24, "initWithCGImage:scale:orientation:", v25, 0);
          if (v20) {
            [a1 _setCachedImage:v20 forBundleID:v11];
          }
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v8);
  }

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_37F8;
  v43[3] = &unk_14558;
  id v26 = obj;
  id v44 = v26;
  id v46 = a1;
  id v27 = v35;
  id v45 = v27;
  v28 = objc_retainBlock(v43);
  if ([v36 count])
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v29 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v53 = v36;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Going to the AMS for info on these bundle ids: %{public}@", buf, 0xCu);
    }
    v30 = +[AMSLookup createBagForSubProfile];
    id v31 = objc_alloc((Class)AMSLookup);
    id v32 = [v31 initWithBag:v30 caller:@"com.apple.Cloudkit" keyProfile:AMSLookupKeyProfileLockup];
    v33 = [v36 allObjects];
    v34 = [v32 performLookupWithBundleIdentifiers:v33 itemIdentifiers:0];

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_3998;
    v39[3] = &unk_14580;
    id v42 = a1;
    id v40 = v36;
    v41 = v28;
    [v34 addFinishBlock:v39];
  }
  else
  {
    ((void (*)(void *))v28[2])(v28);
  }
}

- (NSString)appDisplayName
{
  return self->_appDisplayName;
}

- (void)setAppDisplayName:(id)a3
{
}

- (UIImage)appImage
{
  return self->_appImage;
}

- (void)setAppImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appImage, 0);

  objc_storeStrong((id *)&self->_appDisplayName, 0);
}

@end