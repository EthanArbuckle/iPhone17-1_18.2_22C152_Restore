@interface IKDOMBindingController
+ (id)_parsedMutationRulesForDOMElement:(id)a3;
+ (id)_prototypeGroupsByTypeForDOMElement:(id)a3;
+ (id)domBindingControllerForDOMElement:(id)a3;
+ (id)instantiateDOMElementForItem:(id)a3 withPrototype:(id)a4 parentDOMElement:(id)a5 existingDOMElement:(id)a6;
+ (id)parsedBindingForDOMElement:(id)a3;
+ (void)prepareForDOMElement:(id)a3;
- (BOOL)_canBeReused;
- (IKAppContext)appContext;
- (IKDOMBindingController)initWithDOMElement:(id)a3;
- (IKDOMBindingController)parent;
- (IKDOMBindingStrategy)strategy;
- (IKDOMElement)domElement;
- (IKDataBinding)binding;
- (IKJSDataItem)dataItem;
- (NSDictionary)prototypeGroupsByType;
- (_IKDOMMutationRuleSet)mutationRuleSet;
- (id)findPrototypeForDataItem:(id)a3;
- (unint64_t)resolutionTarget;
- (void)_evaluateMutationRules;
- (void)_resolveBinding;
- (void)dataObservable:(id)a3 didChangePropertyPathWithString:(id)a4 extraInfo:(id)a5;
- (void)dealloc;
- (void)scheduleUpdateUsingPreUpdate:(id)a3 update:(id)a4;
@end

@implementation IKDOMBindingController

+ (id)parsedBindingForDOMElement:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(v3, "domb_dataBinding");
  if (v4)
  {
    v5 = [v3 jsNodeData];
    int v6 = [v5 isBindingParsed];

    if (v6)
    {
      v7 = v4;
      goto LABEL_35;
    }
  }
  v41 = v4;
  v43 = [MEMORY[0x1E4F1CA48] array];
  v42 = v3;
  v40 = [v3 getAttribute:@"binding"];
  [v40 componentsSeparatedByString:@";"];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (!v8) {
    goto LABEL_34;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v47;
  unint64_t v11 = 0x1E4F28000uLL;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v47 != v10) {
        objc_enumerationMutation(obj);
      }
      v13 = [*(id *)(*((void *)&v46 + 1) + 8 * i) componentsSeparatedByString:@":"];
      if ([v13 count] == 2)
      {
        v14 = [v13 objectAtIndexedSubscript:0];
        v15 = [*(id *)(v11 + 2952) whitespaceCharacterSet];
        v16 = [v14 stringByTrimmingCharactersInSet:v15];

        v17 = [v13 objectAtIndexedSubscript:1];
        v18 = [*(id *)(v11 + 2952) whitespaceCharacterSet];
        v19 = [v17 stringByTrimmingCharactersInSet:v18];

        if ([v16 hasPrefix:@"prototype."])
        {
          v20 = [v16 substringFromIndex:objc_msgSend(@"prototype.", "length")];
          v21 = [*(id *)(v11 + 2952) whitespaceCharacterSet];
          uint64_t v22 = [v20 stringByTrimmingCharactersInSet:v21];

          v16 = (void *)v22;
          uint64_t v23 = 2;
        }
        else if ([v16 isEqualToString:@"dataItem"])
        {
          uint64_t v23 = 1;
        }
        else
        {
          uint64_t v23 = 4;
        }
        if ([v19 hasPrefix:@"{"]
          && ([v19 hasSuffix:@"}"] & 1) != 0)
        {
          char v24 = 0;
          goto LABEL_23;
        }
        if ([v19 hasSuffix:@"'"]
          && ([v19 hasPrefix:@"'"] & 1) != 0)
        {
          char v24 = 1;
          goto LABEL_23;
        }
        if ([v19 hasSuffix:@"\""])
        {
          char v24 = 1;
          if ([v19 hasPrefix:@"\""])
          {
LABEL_23:
            objc_msgSend(v19, "substringWithRange:", 1, objc_msgSend(v19, "length") - 2);
            v45 = v13;
            v25 = v16;
            v27 = char v26 = v24;
            v28 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
            [v27 stringByTrimmingCharactersInSet:v28];
            uint64_t v29 = v9;
            v31 = uint64_t v30 = v10;

            char v24 = v26;
            v16 = v25;
            v13 = v45;
            v19 = (void *)v31;
            uint64_t v10 = v30;
            uint64_t v9 = v29;
          }
        }
        else
        {
          char v24 = 1;
        }
        if ([v16 length])
        {
          if (v24)
          {
            v32 = [[IKDataBindingLiteral alloc] initWithLiteral:v19];
            goto LABEL_30;
          }
          if ([v19 length])
          {
            v32 = [[IKDataBindingPropertyPath alloc] initWithString:v19];
LABEL_30:
            v33 = v32;
            v34 = [[IKDataBindingEntry alloc] initWithKey:v16 value:v32 attributes:v23];
            [v43 addObject:v34];
          }
        }

        unint64_t v11 = 0x1E4F28000;
      }
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  }
  while (v9);
LABEL_34:
  v35 = [IKDataBinding alloc];
  v36 = (void *)[v43 copy];
  v37 = [(IKDataBinding *)v35 initWithEntries:v36];

  id v3 = v42;
  objc_msgSend(v42, "domb_setDataBinding:", v37);
  v38 = [v42 jsNodeData];
  [v38 setBindingParsed:1];

  v7 = v37;
