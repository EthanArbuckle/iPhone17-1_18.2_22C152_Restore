@interface MLComputePlanDeviceUsageSupportStatePattern
+ (id)deviceUsageSupportStatePatternWithPattern:(id)a3 supportState:(int64_t)a4;
- (BOOL)isMatchForValidationMessage:(id)a3;
- (MLComputePlanDeviceUsageSupportStatePattern)initWithPattern:(id)a3 supportState:(int64_t)a4;
- (NSRegularExpression)regex;
- (id)description;
- (int64_t)supportState;
@end

@implementation MLComputePlanDeviceUsageSupportStatePattern

- (void).cxx_destruct
{
}

- (NSRegularExpression)regex
{
  return self->_regex;
}

- (int64_t)supportState
{
  return self->_supportState;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p> Support state: %zd", v5, self, -[MLComputePlanDeviceUsageSupportStatePattern supportState](self, "supportState")];

  return v6;
}

- (BOOL)isMatchForValidationMessage:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = [v4 length];
    v6 = [(MLComputePlanDeviceUsageSupportStatePattern *)self regex];
    v7 = objc_msgSend(v6, "firstMatchInString:options:range:", v4, 0, 0, v5);
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (MLComputePlanDeviceUsageSupportStatePattern)initWithPattern:(id)a3 supportState:(int64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MLComputePlanDeviceUsageSupportStatePattern;
  v7 = [(MLComputePlanDeviceUsageSupportStatePattern *)&v15 init];
  if (v7)
  {
    id v14 = 0;
    uint64_t v8 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v6 options:1 error:&v14];
    id v9 = v14;
    regex = v7->_regex;
    v7->_regex = (NSRegularExpression *)v8;

    if (v9 || !v7->_regex)
    {
      v11 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "Encountered an unexpected internal state when creating the support state pattern.", v13, 2u);
      }

      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Encountered an unexpected internal state when creating the support state pattern."];
    }
    v7->_supportState = a4;
  }
  return v7;
}

+ (id)deviceUsageSupportStatePatternWithPattern:(id)a3 supportState:(int64_t)a4
{
  id v5 = a3;
  id v6 = [[MLComputePlanDeviceUsageSupportStatePattern alloc] initWithPattern:v5 supportState:a4];

  return v6;
}

@end