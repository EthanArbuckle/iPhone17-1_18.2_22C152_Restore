@interface IMBalloonApp
+ (IMBalloonApp)appWithPluginBundle:(id)a3;
+ (IMBalloonApp)appWithPluginBundle:(id)a3 appBundle:(id)a4;
+ (IMBalloonApp)appWithPluginBundle:(id)a3 extension:(id)a4;
+ (IMBalloonApp)appWithPluginBundle:(id)a3 pluginKitProxy:(id)a4 extension:(id)a5;
+ (id)_unremovableDisabledApps;
+ (void)_setUnremovableDisabledApps:(id)a3;
- (BOOL)canSendDataPayloads;
- (BOOL)isBetaPlugin;
- (BOOL)isEnabledUnremovableApp;
- (BOOL)isLaunchProhibited;
- (BOOL)isPreDawnAndAppStoreStickerGenre;
- (BOOL)isStickerPackOnly;
- (BOOL)linkedBeforeSDKVersion:(id)a3;
- (BOOL)pluginLoaded;
- (BOOL)shouldBalloonHideAppIcon;
- (BOOL)shouldBreadcrumbHideAppIcon;
- (BOOL)shouldDelayViewControllerPresentation;
- (BOOL)shouldForceIntoSendMenu;
- (BOOL)shouldHideAppSwitcher;
- (BOOL)shouldHideAttributionInformation;
- (BOOL)showInBrowser;
- (BOOL)showInSendMenu;
- (BOOL)showableInBrowser;
- (Class)browserClass;
- (Class)bubbleClass;
- (Class)customTypingIndicatorLayerClass;
- (Class)dataSourceClass;
- (Class)entryClass;
- (IMBalloonApp)initWithPluginBundle:(id)a3 appBundle:(id)a4;
- (NSArray)appStoreSubgenres;
- (NSBundle)appBundle;
- (NSBundle)pluginBundle;
- (NSNumber)itemID;
- (NSString)appStoreGenre;
- (NSString)browserDisplayName;
- (NSString)browserShortDisplayName;
- (NSString)identifier;
- (NSString)version;
- (PKPlugIn)plugin;
- (double)presentationDelay;
- (unint64_t)presentationContexts;
- (unint64_t)presentationContextsForInfoPlistArray:(id)a3;
- (unint64_t)stickerSharingLevel;
- (void)_loadBundle;
- (void)setAppBundle:(id)a3;
- (void)setBrowserClass:(Class)a3;
- (void)setBrowserDisplayName:(id)a3;
- (void)setBrowserShortDisplayName:(id)a3;
- (void)setBubbleClass:(Class)a3;
- (void)setCanSendDataPayloads:(BOOL)a3;
- (void)setCustomTypingIndicatorLayerClass:(Class)a3;
- (void)setDataSourceClass:(Class)a3;
- (void)setEntryClass:(Class)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsEnabledUnremovableApp:(BOOL)a3;
- (void)setIsLaunchProhibited:(BOOL)a3;
- (void)setItemID:(id)a3;
- (void)setPlugin:(id)a3;
- (void)setPluginBundle:(id)a3;
- (void)setPluginLoaded:(BOOL)a3;
- (void)setPresentationContexts:(unint64_t)a3;
- (void)setShouldBalloonHideAppIcon:(BOOL)a3;
- (void)setShouldBreadcrumbHideAppIcon:(BOOL)a3;
- (void)setShouldHideAppSwitcher:(BOOL)a3;
- (void)setShouldHideAttributionInformation:(BOOL)a3;
- (void)setShowInBrowser:(BOOL)a3;
- (void)setShowInSendMenu:(BOOL)a3;
- (void)setStickerSharingLevel:(unint64_t)a3;
@end

@implementation IMBalloonApp

- (NSString)identifier
{
  return self->_identifier;
}

