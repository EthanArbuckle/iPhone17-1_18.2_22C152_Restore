@interface POPodcastSyncHandler
- (NSMutableDictionary)anchorToRevision;
- (POPodcastSyncHandler)init;
- (id)validity;
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)setAnchorToRevision:(id)a3;
- (void)syncDidEnd;
@end

@implementation POPodcastSyncHandler

- (POPodcastSyncHandler)init
{
  v12.receiver = self;
  v12.super_class = (Class)POPodcastSyncHandler;
  v6 = [(POPodcastSyncHandler *)&v12 init];
  if (v6)
  {
    v7 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v2, v3, v4, v5);
    objc_msgSend_setAnchorToRevision_(v6, v8, (uint64_t)v7, v9, v10);
  }
  return v6;
}

- (id)validity
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_sharedInstance(PODataSource, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_validity(v5, v6, v7, v8, v9);

  POLogInitIfNeeded();
  if (POLogContextSync) {
    v11 = POLogContextSync;
  }
  else {
    v11 = &_os_log_internal;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    v14 = v10;
    _os_log_impl(&dword_222EBF000, v11, OS_LOG_TYPE_INFO, "Data source's validity is %@", (uint8_t *)&v13, 0xCu);
  }

  return v10;
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  unint64_t v11 = (unint64_t)a3;
  unint64_t v12 = (unint64_t)a4;
  id v13 = a6;
  id v14 = a7;
  if (objc_msgSend_isEqual_(v13, v15, @"com.apple.media.podcasts", v16, v17)
    && (v11 | v12
     || (objc_msgSend_sharedInstance(PODataSource, v18, v19, v20, v21),
         v22 = objc_claimAutoreleasedReturnValue(),
         char isPodcastsInstalled = objc_msgSend_isPodcastsInstalled(v22, v23, v24, v25, v26),
         v22,
         (isPodcastsInstalled & 1) != 0)))
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      v28 = POLogContextSync;
    }
    else {
      v28 = &_os_log_internal;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      unint64_t v107 = v11;
      __int16 v108 = 2112;
      unint64_t v109 = v12;
      __int16 v110 = 2112;
      id v111 = v13;
      __int16 v112 = 2112;
      id v113 = v14;
      _os_log_impl(&dword_222EBF000, v28, OS_LOG_TYPE_INFO, "Begin sync with anchor getting called, anchor is %@, validity is %@, key is %@ and beginInfo is %@", buf, 0x2Au);
    }
    v33 = objc_msgSend_validity(self, v29, v30, v31, v32);
    char isEqual = objc_msgSend_isEqual_((void *)v12, v34, (uint64_t)v33, v35, v36);

    unint64_t v99 = v12;
    id v98 = v14;
    if ((isEqual & 1) == 0)
    {
      POLogInitIfNeeded();
      if (POLogContextSync) {
        v42 = POLogContextSync;
      }
      else {
        v42 = &_os_log_internal;
      }
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v47 = v42;
        v52 = objc_msgSend_validity(self, v48, v49, v50, v51);
        *(_DWORD *)buf = 138412290;
        unint64_t v107 = (unint64_t)v52;
        _os_log_impl(&dword_222EBF000, v47, OS_LOG_TYPE_INFO, "Podcasts are resetting with validity %@", buf, 0xCu);
      }
      v53 = objc_msgSend_validity(self, v43, v44, v45, v46);
      objc_msgSend_resetWithValidity_(v14, v54, (uint64_t)v53, v55, v56);

      unint64_t v11 = (unint64_t)@"0";
    }
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    v57 = objc_msgSend_sharedInstance(PODataSource, v38, v39, v40, v41);
    v100 = (__CFString *)v11;
    uint64_t v62 = objc_msgSend_longLongValue((void *)v11, v58, v59, v60, v61);
    v66 = objc_msgSend_podcastRevisionsSinceAnchor_(v57, v63, v62, v64, v65);

    uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v67, (uint64_t)&v101, (uint64_t)v105, 16);
    if (v68)
    {
      uint64_t v73 = v68;
      uint64_t v74 = *(void *)v102;
      do
      {
        for (uint64_t i = 0; i != v73; ++i)
        {
          if (*(void *)v102 != v74) {
            objc_enumerationMutation(v66);
          }
          v76 = *(void **)(*((void *)&v101 + 1) + 8 * i);
          v77 = NSString;
          uint64_t v78 = objc_msgSend_revisionID(v76, v69, v70, v71, v72);
          v82 = objc_msgSend_stringWithFormat_(v77, v79, @"%lu", v80, v81, v78);
          v87 = objc_msgSend_anchorToRevision(self, v83, v84, v85, v86);
          objc_msgSend_setObject_forKeyedSubscript_(v87, v88, (uint64_t)v76, (uint64_t)v82, v89);
        }
        uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v69, (uint64_t)&v101, (uint64_t)v105, 16);
      }
      while (v73);
    }

    POLogInitIfNeeded();
    if (POLogContextSync) {
      v90 = POLogContextSync;
    }
    else {
      v90 = &_os_log_internal;
    }
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      v91 = v90;
      v96 = objc_msgSend_anchorToRevision(self, v92, v93, v94, v95);
      *(_DWORD *)buf = 138412290;
      unint64_t v107 = (unint64_t)v96;
      _os_log_impl(&dword_222EBF000, v91, OS_LOG_TYPE_INFO, "Anchors to revisions are %@", buf, 0xCu);
    }
    unint64_t v12 = v99;
    unint64_t v11 = (unint64_t)v100;
    id v14 = v98;
  }
  else
  {
    POLogInitIfNeeded();
    if (POLogContextSync) {
      v97 = POLogContextSync;
    }
    else {
      v97 = &_os_log_internal;
    }
    if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222EBF000, v97, OS_LOG_TYPE_INFO, "Nil anchor, nil validity, and podcasts isn't installed.  Nothing to sync.", buf, 2u);
    }
  }
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  v6 = (__CFString *)a3;
  id v11 = a4;
  if (!v6) {
    v6 = @"0";
  }
  unint64_t v12 = objc_msgSend_anchorToRevision(self, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)v6, v14, v15);

  if (v16)
  {
    uint64_t v21 = NSString;
    uint64_t v22 = objc_msgSend_revisionID(v16, v17, v18, v19, v20);
    uint64_t v26 = objc_msgSend_stringWithFormat_(v21, v23, @"%lu", v24, v25, v22 + 1);
    objc_msgSend_setPostAnchor_(v11, v27, (uint64_t)v26, v28, v29);

    BOOL v34 = objc_msgSend_revisionType(v16, v30, v31, v32, v33) == 2;
    objc_msgSend_setIsDelete_(v11, v35, v34, v36, v37);
    if (objc_msgSend_isDelete(v11, v38, v39, v40, v41))
    {
      uint64_t v46 = objc_msgSend_deletedModelObject(v16, v42, v43, v44, v45);
      uint64_t v51 = objc_msgSend_SAMPCollection(v46, v47, v48, v49, v50);
      objc_msgSend_setObject_(v11, v52, (uint64_t)v51, v53, v54);
      goto LABEL_11;
    }
    uint64_t v46 = objc_msgSend_sharedInstance(PODataSource, v42, v43, v44, v45);
    uint64_t v51 = objc_msgSend_objectID(v16, v91, v92, v93, v94);
    v87 = objc_msgSend_domainObjectWithUUID_(v46, v95, (uint64_t)v51, v96, v97);
    objc_msgSend_setObject_(v11, v98, (uint64_t)v87, v99, v100);
  }
  else
  {
    uint64_t v55 = objc_msgSend_anchorToRevision(self, v17, v18, v19, v20);
    uint64_t v60 = objc_msgSend_allKeys(v55, v56, v57, v58, v59);

    uint64_t v46 = objc_msgSend_sortedArrayUsingComparator_(v60, v61, (uint64_t)&unk_26D5D53D8, v62, v63);

    uint64_t v68 = objc_msgSend_lastObject(v46, v64, v65, v66, v67);
    uint64_t v51 = v68;
    if (!v68) {
      goto LABEL_11;
    }
    uint64_t v73 = objc_msgSend_longLongValue(v68, v69, v70, v71, v72);
    if (v73 <= objc_msgSend_longLongValue(v6, v74, v75, v76, v77)) {
      goto LABEL_11;
    }
    v82 = NSString;
    uint64_t v83 = objc_msgSend_longLongValue(v6, v78, v79, v80, v81);
    v87 = objc_msgSend_stringWithFormat_(v82, v84, @"%lli", v85, v86, v83 + 1);
    objc_msgSend_setPostAnchor_(v11, v88, (uint64_t)v87, v89, v90);
  }

LABEL_11:
  POLogInitIfNeeded();
  if (POLogContextSync) {
    long long v101 = POLogContextSync;
  }
  else {
    long long v101 = &_os_log_internal;
  }
  if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    long long v103 = v6;
    __int16 v104 = 2112;
    id v105 = v11;
    _os_log_impl(&dword_222EBF000, v101, OS_LOG_TYPE_INFO, "Get change getting called with anchor %@, changeInfo %@", buf, 0x16u);
  }
}

- (void)syncDidEnd
{
  POLogInitIfNeeded();
  if (POLogContextSync) {
    uint64_t v3 = POLogContextSync;
  }
  else {
    uint64_t v3 = &_os_log_internal;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_222EBF000, v3, OS_LOG_TYPE_INFO, "syncDidEnd getting called", v7, 2u);
  }
  objc_msgSend_setAnchorToRevision_(self, v4, 0, v5, v6);
}

- (NSMutableDictionary)anchorToRevision
{
  return self->_anchorToRevision;
}

- (void)setAnchorToRevision:(id)a3
{
}

- (void).cxx_destruct
{
}

@end