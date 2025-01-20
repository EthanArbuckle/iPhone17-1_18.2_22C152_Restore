@interface DASLogConditionHistory
@end

@implementation DASLogConditionHistory

void __38___DASLogConditionHistory_description__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)description_formatter;
  description_formatter = (uint64_t)v0;

  [(id)description_formatter setDateStyle:1];
  [(id)description_formatter setTimeStyle:2];
  v2 = (void *)description_formatter;
  v3 = [MEMORY[0x263EFFA18] localTimeZone];
  [v2 setTimeZone:v3];

  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  v5 = (void *)description_shortFormatter;
  description_shortFormatter = (uint64_t)v4;

  [(id)description_shortFormatter setDateStyle:0];
  [(id)description_shortFormatter setTimeStyle:2];
  v6 = (void *)description_shortFormatter;
  id v7 = [MEMORY[0x263EFFA18] localTimeZone];
  [v6 setTimeZone:v7];
}

@end