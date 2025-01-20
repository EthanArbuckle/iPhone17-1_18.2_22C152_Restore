@interface CoreRCManagerClient
- (BOOL)sendCommand:(unint64_t)a3 fromDevice:(id)a4 toDevice:(id)a5 withDuration:(unint64_t)a6 error:(id *)a7;
- (BOOL)sendHIDEvent:(id)a3 fromDevice:(id)a4 toDevice:(id)a5 error:(id *)a6;
- (BOOL)setExtendedProperty:(id)a3 forKey:(id)a4 ofDevice:(id)a5 error:(id *)a6;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 ofBus:(id)a5 error:(id *)a6;
- (id)buses;
- (id)connection;
- (id)extendedPropertyForKey:(id)a3 ofDevice:(id)a4 error:(id *)a5;
- (id)propertyForKey:(id)a3 ofBus:(id)a4 error:(id *)a5;
- (void)addDeviceOnBusAsync:(id)a3 withType:(unint64_t)a4 matching:(id)a5 reply:(id)a6;
- (void)addDeviceOnBusAsync:(id)a3 withType:(unint64_t)a4 matching:(id)a5 withSessionOwningDevice:(id)a6 reply:(id)a7;
- (void)bus:(id)a3 deviceHasBeenAdded:(id)a4;
- (void)bus:(id)a3 deviceHasBeenRemoved:(id)a4;
- (void)bus:(id)a3 deviceHasBeenUpdated:(id)a4;
- (void)busHasBeenAdded:(id)a3;
- (void)busHasBeenRemoved:(id)a3;
- (void)busHasBeenUpdated:(id)a3;
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
- (void)connectionInterrupted;
- (void)dealloc;
- (void)deleteDeviceAsync:(id)a3 fromBus:(id)a4 reply:(id)a5;
- (void)device:(id)a3 receivedHIDEvent:(id)a4 fromDevice:(id)a5;
- (void)endLearningWithDeviceAsync:(id)a3 reply:(id)a4;
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
- (void)mergeBus:(id)a3;
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
- (void)setDelegate:(id)a3;
- (void)setExtendedPropertyAsync:(id)a3 forKey:(id)a4 ofDevice:(id)a5 reply:(id)a6;
- (void)setLogging:(id)a3;
- (void)setLoggingAsync:(id)a3 reply:(id)a4;
- (void)setOSDNameAsync:(id)a3 forDevice:(id)a4 reply:(id)a5;
- (void)setOsdNameAsync:(id)a3 forBus:(id)a4 reply:(id)a5;
- (void)setPairStateAsync:(BOOL)a3 forAppleRemote:(id)a4 reply:(id)a5;
- (void)setPropertyAsync:(id)a3 forKey:(id)a4 ofBus:(id)a5 reply:(id)a6;
- (void)setTvLanguageCodeAsync:(id)a3 forBus:(id)a4 reply:(id)a5;
- (void)startLearningCommandAsync:(unint64_t)a3 withDevice:(id)a4 reply:(id)a5;
- (void)startLearningSessionWithDeviceAsync:(id)a3 forReason:(id)a4 reply:(id)a5;
- (void)synchBuses:(id)a3;
- (void)updateMappingWithSessionOwningDeviceAsync:(id)a3 forTargetDevice:(id)a4 reply:(id)a5;
@end

@implementation CoreRCManagerClient

- (void)performActiveSourceAsync:(id)a3 withMenus:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  v8 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a5);
  [v8 performActiveSourceAsync:a3 withMenus:v6 reply:a5];
}

- (void)performDeckControlSetDeckStatusAsync:(unint64_t)a3 forDevice:(id)a4 reply:(id)a5
{
  v8 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a5);
  [v8 performDeckControlSetDeckStatusAsync:a3 forDevice:a4 reply:a5];
}

- (void)performDeckControlCommandAsync:(id)a3 controlMode:(unint64_t)a4 targetDevice:(id)a5 reply:(id)a6
{
  v10 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a6);
  [v10 performDeckControlCommandAsync:a3 controlMode:a4 targetDevice:a5 reply:a6];
}

- (void)performDeckControlPlayAsync:(id)a3 playMode:(unint64_t)a4 targetDevice:(id)a5 reply:(id)a6
{
  v10 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a6);
  [v10 performDeckControlPlayAsync:a3 playMode:a4 targetDevice:a5 reply:a6];
}

- (void)performDeckControlRefreshStatusAsync:(id)a3 targetDevice:(id)a4 requestType:(unint64_t)a5 reply:(id)a6
{
  v10 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a6);
  [v10 performDeckControlRefreshStatusAsync:a3 targetDevice:a4 requestType:a5 reply:a6];
}

- (void)performInactiveSourceAsync:(id)a3 reply:(id)a4
{
  BOOL v6 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a4);
  [v6 performInactiveSourceAsync:a3 reply:a4];
}

- (void)performRefreshDevicesAsync:(id)a3 reply:(id)a4
{
  BOOL v6 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a4);
  [v6 performRefreshDevicesAsync:a3 reply:a4];
}

- (void)performRefreshProperties:(id)a3 ofDevice:(id)a4 withDeviceAsync:(id)a5 reply:(id)a6
{
  v10 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a6);
  [v10 performRefreshProperties:a3 ofDevice:a4 withDeviceAsync:a5 reply:a6];
}

- (void)performRequestActiveSourceAsync:(id)a3 reply:(id)a4
{
  BOOL v6 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a4);
  [v6 performRequestActiveSourceAsync:a3 reply:a4];
}

- (void)performSetSystemAudioControlEnabled:(BOOL)a3 withDeviceAsync:(id)a4 reply:(id)a5
{
  BOOL v7 = a3;
  v8 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a5);
  [v8 performSetSystemAudioControlEnabled:v7 withDeviceAsync:a4 reply:a5];
}

- (void)performSystemAudioModeRequestAsync:(id)a3 withDesiredState:(unint64_t)a4 reply:(id)a5
{
  v8 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a5);
  [v8 performSystemAudioModeRequestAsync:a3 withDesiredState:a4 reply:a5];
}

- (void)performSetAudioReturnChannelControlEnabled:(BOOL)a3 withDeviceAsync:(id)a4 reply:(id)a5
{
  BOOL v7 = a3;
  v8 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a5);
  [v8 performSetAudioReturnChannelControlEnabled:v7 withDeviceAsync:a4 reply:a5];
}

- (void)performRequestAudioReturnChannelStatusChangeTo:(unint64_t)a3 withDeviceAsync:(id)a4 reply:(id)a5
{
  v8 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a5);
  [v8 performRequestAudioReturnChannelStatusChangeTo:a3 withDeviceAsync:a4 reply:a5];
}

- (void)performSetAudioVolumeStatus:(unint64_t)a3 withDeviceAsync:(id)a4 reply:(id)a5
{
  v8 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a5);
  [v8 performSetAudioVolumeStatus:a3 withDeviceAsync:a4 reply:a5];
}

- (void)performSetAudioMuteStatus:(BOOL)a3 withDeviceAsync:(id)a4 reply:(id)a5
{
  BOOL v7 = a3;
  v8 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a5);
  [v8 performSetAudioMuteStatus:v7 withDeviceAsync:a4 reply:a5];
}

