id sub_2405D9184(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  int v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 60) || *(unsigned char *)(a1 + 61))
  {
    v2 = *(_DWORD *)(a1 + 56);
    if (v2 == 1)
    {
      if (*(unsigned char *)(a1 + 62))
      {
        v3 = PLPreferencesGetLog();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          v4 = *(void *)(a1 + 32);
          v47 = 138412290;
          v48 = v4;
          _os_log_impl(&dword_2405D7000, v3, OS_LOG_TYPE_DEFAULT, "Enabling shared album for new account %@", (uint8_t *)&v47, 0xCu);
        }

        [*(id *)(a1 + 40) _setSharedAlbumEnabled:1];
      }
      if (*(unsigned char *)(a1 + 63))
      {
        v5 = PLPreferencesGetLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v6 = *(void *)(a1 + 32);
          v47 = 138412290;
          v48 = v6;
          _os_log_impl(&dword_2405D7000, v5, OS_LOG_TYPE_DEFAULT, "Enabling My Photo Stream for new account %@", (uint8_t *)&v47, 0xCu);
        }

        [*(id *)(a1 + 40) _setPhotoStreamEnabled:1];
      }
      if (*(unsigned char *)(a1 + 64))
      {
        v7 = PLPreferencesGetLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = *(void *)(a1 + 32);
          v47 = 138412290;
          v48 = v8;
          _os_log_impl(&dword_2405D7000, v7, OS_LOG_TYPE_DEFAULT, "Enabling iCPL for new account %@", (uint8_t *)&v47, 0xCu);
        }

        v9 = *(void **)(a1 + 40);
        v10 = [v9 libraryBundleForSPL];
        [v9 _setiCPLEnabled:1 forBundle:v10];
      }
      v11 = [*(id *)(a1 + 40) libraryBundleForGP];
      if (v11 && *(unsigned char *)(a1 + 65))
      {
        v12 = PLPreferencesGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = *(void *)(a1 + 32);
          v47 = 138412290;
          v48 = v13;
          _os_log_impl(&dword_2405D7000, v12, OS_LOG_TYPE_DEFAULT, "Enabling Image Playground iCPL for modified account %@", (uint8_t *)&v47, 0xCu);
        }

        [*(id *)(a1 + 40) _setiCPLEnabled:1 forBundle:v11];
      }

      v2 = *(_DWORD *)(a1 + 56);
    }
    if (v2 == 2)
    {
      if (!*(unsigned char *)(a1 + 62)) {
        goto LABEL_80;
      }
      if (!*(unsigned char *)(a1 + 66))
      {
        v14 = PLPreferencesGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(void *)(a1 + 32);
          v47 = 138412290;
          v48 = v15;
          _os_log_impl(&dword_2405D7000, v14, OS_LOG_TYPE_DEFAULT, "Enabling shared album for modified account %@", (uint8_t *)&v47, 0xCu);
        }

        [*(id *)(a1 + 40) _setSharedAlbumEnabled:1];
        if (!*(unsigned char *)(a1 + 62))
        {
LABEL_80:
          if (*(unsigned char *)(a1 + 66))
          {
            v16 = PLPreferencesGetLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v17 = *(void *)(a1 + 32);
              v47 = 138412290;
              v48 = v17;
              _os_log_impl(&dword_2405D7000, v16, OS_LOG_TYPE_DEFAULT, "Disabling shared album for modified account %@", (uint8_t *)&v47, 0xCu);
            }

            [*(id *)(a1 + 40) _setSharedAlbumEnabled:0];
          }
        }
      }
      if (!*(unsigned char *)(a1 + 63)) {
        goto LABEL_81;
      }
      if (!*(unsigned char *)(a1 + 67))
      {
        v18 = PLPreferencesGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = *(void *)(a1 + 32);
          v47 = 138412290;
          v48 = v19;
          _os_log_impl(&dword_2405D7000, v18, OS_LOG_TYPE_DEFAULT, "Enabling My Photo Stream for modified account %@", (uint8_t *)&v47, 0xCu);
        }

        [*(id *)(a1 + 40) _setPhotoStreamEnabled:1];
        if (!*(unsigned char *)(a1 + 63))
        {
LABEL_81:
          if (*(unsigned char *)(a1 + 67))
          {
            v20 = PLPreferencesGetLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = *(void *)(a1 + 32);
              v47 = 138412290;
              v48 = v21;
              _os_log_impl(&dword_2405D7000, v20, OS_LOG_TYPE_DEFAULT, "Disabling My Photo Stream for modified account %@", (uint8_t *)&v47, 0xCu);
            }

            [*(id *)(a1 + 40) _setPhotoStreamEnabled:0];
          }
        }
      }
      if (!*(unsigned char *)(a1 + 64)) {
        goto LABEL_82;
      }
      if (!*(unsigned char *)(a1 + 68))
      {
        v22 = PLPreferencesGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = *(void *)(a1 + 32);
          v47 = 138412290;
          v48 = v23;
          _os_log_impl(&dword_2405D7000, v22, OS_LOG_TYPE_DEFAULT, "Enabling iCPL for modified account %@", (uint8_t *)&v47, 0xCu);
        }

        v24 = *(void **)(a1 + 40);
        v25 = [v24 libraryBundleForSPL];
        [v24 _setiCPLEnabled:1 forBundle:v25];

        if (!*(unsigned char *)(a1 + 64))
        {
LABEL_82:
          if (*(unsigned char *)(a1 + 68))
          {
            v26 = PLPreferencesGetLog();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              v27 = *(void *)(a1 + 32);
              v47 = 138412290;
              v48 = v27;
              _os_log_impl(&dword_2405D7000, v26, OS_LOG_TYPE_DEFAULT, "Disabling iCPL for modified account %@", (uint8_t *)&v47, 0xCu);
            }

            v28 = *(void **)(a1 + 40);
            v29 = [v28 libraryBundleForSPL];
            [v28 _setiCPLEnabled:0 forBundle:v29];
          }
        }
      }
      v30 = [*(id *)(a1 + 40) libraryBundleForGP];
      if (v30)
      {
        if (!*(unsigned char *)(a1 + 65)) {
          goto LABEL_83;
        }
        if (!*(unsigned char *)(a1 + 69))
        {
          v31 = PLPreferencesGetLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = *(void *)(a1 + 32);
            v47 = 138412290;
            v48 = v32;
            _os_log_impl(&dword_2405D7000, v31, OS_LOG_TYPE_DEFAULT, "Enabling Image Playground iCPL for modified account %@", (uint8_t *)&v47, 0xCu);
          }

          [*(id *)(a1 + 40) _setiCPLEnabled:1 forBundle:v30];
          if (!*(unsigned char *)(a1 + 65))
          {
LABEL_83:
            if (*(unsigned char *)(a1 + 69))
            {
              v33 = PLPreferencesGetLog();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                v34 = *(void *)(a1 + 32);
                v47 = 138412290;
                v48 = v34;
                _os_log_impl(&dword_2405D7000, v33, OS_LOG_TYPE_DEFAULT, "Disabling Image Playground iCPL for modified account %@", (uint8_t *)&v47, 0xCu);
              }

              [*(id *)(a1 + 40) _setiCPLEnabled:0 forBundle:v30];
            }
          }
        }
      }

      v2 = *(_DWORD *)(a1 + 56);
    }
    if (v2 == 3)
    {
      v35 = PLPreferencesGetLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = *(void *)(a1 + 32);
        v47 = 138412290;
        v48 = v36;
        _os_log_impl(&dword_2405D7000, v35, OS_LOG_TYPE_DEFAULT, "Account %@ deleted, turning off Photos services", (uint8_t *)&v47, 0xCu);
      }

      if (*(unsigned char *)(a1 + 66))
      {
        v37 = PLPreferencesGetLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = *(void *)(a1 + 32);
          v47 = 138412290;
          v48 = v38;
          _os_log_impl(&dword_2405D7000, v37, OS_LOG_TYPE_DEFAULT, "Disabling shared album for deleted account %@", (uint8_t *)&v47, 0xCu);
        }

        [*(id *)(a1 + 40) _setSharedAlbumEnabled:0];
      }
      if (*(unsigned char *)(a1 + 67))
      {
        v39 = PLPreferencesGetLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = *(void *)(a1 + 32);
          v47 = 138412290;
          v48 = v40;
          _os_log_impl(&dword_2405D7000, v39, OS_LOG_TYPE_DEFAULT, "Disabling My Photo Stream for deleted account %@", (uint8_t *)&v47, 0xCu);
        }

        [*(id *)(a1 + 40) _setPhotoStreamEnabled:0];
      }
      v41 = PLPreferencesGetLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = *(void *)(a1 + 32);
        v47 = 138412290;
        v48 = v42;
        _os_log_impl(&dword_2405D7000, v41, OS_LOG_TYPE_DEFAULT, "Disabling iCPL for deleted account %@", (uint8_t *)&v47, 0xCu);
      }

      PLRecordiCPLDisableState();
      v43 = *(void **)(a1 + 40);
      v44 = [v43 libraryBundleForSPL];
      [v43 _setiCPLEnabled:0 forBundle:v44];

      v45 = [*(id *)(a1 + 40) libraryBundleForGP];
      if (v45) {
        [*(id *)(a1 + 40) _setiCPLEnabled:0 forBundle:v45];
      }
    }
  }
  return self;
}

