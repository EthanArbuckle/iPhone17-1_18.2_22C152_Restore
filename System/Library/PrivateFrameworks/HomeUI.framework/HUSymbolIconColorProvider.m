@interface HUSymbolIconColorProvider
+ (id)primaryColorForSymbolIconAccessoryType:(id)a3;
+ (id)primaryColorForSymbolIconIdentifier:(id)a3;
@end

@implementation HUSymbolIconColorProvider

+ (id)primaryColorForSymbolIconIdentifier:(id)a3
{
  v4 = HFSymbolIconAccessoryTypeForSymbol();
  v5 = [a1 primaryColorForSymbolIconAccessoryType:v4];

  return v5;
}

+ (id)primaryColorForSymbolIconAccessoryType:(id)a3
{
  id v3 = a3;
  if (_MergedGlobals_634 != -1) {
    dispatch_once(&_MergedGlobals_634, &__block_literal_global_3_5);
  }
  id v4 = (id)qword_1EBA47938;
  v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

void __68__HUSymbolIconColorProvider_primaryColorForSymbolIconAccessoryType___block_invoke_2()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v5[0] = *MEMORY[0x1E4F68CD8];
  v0 = [MEMORY[0x1E4F428B8] systemYellowColor];
  v6[0] = v0;
  v5[1] = *MEMORY[0x1E4F68CD0];
  v1 = [MEMORY[0x1E4F428B8] systemCyanColor];
  v6[1] = v1;
  v5[2] = *MEMORY[0x1E4F68CE0];
  v2 = [MEMORY[0x1E4F428B8] systemOrangeColor];
  v6[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  id v4 = (void *)qword_1EBA47938;
  qword_1EBA47938 = v3;
}

@end