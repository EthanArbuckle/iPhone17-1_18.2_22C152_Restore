@interface VCMockIDSDatagramChannel
+ (void)extractRTPData:(char *)a3 ssrc:(unsigned int *)a4 sequenceNumber:(unsigned __int16 *)a5;
- (BOOL)createSocketWithSourcePort:(signed __int16)a3;
- (BOOL)enqueueDatagramPacket:(const void *)a3 datagramSize:(unsigned int)a4 options:(id *)a5 error:(id *)a6;
- (BOOL)idsUPlusOneMode;
- (BOOL)isControlChannelDatagram:(_VCMockIDSDatagramChannelPacket *)a3;
- (BOOL)isMediaPacket:(char *)a3 length:(unint64_t)a4;
- (BOOL)isNACKPacket:(char *)a3 length:(unint64_t)a4;
- (BOOL)isRTCPPacket:(char *)a3 length:(unint64_t)a4;
- (BOOL)isVideoPacket:(char *)a3 length:(unint64_t)a4;
- (BOOL)processDirectIDSPathWithDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramOptions:(id *)a5 error:(id *)a6;
- (BOOL)setupMockIDSDatagramChannelRequiresOptions:(BOOL)a3 sourcePort:(signed __int16)a4;
- (BOOL)shouldReadPacket:(_VCMockIDSDatagramChannelPacket *)a3;
- (_VCMockIDSDatagramChannelPacket)constructPacket:(_VCMockIDSDatagramChannelPacket *)a3 datagram:(const void *)a4 datagramSize:(unsigned int)a5 datagramOptions:(id *)a6;
- (id)encryptionInfoEventWithIsLocalKey:(BOOL)a3;
- (id)initCreateSocketRequiresOptions:(BOOL)a3 dataPath:(int)a4 destination:(id)a5;
- (id)initRequiresOptions:(BOOL)a3;
- (id)newArrayOfStreamIdsForPacket:(_VCMockIDSDatagramChannelPacket *)a3;
- (id)shortMKIPrefixLength;
- (int)drainUnderlyingFileDescriptor;
- (int)readyToRead;
- (int)underlyingFileDescriptor;
- (void)addMediaPacketToBuffer:(char *)a3 length:(unint64_t)a4 datagramOptions:(id *)a5;
- (void)cleanup;
- (void)dealloc;
- (void)dequeueDatagramPacket:(id)a3;
- (void)drainUnderlyingFileDescriptor;
- (void)flushDatagramPacketsList;
- (void)flushDatagramPacketsListDIrectIDSPath;
- (void)handlePacket:(_VCMockIDSDatagramChannelPacket *)a3 packetHandler:(id)a4 shouldDropThisPacket:(BOOL)a5;
- (void)invalidate;
- (void)printDroppedPacketInfo:(_VCMockIDSDatagramChannelPacket *)a3;
- (void)processPacket:(_VCMockIDSDatagramChannelPacket *)a3 packetHandler:(id)a4;
- (void)processWriteCompletionCallback:(id)a3 forDatagramWithSize:(unint64_t)a4 error:(id)a5;
- (void)readDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramOptions:(id *)a5;
- (void)readDatagramWithCompletionHandler:(id)a3;
- (void)readDatagramsWithCompletionHandler:(id)a3;
- (void)reportFirstPacketTimeForMKI:(id)a3;
- (void)requestSessionInfoWithOptions:(id)a3;
- (void)retrieveAndProcesOnePacket:(unsigned int)a3 seq:(unsigned __int16)a4 count:(int)a5 index:(int)a6;
- (void)retrieveAndProcessMediaPacketsFromBuffer:(tagRTCPPACKET *)a3 packetHandler:(id)a4;
- (void)setChannelPreferences:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setParticipantIDOnOptions:(id *)a3;
- (void)setReadHandler:(id)a3;
- (void)setReadHandlerWithOptions:(id)a3;
- (void)setReadyToReadBlock:(id)a3;
- (void)setUPlusOneMode:(BOOL)a3 isInitiator:(BOOL)a4;
- (void)setWriteCompletionHandler:(id)a3;
- (void)setWriteDatagramBlock:(id)a3;
- (void)setWriteDatagramsBlock:(id)a3;
- (void)signalUnderlyingFileDescriptor;
- (void)start;
- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6 completionHandler:(id)a7;
- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 flags:(id)a5 completionHandler:(id)a6;
- (void)writeDatagrams:(const void *)a3 datagramsSize:(unsigned int *)a4 datagramsInfo:(id *)a5 datagramsCount:(int)a6 options:(id *)a7 completionHandler:(id)a8;
@end

@implementation VCMockIDSDatagramChannel

- (BOOL)setupMockIDSDatagramChannelRequiresOptions:(BOOL)a3 sourcePort:(signed __int16)a4
{
  v6 = [[VCMockIDSDataChannelLinkContext alloc] initWithSourcePort:a4];
  self->_linkContext = v6;
  if (v6)
  {
    v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    self->_blockSettingLock = v7;
    if (v7)
    {
      v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
      self->_writeDirectPathIDSLock = v8;
      if (v8)
      {
        v9 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
        self->_flushDatagramPacketsLock = v9;
        if (v9)
        {
          if (VCAllocatorFirstCome_Create((const __CFAllocator *)*MEMORY[0x1E4F1CF80], (uint64_t)"com.apple.AVConference.VCMockIDSDatagramChannel.MOCKDatagramChannelPacketAllocator", &self->_datagramPacketAllocator))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
              if (!v12) {
                return v12;
              }
              -[VCMockIDSDatagramChannel setupMockIDSDatagramChannelRequiresOptions:sourcePort:].cold.6();
            }
          }
          else
          {
            VCSingleLinkedListInitialize((uint64_t)&self->_datagramPackets, (uint64_t)_VCMockIDSDatagramChannel_ComparePacket);
            VCSingleLinkedListInitialize((uint64_t)&self->_datagramPacketsDirectIDSPath, (uint64_t)_VCMockIDSDatagramChannel_ComparePacket);
            self->_usingOptions = a3;
            objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "emulatedRxPLR");
            self->_emulatedRxPLR = v10;
            pthread_mutex_init(&self->_streamSubscriptionLock, 0);
            self->_subscribedStreamsByParticipantID = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            self->_doNotDropNackOrRetransmitted = +[VCDefaults BOOLeanValueForKey:@"enableMockDatagramChannelDoNotDropNack" defaultValue:0];
            self->_isSourceParticipantIDOnFanOutPacketsEnabled = +[VCDefaults BOOLeanValueForKey:@"mockDatagramChannelAddSourceParticipantIDOnFanOutPackets" defaultValue:0];
            self->_isWrongParticipantIDOnFanOutPacketsEnabled = +[VCDefaults BOOLeanValueForKey:@"mockDatagramChannelAddWrongParticipantIDOnFanOutPackets" defaultValue:0];
            self->_isECNEnabled = VCDefaults_GetBoolValueForKey(@"ecnEnabled", 0);
            self->_isShortMKIEnabled = VCFeatureFlagManager_UseShortMKI();
            self->_isTestNetworkRouterEnabled = VCDefaults_GetBoolValueForKey(@"enableTestNetworkRouter", 0);
            self->_isTwoWayFaceTimeTestUsingSocketsEnabled = VCDefaults_GetBoolValueForKey(@"twoWayFaceTimeTestUsingSocketsEnabled", 0);
            bzero(self->_packetBuffer, 0x2EE000uLL);
            if (!self->_isTwoWayFaceTimeTestUsingSocketsEnabled
              || (v11 = (tagVCRealTimeThread *)VCRealTimeThread_Initialize(20, (uint64_t)VCMockIDSDatagramChannelReceiveThread, (uint64_t)self, "com.apple.avconference.mockdatagramchannel.recvproc", 3), (self->_packetReceiveThread = v11) != 0))
            {
              LOBYTE(v12) = 1;
              return v12;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
              if (!v12) {
                return v12;
              }
              -[VCMockIDSDatagramChannel setupMockIDSDatagramChannelRequiresOptions:sourcePort:].cold.5();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v12) {
            return v12;
          }
          -[VCMockIDSDatagramChannel setupMockIDSDatagramChannelRequiresOptions:sourcePort:].cold.4();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v12) {
          return v12;
        }
        -[VCMockIDSDatagramChannel setupMockIDSDatagramChannelRequiresOptions:sourcePort:]();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v12) {
        return v12;
      }
      -[VCMockIDSDatagramChannel setupMockIDSDatagramChannelRequiresOptions:sourcePort:]();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v12) {
      return v12;
    }
    -[VCMockIDSDatagramChannel setupMockIDSDatagramChannelRequiresOptions:sourcePort:]();
  }
  LOBYTE(v12) = 0;
  return v12;
}

- (id)initRequiresOptions:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VCMockIDSDatagramChannel;
  v4 = [(IDSDatagramChannel *)&v10 initWithSocketDescriptor:0];
  v5 = v4;
  if (v4)
  {
    if ([(VCMockIDSDatagramChannel *)v4 setupMockIDSDatagramChannelRequiresOptions:v3 sourcePort:16430])
    {
      v5->_isValid = 1;
      v5->_isNackEnabled = VCDefaults_GetIntValueForKey(@"suppressNackFulfillmentByMockIDSDatagramChannel", 0) == 0;
    }
    else
    {

      v5 = 0;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E4F47A50];
    v8 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v12 = v6;
        __int16 v13 = 2080;
        v14 = "-[VCMockIDSDatagramChannel initRequiresOptions:]";
        __int16 v15 = 1024;
        int v16 = 262;
        __int16 v17 = 2048;
        v18 = v5;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMockIDSDatagramChannel=%p created", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[VCMockIDSDatagramChannel initRequiresOptions:]();
    }
  }
  return v5;
}

