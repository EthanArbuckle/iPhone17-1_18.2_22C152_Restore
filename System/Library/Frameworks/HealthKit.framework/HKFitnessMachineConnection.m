@interface HKFitnessMachineConnection
@end

@implementation HKFitnessMachineConnection

void __51___HKFitnessMachineConnection_initWithHealthStore___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _registerClient];
}

void __42___HKFitnessMachineConnection_description__block_invoke(uint64_t a1)
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = [v4 uuid];
  uint64_t v6 = [v5 UUIDString];
  v7 = (void *)v6;
  unint64_t v8 = *(void *)(*(void *)(a1 + 32) + 56);
  if (v8 > 6) {
    v9 = 0;
  }
  else {
    v9 = off_1E58C44A8[v8];
  }
  unint64_t v10 = *(void *)(*(void *)(a1 + 32) + 48);
  if (v10 > 4) {
    v11 = 0;
  }
  else {
    v11 = off_1E58C44E0[v10];
  }
  uint64_t v12 = [v2 stringWithFormat:@"<%@ %p> %@ connectionState: %@ machineState: %@ %@", v15, v4, v6, v9, v11, *(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

uint64_t __46___HKFitnessMachineConnection_markClientReady__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_markClientReady");
}

uint64_t __46___HKFitnessMachineConnection_markClientReady__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientRemote_deliverFailedWithError:", a2);
}

uint64_t __46___HKFitnessMachineConnection__registerClient__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_registerClient:", *(void *)(a1 + 32));
}

uint64_t __46___HKFitnessMachineConnection__registerClient__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientRemote_deliverFailedWithError:", a2);
}

uint64_t __34___HKFitnessMachineConnection_end__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_endFitnessMachineConnection");
}

uint64_t __34___HKFitnessMachineConnection_end__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientRemote_deliverFailedWithError:", a2);
}

uint64_t __64___HKFitnessMachineConnection_endWithFitnessMachineSessionUUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_endFitnessMachineConnectionForFitnessMachineSessionUUID:", *(void *)(a1 + 32));
}

uint64_t __64___HKFitnessMachineConnection_endWithFitnessMachineSessionUUID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientRemote_deliverFailedWithError:", a2);
}

void __58___HKFitnessMachineConnection_currentSessionConfiguration__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) uuid];
  [v2 _setConnectionUUID:v3];

  [*(id *)(a1 + 32) _setSessionUUID:*(void *)(*(void *)(a1 + 40) + 16)];
  v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(*(void *)(a1 + 40) + 24) identifier];
  [v4 _setMachineUUID:v5];

  objc_msgSend(*(id *)(a1 + 32), "_setMachineType:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "type"));
  uint64_t v6 = *(void **)(a1 + 32);
  v7 = [*(id *)(*(void *)(a1 + 40) + 24) device];
  unint64_t v8 = [v7 name];
  [v6 _setMachineName:v8];

  v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(*(void *)(a1 + 40) + 24) brand];
  [v9 _setMachineBrand:v10];
}

uint64_t __52___HKFitnessMachineConnection_deviceForFinalWorkout__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  if (!v3)
  {
    v4 = [*(id *)(v2 + 24) brand];
    if (v4)
    {
      v5 = [[HKDevice alloc] initWithName:v4 manufacturer:v4 model:0 hardwareVersion:0 firmwareVersion:0 softwareVersion:0 localIdentifier:@"com.healthd.fitnessmachine" UDIDeviceIdentifier:0];
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = *(void **)(v6 + 32);
      *(void *)(v6 + 32) = v5;

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "_setFitnessMachineType:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "type"));
    }

    v3 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [v3 copy];

  return MEMORY[0x1F41817F8]();
}

void __63___HKFitnessMachineConnection_clientRemote_deliverDetectedNFC___block_invoke(uint64_t a1)
{
}

void __63___HKFitnessMachineConnection_clientRemote_deliverDetectedNFC___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
      [v6 fitnessMachineConnectionDetectedNFC:*(void *)(a1 + 32) fitnessMachineSessionUUID:*(void *)(a1 + 40)];
    }
  }
}

