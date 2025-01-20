@interface NSValueTransformer(CodableUtilities)
+ (Class)_intents_resolutionResultClass;
+ (uint64_t)_intents_valueType;
@end

@implementation NSValueTransformer(CodableUtilities)

+ (Class)_intents_resolutionResultClass
{
  v1 = NSString;
  v2 = NSStringFromClass((Class)[a1 transformedValueClass]);
  v3 = [v2 substringFromIndex:2];
  v4 = [v1 stringWithFormat:@"IN%@ResolutionResult", v3];

  Class v5 = NSClassFromString(v4);
  if (v5)
  {
    if ([(objc_class *)v5 isSubclassOfClass:objc_opt_class()]
      && ([MEMORY[0x1E4F28B50] bundleForClass:v5],
          v6 = objc_claimAutoreleasedReturnValue(),
          [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()],
          v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v6 isEqual:v7],
          v7,
          v6,
          v8))
    {
      Class v5 = v5;
    }
    else
    {
      Class v5 = 0;
    }
  }

  return v5;
}

+ (uint64_t)_intents_valueType
{
  return 0;
}

@end