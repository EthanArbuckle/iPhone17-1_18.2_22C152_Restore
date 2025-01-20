@interface CHIDSPeerDevice
- (BOOL)_sendBootstrapDataStoreWithService:(id)a3;
- (BOOL)downgradeDatabaseAtLocation:(id)a3;
- (CHIDSPeerDevice)initWithDevice:(id)a3 withPairedSyncCoordinator:(id)a4 withConfiguration:(int)a5;
- (CHPairedSyncCoordinator)coordinator;
- (IDSDevice)device;
- (NSArray)pendingTransactions;
- (NSString)sendIdentifier;
- (OS_os_transaction)osTransaction;
- (TransactionLog)txLog;
- (int)configuration;
- (int)status;
- (int64_t)getSchemaVersionToDowngradeTo;
- (void)flushTransactionsWithService:(id)a3;
- (void)removeTemporaryBootstrapDataStore;
- (void)sendBootstrapDataStoreWithService:(id)a3;
- (void)sendMessage:(id)a3 withService:(id)a4;
- (void)sendTransactions:(id)a3 withService:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)setConfiguration:(int)a3;
- (void)setCoordinator:(id)a3;
- (void)setDevice:(id)a3;
- (void)setOsTransaction:(id)a3;
- (void)setPendingTransactions:(id)a3;
- (void)setSendIdentifier:(id)a3;
- (void)setStatus:(int)a3;
- (void)setTxLog:(id)a3;
@end

@implementation CHIDSPeerDevice

- (CHIDSPeerDevice)initWithDevice:(id)a3 withPairedSyncCoordinator:(id)a4 withConfiguration:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CHIDSPeerDevice;
  v11 = [(CHIDSPeerDevice *)&v18 initWithName:"IDSPeerDevice"];
  if (v11)
  {
    if ([v9 isNearby]) {
      int v12 = 2;
    }
    else {
      int v12 = 0;
    }
    v11->_status = v12;
    objc_storeStrong((id *)&v11->_device, a3);
    v13 = [TransactionLog alloc];
    v14 = [v9 uniqueIDOverride];
    v15 = [(TransactionLog *)v13 initWithFileName:v14 withDescription:"TransactionLog-IDS"];
    txLog = v11->_txLog;
    v11->_txLog = v15;

    v11->_configuration = a5;
    objc_storeStrong((id *)&v11->_coordinator, a4);
  }

  return v11;
}

- (void)sendTransactions:(id)a3 withService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CHIDSPeerDevice *)self status] != 2)
  {
    id v9 = [(CHIDSPeerDevice *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(CHIDSPeerDevice *)self device];
      int v12 = [v11 uniqueIDOverride];
      int v22 = 138543618;
      v23 = v12;
      __int16 v24 = 2082;
      v25 = sub_1000280D0([(CHIDSPeerDevice *)self status]);
      v13 = "Queueing transactions for device %{public}@ until status(%{public}s) is available";
      v14 = v9;
      uint32_t v15 = 22;
      goto LABEL_7;
    }
LABEL_8:

    v16 = [(CHIDSPeerDevice *)self txLog];
    [v16 append:v6];
    goto LABEL_9;
  }
  v8 = [(CHIDSPeerDevice *)self pendingTransactions];

  id v9 = [(CHIDSPeerDevice *)self logHandle];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = [(CHIDSPeerDevice *)self device];
      int v12 = [v11 uniqueIDOverride];
      int v22 = 138543362;
      v23 = v12;
      v13 = "Queueing transactions for device %{public}@ until previous send has completed";
      v14 = v9;
      uint32_t v15 = 12;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v22, v15);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v10)
  {
    v17 = [(CHIDSPeerDevice *)self device];
    objc_super v18 = [v17 uniqueIDOverride];
    int v22 = 138543618;
    v23 = v18;
    __int16 v24 = 2082;
    v25 = sub_1000280D0([(CHIDSPeerDevice *)self status]);
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device %{public}@ status is %{public}s", (uint8_t *)&v22, 0x16u);
  }
  [(CHIDSPeerDevice *)self setPendingTransactions:v6];
  v16 = sub_100027E58(v6);
  v19 = objc_opt_new();
  v20 = [v16 data];
  [v19 setObject:v20 forKey:@"ProtobufTransactions"];

  v21 = +[NSNumber numberWithInt:[(CHIDSPeerDevice *)self configuration]];
  [v19 setObject:v21 forKey:@"Configuration"];

  [(CHIDSPeerDevice *)self sendMessage:v19 withService:v7];
