@interface WFContentCoercionSearch
+ (id)searchForCoercingItem:(id)a3 toItemClass:(Class)a4 options:(id)a5;
+ (id)searchForCoercingItem:(id)a3 toItemClasses:(id)a4 options:(id)a5;
+ (id)searchForCoercingItem:(id)a3 toType:(id)a4 options:(id)a5;
- (BOOL)goalTest:(id)a3;
- (BOOL)isCoercionPathAllowedForNode:(id)a3;
- (NSArray)goalItemClasses;
- (NSMutableArray)agenda;
- (NSMutableOrderedSet)visitedStates;
- (WFCoercionOptions)options;
- (WFContentCoercionNode)startNode;
- (WFContentCoercionSearch)initWithStartNode:(id)a3 goalItemClasses:(id)a4 goalType:(id)a5 options:(id)a6;
- (WFType)goalType;
- (id)badCoercionError;
- (id)continueCoercionWithContentItems:(id)a3 error:(id *)a4;
- (id)nextPathNode;
- (id)runCoercionSynchronouslyWithError:(id *)a3;
- (void)continueCoercionWithContentItems:(id)a3 error:(id)a4 handler:(id)a5;
- (void)runCoercion:(id)a3;
@end

@implementation WFContentCoercionSearch

+ (id)searchForCoercingItem:(id)a3 toType:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  v12 = +[WFContentCoercionNode coercionNodeWithItem:v10 parent:0];

  v13 = (void *)[v11 initWithStartNode:v12 goalItemClasses:0 goalType:v9 options:v8];
  return v13;
}

+ (id)searchForCoercingItem:(id)a3 toItemClasses:(id)a4 options:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  v12 = +[WFContentCoercionNode coercionNodeWithItem:v10 parent:0];

  v13 = (void *)[v11 initWithStartNode:v12 goalItemClasses:v9 goalType:0 options:v8];
  return v13;
}

+ (id)searchForCoercingItem:(id)a3 toItemClass:(Class)a4 options:(id)a5
{
  v15[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc((Class)a1);
  id v11 = +[WFContentCoercionNode coercionNodeWithItem:v9 parent:0];

  v15[0] = a4;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  v13 = (void *)[v10 initWithStartNode:v11 goalItemClasses:v12 goalType:0 options:v8];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agenda, 0);
  objc_storeStrong((id *)&self->_visitedStates, 0);
  objc_storeStrong((id *)&self->_goalType, 0);
  objc_storeStrong((id *)&self->_goalItemClasses, 0);
  objc_storeStrong((id *)&self->_startNode, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (NSMutableArray)agenda
{
  return self->_agenda;
}

- (NSMutableOrderedSet)visitedStates
{
  return self->_visitedStates;
}

- (WFType)goalType
{
  return self->_goalType;
}

- (NSArray)goalItemClasses
{
  return self->_goalItemClasses;
}

- (WFContentCoercionNode)startNode
{
  return self->_startNode;
}

- (WFCoercionOptions)options
{
  return self->_options;
}

- (id)continueCoercionWithContentItems:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else if (a4 {
         && *a4
  }
         && !+[WFContentItem errorIsBadCoercionError:](WFContentItem, "errorIsBadCoercionError:"))
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [(WFContentCoercionSearch *)self nextPathNode];
    if (v9)
    {
      id v10 = [(WFContentCoercionSearch *)self options];
      id v11 = [v9 runCoercionSynchronouslyWithOptions:v10 error:a4];

      id v8 = [(WFContentCoercionSearch *)self continueCoercionWithContentItems:v11 error:a4];
    }
    else if (a4)
    {
      [(WFContentCoercionSearch *)self badCoercionError];
      id v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (id)runCoercionSynchronouslyWithError:(id *)a3
{
  return [(WFContentCoercionSearch *)self continueCoercionWithContentItems:0 error:a3];
}

- (void)continueCoercionWithContentItems:(id)a3 error:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v8)
  {
    v12 = (void (*)(void))*((void *)v10 + 2);
LABEL_3:
    v12();
    goto LABEL_11;
  }
  if (v9 && !+[WFContentItem errorIsBadCoercionError:v9])
  {
    v12 = (void (*)(void))v11[2];
    goto LABEL_3;
  }
  v13 = [(WFContentCoercionSearch *)self nextPathNode];
  if (v13)
  {
    v14 = [(WFContentCoercionSearch *)self options];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __74__WFContentCoercionSearch_continueCoercionWithContentItems_error_handler___block_invoke;
    v16[3] = &unk_26428ACE8;
    v16[4] = self;
    v17 = v11;
    [v13 runCoercionWithOptions:v14 completionHandler:v16];
  }
  else
  {
    v15 = [(WFContentCoercionSearch *)self badCoercionError];
    ((void (*)(void *, void, void *))v11[2])(v11, 0, v15);
  }
LABEL_11:
}

uint64_t __74__WFContentCoercionSearch_continueCoercionWithContentItems_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) continueCoercionWithContentItems:a2 error:a3 handler:*(void *)(a1 + 40)];
}

