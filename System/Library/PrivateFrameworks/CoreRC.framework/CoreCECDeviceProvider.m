@interface CoreCECDeviceProvider
+ (BOOL)supportsSecureCoding;
- (BOOL)abortTo:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)activeARCAudioSystem;
- (BOOL)activeSource:(id *)a3;
- (BOOL)audioReturnChannelTransitionInProgress;
- (BOOL)audioSystemRequestSystemAudioModeStatusChangeTo:(unint64_t)a3 error:(id *)a4;
- (BOOL)cecVersion:(unsigned __int8)a3 to:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)deckControlCommandWithMode:(unint64_t)a3 target:(id)a4 error:(id *)a5;
- (BOOL)deckControlPlayWithMode:(unint64_t)a3 target:(id)a4 error:(id *)a5;
- (BOOL)deckControlRefreshStatus:(id)a3 requestType:(unint64_t)a4 error:(id *)a5;
- (BOOL)deckControlSetDeckStatus:(unint64_t)a3 error:(id *)a4;
- (BOOL)deckControlWithMode:(unint64_t)a3 to:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)deckStatusWithInfo:(unint64_t)a3 to:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)deviceRequestSystemAudioModeStatusChangeTo:(unint64_t)a3 error:(id *)a4;
- (BOOL)deviceVendorID:(unsigned int)a3 error:(id *)a4;
- (BOOL)featureAbort:(unsigned __int8)a3 reason:(unsigned __int8)a4 to:(unsigned __int8)a5 error:(id *)a6;
- (BOOL)getCECVersionTo:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)getMenuLanguageTo:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)getRemoteControlDestination:(id *)a3 logicalAddress:(unsigned __int8 *)a4 forTargetDevice:(id)a5 command:(unsigned __int8)a6 error:(id *)a7;
- (BOOL)giveAudioStatusTo:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)giveDeckStatusWithRequest:(unsigned __int8)a3 to:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)giveDevicePowerStatusTo:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)giveDeviceVendorIDTo:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)giveOSDNameTo:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)givePhysicalAddressTo:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)giveSystemAudioModeStatusTo:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)handleUserControl:(CECUserControl)a3 pressed:(BOOL)a4 fromDevice:(id)a5 abortReason:(unsigned __int8 *)a6;
- (BOOL)handlingRequiredForAudioReturnChannelMessage:(id)a3;
- (BOOL)handlingRequiredForSystemAudioModeMessage:(id)a3;
- (BOOL)imageViewOnTo:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)inactiveSourceTo:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)initiateARC:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)initiatorAddressErrorDetectedForMessage:(id)a3;
- (BOOL)isValid;
- (BOOL)makeActiveSourceWithTVMenus:(BOOL)a3 error:(id *)a4;
- (BOOL)menuStatus:(unsigned __int8)a3 to:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)oneTouchPlayWithMenu:(BOOL)a3 to:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)performStandbyWithTargetDevice:(id)a3 error:(id *)a4;
- (BOOL)playWithMode:(unint64_t)a3 to:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)pollTo:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)refreshProperties:(id)a3 ofDevice:(id)a4 error:(id *)a5;
- (BOOL)reportAudioStatusTo:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)reportFeatures:(id *)a3;
- (BOOL)reportPhysicalAddress:(id *)a3;
- (BOOL)reportPowerStatus:(unsigned __int8)a3 to:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)reportShortAudioDescriptorTo:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)requestActiveSource:(id *)a3;
- (BOOL)requestAudioReturnChannelStatusChangeTo:(unint64_t)a3 error:(id *)a4;
- (BOOL)requestAudioStatus:(id *)a3;
- (BOOL)requestShortAudioDescriptor:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)requestSystemAudioModeStatusChangeTo:(unint64_t)a3 error:(id *)a4;
- (BOOL)resignActiveSource:(id *)a3;
- (BOOL)routingChangeOriginalAddress:(unint64_t)a3 newAddress:(unint64_t)a4 error:(id *)a5;
- (BOOL)routingInformationPhysicalAddress:(unint64_t)a3 error:(id *)a4;
- (BOOL)sendActiveSourceStatus:(BOOL)a3 error:(id *)a4;
- (BOOL)sendHIDEvent:(id)a3 target:(id)a4 error:(id *)a5;
- (BOOL)sendMessage:(id)a3 error:(id *)a4;
- (BOOL)sendMessage:(id)a3 withRetryCount:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)setAudioMuteStatus:(BOOL)a3 error:(id *)a4;
- (BOOL)setAudioReturnChannelControlEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setAudioVolumeStatus:(unint64_t)a3 error:(id *)a4;
- (BOOL)setExtendedProperty:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setMenuLanguage:(CECLanguage)a3 error:(id *)a4;
- (BOOL)setOSDName:(CECOSDName)a3 to:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)setStreamPathPhysicalAddress:(unint64_t)a3 error:(id *)a4;
- (BOOL)setSupportedAudioFormats:(id)a3 error:(id *)a4;
- (BOOL)setSystemAudioControlEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setSystemAudioMode:(unint64_t)a3 to:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)setTrackAudioStatusEnabled:(BOOL)a3 pressTimeout:(int64_t)a4 pollInterval:(int64_t)a5 error:(id *)a6;
- (BOOL)standbyTo:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)systemAudioModeRequest:(unint64_t)a3 error:(id *)a4;
- (BOOL)systemAudioModeRequestWithPhysicalAddress:(unsigned __int16)a3 to:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)systemAudioModeRequestedByOtherDevice;
- (BOOL)systemAudioModeRequestedByTV;
- (BOOL)systemAudioModeStatus:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)systemAudioModeTransitionInProgress;
- (BOOL)terminateARC:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)textViewOnTo:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)trackAudioStatusEnabled;
- (BOOL)userControlPressed:(CECUserControl)a3 to:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)userControlReleasedTo:(unsigned __int8)a3 error:(id *)a4;
- (Class)classForCoder;
- (CoreCECDeviceProvider)initWithBus:(id)a3 local:(BOOL)a4;
- (CoreCECDeviceProvider)initWithCoder:(id)a3;
- (CoreCECDeviceProvider)initWithDevice:(id)a3;
- (OS_dispatch_queue)serialQueue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)extendedPropertyForKey:(id)a3 error:(id *)a4;
- (id)filterActiveSourceMessage:(id)a3;
- (id)filterCECVersionMessage:(id)a3 toDevice:(id)a4;
- (id)filterDeckStatusMessage:(id)a3 toDevice:(id)a4;
- (id)filterDeviceVendorIDMessage:(id)a3;
- (id)filterInactiveSourceMessage:(id)a3 toDevice:(id)a4;
- (id)filterMessage:(id)a3 fromDevice:(id)a4;
- (id)filterMessage:(id)a3 toDevice:(id)a4;
- (id)filterReportFeaturesMessage:(id)a3 toDevice:(id)a4;
- (id)filterReportPhysicalAddressMessage:(id)a3;
- (id)filterReportPowerStatusMessage:(id)a3 toDevice:(id)a4;
- (id)filterRoutingChangeMessage:(id)a3;
- (id)filterRoutingInformationMessage:(id)a3;
- (id)filterSetMenuLanguageMessage:(id)a3;
- (id)filterSetOSDNameMessage:(id)a3 toDevice:(id)a4;
- (id)filterSetStreamPathMessage:(id)a3;
- (id)filterSetSystemAudioModeMessage:(id)a3 toDevice:(id)a4;
- (id)filterSystemAudioModeStatusMessage:(id)a3 toDevice:(id)a4;
- (int)audioReturnChannelState;
- (int)systemAudioModeState;
- (int64_t)trackAudioStatusPollInterval;
- (int64_t)trackAudioStatusPressTimeout;
- (unsigned)deckStatusRequestMask;
- (unsigned)sendFromAddress;
- (void)arcInformDelegateOfSuccessTransitioningTo:(unint64_t)a3;
- (void)arcInformDelegateTransitionTo:(unint64_t)a3 failedWithError:(id)a4;
- (void)arcStarting;
- (void)arcStarting_handleFeatureAbortReceivedWithOpcode:(unsigned __int8)a3 reason:(unsigned __int8)a4;
- (void)arcStarting_handleReportARCInitiatedReceived;
- (void)arcStopping;
- (void)arcStopping_handleFeatureAbortReceivedWithOpcode:(unsigned __int8)a3 reason:(unsigned __int8)a4;
- (void)arcStopping_handleReportARCTerminatedReceived;
- (void)audioStatusChanged;
- (void)audioStatusHandleUserControl:(CECUserControl)a3 pressed:(BOOL)a4;
- (void)audioStatusHandleUserControlPressed;
- (void)audioStatusHandleUserControlReleased;
- (void)broadcastPresence;
- (void)dealloc;
- (void)didAddToBus:(id)a3;
- (void)didChangePowerStatus:(unint64_t)a3;
- (void)didNotHandleMessage:(id)a3 unsupportedOperand:(BOOL)a4;
- (void)didRemoveFromBus:(id)a3;
- (void)dispatchAsyncLowPriority:(id)a3;
- (void)dispatchSelector:(SEL)a3;
- (void)dispatchSelector:(SEL)a3 afterDelay:(double)a4;
- (void)dispatchSelector:(SEL)a3 withObject:(id)a4;
- (void)dispatchSelector:(SEL)a3 withObject:(id)a4 afterDelay:(double)a5;
- (void)dsamStarting:(id)a3;
- (void)dsamStartingWithPhysicalAddress:(unsigned __int16)a3;
- (void)dsamStarting_handleBroadcastSSAMOnResponseReceived;
- (void)dsamStarting_handleBroadcastSSAMOnResponseTimeout;
- (void)dsamStopping;
- (void)dsamStopping_handleBroadcastSSAMOffResponseReceived;
- (void)dsamStopping_handleBroadcastSSAMOffResponseTimeout;
- (void)error:(id)a3 handlingMessage:(id)a4 fromDevice:(id)a5;
- (void)handleActiveSourceMessage:(id)a3 fromDevice:(id)a4;
- (void)handleDeckControlMessage:(id)a3 fromDevice:(id)a4;
- (void)handleDeckControlPlayMessage:(id)a3 fromDevice:(id)a4;
- (void)handleFeatureAbortMessage:(id)a3 fromDevice:(id)a4;
- (void)handleGetCECVersionMessage:(id)a3 fromDevice:(id)a4;
- (void)handleGetMenuLanguageMessage:(id)a3 fromDevice:(id)a4;
- (void)handleGiveAudioStatusMessage:(id)a3 fromDevice:(id)a4;
- (void)handleGiveDeckStatusMessage:(id)a3 fromDevice:(id)a4;
- (void)handleGiveDevicePowerStatusMessage:(id)a3 fromDevice:(id)a4;
- (void)handleGiveDeviceVendorIDMessage:(id)a3 fromDevice:(id)a4;
- (void)handleGiveFeaturesMessage:(id)a3 fromDevice:(id)a4;
- (void)handleGiveOSDNameMessage:(id)a3 fromDevice:(id)a4;
- (void)handleGivePhysicalAddressMessage:(id)a3 fromDevice:(id)a4;
- (void)handleGiveSystemAudioModeStatusMessage:(id)a3 fromDevice:(id)a4;
- (void)handleMenuRequest:(id)a3 fromDevice:(id)a4;
- (void)handleMessage:(id)a3 fromDevice:(id)a4 broadcast:(BOOL)a5;
- (void)handleReportARCInitiatedMessage:(id)a3 fromDevice:(id)a4;
- (void)handleReportARCTerminatedMessage:(id)a3 fromDevice:(id)a4;
- (void)handleReportAudioStatusMessage:(id)a3 fromDevice:(id)a4;
- (void)handleRequestARCInitiationMessage:(id)a3 fromDevice:(id)a4;
- (void)handleRequestARCTerminationMessage:(id)a3 fromDevice:(id)a4;
- (void)handleRequestActiveSourceMessage:(id)a3 fromDevice:(id)a4;
- (void)handleRequestShortAudioDescriptorMessage:(id)a3 fromDevice:(id)a4;
- (void)handleSetAudioVolumeLevelMessage:(id)a3 fromDevice:(id)a4;
- (void)handleSetStreamPathMessage:(id)a3;
- (void)handleSetSystemAudioModeMessage:(id)a3 fromDevice:(id)a4;
- (void)handleSystemAudioModeRequestMessage:(id)a3 fromDevice:(id)a4;
- (void)handleUserControlPressedMessage:(id)a3 fromDevice:(id)a4;
- (void)handleUserControlReleasedMessage:(id)a3 fromDevice:(id)a4;
- (void)hibernationChanged:(BOOL)a3;
- (void)probeAbsoluteVolumeControl_handleFeatureAbortReceivedFromDevice:(id)a3 withOpcode:(unsigned __int8)a4 reason:(unsigned __int8)a5;
- (void)receivedSetAudioVolumeLevel:(unsigned __int8)a3 fromDevice:(id)a4;
- (void)refreshActiveSource;
- (void)refreshSystemAudioModeStatus;
- (void)resetAudioStatusState;
- (void)samInformDelegateOfSuccessTransitioningTo:(unint64_t)a3;
- (void)samInformDelegateTransitionTo:(unint64_t)a3 failedWithError:(id)a4;
- (void)samResetStateToOff;
- (void)samStarting;
- (void)samStarting_broadcast_Req_Act_Src;
- (void)samStarting_broadcast_SSAM_ON;
- (void)samStarting_handleActiveSourceReceived;
- (void)samStarting_handleActiveSourceResponseTimeout;
- (void)samStarting_handleFeatureAbortReceived;
- (void)samStarting_handleFeatureAbortResponseTimeout;
- (void)samStarting_send_SSAM_ON_to_TV;
- (void)samStopping;
- (void)scheduleReportAudioStatus;
- (void)sendDeckStatusToDevice:(id)a3;
- (void)sendFeatureAbort:(unsigned __int8)a3 forMessage:(id)a4;
- (void)sendReportAudioStatus;
- (void)setAudioReturnChannelState:(int)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setSendFromAddress:(unsigned __int8)a3;
- (void)setSystemAudioModeRequestedByOtherDevice:(BOOL)a3;
- (void)setSystemAudioModeRequestedByTV:(BOOL)a3;
- (void)setSystemAudioModeState:(int)a3;
- (void)setTrackAudioStatusEnabled:(BOOL)a3;
- (void)setTrackAudioStatusPollInterval:(int64_t)a3;
- (void)setTrackAudioStatusPressTimeout:(int64_t)a3;
- (void)userControlCancelFollowerSafetyTimeout;
- (void)userControlCancelInitiatorRepetitionTimeout;
- (void)userControlCancelInitiatorTrackAudioStatusTimeout;
- (void)userControlFollowerSafetyTimeoutExpired;
- (void)userControlFollowerSynthesizeRelease;
- (void)userControlInitiatorRepetitionTimeoutExpired;
- (void)userControlInitiatorTrackAudioStatusTimeoutExpired;
- (void)userControlScheduleFollowerSafetyTimeout;
- (void)userControlScheduleInitiatorRepetitionTimeout;
- (void)userControlScheduleInitiatorTrackAudioStatusTimeout;
- (void)willRemoveFromBus:(id)a3;
@end

@implementation CoreCECDeviceProvider

- (CoreCECDeviceProvider)initWithBus:(id)a3 local:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CoreCECDeviceProvider;
  result = [(CoreCECDevice *)&v5 initWithBus:a3 local:a4];
  if (result)
  {
    result->_sendFromAddress = 15;
    result->_isValid = 1;
  }
  return result;
}

- (CoreCECDeviceProvider)initWithDevice:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CoreCECDeviceProvider;
  v4 = -[CoreCECDevice initWithDevice:](&v7, sel_initWithDevice_);
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [a3 sendFromAddress];
    }
    else {
      char v5 = 15;
    }
    v4->_sendFromAddress = v5;
    v4->_isValid = 1;
  }
  return v4;
}

- (CoreCECDeviceProvider)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CoreCECDeviceProvider;
  result = [(CoreCECDevice *)&v4 initWithCoder:a3];
  if (result)
  {
    result->_sendFromAddress = 15;
    result->_isValid = 1;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CoreCECDeviceProvider;
  [(CoreCECDevice *)&v2 dealloc];
}

- (void)willRemoveFromBus:(id)a3
{
  self->_isValid = 0;
  p_userControlInitiatorState = &self->_userControlInitiatorState;
  if (self->_userControlInitiatorState.isValid)
  {
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      objc_super v7 = self;
      id v8 = a3;
      uint64_t v6 = objc_opt_class();
      LogPrintF();
    }
    p_userControlInitiatorState->isValid = 0;
    [(CoreCECDeviceProvider *)self userControlCancelInitiatorRepetitionTimeout];
    [(CoreCECDeviceProvider *)self userControlReleasedTo:p_userControlInitiatorState->destination error:0];
  }
  if ([(CoreCECDeviceProvider *)self systemAudioModeState]
    && [(CoreCECDeviceProvider *)self systemAudioModeState] <= 6)
  {
    [(CoreCECDeviceProvider *)self samResetStateToOff];
    -[CoreCECDevice requestSystemAudioModeStatusChangeTo:didFinishWithResult:error:](self, "requestSystemAudioModeStatusChangeTo:didFinishWithResult:error:", 1, 0, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6723 userInfo:0]);
  }
  if ([(CoreCECDeviceProvider *)self audioReturnChannelState] == 1)
  {
    [(CoreCECDeviceProvider *)self setAudioReturnChannelState:0];
    -[CoreCECDevice requestAudioReturnChannelStatusChangeTo:didFinishWithResult:error:](self, "requestAudioReturnChannelStatusChangeTo:didFinishWithResult:error:", 1, 0, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6723 userInfo:0]);
  }
  v9.receiver = self;
  v9.super_class = (Class)CoreCECDeviceProvider;
  [(CoreRCDevice *)&v9 willRemoveFromBus:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return NSClassFromString(&cfstr_Corececdevicec.isa);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CoreCECDeviceProvider;
  return [(CoreRCDevice *)&v4 copyWithZone:a3];
}

- (OS_dispatch_queue)serialQueue
{
  objc_super v4 = (OS_dispatch_queue *)objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "serialQueue");
  if (!v4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CoreCECDeviceProvider.m", 337, @"busProvider queue must not be nil!");
  }
  return v4;
}

- (BOOL)setExtendedProperty:(id)a3 forKey:(id)a4 error:(id *)a5
{
  if (gLogCategory_CoreRCDevice <= 90 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return 0;
}

- (id)extendedPropertyForKey:(id)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCDevice <= 90 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return 0;
}

- (void)didAddToBus:(id)a3
{
  uint64_t v6 = 0;
  v5.receiver = self;
  v5.super_class = (Class)CoreCECDeviceProvider;
  -[CoreRCDevice didAddToBus:](&v5, sel_didAddToBus_);
  if ([(CoreRCDevice *)self isLocalDevice]
    && ([a3 setAllowHibernation:0 error:&v6] & 1) == 0
    && gLogCategory_CoreRCDevice <= 90
    && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)didRemoveFromBus:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CoreCECDeviceProvider;
  -[CoreRCDevice didRemoveFromBus:](&v4, sel_didRemoveFromBus_);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a3 updateAllowHibernation];
  }
}

