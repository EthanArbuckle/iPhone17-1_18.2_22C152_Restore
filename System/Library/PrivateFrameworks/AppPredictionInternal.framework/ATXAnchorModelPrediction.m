@interface ATXAnchorModelPrediction
+ (BOOL)supportsSecureCoding;
- (ATXAnchorModelCandidateClassifierProtocol)candidateClassifier;
- (ATXAnchorModelPrediction)initWithAnchorType:(id)a3 anchorEvent:(id)a4 candidateType:(id)a5 candidateId:(id)a6 dateIntervalForPrediction:(id)a7 score:(double)a8 numUniqueOccurrencesAfterAnchor:(unint64_t)a9 posteriorProbability:(double)a10 classConditionalProbability:(double)a11 standardDeviationOfOffsetFromAnchor:(double)a12 anchorPopularity:(double)a13 globalPopularity:(double)a14 offsetFromAnchorToShowPrediction:(id)a15 candidateClassifier:(id)a16;
- (ATXAnchorModelPrediction)initWithCoder:(id)a3;
- (ATXAnchorModelPredictionOffsetFromAnchorOccurrence)offsetFromAnchorToShowPrediction;
- (ATXDuetEvent)anchorEvent;
- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (NSDateInterval)dateIntervalForPrediction;
- (NSString)anchorType;
- (NSString)candidateId;
- (NSString)candidateType;
- (double)anchorPopularity;
- (double)classConditionalProbability;
- (double)globalPopularity;
- (double)posteriorProbability;
- (double)score;
- (double)standardDeviationOfOffsetFromAnchor;
- (id)description;
- (unint64_t)hash;
- (unint64_t)numUniqueOccurrencesAfterAnchor;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXAnchorModelPrediction

