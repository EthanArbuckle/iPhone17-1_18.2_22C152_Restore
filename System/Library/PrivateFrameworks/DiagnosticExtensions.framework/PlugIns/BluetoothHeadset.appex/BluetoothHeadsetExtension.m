@interface BluetoothHeadsetExtension
- (BOOL)didPeripheralConnection;
- (BOOL)leUarpBranchDone;
- (CBCentralManager)centralManager;
- (NSDictionary)cmOptions;
- (NSMutableArray)peripherals;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)xpcConnection;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)getFilesAtPathSortedByModificationDate:(id)a3 numberOfFirstNFiles:(int)a4;
- (void)cancelXPCConnection;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)handleXPCError:(id)a3;
- (void)handleXPCEvent:(id)a3;
- (void)handleXPCMsg:(id)a3;
- (void)leLogRequest;
- (void)sendXPCMsg:(id)a3 args:(id)a4;
- (void)setCentralManager:(id)a3;
- (void)setCmOptions:(id)a3;
- (void)setDidPeripheralConnection:(BOOL)a3;
- (void)setLeUarpBranchDone:(BOOL)a3;
- (void)setPeripherals:(id)a3;
- (void)setQueue:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation BluetoothHeadsetExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  id v59 = a3;
  NSLog(@"attachmentsForParameters: Invoked");
  v4 = (OS_dispatch_queue *)dispatch_queue_create("BluetoothHeadsetLogging", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  queue = self->_queue;
  self->_queue = v4;

  self->_didPeripheralConnection = 0;
  dispatch_group_t v6 = dispatch_group_create();
  v7 = (void *)g_waitingBranchesGroup;
  g_waitingBranchesGroup = (uint64_t)v6;

  dispatch_group_t v8 = dispatch_group_create();
  v9 = (void *)g_waitingPeripheralsGroup;
  g_waitingPeripheralsGroup = (uint64_t)v8;

  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v11 = (void *)g_waitingForSerialsSema;
  g_waitingForSerialsSema = (uint64_t)v10;

  self->_leUarpBranchDone = 0;
  uint64_t v76 = CBCentralManagerOptionEnableFindMy;
  v77 = &__kCFBooleanTrue;
  v12 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
  cmOptions = self->_cmOptions;
  self->_cmOptions = v12;

  v14 = (CBCentralManager *)[objc_alloc((Class)CBCentralManager) initWithDelegate:self queue:0 options:self->_cmOptions];
  centralManager = self->_centralManager;
  self->_centralManager = v14;

  v16 = (NSMutableArray *)objc_opt_new();
  peripherals = self->_peripherals;
  self->_peripherals = v16;

  uint64_t v18 = objc_opt_new();
  v19 = (void *)g_findMySerialNumbers;
  g_findMySerialNumbers = v18;

  uint64_t v20 = objc_opt_new();
  v21 = (void *)g_loggingFilenames;
  g_loggingFilenames = v20;

  dispatch_group_enter((dispatch_group_t)g_waitingBranchesGroup);
  dispatch_group_enter((dispatch_group_t)g_waitingPeripheralsGroup);
  block[5] = sessionEventCallback;
  v23 = getprogname();
  id v24 = +[NSString stringWithFormat:@"%s-%u", v23, getpid()];
  [v24 UTF8String];
  uint64_t v25 = BTSessionAttachWithQueue();

  if (v25)
  {
    NSLog(@"attachmentsForParameters: Failed to attach to bluetoothd with error 0x%08x", v25);
    dispatch_group_leave((dispatch_group_t)g_waitingBranchesGroup);
    id v26 = (id)g_loggingFilenames;
    v27 = v59;
    goto LABEL_33;
  }
  dispatch_group_enter((dispatch_group_t)g_waitingBranchesGroup);
  v28 = g_waitingPeripheralsGroup;
  dispatch_time_t v29 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v28, v29)) {
    NSLog(@"attachmentsForParameters: Timed out waiting for CBCentralManager didUpdateState callback");
  }
  v30 = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005368;
  block[3] = &unk_100008300;
  block[4] = self;
  dispatch_async(v30, block);
  NSLog(@"attachmentsForParameters: Awaiting logging response ... ");
  v31 = g_waitingBranchesGroup;
  dispatch_time_t v32 = dispatch_time(0, 435000000000);
  if (dispatch_group_wait(v31, v32))
  {
    NSLog(@"attachmentsForParameters: Log Collection Timed Out");
    if (g_result) {
      NSLog(@"attachmentsForParameters: Wx Log Retrieval Timed Out");
    }
  }
  else
  {
    NSLog(@"attachmentsForParameters: Log Collection Completed");
  }
  BTAccessoryManagerDeregisterCustomMessageClient();
  BTSessionDetachWithQueue();
  if (g_result) {
    NSLog(@"attachmentsForParameters: Failed to register callback with error 0x%08x", g_result);
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v33 = self->_peripherals;
  id v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v68 objects:v75 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v69;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v69 != v36) {
          objc_enumerationMutation(v33);
        }
        [(CBCentralManager *)self->_centralManager cancelPeripheralConnection:*(void *)(*((void *)&v68 + 1) + 8 * i)];
      }
      id v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v68 objects:v75 count:16];
    }
    while (v35);
  }

  [(BluetoothHeadsetExtension *)self cancelXPCConnection];
  id v26 = (id)objc_opt_new();
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v38 = (id)g_loggingFilenames;
  id v39 = [v38 countByEnumeratingWithState:&v64 objects:v74 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = 0;
    uint64_t v42 = *(void *)v65;
    do
    {
      for (j = 0; j != v40; j = (char *)j + 1)
      {
        if (*(void *)v65 != v42) {
          objc_enumerationMutation(v38);
        }
        uint64_t v44 = *(void *)(*((void *)&v64 + 1) + 8 * (void)j);
        v45 = +[NSFileManager defaultManager];
        unsigned int v46 = [v45 fileExistsAtPath:v44];

        if (v46)
        {
          v47 = +[DEAttachmentItem attachmentWithPath:v44];
          uint64_t v48 = [v26 arrayByAddingObject:v47];

          uint64_t v41 = (v41 + 1);
          NSLog(@"attachmentsForParameters: attaching %@", v44);
          id v26 = (id)v48;
        }
      }
      id v40 = [v38 countByEnumeratingWithState:&v64 objects:v74 count:16];
    }
    while (v40);
  }
  else
  {
    uint64_t v41 = 0;
  }

  uint64_t v49 = productId;
  if ((productId - 8194) > 0xE || ((1 << (productId - 2)) & 0x409B) == 0)
  {
    v27 = v59;
    if (!productId) {
      goto LABEL_32;
    }
    v51 = CLGetAccessoryMotionSensorLogs();
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v52 = [v51 countByEnumeratingWithState:&v60 objects:v73 count:16];
    if (v52)
    {
      id v53 = v52;
      uint64_t v54 = *(void *)v61;
      do
      {
        v55 = 0;
        v56 = v26;
        do
        {
          if (*(void *)v61 != v54) {
            objc_enumerationMutation(v51);
          }
          uint64_t v57 = *(void *)(*((void *)&v60 + 1) + 8 * (void)v55);
          NSLog(@"attachmentsForParameters: added motion sensor log %@", v57);
          v58 = +[DEAttachmentItem attachmentWithPath:v57];
          id v26 = [v56 arrayByAddingObject:v58];

          v55 = (char *)v55 + 1;
          v56 = v26;
        }
        while (v53 != v55);
        id v53 = [v51 countByEnumeratingWithState:&v60 objects:v73 count:16];
      }
      while (v53);
    }

    uint64_t v49 = productId;
  }
  v27 = v59;
