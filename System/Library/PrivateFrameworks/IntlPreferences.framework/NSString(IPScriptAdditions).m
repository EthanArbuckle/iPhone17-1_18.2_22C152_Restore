@interface NSString(IPScriptAdditions)
- (id)localeIdentifierWithUpdatedScript:()IPScriptAdditions;
@end

@implementation NSString(IPScriptAdditions)

- (id)localeIdentifierWithUpdatedScript:()IPScriptAdditions
{
  v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  v6 = [v4 componentsFromLocaleIdentifier:a1];
  v7 = (void *)[v6 mutableCopy];

  [v7 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F1C470]];
  v8 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v7];

  return v8;
}

@end