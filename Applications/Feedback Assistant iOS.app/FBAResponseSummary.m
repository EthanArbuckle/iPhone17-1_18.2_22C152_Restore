@interface FBAResponseSummary
- (FBAResponseSummary)init;
- (FBKFormResponse)formResponse;
- (NSMutableArray)simpleGroups;
- (id)description;
- (id)simpleGroupInSection:(unint64_t)a3;
- (int64_t)sectionCount;
- (void)setFormResponse:(id)a3;
- (void)setSimpleGroups:(id)a3;
- (void)updateWithFormResponse:(id)a3;
@end

@implementation FBAResponseSummary

- (FBAResponseSummary)init
{
  v5.receiver = self;
  v5.super_class = (Class)FBAResponseSummary;
  v2 = [(FBAResponseSummary *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(FBAResponseSummary *)v2 setSimpleGroups:v3];
  }
  return v2;
}

- (void)updateWithFormResponse:(id)a3
{
  id v35 = a3;
  -[FBAResponseSummary setFormResponse:](self, "setFormResponse:");
  v4 = [(FBAResponseSummary *)self simpleGroups];
  [v4 removeAllObjects];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  objc_super v5 = [(FBAResponseSummary *)self formResponse];
  v6 = [v5 bugForm];
  v7 = [v6 questionGroups];

  id obj = v7;
  id v36 = [v7 countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v47;
    uint64_t v8 = FBKQuestionRoleOptOutReason;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v47 != v34) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v46 + 1) + 8 * v9);
        v39 = objc_opt_new();
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        v11 = [v10 questions];
        id v12 = [v11 countByEnumeratingWithState:&v42 objects:v52 count:16];
        v37 = v10;
        uint64_t v38 = v9;
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v43;
          uint64_t v40 = *(void *)v43;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v43 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              v17 = [v16 role];
              unsigned __int8 v18 = [v17 isEqualToString:v8];

              if ((v18 & 1) == 0)
              {
                v19 = [(FBAResponseSummary *)self formResponse];
                v20 = [v16 ID];
                v21 = [v19 answerForQuestionID:v20];

                if (v21)
                {
                  unsigned int v22 = [v21 resolved];
                  if (v22)
                  {
                    v23 = [v21 value];
                    v41 = v23;
                    if (![v23 length]) {
                      goto LABEL_20;
                    }
                  }
                  uint64_t v24 = v8;
                  v25 = v11;
                  v26 = self;
                  v27 = [(FBAResponseSummary *)self formResponse];
                  unsigned int v28 = [v27 isAnswerExpectedForQuestion:v16];

                  if (v22)
                  {

                    if ((v28 & 1) == 0) {
                      goto LABEL_17;
                    }
LABEL_19:
                    v50[0] = @"q";
                    v50[1] = @"a";
                    v51[0] = v16;
                    v51[1] = v21;
                    v23 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
                    [v39 addObject:v23];
                    self = v26;
                    v11 = v25;
                    uint64_t v8 = v24;
                    uint64_t v14 = v40;
LABEL_20:
                  }
                  else
                  {
                    if (v28) {
                      goto LABEL_19;
                    }
LABEL_17:
                    self = v26;
                    v11 = v25;
                    uint64_t v8 = v24;
                    uint64_t v14 = v40;
                  }
                }

                continue;
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v42 objects:v52 count:16];
          }
          while (v13);
        }

        v29 = [SimpleQuestionGroup alloc];
        id v30 = [objc_alloc((Class)NSArray) initWithArray:v39 copyItems:1];
        v31 = [(SimpleQuestionGroup *)v29 initWithQuestionGroup:v37 questionAnswerPairs:v30];

        [(SimpleQuestionGroup *)v31 setFormResponse:v35];
        v32 = [(FBAResponseSummary *)self simpleGroups];
        [v32 addObject:v31];

        uint64_t v9 = v38 + 1;
      }
      while ((id)(v38 + 1) != v36);
      id v36 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v36);
  }
}

- (id)description
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = [(FBAResponseSummary *)self simpleGroups];
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    v7 = &stru_1000F6658;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v7;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v10 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v8) description];
        v7 = +[NSString stringWithFormat:@"%@\r%@", v9, v10];

        uint64_t v8 = (char *)v8 + 1;
        uint64_t v9 = v7;
      }
      while (v5 != v8);
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    v7 = &stru_1000F6658;
  }

  uint64_t v11 = objc_opt_class();
  id v12 = [(FBAResponseSummary *)self formResponse];
  id v13 = +[NSString stringWithFormat:@"%@\r%@\r%@", v11, v12, v7];

  return v13;
}

- (id)simpleGroupInSection:(unint64_t)a3
{
  id v4 = [(FBAResponseSummary *)self simpleGroups];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (int64_t)sectionCount
{
  v2 = [(FBAResponseSummary *)self simpleGroups];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (FBKFormResponse)formResponse
{
  return self->_formResponse;
}

- (void)setFormResponse:(id)a3
{
}

- (NSMutableArray)simpleGroups
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSimpleGroups:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simpleGroups, 0);

  objc_storeStrong((id *)&self->_formResponse, 0);
}

@end