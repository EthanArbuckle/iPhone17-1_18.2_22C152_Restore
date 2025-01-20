@interface HKDateFormatterParsers
@end

@implementation HKDateFormatterParsers

void ___HKDateFormatterParsers_block_invoke()
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v0 = _HKDateFormatterFromPattern(@"yyyyMMddHHmmssZZZZZ");
  v6[0] = v0;
  v1 = _HKDateFormatterFromPattern(@"yyyyMMddHHmmss");
  v6[1] = v1;
  v2 = _HKDateFormatterFromPattern(@"yyyyMMddHHmm");
  v6[2] = v2;
  v3 = _HKDateFormatterFromPattern(@"yyyyMMdd");
  v6[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  v5 = (void *)_HKDateFormatterParsers__formatters;
  _HKDateFormatterParsers__formatters = v4;
}

@end