@interface BLSHEnvironmentOperation
- (BLSHEnvironmentOperation)initWithBacklightState:(int64_t)a3;
- (id)description;
- (int64_t)backlightState;
@end

@implementation BLSHEnvironmentOperation

- (BLSHEnvironmentOperation)initWithBacklightState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BLSHEnvironmentOperation;
  result = [(BLSHEnvironmentOperation *)&v5 init];
  if (result) {
    result->_backlightState = a3;
  }
  return result;
}

- (id)description
{
  v2 = [MEMORY[0x263F29C40] builderWithObject:self];
  v3 = NSStringFromBLSBacklightState();
  id v4 = (id)[v2 appendObject:v3 withName:@"backlightState"];

  objc_super v5 = [v2 build];

  return v5;
}

- (int64_t)backlightState
{
  return self->_backlightState;
}

@end