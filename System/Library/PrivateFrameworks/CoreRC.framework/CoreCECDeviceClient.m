@interface CoreCECDeviceClient
+ (BOOL)supportsSecureCoding;
- (BOOL)deckControlCommandWithMode:(unint64_t)a3 target:(id)a4 error:(id *)a5;
- (BOOL)deckControlPlayWithMode:(unint64_t)a3 target:(id)a4 error:(id *)a5;
- (BOOL)deckControlRefreshStatus:(id)a3 requestType:(unint64_t)a4 error:(id *)a5;
- (BOOL)deckControlSetDeckStatus:(unint64_t)a3 error:(id *)a4;
- (BOOL)makeActiveSourceWithTVMenus:(BOOL)a3 error:(id *)a4;
- (BOOL)performStandbyWithTargetDevice:(id)a3 error:(id *)a4;
- (BOOL)refreshDevices:(id *)a3;
- (BOOL)refreshProperties:(id)a3 ofDevice:(id)a4 error:(id *)a5;
- (BOOL)requestActiveSource:(id *)a3;
- (BOOL)requestAudioReturnChannelStatusChangeTo:(unint64_t)a3 error:(id *)a4;
- (BOOL)requestAudioStatus:(id *)a3;
- (BOOL)requestSystemAudioModeStatusChangeTo:(unint64_t)a3 error:(id *)a4;
- (BOOL)resignActiveSource:(id *)a3;
- (BOOL)setAudioMuteStatus:(BOOL)a3 error:(id *)a4;
- (BOOL)setAudioReturnChannelControlEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setAudioVolumeStatus:(unint64_t)a3 error:(id *)a4;
- (BOOL)setPowerStatus:(unint64_t)a3 error:(id *)a4;
- (BOOL)setSupportedAudioFormats:(const CoreCECAudioFormat *)a3 count:(unint64_t)a4 error:(id *)a5;
- (BOOL)setSystemAudioControlEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setTrackAudioStatusEnabled:(BOOL)a3 pressTimeout:(int64_t)a4 pollInterval:(int64_t)a5 error:(id *)a6;
- (BOOL)systemAudioModeRequest:(unint64_t)a3 error:(id *)a4;
- (Class)classForCoder;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation CoreCECDeviceClient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return NSClassFromString(&cfstr_Corececdevice.isa);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CoreCECDeviceClient;
  return [(CoreRCDevice *)&v4 copyWithZone:a3];
}

- (BOOL)deckControlSetDeckStatus:(unint64_t)a3 error:(id *)a4
{
  id v8 = [(CoreRCDevice *)self manager];
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 90, @"manager must not be nil: %@", self);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__CoreCECDeviceClient_deckControlSetDeckStatus_error___block_invoke;
  v10[3] = &unk_2652E4E68;
  v10[5] = self;
  v10[6] = a3;
  v10[4] = v8;
  return CoreRCWaitForAsyncOperation(a4, (uint64_t)v10);
}

uint64_t __54__CoreCECDeviceClient_deckControlSetDeckStatus_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performDeckControlSetDeckStatusAsync:*(void *)(a1 + 48) forDevice:*(void *)(a1 + 40) reply:a2];
}

- (BOOL)deckControlCommandWithMode:(unint64_t)a3 target:(id)a4 error:(id *)a5
{
  id v10 = [(CoreRCDevice *)self manager];
  if (!v10) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 106, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    CoreCECDeckControlModeString(a3);
    LogPrintF();
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__CoreCECDeviceClient_deckControlCommandWithMode_target_error___block_invoke;
  v12[3] = &unk_2652E4FD0;
  v12[4] = v10;
  v12[5] = self;
  v12[6] = a4;
  v12[7] = a3;
  return CoreRCWaitForAsyncOperation(a5, (uint64_t)v12);
}

uint64_t __63__CoreCECDeviceClient_deckControlCommandWithMode_target_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performDeckControlCommandAsync:*(void *)(a1 + 40) controlMode:*(void *)(a1 + 56) targetDevice:*(void *)(a1 + 48) reply:a2];
}

