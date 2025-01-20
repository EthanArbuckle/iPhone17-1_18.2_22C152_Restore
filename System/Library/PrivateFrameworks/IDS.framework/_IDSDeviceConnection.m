@interface _IDSDeviceConnection
- (BOOL)updateConnectionWithOptions:(id)a3 error:(id *)a4;
- (NSDictionary)metrics;
- (NSInputStream)inputStream;
- (NSOutputStream)outputStream;
- (_IDSDeviceConnection)initWithDevice:(id)a3 options:(id)a4 completionHandler:(id)a5 queue:(id)a6;
- (id)deviceConnectionKey;
- (int)socket;
- (unint64_t)mtu;
- (void)_cleanupCompletionBlock;
- (void)_close;
- (void)_connect;
- (void)_daemonDied:(id)a3;
- (void)close;
- (void)dealloc;
- (void)setStreamPairWithInputStream:(id)a3 outputStream:(id)a4;
- (void)xpcObject:(id)a3 objectContext:(id)a4;
@end

@implementation _IDSDeviceConnection

- (_IDSDeviceConnection)initWithDevice:(id)a3 options:(id)a4 completionHandler:(id)a5 queue:(id)a6
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  queue = a6;
  if (_IDSRunningInDaemon())
  {
    v13 = +[IDSLogging IDSDeviceConnection];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A2DE10();
    }
    goto LABEL_25;
  }
  kdebug_trace();
  v14 = +[IDSInternalQueueController sharedInstance];
  int v15 = [v14 assertQueueIsCurrent];

  if (v15)
  {
    v16 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_191A33FF4();
    }
  }
  v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 addObserver:self selector:sel__daemonDied_ name:@"__kIDSDaemonDidDisconnectNotification" object:0];

  v106.receiver = self;
  v106.super_class = (Class)_IDSDeviceConnection;
  v18 = [(_IDSDeviceConnection *)&v106 init];
  v19 = v18;
  if (v18)
  {
    v18->_int socket = -1;
    if (!v18->_awdMetrics)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      awdMetrics = v19->_awdMetrics;
      v19->_awdMetrics = (NSMutableDictionary *)Mutable;
    }
    v22 = +[_IDSDeviceConnectionActiveMap sharedInstance];
    int v23 = [v22 getActiveConnectionCount];

    self = (_IDSDeviceConnection *)[v12 copy];
    if (queue)
    {
      if (!v10) {
        goto LABEL_20;
      }
    }
    else
    {
      queue = MEMORY[0x1E4F14428];
      id v24 = MEMORY[0x1E4F14428];
      if (!v10) {
        goto LABEL_20;
      }
    }
    v25 = [v10 _internal];
    v26 = [v25 service];

    if (v26)
    {
      if (v23 < 31)
      {
        id v99 = v12;
        goto LABEL_30;
      }
      v27 = +[IDSLogging IDSDeviceConnection];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_191A33F34(v10, v23, v27);
      }

      id v28 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      v29 = objc_msgSend(v28, "initWithObjectsAndKeys:", @"Too many active connections. Client is leaking sockets.", *MEMORY[0x1E4F28568], 0);
      id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v31 = 58;
LABEL_23:
      v34 = (void *)[v30 initWithDomain:@"com.apple.identityservices.error" code:v31 userInfo:v29];

      if (v34)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_191989674;
        block[3] = &unk_1E5729880;
        id v104 = v34;
        v105 = self;
        v13 = v34;
        self = self;
        dispatch_async(queue, block);

LABEL_25:
        v19 = 0;
LABEL_26:

        goto LABEL_27;
      }
      id v99 = v12;
      v19 = 0;
