@interface LACEnvironmentDependencies
- (LACBiometryHelper)biometryHelper;
- (LACOnenessSessionMonitoring)onenessSessionMonitor;
- (LACPasscodeHelper)passcodeHelper;
- (void)setBiometryHelper:(id)a3;
- (void)setOnenessSessionMonitor:(id)a3;
- (void)setPasscodeHelper:(id)a3;
@end

@implementation LACEnvironmentDependencies

- (LACBiometryHelper)biometryHelper
{
  return self->_biometryHelper;
}

- (void)setBiometryHelper:(id)a3
{
}

- (LACOnenessSessionMonitoring)onenessSessionMonitor
{
  return self->_onenessSessionMonitor;
}

- (void)setOnenessSessionMonitor:(id)a3
{
}

- (LACPasscodeHelper)passcodeHelper
{
  return self->_passcodeHelper;
}

- (void)setPasscodeHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeHelper, 0);
  objc_storeStrong((id *)&self->_onenessSessionMonitor, 0);
  objc_storeStrong((id *)&self->_biometryHelper, 0);
}

@end