LABEL_35:

  return v7;
}

+ (void)prepareForDOMElement:(id)a3
{
  id v5 = a3;
  id v3 = objc_msgSend(v5, "domb_domBindingController");
  if ([v3 _canBeReused])
  {
    [v3 _resolveBinding];
    [v3 _evaluateMutationRules];
  }
  else
  {
    v4 = [[IKDOMBindingController alloc] initWithDOMElement:v5];

    objc_msgSend(v5, "domb_setDOMBindingController:", v4);
    id v3 = v4;
  }
}

+ (id)domBindingControllerForDOMElement:(id)a3
{
  return (id)objc_msgSend(a3, "domb_domBindingController");
}

- (IKDOMBindingController)initWithDOMElement:(id)a3
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v111.receiver = self;
  v111.super_class = (Class)IKDOMBindingController;
  id v5 = [(IKDOMBindingController *)&v111 init];
  if (!v5) {
    goto LABEL_59;
  }
  int v6 = +[IKAppContext currentAppContext];
  objc_storeWeak((id *)&v5->_appContext, v6);

  objc_storeWeak((id *)&v5->_domElement, v4);
  v7 = [v4 parentNode];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v4 parentNode];
    uint64_t v9 = objc_msgSend(v8, "domb_domBindingController");
    objc_storeWeak((id *)&v5->_parent, v9);
  }
  else
  {
    objc_storeWeak((id *)&v5->_parent, 0);
  }

  uint64_t v10 = [(id)objc_opt_class() parsedBindingForDOMElement:v4];
  binding = v5->_binding;
  v5->_binding = (IKDataBinding *)v10;

  uint64_t v12 = [(id)objc_opt_class() _parsedMutationRulesForDOMElement:v4];
  mutationRuleSet = v5->_mutationRuleSet;
  v5->_mutationRuleSet = (_IKDOMMutationRuleSet *)v12;

  int v14 = [v4 _isPartOfPrototypeElement];
  uint64_t v15 = 7;
  if (v14) {
    uint64_t v15 = 3;
  }
  v5->_resolutionTarget = v15;
  v16 = [(IKDataBinding *)v5->_binding keyValues];
  v17 = [v16 objectForKeyedSubscript:@"items"];
  if (v17)
  {
    v18 = [[IKDOMItemsBindingStrategy alloc] initWithDOMBindingController:v5];
    strategy = v5->_strategy;
    v5->_strategy = &v18->super;
  }
  else
  {
    strategy = [(IKDataBinding *)v5->_binding keyValues];
    v20 = [strategy objectForKeyedSubscript:@"children"];
    if (v20)
    {
      v21 = [[IKDOMChildrenBindingStrategy alloc] initWithDOMBindingController:v5];
      uint64_t v22 = v5->_strategy;
      v5->_strategy = &v21->super;
    }
    else
    {
      uint64_t v22 = v5->_strategy;
      v5->_strategy = 0;
    }
  }
  v5->_strategyFlags.hasKeysAffectingChildren = objc_opt_respondsToSelector() & 1;
  v5->_strategyFlags.hasKeysAffectingSubtree = objc_opt_respondsToSelector() & 1;
  v5->_strategyFlags.BOOL hasPrototypeDependentKeys = objc_opt_respondsToSelector() & 1;
  v5->_strategyFlags.hasValueDidChangeForKey = objc_opt_respondsToSelector() & 1;
  v5->_strategyFlags.hasDidResolveKeys = objc_opt_respondsToSelector() & 1;
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_domElement);
  char v24 = [WeakRetained jsNodeData];
  char v25 = [v24 isDataResolved];

  if ((v25 & 1) == 0)
  {
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    char v26 = [(IKDataBinding *)v5->_binding dataBoundKeys];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v107 objects:v115 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v108;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v108 != v29) {
            objc_enumerationMutation(v26);
          }
          [(IKDataBinding *)v5->_binding setNeedsResolutionForKey:*(void *)(*((void *)&v107 + 1) + 8 * i)];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v107 objects:v115 count:16];
      }
      while (v28);
    }
  }
  uint64_t v31 = [(IKDOMBindingController *)v5 parent];
  v32 = [v31 dataItem];

  v33 = [(IKDataBinding *)v5->_binding unresolvedKeys];
  int v34 = [v33 containsObject:@"dataItem"];

  if (v34)
  {
    v35 = [(IKDataBinding *)v5->_binding dataBoundKeys];
    int v36 = [v35 containsObject:@"dataItem"];

    if (v36)
    {
      v37 = [(IKDataBinding *)v5->_binding keyValues];
      v38 = [v37 objectForKeyedSubscript:@"dataItem"];

      id v39 = objc_loadWeakRetained((id *)&v5->_domElement);
      v40 = [v32 valueForPropertyPath:v38 boxed:0];
      [v39 setDataItem:v40];

      v41 = [v38 string];
      [v32 addObserver:v5 forPropertyPathWithString:v41];
    }
    [(IKDataBinding *)v5->_binding markResolvedForKey:@"dataItem"];
  }
  id v42 = objc_loadWeakRetained((id *)&v5->_domElement);
  v43 = [v42 dataItem];

  if (v43)
  {
    id v44 = objc_loadWeakRetained((id *)&v5->_domElement);
    v45 = [v44 dataItem];
    id v106 = 0;
    long long v46 = +[IKJSDataObservable toDataObservable:v45 proxy:&v106];
    id v47 = v106;
    objc_storeWeak((id *)&v5->_dataItem, v46);

    id v48 = objc_loadWeakRetained((id *)&v5->_domElement);
    id v49 = [v48 dataItem];

    if (v47 != v49)
    {
      id v50 = objc_loadWeakRetained((id *)&v5->_domElement);
      [v50 setDataItem:v47];
    }
    id v51 = objc_loadWeakRetained((id *)&v5->_dataItem);
    [v51 addObserver:v5 forPropertyPathWithString:&stru_1F3E09950];
  }
  else
  {
    objc_storeWeak((id *)&v5->_dataItem, v32);
  }

  id v52 = objc_loadWeakRetained((id *)&v5->_domElement);
  v53 = [v52 jsNodeData];
  [v53 setDataResolved:1];

  v54 = objc_opt_class();
  id v55 = objc_loadWeakRetained((id *)&v5->_domElement);
  uint64_t v56 = [v54 _prototypeGroupsByTypeForDOMElement:v55];
  prototypeGroupsByType = v5->_prototypeGroupsByType;
  v5->_prototypeGroupsByType = (NSDictionary *)v56;

  v58 = objc_loadWeakRetained((id *)&v5->_domElement);
  v59 = [v58 jsNodeData];
  if ([v59 arePrototypesResolved])
  {

LABEL_41:
    goto LABEL_42;
  }
  BOOL hasPrototypeDependentKeys = v5->_strategyFlags.hasPrototypeDependentKeys;

  if (hasPrototypeDependentKeys)
  {
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    v61 = [(IKDOMBindingController *)v5 strategy];
    v58 = [v61 prototypeDependentKeys];

    uint64_t v62 = [v58 countByEnumeratingWithState:&v102 objects:v114 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v103;
      do
      {
        for (uint64_t j = 0; j != v63; ++j)
        {
          if (*(void *)v103 != v64) {
            objc_enumerationMutation(v58);
          }
          [(IKDataBinding *)v5->_binding setNeedsResolutionForKey:*(void *)(*((void *)&v102 + 1) + 8 * j)];
        }
        uint64_t v63 = [v58 countByEnumeratingWithState:&v102 objects:v114 count:16];
      }
      while (v63);
    }
    goto LABEL_41;
  }
