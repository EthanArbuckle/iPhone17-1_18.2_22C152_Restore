@interface ATXNaivePositiveAnchorModelCandidateClassifier
+ (BOOL)supportsSecureCoding;
- (ATXAnchor)anchor;
- (ATXNaivePositiveAnchorModelCandidateClassifier)initWithCandidateId:(id)a3 candidateType:(id)a4 anchor:(id)a5;
- (ATXNaivePositiveAnchorModelCandidateClassifier)initWithCoder:(id)a3;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTrained;
- (NSString)candidateId;
- (NSString)candidateType;
- (NSString)description;
- (id)classifyCandidateForAnchorOccurrence:(id)a3 trainingResult:(id)a4;
- (int64_t)classifierType;
- (void)encodeWithCoder:(id)a3;
- (void)setIsTrained:(BOOL)a3;
- (void)train;
@end

@implementation ATXNaivePositiveAnchorModelCandidateClassifier

- (ATXNaivePositiveAnchorModelCandidateClassifier)initWithCandidateId:(id)a3 candidateType:(id)a4 anchor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ATXNaivePositiveAnchorModelCandidateClassifier;
  v11 = [(ATXNaivePositiveAnchorModelCandidateClassifier *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_anchor, a5);
    uint64_t v13 = [v8 copy];
    candidateId = v12->_candidateId;
    v12->_candidateId = (NSString *)v13;

    uint64_t v15 = [v9 copy];
    candidateType = v12->_candidateType;
    v12->_candidateType = (NSString *)v15;

    v12->_isTrained = 0;
  }

  return v12;
}

- (void)train
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "Training %@ for candidate: %@", v4, v5, v6, v7, v8);
}

- (id)classifyCandidateForAnchorOccurrence:(id)a3 trainingResult:(id)a4
{
  uint64_t v4 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[ATXNaivePositiveAnchorModelCandidateClassifier classifyCandidateForAnchorOccurrence:trainingResult:]();
  }

  uint64_t v5 = [[ATXAnchorModelClassificationResult alloc] initWithShouldPredictCandidate:1 score:1.0];
  return v5;
}

- (int64_t)classifierType
{
  return 1;
}

- (NSString)description
{
  return (NSString *)@"Simple Anchor Model Candidate Classifier that just returns YES, no matter what candidateId is passed in.";
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXNaivePositiveAnchorModelCandidateClassifier *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      candidateId = self->_candidateId;
      uint64_t v7 = v5->_candidateId;
      if (candidateId == v7)
      {
      }
      else
      {
        uint8_t v8 = v7;
        id v9 = candidateId;
        char v10 = [(NSString *)v9 isEqual:v8];

        if ((v10 & 1) == 0)
        {
          char v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      v12 = self->_anchor;
      uint64_t v13 = v12;
      if (v12 == v5->_anchor) {
        char v11 = 1;
      }
      else {
        char v11 = -[ATXAnchor isEqual:](v12, "isEqual:");
      }

      goto LABEL_13;
    }
    char v11 = 0;
  }
LABEL_14:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    uint64_t v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      objc_super v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  candidateId = self->_candidateId;
  id v5 = a3;
  [v5 encodeObject:candidateId forKey:@"codingKeyForCandidateId"];
  [v5 encodeObject:self->_candidateType forKey:@"codingKeyForCandidateType"];
  uint64_t v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v7 forKey:@"codingKeyForAnchor"];
}

- (ATXNaivePositiveAnchorModelCandidateClassifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codingKeyForCandidateId"];
  if (![(ATXNaivePositiveAnchorModelCandidateClassifier *)self checkAndReportDecodingFailureIfNeededForid:v5 key:@"codingKeyForCandidateId" coder:v4 errorDomain:@"com.apple.proactive.NaivePositiveAnchorModelCandidateClassifier" errorCode:-1])
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codingKeyForCandidateType"];
    if ([(ATXNaivePositiveAnchorModelCandidateClassifier *)self checkAndReportDecodingFailureIfNeededForid:v7 key:@"codingKeyForCandidateType" coder:v4 errorDomain:@"com.apple.proactive.NaivePositiveAnchorModelCandidateClassifier" errorCode:-1])
    {
      uint64_t v6 = 0;
LABEL_21:

      goto LABEL_22;
    }
    uint8_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codingKeyForAnchor"];
    if ([(ATXNaivePositiveAnchorModelCandidateClassifier *)self checkAndReportDecodingFailureIfNeededForid:v8 key:@"codingKeyForAnchor" coder:v4 errorDomain:@"com.apple.proactive.NaivePositiveAnchorModelCandidateClassifier" errorCode:-1])
    {
      uint64_t v6 = 0;
LABEL_20:

      goto LABEL_21;
    }
    id v9 = +[ATXAnchorModelHyperParameters sharedInstance];
    char v10 = [v9 enabledAnchors];
    char v11 = [v10 containsObject:v8];

    if (v11)
    {
      if (NSClassFromString((NSString *)v8))
      {
        id v12 = objc_opt_new();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          self = [(ATXNaivePositiveAnchorModelCandidateClassifier *)self initWithCandidateId:v5 candidateType:v7 anchor:v12];
          uint64_t v6 = self;
LABEL_19:

          goto LABEL_20;
        }
        id v13 = __atxlog_handle_anchor();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          -[ATXNaivePositiveAnchorModelCandidateClassifier initWithCoder:]();
        }
      }
      else
      {
        id v12 = __atxlog_handle_anchor();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          -[ATXNaivePositiveAnchorModelCandidateClassifier initWithCoder:]();
        }
      }
    }
    else
    {
      id v12 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(ATXNaivePositiveAnchorModelCandidateClassifier *)(uint64_t)self initWithCoder:v12];
      }
    }
    uint64_t v6 = 0;
    goto LABEL_19;
  }
  uint64_t v6 = 0;
LABEL_22:

  return v6;
}

- (ATXAnchor)anchor
{
  return self->_anchor;
}

- (NSString)candidateId
{
  return self->_candidateId;
}

- (NSString)candidateType
{
  return self->_candidateType;
}

- (BOOL)isTrained
{
  return self->_isTrained;
}

- (void)setIsTrained:(BOOL)a3
{
  self->_isTrained = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateType, 0);
  objc_storeStrong((id *)&self->_candidateId, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

- (void)classifyCandidateForAnchorOccurrence:trainingResult:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "%@ making a prediction for candidate: %@", v4, v5, v6, v7, v8);
}

- (void)initWithCoder:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "When decoding %@, encountered an unknown/non-existent Anchor Class String.", v4, v5, v6, v7, 2u);
}

- (void)initWithCoder:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "When decoding %@, decoded an object that is not a known Anchor type.", v4, v5, v6, v7, 2u);
}

- (void)initWithCoder:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  uint8_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "When decoding %@, attempted to deserialize object with a non-whitelisted anchor: %@", (uint8_t *)&v7, 0x16u);
}

@end