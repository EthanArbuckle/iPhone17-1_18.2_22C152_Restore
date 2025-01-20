@interface FBInterfaceOrientationService
+ (id)sharedInstance;
- (FBInterfaceOrientationService)init;
- (int64_t)interfaceOrientation;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setInterfaceOrientation:(int64_t)a3 animationSettings:(id)a4 direction:(int64_t)a5;
@end

@implementation FBInterfaceOrientationService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) { {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_15);
  }
  }
  v2 = (void *)sharedInstance___SharedInstance_0;

  return v2;
}

void __47__FBInterfaceOrientationService_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(FBInterfaceOrientationService);
  v1 = (void *)sharedInstance___SharedInstance_0;
  sharedInstance___SharedInstance_0 = (uint64_t)v0;
}

- (FBInterfaceOrientationService)init
{
  v6.receiver = self;
  v6.super_class = (Class)FBInterfaceOrientationService;
  v2 = [(FBInterfaceOrientationService *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(FBInterfaceOrientationServiceServer);
    server = v2->_server;
    v2->_server = v3;
  }
  return v2;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
}

- (void)setInterfaceOrientation:(int64_t)a3 animationSettings:(id)a4 direction:(int64_t)a5
{
  self->_interfaceOrientation = a3;
  -[FBInterfaceOrientationServiceServer noteInterfaceOrientationChanged:animationSettings:direction:](self->_server, "noteInterfaceOrientationChanged:animationSettings:direction:");
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void).cxx_destruct
{
}

@end