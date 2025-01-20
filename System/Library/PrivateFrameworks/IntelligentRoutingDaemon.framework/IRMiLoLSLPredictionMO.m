@interface IRMiLoLSLPredictionMO
+ (id)fetchRequest;
+ (id)miLoLSLPredictionMOWithMiLoLSLPredictionDO:(id)a3 replayEvent:(id)a4 inManagedObjectContext:(id)a5;
+ (void)setPropertiesOfMiLoLSLPredictionMO:(id)a3 withMiLoLSLPredictionDO:(id)a4 inManagedObjectContext:(id)a5;
- (id)convert;
@end

@implementation IRMiLoLSLPredictionMO

+ (id)miLoLSLPredictionMOWithMiLoLSLPredictionDO:(id)a3 replayEvent:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[IRMiLoLSLPredictionMO alloc] initWithContext:v7];
  [(IRMiLoLSLPredictionMO *)v10 setReplayEvent:v8];

  +[IRMiLoLSLPredictionMO setPropertiesOfMiLoLSLPredictionMO:v10 withMiLoLSLPredictionDO:v9 inManagedObjectContext:v7];

  return v10;
}

+ (void)setPropertiesOfMiLoLSLPredictionMO:(id)a3 withMiLoLSLPredictionDO:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v9 predictionId];
  [v7 setPredictionId:v10];

  objc_msgSend(v7, "setMiLoServiceQuality:", objc_msgSend(v9, "miLoServiceQuality"));
  objc_msgSend(v7, "setMiLoServiceQualityReasonBitmap:", objc_msgSend(v9, "miLoServiceQualityReasonBitmap"));
  v11 = [v9 scores];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __107__IRMiLoLSLPredictionMO_setPropertiesOfMiLoLSLPredictionMO_withMiLoLSLPredictionDO_inManagedObjectContext___block_invoke;
  v25[3] = &unk_2653A0350;
  id v12 = v7;
  id v26 = v12;
  id v13 = v8;
  id v27 = v13;
  [v11 enumerateObjectsUsingBlock:v25];

  v14 = [v9 nearbyDevices];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __107__IRMiLoLSLPredictionMO_setPropertiesOfMiLoLSLPredictionMO_withMiLoLSLPredictionDO_inManagedObjectContext___block_invoke_2;
  v22 = &unk_2653A0378;
  id v23 = v12;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  [v14 enumerateObjectsUsingBlock:&v19];

  v17 = objc_msgSend(v9, "predictionTime", v19, v20, v21, v22);
  [v16 setPredictionTime:v17];

  objc_msgSend(v16, "setConfidence:", objc_msgSend(v9, "confidence"));
  uint64_t v18 = [v9 confidenceReasonBitmap];

  [v16 setConfidenceReasonBitmap:v18];
}

void __107__IRMiLoLSLPredictionMO_setPropertiesOfMiLoLSLPredictionMO_withMiLoLSLPredictionDO_inManagedObjectContext___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[IRMiLoLSLSingleScoreMO miLoLSLSingleScoreMOWithMiLoLSLSingleScoreDO:a2 miloPrediction:v2 inManagedObjectContext:*(void *)(a1 + 40)];
  [v2 addScoresObject:v3];
}

void __107__IRMiLoLSLPredictionMO_setPropertiesOfMiLoLSLPredictionMO_withMiLoLSLPredictionDO_inManagedObjectContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[IRMiLoNearbyDeviceMO miLoNearbyDeviceMOWithMiLoNearbyDeviceDO:a2 miloPrediction:v2 inManagedObjectContext:*(void *)(a1 + 40)];
  [v2 addNearbyDevicesObject:v3];
}

- (id)convert
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v4 = [(IRMiLoLSLPredictionMO *)self scores];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __32__IRMiLoLSLPredictionMO_convert__block_invoke;
  v23[3] = &unk_2653A03A0;
  id v24 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v23];

  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v7 = [(IRMiLoLSLPredictionMO *)self nearbyDevices];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __32__IRMiLoLSLPredictionMO_convert__block_invoke_2;
  v21 = &unk_2653A03C8;
  id v22 = v6;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:&v18];

  id v9 = [IRMiloLslPredictionDO alloc];
  v10 = [(IRMiLoLSLPredictionMO *)self predictionId];
  uint64_t v11 = [(IRMiLoLSLPredictionMO *)self miLoServiceQuality];
  uint64_t v12 = [(IRMiLoLSLPredictionMO *)self miLoServiceQualityReasonBitmap];
  id v13 = [(IRMiLoLSLPredictionMO *)self predictionTime];
  uint64_t v14 = [(IRMiLoLSLPredictionMO *)self confidence];
  uint64_t v15 = [(IRMiLoLSLPredictionMO *)self confidenceReasonBitmap];
  id v16 = -[IRMiloLslPredictionDO initWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:](v9, "initWithPredictionId:miLoServiceQuality:miLoServiceQualityReasonBitmap:scores:nearbyDevices:predictionTime:confidence:confidenceReasonBitmap:", v10, v11, v12, v5, v8, v13, v14, v15, v18, v19, v20, v21);

  return v16;
}

void __32__IRMiLoLSLPredictionMO_convert__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 convert];
  [v2 addObject:v3];
}

void __32__IRMiLoLSLPredictionMO_convert__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 convert];
  [v2 addObject:v3];
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"IRMiLoLSLPredictionMO"];
}

@end