@interface CRKNetworkPowerAssertion
+ (id)sharedInstance;
+ (void)decrement;
+ (void)increment;
- (CRKNetworkPowerAssertion)init;
- (NSString)name;
- (unint64_t)count;
- (void)decrement;
- (void)increment;
- (void)setCount:(unint64_t)a3;
@end

@implementation CRKNetworkPowerAssertion

- (CRKNetworkPowerAssertion)init
{
  v14.receiver = self;
  v14.super_class = (Class)CRKNetworkPowerAssertion;
  v2 = [(CRKNetworkPowerAssertion *)&v14 init];
  if (v2)
  {
    v3 = NSString;
    v4 = [MEMORY[0x263F08AB0] processInfo];
    v5 = [v4 processName];
    v6 = NSNumber;
    v7 = [MEMORY[0x263F08AB0] processInfo];
    v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    uint64_t v11 = [v3 stringWithFormat:@"%@:%@:%@:%p", v5, v8, v10, v2];
    name = v2->_name;
    v2->_name = (NSString *)v11;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_79);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __42__CRKNetworkPowerAssertion_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

+ (void)increment
{
  id v2 = [a1 sharedInstance];
  [v2 increment];
}

- (void)increment
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ([(CRKNetworkPowerAssertion *)self count])
  {
    IOPMAssertionRetain(self->mPowerAssertion);
    unint64_t v3 = [(CRKNetworkPowerAssertion *)self count] + 1;
    v4 = self;
LABEL_3:
    [(CRKNetworkPowerAssertion *)v4 setCount:v3];
    goto LABEL_9;
  }
  if (CRKIsiOS()) {
    CFStringRef v5 = @"PreventUserIdleSystemSleep";
  }
  else {
    CFStringRef v5 = @"NetworkClientActive";
  }
  v6 = [(CRKNetworkPowerAssertion *)self name];
  IOReturn v7 = IOPMAssertionCreateWithName(v5, 0xFFu, v6, &self->mPowerAssertion);

  if (!v7)
  {
    v4 = self;
    unint64_t v3 = 1;
    goto LABEL_3;
  }
  self->mPowerAssertion = 0;
LABEL_9:
  v8 = _CRKLogGeneral_10();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    unint64_t v10 = [(CRKNetworkPowerAssertion *)self count];
    _os_log_impl(&dword_224C00000, v8, OS_LOG_TYPE_DEFAULT, "Incrementing network power assertion to %ld", (uint8_t *)&v9, 0xCu);
  }
}

+ (void)decrement
{
  id v2 = [a1 sharedInstance];
  [v2 decrement];
}

- (void)decrement
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 138543618;
  uint64_t v5 = objc_opt_class();
  __int16 v6 = 2048;
  uint64_t v7 = [a1 count];
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Unbalanced number of calls to increment/decrement. self.count = %lu", (uint8_t *)&v4, 0x16u);
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
}

@end