- (id)initCreateSocketRequiresOptions:(BOOL)a3 dataPath:(int)a4 destination:(id)a5
{
  BOOL v7 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)VCMockIDSDatagramChannel;
  v8 = [(IDSDatagramChannel *)&v25 initWithSocketDescriptor:0];
  if (v8)
  {
    if (a5
      && (v9 = (void *)[a5 componentsSeparatedByString:@":"]) != 0
      && (objc_super v10 = v9, (unint64_t)[v9 count] >= 2)
      && (int)objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 1), "intValue") >= 1)
    {
      __int16 v11 = objc_msgSend((id)objc_msgSend(v10, "objectAtIndexedSubscript:", 1), "intValue");
    }
    else
    {
      __int16 v11 = 16430;
    }
    int v12 = v11;
    if ([(VCMockIDSDatagramChannel *)v8 setupMockIDSDatagramChannelRequiresOptions:v7 sourcePort:v11])
    {
      BOOL v13 = [(VCMockIDSDatagramChannel *)v8 createSocketWithSourcePort:v11];
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v13)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          uint64_t v15 = VRTraceErrorLogLevelToCSTR();
          int v16 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int socket = v8->_socket;
            *(_DWORD *)buf = 136316162;
            uint64_t v27 = v15;
            __int16 v28 = 2080;
            v29 = "-[VCMockIDSDatagramChannel initCreateSocketRequiresOptions:dataPath:destination:]";
            __int16 v30 = 1024;
            int v31 = 278;
            __int16 v32 = 1024;
            int v33 = socket;
            __int16 v34 = 1024;
            int v35 = v12;
            _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created socket=%d for sourcePort=%u", buf, 0x28u);
          }
        }
        CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(58);
        dispatch_queue_t v19 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMockIDSDatagramChannel.directPathReadQueue", 0, CustomRootQueue);
        v8->_directPathReadQueue = (OS_dispatch_queue *)v19;
        if (v19)
        {
          v20 = VCDispatchQueue_GetCustomRootQueue(56);
          dispatch_queue_t v21 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMockIDSDatagramChannel.directPathRTXQueue", 0, v20);
          v8->_directPathRTXQueue = (OS_dispatch_queue *)v21;
          if (v21)
          {
            v8->_isValid = 1;
            v8->_isNackEnabled = VCDefaults_GetIntValueForKey(@"suppressNackFulfillmentByMockIDSDatagramChannel", 0) == 0;
            v8->_dataPath = a4;
            return v8;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCMockIDSDatagramChannel initCreateSocketRequiresOptions:dataPath:destination:]();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMockIDSDatagramChannel initCreateSocketRequiresOptions:dataPath:destination:]();
          }
        }
      }
      else if (ErrorLogLevelForModule >= 3)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMockIDSDatagramChannel initCreateSocketRequiresOptions:dataPath:destination:](v24);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMockIDSDatagramChannel initCreateSocketRequiresOptions:dataPath:destination:].cold.4(v23);
      }
    }

    return 0;
  }
  return v8;
}

- (void)flushDatagramPacketsList
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Datagram packet queue has remaining elements", v2, v3, v4, v5, v6);
}

- (void)flushDatagramPacketsListDIrectIDSPath
{
  p_datagramPacketsDirectIDSPath = (uint64_t *)&self->_datagramPacketsDirectIDSPath;
  uint64_t v4 = VCSingleLinkedListPop((uint64_t *)&self->_datagramPacketsDirectIDSPath);
  if (v4)
  {
    uint64_t v5 = v4;
    do
    {
      CFAllocatorDeallocate(self->_datagramPacketAllocator, v5);
      uint64_t v5 = VCSingleLinkedListPop(p_datagramPacketsDirectIDSPath);
    }
    while (v5);
  }
}

- (void)cleanup
{
  VCCloseSocketIfValid(self->_socket);
  self->_int socket = -1;
  id eventHandler = self->_eventHandler;
  if (eventHandler)
  {
    CFRelease(eventHandler);
    self->_id eventHandler = 0;
  }
  [(VCMockIDSDatagramChannel *)self flushDatagramPacketsList];
  [(NSLock *)self->_flushDatagramPacketsLock lock];
  [(VCMockIDSDatagramChannel *)self flushDatagramPacketsListDIrectIDSPath];
  [(NSLock *)self->_flushDatagramPacketsLock unlock];
  datagramPacketAllocator = self->_datagramPacketAllocator;
  if (datagramPacketAllocator)
  {
    CFRelease(datagramPacketAllocator);
    self->_datagramPacketAllocator = 0;
  }
  id readHandlerWithOptions = self->_readHandlerWithOptions;
  if (readHandlerWithOptions)
  {
    CFRelease(readHandlerWithOptions);
    self->_id readHandlerWithOptions = 0;
  }
  id readHandler = self->_readHandler;
  if (readHandler)
  {
    CFRelease(readHandler);
    self->_id readHandler = 0;
  }
  id sharedWriteCompletionHandler = self->_sharedWriteCompletionHandler;
  if (sharedWriteCompletionHandler)
  {
    CFRelease(sharedWriteCompletionHandler);
    self->_id sharedWriteCompletionHandler = 0;
  }
  linkContext = self->_linkContext;
  if (linkContext)
  {
    CFRelease(linkContext);
    self->_linkContext = 0;
  }
  id writeDatagramsBlock = self->_writeDatagramsBlock;
  if (writeDatagramsBlock)
  {
    CFRelease(writeDatagramsBlock);
    self->_id writeDatagramsBlock = 0;
  }
  id writeDatagramBlock = self->_writeDatagramBlock;
  if (writeDatagramBlock)
  {
    CFRelease(writeDatagramBlock);
    self->_id writeDatagramBlock = 0;
  }
  id readyToReadBlock = self->_readyToReadBlock;
  if (readyToReadBlock)
  {
    CFRelease(readyToReadBlock);
    self->_id readyToReadBlock = 0;
  }
  subscribedStreamsByParticipantID = self->_subscribedStreamsByParticipantID;
  if (subscribedStreamsByParticipantID)
  {
    CFRelease(subscribedStreamsByParticipantID);
    self->_subscribedStreamsByParticipantID = 0;
  }
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (self->_isValid) {
    [(VCMockIDSDatagramChannel *)self cleanup];
  }
  self->_isValid = 0;

  self->_blockSettingLock = 0;
  self->_writeDirectPathIDSLock = 0;

  self->_flushDatagramPacketsLock = 0;
  directPathReadQueue = self->_directPathReadQueue;
  if (directPathReadQueue)
  {
    dispatch_release(directPathReadQueue);
    self->_directPathReadQueue = 0;
  }
  directPathRTXQueue = self->_directPathRTXQueue;
  if (directPathRTXQueue)
  {
    dispatch_release(directPathRTXQueue);
    self->_directPathRTXQueue = 0;
  }
  pthread_mutex_destroy(&self->_streamSubscriptionLock);
  v5.receiver = self;
  v5.super_class = (Class)VCMockIDSDatagramChannel;
  [(IDSDatagramChannel *)&v5 dealloc];
}

- (BOOL)idsUPlusOneMode
{
  return [(VCMockIDSDataChannelLinkContext *)self->_linkContext idsUPlusOneMode];
}

- (void)readDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramOptions:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t isECNEnabled = self->_isECNEnabled;
  unsigned __int8 v10 = [(VCMockIDSDataChannelLinkContext *)self->_linkContext linkID];
  if (v6 || a5 && a5->var7)
  {
    uint64_t v11 = isECNEnabled << 32;
    id readHandler = (void (**)(id, const void *, uint64_t, uint64_t, uint64_t, void))self->_readHandler;
    if (readHandler) {
      readHandler[2](readHandler, a3, v6, v11 | 0xAA000000AA00 | v10, 43520, 0);
    }
    id readHandlerWithOptions = self->_readHandlerWithOptions;
    if (readHandlerWithOptions)
    {
      v14 = (void (*)(void))*((void *)readHandlerWithOptions + 2);
      v14();
    }
  }
}

- (void)setWriteDatagramsBlock:(id)a3
{
  [(NSLock *)self->_blockSettingLock lock];
  id writeDatagramsBlock = self->_writeDatagramsBlock;
  if (writeDatagramsBlock)
  {
    CFRelease(writeDatagramsBlock);
    self->_id writeDatagramsBlock = 0;
  }
  self->_id writeDatagramsBlock = (id)[a3 copy];
  blockSettingLock = self->_blockSettingLock;

  [(NSLock *)blockSettingLock unlock];
}

- (void)setWriteDatagramBlock:(id)a3
{
  [(NSLock *)self->_blockSettingLock lock];
  id writeDatagramBlock = self->_writeDatagramBlock;
  if (writeDatagramBlock)
  {
    CFRelease(writeDatagramBlock);
    self->_id writeDatagramBlock = 0;
  }
  self->_id writeDatagramBlock = (id)[a3 copy];
  blockSettingLock = self->_blockSettingLock;

  [(NSLock *)blockSettingLock unlock];
}

- (void)setReadyToReadBlock:(id)a3
{
  [(NSLock *)self->_blockSettingLock lock];
  id readyToReadBlock = self->_readyToReadBlock;
  if (readyToReadBlock)
  {
    CFRelease(readyToReadBlock);
    self->_id readyToReadBlock = 0;
  }
  self->_id readyToReadBlock = (id)[a3 copy];
  blockSettingLock = self->_blockSettingLock;

  [(NSLock *)blockSettingLock unlock];
}

- (void)signalUnderlyingFileDescriptor
{
  __error();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9_10();
  OUTLINED_FUNCTION_6_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Send failed %d errno %d", v2, v3, v4, v5, 2u);
}

+ (void)extractRTPData:(char *)a3 ssrc:(unsigned int *)a4 sequenceNumber:(unsigned __int16 *)a5
{
  if (a3 && a5) {
    *a5 = bswap32(*((unsigned __int16 *)a3 + 1)) >> 16;
  }
  if (a3)
  {
    if (a4) {
      *a4 = bswap32(*((_DWORD *)a3 + 2));
    }
  }
}