- (ATXAnchorModelPrediction)initWithAnchorType:(id)a3 anchorEvent:(id)a4 candidateType:(id)a5 candidateId:(id)a6 dateIntervalForPrediction:(id)a7 score:(double)a8 numUniqueOccurrencesAfterAnchor:(unint64_t)a9 posteriorProbability:(double)a10 classConditionalProbability:(double)a11 standardDeviationOfOffsetFromAnchor:(double)a12 anchorPopularity:(double)a13 globalPopularity:(double)a14 offsetFromAnchorToShowPrediction:(id)a15 candidateClassifier:(id)a16
{
  id v27 = a3;
  id v42 = a4;
  id v28 = a5;
  id v29 = a6;
  id v41 = a7;
  id v30 = a15;
  id v31 = a16;
  v43.receiver = self;
  v43.super_class = (Class)ATXAnchorModelPrediction;
  v32 = [(ATXAnchorModelPrediction *)&v43 init];
  if (v32)
  {
    uint64_t v33 = [v27 copy];
    anchorType = v32->_anchorType;
    v32->_anchorType = (NSString *)v33;

    objc_storeStrong((id *)&v32->_anchorEvent, a4);
    uint64_t v35 = [v28 copy];
    candidateType = v32->_candidateType;
    v32->_candidateType = (NSString *)v35;

    uint64_t v37 = [v29 copy];
    candidateId = v32->_candidateId;
    v32->_candidateId = (NSString *)v37;

    objc_storeStrong((id *)&v32->_dateIntervalForPrediction, a7);
    v32->_score = a8;
    v32->_numUniqueOccurrencesAfterAnchor = a9;
    v32->_posteriorProbability = a10;
    v32->_classConditionalProbability = a11;
    v32->_standardDeviationOfOffsetFromAnchor = a12;
    v32->_anchorPopularity = a13;
    v32->_globalPopularity = a14;
    objc_storeStrong((id *)&v32->_offsetFromAnchorToShowPrediction, a15);
    objc_storeStrong((id *)&v32->_candidateClassifier, a16);
  }

  return v32;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"Anchor type: %@\nCandidate type: %@\nCandidate id: %@\nDate interval: %@\nScore: %.2f\nOffset: %@", self->_anchorType, self->_candidateType, self->_candidateId, self->_dateIntervalForPrediction, *(void *)&self->_score, self->_offsetFromAnchorToShowPrediction];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXAnchorModelPrediction *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      anchorType = self->_anchorType;
      v7 = v5->_anchorType;
      if (anchorType == v7)
      {
      }
      else
      {
        v8 = v7;
        v9 = anchorType;
        char v10 = [(NSString *)v9 isEqual:v8];

        if ((v10 & 1) == 0) {
          goto LABEL_30;
        }
      }
      candidateType = self->_candidateType;
      v13 = v5->_candidateType;
      if (candidateType == v13)
      {
      }
      else
      {
        v14 = v13;
        v15 = candidateType;
        char v16 = [(NSString *)v15 isEqual:v14];

        if ((v16 & 1) == 0) {
          goto LABEL_30;
        }
      }
      candidateId = self->_candidateId;
      v18 = v5->_candidateId;
      if (candidateId == v18)
      {
      }
      else
      {
        v19 = v18;
        v20 = candidateId;
        char v21 = [(NSString *)v20 isEqual:v19];

        if ((v21 & 1) == 0) {
          goto LABEL_30;
        }
      }
      dateIntervalForPrediction = self->_dateIntervalForPrediction;
      v23 = v5->_dateIntervalForPrediction;
      if (dateIntervalForPrediction == v23)
      {
      }
      else
      {
        v24 = v23;
        v25 = dateIntervalForPrediction;
        char v26 = [(NSDateInterval *)v25 isEqual:v24];

        if ((v26 & 1) == 0) {
          goto LABEL_30;
        }
      }
      [(ATXAnchorModelPrediction *)v5 score];
      if (v27 != self->_score) {
        goto LABEL_30;
      }
      if ([(ATXAnchorModelPrediction *)v5 numUniqueOccurrencesAfterAnchor] != self->_numUniqueOccurrencesAfterAnchor) {
        goto LABEL_30;
      }
      [(ATXAnchorModelPrediction *)v5 posteriorProbability];
      if (vabdd_f64(v28, self->_posteriorProbability) > 0.001) {
        goto LABEL_30;
      }
      [(ATXAnchorModelPrediction *)v5 classConditionalProbability];
      if (vabdd_f64(v29, self->_classConditionalProbability) > 0.001) {
        goto LABEL_30;
      }
      [(ATXAnchorModelPrediction *)v5 standardDeviationOfOffsetFromAnchor];
      if (vabdd_f64(v30, self->_standardDeviationOfOffsetFromAnchor) > 0.001) {
        goto LABEL_30;
      }
      [(ATXAnchorModelPrediction *)v5 anchorPopularity];
      if (vabdd_f64(v31, self->_anchorPopularity) > 0.001) {
        goto LABEL_30;
      }
      [(ATXAnchorModelPrediction *)v5 globalPopularity];
      if (vabdd_f64(v32, self->_globalPopularity) > 0.001) {
        goto LABEL_30;
      }
      offsetFromAnchorToShowPrediction = self->_offsetFromAnchorToShowPrediction;
      v34 = v5->_offsetFromAnchorToShowPrediction;
      if (offsetFromAnchorToShowPrediction == v34)
      {
      }
      else
      {
        uint64_t v35 = v34;
        v36 = offsetFromAnchorToShowPrediction;
        BOOL v37 = [(ATXAnchorModelPredictionOffsetFromAnchorOccurrence *)v36 isEqual:v35];

        if (!v37)
        {
LABEL_30:
          char v11 = 0;
LABEL_31:

          goto LABEL_32;
        }
      }
      v39 = self->_candidateClassifier;
      v40 = v39;
      if (v39 == v5->_candidateClassifier) {
        char v11 = 1;
      }
      else {
        char v11 = -[ATXAnchorModelCandidateClassifierProtocol isEqual:](v39, "isEqual:");
      }

      goto LABEL_31;
    }
    char v11 = 0;
  }
