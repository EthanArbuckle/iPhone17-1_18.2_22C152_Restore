@interface NMSMessageCenter
+ (BOOL)messageWindowCountEnabled;
+ (void)setMessageWindowCountEnabled:(BOOL)a3;
- (BOOL)cancelMessageWithID:(id)a3 error:(id *)a4;
- (BOOL)delegateRequiresACKs;
- (BOOL)enableTransmissionWindow;
- (IDSService)idsService;
- (IDSService)service;
- (NMSMessageCenter)init;
- (NMSMessageCenter)initWithIDSServiceIdentifier:(id)a3;
- (NMSMessageCenter)initWithIDSServiceIdentifier:(id)a3 launchOnDemandNotification:(id)a4 cacheFolderPath:(id)a5;
- (NMSMessageCenterDelegate)delegate;
- (NSString)description;
- (OS_dispatch_queue)actionQ;
- (OS_dispatch_queue)queue;
- (OS_os_activity)transportActivity;
- (double)windowResponseTimeout;
- (id)_buildDataForRequest:(id)a3 options:(id *)a4;
- (id)_buildDataForResponse:(id)a3 options:(id *)a4;
- (id)_decodeIncomingRequestData:(id)a3 context:(id)a4;
- (id)_pbMappingForMessageID:(unsigned __int16)a3;
- (id)deviceIDFromDevice:(id)a3;
- (id)errorHandlers;
- (id)requestHandlers;
- (id)responseHandlers;
- (unint64_t)_currentBytesInFlight;
- (unint64_t)maxBytesInFlight;
- (unint64_t)maxMessagesInFlight;
- (unint64_t)minMessagesInFlight;
- (void)_checkForSwitch;
- (void)_expireMessages;
- (void)_handleError:(id)a3 context:(id)a4;
- (void)_handleError:(id)a3 context:(id)a4 locked:(BOOL)a5;
- (void)_obliterate;
- (void)_sendResponse:(id)a3;
- (void)_setNextWindowTimeoutFireDate;
- (void)_timeoutWindowedMessages;
- (void)_updateExpireTimerWithDate:(id)a3;
- (void)addErrorHandlerForMessageID:(unsigned __int16)a3 usingBlock:(id)a4;
- (void)addRequestHandlerForMessageID:(unsigned __int16)a3 usingBlock:(id)a4;
- (void)addResponseHandler:(unsigned __int16)a3 usingBlock:(id)a4;
- (void)dealloc;
- (void)dropExtantMessages;
- (void)mapPBRequest:(Class)a3 toResponse:(Class)a4 messageID:(unsigned __int16)a5;
- (void)resume;
- (void)resumeIncomingMessages;
- (void)sendFile:(id)a3;
- (void)sendRequest:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setDelegateRequiresACKs:(BOOL)a3;
- (void)setEnableTransmissionWindow:(BOOL)a3;
- (void)setMaxBytesInFlight:(unint64_t)a3;
- (void)setMaxMessagesInFlight:(unint64_t)a3;
- (void)setMinMessagesInFlight:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setService:(id)a3;
- (void)setTransportActivity:(id)a3;
- (void)setWindowResponseTimeout:(double)a3;
- (void)suspendIncomingMessages;
@end

@implementation NMSMessageCenter

+ (BOOL)messageWindowCountEnabled
{
  return NMSMessageCountWindowEnabled;
}

+ (void)setMessageWindowCountEnabled:(BOOL)a3
{
  NMSMessageCountWindowEnabled = a3;
}

- (NMSMessageCenter)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"-[%@ init] is not supported.", v6 format];

  return 0;
}

- (NMSMessageCenter)initWithIDSServiceIdentifier:(id)a3 launchOnDemandNotification:(id)a4 cacheFolderPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v62.receiver = self;
  v62.super_class = (Class)NMSMessageCenter;
  v11 = [(NMSMessageCenter *)&v62 init];
  if (v11)
  {
    id v61 = v8;
    uint64_t v12 = [v8 copy];
    serviceIdentifier = v11->_serviceIdentifier;
    v11->_serviceIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    launchNotification = v11->_launchNotification;
    v11->_launchNotification = (NSString *)v14;

    v16 = v11;
    id v17 = v10;
    id v18 = [NSString stringWithFormat:@"NMSQ.%@", v11->_serviceIdentifier];
    v19 = (const char *)[v18 UTF8String];
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create(v19, v20);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v21;

    v16->_resumed = 0;
    uint64_t v23 = objc_opt_new();
    requestHandlers = v16->_requestHandlers;
    v16->_requestHandlers = (NSMutableDictionary *)v23;

    uint64_t v25 = objc_opt_new();
    errorHandlers = v16->_errorHandlers;
    v16->_errorHandlers = (NSMutableDictionary *)v25;

    uint64_t v27 = objc_opt_new();
    responseHandlers = v16->_responseHandlers;
    v16->_responseHandlers = (NSMutableDictionary *)v27;

    uint64_t v29 = objc_opt_new();
    pbMapping = v16->_pbMapping;
    v16->_pbMapping = (NSMutableDictionary *)v29;

    os_activity_t v31 = _os_activity_create(&dword_21C7C9000, "Nano Messaging Service", MEMORY[0x263EF8428], OS_ACTIVITY_FLAG_DEFAULT);
    transportActivity = v16->_transportActivity;
    v16->_transportActivity = (OS_os_activity *)v31;

    v33 = [_SYMultiSuspendableQueue alloc];
    v34 = [NSString stringWithFormat:@"NMSQ.%@.Incoming", v11->_serviceIdentifier];
    uint64_t v35 = [(_SYMultiSuspendableQueue *)v33 initWithName:v34 qosClass:0 serial:1 target:v16->_queue];
    idsIncomingQueue = v16->_idsIncomingQueue;
    v16->_idsIncomingQueue = (_SYMultiSuspendableQueue *)v35;

    if (v17)
    {
      v37 = [NSString stringWithFormat:@"nms.%@.db", v11->_serviceIdentifier];
      v38 = [v17 stringByAppendingPathComponent:v37];

      v39 = [[NMSPersistentDictionary alloc] initWithPath:v38 objectClass:objc_opt_class() loggingFacility:0];
    }
    else
    {
      v39 = [[NMSPersistentDictionary alloc] initWithSharedDBForService:v11->_serviceIdentifier objectClass:objc_opt_class()];
      v38 = 0;
    }
    persistentContextStore = v16->_persistentContextStore;
    v16->_persistentContextStore = v39;

    objc_initWeak(location, v16);
    dispatch_source_t v41 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v16->_queue);
    expireTimer = v16->_expireTimer;
    v16->_expireTimer = (OS_dispatch_source *)v41;

    v43 = v16->_expireTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = ___SharedInit_block_invoke;
    handler[3] = &unk_264422C90;
    objc_copyWeak(&v69, location);
    dispatch_source_set_event_handler(v43, handler);
    if (v38)
    {
      v44 = [NMSWindowData alloc];
      v45 = [v38 stringByDeletingLastPathComponent];
      v46 = [NSString stringWithFormat:@"%@-window", v11->_serviceIdentifier];
      v47 = [v45 stringByAppendingPathComponent:v46];
      uint64_t v48 = [(NMSWindowData *)v44 initWithPath:v47 logFacility:0];
      windowData = v16->_windowData;
      v16->_windowData = (NMSWindowData *)v48;
    }
    else
    {
      v50 = [[NMSWindowData alloc] initWithSharedDBForServiceName:v11->_serviceIdentifier];
      v45 = v16->_windowData;
      v16->_windowData = v50;
    }

    v51 = [[_NMSDispatchQueue alloc] initWithName:@"com.apple.private.NanoMessagingService.WindowQueue" attributes:0 target:v16->_queue];
    windowQueue = v16->_windowQueue;
    v16->_windowQueue = v51;

    v53 = v16->_windowData;
    if (v53)
    {
      v16->_unint64_t currentBytesInFlight = [(NMSWindowData *)v53 lengthOfAllMessagesInFlight];
      dispatch_source_t v54 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v16->_queue);
      windowTimeout = v16->_windowTimeout;
      v16->_windowTimeout = (OS_dispatch_source *)v54;

      v56 = v16->_windowTimeout;
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v64 = 3221225472;
      v65 = ___SharedInit_block_invoke_2;
      v66 = &unk_264422C90;
      objc_copyWeak(&v67, location);
      dispatch_source_set_event_handler(v56, buf);
      [(NMSMessageCenter *)v16 setEnableTransmissionWindow:1];
      [(NMSMessageCenter *)v16 setMaxMessagesInFlight:20];
      [(NMSMessageCenter *)v16 setMinMessagesInFlight:10];
      [(NMSMessageCenter *)v16 setMaxBytesInFlight:5000000];
      [(NMSMessageCenter *)v16 setWindowResponseTimeout:600.0];
      unint64_t currentBytesInFlight = v16->_currentBytesInFlight;
      if (currentBytesInFlight >= [(NMSMessageCenter *)v16 maxBytesInFlight]) {
        [(_NMSDispatchQueue *)v16->_windowQueue suspend];
      }
      [(NMSMessageCenter *)v16 _timeoutWindowedMessages];
      objc_destroyWeak(&v67);
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      v58 = qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C7C9000, v58, OS_LOG_TYPE_DEFAULT, "Failed to create NMSWindowData object, so transmission window is forcibly disabled.", buf, 2u);
      }
      [(NMSMessageCenter *)v16 setEnableTransmissionWindow:0];
    }
    objc_destroyWeak(&v69);
    objc_destroyWeak(location);

    v59 = v16;
    id v8 = v61;
  }

  return v11;
}

