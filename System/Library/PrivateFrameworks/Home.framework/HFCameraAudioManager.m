@interface HFCameraAudioManager
- (BOOL)isIncomingAudioEnabled;
- (BOOL)isOutgoingAudioEnabled;
- (HFCameraAudioManager)initWithCameraProfile:(id)a3 cameraStream:(id)a4 valueManager:(id)a5;
- (HFCharacteristicValueManager)valueManager;
- (HMCameraProfile)cameraProfile;
- (HMCameraStream)cameraStream;
- (float)incomingAudioVolume;
- (id)_enableAudioIfNecessaryForAudioControl:(id)a3 minVolume:(float)a4;
- (id)_readValuesForCharacteristics:(id)a3;
- (id)_writeValuesForCharacteristics:(id)a3;
- (id)enableRemoteMicrophoneIfNecessary;
- (id)enableRemoteSpeakerIfNecessary;
- (id)setIncomingAudioEnabled:(BOOL)a3;
- (id)setIncomingAudioVolume:(float)a3;
- (id)setOutgoingAudioEnabled:(BOOL)a3;
- (id)updateAudioStreamSetting:(unint64_t)a3;
- (unint64_t)audioStreamSetting;
- (void)setCameraProfile:(id)a3;
- (void)setCameraStream:(id)a3;
- (void)setValueManager:(id)a3;
@end

@implementation HFCameraAudioManager

- (HFCameraAudioManager)initWithCameraProfile:(id)a3 cameraStream:(id)a4 valueManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HFCameraAudioManager;
  v11 = [(HFCameraAudioManager *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(HFCameraAudioManager *)v11 setCameraProfile:v8];
    [(HFCameraAudioManager *)v12 setCameraStream:v9];
    [(HFCameraAudioManager *)v12 setValueManager:v10];
  }

  return v12;
}

- (unint64_t)audioStreamSetting
{
  v2 = [(HFCameraAudioManager *)self cameraStream];
  unint64_t v3 = [v2 audioStreamSetting];

  return v3;
}

- (BOOL)isOutgoingAudioEnabled
{
  return [(HFCameraAudioManager *)self audioStreamSetting] == 3;
}

- (BOOL)isIncomingAudioEnabled
{
  return [(HFCameraAudioManager *)self audioStreamSetting] != 1;
}

- (float)incomingAudioVolume
{
  v2 = [(HFCameraAudioManager *)self cameraStream];
  unint64_t v3 = [v2 audioVolume];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (id)setOutgoingAudioEnabled:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = 3;
  }
  else
  {
    float v5 = [(HFCameraAudioManager *)self cameraStream];
    uint64_t v6 = [v5 audioStreamSetting];

    if (v6 == 3) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
  }
  return [(HFCameraAudioManager *)self updateAudioStreamSetting:v4];
}

- (id)setIncomingAudioEnabled:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = [(HFCameraAudioManager *)self cameraStream];
    uint64_t v5 = [v4 audioStreamSetting];

    if (v5 == 3) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 2;
    }
  }
  else
  {
    uint64_t v6 = 1;
  }
  return [(HFCameraAudioManager *)self updateAudioStreamSetting:v6];
}

- (id)setIncomingAudioVolume:(float)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = HFLogForCategory(0x1CuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v12 = a3;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Setting incoming audio volume to %.1f", buf, 0xCu);
  }

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__HFCameraAudioManager_setIncomingAudioVolume___block_invoke;
  v9[3] = &unk_26408E758;
  v9[4] = self;
  float v10 = a3;
  uint64_t v6 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v9];
  id v7 = (id)[v6 addFailureBlock:&__block_literal_global_19];
  return v6;
}

void __47__HFCameraAudioManager_setIncomingAudioVolume___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 cameraStream];
  LODWORD(v5) = *(_DWORD *)(a1 + 40);
  uint64_t v6 = [NSNumber numberWithFloat:v5];
  [v7 updateAudioVolume:v6 completionHandler:v4];
}

