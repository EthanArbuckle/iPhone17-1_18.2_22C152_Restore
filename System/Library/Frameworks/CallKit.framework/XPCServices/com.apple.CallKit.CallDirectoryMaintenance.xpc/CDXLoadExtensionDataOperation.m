@interface CDXLoadExtensionDataOperation
- (BOOL)allowLoadingDisabledExtensions;
- (BOOL)extensionDataRequest:(id)a3 addedBlockingEntryData:(id)a4 error:(id *)a5;
- (BOOL)extensionDataRequest:(id)a3 addedIdentificationEntryData:(id)a4 error:(id *)a5;
- (BOOL)extensionDataRequest:(id)a3 isIncrementalLoadingAllowedWithError:(id *)a4;
- (BOOL)extensionDataRequest:(id)a3 removedAllBlockingEntriesWithError:(id *)a4;
- (BOOL)extensionDataRequest:(id)a3 removedAllIdentificationEntriesWithError:(id *)a4;
- (BOOL)extensionDataRequest:(id)a3 removedBlockingEntryData:(id)a4 error:(id *)a5;
- (BOOL)extensionDataRequest:(id)a3 removedIdentificationEntryData:(id)a4 error:(id *)a5;
- (BOOL)hasPerfomedInitialDeletion;
- (BOOL)performInitialDeletionIfNecessaryWithError:(id *)a3;
- (BOOL)requiresInitialDeletion;
- (CDXAWDReporter)awdReporter;
- (CDXExtensionDataRequest)dataRequest;
- (CDXLoadExtensionDataOperation)init;
- (CDXLoadExtensionDataOperation)initWithExtensionIdentifier:(id)a3 dataRequest:(id)a4 queue:(id)a5 store:(id)a6 lastUpdateDelegate:(id)a7;
- (CDXLoadExtensionDataOperation)initWithExtensionIdentifier:(id)a3 dataRequest:(id)a4 queue:(id)a5 store:(id)a6 maximumAllowedEntries:(unint64_t)a7 identificationEntriesChangedNotifier:(id)a8 lastUpdateDelegate:(id)a9;
- (CDXNotifydNotifier)identificationEntriesChangedNotifier;
- (CXCallDirectoryStore)store;
- (CXCallDirectoryUpdateDelegate)updateDelegate;
- (NSString)extensionIdentifier;
- (OS_dispatch_queue)queue;
- (int64_t)extensionID;
- (int64_t)incrementalLoadingState;
- (int64_t)lastBlockingPhoneNumber;
- (int64_t)lastIdentificationPhoneNumber;
- (unint64_t)blockingEntriesAdded;
- (unint64_t)entriesAdded;
- (unint64_t)identificationEntriesAdded;
- (unint64_t)maximumAllowedEntries;
- (void)performWithCompletionHandler:(id)a3;
- (void)setAllowLoadingDisabledExtensions:(BOOL)a3;
- (void)setAwdReporter:(id)a3;
- (void)setBlockingEntriesAdded:(unint64_t)a3;
- (void)setDataRequest:(id)a3;
- (void)setExtensionID:(int64_t)a3;
- (void)setExtensionIdentifier:(id)a3;
- (void)setHasPerfomedInitialDeletion:(BOOL)a3;
- (void)setIdentificationEntriesAdded:(unint64_t)a3;
- (void)setIdentificationEntriesChangedNotifier:(id)a3;
- (void)setIncrementalLoadingState:(int64_t)a3;
- (void)setLastBlockingPhoneNumber:(int64_t)a3;
- (void)setLastIdentificationPhoneNumber:(int64_t)a3;
- (void)setMaximumAllowedEntries:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setStore:(id)a3;
- (void)setUpdateDelegate:(id)a3;
@end

@implementation CDXLoadExtensionDataOperation

- (CDXLoadExtensionDataOperation)initWithExtensionIdentifier:(id)a3 dataRequest:(id)a4 queue:(id)a5 store:(id)a6 maximumAllowedEntries:(unint64_t)a7 identificationEntriesChangedNotifier:(id)a8 lastUpdateDelegate:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  v33.receiver = self;
  v33.super_class = (Class)CDXLoadExtensionDataOperation;
  v21 = [(CDXLoadExtensionDataOperation *)&v33 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_queue, a5);
    queue = v22->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F5E8;
    block[3] = &unk_100035050;
    v26 = v22;
    id v27 = v15;
    id v28 = v20;
    id v29 = v16;
    id v30 = v18;
    unint64_t v32 = a7;
    id v31 = v19;
    dispatch_async(queue, block);
  }
  return v22;
}

