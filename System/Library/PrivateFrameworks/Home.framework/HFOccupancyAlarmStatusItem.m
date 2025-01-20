@interface HFOccupancyAlarmStatusItem
+ (id)serviceTypes;
- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3;
- (id)descriptionStringForTriggeredServices:(id)a3;
- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3;
- (id)titleStringForTriggeredServices:(id)a3;
@end

@implementation HFOccupancyAlarmStatusItem

+ (id)serviceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D7B8]];
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F1C6C8], "configurationWithPointSize:", a3, 24.0);
  v4 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"figure.walk" configuration:v3];

  return v4;
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleOccupancyAlarm", @"HFStatusTitleOccupancyAlarm", 1);
}

- (id)titleStringForTriggeredServices:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263F0E708], "hf_roomsForServices:", a3);
  v5 = [(HFStatusItem *)self room];
  if (v5)
  {

LABEL_4:
    uint64_t v10 = _HFLocalizedStringWithDefaultValue(@"HFStatusTitleOccupancyAlarm", @"HFStatusTitleOccupancyAlarm", 1);
LABEL_5:
    v11 = (void *)v10;
    goto LABEL_6;
  }
  v6 = [v4 anyObject];
  v7 = [(HFStatusItem *)self home];
  v8 = [v7 roomForEntireHome];
  char v9 = [v6 isEqual:v8];

  if (v9) {
    goto LABEL_4;
  }
  if ([v4 count] != 1)
  {
    uint64_t v14 = [v4 count];
    uint64_t v10 = HFLocalizedStringWithFormat(@"HFStatusTitleOccupancyAlarm_Multiple", @"%lu", v15, v16, v17, v18, v19, v20, v14);
    goto LABEL_5;
  }
  v13 = [v4 anyObject];
  v11 = [v13 name];

LABEL_6:
  return v11;
}

- (id)descriptionStringForTriggeredServices:(id)a3
{
  v4 = (void *)MEMORY[0x263F0E708];
  id v5 = a3;
  v6 = objc_msgSend(v4, "hf_roomsForServices:", v5);
  uint64_t v7 = [v5 count];

  if (!v7)
  {
    char v9 = @"HFStatusDescriptionOccupancyAlarm_Normal";
    goto LABEL_8;
  }
  v8 = [(HFStatusItem *)self room];
  if (v8)
  {

LABEL_6:
    char v9 = @"HFStatusDescriptionOccupancyAlarm_Triggered";
    goto LABEL_8;
  }
  uint64_t v10 = [v6 anyObject];
  v11 = [(HFStatusItem *)self home];
  v12 = [v11 roomForEntireHome];
  char v13 = [v10 isEqual:v12];

  if (v13) {
    goto LABEL_6;
  }
  char v9 = @"HFStatusDescriptionOccupancyAlarm_WithRooms";
LABEL_8:
  uint64_t v14 = _HFLocalizedStringWithDefaultValue(v9, v9, 1);

  return v14;
}

@end