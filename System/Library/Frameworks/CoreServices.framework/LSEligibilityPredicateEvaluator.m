@interface LSEligibilityPredicateEvaluator
+ (id)sharedCachingEligibilityPredicateEvaluator;
- (LSEligibilityPredicateEvaluator)initWithResolver:(id)a3;
- (id)evaluateBundle:(unsigned int)a3 bundleData:(const LSBundleData *)a4 database:(id)a5 error:(id *)a6;
- (id)evaluatePredicate:(id)a3 error:(id *)a4;
@end

@implementation LSEligibilityPredicateEvaluator

- (LSEligibilityPredicateEvaluator)initWithResolver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSEligibilityPredicateEvaluator;
  v6 = [(LSEligibilityPredicateEvaluator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resolver, a3);
  }

  return v7;
}

- (id)evaluatePredicate:(id)a3 error:(id *)a4
{
  v4 = [a3 evaluateWithDomainEligibilityResolver:self->_resolver error:a4];

  return v4;
}

- (void).cxx_destruct
{
}

+ (id)sharedCachingEligibilityPredicateEvaluator
{
  if (+[LSEligibilityPredicateEvaluator(LSInternalCachingEvaluator) sharedCachingEligibilityPredicateEvaluator]::onceToken != -1) {
    dispatch_once(&+[LSEligibilityPredicateEvaluator(LSInternalCachingEvaluator) sharedCachingEligibilityPredicateEvaluator]::onceToken, &__block_literal_global_11);
  }
  v2 = (void *)+[LSEligibilityPredicateEvaluator(LSInternalCachingEvaluator) sharedCachingEligibilityPredicateEvaluator]::result;

  return v2;
}

void __105__LSEligibilityPredicateEvaluator_LSInternalCachingEvaluator__sharedCachingEligibilityPredicateEvaluator__block_invoke()
{
  v2 = objc_alloc_init(LSEligibilityCacheEligibilityResolver);
  v0 = [[LSEligibilityPredicateEvaluator alloc] initWithResolver:v2];
  v1 = (void *)+[LSEligibilityPredicateEvaluator(LSInternalCachingEvaluator) sharedCachingEligibilityPredicateEvaluator]::result;
  +[LSEligibilityPredicateEvaluator(LSInternalCachingEvaluator) sharedCachingEligibilityPredicateEvaluator]::result = (uint64_t)v0;
}

- (id)evaluateBundle:(unsigned int)a3 bundleData:(const LSBundleData *)a4 database:(id)a5 error:(id *)a6
{
  id v14 = 0;
  id v15 = 0;
  if (+[LSEligibilityPredicate getInstallationPredicate:&v15 uninstallationPredicate:&v14 forBundle:*(void *)&a3 bundleData:a4 database:a5 error:a6])
  {
    if (v15)
    {
      id v13 = 0;
      v7 = [(LSEligibilityPredicateEvaluator *)self evaluatePredicate:v15 error:&v13];
      id v8 = v13;
      if (!v7)
      {
        objc_super v9 = 0;
        goto LABEL_17;
      }
      if (([v7 BOOLValue] & 1) == 0)
      {
        objc_super v9 = (void *)MEMORY[0x1E4F1CC28];
        goto LABEL_17;
      }
    }
    else
    {
      id v8 = 0;
    }
    objc_super v9 = (void *)MEMORY[0x1E4F1CC38];
    if (!v14)
    {
LABEL_18:

      goto LABEL_19;
    }
    id v12 = v8;
    v7 = [(LSEligibilityPredicateEvaluator *)self evaluatePredicate:v14 error:&v12];
    id v10 = v12;

    if (v7)
    {
      if ([v7 BOOLValue]) {
        objc_super v9 = (void *)MEMORY[0x1E4F1CC28];
      }
    }
    else
    {
      objc_super v9 = 0;
    }
    id v8 = v10;
LABEL_17:

    goto LABEL_18;
  }
  objc_super v9 = 0;
LABEL_19:

  return v9;
}

@end