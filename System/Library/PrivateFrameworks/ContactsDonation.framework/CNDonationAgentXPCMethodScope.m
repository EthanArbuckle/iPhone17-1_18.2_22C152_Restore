@interface CNDonationAgentXPCMethodScope
@end

@implementation CNDonationAgentXPCMethodScope

void __38___CNDonationAgentXPCMethodScope_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4097 userInfo:0];
  [WeakRetained finishWithError:v1];
}

void __38___CNDonationAgentXPCMethodScope_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4099 userInfo:0];
  [WeakRetained finishWithError:v1];
}

void __38___CNDonationAgentXPCMethodScope_init__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained finishWithError:v3];
}

uint64_t __67___CNDonationAgentXPCMethodScope_initWithConnection_promise_proxy___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __67___CNDonationAgentXPCMethodScope_initWithConnection_promise_proxy___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

@end