@interface FCCGoalCompletionContent
- (FCCGoalCompletionContent)initWithActivitySummaryIndex:(int64_t)a3 identifier:(id)a4 completedGoalTypes:(id)a5;
- (FCCGoalCompletionContent)initWithTransportData:(id)a3;
- (NSArray)completedGoalTypes;
- (NSString)description;
- (NSString)identifier;
- (id)transportData;
- (int64_t)activitySummaryIndex;
@end

@implementation FCCGoalCompletionContent

- (FCCGoalCompletionContent)initWithActivitySummaryIndex:(int64_t)a3 identifier:(id)a4 completedGoalTypes:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FCCGoalCompletionContent;
  v10 = [(FCCGoalCompletionContent *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_activitySummaryIndex = a3;
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    completedGoalTypes = v11->_completedGoalTypes;
    v11->_completedGoalTypes = (NSArray *)v14;
  }
  return v11;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"FCCGoalCompletionContent: activitySummaryIndex: %lld, identifier: %@, completedGoalTypes: %@", self->_activitySummaryIndex, self->_identifier, self->_completedGoalTypes];
}

- (FCCGoalCompletionContent)initWithTransportData:(id)a3
{
  id v4 = a3;
  v5 = [[FCCGoalCompletionProtobuf alloc] initWithData:v4];
  uint64_t v6 = [(FCCGoalCompletionProtobuf *)v5 activitySummaryIndex];
  v7 = [(FCCGoalCompletionProtobuf *)v5 identifier];
  if ([(FCCGoalCompletionProtobuf *)v5 completedGoalTypesCount])
  {
    unint64_t v8 = 0;
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      v10 = objc_msgSend(NSNumber, "numberWithInt:", -[FCCGoalCompletionProtobuf completedGoalTypesAtIndex:](v5, "completedGoalTypesAtIndex:", v8));
      v11 = [v9 arrayByAddingObject:v10];

      ++v8;
      id v9 = v11;
    }
    while ([(FCCGoalCompletionProtobuf *)v5 completedGoalTypesCount] > v8);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v12 = [(FCCGoalCompletionContent *)self initWithActivitySummaryIndex:v6 identifier:v7 completedGoalTypes:v11];

  return v12;
}

- (id)transportData
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(FCCGoalCompletionProtobuf);
  [(FCCGoalCompletionProtobuf *)v3 setActivitySummaryIndex:self->_activitySummaryIndex];
  [(FCCGoalCompletionProtobuf *)v3 setIdentifier:self->_identifier];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_completedGoalTypes;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        -[FCCGoalCompletionProtobuf addCompletedGoalTypes:](v3, "addCompletedGoalTypes:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "unsignedIntValue", (void)v11));
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  id v9 = [(FCCGoalCompletionProtobuf *)v3 data];

  return v9;
}

- (int64_t)activitySummaryIndex
{
  return self->_activitySummaryIndex;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)completedGoalTypes
{
  return self->_completedGoalTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedGoalTypes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end