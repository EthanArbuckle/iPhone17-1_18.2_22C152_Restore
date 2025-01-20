@interface IMBalloonPluginManager
+ (BOOL)_allowExtensionWithIdentifier:(id)a3;
+ (BOOL)_isExtensionBlocklisted:(id)a3;
+ (BOOL)_isServerBlocklistedBundleIdentifier:(id)a3 serverBag:(id)a4;
+ (BOOL)_shouldAddFindMyToBlockList;
+ (BOOL)_shouldAddGenPlaygroundToBlockList;
+ (BOOL)_shouldAddSafetyMonitorToBlockList;
+ (BOOL)isRunningPPT;
+ (id)_extensionBlocklist;
+ (id)balloonProviderBundlePathURL;
+ (id)precacheBalloonAppExtensionsForExtensions:(id)a3;
+ (id)sharedInstance;
+ (id)signpostLogHandle;
+ (void)disableExtensionDiscovery;
+ (void)enableAlternatePathPlugins;
+ (void)setIsRunningPPT:(BOOL)a3;
- (BOOL)_shouldSkipUpdatingPluginBundleIdentifier:(id)a3;
- (Class)dataSourceClassForBundleID:(id)a3;
- (IMBalloonPluginManager)init;
- (IMBalloonPluginManagerModel)model;
- (id)_appProxyBundleIdentifiersForAppPlugins;
- (id)_currentlyInstalledExtensionsExcludingExtensionPoint:(id)a3;
- (id)_extensionWithIdentifier:(id)a3;
- (id)_fallBackMessagesExtensionPluginForBundleID:(id)a3;
- (id)_identifiersForAppPlugins;
- (id)_infoPlistPathForPluginCreatingFolderIfNeeded:(id)a3;
- (id)_insertPluginForAppBundle:(id)a3 balloonProviderBundle:(id)a4;
- (id)_insertPluginForExtension:(id)a3 balloonProviderBundle:(id)a4 precachedBalloonAppExtensions:(id)a5 timingCollection:(id)a6;
- (id)_loadAppExtensionDataSourcesForExtensionPoint:(id)a3;
- (id)_metadataForPluginIdentifier:(id)a3;
- (id)_pluginPlistPath:(id)a3;
- (id)_pluginsForWhichWeHaveMetadata;
- (id)_proxyIdentifiersForPlugins;
- (id)allPlugins;
- (id)balloonPluginForBundleID:(id)a3;
- (id)conversationID:(id)a3 appID:(id)a4;
- (id)dataSourceForPluginPayload:(id)a3;
- (id)existingDataSourceForMessageGUID:(id)a3 bundleID:(id)a4;
- (id)localParticipantIdentifierForAppID:(id)a3 conversationID:(id)a4;
- (id)recipientIDForRecipient:(id)a3 appID:(id)a4;
- (id)signpostLogHandle;
- (id)systemBundleIdentifierForPluginIdentifier:(id)a3;
- (void)_clearPluginMetadataForUninstalledApps;
- (void)_deleteMetaDataForPlugins:(id)a3;
- (void)_findPluginsInPathInternal:(id)a3;
- (void)_findPluginsInPaths:(id)a3;
- (void)_loadAllDataSources;
- (void)_loadAppBundleDataSources;
- (void)_loadAppExtensionDataSources;
- (void)_moveExtensionDataSourcesFromMessagesExtensionPluginToAppExtensions;
- (void)_postDeferredInstalledAppsChangedNotificationIfNecessary;
- (void)_postInstalledAppsChangedNotification;
- (void)_removePluginsForIdentifiers:(id)a3;
- (void)_removePluginsWithDelay;
- (void)_setPluginsToRemoveAndCallSelectorWithDelay:(id)a3;
- (void)_storeMetadata:(id)a3 _forPlugin:(id)a4;
- (void)_transferUpdated:(id)a3;
- (void)_updatePluginsForBundles:(id)a3;
- (void)_updatePluginsForExtensions:(id)a3 extensionPoint:(id)a4;
- (void)_updatePluginsForExtensions:(id)a3 extensionPoint:(id)a4 precachedBalloonAppExtensions:(id)a5;
- (void)dealloc;
- (void)insertDataSource:(id)a3 forGUID:(id)a4;
- (void)insertPlugin:(id)a3;
- (void)loadExtensionWithIdentifierIfNeeded:(id)a3;
- (void)pluginChatItem:(id)a3 didRelenquishNonResuableController:(id)a4 contextIdentifier:(id)a5;
- (void)pluginChatItem:(id)a3 didRelinquishReusableController:(id)a4 contextIdentifier:(id)a5;
- (void)removePluginWithBundleID:(id)a3;
- (void)setModel:(id)a3;
- (void)setPluginEnabled:(BOOL)a3 identifier:(id)a4;
@end

@implementation IMBalloonPluginManager

+ (BOOL)_shouldAddFindMyToBlockList
{
  if (objc_msgSend_deviceIsLockedDown(MEMORY[0x1E4F6E730], a2, v2, v3)) {
    return 1;
  }
  v8 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v4, v5, v6);
  char isWaldoEnabled = objc_msgSend_isWaldoEnabled(v8, v9, v10, v11);

  return isWaldoEnabled ^ 1;
}

+ (BOOL)_shouldAddGenPlaygroundToBlockList
{
  v4 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  char isGenPlaygroundEnabled = objc_msgSend_isGenPlaygroundEnabled(v4, v5, v6, v7);

  return isGenPlaygroundEnabled ^ 1;
}

+ (BOOL)_shouldAddSafetyMonitorToBlockList
{
  v4 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  if (objc_msgSend_isZelkovaEnabled(v4, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v8, v9, v10);
    int v15 = objc_msgSend_isSendMenuEnabled(v11, v12, v13, v14) ^ 1;
  }
  else
  {
    LOBYTE(v15) = 1;
  }

  return v15;
}

- (void)_loadAppBundleDataSources
{
  v26[2] = *MEMORY[0x1E4F143B8];
  if ((byte_1E965E8D0 & 1) == 0)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CB10];
    v4 = IMAppBundleRootDirectory();
    uint64_t v7 = objc_msgSend_fileURLWithPath_(v3, v5, (uint64_t)v4, v6);

    uint64_t v11 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v8, v9, v10);
    uint64_t v12 = *MEMORY[0x1E4F1C628];
    v26[0] = *MEMORY[0x1E4F1C6E8];
    v26[1] = v12;
    uint64_t v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v13, (uint64_t)v26, 2);
    v16 = objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v11, v15, (uint64_t)v7, (uint64_t)v14, 4, 0);

    v20 = objc_msgSend_allObjects(v16, v17, v18, v19);
    v23 = objc_msgSend___imArrayByApplyingBlock_(v20, v21, (uint64_t)&unk_1EF8E3EB0, v22);

    objc_msgSend__updatePluginsForBundles_(self, v24, (uint64_t)v23, v25);
  }
}

- (IMBalloonPluginManager)init
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  v138.receiver = self;
  v138.super_class = (Class)IMBalloonPluginManager;
  v127 = [(IMBalloonPluginManager *)&v138 init];
  if (v127)
  {
    uint64_t v2 = objc_alloc_init(IMBalloonPluginManagerModel);
    model = v127->_model;
    v127->_model = v2;

    if (sub_1A4AFCB40(v4, v5, v6, v7))
    {
      objc_msgSend__loadAllDataSources(v127, v8, v9, v10);
      uint64_t v14 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v11, v12, v13);
      objc_msgSend_addObserver_selector_name_object_(v14, v15, (uint64_t)v127, (uint64_t)sel__transferUpdated_, @"__kIMFileTransferUpdatedNotification", 0);

      v16 = (void *)MEMORY[0x1E4F1CB10];
      v17 = (void *)CPSharedResourcesDirectory();
      v20 = objc_msgSend_stringByAppendingString_(v17, v18, @"/Library", v19);
      v23 = objc_msgSend_URLWithString_(v16, v21, (uint64_t)v20, v22);

      uint64_t v25 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v23, v24, @"SMS", 1);

      objc_msgSend_URLByAppendingPathComponent_isDirectory_(v25, v26, @"PluginMetaDataCache", 1);
      id v27 = (id)objc_claimAutoreleasedReturnValue();

      v31 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v28, v29, v30);
      v34 = objc_msgSend_valueForKey_(v31, v32, @"PluginMetaDataCachePath", v33);
      LODWORD(v25) = v34 == 0;

      if (v25)
      {
        v129 = objc_msgSend_stringGUID(NSString, v35, v36, v37);
        v57 = objc_msgSend_path(v27, v54, v55, v56);
        v40 = objc_msgSend_stringByDeletingLastPathComponent(v57, v58, v59, v60);

        v126 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v27, v61, (uint64_t)v129, 1);

        v65 = objc_msgSend_model(v127, v62, v63, v64);
        v69 = objc_msgSend_pluginMetaDataFolder(v65, v66, v67, v68);
        IMSharedHelperEnsureDirectoryExistsAtPath();

        v128 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v70, v71, v72);
        id v137 = 0;
        v74 = objc_msgSend_contentsOfDirectoryAtPath_error_(v128, v73, (uint64_t)v40, (uint64_t)&v137);
        id v27 = v137;
        if (v27 && IMOSLoggingEnabled())
        {
          v75 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v141 = v27;
            _os_log_impl(&dword_1A4AF7000, v75, OS_LOG_TYPE_INFO, "Error = %@ while trying to get contents of folder", buf, 0xCu);
          }
        }
        long long v135 = 0u;
        long long v136 = 0u;
        long long v133 = 0u;
        long long v134 = 0u;
        id obj = v74;
        uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v76, (uint64_t)&v133, (uint64_t)v139, 16);
        if (v79)
        {
          uint64_t v80 = *(void *)v134;
          do
          {
            for (uint64_t i = 0; i != v79; ++i)
            {
              if (*(void *)v134 != v80) {
                objc_enumerationMutation(obj);
              }
              v82 = *(void **)(*((void *)&v133 + 1) + 8 * i);
              if (objc_msgSend_hasSuffix_(v82, v77, @"plist", v78))
              {
                v84 = objc_msgSend_lastPathComponent(v82, v77, v83, v78);
                v87 = objc_msgSend_stringByAppendingPathComponent_(v129, v85, (uint64_t)v84, v86);
                v90 = objc_msgSend_stringByAppendingPathComponent_(v40, v88, (uint64_t)v87, v89);

                v93 = objc_msgSend_stringByAppendingPathComponent_(v40, v91, (uint64_t)v82, v92);
                id v132 = v27;
                objc_msgSend_moveItemAtPath_toPath_error_(v128, v94, (uint64_t)v93, (uint64_t)v90, &v132);
                id v95 = v132;

                id v27 = v95;
              }
            }
            uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v77, (uint64_t)&v133, (uint64_t)v139, 16);
          }
          while (v79);
        }

        if (v27 && IMOSLoggingEnabled())
        {
          v99 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v141 = v27;
            _os_log_impl(&dword_1A4AF7000, v99, OS_LOG_TYPE_INFO, "Error = %@ while trying to copy file to new folder", buf, 0xCu);
          }
        }
        v100 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v96, v97, v98);
        objc_msgSend_setObject_forKey_(v100, v101, (uint64_t)v129, @"PluginMetaDataCachePath");
      }
      else
      {
        v129 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], v35, v36, v37);
        v40 = objc_msgSend_valueForKey_(v129, v38, @"PluginMetaDataCachePath", v39);
        v126 = objc_msgSend_URLByAppendingPathComponent_isDirectory_(v27, v41, (uint64_t)v40, 1);
      }

      v105 = objc_msgSend_path(v126, v102, v103, v104);
      v109 = objc_msgSend_model(v127, v106, v107, v108);
      objc_msgSend_setPluginMetaDataFolder_(v109, v110, (uint64_t)v105, v111);

      v131 = v127;
      dword_1EB3F1E88 = IMDispatchForNotify();
      v115 = objc_msgSend_dictionary(MEMORY[0x1E4F1C9E8], v112, v113, v114);
      v119 = objc_msgSend_model(v131, v116, v117, v118);
      objc_msgSend_setPluginIDToMetadataCache_(v119, v120, (uint64_t)v115, v121);
    }
    else if (IMOSLoggingEnabled())
    {
      v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v49 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v46, v47, v48);
        v53 = objc_msgSend_bundleIdentifier(v49, v50, v51, v52);
        *(_DWORD *)buf = 138412290;
        id v141 = v53;
        _os_log_impl(&dword_1A4AF7000, v45, OS_LOG_TYPE_INFO, "Un-allowlisted client tried to use IMBalloonPluginManager: %@", buf, 0xCu);
      }
    }
    v122 = objc_msgSend_model(v127, v42, v43, v44);
    objc_msgSend_setHasCompletedInitialization_(v122, v123, 1, v124);
  }
  return v127;
}

