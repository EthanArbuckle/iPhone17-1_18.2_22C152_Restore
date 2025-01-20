@interface FBSOpenApplicationServiceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
- (FBSOpenApplicationServiceSpecification)init;
@end

@implementation FBSOpenApplicationServiceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.frontboard.open";
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[off_1E58F4580 userInitiated];
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken != -1) {
    dispatch_once(&interface_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)interface___interface;

  return (BSServiceInterface *)v2;
}

void __51__FBSOpenApplicationServiceSpecification_interface__block_invoke()
{
  v0 = +[FBSOpenApplicationServiceSpecification identifier];
  id v4 = [off_1E58F4538 interfaceWithIdentifier:v0];

  v1 = [off_1E58F4550 protocolForProtocol:&unk_1EED55140];
  [v4 setServer:v1];

  uint64_t v2 = [v4 copy];
  v3 = (void *)interface___interface;
  interface___interface = v2;
}

- (FBSOpenApplicationServiceSpecification)init
{
  id v4 = [NSString stringWithFormat:@"-init is not available on FBSOpenApplicationServiceSpecification"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    v9 = v5;
    __int16 v10 = 2114;
    v11 = v7;
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2114;
    v15 = @"FBSOpenApplicationServiceSpecification.m";
    __int16 v16 = 1024;
    int v17 = 18;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

@end