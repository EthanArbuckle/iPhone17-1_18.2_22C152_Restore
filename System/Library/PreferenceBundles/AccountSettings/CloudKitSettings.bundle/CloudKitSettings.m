void sub_2F4C(id a1)
{
  uint64_t vars8;

  qword_19958 = objc_opt_new();

  _objc_release_x1();
}

void sub_300C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_30B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_311C(id a1)
{
  qword_19968 = objc_opt_new();

  _objc_release_x1();
}

void sub_31DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_3284(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_37F8(uint64_t a1)
{
  v2 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = *(id *)(a1 + 32);
  id v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v8 = objc_opt_new();
        uint64_t v9 = [*(id *)(a1 + 48) _cachedDisplayNameForBundleID:v7];
        v10 = (void *)v9;
        if (v9) {
          uint64_t v11 = v9;
        }
        else {
          uint64_t v11 = v7;
        }
        [v8 setAppDisplayName:v11];
        v12 = [*(id *)(a1 + 48) _cachedImageForBundleID:v7];
        [v8 setAppImage:v12];

        [v2 setObject:v8 forKeyedSubscript:v7];
      }
      id v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v2, 0);
  }
}

void sub_3998(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v6 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v61 = v5;
      _os_log_error_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "Error performing AMS lookup: %@", buf, 0xCu);
    }
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  objc_msgSend(v4, "allItems", v5, v4);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v55;
    do
    {
      v10 = 0;
      id v47 = v8;
      do
      {
        if (*(void *)v55 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v54 + 1) + 8 * (void)v10);
        v12 = [v11 bundleIdentifier];
        if (v12)
        {
          uint64_t v13 = [v11 displayName];

          if (v13)
          {
            v14 = *(void **)(a1 + 48);
            long long v15 = [v11 displayName];
            long long v16 = [v11 bundleIdentifier];
            [v14 _setCachedDisplayName:v15 forBundleID:v16];

            long long v17 = *(void **)(a1 + 32);
            long long v18 = [v11 bundleIdentifier];
            [v17 removeObject:v18];
          }
          v19 = +[UIScreen mainScreen];
          [v19 scale];
          double v21 = v20;

          if (v21 <= 1.0) {
            uint64_t v22 = 29;
          }
          else {
            uint64_t v22 = 58;
          }
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          v23 = [v11 artwork];
          id v24 = [v23 countByEnumeratingWithState:&v50 objects:v58 count:16];
          if (v24)
          {
            uint64_t v25 = v9;
            uint64_t v26 = *(void *)v51;
            uint64_t v27 = v22;
            double v28 = (double)v22;
            while (2)
            {
              for (i = 0; i != v24; i = (char *)i + 1)
              {
                if (*(void *)v51 != v26) {
                  objc_enumerationMutation(v23);
                }
                v30 = *(void **)(*((void *)&v50 + 1) + 8 * i);
                [v30 width];
                if (v31 == v28)
                {
                  id v24 = v30;
                  goto LABEL_27;
                }
              }
              id v24 = [v23 countByEnumeratingWithState:&v50 objects:v58 count:16];
              if (v24) {
                continue;
              }
              break;
            }
LABEL_27:
            uint64_t v9 = v25;
            id v8 = v47;
          }
          else
          {
            uint64_t v27 = v22;
          }

          v32 = [v11 artwork];
          id v33 = [v32 count];

          if (v24) {
            BOOL v34 = 1;
          }
          else {
            BOOL v34 = v33 == 0;
          }
          if (!v34)
          {
            if (ck_log_initialization_predicate != -1) {
              dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
            }
            v35 = (void *)ck_log_facility_ck;
            if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
            {
              v41 = v35;
              v42 = [v11 artwork];
              *(_DWORD *)buf = 138412290;
              id v61 = v42;
              _os_log_error_impl(&dword_0, v41, OS_LOG_TYPE_ERROR, "Couldn't find expected sized image in artwork %@", buf, 0xCu);
            }
            v36 = [v11 artwork];
            id v24 = [v36 lastObject];
          }
          if (v24)
          {
            v37 = [v24 URLWithHeight:v27 width:v27 cropStyle:0 format:0];
            v38 = +[NSData dataWithContentsOfURL:v37];

            v39 = +[UIScreen mainScreen];
            [v39 scale];
            v40 = +[UIImage imageWithData:scale:](UIImage, "imageWithData:scale:", v38);

            if (v40) {
              [*(id *)(a1 + 48) _setCachedImage:v40 forBundleID:v12];
            }
          }
        }

        v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      id v8 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v8);
  }

  if ([*(id *)(a1 + 32) count])
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v43 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v44 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      id v61 = v44;
      _os_log_error_impl(&dword_0, v43, OS_LOG_TYPE_ERROR, "Couldn't find local or remote resources for app bundles %{public}@", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

int64_t sub_4044(id a1, id a2, id a3)
{
  id v4 = a3;
  id v5 = [a2 appDisplayName];
  v6 = [v4 appDisplayName];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

id sub_4164(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = CKLocalizedStringFromTableInBundleVA();

  return v6;
}

void sub_5BE0(id a1)
{
  qword_19980 = +[NSSet setWithObjects:@"pages", @"numbers", @"keynote", @"iclouddrive", @"notes", @"reminders", @"photos", @"photos_links", @"photos_sharing", @"safari-tab-groups", @"freeform", @"share", 0];

  _objc_release_x1();
}

void sub_8190(id a1)
{
  v1 = (void *)qword_19990;
  qword_19990 = (uint64_t)&off_16218;

  v10[0] = @"com.apple.Notes";
  v2 = +[NSSet setWithObject:@"com.apple.notes.folder"];
  v11[0] = v2;
  v10[1] = @"photos";
  v9[0] = CKPhotosSharedLibraryShareType;
  v9[1] = CKPhotosEPPMomentShareType;
  id v3 = +[NSArray arrayWithObjects:v9 count:2];
  id v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, 0);
  v11[1] = v4;
  v10[2] = @"freeform";
  id v5 = +[NSSet setWithObject:CKFreeformShareType];
  v11[2] = v5;
  v10[3] = @"safari";
  v6 = +[NSSet setWithObject:CKSafariTabGroupsShareType];
  v11[3] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  id v8 = (void *)qword_19998;
  qword_19998 = v7;
}

id sub_8784(id a1, CKSettingsAppNameImage *a2)
{
  v2 = a2;
  id v3 = [(CKSettingsAppNameImage *)v2 appDisplayName];
  id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

  id v5 = [(CKSettingsAppNameImage *)v2 appImage];

  if (v5)
  {
    v6 = [(CKSettingsAppNameImage *)v2 appImage];
    [v4 setProperty:v6 forKey:PSIconImageKey];
  }
  [v4 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];

  return v4;
}

void sub_9210(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v5 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      v6 = *(void **)(a1 + 32);
      uint64_t v7 = v5;
      id v8 = [v6 primaryAppNameImage];
      uint64_t v9 = [v8 appDisplayName];
      int v15 = 138543618;
      long long v16 = v9;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_error_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Error setting permission for app %{public}@: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    unsigned int v10 = [*(id *)(a1 + 40) BOOLValue];
    uint64_t v11 = *(void **)(a1 + 48);
    unint64_t v12 = (unint64_t)[v11 enabledPermissions];
    if (v10) {
      unint64_t v13 = v12 | 1;
    }
    else {
      unint64_t v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
    }
    [v11 setEnabledPermissions:v13];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  id v14 = self;
}

void sub_9390(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v6 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_error_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "Failed to terminate process %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t sub_95E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_9BCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_9BE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_9D08;
  v12[3] = &unk_14710;
  v12[4] = *(void *)(a1 + 32);
  id v4 = [v3 CKFlatMap:v12];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_9DD8;
  v8[3] = &unk_147A8;
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  +[CKSettingsAppNameImage lookUpAppNameImagesForApplicationBundleIDs:v4 completionHandler:v8];
}

id sub_9D08(uint64_t a1, void *a2)
{
  id v3 = [a2 applicationBundleIDs];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_9DB4;
  v6[3] = &unk_146E8;
  v6[4] = *(void *)(a1 + 32);
  id v4 = [v3 CKFilter:v6];

  return v4;
}

uint64_t sub_9DB4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isApplicationHiddenFromSettings:a2] ^ 1;
}