- (void)performSetSupportedAudioFormats:(id)a3 withDeviceAsync:(id)a4 reply:(id)a5
{
  v8 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a5);
  [v8 performSetSupportedAudioFormats:a3 withDeviceAsync:a4 reply:a5];
}

- (void)performSetTrackAudioStatusEnabled:(BOOL)a3 pressTimeout:(int64_t)a4 pollInterval:(int64_t)a5 withDeviceAsync:(id)a6 reply:(id)a7
{
  BOOL v11 = a3;
  v12 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a7);
  [v12 performSetTrackAudioStatusEnabled:v11 pressTimeout:a4 pollInterval:a5 withDeviceAsync:a6 reply:a7];
}

- (void)performRequestAudioStatusAsync:(id)a3 reply:(id)a4
{
  BOOL v6 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a4);
  [v6 performRequestAudioStatusAsync:a3 reply:a4];
}

- (void)performRequestSystemAudioModeStatusChangeTo:(unint64_t)a3 withDeviceAsync:(id)a4 reply:(id)a5
{
  v8 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a5);
  [v8 performRequestSystemAudioModeStatusChangeTo:a3 withDeviceAsync:a4 reply:a5];
}

- (void)performSetPowerStatus:(unint64_t)a3 withDeviceAsync:(id)a4 reply:(id)a5
{
  v8 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a5);
  [v8 performSetPowerStatus:a3 withDeviceAsync:a4 reply:a5];
}

- (void)performStandbyAsync:(id)a3 targetDevice:(id)a4 reply:(id)a5
{
  v8 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a5);
  [v8 performStandbyAsync:a3 targetDevice:a4 reply:a5];
}

- (void)queryLocalInstanceAsync:(id)a3 bus:(id)a4 reply:(id)a5
{
  id v8 = [(CoreRCManagerClient *)self connection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__CoreRCManagerClient_CEC__queryLocalInstanceAsync_bus_reply___block_invoke;
  v9[3] = &unk_2652E34D0;
  v9[4] = a5;
  objc_msgSend((id)objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v9), "queryLocalInstanceAsync:bus:reply:", a3, a4, a5);
}

uint64_t __62__CoreRCManagerClient_CEC__queryLocalInstanceAsync_bus_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performRemoveDeviceWithTypeAsync:(unint64_t)a3 bus:(id)a4 reply:(id)a5
{
  id v8 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a5);
  [v8 performRemoveDeviceWithTypeAsync:a3 bus:a4 reply:a5];
}

- (void)setOsdNameAsync:(id)a3 forBus:(id)a4 reply:(id)a5
{
  id v8 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a5);
  [v8 setOsdNameAsync:a3 forBus:a4 reply:a5];
}

- (void)setTvLanguageCodeAsync:(id)a3 forBus:(id)a4 reply:(id)a5
{
  id v8 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a5);
  [v8 setTvLanguageCodeAsync:a3 forBus:a4 reply:a5];
}

- (void)cecBus:(id)a3 activeSourceHasChangedTo:(id)a4 fromDevice:(id)a5
{
  v9 = [(CoreRCManager *)self serialQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__CoreRCManagerClient_CEC__cecBus_activeSourceHasChangedTo_fromDevice___block_invoke;
  v10[3] = &unk_2652E34F8;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = a5;
  v10[7] = self;
  dispatch_async((dispatch_queue_t)v9, v10);
}

void *__71__CoreRCManagerClient_CEC__cecBus_activeSourceHasChangedTo_fromDevice___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    long long v6 = *(_OWORD *)(a1 + 32);
    LogPrintF();
  }
  result = objc_msgSend(*(id *)(a1 + 56), "managedBusEquivalentTo:", *(void *)(a1 + 32), v6, v7);
  if (result)
  {
    v3 = result;
    if (*(void *)(a1 + 48)) {
      uint64_t v4 = objc_msgSend(result, "mergeDevice:");
    }
    else {
      uint64_t v4 = 0;
    }
    if (*(void *)(a1 + 40)) {
      uint64_t v5 = objc_msgSend(v3, "mergeDevice:");
    }
    else {
      uint64_t v5 = 0;
    }
    return (void *)[v3 didChangeActiveSourceFrom:v4 to:v5];
  }
  return result;
}

- (void)cecDeviceShouldAssertActiveSource:(id)a3
{
  uint64_t v5 = [(CoreRCManager *)self serialQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__CoreRCManagerClient_CEC__cecDeviceShouldAssertActiveSource___block_invoke;
  v6[3] = &unk_2652E3520;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)v5, v6);
}

void *__62__CoreRCManagerClient_CEC__cecDeviceShouldAssertActiveSource___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    LogPrintF();
  }
  result = objc_msgSend(*(id *)(a1 + 40), "managedDeviceEquivalentTo:", *(void *)(a1 + 32), v3);
  if (result)
  {
    return (void *)[result shouldAssertActiveSource];
  }
  return result;
}

- (void)cecDevice:(id)a3 activeSourceStatusHasChanged:(BOOL)a4
{
  uint64_t v7 = [(CoreRCManager *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__CoreRCManagerClient_CEC__cecDevice_activeSourceStatusHasChanged___block_invoke;
  block[3] = &unk_2652E3548;
  BOOL v9 = a4;
  block[4] = a3;
  block[5] = self;
  dispatch_async((dispatch_queue_t)v7, block);
}

void *__67__CoreRCManagerClient_CEC__cecDevice_activeSourceStatusHasChanged___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    if (*(unsigned char *)(a1 + 48)) {
      v2 = "YES";
    }
    else {
      v2 = "NO";
    }
    uint64_t v5 = *(void *)(a1 + 32);
    long long v6 = v2;
    LogPrintF();
  }
  result = objc_msgSend(*(id *)(a1 + 40), "managedDeviceEquivalentTo:", *(void *)(a1 + 32), v5, v6);
  if (result)
  {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
    return (void *)[result setIsActiveSource:v4];
  }
  return result;
}

- (void)cecDevice:(id)a3 deckControlPlayHasBeenReceived:(unint64_t)a4 fromDevice:(id)a5
{
  BOOL v9 = [(CoreRCManager *)self serialQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __80__CoreRCManagerClient_CEC__cecDevice_deckControlPlayHasBeenReceived_fromDevice___block_invoke;
  v10[3] = &unk_2652E3570;
  v10[4] = a3;
  v10[5] = a5;
  v10[6] = self;
  v10[7] = a4;
  dispatch_async((dispatch_queue_t)v9, v10);
}

uint64_t __80__CoreRCManagerClient_CEC__cecDevice_deckControlPlayHasBeenReceived_fromDevice___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v7 = CoreCECPlayModeString(*(void *)(a1 + 56));
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v6 = v2;
    LogPrintF();
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 48), "managedDeviceEquivalentTo:", *(void *)(a1 + 32), v6, v7, v8);
  if (result)
  {
    uint64_t v4 = (void *)result;
    uint64_t result = [*(id *)(a1 + 48) managedDeviceEquivalentTo:*(void *)(a1 + 40)];
    if (result)
    {
      uint64_t v5 = *(void *)(a1 + 56);
      return [v4 deckControlPlayHasBeenReceived:v5 fromDevice:result];
    }
  }
  return result;
}

