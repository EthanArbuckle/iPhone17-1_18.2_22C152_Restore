@interface MFMessageStore
+ (Class)classForMimePart;
+ (Class)headersClass;
+ (id)log;
+ (void)setDefaultMessageHeadersClass:(Class)a3;
- (BOOL)bodyFetchRequiresNetworkActivity;
- (BOOL)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 withConsumer:(id)a6 downloadIfNecessary:(BOOL)a7 didDownload:(BOOL *)a8;
- (BOOL)dataForMimePart:(id)a3 inRange:(_NSRange)a4 withConsumer:(id)a5 downloadIfNecessary:(BOOL)a6;
- (BOOL)downloadMimePartNumber:(id)a3 message:(id)a4 withProgressBlock:(id)a5;
- (BOOL)hasCompleteDataForMimePart:(id)a3;
- (BOOL)messageCanBeTriaged:(id)a3;
- (BOOL)wantsLineEndingConversionForMIMEPart:(id)a3;
- (MFMessageStore)init;
- (MFMessageStoreObjectCache)objectCache;
- (id)_bodyForMessage:(id)a3 fetchIfNotAvailable:(BOOL)a4 updateFlags:(BOOL)a5;
- (id)_cachedBodyDataContainerForMessage:(id)a3 valueIfNotPresent:(id)a4;
- (id)_cachedBodyDataForMessage:(id)a3 valueIfNotPresent:(id)a4;
- (id)_cachedBodyForMessage:(id)a3 valueIfNotPresent:(id)a4;
- (id)_cachedHeaderDataForMessage:(id)a3 valueIfNotPresent:(id)a4;
- (id)_cachedHeadersForMessage:(id)a3 valueIfNotPresent:(id)a4;
- (id)_downloadHeadersForMessages:(id)a3;
- (id)_fetchBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 partial:(BOOL *)a6;
- (id)_setOrGetBody:(id)a3 forMessage:(id)a4 updateFlags:(BOOL)a5;
- (id)bestAlternativeForPart:(id)a3;
- (id)bodyDataForMessage:(id)a3 isComplete:(BOOL *)a4 isPartial:(BOOL *)a5 downloadIfNecessary:(BOOL)a6;
- (id)bodyForMessage:(id)a3 fetchIfNotAvailable:(BOOL)a4 updateFlags:(BOOL)a5;
- (id)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7;
- (id)decryptedTopLevelPartForPart:(id)a3;
- (id)defaultAlternativeForPart:(id)a3;
- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7;
- (id)headerDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4;
- (id)headersForMessage:(id)a3 fetchIfNotAvailable:(BOOL)a4;
- (id)newObjectCache;
- (id)uniquedString:(id)a3;
- (void)_flushAllCaches;
- (void)flushCacheForMessage:(id)a3;
- (void)setNumberOfAttachments:(unsigned int)a3 isSigned:(BOOL)a4 isEncrypted:(BOOL)a5 forMessage:(id)a6;
@end

@implementation MFMessageStore

- (id)uniquedString:(id)a3
{
  id v4 = a3;
  _MFLockGlobalLock();
  uniqueStrings = self->_uniqueStrings;
  if (uniqueStrings)
  {
    if ((unint64_t)[(NSMutableSet *)uniqueStrings count] >= 0x64) {
      [(NSMutableSet *)self->_uniqueStrings removeAllObjects];
    }
  }
  else
  {
    v6 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:100];
    v7 = self->_uniqueStrings;
    self->_uniqueStrings = v6;
  }
  v8 = [(NSMutableSet *)self->_uniqueStrings ef_uniquedObject:v4];
  _MFUnlockGlobalLock();

  return v8;
}

