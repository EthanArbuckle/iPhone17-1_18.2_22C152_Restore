@interface MTRPluginProtobufMessage
+ (id)messageWithProtobufData:(id)a3;
+ (id)messageWithProtobufData:(id)a3 responseHandler:(id)a4;
- (BOOL)hintRequestCheckinMessageFromPeer;
- (BOOL)isRequest;
- (MTRPluginPBMHeader)messageHeader;
- (MTRPluginProtobufMessage)initWithProtobufData:(id)a3 responseHandler:(id)a4;
- (NSData)messageData;
- (NSNumber)messageType;
- (NSUUID)homeIdentifier;
- (NSUUID)sessionIdentifier;
- (NSUUID)uniqueIdentifier;
- (double)responseTimeout;
- (id)description;
- (id)responseHandler;
- (id)sourceAddress;
- (void)setHintRequestCheckinMessageFromPeer:(BOOL)a3;
- (void)setMessageData:(id)a3;
- (void)setMessageHeader:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setResponseTimeout:(double)a3;
- (void)setSourceAddress:(id)a3;
@end

@implementation MTRPluginProtobufMessage

- (MTRPluginProtobufMessage)initWithProtobufData:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MTRPluginProtobufMessage;
  v8 = [(MTRPluginProtobufMessage *)&v15 init];
  if (!v8) {
    goto LABEL_5;
  }
  v9 = [[MTRPluginPBMHeaderMessage alloc] initWithData:v6];
  if ([(MTRPluginPBMHeaderMessage *)v9 hasHeader])
  {
    v10 = [(MTRPluginPBMHeaderMessage *)v9 header];
    char v11 = [v10 isValid];

    if (v11)
    {
      [(MTRPluginProtobufMessage *)v8 setMessageData:v6];
      v12 = [(MTRPluginPBMHeaderMessage *)v9 header];
      [(MTRPluginProtobufMessage *)v8 setMessageHeader:v12];

      [(MTRPluginProtobufMessage *)v8 setResponseHandler:v7];
      [(MTRPluginProtobufMessage *)v8 setResponseTimeout:0.0];

LABEL_5:
      v13 = v8;
      goto LABEL_9;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[MTRPluginProtobufMessage initWithProtobufData:responseHandler:]((uint64_t)v9);
  }

  v13 = 0;
LABEL_9:

  return v13;
}

+ (id)messageWithProtobufData:(id)a3
{
  id v3 = a3;
  v4 = [[MTRPluginProtobufMessage alloc] initWithProtobufData:v3 responseHandler:0];

  return v4;
}

+ (id)messageWithProtobufData:(id)a3 responseHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[MTRPluginProtobufMessage alloc] initWithProtobufData:v6 responseHandler:v5];

  return v7;
}

- (NSNumber)messageType
{
  v2 = NSNumber;
  id v3 = [(MTRPluginProtobufMessage *)self messageHeader];
  v4 = objc_msgSend(v2, "numberWithUnsignedInt:", objc_msgSend(v3, "messageType"));

  return (NSNumber *)v4;
}

- (NSUUID)uniqueIdentifier
{
  v2 = [(MTRPluginProtobufMessage *)self messageHeader];
  id v3 = [v2 messageID];
  v4 = [v3 uuid];

  return (NSUUID *)v4;
}

- (NSUUID)sessionIdentifier
{
  v2 = [(MTRPluginProtobufMessage *)self messageHeader];
  id v3 = [v2 sessionID];
  v4 = [v3 uuid];

  return (NSUUID *)v4;
}

- (NSUUID)homeIdentifier
{
  v2 = [(MTRPluginProtobufMessage *)self messageHeader];
  id v3 = [v2 homeID];
  v4 = [v3 uuid];

  return (NSUUID *)v4;
}

- (BOOL)isRequest
{
  v2 = [(MTRPluginProtobufMessage *)self messageHeader];
  BOOL v3 = [v2 messageDirection] == 2;

  return v3;
}

- (id)description
{
  BOOL v3 = NSString;
  v4 = [(MTRPluginProtobufMessage *)self uniqueIdentifier];
  id v5 = [(MTRPluginProtobufMessage *)self messageHeader];
  uint64_t v6 = [v5 messageType];
  id v7 = [(MTRPluginProtobufMessage *)self messageHeader];
  v8 = +[MTRPluginPBMHeader messageTypeAsString:](MTRPluginPBMHeader, "messageTypeAsString:", [v7 messageType]);
  v9 = [(MTRPluginProtobufMessage *)self sessionIdentifier];
  v10 = [(MTRPluginProtobufMessage *)self homeIdentifier];
  char v11 = [(MTRPluginProtobufMessage *)self messageHeader];
  uint64_t v12 = [v11 messageDirection];
  if ((v12 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_2653E6C88[(int)v12 - 1];
  }
  v14 = [v3 stringWithFormat:@"<MTRPluginProtobufMessage: mid: %@, type: %u (%@), sid: %@, hid: %@, direction: %@>", v4, v6, v8, v9, v10, v13];

  return v14;
}

- (NSData)messageData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMessageData:(id)a3
{
}

- (MTRPluginPBMHeader)messageHeader
{
  return (MTRPluginPBMHeader *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMessageHeader:(id)a3
{
}

- (id)responseHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setResponseHandler:(id)a3
{
}

- (double)responseTimeout
{
  return self->_responseTimeout;
}

- (void)setResponseTimeout:(double)a3
{
  self->_responseTimeout = a3;
}

- (id)sourceAddress
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setSourceAddress:(id)a3
{
}

- (BOOL)hintRequestCheckinMessageFromPeer
{
  return self->_hintRequestCheckinMessageFromPeer;
}

- (void)setHintRequestCheckinMessageFromPeer:(BOOL)a3
{
  self->_hintRequestCheckinMessageFromPeer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sourceAddress, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_messageHeader, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
}

- (void)initWithProtobufData:(uint64_t)a1 responseHandler:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to create message header %@ from protobuf data", (uint8_t *)&v1, 0xCu);
}

@end