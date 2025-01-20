@interface NSError(HKVerifiableHealthRecordsParser)
- (id)mappedError;
@end

@implementation NSError(HKVerifiableHealthRecordsParser)

- (id)mappedError
{
  v18[1] = *MEMORY[0x263EF8340];
  v2 = [a1 domain];
  int v3 = [v2 isEqualToString:@"com.apple.health.records.extraction"];

  if (!v3) {
    goto LABEL_5;
  }
  uint64_t v4 = [a1 code];
  if (v4 == 104)
  {
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F45BD0];
    uint64_t v15 = *MEMORY[0x263F08608];
    v16 = a1;
    v7 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v8 = v12;
    uint64_t v9 = v13;
    uint64_t v10 = 1;
    goto LABEL_7;
  }
  if (v4 != 103)
  {
LABEL_5:
    id v11 = a1;
    goto LABEL_8;
  }
  v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = *MEMORY[0x263F45BD0];
  uint64_t v17 = *MEMORY[0x263F08608];
  v18[0] = a1;
  v7 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v8 = v5;
  uint64_t v9 = v6;
  uint64_t v10 = 2;
LABEL_7:
  id v11 = [v8 errorWithDomain:v9 code:v10 userInfo:v7];

LABEL_8:
  return v11;
}

@end