- (BOOL)enqueueDatagramPacket:(const void *)a3 datagramSize:(unsigned int)a4 options:(id *)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_blockSettingLock lock];
  if (!self->_isValid)
  {
    if (a6)
    {
      int v16 = (void *)MEMORY[0x1E4F28C58];
      __int16 v17 = @"Trying to enqueue to invalidated VCMockIDSDatagramChannel";
LABEL_12:
      BOOL v18 = 0;
      *a6 = (id)[v16 AVConferenceServiceError:32000 detailCode:0 description:v17];
      goto LABEL_19;
    }
LABEL_13:
    BOOL v18 = 0;
    goto LABEL_19;
  }
  uint64_t v11 = CFAllocatorAllocate(self->_datagramPacketAllocator, 1656, 0);
  if (!v11)
  {
    if (a6)
    {
      int v16 = (void *)MEMORY[0x1E4F28C58];
      __int16 v17 = @"Failed to allocate packet";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  int v12 = [(VCMockIDSDatagramChannel *)self constructPacket:v11 datagram:a3 datagramSize:v8 datagramOptions:a5];
  BOOL v13 = [(VCMockIDSDatagramChannel *)self isNACKPacket:v12->var1 length:v12->var2];
  char v14 = VCSingleLinkedListPush((uint64_t)&self->_datagramPackets, v12);
  [(VCMockIDSDatagramChannel *)self signalUnderlyingFileDescriptor];
  if ((v14 & 1) == 0)
  {
    if (v13)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMockIDSDatagramChannel enqueueDatagramPacket:datagramSize:options:error:](v15);
        }
      }
    }
    else
    {
      unsigned __int16 v23 = 0;
      int v22 = 0;
      +[VCMockIDSDatagramChannel extractRTPData:v12->var1 ssrc:&v22 sequenceNumber:&v23];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316674;
          uint64_t v25 = v19;
          __int16 v26 = 2080;
          uint64_t v27 = "-[VCMockIDSDatagramChannel enqueueDatagramPacket:datagramSize:options:error:]";
          __int16 v28 = 1024;
          int v29 = 454;
          __int16 v30 = 1024;
          int v31 = v22;
          __int16 v32 = 1024;
          int v33 = v22;
          __int16 v34 = 1024;
          int v35 = v23;
          __int16 v36 = 1024;
          int v37 = v23;
          _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d failing to enqueue Media ssrc=%u ssrc_hex=%x seq=%d seq_hex=%x", buf, 0x34u);
        }
      }
    }
    CFAllocatorDeallocate(self->_datagramPacketAllocator, v12);
  }
  BOOL v18 = 1;
LABEL_19:
  [(NSLock *)self->_blockSettingLock unlock];
  return v18;
}

- (BOOL)isControlChannelDatagram:(_VCMockIDSDatagramChannelPacket *)a3
{
  return (a3->var1[0] & 0xC3) == 64;
}

- (id)newArrayOfStreamIdsForPacket:(_VCMockIDSDatagramChannelPacket *)a3
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3->var4.var4];
  if (a3->var4.var4 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = (void *)[objc_alloc(NSNumber) initWithUnsignedShort:a3->var4.var5[v5]];
      [v4 addObject:v6];

      ++v5;
    }
    while (v5 < a3->var4.var4);
  }
  return v4;
}

- (BOOL)shouldReadPacket:(_VCMockIDSDatagramChannelPacket *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (-[VCMockIDSDatagramChannel isControlChannelDatagram:](self, "isControlChannelDatagram:")) {
    return 1;
  }
  if (!a3->var3) {
    goto LABEL_7;
  }
  if (!a3->var4.var4) {
    return 1;
  }
  if (a3->var4.var7 && (a3->var4.var0 & 0x40) != 0)
  {
    self->_datagramOptionsCached.statsID = a3->var4.var7;
    self->_datagramOptionsCached.statsPayload.totalServerPacketSent = self->numPacketSent;
    self->_datagramOptionsCached.statsPayload.totalServerPacketReceived = self->numPacketReceived;
    self->_datagramOptionsCached.statsPayload.serverTimestamp = (int)(micro() * 1000.0);
    char v21 = 1;
    self->_isServerStatsCached = 1;
    a3->var4.var7 = 0;
    a3->var4.var0 &= ~0x40u;
    a3->var4.var8.var4 = 0;
    *(void *)&a3->var4.var8.var0 = 0;
  }
  else
  {
LABEL_7:
    char v21 = 0;
  }
  pthread_mutex_lock(&self->_streamSubscriptionLock);
  BOOL v5 = [(VCMockIDSDataChannelLinkContext *)self->_linkContext idsUPlusOneMode];
  id v6 = [(VCMockIDSDatagramChannel *)self newArrayOfStreamIdsForPacket:a3];
  p_streamSubscriptionLock = &self->_streamSubscriptionLock;
  if (-[NSDictionary count](self->_subscribedStreamsByParticipantID, "count") && [v6 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    subscribedStreamsByParticipantID = self->_subscribedStreamsByParticipantID;
    uint64_t v8 = [(NSDictionary *)subscribedStreamsByParticipantID countByEnumeratingWithState:&v23 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(subscribedStreamsByParticipantID);
          }
          if (v5)
          {
            BOOL v5 = 1;
            goto LABEL_26;
          }
          int v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithArray:", -[NSDictionary objectForKeyedSubscript:](self->_subscribedStreamsByParticipantID, "objectForKeyedSubscript:", *(void *)(*((void *)&v23 + 1) + 8 * i)));
          objc_msgSend(v12, "intersectSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v6));
          uint64_t v13 = [v12 count];
          BOOL v5 = v13 != 0;
          if (v13)
          {
            char v14 = v21;
            if (!self->_isServerStatsCached) {
              char v14 = 1;
            }
            if ((v14 & 1) == 0 && a3->var3)
            {
              a3->var4.var0 |= 0x40u;
              a3->var4.var7 = self->_datagramOptionsCached.statsID;
              uint64_t v15 = *(void *)&self->_datagramOptionsCached.statsPayload.serverTimestamp;
              a3->var4.var8.var4 = self->_datagramOptionsCached.statsPayload.uplinkBandwidth;
              *(void *)&a3->var4.var8.var0 = v15;
              self->_isServerStatsCached = 0;
            }
          }
        }
        uint64_t v9 = [(NSDictionary *)subscribedStreamsByParticipantID countByEnumeratingWithState:&v23 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    BOOL v18 = *MEMORY[0x1E4F47A50];
    uint64_t v19 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v28 = v17;
        __int16 v29 = 2080;
        __int16 v30 = "-[VCMockIDSDatagramChannel shouldReadPacket:]";
        __int16 v31 = 1024;
        int v32 = 515;
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Trying to filter packet when there is either no stream subscription or packet's streamID isnt set", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      -[VCMockIDSDatagramChannel shouldReadPacket:]();
    }
  }
LABEL_26:

  pthread_mutex_unlock(p_streamSubscriptionLock);
  return v5;
}

- (void)dequeueDatagramPacket:(id)a3
{
  [(NSLock *)self->_blockSettingLock lock];
  while (self->_isValid)
  {
    BOOL v5 = VCSingleLinkedListPop((uint64_t *)&self->_datagramPackets);
    if (!v5) {
      break;
    }
    id v6 = v5;
    [(VCMockIDSDatagramChannel *)self processPacket:v5 packetHandler:a3];
    CFAllocatorDeallocate(self->_datagramPacketAllocator, v6);
  }
  blockSettingLock = self->_blockSettingLock;

  [(NSLock *)blockSettingLock unlock];
}

- (BOOL)isVideoPacket:(char *)a3 length:(unint64_t)a4
{
  char v4 = 0;
  if (a3 && a4 >= 2)
  {
    int16x4_t v5 = (int16x4_t)vand_s8((int8x8_t)vdup_n_s32(a3[1]), (int8x8_t)0x7E0000007FLL);
    int16x4_t v6 = vuzp1_s16(v5, v5);
    int16x4_t v7 = vzip1_s16(v6, v6);
    v7.i16[2] = v6.i16[0];
    char v4 = vmaxv_u16((uint16x4_t)vceq_s16(v7, (int16x4_t)0x7C0064007E007BLL)) | ((v5.i8[0] - 24) < 0xAu) | ((v5.i8[0] - 109) < 2u);
  }
  return v4 & 1;
}

- (BOOL)isMediaPacket:(char *)a3 length:(unint64_t)a4
{
  BOOL result = 0;
  if (a3)
  {
    if (a4) {
      return (*a3 & 0xC0) == 128;
    }
  }
  return result;
}

- (BOOL)isRTCPPacket:(char *)a3 length:(unint64_t)a4
{
  BOOL result = 0;
  if (a3)
  {
    if (a4) {
      return (*a3 & 0xC0) == 64;
    }
  }
  return result;
}

- (BOOL)isNACKPacket:(char *)a3 length:(unint64_t)a4
{
  BOOL result = 0;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    if (a3[1] << 8 == 52480)
    {
      unsigned int v7 = *((unsigned __int16 *)a3 + 1);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v10 = bswap32(*((_DWORD *)a3 + 1));
          unsigned int v11 = bswap32(*((_DWORD *)a3 + 2));
          unsigned int v12 = bswap32(*((unsigned __int16 *)a3 + 6));
          unsigned int v13 = bswap32(*((unsigned __int16 *)a3 + 7));
          int v14 = 136317954;
          uint64_t v15 = v8;
          __int16 v16 = 2080;
          uint64_t v17 = "-[VCMockIDSDatagramChannel isNACKPacket:length:]";
          __int16 v18 = 1024;
          int v19 = 598;
          __int16 v20 = 1024;
          unsigned int v21 = v10;
          __int16 v22 = 1024;
          unsigned int v23 = v10;
          __int16 v24 = 1024;
          unsigned int v25 = v11;
          __int16 v26 = 1024;
          unsigned int v27 = v11;
          __int16 v28 = 1024;
          unsigned int v29 = HIWORD(v12);
          __int16 v30 = 1024;
          unsigned int v31 = HIWORD(v12);
          __int16 v32 = 1024;
          unsigned int v33 = HIWORD(v13);
          __int16 v34 = 2048;
          unint64_t v35 = a4;
          __int16 v36 = 2048;
          uint64_t v37 = bswap32(v7) >> 16;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Generic NACK packet received, ssrc=%u ssrc_hex=%x source_ssrc=%u source_ssrc_hex=%x highestSeqNum=%d highestSeqNum_hex=%x bitMask=%x length passed=%zu length in pkt=%zu", (uint8_t *)&v14, 0x5Au);
        }
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)readDatagramWithCompletionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    char v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VCMockIDSDatagramChannel readDatagramWithCompletionHandler:]";
      __int16 v9 = 1024;
      int v10 = 607;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unit Test: readDatagramWithCompletionHandler NOT SUPPORTED", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)processWriteCompletionCallback:(id)a3 forDatagramWithSize:(unint64_t)a4 error:(id)a5
{
  [(NSLock *)self->_writeDirectPathIDSLock lock];
  if (a3)
  {
    (*((void (**)(id, id))a3 + 2))(a3, a5);
  }
  else
  {
    id sharedWriteCompletionHandler = (void (**)(id, id, unint64_t))self->_sharedWriteCompletionHandler;
    if (sharedWriteCompletionHandler) {
      sharedWriteCompletionHandler[2](sharedWriteCompletionHandler, a5, a4);
    }
  }
  writeDirectPathIDSLock = self->_writeDirectPathIDSLock;

  [(NSLock *)writeDirectPathIDSLock unlock];
}

- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 flags:(id)a5 completionHandler:(id)a6
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id writeDatagramBlock = self->_writeDatagramBlock;
  if (writeDatagramBlock)
  {
    int v10 = (void (*)(void))*((void *)writeDatagramBlock + 2);
    v10();
  }
  else
  {
    uint64_t v11 = 0;
    if (self->_dataPath == 1) {
      [(VCMockIDSDatagramChannel *)self processDirectIDSPathWithDatagram:a3 datagramSize:*(void *)&a4 datagramOptions:0 error:&v11];
    }
    else {
      [(VCMockIDSDatagramChannel *)self enqueueDatagramPacket:a3 datagramSize:*(void *)&a4 options:0 error:&v11];
    }
    -[VCMockIDSDatagramChannel processWriteCompletionCallback:forDatagramWithSize:error:](self, "processWriteCompletionCallback:forDatagramWithSize:error:", a6, a4, v11, v11, v12);
  }
}

- (void)readDatagramsWithCompletionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    char v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VCMockIDSDatagramChannel readDatagramsWithCompletionHandler:]";
      __int16 v9 = 1024;
      int v10 = 639;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unit Test: call to readDatagramsWithCompletionHandler NOT SUPPORTED", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6 completionHandler:(id)a7
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_isValid)
  {
    id writeDatagramBlock = self->_writeDatagramBlock;
    if (writeDatagramBlock)
    {
      uint64_t v11 = (void (*)(void))*((void *)writeDatagramBlock + 2);
      v11();
    }
    else
    {
      uint64_t v12 = 0;
      if (self->_dataPath == 1) {
        [+[VCMockRouter sharedInstance] routeDatagram:a3 datagramSize:*(void *)&a4 datagramOptions:a6 fromDatagramChannel:self error:&v12];
      }
      else {
        [(VCMockIDSDatagramChannel *)self enqueueDatagramPacket:a3 datagramSize:*(void *)&a4 options:a6 error:&v12];
      }
      -[VCMockIDSDatagramChannel processWriteCompletionCallback:forDatagramWithSize:error:](self, "processWriteCompletionCallback:forDatagramWithSize:error:", a7, a4, v12, v12, v13);
    }
  }
}

- (void)writeDatagrams:(const void *)a3 datagramsSize:(unsigned int *)a4 datagramsInfo:(id *)a5 datagramsCount:(int)a6 options:(id *)a7 completionHandler:(id)a8
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_isValid)
  {
    id writeDatagramsBlock = self->_writeDatagramsBlock;
    if (writeDatagramsBlock)
    {
      int v14 = (void (*)(void))*((void *)writeDatagramsBlock + 2);
      v14();
    }
    else
    {
      uint64_t v24 = 0;
      if (a6 < 1)
      {
        uint64_t v23 = 0;
        uint64_t v16 = 0;
      }
      else
      {
        unint64_t v15 = 0;
        uint64_t v16 = 0;
        unint64_t v17 = a6;
        do
        {
          __int16 v18 = a3[v15];
          uint64_t v19 = a4[v15];
          __int16 v20 = a7[v15];
          if (self->_dataPath == 1) {
            BOOL v21 = [(VCMockIDSDatagramChannel *)self processDirectIDSPathWithDatagram:v18 datagramSize:v19 datagramOptions:v20 error:&v24];
          }
          else {
            BOOL v21 = [(VCMockIDSDatagramChannel *)self enqueueDatagramPacket:v18 datagramSize:v19 options:v20 error:&v24];
          }
          v16 += a4[v15++];
        }
        while (v21 && v15 < v17);
        uint64_t v23 = v24;
      }
      -[VCMockIDSDatagramChannel processWriteCompletionCallback:forDatagramWithSize:error:](self, "processWriteCompletionCallback:forDatagramWithSize:error:", a8, v16, v23, v24, v25);
    }
  }
}

- (BOOL)processDirectIDSPathWithDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramOptions:(id *)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  [(NSLock *)self->_writeDirectPathIDSLock lock];
  if (self->_isValid)
  {
    uint64_t v11 = CFAllocatorAllocate(self->_datagramPacketAllocator, 1656, 0);
    if (v11)
    {
      [(VCMockIDSDatagramChannel *)self constructPacket:v11 datagram:a3 datagramSize:v8 datagramOptions:a5];
LABEL_4:
      -[VCMockIDSDatagramChannel processPacket:packetHandler:](self, "processPacket:packetHandler:");
      [(NSLock *)self->_writeDirectPathIDSLock unlock];
      return 1;
    }
    if (!a6) {
      goto LABEL_4;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    int v14 = @"Failed to allocate packet";
    goto LABEL_9;
  }
  if (a6)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    int v14 = @"Trying to process datagrams using invalidated VCMockIDSDatagramChannel";
LABEL_9:
    *a6 = (id)[v13 AVConferenceServiceError:32000 detailCode:0 description:v14];
  }
  [(NSLock *)self->_writeDirectPathIDSLock unlock];
  return 0;
}

void __96__VCMockIDSDatagramChannel_processDirectIDSPathWithDatagram_datagramSize_datagramOptions_error___block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2 && a3 && a4)
  {
    long long v4 = *(_OWORD *)(a1 + 32);
    int v5 = *(NSObject **)(*(void *)(a1 + 32) + 3322304);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __96__VCMockIDSDatagramChannel_processDirectIDSPathWithDatagram_datagramSize_datagramOptions_error___block_invoke_2;
    v8[3] = &unk_1E6DB8C70;
    long long v9 = v4;
    int v12 = a3;
    uint64_t v10 = a2;
    uint64_t v11 = a4;
    dispatch_async(v5, v8);
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 40);
    if (v6)
    {
      CFAllocatorRef v7 = *(const __CFAllocator **)(*(void *)(a1 + 32) + 192);
      CFAllocatorDeallocate(v7, v6);
    }
  }
}

void __96__VCMockIDSDatagramChannel_processDirectIDSPathWithDatagram_datagramSize_datagramOptions_error___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 36))
  {
    [(id)v2 readDatagram:*(void *)(a1 + 48) datagramSize:*(unsigned int *)(a1 + 64) datagramOptions:*(void *)(a1 + 56)];
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(void *)(v3 + 184) >= 0x5DDuLL)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v4 = VRTraceErrorLogLevelToCSTR();
        int v5 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136315650;
          uint64_t v10 = v4;
          __int16 v11 = 2080;
          int v12 = "-[VCMockIDSDatagramChannel processDirectIDSPathWithDatagram:datagramSize:datagramOptions:error:]_block_invoke_2";
          __int16 v13 = 1024;
          int v14 = 735;
          _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Empyting _datagramPacketsDirectIDSPath for next set of packets", (uint8_t *)&v9, 0x1Cu);
        }
      }
      [*(id *)(*(void *)(a1 + 32) + 120) lock];
      [*(id *)(a1 + 32) flushDatagramPacketsListDIrectIDSPath];
      [*(id *)(*(void *)(a1 + 32) + 120) unlock];
      uint64_t v3 = *(void *)(a1 + 32);
    }
    if ((VCSingleLinkedListPush(v3 + 160, *(void **)(a1 + 40)) & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __96__VCMockIDSDatagramChannel_processDirectIDSPathWithDatagram_datagramSize_datagramOptions_error___block_invoke_2_cold_1(v6);
        }
      }
      CFAllocatorDeallocate(*(CFAllocatorRef *)(*(void *)(a1 + 32) + 192), *(void **)(a1 + 40));
    }
  }
  else
  {
    CFAllocatorRef v7 = *(const __CFAllocator **)(v2 + 192);
    uint64_t v8 = *(void **)(a1 + 40);
    CFAllocatorDeallocate(v7, v8);
  }
}

- (void)invalidate
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_packetReceiveThread)
  {
    char v3 = 0;
    atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_isReceiveThreadTerminating, (unsigned __int8 *)&v3, 1u);
    if (!v3)
    {
      VCRealTimeThread_Stop((uint64_t)self->_packetReceiveThread);
      VCRealTimeThread_Finalize((uint64_t)self->_packetReceiveThread);
    }
  }
  [(NSLock *)self->_blockSettingLock lock];
  [(NSLock *)self->_writeDirectPathIDSLock lock];
  if (self->_isValid)
  {
    if ((VCMockIDSDatagramChannel *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_19;
      }
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      CFAllocatorRef v7 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = v6;
      __int16 v23 = 2080;
      uint64_t v24 = "-[VCMockIDSDatagramChannel invalidate]";
      __int16 v25 = 1024;
      int v26 = 766;
      uint64_t v8 = " [%s] %s:%d Unit Test: Invalidating VCMockIDSDatagramChannel";
      int v9 = v7;
      uint32_t v10 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)[(VCMockIDSDatagramChannel *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_19;
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      int v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v22 = v11;
      __int16 v23 = 2080;
      uint64_t v24 = "-[VCMockIDSDatagramChannel invalidate]";
      __int16 v25 = 1024;
      int v26 = 766;
      __int16 v27 = 2112;
      __int16 v28 = v4;
      __int16 v29 = 2048;
      __int16 v30 = self;
      uint64_t v8 = " [%s] %s:%d %@(%p) Unit Test: Invalidating VCMockIDSDatagramChannel";
      int v9 = v12;
      uint32_t v10 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_19:
    self->_isValid = 0;
    if (self->_eventHandler)
    {
      linkContext = self->_linkContext;
      if (linkContext)
      {
        uint64_t v14 = *MEMORY[0x1E4F6A718];
        v20[0] = &unk_1F3DC5BB0;
        uint64_t v15 = *MEMORY[0x1E4F6A6D0];
        v19[0] = v14;
        v19[1] = v15;
        __int16 v18 = linkContext;
        v20[1] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
        (*((void (**)(void))self->_eventHandler + 2))();
      }
    }
    [(VCMockIDSDatagramChannel *)self cleanup];
    self->_isValid = 0;
    [(NSLock *)self->_writeDirectPathIDSLock unlock];
    [(NSLock *)self->_blockSettingLock unlock];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      unint64_t v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v22 = v16;
        __int16 v23 = 2080;
        uint64_t v24 = "-[VCMockIDSDatagramChannel invalidate]";
        __int16 v25 = 1024;
        int v26 = 780;
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unit Test: Invalidated VCMockIDSDatagramChannel", buf, 0x1Cu);
      }
    }
    return;
  }
  [(NSLock *)self->_writeDirectPathIDSLock unlock];
  blockSettingLock = self->_blockSettingLock;

  [(NSLock *)blockSettingLock unlock];
}

