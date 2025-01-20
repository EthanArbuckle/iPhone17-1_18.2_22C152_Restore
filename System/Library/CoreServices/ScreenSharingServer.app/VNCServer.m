@interface VNCServer
- (BOOL)screenLocked;
- (IDSSessionEmbeddedControllerBase)sessionController;
- (NSString)machineName;
- (VNCServer)init;
- (int)sessionType;
- (int64_t)writeData:(const void *)a3 length:(unint64_t)a4;
- (void)consumeMessage;
- (void)dealloc;
- (void)handleIncomingData:(char *)a3 dataSize:(unsigned int)a4;
- (void)handleTouchEventUpdate;
- (void)notificationHandler:(id)a3;
- (void)sendPauseMessage:(unint64_t)a3;
- (void)sendScreenLockChangeMessage:(unint64_t)a3;
- (void)setMachineName:(id)a3;
- (void)setScreenLocked:(BOOL)a3;
- (void)setSessionController:(id)a3;
- (void)setSessionType:(int)a3;
- (void)startScreenSharingSession:(int)a3 NWConnectionManager:(void *)a4 sessionController:(id)a5;
- (void)stopUDPSend;
- (void)termsAndConditionsAccepted;
- (void)userRequestResult:(int)a3 senderToken:(unsigned int)a4;
@end

@implementation VNCServer

- (VNCServer)init
{
  v4.receiver = self;
  v4.super_class = (Class)VNCServer;
  v2 = [(VNCServer *)&v4 init];
  if (v2) {
    objc_storeStrong((id *)&qword_10005C928, v2);
  }
  return v2;
}

- (void)dealloc
{
  [(VNCServer *)self setMachineName:0];
  [(VNCServer *)self setSessionController:0];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  xpc_transaction_end();
  free(self->_lastTouchInfo);
  v4.receiver = self;
  v4.super_class = (Class)VNCServer;
  [(VNCServer *)&v4 dealloc];
}

- (int64_t)writeData:(const void *)a3 length:(unint64_t)a4
{
  return 0;
}

- (void)handleIncomingData:(char *)a3 dataSize:(unsigned int)a4
{
  unsigned __int16 v4 = a4;
  if ([(VNCServer *)self sessionType] == 1) {
    sub_100029BE4((uint64_t)self->viewer.receiveInfo, (unsigned __int16 *)a3, v4);
  }
  if (sub_10002F5EC((uint64_t)self->viewer.ndata))
  {
    [(VNCServer *)self consumeMessage];
  }
}

- (void)startScreenSharingSession:(int)a3 NWConnectionManager:(void *)a4 sessionController:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "new screen sharing connection", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 167, "-[VNCServer startScreenSharingSession:NWConnectionManager:sessionController:]", 7, 0, "new screen sharing connection");
  [(VNCServer *)self setSessionType:v6];
  v9 = +[UIDevice currentDevice];
  v10 = [v9 name];
  [(VNCServer *)self setMachineName:v10];

  [(VNCServer *)self setSessionController:v8];
  if (v6 == 1)
  {
    v11 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    readyToAuthSemaphore = self->_readyToAuthSemaphore;
    self->_readyToAuthSemaphore = v11;

    v13 = (char *)malloc_type_calloc(1uLL, 0xCD0uLL, 0x10A0040E3A9E06DuLL);
    self->viewer.sendInfo = (RFBSenderInfoUDP *)v13;
    *((_WORD *)v13 + 1351) = 1;
    *(_DWORD *)(v13 + 2706) = 393217;
    v14 = malloc_type_calloc(1uLL, 0x78uLL, 0x10000401D800FF3uLL);
    *((void *)v13 + 406) = v14;
    int v15 = sub_10002B5E0();
    v14[92] = 0;
    *((_DWORD *)v14 + 2) = -1;
    *((_DWORD *)v14 + 12) = v15;
    *((_DWORD *)v14 + 9) = v15;
    v16 = malloc_type_calloc(1uLL, 0x1CuLL, 0x737CB250uLL);
    *((void *)v13 + 404) = v16;
    unsigned char *v16 = 0;
    *((_WORD *)v13 + 1350) = 0;
    v13[2681] = 1;
    *((_WORD *)v13 + 56) = 4;
    *((_DWORD *)v13 + 674) = -1;
    v13[114] = 4;
    v17 = (char *)malloc_type_calloc(1uLL, 0x5C0uLL, 0x10B0040C87F9819uLL);
    self->viewer.receiveInfo = (RFBReceiverInfoUDP *)v17;
    *((_DWORD *)v17 + 343) = 1;
    *(void *)(v17 + 60) = 0x100000001;
    *(_DWORD *)v17 = -1;
    v17[8] = 1;
    *((_DWORD *)v17 + 340) = 42;
    *((void *)v17 + 182) = self->viewer.sendInfo;
    *((_DWORD *)v17 + 11) = 1;
    v17[11] = 0;
    sub_10002A440((uint64_t)v17);
    *(void *)(v17 + 60) = 0x100000001;
    v17[17] = 0;
    v17[1353] = 4;
    sub_10002E8EC(0x80000uLL, (void *)v17 + 172);
    self->viewer.ndata = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*((void *)v17 + 172);
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "going to start read", v27, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 195, "-[VNCServer startScreenSharingSession:NWConnectionManager:sessionController:]", 7, 0, "going to start read");
    [a4 startRead:self];
    sub_10001A5D8((uint64_t)self->viewer.sendInfo);
    *((unsigned char *)self->viewer.receiveInfo + 1440) = 1;
    sendInfo = self->viewer.sendInfo;
    *((unsigned char *)sendInfo + 115) = 1;
    *((void *)sendInfo + 408) = a4;
    *((unsigned char *)sendInfo + 3272) = 1;
    self->viewer.AppleCare = 1;
    sub_10002460C((uint64_t)&self->viewer, "RFB 003.889\n", 0xCu);
    self->state = 1;
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "wrote server protocol version", v26, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 212, "-[VNCServer startScreenSharingSession:NWConnectionManager:sessionController:]", 7, 0, "wrote server protocol version");
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100036C74(v6, v19, v20, v21, v22, v23, v24, v25);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 206, "-[VNCServer startScreenSharingSession:NWConnectionManager:sessionController:]", 3, 0, "invalid session type %d");
  }
}

