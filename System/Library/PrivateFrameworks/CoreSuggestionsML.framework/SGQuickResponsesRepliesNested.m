@interface SGQuickResponsesRepliesNested
+ (BOOL)isZeroBasedAndContiguous:(id)a3;
+ (id)categoryModelsFromModels:(id)a3;
+ (id)flattenedArraysFromNestedArray:(id)a3;
+ (id)indexedArraysFromNestedArray:(id)a3;
+ (id)modelSemanticClassesFromModels:(id)a3;
+ (id)nestedArrayFromFlatArray:(id)a3 nestedIndexes:(id)a4;
+ (id)nestedArrayFromModels:(id)a3;
+ (id)parentArraysFromNestedArray:(id)a3 models:(id)a4;
+ (id)replyModelsForArray:(id)a3;
+ (id)selectedPseudocountsFromModels:(id)a3;
+ (id)subclassesFromClasses:(id)a3 subclassArray:(id)a4;
- (NSArray)categoryModels;
- (NSArray)categorySemanticClasses;
- (NSArray)categoryStyleGroups;
- (NSArray)models;
- (NSArray)replyTextParent;
- (NSArray)replyTexts;
- (NSArray)selectedPseudocounts;
- (NSArray)semanticClassParent;
- (NSArray)semanticClassReplyTextStrings;
- (NSArray)semanticClassReplyTexts;
- (NSArray)semanticClassSelectedPseudocounts;
- (NSArray)semanticClassStyleGroups;
- (NSArray)semanticClasses;
- (NSArray)styleGroupParent;
- (NSArray)styleGroupReplyTexts;
- (NSArray)styleGroups;
- (NSSet)normalizedReplyTextsSet;
- (SGQuickResponsesRepliesNested)initWithArray:(id)a3;
- (id)replyTextForIndex:(unint64_t)a3 position:(unint64_t)a4;
- (id)replyTextsForIndex:(unint64_t)a3;
- (unint64_t)maxDistinctReplies;
- (unint64_t)modelCount;
- (unint64_t)replyClassCount;
- (unint64_t)replyCountForIndex:(unint64_t)a3;
- (unint64_t)replyTextCount;
@end

@implementation SGQuickResponsesRepliesNested

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedReplyTextsSet, 0);
  objc_storeStrong((id *)&self->_styleGroupReplyTexts, 0);
  objc_storeStrong((id *)&self->_semanticClassReplyTexts, 0);
  objc_storeStrong((id *)&self->_semanticClassStyleGroups, 0);
  objc_storeStrong((id *)&self->_categoryStyleGroups, 0);
  objc_storeStrong((id *)&self->_categorySemanticClasses, 0);
  objc_storeStrong((id *)&self->_categoryModels, 0);
  objc_storeStrong((id *)&self->_replyTextParent, 0);
  objc_storeStrong((id *)&self->_styleGroupParent, 0);
  objc_storeStrong((id *)&self->_semanticClassParent, 0);
  objc_storeStrong((id *)&self->_semanticClassSelectedPseudocounts, 0);
  objc_storeStrong((id *)&self->_semanticClassReplyTextStrings, 0);
  objc_storeStrong((id *)&self->_selectedPseudocounts, 0);
  objc_storeStrong((id *)&self->_replyTexts, 0);
  objc_storeStrong((id *)&self->_styleGroups, 0);
  objc_storeStrong((id *)&self->_semanticClasses, 0);
  objc_storeStrong((id *)&self->_models, 0);
}

- (NSSet)normalizedReplyTextsSet
{
  return self->_normalizedReplyTextsSet;
}

- (NSArray)styleGroupReplyTexts
{
  return self->_styleGroupReplyTexts;
}

- (NSArray)semanticClassReplyTexts
{
  return self->_semanticClassReplyTexts;
}

- (NSArray)semanticClassStyleGroups
{
  return self->_semanticClassStyleGroups;
}

- (NSArray)categoryStyleGroups
{
  return self->_categoryStyleGroups;
}

