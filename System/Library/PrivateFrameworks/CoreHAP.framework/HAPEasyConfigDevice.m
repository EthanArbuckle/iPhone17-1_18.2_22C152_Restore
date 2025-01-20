@interface HAPEasyConfigDevice
- (HAPAccessoryServerIP)server;
- (HAPEasyConfigDevice)initWithDeviceInfo:(id)a3 server:(id)a4;
- (void)setServer:(id)a3;
@end

@implementation HAPEasyConfigDevice

- (void).cxx_destruct
{
}

- (void)setServer:(id)a3
{
}

- (HAPAccessoryServerIP)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);

  return (HAPAccessoryServerIP *)WeakRetained;
}

- (HAPEasyConfigDevice)initWithDeviceInfo:(id)a3 server:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAPEasyConfigDevice;
  v9 = [(EasyConfigDevice *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)((char *)&v9->super.super.isa + (int)*MEMORY[0x1E4F5FC20]), a3);
    objc_storeWeak((id *)&v10->_server, v8);
  }

  return v10;
}

@end