@interface FCCAlmostThereConfiguration
- (FCCAlmostThereConfiguration)initWithIdentifier:(id)a3 minimumPercentageComplete:(double)a4 goalBufferPercentage:(double)a5 coalescingRules:(id)a6 timeOfDayRule:(id)a7 goalType:(int64_t)a8;
- (FCCAlmostThereConfiguration)initWithProtobuf:(id)a3;
- (FCCAlmostThereConfiguration)initWithTransportData:(id)a3;
- (FCCTimeOfDayRule)timeOfDayRule;
- (NSArray)coalescingRules;
- (NSString)identifier;
- (double)goalBufferPercentage;
- (double)minimumPercentageComplete;
- (id)description;
- (id)protobuf;
- (id)transportData;
- (int64_t)goalType;
@end

@implementation FCCAlmostThereConfiguration

- (FCCAlmostThereConfiguration)initWithIdentifier:(id)a3 minimumPercentageComplete:(double)a4 goalBufferPercentage:(double)a5 coalescingRules:(id)a6 timeOfDayRule:(id)a7 goalType:(int64_t)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)FCCAlmostThereConfiguration;
  v17 = [(FCCAlmostThereConfiguration *)&v23 init];
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    v17->_minimumPercentageComplete = a4;
    v17->_goalBufferPercentage = a5;
    uint64_t v20 = [v15 copy];
    coalescingRules = v17->_coalescingRules;
    v17->_coalescingRules = (NSArray *)v20;

    objc_storeStrong((id *)&v17->_timeOfDayRule, a7);
    v17->_goalType = a8;
  }

  return v17;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"FCCAlmostThereConfiguration: {\n    identifier: %@, \n    minimumPercentageComplete: %.1f, \n    goalBufferPercentage: %.1f, \n    goalType: %d \n    coalescingRules: %@ \n    timeOfDayRule: %@ \n}", self->_identifier, *(void *)&self->_minimumPercentageComplete, *(void *)&self->_goalBufferPercentage, self->_goalType, self->_coalescingRules, self->_timeOfDayRule];
}

- (FCCAlmostThereConfiguration)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  [v4 minimumPercentageComplete];
  double v7 = v6;
  [v4 goalBufferPercentage];
  double v9 = v8;
  if ([v4 coalescingRulesCount])
  {
    unint64_t v10 = 0;
    v11 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      v12 = [FCCCoalescingRule alloc];
      v13 = [v4 coalescingRulesAtIndex:v10];
      id v14 = [v13 data];
      id v15 = [(FCCCoalescingRule *)v12 initWithTransportData:v14];

      id v16 = [v11 arrayByAddingObject:v15];

      ++v10;
      v11 = v16;
    }
    while ([v4 coalescingRulesCount] > v10);
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v17 = [FCCTimeOfDayRule alloc];
  uint64_t v18 = [v4 timeOfDayRule];
  v19 = [(FCCTimeOfDayRule *)v17 initWithProtobuf:v18];

  uint64_t v20 = -[FCCAlmostThereConfiguration initWithIdentifier:minimumPercentageComplete:goalBufferPercentage:coalescingRules:timeOfDayRule:goalType:](self, "initWithIdentifier:minimumPercentageComplete:goalBufferPercentage:coalescingRules:timeOfDayRule:goalType:", v5, v16, v19, (int)[v4 goalType], v7, v9);
  return v20;
}

- (id)protobuf
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(FCCAlmostThereConfigurationProtobuf);
  [(FCCAlmostThereConfigurationProtobuf *)v3 setIdentifier:self->_identifier];
  [(FCCAlmostThereConfigurationProtobuf *)v3 setMinimumPercentageComplete:self->_minimumPercentageComplete];
  [(FCCAlmostThereConfigurationProtobuf *)v3 setGoalBufferPercentage:self->_goalBufferPercentage];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_coalescingRules;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "protobuf", (void)v12);
        [(FCCAlmostThereConfigurationProtobuf *)v3 addCoalescingRules:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  unint64_t v10 = [(FCCTimeOfDayRule *)self->_timeOfDayRule protobuf];
  [(FCCAlmostThereConfigurationProtobuf *)v3 setTimeOfDayRule:v10];

  [(FCCAlmostThereConfigurationProtobuf *)v3 setGoalType:LODWORD(self->_goalType)];
  return v3;
}

- (FCCAlmostThereConfiguration)initWithTransportData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[FCCAlmostThereConfigurationProtobuf alloc] initWithData:v4];

  uint64_t v6 = [(FCCAlmostThereConfiguration *)self initWithProtobuf:v5];
  return v6;
}

- (id)transportData
{
  v2 = [(FCCAlmostThereConfiguration *)self protobuf];
  v3 = [v2 data];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)minimumPercentageComplete
{
  return self->_minimumPercentageComplete;
}

- (double)goalBufferPercentage
{
  return self->_goalBufferPercentage;
}

- (NSArray)coalescingRules
{
  return self->_coalescingRules;
}

- (FCCTimeOfDayRule)timeOfDayRule
{
  return self->_timeOfDayRule;
}

- (int64_t)goalType
{
  return self->_goalType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfDayRule, 0);
  objc_storeStrong((id *)&self->_coalescingRules, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end