- (BOOL)deckControlPlayWithMode:(unint64_t)a3 target:(id)a4 error:(id *)a5
{
  id v10 = [(CoreRCDevice *)self manager];
  if (!v10) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 127, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    CoreCECPlayModeString(a3);
    LogPrintF();
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__CoreCECDeviceClient_deckControlPlayWithMode_target_error___block_invoke;
  v12[3] = &unk_2652E4FD0;
  v12[4] = v10;
  v12[5] = self;
  v12[6] = a4;
  v12[7] = a3;
  return CoreRCWaitForAsyncOperation(a5, (uint64_t)v12);
}

uint64_t __60__CoreCECDeviceClient_deckControlPlayWithMode_target_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performDeckControlPlayAsync:*(void *)(a1 + 40) playMode:*(void *)(a1 + 56) targetDevice:*(void *)(a1 + 48) reply:a2];
}

- (BOOL)deckControlRefreshStatus:(id)a3 requestType:(unint64_t)a4 error:(id *)a5
{
  id v10 = [(CoreRCDevice *)self manager];
  if (!v10) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 148, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__CoreCECDeviceClient_deckControlRefreshStatus_requestType_error___block_invoke;
  v12[3] = &unk_2652E4FD0;
  v12[4] = v10;
  v12[5] = self;
  v12[6] = a3;
  v12[7] = a4;
  return CoreRCWaitForAsyncOperation(a5, (uint64_t)v12);
}

uint64_t __66__CoreCECDeviceClient_deckControlRefreshStatus_requestType_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performDeckControlRefreshStatusAsync:*(void *)(a1 + 40) targetDevice:*(void *)(a1 + 48) requestType:*(void *)(a1 + 56) reply:a2];
}

- (BOOL)makeActiveSourceWithTVMenus:(BOOL)a3 error:(id *)a4
{
  id v8 = [(CoreRCDevice *)self manager];
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 168, @"manager must not be nil: %@", self);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__CoreCECDeviceClient_makeActiveSourceWithTVMenus_error___block_invoke;
  v10[3] = &unk_2652E34A8;
  v10[4] = v8;
  v10[5] = self;
  BOOL v11 = a3;
  return CoreRCWaitForAsyncOperation(a4, (uint64_t)v10);
}

uint64_t __57__CoreCECDeviceClient_makeActiveSourceWithTVMenus_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performActiveSourceAsync:*(void *)(a1 + 40) withMenus:*(unsigned __int8 *)(a1 + 48) reply:a2];
}

- (BOOL)performStandbyWithTargetDevice:(id)a3 error:(id *)a4
{
  id v8 = [(CoreRCDevice *)self manager];
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 183, @"manager must not be nil: %@", self);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__CoreCECDeviceClient_performStandbyWithTargetDevice_error___block_invoke;
  v10[3] = &unk_2652E3480;
  v10[4] = v8;
  v10[5] = self;
  void v10[6] = a3;
  return CoreRCWaitForAsyncOperation(a4, (uint64_t)v10);
}

uint64_t __60__CoreCECDeviceClient_performStandbyWithTargetDevice_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performStandbyAsync:*(void *)(a1 + 40) targetDevice:*(void *)(a1 + 48) reply:a2];
}

- (BOOL)refreshDevices:(id *)a3
{
  id v6 = [(CoreRCDevice *)self manager];
  if (!v6) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 198, @"manager must not be nil: %@", self);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__CoreCECDeviceClient_refreshDevices___block_invoke;
  v8[3] = &unk_2652E3DD8;
  v8[4] = v6;
  v8[5] = self;
  return CoreRCWaitForAsyncOperation(a3, (uint64_t)v8);
}

uint64_t __38__CoreCECDeviceClient_refreshDevices___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performRefreshDevicesAsync:*(void *)(a1 + 40) reply:a2];
}

- (BOOL)refreshProperties:(id)a3 ofDevice:(id)a4 error:(id *)a5
{
  id v10 = [(CoreRCDevice *)self manager];
  if (!v10) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 213, @"manager must not be nil: %@", self);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__CoreCECDeviceClient_refreshProperties_ofDevice_error___block_invoke;
  v12[3] = &unk_2652E3F48;
  v12[4] = v10;
  v12[5] = a3;
  v12[6] = a4;
  v12[7] = self;
  return CoreRCWaitForAsyncOperation(a5, (uint64_t)v12);
}

