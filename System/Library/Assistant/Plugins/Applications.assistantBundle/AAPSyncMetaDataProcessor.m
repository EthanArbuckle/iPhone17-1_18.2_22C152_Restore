@interface AAPSyncMetaDataProcessor
- (AAPSyncMetaDataProcessor)initWithSource:(id)a3;
- (void)_queue_processNextChange:(id)a3 afterAnchor:(id)a4 withInitialAnchor:(id)a5;
- (void)_queue_updateCache;
- (void)dealloc;
- (void)processNextChange:(id)a3 afterAnchor:(id)a4;
@end

@implementation AAPSyncMetaDataProcessor

- (AAPSyncMetaDataProcessor)initWithSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AAPSyncMetaDataProcessor;
  v4 = [(AAPSyncMetaDataProcessor *)&v8 init];
  if (v4)
  {
    v4->_queue = (OS_dispatch_queue *)dispatch_queue_create(0, 0);
    v4->_appInfoCacheCheck = (NSCondition *)objc_alloc_init((Class)NSCondition);
    queue = v4->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_8784;
    v7[3] = &unk_20910;
    v7[4] = a3;
    v7[5] = v4;
    dispatch_async(queue, v7);
  }
  return v4;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_queue);

  v3.receiver = self;
  v3.super_class = (Class)AAPSyncMetaDataProcessor;
  [(AAPSyncMetaDataProcessor *)&v3 dealloc];
}

- (void)processNextChange:(id)a3 afterAnchor:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_88DC;
  block[3] = &unk_20938;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(queue, block);
}

- (void)_queue_processNextChange:(id)a3 afterAnchor:(id)a4 withInitialAnchor:(id)a5
{
  id v9 = objc_alloc_init((Class)NSAutoreleasePool);
  unint64_t v10 = [(NSArray *)self->_metaData count];
  unint64_t lastChangeOffset = self->_lastChangeOffset;
  if (lastChangeOffset >= v10)
  {
    if (lastChangeOffset != 0x7FFFFFFFFFFFFFFFLL
      && (v37 = AFSiriLogContextPlugin, os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)))
    {
      sub_14B80(v37, v38, v39, v40, v41, v42, v43, v44);
      if (!v10) {
        goto LABEL_23;
      }
    }
    else if (!v10)
    {
      goto LABEL_23;
    }
    goto LABEL_20;
  }
  if (!objc_msgSend(objc_msgSend(-[NSArray objectAtIndex:](self->_metaData, "objectAtIndex:"), "anchor"), "isEqualToAnchor:", a4))
  {
    v45 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
      sub_14B08(v45, v46, v47, v48, v49, v50, v51, v52);
    }
LABEL_20:
    unint64_t v13 = 0;
    while (1)
    {
      id v14 = [(NSArray *)self->_metaData objectAtIndex:v13];
      if (objc_msgSend(objc_msgSend(v14, "anchor"), "isNewerThanAnchor:", a4)) {
        goto LABEL_5;
      }
      if (v10 == ++v13) {
        goto LABEL_23;
      }
    }
  }
  unint64_t v12 = self->_lastChangeOffset;
  unint64_t v13 = v12 + 1;
  if (v12 + 1 >= v10) {
    goto LABEL_23;
  }
  id v14 = [(NSArray *)self->_metaData objectAtIndex:v12 + 1];
LABEL_5:
  if (v14)
  {
    id v15 = [v14 appId];
    [(NSCondition *)self->_appInfoCacheCheck lock];
    v16 = (NSNull *)[(NSMutableDictionary *)self->_appInfoCache objectForKey:v15];
    v17 = +[NSNull null];
    if (v16 == v17)
    {
      v18 = AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
        sub_14A90(v18, v19, v20, v21, v22, v23, v24, v25);
      }
      do
      {
        [(NSCondition *)self->_appInfoCacheCheck wait];
        v26 = (NSNull *)[(NSMutableDictionary *)self->_appInfoCache objectForKey:v15];
      }
      while (v26 == +[NSNull null]);
    }
    id v27 = [(NSMutableDictionary *)self->_appInfoCache objectForKey:v15];
    if (v27)
    {
      id v28 = v27;
      if (v16 != v17)
      {
        v29 = AFSiriLogContextPlugin;
        if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
          sub_14A18(v29, v30, v31, v32, v33, v34, v35, v36);
        }
      }
    }
    else
    {
      v61 = AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
        sub_149A0(v61, v62, v63, v64, v65, v66, v67, v68);
      }
      id v28 = [v14 scrapeAppInfo];
    }
    [(NSCondition *)self->_appInfoCacheCheck unlock];
    self->_unint64_t lastChangeOffset = v13;
    [(AAPSyncMetaDataProcessor *)self _queue_updateCache];
    unsigned int v69 = AAPSyncInfoIsValidForItem(v28, v14);
    v70 = AFSiriLogContextPlugin;
    if (v69)
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
        sub_14894((uint64_t)v14, v70, v71, v72, v73, v74, v75, v76);
      }
      [a3 setObject:v28];
      if ([v14 isMetaDataItemDelete]) {
        [a3 setIsDelete:1];
      }
      objc_msgSend(a3, "setPostAnchor:", objc_msgSend(objc_msgSend(v14, "anchor"), "stringRepresentation"));
    }
    else
    {
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR)) {
        sub_14914();
      }
      -[AAPSyncMetaDataProcessor _queue_processNextChange:afterAnchor:withInitialAnchor:](self, "_queue_processNextChange:afterAnchor:withInitialAnchor:", a3, [v14 anchor], a5);
    }

    goto LABEL_42;
  }
LABEL_23:
  v53 = AFSiriLogContextPlugin;
  BOOL v54 = os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG);
  if (a4 == a5)
  {
    if (v54) {
      sub_14788((uint64_t)a4, v53, v55, v56, v57, v58, v59, v60);
    }
  }
  else if (v54)
  {
    sub_14808();
  }
  [a3 setObject:0];
  objc_msgSend(a3, "setPostAnchor:", objc_msgSend(a4, "stringRepresentation"));
LABEL_42:
  [v9 drain];
}

- (void)_queue_updateCache
{
  unint64_t v3 = [(NSArray *)self->_metaData count];
  v4 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  [(NSCondition *)self->_appInfoCacheCheck lock];
  unint64_t lastChangeOffset = self->_lastChangeOffset;
  if (lastChangeOffset == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = lastChangeOffset + 1;
  }
  unint64_t v7 = v6 + 2;
  if (v6 + 2 >= v3) {
    unint64_t v7 = v3;
  }
  self->_appInfoCacheStart = v6;
  for (self->_appInfoCacheEnd = v7; v6 < self->_appInfoCacheEnd; ++v6)
  {
    id v8 = [(NSArray *)self->_metaData objectAtIndex:v6];
    id v9 = [v8 appId];
    id v10 = [(NSMutableDictionary *)self->_appInfoCache objectForKey:v9];
    if (v10)
    {
      [(NSMutableDictionary *)v4 setObject:v10 forKey:v9];
    }
    else
    {
      [(NSMutableDictionary *)v4 setObject:+[NSNull null] forKey:v9];
      global_queue = dispatch_get_global_queue(0, 0);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_8E24;
      v12[3] = &unk_20960;
      v12[4] = v8;
      v12[5] = self;
      v12[6] = v9;
      v12[7] = v6;
      dispatch_async(global_queue, v12);
    }
  }

  self->_appInfoCache = v4;
  [(NSCondition *)self->_appInfoCacheCheck unlock];
}

@end