- (void)start
{
  if (self->_packetReceiveThread)
  {
    self->_isReceiveThreadTerminating = 0;
    VCRealTimeThread_Start((uint64_t)self->_packetReceiveThread);
  }
}

- (id)encryptionInfoEventWithIsLocalKey:(BOOL)a3
{
  BOOL v3 = a3;
  v14[6] = *MEMORY[0x1E4F143B8];
  int v5 = (void *)CFPreferencesCopyAppValue(@"mockDatagramChannelRemoteParticipantID", @"com.apple.VideoConference");
  if (v3) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  id v7 = +[NetworkUtils encryptionInfoForKey:v6];
  uint64_t v8 = *MEMORY[0x1E4F6A718];
  v14[0] = &unk_1F3DC5BC8;
  uint64_t v9 = *MEMORY[0x1E4F6A918];
  v13[0] = v8;
  v13[1] = v9;
  v14[1] = objc_msgSend(v7, "objectForKeyedSubscript:");
  v13[2] = *MEMORY[0x1E4F6A920];
  v14[2] = objc_msgSend(v7, "objectForKeyedSubscript:");
  v13[3] = *MEMORY[0x1E4F6A910];
  v14[3] = objc_msgSend(v7, "objectForKeyedSubscript:");
  v13[4] = *MEMORY[0x1E4F6A908];
  v14[4] = [NSNumber numberWithBool:v3];
  v13[5] = *MEMORY[0x1E4F6A930];
  v14[5] = [(VCMockIDSDatagramChannel *)self shortMKIPrefixLength];
  id v10 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, v13, 6), "mutableCopy");
  uint64_t v11 = v10;
  if (v5)
  {
    [v10 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F6A928]];
  }
  return v11;
}

- (void)setEventHandler:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = [(VCMockIDSDatagramChannel *)self encryptionInfoEventWithIsLocalKey:1];
  id v6 = [(VCMockIDSDatagramChannel *)self encryptionInfoEventWithIsLocalKey:0];
  (*((void (**)(id, id))a3 + 2))(a3, v5);
  (*((void (**)(id, id))a3 + 2))(a3, v6);
  linkContext = self->_linkContext;
  if (linkContext)
  {
    uint64_t v8 = *MEMORY[0x1E4F6A718];
    v13[0] = &unk_1F3DC5BE0;
    uint64_t v9 = *MEMORY[0x1E4F6A6C0];
    v12[0] = v8;
    v12[1] = v9;
    uint64_t v11 = linkContext;
    v13[1] = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    (*((void (**)(id, uint64_t))a3 + 2))(a3, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2]);
  }
  id eventHandler = self->_eventHandler;
  if (eventHandler)
  {
    CFRelease(eventHandler);
    self->_id eventHandler = 0;
  }
  self->_id eventHandler = (id)[a3 copy];
}

- (void)setWriteCompletionHandler:(id)a3
{
  id sharedWriteCompletionHandler = self->_sharedWriteCompletionHandler;
  if (sharedWriteCompletionHandler)
  {
    CFRelease(sharedWriteCompletionHandler);
    self->_id sharedWriteCompletionHandler = 0;
  }
  self->_id sharedWriteCompletionHandler = (id)[a3 copy];
}

- (void)setReadHandler:(id)a3
{
  id readHandler = self->_readHandler;
  if (readHandler)
  {
    CFRelease(readHandler);
    self->_id readHandler = 0;
  }
  self->_id readHandler = (id)[a3 copy];
}

- (void)setReadHandlerWithOptions:(id)a3
{
  id readHandlerWithOptions = self->_readHandlerWithOptions;
  if (readHandlerWithOptions)
  {
    CFRelease(readHandlerWithOptions);
    self->_id readHandlerWithOptions = 0;
  }
  self->_id readHandlerWithOptions = (id)[a3 copy];
}

- (id)shortMKIPrefixLength
{
  if (self->_isShortMKIEnabled) {
    return &unk_1F3DC5BF8;
  }
  else {
    return &unk_1F3DC5C10;
  }
}

- (void)setChannelPreferences:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A7A8]])
  {
    id v4 = [(VCMockIDSDatagramChannel *)self encryptionInfoEventWithIsLocalKey:1];
    [(VCMockIDSDatagramChannel *)self encryptionInfoEventWithIsLocalKey:0];
    id eventHandler = (void (**)(id, id))self->_eventHandler;
    if (eventHandler)
    {
      eventHandler[2](eventHandler, v4);
      (*((void (**)(void))self->_eventHandler + 2))();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    id v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCMockIDSDatagramChannel setChannelPreferences:]";
      __int16 v12 = 1024;
      int v13 = 857;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unit Test: call to setChannelPreferences", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)requestSessionInfoWithOptions:(id)a3
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v6 = *MEMORY[0x1E4F6A6D8];
  uint64_t v49 = *MEMORY[0x1E4F28588];
  v50[0] = @"Could not serialize provided metadata.";
  unint64_t v7 = 0x1E4F1C000uLL;
  id v8 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 8, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1));
  pthread_mutex_lock(&self->_streamSubscriptionLock);

  uint64_t v9 = *MEMORY[0x1E4F6A848];
  if ([a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A848]]
    && (__int16 v10 = (void *)[a3 objectForKeyedSubscript:v9],
        [v10 objectForKeyedSubscript:*MEMORY[0x1E4F6A698]]))
  {
    uint64_t v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  }
  else
  {
    uint64_t v11 = (NSDictionary *)(id)[a3 objectForKeyedSubscript:v9];
  }
  self->_subscribedStreamsByParticipantID = v11;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  int v13 = [(NSDictionary *)self->_subscribedStreamsByParticipantID allValues];
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v45 objects:v44 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    id v31 = v8;
    uint64_t v16 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v46 != v16) {
          objc_enumerationMutation(v13);
        }
        __int16 v18 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        [v12 addObjectsFromArray:v18];
        int v19 = [v18 containsObject:&unk_1F3DC5C10];
      }
      int v20 = v19;
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v45 objects:v44 count:16];
    }
    while (v15);
    unint64_t v7 = 0x1E4F1C000;
    id v8 = v31;
  }
  else
  {
    int v20 = 0;
  }
  NSUInteger v21 = [(NSDictionary *)self->_subscribedStreamsByParticipantID count];
  NSUInteger v22 = [(NSDictionary *)self->_subscribedStreamsByParticipantID count];
  pthread_mutex_unlock(&self->_streamSubscriptionLock);
  id eventHandler = (void (**)(id, uint64_t))self->_eventHandler;
  if (eventHandler)
  {
    if (v22 == 1) {
      int v24 = v20;
    }
    else {
      int v24 = 0;
    }
    uint64_t v25 = *MEMORY[0x1E4F6A718];
    if (!v21 || v24)
    {
      uint64_t v28 = *MEMORY[0x1E4F6A6E0];
      v42[0] = *MEMORY[0x1E4F6A718];
      v42[1] = v28;
      v43[0] = &unk_1F3DC5C28;
      v43[1] = v8;
      eventHandler[2](eventHandler, [*(id *)(v7 + 2536) dictionaryWithObjects:v43 forKeys:v42 count:2]);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v29 = VRTraceErrorLogLevelToCSTR();
        __int16 v30 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v37 = v29;
          __int16 v38 = 2080;
          v39 = "-[VCMockIDSDatagramChannel requestSessionInfoWithOptions:]";
          __int16 v40 = 1024;
          int v41 = 890;
          _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unit Test: call to requestSessionInfoWithOptions only supported for stream subscription updates", buf, 0x1Cu);
        }
      }
    }
    else
    {
      v35[0] = &unk_1F3DC5C28;
      uint64_t v26 = *MEMORY[0x1E4F6A708];
      v34[0] = v25;
      v34[1] = v26;
      v32[0] = *MEMORY[0x1E4F6A760];
      __int16 v27 = NSNumber;
      ++self->_participantGenerationCounter;
      v33[0] = objc_msgSend(v27, "numberWithInteger:");
      v32[1] = *MEMORY[0x1E4F6A770];
      v33[1] = [v12 allObjects];
      v35[1] = [*(id *)(v7 + 2536) dictionaryWithObjects:v33 forKeys:v32 count:2];
      eventHandler[2](eventHandler, [*(id *)(v7 + 2536) dictionaryWithObjects:v35 forKeys:v34 count:2]);
    }
  }
}

- (void)reportFirstPacketTimeForMKI:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    id v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      id v8 = "-[VCMockIDSDatagramChannel reportFirstPacketTimeForMKI:]";
      __int16 v9 = 1024;
      int v10 = 902;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unit Test: call to reportFirstPacketTimeForMKI NOT SUPPORTED", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (BOOL)createSocketWithSourcePort:(signed __int16)a3
{
  int v4 = +[NetworkUtils socketWithIPAddress:@"127.0.0.1" srcPort:a3 shouldConnect:1 error:0];
  self->_int socket = v4;
  if (v4 == -1 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMockIDSDatagramChannel createSocketWithSourcePort:]();
    }
  }
  return v4 != -1;
}

- (int)underlyingFileDescriptor
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() > 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int socket = self->_socket;
      int v7 = 136315906;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      int v10 = "-[VCMockIDSDatagramChannel underlyingFileDescriptor]";
      __int16 v11 = 1024;
      int v12 = 916;
      __int16 v13 = 1024;
      int v14 = socket;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Returning underlyingFD %d", (uint8_t *)&v7, 0x22u);
    }
  }
  return self->_socket;
}

- (int)drainUnderlyingFileDescriptor
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v4 = -1431655766;
  int v2 = recv(self->_socket, &v4, 4uLL, 0);
  if (v2 < 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMockIDSDatagramChannel drainUnderlyingFileDescriptor]();
    }
  }
  return v2;
}

