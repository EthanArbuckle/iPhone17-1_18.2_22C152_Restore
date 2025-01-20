@interface VNClassificationObservation
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (BOOL)hasMinimumPrecision:(float)minimumPrecision forRecall:(float)recall;
- (BOOL)hasMinimumRecall:(float)minimumRecall forPrecision:(float)precision;
- (BOOL)hasPrecisionRecallCurve;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (VNClassificationObservation)initWithCoder:(id)a3;
- (VNClassificationObservation)initWithOriginatingRequestSpecifier:(id)a3 identifier:(id)a4 confidence:(float)a5;
- (VNClassificationObservation)initWithOriginatingRequestSpecifier:(id)a3 identifier:(id)a4 confidence:(float)a5 classificationMetrics:(id)a6;
- (VNClassificationObservation)initWithRequestRevision:(unint64_t)a3 identifier:(id)a4 confidence:(float)a5;
- (VNClassificationObservation)initWithRequestRevision:(unint64_t)a3 identifier:(id)a4 confidence:(float)a5 classificationMetrics:(id)a6;
- (VisionCoreClassificationMetrics)classificationMetrics;
- (id)description;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNClassificationObservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicallyEncodedOperationPointsProvider, 0);
  objc_storeStrong((id *)&self->_classificationMetrics, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (VisionCoreClassificationMetrics)classificationMetrics
{
  return self->_classificationMetrics;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)hasMinimumPrecision:(float)minimumPrecision forRecall:(float)recall
{
  classificationMetrics = self->_classificationMetrics;
  if (!classificationMetrics)
  {
    historicallyEncodedOperationPointsProvider = self->_historicallyEncodedOperationPointsProvider;
    if (!historicallyEncodedOperationPointsProvider) {
      return 0;
    }
    v15 = [(VNOperationPointsProvider *)historicallyEncodedOperationPointsProvider operationPointsAndReturnError:0];
    v8 = v15;
    if (v15)
    {
      v16 = v15;
      [(VNObservation *)self confidence];
      float v18 = v17;
      if (v17 <= 0.0)
      {
        BOOL v13 = 0;
      }
      else
      {
        v19 = [(VNClassificationObservation *)self identifier];
        float v24 = 0.0;
        *(float *)&double v20 = recall;
        if (([(VisionCoreClassificationMetrics *)v16 getConfidence:&v24 forClassificationIdentifier:v19 withRecall:0 error:v20] & 1) != 0&& v18 >= v24)
        {
          if (minimumPrecision <= 0.0)
          {
            BOOL v13 = 1;
          }
          else
          {
            float v23 = 0.0;
            char v22 = -[VisionCoreClassificationMetrics getPrecision:forClassificationIdentifier:confidence:error:](v16, "getPrecision:forClassificationIdentifier:confidence:error:", &v23, v19, 0);
            if (v23 >= minimumPrecision) {
              BOOL v13 = v22;
            }
            else {
              BOOL v13 = 0;
            }
          }
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  v8 = classificationMetrics;
  [(VNObservation *)self confidence];
  float v10 = *(float *)&v9;
  if (*(float *)&v9 <= 0.0
    || (*(float *)&double v9 = recall,
        [(VisionCoreClassificationMetrics *)v8 confidenceThresholdForRecall:v9],
        v10 < v11)
    || minimumPrecision > 0.0
    && (-[VisionCoreClassificationMetrics precisionOfConfidence:](v8, "precisionOfConfidence:"), v12 < minimumPrecision))
  {
LABEL_14:
    BOOL v13 = 0;
    goto LABEL_15;
  }
  BOOL v13 = 1;
LABEL_15:

  return v13;
}

- (BOOL)hasMinimumRecall:(float)minimumRecall forPrecision:(float)precision
{
  classificationMetrics = self->_classificationMetrics;
  if (!classificationMetrics)
  {
    historicallyEncodedOperationPointsProvider = self->_historicallyEncodedOperationPointsProvider;
    if (!historicallyEncodedOperationPointsProvider) {
      return 0;
    }
    v15 = [(VNOperationPointsProvider *)historicallyEncodedOperationPointsProvider operationPointsAndReturnError:0];
    v8 = v15;
    if (v15)
    {
      v16 = v15;
      [(VNObservation *)self confidence];
      float v18 = v17;
      if (v17 <= 0.0)
      {
        BOOL v13 = 0;
      }
      else
      {
        v19 = [(VNClassificationObservation *)self identifier];
        float v24 = 0.0;
        *(float *)&double v20 = precision;
        if (([(VisionCoreClassificationMetrics *)v16 getConfidence:&v24 forClassificationIdentifier:v19 withPrecision:0 error:v20] & 1) != 0&& v18 >= v24)
        {
          if (minimumRecall <= 0.0)
          {
            BOOL v13 = 1;
          }
          else
          {
            float v23 = 0.0;
            char v22 = -[VisionCoreClassificationMetrics getRecall:forClassificationIdentifier:confidence:error:](v16, "getRecall:forClassificationIdentifier:confidence:error:", &v23, v19, 0);
            if (v23 >= minimumRecall) {
              BOOL v13 = v22;
            }
            else {
              BOOL v13 = 0;
            }
          }
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  v8 = classificationMetrics;
  [(VNObservation *)self confidence];
  float v10 = *(float *)&v9;
  if (*(float *)&v9 <= 0.0
    || (*(float *)&double v9 = precision,
        [(VisionCoreClassificationMetrics *)v8 confidenceThresholdForPrecision:v9],
        v10 < v11)
    || minimumRecall > 0.0
    && (-[VisionCoreClassificationMetrics recallOfConfidence:](v8, "recallOfConfidence:"), v12 < minimumRecall))
  {
LABEL_14:
    BOOL v13 = 0;
    goto LABEL_15;
  }
  BOOL v13 = 1;
LABEL_15:

  return v13;
}

- (BOOL)hasPrecisionRecallCurve
{
  return self->_classificationMetrics || self->_historicallyEncodedOperationPointsProvider != 0;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v8.receiver = self;
  v8.super_class = (Class)VNClassificationObservation;
  v4 = [(VNObservation *)&v8 description];
  [v3 appendString:v4];

  uint64_t v5 = [(VNClassificationObservation *)self identifier];
  v6 = (void *)v5;
  if (v5) {
    [v3 appendFormat:@" \"%@\"", v5];
  }
  if ([(VNClassificationObservation *)self hasPrecisionRecallCurve]) {
    [v3 appendString:@" (P/R)"];
  }

  return v3;
}

- (id)vn_cloneObject
{
  v9.receiver = self;
  v9.super_class = (Class)VNClassificationObservation;
  uint64_t v3 = [(VNObservation *)&v9 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(NSString *)self->_identifier copy];
    uint64_t v5 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = v4;

    uint64_t v6 = [(VisionCoreClassificationMetrics *)self->_classificationMetrics copy];
    v7 = *(void **)(v3 + 104);
    *(void *)(v3 + 104) = v6;

    objc_storeStrong((id *)(v3 + 112), self->_historicallyEncodedOperationPointsProvider);
  }

  return (id)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VNClassificationObservation;
  [(VNObservation *)&v10 encodeWithCoder:v4];
  [v4 encodeObject:self->_identifier forKey:@"identifier"];
  classificationMetrics = self->_classificationMetrics;
  if (classificationMetrics)
  {
    [v4 encodeObject:classificationMetrics forKey:@"P/R"];
  }
  else
  {
    historicallyEncodedOperationPointsProvider = self->_historicallyEncodedOperationPointsProvider;
    if (historicallyEncodedOperationPointsProvider)
    {
      id v9 = 0;
      v7 = [(VNOperationPointsProvider *)historicallyEncodedOperationPointsProvider operationPointsAndReturnError:&v9];
      id v8 = v9;
      if (v7) {
        [v4 encodeObject:v7 forKey:@"operationPoints"];
      }
      else {
        [v4 failWithError:v8];
      }
    }
  }
}

- (VNClassificationObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNClassificationObservation;
  uint64_t v5 = [(VNObservation *)&v15 initWithCoder:v4];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v7 = [v6 copy];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v7;

  if (![v4 containsValueForKey:@"P/R"])
  {
    if ([v4 containsValueForKey:@"operationPoints"])
    {
      float v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"operationPoints"];
      if (!v11) {
        goto LABEL_9;
      }
      float v12 = [[VNOperationPointsProvider alloc] initWithOperationPoints:v11];
      historicallyEncodedOperationPointsProvider = v5->_historicallyEncodedOperationPointsProvider;
      v5->_historicallyEncodedOperationPointsProvider = v12;
    }
LABEL_8:
    float v11 = v5;
    goto LABEL_9;
  }
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"P/R"];
  classificationMetrics = v5->_classificationMetrics;
  v5->_classificationMetrics = (VisionCoreClassificationMetrics *)v9;

  if (v5->_classificationMetrics) {
    goto LABEL_8;
  }
LABEL_4:
  float v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNClassificationObservation *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VNClassificationObservation;
    if ([(VNObservation *)&v14 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(VNClassificationObservation *)self identifier];
      uint64_t v7 = [(VNClassificationObservation *)v5 identifier];
      char v8 = [v6 isEqualToString:v7];

      if ((v8 & 1) != 0
        && (uint64_t v9 = self->_classificationMetrics, v10 = VisionCoreEqualOrNilObjects(), v9, v10))
      {
        float v11 = self->_historicallyEncodedOperationPointsProvider;
        char v12 = VisionCoreEqualOrNilObjects();
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)VNClassificationObservation;
  id v3 = [(VNObservation *)&v7 hash];
  id v4 = [(VNClassificationObservation *)self identifier];
  unint64_t v5 = [v4 hash] ^ __ROR8__(v3, 51);

  return v5;
}

- (VNClassificationObservation)initWithOriginatingRequestSpecifier:(id)a3 identifier:(id)a4 confidence:(float)a5 classificationMetrics:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)VNClassificationObservation;
  BOOL v13 = [(VNObservation *)&v20 initWithOriginatingRequestSpecifier:v10];
  if (v13)
  {
    uint64_t v14 = [v11 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    uint64_t v16 = [v12 copy];
    classificationMetrics = v13->_classificationMetrics;
    v13->_classificationMetrics = (VisionCoreClassificationMetrics *)v16;

    *(float *)&double v18 = a5;
    [(VNObservation *)v13 setConfidence:v18];
  }

  return v13;
}

- (VNClassificationObservation)initWithOriginatingRequestSpecifier:(id)a3 identifier:(id)a4 confidence:(float)a5
{
  return -[VNClassificationObservation initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:](self, "initWithOriginatingRequestSpecifier:identifier:confidence:classificationMetrics:", a3, a4, 0);
}

- (VNClassificationObservation)initWithRequestRevision:(unint64_t)a3 identifier:(id)a4 confidence:(float)a5 classificationMetrics:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)VNClassificationObservation;
  id v12 = [(VNObservation *)&v19 initWithRequestRevision:a3];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    uint64_t v15 = [v11 copy];
    classificationMetrics = v12->_classificationMetrics;
    v12->_classificationMetrics = (VisionCoreClassificationMetrics *)v15;

    *(float *)&double v17 = a5;
    [(VNObservation *)v12 setConfidence:v17];
  }

  return v12;
}

- (VNClassificationObservation)initWithRequestRevision:(unint64_t)a3 identifier:(id)a4 confidence:(float)a5
{
  return -[VNClassificationObservation initWithRequestRevision:identifier:confidence:classificationMetrics:](self, "initWithRequestRevision:identifier:confidence:classificationMetrics:", a3, a4, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNClassifyImageRequest";
}

@end