LABEL_42:
  id v66 = objc_loadWeakRetained((id *)&v5->_domElement);
  v67 = [v66 jsNodeData];
  [v67 setPrototypesResolved:1];

  v68 = [MEMORY[0x1E4F1CA60] dictionary];
  v69 = [(IKDataBinding *)v5->_binding keysWithAnyOfAttributes:v5->_resolutionTarget];
  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __45__IKDOMBindingController_initWithDOMElement___block_invoke;
  v99[3] = &unk_1E6DE5AC0;
  v70 = v5;
  v100 = v70;
  id v71 = v68;
  id v101 = v71;
  [v69 enumerateObjectsUsingBlock:v99];

  uint64_t v72 = [v71 copy];
  id v73 = v70[1];
  v70[1] = (id)v72;

  id v74 = objc_loadWeakRetained(v70 + 8);
  if (v74)
  {
    id v90 = v4;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    v75 = [v70[1] allKeys];
    uint64_t v76 = [v75 countByEnumeratingWithState:&v95 objects:v113 count:16];
    if (v76)
    {
      uint64_t v77 = v76;
      uint64_t v78 = *(void *)v96;
      do
      {
        for (uint64_t k = 0; k != v77; ++k)
        {
          if (*(void *)v96 != v78) {
            objc_enumerationMutation(v75);
          }
          uint64_t v80 = *(void *)(*((void *)&v95 + 1) + 8 * k);
          id v81 = objc_loadWeakRetained(v70 + 8);
          [v81 addObserver:v70 forPropertyPathWithString:v80];
        }
        uint64_t v77 = [v75 countByEnumeratingWithState:&v95 objects:v113 count:16];
      }
      while (v77);
    }

    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    v82 = [(_IKDOMMutationRuleSet *)v5->_mutationRuleSet dependentPathStrings];
    uint64_t v83 = [v82 countByEnumeratingWithState:&v91 objects:v112 count:16];
    if (v83)
    {
      uint64_t v84 = v83;
      uint64_t v85 = *(void *)v92;
      do
      {
        for (uint64_t m = 0; m != v84; ++m)
        {
          if (*(void *)v92 != v85) {
            objc_enumerationMutation(v82);
          }
          uint64_t v87 = *(void *)(*((void *)&v91 + 1) + 8 * m);
          id v88 = objc_loadWeakRetained(v70 + 8);
          [v88 addObserver:v70 forPropertyPathWithString:v87];
        }
        uint64_t v84 = [v82 countByEnumeratingWithState:&v91 objects:v112 count:16];
      }
      while (v84);
    }

    id v4 = v90;
  }
  [v70 _resolveBinding];
  [v70 _evaluateMutationRules];

LABEL_59:
  return v5;
}

void __45__IKDOMBindingController_initWithDOMElement___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  if (([v12 isEqualToString:@"dataItem"] & 1) == 0)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 56) keyValues];
    id v4 = [v3 objectForKeyedSubscript:v12];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = [v4 string];
      int v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
      v7 = (void *)[v6 mutableCopy];
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v9 = [MEMORY[0x1E4F1CA80] set];
      }
      uint64_t v10 = v9;

      [v10 addObject:v12];
      unint64_t v11 = (void *)[v10 copy];
      [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v5];
    }
  }
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  id v4 = [WeakRetained dataItem];
  [v4 removeObserver:self];

  id v5 = objc_loadWeakRetained((id *)&self->_dataItem);
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)IKDOMBindingController;
  [(IKDOMBindingController *)&v6 dealloc];
}

