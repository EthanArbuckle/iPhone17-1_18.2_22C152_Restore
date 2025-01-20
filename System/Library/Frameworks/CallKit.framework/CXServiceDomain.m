@interface CXServiceDomain
+ (id)callKitServiceDomain;
- (CXServiceDomain)initWithName:(id)a3 machName:(id)a4;
- (NSString)machName;
- (NSString)name;
@end

@implementation CXServiceDomain

- (CXServiceDomain)initWithName:(id)a3 machName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CXServiceDomain;
  v8 = [(CXServiceDomain *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    machName = v8->_machName;
    v8->_machName = (NSString *)v11;
  }
  return v8;
}

+ (id)callKitServiceDomain
{
  if (callKitServiceDomain_onceToken != -1) {
    dispatch_once(&callKitServiceDomain_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)callKitServiceDomain_sServiceDomain;

  return v2;
}

uint64_t __39__CXServiceDomain_callKitServiceDomain__block_invoke()
{
  callKitServiceDomain_sServiceDomain = [[CXServiceDomain alloc] initWithName:@"com.apple.callkit" machName:@"com.apple.callkit.service"];

  return MEMORY[0x1F41817F8]();
}

- (NSString)name
{
  return self->_name;
}

- (NSString)machName
{
  return self->_machName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end