- (NMSMessageCenter)initWithIDSServiceIdentifier:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)NMSMessageCenter;
  v5 = [(NMSMessageCenter *)&v45 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = (NSString *)v6;

    id v8 = v5;
    id v9 = [NSString stringWithFormat:@"NMSQ.%@", v5->_serviceIdentifier];
    id v10 = (const char *)[v9 UTF8String];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;

    v8->_resumed = 0;
    uint64_t v14 = objc_opt_new();
    requestHandlers = v8->_requestHandlers;
    v8->_requestHandlers = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_opt_new();
    errorHandlers = v8->_errorHandlers;
    v8->_errorHandlers = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    responseHandlers = v8->_responseHandlers;
    v8->_responseHandlers = (NSMutableDictionary *)v18;

    uint64_t v20 = objc_opt_new();
    pbMapping = v8->_pbMapping;
    v8->_pbMapping = (NSMutableDictionary *)v20;

    os_activity_t v22 = _os_activity_create(&dword_21C7C9000, "Nano Messaging Service", MEMORY[0x263EF8428], OS_ACTIVITY_FLAG_DEFAULT);
    transportActivity = v8->_transportActivity;
    v8->_transportActivity = (OS_os_activity *)v22;

    v24 = [_SYMultiSuspendableQueue alloc];
    uint64_t v25 = [NSString stringWithFormat:@"NMSQ.%@.Incoming", v5->_serviceIdentifier];
    uint64_t v26 = [(_SYMultiSuspendableQueue *)v24 initWithName:v25 qosClass:0 serial:1 target:v8->_queue];
    idsIncomingQueue = v8->_idsIncomingQueue;
    v8->_idsIncomingQueue = (_SYMultiSuspendableQueue *)v26;

    v28 = [[NMSPersistentDictionary alloc] initWithSharedDBForService:v5->_serviceIdentifier objectClass:objc_opt_class()];
    persistentContextStore = v8->_persistentContextStore;
    v8->_persistentContextStore = v28;

    objc_initWeak(&location, v8);
    dispatch_source_t v30 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v8->_queue);
    expireTimer = v8->_expireTimer;
    v8->_expireTimer = (OS_dispatch_source *)v30;

    v32 = v8->_expireTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = ___SharedInit_block_invoke;
    handler[3] = &unk_264422C90;
    objc_copyWeak(&v52, &location);
    dispatch_source_set_event_handler(v32, handler);
    v33 = [[NMSWindowData alloc] initWithSharedDBForServiceName:v5->_serviceIdentifier];
    windowData = v8->_windowData;
    v8->_windowData = v33;

    uint64_t v35 = [[_NMSDispatchQueue alloc] initWithName:@"com.apple.private.NanoMessagingService.WindowQueue" attributes:0 target:v8->_queue];
    windowQueue = v8->_windowQueue;
    v8->_windowQueue = v35;

    v37 = v8->_windowData;
    if (v37)
    {
      v8->_unint64_t currentBytesInFlight = [(NMSWindowData *)v37 lengthOfAllMessagesInFlight];
      dispatch_source_t v38 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v8->_queue);
      windowTimeout = v8->_windowTimeout;
      v8->_windowTimeout = (OS_dispatch_source *)v38;

      v40 = v8->_windowTimeout;
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v47 = 3221225472;
      uint64_t v48 = ___SharedInit_block_invoke_2;
      v49 = &unk_264422C90;
      objc_copyWeak(v50, &location);
      dispatch_source_set_event_handler(v40, buf);
      [(NMSMessageCenter *)v8 setEnableTransmissionWindow:1];
      [(NMSMessageCenter *)v8 setMaxMessagesInFlight:20];
      [(NMSMessageCenter *)v8 setMinMessagesInFlight:10];
      [(NMSMessageCenter *)v8 setMaxBytesInFlight:5000000];
      [(NMSMessageCenter *)v8 setWindowResponseTimeout:600.0];
      unint64_t currentBytesInFlight = v8->_currentBytesInFlight;
      if (currentBytesInFlight >= [(NMSMessageCenter *)v8 maxBytesInFlight]) {
        [(_NMSDispatchQueue *)v8->_windowQueue suspend];
      }
      [(NMSMessageCenter *)v8 _timeoutWindowedMessages];
      objc_destroyWeak(v50);
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      v42 = qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C7C9000, v42, OS_LOG_TYPE_DEFAULT, "Failed to create NMSWindowData object, so transmission window is forcibly disabled.", buf, 2u);
      }
      [(NMSMessageCenter *)v8 setEnableTransmissionWindow:0];
    }
    objc_destroyWeak(&v52);
    objc_destroyWeak(&location);

    v43 = v8;
  }

  return v5;
}

- (void)dealloc
{
  expireTimer = self->_expireTimer;
  if (expireTimer)
  {
    dispatch_source_cancel(expireTimer);
    if (!self->_service) {
      dispatch_resume((dispatch_object_t)self->_expireTimer);
    }
  }
  windowTimeout = self->_windowTimeout;
  if (windowTimeout) {
    dispatch_source_cancel(windowTimeout);
  }
  loggingFacility = self->_loggingFacility;
  if (loggingFacility) {
    CFRelease(loggingFacility);
  }
  if (self->_resumed) {
    [(IDSService *)self->_service removeDelegate:self];
  }
  v6.receiver = self;
  v6.super_class = (Class)NMSMessageCenter;
  [(NMSMessageCenter *)&v6 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v6 = [v3 stringWithFormat:@"<%@:%p identifier:%@>", v5, self, self->_serviceIdentifier];

  return (NSString *)v6;
}

- (void)_setNextWindowTimeoutFireDate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [(NMSWindowData *)self->_windowData dateOfNextMessageExpiry];
  id v4 = v3;
  if (v3)
  {
    [v3 timeIntervalSinceNow];
    if (v5 > 0.0)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      objc_super v6 = (void *)qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_INFO))
      {
        v7 = v6;
        [v4 timeIntervalSinceNow];
        int v11 = 138543618;
        dispatch_queue_t v12 = v4;
        __int16 v13 = 2048;
        uint64_t v14 = v8;
        _os_log_impl(&dword_21C7C9000, v7, OS_LOG_TYPE_INFO, "Setting next expiry timer fire date to '%{public}@' (%.02f seconds from now)", (uint8_t *)&v11, 0x16u);
      }
      [v4 timeIntervalSinceNow];
      dispatch_time_t v10 = dispatch_walltime(0, (uint64_t)(v9 * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)self->_windowTimeout, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    }
  }
}

- (void)setEnableTransmissionWindow:(BOOL)a3
{
  if (self->_enableTransmissionWindow != a3)
  {
    if (a3)
    {
      if (self->_windowData)
      {
        self->_enableTransmissionWindow = a3;
        [(NMSMessageCenter *)self _setNextWindowTimeoutFireDate];
        windowTimeout = self->_windowTimeout;
        dispatch_resume(windowTimeout);
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        objc_super v6 = qword_26AB04790;
        if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v7 = 0;
          _os_log_impl(&dword_21C7C9000, v6, OS_LOG_TYPE_DEFAULT, "Not enabling the transmission window, because we were unable to create the window metadata DB.", v7, 2u);
        }
      }
    }
    else
    {
      self->_enableTransmissionWindow = 0;
      double v5 = self->_windowTimeout;
      dispatch_suspend(v5);
    }
  }
}

- (void)_timeoutWindowedMessages
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t currentBytesInFlight = self->_currentBytesInFlight;
  BOOL v4 = currentBytesInFlight >= [(NMSMessageCenter *)self maxBytesInFlight]
    || [(_NMSDispatchQueue *)self->_windowQueue isSuspended];
  double v5 = [(NMSWindowData *)self->_windowData expiredMessageIDs];
  [(NMSWindowData *)self->_windowData removeAndReturnLengthOfMessagesWithIDs:v5];
  self->_unint64_t currentBytesInFlight = 0;
  if (v4 && [(NMSMessageCenter *)self maxBytesInFlight])
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    objc_super v6 = (void *)qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = self->_currentBytesInFlight;
      uint64_t v8 = v6;
      int v9 = 134218240;
      unint64_t v10 = v7;
      __int16 v11 = 2048;
      unint64_t v12 = [(NMSMessageCenter *)self maxBytesInFlight];
      _os_log_impl(&dword_21C7C9000, v8, OS_LOG_TYPE_DEFAULT, "Opening window on message timeout: %lu bytes in flight, %lu max", (uint8_t *)&v9, 0x16u);
    }
    [(_NMSDispatchQueue *)self->_windowQueue resume];
  }
  [(NMSMessageCenter *)self _setNextWindowTimeoutFireDate];
}

- (id)requestHandlers
{
  return self->_requestHandlers;
}

- (id)errorHandlers
{
  return self->_errorHandlers;
}

- (id)responseHandlers
{
  return self->_responseHandlers;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v19 = a4;
  char v7 = !self->_resumed;
  id v8 = a3;
  int v9 = NSStringFromSelector(a2);
  _AssertState(v7, a2, @"Cannot use %@ after using -resume", v10, v11, v12, v13, v14, (uint64_t)v9);

  [(NMSMessageCenter *)self setDelegate:v8];
  if (v19)
  {
    uint64_t v15 = (OS_dispatch_queue *)v19;
    delegateQueue = self->_delegateQueue;
    self->_delegateQueue = v15;
  }
  else
  {
    delegateQueue = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v17 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.companionsync.nano-messaging-center.default-delegate-queue", delegateQueue, 0);
    uint64_t v18 = self->_delegateQueue;
    self->_delegateQueue = v17;
  }
}

- (void)addRequestHandlerForMessageID:(unsigned __int16)a3 usingBlock:(id)a4
{
  uint64_t v4 = a3;
  char v7 = !self->_resumed;
  id v8 = a4;
  int v9 = NSStringFromSelector(a2);
  _AssertState(v7, a2, @"Cannot use %@ after using -resume", v10, v11, v12, v13, v14, (uint64_t)v9);

  id v17 = (id)[v8 copy];
  requestHandlers = self->_requestHandlers;
  uint64_t v16 = [NSNumber numberWithUnsignedShort:v4];
  [(NSMutableDictionary *)requestHandlers setObject:v17 forKeyedSubscript:v16];
}

- (void)addErrorHandlerForMessageID:(unsigned __int16)a3 usingBlock:(id)a4
{
  uint64_t v4 = a3;
  char v7 = !self->_resumed;
  id v8 = a4;
  int v9 = NSStringFromSelector(a2);
  _AssertState(v7, a2, @"Cannot use %@ after using -resume", v10, v11, v12, v13, v14, (uint64_t)v9);

  id v17 = (id)[v8 copy];
  errorHandlers = self->_errorHandlers;
  uint64_t v16 = [NSNumber numberWithUnsignedShort:v4];
  [(NSMutableDictionary *)errorHandlers setObject:v17 forKeyedSubscript:v16];
}

- (void)addResponseHandler:(unsigned __int16)a3 usingBlock:(id)a4
{
  uint64_t v4 = a3;
  char v7 = !self->_resumed;
  id v8 = a4;
  int v9 = NSStringFromSelector(a2);
  _AssertState(v7, a2, @"Cannot use %@ after using -resume", v10, v11, v12, v13, v14, (uint64_t)v9);

  id v17 = (id)[v8 copy];
  responseHandlers = self->_responseHandlers;
  uint64_t v16 = [NSNumber numberWithUnsignedShort:v4];
  [(NSMutableDictionary *)responseHandlers setObject:v17 forKeyedSubscript:v16];
}

