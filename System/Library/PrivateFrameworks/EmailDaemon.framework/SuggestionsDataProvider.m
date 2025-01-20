@interface SuggestionsDataProvider
+ (BOOL)isHarvestingSupported;
- (BOOL)_protectedDataAvailable;
- (NSArray)unconfirmedLostMessages;
- (SuggestionsDataProvider)initWithLibrary:(id)a3;
- (double)lastUnconfirmedLostMessagesSearchTime;
- (id)_libraryMessagesForSGMailMessageKeys:(id)a3;
- (void)_processBackgroundDownload;
- (void)_registerXpcActivity;
- (void)_scheduleBackgroundDownload;
- (void)_unregisterXpcActivity;
- (void)dealloc;
- (void)refreshLostMessagesUntilDeferred:(id)a3;
- (void)resume;
- (void)setLastUnconfirmedLostMessagesSearchTime:(double)a3;
- (void)setUnconfirmedLostMessages:(id)a3;
- (void)suspend;
@end

@implementation SuggestionsDataProvider

- (BOOL)_protectedDataAvailable
{
  return [(MFMailMessageLibrary *)self->_library protectedDataAvailability] == 0;
}

+ (BOOL)isHarvestingSupported
{
  return +[SGSuggestionsService isHarvestingSupported];
}

- (void)dealloc
{
  [(SuggestionsDataProvider *)self _unregisterXpcActivity];
  notify_cancel(self->_fullDownloadToken);
  v3.receiver = self;
  v3.super_class = (Class)SuggestionsDataProvider;
  [(SuggestionsDataProvider *)&v3 dealloc];
}

- (SuggestionsDataProvider)initWithLibrary:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SuggestionsDataProvider;
  id v6 = [(SuggestionsDataProvider *)&v31 init];
  if (v6)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(1);
    v8 = (void *)*((void *)v6 + 6);
    *((void *)v6 + 6) = v7;

    v9 = (void *)*((void *)v6 + 7);
    *((void *)v6 + 7) = 0;

    v10 = +[NSString stringWithFormat:@"com.apple.mobilemail.%@.%p", objc_opt_class(), v6];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v12 = v10;
    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], v11);
    v14 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v13;

    id v15 = [v12 stringByAppendingString:@".suggestions"];
    v16 = (const char *)[v15 UTF8String];
    v17 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v18 = dispatch_queue_create(v16, v17);
    v19 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v18;

    objc_storeStrong((id *)v6 + 3, a3);
    uint64_t v20 = +[SGSuggestionsService serviceForMail];
    v21 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v20;

    id v22 = objc_alloc_init((Class)NSCache);
    v23 = (void *)*((void *)v6 + 5);
    *((void *)v6 + 5) = v22;

    [*((id *)v6 + 5) setCountLimit:100];
    *((unsigned char *)v6 + 64) = 0;
    if (([v6 _protectedDataAvailable] & 1) == 0)
    {
      *((unsigned char *)v6 + 64) = 1;
      dispatch_suspend(*((dispatch_object_t *)v6 + 2));
    }
    v24 = +[NSNotificationCenter defaultCenter];
    [v24 addObserver:v6 selector:"_libraryFinishedReconciliation:" name:MailMessageLibraryDidFinishReconciliation object:*((void *)v6 + 3)];
    [v24 addObserver:v6 selector:"_libraryWillBecomeUnavailable:" name:MailMessageLibraryWillBecomeUnavailable object:*((void *)v6 + 3)];
    [v6 _registerXpcActivity];
    v25 = *((void *)v6 + 1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000BCD28;
    handler[3] = &unk_10013E2B0;
    id v26 = v6;
    id v30 = v26;
    notify_register_dispatch("com.apple.suggestions.fulldownloadrequested", (int *)v6 + 17, v25, handler);
    id v27 = v26;
  }
  return (SuggestionsDataProvider *)v6;
}

