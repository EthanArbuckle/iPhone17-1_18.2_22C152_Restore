@interface HKMedicalCodingCollection(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (HDCodableMedicalCodingList)codableRepresentationForSync;
@end

@implementation HKMedicalCodingCollection(HDCodingSupport)

+ (id)createWithCodable:()HDCodingSupport
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = 0;
    goto LABEL_19;
  }
  id v4 = v3;
  v5 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v15 = 0;
LABEL_17:
    v16 = 0;
    goto LABEL_18;
  }
  id v6 = v4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v8 = objc_msgSend(v6, "items", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [v5 createWithCodable:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        if (!v13)
        {

          v15 = 0;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v15 = (void *)[v7 copy];
LABEL_15:

  if (!v15) {
    goto LABEL_17;
  }
  v16 = [MEMORY[0x1E4F2B178] collectionWithCodings:v15];
LABEL_18:

LABEL_19:

  return v16;
}

- (HDCodableMedicalCodingList)codableRepresentationForSync
{
  id v1 = [a1 codings];
  self;
  v2 = objc_alloc_init(HDCodableMedicalCodingList);
  id v3 = objc_msgSend(v1, "hk_map:", &__block_literal_global_71);

  id v4 = (void *)[v3 mutableCopy];
  [(HDCodableMedicalCodingList *)v2 setItems:v4];

  return v2;
}

@end