@interface EDReadLaterCloudStorage
- (EDMessagePersistence)messagePersistence;
- (EDPersistenceHookRegistry)hookRegistry;
- (EDReadLaterCloudStorage)initWithHookRegistry:(id)a3;
- (EDReadLaterCloudStorage)initWithMutableDictionary:(id)a3 hookRegistry:(id)a4;
- (id)_dateFromDictionary:(id)a3 forKey:(id)a4;
- (id)_keyForMessage:(id)a3;
- (id)_messageHashForKey:(id)a3;
- (id)cloudStorageReadLaterDateForMessage:(id)a3 displayDate:(id *)a4;
- (void)addEntryForMessage:(id)a3 date:(id)a4;
- (void)persistedDictionaryDidChangeRemotelyWithChangedItems:(id)a3 deletedItems:(id)a4;
- (void)persistenceDidChangeReadLaterDate:(id)a3 messages:(id)a4 changeIsRemote:(BOOL)a5 generationWindow:(id)a6;
- (void)persistenceDidUpdateDisplayDateForMessages:(id)a3 changeIsRemote:(BOOL)a4 generation:(int64_t)a5;
- (void)removeEntryForMessage:(id)a3;
- (void)updateDisplayDateForMessage:(id)a3 displayDate:(id)a4;
@end

@implementation EDReadLaterCloudStorage

- (EDReadLaterCloudStorage)initWithMutableDictionary:(id)a3 hookRegistry:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"EDReadLaterCloudStorage.m", 66, @"Invalid parameter not satisfying: %@", @"dictionary" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)EDReadLaterCloudStorage;
  v10 = [(EDReadLaterCloudStorage *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_persistentDictionary, a3);
    objc_storeStrong((id *)&v11->_hookRegistry, a4);
    [v9 registerMessageChangeHookResponder:v11];
  }

  return v11;
}

- (EDReadLaterCloudStorage)initWithHookRegistry:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F604F8]) initWithIdentifier:@"com.apple.mail.remindMe" encrypted:0 delegate:self];
  v6 = [(EDReadLaterCloudStorage *)self initWithMutableDictionary:v5 hookRegistry:v4];

  return v6;
}

- (void)addEntryForMessage:(id)a3 date:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v44 = a4;
  v46 = v6;
  v45 = [(EDReadLaterCloudStorage *)self _keyForMessage:v6];
  if (v45)
  {
    [v44 timeIntervalSince1970];
    double v8 = v7;
    id v9 = EDRemindMeLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v6;
      v11 = NSString;
      uint64_t v12 = [v10 globalMessageID];
      v13 = [v10 subject];
      objc_super v14 = objc_msgSend(v13, "ef_publicDescription");
      v15 = [v10 displayDate];
      v16 = [v10 readLater];
      v17 = objc_msgSend(v16, "ef_publicDescription");
      v18 = [v11 stringWithFormat:@"<id=%lld, subject=%@, displayDate=%@, readLater=%@>", v12, v14, v15, v17];

      *(_DWORD *)buf = 138543874;
      v50 = v18;
      __int16 v51 = 2114;
      v52 = v45;
      __int16 v53 = 2048;
      double v54 = v8;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Adding entry for message: %{public}@, key: %{public}@, date: %f", buf, 0x20u);
    }
    v19 = [v46 messageIDHeader];
    v20 = objc_msgSend(v19, "ec_messageIDSubstring");

    id v21 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v47 = EDReadLaterCloudStorageDictionaryKeyDate;
    v22 = [NSNumber numberWithDouble:v8];
    v48 = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    v24 = (void *)[v21 initWithDictionary:v23];

    if (v20)
    {
      [v24 setObject:v20 forKeyedSubscript:EDReadLaterCloudStorageDictionaryKeyMessageID];
    }
    else
    {
      v34 = EDRemindMeLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        id v35 = v46;
        v36 = NSString;
        uint64_t v37 = [v35 globalMessageID];
        v38 = [v35 subject];
        v43 = objc_msgSend(v38, "ef_publicDescription");
        v42 = [v35 displayDate];
        v39 = [v35 readLater];
        v40 = objc_msgSend(v39, "ef_publicDescription");
        v41 = [v36 stringWithFormat:@"<id=%lld, subject=%@, displayDate=%@, readLater=%@>", v37, v43, v42, v40];

        *(_DWORD *)buf = 138543362;
        v50 = v41;
        _os_log_error_impl(&dword_1DB39C000, v34, OS_LOG_TYPE_ERROR, "Unable to find message ID for message: %{public}@", buf, 0xCu);
      }
    }
    [(EMMutableDictionaryProtocol *)self->_persistentDictionary setObject:v24 forKey:v45];
  }
  else
  {
    v20 = EDRemindMeLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v25 = v6;
      v26 = NSString;
      uint64_t v27 = [v25 globalMessageID];
      v28 = [v25 subject];
      v29 = objc_msgSend(v28, "ef_publicDescription");
      v30 = [v25 displayDate];
      v31 = [v25 readLater];
      v32 = objc_msgSend(v31, "ef_publicDescription");
      v33 = [v26 stringWithFormat:@"<id=%lld, subject=%@, displayDate=%@, readLater=%@>", v27, v29, v30, v32];

      *(_DWORD *)buf = 138543362;
      v50 = v33;
      _os_log_error_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_ERROR, "Unable to find key for message: %{public}@", buf, 0xCu);
    }
  }
}

