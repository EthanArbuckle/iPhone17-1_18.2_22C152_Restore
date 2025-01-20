@interface IMBalloonPlugin
- (BOOL)allowsPresentationWithSendLater;
- (BOOL)hideAttributionInformation;
- (BOOL)isBetaPlugin;
- (BOOL)isEnabled;
- (BOOL)isLaunchProhibited;
- (BOOL)isStickerPackOnly;
- (BOOL)linkedBeforeSDKVersion:(id)a3;
- (BOOL)pluginLoaded;
- (BOOL)shouldBalloonHideAppIcon;
- (BOOL)shouldBreadcrumbHideAppIcon;
- (BOOL)shouldDelayViewControllerPresentation;
- (BOOL)shouldHideAppSwitcher;
- (BOOL)shouldShowForRecipients:(id)a3;
- (BOOL)showInBrowser;
- (BOOL)showInSendMenu;
- (BOOL)showableInBrowser;
- (BOOL)supportsControllerReuse;
- (Class)browserClass;
- (Class)bubbleClass;
- (Class)customTypingIndicatorLayerClass;
- (Class)dataSourceClass;
- (Class)entryClass;
- (IMBalloonApp)app;
- (IMBalloonPlugin)init;
- (IMBalloonPlugin)initWithBundle:(id)a3;
- (IMBalloonPlugin)initWithBundle:(id)a3 app:(id)a4;
- (NSArray)appStoreSubgenres;
- (NSBundle)appBundle;
- (NSBundle)bundle;
- (NSBundle)pluginBundle;
- (NSMutableArray)balloonControllerPool;
- (NSMutableDictionary)messageToBalloonControllerMap;
- (NSMutableDictionary)messageToDatasourceMap;
- (NSString)appIdentifier;
- (NSString)appStoreGenre;
- (NSString)browserDisplayName;
- (NSString)browserImageName;
- (NSString)browserImagePath;
- (NSString)browserShortDisplayName;
- (NSString)extensionBundleIdentifier;
- (NSString)extensionIdentifier;
- (NSString)identifier;
- (NSString)version;
- (PKPlugIn)plugin;
- (double)presentationDelay;
- (id)_getControllerFromReusePoolForChatItem:(id)a3 contextIdentifier:(id)a4;
- (id)adamID;
- (id)attributionInfo;
- (id)balloonControllerForChatItem:(id)a3 contextIdentifier:(id)a4;
- (id)balloonControllerKeyForMessageGUID:(id)a3 contextIdentifier:(id)a4;
- (id)dataSourceForPluginPayload:(id)a3;
- (id)existingBalloonControllerWithMessageGUID:(id)a3 contextIdentifier:(id)a4;
- (id)existingDataSourceForMessageGUID:(id)a3;
- (int64_t)browserGroup;
- (unint64_t)presentationContexts;
- (unint64_t)stickerSharingLevel;
- (void)dealloc;
- (void)insertDataSource:(id)a3 forGUID:(id)a4;
- (void)moveController:(id)a3 toReusePoolFromChatItem:(id)a4 contextIdentifier:(id)a5;
- (void)removeController:(id)a3 forChatItem:(id)a4 contextIdentifier:(id)a5;
- (void)setApp:(id)a3;
- (void)setBalloonControllerPool:(id)a3;
- (void)setBrowserClass:(Class)a3;
- (void)setBrowserGroup:(int64_t)a3;
- (void)setBrowserImageName:(id)a3;
- (void)setBrowserImagePath:(id)a3;
- (void)setBubbleClass:(Class)a3;
- (void)setBundle:(id)a3;
- (void)setCustomTypingIndicatorLayerClass:(Class)a3;
- (void)setDataSourceClass:(Class)a3;
- (void)setEntryClass:(Class)a3;
- (void)setIdentifier:(id)a3;
- (void)setMessageToBalloonControllerMap:(id)a3;
- (void)setMessageToDatasourceMap:(id)a3;
- (void)setPlugin:(id)a3;
- (void)setPluginLoaded:(BOOL)a3;
- (void)unloadBundle;
@end

@implementation IMBalloonPlugin

