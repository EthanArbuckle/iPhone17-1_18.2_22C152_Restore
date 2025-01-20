@interface CBRFCOMMChannel
- (BOOL)isIncoming;
- (CBClassicPeer)peer;
- (CBRFCOMMChannel)initWithPeer:(id)a3 info:(id)a4;
- (CBUUID)serviceUUID;
- (NSInputStream)inputStream;
- (NSOutputStream)outputStream;
- (id)description;
- (int)socketFD;
- (unsigned)baudRate;
- (unsigned)channelID;
- (unsigned)dataBits;
- (unsigned)mtu;
- (unsigned)parity;
- (unsigned)stopBits;
- (void)configureChannelPortParams:(unsigned int)a3 dataBits:(unsigned __int8)a4 parity:(unsigned __int8)a5 stopBits:(unsigned __int8)a6;
- (void)dealloc;
- (void)setBaudRate:(unsigned int)a3;
- (void)setDataBits:(unsigned __int8)a3;
- (void)setParity:(unsigned __int8)a3;
- (void)setStopBits:(unsigned __int8)a3;
@end

@implementation CBRFCOMMChannel

- (CBRFCOMMChannel)initWithPeer:(id)a3 info:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CBRFCOMMChannel;
  v9 = [(CBRFCOMMChannel *)&v26 init];
  if (!v9) {
    goto LABEL_10;
  }
  v10 = [v8 objectForKey:@"kCBMsgArgRFCOMMChannelID"];
  v9->_channelID = [v10 intValue];

  objc_storeStrong((id *)&v9->_peer, a3);
  v9->_socketFD = -1;
  v11 = [v8 objectForKey:@"kCBMsgArgMTU"];
  v9->_mtu = [v11 intValue];

  v12 = [v8 objectForKey:@"kCBMsgArgIsIncoming"];
  v9->_isIncoming = [v12 BOOLValue];

  v13 = [v8 objectForKey:@"kCBMsgArgServiceUUID"];
  if (v13)
  {
    uint64_t v14 = +[CBUUID UUIDWithData:v13];
    serviceUUID = v9->_serviceUUID;
    v9->_serviceUUID = (CBUUID *)v14;
  }
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  v16 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
    -[CBRFCOMMChannel initWithPeer:info:](&v9->_channelID, (uint64_t)v9, v16);
  }
  v17 = [v8 objectForKeyedSubscript:@"kCBMsgArgSocket"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (CBLogInitOnce == -1)
    {
      v22 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
      {
LABEL_13:

        v21 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
      v22 = CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
    }
    -[CBRFCOMMChannel initWithPeer:info:](v22);
    goto LABEL_13;
  }
  v18 = [v8 objectForKeyedSubscript:@"kCBMsgArgSocket"];
  v9->_socketFD = [v18 intValue];

  v24 = 0;
  CFReadStreamRef readStream = 0;
  CFStreamCreatePairWithSocket((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v9->_socketFD, &readStream, (CFWriteStreamRef *)&v24);
  inputStream = v9->_inputStream;
  v9->_inputStream = (NSInputStream *)readStream;

  outputStream = v9->_outputStream;
  v9->_outputStream = v24;

LABEL_10:
  v21 = v9;
LABEL_14:

  return v21;
}

- (void)dealloc
{
  int socketFD = self->_socketFD;
  if ((socketFD & 0x80000000) == 0)
  {
    close(socketFD);
    self->_int socketFD = -1;
  }
  if (self->_channelID) {
    -[CBClassicPeer closeRFCOMMChannel:](self->_peer, "closeRFCOMMChannel:");
  }
  v4.receiver = self;
  v4.super_class = (Class)CBRFCOMMChannel;
  [(CBRFCOMMChannel *)&v4 dealloc];
}

- (void)configureChannelPortParams:(unsigned int)a3 dataBits:(unsigned __int8)a4 parity:(unsigned __int8)a5 stopBits:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  uint64_t v9 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
  }
  v11 = CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[CBRFCOMMChannel configureChannelPortParams:dataBits:parity:stopBits:]";
    _os_log_impl(&dword_1AB9F0000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  self->_baudRate = v9;
  self->_dataBits = v8;
  self->_parity = v7;
  self->_stopBits = v6;
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v9, @"kCBMsgArgRFCOMMBaudRate");
  v19[0] = v12;
  v18[1] = @"kCBMsgArgRFCOMMDataBit";
  v13 = [NSNumber numberWithUnsignedChar:v8];
  v19[1] = v13;
  v18[2] = @"kCBMsgArgRFCOMMParityBit";
  uint64_t v14 = [NSNumber numberWithUnsignedChar:v7];
  v19[2] = v14;
  v18[3] = @"kCBMsgArgRFCOMMStopBit";
  v15 = [NSNumber numberWithUnsignedChar:v6];
  v19[3] = v15;
  v18[4] = @"kCBMsgArgRFCOMMChannelID";
  v16 = [NSNumber numberWithUnsignedChar:self->_channelID];
  v19[4] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];

  [(CBClassicPeer *)self->_peer configureRFCOMMPortParams:v17];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_isIncoming) {
    v5 = @"incoming";
  }
  else {
    v5 = @"outgoing";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p %@, CID: %u, MTU: %d, %@>", v4, self, self->_peer, self->_channelID, self->_mtu, v5];
}

- (int)socketFD
{
  return self->_socketFD;
}

- (CBClassicPeer)peer
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

- (CBUUID)serviceUUID
{
  return self->_serviceUUID;
}

- (unsigned)channelID
{
  return self->_channelID;
}

- (unsigned)mtu
{
  return self->_mtu;
}

- (BOOL)isIncoming
{
  return self->_isIncoming;
}

- (unsigned)baudRate
{
  return self->_baudRate;
}

- (void)setBaudRate:(unsigned int)a3
{
  self->_baudRate = a3;
}

- (unsigned)dataBits
{
  return self->_dataBits;
}

- (void)setDataBits:(unsigned __int8)a3
{
  self->_dataBits = a3;
}

- (unsigned)parity
{
  return self->_parity;
}

- (void)setParity:(unsigned __int8)a3
{
  self->_parity = a3;
}

- (unsigned)stopBits
{
  return self->_stopBits;
}

- (void)setStopBits:(unsigned __int8)a3
{
  self->_stopBits = a3;
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
  _os_log_error_impl(&dword_1AB9F0000, log, OS_LOG_TYPE_ERROR, "Skywalk unsupported with rfcomm channels", v1, 2u);
}

- (void)initWithPeer:(os_log_t)log info:.cold.2(unsigned __int8 *a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  uint64_t v4 = *(void *)(a2 + 48);
  int v5 = 136315650;
  uint64_t v6 = "-[CBRFCOMMChannel initWithPeer:info:]";
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_debug_impl(&dword_1AB9F0000, log, OS_LOG_TYPE_DEBUG, "%s CID: %u %@", (uint8_t *)&v5, 0x1Cu);
}

@end