- (id)_libraryMessagesForSGMailMessageKeys:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  id v6 = +[NSMutableSet set];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000BCFA4;
  v18[3] = &unk_10013E2D8;
  id v7 = v5;
  id v19 = v7;
  id v8 = v6;
  id v20 = v8;
  v9 = objc_msgSend(v4, "ef_compactMap:", v18);
  v10 = +[MFMessageCriterion orCompoundCriterionWithCriteria:v9];
  v11 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  if (v10)
  {
    library = self->_library;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000BD1B4;
    v14[3] = &unk_10013E300;
    id v15 = v8;
    id v16 = v7;
    id v17 = v11;
    [(MFMailMessageLibrary *)library iterateMessagesMatchingCriterion:v10 options:6297663 handler:v14];
  }

  return v11;
}

- (void)_scheduleBackgroundDownload
{
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)self->_scheduledDownloadSemaphore, 0))
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    suggestionsQueue = self->_suggestionsQueue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000BD39C;
    v4[3] = &unk_10013A038;
    objc_copyWeak(&v5, &location);
    dispatch_async(suggestionsQueue, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_processBackgroundDownload
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_scheduledDownloadSemaphore);
  v23 = +[EFPromise promise];
  harvesterService = self->_harvesterService;
  id v4 = [v23 completionHandlerAdapter];
  [(SGSuggestionsServiceMailProtocol *)harvesterService fullDownloadRequestBatch:5 withCompletion:v4];

  id v5 = [v23 future];
  id v6 = [v5 resultWithTimeout:0 error:5.0];

  v25 = v6;
  v24 = [(SuggestionsDataProvider *)self _libraryMessagesForSGMailMessageKeys:v6];
  id v7 = [v24 count];
  if (v7 < [v6 count])
  {
    id v8 = self->_harvesterService;
    v9 = [v24 allKeys];
    v10 = [v6 arrayByExcludingObjectsInArray:v9];
    [(SGSuggestionsServiceMailProtocol *)v8 resolveFullDownloadRequests:v10 withCompletion:&stru_10013E320];
  }
  if ([v24 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = v24;
    id v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v12)
    {
      uint64_t v26 = *(void *)v28;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v28 != v26) {
            objc_enumerationMutation(v11);
          }
          uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v15 = dispatch_semaphore_create(0);
          id v16 = [v11 objectForKeyedSubscript:v14];
          id v17 = [[_SuggestionsMessageBodyLoaderClient alloc] initWithLibrary:self->_library message:v16 semaphore:v15];
          dispatch_queue_t v18 = [v16 account];
          id v19 = +[MessageBodyLoader loaderForAccount:v18];
          [v19 addSingleMessageClient:v17];

          dispatch_time_t v20 = dispatch_time(0, 10000000000);
          dispatch_semaphore_wait(v15, v20);
          v21 = self->_harvesterService;
          uint64_t v31 = v14;
          id v22 = +[NSArray arrayWithObjects:&v31 count:1];
          [(SGSuggestionsServiceMailProtocol *)v21 resolveFullDownloadRequests:v22 withCompletion:&stru_10013E320];
        }
        id v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v12);
    }
  }
  if ([v25 count]) {
    [(SuggestionsDataProvider *)self _scheduleBackgroundDownload];
  }
}

- (void)_registerXpcActivity
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000BD954;
  v3[3] = &unk_100139F90;
  objc_copyWeak(&v4, &location);
  v2 = objc_retainBlock(v3);
  ef_xpc_activity_register();

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_unregisterXpcActivity
{
}

- (void)suspend
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BDAB4;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)resume
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BDB68;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)refreshLostMessagesUntilDeferred:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BDC44;
  v7[3] = &unk_10013AED8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (NSArray)unconfirmedLostMessages
{
  return self->_unconfirmedLostMessages;
}

- (void)setUnconfirmedLostMessages:(id)a3
{
}

- (double)lastUnconfirmedLostMessagesSearchTime
{
  return self->_lastUnconfirmedLostMessagesSearchTime;
}

- (void)setLastUnconfirmedLostMessagesSearchTime:(double)a3
{
  self->_lastUnconfirmedLostMessagesSearchTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unconfirmedLostMessages, 0);
  objc_storeStrong((id *)&self->_scheduledDownloadClients, 0);
  objc_storeStrong((id *)&self->_scheduledDownloadSemaphore, 0);
  objc_storeStrong((id *)&self->_mailboxCache, 0);
  objc_storeStrong((id *)&self->_harvesterService, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_suggestionsQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end