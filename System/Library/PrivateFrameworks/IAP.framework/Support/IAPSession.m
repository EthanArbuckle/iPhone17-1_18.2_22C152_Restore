@interface IAPSession
+ (void)resetSessionIDCounter;
- (BOOL)closeDataPipes;
- (BOOL)openPipeFromApp;
- (BOOL)openPipeToApp;
- (IAPEAClient)client;
- (IAPSession)init;
- (IAPSession)initWithClient:(id)a3 connectionID:(unsigned int)a4 protocolID:(unsigned __int8)a5 sessionID:(unsigned __int16 *)a6;
- (id)description;
- (unsigned)connectionID;
- (unsigned)protocolID;
- (unsigned)sessionID;
- (void)_acceptSocketCB:(__CFSocket *)a3 acceptedSock:(int)a4;
- (void)_registerListenSocket;
- (void)dealloc;
- (void)shuttingDownSession;
@end

@implementation IAPSession

- (IAPSession)init
{
  return 0;
}

- (IAPSession)initWithClient:(id)a3 connectionID:(unsigned int)a4 protocolID:(unsigned __int8)a5 sessionID:(unsigned __int16 *)a6
{
  uint64_t v8 = *(void *)&a4;
  v24.receiver = self;
  v24.super_class = (Class)IAPSession;
  v10 = [(IAPSession *)&v24 init];
  if (!v10) {
    return v10;
  }
  v11 = (IAPEAClient *)a3;
  if (((unint64_t)&v10->_client & 7) != 0) {
    goto LABEL_36;
  }
  v10->_client = v11;
  if (((unint64_t)&v10->_connectionID & 3) != 0) {
    goto LABEL_36;
  }
  v10->_connectionID = v8;
  v10->_protocolID = a5;
  unsigned int v12 = dword_10013BB3C + 1;
  if (dword_10013BB3C == -1) {
    goto LABEL_37;
  }
  if (HIWORD(v12)) {
    unsigned int v12 = 0;
  }
  dword_10013BB3C = v12;
  if (!a6) {
    goto LABEL_36;
  }
  if (a6) {
    goto LABEL_36;
  }
  *a6 = v12;
  if ((v10 + 30)) {
    goto LABEL_36;
  }
  v10->_sessionID = v12;
  sub_1000EE49C(3u, @"%s:%s client=%@ connID=0x%x protocolID=%d sessionID=%d", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm", "-[IAPSession initWithClient:connectionID:protocolID:sessionID:]", a3, v8, v10->_protocolID, (unsigned __int16)v12);
  v13 = (NSMutableDictionary *)objc_msgSend(+[EAManager sharedManager](EAManager, "sharedManager"), "accessoryForConnectionID:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v8));
  if (((unint64_t)&v10->_accessory & 7) != 0) {
    goto LABEL_36;
  }
  v10->_accessory = v13;
  if (!v13) {
    NSLog(@"ERROR - %s:%s - %d couldn't find accessory for connectionID=0x%x", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm", "-[IAPSession initWithClient:connectionID:protocolID:sessionID:]", 126, v10->_connectionID);
  }
  [(IAPEAClient *)v10->_client increaseSessionRefCount];
  if ((((_BYTE)v10 + 32) & 3) != 0) {
    goto LABEL_36;
  }
  v10->_listenSock = -1;
  if ((((_BYTE)v10 + 40) & 7) != 0) {
    goto LABEL_36;
  }
  v10->_listenSockRef = 0;
  if ((((_BYTE)v10 + 48) & 7) != 0) {
    goto LABEL_36;
  }
  v10->_listenSockRls = 0;
  if ((((_BYTE)v10 + 56) & 3) != 0) {
    goto LABEL_36;
  }
  v10->_sock = -1;
  if ((((_BYTE)v10 + 64) & 7) != 0
    || (v10->_sockRef = 0, (((_BYTE)v10 + 72) & 7) != 0)
    || (v10->_sockRls = 0, *(_WORD *)&v10->_openPipeToAppAfterAccept = 0, (uint64_t v14 = sub_1000DB62C()) == 0)
    || (v14 & 7) != 0
    || (uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v14 + 96))(v14, v8)) == 0
    || (v15 & 7) != 0
    || (uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 160))(v15),
        v17 = [(IAPEAClient *)v10->_client bundleId],
        !v16)
    || (v16 & 7) != 0)
  {
LABEL_36:
    __break(0x5516u);
    goto LABEL_37;
  }
  +[IAPDataLogger PowerlogEASession:v17 forAccessory:v10->_accessory forProtocolID:v10->_protocolID forPortType:(*(unsigned __int8 (**)(uint64_t))(*(void *)v16 + 216))(v16) isSessionOpen:1];
  char v18 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 232))(v16);
  v10->_isWirelessSession = v18;
  int v19 = dword_10013BB30;
  if (v18) {
    goto LABEL_28;
  }
  int v19 = dword_10013BB30 + 1;
  if (dword_10013BB30 == -1) {
LABEL_37:
  }
    __break(0x5500u);
  ++dword_10013BB30;
