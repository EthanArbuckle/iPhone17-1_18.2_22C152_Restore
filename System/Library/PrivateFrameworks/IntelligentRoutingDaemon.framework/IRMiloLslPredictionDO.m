@interface IRMiloLslPredictionDO
+ (BOOL)supportsSecureCoding;
+ (IRMiloLslPredictionDO)miloLslPredictionDOWithPredictionId:(id)a3 miLoServiceQuality:(int64_t)a4 miLoServiceQualityReasonBitmap:(int64_t)a5 scores:(id)a6 nearbyDevices:(id)a7 predictionTime:(id)a8 confidence:(int64_t)a9 confidenceReasonBitmap:(int64_t)a10;
- (BOOL)canLabel;
- (BOOL)canUse;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMiloLslPredictionDO:(id)a3;
- (BOOL)isInMotion;
- (BOOL)isTemporarilyUnavailable;
- (IRMiloLslPredictionDO)initWithCoder:(id)a3;
- (IRMiloLslPredictionDO)initWithPredictionId:(id)a3 miLoServiceQuality:(int64_t)a4 miLoServiceQualityReasonBitmap:(int64_t)a5 scores:(id)a6 nearbyDevices:(id)a7 predictionTime:(id)a8 confidence:(int64_t)a9 confidenceReasonBitmap:(int64_t)a10;
- (NSDate)predictionTime;
- (NSSet)nearbyDevices;
- (NSSet)scores;
- (NSString)predictionId;
- (double)scoreForPredictionId:(id)a3 andLabel:(id)a4;
- (id)copyWithReplacementConfidence:(int64_t)a3;
- (id)copyWithReplacementConfidenceReasonBitmap:(int64_t)a3;
- (id)copyWithReplacementMiLoServiceQuality:(int64_t)a3;
- (id)copyWithReplacementMiLoServiceQualityReasonBitmap:(int64_t)a3;
- (id)copyWithReplacementNearbyDevices:(id)a3;
- (id)copyWithReplacementPredictionId:(id)a3;
- (id)copyWithReplacementPredictionTime:(id)a3;
- (id)copyWithReplacementScores:(id)a3;
- (id)description;
- (id)exportAsDictionary;
- (int64_t)confidence;
- (int64_t)confidenceReasonBitmap;
- (int64_t)miLoServiceQuality;
- (int64_t)miLoServiceQualityReasonBitmap;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRMiloLslPredictionDO

- (id)exportAsDictionary
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(IRMiloLslPredictionDO *)self predictionId];
  v21 = v3;
  [v3 setObject:v4 forKeyedSubscript:@"predictionId"];

  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v20 = self;
  v6 = [(IRMiloLslPredictionDO *)self scores];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v12 = NSNumber;
        [v11 score];
        v13 = objc_msgSend(v12, "numberWithDouble:");
        [v5 setObject:v13 forKeyedSubscript:@"score"];

        v14 = [v11 eventID];
        [v5 setObject:v14 forKeyedSubscript:@"eventID"];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  [v21 setObject:v5 forKeyedSubscript:@"scores"];
  v15 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IRMiloLslPredictionDO miLoServiceQuality](v20, "miLoServiceQuality"));
  [v21 setObject:v15 forKeyedSubscript:@"miLoServiceQuality"];

  v16 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IRMiloLslPredictionDO miLoServiceQualityReasonBitmap](v20, "miLoServiceQualityReasonBitmap"));
  [v21 setObject:v16 forKeyedSubscript:@"miLoServiceQualityReasonBitmap"];

  v17 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IRMiloLslPredictionDO confidence](v20, "confidence"));
  [v21 setObject:v17 forKeyedSubscript:@"miLoPredictionConfidence"];

  v18 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IRMiloLslPredictionDO confidenceReasonBitmap](v20, "confidenceReasonBitmap"));
  [v21 setObject:v18 forKeyedSubscript:@"miLoPredictionConfidenceReasonsBitmap"];

  return v21;
}