- (void)cecDevice:(id)a3 deckControlCommandHasBeenReceived:(unint64_t)a4 fromDevice:(id)a5
{
  BOOL v9 = [(CoreRCManager *)self serialQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__CoreRCManagerClient_CEC__cecDevice_deckControlCommandHasBeenReceived_fromDevice___block_invoke;
  v10[3] = &unk_2652E3570;
  v10[4] = a3;
  v10[5] = a5;
  v10[6] = self;
  v10[7] = a4;
  dispatch_async((dispatch_queue_t)v9, v10);
}

uint64_t __83__CoreRCManagerClient_CEC__cecDevice_deckControlCommandHasBeenReceived_fromDevice___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v7 = CoreCECDeckControlModeString(*(void *)(a1 + 56));
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v6 = v2;
    LogPrintF();
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 48), "managedDeviceEquivalentTo:", *(void *)(a1 + 32), v6, v7, v8);
  if (result)
  {
    uint64_t v4 = (void *)result;
    uint64_t result = [*(id *)(a1 + 48) managedDeviceEquivalentTo:*(void *)(a1 + 40)];
    if (result)
    {
      uint64_t v5 = *(void *)(a1 + 56);
      return [v4 deckControlCommandHasBeenReceived:v5 fromDevice:result];
    }
  }
  return result;
}

- (void)cecDevice:(id)a3 deckControlStatusHasBeenUpdated:(unint64_t)a4 fromDevice:(id)a5
{
  BOOL v9 = [(CoreRCManager *)self serialQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__CoreRCManagerClient_CEC__cecDevice_deckControlStatusHasBeenUpdated_fromDevice___block_invoke;
  v10[3] = &unk_2652E3570;
  v10[4] = a3;
  v10[5] = a5;
  v10[6] = self;
  v10[7] = a4;
  dispatch_async((dispatch_queue_t)v9, v10);
}

uint64_t __81__CoreRCManagerClient_CEC__cecDevice_deckControlStatusHasBeenUpdated_fromDevice___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v7 = CoreCECDeckInfoString(*(void *)(a1 + 56));
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v6 = v2;
    LogPrintF();
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 48), "managedDeviceEquivalentTo:", *(void *)(a1 + 32), v6, v7, v8);
  if (result)
  {
    uint64_t v4 = (void *)result;
    uint64_t result = [*(id *)(a1 + 48) managedDeviceEquivalentTo:*(void *)(a1 + 40)];
    if (result)
    {
      uint64_t v5 = *(void *)(a1 + 56);
      return [v4 deckControlStatusHasBeenUpdated:v5 fromDevice:result];
    }
  }
  return result;
}

- (void)cecDevice:(id)a3 featureAbort:(id)a4
{
  uint64_t v7 = [(CoreRCManager *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__CoreRCManagerClient_CEC__cecDevice_featureAbort___block_invoke;
  block[3] = &unk_2652E3598;
  block[4] = a3;
  block[5] = a4;
  void block[6] = self;
  dispatch_async((dispatch_queue_t)v7, block);
}

void *__51__CoreRCManagerClient_CEC__cecDevice_featureAbort___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    LogPrintF();
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 48), "managedDeviceEquivalentTo:", *(void *)(a1 + 32), v4, v5);
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    return (void *)[result featureAbort:v3];
  }
  return result;
}

- (void)cecDevice:(id)a3 standbyRequestHasBeenReceived:(id)a4
{
  uint64_t v7 = [(CoreRCManager *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__CoreRCManagerClient_CEC__cecDevice_standbyRequestHasBeenReceived___block_invoke;
  block[3] = &unk_2652E3598;
  block[4] = a3;
  block[5] = a4;
  void block[6] = self;
  dispatch_async((dispatch_queue_t)v7, block);
}

uint64_t __68__CoreRCManagerClient_CEC__cecDevice_standbyRequestHasBeenReceived___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    LogPrintF();
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 48), "managedDeviceEquivalentTo:", *(void *)(a1 + 32), v5, v6);
  if (result)
  {
    uint64_t v3 = (void *)result;
    uint64_t v4 = [*(id *)(a1 + 48) managedDeviceEquivalentTo:*(void *)(a1 + 40)];
    return [v3 standbyRequestHasBeenReceived:v4];
  }
  return result;
}

- (void)cecDevice:(id)a3 receivedRequestAudioReturnChannelStatusChangeTo:(unint64_t)a4 fromDevice:(id)a5
{
  BOOL v9 = [(CoreRCManager *)self serialQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __97__CoreRCManagerClient_CEC__cecDevice_receivedRequestAudioReturnChannelStatusChangeTo_fromDevice___block_invoke;
  v10[3] = &unk_2652E3570;
  v10[4] = a3;
  v10[5] = a5;
  v10[6] = self;
  v10[7] = a4;
  dispatch_async((dispatch_queue_t)v9, v10);
}

uint64_t __97__CoreRCManagerClient_CEC__cecDevice_receivedRequestAudioReturnChannelStatusChangeTo_fromDevice___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v8 = CoreCECActivationStatusString(*(void *)(a1 + 56));
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v7 = v2;
    LogPrintF();
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 48), "managedDeviceEquivalentTo:", *(void *)(a1 + 32), v7, v8, v9);
  if (result)
  {
    uint64_t v4 = (void *)result;
    uint64_t v5 = [*(id *)(a1 + 48) managedDeviceEquivalentTo:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(a1 + 56);
    return [v4 receivedRequestAudioReturnChannelStatusChangeTo:v6 fromDevice:v5];
  }
  return result;
}

- (void)cecDevice:(id)a3 requestAudioReturnChannelStatusChangeTo:(unint64_t)a4 didFinishWithResult:(BOOL)a5 error:(id)a6
{
  BOOL v11 = [(CoreRCManager *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__CoreRCManagerClient_CEC__cecDevice_requestAudioReturnChannelStatusChangeTo_didFinishWithResult_error___block_invoke;
  block[3] = &unk_2652E35C0;
  BOOL v13 = a5;
  block[4] = a3;
  block[5] = a6;
  void block[6] = self;
  void block[7] = a4;
  dispatch_async((dispatch_queue_t)v11, block);
}

void *__104__CoreRCManagerClient_CEC__cecDevice_requestAudioReturnChannelStatusChangeTo_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = CoreCECActivationStatusString(*(void *)(a1 + 56));
    uint64_t v4 = @"YES";
    if (!*(unsigned char *)(a1 + 64)) {
      uint64_t v4 = @"NO";
    }
    BOOL v11 = v4;
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v9 = v2;
    uint64_t v10 = v3;
    LogPrintF();
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 48), "managedDeviceEquivalentTo:", *(void *)(a1 + 32), v9, v10, v11, v12);
  if (result)
  {
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 40);
    return (void *)[result requestAudioReturnChannelStatusChangeTo:v6 didFinishWithResult:v7 error:v8];
  }
  return result;
}

