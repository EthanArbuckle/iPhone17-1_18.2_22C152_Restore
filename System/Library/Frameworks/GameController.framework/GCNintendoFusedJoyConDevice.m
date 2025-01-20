@interface GCNintendoFusedJoyConDevice
@end

@implementation GCNintendoFusedJoyConDevice

void __59___GCNintendoFusedJoyConDevice_initWithLeft_right_manager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshBattery];
  [WeakRetained _propagateBattery];
}

void __59___GCNintendoFusedJoyConDevice_initWithLeft_right_manager___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshBattery];
  [WeakRetained _propagateBattery];
}

void __51___GCNintendoFusedJoyConDevice_Client___addClient___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeClient:v2];
}

@end