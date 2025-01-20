@interface IMBalloonPluginAttributionController
+ (id)sharedInstance;
- (BOOL)hasPerformedFirstAppExtensionLoad;
- (BOOL)shouldShowAttributionForBundleID:(id)a3;
- (IMBalloonPluginAttributionController)init;
- (NSMutableDictionary)bundleIDsDisplayingAttribution;
- (NSMutableDictionary)expiredBundleIDToTimestampMap;
- (double)_expiryTimeout;
- (id)_currentTimestamp;
- (void)_handleInstalledPluginsChanged;
- (void)_purgeLeastRecentlySeenAppBundleIDsIfNecessary;
- (void)_saveToFile;
- (void)didShowAttributionForBundleIDs:(id)a3;
- (void)setBundleIDsDisplayingAttribution:(id)a3;
- (void)setExpiredBundleIDToTimestampMap:(id)a3;
- (void)setHasPerformedFirstAppExtensionLoad:(BOOL)a3;
- (void)startExpiryTimer;
@end

@implementation IMBalloonPluginAttributionController

+ (id)sharedInstance
{
  if (qword_1EB3F24B0 != -1) {
    dispatch_once(&qword_1EB3F24B0, &unk_1EF8E5178);
  }
  v2 = (void *)qword_1EB3F2510;

  return v2;
}

- (IMBalloonPluginAttributionController)init
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)IMBalloonPluginAttributionController;
  v2 = [(IMBalloonPluginAttributionController *)&v40 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F1CA60];
    v4 = sub_1A4B53784();
    uint64_t v7 = objc_msgSend_dictionaryWithContentsOfFile_(v3, v5, (uint64_t)v4, v6);
    expiredBundleIDToTimestampMap = v2->_expiredBundleIDToTimestampMap;
    v2->_expiredBundleIDToTimestampMap = (NSMutableDictionary *)v7;

    if (!v2->_expiredBundleIDToTimestampMap)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      v10 = v2->_expiredBundleIDToTimestampMap;
      v2->_expiredBundleIDToTimestampMap = (NSMutableDictionary *)Mutable;
    }
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    bundleIDsDisplayingAttribution = v2->_bundleIDsDisplayingAttribution;
    v2->_bundleIDsDisplayingAttribution = v11;

    v16 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v13, v14, v15);
    objc_msgSend_addObserver_selector_name_object_(v16, v17, (uint64_t)v2, (uint64_t)sel__handleInstalledPluginsChanged, @"__kIMBalloonPluginManagerInstalledAppsChangedNotification", 0);

    objc_msgSend_setHasPerformedFirstAppExtensionLoad_(v2, v18, 0, v19);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
    v23 = objc_msgSend_sharedInstance(IMBalloonPluginManager, v20, v21, v22, 0, 0);
    v27 = objc_msgSend_allPlugins(v23, v24, v25, v26);

    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v36, (uint64_t)v41, 16);
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v37 != v31) {
            objc_enumerationMutation(v27);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend_setHasPerformedFirstAppExtensionLoad_(v2, v33, 1, v34);
            goto LABEL_14;
          }
        }
        uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v33, (uint64_t)&v36, (uint64_t)v41, 16);
        if (v30) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return v2;
}

- (void)startExpiryTimer
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3);
  v9 = objc_msgSend_bundleIDsDisplayingAttribution(self, v6, v7, v8);
  v13 = objc_msgSend_allKeys(v9, v10, v11, v12);
  v16 = objc_msgSend___imArrayByFilteringWithBlock_(v13, v14, (uint64_t)&unk_1EF8E3F30, v15);

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v17 = v16;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v46, (uint64_t)v50, 16);
  if (v19)
  {
    uint64_t v23 = v19;
    uint64_t v24 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v47 != v24) {
          objc_enumerationMutation(v17);
        }
        uint64_t v26 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        v27 = objc_msgSend_bundleIDsDisplayingAttribution(self, v20, v21, v22);
        uint64_t v30 = objc_msgSend_objectForKey_(v27, v28, v26, v29);
        char v34 = objc_msgSend_BOOLValue(v30, v31, v32, v33);

        if ((v34 & 1) == 0)
        {
          v35 = objc_msgSend_bundleIDsDisplayingAttribution(self, v20, v21, v22);
          objc_msgSend_setObject_forKey_(v35, v36, MEMORY[0x1E4F1CC38], v26);

          objc_msgSend_addObject_(v5, v37, v26, v38);
        }
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v46, (uint64_t)v50, 16);
    }
    while (v23);
  }

  if (objc_msgSend_count(v5, v39, v40, v41))
  {
    objc_msgSend__expiryTimeout(self, v42, v43, v44);
    id v45 = v5;
    im_dispatch_after();
  }
}

