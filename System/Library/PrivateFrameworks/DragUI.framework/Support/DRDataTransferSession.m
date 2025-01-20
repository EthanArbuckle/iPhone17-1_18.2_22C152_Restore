@interface DRDataTransferSession
+ (BOOL)_shouldRestrictOpenInPlaceFor:(id)a3 destinationAuditToken:(id *)a4;
- (BOOL)_isRepresentationAllowed:(id)a3 forDestination:(id)a4;
- (BOOL)setDestinationAuditToken:(id *)a3;
- (DRDataTransferSession)initWithSourceItemCollection:(id)a3 sourceAuditToken:(id *)a4 dataProviderEndpoint:(id)a5 filter:(id)a6;
- (DRDataTransferSessionDelegate)delegate;
- (DRProcessInfo)destinationProcessInfo;
- (DRProcessInfo)sourceProcessInfo;
- (PBItemCollection)destinationItemCollection;
- (PBItemCollection)sourceItemCollection;
- (id)_copyItemCollectionForDestinationWithFilter:(id)a3;
- (id)_registerRequestFromSourceItem:(id)a3 typeIdentifier:(id)a4 completionHandler:(id)a5;
- (id)destinationDataProviderEndpoint;
- (void)_setupItem:(id)a3 forLoadingFromSourceItem:(id)a4 destination:(id)a5;
- (void)_transferQueue_scheduleNextTransfer;
- (void)_transferQueue_sendDelegateCallbacksIfNeeded;
- (void)cancelDataTransfer;
- (void)clearDestinationAuditToken;
- (void)dataTransferMonitorBeganTransfers:(id)a3;
- (void)dataTransferMonitorFinishedTransfers:(id)a3;
- (void)setDataProviderEndpoint:(id)a3 auditToken:(id *)a4;
- (void)setDelegate:(id)a3;
- (void)setDestinationIsAnotherDevice:(BOOL)a3;
- (void)setSourceItemCollection:(id)a3;
- (void)startSendingDelegateCallbacks;
@end

@implementation DRDataTransferSession

- (DRDataTransferSession)initWithSourceItemCollection:(id)a3 sourceAuditToken:(id *)a4 dataProviderEndpoint:(id)a5 filter:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v30.receiver = self;
  v30.super_class = (Class)DRDataTransferSession;
  v14 = [(DRDataTransferSession *)&v30 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sourceItemCollection, a3);
    [(PBItemCollection *)v15->_sourceItemCollection setDataProviderEndpoint:v12];
    [(PBItemCollection *)v15->_sourceItemCollection establishConnectionToDataProviderCompletionBlock:&stru_100055130];
    v16 = [DRProcessInfo alloc];
    long long v17 = *(_OWORD *)&a4->var0[4];
    v29[0] = *(_OWORD *)a4->var0;
    v29[1] = v17;
    v18 = [(DRProcessInfo *)v16 initWithAuditToken:v29];
    sourceProcessInfo = v15->_sourceProcessInfo;
    v15->_sourceProcessInfo = v18;

    sub_100013848(v15->_sourceItemCollection, v15->_sourceProcessInfo);
    v20 = (PBDataTransferMonitor *)objc_alloc_init((Class)PBDataTransferMonitor);
    dataTransferMonitor = v15->_dataTransferMonitor;
    v15->_dataTransferMonitor = v20;

    [(PBDataTransferMonitor *)v15->_dataTransferMonitor setDelegate:v15];
    uint64_t v22 = +[NSMutableArray array];
    transferQueue_requestsQueue = v15->_transferQueue_requestsQueue;
    v15->_transferQueue_requestsQueue = (NSMutableArray *)v22;

    uint64_t v24 = +[NSMutableArray array];
    transferQueue_requestsInProgress = v15->_transferQueue_requestsInProgress;
    v15->_transferQueue_requestsInProgress = (NSMutableArray *)v24;

    id v26 = objc_retainBlock(v13);
    id filter = v15->_filter;
    v15->_id filter = v26;
  }
  return v15;
}

