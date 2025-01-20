@interface APKCommunicationChannel
- (APKCommunicationChannel)initWithCommunicationChannel:(id)a3;
- (AVOutputDeviceCommunicationChannel)channel;
- (id)onClose;
- (id)onData;
- (void)close;
- (void)communicationChannel:(id)a3 didReceiveData:(id)a4;
- (void)communicationChannelDidClose:(id)a3;
- (void)sendData:(id)a3 completionHandler:(id)a4;
- (void)setOnClose:(id)a3;
- (void)setOnData:(id)a3;
@end

@implementation APKCommunicationChannel

- (APKCommunicationChannel)initWithCommunicationChannel:(id)a3
{
  id v5 = a3;
  v6 = [(APKCommunicationChannel *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_channel, a3);
    [(AVOutputDeviceCommunicationChannel *)v7->_channel setDelegate:v7];
  }

  return v7;
}

- (void)close
{
  id v2 = [(APKCommunicationChannel *)self channel];
  [v2 close];
}

- (void)sendData:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(APKCommunicationChannel *)self channel];
  [v8 sendData:v7 completionHandler:v6];
}

- (void)communicationChannel:(id)a3 didReceiveData:(id)a4
{
  id v7 = a4;
  id v5 = [(APKCommunicationChannel *)self onData];

  if (v5)
  {
    id v6 = [(APKCommunicationChannel *)self onData];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (void)communicationChannelDidClose:(id)a3
{
  v4 = [(APKCommunicationChannel *)self onClose];

  if (v4)
  {
    id v5 = [(APKCommunicationChannel *)self onClose];
    v5[2]();
  }
}

- (id)onData
{
  return self->_onData;
}

- (void)setOnData:(id)a3
{
}

- (id)onClose
{
  return self->_onClose;
}

- (void)setOnClose:(id)a3
{
}

- (AVOutputDeviceCommunicationChannel)channel
{
  return self->_channel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong(&self->_onClose, 0);
  objc_storeStrong(&self->_onData, 0);
}

@end