- (BOOL)deckControlSetDeckStatus:(unint64_t)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = objc_opt_class();
    v12 = self;
    uint64_t v13 = CoreCECDeckInfoString(a3);
    uint64_t v11 = v7;
    LogPrintF();
  }
  v14.receiver = self;
  v14.super_class = (Class)CoreCECDeviceProvider;
  BOOL v8 = -[CoreCECDevice deckControlSetDeckStatus:error:](&v14, sel_deckControlSetDeckStatus_error_, a3, a4, v11, v12, v13);
  if (v8)
  {
    objc_msgSend(-[CoreRCDevice bus](self, "bus"), "notifyDelegateDeviceUpdated:", self);
    if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    for (int i = 0; i != 15; ++i)
    {
      if ((self->_deckStatusRequestMask >> i)) {
        -[CoreCECDeviceProvider sendDeckStatusToDevice:](self, "sendDeckStatusToDevice:", objc_msgSend(-[CoreRCDevice bus](self, "bus"), "deviceOnBusWithLogicalAddress:", i));
      }
    }
  }
  return v8;
}

- (BOOL)deckControlCommandWithMode:(unint64_t)a3 target:(id)a4 error:(id *)a5
{
  v20 = 0;
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v18 = CoreCECDeckControlModeString(a3);
    id v19 = a4;
    uint64_t v16 = v9;
    v17 = self;
    LogPrintF();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08410];
    uint64_t v15 = -6705;
    goto LABEL_12;
  }
  uint64_t v10 = [a4 logicalAddress];
  if (v10 == 15)
  {
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08410];
    uint64_t v15 = -6761;
LABEL_12:
    uint64_t v11 = objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v15, 0, v16, v17, v18, v19);
    if (!a5) {
      return v11 == 0;
    }
    goto LABEL_8;
  }
  [(CoreCECDeviceProvider *)self deckControlWithMode:a3 to:v10 error:&v20];
  uint64_t v11 = v20;
  if (a5) {
LABEL_8:
  }
    *a5 = v11;
  return v11 == 0;
}

- (BOOL)deckControlPlayWithMode:(unint64_t)a3 target:(id)a4 error:(id *)a5
{
  v20 = 0;
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v18 = CoreCECPlayModeString(a3);
    id v19 = a4;
    uint64_t v16 = v9;
    v17 = self;
    LogPrintF();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08410];
    uint64_t v15 = -6705;
    goto LABEL_12;
  }
  uint64_t v10 = [a4 logicalAddress];
  if (v10 == 15)
  {
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08410];
    uint64_t v15 = -6761;
LABEL_12:
    uint64_t v11 = objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v15, 0, v16, v17, v18, v19);
    if (!a5) {
      return v11 == 0;
    }
    goto LABEL_8;
  }
  [(CoreCECDeviceProvider *)self playWithMode:a3 to:v10 error:&v20];
  uint64_t v11 = v20;
  if (a5) {
LABEL_8:
  }
    *a5 = v11;
  return v11 == 0;
}

- (BOOL)deckControlRefreshStatus:(id)a3 requestType:(unint64_t)a4 error:(id *)a5
{
  v22 = 0;
  unsigned __int8 v21 = 0;
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v19 = CoreCECStatusRequestTypeString(a4);
    id v20 = a3;
    uint64_t v17 = v9;
    uint64_t v18 = self;
    LogPrintF();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v10 = [a3 logicalAddress];
  if (v10 == 15)
  {
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6761;
LABEL_13:
    v12 = objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v16, 0, v17, v18, v19, v20);
    if (!a5) {
      return v12 == 0;
    }
    goto LABEL_9;
  }
  uint64_t v11 = v10;
  if (!CECStatusRequestForCoreCECStatusRequest(&v21, a4))
  {
LABEL_11:
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F08410];
    uint64_t v16 = -6705;
    goto LABEL_13;
  }
  [(CoreCECDeviceProvider *)self giveDeckStatusWithRequest:v21 to:v11 error:&v22];
  v12 = v22;
  if (a5) {
LABEL_9:
  }
    *a5 = v12;
  return v12 == 0;
}

- (BOOL)makeActiveSourceWithTVMenus:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v16 = 0;
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = objc_opt_class();
    BOOL v8 = "NO";
    if (v5) {
      BOOL v8 = "YES";
    }
    uint64_t v14 = self;
    uint64_t v15 = v8;
    uint64_t v12 = v7;
    LogPrintF();
  }
  BOOL v9 = -[CoreCECDeviceProvider oneTouchPlayWithMenu:to:error:](self, "oneTouchPlayWithMenu:to:error:", v5, 0, &v16, v12, v14, v15);
  if (v9)
  {
    if (![(CoreCECDeviceProvider *)self menuStatus:0 to:0 error:&v16]
      && gLogCategory_CoreRCDevice <= 90
      && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      uint64_t v13 = v16;
      LogPrintF();
    }
    objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider", v13), "setActiveSource:", self);
  }
  if (a4)
  {
    uint64_t v10 = v16;
    if (v9) {
      uint64_t v10 = 0;
    }
    *a4 = v10;
  }
  return v9;
}

- (BOOL)performStandbyWithTargetDevice:(id)a3 error:(id *)a4
{
  uint64_t v16 = 0;
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v14 = self;
    id v15 = a3;
    uint64_t v13 = objc_opt_class();
    LogPrintF();
  }
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = *MEMORY[0x263F08410];
      uint64_t v10 = -6705;
LABEL_14:
      uint64_t v11 = objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v10, 0, v13, v14, v15);
      if (!a4) {
        return v11 == 0;
      }
      goto LABEL_11;
    }
    uint64_t v7 = [a3 logicalAddress];
    if (v7 == 15)
    {
      BOOL v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = *MEMORY[0x263F08410];
      uint64_t v10 = -6761;
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v7 = 15;
  }
  -[CoreCECDeviceProvider standbyTo:error:](self, "standbyTo:error:", v7, &v16, v13, v14, v15);
  uint64_t v11 = v16;
  if (a4) {
LABEL_11:
  }
    *a4 = v11;
  return v11 == 0;
}

- (BOOL)refreshProperties:(id)a3 ofDevice:(id)a4 error:(id *)a5
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    id v18 = a3;
    id v19 = a4;
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = self;
    LogPrintF();
  }
  if (a3 || a4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08410];
    uint64_t v15 = -6705;
    goto LABEL_16;
  }
  int v9 = objc_msgSend(a4, "logicalAddress", v16, v17, v18, v19);
  if (v9 == 15)
  {
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08410];
    uint64_t v15 = -6761;
LABEL_16:
    uint64_t v11 = objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v15, 0, v16, v17, v18, v19);
    if (!a5) {
      return v11 == 0;
    }
    goto LABEL_12;
  }
  char v10 = v9;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __58__CoreCECDeviceProvider_refreshProperties_ofDevice_error___block_invoke;
  v27[3] = &unk_2652E4E08;
  v27[4] = self;
  char v28 = v9;
  [(CoreCECDeviceProvider *)self dispatchAsyncLowPriority:v27];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __58__CoreCECDeviceProvider_refreshProperties_ofDevice_error___block_invoke_2;
  v25[3] = &unk_2652E4E08;
  v25[4] = self;
  char v26 = v10;
  [(CoreCECDeviceProvider *)self dispatchAsyncLowPriority:v25];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __58__CoreCECDeviceProvider_refreshProperties_ofDevice_error___block_invoke_3;
  v23[3] = &unk_2652E4E08;
  v23[4] = self;
  char v24 = v10;
  [(CoreCECDeviceProvider *)self dispatchAsyncLowPriority:v23];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __58__CoreCECDeviceProvider_refreshProperties_ofDevice_error___block_invoke_4;
  v21[3] = &unk_2652E4E08;
  v21[4] = self;
  char v22 = v10;
  [(CoreCECDeviceProvider *)self dispatchAsyncLowPriority:v21];
  if ([a4 logicalAddress] == 5)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __58__CoreCECDeviceProvider_refreshProperties_ofDevice_error___block_invoke_5;
    v20[3] = &unk_2652E3F20;
    v20[4] = self;
    [(CoreCECDeviceProvider *)self dispatchAsyncLowPriority:v20];
  }
  uint64_t v11 = 0;
  if (a5) {
LABEL_12:
  }
    *a5 = v11;
  return v11 == 0;
}

uint64_t __58__CoreCECDeviceProvider_refreshProperties_ofDevice_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) givePhysicalAddressTo:*(unsigned __int8 *)(a1 + 40) error:0];
}

uint64_t __58__CoreCECDeviceProvider_refreshProperties_ofDevice_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) giveDevicePowerStatusTo:*(unsigned __int8 *)(a1 + 40) error:0];
}

uint64_t __58__CoreCECDeviceProvider_refreshProperties_ofDevice_error___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) getCECVersionTo:*(unsigned __int8 *)(a1 + 40) error:0];
}

uint64_t __58__CoreCECDeviceProvider_refreshProperties_ofDevice_error___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) giveDeviceVendorIDTo:*(unsigned __int8 *)(a1 + 40) error:0];
}

uint64_t __58__CoreCECDeviceProvider_refreshProperties_ofDevice_error___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshSystemAudioModeStatus];
}

- (BOOL)sendHIDEvent:(id)a3 target:(id)a4 error:(id *)a5
{
  id v18 = 0;
  id v19 = a4;
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    id v13 = a3;
    id v14 = a4;
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = self;
    LogPrintF();
  }
  if (objc_msgSend(a3, "isRepeat", v11, v12, v13, v14)
    || a4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (v17 = 0, v16 = 0, char v15 = 0, ([a3 getCECUserControl:&v16 pressed:&v15] & 1) == 0))
  {
    id v18 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
    goto LABEL_18;
  }
  if (![(CoreCECDeviceProvider *)self getRemoteControlDestination:&v19 logicalAddress:&v17 forTargetDevice:a4 command:v16 error:&v18])goto LABEL_18; {
  if (v15)
  }
  {
    [(CoreCECDeviceProvider *)self userControlCancelInitiatorTrackAudioStatusTimeout];
    [(CoreCECDeviceProvider *)self userControlScheduleInitiatorRepetitionTimeout];
    if (![(CoreCECDeviceProvider *)self userControlPressed:v16 to:v17 error:&v18])
    {
      [(CoreCECDeviceProvider *)self userControlCancelInitiatorRepetitionTimeout];
      goto LABEL_18;
    }
    self->_userControlInitiatorState.control = (CECUserControl)v16;
    self->_userControlInitiatorState.destination = v17;
    self->_userControlInitiatorState.isValid = 1;
  }
  else
  {
    if (!self->_userControlInitiatorState.isValid) {
      goto LABEL_18;
    }
    if (!CECUserControlEquals(*(void *)&self->_userControlInitiatorState.control, v16)) {
      goto LABEL_18;
    }
    self->_userControlInitiatorState.isValid = 0;
    [(CoreCECDeviceProvider *)self userControlCancelInitiatorRepetitionTimeout];
    if (![(CoreCECDeviceProvider *)self userControlReleasedTo:self->_userControlInitiatorState.destination error:&v18])goto LABEL_18; {
  }
    }
  if ([(CoreCECDeviceProvider *)self trackAudioStatusEnabled]) {
    [(CoreCECDeviceProvider *)self userControlScheduleInitiatorTrackAudioStatusTimeout];
  }
LABEL_18:
  int v9 = v18;
  if (a5) {
    *a5 = v18;
  }
  return v9 == 0;
}

- (BOOL)resignActiveSource:(id *)a3
{
  int v9 = 0;
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = objc_opt_class();
    BOOL v8 = self;
    LogPrintF();
  }
  if (-[CoreCECDeviceProvider sendActiveSourceStatus:error:](self, "sendActiveSourceStatus:error:", 0, &v9, v7, v8)) {
    objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "makeDeviceInactiveSource:", self);
  }
  BOOL v5 = v9;
  if (a3) {
    *a3 = v9;
  }
  return v5 == 0;
}

- (void)refreshActiveSource
{
  id v2 = 0;
  if (![(CoreCECDeviceProvider *)self requestActiveSource:&v2]
    && gLogCategory_CoreRCDevice <= 90
    && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    [v2 localizedDescription];
    LogPrintF();
  }
}

- (void)refreshSystemAudioModeStatus
{
  if ([(CoreCECDevice *)self deviceType] != 1)
  {
    id v3 = 0;
    if (![(CoreCECDeviceProvider *)self giveSystemAudioModeStatusTo:5 error:&v3])
    {
      if ([v3 isCECAcknowledgementError])
      {
        if (gLogCategory_CoreRCDevice <= 40
          && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "setSystemAudioModeStatus:", 1);
      }
    }
  }
}

- (void)broadcastPresence
{
  if ([(CoreCECDevice *)self isCEC2Device]) {
    [(CoreCECDeviceProvider *)self reportFeatures:0];
  }
  [(CoreCECDeviceProvider *)self reportPhysicalAddress:0];
  unint64_t v3 = [(CoreCECDevice *)self vendorID];
  [(CoreCECDeviceProvider *)self deviceVendorID:v3 error:0];
}

- (void)dispatchAsyncLowPriority:(id)a3
{
  dispatch_block_t v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, a3);
  dispatch_async((dispatch_queue_t)[(CoreCECDeviceProvider *)self serialQueue], v4);
  _Block_release(v4);
}

- (void)probeAbsoluteVolumeControl_handleFeatureAbortReceivedFromDevice:(id)a3 withOpcode:(unsigned __int8)a4 reason:(unsigned __int8)a5
{
  if (gLogCategory_CoreRCDevice <= 40)
  {
    unsigned int v6 = a5;
    if (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())
    {
      CECAbortReasonString(v6);
      LogPrintF();
    }
  }
  [a3 setFeature:20 supportStatus:1];
}

- (BOOL)setAudioVolumeStatus:(unint64_t)a3 error:(id *)a4
{
  unsigned __int8 v21 = 0;
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    unint64_t v17 = a3;
    id v19 = self;
    LogPrintF();
  }
  if ([(CoreCECDevice *)self deviceType] != 1)
  {
    if (![(CoreCECDevice *)self systemAudioControlEnabled])
    {
      uint64_t v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F08410];
      uint64_t v14 = -6709;
      goto LABEL_33;
    }
    if (objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "systemAudioModeStatus") == 2) {
      uint64_t v8 = 5;
    }
    else {
      uint64_t v8 = 0;
    }
    int v9 = objc_msgSend(-[CoreRCDevice bus](self, "bus"), "addDeviceWithLogicalAddress:message:reason:", v8, 0, 3);
    if (!v9)
    {
      if (gLogCategory_CoreRCDevice <= 90)
      {
        if (gLogCategory_CoreRCDevice == -1)
        {
          unsigned int v7 = _LogCategory_Initialize();
          if (!v7) {
            goto LABEL_34;
          }
        }
        goto LABEL_44;
      }
LABEL_45:
      LOBYTE(v7) = 0;
      goto LABEL_34;
    }
    char v10 = v9;
    uint64_t v11 = [v9 featureSupportStatus:20];
    if (v11)
    {
      if (v11 == 2)
      {
        if (gLogCategory_CoreRCDevice <= 40
          && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
        {
          uint64_t v18 = a3;
          LogPrintF();
        }
        if (objc_msgSend(-[CoreRCDevice bus](self, "bus"), "sendMessage:error:", +[CECMessage setAudioVolumeLevel:from:to:](CECMessage, "setAudioVolumeLevel:from:to:", a3, -[CoreCECDevice logicalAddress](self, "logicalAddress", v18), v8), &v21))
        {
          [v10 setAudioVolumeStatus:a3 error:0];
          goto LABEL_28;
        }
        if (gLogCategory_CoreRCDevice <= 90)
        {
          if (gLogCategory_CoreRCDevice == -1)
          {
            unsigned int v7 = _LogCategory_Initialize();
            if (!v7) {
              goto LABEL_34;
            }
          }
LABEL_44:
          LogPrintF();
          goto LABEL_45;
        }
        goto LABEL_45;
      }
      if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
        goto LABEL_32;
      }
    }
    else if (gLogCategory_CoreRCDevice > 40 {
           || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_32;
    }
    LogPrintF();
LABEL_32:
    uint64_t v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08410];
    uint64_t v14 = -6735;
LABEL_33:
    uint64_t v15 = [v12 errorWithDomain:v13 code:v14 userInfo:0];
    LOBYTE(v7) = 0;
    unsigned __int8 v21 = (void *)v15;
    goto LABEL_34;
  }
  if ([(CoreCECDevice *)self audioVolumeStatus] == a3)
  {
LABEL_28:
    LOBYTE(v7) = 1;
    goto LABEL_34;
  }
  v20.receiver = self;
  v20.super_class = (Class)CoreCECDeviceProvider;
  unsigned int v7 = [(CoreCECDevice *)&v20 setAudioVolumeStatus:a3 error:&v21];
  if (v7)
  {
    [(CoreCECDeviceProvider *)self audioStatusChanged];
    objc_msgSend(-[CoreRCDevice bus](self, "bus"), "notifyDelegateDeviceUpdated:", self);
    goto LABEL_28;
  }
LABEL_34:
  if (a4 && v21) {
    *a4 = v21;
  }
  return v7;
}

- (BOOL)setAudioMuteStatus:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = @"NO";
    if (v5) {
      uint64_t v8 = @"YES";
    }
    uint64_t v12 = self;
    uint64_t v13 = v8;
    uint64_t v11 = v7;
    LogPrintF();
  }
  if ([(CoreCECDevice *)self audioMuteStatus] == v5) {
    goto LABEL_10;
  }
  v14.receiver = self;
  v14.super_class = (Class)CoreCECDeviceProvider;
  BOOL v9 = [(CoreCECDevice *)&v14 setAudioMuteStatus:v5 error:a4];
  if (v9)
  {
    [(CoreCECDeviceProvider *)self audioStatusChanged];
    objc_msgSend(-[CoreRCDevice bus](self, "bus"), "notifyDelegateDeviceUpdated:", self);
LABEL_10:
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (BOOL)setSystemAudioControlEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  objc_super v14 = 0;
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = "NO";
    if (v5) {
      uint64_t v8 = "YES";
    }
    uint64_t v11 = self;
    uint64_t v12 = v8;
    uint64_t v10 = v7;
    LogPrintF();
  }
  if ([(CoreCECDevice *)self systemAudioControlEnabled] == v5) {
    return 1;
  }
  if (v5) {
    [(CoreCECDeviceProvider *)self refreshSystemAudioModeStatus];
  }
  v13.receiver = self;
  v13.super_class = (Class)CoreCECDeviceProvider;
  if ([(CoreCECDevice *)&v13 setSystemAudioControlEnabled:v5 error:&v14])
  {
    objc_msgSend(-[CoreRCDevice bus](self, "bus"), "notifyDelegateDeviceUpdated:", self);
    return 1;
  }
  BOOL result = 0;
  if (a4) {
    *a4 = v14;
  }
  return result;
}

