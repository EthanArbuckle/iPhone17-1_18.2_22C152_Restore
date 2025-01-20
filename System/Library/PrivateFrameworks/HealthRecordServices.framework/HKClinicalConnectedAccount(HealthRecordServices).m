@interface HKClinicalConnectedAccount(HealthRecordServices)
- (uint64_t)initWithClinicalAccount:()HealthRecordServices;
@end

@implementation HKClinicalConnectedAccount(HealthRecordServices)

- (uint64_t)initWithClinicalAccount:()HealthRecordServices
{
  v4 = (objc_class *)MEMORY[0x263F0A188];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 identifier];
  v8 = [v5 provenance];
  v9 = [v8 title];
  v10 = [v5 provenance];
  v11 = [v10 subtitle];
  v12 = [v5 brand];
  uint64_t v13 = [v5 needsRelogin];

  uint64_t v14 = [v6 initWithIdentifier:v7 title:v9 subtitle:v11 brand:v12 needsRelogin:v13];
  return v14;
}

@end