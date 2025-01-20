@interface AAPSyncHandler
+ (void)_checkIfResetIsNeededForKey:(id)a3 withStartAnchorString:(id)a4 validity:(id)a5 lastState:(id)a6 completion:(id)a7;
- (AAPSyncHandler)init;
- (id)currentSyncSnapshot;
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7 configuration:(id)a8;
- (void)dealloc;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)sourceIsReady:(id)a3;
- (void)syncDidEnd;
@end

@implementation AAPSyncHandler

- (AAPSyncHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)AAPSyncHandler;
  v2 = [(AAPSyncHandler *)&v6 init];
  if (v2)
  {
    v3 = dispatch_queue_create([+[NSString stringWithFormat:@"%@.state", @"com.apple.siri.applications"] UTF8String], 0);
    v2->_stateQueue = (OS_dispatch_queue *)v3;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_746C;
    block[3] = &unk_20848;
    block[4] = v2;
    dispatch_async(v3, block);
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_stateQueue);

  v3.receiver = self;
  v3.super_class = (Class)AAPSyncHandler;
  [(AAPSyncHandler *)&v3 dealloc];
}

+ (void)_checkIfResetIsNeededForKey:(id)a3 withStartAnchorString:(id)a4 validity:(id)a5 lastState:(id)a6 completion:(id)a7
{
  uint64_t v52 = 0;
  id v12 = +[AAPSyncAnchor anchorFromStringRepresentation:a4 error:&v52];
  id v13 = +[LSApplicationWorkspace defaultWorkspace];
  if (v13)
  {
    *(void *)buf = 0;
    id v51 = 0;
    [v13 getKnowledgeUUID:buf andSequenceNumber:&v51];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = objc_msgSend(objc_msgSend(*(id *)buf, "UUIDString"), "copy");
    }
    else
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_14288();
      }
      id v14 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = +[AAPSyncPrimitiveAnchor anchorFromIndex:](AAPSyncPrimitiveAnchor, "anchorFromIndex:", [v51 unsignedIntegerValue]);
      goto LABEL_15;
    }
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_14214();
    }
  }
  else
  {
    v15 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_14190(v15);
    }
    id v14 = 0;
  }
  id v16 = 0;
LABEL_15:
  if (([@"com.apple.siri.applications" isEqualToString:a3] & 1) == 0)
  {
    +[NSException raise:@"wrong syncKey", @"expecting %@", @"com.apple.siri.applications" format];
    goto LABEL_42;
  }
  if (a4 && !v12)
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_1411C();
    }
    goto LABEL_42;
  }
  if (!v14
    || !objc_msgSend(v14, "isEqualToString:", objc_msgSend(a6, "validity"))
    || ![v14 isEqualToString:a5])
  {
    v48 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG))
    {
      id v50 = [a6 validity];
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "+[AAPSyncHandler _checkIfResetIsNeededForKey:withStartAnchorString:validity:lastState:completion:]";
      __int16 v54 = 2114;
      id v55 = v14;
      __int16 v56 = 2114;
      id v57 = v50;
      __int16 v58 = 2114;
      id v59 = a5;
      v45 = "%s com.apple.siri.applications: validity check failed: MI-'%{public}@' Internal-'%{public}@' Sync-'%{public}@'";
      v46 = v48;
      uint32_t v47 = 42;
      goto LABEL_47;
    }
