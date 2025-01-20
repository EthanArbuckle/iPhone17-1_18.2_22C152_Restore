@interface _IMBalloonExtensionApp
- (BOOL)isBetaPlugin;
- (BOOL)isEnabled;
- (BOOL)isLaunchProhibited;
- (BOOL)isPreDawnAndAppStoreStickerGenre;
- (BOOL)isStickerPackOnly;
- (BOOL)linkedBeforeDawn;
- (BOOL)linkedBeforeSDKVersion:(id)a3;
- (BOOL)shouldDelayViewControllerPresentation;
- (BOOL)shouldForceIntoSendMenu;
- (BOOL)showInBrowser;
- (BOOL)showInSendMenu;
- (BOOL)showableInBrowser;
- (LSPlugInKitProxy)proxy;
- (NSExtension)extension;
- (_IMBalloonExtensionApp)initWithPluginBundle:(id)a3 extension:(id)a4;
- (_IMBalloonExtensionApp)initWithPluginBundle:(id)a3 extension:(id)a4 pluginKitProxyClass:(Class)a5 proxy:(id)a6;
- (_IMBalloonExtensionApp)initWithPluginBundle:(id)a3 pluginKitProxy:(id)a4 extension:(id)a5;
- (double)presentationDelay;
- (id)_bundleIDToPresentationDelayMapping;
- (id)_bundleIDsForDawnSendMenuTemporaryDisplayOverride;
- (id)_bundleIDsForDelayedPresentationOptIn;
- (id)appStoreGenre;
- (id)appStoreGenreID;
- (id)appStoreSubgenres;
- (id)applicationType;
- (id)itemID;
- (id)plugin;
- (id)version;
- (void)setExtension:(id)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setProxy:(id)a3;
@end

@implementation _IMBalloonExtensionApp

- (_IMBalloonExtensionApp)initWithPluginBundle:(id)a3 pluginKitProxy:(id)a4 extension:(id)a5
{
  return (_IMBalloonExtensionApp *)objc_msgSend_initWithPluginBundle_extension_pluginKitProxyClass_proxy_(self, a2, (uint64_t)a3, (uint64_t)a5, 0, a4);
}