- (void)setSourceItemCollection:(id)a3
{
  objc_storeStrong((id *)&self->_sourceItemCollection, a3);
  id v6 = a3;
  sub_100013848(self->_sourceItemCollection, self->_sourceProcessInfo);
  destinationItemCollection = self->_destinationItemCollection;
  self->_destinationItemCollection = 0;
}

- (BOOL)setDestinationAuditToken:(id *)a3
{
  v5 = [DRProcessInfo alloc];
  long long v6 = *(_OWORD *)&a3->var0[4];
  v11[0] = *(_OWORD *)a3->var0;
  v11[1] = v6;
  v7 = [(DRProcessInfo *)v5 initWithAuditToken:v11];
  destinationProcessInfo = self->_destinationProcessInfo;
  self->_destinationProcessInfo = v7;

  destinationItemCollection = self->_destinationItemCollection;
  self->_destinationItemCollection = 0;

  return 1;
}

- (PBItemCollection)destinationItemCollection
{
  destinationItemCollection = self->_destinationItemCollection;
  if (!destinationItemCollection)
  {
    v4 = [(DRDataTransferSession *)self _copyItemCollectionForDestinationWithFilter:0];
    v5 = self->_destinationItemCollection;
    self->_destinationItemCollection = v4;

    [(PBItemCollection *)self->_destinationItemCollection setDataTransferDelegate:self->_dataTransferMonitor];
    destinationItemCollection = self->_destinationItemCollection;
  }
  return destinationItemCollection;
}

- (void)clearDestinationAuditToken
{
  destinationProcessInfo = self->_destinationProcessInfo;
  self->_destinationProcessInfo = 0;

  destinationItemCollection = self->_destinationItemCollection;
  self->_destinationItemCollection = 0;
}

- (void)setDestinationIsAnotherDevice:(BOOL)a3
{
  [(DRProcessInfo *)self->_destinationProcessInfo setIsAnotherDevice:a3];
  destinationItemCollection = self->_destinationItemCollection;
  self->_destinationItemCollection = 0;
}

