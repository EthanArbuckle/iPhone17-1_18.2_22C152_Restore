@interface NLPredictedWorkoutActivityType
- (NSDictionary)baseMetadata;
- (id)uniqueIdentifier;
@end

@implementation NLPredictedWorkoutActivityType

- (id)uniqueIdentifier
{
  v5.receiver = self;
  v5.super_class = (Class)NLPredictedWorkoutActivityType;
  v2 = [(FIUIWorkoutActivityType *)&v5 uniqueIdentifier];
  v3 = [v2 stringByAppendingString:@",predictedType"];

  return v3;
}

- (NSDictionary)baseMetadata
{
  v2 = [(FIUIWorkoutActivityType *)self metadata];
  v3 = (void *)[v2 mutableCopy];

  [v3 removeObjectForKey:@"BackdatedStartDate"];
  [v3 removeObjectForKey:@"PredictionSessionUUID"];
  return (NSDictionary *)v3;
}

@end