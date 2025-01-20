@interface HUServiceDetailsRemoveFromGroupItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUServiceDetailsRemoveFromGroupItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRemoveFromGroupTitle", @"HUServiceDetailsRemoveFromGroupTitle", 1);
  uint64_t v10 = *MEMORY[0x1E4F68AB8];
  v11[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v5 = (void *)[v4 mutableCopy];

  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  v6 = (void *)MEMORY[0x1E4F7A0D8];
  v7 = [MEMORY[0x1E4F69228] outcomeWithResults:v5];
  v8 = [v6 futureWithResult:v7];

  return v8;
}

@end