- (int)readyToRead
{
  v5[5] = *MEMORY[0x1E4F143B8];
  id readyToReadBlock = (void (**)(id, id))self->_readyToReadBlock;
  if (readyToReadBlock)
  {
    readyToReadBlock[2](readyToReadBlock, self->_readHandlerWithOptions);
  }
  else if (([(VCMockIDSDatagramChannel *)self drainUnderlyingFileDescriptor] & 0x80000000) == 0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__VCMockIDSDatagramChannel_readyToRead__block_invoke;
    v5[3] = &unk_1E6DB8CC0;
    v5[4] = self;
    [(VCMockIDSDatagramChannel *)self dequeueDatagramPacket:v5];
  }
  return 0;
}

uint64_t __39__VCMockIDSDatagramChannel_readyToRead__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) readDatagram:a2 datagramSize:a3 datagramOptions:a4];
}

- (_VCMockIDSDatagramChannelPacket)constructPacket:(_VCMockIDSDatagramChannelPacket *)a3 datagram:(const void *)a4 datagramSize:(unsigned int)a5 datagramOptions:(id *)a6
{
  unint64_t v9 = a5;
  memcpy(a3->var1, a4, a5);
  a3->var2 = v9;
  if (a6 && !self->_usingOptions)
  {
    a3->var3 = 1;
    long long v10 = *(_OWORD *)&a6->var0;
    long long v11 = *(_OWORD *)&a6->var2;
    long long v12 = *(_OWORD *)&a6->var8.var0;
    *(_OWORD *)&a3->var4.var5[6] = *(_OWORD *)&a6->var5[6];
    *(_OWORD *)&a3->var4.var8.var0 = v12;
    *(_OWORD *)&a3->var4.var0 = v10;
    *(_OWORD *)&a3->var4.var2 = v11;
    long long v13 = *(_OWORD *)&a6->var9;
    long long v14 = *(_OWORD *)&a6->var11;
    long long v15 = *(_OWORD *)a6->var13;
    *(void *)&a3->var4.var14 = *(void *)&a6->var14;
    *(_OWORD *)&a3->var4.var11 = v14;
    *(_OWORD *)a3->var4.var13 = v15;
    *(_OWORD *)&a3->var4.var9 = v13;
  }
  else
  {
    a3->var3 = 0;
  }
  unint64_t datagramPacketNextSequenceNumber = self->_datagramPacketNextSequenceNumber;
  self->_unint64_t datagramPacketNextSequenceNumber = datagramPacketNextSequenceNumber + 1;
  a3->var5 = datagramPacketNextSequenceNumber;
  return a3;
}

- (void)printDroppedPacketInfo:(_VCMockIDSDatagramChannelPacket *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  var1 = a3->var1;
  if ([(VCMockIDSDatagramChannel *)self isNACKPacket:a3->var1 length:a3->var2])
  {
    unsigned int v6 = *(unsigned __int16 *)&a3->var1[2];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v9 = bswap32(*(_DWORD *)&a3->var1[4]);
        unsigned int v10 = bswap32(*(_DWORD *)&a3->var1[8]);
        unsigned int v11 = bswap32(*(unsigned __int16 *)&a3->var1[12]);
        unsigned int v12 = bswap32(*(unsigned __int16 *)&a3->var1[14]);
        unint64_t var2 = a3->var2;
        *(_DWORD *)buf = 136317954;
        *(void *)&uint8_t buf[4] = v7;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCMockIDSDatagramChannel printDroppedPacketInfo:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 961;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v9;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = v9;
        *(_WORD *)&buf[40] = 1024;
        *(_DWORD *)&buf[42] = v10;
        *(_WORD *)&buf[46] = 1024;
        *(_DWORD *)&buf[48] = v10;
        *(_WORD *)&buf[52] = 1024;
        *(_DWORD *)&buf[54] = HIWORD(v11);
        *(_WORD *)&buf[58] = 1024;
        *(_DWORD *)&buf[60] = HIWORD(v11);
        LOWORD(v31) = 1024;
        *(_DWORD *)((char *)&v31 + 2) = HIWORD(v12);
        WORD3(v31) = 2048;
        *((void *)&v31 + 1) = var2;
        LOWORD(v32) = 2048;
        *(void *)((char *)&v32 + 2) = bswap32(v6) >> 16;
        long long v14 = " [%s] %s:%d Unit Test: emulating loss by dropping packet GGeneric NACK packet received, ssrc=%u ssrc_hex=%"
              "x source_ssrc=%u source_ssrc_hex=%x highestSeqNum=%d highestSeqNum_hex=%x bitMask=%x length passed=%zu length in pkt=%zu";
        long long v15 = v8;
        uint32_t v16 = 90;
LABEL_13:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else if ([(VCMockIDSDatagramChannel *)self isVideoPacket:var1 length:a3->var2])
  {
    unint64_t v17 = a3->var2;
    long long v18 = *(_OWORD *)&a3->var4.var11;
    long long v31 = *(_OWORD *)&a3->var4.var9;
    long long v32 = v18;
    long long v33 = *(_OWORD *)a3->var4.var13;
    uint64_t v34 = *(void *)&a3->var4.var14;
    long long v19 = *(_OWORD *)&a3->var4.var2;
    *(_OWORD *)buf = *(_OWORD *)&a3->var4.var0;
    *(_OWORD *)&buf[16] = v19;
    long long v20 = *(_OWORD *)&a3->var4.var8.var0;
    *(_OWORD *)&buf[32] = *(_OWORD *)&a3->var4.var5[6];
    *(_OWORD *)&buf[48] = v20;
    [(VCMockIDSDatagramChannel *)self addMediaPacketToBuffer:var1 length:v17 datagramOptions:buf];
    if (a3->var2 >= 0xC)
    {
      unsigned __int16 v29 = 0;
      int v28 = 0;
      +[VCMockIDSDatagramChannel extractRTPData:var1 ssrc:&v28 sequenceNumber:&v29];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        NSUInteger v22 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          float emulatedRxPLR = self->_emulatedRxPLR;
          BOOL var14 = a3->var4.var14;
          unint64_t v25 = a3->var2;
          *(_DWORD *)buf = 136316930;
          *(void *)&uint8_t buf[4] = v21;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCMockIDSDatagramChannel printDroppedPacketInfo:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 968;
          *(_WORD *)&buf[28] = 2048;
          *(double *)&buf[30] = emulatedRxPLR;
          *(_WORD *)&buf[38] = 1024;
          *(_DWORD *)&buf[40] = v28;
          *(_WORD *)&buf[44] = 1024;
          *(_DWORD *)&buf[46] = v29;
          *(_WORD *)&buf[50] = 1024;
          *(_DWORD *)&buf[52] = var14;
          *(_WORD *)&buf[56] = 1024;
          *(_DWORD *)&buf[58] = v25;
          long long v14 = " [%s] %s:%d Unit Test: emulating loss by dropping packet _emulatedRxPLR=%f ssrc=%u seqNum=%hu retransmit"
                "tedPacket=%d dataLength=%d";
          long long v15 = v22;
          uint32_t v16 = 62;
          goto LABEL_13;
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    __int16 v27 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCMockIDSDatagramChannel printDroppedPacketInfo:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 971;
      long long v14 = " [%s] %s:%d Unit Test: emulating loss by dropping packet";
      long long v15 = v27;
      uint32_t v16 = 28;
      goto LABEL_13;
    }
  }
}

- (void)processPacket:(_VCMockIDSDatagramChannelPacket *)a3 packetHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (0xAF8AF8AF8AF8AF8BLL * a3->var5 <= 0x750750750750750)
  {
    objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "emulatedRxPLR");
    self->_double emulatedRxPLR = v7;
  }
  if (a3->var3) {
    int v8 = (LOWORD(a3->var4.var0) >> 2) & 1;
  }
  else {
    LOWORD(v8) = 0;
  }
  self->numPacketSent += v8;
  BOOL v9 = [(VCMockIDSDatagramChannel *)self isNACKPacket:a3->var1 length:a3->var2];
  BOOL v10 = !v9 && !a3->var4.var14 || !self->_doNotDropNackOrRetransmitted;
  double emulatedRxPLR = self->_emulatedRxPLR;
  if (emulatedRxPLR > *(double *)""
    && ((double)(unsigned __int16)arc4random_uniform(0xFFFFu) / 65535.0 <= emulatedRxPLR ? (BOOL v12 = v10) : (BOOL v12 = 0), v12))
  {
    uint64_t v13 = 1;
  }
  else
  {
    self->numPacketReceived += v8;
    if (v9 && self->_isNackEnabled)
    {
      [(VCMockIDSDatagramChannel *)self retrieveAndProcessMediaPacketsFromBuffer:a3->var1 packetHandler:a4];
    }
    else if ([(VCMockIDSDatagramChannel *)self isVideoPacket:a3->var1 length:a3->var2])
    {
      unint64_t var2 = a3->var2;
      long long v15 = *(_OWORD *)&a3->var4.var11;
      v18[4] = *(_OWORD *)&a3->var4.var9;
      v18[5] = v15;
      v18[6] = *(_OWORD *)a3->var4.var13;
      uint64_t v19 = *(void *)&a3->var4.var14;
      long long v16 = *(_OWORD *)&a3->var4.var2;
      v18[0] = *(_OWORD *)&a3->var4.var0;
      v18[1] = v16;
      long long v17 = *(_OWORD *)&a3->var4.var8.var0;
      v18[2] = *(_OWORD *)&a3->var4.var5[6];
      v18[3] = v17;
      [(VCMockIDSDatagramChannel *)self addMediaPacketToBuffer:a3->var1 length:var2 datagramOptions:v18];
    }
    if (self->_isSourceParticipantIDOnFanOutPacketsEnabled && a3->var3 && a3->var4.var4 >= 1) {
      [(VCMockIDSDatagramChannel *)self setParticipantIDOnOptions:&a3->var4];
    }
    uint64_t v13 = 0;
  }
  [(VCMockIDSDatagramChannel *)self handlePacket:a3 packetHandler:a4 shouldDropThisPacket:v13];
}