- (double)scoreForPredictionId:(id)a3 andLabel:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = 0.0;
  if ([(IRMiloLslPredictionDO *)self canUse])
  {
    uint64_t v9 = [(IRMiloLslPredictionDO *)self predictionId];
    char v10 = [v9 isEqual:v6];

    double v8 = 1.0;
    if ((v10 & 1) == 0)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v11 = [(IRMiloLslPredictionDO *)self scores];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      double v8 = 0.0;
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            v17 = [v16 eventID];
            char v18 = [v17 isEqual:v7];

            if (v18)
            {
              [v16 score];
              double v8 = v19;
              goto LABEL_13;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
  }

  return v8;
}

- (BOOL)canLabel
{
  int64_t v2 = [(IRMiloLslPredictionDO *)self confidence];

  return +[IRMiLoProvider isConfidenceValid:v2];
}

- (BOOL)canUse
{
  if (!+[IRMiLoProvider isConfidenceValid:](IRMiLoProvider, "isConfidenceValid:", [(IRMiloLslPredictionDO *)self confidence])|| !+[IRMiLoProvider isQualityValid:[(IRMiloLslPredictionDO *)self miLoServiceQuality]])
  {
    return 0;
  }
  id v3 = [(IRMiloLslPredictionDO *)self scores];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isInMotion
{
  int64_t v2 = [(IRMiloLslPredictionDO *)self confidenceReasonBitmap];

  return +[IRMiLoProvider isInMotion:v2];
}

- (BOOL)isTemporarilyUnavailable
{
  if (+[IRMiLoProvider isQualityValid:[(IRMiloLslPredictionDO *)self miLoServiceQuality]])
  {
    id v3 = [(IRMiloLslPredictionDO *)self scores];
    if (v3) {
      BOOL v4 = !+[IRMiLoProvider isConfidenceValid:[(IRMiloLslPredictionDO *)self confidence]];
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (IRMiloLslPredictionDO)initWithPredictionId:(id)a3 miLoServiceQuality:(int64_t)a4 miLoServiceQualityReasonBitmap:(int64_t)a5 scores:(id)a6 nearbyDevices:(id)a7 predictionTime:(id)a8 confidence:(int64_t)a9 confidenceReasonBitmap:(int64_t)a10
{
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)IRMiloLslPredictionDO;
  v20 = [(IRMiloLslPredictionDO *)&v24 init];
  long long v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_predictionId, a3);
    v21->_miLoServiceQuality = a4;
    v21->_miLoServiceQualityReasonBitmap = a5;
    objc_storeStrong((id *)&v21->_scores, a6);
    objc_storeStrong((id *)&v21->_nearbyDevices, a7);
    objc_storeStrong((id *)&v21->_predictionTime, a8);
    v21->_confidence = a9;
    v21->_confidenceReasonBitmap = a10;
  }

  return v21;
}

+ (IRMiloLslPredictionDO)miloLslPredictionDOWithPredictionId:(id)a3 miLoServiceQuality:(int64_t)a4 miLoServiceQualityReasonBitmap:(int64_t)a5 scores:(id)a6 nearbyDevices:(id)a7 predictionTime:(id)a8 confidence:(int64_t)a9 confidenceReasonBitmap:(int64_t)a10
{
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a3;
  v20 = (void *)[objc_alloc((Class)a1) initWithPredictionId:v19 miLoServiceQuality:a4 miLoServiceQualityReasonBitmap:a5 scores:v18 nearbyDevices:v17 predictionTime:v16 confidence:a9 confidenceReasonBitmap:a10];

  return (IRMiloLslPredictionDO *)v20;
}

- (id)copyWithReplacementPredictionId:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPredictionId:v4 miLoServiceQuality:self->_miLoServiceQuality miLoServiceQualityReasonBitmap:self->_miLoServiceQualityReasonBitmap scores:self->_scores nearbyDevices:self->_nearbyDevices predictionTime:self->_predictionTime confidence:self->_confidence confidenceReasonBitmap:self->_confidenceReasonBitmap];

  return v5;
}

