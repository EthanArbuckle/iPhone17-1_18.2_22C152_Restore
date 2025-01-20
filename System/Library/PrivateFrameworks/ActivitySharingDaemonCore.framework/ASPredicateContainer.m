@interface ASPredicateContainer
+ (id)predicateMatchingAllPredicates:(id)a3;
+ (id)predicateMatchingAnyPredicates:(id)a3;
- (ASPredicateContainer)initWithHealthKitPredicate:(id)a3 healthDaemonPredicate:(id)a4;
- (HDSQLitePredicate)healthDaemonPredicate;
- (NSPredicate)healthKitPredicate;
@end

@implementation ASPredicateContainer

- (ASPredicateContainer)initWithHealthKitPredicate:(id)a3 healthDaemonPredicate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASPredicateContainer;
  v9 = [(ASPredicateContainer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthKitPredicate, a3);
    objc_storeStrong((id *)&v10->_healthDaemonPredicate, a4);
  }

  return v10;
}

+ (id)predicateMatchingAllPredicates:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "hk_map:", &__block_literal_global_17);
  v5 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v4];
  v6 = objc_msgSend(v3, "hk_map:", &__block_literal_global_283);

  id v7 = [MEMORY[0x263F434A8] predicateMatchingAllPredicates:v6];
  id v8 = [[ASPredicateContainer alloc] initWithHealthKitPredicate:v5 healthDaemonPredicate:v7];

  return v8;
}

uint64_t __55__ASPredicateContainer_predicateMatchingAllPredicates___block_invoke(uint64_t a1, void *a2)
{
  return [a2 healthKitPredicate];
}

uint64_t __55__ASPredicateContainer_predicateMatchingAllPredicates___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 healthDaemonPredicate];
}

+ (id)predicateMatchingAnyPredicates:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "hk_map:", &__block_literal_global_287);
  v5 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v4];
  v6 = objc_msgSend(v3, "hk_map:", &__block_literal_global_289);

  id v7 = [MEMORY[0x263F434A8] predicateMatchingAnyPredicates:v6];
  id v8 = [[ASPredicateContainer alloc] initWithHealthKitPredicate:v5 healthDaemonPredicate:v7];

  return v8;
}

uint64_t __55__ASPredicateContainer_predicateMatchingAnyPredicates___block_invoke(uint64_t a1, void *a2)
{
  return [a2 healthKitPredicate];
}

uint64_t __55__ASPredicateContainer_predicateMatchingAnyPredicates___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 healthDaemonPredicate];
}

- (NSPredicate)healthKitPredicate
{
  return self->_healthKitPredicate;
}

- (HDSQLitePredicate)healthDaemonPredicate
{
  return self->_healthDaemonPredicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthDaemonPredicate, 0);
  objc_storeStrong((id *)&self->_healthKitPredicate, 0);
}

@end