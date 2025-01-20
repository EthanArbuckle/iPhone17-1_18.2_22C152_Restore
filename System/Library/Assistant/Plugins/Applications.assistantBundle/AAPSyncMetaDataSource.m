@interface AAPSyncMetaDataSource
+ ($334330880F6F150C3C7EE8C53B00592A)_createSourceInfoForLastState:(id)a3 startAnchor:(id)a4 keyAnchor:(id)a5 validity:(id)a6 configuration:(id)a7;
+ (id)projectedStateForKeyAnchor:(id)a3 withValidity:(id)a4;
- (AAPSyncMetaDataSource)initWithLastState:(id)a3 startAnchor:(id)a4 keyAnchor:(id)a5 validity:(id)a6 configuration:(id)a7 observer:(id)a8;
- (AAPSyncState)state;
- (NSArray)metaData;
- (void)dealloc;
- (void)waitUntilReady;
@end

@implementation AAPSyncMetaDataSource

- (AAPSyncMetaDataSource)initWithLastState:(id)a3 startAnchor:(id)a4 keyAnchor:(id)a5 validity:(id)a6 configuration:(id)a7 observer:(id)a8
{
  v18.receiver = self;
  v18.super_class = (Class)AAPSyncMetaDataSource;
  v14 = [(AAPSyncMetaDataSource *)&v18 init];
  if (v14)
  {
    v15 = dispatch_queue_create(0, 0);
    v14->_queue = (OS_dispatch_queue *)v15;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_92C4;
    block[3] = &unk_20988;
    block[4] = v14;
    block[5] = a3;
    block[6] = a4;
    block[7] = a5;
    block[8] = a6;
    block[9] = a7;
    block[10] = a8;
    dispatch_async(v15, block);
  }
  return v14;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)AAPSyncMetaDataSource;
  [(AAPSyncMetaDataSource *)&v3 dealloc];
}

+ (id)projectedStateForKeyAnchor:(id)a3 withValidity:(id)a4
{
  id v4 = [a1 _createSourceInfoForLastState:0 startAnchor:0 keyAnchor:a3 validity:a4 configuration:0];
  v6 = v5;

  return v6;
}

- (void)waitUntilReady
{
}

+ ($334330880F6F150C3C7EE8C53B00592A)_createSourceInfoForLastState:(id)a3 startAnchor:(id)a4 keyAnchor:(id)a5 validity:(id)a6 configuration:(id)a7
{
  id v10 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x3052000000;
  v81 = sub_9C7C;
  v82 = sub_9C8C;
  id v83 = 0;
  unsigned __int8 v11 = objc_msgSend(a5, "isNewerThanAnchor:", objc_msgSend(a3, "keyAnchor"));
  id v12 = a5;
  if ((v11 & 1) == 0) {
    id v12 = [a3 keyAnchor];
  }
  id v83 = v12;
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x2020000000;
  char v77 = 0;
  char v77 = objc_msgSend(a5, "isEqualToAnchor:", objc_msgSend(a3, "keyAnchor")) ^ 1;
  if (*((unsigned char *)v75 + 24)
    || (objc_msgSend(objc_msgSend(a4, "primitiveAnchor"), "isEqualToAnchor:", objc_msgSend(objc_msgSend(a3, "stopAnchor"), "primitiveAnchor")) & 1) == 0)
  {
    id v14 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithSet:", objc_msgSend(a3, "apps"));
    id v51 = objc_alloc_init((Class)NSMutableSet);
    v64 = _NSConcreteStackBlock;
    uint64_t v65 = 3221225472;
    v66 = sub_9C98;
    v67 = &unk_209F0;
    id v68 = v14;
    id v69 = v51;
    id v70 = a7;
    id v71 = v10;
    v72 = &v78;
    v73 = &v74;
    AFApplicationWorkspaceEnumerateInstalledUserVisibleApplications();
    if (*((unsigned char *)v75 + 24))
    {
      id v15 = [a3 keyAnchor];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v16 = [v14 countByEnumeratingWithState:&v60 objects:v94 count:16];
      if (v16)
      {
        id v48 = a3;
        uint64_t v17 = *(void *)v61;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v61 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v60 + 1) + 8 * i);
            id v15 = [v15 anchorByIncrementingSubIndex];
            v20 = [[AAPSyncMetaDataItemDelete alloc] initWithAppId:v19 anchor:v15];
            [v10 addObject:v20];

            v21 = AFSiriLogContextPlugin;
            if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v85 = "+[AAPSyncMetaDataSource _createSourceInfoForLastState:startAnchor:keyAnchor:validity:configuration:]";
              __int16 v86 = 2112;
              id v87 = v20;
              _os_log_debug_impl(&dword_0, v21, OS_LOG_TYPE_DEBUG, "%s com.apple.siri.applications: inserting delete metaDataItem=%@", buf, 0x16u);
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v60 objects:v94 count:16];
        }
        while (v16);
        char v22 = 0;
        a3 = v48;
        goto LABEL_24;
      }
    }
    else if ([v14 count])
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_14DDC();
      }
      char v22 = 1;
