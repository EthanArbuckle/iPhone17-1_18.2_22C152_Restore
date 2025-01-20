@interface HDSQLitePredicate
+ (id)BOOLeanPredicateWithValue:(BOOL)a3;
+ (id)compoundPredicateWithPredicate:(id)a3 otherPredicate:(id)a4;
+ (id)disjunctionWithPredicate:(id)a3 otherPredicate:(id)a4;
+ (id)falsePredicate;
+ (id)truePredicate;
- (BOOL)isCompatibleWithPredicate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)SQLForEntityClass:(Class)a3;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (unint64_t)hash;
@end

@implementation HDSQLitePredicate

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  return 0;
}

+ (id)compoundPredicateWithPredicate:(id)a3 otherPredicate:(id)a4
{
  v12[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v12[0] = v5;
    v12[1] = v6;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
    id v9 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v8];
  }
  else
  {
    if (v5) {
      v10 = v5;
    }
    else {
      v10 = v6;
    }
    id v9 = v10;
  }

  return v9;
}

+ (id)truePredicate
{
  if (truePredicate_onceToken != -1) {
    dispatch_once(&truePredicate_onceToken, &__block_literal_global_639);
  }
  v2 = (void *)truePredicate_truePredicate;

  return v2;
}

+ (id)disjunctionWithPredicate:(id)a3 otherPredicate:(id)a4
{
  v12[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v12[0] = v5;
    v12[1] = v6;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
    id v9 = +[HDSQLiteCompoundPredicate predicateMatchingAnyPredicates:v8];
  }
  else
  {
    if (v5) {
      v10 = v5;
    }
    else {
      v10 = v6;
    }
    id v9 = v10;
  }

  return v9;
}

- (id)SQLForEntityClass:(Class)a3
{
  return 0;
}

- (BOOL)isCompatibleWithPredicate:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  v2 = objc_opt_class();

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();

  return v4 == v5;
}

+ (id)BOOLeanPredicateWithValue:(BOOL)a3
{
  if (a3) {
    [a1 truePredicate];
  }
  else {
  id v3 = [a1 falsePredicate];
  }

  return v3;
}

+ (id)falsePredicate
{
  if (falsePredicate_onceToken != -1) {
    dispatch_once(&falsePredicate_onceToken, &__block_literal_global_636);
  }
  v2 = (void *)falsePredicate_falsePredicate;

  return v2;
}

uint64_t __48__HDSQLitePredicate_Convenience__falsePredicate__block_invoke()
{
  v0 = objc_alloc_init(HDSQLiteFalsePredicate);
  uint64_t v1 = falsePredicate_falsePredicate;
  falsePredicate_falsePredicate = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __47__HDSQLitePredicate_Convenience__truePredicate__block_invoke()
{
  v0 = objc_alloc_init(HDSQLiteTruePredicate);
  uint64_t v1 = truePredicate_truePredicate;
  truePredicate_truePredicate = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end