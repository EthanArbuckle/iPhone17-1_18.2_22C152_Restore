@interface _IMBalloonBundleApp
- (BOOL)isPreDawnAndAppStoreStickerGenre;
- (BOOL)isStickerPackOnly;
- (BOOL)shouldDelayViewControllerPresentation;
- (BOOL)shouldForceIntoSendMenu;
- (Class)browserClass;
- (Class)bubbleClass;
- (Class)dataSourceClass;
- (_IMBalloonBundleApp)initWithPluginBundle:(id)a3 appBundle:(id)a4;
- (double)presentationDelay;
- (void)_loadAppBundle;
- (void)_loadBundle;
- (void)setBrowserClass:(Class)a3;
- (void)setBubbleClass:(Class)a3;
- (void)setDataSourceClass:(Class)a3;
@end

@implementation _IMBalloonBundleApp

- (_IMBalloonBundleApp)initWithPluginBundle:(id)a3 appBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v128.receiver = self;
  v128.super_class = (Class)_IMBalloonBundleApp;
  v8 = [(IMBalloonApp *)&v128 initWithPluginBundle:v6 appBundle:v7];
  v12 = v8;
  if (v8)
  {
    v13 = objc_msgSend_appBundle(v8, v9, v10, v11);
    v17 = objc_msgSend_bundleIdentifier(v13, v14, v15, v16);

    v21 = objc_msgSend_bundleIdentifier(v6, v18, v19, v20);
    uint64_t v24 = objc_msgSend_stringByAppendingFormat_(v21, v22, @":%@:%@", v23, @"0000000000", v17);

    objc_msgSend_setIdentifier_(v12, v25, v24, v26);
    objc_msgSend_setCanSendDataPayloads_(v12, v27, 1, v28);
    objc_msgSend_setShowInBrowser_(v12, v29, 1, v30);
    objc_msgSend_setShowInSendMenu_(v12, v31, 1, v32);
    v36 = objc_msgSend_infoDictionary(v7, v33, v34, v35);
    v40 = objc_msgSend_localizedInfoDictionary(v7, v37, v38, v39);
    v45 = objc_msgSend_objectForKeyedSubscript_(v40, v41, @"CFBundleDisplayName", v42);
    if (!v45)
    {
      v45 = objc_msgSend_objectForKeyedSubscript_(v40, v43, @"CKBrowserDisplayName", v44);
      if (!v45)
      {
        v46 = objc_msgSend_objectForKeyedSubscript_(v36, v43, @"CKBrowserDisplayName", v44);
        v49 = v46;
        if (v46)
        {
          id v50 = v46;
        }
        else
        {
          objc_msgSend_objectForKeyedSubscript_(v36, v47, @"CFBundleName", v48);
          id v50 = (id)objc_claimAutoreleasedReturnValue();
        }
        v45 = v50;
      }
    }
    objc_msgSend_setBrowserDisplayName_(v12, v43, (uint64_t)v45, v44);
    v53 = objc_msgSend_objectForKeyedSubscript_(v40, v51, @"CKBrowserShortDisplayName", v52);
    v56 = v53;
    v126 = v40;
    v127 = (void *)v24;
    if (v53)
    {
      id v57 = v53;
    }
    else
    {
      uint64_t v58 = objc_msgSend_objectForKeyedSubscript_(v36, v54, @"CKBrowserShortDisplayName", v55);
      v59 = (void *)v58;
      if (v58) {
        v60 = (void *)v58;
      }
      else {
        v60 = v45;
      }
      id v57 = v60;
    }
    objc_msgSend_setBrowserShortDisplayName_(v12, v61, (uint64_t)v57, v62);
    v65 = objc_msgSend_objectForKey_(v36, v63, @"MSHideInAppDrawer", v64);
    int v69 = objc_msgSend_BOOLValue(v65, v66, v67, v68);

    if (v69)
    {
      objc_msgSend_setShowInBrowser_(v12, v70, 0, v71);
      objc_msgSend_setShowInSendMenu_(v12, v72, 0, v73);
    }
    v74 = objc_msgSend_objectForKey_(v36, v70, @"MSCanSendDataPayloads", v71);
    int v78 = objc_msgSend_BOOLValue(v74, v75, v76, v77);

    if (v78) {
      objc_msgSend_setCanSendDataPayloads_(v12, v79, 1, v80);
    }
    v81 = objc_msgSend_objectForKey_(v36, v79, @"MSShouldBalloonHideAppIcon", v80);
    int v85 = objc_msgSend_BOOLValue(v81, v82, v83, v84);

    if (v85) {
      objc_msgSend_setShouldBalloonHideAppIcon_(v12, v86, 1, v87);
    }
    v88 = objc_msgSend_objectForKey_(v36, v86, @"MSShouldBreadcrumbHideAppIcon", v87);
    int v92 = objc_msgSend_BOOLValue(v88, v89, v90, v91);

    if (v92) {
      objc_msgSend_setShouldBreadcrumbHideAppIcon_(v12, v93, 1, v94);
    }
    v95 = objc_msgSend_objectForKey_(v36, v93, @"MSShouldHideAppSwitcher", v94);
    int v99 = objc_msgSend_BOOLValue(v95, v96, v97, v98);

    if (v99) {
      objc_msgSend_setShouldHideAppSwitcher_(v12, v100, 1, v101);
    }
    v102 = objc_msgSend_objectForKey_(v36, v100, @"MSSupportedPresentationContexts", v101);
    uint64_t v105 = objc_msgSend_presentationContextsForInfoPlistArray_(v12, v103, (uint64_t)v102, v104);
    objc_msgSend_setPresentationContexts_(v12, v106, v105, v107);
    v110 = objc_msgSend_objectForKey_(v36, v108, @"NSStickerSharingLevel", v109);
    if (objc_msgSend_length(v110, v111, v112, v113))
    {
      if (objc_msgSend_caseInsensitiveCompare_(@"Messages", v114, (uint64_t)v110, v115))
      {
        if (!objc_msgSend_caseInsensitiveCompare_(@"OS", v116, (uint64_t)v110, v117)) {
          objc_msgSend_setStickerSharingLevel_(v12, v114, 0, v115);
        }
      }
      else
      {
        objc_msgSend_setStickerSharingLevel_(v12, v116, 1, v117);
      }
    }
    v118 = objc_msgSend_objectForKey_(v36, v114, @"MSHideAttributionInformation", v115);
    int v122 = objc_msgSend_BOOLValue(v118, v119, v120, v121);

    if (v122) {
      objc_msgSend_setShouldHideAttributionInformation_(v12, v123, 1, v124);
    }
  }
  return v12;
}

