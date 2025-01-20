@interface ADSyncSnapshot
+ (id)sharedInstance;
- (ADSyncSnapshot)init;
- (BOOL)_pruneAppsCacheWithTruth:(id)a3;
- (BOOL)shouldIgnoreSyncKey:(id)a3;
- (id)_storePath;
- (void)_cancelSaveTimer;
- (void)_fetchSentAnchorsOnQueue:(id)a3 completion:(id)a4;
- (void)_noteSendingPostGen:(id)a3 validity:(id)a4 key:(id)a5 appMetaData:(id)a6;
- (void)_readFromDisk;
- (void)_save;
- (void)_scheduleSave;
- (void)deleteSavedSnapshots;
- (void)fetchSentAnchorsOnQueue:(id)a3 completion:(id)a4;
- (void)noteSendingChunk:(id)a3;
- (void)pruneCacheWithCurrentSynapseInfo:(id)a3;
@end

@implementation ADSyncSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_appsCache, 0);
  objc_storeStrong((id *)&self->_pluginCache, 0);
}

- (void)_save
{
  v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[ADSyncSnapshot _save]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSMutableDictionary count](self->_appsCache, "count"));
  appsCache = self->_appsCache;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000B61D0;
  v21[3] = &unk_100500C20;
  id v7 = v5;
  id v22 = v7;
  [(NSMutableDictionary *)appsCache enumerateKeysAndObjectsUsingBlock:v21];
  if ([v7 count]) {
    [v4 setValue:v7 forKey:AFSynapseSyncAnchorKey];
  }
  id v8 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSMutableDictionary count](self->_pluginCache, "count"));
  pluginCache = self->_pluginCache;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000B62C0;
  v19[3] = &unk_100500BD0;
  id v10 = v8;
  id v20 = v10;
  [(NSMutableDictionary *)pluginCache enumerateKeysAndObjectsUsingBlock:v19];
  if ([v10 count]) {
    [v4 setValue:v10 forKey:@"Plugins"];
  }
  if ([v4 count])
  {
    id v18 = 0;
    v11 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:200 options:0 error:&v18];
    id v12 = v18;
    if (!v11)
    {
      v13 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[ADSyncSnapshot _save]";
        __int16 v25 = 2112;
        id v26 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Could not convert in-memory representation to plist %@", buf, 0x16u);
      }
    }
    v14 = [(ADSyncSnapshot *)self _storePath];
    unsigned __int8 v15 = [v11 writeToFile:v14 atomically:1];

    if ((v15 & 1) == 0)
    {
      v16 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[ADSyncSnapshot _save]";
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s Failed to write plist to disk", buf, 0xCu);
      }
    }
  }
  else
  {
    v17 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[ADSyncSnapshot _save]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s No anchors to save, so removing any existing files.", buf, 0xCu);
    }
    id v12 = +[NSFileManager defaultManager];
    v11 = [(ADSyncSnapshot *)self _storePath];
    [v12 removeItemAtPath:v11 error:0];
  }

  [(ADSyncSnapshot *)self _cancelSaveTimer];
}

