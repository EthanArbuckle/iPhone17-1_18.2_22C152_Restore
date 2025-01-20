@interface CoreRCXPCService
- (BOOL)checkEntitlement:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CoreRCManagerProvider)manager;
- (CoreRCXPCService)init;
- (NSSet)connections;
- (OS_dispatch_queue)queue;
- (void)_addDeviceOnBusAsync:(id)a3 withType:(unint64_t)a4 matching:(id)a5 reply:(id)a6;
- (void)_addDeviceOnBusAsync:(id)a3 withType:(unint64_t)a4 matching:(id)a5 withSessionOwningDevice:(id)a6 reply:(id)a7;
- (void)_changeButtonCombinationAsync:(id)a3 delay:(double)a4 enabled:(BOOL)a5 forDevice:(id)a6 reply:(id)a7;
- (void)_clearAllStoredCommandsFromDeviceAsync:(id)a3 reply:(id)a4;
- (void)_deleteDeviceAsync:(id)a3 fromBus:(id)a4 reply:(id)a5;
- (void)_endLearningWithDeviceAsync:(id)a3 reply:(id)a4;
- (void)_fakeCreateCECBusAsync:(unint64_t)a3 reply:(id)a4;
- (void)_fakeCreateRemoteCECDeviceAsync:(id)a3 bus:(id)a4 logicalAddress:(unsigned __int8)a5 physicalAddress:(unint64_t)a6 reply:(id)a7;
- (void)_fakeRemoveCECBusAsync:(id)a3 reply:(id)a4;
- (void)_fakeRemoveCECDeviceAsync:(id)a3 reply:(id)a4;
- (void)_fakeSetCECBusLinkStateAsync:(id)a3 linkState:(BOOL)a4 physicalAddress:(unint64_t)a5 reply:(id)a6;
- (void)_fakeSetCECDeviceLogicalAddressAsync:(id)a3 logicalAddress:(unsigned __int8)a4 reply:(id)a5;
- (void)_getExtendedPropertyAsyncForKey:(id)a3 ofDevice:(id)a4 reply:(id)a5;
- (void)_getPropertyAsyncForKey:(id)a3 ofBus:(id)a4 reply:(id)a5;
- (void)_performActiveSourceAsync:(id)a3 withMenus:(BOOL)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6;
- (void)_performDeckControlCommandAsync:(id)a3 controlMode:(unint64_t)a4 targetDevice:(id)a5 allowRemoteDevice:(BOOL)a6 reply:(id)a7;
- (void)_performDeckControlPlayAsync:(id)a3 playMode:(unint64_t)a4 targetDevice:(id)a5 allowRemoteDevice:(BOOL)a6 reply:(id)a7;
- (void)_performDeckControlRefreshStatusAsync:(id)a3 targetDevice:(id)a4 requestType:(unint64_t)a5 allowRemoteDevice:(BOOL)a6 reply:(id)a7;
- (void)_performDeckControlSetDeckStatusAsync:(unint64_t)a3 forDevice:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6;
- (void)_performInactiveSourceAsync:(id)a3 allowRemoteDevice:(BOOL)a4 reply:(id)a5;
- (void)_performRefreshDevicesAsync:(id)a3 allowRemoteDevice:(BOOL)a4 reply:(id)a5;
- (void)_performRefreshProperties:(id)a3 ofDevice:(id)a4 withDeviceAsync:(id)a5 allowRemoteDevice:(BOOL)a6 reply:(id)a7;
- (void)_performRemoveDeviceWithTypeAsync:(unint64_t)a3 bus:(id)a4 reply:(id)a5;
- (void)_performRequestActiveSourceAsync:(id)a3 allowRemoteDevice:(BOOL)a4 reply:(id)a5;
- (void)_performRequestAudioReturnChannelStatusChangeTo:(unint64_t)a3 withDeviceAsync:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6;
- (void)_performRequestAudioStatusAsync:(id)a3 reply:(id)a4;
- (void)_performRequestSystemAudioModeStatusChangeTo:(unint64_t)a3 withDeviceAsync:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6;
- (void)_performSetAudioMuteStatus:(BOOL)a3 withDeviceAsync:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6;
- (void)_performSetAudioReturnChannelControlEnabled:(BOOL)a3 withDeviceAsync:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6;
- (void)_performSetAudioVolumeStatus:(unint64_t)a3 withDeviceAsync:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6;
- (void)_performSetPowerStatus:(unint64_t)a3 withDeviceAsync:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6;
- (void)_performSetSupportedAudioFormats:(id)a3 withDeviceAsync:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6;
- (void)_performSetSystemAudioControlEnabled:(BOOL)a3 withDeviceAsync:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6;
- (void)_performSetTrackAudioStatusEnabled:(BOOL)a3 pressTimeout:(int64_t)a4 pollInterval:(int64_t)a5 withDeviceAsync:(id)a6 reply:(id)a7;
- (void)_performStandbyAsync:(id)a3 targetDevice:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6;
- (void)_performSystemAudioModeRequestAsync:(id)a3 withDesiredState:(unint64_t)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6;
- (void)_queryBusesAsync:(id)a3;
- (void)_queryLocalInstanceAsync:(id)a3 bus:(id)a4 client:(id)a5 reply:(id)a6;
- (void)_sendCommandAsync:(id)a3 fromDevice:(id)a4 reply:(id)a5;
- (void)_sendCommandAsync:(unint64_t)a3 fromDevice:(id)a4 toDevice:(id)a5 withDuration:(unint64_t)a6 reply:(id)a7;
- (void)_sendHIDEventAsync:(id)a3 fromDevice:(id)a4 toDevice:(id)a5 reply:(id)a6;
- (void)_setCommandAsync:(unint64_t)a3 target:(id)a4 source:(id)a5 forButtonCombination:(id)a6 delay:(double)a7 reply:(id)a8;
- (void)_setExtendedPropertyAsync:(id)a3 forKey:(id)a4 ofDevice:(id)a5 reply:(id)a6;
- (void)_setOSDNameAsync:(id)a3 forDevice:(id)a4 reply:(id)a5;
- (void)_setOsdNameAsync:(id)a3 forBus:(id)a4 reply:(id)a5;
- (void)_setPairStateAsync:(BOOL)a3 forAppleRemote:(id)a4 reply:(id)a5;
- (void)_setPropertyAsync:(id)a3 forKey:(id)a4 ofBus:(id)a5 reply:(id)a6;
- (void)_setTvLanguageCodeAsync:(id)a3 forBus:(id)a4 reply:(id)a5;
- (void)_startLearningCommandAsync:(unint64_t)a3 withDevice:(id)a4 reply:(id)a5;
- (void)_startLearningSessionWithDeviceAsync:(id)a3 forReason:(id)a4 reply:(id)a5;
- (void)_updateMappingWithSessionOwningDeviceAsync:(id)a3 forTargetDevice:(id)a4 reply:(id)a5;
- (void)addDeviceOnBusAsync:(id)a3 withType:(unint64_t)a4 matching:(id)a5 reply:(id)a6;
- (void)addDeviceOnBusAsync:(id)a3 withType:(unint64_t)a4 matching:(id)a5 withSessionOwningDevice:(id)a6 reply:(id)a7;
- (void)bus:(id)a3 deviceHasBeenAdded:(id)a4;
- (void)bus:(id)a3 deviceHasBeenRemoved:(id)a4;
- (void)bus:(id)a3 deviceHasBeenUpdated:(id)a4;
- (void)cecBus:(id)a3 activeSourceHasChangedTo:(id)a4 fromDevice:(id)a5;
- (void)cecDevice:(id)a3 activeSourceStatusHasChanged:(BOOL)a4;
- (void)cecDevice:(id)a3 audioStatusReceived:(unint64_t)a4 muteStatus:(BOOL)a5;
- (void)cecDevice:(id)a3 deckControlCommandHasBeenReceived:(unint64_t)a4 fromDevice:(id)a5;
- (void)cecDevice:(id)a3 deckControlPlayHasBeenReceived:(unint64_t)a4 fromDevice:(id)a5;
- (void)cecDevice:(id)a3 deckControlStatusHasBeenUpdated:(unint64_t)a4 fromDevice:(id)a5;
- (void)cecDevice:(id)a3 featureAbort:(id)a4;
- (void)cecDevice:(id)a3 receivedRequestAudioReturnChannelStatusChangeTo:(unint64_t)a4 fromDevice:(id)a5;
- (void)cecDevice:(id)a3 receivedRequestSystemAudioModeStatusChangeTo:(unint64_t)a4 fromDevice:(id)a5;
- (void)cecDevice:(id)a3 requestAudioReturnChannelStatusChangeTo:(unint64_t)a4 didFinishWithResult:(BOOL)a5 error:(id)a6;
- (void)cecDevice:(id)a3 requestSystemAudioModeStatusChangeTo:(unint64_t)a4 didFinishWithResult:(BOOL)a5 error:(id)a6;
- (void)cecDevice:(id)a3 standbyRequestHasBeenReceived:(id)a4;
- (void)cecDeviceShouldAssertActiveSource:(id)a3;
- (void)changeButtonCombinationAsync:(id)a3 delay:(double)a4 enabled:(BOOL)a5 forDevice:(id)a6 reply:(id)a7;
- (void)clearAllStoredCommandsFromDeviceAsync:(id)a3 reply:(id)a4;
- (void)connectionInvalidated:(id)a3;
- (void)dealloc;
- (void)deleteDeviceAsync:(id)a3 fromBus:(id)a4 reply:(id)a5;
- (void)device:(id)a3 receivedHIDEvent:(id)a4 fromDevice:(id)a5;
- (void)endLearningWithDeviceAsync:(id)a3 reply:(id)a4;
- (void)enumerateClient:(id)a3 usingBlock:(id)a4;
- (void)enumerateClientsHavingEntitlement:(id)a3 usingBlock:(id)a4;
- (void)enumerateClientsUsingBlock:(id)a3;
- (void)fakeCreateCECBusAsync:(unint64_t)a3 reply:(id)a4;
- (void)fakeCreateRemoteCECDeviceAsync:(id)a3 bus:(id)a4 logicalAddress:(unsigned __int8)a5 physicalAddress:(unint64_t)a6 reply:(id)a7;
- (void)fakeRemoveCECBusAsync:(id)a3 reply:(id)a4;
- (void)fakeRemoveCECDeviceAsync:(id)a3 reply:(id)a4;
- (void)fakeSetCECBusLinkStateAsync:(id)a3 linkState:(BOOL)a4 physicalAddress:(unint64_t)a5 reply:(id)a6;
- (void)fakeSetCECDeviceLogicalAddressAsync:(id)a3 logicalAddress:(unsigned __int8)a4 reply:(id)a5;
- (void)getExtendedPropertyAsyncForKey:(id)a3 ofDevice:(id)a4 reply:(id)a5;
- (void)getPropertyAsyncForKey:(id)a3 ofBus:(id)a4 reply:(id)a5;
- (void)invalidate;
- (void)learningSessionForDevice:(id)a3 commandProgress:(id)a4;
- (void)learningSessionForDevice:(id)a3 duplicateCommand:(unint64_t)a4 target:(id)a5;
- (void)learningSessionForDevice:(id)a3 status:(unint64_t)a4;
- (void)learningSessionForDeviceCommandDone:(id)a3;
- (void)manager:(id)a3 hasAdded:(id)a4;
- (void)manager:(id)a3 hasRemoved:(id)a4;
- (void)manager:(id)a3 hasUpdated:(id)a4;
- (void)performActiveSourceAsync:(id)a3 withMenus:(BOOL)a4 reply:(id)a5;
- (void)performDeckControlCommandAsync:(id)a3 controlMode:(unint64_t)a4 targetDevice:(id)a5 reply:(id)a6;
- (void)performDeckControlPlayAsync:(id)a3 playMode:(unint64_t)a4 targetDevice:(id)a5 reply:(id)a6;
- (void)performDeckControlRefreshStatusAsync:(id)a3 targetDevice:(id)a4 requestType:(unint64_t)a5 reply:(id)a6;
- (void)performDeckControlSetDeckStatusAsync:(unint64_t)a3 forDevice:(id)a4 reply:(id)a5;
- (void)performInactiveSourceAsync:(id)a3 reply:(id)a4;
- (void)performRefreshDevicesAsync:(id)a3 reply:(id)a4;
- (void)performRefreshProperties:(id)a3 ofDevice:(id)a4 withDeviceAsync:(id)a5 reply:(id)a6;
- (void)performRemoveDeviceWithTypeAsync:(unint64_t)a3 bus:(id)a4 reply:(id)a5;
- (void)performRequestActiveSourceAsync:(id)a3 reply:(id)a4;
- (void)performRequestAudioReturnChannelStatusChangeTo:(unint64_t)a3 withDeviceAsync:(id)a4 reply:(id)a5;
- (void)performRequestAudioStatusAsync:(id)a3 reply:(id)a4;
- (void)performRequestSystemAudioModeStatusChangeTo:(unint64_t)a3 withDeviceAsync:(id)a4 reply:(id)a5;
- (void)performSetAudioMuteStatus:(BOOL)a3 withDeviceAsync:(id)a4 reply:(id)a5;
- (void)performSetAudioReturnChannelControlEnabled:(BOOL)a3 withDeviceAsync:(id)a4 reply:(id)a5;
- (void)performSetAudioVolumeStatus:(unint64_t)a3 withDeviceAsync:(id)a4 reply:(id)a5;
- (void)performSetPowerStatus:(unint64_t)a3 withDeviceAsync:(id)a4 reply:(id)a5;
- (void)performSetSupportedAudioFormats:(id)a3 withDeviceAsync:(id)a4 reply:(id)a5;
- (void)performSetSystemAudioControlEnabled:(BOOL)a3 withDeviceAsync:(id)a4 reply:(id)a5;
- (void)performSetTrackAudioStatusEnabled:(BOOL)a3 pressTimeout:(int64_t)a4 pollInterval:(int64_t)a5 withDeviceAsync:(id)a6 reply:(id)a7;
- (void)performStandbyAsync:(id)a3 targetDevice:(id)a4 reply:(id)a5;
- (void)performSystemAudioModeRequestAsync:(id)a3 withDesiredState:(unint64_t)a4 reply:(id)a5;
- (void)queryBusesAsync:(id)a3;
- (void)queryLocalInstanceAsync:(id)a3 bus:(id)a4 reply:(id)a5;
- (void)queryLoggingAsync:(id)a3;
- (void)sendCommandAsync:(id)a3 fromDevice:(id)a4 reply:(id)a5;
- (void)sendCommandAsync:(unint64_t)a3 fromDevice:(id)a4 toDevice:(id)a5 withDuration:(unint64_t)a6 reply:(id)a7;
- (void)sendHIDEventAsync:(id)a3 fromDevice:(id)a4 toDevice:(id)a5 reply:(id)a6;
- (void)setCommandAsync:(unint64_t)a3 target:(id)a4 source:(id)a5 forButtonCombination:(id)a6 delay:(double)a7 reply:(id)a8;
- (void)setExtendedPropertyAsync:(id)a3 forKey:(id)a4 ofDevice:(id)a5 reply:(id)a6;
- (void)setLoggingAsync:(id)a3 reply:(id)a4;
- (void)setOSDNameAsync:(id)a3 forDevice:(id)a4 reply:(id)a5;
- (void)setOsdNameAsync:(id)a3 forBus:(id)a4 reply:(id)a5;
- (void)setPairStateAsync:(BOOL)a3 forAppleRemote:(id)a4 reply:(id)a5;
- (void)setPropertyAsync:(id)a3 forKey:(id)a4 ofBus:(id)a5 reply:(id)a6;
- (void)setTvLanguageCodeAsync:(id)a3 forBus:(id)a4 reply:(id)a5;
- (void)startLearningCommandAsync:(unint64_t)a3 withDevice:(id)a4 reply:(id)a5;
- (void)startLearningSessionWithDeviceAsync:(id)a3 forReason:(id)a4 reply:(id)a5;
- (void)startOnQueue:(id)a3;
- (void)updateMappingWithSessionOwningDeviceAsync:(id)a3 forTargetDevice:(id)a4 reply:(id)a5;
@end