- (id)copyWithReplacementMiLoServiceQuality:(int64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithPredictionId:self->_predictionId miLoServiceQuality:a3 miLoServiceQualityReasonBitmap:self->_miLoServiceQualityReasonBitmap scores:self->_scores nearbyDevices:self->_nearbyDevices predictionTime:self->_predictionTime confidence:self->_confidence confidenceReasonBitmap:self->_confidenceReasonBitmap];
}

- (id)copyWithReplacementMiLoServiceQualityReasonBitmap:(int64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithPredictionId:self->_predictionId miLoServiceQuality:self->_miLoServiceQuality miLoServiceQualityReasonBitmap:a3 scores:self->_scores nearbyDevices:self->_nearbyDevices predictionTime:self->_predictionTime confidence:self->_confidence confidenceReasonBitmap:self->_confidenceReasonBitmap];
}

- (id)copyWithReplacementScores:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPredictionId:self->_predictionId miLoServiceQuality:self->_miLoServiceQuality miLoServiceQualityReasonBitmap:self->_miLoServiceQualityReasonBitmap scores:v4 nearbyDevices:self->_nearbyDevices predictionTime:self->_predictionTime confidence:self->_confidence confidenceReasonBitmap:self->_confidenceReasonBitmap];

  return v5;
}

- (id)copyWithReplacementNearbyDevices:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPredictionId:self->_predictionId miLoServiceQuality:self->_miLoServiceQuality miLoServiceQualityReasonBitmap:self->_miLoServiceQualityReasonBitmap scores:self->_scores nearbyDevices:v4 predictionTime:self->_predictionTime confidence:self->_confidence confidenceReasonBitmap:self->_confidenceReasonBitmap];

  return v5;
}

- (id)copyWithReplacementPredictionTime:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPredictionId:self->_predictionId miLoServiceQuality:self->_miLoServiceQuality miLoServiceQualityReasonBitmap:self->_miLoServiceQualityReasonBitmap scores:self->_scores nearbyDevices:self->_nearbyDevices predictionTime:v4 confidence:self->_confidence confidenceReasonBitmap:self->_confidenceReasonBitmap];

  return v5;
}

- (id)copyWithReplacementConfidence:(int64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithPredictionId:self->_predictionId miLoServiceQuality:self->_miLoServiceQuality miLoServiceQualityReasonBitmap:self->_miLoServiceQualityReasonBitmap scores:self->_scores nearbyDevices:self->_nearbyDevices predictionTime:self->_predictionTime confidence:a3 confidenceReasonBitmap:self->_confidenceReasonBitmap];
}

- (id)copyWithReplacementConfidenceReasonBitmap:(int64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithPredictionId:self->_predictionId miLoServiceQuality:self->_miLoServiceQuality miLoServiceQualityReasonBitmap:self->_miLoServiceQualityReasonBitmap scores:self->_scores nearbyDevices:self->_nearbyDevices predictionTime:self->_predictionTime confidence:self->_confidence confidenceReasonBitmap:a3];
}