LABEL_9:
}

- (void)sendMessage:(id)a3 withService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CHIDSPeerDevice *)self device];
  id v9 = (void *)IDSCopyIDForDevice();
  BOOL v10 = +[NSSet setWithObject:v9];
  id v20 = 0;
  id v21 = 0;
  unsigned int v11 = [v6 sendMessage:v7 fromAccount:0 toDestinations:v10 priority:300 options:0 identifier:&v21 error:&v20];

  id v12 = v21;
  id v13 = v20;

  if (v11)
  {
    ct_green_tea_logger_create_static();
    v14 = getCTGreenTeaOsLogHandle();
    uint32_t v15 = v14;
    if (v14 && os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Transmit over IDS", buf, 2u);
    }

    v16 = [(CHIDSPeerDevice *)self logHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(CHIDSPeerDevice *)self device];
      objc_super v18 = [v17 uniqueIDOverride];
      *(_DWORD *)buf = 138543618;
      v23 = v18;
      __int16 v24 = 2114;
      id v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Sent message to %{public}@ with identifier %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v16 = [(CHIDSPeerDevice *)self logHandle];
    BOOL v19 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      if (v19) {
        sub_10002E178(self, (uint64_t)v13, v16);
      }
    }
    else if (v19)
    {
      sub_10002E0DC(self);
    }
  }

  [(CHIDSPeerDevice *)self setSendIdentifier:v12];
}

- (void)flushTransactionsWithService:(id)a3
{
  id v4 = a3;
  if ([(CHIDSPeerDevice *)self status] != 2)
  {
    id v6 = [(CHIDSPeerDevice *)self logHandle];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    id v9 = [(CHIDSPeerDevice *)self device];
    BOOL v10 = [v9 uniqueIDOverride];
    int v19 = 138543618;
    id v20 = v10;
    __int16 v21 = 2082;
    int v22 = sub_1000280D0([(CHIDSPeerDevice *)self status]);
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Delaying flush for device %{public}@ until we are available (%{public}s)", (uint8_t *)&v19, 0x16u);

LABEL_13:
    goto LABEL_14;
  }
  v5 = [(CHIDSPeerDevice *)self pendingTransactions];

  if (!v5)
  {
    unsigned int v11 = [(CHIDSPeerDevice *)self txLog];
    id v6 = [v11 getTransactions];

    id v12 = [v6 count];
    id v9 = [(CHIDSPeerDevice *)self logHandle];
    BOOL v13 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v13)
      {
        id v14 = [v6 count];
        uint32_t v15 = [(CHIDSPeerDevice *)self device];
        v16 = [v15 uniqueIDOverride];
        int v19 = 134218242;
        id v20 = v14;
        __int16 v21 = 2114;
        int v22 = v16;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Flushing %lu transactions for device %{public}@", (uint8_t *)&v19, 0x16u);
      }
      [(CHIDSPeerDevice *)self sendTransactions:v6 withService:v4];
      id v9 = [(CHIDSPeerDevice *)self txLog];
      [v9 clear];
    }
    else if (v13)
    {
      v17 = [(CHIDSPeerDevice *)self device];
      objc_super v18 = [v17 uniqueIDOverride];
      int v19 = 138543362;
      id v20 = v18;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No transactions to flush for device %{public}@", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_13;
  }
  id v6 = [(CHIDSPeerDevice *)self logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(CHIDSPeerDevice *)self device];
    v8 = [v7 uniqueIDOverride];
    int v19 = 138543362;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Delaying flush for device %{public}@ until previous send has completed", (uint8_t *)&v19, 0xCu);
  }
LABEL_14:
}

