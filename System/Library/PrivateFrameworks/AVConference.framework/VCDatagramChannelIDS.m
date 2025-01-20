@interface VCDatagramChannelIDS
- (IDSDataChannelLinkContext)defaultLink;
- (NSArray)connectedLinks;
- (NSString)destination;
- (VCDatagramChannelIDS)initWithDestination:(id)a3 token:(unsigned int)a4 dataPath:(int)a5 error:(id *)a6;
- (VCDatagramChannelIDS)initWithSocketDescriptor:(int)a3 token:(unsigned int)a4 error:(id *)a5;
- (id)VTPConnectionContext;
- (id)datagramChannelOptions;
- (id)datagramChannelWithDestination:(id)a3 error:(id *)a4;
- (id)idsDatagramChannel;
- (id)sharedIDSService;
- (int)dataPath;
- (int)setupVTPSocketWithFileDescriptor:(int)a3;
- (int)start;
- (void)dealloc;
- (void)flushLinkProbingStatusWithOptions:(id)a3;
- (void)invalidate;
- (void)osChannelInfoLog;
- (void)queryProbingResultsWithOptions:(id)a3;
- (void)readyToRead;
- (void)requestSessionInfoWithOptions:(id)a3;
- (void)requestStatsWithOptions:(id)a3;
- (void)setChannelPreferences:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3 isInitiator:(BOOL)a4;
- (void)setReadHandler:(id)a3;
- (void)setWiFiAssist:(BOOL)a3;
- (void)setWriteCompletionHandler:(id)a3;
- (void)start;
- (void)startActiveProbingWithOptions:(id)a3;
- (void)startMKMRecoveryForParticipantIDs:(id)a3;
- (void)stopActiveProbingWithOptions:(id)a3;
- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6 completionHandler:(id)a7;
- (void)writeDatagrams:(const void *)a3 datagramsSize:(unsigned int *)a4 datagramsInfo:(id *)a5 datagramsCount:(int)a6 options:(id *)a7 completionHandler:(id)a8;
@end

@implementation VCDatagramChannelIDS

- (id)sharedIDSService
{
  if (sharedIDSService_onceToken != -1) {
    dispatch_once(&sharedIDSService_onceToken, &__block_literal_global_21);
  }
  return (id)sharedIDSService_service;
}

uint64_t __40__VCDatagramChannelIDS_sharedIDSService__block_invoke()
{
  uint64_t result = [objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.avconference.icloud"];
  sharedIDSService_service = result;
  return result;
}

- (VCDatagramChannelIDS)initWithDestination:(id)a3 token:(unsigned int)a4 dataPath:(int)a5 error:(id *)a6
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VCDatagramChannelIDS;
  v10 = [(VCObject *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_dataPath = a5;
    v12 = (IDSDatagramChannel *)[(VCDatagramChannelIDS *)v10 datagramChannelWithDestination:a3 error:a6];
    v11->_idsChannel = v12;
    if (v12)
    {
      v11->_destination = (NSString *)[a3 copy];
      v11->_token = a4;
      v11->_vtpSocket = -1;
    }
    else
    {

      return 0;
    }
  }
  return v11;
}

- (id)VTPConnectionContext
{
  +[VCVTPWrapper targetQueue];

  return +[VCVTPWrapper connectionContext];
}

- (id)datagramChannelOptions
{
  v9[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = self->_dataPath == 1;
  v4 = (void *)MEMORY[0x1E4F1CA60];
  v8[0] = *MEMORY[0x1E4F6A860];
  v9[0] = [NSNumber numberWithInteger:v3];
  v8[1] = *MEMORY[0x1E4F6A868];
  v9[1] = [NSNumber numberWithInteger:v3];
  v5 = objc_msgSend(v4, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
  id v6 = [(VCDatagramChannelIDS *)self VTPConnectionContext];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F6A858]];
  return v5;
}

- (id)datagramChannelWithDestination:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([a3 hasPrefix:@"loopback:"])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        uint64_t v13 = v7;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCDatagramChannelIDS datagramChannelWithDestination:error:]";
        __int16 v16 = 1024;
        int v17 = 89;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unit Test: Using VCMockIDSDatagramChannel instead of IDSDatagramChannel", (uint8_t *)&v12, 0x1Cu);
      }
    }
    return [+[VCMockIDSDatagramChannelController sharedInstance] datagramChannelWithDestination:a3 dataPath:self->_dataPath];
  }
  else
  {
    id v10 = [(VCDatagramChannelIDS *)self sharedIDSService];
    id v11 = [(VCDatagramChannelIDS *)self datagramChannelOptions];
    return (id)[v10 datagramChannelForSessionDestination:a3 options:v11 error:a4];
  }
}

