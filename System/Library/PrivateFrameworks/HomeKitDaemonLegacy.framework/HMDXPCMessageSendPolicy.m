@interface HMDXPCMessageSendPolicy
- (BOOL)canSendWithPolicyParameters:(id)a3;
- (BOOL)isEqual:(id)a3;
@end

@implementation HMDXPCMessageSendPolicy

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDXPCMessageSendPolicy *)a3;
  if (self == v4)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = objc_opt_isKindOfClass() & (v4 != 0);
  }

  return v5;
}

- (BOOL)canSendWithPolicyParameters:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

@end