+ (IMBalloonApp)appWithPluginBundle:(id)a3 pluginKitProxy:(id)a4 extension:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [_IMBalloonExtensionApp alloc];
  v12 = objc_msgSend_initWithPluginBundle_pluginKitProxy_extension_(v10, v11, (uint64_t)v9, (uint64_t)v8, v7);

  return (IMBalloonApp *)v12;
}

- (NSBundle)appBundle
{
  return self->_appBundle;
}

- (void)setIdentifier:(id)a3
{
}

- (IMBalloonApp)initWithPluginBundle:(id)a3 appBundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)IMBalloonApp;
  id v9 = [(IMBalloonApp *)&v34 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pluginBundle, a3);
    objc_storeStrong((id *)&v10->_appBundle, a4);
    *(_WORD *)&v10->_showInSendMenu = 257;
    v10->_presentationContexts = 1;
    v14 = objc_msgSend_localizedInfoDictionary(v7, v11, v12, v13);
    v20 = objc_msgSend_objectForKeyedSubscript_(v14, v15, @"CFBundleDisplayName", v16);
    if (!v20)
    {
      v20 = objc_msgSend_objectForKeyedSubscript_(v14, v17, @"CKBrowserDisplayName", v19);
      if (!v20)
      {
        v21 = objc_msgSend_infoDictionary(v7, v17, v18, v19);
        v20 = objc_msgSend_objectForKeyedSubscript_(v21, v22, @"CKBrowserDisplayName", v23);
      }
    }
    if (objc_msgSend_length(v20, v17, v18, v19)) {
      objc_msgSend_setBrowserDisplayName_(v10, v24, (uint64_t)v20, v26);
    }
    v27 = objc_msgSend_bundleIdentifier(v7, v24, v25, v26);
    int isEqualToString = objc_msgSend_isEqualToString_(v27, v28, *MEMORY[0x1E4F6CBF8], v29);

    if (isEqualToString) {
      objc_msgSend_setShouldHideAppSwitcher_(v10, v31, 1, v32);
    }
  }
  return v10;
}

- (void)setBrowserDisplayName:(id)a3
{
}

- (void)setPresentationContexts:(unint64_t)a3
{
  self->_presentationContexts = a3;
}

- (unint64_t)presentationContextsForInfoPlistArray:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isStickerPackOnly(self, v5, v6, v7))
  {
    v11 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v8, v9, v10);
    int isStickersAppEnabled = objc_msgSend_isStickersAppEnabled(v11, v12, v13, v14);

    if (isStickersAppEnabled) {
      unint64_t v16 = 2;
    }
    else {
      unint64_t v16 = -1;
    }
  }
  else if ((v4 || objc_msgSend_isPreDawnAndAppStoreStickerGenre(self, v8, v9, v10)) {
         && (objc_msgSend_shouldForceIntoSendMenu(self, v8, v9, v10) & 1) == 0)
  }
  {
    if (objc_msgSend_containsObject_(v4, v17, @"MSMessagesAppPresentationContextMessages", v18))unint64_t v16 = objc_msgSend_isPreDawnAndAppStoreStickerGenre(self, v19, v20, v21) ^ 1; {
    else
    }
      unint64_t v16 = 0;
    if ((objc_msgSend_containsObject_(v4, v19, @"MSMessagesAppPresentationContextMedia", v21) & 1) != 0
      || objc_msgSend_isPreDawnAndAppStoreStickerGenre(self, v22, v23, v24))
    {
      v16 |= 2uLL;
    }
  }
  else
  {
    unint64_t v16 = 1;
  }

  return v16;
}

- (NSString)browserDisplayName
{
  return self->_browserDisplayName;
}

- (void)setShouldBalloonHideAppIcon:(BOOL)a3
{
  self->_shouldBalloonHideAppIcon = a3;
}

- (void)setShowInSendMenu:(BOOL)a3
{
  self->_showInSendMenu = a3;
}