- (void)didShowAttributionForBundleIDs:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v24;
    uint64_t v11 = *MEMORY[0x1E4F6CBE8];
    uint64_t v12 = MEMORY[0x1E4F1CC28];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_msgSend_containsString_(v14, v7, v11, v8))
        {
          v16 = objc_msgSend_bundleIDsDisplayingAttribution(self, v7, v15, v8);
          uint64_t v19 = objc_msgSend_objectForKey_(v16, v17, (uint64_t)v14, v18);

          if (!v19)
          {
            uint64_t v21 = objc_msgSend_bundleIDsDisplayingAttribution(self, v7, v20, v8);
            objc_msgSend_setObject_forKey_(v21, v22, v12, (uint64_t)v14);
          }
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v9);
  }
}

- (BOOL)shouldShowAttributionForBundleID:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend_containsString_(v4, v5, *MEMORY[0x1E4F6CC18], v6) & 1) != 0
    || (objc_msgSend_containsString_(v4, v7, *MEMORY[0x1E4F6CC00], v8) & 1) != 0)
  {
    goto LABEL_3;
  }
  if ((objc_msgSend_containsString_(v4, v9, *MEMORY[0x1E4F6CBC0], v10) & 1) != 0
    || (objc_msgSend_containsString_(v4, v12, *MEMORY[0x1E4F6CAF8], v13) & 1) != 0
    || (objc_msgSend_containsString_(v4, v14, *MEMORY[0x1E4F6CB78], v15) & 1) != 0
    || (IMIsRunningInUnitTesting() & 1) == 0
    && !objc_msgSend_hasPerformedFirstAppExtensionLoad(self, v16, v17, v18))
  {
    BOOL v11 = 0;
    goto LABEL_14;
  }
  uint64_t v19 = objc_msgSend_bundleIDsDisplayingAttribution(self, v16, v17, v18);
  uint64_t v22 = objc_msgSend_objectForKey_(v19, v20, (uint64_t)v4, v21);

  if (v22)
  {
LABEL_3:
    BOOL v11 = 1;
  }
  else
  {
    long long v26 = objc_msgSend_sharedInstance(IMBalloonPluginManager, v23, v24, v25);
    uint64_t v29 = objc_msgSend_balloonPluginForBundleID_(v26, v27, (uint64_t)v4, v28);

    uint64_t v33 = objc_msgSend_identifier(v29, v30, v31, v32);
    char isEqualToString = objc_msgSend_isEqualToString_(v33, v34, (uint64_t)v4, v35);

    if ((isEqualToString & 1) != 0 || !objc_msgSend_containsString_(v4, v37, *MEMORY[0x1E4F6CBE8], v38))
    {
      BOOL v11 = 0;
    }
    else
    {
      uint64_t v42 = objc_msgSend_expiredBundleIDToTimestampMap(self, v39, v40, v41);
      id v45 = objc_msgSend_objectForKey_(v42, v43, (uint64_t)v4, v44);
      BOOL v11 = v45 == 0;
    }
  }
LABEL_14:

  return v11;
}

- (id)_currentTimestamp
{
  id v4 = NSNumber;
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], a2, v2, v3);

  return (id)objc_msgSend_numberWithDouble_(v4, v5, v6, v7);
}

- (double)_expiryTimeout
{
  return 30.0;
}

- (void)_saveToFile
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_expiredBundleIDToTimestampMap(self, a2, v2, v3);
  v5 = sub_1A4B53784();
  objc_msgSend_writeToFile_atomically_(v4, v6, (uint64_t)v5, 1);

  uint64_t v10 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v7, v8, v9);
  uint64_t v16 = *MEMORY[0x1E4F28370];
  v17[0] = *MEMORY[0x1E4F28358];
  uint64_t v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v17, (uint64_t)&v16, 1);
  uint64_t v13 = sub_1A4B53784();
  uint64_t v15 = 0;
  objc_msgSend_setAttributes_ofItemAtPath_error_(v10, v14, (uint64_t)v12, (uint64_t)v13, &v15);
}