- (BOOL)setSupportedAudioFormats:(id)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = self;
    LogPrintF();
  }
  v11.receiver = self;
  v11.super_class = (Class)CoreCECDeviceProvider;
  BOOL v7 = -[CoreCECDevice setSupportedAudioFormats:error:](&v11, sel_setSupportedAudioFormats_error_, a3, a4, v9, v10);
  if (v7) {
    objc_msgSend(-[CoreRCDevice bus](self, "bus"), "notifyDelegateDeviceUpdated:", self);
  }
  return v7;
}

- (BOOL)systemAudioModeRequest:(unint64_t)a3 error:(id *)a4
{
  uint64_t v16 = 0;
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = objc_opt_class();
    objc_super v14 = self;
    uint64_t v15 = CoreCECSystemAudioModeStatusString(a3);
    uint64_t v13 = v7;
    LogPrintF();
  }
  if (![(CoreCECDevice *)self systemAudioControlEnabled]
    || [(CoreCECDevice *)self deviceType] != 2)
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08410];
    uint64_t v11 = -6709;
    goto LABEL_16;
  }
  if (a3 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08410];
    uint64_t v11 = -6705;
LABEL_16:
    uint64_t v12 = [v9 errorWithDomain:v10 code:v11 userInfo:0];
    BOOL result = 0;
    uint64_t v16 = (void *)v12;
    if (!a4) {
      return result;
    }
    goto LABEL_11;
  }
  if (objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "systemAudioModeStatus") == a3) {
    return 1;
  }
  BOOL result = [(CoreCECDeviceProvider *)self deviceRequestSystemAudioModeStatusChangeTo:a3 == 2 error:&v16];
  if (a4)
  {
LABEL_11:
    if (!result)
    {
      BOOL result = 0;
      *a4 = v16;
    }
  }
  return result;
}

- (BOOL)requestSystemAudioModeStatusChangeTo:(unint64_t)a3 error:(id *)a4
{
  uint64_t v15 = 0;
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v13 = self;
    uint64_t v14 = CoreCECActivationStatusString(a3);
    uint64_t v12 = v7;
    LogPrintF();
  }
  if (![(CoreCECDevice *)self systemAudioControlEnabled])
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08410];
    uint64_t v11 = -6709;
LABEL_14:
    uint64_t v15 = (void *)[v9 errorWithDomain:v10 code:v11 userInfo:0];
    goto LABEL_15;
  }
  if ([(CoreCECDeviceProvider *)self systemAudioModeTransitionInProgress])
  {
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08410];
    uint64_t v11 = 1;
    goto LABEL_14;
  }
  if ([(CoreCECDevice *)self deviceType] != 1)
  {
    if (![(CoreCECDeviceProvider *)self deviceRequestSystemAudioModeStatusChangeTo:a3 error:&v15])goto LABEL_15; {
    return 1;
    }
  }
  if ([(CoreCECDeviceProvider *)self audioSystemRequestSystemAudioModeStatusChangeTo:a3 error:&v15])
  {
    return 1;
  }
LABEL_15:
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    CoreCECActivationStatusString(a3);
    LogPrintF();
  }
  BOOL result = 0;
  if (a4) {
    *a4 = v15;
  }
  return result;
}

- (BOOL)setAudioReturnChannelControlEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v14 = 0;
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = "NO";
    if (v5) {
      uint64_t v8 = "YES";
    }
    uint64_t v11 = self;
    uint64_t v12 = v8;
    uint64_t v10 = v7;
    LogPrintF();
  }
  if ([(CoreCECDevice *)self audioReturnChannelControlEnabled] == v5) {
    return 1;
  }
  v13.receiver = self;
  v13.super_class = (Class)CoreCECDeviceProvider;
  if ([(CoreCECDevice *)&v13 setAudioReturnChannelControlEnabled:v5 error:&v14])
  {
    objc_msgSend(-[CoreRCDevice bus](self, "bus"), "notifyDelegateDeviceUpdated:", self);
    return 1;
  }
  BOOL result = 0;
  if (a4) {
    *a4 = v14;
  }
  return result;
}

- (BOOL)requestAudioReturnChannelStatusChangeTo:(unint64_t)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = CoreCECActivationStatusString(a3);
    uint64_t v15 = objc_opt_class();
    unint64_t v17 = self;
    uint64_t v13 = v7;
    LogPrintF();
  }
  BOOL v8 = [(CoreCECDevice *)self audioReturnChannelControlEnabled];
  if (v8)
  {
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = CoreCECActivationStatusString(a3);
      uint64_t v16 = objc_opt_class();
      uint64_t v18 = self;
      uint64_t v14 = v9;
      LogPrintF();
    }
    if (a3 == 1) {
      uint64_t v10 = sel_arcStarting;
    }
    else {
      uint64_t v10 = sel_arcStopping;
    }
    -[CoreCECDeviceProvider dispatchSelector:](self, "dispatchSelector:", v10, v14, v16, v18);
  }
  else
  {
    uint64_t v12 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6709 userInfo:0];
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      CoreCECActivationStatusString(a3);
      [v12 localizedDescription];
      objc_opt_class();
      LogPrintF();
    }
    if (a4) {
      *a4 = v12;
    }
  }
  return v8;
}

- (void)didChangePowerStatus:(unint64_t)a3
{
  if (a3 == 2)
  {
    objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "makeDeviceInactiveSource:", self);
  }
  else if (a3 == 1 && [(CoreCECDevice *)self systemAudioControlEnabled])
  {
    [(CoreCECDeviceProvider *)self refreshSystemAudioModeStatus];
  }
  objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "updateAllowHibernation");
  if ([(CoreCECDevice *)self isCEC2Device])
  {
    uint64_t v8 = 0;
    unsigned __int8 v7 = 0;
    CECPowerStatusForCoreCECPowerStatus(&v7, a3);
    if (![(CoreCECDeviceProvider *)self reportPowerStatus:v7 to:15 error:&v8]
      && gLogCategory_CoreRCDevice <= 60
      && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = v8;
      LogPrintF();
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)CoreCECDeviceProvider;
  -[CoreCECDevice didChangePowerStatus:](&v6, sel_didChangePowerStatus_, a3, v5);
}

- (BOOL)setTrackAudioStatusEnabled:(BOOL)a3 pressTimeout:(int64_t)a4 pollInterval:(int64_t)a5 error:(id *)a6
{
  BOOL v8 = a3;
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = "NO";
    if (v8) {
      uint64_t v11 = "YES";
    }
    unint64_t v17 = self;
    uint64_t v18 = v11;
    uint64_t v15 = v10;
    LogPrintF();
  }
  BOOL v12 = [(CoreCECDeviceProvider *)self trackAudioStatusEnabled] ^ v8;
  if (v12)
  {
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      uint64_t v13 = "NO";
      if (v8) {
        uint64_t v13 = "YES";
      }
      uint64_t v16 = v13;
      LogPrintF();
    }
    -[CoreCECDeviceProvider setTrackAudioStatusEnabled:](self, "setTrackAudioStatusEnabled:", v8, v16);
    [(CoreCECDeviceProvider *)self setTrackAudioStatusPressTimeout:a4];
    [(CoreCECDeviceProvider *)self setTrackAudioStatusPollInterval:a5];
    objc_msgSend(-[CoreRCDevice bus](self, "bus"), "notifyDelegateDeviceUpdated:", self);
  }
  return v12;
}

- (BOOL)requestAudioStatus:(id *)a3
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = objc_opt_class();
    BOOL v8 = self;
    LogPrintF();
  }
  uint64_t v10 = 0;
  unsigned __int8 v9 = 0;
  BOOL v5 = -[CoreCECDeviceProvider getRemoteControlDestination:logicalAddress:forTargetDevice:command:error:](self, "getRemoteControlDestination:logicalAddress:forTargetDevice:command:error:", 0, &v9, 0, 65, &v10, v7, v8);
  if (v5)
  {
    [(CoreCECDeviceProvider *)self giveAudioStatusTo:v9 error:&v10];
  }
  else if (a3)
  {
    *a3 = v10;
  }
  return v5;
}

- (BOOL)getRemoteControlDestination:(id *)a3 logicalAddress:(unsigned __int8 *)a4 forTargetDevice:(id)a5 command:(unsigned __int8)a6 error:(id *)a7
{
  if (a5)
  {
    id v10 = a5;
    goto LABEL_3;
  }
  if ((a6 - 65) <= 0x25 && ((1 << (a6 - 65)) & 0x3000400007) != 0)
  {
    if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      if ([(CoreCECDevice *)self systemAudioControlEnabled]) {
        uint64_t v13 = "YES";
      }
      else {
        uint64_t v13 = "NO";
      }
      unint64_t v17 = v13;
      uint64_t v18 = CoreCECSystemAudioModeStatusString(objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "systemAudioModeStatus"));
      LogPrintF();
    }
    if ([(CoreCECDevice *)self systemAudioControlEnabled])
    {
      id v10 = 0;
      if (objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "systemAudioModeStatus") == 2) {
        unsigned __int8 v11 = 5;
      }
      else {
        unsigned __int8 v11 = 0;
      }
      if (a3) {
        goto LABEL_19;
      }
      goto LABEL_20;
    }
LABEL_35:
    uint64_t v14 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6709 userInfo:0];
    if (!a7) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  if (![(CoreCECDevice *)self isActiveSource])
  {
    uint64_t v16 = objc_msgSend(-[CoreRCDevice bus](self, "bus"), "activeSource");
    if (v16)
    {
      id v10 = (id)v16;
LABEL_3:
      unsigned __int8 v11 = [v10 logicalAddress];
      if (!a3) {
        goto LABEL_20;
      }
LABEL_19:
      *a3 = v10;
      goto LABEL_20;
    }
    goto LABEL_35;
  }
  if (![(CoreCECDevice *)self logicalAddress]) {
    goto LABEL_35;
  }
  id v10 = 0;
  unsigned __int8 v11 = 0;
  if (a3) {
    goto LABEL_19;
  }
LABEL_20:
  uint64_t v14 = 0;
  if (a4) {
    *a4 = v11;
  }
  if (a7) {
LABEL_23:
  }
    *a7 = v14;
LABEL_24:
  if (v14
    && gLogCategory_CoreRCDevice <= 90
    && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v14 == 0;
}

- (void)userControlScheduleInitiatorRepetitionTimeout
{
  unsigned int v3 = self->_userControlInitiatorRepetitionTimeoutGeneration + 1;
  self->_userControlInitiatorRepetitionTimeoutGeneration = v3;
  dispatch_time_t v4 = dispatch_time(0, 250000000);
  BOOL v5 = [(CoreCECDeviceProvider *)self serialQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__CoreCECDeviceProvider_userControlScheduleInitiatorRepetitionTimeout__block_invoke;
  v6[3] = &unk_2652E4E30;
  unsigned int v7 = v3;
  v6[4] = self;
  dispatch_after(v4, (dispatch_queue_t)v5, v6);
}

_DWORD *__70__CoreCECDeviceProvider_userControlScheduleInitiatorRepetitionTimeout__block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  BOOL result = *(_DWORD **)(a1 + 32);
  if (v1 == result[60]) {
    return (_DWORD *)[result userControlInitiatorRepetitionTimeoutExpired];
  }
  return result;
}

- (void)userControlCancelInitiatorRepetitionTimeout
{
}

- (void)userControlInitiatorRepetitionTimeoutExpired
{
  if (self->_userControlInitiatorState.isValid)
  {
    id v3 = +[CECMessage userControlPressed:*(void *)&self->_userControlInitiatorState.control from:[(CoreCECDeviceProvider *)self sendFromAddress] to:self->_userControlInitiatorState.destination];
    id v4 = 0;
    [(CoreCECDeviceProvider *)self userControlScheduleInitiatorRepetitionTimeout];
    if (![(CoreCECDeviceProvider *)self sendMessage:v3 error:&v4])
    {
      if ([v4 isCECAcknowledgementError])
      {
        [(CoreCECDeviceProvider *)self userControlCancelInitiatorRepetitionTimeout];
        if (gLogCategory_CoreRCDevice <= 60
          && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
    }
  }
}

- (void)userControlScheduleInitiatorTrackAudioStatusTimeout
{
  int64_t v3 = self->_userControlInitiatorTrackAudioStatusTimeoutGeneration + 1;
  self->_int64_t userControlInitiatorTrackAudioStatusTimeoutGeneration = v3;
  if (gLogCategory_CoreRCDevice <= 10)
  {
    int64_t userControlInitiatorTrackAudioStatusTimeoutGeneration = v3;
    if (gLogCategory_CoreRCDevice != -1)
    {
LABEL_3:
      int64_t v8 = v3;
      int64_t v10 = userControlInitiatorTrackAudioStatusTimeoutGeneration;
      LogPrintF();
      goto LABEL_5;
    }
    if (_LogCategory_Initialize())
    {
      int64_t userControlInitiatorTrackAudioStatusTimeoutGeneration = self->_userControlInitiatorTrackAudioStatusTimeoutGeneration;
      goto LABEL_3;
    }
  }
LABEL_5:
  if (self->_userControlInitiatorState.isValid)
  {
    if ([(CoreCECDeviceProvider *)self trackAudioStatusPollInterval] < 0) {
      return;
    }
    if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      int64_t v8 = [(CoreCECDeviceProvider *)self trackAudioStatusPollInterval];
      LogPrintF();
    }
    int64_t v5 = [(CoreCECDeviceProvider *)self trackAudioStatusPollInterval];
  }
  else
  {
    if ([(CoreCECDeviceProvider *)self trackAudioStatusPressTimeout] < 0) {
      return;
    }
    if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      int64_t v9 = [(CoreCECDeviceProvider *)self trackAudioStatusPressTimeout];
      LogPrintF();
      int64_t v5 = [(CoreCECDeviceProvider *)self trackAudioStatusPressTimeout];
    }
    else
    {
      int64_t v5 = [(CoreCECDeviceProvider *)self trackAudioStatusPressTimeout];
    }
  }
  dispatch_time_t v6 = dispatch_time(0, 1000000 * v5);
  unsigned int v7 = [(CoreCECDeviceProvider *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__CoreCECDeviceProvider_userControlScheduleInitiatorTrackAudioStatusTimeout__block_invoke;
  block[3] = &unk_2652E4E30;
  int v12 = v3;
  block[4] = self;
  dispatch_after(v6, (dispatch_queue_t)v7, block);
}

_DWORD *__76__CoreCECDeviceProvider_userControlScheduleInitiatorTrackAudioStatusTimeout__block_invoke(uint64_t a1)
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  BOOL result = *(_DWORD **)(a1 + 32);
  if (*(_DWORD *)(a1 + 40) == result[61])
  {
    return (_DWORD *)[result userControlInitiatorTrackAudioStatusTimeoutExpired];
  }
  return result;
}

- (void)userControlCancelInitiatorTrackAudioStatusTimeout
{
}

- (void)userControlInitiatorTrackAudioStatusTimeoutExpired
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    BOOL isValid = self->_userControlInitiatorState.isValid;
    LogPrintF();
  }
  p_userControlInitiatorState = &self->_userControlInitiatorState;
  if (self->_userControlInitiatorState.isValid)
  {
    id v6 = 0;
    if (-[CoreCECDeviceProvider giveAudioStatusTo:error:](self, "giveAudioStatusTo:error:", p_userControlInitiatorState->destination, &v6)|| ![v6 isCECAcknowledgementError])
    {
      if ([(CoreCECDeviceProvider *)self trackAudioStatusPollInterval]) {
        [(CoreCECDeviceProvider *)self userControlScheduleInitiatorTrackAudioStatusTimeout];
      }
    }
    else
    {
      [(CoreCECDeviceProvider *)self userControlCancelInitiatorTrackAudioStatusTimeout];
      if (gLogCategory_CoreRCDevice <= 60
        && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
  else
  {
    uint64_t destination = p_userControlInitiatorState->destination;
    [(CoreCECDeviceProvider *)self giveAudioStatusTo:destination error:0];
  }
}

- (void)userControlScheduleFollowerSafetyTimeout
{
  unsigned int v3 = self->_userControlFollowerSafetyTimeoutGeneration + 1;
  self->_userControlFollowerSafetyTimeoutGeneration = v3;
  dispatch_time_t v4 = dispatch_time(0, 550000000);
  int64_t v5 = [(CoreCECDeviceProvider *)self serialQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__CoreCECDeviceProvider_userControlScheduleFollowerSafetyTimeout__block_invoke;
  v6[3] = &unk_2652E4E30;
  unsigned int v7 = v3;
  v6[4] = self;
  dispatch_after(v4, (dispatch_queue_t)v5, v6);
}

_DWORD *__65__CoreCECDeviceProvider_userControlScheduleFollowerSafetyTimeout__block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  BOOL result = *(_DWORD **)(a1 + 32);
  if (v1 == result[62]) {
    return (_DWORD *)[result userControlFollowerSafetyTimeoutExpired];
  }
  return result;
}

- (void)userControlCancelFollowerSafetyTimeout
{
}

- (void)userControlFollowerSafetyTimeoutExpired
{
  if (gLogCategory_CoreRCDevice <= 60 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    CECUserControlString(*(void *)&self->_userControlFollowerState.control);
    objc_opt_class();
    LogPrintF();
  }
  [(CoreCECDeviceProvider *)self userControlFollowerSynthesizeRelease];
}

- (void)userControlFollowerSynthesizeRelease
{
  p_userControlFollowerState = &self->_userControlFollowerState;
  if (self->_userControlFollowerState.isValid)
  {
    if (gLogCategory_CoreRCDevice <= 60 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = objc_opt_class();
      int64_t v5 = CECUserControlString(*(void *)&p_userControlFollowerState->control);
      uint64_t v9 = objc_opt_class();
      sender = p_userControlFollowerState->sender;
      unsigned int v7 = self;
      int64_t v8 = v5;
      uint64_t v6 = v4;
      LogPrintF();
    }
    -[CoreCECDeviceProvider handleUserControl:pressed:fromDevice:abortReason:](self, "handleUserControl:pressed:fromDevice:abortReason:", *(void *)&p_userControlFollowerState->control, 0, p_userControlFollowerState->sender, 0, v6, v7, v8, v9, sender);
    p_userControlFollowerState->BOOL isValid = 0;

    p_userControlFollowerState->sender = 0;
  }
}

- (void)audioStatusChanged
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ([(CoreCECDeviceProvider *)self activeARCAudioSystem]
    && (p_userControlAudioState = &self->_userControlAudioState, self->_userControlAudioState.audioUserControlPressed))
  {
    dispatch_time_t v4 = dispatch_time(0, 0);
    self->_userControlAudioState.reportAudioStatusNeeded = 1;
    if (self->_userControlAudioState.audioUserControlReleased)
    {
      if (v4 >= p_userControlAudioState->nextTransmitTimestamp) {
        [(CoreCECDeviceProvider *)self scheduleReportAudioStatus];
      }
      [(CoreCECDeviceProvider *)self resetAudioStatusState];
    }
    else if (v4 >= p_userControlAudioState->nextTransmitTimestamp)
    {
      [(CoreCECDeviceProvider *)self scheduleReportAudioStatus];
      p_userControlAudioState->nextTransmitTimestamp = dispatch_time(0, 500000000);
      self->_userControlAudioState.reportAudioStatusNeeded = 0;
    }
  }
  else if (gLogCategory_CoreRCDevice <= 10 {
         && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)audioStatusHandleUserControl:(CECUserControl)a3 pressed:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(CoreCECDeviceProvider *)self activeARCAudioSystem])
  {
    if (v4)
    {
      [(CoreCECDeviceProvider *)self audioStatusHandleUserControlPressed];
    }
    else
    {
      [(CoreCECDeviceProvider *)self audioStatusHandleUserControlReleased];
    }
  }
}