LABEL_28:
  if (v19)
  {
    if (v19 == 1 && (byte_10013BB34 & 1) == 0)
    {
      v25[0] = @"AssertType";
      v25[1] = @"AssertLevel";
      v26[0] = @"NoIdleSleepAssertion";
      v26[1] = &off_100131DF0;
      v25[2] = @"AssertName";
      v25[3] = @"AllowsDeviceRestart";
      v26[2] = @"com.apple.iapd.ea-session-open";
      v26[3] = kCFBooleanTrue;
      if (IOPMAssertionCreateWithProperties((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4], (IOPMAssertionID *)&dword_10013BB38))
      {
        NSLog(@"ERROR - %s:%s - %d couldn't take sleep assertion", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm", "-[IAPSession initWithClient:connectionID:protocolID:sessionID:]", 167);
      }
      else
      {
        byte_10013BB34 = 1;
        sub_1000EE49C(3u, @"ea session power assertion (%u) taken", dword_10013BB38, v21, v22, v23);
      }
    }
  }
  else
  {
    sub_1000EE49C(3u, @"%s:%s not taking power assertion for protocolID=%d sessionID=%d on wireless transport", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm", "-[IAPSession initWithClient:connectionID:protocolID:sessionID:]", v10->_protocolID, v10->_sessionID);
  }
  return v10;
}

- (void)shuttingDownSession
{
  if ((((int)self + 16) & 7) != 0) {
    goto LABEL_30;
  }
  [(IAPEAClient *)self->_client decreaseSessionRefCount];
  if (((unint64_t)&self->_connectionID & 3) != 0) {
    goto LABEL_30;
  }
  if ((self + 30)) {
    goto LABEL_30;
  }
  sub_1000EE49C(3u, @"%s:%s clientID=%@ connectionID=0x%x protocolID=%d sessionID=%d", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm", "-[IAPSession shuttingDownSession]", self->_client, self->_connectionID, self->_protocolID, self->_sessionID);
  uint64_t v3 = sub_1000DB62C();
  if (!v3 || (v3 & 7) != 0) {
    goto LABEL_30;
  }
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void))(*(void *)v3 + 96))(v3, self->_connectionID);
  BOOL v5 = v4 && (v4 & 7) == 0;
  if (!v5
    || (uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 160))(v4),
        v7 = [(IAPEAClient *)self->_client bundleId],
        (((_BYTE)self + 8) & 7) != 0)
    || (v6 ? (BOOL v8 = (v6 & 7) == 0) : (BOOL v8 = 0), !v8))
  {
LABEL_30:
    __break(0x5516u);
    goto LABEL_31;
  }
  +[IAPDataLogger PowerlogEASession:v7 forAccessory:self->_accessory forProtocolID:self->_protocolID forPortType:(*(unsigned __int8 (**)(uint64_t))(*(void *)v6 + 216))(v6) isSessionOpen:0];
  if (self->_isWirelessSession >= 2u)
  {
LABEL_31:
    __break(0x550Au);
    goto LABEL_32;
  }
  if (self->_isWirelessSession)
  {
    if (dword_10013BB30) {
      return;
    }
    goto LABEL_23;
  }
  int v9 = dword_10013BB30 - 1;
  if (!dword_10013BB30)
  {
LABEL_32:
    __break(0x5515u);
    return;
  }
  --dword_10013BB30;
  if (!v9)
  {
LABEL_23:
    if (byte_10013BB34 == 1)
    {
      if (IOPMAssertionRelease(dword_10013BB38))
      {
        NSLog(@"ERROR - %s:%s - %d couldn't release sleep assertion", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/IAPSession.mm", "-[IAPSession shuttingDownSession]", 208);
      }
      else
      {
        byte_10013BB34 = 0;
        sub_1000EE49C(3u, @"ea session power assertion released");
      }
    }
  }
}