@implementation CoreRCXPCService

- (void)fakeCreateCECBusAsync:(unint64_t)a3 reply:(id)a4
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"])
  {
    v7 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__CoreRCXPCService_CECPrivate__fakeCreateCECBusAsync_reply___block_invoke;
    block[3] = &unk_2652E3700;
    block[5] = a4;
    block[6] = a3;
    block[4] = self;
    dispatch_async((dispatch_queue_t)v7, block);
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    v9 = (void (*)(id, void, uint64_t))*((void *)a4 + 2);
    v9(a4, 0, v8);
  }
}

uint64_t __60__CoreRCXPCService_CECPrivate__fakeCreateCECBusAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fakeCreateCECBusAsync:*(void *)(a1 + 48) reply:*(void *)(a1 + 40)];
}

- (void)_fakeCreateCECBusAsync:(unint64_t)a3 reply:(id)a4
{
  v6 = [[CoreCECBusProvider alloc] initWithLinkState:0 physicalAddress:a3];
  if (v6)
  {
    if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
    {
      v9 = v6;
      LogPrintF();
    }
    [(CoreRCManager *)[(CoreRCXPCService *)self manager] addBus:v6];
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6700 userInfo:0];
  }
  uint64_t v8 = (void (*)(id, CoreCECBusProvider *, uint64_t))*((void *)a4 + 2);
  v8(a4, v6, v7);
}

- (void)fakeRemoveCECBusAsync:(id)a3 reply:(id)a4
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"])
  {
    uint64_t v7 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__CoreRCXPCService_CECPrivate__fakeRemoveCECBusAsync_reply___block_invoke;
    block[3] = &unk_2652E3728;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async((dispatch_queue_t)v7, block);
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    v9 = (void (*)(id, uint64_t))*((void *)a4 + 2);
    v9(a4, v8);
  }
}

uint64_t __60__CoreRCXPCService_CECPrivate__fakeRemoveCECBusAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fakeRemoveCECBusAsync:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)_fakeRemoveCECBusAsync:(id)a3 reply:(id)a4
{
  id v6 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedBusEquivalentTo:a3];
  if (v6)
  {
    [(CoreRCManager *)[(CoreRCXPCService *)self manager] removeBus:v6];
    if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
  }
  uint64_t v8 = (void (*)(id, uint64_t))*((void *)a4 + 2);
  v8(a4, v7);
}

- (void)fakeSetCECBusLinkStateAsync:(id)a3 linkState:(BOOL)a4 physicalAddress:(unint64_t)a5 reply:(id)a6
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"])
  {
    v11 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __92__CoreRCXPCService_CECPrivate__fakeSetCECBusLinkStateAsync_linkState_physicalAddress_reply___block_invoke;
    block[3] = &unk_2652E3750;
    block[4] = self;
    block[5] = a3;
    BOOL v15 = a4;
    block[6] = a6;
    void block[7] = a5;
    dispatch_async((dispatch_queue_t)v11, block);
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    v13 = (void (*)(id, uint64_t))*((void *)a6 + 2);
    v13(a6, v12);
  }
}

uint64_t __92__CoreRCXPCService_CECPrivate__fakeSetCECBusLinkStateAsync_linkState_physicalAddress_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fakeSetCECBusLinkStateAsync:*(void *)(a1 + 40) linkState:*(unsigned __int8 *)(a1 + 64) physicalAddress:*(void *)(a1 + 56) reply:*(void *)(a1 + 48)];
}

- (void)_fakeSetCECBusLinkStateAsync:(id)a3 linkState:(BOOL)a4 physicalAddress:(unint64_t)a5 reply:(id)a6
{
  BOOL v8 = a4;
  id v9 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedBusEquivalentTo:a3];
  if (v9)
  {
    [v9 setLinkState:v8 physicalAddress:a5];
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
  }
  v11 = (void (*)(id, uint64_t))*((void *)a6 + 2);
  v11(a6, v10);
}

- (void)fakeCreateRemoteCECDeviceAsync:(id)a3 bus:(id)a4 logicalAddress:(unsigned __int8)a5 physicalAddress:(unint64_t)a6 reply:(id)a7
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"])
  {
    v13 = [(CoreRCXPCService *)self queue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __104__CoreRCXPCService_CECPrivate__fakeCreateRemoteCECDeviceAsync_bus_logicalAddress_physicalAddress_reply___block_invoke;
    v16[3] = &unk_2652E3778;
    v16[4] = self;
    v16[5] = a3;
    unsigned __int8 v17 = a5;
    v16[7] = a7;
    v16[8] = a6;
    v16[6] = a4;
    dispatch_async((dispatch_queue_t)v13, v16);
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    BOOL v15 = (void (*)(id, void, uint64_t))*((void *)a7 + 2);
    v15(a7, 0, v14);
  }
}

uint64_t __104__CoreRCXPCService_CECPrivate__fakeCreateRemoteCECDeviceAsync_bus_logicalAddress_physicalAddress_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fakeCreateRemoteCECDeviceAsync:*(void *)(a1 + 40) bus:*(void *)(a1 + 48) logicalAddress:*(unsigned __int8 *)(a1 + 72) physicalAddress:*(void *)(a1 + 64) reply:*(void *)(a1 + 56)];
}

- (void)_fakeCreateRemoteCECDeviceAsync:(id)a3 bus:(id)a4 logicalAddress:(unsigned __int8)a5 physicalAddress:(unint64_t)a6 reply:(id)a7
{
  uint64_t v9 = a5;
  id v11 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedBusEquivalentTo:a4];
  if (v11)
  {
    uint64_t v12 = [v11 addDeviceWithLogicalAddress:v9 physicalAddress:a6 attributes:a3 message:0 reason:2];
    if (v12)
    {
      if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6728 userInfo:0];
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    uint64_t v12 = 0;
  }
  uint64_t v14 = (void (*)(id, uint64_t, uint64_t))*((void *)a7 + 2);
  v14(a7, v12, v13);
}

- (void)fakeSetCECDeviceLogicalAddressAsync:(id)a3 logicalAddress:(unsigned __int8)a4 reply:(id)a5
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"])
  {
    uint64_t v9 = [(CoreRCXPCService *)self queue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __89__CoreRCXPCService_CECPrivate__fakeSetCECDeviceLogicalAddressAsync_logicalAddress_reply___block_invoke;
    v12[3] = &unk_2652E37A0;
    v12[4] = self;
    v12[5] = a3;
    unsigned __int8 v13 = a4;
    v12[6] = a5;
    dispatch_async((dispatch_queue_t)v9, v12);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    id v11 = (void (*)(id, void, uint64_t))*((void *)a5 + 2);
    v11(a5, 0, v10);
  }
}

uint64_t __89__CoreRCXPCService_CECPrivate__fakeSetCECDeviceLogicalAddressAsync_logicalAddress_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fakeSetCECDeviceLogicalAddressAsync:*(void *)(a1 + 40) logicalAddress:*(unsigned __int8 *)(a1 + 56) reply:*(void *)(a1 + 48)];
}

- (void)_fakeSetCECDeviceLogicalAddressAsync:(id)a3 logicalAddress:(unsigned __int8)a4 reply:(id)a5
{
  uint64_t v6 = a4;
  id v8 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedBusForDevice:a3];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = (void *)[v8 deviceOnBusEquivalentTo:a3];
    id v11 = v10;
    if (v10)
    {
      [v10 setLogicalAddress:v6];
      if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
      {
        uint64_t v14 = v11;
        LogPrintF();
      }
      objc_msgSend(v9, "notifyDelegateDeviceUpdated:", v11, v14);
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    id v11 = 0;
  }
  unsigned __int8 v13 = (void (*)(id, void *, uint64_t))*((void *)a5 + 2);
  v13(a5, v11, v12);
}

- (void)fakeRemoveCECDeviceAsync:(id)a3 reply:(id)a4
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"])
  {
    uint64_t v7 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__CoreRCXPCService_CECPrivate__fakeRemoveCECDeviceAsync_reply___block_invoke;
    block[3] = &unk_2652E3728;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async((dispatch_queue_t)v7, block);
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    uint64_t v9 = (void (*)(id, uint64_t))*((void *)a4 + 2);
    v9(a4, v8);
  }
}

uint64_t __63__CoreRCXPCService_CECPrivate__fakeRemoveCECDeviceAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fakeRemoveCECDeviceAsync:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)_fakeRemoveCECDeviceAsync:(id)a3 reply:(id)a4
{
  id v6 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedBusForDevice:a3];
  if (v6 && (v7 = v6, (uint64_t v8 = (void *)[v6 deviceOnBusEquivalentTo:a3]) != 0))
  {
    uint64_t v9 = v8;
    id v10 = v8;
    [v7 removeDevice:v9];
    if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }

    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
  }
  uint64_t v12 = (void (*)(id, uint64_t))*((void *)a4 + 2);
  v12(a4, v11);
}

- (void)setOSDNameAsync:(id)a3 forDevice:(id)a4 reply:(id)a5
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    uint64_t v9 = [(CoreRCXPCService *)self queue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __56__CoreRCXPCService_IR__setOSDNameAsync_forDevice_reply___block_invoke;
    v12[3] = &unk_2652E3870;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = a4;
    void v12[7] = a5;
    dispatch_async((dispatch_queue_t)v9, v12);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    uint64_t v11 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v11(a5, v10);
  }
}

uint64_t __56__CoreRCXPCService_IR__setOSDNameAsync_forDevice_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setOSDNameAsync:*(void *)(a1 + 40) forDevice:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
}

- (void)_setOSDNameAsync:(id)a3 forDevice:(id)a4 reply:(id)a5
{
  uint64_t v16 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v13 = objc_opt_class();
    Name = sel_getName(a2);
    LogPrintF();
  }
  id v10 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
  if (v10)
  {
    uint64_t v11 = v10;
    if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
    {
      uint64_t v14 = v11;
      LogPrintF();
    }
    objc_msgSend(v11, "setOSDName:error:", a3, &v16, v14);
    uint64_t v12 = v16;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    uint64_t v16 = v12;
  }
  (*((void (**)(id, uint64_t))a5 + 2))(a5, v12);
}

- (void)setPairStateAsync:(BOOL)a3 forAppleRemote:(id)a4 reply:(id)a5
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    uint64_t v9 = [(CoreRCXPCService *)self queue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __63__CoreRCXPCService_IR__setPairStateAsync_forAppleRemote_reply___block_invoke;
    v12[3] = &unk_2652E37A0;
    BOOL v13 = a3;
    v12[4] = self;
    v12[5] = a4;
    v12[6] = a5;
    dispatch_async((dispatch_queue_t)v9, v12);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    uint64_t v11 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v11(a5, v10);
  }
}

uint64_t __63__CoreRCXPCService_IR__setPairStateAsync_forAppleRemote_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPairStateAsync:*(unsigned __int8 *)(a1 + 56) forAppleRemote:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)_setPairStateAsync:(BOOL)a3 forAppleRemote:(id)a4 reply:(id)a5
{
  BOOL v7 = a3;
  uint64_t v16 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = objc_opt_class();
    Name = sel_getName(a2);
    id v15 = a4;
    uint64_t v13 = v10;
    LogPrintF();
  }
  id v11 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
  if (v11)
  {
    uint64_t v12 = v11;
    if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v7) {
      [v12 pairAppleRemote:&v16];
    }
    else {
      [v12 unpairAppleRemote:&v16];
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
  }
  (*((void (**)(id, uint64_t))a5 + 2))(a5, v16);
}

- (void)addDeviceOnBusAsync:(id)a3 withType:(unint64_t)a4 matching:(id)a5 reply:(id)a6
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    id v11 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__CoreRCXPCService_IR__addDeviceOnBusAsync_withType_matching_reply___block_invoke;
    block[3] = &unk_2652E3898;
    block[4] = self;
    block[5] = a3;
    void block[7] = a6;
    void block[8] = a4;
    block[6] = a5;
    dispatch_async((dispatch_queue_t)v11, block);
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    uint64_t v13 = (void (*)(id, void, uint64_t))*((void *)a6 + 2);
    v13(a6, 0, v12);
  }
}

uint64_t __68__CoreRCXPCService_IR__addDeviceOnBusAsync_withType_matching_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addDeviceOnBusAsync:*(void *)(a1 + 40) withType:*(void *)(a1 + 64) matching:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
}

- (void)_addDeviceOnBusAsync:(id)a3 withType:(unint64_t)a4 matching:(id)a5 reply:(id)a6
{
  uint64_t v16 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v14 = objc_opt_class();
    LogPrintF();
  }
  id v11 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedBusEquivalentTo:a3];
  if (v11)
  {
    uint64_t v12 = v11;
    if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
    {
      id v15 = v12;
      LogPrintF();
    }
    uint64_t v13 = objc_msgSend(v12, "addDeviceWithType:matching:error:", a4, a5, &v16, v15);
    if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
  }
  (*((void (**)(id, uint64_t, uint64_t))a6 + 2))(a6, v13, v16);
}

- (void)startLearningSessionWithDeviceAsync:(id)a3 forReason:(id)a4 reply:(id)a5
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    uint64_t v9 = [(CoreRCXPCService *)self queue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __76__CoreRCXPCService_IR__startLearningSessionWithDeviceAsync_forReason_reply___block_invoke;
    v12[3] = &unk_2652E3870;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = a4;
    void v12[7] = a5;
    dispatch_async((dispatch_queue_t)v9, v12);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    id v11 = (void (*)(id, void, uint64_t))*((void *)a5 + 2);
    v11(a5, 0, v10);
  }
}

uint64_t __76__CoreRCXPCService_IR__startLearningSessionWithDeviceAsync_forReason_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startLearningSessionWithDeviceAsync:*(void *)(a1 + 40) forReason:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
}

- (void)_startLearningSessionWithDeviceAsync:(id)a3 forReason:(id)a4 reply:(id)a5
{
  uint64_t v19 = 0;
  uint64_t v9 = [a4 unsignedIntegerValue];
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v17 = objc_opt_class();
    Name = sel_getName(a2);
    LogPrintF();
  }
  id v10 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a3];
  if (!v10)
  {
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6727;
LABEL_12:
    uint64_t v13 = 0;
    uint64_t v19 = [v14 errorWithDomain:v15 code:v16 userInfo:0];
    goto LABEL_9;
  }
  id v11 = v10;
  if (([v10 isLocalDevice] & 1) == 0)
  {
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6705;
    goto LABEL_12;
  }
  uint64_t v12 = (void *)[v11 startLearningSessionWithReason:v9 error:&v19];
  uint64_t v13 = v12;
  if (v12) {
    [v12 setBridgeDelegate:self];
  }
LABEL_9:
  (*((void (**)(id, void *, uint64_t))a5 + 2))(a5, v13, v19);
}

- (void)updateMappingWithSessionOwningDeviceAsync:(id)a3 forTargetDevice:(id)a4 reply:(id)a5
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    uint64_t v9 = [(CoreRCXPCService *)self queue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __88__CoreRCXPCService_IR__updateMappingWithSessionOwningDeviceAsync_forTargetDevice_reply___block_invoke;
    v12[3] = &unk_2652E3870;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = a4;
    void v12[7] = a5;
    dispatch_async((dispatch_queue_t)v9, v12);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    id v11 = (void (*)(id, void, uint64_t))*((void *)a5 + 2);
    v11(a5, 0, v10);
  }
}