- (void)scheduleUpdateUsingPreUpdate:(id)a3 update:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(IKDOMBindingController *)self parent];

  if (v8)
  {
    id v9 = [(IKDOMBindingController *)self parent];
    [v9 scheduleUpdateUsingPreUpdate:v6 update:v7];
  }
  else
  {
    if (!self->_scheduledUpdaters)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      scheduledUpdaters = self->_scheduledUpdaters;
      self->_scheduledUpdaters = v10;
    }
    id v12 = objc_alloc_init(_IKDOMBindingControllerUpdateRecord);
    [(_IKDOMBindingControllerUpdateRecord *)v12 setPreUpdate:v6];
    [(_IKDOMBindingControllerUpdateRecord *)v12 setUpdate:v7];
    [(NSMutableArray *)self->_scheduledUpdaters addObject:v12];
    if ([(NSMutableArray *)self->_scheduledUpdaters count] == 1)
    {
      objc_initWeak(&location, self);
      v13 = [(IKDOMBindingController *)self appContext];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __62__IKDOMBindingController_scheduleUpdateUsingPreUpdate_update___block_invoke;
      v14[3] = &unk_1E6DE41D0;
      v14[4] = self;
      objc_copyWeak(&v15, &location);
      [v13 evaluate:v14 completionBlock:0];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __62__IKDOMBindingController_scheduleUpdateUsingPreUpdate_update___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__21;
  v21 = __Block_byref_object_dispose__21;
  id v22 = 0;
  id v4 = [*(id *)(a1 + 32) appContext];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__IKDOMBindingController_scheduleUpdateUsingPreUpdate_update___block_invoke_109;
  v15[3] = &unk_1E6DE5320;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v15[4] = &v17;
  [v4 evaluateDelegateBlockSync:v15];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = (id)v18[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isCancelled", (void)v11) & 1) == 0)
        {
          uint64_t v10 = [v9 update];
          ((void (**)(void, id))v10)[2](v10, v3);
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v23 count:16];
    }
    while (v6);
  }

  objc_destroyWeak(&v16);
  _Block_object_dispose(&v17, 8);
}

void __62__IKDOMBindingController_scheduleUpdateUsingPreUpdate_update___block_invoke_109(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained[3] copy];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    [v3[3] removeAllObjects];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          long long v13 = objc_msgSend(v12, "preUpdate", (void)v15);

          if (v13)
          {
            long long v14 = [v12 preUpdate];
            [v12 setCancelled:v14[2]() ^ 1];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

+ (id)instantiateDOMElementForItem:(id)a3 withPrototype:(id)a4 parentDOMElement:(id)a5 existingDOMElement:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v13 = [v9 identifier];
  long long v14 = [v10 identifier];
  id v15 = v12;
  long long v16 = v15;
  if (v15)
  {
    long long v17 = [v15 getAttribute:@"prototypeID"];
    if ([v17 isEqualToString:v14])
    {

      int v18 = 0;
LABEL_13:
      uint64_t v19 = v16;
      goto LABEL_14;
    }
  }
  uint64_t v19 = [v10 instantiateDOMElement];
  [v19 setAttributeValue:v13 withName:@"itemID"];
  [v19 setAttributeValue:v14 withName:@"prototypeID"];
  if (!v16 || v19 == v16)
  {
    if (v19 == v16)
    {
      int v18 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v20 = [v16 ownerDocument];
    [v20 swapITMLIDForNode:v19 withITMLIDForNode:v16];
  }
  id v21 = [v16 parentNode];

  if (v21 == v11) {
    id v22 = (id)[v11 replaceChild:v19 :v16];
  }
  int v18 = 1;
LABEL_14:
  id v23 = [v19 parentNode];

  if (v23 != v11) {
    id v24 = (id)[v11 appendChild:v19];
  }
  char v25 = [v19 dataItem];
  id v26 = +[IKJSDataObservable toDataObservable:v25];

  if (v26 == v9)
  {
    if (!v18) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v27 = [v9 exportValue];
    [v19 setDataItem:v27];
  }
  uint64_t v28 = [v11 jsNodeData];
  int v29 = [v28 containsUpdates];

  if (v29)
  {
    uint64_t v30 = [v19 jsNodeData];
    [v30 setUpdated:1];
  }
  uint64_t v31 = [IKDOMEvent alloc];
  v32 = +[IKAppContext currentAppContext];
  v33 = [(IKDOMEvent *)v31 initWithAppContext:v32 type:@"dataitemresolved" xmlAttribute:@"ondataitemresolved" canBubble:1 isCancelable:0];

  [v19 dispatchEvent:v33];
LABEL_22:

  return v19;
}

- (id)findPrototypeForDataItem:(id)a3
{
  id v4 = a3;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  long long v17 = __51__IKDOMBindingController_findPrototypeForDataItem___block_invoke;
  int v18 = &unk_1E6DE5F00;
  uint64_t v19 = self;
  id v5 = v4;
  id v20 = v5;
  uint64_t v6 = (void (**)(void, void))MEMORY[0x1E4E65800](&v15);
  id v7 = objc_msgSend(v5, "type", v15, v16, v17, v18, v19);
  uint64_t v8 = ((void (**)(void, void *))v6)[2](v6, v7);
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v11 = [v5 type];
    id v12 = [NSString string];
    if (v11 == v12)
    {
      id v10 = 0;
    }
    else
    {
      long long v13 = [NSString string];
      ((void (**)(void, void *))v6)[2](v6, v13);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v10;
}

id __51__IKDOMBindingController_findPrototypeForDataItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  if (v4)
  {
    id v5 = v4;
    do
    {
      uint64_t v6 = [v5 prototypeGroupsByType];
      id v7 = [v6 objectForKeyedSubscript:v3];

      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v8 = v7;
      id v9 = (id)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v8);
            }
            id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            if ([v12 passesForDataItem:*(void *)(a1 + 40) default:1])
            {
              id v9 = v12;
              goto LABEL_13;
            }
          }
          id v9 = (id)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
LABEL_13:

      long long v13 = [v5 parent];

      if (v9) {
        break;
      }
      id v5 = v13;
    }
    while (v13);
  }
  else
  {
    long long v13 = 0;
    id v9 = 0;
  }

  return v9;
}

