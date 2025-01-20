@interface AXFBFakeProcess
- (AXFBFakeProcessState)state;
- (NSString)bundleIdentifier;
- (void)setBundleIdentifier:(id)a3;
- (void)setState:(id)a3;
@end

@implementation AXFBFakeProcess

- (AXFBFakeProcessState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end