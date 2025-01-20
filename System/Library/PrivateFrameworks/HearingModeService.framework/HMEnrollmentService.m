@interface HMEnrollmentService
- (BOOL)_isAudiogramValid:(id)a3;
- (HKAudiogramSample)selectedAudiogram;
- (HMEnrollmentService)initWithDeviceAddress:(id)a3;
- (NSArray)invalidAudiograms;
- (NSArray)validAudiograms;
- (OS_dispatch_queue)dispatchQueue;
- (float)amplification;
- (float)balance;
- (float)beamFormer;
- (float)getAmplification;
- (float)getBalance;
- (float)getBeamFormer;
- (float)getNoiseSuppression;
- (float)getTone;
- (float)noiseSuppression;
- (float)tone;
- (id)audiogramsAvailableHandler;
- (id)audiogramsFoundHandler;
- (void)_accessoryReceivedHearingModeSettings:(id)a3;
- (void)_accessorySendHearingModeSettings;
- (void)_activate;
- (void)_audiogramsQueryHandler:(id)a3 results:(id)a4 error:(id)a5;
- (void)_getHearingModeSettings:(id *)a3 fromAudiogram:(id)a4;
- (void)_invalidate;
- (void)_startAudiogramQuery;
- (void)_triggerOnDemandFaultCheckWithCompletionHandler:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)resetTunings;
- (void)setAmplification:(float)a3;
- (void)setAudiogramsAvailableHandler:(id)a3;
- (void)setAudiogramsFoundHandler:(id)a3;
- (void)setBalance:(float)a3;
- (void)setBeamFormer:(float)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setNoiseSuppression:(float)a3;
- (void)setSelectedAudiogram:(id)a3;
- (void)setTone:(float)a3;
- (void)triggerOnDemandFaultCheckWithCompletionHandler:(id)a3;
@end

@implementation HMEnrollmentService

- (HMEnrollmentService)initWithDeviceAddress:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMEnrollmentService;
  v6 = [(HMEnrollmentService *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, MEMORY[0x263EF83A0]);
    objc_storeStrong((id *)&v7->_bluetoothDeviceAddress, a3);
    v7->_amplification = 0.5;
    *(void *)&v7->_tone = 0x3F0000003F000000;
    v8 = v7;
  }

  return v7;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__HMEnrollmentService_activate__block_invoke;
  block[3] = &unk_265360FF8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__HMEnrollmentService_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (gLogCategory_HMEnrollmentService <= 30
    && (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(HMEnrollmentService *)self _startAudiogramQuery];
  v3 = self->_accessoryManager;
  if (!v3)
  {
    v4 = objc_alloc_init(HMAccessoryManager);
    objc_storeStrong((id *)&self->_accessoryManager, v4);
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    v7 = __32__HMEnrollmentService__activate__block_invoke;
    v8 = &unk_265361388;
    v9 = self;
    v3 = v4;
    objc_super v10 = v3;
    [(HMAccessoryManager *)self->_accessoryManager setSettingsUpdateHandler:&v5];
    if (gLogCategory_HMEnrollmentService <= 30
      && (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[HMAccessoryManager activateWithBluetoothDeviceAddress:](v3, "activateWithBluetoothDeviceAddress:", self->_bluetoothDeviceAddress, v5, v6, v7, v8, v9);
  }
}

void __32__HMEnrollmentService__activate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__HMEnrollmentService__activate__block_invoke_2;
  block[3] = &unk_265361360;
  block[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __32__HMEnrollmentService__activate__block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 8) == *(void *)(result + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_HMEnrollmentService <= 10
      && (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v2 = *(void **)(v1 + 32);
    uint64_t v3 = *(void *)(v1 + 48);
    return [v2 _accessoryReceivedHearingModeSettings:v3];
  }
  return result;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__HMEnrollmentService_invalidate__block_invoke;
  block[3] = &unk_265360FF8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__HMEnrollmentService_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  accessoryManager = self->_accessoryManager;
  if (accessoryManager)
  {
    [(HMAccessoryManager *)accessoryManager invalidate];
    [(HMAccessoryManager *)self->_accessoryManager setSettingsUpdateHandler:0];
    uint64_t v4 = self->_accessoryManager;
    self->_accessoryManager = 0;
  }
}

- (NSArray)validAudiograms
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_validAudiograms;
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSArray)invalidAudiograms
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_invalidAudiograms;
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (float)getAmplification
{
  v2 = self;
  objc_sync_enter(v2);
  float amplification = v2->_amplification;
  objc_sync_exit(v2);

  return amplification;
}

- (void)setAmplification:(float)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  v4->_float amplification = a3;
  dispatchQueue = v4->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__HMEnrollmentService_setAmplification___block_invoke;
  block[3] = &unk_265360FF8;
  block[4] = v4;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v4);
}

