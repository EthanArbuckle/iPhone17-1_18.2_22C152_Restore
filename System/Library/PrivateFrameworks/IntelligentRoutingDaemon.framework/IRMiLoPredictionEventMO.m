@interface IRMiLoPredictionEventMO
+ (id)fetchRequest;
+ (id)miloPredictionEventMOWithmiloPredictionEventDO:(id)a3 historyEventMO:(id)a4 inManagedObjectContext:(id)a5;
+ (void)setPropertiesOfMiloPredictionEventMO:(id)a3 withMiloPredictionEventDO:(id)a4;
- (id)convert;
@end

@implementation IRMiLoPredictionEventMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"IRMiLoPredictionEventMO"];
}

+ (id)miloPredictionEventMOWithmiloPredictionEventDO:(id)a3 historyEventMO:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[IRMiLoPredictionEventMO alloc] initWithContext:v7];

  [(IRMiLoPredictionEventMO *)v10 setHistoryEvent:v8];
  +[IRMiLoPredictionEventMO setPropertiesOfMiloPredictionEventMO:v10 withMiloPredictionEventDO:v9];

  return v10;
}

+ (void)setPropertiesOfMiloPredictionEventMO:(id)a3 withMiloPredictionEventDO:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 label];
  [v6 setLabel:v7];

  id v8 = [v5 predictionId];

  [v6 setPredictionId:v8];
}

- (id)convert
{
  v3 = [(IRMiLoPredictionEventMO *)self label];
  v4 = [(IRMiLoPredictionEventMO *)self predictionId];
  id v5 = +[IRMiLoPredictionEventDO miLoPredictionEventDOWithLabel:v3 predictionId:v4];

  return v5;
}

@end