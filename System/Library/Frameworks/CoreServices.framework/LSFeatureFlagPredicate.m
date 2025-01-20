@interface LSFeatureFlagPredicate
+ (id)featureFlagPredicateForBundle:(unsigned int)a3 bundleData:(const LSBundleData *)a4 database:(id)a5 error:(id *)a6;
- (BOOL)evaluateWithFeatureFlagResolver:(id)a3;
- (LSFeatureFlagPredicate)initWithDictionary:(id)a3 error:(id *)a4;
- (id).cxx_construct;
@end

@implementation LSFeatureFlagPredicate

+ (id)featureFlagPredicateForBundle:(unsigned int)a3 bundleData:(const LSBundleData *)a4 database:(id)a5 error:(id *)a6
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v7 = +[_LSLazyPropertyList lazyPropertyListWithDatabase:a5 unit:a4->base.infoDictionary];
  v8 = [v7 objectForKey:@"LSRequiredFeatureFlags" ofClass:objc_opt_class()];
  if (v8)
  {
    a6 = [[LSFeatureFlagPredicate alloc] initWithDictionary:v8 error:a6];
  }
  else if (a6)
  {
    v9 = (void *)*MEMORY[0x1E4F28760];
    uint64_t v12 = *MEMORY[0x1E4F28228];
    v13[0] = @"tried to make reature flag predicate for bundle with no feature flag predicate";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    _LSMakeNSErrorImpl(v9, -43, (uint64_t)"+[LSFeatureFlagPredicate(LSBundleDataPredicate) featureFlagPredicateForBundle:bundleData:database:error:]", 24, v10);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
  }

  return a6;
}

- (LSFeatureFlagPredicate)initWithDictionary:(id)a3 error:(id *)a4
{
  LaunchServices::FeatureFlagPredicateEvaluation::Predicate::parse_dictionary(a3, a4, (uint64_t)v10);
  if (!v10[48])
  {

LABEL_5:
    v7 = 0;
    goto LABEL_8;
  }
  v9.receiver = self;
  v9.super_class = (Class)LSFeatureFlagPredicate;
  v6 = [(LSFeatureFlagPredicate *)&v9 init];
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 12, (uint64_t)"-[LSFeatureFlagPredicate initWithDictionary:error:]", 186, 0);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    goto LABEL_5;
  }
  LaunchServices::DelayedInitable<LaunchServices::FeatureFlagPredicateEvaluation::Predicate>::emplace<LaunchServices::FeatureFlagPredicateEvaluation::Predicate>((uint64_t)&v6->_predicate, (uint64_t)v10);
LABEL_8:
  std::__optional_destruct_base<LaunchServices::FeatureFlagPredicateEvaluation::Predicate,false>::~__optional_destruct_base[abi:nn180100]((uint64_t)v10);
  return v7;
}

- (BOOL)evaluateWithFeatureFlagResolver:(id)a3
{
  return LaunchServices::FeatureFlagPredicateEvaluation::Predicate::evaluate((uint64_t **)&self->_predicate, a3);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 56) = 0;
  return self;
}

@end