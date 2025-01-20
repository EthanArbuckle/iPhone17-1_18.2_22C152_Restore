@interface HKOntologyLocalizedEducationContent
@end

@implementation HKOntologyLocalizedEducationContent

id __72__HKOntologyLocalizedEducationContent_HDSyncSupport__createWithCodable___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = self;
  uint64_t v4 = [v2 sectionType];
  v5 = [v2 sectionDatas];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__HKOntologyLocalizedEducationContent_HDSyncSupport___createSectionWithCodable___block_invoke;
  v10[3] = &__block_descriptor_40_e30__16__0__HDCodableSectionData_8l;
  v10[4] = v3;
  v6 = objc_msgSend(v5, "hk_map:", v10);

  v7 = objc_msgSend(v6, "hk_mapToDictionary:", &__block_literal_global_372);
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F2B2F0]) initWithSectionDataTypeMapping:v7 sectionType:v4];

  return v8;
}

id __80__HKOntologyLocalizedEducationContent_HDSyncSupport___createSectionWithCodable___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  id v3 = objc_alloc(MEMORY[0x1E4F2B2E0]);
  uint64_t v4 = [v2 stringValues];
  uint64_t v5 = [v2 sectionDataType];
  uint64_t v6 = [v2 version];
  [v2 timestamp];
  double v8 = v7;
  uint64_t v9 = [v2 deleted];

  v10 = (void *)[v3 initWithStringValues:v4 sectionDataType:v5 version:v6 timestamp:v9 deleted:v8];

  return v10;
}

void __80__HKOntologyLocalizedEducationContent_HDSyncSupport___createSectionWithCodable___block_invoke_2(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  uint64_t v5 = NSNumber;
  uint64_t v6 = a3;
  id v7 = a2;
  objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v7, "sectionDataType"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, id, id))a3)[2](v6, v8, v7);
}

@end