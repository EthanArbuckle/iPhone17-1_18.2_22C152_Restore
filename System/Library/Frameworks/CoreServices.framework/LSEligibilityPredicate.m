@interface LSEligibilityPredicate
+ (BOOL)getInstallationPredicate:(id *)a3 uninstallationPredicate:(id *)a4 forBundle:(unsigned int)a5 bundleData:(const LSBundleData *)a6 database:(id)a7 error:(id *)a8;
- (LSEligibilityPredicate)initWithDictionary:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)description;
- (id)evaluateWithDomainEligibilityResolver:(id)a3 error:(id *)a4;
@end

@implementation LSEligibilityPredicate

- (LSEligibilityPredicate)initWithDictionary:(id)a3 error:(id *)a4
{
  LaunchServices::EligibilityPredicateEvaluation::Predicate::parse_dictionary(a3, a4, (uint64_t)v10);
  if (!v11)
  {

LABEL_5:
    v7 = 0;
    goto LABEL_8;
  }
  v9.receiver = self;
  v9.super_class = (Class)LSEligibilityPredicate;
  v6 = [(LSEligibilityPredicate *)&v9 init];
  v7 = v6;
  if (v6)
  {
    LaunchServices::DelayedInitable<LaunchServices::EligibilityPredicateEvaluation::Predicate>::emplace<LaunchServices::EligibilityPredicateEvaluation::Predicate>((uint64_t)&v6->_predicate, v10);
    goto LABEL_8;
  }
  if (!a4) {
    goto LABEL_5;
  }
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28798], 12, (uint64_t)"-[LSEligibilityPredicate initWithDictionary:error:]", 145, 0);
  v7 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  if (v11) {
    std::__tree<std::__value_type<os_eligibility_domain_t,std::vector<os_eligibility_answer_t>>,std::__map_value_compare<os_eligibility_domain_t,std::__value_type<os_eligibility_domain_t,std::vector<os_eligibility_answer_t>>,std::less<os_eligibility_domain_t>,true>,std::allocator<std::__value_type<os_eligibility_domain_t,std::vector<os_eligibility_answer_t>>>>::destroy((uint64_t)v10, (void *)v10[1]);
  }
  return v7;
}

- (id)evaluateWithDomainEligibilityResolver:(id)a3 error:(id *)a4
{
  unsigned __int16 v4 = LaunchServices::EligibilityPredicateEvaluation::Predicate::evaluate(&self->_predicate._storage.var0.__val_._match_map.__tree_.__begin_node_, a3, (uint64_t)a4);
  if (v4 >= 0x100u)
  {
    v6 = (id *)MEMORY[0x1E4F1CFC8];
    if ((_BYTE)v4) {
      v6 = (id *)MEMORY[0x1E4F1CFD0];
    }
    id v5 = *v6;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  LaunchServices::EligibilityPredicateEvaluation::Predicate::to_string((uint64_t *)__p, (LaunchServices::EligibilityPredicateEvaluation::Predicate *)&self->_predicate);
  if (v9 >= 0) {
    id v5 = __p;
  }
  else {
    id v5 = (void **)__p[0];
  }
  v6 = [v3 stringWithFormat:@"<%@ %p %s>", v4, self, v5];
  if (v9 < 0) {
    operator delete(__p[0]);
  }

  return v6;
}

- (void).cxx_destruct
{
  if (self->_predicate._storage.__engaged_) {
    std::__tree<std::__value_type<os_eligibility_domain_t,std::vector<os_eligibility_answer_t>>,std::__map_value_compare<os_eligibility_domain_t,std::__value_type<os_eligibility_domain_t,std::vector<os_eligibility_answer_t>>,std::less<os_eligibility_domain_t>,true>,std::allocator<std::__value_type<os_eligibility_domain_t,std::vector<os_eligibility_answer_t>>>>::destroy((uint64_t)&self->_predicate, (void *)self->_predicate._storage.var0.__val_._match_map.__tree_.__pair1_.__value_.__left_);
  }
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 32) = 0;
  return self;
}

+ (BOOL)getInstallationPredicate:(id *)a3 uninstallationPredicate:(id *)a4 forBundle:(unsigned int)a5 bundleData:(const LSBundleData *)a6 database:(id)a7 error:(id *)a8
{
  id v12 = a7;
  v13 = +[_LSLazyPropertyList lazyPropertyListWithDatabase:v12 unit:a6->base.infoDictionary];
  v14 = [v13 objectForKey:@"LSEligibilityInstallPredicate" ofClass:objc_opt_class()];
  if (!v14)
  {
    v15 = 0;
LABEL_5:
    v17 = [v13 objectForKey:@"LSEligibilityUninstallPredicate" ofClass:objc_opt_class()];
    if (v17)
    {
      v18 = [[LSEligibilityPredicate alloc] initWithDictionary:v17 error:a8];
      if (!v18)
      {
        BOOL v16 = 0;
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      v18 = 0;
    }
    objc_storeStrong(a3, v15);
    id v19 = *a4;
    *a4 = v18;
    v20 = v18;

    BOOL v16 = 1;
    goto LABEL_10;
  }
  v15 = [[LSEligibilityPredicate alloc] initWithDictionary:v14 error:a8];
  if (v15) {
    goto LABEL_5;
  }
  BOOL v16 = 0;
LABEL_11:

  return v16;
}

@end