uint64_t __40__HMEnrollmentService_setAmplification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessorySendHearingModeSettings];
}

- (float)getBalance
{
  v2 = self;
  objc_sync_enter(v2);
  float balance = v2->_balance;
  objc_sync_exit(v2);

  return balance;
}

- (void)setBalance:(float)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  v4->_float balance = a3;
  dispatchQueue = v4->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HMEnrollmentService_setBalance___block_invoke;
  block[3] = &unk_265360FF8;
  block[4] = v4;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v4);
}

uint64_t __34__HMEnrollmentService_setBalance___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessorySendHearingModeSettings];
}

- (float)getBeamFormer
{
  v2 = self;
  objc_sync_enter(v2);
  float beamFormer = v2->_beamFormer;
  objc_sync_exit(v2);

  return beamFormer;
}

- (void)setBeamFormer:(float)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  v4->_float beamFormer = a3;
  dispatchQueue = v4->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HMEnrollmentService_setBeamFormer___block_invoke;
  block[3] = &unk_265360FF8;
  block[4] = v4;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v4);
}

uint64_t __37__HMEnrollmentService_setBeamFormer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessorySendHearingModeSettings];
}

- (float)getNoiseSuppression
{
  v2 = self;
  objc_sync_enter(v2);
  float noiseSuppression = v2->_noiseSuppression;
  objc_sync_exit(v2);

  return noiseSuppression;
}

- (void)setNoiseSuppression:(float)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  v4->_float noiseSuppression = a3;
  dispatchQueue = v4->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HMEnrollmentService_setNoiseSuppression___block_invoke;
  block[3] = &unk_265360FF8;
  block[4] = v4;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v4);
}

uint64_t __43__HMEnrollmentService_setNoiseSuppression___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessorySendHearingModeSettings];
}

- (void)setSelectedAudiogram:(id)a3
{
  uint64_t v4 = (HKAudiogramSample *)a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  selectedAudiogram = v5->_selectedAudiogram;
  v5->_selectedAudiogram = v4;
  v7 = v4;

  v5->_float amplification = 0.5;
  *(void *)&v5->_tone = 0x3F0000003F000000;
  dispatchQueue = v5->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__HMEnrollmentService_setSelectedAudiogram___block_invoke;
  block[3] = &unk_265360FF8;
  block[4] = v5;
  dispatch_async(dispatchQueue, block);

  objc_sync_exit(v5);
}

uint64_t __44__HMEnrollmentService_setSelectedAudiogram___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessorySendHearingModeSettings];
}

- (float)getTone
{
  v2 = self;
  objc_sync_enter(v2);
  float tone = v2->_tone;
  objc_sync_exit(v2);

  return tone;
}

- (void)setTone:(float)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  v4->_float tone = a3;
  dispatchQueue = v4->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__HMEnrollmentService_setTone___block_invoke;
  block[3] = &unk_265360FF8;
  block[4] = v4;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v4);
}

uint64_t __31__HMEnrollmentService_setTone___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessorySendHearingModeSettings];
}

- (void)triggerOnDemandFaultCheckWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__HMEnrollmentService_triggerOnDemandFaultCheckWithCompletionHandler___block_invoke;
  v7[3] = &unk_265361020;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __70__HMEnrollmentService_triggerOnDemandFaultCheckWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _triggerOnDemandFaultCheckWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_triggerOnDemandFaultCheckWithCompletionHandler:(id)a3
{
}

