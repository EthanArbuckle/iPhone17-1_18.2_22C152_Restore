@interface NTKCompanionCustomization
+ (void)initialize;
- (BOOL)_canHandleNotification:(id)a3;
- (BOOL)handlePresentationOfNotification:(id)a3 fromNotificationCenter:(id)a4 withCompletionHandler:(id)a5;
- (BOOL)handleUserNotificationResponse:(id)a3 fromNotificationCenter:(id)a4 withCompletionHandler:(id)a5;
- (id)facesViewController;
- (id)galleryViewController;
- (id)libraryViewController;
- (id)userNotificationCategories;
- (void)_addFaceForBundleIdentifier:(id)a3;
- (void)_viewFaceForBundleIdentifier:(id)a3 showDetail:(BOOL)a4;
- (void)_viewWhatsNew;
@end

@implementation NTKCompanionCustomization

- (id)facesViewController
{
  v2 = self;
  objc_sync_enter(v2);
  facesViewController = v2->_facesViewController;
  if (!facesViewController)
  {
    uint64_t v4 = objc_opt_new();
    v5 = v2->_facesViewController;
    v2->_facesViewController = (NTKCCFacesViewController *)v4;

    facesViewController = v2->_facesViewController;
  }
  v6 = facesViewController;
  objc_sync_exit(v2);

  return v6;
}

- (id)galleryViewController
{
  v2 = self;
  objc_sync_enter(v2);
  galleryViewController = v2->_galleryViewController;
  if (!galleryViewController)
  {
    uint64_t v4 = objc_opt_new();
    v5 = v2->_galleryViewController;
    v2->_galleryViewController = (NTKCCGalleryViewController *)v4;

    galleryViewController = v2->_galleryViewController;
  }
  v6 = galleryViewController;
  objc_sync_exit(v2);

  return v6;
}

- (id)userNotificationCategories
{
  v19 = NTKCompanionClockFaceLocalizedString();
  v2 = +[UNNotificationAction actionWithIdentifier:title:options:](UNNotificationAction, "actionWithIdentifier:title:options:", @"VIEW_GALLERY_ID");
  v18 = NTKCompanionClockFaceLocalizedString();
  v3 = +[UNNotificationAction actionWithIdentifier:title:options:](UNNotificationAction, "actionWithIdentifier:title:options:", @"ADD_FACE_ID");
  uint64_t v4 = NTKCompanionClockFaceLocalizedString();
  v5 = +[UNNotificationAction actionWithIdentifier:@"VIEW_WHATS_NEW_ID" title:v4 options:5];
  v6 = +[NSMutableSet set];
  uint64_t v7 = NTKFaceSupportFaceCategoryIdentifier;
  v22[0] = v3;
  v22[1] = v2;
  v8 = +[NSArray arrayWithObjects:v22 count:2];
  v9 = +[UNNotificationCategory categoryWithIdentifier:v7 actions:v8 intentIdentifiers:&__NSArray0__struct options:0];

  if (v9) {
    [v6 addObject:v9];
  }
  uint64_t v10 = NTKFaceSupportCollectionCategoryIdentifier;
  v21 = v2;
  v11 = +[NSArray arrayWithObjects:&v21 count:1];
  v12 = +[UNNotificationCategory categoryWithIdentifier:v10 actions:v11 intentIdentifiers:&__NSArray0__struct options:0];

  if (v12) {
    [v6 addObject:v12];
  }
  uint64_t v13 = NTKFaceSupportWhatsNewCategoryIdentifier;
  v20 = v5;
  v14 = +[NSArray arrayWithObjects:&v20 count:1];
  v15 = +[UNNotificationCategory categoryWithIdentifier:v13 actions:v14 intentIdentifiers:&__NSArray0__struct options:0];

  if (v15) {
    [v6 addObject:v15];
  }
  id v16 = [v6 copy];

  return v16;
}

+ (void)initialize
{
  id v2 = +[NTKGreenfieldCompanionAppInstallationMonitor sharedMonitor];
  [v2 start];
}

- (id)libraryViewController
{
  id v2 = self;
  objc_sync_enter(v2);
  libraryViewController = v2->_libraryViewController;
  if (!libraryViewController)
  {
    uint64_t v4 = objc_opt_new();
    v5 = v2->_libraryViewController;
    v2->_libraryViewController = (NTKCCLibraryListViewController *)v4;

    libraryViewController = v2->_libraryViewController;
  }
  v6 = libraryViewController;
  objc_sync_exit(v2);

  return v6;
}

