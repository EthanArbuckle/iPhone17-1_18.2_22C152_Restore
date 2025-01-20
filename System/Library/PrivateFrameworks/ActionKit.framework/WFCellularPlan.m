@interface WFCellularPlan
- (BOOL)dataRoamingEnabled;
- (BOOL)isActive;
- (BOOL)isDataOnlyLine;
- (BOOL)isDefaultDataLine;
- (BOOL)isDefaultVoiceLine;
- (BOOL)smartDataModeEnabled;
- (CTCellularPlanItem)planItem;
- (CTXPCServiceSubscriptionContext)ctContext;
- (CoreTelephonyClient)client;
- (NSArray)availableRATModes;
- (NSString)carrierName;
- (NSString)currentRATModeLabel;
- (NSString)iccid;
- (NSString)label;
- (NSString)phoneNumber;
- (NSUUID)subscriptionContextUUID;
- (WFCellularPlan)initWithCTXPCServiceSubscriptionContext:(id)a3 client:(id)a4 planItem:(id)a5;
- (id)labelForRATMode:(int64_t)a3;
- (id)serviceDescriptor;
- (int64_t)currentRATMode;
- (void)setCurrentRATMode:(int64_t)a3;
- (void)setDataRoamingEnabled:(BOOL)a3;
- (void)setSmartDataModeEnabled:(BOOL)a3;
@end

@implementation WFCellularPlan

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_planItem);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_ctContext, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_storeStrong((id *)&self->_subscriptionContextUUID, 0);
}

- (CTCellularPlanItem)planItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planItem);
  return (CTCellularPlanItem *)WeakRetained;
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (CTXPCServiceSubscriptionContext)ctContext
{
  return self->_ctContext;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)iccid
{
  return self->_iccid;
}

- (NSUUID)subscriptionContextUUID
{
  return self->_subscriptionContextUUID;
}

- (id)serviceDescriptor
{
  id CTServiceDescriptorClass_20807 = getCTServiceDescriptorClass_20807();
  ctContext = self->_ctContext;
  return (id)[CTServiceDescriptorClass_20807 descriptorWithSubscriptionContext:ctContext];
}

- (id)labelForRATMode:(int64_t)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__WFCellularPlan_labelForRATMode___block_invoke;
  block[3] = &unk_264E5EE70;
  block[4] = self;
  if (labelForRATMode__onceToken != -1) {
    dispatch_once(&labelForRATMode__onceToken, block);
  }
  switch(a3)
  {
    case 1:
      v4 = @"2G";
      goto LABEL_13;
    case 2:
      if (labelForRATMode__use4GOver3G == 1) {
        goto LABEL_12;
      }
      v4 = @"3G";
      goto LABEL_13;
    case 3:
      if (labelForRATMode__useLTEOver4G == 1) {
        v4 = @"LTE";
      }
      else {
LABEL_12:
      }
        v4 = @"4G";
      goto LABEL_13;
    case 4:
      v4 = @"5G Auto";
      goto LABEL_13;
    case 5:
      v4 = @"5G";
LABEL_13:
      v5 = WFLocalizedString(v4);
      break;
    default:
      v5 = WFLocalizedStringWithKey(@"Unknown (Cellular data mode)", @"Unknown");
      break;
  }
  return v5;
}

void __34__WFCellularPlan_labelForRATMode___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) client];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);
  id v17 = 0;
  v4 = [v2 context:v3 getCarrierBundleValue:&unk_26F076800 error:&v17];
  id v5 = v17;

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v4;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  if (v5)
  {
    v8 = getWFActionsLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFCellularPlan labelForRATMode:]_block_invoke";
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_ERROR, "%s Failed to get DataIndicatorOverride value: %@", buf, 0x16u);
    }
  }
  labelForRATMode__use4GOver3G = [v7 isEqualToString:@"4G"];
  v9 = [*(id *)(a1 + 32) client];
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 40);
  id v16 = 0;
  v11 = [v9 context:v10 getCarrierBundleValue:&unk_26F076818 error:&v16];
  id v12 = v16;

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v11;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = v13;

  if (v12)
  {
    v15 = getWFActionsLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFCellularPlan labelForRATMode:]_block_invoke";
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_impl(&dword_23C364000, v15, OS_LOG_TYPE_ERROR, "%s Failed to get DataIndicatorOverrideForLTE value: %@", buf, 0x16u);
    }
  }
  labelForRATMode__useLTEOver4G = [v14 isEqualToString:@"LTE"];
}

