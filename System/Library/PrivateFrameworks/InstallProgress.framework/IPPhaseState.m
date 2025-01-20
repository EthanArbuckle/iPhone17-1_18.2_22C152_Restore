@interface IPPhaseState
+ (BOOL)supportsSecureCoding;
- (IPPhaseState)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IPPhaseState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IPPhaseState)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)IPPhaseState;
  v5 = [(IPPhaseState *)&v7 init];
  if (v5)
  {
    v5->_totalUnitCount = [v4 decodeInt64ForKey:@"totalUnitCount"];
    v5->_completedUnitCount = [v4 decodeInt64ForKey:@"completedUnitCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t totalUnitCount = self->_totalUnitCount;
  id v5 = a3;
  [v5 encodeInt64:totalUnitCount forKey:@"totalUnitCount"];
  [v5 encodeInt64:self->_completedUnitCount forKey:@"completedUnitCount"];
}

@end