@interface HFItemResultComponent
+ (id)combinedResultsForComponents:(id)a3;
- (NSDictionary)results;
- (int64_t)componentPriority;
@end

@implementation HFItemResultComponent

- (NSDictionary)results
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFItemResultComponent.m", 15, @"%s is an abstract method that must be overriden by subclass %@", "-[HFItemResultComponent results]", objc_opt_class() object file lineNumber description];

  return (NSDictionary *)MEMORY[0x263EFFA78];
}

+ (id)combinedResultsForComponents:(id)a3
{
  v3 = [a3 sortedArrayUsingComparator:&__block_literal_global_88];
  v4 = [v3 firstObject];
  v5 = [v4 results];

  return v5;
}

uint64_t __54__HFItemResultComponent_combinedResultsForComponents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a2;
  v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a3, "componentPriority"));
  v7 = NSNumber;
  uint64_t v8 = [v5 componentPriority];

  v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

- (int64_t)componentPriority
{
  return self->_componentPriority;
}

@end