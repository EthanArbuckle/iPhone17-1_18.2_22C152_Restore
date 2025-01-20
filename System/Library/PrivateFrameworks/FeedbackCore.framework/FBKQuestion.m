@interface FBKQuestion
+ (id)entityName;
+ (id)uniquingKey;
- (BOOL)affectsRequirements;
- (BOOL)appearsRequiredIfOptional;
- (BOOL)configuresEnhancedLogging;
- (BOOL)isAnswerableByAutoFill;
- (BOOL)isConditional;
- (BOOL)isMultiSelect;
- (BOOL)isRequired;
- (BOOL)matchesInlineChoiceTypes;
- (BOOL)shouldHaveChoices;
- (FBKChoiceSetResolverProtocol)choiceSetResolver;
- (FBKModalConfiguration)EnhancedLoggingModalConfiguration;
- (NSArray)visibleChoices;
- (NSString)tat;
- (id)allChoices;
- (id)answerToDisplayNameValueTransformer;
- (id)choiceForValue:(id)a3;
- (id)description;
- (id)diffableHashWithContext:(id)a3;
- (id)displayTextForAnswer:(id)a3;
- (id)titleForValue:(id)a3;
- (unint64_t)answerType;
- (void)addAnswer:(id)a3;
- (void)prepareForDeletion;
- (void)setAnswerType:(unint64_t)a3;
- (void)setChoiceSetResolver:(id)a3;
- (void)setConditional:(BOOL)a3;
- (void)setPropertiesFromJSONObject:(id)a3;
- (void)setRequired:(BOOL)a3;
- (void)tat;
@end

@implementation FBKQuestion

+ (id)entityName
{
  return @"Question";
}

+ (id)uniquingKey
{
  return @"id";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(FBKManagedLocalIDObject *)self setPropertiesForLocalIDKeys:v4];
  v5 = [v4 objectForKeyedSubscript:@"text"];
  v6 = FBKStringIfNSNull(v5);

  v7 = [v4 objectForKeyedSubscript:@"answer_widget"];
  unint64_t v8 = +[FBKAnswer answerTypeFromString:v7];

  if (v8 == 11)
  {
    if (+[FBKSharedConstants isEnhancedLoggingEnabled]) {
      unint64_t v8 = 11;
    }
    else {
      unint64_t v8 = -1;
    }
  }
  v9 = [v4 objectForKeyedSubscript:@"is_required"];
  unsigned int v55 = [v9 BOOLValue];

  v10 = [v4 objectForKeyedSubscript:@"is_visible_in_form"];
  unsigned int v57 = FBKTrueIfNSNull(v10);

  v11 = [v4 objectForKeyedSubscript:@"tat"];
  v12 = FBKNilIfNSNull(v11);

  v13 = [v4 objectForKeyedSubscript:@"user_agent_populate"];
  v62 = FBKNilIfNSNull(v13);

  v14 = [v4 objectForKeyedSubscript:@"target_user_agent"];
  v61 = FBKNilIfNSNull(v14);

  v15 = [v4 objectForKeyedSubscript:@"placeholder"];
  if (FBKJSONObjectIsNil(v15))
  {

LABEL_9:
    v60 = 0;
    goto LABEL_10;
  }
  v16 = [v4 objectForKeyedSubscript:@"placeholder"];
  uint64_t v17 = [v16 length];

  if (!v17) {
    goto LABEL_9;
  }
  v60 = [v4 objectForKeyedSubscript:@"placeholder"];