- (id)bodyForMessage:(id)a3 fetchIfNotAvailable:(BOOL)a4 updateFlags:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [(MFMessageStore *)self _cachedBodyForMessage:v8 valueIfNotPresent:0];
  if (!v9)
  {
    if ((![(MFMessageStore *)self bodyFetchRequiresNetworkActivity]
       || v6
       || [v8 isMessageContentsLocallyAvailable])
      && ([(MFMessageStore *)self _bodyForMessage:v8 fetchIfNotAvailable:v6 updateFlags:v5], (v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = [(MFMessageStore *)self _setOrGetBody:v10 forMessage:v8 updateFlags:v5];
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)_setOrGetBody:(id)a3 forMessage:(id)a4 updateFlags:(BOOL)a5
{
  BOOL v5 = -[MFMessageStore _cachedBodyForMessage:valueIfNotPresent:](self, "_cachedBodyForMessage:valueIfNotPresent:", a4, a3, a5);
  return v5;
}

- (id)_bodyForMessage:(id)a3 fetchIfNotAvailable:(BOOL)a4 updateFlags:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = objc_alloc_init(MFMimeBody);
  id v10 = objc_alloc_init((Class)[(id)objc_opt_class() classForMimePart]);
  [(MFMessageBody *)v9 setMessage:v8];
  [(MFMimeBody *)v9 setTopLevelPart:v10];
  [v10 setMimeBody:v9];
  if (([v10 parseMimeBodyDownloadIfNecessary:v6] & 1) == 0)
  {
    [(MFMessageBody *)v9 setMessage:0];

    v9 = 0;
    goto LABEL_5;
  }
  if (!v9)
  {
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v11 = [(MFMessageStore *)self _setOrGetBody:v9 forMessage:v8 updateFlags:v5];
LABEL_6:
  id v12 = v11;

  return v12;
}

- (id)headersForMessage:(id)a3 fetchIfNotAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(MFMessageStore *)self _cachedHeadersForMessage:v6 valueIfNotPresent:0];
  if (!v7)
  {
    id v8 = [(MFMessageStore *)self headerDataForMessage:v6 downloadIfNecessary:v4];
    if (v8)
    {
      v9 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "headersClass")), "initWithHeaderData:encoding:", v8, objc_msgSend(v6, "preferredEncoding"));
      if (v9)
      {
        v7 = [(MFMessageStore *)self _cachedHeadersForMessage:v6 valueIfNotPresent:v9];
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

- (id)_cachedBodyDataContainerForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  BOOL v4 = [(MFMessageStoreObjectCache *)self->_objectCache addObject:a4 forMessage:a3 kind:3];
  return v4;
}

- (id)_cachedHeaderDataForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  BOOL v4 = [(MFMessageStoreObjectCache *)self->_objectCache addObject:a4 forMessage:a3 kind:2];
  return v4;
}

- (id)_cachedHeadersForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  BOOL v4 = [(MFMessageStoreObjectCache *)self->_objectCache addObject:a4 forMessage:a3 kind:0];
  return v4;
}

+ (void)setDefaultMessageHeadersClass:(Class)a3
{
  sMFMessageStoreHeadersClass = (uint64_t)a3;
}

- (id)bestAlternativeForPart:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MFMessageStore *)self decryptedTopLevelPartForPart:v4];

  id v6 = [v5 type];
  if ([v6 isEqualToString:@"multipart"])
  {
    v7 = [v5 subtype];
    int v8 = [v7 isEqualToString:@"alternative"];

    if (v8)
    {
      v9 = [v5 chosenAlternativePart];
      goto LABEL_6;
    }
  }
  else
  {
  }
  v9 = 0;
LABEL_6:
  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = v5;
  }
  id v11 = v10;

  return v11;
}

- (id)decryptedTopLevelPartForPart:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decryptedMessageBodyIsEncrypted:0 isSigned:0];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v4 topLevelPart];

      id v3 = (id)v5;
    }
  }

  return v3;
}

- (MFMessageStore)init
{
  v7.receiver = self;
  v7.super_class = (Class)MFMessageStore;
  v2 = [(MFMessageStore *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(MFMessageStore *)v2 newObjectCache];
    objectCache = v3->_objectCache;
    v3->_objectCache = (MFMessageStoreObjectCache *)v4;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectCache, 0);
  objc_storeStrong((id *)&self->_uniqueStrings, 0);
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__MFMessageStore_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, block);
  }
  v2 = (void *)log_log;
  return v2;
}

void __21__MFMessageStore_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;
}

- (id)headerDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  return 0;
}