- (BOOL)handleUserNotificationResponse:(id)a3 fromNotificationCenter:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a3;
  uint64_t v7 = [v6 notification];
  if ([(NTKCompanionCustomization *)self _canHandleNotification:v7])
  {
    v8 = [v7 request];
    v9 = [v8 content];
    uint64_t v10 = [v9 categoryIdentifier];
    unsigned int v11 = [v10 hasPrefix:@"com.apple.nanotimekit.facesupport."];
    if (!v11)
    {
LABEL_30:

      goto LABEL_31;
    }
    v39 = v10;
    v40 = v9;
    if (qword_2E488 != -1) {
      dispatch_once(&qword_2E488, &stru_24BA0);
    }
    v12 = v8;
    uint64_t v13 = qword_2E480;
    if (os_log_type_enabled((os_log_t)qword_2E480, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v6;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Got a response for %@", buf, 0xCu);
    }
    v14 = [v6 actionIdentifier];
    v15 = [v6 notification];
    id v16 = [v15 request];
    v17 = [v16 content];
    v18 = [v17 userInfo];

    v19 = v18;
    if (!v18)
    {
      v25 = qword_2E480;
      v21 = v14;
      v8 = v12;
      v9 = v40;
      if (os_log_type_enabled((os_log_t)qword_2E480, OS_LOG_TYPE_ERROR)) {
        sub_14AF4((uint64_t)v6, v25);
      }
      goto LABEL_29;
    }
    v20 = [v18 objectForKey:@"bid"];
    if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v24 = qword_2E480;
      v21 = v14;
      v8 = v12;
      v9 = v40;
      if (os_log_type_enabled((os_log_t)qword_2E480, OS_LOG_TYPE_ERROR)) {
        sub_14B6C((uint64_t)v20, v24);
      }
      goto LABEL_28;
    }
    v21 = v14;
    if ([v14 isEqualToString:@"ADD_FACE_ID"])
    {
      v22 = qword_2E480;
      v8 = v12;
      if (os_log_type_enabled((os_log_t)qword_2E480, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v42 = v6;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "ADDING FACE for response %{public}@", buf, 0xCu);
      }
      v23 = +[NSDistributedNotificationCenter defaultCenter];
      [v23 postNotificationName:@"NTKFaceSupportAddFaceNotification" object:v20];

      [(NTKCompanionCustomization *)self _addFaceForBundleIdentifier:v20];
      v9 = v40;
    }
    else
    {
      unsigned int v26 = [v14 isEqualToString:@"VIEW_GALLERY_ID"];
      v8 = v12;
      if (v26)
      {
        v27 = qword_2E480;
        v9 = v40;
        if (os_log_type_enabled((os_log_t)qword_2E480, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v42 = v6;
          _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "VIEWING GALLERY for response %{public}@", buf, 0xCu);
        }
        v28 = +[NSDistributedNotificationCenter defaultCenter];
        [v28 postNotificationName:@"NTKFaceSupportViewFaceNotification" object:v20];

        [(NTKCompanionCustomization *)self _viewFaceForBundleIdentifier:v20 showDetail:0];
      }
      else
      {
        v9 = v40;
        if (![v21 isEqualToString:@"VIEW_WHATS_NEW_ID"])
        {
          v32 = [v18 objectForKey:@"defaultaction"];
          if ([v32 isEqualToString:@"detail"])
          {
            log = qword_2E480;
            if (os_log_type_enabled((os_log_t)qword_2E480, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              id v42 = v6;
              __int16 v43 = 2114;
              v44 = v21;
              _os_log_impl(&dword_0, log, OS_LOG_TYPE_DEFAULT, "VIEWING FACE DETAIL for response %{public}@ - %{public}@", buf, 0x16u);
            }
            [(NTKCompanionCustomization *)self _viewFaceForBundleIdentifier:v20 showDetail:1];
          }
          else
          {
            v36 = v32;
            os_log_t loga = v19;
            unsigned int v33 = [v32 isEqualToString:@"whatsnew"];
            v34 = qword_2E480;
            BOOL v35 = os_log_type_enabled((os_log_t)qword_2E480, OS_LOG_TYPE_DEFAULT);
            if (v33)
            {
              if (v35)
              {
                *(_DWORD *)buf = 138543618;
                id v42 = v6;
                __int16 v43 = 2114;
                v44 = v21;
                _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "VIEWING WHAT'S NEW for response %{public}@ - %{public}@", buf, 0x16u);
              }
              [(NTKCompanionCustomization *)self _viewWhatsNew];
            }
            else
            {
              if (v35)
              {
                *(_DWORD *)buf = 138543618;
                id v42 = v6;
                __int16 v43 = 2114;
                v44 = v21;
                _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "PERFORMING DEFAULT ACTION (VIEWING FACE DETAIL) for response %{public}@ - %{public}@", buf, 0x16u);
              }
              [(NTKCompanionCustomization *)self _viewFaceForBundleIdentifier:v20 showDetail:1];
            }
            v32 = v36;
            v19 = loga;
          }

          goto LABEL_28;
        }
        v29 = qword_2E480;
        if (os_log_type_enabled((os_log_t)qword_2E480, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v42 = v6;
          _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "VIEWING WHAT'S NEW for response %{public}@", buf, 0xCu);
        }
        v30 = +[NSDistributedNotificationCenter defaultCenter];
        [v30 postNotificationName:@"NTKFaceSupportViewWhatsNewNotification" object:v20];

        [(NTKCompanionCustomization *)self _viewWhatsNew];
      }
    }
    v19 = v18;
