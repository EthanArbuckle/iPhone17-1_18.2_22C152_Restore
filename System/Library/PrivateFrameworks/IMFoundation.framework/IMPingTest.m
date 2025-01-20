@interface IMPingTest
- (BOOL)writeResultsToFile:(id)a3 error:(id *)a4;
- (IMPingTest)initWithAddress:(id)a3 wifi:(BOOL)a4;
- (double)longTimeInterval;
- (double)secondsToRun;
- (id)pingStats;
- (id)pingStats:(double)a3;
- (int)_setupAndPerformPing:(double)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)_doPingWithSocket:(int)a3 address:(sockaddr_in)a4 timeToRunTestInSeconds:(double)a5 pingTimeout:(double)a6 queue:(id)a7 completionHandler:(id)a8;
- (void)_setupReadSource:(int)a3 address:(sockaddr_in)a4 icmID:(unsigned __int16)a5 queue:(id)a6 completionHander:(id)a7;
- (void)dealloc;
- (void)startWithTimeout:(double)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)stop;
@end

@implementation IMPingTest

- (IMPingTest)initWithAddress:(id)a3 wifi:(BOOL)a4
{
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)IMPingTest;
  v9 = [(IMPingTest *)&v27 init];
  if (v9)
  {
    if (objc_msgSend_isEqualToString_(v6, v7, IMPingTestDefaultGateway, v8))
    {
      v13 = objc_msgSend_sharedInstance(NetworkChangeNotifier, v10, v11, v12);
      v17 = objc_msgSend_myGatewayAddress(v13, v14, v15, v16);
      uint64_t v21 = objc_msgSend_copy(v17, v18, v19, v20);
      address = v9->_address;
      v9->_address = (NSString *)v21;
    }
    else
    {
      uint64_t v23 = objc_msgSend_copy(v6, v10, v11, v12);
      v13 = v9->_address;
      v9->_address = (NSString *)v23;
    }

    v9->_usesWifi = a4;
    v24 = objc_alloc_init(_IMPingStatisticsCollector);
    id collector = v9->_collector;
    v9->_id collector = v24;
  }
  return v9;
}

- (void)dealloc
{
  objc_msgSend_stop(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)IMPingTest;
  [(IMPingTest *)&v5 dealloc];
}

- (void)startWithTimeout:(double)a3 queue:(id)a4 completionHandler:(id)a5
{
  dispatch_queue_t v8 = (dispatch_queue_t)a4;
  id v9 = a5;
  if (_IMWillLog(@"IMPingTest")) {
    _IMAlwaysLog(0, @"IMPingTest", @"_startWithTimeout:%f", v12, v13, v14, v15, v16, SLOBYTE(a3));
  }
  if (!v8) {
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.imcore.impingtest", 0);
  }
  v17 = objc_msgSend_copy(v9, v10, v11, v12);
  v18 = self;
  objc_sync_enter(v18);
  BOOL isRunning = v18->_isRunning;
  if (!isRunning)
  {
    v18->_secondsToRun = a3;
    v18->_BOOL isRunning = 1;
  }
  objc_sync_exit(v18);

  if (v8)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1918DEC18;
    block[3] = &unk_1E5724790;
    BOOL v24 = !isRunning;
    block[4] = v18;
    double v23 = a3;
    dispatch_queue_t v21 = v8;
    id v22 = v17;
    dispatch_async(v21, block);
  }
}

- (void)stop
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL isRunning = 0;
  sendTimer = obj->_sendTimer;
  if (sendTimer)
  {
    dispatch_source_cancel(sendTimer);
    uint64_t v3 = obj->_sendTimer;
    obj->_sendTimer = 0;
  }
  socketReadSource = obj->_socketReadSource;
  if (socketReadSource)
  {
    dispatch_source_cancel(socketReadSource);
    objc_super v5 = obj->_socketReadSource;
    obj->_socketReadSource = 0;
  }
  objc_sync_exit(obj);
}

- (id)pingStats
{
  return (id)objc_msgSend_pingStats(self->_collector, a2, v2, v3);
}

- (id)pingStats:(double)a3
{
  return (id)((uint64_t (*)(id, char *))MEMORY[0x1F4181798])(self->_collector, sel_pingStatsForLastNSeconds_);
}

- (BOOL)writeResultsToFile:(id)a3 error:(id *)a4
{
  return MEMORY[0x1F4181798](self->_collector, sel_logStatsToFile_error_, a3, a4);
}