- (void)mapPBRequest:(Class)a3 toResponse:(Class)a4 messageID:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  char v10 = !self->_resumed;
  uint64_t v11 = NSStringFromSelector(a2);
  _AssertState(v10, a2, @"Cannot use %@ after using -resume", v12, v13, v14, v15, v16, (uint64_t)v11);

  id v19 = (id)objc_opt_new();
  [v19 setRequestClass:a3];
  [v19 setResponseClass:a4];
  pbMapping = self->_pbMapping;
  uint64_t v18 = [NSNumber numberWithUnsignedShort:v5];
  [(NSMutableDictionary *)pbMapping setObject:v19 forKeyedSubscript:v18];
}

- (id)_pbMappingForMessageID:(unsigned __int16)a3
{
  pbMapping = self->_pbMapping;
  uint64_t v4 = [NSNumber numberWithUnsignedShort:a3];
  uint64_t v5 = [(NSMutableDictionary *)pbMapping objectForKeyedSubscript:v4];

  return v5;
}

- (unint64_t)_currentBytesInFlight
{
  return self->_currentBytesInFlight;
}

- (void)_checkForSwitch
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  self->_checkedForQWS = 1;
  v3 = +[SYDevice targetableDevice];
  uint64_t v4 = [v3 lastActiveDate];

  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    [(NMSPersistentDictionary *)self->_persistentContextStore lock];
    persistentContextStore = self->_persistentContextStore;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __35__NMSMessageCenter__checkForSwitch__block_invoke;
    v24[3] = &unk_264423F38;
    id v25 = v4;
    id v7 = v5;
    id v26 = v7;
    [(NMSPersistentDictionary *)persistentContextStore enumerateObjectsSortedByEnqueueDate:v24];
    [(NMSPersistentDictionary *)self->_persistentContextStore unlock];
    if ([v7 count])
    {
      uint64_t v18 = v4;
      id v8 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"NMSErrorDomain" code:7 userInfo:0];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v17 = v7;
      id obj = v7;
      uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v29 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v21;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v21 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
            if (_sync_log_facilities_pred != -1) {
              _os_once();
            }
            uint64_t v14 = (void *)qword_26AB04790;
            if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v15 = v14;
              uint64_t v16 = [v13 description];
              *(_DWORD *)buf = 138412290;
              v28 = v16;
              _os_log_impl(&dword_21C7C9000, v15, OS_LOG_TYPE_DEFAULT, "Message dropped by QWS: %@", buf, 0xCu);
            }
            -[NMSMessageCenter _handleError:context:](self, "_handleError:context:", v8, v13, v17);
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v29 count:16];
        }
        while (v10);
      }

      id v7 = v17;
      uint64_t v4 = v18;
    }
  }
}

void __35__NMSMessageCenter__checkForSwitch__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, unsigned char *a6)
{
  id v11 = a3;
  uint64_t v9 = [a4 laterDate:*(void *)(a1 + 32)];
  uint64_t v10 = *(void **)(a1 + 32);

  if (v9 == v10) {
    [*(id *)(a1 + 40) addObject:v11];
  }
  else {
    *a6 = 1;
  }
}

- (void)_expireMessages
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_checkedForQWS) {
    [(NMSMessageCenter *)self _checkForSwitch];
  }
  v3 = [MEMORY[0x263F087E8] errorWithDomain:@"NMSErrorDomain" code:2 userInfo:0];
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = (void *)MEMORY[0x21D4B1560]([(NMSPersistentDictionary *)self->_persistentContextStore lock]);
  persistentContextStore = self->_persistentContextStore;
  id v16 = 0;
  id v7 = [(NMSPersistentDictionary *)persistentContextStore objectWithOldestExpirationDate:&v16];
  id v8 = v16;
  if (v7)
  {
    *(void *)&long long v9 = 138412290;
    long long v15 = v9;
    while (1)
    {
      uint64_t v10 = objc_msgSend(v8, "laterDate:", v4, v15);

      if (v10 != v4) {
        break;
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v11 = (void *)qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = v11;
        uint64_t v13 = [v7 description];
        *(_DWORD *)buf = v15;
        uint64_t v18 = v13;
        _os_log_impl(&dword_21C7C9000, v12, OS_LOG_TYPE_DEFAULT, "Expired message: %@", buf, 0xCu);
      }
      [(NMSMessageCenter *)self _handleError:v3 context:v7 locked:1];

      uint64_t v5 = (void *)MEMORY[0x21D4B1560]();
      uint64_t v14 = self->_persistentContextStore;
      id v16 = 0;
      id v7 = [(NMSPersistentDictionary *)v14 objectWithOldestExpirationDate:&v16];
      id v8 = v16;
      if (!v7) {
        goto LABEL_13;
      }
    }
    [(NMSMessageCenter *)self _updateExpireTimerWithDate:v8];
  }
LABEL_13:

  [(NMSPersistentDictionary *)self->_persistentContextStore unlock];
}

- (void)_updateExpireTimerWithDate:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (!self->_nextExpireTimerFireDate
    || (objc_msgSend(v4, "earlierDate:"),
        id v5 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        id v4 = v9,
        v5 == v9))
  {
    expireTimer = self->_expireTimer;
    [v4 timeIntervalSinceNow];
    if (v7 >= 0.0) {
      dispatch_time_t v8 = dispatch_walltime(0, (uint64_t)(v7 * 1000000000.0));
    }
    else {
      dispatch_time_t v8 = dispatch_time(0, 0);
    }
    dispatch_source_set_timer(expireTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    id v4 = v9;
  }
}

- (void)resume
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_21C7C9000, a2, OS_LOG_TYPE_FAULT, "-[IDSService initWithService:%{public}@] returned nil!", (uint8_t *)&v3, 0xCu);
}

- (IDSService)idsService
{
  return self->_service;
}

- (OS_dispatch_queue)actionQ
{
  return self->_queue;
}

- (void)dropExtantMessages
{
  [(NMSPersistentDictionary *)self->_persistentContextStore lock];
  [(NMSPersistentDictionary *)self->_persistentContextStore removeAllObjects];
  persistentContextStore = self->_persistentContextStore;
  [(NMSPersistentDictionary *)persistentContextStore unlock];
}

- (void)suspendIncomingMessages
{
}

- (void)resumeIncomingMessages
{
}

- (id)_buildDataForRequest:(id)a3 options:(id *)a4
{
  id v6 = a3;
  __int16 v24 = [v6 messageID];
  char v25 = [v6 priority];
  id v7 = objc_alloc(MEMORY[0x263EFF990]);
  dispatch_time_t v8 = [v6 data];
  id v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "length") + 3);

  [v9 appendBytes:&v24 length:3];
  uint64_t v10 = [v6 data];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    uint64_t v12 = [v6 data];
    [v9 appendData:v12];
  }
  if (a4)
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
    [v6 sendTimeout];
    if (v14 > 0.0)
    {
      long long v15 = NSNumber;
      [v6 sendTimeout];
      id v16 = objc_msgSend(v15, "numberWithDouble:");
      [v13 setObject:v16 forKeyedSubscript:*MEMORY[0x263F49F80]];

      [v13 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49ED8]];
    }
    if ([v6 shouldEncrypt]) {
      [v13 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49ED0]];
    }
    responseHandlers = self->_responseHandlers;
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v6, "messageID"));
    uint64_t v19 = [(NSMutableDictionary *)responseHandlers objectForKeyedSubscript:v18];

    if (v19) {
      [v13 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49EE8]];
    }
    long long v20 = [v6 extraIDSOptions];

    if (v20)
    {
      long long v21 = [v6 extraIDSOptions];
      [v13 addEntriesFromDictionary:v21];
    }
    if ([(NMSMessageCenter *)self enableTransmissionWindow]) {
      [v13 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49F90]];
    }
    id v22 = v13;
    *a4 = v22;
  }
  return v9;
}

- (id)_buildDataForResponse:(id)a3 options:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 request];
  __int16 v23 = [v7 messageID];
  id v8 = objc_alloc(MEMORY[0x263EFF990]);
  id v9 = [v6 data];
  uint64_t v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "length") + 2);

  [v10 appendBytes:&v23 length:2];
  uint64_t v11 = [v6 data];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    uint64_t v13 = [v6 data];
    [v10 appendData:v13];
  }
  if (a4)
  {
    double v14 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    [v6 sendTimeout];
    if (v15 > 0.0)
    {
      id v16 = NSNumber;
      [v6 sendTimeout];
      id v17 = objc_msgSend(v16, "numberWithDouble:");
      [v14 setObject:v17 forKeyedSubscript:*MEMORY[0x263F49F80]];
    }
    uint64_t v18 = [v7 idsIdentifier];
    [v14 setObject:v18 forKeyedSubscript:*MEMORY[0x263F49F40]];

    uint64_t v19 = [v6 extraIDSOptions];

    if (v19)
    {
      long long v20 = [v6 extraIDSOptions];
      [v14 addEntriesFromDictionary:v20];
    }
    if ([(NMSMessageCenter *)self enableTransmissionWindow]) {
      [v14 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49F90]];
    }
    id v21 = v14;
    *a4 = v21;
  }
  return v10;
}

- (id)_decodeIncomingRequestData:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = (unsigned __int16 *)[v8 bytes];
  uint64_t v10 = *v9;
  uint64_t v11 = *((unsigned __int8 *)v9 + 2);
  uint64_t v12 = objc_alloc_init(NMSIncomingRequest);
  [(NMSIncomingRequest *)v12 setMessageCenter:self];
  [(NMSIncomingRequest *)v12 setMessageID:v10];
  if ([v7 expectsPeerResponse])
  {
    uint64_t v13 = [v7 outgoingResponseIdentifier];
    if (!v13) {
      -[NMSMessageCenter _decodeIncomingRequestData:context:]();
    }
  }
  double v14 = [v7 outgoingResponseIdentifier];
  [(NMSIncomingRequest *)v12 setIdsIdentifier:v14];

  [(NMSIncomingRequest *)v12 setPriority:v11];
  -[NMSIncomingRequest setExpectsResponse:](v12, "setExpectsResponse:", [v7 expectsPeerResponse]);
  double v15 = objc_msgSend(v8, "subdataWithRange:", 3, objc_msgSend(v8, "length") - 3);
  [(NMSIncomingRequest *)v12 setData:v15];

  [(NMSIncomingRequest *)v12 setIdsContext:v7];
  return v12;
}

