@interface NSMutableDictionary(HFItemAdditions)
- (void)hf_setMinimumDisplayPriority:()HFItemAdditions;
@end

@implementation NSMutableDictionary(HFItemAdditions)

- (void)hf_setMinimumDisplayPriority:()HFItemAdditions
{
  v5 = [a1 objectForKeyedSubscript:@"priority"];
  v6 = v5;
  if (!v5) {
    v5 = &unk_26C0F7D10;
  }
  uint64_t v7 = [v5 integerValue];

  if (v7 <= a3) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = v7;
  }
  id v9 = [NSNumber numberWithInteger:v8];
  [a1 setObject:v9 forKeyedSubscript:@"priority"];
}

@end