- (NSMutableDictionary)messageToDatasourceMap
{
  return self->_messageToDatasourceMap;
}

- (NSString)identifier
{
  return (NSString *)objc_msgSend_identifier(self->_app, a2, v2, v3);
}

- (NSBundle)appBundle
{
  return (NSBundle *)objc_msgSend_appBundle(self->_app, a2, v2, v3);
}

- (IMBalloonPlugin)initWithBundle:(id)a3 app:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v51.receiver = self;
  v51.super_class = (Class)IMBalloonPlugin;
  v8 = [(IMBalloonPlugin *)&v51 init];
  v11 = v8;
  if (v8)
  {
    objc_msgSend_setPluginLoaded_(v8, v9, 0, v10);
    objc_storeStrong((id *)&v11->_app, a4);
    objc_msgSend_setBundle_(v11, v12, (uint64_t)v6, v13);
    v17 = objc_msgSend_infoDictionary(v6, v14, v15, v16);
    v20 = objc_msgSend_objectForKey_(v17, v18, @"CKBrowserGroup", v19);
    uint64_t v24 = objc_msgSend_integerValue(v20, v21, v22, v23);

    objc_msgSend_setBrowserGroup_(v11, v25, v24, v26);
    v29 = objc_msgSend_objectForKey_(v17, v27, @"CKBrowserShowInBrowser", v28);
    v33 = v29;
    if (v29 && (objc_msgSend_BOOLValue(v29, v30, v31, v32) & 1) == 0)
    {
      objc_msgSend_setShowInBrowser_(v7, v30, 0, v32);
      objc_msgSend_setShowInSendMenu_(v7, v34, 0, v35);
    }
    v36 = objc_msgSend_objectForKey_(v17, v30, @"CKBrowserDisplayImageName", v32);
    if (objc_msgSend_length(v36, v37, v38, v39)) {
      objc_msgSend_setBrowserImageName_(v11, v40, (uint64_t)v36, v41);
    }
    v42 = objc_msgSend_objectForKey_(v17, v40, @"kCKBrowserDisplayImagePath", v41);
    if (objc_msgSend_length(v42, v43, v44, v45)) {
      objc_msgSend_setBrowserImagePath_(v11, v46, (uint64_t)v42, v47);
    }
    if (!v11->_messageToBalloonControllerMap)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      messageToBalloonControllerMap = v11->_messageToBalloonControllerMap;
      v11->_messageToBalloonControllerMap = (NSMutableDictionary *)Mutable;
    }
  }

  return v11;
}

- (void)setPluginLoaded:(BOOL)a3
{
  self->_pluginLoaded = a3;
}

- (void)setBundle:(id)a3
{
}

- (void)setBrowserGroup:(int64_t)a3
{
  self->_browserGroup = a3;
}

- (BOOL)isStickerPackOnly
{
  return objc_msgSend_isStickerPackOnly(self->_app, a2, v2, v3);
}

- (BOOL)isEnabled
{
  return objc_msgSend_isEnabled(self->_app, a2, v2, v3);
}

- (void)setBrowserImageName:(id)a3
{
}

- (NSString)browserImagePath
{
  return self->_browserImagePath;
}

- (NSString)browserImageName
{
  return self->_browserImageName;
}

- (IMBalloonPlugin)initWithBundle:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_appWithPluginBundle_(IMBalloonApp, v5, (uint64_t)v4, v6);
  v12 = (IMBalloonPlugin *)objc_msgSend_initWithBundle_app_(self, v8, (uint64_t)v4, (uint64_t)v7);
  if (v12)
  {
    uint64_t v13 = objc_msgSend_bundleIdentifier(v4, v9, v10, v11);
    objc_msgSend_setIdentifier_(v7, v14, (uint64_t)v13, v15);
  }
  return v12;
}

- (IMBalloonPlugin)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, @"Unsupported init", @"[IMBalloonPlugin init] is not supported", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend_removeObserver_(v5, v6, (uint64_t)self, v7);

  objc_msgSend_unloadBundle(self, v8, v9, v10);
  v11.receiver = self;
  v11.super_class = (Class)IMBalloonPlugin;
  [(IMBalloonPlugin *)&v11 dealloc];
}

