@interface MLPrecisionRecallCurve
+ (BOOL)supportsSecureCoding;
- (MLPrecisionRecallCurve)initWithCoder:(id)a3;
- (MLPrecisionRecallCurve)initWithPrecisionValues:(id)a3 precisionConfidenceThresholds:(id)a4 recallValues:(id)a5 recallConfidenceThresholds:(id)a6;
- (NSArray)precisionConfidenceThresholds;
- (NSArray)precisionValues;
- (NSArray)recallConfidenceThresholds;
- (NSArray)recallValues;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLPrecisionRecallCurve

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recallConfidenceThresholds, 0);
  objc_storeStrong((id *)&self->_recallValues, 0);
  objc_storeStrong((id *)&self->_precisionConfidenceThresholds, 0);

  objc_storeStrong((id *)&self->_precisionValues, 0);
}

- (NSArray)recallConfidenceThresholds
{
  return self->_recallConfidenceThresholds;
}

- (NSArray)recallValues
{
  return self->_recallValues;
}

- (NSArray)precisionConfidenceThresholds
{
  return self->_precisionConfidenceThresholds;
}

- (NSArray)precisionValues
{
  return self->_precisionValues;
}

- (MLPrecisionRecallCurve)initWithCoder:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  [v5 addObjectsFromArray:v6];

  v7 = [v4 allowedClasses];
  [v5 unionSet:v7];

  v27.receiver = self;
  v27.super_class = (Class)MLPrecisionRecallCurve;
  v8 = [(MLPrecisionRecallCurve *)&v27 init];
  if (!v8)
  {
    id v19 = 0;
LABEL_8:
    v21 = v8;
    goto LABEL_9;
  }
  id v26 = 0;
  uint64_t v9 = [v4 decodeTopLevelObjectOfClasses:v5 forKey:@"PrecisionValues" error:&v26];
  id v10 = v26;
  precisionValues = v8->_precisionValues;
  v8->_precisionValues = (NSArray *)v9;

  id v25 = v10;
  uint64_t v12 = [v4 decodeTopLevelObjectOfClasses:v5 forKey:@"PrecisionConfidenceThresholds" error:&v25];
  id v13 = v25;

  precisionConfidenceThresholds = v8->_precisionConfidenceThresholds;
  v8->_precisionConfidenceThresholds = (NSArray *)v12;

  id v24 = v13;
  uint64_t v15 = [v4 decodeTopLevelObjectOfClasses:v5 forKey:@"RecallValues" error:&v24];
  id v16 = v24;

  recallValues = v8->_recallValues;
  v8->_recallValues = (NSArray *)v15;

  id v23 = v16;
  uint64_t v18 = [v4 decodeTopLevelObjectOfClasses:v5 forKey:@"RecallConfidenceThresholds" error:&v23];
  id v19 = v23;

  recallConfidenceThresholds = v8->_recallConfidenceThresholds;
  v8->_recallConfidenceThresholds = (NSArray *)v18;

  if (v8->_precisionValues
    && v8->_precisionConfidenceThresholds
    && v8->_recallValues
    && v8->_recallConfidenceThresholds)
  {
    goto LABEL_8;
  }
  v21 = 0;
LABEL_9:

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MLPrecisionRecallCurve *)self precisionValues];
  [v4 encodeObject:v5 forKey:@"PrecisionValues"];

  v6 = [(MLPrecisionRecallCurve *)self precisionConfidenceThresholds];
  [v4 encodeObject:v6 forKey:@"PrecisionConfidenceThresholds"];

  v7 = [(MLPrecisionRecallCurve *)self recallValues];
  [v4 encodeObject:v7 forKey:@"RecallValues"];

  id v8 = [(MLPrecisionRecallCurve *)self recallConfidenceThresholds];
  [v4 encodeObject:v8 forKey:@"RecallConfidenceThresholds"];
}

- (MLPrecisionRecallCurve)initWithPrecisionValues:(id)a3 precisionConfidenceThresholds:(id)a4 recallValues:(id)a5 recallConfidenceThresholds:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)MLPrecisionRecallCurve;
  v14 = [(MLPrecisionRecallCurve *)&v28 init];
  if (v14)
  {
    uint64_t v15 = [v10 count];
    id v16 = (void *)MEMORY[0x1E4F1C3C8];
    if (!v15 || (uint64_t v17 = [v10 count], v17 != objc_msgSend(v11, "count"))) {
      [MEMORY[0x1E4F1CA00] raise:*v16 format:@"The PrecisionRecallCurves precisions have zero or mismatched lengths."];
    }
    if (![v12 count] || (uint64_t v18 = objc_msgSend(v12, "count"), v18 != objc_msgSend(v13, "count"))) {
      [MEMORY[0x1E4F1CA00] raise:*v16 format:@"The PrecisionRecallCurves recalls have zero or mismatched lengths."];
    }
    uint64_t v19 = [v10 copy];
    precisionValues = v14->_precisionValues;
    v14->_precisionValues = (NSArray *)v19;

    uint64_t v21 = [v11 copy];
    precisionConfidenceThresholds = v14->_precisionConfidenceThresholds;
    v14->_precisionConfidenceThresholds = (NSArray *)v21;

    uint64_t v23 = [v12 copy];
    recallValues = v14->_recallValues;
    v14->_recallValues = (NSArray *)v23;

    uint64_t v25 = [v13 copy];
    recallConfidenceThresholds = v14->_recallConfidenceThresholds;
    v14->_recallConfidenceThresholds = (NSArray *)v25;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end