- (NSArray)categorySemanticClasses
{
  return self->_categorySemanticClasses;
}

- (NSArray)categoryModels
{
  return self->_categoryModels;
}

- (NSArray)replyTextParent
{
  return self->_replyTextParent;
}

- (NSArray)styleGroupParent
{
  return self->_styleGroupParent;
}

- (NSArray)semanticClassParent
{
  return self->_semanticClassParent;
}

- (NSArray)semanticClassSelectedPseudocounts
{
  return self->_semanticClassSelectedPseudocounts;
}

- (NSArray)semanticClassReplyTextStrings
{
  return self->_semanticClassReplyTextStrings;
}

- (NSArray)selectedPseudocounts
{
  return self->_selectedPseudocounts;
}

- (NSArray)replyTexts
{
  return self->_replyTexts;
}

- (NSArray)styleGroups
{
  return self->_styleGroups;
}

- (NSArray)semanticClasses
{
  return self->_semanticClasses;
}

- (NSArray)models
{
  return self->_models;
}

- (SGQuickResponsesRepliesNested)initWithArray:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      goto LABEL_35;
    }
    *(_WORD *)buf = 0;
    v63 = &_os_log_internal;
    v64 = "array";
    goto LABEL_19;
  }

  v70.receiver = self;
  v70.super_class = (Class)SGQuickResponsesRepliesNested;
  self = [(SGQuickResponsesRepliesNested *)&v70 init];
  if (self)
  {
    v6 = [(id)objc_opt_class() replyModelsForArray:v5];
    if (v6)
    {
      models = self->_models;
      self->_models = v6;

      uint64_t v8 = [(id)objc_opt_class() nestedArrayFromModels:self->_models];
      if (v8)
      {
        v9 = (void *)v8;
        v10 = [(id)objc_opt_class() indexedArraysFromNestedArray:v8];
        if (!v10)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "[self.class indexedArraysFromNestedArray:nestedArray]", buf, 2u);
          }
          goto LABEL_34;
        }
        v11 = v10;
        if ((unint64_t)[v10 count] <= 3)
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          *(_WORD *)buf = 0;
          v65 = &_os_log_internal;
          v66 = "indexedArrays.count >= 4";
        }
        else
        {
          v12 = [v11 objectAtIndexedSubscript:1];
          semanticClasses = self->_semanticClasses;
          self->_semanticClasses = v12;

          v14 = [v11 objectAtIndexedSubscript:2];
          styleGroups = self->_styleGroups;
          self->_styleGroups = v14;

          v16 = [v11 objectAtIndexedSubscript:3];
          replyTexts = self->_replyTexts;
          self->_replyTexts = v16;

          v18 = [(id)objc_opt_class() flattenedArraysFromNestedArray:self->_semanticClasses];
          if (v18)
          {
            semanticClassReplyTextStrings = self->_semanticClassReplyTextStrings;
            self->_semanticClassReplyTextStrings = v18;

            v20 = [(id)objc_opt_class() parentArraysFromNestedArray:v9 models:self->_models];
            if (v20)
            {
              v21 = v20;
              if ((unint64_t)[v20 count] <= 3)
              {
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
                {
LABEL_32:

                  goto LABEL_33;
                }
                *(_WORD *)buf = 0;
                v67 = &_os_log_internal;
                v68 = "parentArrays.count >= 4";
              }
              else
              {
                v22 = [v21 objectAtIndexedSubscript:1];
                semanticClassParent = self->_semanticClassParent;
                self->_semanticClassParent = v22;

                v24 = [v21 objectAtIndexedSubscript:2];
                styleGroupParent = self->_styleGroupParent;
                self->_styleGroupParent = v24;

                v26 = [v21 objectAtIndexedSubscript:3];
                replyTextParent = self->_replyTextParent;
                self->_replyTextParent = v26;

                v28 = [(id)objc_opt_class() categoryModelsFromModels:self->_models];
                categoryModels = self->_categoryModels;
                self->_categoryModels = v28;

                v30 = objc_opt_class();
                v31 = self->_categoryModels;
                v32 = [v11 objectAtIndexedSubscript:0];
                v33 = [v30 subclassesFromClasses:v31 subclassArray:v32];
                categorySemanticClasses = self->_categorySemanticClasses;
                self->_categorySemanticClasses = v33;

                v35 = objc_opt_class();
                v36 = self->_categorySemanticClasses;
                v37 = [v11 objectAtIndexedSubscript:1];
                v38 = [v35 subclassesFromClasses:v36 subclassArray:v37];
                categoryStyleGroups = self->_categoryStyleGroups;
                self->_categoryStyleGroups = v38;

                v40 = objc_opt_class();
                v41 = [v11 objectAtIndexedSubscript:1];
                v42 = [v40 subclassesFromClasses:0 subclassArray:v41];
                semanticClassStyleGroups = self->_semanticClassStyleGroups;
                self->_semanticClassStyleGroups = v42;

                v44 = objc_opt_class();
                v45 = self->_semanticClassStyleGroups;
                v46 = [v11 objectAtIndexedSubscript:2];
                v47 = [v44 subclassesFromClasses:v45 subclassArray:v46];
                semanticClassReplyTexts = self->_semanticClassReplyTexts;
                self->_semanticClassReplyTexts = v47;

                v49 = objc_opt_class();
                v50 = [v11 objectAtIndexedSubscript:2];
                v51 = [v49 subclassesFromClasses:0 subclassArray:v50];
                styleGroupReplyTexts = self->_styleGroupReplyTexts;
                self->_styleGroupReplyTexts = v51;

                id v53 = objc_alloc(MEMORY[0x263EFFA08]);
                v54 = [(NSArray *)self->_replyTexts _pas_mappedArrayWithTransform:&__block_literal_global];
                v55 = (NSSet *)[v53 initWithArray:v54];
                normalizedReplyTextsSet = self->_normalizedReplyTextsSet;
                self->_normalizedReplyTextsSet = v55;

                v57 = [(id)objc_opt_class() selectedPseudocountsFromModels:self->_models];
                selectedPseudocounts = self->_selectedPseudocounts;
                self->_selectedPseudocounts = v57;

                NSUInteger v59 = [(NSArray *)self->_selectedPseudocounts count];
                if (v59 == [(NSArray *)self->_replyTexts count])
                {
                  v60 = [(id)objc_opt_class() nestedArrayFromFlatArray:self->_selectedPseudocounts nestedIndexes:self->_semanticClassReplyTexts];
                  semanticClassSelectedPseudocounts = self->_semanticClassSelectedPseudocounts;
                  self->_semanticClassSelectedPseudocounts = v60;

                  goto LABEL_12;
                }
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                  goto LABEL_32;
                }
                *(_WORD *)buf = 0;
                v67 = &_os_log_internal;
                v68 = "_selectedPseudocounts.count == _replyTexts.count";
              }
              _os_log_fault_impl(&dword_226E32000, v67, OS_LOG_TYPE_FAULT, v68, buf, 2u);
              goto LABEL_32;
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              v65 = &_os_log_internal;
              v66 = "[self.class parentArraysFromNestedArray:nestedArray models:_models]";
              goto LABEL_28;
            }
LABEL_33:

LABEL_34:
            goto LABEL_35;
          }
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          *(_WORD *)buf = 0;
          v65 = &_os_log_internal;
          v66 = "[self.class flattenedArraysFromNestedArray:_semanticClasses]";
        }