void sub_9DD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = *(id *)(a1 + 32);
  id v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v10 = [v9 applicationBundleIDs];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_A088;
        v19[3] = &unk_14738;
        v19[4] = *(void *)(a1 + 40);
        id v20 = v3;
        id v11 = [v10 CKCompactMap:v19];

        unint64_t v12 = [[CKSettingsDisplayableAppPermissionGroup alloc] initWithApplicationPermissionGroup:v9 appNameImages:v11];
        [v4 addObject:v12];
      }
      id v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  [v4 sortUsingComparator:&stru_14758];
  id v13 = *(id *)(a1 + 40);
  objc_sync_enter(v13);
  uint64_t v14 = *(void *)(a1 + 40);
  int v15 = *(void **)(v14 + 208);
  *(void *)(v14 + 208) = v4;
  id v16 = v4;

  *(unsigned char *)(*(void *)(a1 + 40) + 185) = 1;
  *(unsigned char *)(*(void *)(a1 + 40) + 184) = 0;
  objc_sync_exit(v13);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A190;
  block[3] = &unk_14780;
  block[4] = *(void *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_A088(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _isApplicationHiddenFromSettings:v3])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
  }

  return v4;
}

int64_t sub_A0F4(id a1, id a2, id a3)
{
  id v4 = a3;
  id v5 = [a2 primaryAppNameImage];
  id v6 = [v5 appDisplayName];
  uint64_t v7 = [v4 primaryAppNameImage];

  int v8 = [v7 appDisplayName];
  id v9 = [v6 compare:v8];

  return (int64_t)v9;
}