- (void)unloadBundle
{
  objc_msgSend_setPluginLoaded_(self, a2, 0, v2);
  objc_msgSend_setBubbleClass_(self, v4, 0, v5);
  objc_msgSend_setBrowserClass_(self, v6, 0, v7);
  objc_msgSend_setDataSourceClass_(self, v8, 0, v9);
  objc_msgSend_setCustomTypingIndicatorLayerClass_(self, v10, 0, v11);
  objc_msgSend_setEntryClass_(self, v12, 0, v13);
  balloonControllerPool = self->_balloonControllerPool;
  self->_balloonControllerPool = 0;
}

- (id)_getControllerFromReusePoolForChatItem:(id)a3 contextIdentifier:(id)a4
{
  id v6 = a3;
  id v10 = a4;
  balloonControllerPool = self->_balloonControllerPool;
  if (!balloonControllerPool)
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v13 = self->_balloonControllerPool;
    self->_balloonControllerPool = v12;

    balloonControllerPool = self->_balloonControllerPool;
  }
  if (objc_msgSend_count(balloonControllerPool, v7, v8, v9))
  {
    v17 = objc_msgSend_lastObject(self->_balloonControllerPool, v14, v15, v16);
    v21 = objc_msgSend_dataSource(v6, v18, v19, v20);
    if (objc_msgSend_conformsToProtocol_(v17, v22, (uint64_t)&unk_1EF9685E0, v23)) {
      objc_msgSend_setDataSource_(v17, v24, (uint64_t)v21, v26);
    }
    v27 = objc_msgSend_messageGUID(v21, v24, v25, v26);
    v29 = objc_msgSend_balloonControllerKeyForMessageGUID_contextIdentifier_(self, v28, (uint64_t)v27, (uint64_t)v10);

    objc_msgSend_setObject_forKey_(self->_messageToBalloonControllerMap, v30, (uint64_t)v17, (uint64_t)v29);
    objc_msgSend_removeLastObject(self->_balloonControllerPool, v31, v32, v33);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)balloonControllerKeyForMessageGUID:(id)a3 contextIdentifier:(id)a4
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%@, %@", (uint64_t)a4, a3, a4);
}

- (id)existingBalloonControllerWithMessageGUID:(id)a3 contextIdentifier:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = objc_msgSend_balloonControllerKeyForMessageGUID_contextIdentifier_(self, v7, (uint64_t)v6, (uint64_t)v8);
    v12 = objc_msgSend_objectForKeyedSubscript_(self->_messageToBalloonControllerMap, v10, (uint64_t)v9, v11);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Context identifier is nil, can't load balloonController from cache", v15, 2u);
      }
    }
    v12 = 0;
  }

  return v12;
}

