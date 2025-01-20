@interface BCSNotificationIcon
+ (UNNotificationIcon)nfcIcon;
+ (UNNotificationIcon)qrCodeIcon;
+ (UNNotificationIcon)viewfinderIcon;
- (BCSNotificationIcon)initWithAction:(id)a3;
- (NSURL)imageURL;
- (id)_clipIconURLForAction:(id)a3 scale:(double)a4;
- (id)_notificationIconDataURLForApp:(id)a3 scale:(float)a4;
@end

@implementation BCSNotificationIcon

+ (UNNotificationIcon)qrCodeIcon
{
  {
    v2 = (void *)+[BCSNotificationIcon qrCodeIcon]::qrCodeIcon;
  }
  else
  {
    v2 = [MEMORY[0x263F1DF40] iconNamed:@"QR_section_icon"];
    +[BCSNotificationIcon qrCodeIcon]::qrCodeIcon = (uint64_t)v2;
  }
  return (UNNotificationIcon *)v2;
}

+ (UNNotificationIcon)nfcIcon
{
  {
    v2 = (void *)+[BCSNotificationIcon nfcIcon]::nfcIcon;
  }
  else
  {
    v2 = [MEMORY[0x263F1DF40] iconNamed:@"NFC_section_icon"];
    +[BCSNotificationIcon nfcIcon]::nfcIcon = (uint64_t)v2;
  }
  return (UNNotificationIcon *)v2;
}

+ (UNNotificationIcon)viewfinderIcon
{
  {
    v2 = (void *)+[BCSNotificationIcon viewfinderIcon]::viewfinderIcon;
  }
  else
  {
    v2 = [MEMORY[0x263F1DF40] iconNamed:@"Viewfinder_section_icon"];
    +[BCSNotificationIcon viewfinderIcon]::viewfinderIcon = (uint64_t)v2;
  }
  return (UNNotificationIcon *)v2;
}

- (BCSNotificationIcon)initWithAction:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCSNotificationIcon;
  v5 = [(BCSNotificationIcon *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_action, v4);
    v7 = v6;
  }

  return v6;
}

- (NSURL)imageURL
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  id v4 = [WeakRetained defaultActionTargetApplicationBundleIdentifier];
  MGGetFloat32Answer();
  float v6 = v5;
  if (v5 == 3.0) {
    v7 = @"CellularData@3x";
  }
  else {
    v7 = @"CellularData@2x";
  }
  if ([v4 isEqualToString:@"com.apple.Preferences.cellularData"])
  {
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v9 = [v8 URLForResource:v7 withExtension:@"png"];

    goto LABEL_21;
  }
  if (![v4 length])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSNotificationIcon: target app identifier is nil", buf, 2u);
    }
LABEL_16:
    objc_super v9 = 0;
    goto LABEL_21;
  }
  objc_super v9 = [(BCSNotificationIcon *)self _clipIconURLForAction:WeakRetained scale:v6];
  if (v9) {
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [WeakRetained isAMSAction]
    && (([v4 isEqualToString:@"com.apple.ios.StoreKitUIService"] & 1) != 0
     || ([v4 isEqualToString:@"com.apple.AMSEngagementViewService"] & 1) != 0))
  {
    goto LABEL_16;
  }
  v10 = [getLSApplicationProxyClass() applicationProxyForIdentifier:v4];
  if (v10)
  {
    *(float *)&double v11 = v6;
    objc_super v9 = [(BCSNotificationIcon *)self _notificationIconDataURLForApp:v10 scale:v11];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSNotificationIcon: app proxy is nil", v13, 2u);
    }
    objc_super v9 = 0;
  }

LABEL_21:
  return (NSURL *)v9;
}

