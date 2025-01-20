@interface CoreCECBusProvider
+ (BOOL)supportsSecureCoding;
- (BOOL)_sendMessage:(id)a3 toDevice:(id)a4 withRetryCount:(unsigned __int8)a5 error:(id *)a6;
- (BOOL)areMultipleCECBusses;
- (BOOL)deferLossOfLink;
- (BOOL)pollingOperation:(id)a3 shouldSkipAddress:(unsigned __int8)a4;
- (BOOL)receivedMessage:(id)a3;
- (BOOL)refreshDevicesWithInitiator:(id)a3 error:(id *)a4;
- (BOOL)sendMessage:(id)a3 error:(id *)a4;
- (BOOL)sendMessage:(id)a3 withRetryCount:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 error:(id *)a5;
- (CECBusPollingOperation)pollingOperation;
- (CECInterface)interface;
- (Class)classForCoder;
- (CoreCECBusProvider)initWithBus:(id)a3;
- (CoreCECBusProvider)initWithCoder:(id)a3;
- (CoreCECBusProvider)initWithInterface:(id)a3;
- (CoreCECBusProvider)initWithLinkState:(BOOL)a3 physicalAddress:(unint64_t)a4;
- (NSString)description;
- (id)_cecErrorWithError:(id)a3 fromInterface:(id)a4;
- (id)addDeviceWithAttributes:(id)a3 error:(id *)a4;
- (id)addDeviceWithLogicalAddress:(unsigned __int8)a3 message:(id)a4 reason:(unint64_t)a5;
- (id)addDeviceWithLogicalAddress:(unsigned __int8)a3 physicalAddress:(unint64_t)a4 attributes:(id)a5 message:(id)a6 reason:(unint64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)destinationConfirmedForMessage:(id)a3;
- (id)destinationExpectedForMessage:(id)a3;
- (id)propertyForKey:(id)a3 error:(id *)a4;
- (unsigned)allocateCECAddressForDeviceType:(unint64_t)a3 withCECAddress:(unsigned __int8)a4 error:(id *)a5;
- (unsigned)arcTxAddressForArcRxDevice:(id)a3;
- (void)_changeActiveSourceFrom:(id)a3 to:(id)a4;
- (void)dealloc;
- (void)didChangeLinkState:(BOOL)a3 physicalAddress:(unint64_t)a4;
- (void)interface:(id)a3 hibernationChanged:(BOOL)a4;
- (void)interface:(id)a3 receivedFrame:(CECFrame *)a4;
- (void)interfacePropertiesChanged:(id)a3;
- (void)makeDeviceInactiveSource:(id)a3;
- (void)pollingOperation:(id)a3 deviceNotRespondingAtAddress:(unsigned __int8)a4;
- (void)pollingOperation:(id)a3 encounteredError:(id)a4 forMessage:(id)a5;
- (void)pollingOperationCompleted:(id)a3;
- (void)reallocateAllCECAddresses:(id)a3;
- (void)setActiveSource:(id)a3;
- (void)setLinkState:(BOOL)a3 physicalAddress:(unint64_t)a4;
- (void)setOsdNameASCII:(CECOSDName)a3;
- (void)setPollingOperation:(id)a3;
- (void)setStreamPath:(unint64_t)a3;
- (void)setSystemAudioModeStatus:(unint64_t)a3;
- (void)setTvLanguageCodeASCII:(CECLanguage)a3;
- (void)updateAllowHibernation;
- (void)willRemoveDevice:(id)a3;
@end

@implementation CoreCECBusProvider

- (CoreCECBusProvider)initWithLinkState:(BOOL)a3 physicalAddress:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CoreCECBusProvider;
  v5 = [(CoreCECBus *)&v7 initWithLinkState:a3 physicalAddress:a4];
  if (v5)
  {
    v5->_deferLossOfLink = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "cecUserDefaults"), "cecDeferLossOfLink");
    v5->_realHasLink = a3;
  }
  return v5;
}

- (CoreCECBusProvider)initWithBus:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CoreCECBusProvider;
  v3 = [(CoreCECBus *)&v5 initWithBus:a3];
  if (v3)
  {
    v3->_deferLossOfLink = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "cecUserDefaults"), "cecDeferLossOfLink");
    v3->_realHasLink = 0;
  }
  return v3;
}

- (CoreCECBusProvider)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CoreCECBusProvider;
  v3 = [(CoreCECBus *)&v5 initWithCoder:a3];
  if (v3)
  {
    v3->_deferLossOfLink = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "cecUserDefaults"), "cecDeferLossOfLink");
    v3->_realHasLink = 0;
  }
  return v3;
}

- (CoreCECBusProvider)initWithInterface:(id)a3
{
  uint64_t v12 = 0;
  unsigned __int8 v11 = 0;
  if (!objc_msgSend((id)objc_msgSend(a3, "properties"), "getLinkState:physicalAddress:", &v11, &v12))
  {

    return 0;
  }
  uint64_t v5 = v12;
  if (!v12)
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "cecUserDefaults"), "lastKnownPhysicalAddress");
    uint64_t v12 = v5;
    if (gLogCategory_CoreRCBus > 40) {
      goto LABEL_8;
    }
    if (gLogCategory_CoreRCBus == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_7;
      }
      uint64_t v5 = v12;
    }
    uint64_t v10 = CoreCECPhysicalAddressString(v5);
    LogPrintF();