- (void)pruneCacheWithCurrentSynapseInfo:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B6440;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)_pruneAppsCacheWithTruth:(id)a3
{
  id v26 = a3;
  if ([(NSMutableDictionary *)self->_appsCache count])
  {
    id v4 = [(NSMutableDictionary *)self->_appsCache allKeys];
    id v5 = [v4 copy];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v5;
    id v25 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
    char v6 = 0;
    if (v25)
    {
      uint64_t v24 = *(void *)v34;
      while (2)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v33 + 1) + 8 * v7);
          v9 = [v26 objectForKey:v8];
          if (![v9 count])
          {
            v21 = AFSiriLogContextDaemon;
            if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v38 = "-[ADSyncSnapshot _pruneAppsCacheWithTruth:]";
              __int16 v39 = 2112;
              uint64_t v40 = v8;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s App %@ no longer has synapse data, removing from cache.", buf, 0x16u);
            }
            [(NSMutableDictionary *)self->_appsCache removeObjectForKey:v8];

            char v6 = 1;
            goto LABEL_25;
          }
          uint64_t v27 = v7;
          v28 = v9;
          id v10 = [objc_alloc((Class)NSSet) initWithArray:v9];
          v11 = [(NSMutableDictionary *)self->_appsCache objectForKey:v8];
          id v12 = [v11 copy];

          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v13 = v12;
          id v14 = [v13 countByEnumeratingWithState:&v29 objects:v43 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v30;
            do
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v30 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
                if (([v10 containsObject:v18] & 1) == 0)
                {
                  v19 = AFSiriLogContextDaemon;
                  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 136315650;
                    v38 = "-[ADSyncSnapshot _pruneAppsCacheWithTruth:]";
                    __int16 v39 = 2112;
                    uint64_t v40 = v8;
                    __int16 v41 = 2112;
                    uint64_t v42 = v18;
                    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s %@/%@ info is no longer on disk, removing from cache.", buf, 0x20u);
                  }
                  id v20 = [(NSMutableDictionary *)self->_appsCache objectForKey:v8];
                  [v20 removeObjectForKey:v18];

                  char v6 = 1;
                }
              }
              id v15 = [v13 countByEnumeratingWithState:&v29 objects:v43 count:16];
            }
            while (v15);
          }

          uint64_t v7 = v27 + 1;
        }
        while ((id)(v27 + 1) != v25);
        id v25 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
LABEL_25:
  }
  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

- (void)_readFromDisk
{
  id v3 = objc_alloc((Class)NSData);
  id v4 = [(ADSyncSnapshot *)self _storePath];
  id v5 = [v3 initWithContentsOfFile:v4];

  if ([v5 length])
  {
    id v35 = 0;
    char v6 = +[NSPropertyListSerialization propertyListWithData:v5 options:2 format:0 error:&v35];
    uint64_t v7 = (__CFString *)v35;
    if (v6)
    {
      if (objc_opt_respondsToSelector())
      {
        CFStringRef v28 = (const __CFString *)AFSynapseSyncAnchorKey;
        uint64_t v8 = objc_msgSend(v6, "objectForKey:");
        v9 = [v6 objectForKey:@"Plugins"];
        id v10 = objc_alloc_init((Class)NSMutableDictionary);
        long long v30 = v10;
        if (objc_opt_respondsToSelector())
        {
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_1000B6D78;
          v33[3] = &unk_100503E00;
          v33[4] = self;
          id v34 = v10;
          [v9 enumerateKeysAndObjectsUsingBlock:v33];
        }
        else if (v9)
        {
          v17 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v37 = "-[ADSyncSnapshot _readFromDisk]";
            __int16 v38 = 2112;
            CFStringRef v39 = @"Plugins";
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Saved %@ data is invalid, continuing...", buf, 0x16u);
          }
        }
        uint64_t v18 = v30;
        if ([v30 count]) {
          objc_storeStrong((id *)&self->_pluginCache, v30);
        }
        id v19 = objc_alloc_init((Class)NSMutableDictionary);
        if (objc_opt_respondsToSelector())
        {
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_1000B6E9C;
          v31[3] = &unk_100504E58;
          id v32 = v19;
          [v8 enumerateKeysAndObjectsUsingBlock:v31];
        }
        else if (v8)
        {
          id v20 = AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v37 = "-[ADSyncSnapshot _readFromDisk]";
            __int16 v38 = 2112;
            CFStringRef v39 = v28;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s Saved %@ data is invalid, continuing...", buf, 0x16u);
          }
        }
        p_pluginCache = &self->_pluginCache;
        objc_storeStrong((id *)&self->_pluginCache, v30);
        p_appsCache = &self->_appsCache;
        objc_storeStrong((id *)&self->_appsCache, v19);
        v23 = (void *)AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          id v29 = v19;
          uint64_t v24 = *p_pluginCache;
          id v25 = v23;
          id v26 = +[NSNumber numberWithUnsignedInteger:[(NSMutableDictionary *)v24 count]];
          uint64_t v18 = v30;
          uint64_t v27 = +[NSNumber numberWithUnsignedInteger:[(NSMutableDictionary *)*p_appsCache count]];
          *(_DWORD *)buf = 136315650;
          v37 = "-[ADSyncSnapshot _readFromDisk]";
          __int16 v38 = 2112;
          CFStringRef v39 = v26;
          __int16 v40 = 2112;
          __int16 v41 = v27;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s Loaded sent sync anchors (%@ plugin anchors, %@ SiriKit anchors)", buf, 0x20u);

          id v19 = v29;
        }

        goto LABEL_26;
      }
      uint64_t v16 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[ADSyncSnapshot _readFromDisk]";
        id v13 = "%s Saved data is invalid!";
        id v14 = v16;
        uint32_t v15 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      id v12 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "-[ADSyncSnapshot _readFromDisk]";
        __int16 v38 = 2112;
        CFStringRef v39 = v7;
        id v13 = "%s Could not deserialize file %@";
        id v14 = v12;
        uint32_t v15 = 22;