- (void)addMediaPacketToBuffer:(char *)a3 length:(unint64_t)a4 datagramOptions:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (self->_isNackEnabled)
  {
    unsigned __int16 v21 = 0;
    int v20 = 0;
    +[VCMockIDSDatagramChannel extractRTPData:a3 ssrc:&v20 sequenceNumber:&v21];
    uint64_t v9 = v21 & 0x1FF | ((v20 & 3) << 9);
    if (a4 > 0x5DB)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        long long v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316674;
          uint64_t v23 = v17;
          __int16 v24 = 2080;
          unint64_t v25 = "-[VCMockIDSDatagramChannel addMediaPacketToBuffer:length:datagramOptions:]";
          __int16 v26 = 1024;
          int v27 = 1029;
          __int16 v28 = 2048;
          uint64_t v29 = v9;
          __int16 v30 = 1024;
          int v31 = v20;
          __int16 v32 = 1024;
          int v33 = v21;
          __int16 v34 = 2048;
          unint64_t v35 = a4;
          _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d IGNORING! Add media packet to the buffer at index=%llu for ssrc=%u and seqNum=%u length=%zu", buf, 0x3Cu);
        }
      }
    }
    else
    {
      unsigned __int16 v19 = 0;
      *(_DWORD *)buf = 0;
      +[VCMockIDSDatagramChannel extractRTPData:self->_packetBuffer[v9] ssrc:buf sequenceNumber:&v19];
      if (*(_DWORD *)buf != v20 || v21 != v19)
      {
        memcpy(self->_packetBuffer[v9], a3, a4);
        self->_packetBufferDataSize[v9] = a4;
        BOOL v10 = &self->_packetDatagramOptions[v9];
        long long v11 = *(_OWORD *)&a5->var8.var0;
        long long v13 = *(_OWORD *)&a5->var0;
        long long v12 = *(_OWORD *)&a5->var2;
        *(_OWORD *)&v10->streamIDs[6] = *(_OWORD *)&a5->var5[6];
        *(_OWORD *)&v10->statsPayload.serverTimestamp = v11;
        *(_OWORD *)&v10->options_flags = v13;
        *(_OWORD *)&v10->probeGroupID = v12;
        long long v15 = *(_OWORD *)&a5->var11;
        long long v14 = *(_OWORD *)a5->var13;
        long long v16 = *(_OWORD *)&a5->var9;
        *(void *)&v10->retransmittedPacket = *(void *)&a5->var14;
        *(_OWORD *)&v10->encryptedHBH = v15;
        *(_OWORD *)v10->packetUUID = v14;
        *(_OWORD *)&v10->arrivalTime = v16;
      }
    }
  }
}

- (void)retrieveAndProcesOnePacket:(unsigned int)a3 seq:(unsigned __int16)a4 count:(int)a5 index:(int)a6
{
  unsigned int v7 = a4;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = a4 & 0x1FF | ((a3 & 3) << 9);
  if (!self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return;
    }
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    long long v18 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136316674;
    uint64_t v44 = v17;
    __int16 v45 = 2080;
    long long v46 = "-[VCMockIDSDatagramChannel retrieveAndProcesOnePacket:seq:count:index:]";
    __int16 v47 = 1024;
    int v48 = 1066;
    __int16 v49 = 2048;
    uint64_t v50 = v9;
    __int16 v51 = 1024;
    unsigned int v52 = a3;
    __int16 v53 = 1024;
    unsigned int v54 = v7;
    __int16 v55 = 1024;
    int v56 = a6;
    unsigned __int16 v19 = " [%s] %s:%d RTX/NACK Retrieval failed because _packetBuffer[packetBufferIndex=%llu = nil for ssrc=%u and highest=%u index=%d";
    int v20 = v18;
    uint32_t v21 = 56;
LABEL_22:
    _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    return;
  }
  unsigned int v12 = self->_packetBufferDataSize[v9];
  unsigned __int16 v42 = 0;
  int v41 = 0;
  +[VCMockIDSDatagramChannel extractRTPData:self->_packetBuffer[v9] ssrc:&v41 sequenceNumber:&v42];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    long long v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136318978;
      uint64_t v44 = v13;
      __int16 v45 = 2080;
      long long v46 = "-[VCMockIDSDatagramChannel retrieveAndProcesOnePacket:seq:count:index:]";
      __int16 v47 = 1024;
      int v48 = 1041;
      __int16 v49 = 2048;
      uint64_t v50 = v9;
      __int16 v51 = 1024;
      unsigned int v52 = a3;
      __int16 v53 = 1024;
      unsigned int v54 = a3;
      __int16 v55 = 1024;
      int v56 = v7;
      __int16 v57 = 1024;
      unsigned int v58 = v7;
      __int16 v59 = 1024;
      int v60 = a5;
      __int16 v61 = 1024;
      int v62 = v41;
      __int16 v63 = 1024;
      int v64 = v41;
      __int16 v65 = 1024;
      int v66 = v42;
      __int16 v67 = 1024;
      int v68 = v42;
      __int16 v69 = 1024;
      unsigned int v70 = v12;
      __int16 v71 = 1024;
      int v72 = v9;
      __int16 v73 = 1024;
      int v74 = a6;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RTX/NACK: Retrieve media packet from buffer at index=%llu for ssrc=%u ssrc_hex=%x and seq=%u seq_hex=%x nCount=%u cached_ssrc2=%u cached_ssrc_hex=%x cached_seqNum2=%u cached_seqNum2=%x packetLen=%u packetBufferIndex=%d index=%d", buf, 0x6Eu);
    }
  }
  if (v12 >= 0x5DD)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      long long v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136318978;
        uint64_t v44 = v15;
        __int16 v45 = 2080;
        long long v46 = "-[VCMockIDSDatagramChannel retrieveAndProcesOnePacket:seq:count:index:]";
        __int16 v47 = 1024;
        int v48 = 1043;
        __int16 v49 = 2048;
        uint64_t v50 = v9;
        __int16 v51 = 1024;
        unsigned int v52 = a3;
        __int16 v53 = 1024;
        unsigned int v54 = a3;
        __int16 v55 = 1024;
        int v56 = v7;
        __int16 v57 = 1024;
        unsigned int v58 = v7;
        __int16 v59 = 1024;
        int v60 = a5;
        __int16 v61 = 1024;
        int v62 = v41;
        __int16 v63 = 1024;
        int v64 = v41;
        __int16 v65 = 1024;
        int v66 = v42;
        __int16 v67 = 1024;
        int v68 = v42;
        __int16 v69 = 1024;
        unsigned int v70 = v12;
        __int16 v71 = 1024;
        int v72 = v9;
        __int16 v73 = 1024;
        int v74 = a6;
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RTX/NACK: INVALID PACKET LEN cached packet does not match with NACK ssrc and seq num index=%llu for ssrc=%u ssrc_hex=%x and seq_hex=%u seq_hex=%x nCount=%u ssrc2=%u ssrc2_hex=%x seqNum2=%u seqNum2_hex=%x packetLen=%u packetBufferIndex=%d index=%d", buf, 0x6Eu);
      }
    }
    return;
  }
  int v22 = v42;
  int v23 = v41;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v22 != v7 || v23 != a3)
  {
    if (ErrorLogLevelForModule < 3) {
      return;
    }
    uint64_t v29 = VRTraceErrorLogLevelToCSTR();
    __int16 v30 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136318978;
    uint64_t v44 = v29;
    __int16 v45 = 2080;
    long long v46 = "-[VCMockIDSDatagramChannel retrieveAndProcesOnePacket:seq:count:index:]";
    __int16 v47 = 1024;
    int v48 = 1045;
    __int16 v49 = 2048;
    uint64_t v50 = v9;
    __int16 v51 = 1024;
    unsigned int v52 = a3;
    __int16 v53 = 1024;
    unsigned int v54 = a3;
    __int16 v55 = 1024;
    int v56 = v7;
    __int16 v57 = 1024;
    unsigned int v58 = v7;
    __int16 v59 = 1024;
    int v60 = a5;
    __int16 v61 = 1024;
    int v62 = v41;
    __int16 v63 = 1024;
    int v64 = v41;
    __int16 v65 = 1024;
    int v66 = v42;
    __int16 v67 = 1024;
    int v68 = v42;
    __int16 v69 = 1024;
    unsigned int v70 = v12;
    __int16 v71 = 1024;
    int v72 = v9;
    __int16 v73 = 1024;
    int v74 = a6;
    unsigned __int16 v19 = " [%s] %s:%d RTX/NACK: INVALID PACKET NACK packet does not match with cached ssrc and seqnum index=%llu for ssr"
          "c=%u ssrc_hex=%x and seq=%u seq_hex=%x nCount=%u cached_ssrc2=%u cached_ssrc2_hex=%x cached_seqNum2=%u cached_"
          "seqNum2_hex=%x packetLen=%u packetBufferIndex=%d index=%d";
    int v20 = v30;
    uint32_t v21 = 110;
    goto LABEL_22;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    __int16 v26 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136318978;
      uint64_t v44 = v25;
      __int16 v45 = 2080;
      long long v46 = "-[VCMockIDSDatagramChannel retrieveAndProcesOnePacket:seq:count:index:]";
      __int16 v47 = 1024;
      int v48 = 1047;
      __int16 v49 = 2048;
      uint64_t v50 = v9;
      __int16 v51 = 1024;
      unsigned int v52 = a3;
      __int16 v53 = 1024;
      unsigned int v54 = a3;
      __int16 v55 = 1024;
      int v56 = v7;
      __int16 v57 = 1024;
      unsigned int v58 = v7;
      __int16 v59 = 1024;
      int v60 = a5;
      __int16 v61 = 1024;
      int v62 = v41;
      __int16 v63 = 1024;
      int v64 = v41;
      __int16 v65 = 1024;
      int v66 = v42;
      __int16 v67 = 1024;
      int v68 = v42;
      __int16 v69 = 1024;
      unsigned int v70 = v12;
      __int16 v71 = 1024;
      int v72 = v9;
      __int16 v73 = 1024;
      int v74 = a6;
      _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RTX/NACK: successfully retrieved packet num index=%llu for ssrc=%u ssrc_hex=%x and seq=%u seq_hex=%x nCount=%u cached_ssrc2=%u cached_ssrc2_hex=%x cached_seqNum2=%u cached_seqNum2=%x packetLen=%u packetBufferIndex=%d index=%d", buf, 0x6Eu);
    }
  }
  int v27 = &self->_packetDatagramOptions[v9];
  v27->options_flags |= 0x10000u;
  v27->retransmittedPacket = 1;
  uint64_t v36 = 0;
  __int16 v37 = 0;
  directPathRTXQueue = self->_directPathRTXQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__VCMockIDSDatagramChannel_retrieveAndProcesOnePacket_seq_count_index___block_invoke;
  block[3] = &unk_1E6DB8D08;
  block[4] = self;
  block[5] = v9;
  __int16 v38 = v7;
  unsigned int v32 = a3;
  int v33 = a5;
  unsigned __int16 v39 = v42;
  __int16 v40 = v12;
  int v34 = v41;
  int v35 = a6;
  dispatch_async(directPathRTXQueue, block);
}