LABEL_7:
    uint64_t v5 = v12;
LABEL_8:
    if (!v5)
    {
      uint64_t v5 = 252645135;
      uint64_t v12 = 252645135;
    }
  }
  if (gLogCategory_CoreRCBus <= 40)
  {
    if (gLogCategory_CoreRCBus != -1 || (v6 = _LogCategory_Initialize(), uint64_t v5 = v12, v6))
    {
      uint64_t v10 = CoreCECPhysicalAddressString(v5);
      LogPrintF();
      uint64_t v5 = v12;
    }
  }
  objc_super v7 = -[CoreCECBusProvider initWithLinkState:physicalAddress:](self, "initWithLinkState:physicalAddress:", v11, v5, v10);
  if (v7)
  {
    v8 = (CECInterface *)a3;
    v7->_interface = v8;
    [(CECInterface *)v8 setDelegate:v7];
  }
  return v7;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)CoreCECBusProvider;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[CoreCECBus description](&v6, sel_description));
  objc_msgSend(v3, "appendFormat:", @" HPD: %u;", self->_realHasLink);
  if (self->_deferLossOfLink) {
    v4 = "Y";
  }
  else {
    v4 = "N";
  }
  objc_msgSend(v3, "appendFormat:", @" defersHPDLoss: %s;", v4);
  return (NSString *)v3;
}