uint64_t __88__CoreRCXPCService_IR__updateMappingWithSessionOwningDeviceAsync_forTargetDevice_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMappingWithSessionOwningDeviceAsync:*(void *)(a1 + 40) forTargetDevice:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
}

- (void)_updateMappingWithSessionOwningDeviceAsync:(id)a3 forTargetDevice:(id)a4 reply:(id)a5
{
  uint64_t v23 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v18 = objc_opt_class();
    Name = sel_getName(a2);
    LogPrintF();
  }
  id v10 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
  if (v10
    && (id v11 = v10,
        (id v12 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a3]) != 0))
  {
    uint64_t v13 = v12;
    if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
    {
      uint64_t v19 = v13;
      v22 = v11;
      LogPrintF();
    }
    uint64_t v14 = objc_msgSend(v13, "learningSession", v19, v22);
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
      {
        uint64_t v20 = [v15 mappings];
        LogPrintF();
      }
      uint64_t v16 = objc_msgSend(v11, "updateMappingWithSession:error:", v15, &v23, v20);
      uint64_t v17 = v23;
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    uint64_t v16 = 0;
    uint64_t v23 = v17;
  }
  (*((void (**)(id, uint64_t, uint64_t))a5 + 2))(a5, v16, v17);
}

- (void)addDeviceOnBusAsync:(id)a3 withType:(unint64_t)a4 matching:(id)a5 withSessionOwningDevice:(id)a6 reply:(id)a7
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    uint64_t v13 = [(CoreRCXPCService *)self queue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __92__CoreRCXPCService_IR__addDeviceOnBusAsync_withType_matching_withSessionOwningDevice_reply___block_invoke;
    v16[3] = &unk_2652E38C0;
    v16[4] = self;
    v16[5] = a3;
    v16[6] = a5;
    v16[7] = a6;
    v16[8] = a7;
    void v16[9] = a4;
    dispatch_async((dispatch_queue_t)v13, v16);
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    uint64_t v15 = (void (*)(id, void, uint64_t))*((void *)a7 + 2);
    v15(a7, 0, v14);
  }
}

uint64_t __92__CoreRCXPCService_IR__addDeviceOnBusAsync_withType_matching_withSessionOwningDevice_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addDeviceOnBusAsync:*(void *)(a1 + 40) withType:*(void *)(a1 + 72) matching:*(void *)(a1 + 48) withSessionOwningDevice:*(void *)(a1 + 56) reply:*(void *)(a1 + 64)];
}

- (void)_addDeviceOnBusAsync:(id)a3 withType:(unint64_t)a4 matching:(id)a5 withSessionOwningDevice:(id)a6 reply:(id)a7
{
  uint64_t v26 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    id v24 = a3;
    id v25 = a6;
    uint64_t v22 = objc_opt_class();
    Name = sel_getName(a2);
    LogPrintF();
  }
  id v14 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedBusEquivalentTo:a3];
  if (!v14)
  {
    uint64_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08410];
LABEL_13:
    uint64_t v21 = [v19 errorWithDomain:v20 code:-6727 userInfo:0];
    uint64_t v18 = 0;
    uint64_t v26 = v21;
    goto LABEL_9;
  }
  uint64_t v15 = v14;
  id v16 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a6];
  if (!v16)
  {
LABEL_10:
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    uint64_t v18 = 0;
    goto LABEL_9;
  }
  uint64_t v17 = [v16 learningSession];
  if (!v17)
  {
    uint64_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08410];
    goto LABEL_13;
  }
  uint64_t v18 = [v15 addDeviceWithType:a4 matching:a5 learningSession:v17 error:&v26];
  if (!v18) {
    goto LABEL_10;
  }
LABEL_9:
  (*((void (**)(id, uint64_t, uint64_t))a7 + 2))(a7, v18, v26);
}

- (void)deleteDeviceAsync:(id)a3 fromBus:(id)a4 reply:(id)a5
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    uint64_t v9 = [(CoreRCXPCService *)self queue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __56__CoreRCXPCService_IR__deleteDeviceAsync_fromBus_reply___block_invoke;
    v12[3] = &unk_2652E3870;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = a4;
    void v12[7] = a5;
    dispatch_async((dispatch_queue_t)v9, v12);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    id v11 = (void (*)(id, void, uint64_t))*((void *)a5 + 2);
    v11(a5, 0, v10);
  }
}

uint64_t __56__CoreRCXPCService_IR__deleteDeviceAsync_fromBus_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteDeviceAsync:*(void *)(a1 + 40) fromBus:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
}

- (void)_deleteDeviceAsync:(id)a3 fromBus:(id)a4 reply:(id)a5
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v19 = objc_opt_class();
    Name = sel_getName(a2);
    LogPrintF();
  }
  id v10 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a3];
  if (v10)
  {
    id v11 = v10;
    if ([v10 isLocalDevice])
    {
      id v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F08410];
      uint64_t v18 = -6705;
      goto LABEL_14;
    }
    id v12 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedBusEquivalentTo:a4];
    if (v12)
    {
      [v12 removeDevice:v11];
      uint64_t v13 = 0;
      uint64_t v14 = 1;
      goto LABEL_9;
    }
  }
  id v16 = (void *)MEMORY[0x263F087E8];
  uint64_t v17 = *MEMORY[0x263F08410];
  uint64_t v18 = -6727;
LABEL_14:
  uint64_t v13 = [v16 errorWithDomain:v17 code:v18 userInfo:0];
  uint64_t v14 = 0;
LABEL_9:
  uint64_t v15 = (void (*)(id, uint64_t, uint64_t))*((void *)a5 + 2);
  v15(a5, v14, v13);
}

- (void)sendCommandAsync:(id)a3 fromDevice:(id)a4 reply:(id)a5
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    uint64_t v9 = [(CoreRCXPCService *)self queue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__CoreRCXPCService_IR__sendCommandAsync_fromDevice_reply___block_invoke;
    v12[3] = &unk_2652E3870;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = a4;
    void v12[7] = a5;
    dispatch_async((dispatch_queue_t)v9, v12);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    id v11 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v11(a5, v10);
  }
}

uint64_t __58__CoreRCXPCService_IR__sendCommandAsync_fromDevice_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendCommandAsync:*(void *)(a1 + 40) fromDevice:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
}

- (void)_sendCommandAsync:(id)a3 fromDevice:(id)a4 reply:(id)a5
{
  uint64_t v14 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v12 = objc_opt_class();
    Name = sel_getName(a2);
    LogPrintF();
  }
  id v10 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
  if (v10)
  {
    [v10 sendCommand:a3 error:&v14];
    uint64_t v11 = v14;
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    uint64_t v14 = v11;
  }
  (*((void (**)(id, uint64_t))a5 + 2))(a5, v11);
}

- (void)clearAllStoredCommandsFromDeviceAsync:(id)a3 reply:(id)a4
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    BOOL v7 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__CoreRCXPCService_IR__clearAllStoredCommandsFromDeviceAsync_reply___block_invoke;
    block[3] = &unk_2652E3728;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async((dispatch_queue_t)v7, block);
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    uint64_t v9 = (void (*)(id, void, uint64_t))*((void *)a4 + 2);
    v9(a4, 0, v8);
  }
}

uint64_t __68__CoreRCXPCService_IR__clearAllStoredCommandsFromDeviceAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearAllStoredCommandsFromDeviceAsync:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)_clearAllStoredCommandsFromDeviceAsync:(id)a3 reply:(id)a4
{
  uint64_t v13 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v11 = objc_opt_class();
    Name = sel_getName(a2);
    LogPrintF();
  }
  id v8 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a3];
  if (v8)
  {
    uint64_t v9 = [v8 clearAllStoredCommands:&v13];
    uint64_t v10 = v13;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    uint64_t v9 = 0;
    uint64_t v13 = v10;
  }
  (*((void (**)(id, uint64_t, uint64_t))a4 + 2))(a4, v9, v10);
}

- (void)setCommandAsync:(unint64_t)a3 target:(id)a4 source:(id)a5 forButtonCombination:(id)a6 delay:(double)a7 reply:(id)a8
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    uint64_t v15 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__CoreRCXPCService_IR__setCommandAsync_target_source_forButtonCombination_delay_reply___block_invoke;
    block[3] = &unk_2652E38E8;
    block[4] = self;
    block[5] = a4;
    block[6] = a5;
    void block[7] = a6;
    *(double *)&block[10] = a7;
    void block[8] = a8;
    void block[9] = a3;
    dispatch_async((dispatch_queue_t)v15, block);
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    uint64_t v17 = (void (*)(id, void, uint64_t))*((void *)a8 + 2);
    v17(a8, 0, v16);
  }
}

uint64_t __87__CoreRCXPCService_IR__setCommandAsync_target_source_forButtonCombination_delay_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCommandAsync:*(void *)(a1 + 72) target:*(void *)(a1 + 40) source:*(void *)(a1 + 48) forButtonCombination:*(void *)(a1 + 56) delay:*(void *)(a1 + 64) reply:*(double *)(a1 + 80)];
}

- (void)_setCommandAsync:(unint64_t)a3 target:(id)a4 source:(id)a5 forButtonCombination:(id)a6 delay:(double)a7 reply:(id)a8
{
  uint64_t v23 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v20 = objc_opt_class();
    Name = sel_getName(a2);
    LogPrintF();
  }
  id v16 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a5];
  if (!v16) {
    goto LABEL_18;
  }
  uint64_t v17 = v16;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    id v21 = v17;
    LogPrintF();
  }
  if (!a4
    || (a4 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4]) != 0)
  {
    if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
    {
      id v21 = a4;
      LogPrintF();
    }
    uint64_t v18 = objc_msgSend(v17, "setCommand:target:forButtonCombination:delay:error:", a3, a4, a6, &v23, a7, v21);
    uint64_t v19 = v23;
  }
  else
  {
LABEL_18:
    uint64_t v19 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F08410], -6727, 0, v21);
    uint64_t v18 = 0;
    uint64_t v23 = v19;
  }
  (*((void (**)(id, uint64_t, uint64_t))a8 + 2))(a8, v18, v19);
}

- (void)changeButtonCombinationAsync:(id)a3 delay:(double)a4 enabled:(BOOL)a5 forDevice:(id)a6 reply:(id)a7
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    uint64_t v13 = [(CoreRCXPCService *)self queue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __83__CoreRCXPCService_IR__changeButtonCombinationAsync_delay_enabled_forDevice_reply___block_invoke;
    v16[3] = &unk_2652E3778;
    v16[4] = self;
    v16[5] = a3;
    *(double *)&v16[8] = a4;
    BOOL v17 = a5;
    v16[6] = a6;
    v16[7] = a7;
    dispatch_async((dispatch_queue_t)v13, v16);
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    uint64_t v15 = (void (*)(id, void, uint64_t))*((void *)a7 + 2);
    v15(a7, 0, v14);
  }
}

uint64_t __83__CoreRCXPCService_IR__changeButtonCombinationAsync_delay_enabled_forDevice_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _changeButtonCombinationAsync:*(void *)(a1 + 40) delay:*(unsigned __int8 *)(a1 + 72) enabled:*(void *)(a1 + 48) forDevice:*(void *)(a1 + 56) reply:*(double *)(a1 + 64)];
}

- (void)_changeButtonCombinationAsync:(id)a3 delay:(double)a4 enabled:(BOOL)a5 forDevice:(id)a6 reply:(id)a7
{
  BOOL v9 = a5;
  uint64_t v20 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v18 = objc_opt_class();
    Name = sel_getName(a2);
    LogPrintF();
  }
  id v14 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a6];
  if (v14)
  {
    if (v9) {
      uint64_t v15 = [v14 enableButtonCombination:a3 delay:&v20 error:a4];
    }
    else {
      uint64_t v15 = [v14 disableButtonCombination:a3 delay:&v20 error:a4];
    }
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    uint64_t v16 = 0;
    uint64_t v20 = v17;
  }
  (*((void (**)(id, uint64_t, uint64_t))a7 + 2))(a7, v16, v20);
}

- (void)startLearningCommandAsync:(unint64_t)a3 withDevice:(id)a4 reply:(id)a5
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    BOOL v9 = [(CoreRCXPCService *)self queue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __67__CoreRCXPCService_IR__startLearningCommandAsync_withDevice_reply___block_invoke;
    v12[3] = &unk_2652E3910;
    v12[4] = self;
    v12[5] = a4;
    v12[6] = a5;
    void v12[7] = a3;
    dispatch_async((dispatch_queue_t)v9, v12);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    uint64_t v11 = (void (*)(id, void, uint64_t))*((void *)a5 + 2);
    v11(a5, 0, v10);
  }
}

uint64_t __67__CoreRCXPCService_IR__startLearningCommandAsync_withDevice_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startLearningCommandAsync:*(void *)(a1 + 56) withDevice:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)_startLearningCommandAsync:(unint64_t)a3 withDevice:(id)a4 reply:(id)a5
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v15 = objc_opt_class();
    Name = sel_getName(a2);
    LogPrintF();
  }
  id v10 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
  if (v10 && (uint64_t v11 = (void *)[v10 learningSession]) != 0)
  {
    uint64_t v12 = [v11 startLearningCommand:a3];
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    uint64_t v12 = 0;
  }
  id v14 = (void (*)(id, uint64_t, uint64_t))*((void *)a5 + 2);
  v14(a5, v12, v13);
}

- (void)endLearningWithDeviceAsync:(id)a3 reply:(id)a4
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    BOOL v7 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__CoreRCXPCService_IR__endLearningWithDeviceAsync_reply___block_invoke;
    block[3] = &unk_2652E3728;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async((dispatch_queue_t)v7, block);
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    BOOL v9 = (void (*)(id, uint64_t))*((void *)a4 + 2);
    v9(a4, v8);
  }
}

uint64_t __57__CoreRCXPCService_IR__endLearningWithDeviceAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endLearningWithDeviceAsync:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)_endLearningWithDeviceAsync:(id)a3 reply:(id)a4
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v12 = objc_opt_class();
    Name = sel_getName(a2);
    LogPrintF();
  }
  id v8 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a3];
  if (v8 && (BOOL v9 = (void *)[v8 learningSession]) != 0)
  {
    [v9 endLearning];
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
  }
  uint64_t v11 = (void (*)(id, uint64_t))*((void *)a4 + 2);
  v11(a4, v10);
}

- (void)learningSessionForDevice:(id)a3 commandProgress:(id)a4
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = a4;
    LogPrintF();
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__CoreRCXPCService_IR__learningSessionForDevice_commandProgress___block_invoke;
  v9[3] = &unk_2652E3938;
  v9[4] = a3;
  v9[5] = a4;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer", v9, v7, v8 usingBlock];
}

uint64_t __65__CoreRCXPCService_IR__learningSessionForDevice_commandProgress___block_invoke(uint64_t a1, void *a2)
{
  return [a2 learningSessionForDevice:*(void *)(a1 + 32) commandProgress:*(void *)(a1 + 40)];
}

- (void)learningSessionForDevice:(id)a3 status:(unint64_t)a4
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = objc_opt_class();
    unint64_t v8 = a4;
    LogPrintF();
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__CoreRCXPCService_IR__learningSessionForDevice_status___block_invoke;
  v9[3] = &unk_2652E3960;
  v9[4] = a3;
  v9[5] = a4;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer", v9, v7, v8 usingBlock];
}

uint64_t __56__CoreRCXPCService_IR__learningSessionForDevice_status___block_invoke(uint64_t a1, void *a2)
{
  return [a2 learningSessionForDevice:*(void *)(a1 + 32) status:*(void *)(a1 + 40)];
}

