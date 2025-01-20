@interface CRXUSystemInfo
+ (id)sharedInstance;
- (CRXUSystemInfo)init;
- (NSString)modelName;
@end

@implementation CRXUSystemInfo

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__CRXUSystemInfo_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___once__LINE___2 != -1) {
    dispatch_once(&sharedInstance___once__LINE___2, block);
  }
  v2 = (void *)sharedInstance_instance_2;
  return v2;
}

uint64_t __32__CRXUSystemInfo_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_instance_2 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (CRXUSystemInfo)init
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)CRXUSystemInfo;
  v2 = [(CRXUSystemInfo *)&v6 init];
  if (v2)
  {
    memset(&v7, 0, 512);
    if (uname(&v7))
    {
      modelName = v2->_modelName;
      v2->_modelName = (NSString *)@"Unknown";
    }
    else
    {
      uint64_t v4 = [NSString stringWithUTF8String:v7.machine];
      modelName = v2->_modelName;
      v2->_modelName = (NSString *)v4;
    }
  }
  return v2;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void).cxx_destruct
{
}

@end