- (void)dealloc
{
  [(CECBusPollingOperation *)self->_pollingOperation setDelegate:0];
  [(CECBusPollingOperation *)self->_pollingOperation stopPolling];

  [(CECInterface *)self->_interface setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CoreCECBusProvider;
  [(CoreRCBus *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return NSClassFromString(&cfstr_Corececbusclie.isa);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CoreCECBusProvider;
  return [(CoreRCBus *)&v4 copyWithZone:a3];
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 error:(id *)a5
{
  v8 = [(CoreCECBusProvider *)self interface];
  return [(CoreRCInterface *)v8 setProperty:a3 forKey:a4 error:a5];
}

- (id)propertyForKey:(id)a3 error:(id *)a4
{
  objc_super v6 = [(CoreCECBusProvider *)self interface];
  return [(CoreRCInterface *)v6 propertyForKey:a3 error:a4];
}

- (id)addDeviceWithLogicalAddress:(unsigned __int8)a3 physicalAddress:(unint64_t)a4 attributes:(id)a5 message:(id)a6 reason:(unint64_t)a7
{
  uint64_t v11 = a3;
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    unint64_t v19 = a4;
    LogPrintF();
  }
  uint64_t v13 = objc_msgSend(-[CoreRCBus manager](self, "manager", v19), "addDeviceWithBus:logicalAddress:physicalAddress:attributes:message:reason:", self, v11, a4, a5, a6, a7);
  v14 = (CoreCECDeviceProvider *)v13;
  if (a7 != 3 && !v13) {
    v14 = [[CoreCECDeviceProvider alloc] initWithBus:self local:a7 == 2 logicalAddress:v11 physicalAddress:a4 attributes:a5];
  }
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = 15;
      switch(a7)
      {
        case 0uLL:
          uint64_t v16 = objc_msgSend(a6, "destination", 15);
          goto LABEL_16;
        case 1uLL:
          goto LABEL_21;
        case 2uLL:
          BOOL v17 = [(CoreRCDevice *)v14 isLocalDevice];
          uint64_t v15 = v11;
          if (!v17) {
            return v14;
          }
          goto LABEL_21;
        case 3uLL:
        case 4uLL:
          uint64_t v16 = objc_msgSend(a6, "initiator", 15);
LABEL_16:
          uint64_t v15 = v16;
          goto LABEL_21;
        default:
          if (gLogCategory_CoreRCManager <= 90
            && (gLogCategory_CoreRCManager != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          uint64_t v15 = 15;
LABEL_21:
          [(CoreCECDeviceProvider *)v14 setSendFromAddress:v15];
          [(CoreRCBus *)self addDevice:v14];
          if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
          {
            [(CoreRCBus *)self devices];
            LogPrintF();
          }
          break;
      }
    }
  }
  return v14;
}

- (unsigned)allocateCECAddressForDeviceType:(unint64_t)a3 withCECAddress:(unsigned __int8)a4 error:(id *)a5
{
  unsigned __int8 v11 = a4;
  uint64_t v10 = 0;
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (self->_interface)
  {
    unsigned __int8 v9 = 0;
    if (CECDeviceTypeForCoreCECDeviceType(&v9, a3))
    {
      [(CECInterface *)self->_interface allocateCECAddress:&v11 forDeviceType:v9 error:&v10];
      if (!a5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
      if (!a5) {
        goto LABEL_15;
      }
    }
    goto LABEL_14;
  }
  if (gLogCategory_CoreRCBus <= 60 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  unsigned __int8 v11 = 15;
  if (a5) {
LABEL_14:
  }
    *a5 = v10;
LABEL_15:
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return v11;
}

- (id)addDeviceWithAttributes:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v33 = 0;
  if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    id v23 = a3;
    LogPrintF();
  }
  if (!objc_msgSend(a3, "deviceType", v23))
  {
    v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08410];
    uint64_t v22 = -6705;
LABEL_111:
    id v11 = 0;
    id v33 = (id)[v20 errorWithDomain:v21 code:v22 userInfo:0];
    goto LABEL_77;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v27 = self;
  objc_super v6 = [(CoreRCBus *)self devices];
  uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
LABEL_8:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(id *)(*((void *)&v29 + 1) + 8 * v10);
      if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
      {
        uint64_t v24 = (uint64_t)v11;
        LogPrintF();
      }
      if (objc_msgSend(v11, "isLocalDevice", v24))
      {
        uint64_t v12 = [v11 deviceType];
        if (v12 == [a3 deviceType]) {
          break;
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v8) {
          goto LABEL_8;
        }
        goto LABEL_27;
      }
    }
    if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
    {
      uint64_t v24 = (uint64_t)v11;
      LogPrintF();
    }
    if (objc_msgSend(v11, "logicalAddress", v24) == 15 && (objc_msgSend(a3, "options") & 1) == 0)
    {
      if (gLogCategory_CoreRCBus <= 60 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
        goto LABEL_100;
      }
LABEL_110:
      v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v21 = *MEMORY[0x263F08410];
      uint64_t v22 = -6761;
      goto LABEL_111;
    }
    if (v11) {
      goto LABEL_77;
    }
  }
LABEL_27:
  if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v13 = -[CoreCECBusProvider allocateCECAddressForDeviceType:withCECAddress:error:](v27, "allocateCECAddressForDeviceType:withCECAddress:error:", [a3 deviceType], 15, &v33);
  if (v13 == 15 && ([a3 options] & 1) == 0)
  {
    if (gLogCategory_CoreRCBus <= 60 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
LABEL_100:
    }
      LogPrintF();
    goto LABEL_110;
  }
  uint64_t v14 = [(CoreCECBus *)v27 deviceOnBusWithLogicalAddress:v13];
  if (v14)
  {
    uint64_t v15 = v14;
    if (gLogCategory_CoreRCBus <= 60 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[CoreRCBus removeDevice:](v27, "removeDevice:", v15, v15);
    }
    else
    {
      -[CoreRCBus removeDevice:](v27, "removeDevice:", v15, v24);
    }
  }
  id v11 = [(CoreCECBusProvider *)v27 addDeviceWithLogicalAddress:v13 physicalAddress:[(CoreCECBus *)v27 physicalAddress] attributes:a3 message:0 reason:2];
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    uint64_t v24 = (uint64_t)v11;
    LogPrintF();
  }
  if (!v11)
  {
    if (gLogCategory_CoreRCBus <= 90 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    -[CECInterface deallocateCECAddress:error:](v27->_interface, "deallocateCECAddress:error:", v13, 0, v24);
    v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08410];
    uint64_t v22 = -6728;
    goto LABEL_111;
  }
  if (([a3 options] & 2) != 0
    && ([v11 setSystemAudioControlEnabled:1 error:&v33] & 1) == 0)
  {
    if (gLogCategory_CoreRCBus > 90 || gLogCategory_CoreRCBus == -1 && !_LogCategory_Initialize()) {
      goto LABEL_108;
    }
    uint64_t v24 = objc_msgSend(v33, "localizedDescription", v24);
    goto LABEL_97;
  }
  if ((objc_msgSend(a3, "options", v24) & 4) != 0
    && ([v11 setAudioReturnChannelControlEnabled:1 error:&v33] & 1) == 0)
  {
    if (gLogCategory_CoreRCBus > 90 || gLogCategory_CoreRCBus == -1 && !_LogCategory_Initialize()) {
      goto LABEL_108;
    }
    uint64_t v24 = [v33 localizedDescription];
LABEL_97:
    LogPrintF();
LABEL_108:
    -[CoreRCBus removeDevice:](v27, "removeDevice:", v11, v24);
    id v11 = 0;
    goto LABEL_77;
  }
  [v11 broadcastPresence];
  if ([(CoreCECBus *)v27 activeSource])
  {
    int v16 = [a3 isActiveSource];
    goto LABEL_50;
  }
  if ([(CoreCECBus *)v27 streamPath] != 252645135)
  {
    uint64_t v17 = [(CoreCECBus *)v27 streamPath];
    if (v17 == [v11 physicalAddress])
    {
      if (![a3 isActiveSource])
      {
        if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
        {
          uint64_t v25 = CoreCECPhysicalAddressString([(CoreCECBus *)v27 streamPath]);
          LogPrintF();
          objc_msgSend(v11, "handleDeviceSelected", v25);
        }
        else
        {
          objc_msgSend(v11, "handleDeviceSelected", v24);
        }
        goto LABEL_77;
      }
      if (gLogCategory_CoreRCBus > 40 || gLogCategory_CoreRCBus == -1 && !_LogCategory_Initialize())
      {
LABEL_74:
        -[CoreCECBusProvider setActiveSource:](v27, "setActiveSource:", v11, v24);
        goto LABEL_77;
      }
      uint64_t v24 = (uint64_t)v11;
LABEL_65:
      LogPrintF();
      goto LABEL_74;
    }
  }
  uint64_t v18 = [(CoreCECBus *)v27 streamPath];
  int v16 = [a3 isActiveSource];
  if (v18 == 252645135)
  {
    if (!v16) {
      goto LABEL_77;
    }
    if (gLogCategory_CoreRCBus > 40 || gLogCategory_CoreRCBus == -1 && !_LogCategory_Initialize()) {
      goto LABEL_74;
    }
    uint64_t v24 = (uint64_t)v11;
    goto LABEL_65;
  }
LABEL_50:
  if (v16)
  {
    if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
    {
      uint64_t v24 = [(CoreCECBus *)v27 activeSource];
      uint64_t v26 = CoreCECPhysicalAddressString([(CoreCECBus *)v27 streamPath]);
      LogPrintF();
    }
    objc_msgSend(v11, "setIsActiveSource:", 0, v24, v26);
    [(CoreRCBus *)v27 notifyDelegateDeviceUpdated:v11];
  }
LABEL_77:
  if (a4) {
    *a4 = v33;
  }
  if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return v11;
}

