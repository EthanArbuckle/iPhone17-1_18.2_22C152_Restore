@interface NEUserNotification
+ (BOOL)shouldPromptForLocalAuthentication;
+ (id)createLAContext;
+ (void)cancelCurrentNotificationWithResponse:(unint64_t)a3 queue:(id)a4 completionHandler:(id)a5;
+ (void)executeOnMainLoop:(uint64_t)a1;
+ (void)promptForLocalAuthenticationWithReason:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (BOOL)postNotificationWithCallbackQueue:(void *)a3 callbackHandler:;
- (id)initAndShowAddConfigurationsForApp:(id)a3 warningHeader:(const char *)a4 warning:(const char *)a5 callbackQueue:(id)a6 callbackHandler:(id)a7;
- (id)initAndShowAlertWithHeader:(id)a3 message:(id)a4 alternateMessage:(id)a5 defaultMessage:(id)a6 noBoldDefault:(BOOL)a7 usePrivacyIcon:(BOOL)a8 extensionItem:(id)a9 callbackQueue:(id)a10 callbackHandler:(id)a11;
- (id)initAndShowAuthenticationWithHeader:(id)a3 options:(id)a4 flags:(unint64_t)a5 callbackQueue:(id)a6 callbackHandler:(id)a7;
- (id)initAndShowLocalNetworkAlertWithAppName:(id)a3 reasonString:(id)a4 extensionItem:(id)a5 callbackQueue:(id)a6 callbackHandler:(id)a7;
- (void)cancel;
@end

@implementation NEUserNotification

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_notificationSource, 0);

  objc_storeStrong(&self->_notification, 0);
}

- (id)initAndShowLocalNetworkAlertWithAppName:(id)a3 reasonString:(id)a4 extensionItem:(id)a5 callbackQueue:(id)a6 callbackHandler:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  v16 = NEResourcesCopyDeviceLocalizedNSString(@"APP_WANTS_LOCAL_NETWORK_HEADER", @"APP_WANTS_LOCAL_NETWORK_HEADER");
  if (v11)
  {
    id v17 = v11;
  }
  else
  {
    NEResourcesCopyDeviceLocalizedNSString(@"APP_WANTS_LOCAL_NETWORK_MESSAGE", @"APP_WANTS_LOCAL_NETWORK_MESSAGE");
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;
  int v19 = _os_feature_enabled_impl();
  if (v12 && v19)
  {
    v20 = NEResourcesCopyDeviceLocalizedNSString(@"APP_WANTS_LOCAL_NETWORK_DISCOVERED_DEVICES_MESSAGE", @"APP_WANTS_LOCAL_NETWORK_DISCOVERED_DEVICES_MESSAGE");
    if (v20)
    {
      v29 = v16;
      v21 = [v12 userInfo];
      if (v21)
      {
        v22 = [v12 userInfo];
        v23 = (void *)[v22 mutableCopy];
      }
      else
      {
        v23 = [MEMORY[0x1E4F1CA60] dictionary];
      }

      [v23 setObject:v20 forKey:@"message"];
      [v12 setUserInfo:v23];

      v16 = v29;
    }
  }
  v24 = NEResourcesCopyDeviceLocalizedNSString(@"ALLOW_BUTTON", @"ALLOW_BUTTON");
  v25 = NEResourcesCopyDeviceLocalizedNSString(@"DONT_ALLOW_BUTTON", @"DONT_ALLOW_BUTTON");
  v26 = objc_msgSend([NSString alloc], "initWithFormat:", v16, v15);

  id v27 = [(NEUserNotification *)self initAndShowAlertWithHeader:v26 message:v18 alternateMessage:v25 defaultMessage:v24 noBoldDefault:1 usePrivacyIcon:1 extensionItem:v12 callbackQueue:v14 callbackHandler:v13];
  return v27;
}