LABEL_28:
        _os_log_fault_impl(&dword_226E32000, v65, OS_LOG_TYPE_FAULT, v66, buf, 2u);
        goto LABEL_33;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v63 = &_os_log_internal;
        v64 = "[self.class nestedArrayFromModels:_models]";
        goto LABEL_19;
      }
LABEL_35:
      v62 = 0;
      goto LABEL_36;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      goto LABEL_35;
    }
    *(_WORD *)buf = 0;
    v63 = &_os_log_internal;
    v64 = "[self.class replyModelsForArray:array]";
LABEL_19:
    _os_log_fault_impl(&dword_226E32000, v63, OS_LOG_TYPE_FAULT, v64, buf, 2u);
    goto LABEL_35;
  }
LABEL_12:
  self = self;
  v62 = self;
LABEL_36:

  return v62;
}

id __47__SGQuickResponsesRepliesNested_initWithArray___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SGQuickResponsesReplies normalizeReplyTextInternal:a2];
}

- (unint64_t)maxDistinctReplies
{
  return [(NSArray *)self->_styleGroups count];
}

- (unint64_t)modelCount
{
  return [(NSArray *)self->_models count];
}

- (unint64_t)replyClassCount
{
  return [(NSArray *)self->_semanticClasses count];
}

- (unint64_t)replyTextCount
{
  return [(NSArray *)self->_replyTexts count];
}