LABEL_30:
      uint64_t v36 = [NSString stringGUID];
      openSocketCompletionHandlerID = v19->_openSocketCompletionHandlerID;
      v19->_openSocketCompletionHandlerID = (NSString *)v36;

      v38 = [v10 _internal];
      v39 = [v38 nsuuid];
      uint64_t v40 = [v39 UUIDString];
      nsuuid = v19->_nsuuid;
      v19->_nsuuid = (NSString *)v40;

      v42 = [v10 _internal];
      v19->_isDefaultPairedDevice = [v42 isDefaultPairedDevice];

      v43 = [v10 _internal];
      uint64_t v44 = [v43 service];
      service = v19->_service;
      v19->_service = (NSString *)v44;

      v46 = [MEMORY[0x1E4F28F80] processInfo];
      uint64_t v47 = [v46 processName];
      clientName = v19->_clientName;
      v19->_clientName = (NSString *)v47;

      uint64_t v49 = *MEMORY[0x1E4F6B150];
      v50 = [v11 objectForKey:*MEMORY[0x1E4F6B150]];

      if (v50)
      {
        v51 = [v11 objectForKey:v49];
        uint64_t v52 = [v51 copy];
        connectionUUID = v19->_connectionUUID;
        v19->_connectionUUID = (NSString *)v52;
      }
      else
      {
        uint64_t v54 = [NSString stringGUID];
        v51 = v19->_connectionUUID;
        v19->_connectionUUID = (NSString *)v54;
      }

      key = (void *)*MEMORY[0x1E4F6B198];
      v13 = objc_msgSend(v11, "objectForKey:");
      int v97 = v23;
      if (v13)
      {
        uint64_t v55 = [@"_" stringByAppendingString:v13];
      }
      else
      {
        uint64_t v55 = [(id)*MEMORY[0x1E4F6B190] copy];
      }
      streamName = v19->_streamName;
      v19->_streamName = (NSString *)v55;

      uint64_t v57 = [NSString stringGUID];
      serviceToken = v19->_serviceToken;
      v19->_serviceToken = (NSString *)v57;

      uint64_t v59 = *MEMORY[0x1E4F6B148];
      v60 = [v11 objectForKey:*MEMORY[0x1E4F6B148]];

      if (v60)
      {
        v61 = [v11 objectForKey:v59];
        uint64_t v62 = [v61 copy];
        p_clientTimeout = (void **)&v19->_clientTimeout;
        clientTimeout = v19->_clientTimeout;
        v19->_clientTimeout = (NSNumber *)v62;

        if ([(NSNumber *)v19->_clientTimeout intValue] > 9)
        {
LABEL_43:
          v68 = +[_IDSDeviceConnectionActiveMap sharedInstance];
          v69 = v19->_connectionUUID;
          v70 = [(_IDSDeviceConnection *)v19 deviceConnectionKey];
          [v68 setActiveConnection:v69 forKey:v70];

          v71 = +[IDSLogging IDSDeviceConnection];
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            int socket = v19->_socket;
            v73 = v19->_streamName;
            v74 = v19->_connectionUUID;
            v75 = [v10 uniqueID];
            *(_DWORD *)buf = 134219522;
            v108 = v19;
            __int16 v109 = 1024;
            *(_DWORD *)v110 = socket;
            *(_WORD *)&v110[4] = 2112;
            *(void *)&v110[6] = v11;
            __int16 v111 = 2112;
            v112 = v73;
            __int16 v113 = 2112;
            v114 = v74;
            __int16 v115 = 1024;
            int v116 = v97;
            __int16 v117 = 2112;
            v118 = v75;
            _os_log_impl(&dword_19190B000, v71, OS_LOG_TYPE_DEFAULT, "<%p> Init connection socket %d with options: %@ (streamName:%@, connectionUUID:%@ active connections:%d), device: %@", buf, 0x40u);
          }
          v76 = +[IDSDaemonController sharedInstance];
          v77 = [v76 listener];
          [v77 addHandler:v19];

          [(_IDSDeviceConnection *)v19 _connect];
          uint64_t v78 = MEMORY[0x192FE03B0](self);
          id openSocketCompletionHandler = v19->_openSocketCompletionHandler;
          v19->_id openSocketCompletionHandler = (id)v78;

          objc_storeStrong((id *)&v19->_openSocketCompletionHandlerQueue, queue);
          v80 = [v11 objectForKey:*MEMORY[0x1E4F6B1A0]];
          v81 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
          v82 = v81;
          v83 = v19->_openSocketCompletionHandlerID;
          if (v83) {
            CFDictionarySetValue(v81, @"completionHandlerID", v83);
          }
          if (*MEMORY[0x1E4F6B128]) {
            CFDictionarySetValue(v82, (const void *)*MEMORY[0x1E4F6B130], (const void *)*MEMORY[0x1E4F6B128]);
          }
          v84 = v19->_service;
          if (v84) {
            CFDictionarySetValue(v82, (const void *)*MEMORY[0x1E4F6B188], v84);
          }
          v85 = v19->_streamName;
          if (v85) {
            CFDictionarySetValue(v82, key, v85);
          }
          v86 = [v10 _internal];
          v87 = [v86 uniqueID];

          if (v87) {
            CFDictionarySetValue(v82, (const void *)*MEMORY[0x1E4F6B160], v87);
          }

          v88 = +[IDSDaemonController sharedInstance];
          v89 = [v88 listenerID];

          if (v89) {
            CFDictionarySetValue(v82, (const void *)*MEMORY[0x1E4F6B138], v89);
          }

          v90 = v19->_clientName;
          if (v90) {
            CFDictionarySetValue(v82, (const void *)*MEMORY[0x1E4F6B140], v90);
          }
          v91 = v19->_nsuuid;
          if (v91) {
            CFDictionarySetValue(v82, (const void *)*MEMORY[0x1E4F6AE80], v91);
          }
          v92 = [NSNumber numberWithBool:v19->_isDefaultPairedDevice];
          if (v92) {
            CFDictionarySetValue(v82, (const void *)*MEMORY[0x1E4F6AE28], v92);
          }

          if (v80 && ![v80 integerValue])
          {
            v19->_mtu = 1378;
            [(__CFDictionary *)v82 setObject:@"udp" forKey:@"protocol"];
          }
          v93 = +[IDSDaemonController sharedInstance];
          [v93 openSocketWithOptions:v82];

          dispatch_time_t v94 = dispatch_time(0, 1000000000 * [(NSNumber *)v19->_clientTimeout intValue]);
          v95 = +[IDSInternalQueueController sharedInstance];
          v96 = [v95 queue];
          v101[0] = MEMORY[0x1E4F143A8];
          v101[1] = 3221225472;
          v101[2] = sub_19198968C;
          v101[3] = &unk_1E5729000;
          v19 = v19;
          v102 = v19;
          dispatch_after(v94, v96, v101);

          id v12 = v99;
          goto LABEL_26;
        }
        v65 = +[IDSTransportLog IDSDeviceConnection];
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          v66 = v19->_clientTimeout;
          *(_DWORD *)buf = 134218242;
          v108 = v19;
          __int16 v109 = 2112;
          *(void *)v110 = v66;
          _os_log_impl(&dword_19190B000, v65, OS_LOG_TYPE_DEFAULT, "<%p> The client passed the smaller timeout %@ than the default value. IDSDeviceConnection will use the default value.", buf, 0x16u);
        }
      }
      else
      {
        p_clientTimeout = (void **)&v19->_clientTimeout;
      }
      v67 = *p_clientTimeout;
      *p_clientTimeout = &unk_1EE28B2E0;

      goto LABEL_43;
    }