- (id)allPlugins
{
  uint64_t v4 = objc_msgSend_model(self, a2, v2, v3);
  v8 = objc_msgSend_pluginsMap(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_allPlugins(v8, v9, v10, v11);

  return v12;
}

+ (id)sharedInstance
{
  if (qword_1EB3F2448 != -1) {
    dispatch_once(&qword_1EB3F2448, &unk_1EF8E3E10);
  }
  objc_msgSend__postDeferredInstalledAppsChangedNotificationIfNecessary((void *)qword_1EB3F2218, a2, v2, v3);
  uint64_t v4 = (void *)qword_1EB3F2218;

  return v4;
}

- (void)_postDeferredInstalledAppsChangedNotificationIfNecessary
{
  uint64_t v5 = objc_msgSend_model(self, a2, v2, v3);
  int hasDeferredInstalledAppsChangedNotification = objc_msgSend_hasDeferredInstalledAppsChangedNotification(v5, v6, v7, v8);

  if (hasDeferredInstalledAppsChangedNotification)
  {
    uint64_t v13 = objc_msgSend_model(self, v10, v11, v12);
    objc_msgSend_setHasDeferredInstalledAppsChangedNotification_(v13, v14, 0, v15);

    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Performing deffered IMBalloonPluginManagerInstalledAppsChangedNotification.", v20, 2u);
      }
    }
    objc_msgSend__postInstalledAppsChangedNotification(self, v16, v17, v18);
  }
}

- (void)_updatePluginsForBundles:(id)a3
{
  id v4 = a3;
  objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4F1CAC0], v5, (uint64_t)self, (uint64_t)sel__removePluginsWithDelay, 0);
  uint64_t v9 = objc_msgSend__appProxyBundleIdentifiersForAppPlugins(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend__proxyIdentifiersForPlugins(self, v10, v11, v12);
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x3032000000;
  uint64_t v92 = sub_1A4B344DC;
  v93 = sub_1A4B34354;
  id v94 = 0;
  id v14 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v18 = objc_msgSend_count(v4, v15, v16, v17);
  id v94 = (id)objc_msgSend_initWithCapacity_(v14, v19, v18, v20);
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x3032000000;
  v87[3] = sub_1A4B344DC;
  v87[4] = sub_1A4B34354;
  id v88 = 0;
  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x3032000000;
  v85[3] = sub_1A4B344DC;
  v85[4] = sub_1A4B34354;
  id v86 = 0;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x2020000000;
  v84[3] = 0;
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x2020000000;
  v83[3] = 0;
  uint64_t v77 = 0;
  uint64_t v78 = &v77;
  uint64_t v79 = 0x3032000000;
  uint64_t v80 = sub_1A4B344DC;
  v81 = sub_1A4B34354;
  id v82 = 0;
  v24 = objc_msgSend_model(self, v21, v22, v23);
  v28 = objc_msgSend_pluginsToRemoveAfterExtensionsUpdate(v24, v25, v26, v27);
  id v82 = (id)objc_msgSend_mutableCopy(v28, v29, v30, v31);

  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = sub_1A4B2C514;
  v68[3] = &unk_1E5B7CC48;
  v68[4] = self;
  uint64_t v71 = &v89;
  uint64_t v72 = &v77;
  id v32 = v9;
  id v69 = v32;
  v73 = v87;
  v74 = v85;
  id v33 = v13;
  id v70 = v33;
  v75 = v84;
  v76 = v83;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v34, (uint64_t)v68, v35);
  uint64_t v39 = objc_msgSend_model(self, v36, v37, v38);
  uint64_t v43 = objc_msgSend_copy((void *)v78[5], v40, v41, v42);
  objc_msgSend_setPluginsToRemoveAfterExtensionsUpdate_(v39, v44, (uint64_t)v43, v45);

  objc_msgSend_minusSet_(v32, v46, v90[5], v47);
  if (objc_msgSend_count(v32, v48, v49, v50))
  {
    objc_msgSend__setPluginsToRemoveAndCallSelectorWithDelay_(self, v51, (uint64_t)v32, v52);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v59 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v67 = 0;
        _os_log_impl(&dword_1A4AF7000, v59, OS_LOG_TYPE_INFO, "Clearing extensions to remove after delay", v67, 2u);
      }
    }
    uint64_t v60 = objc_msgSend_model(self, v56, v57, v58);
    uint64_t v64 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v61, v62, v63);
    objc_msgSend_setPluginsToRemoveAfterExtensionsUpdate_(v60, v65, (uint64_t)v64, v66);
  }
  objc_msgSend__moveExtensionDataSourcesFromMessagesExtensionPluginToAppExtensions(self, v53, v54, v55);

  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(v83, 8);
  _Block_object_dispose(v84, 8);
  _Block_object_dispose(v85, 8);

  _Block_object_dispose(v87, 8);
  _Block_object_dispose(&v89, 8);
}

- (void)_updatePluginsForExtensions:(id)a3 extensionPoint:(id)a4 precachedBalloonAppExtensions:(id)a5
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v118 = v8;
  uint64_t v13 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CA80], v11, (uint64_t)v8, v12);
  uint64_t v16 = objc_msgSend__currentlyInstalledExtensionsExcludingExtensionPoint_(self, v14, (uint64_t)v9, v15);
  objc_msgSend_unionSet_(v13, v17, (uint64_t)v16, v18);
  objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4F1CAC0], v19, (uint64_t)self, (uint64_t)sel__removePluginsWithDelay, 0);
  uint64_t v23 = objc_msgSend__appProxyBundleIdentifiersForAppPlugins(self, v20, v21, v22);
  uint64_t v27 = objc_msgSend__proxyIdentifiersForPlugins(self, v24, v25, v26);
  uint64_t v155 = 0;
  v156 = &v155;
  uint64_t v157 = 0x3032000000;
  v158 = sub_1A4B344DC;
  v159 = sub_1A4B34354;
  id v160 = 0;
  id v28 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v32 = objc_msgSend_count(v13, v29, v30, v31);
  id v160 = (id)objc_msgSend_initWithCapacity_(v28, v33, v32, v34);
  uint64_t v149 = 0;
  v150 = &v149;
  uint64_t v151 = 0x3032000000;
  v152 = sub_1A4B344DC;
  v153 = sub_1A4B34354;
  id v154 = 0;
  v147[0] = 0;
  v147[1] = v147;
  v147[2] = 0x3032000000;
  v147[3] = sub_1A4B344DC;
  v147[4] = sub_1A4B34354;
  id v148 = 0;
  v145[0] = 0;
  v145[1] = v145;
  v145[2] = 0x3032000000;
  v145[3] = sub_1A4B344DC;
  v145[4] = sub_1A4B34354;
  id v146 = 0;
  uint64_t v141 = 0;
  uint64_t v142 = &v141;
  uint64_t v143 = 0x2020000000;
  uint64_t v144 = 0;
  uint64_t v137 = 0;
  objc_super v138 = &v137;
  uint64_t v139 = 0x2020000000;
  uint64_t v140 = 0;
  uint64_t v131 = 0;
  id v132 = &v131;
  uint64_t v133 = 0x3032000000;
  long long v134 = sub_1A4B344DC;
  long long v135 = sub_1A4B34354;
  id v136 = 0;
  uint64_t v38 = objc_msgSend_model(self, v35, v36, v37);
  uint64_t v42 = objc_msgSend_pluginsToRemoveAfterExtensionsUpdate(v38, v39, v40, v41);
  id v136 = (id)objc_msgSend_mutableCopy(v42, v43, v44, v45);

  v119[0] = MEMORY[0x1E4F143A8];
  v119[1] = 3221225472;
  v119[2] = sub_1A4B2C85C;
  v119[3] = &unk_1E5B7CC70;
  uint64_t v124 = &v155;
  v125 = &v131;
  id v46 = v23;
  v126 = &v149;
  v127 = v147;
  id v120 = v46;
  uint64_t v121 = self;
  v128 = v145;
  id v47 = v10;
  id v122 = v47;
  id v48 = v27;
  id v123 = v48;
  v129 = &v141;
  v130 = &v137;
  objc_msgSend_enumerateObjectsUsingBlock_(v13, v49, (uint64_t)v119, v50);
  uint64_t v54 = objc_msgSend_model(self, v51, v52, v53);
  uint64_t v58 = objc_msgSend_copy((void *)v132[5], v55, v56, v57);
  objc_msgSend_setPluginsToRemoveAfterExtensionsUpdate_(v54, v59, (uint64_t)v58, v60);

  objc_msgSend_minusSet_(v46, v61, v156[5], v62);
  if (objc_msgSend_count(v46, v63, v64, v65))
  {
    objc_msgSend__setPluginsToRemoveAndCallSelectorWithDelay_(self, v66, (uint64_t)v46, v67);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v74 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v74, OS_LOG_TYPE_INFO, "Clearing extensions to remove after delay", buf, 2u);
      }
    }
    v75 = objc_msgSend_model(self, v71, v72, v73);
    uint64_t v79 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v76, v77, v78);
    objc_msgSend_setPluginsToRemoveAfterExtensionsUpdate_(v75, v80, (uint64_t)v79, v81);
  }
  if (v150[5] && IMOSLoggingEnabled())
  {
    id v82 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
    {
      uint64_t v83 = v150[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v162 = v83;
      _os_log_impl(&dword_1A4AF7000, v82, OS_LOG_TYPE_INFO, "app extension loading time: %@", buf, 0xCu);
    }
  }
  objc_msgSend__moveExtensionDataSourcesFromMessagesExtensionPluginToAppExtensions(self, v68, v69, v70);
  objc_msgSend__postInstalledAppsChangedNotification(self, v84, v85, v86);
  if ((byte_1E965E8D0 & 1) == 0 && objc_msgSend_isEqualToString_(v9, v87, *MEMORY[0x1E4F6D570], v88))
  {
    uint64_t v92 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E890], v89, v90, v91);
    v93 = NSNumber;
    uint64_t v97 = objc_msgSend_count(v13, v94, v95, v96);
    v100 = objc_msgSend_numberWithUnsignedInteger_(v93, v98, v97, v99);
    objc_msgSend_trackEvent_withCount_(v92, v101, *MEMORY[0x1E4F6DC48], (uint64_t)v100);

    v105 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E890], v102, v103, v104);
    uint64_t v108 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v106, v142[3], v107);
    objc_msgSend_trackEvent_withCount_(v105, v109, *MEMORY[0x1E4F6DC40], (uint64_t)v108);

    uint64_t v113 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E890], v110, v111, v112);
    v116 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v114, v138[3], v115);
    objc_msgSend_trackEvent_withCount_(v113, v117, *MEMORY[0x1E4F6DC90], (uint64_t)v116);
  }
  _Block_object_dispose(&v131, 8);

  _Block_object_dispose(&v137, 8);
  _Block_object_dispose(&v141, 8);
  _Block_object_dispose(v145, 8);

  _Block_object_dispose(v147, 8);
  _Block_object_dispose(&v149, 8);

  _Block_object_dispose(&v155, 8);
}