- (unint64_t)replyCountForIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_semanticClasses objectAtIndexedSubscript:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)replyTextsForIndex:(unint64_t)a3
{
  return [(NSArray *)self->_semanticClassReplyTextStrings objectAtIndexedSubscript:a3];
}

- (id)replyTextForIndex:(unint64_t)a3 position:(unint64_t)a4
{
  v5 = [(NSArray *)self->_semanticClassReplyTextStrings objectAtIndexedSubscript:a3];
  v6 = [v5 objectAtIndexedSubscript:a4];

  return v6;
}

+ (id)selectedPseudocountsFromModels:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "selectedPseudocounts", (void)v12);
        [v4 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)subclassesFromClasses:(id)a3 subclassArray:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v45 = a3;
  id v5 = a4;
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
  v49 = v7;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    id v47 = *(id *)v63;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(id *)v63 != v47) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        long long v13 = objc_opt_new();
        [v7 addObject:v13];

        uint64_t v14 = [v12 count];
        uint64_t v15 = v10;
        for (uint64_t j = v14; j; --j)
        {
          uint64_t v17 = [v7 lastObject];
          v18 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v15];
          [v17 addObject:v18];

          uint64_t v7 = v49;
          ++v15;
        }
        v10 += v14;
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v9);
  }

  v19 = v45;
  if (!v45)
  {
    v19 = objc_opt_new();
    uint64_t v20 = [obj count];
    if (v20)
    {
      uint64_t v21 = v20;
      for (uint64_t k = 0; k != v21; ++k)
      {
        v23 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:k];
        v24 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v23, 0);
        [v19 addObject:v24];
      }
    }
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v41 = v19;
  uint64_t v44 = [v41 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v44)
  {
    uint64_t v43 = *(void *)v59;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v59 != v43) {
          objc_enumerationMutation(v41);
        }
        uint64_t v46 = v25;
        v26 = *(void **)(*((void *)&v58 + 1) + 8 * v25);
        v27 = objc_opt_new();
        [v6 addObject:v27];

        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v48 = v26;
        uint64_t v28 = [v48 countByEnumeratingWithState:&v54 objects:v67 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v55;
          do
          {
            for (uint64_t m = 0; m != v29; ++m)
            {
              if (*(void *)v55 != v30) {
                objc_enumerationMutation(v48);
              }
              v32 = *(void **)(*((void *)&v54 + 1) + 8 * m);
              long long v50 = 0u;
              long long v51 = 0u;
              long long v52 = 0u;
              long long v53 = 0u;
              v33 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v32, "unsignedIntegerValue"));
              uint64_t v34 = [v33 countByEnumeratingWithState:&v50 objects:v66 count:16];
              if (v34)
              {
                uint64_t v35 = v34;
                uint64_t v36 = *(void *)v51;
                do
                {
                  for (uint64_t n = 0; n != v35; ++n)
                  {
                    if (*(void *)v51 != v36) {
                      objc_enumerationMutation(v33);
                    }
                    uint64_t v38 = *(void *)(*((void *)&v50 + 1) + 8 * n);
                    v39 = [v6 lastObject];
                    [v39 addObject:v38];
                  }
                  uint64_t v35 = [v33 countByEnumeratingWithState:&v50 objects:v66 count:16];
                }
                while (v35);
              }

              uint64_t v7 = v49;
            }
            uint64_t v29 = [v48 countByEnumeratingWithState:&v54 objects:v67 count:16];
          }
          while (v29);
        }

        uint64_t v25 = v46 + 1;
      }
      while (v46 + 1 != v44);
      uint64_t v44 = [v41 countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v44);
  }

  return v6;
}