LABEL_32:
  NSLog(@"attachmentsForParameters: pId %u, passed %lu filename(s), attached %d", v49, [(id)g_loggingFilenames count], v41);
LABEL_33:

  return v26;
}

- (id)getFilesAtPathSortedByModificationDate:(id)a3 numberOfFirstNFiles:(int)a4
{
  v5 = [a3 sortedArrayUsingComparator:&stru_100008340];
  dispatch_group_t v6 = objc_msgSend(v5, "subarrayWithRange:", 0, a4);

  return v6;
}

- (void)cancelXPCConnection
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    xpc_connection_cancel(xpcConnection);
    NSLog(@"cancelXPCConnection: %p", self->_xpcConnection);
    v4 = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
}

- (void)handleXPCEvent:(id)a3
{
  id v5 = a3;
  xpc_type_t type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    [(BluetoothHeadsetExtension *)self handleXPCMsg:v5];
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    [(BluetoothHeadsetExtension *)self handleXPCError:v5];
  }
  else
  {
    NSLog(@"handleXPCEvent: Unexpected XPC event: %@", v5);
  }
}

- (void)handleXPCMsg:(id)a3
{
  xpc_object_t xdict = a3;
  string = xpc_dictionary_get_string(xdict, "kMsgId");
  id v5 = xpc_dictionary_get_value(xdict, "kMsgArgs");
  dispatch_group_t v6 = [(BluetoothHeadsetExtension *)self xpcConnection];
  NSLog(@"handleXPCMsg: Received XPC message from %p: %s", v6, string);

  if (self->_leUarpBranchDone)
  {
    NSLog(@"handleXPCMsg: Received XPC message when already done");
  }
  else
  {
    if (!strcmp(string, "LoggingManagerBusy"))
    {
      NSLog(@"handleXPCMsg: BTLEServer LoggingManager busy, returning no files", v12);
    }
    else if (!strcmp(string, "InvalidUUIDs"))
    {
      NSLog(@"handleXPCMsg: BTLEServer LoggingManager does not have any valid UUIDs, returning no files", v12);
    }
    else if (!strcmp(string, "RetrievedLogs"))
    {
      if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_array)
      {
        if (xpc_array_get_count(v5))
        {
          size_t v7 = 0;
          do
          {
            dispatch_group_t v8 = xpc_array_get_string(v5, v7);
            if (v8)
            {
              v9 = v8;
              NSLog(@"handleXPCMsg: Received %s", v8);
              dispatch_semaphore_t v10 = (void *)g_loggingFilenames;
              v11 = +[NSString stringWithUTF8String:v9];
              [v10 addObject:v11];
            }
            else
            {
              NSLog(@"handleXPCMsg: Unexpected XPC object at index %d", v7);
            }
            ++v7;
          }
          while (xpc_array_get_count(v5) > v7);
        }
      }
      else
      {
        NSLog(@"handleXPCMsg: Invalid msgArgs", v12);
      }
    }
    else
    {
      NSLog(@"handleXPCMsg: Unexpected XPC message: %s", string);
    }
    self->_leUarpBranchDone = 1;
    dispatch_group_leave((dispatch_group_t)g_waitingBranchesGroup);
  }
}