- (void)resetTunings
{
  v2 = self;
  objc_sync_enter(v2);
  *(_OWORD *)&v2->_float tone = xmmword_2511F8110;
  v2->_float noiseSuppression = 0.0;
  dispatchQueue = v2->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HMEnrollmentService_resetTunings__block_invoke;
  block[3] = &unk_265360FF8;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v2);
}

uint64_t __35__HMEnrollmentService_resetTunings__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessorySendHearingModeSettings];
}

- (void)_accessorySendHearingModeSettings
{
  float v39 = 0.0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  memset(v34, 0, sizeof(v34));
  uint64_t v3 = self->_currentConfig;
  id v4 = v3;
  if (v3)
  {
    [(NSData *)v3 getBytes:v34 length:100];
  }
  else if (gLogCategory_HMEnrollmentService <= 30 {
         && (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  LODWORD(v34[0]) = 6554113;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = v5->_selectedAudiogram;
  objc_sync_exit(v5);

  if (v6) {
    [(HMEnrollmentService *)v5 _getHearingModeSettings:v34 fromAudiogram:v6];
  }
  if (gLogCategory_HMEnrollmentService <= 30)
  {
    float v7 = *((float *)v34 + 1);
    float v8 = *((float *)&v36 + 1);
    if (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize())
    {
      double v26 = v7;
      LogPrintF();
    }
    if (gLogCategory_HMEnrollmentService <= 30
      && (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize()))
    {
      double v26 = v8;
      LogPrintF();
    }
  }
  [(HMEnrollmentService *)v5 getTone];
  float v10 = v9;
  [(HMEnrollmentService *)v5 getBalance];
  float v12 = v11;
  [(HMEnrollmentService *)v5 getAmplification];
  float v14 = v13;
  if (gLogCategory_HMEnrollmentService <= 30
    && (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize()))
  {
    double v28 = v12;
    double v29 = v14;
    double v27 = v10;
    LogPrintF();
  }
  float v15 = v10 * 2.0 + -1.0;
  float v16 = v14 * 2.0 + -1.0;
  float v17 = v12 * 2.0 + -1.0;
  if (gLogCategory_HMEnrollmentService <= 30
    && (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize()))
  {
    double v28 = v17;
    double v29 = v16;
    double v27 = v15;
    LogPrintF();
  }
  float v18 = fmax(fmin((float)(v16 - (float)(v17 * 0.5)), 1.5), -1.5);
  float v19 = fmax(fmin((float)((float)(v17 * 0.5) + v16), 1.5), -1.5);
  float v20 = fmaxf(fminf(v15, 1.0), -1.0);
  *(void *)((char *)&v35 + 4) = __PAIR64__(LODWORD(v20), LODWORD(v18));
  *(void *)((char *)&v38 + 4) = __PAIR64__(LODWORD(v20), LODWORD(v19));
  float beamFormer = v5->_beamFormer;
  *((float *)&v38 + 3) = beamFormer;
  float noiseSuppression = v5->_noiseSuppression;
  *((float *)&v35 + 3) = beamFormer;
  *(float *)&long long v36 = noiseSuppression;
  float v39 = noiseSuppression;
  if (gLogCategory_HMEnrollmentService <= 30)
  {
    if (gLogCategory_HMEnrollmentService == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_29;
      }
      float v19 = *((float *)&v38 + 1);
      float v20 = *((float *)&v35 + 2);
      float v18 = *((float *)&v35 + 1);
      float beamFormer = *((float *)&v35 + 3);
      float noiseSuppression = *(float *)&v36;
    }
    double v32 = beamFormer;
    double v33 = noiseSuppression;
    double v30 = v16;
    double v31 = v17;
    double v28 = v19;
    double v29 = v20;
    double v27 = v18;
    LogPrintF();
  }
LABEL_29:
  v23 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", v34, 100, *(void *)&v27, *(void *)&v28, *(void *)&v29, *(void *)&v30, *(void *)&v31, *(void *)&v32, *(void *)&v33);
  v24 = (NSData *)[v23 copy];
  currentConfig = self->_currentConfig;
  self->_currentConfig = v24;

  [(HMAccessoryManager *)v5->_accessoryManager writeHearingModeSetting:self->_currentConfig];
}

- (void)_accessoryReceivedHearingModeSettings:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    if (gLogCategory_HMEnrollmentService > 90
      || gLogCategory_HMEnrollmentService == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_30;
    }
LABEL_11:
    LogPrintF();
    goto LABEL_30;
  }
  int v35 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  memset(v30, 0, sizeof(v30));
  [v4 getBytes:v30 length:100];
  if (BYTE1(v30[0]) != 2)
  {
    if (gLogCategory_HMEnrollmentService > 90
      || gLogCategory_HMEnrollmentService == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_30;
    }
    goto LABEL_11;
  }
  *(void *)&double v6 = LOBYTE(v30[0]);
  float v7 = *((float *)&v31 + 3);
  float v8 = *(float *)&v32;
  float v9 = fmax(fmin(*((float *)&v31 + 1), 1.5), -1.5);
  float v10 = fmax(fmin(*((float *)&v34 + 1), 1.5), -1.5);
  float v11 = fmaxf(fminf(*((float *)&v34 + 2), 1.0), -1.0);
  float v12 = v10 - v9;
  float v13 = v10 + (float)((float)(v10 - v9) * -0.5);
  if (gLogCategory_HMEnrollmentService <= 30
    && (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize()))
  {
    double v28 = v7;
    double noiseSuppression = v8;
    double v26 = v13;
    double v27 = v12;
    double v24 = v10;
    double v25 = v11;
    double v23 = v9;
    double v22 = v6;
    LogPrintF();
  }
  float v14 = (float)(v13 + 1.0) * 0.5;
  float v15 = (float)(v12 + 1.0) * 0.5;
  float v16 = (float)(v11 + 1.0) * 0.5;
  float v17 = self;
  objc_sync_enter(v17);
  v17->_float tone = v16;
  v17->_float balance = v15;
  v17->_float amplification = v14;
  v17->_float beamFormer = v7;
  v17->_double noiseSuppression = v8;
  objc_sync_exit(v17);

  if (gLogCategory_HMEnrollmentService <= 30)
  {
    float v18 = *((float *)v30 + 1);
    float v19 = *((float *)&v32 + 1);
    if (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize())
    {
      double v22 = v18;
      LogPrintF();
    }
    if (gLogCategory_HMEnrollmentService <= 30)
    {
      if (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize())
      {
        double v22 = v19;
        LogPrintF();
      }
      if (gLogCategory_HMEnrollmentService <= 30
        && (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize()))
      {
        double v28 = v7;
        double noiseSuppression = v17->_noiseSuppression;
        double v26 = v14;
        double v27 = v15;
        double v24 = v10;
        double v25 = v16;
        double v23 = v9;
        double v22 = v6;
        LogPrintF();
      }
    }
  }
  uint64_t v20 = objc_msgSend(v5, "mutableCopy", *(void *)&v22, *(void *)&v23, *(void *)&v24, *(void *)&v25, *(void *)&v26, *(void *)&v27, *(void *)&v28, *(void *)&noiseSuppression);
  currentConfig = v17->_currentConfig;
  v17->_currentConfig = (NSData *)v20;

LABEL_30:
}