- (void)sendRequest:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char resumed = self->_resumed;
  id v7 = NSStringFromSelector(a2);
  _AssertState(resumed, a2, @"Cannot use %@ until after -resume is sent", v8, v9, v10, v11, v12, (uint64_t)v7);

  uint64_t v13 = self->_service;
  if (v13)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    double v14 = (void *)qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_INFO))
    {
      double v15 = v14;
      id v16 = [v5 pbRequest];
      id v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      BOOL v19 = [(_NMSDispatchQueue *)self->_windowQueue isSuspended];
      long long v20 = "not ";
      if (v19) {
        long long v20 = "";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v18;
      __int16 v28 = 2080;
      uint64_t v29 = v20;
      _os_log_impl(&dword_21C7C9000, v15, OS_LOG_TYPE_INFO, "Sending %{public}@, NMS window queue is %ssuspended", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    windowQueue = self->_windowQueue;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __32__NMSMessageCenter_sendRequest___block_invoke;
    v22[3] = &unk_264423368;
    objc_copyWeak(&v25, (id *)buf);
    id v23 = v5;
    __int16 v24 = v13;
    [(_NMSDispatchQueue *)windowQueue async:v22];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      -[NMSMessageCenter sendRequest:]();
    }
  }
}

void __32__NMSMessageCenter_sendRequest___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (shouldLogTraffic())
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      int v3 = (void *)qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void **)(a1 + 32);
        id v5 = v3;
        id v6 = [v4 CPObfuscatedDescriptionObject];
        id v7 = _SYObfuscate(v6);
        *(_DWORD *)buf = 138543362;
        *(void *)v53 = v7;
        _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "Sending request: %{public}@", buf, 0xCu);
      }
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v8 = (void *)qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEBUG)) {
      __32__NMSMessageCenter_sendRequest___block_invoke_cold_2(a1, v8);
    }
    uint64_t v9 = [*(id *)(a1 + 32) targetDeviceIDs];
    if (!v9)
    {
      uint64_t v9 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F4A148]];
    }
    uint64_t v10 = *(void *)(a1 + 32);
    id v51 = 0;
    uint64_t v11 = [WeakRetained _buildDataForRequest:v10 options:&v51];
    id v12 = v51;
    uint64_t v13 = (void *)*((void *)WeakRetained + 8);
    double v14 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 32), "messageID"));
    *((void *)&v44 + 1) = [v13 objectForKeyedSubscript:v14];

    double v15 = (void *)*((void *)WeakRetained + 7);
    id v16 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 32), "messageID"));
    *(void *)&long long v44 = [v15 objectForKeyedSubscript:v16];

    uint64_t v17 = [*(id *)(a1 + 32) priority];
    uint64_t v18 = 200;
    if (v17 == 1) {
      uint64_t v18 = 100;
    }
    if (v17 == 2) {
      uint64_t v19 = 300;
    }
    else {
      uint64_t v19 = v18;
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEBUG)) {
      __32__NMSMessageCenter_sendRequest___block_invoke_cold_1();
    }
    long long v20 = *(void **)(a1 + 40);
    id v49 = 0;
    id v50 = 0;
    int v21 = [v20 sendData:v11 toDestinations:v9 priority:v19 options:v12 identifier:&v50 error:&v49];
    id v22 = v50;
    id v23 = v49;
    if (v21 && [WeakRetained enableTransmissionWindow])
    {
      __int16 v24 = (void *)*((void *)WeakRetained + 14);
      uint64_t v25 = [v11 length];
      [WeakRetained windowResponseTimeout];
      objc_msgSend(v24, "addMessageWithID:ofLength:timeoutTime:", v22, v25);
      unint64_t v26 = *((void *)WeakRetained + 13) + [v11 length];
      *((void *)WeakRetained + 13) = v26;
      if (v26 >= [WeakRetained maxBytesInFlight])
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        uint64_t v27 = (void *)qword_26AB04790;
        if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = *((void *)WeakRetained + 13);
          uint64_t v29 = v27;
          uint64_t v30 = [WeakRetained maxBytesInFlight];
          *(_DWORD *)buf = 134218240;
          *(void *)v53 = v28;
          *(_WORD *)&v53[8] = 2048;
          *(void *)&v53[10] = v30;
          _os_log_impl(&dword_21C7C9000, v29, OS_LOG_TYPE_DEFAULT, "Closing window: %lu bytes in flight, %lu max", buf, 0x16u);
        }
        [*((id *)WeakRetained + 16) suspend];
      }
      [WeakRetained _setNextWindowTimeoutFireDate];
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    os_activity_t v31 = (void *)qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      v32 = *(void **)(a1 + 32);
      v33 = v31;
      LODWORD(v32) = [v32 messageID];
      uint64_t v34 = [v11 length];
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v53 = v32;
      *(_WORD *)&v53[4] = 2048;
      *(void *)&v53[6] = v34;
      *(_WORD *)&v53[14] = 2114;
      *(void *)&v53[16] = v22;
      __int16 v54 = 2112;
      id v55 = v23;
      _os_log_impl(&dword_21C7C9000, v33, OS_LOG_TYPE_DEFAULT, "For message: %{companionsync:SYMessageID}hu sending data of length: %tu. Got identifier %{public}@, error %@", buf, 0x26u);
    }
    uint64_t v35 = objc_opt_new();
    objc_msgSend(v35, "setMessageID:", objc_msgSend(*(id *)(a1 + 32), "messageID"));
    [v35 setIdsIdentifier:v22];
    v36 = [*(id *)(a1 + 32) persistentUserInfo];
    [v35 setUserInfo:v36];

    v37 = objc_opt_new();
    [v35 setDate:v37];

    [v35 setFromRequest:1];
    [v35 setIdsOptions:v12];
    [v35 setTargetDeviceIDs:v9];
    if (v23)
    {
      [WeakRetained _handleError:v23 context:v35];
    }
    else if (v22 && (v44 != 0 || [WeakRetained delegateRequiresACKs]))
    {
      [*(id *)(a1 + 32) responseTimeout];
      dispatch_source_t v38 = (void *)MEMORY[0x263EFF910];
      if (v39 > 0.0) {
        [*(id *)(a1 + 32) responseTimeout];
      }
      else {
        double v40 = 86400.0;
      }
      uint64_t v41 = [v38 dateWithTimeIntervalSinceNow:v40];
      [*(id *)(a1 + 32) setMessageCenter:WeakRetained];
      [*(id *)(a1 + 32) setIdsIdentifier:v22];
      [*((id *)WeakRetained + 10) lock];
      [*((id *)WeakRetained + 10) setObject:v35 forKey:v22 expires:v41];
      [*((id *)WeakRetained + 10) unlock];
      objc_super v45 = (void *)v41;
      [WeakRetained _updateExpireTimerWithDate:v41];
      v42 = [WeakRetained delegate];
      LOBYTE(v41) = objc_opt_respondsToSelector();

      if (v41)
      {
        v43 = *((void *)WeakRetained + 19);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __32__NMSMessageCenter_sendRequest___block_invoke_81;
        block[3] = &unk_264422990;
        id v47 = WeakRetained;
        id v48 = *(id *)(a1 + 32);
        dispatch_sync(v43, block);
      }
    }
  }
}

void __32__NMSMessageCenter_sendRequest___block_invoke_81(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 messageCenter:*(void *)(a1 + 32) didResolveIDSIdentifierForRequest:*(void *)(a1 + 40)];
}

- (void)sendFile:(id)a3
{
  id v5 = a3;
  char resumed = self->_resumed;
  id v7 = NSStringFromSelector(a2);
  _AssertState(resumed, a2, @"Cannot use %@ until after -resume is sent", v8, v9, v10, v11, v12, (uint64_t)v7);

  uint64_t v13 = self->_service;
  if (v13)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    double v14 = (void *)qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEBUG)) {
      [(NMSMessageCenter *)v14 sendFile:(uint64_t)self];
    }
    objc_initWeak(&location, self);
    windowQueue = self->_windowQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __29__NMSMessageCenter_sendFile___block_invoke;
    v16[3] = &unk_264423F80;
    objc_copyWeak(&v20, &location);
    id v17 = v5;
    uint64_t v18 = self;
    uint64_t v19 = v13;
    [(_NMSDispatchQueue *)windowQueue async:v16];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      -[NMSMessageCenter sendFile:]();
    }
  }
}

