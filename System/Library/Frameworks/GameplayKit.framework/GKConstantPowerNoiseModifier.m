@interface GKConstantPowerNoiseModifier
- (GKConstantPowerNoiseModifier)init;
- (GKConstantPowerNoiseModifier)initWithConstantPower:(double)a3;
- (GKConstantPowerNoiseModifier)initWithInputModuleCount:(unint64_t)a3;
- (double)valueAt:(GKConstantPowerNoiseModifier *)self;
- (id)cloneModule;
- (int)requiredInputModuleCount;
@end

@implementation GKConstantPowerNoiseModifier

- (GKConstantPowerNoiseModifier)init
{
  return [(GKConstantPowerNoiseModifier *)self initWithConstantPower:1.0];
}

- (GKConstantPowerNoiseModifier)initWithInputModuleCount:(unint64_t)a3
{
  return -[GKConstantPowerNoiseModifier initWithConstantPower:](self, "initWithConstantPower:", a3, 1.0);
}

- (GKConstantPowerNoiseModifier)initWithConstantPower:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKConstantPowerNoiseModifier;
  result = [(GKNoiseModifier *)&v5 initWithInputModuleCount:1];
  if (result) {
    result->_power = a3;
  }
  return result;
}

- (int)requiredInputModuleCount
{
  return 1;
}

- (double)valueAt:(GKConstantPowerNoiseModifier *)self
{
  long long v8 = v2[1];
  long long v9 = *v2;
  v4 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:0];
  v10[0] = v9;
  v10[1] = v8;
  [v4 valueAt:v10];
  long double v6 = v5;

  return pow(v6, self->_power);
}

- (id)cloneModule
{
  v2 = [[GKConstantPowerNoiseModifier alloc] initWithConstantPower:self->_power];

  return v2;
}

@end