- (id)_clipIconURLForAction:(id)a3 scale:(double)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float v6 = [v5 clipMetadataRequest];
    v7 = [v6 getClipMetadataSynchronously];

    if (v7)
    {
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__0;
      v26 = __Block_byref_object_dispose__0;
      id v27 = 0;
      v8 = dispatch_group_create();
      dispatch_group_enter(v8);
      objc_super v9 = [v5 clipMetadataRequest];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __51__BCSNotificationIcon__clipIconURLForAction_scale___block_invoke;
      v18[3] = &unk_26468B6B8;
      v10 = v8;
      double v21 = a4;
      v19 = v10;
      v20 = &v22;
      [v9 requestDownloadedIconWithMetadata:v7 completion:v18];

      dispatch_time_t v11 = dispatch_time(0, 1000000000);
      dispatch_group_wait(v10, v11);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = v23[5];
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = v12;
        _os_log_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_INFO, "BCSNotificationIcon: processed icon URL after timeout = %@", buf, 0xCu);
      }
      v13 = (void *)v23[5];
      if (v13)
      {
        id v14 = v13;
      }
      else
      {
        if (a4 == 3.0) {
          v15 = @"AppClips@3x";
        }
        else {
          v15 = @"AppClips@2x";
        }
        v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v14 = [v16 URLForResource:v15 withExtension:@"png"];
      }
      _Block_object_dispose(&v22, 8);
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void __51__BCSNotificationIcon__clipIconURLForAction_scale___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc_init(BCSConfigurationManager);
    double v5 = *(double *)(a1 + 48);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__BCSNotificationIcon__clipIconURLForAction_scale___block_invoke_2;
    v8[3] = &unk_26468B690;
    long long v7 = *(_OWORD *)(a1 + 32);
    id v6 = (id)v7;
    long long v9 = v7;
    [(BCSConfigurationManager *)v4 processAppClipImageWithURL:v3 scale:v8 completion:v5];
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __51__BCSNotificationIcon__clipIconURLForAction_scale___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)_notificationIconDataURLForApp:(id)a3 scale:(float)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _bcs_notificationIconBaseURL();
  long long v7 = NSString;
  v8 = [v5 bundleIdentifier];
  long long v9 = [v7 stringWithFormat:@"%@.png", v8];
  v10 = [v6 URLByAppendingPathComponent:v9];

  if (v10)
  {
    dispatch_time_t v11 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v12 = [v10 absoluteString];
    int v13 = [v11 fileExistsAtPath:v12 isDirectory:0];

    if (v13)
    {
      id v14 = v10;
      goto LABEL_33;
    }
    if (a4 == 2.0)
    {
      uint64_t v15 = 17;
    }
    else if (a4 == 3.0)
    {
      uint64_t v15 = 34;
    }
    else
    {
      uint64_t v15 = 64;
    }
    v16 = [v5 iconDataForVariant:v15];
    if (v16)
    {
      uint64_t v28 = 0;
      uint64_t v29 = &v28;
      uint64_t v30 = 0x2020000000;
      v17 = (uint64_t (*)(void *))getLICreateIconFromCachedBitmapSymbolLoc(void)::ptr;
      v31 = getLICreateIconFromCachedBitmapSymbolLoc(void)::ptr;
      if (!getLICreateIconFromCachedBitmapSymbolLoc(void)::ptr)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        uint64_t v33 = 3221225472;
        v34 = ___ZL40getLICreateIconFromCachedBitmapSymbolLocv_block_invoke;
        v35 = &unk_26468B6E0;
        v36 = &v28;
        ___ZL40getLICreateIconFromCachedBitmapSymbolLocv_block_invoke(buf);
        v17 = (uint64_t (*)(void *))v29[3];
      }
      _Block_object_dispose(&v28, 8);
      if (!v17)
      {
        v25 = [MEMORY[0x263F08690] currentHandler];
        v26 = [NSString stringWithUTF8String:"CGImageRef _LICreateIconFromCachedBitmap(CFDataRef)"];
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"BCSNotificationIcon.mm", 31, @"%s", dlerror());

        __break(1u);
      }
      v18 = (CGImage *)v17(v16);
      v19 = v18;
      if (v18)
      {
        v20 = _bcs_CGImagePNGRepresentation(v18);
        if (!v20 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[BCSNotificationIcon _notificationIconDataURLForApp:scale:].cold.5();
        }
        id v27 = 0;
        [v20 writeToURL:v10 options:1 error:&v27];
        id v21 = v27;
        if (v21 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = objc_msgSend(v21, "_bcs_privacyPreservingDescription");
          -[BCSNotificationIcon _notificationIconDataURLForApp:scale:].cold.4(v22, buf);
        }
        CGImageRelease(v19);
        if (v20) {
          v23 = v10;
        }
        else {
          v23 = 0;
        }
        id v14 = v23;

        goto LABEL_32;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[BCSNotificationIcon _notificationIconDataURLForApp:scale:]();
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      -[BCSNotificationIcon _notificationIconDataURLForApp:scale:]();
    }
    id v14 = 0;
LABEL_32:

    goto LABEL_33;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[BCSNotificationIcon _notificationIconDataURLForApp:scale:]();
  }
  id v14 = 0;
LABEL_33:

  return v14;
}

- (void).cxx_destruct
{
}

- (void)_notificationIconDataURLForApp:scale:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "BCSNotificationIcon: notification icon path is nil", v0, 2u);
}

- (void)_notificationIconDataURLForApp:scale:.cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "BCSNotificationIcon: icon data from LSApplicationProxy is nil", v0, 2u);
}

- (void)_notificationIconDataURLForApp:scale:.cold.3()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSNotificationIcon: Failed to create icon from cached bitmap", v0, 2u);
}

- (void)_notificationIconDataURLForApp:(void *)a1 scale:(uint8_t *)buf .cold.4(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSNotificationIcon: Failed to write PNG image data to disk with error %{public}@", buf, 0xCu);
}

- (void)_notificationIconDataURLForApp:scale:.cold.5()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_223007000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BCSNotificationIcon: Failed to get PNG image data", v0, 2u);
}

@end