uint64_t __56__CoreCECDeviceClient_refreshProperties_ofDevice_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performRefreshProperties:*(void *)(a1 + 40) ofDevice:*(void *)(a1 + 48) withDeviceAsync:*(void *)(a1 + 56) reply:a2];
}

- (BOOL)requestActiveSource:(id *)a3
{
  id v6 = [(CoreRCDevice *)self manager];
  if (!v6) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 228, @"manager must not be nil: %@", self);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__CoreCECDeviceClient_requestActiveSource___block_invoke;
  v8[3] = &unk_2652E3DD8;
  v8[4] = v6;
  v8[5] = self;
  return CoreRCWaitForAsyncOperation(a3, (uint64_t)v8);
}

uint64_t __43__CoreCECDeviceClient_requestActiveSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performRequestActiveSourceAsync:*(void *)(a1 + 40) reply:a2];
}

- (BOOL)resignActiveSource:(id *)a3
{
  id v6 = [(CoreRCDevice *)self manager];
  if (!v6) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 243, @"manager must not be nil: %@", self);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__CoreCECDeviceClient_resignActiveSource___block_invoke;
  v8[3] = &unk_2652E3DD8;
  v8[4] = v6;
  v8[5] = self;
  return CoreRCWaitForAsyncOperation(a3, (uint64_t)v8);
}

uint64_t __42__CoreCECDeviceClient_resignActiveSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performInactiveSourceAsync:*(void *)(a1 + 40) reply:a2];
}

- (BOOL)setSystemAudioControlEnabled:(BOOL)a3 error:(id *)a4
{
  id v8 = [(CoreRCDevice *)self manager];
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 258, @"manager must not be nil: %@", self);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__CoreCECDeviceClient_setSystemAudioControlEnabled_error___block_invoke;
  v10[3] = &unk_2652E34A8;
  BOOL v11 = a3;
  v10[4] = v8;
  v10[5] = self;
  return CoreRCWaitForAsyncOperation(a4, (uint64_t)v10);
}

uint64_t __58__CoreCECDeviceClient_setSystemAudioControlEnabled_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performSetSystemAudioControlEnabled:*(unsigned __int8 *)(a1 + 48) withDeviceAsync:*(void *)(a1 + 40) reply:a2];
}

- (BOOL)systemAudioModeRequest:(unint64_t)a3 error:(id *)a4
{
  id v8 = [(CoreRCDevice *)self manager];
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 273, @"manager must not be nil: %@", self);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__CoreCECDeviceClient_systemAudioModeRequest_error___block_invoke;
  v10[3] = &unk_2652E4E68;
  v10[4] = v8;
  v10[5] = self;
  void v10[6] = a3;
  return CoreRCWaitForAsyncOperation(a4, (uint64_t)v10);
}

uint64_t __52__CoreCECDeviceClient_systemAudioModeRequest_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performSystemAudioModeRequestAsync:*(void *)(a1 + 40) withDesiredState:*(void *)(a1 + 48) reply:a2];
}

- (BOOL)setAudioReturnChannelControlEnabled:(BOOL)a3 error:(id *)a4
{
  id v8 = [(CoreRCDevice *)self manager];
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 288, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__CoreCECDeviceClient_setAudioReturnChannelControlEnabled_error___block_invoke;
  v10[3] = &unk_2652E34A8;
  BOOL v11 = a3;
  v10[4] = v8;
  v10[5] = self;
  return CoreRCWaitForAsyncOperation(a4, (uint64_t)v10);
}

uint64_t __65__CoreCECDeviceClient_setAudioReturnChannelControlEnabled_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performSetAudioReturnChannelControlEnabled:*(unsigned __int8 *)(a1 + 48) withDeviceAsync:*(void *)(a1 + 40) reply:a2];
}

