@interface BCPowerSourceController
@end

@implementation BCPowerSourceController

uint64_t __73___BCPowerSourceController__registerForNotification_token_queue_handler___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = BCLogPowerSourceController;
  if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[6];
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2082;
    uint64_t v11 = v6;
    _os_log_impl(&dword_21C664000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) Received %{public}s notification", (uint8_t *)&v8, 0x16u);
  }
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

uint64_t __82___BCPowerSourceController__registerForPowerSourceChangeNotification_token_queue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryConnectedDevices];
}

uint64_t __81___BCPowerSourceController__orderedDevicesFromPowerSourcesBlob_powerSourcesList___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _isDevicePartOfPair:v3];
  if (v4)
  {
    uint64_t v5 = [v3 matchIdentifier];
    uint64_t v6 = [*(id *)(a1 + 40) objectForKey:v5];
    if (!v6)
    {
      uint64_t v6 = [MEMORY[0x263EFF980] array];
      [*(id *)(a1 + 40) setObject:v6 forKey:v5];
    }
    [v6 addObject:v3];
  }
  return v4;
}

uint64_t __56___BCPowerSourceController__notifyObserver_block_queue___block_invoke(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = (void *)BCLogPowerSourceController;
  if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = v2;
    v7 = objc_opt_class();
    uint64_t v8 = a1[5];
    int v11 = 138543874;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v8;
    id v9 = v7;
    _os_log_impl(&dword_21C664000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) Notifying observer: <%{public}@: %p>", (uint8_t *)&v11, 0x20u);
  }
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(a1[6] + 16))(a1[6], a1[5], v3, v4);
}

void __50___BCPowerSourceController__queryConnectedDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 connectedDevicesDidChange:*(void *)(a1 + 32)];
  }
}

void __59___BCPowerSourceController_addBatteryDeviceObserver_queue___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) connectedDevices];
    [v4 connectedDevicesDidChange:v3];
  }
}

void __72___BCPowerSourceController__shouldCoalesceDevices_minimumPercentCharge___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v24 = v7;
  if (a3)
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectAtIndex:a3 - 1];
    uint64_t v9 = [v8 vendor];
    if (v9 == [v24 vendor])
    {
      uint64_t v10 = [v8 productIdentifier];
      if (v10 == [v24 productIdentifier])
      {
        int v11 = [v8 matchIdentifier];
        uint64_t v12 = [v24 matchIdentifier];
        int v13 = [v11 isEqual:v12];

        if (v13)
        {
          uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          uint64_t v15 = [v8 percentCharge];
          uint64_t v16 = [v24 percentCharge];
          if (v14 >= v15) {
            uint64_t v17 = v15;
          }
          else {
            uint64_t v17 = v14;
          }
          if (v17 >= v16) {
            uint64_t v17 = v16;
          }
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v17;
          uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          uint64_t v19 = [v8 percentCharge];
          uint64_t v20 = [v24 percentCharge];
          if (v18 <= v19) {
            uint64_t v21 = v19;
          }
          else {
            uint64_t v21 = v18;
          }
          if (v21 <= v20) {
            uint64_t v21 = v20;
          }
          if (v21 - *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > 9)
          {
            char v23 = 0;
          }
          else
          {
            char v22 = [v8 isCharging];
            char v23 = v22 ^ [v24 isCharging] ^ 1;
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v23;
        }
      }
    }
    *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) ^ 1;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 percentCharge];
  }
}

uint64_t __81___BCPowerSourceController__orderedDevicesFromPowerSourcesBlob_powerSourcesList___block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  int v8 = [v6 isInternal];
  if (v8 == [v7 isInternal])
  {
    uint64_t v10 = [v6 vendor];
    if ((v10 == 1) != ([v7 vendor] != 1))
    {
      uint64_t v11 = [v6 accessoryCategory];
      uint64_t v12 = [v7 accessoryCategory];
      unint64_t v13 = 0;
      unint64_t v14 = -1;
      unint64_t v15 = -1;
      do
      {
        uint64_t v16 = orderedDeviceAccessoryCategories[v13];
        if (v16 == v11) {
          unint64_t v15 = v13;
        }
        if (v16 == v12) {
          unint64_t v14 = v13;
        }
        ++v13;
      }
      while (v13 != 8);
      BOOL v17 = v15 >= v14;
      BOOL v18 = v15 > v14;
      if (v17) {
        uint64_t v9 = v18;
      }
      else {
        uint64_t v9 = -1;
      }
      if (!v9)
      {
        uint64_t v19 = [v6 transportType];
        if (v19 == [v7 transportType]
          && (uint64_t v20 = [v6 productIdentifier], v20 == objc_msgSend(v7, "productIdentifier"))
          && (uint64_t v21 = [v6 parts], v21 != objc_msgSend(v7, "parts")))
        {
          unint64_t v25 = [v6 parts];
          if (v25 < [v7 parts]) {
            uint64_t v9 = -1;
          }
          else {
            uint64_t v9 = 1;
          }
        }
        else
        {
          char v22 = [v6 name];
          char v23 = [v7 name];
          uint64_t v9 = [v22 compare:v23];
        }
      }
    }
    else if (v10 == 1)
    {
      uint64_t v9 = -1;
    }
    else
    {
      uint64_t v9 = 1;
    }
  }
  else if (v8)
  {
    uint64_t v9 = -1;
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

uint64_t __65___BCPowerSourceController__beginPowerSourceObservingIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleLowPowerModeChanged:a2];
}

uint64_t __52___BCPowerSourceController__endPowerSourceObserving__block_invoke(uint64_t a1, int *a2)
{
  uint64_t result = notify_is_valid_token(*a2);
  if (result) {
    uint64_t result = notify_cancel(*a2);
  }
  *a2 = 0;
  return result;
}

@end