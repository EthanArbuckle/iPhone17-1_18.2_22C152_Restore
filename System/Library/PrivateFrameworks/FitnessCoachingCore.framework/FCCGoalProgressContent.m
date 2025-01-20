@interface FCCGoalProgressContent
- (FCCGoalProgressContent)initWithEventIdentifier:(id)a3 goalTypesToDisplay:(id)a4 goalTypeToHighlight:(int64_t)a5 expectedGoalValue:(double)a6;
- (FCCGoalProgressContent)initWithTransportData:(id)a3;
- (NSArray)goalTypesToDisplay;
- (NSString)description;
- (NSString)eventIdentifier;
- (double)expectedGoalValue;
- (id)transportData;
- (int64_t)goalTypeToHighlight;
@end

@implementation FCCGoalProgressContent

- (FCCGoalProgressContent)initWithEventIdentifier:(id)a3 goalTypesToDisplay:(id)a4 goalTypeToHighlight:(int64_t)a5 expectedGoalValue:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FCCGoalProgressContent;
  v12 = [(FCCGoalProgressContent *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    eventIdentifier = v12->_eventIdentifier;
    v12->_eventIdentifier = (NSString *)v13;

    uint64_t v15 = [v11 copy];
    goalTypesToDisplay = v12->_goalTypesToDisplay;
    v12->_goalTypesToDisplay = (NSArray *)v15;

    v12->_goalTypeToHighlight = a5;
    v12->_expectedGoalValue = a6;
  }

  return v12;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"FCCGoalProgressContent: {\n    eventIdentifier: %@, \n    goalTypesToDisplay: %@, \n    goalTypeToHighlight: %d, \n    expectedGoalValue: %.1f \n}", self->_eventIdentifier, self->_goalTypesToDisplay, self->_goalTypeToHighlight, *(void *)&self->_expectedGoalValue];
}

- (FCCGoalProgressContent)initWithTransportData:(id)a3
{
  id v4 = a3;
  v5 = [[FCCGoalProgressContentProtobuf alloc] initWithData:v4];
  v6 = [(FCCGoalProgressContentProtobuf *)v5 eventIdentifier];
  if ([(FCCGoalProgressContentProtobuf *)v5 goalTypesToDisplaysCount])
  {
    unint64_t v7 = 0;
    v8 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      v9 = objc_msgSend(NSNumber, "numberWithInt:", -[FCCGoalProgressContentProtobuf goalTypesToDisplayAtIndex:](v5, "goalTypesToDisplayAtIndex:", v7));
      id v10 = [v8 arrayByAddingObject:v9];

      ++v7;
      v8 = v10;
    }
    while ([(FCCGoalProgressContentProtobuf *)v5 goalTypesToDisplaysCount] > v7);
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v11 = [(FCCGoalProgressContentProtobuf *)v5 goalTypeToHighlight];
  [(FCCGoalProgressContentProtobuf *)v5 expectedGoalValue];
  v12 = -[FCCGoalProgressContent initWithEventIdentifier:goalTypesToDisplay:goalTypeToHighlight:expectedGoalValue:](self, "initWithEventIdentifier:goalTypesToDisplay:goalTypeToHighlight:expectedGoalValue:", v6, v10, v11);

  return v12;
}

- (id)transportData
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(FCCGoalProgressContentProtobuf);
  [(FCCGoalProgressContentProtobuf *)v3 setEventIdentifier:self->_eventIdentifier];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_goalTypesToDisplay;
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
        -[FCCGoalProgressContentProtobuf addGoalTypesToDisplay:](v3, "addGoalTypesToDisplay:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "unsignedIntValue", (void)v11));
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(FCCGoalProgressContentProtobuf *)v3 setGoalTypeToHighlight:LODWORD(self->_goalTypeToHighlight)];
  [(FCCGoalProgressContentProtobuf *)v3 setExpectedGoalValue:self->_expectedGoalValue];
  v9 = [(FCCGoalProgressContentProtobuf *)v3 data];

  return v9;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (NSArray)goalTypesToDisplay
{
  return self->_goalTypesToDisplay;
}

- (int64_t)goalTypeToHighlight
{
  return self->_goalTypeToHighlight;
}

- (double)expectedGoalValue
{
  return self->_expectedGoalValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goalTypesToDisplay, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

@end