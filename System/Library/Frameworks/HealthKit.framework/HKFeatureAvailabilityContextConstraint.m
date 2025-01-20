@interface HKFeatureAvailabilityContextConstraint
+ (id)allContexts;
+ (id)onlySomeContexts:(id)a3;
- (BOOL)acceptsContext:(id)a3;
- (HKFeatureAvailabilityContextConstraint)initWithAcceptsContext:(id)a3;
- (id)acceptsContext;
@end

@implementation HKFeatureAvailabilityContextConstraint

- (HKFeatureAvailabilityContextConstraint)initWithAcceptsContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityContextConstraint;
  v5 = [(HKFeatureAvailabilityContextConstraint *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id acceptsContext = v5->_acceptsContext;
    v5->_id acceptsContext = v6;
  }
  return v5;
}

+ (id)allContexts
{
  v2 = (void *)[objc_alloc((Class)a1) initWithAcceptsContext:&__block_literal_global_11];

  return v2;
}

uint64_t __53__HKFeatureAvailabilityContextConstraint_allContexts__block_invoke()
{
  return 1;
}

+ (id)onlySomeContexts:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__HKFeatureAvailabilityContextConstraint_onlySomeContexts___block_invoke;
  v9[3] = &unk_1E58BEF40;
  id v10 = v4;
  id v6 = v4;
  v7 = (void *)[v5 initWithAcceptsContext:v9];

  return v7;
}

uint64_t __59__HKFeatureAvailabilityContextConstraint_onlySomeContexts___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (BOOL)acceptsContext:(id)a3
{
  return (*((uint64_t (**)(void))self->_acceptsContext + 2))();
}

- (id)acceptsContext
{
  return self->_acceptsContext;
}

- (void).cxx_destruct
{
}

@end