- (void)learningSessionForDevice:(id)a3 duplicateCommand:(unint64_t)a4 target:(id)a5
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    unint64_t v10 = a4;
    id v11 = a3;
    uint64_t v9 = objc_opt_class();
    LogPrintF();
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__CoreRCXPCService_IR__learningSessionForDevice_duplicateCommand_target___block_invoke;
  v12[3] = &unk_2652E3988;
  v12[5] = a5;
  v12[6] = a4;
  v12[4] = a3;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer", v12, v9, v10, v11 usingBlock];
}

uint64_t __73__CoreRCXPCService_IR__learningSessionForDevice_duplicateCommand_target___block_invoke(void *a1, void *a2)
{
  return [a2 learningSessionForDevice:a1[4] duplicateCommand:a1[6] target:a1[5]];
}

- (void)learningSessionForDeviceCommandDone:(id)a3
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = objc_opt_class();
    LogPrintF();
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__CoreRCXPCService_IR__learningSessionForDeviceCommandDone___block_invoke;
  v6[3] = &unk_2652E39B0;
  v6[4] = a3;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer", v6, v5 usingBlock];
}

uint64_t __60__CoreRCXPCService_IR__learningSessionForDeviceCommandDone___block_invoke(uint64_t a1, void *a2)
{
  return [a2 learningSessionForDeviceCommandDone:*(void *)(a1 + 32)];
}

- (void)queryLoggingAsync:(id)a3
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.logging"])
  {
    int v5 = LogShow();
    if (!v5)
    {
      uint64_t v10 = [NSString stringWithUTF8String:0];
      uint64_t v9 = 0;
      goto LABEL_10;
    }
    uint64_t v6 = *MEMORY[0x263F08410];
    uint64_t v7 = v5;
    unint64_t v8 = (void *)MEMORY[0x263F087E8];
  }
  else
  {
    unint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v6 = *MEMORY[0x263F08410];
    uint64_t v7 = -6773;
  }
  uint64_t v9 = [v8 errorWithDomain:v6 code:v7 userInfo:0];
  uint64_t v10 = 0;
LABEL_10:
  (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, v10, v9);
}

- (void)setLoggingAsync:(id)a3 reply:(id)a4
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (![(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.logging"])
  {
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08410];
    uint64_t v12 = -6773;
LABEL_11:
    uint64_t v9 = [v10 errorWithDomain:v11 code:v12 userInfo:0];
    goto LABEL_8;
  }
  [a3 UTF8String];
  int v7 = LogControl();
  if (v7)
  {
    uint64_t v11 = *MEMORY[0x263F08410];
    uint64_t v12 = v7;
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    goto LABEL_11;
  }
  uint64_t v8 = [a3 stringByReplacingOccurrencesOfString:@"+" withString:&stru_26FECF2C8];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__CoreRCXPCService_Private__setLoggingAsync_reply___block_invoke;
  v13[3] = &unk_2652E39B0;
  v13[4] = v8;
  [(CoreRCXPCService *)self enumerateClientsUsingBlock:v13];
  uint64_t v9 = 0;
LABEL_8:
  (*((void (**)(id, uint64_t))a4 + 2))(a4, v9);
}

uint64_t __51__CoreRCXPCService_Private__setLoggingAsync_reply___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLogging:*(void *)(a1 + 32)];
}

- (BOOL)checkEntitlement:(id)a3
{
  uint64_t v6 = (void *)[MEMORY[0x263F08D68] currentConnection];
  if (!v6) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreRCXPCService.m", 79, @"connection must not be nil: %@", self);
  }
  return objc_msgSend(v6, "corerc_checkEntitlement:", a3);
}

- (void)enumerateClientsHavingEntitlement:(id)a3 usingBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreRCXPCService.m", 89, @"entitlement must not be nil");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v7 = [(CoreRCXPCService *)self connections];
  uint64_t v8 = [(NSSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "corerc_checkEntitlement:", a3)) {
          [(CoreRCXPCService *)self enumerateClient:v12 usingBlock:a4];
        }
      }
      uint64_t v9 = [(NSSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)enumerateClientsUsingBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v5 = [(CoreRCXPCService *)self connections];
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CoreRCXPCService *)self enumerateClient:*(void *)(*((void *)&v10 + 1) + 8 * v9++) usingBlock:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)enumerateClient:(id)a3 usingBlock:(id)a4
{
  int v5 = (void *)[a3 remoteObjectProxy];
  if ([v5 conformsToProtocol:&unk_26FEE0EF0])
  {
    uint64_t v6 = (void (*)(id, void *))*((void *)a4 + 2);
    v6(a4, v5);
  }
}

- (CoreRCXPCService)init
{
  v4.receiver = self;
  v4.super_class = (Class)CoreRCXPCService;
  v2 = [(CoreRCXPCService *)&v4 init];
  if (v2) {
    v2->_connections = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  return v2;
}

- (void)dealloc
{
  [(CoreRCXPCService *)self invalidate];

  [(NSMutableSet *)self->_connections removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)CoreRCXPCService;
  [(CoreRCXPCService *)&v3 dealloc];
}

- (void)invalidate
{
}

- (void)startOnQueue:(id)a3
{
  if (!self->_queue)
  {
    id v5 = (id)MEMORY[0x263EF83A0];
    if (a3) {
      id v5 = a3;
    }
    self->_queue = (OS_dispatch_queue *)v5;
    uint64_t v6 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.corercd"];
    self->_listener = v6;
    [(NSXPCListener *)v6 setDelegate:self];
    [(NSXPCListener *)self->_listener _setQueue:a3];
    uint64_t v7 = [[CoreRCManagerProvider alloc] initWithSerialQueue:self->_queue];
    self->_manager = v7;
    [(CoreRCManager *)v7 setDelegate:self];
    [(NSXPCListener *)self->_listener resume];
    if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    [a4 processIdentifier];
    LogPrintF();
  }
  [a4 setExportedInterface:CoreRCXPCServiceInterface()];
  [a4 setExportedObject:self];
  [a4 setRemoteObjectInterface:CoreRCXPCClientInterface()];
  objc_msgSend(a4, "setUserInfo:", objc_msgSend(MEMORY[0x263EFF9C0], "set"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__CoreRCXPCService_listener_shouldAcceptNewConnection___block_invoke;
  v7[3] = &unk_2652E3520;
  v7[4] = self;
  v7[5] = a4;
  [a4 setInvalidationHandler:v7];
  [(NSMutableSet *)self->_connections addObject:a4];
  [a4 resume];
  return 1;
}

uint64_t __55__CoreRCXPCService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) connectionInvalidated:*(void *)(a1 + 40)];
}

- (void)connectionInvalidated:(id)a3
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = [a3 processIdentifier];
    LogPrintF();
  }
  id v5 = [(CoreRCXPCService *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__CoreRCXPCService_connectionInvalidated___block_invoke;
  block[3] = &unk_2652E3520;
  block[4] = a3;
  block[5] = self;
  dispatch_async_and_wait((dispatch_queue_t)v5, block);
  [a3 setInvalidationHandler:0];
}

uint64_t __42__CoreRCXPCService_connectionInvalidated___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = (void *)[*(id *)(a1 + 32) userInfo];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (![v7 removeOwningClient:*(void *)(a1 + 32)])
        {
          if (gLogCategory_CoreRCDevice <= 90
            && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
          {
            uint64_t v9 = v7;
            LogPrintF();
          }
          objc_msgSend((id)objc_msgSend(v7, "bus", v9), "removeDevice:", v7);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  [*(id *)(*(void *)(a1 + 40) + 8) removeObject:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 32) setUserInfo:0];
}

- (void)sendHIDEventAsync:(id)a3 fromDevice:(id)a4 toDevice:(id)a5 reply:(id)a6
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    long long v11 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__CoreRCXPCService_sendHIDEventAsync_fromDevice_toDevice_reply___block_invoke;
    block[3] = &unk_2652E4D68;
    block[4] = self;
    block[5] = a3;
    void block[6] = a4;
    void block[7] = a5;
    void block[8] = a6;
    dispatch_async((dispatch_queue_t)v11, block);
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    long long v13 = (void (*)(id, uint64_t))*((void *)a6 + 2);
    v13(a6, v12);
  }
}

uint64_t __64__CoreRCXPCService_sendHIDEventAsync_fromDevice_toDevice_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendHIDEventAsync:*(void *)(a1 + 40) fromDevice:*(void *)(a1 + 48) toDevice:*(void *)(a1 + 56) reply:*(void *)(a1 + 64)];
}

- (void)_sendHIDEventAsync:(id)a3 fromDevice:(id)a4 toDevice:(id)a5 reply:(id)a6
{
  uint64_t v18 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v16 = objc_opt_class();
    Name = sel_getName(a2);
    LogPrintF();
  }
  id v12 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
  if (v12
    && ((long long v13 = v12, !a5)
     || (id v14 = -[CoreRCManager managedDeviceEquivalentTo:](-[CoreRCXPCService manager](self, "manager"), "managedDeviceEquivalentTo:", a5)) != 0&& (a5 = v14, (objc_msgSend((id)objc_msgSend(v13, "bus"), "isEqual:", objc_msgSend(v14, "bus")) & 1) != 0)))
  {
    [v13 sendHIDEvent:a3 target:a5 error:&v18];
    uint64_t v15 = v18;
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    uint64_t v18 = v15;
  }
  (*((void (**)(id, uint64_t))a6 + 2))(a6, v15);
}

- (void)sendCommandAsync:(unint64_t)a3 fromDevice:(id)a4 toDevice:(id)a5 withDuration:(unint64_t)a6 reply:(id)a7
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    long long v13 = [(CoreRCXPCService *)self queue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __76__CoreRCXPCService_sendCommandAsync_fromDevice_toDevice_withDuration_reply___block_invoke;
    v16[3] = &unk_2652E4D90;
    v16[4] = self;
    v16[5] = a4;
    v16[8] = a3;
    void v16[9] = a6;
    v16[6] = a5;
    v16[7] = a7;
    dispatch_async((dispatch_queue_t)v13, v16);
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    uint64_t v15 = (void (*)(id, uint64_t))*((void *)a7 + 2);
    v15(a7, v14);
  }
}

uint64_t __76__CoreRCXPCService_sendCommandAsync_fromDevice_toDevice_withDuration_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendCommandAsync:*(void *)(a1 + 64) fromDevice:*(void *)(a1 + 40) toDevice:*(void *)(a1 + 48) withDuration:*(void *)(a1 + 72) reply:*(void *)(a1 + 56)];
}

- (void)_sendCommandAsync:(unint64_t)a3 fromDevice:(id)a4 toDevice:(id)a5 withDuration:(unint64_t)a6 reply:(id)a7
{
  uint64_t v20 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v18 = objc_opt_class();
    Name = sel_getName(a2);
    LogPrintF();
  }
  id v14 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
  if (v14
    && ((uint64_t v15 = v14, !a5)
     || (id v16 = -[CoreRCManager managedDeviceEquivalentTo:](-[CoreRCXPCService manager](self, "manager"), "managedDeviceEquivalentTo:", a5)) != 0&& (a5 = v16, (objc_msgSend((id)objc_msgSend(v15, "bus"), "isEqual:", objc_msgSend(v16, "bus")) & 1) != 0)))
  {
    [v15 sendCommand:a3 target:a5 withDuration:a6 error:&v20];
    uint64_t v17 = v20;
  }
  else
  {
    uint64_t v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    uint64_t v20 = v17;
  }
  (*((void (**)(id, uint64_t))a7 + 2))(a7, v17);
}

- (void)queryBusesAsync:(id)a3
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    uint64_t v5 = [(CoreRCXPCService *)self queue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__CoreRCXPCService_queryBusesAsync___block_invoke;
    v8[3] = &unk_2652E4DB8;
    v8[4] = self;
    v8[5] = a3;
    dispatch_async((dispatch_queue_t)v5, v8);
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    uint64_t v7 = (void (*)(id, void, uint64_t))*((void *)a3 + 2);
    v7(a3, 0, v6);
  }
}

uint64_t __36__CoreRCXPCService_queryBusesAsync___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryBusesAsync:*(void *)(a1 + 40)];
}

- (void)_queryBusesAsync:(id)a3
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = objc_opt_class();
    LogPrintF();
  }
  uint64_t v5 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] buses];
  uint64_t v6 = (void (*)(id, NSSet *, void))*((void *)a3 + 2);
  v6(a3, v5, 0);
}

- (void)setPropertyAsync:(id)a3 forKey:(id)a4 ofBus:(id)a5 reply:(id)a6
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    long long v11 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__CoreRCXPCService_setPropertyAsync_forKey_ofBus_reply___block_invoke;
    block[3] = &unk_2652E4D68;
    block[4] = self;
    block[5] = a3;
    void block[6] = a4;
    void block[7] = a5;
    void block[8] = a6;
    dispatch_async((dispatch_queue_t)v11, block);
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    long long v13 = (void (*)(id, uint64_t))*((void *)a6 + 2);
    v13(a6, v12);
  }
}

uint64_t __56__CoreRCXPCService_setPropertyAsync_forKey_ofBus_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPropertyAsync:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48) ofBus:*(void *)(a1 + 56) reply:*(void *)(a1 + 64)];
}

- (void)_setPropertyAsync:(id)a3 forKey:(id)a4 ofBus:(id)a5 reply:(id)a6
{
  uint64_t v12 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v11 = objc_opt_class();
    LogPrintF();
  }
  [(CoreRCManagerProvider *)[(CoreRCXPCService *)self manager] setProperty:a3 forKey:a4 ofBus:a5 error:&v12];
  (*((void (**)(id, uint64_t))a6 + 2))(a6, v12);
}

- (void)getPropertyAsyncForKey:(id)a3 ofBus:(id)a4 reply:(id)a5
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.observer"])
  {
    uint64_t v9 = [(CoreRCXPCService *)self queue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__CoreRCXPCService_getPropertyAsyncForKey_ofBus_reply___block_invoke;
    v12[3] = &unk_2652E3870;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = a4;
    void v12[7] = a5;
    dispatch_async((dispatch_queue_t)v9, v12);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    uint64_t v11 = (void (*)(id, void, uint64_t))*((void *)a5 + 2);
    v11(a5, 0, v10);
  }
}

uint64_t __55__CoreRCXPCService_getPropertyAsyncForKey_ofBus_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getPropertyAsyncForKey:*(void *)(a1 + 40) ofBus:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
}

- (void)_getPropertyAsyncForKey:(id)a3 ofBus:(id)a4 reply:(id)a5
{
  uint64_t v11 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = objc_opt_class();
    LogPrintF();
  }
  id v9 = [(CoreRCManagerProvider *)[(CoreRCXPCService *)self manager] propertyForKey:a3 ofBus:a4 error:&v11];
  (*((void (**)(id, id, uint64_t))a5 + 2))(a5, v9, v11);
}

- (void)setExtendedPropertyAsync:(id)a3 forKey:(id)a4 ofDevice:(id)a5 reply:(id)a6
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    uint64_t v11 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__CoreRCXPCService_setExtendedPropertyAsync_forKey_ofDevice_reply___block_invoke;
    block[3] = &unk_2652E4D68;
    block[4] = self;
    block[5] = a3;
    void block[6] = a4;
    void block[7] = a5;
    void block[8] = a6;
    dispatch_async((dispatch_queue_t)v11, block);
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    long long v13 = (void (*)(id, uint64_t))*((void *)a6 + 2);
    v13(a6, v12);
  }
}