- (BOOL)requestAudioReturnChannelStatusChangeTo:(unint64_t)a3 error:(id *)a4
{
  id v7 = [(CoreRCDevice *)self manager];
  if (v7)
  {
    id v8 = v7;
    if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      objc_opt_class();
      CoreCECActivationStatusString(a3);
      LogPrintF();
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __69__CoreCECDeviceClient_requestAudioReturnChannelStatusChangeTo_error___block_invoke;
    v11[3] = &unk_2652E4E68;
    v11[5] = self;
    v11[6] = a3;
    v11[4] = v8;
    return CoreRCWaitForAsyncOperation(a4, (uint64_t)v11);
  }
  else
  {
    if (gLogCategory_CoreRCDevice <= 90 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (a4)
    {
      id v10 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6726 userInfo:0];
      BOOL result = 0;
      *a4 = v10;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t __69__CoreCECDeviceClient_requestAudioReturnChannelStatusChangeTo_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performRequestAudioReturnChannelStatusChangeTo:*(void *)(a1 + 48) withDeviceAsync:*(void *)(a1 + 40) reply:a2];
}

- (BOOL)setAudioVolumeStatus:(unint64_t)a3 error:(id *)a4
{
  id v8 = [(CoreRCDevice *)self manager];
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 329, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__CoreCECDeviceClient_setAudioVolumeStatus_error___block_invoke;
  v10[3] = &unk_2652E4E68;
  v10[5] = self;
  void v10[6] = a3;
  v10[4] = v8;
  return CoreRCWaitForAsyncOperation(a4, (uint64_t)v10);
}

uint64_t __50__CoreCECDeviceClient_setAudioVolumeStatus_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performSetAudioVolumeStatus:*(void *)(a1 + 48) withDeviceAsync:*(void *)(a1 + 40) reply:a2];
}

- (BOOL)setAudioMuteStatus:(BOOL)a3 error:(id *)a4
{
  id v8 = [(CoreRCDevice *)self manager];
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 345, @"manager must not be nil: %@", self);
  }
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__CoreCECDeviceClient_setAudioMuteStatus_error___block_invoke;
  v10[3] = &unk_2652E34A8;
  BOOL v11 = a3;
  v10[4] = v8;
  v10[5] = self;
  return CoreRCWaitForAsyncOperation(a4, (uint64_t)v10);
}

uint64_t __48__CoreCECDeviceClient_setAudioMuteStatus_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performSetAudioMuteStatus:*(unsigned __int8 *)(a1 + 48) withDeviceAsync:*(void *)(a1 + 40) reply:a2];
}

- (BOOL)setSupportedAudioFormats:(const CoreCECAudioFormat *)a3 count:(unint64_t)a4 error:(id *)a5
{
  id v9 = [(CoreRCDevice *)self manager];
  id v10 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  id v23 = v9;
  if (v9)
  {
    if (!a4) {
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 363, @"manager must not be nil: %@", self);
    if (!a4) {
      goto LABEL_11;
    }
  }
  uint64_t v11 = 0;
  do
  {
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      uint64_t v12 = objc_opt_class();
      uint64_t v21 = a3->var0[1];
      uint64_t v22 = a3->var0[2];
      uint64_t v19 = v11;
      uint64_t v20 = a3->var0[0];
      uint64_t v17 = v12;
      v18 = self;
      LogPrintF();
    }
    uint64_t v13 = (a3->var0[0] >> 3) & 0xF;
    if (v13 == 15) {
      uint64_t v13 = (a3->var0[2] >> 3) | 0x40u;
    }
    uint64_t v14 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", a3, 3, v17, v18, v19, v20, v21, v22);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, objc_msgSend(NSNumber, "numberWithInt:", v13));
    ++v11;
    ++a3;
  }
  while (a4 != v11);
LABEL_11:
  uint64_t v15 = [NSDictionary dictionaryWithDictionary:v10];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __60__CoreCECDeviceClient_setSupportedAudioFormats_count_error___block_invoke;
  v25[3] = &unk_2652E3480;
  v25[4] = v23;
  v25[5] = v15;
  v25[6] = self;
  return CoreRCWaitForAsyncOperation(a5, (uint64_t)v25);
}

