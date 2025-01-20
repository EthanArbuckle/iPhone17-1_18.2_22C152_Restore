@interface HKOntologyLocalizedEducationContent(HDSyncSupport)
+ (id)createWithCodable:()HDSyncSupport;
- (HDCodableOntologyLocalizedEducationContent)codableRepresentationForSync;
@end

@implementation HKOntologyLocalizedEducationContent(HDSyncSupport)

- (HDCodableOntologyLocalizedEducationContent)codableRepresentationForSync
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(HDCodableOntologyLocalizedEducationContent);
  -[HDCodableOntologyLocalizedEducationContent setVersion:](v2, "setVersion:", [a1 version]);
  [a1 timestamp];
  -[HDCodableOntologyLocalizedEducationContent setTimestamp:](v2, "setTimestamp:");
  v22 = v2;
  -[HDCodableOntologyLocalizedEducationContent setDeleted:](v2, "setDeleted:", [a1 isDeleted]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v21 = a1;
  obuint64_t j = [a1 sections];
  uint64_t v23 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v23)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(id *)(*((void *)&v27 + 1) + 8 * v3);
        if (v21)
        {
          uint64_t v25 = v3;
          v5 = objc_alloc_init(HDCodableOntologyLocalizedEducationContentSection);
          -[HDCodableOntologyLocalizedEducationContentSection setSectionType:](v5, "setSectionType:", [v4 sectionType]);
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v24 = v4;
          id v26 = [v4 sectionData];
          uint64_t v6 = [v26 countByEnumeratingWithState:&v31 objects:v40 count:16];
          if (v6)
          {
            uint64_t v7 = v6;
            uint64_t v8 = *(void *)v32;
            do
            {
              for (uint64_t i = 0; i != v7; ++i)
              {
                if (*(void *)v32 != v8) {
                  objc_enumerationMutation(v26);
                }
                id v10 = *(id *)(*((void *)&v31 + 1) + 8 * i);
                v11 = objc_alloc_init(HDCodableSectionData);
                long long v35 = 0u;
                long long v36 = 0u;
                long long v37 = 0u;
                long long v38 = 0u;
                v12 = [v10 stringValues];
                uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
                if (v13)
                {
                  uint64_t v14 = v13;
                  uint64_t v15 = *(void *)v36;
                  do
                  {
                    for (uint64_t j = 0; j != v14; ++j)
                    {
                      if (*(void *)v36 != v15) {
                        objc_enumerationMutation(v12);
                      }
                      [(HDCodableSectionData *)v11 addStringValues:*(void *)(*((void *)&v35 + 1) + 8 * j)];
                    }
                    uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
                  }
                  while (v14);
                }

                -[HDCodableSectionData setSectionDataType:](v11, "setSectionDataType:", [v10 sectionDataType]);
                -[HDCodableSectionData setVersion:](v11, "setVersion:", [v10 version]);
                [v10 timestamp];
                -[HDCodableSectionData setTimestamp:](v11, "setTimestamp:");
                -[HDCodableSectionData setDeleted:](v11, "setDeleted:", [v10 deleted]);

                [(HDCodableOntologyLocalizedEducationContentSection *)v5 addSectionData:v11];
              }
              uint64_t v7 = [v26 countByEnumeratingWithState:&v31 objects:v40 count:16];
            }
            while (v7);
          }

          id v4 = v24;
          uint64_t v3 = v25;
        }
        else
        {
          v5 = 0;
        }

        [(HDCodableOntologyLocalizedEducationContent *)v22 addSections:v5];
        ++v3;
      }
      while (v3 != v23);
      uint64_t v17 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
      uint64_t v23 = v17;
    }
    while (v17);
  }

  return v22;
}

+ (id)createWithCodable:()HDSyncSupport
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [v4 sections];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__HKOntologyLocalizedEducationContent_HDSyncSupport__createWithCodable___block_invoke;
    v13[3] = &__block_descriptor_40_e59__16__0__HDCodableOntologyLocalizedEducationContentSection_8l;
    v13[4] = a1;
    uint64_t v6 = objc_msgSend(v5, "hk_map:", v13);

    id v7 = objc_alloc(MEMORY[0x1E4F2B2E8]);
    if (v6) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v9 = [v4 version];
    [v4 timestamp];
    v11 = objc_msgSend(v7, "initWithSections:version:timestamp:deleted:", v8, v9, objc_msgSend(v4, "deleted"), v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end