- (void)_postInstalledAppsChangedNotification
{
  uint64_t v5 = objc_msgSend_model(self, a2, v2, v3);
  char hasCompletedInitialization = objc_msgSend_hasCompletedInitialization(v5, v6, v7, v8);

  int v10 = IMOSLoggingEnabled();
  if (hasCompletedInitialization)
  {
    if (v10)
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v20 = 0;
        _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Posting notification IMBalloonPluginManagerInstalledAppsChangedNotification", v20, 2u);
      }
    }
    uint64_t v15 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v11, v12, v13);
    objc_msgSend___mainThreadPostNotificationName_object_(v15, v16, @"__kIMBalloonPluginManagerInstalledAppsChangedNotification", 0);
  }
  else
  {
    if (v10)
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Deffering IMBalloonPluginManagerInstalledAppsChangedNotification until after initialization is completed.", buf, 2u);
      }
    }
    uint64_t v15 = objc_msgSend_model(self, v11, v12, v13);
    objc_msgSend_setHasDeferredInstalledAppsChangedNotification_(v15, v18, 1, v19);
  }
}

- (void)_moveExtensionDataSourcesFromMessagesExtensionPluginToAppExtensions
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_model(self, a2, v2, v3);
  id v9 = objc_msgSend_pluginsMap(v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_pluginForIdentifier_(v9, v10, *MEMORY[0x1E4F6CBE8], v11);

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v16 = objc_msgSend_messageToDatasourceMap(v12, v13, v14, v15);
  uint64_t v20 = objc_msgSend_allKeys(v16, v17, v18, v19);

  id obj = v20;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v52, (uint64_t)v56, 16);
  if (v22)
  {
    uint64_t v26 = v22;
    uint64_t v27 = *(void *)v53;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v53 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void *)(*((void *)&v52 + 1) + 8 * v28);
        uint64_t v30 = objc_msgSend_messageToDatasourceMap(v12, v23, v24, v25);
        id v33 = objc_msgSend_objectForKey_(v30, v31, v29, v32);

        uint64_t v37 = objc_msgSend_bundleID(v33, v34, v35, v36);
        uint64_t v40 = objc_msgSend_balloonPluginForBundleID_(self, v38, (uint64_t)v37, v39);

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v43 = objc_msgSend_existingDataSourceForMessageGUID_(v40, v41, v29, v42);

          if (!v43)
          {
            objc_msgSend_insertDataSource_forGUID_(v40, v44, (uint64_t)v33, v29);
            id v48 = objc_msgSend_messageToDatasourceMap(v12, v45, v46, v47);
            objc_msgSend_removeObjectForKey_(v48, v49, v29, v50);
          }
        }

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v52, (uint64_t)v56, 16);
    }
    while (v26);
  }
}

- (id)_currentlyInstalledExtensionsExcludingExtensionPoint:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v5, v6, v7);
  uint64_t v12 = objc_msgSend_model(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_pluginsMap(v12, v13, v14, v15);
  uint64_t v20 = objc_msgSend_dictionaryMapCopy(v16, v17, v18, v19);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1A4B06FD8;
  v28[3] = &unk_1E5B7CBB0;
  id v29 = v4;
  id v21 = v8;
  id v30 = v21;
  id v22 = v4;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v20, v23, (uint64_t)v28, v24);

  uint64_t v25 = v30;
  id v26 = v21;

  return v26;
}

- (id)_proxyIdentifiersForPlugins
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = objc_msgSend_model(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_pluginsMap(v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_pluginCount(v11, v12, v13, v14);
  uint64_t v18 = objc_msgSend_initWithCapacity_(v3, v16, v15, v17);

  id v22 = objc_msgSend_model(self, v19, v20, v21);
  id v26 = objc_msgSend_pluginsMap(v22, v23, v24, v25);
  id v30 = objc_msgSend_dictionaryMapCopy(v26, v27, v28, v29);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = sub_1A4B0909C;
  v35[3] = &unk_1E5B7BE98;
  id v31 = v18;
  id v36 = v31;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v30, v32, (uint64_t)v35, v33);

  return v31;
}

- (void)_loadAppExtensionDataSources
{
  id v4 = objc_msgSend__loadAppExtensionDataSourcesForExtensionPoint_(self, a2, *MEMORY[0x1E4F6D570], v2);
  uint64_t v8 = objc_msgSend_model(self, v5, v6, v7);
  objc_msgSend_setExtensionMatchingContext_(v8, v9, (uint64_t)v4, v10);

  objc_msgSend__loadAppExtensionDataSourcesForExtensionPoint_(self, v11, *MEMORY[0x1E4F6D578], v12);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_model(self, v13, v14, v15);
  objc_msgSend_setHighMemoryExtensionMatchingContext_(v16, v17, (uint64_t)v19, v18);
}

- (id)_loadAppExtensionDataSourcesForExtensionPoint:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (byte_1E965E8D0)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
    uint64_t v9 = objc_msgSend_stringWithFormat_(NSString, v7, @"beginMatchingExtensionsWithAttributes_%@", v8, v4);
    objc_msgSend_startTimingForKey_(v6, v10, (uint64_t)v9, v11);
    uint64_t v26 = *MEMORY[0x1E4F282B0];
    v27[0] = v4;
    uint64_t v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)v27, (uint64_t)&v26, 1);
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v14 = (void *)MEMORY[0x1E4F28C70];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1A4B05438;
    v19[3] = &unk_1E5B7CC00;
    id v15 = v6;
    id v20 = v15;
    id v16 = v9;
    id v21 = v16;
    id v22 = v4;
    objc_copyWeak(&v24, &location);
    uint64_t v23 = self;
    uint64_t v5 = objc_msgSend_beginMatchingExtensionsWithAttributes_completion_(v14, v17, (uint64_t)v13, (uint64_t)v19);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&location);
  }

  return v5;
}

- (id)_insertPluginForExtension:(id)a3 balloonProviderBundle:(id)a4 precachedBalloonAppExtensions:(id)a5 timingCollection:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v17 = objc_msgSend_identifier(v10, v14, v15, v16);
  if (!v10
    || (uint64_t v18 = objc_opt_class(),
        !objc_msgSend__allowExtensionWithIdentifier_(v18, v19, (uint64_t)v17, v20)))
  {
    uint64_t v25 = 0;
    goto LABEL_20;
  }
  objc_msgSend_startTimingForKey_(v13, v21, @"createPlugin", v22);
  uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v12, v23, (uint64_t)v17, v24);
  int v26 = IMOSLoggingEnabled();
  if (v25)
  {
    if (v26)
    {
      id v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        int v56 = 138412290;
        uint64_t v57 = v17;
        _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "Using precached plugin for %@", (uint8_t *)&v56, 0xCu);
      }
    }
  }
  else
  {
    if (v26)
    {
      id v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        int v56 = 138412290;
        uint64_t v57 = v17;
        _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "No precached plugin for %@, creating a new instance", (uint8_t *)&v56, 0xCu);
      }
    }
    uint64_t v32 = [IMBalloonAppExtension alloc];
    uint64_t v25 = objc_msgSend_initWithPluginBundle_extension_(v32, v33, (uint64_t)v11, (uint64_t)v10);
  }
  uint64_t v34 = objc_msgSend_identifier(v25, v27, v28, v29);
  uint64_t v35 = IMBalloonExtensionIDWithSuffix();
  int isEqualToString = objc_msgSend_isEqualToString_(v34, v36, (uint64_t)v35, v37);

  int v39 = _os_feature_enabled_impl();
  if (isEqualToString)
  {
    if (v39) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v43 = objc_msgSend_identifier(v25, v40, v41, v42);
    BOOL v44 = v43 == 0;

    if (!v44)
    {
LABEL_18:
      uint64_t v45 = objc_msgSend_model(self, v40, v41, v42);
      uint64_t v49 = objc_msgSend_pluginsMap(v45, v46, v47, v48);
      long long v53 = objc_msgSend_identifier(v25, v50, v51, v52);
      objc_msgSend_setPlugin_forIdentifier_(v49, v54, (uint64_t)v25, (uint64_t)v53);
    }
  }
  objc_msgSend_stopTimingForKey_(v13, v40, @"createPlugin", v42);
LABEL_20:

  return v25;
}