void __47__HFCameraAudioManager_setIncomingAudioVolume___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  unint64_t v3 = HFLogForCategory(0x1CuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "Error setting incoming audio volume:%@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)updateAudioStreamSetting:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = [(HFCameraAudioManager *)self cameraProfile];
  uint64_t v6 = [v5 streamControl];
  uint64_t v7 = [v6 streamState];

  id v8 = HFLogForCategory(0x1CuLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if ((unint64_t)(v7 - 3) > 1)
  {
    if (v9)
    {
      if (a3 - 1 >= 3)
      {
        NSLog(&cfstr_UnknownHmcamer.isa, a3);
        v11 = 0;
      }
      else
      {
        v11 = off_26408E880[a3 - 1];
      }
      v15 = [(HFCameraAudioManager *)self cameraProfile];
      v16 = objc_msgSend(v15, "hf_prettyDescription");
      *(_DWORD *)buf = 138412546;
      v25 = v11;
      __int16 v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Updating audio stream setting to %@ for %@", buf, 0x16u);
    }
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke;
    v23[3] = &unk_26408E7A0;
    v23[4] = self;
    v23[5] = a3;
    v17 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v23];
    id v18 = (id)[v17 addFailureBlock:&__block_literal_global_4_0];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke_5;
    v22[3] = &unk_26408E7F0;
    v22[4] = self;
    id v19 = (id)[v17 addCompletionBlock:v22];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke_3;
    v21[3] = &unk_26408E838;
    v21[4] = self;
    v21[5] = a3;
    objc_super v14 = [v17 flatMap:v21];
  }
  else
  {
    if (v9)
    {
      if (a3 - 1 >= 3)
      {
        NSLog(&cfstr_UnknownHmcamer.isa, a3);
        float v10 = 0;
      }
      else
      {
        float v10 = off_26408E880[a3 - 1];
      }
      double v12 = [(HFCameraAudioManager *)self cameraProfile];
      uint64_t v13 = objc_msgSend(v12, "hf_prettyDescription");
      *(_DWORD *)buf = 138412546;
      v25 = v10;
      __int16 v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring request to update audio stream setting to %@ for %@, as the stream is stopping or has already stopped.", buf, 0x16u);
    }
    objc_super v14 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v14;
}

void __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 cameraStream];
  [v5 updateAudioStreamSetting:*(void *)(a1 + 40) completionHandler:v4];
}

void __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  unint64_t v3 = HFLogForCategory(0x1CuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Error updating audio stream setting:%@", (uint8_t *)&v4, 0xCu);
  }
}

void __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke_2_7;
  v7[3] = &unk_26408E7C8;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  id v6 = v4;
  [v5 dispatchCameraObserverMessage:v7 sender:0];
}

void __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke_2_7(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    unint64_t v3 = [*(id *)(a1 + 32) cameraStream];
    [v4 cameraStream:v3 didUpdateAudioStreamSettingWithError:*(void *)(a1 + 40)];
  }
}

id __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke_3(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3 == 3)
  {
    id v4 = [*(id *)(a1 + 32) enableRemoteSpeakerIfNecessary];
    [v2 addObject:v4];

    uint64_t v3 = *(void *)(a1 + 40);
  }
  if (v3 != 1)
  {
    id v5 = [*(id *)(a1 + 32) enableRemoteMicrophoneIfNecessary];
    [v2 addObject:v5];
  }
  id v6 = [MEMORY[0x263F58190] combineAllFutures:v2];
  uint64_t v7 = [v6 flatMap:&__block_literal_global_15];

  return v7;
}

uint64_t __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke_4()
{
  return [MEMORY[0x263F58190] futureWithNoResult];
}

- (id)enableRemoteSpeakerIfNecessary
{
  uint64_t v3 = [(HFCameraAudioManager *)self cameraProfile];
  id v4 = [v3 speakerControl];
  LODWORD(v5) = 0.5;
  id v6 = [(HFCameraAudioManager *)self _enableAudioIfNecessaryForAudioControl:v4 minVolume:v5];

  return v6;
}

- (id)enableRemoteMicrophoneIfNecessary
{
  uint64_t v3 = [(HFCameraAudioManager *)self cameraProfile];
  id v4 = [v3 microphoneControl];
  LODWORD(v5) = 0.5;
  id v6 = [(HFCameraAudioManager *)self _enableAudioIfNecessaryForAudioControl:v4 minVolume:v5];

  return v6;
}

