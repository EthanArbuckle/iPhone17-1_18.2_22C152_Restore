@interface CNSeedCardProvider
+ (id)bundleWithSeedCards;
+ (id)dataForCountryCode:(id)a3;
+ (id)dataForEveryCountry;
+ (id)nearestAvailableDataForCountryCode:(id)a3;
@end

@implementation CNSeedCardProvider

+ (id)nearestAvailableDataForCountryCode:(id)a3
{
  id v4 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))()
    && ([a1 dataForCountryCode:v4], (id v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
  }
  else
  {
    v6 = [a1 dataForCountryCode:@"us"];
  }

  return v6;
}

+ (id)dataForCountryCode:(id)a3
{
  id v4 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    id v5 = [@"AppleSeedCard-" stringByAppendingString:v4];
    v6 = [a1 bundleWithSeedCards];
    v7 = [v6 URLForResource:v5 withExtension:@"vcf" subdirectory:@"AppleSeedCards"];

    if (v7)
    {
      v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)dataForEveryCountry
{
  v2 = [a1 bundleWithSeedCards];
  v3 = [v2 URLsForResourcesWithExtension:@"vcf" subdirectory:@"AppleSeedCards"];

  id v4 = objc_msgSend(v3, "_cn_lazy");
  id v5 = [v4 compactMap];
  v6 = ((void (**)(void, void *))v5)[2](v5, &__block_literal_global_7);

  return v6;
}

uint64_t __41__CNSeedCardProvider_dataForEveryCountry__block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a2];
}

+ (id)bundleWithSeedCards
{
  return (id)[MEMORY[0x1E4F28B50] bundleForClass:a1];
}

@end