- (void)cecDevice:(id)a3 receivedRequestSystemAudioModeStatusChangeTo:(unint64_t)a4 fromDevice:(id)a5
{
  uint64_t v9 = [(CoreRCManager *)self serialQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __94__CoreRCManagerClient_CEC__cecDevice_receivedRequestSystemAudioModeStatusChangeTo_fromDevice___block_invoke;
  v10[3] = &unk_2652E3570;
  v10[4] = a3;
  v10[5] = a5;
  v10[6] = self;
  v10[7] = a4;
  dispatch_async((dispatch_queue_t)v9, v10);
}

uint64_t __94__CoreRCManagerClient_CEC__cecDevice_receivedRequestSystemAudioModeStatusChangeTo_fromDevice___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v8 = CoreCECActivationStatusString(*(void *)(a1 + 56));
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v7 = v2;
    LogPrintF();
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 48), "managedDeviceEquivalentTo:", *(void *)(a1 + 32), v7, v8, v9);
  if (result)
  {
    uint64_t v4 = (void *)result;
    uint64_t v5 = [*(id *)(a1 + 48) managedDeviceEquivalentTo:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(a1 + 56);
    return [v4 receivedRequestSystemAudioModeStatusChangeTo:v6 fromDevice:v5];
  }
  return result;
}

- (void)cecDevice:(id)a3 requestSystemAudioModeStatusChangeTo:(unint64_t)a4 didFinishWithResult:(BOOL)a5 error:(id)a6
{
  BOOL v11 = [(CoreRCManager *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __101__CoreRCManagerClient_CEC__cecDevice_requestSystemAudioModeStatusChangeTo_didFinishWithResult_error___block_invoke;
  block[3] = &unk_2652E35C0;
  BOOL v13 = a5;
  block[4] = a3;
  block[5] = a6;
  void block[6] = self;
  void block[7] = a4;
  dispatch_async((dispatch_queue_t)v11, block);
}

void *__101__CoreRCManagerClient_CEC__cecDevice_requestSystemAudioModeStatusChangeTo_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = CoreCECActivationStatusString(*(void *)(a1 + 56));
    uint64_t v4 = @"YES";
    if (!*(unsigned char *)(a1 + 64)) {
      uint64_t v4 = @"NO";
    }
    BOOL v11 = v4;
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v9 = v2;
    uint64_t v10 = v3;
    LogPrintF();
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 48), "managedDeviceEquivalentTo:", *(void *)(a1 + 32), v9, v10, v11, v12);
  if (result)
  {
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 40);
    return (void *)[result requestSystemAudioModeStatusChangeTo:v6 didFinishWithResult:v7 error:v8];
  }
  return result;
}

- (void)cecDevice:(id)a3 audioStatusReceived:(unint64_t)a4 muteStatus:(BOOL)a5
{
  uint64_t v9 = [(CoreRCManager *)self serialQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__CoreRCManagerClient_CEC__cecDevice_audioStatusReceived_muteStatus___block_invoke;
  v10[3] = &unk_2652E35E8;
  v10[4] = a3;
  v10[5] = self;
  v10[6] = a4;
  BOOL v11 = a5;
  dispatch_async((dispatch_queue_t)v9, v10);
}

void *__69__CoreRCManagerClient_CEC__cecDevice_audioStatusReceived_muteStatus___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    LogPrintF();
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 40), "managedDeviceEquivalentTo:", *(void *)(a1 + 32), v5);
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
    return (void *)[result audioStatusReceived:v3 muteStatus:v4];
  }
  return result;
}

- (void)queryLoggingAsync:(id)a3
{
  id v4 = [(CoreRCManagerClient *)self connection];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__CoreRCManagerClient_Private__queryLoggingAsync___block_invoke;
  v5[3] = &unk_2652E34D0;
  v5[4] = a3;
  objc_msgSend((id)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v5), "queryLoggingAsync:", a3);
}

uint64_t __50__CoreRCManagerClient_Private__queryLoggingAsync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setLoggingAsync:(id)a3 reply:(id)a4
{
  uint64_t v6 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a4);
  [v6 setLoggingAsync:a3 reply:a4];
}

- (void)fakeCreateCECBusAsync:(unint64_t)a3 reply:(id)a4
{
  id v6 = [(CoreRCManagerClient *)self connection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__CoreRCManagerClient_CECPrivate__fakeCreateCECBusAsync_reply___block_invoke;
  v7[3] = &unk_2652E34D0;
  v7[4] = a4;
  objc_msgSend((id)objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v7), "fakeCreateCECBusAsync:reply:", a3, a4);
}

uint64_t __63__CoreRCManagerClient_CECPrivate__fakeCreateCECBusAsync_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fakeRemoveCECBusAsync:(id)a3 reply:(id)a4
{
  id v6 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a4);
  [v6 fakeRemoveCECBusAsync:a3 reply:a4];
}

- (void)fakeSetCECBusLinkStateAsync:(id)a3 linkState:(BOOL)a4 physicalAddress:(unint64_t)a5 reply:(id)a6
{
  BOOL v8 = a4;
  uint64_t v10 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a6);
  [v10 fakeSetCECBusLinkStateAsync:a3 linkState:v8 physicalAddress:a5 reply:a6];
}

- (void)fakeCreateRemoteCECDeviceAsync:(id)a3 bus:(id)a4 logicalAddress:(unsigned __int8)a5 physicalAddress:(unint64_t)a6 reply:(id)a7
{
  uint64_t v9 = a5;
  id v12 = [(CoreRCManagerClient *)self connection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __107__CoreRCManagerClient_CECPrivate__fakeCreateRemoteCECDeviceAsync_bus_logicalAddress_physicalAddress_reply___block_invoke;
  v13[3] = &unk_2652E34D0;
  v13[4] = a7;
  objc_msgSend((id)objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v13), "fakeCreateRemoteCECDeviceAsync:bus:logicalAddress:physicalAddress:reply:", a3, a4, v9, a6, a7);
}

uint64_t __107__CoreRCManagerClient_CECPrivate__fakeCreateRemoteCECDeviceAsync_bus_logicalAddress_physicalAddress_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fakeSetCECDeviceLogicalAddressAsync:(id)a3 logicalAddress:(unsigned __int8)a4 reply:(id)a5
{
  uint64_t v6 = a4;
  id v8 = [(CoreRCManagerClient *)self connection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __92__CoreRCManagerClient_CECPrivate__fakeSetCECDeviceLogicalAddressAsync_logicalAddress_reply___block_invoke;
  v9[3] = &unk_2652E34D0;
  v9[4] = a5;
  objc_msgSend((id)objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v9), "fakeSetCECDeviceLogicalAddressAsync:logicalAddress:reply:", a3, v6, a5);
}

uint64_t __92__CoreRCManagerClient_CECPrivate__fakeSetCECDeviceLogicalAddressAsync_logicalAddress_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fakeRemoveCECDeviceAsync:(id)a3 reply:(id)a4
{
  uint64_t v6 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a4);
  [v6 fakeRemoveCECDeviceAsync:a3 reply:a4];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CoreRCManagerClient;
  [(CoreRCManager *)&v3 dealloc];
}