- (void)stopUDPSend
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "stop UDP send thread", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 218, "-[VNCServer stopUDPSend]", 7, 0, "stop UDP send thread");
  sub_10001BCF8((uint64_t)self->viewer.sendInfo);
  int monitoringTouchEvents = self->viewer.monitoringTouchEvents;
  BOOL v4 = sub_100035448();
  if (monitoringTouchEvents)
  {
    if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "stop monitoring touch events", v6, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 222, "-[VNCServer stopUDPSend]", 7, 0, "stop monitoring touch events");
    self->viewer.int monitoringTouchEvents = 0;
    sub_1000297F0();
  }
  else
  {
    if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "was not monitoring touch events", v5, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 227, "-[VNCServer stopUDPSend]", 7, 0, "was not monitoring touch events");
  }
}

- (void)sendPauseMessage:(unint64_t)a3
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "video is paused %llu", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 233, "-[VNCServer sendPauseMessage:]", 7, 0, "video is paused %llu", a3);
  sub_100033664(a3 != 0);
  if (a3) {
    sub_100036038(0, 0, 0.0, 0.0);
  }
  if (self->viewer.info.viewerInfoSet && (self->viewer.info.supportedCommands[2] & 8) != 0)
  {
    p_viewer = &self->viewer;
    uint64_t v6 = malloc_type_calloc(1uLL, 0x16uLL, 0xE3327A92uLL);
    v6[6] = 0;
    *((_DWORD *)v6 + 2) = 8;
    *((unsigned char *)v6 + 14) = 20;
    *((_DWORD *)v6 + 4) = 16778240;
    if (a3) {
      __int16 v7 = 1792;
    }
    else {
      __int16 v7 = 2048;
    }
    v6[10] = v7;
    sub_10002504C((uint64_t)p_viewer, (unsigned int *)v6);
  }
}

- (void)sendScreenLockChangeMessage:(unint64_t)a3
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "screen is locked %llu", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 266, "-[VNCServer sendScreenLockChangeMessage:]", 7, 0, "screen is locked %llu", a3);
  [(VNCServer *)self setScreenLocked:a3 != 0];
  if (self->viewer.info.viewerInfoSet && (self->viewer.info.supportedCommands[2] & 8) != 0)
  {
    p_viewer = &self->viewer;
    uint64_t v6 = malloc_type_calloc(1uLL, 0x16uLL, 0x5156704DuLL);
    v6[6] = 0;
    *((_DWORD *)v6 + 2) = 8;
    *((unsigned char *)v6 + 14) = 20;
    *((_DWORD *)v6 + 4) = 16778240;
    if (a3) {
      __int16 v7 = 3840;
    }
    else {
      __int16 v7 = 4096;
    }
    v6[10] = v7;
    sub_10002504C((uint64_t)p_viewer, (unsigned int *)v6);
  }
}

