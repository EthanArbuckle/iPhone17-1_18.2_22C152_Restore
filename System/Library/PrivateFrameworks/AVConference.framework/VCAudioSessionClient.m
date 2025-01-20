@interface VCAudioSessionClient
- (VCAudioSessionDelegate)notificationClient;
- (VCAudioSessionMediaProperties)mediaProperties;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)clientType;
- (void)dealloc;
- (void)setClientType:(unsigned __int8)a3;
- (void)setMediaProperties:(id)a3;
- (void)setNotificationClient:(id)a3;
@end

@implementation VCAudioSessionClient

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  objc_storeWeak((id *)&self->_notificationClient, 0);

  v3.receiver = self;
  v3.super_class = (Class)VCAudioSessionClient;
  [(VCAudioSessionClient *)&v3 dealloc];
}

- (void)setNotificationClient:(id)a3
{
}

- (VCAudioSessionDelegate)notificationClient
{
  return (VCAudioSessionDelegate *)objc_loadWeak((id *)&self->_notificationClient);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setMediaProperties:self->_mediaProperties];
  objc_msgSend(v4, "setNotificationClient:", -[VCAudioSessionClient notificationClient](self, "notificationClient"));
  return v4;
}

- (VCAudioSessionMediaProperties)mediaProperties
{
  return self->_mediaProperties;
}

- (void)setMediaProperties:(id)a3
{
}

- (unsigned)clientType
{
  return self->_clientType;
}

- (void)setClientType:(unsigned __int8)a3
{
  self->_clientType = a3;
}

@end