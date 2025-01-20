@interface FBKQuestionGroup
+ (id)entityName;
+ (id)uniquingKey;
- (BOOL)isFileCollectionGroup;
- (NSArray)questions;
- (id)description;
- (id)questionWithRole:(id)a3;
- (void)setPropertiesFromJSONObject:(id)a3;
- (void)setQuestions:(id)a3;
@end

@implementation FBKQuestionGroup

+ (id)entityName
{
  return @"QuestionGroup";
}

+ (id)uniquingKey
{
  return @"id";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"title"];
  v6 = FBKStringIfNSNull(v5);
  [(FBKQuestionGroup *)self setTitle:v6];

  v7 = [v4 objectForKeyedSubscript:@"sort_order"];
  v8 = FBKNilIfNSNull(v7);
  [(FBKQuestionGroup *)self setSortOrder:v8];

  v9 = [v4 objectForKeyedSubscript:@"questions"];
  v10 = [v4 objectForKeyedSubscript:@"id"];

  v11 = +[FBKManagedLocalIDObject transformJSONArrayIntoLocalIDJSON:v9 uniquingPrefix:v10];

  v12 = [(FBKQuestionGroup *)self managedObjectContext];
  v13 = +[FBKManagedFeedbackObject importFromJSONArray:v11 intoContext:v12];

  v14 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"sortOrder" ascending:1];
  v17[0] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  v16 = [v13 sortedArrayUsingDescriptors:v15];
  [(FBKQuestionGroup *)self setQuestions:v16];
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)FBKQuestionGroup;
  id v4 = [(FBKQuestionGroup *)&v9 description];
  v5 = [(FBKQuestionGroup *)self title];
  v6 = [(FBKQuestionGroup *)self questions];
  v7 = [v3 stringWithFormat:@"%@ title=%@ %lu questions", v4, v5, objc_msgSend(v6, "count")];;

  return v7;
}

- (NSArray)questions
{
  [(FBKQuestionGroup *)self willAccessValueForKey:@"questions"];
  v3 = [(FBKQuestionGroup *)self primitiveQuestions];
  id v4 = [v3 array];
  v5 = objc_msgSend(v4, "ded_rejectItemsPassingTest:", &__block_literal_global_15);

  [(FBKQuestionGroup *)self didAccessValueForKey:@"questions"];

  return (NSArray *)v5;
}

BOOL __29__FBKQuestionGroup_questions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 answerType] == -1;
}

- (void)setQuestions:(id)a3
{
  id v4 = a3;
  [(FBKQuestionGroup *)self willChangeValueForKey:@"questions"];
  v5 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v4];

  [(FBKQuestionGroup *)self setPrimitiveQuestions:v5];

  [(FBKQuestionGroup *)self didChangeValueForKey:@"questions"];
}

- (id)questionWithRole:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(FBKQuestionGroup *)self questions];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_super v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 role];
        char v11 = [v10 isEqualToString:v4];

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

- (BOOL)isFileCollectionGroup
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(FBKQuestionGroup *)self questions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) answerType] == 5)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

@end