- (void)handleXPCError:(id)a3
{
  NSLog(@"handleXPCError: %@", a2, a3);
  if (a3 == &_xpc_error_connection_interrupted || a3 == &_xpc_error_connection_invalid)
  {
    if (self->_xpcConnection)
    {
      [(BluetoothHeadsetExtension *)self cancelXPCConnection];
      if (!self->_leUarpBranchDone)
      {
        self->_leUarpBranchDone = 1;
        dispatch_group_t v6 = g_waitingBranchesGroup;
        dispatch_group_leave(v6);
      }
    }
  }
  else
  {
    NSLog(@"handleXPCError: Unhandled XPC error");
  }
}

- (void)sendXPCMsg:(id)a3 args:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  id v11 = v6;
  xpc_dictionary_set_string(v8, "kMsgId", (const char *)[v11 UTF8String]);
  if (v7) {
    xpc_dictionary_set_value(v8, "kMsgArgs", v7);
  }
  v9 = [(BluetoothHeadsetExtension *)self xpcConnection];
  NSLog(@"sendXPCMsg: Sending XPC message to %p: %@", v9, v11);

  dispatch_semaphore_t v10 = [(BluetoothHeadsetExtension *)self xpcConnection];
  xpc_connection_send_message(v10, v8);
}

- (void)leLogRequest
{
  NSLog(@"leLogRequest: Invoked", a2);
  xpc_object_t empty = xpc_array_create_empty();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = self->_peripherals;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      xpc_object_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v8) identifier];
        dispatch_semaphore_t v10 = [v9 UUIDString];

        NSLog(@"leLogRequest: Asking for UUID %@", v10);
        id v11 = v10;
        xpc_object_t v12 = xpc_string_create((const char *)[v11 UTF8String]);
        xpc_array_append_value(empty, v12);

        xpc_object_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  [(BluetoothHeadsetExtension *)self sendXPCMsg:@"RetrieveLogs" args:empty];
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  objc_msgSend(a4, "identifier", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [v5 UUIDString];
  NSLog(@"centralManager:didConnectPeripheral: UUID %@", v4);
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v6 = a5;
  id v8 = [a4 identifier];
  uint64_t v7 = [v8 UUIDString];
  NSLog(@"centralManager:didFailToConnectPeripheral: UUID %@ error %@", v7, v6);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  if ([v4 state] == (id)5 && !self->_didPeripheralConnection)
  {
    self->_didPeripheralConnection = 1;
    NSLog(@"centralManagerDidUpdateState: Now on, awaiting signal");
    id v5 = g_waitingForSerialsSema;
    dispatch_time_t v6 = dispatch_time(0, 180000000000);
    if (dispatch_semaphore_wait(v5, v6))
    {
      NSLog(@"centralManagerDidUpdateState: Never got serial numbers");
    }
    else
    {
      NSLog(@"centralManagerDidUpdateState: Requesting UUIDs for serials: %@", g_findMySerialNumbers);
      if ([(id)g_findMySerialNumbers count])
      {
        uint64_t v7 = g_findMySerialNumbers;
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_100005D90;
        v8[3] = &unk_100008368;
        v8[4] = self;
        id v9 = v4;
        [v9 retrievePeripheralsWithFindMySerialNumberStrings:v7 completion:v8];
      }
    }
  }
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSDictionary)cmOptions
{
  return self->_cmOptions;
}

- (void)setCmOptions:(id)a3
{
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (NSMutableArray)peripherals
{
  return self->_peripherals;
}

- (void)setPeripherals:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)leUarpBranchDone
{
  return self->_leUarpBranchDone;
}

- (void)setLeUarpBranchDone:(BOOL)a3
{
  self->_leUarpBranchDone = a3;
}

- (BOOL)didPeripheralConnection
{
  return self->_didPeripheralConnection;
}

- (void)setDidPeripheralConnection:(BOOL)a3
{
  self->_didPeripheralConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_peripherals, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_cmOptions, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end