- (void)updateDisplayDateForMessage:(id)a3 displayDate:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v53 = a4;
  double v54 = [(EDReadLaterCloudStorage *)self _keyForMessage:v52];
  if (v54)
  {
    [v53 timeIntervalSince1970];
    double v7 = v6;
    double v8 = [v52 dateReceived];
    int v9 = [v8 isEqualToDate:v53];

    id v10 = EDRemindMeLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v49 = v9;
      id v11 = v52;
      uint64_t v12 = NSString;
      uint64_t v13 = [v11 globalMessageID];
      objc_super v14 = [v11 subject];
      v15 = objc_msgSend(v14, "ef_publicDescription");
      v16 = [v11 displayDate];
      v17 = [v11 readLater];
      v18 = objc_msgSend(v17, "ef_publicDescription");
      v19 = [v12 stringWithFormat:@"<id=%lld, subject=%@, displayDate=%@, readLater=%@>", v13, v15, v16, v18];

      *(_DWORD *)buf = 138544130;
      v56 = v19;
      __int16 v57 = 2114;
      v58 = v54;
      __int16 v59 = 2048;
      double v60 = v7;
      __int16 v61 = 1024;
      int v62 = v49;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Updating display date for message: %{public}@, key: %{public}@, date: %f isDisplayDateDateReceived:%{BOOL}d", buf, 0x26u);
    }
    v20 = [(EMMutableDictionaryProtocol *)self->_persistentDictionary objectForKey:v54];
    if (v20)
    {
      id v21 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v20];
      v22 = [v20 objectForKeyedSubscript:EDReadLaterCloudStorageDictionaryKeyDisplayDate];
      if (v22)
      {
        v23 = EDRemindMeLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          id v24 = v52;
          id v25 = NSString;
          uint64_t v26 = [v24 globalMessageID];
          uint64_t v47 = [v24 subject];
          v50 = objc_msgSend(v47, "ef_publicDescription");
          v48 = [v24 displayDate];
          uint64_t v27 = [v24 readLater];
          v28 = objc_msgSend(v27, "ef_publicDescription");
          v29 = [v25 stringWithFormat:@"<id=%lld, subject=%@, displayDate=%@, readLater=%@>", v26, v50, v48, v28];

          *(_DWORD *)buf = 138543874;
          v56 = v22;
          __int16 v57 = 2114;
          v58 = v29;
          __int16 v59 = 2114;
          double v60 = *(double *)&v54;
          _os_log_error_impl(&dword_1DB39C000, v23, OS_LOG_TYPE_ERROR, "An existing display date (%{public}@) already exists for message: %{public}@, key: %{public}@", buf, 0x20u);
        }
      }
      else
      {
        v23 = [NSNumber numberWithDouble:v7];
        [v21 setObject:v23 forKeyedSubscript:EDReadLaterCloudStorageDictionaryKeyDisplayDate];
      }

      [(EMMutableDictionaryProtocol *)self->_persistentDictionary setObject:v21 forKey:v54];
    }
    else
    {
      id v21 = EDRemindMeLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v39 = v52;
        v40 = NSString;
        uint64_t v41 = [v39 globalMessageID];
        __int16 v51 = [v39 subject];
        v42 = objc_msgSend(v51, "ef_publicDescription");
        v43 = [v39 displayDate];
        id v44 = [v39 readLater];
        v45 = objc_msgSend(v44, "ef_publicDescription");
        v46 = [v40 stringWithFormat:@"<id=%lld, subject=%@, displayDate=%@, readLater=%@>", v41, v42, v43, v45];

        *(_DWORD *)buf = 138543618;
        v56 = v46;
        __int16 v57 = 2114;
        v58 = v54;
        _os_log_error_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_ERROR, "No value found for message: %{public}@, key: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    v20 = EDRemindMeLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v30 = v52;
      v31 = NSString;
      uint64_t v32 = [v30 globalMessageID];
      v33 = [v30 subject];
      v34 = objc_msgSend(v33, "ef_publicDescription");
      id v35 = [v30 displayDate];
      v36 = [v30 readLater];
      uint64_t v37 = objc_msgSend(v36, "ef_publicDescription");
      v38 = [v31 stringWithFormat:@"<id=%lld, subject=%@, displayDate=%@, readLater=%@>", v32, v34, v35, v37];

      *(_DWORD *)buf = 138543362;
      v56 = v38;
      _os_log_error_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_ERROR, "Unable to find key to update display date for message: %{public}@", buf, 0xCu);
    }
  }
}