- (id)initAndShowAddConfigurationsForApp:(id)a3 warningHeader:(const char *)a4 warning:(const char *)a5 callbackQueue:(id)a6 callbackHandler:(id)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  id v11 = a6;
  id v12 = a3;
  self;
  if (!g_UIKitBundle)
  {
    unsigned __int8 v37 = 0;
    id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v14 = [v13 fileExistsAtPath:@"/System/Library/PrivateFrameworks/UIKitCore.framework" isDirectory:&v37];
    int v15 = v37;

    if (v14 && v15 != 0)
    {
      uint64_t v17 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/PrivateFrameworks/UIKitCore.framework"];
      v18 = (void *)g_UIKitBundle;
      g_UIKitBundle = v17;

      if (g_UIKitBundle)
      {
        [(id)g_UIKitBundle load];
        g_UIDeviceClass = [(id)g_UIKitBundle classNamed:@"UIDevice"];
        int v19 = ne_log_obj();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v39 = "+[NEUserNotification getUIDeviceClass]";
          __int16 v40 = 2112;
          uint64_t v41 = g_UIKitBundle;
          __int16 v42 = 2112;
          uint64_t v43 = g_UIDeviceClass;
          _os_log_debug_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_DEBUG, "%s: bundle %@ class %@", buf, 0x20u);
        }
      }
    }
  }
  v20 = [(id)g_UIDeviceClass currentDevice];
  v21 = v20;
  if (v20)
  {
    v22 = [v20 localizedModel];
  }
  else
  {
    v22 = @"Mac";
  }
  id v23 = [NSString alloc];
  v24 = [NSString stringWithUTF8String:a4];
  v25 = NEResourcesCopyLocalizedNSString(v24, v24);
  v26 = objc_msgSend(v23, "initWithFormat:", v25, v12);

  id v27 = [NSString alloc];
  v28 = [NSString stringWithUTF8String:a5];
  v29 = NEResourcesCopyLocalizedNSString(v28, v28);
  v30 = objc_msgSend(v27, "initWithFormat:", v29, v22, v12);

  v31 = NEResourcesCopyLocalizedNSString(@"DONT_ALLOW_BUTTON", @"DONT_ALLOW_BUTTON");
  v32 = NEResourcesCopyLocalizedNSString(@"ALLOW_BUTTON", @"ALLOW_BUTTON");
  id v33 = [(NEUserNotification *)self initAndShowAlertWithHeader:v26 message:v30 alternateMessage:v32 defaultMessage:v31 noBoldDefault:0 usePrivacyIcon:0 extensionItem:0 callbackQueue:v11 callbackHandler:v10];

  return v33;
}

- (void)cancel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __28__NEUserNotification_cancel__block_invoke;
  v2[3] = &unk_1E59932C0;
  v2[4] = self;
  +[NEUserNotification executeOnMainLoop:]((uint64_t)NEUserNotification, v2);
}

void __28__NEUserNotification_cancel__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&g_currentNotificationLock);
  if ([(id)g_currentNotifications containsObject:*(void *)(a1 + 32)]) {
    [(id)g_currentNotifications removeObject:*(void *)(a1 + 32)];
  }
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    if (objc_getProperty(v3, v2, 24, 1))
    {
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v4, 24, 1);
      }
      v6 = (__CFRunLoopSource *)Property;
      Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(Current, v6, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
      CFRelease(v6);
      v9 = *(void **)(a1 + 32);
      if (!v9) {
        goto LABEL_18;
      }
      objc_setProperty_atomic(v9, v8, 0, 24);
    }
    id v10 = *(void **)(a1 + 32);
    if (!v10) {
      goto LABEL_18;
    }
    id v12 = objc_getProperty(v10, v4, 16, 1);
    id v13 = *(id *)(a1 + 32);
    if (!v12) {
      goto LABEL_15;
    }
    if (v13) {
      id v13 = objc_getProperty(v13, v11, 16, 1);
    }
    int v14 = (__CFUserNotification *)v13;
    CFUserNotificationCancel(v14);
    CFRelease(v14);
    v16 = *(void **)(a1 + 32);
    if (v16)
    {
      objc_setProperty_atomic(v16, v15, 0, 16);
      id v13 = *(id *)(a1 + 32);
LABEL_15:
      if (v13)
      {
        objc_setProperty_nonatomic_copy(v13, v11, 0, 40);
        v18 = *(void **)(a1 + 32);
        if (v18) {
          objc_setProperty_atomic(v18, v17, 0, 32);
        }
      }
    }
  }
LABEL_18:

  os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
}