- (void)termsAndConditionsAccepted
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "terms and conditions accepted", buf, 2u);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 295, "-[VNCServer termsAndConditionsAccepted]", 7, 0, "terms and conditions accepted");
  readyToAuthSemaphore = self->_readyToAuthSemaphore;
  if (readyToAuthSemaphore) {
    intptr_t v4 = dispatch_semaphore_signal((dispatch_semaphore_t)readyToAuthSemaphore);
  }
  else {
    intptr_t v4 = 2;
  }
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    intptr_t v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "t&C accepted thrad woke %ld", buf, 0xCu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 297, "-[VNCServer termsAndConditionsAccepted]", 7, 0, "t&C accepted thrad woke %ld", v4);
}

- (void)userRequestResult:(int)a3 senderToken:(unsigned int)a4
{
  if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v10 = a3;
    __int16 v11 = 1024;
    unsigned int v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "***user request result %d  senderToken %u", buf, 0xEu);
  }
  sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 304, "-[VNCServer userRequestResult:senderToken:]", 7, 0, "***user request result %d  senderToken %u", a3, a4);
  if (a3 >= 4)
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unknown response - assuem deny", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 325, "-[VNCServer userRequestResult:senderToken:]", 7, 0, "unknown response - assuem deny");
    int v7 = 0;
  }
  else
  {
    int v7 = dword_10003D170[a3];
  }
  if (self->viewer.info.viewerInfoSet && (self->viewer.info.supportedCommands[4] & 0x10) != 0)
  {
    id v8 = malloc_type_calloc(1uLL, 0x20uLL, 0x4681C338uLL);
    v8[6] = 0;
    *((_DWORD *)v8 + 2) = 18;
    *((unsigned char *)v8 + 14) = 35;
    *((_DWORD *)v8 + 4) = 16780800;
    *((_DWORD *)v8 + 5) = bswap32(a4);
    *((_DWORD *)v8 + 6) = 0x2000000;
    *((_DWORD *)v8 + 7) = v7;
    sub_10002504C((uint64_t)&self->viewer, (unsigned int *)v8);
  }
  else
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cmd not supported", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 348, "-[VNCServer userRequestResult:senderToken:]", 7, 0, "cmd not supported");
  }
}