- (CDXLoadExtensionDataOperation)initWithExtensionIdentifier:(id)a3 dataRequest:(id)a4 queue:(id)a5 store:(id)a6 lastUpdateDelegate:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [CDXNotifydNotifier alloc];
  id v18 = [(CDXNotifydNotifier *)v17 initWithNotificationName:CXCallDirectoryManagerIdentificationEntriesChangedNotification];
  id v19 = [(CDXLoadExtensionDataOperation *)self initWithExtensionIdentifier:v16 dataRequest:v15 queue:v14 store:v13 maximumAllowedEntries:2000000 identificationEntriesChangedNotifier:v18 lastUpdateDelegate:v12];

  return v19;
}

- (CDXLoadExtensionDataOperation)init
{
  return 0;
}

- (unint64_t)entriesAdded
{
  unint64_t v3 = [(CDXLoadExtensionDataOperation *)self blockingEntriesAdded];
  return [(CDXLoadExtensionDataOperation *)self identificationEntriesAdded] + v3;
}

- (BOOL)requiresInitialDeletion
{
  return (unint64_t)[(CDXLoadExtensionDataOperation *)self incrementalLoadingState] < 2;
}

- (BOOL)performInitialDeletionIfNecessaryWithError:(id *)a3
{
  if (![(CDXLoadExtensionDataOperation *)self requiresInitialDeletion]
    || [(CDXLoadExtensionDataOperation *)self hasPerfomedInitialDeletion])
  {
    return 1;
  }
  v6 = [(CDXLoadExtensionDataOperation *)self store];
  id v16 = 0;
  unsigned __int8 v7 = objc_msgSend(v6, "removeBlockingEntriesForExtensionWithID:error:", -[CDXLoadExtensionDataOperation extensionID](self, "extensionID"), &v16);
  id v8 = v16;
  if ((v7 & 1) == 0)
  {

LABEL_10:
    id v12 = sub_100006944();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000245C0();
    }
    BOOL v5 = 0;
    id v11 = v8;
    goto LABEL_13;
  }
  v9 = [(CDXLoadExtensionDataOperation *)self store];
  id v15 = v8;
  unsigned int v10 = objc_msgSend(v9, "removeIdentificationEntriesForExtensionWithID:error:", -[CDXLoadExtensionDataOperation extensionID](self, "extensionID"), &v15);
  id v11 = v15;

  if (!v10)
  {
    id v8 = v11;
    goto LABEL_10;
  }
  BOOL v5 = 1;
  [(CDXLoadExtensionDataOperation *)self setHasPerfomedInitialDeletion:1];
  id v12 = sub_100006944();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [(CDXLoadExtensionDataOperation *)self extensionIdentifier];
    *(_DWORD *)buf = 138412290;
    id v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Performed initial deletion for extension with identifier %@", buf, 0xCu);
  }
LABEL_13:

  if (a3 && v11) {
    *a3 = v11;
  }

  return v5;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CDXLoadExtensionDataOperation *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000FAC0;
  v7[3] = &unk_100034BB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)extensionDataRequest:(id)a3 isIncrementalLoadingAllowedWithError:(id *)a4
{
  BOOL v5 = [(CDXLoadExtensionDataOperation *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100006944();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    int64_t v11 = [(CDXLoadExtensionDataOperation *)self incrementalLoadingState];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Extension data request queried incremental loading allowed. incrementalLoadingState: %ld", (uint8_t *)&v10, 0xCu);
  }

  int64_t v7 = [(CDXLoadExtensionDataOperation *)self incrementalLoadingState];
  if (v7 == 2) {
    return 1;
  }
  if (v7 == 1)
  {
    id v8 = sub_100006944();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Eligible for incremental loading, so changing incremental loading state to Confirmed", (uint8_t *)&v10, 2u);
    }

    [(CDXLoadExtensionDataOperation *)self setIncrementalLoadingState:2];
    return 1;
  }
  return 0;
}