- (int)_setupAndPerformPing:(double)a3 queue:(id)a4 completionHandler:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (_IMWillLog(@"IMPingTest")) {
    _IMAlwaysLog(0, @"IMPingTest", @"_setupAndPerformPing", v12, v13, v14, v15, v16, v56);
  }
  if (!self->_isRunning)
  {
    int v19 = 4;
    goto LABEL_29;
  }
  v17 = (const char *)objc_msgSend_UTF8String(self->_address, v10, v11, v12);
  if (v17)
  {
    v18 = v17;
    LODWORD(v61) = 0;
    uint64_t v62 = 0;
    HIDWORD(v61) = inet_addr(v17);
    if (HIDWORD(v61) != -1)
    {
      BYTE1(v61) = 2;
      goto LABEL_13;
    }
    v29 = gethostbyname(v18);
    if (v29)
    {
      BYTE1(v61) = v29->h_addrtype;
      __memcpy_chk();
LABEL_13:
      BOOL usesWifi = self->_usesWifi;
      int v58 = 51200;
      v57[1] = 0xAAAAAAAA00000000;
      v31 = getprotobyname("icmp");
      if (v31)
      {
        uint64_t v32 = socket(2, 2, v31->p_proto);
        int v19 = 1;
        if ((v32 & 0x80000000) != 0) {
          goto LABEL_24;
        }
        uint64_t v33 = v32;
        fcntl(v32, 4, 4);
        uint64_t v34 = setsockopt(v33, 0xFFFF, 4098, &v58, 4u);
        int v60 = 1;
        if (usesWifi)
        {
          setsockopt(v33, 0, 6969, &v60, 4u);
        }
        else
        {
          v35 = (void *)MEMORY[0x192FDE5A0](v34);
          v36 = (const void *)IMPCInterfaceName();
          v37 = (__CFString *)CFRetain(v36);
          uint64_t v41 = objc_msgSend_length(v37, v38, v39, v40);
          v42 = @"pdp_ip0";
          if (v41) {
            v42 = v37;
          }
          v43 = v42;

          v44 = v43;
          v48 = (const char *)objc_msgSend_UTF8String(v44, v45, v46, v47);

          unsigned int v59 = if_nametoindex(v48);
          setsockopt(v33, 0, 25, &v59, 4u);
        }
        v57[0] = 1;
        if (setsockopt(v33, 0xFFFF, 4102, v57, 0x10u))
        {
          close(v33);
          int v19 = *__error();
          if (v19)
          {
LABEL_24:
            if (_IMWillLog(@"IMPingTest")) {
              _IMAlwaysLog(0, @"IMPingTest", @"Error creating socket %d", v50, v51, v52, v53, v54, v19);
            }
            goto LABEL_29;
          }
          uint64_t v33 = 0xFFFFFFFFLL;
        }
        objc_msgSend__doPingWithSocket_address_timeToRunTestInSeconds_pingTimeout_queue_completionHandler_(self, v49, v33, v61, v62, v8, v9, a3, 2.0);
        int v19 = 0;
        goto LABEL_29;
      }
      int v19 = 46;
      goto LABEL_24;
    }
    int v19 = 65;
  }
  else
  {
    int v19 = 22;
  }
  if (_IMWillLog(@"IMPingTest"))
  {
    char v23 = objc_msgSend_UTF8String(self->_address, v20, v21, v22);
    _IMAlwaysLog(0, @"IMPingTest", @"Error _LookupHostAddress %s", v24, v25, v26, v27, v28, v23);
  }
LABEL_29:

  return v19;
}

- (void)_doPingWithSocket:(int)a3 address:(sockaddr_in)a4 timeToRunTestInSeconds:(double)a5 pingTimeout:(double)a6 queue:(id)a7 completionHandler:(id)a8
{
  uint64_t v11 = *(void *)a4.sin_zero;
  uint64_t v12 = *(void *)&a4.sin_len;
  uint64_t v13 = *(void *)&a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = a7;
  id v16 = a8;
  if (_IMWillLog(@"IMPingTest")) {
    _IMAlwaysLog(0, @"IMPingTest", @"_doPing: %d", v17, v18, v19, v20, v21, v13);
  }
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  __int16 v34 = 0;
  double v22 = IMTimeOfDay();
  id v23 = self->_collector;
  uint32_t v24 = arc4random();
  if (v15)
  {
    unsigned int v26 = v24 % 0xFFFF;
    objc_msgSend__setupReadSource_address_icmID_queue_completionHander_(self, v25, v13, v12, v11, v24 % 0xFFFF, v15, v16);
    uint64_t v27 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v15);
    sendTimer = self->_sendTimer;
    self->_sendTimer = v27;

    v29 = self->_sendTimer;
    if (v29)
    {
      dispatch_time_t v30 = dispatch_walltime(0, 0);
      dispatch_source_set_timer(v29, v30, 0x3B9ACA00uLL, 0x5F5E100uLL);
      v31 = self->_sendTimer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = sub_1918DF340;
      handler[3] = &unk_1E57247B8;
      double v38 = v22;
      double v39 = a5;
      uint64_t v41 = v12;
      uint64_t v42 = v11;
      handler[4] = self;
      v37 = v33;
      int v43 = v13;
      __int16 v44 = v26;
      id v36 = v23;
      double v40 = a6;
      dispatch_source_set_event_handler(v31, handler);
      dispatch_resume((dispatch_object_t)self->_sendTimer);
      socketReadSource = self->_socketReadSource;
      if (socketReadSource) {
        dispatch_resume(socketReadSource);
      }
    }
  }

  _Block_object_dispose(v33, 8);
}

- (void)_setupReadSource:(int)a3 address:(sockaddr_in)a4 icmID:(unsigned __int16)a5 queue:(id)a6 completionHander:(id)a7
{
  uint64_t v9 = *(void *)a4.sin_zero;
  uint64_t v10 = *(void *)&a4.sin_len;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v13 = a7;
  uint64_t v14 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14478], a3, 0, (dispatch_queue_t)a6);
  socketReadSource = self->_socketReadSource;
  self->_socketReadSource = v14;

  id v16 = self->_socketReadSource;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1918DF6D4;
  v19[3] = &unk_1E57247E0;
  int v21 = a3;
  v19[4] = self;
  id v20 = v13;
  id v17 = v13;
  dispatch_source_set_cancel_handler(v16, v19);
  uint64_t v18 = self->_socketReadSource;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_1918DF780;
  handler[3] = &unk_1E5724808;
  handler[4] = self;
  int v23 = a3;
  uint64_t v24 = v10;
  uint64_t v25 = v9;
  unsigned __int16 v26 = a5;
  dispatch_source_set_event_handler(v18, handler);
}

- (double)longTimeInterval
{
  return 1000000.0;
}

- (double)secondsToRun
{
  return self->_secondsToRun;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socketReadSource, 0);
  objc_storeStrong((id *)&self->_sendTimer, 0);
  objc_storeStrong(&self->_collector, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end