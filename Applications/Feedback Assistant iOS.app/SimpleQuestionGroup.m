@interface SimpleQuestionGroup
- (FBKFormResponse)formResponse;
- (FBKQuestionGroup)questionGroup;
- (NSArray)quesionAnswerPairs;
- (SimpleQuestionGroup)initWithQuestionGroup:(id)a3 questionAnswerPairs:(id)a4;
- (id)allAnswers;
- (id)allQuestions;
- (id)answerInRow:(unint64_t)a3;
- (id)description;
- (id)questionInRow:(unint64_t)a3;
- (int64_t)questionCount;
- (void)setFormResponse:(id)a3;
- (void)setQuesionAnswerPairs:(id)a3;
- (void)setQuestionGroup:(id)a3;
@end

@implementation SimpleQuestionGroup

- (SimpleQuestionGroup)initWithQuestionGroup:(id)a3 questionAnswerPairs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SimpleQuestionGroup;
  v8 = [(SimpleQuestionGroup *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(SimpleQuestionGroup *)v8 setQuestionGroup:v6];
    [(SimpleQuestionGroup *)v9 setQuesionAnswerPairs:v7];
  }

  return v9;
}

- (id)allAnswers
{
  id v3 = objc_alloc((Class)NSMutableArray);
  v4 = [(SimpleQuestionGroup *)self quesionAnswerPairs];
  id v5 = [v3 initWithCapacity:[v4 count]];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(SimpleQuestionGroup *)self quesionAnswerPairs];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) objectForKeyedSubscript:@"a"];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)allQuestions
{
  id v3 = objc_alloc((Class)NSMutableArray);
  v4 = [(SimpleQuestionGroup *)self quesionAnswerPairs];
  id v5 = [v3 initWithCapacity:[v4 count]];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(SimpleQuestionGroup *)self quesionAnswerPairs];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) objectForKeyedSubscript:@"q"];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)questionInRow:(unint64_t)a3
{
  v4 = [(SimpleQuestionGroup *)self quesionAnswerPairs];
  id v5 = [v4 objectAtIndexedSubscript:a3];
  id v6 = [v5 objectForKeyedSubscript:@"q"];

  return v6;
}

- (id)answerInRow:(unint64_t)a3
{
  v4 = [(SimpleQuestionGroup *)self quesionAnswerPairs];
  id v5 = [v4 objectAtIndexedSubscript:a3];
  id v6 = [v5 objectForKeyedSubscript:@"a"];

  return v6;
}

- (int64_t)questionCount
{
  return [(NSArray *)self->_quesionAnswerPairs count];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(SimpleQuestionGroup *)self questionGroup];
  id v5 = [(SimpleQuestionGroup *)self quesionAnswerPairs];
  id v6 = +[NSString stringWithFormat:@"-------------------------\r(%@)\r%@\r%@", v3, v4, v5];

  return v6;
}

- (FBKQuestionGroup)questionGroup
{
  return self->_questionGroup;
}

- (void)setQuestionGroup:(id)a3
{
}

- (FBKFormResponse)formResponse
{
  return self->_formResponse;
}

- (void)setFormResponse:(id)a3
{
}

- (NSArray)quesionAnswerPairs
{
  return self->_quesionAnswerPairs;
}

- (void)setQuesionAnswerPairs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quesionAnswerPairs, 0);
  objc_storeStrong((id *)&self->_formResponse, 0);

  objc_storeStrong((id *)&self->_questionGroup, 0);
}

@end