@interface MFDSearch
+ (id)endpointInfo;
- (BOOL)_hasSearchableMailAccount;
- (BOOL)shouldCancel;
- (EFPromise)searchPromise;
- (MFDSearch)init;
- (MFDSearch)initWithClient:(id)a3;
- (MFDSearch)initWithRemoteObjectInterface:(id)a3;
- (MFMessageCriterion)criteria;
- (NSArray)keys;
- (NSProgress)searchProgress;
- (_MFDSearchResultsQueue)resultsQueue;
- (id)_searchResultsProxy;
- (id)newConnectionForInterface:(id)a3;
- (unint64_t)options;
- (unsigned)_libraryOptions;
- (void)_autoFetchDone:(id)a3;
- (void)_backgroundSearch;
- (void)_performLibrarySearch;
- (void)_registerForAutoFetchFinishedNotification;
- (void)dealloc;
- (void)findMessageData:(id)a3 matchingCriterion:(id)a4 options:(unint64_t)a5;
- (void)setCriteria:(id)a3;
- (void)setKeys:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setResultsQueue:(id)a3;
- (void)setSearchProgress:(id)a3;
- (void)setSearchPromise:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MFDSearch

+ (id)endpointInfo
{
  v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSDSearchProtocol];
  v4 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSDSearchResultsProtocol];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000694BC;
  v7[3] = &unk_10013C138;
  v7[4] = a1;
  v5 = +[MFXPCEndpointInfo endpointInfoWithExportedInterface:v3 remoteObjectInterface:v4 shouldAcceptClient:0 exportedObjectForClient:v7];

  return v5;
}

- (MFDSearch)initWithClient:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MFDSearch;
  v6 = [(MFDSearch *)&v19 initWithRemoteObjectInterface:0];
  if (v6)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_1000696EC;
    v16 = &unk_10013A038;
    objc_copyWeak(&v17, &location);
    v7 = objc_retainBlock(&v13);
    objc_msgSend(v5, "setInterruptionHandler:", v7, v13, v14, v15, v16);
    [v5 setInvalidationHandler:v7];
    objc_storeStrong((id *)&v6->_client, a3);
    uint64_t v8 = +[MFMailMessageLibrary defaultInstance];
    library = v6->_library;
    v6->_library = (MFMailMessageLibrary *)v8;

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v6 selector:"_libraryWillBecomeUnavailable:" name:MailMessageLibraryWillBecomeUnavailable object:v6->_library];

    v11 = v6;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (MFDSearch)init
{
}