void sub_2405D9FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_2405DA024(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  PLRecordiCPLEnableState();
  if (a2)
  {
    v6 = PLPreferencesGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v7;
      _os_log_impl(&dword_2405D7000, v6, OS_LOG_TYPE_DEFAULT, "Auto-enable iCloud Photos for account %@", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 32) setEnabled:1 forDataclass:*MEMORY[0x263EFAC58]];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else if (v5)
  {
    v8 = PLPreferencesGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_2405D7000, v8, OS_LOG_TYPE_ERROR, "Unable to auto-enable iCloud Photos for account %@: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t PLCanEnableCloudPhotoLibraryForAccount()
{
  return MEMORY[0x270F53718]();
}

uint64_t PLCanEnableSharedStreamsForAccount()
{
  return MEMORY[0x270F53720]();
}

uint64_t PLIsEDUMode()
{
  return MEMORY[0x270F53838]();
}

uint64_t PLPlatformCloudPhotosPrimarySyncSupported()
{
  return MEMORY[0x270F538A0]();
}

uint64_t PLPlatformMediaStreamSupported()
{
  return MEMORY[0x270F538A8]();
}

uint64_t PLPlatformSharedStreamsSupported()
{
  return MEMORY[0x270F538B0]();
}

uint64_t PLPreferencesGetLog()
{
  return MEMORY[0x270F538B8]();
}

uint64_t PLRecordiCPLDisableState()
{
  return MEMORY[0x270F53780]();
}

uint64_t PLRecordiCPLEnableState()
{
  return MEMORY[0x270F53788]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

uint64_t pl_dispatch_async_without_boost_on_queue()
{
  return MEMORY[0x270F53900]();
}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         [v3 setDomain:3];
  [v3 setContainerIdentifier:*MEMORY[0x263F5DAE0]];
  [v3 setUuid:*MEMORY[0x263F5DAD8]];
  int v10 = 0;
  v4 = [(PhotosAccountNotificationPlugin *)self _findPhotoLibraryIdentifiersMatchingSearchCriteria:v3 error:&v10];
  id v5 = v10;
  if (!v4)
  {
    v6 = PLPreferencesGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v12 = v5;
      _os_log_impl(&dword_2405D7000, v6, OS_LOG_TYPE_ERROR, "Unable to find default Image Playground library: %@", buf, 0xCu);
    }
    v8 = 0;
    goto LABEL_7;
  }
  if ([v4 count])
  {
    v6 = [v4 firstObject];
    uint64_t v7 = [v6 libraryURL];
    v8 = [(PhotosAccountNotificationPlugin *)self libraryBundleForURL:v7];

LABEL_7:
    goto LABEL_9;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (id)libraryBundleForSPL
{
  v3 = [MEMORY[0x263F5DB70] systemLibraryURL];
  v4 = [(PhotosAccountNotificationPlugin *)self libraryBundleForURL:v3];

  return v4;
}

- (id)libraryBundleForURL:(id)a3
{
  v3 = (void *)MEMORY[0x263F5D9A8];
  id v4 = a3;
  id v5 = [v3 sharedBundleController];
  v6 = [v5 openBundleAtLibraryURL:v4];

  return v6;
}

- (PhotosAccountNotificationPlugin)init
{
  v8.receiver = self;
  v8.super_class = (Class)PhotosAccountNotificationPlugin;
  v2 = [(PhotosAccountNotificationPlugin *)&v8 init];
  if (v2)
  {
    [MEMORY[0x263F5DB70] enableMultiLibraryMode];
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.photos.account_did_change_unboost", v4);
    unboostingQueue = v2->_unboostingQueue;
    v2->_unboostingQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

@end