void __77___HKFitnessMachineConnection_clientRemote_deliverMachineInformationUpdated___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = 0;
}

void __77___HKFitnessMachineConnection_clientRemote_deliverMachineInformationUpdated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [v4 fitnessMachineConnection:*(void *)(a1 + 32) machineInformationUpdated:*(void *)(a1 + 40)];
  }
}

uint64_t __114___HKFitnessMachineConnection_clientRemote_deliverMachineChangedToState_fromState_fitnessMachineSessionUUID_date___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 48) = *(void *)(result + 40);
  return result;
}

void __114___HKFitnessMachineConnection_clientRemote_deliverMachineChangedToState_fromState_fitnessMachineSessionUUID_date___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 64));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(a1[4] + 64));
    [v4 fitnessMachineConnection:a1[4] machineChangedToState:a1[7] fromState:a1[8] fitnessMachineSessionUUID:a1[5] date:a1[6]];
  }
}

void __118___HKFitnessMachineConnection_clientRemote_deliverConnectionChangedToState_fromState_fitnessMachineSessionUUID_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  *(void *)(*(void *)(a1 + 32) + 56) = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  if (!v4) {
    goto LABEL_4;
  }
  if ([v4 isEqual:*(void *)(a1 + 40)])
  {
    uint64_t v3 = *(void *)v2;
LABEL_4:
    objc_storeStrong((id *)(v3 + 16), *(id *)(a1 + 40));
    goto LABEL_8;
  }
  _HKInitializeLogging();
  uint64_t v5 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_ERROR)) {
    __118___HKFitnessMachineConnection_clientRemote_deliverConnectionChangedToState_fromState_fitnessMachineSessionUUID_error___block_invoke_cold_1(v2, (uint64_t *)(a1 + 40), v5);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = 0;

  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"SessionID mismatch.");
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

LABEL_8:
  uint64_t v11 = *(void *)v2;
  if (*(void *)(*(void *)v2 + 56) == 5)
  {
    uint64_t v12 = *(void **)(v11 + 16);
    *(void *)(v11 + 16) = 0;

    uint64_t v13 = *(void **)(*(void *)v2 + 32);
    *(void *)(*(void *)v2 + 32) = 0;
  }
}

void __118___HKFitnessMachineConnection_clientRemote_deliverConnectionChangedToState_fromState_fitnessMachineSessionUUID_error___block_invoke_31(void *a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1[7] + 8) + 40);
  uint64_t v3 = (id *)a1[4];
  if (v2)
  {
    objc_msgSend(v3, "_clientQueue_deliverFailedWithError:");
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(v3 + 8);
    if (WeakRetained)
    {
      uint64_t v5 = WeakRetained;
      id v6 = objc_loadWeakRetained((id *)(a1[4] + 64));
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = objc_loadWeakRetained((id *)(a1[4] + 64));
        [v8 fitnessMachineConnection:a1[4] connectionChangedToState:a1[8] fromState:a1[9] fitnessMachineSessionUUID:a1[5] error:a1[6]];
      }
    }
  }
}

uint64_t __67___HKFitnessMachineConnection_clientRemote_deliverFailedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientQueue_deliverFailedWithError:", *(void *)(a1 + 40));
}

uint64_t __50___HKFitnessMachineConnection__simulateDisconnect__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_simulateDisconnect");
}

void __50___HKFitnessMachineConnection__simulateDisconnect__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  _HKInitializeLogging();
  uint64_t v3 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "Failed to simulate disconnect: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __63___HKFitnessMachineConnection__connectionInterruptedWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
      [v6 fitnessMachineConnection:*(void *)(a1 + 32) interruptedWithError:*(void *)(a1 + 40)];
    }
  }
}

void __118___HKFitnessMachineConnection_clientRemote_deliverConnectionChangedToState_fromState_fitnessMachineSessionUUID_error___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "Error currentSessionID: %@ not equal to machineSessionID: %@", (uint8_t *)&v5, 0x16u);
}

@end