- (id)balloonControllerForChatItem:(id)a3 contextIdentifier:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v10 = a4;
  if (v10)
  {
    uint64_t v11 = objc_msgSend_dataSource(v6, v7, v8, v9);
    uint64_t v15 = objc_msgSend_messageGUID(v11, v12, v13, v14);
    uint64_t v19 = objc_msgSend_length(v15, v16, v17, v18);

    if (v19)
    {
      uint64_t v23 = objc_msgSend_messageGUID(v11, v20, v21, v22);
      uint64_t v25 = objc_msgSend_existingBalloonControllerWithMessageGUID_contextIdentifier_(self, v24, (uint64_t)v23, (uint64_t)v10);

      if (v25) {
        goto LABEL_19;
      }
      if (objc_msgSend_supportsControllerReuse(self, v26, v27, v28))
      {
        uint64_t v25 = objc_msgSend__getControllerFromReusePoolForChatItem_contextIdentifier_(self, v29, (uint64_t)v6, (uint64_t)v10);
        if (v25) {
          goto LABEL_19;
        }
      }
      uint64_t v32 = objc_msgSend_bubbleClass(self, v29, v30, v31);
      if (objc_msgSend_conformsToProtocol_(v32, v33, (uint64_t)&unk_1EF95E7B0, v34))
      {
        id v38 = objc_alloc((Class)objc_msgSend_bubbleClass(self, v35, v36, v37));
        uint64_t v42 = objc_msgSend_isFromMe(v6, v39, v40, v41);
        uint64_t v25 = objc_msgSend_initWithDataSource_isFromMe_(v38, v43, (uint64_t)v11, v42);
        if (v25)
        {
          uint64_t v47 = objc_msgSend_messageGUID(v11, v44, v45, v46);
          v49 = objc_msgSend_balloonControllerKeyForMessageGUID_contextIdentifier_(self, v48, (uint64_t)v47, (uint64_t)v10);

          objc_msgSend_setObject_forKey_(self->_messageToBalloonControllerMap, v50, (uint64_t)v25, (uint64_t)v49);
        }
        goto LABEL_19;
      }
      if (IMOSLoggingEnabled())
      {
        v52 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_messageGUID(v11, v58, v59, v60);
          id v61 = (id)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend_guid(v6, v62, v63, v64);
          int v66 = 138412802;
          id v67 = v61;
          __int16 v68 = 2048;
          v69 = v11;
          __int16 v70 = 2112;
          v71 = v65;
          _os_log_impl(&dword_1A4AF7000, v52, OS_LOG_TYPE_INFO, "IMBalloonPluginManager - bubbleClass does not conform to IMBalloonPluginController protocol; message guid: %"
            "@, dataSource: %p, chat item guid: %@",
            (uint8_t *)&v66,
            0x20u);
        }
LABEL_17:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v52 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        v56 = objc_msgSend_guid(v6, v53, v54, v55);
        int v66 = 134218242;
        id v67 = v11;
        __int16 v68 = 2112;
        v69 = v56;
        _os_log_impl(&dword_1A4AF7000, v52, OS_LOG_TYPE_INFO, "balloonControllerForChatItem dataSource: %p, chat item guid: %@", (uint8_t *)&v66, 0x16u);
      }
      goto LABEL_17;
    }
    uint64_t v25 = 0;
LABEL_19:

    goto LABEL_20;
  }
  if (IMOSLoggingEnabled())
  {
    objc_super v51 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      LOWORD(v66) = 0;
      _os_log_impl(&dword_1A4AF7000, v51, OS_LOG_TYPE_INFO, "Context identifier is nil!", (uint8_t *)&v66, 2u);
    }
  }
  uint64_t v25 = 0;
LABEL_20:

  return v25;
}

- (void)moveController:(id)a3 toReusePoolFromChatItem:(id)a4 contextIdentifier:(id)a5
{
  id v29 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_setDataSource_(v29, v10, 0, v11);
  if (v29)
  {
    balloonControllerPool = self->_balloonControllerPool;
    if (!balloonControllerPool)
    {
      uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v16 = self->_balloonControllerPool;
      self->_balloonControllerPool = v15;

      balloonControllerPool = self->_balloonControllerPool;
    }
    objc_msgSend_addObject_(balloonControllerPool, v12, (uint64_t)v29, v13);
    uint64_t v20 = objc_msgSend_dataSource(v8, v17, v18, v19);
    uint64_t v24 = objc_msgSend_messageGUID(v20, v21, v22, v23);
    uint64_t v26 = objc_msgSend_balloonControllerKeyForMessageGUID_contextIdentifier_(self, v25, (uint64_t)v24, (uint64_t)v9);

    objc_msgSend_removeObjectForKey_(self->_messageToBalloonControllerMap, v27, (uint64_t)v26, v28);
  }
}