- (int64_t)getSchemaVersionToDowngradeTo
{
  int64_t CurrentVersion = CHSchemaGetCurrentVersion();
  id v4 = [(CHIDSPeerDevice *)self device];
  v5 = [v4 productVersion];

  id v6 = [(CHIDSPeerDevice *)self logHandle];
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Gizmo has software version %{public}@.", (uint8_t *)&v13, 0xCu);
    }

    id v7 = [v5 componentsSeparatedByString:@"."];
    if ([v7 count])
    {
      v8 = [v7 firstObject];
      id v9 = [v8 integerValue];

      BOOL v10 = [(CHIDSPeerDevice *)self logHandle];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 134217984;
        id v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Gizmo has major software version %ld.", (uint8_t *)&v13, 0xCu);
      }

      switch((unint64_t)v9)
      {
        case 1uLL:
        case 2uLL:
          int64_t CurrentVersion = 5;
          break;
        case 3uLL:
        case 4uLL:
          int64_t CurrentVersion = 13;
          break;
        case 5uLL:
          int64_t CurrentVersion = 17;
          break;
        case 6uLL:
          int64_t CurrentVersion = 20;
          break;
        case 7uLL:
          int64_t CurrentVersion = 21;
          break;
        case 8uLL:
          int64_t CurrentVersion = 22;
          break;
        case 9uLL:
          int64_t CurrentVersion = 24;
          break;
        case 0xAuLL:
          int64_t CurrentVersion = 27;
          break;
        case 0xBuLL:
          int64_t CurrentVersion = 35;
          break;
        default:
          break;
      }
    }
    else
    {
      unsigned int v11 = [(CHIDSPeerDevice *)self logHandle];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10002E270(v11);
      }
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10002E22C(v7);
  }

  return CurrentVersion;
}

- (BOOL)downgradeDatabaseAtLocation:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CHIDSPeerDevice *)self getSchemaVersionToDowngradeTo];
  id v6 = [(CHIDSPeerDevice *)self logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    int64_t v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Downgrading data store to schema version %ld.", (uint8_t *)&v11, 0xCu);
  }

  id v7 = +[CallDBManagerServer downgradeDatabaseAtLocation:v4 toVersion:v5];

  id v8 = [v7 errorCode];
  if (!v8)
  {
    id v9 = [(CHIDSPeerDevice *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      int64_t v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Downgraded temporary data store to schema version %ld.", (uint8_t *)&v11, 0xCu);
    }
  }
  return v8 == 0;
}

- (void)sendBootstrapDataStoreWithService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = os_transaction_create();
  [(CHIDSPeerDevice *)self setOsTransaction:v5];

  LOBYTE(v5) = [(CHIDSPeerDevice *)self _sendBootstrapDataStoreWithService:v4];
  if ((v5 & 1) == 0)
  {
    [(CHIDSPeerDevice *)self setOsTransaction:0];
  }
}