- (NSString)currentRATModeLabel
{
  int64_t v3 = [(WFCellularPlan *)self currentRATMode];
  return (NSString *)[(WFCellularPlan *)self labelForRATMode:v3];
}

- (void)setDataRoamingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = [(WFCellularPlan *)self client];
  v6 = [(WFCellularPlan *)self serviceDescriptor];
  id v7 = [v5 setInternationalDataAccessSync:v6 status:v3];

  if (v7)
  {
    v8 = getWFActionsLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[WFCellularPlan setDataRoamingEnabled:]";
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_ERROR, "%s Failed to set Data Roaming setting: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (BOOL)dataRoamingEnabled
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(WFCellularPlan *)self client];
  v4 = [(WFCellularPlan *)self serviceDescriptor];
  id v9 = 0;
  char v5 = [v3 getInternationalDataAccessSync:v4 error:&v9];
  id v6 = v9;

  if (v6)
  {
    id v7 = getWFActionsLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v11 = "-[WFCellularPlan dataRoamingEnabled]";
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_ERROR, "%s Failed to get data roaming status: %@", buf, 0x16u);
    }
  }
  return v5;
}

- (BOOL)isDataOnlyLine
{
  v2 = [(WFCellularPlan *)self ctContext];
  char v3 = [v2 isSimDataOnly];

  return v3;
}

- (BOOL)isDefaultDataLine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planItem);
  char v3 = [WeakRetained isActiveDataPlan];

  return v3;
}

- (BOOL)isDefaultVoiceLine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planItem);
  char v3 = [WeakRetained isDefaultVoice];

  return v3;
}

- (BOOL)isActive
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planItem);
  char v3 = [WeakRetained isSelected];

  return v3;
}

- (NSString)carrierName
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planItem);
  char v3 = [WeakRetained carrierName];

  return (NSString *)v3;
}

- (void)setSmartDataModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v5 = getWFActionsLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[WFCellularPlan setSmartDataModeEnabled:]";
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl(&dword_23C364000, v5, OS_LOG_TYPE_DEBUG, "%s Setting smart data mode to enabled: %d", (uint8_t *)&v9, 0x12u);
  }

  id v6 = [getCTServiceDescriptorClass_20807() descriptorWithSubscriptionContext:self->_ctContext];
  id v7 = [(WFCellularPlan *)self client];
  id v8 = (id)[v7 setSmartDataMode:v6 enable:v3];
}

- (BOOL)smartDataModeEnabled
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = [(WFCellularPlan *)self client];
  int v4 = [v3 isSmartDataModeSupported:0];

  if (!v4) {
    return 0;
  }
  char v5 = [getCTServiceDescriptorClass_20807() descriptorWithSubscriptionContext:self->_ctContext];
  id v6 = [(WFCellularPlan *)self client];
  id v11 = 0;
  char v7 = [v6 smartDataMode:v5 error:&v11];
  id v8 = v11;

  if (v8)
  {
    int v9 = getWFActionsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[WFCellularPlan smartDataModeEnabled]";
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_ERROR, "%s Failed to get smartDataMode status with error %@", buf, 0x16u);
    }
  }
  return v7;
}

- (void)setCurrentRATMode:(int64_t)a3
{
  char v5 = +[WFCellularPlansManager dataRateToRadioAccessTechnologyModeMapping];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__WFCellularPlan_setCurrentRATMode___block_invoke;
  v6[3] = &unk_264E58E60;
  v6[4] = self;
  v6[5] = a3;
  [v5 enumerateKeysAndObjectsUsingBlock:v6];
}