unsigned char *sub_A190(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[185]) {
    return [result reloadSpecifiers];
  }
  return result;
}

void sub_ACF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_AD18(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (a2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_AEB4;
    block[3] = &unk_14780;
    id v5 = &v13;
    id v13 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v6 = [WeakRetained shareURL];
    uint64_t v7 = +[CKVettingAlerts alertContentForShareMetadataErrorWithURL:v6];

    +[CKVettingAlerts showFailureAlert:v7 isSourceICS:0];
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) participantID];
    id v9 = [*(id *)(a1 + 32) address];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_AEBC;
    v10[3] = &unk_14820;
    id v5 = (id *)v11;
    v11[0] = *(id *)(a1 + 32);
    v11[1] = WeakRetained;
    v11[2] = *(void *)(a1 + 40);
    [WeakRetained _initiateVettingForParticipantID:v8 address:v9 andThen:v10];
  }
}

id sub_AEB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearSpinner];
}

void sub_AEBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_AF70;
  v5[3] = &unk_147F8;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_AF70(id *a1)
{
  [a1[4] clearSpinner];
  if ([a1[5] isVettedToSelfError])
  {
    id v3 = a1[5];
    id v2 = a1[6];
    id v4 = [a1[7] sharedItem];
    [v2 _showInitiateFailureAlert:v3 shareTitle:v4 cell:a1[4]];

    id v5 = [a1[6] navigationController];
    [v5 dismissViewControllerAnimated:1 completion:0];

    id v6 = +[LSApplicationWorkspace defaultWorkspace];
    id v7 = [a1[6] shareURL];
    id v17 = 0;
    unsigned __int8 v8 = [v6 openSensitiveURL:v7 withOptions:0 error:&v17];
    id v9 = v17;

    if ((v8 & 1) == 0)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v10 = ck_log_facility_ck;
      if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v9;
        _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Failed open share URL: %@", buf, 0xCu);
      }
      id v11 = a1[6];
      unint64_t v12 = [a1[7] sharedItem];
      [v11 _showInitiateFailureAlert:v9 shareTitle:v12 cell:a1[4]];
    }
  }
  else
  {
    id v13 = a1[5];
    if (v13)
    {
      if ([v13 isAuthenticationUserCancelled]) {
        return;
      }
      id v15 = a1[5];
      id v14 = a1[6];
      id v16 = [a1[7] sharedItem];
      objc_msgSend(v14, "_showInitiateFailureAlert:shareTitle:cell:", v15);
    }
    else
    {
      id v16 = [a1[6] navigationController];
      [v16 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

void sub_B514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_B540(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setShareMetadata:v4];
}

uint64_t sub_B59C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_B810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_B828(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_B838(uint64_t a1)
{
}

void sub_B840(uint64_t a1, void *a2)
{
}

void sub_B850(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void CFRelease(CFTypeRef cf)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t CKDeviceClass()
{
  return _CKDeviceClass();
}

uint64_t CKLocalizedString()
{
  return _CKLocalizedString();
}

uint64_t CKLocalizedStringFromTableInBundle()
{
  return _CKLocalizedStringFromTableInBundle();
}

uint64_t CKLocalizedStringFromTableInBundleVA()
{
  return _CKLocalizedStringFromTableInBundleVA();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_CKURLSlug(void *a1, const char *a2, ...)
{
  return [a1 CKURLSlug];
}

id objc_msgSend__displayNameCache(void *a1, const char *a2, ...)
{
  return [a1 _displayNameCache];
}

id objc_msgSend__imageCache(void *a1, const char *a2, ...)
{
  return [a1 _imageCache];
}

id objc_msgSend__setupBarButtons(void *a1, const char *a2, ...)
{
  return [a1 _setupBarButtons];
}

id objc_msgSend_accessoryView(void *a1, const char *a2, ...)
{
  return [a1 accessoryView];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_allItems(void *a1, const char *a2, ...)
{
  return [a1 allItems];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allowsAnonymousPublicAccess(void *a1, const char *a2, ...)
{
  return [a1 allowsAnonymousPublicAccess];
}

id objc_msgSend_appDisplayName(void *a1, const char *a2, ...)
{
  return [a1 appDisplayName];
}

id objc_msgSend_appImage(void *a1, const char *a2, ...)
{
  return [a1 appImage];
}

id objc_msgSend_appNameImages(void *a1, const char *a2, ...)
{
  return [a1 appNameImages];
}

id objc_msgSend_applicationBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 applicationBundleIDs];
}

id objc_msgSend_applicationPermissionGroup(void *a1, const char *a2, ...)
{
  return [a1 applicationPermissionGroup];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_artwork(void *a1, const char *a2, ...)
{
  return [a1 artwork];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_clearSpinner(void *a1, const char *a2, ...)
{
  return [a1 clearSpinner];
}

id objc_msgSend_clouddContainer(void *a1, const char *a2, ...)
{
  return [a1 clouddContainer];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return [a1 containerID];
}

id objc_msgSend_containerIDs(void *a1, const char *a2, ...)
{
  return [a1 containerIDs];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return [a1 contentInset];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createBagForSubProfile(void *a1, const char *a2, ...)
{
  return [a1 createBagForSubProfile];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_deselect(void *a1, const char *a2, ...)
{
  return [a1 deselect];
}

id objc_msgSend_deviceTypeSpecificSuffix(void *a1, const char *a2, ...)
{
  return [a1 deviceTypeSpecificSuffix];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_email(void *a1, const char *a2, ...)
{
  return [a1 email];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_enabledPermissions(void *a1, const char *a2, ...)
{
  return [a1 enabledPermissions];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return [a1 entitlements];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_isAuthenticationUserCancelled(void *a1, const char *a2, ...)
{
  return [a1 isAuthenticationUserCancelled];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isNetworkReachable(void *a1, const char *a2, ...)
{
  return [a1 isNetworkReachable];
}

id objc_msgSend_isVettedToSelfError(void *a1, const char *a2, ...)
{
  return [a1 isVettedToSelfError];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_matterhornName(void *a1, const char *a2, ...)
{
  return [a1 matterhornName];
}

id objc_msgSend_metadataIndicatedContainer(void *a1, const char *a2, ...)
{
  return [a1 metadataIndicatedContainer];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nameComponents(void *a1, const char *a2, ...)
{
  return [a1 nameComponents];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return [a1 number];
}

id objc_msgSend_ownerIdentity(void *a1, const char *a2, ...)
{
  return [a1 ownerIdentity];
}

id objc_msgSend_parentController(void *a1, const char *a2, ...)
{
  return [a1 parentController];
}

id objc_msgSend_participantID(void *a1, const char *a2, ...)
{
  return [a1 participantID];
}

id objc_msgSend_primaryAppNameImage(void *a1, const char *a2, ...)
{
  return [a1 primaryAppNameImage];
}

id objc_msgSend_resourceURL(void *a1, const char *a2, ...)
{
  return [a1 resourceURL];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_select(void *a1, const char *a2, ...)
{
  return [a1 select];
}

id objc_msgSend_selectedRowPath(void *a1, const char *a2, ...)
{
  return [a1 selectedRowPath];
}

id objc_msgSend_sendEmailBarButton(void *a1, const char *a2, ...)
{
  return [a1 sendEmailBarButton];
}

id objc_msgSend_sendEmailButton(void *a1, const char *a2, ...)
{
  return [a1 sendEmailButton];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_share(void *a1, const char *a2, ...)
{
  return [a1 share];
}

id objc_msgSend_shareMetadata(void *a1, const char *a2, ...)
{
  return [a1 shareMetadata];
}

id objc_msgSend_shareURL(void *a1, const char *a2, ...)
{
  return [a1 shareURL];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedItem(void *a1, const char *a2, ...)
{
  return [a1 sharedItem];
}

id objc_msgSend_sharedNetworkObserver(void *a1, const char *a2, ...)
{
  return [a1 sharedNetworkObserver];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_specialContainerType(void *a1, const char *a2, ...)
{
  return [a1 specialContainerType];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_spinner(void *a1, const char *a2, ...)
{
  return [a1 spinner];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_startSpinner(void *a1, const char *a2, ...)
{
  return [a1 startSpinner];
}

id objc_msgSend_statusBarFrame(void *a1, const char *a2, ...)
{
  return [a1 statusBarFrame];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_tableHeaderView(void *a1, const char *a2, ...)
{
  return [a1 tableHeaderView];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_tripples(void *a1, const char *a2, ...)
{
  return [a1 tripples];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}