+ (void)executeOnMainLoop:(uint64_t)a1
{
  v2 = a2;
  self;
  Current = CFRunLoopGetCurrent();
  if (Current == CFRunLoopGetMain())
  {
    v2[2](v2);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__NEUserNotification_executeOnMainLoop___block_invoke;
    block[3] = &unk_1E5993770;
    v5 = v2;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __40__NEUserNotification_executeOnMainLoop___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)initAndShowAuthenticationWithHeader:(id)a3 options:(id)a4 flags:(unint64_t)a5 callbackQueue:(id)a6 callbackHandler:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  CFDictionaryRef v13 = (const __CFDictionary *)a4;
  id v14 = a6;
  id v15 = a7;
  v33.receiver = self;
  v33.super_class = (Class)NEUserNotification;
  v16 = [(NEUserNotification *)&v33 init];
  if (!v16) {
    goto LABEL_20;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&g_currentNotificationLock);
  uint64_t v17 = [(id)g_currentNotifications count];
  v18 = ne_log_obj();
  int v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v32 = [(id)g_currentNotifications firstObject];
      SInt32 error = 138412290;
      v35 = v32;
      _os_log_error_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_ERROR, "Already have outstanding notification %@, cannot show an additional one", (uint8_t *)&error, 0xCu);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
    goto LABEL_22;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    SInt32 error = 138412290;
    v35 = v16;
    _os_log_debug_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_DEBUG, "No outstanding notification, we are now the current notification %@", (uint8_t *)&error, 0xCu);
  }

  v20 = (void *)g_currentNotifications;
  if (!g_currentNotifications)
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v22 = (void *)g_currentNotifications;
    g_currentNotifications = (uint64_t)v21;

    v20 = (void *)g_currentNotifications;
  }
  [v20 addObject:v16];
  os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
  SInt32 error = 0;
  objc_setProperty_atomic(v16, v23, 0, 16);
  if (v13)
  {
    NEResourcesCopyLocalizedNSString(@"CANCEL_BUTTON", @"CANCEL_BUTTON");
    v25 = (const void *)objc_claimAutoreleasedReturnValue();
    CFAllocatorRef v26 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v13);
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x1E4F1D990], v12);
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x1E4F1D9D0], v25);
    CFUserNotificationRef v29 = CFUserNotificationCreate(v26, 150.0, a5, &error, MutableCopy);
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
    if (v25) {
      CFRelease(v25);
    }
    if (!v29 || error) {
      goto LABEL_21;
    }
    objc_setProperty_atomic(v16, v28, v29, 16);
  }
  if (!objc_getProperty(v16, v24, 16, 1)
    || !-[NEUserNotification postNotificationWithCallbackQueue:callbackHandler:]((uint64_t)v16, v14, v15))
  {
LABEL_21:
    [(NEUserNotification *)v16 cancel];
LABEL_22:
    v30 = 0;
    goto LABEL_23;
  }
LABEL_20:
  v30 = v16;
LABEL_23:

  return v30;
}

