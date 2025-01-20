@interface FCCFitnessPlusPlanState
- (BOOL)hasWorkoutScheduledToday;
- (FCCFitnessPlusPlanState)initWithHasWorkoutScheduledToday:(BOOL)a3;
- (FCCFitnessPlusPlanState)initWithTransportData:(id)a3;
- (NSString)description;
- (id)transportData;
@end

@implementation FCCFitnessPlusPlanState

- (FCCFitnessPlusPlanState)initWithHasWorkoutScheduledToday:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FCCFitnessPlusPlanState;
  result = [(FCCFitnessPlusPlanState *)&v5 init];
  if (result) {
    result->_hasWorkoutScheduledToday = a3;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"FCCFitnessPlusPlanSate: hasWorkoutScheduledToday: %{BOOL}d", self->_hasWorkoutScheduledToday);
}

- (FCCFitnessPlusPlanState)initWithTransportData:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[FCCFitnessPlusPlanStateProtobuf alloc] initWithData:v4];

  v6 = [(FCCFitnessPlusPlanState *)self initWithHasWorkoutScheduledToday:[(FCCFitnessPlusPlanStateProtobuf *)v5 hasWorkoutScheduledToday]];
  return v6;
}

- (id)transportData
{
  v3 = objc_alloc_init(FCCFitnessPlusPlanStateProtobuf);
  [(FCCFitnessPlusPlanStateProtobuf *)v3 setHasWorkoutScheduledToday:self->_hasWorkoutScheduledToday];
  id v4 = [(FCCFitnessPlusPlanStateProtobuf *)v3 data];

  return v4;
}

- (BOOL)hasWorkoutScheduledToday
{
  return self->_hasWorkoutScheduledToday;
}

@end