- (void)willRemoveDevice:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a3 isLocalDevice])
    {
      uint64_t v5 = [a3 logicalAddress];
      if (v5 != 15)
      {
        uint64_t v9 = 0;
        if (![(CECInterface *)self->_interface deallocateCECAddress:v5 error:&v9]
          && gLogCategory_CoreRCBus <= 60
          && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
        {
          id v6 = a3;
          uint64_t v7 = v9;
          LogPrintF();
        }
      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)CoreCECBusProvider;
  -[CoreRCBus willRemoveDevice:](&v8, sel_willRemoveDevice_, a3, v6, v7);
}

- (id)addDeviceWithLogicalAddress:(unsigned __int8)a3 message:(id)a4 reason:(unint64_t)a5
{
  uint64_t v7 = a3;
  id result = -[CoreCECBus deviceOnBusWithLogicalAddress:](self, "deviceOnBusWithLogicalAddress:");
  if (!result)
  {
    uint64_t v19 = 0;
    uint64_t v20 = 252645135;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v16 = 0;
    uint64_t v10 = -1;
    if (!a5)
    {
      if ([a4 messageType] == 132)
      {
        if (([a4 parseReportPhysicalAddress:&v20 deviceType:&v19] & 1) == 0
          && gLogCategory_CoreRCBus <= 10
          && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else if ([a4 messageType] == 166)
      {
        __int16 v15 = 0;
        __int16 v14 = 0;
        unsigned __int8 v13 = 0;
        [a4 parseReportFeatures:(char *)&v15 + 1 deviceTypes:&v15 rcProfile:&v14 features:&v13];
        CoreCECDeviceFeaturesMaskForCECDeviceFeaturesMask(&v18, v13);
        CoreCECDeviceTypesMaskForCECAllDeviceTypesMask(&v17, v15);
        CoreCECRCProfileForCECRCProfile(&v16, &v14);
        uint64_t v10 = HIBYTE(v15);
      }
    }
    if (v7)
    {
      uint64_t v11 = v19;
      uint64_t v12 = v20;
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v11 = 7;
      uint64_t v19 = 7;
      uint64_t v20 = 0;
    }
    return [(CoreCECBusProvider *)self addDeviceWithLogicalAddress:v7 physicalAddress:v12 attributes:+[CoreCECDeviceBasicAttributes deviceAttributesWithPrimaryType:v11 otherTypes:v17 features:v18 rcProfile:v16 vendorID:-1 version:v10] message:a4 reason:a5];
  }
  return result;
}

- (void)setLinkState:(BOOL)a3 physicalAddress:(unint64_t)a4
{
  if (self->_realHasLink != a3)
  {
    self->_BOOL realHasLink = a3;
    if ([(CoreCECBusProvider *)self areMultipleCECBusses])
    {
      if (gLogCategory_CoreRCBus > 40 || gLogCategory_CoreRCBus == -1 && !_LogCategory_Initialize()) {
        goto LABEL_13;
      }
      BOOL realHasLink = self->_realHasLink;
      uint64_t v7 = [(NSUUID *)[(CoreRCBus *)self uniqueID] UUIDString];
    }
    else
    {
      if (gLogCategory_CoreRCBus > 40 || gLogCategory_CoreRCBus == -1 && !_LogCategory_Initialize()) {
        goto LABEL_13;
      }
      BOOL realHasLink = self->_realHasLink;
    }
    LogPrintF();
LABEL_13:
    if (self->_deferLossOfLink)
    {
      if (self->_realHasLink)
      {
        v10.receiver = self;
        v10.super_class = (Class)CoreCECBusProvider;
        [(CoreCECBus *)&v10 setLinkState:0 physicalAddress:a4];
        -[CoreCECBus setLinkState:physicalAddress:](&v9, sel_setLinkState_physicalAddress_, 1, a4, realHasLink, v7, v8.receiver, v8.super_class, self, CoreCECBusProvider);
      }
    }
    else
    {
      -[CoreCECBus setLinkState:physicalAddress:](&v8, sel_setLinkState_physicalAddress_, self->_realHasLink, a4, realHasLink, v7, self, CoreCECBusProvider, v9.receiver, v9.super_class);
    }
  }
}

- (void)didChangeLinkState:(BOOL)a3 physicalAddress:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CoreCECBusProvider;
  [(CoreCECBus *)&v6 didChangeLinkState:a3 physicalAddress:a4];
  if (!a3)
  {
    [(CoreRCBus *)self removeAllExternalDevices];
    [(CoreCECBusProvider *)self reallocateAllCECAddresses:[(CoreCECBusProvider *)self interface]];
  }
}

- (BOOL)refreshDevicesWithInitiator:(id)a3 error:(id *)a4
{
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    id v14 = a3;
    uint64_t v11 = v7;
    uint64_t v12 = self;
    LogPrintF();
  }
  if (!a3)
  {
    objc_super v9 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
    if (!a4) {
      return v9 == 0;
    }
    goto LABEL_13;
  }
  if (![(CoreCECBusProvider *)self pollingOperation])
  {
    objc_super v8 = -[CECBusPollingOperation initWithInterface:initiator:queue:]([CECBusPollingOperation alloc], "initWithInterface:initiator:queue:", -[CoreCECBusProvider interface](self, "interface"), [a3 logicalAddress], objc_msgSend(-[CoreRCBus manager](self, "manager"), "serialQueue"));
    [(CECBusPollingOperation *)v8 setDelegate:self];
    if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CECBusPollingOperation *)v8 startPolling];
    [(CoreCECBusProvider *)self setPollingOperation:v8];
  }
  objc_super v9 = 0;
  if (a4) {
LABEL_13:
  }
    *a4 = v9;
  return v9 == 0;
}

