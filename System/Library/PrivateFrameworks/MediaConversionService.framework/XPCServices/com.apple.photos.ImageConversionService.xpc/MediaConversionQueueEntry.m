@interface MediaConversionQueueEntry
- (BOOL)allRequestsAreBackground;
- (BOOL)allRequestsAreOptional;
- (BOOL)allRequestsHaveRequestPriority:(int64_t)a3;
- (BOOL)cancelled;
- (BOOL)clientRequestIsDuplicate:(id)a3 identicalDestination:(BOOL *)a4;
- (BOOL)taskTypeSupportsDeduplication;
- (MediaConversionQueueEntry)initWithIdentifier:(id)a3 initialConversionOptions:(id)a4;
- (NSArray)clientRequestsSnapshot;
- (NSDictionary)initialRequestConversionOptions;
- (NSString)identifier;
- (NSString)initialRequestIdentifier;
- (NSURL)temporaryFilesParentDirectoryURL;
- (OS_os_transaction)transaction;
- (PAMediaConversionServiceResourceURLCollection)sourceURLCollection;
- (PAMediaConversionServiceResourceURLCollection)temporaryDestinationURLCollection;
- (VideoConversionTask)videoConversionTask;
- (id)anyDestinationURLCollection;
- (id)clientRequestForIdentifier:(id)a3;
- (id)description;
- (id)removeAndReturnClientRequestWithIdentifier:(id)a3 remainingRequestCount:(int64_t *)a4;
- (id)requestIdentifiersForConnectionIdentifier:(id)a3;
- (int64_t)compareProcessingOrderToEntry:(id)a3;
- (void)addClientRequest:(id)a3;
- (void)dealloc;
- (void)didDequeueAndStartProcessingQueueEntry;
- (void)setCancelled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInitialRequestConversionOptions:(id)a3;
- (void)setInitialRequestIdentifier:(id)a3;
- (void)setSourceURLCollection:(id)a3;
- (void)setTaskTypeSupportsDeduplication:(BOOL)a3;
- (void)setTemporaryDestinationURLCollection:(id)a3;
- (void)setTemporaryFilesParentDirectoryURL:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setVideoConversionTask:(id)a3;
- (void)videoConversionTask:(id)a3 didUpdateFractionCompleted:(double)a4;
- (void)withLockEnumerateClientRequests:(id)a3;
@end

@implementation MediaConversionQueueEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_temporaryDestinationURLCollection, 0);
  objc_storeStrong((id *)&self->_sourceURLCollection, 0);
  objc_storeStrong((id *)&self->_videoConversionTask, 0);
  objc_storeStrong((id *)&self->_temporaryFilesParentDirectoryURL, 0);
  objc_storeStrong((id *)&self->_initialRequestConversionOptions, 0);
  objc_storeStrong((id *)&self->_initialRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_clientRequests, 0);
}

- (void)setTransaction:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTaskTypeSupportsDeduplication:(BOOL)a3
{
  self->_taskTypeSupportsDeduplication = a3;
}

