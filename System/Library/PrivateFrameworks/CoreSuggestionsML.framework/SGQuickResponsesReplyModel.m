@interface SGQuickResponsesReplyModel
+ (id)semanticClassesForArray:(id)a3;
- (BOOL)dynamicLabel;
- (NSArray)selectedPseudocounts;
- (NSArray)semanticClasses;
- (SGQuickResponsesReplyModel)initWithDictionary:(id)a3 index:(unint64_t)a4;
- (double)scoreWeight;
- (unint64_t)category;
- (unint64_t)semanticClassIndex;
@end

@implementation SGQuickResponsesReplyModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPseudocounts, 0);
  objc_storeStrong((id *)&self->_semanticClasses, 0);
}

- (BOOL)dynamicLabel
{
  return self->_dynamicLabel;
}

- (unint64_t)category
{
  return self->_category;
}

- (double)scoreWeight
{
  return self->_scoreWeight;
}

- (NSArray)selectedPseudocounts
{
  return self->_selectedPseudocounts;
}

- (NSArray)semanticClasses
{
  return self->_semanticClasses;
}

- (unint64_t)semanticClassIndex
{
  return self->_semanticClassIndex;
}

- (SGQuickResponsesReplyModel)initWithDictionary:(id)a3 index:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6)
  {

    v26.receiver = self;
    v26.super_class = (Class)SGQuickResponsesReplyModel;
    self = [(SGQuickResponsesReplyModel *)&v26 init];
    if (!self) {
      goto LABEL_28;
    }
    uint64_t v8 = [v7 arrayAssertedForKey:@"RESPONSE_CLASSES"];
    if (v8)
    {
      v9 = (void *)v8;
      self->_semanticClassIndex = a4;
      v10 = +[SGQuickResponsesReplyModel semanticClassesForArray:v8];
      if (!v10)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v20 = &_os_log_internal;
          v21 = "[SGQuickResponsesReplyModel semanticClassesForArray:array]";
          goto LABEL_24;
        }
LABEL_25:

        goto LABEL_26;
      }
      semanticClasses = self->_semanticClasses;
      self->_semanticClasses = v10;

      v12 = [v7 arrayAssertedForKey:@"REPLY_TEXT_SELECTED_PSEUDOCOUNTS"];
      if (!v12)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v20 = &_os_log_internal;
          v21 = "[dictionary arrayAssertedForKey:REPLY_TEXT_SELECTED_PSEUDOCOUNTS]";
          goto LABEL_24;
        }
        goto LABEL_25;
      }
      selectedPseudocounts = self->_selectedPseudocounts;
      self->_selectedPseudocounts = v12;

      v14 = [v7 numberAssertedForKey:@"MODEL_SCORE_WEIGHT"];
      if (!v14)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v20 = &_os_log_internal;
          v21 = "[dictionary numberAssertedForKey:MODEL_SCORE_WEIGHT]";
          goto LABEL_24;
        }
        goto LABEL_25;
      }
      v15 = v14;
      [v14 doubleValue];
      self->_scoreWeight = v16;

      v17 = [v7 numberAssertedForKey:@"MODEL_CATEGORY"];
      if (!v17)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v20 = &_os_log_internal;
          v21 = "[dictionary numberAssertedForKey:MODEL_CATEGORY]";
          goto LABEL_24;
        }
        goto LABEL_25;
      }
      v18 = v17;
      self->_category = [v17 unsignedIntegerValue];

      v19 = [v7 objectForKeyedSubscript:@"DYNAMIC_LABEL"];
      self->_dynamicLabel = [v19 BOOLValue];

      if (self->_scoreWeight < 0.0)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v20 = &_os_log_internal;
          v21 = "_scoreWeight >= 0";
LABEL_24:
          _os_log_fault_impl(&dword_226E32000, v20, OS_LOG_TYPE_FAULT, v21, buf, 2u);
          goto LABEL_25;
        }
        goto LABEL_25;
      }

LABEL_28:
      self = self;
      v24 = self;
      goto LABEL_29;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v22 = &_os_log_internal;
      v23 = "[dictionary arrayAssertedForKey:RESPONSE_CLASSES]";
      goto LABEL_15;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    v22 = &_os_log_internal;
    v23 = "dictionary";
LABEL_15:
    _os_log_fault_impl(&dword_226E32000, v22, OS_LOG_TYPE_FAULT, v23, buf, 2u);
  }
LABEL_26:
  v24 = 0;
LABEL_29:

  return v24;
}

+ (id)semanticClassesForArray:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v44;
    unint64_t v9 = 0x263EFF000uLL;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v31 = v7;
      do
      {
        if (*(void *)v44 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v43 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "[semanticClass isKindOfClass:NSArray.class]", buf, 2u);
          }
LABEL_33:

          id v26 = 0;
          goto LABEL_34;
        }
        v12 = objc_opt_new();
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v48 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v39;
          v32 = v4;
          v33 = v13;
          uint64_t v28 = *(void *)v39;
          uint64_t v29 = v8;
          while (2)
          {
            uint64_t v16 = 0;
            uint64_t v30 = v14;
            do
            {
              if (*(void *)v39 != v15) {
                objc_enumerationMutation(v13);
              }
              v17 = *(void **)(*((void *)&v38 + 1) + 8 * v16);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                id v18 = (id)objc_msgSend(objc_alloc(*(Class *)(v9 + 2240)), "initWithObjects:", v17, 0);
              }
              else {
                id v18 = v17;
              }
              id v19 = v18;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "[replyGroup isKindOfClass:NSArray.class]", buf, 2u);
                }
                v4 = v32;
LABEL_32:

                goto LABEL_33;
              }
              v20 = v12;
              id v21 = v5;
              long long v36 = 0u;
              long long v37 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              id v19 = v19;
              uint64_t v22 = [v19 countByEnumeratingWithState:&v34 objects:v47 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v35;
                while (2)
                {
                  for (uint64_t i = 0; i != v23; ++i)
                  {
                    if (*(void *)v35 != v24) {
                      objc_enumerationMutation(v19);
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_fault_impl(&dword_226E32000, &_os_log_internal, OS_LOG_TYPE_FAULT, "[string isKindOfClass:NSString.class]", buf, 2u);
                      }

                      id v5 = v21;
                      v12 = v20;
                      v4 = v32;
                      id v13 = v33;
                      goto LABEL_32;
                    }
                  }
                  uint64_t v23 = [v19 countByEnumeratingWithState:&v34 objects:v47 count:16];
                  if (v23) {
                    continue;
                  }
                  break;
                }
              }

              v12 = v20;
              [v20 addObject:v19];

              ++v16;
              uint64_t v8 = v29;
              id v5 = v21;
              unint64_t v9 = 0x263EFF000;
              id v13 = v33;
              uint64_t v15 = v28;
            }
            while (v16 != v30);
            uint64_t v14 = [v33 countByEnumeratingWithState:&v38 objects:v48 count:16];
            v4 = v32;
            if (v14) {
              continue;
            }
            break;
          }
        }

        [v4 addObject:v12];
        ++v10;
      }
      while (v10 != v31);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v26 = v4;
LABEL_34:

  return v26;
}

@end