- (void)audioStatusHandleUserControlPressed
{
  self->_userControlAudioState.audioUserControlPressed = dispatch_time(0, 0);
}

- (void)audioStatusHandleUserControlReleased
{
  p_userControlAudioState = &self->_userControlAudioState;
  if (!self->_userControlAudioState.audioUserControlPressed) {
    return;
  }
  dispatch_time_t v4 = dispatch_time(0, 0);
  p_userControlAudioState->audioUserControlReleased = v4;
  dispatch_time_t nextTransmitTimestamp = p_userControlAudioState->nextTransmitTimestamp;
  if (p_userControlAudioState->reportAudioStatusNeeded)
  {
    if (nextTransmitTimestamp)
    {
      if (v4 >= nextTransmitTimestamp) {
        [(CoreCECDeviceProvider *)self scheduleReportAudioStatus];
      }
    }
    else if (gLogCategory_CoreRCDevice <= 90 {
           && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
    goto LABEL_16;
  }
  if (nextTransmitTimestamp)
  {
LABEL_16:
    [(CoreCECDeviceProvider *)self resetAudioStatusState];
    return;
  }
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)scheduleReportAudioStatus
{
}

- (void)sendReportAudioStatus
{
}

- (BOOL)activeARCAudioSystem
{
  if ([(CoreCECDevice *)self deviceType] != 1
    || [(CoreCECDeviceProvider *)self systemAudioModeState] != 7)
  {
    return 0;
  }
  uint64_t v3 = objc_msgSend((id)objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "activeSource"), "physicalAddress");
  return v3 != [(CoreCECDevice *)self physicalAddress];
}

- (void)resetAudioStatusState
{
  self->_userControlAudioState.audioUserControlPressed = 0;
  self->_userControlAudioState.audioUserControlReleased = 0;
  self->_userControlAudioState.dispatch_time_t nextTransmitTimestamp = 0;
  self->_userControlAudioState.reportAudioStatusNeeded = 0;
}

- (BOOL)deviceRequestSystemAudioModeStatusChangeTo:(unint64_t)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = CoreCECActivationStatusString(a3);
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = self;
    uint64_t v11 = v7;
    LogPrintF();
  }
  unsigned __int16 v14 = 0;
  BOOL v8 = PackedPhysicalAddressForCoreCECPhysicalAddress(&v14, [(CoreCECDevice *)self physicalAddress]);
  if (v8)
  {
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      CoreCECActivationStatusString(a3);
      objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "systemAudioModeStatus");
      objc_opt_class();
      LogPrintF();
    }
    if (a3 == 1) {
      -[CoreCECDeviceProvider dispatchSelector:withObject:](self, "dispatchSelector:withObject:", sel_dsamStarting_, [NSNumber numberWithUnsignedShort:v14]);
    }
    else {
      [(CoreCECDeviceProvider *)self dispatchSelector:sel_dsamStopping];
    }
  }
  else
  {
    int64_t v10 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
    if (a4) {
      *a4 = v10;
    }
  }
  return v8;
}

- (void)dsamStarting:(id)a3
{
  unsigned __int16 v4 = [a3 unsignedIntegerValue];
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(CoreCECDeviceProvider *)self dsamStartingWithPhysicalAddress:v4];
}

- (void)dsamStartingWithPhysicalAddress:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v8 = 0;
  [(CoreCECDeviceProvider *)self setSystemAudioModeState:1];
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = v3;
    LogPrintF();
  }
  if ([(CoreCECDeviceProvider *)self sendMessage:+[CECMessage systemAudioModeRequestWithPhysicalAddress:v3 from:[(CoreCECDeviceProvider *)self sendFromAddress] to:5] error:&v8])
  {
    [(CoreCECDeviceProvider *)self dispatchSelector:sel_dsamStarting_handleBroadcastSSAMOnResponseTimeout afterDelay:2.0];
    [(CoreCECDeviceProvider *)self setSystemAudioModeState:10];
  }
  else
  {
    if (gLogCategory_CoreRCDevice <= 90 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = v3;
      uint64_t v7 = v8;
      LogPrintF();
    }
    [(CoreCECDeviceProvider *)self samResetStateToOff];
    [(CoreCECDeviceProvider *)self samInformDelegateTransitionTo:1 failedWithError:v8];
  }
}

- (void)dsamStarting_handleBroadcastSSAMOnResponseTimeout
{
  if (![(CoreCECDeviceProvider *)self systemAudioModeTransitionInProgress])
  {
    if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return;
    }
LABEL_11:
    [(CoreCECDeviceProvider *)self systemAudioModeState];
    LogPrintF();
    return;
  }
  if ([(CoreCECDeviceProvider *)self systemAudioModeState] != 10)
  {
    if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return;
    }
    goto LABEL_11;
  }
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(CoreCECDeviceProvider *)self samResetStateToOff];
  uint64_t v3 = [MEMORY[0x263F087E8] cecTimeoutError];
  [(CoreCECDeviceProvider *)self samInformDelegateTransitionTo:1 failedWithError:v3];
}

- (void)dsamStarting_handleBroadcastSSAMOnResponseReceived
{
  if (![(CoreCECDeviceProvider *)self systemAudioModeTransitionInProgress])
  {
    if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return;
    }
LABEL_11:
    [(CoreCECDeviceProvider *)self systemAudioModeState];
    LogPrintF();
    return;
  }
  if ([(CoreCECDeviceProvider *)self systemAudioModeState] != 10)
  {
    if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return;
    }
    goto LABEL_11;
  }
  [(CoreCECDeviceProvider *)self setSystemAudioModeState:7];
  [(CoreCECDeviceProvider *)self samInformDelegateOfSuccessTransitioningTo:1];
}

- (void)dsamStopping
{
  uint64_t v4 = 0;
  [(CoreCECDeviceProvider *)self setSystemAudioModeState:8];
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ([(CoreCECDeviceProvider *)self sendMessage:+[CECMessage systemAudioModeRequestWithPhysicalAddress:0xFFFFLL from:[(CoreCECDeviceProvider *)self sendFromAddress] to:5] error:&v4])
  {
    [(CoreCECDeviceProvider *)self dispatchSelector:sel_dsamStopping_handleBroadcastSSAMOffResponseTimeout afterDelay:2.0];
    [(CoreCECDeviceProvider *)self setSystemAudioModeState:11];
  }
  else
  {
    if (gLogCategory_CoreRCDevice <= 90 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      uint64_t v3 = v4;
      LogPrintF();
    }
    -[CoreCECDeviceProvider setSystemAudioModeState:](self, "setSystemAudioModeState:", 7, v3);
    [(CoreCECDeviceProvider *)self samInformDelegateTransitionTo:0 failedWithError:v4];
  }
}

- (void)dsamStopping_handleBroadcastSSAMOffResponseTimeout
{
  if (![(CoreCECDeviceProvider *)self systemAudioModeTransitionInProgress])
  {
    if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return;
    }
LABEL_11:
    [(CoreCECDeviceProvider *)self systemAudioModeState];
    LogPrintF();
    return;
  }
  if ([(CoreCECDeviceProvider *)self systemAudioModeState] != 11)
  {
    if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return;
    }
    goto LABEL_11;
  }
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(CoreCECDeviceProvider *)self setSystemAudioModeState:7];
  uint64_t v3 = [MEMORY[0x263F087E8] cecTimeoutError];
  [(CoreCECDeviceProvider *)self samInformDelegateTransitionTo:0 failedWithError:v3];
}

- (void)dsamStopping_handleBroadcastSSAMOffResponseReceived
{
  if (![(CoreCECDeviceProvider *)self systemAudioModeTransitionInProgress])
  {
    if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return;
    }
LABEL_11:
    [(CoreCECDeviceProvider *)self systemAudioModeState];
    LogPrintF();
    return;
  }
  if ([(CoreCECDeviceProvider *)self systemAudioModeState] != 11)
  {
    if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return;
    }
    goto LABEL_11;
  }
  [(CoreCECDeviceProvider *)self samResetStateToOff];
  [(CoreCECDeviceProvider *)self samInformDelegateOfSuccessTransitioningTo:0];
}

- (BOOL)audioSystemRequestSystemAudioModeStatusChangeTo:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = CoreCECActivationStatusString(a3);
    if (objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "systemAudioModeStatus") == v6) {
      uint64_t v8 = @"- no state change";
    }
    else {
      uint64_t v8 = &stru_26FECF2C8;
    }
    uint64_t v13 = objc_opt_class();
    unsigned __int16 v14 = self;
    uint64_t v11 = v7;
    uint64_t v12 = v8;
    LogPrintF();
  }
  uint64_t v9 = &selRef_samStarting;
  if (a3 != 1) {
    uint64_t v9 = &selRef_samStopping;
  }
  -[CoreCECDeviceProvider dispatchSelector:](self, "dispatchSelector:", *v9, v11, v12, v13, v14);
  return 1;
}

- (void)samStarting
{
  BOOL v3 = [(CoreCECDeviceProvider *)self systemAudioModeRequestedByTV];
  BOOL v4 = [(CoreCECDeviceProvider *)self systemAudioModeRequestedByOtherDevice];
  [(CoreCECDeviceProvider *)self setSystemAudioModeState:1];
  [(CoreCECDeviceProvider *)self setSystemAudioModeRequestedByTV:0];
  [(CoreCECDeviceProvider *)self setSystemAudioModeRequestedByOtherDevice:0];
  if (v3)
  {
    [(CoreCECDeviceProvider *)self samStarting_broadcast_SSAM_ON];
  }
  else if (v4 || objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "activeSource"))
  {
    [(CoreCECDeviceProvider *)self samStarting_send_SSAM_ON_to_TV];
  }
  else
  {
    [(CoreCECDeviceProvider *)self samStarting_broadcast_Req_Act_Src];
  }
}

- (void)samStarting_broadcast_Req_Act_Src
{
  uint64_t v4 = 0;
  [(CoreCECDeviceProvider *)self setSystemAudioModeState:2];
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ([(CoreCECDeviceProvider *)self sendMessage:+[CECMessage requestActiveSourceFrom:[(CoreCECDevice *)self logicalAddress]] error:&v4])
  {
    [(CoreCECDeviceProvider *)self dispatchSelector:sel_samStarting_handleActiveSourceResponseTimeout afterDelay:2.0];
    [(CoreCECDeviceProvider *)self setSystemAudioModeState:3];
  }
  else
  {
    if (gLogCategory_CoreRCDevice <= 60 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      uint64_t v3 = v4;
      LogPrintF();
    }
    [(CoreCECDeviceProvider *)self samResetStateToOff];
    [(CoreCECDeviceProvider *)self samInformDelegateTransitionTo:1 failedWithError:v4];
  }
}

- (void)samStarting_handleActiveSourceResponseTimeout
{
  if (![(CoreCECDeviceProvider *)self systemAudioModeTransitionInProgress])
  {
    if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return;
    }
LABEL_11:
    [(CoreCECDeviceProvider *)self systemAudioModeState];
    LogPrintF();
    return;
  }
  if ([(CoreCECDeviceProvider *)self systemAudioModeState] != 3)
  {
    if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return;
    }
    goto LABEL_11;
  }
  [(CoreCECDeviceProvider *)self setSystemAudioModeState:4];
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(CoreCECDeviceProvider *)self samStarting_send_SSAM_ON_to_TV];
}

- (void)samStarting_handleActiveSourceReceived
{
  if (![(CoreCECDeviceProvider *)self systemAudioModeTransitionInProgress])
  {
    if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return;
    }
LABEL_11:
    [(CoreCECDeviceProvider *)self systemAudioModeState];
    LogPrintF();
    return;
  }
  if ([(CoreCECDeviceProvider *)self systemAudioModeState] != 3)
  {
    if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return;
    }
    goto LABEL_11;
  }
  [(CoreCECDeviceProvider *)self setSystemAudioModeState:4];
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(CoreCECDeviceProvider *)self samStarting_send_SSAM_ON_to_TV];
}

- (void)samStarting_send_SSAM_ON_to_TV
{
  uint64_t v4 = 0;
  [(CoreCECDeviceProvider *)self setSystemAudioModeState:4];
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ([(CoreCECDeviceProvider *)self sendMessage:+[CECMessage setSystemAudioMode:1 from:[(CoreCECDevice *)self logicalAddress] to:0] error:&v4])
  {
    [(CoreCECDeviceProvider *)self dispatchSelector:sel_samStarting_handleFeatureAbortResponseTimeout afterDelay:1.0];
    [(CoreCECDeviceProvider *)self setSystemAudioModeState:5];
  }
  else
  {
    if (gLogCategory_CoreRCDevice <= 60 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      uint64_t v3 = v4;
      LogPrintF();
    }
    [(CoreCECDeviceProvider *)self samResetStateToOff];
    [(CoreCECDeviceProvider *)self samInformDelegateTransitionTo:1 failedWithError:v4];
  }
}

- (void)samStarting_handleFeatureAbortResponseTimeout
{
  if (![(CoreCECDeviceProvider *)self systemAudioModeTransitionInProgress])
  {
    if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return;
    }
LABEL_11:
    [(CoreCECDeviceProvider *)self systemAudioModeState];
    LogPrintF();
    return;
  }
  if ([(CoreCECDeviceProvider *)self systemAudioModeState] != 5)
  {
    if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return;
    }
    goto LABEL_11;
  }
  [(CoreCECDeviceProvider *)self setSystemAudioModeState:6];
  [(CoreCECDeviceProvider *)self samStarting_broadcast_SSAM_ON];
}

- (void)samStarting_handleFeatureAbortReceived
{
  if (![(CoreCECDeviceProvider *)self systemAudioModeTransitionInProgress])
  {
    if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return;
    }
LABEL_11:
    [(CoreCECDeviceProvider *)self systemAudioModeState];
    LogPrintF();
    return;
  }
  if ([(CoreCECDeviceProvider *)self systemAudioModeState] != 5)
  {
    if (gLogCategory_CoreRCDevice > 40 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return;
    }
    goto LABEL_11;
  }
  uint64_t v3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6735 userInfo:0];
  [(CoreCECDeviceProvider *)self samResetStateToOff];
  [(CoreCECDeviceProvider *)self samInformDelegateTransitionTo:1 failedWithError:v3];
}

- (void)samStarting_broadcast_SSAM_ON
{
  uint64_t v3 = 0;
  [(CoreCECDeviceProvider *)self setSystemAudioModeState:6];
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ([(CoreCECDeviceProvider *)self sendMessage:+[CECMessage setSystemAudioMode:1 from:[(CoreCECDevice *)self logicalAddress] to:15] error:&v3])
  {
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CoreCECDeviceProvider *)self setSystemAudioModeState:7];
    [(CoreCECDeviceProvider *)self setSystemAudioModeRequestedByTV:0];
    [(CoreCECDeviceProvider *)self setSystemAudioModeRequestedByOtherDevice:0];
    [(CoreCECDeviceProvider *)self samInformDelegateOfSuccessTransitioningTo:1];
  }
  else
  {
    if (gLogCategory_CoreRCDevice <= 90 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CoreCECDeviceProvider *)self samResetStateToOff];
    [(CoreCECDeviceProvider *)self samInformDelegateTransitionTo:1 failedWithError:v3];
  }
}

- (void)samStopping
{
  uint64_t v3 = 0;
  [(CoreCECDeviceProvider *)self setSystemAudioModeState:8];
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if ([(CoreCECDeviceProvider *)self sendMessage:+[CECMessage setSystemAudioMode:0 from:[(CoreCECDevice *)self logicalAddress] to:15] error:&v3])
  {
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CoreCECDeviceProvider *)self samResetStateToOff];
    [(CoreCECDeviceProvider *)self samInformDelegateOfSuccessTransitioningTo:0];
  }
  else
  {
    if (gLogCategory_CoreRCDevice <= 60 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CoreCECDeviceProvider *)self setSystemAudioModeState:7];
    [(CoreCECDeviceProvider *)self samInformDelegateTransitionTo:0 failedWithError:v3];
  }
}

- (void)samResetStateToOff
{
  [(CoreCECDeviceProvider *)self setSystemAudioModeState:0];
  [(CoreCECDeviceProvider *)self setSystemAudioModeRequestedByTV:0];
  [(CoreCECDeviceProvider *)self setSystemAudioModeRequestedByOtherDevice:0];
}

- (BOOL)systemAudioModeTransitionInProgress
{
  int v2 = [(CoreCECDeviceProvider *)self systemAudioModeState];
  return v2 != 7 && v2 != 0;
}

- (void)samInformDelegateOfSuccessTransitioningTo:(unint64_t)a3
{
  if ([(CoreCECDeviceProvider *)self isValid])
  {
    [(CoreCECDevice *)self requestSystemAudioModeStatusChangeTo:a3 didFinishWithResult:1 error:0];
  }
}

- (void)samInformDelegateTransitionTo:(unint64_t)a3 failedWithError:(id)a4
{
  if ([(CoreCECDeviceProvider *)self isValid])
  {
    [(CoreCECDevice *)self requestSystemAudioModeStatusChangeTo:a3 didFinishWithResult:0 error:a4];
  }
}

- (void)arcStarting
{
  uint64_t v8 = 0;
  uint64_t v3 = objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "arcTxAddressForArcRxDevice:", self);
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v7 = self;
    LogPrintF();
  }
  -[CoreCECDeviceProvider setAudioReturnChannelState:](self, "setAudioReturnChannelState:", 1, v4, v7);
  if (![(CoreCECDeviceProvider *)self initiateARC:v3 error:&v8])
  {
    if (gLogCategory_CoreRCDevice <= 60 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = v8;
      LogPrintF();
      -[CoreCECDeviceProvider arcInformDelegateTransitionTo:failedWithError:](self, "arcInformDelegateTransitionTo:failedWithError:", 1, v8, v6);
    }
    else
    {
      -[CoreCECDeviceProvider arcInformDelegateTransitionTo:failedWithError:](self, "arcInformDelegateTransitionTo:failedWithError:", 1, v8, v5);
    }
  }
}