LABEL_28:

LABEL_29:
    uint64_t v10 = v39;
    goto LABEL_30;
  }
  LOBYTE(v11) = 0;
LABEL_31:

  return v11;
}

- (BOOL)handlePresentationOfNotification:(id)a3 fromNotificationCenter:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v7 = (void (**)(id, uint64_t))a5;
  BOOL v8 = [(NTKCompanionCustomization *)self _canHandleNotification:a3];
  if (v8) {
    v7[2](v7, 26);
  }

  return v8;
}

- (void)_addFaceForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[CLKDevice currentDevice];
  id v6 = NTKCollectionIdentifierLibraryFaces;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2E498);
  id WeakRetained = objc_loadWeakRetained(&qword_2E4A0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  BOOL v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&qword_2E4A0);
  if (v5 != v9)
  {

LABEL_5:
    id v12 = objc_storeWeak(&qword_2E4A0, v5);
    qword_2E4A8 = (uint64_t)[v5 version];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_E780;
    v18[3] = &unk_24BC8;
    id v19 = v6;
    sub_E780((uint64_t)v18, v5);

    goto LABEL_6;
  }
  id v10 = [v5 version];
  uint64_t v11 = qword_2E4A8;

  if (v10 != (id)v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2E498);
  uint64_t v13 = +[NTKFaceBundleManager sharedManager];
  v14 = [v13 faceBundleForBundleIdentifier:v4 onDevice:v5];

  v15 = [v14 defaultFaceForDevice:v5];
  [(id)qword_2E490 appendFace:v15 suppressingCallbackToObserver:0];
  [(id)qword_2E490 setSelectedFace:v15 suppressingCallbackToObserver:0];
  id v16 = [(NTKCompanionCustomization *)self galleryViewController];
  v17 = [v16 tabBarController];
  [v17 setSelectedIndex:0];
}

- (void)_viewFaceForBundleIdentifier:(id)a3 showDetail:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v9 = [(NTKCompanionCustomization *)self galleryViewController];
  uint64_t v7 = [v9 tabBarController];
  [v7 setSelectedViewController:v9];
  id v8 = [v9 popToRootViewControllerAnimated:0];
  if (v4) {
    [v9 openFaceDetailForFaceWithBundleIdentifier:v6];
  }
  else {
    [v9 navigateToRowContainingBundleIdentifier:v6];
  }
}

- (void)_viewWhatsNew
{
  id v4 = [(NTKCompanionCustomization *)self galleryViewController];
  id v2 = [v4 tabBarController];
  [v2 setSelectedViewController:v4];
  id v3 = [v4 popToRootViewControllerAnimated:0];
  [v4 navigateToRowContainingWhatsNew];
}

- (BOOL)_canHandleNotification:(id)a3
{
  id v3 = [a3 request];
  id v4 = [v3 content];
  id v5 = [v4 categoryIdentifier];
  unsigned __int8 v6 = [v5 hasPrefix:@"com.apple.nanotimekit.facesupport."];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryViewController, 0);
  objc_storeStrong((id *)&self->_libraryViewController, 0);

  objc_storeStrong((id *)&self->_facesViewController, 0);
}

@end