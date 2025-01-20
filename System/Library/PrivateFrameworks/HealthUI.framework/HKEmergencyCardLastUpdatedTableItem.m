@interface HKEmergencyCardLastUpdatedTableItem
- (BOOL)hasPresentableData;
- (id)initInEditMode:(BOOL)a3 editable:(BOOL)a4;
- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4;
@end

@implementation HKEmergencyCardLastUpdatedTableItem

- (id)initInEditMode:(BOOL)a3 editable:(BOOL)a4
{
  BOOL v5 = a3;
  if (a3)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"HKEmergencyCardLastUpdatedTableItem.m" lineNumber:29 description:@"HKEmergencyCardLastUpdatedTableItem doesn't support edit mode"];
  }
  v10.receiver = self;
  v10.super_class = (Class)HKEmergencyCardLastUpdatedTableItem;
  id result = [(HKEmergencyCardTableItem *)&v10 initInEditMode:v5];
  if (result) {
    *((unsigned char *)result + 40) = a4;
  }
  return result;
}

- (BOOL)hasPresentableData
{
  if (+[HKOrganDonationConnectionManager hasStoredRegistrant])
  {
    return 1;
  }
  return +[HKOrganDonationConnectionManager shouldShowStoreDemoOrganDonation];
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  v4 = off_1E6D4F908;
  if (a4) {
    v4 = off_1E6D4FCC8;
  }
  BOOL v5 = *v4;
  id v6 = a3;
  v7 = [(__objc2_class *)v5 defaultReuseIdentifier];
  v8 = [v6 dequeueReusableCellWithIdentifier:v7];

  return v8;
}

@end