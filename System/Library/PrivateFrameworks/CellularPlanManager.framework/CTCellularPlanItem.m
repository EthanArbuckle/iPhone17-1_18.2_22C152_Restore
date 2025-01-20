@interface CTCellularPlanItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isActiveDataPlan;
- (BOOL)isBackedByCellularPlan;
- (BOOL)isCheckingCellularConnectivity;
- (BOOL)isDefaultVoice;
- (BOOL)isInstalling;
- (BOOL)isLocalTransferToeSIMSupported;
- (BOOL)isSelectable;
- (BOOL)isSelected;
- (BOOL)isSimStateValid;
- (BOOL)isTransferred;
- (BOOL)shouldAppearDisabled;
- (BOOL)shouldAutoSelectWhenInRange;
- (BOOL)shouldDisplay;
- (BOOL)shouldDisplayExtendedConsentInfo;
- (BOOL)shouldDisplayType;
- (CTCellularPlan)plan;
- (CTCellularPlanItem)initWithCellularPlan:(id)a3 uuid:(id)a4 iccid:(id)a5 name:(id)a6 type:(int64_t)a7 phoneNumber:(id)a8 label:(id)a9 isLocalTransferToeSIMSupported:(BOOL)a10 isTransferred:(BOOL)a11 transferredStatus:(int64_t)a12 transferredToDeviceDisplayName:(id)a13 supportedTransferOption:(unint64_t)a14 settingsMode:(int64_t)a15;
- (CTCellularPlanItem)initWithCellularPlan:(id)a3 uuid:(id)a4 type:(int64_t)a5 phoneNumber:(id)a6 label:(id)a7 transferredStatus:(int64_t)a8 transferredToDeviceDisplayName:(id)a9 supportedTransferOption:(unint64_t)a10 settingsMode:(int64_t)a11;
- (CTCellularPlanItem)initWithCoder:(id)a3;
- (CTCellularPlanItem)initWithIccid:(id)a3 uuid:(id)a4 name:(id)a5 phoneNumber:(id)a6 label:(id)a7 isLocalTransferToeSIMSupported:(BOOL)a8 isTransferred:(BOOL)a9 transferredStatus:(int64_t)a10 transferredToDeviceDisplayName:(id)a11 supportedTransferOption:(unint64_t)a12 settingsMode:(int64_t)a13;
- (CTPlan)ctPlan;
- (CTUserLabel)userLabel;
- (NSNumber)isSelectedOverride;
- (NSString)carrierName;
- (NSString)companionSimLabelId;
- (NSString)iccid;
- (NSString)identifier;
- (NSString)label;
- (NSString)name;
- (NSString)phoneNumber;
- (NSString)transferredToDeviceDisplayName;
- (NSString)uuid;
- (NSUUID)companionSlotUuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customDescription;
- (id)description;
- (id)redactedDescription;
- (id)settingsModeAsString:(int64_t)a3;
- (id)transferredStatusAsString:(int64_t)a3;
- (id)typeAsString:(int64_t)a3;
- (int)status;
- (int64_t)compare:(id)a3;
- (int64_t)lockState;
- (int64_t)settingsMode;
- (int64_t)transferredStatus;
- (int64_t)type;
- (unint64_t)supportedTransferOption;
- (void)encodeWithCoder:(id)a3;
- (void)setCompanionSimLabelId:(id)a3;
- (void)setCompanionSlotUuid:(id)a3;
- (void)setIsActiveDataPlan:(BOOL)a3;
- (void)setIsDefaultVoice:(BOOL)a3;
- (void)setIsLocalTransferToeSIMSupported:(BOOL)a3;
- (void)setIsSelectable:(BOOL)a3;
- (void)setIsSelectedOverride:(id)a3;
- (void)setIsSimStateValid:(BOOL)a3;
- (void)setIsTransferred:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLockState:(int64_t)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setSettingsMode:(int64_t)a3;
- (void)setShouldAppearDisabled:(BOOL)a3;
- (void)setShouldAutoSelectWhenInRange:(BOOL)a3;
- (void)setShouldDisplay:(BOOL)a3;
- (void)setShouldDisplayExtendedConsentInfo:(BOOL)a3;
- (void)setShouldDisplayType:(BOOL)a3;
- (void)setStatus:(int)a3;
- (void)setSupportedTransferOption:(unint64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setUserLabel:(id)a3;
@end

@implementation CTCellularPlanItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCellularPlanItem)initWithCellularPlan:(id)a3 uuid:(id)a4 iccid:(id)a5 name:(id)a6 type:(int64_t)a7 phoneNumber:(id)a8 label:(id)a9 isLocalTransferToeSIMSupported:(BOOL)a10 isTransferred:(BOOL)a11 transferredStatus:(int64_t)a12 transferredToDeviceDisplayName:(id)a13 supportedTransferOption:(unint64_t)a14 settingsMode:(int64_t)a15
{
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a6;
  id v25 = a8;
  id v26 = a9;
  id v49 = a13;
  v50.receiver = self;
  v50.super_class = (Class)CTCellularPlanItem;
  v27 = [(CTCellularPlanItem *)&v50 init];
  if (v27)
  {
    uint64_t v28 = [v22 copy];
    uuid = v27->_uuid;
    v27->_uuid = (NSString *)v28;

    objc_storeStrong((id *)&v27->_plan, a3);
    uint64_t v30 = [v23 copy];
    iccid = v27->_iccid;
    v27->_iccid = (NSString *)v30;

    id v47 = v24;
    uint64_t v32 = [v24 copy];
    name = v27->_name;
    v27->_name = (NSString *)v32;

    v27->_type = a7;
    v27->_lockState = 0;
    v27->_isDefaultVoice = 0;
    *(void *)&v27->_shouldDisplayType = 0x10101000000;
    v27->_isLocalTransferToeSIMSupported = a10;
    v27->_isTransferred = a11;
    v27->_transferredStatus = a12;
    uint64_t v34 = [v25 copy];
    phoneNumber = v27->_phoneNumber;
    v27->_phoneNumber = (NSString *)v34;

    objc_storeStrong((id *)&v27->_userLabel, a9);
    objc_storeStrong((id *)&v27->_transferredToDeviceDisplayName, a13);
    v27->_supportedTransferOption = a14;
    v27->_settingsMode = a15;
    userLabel = v27->_userLabel;
    if (userLabel)
    {
      uint64_t v37 = [(CTUserLabel *)userLabel label];
      label = v27->_label;
      v27->_label = (NSString *)v37;
    }
    plan = v27->_plan;
    id v40 = objc_alloc(MEMORY[0x1E4F23928]);
    v41 = v40;
    if (plan)
    {
      v42 = [v21 iccid];
      uint64_t v43 = [v41 initWithIccid:v42];
      ctPlan = v27->_ctPlan;
      v27->_ctPlan = (CTPlan *)v43;
    }
    else
    {
      uint64_t v45 = [v40 initWithIccid:v27->_iccid];
      v42 = v27->_ctPlan;
      v27->_ctPlan = (CTPlan *)v45;
    }

    id v24 = v47;
  }

  return v27;
}

