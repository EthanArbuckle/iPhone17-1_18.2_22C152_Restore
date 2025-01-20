@interface LNConnectionPolicySignals
- (BOOL)shouldExecuteActionOnApplicationBasedOnMetadata;
- (LNConnectionPolicySignals)init;
- (NSString)preferredBundleIdentifier;
- (NSString)processInstanceIdentifier;
- (void)setPreferredBundleIdentifier:(id)a3;
- (void)setProcessInstanceIdentifier:(id)a3;
- (void)setShouldExecuteActionOnApplicationBasedOnMetadata:(BOOL)a3;
@end

@implementation LNConnectionPolicySignals

- (void)setPreferredBundleIdentifier:(id)a3
{
}

- (BOOL)shouldExecuteActionOnApplicationBasedOnMetadata
{
  return self->_shouldExecuteActionOnApplicationBasedOnMetadata;
}

- (NSString)preferredBundleIdentifier
{
  return self->_preferredBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredBundleIdentifier, 0);
}

- (LNConnectionPolicySignals)init
{
  v6.receiver = self;
  v6.super_class = (Class)LNConnectionPolicySignals;
  v2 = [(LNConnectionPolicySignals *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_shouldExecuteActionOnApplicationBasedOnMetadata = 1;
    v4 = v2;
  }

  return v3;
}

- (void)setShouldExecuteActionOnApplicationBasedOnMetadata:(BOOL)a3
{
  self->_shouldExecuteActionOnApplicationBasedOnMetadata = a3;
}

- (void)setProcessInstanceIdentifier:(id)a3
{
}

- (NSString)processInstanceIdentifier
{
  return self->_processInstanceIdentifier;
}

@end