- (_IMBalloonExtensionApp)initWithPluginBundle:(id)a3 extension:(id)a4 pluginKitProxyClass:(Class)a5 proxy:(id)a6
{
  uint64_t v188 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16 = v12;
  if (v11 && !v12)
  {
    v17 = objc_msgSend_identifier(v11, v13, v14, v15);
    v16 = objc_msgSend_pluginKitProxyForIdentifier_(a5, v18, (uint64_t)v17, v19);
  }
  v20 = objc_msgSend_containingBundle(v16, v13, v14, v15);
  v185.receiver = self;
  v185.super_class = (Class)_IMBalloonExtensionApp;
  v21 = [(IMBalloonApp *)&v185 initWithPluginBundle:v10 appBundle:v20];

  if (v21)
  {
    objc_storeStrong((id *)&v21->_extension, a4);
    objc_storeStrong((id *)&v21->_proxy, v16);
    v25 = objc_msgSend_bundleIdentifier(v16, v22, v23, v24);
    v29 = objc_msgSend_infoDictionary(v11, v26, v27, v28);
    v32 = objc_msgSend_objectForKey_(v29, v30, @"NSExtension", v31);
    v35 = objc_msgSend_objectForKey_(v32, v33, @"MSMessagePayloadProviderIdentifier", v34);

    if (objc_msgSend_length(v35, v36, v37, v38))
    {
      id v42 = v35;

      v25 = v42;
    }
    v43 = objc_msgSend_teamID(v16, v39, v40, v41);
    v47 = v43;
    if (v43)
    {
      v182 = v43;
    }
    else
    {
      v48 = objc_msgSend_containingBundle(v16, v44, v45, v46);
      uint64_t v52 = objc_msgSend_teamID(v48, v49, v50, v51);
      v53 = (void *)v52;
      v54 = @"0000000000";
      if (v52) {
        v54 = (__CFString *)v52;
      }
      v182 = v54;
    }
    v58 = objc_msgSend_bundleIdentifier(v10, v55, v56, v57);
    v61 = objc_msgSend_stringByAppendingFormat_(v58, v59, @":%@:%@", v60, v182, v25);

    objc_msgSend_setIdentifier_(v21, v62, (uint64_t)v61, v63);
    v183[0] = MEMORY[0x1E4F143A8];
    v183[1] = 3221225472;
    v183[2] = sub_1A4BFFD68;
    v183[3] = &unk_1E5B7E0D8;
    id v64 = v61;
    id v184 = v64;
    objc_msgSend_setRequestInterruptionBlock_(v11, v65, (uint64_t)v183, v66);
    v70 = objc_msgSend_localizedName(v16, v67, v68, v69);
    BOOL v74 = objc_msgSend_length(v70, v71, v72, v73) == 0;

    if (v74)
    {
      v81 = objc_msgSend_localizedShortName(v16, v75, v76, v77);
      BOOL v85 = objc_msgSend_length(v81, v82, v83, v84) == 0;

      if (v85)
      {
LABEL_17:
        v90 = objc_msgSend_browserDisplayName(v21, v86, v87, v88);
        BOOL v94 = objc_msgSend_length(v90, v91, v92, v93) == 0;

        if (v94)
        {
          v95 = NSString;
          uint64_t v96 = IMFileLocationTrimFileName();
          v99 = objc_msgSend_stringWithFormat_(NSString, v97, (uint64_t)&stru_1EF8E78C8, v98);
          v102 = objc_msgSend_stringWithFormat_(v95, v100, @"Unexpected false '%@' in %s at %s:%d. %@", v101, @"[self.browserDisplayName length] > 0", "-[_IMBalloonExtensionApp initWithPluginBundle:extension:pluginKitProxyClass:proxy:]", v96, 146, v99);

          v103 = (void (*)(void *))IMGetAssertionFailureHandler();
          if (v103)
          {
            v103(v102);
          }
          else if (IMOSLoggingEnabled())
          {
            v104 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v187 = v102;
              _os_log_impl(&dword_1A4AF7000, v104, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v105 = objc_opt_class();
        v107 = objc_msgSend_objectForInfoDictionaryKey_ofClass_inScope_(v16, v106, @"MSHideInAppDrawer", v105, 2);
        int v111 = objc_msgSend_BOOLValue(v107, v108, v109, v110);

        if (v111)
        {
          objc_msgSend_setShowInBrowser_(v21, v112, 0, v113);
          objc_msgSend_setShowInSendMenu_(v21, v114, 0, v115);
        }
        uint64_t v116 = objc_opt_class();
        v118 = objc_msgSend_objectForInfoDictionaryKey_ofClass_inScope_(v16, v117, @"MSCanSendDataPayloads", v116, 2);
        int v122 = objc_msgSend_BOOLValue(v118, v119, v120, v121);

        if (v122) {
          objc_msgSend_setCanSendDataPayloads_(v21, v123, 1, v124);
        }
        uint64_t v125 = objc_opt_class();
        v127 = objc_msgSend_objectForInfoDictionaryKey_ofClass_inScope_(v16, v126, @"MSShouldBalloonHideAppIcon", v125, 2);
        int v131 = objc_msgSend_BOOLValue(v127, v128, v129, v130);

        if (v131) {
          objc_msgSend_setShouldBalloonHideAppIcon_(v21, v132, 1, v133);
        }
        uint64_t v134 = objc_opt_class();
        v136 = objc_msgSend_objectForInfoDictionaryKey_ofClass_inScope_(v16, v135, @"MSShouldBreadcrumbHideAppIcon", v134, 2);
        int v140 = objc_msgSend_BOOLValue(v136, v137, v138, v139);

        if (v140) {
          objc_msgSend_setShouldBreadcrumbHideAppIcon_(v21, v141, 1, v142);
        }
        uint64_t v143 = objc_opt_class();
        v145 = objc_msgSend_objectForInfoDictionaryKey_ofClass_inScope_(v16, v144, @"MSShouldHideAppSwitcher", v143, 2);
        int v149 = objc_msgSend_BOOLValue(v145, v146, v147, v148);

        if (v149) {
          objc_msgSend_setShouldHideAppSwitcher_(v21, v150, 1, v151);
        }
        uint64_t v152 = objc_opt_class();
        v154 = objc_msgSend_objectForInfoDictionaryKey_ofClass_inScope_(v16, v153, @"MSSupportedPresentationContexts", v152, 2);
        uint64_t v157 = objc_msgSend_presentationContextsForInfoPlistArray_(v21, v155, (uint64_t)v154, v156);
        objc_msgSend_setPresentationContexts_(v21, v158, v157, v159);
        uint64_t v160 = objc_opt_class();
        v162 = objc_msgSend_objectForInfoDictionaryKey_ofClass_inScope_(v16, v161, @"NSStickerSharingLevel", v160, 2);
        if (objc_msgSend_length(v162, v163, v164, v165))
        {
          if (objc_msgSend_caseInsensitiveCompare_(@"Messages", v166, (uint64_t)v162, v167))
          {
            if (!objc_msgSend_caseInsensitiveCompare_(@"OS", v168, (uint64_t)v162, v169)) {
              objc_msgSend_setStickerSharingLevel_(v21, v170, 0, v171);
            }
          }
          else
          {
            objc_msgSend_setStickerSharingLevel_(v21, v168, 1, v169);
          }
        }
        uint64_t v172 = objc_opt_class();
        v174 = objc_msgSend_objectForInfoDictionaryKey_ofClass_inScope_(v16, v173, @"MSHideAttributionInformation", v172, 2);
        int v178 = objc_msgSend_BOOLValue(v174, v175, v176, v177);

        if (v178) {
          objc_msgSend_setShouldHideAttributionInformation_(v21, v179, 1, v180);
        }

        goto LABEL_43;
      }
      uint64_t v78 = objc_msgSend_localizedShortName(v16, v86, v87, v88);
    }
    else
    {
      uint64_t v78 = objc_msgSend_localizedName(v16, v75, v76, v77);
    }
    v89 = (void *)v78;
    objc_msgSend_setBrowserDisplayName_(v21, v79, v78, v80);

    goto LABEL_17;
  }
LABEL_43:

  return v21;
}

- (BOOL)linkedBeforeSDKVersion:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_extension(self, v5, v6, v7);
  id v12 = objc_msgSend_infoDictionary(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v12, v13, @"LSExecutableSDKVersion", v14);
  uint64_t v19 = v15;
  if (v15 && objc_msgSend_length(v15, v16, v17, v18))
  {
    sub_1A4CBD4EC(0.0);
    sub_1A4CBD4EC(0.0);
    BOOL v20 = sub_1A4CBD518(0.0) == -1;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (BOOL)shouldForceIntoSendMenu
{
  v5 = objc_msgSend_extension(self, a2, v2, v3);
  v9 = objc_msgSend_infoDictionary(v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v9, v10, *MEMORY[0x1E4F1CFF8], v11);
  if (v15 && objc_msgSend_linkedBeforeDawn(self, v12, v13, v14))
  {
    uint64_t v19 = objc_msgSend__bundleIDsForDawnSendMenuTemporaryDisplayOverride(self, v16, v17, v18);
    char v22 = objc_msgSend_containsObject_(v19, v20, (uint64_t)v15, v21);
  }
  else
  {
    char v22 = 0;
  }

  return v22;
}

- (BOOL)isPreDawnAndAppStoreStickerGenre
{
  int v5 = objc_msgSend_linkedBeforeDawn(self, a2, v2, v3);
  v9 = objc_msgSend_appStoreGenreID(self, v6, v7, v8);
  int isEqualToNumber = objc_msgSend_isEqualToNumber_(v9, v10, (uint64_t)&unk_1EF914560, v11);

  v16 = objc_msgSend_appStoreGenre(self, v13, v14, v15);
  char isEqualToString = objc_msgSend_isEqualToString_(v16, v17, @"Stickers", v18);

  uint64_t v23 = objc_msgSend_appStoreSubgenres(self, v20, v21, v22);
  char v26 = objc_msgSend_containsObject_(v23, v24, @"Stickers", v25);

  if (v5 ^ 1 | isEqualToNumber) {
    return v5;
  }
  else {
    return isEqualToString | v26;
  }
}

- (BOOL)linkedBeforeDawn
{
  return objc_msgSend_linkedBeforeSDKVersion_(self, a2, @"17.0", v2);
}

- (id)appStoreSubgenres
{
  id v4 = objc_msgSend_proxy(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_containingBundle(v4, v5, v6, v7);

  id v12 = objc_msgSend_subgenres(v8, v9, v10, v11);

  return v12;
}

- (id)appStoreGenre
{
  id v4 = objc_msgSend_proxy(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_containingBundle(v4, v5, v6, v7);

  id v12 = objc_msgSend_genre(v8, v9, v10, v11);

  return v12;
}

- (id)appStoreGenreID
{
  id v4 = objc_msgSend_proxy(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_containingBundle(v4, v5, v6, v7);

  id v12 = objc_msgSend_genreID(v8, v9, v10, v11);

  return v12;
}

- (BOOL)isStickerPackOnly
{
  id v4 = objc_msgSend_proxy(self, a2, v2, v3);
  uint64_t v6 = v4;
  BOOL v12 = 0;
  if (v4)
  {
    uint64_t v7 = objc_msgSend_objectForInfoDictionaryKey_ofClass_(v4, v5, @"LSApplicationIsStickerProvider", 0);
    char v11 = objc_msgSend_BOOLValue(v7, v8, v9, v10);

    if (v11) {
      BOOL v12 = 1;
    }
  }

  return v12;
}

- (LSPlugInKitProxy)proxy
{
  return self->_proxy;
}

- (BOOL)isEnabled
{
  int v5 = objc_msgSend_plugin(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_userElection(v5, v6, v7, v8) & 0xFE;

  if (!v9) {
    return 1;
  }
  uint64_t v13 = objc_msgSend_applicationType(self, v10, v11, v12);
  double v15 = sub_1A4CBD60C(v14);
  int isEqualToString = objc_msgSend_isEqualToString_(v17, v18, **(void **)(v16 + 896), v19, v15);

  if (isEqualToString)
  {
    uint64_t v24 = objc_msgSend_plugin(self, v21, v22, v23);
    objc_msgSend_setUserElection_(v24, v25, 0, v26);

    objc_msgSend_setIsEnabledUnremovableApp_(self, v27, 0, v28);
    return 1;
  }
  return 0;
}

- (id)plugin
{
  id v4 = objc_msgSend_extension(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend__plugIn(v4, v5, v6, v7);

  return v8;
}

- (_IMBalloonExtensionApp)initWithPluginBundle:(id)a3 extension:(id)a4
{
  uint64_t v6 = qword_1EB3F21F8;
  id v7 = a4;
  id v8 = a3;
  if (v6 != -1) {
    dispatch_once(&qword_1EB3F21F8, &unk_1EF8E3E90);
  }
  id v9 = (id) qword_1EB3F21F0;
  uint64_t v11 = (_IMBalloonExtensionApp *)objc_msgSend_initWithPluginBundle_extension_pluginKitProxyClass_proxy_(self, v10, (uint64_t)v8, (uint64_t)v7, v9, 0);

  return v11;
}

- (id)version
{
  id v4 = objc_msgSend_extension(self, a2, v2, v3);
  id v8 = objc_msgSend_version(v4, v5, v6, v7);

  return v8;
}

- (id)itemID
{
  int v5 = objc_msgSend_appBundle(self, a2, v2, v3);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v10 = &unk_1EF914530;
LABEL_5:
    if (!objc_msgSend_isEqual_(v10, v6, (uint64_t)&unk_1EF914530, v8)) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  uint64_t v10 = objc_msgSend_itemID(v5, v6, v7, v8);
  if (v10) {
    goto LABEL_5;
  }
LABEL_6:
  uint64_t v11 = objc_msgSend_identifier(self, v6, v9, v8);

  if (v11)
  {
    if (qword_1E965EA00 != -1) {
      dispatch_once(&qword_1E965EA00, &unk_1EF8E5598);
    }
    double v15 = (void *)qword_1E965E9F8;
    uint64_t v16 = objc_msgSend_identifier(self, v12, v13, v14);
    uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v15, v17, (uint64_t)v16, v18);

    uint64_t v10 = (void *)v19;
  }
LABEL_10:

  return v10;
}

- (BOOL)shouldDelayViewControllerPresentation
{
  int v5 = objc_msgSend_extension(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_infoDictionary(v5, v6, v7, v8);
  double v15 = objc_msgSend_objectForKeyedSubscript_(v9, v10, *MEMORY[0x1E4F1CFF8], v11);
  if (v15)
  {
    uint64_t v16 = objc_msgSend__bundleIDsForDelayedPresentationOptIn(self, v12, v13, v14);
    int v19 = objc_msgSend_containsObject_(v16, v17, (uint64_t)v15, v18);

    if (v19) {
      char v21 = objc_msgSend_BOOLValueForKey_withDefault_(v9, v20, @"MSOptInToDelayedPresentation", 0);
    }
    else {
      char v21 = 1;
    }
  }
  else
  {
    char v21 = 0;
  }

  return v21;
}

- (double)presentationDelay
{
  int v5 = objc_msgSend_extension(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_infoDictionary(v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"MSPresentationDelay", v11);
  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v9, v13, *MEMORY[0x1E4F1CFF8], v14);
  if (v12)
  {
    objc_msgSend_floatValue(v12, v15, v16, v17);
    double v20 = v19;
  }
  else
  {
    char v21 = objc_msgSend__bundleIDToPresentationDelayMapping(self, v15, v16, v17);
    uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)v18, v23);
    uint64_t v12 = v24;
    if (v24)
    {
      objc_msgSend_floatValue(v24, v25, v26, v27);
      double v20 = v28;
    }
    else
    {
      double v20 = 1.0;
    }
  }
  return v20;
}

- (id)_bundleIDToPresentationDelayMapping
{
  if (qword_1E965EA10 != -1) {
    dispatch_once(&qword_1E965EA10, &unk_1EF8E5A58);
  }
  uint64_t v2 = (void *)qword_1E965EA08;

  return v2;
}

- (id)_bundleIDsForDawnSendMenuTemporaryDisplayOverride
{
  if (qword_1E965EA20 != -1) {
    dispatch_once(&qword_1E965EA20, &unk_1EF8E3C10);
  }
  uint64_t v2 = (void *)qword_1E965EA18;

  return v2;
}

- (id)_bundleIDsForDelayedPresentationOptIn
{
  if (qword_1E965EA30 != -1) {
    dispatch_once(&qword_1E965EA30, &unk_1EF8E3C30);
  }
  uint64_t v2 = (void *)qword_1E965EA28;

  return v2;
}

- (BOOL)isBetaPlugin
{
  id v4 = objc_msgSend_containingBundle(self->_proxy, a2, v2, v3);
  char isBetaApp = objc_msgSend_isBetaApp(v4, v5, v6, v7);

  return isBetaApp;
}

- (id)applicationType
{
  id v4 = objc_msgSend_proxy(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_containingBundle(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_applicationType(v8, v9, v10, v11);

  return v12;
}

- (BOOL)showInSendMenu
{
  v3.receiver = self;
  v3.super_class = (Class)_IMBalloonExtensionApp;
  return [(IMBalloonApp *)&v3 showInSendMenu];
}

- (BOOL)showInBrowser
{
  v19.receiver = self;
  v19.super_class = (Class)_IMBalloonExtensionApp;
  unsigned int v3 = [(IMBalloonApp *)&v19 showInBrowser];
  if (v3)
  {
    uint64_t v7 = objc_msgSend_applicationType(self, v4, v5, v6);
    double v9 = sub_1A4CBD60C(v8);
    int isEqualToString = objc_msgSend_isEqualToString_(v11, v12, **(void **)(v10 + 896), v13, v9);

    if (isEqualToString) {
      LOBYTE(v3) = objc_msgSend_isEnabledUnremovableApp(self, v15, v16, v17);
    }
    else {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)showableInBrowser
{
  v19.receiver = self;
  v19.super_class = (Class)_IMBalloonExtensionApp;
  unsigned int v3 = [(IMBalloonApp *)&v19 showInBrowser];
  if (v3)
  {
    uint64_t v7 = objc_msgSend_applicationType(self, v4, v5, v6);
    double v9 = sub_1A4CBD60C(v8);
    int isEqualToString = objc_msgSend_isEqualToString_(v11, v12, **(void **)(v10 + 896), v13, v9);

    if (isEqualToString) {
      LOBYTE(v3) = objc_msgSend_isEnabledUnremovableApp(self, v15, v16, v17) ^ 1;
    }
    else {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)setIsEnabled:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v6 = objc_msgSend_applicationType(self, a2, a3, v3);
  double v8 = sub_1A4CBD60C(v7);
  int isEqualToString = objc_msgSend_isEqualToString_(v10, v11, **(void **)(v9 + 896), v12, v8);

  if (isEqualToString)
  {
    objc_msgSend_setIsEnabledUnremovableApp_(self, v14, v4, v16);
  }
  else
  {
    if (v4) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2;
    }
    uint64_t v18 = objc_msgSend_plugin(self, v14, v15, v16);
    uint64_t v22 = objc_msgSend_userElection(v18, v19, v20, v21);

    objc_msgSend_plugin(self, v23, v24, v25);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setUserElection_(v28, v26, v22 & 0xFFFFFFFFFFFFFF00 | v17, v27);
  }
}

- (BOOL)isLaunchProhibited
{
  BOOL v4 = objc_msgSend_proxy(self, a2, v2, v3);
  double v8 = objc_msgSend_containingBundle(v4, v5, v6, v7);
  char isLaunchProhibited = objc_msgSend_isLaunchProhibited(v8, v9, v10, v11);

  return isLaunchProhibited;
}

- (void)setExtension:(id)a3
{
}

- (void)setProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);

  objc_storeStrong((id *)&self->_extension, 0);
}

@end