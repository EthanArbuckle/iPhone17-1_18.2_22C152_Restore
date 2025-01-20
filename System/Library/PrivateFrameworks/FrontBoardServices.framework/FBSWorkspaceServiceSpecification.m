@interface FBSWorkspaceServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceInterface)invertedInterface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
+ (id)_interfaceWithInversion:(uint64_t)a1;
- (FBSWorkspaceServiceSpecification)init;
@end

@implementation FBSWorkspaceServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.frontboard.workspace-service";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[off_1E58F4580 userInteractive];
}

+ (BSServiceInterface)interface
{
  return (BSServiceInterface *)+[FBSWorkspaceServiceSpecification _interfaceWithInversion:]((uint64_t)FBSWorkspaceServiceSpecification, 0);
}

+ (id)_interfaceWithInversion:(uint64_t)a1
{
  uint64_t v3 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__FBSWorkspaceServiceSpecification__interfaceWithInversion___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v3;
  if (_interfaceWithInversion__onceToken != -1) {
    dispatch_once(&_interfaceWithInversion__onceToken, block);
  }
  v4 = &_interfaceWithInversion____invertedInterface;
  if (!a2) {
    v4 = &_interfaceWithInversion____interface;
  }
  v5 = (void *)*v4;

  return v5;
}

uint64_t __60__FBSWorkspaceServiceSpecification__interfaceWithInversion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setClientMessagingExpectation:1];
}

void __60__FBSWorkspaceServiceSpecification__interfaceWithInversion___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) identifier];
  id v8 = [off_1E58F4538 interfaceWithIdentifier:v1];

  v2 = [off_1E58F4550 protocolForProtocol:&unk_1EED551A0];
  [v8 setServer:v2];

  uint64_t v3 = [off_1E58F4550 protocolForProtocol:&unk_1EED49EB0];
  [v8 setClient:v3];

  [v8 setClientMessagingExpectation:1];
  uint64_t v4 = [v8 copy];
  v5 = (void *)_interfaceWithInversion____interface;
  _interfaceWithInversion____interface = v4;

  uint64_t v6 = [(id)_interfaceWithInversion____interface invertInterface:&__block_literal_global_15];
  v7 = (void *)_interfaceWithInversion____invertedInterface;
  _interfaceWithInversion____invertedInterface = v6;
}

- (FBSWorkspaceServiceSpecification)init
{
  uint64_t v4 = [NSString stringWithFormat:@"-init is not available on FBSWorkspaceServiceSpecification"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    v9 = v5;
    __int16 v10 = 2114;
    v11 = v7;
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2114;
    v15 = @"FBSWorkspaceServiceSpecification.m";
    __int16 v16 = 1024;
    int v17 = 20;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

+ (BSServiceInterface)invertedInterface
{
  return (BSServiceInterface *)+[FBSWorkspaceServiceSpecification _interfaceWithInversion:]((uint64_t)FBSWorkspaceServiceSpecification, 1);
}

@end