- (void)dataObservable:(id)a3 didChangePropertyPathWithString:(id)a4 extraInfo:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[IKDataBindingPropertyPath alloc] initWithString:v9];
  id v12 = [(NSDictionary *)self->_bindingKeysByPathString objectForKeyedSubscript:v9];
  long long v13 = [(IKDOMBindingController *)self parent];
  id v14 = [v13 dataItem];
  if (v14 == v8)
  {
    int v15 = [v12 containsObject:@"dataItem"];

    if (v15)
    {
      long long v16 = [(IKDOMBindingController *)self domElement];
      long long v17 = [v16 jsNodeData];
      [v17 setDataResolved:0];

      long long v18 = [(IKDOMBindingController *)self domElement];
      uint64_t v19 = v18;
      uint64_t v20 = 1;
LABEL_7:
      [v18 updatedAndMark:v20 notify:0];

      goto LABEL_41;
    }
  }
  else
  {
  }
  if ([v9 isEqualToString:&stru_1F3E09950])
  {
    long long v18 = [(IKDOMBindingController *)self domElement];
    uint64_t v19 = v18;
    uint64_t v20 = 0;
    goto LABEL_7;
  }
  id v50 = v8;
  if (dataObservable_didChangePropertyPathWithString_extraInfo__onceToken != -1) {
    dispatch_once(&dataObservable_didChangePropertyPathWithString_extraInfo__onceToken, &__block_literal_global_22);
  }
  id v51 = v12;
  if (self->_strategyFlags.hasValueDidChangeForKey)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v21 = v12;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v57 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          uint64_t v27 = [(IKDOMBindingController *)self strategy];
          [v27 valueDidChangeForKey:v26 propertyPath:v11 extraInfo:v10];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v23);
    }

    id v12 = v51;
  }
  uint64_t v28 = [MEMORY[0x1E4F1CA80] setWithSet:v12];
  int v29 = [(IKDOMBindingController *)self binding];
  uint64_t v30 = [v29 unresolvedKeys];
  [v28 minusSet:v30];

  if ([v28 count])
  {
    if (([(id)dataObservable_didChangePropertyPathWithString_extraInfo__bindingKeysForChildren intersectsSet:v28] & 1) != 0|| self->_strategyFlags.hasKeysAffectingChildren&& (-[IKDOMBindingController strategy](self, "strategy"), uint64_t v31 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v31, "keysAffectingChildren"), v32 = objc_claimAutoreleasedReturnValue(), v33 = objc_msgSend(v32, "intersectsSet:", v28), v32, v31, v33))
    {
      int v34 = [(IKDOMBindingController *)self domElement];
      [v34 childrenUpdatedWithUpdatedChildNodes:0 notify:0];
    }
    else
    {
      if ([(id)dataObservable_didChangePropertyPathWithString_extraInfo__bindingKeysForSubtree intersectsSet:v12])
      {
        uint64_t v35 = 0;
      }
      else if (self->_strategyFlags.hasKeysAffectingSubtree)
      {
        int v36 = [(IKDOMBindingController *)self strategy];
        v37 = [v36 keysAffectingSubtree];
        uint64_t v35 = [v37 intersectsSet:v28] ^ 1;
      }
      else
      {
        uint64_t v35 = 1;
      }
      int v34 = [(IKDOMBindingController *)self domElement];
      [v34 updatedAndMark:v35 notify:0];
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v49 = v28;
    id v38 = v28;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v53 != v41) {
            objc_enumerationMutation(v38);
          }
          uint64_t v43 = *(void *)(*((void *)&v52 + 1) + 8 * j);
          id v44 = [(IKDOMBindingController *)self binding];
          [v44 setNeedsResolutionForKey:v43];
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v40);
    }

    id v12 = v51;
    uint64_t v28 = v49;
  }
  v45 = [(IKDOMBindingController *)self mutationRuleSet];
  long long v46 = [v45 dependentPathStrings];
  int v47 = [v46 containsObject:v9];

  if (v47)
  {
    id v48 = [(IKDOMBindingController *)self domElement];
    [v48 childrenUpdatedWithUpdatedChildNodes:0 notify:0];
  }
  id v8 = v50;
LABEL_41:
}