- (id)_copyItemCollectionForDestinationWithFilter:(id)a3
{
  id v4 = a3;
  if (self->_destinationProcessInfo)
  {
    [(PBItemCollection *)self->_sourceItemCollection originatorDataOwner];
    v5 = [(DRProcessInfo *)self->_sourceProcessInfo bundleID];
    long long v6 = [(DRProcessInfo *)self->_destinationProcessInfo bundleID];
    int v7 = _UIDropAllowedBetweenApps();

    if (v7)
    {
      id v8 = [(PBItemCollection *)self->_sourceItemCollection copyWithDoNothingLoaders];
      v9 = [(PBItemCollection *)self->_sourceItemCollection items];
      id v10 = [v9 count];

      if (v10)
      {
        unint64_t v11 = 0;
        do
        {
          id v12 = [(PBItemCollection *)self->_sourceItemCollection items];
          id v13 = [v12 objectAtIndexedSubscript:v11];

          v14 = [v8 items];
          v15 = [v14 objectAtIndexedSubscript:v11];

          [(DRDataTransferSession *)self _setupItem:v15 forLoadingFromSourceItem:v13 destination:self->_destinationProcessInfo];
          ++v11;
          v16 = [(PBItemCollection *)self->_sourceItemCollection items];
          id v17 = [v16 count];
        }
        while (v11 < (unint64_t)v17);
      }
    }
    else
    {
      id v18 = objc_alloc((Class)NSMutableArray);
      v19 = [(PBItemCollection *)self->_sourceItemCollection items];
      id v20 = objc_msgSend(v18, "initWithCapacity:", objc_msgSend(v19, "count"));

      v21 = [(PBItemCollection *)self->_sourceItemCollection items];
      id v22 = [v21 count];

      if (v22)
      {
        unint64_t v23 = 0;
        do
        {
          id v24 = objc_alloc_init((Class)PBItem);
          [v20 addObject:v24];

          ++v23;
          v25 = [(PBItemCollection *)self->_sourceItemCollection items];
          id v26 = [v25 count];
        }
        while (v23 < (unint64_t)v26);
      }
      id v8 = [(PBItemCollection *)self->_sourceItemCollection copyWithItems:v20];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)destinationDataProviderEndpoint
{
  [(PBItemCollection *)self->_sourceItemCollection originatorDataOwner];
  v3 = [(DRProcessInfo *)self->_sourceProcessInfo bundleID];
  id v4 = [(DRProcessInfo *)self->_destinationProcessInfo bundleID];
  int v5 = _UIDropAllowedBetweenApps();

  if (v5)
  {
    long long v6 = [(DRDataTransferSession *)self destinationItemCollection];
    int v7 = [v6 dataConsumersEndpoint];
  }
  else
  {
    int v7 = 0;
  }
  return v7;
}

+ (BOOL)_shouldRestrictOpenInPlaceFor:(id)a3 destinationAuditToken:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    long long v6 = *(_OWORD *)&a4->var0[4];
    v11[0] = *(_OWORD *)a4->var0;
    v11[1] = v6;
    BOOL v7 = sub_100005E5C(v11, 0xD0000u);
    id v8 = v5;
    BOOL v9 = !v7 && FPURLIsLocatedOnRemovableStorage() != 0;
    CFRelease(v8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_isRepresentationAllowed:(id)a3 forDestination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1000646E8 != -1) {
    dispatch_once(&qword_1000646E8, &stru_100055150);
  }
  if (![v7 isAppleProcess] || objc_msgSend(v7, "isAnotherDevice"))
  {
    uint64_t v8 = qword_1000646E0;
    BOOL v9 = [v6 typeIdentifier];
    LOBYTE(v8) = [(id)v8 containsObject:v9];

    if (v8) {
      goto LABEL_11;
    }
  }
  if (self->_filter
    && (v10 = ((unint64_t)-[PBItemCollection originatorDataOwner](self->_sourceItemCollection, "originatorDataOwner") & 0xFFFFFFFFFFFFFFFELL) == 2, filter = (uint64_t (**)(id, void *, void, DRProcessInfo *, id))self->_filter, [v6 typeIdentifier], id v12 = objc_claimAutoreleasedReturnValue(), LODWORD(v10) = filter[2](filter, v12, v10, self->_sourceProcessInfo, v7), v12, !v10))
  {
LABEL_11:
    BOOL v15 = 0;
  }
  else
  {
    id v13 = [v6 visibility];
    if (v13 == (id)1)
    {
      unsigned __int8 v14 = [v7 isSameTeamAsSource:self->_sourceProcessInfo];
    }
    else
    {
      if (v13 != (id)3)
      {
        BOOL v15 = 1;
        goto LABEL_15;
      }
      unsigned __int8 v14 = [v7 isSameProcessAsSource:self->_sourceProcessInfo];
    }
    BOOL v15 = v14;
  }
LABEL_15:

  return v15;
}

- (void)_setupItem:(id)a3 forLoadingFromSourceItem:(id)a4 destination:(id)a5
{
  id v8 = a3;
  id val = a4;
  id v9 = a5;
  if (qword_1000646F8 != -1) {
    dispatch_once(&qword_1000646F8, &stru_100055170);
  }
  uint64_t v10 = [val metadata];
  id v11 = [v10 mutableCopy];

  if (([v9 isSameTeamAsSource:self->_sourceProcessInfo] & 1) == 0) {
    [v11 removeObjectsForKeys:qword_1000646F0];
  }
  id v24 = v11;
  [v8 setMetadata:v11];
  objc_initWeak(&location, val);
  id v26 = +[NSMutableArray array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v12 = [v8 representations];
  id v13 = [v12 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v39;
    id obj = v12;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v17 = [v16 typeIdentifier];
        if ([(DRDataTransferSession *)self _isRepresentationAllowed:v16 forDestination:v9])
        {
          objc_initWeak(&from, self);
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_10001445C;
          v32[3] = &unk_100055210;
          objc_copyWeak(&v35, &location);
          id v33 = v17;
          objc_copyWeak(&v36, &from);
          id v34 = v9;
          [v16 setLoaderBlock:v32];

          objc_destroyWeak(&v36);
          objc_destroyWeak(&v35);
          objc_destroyWeak(&from);
        }
        else
        {
          id v18 = [v16 typeIdentifier];
          [v26 addObject:v18];
        }
      }
      id v12 = obj;
      id v13 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v13);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = v26;
  id v20 = [v19 countByEnumeratingWithState:&v28 objects:v43 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8 * (void)j);
        if (objc_opt_respondsToSelector()) {
          [v8 removeRepresentationOfType:v23];
        }
      }
      id v20 = [v19 countByEnumeratingWithState:&v28 objects:v43 count:16];
    }
    while (v20);
  }

  objc_destroyWeak(&location);
}