LABEL_42:
    id v12 = 0;
    uint64_t v49 = 1;
    goto LABEL_43;
  }
  v17 = AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
    sub_140A4(v17, v18, v19, v20, v21, v22, v23, v24);
  }
  v25 = (int *)[a6 version];
  v26 = AFSiriLogContextPlugin;
  BOOL v27 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG);
  if (v25 != &dword_4)
  {
    if (v27) {
      sub_13FF8(a6, v26);
    }
    goto LABEL_42;
  }
  if (v27) {
    sub_13F80(v26, v28, v29, v30, v31, v32, v33, v34);
  }
  id v35 = [a6 keyAnchor];
  unsigned __int8 v36 = [v35 isNewerThanAnchor:v16];
  if (!v16 || (v36 & 1) != 0)
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
      sub_13EFC();
    }
    goto LABEL_42;
  }
  id v37 = [a6 startAnchor];
  unsigned int v38 = [v12 isOlderThanAnchor:v37];
  unsigned int v39 = [v12 isNewerThanAnchor:v16];
  unsigned int v40 = v39;
  if (v12) {
    unsigned int v41 = v39;
  }
  else {
    unsigned int v41 = 0;
  }
  if (v37) {
    int v42 = 1;
  }
  else {
    int v42 = v41;
  }
  v43 = AFSiriLogContextPlugin;
  BOOL v44 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG);
  if (v42 == 1 && ((v38 | v40) & 1) != 0)
  {
    if (v44)
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "+[AAPSyncHandler _checkIfResetIsNeededForKey:withStartAnchorString:validity:lastState:completion:]";
      __int16 v54 = 2114;
      id v55 = v37;
      __int16 v56 = 2114;
      id v57 = v12;
      __int16 v58 = 2114;
      id v59 = v35;
      __int16 v60 = 2114;
      id v61 = v16;
      v45 = "%s com.apple.siri.applications: startAnchor check failed: lastStart=%{public}@ start=%{public}@ lastKey=%{pu"
            "blic}@ key=%{public}@";
      v46 = v43;
      uint32_t v47 = 52;
LABEL_47:
      _os_log_debug_impl(&dword_0, v46, OS_LOG_TYPE_DEBUG, v45, buf, v47);
      goto LABEL_42;
    }
    goto LABEL_42;
  }
  if (v44)
  {
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = "+[AAPSyncHandler _checkIfResetIsNeededForKey:withStartAnchorString:validity:lastState:completion:]";
    __int16 v54 = 2114;
    id v55 = v37;
    __int16 v56 = 2114;
    id v57 = v12;
    __int16 v58 = 2114;
    id v59 = v35;
    __int16 v60 = 2114;
    id v61 = v16;
    _os_log_debug_impl(&dword_0, v43, OS_LOG_TYPE_DEBUG, "%s com.apple.siri.applications: startAnchor checks out:  lastStart=%{public}@ start=%{public}@ lastKey=%{public}@ key=%{public}@", buf, 0x34u);
  }
  uint64_t v49 = 0;
LABEL_43:
  (*((void (**)(id, uint64_t, id, id, id))a7 + 2))(a7, v49, v12, v16, v14);
}

- (id)currentSyncSnapshot
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = sub_7B34;
  v10 = sub_7B44;
  uint64_t v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_7B50;
  v5[3] = &unk_20898;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 count:(int64_t)a5 forKey:(id)a6 beginInfo:(id)a7 configuration:(id)a8
{
  stateQueue = self->_stateQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_7DA8;
  v9[3] = &unk_208E8;
  v9[4] = self;
  v9[5] = a6;
  v9[6] = a3;
  v9[7] = a4;
  v9[8] = a7;
  v9[9] = a8;
  dispatch_sync(stateQueue, v9);
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  uint64_t v12 = 0;
  id v7 = +[AAPSyncAnchor anchorFromStringRepresentation:a3 error:&v12];
  id v8 = v7;
  if (a3 && !v7)
  {
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
      sub_1449C();
    }
LABEL_5:
    [a4 setPostAnchor:a3];
    return;
  }
  processor = self->_processor;
  if (!processor)
  {
    source = self->_source;
    uint64_t v11 = AFSiriLogContextPlugin;
    if (source)
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_14418(v11);
      }
    }
    else if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[AAPSyncHandler getChangeAfterAnchor:changeInfo:]";
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: nothing to do - terminating sync", buf, 0xCu);
    }
    goto LABEL_5;
  }
  [(AAPSyncMetaDataProcessor *)processor processNextChange:a4 afterAnchor:v8];
}

- (void)syncDidEnd
{
  v2 = AFSiriLogContextPlugin;
  if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    v4 = "-[AAPSyncHandler syncDidEnd]";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%s com.apple.siri.applications: sync did end", (uint8_t *)&v3, 0xCu);
  }
}

- (void)sourceIsReady:(id)a3
{
  stateQueue = self->_stateQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_8514;
  v4[3] = &unk_20910;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(stateQueue, v4);
}

@end