LABEL_10:
  v18 = [v4 objectForKeyedSubscript:@"choice_set"];
  v19 = FBKNilIfNSNull(v18);

  v59 = v19;
  if (!v19)
  {
    v30 = 0;
    v21 = 0;
    goto LABEL_31;
  }
  v51 = self;
  id v52 = v4;
  v20 = [v19 objectForKeyedSubscript:@"server_side_resolver"];
  uint64_t v63 = FBKNilIfNSNull(v20);

  v21 = [MEMORY[0x263EFF980] array];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v22 = [v19 objectForKeyedSubscript:@"choice_options"];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v68 objects:v73 count:16];
  if (!v23) {
    goto LABEL_25;
  }
  uint64_t v24 = v23;
  uint64_t v25 = *(void *)v69;
  do
  {
    for (uint64_t i = 0; i != v24; ++i)
    {
      if (*(void *)v69 != v25) {
        objc_enumerationMutation(v22);
      }
      uint64_t v27 = *(void *)(*((void *)&v68 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v28 = +[FBKQuestionChoice choiceFromArray:v27];
        if (!v28) {
          goto LABEL_23;
        }
        goto LABEL_20;
      }
      if (v27)
      {
        v28 = [[FBKQuestionChoice alloc] initWithTitle:v27 value:v27];
LABEL_20:
        [v21 addObject:v28];
        goto LABEL_23;
      }
      v28 = +[FBKLog model];
      if (os_log_type_enabled(&v28->super, OS_LOG_TYPE_ERROR)) {
        [(FBKQuestion *)&buf setPropertiesFromJSONObject:&v28->super];
      }
LABEL_23:
    }
    uint64_t v24 = [v22 countByEnumeratingWithState:&v68 objects:v73 count:16];
  }
  while (v24);
LABEL_25:

  v29 = [v19 objectForKeyedSubscript:@"client_side_resolver"];
  if (FBKJSONObjectIsNil(v29))
  {

    v30 = 0;
    id v4 = v52;
    self = v51;
  }
  else
  {
    v31 = [v19 objectForKeyedSubscript:@"client_side_resolver"];
    v30 = (void *)[v31 length];

    id v4 = v52;
    self = v51;
    if (v30)
    {
      v30 = [v19 objectForKeyedSubscript:@"client_side_resolver"];
    }
  }
  v19 = (void *)v63;
LABEL_31:
  [(FBKQuestion *)self setText:v6];
  [(FBKQuestion *)self setRole:v12];
  [(FBKQuestion *)self setPlaceholder:v60];
  v64 = v19;
  [(FBKQuestion *)self setResolver:v19];
  [(FBKQuestion *)self setAnswerType:v8];
  [(FBKQuestion *)self setRequired:v55];
  [(FBKQuestion *)self setChoices:v21];
  [(FBKQuestion *)self setChoiceSetClientSideResolver:v30];
  [(FBKQuestion *)self setConditional:0];
  [(FBKQuestion *)self setConditions:0];
  [(FBKQuestion *)self setTargetUserAgent:v61];
  [(FBKQuestion *)self setUserAgentPopulate:v62];
  [(FBKQuestion *)self setVisible:v57];
  v32 = [v4 objectForKeyedSubscript:@"sort_order"];
  v33 = FBKNilIfNSNull(v32);
  [(FBKQuestion *)self setSortOrder:v33];

  v34 = [v4 objectForKeyedSubscript:@"conditions"];
  if (v34)
  {
    v35 = [MEMORY[0x263EFF9D0] null];

    if (v34 != v35)
    {
      v36 = (void *)MEMORY[0x263F08900];
      v37 = [v34 dataUsingEncoding:4];
      v38 = [v36 JSONObjectWithData:v37 options:0 error:0];
      [(FBKQuestion *)self setConditions:v38];

      v39 = [(FBKQuestion *)self conditions];

      if (v39) {
        [(FBKQuestion *)self setConditional:1];
      }
    }
  }
  v40 = [v4 objectForKeyedSubscript:@"conditional_question_id"];
  if (v40)
  {
    v41 = [MEMORY[0x263EFF9D0] null];

    if (v40 != v41)
    {
      v42 = [v4 objectForKeyedSubscript:@"conditional_question_value"];
      FBKNilIfNSNull(v42);
      v44 = v43 = v12;

      [(FBKQuestion *)self setConditional:1];
      [(FBKQuestion *)self setConditionQuestionID:v40];
      [(FBKQuestion *)self setConditionValue:v44];

      v12 = v43;
    }
  }
  if (+[FBKSharedConstants isEnhancedLoggingEnabled])
  {
    v45 = [v4 objectForKeyedSubscript:@"modal_configurations"];
    if (v45)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v45 count])
        {
          v58 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"sortOrder" ascending:1];
          v56 = objc_msgSend(v45, "ded_selectItemsPassingTest:", &__block_literal_global_33);
          v65[0] = MEMORY[0x263EF8330];
          v65[1] = 3221225472;
          v65[2] = __43__FBKQuestion_setPropertiesFromJSONObject___block_invoke_2;
          v65[3] = &unk_264875EB8;
          v65[4] = self;
          objc_msgSend(v56, "ded_mapWithBlock:", v65);
          v46 = v54 = v12;
          v72 = v58;
          [MEMORY[0x263EFF8C0] arrayWithObjects:&v72 count:1];
          v48 = v47 = self;
          v53 = [v46 sortedArrayUsingDescriptors:v48];

          self = v47;
          v49 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v53];
          [(FBKQuestion *)v47 setModalConfigurations:v49];

          v12 = v54;
        }
      }
    }
  }
  if ([(FBKQuestion *)self matchesInlineChoiceTypes])
  {
    v50 = [(FBKQuestion *)self choiceSetClientSideResolver];
    -[FBKQuestion setCanDisplayChoicesInline:](self, "setCanDisplayChoicesInline:", [v50 hasPrefix:@"appTitlesBundles"] ^ 1);
  }
  else
  {
    [(FBKQuestion *)self setCanDisplayChoicesInline:0];
  }
}

