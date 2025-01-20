@interface CSAttSiriTCUCache
- (CSAttSiriTCUCache)init;
- (NSMutableDictionary)cachedTCUList;
- (id)getRequestIdForTCUId:(id)a3;
- (id)getTCUPackageWithTrpId:(id)a3;
- (id)getTRPIdForTCUId:(id)a3;
- (id)updateTcuState:(id)a3;
- (unint64_t)cachedTCUCount;
- (void)addTCU:(id)a3 firstTRPId:(id)a4 lastTRPId:(id)a5;
- (void)cleanUpTCUCache:(id)a3;
- (void)clearTcuCache;
- (void)setCachedTCUList:(id)a3;
@end

@implementation CSAttSiriTCUCache

- (void).cxx_destruct
{
}

- (void)setCachedTCUList:(id)a3
{
}

- (NSMutableDictionary)cachedTCUList
{
  return self->_cachedTCUList;
}

- (id)getTRPIdForTCUId:(id)a3
{
  id v4 = a3;
  cachedTCUList = self->_cachedTCUList;
  if (cachedTCUList
    && ([(NSMutableDictionary *)cachedTCUList objectForKey:v4],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v7 = [(NSMutableDictionary *)self->_cachedTCUList objectForKeyedSubscript:v4];
    v8 = [v7 lastTRPId];
  }
  else
  {
    v9 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "-[CSAttSiriTCUCache getTRPIdForTCUId:]";
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Cache object not found for tcuId: %@", (uint8_t *)&v11, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

- (id)getRequestIdForTCUId:(id)a3
{
  id v4 = a3;
  cachedTCUList = self->_cachedTCUList;
  if (cachedTCUList
    && ([(NSMutableDictionary *)cachedTCUList objectForKey:v4],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v7 = [(NSMutableDictionary *)self->_cachedTCUList objectForKeyedSubscript:v4];
    v8 = [v7 TCUPackage];
    v9 = [v8 requestId];
  }
  else
  {
    v10 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      __int16 v13 = "-[CSAttSiriTCUCache getRequestIdForTCUId:]";
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Cache object not found for tcuId: %@", (uint8_t *)&v12, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

- (void)clearTcuCache
{
  v3 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[CSAttSiriTCUCache clearTcuCache]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(NSMutableDictionary *)self->_cachedTCUList removeAllObjects];
}

- (unint64_t)cachedTCUCount
{
  cachedTCUList = self->_cachedTCUList;
  if (cachedTCUList)
  {
    return (unint64_t)[(NSMutableDictionary *)cachedTCUList count];
  }
  else
  {
    int v4 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      v6 = "-[CSAttSiriTCUCache cachedTCUCount]";
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Cache is nil!", (uint8_t *)&v5, 0xCu);
    }
    return 0;
  }
}

- (void)cleanUpTCUCache:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_cachedTCUList count];
  v6 = CSLogCategoryRequest;
  BOOL v7 = os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      cachedTCUList = self->_cachedTCUList;
      v9 = v6;
      id v10 = [(NSMutableDictionary *)cachedTCUList count];
      int v11 = self->_cachedTCUList;
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[CSAttSiriTCUCache cleanUpTCUCache:]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      v28 = (uint64_t (*)(uint64_t, uint64_t))v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s itemCount:%lu _cachedTCUList:%@", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v28 = sub_10011158C;
    v29 = sub_10011159C;
    id v30 = +[NSMutableArray array];
    int v12 = self->_cachedTCUList;
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_1001115A4;
    v20 = &unk_100251CB8;
    id v21 = v4;
    v22 = buf;
    [(NSMutableDictionary *)v12 enumerateKeysAndObjectsUsingBlock:&v17];
    if (objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "count", v17, v18, v19, v20))
    {
      __int16 v13 = CSLogCategoryRequest;
      if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = *(NSMutableDictionary **)(*(void *)&buf[8] + 40);
        *(_DWORD *)v23 = 136315394;
        v24 = "-[CSAttSiriTCUCache cleanUpTCUCache:]";
        __int16 v25 = 2112;
        v26 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s dropTCUIDList:%@", v23, 0x16u);
      }
      [(NSMutableDictionary *)self->_cachedTCUList removeObjectsForKeys:*(void *)(*(void *)&buf[8] + 40)];
    }
    id v15 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
    {
      v16 = self->_cachedTCUList;
      *(_DWORD *)v23 = 136315394;
      v24 = "-[CSAttSiriTCUCache cleanUpTCUCache:]";
      __int16 v25 = 2112;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Updated TCU-cache : %@", v23, 0x16u);
    }

    _Block_object_dispose(buf, 8);
  }
  else if (v7)
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[CSAttSiriTCUCache cleanUpTCUCache:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Empty Cached TCU List !", buf, 0xCu);
  }
}

- (void)addTCU:(id)a3 firstTRPId:(id)a4 lastTRPId:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  int v11 = [[CSAttSiriTCUCachedObject alloc] initWithTCUPackage:v8 firstTRPId:v10 lastTRPId:v9];

  if (v11)
  {
    cachedTCUList = self->_cachedTCUList;
    __int16 v13 = [v8 tcuId];
    [(NSMutableDictionary *)cachedTCUList setObject:v11 forKey:v13];

    __int16 v14 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = self->_cachedTCUList;
      int v20 = 136315394;
      id v21 = "-[CSAttSiriTCUCache addTCU:firstTRPId:lastTRPId:]";
      __int16 v22 = 2112;
      v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Updated TCU-Cache with new TCU:%@", (uint8_t *)&v20, 0x16u);
    }
  }
  v16 = (void *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self->_cachedTCUList;
    uint64_t v18 = v16;
    unsigned int v19 = [(NSMutableDictionary *)v17 count];
    int v20 = 136315394;
    id v21 = "-[CSAttSiriTCUCache addTCU:firstTRPId:lastTRPId:]";
    __int16 v22 = 1024;
    LODWORD(v23) = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s Cached TCU Count:%d", (uint8_t *)&v20, 0x12u);
  }
}

- (id)updateTcuState:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  __int16 v14 = sub_10011158C;
  id v15 = sub_10011159C;
  id v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100111AEC;
  v10[3] = &unk_100251D00;
  v10[4] = self;
  v10[5] = &v11;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];
  if (v12[5])
  {
    id v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedTCUList, "objectForKeyedSubscript:");
    v6 = [v5 lastTRPId];
  }
  else
  {
    v6 = 0;
  }
  BOOL v7 = CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    cachedTCUList = self->_cachedTCUList;
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "-[CSAttSiriTCUCache updateTcuState:]";
    __int16 v19 = 2112;
    int v20 = cachedTCUList;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Updated TCU Cache:%@", buf, 0x16u);
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)getTCUPackageWithTrpId:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10011158C;
  id v16 = sub_10011159C;
  id v17 = 0;
  cachedTCUList = self->_cachedTCUList;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100111EF4;
  v9[3] = &unk_100251CB8;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [(NSMutableDictionary *)cachedTCUList enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (CSAttSiriTCUCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSAttSiriTCUCache;
  v2 = [(CSAttSiriTCUCache *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cachedTCUList = v2->_cachedTCUList;
    v2->_cachedTCUList = v3;
  }
  return v2;
}

@end