- (BOOL)taskTypeSupportsDeduplication
{
  return self->_taskTypeSupportsDeduplication;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setTemporaryDestinationURLCollection:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollection)temporaryDestinationURLCollection
{
  return (PAMediaConversionServiceResourceURLCollection *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSourceURLCollection:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollection)sourceURLCollection
{
  return (PAMediaConversionServiceResourceURLCollection *)objc_getProperty(self, a2, 64, 1);
}

- (void)setVideoConversionTask:(id)a3
{
}

- (VideoConversionTask)videoConversionTask
{
  return (VideoConversionTask *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTemporaryFilesParentDirectoryURL:(id)a3
{
}

- (NSURL)temporaryFilesParentDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInitialRequestConversionOptions:(id)a3
{
}

- (NSDictionary)initialRequestConversionOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setInitialRequestIdentifier:(id)a3
{
}

- (NSString)initialRequestIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)allRequestsAreBackground
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D190;
  v4[3] = &unk_100034FF0;
  v4[4] = &v5;
  [(MediaConversionQueueEntry *)self withLockEnumerateClientRequests:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)allRequestsAreOptional
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D2C0;
  v4[3] = &unk_100034FF0;
  v4[4] = &v5;
  [(MediaConversionQueueEntry *)self withLockEnumerateClientRequests:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)allRequestsHaveRequestPriority:(int64_t)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000D3E8;
  v5[3] = &unk_100035080;
  v5[4] = &v6;
  v5[5] = a3;
  [(MediaConversionQueueEntry *)self withLockEnumerateClientRequests:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)compareProcessingOrderToEntry:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 298, @"Invalid parameter not satisfying: %@", @"otherEntry" object file lineNumber description];
  }
  uint64_t v6 = [(MediaConversionQueueEntry *)self clientRequestsSnapshot];
  uint64_t v7 = [v6 sortedArrayUsingComparator:&stru_100035058];

  uint64_t v8 = [v5 clientRequestsSnapshot];
  char v9 = [v8 sortedArrayUsingComparator:&stru_100035058];

  v10 = [v7 firstObject];
  uint64_t v11 = [v9 firstObject];
  v12 = (void *)v11;
  id v13 = 0;
  if (v10 && v11)
  {
    v14 = [v10 requestTracker];
    v15 = [v12 requestTracker];
    id v13 = [v14 compare:v15];
  }
  return (int64_t)v13;
}

- (NSArray)clientRequestsSnapshot
{
  p_queueEntryStateLock = &self->_queueEntryStateLock;
  os_unfair_lock_lock(&self->_queueEntryStateLock);
  id v4 = [(NSMutableArray *)self->_clientRequests copy];
  os_unfair_lock_unlock(p_queueEntryStateLock);
  return (NSArray *)v4;
}

- (void)videoConversionTask:(id)a3 didUpdateFractionCompleted:(double)a4
{
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(MediaConversionQueueEntry *)self clientRequestsSnapshot];
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) videoConversionTask:v6 didUpdateFractionCompleted:a4];
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)requestIdentifiersForConnectionIdentifier:(id)a3
{
  id v4 = a3;
  +[NSMutableArray array];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000D884;
  v10[3] = &unk_100035018;
  id v11 = v4;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v5;
  id v6 = v4;
  [(MediaConversionQueueEntry *)self withLockEnumerateClientRequests:v10];
  uint64_t v7 = v12;
  id v8 = v5;

  return v8;
}

- (id)anyDestinationURLCollection
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_10000DA24;
  id v9 = sub_10000DA34;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000DA3C;
  v4[3] = &unk_100034FF0;
  v4[4] = &v5;
  [(MediaConversionQueueEntry *)self withLockEnumerateClientRequests:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)clientRequestForIdentifier:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = sub_10000DA24;
  long long v14 = sub_10000DA34;
  id v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DBD8;
  v7[3] = &unk_100034FC8;
  id v4 = a3;
  id v8 = v4;
  id v9 = &v10;
  [(MediaConversionQueueEntry *)self withLockEnumerateClientRequests:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)removeAndReturnClientRequestWithIdentifier:(id)a3 remainingRequestCount:(int64_t *)a4
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_queueEntryStateLock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = self->_clientRequests;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [v11 identifier];
        unsigned __int8 v13 = [v12 isEqualToString:v5];

        if (v13)
        {
          id v14 = v11;

          if (v14)
          {
            [(NSMutableArray *)self->_clientRequests removeObject:v14];
            *a4 = (int64_t)[(NSMutableArray *)self->_clientRequests count];
          }
          goto LABEL_12;
        }
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v14 = 0;
LABEL_12:
  os_unfair_lock_unlock(&self->_queueEntryStateLock);

  return v14;
}