uint64_t __67__CoreRCXPCService_setExtendedPropertyAsync_forKey_ofDevice_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setExtendedPropertyAsync:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48) ofDevice:*(void *)(a1 + 56) reply:*(void *)(a1 + 64)];
}

- (void)_setExtendedPropertyAsync:(id)a3 forKey:(id)a4 ofDevice:(id)a5 reply:(id)a6
{
  uint64_t v12 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v11 = objc_opt_class();
    LogPrintF();
  }
  [(CoreRCManagerProvider *)[(CoreRCXPCService *)self manager] setExtendedProperty:a3 forKey:a4 ofDevice:a5 error:&v12];
  (*((void (**)(id, uint64_t))a6 + 2))(a6, v12);
}

- (void)getExtendedPropertyAsyncForKey:(id)a3 ofDevice:(id)a4 reply:(id)a5
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.observer"])
  {
    id v9 = [(CoreRCXPCService *)self queue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__CoreRCXPCService_getExtendedPropertyAsyncForKey_ofDevice_reply___block_invoke;
    v12[3] = &unk_2652E3870;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = a4;
    void v12[7] = a5;
    dispatch_async((dispatch_queue_t)v9, v12);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    uint64_t v11 = (void (*)(id, void, uint64_t))*((void *)a5 + 2);
    v11(a5, 0, v10);
  }
}

uint64_t __66__CoreRCXPCService_getExtendedPropertyAsyncForKey_ofDevice_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getExtendedPropertyAsyncForKey:*(void *)(a1 + 40) ofDevice:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
}

- (void)_getExtendedPropertyAsyncForKey:(id)a3 ofDevice:(id)a4 reply:(id)a5
{
  uint64_t v11 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = objc_opt_class();
    LogPrintF();
  }
  id v9 = [(CoreRCManagerProvider *)[(CoreRCXPCService *)self manager] extendedPropertyForKey:a3 ofDevice:a4 error:&v11];
  (*((void (**)(id, id, uint64_t))a5 + 2))(a5, v9, v11);
}

- (void)manager:(id)a3 hasAdded:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v11 = objc_opt_class();
    id v12 = a4;
    LogPrintF();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = objc_msgSend(a4, "devices", v11, v12);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) setDelegate:self];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  [a4 setDelegate:self];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __37__CoreRCXPCService_manager_hasAdded___block_invoke;
  v13[3] = &unk_2652E39B0;
  v13[4] = a4;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer" usingBlock:v13];
}

uint64_t __37__CoreRCXPCService_manager_hasAdded___block_invoke(uint64_t a1, void *a2)
{
  return [a2 busHasBeenAdded:*(void *)(a1 + 32)];
}

- (void)manager:(id)a3 hasRemoved:(id)a4
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = a4;
    LogPrintF();
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__CoreRCXPCService_manager_hasRemoved___block_invoke;
  v8[3] = &unk_2652E39B0;
  v8[4] = a4;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer", v8, v6, v7 usingBlock];
}

uint64_t __39__CoreRCXPCService_manager_hasRemoved___block_invoke(uint64_t a1, void *a2)
{
  return [a2 busHasBeenRemoved:*(void *)(a1 + 32)];
}

- (void)manager:(id)a3 hasUpdated:(id)a4
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = a4;
    LogPrintF();
  }
  objc_msgSend(a4, "setDelegate:", self, v6, v7);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__CoreRCXPCService_manager_hasUpdated___block_invoke;
  v8[3] = &unk_2652E39B0;
  v8[4] = a4;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer" usingBlock:v8];
}

uint64_t __39__CoreRCXPCService_manager_hasUpdated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 busHasBeenUpdated:*(void *)(a1 + 32)];
}

- (void)bus:(id)a3 deviceHasBeenAdded:(id)a4
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    id v8 = a3;
    id v9 = a4;
    uint64_t v7 = objc_opt_class();
    LogPrintF();
  }
  objc_msgSend(a4, "setDelegate:", self, v7, v8, v9);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__CoreRCXPCService_bus_deviceHasBeenAdded___block_invoke;
  v10[3] = &unk_2652E3938;
  v10[4] = a3;
  v10[5] = a4;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer" usingBlock:v10];
}

uint64_t __43__CoreRCXPCService_bus_deviceHasBeenAdded___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bus:*(void *)(a1 + 32) deviceHasBeenAdded:*(void *)(a1 + 40)];
}

- (void)bus:(id)a3 deviceHasBeenRemoved:(id)a4
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    id v8 = a3;
    id v9 = a4;
    uint64_t v7 = objc_opt_class();
    LogPrintF();
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__CoreRCXPCService_bus_deviceHasBeenRemoved___block_invoke;
  v10[3] = &unk_2652E3938;
  v10[4] = a3;
  v10[5] = a4;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer", v10, v7, v8, v9 usingBlock];
}

uint64_t __45__CoreRCXPCService_bus_deviceHasBeenRemoved___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bus:*(void *)(a1 + 32) deviceHasBeenRemoved:*(void *)(a1 + 40)];
}

- (void)bus:(id)a3 deviceHasBeenUpdated:(id)a4
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    id v8 = a3;
    id v9 = a4;
    uint64_t v7 = objc_opt_class();
    LogPrintF();
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__CoreRCXPCService_bus_deviceHasBeenUpdated___block_invoke;
  v10[3] = &unk_2652E3938;
  v10[4] = a3;
  v10[5] = a4;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer", v10, v7, v8, v9 usingBlock];
}

uint64_t __45__CoreRCXPCService_bus_deviceHasBeenUpdated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bus:*(void *)(a1 + 32) deviceHasBeenUpdated:*(void *)(a1 + 40)];
}

- (void)device:(id)a3 receivedHIDEvent:(id)a4 fromDevice:(id)a5
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    id v11 = a4;
    id v12 = a5;
    uint64_t v9 = objc_opt_class();
    id v10 = a3;
    LogPrintF();
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__CoreRCXPCService_device_receivedHIDEvent_fromDevice___block_invoke;
  v13[3] = &unk_2652E4DE0;
  v13[4] = a3;
  void v13[5] = a4;
  v13[6] = a5;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer", v13, v9, v10, v11, v12 usingBlock];
}

uint64_t __55__CoreRCXPCService_device_receivedHIDEvent_fromDevice___block_invoke(void *a1, void *a2)
{
  return [a2 device:a1[4] receivedHIDEvent:a1[5] fromDevice:a1[6]];
}

- (NSSet)connections
{
  return &self->_connections->super;
}

- (CoreRCManagerProvider)manager
{
  return self->_manager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)performActiveSourceAsync:(id)a3 withMenus:(BOOL)a4 reply:(id)a5
{
  BOOL v9 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    id v10 = [(CoreRCXPCService *)self queue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __66__CoreRCXPCService_CEC__performActiveSourceAsync_withMenus_reply___block_invoke;
    v13[3] = &unk_2652E4E90;
    v13[4] = self;
    void v13[5] = a3;
    BOOL v14 = a4;
    BOOL v15 = v9;
    v13[6] = a5;
    dispatch_async((dispatch_queue_t)v10, v13);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    id v12 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v12(a5, v11);
  }
}

uint64_t __66__CoreRCXPCService_CEC__performActiveSourceAsync_withMenus_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performActiveSourceAsync:*(void *)(a1 + 40) withMenus:*(unsigned __int8 *)(a1 + 56) allowRemoteDevice:*(unsigned __int8 *)(a1 + 57) reply:*(void *)(a1 + 48)];
}

- (void)_performActiveSourceAsync:(id)a3 withMenus:(BOOL)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6
{
  BOOL v8 = a4;
  uint64_t v18 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v17 = objc_opt_class();
    LogPrintF();
  }
  id v11 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a3];
  if (!v11)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6727;
LABEL_12:
    uint64_t v13 = [v14 errorWithDomain:v15 code:v16 userInfo:0];
    uint64_t v18 = v13;
    goto LABEL_9;
  }
  id v12 = v11;
  if (([v11 isLocalDevice] & 1) == 0 && !a5)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6773;
    goto LABEL_12;
  }
  [v12 makeActiveSourceWithTVMenus:v8 error:&v18];
  uint64_t v13 = v18;
LABEL_9:
  (*((void (**)(id, uint64_t))a6 + 2))(a6, v13);
}

- (void)performDeckControlSetDeckStatusAsync:(unint64_t)a3 forDevice:(id)a4 reply:(id)a5
{
  BOOL v9 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    id v10 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__CoreRCXPCService_CEC__performDeckControlSetDeckStatusAsync_forDevice_reply___block_invoke;
    block[3] = &unk_2652E3750;
    block[4] = self;
    block[5] = a4;
    BOOL v14 = v9;
    void block[6] = a5;
    void block[7] = a3;
    dispatch_async((dispatch_queue_t)v10, block);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    id v12 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v12(a5, v11);
  }
}

uint64_t __78__CoreRCXPCService_CEC__performDeckControlSetDeckStatusAsync_forDevice_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performDeckControlSetDeckStatusAsync:*(void *)(a1 + 56) forDevice:*(void *)(a1 + 40) allowRemoteDevice:*(unsigned __int8 *)(a1 + 64) reply:*(void *)(a1 + 48)];
}

- (void)_performDeckControlSetDeckStatusAsync:(unint64_t)a3 forDevice:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6
{
  uint64_t v20 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v18 = CoreCECDeckInfoString(a3);
    id v19 = a4;
    uint64_t v17 = v11;
    LogPrintF();
  }
  id v12 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
  if (!v12)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6727;
LABEL_15:
    uint64_t v20 = [v14 errorWithDomain:v15 code:v16 userInfo:0];
    goto LABEL_12;
  }
  uint64_t v13 = v12;
  if (([v12 isLocalDevice] & 1) == 0 && !a5)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6773;
    goto LABEL_15;
  }
  [v13 deckControlSetDeckStatus:a3 error:&v20];
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
LABEL_12:
  (*((void (**)(id, uint64_t))a6 + 2))(a6, v20);
}

- (void)performDeckControlCommandAsync:(id)a3 controlMode:(unint64_t)a4 targetDevice:(id)a5 reply:(id)a6
{
  BOOL v11 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    id v12 = [(CoreRCXPCService *)self queue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __87__CoreRCXPCService_CEC__performDeckControlCommandAsync_controlMode_targetDevice_reply___block_invoke;
    v15[3] = &unk_2652E3778;
    v15[4] = self;
    v15[5] = a3;
    v15[7] = a6;
    v15[8] = a4;
    BOOL v16 = v11;
    v15[6] = a5;
    dispatch_async((dispatch_queue_t)v12, v15);
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    BOOL v14 = (void (*)(id, uint64_t))*((void *)a6 + 2);
    v14(a6, v13);
  }
}

uint64_t __87__CoreRCXPCService_CEC__performDeckControlCommandAsync_controlMode_targetDevice_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performDeckControlCommandAsync:*(void *)(a1 + 40) controlMode:*(void *)(a1 + 64) targetDevice:*(void *)(a1 + 48) allowRemoteDevice:*(unsigned __int8 *)(a1 + 72) reply:*(void *)(a1 + 56)];
}

- (void)_performDeckControlCommandAsync:(id)a3 controlMode:(unint64_t)a4 targetDevice:(id)a5 allowRemoteDevice:(BOOL)a6 reply:(id)a7
{
  uint64_t v25 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v23 = CoreCECDeckControlModeString(a4);
    id v24 = a5;
    uint64_t v21 = v13;
    id v22 = a3;
    LogPrintF();
  }
  id v14 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a3];
  if (!v14) {
    goto LABEL_10;
  }
  uint64_t v15 = v14;
  if (([v14 isLocalDevice] & 1) == 0 && !a6)
  {
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08410];
    uint64_t v19 = -6773;
    goto LABEL_15;
  }
  if (a5)
  {
    id v16 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a5];
    if (!v16)
    {
LABEL_10:
      uint64_t v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = *MEMORY[0x263F08410];
      uint64_t v19 = -6727;
LABEL_15:
      uint64_t v20 = [v17 errorWithDomain:v18 code:v19 userInfo:0];
      uint64_t v25 = v20;
      goto LABEL_13;
    }
  }
  else
  {
    id v16 = 0;
  }
  [v15 deckControlCommandWithMode:a4 target:v16 error:&v25];
  uint64_t v20 = v25;
LABEL_13:
  (*((void (**)(id, uint64_t))a7 + 2))(a7, v20);
}

- (void)performDeckControlPlayAsync:(id)a3 playMode:(unint64_t)a4 targetDevice:(id)a5 reply:(id)a6
{
  BOOL v11 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    id v12 = [(CoreRCXPCService *)self queue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __81__CoreRCXPCService_CEC__performDeckControlPlayAsync_playMode_targetDevice_reply___block_invoke;
    v15[3] = &unk_2652E3778;
    v15[4] = self;
    v15[5] = a3;
    v15[7] = a6;
    v15[8] = a4;
    BOOL v16 = v11;
    v15[6] = a5;
    dispatch_async((dispatch_queue_t)v12, v15);
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    id v14 = (void (*)(id, uint64_t))*((void *)a6 + 2);
    v14(a6, v13);
  }
}

uint64_t __81__CoreRCXPCService_CEC__performDeckControlPlayAsync_playMode_targetDevice_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performDeckControlPlayAsync:*(void *)(a1 + 40) playMode:*(void *)(a1 + 64) targetDevice:*(void *)(a1 + 48) allowRemoteDevice:*(unsigned __int8 *)(a1 + 72) reply:*(void *)(a1 + 56)];
}

- (void)_performDeckControlPlayAsync:(id)a3 playMode:(unint64_t)a4 targetDevice:(id)a5 allowRemoteDevice:(BOOL)a6 reply:(id)a7
{
  uint64_t v25 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v23 = CoreCECPlayModeString(a4);
    id v24 = a5;
    uint64_t v21 = v13;
    id v22 = a3;
    LogPrintF();
  }
  id v14 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a3];
  if (!v14) {
    goto LABEL_10;
  }
  uint64_t v15 = v14;
  if (([v14 isLocalDevice] & 1) == 0 && !a6)
  {
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08410];
    uint64_t v19 = -6773;
    goto LABEL_15;
  }
  if (a5)
  {
    id v16 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a5];
    if (!v16)
    {
LABEL_10:
      uint64_t v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = *MEMORY[0x263F08410];
      uint64_t v19 = -6727;
LABEL_15:
      uint64_t v20 = [v17 errorWithDomain:v18 code:v19 userInfo:0];
      uint64_t v25 = v20;
      goto LABEL_13;
    }
  }
  else
  {
    id v16 = 0;
  }
  [v15 deckControlPlayWithMode:a4 target:v16 error:&v25];
  uint64_t v20 = v25;
LABEL_13:
  (*((void (**)(id, uint64_t))a7 + 2))(a7, v20);
}

- (void)performDeckControlRefreshStatusAsync:(id)a3 targetDevice:(id)a4 requestType:(unint64_t)a5 reply:(id)a6
{
  BOOL v11 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    id v12 = [(CoreRCXPCService *)self queue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __93__CoreRCXPCService_CEC__performDeckControlRefreshStatusAsync_targetDevice_requestType_reply___block_invoke;
    v15[3] = &unk_2652E3778;
    v15[4] = self;
    v15[5] = a3;
    v15[7] = a6;
    v15[8] = a5;
    BOOL v16 = v11;
    v15[6] = a4;
    dispatch_async((dispatch_queue_t)v12, v15);
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    id v14 = (void (*)(id, uint64_t))*((void *)a6 + 2);
    v14(a6, v13);
  }
}

uint64_t __93__CoreRCXPCService_CEC__performDeckControlRefreshStatusAsync_targetDevice_requestType_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performDeckControlRefreshStatusAsync:*(void *)(a1 + 40) targetDevice:*(void *)(a1 + 48) requestType:*(void *)(a1 + 64) allowRemoteDevice:*(unsigned __int8 *)(a1 + 72) reply:*(void *)(a1 + 56)];
}