LABEL_32:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_anchorType hash];
  NSUInteger v4 = [(NSString *)self->_candidateType hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_candidateId hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSDateInterval *)self->_dateIntervalForPrediction hash];
  unint64_t v7 = (unint64_t)self->_score - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  return [(ATXAnchorModelPredictionOffsetFromAnchorOccurrence *)self->_offsetFromAnchorToShowPrediction hash]
       - v7
       + 32 * v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    v15 = [v12 error];

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
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (a3 == 0.0)
  {
    v15 = [v12 error];

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
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
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
  anchorType = self->_anchorType;
  id v5 = a3;
  [v5 encodeObject:anchorType forKey:@"codingKeyForAnchorType"];
  [v5 encodeObject:self->_anchorEvent forKey:@"codingKeyForAnchorEvent"];
  [v5 encodeObject:self->_candidateType forKey:@"codingKeyForCandidateType"];
  [v5 encodeObject:self->_candidateId forKey:@"codingKeyForCandidateId"];
  [v5 encodeObject:self->_dateIntervalForPrediction forKey:@"codingKeyForPredictionDateInterval"];
  [v5 encodeDouble:@"codingKeyForScore" forKey:self->_score];
  [v5 encodeInteger:self->_numUniqueOccurrencesAfterAnchor forKey:@"codingKeyForNumUniqueOccurrencesAfterAnchor"];
  [v5 encodeDouble:@"codingKeyForPosteriorProbability" forKey:self->_posteriorProbability];
  [v5 encodeDouble:@"codingKeyForClassConditionalProbability" forKey:self->_classConditionalProbability];
  [v5 encodeDouble:@"codingKeyForStandardDeviationOfOffsetFromAnchor" forKey:self->_standardDeviationOfOffsetFromAnchor];
  [v5 encodeDouble:@"codingKeyForAnchorPopularity" forKey:self->_anchorPopularity];
  [v5 encodeDouble:@"codingKeyForGlobalPopularity" forKey:self->_globalPopularity];
  [v5 encodeObject:self->_offsetFromAnchorToShowPrediction forKey:@"codingKeyForAnchorOffset"];
  [v5 encodeObject:self->_candidateClassifier forKey:@"codingKeyForCandidateClassifier"];
}