- (void)removeEntryForMessage:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(EDReadLaterCloudStorage *)self _keyForMessage:v4];
  double v6 = EDRemindMeLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v4;
    id v7 = v4;
    double v8 = NSString;
    uint64_t v9 = [v7 globalMessageID];
    v15 = [v7 subject];
    id v10 = objc_msgSend(v15, "ef_publicDescription");
    id v11 = [v7 displayDate];
    uint64_t v12 = [v7 readLater];
    uint64_t v13 = objc_msgSend(v12, "ef_publicDescription");
    objc_super v14 = [v8 stringWithFormat:@"<id=%lld, subject=%@, displayDate=%@, readLater=%@>", v9, v10, v11, v13];

    *(_DWORD *)buf = 138543618;
    v18 = v14;
    __int16 v19 = 2114;
    v20 = v5;
    _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Removing entry for message: %{public}@, key: %{public}@", buf, 0x16u);

    id v4 = v16;
  }

  [(EMMutableDictionaryProtocol *)self->_persistentDictionary removeObjectForKey:v5];
}

- (id)cloudStorageReadLaterDateForMessage:(id)a3 displayDate:(id *)a4
{
  id v6 = a3;
  id v7 = [(EDReadLaterCloudStorage *)self _keyForMessage:v6];
  double v8 = [(EMMutableDictionaryProtocol *)self->_persistentDictionary objectForKey:v7];
  if (v8)
  {
    if (a4)
    {
      *a4 = [(EDReadLaterCloudStorage *)self _dateFromDictionary:v8 forKey:EDReadLaterCloudStorageDictionaryKeyDisplayDate];
    }
    uint64_t v9 = [(EDReadLaterCloudStorage *)self _dateFromDictionary:v8 forKey:EDReadLaterCloudStorageDictionaryKeyDate];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_keyForMessage:(id)a3
{
  v3 = NSString;
  id v4 = [a3 messageIDHeaderHash];
  v5 = objc_msgSend(v3, "stringWithFormat:", @"%lld", objc_msgSend(v4, "int64Value"));

  return v5;
}

- (void)persistenceDidChangeReadLaterDate:(id)a3 messages:(id)a4 changeIsRemote:(BOOL)a5 generationWindow:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!a5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v17 + 1) + 8 * v15);
          if (v9) {
            [(EDReadLaterCloudStorage *)self addEntryForMessage:v16 date:v9];
          }
          else {
            -[EDReadLaterCloudStorage removeEntryForMessage:](self, "removeEntryForMessage:", v16, (void)v17);
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
}

