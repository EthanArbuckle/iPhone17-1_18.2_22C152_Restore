@interface MADSpotlightImageAssetBatch
+ (id)batchWithCancelBlock:(id)a3;
- (id)createSearchableItemForAssetEntry:(id)a3;
- (id)logPrefix;
- (id)queueName;
- (int)prepare;
- (int)publish;
- (void)addAsset:(id)a3;
@end

@implementation MADSpotlightImageAssetBatch

+ (id)batchWithCancelBlock:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithCancelBlock:v4];

  return v5;
}

- (void)addAsset:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(MADSpotlightImageAssetBatchBase *)self assetEntries];
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) asset];
        v10 = [v9 uniqueIdentifier];
        v11 = [v4 uniqueIdentifier];
        unsigned int v12 = [v10 isEqual:v11];

        if (v12)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v13 = VCPLogInstance();
            os_log_type_t v14 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v13, v14))
            {
              v15 = [(MADSpotlightImageAssetBatch *)self logPrefix];
              v16 = [v4 uniqueIdentifier];
              *(_DWORD *)buf = 138412546;
              v22 = v15;
              __int16 v23 = 2112;
              v24 = v16;
              _os_log_impl((void *)&_mh_execute_header, v13, v14, "[%@][%@] Batch already contains asset; ignoring",
                buf,
                0x16u);
            }
          }
          goto LABEL_15;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    id v5 = +[MADSpotlightImageAssetEntry entryWithAsset:v4];
    [(MADSpotlightImageAssetBatchBase *)self addAssetEntry:v5];
LABEL_15:
  }
}

- (id)logPrefix
{
  return @"Spotlight|Image";
}

- (id)queueName
{
  return @"com.apple.mediaanalysisd.spotlight.image";
}

- (int)prepare
{
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(MADSpotlightImageAssetBatchBase *)self assetEntries];
  id v2 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v2)
  {
    uint64_t v4 = *(void *)v31;
    os_log_type_t v5 = VCPLogToOSLogType[5];
    *(void *)&long long v3 = 138412546;
    long long v26 = v3;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v31 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v8 = VCPLogInstance();
          if (os_log_type_enabled(v8, v5))
          {
            v9 = [(MADSpotlightImageAssetBatch *)self logPrefix];
            v10 = [v7 asset];
            v11 = [v10 uniqueIdentifier];
            *(_DWORD *)buf = v26;
            v35 = v9;
            __int16 v36 = 2112;
            id v37 = v11;
            _os_log_impl((void *)&_mh_execute_header, v8, v5, "[%@][Prepare] %@", buf, 0x16u);
          }
        }
        unsigned int v12 = objc_msgSend(v7, "asset", v26);
        [v12 setStatus:1];

        v13 = [v7 asset];
        objc_msgSend(v13, "setAttemptCount:", objc_msgSend(v13, "attemptCount") + 1);

        os_log_type_t v14 = [v7 asset];
        double v15 = MADRetryBackoffTime((int)[v14 attemptCount]);

        v16 = +[NSDate dateWithTimeIntervalSinceNow:v15];
        long long v17 = [v7 asset];
        [v17 setNextAttemptDate:v16];
      }
      id v2 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v2);
  }

  long long v18 = +[MADSystemDataStore systemDataStore];
  id v29 = 0;
  unsigned __int8 v19 = [v18 commitChangesOrRollback:&v29];
  id v20 = v29;

  if (v19)
  {
    int v21 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v22 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v22, v23))
      {
        v24 = [(MADSpotlightImageAssetBatch *)self logPrefix];
        *(_DWORD *)buf = 138412546;
        v35 = v24;
        __int16 v36 = 2112;
        id v37 = v20;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "[%@][Prepare] Failed during commit changes - %@", buf, 0x16u);
      }
    }
    int v21 = -20;
  }

  return v21;
}

