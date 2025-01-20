@interface CNUIContactPropertyRanker
+ (id)bestPropertyComparator;
@end

@implementation CNUIContactPropertyRanker

+ (id)bestPropertyComparator
{
  if (bestPropertyComparator_onceToken != -1) {
    dispatch_once(&bestPropertyComparator_onceToken, &__block_literal_global_55);
  }
  v2 = _Block_copy((const void *)bestPropertyComparator_sIDSContactBestPropertyRanker);
  return v2;
}

void __51__CNUIContactPropertyRanker_bestPropertyComparator__block_invoke()
{
  v0 = (void *)bestPropertyComparator_sIDSContactBestPropertyRanker;
  bestPropertyComparator_sIDSContactBestPropertyRanker = (uint64_t)&__block_literal_global_3_2;
}

uint64_t __51__CNUIContactPropertyRanker_bestPropertyComparator__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = __51__CNUIContactPropertyRanker_bestPropertyComparator__block_invoke_3((uint64_t)v4, a3);
  v6 = __51__CNUIContactPropertyRanker_bestPropertyComparator__block_invoke_3((uint64_t)v5, v4);

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __51__CNUIContactPropertyRanker_bestPropertyComparator__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 key];
  int v4 = [v3 isEqual:*MEMORY[0x263EFE070]];

  if (_block_invoke_cn_once_token_1 != -1) {
    dispatch_once(&_block_invoke_cn_once_token_1, &__block_literal_global_8_1);
  }
  if (v4) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  id v6 = (id)_block_invoke_cn_once_object_1;
  uint64_t v7 = [v2 label];

  int v8 = [v6 containsObject:v7];
  double v9 = v5 + 0.5;
  if (!v8) {
    double v9 = v5;
  }
  v10 = NSNumber;
  return [v10 numberWithDouble:v9];
}

void __51__CNUIContactPropertyRanker_bestPropertyComparator__block_invoke_4()
{
  v4[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263EFE8D8];
  v4[0] = *MEMORY[0x263EFE8F8];
  v4[1] = v0;
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v1 copy];
  v3 = (void *)_block_invoke_cn_once_object_1;
  _block_invoke_cn_once_object_1 = v2;
}

@end