- (void)_getHearingModeSettings:(id *)a3 fromAudiogram:(id)a4
{
  v70 = +[HMAudiogramUtility frequencyToHearingDecibelLevelMapFromAudiogram:a4];
  if (v70)
  {
    uint64_t v5 = +[HMAudiogramUtility frequencyBins];
    double v6 = [v5 objectAtIndexedSubscript:0];
    float v7 = [v70 objectForKey:v6];
    float v8 = [v7 objectForKey:@"left"];
    [v8 floatValue];
    a3->var3.var0 = v9;

    float v10 = [v5 objectAtIndexedSubscript:0];
    float v11 = [v70 objectForKey:v10];
    float v12 = [v11 objectForKey:@"right"];
    [v12 floatValue];
    a3->var4.var0 = v13;

    float v14 = [v5 objectAtIndexedSubscript:1];
    float v15 = [v70 objectForKey:v14];
    float v16 = [v15 objectForKey:@"left"];
    [v16 floatValue];
    a3->var3.var1 = v17;

    float v18 = [v5 objectAtIndexedSubscript:1];
    float v19 = [v70 objectForKey:v18];
    uint64_t v20 = [v19 objectForKey:@"right"];
    [v20 floatValue];
    a3->var4.var1 = v21;

    double v22 = [v5 objectAtIndexedSubscript:2];
    double v23 = [v70 objectForKey:v22];
    double v24 = [v23 objectForKey:@"left"];
    [v24 floatValue];
    a3->var3.var2 = v25;

    double v26 = [v5 objectAtIndexedSubscript:2];
    double v27 = [v70 objectForKey:v26];
    double v28 = [v27 objectForKey:@"right"];
    [v28 floatValue];
    a3->var4.var2 = v29;

    double v30 = [v5 objectAtIndexedSubscript:3];
    long long v31 = [v70 objectForKey:v30];
    long long v32 = [v31 objectForKey:@"left"];
    [v32 floatValue];
    a3->var3.var3 = v33;

    long long v34 = [v5 objectAtIndexedSubscript:3];
    int v35 = [v70 objectForKey:v34];
    long long v36 = [v35 objectForKey:@"right"];
    [v36 floatValue];
    a3->var4.var3 = v37;

    long long v38 = [v5 objectAtIndexedSubscript:5];
    float v39 = [v70 objectForKey:v38];
    v40 = [v39 objectForKey:@"left"];
    [v40 floatValue];
    a3->var3.var5 = v41;

    v42 = [v5 objectAtIndexedSubscript:5];
    v43 = [v70 objectForKey:v42];
    v44 = [v43 objectForKey:@"right"];
    [v44 floatValue];
    a3->var4.var5 = v45;

    v46 = [v5 objectAtIndexedSubscript:7];
    v47 = [v70 objectForKey:v46];
    v48 = [v47 objectForKey:@"left"];
    [v48 floatValue];
    a3->var3.var7 = v49;

    v50 = [v5 objectAtIndexedSubscript:7];
    v51 = [v70 objectForKey:v50];
    v52 = [v51 objectForKey:@"right"];
    [v52 floatValue];
    a3->var4.var7 = v53;

    v54 = [v5 objectAtIndexedSubscript:4];
    v55 = [v70 objectForKey:v54];

    if (v55)
    {
      v56 = [v55 objectForKey:@"left"];
      [v56 floatValue];
      a3->var3.float var4 = v57;

      v58 = [v55 objectForKey:@"right"];
      [v58 floatValue];
      a3->var4.float var4 = v59;
    }
    else
    {
      float var4 = (float)(a3->var3.var3 + a3->var3.var5) * 0.5;
      a3->var3.float var4 = var4;
      float v61 = (float)(a3->var4.var3 + a3->var4.var5) * 0.5;
      a3->var4.float var4 = v61;
      if (gLogCategory_HMEnrollmentService <= 30)
      {
        if (gLogCategory_HMEnrollmentService == -1)
        {
          if (!_LogCategory_Initialize()) {
            goto LABEL_8;
          }
          float var4 = a3->var3.var4;
          float v61 = a3->var4.var4;
        }
        double v68 = var4;
        double v69 = v61;
        LogPrintF();
      }
    }
LABEL_8:
    v62 = objc_msgSend(v5, "objectAtIndexedSubscript:", 6, *(void *)&v68, *(void *)&v69);
    v63 = [v70 objectForKey:v62];

    if (v63)
    {
      v64 = [v63 objectForKey:@"left"];
      [v64 floatValue];
      a3->var3.var6 = v65;

      v66 = [v63 objectForKey:@"right"];
      [v66 floatValue];
      a3->var4.var6 = v67;
    }
    else
    {
      a3->var3.var6 = (float)(a3->var3.var5 + a3->var3.var7) * 0.5;
      a3->var4.var6 = (float)(a3->var4.var5 + a3->var4.var7) * 0.5;
      if (gLogCategory_HMEnrollmentService <= 30
        && (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }

    goto LABEL_15;
  }
  if (gLogCategory_HMEnrollmentService <= 30
    && (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_15:
  MEMORY[0x270F9A758]();
}

- (void)_startAudiogramQuery
{
  uint64_t v3 = [MEMORY[0x263F0A598] audiogramSampleType];
  id v4 = objc_alloc_init(MEMORY[0x263F0A410]);
  id v5 = objc_alloc(MEMORY[0x263F0A6E0]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__HMEnrollmentService__startAudiogramQuery__block_invoke;
  v7[3] = &unk_2653613D8;
  v7[4] = self;
  double v6 = (void *)[v5 initWithSampleType:v3 predicate:0 limit:0 sortDescriptors:0 resultsHandler:v7];
  if (gLogCategory_HMEnrollmentService <= 30
    && (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [v4 executeQuery:v6];
}

void __43__HMEnrollmentService__startAudiogramQuery__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  float v11 = *(NSObject **)(v10 + 24);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __43__HMEnrollmentService__startAudiogramQuery__block_invoke_2;
  v15[3] = &unk_2653613B0;
  v15[4] = v10;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v11, v15);
}

uint64_t __43__HMEnrollmentService__startAudiogramQuery__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _audiogramsQueryHandler:*(void *)(a1 + 40) results:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)_audiogramsQueryHandler:(id)a3 results:(id)a4 error:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (gLogCategory_HMEnrollmentService <= 30
      && (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id audiogramsAvailableHandler = self->_audiogramsAvailableHandler;
    if (audiogramsAvailableHandler) {
      (*((void (**)(id, void, void, id))audiogramsAvailableHandler + 2))(audiogramsAvailableHandler, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], v10);
    }
  }
  else
  {
    p_validAudiograms = (id *)&self->_validAudiograms;
    if (!self->_validAudiograms)
    {
      id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v13 = *p_validAudiograms;
      id *p_validAudiograms = v12;
    }
    p_invalidAudiograms = (id *)&self->_invalidAudiograms;
    if (!self->_invalidAudiograms)
    {
      id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v16 = *p_invalidAudiograms;
      id *p_invalidAudiograms = v15;
    }
    id v17 = self;
    objc_sync_enter(v17);
    objc_storeStrong((id *)&v17->_audiograms, a4);
    id v29 = v9;
    id v18 = v8;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    float v19 = v17->_audiograms;
    uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          if ([(HMEnrollmentService *)v17 _isAudiogramValid:v23]) {
            double v24 = p_validAudiograms;
          }
          else {
            double v24 = p_invalidAudiograms;
          }
          [*v24 addObject:v23];
        }
        uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v20);
    }

    id v8 = v18;
    id v9 = v29;
    objc_sync_exit(v17);

    if (gLogCategory_HMEnrollmentService <= 30
      && (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize()))
    {
      [*p_validAudiograms count];
      [*p_invalidAudiograms count];
      LogPrintF();
    }
    double v26 = (void (**)(id, void *, void *, void))v17->_audiogramsAvailableHandler;
    if (v26)
    {
      double v27 = (void *)[*p_validAudiograms copy];
      double v28 = (void *)[*p_invalidAudiograms copy];
      v26[2](v26, v27, v28, 0);
    }
  }
}