- (void)_performDeckControlRefreshStatusAsync:(id)a3 targetDevice:(id)a4 requestType:(unint64_t)a5 allowRemoteDevice:(BOOL)a6 reply:(id)a7
{
  uint64_t v23 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    id v21 = a3;
    id v22 = a4;
    uint64_t v20 = objc_opt_class();
    LogPrintF();
  }
  id v13 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a3];
  if (!v13) {
    goto LABEL_11;
  }
  id v14 = v13;
  if (([v13 isLocalDevice] & 1) == 0 && !a6)
  {
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08410];
    uint64_t v19 = -6773;
    goto LABEL_13;
  }
  id v15 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
  if (!v15)
  {
LABEL_11:
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08410];
    uint64_t v19 = -6727;
LABEL_13:
    uint64_t v16 = [v17 errorWithDomain:v18 code:v19 userInfo:0];
    uint64_t v23 = v16;
    goto LABEL_10;
  }
  [v14 deckControlRefreshStatus:v15 requestType:a5 error:&v23];
  uint64_t v16 = v23;
LABEL_10:
  (*((void (**)(id, uint64_t))a7 + 2))(a7, v16);
}

- (void)performInactiveSourceAsync:(id)a3 reply:(id)a4
{
  BOOL v7 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    BOOL v8 = [(CoreRCXPCService *)self queue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __58__CoreRCXPCService_CEC__performInactiveSourceAsync_reply___block_invoke;
    v11[3] = &unk_2652E37A0;
    v11[4] = self;
    v11[5] = a3;
    BOOL v12 = v7;
    v11[6] = a4;
    dispatch_async((dispatch_queue_t)v8, v11);
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    id v10 = (void (*)(id, uint64_t))*((void *)a4 + 2);
    v10(a4, v9);
  }
}

uint64_t __58__CoreRCXPCService_CEC__performInactiveSourceAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performInactiveSourceAsync:*(void *)(a1 + 40) allowRemoteDevice:*(unsigned __int8 *)(a1 + 56) reply:*(void *)(a1 + 48)];
}

- (void)_performInactiveSourceAsync:(id)a3 allowRemoteDevice:(BOOL)a4 reply:(id)a5
{
  uint64_t v16 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v15 = objc_opt_class();
    LogPrintF();
  }
  id v9 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a3];
  if (!v9)
  {
    BOOL v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08410];
    uint64_t v14 = -6727;
LABEL_12:
    uint64_t v11 = [v12 errorWithDomain:v13 code:v14 userInfo:0];
    uint64_t v16 = v11;
    goto LABEL_9;
  }
  id v10 = v9;
  if (([v9 isLocalDevice] & 1) == 0 && !a4)
  {
    BOOL v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08410];
    uint64_t v14 = -6773;
    goto LABEL_12;
  }
  [v10 resignActiveSource:&v16];
  uint64_t v11 = v16;
LABEL_9:
  (*((void (**)(id, uint64_t))a5 + 2))(a5, v11);
}

- (void)performRefreshDevicesAsync:(id)a3 reply:(id)a4
{
  BOOL v7 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    BOOL v8 = [(CoreRCXPCService *)self queue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __58__CoreRCXPCService_CEC__performRefreshDevicesAsync_reply___block_invoke;
    v11[3] = &unk_2652E37A0;
    v11[4] = self;
    v11[5] = a3;
    BOOL v12 = v7;
    v11[6] = a4;
    dispatch_async((dispatch_queue_t)v8, v11);
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    id v10 = (void (*)(id, uint64_t))*((void *)a4 + 2);
    v10(a4, v9);
  }
}

uint64_t __58__CoreRCXPCService_CEC__performRefreshDevicesAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performRefreshDevicesAsync:*(void *)(a1 + 40) allowRemoteDevice:*(unsigned __int8 *)(a1 + 56) reply:*(void *)(a1 + 48)];
}

- (void)_performRefreshDevicesAsync:(id)a3 allowRemoteDevice:(BOOL)a4 reply:(id)a5
{
  uint64_t v16 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v15 = objc_opt_class();
    LogPrintF();
  }
  id v9 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a3];
  if (!v9)
  {
    BOOL v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08410];
    uint64_t v14 = -6727;
LABEL_12:
    uint64_t v11 = [v12 errorWithDomain:v13 code:v14 userInfo:0];
    uint64_t v16 = v11;
    goto LABEL_9;
  }
  id v10 = v9;
  if (([v9 isLocalDevice] & 1) == 0 && !a4)
  {
    BOOL v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08410];
    uint64_t v14 = -6773;
    goto LABEL_12;
  }
  objc_msgSend((id)objc_msgSend(v10, "bus"), "refreshDevicesWithInitiator:error:", v10, &v16);
  uint64_t v11 = v16;
LABEL_9:
  (*((void (**)(id, uint64_t))a5 + 2))(a5, v11);
}

- (void)performRefreshProperties:(id)a3 ofDevice:(id)a4 withDeviceAsync:(id)a5 reply:(id)a6
{
  BOOL v11 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    BOOL v12 = [(CoreRCXPCService *)self queue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __81__CoreRCXPCService_CEC__performRefreshProperties_ofDevice_withDeviceAsync_reply___block_invoke;
    v15[3] = &unk_2652E4EB8;
    v15[4] = self;
    v15[5] = a3;
    v15[6] = a4;
    v15[7] = a5;
    BOOL v16 = v11;
    v15[8] = a6;
    dispatch_async((dispatch_queue_t)v12, v15);
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    uint64_t v14 = (void (*)(id, uint64_t))*((void *)a6 + 2);
    v14(a6, v13);
  }
}

uint64_t __81__CoreRCXPCService_CEC__performRefreshProperties_ofDevice_withDeviceAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performRefreshProperties:*(void *)(a1 + 40) ofDevice:*(void *)(a1 + 48) withDeviceAsync:*(void *)(a1 + 56) allowRemoteDevice:*(unsigned __int8 *)(a1 + 72) reply:*(void *)(a1 + 64)];
}

- (void)_performRefreshProperties:(id)a3 ofDevice:(id)a4 withDeviceAsync:(id)a5 allowRemoteDevice:(BOOL)a6 reply:(id)a7
{
  uint64_t v21 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v20 = objc_opt_class();
    LogPrintF();
  }
  id v13 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a5];
  if (!v13) {
    goto LABEL_11;
  }
  uint64_t v14 = v13;
  if (([v13 isLocalDevice] & 1) == 0 && !a6)
  {
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08410];
    uint64_t v19 = -6773;
    goto LABEL_13;
  }
  id v15 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
  if (!v15)
  {
LABEL_11:
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08410];
    uint64_t v19 = -6727;
LABEL_13:
    uint64_t v16 = [v17 errorWithDomain:v18 code:v19 userInfo:0];
    uint64_t v21 = v16;
    goto LABEL_10;
  }
  [v14 refreshProperties:a3 ofDevice:v15 error:&v21];
  uint64_t v16 = v21;
LABEL_10:
  (*((void (**)(id, uint64_t))a7 + 2))(a7, v16);
}

- (void)performRequestActiveSourceAsync:(id)a3 reply:(id)a4
{
  BOOL v7 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    BOOL v8 = [(CoreRCXPCService *)self queue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __63__CoreRCXPCService_CEC__performRequestActiveSourceAsync_reply___block_invoke;
    v11[3] = &unk_2652E37A0;
    v11[4] = self;
    v11[5] = a3;
    BOOL v12 = v7;
    v11[6] = a4;
    dispatch_async((dispatch_queue_t)v8, v11);
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    id v10 = (void (*)(id, uint64_t))*((void *)a4 + 2);
    v10(a4, v9);
  }
}

uint64_t __63__CoreRCXPCService_CEC__performRequestActiveSourceAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performRequestActiveSourceAsync:*(void *)(a1 + 40) allowRemoteDevice:*(unsigned __int8 *)(a1 + 56) reply:*(void *)(a1 + 48)];
}

- (void)_performRequestActiveSourceAsync:(id)a3 allowRemoteDevice:(BOOL)a4 reply:(id)a5
{
  uint64_t v17 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v15 = objc_opt_class();
    id v16 = a3;
    LogPrintF();
  }
  id v9 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a3];
  if (!v9)
  {
    BOOL v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08410];
    uint64_t v14 = -6727;
LABEL_12:
    uint64_t v11 = [v12 errorWithDomain:v13 code:v14 userInfo:0];
    uint64_t v17 = v11;
    goto LABEL_9;
  }
  id v10 = v9;
  if (([v9 isLocalDevice] & 1) == 0 && !a4)
  {
    BOOL v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08410];
    uint64_t v14 = -6773;
    goto LABEL_12;
  }
  [v10 requestActiveSource:&v17];
  uint64_t v11 = v17;
LABEL_9:
  (*((void (**)(id, uint64_t))a5 + 2))(a5, v11);
}

- (void)performSetSystemAudioControlEnabled:(BOOL)a3 withDeviceAsync:(id)a4 reply:(id)a5
{
  BOOL v9 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    id v10 = [(CoreRCXPCService *)self queue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __83__CoreRCXPCService_CEC__performSetSystemAudioControlEnabled_withDeviceAsync_reply___block_invoke;
    v13[3] = &unk_2652E4E90;
    BOOL v14 = a3;
    v13[4] = self;
    void v13[5] = a4;
    BOOL v15 = v9;
    v13[6] = a5;
    dispatch_async((dispatch_queue_t)v10, v13);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    BOOL v12 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v12(a5, v11);
  }
}

uint64_t __83__CoreRCXPCService_CEC__performSetSystemAudioControlEnabled_withDeviceAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performSetSystemAudioControlEnabled:*(unsigned __int8 *)(a1 + 56) withDeviceAsync:*(void *)(a1 + 40) allowRemoteDevice:*(unsigned __int8 *)(a1 + 57) reply:*(void *)(a1 + 48)];
}

- (void)_performSetSystemAudioControlEnabled:(BOOL)a3 withDeviceAsync:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6
{
  BOOL v9 = a3;
  uint64_t v18 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v17 = objc_opt_class();
    LogPrintF();
  }
  id v11 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
  if (!v11)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6727;
LABEL_12:
    uint64_t v13 = [v14 errorWithDomain:v15 code:v16 userInfo:0];
    uint64_t v18 = v13;
    goto LABEL_9;
  }
  BOOL v12 = v11;
  if (([v11 isLocalDevice] & 1) == 0 && !a5)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6773;
    goto LABEL_12;
  }
  [v12 setSystemAudioControlEnabled:v9 error:&v18];
  uint64_t v13 = v18;
LABEL_9:
  (*((void (**)(id, uint64_t))a6 + 2))(a6, v13);
}

- (void)performSystemAudioModeRequestAsync:(id)a3 withDesiredState:(unint64_t)a4 reply:(id)a5
{
  BOOL v9 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    id v10 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__CoreRCXPCService_CEC__performSystemAudioModeRequestAsync_withDesiredState_reply___block_invoke;
    block[3] = &unk_2652E3750;
    block[4] = self;
    block[5] = a3;
    BOOL v14 = v9;
    void block[6] = a5;
    void block[7] = a4;
    dispatch_async((dispatch_queue_t)v10, block);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    BOOL v12 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v12(a5, v11);
  }
}

uint64_t __83__CoreRCXPCService_CEC__performSystemAudioModeRequestAsync_withDesiredState_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performSystemAudioModeRequestAsync:*(void *)(a1 + 40) withDesiredState:*(void *)(a1 + 56) allowRemoteDevice:*(unsigned __int8 *)(a1 + 64) reply:*(void *)(a1 + 48)];
}

- (void)_performSystemAudioModeRequestAsync:(id)a3 withDesiredState:(unint64_t)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6
{
  uint64_t v18 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v17 = objc_opt_class();
    LogPrintF();
  }
  id v11 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a3];
  if (!v11)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6727;
LABEL_12:
    uint64_t v13 = [v14 errorWithDomain:v15 code:v16 userInfo:0];
    uint64_t v18 = v13;
    goto LABEL_9;
  }
  BOOL v12 = v11;
  if (([v11 isLocalDevice] & 1) == 0 && !a5)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6773;
    goto LABEL_12;
  }
  [v12 systemAudioModeRequest:a4 error:&v18];
  uint64_t v13 = v18;
LABEL_9:
  (*((void (**)(id, uint64_t))a6 + 2))(a6, v13);
}

- (void)performSetAudioReturnChannelControlEnabled:(BOOL)a3 withDeviceAsync:(id)a4 reply:(id)a5
{
  BOOL v9 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    id v10 = [(CoreRCXPCService *)self queue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __90__CoreRCXPCService_CEC__performSetAudioReturnChannelControlEnabled_withDeviceAsync_reply___block_invoke;
    v13[3] = &unk_2652E4E90;
    BOOL v14 = a3;
    v13[4] = self;
    void v13[5] = a4;
    BOOL v15 = v9;
    v13[6] = a5;
    dispatch_async((dispatch_queue_t)v10, v13);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    BOOL v12 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v12(a5, v11);
  }
}

uint64_t __90__CoreRCXPCService_CEC__performSetAudioReturnChannelControlEnabled_withDeviceAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performSetAudioReturnChannelControlEnabled:*(unsigned __int8 *)(a1 + 56) withDeviceAsync:*(void *)(a1 + 40) allowRemoteDevice:*(unsigned __int8 *)(a1 + 57) reply:*(void *)(a1 + 48)];
}

- (void)_performSetAudioReturnChannelControlEnabled:(BOOL)a3 withDeviceAsync:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6
{
  BOOL v9 = a3;
  uint64_t v18 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v17 = objc_opt_class();
    LogPrintF();
  }
  id v11 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
  if (!v11)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6727;
LABEL_12:
    uint64_t v13 = [v14 errorWithDomain:v15 code:v16 userInfo:0];
    uint64_t v18 = v13;
    goto LABEL_9;
  }
  BOOL v12 = v11;
  if (([v11 isLocalDevice] & 1) == 0 && !a5)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6773;
    goto LABEL_12;
  }
  [v12 setAudioReturnChannelControlEnabled:v9 error:&v18];
  uint64_t v13 = v18;
LABEL_9:
  (*((void (**)(id, uint64_t))a6 + 2))(a6, v13);
}

- (void)performRequestAudioReturnChannelStatusChangeTo:(unint64_t)a3 withDeviceAsync:(id)a4 reply:(id)a5
{
  BOOL v9 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    id v10 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __94__CoreRCXPCService_CEC__performRequestAudioReturnChannelStatusChangeTo_withDeviceAsync_reply___block_invoke;
    block[3] = &unk_2652E3750;
    block[4] = self;
    block[5] = a4;
    BOOL v14 = v9;
    void block[6] = a5;
    void block[7] = a3;
    dispatch_async((dispatch_queue_t)v10, block);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    BOOL v12 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v12(a5, v11);
  }
}

uint64_t __94__CoreRCXPCService_CEC__performRequestAudioReturnChannelStatusChangeTo_withDeviceAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performRequestAudioReturnChannelStatusChangeTo:*(void *)(a1 + 56) withDeviceAsync:*(void *)(a1 + 40) allowRemoteDevice:*(unsigned __int8 *)(a1 + 64) reply:*(void *)(a1 + 48)];
}

- (void)_performRequestAudioReturnChannelStatusChangeTo:(unint64_t)a3 withDeviceAsync:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6
{
  uint64_t v18 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v17 = objc_opt_class();
    LogPrintF();
  }
  id v11 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
  if (!v11)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6727;
