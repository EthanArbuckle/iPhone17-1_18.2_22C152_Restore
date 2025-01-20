@interface VCMockIDSDatagramChannelController
+ (id)sharedInstance;
- (id)datagramChannelSocketForDestination:(id)a3 ipPorts:(id)a4;
- (id)datagramChannelWithDestination:(id)a3;
- (id)datagramChannelWithDestination:(id)a3 dataPath:(int)a4;
- (id)getFirstDatagramChannelIDS;
- (void)dealloc;
- (void)setReadyToReadBlockForDatagram:(id)a3 block:(id)a4;
- (void)setWriteDatagramBlockForDatagram:(id)a3 block:(id)a4;
- (void)setWriteDatagramsBlockForDatagram:(id)a3 block:(id)a4;
@end

@implementation VCMockIDSDatagramChannelController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12 != -1) {
    dispatch_once(&sharedInstance_onceToken_12, &__block_literal_global_75);
  }
  return (id)sharedInstance_sharedDatagramChannelManager_0;
}

VCMockIDSDatagramChannelController *__52__VCMockIDSDatagramChannelController_sharedInstance__block_invoke()
{
  result = objc_alloc_init(VCMockIDSDatagramChannelController);
  sharedInstance_sharedDatagramChannelManager_0 = (uint64_t)result;
  return result;
}

- (id)datagramChannelWithDestination:(id)a3
{
  return [(VCMockIDSDatagramChannelController *)self datagramChannelWithDestination:a3 dataPath:0];
}

- (id)datagramChannelSocketForDestination:(id)a3 ipPorts:(id)a4
{
  if (!a3 || !a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMockIDSDatagramChannelController datagramChannelSocketForDestination:ipPorts:]();
      }
    }
    return 0;
  }
  uint64_t v6 = [a3 hasPrefix:@"loopback:Conference"];
  v7 = (void *)[a3 componentsSeparatedByString:@":"];
  if (!v7
    || (v8 = v7, (unint64_t)[v7 count] < 2)
    || (int)objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", 1), "intValue") < 1
    || (unsigned int v9 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", 1), "intValue") << 16) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMockIDSDatagramChannelController datagramChannelSocketForDestination:ipPorts:]();
      }
    }
    return 0;
  }
  if (v9 == 1068498944) {
    v10 = @"vcDefaultMockDatagramChannelIPPortsKeyLocalIP";
  }
  else {
    v10 = @"vcDefaultMockDatagramChannelIPPortsKeyRemoteIP";
  }
  if (v9 == 1068498944) {
    v11 = @"vcDefaultMockDatagramChannelIPPortsKeyRemoteIP";
  }
  else {
    v11 = @"vcDefaultMockDatagramChannelIPPortsKeyLocalIP";
  }
  if (v9 == 1068498944) {
    v12 = @"vcDefaultMockDatagramChannelIPPortsKeyLocalPort";
  }
  else {
    v12 = @"vcDefaultMockDatagramChannelIPPortsKeyRemotePort";
  }
  if (v9 == 1068498944) {
    v13 = @"vcDefaultMockDatagramChannelIPPortsKeyRemotePort";
  }
  else {
    v13 = @"vcDefaultMockDatagramChannelIPPortsKeyLocalPort";
  }
  id v14 = -[VCMockIDSDatagramChannelSocket initRequiresOptions:localIP:localPort:remoteIP:remotePort:]([VCMockIDSDatagramChannelSocket alloc], "initRequiresOptions:localIP:localPort:remoteIP:remotePort:", v6, [a4 objectForKeyedSubscript:v10], objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", v12), "shortValue"), objc_msgSend(a4, "objectForKeyedSubscript:", v11), objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", v13), "shortValue"));

  return v14;
}