LABEL_20:
    v32 = +[IDSLogging IDSDeviceConnection];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_191A33EA0(v10);
    }

    id v33 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v29 = objc_msgSend(v33, "initWithObjectsAndKeys:", @"Bad parameters. No valid IDSDevice found.", *MEMORY[0x1E4F28568], 0);
    id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v31 = 20;
    goto LABEL_23;
  }
LABEL_27:

  return v19;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:0 object:0];

  [(_IDSDeviceConnection *)self _close];
  v4 = +[IDSDaemonController sharedInstance];
  [v4 removeListenerID:self->_serviceToken];

  v5 = +[IDSDaemonController sharedInstance];
  v6 = [v5 listener];
  [v6 removeHandler:self];

  [(_IDSDeviceConnection *)self _cleanupCompletionBlock];
  v7.receiver = self;
  v7.super_class = (Class)_IDSDeviceConnection;
  [(_IDSDeviceConnection *)&v7 dealloc];
}

- (void)_connect
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A34108();
    }
  }
  v6 = +[IDSDaemonController sharedInstance];
  char v7 = [v6 hasListenerForID:self->_serviceToken];

  if ((v7 & 1) == 0)
  {
    v8 = +[IDSDaemonController sharedInstance];
    serviceToken = self->_serviceToken;
    id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:self->_service];
    LOBYTE(serviceToken) = [v8 addListenerID:serviceToken services:v10];

    if ((serviceToken & 1) == 0)
    {
      id v11 = +[IDSLogging IDSDeviceConnection];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_191A3408C();
      }
    }
  }
}