LABEL_12:
    uint64_t v13 = [v14 errorWithDomain:v15 code:v16 userInfo:0];
    uint64_t v18 = v13;
    goto LABEL_9;
  }
  BOOL v12 = v11;
  if (([v11 isLocalDevice] & 1) == 0 && !a5)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6773;
    goto LABEL_12;
  }
  [v12 requestAudioReturnChannelStatusChangeTo:a3 error:&v18];
  uint64_t v13 = v18;
LABEL_9:
  (*((void (**)(id, uint64_t))a6 + 2))(a6, v13);
}

- (void)performSetAudioVolumeStatus:(unint64_t)a3 withDeviceAsync:(id)a4 reply:(id)a5
{
  BOOL v9 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    id v10 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__CoreRCXPCService_CEC__performSetAudioVolumeStatus_withDeviceAsync_reply___block_invoke;
    block[3] = &unk_2652E3750;
    block[4] = self;
    block[5] = a4;
    BOOL v14 = v9;
    void block[6] = a5;
    void block[7] = a3;
    dispatch_async((dispatch_queue_t)v10, block);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    BOOL v12 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v12(a5, v11);
  }
}

uint64_t __75__CoreRCXPCService_CEC__performSetAudioVolumeStatus_withDeviceAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performSetAudioVolumeStatus:*(void *)(a1 + 56) withDeviceAsync:*(void *)(a1 + 40) allowRemoteDevice:*(unsigned __int8 *)(a1 + 64) reply:*(void *)(a1 + 48)];
}

- (void)_performSetAudioVolumeStatus:(unint64_t)a3 withDeviceAsync:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6
{
  uint64_t v19 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v17 = objc_opt_class();
    unint64_t v18 = a3;
    LogPrintF();
  }
  id v11 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
  if (!v11)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6727;
LABEL_12:
    uint64_t v13 = [v14 errorWithDomain:v15 code:v16 userInfo:0];
    uint64_t v19 = v13;
    goto LABEL_9;
  }
  BOOL v12 = v11;
  if (([v11 isLocalDevice] & 1) == 0 && !a5)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6773;
    goto LABEL_12;
  }
  [v12 setAudioVolumeStatus:a3 error:&v19];
  uint64_t v13 = v19;
LABEL_9:
  (*((void (**)(id, uint64_t))a6 + 2))(a6, v13);
}

- (void)performSetAudioMuteStatus:(BOOL)a3 withDeviceAsync:(id)a4 reply:(id)a5
{
  BOOL v9 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    id v10 = [(CoreRCXPCService *)self queue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __73__CoreRCXPCService_CEC__performSetAudioMuteStatus_withDeviceAsync_reply___block_invoke;
    v13[3] = &unk_2652E4E90;
    BOOL v14 = a3;
    v13[4] = self;
    void v13[5] = a4;
    BOOL v15 = v9;
    v13[6] = a5;
    dispatch_async((dispatch_queue_t)v10, v13);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    BOOL v12 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v12(a5, v11);
  }
}

uint64_t __73__CoreRCXPCService_CEC__performSetAudioMuteStatus_withDeviceAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performSetAudioMuteStatus:*(unsigned __int8 *)(a1 + 56) withDeviceAsync:*(void *)(a1 + 40) allowRemoteDevice:*(unsigned __int8 *)(a1 + 57) reply:*(void *)(a1 + 48)];
}

- (void)_performSetAudioMuteStatus:(BOOL)a3 withDeviceAsync:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6
{
  BOOL v9 = a3;
  uint64_t v21 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v11 = objc_opt_class();
    BOOL v12 = "NO";
    if (v9) {
      BOOL v12 = "YES";
    }
    uint64_t v19 = v11;
    uint64_t v20 = v12;
    LogPrintF();
  }
  id v13 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
  if (!v13)
  {
    uint64_t v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08410];
    uint64_t v18 = -6727;
LABEL_14:
    uint64_t v15 = [v16 errorWithDomain:v17 code:v18 userInfo:0];
    uint64_t v21 = v15;
    goto LABEL_11;
  }
  BOOL v14 = v13;
  if (([v13 isLocalDevice] & 1) == 0 && !a5)
  {
    uint64_t v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08410];
    uint64_t v18 = -6773;
    goto LABEL_14;
  }
  [v14 setAudioMuteStatus:v9 error:&v21];
  uint64_t v15 = v21;
LABEL_11:
  (*((void (**)(id, uint64_t))a6 + 2))(a6, v15);
}

- (void)performSetSupportedAudioFormats:(id)a3 withDeviceAsync:(id)a4 reply:(id)a5
{
  BOOL v9 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    id v10 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__CoreRCXPCService_CEC__performSetSupportedAudioFormats_withDeviceAsync_reply___block_invoke;
    block[3] = &unk_2652E4EE0;
    block[4] = self;
    block[5] = a3;
    BOOL v14 = v9;
    void block[6] = a4;
    void block[7] = a5;
    dispatch_async((dispatch_queue_t)v10, block);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    BOOL v12 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v12(a5, v11);
  }
}

uint64_t __79__CoreRCXPCService_CEC__performSetSupportedAudioFormats_withDeviceAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performSetSupportedAudioFormats:*(void *)(a1 + 40) withDeviceAsync:*(void *)(a1 + 48) allowRemoteDevice:*(unsigned __int8 *)(a1 + 64) reply:*(void *)(a1 + 56)];
}

- (void)_performSetSupportedAudioFormats:(id)a3 withDeviceAsync:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6
{
  uint64_t v18 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v17 = objc_opt_class();
    LogPrintF();
  }
  id v11 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
  if (!v11)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6727;
LABEL_12:
    uint64_t v13 = [v14 errorWithDomain:v15 code:v16 userInfo:0];
    uint64_t v18 = v13;
    goto LABEL_9;
  }
  BOOL v12 = v11;
  if (([v11 isLocalDevice] & 1) == 0 && !a5)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6773;
    goto LABEL_12;
  }
  [v12 setSupportedAudioFormats:a3 error:&v18];
  uint64_t v13 = v18;
LABEL_9:
  (*((void (**)(id, uint64_t))a6 + 2))(a6, v13);
}

- (void)performSetTrackAudioStatusEnabled:(BOOL)a3 pressTimeout:(int64_t)a4 pollInterval:(int64_t)a5 withDeviceAsync:(id)a6 reply:(id)a7
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    uint64_t v13 = [(CoreRCXPCService *)self queue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __107__CoreRCXPCService_CEC__performSetTrackAudioStatusEnabled_pressTimeout_pollInterval_withDeviceAsync_reply___block_invoke;
    v16[3] = &unk_2652E4F08;
    BOOL v17 = a3;
    v16[7] = a4;
    v16[8] = a5;
    v16[4] = self;
    v16[5] = a6;
    v16[6] = a7;
    dispatch_async((dispatch_queue_t)v13, v16);
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    uint64_t v15 = (void (*)(id, uint64_t))*((void *)a7 + 2);
    v15(a7, v14);
  }
}

uint64_t __107__CoreRCXPCService_CEC__performSetTrackAudioStatusEnabled_pressTimeout_pollInterval_withDeviceAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performSetTrackAudioStatusEnabled:*(unsigned __int8 *)(a1 + 72) pressTimeout:*(void *)(a1 + 56) pollInterval:*(void *)(a1 + 64) withDeviceAsync:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)_performSetTrackAudioStatusEnabled:(BOOL)a3 pressTimeout:(int64_t)a4 pollInterval:(int64_t)a5 withDeviceAsync:(id)a6 reply:(id)a7
{
  BOOL v11 = a3;
  uint64_t v16 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v15 = objc_opt_class();
    LogPrintF();
  }
  id v13 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a6];
  if (v13)
  {
    [v13 setTrackAudioStatusEnabled:v11 pressTimeout:a4 pollInterval:a5 error:&v16];
    uint64_t v14 = v16;
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    uint64_t v16 = v14;
  }
  (*((void (**)(id, uint64_t))a7 + 2))(a7, v14);
}

- (void)performRequestAudioStatusAsync:(id)a3 reply:(id)a4
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    BOOL v7 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__CoreRCXPCService_CEC__performRequestAudioStatusAsync_reply___block_invoke;
    block[3] = &unk_2652E3728;
    block[4] = self;
    block[5] = a3;
    void block[6] = a4;
    dispatch_async((dispatch_queue_t)v7, block);
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    BOOL v9 = (void (*)(id, uint64_t))*((void *)a4 + 2);
    v9(a4, v8);
  }
}

uint64_t __62__CoreRCXPCService_CEC__performRequestAudioStatusAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performRequestAudioStatusAsync:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)_performRequestAudioStatusAsync:(id)a3 reply:(id)a4
{
  uint64_t v10 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = objc_opt_class();
    LogPrintF();
  }
  id v7 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a3];
  if (v7)
  {
    [v7 requestAudioStatus:&v10];
    uint64_t v8 = v10;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
    uint64_t v10 = v8;
  }
  (*((void (**)(id, uint64_t))a4 + 2))(a4, v8);
}

- (void)performRequestSystemAudioModeStatusChangeTo:(unint64_t)a3 withDeviceAsync:(id)a4 reply:(id)a5
{
  BOOL v9 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    uint64_t v10 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __91__CoreRCXPCService_CEC__performRequestSystemAudioModeStatusChangeTo_withDeviceAsync_reply___block_invoke;
    block[3] = &unk_2652E3750;
    block[4] = self;
    block[5] = a4;
    BOOL v14 = v9;
    void block[6] = a5;
    void block[7] = a3;
    dispatch_async((dispatch_queue_t)v10, block);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    BOOL v12 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v12(a5, v11);
  }
}

uint64_t __91__CoreRCXPCService_CEC__performRequestSystemAudioModeStatusChangeTo_withDeviceAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performRequestSystemAudioModeStatusChangeTo:*(void *)(a1 + 56) withDeviceAsync:*(void *)(a1 + 40) allowRemoteDevice:*(unsigned __int8 *)(a1 + 64) reply:*(void *)(a1 + 48)];
}

- (void)_performRequestSystemAudioModeStatusChangeTo:(unint64_t)a3 withDeviceAsync:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6
{
  uint64_t v18 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v17 = objc_opt_class();
    LogPrintF();
  }
  id v11 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
  if (!v11)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6727;
LABEL_12:
    uint64_t v13 = [v14 errorWithDomain:v15 code:v16 userInfo:0];
    uint64_t v18 = v13;
    goto LABEL_9;
  }
  BOOL v12 = v11;
  if (([v11 isLocalDevice] & 1) == 0 && !a5)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6773;
    goto LABEL_12;
  }
  [v12 requestSystemAudioModeStatusChangeTo:a3 error:&v18];
  uint64_t v13 = v18;
LABEL_9:
  (*((void (**)(id, uint64_t))a6 + 2))(a6, v13);
}

- (void)performSetPowerStatus:(unint64_t)a3 withDeviceAsync:(id)a4 reply:(id)a5
{
  BOOL v9 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    uint64_t v10 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__CoreRCXPCService_CEC__performSetPowerStatus_withDeviceAsync_reply___block_invoke;
    block[3] = &unk_2652E3750;
    block[4] = self;
    block[5] = a4;
    BOOL v14 = v9;
    void block[6] = a5;
    void block[7] = a3;
    dispatch_async((dispatch_queue_t)v10, block);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    BOOL v12 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v12(a5, v11);
  }
}

uint64_t __69__CoreRCXPCService_CEC__performSetPowerStatus_withDeviceAsync_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performSetPowerStatus:*(void *)(a1 + 56) withDeviceAsync:*(void *)(a1 + 40) allowRemoteDevice:*(unsigned __int8 *)(a1 + 64) reply:*(void *)(a1 + 48)];
}

- (void)_performSetPowerStatus:(unint64_t)a3 withDeviceAsync:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6
{
  uint64_t v18 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v17 = objc_opt_class();
    LogPrintF();
  }
  id v11 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
  if (!v11)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6727;
LABEL_12:
    uint64_t v13 = [v14 errorWithDomain:v15 code:v16 userInfo:0];
    uint64_t v18 = v13;
    goto LABEL_9;
  }
  BOOL v12 = v11;
  if (([v11 isLocalDevice] & 1) == 0 && !a5)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6773;
    goto LABEL_12;
  }
  [v12 setPowerStatus:a3 error:&v18];
  uint64_t v13 = v18;
LABEL_9:
  (*((void (**)(id, uint64_t))a6 + 2))(a6, v13);
}

- (void)performStandbyAsync:(id)a3 targetDevice:(id)a4 reply:(id)a5
{
  BOOL v9 = [(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    uint64_t v10 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__CoreRCXPCService_CEC__performStandbyAsync_targetDevice_reply___block_invoke;
    block[3] = &unk_2652E4EE0;
    block[4] = self;
    block[5] = a3;
    BOOL v14 = v9;
    void block[6] = a4;
    void block[7] = a5;
    dispatch_async((dispatch_queue_t)v10, block);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    BOOL v12 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v12(a5, v11);
  }
}

uint64_t __64__CoreRCXPCService_CEC__performStandbyAsync_targetDevice_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performStandbyAsync:*(void *)(a1 + 40) targetDevice:*(void *)(a1 + 48) allowRemoteDevice:*(unsigned __int8 *)(a1 + 64) reply:*(void *)(a1 + 56)];
}

- (void)_performStandbyAsync:(id)a3 targetDevice:(id)a4 allowRemoteDevice:(BOOL)a5 reply:(id)a6
{
  uint64_t v21 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    id v19 = a3;
    id v20 = a4;
    uint64_t v18 = objc_opt_class();
    LogPrintF();
  }
  id v11 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a3];
  if (!v11) {
    goto LABEL_10;
  }
  BOOL v12 = v11;
  if (([v11 isLocalDevice] & 1) == 0 && !a5)
  {
    BOOL v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6773;
    goto LABEL_15;
  }
  if (a4)
  {
    id v13 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedDeviceEquivalentTo:a4];
    if (!v13)
    {
LABEL_10:
      BOOL v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = *MEMORY[0x263F08410];
      uint64_t v16 = -6727;
LABEL_15:
      uint64_t v17 = [v14 errorWithDomain:v15 code:v16 userInfo:0];
      uint64_t v21 = v17;
      goto LABEL_13;
    }
  }
  else
  {
    id v13 = 0;
  }
  [v12 performStandbyWithTargetDevice:v13 error:&v21];
  uint64_t v17 = v21;
LABEL_13:
  (*((void (**)(id, uint64_t))a6 + 2))(a6, v17);
}

- (void)queryLocalInstanceAsync:(id)a3 bus:(id)a4 reply:(id)a5
{
  uint64_t v9 = [MEMORY[0x263F08D68] currentConnection];
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    uint64_t v10 = [(CoreRCXPCService *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__CoreRCXPCService_CEC__queryLocalInstanceAsync_bus_reply___block_invoke;
    block[3] = &unk_2652E4D68;
    block[4] = self;
    block[5] = a3;
    void block[6] = a4;
    void block[7] = v9;
    void block[8] = a5;
    dispatch_async((dispatch_queue_t)v10, block);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    BOOL v12 = (void (*)(id, void, uint64_t))*((void *)a5 + 2);
    v12(a5, 0, v11);
  }
}

uint64_t __59__CoreRCXPCService_CEC__queryLocalInstanceAsync_bus_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryLocalInstanceAsync:*(void *)(a1 + 40) bus:*(void *)(a1 + 48) client:*(void *)(a1 + 56) reply:*(void *)(a1 + 64)];
}