+ (id)modelSemanticClassesFromModels:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_opt_new();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__SGQuickResponsesRepliesNested_modelSemanticClassesFromModels___block_invoke;
  v7[3] = &unk_2647EA0E0;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __64__SGQuickResponsesRepliesNested_modelSemanticClassesFromModels___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = objc_opt_new();
  unint64_t v4 = [v8 semanticClassIndex];
  id v5 = [v8 semanticClasses];
  uint64_t v6 = [v5 count];

  if (v4 < v6 + v4)
  {
    do
    {
      uint64_t v7 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v4];
      [v3 addObject:v7];

      ++v4;
      --v6;
    }
    while (v6);
  }
  [*(id *)(a1 + 32) addObject:v3];
}

+ (id)categoryModelsFromModels:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 valueForKeyPath:@"@max.category"];
  uint64_t v5 = [v4 unsignedIntegerValue];

  uint64_t v6 = objc_opt_new();
  if (v5 != -1)
  {
    uint64_t v7 = v5 + 1;
    do
    {
      id v8 = objc_opt_new();
      [v6 addObject:v8];

      --v7;
    }
    while (v7);
  }
  if ([v3 count])
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = [v3 objectAtIndexedSubscript:v9];
      uint64_t v11 = [v10 category];

      long long v12 = [v6 objectAtIndexedSubscript:v11];
      long long v13 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v9];
      [v12 addObject:v13];

      ++v9;
    }
    while (v9 < [v3 count]);
  }

  return v6;
}

+ (id)replyModelsForArray:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "[array isKindOfClass:NSArray.class]", buf, 2u);
    }
    id v15 = 0;
    goto LABEL_24;
  }
  unint64_t v4 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (!v6) {
    goto LABEL_11;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v21;
  id v19 = v3;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v3 = v19;
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
        {
LABEL_19:

          goto LABEL_22;
        }
        *(_WORD *)buf = 0;
        v16 = &_os_log_internal;
        uint64_t v17 = "[dictionary isKindOfClass:NSDictionary.class]";
LABEL_28:
        _os_log_fault_impl(&dword_226E32000, v16, OS_LOG_TYPE_FAULT, v17, buf, 2u);
        goto LABEL_19;
      }
      long long v12 = [[SGQuickResponsesReplyModel alloc] initWithDictionary:v11 index:v8];
      if (!v12)
      {
        id v3 = v19;
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
          goto LABEL_19;
        }
        *(_WORD *)buf = 0;
        v16 = &_os_log_internal;
        uint64_t v17 = "replyModel != nil";
        goto LABEL_28;
      }
      long long v13 = v12;
      [v4 addObject:v12];
      uint64_t v14 = [(SGQuickResponsesReplyModel *)v13 semanticClasses];
      v8 += [v14 count];
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    id v3 = v19;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_11:

  if ([(id)objc_opt_class() isZeroBasedAndContiguous:v4])
  {
    id v15 = v4;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "[self.class isZeroBasedAndContiguous:replyModels]", buf, 2u);
    }
LABEL_22:
    id v15 = 0;
  }

LABEL_24:
  return v15;
}