- (void)runCoercion:(id)a3
{
}

- (id)badCoercionError
{
  v3 = [(WFContentCoercionSearch *)self startNode];
  v4 = [v3 itemOrItemClass];
  v5 = objc_opt_class();

  id v6 = [(WFContentCoercionSearch *)self goalItemClasses];

  if (v6)
  {
    v7 = [(WFContentCoercionSearch *)self goalItemClasses];
    [v5 badCoercionErrorForItemClasses:v7];
  }
  else
  {
    v7 = [(WFContentCoercionSearch *)self goalType];
    [v5 badCoercionErrorForType:v7];
  id v8 = };

  return v8;
}

- (id)nextPathNode
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  v3 = [(WFContentCoercionSearch *)self agenda];
  if (![v3 count]) {
    goto LABEL_27;
  }
  v42 = self;
  v4 = v53;
  v40 = v3;
  while (1)
  {
    id v5 = [v3 objectAtIndex:0];
    [v3 removeObjectAtIndex:0];
    id v6 = [v5 itemOrItemClass];
    BOOL v7 = [(WFContentCoercionSearch *)v42 goalTest:v6];

    if (v7) {
      break;
    }
    id v8 = [(WFContentCoercionSearch *)v42 options];
    id v9 = [(WFContentCoercionSearch *)v42 goalType];
    id v10 = [v5 successorsWithOptions:v8 goalType:v9];
    id v11 = [v10 array];
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __39__WFContentCoercionSearch_nextPathNode__block_invoke;
    v53[3] = &unk_26428AD10;
    id v39 = v5;
    os_log_t log = (os_log_t)v5;
    os_log_t v54 = log;
    v12 = objc_msgSend(v11, "if_map:", v53);

    [v3 addObjectsFromArray:v12];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    obuint64_t j = v12;
    uint64_t v13 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (!v13) {
      goto LABEL_25;
    }
    uint64_t v14 = v13;
    v15 = v42;
    uint64_t v43 = *(void *)v50;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v50 != v43) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v18 = [v17 itemOrItemClass];
        uint64_t v19 = objc_opt_class();
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        v20 = [log itemOrItemClassPath];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v55 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          char v23 = 0;
          uint64_t v24 = *(void *)v46;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v46 != v24) {
                objc_enumerationMutation(v20);
              }
              v23 |= objc_opt_class() == v19;
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v45 objects:v55 count:16];
          }
          while (v22);

          v15 = v42;
          if (v23)
          {
            [v40 removeObject:v17];
            goto LABEL_23;
          }
        }
        else
        {
        }
        if ([(WFContentCoercionSearch *)v15 goalTest:v18]
          && [(WFContentCoercionSearch *)v15 isCoercionPathAllowedForNode:v17])
        {
          v26 = getWFContentGraphLogObject();
          v3 = v40;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            v27 = [(WFContentCoercionSearch *)v15 startNode];
            v28 = [v27 itemOrItemClass];
            v29 = [(WFContentCoercionSearch *)v15 goalItemClasses];
            v30 = v29;
            if (!v29)
            {
              uint64_t i = [(WFContentCoercionSearch *)v15 goalType];
              v30 = [(id)i typeDescription];
            }
            v31 = [v17 itemOrItemClassPath];
            *(_DWORD *)buf = 136315906;
            v58 = "-[WFContentCoercionSearch nextPathNode]";
            __int16 v59 = 2112;
            v60 = v28;
            __int16 v61 = 2112;
            v62 = v30;
            __int16 v63 = 2112;
            v64 = v31;
            _os_log_impl(&dword_216505000, v26, OS_LOG_TYPE_INFO, "%s Found coercion path from %@ to %@: %@", buf, 0x2Au);

            if (!v29)
            {
            }
          }

          [v40 removeObject:v17];
          id v5 = v17;

          goto LABEL_35;
        }