- (BOOL)_sendBootstrapDataStoreWithService:(id)a3
{
  id v4 = a3;
  if ([(CHIDSPeerDevice *)self configuration] == 1)
  {
    unsigned __int8 v33 = 0;
    uint64_t v5 = +[CallDBManager getDBLocationIsSandboxed:0 isTemporary:0 error:&v33];
    id v6 = [(CHIDSPeerDevice *)self logHandle];
    id v7 = v6;
    if (!v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10002E2B4(&v33, v7);
      }

      int64_t v12 = [(CHIDSPeerDevice *)self coordinator];
      [v12 syncFailedWithError:0];
      unsigned __int8 v17 = 0;
      goto LABEL_33;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(CHIDSPeerDevice *)self device];
      id v9 = [v8 uniqueIDOverride];
      *(_DWORD *)buf = 138543618;
      v35 = v5;
      __int16 v36 = 2114;
      v37 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending bootstrap database %{public}@ to %{public}@", buf, 0x16u);
    }
    BOOL v10 = [(CHIDSPeerDevice *)self device];
    int v11 = [v10 uniqueIDOverride];
    int64_t v12 = [v5 URLByAppendingPathExtension:v11];

    if (+[DBManager replacePersistentStore:v12 withURL:v5])
    {
      if ((+[DBManager makeDatabaseAtURLClassCDataProtected:v12] & 1) == 0)
      {
        int v13 = [(CHIDSPeerDevice *)self logHandle];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v35 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unable to make database at location: %{public}@ class C data protected", buf, 0xCu);
        }
      }
      if ([(CHIDSPeerDevice *)self downgradeDatabaseAtLocation:v12])
      {
        [(CHIDSPeerDevice *)self setStatus:1];
        id v14 = [(CHIDSPeerDevice *)self device];
        uint32_t v15 = (void *)IDSCopyIDForDevice();
        v16 = +[NSSet setWithObject:v15];
        id v31 = 0;
        id v32 = 0;
        unsigned __int8 v17 = [v4 sendResourceAtURL:v12 metadata:0 toDestinations:v16 priority:200 options:0 identifier:&v32 error:&v31];
        id v18 = v32;
        id v19 = v31;

        if (v17)
        {
          [(CHIDSPeerDevice *)self setSendIdentifier:v18];
          id v20 = [(CHIDSPeerDevice *)self logHandle];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v21 = [(CHIDSPeerDevice *)self device];
            int v22 = [v21 uniqueIDOverride];
            v23 = [(CHIDSPeerDevice *)self sendIdentifier];
            *(_DWORD *)buf = 138543618;
            v35 = v22;
            __int16 v36 = 2114;
            v37 = v23;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Sent bootstrap database successfully to %{public}@ with identifier: %{public}@", buf, 0x16u);
          }
          ct_green_tea_logger_create_static();
          __int16 v24 = getCTGreenTeaOsLogHandle();
          id v25 = v24;
          if (v24 && os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Transmit over IDS", buf, 2u);
          }
        }
        else
        {
          [(CHIDSPeerDevice *)self setStatus:0];
          v29 = [(CHIDSPeerDevice *)self logHandle];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_10002E330();
          }

          id v25 = [(CHIDSPeerDevice *)self coordinator];
          [v25 syncFailedWithError:v19];
        }

        goto LABEL_32;
      }
      v28 = [(CHIDSPeerDevice *)self logHandle];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_10002E3A4();
      }
    }
    else
    {
      v28 = [(CHIDSPeerDevice *)self logHandle];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_10002E428();
      }
    }

    id v19 = [(CHIDSPeerDevice *)self coordinator];
    [v19 syncFailedWithError:0];
    unsigned __int8 v17 = 0;
LABEL_32:

LABEL_33:
    goto LABEL_34;
  }
  v26 = [(CHIDSPeerDevice *)self logHandle];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    sub_10002E4A4(self);
  }

  v27 = [(CHIDSPeerDevice *)self coordinator];
  [v27 syncFailedWithError:0];

  unsigned __int8 v17 = 0;
LABEL_34:

  return v17;
}