- (id)datagramChannelWithDestination:(id)a3 dataPath:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(VCObject *)self lock];
  if (a3) {
    uint64_t v7 = [a3 hasPrefix:@"loopback:Conference"];
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = [+[VCDatagramChannelManager sharedInstance] destinations];
  if (a3)
  {
    unsigned int v9 = v8;
    if (v8)
    {
      int v10 = objc_msgSend((id)objc_msgSend(v8, "allKeys"), "count");
      if (VCDefaults_GetBoolValueForKey(@"enableTestNetworkRouter", 0))
      {
        if (![v9 objectForKeyedSubscript:a3])
        {
LABEL_10:
          v11 = (void *)VCDefaults_CopyDictionaryValueForKey(@"mockDatagramChannelIPPorts");
          if (v11)
          {
            v12 = v11;
            id v13 = [(VCMockIDSDatagramChannelController *)self datagramChannelSocketForDestination:a3 ipPorts:v11];

            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v14 = VRTraceErrorLogLevelToCSTR();
              v15 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v19 = 136316162;
                *(void *)&v19[4] = v14;
                *(_WORD *)&v19[12] = 2080;
                *(void *)&v19[14] = "-[VCMockIDSDatagramChannelController datagramChannelWithDestination:dataPath:]";
                *(_WORD *)&v19[22] = 1024;
                LODWORD(v20) = 1214;
                WORD2(v20) = 2048;
                *(void *)((char *)&v20 + 6) = v13;
                HIWORD(v20) = 2112;
                id v21 = a3;
LABEL_17:
                _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created datagramChannel=%p for destination=%@", v19, 0x30u);
              }
            }
          }
          else
          {
            id v13 = [[VCMockIDSDatagramChannel alloc] initCreateSocketRequiresOptions:v7 dataPath:v4 destination:a3];
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v16 = VRTraceErrorLogLevelToCSTR();
              v15 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v19 = 136316162;
                *(void *)&v19[4] = v16;
                *(_WORD *)&v19[12] = 2080;
                *(void *)&v19[14] = "-[VCMockIDSDatagramChannelController datagramChannelWithDestination:dataPath:]";
                *(_WORD *)&v19[22] = 1024;
                LODWORD(v20) = 1217;
                WORD2(v20) = 2048;
                *(void *)((char *)&v20 + 6) = v13;
                HIWORD(v20) = 2112;
                id v21 = a3;
                goto LABEL_17;
              }
            }
          }
          if (v13) {
            goto LABEL_22;
          }
        }
      }
      else if (!v10)
      {
        goto LABEL_10;
      }
    }
  }
  id v17 = [(VCMockIDSDatagramChannelController *)self getFirstDatagramChannelIDS];
  if (v17) {
    id v13 = (id)[v17 idsDatagramChannel];
  }
  else {
    id v13 = 0;
  }
LABEL_22:
  objc_msgSend(v13, "setWriteCompletionHandler:", &__block_literal_global_310, *(void *)v19, *(_OWORD *)&v19[8], v20, v21);
  [(VCObject *)self unlock];
  return v13;
}

uint64_t __78__VCMockIDSDatagramChannelController_datagramChannelWithDestination_dataPath___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (!a2) {
    return VTP_IncrementTotalBytesSent(a3);
  }
  return result;
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = self;
  v2.super_class = (Class)VCMockIDSDatagramChannelController;
  [(VCObject *)&v2 dealloc];
}

- (void)setWriteDatagramsBlockForDatagram:(id)a3 block:(id)a4
{
  [(VCObject *)self lock];
  if (a3)
  {
    id v7 = a3;
  }
  else
  {
    id v8 = [(VCMockIDSDatagramChannelController *)self getFirstDatagramChannelIDS];
    if (!v8) {
      goto LABEL_6;
    }
    id v7 = (id)[v8 idsDatagramChannel];
  }
  [v7 setWriteDatagramsBlock:a4];
LABEL_6:

  [(VCObject *)self unlock];
}

- (void)setWriteDatagramBlockForDatagram:(id)a3 block:(id)a4
{
  [(VCObject *)self lock];
  if (a3)
  {
    id v7 = a3;
  }
  else
  {
    id v8 = [(VCMockIDSDatagramChannelController *)self getFirstDatagramChannelIDS];
    if (!v8) {
      goto LABEL_6;
    }
    id v7 = (id)[v8 idsDatagramChannel];
  }
  [v7 setWriteDatagramBlock:a4];
LABEL_6:

  [(VCObject *)self unlock];
}

- (void)setReadyToReadBlockForDatagram:(id)a3 block:(id)a4
{
  [(VCObject *)self lock];
  if (a3)
  {
    id v7 = a3;
  }
  else
  {
    id v8 = [(VCMockIDSDatagramChannelController *)self getFirstDatagramChannelIDS];
    if (!v8) {
      goto LABEL_6;
    }
    id v7 = (id)[v8 idsDatagramChannel];
  }
  [v7 setReadyToReadBlock:a4];
LABEL_6:

  [(VCObject *)self unlock];
}

- (id)getFirstDatagramChannelIDS
{
  id v2 = [+[VCDatagramChannelManager sharedInstance] datagramChannels];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  if (!objc_msgSend((id)objc_msgSend(v2, "allKeys"), "count")) {
    return 0;
  }
  uint64_t v4 = (void *)[v3 allValues];

  return (id)[v4 firstObject];
}

- (void)datagramChannelSocketForDestination:ipPorts:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid parameters", v2, v3, v4, v5, v6);
}

- (void)datagramChannelSocketForDestination:ipPorts:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid local port", v2, v3, v4, v5, v6);
}

@end