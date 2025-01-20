@interface LAPSPasscodeTypeCollection
+ (id)_allWhere:(id)a3;
+ (id)allPasscodeTypes;
+ (id)allPasscodeTypesWhereComplexityIsGreaterThanOrEqualTo:(int64_t)a3;
@end

@implementation LAPSPasscodeTypeCollection

+ (id)allPasscodeTypes
{
  v12[5] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFF9D8]);
  v3 = +[LAPSPasscodeType noneType];
  v4 = +[LAPSPasscodeType numericFourDigitsType];
  v12[1] = v4;
  v5 = +[LAPSPasscodeType numericSixDigitsType];
  v12[2] = v5;
  v6 = +[LAPSPasscodeType numericCustomDigitsType];
  v12[3] = v6;
  v7 = +[LAPSPasscodeType alphanumericType];
  v12[4] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:5];
  v9 = [v8 sortedArrayUsingComparator:&__block_literal_global];
  v10 = (void *)[v2 initWithArray:v9];

  return v10;
}

uint64_t __46__LAPSPasscodeTypeCollection_allPasscodeTypes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "complexityRating"));
  v7 = NSNumber;
  uint64_t v8 = [v5 complexityRating];

  v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

+ (id)allPasscodeTypesWhereComplexityIsGreaterThanOrEqualTo:(int64_t)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __84__LAPSPasscodeTypeCollection_allPasscodeTypesWhereComplexityIsGreaterThanOrEqualTo___block_invoke;
  v5[3] = &__block_descriptor_40_e26_B16__0__LAPSPasscodeType_8l;
  v5[4] = a3;
  v3 = [a1 _allWhere:v5];

  return v3;
}

BOOL __84__LAPSPasscodeTypeCollection_allPasscodeTypesWhereComplexityIsGreaterThanOrEqualTo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 complexityRating] >= *(void *)(a1 + 32);
}

+ (id)_allWhere:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFF9D8]);
  v6 = [a1 allPasscodeTypes];
  v7 = [a1 allPasscodeTypes];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __40__LAPSPasscodeTypeCollection__allWhere___block_invoke;
  v13[3] = &unk_26506E8E8;
  id v14 = v4;
  id v8 = v4;
  v9 = [v7 indexesOfObjectsPassingTest:v13];
  uint64_t v10 = [v6 objectsAtIndexes:v9];
  v11 = (void *)[v5 initWithArray:v10];

  return v11;
}

uint64_t __40__LAPSPasscodeTypeCollection__allWhere___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end