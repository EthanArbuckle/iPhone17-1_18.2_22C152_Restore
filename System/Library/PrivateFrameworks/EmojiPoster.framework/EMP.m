@interface EMP
@end

@implementation EMP

void __63__EMP_TSDImageColorAnalyzer_filterInterestingColorsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __55__EMP_TSDImageColorAnalyzer_p_prepareInterestingColors__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v9 = 0.0;
  double v10 = 0.0;
  double v8 = 0.0;
  [v3 getHue:&v10 saturation:&v9 brightness:&v8 alpha:0];
  v4 = [NSNumber numberWithInt:1000 * llround(v9 * 10.0) + 100 * llround(v8 * 10.0) + llround(v10 * 100.0)];
  int v5 = [*(id *)(a1 + 32) containsObject:v4];
  uint64_t v6 = 32;
  if (v5)
  {
    uint64_t v6 = 40;
    id v7 = v3;
  }
  else
  {
    id v7 = v4;
  }
  [*(id *)(a1 + v6) addObject:v7];
}

@end