uint64_t __43__FBKQuestion_setPropertiesFromJSONObject___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __43__FBKQuestion_setPropertiesFromJSONObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 managedObjectContext];
  v5 = +[FBKManagedFeedbackObject importFromJSONObject:v3 intoContext:v4];

  return v5;
}

- (id)allChoices
{
  uint64_t v3 = [(FBKQuestion *)self choiceSetClientSideResolver];
  if (v3
    && (id v4 = (void *)v3,
        [(FBKQuestion *)self choiceSetResolver],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = [(FBKQuestion *)self choiceSetResolver];
    v7 = [v6 choices];
  }
  else
  {
    v7 = [(FBKQuestion *)self choices];
  }

  return v7;
}

- (id)description
{
  uint64_t v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)FBKQuestion;
  id v4 = [(FBKQuestion *)&v10 description];
  v5 = [(FBKQuestion *)self text];
  unint64_t v6 = [(FBKQuestion *)self answerType];
  v7 = [(FBKQuestion *)self choices];
  objc_msgSend(v3, "stringWithFormat:", @"%@ text=%@; answerType=%lu; %lu choices",
    v4,
    v5,
    v6,
  unint64_t v8 = [v7 count]);

  return v8;
}

- (BOOL)affectsRequirements
{
  uint64_t v3 = [(FBKQuestion *)self role];
  if ([v3 isEqualToString:@":type"])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(FBKQuestion *)self role];
    char v4 = [v5 isEqualToString:@":area"];
  }
  return v4;
}

- (id)titleForValue:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(FBKQuestion *)self choices];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 value];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v13 = [v10 title];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v13 = v4;
LABEL_11:

  return v13;
}

- (BOOL)isMultiSelect
{
  return [(FBKQuestion *)self answerType] == 4;
}

- (BOOL)shouldHaveChoices
{
  unint64_t v2 = [(FBKQuestion *)self answerType];
  return (v2 < 8) & (0x9Cu >> v2);
}

- (BOOL)matchesInlineChoiceTypes
{
  return [(FBKQuestion *)self answerType] - 3 < 2;
}

