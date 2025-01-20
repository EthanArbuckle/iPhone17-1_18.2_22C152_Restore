@interface HFAccessoryInfoItem
+ (id)accessibilityStringForCharacteristic:(id)a3;
+ (id)localizedStringForCharacteristic:(id)a3;
- (HFAccessoryInfoItem)init;
- (HFAccessoryInfoItem)initWithAccessory:(id)a3 infoType:(unint64_t)a4;
- (HFAccessoryInfoItem)initWithAccessory:(id)a3 infoType:(unint64_t)a4 home:(id)a5;
- (HMAccessory)accessory;
- (HMHome)home;
- (id)_subclass_updateWithOptions:(id)a3;
- (unint64_t)infoType;
- (void)setHome:(id)a3;
@end

@implementation HFAccessoryInfoItem

+ (id)localizedStringForCharacteristic:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F0C270]])
  {
    v4 = @"HFAccessoryInfoDetailsManufacturer";
LABEL_11:
    _HFLocalizedStringWithDefaultValue(v4, v4, 1);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F0C278]])
  {
    v4 = @"HFAccessoryInfoDetailsModel";
    goto LABEL_11;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F0C3C0]])
  {
    v4 = @"HFAccessoryInfoDetailsSerialNumber";
    goto LABEL_11;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F0C190]])
  {
    v4 = @"HFAccessoryInfoDetailsFirmwareVersion";
    goto LABEL_11;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F0C400]])
  {
    v4 = @"HFAccessoryInfoDetailsSoftwareVersion";
    goto LABEL_11;
  }
  v5 = &stru_26C081158;
LABEL_12:

  return v5;
}

+ (id)accessibilityStringForCharacteristic:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F0C270]])
  {
    v4 = @"AccessoryDetails.Manufacturer";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F0C278]])
  {
    v4 = @"AccessoryDetails.Model";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F0C3C0]])
  {
    v4 = @"AccessoryDetails.SerialNumber";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F0C190]])
  {
    v4 = @"AccessoryDetails.FirmwareVersion";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F0C400]])
  {
    v4 = @"AccessoryDetails.SoftwareVersion";
  }
  else
  {
    v4 = &stru_26C081158;
  }

  return v4;
}

- (HFAccessoryInfoItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithAccessory_infoType_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessoryInfoItem.m", 69, @"%s is unavailable; use %@ instead",
    "-[HFAccessoryInfoItem init]",
    v5);

  return 0;
}

- (HFAccessoryInfoItem)initWithAccessory:(id)a3 infoType:(unint64_t)a4
{
  return [(HFAccessoryInfoItem *)self initWithAccessory:a3 infoType:a4 home:0];
}

- (HFAccessoryInfoItem)initWithAccessory:(id)a3 infoType:(unint64_t)a4 home:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HFAccessoryInfoItem;
  v11 = [(HFAccessoryInfoItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accessory, a3);
    v12->_infoType = a4;
    objc_storeStrong((id *)&v12->_home, a5);
  }

  return v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  v5 = (void *)MEMORY[0x263EFFA08];
  v6 = [(HFAccessoryInfoItem *)self accessory];
  v7 = [v5 setWithObject:v6];
  [v4 setObject:v7 forKeyedSubscript:@"dependentHomeKitObjects"];

  v8 = +[HFAccessoryInfoDetailsItemProvider preferredCharacteristicOrderArray];
  id v9 = +[HFHomeKitDispatcher sharedDispatcher];
  id v10 = [v9 diagnosticInfoManager];
  v11 = [(HFAccessoryInfoItem *)self accessory];
  v12 = [v10 softwareVersionForAccessory:v11];

  switch([(HFAccessoryInfoItem *)self infoType])
  {
    case 0uLL:
      v13 = 0;
      objc_super v14 = 0;
      int v15 = 1;
      goto LABEL_4;
    case 1uLL:
      v17 = [(HFAccessoryInfoItem *)self accessory];
      objc_super v14 = [v17 firmwareVersion];

      uint64_t v18 = *MEMORY[0x263F0C190];
      uint64_t v16 = [v8 indexOfObject:*MEMORY[0x263F0C190]];
      v13 = +[HFAccessoryInfoItem localizedStringForCharacteristic:v18];
      v19 = [(HFAccessoryInfoItem *)self accessory];
      if (objc_msgSend(v19, "hf_isHomePod"))
      {
        int v15 = 1;
        goto LABEL_16;
      }
      v20 = [(HFAccessoryInfoItem *)self accessory];
      int v15 = objc_msgSend(v20, "hf_isAppleTV");
      goto LABEL_15;
    case 2uLL:
      if (v12)
      {
        objc_super v14 = [v12 localizedDescription];
      }
      else
      {
        v21 = [(HFAccessoryInfoItem *)self accessory];
        v22 = [v21 softwareVersion];
        objc_super v14 = [v22 localizedDescription];
      }
      uint64_t v23 = *MEMORY[0x263F0C400];
      uint64_t v16 = [v8 indexOfObject:*MEMORY[0x263F0C400]];
      v13 = +[HFAccessoryInfoItem localizedStringForCharacteristic:v23];
      v19 = [(HFAccessoryInfoItem *)self accessory];
      if (objc_msgSend(v19, "hf_isHomePod"))
      {
        int v15 = 0;
      }
      else
      {
        v20 = [(HFAccessoryInfoItem *)self accessory];
        int v15 = objc_msgSend(v20, "hf_isAppleTV") ^ 1;
LABEL_15:
      }
LABEL_16:

LABEL_17:
      [v4 setObject:v13 forKeyedSubscript:@"title"];
      [v4 setObject:v14 forKeyedSubscript:@"description"];
      uint64_t v24 = [v14 length];
      v25 = [(HFAccessoryInfoItem *)self home];
      int v26 = objc_msgSend(v25, "hf_currentUserIsRestrictedGuest");
      if (v24) {
        int v27 = v26;
      }
      else {
        int v27 = 1;
      }
      uint64_t v28 = v27 | v15;

      v29 = [NSNumber numberWithBool:v28];
      [v4 setObject:v29 forKeyedSubscript:@"hidden"];

      if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v16 = [v8 count];
      }
      v30 = [NSNumber numberWithUnsignedInteger:v16];
      [v4 setObject:v30 forKeyedSubscript:@"accessoryInfoDetailPreferredOrder"];

      v31 = [[HFItemUpdateOutcome alloc] initWithResults:v4];
      v32 = [MEMORY[0x263F58190] futureWithResult:v31];

      return v32;
    case 3uLL:
      uint64_t v16 = [v8 indexOfObject:@"HFAccessoryInfoTypeNetworkPreferredOrderKey"];
      int v15 = 0;
      v13 = 0;
      objc_super v14 = 0;
      goto LABEL_17;
    default:
      int v15 = 0;
      v13 = 0;
      objc_super v14 = 0;
LABEL_4:
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_17;
  }
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (unint64_t)infoType
{
  return self->_infoType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end