- (BOOL)isStickerPackOnly
{
  return 0;
}

- (BOOL)shouldForceIntoSendMenu
{
  return 0;
}

- (BOOL)isPreDawnAndAppStoreStickerGenre
{
  return 0;
}

- (BOOL)shouldDelayViewControllerPresentation
{
  return 0;
}

- (double)presentationDelay
{
  return 1.0;
}

- (void)_loadAppBundle
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend_pluginLoaded(self, a2, v2, v3) & 1) == 0)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
    objc_msgSend_startTimingForKey_(v5, v6, @"loadAppBundle", v7);
    uint64_t v11 = objc_msgSend_appBundle(self, v8, v9, v10);
    uint64_t v15 = objc_msgSend_load(v11, v12, v13, v14);
    objc_msgSend_setPluginLoaded_(self, v16, v15, v17);

    objc_msgSend_stopTimingForKey_(v5, v18, @"loadAppBundle", v19);
    if (IMOSLoggingEnabled())
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = objc_msgSend_appBundle(self, v21, v22, v23);
        uint64_t v28 = objc_msgSend_bundleIdentifier(v24, v25, v26, v27);
        int v29 = 138412546;
        uint64_t v30 = v28;
        __int16 v31 = 2112;
        id v32 = v5;
        _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "Loaded %@, %@", (uint8_t *)&v29, 0x16u);
      }
    }
  }
}

- (void)_loadBundle
{
  v2.receiver = self;
  v2.super_class = (Class)_IMBalloonBundleApp;
  [(IMBalloonApp *)&v2 _loadBundle];
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

- (void)setBubbleClass:(Class)a3
{
}

- (void)setBrowserClass:(Class)a3
{
}

- (void)setDataSourceClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceClass, 0);
  objc_storeStrong((id *)&self->_browserClass, 0);

  objc_storeStrong((id *)&self->_bubbleClass, 0);
}

@end