void __29__NMSMessageCenter_sendFile___block_invoke(uint64_t a1)
{
  v77[2] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (shouldLogTraffic())
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      int v3 = (void *)qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void **)(a1 + 32);
        id v5 = v3;
        id v6 = [v4 CPObfuscatedDescriptionObject];
        id v7 = _SYObfuscate(v6);
        *(_DWORD *)buf = 138543362;
        v71 = v7;
        _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "Sending file: %{public}@", buf, 0xCu);
      }
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v8 = (void *)qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEBUG)) {
      __29__NMSMessageCenter_sendFile___block_invoke_cold_3(a1, v8);
    }
    uint64_t v9 = (id *)(a1 + 32);
    uint64_t v10 = [*(id *)(a1 + 32) targetDeviceIDs];
    if (!v10)
    {
      uint64_t v10 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F4A148]];
    }
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    [*v9 sendTimeout];
    if (v12 > 0.0)
    {
      uint64_t v13 = NSNumber;
      [*v9 sendTimeout];
      double v14 = objc_msgSend(v13, "numberWithDouble:");
      [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x263F49F80]];
    }
    double v15 = [*v9 extraIDSOptions];

    if (v15)
    {
      id v16 = [*v9 extraIDSOptions];
      [v11 addEntriesFromDictionary:v16];
    }
    if ([*(id *)(a1 + 40) enableTransmissionWindow]) {
      [v11 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F49F90]];
    }
    uint64_t v17 = [*v9 priority];
    uint64_t v18 = 200;
    if (v17 == 1) {
      uint64_t v18 = 100;
    }
    if (v17 == 2) {
      uint64_t v19 = 300;
    }
    else {
      uint64_t v19 = v18;
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEBUG)) {
      __29__NMSMessageCenter_sendFile___block_invoke_cold_2();
    }
    id v20 = [*(id *)(a1 + 32) pbHeaderInfo];
    uint64_t v21 = [v20 data];

    v59 = (void *)v21;
    v76[0] = @"HeaderData";
    v76[1] = @"UserMetadata";
    v77[0] = v21;
    id v22 = [*(id *)(a1 + 32) metadata];
    v77[1] = v22;
    uint64_t v23 = [NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];

    __int16 v24 = *(void **)(a1 + 48);
    uint64_t v25 = [*(id *)(a1 + 32) fileURL];
    id v68 = 0;
    id v69 = 0;
    v58 = (void *)v23;
    LODWORD(v24) = [v24 sendResourceAtURL:v25 metadata:v23 toDestinations:v10 priority:v19 options:v11 identifier:&v69 error:&v68];
    id v26 = v69;
    id v27 = v68;

    v60 = (void *)v10;
    id v61 = v11;
    if (v24 && [WeakRetained enableTransmissionWindow])
    {
      uint64_t v28 = [*v9 fileURL];
      id v67 = 0;
      [v28 getResourceValue:&v67 forKey:*MEMORY[0x263EFF688] error:0];
      id v29 = v67;

      uint64_t v30 = [v29 unsignedIntegerValue];
      if (v30)
      {
        uint64_t v31 = v30;
        v32 = (void *)*((void *)WeakRetained + 14);
        [WeakRetained windowResponseTimeout];
        objc_msgSend(v32, "addMessageWithID:ofLength:timeoutTime:", v26, v31);
        unint64_t v33 = *((void *)WeakRetained + 13) + v31;
        *((void *)WeakRetained + 13) = v33;
        if (v33 >= [WeakRetained maxBytesInFlight])
        {
          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          uint64_t v34 = (void *)qword_26AB04790;
          if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v35 = (void *)*((void *)WeakRetained + 13);
            v36 = v34;
            uint64_t v37 = [WeakRetained maxBytesInFlight];
            *(_DWORD *)buf = 134218240;
            v71 = v35;
            __int16 v72 = 2048;
            uint64_t v73 = v37;
            _os_log_impl(&dword_21C7C9000, v36, OS_LOG_TYPE_DEFAULT, "Closing window: %lu bytes in flight, %lu max", buf, 0x16u);
          }
          [*((id *)WeakRetained + 16) suspend];
        }
        [WeakRetained _setNextWindowTimeoutFireDate];
      }

      uint64_t v10 = (uint64_t)v60;
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    dispatch_source_t v38 = (void *)qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      id v39 = *v9;
      double v40 = v38;
      uint64_t v41 = [v39 fileURL];
      *(_DWORD *)buf = 138412802;
      v71 = v41;
      __int16 v72 = 2114;
      uint64_t v73 = (uint64_t)v26;
      __int16 v74 = 2112;
      id v75 = v27;
      _os_log_impl(&dword_21C7C9000, v40, OS_LOG_TYPE_DEFAULT, "Sending resource data from file: %@. Got identifier %{public}@, error %@", buf, 0x20u);
    }
    v42 = objc_opt_new();
    [v42 setMessageID:0xFFFFLL];
    [v42 setIdsIdentifier:v26];
    v43 = [*v9 persistentUserInfo];
    [v42 setUserInfo:v43];

    long long v44 = objc_opt_new();
    [v42 setDate:v44];

    [v42 setFromRequest:1];
    [v42 setIdsOptions:v61];
    [v42 setTargetDeviceIDs:v10];
    [*v9 setMessageCenter:WeakRetained];
    [*v9 setIdsIdentifier:v26];
    objc_super v45 = [WeakRetained delegate];
    char v46 = objc_opt_respondsToSelector();

    if (v46)
    {
      id v47 = *((void *)WeakRetained + 19);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __29__NMSMessageCenter_sendFile___block_invoke_86;
      block[3] = &unk_264422BF8;
      id v64 = WeakRetained;
      id v65 = v26;
      id v66 = *v9;
      dispatch_sync(v47, block);
    }
    if (v27)
    {
      [WeakRetained _handleError:v27 context:v42];
    }
    else if (v26 && [WeakRetained delegateRequiresACKs])
    {
      [*v9 sendTimeout];
      v53 = (void *)MEMORY[0x263EFF910];
      if (v54 > 0.0)
      {
        [*v9 sendTimeout];
        double v55 = v56 + 5.0;
      }
      else
      {
        double v55 = 86405.0;
      }
      v57 = [v53 dateWithTimeIntervalSinceNow:v55];
      [*((id *)WeakRetained + 10) lock];
      [*((id *)WeakRetained + 10) setObject:v42 forKey:v26 expires:v57];
      [*((id *)WeakRetained + 10) unlock];
      [WeakRetained _updateExpireTimerWithDate:v57];
    }
    id v48 = [MEMORY[0x263F08850] defaultManager];
    id v49 = [*v9 fileURL];
    id v62 = 0;
    char v50 = [v48 removeItemAtURL:v49 error:&v62];
    id v51 = v62;

    if ((v50 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v52 = (void *)qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
        __29__NMSMessageCenter_sendFile___block_invoke_cold_1(v9, v52);
      }
    }
  }
}

void __29__NMSMessageCenter_sendFile___block_invoke_86(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 messageCenter:*(void *)(a1 + 32) didResolveIDSIdentifier:*(void *)(a1 + 40) forFileTransfer:*(void *)(a1 + 48)];
}

- (void)_sendResponse:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char resumed = self->_resumed;
  id v7 = NSStringFromSelector(a2);
  _AssertState(resumed, a2, @"Cannot use %@ until after -resume is sent", v8, v9, v10, v11, v12, (uint64_t)v7);

  uint64_t v13 = self->_service;
  double v14 = [v5 request];
  if (v13)
  {
    [v5 setSent:1];
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    double v15 = (void *)qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_INFO))
    {
      id v16 = v15;
      uint64_t v17 = [v5 pbResponse];
      uint64_t v18 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v18);
      BOOL v20 = [(_NMSDispatchQueue *)self->_windowQueue isSuspended];
      uint64_t v21 = "not ";
      if (v20) {
        uint64_t v21 = "";
      }
      *(_DWORD *)buf = 138543618;
      id v29 = v19;
      __int16 v30 = 2080;
      uint64_t v31 = v21;
      _os_log_impl(&dword_21C7C9000, v16, OS_LOG_TYPE_INFO, "Sending %{public}@, NMS window queue is %ssuspended", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    windowQueue = self->_windowQueue;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __34__NMSMessageCenter__sendResponse___block_invoke;
    v23[3] = &unk_264423F80;
    objc_copyWeak(&v27, (id *)buf);
    id v24 = v5;
    id v25 = v14;
    id v26 = v13;
    [(_NMSDispatchQueue *)windowQueue async:v23];

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      -[NMSMessageCenter _sendResponse:]();
    }
  }
}

void __34__NMSMessageCenter__sendResponse___block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained) {
    goto LABEL_49;
  }
  if (shouldLogTraffic())
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    int v3 = (void *)qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void **)(a1 + 32);
      id v5 = v3;
      id v6 = [v4 CPObfuscatedDescriptionObject];
      id v7 = _SYObfuscate(v6);
      *(_DWORD *)buf = 138543362;
      *(void *)v57 = v7;
      _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "Sending response: %{public}@", buf, 0xCu);
    }
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v8 = (void *)qword_26AB04790;
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEBUG)) {
    __34__NMSMessageCenter__sendResponse___block_invoke_cold_2(a1, v8);
  }
  uint64_t v9 = (id *)(a1 + 32);
  uint64_t v10 = [*(id *)(a1 + 32) targetDeviceIDs];
  uint64_t v11 = [*(id *)(a1 + 40) sourceDeviceID];

  if (v11)
  {
    uint64_t v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = [*(id *)(a1 + 40) sourceDeviceID];
    uint64_t v14 = [v12 setWithObject:v13];

    uint64_t v10 = (void *)v13;
  }
  else
  {
    if ([v10 count]) {
      goto LABEL_15;
    }
    uint64_t v14 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F4A148]];
  }

  uint64_t v10 = (void *)v14;
LABEL_15:
  id v15 = *v9;
  id v55 = 0;
  id v16 = [WeakRetained _buildDataForResponse:v15 options:&v55];
  id v17 = v55;
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v18 = (void *)qword_26AB04790;
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEBUG)) {
    __34__NMSMessageCenter__sendResponse___block_invoke_cold_1(a1 + 32, v18);
  }
  uint64_t v19 = [*(id *)(a1 + 32) priority];
  uint64_t v20 = 200;
  if (v19 == 1) {
    uint64_t v20 = 100;
  }
  if (v19 == 2) {
    uint64_t v21 = 300;
  }
  else {
    uint64_t v21 = v20;
  }
  id v22 = (void *)*((void *)WeakRetained + 7);
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 40), "messageID"));
  id v48 = [v22 objectForKeyedSubscript:v23];

  id v24 = *(void **)(a1 + 48);
  id v53 = 0;
  id v54 = 0;
  LODWORD(v23) = [v24 sendData:v16 toDestinations:v10 priority:v21 options:v17 identifier:&v54 error:&v53];
  id v25 = v54;
  id v26 = v53;
  if (v23 && [WeakRetained enableTransmissionWindow])
  {
    id v27 = (void *)*((void *)WeakRetained + 14);
    uint64_t v28 = [v16 length];
    [WeakRetained windowResponseTimeout];
    objc_msgSend(v27, "addMessageWithID:ofLength:timeoutTime:", v25, v28);
    unint64_t v29 = *((void *)WeakRetained + 13) + [v16 length];
    *((void *)WeakRetained + 13) = v29;
    if (v29 >= [WeakRetained maxBytesInFlight])
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      __int16 v30 = (void *)qword_26AB04790;
      if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v47 = *((void *)WeakRetained + 13);
        uint64_t v31 = v30;
        uint64_t v32 = [WeakRetained maxBytesInFlight];
        *(_DWORD *)buf = 134218240;
        *(void *)v57 = v47;
        *(_WORD *)&v57[8] = 2048;
        *(void *)&v57[10] = v32;
        _os_log_impl(&dword_21C7C9000, v31, OS_LOG_TYPE_DEFAULT, "Closing window: %lu bytes in flight, %lu max", buf, 0x16u);
      }
      objc_msgSend(*((id *)WeakRetained + 16), "suspend", v47);
    }
    [WeakRetained _setNextWindowTimeoutFireDate];
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  unint64_t v33 = (void *)qword_26AB04790;
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = *(void **)(a1 + 40);
    uint64_t v35 = v33;
    LODWORD(v34) = [v34 messageID];
    uint64_t v36 = [v16 length];
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v57 = v34;
    *(_WORD *)&v57[4] = 2048;
    *(void *)&v57[6] = v36;
    *(_WORD *)&v57[14] = 2114;
    *(void *)&v57[16] = v25;
    __int16 v58 = 2112;
    id v59 = v26;
    _os_log_impl(&dword_21C7C9000, v35, OS_LOG_TYPE_DEFAULT, "For response to: %{companionsync:SYMessageID}hu sending data of length: %tu. Got identifier %{public}@, error %@", buf, 0x26u);
  }
  [*v9 setIdsIdentifier:v25];
  uint64_t v37 = [WeakRetained delegate];
  char v38 = objc_opt_respondsToSelector();

  if (v38)
  {
    id v39 = *((void *)WeakRetained + 19);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__NMSMessageCenter__sendResponse___block_invoke_90;
    block[3] = &unk_264422BF8;
    id v50 = WeakRetained;
    id v51 = v25;
    id v52 = *v9;
    dispatch_sync(v39, block);
  }
  double v40 = objc_opt_new();
  objc_msgSend(v40, "setMessageID:", objc_msgSend(*(id *)(a1 + 40), "messageID"));
  [v40 setIdsIdentifier:v25];
  uint64_t v41 = [*(id *)(a1 + 32) persistentUserInfo];
  [v40 setUserInfo:v41];

  v42 = objc_opt_new();
  [v40 setDate:v42];

  [v40 setFromRequest:0];
  [v40 setIdsOptions:v17];
  if (v26)
  {
    [WeakRetained _handleError:v26 context:v40];
  }
  else if (v25 && v48)
  {
    [*v9 sendTimeout];
    v43 = (void *)MEMORY[0x263EFF910];
    if (v44 > 0.0) {
      [*v9 sendTimeout];
    }
    else {
      double v45 = 86400.0;
    }
    char v46 = [v43 dateWithTimeIntervalSinceNow:v45];
    [*((id *)WeakRetained + 10) lock];
    [*((id *)WeakRetained + 10) setObject:v40 forKey:v25 expires:v46];
    [*((id *)WeakRetained + 10) unlock];
    [WeakRetained _updateExpireTimerWithDate:v46];
  }