- (BOOL)isEqualToMiloLslPredictionDO:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_18;
  }
  int v6 = self->_predictionId != 0;
  id v7 = [v4 predictionId];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_18;
  }
  predictionId = self->_predictionId;
  if (predictionId)
  {
    char v10 = [v5 predictionId];
    int v11 = [(NSString *)predictionId isEqual:v10];

    if (!v11) {
      goto LABEL_18;
    }
  }
  int64_t miLoServiceQuality = self->_miLoServiceQuality;
  if (miLoServiceQuality != [v5 miLoServiceQuality]) {
    goto LABEL_18;
  }
  int64_t miLoServiceQualityReasonBitmap = self->_miLoServiceQualityReasonBitmap;
  if (miLoServiceQualityReasonBitmap != [v5 miLoServiceQualityReasonBitmap]) {
    goto LABEL_18;
  }
  int v14 = self->_scores != 0;
  v15 = [v5 scores];
  int v16 = v15 == 0;

  if (v14 == v16) {
    goto LABEL_18;
  }
  scores = self->_scores;
  if (scores)
  {
    id v18 = [v5 scores];
    int v19 = [(NSSet *)scores isEqual:v18];

    if (!v19) {
      goto LABEL_18;
    }
  }
  int v20 = self->_nearbyDevices != 0;
  long long v21 = [v5 nearbyDevices];
  int v22 = v21 == 0;

  if (v20 == v22) {
    goto LABEL_18;
  }
  nearbyDevices = self->_nearbyDevices;
  if (nearbyDevices)
  {
    objc_super v24 = [v5 nearbyDevices];
    int v25 = [(NSSet *)nearbyDevices isEqual:v24];

    if (!v25) {
      goto LABEL_18;
    }
  }
  int v26 = self->_predictionTime != 0;
  uint64_t v27 = [v5 predictionTime];
  int v28 = v27 == 0;

  if (v26 == v28) {
    goto LABEL_18;
  }
  predictionTime = self->_predictionTime;
  if (predictionTime)
  {
    v30 = [v5 predictionTime];
    int v31 = [(NSDate *)predictionTime isEqual:v30];

    if (!v31) {
      goto LABEL_18;
    }
  }
  int64_t confidence = self->_confidence;
  if (confidence != [v5 confidence])
  {
LABEL_18:
    BOOL v34 = 0;
  }
  else
  {
    int64_t confidenceReasonBitmap = self->_confidenceReasonBitmap;
    BOOL v34 = confidenceReasonBitmap == [v5 confidenceReasonBitmap];
  }

  return v34;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IRMiloLslPredictionDO *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IRMiloLslPredictionDO *)self isEqualToMiloLslPredictionDO:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_predictionId hash];
  int64_t v4 = self->_miLoServiceQuality - v3 + 32 * v3;
  int64_t v5 = self->_miLoServiceQualityReasonBitmap - v4 + 32 * v4;
  uint64_t v6 = [(NSSet *)self->_scores hash] - v5 + 32 * v5;
  uint64_t v7 = [(NSSet *)self->_nearbyDevices hash] - v6 + 32 * v6;
  uint64_t v8 = [(NSDate *)self->_predictionTime hash];
  int64_t v9 = self->_confidence - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
  return self->_confidenceReasonBitmap - v9 + 32 * v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRMiloLslPredictionDO)initWithCoder:(id)a3
{
  v62[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predictionId"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      uint64_t v8 = (objc_class *)objc_opt_class();
      int64_t v9 = NSStringFromClass(v8);
      char v10 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRMiloLslPredictionDO key \"predictionId\" (expected %@, decoded %@)", v7, v9, 0];
      uint64_t v61 = *MEMORY[0x263F08320];
      v62[0] = v10;
      int v11 = [NSDictionary dictionaryWithObjects:v62 forKeys:&v61 count:1];
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRMiloLslPredictionDOOCNTErrorDomain" code:3 userInfo:v11];
      [v4 failWithError:v12];

LABEL_4:
      uint64_t v13 = 0;
LABEL_38:

      goto LABEL_39;
    }
  }
  else
  {
    int v14 = [v4 error];

    if (v14) {
      goto LABEL_17;
    }
  }
  uint64_t v15 = [v4 decodeInt64ForKey:@"miLoServiceQuality"];
  if (!v15)
  {
    int v31 = [v4 error];

    if (v31) {
      goto LABEL_17;
    }
    if (([v4 containsValueForKey:@"miLoServiceQuality"] & 1) == 0)
    {
      uint64_t v59 = *MEMORY[0x263F08320];
      v60 = @"Missing serialized value for IRMiloLslPredictionDO.miLoServiceQuality";
      v32 = NSDictionary;
      v33 = &v60;
      BOOL v34 = &v59;
      goto LABEL_29;
    }
  }
  uint64_t v16 = [v4 decodeInt64ForKey:@"miLoServiceQualityReasonBitmap"];
  if (v16)
  {
LABEL_8:
    id v17 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v18 = objc_opt_class();
    int v19 = objc_msgSend(v17, "initWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v19 forKey:@"scores"];

    if (!v7)
    {
      v36 = [v4 error];

      if (v36)
      {
        uint64_t v13 = 0;
LABEL_39:

        goto LABEL_40;
      }
    }
    id v20 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v21 = objc_opt_class();
    int v22 = objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);
    int64_t v9 = [v4 decodeObjectOfClasses:v22 forKey:@"nearbyDevices"];

    if (!v9)
    {
      v37 = [v4 error];

      if (v37) {
        goto LABEL_4;
      }
    }
    long long v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predictionTime"];
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_super v24 = (objc_class *)objc_opt_class();
        v49 = NSStringFromClass(v24);
        int v25 = (objc_class *)objc_opt_class();
        int v26 = NSStringFromClass(v25);
        uint64_t v27 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRMiloLslPredictionDO key \"predictionTime\" (expected %@, decoded %@)", v49, v26, 0];
        uint64_t v55 = *MEMORY[0x263F08320];
        v56 = v27;
        [NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
        v29 = int v28 = v23;
        v30 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRMiloLslPredictionDOOCNTErrorDomain" code:3 userInfo:v29];
        [v4 failWithError:v30];

        long long v23 = v28;
LABEL_23:
        uint64_t v13 = 0;
LABEL_37:

        goto LABEL_38;
      }
    }
    else
    {
      v38 = [v4 error];

      if (v38) {
        goto LABEL_23;
      }
    }
    v50 = v23;
    uint64_t v39 = [v4 decodeInt64ForKey:@"confidence"];
    if (!v39)
    {
      v41 = [v4 error];

      if (v41) {
        goto LABEL_36;
      }
      if (([v4 containsValueForKey:@"confidence"] & 1) == 0)
      {
        uint64_t v53 = *MEMORY[0x263F08320];
        v54 = @"Missing serialized value for IRMiloLslPredictionDO.confidence";
        v42 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        v43 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRMiloLslPredictionDOOCNTErrorDomain" code:1 userInfo:v42];
        [v4 failWithError:v43];

        goto LABEL_36;
      }
    }
    uint64_t v40 = [v4 decodeInt64ForKey:@"confidenceReasonBitmap"];
    if (v40)
    {
LABEL_26:
      uint64_t v48 = v40;
      long long v23 = v50;
      self = [(IRMiloLslPredictionDO *)self initWithPredictionId:v5 miLoServiceQuality:v15 miLoServiceQualityReasonBitmap:v16 scores:v7 nearbyDevices:v9 predictionTime:v50 confidence:v39 confidenceReasonBitmap:v48];
      uint64_t v13 = self;
      goto LABEL_37;
    }
    v44 = [v4 error];

    if (!v44)
    {
      if ([v4 containsValueForKey:@"confidenceReasonBitmap"]) {
        goto LABEL_26;
      }
      uint64_t v51 = *MEMORY[0x263F08320];
      v52 = @"Missing serialized value for IRMiloLslPredictionDO.confidenceReasonBitmap";
      v45 = [NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      v46 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRMiloLslPredictionDOOCNTErrorDomain" code:1 userInfo:v45];
      [v4 failWithError:v46];
    }
LABEL_36:
    uint64_t v13 = 0;
    long long v23 = v50;
    goto LABEL_37;
  }
  v35 = [v4 error];

  if (!v35)
  {
    if ([v4 containsValueForKey:@"miLoServiceQualityReasonBitmap"]) {
      goto LABEL_8;
    }
    uint64_t v57 = *MEMORY[0x263F08320];
    v58 = @"Missing serialized value for IRMiloLslPredictionDO.miLoServiceQualityReasonBitmap";
    v32 = NSDictionary;
    v33 = &v58;
    BOOL v34 = &v57;
LABEL_29:
    uint64_t v7 = [v32 dictionaryWithObjects:v33 forKeys:v34 count:1];
    int64_t v9 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRMiloLslPredictionDOOCNTErrorDomain" code:1 userInfo:v7];
    [v4 failWithError:v9];
    goto LABEL_4;
  }