- (void)setShowInBrowser:(BOOL)a3
{
  self->_showInBrowser = a3;
}

- (void)setCanSendDataPayloads:(BOOL)a3
{
  self->_canSendDataPayloads = a3;
}

- (void)setBrowserShortDisplayName:(id)a3
{
}

- (BOOL)isEnabledUnremovableApp
{
  v3 = objc_opt_class();
  uint64_t v7 = objc_msgSend__unremovableDisabledApps(v3, v4, v5, v6);
  v11 = objc_msgSend_identifier(self, v8, v9, v10);
  char v14 = objc_msgSend_containsObject_(v7, v12, (uint64_t)v11, v13) ^ 1;

  return v14;
}

+ (IMBalloonApp)appWithPluginBundle:(id)a3 appBundle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [_IMBalloonBundleApp alloc];
  uint64_t v9 = objc_msgSend_initWithPluginBundle_appBundle_(v7, v8, (uint64_t)v6, (uint64_t)v5);

  return (IMBalloonApp *)v9;
}

+ (id)_unremovableDisabledApps
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)qword_1EB3F2210;
  if (!qword_1EB3F2210)
  {
    id v4 = IMGetCachedDomainValueForKey();
    if (v4)
    {
      objc_storeStrong((id *)&qword_1EB3F2210, v4);
    }
    else
    {
      v8[0] = *MEMORY[0x1E4F6CC08];
      uint64_t v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v3, (uint64_t)v8, 1);
      id v6 = (void *)qword_1EB3F2210;
      qword_1EB3F2210 = v5;
    }
    v2 = (void *)qword_1EB3F2210;
  }

  return v2;
}

- (void)setShouldHideAppSwitcher:(BOOL)a3
{
  self->_shouldHideAppSwitcher = a3;
}

+ (IMBalloonApp)appWithPluginBundle:(id)a3
{
  id v3 = a3;
  id v4 = [IMBalloonApp alloc];
  id v6 = objc_msgSend_initWithPluginBundle_appBundle_(v4, v5, (uint64_t)v3, 0);

  return (IMBalloonApp *)v6;
}

- (void)setShouldHideAttributionInformation:(BOOL)a3
{
  self->_shouldHideAttributionInformation = a3;
}

+ (IMBalloonApp)appWithPluginBundle:(id)a3 extension:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [_IMBalloonExtensionApp alloc];
  uint64_t v9 = objc_msgSend_initWithPluginBundle_extension_(v7, v8, (uint64_t)v6, (uint64_t)v5);

  return (IMBalloonApp *)v9;
}

