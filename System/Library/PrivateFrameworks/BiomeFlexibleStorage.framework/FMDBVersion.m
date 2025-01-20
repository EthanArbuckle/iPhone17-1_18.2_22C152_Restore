@interface FMDBVersion
@end

@implementation FMDBVersion

void __28___bmFMDatabase_FMDBVersion__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) FMDBUserVersion];
  v2 = [v1 componentsSeparatedByString:@"."];
  unint64_t v3 = [v2 count];

  if (v3 > 2)
  {
    v6 = v1;
  }
  else
  {
    do
    {
      id v11 = [v1 stringByAppendingString:@".0"];

      v4 = [v11 componentsSeparatedByString:@"."];
      unint64_t v5 = [v4 count];

      v6 = v11;
      v1 = v11;
    }
    while (v5 < 3);
  }
  id v12 = v6;
  v7 = [v6 componentsSeparatedByString:@"."];
  for (uint64_t i = 0; i != 3; ++i)
  {
    v9 = [v7 objectAtIndexedSubscript:i];
    int v10 = [v9 intValue];

    if (v10 >= 16)
    {
      NSLog(&cfstr_FmdbversionIsI.isa);
      int v10 = 15;
    }
    FMDBVersion_FMDBVersionVal = v10 | (16 * FMDBVersion_FMDBVersionVal);
  }
}

@end