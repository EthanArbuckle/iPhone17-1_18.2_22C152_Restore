@interface CTCellularPlanManagerDelegate
- (void)carrierInfoDidUpdate;
- (void)localPlanInfoDidUpdate:(id)a3;
- (void)pendingTransferPlanInfoDidUpdate;
- (void)planInfoDidUpdate;
- (void)remoteProvisioningDidBecomeAvailable;
@end

@implementation CTCellularPlanManagerDelegate

- (void)planInfoDidUpdate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CTCellularPlanManagerDelegate planInfoDidUpdate]";
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CTCellularPlanManagerDelegate_planInfoDidUpdate__block_invoke;
  block[3] = &unk_1E6C1ED88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __50__CTCellularPlanManagerDelegate_planInfoDidUpdate__block_invoke(uint64_t a1)
{
  v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"CTCellularPlanInfoDidChangeNotification" object:v3 userInfo:0];
}

- (void)localPlanInfoDidUpdate:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = CellularPlanLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[CTCellularPlanManagerDelegate localPlanInfoDidUpdate:]";
    __int16 v9 = 2112;
    id v10 = a3;
    _os_log_impl(&dword_1DB90D000, v5, OS_LOG_TYPE_INFO, "%s: %@", buf, 0x16u);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__CTCellularPlanManagerDelegate_localPlanInfoDidUpdate___block_invoke;
  v6[3] = &unk_1E6C1EDB0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __56__CTCellularPlanManagerDelegate_localPlanInfoDidUpdate___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v5 = @"CTCellularPlanLocalInfoError";
    v6[0] = v2;
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  }
  else
  {
    uint64_t v3 = 0;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"CTCellularPlanInfoDidChangeNotification", *(void *)(a1 + 40), 0);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotificationName:object:userInfo:", @"CTCellularPlanLocalInfoDidChangeNotification", *(void *)(a1 + 40), v3);
}

- (void)pendingTransferPlanInfoDidUpdate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CTCellularPlanManagerDelegate pendingTransferPlanInfoDidUpdate]";
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CTCellularPlanManagerDelegate_pendingTransferPlanInfoDidUpdate__block_invoke;
  block[3] = &unk_1E6C1ED88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __65__CTCellularPlanManagerDelegate_pendingTransferPlanInfoDidUpdate__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"CTCellularPlanPendingTransferDidChangeNotification" object:v3 userInfo:0];
}

- (void)carrierInfoDidUpdate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CTCellularPlanManagerDelegate carrierInfoDidUpdate]";
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CTCellularPlanManagerDelegate_carrierInfoDidUpdate__block_invoke;
  block[3] = &unk_1E6C1ED88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __53__CTCellularPlanManagerDelegate_carrierInfoDidUpdate__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"CTCarrierInfoDidChangeNotification" object:v3 userInfo:0];
}

- (void)remoteProvisioningDidBecomeAvailable
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CTCellularPlanManagerDelegate remoteProvisioningDidBecomeAvailable]";
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__CTCellularPlanManagerDelegate_remoteProvisioningDidBecomeAvailable__block_invoke;
  block[3] = &unk_1E6C1ED88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __69__CTCellularPlanManagerDelegate_remoteProvisioningDidBecomeAvailable__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"CTCellularPlanRemoteProvisioningDidBecomeAvailable" object:v3 userInfo:0];
}

@end