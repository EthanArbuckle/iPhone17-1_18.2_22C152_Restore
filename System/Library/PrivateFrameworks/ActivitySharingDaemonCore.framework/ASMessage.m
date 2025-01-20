@interface ASMessage
- (ASMessage)initWithDictionary:(id)a3;
- (NSData)payload;
- (NSString)receiverAddress;
- (NSString)senderAddress;
- (id)dictionaryRepresentation;
- (id)ephemeralCompletionBlock;
- (int)type;
- (int64_t)retryCount;
- (void)setEphemeralCompletionBlock:(id)a3;
- (void)setPayload:(id)a3;
- (void)setReceiverAddress:(id)a3;
- (void)setRetryCount:(int64_t)a3;
- (void)setSenderAddress:(id)a3;
- (void)setType:(int)a3;
@end

@implementation ASMessage

- (ASMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASMessage;
  v5 = [(ASMessage *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"ASMessagePayloadKey"];
    payload = v5->_payload;
    v5->_payload = (NSData *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"ASMessageSenderAddressKey"];
    senderAddress = v5->_senderAddress;
    v5->_senderAddress = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"ASMessageReceiverAddressKey"];
    receiverAddress = v5->_receiverAddress;
    v5->_receiverAddress = (NSString *)v10;

    v12 = [v4 objectForKeyedSubscript:@"ASMessageTypeKey"];
    v5->_type = [v12 integerValue];

    v13 = [v4 objectForKeyedSubscript:@"ASMessageRetryCountKey"];
    v5->_retryCount = [v13 integerValue];
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [NSNumber numberWithInt:self->_type];
  [v3 setObject:v4 forKeyedSubscript:@"ASMessageTypeKey"];

  v5 = [NSNumber numberWithInteger:self->_retryCount];
  [v3 setObject:v5 forKeyedSubscript:@"ASMessageRetryCountKey"];

  payload = self->_payload;
  if (payload) {
    [v3 setObject:payload forKeyedSubscript:@"ASMessagePayloadKey"];
  }
  senderAddress = self->_senderAddress;
  if (senderAddress) {
    [v3 setObject:senderAddress forKeyedSubscript:@"ASMessageSenderAddressKey"];
  }
  receiverAddress = self->_receiverAddress;
  if (receiverAddress) {
    [v3 setObject:receiverAddress forKeyedSubscript:@"ASMessageReceiverAddressKey"];
  }
  return v3;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
}

- (NSString)receiverAddress
{
  return self->_receiverAddress;
}

- (void)setReceiverAddress:(id)a3
{
}

- (id)ephemeralCompletionBlock
{
  return self->_ephemeralCompletionBlock;
}

- (void)setEphemeralCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ephemeralCompletionBlock, 0);
  objc_storeStrong((id *)&self->_receiverAddress, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end