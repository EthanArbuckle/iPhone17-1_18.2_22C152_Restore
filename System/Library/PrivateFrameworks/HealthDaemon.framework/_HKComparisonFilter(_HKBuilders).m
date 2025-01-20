@interface _HKComparisonFilter(_HKBuilders)
- (id)builder_filterWithDataTypes:()_HKBuilders;
@end

@implementation _HKComparisonFilter(_HKBuilders)

- (id)builder_filterWithDataTypes:()_HKBuilders
{
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = [a1 keyPath];
  uint64_t v7 = [a1 operatorType];
  v8 = [a1 value];
  v9 = [v5 filterForKeyPath:v6 operatorType:v7 value:v8 dataTypes:v4];

  return v9;
}

@end