- (void)dealloc
{
  if ((((_BYTE)self + 16) & 7) != 0 || (self->_client, self->_client = 0, (((_BYTE)self + 8) & 7) != 0))
  {
    __break(0x5516u);
  }
  else
  {

    self->_accessory = 0;
    v3.receiver = self;
    v3.super_class = (Class)IAPSession;
    [(IAPSession *)&v3 dealloc];
  }
}

- (BOOL)openPipeToApp
{
  if (((unint64_t)&self->_sockRef & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    if (self->_sockRef) {
      [(IAPSession *)self _openPipeToApp];
    }
    else {
      self->_openPipeToAppAfterAccept = 1;
    }
    LOBYTE(self) = 1;
  }
  return (char)self;
}

- (BOOL)openPipeFromApp
{
  if (((unint64_t)&self->_sockRef & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    if (self->_sockRef) {
      [(IAPSession *)self _openPipeFromApp];
    }
    else {
      self->_openPipeFromAppAfterAccept = 1;
    }
    LOBYTE(self) = 1;
  }
  return (char)self;
}

- (BOOL)closeDataPipes
{
  p_listenSockRls = (IAPSession **)&self->_listenSockRls;
  if (((unint64_t)&self->_listenSockRls & 7) != 0) {
    goto LABEL_20;
  }
  uint64_t v3 = self;
  self = *p_listenSockRls;
  if (*p_listenSockRls)
  {
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)self);
    CFRelease(*p_listenSockRls);
    *p_listenSockRls = 0;
  }
  p_listenSockRef = (IAPSession **)&v3->_listenSockRef;
  if (((unint64_t)&v3->_listenSockRef & 7) != 0) {
    goto LABEL_20;
  }
  self = *p_listenSockRef;
  if (*p_listenSockRef)
  {
    CFSocketInvalidate((CFSocketRef)self);
    CFRelease(*p_listenSockRef);
    *p_listenSockRef = 0;
  }
  p_listenSock = &v3->_listenSock;
  if (((unint64_t)&v3->_listenSock & 3) != 0) {
    goto LABEL_20;
  }
  LODWORD(self) = *p_listenSock;
  if ((*p_listenSock & 0x80000000) == 0)
  {
    LOBYTE(self) = close((int)self);
    int *p_listenSock = -1;
  }
  p_sockRls = (IAPSession **)&v3->_sockRls;
  if (((unint64_t)&v3->_sockRls & 7) != 0) {
    goto LABEL_20;
  }
  self = *p_sockRls;
  if (*p_sockRls)
  {
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)self);
    CFRelease(*p_sockRls);
    *p_sockRls = 0;
  }
  p_sockRef = (IAPSession **)&v3->_sockRef;
  if (((unint64_t)&v3->_sockRef & 7) != 0) {
    goto LABEL_20;
  }
  self = *p_sockRef;
  if (*p_sockRef)
  {
    CFSocketInvalidate((CFSocketRef)self);
    CFRelease(*p_sockRef);
    *p_sockRef = 0;
  }
  p_sock = &v3->_sock;
  if ((p_sock & 3) != 0)
  {
LABEL_20:
    __break(0x5516u);
  }
  else
  {
    if ((*p_sock & 0x80000000) == 0)
    {
      close(*p_sock);
      int *p_sock = -1;
    }
    LOBYTE(self) = 1;
  }
  return (char)self;
}

+ (void)resetSessionIDCounter
{
  dword_10013BB3C = 0;
}