- (int)socket
{
  return self->_socket;
}

- (NSInputStream)inputStream
{
  return self->_inputStreamForSocket;
}

- (NSOutputStream)outputStream
{
  return self->_outputStreamForSocket;
}

- (unint64_t)mtu
{
  return self->_mtu;
}

- (NSDictionary)metrics
{
  awdMetrics = self->_awdMetrics;
  if (awdMetrics)
  {
    v41 = [(NSMutableDictionary *)awdMetrics objectForKeyedSubscript:*MEMORY[0x1E4F6ADD0]];
    int v4 = [(NSMutableDictionary *)self->_awdMetrics objectForKeyedSubscript:*MEMORY[0x1E4F6ADD8]];
    uint64_t v5 = [v4 BOOLValue];

    v6 = [(NSMutableDictionary *)self->_awdMetrics objectForKeyedSubscript:*MEMORY[0x1E4F6ADB0]];
    char v7 = [(NSMutableDictionary *)self->_awdMetrics objectForKeyedSubscript:*MEMORY[0x1E4F6ADB8]];
    v8 = [(NSMutableDictionary *)self->_awdMetrics objectForKeyedSubscript:*MEMORY[0x1E4F6ADC8]];
    v38 = [(NSMutableDictionary *)self->_awdMetrics objectForKeyedSubscript:*MEMORY[0x1E4F6ADC0]];
    [v8 doubleValue];
    double v10 = v9;
    uint64_t v40 = v6;
    [v6 doubleValue];
    unint64_t v12 = llround((v10 - v11) * 1000.0);
    v39 = v7;
    [v7 doubleValue];
    double v14 = v13;
    [v6 doubleValue];
    unint64_t v16 = llround((v14 - v15) * 1000.0);
    [v38 doubleValue];
    double v18 = v17;
    [v8 doubleValue];
    uint64_t v20 = llround((v18 - v19) * 1000.0);
    [v7 doubleValue];
    double v22 = v21;
    [v38 doubleValue];
    unint64_t v24 = llround((v22 - v23) * 1000.0);
    v37 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v36 = *MEMORY[0x1E4F6AE00];
    v25 = [NSNumber numberWithBool:v5];
    uint64_t v26 = *MEMORY[0x1E4F6AE08];
    v27 = [NSNumber numberWithLongLong:v12];
    uint64_t v28 = *MEMORY[0x1E4F6ADE8];
    v29 = [NSNumber numberWithLongLong:v16];
    uint64_t v30 = *MEMORY[0x1E4F6ADE0];
    uint64_t v31 = [NSNumber numberWithLongLong:v20 & ~(v20 >> 63)];
    uint64_t v32 = *MEMORY[0x1E4F6ADF8];
    id v33 = [NSNumber numberWithLongLong:v24];
    v34 = objc_msgSend(v37, "dictionaryWithObjectsAndKeys:", v41, v36, v25, v26, v27, v28, v29, v30, v31, v32, v33, *MEMORY[0x1E4F6ADF0], 0);
  }
  else
  {
    v34 = 0;
  }

  return (NSDictionary *)v34;
}