- (CTCellularPlanItem)initWithCellularPlan:(id)a3 uuid:(id)a4 type:(int64_t)a5 phoneNumber:(id)a6 label:(id)a7 transferredStatus:(int64_t)a8 transferredToDeviceDisplayName:(id)a9 supportedTransferOption:(unint64_t)a10 settingsMode:(int64_t)a11
{
  id v17 = a9;
  id v18 = a7;
  id v19 = a6;
  id v20 = a4;
  id v21 = a3;
  id v22 = [v21 iccid];
  LOWORD(v25) = 0;
  id v23 = -[CTCellularPlanItem initWithCellularPlan:uuid:iccid:name:type:phoneNumber:label:isLocalTransferToeSIMSupported:isTransferred:transferredStatus:transferredToDeviceDisplayName:supportedTransferOption:settingsMode:](self, "initWithCellularPlan:uuid:iccid:name:type:phoneNumber:label:isLocalTransferToeSIMSupported:isTransferred:transferredStatus:transferredToDeviceDisplayName:supportedTransferOption:settingsMode:", v21, v20, v22, 0, a5, v19, v18, v25, a8, v17, a10, a11);

  return v23;
}

- (CTCellularPlanItem)initWithIccid:(id)a3 uuid:(id)a4 name:(id)a5 phoneNumber:(id)a6 label:(id)a7 isLocalTransferToeSIMSupported:(BOOL)a8 isTransferred:(BOOL)a9 transferredStatus:(int64_t)a10 transferredToDeviceDisplayName:(id)a11 supportedTransferOption:(unint64_t)a12 settingsMode:(int64_t)a13
{
  BYTE1(v14) = a9;
  LOBYTE(v14) = a8;
  return -[CTCellularPlanItem initWithCellularPlan:uuid:iccid:name:type:phoneNumber:label:isLocalTransferToeSIMSupported:isTransferred:transferredStatus:transferredToDeviceDisplayName:supportedTransferOption:settingsMode:](self, "initWithCellularPlan:uuid:iccid:name:type:phoneNumber:label:isLocalTransferToeSIMSupported:isTransferred:transferredStatus:transferredToDeviceDisplayName:supportedTransferOption:settingsMode:", 0, a4, a3, a5, 0, a6, a7, v14, a10, a11, a12, a13);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  LOWORD(v7) = *(_WORD *)&self->_isLocalTransferToeSIMSupported;
  v5 = objc_msgSend(v4, "initWithCellularPlan:uuid:iccid:name:type:phoneNumber:label:isLocalTransferToeSIMSupported:isTransferred:transferredStatus:transferredToDeviceDisplayName:supportedTransferOption:settingsMode:", self->_plan, self->_uuid, self->_iccid, self->_name, self->_type, self->_phoneNumber, self->_userLabel, v7, self->_transferredStatus, self->_transferredToDeviceDisplayName, self->_supportedTransferOption, self->_settingsMode);
  [v5 setStatus:self->_status];
  return v5;
}