- (void)removeController:(id)a3 forChatItem:(id)a4 contextIdentifier:(id)a5
{
  id v8 = a4;
  if (a3)
  {
    id v36 = v8;
    id v9 = a5;
    uint64_t v13 = objc_msgSend_dataSource(v36, v10, v11, v12);
    uint64_t v17 = objc_msgSend_messageGUID(v13, v14, v15, v16);
    uint64_t v19 = objc_msgSend_balloonControllerKeyForMessageGUID_contextIdentifier_(self, v18, (uint64_t)v17, (uint64_t)v9);

    objc_msgSend_removeObjectForKey_(self->_messageToBalloonControllerMap, v20, (uint64_t)v19, v21);
    if (objc_msgSend__canRemoveControllerFromCachedDatasource(self, v22, v23, v24))
    {
      messageToDatasourceMap = self->_messageToDatasourceMap;
      id v29 = objc_msgSend_dataSource(v36, v25, v26, v27);
      uint64_t v33 = objc_msgSend_messageGUID(v29, v30, v31, v32);
      objc_msgSend_removeObjectForKey_(messageToDatasourceMap, v34, (uint64_t)v33, v35);
    }
    id v8 = v36;
  }
}

- (BOOL)supportsControllerReuse
{
  id v4 = objc_msgSend_bubbleClass(self, a2, v2, v3);

  return objc_msgSend_conformsToProtocol_(v4, v5, (uint64_t)&unk_1EF9685E0, v6);
}

- (BOOL)shouldShowForRecipients:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!objc_msgSend_count(v4, v5, v6, v7)) {
    goto LABEL_5;
  }
  uint64_t v11 = objc_msgSend_identifier(self, v8, v9, v10);
  int isEqualToString = objc_msgSend_isEqualToString_(v11, v12, *MEMORY[0x1E4F6CAE8], v13);

  if (!isEqualToString) {
    goto LABEL_5;
  }
  if (objc_msgSend_count(v4, v15, v16, v17) != 1
    || (objc_msgSend_objectAtIndexedSubscript_(v4, v18, 0, v19),
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        char v21 = MEMORY[0x1A6263990](),
        v20,
        (v21 & 1) == 0))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        int v25 = 138412290;
        id v26 = v4;
        _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "Attempt to display the business extension in a non-business context, recipients: %@", (uint8_t *)&v25, 0xCu);
      }
    }
    BOOL v22 = 0;
  }
  else
  {
LABEL_5:
    BOOL v22 = 1;
  }

  return v22;
}

- (BOOL)linkedBeforeSDKVersion:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_app(self, v5, v6, v7);
  char v11 = objc_msgSend_linkedBeforeSDKVersion_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (id)existingDataSourceForMessageGUID:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_messageToDatasourceMap(self, v5, v6, v7);
  char v11 = objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (void)insertDataSource:(id)a3 forGUID:(id)a4
{
  id v14 = a3;
  id v9 = a4;
  if (v14 && v9)
  {
    if (!self->_messageToDatasourceMap)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      messageToDatasourceMap = self->_messageToDatasourceMap;
      self->_messageToDatasourceMap = Mutable;
    }
    uint64_t v12 = objc_msgSend_messageToDatasourceMap(self, v6, v7, v8);
    objc_msgSend_setObject_forKey_(v12, v13, (uint64_t)v14, (uint64_t)v9);
  }
}

- (id)dataSourceForPluginPayload:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_pluginSessionGUID(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_messageToDatasourceMap(self, v9, v10, v11);
  uint64_t v15 = objc_msgSend_objectForKey_(v12, v13, (uint64_t)v8, v14);

  if (!v15)
  {
    if (!self->_messageToDatasourceMap)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      messageToDatasourceMap = self->_messageToDatasourceMap;
      self->_messageToDatasourceMap = Mutable;
    }
    if (IMOSLoggingEnabled())
    {
      BOOL v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v39 = 138412290;
        uint64_t v40 = v8;
        _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "We did not find a datasource for messageGUID: %@", (uint8_t *)&v39, 0xCu);
      }
    }
    uint64_t v23 = objc_msgSend_sharedInstance(IMBalloonPluginManager, v19, v20, v21);
    uint64_t v27 = objc_msgSend_identifier(self, v24, v25, v26);
    uint64_t v30 = (objc_class *)objc_msgSend_dataSourceClassForBundleID_(v23, v28, (uint64_t)v27, v29);

    if (v30)
    {
      id v31 = [v30 alloc];
      uint64_t v15 = objc_msgSend_initWithPluginPayload_(v31, v32, (uint64_t)v4, v33);
      if (v8)
      {
        uint64_t v37 = objc_msgSend_messageToDatasourceMap(self, v34, v35, v36);
        objc_msgSend_setObject_forKey_(v37, v38, (uint64_t)v15, (uint64_t)v8);
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
  }

  return v15;
}