uint64_t __60__CoreCECDeviceClient_setSupportedAudioFormats_count_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performSetSupportedAudioFormats:*(void *)(a1 + 40) withDeviceAsync:*(void *)(a1 + 48) reply:a2];
}

- (BOOL)setTrackAudioStatusEnabled:(BOOL)a3 pressTimeout:(int64_t)a4 pollInterval:(int64_t)a5 error:(id *)a6
{
  id v12 = [(CoreRCDevice *)self manager];
  if (!v12) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 420, @"manager must not be nil: %@", self);
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __82__CoreCECDeviceClient_setTrackAudioStatusEnabled_pressTimeout_pollInterval_error___block_invoke;
  v14[3] = &unk_2652E4FF8;
  BOOL v15 = a3;
  v14[6] = a4;
  v14[7] = a5;
  v14[4] = v12;
  v14[5] = self;
  return CoreRCWaitForAsyncOperation(a6, (uint64_t)v14);
}

uint64_t __82__CoreCECDeviceClient_setTrackAudioStatusEnabled_pressTimeout_pollInterval_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performSetTrackAudioStatusEnabled:*(unsigned __int8 *)(a1 + 64) pressTimeout:*(void *)(a1 + 48) pollInterval:*(void *)(a1 + 56) withDeviceAsync:*(void *)(a1 + 40) reply:a2];
}

- (BOOL)requestAudioStatus:(id *)a3
{
  id v6 = [(CoreRCDevice *)self manager];
  if (!v6) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 435, @"manager must not be nil: %@", self);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__CoreCECDeviceClient_requestAudioStatus___block_invoke;
  v8[3] = &unk_2652E3DD8;
  v8[4] = v6;
  v8[5] = self;
  return CoreRCWaitForAsyncOperation(a3, (uint64_t)v8);
}

uint64_t __42__CoreCECDeviceClient_requestAudioStatus___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performRequestAudioStatusAsync:*(void *)(a1 + 40) reply:a2];
}

- (BOOL)requestSystemAudioModeStatusChangeTo:(unint64_t)a3 error:(id *)a4
{
  id v7 = [(CoreRCDevice *)self manager];
  if (v7)
  {
    id v8 = v7;
    if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      objc_opt_class();
      CoreCECActivationStatusString(a3);
      LogPrintF();
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __66__CoreCECDeviceClient_requestSystemAudioModeStatusChangeTo_error___block_invoke;
    v11[3] = &unk_2652E4E68;
    v11[5] = self;
    v11[6] = a3;
    v11[4] = v8;
    return CoreRCWaitForAsyncOperation(a4, (uint64_t)v11);
  }
  else
  {
    if (gLogCategory_CoreRCDevice <= 90 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (a4)
    {
      id v10 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6726 userInfo:0];
      BOOL result = 0;
      *a4 = v10;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t __66__CoreCECDeviceClient_requestSystemAudioModeStatusChangeTo_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performRequestSystemAudioModeStatusChangeTo:*(void *)(a1 + 48) withDeviceAsync:*(void *)(a1 + 40) reply:a2];
}

- (BOOL)setPowerStatus:(unint64_t)a3 error:(id *)a4
{
  id v8 = [(CoreRCDevice *)self manager];
  if (!v8) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceClient.m", 475, @"manager must not be nil: %@", self);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__CoreCECDeviceClient_setPowerStatus_error___block_invoke;
  v12[3] = &unk_2652E4E68;
  v12[5] = self;
  v12[6] = a3;
  v12[4] = v8;
  int v9 = CoreRCWaitForAsyncOperation(a4, (uint64_t)v12);
  if (v9)
  {
    v11.receiver = self;
    v11.super_class = (Class)CoreCECDeviceClient;
    LOBYTE(v9) = [(CoreCECDevice *)&v11 setPowerStatus:a3 error:a4];
  }
  return v9;
}

uint64_t __44__CoreCECDeviceClient_setPowerStatus_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performSetPowerStatus:*(void *)(a1 + 48) withDeviceAsync:*(void *)(a1 + 40) reply:a2];
}

@end