void __83__IKDOMBindingController_dataObservable_didChangePropertyPathWithString_extraInfo___block_invoke()
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] set];
  v1 = (void *)dataObservable_didChangePropertyPathWithString_extraInfo__bindingKeysForChildren;
  dataObservable_didChangePropertyPathWithString_extraInfo__bindingKeysForChildren = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [@"@" stringByAppendingString:@"autoHighlight"];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  uint64_t v5 = [v2 setWithArray:v4];
  uint64_t v6 = (void *)dataObservable_didChangePropertyPathWithString_extraInfo__bindingKeysForSubtree;
  dataObservable_didChangePropertyPathWithString_extraInfo__bindingKeysForSubtree = v5;
}

+ (id)_parsedMutationRulesForDOMElement:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(v3, "domb_mutationRuleSet");
  if (v4
    && ([v3 jsNodeData],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 areRulesParsed],
        v5,
        v6))
  {
    id v7 = v4;
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v8 = [v3 childElements];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v14 = [v13 nodeName];
          int v15 = [v14 isEqualToString:@"rules"];

          if (v15)
          {
            id v16 = v13;
            goto LABEL_14;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    id v16 = 0;
LABEL_14:

    long long v17 = (void *)MEMORY[0x1E4F1CA48];
    long long v18 = [v16 childElements];
    uint64_t v19 = objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v18, "count"));

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v20 = objc_msgSend(v16, "childElements", 0);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          char v25 = +[IKDOMMutationRule mutationRuleWithDOMElement:*(void *)(*((void *)&v29 + 1) + 8 * j) mutable:1];
          if (v25) {
            [v19 addObject:v25];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v22);
    }

    if ([v19 count]) {
      uint64_t v26 = [[_IKDOMMutationRuleSet alloc] initWithMutationRules:v19];
    }
    else {
      uint64_t v26 = 0;
    }

    objc_msgSend(v3, "domb_setMutationRuleSet:", v26);
    uint64_t v27 = [v3 jsNodeData];
    [v27 setRulesParsed:1];

    id v7 = v26;
  }

  return v7;
}

+ (id)_prototypeGroupsByTypeForDOMElement:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = [v3 elementName];
  if ([(objc_class *)+[IKViewElementFactory elementClassByTagName:v5] shouldParseChildDOMElements])
  {
  }
  else
  {
    int v6 = [v3 elementName];
    int v7 = [v6 isEqualToString:@"fragment"];

    if (!v7) {
      goto LABEL_31;
    }
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [v3 childElements];
  uint64_t v8 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v49;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        long long v13 = [v12 elementName];
        int v14 = [v13 isEqualToString:@"prototypes"];

        if (v14)
        {
          id v38 = v3;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          int v15 = [v12 childElements];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v55 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v45;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v45 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void **)(*((void *)&v44 + 1) + 8 * j);
                uint64_t v21 = [v20 elementName];
                uint64_t v22 = [v20 getAttribute:@"prototype"];
                uint64_t v23 = v22;
                if (v22)
                {
                  id v24 = v22;
                }
                else
                {
                  id v24 = [NSString string];
                }
                char v25 = v24;

                if (+[IKViewElementFactory elementClassByTagName:v21])
                {
                  uint64_t v26 = [v4 objectForKeyedSubscript:v25];
                  if (!v26)
                  {
                    uint64_t v26 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
                    [v4 setObject:v26 forKeyedSubscript:v25];
                  }
                  uint64_t v27 = +[IKDOMPrototype prototypeWithDOMElement:v20];
                  [v26 addObject:v27];
                }
                else
                {
                  uint64_t v26 = ITMLKitGetLogObject(0);
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    long long v54 = v21;
                    _os_log_impl(&dword_1E2ACE000, v26, OS_LOG_TYPE_INFO, "Invalid prototype tag: %@", buf, 0xCu);
                  }
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v55 count:16];
            }
            while (v17);
          }

          id v3 = v38;
          goto LABEL_30;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_30:

LABEL_31:
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v28 = [v4 allKeys];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v41 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v40 + 1) + 8 * k);
        long long v34 = [v4 objectForKeyedSubscript:v33];
        long long v35 = (void *)[v34 copy];
        [v4 setObject:v35 forKeyedSubscript:v33];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v30);
  }

  if ([v4 count]) {
    long long v36 = (void *)[v4 copy];
  }
  else {
    long long v36 = 0;
  }

  return v36;
}

- (BOOL)_canBeReused
{
  id v3 = [(IKDOMBindingController *)self domElement];
  id v4 = [v3 parentNode];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(IKDOMBindingController *)self domElement];
    int v6 = [v5 parentNode];
    int v7 = objc_msgSend(v6, "domb_domBindingController");
  }
  else
  {
    int v7 = 0;
  }

  uint64_t v8 = [(IKDOMBindingController *)self parent];
  if (v8 == v7)
  {
    uint64_t v10 = [(IKDOMBindingController *)self domElement];
    uint64_t v11 = [v10 jsNodeData];
    if ([v11 isBindingParsed])
    {
      id v12 = [(IKDOMBindingController *)self domElement];
      long long v13 = [v12 jsNodeData];
      if ([v13 areRulesParsed])
      {
        int v14 = [(IKDOMBindingController *)self domElement];
        int v15 = [v14 jsNodeData];
        if ([v15 arePrototypesResolved])
        {
          uint64_t v18 = [(IKDOMBindingController *)self domElement];
          uint64_t v16 = [v18 jsNodeData];
          char v9 = [v16 isDataResolved];
        }
        else
        {
          char v9 = 0;
        }
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)_resolveBinding
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 elementName];
  int v5 = 138412546;
  int v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = a1;
  _os_log_debug_impl(&dword_1E2ACE000, a2, OS_LOG_TYPE_DEBUG, "bound_css: parsed for %@(%p)", (uint8_t *)&v5, 0x16u);
}

