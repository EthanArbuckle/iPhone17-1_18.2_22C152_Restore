@interface OSLaunchdJobInstanceProperties
- (NSDictionary)environmentVariables;
- (NSString)sandboxProfile;
- (void)setEnvironmentVariables:(id)a3;
- (void)setSandboxProfile:(id)a3;
@end

@implementation OSLaunchdJobInstanceProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentVariables, 0);

  objc_storeStrong((id *)&self->_sandboxProfile, 0);
}

- (NSString)sandboxProfile
{
  return self->_sandboxProfile;
}

- (NSDictionary)environmentVariables
{
  return self->_environmentVariables;
}

- (void)setSandboxProfile:(id)a3
{
}

- (void)setEnvironmentVariables:(id)a3
{
}

@end