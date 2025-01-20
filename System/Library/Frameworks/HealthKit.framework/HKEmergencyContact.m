@interface HKEmergencyContact
@end

@implementation HKEmergencyContact

void __60___HKEmergencyContact_emergencyContactWithContact_property___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  [v7 setPhoneNumber:a2];
  [*(id *)(a1 + 32) setPhoneNumberContactIdentifier:v8];

  [*(id *)(a1 + 32) setPhoneNumberLabel:v9];
}

@end