- (id)_appProxyBundleIdentifiersForAppPlugins
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_model(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_pluginsMap(v5, v6, v7, v8);
  id v13 = objc_msgSend_allIdentifiers(v9, v10, v11, v12);

  id v56 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v14 = v13;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v57, (uint64_t)v61, 16);
  if (v16)
  {
    uint64_t v20 = v16;
    uint64_t v21 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v58 != v21) {
          objc_enumerationMutation(v14);
        }
        uint64_t v23 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v24 = objc_msgSend_model(self, v17, v18, v19);
        uint64_t v28 = objc_msgSend_pluginsMap(v24, v25, v26, v27);
        id v31 = objc_msgSend_pluginForIdentifier_(v28, v29, v23, v30);

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v35 = objc_msgSend_proxy(v31, v32, v33, v34);
          if (v35)
          {
            int v39 = (void *)v35;
            uint64_t v40 = objc_msgSend_proxy(v31, v36, v37, v38);
            BOOL v44 = objc_msgSend_bundleIdentifier(v40, v41, v42, v43);

            if (v44)
            {
              uint64_t v48 = objc_msgSend_proxy(v31, v45, v46, v47);
              uint64_t v52 = objc_msgSend_bundleIdentifier(v48, v49, v50, v51);
              objc_msgSend_addObject_(v56, v53, (uint64_t)v52, v54);
            }
          }
        }
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v57, (uint64_t)v61, 16);
    }
    while (v20);
  }

  return v56;
}

- (IMBalloonPluginManagerModel)model
{
  return self->_model;
}

+ (id)precacheBalloonAppExtensionsForExtensions:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v31 = objc_msgSend_balloonProviderBundlePathURL(a1, v5, v6, v7);
  id v8 = objc_alloc(MEMORY[0x1E4F28B50]);
  uint64_t v11 = objc_msgSend_initWithURL_(v8, v9, (uint64_t)v31, v10);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = v4;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v33, (uint64_t)v39, 16);
  if (v17)
  {
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v12);
        }
        uint64_t v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v23 = objc_msgSend_identifier(v20, v14, v15, v16);
        if (v23 && objc_msgSend__allowExtensionWithIdentifier_(a1, v21, (uint64_t)v23, v22))
        {
          uint64_t v24 = [IMBalloonAppExtension alloc];
          uint64_t v26 = objc_msgSend_initWithPluginBundle_extension_(v24, v25, (uint64_t)v11, (uint64_t)v20);
          objc_msgSend_setObject_forKeyedSubscript_(v32, v27, (uint64_t)v26, (uint64_t)v23);
          if (IMOSLoggingEnabled())
          {
            uint64_t v28 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v38 = v23;
              _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "Precached balloon app extension for %@", buf, 0xCu);
            }
          }
        }
        else if (IMOSLoggingEnabled())
        {
          uint64_t v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v38 = v23;
            _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "Not precached balloon app extension for %@, identifier was blocked", buf, 0xCu);
          }
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v33, (uint64_t)v39, 16);
    }
    while (v17);
  }

  return v32;
}

+ (BOOL)_allowExtensionWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], v5, 1, v6);
  char isServerBlocklistedBundleIdentifier_serverBag = objc_msgSend__isServerBlocklistedBundleIdentifier_serverBag_(a1, v8, (uint64_t)v4, (uint64_t)v7);

  if (isServerBlocklistedBundleIdentifier_serverBag) {
    LOBYTE(v12) = 0;
  }
  else {
    int v12 = objc_msgSend__isExtensionBlocklisted_(a1, v10, (uint64_t)v4, v11) ^ 1;
  }

  return v12;
}

+ (BOOL)_isServerBlocklistedBundleIdentifier:(id)a3 serverBag:(id)a4
{
  return MEMORY[0x1F4124400](a3, a4);
}

+ (BOOL)_isExtensionBlocklisted:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isRunningPPT(a1, v5, v6, v7) & 1) != 0 || (IMGetDomainBoolForKey())
  {
    char v11 = 0;
  }
  else
  {
    int v12 = objc_msgSend__extensionBlocklist(a1, v8, v9, v10);
    char v11 = objc_msgSend_containsObject_(v12, v13, (uint64_t)v4, v14);
  }
  return v11;
}

+ (BOOL)isRunningPPT
{
  return byte_1E965E8D8;
}

+ (id)_extensionBlocklist
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4AFBA88;
  block[3] = &unk_1E5B7B2A8;
  block[4] = a1;
  if (qword_1EB3F2198 != -1) {
    dispatch_once(&qword_1EB3F2198, block);
  }
  uint64_t v2 = (void *)qword_1EB3F21A0;

  return v2;
}

- (BOOL)_shouldSkipUpdatingPluginBundleIdentifier:(id)a3
{
  id v3 = a3;
  int IsLockedDown = objc_msgSend_deviceIsLockedDown(MEMORY[0x1E4F6E730], v4, v5, v6);
  char isEqualToString = objc_msgSend_isEqualToString_(v3, v8, *MEMORY[0x1E4F6CAF8], v9);
  uint64_t v14 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v11, v12, v13);
  if (objc_msgSend_isStickersAppEnabled(v14, v15, v16, v17))
  {
  }
  else
  {
    uint64_t v24 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v18, v19, v20);
    char v28 = isEqualToString & ~objc_msgSend_isClingEnabled(v24, v25, v26, v27);

    if (v28)
    {
LABEL_6:
      char v39 = 1;
      goto LABEL_15;
    }
  }
  uint64_t v29 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v21, v22, v23);
  if ((objc_msgSend_isWaldoEnabled(v29, v30, v31, v32) ^ 1 | IsLockedDown) == 1)
  {
    char v35 = objc_msgSend_isEqualToString_(v3, v33, *MEMORY[0x1E4F6CB30], v34);

    if (v35) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v40 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v36, v37, v38);
  if (objc_msgSend_isZelkovaEnabled(v40, v41, v42, v43))
  {
    uint64_t v47 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v44, v45, v46);
    if (objc_msgSend_isSendMenuEnabled(v47, v48, v49, v50)) {
      char v39 = 0;
    }
    else {
      char v39 = objc_msgSend_isEqualToString_(v3, v51, *MEMORY[0x1E4F6CB28], v52);
    }
  }
  else
  {
    char v39 = objc_msgSend_isEqualToString_(v3, v44, *MEMORY[0x1E4F6CB28], v46);
  }

LABEL_15:
  return v39;
}

- (id)_insertPluginForAppBundle:(id)a3 balloonProviderBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [IMBalloonAppExtension alloc];
    uint64_t v10 = objc_msgSend_initWithPluginBundle_appBundle_(v8, v9, (uint64_t)v7, (uint64_t)v6);
    uint64_t v14 = objc_msgSend_identifier(v10, v11, v12, v13);

    if (v14)
    {
      uint64_t v18 = objc_msgSend_model(self, v15, v16, v17);
      uint64_t v22 = objc_msgSend_pluginsMap(v18, v19, v20, v21);
      uint64_t v26 = objc_msgSend_identifier(v10, v23, v24, v25);
      objc_msgSend_setPlugin_forIdentifier_(v22, v27, (uint64_t)v10, (uint64_t)v26);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)balloonProviderBundlePathURL
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = IMBalloonProviderBundleRootDirectory();
  v10[0] = v3;
  v10[1] = @"MSMessageExtensionBalloonPlugin.bundle";
  uint64_t v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v10, 2);
  id v8 = objc_msgSend_fileURLWithPathComponents_(v2, v6, (uint64_t)v5, v7);

  return v8;
}

- (void)_findPluginsInPaths:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v80 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  objc_msgSend_startTimingForKey_(v80, v5, @"loadPlugins", v6);
  id v82 = self;
  uint64_t v10 = objc_msgSend_signpostLogHandle(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_signpostLogHandle(v82, v11, v12, v13);
  os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, "findPluginsInPaths");

  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4AF7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v15, "findPluginsInPaths", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v81 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v16, v17, v18);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id obj = v4;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v84, (uint64_t)v90, 16);
  if (v22)
  {
    uint64_t v23 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v85 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v84 + 1) + 8 * i);
        if (byte_1E965E8D0 != 1
          || objc_msgSend_hasSuffix_(*(void **)(*((void *)&v84 + 1) + 8 * i), v20, @"MSMessageExtensionBalloonPlugin.bundle", v21))
        {
          uint64_t v26 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v20, v25, v21);
          id v27 = objc_alloc(MEMORY[0x1E4F28B50]);
          uint64_t v30 = objc_msgSend_initWithURL_(v27, v28, (uint64_t)v26, v29);
          uint64_t v37 = objc_msgSend_bundleIdentifier(v30, v31, v32, v33);
          if (!v37) {
            goto LABEL_39;
          }
          uint64_t v38 = objc_msgSend_model(v82, v34, v35, v36);
          uint64_t v42 = objc_msgSend_pluginsMap(v38, v39, v40, v41);
          uint64_t v45 = objc_msgSend_pluginForIdentifier_(v42, v43, (uint64_t)v37, v44);
          BOOL v46 = v45 == 0;

          if (v46)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v48 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v89 = v37;
                _os_log_impl(&dword_1A4AF7000, v48, OS_LOG_TYPE_INFO, "Found plugin: %@", buf, 0xCu);
              }
            }
            uint64_t v49 = [IMBalloonPlugin alloc];
            long long v53 = objc_msgSend_initWithBundle_(v49, v50, (uint64_t)v30, v51);
            if (v53) {
              objc_msgSend_setObject_forKey_(v81, v52, (uint64_t)v53, (uint64_t)v37);
            }
          }
          else
          {
LABEL_39:
            if (IMOSLoggingEnabled())
            {
              uint64_t v47 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v89 = v30;
                _os_log_impl(&dword_1A4AF7000, v47, OS_LOG_TYPE_INFO, "Failed to get bundle identifier for %@", buf, 0xCu);
              }
            }
          }
        }
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v84, (uint64_t)v90, 16);
    }
    while (v22);
  }

  if (objc_msgSend_count(v81, v54, v55, v56))
  {
    long long v60 = objc_msgSend_model(v82, v57, v58, v59);
    uint64_t v64 = objc_msgSend_pluginsMap(v60, v61, v62, v63);
    uint64_t v68 = objc_msgSend_copy(v81, v65, v66, v67);
    objc_msgSend_updateWithMap_(v64, v69, (uint64_t)v68, v70);
  }
  uint64_t v71 = objc_msgSend_signpostLogHandle(v82, v57, v58, v59);
  v75 = objc_msgSend_signpostLogHandle(v82, v72, v73, v74);
  os_signpost_id_t v76 = os_signpost_id_make_with_pointer(v75, "findPluginsInPaths");

  if (v76 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4AF7000, v71, OS_SIGNPOST_INTERVAL_END, v76, "findPluginsInPaths", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend_stopTimingForKey_(v80, v77, @"loadPlugins", v78);
  if (IMOSLoggingEnabled())
  {
    uint64_t v79 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v89 = v80;
      _os_log_impl(&dword_1A4AF7000, v79, OS_LOG_TYPE_INFO, "Find Plugin time: %@", buf, 0xCu);
    }
  }
}