unsigned char *__71__VCMockIDSDatagramChannel_retrieveAndProcesOnePacket_seq_count_index___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL result = *(unsigned char **)(a1 + 32);
  if (result[36])
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(unsigned __int16 *)&result[2 * v3 + 3072314];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __71__VCMockIDSDatagramChannel_retrieveAndProcesOnePacket_seq_count_index___block_invoke_2;
    v5[3] = &__block_descriptor_62_e17_v16__0__NSError_8l;
    v5[4] = v3;
    __int16 v7 = *(_WORD *)(a1 + 74);
    int v8 = *(_DWORD *)(a1 + 76);
    long long v6 = *(_OWORD *)(a1 + 48);
    return (unsigned char *)objc_msgSend(result, "writeDatagram:datagramSize:datagramInfo:options:completionHandler:", &result[1500 * v3 + 313], v4, *(void *)(a1 + 64), *(unsigned __int16 *)(a1 + 72), &result[120 * v3 + 3076416], v5);
  }
  return result;
}

void __71__VCMockIDSDatagramChannel_retrieveAndProcesOnePacket_seq_count_index___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (a2 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = *(unsigned __int16 *)(a1 + 56);
      int v8 = *(_DWORD *)(a1 + 40);
      int v9 = *(_DWORD *)(a1 + 44);
      int v10 = *(unsigned __int16 *)(a1 + 58);
      int v11 = *(unsigned __int16 *)(a1 + 60);
      int v12 = *(_DWORD *)(a1 + 48);
      int v13 = *(_DWORD *)(a1 + 52);
      int v14 = 136319234;
      uint64_t v15 = v4;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCMockIDSDatagramChannel retrieveAndProcesOnePacket:seq:count:index:]_block_invoke_2";
      __int16 v18 = 1024;
      int v19 = 1060;
      __int16 v20 = 2048;
      uint64_t v21 = v6;
      __int16 v22 = 1024;
      int v23 = v8;
      __int16 v24 = 1024;
      int v25 = v8;
      __int16 v26 = 1024;
      int v27 = v7;
      __int16 v28 = 1024;
      int v29 = v7;
      __int16 v30 = 1024;
      int v31 = v9;
      __int16 v32 = 1024;
      int v33 = v12;
      __int16 v34 = 1024;
      int v35 = v12;
      __int16 v36 = 1024;
      int v37 = v10;
      __int16 v38 = 1024;
      int v39 = v10;
      __int16 v40 = 1024;
      int v41 = v11;
      __int16 v42 = 1024;
      int v43 = v6;
      __int16 v44 = 1024;
      int v45 = v13;
      __int16 v46 = 2112;
      uint64_t v47 = a2;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RTX/NACK: DATAGRAM WRITE FAILED index=%llu for ssrc=%u ssrc_hex=%x and seq_hex=%u seq_hex=%x nCount=%u ssrc2=%u ssrc2_hex=%x seqNum2=%u seqNum2_hex=%x packetLen=%u packetBufferIndex=%d index=%d error=%@", (uint8_t *)&v14, 0x78u);
    }
  }
}

- (void)retrieveAndProcessMediaPacketsFromBuffer:(tagRTCPPACKET *)a3 packetHandler:(id)a4
{
  uint64_t v5 = *(_WORD *)&a3->var0 & 0x1F;
  unsigned int v6 = a3->var1.var6.var1[3];
  uint64_t v7 = bswap32(a3->var1.var0.var1);
  unsigned int v8 = bswap32(a3->var1.var6.var1[2]) >> 16;
  [(VCMockIDSDatagramChannel *)self retrieveAndProcesOnePacket:v7 seq:v8 count:v5 index:0];
  if (v6)
  {
    unsigned __int16 v9 = __rev16(v6);
    uint64_t v10 = 1;
    do
    {
      if (v9) {
        [(VCMockIDSDatagramChannel *)self retrieveAndProcesOnePacket:v7 seq:(unsigned __int16)(v8 + v10) count:v5 index:v10];
      }
      unsigned int v11 = v9;
      v9 >>= 1;
      uint64_t v10 = (v10 + 1);
    }
    while (v11 > 1);
  }
}

- (void)handlePacket:(_VCMockIDSDatagramChannelPacket *)a3 packetHandler:(id)a4 shouldDropThisPacket:(BOOL)a5
{
  if (a5)
  {
    [(VCMockIDSDatagramChannel *)self printDroppedPacketInfo:a3];
  }
  else
  {
    if (!a3->var3) {
      goto LABEL_8;
    }
    if ([(VCMockIDSDatagramChannel *)self shouldReadPacket:a3])
    {
      var1 = a3->var1;
      uint64_t var2_low = LODWORD(a3->var2);
      p_var4 = &a3->var4;
      uint64_t v7 = (void (*)(id, unsigned __int8 *, uint64_t, $064201D6FEA54BB76D3D1A900A0960B3 *))*((void *)a4 + 2);
      id v8 = a4;
      goto LABEL_10;
    }
    if (!a3->var3)
    {
LABEL_8:
      var1 = a3->var1;
      uint64_t var2_low = LODWORD(a3->var2);
      uint64_t v7 = (void (*)(id, unsigned __int8 *, uint64_t, $064201D6FEA54BB76D3D1A900A0960B3 *))*((void *)a4 + 2);
      id v8 = a4;
      goto LABEL_9;
    }
  }
  uint64_t v7 = (void (*)(id, unsigned __int8 *, uint64_t, $064201D6FEA54BB76D3D1A900A0960B3 *))*((void *)a4 + 2);
  id v8 = a4;
  var1 = 0;
  uint64_t var2_low = 0;
LABEL_9:
  p_var4 = 0;
LABEL_10:

  v7(v8, var1, var2_low, p_var4);
}

- (void)setUPlusOneMode:(BOOL)a3 isInitiator:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  -[VCMockIDSDataChannelLinkContext setIdsUPlusOneMode:](self->_linkContext, "setIdsUPlusOneMode:");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316162;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      unsigned int v11 = "-[VCMockIDSDatagramChannel setUPlusOneMode:isInitiator:]";
      __int16 v12 = 1024;
      int v13 = 1141;
      __int16 v14 = 1024;
      BOOL v15 = v5;
      __int16 v16 = 1024;
      BOOL v17 = v4;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d setUPlusOneMode: isUPlusOneEnabled=%d isInitiator=%d", (uint8_t *)&v8, 0x28u);
    }
  }
}

- (void)setParticipantIDOnOptions:(id *)a3
{
  if ([(NSArray *)[(NSDictionary *)self->_subscribedStreamsByParticipantID allKeys] count])
  {
    uint64_t v5 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[NSDictionary allKeys](self->_subscribedStreamsByParticipantID, "allKeys"), "objectAtIndexedSubscript:", 0), "unsignedLongLongValue");
    unint64_t v6 = 3735928559;
    if (!self->_isWrongParticipantIDOnFanOutPacketsEnabled) {
      unint64_t v6 = v5;
    }
    a3->var1 = v6;
    a3->var0 |= 1u;
  }
}

- (void)setupMockIDSDatagramChannelRequiresOptions:sourcePort:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate link context", v2, v3, v4, v5, v6);
}

- (void)setupMockIDSDatagramChannelRequiresOptions:sourcePort:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate _blockSettingLock", v2, v3, v4, v5, v6);
}

- (void)setupMockIDSDatagramChannelRequiresOptions:sourcePort:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate _writeDirectPathIDSLock", v2, v3, v4, v5, v6);
}

- (void)setupMockIDSDatagramChannelRequiresOptions:sourcePort:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate _flushDatagramPacketsLock", v2, v3, v4, v5, v6);
}

- (void)setupMockIDSDatagramChannelRequiresOptions:sourcePort:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create packet receive thread", v2, v3, v4, v5, v6);
}

- (void)setupMockIDSDatagramChannelRequiresOptions:sourcePort:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create allocator", v2, v3, v4, v5, v6);
}

- (void)initRequiresOptions:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  int v3 = 262;
  __int16 v4 = 2048;
  uint64_t v5 = v0;
  _os_log_debug_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_DEBUG, " [%s] %s:%d VCMockIDSDatagramChannel=%p created", v2, 0x26u);
}

- (void)initCreateSocketRequiresOptions:dataPath:destination:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create VCMockIDSDatagram Channel read queue", v2, v3, v4, v5, v6);
}

- (void)initCreateSocketRequiresOptions:dataPath:destination:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create VCMockIDSDatagram Channel write queue", v2, v3, v4, v5, v6);
}

- (void)initCreateSocketRequiresOptions:(uint64_t)a1 dataPath:destination:.cold.3(uint64_t a1)
{
  LODWORD(v3) = 136315906;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to create underlying file descriptor using sourcePort=%u", (const char *)v3, *((const char **)&v3 + 1), v4, v5);
}

- (void)initCreateSocketRequiresOptions:(uint64_t)a1 dataPath:destination:.cold.4(uint64_t a1)
{
  LODWORD(v3) = 136315906;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Failed to setup mock IDS datagram channel using sourcePort=%u", (const char *)v3, *((const char **)&v3 + 1), v4, v5);
}

- (void)enqueueDatagramPacket:(uint64_t)a1 datagramSize:options:error:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 136315906;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d failing to enqueue NACK seq=%d", (const char *)v3, *((const char **)&v3 + 1), v4, v5);
}

- (void)shouldReadPacket:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 515;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Trying to filter packet when there is either no stream subscription or packet's streamID isnt set", v1, 0x1Cu);
}

void __96__VCMockIDSDatagramChannel_processDirectIDSPathWithDatagram_datagramSize_datagramOptions_error___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_8();
  int v5 = 742;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Packet=%@ did not get enqueued in direct IDS Path", (uint8_t *)&v3, 0x26u);
}

- (void)createSocketWithSourcePort:.cold.1()
{
  __error();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Create socket for srcPort=%d failed with error=%d", v2, v3, v4, v5, 2u);
}

- (void)drainUnderlyingFileDescriptor
{
  __error();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9_10();
  OUTLINED_FUNCTION_6_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d recv failed %d errno %d", v2, v3, v4, v5, 2u);
}

@end