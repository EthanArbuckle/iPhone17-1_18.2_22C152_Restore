@interface HMDConfigurationMessagePolicy
+ (id)policyWithOperationTypes:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (HMDConfigurationMessagePolicy)init;
- (id)__initWithOperationTypes:(unint64_t)a3;
- (unint64_t)operationTypes;
@end

@implementation HMDConfigurationMessagePolicy

- (unint64_t)operationTypes
{
  return self->_operationTypes;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDConfigurationMessagePolicy *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      unint64_t v7 = [(HMDConfigurationMessagePolicy *)self operationTypes];
      BOOL v8 = v7 == [(HMDConfigurationMessagePolicy *)v6 operationTypes];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (id)__initWithOperationTypes:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDConfigurationMessagePolicy;
  id result = [(HMDConfigurationMessagePolicy *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (HMDConfigurationMessagePolicy)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  objc_super v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)policyWithOperationTypes:(unint64_t)a3
{
  uint64_t v3 = objc_msgSend(objc_alloc((Class)a1), "__initWithOperationTypes:", a3);
  return v3;
}

@end