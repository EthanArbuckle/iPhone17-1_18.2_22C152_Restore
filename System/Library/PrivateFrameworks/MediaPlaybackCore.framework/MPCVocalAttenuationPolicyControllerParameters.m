@interface MPCVocalAttenuationPolicyControllerParameters
- (ICEnvironmentMonitor)thermalMonitor;
- (NSProcessInfo)lowPowerModeMonitor;
- (double)renderingTimeLimit;
- (void)setLowPowerModeMonitor:(id)a3;
- (void)setRenderingTimeLimit:(double)a3;
- (void)setThermalMonitor:(id)a3;
@end

@implementation MPCVocalAttenuationPolicyControllerParameters

- (void)setThermalMonitor:(id)a3
{
}

- (void)setRenderingTimeLimit:(double)a3
{
  self->_renderingTimeLimit = a3;
}

- (void)setLowPowerModeMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowPowerModeMonitor, 0);

  objc_storeStrong((id *)&self->_thermalMonitor, 0);
}

- (ICEnvironmentMonitor)thermalMonitor
{
  return self->_thermalMonitor;
}

- (NSProcessInfo)lowPowerModeMonitor
{
  return self->_lowPowerModeMonitor;
}

- (double)renderingTimeLimit
{
  return self->_renderingTimeLimit;
}

@end