- (BOOL)postNotificationWithCallbackQueue:(void *)a3 callbackHandler:
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__NEUserNotification_postNotificationWithCallbackQueue_callbackHandler___block_invoke;
  v13[3] = &unk_1E5992CF0;
  v13[4] = a1;
  id v7 = v6;
  id v15 = v7;
  id v8 = v5;
  id v14 = v8;
  v16 = &v17;
  +[NEUserNotification executeOnMainLoop:]((uint64_t)NEUserNotification, v13);
  if (*((unsigned char *)v18 + 24))
  {
    BOOL v9 = 1;
  }
  else
  {
    id v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_INFO, "Failed to post new user notification: current notification in progress", v12, 2u);
    }

    BOOL v9 = *((unsigned char *)v18 + 24) != 0;
  }

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __72__NEUserNotification_postNotificationWithCallbackQueue_callbackHandler___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = *(void *)(a1 + 32);
    int v28 = 138412290;
    uint64_t v29 = v27;
    _os_log_debug_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEBUG, "Displaying notification: %@", (uint8_t *)&v28, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&g_currentNotificationLock);
  v4 = *(void **)(a1 + 32);
  if (!v4) {
    goto LABEL_8;
  }
  id v5 = objc_getProperty(v4, v3, 16, 1);
  if (!v5) {
    goto LABEL_8;
  }
  id v7 = v5;
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = objc_getProperty(v8, v6, 24, 1);
    if (v9)
    {

LABEL_8:
      os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
      return;
    }
    uint64_t v10 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v10 = 0;
  }
  char v11 = [(id)g_currentNotifications containsObject:v10];

  os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
  if (v11)
  {
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v12, 16, 1);
    }
    id v14 = (__CFUserNotification *)Property;
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15)
    {
      if (*(unsigned char *)(v15 + 8)) {
        v16 = (void (__cdecl *)(CFUserNotificationRef, CFOptionFlags))alertCallback;
      }
      else {
        v16 = (void (__cdecl *)(CFUserNotificationRef, CFOptionFlags))authCallback;
      }
    }
    else
    {
      v16 = (void (__cdecl *)(CFUserNotificationRef, CFOptionFlags))authCallback;
    }
    RunLoopSource = CFUserNotificationCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v14, v16, 0);
    uint64_t v19 = *(void **)(a1 + 32);
    if (v19) {
      objc_setProperty_atomic(v19, v17, v14, 16);
    }

    if (RunLoopSource)
    {
      id v21 = *(void **)(a1 + 32);
      if (v21)
      {
        objc_setProperty_nonatomic_copy(v21, v20, *(id *)(a1 + 48), 40);
        SEL v23 = *(void **)(a1 + 32);
        if (v23) {
          objc_setProperty_atomic(v23, v22, *(id *)(a1 + 40), 32);
        }
      }
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
      CFAllocatorRef v26 = *(void **)(a1 + 32);
      if (v26) {
        objc_setProperty_atomic(v26, v25, RunLoopSource, 24);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
}

- (id)initAndShowAlertWithHeader:(id)a3 message:(id)a4 alternateMessage:(id)a5 defaultMessage:(id)a6 noBoldDefault:(BOOL)a7 usePrivacyIcon:(BOOL)a8 extensionItem:(id)a9 callbackQueue:(id)a10 callbackHandler:(id)a11
{
  BOOL v11 = a7;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  v54.receiver = self;
  v54.super_class = (Class)NEUserNotification;
  SEL v23 = [(NEUserNotification *)&v54 init];
  if (!v23) {
    goto LABEL_36;
  }
  BOOL v50 = v11;
  value = v16;
  os_unfair_lock_lock((os_unfair_lock_t)&g_currentNotificationLock);
  uint64_t v24 = [(id)g_currentNotifications count];
  v25 = ne_log_obj();
  CFAllocatorRef v26 = v25;
  if (v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v47 = [(id)g_currentNotifications firstObject];
      *(_DWORD *)buf = 138412290;
      v57 = v47;
      _os_log_error_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_ERROR, "Already have outstanding notification %@, cannot show an additional one", buf, 0xCu);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
    goto LABEL_38;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v23;
    _os_log_debug_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_DEBUG, "Adding notification %@", buf, 0xCu);
  }

  uint64_t v27 = (void *)g_currentNotifications;
  BOOL v28 = v50;
  if (!g_currentNotifications)
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v30 = (void *)g_currentNotifications;
    g_currentNotifications = (uint64_t)v29;

    uint64_t v27 = (void *)g_currentNotifications;
  }
  [v27 addObject:v23];
  os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
  SInt32 error = 0;
  objc_setProperty_atomic(v23, v31, 0, 16);
  CFAllocatorRef v32 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (Mutable)
  {
    v35 = Mutable;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F1D990], value);
    if (v17) {
      CFDictionarySetValue(v35, (const void *)*MEMORY[0x1E4F1D9A8], v17);
    }
    if (v18) {
      CFDictionarySetValue(v35, (const void *)*MEMORY[0x1E4F1D9D0], v18);
    }
    if (v19)
    {
      uint64_t v36 = (const void **)MEMORY[0x1E4F1DA10];
      if (!v50) {
        uint64_t v36 = (const void **)MEMORY[0x1E4F1D9E0];
      }
      CFDictionarySetValue(v35, *v36, v19);
    }
    if (v20)
    {
      id v48 = v17;
      CFAllocatorRef v49 = v32;
      CFDictionarySetValue(v35, @"SBUserNotificationExtensionIdentifier", @"com.apple.corelocation.CoreLocationMapLNPromptPlugin");
      unsigned __int8 v37 = (void *)MEMORY[0x1E4F28DB0];
      id v55 = v20;
      v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
      id v52 = 0;
      v39 = [v37 archivedDataWithRootObject:v38 requiringSecureCoding:1 error:&v52];
      __int16 v40 = (NEUserNotification *)v52;

      if (v39 || !v40)
      {
        CFDictionarySetValue(v35, @"SBUserNotificationExtensionItems", v39);
      }
      else
      {
        uint64_t v41 = ne_log_obj();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v57 = v40;
          _os_log_error_impl(&dword_19DDAF000, v41, OS_LOG_TYPE_ERROR, "Failed to encode extension item data, error='%@'", buf, 0xCu);
        }
      }
      BOOL v28 = v50;

      id v17 = v48;
      CFAllocatorRef v32 = v49;
    }
    if (v28) {
      CFOptionFlags v42 = 35;
    }
    else {
      CFOptionFlags v42 = 1;
    }
    CFUserNotificationRef v43 = CFUserNotificationCreate(v32, 0.0, v42, &error, v35);
    CFRelease(v35);
    if (!v43 || error) {
      goto LABEL_37;
    }
    objc_setProperty_atomic(v23, v44, v43, 16);
  }
  if (!objc_getProperty(v23, v34, 16, 1)
    || (v23->_isAlert = 1,
        !-[NEUserNotification postNotificationWithCallbackQueue:callbackHandler:]((uint64_t)v23, v21, v22)))
  {
LABEL_37:
    [(NEUserNotification *)v23 cancel];
LABEL_38:
    v45 = 0;
    id v16 = value;
    goto LABEL_39;
  }
  id v16 = value;