- (void)setStreamPairWithInputStream:(id)a3 outputStream:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v7 = (NSInputStream *)a3;
  v8 = (NSOutputStream *)a4;
  double v9 = +[IDSInternalQueueController sharedInstance];
  int v10 = [v9 assertQueueIsCurrent];

  if (v10)
  {
    double v11 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A341A0();
    }
  }
  unint64_t v12 = +[IDSLogging IDSDeviceConnection];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134218498;
    double v18 = self;
    __int16 v19 = 2112;
    uint64_t v20 = v7;
    __int16 v21 = 2112;
    double v22 = v8;
    _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_DEFAULT, "<%p> Updating stream pair: %@:%@", (uint8_t *)&v17, 0x20u);
  }

  inputStreamForSocket = self->_inputStreamForSocket;
  if (inputStreamForSocket != v7)
  {
    [(NSInputStream *)inputStreamForSocket close];
    objc_storeStrong((id *)&self->_inputStreamForSocket, a3);
  }
  outputStreamForSocket = self->_outputStreamForSocket;
  p_outputStreamForSocket = &self->_outputStreamForSocket;
  double v14 = outputStreamForSocket;
  if (outputStreamForSocket != v8)
  {
    [(NSOutputStream *)v14 close];
    objc_storeStrong((id *)p_outputStreamForSocket, a4);
  }
}

- (BOOL)updateConnectionWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = +[IDSInternalQueueController sharedInstance];
  int v8 = [v7 assertQueueIsCurrent];

  if (v8)
  {
    double v9 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_191A34238();
    }
  }
  if (self->_socket < 0)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    double v11 = objc_msgSend(v17, "initWithObjectsAndKeys:", @"Cannot change priority when not connected", *MEMORY[0x1E4F28568], 0);
    if (a4)
    {
      BOOL v14 = 0;
      *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:20 userInfo:v11];
      goto LABEL_24;
    }
LABEL_23:
    BOOL v14 = 0;
    goto LABEL_24;
  }
  int v10 = [v6 objectForKey:*MEMORY[0x1E4F6AE10]];
  double v11 = v10;
  if (!v10)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v19 = objc_msgSend(v18, "initWithObjectsAndKeys:", @"Options dictionary contains no valid options", *MEMORY[0x1E4F28568], 0);
LABEL_20:
    __int16 v21 = (void *)v19;
    if (a4) {
      *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:29 userInfo:v19];
    }

    goto LABEL_23;
  }
  uint64_t v12 = [v10 integerValue];
  if (v12 != 100 && v12 != 300 && v12 != 200)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v19 = objc_msgSend(v20, "initWithObjectsAndKeys:", @"Invalid priority level specified", *MEMORY[0x1E4F28568], 0);
    goto LABEL_20;
  }
  int v23 = TrafficClassForIDSOpenSocketPriorityLevel();
  int v13 = setsockopt(self->_socket, 0xFFFF, 4230, &v23, 4u);
  BOOL v14 = v13 == 0;
  if (v13)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    unint64_t v16 = objc_msgSend(v15, "initWithObjectsAndKeys:", @"Could not set traffic class for underlying socket", *MEMORY[0x1E4F28568], 0);
    if (a4) {
      *a4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.identityservices.error" code:20 userInfo:v16];
    }
  }
  else
  {
    unint64_t v16 = +[IDSTransportLog IDSDeviceConnection];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v25 = self;
      __int16 v26 = 1024;
      int v27 = v23;
      _os_log_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEFAULT, "<%p> Updated socket traffic class: %d", buf, 0x12u);
    }
  }

LABEL_24:
  return v14;
}

- (void)close
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A342D0();
    }
  }
  [(_IDSDeviceConnection *)self _close];
}