- (void)_loadAllDataSources
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  objc_msgSend_startTimingForKey_(v3, v4, @"loadAllDataSources", v5);
  uint64_t v9 = objc_msgSend_signpostLogHandle(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_signpostLogHandle(self, v10, v11, v12);
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, "loadAllDataSources");

  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v41) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4AF7000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v14, "loadAllDataSources", " enableTelemetry=YES ", (uint8_t *)&v41, 2u);
  }

  if (IMGetDomainBoolForKey())
  {
    os_signpost_id_t v15 = IMBalloonProviderBundleRootDirectory();
    objc_msgSend__findPluginsInPathInternal_(self, v16, (uint64_t)v15, v17);

    objc_msgSend__findPluginsInPathInternal_(self, v18, @"/AppleInternal/Library/Bundles/Messages/iMessageBalloons/", v19);
  }
  else
  {
    uint64_t v23 = IMBalloonProviderBundlePaths();
    objc_msgSend__findPluginsInPaths_(self, v24, (uint64_t)v23, v25);
  }
  objc_msgSend__loadAppBundleDataSources(self, v20, v21, v22);
  objc_msgSend__loadAppExtensionDataSources(self, v26, v27, v28);
  uint64_t v32 = objc_msgSend_signpostLogHandle(self, v29, v30, v31);
  uint64_t v36 = objc_msgSend_signpostLogHandle(self, v33, v34, v35);
  os_signpost_id_t v37 = os_signpost_id_make_with_pointer(v36, "loadAllDataSources");

  if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    LOWORD(v41) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4AF7000, v32, OS_SIGNPOST_INTERVAL_END, v37, "loadAllDataSources", " enableTelemetry=YES ", (uint8_t *)&v41, 2u);
  }

  objc_msgSend_stopTimingForKey_(v3, v38, @"loadAllDataSources", v39);
  if (IMOSLoggingEnabled())
  {
    uint64_t v40 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      int v41 = 138412290;
      id v42 = v3;
      _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "Finished loading all data sources: %@", (uint8_t *)&v41, 0xCu);
    }
  }
}

- (id)signpostLogHandle
{
  uint64_t v2 = objc_opt_class();

  return (id)objc_msgSend_signpostLogHandle(v2, v3, v4, v5);
}

+ (id)signpostLogHandle
{
  if (qword_1EB3F21B0 != -1) {
    dispatch_once(&qword_1EB3F21B0, &unk_1EF8E5338);
  }
  uint64_t v2 = (void *)qword_1EB3F21B8;

  return v2;
}

- (void)insertPlugin:(id)a3
{
  id v4 = a3;
  objc_msgSend_model(self, v5, v6, v7);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_pluginsMap(v17, v8, v9, v10);
  os_signpost_id_t v15 = objc_msgSend_identifier(v4, v12, v13, v14);
  objc_msgSend_setPlugin_forIdentifier_(v11, v16, (uint64_t)v4, (uint64_t)v15);
}

+ (void)disableExtensionDiscovery
{
  byte_1E965E8D0 = 1;
}

+ (void)enableAlternatePathPlugins
{
  byte_1E965E8D1 = 1;
}

+ (void)setIsRunningPPT:(BOOL)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  byte_1E965E8D8 = a3;
  if (a3)
  {
    uint64_t v5 = objc_msgSend_sharedInstance(IMBalloonPluginManager, a2, a3, v3);
    uint64_t v39 = objc_msgSend_balloonProviderBundlePathURL(a1, v6, v7, v8);
    id v9 = objc_alloc(MEMORY[0x1E4F28B50]);
    uint64_t v12 = objc_msgSend_initWithURL_(v9, v10, (uint64_t)v39, v11);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v16 = objc_msgSend__extensionBlocklist(a1, v13, v14, v15);
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v41, (uint64_t)v47, 16);
    if (v21)
    {
      uint64_t v22 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v42 != v22) {
            objc_enumerationMutation(v16);
          }
          uint64_t v24 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v25 = objc_msgSend_model(v5, v18, v19, v20);
          uint64_t v29 = objc_msgSend_pluginsMap(v25, v26, v27, v28);
          uint64_t v32 = objc_msgSend_pluginForIdentifier_(v29, v30, v24, v31);
          BOOL v33 = v32 == 0;

          if (v33)
          {
            id v40 = 0;
            uint64_t v34 = objc_msgSend_extensionWithIdentifier_error_(MEMORY[0x1E4F28C70], v18, v24, (uint64_t)&v40);
            id v36 = v40;
            if (!v34 && IMOSLoggingEnabled())
            {
              os_signpost_id_t v37 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v46 = v24;
                _os_log_impl(&dword_1A4AF7000, v37, OS_LOG_TYPE_INFO, "Failed to load previously blocklisted extension for identifier %@", buf, 0xCu);
              }
            }
            id v38 = (id)objc_msgSend__insertPluginForExtension_balloonProviderBundle_precachedBalloonAppExtensions_timingCollection_(v5, v35, (uint64_t)v34, (uint64_t)v12, 0, 0);
          }
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v41, (uint64_t)v47, 16);
      }
      while (v21);
    }
  }
}

- (void)pluginChatItem:(id)a3 didRelinquishReusableController:(id)a4 contextIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v14 = objc_msgSend_type(v10, v11, v12, v13);
  objc_msgSend_balloonPluginForBundleID_(self, v15, (uint64_t)v14, v16);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_moveController_toReusePoolFromChatItem_contextIdentifier_(v18, v17, (uint64_t)v9, (uint64_t)v10, v8);
}

- (void)pluginChatItem:(id)a3 didRelenquishNonResuableController:(id)a4 contextIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v14 = objc_msgSend_type(v10, v11, v12, v13);
  objc_msgSend_balloonPluginForBundleID_(self, v15, (uint64_t)v14, v16);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_removeController_forChatItem_contextIdentifier_(v18, v17, (uint64_t)v9, (uint64_t)v10, v8);
}

- (void)dealloc
{
  notify_cancel(dword_1EB3F1E88);
  uint64_t v3 = (void *)MEMORY[0x1E4F28C70];
  uint64_t v7 = objc_msgSend_model(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_extensionMatchingContext(v7, v8, v9, v10);
  objc_msgSend_endMatchingExtensions_(v3, v12, (uint64_t)v11, v13);

  uint64_t v14 = (void *)MEMORY[0x1E4F28C70];
  id v18 = objc_msgSend_model(self, v15, v16, v17);
  uint64_t v22 = objc_msgSend_highMemoryExtensionMatchingContext(v18, v19, v20, v21);
  objc_msgSend_endMatchingExtensions_(v14, v23, (uint64_t)v22, v24);

  v25.receiver = self;
  v25.super_class = (Class)IMBalloonPluginManager;
  [(IMBalloonPluginManager *)&v25 dealloc];
}

- (id)_pluginPlistPath:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_model(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_pluginMetaDataFolder(v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_lastPathComponent(v4, v13, v14, v15);

  uint64_t v19 = objc_msgSend_stringByAppendingPathExtension_(v16, v17, @"plist", v18);
  uint64_t v22 = objc_msgSend_stringByAppendingPathComponent_(v12, v20, (uint64_t)v19, v21);

  return v22;
}

- (id)_infoPlistPathForPluginCreatingFolderIfNeeded:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_model(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_pluginMetaDataFolder(v8, v9, v10, v11);
  IMSharedHelperEnsureDirectoryExistsAtPath();

  uint64_t v15 = objc_msgSend__pluginPlistPath_(self, v13, (uint64_t)v4, v14);

  return v15;
}

- (id)_metadataForPluginIdentifier:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    id v8 = objc_msgSend_model(self, v4, v5, v6);
    uint64_t v12 = objc_msgSend_pluginIDToMetadataCache(v8, v9, v10, v11);
    objc_msgSend_objectForKey_(v12, v13, (uint64_t)v7, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int v51 = 138412290;
          id v52 = v7;
          _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_INFO, "Reading plugin metadata from disk for ID %@", (uint8_t *)&v51, 0xCu);
        }
      }
      uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v23 = objc_msgSend__infoPlistPathForPluginCreatingFolderIfNeeded_(self, v19, (uint64_t)v7, v20);
      objc_msgSend_dictionaryWithContentsOfFile_(v22, v24, (uint64_t)v23, v25);
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
        if (IMOSLoggingEnabled())
        {
          uint64_t v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            int v51 = 138412290;
            id v52 = v7;
            _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, "No metadataForPluginIdentifer %@", (uint8_t *)&v51, 0xCu);
          }
        }
      }
    }
    if (objc_msgSend_count(v15, v16, v17, v18))
    {
      uint64_t v30 = objc_msgSend_model(self, v27, v28, v29);
      uint64_t v34 = objc_msgSend_pluginIDToMetadataCache(v30, v31, v32, v33);
      id v38 = objc_msgSend_mutableCopy(v34, v35, v36, v37);

      objc_msgSend_setObject_forKey_(v38, v39, (uint64_t)v15, (uint64_t)v7);
      long long v43 = objc_msgSend_model(self, v40, v41, v42);
      uint64_t v47 = objc_msgSend_copy(v38, v44, v45, v46);
      objc_msgSend_setPluginIDToMetadataCache_(v43, v48, (uint64_t)v47, v49);
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)_storeMetadata:(id)a3 _forPlugin:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = v7;
  if (v6 && v7)
  {
    uint64_t v11 = objc_msgSend__infoPlistPathForPluginCreatingFolderIfNeeded_(self, v8, (uint64_t)v7, v9);
    id v15 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v12, v13, v14);
    int v18 = objc_msgSend_fileExistsAtPath_(v15, v16, (uint64_t)v11, v17);

    if (v18)
    {
      uint64_t v22 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v19, v20, v21);
      id v62 = 0;
      objc_msgSend_removeItemAtPath_error_(v22, v23, (uint64_t)v11, (uint64_t)&v62);
      id v24 = v62;

      if (v24 && IMOSLoggingEnabled())
      {
        uint64_t v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v66 = v11;
          __int16 v67 = 2112;
          id v68 = v24;
          _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "IMBalloonPluginManager could not delete file at path %@ error %@", buf, 0x16u);
        }
      }
    }
    if ((objc_msgSend_writeToFile_atomically_(v6, v19, (uint64_t)v11, 1) & 1) == 0
      && IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v66 = v6;
        __int16 v67 = 2112;
        id v68 = v11;
        __int16 v69 = 2112;
        uint64_t v70 = v10;
        _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "IMBalloonPluginManager could not write metadata %@ to file %@ idenitifier %@", buf, 0x20u);
      }
    }
    uint64_t v30 = objc_msgSend_model(self, v26, v27, v28);
    uint64_t v34 = objc_msgSend_pluginIDToMetadataCache(v30, v31, v32, v33);
    id v38 = objc_msgSend_mutableCopy(v34, v35, v36, v37);

    objc_msgSend_setObject_forKey_(v38, v39, (uint64_t)v6, (uint64_t)v10);
    long long v43 = objc_msgSend_model(self, v40, v41, v42);
    uint64_t v47 = objc_msgSend_copy(v38, v44, v45, v46);
    objc_msgSend_setPluginIDToMetadataCache_(v43, v48, (uint64_t)v47, v49);

    uint64_t v53 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v50, v51, v52);
    uint64_t v63 = *MEMORY[0x1E4F28370];
    uint64_t v64 = *MEMORY[0x1E4F28358];
    uint64_t v55 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v54, (uint64_t)&v64, (uint64_t)&v63, 1);
    id v61 = 0;
    char v57 = objc_msgSend_setAttributes_ofItemAtPath_error_(v53, v56, (uint64_t)v55, (uint64_t)v11, &v61);
    id v58 = v61;

    if ((v57 & 1) == 0 && IMOSLoggingEnabled())
    {
      uint64_t v59 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v66 = v11;
        __int16 v67 = 2112;
        id v68 = v58;
        _os_log_impl(&dword_1A4AF7000, v59, OS_LOG_TYPE_INFO, "Failed making file class C: %@ with error %@", buf, 0x16u);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    long long v60 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v66 = v6;
      __int16 v67 = 2112;
      id v68 = v10;
      _os_log_impl(&dword_1A4AF7000, v60, OS_LOG_TYPE_INFO, "IMBalloonPluginManager invalid args to _storeMetadata %@ identifier %@", buf, 0x16u);
    }
  }
}