void __41__IKDOMBindingController__resolveBinding__block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v1 = [@"@" stringByAppendingString:@"autoHighlight"];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  uint64_t v3 = [v0 setWithArray:v2];
  id v4 = (void *)_resolveBinding_messagingKeys;
  _resolveBinding_messagingKeys = v3;
}

uint64_t __41__IKDOMBindingController__resolveBinding__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  int v5 = *(void **)(a1 + 32);
  id v6 = a3;
  __int16 v7 = [v5 objectForKeyedSubscript:a2];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v9 = [v7 string];
    uint64_t v10 = [v8 string];
    uint64_t v11 = [v9 compare:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void __41__IKDOMBindingController__resolveBinding__block_invoke_3(id *a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [a1[4] objectForKeyedSubscript:v3];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v6 = 0;
LABEL_5:
    char v10 = isKindOfClass & 1;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __41__IKDOMBindingController__resolveBinding__block_invoke_130;
    v37[3] = &unk_1E6DE5F50;
    char v40 = isKindOfClass & 1;
    id v11 = v4;
    id v38 = v11;
    id v12 = v6;
    id v39 = v12;
    long long v13 = (void (**)(void, void))MEMORY[0x1E4E65800](v37);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __41__IKDOMBindingController__resolveBinding__block_invoke_2_132;
    v33[3] = &unk_1E6DE5F78;
    char v36 = v10;
    id v14 = v11;
    id v34 = v14;
    int v15 = v12;
    long long v35 = v15;
    uint64_t v16 = (void (**)(void, void))MEMORY[0x1E4E65800](v33);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v42 = 0x2020000000;
    char v43 = 0;
    char v43 = [(id)_resolveBinding_messagingKeys containsObject:v3];
    if ([v3 hasPrefix:@"@"])
    {
      uint64_t v17 = [v3 substringFromIndex:1];
      if ([v17 length])
      {
        if ([v17 isEqualToString:@"itemID"])
        {
          uint64_t v18 = v31;
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __41__IKDOMBindingController__resolveBinding__block_invoke_3_134;
          v31[3] = &unk_1E6DE5FA0;
          v31[4] = a1[5];
          v31[5] = a1[8];
          id v32 = v17;
          ((void (**)(void, void *))v13)[2](v13, v31);
        }
        else if ([v17 isEqualToString:@"autoHighlight"])
        {
          uint64_t v18 = v30;
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __41__IKDOMBindingController__resolveBinding__block_invoke_136;
          v30[3] = &unk_1E6DE5FC8;
          v30[4] = a1[8];
          v30[5] = v17;
          ((void (**)(void, void *))v16)[2](v16, v30);
        }
        else
        {
          uint64_t v18 = v29;
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __41__IKDOMBindingController__resolveBinding__block_invoke_2_139;
          v29[3] = &unk_1E6DE5FF0;
          v29[4] = a1[8];
          v29[5] = v17;
          ((void (**)(void, void *))v13)[2](v13, v29);
        }
      }
    }
    else if ([v3 hasPrefix:@"#"])
    {
      uint64_t v19 = [v3 substringFromIndex:1];
      if ([v19 length])
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __41__IKDOMBindingController__resolveBinding__block_invoke_3_143;
        v26[3] = &unk_1E6DE5FC8;
        id v27 = v19;
        id v28 = a1[9];
        ((void (**)(void, void *))v16)[2](v16, v26);
      }
    }
    else if ([v3 isEqualToString:@"textContent"])
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __41__IKDOMBindingController__resolveBinding__block_invoke_145;
      v24[3] = &unk_1E6DE6018;
      id v25 = a1[8];
      ((void (**)(void, void *))v13)[2](v13, v24);
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __41__IKDOMBindingController__resolveBinding__block_invoke_2_146;
      v21[3] = &unk_1E6DE6040;
      id v20 = a1[6];
      p_long long buf = &buf;
      v21[4] = v20;
      id v22 = v3;
      ((void (**)(void, void *))v16)[2](v16, v21);
    }
    if (*(unsigned char *)(*((void *)&buf + 1) + 24) && v15) {
      [a1[5] resetValueForPropertyPath:v14];
    }
    _Block_object_dispose(&buf, 8);

    goto LABEL_27;
  }
  if (a1[5])
  {
    __int16 v7 = [a1[6] strategy];
    uint64_t v8 = [v7 prototypeDependentKeys];
    uint64_t v9 = [v8 containsObject:v3];

    id v6 = [a1[5] valueForPropertyPath:v4 boxed:v9];
    [a1[7] markResolvedForKey:v3];
    goto LABEL_5;
  }
  int v15 = ITMLKitGetLogObject(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1E2ACE000, v15, OS_LOG_TYPE_INFO, "Can't resolve binding for key %@ without data item", (uint8_t *)&buf, 0xCu);
  }
LABEL_27:
}