- (void)_queryLocalInstanceAsync:(id)a3 bus:(id)a4 client:(id)a5 reply:(id)a6
{
  uint64_t v17 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v15 = objc_opt_class();
    LogPrintF();
  }
  id v11 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedBusEquivalentTo:a4];
  if (v11)
  {
    BOOL v12 = v11;
    if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
    {
      uint64_t v16 = v12;
      LogPrintF();
    }
    id v13 = objc_msgSend(v12, "addDeviceWithAttributes:error:", a3, &v17, v16);
    BOOL v14 = v13;
    if (v13) {
      [v13 addOwningClient:a5];
    }
  }
  else
  {
    BOOL v14 = 0;
    uint64_t v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
  }
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  (*((void (**)(id, void *, uint64_t))a6 + 2))(a6, v14, v17);
}

- (void)performRemoveDeviceWithTypeAsync:(unint64_t)a3 bus:(id)a4 reply:(id)a5
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    uint64_t v9 = [(CoreRCXPCService *)self queue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __68__CoreRCXPCService_CEC__performRemoveDeviceWithTypeAsync_bus_reply___block_invoke;
    v11[3] = &unk_2652E3910;
    v11[4] = self;
    v11[5] = a4;
    v11[6] = a5;
    void v11[7] = a3;
    dispatch_async((dispatch_queue_t)v9, v11);
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
  }
  (*((void (**)(id, uint64_t))a5 + 2))(a5, v10);
}

uint64_t __68__CoreRCXPCService_CEC__performRemoveDeviceWithTypeAsync_bus_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performRemoveDeviceWithTypeAsync:*(void *)(a1 + 56) bus:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)_performRemoveDeviceWithTypeAsync:(unint64_t)a3 bus:(id)a4 reply:(id)a5
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    unint64_t v10 = a3;
    id v11 = a4;
    uint64_t v9 = objc_opt_class();
    LogPrintF();
  }
  id v8 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedBusEquivalentTo:a4];
  if (v8)
  {
    [v8 removeDeviceWithType:a3];
    if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
    {
      objc_opt_class();
LABEL_11:
      LogPrintF();
    }
  }
  else if (gLogCategory_CoreRCXPC <= 90 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_11;
  }
}

- (void)setOsdNameAsync:(id)a3 forBus:(id)a4 reply:(id)a5
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.control"])
  {
    uint64_t v9 = [(CoreRCXPCService *)self queue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __54__CoreRCXPCService_CEC__setOsdNameAsync_forBus_reply___block_invoke;
    v12[3] = &unk_2652E3870;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = a4;
    void v12[7] = a5;
    dispatch_async((dispatch_queue_t)v9, v12);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    id v11 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v11(a5, v10);
  }
}

uint64_t __54__CoreRCXPCService_CEC__setOsdNameAsync_forBus_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setOsdNameAsync:*(void *)(a1 + 40) forBus:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
}

- (void)_setOsdNameAsync:(id)a3 forBus:(id)a4 reply:(id)a5
{
  uint64_t v13 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    id v11 = a3;
    id v12 = a4;
    uint64_t v10 = objc_opt_class();
    LogPrintF();
  }
  id v9 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedBusEquivalentTo:a4];
  if (v9)
  {
    [v9 setOSDName:a3 error:&v13];
    if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
    {
      objc_opt_class();
      LogPrintF();
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
  }
  (*((void (**)(id, uint64_t))a5 + 2))(a5, v13);
}

- (void)setTvLanguageCodeAsync:(id)a3 forBus:(id)a4 reply:(id)a5
{
  if ([(CoreRCXPCService *)self checkEntitlement:@"com.apple.private.cecd.private"])
  {
    id v9 = [(CoreRCXPCService *)self queue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __61__CoreRCXPCService_CEC__setTvLanguageCodeAsync_forBus_reply___block_invoke;
    v12[3] = &unk_2652E3870;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = a4;
    void v12[7] = a5;
    dispatch_async((dispatch_queue_t)v9, v12);
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6773 userInfo:0];
    id v11 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v11(a5, v10);
  }
}

uint64_t __61__CoreRCXPCService_CEC__setTvLanguageCodeAsync_forBus_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setTvLanguageCodeAsync:*(void *)(a1 + 40) forBus:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
}

- (void)_setTvLanguageCodeAsync:(id)a3 forBus:(id)a4 reply:(id)a5
{
  uint64_t v13 = 0;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    id v11 = a3;
    id v12 = a4;
    uint64_t v10 = objc_opt_class();
    LogPrintF();
  }
  id v9 = [(CoreRCManager *)[(CoreRCXPCService *)self manager] managedBusEquivalentTo:a4];
  if (v9)
  {
    [v9 setTvLanguageCode:a3 error:&v13];
    if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
    {
      objc_opt_class();
      LogPrintF();
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6727 userInfo:0];
  }
  (*((void (**)(id, uint64_t))a5 + 2))(a5, v13);
}

- (void)cecBus:(id)a3 activeSourceHasChangedTo:(id)a4 fromDevice:(id)a5
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = a3;
    LogPrintF();
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__CoreRCXPCService_CEC__cecBus_activeSourceHasChangedTo_fromDevice___block_invoke;
  v11[3] = &unk_2652E4DE0;
  v11[4] = a3;
  v11[5] = a4;
  v11[6] = a5;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.control", v11, v9, v10 usingBlock];
}

uint64_t __68__CoreRCXPCService_CEC__cecBus_activeSourceHasChangedTo_fromDevice___block_invoke(void *a1, void *a2)
{
  return [a2 cecBus:a1[4] activeSourceHasChangedTo:a1[5] fromDevice:a1[6]];
}

- (void)cecDeviceShouldAssertActiveSource:(id)a3
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = a3;
    LogPrintF();
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__CoreRCXPCService_CEC__cecDeviceShouldAssertActiveSource___block_invoke;
  v7[3] = &unk_2652E39B0;
  v7[4] = a3;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.control", v7, v5, v6 usingBlock];
}

uint64_t __59__CoreRCXPCService_CEC__cecDeviceShouldAssertActiveSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cecDeviceShouldAssertActiveSource:*(void *)(a1 + 32)];
}

- (void)cecDevice:(id)a3 activeSourceStatusHasChanged:(BOOL)a4
{
  BOOL v4 = a4;
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = "NO";
    if (v4) {
      id v8 = "YES";
    }
    id v10 = a3;
    id v11 = v8;
    uint64_t v9 = v7;
    LogPrintF();
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__CoreRCXPCService_CEC__cecDevice_activeSourceStatusHasChanged___block_invoke;
  v12[3] = &unk_2652E4F30;
  v12[4] = a3;
  BOOL v13 = v4;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer", v12, v9, v10, v11 usingBlock];
}

uint64_t __64__CoreRCXPCService_CEC__cecDevice_activeSourceStatusHasChanged___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cecDevice:*(void *)(a1 + 32) activeSourceStatusHasChanged:*(unsigned __int8 *)(a1 + 40)];
}

- (void)cecDevice:(id)a3 deckControlPlayHasBeenReceived:(unint64_t)a4 fromDevice:(id)a5
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v12 = CoreCECPlayModeString(a4);
    id v13 = a5;
    uint64_t v10 = v9;
    id v11 = a3;
    LogPrintF();
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77__CoreRCXPCService_CEC__cecDevice_deckControlPlayHasBeenReceived_fromDevice___block_invoke;
  v14[3] = &unk_2652E3988;
  v14[5] = a5;
  v14[6] = a4;
  v14[4] = a3;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer", v14, v10, v11, v12, v13 usingBlock];
}

uint64_t __77__CoreRCXPCService_CEC__cecDevice_deckControlPlayHasBeenReceived_fromDevice___block_invoke(void *a1, void *a2)
{
  return [a2 cecDevice:a1[4] deckControlPlayHasBeenReceived:a1[6] fromDevice:a1[5]];
}

- (void)cecDevice:(id)a3 deckControlCommandHasBeenReceived:(unint64_t)a4 fromDevice:(id)a5
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v12 = CoreCECDeckControlModeString(a4);
    id v13 = a5;
    uint64_t v10 = v9;
    id v11 = a3;
    LogPrintF();
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __80__CoreRCXPCService_CEC__cecDevice_deckControlCommandHasBeenReceived_fromDevice___block_invoke;
  v14[3] = &unk_2652E3988;
  v14[5] = a5;
  v14[6] = a4;
  v14[4] = a3;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer", v14, v10, v11, v12, v13 usingBlock];
}

uint64_t __80__CoreRCXPCService_CEC__cecDevice_deckControlCommandHasBeenReceived_fromDevice___block_invoke(void *a1, void *a2)
{
  return [a2 cecDevice:a1[4] deckControlCommandHasBeenReceived:a1[6] fromDevice:a1[5]];
}

- (void)cecDevice:(id)a3 deckControlStatusHasBeenUpdated:(unint64_t)a4 fromDevice:(id)a5
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v12 = CoreCECDeckInfoString(a4);
    id v13 = a5;
    uint64_t v10 = v9;
    id v11 = a3;
    LogPrintF();
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__CoreRCXPCService_CEC__cecDevice_deckControlStatusHasBeenUpdated_fromDevice___block_invoke;
  v14[3] = &unk_2652E3988;
  v14[5] = a5;
  v14[6] = a4;
  v14[4] = a3;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer", v14, v10, v11, v12, v13 usingBlock];
}

uint64_t __78__CoreRCXPCService_CEC__cecDevice_deckControlStatusHasBeenUpdated_fromDevice___block_invoke(void *a1, void *a2)
{
  return [a2 cecDevice:a1[4] deckControlStatusHasBeenUpdated:a1[6] fromDevice:a1[5]];
}

- (void)cecDevice:(id)a3 featureAbort:(id)a4
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    id v8 = a3;
    id v9 = a4;
    uint64_t v7 = objc_opt_class();
    LogPrintF();
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__CoreRCXPCService_CEC__cecDevice_featureAbort___block_invoke;
  v10[3] = &unk_2652E3938;
  v10[4] = a3;
  v10[5] = a4;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer", v10, v7, v8, v9 usingBlock];
}

uint64_t __48__CoreRCXPCService_CEC__cecDevice_featureAbort___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cecDevice:*(void *)(a1 + 32) featureAbort:*(void *)(a1 + 40)];
}

- (void)cecDevice:(id)a3 standbyRequestHasBeenReceived:(id)a4
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    id v8 = a3;
    id v9 = a4;
    uint64_t v7 = objc_opt_class();
    LogPrintF();
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__CoreRCXPCService_CEC__cecDevice_standbyRequestHasBeenReceived___block_invoke;
  v10[3] = &unk_2652E3938;
  v10[4] = a3;
  v10[5] = a4;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer", v10, v7, v8, v9 usingBlock];
}

uint64_t __65__CoreRCXPCService_CEC__cecDevice_standbyRequestHasBeenReceived___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cecDevice:*(void *)(a1 + 32) standbyRequestHasBeenReceived:*(void *)(a1 + 40)];
}

- (void)cecDevice:(id)a3 receivedRequestAudioReturnChannelStatusChangeTo:(unint64_t)a4 fromDevice:(id)a5
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v12 = CoreCECActivationStatusString(a4);
    id v13 = a5;
    uint64_t v10 = v9;
    id v11 = a3;
    LogPrintF();
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __94__CoreRCXPCService_CEC__cecDevice_receivedRequestAudioReturnChannelStatusChangeTo_fromDevice___block_invoke;
  v14[3] = &unk_2652E3988;
  v14[5] = a5;
  v14[6] = a4;
  v14[4] = a3;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer", v14, v10, v11, v12, v13 usingBlock];
}

uint64_t __94__CoreRCXPCService_CEC__cecDevice_receivedRequestAudioReturnChannelStatusChangeTo_fromDevice___block_invoke(void *a1, void *a2)
{
  return [a2 cecDevice:a1[4] receivedRequestAudioReturnChannelStatusChangeTo:a1[6] fromDevice:a1[5]];
}

- (void)cecDevice:(id)a3 requestAudioReturnChannelStatusChangeTo:(unint64_t)a4 didFinishWithResult:(BOOL)a5 error:(id)a6
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v11 = objc_opt_class();
    id v13 = a3;
    uint64_t v14 = CoreCECActivationStatusString(a4);
    uint64_t v12 = v11;
    LogPrintF();
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __101__CoreRCXPCService_CEC__cecDevice_requestAudioReturnChannelStatusChangeTo_didFinishWithResult_error___block_invoke;
  v15[3] = &unk_2652E4F58;
  v15[5] = a6;
  v15[6] = a4;
  BOOL v16 = a5;
  v15[4] = a3;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer", v15, v12, v13, v14 usingBlock];
}

uint64_t __101__CoreRCXPCService_CEC__cecDevice_requestAudioReturnChannelStatusChangeTo_didFinishWithResult_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cecDevice:*(void *)(a1 + 32) requestAudioReturnChannelStatusChangeTo:*(void *)(a1 + 48) didFinishWithResult:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 40)];
}

- (void)cecDevice:(id)a3 receivedRequestSystemAudioModeStatusChangeTo:(unint64_t)a4 fromDevice:(id)a5
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v12 = CoreCECActivationStatusString(a4);
    id v13 = a5;
    uint64_t v10 = v9;
    id v11 = a3;
    LogPrintF();
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __91__CoreRCXPCService_CEC__cecDevice_receivedRequestSystemAudioModeStatusChangeTo_fromDevice___block_invoke;
  v14[3] = &unk_2652E3988;
  v14[5] = a5;
  v14[6] = a4;
  v14[4] = a3;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer", v14, v10, v11, v12, v13 usingBlock];
}

uint64_t __91__CoreRCXPCService_CEC__cecDevice_receivedRequestSystemAudioModeStatusChangeTo_fromDevice___block_invoke(void *a1, void *a2)
{
  return [a2 cecDevice:a1[4] receivedRequestSystemAudioModeStatusChangeTo:a1[6] fromDevice:a1[5]];
}

- (void)cecDevice:(id)a3 requestSystemAudioModeStatusChangeTo:(unint64_t)a4 didFinishWithResult:(BOOL)a5 error:(id)a6
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v11 = objc_opt_class();
    id v13 = a3;
    uint64_t v14 = CoreCECActivationStatusString(a4);
    uint64_t v12 = v11;
    LogPrintF();
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __98__CoreRCXPCService_CEC__cecDevice_requestSystemAudioModeStatusChangeTo_didFinishWithResult_error___block_invoke;
  v15[3] = &unk_2652E4F58;
  v15[5] = a6;
  v15[6] = a4;
  BOOL v16 = a5;
  v15[4] = a3;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.observer", v15, v12, v13, v14 usingBlock];
}

uint64_t __98__CoreRCXPCService_CEC__cecDevice_requestSystemAudioModeStatusChangeTo_didFinishWithResult_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cecDevice:*(void *)(a1 + 32) requestSystemAudioModeStatusChangeTo:*(void *)(a1 + 48) didFinishWithResult:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 40)];
}

- (void)cecDevice:(id)a3 audioStatusReceived:(unint64_t)a4 muteStatus:(BOOL)a5
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = a3;
    LogPrintF();
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__CoreRCXPCService_CEC__cecDevice_audioStatusReceived_muteStatus___block_invoke;
  v11[3] = &unk_2652E4F80;
  v11[4] = a3;
  v11[5] = a4;
  BOOL v12 = a5;
  [(CoreRCXPCService *)self enumerateClientsHavingEntitlement:@"com.apple.private.cecd.control", v11, v9, v10 usingBlock];
}

uint64_t __66__CoreRCXPCService_CEC__cecDevice_audioStatusReceived_muteStatus___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cecDevice:*(void *)(a1 + 32) audioStatusReceived:*(void *)(a1 + 40) muteStatus:*(unsigned __int8 *)(a1 + 48)];
}

@end