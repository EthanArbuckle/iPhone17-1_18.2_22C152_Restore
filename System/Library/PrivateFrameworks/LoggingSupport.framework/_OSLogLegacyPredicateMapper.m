@interface _OSLogLegacyPredicateMapper
- (id)validKeyPaths;
- (void)mapLeftExpression:(id *)a3 andRightExpression:(id *)a4;
@end

@implementation _OSLogLegacyPredicateMapper

- (void)mapLeftExpression:(id *)a3 andRightExpression:(id *)a4
{
  if (mapLeftExpression_andRightExpression__once_436 != -1) {
    dispatch_once(&mapLeftExpression_andRightExpression__once_436, &__block_literal_global_438);
  }
  if ([*a3 expressionType] == 3)
  {
    id v10 = [*a3 keyPath];
    v5 = objc_msgSend((id)mapLeftExpression_andRightExpression__keypathMaps_435, "objectForKeyedSubscript:");

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E4F28C68];
      v7 = [(id)mapLeftExpression_andRightExpression__keypathMaps_435 objectForKeyedSubscript:v10];
      v8 = [v6 expressionForKeyPath:v7];
      id v9 = *a3;
      *a3 = v8;
    }
  }
}

- (id)validKeyPaths
{
  if (validKeyPaths_once_421 != -1) {
    dispatch_once(&validKeyPaths_once_421, &__block_literal_global_423);
  }
  v2 = (void *)validKeyPaths__legacyValidKeyPaths;
  return v2;
}

@end