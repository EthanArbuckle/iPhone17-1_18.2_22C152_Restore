@interface IDSCertifiedDeliveryReplayCommitter
- (IDSCertifiedDeliveryReplayCommitter)init;
- (NSMutableDictionary)backingCache;
- (id)decryptedDataForKey:(id)a3;
- (void)commitStateForKey:(id)a3;
- (void)holdCommitBlock:(id)a3 andDecryptedData:(id)a4 withEncryptedAttributes:(id)a5 forKey:(id)a6;
- (void)setBackingCache:(id)a3;
@end

@implementation IDSCertifiedDeliveryReplayCommitter

- (IDSCertifiedDeliveryReplayCommitter)init
{
  v6.receiver = self;
  v6.super_class = (Class)IDSCertifiedDeliveryReplayCommitter;
  v2 = [(IDSCertifiedDeliveryReplayCommitter *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    backingCache = v2->_backingCache;
    v2->_backingCache = v3;
  }
  return v2;
}

- (id)decryptedDataForKey:(id)a3
{
  if (a3)
  {
    v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_backingCache, "objectForKeyedSubscript:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)holdCommitBlock:(id)a3 andDecryptedData:(id)a4 withEncryptedAttributes:(id)a5 forKey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = objc_retainBlock(v10);
    *(_DWORD *)buf = 138412802;
    id v22 = v13;
    __int16 v23 = 2048;
    id v24 = v15;
    __int16 v25 = 2048;
    id v26 = [v11 length];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Replay committer told to hold block { key: %@, block: %p, dataLength: %ld }", buf, 0x20u);
  }
  if (v10 && v11 && v13)
  {
    id v16 = [objc_alloc((Class)IDSMPDecryptionResult) initWithData:v11 encryptedAttributes:v12 withCommitState:v10 additionalDecryptionResult:0];
    [(NSMutableDictionary *)self->_backingCache setObject:v16 forKeyedSubscript:v13];
LABEL_14:

    goto LABEL_15;
  }
  if (v10)
  {
    v17 = +[IDSFoundationLog delivery];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10070B6A4(v17);
    }

    id v20 = 0;
    char v18 = (*((uint64_t (**)(id, id *))v10 + 2))(v10, &v20);
    id v16 = v20;
    if ((v18 & 1) == 0)
    {
      v19 = +[IDSFoundationLog delivery];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        sub_10070B62C((uint64_t)v16, v19);
      }
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (void)commitStateForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[IDSFoundationLog delivery];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Replay committer told to commit block { key: %@ }", buf, 0xCu);
    }

    objc_super v6 = [(NSMutableDictionary *)self->_backingCache objectForKeyedSubscript:v4];
    v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 commitBlock];
      if (v8)
      {
        v9 = +[IDSFoundationLog delivery];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = objc_retainBlock((id)v8);
          *(_DWORD *)buf = 138412546;
          id v16 = v4;
          __int16 v17 = 2048;
          id v18 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Replay committer committing block { key: %@, block: %p }", buf, 0x16u);
        }
        id v14 = 0;
        char v11 = (*(uint64_t (**)(uint64_t, id *))(v8 + 16))(v8, &v14);
        id v12 = v14;
        if ((v11 & 1) == 0)
        {
          id v13 = +[IDSFoundationLog delivery];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
            sub_10070B6E8((uint64_t)v4, (uint64_t)v12, v13);
          }
        }
      }
      [(NSMutableDictionary *)self->_backingCache setObject:0 forKeyedSubscript:v4];
    }
    else
    {
      uint64_t v8 = +[IDSFoundationLog delivery];
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "No block found for replay state { key: %@ }", buf, 0xCu);
      }
    }
  }
}

- (NSMutableDictionary)backingCache
{
  return self->_backingCache;
}

- (void)setBackingCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end