+ (BOOL)isZeroBasedAndContiguous:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    unint64_t v4 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v11 = objc_alloc(NSNumber);
          long long v12 = objc_msgSend(v11, "initWithUnsignedInteger:", objc_msgSend(v10, "category", (void)v21));
          [v4 addObject:v12];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }

    long long v13 = [v4 allObjects];
    uint64_t v14 = [v13 valueForKeyPath:@"@min.unsignedIntegerValue"];
    uint64_t v15 = [v14 unsignedIntegerValue];

    v16 = [v4 allObjects];
    uint64_t v17 = [v16 valueForKeyPath:@"@max.unsignedIntegerValue"];
    uint64_t v18 = [v17 unsignedIntegerValue];

    if (v15) {
      BOOL v19 = 0;
    }
    else {
      BOOL v19 = v18 == [v4 count] - 1;
    }
  }
  else
  {
    BOOL v19 = 1;
  }

  return v19;
}

+ (id)parentArraysFromNestedArray:(id)a3 models:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __68__SGQuickResponsesRepliesNested_parentArraysFromNestedArray_models___block_invoke;
  v16[3] = &unk_2647EA068;
  id v17 = v7;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__SGQuickResponsesRepliesNested_parentArraysFromNestedArray_models___block_invoke_2;
  v13[3] = &unk_2647EA0B8;
  id v14 = v5;
  id v8 = v17;
  id v15 = v8;
  id v9 = v5;
  +[SGNestedArray traversalWithNestedArray:v6 depthCallback:v16 itemCallback:v13];

  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

void __68__SGQuickResponsesRepliesNested_parentArraysFromNestedArray_models___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_opt_new();
  [v1 addObject:v2];
}

void __68__SGQuickResponsesRepliesNested_parentArraysFromNestedArray_models___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (a4)
  {
    id v6 = [a3 objectAtIndexedSubscript:a4 - 1];
    uint64_t v7 = [v6 unsignedIntegerValue];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    id v6 = [a3 objectAtIndexedSubscript:0];
    id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "unsignedIntegerValue"));
    uint64_t v7 = [v9 category];
  }
  id v11 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a4];
  uint64_t v10 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v7];
  [v11 addObject:v10];
}

+ (id)nestedArrayFromFlatArray:(id)a3 nestedIndexes:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v21 = (id)objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v12 = objc_opt_new();
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v23 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "unsignedIntegerValue"));
              [v12 addObject:v18];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v15);
        }

        [v21 addObject:v12];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  return v21;
}

+ (id)flattenedArraysFromNestedArray:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_opt_new();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__SGQuickResponsesRepliesNested_flattenedArraysFromNestedArray___block_invoke;
  v7[3] = &unk_2647EA090;
  id v5 = v4;
  id v8 = v5;
  +[SGNestedArray traversalWithNestedArray:v3 depthCallback:0 itemCallback:v7];

  return v5;
}

void __64__SGQuickResponsesRepliesNested_flattenedArraysFromNestedArray___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  id v15 = a2;
  id v10 = a3;
  if (a4)
  {
    if (a6) {
      goto LABEL_6;
    }
    id v11 = [*(id *)(a1 + 32) lastObject];
    long long v12 = v11;
    id v13 = v15;
  }
  else
  {
    uint64_t v14 = *(void **)(a1 + 32);
    long long v12 = objc_opt_new();
    id v11 = v14;
    id v13 = v12;
  }
  [v11 addObject:v13];

LABEL_6:
}

+ (id)indexedArraysFromNestedArray:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_opt_new();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__SGQuickResponsesRepliesNested_indexedArraysFromNestedArray___block_invoke;
  v11[3] = &unk_2647EA068;
  id v12 = v4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__SGQuickResponsesRepliesNested_indexedArraysFromNestedArray___block_invoke_2;
  v9[3] = &unk_2647EA090;
  id v5 = v12;
  id v10 = v5;
  +[SGNestedArray traversalWithNestedArray:v3 depthCallback:v11 itemCallback:v9];

  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __62__SGQuickResponsesRepliesNested_indexedArraysFromNestedArray___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (id)objc_opt_new();
  [v1 addObject:v2];
}

void __62__SGQuickResponsesRepliesNested_indexedArraysFromNestedArray___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectAtIndexedSubscript:a4];
  [v7 addObject:v6];
}

+ (id)nestedArrayFromModels:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "semanticClasses", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

@end