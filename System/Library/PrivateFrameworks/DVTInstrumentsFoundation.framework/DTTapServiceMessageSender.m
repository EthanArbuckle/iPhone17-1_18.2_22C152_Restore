@interface DTTapServiceMessageSender
- (DTTapServiceMessageSender)initWithChannel:(id)a3;
- (DTXChannel)channel;
- (void)sendBarrierMessage;
- (void)sendMessage:(id)a3;
@end

@implementation DTTapServiceMessageSender

- (DTTapServiceMessageSender)initWithChannel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DTTapServiceMessageSender;
  v6 = [(DTTapServiceMessageSender *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_channel, a3);
  }

  return v7;
}

- (void)sendMessage:(id)a3
{
}

- (void)sendBarrierMessage
{
}

- (DTXChannel)channel
{
  return self->_channel;
}

- (void).cxx_destruct
{
}

@end