LABEL_49:
}

void __34__NMSMessageCenter__sendResponse___block_invoke_90(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 messageCenter:*(void *)(a1 + 32) didResolveIDSIdentifier:*(void *)(a1 + 40) forResponse:*(void *)(a1 + 48)];
}

- (void)_handleError:(id)a3 context:(id)a4 locked:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v10 = [v9 idsIdentifier];

  if (v10)
  {
    if (!a5) {
      [(NMSPersistentDictionary *)self->_persistentContextStore lock];
    }
    persistentContextStore = self->_persistentContextStore;
    uint64_t v12 = [v9 idsIdentifier];
    [(NMSPersistentDictionary *)persistentContextStore removeObjectForKey:v12];

    if (!a5) {
      [(NMSPersistentDictionary *)self->_persistentContextStore unlock];
    }
  }
  uint64_t v13 = [v8 userInfo];
  uint64_t v14 = (void *)[v13 mutableCopy];

  if (!v14) {
    uint64_t v14 = objc_opt_new();
  }
  [v14 setObject:v9 forKeyedSubscript:@"NMSContext"];
  id v15 = (void *)MEMORY[0x263F087E8];
  id v16 = [v8 domain];
  id v17 = objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, objc_msgSend(v8, "code"), v14);

  errorHandlers = self->_errorHandlers;
  uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v9, "messageID"));
  uint64_t v20 = [(NSMutableDictionary *)errorHandlers objectForKeyedSubscript:v19];

  if (v20)
  {
    ((void (**)(void, void *))v20)[2](v20, v17);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v22 = objc_opt_respondsToSelector();

    if (v22)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __48__NMSMessageCenter__handleError_context_locked___block_invoke;
      block[3] = &unk_264422BF8;
      void block[4] = self;
      id v25 = v9;
      id v26 = v17;
      dispatch_sync(delegateQueue, block);
    }
  }
}

void __48__NMSMessageCenter__handleError_context_locked___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = [*(id *)(a1 + 40) idsIdentifier];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 40) userInfo];
  [WeakRetained messageCenter:v2 failedToSendMessageWithIdentifier:v3 error:v4 userInfo:v5];
}

- (void)_handleError:(id)a3 context:(id)a4
{
}

- (void)_obliterate
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  int v3 = qword_26AB04790;
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_DEFAULT, "NMSMessageCenter stopping", buf, 2u);
  }
  dispatch_source_cancel((dispatch_source_t)self->_expireTimer);
  windowQueue = self->_windowQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__NMSMessageCenter__obliterate__block_invoke;
  v7[3] = &unk_264422AB0;
  v7[4] = self;
  [(_NMSDispatchQueue *)windowQueue sync:v7];
  service = self->_service;
  self->_service = 0;

  expireTimer = self->_expireTimer;
  self->_expireTimer = 0;

  self->_char resumed = 0;
  [(NMSPersistentDictionary *)self->_persistentContextStore lock];
  [(NMSPersistentDictionary *)self->_persistentContextStore removeAllObjects];
  [(NMSPersistentDictionary *)self->_persistentContextStore unlock];
  [(NMSWindowData *)self->_windowData removeAllMessages];
}

uint64_t __31__NMSMessageCenter__obliterate__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) suspend];
}

- (BOOL)cancelMessageWithID:(id)a3 error:(id *)a4
{
  service = self->_service;
  if (service) {
    LOBYTE(service) = [(IDSService *)service cancelIdentifier:a3 error:a4];
  }
  return (char)service;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_transportActivity, &state);
  [(NMSPersistentDictionary *)self->_persistentContextStore lock];
  id v16 = [(NMSPersistentDictionary *)self->_persistentContextStore objectForKey:v14];
  [(NMSPersistentDictionary *)self->_persistentContextStore unlock];
  if (!v16)
  {
    if (a6) {
      goto LABEL_31;
    }
    goto LABEL_16;
  }
  [v16 setSendAcked:1];
  if (!a6)
  {
    if (!v15)
    {
      id v15 = [MEMORY[0x263F087E8] errorWithDomain:@"NMSErrorDomain" code:3 userInfo:0];
    }
    [(NMSMessageCenter *)self _handleError:v15 context:v16];
LABEL_16:
    if ([(NMSMessageCenter *)self enableTransmissionWindow])
    {
      unint64_t currentBytesInFlight = self->_currentBytesInFlight;
      BOOL v27 = currentBytesInFlight >= [(NMSMessageCenter *)self maxBytesInFlight]
         || [(_NMSDispatchQueue *)self->_windowQueue isSuspended];
      [(NMSWindowData *)self->_windowData removeAndReturnLengthOfMessageWithID:v14];
      self->_unint64_t currentBytesInFlight = 0;
      if (v27 && [(NMSMessageCenter *)self maxBytesInFlight])
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        uint64_t v28 = (id)qword_26AB04790;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v29 = self->_currentBytesInFlight;
          unint64_t v30 = [(NMSMessageCenter *)self maxBytesInFlight];
          *(_DWORD *)buf = 134218240;
          unint64_t v36 = v29;
          __int16 v37 = 2048;
          unint64_t v38 = v30;
          _os_log_impl(&dword_21C7C9000, v28, OS_LOG_TYPE_DEFAULT, "Opening window: %lu bytes in flight, %lu max", buf, 0x16u);
        }

        [(_NMSDispatchQueue *)self->_windowQueue resume];
      }
      [(NMSMessageCenter *)self _setNextWindowTimeoutFireDate];
    }
    goto LABEL_31;
  }
  if ([v16 isFromRequest])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __72__NMSMessageCenter_service_account_identifier_didSendWithSuccess_error___block_invoke;
      block[3] = &unk_264422BF8;
      void block[4] = self;
      id v32 = v14;
      id v33 = v16;
      dispatch_sync(delegateQueue, block);
    }
  }
  if (![v16 isFromRequest]) {
    goto LABEL_8;
  }
  responseHandlers = self->_responseHandlers;
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v16, "messageID"));
  char v22 = [(NSMutableDictionary *)responseHandlers objectForKeyedSubscript:v21];
  LODWORD(responseHandlers) = v22 == 0;

  if (responseHandlers)
  {
LABEL_8:
    [(NMSPersistentDictionary *)self->_persistentContextStore lock];
    uint64_t v23 = [v16 idsOptions];
    id v24 = [v23 objectForKeyedSubscript:*MEMORY[0x263F49F90]];
    if ([v24 BOOLValue])
    {
      char v25 = [v16 processAcked];

      if ((v25 & 1) == 0)
      {
        [(NMSPersistentDictionary *)self->_persistentContextStore resetObject:v16 forKey:v14];
LABEL_30:
        [(NMSPersistentDictionary *)self->_persistentContextStore unlock];
        goto LABEL_31;
      }
    }
    else
    {
    }
    [(NMSPersistentDictionary *)self->_persistentContextStore removeObjectForKey:v14];
    goto LABEL_30;
  }
LABEL_31:

  os_activity_scope_leave(&state);
}

void __72__NMSMessageCenter_service_account_identifier_didSendWithSuccess_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) userInfo];
  [WeakRetained messageCenter:v2 didSuccessfullySendRequestWithIdentifier:v3 userInfo:v4];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_transportActivity, &state);
  [(NMSPersistentDictionary *)self->_persistentContextStore lock];
  id v14 = [(NMSPersistentDictionary *)self->_persistentContextStore objectForKey:v12];
  [(NMSPersistentDictionary *)self->_persistentContextStore unlock];
  [v14 setProcessAcked:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__NMSMessageCenter_service_account_identifier_hasBeenDeliveredWithContext___block_invoke;
    block[3] = &unk_264422BF8;
    void block[4] = self;
    id v29 = v12;
    id v30 = v14;
    dispatch_sync(delegateQueue, block);
  }
  if (v14)
  {
    if (![v14 isFromRequest]) {
      goto LABEL_6;
    }
    responseHandlers = self->_responseHandlers;
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v14, "messageID"));
    uint64_t v20 = [(NSMutableDictionary *)responseHandlers objectForKeyedSubscript:v19];
    LODWORD(responseHandlers) = v20 == 0;

    if (responseHandlers)
    {
LABEL_6:
      [(NMSPersistentDictionary *)self->_persistentContextStore lock];
      int v21 = [v14 sendAcked];
      persistentContextStore = self->_persistentContextStore;
      if (v21) {
        [(NMSPersistentDictionary *)persistentContextStore removeObjectForKey:v12];
      }
      else {
        [(NMSPersistentDictionary *)persistentContextStore resetObject:v14 forKey:v12];
      }
      [(NMSPersistentDictionary *)self->_persistentContextStore unlock];
    }
  }
  if ([(NMSMessageCenter *)self enableTransmissionWindow])
  {
    unint64_t currentBytesInFlight = self->_currentBytesInFlight;
    BOOL v24 = currentBytesInFlight >= [(NMSMessageCenter *)self maxBytesInFlight]
       || [(_NMSDispatchQueue *)self->_windowQueue isSuspended];
    [(NMSWindowData *)self->_windowData removeAndReturnLengthOfMessageWithID:v12];
    self->_unint64_t currentBytesInFlight = 0;
    if (v24 && [(NMSMessageCenter *)self maxBytesInFlight])
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      char v25 = (id)qword_26AB04790;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v26 = self->_currentBytesInFlight;
        unint64_t v27 = [(NMSMessageCenter *)self maxBytesInFlight];
        *(_DWORD *)buf = 134218240;
        unint64_t v33 = v26;
        __int16 v34 = 2048;
        unint64_t v35 = v27;
        _os_log_impl(&dword_21C7C9000, v25, OS_LOG_TYPE_DEFAULT, "Opening window: %lu bytes in flight, %lu max", buf, 0x16u);
      }

      [(_NMSDispatchQueue *)self->_windowQueue resume];
    }
    [(NMSMessageCenter *)self _setNextWindowTimeoutFireDate];
  }

  os_activity_scope_leave(&state);
}