LABEL_12:
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      }
    }
LABEL_26:

    goto LABEL_27;
  }
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[ADSyncSnapshot _readFromDisk]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Nothing saved", buf, 0xCu);
  }
LABEL_27:
}

- (BOOL)shouldIgnoreSyncKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:AFIntentSupportAndVocabSyncKey]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:AFIntentSupportAndVocabSyncNanoKey];
  }

  return v4;
}

- (void)deleteSavedSnapshots
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B720C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)noteSendingChunk:(id)a3
{
  id v4 = a3;
  id v5 = [v4 key];
  id v6 = [v5 copy];

  if ([(ADSyncSnapshot *)self shouldIgnoreSyncKey:v6])
  {
    uint64_t v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v24 = "-[ADSyncSnapshot noteSendingChunk:]";
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Not caching %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v8 = [v4 postGen];
    id v9 = [v8 copy];

    id v10 = [v4 validity];
    id v11 = [v10 copy];

    id v12 = [v4 appMetaData];
    id v13 = [v12 copy];

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B74E4;
    block[3] = &unk_100507F88;
    block[4] = self;
    id v19 = v9;
    id v20 = v11;
    id v21 = v6;
    id v22 = v13;
    id v15 = v13;
    id v16 = v11;
    id v17 = v9;
    dispatch_async(queue, block);
  }
}

- (void)_noteSendingPostGen:(id)a3 validity:(id)a4 key:(id)a5 appMetaData:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v12 length])
  {
    id v14 = objc_alloc_init(_ADChunkInfo);
    [(_ADChunkInfo *)v14 setValidity:v11];
    [(_ADChunkInfo *)v14 setPostGen:v10];
    if ([v12 isEqualToString:AFSynapseSyncAnchorKey])
    {
      id v25 = v10;
      uint64_t v15 = objc_msgSend(v13, "_af_preferredBundleID");
      id v16 = [v13 syncSlots];
      id v17 = [(NSMutableDictionary *)self->_appsCache objectForKey:v15];
      if (!v17)
      {
        id v17 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v16, "count"));
        [(NSMutableDictionary *)self->_appsCache setObject:v17 forKey:v15];
      }
      uint64_t v24 = (void *)v15;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v18 = v16;
      id v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v27;
        do
        {
          id v22 = 0;
          do
          {
            if (*(void *)v27 != v21) {
              objc_enumerationMutation(v18);
            }
            objc_msgSend(v17, "setObject:forKey:", v14, *(void *)(*((void *)&v26 + 1) + 8 * (void)v22), v24);
            id v22 = (char *)v22 + 1;
          }
          while (v20 != v22);
          id v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v20);
      }

      id v10 = v25;
    }
    else
    {
      [(NSMutableDictionary *)self->_pluginCache setObject:v14 forKey:v12];
    }
    [(ADSyncSnapshot *)self _scheduleSave];
  }
  else
  {
    v23 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v32 = "-[ADSyncSnapshot _noteSendingPostGen:validity:key:appMetaData:]";
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s Missing key, ignoring this sync chunk", buf, 0xCu);
    }
  }
}