- (void)removeTemporaryBootstrapDataStore
{
  unsigned __int8 v8 = 0;
  v3 = +[CallDBManager getDBLocationIsSandboxed:0 isTemporary:0 error:&v8];
  if (v3)
  {
    id v4 = [(CHIDSPeerDevice *)self device];
    uint64_t v5 = [v4 uniqueIDOverride];
    id v6 = [v3 URLByAppendingPathExtension:v5];

    id v7 = +[CallDBManager modelURL];
    +[DBManager destroyDBAtLocation:v6 withModelAtLocation:v7];
  }
  else
  {
    id v6 = [(CHIDSPeerDevice *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002E2B4(&v8, v6);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (char *)a7;
  if (v13)
  {
    uint32_t v15 = [(CHIDSPeerDevice *)self sendIdentifier];
    unsigned int v16 = [v13 isEqualToString:v15];

    if (v16)
    {
      [(CHIDSPeerDevice *)self setSendIdentifier:0];
      if ([(CHIDSPeerDevice *)self status] == 1)
      {
        unsigned __int8 v17 = [(CHIDSPeerDevice *)self coordinator];
        id v18 = v17;
        if (v14)
        {
          [v17 syncFailedWithError:v14];

          id v19 = [(CHIDSPeerDevice *)self logHandle];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = [(CHIDSPeerDevice *)self device];
            __int16 v21 = [v20 uniqueIDOverride];
            int v40 = 138543618;
            id v41 = v21;
            __int16 v42 = 2114;
            v43 = v14;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sending bootstrap data store to device %{public}@ failed: %{public}@", (uint8_t *)&v40, 0x16u);
          }
LABEL_11:

          goto LABEL_18;
        }
        [v17 syncComplete];

        [(CHIDSPeerDevice *)self setStatus:2];
        unsigned __int8 v33 = [(CHIDSPeerDevice *)self logHandle];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = [(CHIDSPeerDevice *)self device];
          v35 = [v34 uniqueIDOverride];
          int v40 = 138412546;
          id v41 = v35;
          __int16 v42 = 2082;
          v43 = sub_1000280D0([(CHIDSPeerDevice *)self status]);
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Device %@ bootstrapped successfully, changing status to %{public}s", (uint8_t *)&v40, 0x16u);
        }
        [(CHIDSPeerDevice *)self flushTransactionsWithService:v11];
        [(CHIDSPeerDevice *)self removeTemporaryBootstrapDataStore];
        [(CHIDSPeerDevice *)self setOsTransaction:0];
      }
      else
      {
        int v22 = [(CHIDSPeerDevice *)self logHandle];
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v23)
          {
            __int16 v24 = [(CHIDSPeerDevice *)self pendingTransactions];
            id v25 = [v24 count];
            v26 = [(CHIDSPeerDevice *)self device];
            v27 = [v26 uniqueIDOverride];
            int v40 = 134218498;
            id v41 = v25;
            __int16 v42 = 2114;
            v43 = v27;
            __int16 v44 = 2112;
            v45 = v14;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Sending %lu transactions to device %{public}@ failed: %@", (uint8_t *)&v40, 0x20u);
          }
          v28 = [(CHIDSPeerDevice *)self pendingTransactions];
          id v19 = +[NSMutableArray arrayWithArray:v28];

          v29 = [(CHIDSPeerDevice *)self txLog];
          v30 = [v29 getTransactions];
          [v19 addObjectsFromArray:v30];

          id v31 = [(CHIDSPeerDevice *)self txLog];
          [v31 clear];

          id v32 = [(CHIDSPeerDevice *)self txLog];
          [v32 append:v19];

          [(CHIDSPeerDevice *)self setPendingTransactions:0];
          goto LABEL_11;
        }
        if (v23)
        {
          __int16 v36 = [(CHIDSPeerDevice *)self pendingTransactions];
          id v37 = [v36 count];
          v38 = [(CHIDSPeerDevice *)self device];
          v39 = [v38 uniqueIDOverride];
          int v40 = 134218498;
          id v41 = v37;
          __int16 v42 = 2114;
          v43 = v39;
          __int16 v44 = 2114;
          v45 = (char *)v13;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Successfully sent %lu transactions to device %{public}@ with identifier %{public}@", (uint8_t *)&v40, 0x20u);
        }
        [(CHIDSPeerDevice *)self setPendingTransactions:0];
        [(CHIDSPeerDevice *)self flushTransactionsWithService:v11];
      }
    }
  }
LABEL_18:
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (IDSDevice)device
{
  return (IDSDevice *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDevice:(id)a3
{
}

- (TransactionLog)txLog
{
  return (TransactionLog *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTxLog:(id)a3
{
}

- (int)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(int)a3
{
  self->_configuration = a3;
}

- (NSString)sendIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSendIdentifier:(id)a3
{
}

- (NSArray)pendingTransactions
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPendingTransactions:(id)a3
{
}

- (CHPairedSyncCoordinator)coordinator
{
  return (CHPairedSyncCoordinator *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (OS_os_transaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setOsTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_pendingTransactions, 0);
  objc_storeStrong((id *)&self->_sendIdentifier, 0);
  objc_storeStrong((id *)&self->_txLog, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end