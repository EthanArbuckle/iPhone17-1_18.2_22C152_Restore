@interface HDMedicationsAppSourceSupport
+ (id)medicationsAppSourceEntityForProfile:(id)a3 error:(id *)a4;
@end

@implementation HDMedicationsAppSourceSupport

+ (id)medicationsAppSourceEntityForProfile:(id)a3 error:(id *)a4
{
  v19[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F29E48];
  uint64_t v6 = MEMORY[0x1E4F1CC38];
  v19[0] = MEMORY[0x1E4F1CC38];
  uint64_t v7 = *MEMORY[0x1E4F2AA10];
  v18[0] = v5;
  v18[1] = v7;
  uint64_t v17 = *MEMORY[0x1E4F2BE10];
  uint64_t v8 = v17;
  v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a3;
  v11 = [v9 arrayWithObjects:&v17 count:1];
  v18[2] = *MEMORY[0x1E4F2A520];
  v19[1] = v11;
  v19[2] = v6;
  v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v19, v18, 3, v17);

  v13 = [v10 sourceManager];

  v14 = [MEMORY[0x1E4F2B8D8] entitlementsWithDictionary:v12];
  v15 = [v13 sourceForApplicationIdentifier:v8 createOrUpdateIfNecessary:1 entitlements:v14 name:0 error:a4];

  return v15;
}

@end