- (BOOL)extensionDataRequest:(id)a3 addedBlockingEntryData:(id)a4 error:(id *)a5
{
  int64_t v7 = (char *)a4;
  id v8 = [(CDXLoadExtensionDataOperation *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = sub_100006944();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Extension data request added blocking entry data: %@", buf, 0xCu);
  }

  if ([(CDXLoadExtensionDataOperation *)self performInitialDeletionIfNecessaryWithError:a5])
  {
    int v10 = (char *)[v7 count];
    int64_t v11 = &v10[[(CDXLoadExtensionDataOperation *)self entriesAdded]];
    if (v11 >= (char *)[(CDXLoadExtensionDataOperation *)self maximumAllowedEntries])
    {
      id v15 = sub_100006944();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100024DD0(self);
      }

      id v12 = +[NSError cx_callDirectoryManagerErrorWithCode:5];
    }
    else
    {
      id v12 = 0;
      if (!v10)
      {
LABEL_31:
        BOOL v14 = v12 == 0;

        goto LABEL_32;
      }
      while (1)
      {
        id v13 = [v7 phoneNumberAtIndex:v12];
        if (v13 == (id)[(CDXLoadExtensionDataOperation *)self lastBlockingPhoneNumber]) {
          break;
        }
        if ((uint64_t)v13 < [(CDXLoadExtensionDataOperation *)self lastBlockingPhoneNumber])
        {
          id v16 = sub_100006944();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_100024D58();
          }
          uint64_t v17 = 3;
          goto LABEL_20;
        }
        [(CDXLoadExtensionDataOperation *)self setLastBlockingPhoneNumber:v13];
        if (v10 == ++v12) {
          goto LABEL_21;
        }
      }
      id v16 = sub_100006944();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100024CE0();
      }
      uint64_t v17 = 4;
LABEL_20:

      id v12 = +[NSError cx_callDirectoryManagerErrorWithCode:v17];
      if (v12) {
        goto LABEL_28;
      }
LABEL_21:
      id v18 = [(CDXLoadExtensionDataOperation *)self store];
      id v23 = 0;
      unsigned int v19 = objc_msgSend(v18, "addBlockingEntriesWithData:extensionID:error:", v7, -[CDXLoadExtensionDataOperation extensionID](self, "extensionID"), &v23);
      id v12 = (char *)v23;

      id v20 = sub_100006944();
      v21 = v20;
      if (v19)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v25 = v10;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Added %lu phone number blocking entries", buf, 0xCu);
        }

        [(CDXLoadExtensionDataOperation *)self setBlockingEntriesAdded:&v10[[(CDXLoadExtensionDataOperation *)self blockingEntriesAdded]]];
      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100024C68();
        }
      }
    }
LABEL_28:
    if (a5 && v12)
    {
      id v12 = v12;
      *a5 = v12;
    }
    goto LABEL_31;
  }
  BOOL v14 = 0;
LABEL_32:

  return v14;
}

- (BOOL)extensionDataRequest:(id)a3 removedBlockingEntryData:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = [(CDXLoadExtensionDataOperation *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = sub_100006944();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Extension data request removed blocking entry data: %@", buf, 0xCu);
  }

  if ((id)[(CDXLoadExtensionDataOperation *)self incrementalLoadingState] == (id)2)
  {
    int v10 = [(CDXLoadExtensionDataOperation *)self store];
    id v18 = 0;
    unsigned int v11 = objc_msgSend(v10, "removeBlockingEntriesWithData:extensionID:error:", v7, -[CDXLoadExtensionDataOperation extensionID](self, "extensionID"), &v18);
    id v12 = v18;

    id v13 = sub_100006944();
    BOOL v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v7 count];
        *(_DWORD *)buf = 134217984;
        id v20 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removed %lu phone number blocking entries", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      sub_100024E48();
    }

    if (a5)
    {
LABEL_14:
      if (v12) {
        *a5 = v12;
      }
    }
  }
  else
  {
    id v16 = sub_100006944();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100024EC0();
    }

    id v12 = +[NSError cx_callDirectoryManagerErrorWithCode:8];
    if (a5) {
      goto LABEL_14;
    }
  }

  return v12 == 0;
}

- (BOOL)extensionDataRequest:(id)a3 removedAllBlockingEntriesWithError:(id *)a4
{
  id v6 = [(CDXLoadExtensionDataOperation *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100006944();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Extension data request removed all blocking entries", buf, 2u);
  }

  if ((id)[(CDXLoadExtensionDataOperation *)self incrementalLoadingState] == (id)2)
  {
    id v8 = [(CDXLoadExtensionDataOperation *)self store];
    id v16 = 0;
    unsigned int v9 = objc_msgSend(v8, "removeBlockingEntriesForExtensionWithID:error:", -[CDXLoadExtensionDataOperation extensionID](self, "extensionID"), &v16);
    id v10 = v16;

    unsigned int v11 = sub_100006944();
    id v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removed all phone number blocking entries", v15, 2u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      sub_100024EF4();
    }

    if (a4)
    {
LABEL_14:
      if (v10) {
        *a4 = v10;
      }
    }
  }
  else
  {
    id v13 = sub_100006944();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100024EC0();
    }

    id v10 = +[NSError cx_callDirectoryManagerErrorWithCode:8];
    if (a4) {
      goto LABEL_14;
    }
  }

  return v10 == 0;
}