LABEL_23:
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
      if (v14) {
        continue;
      }
      break;
    }
LABEL_25:

    v3 = v40;
    id v5 = v39;
    v4 = v53;
LABEL_26:

    if (![v3 count])
    {
LABEL_27:
      id v5 = 0;
      goto LABEL_36;
    }
  }
  if (![(WFContentCoercionSearch *)v42 isCoercionPathAllowedForNode:v5]) {
    goto LABEL_26;
  }
  getWFContentGraphLogObject();
  os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v34 = [(WFContentCoercionSearch *)v42 startNode];
    v35 = [v34 itemOrItemClass];
    v36 = [(WFContentCoercionSearch *)v42 goalItemClasses];
    v37 = v36;
    if (!v36)
    {
      v4 = [(WFContentCoercionSearch *)v42 goalType];
      v37 = [v4 typeDescription];
    }
    v38 = [v5 itemOrItemClassPath];
    *(_DWORD *)buf = 136315906;
    v58 = "-[WFContentCoercionSearch nextPathNode]";
    __int16 v59 = 2112;
    v60 = v35;
    __int16 v61 = 2114;
    v62 = v37;
    __int16 v63 = 2112;
    v64 = v38;
    _os_log_impl(&dword_216505000, log, OS_LOG_TYPE_INFO, "%s Found coercion path from %@ to %{public}@: %@", buf, 0x2Au);

    if (!v36)
    {
    }
  }
LABEL_35:

LABEL_36:
  return v5;
}

WFContentCoercionNode *__39__WFContentCoercionSearch_nextPathNode__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFContentCoercionNode coercionNodeWithItemOrItemClass:a2 parent:*(void *)(a1 + 32)];
}

- (BOOL)goalTest:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFContentCoercionSearch *)self goalType];
  if (v5)
  {
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    long long v21 = 0uLL;
    long long v22 = 0uLL;
    id v6 = [v4 supportedTypes];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      uint64_t v10 = *MEMORY[0x263F1DA48];
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
        if ([v12 conformsToType:v5]) {
          break;
        }
        if ([v5 conformsToType:v12])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v5 isCoreType])
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && [v12 isCoreType]
                && ![v12 isEqualToUTType:v10])
              {
                break;
              }
            }
          }
        }
        if (v8 == ++v11)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_16;
        }
      }
LABEL_26:
      LOBYTE(v13) = 1;
      goto LABEL_27;
    }
LABEL_16:
    LOBYTE(v13) = 0;
  }
  else
  {
    long long v19 = 0uLL;
    long long v20 = 0uLL;
    *((void *)&v17 + 1) = 0;
    long long v18 = 0uLL;
    id v6 = [(WFContentCoercionSearch *)self goalItemClasses];
    uint64_t v13 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v18;
LABEL_19:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v6);
        }
        if ([(id)objc_opt_class() isSubclassOfClass:*(void *)(*((void *)&v17 + 1) + 8 * v15)]) {
          goto LABEL_26;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v13) {
            goto LABEL_19;
          }
          break;
        }
      }
    }
  }
LABEL_27:

  return v13;
}

- (BOOL)isCoercionPathAllowedForNode:(id)a3
{
  id v4 = [a3 coercionPath];
  id v5 = [(WFContentCoercionSearch *)self goalType];

  if (v5)
  {
    id v6 = +[WFContentItemRegistry sharedRegistry];
    uint64_t v7 = [(WFContentCoercionSearch *)self goalType];
    uint64_t v8 = [v6 contentItemClassForType:v7];

    if (v8)
    {
      uint64_t v9 = [v4 orderedSetByAddingObject:v8];

      id v4 = (void *)v9;
    }
  }
  uint64_t v10 = [(WFContentCoercionSearch *)self options];
  char v11 = [v10 coercionPathIsDisallowed:v4] ^ 1;

  return v11;
}

- (WFContentCoercionSearch)initWithStartNode:(id)a3 goalItemClasses:(id)a4 goalType:(id)a5 options:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [(WFContentCoercionSearch *)self init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_startNode, a3);
    objc_storeStrong((id *)&v16->_goalItemClasses, a4);
    objc_storeStrong((id *)&v16->_goalType, a5);
    uint64_t v17 = [MEMORY[0x263EFF980] arrayWithObject:v11];
    agenda = v16->_agenda;
    v16->_agenda = (NSMutableArray *)v17;

    objc_storeStrong((id *)&v16->_options, a6);
    long long v19 = v16;
  }

  return v16;
}

@end