- (id)choiceForValue:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(FBKQuestion *)self choices];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_super v10 = [v9 value];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (unint64_t)answerType
{
  [(FBKQuestion *)self willAccessValueForKey:@"answerType"];
  uint64_t v3 = [(FBKQuestion *)self primitiveAnswerType];
  unint64_t v4 = [v3 integerValue];

  [(FBKQuestion *)self didAccessValueForKey:@"answerType"];
  return v4;
}

- (void)setAnswerType:(unint64_t)a3
{
  [(FBKQuestion *)self willChangeValueForKey:@"answerType"];
  v5 = [NSNumber numberWithInteger:a3];
  [(FBKQuestion *)self setPrimitiveAnswerType:v5];

  [(FBKQuestion *)self didChangeValueForKey:@"answerType"];
}

- (BOOL)isRequired
{
  [(FBKQuestion *)self willAccessValueForKey:@"required"];
  uint64_t v3 = [(FBKQuestion *)self primitiveRequired];
  char v4 = [v3 BOOLValue];

  [(FBKQuestion *)self didAccessValueForKey:@"required"];
  return v4;
}

- (void)setRequired:(BOOL)a3
{
  BOOL v3 = a3;
  [(FBKQuestion *)self willChangeValueForKey:@"required"];
  v5 = [NSNumber numberWithBool:v3];
  [(FBKQuestion *)self setPrimitiveRequired:v5];

  [(FBKQuestion *)self didChangeValueForKey:@"required"];
}

- (BOOL)isConditional
{
  [(FBKQuestion *)self willAccessValueForKey:@"conditional"];
  BOOL v3 = [(FBKQuestion *)self primitiveConditional];
  char v4 = [v3 BOOLValue];

  [(FBKQuestion *)self didAccessValueForKey:@"conditional"];
  return v4;
}

- (void)setConditional:(BOOL)a3
{
  BOOL v3 = a3;
  [(FBKQuestion *)self willChangeValueForKey:@"conditional"];
  v5 = [NSNumber numberWithBool:v3];
  [(FBKQuestion *)self setPrimitiveConditional:v5];

  [(FBKQuestion *)self didChangeValueForKey:@"conditional"];
}

- (BOOL)appearsRequiredIfOptional
{
  BOOL v3 = [(FBKQuestion *)self role];
  if (v3)
  {
    char v4 = [(FBKQuestion *)self role];
    char v5 = [v4 hasSuffix:@"_req"];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)displayTextForAnswer:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = self;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v11 = v4;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_34;
    }
    v32 = v5;
    id v33 = v4;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v13 = [(FBKQuestion *)v5 allChoices];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          v19 = [v18 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v20 = [v18 value];
            char v21 = [v20 isEqualToString:v11];

            if (v21)
            {
LABEL_31:
              id v11 = [v18 title];

              goto LABEL_32;
            }
          }
          else
          {
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    id v22 = v11;
    goto LABEL_30;
  }
  id v34 = v4;
  uint64_t v6 = [v34 value];
  if (!v6
    || (uint64_t v7 = (void *)v6,
        [(FBKQuestion *)v5 choiceSetClientSideResolver],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 hasPrefix:@"appTitlesBundles"],
        v8,
        v7,
        !v9))
  {
    v32 = v5;
    id v33 = v4;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v13 = [(FBKQuestion *)v5 allChoices];
    uint64_t v23 = [v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v40 != v25) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          uint64_t v27 = [v18 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v28 = [v18 value];
            v29 = [v34 value];
            char v30 = [v28 isEqualToString:v29];

            if (v30) {
              goto LABEL_31;
            }
          }
          else
          {
          }
        }
        uint64_t v24 = [v13 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v24);
    }

    id v22 = [v34 value];
LABEL_30:
    id v11 = v22;
