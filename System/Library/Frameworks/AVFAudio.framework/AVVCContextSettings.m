@interface AVVCContextSettings
- (AVVCContextSettings)initWithMode:(int64_t)a3 deviceUID:(id)a4;
- (BOOL)announceCallsEnabled;
- (NSString)activationDeviceUID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)activationMode;
- (void)setActivationDeviceUID:(id)a3;
- (void)setActivationMode:(int64_t)a3;
- (void)setAnnounceCallsEnabled:(BOOL)a3;
@end

@implementation AVVCContextSettings

- (void).cxx_destruct
{
}

- (void)setAnnounceCallsEnabled:(BOOL)a3
{
  self->_announceCallsEnabled = a3;
}

- (BOOL)announceCallsEnabled
{
  return self->_announceCallsEnabled;
}

- (void)setActivationDeviceUID:(id)a3
{
}

- (NSString)activationDeviceUID
{
  return self->_activationDeviceUID;
}

- (void)setActivationMode:(int64_t)a3
{
  self->_activationMode = a3;
}

- (int64_t)activationMode
{
  return self->_activationMode;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 16) = [(AVVCContextSettings *)self activationMode];
  v5 = [(AVVCContextSettings *)self activationDeviceUID];
  uint64_t v6 = [v5 copy];
  v7 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v6;

  *(unsigned char *)(v4 + 8) = [(AVVCContextSettings *)self announceCallsEnabled];
  return (id)v4;
}

- (AVVCContextSettings)initWithMode:(int64_t)a3 deviceUID:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVVCContextSettings;
  v7 = [(AVVCContextSettings *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_activationMode = a3;
    uint64_t v9 = [v6 copy];
    activationDeviceUID = v8->_activationDeviceUID;
    v8->_activationDeviceUID = (NSString *)v9;
  }
  return v8;
}

@end