@interface MKClipServices
+ (id)sharedInstance;
- (MKClipServices)init;
- (void)_validateAppClipBasedQuickLinks:(id)a3 completion:(id)a4;
- (void)appClipWithQuickLink:(id)a3 completion:(id)a4;
- (void)appClipsFromQuickLinks:(id)a3 completion:(id)a4;
- (void)quickLinksCopyByRemovingNonAvailableAppClipLinks:(id)a3 completion:(id)a4;
- (void)requestAppClip:(id)a3 completion:(id)a4;
@end

@implementation MKClipServices

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__MKClipServices_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB315C60 != -1) {
    dispatch_once(&qword_1EB315C60, block);
  }
  v2 = (void *)_MergedGlobals_128;

  return v2;
}

void __32__MKClipServices_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_128;
  _MergedGlobals_128 = (uint64_t)v1;
}

- (MKClipServices)init
{
  v7.receiver = self;
  v7.super_class = (Class)MKClipServices;
  v2 = [(MKClipServices *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MapKit.MKClipServices.RequestAppClipMetadata", v3);
    requestAppClipMetadataQueue = v2->_requestAppClipMetadataQueue;
    v2->_requestAppClipMetadataQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)appClipWithQuickLink:(id)a3 completion:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    v12[0] = v6;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__MKClipServices_appClipWithQuickLink_completion___block_invoke;
    v10[3] = &unk_1E54B85C0;
    id v11 = v8;
    [(MKClipServices *)self appClipsFromQuickLinks:v9 completion:v10];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __50__MKClipServices_appClipWithQuickLink_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 firstObject];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)quickLinksCopyByRemovingNonAvailableAppClipLinks:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v14 type] == 2) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  v15 = (void *)[v8 copy];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78__MKClipServices_quickLinksCopyByRemovingNonAvailableAppClipLinks_completion___block_invoke;
  v18[3] = &unk_1E54B85E8;
  id v19 = v9;
  id v20 = v7;
  id v16 = v7;
  id v17 = v9;
  [(MKClipServices *)self _validateAppClipBasedQuickLinks:v15 completion:v18];
}

void __78__MKClipServices_quickLinksCopyByRemovingNonAvailableAppClipLinks_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v20 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        char v9 = [v3 containsObject:v8];
        uint64_t v10 = MKGetClipServicesLog();
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
        if (v9)
        {
          if (v11)
          {
            uint64_t v12 = [v8 appAdamID];
            v13 = [v8 URLString];
            v14 = [v8 bundleID];
            *(_DWORD *)buf = 138412802;
            v31 = v12;
            __int16 v32 = 2112;
            v33 = v13;
            __int16 v34 = 2112;
            v35 = v14;
            _os_log_impl(&dword_18BAEC000, v10, OS_LOG_TYPE_DEBUG, "Removing quick link with identifier %@ url %@ bundleID %@", buf, 0x20u);
          }
        }
        else
        {
          if (v11)
          {
            v15 = [v8 appAdamID];
            id v16 = [v8 URLString];
            id v17 = [v8 bundleID];
            *(_DWORD *)buf = 138412802;
            v31 = v15;
            __int16 v32 = 2112;
            v33 = v16;
            __int16 v34 = 2112;
            v35 = v17;
            _os_log_impl(&dword_18BAEC000, v10, OS_LOG_TYPE_DEBUG, "Adding quick link with identifier %@ url %@ bundleID %@", buf, 0x20u);
          }
          [v21 addObject:v8];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v5);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__MKClipServices_quickLinksCopyByRemovingNonAvailableAppClipLinks_completion___block_invoke_15;
  block[3] = &unk_1E54B8360;
  id v18 = *(id *)(v20 + 40);
  id v24 = v21;
  id v25 = v18;
  id v19 = v21;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __78__MKClipServices_quickLinksCopyByRemovingNonAvailableAppClipLinks_completion___block_invoke_15(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)appClipsFromQuickLinks:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = a3;
  char v9 = [v7 predicateWithBlock:&__block_literal_global_4];
  uint64_t v10 = [v8 filteredArrayUsingPredicate:v9];

  requestAppClipMetadataQueue = self->_requestAppClipMetadataQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__MKClipServices_appClipsFromQuickLinks_completion___block_invoke_2;
  v14[3] = &unk_1E54B8630;
  id v15 = v10;
  id v16 = v6;
  id v12 = v6;
  id v13 = v10;
  dispatch_async(requestAppClipMetadataQueue, v14);
}