- (id)connection
{
  id result = self->_connection;
  if (!result)
  {
    self->_connection = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.corercd" options:0];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:CoreRCXPCServiceInterface()];
    [(NSXPCConnection *)self->_connection setExportedInterface:CoreRCXPCClientInterface()];
    [(NSXPCConnection *)self->_connection setExportedObject:self];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __33__CoreRCManagerClient_connection__block_invoke;
    v4[3] = &unk_2652E3F20;
    v4[4] = self;
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v4];
    [(NSXPCConnection *)self->_connection resume];
    return self->_connection;
  }
  return result;
}

void __33__CoreRCManagerClient_connection__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__CoreRCManagerClient_connection__block_invoke_2;
  block[3] = &unk_2652E3F20;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

uint64_t __33__CoreRCManagerClient_connection__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) connectionInterrupted];
}

- (void)connectionInterrupted
{
  if (gLogCategory_CoreRCManager <= 40 && (gLogCategory_CoreRCManager != -1 || _LogCategory_Initialize()))
  {
    [(NSXPCConnection *)self->_connection processIdentifier];
    LogPrintF();
  }

  self->_connection = 0;
  [(CoreRCManagerClient *)self buses];
}

- (void)invalidate
{
  self->_connection = 0;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 ofBus:(id)a5 error:(id *)a6
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__CoreRCManagerClient_setProperty_forKey_ofBus_error___block_invoke;
  v7[3] = &unk_2652E3F48;
  v7[4] = self;
  void v7[5] = a3;
  v7[6] = a4;
  v7[7] = a5;
  return CoreRCWaitForAsyncOperation(a6, (uint64_t)v7);
}

uint64_t __54__CoreRCManagerClient_setProperty_forKey_ofBus_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setPropertyAsync:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48) ofBus:*(void *)(a1 + 56) reply:a2];
}

- (id)propertyForKey:(id)a3 ofBus:(id)a4 error:(id *)a5
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  id v12 = __Block_byref_object_copy__2;
  BOOL v13 = __Block_byref_object_dispose__2;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__CoreRCManagerClient_propertyForKey_ofBus_error___block_invoke;
  v8[3] = &unk_2652E3F98;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  v8[7] = &v9;
  if (CoreRCWaitForAsyncOperation(a5, (uint64_t)v8)) {
    id v5 = (id)v10[5];
  }
  uint64_t v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __50__CoreRCManagerClient_propertyForKey_ofBus_error___block_invoke(void *a1, uint64_t a2)
{
  objc_super v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__CoreRCManagerClient_propertyForKey_ofBus_error___block_invoke_2;
  v7[3] = &unk_2652E3F70;
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  v7[4] = a2;
  void v7[5] = v5;
  return [v3 getPropertyAsyncForKey:v2 ofBus:v4 reply:v7];
}

uint64_t __50__CoreRCManagerClient_propertyForKey_ofBus_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

- (BOOL)setExtendedProperty:(id)a3 forKey:(id)a4 ofDevice:(id)a5 error:(id *)a6
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__CoreRCManagerClient_setExtendedProperty_forKey_ofDevice_error___block_invoke;
  v7[3] = &unk_2652E3F48;
  v7[4] = self;
  void v7[5] = a3;
  void v7[6] = a4;
  v7[7] = a5;
  return CoreRCWaitForAsyncOperation(a6, (uint64_t)v7);
}

uint64_t __65__CoreRCManagerClient_setExtendedProperty_forKey_ofDevice_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setExtendedPropertyAsync:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48) ofDevice:*(void *)(a1 + 56) reply:a2];
}

- (id)extendedPropertyForKey:(id)a3 ofDevice:(id)a4 error:(id *)a5
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  id v12 = __Block_byref_object_copy__2;
  BOOL v13 = __Block_byref_object_dispose__2;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__CoreRCManagerClient_extendedPropertyForKey_ofDevice_error___block_invoke;
  v8[3] = &unk_2652E3F98;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  v8[7] = &v9;
  if (CoreRCWaitForAsyncOperation(a5, (uint64_t)v8)) {
    id v5 = (id)v10[5];
  }
  uint64_t v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __61__CoreRCManagerClient_extendedPropertyForKey_ofDevice_error___block_invoke(void *a1, uint64_t a2)
{
  objc_super v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__CoreRCManagerClient_extendedPropertyForKey_ofDevice_error___block_invoke_2;
  v7[3] = &unk_2652E3F70;
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  v7[4] = a2;
  void v7[5] = v5;
  return [v3 getExtendedPropertyAsyncForKey:v2 ofDevice:v4 reply:v7];
}

uint64_t __61__CoreRCManagerClient_extendedPropertyForKey_ofDevice_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

- (void)setDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CoreRCManagerClient;
  [(CoreRCManager *)&v4 setDelegate:a3];
  [(CoreRCManagerClient *)self buses];
}

- (id)buses
{
  uint64_t v15 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  id v12 = __Block_byref_object_copy__2;
  BOOL v13 = __Block_byref_object_dispose__2;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __28__CoreRCManagerClient_buses__block_invoke;
  v8[3] = &unk_2652E3FE8;
  v8[4] = self;
  v8[5] = &v9;
  if (CoreRCWaitForAsyncOperation(&v15, (uint64_t)v8))
  {
    [(CoreRCManagerClient *)self synchBuses:v10[5]];
  }
  uint64_t v3 = v15;
  if (v15 && gLogCategory_CoreRCManager <= 90)
  {
    if (gLogCategory_CoreRCManager == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_8;
      }
      uint64_t v3 = v15;
    }
    uint64_t v6 = v3;
    LogPrintF();
  }
LABEL_8:
  v7.receiver = self;
  v7.super_class = (Class)CoreRCManagerClient;
  objc_super v4 = [(CoreRCManager *)&v7 buses];
  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __28__CoreRCManagerClient_buses__block_invoke(uint64_t a1, uint64_t a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__CoreRCManagerClient_buses__block_invoke_2;
  v5[3] = &unk_2652E3FC0;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = a2;
  void v5[5] = v3;
  return [v2 queryBusesAsync:v5];
}

uint64_t __28__CoreRCManagerClient_buses__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    if (a2) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
    }
    else {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6712 userInfo:0];
    }
  }
  objc_super v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

- (void)mergeBus:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreRCManagerClient.m", 263, @"inBus must not be nil: %@", self);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    objc_super v7 = self;
    __int16 v8 = 2112;
    id v9 = a3;
    _os_log_impl(&dword_24C4AB000, &_os_log_internal, OS_LOG_TYPE_INFO, "[CoreRC] manager: %@ mergeBus: %@", buf, 0x16u);
  }
  id v5 = [(CoreRCManager *)self managedBusEquivalentTo:a3];
  if (v5) {
    [v5 mergePropertiesFromBus:a3];
  }
  else {
    [(CoreRCManager *)self addBus:a3];
  }
}

