@interface FBKAnswer
+ (id)_importByQuestionIDFromJSONArray:(id)a3 withFormResponseID:(id)a4 intoContext:(id)a5;
+ (id)emptyLocalAnswerForQuestion:(id)a3 inFormResponse:(id)a4;
+ (id)entityName;
+ (id)keyPathsForValuesAffectingValue;
+ (unint64_t)answerTypeFromString:(id)a3;
- (BOOL)isAnswered;
- (BOOL)isOptedOut;
- (id)value;
- (void)setOptedOut:(BOOL)a3;
- (void)setPropertiesFromJSONObject:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation FBKAnswer

+ (id)entityName
{
  return @"Answer";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = NSNumber;
  v6 = [v4 objectForKeyedSubscript:@"id"];
  v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "integerValue"));

  v8 = NSNumber;
  v9 = [v4 objectForKeyedSubscript:@"question_id"];
  v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "integerValue"));

  v11 = [v4 objectForKeyedSubscript:@"values"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v13 = [MEMORY[0x263EFF980] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v14 = objc_msgSend(v4, "objectForKeyedSubscript:", @"values", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ((FBKJSONObjectIsNil(v19) & 1) == 0) {
            [v13 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v16);
    }

    v20 = (void *)[v13 copy];
  }
  else
  {
    v20 = 0;
  }
  v21 = [v4 objectForKeyedSubscript:@"ignore_required"];
  uint64_t v22 = [v21 BOOLValue];

  [(FBKManagedFeedbackObject *)self setID:v7];
  [(FBKAnswer *)self setQuestionID:v10];
  [(FBKAnswer *)self setValues:v20];
  [(FBKAnswer *)self setOptedOut:v22];
  [(FBKAnswer *)self setResolved:0];
}

+ (id)_importByQuestionIDFromJSONArray:(id)a3 withFormResponseID:(id)a4 intoContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = FBKArrayToKeyDictionary(v7, @"question_id");
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  id v28 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __77__FBKAnswer__importByQuestionIDFromJSONArray_withFormResponseID_intoContext___block_invoke;
  v17[3] = &unk_264877578;
  id v11 = v9;
  id v18 = v11;
  id v12 = v8;
  id v19 = v12;
  id v13 = v7;
  id v20 = v13;
  id v14 = v10;
  id v21 = v14;
  uint64_t v22 = &v23;
  [v11 performBlockAndWait:v17];
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v15;
}

void __77__FBKAnswer__importByQuestionIDFromJSONArray_withFormResponseID_intoContext___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v3 = +[FBKFormResponse entityName];
  id v4 = [v2 feedbackObjectWithEntityName:v3 remoteID:*(void *)(a1 + 40) creatingIfNeeded:0];

  if (v4)
  {
    v44 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v5 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Answer"];
    v6 = (void *)MEMORY[0x263F08A98];
    id v7 = [*(id *)(a1 + 56) allKeys];
    v42 = v4;
    id v8 = [v6 predicateWithFormat:@"questionID in %@ AND formResponse = %@", v7, v4];
    [v5 setPredicate:v8];

    id v9 = *(void **)(a1 + 32);
    id v53 = 0;
    v41 = v5;
    v43 = [v9 executeFetchRequest:v5 error:&v53];
    id v10 = v53;
    id v11 = objc_alloc(MEMORY[0x263EFF9C0]);
    id v12 = [*(id *)(a1 + 56) allKeys];
    id v13 = (void *)[v11 initWithArray:v12];

    v40 = v10;
    if (!v10)
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v14 = v43;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v55 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v50 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            id v20 = *(void **)(a1 + 56);
            id v21 = [v19 questionID];
            uint64_t v22 = [v20 objectForKeyedSubscript:v21];
            [v19 setPropertiesFromJSONObject:v22];

            uint64_t v23 = *(void **)(a1 + 56);
            long long v24 = [v19 questionID];
            uint64_t v25 = [v23 objectForKeyedSubscript:v24];
            long long v26 = [v25 objectForKeyedSubscript:@"id"];
            [v19 setID:v26];

            v27 = [v19 questionID];
            [v13 removeObject:v27];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v49 objects:v55 count:16];
        }
        while (v16);
      }

      [v44 addObjectsFromArray:v14];
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v28 = v13;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v46 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(a1 + 56) objectForKeyedSubscript:*(void *)(*((void *)&v45 + 1) + 8 * j)];
          v34 = *(void **)(a1 + 32);
          v35 = [v33 objectForKeyedSubscript:@"id"];
          v36 = [v34 createFeedbackObjectWithEntityName:@"Answer" remoteID:v35];

          [v36 setPropertiesFromJSONObject:v33];
          [v44 addObject:v36];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v30);
    }

    uint64_t v37 = [v44 copy];
    uint64_t v38 = *(void *)(*(void *)(a1 + 64) + 8);
    v39 = *(void **)(v38 + 40);
    *(void *)(v38 + 40) = v37;

    id v4 = v42;
  }
}

