@interface WFContentCompoundPredicate
+ (id)andPredicateWithSubpredicates:(id)a3;
+ (id)notPredicateWithSubpredicate:(id)a3;
+ (id)orPredicateWithSubpredicates:(id)a3;
- (NSArray)subpredicates;
- (NSSet)containedProperties;
- (WFContentCompoundPredicate)initWithType:(unint64_t)a3 subpredicates:(id)a4;
- (id)description;
- (unint64_t)compoundPredicateType;
- (void)evaluateWithObject:(id)a3 propertySubstitutor:(id)a4 completionHandler:(id)a5;
@end

@implementation WFContentCompoundPredicate

- (void).cxx_destruct
{
}

- (NSArray)subpredicates
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)compoundPredicateType
{
  return self->_compoundPredicateType;
}

- (NSSet)containedProperties
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(WFContentCompoundPredicate *)self subpredicates];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) containedProperties];
        [v3 unionSet:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (void)evaluateWithObject:(id)a3 propertySubstitutor:(id)a4 completionHandler:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v18 = a3;
  id v17 = a4;
  id v8 = a5;
  if (v8)
  {
    v9 = dispatch_group_create();
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy__10932;
    v31[4] = __Block_byref_object_dispose__10933;
    id v32 = 0;
    v10 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v11 = [(WFContentCompoundPredicate *)self subpredicates];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          dispatch_group_enter(v9);
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __87__WFContentCompoundPredicate_evaluateWithObject_propertySubstitutor_completionHandler___block_invoke;
          v22[3] = &unk_264287CF0;
          id v23 = v10;
          v24 = self;
          v26 = v31;
          v25 = v9;
          [v15 evaluateWithObject:v18 propertySubstitutor:v17 completionHandler:v22];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v12);
    }

    uint64_t v16 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__WFContentCompoundPredicate_evaluateWithObject_propertySubstitutor_completionHandler___block_invoke_2;
    block[3] = &unk_264287D18;
    id v20 = v8;
    v21 = v31;
    dispatch_group_notify(v9, v16, block);

    _Block_object_dispose(v31, 8);
  }
}

void __87__WFContentCompoundPredicate_evaluateWithObject_propertySubstitutor_completionHandler___block_invoke(uint64_t a1, unsigned int a2)
{
  [*(id *)(a1 + 32) lock];
  uint64_t v4 = ([*(id *)(a1 + 40) compoundPredicateType] == 0) ^ a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 40) compoundPredicateType];
    if (v5 == 1)
    {
      uint64_t v6 = NSNumber;
      uint64_t v7 = v4 & [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) BOOLValue];
    }
    else
    {
      if (v5 != 2) {
        goto LABEL_9;
      }
      uint64_t v6 = NSNumber;
      uint64_t v7 = v4 | [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) BOOLValue];
    }
    uint64_t v8 = [v6 numberWithInt:v7];
  }
  else
  {
    uint64_t v8 = [NSNumber numberWithBool:v4];
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

LABEL_9:
  [*(id *)(a1 + 32) unlock];
  long long v11 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v11);
}

uint64_t __87__WFContentCompoundPredicate_evaluateWithObject_propertySubstitutor_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2) {
    uint64_t v3 = [v2 BOOLValue];
  }
  else {
    uint64_t v3 = 1;
  }
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v4(v1, v3);
}

- (id)description
{
  unint64_t v3 = [(WFContentCompoundPredicate *)self compoundPredicateType];
  if (v3 > 2) {
    uint64_t v4 = @"unknown";
  }
  else {
    uint64_t v4 = (__CFString *)*((void *)&off_264287D38 + v3);
  }
  uint64_t v5 = NSString;
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [(WFContentCompoundPredicate *)self subpredicates];
  uint64_t v9 = [v5 stringWithFormat:@"<%@: %p, type: %@, subpredicates: %@>", v7, self, v4, v8];

  return v9;
}

- (WFContentCompoundPredicate)initWithType:(unint64_t)a3 subpredicates:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFContentCompoundPredicate;
  uint64_t v7 = [(WFContentCompoundPredicate *)&v13 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_compoundPredicateType = a3;
    uint64_t v9 = [v6 copy];
    subpredicates = v8->_subpredicates;
    v8->_subpredicates = (NSArray *)v9;

    long long v11 = v8;
  }

  return v8;
}

+ (id)notPredicateWithSubpredicate:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v9[0] = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

  uint64_t v7 = (void *)[v5 initWithType:0 subpredicates:v6];
  return v7;
}

+ (id)orPredicateWithSubpredicates:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithType:2 subpredicates:v4];

  return v5;
}

+ (id)andPredicateWithSubpredicates:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithType:1 subpredicates:v4];

  return v5;
}

@end