- (VCDatagramChannelIDS)initWithSocketDescriptor:(int)a3 token:(unsigned int)a4 error:(id *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VCDatagramChannelIDS;
  v8 = [(VCObject *)&v12 init];
  v9 = v8;
  if (v8)
  {
    id v10 = (IDSDatagramChannel *)(id)objc_msgSend(-[VCDatagramChannelIDS sharedIDSService](v8, "sharedIDSService"), "datagramChannelForSocketDescriptor:error:", v7, a5);
    v9->_idsChannel = v10;
    if (v10)
    {
      v9->_token = a4;
      v9->_vtpSocket = -1;
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id eventHandler = self->_eventHandler;
  if (eventHandler) {
    _Block_release(eventHandler);
  }
  [(VCDatagramChannelIDS *)self invalidate];

  v4.receiver = self;
  v4.super_class = (Class)VCDatagramChannelIDS;
  [(VCObject *)&v4 dealloc];
}

- (void)setReadHandler:(id)a3
{
}

- (void)setWriteCompletionHandler:(id)a3
{
}

- (void)setEventHandler:(id)a3
{
  id eventHandler = self->_eventHandler;
  if (eventHandler) {
    _Block_release(eventHandler);
  }
  if (a3) {
    id v6 = _Block_copy(a3);
  }
  else {
    id v6 = 0;
  }
  self->_id eventHandler = v6;
  idsChannel = self->_idsChannel;

  [(IDSDatagramChannel *)idsChannel setEventHandler:a3];
}

- (void)readyToRead
{
}

- (void)osChannelInfoLog
{
  [(VCObject *)self lock];
  [(IDSDatagramChannel *)self->_idsChannel osChannelInfoLog];

  [(VCObject *)self unlock];
}

- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6 completionHandler:(id)a7
{
}

- (void)writeDatagrams:(const void *)a3 datagramsSize:(unsigned int *)a4 datagramsInfo:(id *)a5 datagramsCount:(int)a6 options:(id *)a7 completionHandler:(id)a8
{
}

- (void)setChannelPreferences:(id)a3
{
}

- (void)setWiFiAssist:(BOOL)a3
{
}

- (void)startActiveProbingWithOptions:(id)a3
{
}

- (void)stopActiveProbingWithOptions:(id)a3
{
}

- (void)queryProbingResultsWithOptions:(id)a3
{
}

- (void)flushLinkProbingStatusWithOptions:(id)a3
{
}

- (void)setOneToOneModeEnabled:(BOOL)a3 isInitiator:(BOOL)a4
{
}

- (void)startMKMRecoveryForParticipantIDs:(id)a3
{
}

- (void)requestSessionInfoWithOptions:(id)a3
{
}

- (void)requestStatsWithOptions:(id)a3
{
}

- (int)start
{
  p_int dataPath = &self->_dataPath;
  int dataPath = self->_dataPath;
  if (dataPath == 1)
  {
    int v7 = [(VCDatagramChannelIDS *)self setupVTPSocketWithFileDescriptor:4294967294];
    if (!v7) {
      [(IDSDatagramChannel *)self->_idsChannel start];
    }
    return v7;
  }
  if (dataPath)
  {
    int v7 = -2144600048;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        [(VCDatagramChannelIDS *)v8 start];
      }
    }
    return v7;
  }
  uint64_t v5 = [(IDSDatagramChannel *)self->_idsChannel underlyingFileDescriptor];

  return [(VCDatagramChannelIDS *)self setupVTPSocketWithFileDescriptor:v5];
}

- (void)invalidate
{
  int vtpSocket = self->_vtpSocket;
  if (vtpSocket != -1)
  {
    VTP_Close(vtpSocket);
    self->_int vtpSocket = -1;
  }
  [(VCObject *)self lock];
  [(IDSDatagramChannel *)self->_idsChannel invalidate];

  self->_idsChannel = 0;

  [(VCObject *)self unlock];
}

- (IDSDataChannelLinkContext)defaultLink
{
  return [(IDSDatagramChannel *)self->_idsChannel defaultLink];
}

- (NSArray)connectedLinks
{
  return [(IDSDatagramChannel *)self->_idsChannel connectedLinks];
}

- (int)setupVTPSocketWithFileDescriptor:(int)a3
{
  if (self->_vtpSocket != -1) {
    return 0;
  }
  int v4 = VTP_SocketForIDSWithFileDescriptor(a3, self->_token);
  self->_int vtpSocket = v4;
  if (v4 != -1) {
    return 0;
  }
  id v6 = __error();
  return VCSignalErrorAt(*v6 | 0xC02E0000, "Signalled error at %s: Failed to create VTP socket", v7, v8, v9, v10, v11, v12, (char)"-[VCDatagramChannelIDS setupVTPSocketWithFileDescriptor:]");
}

- (NSString)destination
{
  return self->_destination;
}

- (int)dataPath
{
  return self->_dataPath;
}

- (id)idsDatagramChannel
{
  return self->_idsChannel;
}

- (void)start
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = *a2;
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint64_t v7 = "-[VCDatagramChannelIDS start]";
  __int16 v8 = 1024;
  int v9 = 222;
  __int16 v10 = 1024;
  int v11 = v3;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Can not start VCDatagramChannel due to invalid dataPath value=%d", (uint8_t *)&v4, 0x22u);
}

@end