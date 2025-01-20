@interface CNLabeledValue
@end

@implementation CNLabeledValue

void __56__CNLabeledValue_UIAdditions__builtinLabelsForProperty___block_invoke()
{
  v25[5] = *MEMORY[0x1E4F143B8];
  v24[0] = *MEMORY[0x1E4F1AEE0];
  uint64_t v1 = *MEMORY[0x1E4F1B770];
  v23[0] = *MEMORY[0x1E4F1B6F8];
  uint64_t v0 = v23[0];
  v23[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1B708];
  v23[2] = *MEMORY[0x1E4F1B758];
  v23[3] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1B720];
  v23[4] = *MEMORY[0x1E4F1B728];
  v23[5] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1B750];
  v23[6] = *MEMORY[0x1E4F1B710];
  v23[7] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1B700];
  v23[8] = *MEMORY[0x1E4F1B738];
  v23[9] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:10];
  v25[0] = v6;
  v24[1] = *MEMORY[0x1E4F1ADC8];
  v22[0] = v0;
  v22[1] = v1;
  v22[2] = *MEMORY[0x1E4F1B6F0];
  v22[3] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
  v25[1] = v7;
  v24[2] = *MEMORY[0x1E4F1AFB0];
  v21[0] = *MEMORY[0x1E4F1B768];
  v21[1] = v0;
  v21[2] = v1;
  v21[3] = v5;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
  v25[2] = v8;
  v24[3] = *MEMORY[0x1E4F1ADB0];
  v20[0] = *MEMORY[0x1E4F1B6E8];
  v20[1] = v5;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v25[3] = v9;
  v24[4] = *MEMORY[0x1E4F1AF50];
  uint64_t v10 = *MEMORY[0x1E4F1B2B8];
  v19[0] = *MEMORY[0x1E4F1B408];
  v19[1] = v10;
  uint64_t v11 = *MEMORY[0x1E4F1B0D8];
  v19[2] = *MEMORY[0x1E4F1B490];
  v19[3] = v11;
  uint64_t v12 = *MEMORY[0x1E4F1B558];
  v19[4] = *MEMORY[0x1E4F1B508];
  v19[5] = v12;
  uint64_t v13 = *MEMORY[0x1E4F1B128];
  v19[6] = *MEMORY[0x1E4F1B1F0];
  v19[7] = v13;
  uint64_t v14 = *MEMORY[0x1E4F1B578];
  v19[8] = *MEMORY[0x1E4F1B2F8];
  v19[9] = v14;
  uint64_t v15 = *MEMORY[0x1E4F1B058];
  v19[10] = *MEMORY[0x1E4F1B4E8];
  v19[11] = v15;
  v19[12] = *MEMORY[0x1E4F1B400];
  v19[13] = v5;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:14];
  v25[4] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:5];
  v18 = (void *)builtinLabelsForProperty__labelsForProperty;
  builtinLabelsForProperty__labelsForProperty = v17;
}

void __44__CNLabeledValue_UIAdditions__defaultLabels__block_invoke()
{
  v15[26] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1B6F8];
  v15[0] = *MEMORY[0x1E4F1B700];
  v15[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F1B758];
  v15[2] = *MEMORY[0x1E4F1B770];
  v15[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1B728];
  v15[4] = *MEMORY[0x1E4F1B708];
  v15[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1B710];
  v15[6] = *MEMORY[0x1E4F1B720];
  v15[7] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1B738];
  v15[8] = *MEMORY[0x1E4F1B750];
  v15[9] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1B768];
  v15[10] = *MEMORY[0x1E4F1B6F0];
  v15[11] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1B2B8];
  v15[12] = *MEMORY[0x1E4F1B6E8];
  v15[13] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1B490];
  v15[14] = *MEMORY[0x1E4F1B408];
  v15[15] = v7;
  uint64_t v8 = *MEMORY[0x1E4F1B508];
  v15[16] = *MEMORY[0x1E4F1B0D8];
  v15[17] = v8;
  uint64_t v9 = *MEMORY[0x1E4F1B1F0];
  v15[18] = *MEMORY[0x1E4F1B558];
  v15[19] = v9;
  uint64_t v10 = *MEMORY[0x1E4F1B2F8];
  v15[20] = *MEMORY[0x1E4F1B128];
  v15[21] = v10;
  uint64_t v11 = *MEMORY[0x1E4F1B4E8];
  v15[22] = *MEMORY[0x1E4F1B578];
  v15[23] = v11;
  uint64_t v12 = *MEMORY[0x1E4F1B400];
  v15[24] = *MEMORY[0x1E4F1B058];
  v15[25] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:26];
  uint64_t v14 = (void *)defaultLabels_labels;
  defaultLabels_labels = v13;
}

ABAddressBookRef __42__CNLabeledValue_UIAdditions__addressBook__block_invoke()
{
  ABAddressBookRef result = ABAddressBookCreateWithOptions(0, 0);
  addressBook_ab = (uint64_t)result;
  return result;
}

@end