LABEL_36:
  v45 = v23;
LABEL_39:

  return v45;
}

+ (void)promptForLocalAuthenticationWithReason:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[NEUserNotification createLAContext]();
  BOOL v11 = v10;
  if (v10)
  {
    id v22 = 0;
    int v12 = [v10 canEvaluatePolicy:2 error:&v22];
    id v13 = v22;
    if (v12)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke_2;
      v19[3] = &unk_1E5992D68;
      id v20 = v8;
      id v21 = v9;
      [v11 evaluatePolicy:2 localizedReason:v7 reply:v19];

      id v14 = v20;
    }
    else
    {
      id v16 = ne_log_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v13;
        _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, "Device cannot evaluate Local Authentication: %@", buf, 0xCu);
      }

      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke_46;
      v17[3] = &unk_1E5993770;
      id v18 = v9;
      dispatch_async(v8, v17);
      id v14 = v18;
    }
  }
  else
  {
    uint64_t v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_ERROR, "Failed to create the LocalAuthentication context", buf, 2u);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke;
    block[3] = &unk_1E5993770;
    id v24 = v9;
    dispatch_async(v8, block);
    id v13 = v24;
  }
}

+ (id)createLAContext
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  self;
  if (!g_LABundle)
  {
    unsigned __int8 v9 = 0;
    v0 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v1 = [v0 fileExistsAtPath:@"/System/Library/Frameworks/LocalAuthentication.framework" isDirectory:&v9];
    int v2 = v9;

    if (v1 && v2 != 0)
    {
      uint64_t v4 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/Frameworks/LocalAuthentication.framework"];
      id v5 = (void *)g_LABundle;
      g_LABundle = v4;

      if (g_LABundle)
      {
        [(id)g_LABundle load];
        g_LAContextClass = [(id)g_LABundle classNamed:@"LAContext"];
        id v6 = ne_log_obj();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          BOOL v11 = "+[NEUserNotification createLAContext]";
          __int16 v12 = 2112;
          uint64_t v13 = g_LABundle;
          __int16 v14 = 2112;
          uint64_t v15 = g_LAContextClass;
          _os_log_debug_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEBUG, "%s: bundle %@ class %@", buf, 0x20u);
        }
      }
    }
  }
  id v7 = objc_alloc_init((Class)g_LAContextClass);

  return v7;
}

uint64_t __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = ne_log_obj();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_DEBUG, "User successfully passed Local Authentication", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "User failed Local Authentication, SInt32 error = %@", buf, 0xCu);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke_44;
  v9[3] = &unk_1E5992D40;
  id v8 = *(NSObject **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  char v11 = a2;
  dispatch_async(v8, v9);
}

uint64_t __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

+ (BOOL)shouldPromptForLocalAuthentication
{
  int v2 = +[NEUserNotification createLAContext]();
  id v8 = 0;
  char v3 = [v2 canEvaluatePolicy:2 error:&v8];
  id v4 = v8;
  id v5 = v4;
  BOOL v6 = (v3 & 1) != 0 || !v4 || [v4 code] != -5;

  return v6;
}

+ (void)cancelCurrentNotificationWithResponse:(unint64_t)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__NEUserNotification_cancelCurrentNotificationWithResponse_queue_completionHandler___block_invoke;
  v11[3] = &unk_1E5992D90;
  id v13 = v8;
  unint64_t v14 = a3;
  id v12 = v7;
  id v9 = v8;
  id v10 = v7;
  +[NEUserNotification executeOnMainLoop:]((uint64_t)NEUserNotification, v11);
}

void __84__NEUserNotification_cancelCurrentNotificationWithResponse_queue_completionHandler___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&g_currentNotificationLock);
  int v2 = [(id)g_currentNotifications firstObject];
  os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
  if (v2)
  {
    id v4 = objc_getProperty(v2, v3, 32, 1);
    id v5 = v2[5];
    [v2 cancel];
    if (v4) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __84__NEUserNotification_cancelCurrentNotificationWithResponse_queue_completionHandler___block_invoke_2;
      v9[3] = &unk_1E5992D18;
      id v7 = v5;
      uint64_t v8 = *(void *)(a1 + 48);
      id v10 = v7;
      uint64_t v11 = v8;
      dispatch_async(v4, v9);
    }
  }
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
}

uint64_t __84__NEUserNotification_cancelCurrentNotificationWithResponse_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 0);
}

@end