- (void)consumeMessage
{
  p_unsigned int state = &self->state;
  switch(self->state)
  {
    case 1:
      *(void *)v76 = 0;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "read viewer version", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1265, "ReadViewerProtocolVersion", 7, 0, "read viewer version");
      if (sub_10002F5EC((uint64_t)self->viewer.ndata) < 0xC)
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "viewer version not available yet", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 454, "-[VNCServer consumeMessage]", 7, 0, "viewer version not available yet");
        return;
      }
      sub_1000335C8((uint64_t *)v76);
      if (*(_DWORD *)v76 - self->viewer.lastCommunicationTimeLo <= 0x2710) {
        self->viewer.lowLatencyConnectionFlag = 1;
      }
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v24 = *(_DWORD *)v76 - self->viewer.lastCommunicationTimeLo;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v24;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got viewer version: time = %u", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1277, "ReadViewerProtocolVersion", 7, 0, "got viewer version: time = %u", *(_DWORD *)v76 - self->viewer.lastCommunicationTimeLo);
      self->viewer.lastCommunicationTimeLo = *(_DWORD *)v76;
      sub_10002EA3C((uint64_t)self->viewer.ndata, 0xCu, (char *)v74);
      p_viewerMinorVersion = &self->viewer.viewerMinorVersion;
      if (sscanf((const char *)v74, "RFB %3u.%3u\n", &self->viewer.viewerMajorVersion, &self->viewer.viewerMinorVersion) == 2)
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int viewerMajorVersion = self->viewer.viewerMajorVersion;
          unsigned int v27 = *p_viewerMinorVersion;
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&uint8_t buf[4] = viewerMajorVersion;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v27;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RFB viewer version: %u.%u", buf, 0xEu);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1288, "ReadViewerProtocolVersion", 7, 0, "RFB viewer version: %u.%u", self->viewer.viewerMajorVersion, self->viewer.viewerMinorVersion);
        self->viewer.VersionRFB3dot888Viewer = 0;
        self->viewer.enhancedViewer = 0;
        if (self->viewer.viewerMajorVersion == 3)
        {
          unsigned int v28 = *p_viewerMinorVersion;
          if ((*p_viewerMinorVersion & 0xFFFFFFFE) == 0x378)
          {
            self->viewer.enhancedViewer = 1;
            if (v28 == 888) {
              self->viewer.VersionRFB3dot888Viewer = 1;
            }
          }
        }
        if ([(id)qword_10005C928 sessionType] == 1) {
          self->viewer.unsigned int state = 1;
        }
      }
      if ([(VNCServer *)self sessionType] != 1) {
        goto LABEL_132;
      }
      readyToAuthSemaphore = self->_readyToAuthSemaphore;
      dispatch_time_t v30 = dispatch_time(0, 600000000000);
      dispatch_semaphore_wait((dispatch_semaphore_t)readyToAuthSemaphore, v30);
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "done waiting", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 460, "-[VNCServer consumeMessage]", 7, 0, "done waiting");
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SendAuthenticationInfoMessage", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1331, "SendAuthenticationInfoMessage", 7, 0, "SendAuthenticationInfoMessage");
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "viewer is pre-authorized", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1334, "SendAuthenticationInfoMessage", 7, 0, "viewer is pre-authorized");
      self->viewer.preauthorizedFlag = 1;
      *(_WORD *)buf = 8705;
      sub_10002460C((uint64_t)&self->viewer, buf, 2u);
      self->viewer.unsigned int state = 1;
      self->viewer.int authState = 2;
      int v31 = 3;
      goto LABEL_133;
    case 3:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sent security challenge", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 470, "-[VNCServer consumeMessage]", 7, 0, "sent security challenge");
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int authState = self->viewer.authState;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = authState;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HandleViewerAuthenticationMessages %d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 764, "HandleViewerAuthenticationMessages", 7, "AuthTheViewer", "HandleViewerAuthenticationMessages %d", self->viewer.authState);
      switch(self->viewer.authState)
      {
        case 1u:
        case 4u:
        case 5u:
        case 6u:
        case 7u:
          goto LABEL_127;
        case 2u:
          unsigned __int8 v71 = 0;
          *(void *)v74 = 0;
          *(void *)v76 = 0;
          sub_1000335C8((uint64_t *)v76);
          unsigned int v12 = *(_DWORD *)v76;
          if (*(_DWORD *)v76 - self->viewer.lastCommunicationTimeLo <= 0x2710) {
            self->viewer.lowLatencyConnectionFlag = 1;
          }
          self->viewer.lastCommunicationTimeLo = v12;
          sub_10002EA3C((uint64_t)self->viewer.ndata, 1u, (char *)&v71);
          if (!self->viewer.VersionRFB3dot888Viewer) {
            goto LABEL_165;
          }
          switch(v71)
          {
            case 5u:
              unsigned __int8 v13 = 32;
              break;
            case 4u:
              unsigned __int8 v13 = 31;
              break;
            case 3u:
              unsigned __int8 v13 = 30;
              break;
            default:
              goto LABEL_165;
          }
          unsigned __int8 v71 = v13;
LABEL_165:
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v71;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HandleAuthTypeMessage %d", buf, 8u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 834, "HandleAuthTypeMessage", 7, "AuthTheViewer", "HandleAuthTypeMessage %d", v71);
          if (v71 != 34) {
            goto LABEL_127;
          }
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "pre-auth", buf, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 839, "HandleAuthTypeMessage", 7, 0, "pre-auth");
          if (self->viewer.preauthorizedFlag)
          {
            *(void *)buf = 0;
            *(void *)&buf[8] = 0;
            uint64_t v59 = CCCryptorCreate(0, 0, 2u, self->viewer.encryptionKey, 0x10uLL, 0, &self->viewer.AESKeyECBSend);
            if (v59)
            {
              uint64_t v60 = v59;
              if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v72 = 67109120;
                int v73 = v60;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CCCryptorCreate viewer->AESKeyECB %d", v72, 8u);
              }
              v45 = "HandleAuthTypeMessage";
              uint64_t v69 = v60;
              v46 = "CCCryptorCreate viewer->AESKeyECB %d";
              int v47 = 846;
LABEL_193:
              char v48 = 5;
              goto LABEL_126;
            }
            uint64_t v61 = CCCryptorCreate(1u, 0, 2u, self->viewer.encryptionKey, 0x10uLL, 0, &self->viewer.AESKeyECB);
            if (v61)
            {
              uint64_t v62 = v61;
              if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v72 = 67109120;
                int v73 = v62;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CCCryptorCreate %d", v72, 8u);
              }
              v45 = "HandleAuthTypeMessage";
              uint64_t v69 = v62;
              v46 = "CCCryptorCreate %d";
              int v47 = 852;
              goto LABEL_193;
            }
            uint64_t v63 = CCCryptorUpdate(self->viewer.AESKeyECBSend, self->viewer.pwChallenge, 0x10uLL, buf, 0x10uLL, (size_t *)v74);
            if (v63)
            {
              uint64_t v64 = v63;
              if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v72 = 67109120;
                int v73 = v64;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CCCryptorUpdate %d", v72, 8u);
              }
              v45 = "HandleAuthTypeMessage";
              uint64_t v69 = v64;
              v46 = "CCCryptorUpdate %d";
              int v47 = 859;
              goto LABEL_193;
            }
            CCCryptorStatus v65 = CCCryptorCreate(1u, 0, 0, self->viewer.newAESkey, 0x10uLL, 0, (CCCryptorRef *)self->viewer.receiveInfo + 173);
            if (v65)
            {
              CCCryptorStatus v66 = v65;
              if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v72 = 67109120;
                int v73 = v66;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CCCryptorCreate %d", v72, 8u);
              }
              sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 866, "HandleAuthTypeMessage", 5, 0, "CCCryptorCreate %d", v66);
            }
            uint64_t v67 = sub_10002460C((uint64_t)&self->viewer, buf, 0x10u);
            self->viewer.int authState = 8;
            if (v67)
            {
              uint64_t v68 = v67;
              if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v72 = 67109120;
                int v73 = v68;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "kViewerAuthPreAuthorizedResponse error = %d", v72, 8u);
              }
              v45 = "HandleAuthTypeMessage";
              uint64_t v69 = v68;
              v46 = "kViewerAuthPreAuthorizedResponse error = %d";
              int v47 = 871;