- (BOOL)pollingOperation:(id)a3 shouldSkipAddress:(unsigned __int8)a4
{
  id v4 = [(CoreCECBus *)self deviceOnBusWithLogicalAddress:a4];
  if (v4) {
    char v5 = [v4 isLocalDevice];
  }
  else {
    char v5 = 0;
  }
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return v5;
}

- (void)pollingOperation:(id)a3 deviceNotRespondingAtAddress:(unsigned __int8)a4
{
  id v5 = [(CoreCECBus *)self deviceOnBusWithLogicalAddress:a4];
  if (v5)
  {
    id v6 = v5;
    if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(CoreRCBus *)self removeDevice:v6];
  }
}

- (void)pollingOperation:(id)a3 encounteredError:(id)a4 forMessage:(id)a5
{
  if (![(CECInterface *)[(CoreCECBusProvider *)self interface] errorIsNack:a4]
    && gLogCategory_CoreRCBus <= 60
    && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)pollingOperationCompleted:(id)a3
{
  [(CECBusPollingOperation *)[(CoreCECBusProvider *)self pollingOperation] setDelegate:0];
  [(CoreCECBusProvider *)self setPollingOperation:0];
}

- (void)_changeActiveSourceFrom:(id)a3 to:(id)a4
{
  [a3 setIsActiveSource:0];
  [a4 setIsActiveSource:1];
  if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(CoreCECBus *)self didChangeActiveSourceFrom:a3 to:a4];
}

- (void)setStreamPath:(unint64_t)a3
{
  if ([(CoreCECBus *)self streamPath] != a3)
  {
    id v5 = [(CoreCECBus *)self activeSource];
    v6.receiver = self;
    v6.super_class = (Class)CoreCECBusProvider;
    [(CoreCECBus *)&v6 setStreamPath:a3];
    [(CoreCECBus *)self didUpdateProperties:&unk_26FEDA858];
    if (v5)
    {
      if ([(CoreCECDevice *)v5 physicalAddress] != a3) {
        [(CoreCECBusProvider *)self _changeActiveSourceFrom:v5 to:0];
      }
    }
  }
}

- (void)setOsdNameASCII:(CECOSDName)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CoreCECBusProvider;
  -[CoreCECBus setOsdNameASCII:](&v4, sel_setOsdNameASCII_, *(void *)&a3.length, *(void *)&a3.characters[7] & 0xFFFFFFFFFFFFFFLL);
  [(CoreCECBus *)self didUpdateProperties:&unk_26FEDA870];
}

- (void)setTvLanguageCodeASCII:(CECLanguage)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CoreCECBusProvider;
  [(CoreCECBus *)&v4 setTvLanguageCodeASCII:*(void *)a3.characters & 0xFFFFFFLL];
  [(CoreCECBus *)self didUpdateProperties:&unk_26FEDA888];
}

- (void)setSystemAudioModeStatus:(unint64_t)a3
{
  if ([(CoreCECBus *)self systemAudioModeStatus] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CoreCECBusProvider;
    [(CoreCECBus *)&v5 setSystemAudioModeStatus:a3];
    [(CoreCECBus *)self didUpdateProperties:&unk_26FEDA8A0];
  }
}