- (void)_close
{
  *(void *)&v35[13] = *MEMORY[0x1E4F143B8];
  if (self->_socket < 0 && !self->_openSocketCompletionHandler) {
    return;
  }
  v3 = [(_IDSDeviceConnection *)self deviceConnectionKey];
  int v4 = +[_IDSDeviceConnectionActiveMap sharedInstance];
  int v5 = [v4 hasActiveConnection:self->_connectionUUID forKey:v3];

  id v6 = +[IDSTransportLog IDSDeviceConnection];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int socket = self->_socket;
      streamName = self->_streamName;
      *(_DWORD *)buf = 134218498;
      id v33 = self;
      __int16 v34 = 1024;
      *(_DWORD *)v35 = socket;
      v35[2] = 2112;
      *(void *)&v35[3] = streamName;
      _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "<%p> Closing socket: %d (name %@)", buf, 0x1Cu);
    }

    int v10 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v11 = *MEMORY[0x1E4F6B128];
    uint64_t v12 = *MEMORY[0x1E4F6B188];
    v30[0] = *MEMORY[0x1E4F6B130];
    v30[1] = v12;
    service = self->_service;
    v31[0] = v11;
    v31[1] = service;
    uint64_t v14 = *MEMORY[0x1E4F6B198];
    uint64_t v15 = *MEMORY[0x1E4F6B190];
    uint64_t v16 = *MEMORY[0x1E4F6B140];
    v30[2] = *MEMORY[0x1E4F6B198];
    v30[3] = v16;
    clientName = self->_clientName;
    v31[2] = v15;
    v31[3] = clientName;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:4];
    id v6 = [v10 dictionaryWithDictionary:v18];

    nsuuid = self->_nsuuid;
    if (nsuuid) {
      [v6 setObject:nsuuid forKey:*MEMORY[0x1E4F6AE80]];
    }
    id v20 = [NSNumber numberWithBool:self->_isDefaultPairedDevice];
    [v6 setObject:v20 forKey:*MEMORY[0x1E4F6AE28]];

    __int16 v21 = self->_streamName;
    if (v21) {
      [v6 setObject:v21 forKey:v14];
    }
    awdMetrics = self->_awdMetrics;
    if (awdMetrics)
    {
      int v23 = [(NSMutableDictionary *)awdMetrics objectForKeyedSubscript:*MEMORY[0x1E4F6ADB8]];
      unint64_t v24 = [(NSMutableDictionary *)self->_awdMetrics objectForKeyedSubscript:*MEMORY[0x1E4F6ADD8]];
      if (v23) {
        [v6 setObject:v23 forKey:*MEMORY[0x1E4F6B118]];
      }
      if (v24) {
        [v6 setObject:v24 forKey:*MEMORY[0x1E4F6B120]];
      }
    }
    [v6 setObject:self->_connectionUUID forKey:*MEMORY[0x1E4F6B150]];
    v25 = +[IDSDaemonController sharedInstance];
    [v25 closeSocketWithOptions:v6];

    __int16 v26 = +[_IDSDeviceConnectionActiveMap sharedInstance];
    [v26 removeActiveConnection:self->_connectionUUID forKey:v3];
    goto LABEL_19;
  }
  if (v7)
  {
    __int16 v26 = [(_IDSDeviceConnection *)self deviceConnectionKey];
    *(_DWORD *)buf = 134218242;
    id v33 = self;
    __int16 v34 = 2112;
    *(void *)v35 = v26;
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "<%p> Closing socket: skipped, a new connection for this %@", buf, 0x16u);
LABEL_19:
  }
  inputStreamForSocket = self->_inputStreamForSocket;
  if (inputStreamForSocket)
  {
    [(NSInputStream *)inputStreamForSocket open];
    [(NSInputStream *)self->_inputStreamForSocket close];
    uint64_t v28 = self->_inputStreamForSocket;
    self->_inputStreamForSocket = 0;

    [(NSOutputStream *)self->_outputStreamForSocket open];
    [(NSOutputStream *)self->_outputStreamForSocket close];
    outputStreamForSocket = self->_outputStreamForSocket;
    self->_outputStreamForSocket = 0;
  }
  else
  {
    close(self->_socket);
  }
  [(_IDSDeviceConnection *)self _cleanupCompletionBlock];
  self->_int socket = -1;
}

