@interface HFResidentDeviceItem
- (HFResidentDeviceItem)init;
- (HFResidentDeviceItem)initWithResidentDevice:(id)a3;
- (HMResidentDevice)residentDevice;
- (NSString)description;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HFResidentDeviceItem

- (HFResidentDeviceItem)initWithResidentDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFResidentDeviceItem;
  v6 = [(HFResidentDeviceItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_residentDevice, a3);
  }

  return v7;
}

- (HFResidentDeviceItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithResidentDevice_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFResidentDeviceItem.m", 34, @"%s is unavailable; use %@ instead",
    "-[HFResidentDeviceItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFResidentDeviceItem *)self residentDevice];
  v6 = (void *)[v4 initWithResidentDevice:v5];

  [v6 copyLatestResultsFromItem:self];
  return v6;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(HFResidentDeviceItem *)self residentDevice];
  v7 = objc_msgSend(v6, "hf_prettyDescription");
  v8 = [(HFItem *)self latestResults];
  objc_super v9 = [v3 stringWithFormat:@"<%@: %p, \"%@\" %@>", v5, self, v7, v8];

  return (NSString *)v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = objc_alloc_init(HFMutableItemUpdateOutcome);
  id v5 = [(HFResidentDeviceItem *)self residentDevice];
  v6 = objc_msgSend(v5, "hf_displayName");

  v7 = [(HFResidentDeviceItem *)self residentDevice];
  char v8 = [v7 isCurrentDevice];

  if (v8)
  {
    objc_super v9 = @"HFResidentDeviceItemCurrentDeviceName";
  }
  else
  {
    if ([v6 length]) {
      goto LABEL_6;
    }
    objc_super v9 = @"HFResidentDeviceUnknownName";
  }
  uint64_t v10 = _HFLocalizedStringWithDefaultValue(v9, v9, 1);

  v6 = (void *)v10;
LABEL_6:
  [(HFMutableItemUpdateOutcome *)v4 setObject:v6 forKeyedSubscript:@"title"];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __52__HFResidentDeviceItem__subclass_updateWithOptions___block_invoke;
  v14[3] = &unk_26408D648;
  v14[4] = self;
  v11 = __52__HFResidentDeviceItem__subclass_updateWithOptions___block_invoke((uint64_t)v14);
  [(HFMutableItemUpdateOutcome *)v4 setObject:v11 forKeyedSubscript:@"description"];

  v12 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v12;
}

id __52__HFResidentDeviceItem__subclass_updateWithOptions___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) residentDevice];
  char v3 = [v2 isEnabled];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) residentDevice];
    char v5 = objc_msgSend(v4, "hf_isReachable");

    if (v5)
    {
      v6 = [*(id *)(a1 + 32) residentDevice];
      char v7 = [v6 status];

      if (v7)
      {
        v11 = [*(id *)(a1 + 32) residentDevice];
        char v12 = [v11 status];

        if ((v12 & 8) != 0)
        {
          char v8 = @"HFResidentDeviceItemDescriptionLowBattery";
        }
        else
        {
          v13 = [*(id *)(a1 + 32) residentDevice];
          char v14 = [v13 status];

          if ((v14 & 2) != 0) {
            char v8 = @"HFResidentDeviceItemDescriptionConnected";
          }
          else {
            char v8 = @"HFResidentDeviceItemDescriptionStandby";
          }
        }
      }
      else
      {
        char v8 = @"HFResidentDeviceItemDescriptionDisconnected";
      }
    }
    else
    {
      char v8 = @"HFResidentDeviceItemDescriptionUnreachable";
    }
  }
  else
  {
    char v8 = @"HFResidentDeviceItemDescriptionDisabled";
  }
  objc_super v9 = _HFLocalizedStringWithDefaultValue(v8, v8, 1);
  return v9;
}

- (HMResidentDevice)residentDevice
{
  return self->_residentDevice;
}

- (void).cxx_destruct
{
}

@end