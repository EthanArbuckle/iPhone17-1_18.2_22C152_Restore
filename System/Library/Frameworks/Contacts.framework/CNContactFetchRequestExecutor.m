@interface CNContactFetchRequestExecutor
- (id)initWithDataMapper:(id *)a1;
- (void)observableForFetchRequest:(void *)a1;
@end

@implementation CNContactFetchRequestExecutor

- (void).cxx_destruct
{
}

- (void)observableForFetchRequest:(void *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = -[CNContactFetchRequestExecutorPredicateEvaluator initWithFetchRequestPrototype:dataMapper:]((id *)[CNContactFetchRequestExecutorPredicateEvaluator alloc], v3, v2[1]);
    v5 = [v3 predicate];

    -[CNContactFetchRequestExecutorPredicateEvaluator evaluatePredicate:](v4, v5);
    -[CNContactFetchRequestExecutorPredicateEvaluator observable](v4);
    v2 = (void **)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

- (id)initWithDataMapper:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)CNContactFetchRequestExecutor;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

@end