- (id)createSearchableItemForAssetEntry:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 attributeSet];
  if (v4)
  {
    id v5 = objc_alloc((Class)CSSearchableItem);
    id v6 = [v3 asset];
    uint64_t v7 = [v6 uniqueIdentifier];
    id v8 = [v5 initWithUniqueIdentifier:v7 domainIdentifier:0 attributeSet:v4];

    [v8 setIsUpdate:1];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (int)publish
{
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x2020000000;
  int v102 = 0;
  v72 = +[NSMutableDictionary dictionary];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v74 = self;
  id v3 = [(MADSpotlightImageAssetBatchBase *)self assetEntries];
  id v4 = [v3 countByEnumeratingWithState:&v95 objects:v111 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v96;
    os_log_type_t v6 = VCPLogToOSLogType[5];
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v96 != v5) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          v9 = VCPLogInstance();
          if (os_log_type_enabled(v9, v6))
          {
            v10 = [(MADSpotlightImageAssetBatch *)v74 logPrefix];
            v11 = [v8 asset];
            unsigned int v12 = [v11 uniqueIdentifier];
            *(_DWORD *)buf = 138412546;
            v104 = v10;
            __int16 v105 = 2112;
            id v106 = v12;
            _os_log_impl((void *)&_mh_execute_header, v9, v6, "[%@][Publish] %@", buf, 0x16u);
          }
        }
        if ([v8 status])
        {
          if ([v8 status] != -128)
          {
            v16 = [v8 asset];
            [v16 setStatus:3];
            goto LABEL_20;
          }
          id v13 = [v8 previousStatus];
          os_log_type_t v14 = [v8 asset];
          [v14 setStatus:v13];

          double v15 = [v8 asset];
          objc_msgSend(v15, "setAttemptCount:", objc_msgSend(v15, "attemptCount") - 1);

          v16 = +[NSDate date];
          long long v17 = [v8 asset];
          [v17 setNextAttemptDate:v16];
        }
        else
        {
          long long v18 = [(MADSpotlightImageAssetBatch *)v74 createSearchableItemForAssetEntry:v8];
          v16 = v18;
          if (v18)
          {
            unsigned __int8 v19 = [v18 bundleID];
            id v20 = [v72 objectForKeyedSubscript:v19];
            BOOL v21 = v20 == 0;

            if (v21)
            {
              v22 = +[NSMutableArray array];
              os_log_type_t v23 = [v16 bundleID];
              [v72 setObject:v22 forKeyedSubscript:v23];
            }
            long long v17 = [v16 bundleID];
            v24 = [v72 objectForKeyedSubscript:v17];
            [v24 addObject:v16];
          }
          else
          {
            long long v17 = [v8 asset];
            [v17 setStatus:3];
          }
        }

LABEL_20:
      }
      id v4 = [v3 countByEnumeratingWithState:&v95 objects:v111 count:16];
    }
    while (v4);
  }

  group = dispatch_group_create();
  v76 = +[NSMutableSet set];
  v75 = +[NSMutableSet set];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obj = v72;
  id v25 = [obj countByEnumeratingWithState:&v91 objects:v110 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v92;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v92 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void *)(*((void *)&v91 + 1) + 8 * (void)j);
        dispatch_group_enter(group);
        id v29 = [objc_alloc((Class)CSSearchableIndex) initWithName:v28 bundleIdentifier:v28];
        long long v30 = [obj objectForKeyedSubscript:v28];
        v84[0] = _NSConcreteStackBlock;
        v84[1] = 3221225472;
        v84[2] = sub_100163824;
        v84[3] = &unk_10021F070;
        v84[4] = v74;
        id v31 = obj;
        id v85 = v31;
        uint64_t v86 = v28;
        v90 = &v99;
        id v87 = v76;
        id v88 = v75;
        v89 = group;
        [v29 indexSearchableItems:v30 completionHandler:v84];
      }
      id v25 = [v31 countByEnumeratingWithState:&v91 objects:v110 count:16];
    }
    while (v25);
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v71 = [(MADSpotlightImageAssetBatchBase *)v74 assetEntries];
  id v32 = [v71 countByEnumeratingWithState:&v80 objects:v109 count:16];
  if (v32)
  {
    uint64_t v34 = *(void *)v81;
    os_log_type_t v35 = VCPLogToOSLogType[6];
    os_log_type_t type = VCPLogToOSLogType[3];
    *(void *)&long long v33 = 138412802;
    long long v69 = v33;
    do
    {
      for (k = 0; k != v32; k = (char *)k + 1)
      {
        if (*(void *)v81 != v34) {
          objc_enumerationMutation(v71);
        }
        id v37 = *(void **)(*((void *)&v80 + 1) + 8 * (void)k);
        v38 = objc_msgSend(v37, "asset", v69);
        v39 = [v38 uniqueIdentifier];
        unsigned int v40 = [v76 containsObject:v39];

        if (v40)
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v41 = VCPLogInstance();
            if (os_log_type_enabled(v41, v35))
            {
              v42 = [(MADSpotlightImageAssetBatch *)v74 logPrefix];
              v43 = [v37 asset];
              v44 = [v43 uniqueIdentifier];
              *(_DWORD *)buf = 138412546;
              v104 = v42;
              __int16 v105 = 2112;
              id v106 = v44;
              _os_log_impl((void *)&_mh_execute_header, v41, v35, "[%@][Publish] Mark %@ as soft failure", buf, 0x16u);
            }
          }
          v45 = [v37 asset];
          [v45 setStatus:3];
        }
        v46 = [v37 asset];
        v47 = [v46 uniqueIdentifier];
        unsigned int v48 = [v75 containsObject:v47];

        if (v48)
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v49 = VCPLogInstance();
            if (os_log_type_enabled(v49, v35))
            {
              v50 = [(MADSpotlightImageAssetBatch *)v74 logPrefix];
              v51 = [v37 asset];
              v52 = [v51 uniqueIdentifier];
              *(_DWORD *)buf = 138412546;
              v104 = v50;
              __int16 v105 = 2112;
              id v106 = v52;
              _os_log_impl((void *)&_mh_execute_header, v49, v35, "[%@][Publish] Delete entry %@.", buf, 0x16u);
            }
          }
          v53 = [v37 asset];
          v54 = [v53 uniqueIdentifier];
          id v79 = 0;
          unsigned __int8 v55 = +[MADManagedSpotlightEntry deleteEntryWithUniqueIdentifier:v54 error:&v79];
          id v56 = v79;

          if ((v55 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
          {
            v57 = VCPLogInstance();
            if (os_log_type_enabled(v57, type))
            {
              v58 = [(MADSpotlightImageAssetBatch *)v74 logPrefix];
              v59 = [v37 asset];
              v60 = [v59 uniqueIdentifier];
              *(_DWORD *)buf = v69;
              v104 = v58;
              __int16 v105 = 2112;
              id v106 = v60;
              __int16 v107 = 2112;
              id v108 = v56;
              _os_log_impl((void *)&_mh_execute_header, v57, type, "[%@][Publish] %@ Failed to delete entry (%@)", buf, 0x20u);
            }
          }
        }
      }
      id v32 = [v71 countByEnumeratingWithState:&v80 objects:v109 count:16];
    }
    while (v32);
  }

  v61 = +[MADSystemDataStore systemDataStore];
  id v78 = 0;
  unsigned int v62 = [v61 commitChangesOrRollback:&v78];
  id v63 = v78;

  if (v62)
  {
    int v64 = *((_DWORD *)v100 + 6);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v65 = VCPLogInstance();
      os_log_type_t v66 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v65, v66))
      {
        v67 = [(MADSpotlightImageAssetBatch *)v74 logPrefix];
        *(_DWORD *)buf = 138412546;
        v104 = v67;
        __int16 v105 = 2112;
        id v106 = v63;
        _os_log_impl((void *)&_mh_execute_header, v65, v66, "[%@] Publish failed during commit changes (%@)", buf, 0x16u);
      }
    }
    int v64 = -20;
    *((_DWORD *)v100 + 6) = -20;
  }

  _Block_object_dispose(&v99, 8);
  return v64;
}

@end