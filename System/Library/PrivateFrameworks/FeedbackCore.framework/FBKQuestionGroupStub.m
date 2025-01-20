@interface FBKQuestionGroupStub
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)setPropertiesFromJSONObject:(id)a3;
- (FBKQuestionGroupStub)initWithCoder:(id)a3;
- (FBKQuestionGroupStub)initWithJSONObject:(id)a3;
- (FBKQuestionGroupStub)initWithTitle:(id)a3 questions:(id)a4;
- (NSArray)questionAnswerPairs;
- (NSString)title;
- (void)encodeWithCoder:(id)a3;
- (void)setQuestionAnswerPairs:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation FBKQuestionGroupStub

- (FBKQuestionGroupStub)initWithJSONObject:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBKQuestionGroupStub;
  v5 = [(FBKQuestionGroupStub *)&v9 init];
  v6 = v5;
  if (v5 && ![(FBKQuestionGroupStub *)v5 setPropertiesFromJSONObject:v4]) {
    v7 = 0;
  }
  else {
    v7 = v6;
  }

  return v7;
}

- (FBKQuestionGroupStub)initWithTitle:(id)a3 questions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FBKQuestionGroupStub;
  objc_super v9 = [(FBKQuestionGroupStub *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    uint64_t v11 = [v8 copy];
    questionAnswerPairs = v10->_questionAnswerPairs;
    v10->_questionAnswerPairs = (NSArray *)v11;
  }
  return v10;
}

- (BOOL)setPropertiesFromJSONObject:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27 = 0;
  FBKQuestionAnswerPairAssignObjectForKey(v4, @"title", &v27);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v27;
  id v7 = v27;

  if (v5
    && (objc_storeStrong((id *)&self->_title, v6),
        v26 = 0,
        FBKQuestionAnswerPairAssignObjectForKey(v4, @"questions", &v26),
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v5 = v26,
        v8,
        v8))
  {
    v20 = self;
    v21 = v7;
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    objc_super v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = v5;
    uint64_t v10 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v5);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * v13);
          v15 = [[FBKQuestionAnswerPair alloc] initWithJSONObject:v14];
          if (v15)
          {
            [(NSArray *)v9 addObject:v15];
          }
          else
          {
            v16 = +[FBKLog model];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v29 = v14;
              _os_log_error_impl(&dword_22A36D000, v16, OS_LOG_TYPE_ERROR, "Failed to add question-answer pair from %{public}@", buf, 0xCu);
            }
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v11);
    }

    questionAnswerPairs = v20->_questionAnswerPairs;
    v20->_questionAnswerPairs = v9;

    BOOL v18 = 1;
    id v7 = v21;
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (FBKQuestionGroupStub)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FBKQuestionGroupStub;
  id v5 = [(FBKQuestionGroupStub *)&v19 init];
  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  title = v5->_title;
  v5->_title = (NSString *)v6;

  id v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  id v18 = 0;
  uint64_t v12 = [v4 decodeTopLevelObjectOfClasses:v11 forKey:@"questions" error:&v18];
  id v13 = v18;
  questionAnswerPairs = v5->_questionAnswerPairs;
  v5->_questionAnswerPairs = (NSArray *)v12;

  if (!v13)
  {

LABEL_7:
    v16 = v5;
    goto LABEL_8;
  }
  v15 = +[FBKLog model];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[FBKQuestionGroupStub initWithCoder:](v13, v15);
  }

  v16 = 0;
LABEL_8:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FBKQuestionGroupStub *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  id v6 = [(FBKQuestionGroupStub *)self questionAnswerPairs];
  [v4 encodeObject:v6 forKey:@"questions"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    id v6 = [(FBKQuestionGroupStub *)self questionAnswerPairs];
    uint64_t v7 = [v6 count];
    id v8 = [v5 questionAnswerPairs];
    uint64_t v9 = [v8 count];

    if (v7 == v9)
    {
      uint64_t v10 = [(FBKQuestionGroupStub *)self questionAnswerPairs];
      uint64_t v11 = (void *)[v10 count];

      if (v11)
      {
        unint64_t v12 = 0;
        uint64_t v11 = 0;
        id v13 = 0;
        while (1)
        {
          uint64_t v14 = v13;
          v15 = v11;
          v16 = [(FBKQuestionGroupStub *)self questionAnswerPairs];
          id v13 = [v16 objectAtIndexedSubscript:v12];

          v17 = [v5 questionAnswerPairs];
          uint64_t v11 = [v17 objectAtIndexedSubscript:v12];

          if (([v13 isEqual:v11] & 1) == 0) {
            break;
          }
          ++v12;
          id v18 = [(FBKQuestionGroupStub *)self questionAnswerPairs];
          unint64_t v19 = [v18 count];

          if (v12 >= v19) {
            goto LABEL_12;
          }
        }
        char v20 = 0;
      }
      else
      {
        id v13 = 0;
LABEL_12:
        v21 = [(FBKQuestionGroupStub *)self title];
        long long v22 = [v5 title];
        char v20 = [v21 isEqualToString:v22];
      }
    }
    else
    {
      char v20 = 0;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)questionAnswerPairs
{
  return self->_questionAnswerPairs;
}

- (void)setQuestionAnswerPairs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_questionAnswerPairs, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 description];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Error decoding question answer pair object. %{public}@", (uint8_t *)&v4, 0xCu);
}

@end