- (id)_enableAudioIfNecessaryForAudioControl:(id)a3 minVolume:(float)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263EFF9C0] set];
  id v8 = [v6 mute];
  objc_msgSend(v7, "na_safeAddObject:", v8);

  BOOL v9 = [v6 volume];
  objc_msgSend(v7, "na_safeAddObject:", v9);

  if ([v7 count])
  {
    float v10 = [(HFCameraAudioManager *)self _readValuesForCharacteristics:v7];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __73__HFCameraAudioManager__enableAudioIfNecessaryForAudioControl_minVolume___block_invoke;
    v13[3] = &unk_26408E860;
    float v16 = a4;
    id v14 = v6;
    v15 = self;
    v11 = [v10 flatMap:v13];
  }
  else
  {
    v11 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v11;
}

id __73__HFCameraAudioManager__enableAudioIfNecessaryForAudioControl_minVolume___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 mute];
  id v6 = [v5 characteristicType];
  uint64_t v7 = [v4 responseForCharacteristicType:v6];
  id v8 = [v7 valueWithExpectedClass:objc_opt_class()];

  BOOL v9 = [*(id *)(a1 + 32) volume];
  float v10 = [v9 characteristicType];
  v11 = [v4 responseForCharacteristicType:v10];

  double v12 = [v11 valueWithExpectedClass:objc_opt_class()];

  if (v8)
  {
    int v13 = [v8 BOOLValue];
    if (v12)
    {
LABEL_3:
      id v14 = [*(id *)(a1 + 32) volume];
      v15 = [v14 metadata];
      float v16 = objc_msgSend(v15, "hf_percentageForCharacteristicValue:", v12);

      [v16 floatValue];
      BOOL v18 = v17 < *(float *)(a1 + 48);

      goto LABEL_6;
    }
  }
  else
  {
    int v13 = 0;
    if (v12) {
      goto LABEL_3;
    }
  }
  BOOL v18 = 0;
LABEL_6:
  if ((v13 | v18))
  {
    id v19 = objc_alloc_init(HFCharacteristicValueSet);
    if (v13)
    {
      v20 = [*(id *)(a1 + 32) mute];
      [(HFCharacteristicValueSet *)v19 setValue:MEMORY[0x263EFFA80] forCharacteristic:v20];
    }
    if (v18)
    {
      v21 = [*(id *)(a1 + 32) volume];
      v22 = [v21 metadata];
      v23 = objc_msgSend(v22, "hf_characteristicValueForPercentage:", *(float *)(a1 + 48));

      if (v23)
      {
        v24 = [*(id *)(a1 + 32) volume];
        [(HFCharacteristicValueSet *)v19 setValue:v23 forCharacteristic:v24];
      }
    }
    v25 = [*(id *)(a1 + 40) _writeValuesForCharacteristics:v19];
  }
  else
  {
    v25 = [MEMORY[0x263F58190] futureWithNoResult];
  }

  return v25;
}

- (id)_readValuesForCharacteristics:(id)a3
{
  id v4 = a3;
  double v5 = [(HFCameraAudioManager *)self valueManager];
  id v6 = objc_opt_new();
  [v5 beginTransactionWithReason:@"HFCameraAudioManagerReadReason" readPolicy:v6 logger:0];

  uint64_t v7 = [(HFCameraAudioManager *)self valueManager];
  id v8 = [v7 readValuesForCharacteristics:v4];

  BOOL v9 = [(HFCameraAudioManager *)self valueManager];
  [v9 commitTransactionWithReason:@"HFCameraAudioManagerReadReason"];

  return v8;
}

- (id)_writeValuesForCharacteristics:(id)a3
{
  id v4 = a3;
  double v5 = [(HFCameraAudioManager *)self valueManager];
  id v6 = objc_opt_new();
  [v5 beginTransactionWithReason:@"HFCameraAudioManagerWriteReason" readPolicy:v6 logger:0];

  uint64_t v7 = [(HFCameraAudioManager *)self valueManager];
  id v8 = [v7 writeValuesForCharacteristics:v4];

  BOOL v9 = [(HFCameraAudioManager *)self valueManager];
  [v9 commitTransactionWithReason:@"HFCameraAudioManagerWriteReason"];

  return v8;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
}

- (HMCameraStream)cameraStream
{
  return self->_cameraStream;
}

- (void)setCameraStream:(id)a3
{
}

- (HFCharacteristicValueManager)valueManager
{
  return self->_valueManager;
}

- (void)setValueManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueManager, 0);
  objc_storeStrong((id *)&self->_cameraStream, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
}

@end