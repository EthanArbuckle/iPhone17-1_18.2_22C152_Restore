@interface IRMiLoLSLSingleScoreMO
+ (id)fetchRequest;
+ (id)miLoLSLSingleScoreMOWithMiLoLSLSingleScoreDO:(id)a3 miloPrediction:(id)a4 inManagedObjectContext:(id)a5;
+ (void)setPropertiesOfMiLoLSLSingleScoreMO:(id)a3 IRMiLoLSLSingleScoreDO:(id)a4;
- (id)convert;
@end

@implementation IRMiLoLSLSingleScoreMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"IRMiLoLSLSingleScoreMO"];
}

+ (id)miLoLSLSingleScoreMOWithMiLoLSLSingleScoreDO:(id)a3 miloPrediction:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[IRMiLoLSLSingleScoreMO alloc] initWithContext:v7];

  [(IRMiLoLSLSingleScoreMO *)v10 setPrediction:v8];
  +[IRMiLoLSLSingleScoreMO setPropertiesOfMiLoLSLSingleScoreMO:v10 IRMiLoLSLSingleScoreDO:v9];

  return v10;
}

+ (void)setPropertiesOfMiLoLSLSingleScoreMO:(id)a3 IRMiLoLSLSingleScoreDO:(id)a4
{
  id v5 = a4;
  id v9 = a3;
  v6 = [v5 eventID];
  [v9 setEventId:v6];

  [v5 score];
  double v8 = v7;

  [v9 setScore:v8];
}

- (id)convert
{
  v3 = [IRMiloLslSingleScoreDO alloc];
  [(IRMiLoLSLSingleScoreMO *)self score];
  double v5 = v4;
  v6 = [(IRMiLoLSLSingleScoreMO *)self eventId];
  double v7 = [(IRMiloLslSingleScoreDO *)v3 initWithScore:v6 eventID:v5];

  return v7;
}

@end