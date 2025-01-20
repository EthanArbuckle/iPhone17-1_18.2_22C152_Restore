@interface WKFindResult
+ (BOOL)accessInstanceVariablesDirectly;
- (BOOL)matchFound;
- (WKFindResult)init;
- (id)_initWithMatchFound:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation WKFindResult

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKFindResult accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKFindResult accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1EB357B50;
    if (os_log_type_enabled((os_log_t)qword_1EB357B50, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_1985F2000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (WKFindResult)init
{
  return 0;
}

- (id)_initWithMatchFound:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WKFindResult;
  id result = [(WKFindResult *)&v5 init];
  if (result) {
    *((unsigned char *)result + 8) = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL matchFound = self->_matchFound;

  return (id)[v4 _initWithMatchFound:matchFound];
}

- (BOOL)matchFound
{
  return self->_matchFound;
}

@end