- (BOOL)clientRequestIsDuplicate:(id)a3 identicalDestination:(BOOL *)a4
{
  id v6 = a3;
  p_queueEntryStateLock = &self->_queueEntryStateLock;
  os_unfair_lock_lock(&self->_queueEntryStateLock);
  id v8 = [(NSMutableArray *)self->_clientRequests firstObject];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 requestTracker];
    id v11 = [v6 requestTracker];
    unsigned __int8 v12 = [v10 isDuplicateOfRequestWithRequestTracker:v11 identicalDestinationURL:a4];
  }
  else
  {
    unsigned __int8 v12 = 0;
  }
  os_unfair_lock_unlock(p_queueEntryStateLock);

  return v12;
}

- (void)didDequeueAndStartProcessingQueueEntry
{
}

- (void)withLockEnumerateClientRequests:(id)a3
{
  id v4 = a3;
  p_queueEntryStateLock = &self->_queueEntryStateLock;
  os_unfair_lock_lock(&self->_queueEntryStateLock);
  clientRequests = self->_clientRequests;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000DFB8;
  v8[3] = &unk_100034F60;
  id v9 = v4;
  id v7 = v4;
  [(NSMutableArray *)clientRequests enumerateObjectsUsingBlock:v8];
  os_unfair_lock_unlock(p_queueEntryStateLock);
}

- (void)addClientRequest:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PAMediaConversionServiceSharedUtilitiesServiceSide.m", 194, @"Invalid parameter not satisfying: %@", @"clientRequest" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_queueEntryStateLock);
  [(NSMutableArray *)self->_clientRequests addObject:v6];
  [v6 setRequestQueueEntry:self];
  os_unfair_lock_unlock(&self->_queueEntryStateLock);
}

- (id)description
{
  p_queueEntryStateLock = &self->_queueEntryStateLock;
  os_unfair_lock_lock(&self->_queueEntryStateLock);
  identifier = self->_identifier;
  id v5 = [(NSMutableArray *)self->_clientRequests valueForKey:@"description"];
  id v6 = [v5 componentsJoinedByString:@" "];
  id v7 = +[NSString stringWithFormat:@"<MediaConversionQueueEntry %@ (%p) for requests [%@]>", identifier, self, v6];

  os_unfair_lock_unlock(p_queueEntryStateLock);
  return v7;
}

- (void)dealloc
{
  if (self->_temporaryFilesParentDirectoryURL)
  {
    char v3 = +[NSFileManager defaultManager];
    temporaryFilesParentDirectoryURL = self->_temporaryFilesParentDirectoryURL;
    id v9 = 0;
    unsigned __int8 v5 = [v3 removeItemAtURL:temporaryFilesParentDirectoryURL error:&v9];
    id v6 = v9;
    if ((v5 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v7 = self->_temporaryFilesParentDirectoryURL;
      *(_DWORD *)buf = 138543618;
      id v11 = v7;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to delete temporary files directory %{public}@: %{public}@", buf, 0x16u);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)MediaConversionQueueEntry;
  [(MediaConversionQueueEntry *)&v8 dealloc];
}

- (MediaConversionQueueEntry)initWithIdentifier:(id)a3 initialConversionOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MediaConversionQueueEntry;
  id v9 = [(MediaConversionQueueEntry *)&v16 init];
  if (v9)
  {
    uint64_t v10 = +[NSMutableArray array];
    clientRequests = v9->_clientRequests;
    v9->_clientRequests = (NSMutableArray *)v10;

    v9->_queueEntryStateLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v9->_initialRequestConversionOptions, a4);
    id v12 = +[NSString stringWithFormat:@"com.apple.photos.media-conversion.queue-entry-%@", v7];
    [v12 UTF8String];
    uint64_t v13 = os_transaction_create();
    transaction = v9->_transaction;
    v9->_transaction = (OS_os_transaction *)v13;
  }
  return v9;
}

@end