void __75__NMSMessageCenter_service_account_identifier_hasBeenDeliveredWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) userInfo];
  [WeakRetained messageCenter:v2 didSuccessfullyDeliverRequestWithIdentifier:v3 userInfo:v4];
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v12 = (IDSService *)a3;
  id v66 = a4;
  id v13 = a5;
  id v67 = a6;
  id v14 = a7;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_transportActivity, &state);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v15 = (id)qword_26AB04790;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v13 length];
    _SYObfuscate(v12);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    char v18 = [v14 outgoingResponseIdentifier];
    uint64_t v19 = [v14 incomingResponseIdentifier];
    *(_DWORD *)buf = 134218754;
    uint64_t v73 = v16;
    __int16 v74 = 2114;
    id v75 = v17;
    __int16 v76 = 2114;
    v77 = v18;
    __int16 v78 = 2114;
    v79 = v19;
    _os_log_impl(&dword_21C7C9000, v15, OS_LOG_TYPE_DEFAULT, "Receiving %zu bytes of incoming data from service %{public}@. Identifier (in/out) = %{public}@ / %{public}@", buf, 0x2Au);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_service == v12)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v20 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEBUG)) {
      -[NMSMessageCenter service:account:incomingData:fromID:context:].cold.7(v20);
    }
    id v64 = (void *)os_transaction_create();
    int v21 = [v14 incomingResponseIdentifier];
    BOOL v22 = v21 == 0;

    if (v22)
    {
      if ((unint64_t)[v13 length] >= 3)
      {
        id v65 = [(NMSMessageCenter *)self _decodeIncomingRequestData:v13 context:v14];
        [v65 setSourceDeviceID:v67];
        if ([v65 messageID] == 0x7FFF)
        {
          v43 = [v65 pbRequest];
          double v44 = [v43 inReplyTo];
          [(NMSPersistentDictionary *)self->_persistentContextStore lock];
          [(NMSPersistentDictionary *)self->_persistentContextStore removeObjectForKey:v44];
          [(NMSPersistentDictionary *)self->_persistentContextStore unlock];
          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          double v45 = qword_26AB04790;
          if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v73 = (uint64_t)v44;
            _os_log_impl(&dword_21C7C9000, v45, OS_LOG_TYPE_DEFAULT, "Releasing timer for outgoing request %{public}@ due to incoming Version Rejection message triggered by that message ID.", buf, 0xCu);
          }
        }
        if (shouldLogTraffic())
        {
          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          char v46 = (id)qword_26AB04790;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v47 = [v65 CPObfuscatedDescriptionObject];
            id v48 = _SYObfuscate(v47);
            *(_DWORD *)buf = 138543362;
            uint64_t v73 = (uint64_t)v48;
            _os_log_impl(&dword_21C7C9000, v46, OS_LOG_TYPE_DEFAULT, "Received request: %{public}@", buf, 0xCu);
          }
        }
        if ([v65 expectsResponse]) {
          [v65 configureResponse];
        }
        requestHandlers = self->_requestHandlers;
        id v50 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v65, "messageID"));
        unint64_t v27 = [(NSMutableDictionary *)requestHandlers objectForKeyedSubscript:v50];

        if (v27)
        {
          ((void (**)(void, id))v27)[2](v27, v65);
        }
        else
        {
          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          id v53 = (id)qword_26AB04790;
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
            -[NMSMessageCenter service:account:incomingData:fromID:context:].cold.4([v65 messageID], v71, v53);
          }

          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEBUG))
          {
            if ((unint64_t)[v13 length] > 0x64)
            {
              id v55 = (void *)MEMORY[0x21D4B1560]();
              objc_msgSend(v13, "subdataWithRange:", 0, 100);
              id v54 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v54 = v13;
            }
            if (_sync_log_facilities_pred != -1) {
              _os_once();
            }
            double v56 = (id)qword_26AB04790;
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            {
              v57 = objc_msgSend(v13, "subdataWithRange:", 0, 3);
              -[NMSMessageCenter service:account:incomingData:fromID:context:](v57, (uint64_t)buf, v56);
            }

            if (_sync_log_facilities_pred != -1) {
              _os_once();
            }
            if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEBUG)) {
              -[NMSMessageCenter service:account:incomingData:fromID:context:]();
            }
          }
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          char v59 = objc_opt_respondsToSelector();

          if (v59)
          {
            delegateQueue = self->_delegateQueue;
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __64__NMSMessageCenter_service_account_incomingData_fromID_context___block_invoke;
            block[3] = &unk_264422990;
            void block[4] = self;
            id v65 = v65;
            id v69 = v65;
            dispatch_sync(delegateQueue, block);
          }
          else
          {
            [v65 setExpectsResponse:0];
            if (_sync_log_facilities_pred != -1) {
              _os_once();
            }
            id v61 = qword_26AB04790;
            if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
              -[NMSMessageCenter service:account:incomingData:fromID:context:](v61);
            }
          }
        }
        goto LABEL_55;
      }
    }
    else if ((unint64_t)[v13 length] >= 2)
    {
      id v23 = v13;
      int v24 = *(unsigned __int16 *)[v23 bytes];
      objc_msgSend(v23, "subdataWithRange:", 2, objc_msgSend(v23, "length") - 2);
      id v65 = (id)objc_claimAutoreleasedReturnValue();
      [(NMSPersistentDictionary *)self->_persistentContextStore lock];
      persistentContextStore = self->_persistentContextStore;
      unint64_t v26 = [v14 incomingResponseIdentifier];
      unint64_t v27 = [(NMSPersistentDictionary *)persistentContextStore objectForKey:v26];

      [(NMSPersistentDictionary *)self->_persistentContextStore unlock];
      if (v27)
      {
        [(NMSPersistentDictionary *)self->_persistentContextStore lock];
        uint64_t v28 = self->_persistentContextStore;
        id v29 = [v14 incomingResponseIdentifier];
        [(NMSPersistentDictionary *)v28 removeObjectForKey:v29];

        [(NMSPersistentDictionary *)self->_persistentContextStore unlock];
        if ([v27 messageID] == v24)
        {
          if ([v27 isFromRequest])
          {
            responseHandlers = self->_responseHandlers;
            uint64_t v31 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v27, "messageID"));
            id v32 = [(NSMutableDictionary *)responseHandlers objectForKeyedSubscript:v31];

            if (v32)
            {
              unint64_t v33 = objc_opt_new();
              objc_msgSend(v33, "setMessageID:", objc_msgSend(v27, "messageID"));
              [v33 setData:v65];
              __int16 v34 = [v14 outgoingResponseIdentifier];
              [v33 setIdsIdentifier:v34];

              unint64_t v35 = [v14 incomingResponseIdentifier];
              [v33 setRequestIDSIdentifier:v35];

              uint64_t v36 = [v27 date];
              [v33 setRequestSent:v36];

              __int16 v37 = [v27 userInfo];
              [v33 setRequestPersistentUserInfo:v37];

              [v33 setSourceDeviceID:v67];
              [v33 setIdsContext:v14];
              if (shouldLogTraffic())
              {
                if (_sync_log_facilities_pred != -1) {
                  _os_once();
                }
                unint64_t v38 = (id)qword_26AB04790;
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v39 = [v33 CPObfuscatedDescriptionObject];
                  double v40 = _SYObfuscate(v39);
                  *(_DWORD *)buf = 138543362;
                  uint64_t v73 = (uint64_t)v40;
                  _os_log_impl(&dword_21C7C9000, v38, OS_LOG_TYPE_DEFAULT, "Received response: %{public}@", buf, 0xCu);
                }
              }
              uint64_t v41 = -[NMSMessageCenter _pbMappingForMessageID:](self, "_pbMappingForMessageID:", [v27 messageID]);
              if ([v41 responseClass])
              {
                v42 = objc_msgSend(objc_alloc((Class)objc_msgSend(v41, "responseClass")), "initWithData:", v65);
                [v33 setPbResponse:v42];
              }
              v32[2](v32, v33);
            }
            else
            {
              if (_sync_log_facilities_pred != -1) {
                _os_once();
              }
              id v52 = qword_26AB04790;
              if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
                -[NMSMessageCenter service:account:incomingData:fromID:context:].cold.6(v24, v52);
              }
            }
LABEL_54:

LABEL_55:
            goto LABEL_56;
          }
          id v62 = "context.fromRequest == YES";
          int v63 = 1269;
        }
        else
        {
          id v62 = "context.messageID == header.messageID";
          int v63 = 1268;
        }
        __assert_rtn("-[NMSMessageCenter service:account:incomingData:fromID:context:]", "NanoMessagingService.m", v63, v62);
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v32 = (void (**)(id, void *))(id)qword_26AB04790;
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
      {
        id v51 = [v14 incomingResponseIdentifier];
        -[NMSMessageCenter service:account:incomingData:fromID:context:].cold.5(v51, v24, buf, (os_log_t)v32);
      }
      goto LABEL_54;
    }
LABEL_56:

    goto LABEL_57;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
    -[NMSMessageCenter service:account:incomingData:fromID:context:].cold.8();
  }
LABEL_57:
  os_activity_scope_leave(&state);
}

