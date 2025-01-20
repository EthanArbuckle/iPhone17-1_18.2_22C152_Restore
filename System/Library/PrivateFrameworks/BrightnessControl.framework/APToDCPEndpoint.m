@interface APToDCPEndpoint
+ (id)sharedInstance;
- (APToDCPEndpoint)init;
- (id)copyProperty:(id)a3;
@end

@implementation APToDCPEndpoint

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__APToDCPEndpoint_sharedInstance__block_invoke;
  block[3] = &unk_264D10198;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  return (id)sharedInstance_sharedObj;
}

id __33__APToDCPEndpoint_sharedInstance__block_invoke(uint64_t a1)
{
  id result = objc_alloc_init(*(Class *)(a1 + 32));
  sharedInstance_sharedObj = (uint64_t)result;
  return result;
}

- (APToDCPEndpoint)init
{
  v4.receiver = self;
  v4.super_class = (Class)APToDCPEndpoint;
  v2 = [(APToDCPEndpoint *)&v4 init];
  if (v2) {
    v2->_endpoint = [[CBAPEndpoint alloc] initWithServiceName:@"CBAPToDCPService" role:@"DCP"];
  }
  return v2;
}

- (id)copyProperty:(id)a3
{
  objc_sync_enter(self);
  id v5 = [(CBAPEndpoint *)self->_endpoint copyProperty:a3];
  objc_sync_exit(self);
  return v5;
}

@end