- (void)xpcObject:(id)a3 objectContext:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 objectForKey:@"object-type"];
  int v9 = [v8 isEqualToIgnoringCase:@"device-socket"];

  if (v9)
  {
    int v10 = [v7 objectForKey:@"completionHandlerID"];
    uint64_t v11 = [v7 objectForKey:@"metrics"];
    uint64_t v12 = +[IDSLogging IDSDeviceConnection];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      openSocketCompletionHandlerID = self->_openSocketCompletionHandlerID;
      *(_DWORD *)buf = 134218498;
      *(void *)v51 = self;
      *(_WORD *)&v51[8] = 2112;
      *(void *)&v51[10] = openSocketCompletionHandlerID;
      *(_WORD *)&v51[18] = 2112;
      *(void *)&v51[20] = v10;
      _os_log_impl(&dword_19190B000, v12, OS_LOG_TYPE_INFO, "<%p> World, id[%@] !=? id[%@]", buf, 0x20u);
    }

    if (![v10 isEqualToString:self->_openSocketCompletionHandlerID]) {
      goto LABEL_43;
    }
    uint64_t v14 = +[IDSLogging IDSDeviceConnection];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      *(void *)v51 = self;
      *(_WORD *)&v51[8] = 2112;
      *(void *)&v51[10] = v6;
      *(_WORD *)&v51[18] = 2112;
      *(void *)&v51[20] = v7;
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "<%p> xpc object: [%@] context: [%@]", buf, 0x20u);
    }

    if (v6) {
      int v15 = xpc_fd_dup(v6);
    }
    else {
      int v15 = -1;
    }
    self->_int socket = v15;
    uint64_t v16 = [v7 objectForKey:@"error"];
    id v17 = +[IDSLogging IDSDeviceConnection];
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (!v18) {
        goto LABEL_16;
      }
      int socket = self->_socket;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v51 = socket;
      *(_WORD *)&v51[4] = 2112;
      *(void *)&v51[6] = v16;
      id v20 = "Received XPC Response/Socket: %d    Error: %@";
      __int16 v21 = v17;
      uint32_t v22 = 18;
    }
    else
    {
      if (!v18) {
        goto LABEL_16;
      }
      int v23 = self->_socket;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v51 = v23;
      id v20 = "Received XPC Response/Socket: %d";
      __int16 v21 = v17;
      uint32_t v22 = 8;
    }
    _os_log_impl(&dword_19190B000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
LABEL_16:

    unint64_t v24 = +[IDSTransportLog IDSDeviceConnection];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v45 = v15;
      v25 = v11;
      int v26 = self->_socket;
      if (v26 == -1) {
        int v27 = @"NO";
      }
      else {
        int v27 = @"YES";
      }
      if (v16)
      {
        uint64_t v28 = [NSString stringWithFormat:@"Error: %@", v16];
      }
      else
      {
        uint64_t v28 = &stru_1EE2476E8;
      }
      v29 = self->_openSocketCompletionHandlerID;
      *(_DWORD *)buf = 134219010;
      *(void *)v51 = self;
      *(_WORD *)&v51[8] = 1024;
      *(_DWORD *)&v51[10] = v26;
      *(_WORD *)&v51[14] = 2112;
      *(void *)&v51[16] = v27;
      *(_WORD *)&v51[24] = 2112;
      *(void *)&v51[26] = v28;
      __int16 v52 = 2112;
      v53 = v29;
      _os_log_impl(&dword_19190B000, v24, OS_LOG_TYPE_DEFAULT, "<%p> Opened socket: %d (Success: %@) %@ (%@)", buf, 0x30u);
      if (v16) {

      }
      uint64_t v11 = v25;
      int v15 = v45;
    }

    if (!self->_awdMetrics) {
      goto LABEL_35;
    }
    if (v11)
    {
      uint64_t v30 = (NSMutableDictionary *)[v11 mutableCopy];
      awdMetrics = self->_awdMetrics;
      self->_awdMetrics = v30;
    }
    if (v15 == -1)
    {
      uint64_t v32 = self->_awdMetrics;
    }
    else
    {
      uint64_t v32 = self->_awdMetrics;
      if (!self->_hasTimedOut)
      {
        uint64_t v33 = *MEMORY[0x1E4F6ADD8];
        uint64_t v34 = MEMORY[0x1E4F1CC38];
LABEL_34:
        [(NSMutableDictionary *)v32 setObject:v34 forKeyedSubscript:v33];
        v35 = NSNumber;
        ids_monotonic_time();
        uint64_t v36 = objc_msgSend(v35, "numberWithDouble:");
        [(NSMutableDictionary *)self->_awdMetrics setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F6ADB8]];

LABEL_35:
        if (self->_hasTimedOut)
        {
          v37 = +[IDSTransportLog IDSDeviceConnection];
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            int v38 = self->_socket;
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v51 = v38;
            _os_log_impl(&dword_19190B000, v37, OS_LOG_TYPE_DEFAULT, "Open socket request already timed out, closing %d.", buf, 8u);
          }

          [(_IDSDeviceConnection *)self close];
        }
        else
        {
          v39 = (void *)MEMORY[0x192FE03B0](self->_openSocketCompletionHandler);
          openSocketCompletionHandlerQueue = self->_openSocketCompletionHandlerQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_19198AC00;
          block[3] = &unk_1E572B7A0;
          id v41 = v39;
          id v48 = v41;
          int v49 = v15;
          id v47 = v16;
          dispatch_async(openSocketCompletionHandlerQueue, block);
          [(_IDSDeviceConnection *)self _cleanupCompletionBlock];
          if (v16)
          {
            v42 = +[_IDSDeviceConnectionActiveMap sharedInstance];
            connectionUUID = self->_connectionUUID;
            uint64_t v44 = [(_IDSDeviceConnection *)self deviceConnectionKey];
            [v42 removeActiveConnection:connectionUUID forKey:v44];
          }
        }

