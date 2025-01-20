@interface SGQuickResponse
- (BOOL)isConfident;
- (BOOL)isCustomResponse;
- (BOOL)isRobotResponse;
- (NSDictionary)proactiveTrigger;
- (NSString)lang;
- (NSString)text;
- (SGQuickResponse)initWithProactiveTrigger:(id)a3 isConfident:(BOOL)a4;
- (SGQuickResponse)initWithText:(id)a3 lang:(id)a4 replyTextId:(unint64_t)a5 styleGroupId:(unint64_t)a6 semanticClassId:(unint64_t)a7 modelId:(unint64_t)a8 categoryId:(unint64_t)a9 isCustomResponse:(BOOL)a10 isRobotResponse:(BOOL)a11 isConfident:(BOOL)a12;
- (SGQuickResponse)initWithText:(id)a3 lang:(id)a4 replyTextId:(unint64_t)a5 styleGroupId:(unint64_t)a6 semanticClassId:(unint64_t)a7 modelId:(unint64_t)a8 categoryId:(unint64_t)a9 isCustomResponse:(BOOL)a10 isRobotResponse:(BOOL)a11 isConfident:(BOOL)a12 proactiveTrigger:(id)a13;
- (id)description;
- (unint64_t)categoryId;
- (unint64_t)modelId;
- (unint64_t)replyTextId;
- (unint64_t)semanticClassId;
- (unint64_t)styleGroupId;
- (void)setIsConfident:(BOOL)a3;
@end

@implementation SGQuickResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveTrigger, 0);
  objc_storeStrong((id *)&self->_lang, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (BOOL)isConfident
{
  return self->_isConfident;
}

- (NSDictionary)proactiveTrigger
{
  return self->_proactiveTrigger;
}

- (BOOL)isRobotResponse
{
  return self->_isRobotResponse;
}

- (BOOL)isCustomResponse
{
  return self->_isCustomResponse;
}

- (unint64_t)categoryId
{
  return self->_categoryId;
}

- (unint64_t)modelId
{
  return self->_modelId;
}

- (unint64_t)semanticClassId
{
  return self->_semanticClassId;
}

- (unint64_t)styleGroupId
{
  return self->_styleGroupId;
}

- (unint64_t)replyTextId
{
  return self->_replyTextId;
}

- (NSString)lang
{
  return self->_lang;
}

- (NSString)text
{
  return self->_text;
}

- (void)setIsConfident:(BOOL)a3
{
  self->_isConfident = a3;
}

- (id)description
{
  proactiveTrigger = self->_proactiveTrigger;
  if (proactiveTrigger)
  {
    v4 = [(NSDictionary *)proactiveTrigger description];
  }
  else
  {
    v4 = self->_text;
  }
  return v4;
}

- (SGQuickResponse)initWithText:(id)a3 lang:(id)a4 replyTextId:(unint64_t)a5 styleGroupId:(unint64_t)a6 semanticClassId:(unint64_t)a7 modelId:(unint64_t)a8 categoryId:(unint64_t)a9 isCustomResponse:(BOOL)a10 isRobotResponse:(BOOL)a11 isConfident:(BOOL)a12 proactiveTrigger:(id)a13
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v20 = a4;
  id v21 = a13;
  v33.receiver = self;
  v33.super_class = (Class)SGQuickResponse;
  v22 = [(SGQuickResponse *)&v33 init];
  if (v22)
  {
    id v30 = v21;
    id obj = a4;
    id v32 = v20;
    if (a10)
    {
      unint64_t v23 = a8;
      v24 = (NSString *)v19;
    }
    else
    {
      v25 = SGNormalizeEmojisInString(v19);
      char v26 = [v25 isEqualToString:v19];

      if ((v26 & 1) == 0)
      {
        v27 = sgLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v35 = v20;
          _os_log_fault_impl(&dword_226E32000, v27, OS_LOG_TYPE_FAULT, "A (lang: %@) canned response includes emojis with skin-tone modifiers!", buf, 0xCu);
        }

        if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
          abort();
        }
      }
      unint64_t v23 = a8;
      SGPersonalizeEmojisInString(v19);
      v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    text = v22->_text;
    v22->_text = v24;

    objc_storeStrong((id *)&v22->_lang, obj);
    v22->_replyTextId = a5;
    v22->_styleGroupId = a6;
    v22->_semanticClassId = a7;
    v22->_modelId = v23;
    v22->_categoryId = a9;
    v22->_isCustomResponse = a10;
    v22->_isRobotResponse = a11;
    v22->_isConfident = a12;
    objc_storeStrong((id *)&v22->_proactiveTrigger, a13);
    id v20 = v32;
    id v21 = v30;
  }

  return v22;
}

- (SGQuickResponse)initWithProactiveTrigger:(id)a3 isConfident:(BOOL)a4
{
  BYTE2(v5) = a4;
  LOWORD(v5) = 0;
  return -[SGQuickResponse initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:proactiveTrigger:](self, "initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:proactiveTrigger:", &stru_26DAF9368, &stru_26DAF9368, 0, 0, 0, 0, 0, v5, a3);
}

- (SGQuickResponse)initWithText:(id)a3 lang:(id)a4 replyTextId:(unint64_t)a5 styleGroupId:(unint64_t)a6 semanticClassId:(unint64_t)a7 modelId:(unint64_t)a8 categoryId:(unint64_t)a9 isCustomResponse:(BOOL)a10 isRobotResponse:(BOOL)a11 isConfident:(BOOL)a12
{
  id v17 = a3;
  id v18 = a4;
  if (![v17 length])
  {
    id v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SGQuickResponsesInference.m", 94, @"Invalid parameter not satisfying: %@", @"text.length" object file lineNumber description];
  }
  if (![v18 length])
  {
    unint64_t v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SGQuickResponsesInference.m", 95, @"Invalid parameter not satisfying: %@", @"lang.length" object file lineNumber description];
  }
  BYTE2(v22) = a12;
  LOWORD(v22) = __PAIR16__(a11, a10);
  id v19 = -[SGQuickResponse initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:proactiveTrigger:](self, "initWithText:lang:replyTextId:styleGroupId:semanticClassId:modelId:categoryId:isCustomResponse:isRobotResponse:isConfident:proactiveTrigger:", v17, v18, a5, a6, a7, a8, a9, v22, 0);

  return v19;
}

@end