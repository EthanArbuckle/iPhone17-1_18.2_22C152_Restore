@interface CTCarrierSpaceClientDelegateProxy
- (CTCarrierSpaceClientDelegate)delegate;
- (void)appsDidChange;
- (void)capabilitiesDidChange:(id)a3;
- (void)dataPlanMetricsDidChange;
- (void)plansDidChange;
- (void)purchasedPlan:(id)a3 didChangeStatus:(int64_t)a4 context:(id)a5;
- (void)remoteObjectRespondsToSelector:(SEL)a3 handler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)usageDidChange;
- (void)userConsentFlowInfoDidChange;
@end

@implementation CTCarrierSpaceClientDelegateProxy

- (void)remoteObjectRespondsToSelector:(SEL)a3 handler:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = objc_opt_respondsToSelector();
  (*((void (**)(id, void))a4 + 2))(v6, v7 & 1);
}

- (void)capabilitiesDidChange:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained capabilitiesDidChange:v4];
}

- (void)userConsentFlowInfoDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained userConsentFlowInfoDidChange];
}

- (void)usageDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained usageDidChange];
}

- (void)plansDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained plansDidChange];
}

- (void)appsDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained appsDidChange];
}

- (void)dataPlanMetricsDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dataPlanMetricsDidChange];
}

- (void)purchasedPlan:(id)a3 didChangeStatus:(int64_t)a4 context:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained purchasedPlan:v9 didChangeStatus:a4 context:v8];
}

- (CTCarrierSpaceClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CTCarrierSpaceClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end