- (id)_registerRequestFromSourceItem:(id)a3 typeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = sub_100014F28;
  long long v29 = sub_100014F38;
  id v30 = 0;
  id v11 = DRLogTarget();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v8 UUID];
    *(_DWORD *)buf = 138412546;
    v32 = v12;
    __int16 v33 = 2112;
    id v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Registering request for item UUID %@, type: %@", buf, 0x16u);
  }
  id v13 = sub_100014F40();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014F94;
  block[3] = &unk_100055238;
  id v20 = v8;
  id v21 = v9;
  id v23 = v10;
  id v24 = &v25;
  id v22 = self;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_sync(v13, block);

  id v17 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v17;
}

- (void)_transferQueue_scheduleNextTransfer
{
  v3 = DRLogTarget();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking for transfer requests to schedule.", buf, 2u);
  }

  if (qword_100064720 != -1) {
    dispatch_once(&qword_100064720, &stru_100055380);
  }
  if (byte_100064728) {
    unint64_t v4 = sub_10001614C();
  }
  else {
    unint64_t v4 = 3;
  }
  if ((unint64_t)[(NSMutableArray *)self->_transferQueue_requestsInProgress count] >= v4)
  {
    id v7 = DRLogTarget();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v23 = (char *)[(NSMutableArray *)self->_transferQueue_requestsInProgress count];
      *(_DWORD *)buf = 134217984;
      long long v39 = v23;
      id v24 = "There are already %lu requests in progress. Not scheduling any more.";
      uint64_t v25 = v7;
      uint32_t v26 = 12;
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, v24, buf, v26);
    }
LABEL_33:

    return;
  }
  id v5 = (char *)(v4 - (void)[(NSMutableArray *)self->_transferQueue_requestsInProgress count]);
  if (v5 > [(NSMutableArray *)self->_transferQueue_requestsQueue count]) {
    id v5 = (char *)[(NSMutableArray *)self->_transferQueue_requestsQueue count];
  }
  id v6 = DRLogTarget();
  id v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v24 = "Nothing to transfer.";
      uint64_t v25 = v7;
      uint32_t v26 = 2;
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    long long v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Scheduling %lu items...", buf, 0xCu);
  }

  do
  {
    id v8 = [(NSMutableArray *)self->_transferQueue_requestsQueue objectAtIndex:0];
    [(NSMutableArray *)self->_transferQueue_requestsQueue removeObjectAtIndex:0];
    id v9 = [v8 typeIdentifier];
    id v10 = [v8 sourceItem];
    id v11 = [v10 UUID];

    id v12 = [v8 sourceItem];
    id v13 = [v12 representationConformingToType:v9];

    id v14 = DRLogTarget();
    id v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        long long v39 = v9;
        __int16 v40 = 2112;
        long long v41 = v11;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Scheduling load for type %@ from item UUID %@", buf, 0x16u);
      }

      [(NSMutableArray *)self->_transferQueue_requestsInProgress addObject:v8];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1000155E4;
      v33[3] = &unk_100055260;
      id v34 = v9;
      id v35 = v11;
      id v16 = v8;
      id v36 = v16;
      v37 = self;
      id v17 = objc_retainBlock(v33);
      if (qword_100064720 != -1) {
        dispatch_once(&qword_100064720, &stru_1000553E0);
      }
      if (byte_100064728 && (double v21 = sub_100016300(), v21 >= 1.0))
      {
        double v22 = v21;
        id v18 = +[NSProgress discreteProgressWithTotalUnitCount:100];
        long long v28 = +[NSProgress discreteProgressWithTotalUnitCount:vcvtpd_s64_f64(v22 + v22)];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1000157E0;
        v30[3] = &unk_1000552B0;
        id v31 = v28;
        v32 = v17;
        id v29 = v28;
        uint64_t v27 = [v13 loadWithCompletionHandler:v30];
        [v18 addChild:v27 withPendingUnitCount:10];
        [v18 addChild:v29 withPendingUnitCount:90];
      }
      else
      {
        id v18 = [v13 loadWithCompletionHandler:v17];
      }
      id v19 = [v16 progress];
      [v19 addChild:v18 withPendingUnitCount:100];

      id v15 = v34;
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v8 typeIdentifier];
      *(_DWORD *)buf = 138412546;
      long long v39 = v20;
      __int16 v40 = 2112;
      long long v41 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Could not find representation for type %@ in item UUID %@", buf, 0x16u);
    }
    --v5;
  }
  while (v5);
}

