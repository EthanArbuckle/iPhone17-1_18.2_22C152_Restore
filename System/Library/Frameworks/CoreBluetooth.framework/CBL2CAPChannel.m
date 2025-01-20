@interface CBL2CAPChannel
- (BOOL)isIncoming;
- (CBL2CAPChannel)initWithPeer:(id)a3 info:(id)a4;
- (CBL2CAPPSM)PSM;
- (CBPeer)peer;
- (CBUUID)serviceUUID;
- (NSInputStream)inputStream;
- (NSOutputStream)outputStream;
- (id)description;
- (int)socketFD;
- (void)dealloc;
- (void)setIsIncoming:(BOOL)a3;
- (void)setServiceUUID:(id)a3;
@end

@implementation CBL2CAPChannel

- (CBL2CAPChannel)initWithPeer:(id)a3 info:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CBL2CAPChannel;
  v9 = [(CBL2CAPChannel *)&v22 init];
  if (!v9) {
    goto LABEL_8;
  }
  v10 = [v8 objectForKey:@"kCBMsgArgPSM"];
  v9->_PSM = [v10 intValue];

  objc_storeStrong((id *)&v9->_peer, a3);
  v9->_socketFD = -1;
  v11 = [v8 objectForKey:@"kCBMsgArgIsIncoming"];
  v9->_isIncoming = [v11 intValue] != 0;

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  v12 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBL2CAPChannel initWithPeer:info:](&v9->_PSM, v12);
  }
  v13 = [v8 objectForKeyedSubscript:@"kCBMsgArgSocket"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (CBLogInitOnce == -1)
    {
      v18 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        v17 = 0;
        goto LABEL_12;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v18 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
    }
    -[CBL2CAPChannel initWithPeer:info:](v18);
    goto LABEL_11;
  }
  v14 = [v8 objectForKeyedSubscript:@"kCBMsgArgSocket"];
  v9->_socketFD = [v14 intValue];

  v20 = 0;
  CFReadStreamRef readStream = 0;
  CFStreamCreatePairWithSocket((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v9->_socketFD, &readStream, (CFWriteStreamRef *)&v20);
  inputStream = v9->_inputStream;
  v9->_inputStream = (NSInputStream *)readStream;

  outputStream = v9->_outputStream;
  v9->_outputStream = v20;

LABEL_8:
  v17 = v9;
LABEL_12:

  return v17;
}

- (void)dealloc
{
  int socketFD = self->_socketFD;
  if ((socketFD & 0x80000000) == 0)
  {
    close(socketFD);
    self->_int socketFD = -1;
  }
  v4 = [(CBPeer *)self->_peer manager];
  v5 = [(CBPeer *)self->_peer identifier];
  objc_msgSend(v4, "closeL2CAPChannelForPeerUUID:withPsm:", v5, -[CBL2CAPChannel PSM](self, "PSM"));

  v6.receiver = self;
  v6.super_class = (Class)CBL2CAPChannel;
  [(CBL2CAPChannel *)&v6 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p peer = %@, psm = %d>", objc_opt_class(), self, self->_peer, self->_PSM];
}

- (CBPeer)peer
{
  return self->_peer;
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (CBL2CAPPSM)PSM
{
  return self->_PSM;
}

- (CBUUID)serviceUUID
{
  return self->_serviceUUID;
}

- (void)setServiceUUID:(id)a3
{
}

- (BOOL)isIncoming
{
  return self->_isIncoming;
}

- (void)setIsIncoming:(BOOL)a3
{
  self->_isIncoming = a3;
}

- (int)socketFD
{
  return self->_socketFD;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceUUID, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);

  objc_storeStrong((id *)&self->_peer, 0);
}

- (void)initWithPeer:(os_log_t)log info:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AB9F0000, log, OS_LOG_TYPE_ERROR, "Skywalk unsupported with le l2cap channels", v1, 2u);
}

- (void)initWithPeer:(unsigned __int16 *)a1 info:(NSObject *)a2 .cold.2(unsigned __int16 *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1AB9F0000, a2, OS_LOG_TYPE_DEBUG, "Init CBL2CAPChannel with psm : %u", (uint8_t *)v3, 8u);
}

@end