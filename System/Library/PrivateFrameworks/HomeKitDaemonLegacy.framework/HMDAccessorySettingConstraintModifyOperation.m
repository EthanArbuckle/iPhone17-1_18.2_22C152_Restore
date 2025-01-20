@interface HMDAccessorySettingConstraintModifyOperation
- (id)executionBlock;
- (void)main;
- (void)setExecutionBlock:(id)a3;
@end

@implementation HMDAccessorySettingConstraintModifyOperation

- (void).cxx_destruct
{
}

- (void)setExecutionBlock:(id)a3
{
}

- (id)executionBlock
{
  return objc_getProperty(self, a2, 312, 1);
}

- (void)main
{
  v2 = [(HMDAccessorySettingConstraintModifyOperation *)self executionBlock];
  v2[2]();
}

@end