- (void)_purgeLeastRecentlySeenAppBundleIDsIfNecessary
{
  v5 = objc_msgSend_expiredBundleIDToTimestampMap(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_count(v5, v6, v7, v8) - 100;

  if (v9 >= 1)
  {
    uint64_t v13 = objc_msgSend_expiredBundleIDToTimestampMap(self, v10, v11, v12);
    uint64_t v17 = objc_msgSend_allKeys(v13, v14, v15, v16);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = sub_1A4B5423C;
    v37[3] = &unk_1E5B7B470;
    v37[4] = self;
    uint64_t v20 = objc_msgSend_sortedArrayUsingComparator_(v17, v18, (uint64_t)v37, v19);

    for (uint64_t i = 0; i != v9; ++i)
    {
      uint64_t v24 = objc_msgSend_objectAtIndexedSubscript_(v20, v21, i, v22);
      uint64_t v28 = objc_msgSend_expiredBundleIDToTimestampMap(self, v25, v26, v27);
      objc_msgSend_removeObjectForKey_(v28, v29, (uint64_t)v24, v30);

      char v34 = objc_msgSend_bundleIDsDisplayingAttribution(self, v31, v32, v33);
      objc_msgSend_removeObjectForKey_(v34, v35, (uint64_t)v24, v36);
    }
  }
}

- (void)_handleInstalledPluginsChanged
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_msgSend_sharedInstance(IMBalloonPluginManager, a2, v2, v3);
  uint64_t v10 = objc_msgSend_allPlugins(v6, v7, v8, v9);
  uint64_t v13 = objc_msgSend___imArrayByApplyingBlock_(v10, v11, (uint64_t)&unk_1EF8E5DF8, v12);
  uint64_t v16 = objc_msgSend_setWithArray_(v5, v14, (uint64_t)v13, v15);

  char hasPerformedFirstAppExtensionLoad = objc_msgSend_hasPerformedFirstAppExtensionLoad(self, v17, v18, v19);
  if ((hasPerformedFirstAppExtensionLoad & 1) == 0)
  {
    if (!objc_msgSend_count(v16, v20, v21, v22)) {
      goto LABEL_19;
    }
    objc_msgSend_setHasPerformedFirstAppExtensionLoad_(self, v24, 1, v25);
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v26 = objc_msgSend_expiredBundleIDToTimestampMap(self, v20, v21, v22);
  uint64_t v30 = objc_msgSend_allKeys(v26, v27, v28, v29);

  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v60, (uint64_t)v64, 16);
  if (!v32)
  {

    if (hasPerformedFirstAppExtensionLoad) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  uint64_t v35 = v32;
  char v59 = 0;
  char v36 = hasPerformedFirstAppExtensionLoad ^ 1;
  uint64_t v37 = *(void *)v61;
  do
  {
    for (uint64_t i = 0; i != v35; ++i)
    {
      if (*(void *)v61 != v37) {
        objc_enumerationMutation(v30);
      }
      uint64_t v39 = *(void *)(*((void *)&v60 + 1) + 8 * i);
      if (objc_msgSend_containsObject_(v16, v33, v39, v34))
      {
        uint64_t v43 = objc_msgSend_expiredBundleIDToTimestampMap(self, v40, v41, v42);
        objc_msgSend_removeObjectForKey_(v43, v44, v39, v45);

        char v59 = 1;
      }
      long long v46 = objc_msgSend_bundleIDsDisplayingAttribution(self, v40, v41, v42);
      long long v49 = objc_msgSend_objectForKey_(v46, v47, v39, v48);

      if (v49)
      {
        uint64_t v51 = objc_msgSend_bundleIDsDisplayingAttribution(self, v33, v50, v34);
        objc_msgSend_removeObjectForKey_(v51, v52, v39, v53);

        char v36 = 1;
      }
    }
    uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v60, (uint64_t)v64, 16);
  }
  while (v35);

  if (v59) {
    objc_msgSend__saveToFile(self, v54, v55, v56);
  }
  if (v36)
  {
LABEL_18:
    v57 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v54, v55, v56);
    objc_msgSend___mainThreadPostNotificationName_object_(v57, v58, @"__kIMBalloonPluginAttributionChangedNotification", 0);
  }
LABEL_19:
}

- (NSMutableDictionary)expiredBundleIDToTimestampMap
{
  return self->_expiredBundleIDToTimestampMap;
}

- (void)setExpiredBundleIDToTimestampMap:(id)a3
{
}

- (NSMutableDictionary)bundleIDsDisplayingAttribution
{
  return self->_bundleIDsDisplayingAttribution;
}

- (void)setBundleIDsDisplayingAttribution:(id)a3
{
}

- (BOOL)hasPerformedFirstAppExtensionLoad
{
  return self->_hasPerformedFirstAppExtensionLoad;
}

- (void)setHasPerformedFirstAppExtensionLoad:(BOOL)a3
{
  self->_char hasPerformedFirstAppExtensionLoad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDsDisplayingAttribution, 0);

  objc_storeStrong((id *)&self->_expiredBundleIDToTimestampMap, 0);
}

@end