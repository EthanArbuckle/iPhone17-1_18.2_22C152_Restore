@interface MADTextEmbeddingResult
+ (BOOL)supportsSecureCoding;
- (MADEmbeddingResult)embedding;
- (MADTextEmbeddingResult)initWithCoder:(id)a3;
- (MADTextEmbeddingResult)initWithEmbedding:(id)a3 calibrationVersion:(id)a4 mean:(id)a5 standardDeviation:(id)a6 bias:(id)a7 scale:(id)a8 threshold:(id)a9;
- (NSData)embeddingData;
- (NSNumber)bias;
- (NSNumber)calibrationVersion;
- (NSNumber)isSafe;
- (NSNumber)mean;
- (NSNumber)safetyScore;
- (NSNumber)scale;
- (NSNumber)standardDeviation;
- (NSNumber)threshold;
- (id)description;
- (unint64_t)elementCount;
- (unint64_t)elementType;
- (void)encodeWithCoder:(id)a3;
- (void)setSafetyScore:(id)a3 isSafe:(id)a4;
@end

@implementation MADTextEmbeddingResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADTextEmbeddingResult)initWithEmbedding:(id)a3 calibrationVersion:(id)a4 mean:(id)a5 standardDeviation:(id)a6 bias:(id)a7 scale:(id)a8 threshold:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)MADTextEmbeddingResult;
  v18 = [(MADTextEmbeddingResult *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_embedding, a3);
    objc_storeStrong((id *)&v19->_calibrationVersion, a4);
    objc_storeStrong((id *)&v19->_mean, a5);
    objc_storeStrong((id *)&v19->_standardDeviation, a6);
    objc_storeStrong((id *)&v19->_bias, a7);
    objc_storeStrong((id *)&v19->_scale, a8);
    objc_storeStrong((id *)&v19->_threshold, a9);
  }

  return v19;
}

- (MADTextEmbeddingResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MADTextEmbeddingResult;
  v5 = [(MADTextResult *)&v25 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Embedding"];
    embedding = v5->_embedding;
    v5->_embedding = (MADEmbeddingResult *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CalibrationVersion"];
    calibrationVersion = v5->_calibrationVersion;
    v5->_calibrationVersion = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Mean"];
    mean = v5->_mean;
    v5->_mean = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StandardDeviation"];
    standardDeviation = v5->_standardDeviation;
    v5->_standardDeviation = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Bias"];
    bias = v5->_bias;
    v5->_bias = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Scale"];
    scale = v5->_scale;
    v5->_scale = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Threshold"];
    threshold = v5->_threshold;
    v5->_threshold = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SafetyScore"];
    safetyScore = v5->_safetyScore;
    v5->_safetyScore = (NSNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IsSafe"];
    isSafe = v5->_isSafe;
    v5->_isSafe = (NSNumber *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADTextEmbeddingResult;
  id v4 = a3;
  [(MADTextResult *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_embedding, @"Embedding", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_calibrationVersion forKey:@"CalibrationVersion"];
  [v4 encodeObject:self->_mean forKey:@"Mean"];
  [v4 encodeObject:self->_standardDeviation forKey:@"StandardDeviation"];
  [v4 encodeObject:self->_bias forKey:@"Bias"];
  [v4 encodeObject:self->_scale forKey:@"Scale"];
  [v4 encodeObject:self->_threshold forKey:@"Threshold"];
  [v4 encodeObject:self->_safetyScore forKey:@"SafetyScore"];
  [v4 encodeObject:self->_isSafe forKey:@"IsSafe"];
}

- (void)setSafetyScore:(id)a3 isSafe:(id)a4
{
  uint64_t v6 = (NSNumber *)a3;
  v7 = (NSNumber *)a4;
  safetyScore = self->_safetyScore;
  self->_safetyScore = v6;
  uint64_t v10 = v6;

  isSafe = self->_isSafe;
  self->_isSafe = v7;
}

- (unint64_t)elementType
{
  return [(MADEmbeddingResult *)self->_embedding type];
}

- (unint64_t)elementCount
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(MADEmbeddingResult *)self->_embedding type];
  if (v3 == 2)
  {
    id v4 = [(MADEmbeddingResult *)self->_embedding data];
    unint64_t v5 = (unint64_t)[v4 length] >> 2;
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    id v4 = [(MADEmbeddingResult *)self->_embedding data];
    unint64_t v5 = (unint64_t)[v4 length] >> 1;
LABEL_5:

    return v5;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [(MADEmbeddingResult *)self->_embedding type];
    v8[0] = 67109120;
    v8[1] = v6;
    _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Embedding has unknown element type (%d); cannot derive count",
      (uint8_t *)v8,
      8u);
  }
  return 0;
}

- (NSData)embeddingData
{
  return [(MADEmbeddingResult *)self->_embedding data];
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"embedding: %@", self->_embedding];
  if (self->_calibrationVersion) {
    [v3 appendFormat:@", calibrationVersion: %@", self->_calibrationVersion];
  }
  if (self->_mean) {
    [v3 appendFormat:@", mean: %@", self->_mean];
  }
  if (self->_standardDeviation) {
    [v3 appendFormat:@", standardDeviation: %@", self->_standardDeviation];
  }
  if (self->_bias) {
    [v3 appendFormat:@", bias: %@", self->_bias];
  }
  if (self->_scale) {
    [v3 appendFormat:@", scale: %@", self->_scale];
  }
  if (self->_threshold) {
    [v3 appendFormat:@", threshold: %@", self->_threshold];
  }
  if (self->_safetyScore) {
    [v3 appendFormat:@", safetyScore: %@", self->_safetyScore];
  }
  if (self->_isSafe) {
    [v3 appendFormat:@", isSafe: %@", self->_isSafe];
  }
  [v3 appendFormat:@">"];
  return v3;
}

- (MADEmbeddingResult)embedding
{
  return self->_embedding;
}

- (NSNumber)calibrationVersion
{
  return self->_calibrationVersion;
}

- (NSNumber)mean
{
  return self->_mean;
}

- (NSNumber)standardDeviation
{
  return self->_standardDeviation;
}

- (NSNumber)bias
{
  return self->_bias;
}

- (NSNumber)scale
{
  return self->_scale;
}

- (NSNumber)threshold
{
  return self->_threshold;
}

- (NSNumber)safetyScore
{
  return self->_safetyScore;
}

- (NSNumber)isSafe
{
  return self->_isSafe;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isSafe, 0);
  objc_storeStrong((id *)&self->_safetyScore, 0);
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_scale, 0);
  objc_storeStrong((id *)&self->_bias, 0);
  objc_storeStrong((id *)&self->_standardDeviation, 0);
  objc_storeStrong((id *)&self->_mean, 0);
  objc_storeStrong((id *)&self->_calibrationVersion, 0);
  objc_storeStrong((id *)&self->_embedding, 0);
}

@end