- (void)setActiveSource:(id)a3
{
  objc_super v5 = [(CoreCECBus *)self activeSource];
  if (a3) {
    uint64_t v6 = [a3 physicalAddress];
  }
  else {
    uint64_t v6 = 252645135;
  }
  if ([(CoreCECBus *)self streamPath] != v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)CoreCECBusProvider;
    [(CoreCECBus *)&v7 setStreamPath:v6];
    [(CoreCECBus *)self didUpdateProperties:&unk_26FEDA8B8];
  }
  if (v5 != a3) {
    [(CoreCECBusProvider *)self _changeActiveSourceFrom:v5 to:a3];
  }
}

- (void)makeDeviceInactiveSource:(id)a3
{
  if ([(CoreCECBus *)self activeSource] == a3)
  {
    if ([(CoreCECBus *)self streamPath] != 252645135)
    {
      v5.receiver = self;
      v5.super_class = (Class)CoreCECBusProvider;
      [(CoreCECBus *)&v5 setStreamPath:252645135];
      [(CoreCECBus *)self didUpdateProperties:&unk_26FEDA8D0];
    }
    [(CoreCECBusProvider *)self _changeActiveSourceFrom:a3 to:0];
  }
}

- (void)updateAllowHibernation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v3 = [(CoreRCBus *)self devices];
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    char v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 isLocalDevice]) {
          v7 &= [v9 powerStatus] == 2;
        }
      }
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    char v7 = 1;
  }
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    objc_super v10 = self;
    uint64_t v11 = v7 & 1;
    LogPrintF();
  }
  uint64_t v12 = 0;
  if (!-[CoreRCBus setAllowHibernation:error:](self, "setAllowHibernation:error:", v7 & 1, &v12, v10, v11)
    && gLogCategory_CoreRCBus <= 90
    && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (unsigned)arcTxAddressForArcRxDevice:(id)a3
{
  return 0;
}

- (id)destinationConfirmedForMessage:(id)a3
{
  if ([a3 isBroadcast]) {
    return 0;
  }
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    char v7 = self;
    uint64_t v8 = [a3 destination];
    LogPrintF();
  }
  uint64_t v5 = objc_msgSend(a3, "destination", v7, v8);
  return [(CoreCECBusProvider *)self addDeviceWithLogicalAddress:v5 message:a3 reason:4];
}

- (id)destinationExpectedForMessage:(id)a3
{
  if ([a3 isBroadcast]) {
    return 0;
  }
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    char v7 = self;
    uint64_t v8 = [a3 destination];
    LogPrintF();
  }
  uint64_t v5 = objc_msgSend(a3, "destination", v7, v8);
  return [(CoreCECBusProvider *)self addDeviceWithLogicalAddress:v5 message:a3 reason:3];
}

- (id)_cecErrorWithError:(id)a3 fromInterface:(id)a4
{
  if (!a3)
  {
    char v7 = (void *)MEMORY[0x263F087E8];
    id v5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6700 userInfo:0];
    goto LABEL_7;
  }
  id v5 = a3;
  int v6 = objc_msgSend(a4, "errorIsNack:");
  char v7 = (void *)MEMORY[0x263F087E8];
  if (!v6)
  {
LABEL_7:
    objc_super v10 = (void *)[v7 cecIOErrorWithUnderlyingError:v5];
    objc_msgSend(v10, "sendCECErrorAnalyticsWithContext:", -[CoreCECBus analyticsContext](self, "analyticsContext"));
    return v10;
  }
  uint64_t v8 = (void *)MEMORY[0x263F087E8];
  return (id)[v8 cecAcknowledgementErrorWithUnderlyingError:v5];
}

- (BOOL)_sendMessage:(id)a3 toDevice:(id)a4 withRetryCount:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  uint64_t v23 = 0;
  uint64_t v11 = [(CoreCECBusProvider *)self interface];
  if (!v11)
  {
    long long v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08410];
    uint64_t v18 = -6718;
LABEL_28:
    id v19 = (id)[v16 errorWithDomain:v17 code:v18 userInfo:0];
    goto LABEL_31;
  }
  uint64_t v12 = v11;
  int v13 = [a4 isLocalDevice];
  if ((v13 & 1) == 0
    && ![(CECInterface *)v12 sendMessage:a3 withRetryCount:v7 error:&v23])
  {
    id v19 = [(CoreCECBusProvider *)self _cecErrorWithError:v23 fromInterface:v12];
    goto LABEL_31;
  }
  if ([(CoreCECBusProvider *)self areMultipleCECBusses])
  {
    if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
    {
      id v20 = a3;
      uint64_t v22 = [(NSUUID *)[(CoreRCBus *)self uniqueID] UUIDString];
LABEL_11:
      LogPrintF();
    }
  }
  else if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    id v20 = a3;
    goto LABEL_11;
  }
  if (![(CECInterface *)v12 hasMultipleLogicalAddresses]
    || ([a3 isBroadcast] & 1) == 0 && !objc_msgSend(a4, "isLocalDevice"))
  {
    if (!v13) {
      return 1;
    }
    long long v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08410];
    uint64_t v18 = -6761;
    goto LABEL_28;
  }
  if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    id v21 = a3;
    LogPrintF();
  }
  BOOL v14 = 1;
  objc_msgSend(a3, "setLoopback:", 1, v21);
  if (![(CoreCECBusProvider *)self receivedMessage:a3])
  {
    id v19 = (id)objc_msgSend(MEMORY[0x263F087E8], "cecAcknowledgementErrorWithUnderlyingError:", objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", *MEMORY[0x263F08410], -6758, 0));
LABEL_31:
    BOOL v14 = 0;
    if (a6) {
      *a6 = v19;
    }
  }
  return v14;
}