+ (id)emptyLocalAnswerForQuestion:(id)a3 inFormResponse:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__4;
  id v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  id v7 = [v6 managedObjectContext];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__FBKAnswer_emptyLocalAnswerForQuestion_inFormResponse___block_invoke;
  v12[3] = &unk_2648775A0;
  uint64_t v15 = &v16;
  id v8 = v6;
  id v13 = v8;
  id v9 = v5;
  id v14 = v9;
  [v7 performBlockAndWait:v12];

  id v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

uint64_t __56__FBKAnswer_emptyLocalAnswerForQuestion_inFormResponse___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = [v2 createFeedbackObjectWithEntityName:@"Answer" remoteID:&unk_26DE1EA20];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 40) ID];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setQuestionID:v6];

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setQuestion:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) addAnswer:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setValues:MEMORY[0x263EFFA68]];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setOptedOut:0];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setResolved:0];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return [v8 setFormResponse:v7];
}

+ (unint64_t)answerTypeFromString:(id)a3
{
  id v3 = a3;
  if (answerTypeFromString__onceToken != -1) {
    dispatch_once(&answerTypeFromString__onceToken, &__block_literal_global_44);
  }
  uint64_t v4 = [(id)answerTypeFromString__mapping objectForKeyedSubscript:v3];
  id v5 = v4;
  if (v4) {
    unint64_t v6 = [v4 unsignedIntegerValue];
  }
  else {
    unint64_t v6 = -1;
  }

  return v6;
}

void __34__FBKAnswer_answerTypeFromString___block_invoke()
{
  v16[13] = *MEMORY[0x263EF8340];
  v15[0] = @"Text Field";
  id v14 = [NSNumber numberWithUnsignedInteger:0];
  v16[0] = v14;
  v15[1] = @"Text Area";
  id v13 = [NSNumber numberWithUnsignedInteger:1];
  v16[1] = v13;
  v15[2] = @"Popup";
  id v12 = [NSNumber numberWithUnsignedInteger:2];
  v16[2] = v12;
  v15[3] = @"Radio Button";
  v0 = [NSNumber numberWithUnsignedInteger:3];
  v16[3] = v0;
  v15[4] = @"Check Box";
  v1 = [NSNumber numberWithUnsignedInteger:4];
  v16[4] = v1;
  v15[5] = @"Required File Zone";
  v2 = [NSNumber numberWithUnsignedInteger:5];
  v16[5] = v2;
  v15[6] = @"Information";
  id v3 = [NSNumber numberWithUnsignedInteger:6];
  v16[6] = v3;
  v15[7] = @"Slider";
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:7];
  v16[7] = v4;
  v15[8] = @"Date";
  id v5 = [NSNumber numberWithUnsignedInteger:8];
  v16[8] = v5;
  v15[9] = @"Date and Time";
  unint64_t v6 = [NSNumber numberWithUnsignedInteger:9];
  v16[9] = v6;
  v15[10] = @"Time";
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:10];
  v16[10] = v7;
  v15[11] = @"Modal";
  id v8 = [NSNumber numberWithUnsignedInteger:11];
  v16[11] = v8;
  v15[12] = @"Toggle";
  id v9 = [NSNumber numberWithUnsignedInteger:12];
  v16[12] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:13];
  id v11 = (void *)answerTypeFromString__mapping;
  answerTypeFromString__mapping = v10;
}

+ (id)keyPathsForValuesAffectingValue
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"values"];
}

- (id)value
{
  [(FBKAnswer *)self willAccessValueForKey:@"value"];
  id v3 = [(FBKAnswer *)self values];
  if ([v3 count])
  {
    uint64_t v4 = [(FBKAnswer *)self values];
    id v5 = [v4 objectAtIndexedSubscript:0];
  }
  else
  {
    id v5 = 0;
  }

  [(FBKAnswer *)self didAccessValueForKey:@"value"];

  return v5;
}

- (void)setValue:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(FBKAnswer *)self willChangeValueForKey:@"value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithArray:v4];
  }
  else
  {
    if (!v4)
    {
      [(FBKAnswer *)self setValues:MEMORY[0x263EFFA68]];
      goto LABEL_6;
    }
    v7[0] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  unint64_t v6 = (void *)v5;
  [(FBKAnswer *)self setValues:v5];

LABEL_6:
  [(FBKAnswer *)self didChangeValueForKey:@"value"];
}

- (BOOL)isAnswered
{
  v2 = [(FBKAnswer *)self values];
  id v3 = v2;
  if (v2) {
    BOOL v4 = [v2 count] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isOptedOut
{
  [(FBKAnswer *)self willAccessValueForKey:@"optedOut"];
  id v3 = [(FBKAnswer *)self primitiveOptedOut];
  char v4 = [v3 BOOLValue];

  [(FBKAnswer *)self didAccessValueForKey:@"optedOut"];
  return v4;
}

- (void)setOptedOut:(BOOL)a3
{
  BOOL v3 = a3;
  [(FBKAnswer *)self willChangeValueForKey:@"optedOut"];
  uint64_t v5 = [NSNumber numberWithBool:v3];
  [(FBKAnswer *)self setPrimitiveOptedOut:v5];

  [(FBKAnswer *)self didChangeValueForKey:@"optedOut"];
}

@end