@interface ATXMagicalMomentsPrediction
+ (BOOL)supportsSecureCoding;
+ (id)convertPredictionsToPMMPredictionItems:(id)a3 reason:(unsigned int)a4 anchor:(int64_t)a5 triggerEvent:(id)a6;
+ (id)pmmMetadataForDuetEvent:(id)a3;
+ (int64_t)mmAnchorToPMMAnchor:(int64_t)a3;
+ (int64_t)mmReasonToPMMReason:(unsigned int)a3;
- (ATXMagicalMomentsPrediction)init;
- (ATXMagicalMomentsPrediction)initWithCoder:(id)a3;
- (ATXMagicalMomentsPrediction)initWithConfidence:(double)a3 predictionIdentifier:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)predictionIdentifier;
- (double)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXMagicalMomentsPrediction

- (ATXMagicalMomentsPrediction)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"ATXMagicalMomentsPrediction.m", 24, @"Do not call -init, call -initWithConfidence:bundleId:." object file lineNumber description];

  return 0;
}

- (ATXMagicalMomentsPrediction)initWithConfidence:(double)a3 predictionIdentifier:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)ATXMagicalMomentsPrediction;
    v7 = [(ATXMagicalMomentsPrediction *)&v13 init];
    v8 = v7;
    if (v7)
    {
      v7->_confidence = a3;
      uint64_t v9 = [v6 copy];
      predictionIdentifier = v8->_predictionIdentifier;
      v8->_predictionIdentifier = (NSString *)v9;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Prediction: %@, Confidence: %f", self->_predictionIdentifier, *(void *)&self->_confidence];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXMagicalMomentsPrediction *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      double confidence = self->_confidence;
      [(ATXMagicalMomentsPrediction *)v5 confidence];
      if (confidence == v7)
      {
        predictionIdentifier = self->_predictionIdentifier;
        uint64_t v9 = [(ATXMagicalMomentsPrediction *)v5 predictionIdentifier];
        char v10 = [(NSString *)predictionIdentifier isEqualToString:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  [(ATXMagicalMomentsPrediction *)self confidence];
  double v6 = v5;
  [v4 confidence];
  if (v6 >= v7)
  {
    [(ATXMagicalMomentsPrediction *)self confidence];
    double v10 = v9;
    [v4 confidence];
    int64_t v8 = v10 > v11;
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (unint64_t)hash
{
  return [(NSString *)self->_predictionIdentifier hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(ATXMagicalMomentsPrediction *)self confidence];
  double v6 = v5;
  double v7 = [(ATXMagicalMomentsPrediction *)self predictionIdentifier];
  int64_t v8 = (void *)[v4 initWithConfidence:v7 predictionIdentifier:v6];

  return v8;
}

+ (id)convertPredictionsToPMMPredictionItems:(id)a3 reason:(unsigned int)a4 anchor:(int64_t)a5 triggerEvent:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v24 = a6;
  id v25 = (id)objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1D25F6CC0]();
        id v13 = objc_alloc(MEMORY[0x1E4F93870]);
        v14 = [v11 predictionIdentifier];
        int64_t v15 = +[ATXMagicalMomentsPrediction mmReasonToPMMReason:a4];
        v16 = [(id)objc_opt_class() pmmMetadataForDuetEvent:v24];
        int64_t v17 = +[ATXMagicalMomentsPrediction mmAnchorToPMMAnchor:a5];
        [v11 confidence];
        v18 = objc_msgSend(v13, "initWithBundleId:predictionSource:reason:reasonMetadata:anchorType:confidence:", v14, 2, v15, v16, v17);

        [v25 addObject:v18];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  return v25;
}

+ (id)pmmMetadataForDuetEvent:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 deviceName];

    if (v4)
    {
      uint64_t v16 = *MEMORY[0x1E4F93890];
      double v5 = [v3 deviceName];
      v17[0] = v5;
      double v6 = (void *)MEMORY[0x1E4F1C9E8];
      id v7 = (void **)v17;
      uint64_t v8 = &v16;
LABEL_7:
      double v10 = [v6 dictionaryWithObjects:v7 forKeys:v8 count:1];

      goto LABEL_9;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v3 deviceIdentifier];

    if (v9)
    {
      uint64_t v14 = *MEMORY[0x1E4F93890];
      double v5 = [v3 deviceIdentifier];
      int64_t v15 = v5;
      double v6 = (void *)MEMORY[0x1E4F1C9E8];
      id v7 = &v15;
      uint64_t v8 = &v14;
      goto LABEL_7;
    }
  }
  double v10 = 0;
LABEL_9:
  if (v10) {
    double v11 = v10;
  }
  else {
    double v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v12 = v11;

  return v12;
}

+ (int64_t)mmReasonToPMMReason:(unsigned int)a3
{
  if ((int)a3 > 31)
  {
    int64_t v4 = 128;
    uint64_t v5 = 256;
    uint64_t v6 = 512;
    if (a3 != 512) {
      uint64_t v6 = 0;
    }
    if (a3 != 256) {
      uint64_t v5 = v6;
    }
    if (a3 != 128) {
      int64_t v4 = v5;
    }
    int64_t v7 = 32;
    uint64_t v8 = 64;
    if (a3 != 64) {
      uint64_t v8 = 0;
    }
    if (a3 != 32) {
      int64_t v7 = v8;
    }
    if ((int)a3 <= 127) {
      return v7;
    }
    else {
      return v4;
    }
  }
  else
  {
    int64_t result = 0;
    switch(a3)
    {
      case 1u:
        int64_t result = 1;
        break;
      case 2u:
        int64_t result = 2;
        break;
      case 3u:
      case 5u:
      case 6u:
      case 7u:
        return result;
      case 4u:
        int64_t result = 4;
        break;
      case 8u:
        int64_t result = 8;
        break;
      default:
        if (a3 == 16) {
          int64_t result = 16;
        }
        else {
          int64_t result = 0;
        }
        break;
    }
  }
  return result;
}

+ (int64_t)mmAnchorToPMMAnchor:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0x13) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  predictionIdentifier = self->_predictionIdentifier;
  id v5 = a3;
  [v5 encodeObject:predictionIdentifier forKey:@"predictionIdentifier"];
  [v5 encodeDouble:@"confidence" forKey:self->_confidence];
}

- (ATXMagicalMomentsPrediction)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"confidence"];
  double v6 = v5;
  int64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predictionIdentifier"];

  uint64_t v8 = [(ATXMagicalMomentsPrediction *)self initWithConfidence:v7 predictionIdentifier:v6];
  return v8;
}

- (NSString)predictionIdentifier
{
  return self->_predictionIdentifier;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
}

@end