- (void)_transferQueue_sendDelegateCallbacksIfNeeded
{
  if (self->_transferQueue_canTellDelegateAboutFinishedTransfers)
  {
    if (self->_transferQueue_shouldSendBeganCallback)
    {
      v3 = DRLogTarget();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Data transfer session began.", buf, 2u);
      }

      self->_transferQueue_shouldSendBeganCallback = 0;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100015B80;
      block[3] = &unk_100054B58;
      void block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    if (self->_transferQueue_shouldSendFinishedCallback)
    {
      unint64_t v4 = DRLogTarget();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Data transfer session ended.", buf, 2u);
      }

      self->_transferQueue_shouldSendFinishedCallback = 0;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100015C18;
      v5[3] = &unk_100054B58;
      v5[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
    }
  }
}

- (void)startSendingDelegateCallbacks
{
  v3 = sub_100014F40();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015D38;
  block[3] = &unk_100054B58;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)cancelDataTransfer
{
}

- (void)dataTransferMonitorBeganTransfers:(id)a3
{
  unint64_t v4 = sub_100014F40();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015E20;
  block[3] = &unk_100054B58;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)dataTransferMonitorFinishedTransfers:(id)a3
{
  unint64_t v4 = sub_100014F40();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015EBC;
  block[3] = &unk_100054B58;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)setDataProviderEndpoint:(id)a3 auditToken:(id *)a4
{
  [(PBItemCollection *)self->_sourceItemCollection setDataProviderEndpoint:a3];
  [(PBItemCollection *)self->_sourceItemCollection establishConnectionToDataProviderCompletionBlock:&stru_1000552D0];
  id v6 = [DRProcessInfo alloc];
  long long v7 = *(_OWORD *)&a4->var0[4];
  v10[0] = *(_OWORD *)a4->var0;
  v10[1] = v7;
  id v8 = [(DRProcessInfo *)v6 initWithAuditToken:v10];
  sourceProcessInfo = self->_sourceProcessInfo;
  self->_sourceProcessInfo = v8;
}

- (DRDataTransferSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DRDataTransferSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PBItemCollection)sourceItemCollection
{
  return self->_sourceItemCollection;
}

- (DRProcessInfo)sourceProcessInfo
{
  return self->_sourceProcessInfo;
}

- (DRProcessInfo)destinationProcessInfo
{
  return self->_destinationProcessInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceItemCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transferQueue_requestsInProgress, 0);
  objc_storeStrong((id *)&self->_transferQueue_requestsQueue, 0);
  objc_storeStrong((id *)&self->_dataTransferMonitor, 0);
  objc_storeStrong((id *)&self->_destinationItemCollection, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_destinationProcessInfo, 0);
  objc_storeStrong((id *)&self->_sourceProcessInfo, 0);
}

@end