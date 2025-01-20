@interface ESAudioPacket
- (ESAudioPacket)initWithData:(id)a3 packetTimestamps:(id)a4;
- (ESAudioPacketTimestamps)packetTimestamps;
- (NSData)data;
- (void)setData:(id)a3;
- (void)setPacketTimestamps:(id)a3;
@end

@implementation ESAudioPacket

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packetTimestamps, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setPacketTimestamps:(id)a3
{
}

- (ESAudioPacketTimestamps)packetTimestamps
{
  return self->_packetTimestamps;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (ESAudioPacket)initWithData:(id)a3 packetTimestamps:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ESAudioPacket;
  v9 = [(ESAudioPacket *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_packetTimestamps, a4);
  }

  return v10;
}

@end