- (BOOL)extensionDataRequest:(id)a3 addedIdentificationEntryData:(id)a4 error:(id *)a5
{
  id v7 = (char *)a4;
  id v8 = [(CDXLoadExtensionDataOperation *)self queue];
  dispatch_assert_queue_V2(v8);

  unsigned int v9 = sub_100006944();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Extension data request added identification entry data: %@", buf, 0xCu);
  }

  if ([(CDXLoadExtensionDataOperation *)self performInitialDeletionIfNecessaryWithError:a5])
  {
    id v10 = (char *)[v7 count];
    unsigned int v11 = &v10[[(CDXLoadExtensionDataOperation *)self entriesAdded]];
    if (v11 >= (char *)[(CDXLoadExtensionDataOperation *)self maximumAllowedEntries])
    {
      id v15 = sub_100006944();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100024DD0(self);
      }

      id v12 = +[NSError cx_callDirectoryManagerErrorWithCode:5];
    }
    else
    {
      id v12 = 0;
      if (!v10)
      {
LABEL_31:
        BOOL v14 = v12 == 0;

        goto LABEL_32;
      }
      while (1)
      {
        id v13 = [v7 phoneNumberAtIndex:v12];
        if (v13 == (id)[(CDXLoadExtensionDataOperation *)self lastIdentificationPhoneNumber])break; {
        if ((uint64_t)v13 < [(CDXLoadExtensionDataOperation *)self lastIdentificationPhoneNumber])
        }
        {
          id v16 = sub_100006944();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_10002505C();
          }
          uint64_t v17 = 3;
          goto LABEL_20;
        }
        [(CDXLoadExtensionDataOperation *)self setLastIdentificationPhoneNumber:v13];
        if (v10 == ++v12) {
          goto LABEL_21;
        }
      }
      id v16 = sub_100006944();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100024FE4();
      }
      uint64_t v17 = 4;
LABEL_20:

      id v12 = +[NSError cx_callDirectoryManagerErrorWithCode:v17];
      if (v12) {
        goto LABEL_28;
      }
LABEL_21:
      id v18 = [(CDXLoadExtensionDataOperation *)self store];
      id v23 = 0;
      unsigned int v19 = objc_msgSend(v18, "addIdentificationEntriesWithData:extensionID:error:", v7, -[CDXLoadExtensionDataOperation extensionID](self, "extensionID"), &v23);
      id v12 = (char *)v23;

      id v20 = sub_100006944();
      v21 = v20;
      if (v19)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v25 = v10;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Added %lu phone number identification entries", buf, 0xCu);
        }

        [(CDXLoadExtensionDataOperation *)self setIdentificationEntriesAdded:&v10[[(CDXLoadExtensionDataOperation *)self identificationEntriesAdded]]];
      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100024F6C();
        }
      }
    }
LABEL_28:
    if (a5 && v12)
    {
      id v12 = v12;
      *a5 = v12;
    }
    goto LABEL_31;
  }
  BOOL v14 = 0;
LABEL_32:

  return v14;
}

- (BOOL)extensionDataRequest:(id)a3 removedIdentificationEntryData:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = [(CDXLoadExtensionDataOperation *)self queue];
  dispatch_assert_queue_V2(v8);

  unsigned int v9 = sub_100006944();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Extension data request removed identification entry data: %@", buf, 0xCu);
  }

  if ((id)[(CDXLoadExtensionDataOperation *)self incrementalLoadingState] == (id)2)
  {
    id v10 = [(CDXLoadExtensionDataOperation *)self store];
    id v18 = 0;
    unsigned int v11 = objc_msgSend(v10, "removeIdentificationEntriesWithData:extensionID:error:", v7, -[CDXLoadExtensionDataOperation extensionID](self, "extensionID"), &v18);
    id v12 = v18;

    id v13 = sub_100006944();
    BOOL v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v7 count];
        *(_DWORD *)buf = 134217984;
        id v20 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removed %lu phone number identification entries", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      sub_1000250D4();
    }

    if (a5)
    {
LABEL_14:
      if (v12) {
        *a5 = v12;
      }
    }
  }
  else
  {
    id v16 = sub_100006944();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100024EC0();
    }

    id v12 = +[NSError cx_callDirectoryManagerErrorWithCode:8];
    if (a5) {
      goto LABEL_14;
    }
  }

  return v12 == 0;
}

