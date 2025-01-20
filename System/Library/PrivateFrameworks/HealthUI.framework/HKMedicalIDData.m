@interface HKMedicalIDData
@end

@implementation HKMedicalIDData

void __79___HKMedicalIDData_HKMedicalIDAddressBookBridge__contactKeysToLoadForMedicalID__block_invoke()
{
  v6[7] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v1 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:1];
  uint64_t v2 = *MEMORY[0x1E4F1AE28];
  v6[0] = *MEMORY[0x1E4F1AD90];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AEE0];
  v6[2] = *MEMORY[0x1E4F1AF98];
  v6[3] = v3;
  v6[4] = *MEMORY[0x1E4F1AFA8];
  v6[5] = v0;
  v6[6] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:7];
  v5 = (void *)contactKeysToLoadForMedicalID_contactKeysToFetch;
  contactKeysToLoadForMedicalID_contactKeysToFetch = v4;
}

void __69___HKMedicalIDData_HKMedicalIDAddressBookBridge___contactKeysToFetch__block_invoke()
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v1 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:1];
  uint64_t v2 = *MEMORY[0x1E4F1AFA8];
  v5[0] = *MEMORY[0x1E4F1AEE0];
  v5[1] = v2;
  v5[2] = *MEMORY[0x1E4F1AE08];
  v5[3] = v0;
  v5[4] = v1;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:5];
  uint64_t v4 = (void *)_contactKeysToFetch_contactKeys;
  _contactKeysToFetch_contactKeys = v3;
}

@end