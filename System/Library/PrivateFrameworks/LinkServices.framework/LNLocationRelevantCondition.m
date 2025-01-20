@interface LNLocationRelevantCondition
- (CLRegion)region;
- (LNLocationRelevantCondition)initWithRegion:(id)a3;
@end

@implementation LNLocationRelevantCondition

- (void).cxx_destruct
{
}

- (CLRegion)region
{
  return self->_region;
}

- (LNLocationRelevantCondition)initWithRegion:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LNRelevantContext.m", 581, @"Invalid parameter not satisfying: %@", @"region" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)LNLocationRelevantCondition;
  v7 = [(LNRelevantCondition *)&v12 _init];
  v8 = (LNLocationRelevantCondition *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 1, a3);
    v9 = v8;
  }

  return v8;
}

@end