- (BOOL)_isAudiogramValid:(id)a3
{
  id v3 = a3;
  id v4 = +[HMAudiogramUtility frequencyToHearingDecibelLevelMapFromAudiogram:v3];
  if (v4)
  {
    uint64_t v38 = 0;
    float v39 = &v38;
    uint64_t v40 = 0x2020000000;
    char v41 = 0;
    id v5 = +[HMAudiogramUtility requiredFrequencyBins];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    _OWORD v34[2] = __41__HMEnrollmentService__isAudiogramValid___block_invoke;
    v34[3] = &unk_265361400;
    id v6 = v4;
    id v35 = v6;
    id v7 = v3;
    id v36 = v7;
    float v37 = &v38;
    [v5 enumerateObjectsUsingBlock:v34];

    if (*((unsigned char *)v39 + 24))
    {
      BOOL v8 = 0;
LABEL_19:

      _Block_object_dispose(&v38, 8);
      goto LABEL_20;
    }
    id v9 = [v6 objectForKey:&unk_270211200];
    id v10 = [v6 objectForKey:&unk_270211218];
    float v11 = [v6 objectForKey:&unk_270211230];
    id v12 = [v9 objectForKey:@"left"];
    [v12 floatValue];
    id v13 = [v10 objectForKey:@"left"];
    [v13 floatValue];

    id v14 = [v9 objectForKey:@"right"];
    [v14 floatValue];
    float v16 = v15;
    id v17 = [v10 objectForKey:@"right"];
    [v17 floatValue];
    float v19 = vabds_f32(v16, v18);

    if (v19 <= 20.0)
    {
      float v25 = [v10 objectForKey:@"left"];
      [v25 floatValue];
      double v26 = [v11 objectForKey:@"left"];
      [v26 floatValue];

      double v27 = [v10 objectForKey:@"right"];
      [v27 floatValue];
      float v29 = v28;
      long long v30 = [v11 objectForKey:@"right"];
      [v30 floatValue];
      float v32 = vabds_f32(v29, v31);

      if (v32 <= 20.0)
      {
        BOOL v8 = 1;
LABEL_18:

        goto LABEL_19;
      }
      if (gLogCategory_HMEnrollmentService > 30
        || gLogCategory_HMEnrollmentService == -1 && !_LogCategory_Initialize())
      {
LABEL_17:
        BOOL v8 = 0;
        goto LABEL_18;
      }
      uint64_t v20 = [v7 sourceRevision];
      uint64_t v21 = [v20 source];
      double v22 = [v21 name];
      uint64_t v23 = [v10 description];
      double v24 = [v11 description];
      LogPrintF();
    }
    else
    {
      if (gLogCategory_HMEnrollmentService > 30
        || gLogCategory_HMEnrollmentService == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_17;
      }
      uint64_t v20 = [v7 sourceRevision];
      uint64_t v21 = [v20 source];
      double v22 = [v21 name];
      uint64_t v23 = [v9 description];
      double v24 = [v10 description];
      LogPrintF();
    }

    goto LABEL_17;
  }
  if (gLogCategory_HMEnrollmentService <= 30
    && (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BOOL v8 = 0;
LABEL_20:

  return v8;
}

void __41__HMEnrollmentService__isAudiogramValid___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];

  id v7 = v11;
  if (!v6)
  {
    if (gLogCategory_HMEnrollmentService <= 30
      && (gLogCategory_HMEnrollmentService != -1 || _LogCategory_Initialize()))
    {
      BOOL v8 = [*(id *)(a1 + 40) sourceRevision];
      id v9 = [v8 source];
      id v10 = [v9 name];
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
    id v7 = v11;
  }
}

- (HKAudiogramSample)selectedAudiogram
{
  return self->_selectedAudiogram;
}

- (float)tone
{
  return self->_tone;
}

- (float)balance
{
  return self->_balance;
}

- (float)amplification
{
  return self->_amplification;
}

- (float)beamFormer
{
  return self->_beamFormer;
}

- (float)noiseSuppression
{
  return self->_noiseSuppression;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)audiogramsFoundHandler
{
  return self->_audiogramsFoundHandler;
}

- (void)setAudiogramsFoundHandler:(id)a3
{
}

- (id)audiogramsAvailableHandler
{
  return self->_audiogramsAvailableHandler;
}

- (void)setAudiogramsAvailableHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_audiogramsAvailableHandler, 0);
  objc_storeStrong(&self->_audiogramsFoundHandler, 0);
  objc_storeStrong((id *)&self->_selectedAudiogram, 0);
  objc_storeStrong((id *)&self->_validAudiograms, 0);
  objc_storeStrong((id *)&self->_invalidAudiograms, 0);
  objc_storeStrong((id *)&self->_currentConfig, 0);
  objc_storeStrong((id *)&self->_bluetoothDeviceAddress, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_audiograms, 0);
  objc_storeStrong((id *)&self->_accessoryManager, 0);
}

@end