void __36__WFCellularPlan_setCurrentRATMode___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = NSNumber;
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = a3;
  id v11 = [v8 numberWithInteger:v9];
  LODWORD(v9) = [v10 containsObject:v11];

  if (v9)
  {
    BOOL v12 = [*(id *)(a1 + 32) client];
    uint64_t v13 = objc_msgSend(v12, "setMaxDataRate:rate:", *(void *)(*(void *)(a1 + 32) + 40), objc_msgSend(v7, "integerValue"));

    if (v13)
    {
      __int16 v14 = getWFActionsLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136315394;
        uint64_t v16 = "-[WFCellularPlan setCurrentRATMode:]_block_invoke";
        __int16 v17 = 2112;
        v18 = v13;
        _os_log_impl(&dword_23C364000, v14, OS_LOG_TYPE_ERROR, "%s Failed to set RAT with error %@", (uint8_t *)&v15, 0x16u);
      }
    }
    else
    {
      [*(id *)(a1 + 32) setSmartDataModeEnabled:*(void *)(a1 + 40) == 4];
    }
    *a4 = 1;
  }
}

- (int64_t)currentRATMode
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v3 = [(WFCellularPlan *)self client];
  ctContext = self->_ctContext;
  id v13 = 0;
  uint64_t v5 = [v3 getMaxDataRate:ctContext error:&v13];
  id v6 = v13;

  if (v6)
  {
    id v7 = getWFActionsLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v15 = "-[WFCellularPlan currentRATMode]";
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_ERROR, "%s Failed to getMaxDataRate with error %@", buf, 0x16u);
    }
    int64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = +[WFCellularPlansManager dataRateToRadioAccessTechnologyModeMapping];
    id v10 = [NSNumber numberWithInteger:v5];
    id v7 = [v9 objectForKey:v10];

    if ((unint64_t)[v7 count] < 2)
    {
      id v11 = [v7 firstObject];
      int64_t v8 = [v11 integerValue];
    }
    else if ([(WFCellularPlan *)self smartDataModeEnabled])
    {
      int64_t v8 = 4;
    }
    else
    {
      int64_t v8 = 5;
    }
  }

  return v8;
}

- (NSArray)availableRATModes
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v3 = [(WFCellularPlan *)self client];
  ctContext = self->_ctContext;
  id v10 = 0;
  uint64_t v5 = [v3 getSupportedDataRates:ctContext error:&v10];
  id v6 = v10;

  if (v6)
  {
    id v7 = getWFActionsLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v12 = "-[WFCellularPlan availableRATModes]";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_ERROR, "%s Failed to enumerate supported data rates with error %@", buf, 0x16u);
    }
    int64_t v8 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    id v7 = [v5 rates];
    int64_t v8 = [v7 if_flatMap:&__block_literal_global_20934];
  }

  return (NSArray *)v8;
}

id __35__WFCellularPlan_availableRATModes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];
  return +[WFCellularPlansManager modesFromDataRate:v2];
}

- (WFCellularPlan)initWithCTXPCServiceSubscriptionContext:(id)a3 client:(id)a4 planItem:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)WFCellularPlan;
  BOOL v12 = [(WFCellularPlan *)&v27 init];
  __int16 v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_ctContext, a3);
    objc_storeStrong((id *)&v13->_client, a4);
    objc_storeWeak((id *)&v13->_planItem, v11);
    uint64_t v14 = [v9 uuid];
    subscriptionContextUUID = v13->_subscriptionContextUUID;
    v13->_subscriptionContextUUID = (NSUUID *)v14;

    uint64_t v16 = [v9 phoneNumber];
    phoneNumber = v13->_phoneNumber;
    v13->_phoneNumber = (NSString *)v16;

    id WeakRetained = objc_loadWeakRetained((id *)&v13->_planItem);
    uint64_t v19 = [WeakRetained userLabel];
    uint64_t v20 = [v19 label];
    label = v13->_label;
    v13->_label = (NSString *)v20;

    id v22 = objc_loadWeakRetained((id *)&v13->_planItem);
    uint64_t v23 = [v22 iccid];
    iccid = v13->_iccid;
    v13->_iccid = (NSString *)v23;

    v25 = v13;
  }

  return v13;
}

@end