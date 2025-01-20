@interface WKFindConfiguration
+ (BOOL)accessInstanceVariablesDirectly;
- (BOOL)backwards;
- (BOOL)caseSensitive;
- (BOOL)wraps;
- (WKFindConfiguration)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBackwards:(BOOL)backwards;
- (void)setCaseSensitive:(BOOL)caseSensitive;
- (void)setWraps:(BOOL)wraps;
@end

@implementation WKFindConfiguration

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKFindConfiguration accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKFindConfiguration accessInstanceVariablesDirectly]::didLogFault = 1;
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

- (WKFindConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)WKFindConfiguration;
  result = [(WKFindConfiguration *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_backwards = 0;
    result->_wraps = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setBackwards:self->_backwards];
  [v4 setCaseSensitive:self->_caseSensitive];
  [v4 setWraps:self->_wraps];
  return v4;
}

- (BOOL)backwards
{
  return self->_backwards;
}

- (void)setBackwards:(BOOL)backwards
{
  self->_backwards = backwards;
}

- (BOOL)caseSensitive
{
  return self->_caseSensitive;
}

- (void)setCaseSensitive:(BOOL)caseSensitive
{
  self->_caseSensitive = caseSensitive;
}

- (BOOL)wraps
{
  return self->_wraps;
}

- (void)setWraps:(BOOL)wraps
{
  self->_wraps = wraps;
}

@end