- (BOOL)sendMessage:(id)a3 withRetryCount:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  id v7 = a3;
  id v9 = -[CoreCECBus deviceOnBusWithLogicalAddress:](self, "deviceOnBusWithLogicalAddress:", [a3 initiator]);
  uint64_t v26 = 0;
  int v10 = [v7 isBroadcast];
  if (!v7)
  {
    uint64_t v26 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
    goto LABEL_35;
  }
  int v11 = v10;
  if (v10)
  {
    id v12 = 0;
LABEL_6:
    BOOL v14 = 0;
    goto LABEL_7;
  }
  id v13 = -[CoreCECBus deviceOnBusWithLogicalAddress:](self, "deviceOnBusWithLogicalAddress:", [v7 destination]);
  if (v13)
  {
    id v12 = v13;
    goto LABEL_6;
  }
  id v12 = [(CoreCECBusProvider *)self destinationExpectedForMessage:v7];
  BOOL v14 = v12 != 0;
LABEL_7:
  if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    long long v15 = "NO";
    if (v11) {
      long long v16 = "YES";
    }
    else {
      long long v16 = "NO";
    }
    if (v14) {
      long long v15 = "YES";
    }
    id v24 = v12;
    id v25 = v9;
    id v21 = v16;
    uint64_t v23 = v15;
    id v19 = self;
    LogPrintF();
  }
  if (v12)
  {
    id v7 = (id)[v12 filterMessage:v7 fromDevice:v9];
    if (!v7)
    {
      if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      return 1;
    }
  }
  if (-[CoreCECBusProvider _sendMessage:toDevice:withRetryCount:error:](self, "_sendMessage:toDevice:withRetryCount:error:", v7, v12, v6, &v26, v19, v21, v23, v24, v25))
  {
    if (v12) {
      char v17 = 1;
    }
    else {
      char v17 = v11;
    }
    if ((v17 & 1) == 0
      && (id v12 = [(CoreCECBusProvider *)self destinationConfirmedForMessage:v7]) != 0
      && gLogCategory_CoreRCBus <= 10
      && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      objc_msgSend(v12, "didReceiveMessage:fromDevice:", v7, v9, self, v12);
    }
    else
    {
      objc_msgSend(v12, "didReceiveMessage:fromDevice:", v7, v9, v20, v22);
    }
    return 1;
  }
  if (v14) {
    [(CoreRCBus *)self removeDevice:v12];
  }
LABEL_35:
  BOOL result = 0;
  if (a5) {
    *a5 = v26;
  }
  return result;
}

- (BOOL)sendMessage:(id)a3 error:(id *)a4
{
  return [(CoreCECBusProvider *)self sendMessage:a3 withRetryCount:2 error:a4];
}

- (BOOL)areMultipleCECBusses
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(-[CoreRCBus manager](self, "manager", 0, 0), "buses");
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unsigned __int8 v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        v5 += objc_opt_isKindOfClass() & 1;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
    LOBYTE(v3) = v5 > 1u;
  }
  return v3;
}

- (void)interface:(id)a3 receivedFrame:(CECFrame *)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v6 = [CECMessage alloc];
  CECFrame v11 = *a4;
  uint64_t v7 = [(CECMessage *)v6 initWithFrame:&v11];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    if ([(CoreCECBusProvider *)self areMultipleCECBusses])
    {
      if (gLogCategory_CoreRCBus > 40 || gLogCategory_CoreRCBus == -1 && !_LogCategory_Initialize()) {
        goto LABEL_13;
      }
      long long v9 = v8;
      long long v10 = [(NSUUID *)[(CoreRCBus *)self uniqueID] UUIDString];
    }
    else
    {
      if (gLogCategory_CoreRCBus > 40 || gLogCategory_CoreRCBus == -1 && !_LogCategory_Initialize()) {
        goto LABEL_13;
      }
      long long v9 = v8;
    }
    LogPrintF();
LABEL_13:
    -[CoreCECBusProvider receivedMessage:](self, "receivedMessage:", v8, v9, v10);
  }
}