LABEL_125:
              char v48 = 7;
LABEL_126:
              sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, v47, v45, v48, "AuthTheViewer", v46, v69);
            }
          }
          else
          {
            if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "viewer attempted to use preauthorized connection", buf, 2u);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 876, "HandleAuthTypeMessage", 1, "AuthTheViewer", "viewer attempted to use preauthorized connection", v70);
          }
LABEL_127:
          if (self->viewer.state == 2)
          {
            if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "set state to sent security result", buf, 2u);
            }
            sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 474, "-[VNCServer consumeMessage]", 7, 0, "set state to sent security result");
LABEL_132:
            int v31 = 4;
LABEL_133:
            int *p_state = v31;
          }
          break;
        case 3u:
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "viewer send during auth waiting", buf, 2u);
          }
          v45 = "HandleViewerAuthenticationMessages";
          v46 = "viewer send during auth waiting";
          int v47 = 776;
          goto LABEL_125;
        case 8u:
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "HandlePreAuthorizedPasswordMessage", buf, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 896, "HandlePreAuthorizedPasswordMessage", 7, 0, "HandlePreAuthorizedPasswordMessage");
          if (sub_10002F5EC((uint64_t)self->viewer.ndata) < 0x10) {
            goto LABEL_127;
          }
          unsigned __int8 v71 = 0;
          sub_10002EA3C((uint64_t)self->viewer.ndata, 0x10u, buf);
          int v49 = sub_1000283FC(self->viewer.AESKeyECB, self->viewer.pwChallenge, buf, &v71);
          if (sub_100035448())
          {
            BOOL v50 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            int v51 = v71;
            if (v50)
            {
              *(_DWORD *)v74 = 67109376;
              *(_DWORD *)&v74[4] = v71;
              LOWORD(v75) = 1024;
              *(_DWORD *)((char *)&v75 + 2) = v49;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "validKey %d error %d", v74, 0xEu);
            }
          }
          else
          {
            int v51 = v71;
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 909, "HandlePreAuthorizedPasswordMessage", 7, "AuthTheViewer", "validKey %d error %d", v51, v49);
          if (v49) {
            BOOL v52 = 1;
          }
          else {
            BOOL v52 = v51 == 0;
          }
          char v53 = v52;
          if (v52)
          {
            *(void *)v74 = 0;
            uint64_t v75 = 0;
            unsigned int v54 = 0x1000000;
          }
          else
          {
            self->viewer.unsigned int state = 2;
            *(_WORD *)&self->viewer.observeFlag = 0;
            self->viewer.askFlag = 0;
            if (sub_100028564(self->viewer.AESKeyECB, self->viewer.AESKeyECBSend, buf, 0, v74)) {
              goto LABEL_127;
            }
            unsigned int v54 = 0;
          }
          if (!sub_10002460C((uint64_t)&self->viewer, v74, 0x10u))
          {
            *(_DWORD *)v72 = v54;
            char v56 = v53 ^ 1;
            if (self->viewer.viewerMinorVersion != 8) {
              char v56 = 1;
            }
            if (v56)
            {
              sub_10002460C((uint64_t)&self->viewer, v72, 4u);
            }
            else
            {
              if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v76 = 67109120;
                *(_DWORD *)&v76[4] = HIBYTE(v54);
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "send vers 8 response authresult %d", v76, 8u);
              }
              sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1013, "SendAuthenticationResultToViewer", 7, 0, "send vers 8 response authresult %d", HIBYTE(v54));
              size_t v57 = strlen(off_10005C538);
              v58 = malloc_type_malloc((unsigned __int16)(v57 + 9), 0x21EB8ACDuLL);
              _DWORD *v58 = v54;
              v58[1] = bswap32(v57);
              memcpy(v58 + 2, off_10005C538, v57);
              sub_10002460C((uint64_t)&self->viewer, v58, (unsigned __int16)(v57 + 9));
              free(v58);
              sleep(1u);
            }
          }
          goto LABEL_127;
        default:
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "bad viewer auth state", buf, 2u);
          }
          v45 = "HandleViewerAuthenticationMessages";
          v46 = "bad viewer auth state";
          int v47 = 795;
          goto LABEL_125;
      }
      return;
    case 4:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "security result", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 482, "-[VNCServer consumeMessage]", 7, 0, "security result");
      p_viewerInitializationFlags = &self->viewer.viewerInitializationFlags;
      sub_10002EA3C((uint64_t)self->viewer.ndata, 1u, (char *)&self->viewer.viewerInitializationFlags);
      self->viewer.viewerWantsExtendedServerInfo = 0;
      if (self->viewer.enhancedViewer && (char)*p_viewerInitializationFlags < 0) {
        self->viewer.viewerWantsExtendedServerInfo = 1;
      }
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = *p_viewerInitializationFlags;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v15;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "viewerInitializationFlags 0x%x", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1115, "HandleViewerInitialization", 7, 0, "viewerInitializationFlags 0x%x", *p_viewerInitializationFlags);
      HIDWORD(xmmword_10005C978) = 0;
      *(void *)((char *)&xmmword_10005C978 + 5) = 0;
      BYTE4(xmmword_10005C978) = 80;
      LODWORD(xmmword_10005C978) = -1073553232;
      id v16 = [(id)qword_10005C928 machineName];
      v17 = (const char *)[v16 UTF8String];

      unsigned int v18 = strlen(v17);
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v18;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = v17;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "machineNameLen %d  machine name %s", buf, 0x12u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1160, "SendServerInitialiation", 7, 0, "machineNameLen %d  machine name %s", v18, v17);
      if (!self->viewer.viewerWantsExtendedServerInfo)
      {
        unsigned int v19 = v18 + 24;
        v32 = malloc_type_calloc(1uLL, v18 + 24, 0xA312A5C7uLL);
        if (v32)
        {
          uint64_t v21 = v32;
          memcpy(v32 + 6, v17, v18);
          v21[5] = bswap32(v18);
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v18;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "normal server init length = %d", buf, 8u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1206, "SendServerInitialiation", 7, 0, "normal server init length = %d", v18);
          unsigned int v22 = v18;
          goto LABEL_82;
        }
