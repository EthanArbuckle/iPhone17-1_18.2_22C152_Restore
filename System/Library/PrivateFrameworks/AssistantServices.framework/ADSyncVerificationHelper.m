@interface ADSyncVerificationHelper
- (ADSyncVerificationHelper)init;
- (id)_groupKeyForSyncInfo:(id)a3 domainObject:(id)a4;
- (id)checksums;
- (void)handleSyncChunkInfo:(id)a3 withSyncInfo:(id)a4 completion:(id)a5;
@end

@implementation ADSyncVerificationHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idCRCChecksums, 0);
  objc_storeStrong((id *)&self->_checksums, 0);
}

- (id)checksums
{
  v3 = +[NSMutableArray arrayWithCapacity:[(NSMutableDictionary *)self->_checksums count]];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(NSMutableDictionary *)self->_checksums allKeys];
  id v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v9 = [(NSMutableDictionary *)self->_checksums objectForKey:v8];
        v10 = [(NSMutableDictionary *)self->_idCRCChecksums objectForKey:v8];
        id v11 = [v10 longLongValue];

        id v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%lld", v11);
        [v9 setIdentifierChecksum:v12];

        v13 = [v9 syncAnchor];
        objc_msgSend(v13, "setCount:", objc_msgSend(v9, "count"));
        [v9 setSyncAnchor:v13];
        [v3 addObject:v9];
      }
      id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)handleSyncChunkInfo:(id)a3 withSyncInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 toRemove];
  id v12 = [v11 count];

  v13 = AFSiriLogContextSync;
  v52 = (void (**)(void, void))v10;
  if (v12 && os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v66 = "-[ADSyncVerificationHelper handleSyncChunkInfo:withSyncInfo:completion:]";
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Sync Verification: domain objects in toRemove list for sync verification", buf, 0xCu);
    v13 = AFSiriLogContextSync;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v66 = "-[ADSyncVerificationHelper handleSyncChunkInfo:withSyncInfo:completion:]";
    __int16 v67 = 2112;
    id v68 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s with chunk info %@", buf, 0x16u);
  }
  v48 = +[NSMutableSet set];
  id v14 = objc_alloc((Class)NSMutableDictionary);
  v15 = [v8 toAdd];
  id v50 = objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

  long long v17 = [v8 toAdd];
  v49 = v8;
  if (v17)
  {
    long long v18 = +[AceObject aceObjectArrayWithDictionaryArray:baseClass:](AceObject, "aceObjectArrayWithDictionaryArray:baseClass:", v17, objc_opt_class(), v48);
  }
  else
  {
    long long v18 = 0;
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v18;
  id v19 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  v53 = v9;
  if (v19)
  {
    id v20 = v19;
    uint64_t v54 = *(void *)v60;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v60 != v54) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        v23 = -[ADSyncVerificationHelper _groupKeyForSyncInfo:domainObject:](self, "_groupKeyForSyncInfo:domainObject:", v9, v22, v48);
        id v24 = [(NSMutableDictionary *)self->_checksums objectForKey:v23];
        if (!v24)
        {
          id v24 = objc_alloc_init((Class)SASyncGroupChecksum);
          v25 = [v22 encodedClassName];
          [v24 setDomainObjectClass:v25];

          id v26 = objc_alloc_init((Class)SASyncAnchor);
          v27 = [v9 key];
          [v26 setKey:v27];

          [v24 setSyncAnchor:v26];
          [(NSMutableDictionary *)self->_checksums setObject:v24 forKey:v23];
        }
        objc_msgSend(v24, "setCount:", (char *)objc_msgSend(v24, "count") + 1);
        v28 = [v22 identifier];
        v29 = [v28 absoluteString];

        if ([v29 length])
        {
          id v30 = [v29 dataUsingEncoding:4];
          uLong v31 = crc32(0, (const Bytef *)[v30 bytes], (uInt)objc_msgSend(v30, "length"));
          v32 = [(NSMutableDictionary *)self->_idCRCChecksums objectForKey:v23];
          v33 = (char *)[v32 longLongValue];

          idCRCChecksums = self->_idCRCChecksums;
          v35 = +[NSNumber numberWithLongLong:&v33[v31]];
          [(NSMutableDictionary *)idCRCChecksums setObject:v35 forKey:v23];

          if (v52)
          {
            id v36 = [v50 objectForKey:v23];
            if (!v36)
            {
              id v36 = objc_alloc_init((Class)NSMutableArray);
              [v50 setObject:v36 forKey:v23];
            }
            [v36 addObject:v29];
          }
          id v9 = v53;
        }
        else
        {
          v37 = AFSiriLogContextSync;
          if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v66 = "-[ADSyncVerificationHelper handleSyncChunkInfo:withSyncInfo:completion:]";
            __int16 v67 = 2112;
            id v68 = v22;
            _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s Sync verification got domain object with no identifier %@", buf, 0x16u);
          }
        }
      }
      id v20 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v20);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v38 = v48;
  id v39 = [v38 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v56;
    do
    {
      for (j = 0; j != v40; j = (char *)j + 1)
      {
        if (*(void *)v56 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = *(void *)(*((void *)&v55 + 1) + 8 * (void)j);
        v44 = -[NSMutableDictionary objectForKey:](self->_checksums, "objectForKey:", v43, v48);
        v45 = [v44 syncAnchor];
        v46 = [v49 validity];
        [v45 setValidity:v46];

        v47 = [v49 post];
        [v45 setGeneration:v47];

        [v44 setSyncAnchor:v45];
        [(NSMutableDictionary *)self->_checksums setObject:v44 forKey:v43];
      }
      id v40 = [v38 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v40);
  }

  if (v52 && [v50 count]) {
    ((void (**)(void, id))v52)[2](v52, v50);
  }
}

- (id)_groupKeyForSyncInfo:(id)a3 domainObject:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 key];
  id v8 = [v6 appMetadata];

  id v9 = objc_msgSend(v8, "_af_preferredBundleID");
  id v10 = [v8 syncSlots];
  id v11 = [v10 firstObject];

  id v12 = +[SASyncAnchor _af_normalizedKeyForKey:v7 appBundleID:v9 syncSlotName:v11];
  v13 = [v5 encodedClassName];

  id v14 = +[NSString stringWithFormat:@"%@-%@", v12, v13];

  return v14;
}

- (ADSyncVerificationHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)ADSyncVerificationHelper;
  v2 = [(ADSyncVerificationHelper *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    checksums = v2->_checksums;
    v2->_checksums = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    idCRCChecksums = v2->_idCRCChecksums;
    v2->_idCRCChecksums = v5;
  }
  return v2;
}

@end