- (void)arcStarting_handleReportARCInitiatedReceived
{
  if ([(CoreCECDeviceProvider *)self audioReturnChannelState] != 1
    && gLogCategory_CoreRCDevice <= 40
    && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v3 = [(CoreCECDeviceProvider *)self audioReturnChannelState];
    LogPrintF();
  }
  -[CoreCECDeviceProvider setAudioReturnChannelState:](self, "setAudioReturnChannelState:", 2, v3);
  [(CoreCECDeviceProvider *)self arcInformDelegateOfSuccessTransitioningTo:1];
}

- (void)arcStarting_handleFeatureAbortReceivedWithOpcode:(unsigned __int8)a3 reason:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v8 = CECAbortReasonString(v4);
    LogPrintF();
  }
  if ([(CoreCECDeviceProvider *)self audioReturnChannelState] != 1
    && gLogCategory_CoreRCDevice <= 40
    && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = [(CoreCECDeviceProvider *)self audioReturnChannelState];
    LogPrintF();
  }
  -[CoreCECDeviceProvider setAudioReturnChannelState:](self, "setAudioReturnChannelState:", 0, v9);
  uint64_t v7 = [MEMORY[0x263F087E8] cecFeatureAbortErrorWithOpCode:v5 reason:v4 method:@"arcStarting"];
  [(CoreCECDeviceProvider *)self arcInformDelegateTransitionTo:1 failedWithError:v7];
}

- (void)arcStopping
{
  uint64_t v8 = 0;
  uint64_t v3 = objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "arcTxAddressForArcRxDevice:", self);
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v7 = self;
    LogPrintF();
  }
  -[CoreCECDeviceProvider setAudioReturnChannelState:](self, "setAudioReturnChannelState:", 3, v4, v7);
  if (![(CoreCECDeviceProvider *)self terminateARC:v3 error:&v8])
  {
    if (gLogCategory_CoreRCDevice <= 60 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = v8;
      LogPrintF();
      -[CoreCECDeviceProvider arcInformDelegateTransitionTo:failedWithError:](self, "arcInformDelegateTransitionTo:failedWithError:", 0, v8, v6);
    }
    else
    {
      -[CoreCECDeviceProvider arcInformDelegateTransitionTo:failedWithError:](self, "arcInformDelegateTransitionTo:failedWithError:", 0, v8, v5);
    }
  }
}

- (void)arcStopping_handleReportARCTerminatedReceived
{
  if ([(CoreCECDeviceProvider *)self audioReturnChannelState] != 3
    && gLogCategory_CoreRCDevice <= 40
    && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v3 = [(CoreCECDeviceProvider *)self audioReturnChannelState];
    LogPrintF();
  }
  -[CoreCECDeviceProvider setAudioReturnChannelState:](self, "setAudioReturnChannelState:", 0, v3);
  [(CoreCECDeviceProvider *)self arcInformDelegateOfSuccessTransitioningTo:0];
}

- (void)arcStopping_handleFeatureAbortReceivedWithOpcode:(unsigned __int8)a3 reason:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v8 = CECAbortReasonString(v4);
    LogPrintF();
  }
  if ([(CoreCECDeviceProvider *)self audioReturnChannelState] != 3
    && gLogCategory_CoreRCDevice <= 40
    && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = [(CoreCECDeviceProvider *)self audioReturnChannelState];
    LogPrintF();
  }
  -[CoreCECDeviceProvider setAudioReturnChannelState:](self, "setAudioReturnChannelState:", 2, v9);
  uint64_t v7 = [MEMORY[0x263F087E8] cecFeatureAbortErrorWithOpCode:v5 reason:v4 method:@"arcStopping"];
  [(CoreCECDeviceProvider *)self arcInformDelegateTransitionTo:0 failedWithError:v7];
}

- (BOOL)audioReturnChannelTransitionInProgress
{
  return ([(CoreCECDeviceProvider *)self audioReturnChannelState] & 0xFFFFFFFD) != 0;
}

- (void)arcInformDelegateOfSuccessTransitioningTo:(unint64_t)a3
{
  if ([(CoreCECDeviceProvider *)self isValid])
  {
    [(CoreCECDevice *)self requestAudioReturnChannelStatusChangeTo:a3 didFinishWithResult:1 error:0];
  }
}

- (void)arcInformDelegateTransitionTo:(unint64_t)a3 failedWithError:(id)a4
{
  if ([(CoreCECDeviceProvider *)self isValid])
  {
    [(CoreCECDevice *)self requestAudioReturnChannelStatusChangeTo:a3 didFinishWithResult:0 error:a4];
  }
}

- (void)dispatchSelector:(SEL)a3
{
  if ([(CoreCECDeviceProvider *)self isValid])
  {
    uint64_t v5 = [(CoreCECDeviceProvider *)self serialQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __42__CoreCECDeviceProvider_dispatchSelector___block_invoke;
    v6[3] = &unk_2652E3610;
    v6[4] = self;
    void v6[5] = a3;
    dispatch_async((dispatch_queue_t)v5, v6);
  }
}

uint64_t __42__CoreCECDeviceProvider_dispatchSelector___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 40)];
}

- (void)dispatchSelector:(SEL)a3 withObject:(id)a4
{
  if ([(CoreCECDeviceProvider *)self isValid])
  {
    uint64_t v7 = [(CoreCECDeviceProvider *)self serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__CoreCECDeviceProvider_dispatchSelector_withObject___block_invoke;
    block[3] = &unk_2652E4D40;
    void block[5] = a4;
    block[6] = a3;
    block[4] = self;
    dispatch_async((dispatch_queue_t)v7, block);
  }
}

uint64_t __53__CoreCECDeviceProvider_dispatchSelector_withObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 48) withObject:*(void *)(a1 + 40)];
}

- (void)dispatchSelector:(SEL)a3 afterDelay:(double)a4
{
  if ([(CoreCECDeviceProvider *)self isValid])
  {
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    uint64_t v8 = [(CoreCECDeviceProvider *)self serialQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__CoreCECDeviceProvider_dispatchSelector_afterDelay___block_invoke;
    v9[3] = &unk_2652E3610;
    v9[4] = self;
    v9[5] = a3;
    dispatch_after(v7, (dispatch_queue_t)v8, v9);
  }
}

uint64_t __53__CoreCECDeviceProvider_dispatchSelector_afterDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 40)];
}

- (void)dispatchSelector:(SEL)a3 withObject:(id)a4 afterDelay:(double)a5
{
  if ([(CoreCECDeviceProvider *)self isValid])
  {
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    int64_t v10 = [(CoreCECDeviceProvider *)self serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__CoreCECDeviceProvider_dispatchSelector_withObject_afterDelay___block_invoke;
    block[3] = &unk_2652E4D40;
    void block[5] = a4;
    block[6] = a3;
    block[4] = self;
    dispatch_after(v9, (dispatch_queue_t)v10, block);
  }
}

uint64_t __64__CoreCECDeviceProvider_dispatchSelector_withObject_afterDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 48) withObject:*(void *)(a1 + 40)];
}

- (void)receivedSetAudioVolumeLevel:(unsigned __int8)a3 fromDevice:(id)a4
{
  uint64_t v5 = a3;
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
  dispatch_time_t v7 = [[CoreRCHIDEvent alloc] initWithCECAudioVolumeLevel:v5];
  if (v7) {
    [(CoreRCDevice *)self receivedHIDEvent:v7 fromDevice:a4];
  }
  MEMORY[0x270F9A758]();
}