- (void)_loadBundle
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend_pluginLoaded(self, a2, v2, v3) & 1) == 0)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
    objc_msgSend_startTimingForKey_(v5, v6, @"loadPlugin", v7);
    v11 = objc_msgSend_pluginBundle(self, v8, v9, v10);
    uint64_t v15 = objc_msgSend_load(v11, v12, v13, v14);
    objc_msgSend_setPluginLoaded_(self, v16, v15, v17);

    uint64_t v21 = objc_msgSend_pluginBundle(self, v18, v19, v20);
    uint64_t v25 = objc_msgSend_principalClass(v21, v22, v23, v24);

    objc_msgSend_setBubbleClass_(self, v26, v25, v27);
    v31 = objc_msgSend_pluginBundle(self, v28, v29, v30);
    v35 = objc_msgSend_infoDictionary(v31, v32, v33, v34);

    objc_msgSend_objectForKey_(v35, v36, @"CKBrowserClass", v37);
    v38 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v38, v39, v40, v41))
    {
      Class v44 = NSClassFromString(v38);
      objc_msgSend_setBrowserClass_(self, v45, (uint64_t)v44, v46);
    }
    objc_msgSend_objectForKey_(v35, v42, @"CKDatasourceClass", v43);
    v47 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v47, v48, v49, v50))
    {
      Class v53 = NSClassFromString(v47);
      objc_msgSend_setDataSourceClass_(self, v54, (uint64_t)v53, v55);
    }
    objc_msgSend_objectForKey_(v35, v51, @"IMCustomTypingIndicatorClass", v52);
    v56 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v56, v57, v58, v59))
    {
      Class v62 = NSClassFromString(v56);
      objc_msgSend_setCustomTypingIndicatorLayerClass_(self, v63, (uint64_t)v62, v64);
    }
    objc_msgSend_objectForKey_(v35, v60, @"CKEntryClass", v61);
    v65 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v65, v66, v67, v68))
    {
      Class v71 = NSClassFromString(v65);
      objc_msgSend_setEntryClass_(self, v72, (uint64_t)v71, v73);
    }
    objc_msgSend_stopTimingForKey_(v5, v69, @"loadPlugin", v70);
    if (IMOSLoggingEnabled())
    {
      v74 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        v78 = objc_msgSend_pluginBundle(self, v75, v76, v77);
        v82 = objc_msgSend_bundleIdentifier(v78, v79, v80, v81);
        int v83 = 138412546;
        v84 = v82;
        __int16 v85 = 2112;
        id v86 = v5;
        _os_log_impl(&dword_1A4AF7000, v74, OS_LOG_TYPE_INFO, "Loaded %@, %@", (uint8_t *)&v83, 0x16u);
      }
    }
  }
}

- (Class)bubbleClass
{
  objc_msgSend__loadBundle(self, a2, v2, v3);
  Class bubbleClass = self->_bubbleClass;

  return bubbleClass;
}

- (Class)browserClass
{
  objc_msgSend__loadBundle(self, a2, v2, v3);
  Class browserClass = self->_browserClass;

  return browserClass;
}

- (Class)dataSourceClass
{
  objc_msgSend__loadBundle(self, a2, v2, v3);
  Class dataSourceClass = self->_dataSourceClass;

  return dataSourceClass;
}

- (Class)customTypingIndicatorLayerClass
{
  objc_msgSend__loadBundle(self, a2, v2, v3);
  Class customTypingIndicatorLayerClass = self->_customTypingIndicatorLayerClass;

  return customTypingIndicatorLayerClass;
}

- (Class)entryClass
{
  objc_msgSend__loadBundle(self, a2, v2, v3);
  Class entryClass = self->_entryClass;

  return entryClass;
}

- (void)setIsEnabledUnremovableApp:(BOOL)a3
{
  BOOL v4 = a3;
  id v5 = objc_msgSend_identifier(self, a2, a3, v3);
  if (v5)
  {
    id v25 = v5;
    id v6 = objc_opt_class();
    uint64_t v10 = objc_msgSend__unremovableDisabledApps(v6, v7, v8, v9);
    int v13 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v25, v12);
    if (v4)
    {
      if (v13)
      {
        uint64_t v17 = objc_msgSend_mutableCopy(v10, v14, v15, v16);
        objc_msgSend_removeObject_(v17, v18, (uint64_t)v25, v19);
LABEL_7:
        v22 = objc_opt_class();
        objc_msgSend__setUnremovableDisabledApps_(v22, v23, (uint64_t)v17, v24);
      }
    }
    else if ((v13 & 1) == 0)
    {
      uint64_t v17 = objc_msgSend_mutableCopy(v10, v14, v15, v16);
      objc_msgSend_addObject_(v17, v20, (uint64_t)v25, v21);
      goto LABEL_7;
    }

    id v5 = v25;
  }
}

+ (void)_setUnremovableDisabledApps:(id)a3
{
  objc_storeStrong((id *)&qword_1EB3F2210, a3);
  id v4 = a3;
  IMSetDomainValueForKey();
}

- (BOOL)showableInBrowser
{
  return ((uint64_t (*)(IMBalloonApp *, char *))MEMORY[0x1F4181798])(self, sel_showInBrowser);
}

