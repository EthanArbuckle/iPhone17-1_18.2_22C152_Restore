@interface WFContentQuery
- (BOOL)canEvaluateObjects:(id)a3 withPropertySubstitutor:(id)a4;
- (NSArray)sortDescriptors;
- (NSDictionary)userInfo;
- (NSSet)containedProperties;
- (WFContentPredicate)predicate;
- (WFContentQuery)initWithPredicate:(id)a3;
- (_WFContentSlice)slice;
- (id)description;
- (void)runWithObjects:(id)a3 completionHandler:(id)a4;
- (void)runWithObjects:(id)a3 propertySubstitutor:(id)a4 completionHandler:(id)a5;
- (void)setSlice:(_WFContentSlice)a3;
- (void)setSortDescriptors:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation WFContentQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (void)setUserInfo:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setSlice:(_WFContentSlice)a3
{
  self->_slice = a3;
}

- (_WFContentSlice)slice
{
  unint64_t endIndex = self->_slice.endIndex;
  unint64_t startIndex = self->_slice.startIndex;
  result.unint64_t endIndex = endIndex;
  result.unint64_t startIndex = startIndex;
  return result;
}

- (void)setSortDescriptors:(id)a3
{
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (WFContentPredicate)predicate
{
  return self->_predicate;
}

- (BOOL)canEvaluateObjects:(id)a3 withPropertySubstitutor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFContentQuery *)self containedProperties];
  char HaveProperties = WFContentObjectsHaveProperties(v7, v8, v6);

  return HaveProperties;
}

- (NSSet)containedProperties
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  v4 = [(WFContentQuery *)self predicate];

  if (v4)
  {
    v5 = [(WFContentQuery *)self predicate];
    id v6 = [v5 containedProperties];
    [v3 unionSet:v6];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [(WFContentQuery *)self sortDescriptors];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) containedProperties];
        [v3 unionSet:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return (NSSet *)v3;
}

- (void)runWithObjects:(id)a3 propertySubstitutor:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v10)
  {
    if (v8)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __71__WFContentQuery_runWithObjects_propertySubstitutor_completionHandler___block_invoke;
      v15[3] = &unk_2642891B0;
      v15[4] = self;
      id v16 = v9;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __71__WFContentQuery_runWithObjects_propertySubstitutor_completionHandler___block_invoke_3;
      v12[3] = &unk_2642891D8;
      v12[4] = self;
      id v13 = v11;
      id v14 = v16;
      objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v15, v12);
    }
    else
    {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

void __71__WFContentQuery_runWithObjects_propertySubstitutor_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) predicate];
  uint64_t v9 = *(void *)(a1 + 40);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__WFContentQuery_runWithObjects_propertySubstitutor_completionHandler___block_invoke_2;
  v12[3] = &unk_264289188;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [v8 evaluateWithObject:v10 propertySubstitutor:v9 completionHandler:v12];
}

void __71__WFContentQuery_runWithObjects_propertySubstitutor_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) sortDescriptors];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __71__WFContentQuery_runWithObjects_propertySubstitutor_completionHandler___block_invoke_4;
    v7[3] = &unk_26428A598;
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = *(id *)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    id v8 = v6;
    [v3 sortedArrayUsingContentSortDescriptors:v4 propertySubstitutor:v5 completionHandler:v7];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __71__WFContentQuery_runWithObjects_propertySubstitutor_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = a2;
  uint64_t v5 = [v3 slice];
  WFIndexSetFromContentSlice(v5, v6, [v4 count]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v4 objectsAtIndexes:v8];

  (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v7, 0);
}

uint64_t __71__WFContentQuery_runWithObjects_propertySubstitutor_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, v4, 0);
}

- (void)runWithObjects:(id)a3 completionHandler:(id)a4
{
}

- (id)description
{
  long long v17 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [(WFContentQuery *)self predicate];
  uint64_t v6 = [(WFContentQuery *)self sortDescriptors];
  uint64_t v7 = [(WFContentQuery *)self slice];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  id v11 = NSString;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = &stru_26C71CE08;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lu", v7);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = [v11 stringWithFormat:@"[%@:%@]", v12, &stru_26C71CE08];
  }
  else
  {
    id v14 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v10);
    id v13 = [v11 stringWithFormat:@"[%@:%@]", v12, v14];
  }
  if (v8 != 0x7FFFFFFFFFFFFFFFLL) {

  }
  long long v15 = [v17 stringWithFormat:@"<%@: %p, predicate: %@, sortDescriptors: %@, slice: %@>", v4, self, v5, v6, v13];

  return v15;
}

- (WFContentQuery)initWithPredicate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFContentQuery;
  uint64_t v5 = [(WFContentQuery *)&v10 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = (WFContentPredicate *)v4;
    }
    else
    {
      uint64_t v6 = +[WFContentPredicate truePredicate];
    }
    predicate = v5->_predicate;
    v5->_predicate = v6;

    v5->_slice = (_WFContentSlice)WFContentSliceAll;
    uint64_t v8 = v5;
  }

  return v5;
}

@end