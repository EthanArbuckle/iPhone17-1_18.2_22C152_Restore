@interface CDPDBackupFMIPResultsParser
- (id)resultsDictionaryFromRecoveryResult:(id)a3 error:(id *)a4;
@end

@implementation CDPDBackupFMIPResultsParser

- (id)resultsDictionaryFromRecoveryResult:(id)a3 error:(id *)a4
{
  v9[1] = *MEMORY[0x263EF8340];
  v4 = [a3 recoveredInfo];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F32A30]];

  if (v5)
  {
    uint64_t v8 = *MEMORY[0x263F34270];
    v9[0] = v5;
    v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    v6 = (void *)MEMORY[0x263EFFA78];
  }

  return v6;
}

@end