LABEL_93:
        uint64_t v33 = 4294967294;
        goto LABEL_94;
      }
      unsigned int v19 = v18 + 46;
      uint64_t v20 = (char *)malloc_type_calloc(1uLL, v18 + 46, 0x28252BA1uLL);
      if (!v20) {
        goto LABEL_93;
      }
      uint64_t v21 = v20;
      unsigned int v22 = v18 + 22;
      *((_WORD *)v20 + 12) = 0;
      unsigned int v23 = self->viewer.observeFlag != 0;
      *(_DWORD *)(v20 + 26) = v23;
      if (self->viewer.absControlFlag)
      {
        v23 |= 2u;
        *(_DWORD *)(v20 + 26) = v23;
      }
      *(_OWORD *)(v20 + 30) = xmmword_10005C978;
      v20[31] |= 8u;
      memcpy(v20 + 46, v17, v18);
      v21[5] = bswap32(v22);
      *(_DWORD *)((char *)v21 + 26) = bswap32(v23);
LABEL_82:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = 544;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = 960;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "width = %d  height = %d", buf, 0xEu);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1220, "SendServerInitialiation", 7, 0, "width = %d  height = %d", 544, 960);
      *(void *)&self->viewer.lastWidth = 62915104;
      *uint64_t v21 = -1073537022;
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v22;
        *(_WORD *)&buf[14] = 1024;
        *(_DWORD *)&uint8_t buf[16] = v18;
        __int16 v78 = 2048;
        uint64_t v79 = 46;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "server init size %d extralen %d machineNamelen %d RFBServerInfo2 %lu", buf, 0x1Eu);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1234, "SendServerInitialiation", 7, 0, "server init size %d extralen %d machineNamelen %d RFBServerInfo2 %lu", v19, v22, v18, 46);
      uint64_t v33 = sub_10002460C((uint64_t)&self->viewer, v21, v19);
      free(v21);
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int translatedPixelSize = self->viewer.translatedPixelSize;
        trans_func = self->viewer.trans_func;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = translatedPixelSize;
        *(_WORD *)&buf[8] = 2048;
        *(void *)&buf[10] = trans_func;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "viewer->translatedPixelSize %d  viewer->trans_func %p", buf, 0x12u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1238, "SendServerInitialiation", 7, 0, "viewer->translatedPixelSize %d  viewer->trans_func %p", self->viewer.translatedPixelSize, self->viewer.trans_func);
      self->viewer.lastDepth = 32;
      if (!v33)
      {
        self->viewer.unsigned int state = 4;
        goto LABEL_98;
      }
