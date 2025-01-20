@interface FCCCompletionOffTrackConfiguration
- (FCCCompletionOffTrackConfiguration)initWithIdentifier:(id)a3 goalBufferPercentage:(double)a4 coalescingRules:(id)a5 percentageOfDayRule:(id)a6 allowedGoalTypes:(id)a7;
- (FCCCompletionOffTrackConfiguration)initWithProtobuf:(id)a3;
- (FCCCompletionOffTrackConfiguration)initWithTransportData:(id)a3;
- (FCCPercentageOfDayRule)percentageOfDayRule;
- (NSArray)allowedGoalTypes;
- (NSArray)coalescingRules;
- (NSString)identifier;
- (double)goalBufferPercentage;
- (id)description;
- (id)protobuf;
- (id)transportData;
@end

@implementation FCCCompletionOffTrackConfiguration

- (FCCCompletionOffTrackConfiguration)initWithIdentifier:(id)a3 goalBufferPercentage:(double)a4 coalescingRules:(id)a5 percentageOfDayRule:(id)a6 allowedGoalTypes:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)FCCCompletionOffTrackConfiguration;
  v16 = [(FCCCompletionOffTrackConfiguration *)&v24 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    v16->_goalBufferPercentage = a4;
    uint64_t v19 = [v13 copy];
    coalescingRules = v16->_coalescingRules;
    v16->_coalescingRules = (NSArray *)v19;

    objc_storeStrong((id *)&v16->_percentageOfDayRule, a6);
    uint64_t v21 = [v15 copy];
    allowedGoalTypes = v16->_allowedGoalTypes;
    v16->_allowedGoalTypes = (NSArray *)v21;
  }
  return v16;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"FCCCompletionOffTrackConfiguration: { \n    identifier: %@, \n    goalBufferPercentage: %.1f, \n    allowedGoalTypes: %@, \n    coalescingRules: %@ \n    percentageOfDayRule: %@ \n}", self->_identifier, *(void *)&self->_goalBufferPercentage, self->_allowedGoalTypes, self->_coalescingRules, self->_percentageOfDayRule];
}

- (FCCCompletionOffTrackConfiguration)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  [v4 goalBufferPercentage];
  double v7 = v6;
  if ([v4 coalescingRulesCount])
  {
    unint64_t v8 = 0;
    v9 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      v10 = [FCCCoalescingRule alloc];
      v11 = [v4 coalescingRulesAtIndex:v8];
      id v12 = [v11 data];
      id v13 = [(FCCCoalescingRule *)v10 initWithTransportData:v12];

      id v14 = [v9 arrayByAddingObject:v13];

      ++v8;
      v9 = v14;
    }
    while ([v4 coalescingRulesCount] > v8);
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v15 = [FCCPercentageOfDayRule alloc];
  v16 = [v4 percentageOfDayRule];
  uint64_t v17 = [(FCCPercentageOfDayRule *)v15 initWithProtobuf:v16];

  if ([v4 allowedGoalTypesCount])
  {
    unint64_t v18 = 0;
    uint64_t v19 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "allowedGoalTypesAtIndex:", v18));
      uint64_t v21 = [v19 arrayByAddingObject:v20];

      ++v18;
      uint64_t v19 = v21;
    }
    while ([v4 allowedGoalTypesCount] > v18);
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v22 = [(FCCCompletionOffTrackConfiguration *)self initWithIdentifier:v5 goalBufferPercentage:v14 coalescingRules:v17 percentageOfDayRule:v21 allowedGoalTypes:v7];

  return v22;
}

- (id)protobuf
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(FCCCompletionOffTrackConfigurationProtobuf);
  [(FCCCompletionOffTrackConfigurationProtobuf *)v3 setIdentifier:self->_identifier];
  [(FCCCompletionOffTrackConfigurationProtobuf *)v3 setGoalBufferPercentage:self->_goalBufferPercentage];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = self->_coalescingRules;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v21 + 1) + 8 * i) protobuf];
        [(FCCCompletionOffTrackConfigurationProtobuf *)v3 addCoalescingRules:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  v10 = [(FCCPercentageOfDayRule *)self->_percentageOfDayRule protobuf];
  [(FCCCompletionOffTrackConfigurationProtobuf *)v3 setPercentageOfDayRule:v10];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v11 = self->_allowedGoalTypes;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        -[FCCCompletionOffTrackConfigurationProtobuf addAllowedGoalTypes:](v3, "addAllowedGoalTypes:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * j), "unsignedIntValue", (void)v17));
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }

  return v3;
}

- (FCCCompletionOffTrackConfiguration)initWithTransportData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[FCCCompletionOffTrackConfigurationProtobuf alloc] initWithData:v4];

  uint64_t v6 = [(FCCCompletionOffTrackConfiguration *)self initWithProtobuf:v5];
  return v6;
}

- (id)transportData
{
  v2 = [(FCCCompletionOffTrackConfiguration *)self protobuf];
  v3 = [v2 data];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)goalBufferPercentage
{
  return self->_goalBufferPercentage;
}

- (NSArray)coalescingRules
{
  return self->_coalescingRules;
}

- (FCCPercentageOfDayRule)percentageOfDayRule
{
  return self->_percentageOfDayRule;
}

- (NSArray)allowedGoalTypes
{
  return self->_allowedGoalTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedGoalTypes, 0);
  objc_storeStrong((id *)&self->_percentageOfDayRule, 0);
  objc_storeStrong((id *)&self->_coalescingRules, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end