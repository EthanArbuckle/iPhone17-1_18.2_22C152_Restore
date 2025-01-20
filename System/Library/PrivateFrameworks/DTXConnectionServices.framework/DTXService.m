@interface DTXService
+ (BOOL)automaticallyRegistersCapabilities;
+ (void)instantiateServiceWithChannel:(id)a3;
- (DTXChannel)channel;
- (DTXService)initWithChannel:(id)a3;
@end

@implementation DTXService

+ (void)instantiateServiceWithChannel:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v7 = [v5 initWithChannel:v6 channelID:v4];
}

+ (BOOL)automaticallyRegistersCapabilities
{
  return 1;
}

- (DTXService)initWithChannel:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DTXService;
  v6 = [(DTXService *)&v14 init];
  id v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_22AF372CC;
    v12[3] = &unk_264883918;
    v8 = v6;
    v13 = v8;
    [v5 setMessageHandler:v9];
    [v5 setDispatchTarget:v10];
    objc_storeStrong(v8 + 1, a3);
  }
  return v7;
}

- (DTXChannel)channel
{
  return self->_channel;
}

- (void).cxx_destruct
{
}

@end