LABEL_94:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100036DA8(v33, v36, v37, v38, v39, v40, v41, v42);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1123, "HandleViewerInitialization", 3, 0, "error in initization %d", v33);
LABEL_98:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int state = self->viewer.state;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = state;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sent server initialization viewer state %d", buf, 8u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 1125, "HandleViewerInitialization", 7, 0, "sent server initialization viewer state %d", self->viewer.state);
      self->unsigned int state = 6;
      return;
    case 6:
      sub_10002B768((uint64_t)&self->viewer, self);
      if (self->viewer.updateDisplayInfoFlag)
      {
        self->viewer.updateDisplayInfoFlag = 0;
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "updateDisplayInfoFlag set", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 380, "CheckToSendDisplayInfo", 7, 0, "updateDisplayInfoFlag set");
        if (self->viewer.sendDisplayInfoFlag)
        {
          sub_100026FFC((uint64_t)&self->viewer);
        }
        else if (self->viewer.sendDesktopSizeFlag)
        {
          if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "EncodeDesktopSize", buf, 2u);
          }
          sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 389, "CheckToSendDisplayInfo", 7, 0, "EncodeDesktopSize");
        }
      }
      if (self->viewer.sendResolutionChange)
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          double screenScaleFactor = self->viewer.screenScaleFactor;
          *(_DWORD *)buf = 134217984;
          *(double *)&uint8_t buf[4] = screenScaleFactor;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "send resolution changed  scale factor %f", buf, 0xCu);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 495, "-[VNCServer consumeMessage]", 7, 0, "send resolution changed  scale factor %f", self->viewer.screenScaleFactor);
        sub_100026FFC((uint64_t)&self->viewer);
        self->viewer.sendResolutionChange = 0;
      }
      if (self->viewer.viewerFrameUpdateRequest == 2)
      {
        if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got frame update request", buf, 2u);
        }
        sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 501, "-[VNCServer consumeMessage]", 7, 0, "got frame update request");
        self->viewer.viewerFrameUpdateRequest = 0;
      }
      return;
    default:
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100036D30((uint64_t)p_state, v4, v5, v6, v7, v8, v9, v10);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 508, "-[VNCServer consumeMessage]", 3, 0, "unknown state: %d ");
      return;
  }
}

- (void)notificationHandler:(id)a3
{
  uint64_t v4 = [a3 name];
  unsigned int v5 = [v4 isEqualToString:@"TouchEventUpdate"];

  if (v5)
  {
    [(VNCServer *)self handleTouchEventUpdate];
  }
}