void __64__NMSMessageCenter_service_account_incomingData_fromID_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  [WeakRetained messageCenter:*(void *)(a1 + 32) didReceiveUnknownRequest:*(void *)(a1 + 40)];
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_transportActivity, &state);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    BOOL v22 = qword_26AB04790;
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEBUG)) {
      -[NMSMessageCenter service:account:incomingResourceAtURL:metadata:fromID:context:](v22);
    }
    id v29 = (void *)os_transaction_create();
    id v23 = objc_opt_new();
    [v23 setMessageCenter:self];
    [v23 setIdsIdentifier:v18];
    [v23 setFileURL:v16];
    int v24 = [v17 objectForKeyedSubscript:@"UserMetadata"];
    [v23 setMetadata:v24];

    [v23 setSourceDeviceID:v18];
    [v23 setIdsContext:v19];
    char v25 = [v17 objectForKeyedSubscript:@"HeaderData"];
    if (v25)
    {
      unint64_t v26 = [[SYFileTransferInfo alloc] initWithData:v25];
      [v23 setPbHeaderInfo:v26];
    }
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__NMSMessageCenter_service_account_incomingResourceAtURL_metadata_fromID_context___block_invoke;
    block[3] = &unk_264422990;
    void block[4] = self;
    id v31 = v23;
    id v28 = v23;
    dispatch_sync(delegateQueue, block);
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      -[NMSMessageCenter service:account:incomingResourceAtURL:metadata:fromID:context:]();
    }
  }
  os_activity_scope_leave(&state);
}

void __82__NMSMessageCenter_service_account_incomingResourceAtURL_metadata_fromID_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  [WeakRetained messageCenter:*(void *)(a1 + 32) didReceiveIncomingFileTransfer:*(void *)(a1 + 40)];
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_transportActivity, &state);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v11 = qword_26AB04790;
  if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v9;
    _os_log_impl(&dword_21C7C9000, v11, OS_LOG_TYPE_DEFAULT, "IDS active device changed: %@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__NMSMessageCenter_service_didSwitchActivePairedDevice_acknowledgementBlock___block_invoke;
    block[3] = &unk_264423CD0;
    void block[4] = self;
    id v16 = v9;
    id v17 = v10;
    dispatch_async(delegateQueue, block);
  }
  else
  {
    v10[2](v10);
  }
  os_activity_scope_leave(&state);
}

void __77__NMSMessageCenter_service_didSwitchActivePairedDevice_acknowledgementBlock___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  [WeakRetained messageCenter:a1[4] activeDeviceChanged:a1[5] acknowledgement:a1[6]];
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_transportActivity, &state);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__NMSMessageCenter_service_nearbyDevicesChanged___block_invoke;
    block[3] = &unk_264422BF8;
    id v11 = WeakRetained;
    id v12 = self;
    id v13 = v7;
    dispatch_async(delegateQueue, block);
  }
  os_activity_scope_leave(&state);
}

uint64_t __49__NMSMessageCenter_service_nearbyDevicesChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) messageCenter:*(void *)(a1 + 40) nearbyDevicesChanged:*(void *)(a1 + 48)];
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_transportActivity, &state);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__NMSMessageCenter_service_connectedDevicesChanged___block_invoke;
    block[3] = &unk_264422BF8;
    id v11 = WeakRetained;
    id v12 = self;
    id v13 = v7;
    dispatch_async(delegateQueue, block);
  }
  os_activity_scope_leave(&state);
}

uint64_t __52__NMSMessageCenter_service_connectedDevicesChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) messageCenter:*(void *)(a1 + 40) connectedDevicesChanged:*(void *)(a1 + 48)];
}

- (NMSMessageCenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NMSMessageCenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_os_activity)transportActivity
{
  return self->_transportActivity;
}

- (void)setTransportActivity:(id)a3
{
}

- (BOOL)enableTransmissionWindow
{
  return self->_enableTransmissionWindow;
}

- (unint64_t)maxMessagesInFlight
{
  return self->_maxMessagesInFlight;
}

- (void)setMaxMessagesInFlight:(unint64_t)a3
{
  self->_maxMessagesInFlight = a3;
}

- (unint64_t)minMessagesInFlight
{
  return self->_minMessagesInFlight;
}

- (void)setMinMessagesInFlight:(unint64_t)a3
{
  self->_minMessagesInFlight = a3;
}

- (unint64_t)maxBytesInFlight
{
  return self->_maxBytesInFlight;
}

- (void)setMaxBytesInFlight:(unint64_t)a3
{
  self->_maxBytesInFlight = a3;
}

- (double)windowResponseTimeout
{
  return self->_windowResponseTimeout;
}

- (void)setWindowResponseTimeout:(double)a3
{
  self->_windowResponseTimeout = a3;
}

- (BOOL)delegateRequiresACKs
{
  return self->_delegateRequiresACKs;
}

- (void)setDelegateRequiresACKs:(BOOL)a3
{
  self->_delegateRequiresACKs = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transportActivity, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_idsIncomingQueue, 0);
  objc_storeStrong((id *)&self->_windowQueue, 0);
  objc_storeStrong((id *)&self->_windowTimeout, 0);
  objc_storeStrong((id *)&self->_windowData, 0);
  objc_storeStrong((id *)&self->_expireTimer, 0);
  objc_storeStrong((id *)&self->_nextExpireTimerFireDate, 0);
  objc_storeStrong((id *)&self->_persistentContextStore, 0);
  objc_storeStrong((id *)&self->_pbMapping, 0);
  objc_storeStrong((id *)&self->_responseHandlers, 0);
  objc_storeStrong((id *)&self->_errorHandlers, 0);
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_launchNotification, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

- (id)deviceIDFromDevice:(id)a3
{
  if (a3) {
    id v3 = (id)IDSCopyIDForDevice();
  }
  else {
    id v3 = (id)*MEMORY[0x263F4A148];
  }
  return v3;
}

- (void)_decodeIncomingRequestData:context:.cold.1()
{
}

- (void)sendRequest:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "IDS service is nil on entry to sendRequest. Dropping message: %{public}@", v2, v3, v4, v5, v6);
}

void __32__NMSMessageCenter_sendRequest___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_4(&dword_21C7C9000, v0, v1, "Request resolved IDS options: %@", v2);
}

void __32__NMSMessageCenter_sendRequest___block_invoke_cold_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_5() extraIDSOptions];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_12(&dword_21C7C9000, v5, v6, "Request extra IDS options: %@", v7, v8, v9, v10, v11);
}

- (void)sendFile:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "IDS service is nil on entry to sendFile. Dropping message: %{public}@", v2, v3, v4, v5, v6);
}

- (void)sendFile:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint8_t v6 = [a2 fileURL];
  int v7 = [*(id *)(a3 + 128) isSuspended];
  uint64_t v8 = "not ";
  if (v7) {
    uint64_t v8 = "";
  }
  int v9 = 138543618;
  uint64_t v10 = v6;
  __int16 v11 = 2080;
  id v12 = v8;
  _os_log_debug_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEBUG, "Sending %{public}@, NMS window queue is %ssuspended", (uint8_t *)&v9, 0x16u);
}

void __29__NMSMessageCenter_sendFile___block_invoke_cold_1(void **a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  uint64_t v3 = a2;
  [v2 fileURL];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (void *)OUTLINED_FUNCTION_5();
  uint64_t v5 = _SYObfuscate(v4);
  int v6 = 138412546;
  int v7 = v2;
  __int16 v8 = 2114;
  int v9 = v5;
  _os_log_error_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_ERROR, "Failed to delete file-transfer file '%@' : %{public}@", (uint8_t *)&v6, 0x16u);
}

void __29__NMSMessageCenter_sendFile___block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_4(&dword_21C7C9000, v0, v1, "File resolved IDS options: %@", v2);
}

void __29__NMSMessageCenter_sendFile___block_invoke_cold_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_5() extraIDSOptions];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_12(&dword_21C7C9000, v5, v6, "File extra IDS options: %@", v7, v8, v9, v10, v11);
}

- (void)_sendResponse:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "IDS service is nil on entry to _sendResponse. Dropping message: %{public}@", v2, v3, v4, v5, v6);
}

void __34__NMSMessageCenter__sendResponse___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_5() extraIDSOptions];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_12(&dword_21C7C9000, v5, v6, "Response resolved IDS options: %@", v7, v8, v9, v10, v11);
}

void __34__NMSMessageCenter__sendResponse___block_invoke_cold_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_5() extraIDSOptions];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_12(&dword_21C7C9000, v5, v6, "Response extra IDS options: %@", v7, v8, v9, v10, v11);
}

- (void)service:(os_log_t)log account:incomingData:fromID:context:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21C7C9000, log, OS_LOG_TYPE_ERROR, "Unable to inform delegate about incoming request", v1, 2u);
}

- (void)service:account:incomingData:fromID:context:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_4(&dword_21C7C9000, v0, v1, "First 100 bytes of incoming unrecognized message data: %{private}@", v2);
}

- (void)service:(NSObject *)a3 account:incomingData:fromID:context:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2_4(&dword_21C7C9000, a3, (uint64_t)a3, "Header bytes from message (8 bytes): %{public}@", (uint8_t *)a2);
}

- (void)service:(os_log_t)log account:incomingData:fromID:context:.cold.4(unsigned __int16 a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a1;
  _os_log_error_impl(&dword_21C7C9000, log, OS_LOG_TYPE_ERROR, "No request handler for message ID %{companionsync:SYMessageID}hu", buf, 8u);
}

- (void)service:(uint8_t *)buf account:(os_log_t)log incomingData:fromID:context:.cold.5(void *a1, unsigned __int16 a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_21C7C9000, log, OS_LOG_TYPE_ERROR, "Could not find context for message %{public}@, type %{companionsync:SYMessageID}hu", buf, 0x12u);
}

- (void)service:(int)a1 account:(NSObject *)a2 incomingData:fromID:context:.cold.6(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21C7C9000, a2, OS_LOG_TYPE_ERROR, "No registered response handler for message: %{companionsync:SYMessageID}hu", (uint8_t *)v2, 8u);
}

- (void)service:(os_log_t)log account:incomingData:fromID:context:.cold.7(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21C7C9000, log, OS_LOG_TYPE_DEBUG, "Incoming data: wrapping it with an XPC transaction", v1, 2u);
}

- (void)service:account:incomingData:fromID:context:.cold.8()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_21C7C9000, v1, OS_LOG_TYPE_ERROR, "Err, *whose* message? Got data for service %{public}@, but I'm listening for service %{public}@", v2, 0x16u);
}

- (void)service:(os_log_t)log account:incomingResourceAtURL:metadata:fromID:context:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_21C7C9000, log, OS_LOG_TYPE_DEBUG, "Incoming file transfer: wrapping it with an XPC transaction", v1, 2u);
}

- (void)service:account:incomingResourceAtURL:metadata:fromID:context:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_21C7C9000, v0, v1, "IDS gave us a file at URL %{public}@, but our delegate doesn't respond to file transfer callbacks.", v2, v3, v4, v5, v6);
}

@end