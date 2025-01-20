@interface KVDonator(HDHealthMedicationDataProvider)
- (void)donateWithOptions:()HDHealthMedicationDataProvider usingDataStream:;
@end

@implementation KVDonator(HDHealthMedicationDataProvider)

- (void)donateWithOptions:()HDHealthMedicationDataProvider usingDataStream:
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__KVDonator_HDHealthMedicationDataProvider__donateWithOptions_usingDataStream___block_invoke;
  v8[3] = &unk_1E6337918;
  id v9 = v6;
  id v7 = v6;
  [a1 donateWithOptions:a3 usingStream:v8];
}

@end