LABEL_43:
        goto LABEL_44;
      }
    }
    uint64_t v33 = *MEMORY[0x1E4F6ADD8];
    uint64_t v34 = MEMORY[0x1E4F1CC28];
    goto LABEL_34;
  }
LABEL_44:
}

- (void)_cleanupCompletionBlock
{
  id openSocketCompletionHandler = self->_openSocketCompletionHandler;
  if (openSocketCompletionHandler)
  {
    self->_id openSocketCompletionHandler = 0;
  }
  openSocketCompletionHandlerQueue = self->_openSocketCompletionHandlerQueue;
  if (openSocketCompletionHandlerQueue)
  {
    self->_openSocketCompletionHandlerQueue = 0;
  }
  openSocketCompletionHandlerID = self->_openSocketCompletionHandlerID;
  if (openSocketCompletionHandlerID)
  {
    self->_openSocketCompletionHandlerID = 0;
  }
}

- (void)_daemonDied:(id)a3
{
  int v4 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19198AD54;
  v5[3] = &unk_1E5729000;
  v5[4] = self;
  [v4 performBlock:v5];
}

- (id)deviceConnectionKey
{
  return (id)[NSString stringWithFormat:@"%@_%@", self->_service, self->_streamName];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awdMetrics, 0);
  objc_storeStrong((id *)&self->_clientTimeout, 0);
  objc_storeStrong((id *)&self->_outputStreamForSocket, 0);
  objc_storeStrong((id *)&self->_inputStreamForSocket, 0);
  objc_storeStrong((id *)&self->_openSocketCompletionHandlerID, 0);
  objc_storeStrong((id *)&self->_openSocketCompletionHandlerQueue, 0);
  objc_storeStrong(&self->_openSocketCompletionHandler, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_serviceToken, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_nsuuid, 0);
}

@end