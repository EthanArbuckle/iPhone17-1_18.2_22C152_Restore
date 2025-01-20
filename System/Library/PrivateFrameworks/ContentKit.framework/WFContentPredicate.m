@interface WFContentPredicate
+ (id)falsePredicate;
+ (id)predicateWithBlock:(id)a3;
+ (id)truePredicate;
- (NSSet)containedProperties;
- (WFContentPredicate)initWithBlock:(id)a3;
- (void)evaluateWithObject:(id)a3 completionHandler:(id)a4;
- (void)evaluateWithObject:(id)a3 propertySubstitutor:(id)a4 completionHandler:(id)a5;
@end

@implementation WFContentPredicate

+ (id)predicateWithBlock:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithBlock:v4];

  return v5;
}

+ (id)falsePredicate
{
  v2 = objc_opt_new();
  return v2;
}

- (void).cxx_destruct
{
}

- (NSSet)containedProperties
{
  return (NSSet *)[MEMORY[0x263EFFA08] set];
}

- (void)evaluateWithObject:(id)a3 propertySubstitutor:(id)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  if (v9)
  {
    block = (uint64_t (**)(id, id))self->_block;
    if (block) {
      uint64_t v11 = block[2](block, v12);
    }
    else {
      uint64_t v11 = 0;
    }
    v9[2](v9, v11);
  }
}

- (void)evaluateWithObject:(id)a3 completionHandler:(id)a4
{
}

- (WFContentPredicate)initWithBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFContentPredicate;
  v5 = [(WFContentPredicate *)&v10 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id block = v5->_block;
    v5->_id block = v6;

    id v8 = v5;
  }

  return v5;
}

+ (id)truePredicate
{
  v2 = objc_opt_new();
  return v2;
}

@end