- (id)localParticipantIdentifierForAppID:(id)a3 conversationID:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  id v9 = a4;
  if (v6)
  {
    uint64_t v10 = objc_msgSend__metadataForPluginIdentifier_(self, v7, (uint64_t)v6, v8);
    Mutable = objc_msgSend_mutableCopy(v10, v11, v12, v13);

    objc_msgSend_objectForKey_(Mutable, v15, @"localID", v16);
    uint64_t v17 = (char *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v17, v18, v19, v20))
    {
      uint64_t v21 = v17;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          int v39 = 138412290;
          id v40 = v6;
          _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "Generating local ID for app %@", (uint8_t *)&v39, 0xCu);
        }
      }
      uint64_t v28 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v24, v25, v26);
      objc_msgSend_UUIDString(v28, v29, v30, v31);
      uint64_t v21 = (char *)objc_claimAutoreleasedReturnValue();

      if (!Mutable) {
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      }
      objc_msgSend_setObject_forKey_(Mutable, v32, (uint64_t)v21, @"localID");
      objc_msgSend__storeMetadata__forPlugin_(self, v33, (uint64_t)Mutable, (uint64_t)v6);
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        int v39 = 138412546;
        id v40 = v21;
        __int16 v41 = 2112;
        uint64_t v42 = v6;
        _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "localID %@ for appID %@", (uint8_t *)&v39, 0x16u);
      }
    }
    id v35 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v23 = objc_msgSend_initWithUUIDString_(v35, v36, (uint64_t)v21, v37);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v39 = 136315138;
        id v40 = "-[IMBalloonPluginManager localParticipantIdentifierForAppID:conversationID:]";
        _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "IMBalloonPluginManager %s appID = nil", (uint8_t *)&v39, 0xCu);
      }
    }
    uint64_t v23 = 0;
  }

  return v23;
}

- (id)recipientIDForRecipient:(id)a3 appID:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (char *)a4;
  uint64_t v10 = v7;
  if (v6 && v7)
  {
    uint64_t v11 = objc_msgSend__metadataForPluginIdentifier_(self, v8, (uint64_t)v7, v9);
    Mutable = objc_msgSend_mutableCopy(v11, v12, v13, v14);

    objc_msgSend_objectForKey_(Mutable, v16, (uint64_t)v6, v17);
    int v18 = (char *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v18, v19, v20, v21))
    {
      uint64_t v22 = v18;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          int v40 = 138412290;
          __int16 v41 = v10;
          _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "Generating recipientID ID for app %@", (uint8_t *)&v40, 0xCu);
        }
      }
      uint64_t v29 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v25, v26, v27);
      objc_msgSend_UUIDString(v29, v30, v31, v32);
      uint64_t v22 = (char *)objc_claimAutoreleasedReturnValue();

      if (!Mutable) {
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      }
      objc_msgSend_setObject_forKey_(Mutable, v33, (uint64_t)v22, (uint64_t)v6);
      objc_msgSend__storeMetadata__forPlugin_(self, v34, (uint64_t)Mutable, (uint64_t)v10);
    }
    if (IMOSLoggingEnabled())
    {
      id v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        int v40 = 138412546;
        __int16 v41 = v22;
        __int16 v42 = 2112;
        uint64_t v43 = v10;
        _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "recipient %@ for appID %@", (uint8_t *)&v40, 0x16u);
      }
    }
    id v36 = objc_alloc(MEMORY[0x1E4F29128]);
    id v24 = objc_msgSend_initWithUUIDString_(v36, v37, (uint64_t)v22, v38);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        int v40 = 136315650;
        __int16 v41 = "-[IMBalloonPluginManager recipientIDForRecipient:appID:]";
        __int16 v42 = 2112;
        uint64_t v43 = v10;
        __int16 v44 = 2112;
        id v45 = v6;
        _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "IMBalloonPluginManager %s appID: %@ recipient: %@ ", (uint8_t *)&v40, 0x20u);
      }
    }
    id v24 = 0;
  }

  return v24;
}

- (id)conversationID:(id)a3 appID:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (char *)a4;
  uint64_t v10 = v7;
  if (v6 && v7)
  {
    uint64_t v11 = objc_msgSend__metadataForPluginIdentifier_(self, v8, (uint64_t)v7, v9);
    Mutable = objc_msgSend_mutableCopy(v11, v12, v13, v14);

    objc_msgSend_objectForKey_(Mutable, v16, (uint64_t)v6, v17);
    int v18 = (char *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v18, v19, v20, v21))
    {
      uint64_t v22 = v18;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          int v40 = 138412290;
          __int16 v41 = v10;
          _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "Generating randomConversationID ID for app %@", (uint8_t *)&v40, 0xCu);
        }
      }
      uint64_t v29 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v25, v26, v27);
      objc_msgSend_UUIDString(v29, v30, v31, v32);
      uint64_t v22 = (char *)objc_claimAutoreleasedReturnValue();

      if (!Mutable) {
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      }
      objc_msgSend_setObject_forKey_(Mutable, v33, (uint64_t)v22, (uint64_t)v6);
      objc_msgSend__storeMetadata__forPlugin_(self, v34, (uint64_t)Mutable, (uint64_t)v10);
    }
    if (IMOSLoggingEnabled())
    {
      id v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        int v40 = 138412546;
        __int16 v41 = v22;
        __int16 v42 = 2112;
        uint64_t v43 = v10;
        _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "randomConversationID %@ for appID %@", (uint8_t *)&v40, 0x16u);
      }
    }
    id v36 = objc_alloc(MEMORY[0x1E4F29128]);
    id v24 = objc_msgSend_initWithUUIDString_(v36, v37, (uint64_t)v22, v38);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        int v40 = 136315650;
        __int16 v41 = "-[IMBalloonPluginManager conversationID:appID:]";
        __int16 v42 = 2112;
        uint64_t v43 = v10;
        __int16 v44 = 2112;
        id v45 = v6;
        _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "IMBalloonPluginManager %s appID: %@ recipient: %@ ", (uint8_t *)&v40, 0x20u);
      }
    }
    id v24 = 0;
  }

  return v24;
}

- (id)_identifiersForAppPlugins
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v7 = objc_msgSend_model(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_pluginsMap(v7, v8, v9, v10);
  id v15 = objc_msgSend_allIdentifiers(v11, v12, v13, v14);

  id obj = v15;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v17)
  {
    uint64_t v21 = v17;
    uint64_t v22 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(obj);
        }
        id v24 = *(const void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v25 = objc_msgSend_model(self, v18, v19, v20);
        uint64_t v29 = objc_msgSend_pluginsMap(v25, v26, v27, v28);
        uint64_t v32 = objc_msgSend_pluginForIdentifier_(v29, v30, (uint64_t)v24, v31);

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v3 && v24) {
          CFArrayAppendValue(v3, v24);
        }
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v35, (uint64_t)v39, 16);
    }
    while (v21);
  }

  return v3;
}

- (id)_pluginsForWhichWeHaveMetadata
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], a2, v2, v3);
  uint64_t v9 = objc_msgSend_model(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_pluginMetaDataFolder(v9, v10, v11, v12);
  id v59 = 0;
  id v15 = objc_msgSend_contentsOfDirectoryAtPath_error_(v5, v14, (uint64_t)v13, (uint64_t)&v59);
  id v16 = v59;

  uint64_t v20 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v17, v18, v19);
  id v24 = objc_msgSend_model(self, v21, v22, v23);
  uint64_t v28 = objc_msgSend_pluginMetaDataFolder(v24, v25, v26, v27);
  int v31 = objc_msgSend_fileExistsAtPath_(v20, v29, (uint64_t)v28, v30);
  if (v16) {
    int v32 = v31;
  }
  else {
    int v32 = 0;
  }

  if (v32)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        long long v37 = objc_msgSend_model(self, v34, v35, v36);
        __int16 v41 = objc_msgSend_pluginMetaDataFolder(v37, v38, v39, v40);
        *(_DWORD *)buf = 138412546;
        id v62 = v41;
        __int16 v63 = 2112;
        id v64 = v16;
        _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_INFO, "IMBalloonPluginManager could not read contents of dir %@ error %@", buf, 0x16u);
      }
    }
    id v42 = 0;
  }
  else
  {
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v43 = v15;
    uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v55, (uint64_t)v60, 16);
    if (v48)
    {
      uint64_t v49 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v56 != v49) {
            objc_enumerationMutation(v43);
          }
          uint64_t v51 = objc_msgSend_stringByDeletingPathExtension(*(void **)(*((void *)&v55 + 1) + 8 * i), v45, v46, v47, (void)v55);
          objc_msgSend_addObject_(v42, v52, (uint64_t)v51, v53);
        }
        uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v45, (uint64_t)&v55, (uint64_t)v60, 16);
      }
      while (v48);
    }
  }

  return v42;
}