BOOL __52__MKClipServices_appClipsFromQuickLinks_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 2;
}

void __52__MKClipServices_appClipsFromQuickLinks_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v28 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v33 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
        uint64_t v5 = [v3 URLString];
        uint64_t v37 = [v4 URLWithString:v5];

        uint64_t v45 = 0;
        v46 = &v45;
        uint64_t v47 = 0x2050000000;
        id v6 = (void *)getCPSClipMetadataRequestClass_softClass;
        uint64_t v48 = getCPSClipMetadataRequestClass_softClass;
        if (!getCPSClipMetadataRequestClass_softClass)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getCPSClipMetadataRequestClass_block_invoke;
          v51 = &unk_1E54B8448;
          v52 = &v45;
          __getCPSClipMetadataRequestClass_block_invoke((uint64_t)buf);
          id v6 = (void *)v46[3];
        }
        id v7 = v6;
        _Block_object_dispose(&v45, 8);
        v36 = (void *)[objc_alloc((Class)v7) initWithURL:v37];
        id v8 = MKGetClipServicesLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          char v9 = [v3 URLString];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v9;
          _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_DEBUG, "Requesting app clip for url = \"%@\"", buf, 0xCu);
        }
        uint64_t v10 = [v36 getClipMetadataSynchronously];
        if (v10)
        {
          BOOL v11 = [v3 title];
          id v12 = v11;
          if (v11)
          {
            log = v11;
          }
          else
          {
            log = [v10 clipName];
          }

          v14 = [v10 bundleDisplayName];
          id v15 = v14;
          if (v14)
          {
            id v34 = v14;
          }
          else
          {
            id v34 = [v10 clipName];
          }

          id v16 = objc_alloc(MEMORY[0x1E4F643E0]);
          id v17 = [v3 bundleID];
          id v18 = [v10 fullAppShortName];
          id v19 = [v10 clipBusinessIconURL];
          uint64_t v20 = v19;
          if (!v19)
          {
            v31 = [v10 fullAppIconURL];
            uint64_t v20 = v31;
          }
          long long v21 = [v10 provider];
          long long v22 = objc_msgSend(v16, "initWithBundleID:title:subtitle:appShortName:appClipURL:artworkURL:providerName:", v17, log, v34, v18, v37, v20, v21, v28);

          if (!v19) {
          long long v23 = MKGetClipServicesLog();
          }
          id v24 = v23;
          if (v22)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v22;
              _os_log_impl(&dword_18BAEC000, v24, OS_LOG_TYPE_DEBUG, "Found %@", buf, 0xCu);
            }

            [v29 addObject:v22];
          }
          else
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              id v25 = [v3 bundleID];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v25;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = log;
              *(_WORD *)&buf[22] = 2112;
              v51 = v34;
              _os_log_impl(&dword_18BAEC000, v24, OS_LOG_TYPE_ERROR, "Unable to create app clip because one of the following was missing bundle id %@. title %@ subtitle %@", buf, 0x20u);
            }
          }
        }
        else
        {
          log = MKGetClipServicesLog();
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            id v13 = [v3 URLString];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v13;
            _os_log_impl(&dword_18BAEC000, log, OS_LOG_TYPE_DEBUG, "No app clip found for url = \"%@\"", buf, 0xCu);
          }
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v33);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MKClipServices_appClipsFromQuickLinks_completion___block_invoke_20;
  block[3] = &unk_1E54B8360;
  id v26 = *(id *)(v28 + 40);
  id v39 = v29;
  id v40 = v26;
  id v27 = v29;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __52__MKClipServices_appClipsFromQuickLinks_completion___block_invoke_20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_validateAppClipBasedQuickLinks:(id)a3 completion:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v28 = v5;
  if ([v5 count])
  {
    id v27 = v6;
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    id v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v14 = (void *)MEMORY[0x1E4F1CB10];
          id v15 = objc_msgSend(v13, "URLString", v27, v28);
          id v16 = [v14 URLWithString:v15];

          [v7 addObject:v16];
          id v17 = [v13 bundleID];
          [v29 addObject:v17];

          [v8 setObject:v13 forKey:v16];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v10);
    }

    id v18 = MKGetClipServicesLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v29;
      _os_log_impl(&dword_18BAEC000, v18, OS_LOG_TYPE_DEBUG, "Requesting validation with url list %@ and bundle identifier list %@", buf, 0x16u);
    }

    uint64_t v38 = 0;
    id v39 = &v38;
    uint64_t v40 = 0x2050000000;
    id v19 = (void *)getCPSValidationRequestClass_softClass;
    uint64_t v41 = getCPSValidationRequestClass_softClass;
    if (!getCPSValidationRequestClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getCPSValidationRequestClass_block_invoke;
      long long v44 = &unk_1E54B8448;
      uint64_t v45 = &v38;
      __getCPSValidationRequestClass_block_invoke((uint64_t)buf);
      id v19 = (void *)v39[3];
    }
    id v20 = v19;
    _Block_object_dispose(&v38, 8);
    id v21 = objc_alloc((Class)v20);
    long long v22 = (void *)[v7 copy];
    long long v23 = (void *)[v29 copy];
    id v24 = (void *)[v21 initWithURLs:v22 bundleIDs:v23];

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __61__MKClipServices__validateAppClipBasedQuickLinks_completion___block_invoke;
    v30[3] = &unk_1E54B8658;
    id v31 = v7;
    id v32 = v8;
    id v33 = v27;
    id v25 = v8;
    id v26 = v7;
    [v24 validateWithCompletion:v30];

    id v6 = v27;
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, MEMORY[0x1E4F1CBF0]);
  }
}