- (void)persistenceDidUpdateDisplayDateForMessages:(id)a3 changeIsRemote:(BOOL)a4 generation:(int64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = v7;
  if (!a4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v13, "displayDate", (void)v15);
          [(EDReadLaterCloudStorage *)self updateDisplayDateForMessage:v13 displayDate:v14];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (id)_dateFromDictionary:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = [a3 objectForKeyedSubscript:v5];
  id v7 = v6;
  if (v6)
  {
    double v8 = (void *)MEMORY[0x1E4F1C9C8];
    [v6 doubleValue];
    id v9 = objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    id v9 = 0;
  }
  if (([v5 isEqualToString:EDReadLaterCloudStorageDictionaryKeyDisplayDate] & 1) == 0)
  {
    uint64_t v10 = objc_msgSend(v9, "ef_dateWithTruncatedSeconds");

    id v9 = (void *)v10;
  }

  return v9;
}

- (void)persistedDictionaryDidChangeRemotelyWithChangedItems:(id)a3 deletedItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__EDReadLaterCloudStorage_persistedDictionaryDidChangeRemotelyWithChangedItems_deletedItems___block_invoke;
  v13[3] = &unk_1E6C005A0;
  v13[4] = self;
  id v9 = v8;
  id v14 = v9;
  [v6 enumerateKeysAndObjectsUsingBlock:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__EDReadLaterCloudStorage_persistedDictionaryDidChangeRemotelyWithChangedItems_deletedItems___block_invoke_2;
  v12[3] = &unk_1E6C04CC8;
  v12[4] = self;
  uint64_t v10 = objc_msgSend(v7, "ef_compactMap:", v12);
  uint64_t v11 = [(EDReadLaterCloudStorage *)self hookRegistry];
  [v11 remindMeCloudStorageChangedWithAddedOrChangedItems:v9 deletedItems:v10];
}

void __93__EDReadLaterCloudStorage_persistedDictionaryDidChangeRemotelyWithChangedItems_deletedItems___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  id v5 = [*(id *)(a1 + 32) _messageHashForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v10;
    id v7 = [*(id *)(a1 + 32) _dateFromDictionary:v6 forKey:EDReadLaterCloudStorageDictionaryKeyDate];
    id v8 = [*(id *)(a1 + 32) _dateFromDictionary:v6 forKey:EDReadLaterCloudStorageDictionaryKeyDisplayDate];
    if (v5 && v7)
    {
      id v9 = [[EDReadLaterCloudStorageChangeElement alloc] initWithMessageID:v5 readLaterDate:v7 displayDate:v8];
      [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v5];
    }
  }
}

id __93__EDReadLaterCloudStorage_persistedDictionaryDidChangeRemotelyWithChangedItems_deletedItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _messageHashForKey:a2];

  return v2;
}

- (id)_messageHashForKey:(id)a3
{
  id v3 = a3;
  if (_messageHashForKey__onceToken != -1) {
    dispatch_once(&_messageHashForKey__onceToken, &__block_literal_global_59);
  }
  id v4 = [(id)_messageHashForKey__formatter numberFromString:v3];
  uint64_t v5 = [v4 longLongValue];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F607C0]) initWithHash:v5];

  return v6;
}

uint64_t __46__EDReadLaterCloudStorage__messageHashForKey___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)_messageHashForKey__formatter;
  _messageHashForKey__formatter = (uint64_t)v0;

  v2 = (void *)_messageHashForKey__formatter;

  return [v2 setNumberStyle:1];
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);

  objc_storeStrong((id *)&self->_persistentDictionary, 0);
}

@end