- (ATXAnchorModelPrediction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  unint64_t v7 = __atxlog_handle_anchor();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForAnchorType" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.AnchorModelPrediction" errorCode:-1 logHandle:v7];

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v10 = objc_opt_class();
    id v11 = __atxlog_handle_anchor();
    id v12 = [v9 robustDecodeObjectOfClass:v10 forKey:@"codingKeyForAnchorEvent" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.AnchorModelPrediction" errorCode:-1 logHandle:v11];

    if (v12)
    {
      id v13 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v14 = objc_opt_class();
      v15 = __atxlog_handle_anchor();
      id v16 = [v13 robustDecodeObjectOfClass:v14 forKey:@"codingKeyForCandidateType" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.AnchorModelPrediction" errorCode:-1 logHandle:v15];

      if (v16)
      {
        v17 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v18 = objc_opt_class();
        v19 = __atxlog_handle_anchor();
        v20 = [v17 robustDecodeObjectOfClass:v18 forKey:@"codingKeyForCandidateId" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.AnchorModelPrediction" errorCode:-1 logHandle:v19];

        if (v20)
        {
          uint64_t v21 = (void *)MEMORY[0x1E4F93B90];
          uint64_t v22 = objc_opt_class();
          v23 = __atxlog_handle_anchor();
          v24 = [v21 robustDecodeObjectOfClass:v22 forKey:@"codingKeyForPredictionDateInterval" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.AnchorModelPrediction" errorCode:-1 logHandle:v23];

          if (!v24) {
            goto LABEL_13;
          }
          [v4 decodeDoubleForKey:@"codingKeyForScore"];
          double v26 = v25;
          if (-[ATXAnchorModelPrediction checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", @"codingKeyForScore", v4, @"com.apple.proactive.AnchorModelPrediction", -1))
          {
            goto LABEL_13;
          }
          uint64_t v27 = [v4 decodeIntegerForKey:@"codingKeyForNumUniqueOccurrencesAfterAnchor"];
          if ([(ATXAnchorModelPrediction *)self checkAndReportDecodingFailureIfNeededForNSInteger:(uint64_t)v26 key:@"codingKeyForNumUniqueOccurrencesAfterAnchor" coder:v4 errorDomain:@"com.apple.proactive.AnchorModelPrediction" errorCode:-1])
          {
            goto LABEL_13;
          }
          [v4 decodeDoubleForKey:@"codingKeyForPosteriorProbability"];
          double v29 = v28;
          if ([(ATXAnchorModelPrediction *)self checkAndReportDecodingFailureIfNeededFordouble:@"codingKeyForPosteriorProbability" key:v4 coder:@"com.apple.proactive.AnchorModelPrediction" errorDomain:-1 errorCode:v26])
          {
            goto LABEL_13;
          }
          [v4 decodeDoubleForKey:@"codingKeyForClassConditionalProbability"];
          double v31 = v30;
          if (-[ATXAnchorModelPrediction checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", @"codingKeyForClassConditionalProbability", v4, @"com.apple.proactive.AnchorModelPrediction", -1, v26)|| ([v4 decodeDoubleForKey:@"codingKeyForStandardDeviationOfOffsetFromAnchor"], double v33 = v32, -[ATXAnchorModelPrediction checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", @"codingKeyForStandardDeviationOfOffsetFromAnchor", v4, @"com.apple.proactive.AnchorModelPrediction", -1, v26))|| (objc_msgSend(v4, "decodeDoubleForKey:", @"codingKeyForAnchorPopularity"), v35 = v34,
                -[ATXAnchorModelPrediction checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", @"codingKeyForAnchorPopularity", v4, @"com.apple.proactive.AnchorModelPrediction", -1, v26))|| ([v4 decodeDoubleForKey:@"codingKeyForGlobalPopularity"], double v37 = v36, -[ATXAnchorModelPrediction checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", @"codingKeyForGlobalPopularity", v4, @"com.apple.proactive.AnchorModelPrediction", -1, v26)))
          {
LABEL_13:
            v38 = 0;
          }
          else
          {
            v40 = (void *)MEMORY[0x1E4F93B90];
            uint64_t v50 = objc_opt_class();
            v52 = __atxlog_handle_anchor();
            uint64_t v41 = [v40 robustDecodeObjectOfClass:v50 forKey:@"codingKeyForAnchorOffset" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.AnchorModelPrediction" errorCode:-1 logHandle:v52];

            v53 = (void *)v41;
            if (v41)
            {
              v51 = (void *)MEMORY[0x1E4F93B90];
              context = (void *)MEMORY[0x1D25F6CC0]();
              id v47 = objc_alloc(MEMORY[0x1E4F1CAD0]);
              uint64_t v42 = objc_opt_class();
              uint64_t v43 = objc_opt_class();
              v48 = objc_msgSend(v47, "initWithObjects:", v42, v43, objc_opt_class(), 0);
              v44 = __atxlog_handle_anchor();
              v45 = [v51 robustDecodeObjectOfClasses:v48 forKey:@"codingKeyForCandidateClassifier" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.AnchorModelPrediction" errorCode:-1 logHandle:v44];

              self = [(ATXAnchorModelPrediction *)self initWithAnchorType:v8 anchorEvent:v12 candidateType:v16 candidateId:v20 dateIntervalForPrediction:v24 score:v27 numUniqueOccurrencesAfterAnchor:v26 posteriorProbability:v29 classConditionalProbability:v31 standardDeviationOfOffsetFromAnchor:v33 anchorPopularity:v35 globalPopularity:v37 offsetFromAnchorToShowPrediction:v53 candidateClassifier:v45];
              v38 = self;
              v46 = v53;
            }
            else
            {
              v38 = 0;
              v46 = 0;
            }
          }
        }
        else
        {
          v38 = 0;
        }
      }
      else
      {
        v38 = 0;
      }
    }
    else
    {
      v38 = 0;
    }
  }
  else
  {
    v38 = 0;
  }

  return v38;
}

- (NSString)anchorType
{
  return self->_anchorType;
}

- (ATXDuetEvent)anchorEvent
{
  return self->_anchorEvent;
}

- (NSString)candidateType
{
  return self->_candidateType;
}

- (NSString)candidateId
{
  return self->_candidateId;
}

- (NSDateInterval)dateIntervalForPrediction
{
  return self->_dateIntervalForPrediction;
}

- (ATXAnchorModelPredictionOffsetFromAnchorOccurrence)offsetFromAnchorToShowPrediction
{
  return self->_offsetFromAnchorToShowPrediction;
}

- (double)score
{
  return self->_score;
}

- (unint64_t)numUniqueOccurrencesAfterAnchor
{
  return self->_numUniqueOccurrencesAfterAnchor;
}

- (double)posteriorProbability
{
  return self->_posteriorProbability;
}

- (double)classConditionalProbability
{
  return self->_classConditionalProbability;
}

- (double)standardDeviationOfOffsetFromAnchor
{
  return self->_standardDeviationOfOffsetFromAnchor;
}

- (double)anchorPopularity
{
  return self->_anchorPopularity;
}

- (double)globalPopularity
{
  return self->_globalPopularity;
}

- (ATXAnchorModelCandidateClassifierProtocol)candidateClassifier
{
  return self->_candidateClassifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateClassifier, 0);
  objc_storeStrong((id *)&self->_offsetFromAnchorToShowPrediction, 0);
  objc_storeStrong((id *)&self->_dateIntervalForPrediction, 0);
  objc_storeStrong((id *)&self->_candidateId, 0);
  objc_storeStrong((id *)&self->_candidateType, 0);
  objc_storeStrong((id *)&self->_anchorEvent, 0);
  objc_storeStrong((id *)&self->_anchorType, 0);
}

@end