- (NSString)extensionIdentifier
{
  extensionIdentifier = self->_extensionIdentifier;
  if (!extensionIdentifier)
  {
    uint64_t v6 = objc_msgSend_identifier(self, a2, v2, v3);
    if (objc_msgSend_hasPrefix_(v6, v7, *MEMORY[0x1E4F6CBE8], v8))
    {
      id v9 = v6;
    }
    else
    {
      IMBalloonExtensionIDWithSuffix();
      id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v10 = self->_extensionIdentifier;
    self->_extensionIdentifier = v9;

    extensionIdentifier = self->_extensionIdentifier;
  }

  return extensionIdentifier;
}

- (NSString)extensionBundleIdentifier
{
  id v4 = objc_msgSend_plugin(self->_app, a2, v2, v3);
  uint64_t v8 = objc_msgSend_identifier(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (NSString)version
{
  return (NSString *)@"IMBalloonPluginVersionUndefined";
}

- (BOOL)isBetaPlugin
{
  return 0;
}

- (BOOL)shouldDelayViewControllerPresentation
{
  return ((uint64_t (*)(IMBalloonApp *, char *))MEMORY[0x1F4181798])(self->_app, sel_shouldDelayViewControllerPresentation);
}

- (double)presentationDelay
{
  ((void (*)(IMBalloonApp *, char *))MEMORY[0x1F4181798])(self->_app, sel_presentationDelay);
  return result;
}

- (BOOL)showInSendMenu
{
  return ((uint64_t (*)(IMBalloonApp *, char *))MEMORY[0x1F4181798])(self->_app, sel_showInSendMenu);
}

- (BOOL)showInBrowser
{
  return ((uint64_t (*)(IMBalloonApp *, char *))MEMORY[0x1F4181798])(self->_app, sel_showInBrowser);
}

- (BOOL)showableInBrowser
{
  return ((uint64_t (*)(IMBalloonApp *, char *))MEMORY[0x1F4181798])(self->_app, sel_showableInBrowser);
}

- (BOOL)allowsPresentationWithSendLater
{
  id v4 = objc_msgSend_identifier(self, a2, v2, v3);
  uint64_t v5 = IMBalloonExtensionIDWithSuffix();
  char isEqualToString = objc_msgSend_isEqualToString_(v4, v6, (uint64_t)v5, v7);

  return isEqualToString ^ 1;
}

- (BOOL)shouldHideAppSwitcher
{
  return ((uint64_t (*)(IMBalloonApp *, char *))MEMORY[0x1F4181798])(self->_app, sel_shouldHideAppSwitcher);
}

- (BOOL)shouldBalloonHideAppIcon
{
  return objc_msgSend_shouldBalloonHideAppIcon(self->_app, a2, v2, v3);
}

- (BOOL)shouldBreadcrumbHideAppIcon
{
  return objc_msgSend_shouldBreadcrumbHideAppIcon(self->_app, a2, v2, v3);
}

- (NSString)appStoreGenre
{
  return (NSString *)objc_msgSend_appStoreGenre(self->_app, a2, v2, v3);
}

- (NSArray)appStoreSubgenres
{
  return (NSArray *)objc_msgSend_appStoreSubgenres(self->_app, a2, v2, v3);
}

- (BOOL)hideAttributionInformation
{
  return ((uint64_t (*)(IMBalloonApp *, char *))MEMORY[0x1F4181798])(self->_app, sel_shouldHideAttributionInformation);
}

- (Class)browserClass
{
  return (Class)((uint64_t (*)(IMBalloonApp *, char *))MEMORY[0x1F4181798])(self->_app, sel_browserClass);
}

- (NSString)browserDisplayName
{
  return (NSString *)objc_msgSend_browserDisplayName(self->_app, a2, v2, v3);
}

- (NSString)browserShortDisplayName
{
  return (NSString *)((uint64_t (*)(IMBalloonApp *, char *))MEMORY[0x1F4181798])(self->_app, sel_browserShortDisplayName);
}

- (Class)customTypingIndicatorLayerClass
{
  return (Class)((uint64_t (*)(IMBalloonApp *, char *))MEMORY[0x1F4181798])(self->_app, sel_customTypingIndicatorLayerClass);
}

- (Class)bubbleClass
{
  return (Class)objc_msgSend_bubbleClass(self->_app, a2, v2, v3);
}

- (Class)entryClass
{
  return (Class)((uint64_t (*)(IMBalloonApp *, char *))MEMORY[0x1F4181798])(self->_app, sel_entryClass);
}

- (NSBundle)pluginBundle
{
  return (NSBundle *)objc_msgSend_pluginBundle(self->_app, a2, v2, v3);
}

- (Class)dataSourceClass
{
  return (Class)objc_msgSend_dataSourceClass(self->_app, a2, v2, v3);
}

- (void)setIdentifier:(id)a3
{
  objc_msgSend_setIdentifier_(self->_app, a2, (uint64_t)a3, v3);
}

- (BOOL)pluginLoaded
{
  return objc_msgSend_pluginLoaded(self->_app, a2, v2, v3);
}

- (unint64_t)presentationContexts
{
  return ((uint64_t (*)(IMBalloonApp *, char *))MEMORY[0x1F4181798])(self->_app, sel_presentationContexts);
}

- (unint64_t)stickerSharingLevel
{
  return ((uint64_t (*)(IMBalloonApp *, char *))MEMORY[0x1F4181798])(self->_app, sel_stickerSharingLevel);
}

- (id)adamID
{
  return 0;
}

- (id)attributionInfo
{
  if (objc_msgSend_hideAttributionInformation(self, a2, v2, v3))
  {
    uint64_t v8 = 0;
  }
  else
  {
    objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v5, v6, v7);
    id v9 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = objc_msgSend_identifier(self, v10, v11, v12);
    if (v13) {
      CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E4F6D3E0], v13);
    }

    uint64_t v17 = objc_msgSend_browserDisplayName(self, v14, v15, v16);
    if (v17) {
      CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E4F6D3D0], v17);
    }

    uint64_t v21 = objc_msgSend_adamID(self, v18, v19, v20);
    if (v21) {
      CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E4F6D3C8], v21);
    }

    if (objc_msgSend_count(v9, v22, v23, v24)) {
      uint64_t v25 = v9;
    }
    else {
      uint64_t v25 = 0;
    }
    uint64_t v8 = v25;
  }

  return v8;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setBubbleClass:(Class)a3
{
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

- (void)setEntryClass:(Class)a3
{
}

- (void)setBrowserImagePath:(id)a3
{
}

- (int64_t)browserGroup
{
  return self->_browserGroup;
}

- (BOOL)isLaunchProhibited
{
  return self->_isLaunchProhibited;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (PKPlugIn)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
}

- (IMBalloonApp)app
{
  return self->_app;
}

- (void)setApp:(id)a3
{
}

- (void)setMessageToDatasourceMap:(id)a3
{
}

- (NSMutableDictionary)messageToBalloonControllerMap
{
  return self->_messageToBalloonControllerMap;
}

- (void)setMessageToBalloonControllerMap:(id)a3
{
}

- (NSMutableArray)balloonControllerPool
{
  return self->_balloonControllerPool;
}

- (void)setBalloonControllerPool:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balloonControllerPool, 0);
  objc_storeStrong((id *)&self->_messageToBalloonControllerMap, 0);
  objc_storeStrong((id *)&self->_messageToDatasourceMap, 0);
  objc_storeStrong((id *)&self->_app, 0);
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_browserImagePath, 0);
  objc_storeStrong((id *)&self->_browserImageName, 0);
  objc_storeStrong((id *)&self->_entryClass, 0);
  objc_storeStrong((id *)&self->_customTypingIndicatorLayerClass, 0);
  objc_storeStrong((id *)&self->_dataSourceClass, 0);
  objc_storeStrong((id *)&self->_browserClass, 0);
  objc_storeStrong((id *)&self->_bubbleClass, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);

  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
}

@end