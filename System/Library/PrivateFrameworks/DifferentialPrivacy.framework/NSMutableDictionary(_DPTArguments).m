@interface NSMutableDictionary(_DPTArguments)
- (void)dp_addBoolForKey:()_DPTArguments;
- (void)dp_addStringForKey:()_DPTArguments;
@end

@implementation NSMutableDictionary(_DPTArguments)

- (void)dp_addStringForKey:()_DPTArguments
{
  id v6 = a3;
  v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v5 = [v4 stringForKey:v6];

  if (v5) {
    [a1 setObject:v5 forKeyedSubscript:v6];
  }
}

- (void)dp_addBoolForKey:()_DPTArguments
{
  v4 = (void *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  id v6 = [v4 standardUserDefaults];
  uint64_t v7 = [v6 BOOLForKey:v5];

  id v8 = [NSNumber numberWithBool:v7];
  [a1 setObject:v8 forKeyedSubscript:v5];
}

@end