LABEL_32:
    char v5 = v32;
    id v4 = v33;
    goto LABEL_33;
  }
  objc_super v10 = [v34 value];
  id v11 = +[FBKAppListResolver displayValueForChoiceValue:v10];

LABEL_33:
LABEL_34:

  return v11;
}

- (BOOL)isAnswerableByAutoFill
{
  return [(FBKQuestion *)self answerType] != 5
      && [(FBKQuestion *)self answerType] != 6
      && [(FBKQuestion *)self answerType] != 11;
}

- (NSString)tat
{
  BOOL v3 = [(FBKQuestion *)self role];

  if (!v3)
  {
    id v4 = +[FBKLog model];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      [(FBKQuestion *)(uint64_t)self tat];
    }
  }
  char v5 = [(FBKQuestion *)self role];

  return (NSString *)v5;
}

- (void)addAnswer:(id)a3
{
  id v4 = a3;
  char v5 = [(FBKQuestion *)self answers];
  uint64_t v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  id v9 = v7;

  uint64_t v8 = [v9 setByAddingObject:v4];

  [(FBKQuestion *)self setAnswers:v8];
}

- (NSArray)visibleChoices
{
  unint64_t v2 = [(FBKQuestion *)self allChoices];
  BOOL v3 = objc_msgSend(v2, "ded_rejectItemsPassingTest:", &__block_literal_global_133);

  return (NSArray *)v3;
}

uint64_t __29__FBKQuestion_visibleChoices__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPrompt];
}

- (id)diffableHashWithContext:(id)a3
{
  id v4 = [a3 answerForQuestion:self];
  char v5 = [v4 values];
  uint64_t v6 = [v5 componentsJoinedByString:@","];
  id v7 = (void *)v6;
  uint64_t v8 = &stru_26DDF6A30;
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  id v9 = v8;

  objc_super v10 = NSString;
  id v11 = [(FBKQuestion *)self role];
  char v12 = [v10 stringWithFormat:@"%@-%@", v11, v9];

  return v12;
}

- (void)prepareForDeletion
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)FBKQuestion;
  [(FBKQuestion *)&v7 prepareForDeletion];
  BOOL v3 = +[FBKLog model];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(FBKManagedLocalIDObject *)self ID];
    char v5 = [v4 stringValue];
    uint64_t v6 = [(FBKQuestion *)self role];
    *(_DWORD *)uint8_t buf = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_22A36D000, v3, OS_LOG_TYPE_INFO, "FBKQuestion [%{public}@: %{public}@] is being deleted.", buf, 0x16u);
  }
}

- (FBKChoiceSetResolverProtocol)choiceSetResolver
{
  return self->choiceSetResolver;
}

- (void)setChoiceSetResolver:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)answerToDisplayNameValueTransformer
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(FBKQuestion *)self choices];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        __int16 v10 = [v9 value];
        id v11 = [v9 title];
        if (v10)
        {
          [v3 setValue:v11 forKey:v10];
        }
        else
        {
          uint64_t v12 = [MEMORY[0x263EFF9D0] null];
          [v3 setValue:v11 forKey:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  long long v13 = [[FBKQuestionValueToDisplayNameTransformer alloc] initWithDictionary:v3];

  return v13;
}

- (BOOL)configuresEnhancedLogging
{
  unint64_t v2 = self;
  BOOL v3 = FBKQuestion.configuresEnhancedLogging.getter();

  return v3;
}

- (FBKModalConfiguration)EnhancedLoggingModalConfiguration
{
  unint64_t v2 = self;
  BOOL v3 = FBKQuestion.EnhancedLoggingModalConfiguration.getter();

  return (FBKModalConfiguration *)v3;
}

- (void)setPropertiesFromJSONObject:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "FBKQuestion choice is nil, will ignore", buf, 2u);
}

- (void)tat
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_22A36D000, a2, OS_LOG_TYPE_FAULT, "Question has no tat: [%{public}@]", (uint8_t *)&v2, 0xCu);
}

@end