- (void)_deleteMetaDataForPlugins:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v4;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "_deleteMetaDataForPlugins %@", buf, 0xCu);
    }
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v4;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v49, (uint64_t)v57, 16);
  if (v9)
  {
    uint64_t v11 = *(void *)v50;
    *(void *)&long long v10 = 138412546;
    long long v46 = v10;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend__pluginPlistPath_(self, v7, v13, v8, v46);
        uint64_t v18 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v15, v16, v17);
        id v48 = 0;
        objc_msgSend_removeItemAtPath_error_(v18, v19, (uint64_t)v14, (uint64_t)&v48);
        id v20 = v48;

        if (v20 && IMOSLoggingEnabled())
        {
          id v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v46;
            id v54 = v14;
            __int16 v55 = 2112;
            id v56 = v20;
            _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "Could not delete plugin meta data at path %@ %@", buf, 0x16u);
          }
        }
        uint64_t v25 = objc_msgSend_model(self, v21, v22, v23);
        uint64_t v29 = objc_msgSend_pluginIDToMetadataCache(v25, v26, v27, v28);
        uint64_t v33 = objc_msgSend_mutableCopy(v29, v30, v31, v32);

        objc_msgSend_removeObjectForKey_(v33, v34, v13, v35);
        uint64_t v39 = objc_msgSend_model(self, v36, v37, v38);
        id v43 = objc_msgSend_copy(v33, v40, v41, v42);
        objc_msgSend_setPluginIDToMetadataCache_(v39, v44, (uint64_t)v43, v45);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v49, (uint64_t)v57, 16);
    }
    while (v9);
  }
}

- (void)_clearPluginMetadataForUninstalledApps
{
  uint64_t v5 = objc_msgSend__identifiersForAppPlugins(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend__pluginsForWhichWeHaveMetadata(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_mutableCopy(v9, v10, v11, v12);

  objc_msgSend_removeObjectsInArray_(v13, v14, (uint64_t)v5, v15);
  if (IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "clearing in memory salt cache", v19, 2u);
    }
  }
  objc_msgSend__deleteMetaDataForPlugins_(self, v16, (uint64_t)v13, v17);
}

- (void)loadExtensionWithIdentifierIfNeeded:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_model(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_pluginsMap(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_pluginForIdentifier_(v12, v13, (uint64_t)v4, v14);

  if (v15)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v4;
        _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Plugin already loaded: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v19 = objc_msgSend_componentsSeparatedByString_(v4, v16, @":", v17);
    uint64_t v23 = objc_msgSend_lastObject(v19, v20, v21, v22);

    uint64_t v26 = objc_msgSend__extensionWithIdentifier_(self, v24, (uint64_t)v23, v25);
    uint64_t v30 = objc_msgSend_extensionPointIdentifier(v26, v27, v28, v29);
    char isEqualToString = objc_msgSend_isEqualToString_(v30, v31, *MEMORY[0x1E4F6D570], v32);

    if (isEqualToString)
    {
      uint64_t v42 = v26;
      uint64_t v35 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v34, (uint64_t)&v42, 1);
      objc_msgSend__updatePluginsForExtensions_extensionPoint_(self, v36, (uint64_t)v35, 0);
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        uint64_t v41 = objc_msgSend_extensionPointIdentifier(v26, v38, v39, v40);
        *(_DWORD *)buf = 138412546;
        id v44 = v4;
        __int16 v45 = 2112;
        long long v46 = v41;
        _os_log_impl(&dword_1A4AF7000, v37, OS_LOG_TYPE_INFO, "IMBalloonPluginManager asked to load an extension that is not an iMessage app. Identifier: %@ extensionPointIdentifier: %@", buf, 0x16u);
      }
    }
  }
}

- (id)_extensionWithIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v9 = 0;
  uint64_t v5 = objc_msgSend_extensionWithIdentifier_error_(MEMORY[0x1E4F28C70], v4, (uint64_t)v3, (uint64_t)&v9);
  id v6 = v9;
  if (!v5 && IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "IMBalloonPluginManager failed to find extension with extension identifier: %@", buf, 0xCu);
    }
  }

  return v5;
}

- (void)_setPluginsToRemoveAndCallSelectorWithDelay:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Setting plugins to remove with delay: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  id v9 = objc_msgSend_model(self, v5, v6, v7);
  uint64_t v13 = objc_msgSend_copy(v4, v10, v11, v12);
  objc_msgSend_setPluginsToRemoveAfterExtensionsUpdate_(v9, v14, (uint64_t)v13, v15);

  objc_msgSend_performSelector_withObject_afterDelay_(self, v16, (uint64_t)sel__removePluginsWithDelay, 0, 60.0);
}

- (void)_updatePluginsForExtensions:(id)a3 extensionPoint:(id)a4
{
}

- (void)removePluginWithBundleID:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_length(v4, v5, v6, v7);
  int v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v39 = 138412290;
        id v40 = v4;
        _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Explicitly removing plugin with bundleID: %@", (uint8_t *)&v39, 0xCu);
      }
    }
    uint64_t v14 = objc_msgSend_model(self, v10, v11, v12);
    id v18 = objc_msgSend_pluginsMap(v14, v15, v16, v17);
    uint64_t v21 = objc_msgSend_pluginForIdentifier_(v18, v19, (uint64_t)v4, v20);

    if (v21)
    {
      uint64_t v25 = objc_msgSend_model(self, v22, v23, v24);
      uint64_t v29 = objc_msgSend_pluginsMap(v25, v26, v27, v28);
      objc_msgSend_removePluginWithIdentifier_(v29, v30, (uint64_t)v4, v31);

      objc_msgSend__clearPluginMetadataForUninstalledApps(self, v32, v33, v34);
      objc_msgSend__postInstalledAppsChangedNotification(self, v35, v36, v37);
    }
  }
  else if (v9)
  {
    uint64_t v38 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      LOWORD(v39) = 0;
      _os_log_impl(&dword_1A4AF7000, v38, OS_LOG_TYPE_INFO, "Attempting to explicitly remove a plugin with a nil bundleID", (uint8_t *)&v39, 2u);
    }
  }
}

- (void)_removePluginsWithDelay
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = objc_msgSend_model(self, v7, v8, v9);
      uint64_t v14 = objc_msgSend_pluginsToRemoveAfterExtensionsUpdate(v10, v11, v12, v13);
      int v50 = 138412290;
      long long v51 = v14;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Removing plugins with identifiers after delay: %@", (uint8_t *)&v50, 0xCu);
    }
  }
  uint64_t v15 = objc_msgSend_model(self, v3, v4, v5);
  uint64_t v19 = objc_msgSend_pluginsToRemoveAfterExtensionsUpdate(v15, v16, v17, v18);
  BOOL v23 = objc_msgSend_count(v19, v20, v21, v22) == 0;

  if (!v23)
  {
    uint64_t v27 = objc_msgSend_model(self, v24, v25, v26);
    uint64_t v31 = objc_msgSend_pluginsToRemoveAfterExtensionsUpdate(v27, v28, v29, v30);
    objc_msgSend__removePluginsForIdentifiers_(self, v32, (uint64_t)v31, v33);

    uint64_t v37 = objc_msgSend_model(self, v34, v35, v36);
    uint64_t v41 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v38, v39, v40);
    objc_msgSend_setPluginsToRemoveAfterExtensionsUpdate_(v37, v42, (uint64_t)v41, v43);

    objc_msgSend__clearPluginMetadataForUninstalledApps(self, v44, v45, v46);
    objc_msgSend__postInstalledAppsChangedNotification(self, v47, v48, v49);
  }
}

- (void)_removePluginsForIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend__proxyIdentifiersForPlugins(self, v5, v6, v7);
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = sub_1A4B344DC;
  uint64_t v37 = sub_1A4B34354;
  id v38 = 0;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v9, v10, v11);
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1A4BACAFC;
  v29[3] = &unk_1E5B7CC98;
  id v12 = v8;
  id v30 = v12;
  uint64_t v31 = self;
  uint64_t v32 = &v33;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v13, (uint64_t)v29, v14);
  uint64_t v18 = objc_msgSend_model(self, v15, v16, v17);
  uint64_t v22 = objc_msgSend_pluginsMap(v18, v19, v20, v21);
  uint64_t v26 = objc_msgSend_copy((void *)v34[5], v23, v24, v25);
  objc_msgSend_removePluginsWithIdentifiers_(v22, v27, (uint64_t)v26, v28);

  _Block_object_dispose(&v33, 8);
}

- (void)setPluginEnabled:(BOOL)a3 identifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_model(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_pluginsMap(v10, v11, v12, v13);
  objc_msgSend_pluginForIdentifier_(v14, v15, (uint64_t)v6, v16);
  id v28 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v20 = objc_msgSend_app(v28, v17, v18, v19);
  objc_msgSend_setIsEnabled_(v20, v21, v4, v22);

  uint64_t v26 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v23, v24, v25);
  objc_msgSend_postNotificationName_object_(v26, v27, @"IMBalloonPluginEnabledStateChangedNotification", (uint64_t)v28);
}

- (void)_findPluginsInPathInternal:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v66 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v4, OS_LOG_TYPE_INFO, "Loading all internal plugins", buf, 2u);
    }
  }
  id v67 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  objc_msgSend_startTimingForKey_(v67, v5, @"loadPlugins", v6);
  id v65 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  uint64_t v9 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v7, (uint64_t)v66, v8);
  uint64_t v11 = objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v65, v10, (uint64_t)v9, 0, 7, &unk_1EF8E5BF8);

  id v68 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v12, v13, v14);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v11;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v70, (uint64_t)v76, 16);
  if (v16)
  {
    uint64_t v17 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v71 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v70 + 1) + 8 * i);
        id v20 = objc_alloc(MEMORY[0x1E4F28B50]);
        BOOL v23 = objc_msgSend_initWithURL_(v20, v21, v19, v22);
        id v30 = objc_msgSend_bundleIdentifier(v23, v24, v25, v26);
        if (!v30) {
          goto LABEL_12;
        }
        uint64_t v31 = objc_msgSend_model(self, v27, v28, v29);
        uint64_t v35 = objc_msgSend_pluginsMap(v31, v32, v33, v34);
        id v38 = objc_msgSend_pluginForIdentifier_(v35, v36, (uint64_t)v30, v37);
        BOOL v39 = v38 == 0;

        if (v39)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v41 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v75 = v30;
              _os_log_impl(&dword_1A4AF7000, v41, OS_LOG_TYPE_INFO, "Found plugin: %@", buf, 0xCu);
            }
          }
          uint64_t v42 = [IMBalloonPlugin alloc];
          uint64_t v40 = objc_msgSend_initWithBundle_(v42, v43, (uint64_t)v23, v44);
          if (v40) {
            objc_msgSend_setObject_forKey_(v68, v45, (uint64_t)v40, (uint64_t)v30);
          }
        }
        else
        {
LABEL_12:
          if (!IMOSLoggingEnabled()) {
            goto LABEL_23;
          }
          uint64_t v40 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v75 = v23;
            _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "Failed to get bundle identifier for %@", buf, 0xCu);
          }
        }

