@interface LSApplicationProxy(IntentsFoundation)
- (id)if_userActivityTypes;
@end

@implementation LSApplicationProxy(IntentsFoundation)

- (id)if_userActivityTypes
{
  v1 = [a1 objectForInfoDictionaryKey:@"NSUserActivityTypes" ofClass:objc_opt_class()];
  v2 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global];
  v3 = [v1 filteredArrayUsingPredicate:v2];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

@end