- (void)handleTouchEventUpdate
{
  if (sub_100033760())
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "screen sharing is paused", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 535, "-[VNCServer handleTouchEventUpdate]", 7, 0, "screen sharing is paused");
LABEL_11:
    +[TouchEventMonitor removeAllTouchPositions];
    v3 = 0;
    goto LABEL_12;
  }
  if ([(VNCServer *)self screenLocked])
  {
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "screen is locked", buf, 2u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 542, "-[VNCServer handleTouchEventUpdate]", 7, 0, "screen is locked");
    goto LABEL_11;
  }
  v3 = +[TouchEventMonitor copyCurrentTouchPositions];
  if (v3)
  {
    uint64_t v4 = (char *)malloc_type_calloc(1uLL, 0x206uLL, 0x38C0733uLL);
    uint64_t v5 = 0;
    __int16 v6 = 0;
    *((_WORD *)v4 + 8) = 256;
    *(void *)(v4 + 18) = 0;
    *(_DWORD *)(v4 + 26) = 1375993856;
    *((_DWORD *)v4 + 3) = 32;
    *((_WORD *)v4 + 16) = 256;
    uint64_t v7 = v4 + 38;
    uint64_t v8 = v4 + 38;
    do
    {
      uint64_t v9 = (unint64_t *)&v3[v5];
      if (v3[v5].var3)
      {
        *uint64_t v8 = bswap64(*v9);
        v8[1] = bswap64(v9[1]);
        v8[2] = bswap64(v9[2]);
        v8 += 3;
        ++v6;
      }
      ++v5;
    }
    while ((v5 * 32) != 640);
    if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "touchcount %d", buf, 8u);
    }
    sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 582, "-[VNCServer handleTouchEventUpdate]", 7, 0, "touchcount %d", v6);
    *((_WORD *)v4 + 18) = v6 << 8;
    uint64_t v10 = 24 * v6;
    *((_WORD *)v4 + 15) = __rev16(v10 | 6);
    size_t v11 = (v10 + 24);
    *((_DWORD *)v4 + 2) = v11;
    if (self->_lastTouchInfoSize == v11 && !bcmp(self->_lastTouchInfo, v7, v11))
    {
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "touch data is the same - ignore", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 593, "-[VNCServer handleTouchEventUpdate]", 7, 0, "touch data is the same - ignore");
      if (sub_100035448() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "duplicate", buf, 2u);
      }
      sub_10003588C((unint64_t)"/Library/Caches/com.apple.xbs/Sources/EmbeddedScreenSharingServer/iOS/ScreenSharingServer/VNCServer.m", 102, 649, "-[VNCServer handleTouchEventUpdate]", 7, 0, "duplicate");
LABEL_35:
      free(v4);
    }
    else
    {
      free(self->_lastTouchInfo);
      self->_lastTouchInfoSize = v10;
      unsigned int v12 = (char *)malloc_type_malloc(v10, 0x303C4CB2uLL);
      self->_lastTouchInfo = v12;
      memcpy(v12, v7, self->_lastTouchInfoSize);
      p_viewer = &self->viewer;
      sendInfo = self->viewer.sendInfo;
      [0 lock];
      [*((id *)sendInfo + 4) lock];
      int v15 = (char *)sendInfo + 8;
      while (1)
      {
        int v15 = *(char **)v15;
        if (!v15) {
          break;
        }
        if ((*((_WORD *)v15 + 6) & 0x20) != 0)
        {
          memcpy(v15 + 14, v4 + 14, *((unsigned int *)v4 + 2));
          uint64_t v16 = *((unsigned int *)v4 + 2);
          *((void *)sendInfo + 399) = *((void *)sendInfo + 399) - *((unsigned int *)v15 + 2) + v16;
          *((_DWORD *)v15 + 2) = v16;
          [*((id *)sendInfo + 4) unlock];
          [0 unlock];
          goto LABEL_35;
        }
      }
      [*((id *)sendInfo + 4) unlock];
      [0 unlock];
      sub_10002504C((uint64_t)p_viewer, (unsigned int *)v4);
    }
  }
LABEL_12:
  free(v3);
}

- (BOOL)screenLocked
{
  return self->_screenLocked;
}

- (void)setScreenLocked:(BOOL)a3
{
  self->_screenLocked = a3;
}

- (NSString)machineName
{
  return (NSString *)objc_getProperty(self, a2, 3112, 1);
}

- (void)setMachineName:(id)a3
{
}

- (int)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(int)a3
{
  self->_sessionType = a3;
}

- (IDSSessionEmbeddedControllerBase)sessionController
{
  return (IDSSessionEmbeddedControllerBase *)objc_getProperty(self, a2, 3120, 1);
}

- (void)setSessionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionController, 0);
  objc_storeStrong((id *)&self->_machineName, 0);
  objc_storeStrong((id *)&self->_readyToAuthSemaphore, 0);

  sub_100027DC4((uint64_t)&self->viewer);
}

@end