- (void)_scheduleSave
{
  saveTimer = self->_saveTimer;
  if (!saveTimer)
  {
    id v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    id v5 = self->_saveTimer;
    self->_saveTimer = v4;

    id v6 = self->_saveTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000B78F8;
    handler[3] = &unk_10050E138;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_activate((dispatch_object_t)self->_saveTimer);
    saveTimer = self->_saveTimer;
  }
  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(saveTimer, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
  uint64_t v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[ADSyncSnapshot _scheduleSave]";
    __int16 v12 = 2048;
    uint64_t v13 = 0x4024000000000000;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Waiting %.4g seconds to save", buf, 0x16u);
  }
}

- (void)_cancelSaveTimer
{
  saveTimer = self->_saveTimer;
  if (saveTimer)
  {
    dispatch_source_cancel(saveTimer);
    id v4 = self->_saveTimer;
    self->_saveTimer = 0;
  }
}

- (void)fetchSentAnchorsOnQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (!v6)
    {
      id v6 = &_dispatch_main_q;
      id v8 = &_dispatch_main_q;
    }
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B7AB8;
    block[3] = &unk_10050E1D8;
    block[4] = self;
    id v6 = v6;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(queue, block);
  }
  else
  {
    id v10 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[ADSyncSnapshot fetchSentAnchorsOnQueue:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Can not get anchors without a completion block", buf, 0xCu);
    }
  }
}

- (void)_fetchSentAnchorsOnQueue:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  pluginCache = self->_pluginCache;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000B7C6C;
  v20[3] = &unk_100500BD0;
  id v10 = v8;
  id v21 = v10;
  [(NSMutableDictionary *)pluginCache enumerateKeysAndObjectsUsingBlock:v20];
  appsCache = self->_appsCache;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000B7CD0;
  v18[3] = &unk_100504E58;
  id v12 = v10;
  id v19 = v12;
  [(NSMutableDictionary *)appsCache enumerateKeysAndObjectsUsingBlock:v18];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000B7D88;
  v15[3] = &unk_10050E188;
  id v16 = v12;
  id v17 = v6;
  id v13 = v12;
  id v14 = v6;
  dispatch_async(v7, v15);
}

- (id)_storePath
{
  v2 = AFUserSupportDirectoryPath();
  id v3 = [v2 stringByAppendingPathComponent:@"SyncSnapshot.plist"];

  return v3;
}

- (ADSyncSnapshot)init
{
  v16.receiver = self;
  v16.super_class = (Class)ADSyncSnapshot;
  v2 = [(ADSyncSnapshot *)&v16 init];
  if (v2)
  {
    id v3 = [(id)objc_opt_class() description];
    id v4 = (const char *)[v3 UTF8String];
    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    id v8 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:0];
    pluginCache = v2->_pluginCache;
    v2->_pluginCache = v8;

    id v10 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:0];
    appsCache = v2->_appsCache;
    v2->_appsCache = v10;

    id v12 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B7FA8;
    block[3] = &unk_10050E138;
    uint64_t v15 = v2;
    dispatch_async(v12, block);
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B8050;
  block[3] = &unk_10050E350;
  void block[4] = a1;
  if (qword_100585928 != -1) {
    dispatch_once(&qword_100585928, block);
  }
  v2 = (void *)qword_100585920;
  return v2;
}

@end