void __41__IKDOMBindingController__resolveBinding__block_invoke_130(uint64_t a1, void *a2)
{
  __int16 v7 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id v3 = [*(id *)(a1 + 32) literal];
    v7[2](v7, v3);
LABEL_5:

    goto LABEL_6;
  }
  char v4 = [*(id *)(a1 + 40) isString];
  int v5 = *(void **)(a1 + 40);
  if (v4)
  {
    id v3 = [v5 toString];
    v7[2](v7, v3);
    goto LABEL_5;
  }
  if ([v5 isNumber] & 1) != 0 || (objc_msgSend(*(id *)(a1 + 40), "isBoolean"))
  {
    id v3 = [*(id *)(a1 + 40) toNumber];
    id v6 = [v3 description];
    v7[2](v7, v6);

    goto LABEL_5;
  }
  v7[2](v7, &stru_1F3E09950);
LABEL_6:
}

void __41__IKDOMBindingController__resolveBinding__block_invoke_2_132(uint64_t a1, void (**a2)(void))
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v3 = *(void **)(a1 + 32);
    char v4 = a2;
    id v6 = [v3 literal];
    a2[2](v4);
  }
  else
  {
    int v5 = (void (*)(void))a2[2];
    id v6 = a2;
    v5();
  }
}

void __41__IKDOMBindingController__resolveBinding__block_invoke_3_134(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [*(id *)(a1 + 32) identifier];

  if (v4)
  {
    if (v3)
    {
      int v5 = [*(id *)(a1 + 32) identifier];
      char v6 = [v3 isEqualToString:v5];

      if ((v6 & 1) == 0)
      {
        __int16 v7 = ITMLKitGetLogObject(0);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          uint64_t v8 = [*(id *)(a1 + 32) identifier];
          int v12 = 138412546;
          id v13 = v3;
          __int16 v14 = 2112;
          int v15 = v8;
          _os_log_impl(&dword_1E2ACE000, v7, OS_LOG_TYPE_INFO, "Binding itemId %@ doesn't match dataItem itemId %@", (uint8_t *)&v12, 0x16u);
        }
      }
    }
    char v10 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    id v11 = [*(id *)(a1 + 32) identifier];
    [v10 setAttribute:v9 :v11];
  }
  else
  {
    [*(id *)(a1 + 40) setAttribute:*(void *)(a1 + 48) :v3];
  }
}

void __41__IKDOMBindingController__resolveBinding__block_invoke_136(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 isString])
  {
    char v4 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = [v6 toString];
    [v4 setAttribute:v3 :v5];
  }
}

uint64_t __41__IKDOMBindingController__resolveBinding__block_invoke_2_139(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setAttribute:*(void *)(a1 + 40) :a2];
}

void __41__IKDOMBindingController__resolveBinding__block_invoke_3_143(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v4 = *(void *)(a1 + 32),
        [v3 toObject],
        int v5 = objc_claimAutoreleasedReturnValue(),
        +[IKCSSFactory createDeclarationForName:v4 withObject:v5], id v6 = objc_claimAutoreleasedReturnValue(), v5, v6))
  {
    [*(id *)(a1 + 40) addDeclaration:v6];
  }
  else
  {
    id v6 = ITMLKitGetLogObject(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __41__IKDOMBindingController__resolveBinding__block_invoke_3_143_cold_1(a1, (uint64_t)v3, v6);
    }
  }
}

uint64_t __41__IKDOMBindingController__resolveBinding__block_invoke_145(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setTextContent:a2];
}

void __41__IKDOMBindingController__resolveBinding__block_invoke_2_146(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 strategy];
  LOBYTE(v3) = [v5 applyValue:v4 forKey:a1[5]];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)v3;
}

- (void)_evaluateMutationRules
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(IKDOMBindingController *)self mutationRuleSet];
  id v4 = [v3 mutationRules];
  id v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        int v12 = [(IKDOMBindingController *)self dataItem];
        int v13 = [v11 passesForDataItem:v12 default:0];

        if (v13)
        {
          __int16 v14 = [(IKDOMBindingController *)self domElement];
          [v11 applyOnDOMElement:v14];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (IKDOMElement)domElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_domElement);
  return (IKDOMElement *)WeakRetained;
}

- (IKDOMBindingController)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (IKDOMBindingController *)WeakRetained;
}

- (IKDataBinding)binding
{
  return self->_binding;
}

- (IKJSDataItem)dataItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataItem);
  return (IKJSDataItem *)WeakRetained;
}

- (IKDOMBindingStrategy)strategy
{
  return self->_strategy;
}

- (_IKDOMMutationRuleSet)mutationRuleSet
{
  return self->_mutationRuleSet;
}

- (NSDictionary)prototypeGroupsByType
{
  return self->_prototypeGroupsByType;
}

- (unint64_t)resolutionTarget
{
  return self->_resolutionTarget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prototypeGroupsByType, 0);
  objc_storeStrong((id *)&self->_mutationRuleSet, 0);
  objc_storeStrong((id *)&self->_strategy, 0);
  objc_destroyWeak((id *)&self->_dataItem);
  objc_storeStrong((id *)&self->_binding, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_destroyWeak((id *)&self->_domElement);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_scheduledUpdaters, 0);
  objc_storeStrong((id *)&self->_bindingKeysByPathString, 0);
}

void __41__IKDOMBindingController__resolveBinding__block_invoke_3_143_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1E2ACE000, log, OS_LOG_TYPE_ERROR, "CSS style binding did not resolve: %@ : %@", (uint8_t *)&v4, 0x16u);
}

@end