- (MFDSearch)initWithRemoteObjectInterface:(id)a3
{
  id v5 = a3;
  [(MFDSearch *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MFDSearch initWithRemoteObjectInterface:]", "MFDSearch.m", 196, "0");
}

- (void)dealloc
{
  [(MFDSearch *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)MFDSearch;
  [(MFDSearch *)&v3 dealloc];
}

- (id)newConnectionForInterface:(id)a3
{
  return 0;
}

- (id)_searchResultsProxy
{
  v2 = [(MFXPCClient *)self->_client connection];
  objc_super v3 = [v2 remoteObjectProxy];

  return v3;
}

- (void)findMessageData:(id)a3 matchingCriterion:(id)a4 options:(unint64_t)a5
{
  id v14 = a3;
  id v8 = a4;
  if (self->_keys)
  {
    uint64_t v9 = 1500;
    goto LABEL_10;
  }
  if (![(MFDSearch *)self _hasSearchableMailAccount])
  {
    uint64_t v9 = 1501;
    goto LABEL_10;
  }
  if (!v8)
  {
    uint64_t v9 = 1502;
LABEL_10:
    v11 = +[NSError errorWithDomain:MSMailSearchErrorDomain code:v9 userInfo:0];
    if (!v11) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v10 = sub_100069AE0(v8, (a5 >> 2) & 1);
  if (v10)
  {
    [(MFDSearch *)self setOptions:a5];
    [(MFDSearch *)self setCriteria:v10];
    [(MFDSearch *)self setKeys:v14];
    if (a5)
    {
      [(MFDSearch *)self _registerForAutoFetchFinishedNotification];
      v13 = +[AutoFetchController sharedController];
      [v13 fetchNow:EMFetchTypeForcedAll];
    }
    else
    {
      [(MFDSearch *)self start];
    }
    v11 = 0;
  }
  else
  {
    v11 = +[NSError errorWithDomain:MSMailSearchErrorDomain code:1503 userInfo:0];
  }

  if (v11)
  {
LABEL_11:
    v12 = [(MFDSearch *)self _searchResultsProxy];
    [v12 foundResults:0 error:v11];
  }
LABEL_12:
}

- (BOOL)_hasSearchableMailAccount
{
  +[MailAccount mailAccounts];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    uint64_t v5 = kAccountDataclassMail;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          && (objc_msgSend(v7, "isEnabledForDataclass:", v5, (void)v9) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (void)_registerForAutoFetchFinishedNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_autoFetchDone:" name:@"AutoFetchDoneNotification" object:0];
}

- (void)_autoFetchDone:(id)a3
{
  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"AutoFetchDoneNotification" object:0];

  [(MFDSearch *)self start];
}

- (void)start
{
  if (!self->_criteria)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MFDSearch.m" lineNumber:297 description:@"attempt to start a search without setting criteria"];
  }
  id v7 = +[MFMonitoredInvocation invocationWithSelector:"_backgroundSearch" target:self taskName:@"MailServices Search" priority:11 canBeCancelled:1];
  [v7 retainArguments];
  id v3 = [v7 monitor];
  monitor = self->_monitor;
  self->_monitor = v3;

  uint64_t v5 = +[MFInvocationQueue sharedInvocationQueue];
  [v5 addInvocation:v7];
}

- (void)stop
{
  [(MFActivityMonitor *)self->_monitor cancel];
  id v3 = [(MFDSearch *)self searchProgress];
  [v3 cancel];
}

- (BOOL)shouldCancel
{
  if ([(MFActivityMonitor *)self->_monitor shouldCancel]) {
    return 1;
  }
  uint64_t v4 = [(MFDSearch *)self searchProgress];
  unsigned __int8 v3 = [v4 isCancelled];

  return v3;
}

- (void)_performLibrarySearch
{
  unsigned __int8 v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    criteria = self->_criteria;
    int v9 = 138412546;
    long long v10 = self;
    __int16 v11 = 2112;
    long long v12 = criteria;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#MailServices %@ searching library for criteria: %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v5 = [(MFDSearch *)self _libraryOptions];
  library = self->_library;
  id v7 = self->_criteria;
  id v8 = [(MFDSearch *)self resultsQueue];
  [(MFMailMessageLibrary *)library iterateMessagesMatchingCriterion:v7 withResultHandler:v8 options:v5 withMonitor:self];
}

- (void)_backgroundSearch
{
  unsigned __int8 v3 = [(MFDSearch *)self _searchResultsProxy];
  uint64_t v4 = [[_MFDSearchResultsQueue alloc] initWithKeys:self->_keys resultsProxy:v3];
  [(MFDSearch *)self setResultsQueue:v4];

  if (![(MFDSearch *)self shouldCancel]) {
    [(MFDSearch *)self _performLibrarySearch];
  }
  if ([(MFDSearch *)self shouldCancel])
  {
    uint64_t v5 = +[NSError errorWithDomain:MSMailSearchErrorDomain code:1504 userInfo:0];
  }
  else
  {
    v6 = [(MFDSearch *)self resultsQueue];
    [v6 flush];

    uint64_t v5 = 0;
  }
  id v7 = MFLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    CFStringRef v8 = @" with error: ";
    CFStringRef v9 = &stru_10013ED08;
    int v11 = 138412802;
    long long v12 = self;
    if (!v5) {
      CFStringRef v8 = &stru_10013ED08;
    }
    __int16 v13 = 2112;
    if (v5) {
      CFStringRef v9 = v5;
    }
    CFStringRef v14 = v8;
    __int16 v15 = 2112;
    CFStringRef v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#MailServices %@ finished search%@%@", (uint8_t *)&v11, 0x20u);
  }

  long long v10 = [(MFDSearch *)self resultsQueue];
  [v10 finishWithError:v5];

  [(MFDSearch *)self setResultsQueue:0];
  [(MFDSearch *)self setSearchPromise:0];
  [(MFDSearch *)self setSearchProgress:0];
}

- (unsigned)_libraryOptions
{
  v17[0] = @"MSResultsKeyRecievingAddresses";
  v17[1] = @"MSResultsKeyRecipientTo";
  v18[0] = &off_100146230;
  v18[1] = &off_100146230;
  v17[2] = @"MSResultsKeyRecipientCc";
  v17[3] = @"MSResultsKeyRecipientBcc";
  v18[2] = &off_100146230;
  v18[3] = &off_100146230;
  v17[4] = @"MSResultsKeySender";
  v17[5] = @"MSResultsKeySubject";
  v18[4] = &off_100146248;
  v18[5] = &off_100146260;
  v17[6] = @"MSResultsKeyBodySummary";
  v18[6] = &off_100146278;
  unsigned __int8 v3 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:7];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = self->_keys;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    unsigned int v7 = 6272;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        CFStringRef v9 = objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        unsigned int v10 = [v9 unsignedIntValue];

        v7 |= v10;
      }
      id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    unsigned int v7 = 6272;
  }

  return v7;
}

- (MFMessageCriterion)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (_MFDSearchResultsQueue)resultsQueue
{
  return self->_resultsQueue;
}

- (void)setResultsQueue:(id)a3
{
}

- (EFPromise)searchPromise
{
  return self->_searchPromise;
}

- (void)setSearchPromise:(id)a3
{
}

- (NSProgress)searchProgress
{
  return self->_searchProgress;
}

- (void)setSearchProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchProgress, 0);
  objc_storeStrong((id *)&self->_searchPromise, 0);
  objc_storeStrong((id *)&self->_resultsQueue, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

@end