+ (Class)headersClass
{
  v2 = (void *)sMFMessageStoreHeadersClass;
  if (!sMFMessageStoreHeadersClass) {
    v2 = objc_opt_class();
  }
  return (Class)v2;
}

- (id)_downloadHeadersForMessages:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v11 = -[MFMessageStore headersForMessage:fetchIfNotAvailable:](self, "headersForMessage:fetchIfNotAvailable:", v10, 1, (void)v13);
        if (v11) {
          [v5 setObject:v11 forKeyedSubscript:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v5;
}

+ (Class)classForMimePart
{
  return (Class)objc_opt_class();
}

- (BOOL)bodyFetchRequiresNetworkActivity
{
}

- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7
{
  BOOL v8 = a6;
  v9 = -[MFMessageStore bodyDataForMessage:isComplete:isPartial:downloadIfNecessary:](self, "bodyDataForMessage:isComplete:isPartial:downloadIfNecessary:", a3, a5, 0);
  uint64_t v10 = v9;
  if (a7 && v8 && [v9 length]) {
    *a7 = 1;
  }
  return v10;
}

- (id)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = [v11 type];
  char v13 = [v12 isEqualToString:@"multipart"];

  if (v13)
  {
    long long v14 = 0;
    goto LABEL_14;
  }
  long long v15 = [v11 mimeBody];
  long long v16 = [v15 message];

  if (v16)
  {
    v17 = [(MFMessageStore *)self fullBodyDataForMessage:v16 andHeaderDataIfReadilyAvailable:0 isComplete:a5 downloadIfNecessary:v8 didDownload:a7];
    unint64_t v18 = [v17 length];
    uint64_t v19 = [v11 range];
    if (v19 == 0x7FFFFFFFFFFFFFFFLL || v19 + v20 > v18)
    {
      v22 = objc_msgSend(v11, "mimeBody", v19);
      id v23 = [v22 topLevelPart];

      if (v23 != v11)
      {
        long long v14 = 0;
LABEL_12:

        goto LABEL_13;
      }
      id v21 = v17;
    }
    else
    {
      objc_msgSend(v17, "mf_subdataWithRange:", v19, v20);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    long long v14 = v21;
    goto LABEL_12;
  }
  long long v14 = 0;
LABEL_13:

LABEL_14:
  return v14;
}

- (BOOL)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 withConsumer:(id)a6 downloadIfNecessary:(BOOL)a7 didDownload:(BOOL *)a8
{
  BOOL v8 = a7;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v14 = a6;
  long long v15 = -[MFMessageStore dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:](self, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", a3, location, length, a5, v8, a8);
  [v14 appendData:v15];

  return v15 != 0;
}

- (BOOL)downloadMimePartNumber:(id)a3 message:(id)a4 withProgressBlock:(id)a5
{
  return 0;
}

- (BOOL)dataForMimePart:(id)a3 inRange:(_NSRange)a4 withConsumer:(id)a5 downloadIfNecessary:(BOOL)a6
{
  return -[MFMessageStore dataForMimePart:inRange:isComplete:withConsumer:downloadIfNecessary:didDownload:](self, "dataForMimePart:inRange:isComplete:withConsumer:downloadIfNecessary:didDownload:", a3, a4.location, a4.length, 0, a5, a6, 0);
}

- (id)defaultAlternativeForPart:(id)a3
{
  id v3 = [(MFMessageStore *)self bestAlternativeForPart:a3];
  return v3;
}

- (id)newObjectCache
{
  v2 = [[MFMessageStoreObjectCache alloc] initWithCapacity:5];
  [(MFMessageStoreObjectCache *)v2 setKeyGenerator:&__block_literal_global_1];
  return v2;
}

unint64_t __32__MFMessageStore_newObjectCache__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a2 & 0xFFFFFFFFFFFFFFFCLL | a3;
}

- (id)_cachedBodyDataForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    BOOL v8 = [[MFMessageDataContainer alloc] initWithData:v7];
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = [(MFMessageStore *)self _cachedBodyDataContainerForMessage:v6 valueIfNotPresent:v8];
  uint64_t v10 = (void *)v9;
  if (v9) {
    id v11 = *(void **)(v9 + 8);
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (id)_cachedBodyForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  id v6 = a3;
  id v7 = [(MFMessageStoreObjectCache *)self->_objectCache addObject:a4 forMessage:v6 kind:1];
  [v7 setMessage:v6];

  return v7;
}

- (void)_flushAllCaches
{
}

- (id)_fetchBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 partial:(BOOL *)a6
{
  id v8 = a3;
  [(MFMessageStore *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MFMessageStore _fetchBodyDataForMessage:andHeaderDataIfReadilyAvailable:downloadIfNecessary:partial:]", "MessageStore.m", 284, "0");
}

- (id)bodyDataForMessage:(id)a3 isComplete:(BOOL *)a4 isPartial:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = [(MFMessageStore *)self _cachedBodyDataForMessage:v10 valueIfNotPresent:0];
  if (v11 && (a4 || (uint64_t v12 = [v10 messageSize], v12 == objc_msgSend(v11, "length"))))
  {
    char v13 = +[MFMessageStore log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v10 messageID];
      *(_DWORD *)buf = 138543362;
      v27 = v14;
      _os_log_impl(&dword_1AFB03000, v13, OS_LOG_TYPE_DEFAULT, "Found cached body data for message %{public}@", buf, 0xCu);
    }
    long long v15 = v11;
  }
  else
  {
    id v25 = 0;
    long long v16 = [(MFMessageStore *)self _fetchBodyDataForMessage:v10 andHeaderDataIfReadilyAvailable:&v25 downloadIfNecessary:v6 partial:0];
    char v13 = v25;

    if (v16)
    {
      long long v15 = [(MFMessageStore *)self _cachedBodyDataForMessage:v10 valueIfNotPresent:v16];

      if (v13) {
        id v17 = [(MFMessageStore *)self _cachedHeaderDataForMessage:v10 valueIfNotPresent:v13];
      }
    }
    else
    {
      unint64_t v18 = +[MFMessageStore log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = [v10 messageID];
        -[MFMessageStore bodyDataForMessage:isComplete:isPartial:downloadIfNecessary:](v19, v32, v18);
      }

      long long v15 = 0;
    }
  }

  if (a4 && v15) {
    *a4 = 1;
  }
  if (a5) {
    *a5 = 0;
  }
  uint64_t v20 = +[MFMessageStore log];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [v10 messageID];
    BOOL v22 = *a4;
    BOOL v23 = *a5;
    *(_DWORD *)buf = 138543874;
    v27 = v21;
    __int16 v28 = 1024;
    BOOL v29 = v22;
    __int16 v30 = 1024;
    BOOL v31 = v23;
    _os_log_impl(&dword_1AFB03000, v20, OS_LOG_TYPE_DEFAULT, "Body data for message %{public}@, isComplete: %{BOOL}d, isPartial: %{BOOL}d", buf, 0x18u);
  }
  return v15;
}

- (BOOL)hasCompleteDataForMimePart:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 mimeBody];
  BOOL v6 = [v5 message];

  id v7 = [(MFMessageStore *)self _cachedBodyDataForMessage:v6 valueIfNotPresent:0];
  unint64_t v8 = [v7 length];
  uint64_t v9 = [v4 range];
  LOBYTE(v8) = v8 >= v9 + v10;

  return v8;
}

- (BOOL)messageCanBeTriaged:(id)a3
{
  return 1;
}

- (void)setNumberOfAttachments:(unsigned int)a3 isSigned:(BOOL)a4 isEncrypted:(BOOL)a5 forMessage:(id)a6
{
}

- (BOOL)wantsLineEndingConversionForMIMEPart:(id)a3
{
  return 1;
}

- (void)flushCacheForMessage:(id)a3
{
}

- (MFMessageStoreObjectCache)objectCache
{
  return self->_objectCache;
}

- (void)bodyDataForMessage:(os_log_t)log isComplete:isPartial:downloadIfNecessary:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1AFB03000, log, OS_LOG_TYPE_ERROR, "Failed to fetch body data for message %{public}@", buf, 0xCu);
}

@end