LABEL_23:
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v46, (uint64_t)&v70, (uint64_t)v76, 16);
    }
    while (v16);
  }

  if (objc_msgSend_count(v68, v47, v48, v49))
  {
    uint64_t v53 = objc_msgSend_model(self, v50, v51, v52);
    long long v57 = objc_msgSend_pluginsMap(v53, v54, v55, v56);
    id v61 = objc_msgSend_copy(v68, v58, v59, v60);
    objc_msgSend_updateWithMap_(v57, v62, (uint64_t)v61, v63);
  }
  objc_msgSend_stopTimingForKey_(v67, v50, @"loadPlugins", v52);
  if (IMOSLoggingEnabled())
  {
    id v64 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v75 = v67;
      _os_log_impl(&dword_1A4AF7000, v64, OS_LOG_TYPE_INFO, "Find Plugin time: %@", buf, 0xCu);
    }
  }
}

- (Class)dataSourceClassForBundleID:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = v4;
  if (!v4)
  {
    id v21 = 0;
    goto LABEL_20;
  }
  int isEqualToString = objc_msgSend_isEqualToString_(v4, v5, *MEMORY[0x1E4F6CC10], v6);
  if (isEqualToString)
  {
    uint64_t v12 = objc_msgSend_model(self, v8, v9, v10);
    uint64_t v16 = objc_msgSend_richLinksDataSourceClass(v12, v13, v14, v15);

    if (v16)
    {
      uint64_t v17 = objc_msgSend_model(self, v8, v9, v10);
      objc_msgSend_richLinksDataSourceClass(v17, v18, v19, v20);
      id v21 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
  }
  uint64_t v22 = objc_msgSend_model(self, v8, v9, v10);
  uint64_t v26 = objc_msgSend_pluginsMap(v22, v23, v24, v25);
  uint64_t v29 = objc_msgSend_pluginForIdentifier_(v26, v27, (uint64_t)v7, v28);

  if (!v29)
  {
    uint64_t v29 = objc_msgSend__fallBackMessagesExtensionPluginForBundleID_(self, v30, (uint64_t)v7, v32);
    if (!v29)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v56 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          int v58 = 138412290;
          uint64_t v59 = v7;
          _os_log_impl(&dword_1A4AF7000, v56, OS_LOG_TYPE_INFO, "IMBalloonPluginManager. Did not find any plugin for id %@", (uint8_t *)&v58, 0xCu);
        }
      }
      uint64_t v44 = 0;
      uint64_t v29 = 0;
      if (!isEqualToString) {
        goto LABEL_19;
      }
      goto LABEL_12;
    }
  }
  uint64_t v33 = objc_msgSend_dataSourceClass(v29, v30, v31, v32);
  uint64_t v34 = objc_opt_class();
  if (objc_msgSend_isSubclassOfClass_(v33, v35, v34, v36)) {
    uint64_t v40 = objc_msgSend_dataSourceClass(v29, v37, v38, v39);
  }
  else {
    uint64_t v40 = objc_opt_class();
  }
  uint64_t v44 = (void *)v40;
  if (isEqualToString)
  {
LABEL_12:
    uint64_t v45 = objc_msgSend_model(self, v41, v42, v43);
    BOOL v49 = objc_msgSend_richLinksDataSourceClass(v45, v46, v47, v48) == 0;

    if (v49)
    {
      uint64_t v53 = objc_msgSend_model(self, v50, v51, v52);
      objc_msgSend_setRichLinksDataSourceClass_(v53, v54, (uint64_t)v44, v55);
    }
  }
LABEL_19:
  id v21 = v44;

LABEL_20:

  return (Class)v21;
}

- (id)_fallBackMessagesExtensionPluginForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v7 = v4;
  if (v4 && (uint64_t v8 = *MEMORY[0x1E4F6CBE8], !objc_msgSend_rangeOfString_(v4, v5, *MEMORY[0x1E4F6CBE8], v6)))
  {
    uint64_t v13 = objc_msgSend_model(self, v9, v10, v11);
    uint64_t v17 = objc_msgSend_pluginsMap(v13, v14, v15, v16);
    uint64_t v12 = objc_msgSend_pluginForIdentifier_(v17, v18, v8, v19);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)dataSourceForPluginPayload:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_pluginBundleID(v4, v5, v6, v7);

  if (!v8)
  {
    *(_OWORD *)id v54 = xmmword_1E5B7CCD8;
    long long v55 = *(_OWORD *)off_1E5B7CCE8;
    uint64_t v56 = 1818;
    uint64_t v12 = NSString;
    uint64_t v13 = IMFileLocationTrimFileName();
    uint64_t v16 = objc_msgSend_stringWithFormat_(NSString, v14, (uint64_t)&stru_1EF8E78C8, v15);
    uint64_t v19 = objc_msgSend_stringWithFormat_(v12, v17, @"Unexpected false '%@' in %s at %s:%d. %@", v18, @"pluginPayload.pluginBundleID != nil", "-[IMBalloonPluginManager dataSourceForPluginPayload:]", v13, 1818, v16);

    uint64_t v20 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v20)
    {
      v20(v19);
    }
    else if (IMOSLoggingEnabled())
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v53 = v19;
        _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }
    }
  }
  uint64_t v22 = objc_msgSend_model(self, v9, v10, v11);
  uint64_t v26 = objc_msgSend_pluginsMap(v22, v23, v24, v25);
  id v30 = objc_msgSend_pluginBundleID(v4, v27, v28, v29);
  uint64_t v33 = objc_msgSend_pluginForIdentifier_(v26, v31, (uint64_t)v30, v32);

  if (!v33)
  {
    uint64_t v37 = objc_msgSend_pluginBundleID(v4, v34, v35, v36);
    uint64_t v33 = objc_msgSend__fallBackMessagesExtensionPluginForBundleID_(self, v38, (uint64_t)v37, v39);
  }
  uint64_t v40 = objc_msgSend_pluginBundleID(v4, v34, v35, v36);
  if (v40) {
    BOOL v41 = v33 == 0;
  }
  else {
    BOOL v41 = 0;
  }
  int v42 = v41;

  if (v42 && IMOSLoggingEnabled())
  {
    uint64_t v45 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      BOOL v49 = objc_msgSend_pluginBundleID(v4, v46, v47, v48);
      *(_DWORD *)id v54 = 138412290;
      *(void *)&v54[4] = v49;
      _os_log_impl(&dword_1A4AF7000, v45, OS_LOG_TYPE_INFO, "IMBalloonPluginManager. Did not find any plugin for id %@", v54, 0xCu);
    }
  }
  int v50 = objc_msgSend_dataSourceForPluginPayload_(v33, v43, (uint64_t)v4, v44);

  return v50;
}

- (id)existingDataSourceForMessageGUID:(id)a3 bundleID:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v10 = a4;
  if (v10)
  {
    uint64_t v11 = objc_msgSend_model(self, v7, v8, v9);
    uint64_t v15 = objc_msgSend_pluginsMap(v11, v12, v13, v14);
    uint64_t v18 = objc_msgSend_pluginForIdentifier_(v15, v16, (uint64_t)v10, v17);

    if (!v18)
    {
      uint64_t v18 = objc_msgSend__fallBackMessagesExtensionPluginForBundleID_(self, v19, (uint64_t)v10, v20);
      if (!v18)
      {
        if (IMOSLoggingEnabled())
        {
          id v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            int v24 = 138412290;
            id v25 = v10;
            _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_INFO, "IMBalloonPluginManager. Did not find any plugin for id %@", (uint8_t *)&v24, 0xCu);
          }
        }
        uint64_t v18 = 0;
      }
    }
    uint64_t v22 = objc_msgSend_existingDataSourceForMessageGUID_(v18, v19, (uint64_t)v6, v20);
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (void)insertDataSource:(id)a3 forGUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_bundleID(v7, v8, v9, v10);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_model(self, v11, v12, v13);
  uint64_t v18 = objc_msgSend_pluginsMap(v14, v15, v16, v17);
  id v21 = objc_msgSend_pluginForIdentifier_(v18, v19, (uint64_t)v23, v20);

  objc_msgSend_insertDataSource_forGUID_(v21, v22, (uint64_t)v7, (uint64_t)v6);
}

- (id)balloonPluginForBundleID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
LABEL_8:
    uint64_t v15 = 0;
    goto LABEL_9;
  }
  uint64_t v8 = objc_msgSend_model(self, v4, v5, v6);
  uint64_t v12 = objc_msgSend_pluginsMap(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_pluginForIdentifier_(v12, v13, (uint64_t)v7, v14);

  if (!v15)
  {
    uint64_t v15 = objc_msgSend__fallBackMessagesExtensionPluginForBundleID_(self, v16, (uint64_t)v7, v17);
    if (!v15)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v20 = 138412290;
          id v21 = v7;
          _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "IMBalloonPluginManager. Did not find any plugin for id %@", (uint8_t *)&v20, 0xCu);
        }
      }
      goto LABEL_8;
    }
  }
LABEL_9:

  return v15;
}

- (id)systemBundleIdentifierForPluginIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v8 = objc_msgSend_model(self, v5, v6, v7);
    uint64_t v12 = objc_msgSend_pluginsMap(v8, v9, v10, v11);
    uint64_t v15 = objc_msgSend_pluginForIdentifier_(v12, v13, (uint64_t)v4, v14);

    uint64_t v19 = objc_msgSend_appBundle(v15, v16, v17, v18);
    id v23 = objc_msgSend_bundleIdentifier(v19, v20, v21, v22);
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (void)_transferUpdated:(id)a3
{
  objc_msgSend_object(a3, a2, (uint64_t)a3, v3);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_transferState(v16, v5, v6, v7) == 5)
  {
    uint64_t v11 = objc_msgSend_messageGUID(v16, v8, v9, v10);
    uint64_t v13 = objc_msgSend_existingDataSourceForMessageGUID_bundleID_(self, v12, (uint64_t)v11, *MEMORY[0x1E4F6CC10]);

    objc_msgSend_pluginPayloadDidChange_(v13, v14, 2, v15);
  }
}

- (void)setModel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end