void __61__MKClipServices__validateAppClipBasedQuickLinks_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MKGetClipServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [v3 availabilities];
    *(_DWORD *)buf = 138412290;
    id v27 = v5;
    _os_log_impl(&dword_18BAEC000, v4, OS_LOG_TYPE_DEBUG, "Received validation result with availabilities %@", buf, 0xCu);
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v22;
    *(void *)&long long v9 = 138412290;
    long long v20 = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
        v14 = objc_msgSend(v3, "availabilities", v20, (void)v21);
        id v15 = [v14 objectForKey:v13];

        if (([v15 BOOLValue] & 1) == 0)
        {
          id v16 = MKGetClipServicesLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v20;
            id v27 = v13;
            _os_log_impl(&dword_18BAEC000, v16, OS_LOG_TYPE_DEBUG, "app clip with url %@ is not available", buf, 0xCu);
          }

          id v17 = [*(id *)(a1 + 40) objectForKey:v13];
          [v6 addObject:v17];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  uint64_t v18 = *(void *)(a1 + 48);
  id v19 = (void *)[v6 copy];
  (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
}

- (void)requestAppClip:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v7 = (void *)getCPSClipRequestClass_softClass;
  uint64_t v16 = getCPSClipRequestClass_softClass;
  if (!getCPSClipRequestClass_softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __getCPSClipRequestClass_block_invoke;
    v12[3] = &unk_1E54B8448;
    v12[4] = &v13;
    __getCPSClipRequestClass_block_invoke((uint64_t)v12);
    id v7 = (void *)v14[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);
  id v9 = objc_alloc((Class)v8);
  uint64_t v10 = [v6 appClipURL];

  id v11 = (id)[v9 initWithURL:v10];
  [v11 requestClipWithCompletion:v5];
}

- (void).cxx_destruct
{
}

@end