- (void)synchBuses:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreRCManagerClient.m", 286, @"inBuses must not be nil: %@", self);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v27 = self;
    __int16 v28 = 2112;
    id v29 = a3;
    _os_log_impl(&dword_24C4AB000, &_os_log_internal, OS_LOG_TYPE_INFO, "[CoreRC] manager: %@ synchBuses: %@", buf, 0x16u);
  }
  id v5 = [(CoreRCManager *)self busesInternal];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __34__CoreRCManagerClient_synchBuses___block_invoke;
  v23[3] = &unk_2652E4010;
  v23[4] = a3;
  v23[5] = self;
  uint64_t v6 = (void *)[(NSMutableSet *)v5 objectsPassingTest:v23];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        [(CoreRCManager *)self removeBus:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v8);
  }
  [(NSMutableSet *)[(CoreRCManager *)self busesInternal] intersectSet:a3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v11 = [a3 countByEnumeratingWithState:&v15 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(a3);
        }
        [(CoreRCManagerClient *)self mergeBus:*(void *)(*((void *)&v15 + 1) + 8 * j)];
      }
      uint64_t v12 = [a3 countByEnumeratingWithState:&v15 objects:v24 count:16];
    }
    while (v12);
  }
}

BOOL __34__CoreRCManagerClient_synchBuses___block_invoke(uint64_t a1, void *a2)
{
  return ([*(id *)(a1 + 32) containsObject:a2] & 1) == 0
      && [a2 manager] == *(void *)(a1 + 40);
}

- (BOOL)sendHIDEvent:(id)a3 fromDevice:(id)a4 toDevice:(id)a5 error:(id *)a6
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    objc_opt_class();
    LogPrintF();
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__CoreRCManagerClient_sendHIDEvent_fromDevice_toDevice_error___block_invoke;
  v12[3] = &unk_2652E3F48;
  v12[4] = self;
  v12[5] = a3;
  v12[6] = a4;
  v12[7] = a5;
  return CoreRCWaitForAsyncOperation(a6, (uint64_t)v12);
}

uint64_t __62__CoreRCManagerClient_sendHIDEvent_fromDevice_toDevice_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendHIDEventAsync:*(void *)(a1 + 40) fromDevice:*(void *)(a1 + 48) toDevice:*(void *)(a1 + 56) reply:a2];
}

- (BOOL)sendCommand:(unint64_t)a3 fromDevice:(id)a4 toDevice:(id)a5 withDuration:(unint64_t)a6 error:(id *)a7
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    objc_opt_class();
    LogPrintF();
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__CoreRCManagerClient_sendCommand_fromDevice_toDevice_withDuration_error___block_invoke;
  v14[3] = &unk_2652E4038;
  v14[4] = self;
  v14[5] = a4;
  v14[6] = a5;
  v14[7] = a3;
  v14[8] = a6;
  return CoreRCWaitForAsyncOperation(a7, (uint64_t)v14);
}

uint64_t __74__CoreRCManagerClient_sendCommand_fromDevice_toDevice_withDuration_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendCommandAsync:*(void *)(a1 + 56) fromDevice:*(void *)(a1 + 40) toDevice:*(void *)(a1 + 48) withDuration:*(void *)(a1 + 64) reply:a2];
}

- (void)queryBusesAsync:(id)a3
{
  id v4 = [(CoreRCManagerClient *)self connection];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__CoreRCManagerClient_queryBusesAsync___block_invoke;
  v5[3] = &unk_2652E34D0;
  v5[4] = a3;
  objc_msgSend((id)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v5), "queryBusesAsync:", a3);
}

uint64_t __39__CoreRCManagerClient_queryBusesAsync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendHIDEventAsync:(id)a3 fromDevice:(id)a4 toDevice:(id)a5 reply:(id)a6
{
  uint64_t v10 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a6);
  [v10 sendHIDEventAsync:a3 fromDevice:a4 toDevice:a5 reply:a6];
}

- (void)sendCommandAsync:(unint64_t)a3 fromDevice:(id)a4 toDevice:(id)a5 withDuration:(unint64_t)a6 reply:(id)a7
{
  uint64_t v12 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a7);
  [v12 sendCommandAsync:a3 fromDevice:a4 toDevice:a5 withDuration:a6 reply:a7];
}

- (void)setPropertyAsync:(id)a3 forKey:(id)a4 ofBus:(id)a5 reply:(id)a6
{
  uint64_t v10 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a6);
  [v10 setPropertyAsync:a3 forKey:a4 ofBus:a5 reply:a6];
}

- (void)getPropertyAsyncForKey:(id)a3 ofBus:(id)a4 reply:(id)a5
{
  id v8 = [(CoreRCManagerClient *)self connection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__CoreRCManagerClient_getPropertyAsyncForKey_ofBus_reply___block_invoke;
  v9[3] = &unk_2652E34D0;
  v9[4] = a5;
  objc_msgSend((id)objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v9), "getPropertyAsyncForKey:ofBus:reply:", a3, a4, a5);
}

uint64_t __58__CoreRCManagerClient_getPropertyAsyncForKey_ofBus_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setExtendedPropertyAsync:(id)a3 forKey:(id)a4 ofDevice:(id)a5 reply:(id)a6
{
  uint64_t v10 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a6);
  [v10 setExtendedPropertyAsync:a3 forKey:a4 ofDevice:a5 reply:a6];
}

- (void)getExtendedPropertyAsyncForKey:(id)a3 ofDevice:(id)a4 reply:(id)a5
{
  id v8 = [(CoreRCManagerClient *)self connection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__CoreRCManagerClient_getExtendedPropertyAsyncForKey_ofDevice_reply___block_invoke;
  v9[3] = &unk_2652E34D0;
  v9[4] = a5;
  objc_msgSend((id)objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v9), "getExtendedPropertyAsyncForKey:ofDevice:reply:", a3, a4, a5);
}

uint64_t __69__CoreRCManagerClient_getExtendedPropertyAsyncForKey_ofDevice_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)busHasBeenAdded:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreRCManagerClient.m", 443, @"bus must not be nil: %@, connection: %@", self, self->_connection);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    connection = self->_connection;
    *(_DWORD *)buf = 138412802;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    id v11 = a3;
    __int16 v12 = 2112;
    uint64_t v13 = connection;
    _os_log_impl(&dword_24C4AB000, &_os_log_internal, OS_LOG_TYPE_INFO, "[CoreRC] manager: %@ busHasBeenAdded: %@ connection: %@", buf, 0x20u);
  }
  uint64_t v6 = [(CoreRCManager *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__CoreRCManagerClient_busHasBeenAdded___block_invoke;
  block[3] = &unk_2652E3520;
  block[4] = self;
  void block[5] = a3;
  dispatch_async((dispatch_queue_t)v6, block);
}

uint64_t __39__CoreRCManagerClient_busHasBeenAdded___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 mergeBus:v3];
}

- (void)busHasBeenRemoved:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreRCManagerClient.m", 461, @"bus must not be nil: %@, connection: %@", self, self->_connection);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    connection = self->_connection;
    *(_DWORD *)buf = 138412802;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    id v11 = a3;
    __int16 v12 = 2112;
    uint64_t v13 = connection;
    _os_log_impl(&dword_24C4AB000, &_os_log_internal, OS_LOG_TYPE_INFO, "[CoreRC] manager: %@ busHasBeenRemoved: %@ connection: %@", buf, 0x20u);
  }
  uint64_t v6 = [(CoreRCManager *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__CoreRCManagerClient_busHasBeenRemoved___block_invoke;
  block[3] = &unk_2652E3520;
  block[4] = self;
  void block[5] = a3;
  dispatch_async((dispatch_queue_t)v6, block);
}

uint64_t __41__CoreRCManagerClient_busHasBeenRemoved___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 removeBus:v3];
}

