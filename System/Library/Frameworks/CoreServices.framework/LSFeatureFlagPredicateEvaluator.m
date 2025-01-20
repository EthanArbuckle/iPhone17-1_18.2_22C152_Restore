@interface LSFeatureFlagPredicateEvaluator
+ (id)defaultEvaluator;
+ (id)defaultResolver;
- (BOOL)evaluatePredicate:(id)a3;
- (LSFeatureFlagPredicateEvaluator)initWithResolver:(id)a3;
- (id)evaluateBundle:(unsigned int)a3 bundleData:(const LSBundleData *)a4 database:(id)a5 error:(id *)a6;
@end

@implementation LSFeatureFlagPredicateEvaluator

- (id)evaluateBundle:(unsigned int)a3 bundleData:(const LSBundleData *)a4 database:(id)a5 error:(id *)a6
{
  v7 = +[LSFeatureFlagPredicate featureFlagPredicateForBundle:*(void *)&a3 bundleData:a4 database:a5 error:a6];
  if (v7)
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[LSFeatureFlagPredicateEvaluator evaluatePredicate:](self, "evaluatePredicate:", v7));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (LSFeatureFlagPredicateEvaluator)initWithResolver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSFeatureFlagPredicateEvaluator;
  v6 = [(LSFeatureFlagPredicateEvaluator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resolver, a3);
  }

  return v7;
}

- (BOOL)evaluatePredicate:(id)a3
{
  return [a3 evaluateWithFeatureFlagResolver:self->_resolver];
}

+ (id)defaultResolver
{
  return +[_LSDefaultFeatureFlagResolver sharedInstance];
}

+ (id)defaultEvaluator
{
  if (+[LSFeatureFlagPredicateEvaluator defaultEvaluator]::onceToken != -1) {
    dispatch_once(&+[LSFeatureFlagPredicateEvaluator defaultEvaluator]::onceToken, &__block_literal_global_61);
  }
  v2 = (void *)+[LSFeatureFlagPredicateEvaluator defaultEvaluator]::evaluator;

  return v2;
}

void __51__LSFeatureFlagPredicateEvaluator_defaultEvaluator__block_invoke()
{
  v0 = [LSFeatureFlagPredicateEvaluator alloc];
  id v3 = +[_LSDefaultFeatureFlagResolver sharedInstance];
  uint64_t v1 = -[LSFeatureFlagPredicateEvaluator initWithResolver:](v0, "initWithResolver:");
  v2 = (void *)+[LSFeatureFlagPredicateEvaluator defaultEvaluator]::evaluator;
  +[LSFeatureFlagPredicateEvaluator defaultEvaluator]::evaluator = v1;
}

- (void).cxx_destruct
{
}

@end