- (void)_registerListenSocket
{
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __source[14] = v3;
  __source[15] = v3;
  __source[12] = v3;
  __source[13] = v3;
  __source[10] = v3;
  __source[11] = v3;
  __source[8] = v3;
  __source[9] = v3;
  __source[6] = v3;
  __source[7] = v3;
  __source[4] = v3;
  __source[5] = v3;
  __source[2] = v3;
  __source[3] = v3;
  __source[0] = v3;
  __source[1] = v3;
  if ((((_BYTE)self + 24) & 3) != 0) {
    goto LABEL_11;
  }
  if ((self + 30)) {
    goto LABEL_11;
  }
  IAPAppToAppSocketPath();
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)((char *)&v12[5] + 10) = v4;
  v12[4] = v4;
  v12[5] = v4;
  v12[2] = v4;
  v12[3] = v4;
  v12[0] = v4;
  v12[1] = v4;
  unlink((const char *)__source);
  int v5 = socket(1, 1, 0);
  p_listenSock = &self->_listenSock;
  if (((unint64_t)&self->_listenSock & 3) != 0) {
    goto LABEL_11;
  }
  int *p_listenSock = v5;
  memset((char *)v12 + 2, 0, 104);
  LOWORD(v12[0]) = 362;
  strlcpy((char *)v12 + 2, (const char *)__source, 0x68uLL);
  if (bind(*p_listenSock, (const sockaddr *)v12, 0x6Au)) {
    NSLog(@"can't bind to ea address");
  }
  if (listen(*p_listenSock, 5)) {
    NSLog(@"can't listen to socket");
  }
  context.version = 0;
  context.info = self;
  memset(&context.retain, 0, 24);
  v7 = CFSocketCreateWithNative(kCFAllocatorDefault, self->_listenSock, 2uLL, (CFSocketCallBack)sub_100014D5C, &context);
  if ((((_BYTE)self + 40) & 7) != 0
    || (self->_listenSockRef = v7,
        CFRunLoopSourceRef RunLoopSource = CFSocketCreateRunLoopSource(kCFAllocatorDefault, v7, 0),
        p_listenSockRls = &self->_listenSockRls,
        (p_listenSockRls & 7) != 0))
  {
LABEL_11:
    __break(0x5516u);
  }
  *p_listenSockRls = RunLoopSource;
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, *p_listenSockRls, kCFRunLoopDefaultMode);
}

- (void)_acceptSocketCB:(__CFSocket *)a3 acceptedSock:(int)a4
{
  int v10 = 1;
  context.version = 0;
  context.info = self;
  memset(&context.retain, 0, 24);
  if ((((_BYTE)self + 56) & 3) != 0) {
    goto LABEL_14;
  }
  self->_sock = a4;
  uint64_t v6 = CFSocketCreateWithNative(0, a4, 9uLL, (CFSocketCallBack)sub_100014D5C, &context);
  if ((((_BYTE)self + 64) & 7) != 0) {
    goto LABEL_14;
  }
  self->_sockRef = v6;
  CFSocketDisableCallBacks(v6, 9uLL);
  CFRunLoopSourceRef RunLoopSource = CFSocketCreateRunLoopSource(kCFAllocatorDefault, self->_sockRef, 0);
  if ((((_BYTE)self + 72) & 7) != 0) {
    goto LABEL_14;
  }
  self->_sockRls = RunLoopSource;
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, self->_sockRls, kCFRunLoopDefaultMode);
  int v9 = 0x20000;
  setsockopt(self->_sock, 0xFFFF, 4097, &v9, 4u);
  setsockopt(self->_sock, 0xFFFF, 4098, &v9, 4u);
  ioctl(a4, 0x8004667EuLL, &v10);
  if ((((_BYTE)self + 48) & 7) != 0
    || (CFRunLoopSourceInvalidate(self->_listenSockRls),
        CFRelease(self->_listenSockRls),
        self->_listenSockRls = 0,
        (((_BYTE)self + 40) & 7) != 0)
    || (CFSocketInvalidate(self->_listenSockRef),
        CFRelease(self->_listenSockRef),
        self->_listenSockRef = 0,
        (((_BYTE)self + 32) & 3) != 0))
  {
LABEL_14:
    __break(0x5516u);
LABEL_15:
    __break(0x550Au);
    return;
  }
  close(self->_listenSock);
  self->_listenSock = -1;
  if (self->_openPipeToAppAfterAccept >= 2u) {
    goto LABEL_15;
  }
  if (self->_openPipeToAppAfterAccept)
  {
    [(IAPSession *)self _openPipeToApp];
    self->_openPipeToAppAfterAccept = 0;
  }
  if (self->_openPipeFromAppAfterAccept > 1u) {
    goto LABEL_15;
  }
  if (self->_openPipeFromAppAfterAccept)
  {
    [(IAPSession *)self _openPipeFromApp];
    self->_openPipeFromAppAfterAccept = 0;
  }
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)IAPSession;
  id result = [(IAPSession *)&v4 description];
  if ((((_BYTE)self + 16) & 7) == 0 && (((_BYTE)self + 24) & 3) == 0 && ((self + 30) & 1) == 0) {
    return +[NSString stringWithFormat:@"%@ client=%@ connectionID=%u protocolID=%d sessionID=%d", result, self->_client, self->_connectionID, self->_protocolID, self->_sessionID];
  }
  __break(0x5516u);
  return result;
}

- (IAPEAClient)client
{
  return self->_client;
}

- (unsigned)connectionID
{
  return self->_connectionID;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (unsigned)protocolID
{
  return self->_protocolID;
}

@end