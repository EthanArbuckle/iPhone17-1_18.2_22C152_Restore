@interface FCCAtypicalDayConfiguration
- (FCCAtypicalDayConfiguration)initWithIdentifier:(id)a3 minimumAheadPercentage:(double)a4 minimumBehindPercentage:(double)a5 percentageOfDayRule:(id)a6 allowedGoalTypes:(id)a7;
- (FCCAtypicalDayConfiguration)initWithProtobuf:(id)a3;
- (FCCAtypicalDayConfiguration)initWithTransportData:(id)a3;
- (FCCPercentageOfDayRule)percentageOfDayRule;
- (NSArray)allowedGoalTypes;
- (NSString)identifier;
- (double)minimumAheadPercentage;
- (double)minimumBehindPercentage;
- (id)description;
- (id)protobuf;
- (id)transportData;
@end

@implementation FCCAtypicalDayConfiguration

- (FCCAtypicalDayConfiguration)initWithIdentifier:(id)a3 minimumAheadPercentage:(double)a4 minimumBehindPercentage:(double)a5 percentageOfDayRule:(id)a6 allowedGoalTypes:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)FCCAtypicalDayConfiguration;
  v15 = [(FCCAtypicalDayConfiguration *)&v21 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    v15->_minimumAheadPercentage = a4;
    v15->_minimumBehindPercentage = a5;
    objc_storeStrong((id *)&v15->_percentageOfDayRule, a6);
    uint64_t v18 = [v14 copy];
    allowedGoalTypes = v15->_allowedGoalTypes;
    v15->_allowedGoalTypes = (NSArray *)v18;
  }
  return v15;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"FCCAtypicalDayConfiguration: { \n    identifier: %@, \n    minimumAheadPercentage: %.1f, \n    minimumBehindPercentage: %.1f, \n    allowedGoalTypes: %@ \n    percentageOfDayRule: %@ \n}", self->_identifier, *(void *)&self->_minimumAheadPercentage, *(void *)&self->_minimumBehindPercentage, self->_allowedGoalTypes, self->_percentageOfDayRule];
}

- (FCCAtypicalDayConfiguration)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  [v4 minimumAheadPercentage];
  double v7 = v6;
  [v4 minimumBehindPercentage];
  double v9 = v8;
  v10 = [FCCPercentageOfDayRule alloc];
  v11 = [v4 percentageOfDayRule];
  id v12 = [(FCCPercentageOfDayRule *)v10 initWithProtobuf:v11];

  if ([v4 allowedGoalTypesCount])
  {
    unint64_t v13 = 0;
    id v14 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "allowedGoalTypesAtIndex:", v13));
      uint64_t v16 = [v14 arrayByAddingObject:v15];

      ++v13;
      id v14 = v16;
    }
    while ([v4 allowedGoalTypesCount] > v13);
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v17 = [(FCCAtypicalDayConfiguration *)self initWithIdentifier:v5 minimumAheadPercentage:v12 minimumBehindPercentage:v16 percentageOfDayRule:v7 allowedGoalTypes:v9];

  return v17;
}

- (id)protobuf
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(FCCAtypicalDayConfigurationProtobuf);
  [(FCCAtypicalDayConfigurationProtobuf *)v3 setIdentifier:self->_identifier];
  [(FCCAtypicalDayConfigurationProtobuf *)v3 setMinimumAheadPercentage:self->_minimumAheadPercentage];
  [(FCCAtypicalDayConfigurationProtobuf *)v3 setMinimumBehindPercentage:self->_minimumBehindPercentage];
  id v4 = [(FCCPercentageOfDayRule *)self->_percentageOfDayRule protobuf];
  [(FCCAtypicalDayConfigurationProtobuf *)v3 setPercentageOfDayRule:v4];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_allowedGoalTypes;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[FCCAtypicalDayConfigurationProtobuf addAllowedGoalTypes:](v3, "addAllowedGoalTypes:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "unsignedIntValue", (void)v11));
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v3;
}

- (FCCAtypicalDayConfiguration)initWithTransportData:(id)a3
{
  id v4 = a3;
  v5 = [[FCCAtypicalDayConfigurationProtobuf alloc] initWithData:v4];

  uint64_t v6 = [(FCCAtypicalDayConfiguration *)self initWithProtobuf:v5];
  return v6;
}

- (id)transportData
{
  v2 = [(FCCAtypicalDayConfiguration *)self protobuf];
  v3 = [v2 data];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (double)minimumAheadPercentage
{
  return self->_minimumAheadPercentage;
}

- (double)minimumBehindPercentage
{
  return self->_minimumBehindPercentage;
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
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end