- (void)busHasBeenUpdated:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreRCManagerClient.m", 478, @"bus must not be nil: %@, connection: %@", self, self->_connection);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    connection = self->_connection;
    *(_DWORD *)buf = 138412802;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    id v11 = a3;
    __int16 v12 = 2112;
    uint64_t v13 = connection;
    _os_log_impl(&dword_24C4AB000, &_os_log_internal, OS_LOG_TYPE_INFO, "[CoreRC] manager: %@ busHasBeenUpdated: %@ connection: %@", buf, 0x20u);
  }
  uint64_t v6 = [(CoreRCManager *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__CoreRCManagerClient_busHasBeenUpdated___block_invoke;
  block[3] = &unk_2652E3520;
  block[4] = self;
  void block[5] = a3;
  dispatch_async((dispatch_queue_t)v6, block);
}

uint64_t __41__CoreRCManagerClient_busHasBeenUpdated___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 mergeBus:v3];
}

- (void)setLogging:(id)a3
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)bus:(id)a3 deviceHasBeenAdded:(id)a4
{
  uint64_t v7 = [(CoreRCManager *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__CoreRCManagerClient_bus_deviceHasBeenAdded___block_invoke;
  block[3] = &unk_2652E3598;
  block[4] = a3;
  void block[5] = a4;
  void block[6] = self;
  dispatch_async((dispatch_queue_t)v7, block);
}

void *__46__CoreRCManagerClient_bus_deviceHasBeenAdded___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    LogPrintF();
  }
  id result = objc_msgSend(*(id *)(a1 + 48), "managedBusEquivalentTo:", *(void *)(a1 + 32), v4, v5);
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    return (void *)[result mergeDevice:v3];
  }
  return result;
}

- (void)bus:(id)a3 deviceHasBeenRemoved:(id)a4
{
  uint64_t v7 = [(CoreRCManager *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__CoreRCManagerClient_bus_deviceHasBeenRemoved___block_invoke;
  block[3] = &unk_2652E3598;
  block[4] = a3;
  void block[5] = a4;
  void block[6] = self;
  dispatch_async((dispatch_queue_t)v7, block);
}

void *__48__CoreRCManagerClient_bus_deviceHasBeenRemoved___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    LogPrintF();
  }
  id result = objc_msgSend(*(id *)(a1 + 48), "managedBusEquivalentTo:", *(void *)(a1 + 32), v4, v5);
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    return (void *)[result removeDevice:v3];
  }
  return result;
}

- (void)bus:(id)a3 deviceHasBeenUpdated:(id)a4
{
  uint64_t v7 = [(CoreRCManager *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__CoreRCManagerClient_bus_deviceHasBeenUpdated___block_invoke;
  block[3] = &unk_2652E3598;
  block[4] = a3;
  void block[5] = a4;
  void block[6] = self;
  dispatch_async((dispatch_queue_t)v7, block);
}

void *__48__CoreRCManagerClient_bus_deviceHasBeenUpdated___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    LogPrintF();
  }
  id result = objc_msgSend(*(id *)(a1 + 48), "managedBusEquivalentTo:", *(void *)(a1 + 32), v4, v5);
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    return (void *)[result mergeDevice:v3];
  }
  return result;
}

- (void)device:(id)a3 receivedHIDEvent:(id)a4 fromDevice:(id)a5
{
  uint64_t v9 = [(CoreRCManager *)self serialQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__CoreRCManagerClient_device_receivedHIDEvent_fromDevice___block_invoke;
  v10[3] = &unk_2652E34F8;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = a5;
  void v10[7] = self;
  dispatch_async((dispatch_queue_t)v9, v10);
}

uint64_t __58__CoreRCManagerClient_device_receivedHIDEvent_fromDevice___block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCXPC <= 10 && (gLogCategory_CoreRCXPC != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    long long v6 = *(_OWORD *)(a1 + 32);
    LogPrintF();
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 56), "managedDeviceEquivalentTo:", *(void *)(a1 + 32), v6, v7);
  if (result)
  {
    uint64_t v3 = (void *)result;
    if (*(void *)(a1 + 48))
    {
      uint64_t result = objc_msgSend(*(id *)(a1 + 56), "managedDeviceEquivalentTo:");
      uint64_t v4 = result;
      if (!result) {
        return result;
      }
    }
    else
    {
      uint64_t v4 = 0;
    }
    uint64_t v5 = *(void *)(a1 + 40);
    return [v3 receivedHIDEvent:v5 fromDevice:v4];
  }
  return result;
}

- (void)setOSDNameAsync:(id)a3 forDevice:(id)a4 reply:(id)a5
{
  id v8 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a5);
  [v8 setOSDNameAsync:a3 forDevice:a4 reply:a5];
}

- (void)setPairStateAsync:(BOOL)a3 forAppleRemote:(id)a4 reply:(id)a5
{
  BOOL v7 = a3;
  id v8 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a5);
  [v8 setPairStateAsync:v7 forAppleRemote:a4 reply:a5];
}

- (void)startLearningCommandAsync:(unint64_t)a3 withDevice:(id)a4 reply:(id)a5
{
  id v8 = [(CoreRCManagerClient *)self connection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__CoreRCManagerClient_IR__startLearningCommandAsync_withDevice_reply___block_invoke;
  v9[3] = &unk_2652E34D0;
  v9[4] = a5;
  objc_msgSend((id)objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v9), "startLearningCommandAsync:withDevice:reply:", a3, a4, a5);
}

uint64_t __70__CoreRCManagerClient_IR__startLearningCommandAsync_withDevice_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)endLearningWithDeviceAsync:(id)a3 reply:(id)a4
{
  long long v6 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a4);
  [v6 endLearningWithDeviceAsync:a3 reply:a4];
}

- (void)addDeviceOnBusAsync:(id)a3 withType:(unint64_t)a4 matching:(id)a5 reply:(id)a6
{
  id v10 = [(CoreRCManagerClient *)self connection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__CoreRCManagerClient_IR__addDeviceOnBusAsync_withType_matching_reply___block_invoke;
  v11[3] = &unk_2652E34D0;
  v11[4] = a6;
  objc_msgSend((id)objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v11), "addDeviceOnBusAsync:withType:matching:reply:", a3, a4, a5, a6);
}

uint64_t __71__CoreRCManagerClient_IR__addDeviceOnBusAsync_withType_matching_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateMappingWithSessionOwningDeviceAsync:(id)a3 forTargetDevice:(id)a4 reply:(id)a5
{
  id v8 = [(CoreRCManagerClient *)self connection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __91__CoreRCManagerClient_IR__updateMappingWithSessionOwningDeviceAsync_forTargetDevice_reply___block_invoke;
  v9[3] = &unk_2652E34D0;
  v9[4] = a5;
  objc_msgSend((id)objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v9), "updateMappingWithSessionOwningDeviceAsync:forTargetDevice:reply:", a3, a4, a5);
}

