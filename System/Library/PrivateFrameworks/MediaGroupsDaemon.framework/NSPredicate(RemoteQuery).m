@interface NSPredicate(RemoteQuery)
- (uint64_t)rq_containsLocal;
- (uint64_t)rq_restrictedToLocal;
@end

@implementation NSPredicate(RemoteQuery)

- (uint64_t)rq_restrictedToLocal
{
  return objc_msgSend(a1, "mg_evaluateConstraint:", &__block_literal_global_2);
}

- (uint64_t)rq_containsLocal
{
  v2 = objc_msgSend(MEMORY[0x263F546D0], "rq_predicateForLocal");
  uint64_t v3 = [a1 isEqual:v2];

  return v3;
}

@end