- (void)hibernationChanged:(BOOL)a3
{
  if (gLogCategory_CoreRCDevice <= 50 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (id)filterMessage:(id)a3 toDevice:(id)a4
{
  id v5 = a3;
  if ([a3 shouldBeIgnored])
  {
    if (gLogCategory_CoreRCDevice <= 60 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    return 0;
  }
  BOOL v7 = [(CoreCECDeviceProvider *)self initiatorAddressErrorDetectedForMessage:v5];
  int v8 = [v5 messageType];
  if (v7)
  {
    [(CoreCECDevice *)self sendLogicalAddressErrorAnalyticsForMessage:CECMessageTypeString(v8)];
    return 0;
  }
  if (v8 <= 125)
  {
    if (v8 > 70)
    {
      if (v8 == 71)
      {
        return [(CoreCECDeviceProvider *)self filterSetOSDNameMessage:v5 toDevice:a4];
      }
      else
      {
        if (v8 != 114) {
          return v5;
        }
        return [(CoreCECDeviceProvider *)self filterSetSystemAudioModeMessage:v5 toDevice:a4];
      }
    }
    else if (v8 == 27)
    {
      return [(CoreCECDeviceProvider *)self filterDeckStatusMessage:v5 toDevice:a4];
    }
    else
    {
      if (v8 != 50) {
        return v5;
      }
      return [(CoreCECDeviceProvider *)self filterSetMenuLanguageMessage:v5];
    }
  }
  else if (v8 > 156)
  {
    switch(v8)
    {
      case 157:
        return [(CoreCECDeviceProvider *)self filterInactiveSourceMessage:v5 toDevice:a4];
      case 158:
        return [(CoreCECDeviceProvider *)self filterCECVersionMessage:v5 toDevice:a4];
      case 166:
        return [(CoreCECDeviceProvider *)self filterReportFeaturesMessage:v5 toDevice:a4];
      default:
        return v5;
    }
  }
  else
  {
    switch(v8)
    {
      case 126:
        id result = [(CoreCECDeviceProvider *)self filterSystemAudioModeStatusMessage:v5 toDevice:a4];
        break;
      case 128:
        id result = [(CoreCECDeviceProvider *)self filterRoutingChangeMessage:v5];
        break;
      case 129:
        id result = [(CoreCECDeviceProvider *)self filterRoutingInformationMessage:v5];
        break;
      case 130:
        id result = [(CoreCECDeviceProvider *)self filterActiveSourceMessage:v5];
        break;
      case 132:
        id result = [(CoreCECDeviceProvider *)self filterReportPhysicalAddressMessage:v5];
        break;
      case 134:
        id result = [(CoreCECDeviceProvider *)self filterSetStreamPathMessage:v5];
        break;
      case 135:
        id result = [(CoreCECDeviceProvider *)self filterDeviceVendorIDMessage:v5];
        break;
      case 144:
        id result = [(CoreCECDeviceProvider *)self filterReportPowerStatusMessage:v5 toDevice:a4];
        break;
      default:
        return v5;
    }
  }
  return result;
}

- (id)filterMessage:(id)a3 fromDevice:(id)a4
{
  return a3;
}

- (void)handleMessage:(id)a3 fromDevice:(id)a4 broadcast:(BOOL)a5
{
  int v8 = [a4 logicalAddress];
  if (v8 == [(CoreCECDeviceProvider *)self sendFromAddress])
  {
    if (gLogCategory_CoreRCDevice <= 60 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    int v9 = [a3 messageType];
    if (v9 > 111)
    {
      switch(v9)
      {
        case 112:
          [(CoreCECDeviceProvider *)self handleSystemAudioModeRequestMessage:a3 fromDevice:a4];
          break;
        case 113:
          [(CoreCECDeviceProvider *)self handleGiveAudioStatusMessage:a3 fromDevice:a4];
          break;
        case 114:
          [(CoreCECDeviceProvider *)self handleSetSystemAudioModeMessage:a3 fromDevice:a4];
          break;
        case 115:
          [(CoreCECDeviceProvider *)self handleSetAudioVolumeLevelMessage:a3 fromDevice:a4];
          break;
        case 116:
        case 117:
        case 118:
        case 119:
        case 120:
        case 121:
        case 123:
        case 124:
        case 127:
        case 136:
        case 137:
        case 138:
        case 139:
        case 142:
        case 146:
        case 147:
        case 148:
        case 149:
        case 150:
        case 151:
        case 152:
        case 153:
        case 154:
        case 155:
        case 156:
        case 160:
        case 161:
        case 162:
        case 163:
          goto LABEL_87;
        case 122:
          [(CoreCECDeviceProvider *)self handleReportAudioStatusMessage:a3 fromDevice:a4];
          break;
        case 125:
          [(CoreCECDeviceProvider *)self handleGiveSystemAudioModeStatusMessage:a3 fromDevice:a4];
          break;
        case 126:
        case 128:
        case 129:
        case 132:
        case 135:
        case 144:
        case 157:
        case 158:
          return;
        case 130:
          [(CoreCECDeviceProvider *)self handleActiveSourceMessage:a3 fromDevice:a4];
          break;
        case 131:
          [(CoreCECDeviceProvider *)self handleGivePhysicalAddressMessage:a3 fromDevice:a4];
          break;
        case 133:
          [(CoreCECDeviceProvider *)self handleRequestActiveSourceMessage:a3 fromDevice:a4];
          break;
        case 134:
          [(CoreCECDeviceProvider *)self handleSetStreamPathMessage:a3];
          break;
        case 140:
          [(CoreCECDeviceProvider *)self handleGiveDeviceVendorIDMessage:a3 fromDevice:a4];
          break;
        case 141:
          [(CoreCECDeviceProvider *)self handleMenuRequest:a3 fromDevice:a4];
          break;
        case 143:
          [(CoreCECDeviceProvider *)self handleGiveDevicePowerStatusMessage:a3 fromDevice:a4];
          break;
        case 145:
          [(CoreCECDeviceProvider *)self handleGetMenuLanguageMessage:a3 fromDevice:a4];
          break;
        case 159:
          [(CoreCECDeviceProvider *)self handleGetCECVersionMessage:a3 fromDevice:a4];
          break;
        case 164:
          [(CoreCECDeviceProvider *)self handleRequestShortAudioDescriptorMessage:a3 fromDevice:a4];
          break;
        case 165:
          if (![(CoreCECDevice *)self isCEC2Device]) {
            goto LABEL_87;
          }
          [(CoreCECDeviceProvider *)self handleGiveFeaturesMessage:a3 fromDevice:a4];
          break;
        default:
          switch(v9)
          {
            case 193:
              [(CoreCECDeviceProvider *)self handleReportARCInitiatedMessage:a3 fromDevice:a4];
              break;
            case 194:
              [(CoreCECDeviceProvider *)self handleReportARCTerminatedMessage:a3 fromDevice:a4];
              break;
            case 195:
              [(CoreCECDeviceProvider *)self handleRequestARCInitiationMessage:a3 fromDevice:a4];
              break;
            case 196:
              [(CoreCECDeviceProvider *)self handleRequestARCTerminationMessage:a3 fromDevice:a4];
              break;
            default:
              if (v9 != 255) {
                goto LABEL_87;
              }
              [(CoreCECDeviceProvider *)self sendFeatureAbort:4 forMessage:a3];
              break;
          }
          break;
      }
      return;
    }
    if (v9 > 49)
    {
      switch(v9)
      {
        case 'A':
          [(CoreCECDeviceProvider *)self handleDeckControlPlayMessage:a3 fromDevice:a4];
          return;
        case 'B':
          [(CoreCECDeviceProvider *)self handleDeckControlMessage:a3 fromDevice:a4];
          return;
        case 'C':
          goto LABEL_87;
        case 'D':
          [(CoreCECDeviceProvider *)self handleUserControlPressedMessage:a3 fromDevice:a4];
          return;
        case 'E':
          [(CoreCECDeviceProvider *)self handleUserControlReleasedMessage:a3 fromDevice:a4];
          return;
        case 'F':
          [(CoreCECDeviceProvider *)self handleGiveOSDNameMessage:a3 fromDevice:a4];
          return;
        default:
          if (v9 == 50) {
            return;
          }
          if (v9 != 54) {
            goto LABEL_87;
          }
          [(CoreCECDevice *)self standbyRequestHasBeenReceived:a4];
          break;
      }
      return;
    }
    if (v9 <= 25)
    {
      if (v9 == -1) {
        return;
      }
      if (!v9)
      {
        [(CoreCECDeviceProvider *)self handleFeatureAbortMessage:a3 fromDevice:a4];
        return;
      }
LABEL_87:
      [(CoreCECDeviceProvider *)self didNotHandleMessage:a3 unsupportedOperand:0];
      return;
    }
    if (v9 != 26)
    {
      if (v9 == 27) {
        return;
      }
      goto LABEL_87;
    }
    [(CoreCECDeviceProvider *)self handleGiveDeckStatusMessage:a3 fromDevice:a4];
  }
}

- (void)error:(id)a3 handlingMessage:(id)a4 fromDevice:(id)a5
{
  if (gLogCategory_CoreRCDevice <= 60 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)didNotHandleMessage:(id)a3 unsupportedOperand:(BOOL)a4
{
  BOOL v4 = a4;
  if ([a3 isBroadcast])
  {
    if (gLogCategory_CoreRCDevice <= 60 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (v4) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 0;
    }
    if (gLogCategory_CoreRCDevice <= 60 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      CECAbortReasonString(v7);
      LogPrintF();
    }
    [(CoreCECDeviceProvider *)self sendFeatureAbort:v7 forMessage:a3];
  }
}

- (BOOL)handlingRequiredForSystemAudioModeMessage:(id)a3
{
  BOOL v5 = [(CoreCECDevice *)self systemAudioControlEnabled];
  if (!v5)
  {
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      unint64_t v9 = [(CoreCECDevice *)self deviceFeatures];
      LogPrintF();
      -[CoreCECDeviceProvider sendFeatureAbort:forMessage:](self, "sendFeatureAbort:forMessage:", 1, a3, self, v9);
    }
    else
    {
      -[CoreCECDeviceProvider sendFeatureAbort:forMessage:](self, "sendFeatureAbort:forMessage:", 1, a3, v7, v8);
    }
  }
  return v5;
}

- (BOOL)handlingRequiredForAudioReturnChannelMessage:(id)a3
{
  if ([(CoreCECDevice *)self featureSupportStatus:16] == 2)
  {
    BOOL v5 = [(CoreCECDevice *)self audioReturnChannelControlEnabled];
    BOOL v6 = 1;
    if (v5) {
      return v6;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  [(CoreCECDeviceProvider *)self sendFeatureAbort:v6 forMessage:a3];
  LOBYTE(v6) = 0;
  return v6;
}

- (BOOL)initiatorAddressErrorDetectedForMessage:(id)a3
{
  int v5 = [(CoreRCDevice *)self isLocalDevice];
  if (v5)
  {
    if ([a3 loopback])
    {
LABEL_3:
      LOBYTE(v5) = 0;
      return v5;
    }
    int v6 = [a3 messageType];
    LOBYTE(v5) = 1;
    if (((v6 - 130) > 0x24 || ((1 << (v6 + 126)) & 0x1018004025) == 0) && v6 != 27)
    {
      if (gLogCategory_CoreRCDevice > 60) {
        goto LABEL_3;
      }
      if (gLogCategory_CoreRCDevice != -1 || (int v5 = _LogCategory_Initialize()) != 0)
      {
        CECMessageTypeString([a3 messageType]);
        [(CoreCECDevice *)self logicalAddress];
        LogPrintF();
        goto LABEL_3;
      }
    }
  }
  return v5;
}

- (void)handleFeatureAbortMessage:(id)a3 fromDevice:(id)a4
{
  __int16 v9 = 0;
  if ([a3 parseFeatureAbortOpcode:(char *)&v9 + 1 reason:&v9])
  {
    uint64_t v6 = HIBYTE(v9);
    if (HIBYTE(v9) == 114)
    {
      if (![a4 logicalAddress]
        && [(CoreCECDeviceProvider *)self systemAudioModeState] == 5)
      {
        [(CoreCECDeviceProvider *)self samStarting_handleFeatureAbortReceived];
        return;
      }
      uint64_t v6 = HIBYTE(v9);
    }
    if (v6 == 192 && (int v7 = [a4 logicalAddress], v6 = HIBYTE(v9), !v7))
    {
      [(CoreCECDeviceProvider *)self arcStarting_handleFeatureAbortReceivedWithOpcode:HIBYTE(v9) reason:v9];
    }
    else if (v6 == 197 && (v8 = [a4 logicalAddress], uint64_t v6 = HIBYTE(v9), !v8))
    {
      [(CoreCECDeviceProvider *)self arcStopping_handleFeatureAbortReceivedWithOpcode:HIBYTE(v9) reason:v9];
    }
    else if (v6 == 115)
    {
      [(CoreCECDeviceProvider *)self probeAbsoluteVolumeControl_handleFeatureAbortReceivedFromDevice:a4 withOpcode:115 reason:v9];
    }
    else
    {
      -[CoreCECDevice featureAbort:](self, "featureAbort:", [MEMORY[0x263F087E8] cecFeatureAbortErrorWithOpCode:v6 reason:v9 method:@"NYI"]);
    }
  }
  else if (gLogCategory_CoreRCDevice <= 60 {
         && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (id)filterActiveSourceMessage:(id)a3
{
  uint64_t v6 = 0;
  if ([a3 parseActiveSourcePhysicalAddress:&v6])
  {
    [(CoreCECDevice *)self setPhysicalAddress:v6];
    objc_msgSend(-[CoreRCDevice bus](self, "bus"), "notifyDelegateDeviceUpdated:", self);
    objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "setActiveSource:", self);
  }
  else if (gLogCategory_CoreRCDevice <= 60 {
         && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  return a3;
}

- (void)handleActiveSourceMessage:(id)a3 fromDevice:(id)a4
{
  if ([(CoreCECDevice *)self deviceType] == 1)
  {
    BOOL v5 = [(CoreCECDeviceProvider *)self systemAudioModeTransitionInProgress];
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v5)
    {
      [(CoreCECDeviceProvider *)self samStarting_handleActiveSourceReceived];
    }
  }
}

- (void)handleRequestActiveSourceMessage:(id)a3 fromDevice:(id)a4
{
  if ([(CoreCECDevice *)self isActiveSource])
  {
    uint64_t v7 = 0;
    if (![(CoreCECDeviceProvider *)self sendActiveSourceStatus:1 error:&v7]) {
      [(CoreCECDeviceProvider *)self error:v7 handlingMessage:a3 fromDevice:a4];
    }
  }
}

- (id)filterInactiveSourceMessage:(id)a3 toDevice:(id)a4
{
  uint64_t v7 = 0;
  if (objc_msgSend(a3, "parseInactiveSourcePhysicalAddress:", &v7, a4))
  {
    objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "makeDeviceInactiveSource:", self);
  }
  else if (gLogCategory_CoreRCDevice <= 60 {
         && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  return a3;
}

- (id)filterSetStreamPathMessage:(id)a3
{
  id v3 = a3;
  if ([a3 initiator])
  {
    if (gLogCategory_CoreRCDevice > 60 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return 0;
    }
    goto LABEL_14;
  }
  uint64_t v6 = 0;
  if ([v3 parseSetStreamPathPhysicalAddress:&v6])
  {
    if (v6 != 252645135)
    {
      objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "setStreamPath:", v6);
      return v3;
    }
    if (gLogCategory_CoreRCDevice > 60 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return 0;
    }
LABEL_14:
    LogPrintF();
    return 0;
  }
  if (gLogCategory_CoreRCDevice <= 60 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return v3;
}

- (void)handleSetStreamPathMessage:(id)a3
{
  uint64_t v4 = objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider", a3), "streamPath");
  if (v4 == [(CoreCECDevice *)self physicalAddress])
  {
    [(CoreCECDeviceProvider *)self handleDeviceSelected];
  }
}

- (id)filterRoutingChangeMessage:(id)a3
{
  id v4 = [(CoreCECDeviceProvider *)self busProvider];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  if (([a3 parseRoutingChangeOriginalAddress:&v9 newAddress:&v8] & 1) == 0)
  {
    if (gLogCategory_CoreRCDevice > 60 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return a3;
    }
LABEL_13:
    LogPrintF();
    return a3;
  }
  if (!v4)
  {
    if (gLogCategory_CoreRCDevice > 70 || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize()) {
      return a3;
    }
    goto LABEL_13;
  }
  uint64_t v5 = [v4 streamPath];
  if (v5 != 252645135)
  {
    uint64_t v6 = v5;
    if (CoreCECPhysicalAddressIsOnStreamPath(v9, v5))
    {
      if (CoreCECPhysicalAddressIsOnStreamPath(v8, v6))
      {
        if (gLogCategory_CoreRCDevice <= 60
          && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
        {
          CoreCECPhysicalAddressString(v6);
          LogPrintF();
        }
        return 0;
      }
      else
      {
        [v4 setActiveSource:0];
      }
    }
  }
  return a3;
}

- (id)filterRoutingInformationMessage:(id)a3
{
  uint64_t v5 = 0;
  if (([a3 parseRoutingInformationPhysicalAddress:&v5] & 1) == 0
    && gLogCategory_CoreRCDevice <= 60
    && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return a3;
}

- (id)filterSetOSDNameMessage:(id)a3 toDevice:(id)a4
{
  uint64_t v6 = 0;
  if ((objc_msgSend(a3, "parseSetOSDName:", &v6, a4) & 1) == 0
    && gLogCategory_CoreRCDevice <= 60
    && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return a3;
}

- (void)handleGiveOSDNameMessage:(id)a3 fromDevice:(id)a4
{
  uint64_t v7 = objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "osdNameASCII");
  uint64_t v9 = 0;
  if ((_BYTE)v7)
  {
    if (!-[CoreCECDeviceProvider setOSDName:to:error:](self, "setOSDName:to:error:", v7, v8 & 0xFFFFFFFFFFFFFFLL, [a4 logicalAddress], &v9))-[CoreCECDeviceProvider error:handlingMessage:fromDevice:](self, "error:handlingMessage:fromDevice:", v9, a3, a4); {
  }
    }
  else
  {
    [(CoreCECDeviceProvider *)self sendFeatureAbort:1 forMessage:a3];
  }
}

- (id)filterDeviceVendorIDMessage:(id)a3
{
  unsigned int v6 = 0;
  if ([a3 parseDeviceVendorID:&v6])
  {
    [(CoreCECDevice *)self setVendorID:v6];
    objc_msgSend(-[CoreRCDevice bus](self, "bus"), "notifyDelegateDeviceUpdated:", self);
  }
  else if (gLogCategory_CoreRCDevice <= 60 {
         && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  return a3;
}

- (void)handleGiveDeviceVendorIDMessage:(id)a3 fromDevice:(id)a4
{
  uint64_t v7 = 0;
  if ([(CoreCECDevice *)self vendorID] == -1)
  {
    [(CoreCECDeviceProvider *)self didNotHandleMessage:a3 unsupportedOperand:0];
  }
  else if (![(CoreCECDeviceProvider *)self deviceVendorID:[(CoreCECDevice *)self vendorID] error:&v7])
  {
    [(CoreCECDeviceProvider *)self error:v7 handlingMessage:a3 fromDevice:a4];
  }
}

- (id)filterCECVersionMessage:(id)a3 toDevice:(id)a4
{
  unsigned __int8 v7 = 0;
  if (objc_msgSend(a3, "parseCECVersion:", &v7, a4))
  {
    [(CoreCECDevice *)self setCecVersion:v7];
    objc_msgSend(-[CoreRCDevice bus](self, "bus"), "notifyDelegateDeviceUpdated:", self);
  }
  else if (gLogCategory_CoreRCDevice <= 60 {
         && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  return a3;
}

- (void)handleGetCECVersionMessage:(id)a3 fromDevice:(id)a4
{
  uint64_t v7 = 0;
  if (!-[CoreCECDeviceProvider cecVersion:to:error:](self, "cecVersion:to:error:", -[CoreCECDevice cecVersion](self, "cecVersion"), [a4 logicalAddress], &v7))-[CoreCECDeviceProvider error:handlingMessage:fromDevice:](self, "error:handlingMessage:fromDevice:", v7, a3, a4); {
}
  }

- (id)filterReportPhysicalAddressMessage:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  if ([a3 parseReportPhysicalAddress:&v7 deviceType:&v6])
  {
    [(CoreCECDevice *)self setPhysicalAddress:v7];
    [(CoreCECDevice *)self setDeviceType:v6];
    objc_msgSend(-[CoreRCDevice bus](self, "bus"), "notifyDelegateDeviceUpdated:", self);
  }
  else if (gLogCategory_CoreRCDevice <= 60 {
         && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  return a3;
}

- (void)handleGivePhysicalAddressMessage:(id)a3 fromDevice:(id)a4
{
  uint64_t v7 = 0;
  if (![(CoreCECDeviceProvider *)self reportPhysicalAddress:&v7]) {
    [(CoreCECDeviceProvider *)self error:v7 handlingMessage:a3 fromDevice:a4];
  }
}

- (id)filterSetMenuLanguageMessage:(id)a3
{
  id v3 = a3;
  if ([a3 initiator]) {
    return 0;
  }
  unsigned __int8 v7 = 0;
  unsigned __int16 v6 = 0;
  if ([v3 parseSetMenuLanguage:&v6])
  {
    objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "setTvLanguageCodeASCII:", v6 | ((unint64_t)v7 << 16));
  }
  else if (gLogCategory_CoreRCDevice <= 60 {
         && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  return v3;
}

- (void)handleGetMenuLanguageMessage:(id)a3 fromDevice:(id)a4
{
  if ([(CoreCECDevice *)self deviceType] == 7
    && (![(CoreCECDevice *)self logicalAddress]
     || [(CoreCECDevice *)self logicalAddress] == 14))
  {
    uint64_t v7 = 0;
    if (!-[CoreCECDeviceProvider setMenuLanguage:error:](self, "setMenuLanguage:error:", objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "tvLanguageCodeASCII") & 0xFFFFFF, &v7))-[CoreCECDeviceProvider error:handlingMessage:fromDevice:](self, "error:handlingMessage:fromDevice:", v7, a3, a4); {
  }
    }
  else
  {
    [(CoreCECDeviceProvider *)self didNotHandleMessage:a3 unsupportedOperand:0];
  }
}

- (void)handleGiveFeaturesMessage:(id)a3 fromDevice:(id)a4
{
  uint64_t v7 = 0;
  if (![(CoreCECDeviceProvider *)self reportFeatures:&v7]) {
    [(CoreCECDeviceProvider *)self error:v7 handlingMessage:a3 fromDevice:a4];
  }
}

- (id)filterReportFeaturesMessage:(id)a3 toDevice:(id)a4
{
  __int16 v18 = 0;
  uint64_t v17 = 0;
  __int16 v16 = 0;
  unsigned __int8 v15 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  if ([a3 parseReportFeatures:(char *)&v18 + 1 deviceTypes:&v18 rcProfile:&v16 features:&v15])
  {
    if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      unsigned __int16 v6 = CECVersionString(HIBYTE(v18));
      uint64_t v11 = HIBYTE(v16);
      uint64_t v12 = v15;
      uint64_t v9 = v18;
      uint64_t v10 = v16;
      uint64_t v8 = v6;
      LogPrintF();
    }
    -[CoreCECDevice setCecVersion:](self, "setCecVersion:", HIBYTE(v18), v8, v9, v10, v11, v12);
    if (CoreCECDeviceFeaturesMaskForCECDeviceFeaturesMask(&v14, v15))
    {
      [(CoreCECDevice *)self setDeviceFeatures:v14];
      [(CoreCECDevice *)self setKnownDeviceFeatures:[(CoreCECDevice *)self defaultKnownDeviceFeaturesMaskForCECVersion:HIBYTE(v18)]];
      if (CoreCECDeviceTypesMaskForCECAllDeviceTypesMask(&v17, v18))
      {
        [(CoreCECDevice *)self setAllDeviceTypes:v17];
        if (CoreCECRCProfileForCECRCProfile(&v13, &v16))
        {
          [(CoreCECDevice *)self setRcProfile:v13];
          objc_msgSend(-[CoreRCDevice bus](self, "bus"), "notifyDelegateDeviceUpdated:", self);
        }
      }
    }
  }
  else if (gLogCategory_CoreRCDevice <= 60 {
         && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  return a3;
}

- (id)filterReportPowerStatusMessage:(id)a3 toDevice:(id)a4
{
  uint64_t v7 = 0;
  if (objc_msgSend(a3, "parseReportPowerStatus:", &v7, a4))
  {
    [(CoreCECDevice *)self setPowerStatus:v7];
    objc_msgSend(-[CoreRCDevice bus](self, "bus"), "notifyDelegateDeviceUpdated:", self);
  }
  else if (gLogCategory_CoreRCDevice <= 60 {
         && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  return a3;
}

- (void)handleGiveDevicePowerStatusMessage:(id)a3 fromDevice:(id)a4
{
  uint64_t v9 = 0;
  unsigned __int8 v8 = 0;
  if (CECPowerStatusForCoreCECPowerStatus(&v8, [(CoreCECDevice *)self powerStatus]))
  {
    uint64_t v7 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    unsigned __int8 v8 = 0;
  }
  if (!-[CoreCECDeviceProvider reportPowerStatus:to:error:](self, "reportPowerStatus:to:error:", v7, [a4 logicalAddress], &v9))-[CoreCECDeviceProvider error:handlingMessage:fromDevice:](self, "error:handlingMessage:fromDevice:", v9, a3, a4); {
}
  }

- (void)handleDeckControlPlayMessage:(id)a3 fromDevice:(id)a4
{
  uint64_t v7 = 0;
  if ([a3 parsePlayMode:&v7]) {
    [(CoreCECDevice *)self deckControlPlayHasBeenReceived:v7 fromDevice:a4];
  }
  else {
    [(CoreCECDeviceProvider *)self didNotHandleMessage:a3 unsupportedOperand:1];
  }
}

- (void)handleDeckControlMessage:(id)a3 fromDevice:(id)a4
{
  uint64_t v7 = 0;
  if ([a3 parseDeckControlMode:&v7]) {
    [(CoreCECDevice *)self deckControlCommandHasBeenReceived:v7 fromDevice:a4];
  }
  else {
    [(CoreCECDeviceProvider *)self didNotHandleMessage:a3 unsupportedOperand:1];
  }
}

- (id)filterDeckStatusMessage:(id)a3 toDevice:(id)a4
{
  uint64_t v8 = 0;
  if ([a3 parseDeckStatusInfo:&v8])
  {
    [(CoreCECDevice *)self setDeckStatus:v8];
    objc_msgSend(-[CoreRCDevice bus](self, "bus"), "notifyDelegateDeviceUpdated:", self);
    [a4 deckControlStatusHasBeenUpdated:v8 fromDevice:self];
  }
  else if (gLogCategory_CoreRCDevice <= 60 {
         && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  return a3;
}

- (void)handleGiveDeckStatusMessage:(id)a3 fromDevice:(id)a4
{
  char v13 = 0;
  if (([a3 parseGiveDeckStatusRequest:&v13] & 1) == 0)
  {
    uint64_t v8 = self;
    id v9 = a3;
    uint64_t v10 = 1;
LABEL_24:
    -[CoreCECDeviceProvider didNotHandleMessage:unsupportedOperand:](v8, "didNotHandleMessage:unsupportedOperand:", v9, v10, v11, v12);
    return;
  }
  unint64_t v7 = [(CoreCECDevice *)self deviceType];
  if (v7 != 4 && v7 != 2)
  {
    if (gLogCategory_CoreRCDevice <= 60 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      uint64_t v11 = self;
      id v12 = a4;
      LogPrintF();
    }
    uint64_t v8 = self;
    id v9 = a3;
    uint64_t v10 = 0;
    goto LABEL_24;
  }
  switch(v13)
  {
    case 1:
      if (![(CoreCECDevice *)self deckStatus])
      {
LABEL_18:
        [(CoreCECDeviceProvider *)self sendFeatureAbort:1 forMessage:a3];
        return;
      }
      if (gLogCategory_CoreRCDevice <= 10
        && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        self->_deckStatusRequestMask |= 1 << objc_msgSend(a4, "logicalAddress", a4);
      }
      else
      {
        self->_deckStatusRequestMask |= 1 << objc_msgSend(a4, "logicalAddress", v11);
      }
LABEL_31:
      [(CoreCECDeviceProvider *)self sendDeckStatusToDevice:a4];
      return;
    case 3:
      if (![(CoreCECDevice *)self deckStatus]) {
        goto LABEL_18;
      }
      goto LABEL_31;
    case 2:
      if (gLogCategory_CoreRCDevice <= 10
        && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
      {
        uint64_t v11 = a4;
        LogPrintF();
      }
      self->_deckStatusRequestMask &= ~(1 << objc_msgSend(a4, "logicalAddress", v11));
      break;
    default:
      if (gLogCategory_CoreRCDevice <= 90
        && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      break;
  }
}

- (void)handleMenuRequest:(id)a3 fromDevice:(id)a4
{
  uint64_t v8 = 0;
  char v7 = 0;
  if ([a3 parseMenuRequest:&v7])
  {
    if (!-[CoreCECDeviceProvider menuStatus:to:error:](self, "menuStatus:to:error:", 0, [a3 initiator], &v8))-[CoreCECDeviceProvider error:handlingMessage:fromDevice:](self, "error:handlingMessage:fromDevice:", v8, a3, a4); {
  }
    }
  else
  {
    [(CoreCECDeviceProvider *)self didNotHandleMessage:a3 unsupportedOperand:1];
  }
}

- (void)handleUserControlPressedMessage:(id)a3 fromDevice:(id)a4
{
  uint64_t v10 = 0;
  if (([a3 parseUserControlPressed:&v10] & 1) == 0)
  {
    [(CoreCECDeviceProvider *)self didNotHandleMessage:a3 unsupportedOperand:1];
    return;
  }
  p_userControlFollowerState = &self->_userControlFollowerState;
  if (!self->_userControlFollowerState.isValid)
  {
    unsigned __int8 v9 = 0;
LABEL_11:
    if ([(CoreCECDeviceProvider *)self handleUserControl:v10 pressed:1 fromDevice:a4 abortReason:&v9])
    {
      self->_userControlFollowerState.control = (CECUserControl)v10;
      p_userControlFollowerState->sender = (CoreCECDevice *)a4;
      self->_userControlFollowerState.BOOL isValid = 1;
      [(CoreCECDeviceProvider *)self userControlScheduleFollowerSafetyTimeout];
    }
    else
    {
      [(CoreCECDeviceProvider *)self sendFeatureAbort:v9 forMessage:a3];
    }
    return;
  }
  if (!CECUserControlEquals(*(void *)&self->_userControlFollowerState.control, v10)
    || ![(CoreRCDevice *)p_userControlFollowerState->sender isEqual:a4])
  {
    BOOL isValid = self->_userControlFollowerState.isValid;
    unsigned __int8 v9 = 0;
    if (isValid) {
      [(CoreCECDeviceProvider *)self userControlFollowerSynthesizeRelease];
    }
    goto LABEL_11;
  }
  [(CoreCECDeviceProvider *)self userControlScheduleFollowerSafetyTimeout];
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    CECUserControlString(v10);
    objc_opt_class();
    LogPrintF();
  }
}

- (void)handleUserControlReleasedMessage:(id)a3 fromDevice:(id)a4
{
  p_userControlFollowerState = &self->_userControlFollowerState;
  if (self->_userControlFollowerState.isValid)
  {
    if ([(CoreRCDevice *)p_userControlFollowerState->sender isEqual:a4])
    {
      [(CoreCECDeviceProvider *)self userControlCancelFollowerSafetyTimeout];
      [(CoreCECDeviceProvider *)self handleUserControl:*(void *)&p_userControlFollowerState->control pressed:0 fromDevice:a4 abortReason:0];
      p_userControlFollowerState->BOOL isValid = 0;

      p_userControlFollowerState->sender = 0;
      return;
    }
    if (gLogCategory_CoreRCDevice <= 60 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
LABEL_10:
    }
      LogPrintF();
  }
  else if (gLogCategory_CoreRCDevice <= 60 {
         && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_10;
  }
}

- (BOOL)handleUserControl:(CECUserControl)a3 pressed:(BOOL)a4 fromDevice:(id)a5 abortReason:(unsigned __int8 *)a6
{
  BOOL v8 = a4;
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    CECUserControlString(*(void *)&a3);
    LogPrintF();
  }
  uint64_t v11 = [CoreRCHIDEvent alloc];
  if (v11)
  {
    id v12 = v11;
    [(CoreCECDeviceProvider *)self audioStatusHandleUserControl:a3 pressed:v8];
    uint64_t v13 = [(CoreRCHIDEvent *)v12 initWithCECUserControl:a3 pressed:v8];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      [(CoreRCDevice *)self receivedHIDEvent:v13 fromDevice:a5];

      return 1;
    }
    int v16 = 3;
  }
  else
  {
    int v16 = 4;
  }
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    CECUserControlString(*(void *)&a3);
    CECAbortReasonString(v16);
    LogPrintF();
  }
  BOOL result = 0;
  if (a6) {
    *a6 = v16;
  }
  return result;
}

- (void)handleReportAudioStatusMessage:(id)a3 fromDevice:(id)a4
{
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  unsigned __int8 v11 = 0;
  if ([a3 parseReportAudioStatus:&v12 muteStatus:&v11])
  {
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = v12;
      uint64_t v10 = v11;
      LogPrintF();
    }
    if ((objc_msgSend(a4, "setAudioVolumeStatus:error:", v12, &v13, v6, v10) & 1) == 0
      && gLogCategory_CoreRCDevice <= 90
      && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = v13;
      LogPrintF();
    }
    if ((objc_msgSend(a4, "setAudioMuteStatus:error:", v11, &v13, v7) & 1) != 0
      || gLogCategory_CoreRCDevice > 90
      || gLogCategory_CoreRCDevice == -1 && !_LogCategory_Initialize())
    {
      -[CoreCECDevice audioStatusReceived:muteStatus:](self, "audioStatusReceived:muteStatus:", v12, v11, v8);
    }
    else
    {
      uint64_t v9 = v13;
      LogPrintF();
      -[CoreCECDevice audioStatusReceived:muteStatus:](self, "audioStatusReceived:muteStatus:", v12, v11, v9);
    }
  }
  else if (gLogCategory_CoreRCDevice <= 60 {
         && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)handleGiveAudioStatusMessage:(id)a3 fromDevice:(id)a4
{
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    id v8 = a3;
    uint64_t v9 = self;
    LogPrintF();
  }
  if (-[CoreCECDeviceProvider handlingRequiredForSystemAudioModeMessage:](self, "handlingRequiredForSystemAudioModeMessage:", a3, v8, v9)&& ([a3 isBroadcast] & 1) == 0)
  {
    uint64_t v7 = [a4 logicalAddress];
    [(CoreCECDeviceProvider *)self reportAudioStatusTo:v7 error:0];
  }
}

- (void)handleGiveSystemAudioModeStatusMessage:(id)a3 fromDevice:(id)a4
{
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    id v8 = a3;
    uint64_t v9 = self;
    LogPrintF();
  }
  if (-[CoreCECDeviceProvider handlingRequiredForSystemAudioModeMessage:](self, "handlingRequiredForSystemAudioModeMessage:", a3, v8, v9)&& ([a3 isBroadcast] & 1) == 0)
  {
    id v7 = +[CECMessage systemAudioModeStatus:from:to:](CECMessage, "systemAudioModeStatus:from:to:", objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "systemAudioModeStatus"), -[CoreCECDeviceProvider sendFromAddress](self, "sendFromAddress"), objc_msgSend(a4, "logicalAddress"));
    [(CoreCECDeviceProvider *)self sendMessage:v7 error:0];
  }
}

- (id)filterSetSystemAudioModeMessage:(id)a3 toDevice:(id)a4
{
  if ([a3 initiator] != 5
    && gLogCategory_CoreRCDevice <= 60
    && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    id v7 = a3;
    LogPrintF();
  }
  if (objc_msgSend(a3, "isBroadcast", v7))
  {
    uint64_t v8 = 0;
    if ([a3 parseSystemAudioModeStatus:&v8])
    {
      objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "setSystemAudioModeStatus:", v8);
    }
    else if (gLogCategory_CoreRCDevice <= 60 {
           && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  return a3;
}

- (void)handleRequestShortAudioDescriptorMessage:(id)a3 fromDevice:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  int v32 = 0;
  uint64_t v31 = 0;
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_super v20 = self;
    char v22 = [(CoreCECDevice *)self audioFormats];
    id v18 = a3;
    LogPrintF();
  }
  if (-[CoreCECDeviceProvider handlingRequiredForSystemAudioModeMessage:](self, "handlingRequiredForSystemAudioModeMessage:", a3, v18, v20, v22))
  {
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      if (a3)
      {
        [a3 frame];
        id v7 = (void *)(v30 & 0x1F);
      }
      else
      {
        id v7 = 0;
        uint64_t v28 = 0;
        uint64_t v29 = 0;
        int v30 = 0;
      }
      id v19 = v7;
      LogPrintF();
    }
    id v23 = a4;
    unsigned __int8 v8 = 0;
    if (a3)
    {
      for (unint64_t i = 2; ; ++i)
      {
        objc_msgSend(a3, "frame", v19, v21);
        if (i >= (v27 & 0x1Fu)) {
          break;
        }
        [a3 frame];
        uint64_t v10 = v24[i + 20];
        if (gLogCategory_CoreRCDevice <= 40
          && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
        {
          [a3 frame];
          id v19 = (void *)i;
          uint64_t v21 = v24[i];
          LogPrintF();
        }
        unsigned __int8 v11 = [(CoreCECDevice *)self audioFormats];
        uint64_t v12 = -[NSDictionary objectForKey:](v11, "objectForKey:", [NSNumber numberWithUnsignedChar:v10]);
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          if (gLogCategory_CoreRCDevice <= 40
            && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
          {
            id v19 = v13;
            LogPrintF();
          }
          uint64_t v14 = objc_msgSend(v13, "bytes", v19);
          if (v14)
          {
            unsigned __int8 v15 = 0;
            do
            {
              if (gLogCategory_CoreRCDevice <= 40
                && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
              {
                id v19 = v15;
                uint64_t v21 = v15[v14];
                LogPrintF();
              }
              ++v15;
            }
            while (v15 != (unsigned __int8 *)3);
          }
          __int16 v16 = *(_WORD *)v14;
          uint64_t v17 = (char *)&v31 + v8;
          v17[2] = *(unsigned char *)(v14 + 2);
          *(_WORD *)uint64_t v17 = v16;
          v8 += 3;
        }
      }
    }
    else
    {
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      int v27 = 0;
    }
    if (v8)
    {
      -[CoreCECDeviceProvider sendMessage:error:](self, "sendMessage:error:", +[CECMessage reportShortAudioDescriptor:length:from:to:](CECMessage, "reportShortAudioDescriptor:length:from:to:", &v31, v8, -[CoreCECDevice logicalAddress](self, "logicalAddress"), [v23 logicalAddress]), 0);
    }
    else
    {
      if (gLogCategory_CoreRCDevice <= 40
        && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[CoreCECDeviceProvider sendFeatureAbort:forMessage:](self, "sendFeatureAbort:forMessage:", 3, a3, v19);
    }
  }
}

- (void)handleSetSystemAudioModeMessage:(id)a3 fromDevice:(id)a4
{
  if (([a3 isBroadcast] & 1) == 0)
  {
    if ([(CoreCECDevice *)self deviceType] == 7)
    {
      if ([a3 initiator] != 5
        && gLogCategory_CoreRCDevice <= 60
        && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      [(CoreCECDeviceProvider *)self didNotHandleMessage:a3 unsupportedOperand:0];
    }
  }
}

- (void)handleSystemAudioModeRequestMessage:(id)a3 fromDevice:(id)a4
{
  if (-[CoreCECDeviceProvider handlingRequiredForSystemAudioModeMessage:](self, "handlingRequiredForSystemAudioModeMessage:")&& ([a3 isBroadcast] & 1) == 0&& -[CoreCECDevice deviceType](self, "deviceType") == 1)
  {
    if (!a3 || ([a3 frame], (v13 & 0x1F) != 2) && (objc_msgSend(a3, "frame"), (v12 & 0x1F) != 4))
    {
      if (gLogCategory_CoreRCDevice <= 50
        && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
      {
        id v8 = a3;
        LogPrintF();
      }
      if (!a3) {
        goto LABEL_29;
      }
    }
    objc_msgSend(a3, "frame", v8);
    if ((v11 & 0x1C) != 0)
    {
      [a3 frame];
      [a3 frame];
      if ([a4 deviceType] == 7) {
        [(CoreCECDeviceProvider *)self setSystemAudioModeRequestedByTV:1];
      }
      else {
        [(CoreCECDeviceProvider *)self setSystemAudioModeRequestedByOtherDevice:1];
      }
      if (gLogCategory_CoreRCDevice <= 40
        && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
      {
        id v8 = (id)(v9 | (v10 << 8));
        LogPrintF();
      }
      uint64_t v7 = 1;
    }
    else
    {
LABEL_29:
      if (gLogCategory_CoreRCDevice <= 40
        && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v7 = 0;
    }
    -[CoreCECDevice receivedRequestSystemAudioModeStatusChangeTo:fromDevice:](self, "receivedRequestSystemAudioModeStatusChangeTo:fromDevice:", v7, a4, v8);
  }
}

- (void)handleSetAudioVolumeLevelMessage:(id)a3 fromDevice:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a3)
  {
    [a3 frame];
    uint64_t v6 = BYTE2(v9);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    LODWORD(v11) = 0;
  }
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = v6;
    id v8 = self;
    LogPrintF();
  }
  if (v6 > 0x64)
  {
    if (v6 == 127)
    {
      if (gLogCategory_CoreRCDevice <= 40
        && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_CoreRCDevice <= 40
        && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[CoreCECDeviceProvider featureAbort:reason:to:error:](self, "featureAbort:reason:to:error:", 115, 3, objc_msgSend(a4, "logicalAddress", v7, v8, v9, v10, v11, v12), 0);
    }
  }
  else
  {
    [(CoreCECDeviceProvider *)self receivedSetAudioVolumeLevel:v6 fromDevice:a4];
  }
}

- (id)filterSystemAudioModeStatusMessage:(id)a3 toDevice:(id)a4
{
  if ([a3 initiator] != 5
    && gLogCategory_CoreRCDevice <= 60
    && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    id v7 = a3;
    LogPrintF();
  }
  uint64_t v8 = 0;
  if (objc_msgSend(a3, "parseSystemAudioModeStatus:", &v8, v7))
  {
    objc_msgSend(-[CoreCECDeviceProvider busProvider](self, "busProvider"), "setSystemAudioModeStatus:", v8);
  }
  else if (gLogCategory_CoreRCDevice <= 60 {
         && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  return a3;
}

- (void)handleRequestARCInitiationMessage:(id)a3 fromDevice:(id)a4
{
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    id v7 = a3;
    uint64_t v8 = self;
    LogPrintF();
  }
  if (-[CoreCECDeviceProvider handlingRequiredForAudioReturnChannelMessage:](self, "handlingRequiredForAudioReturnChannelMessage:", a3, v7, v8))
  {
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CoreCECDevice *)self receivedRequestAudioReturnChannelStatusChangeTo:1 fromDevice:a4];
  }
}

- (void)handleReportARCInitiatedMessage:(id)a3 fromDevice:(id)a4
{
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    id v6 = a3;
    id v7 = self;
    LogPrintF();
  }
  if (-[CoreCECDeviceProvider handlingRequiredForAudioReturnChannelMessage:](self, "handlingRequiredForAudioReturnChannelMessage:", a3, v6, v7))
  {
    [(CoreCECDeviceProvider *)self arcStarting_handleReportARCInitiatedReceived];
  }
}

- (void)handleRequestARCTerminationMessage:(id)a3 fromDevice:(id)a4
{
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    id v7 = a3;
    uint64_t v8 = self;
    LogPrintF();
  }
  if (-[CoreCECDeviceProvider handlingRequiredForAudioReturnChannelMessage:](self, "handlingRequiredForAudioReturnChannelMessage:", a3, v7, v8))
  {
    if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CoreCECDevice *)self receivedRequestAudioReturnChannelStatusChangeTo:0 fromDevice:a4];
  }
}

- (void)handleReportARCTerminatedMessage:(id)a3 fromDevice:(id)a4
{
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    id v6 = a3;
    id v7 = self;
    LogPrintF();
  }
  if (-[CoreCECDeviceProvider handlingRequiredForAudioReturnChannelMessage:](self, "handlingRequiredForAudioReturnChannelMessage:", a3, v6, v7))
  {
    [(CoreCECDeviceProvider *)self arcStopping_handleReportARCTerminatedReceived];
  }
}

- (BOOL)sendActiveSourceStatus:(BOOL)a3 error:(id *)a4
{
  if (a3) {
    return [(CoreCECDeviceProvider *)self activeSource:a4];
  }
  else {
    return [(CoreCECDeviceProvider *)self inactiveSourceTo:a3 error:a4];
  }
}

- (void)sendDeckStatusToDevice:(id)a3
{
  uint64_t v9 = 0;
  unint64_t v5 = [(CoreCECDevice *)self deckStatus];
  if (a3 && v5)
  {
    if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
    {
      id v6 = a3;
      LogPrintF();
    }
    if (!-[CoreCECDeviceProvider deckStatusWithInfo:to:error:](self, "deckStatusWithInfo:to:error:", -[CoreCECDevice deckStatus](self, "deckStatus", v6), [a3 logicalAddress], &v9))
    {
      if (gLogCategory_CoreRCDevice <= 90)
      {
        if (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())
        {
          id v7 = a3;
          uint64_t v8 = v9;
          LogPrintF();
        }
        if (gLogCategory_CoreRCDevice <= 60
          && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
        {
          id v7 = a3;
          LogPrintF();
        }
      }
      self->_deckStatusRequestMask &= ~(1 << objc_msgSend(a3, "logicalAddress", v7, v8));
    }
  }
}

- (void)sendFeatureAbort:(unsigned __int8)a3 forMessage:(id)a4
{
  uint64_t v5 = a3;
  if (([a4 isBroadcast] & 1) == 0 && objc_msgSend(a4, "messageType") != -1)
  {
    if ([a4 messageType])
    {
      if ([a4 initiator] != 15)
      {
        uint64_t v7 = 0;
        if (!-[CoreCECDeviceProvider featureAbort:reason:to:error:](self, "featureAbort:reason:to:error:", [a4 messageType], v5, objc_msgSend(a4, "initiator"), &v7)&& gLogCategory_CoreRCDevice <= 60&& (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
    }
  }
}

- (BOOL)sendMessage:(id)a3 withRetryCount:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  id v9 = [(CoreCECDeviceProvider *)self busProvider];
  id v13 = 0;
  if (!a3)
  {
    uint64_t v12 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
LABEL_23:
    id v13 = v12;
    goto LABEL_18;
  }
  uint64_t v10 = v9;
  if (!v9)
  {
    uint64_t v12 = (void *)[MEMORY[0x263F087E8] cecTopologyChangeError];
    goto LABEL_23;
  }
  if ([v9 sendMessage:a3 withRetryCount:v6 error:&v13]) {
    return 1;
  }
  if ([v13 isCECAcknowledgementError]
    && [a3 destination] == 5
    && [v10 systemAudioModeStatus] == 2)
  {
    if (gLogCategory_CoreRCDevice <= 60 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [v10 setSystemAudioModeStatus:1];
    if ([a3 messageType] != 125) {
      [(CoreCECDeviceProvider *)self refreshSystemAudioModeStatus];
    }
  }
  if (gLogCategory_CoreRCDevice <= 90 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_18:
  BOOL result = 0;
  if (a5) {
    *a5 = v13;
  }
  return result;
}

- (BOOL)sendMessage:(id)a3 error:(id *)a4
{
  return [(CoreCECDeviceProvider *)self sendMessage:a3 withRetryCount:2 error:a4];
}

- (BOOL)activeSource:(id *)a3
{
  unsigned __int16 v8 = 0;
  if (PackedPhysicalAddressForCoreCECPhysicalAddress(&v8, [(CoreCECDevice *)self physicalAddress]))
  {
    uint64_t v5 = [(CoreCECDeviceProvider *)self sendFromAddress];
    return [(CoreCECDeviceProvider *)self sendMessage:+[CECMessage activeSourceFrom:v5 physicalAddress:v8] error:a3];
  }
  else if (a3)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
    BOOL result = 0;
    *a3 = v7;
  }
  else
  {
    return 0;
  }
  return result;
}

- (BOOL)imageViewOnTo:(unsigned __int8)a3 error:(id *)a4
{
  id v6 = +[CECMessage imageViewOnFrom:[(CoreCECDeviceProvider *)self sendFromAddress] to:a3];
  return [(CoreCECDeviceProvider *)self sendMessage:v6 error:a4];
}

- (BOOL)textViewOnTo:(unsigned __int8)a3 error:(id *)a4
{
  id v6 = +[CECMessage textViewOnFrom:[(CoreCECDeviceProvider *)self sendFromAddress] to:a3];
  return [(CoreCECDeviceProvider *)self sendMessage:v6 error:a4];
}

- (BOOL)oneTouchPlayWithMenu:(BOOL)a3 to:(unsigned __int8)a4 error:(id *)a5
{
  if (a3)
  {
    if ([(CoreCECDeviceProvider *)self imageViewOnTo:a4 error:a5]) {
      goto LABEL_9;
    }
  }
  else if ([(CoreCECDeviceProvider *)self textViewOnTo:a4 error:a5])
  {
    goto LABEL_9;
  }
  if (gLogCategory_CoreRCDevice <= 90 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    objc_opt_class();
    LogPrintF();
  }
LABEL_9:
  return [(CoreCECDeviceProvider *)self activeSource:a5];
}

- (BOOL)inactiveSourceTo:(unsigned __int8)a3 error:(id *)a4
{
  uint64_t v5 = a3;
  unsigned __int16 v10 = 0;
  if (PackedPhysicalAddressForCoreCECPhysicalAddress(&v10, [(CoreCECDevice *)self physicalAddress]))
  {
    uint64_t v7 = [(CoreCECDeviceProvider *)self sendFromAddress];
    return [(CoreCECDeviceProvider *)self sendMessage:+[CECMessage inactiveSourceFrom:v7 to:v5 physicalAddress:v10] error:a4];
  }
  else if (a4)
  {
    id v9 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
    BOOL result = 0;
    *a4 = v9;
  }
  else
  {
    return 0;
  }
  return result;
}

- (BOOL)requestActiveSource:(id *)a3
{
  id v5 = +[CECMessage requestActiveSourceFrom:[(CoreCECDeviceProvider *)self sendFromAddress]];
  return [(CoreCECDeviceProvider *)self sendMessage:v5 error:a3];
}

- (BOOL)routingChangeOriginalAddress:(unint64_t)a3 newAddress:(unint64_t)a4 error:(id *)a5
{
  unsigned int v6 = a4;
  int v11 = 0;
  if (PackedPhysicalAddressForCoreCECPhysicalAddress((_WORD *)&v11 + 1, a3)
    && PackedPhysicalAddressForCoreCECPhysicalAddress(&v11, v6))
  {
    uint64_t v8 = [(CoreCECDeviceProvider *)self sendFromAddress];
    return [(CoreCECDeviceProvider *)self sendMessage:+[CECMessage routingChangeFrom:v8 originalAddress:HIWORD(v11) newAddress:(unsigned __int16)v11] error:a5];
  }
  else if (a5)
  {
    unsigned __int16 v10 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
    BOOL result = 0;
    *a5 = v10;
  }
  else
  {
    return 0;
  }
  return result;
}

- (BOOL)routingInformationPhysicalAddress:(unint64_t)a3 error:(id *)a4
{
  unsigned __int16 v9 = 0;
  if (PackedPhysicalAddressForCoreCECPhysicalAddress(&v9, a3))
  {
    uint64_t v6 = [(CoreCECDeviceProvider *)self sendFromAddress];
    return [(CoreCECDeviceProvider *)self sendMessage:+[CECMessage routingInformationFrom:v6 physicalAddress:v9] error:a4];
  }
  else if (a4)
  {
    uint64_t v8 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
    BOOL result = 0;
    *a4 = v8;
  }
  else
  {
    return 0;
  }
  return result;
}

- (BOOL)setStreamPathPhysicalAddress:(unint64_t)a3 error:(id *)a4
{
  unsigned __int16 v9 = 0;
  if (PackedPhysicalAddressForCoreCECPhysicalAddress(&v9, a3))
  {
    uint64_t v6 = [(CoreCECDeviceProvider *)self sendFromAddress];
    return [(CoreCECDeviceProvider *)self sendMessage:+[CECMessage setStreamPathFrom:v6 physicalAddress:v9] error:a4];
  }
  else if (a4)
  {
    uint64_t v8 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
    BOOL result = 0;
    *a4 = v8;
  }
  else
  {
    return 0;
  }
  return result;
}

- (BOOL)standbyTo:(unsigned __int8)a3 error:(id *)a4
{
  id v6 = +[CECMessage standbyFrom:[(CoreCECDeviceProvider *)self sendFromAddress] to:a3];
  return [(CoreCECDeviceProvider *)self sendMessage:v6 error:a4];
}

- (BOOL)cecVersion:(unsigned __int8)a3 to:(unsigned __int8)a4 error:(id *)a5
{
  id v7 = +[CECMessage cecVersion:a3 from:[(CoreCECDeviceProvider *)self sendFromAddress] to:a4];
  return [(CoreCECDeviceProvider *)self sendMessage:v7 error:a5];
}

- (BOOL)getCECVersionTo:(unsigned __int8)a3 error:(id *)a4
{
  id v6 = +[CECMessage getCECVersionFrom:[(CoreCECDeviceProvider *)self sendFromAddress] to:a3];
  return [(CoreCECDeviceProvider *)self sendMessage:v6 error:a4];
}

- (BOOL)givePhysicalAddressTo:(unsigned __int8)a3 error:(id *)a4
{
  id v6 = +[CECMessage givePhysicalAddressFrom:[(CoreCECDeviceProvider *)self sendFromAddress] to:a3];
  return [(CoreCECDeviceProvider *)self sendMessage:v6 error:a4];
}

- (BOOL)getMenuLanguageTo:(unsigned __int8)a3 error:(id *)a4
{
  id v6 = +[CECMessage getMenuLanguageFrom:[(CoreCECDeviceProvider *)self sendFromAddress] to:a3];
  return [(CoreCECDeviceProvider *)self sendMessage:v6 error:a4];
}

- (BOOL)pollTo:(unsigned __int8)a3 error:(id *)a4
{
  id v6 = +[CECMessage pollFrom:[(CoreCECDeviceProvider *)self sendFromAddress] to:a3];
  return [(CoreCECDeviceProvider *)self sendMessage:v6 withRetryCount:2 error:a4];
}

- (BOOL)reportPhysicalAddress:(id *)a3
{
  unsigned __int16 v8 = 0;
  unsigned __int8 v7 = 0;
  if (PackedPhysicalAddressForCoreCECPhysicalAddress(&v8, [(CoreCECDevice *)self physicalAddress])
    && CECDeviceTypeForCoreCECDeviceType(&v7, [(CoreCECDevice *)self deviceType]))
  {
    return [(CoreCECDeviceProvider *)self sendMessage:+[CECMessage reportPhysicalAddress:v8 deviceType:v7 from:[(CoreCECDeviceProvider *)self sendFromAddress]] error:a3];
  }
  if (!a3) {
    return 0;
  }
  id v6 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
  BOOL result = 0;
  *a3 = v6;
  return result;
}

- (BOOL)setMenuLanguage:(CECLanguage)a3 error:(id *)a4
{
  id v6 = +[CECMessage setMenuLanguage:*(_DWORD *)a3.characters & 0xFFFFFF from:[(CoreCECDeviceProvider *)self sendFromAddress]];
  return [(CoreCECDeviceProvider *)self sendMessage:v6 error:a4];
}

- (BOOL)reportFeatures:(id *)a3
{
  __int16 v14 = 0;
  unsigned __int16 v13 = 0;
  if ((CECAllDeviceTypesMaskForCoreCECDeviceTypesMask((unsigned char *)&v14 + 1, [(CoreCECDevice *)self allDeviceTypes]) & 1) == 0|| (CECDeviceFeaturesMaskForCoreCECDeviceFeaturesMask(&v14, [(CoreCECDevice *)self deviceFeatures], [(CoreCECDevice *)self deviceType]) & 1) == 0)
  {
    goto LABEL_10;
  }
  if (gLogCategory_CoreRCDevice <= 10 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize()))
  {
    unint64_t v11 = [(CoreCECDevice *)self deviceFeatures];
    uint64_t v12 = v14;
    LogPrintF();
  }
  if (CECRCProfileForCoreCECRCProfile(&v13, [(CoreCECDevice *)self rcProfile]))
  {
    unsigned __int8 v5 = [(CoreCECDevice *)self cecVersion];
    uint64_t v6 = HIBYTE(v14);
    uint64_t v7 = v14;
    uint64_t v8 = [(CoreCECDeviceProvider *)self sendFromAddress];
    return [(CoreCECDeviceProvider *)self sendMessage:+[CECMessage reportFeaturesWith:v5 deviceTypes:v6 rcProfile:v13 deviceFeatures:v7 from:v8] error:a3];
  }
  else
  {
LABEL_10:
    if (a3)
    {
      unsigned __int16 v10 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
      BOOL result = 0;
      *a3 = v10;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)deckControlWithMode:(unint64_t)a3 to:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  unsigned __int8 v10 = 0;
  if (CECDeckControlModeForCoreCECDeckControlMode(&v10, a3)) {
    return [(CoreCECDeviceProvider *)self sendMessage:+[CECMessage deckControlWithMode:v10 from:[(CoreCECDeviceProvider *)self sendFromAddress] to:v6] error:a5];
  }
  if (!a5) {
    return 0;
  }
  unsigned __int16 v9 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
  BOOL result = 0;
  *a5 = v9;
  return result;
}

- (BOOL)deckStatusWithInfo:(unint64_t)a3 to:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  unsigned __int8 v10 = 0;
  if (CECDeckInfoForCoreCECDeckInfo(&v10, a3)) {
    return [(CoreCECDeviceProvider *)self sendMessage:+[CECMessage deckStatusWithInfo:v10 from:[(CoreCECDeviceProvider *)self sendFromAddress] to:v6] error:a5];
  }
  if (!a5) {
    return 0;
  }
  unsigned __int16 v9 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
  BOOL result = 0;
  *a5 = v9;
  return result;
}

- (BOOL)giveDeckStatusWithRequest:(unsigned __int8)a3 to:(unsigned __int8)a4 error:(id *)a5
{
  id v7 = +[CECMessage giveDeckStatusWithRequest:a3 from:[(CoreCECDeviceProvider *)self sendFromAddress] to:a4];
  return [(CoreCECDeviceProvider *)self sendMessage:v7 error:a5];
}

- (BOOL)playWithMode:(unint64_t)a3 to:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  unsigned __int8 v10 = 0;
  if (CECPlayModeForCoreCECPlayMode(&v10, a3)) {
    return [(CoreCECDeviceProvider *)self sendMessage:+[CECMessage playWithMode:v10 from:[(CoreCECDeviceProvider *)self sendFromAddress] to:v6] error:a5];
  }
  if (!a5) {
    return 0;
  }
  unsigned __int16 v9 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
  BOOL result = 0;
  *a5 = v9;
  return result;
}

- (BOOL)deviceVendorID:(unsigned int)a3 error:(id *)a4
{
  id v6 = +[CECMessage deviceVendorID:*(void *)&a3 from:[(CoreCECDeviceProvider *)self sendFromAddress]];
  return [(CoreCECDeviceProvider *)self sendMessage:v6 error:a4];
}

- (BOOL)giveDeviceVendorIDTo:(unsigned __int8)a3 error:(id *)a4
{
  id v6 = +[CECMessage giveDeviceVendorIDFrom:[(CoreCECDeviceProvider *)self sendFromAddress] to:a3];
  return [(CoreCECDeviceProvider *)self sendMessage:v6 error:a4];
}

- (BOOL)giveOSDNameTo:(unsigned __int8)a3 error:(id *)a4
{
  id v6 = +[CECMessage giveOSDNameFrom:[(CoreCECDeviceProvider *)self sendFromAddress] to:a3];
  return [(CoreCECDeviceProvider *)self sendMessage:v6 error:a4];
}

- (BOOL)setOSDName:(CECOSDName)a3 to:(unsigned __int8)a4 error:(id *)a5
{
  id v7 = +[CECMessage setOSDName:from:to:](CECMessage, "setOSDName:from:to:", *(void *)&a3.length, *(void *)&a3.characters[7] & 0xFFFFFFFFFFFFFFLL, [(CoreCECDeviceProvider *)self sendFromAddress], a4);
  return [(CoreCECDeviceProvider *)self sendMessage:v7 error:a5];
}

- (BOOL)menuStatus:(unsigned __int8)a3 to:(unsigned __int8)a4 error:(id *)a5
{
  id v7 = +[CECMessage menuStatus:a3 from:[(CoreCECDeviceProvider *)self sendFromAddress] to:a4];
  return [(CoreCECDeviceProvider *)self sendMessage:v7 error:a5];
}

- (BOOL)userControlPressed:(CECUserControl)a3 to:(unsigned __int8)a4 error:(id *)a5
{
  id v7 = +[CECMessage userControlPressed:a3 from:[(CoreCECDeviceProvider *)self sendFromAddress] to:a4];
  return [(CoreCECDeviceProvider *)self sendMessage:v7 withRetryCount:5 error:a5];
}

- (BOOL)userControlReleasedTo:(unsigned __int8)a3 error:(id *)a4
{
  id v6 = +[CECMessage userControlReleasedFrom:[(CoreCECDeviceProvider *)self sendFromAddress] to:a3];
  return [(CoreCECDeviceProvider *)self sendMessage:v6 withRetryCount:5 error:a4];
}

- (BOOL)giveDevicePowerStatusTo:(unsigned __int8)a3 error:(id *)a4
{
  id v6 = +[CECMessage giveDevicePowerStatusFrom:[(CoreCECDeviceProvider *)self sendFromAddress] to:a3];
  return [(CoreCECDeviceProvider *)self sendMessage:v6 error:a4];
}

- (BOOL)reportPowerStatus:(unsigned __int8)a3 to:(unsigned __int8)a4 error:(id *)a5
{
  id v7 = +[CECMessage reportPowerStatus:a3 from:[(CoreCECDeviceProvider *)self sendFromAddress] to:a4];
  return [(CoreCECDeviceProvider *)self sendMessage:v7 error:a5];
}

- (BOOL)featureAbort:(unsigned __int8)a3 reason:(unsigned __int8)a4 to:(unsigned __int8)a5 error:(id *)a6
{
  id v8 = +[CECMessage featureAbort:a3 reason:a4 from:[(CoreCECDeviceProvider *)self sendFromAddress] to:a5];
  return [(CoreCECDeviceProvider *)self sendMessage:v8 error:a6];
}

- (BOOL)abortTo:(unsigned __int8)a3 error:(id *)a4
{
  id v6 = +[CECMessage abortFrom:[(CoreCECDeviceProvider *)self sendFromAddress] to:a3];
  return [(CoreCECDeviceProvider *)self sendMessage:v6 error:a4];
}

- (BOOL)giveAudioStatusTo:(unsigned __int8)a3 error:(id *)a4
{
  id v6 = +[CECMessage giveAudioStatusFrom:[(CoreCECDevice *)self logicalAddress] to:a3];
  return [(CoreCECDeviceProvider *)self sendMessage:v6 error:a4];
}

- (BOOL)giveSystemAudioModeStatusTo:(unsigned __int8)a3 error:(id *)a4
{
  id v6 = +[CECMessage giveSystemAudioModeStatusFrom:[(CoreCECDeviceProvider *)self sendFromAddress] to:a3];
  return [(CoreCECDeviceProvider *)self sendMessage:v6 withRetryCount:5 error:a4];
}

- (BOOL)systemAudioModeRequestWithPhysicalAddress:(unsigned __int16)a3 to:(unsigned __int8)a4 error:(id *)a5
{
  id v7 = +[CECMessage systemAudioModeRequestWithPhysicalAddress:a3 from:[(CoreCECDeviceProvider *)self sendFromAddress] to:a4];
  return [(CoreCECDeviceProvider *)self sendMessage:v7 error:a5];
}

- (BOOL)reportAudioStatusTo:(unsigned __int8)a3 error:(id *)a4
{
  id v6 = +[CECMessage reportAudioStatusWithVolume:[(CoreCECDevice *)self audioVolumeStatus] mute:[(CoreCECDevice *)self audioMuteStatus] from:[(CoreCECDeviceProvider *)self sendFromAddress] to:a3];
  return [(CoreCECDeviceProvider *)self sendMessage:v6 error:a4];
}

- (BOOL)reportShortAudioDescriptorTo:(unsigned __int8)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return 0;
}

- (BOOL)requestShortAudioDescriptor:(unsigned __int8)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return 0;
}

- (BOOL)setSystemAudioMode:(unint64_t)a3 to:(unsigned __int8)a4 error:(id *)a5
{
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return 0;
}

- (BOOL)systemAudioModeStatus:(unsigned __int8)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return 0;
}

- (BOOL)initiateARC:(unsigned __int8)a3 error:(id *)a4
{
  id v6 = +[CECMessage initiateARCFrom:[(CoreCECDeviceProvider *)self sendFromAddress] to:a3];
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return [(CoreCECDeviceProvider *)self sendMessage:v6 error:a4];
}

- (BOOL)terminateARC:(unsigned __int8)a3 error:(id *)a4
{
  id v6 = +[CECMessage terminateARCFrom:[(CoreCECDeviceProvider *)self sendFromAddress] to:a3];
  if (gLogCategory_CoreRCDevice <= 40 && (gLogCategory_CoreRCDevice != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return [(CoreCECDeviceProvider *)self sendMessage:v6 error:a4];
}

- (unsigned)sendFromAddress
{
  return self->_sendFromAddress;
}

- (void)setSendFromAddress:(unsigned __int8)a3
{
  self->_sendFromAddress = a3;
}

- (unsigned)deckStatusRequestMask
{
  return self->_deckStatusRequestMask;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_BOOL isValid = a3;
}

- (int)systemAudioModeState
{
  return self->_systemAudioModeState;
}

- (void)setSystemAudioModeState:(int)a3
{
  self->_systemAudioModeState = a3;
}

- (BOOL)systemAudioModeRequestedByTV
{
  return self->_systemAudioModeRequestedByTV;
}

- (void)setSystemAudioModeRequestedByTV:(BOOL)a3
{
  self->_systemAudioModeRequestedByTV = a3;
}

- (BOOL)systemAudioModeRequestedByOtherDevice
{
  return self->_systemAudioModeRequestedByOtherDevice;
}

- (void)setSystemAudioModeRequestedByOtherDevice:(BOOL)a3
{
  self->_systemAudioModeRequestedByOtherDevice = a3;
}

- (int)audioReturnChannelState
{
  return self->_audioReturnChannelState;
}

- (void)setAudioReturnChannelState:(int)a3
{
  self->_audioReturnChannelState = a3;
}

- (BOOL)trackAudioStatusEnabled
{
  return self->_trackAudioStatusEnabled;
}

- (void)setTrackAudioStatusEnabled:(BOOL)a3
{
  self->_trackAudioStatusEnabled = a3;
}

- (int64_t)trackAudioStatusPressTimeout
{
  return self->_trackAudioStatusPressTimeout;
}

- (void)setTrackAudioStatusPressTimeout:(int64_t)a3
{
  self->_trackAudioStatusPressTimeout = a3;
}

- (int64_t)trackAudioStatusPollInterval
{
  return self->_trackAudioStatusPollInterval;
}

- (void)setTrackAudioStatusPollInterval:(int64_t)a3
{
  self->_trackAudioStatusPollInterval = a3;
}

@end