- (BOOL)extensionDataRequest:(id)a3 removedAllIdentificationEntriesWithError:(id *)a4
{
  id v6 = [(CDXLoadExtensionDataOperation *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_100006944();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Extension data request removed all identification entries", buf, 2u);
  }

  if ((id)[(CDXLoadExtensionDataOperation *)self incrementalLoadingState] == (id)2)
  {
    id v8 = [(CDXLoadExtensionDataOperation *)self store];
    id v16 = 0;
    unsigned int v9 = objc_msgSend(v8, "removeIdentificationEntriesForExtensionWithID:error:", -[CDXLoadExtensionDataOperation extensionID](self, "extensionID"), &v16);
    id v10 = v16;

    unsigned int v11 = sub_100006944();
    id v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removed all phone number identification entries", v15, 2u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      sub_10002514C();
    }

    if (a4)
    {
LABEL_14:
      if (v10) {
        *a4 = v10;
      }
    }
  }
  else
  {
    id v13 = sub_100006944();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100024EC0();
    }

    id v10 = +[NSError cx_callDirectoryManagerErrorWithCode:8];
    if (a4) {
      goto LABEL_14;
    }
  }

  return v10 == 0;
}

- (BOOL)allowLoadingDisabledExtensions
{
  return self->_allowLoadingDisabledExtensions;
}

- (void)setAllowLoadingDisabledExtensions:(BOOL)a3
{
  self->_allowLoadingDisabledExtensions = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
}

- (CDXExtensionDataRequest)dataRequest
{
  return self->_dataRequest;
}

- (void)setDataRequest:(id)a3
{
}

- (CXCallDirectoryStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (int64_t)extensionID
{
  return self->_extensionID;
}

- (void)setExtensionID:(int64_t)a3
{
  self->_extensionID = a3;
}

- (unint64_t)maximumAllowedEntries
{
  return self->_maximumAllowedEntries;
}

- (void)setMaximumAllowedEntries:(unint64_t)a3
{
  self->_maximumAllowedEntries = a3;
}

- (int64_t)incrementalLoadingState
{
  return self->_incrementalLoadingState;
}

- (void)setIncrementalLoadingState:(int64_t)a3
{
  self->_incrementalLoadingState = a3;
}

- (BOOL)hasPerfomedInitialDeletion
{
  return self->_hasPerfomedInitialDeletion;
}

- (void)setHasPerfomedInitialDeletion:(BOOL)a3
{
  self->_hasPerfomedInitialDeletion = a3;
}

- (unint64_t)blockingEntriesAdded
{
  return self->_blockingEntriesAdded;
}

- (void)setBlockingEntriesAdded:(unint64_t)a3
{
  self->_blockingEntriesAdded = a3;
}

- (unint64_t)identificationEntriesAdded
{
  return self->_identificationEntriesAdded;
}

- (void)setIdentificationEntriesAdded:(unint64_t)a3
{
  self->_identificationEntriesAdded = a3;
}

- (int64_t)lastBlockingPhoneNumber
{
  return self->_lastBlockingPhoneNumber;
}

- (void)setLastBlockingPhoneNumber:(int64_t)a3
{
  self->_lastBlockingPhoneNumber = a3;
}

- (int64_t)lastIdentificationPhoneNumber
{
  return self->_lastIdentificationPhoneNumber;
}

- (void)setLastIdentificationPhoneNumber:(int64_t)a3
{
  self->_lastIdentificationPhoneNumber = a3;
}

- (CDXAWDReporter)awdReporter
{
  return self->_awdReporter;
}

- (void)setAwdReporter:(id)a3
{
}

- (CDXNotifydNotifier)identificationEntriesChangedNotifier
{
  return self->_identificationEntriesChangedNotifier;
}

- (void)setIdentificationEntriesChangedNotifier:(id)a3
{
}

- (CXCallDirectoryUpdateDelegate)updateDelegate
{
  return self->_updateDelegate;
}

- (void)setUpdateDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateDelegate, 0);
  objc_storeStrong((id *)&self->_identificationEntriesChangedNotifier, 0);
  objc_storeStrong((id *)&self->_awdReporter, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_dataRequest, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end