@interface LSClaimRecord(IconServicesAdditions)
- (id)_IS_iconProvideingRecord;
@end

@implementation LSClaimRecord(IconServicesAdditions)

- (id)_IS_iconProvideingRecord
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [a1 typeIdentifiers];
  v17 = [a1 claimingBundleRecord];
  v3 = [v17 exportedTypeRecords];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * v8);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __64__LSClaimRecord_IconServicesAdditions___IS_iconProvideingRecord__block_invoke;
        v18[3] = &unk_1E5F08E40;
        v18[4] = v9;
        v10 = [v3 objectsPassingTest:v18];
        v11 = [v10 anyObject];

        if (v11)
        {

          id v13 = v11;
          v14 = v13;
          v12 = v17;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  v12 = v17;
  id v13 = v17;
  v14 = 0;
LABEL_11:
  id v15 = v13;

  return v15;
}

@end