- (CTCellularPlanItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CTCellularPlanItem;
  v5 = [(CTCellularPlanItem *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"plan"];
    plan = v5->_plan;
    v5->_plan = (CTCellularPlan *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ct_plan"];
    ctPlan = v5->_ctPlan;
    v5->_ctPlan = (CTPlan *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iccid"];
    iccid = v5->_iccid;
    v5->_iccid = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isSelectedOverride"];
    isSelectedOverride = v5->_isSelectedOverride;
    v5->_isSelectedOverride = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v16;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_lockState = [v4 decodeIntegerForKey:@"lockState"];
    v5->_shouldDisplayType = [v4 decodeBoolForKey:@"displayType"];
    v5->_isSelectable = [v4 decodeBoolForKey:@"isSelectable"];
    v5->_shouldDisplay = [v4 decodeBoolForKey:@"shouldDisplay"];
    v5->_isSimStateValid = 1;
    v5->_shouldAppearDisabled = [v4 decodeBoolForKey:@"shouldAppearDisabled"];
    v5->_isActiveDataPlan = [v4 decodeBoolForKey:@"isActiveDataPlan"];
    v5->_isDefaultVoice = [v4 decodeBoolForKey:@"isDefaultVoice"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companionSlotUuid"];
    companionSlotUuid = v5->_companionSlotUuid;
    v5->_companionSlotUuid = (NSUUID *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companionSimLabelId"];
    companionSimLabelId = v5->_companionSimLabelId;
    v5->_companionSimLabelId = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    userLabel = v5->_userLabel;
    v5->_userLabel = (CTUserLabel *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deprecateLabel"];
    label = v5->_label;
    v5->_label = (NSString *)v26;

    v5->_shouldDisplayExtendedConsentInfo = [v4 decodeBoolForKey:@"shouldDisplayExtendedConsentInfo"];
    v5->_isLocalTransferToeSIMSupported = [v4 decodeBoolForKey:@"isLocalTransferToeSIMSupported"];
    v5->_isTransferred = [v4 decodeBoolForKey:@"isTransferred"];
    v5->_status = [v4 decodeIntegerForKey:@"isCheckingCellularConnectivity"];
    v5->_transferredStatus = [v4 decodeIntegerForKey:@"transferredStatus"];
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferredToDeviceDisplayName"];
    transferredToDeviceDisplayName = v5->_transferredToDeviceDisplayName;
    v5->_transferredToDeviceDisplayName = (NSString *)v28;

    v5->_supportedTransferOption = [v4 decodeIntegerForKey:@"supportedTransferOption"];
    v5->_settingsMode = [v4 decodeIntegerForKey:@"settingsMode"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  plan = self->_plan;
  id v5 = a3;
  [v5 encodeObject:plan forKey:@"plan"];
  [v5 encodeObject:self->_ctPlan forKey:@"ct_plan"];
  [v5 encodeObject:self->_isSelectedOverride forKey:@"isSelectedOverride"];
  [v5 encodeObject:self->_uuid forKey:@"uuid"];
  [v5 encodeObject:self->_iccid forKey:@"iccid"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeInteger:self->_lockState forKey:@"lockState"];
  [v5 encodeBool:self->_shouldDisplayType forKey:@"displayType"];
  [v5 encodeBool:self->_isSelectable forKey:@"isSelectable"];
  [v5 encodeBool:self->_shouldDisplay forKey:@"shouldDisplay"];
  [v5 encodeBool:self->_shouldAppearDisabled forKey:@"shouldAppearDisabled"];
  [v5 encodeBool:self->_isActiveDataPlan forKey:@"isActiveDataPlan"];
  [v5 encodeBool:self->_isDefaultVoice forKey:@"isDefaultVoice"];
  [v5 encodeObject:self->_companionSlotUuid forKey:@"companionSlotUuid"];
  [v5 encodeObject:self->_companionSimLabelId forKey:@"companionSimLabelId"];
  [v5 encodeObject:self->_phoneNumber forKey:@"phoneNumber"];
  [v5 encodeObject:self->_userLabel forKey:@"label"];
  [v5 encodeObject:self->_label forKey:@"deprecateLabel"];
  [v5 encodeBool:self->_shouldDisplayExtendedConsentInfo forKey:@"shouldDisplayExtendedConsentInfo"];
  [v5 encodeBool:self->_isLocalTransferToeSIMSupported forKey:@"isLocalTransferToeSIMSupported"];
  [v5 encodeBool:self->_isTransferred forKey:@"isTransferred"];
  [v5 encodeInteger:self->_status forKey:@"isCheckingCellularConnectivity"];
  [v5 encodeInteger:self->_transferredStatus forKey:@"transferredStatus"];
  [v5 encodeObject:self->_transferredToDeviceDisplayName forKey:@"transferredToDeviceDisplayName"];
  [v5 encodeInteger:self->_supportedTransferOption forKey:@"supportedTransferOption"];
  [v5 encodeInteger:self->_settingsMode forKey:@"settingsMode"];
}

- (int64_t)compare:(id)a3
{
  uuid = self->_uuid;
  id v4 = [a3 uuid];
  int64_t v5 = [(NSString *)uuid compare:v4 options:64];

  return v5;
}

- (BOOL)isBackedByCellularPlan
{
  return self->_plan != 0;
}

- (BOOL)isCheckingCellularConnectivity
{
  return self->_status == 14 && self->_transferredStatus != 0;
}

- (BOOL)isSelectable
{
  return self->_isSelectable;
}

- (BOOL)isSelected
{
  v3 = [(CTCellularPlanItem *)self isSelectedOverride];

  if (!v3) {
    return 0;
  }
  id v4 = [(CTCellularPlanItem *)self isSelectedOverride];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)isInstalling
{
  v3 = [(CTCellularPlanItem *)self plan];
  if ([v3 status] == 6)
  {
    BOOL v4 = 1;
  }
  else
  {
    char v5 = [(CTCellularPlanItem *)self plan];
    if ([v5 status] == 7)
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v6 = [(CTCellularPlanItem *)self plan];
      BOOL v4 = [v6 status] == 2;
    }
  }

  return v4;
}

- (NSString)label
{
  userLabel = self->_userLabel;
  if (userLabel)
  {
    BOOL v4 = [(CTUserLabel *)userLabel label];
  }
  else
  {
    BOOL v4 = self->_label;
  }
  return v4;
}

- (NSString)iccid
{
  if ([(CTCellularPlanItem *)self isBackedByCellularPlan])
  {
    v3 = [(CTCellularPlan *)self->_plan iccid];
  }
  else
  {
    v3 = self->_iccid;
  }
  return v3;
}

- (NSString)identifier
{
  if ([(CTCellularPlanItem *)self isBackedByCellularPlan])
  {
    v3 = [(CTCellularPlan *)self->_plan iccid];
  }
  else
  {
    iccid = self->_iccid;
    if (iccid) {
      v3 = iccid;
    }
    else {
      v3 = @"Home";
    }
  }
  return (NSString *)v3;
}

- (NSString)name
{
  if ([(CTCellularPlanItem *)self isBackedByCellularPlan])
  {
    v3 = [(CTCellularPlan *)self->_plan planDescription];

    plan = self->_plan;
    if (v3) {
      [(CTCellularPlan *)plan planDescription];
    }
    else {
    char v5 = [(CTCellularPlan *)plan carrierName];
    }
  }
  else
  {
    char v5 = self->_name;
  }
  return v5;
}

- (NSString)carrierName
{
  name = self->_name;
  if (name)
  {
    v3 = name;
  }
  else
  {
    v3 = [(CTCellularPlan *)self->_plan carrierName];
  }
  return v3;
}

- (NSUUID)companionSlotUuid
{
  return self->_companionSlotUuid;
}

- (NSString)companionSimLabelId
{
  return self->_companionSimLabelId;
}

- (id)typeAsString:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E6C1EB18[a3];
  }
}

- (id)transferredStatusAsString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return @"unknown";
  }
  else {
    return off_1E6C1EB30[a3 - 1];
  }
}

- (id)settingsModeAsString:(int64_t)a3
{
  v3 = @"Manual";
  if (a3 == 1) {
    v3 = @"Automatic";
  }
  if (a3 == 2) {
    return @"Standard";
  }
  else {
    return v3;
  }
}

- (id)description
{
  uuid = self->_uuid;
  uint64_t v28 = NSString;
  iccid = self->_iccid;
  v29 = iccid;
  if (!iccid)
  {
    iccid = [(CTCellularPlan *)self->_plan iccid];
  }
  ctPlan = self->_ctPlan;
  name = self->_name;
  uint64_t v4 = [(CTCellularPlanItem *)self typeAsString:self->_type];
  BOOL isSimStateValid = self->_isSimStateValid;
  uint64_t v24 = (void *)v4;
  BOOL isSelectable = self->_isSelectable;
  isSelectedOverride = self->_isSelectedOverride;
  BOOL isActiveDataPlan = self->_isActiveDataPlan;
  BOOL isDefaultVoice = self->_isDefaultVoice;
  long long v18 = *(_OWORD *)&self->_companionSlotUuid;
  userLabel = self->_userLabel;
  phoneNumber = self->_phoneNumber;
  char v5 = [(CTCellularPlanItem *)self carrierName];
  plan = self->_plan;
  uint64_t v7 = "NO";
  if (self->_isLocalTransferToeSIMSupported) {
    uint64_t v8 = "YES";
  }
  else {
    uint64_t v8 = "NO";
  }
  if (self->_isTransferred) {
    v9 = "YES";
  }
  else {
    v9 = "NO";
  }
  if ([(CTCellularPlanItem *)self isCheckingCellularConnectivity]) {
    uint64_t v7 = "YES";
  }
  uint64_t v10 = [(CTCellularPlanItem *)self transferredStatusAsString:self->_transferredStatus];
  transferredToDeviceDisplayName = self->_transferredToDeviceDisplayName;
  unint64_t supportedTransferOption = self->_supportedTransferOption;
  v13 = [(CTCellularPlanItem *)self settingsModeAsString:self->_settingsMode];
  objc_msgSend(v28, "stringWithFormat:", @"<item: uuid:%@ iccid:%@ name:%@, CTPlan: %@, type:%@, validstate:%d, selected:%@, selectable:%d, activeData:%d, defaultVoice:%d, slotUuid:%@, labelId:%@, number:%@, label:%@ carrier:%@, plan:%@, isLocalTransferToeSIMSupported:%s, isTransferred:%s, isCheckingCellularConnectivity:%s, transferredStatus:%@, transferredToDeviceDisplayName:%@, supportedTransferOption:%lu, settingsMode:%@>", uuid, iccid, name, ctPlan, v24, isSimStateValid, isSelectedOverride, isSelectable, isActiveDataPlan, isDefaultVoice, v18, phoneNumber, userLabel, v5, plan, v8,
    v9,
    v7,
    v10,
    transferredToDeviceDisplayName,
    supportedTransferOption,
  uint64_t v14 = v13);

  if (!v29) {
  return v14;
  }
}

- (id)redactedDescription
{
  uint64_t v20 = NSString;
  v3 = [(CTCellularPlanItem *)self typeAsString:self->_type];
  BOOL isSimStateValid = self->_isSimStateValid;
  BOOL isSelectable = self->_isSelectable;
  isSelectedOverride = self->_isSelectedOverride;
  BOOL isActiveDataPlan = self->_isActiveDataPlan;
  BOOL isDefaultVoice = self->_isDefaultVoice;
  uint64_t v4 = [(CTCellularPlanItem *)self carrierName];
  char v5 = [(CTCellularPlan *)self->_plan redactedDescription];
  uint64_t v6 = "NO";
  if (self->_isLocalTransferToeSIMSupported) {
    uint64_t v7 = "YES";
  }
  else {
    uint64_t v7 = "NO";
  }
  if (self->_isTransferred) {
    uint64_t v8 = "YES";
  }
  else {
    uint64_t v8 = "NO";
  }
  if ([(CTCellularPlanItem *)self isCheckingCellularConnectivity]) {
    uint64_t v6 = "YES";
  }
  v9 = [(CTCellularPlanItem *)self transferredStatusAsString:self->_transferredStatus];
  transferredToDeviceDisplayName = self->_transferredToDeviceDisplayName;
  unint64_t supportedTransferOption = self->_supportedTransferOption;
  uint64_t v12 = [(CTCellularPlanItem *)self settingsModeAsString:self->_settingsMode];
  v13 = [v20 stringWithFormat:@"<item: type:%@, validstate:%d, selected:%@, selectable:%d, activeData:%d, defaultVoice:%d, carrier:%@, plan:%@, isLocalTransferToeSIMSupported:%s, isTransferred:%s, isCheckingConnectivity:%s transferredStatus:%@ target:%@, supportedTransferOption:%lu, settingsMode:%@>", v3, isSimStateValid, isSelectedOverride, isSelectable, isActiveDataPlan, isDefaultVoice, v4, v5, v7, v8, v6, v9, transferredToDeviceDisplayName, supportedTransferOption, v12];

  return v13;
}

- (id)customDescription
{
  uuid = self->_uuid;
  uint64_t v25 = NSString;
  iccid = self->_iccid;
  uint64_t v26 = iccid;
  if (!iccid)
  {
    iccid = [(CTCellularPlan *)self->_plan iccid];
  }
  name = self->_name;
  uint64_t v4 = [(CTCellularPlanItem *)self typeAsString:self->_type];
  BOOL isSimStateValid = self->_isSimStateValid;
  uint64_t v22 = (void *)v4;
  BOOL isSelectable = self->_isSelectable;
  isSelectedOverride = self->_isSelectedOverride;
  BOOL isActiveDataPlan = self->_isActiveDataPlan;
  BOOL isDefaultVoice = self->_isDefaultVoice;
  long long v16 = *(_OWORD *)&self->_companionSlotUuid;
  phoneNumber = self->_phoneNumber;
  userLabel = self->_userLabel;
  uint64_t v7 = [(CTCellularPlanItem *)self carrierName];
  if (self->_isLocalTransferToeSIMSupported) {
    uint64_t v8 = "YES";
  }
  else {
    uint64_t v8 = "NO";
  }
  if (self->_isTransferred) {
    v9 = "YES";
  }
  else {
    v9 = "NO";
  }
  uint64_t v10 = [(CTCellularPlanItem *)self transferredStatusAsString:self->_transferredStatus];
  transferredToDeviceDisplayName = self->_transferredToDeviceDisplayName;
  unint64_t supportedTransferOption = self->_supportedTransferOption;
  v13 = [(CTCellularPlanItem *)self settingsModeAsString:self->_settingsMode];
  objc_msgSend(v25, "stringWithFormat:", @"<item: uuid:%@ iccid:%@ name:%@, type:%@, validstate:%d, selected:%@, selectable:%d, activeData:%d, defaultVoice:%d, slotUuid:%@, labelId:%@, number:%@, label:%@ carrier:%@, isLocalTransferToeSIMSupported:%s, isTransferred:%s, transferredStatus:%@ transferredToDeviceDisplayName:%@, _supportedTransferOption:%lu, settingsMode:%@>", uuid, iccid, name, v22, isSimStateValid, isSelectedOverride, isSelectable, isActiveDataPlan, isDefaultVoice, v16, phoneNumber, userLabel, v7, v8, v9, v10,
    transferredToDeviceDisplayName,
    supportedTransferOption,
  uint64_t v14 = v13);

  if (!v26) {
  return v14;
  }
}

- (void)setLabel:(id)a3
{
}

- (CTCellularPlan)plan
{
  return self->_plan;
}

- (CTPlan)ctPlan
{
  return self->_ctPlan;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)lockState
{
  return self->_lockState;
}

- (void)setLockState:(int64_t)a3
{
  self->_lockState = a3;
}

- (BOOL)shouldDisplayType
{
  return self->_shouldDisplayType;
}

- (void)setShouldDisplayType:(BOOL)a3
{
  self->_shouldDisplayType = a3;
}

- (BOOL)shouldAutoSelectWhenInRange
{
  return self->_shouldAutoSelectWhenInRange;
}

- (void)setShouldAutoSelectWhenInRange:(BOOL)a3
{
  self->_shouldAutoSelectWhenInRange = a3;
}

- (BOOL)shouldDisplayExtendedConsentInfo
{
  return self->_shouldDisplayExtendedConsentInfo;
}

- (void)setShouldDisplayExtendedConsentInfo:(BOOL)a3
{
  self->_shouldDisplayExtendedConsentInfo = a3;
}

- (BOOL)isSimStateValid
{
  return self->_isSimStateValid;
}

- (void)setIsSimStateValid:(BOOL)a3
{
  self->_BOOL isSimStateValid = a3;
}

- (void)setIsSelectable:(BOOL)a3
{
  self->_BOOL isSelectable = a3;
}

- (BOOL)shouldDisplay
{
  return self->_shouldDisplay;
}

- (void)setShouldDisplay:(BOOL)a3
{
  self->_shouldDisplay = a3;
}

- (BOOL)shouldAppearDisabled
{
  return self->_shouldAppearDisabled;
}

- (void)setShouldAppearDisabled:(BOOL)a3
{
  self->_shouldAppearDisabled = a3;
}

- (BOOL)isActiveDataPlan
{
  return self->_isActiveDataPlan;
}

- (void)setIsActiveDataPlan:(BOOL)a3
{
  self->_BOOL isActiveDataPlan = a3;
}

- (BOOL)isDefaultVoice
{
  return self->_isDefaultVoice;
}

- (void)setIsDefaultVoice:(BOOL)a3
{
  self->_BOOL isDefaultVoice = a3;
}

- (BOOL)isLocalTransferToeSIMSupported
{
  return self->_isLocalTransferToeSIMSupported;
}

- (void)setIsLocalTransferToeSIMSupported:(BOOL)a3
{
  self->_isLocalTransferToeSIMSupported = a3;
}

- (BOOL)isTransferred
{
  return self->_isTransferred;
}

- (void)setIsTransferred:(BOOL)a3
{
  self->_isTransferred = a3;
}

- (int64_t)transferredStatus
{
  return self->_transferredStatus;
}

- (NSString)transferredToDeviceDisplayName
{
  return self->_transferredToDeviceDisplayName;
}

- (unint64_t)supportedTransferOption
{
  return self->_supportedTransferOption;
}

- (void)setSupportedTransferOption:(unint64_t)a3
{
  self->_unint64_t supportedTransferOption = a3;
}

- (int64_t)settingsMode
{
  return self->_settingsMode;
}

- (void)setSettingsMode:(int64_t)a3
{
  self->_settingsMode = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (CTUserLabel)userLabel
{
  return self->_userLabel;
}

- (void)setUserLabel:(id)a3
{
}

- (void)setCompanionSlotUuid:(id)a3
{
}

- (void)setCompanionSimLabelId:(id)a3
{
}

- (NSNumber)isSelectedOverride
{
  return self->_isSelectedOverride;
}

- (void)setIsSelectedOverride:(id)a3
{
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isSelectedOverride, 0);
  objc_storeStrong((id *)&self->_companionSimLabelId, 0);
  objc_storeStrong((id *)&self->_companionSlotUuid, 0);
  objc_storeStrong((id *)&self->_userLabel, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_transferredToDeviceDisplayName, 0);
  objc_storeStrong((id *)&self->_ctPlan, 0);
  objc_storeStrong((id *)&self->_plan, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end