uint64_t __91__CoreRCManagerClient_IR__updateMappingWithSessionOwningDeviceAsync_forTargetDevice_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startLearningSessionWithDeviceAsync:(id)a3 forReason:(id)a4 reply:(id)a5
{
  id v8 = [(CoreRCManagerClient *)self connection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__CoreRCManagerClient_IR__startLearningSessionWithDeviceAsync_forReason_reply___block_invoke;
  v9[3] = &unk_2652E34D0;
  v9[4] = a5;
  objc_msgSend((id)objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v9), "startLearningSessionWithDeviceAsync:forReason:reply:", a3, a4, a5);
}

uint64_t __79__CoreRCManagerClient_IR__startLearningSessionWithDeviceAsync_forReason_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addDeviceOnBusAsync:(id)a3 withType:(unint64_t)a4 matching:(id)a5 withSessionOwningDevice:(id)a6 reply:(id)a7
{
  id v12 = [(CoreRCManagerClient *)self connection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __95__CoreRCManagerClient_IR__addDeviceOnBusAsync_withType_matching_withSessionOwningDevice_reply___block_invoke;
  v13[3] = &unk_2652E34D0;
  v13[4] = a7;
  objc_msgSend((id)objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v13), "addDeviceOnBusAsync:withType:matching:withSessionOwningDevice:reply:", a3, a4, a5, a6, a7);
}

uint64_t __95__CoreRCManagerClient_IR__addDeviceOnBusAsync_withType_matching_withSessionOwningDevice_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteDeviceAsync:(id)a3 fromBus:(id)a4 reply:(id)a5
{
  id v8 = [(CoreRCManagerClient *)self connection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__CoreRCManagerClient_IR__deleteDeviceAsync_fromBus_reply___block_invoke;
  v9[3] = &unk_2652E34D0;
  v9[4] = a5;
  objc_msgSend((id)objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v9), "deleteDeviceAsync:fromBus:reply:", a3, a4, a5);
}

uint64_t __59__CoreRCManagerClient_IR__deleteDeviceAsync_fromBus_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendCommandAsync:(id)a3 fromDevice:(id)a4 reply:(id)a5
{
  id v8 = objc_msgSend(-[CoreRCManagerClient connection](self, "connection"), "remoteObjectProxyWithErrorHandler:", a5);
  [v8 sendCommandAsync:a3 fromDevice:a4 reply:a5];
}

- (void)clearAllStoredCommandsFromDeviceAsync:(id)a3 reply:(id)a4
{
  id v6 = [(CoreRCManagerClient *)self connection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__CoreRCManagerClient_IR__clearAllStoredCommandsFromDeviceAsync_reply___block_invoke;
  v7[3] = &unk_2652E34D0;
  v7[4] = a4;
  objc_msgSend((id)objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v7), "clearAllStoredCommandsFromDeviceAsync:reply:", a3, a4);
}

uint64_t __71__CoreRCManagerClient_IR__clearAllStoredCommandsFromDeviceAsync_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setCommandAsync:(unint64_t)a3 target:(id)a4 source:(id)a5 forButtonCombination:(id)a6 delay:(double)a7 reply:(id)a8
{
  id v14 = [(CoreRCManagerClient *)self connection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __90__CoreRCManagerClient_IR__setCommandAsync_target_source_forButtonCombination_delay_reply___block_invoke;
  v15[3] = &unk_2652E34D0;
  v15[4] = a8;
  objc_msgSend((id)objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v15), "setCommandAsync:target:source:forButtonCombination:delay:reply:", a3, a4, a5, a6, a8, a7);
}

uint64_t __90__CoreRCManagerClient_IR__setCommandAsync_target_source_forButtonCombination_delay_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)changeButtonCombinationAsync:(id)a3 delay:(double)a4 enabled:(BOOL)a5 forDevice:(id)a6 reply:(id)a7
{
  BOOL v9 = a5;
  id v12 = [(CoreRCManagerClient *)self connection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __86__CoreRCManagerClient_IR__changeButtonCombinationAsync_delay_enabled_forDevice_reply___block_invoke;
  v13[3] = &unk_2652E34D0;
  v13[4] = a7;
  objc_msgSend((id)objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v13), "changeButtonCombinationAsync:delay:enabled:forDevice:reply:", a3, v9, a6, a7, a4);
}

uint64_t __86__CoreRCManagerClient_IR__changeButtonCombinationAsync_delay_enabled_forDevice_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)learningSessionForDevice:(id)a3 commandProgress:(id)a4
{
  BOOL v7 = [(CoreRCManager *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__CoreRCManagerClient_IR__learningSessionForDevice_commandProgress___block_invoke;
  block[3] = &unk_2652E3598;
  block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  dispatch_async((dispatch_queue_t)v7, block);
}

void *__68__CoreRCManagerClient_IR__learningSessionForDevice_commandProgress___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "managedDeviceEquivalentTo:", *(void *)(a1 + 40)), "learningSession");
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)[result delegate];
    uint64_t v5 = *(void *)(a1 + 48);
    return (void *)[v4 learningSession:v3 commandProgress:v5];
  }
  return result;
}

- (void)learningSessionForDevice:(id)a3 status:(unint64_t)a4
{
  BOOL v7 = [(CoreRCManager *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CoreRCManagerClient_IR__learningSessionForDevice_status___block_invoke;
  block[3] = &unk_2652E4D40;
  block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  dispatch_async((dispatch_queue_t)v7, block);
}

void *__59__CoreRCManagerClient_IR__learningSessionForDevice_status___block_invoke(uint64_t a1)
{
  uint64_t result = (void *)[*(id *)(a1 + 32) managedDeviceEquivalentTo:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t result = (void *)[result learningSession];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = (void *)[result delegate];
      uint64_t v5 = *(void *)(a1 + 48);
      return (void *)[v4 learningSession:v3 status:v5];
    }
  }
  return result;
}

- (void)learningSessionForDevice:(id)a3 duplicateCommand:(unint64_t)a4 target:(id)a5
{
  BOOL v9 = [(CoreRCManager *)self serialQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__CoreRCManagerClient_IR__learningSessionForDevice_duplicateCommand_target___block_invoke;
  v10[3] = &unk_2652E3570;
  v10[4] = a5;
  v10[5] = self;
  v10[6] = a3;
  void v10[7] = a4;
  dispatch_async((dispatch_queue_t)v9, v10);
}

void *__76__CoreRCManagerClient_IR__learningSessionForDevice_duplicateCommand_target___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "managedDeviceEquivalentTo:");
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "managedDeviceEquivalentTo:", *(void *)(a1 + 48)), "learningSession");
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = (void *)[result delegate];
    uint64_t v6 = *(void *)(a1 + 56);
    return (void *)[v5 learningSession:v4 duplicateCommand:v6 target:v2];
  }
  return result;
}

- (void)learningSessionForDeviceCommandDone:(id)a3
{
  uint64_t v5 = [(CoreRCManager *)self serialQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__CoreRCManagerClient_IR__learningSessionForDeviceCommandDone___block_invoke;
  v6[3] = &unk_2652E3520;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)v5, v6);
}

void *__63__CoreRCManagerClient_IR__learningSessionForDeviceCommandDone___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "managedDeviceEquivalentTo:", *(void *)(a1 + 40)), "learningSession");
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = (void *)[result delegate];
    return (void *)[v3 learningSessionCommandDone:v2];
  }
  return result;
}

@end