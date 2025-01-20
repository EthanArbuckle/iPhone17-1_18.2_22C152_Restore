@interface HMDNetworkRouterFirewallRuleManagerClientState
- (HMDNetworkRouterFirewallRuleManagerClient)client;
- (id)startupCompletion;
- (void)setClient:(id)a3;
- (void)setStartupCompletion:(id)a3;
@end

@implementation HMDNetworkRouterFirewallRuleManagerClientState

- (void).cxx_destruct
{
  objc_storeStrong(&self->_startupCompletion, 0);
  objc_destroyWeak((id *)&self->_client);
}

- (void)setStartupCompletion:(id)a3
{
}

- (id)startupCompletion
{
  return self->_startupCompletion;
}

- (void)setClient:(id)a3
{
}

- (HMDNetworkRouterFirewallRuleManagerClient)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  return (HMDNetworkRouterFirewallRuleManagerClient *)WeakRetained;
}

@end