LABEL_17:
  uint64_t v13 = 0;
LABEL_40:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  predictionId = self->_predictionId;
  id v10 = v4;
  if (predictionId)
  {
    [v4 encodeObject:predictionId forKey:@"predictionId"];
    id v4 = v10;
  }
  [v4 encodeInt64:self->_miLoServiceQuality forKey:@"miLoServiceQuality"];
  [v10 encodeInt64:self->_miLoServiceQualityReasonBitmap forKey:@"miLoServiceQualityReasonBitmap"];
  scores = self->_scores;
  if (scores) {
    [v10 encodeObject:scores forKey:@"scores"];
  }
  nearbyDevices = self->_nearbyDevices;
  if (nearbyDevices) {
    [v10 encodeObject:nearbyDevices forKey:@"nearbyDevices"];
  }
  predictionTime = self->_predictionTime;
  int64_t v9 = v10;
  if (predictionTime)
  {
    [v10 encodeObject:predictionTime forKey:@"predictionTime"];
    int64_t v9 = v10;
  }
  [v9 encodeInt64:self->_confidence forKey:@"confidence"];
  [v10 encodeInt64:self->_confidenceReasonBitmap forKey:@"confidenceReasonBitmap"];
}

- (id)description
{
  id v3 = [NSString alloc];
  predictionId = self->_predictionId;
  int64_t v5 = [NSNumber numberWithLongLong:self->_miLoServiceQuality];
  uint64_t v6 = [NSNumber numberWithLongLong:self->_miLoServiceQualityReasonBitmap];
  long long v12 = *(_OWORD *)&self->_scores;
  predictionTime = self->_predictionTime;
  uint64_t v8 = [NSNumber numberWithLongLong:self->_confidence];
  int64_t v9 = [NSNumber numberWithLongLong:self->_confidenceReasonBitmap];
  id v10 = (void *)[v3 initWithFormat:@"<IRMiloLslPredictionDO | predictionId:%@ miLoServiceQuality:%@ miLoServiceQualityReasonBitmap:%@ scores:%@ nearbyDevices:%@ predictionTime:%@ confidence:%@ confidenceReasonBitmap:%@>", predictionId, v5, v6, v12, predictionTime, v8, v9];

  return v10;
}

- (NSString)predictionId
{
  return self->_predictionId;
}

- (int64_t)miLoServiceQuality
{
  return self->_miLoServiceQuality;
}

- (int64_t)miLoServiceQualityReasonBitmap
{
  return self->_miLoServiceQualityReasonBitmap;
}

- (NSSet)scores
{
  return self->_scores;
}

- (NSSet)nearbyDevices
{
  return self->_nearbyDevices;
}

- (NSDate)predictionTime
{
  return self->_predictionTime;
}

- (int64_t)confidence
{
  return self->_confidence;
}

- (int64_t)confidenceReasonBitmap
{
  return self->_confidenceReasonBitmap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionTime, 0);
  objc_storeStrong((id *)&self->_nearbyDevices, 0);
  objc_storeStrong((id *)&self->_scores, 0);

  objc_storeStrong((id *)&self->_predictionId, 0);
}

@end