- (BOOL)linkedBeforeSDKVersion:(id)a3
{
  return 0;
}

- (void)setBrowserClass:(Class)a3
{
}

- (void)setDataSourceClass:(Class)a3
{
}

- (void)setCustomTypingIndicatorLayerClass:(Class)a3
{
}

- (void)setBubbleClass:(Class)a3
{
}

- (void)setEntryClass:(Class)a3
{
}

- (BOOL)isBetaPlugin
{
  return self->_isBetaPlugin;
}

- (BOOL)isLaunchProhibited
{
  return self->_isLaunchProhibited;
}

- (void)setIsLaunchProhibited:(BOOL)a3
{
  self->_isLaunchProhibited = a3;
}

- (BOOL)isStickerPackOnly
{
  return self->_isStickerPackOnly;
}

- (BOOL)shouldForceIntoSendMenu
{
  return self->_shouldForceIntoSendMenu;
}

- (BOOL)shouldDelayViewControllerPresentation
{
  return self->_shouldDelayViewControllerPresentation;
}

- (double)presentationDelay
{
  return self->_presentationDelay;
}

- (BOOL)isPreDawnAndAppStoreStickerGenre
{
  return self->_isPreDawnAndAppStoreStickerGenre;
}

- (NSString)appStoreGenre
{
  return self->_appStoreGenre;
}

- (NSArray)appStoreSubgenres
{
  return self->_appStoreSubgenres;
}

- (BOOL)showInSendMenu
{
  return self->_showInSendMenu;
}

- (BOOL)showInBrowser
{
  return self->_showInBrowser;
}

- (BOOL)shouldBalloonHideAppIcon
{
  return self->_shouldBalloonHideAppIcon;
}

- (BOOL)shouldBreadcrumbHideAppIcon
{
  return self->_shouldBreadcrumbHideAppIcon;
}

- (void)setShouldBreadcrumbHideAppIcon:(BOOL)a3
{
  self->_shouldBreadcrumbHideAppIcon = a3;
}

- (BOOL)shouldHideAppSwitcher
{
  return self->_shouldHideAppSwitcher;
}

- (BOOL)shouldHideAttributionInformation
{
  return self->_shouldHideAttributionInformation;
}

- (BOOL)canSendDataPayloads
{
  return self->_canSendDataPayloads;
}

- (void)setAppBundle:(id)a3
{
}

- (NSBundle)pluginBundle
{
  return self->_pluginBundle;
}

- (void)setPluginBundle:(id)a3
{
}

- (NSNumber)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (NSString)browserShortDisplayName
{
  return self->_browserShortDisplayName;
}

- (NSString)version
{
  return self->_version;
}

- (PKPlugIn)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
}

- (unint64_t)presentationContexts
{
  return self->_presentationContexts;
}

- (unint64_t)stickerSharingLevel
{
  return self->_stickerSharingLevel;
}

- (void)setStickerSharingLevel:(unint64_t)a3
{
  self->_stickerSharingLevel = a3;
}

- (BOOL)pluginLoaded
{
  return self->_pluginLoaded;
}

- (void)setPluginLoaded:(BOOL)a3
{
  self->_pluginLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_browserShortDisplayName, 0);
  objc_storeStrong((id *)&self->_browserDisplayName, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_pluginBundle, 0);
  objc_storeStrong((id *)&self->_appBundle, 0);
  objc_storeStrong((id *)&self->_appStoreSubgenres, 0);
  objc_storeStrong((id *)&self->_appStoreGenre, 0);
  objc_storeStrong((id *)&self->_entryClass, 0);
  objc_storeStrong((id *)&self->_bubbleClass, 0);
  objc_storeStrong((id *)&self->_customTypingIndicatorLayerClass, 0);
  objc_storeStrong((id *)&self->_dataSourceClass, 0);

  objc_storeStrong((id *)&self->_browserClass, 0);
}

@end