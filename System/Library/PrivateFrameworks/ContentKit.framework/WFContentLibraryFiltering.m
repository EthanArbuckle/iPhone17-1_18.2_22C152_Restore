@interface WFContentLibraryFiltering
+ (void)getItemsMatchingQuery:(id)a3 withInput:(id)a4 compoundPredicate:(id)a5 resultHandler:(id)a6;
+ (void)getItemsMatchingQuery:(id)a3 withInput:(id)a4 resultHandler:(id)a5;
+ (void)performCustomFilteringUsingContentPredicates:(id)a3 compoundPredicateType:(unint64_t)a4 forQuery:(id)a5 withInput:(id)a6 resultHandler:(id)a7;
+ (void)performFallbackFilteringWithItems:(id)a3 withContentPredicates:(id)a4 compoundPredicateType:(unint64_t)a5 originalQuery:(id)a6 resultHandler:(id)a7;
@end

@implementation WFContentLibraryFiltering

+ (void)performCustomFilteringUsingContentPredicates:(id)a3 compoundPredicateType:(unint64_t)a4 forQuery:(id)a5 withInput:(id)a6 resultHandler:(id)a7
{
}

+ (void)getItemsMatchingQuery:(id)a3 withInput:(id)a4 resultHandler:(id)a5
{
  v14[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 predicate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
  }
  else
  {
    v14[0] = v11;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    id v12 = +[WFContentCompoundPredicate andPredicateWithSubpredicates:v13];
  }
  [a1 getItemsMatchingQuery:v8 withInput:v9 compoundPredicate:v12 resultHandler:v10];
}

+ (void)getItemsMatchingQuery:(id)a3 withInput:(id)a4 compoundPredicate:(id)a5 resultHandler:(id)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  v13 = [v12 subpredicates];
  uint64_t v14 = [v12 compoundPredicateType];

  if ([v13 count] == 1
    && (unint64_t)(v14 - 1) <= 1
    && ([v13 firstObject],
        v15 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v15,
        (isKindOfClass & 1) != 0))
  {
    v17 = [v13 firstObject];
    [a1 getItemsMatchingQuery:v18 withInput:v10 compoundPredicate:v17 resultHandler:v11];
  }
  else
  {
    [a1 performCustomFilteringUsingContentPredicates:v13 compoundPredicateType:v14 forQuery:v18 withInput:v10 resultHandler:v11];
  }
}

+ (void)performFallbackFilteringWithItems:(id)a3 withContentPredicates:(id)a4 compoundPredicateType:(unint64_t)a5 originalQuery:(id)a6 resultHandler:(id)a7
{
  id v20 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  if ([v11 count]) {
    uint64_t v14 = [[WFContentCompoundPredicate alloc] initWithType:a5 subpredicates:v11];
  }
  else {
    uint64_t v14 = 0;
  }
  v15 = [[WFContentQuery alloc] initWithPredicate:v14];
  if (v12)
  {
    v16 = [v12 sortDescriptors];
    [(WFContentQuery *)v15 setSortDescriptors:v16];

    uint64_t v17 = [v12 slice];
    -[WFContentQuery setSlice:](v15, "setSlice:", v17, v18);
    v19 = [v12 userInfo];
    [(WFContentQuery *)v15 setUserInfo:v19];
  }
  [(WFContentQuery *)v15 runWithObjects:v20 completionHandler:v13];
}

@end