LABEL_24:

      if (v22)
      {
        v23 = 0;
        id v24 = 0;
        goto LABEL_60;
      }
      goto LABEL_26;
    }
    char v22 = 0;
    goto LABEL_24;
  }
  v13 = AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v85 = "+[AAPSyncMetaDataSource _createSourceInfoForLastState:startAnchor:keyAnchor:validity:configuration:]";
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: no need to query MI if we only need to send up some delete records", buf, 0xCu);
  }
  id v51 = 0;
LABEL_26:
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v25 = a3;
  id v26 = [a3 deletes];
  id v27 = [v26 countByEnumeratingWithState:&v56 objects:v93 count:16];
  if (!v27) {
    goto LABEL_40;
  }
  uint64_t v28 = *(void *)v57;
  do
  {
    v29 = 0;
    do
    {
      if (*(void *)v57 != v28) {
        objc_enumerationMutation(v26);
      }
      v30 = *(void **)(*((void *)&v56 + 1) + 8 * (void)v29);
      if (objc_msgSend(v51, "containsObject:", objc_msgSend(v30, "appId")))
      {
        v31 = AFSiriLogContextPlugin;
        if (!os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_35;
        }
        id v32 = [v30 appId];
        *(_DWORD *)buf = 136315394;
        v85 = "+[AAPSyncMetaDataSource _createSourceInfoForLastState:startAnchor:keyAnchor:validity:configuration:]";
        __int16 v86 = 2112;
        id v87 = v32;
        v33 = v31;
        v34 = "%s com.apple.siri.applications: not applying saved delete because the app has been re-added -> (%@)";
      }
      else
      {
        [v10 addObject:v30];
        v35 = AFSiriLogContextPlugin;
        if (!os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_35;
        }
        *(_DWORD *)buf = 136315394;
        v85 = "+[AAPSyncMetaDataSource _createSourceInfoForLastState:startAnchor:keyAnchor:validity:configuration:]";
        __int16 v86 = 2112;
        id v87 = v30;
        v33 = v35;
        v34 = "%s com.apple.siri.applications: applying saved delete metaDataItem=%@";
      }
      _os_log_debug_impl(&dword_0, v33, OS_LOG_TYPE_DEBUG, v34, buf, 0x16u);
LABEL_35:
      v29 = (char *)v29 + 1;
    }
    while (v27 != v29);
    id v36 = [v26 countByEnumeratingWithState:&v56 objects:v93 count:16];
    id v27 = v36;
  }
  while (v36);
LABEL_40:
  [v10 sortUsingComparator:&stru_20A30];
  id v37 = objc_alloc_init((Class)NSMutableArray);
  id v38 = [v25 stopAnchor];
  id v24 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v39 = [v10 countByEnumeratingWithState:&v52 objects:v92 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v53;
    do
    {
      for (j = 0; j != v39; j = (char *)j + 1)
      {
        if (*(void *)v53 != v40) {
          objc_enumerationMutation(v10);
        }
        v42 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
        id v43 = [v42 anchor];
        if ([v43 isNewerThanAnchor:a4])
        {
          [v24 addObject:v42];
          if ([v42 isMetaDataItemDelete]) {
            [v37 addObject:v42];
          }
          if ([v43 isNewerThanAnchor:v38]) {
            id v38 = v43;
          }
        }
      }
      id v39 = [v10 countByEnumeratingWithState:&v52 objects:v92 count:16];
    }
    while (v39);
  }
  v44 = AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v85 = "+[AAPSyncMetaDataSource _createSourceInfoForLastState:startAnchor:keyAnchor:validity:configuration:]";
    __int16 v86 = 2114;
    id v87 = a4;
    __int16 v88 = 2114;
    id v89 = v38;
    __int16 v90 = 2112;
    id v91 = v24;
    _os_log_debug_impl(&dword_0, v44, OS_LOG_TYPE_DEBUG, "%s com.apple.siri.applications: sorted and trimmed metaData to range (%{public}@, %{public}@) -> %@", buf, 0x2Au);
  }
  if (*((unsigned char *)v75 + 24))
  {
    v45 = [AAPSyncState alloc];
    v23 = [(AAPSyncState *)v45 initWithValidity:a6 version:4 keyAnchor:v79[5] startAnchor:a4 stopAnchor:v38 apps:v51 deletes:v37];
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
      sub_14D68();
    }
  }
  else
  {
    v23 = (AAPSyncState *)v25;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
      sub_14CF4();
    }
  }

LABEL_60:
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);
  v46 = v24;
  v47 = v23;
  result.var1 = v47;
  result.var0 = v46;
  return result;
}

- (NSArray)metaData
{
  return self->_metaData;
}

- (AAPSyncState)state
{
  return self->_state;
}

@end