- (void)interface:(id)a3 hibernationChanged:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    uint64_t v12 = self;
    BOOL v13 = v4;
    LogPrintF();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(CoreRCBus *)self devices];
  uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        CECFrame v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 isLocalDevice]) {
          [v11 hibernationChanged:v4];
        }
      }
      uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)reallocateAllCECAddresses:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
  {
    long long v17 = self;
    LogPrintF();
  }
  uint64_t v30 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v4 = [(CoreRCBus *)self devices];
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v9, "isLocalDevice", v18, v19, v20))
        {
          uint64_t v10 = -[CoreCECBusProvider allocateCECAddressForDeviceType:withCECAddress:error:](self, "allocateCECAddressForDeviceType:withCECAddress:error:", [v9 deviceType], objc_msgSend(v9, "logicalAddress"), &v30);
          [v9 setSendFromAddress:v10];
          [v9 setLogicalAddress:v10];
          objc_msgSend(v9, "setPhysicalAddress:", -[CoreCECBus physicalAddress](self, "physicalAddress"));
          if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
          {
            uint64_t v19 = v30;
            uint64_t v20 = v9;
            uint64_t v18 = self;
            LogPrintF();
          }
        }
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v6);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  CECFrame v11 = [(CoreRCBus *)self devices];
  uint64_t v12 = [(NSSet *)v11 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        if ([v16 isLocalDevice])
        {
          if ([v16 logicalAddress] != 15)
          {
            [v16 broadcastPresence];
            v21[0] = MEMORY[0x263EF8330];
            v21[1] = 3221225472;
            v21[2] = __48__CoreCECBusProvider_reallocateAllCECAddresses___block_invoke;
            v21[3] = &unk_2652E3F20;
            v21[4] = v16;
            [v16 dispatchAsyncLowPriority:v21];
          }
        }
      }
      uint64_t v13 = [(NSSet *)v11 countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v13);
  }
}

uint64_t __48__CoreCECBusProvider_reallocateAllCECAddresses___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) readyToSend];
}

- (BOOL)receivedMessage:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = -[CoreCECBusProvider addDeviceWithLogicalAddress:message:reason:](self, "addDeviceWithLogicalAddress:message:reason:", [a3 initiator], a3, 0);
  if (v5)
  {
    uint64_t v6 = v5;
    if ([a3 isBroadcast])
    {
      uint64_t v7 = 0;
    }
    else
    {
      id v5 = -[CoreCECBusProvider addDeviceWithLogicalAddress:message:reason:](self, "addDeviceWithLogicalAddress:message:reason:", [a3 destination], a3, 1);
      uint64_t v7 = v5;
      if (!v5) {
        return (char)v5;
      }
    }
    if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
    {
      uint64_t v19 = v6;
      uint64_t v20 = v7;
      long long v17 = self;
      LogPrintF();
    }
    if (v7 && ![v7 isLocalDevice])
    {
      [v6 trackMessage:a3 toDevice:v7];
      [v7 trackMessage:a3 fromDevice:v6];
      LOBYTE(v5) = 0;
    }
    else
    {
      uint64_t v8 = objc_msgSend(v6, "filterMessage:toDevice:", a3, v7, v17, v19, v20);
      if (gLogCategory_CoreRCBus <= 10 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
      {
        uint64_t v18 = v8;
        LogPrintF();
      }
      if (v8)
      {
        if (v7)
        {
          [v7 handleMessage:v8 fromDevice:v6 broadcast:0];
        }
        else
        {
          int v9 = [v8 initiator];
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          uint64_t v10 = [(CoreRCBus *)self devices];
          uint64_t v11 = [(NSSet *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v22;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v22 != v13) {
                  objc_enumerationMutation(v10);
                }
                long long v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
                if (objc_msgSend(v15, "isLocalDevice", v18)
                  && [v15 logicalAddress] != v9)
                {
                  [v15 handleMessage:v8 fromDevice:v6 broadcast:1];
                }
              }
              uint64_t v12 = [(NSSet *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
            }
            while (v12);
          }
        }
      }
      LOBYTE(v5) = 1;
    }
  }
  return (char)v5;
}

- (void)interfacePropertiesChanged:(id)a3
{
  uint64_t v14 = 252645135;
  unsigned __int8 v13 = 0;
  if (self->_interface == a3
    && objc_msgSend((id)objc_msgSend(a3, "properties"), "getLinkState:physicalAddress:", &v13, &v14))
  {
    uint64_t v4 = v14;
    unint64_t v5 = [(CoreCECBus *)self physicalAddress];
    uint64_t v6 = v14;
    if (v14 != 252645135
      && v6 != objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "cecUserDefaults"), "lastKnownPhysicalAddress"))
    {
      if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize()))
      {
        uint64_t v12 = CoreCECPhysicalAddressString(v14);
        LogPrintF();
      }
      uint64_t v7 = objc_msgSend(MEMORY[0x263EFFA40], "cecUserDefaults", v12);
      [v7 setLastKnownPhysicalAddress:v14];
    }
    [(CoreCECBusProvider *)self setLinkState:v13 physicalAddress:v14];
    uint64_t v8 = [(CoreCECBus *)self activeSource];
    if (v4 != v5)
    {
      int v9 = v8;
      uint64_t v10 = v14;
      if (v10 == [(CoreCECDevice *)v8 physicalAddress])
      {
        uint64_t v11 = v14;
        if (v11 != [(CoreCECBus *)self streamPath])
        {
          if (gLogCategory_CoreRCBus <= 40 && (gLogCategory_CoreRCBus != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          [(CoreCECBusProvider *)self _changeActiveSourceFrom:v9 to:0];
        }
      }
    }
  }
}

- (BOOL)deferLossOfLink
{
  return self->_deferLossOfLink;
}

- (CECInterface)interface
{
  return self->_interface;
}

- (CECBusPollingOperation)pollingOperation
{
  return self->_pollingOperation;
}

- (void)setPollingOperation:(id)a3
{
}

@end