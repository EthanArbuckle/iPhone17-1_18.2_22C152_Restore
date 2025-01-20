@interface HKPHQ9Assessment
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)assessmentWithDate:(id)a3 answers:(id)a4;
+ (id)assessmentWithDate:(id)a3 answers:(id)a4 metadata:(id)a5;
+ (int64_t)_riskForAnswers:(id)a3;
+ (int64_t)_scoreForAnswers:(id)a3;
- (BOOL)isEquivalent:(id)a3;
- (HKPHQ9Assessment)initWithCoder:(id)a3;
- (HKPHQ9Assessment)initWithDate:(id)a3 answers:(id)a4 metadata:(id)a5;
- (NSArray)answers;
- (NSString)description;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (int64_t)risk;
- (void)_setAnswers:(id)a3;
- (void)_setRisk:(int64_t)a3;
- (void)_validateAnswers:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKPHQ9Assessment

+ (id)assessmentWithDate:(id)a3 answers:(id)a4 metadata:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = +[HKObjectType scoredAssessmentTypeForIdentifier:@"HKScoredAssessmentTypeIdentifierPHQ9"];
  int64_t v12 = +[HKPHQ9Assessment _scoreForAnswers:v8];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __56__HKPHQ9Assessment_assessmentWithDate_answers_metadata___block_invoke;
  v17[3] = &unk_1E58BBF38;
  id v18 = v8;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___HKPHQ9Assessment;
  id v13 = v8;
  v14 = objc_msgSendSuper2(&v16, sel_assessmentWithDate_type_score_metadata_config_, v10, v11, v12, v9, v17);

  return v14;
}

uint64_t __56__HKPHQ9Assessment_assessmentWithDate_answers_metadata___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  v7 = a2;
  uint64_t v4 = [v3 copy];
  v5 = (void *)v7[13];
  v7[13] = v4;

  v7[14] = +[HKPHQ9Assessment _riskForAnswers:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

+ (id)assessmentWithDate:(id)a3 answers:(id)a4
{
  return (id)[a1 assessmentWithDate:a3 answers:a4 metadata:0];
}

- (HKPHQ9Assessment)initWithDate:(id)a3 answers:(id)a4 metadata:(id)a5
{
  v6 = +[HKPHQ9Assessment assessmentWithDate:a3 answers:a4 metadata:a5];

  return v6;
}

+ (int64_t)_scoreForAnswers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v12 + 1) + 8 * i) integerValue];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }
  if ([v3 count] == 9)
  {
    id v9 = [v3 objectAtIndexedSubscript:8];
    uint64_t v10 = [v9 integerValue];

    if (v10 == 4) {
      v6 -= 4;
    }
  }

  return v6;
}

+ (int64_t)_riskForAnswers:(id)a3
{
  unint64_t v3 = +[HKPHQ9Assessment _scoreForAnswers:a3];
  if ((uint64_t)v3 < 5) {
    return 1;
  }
  if (v3 < 0xA) {
    return 2;
  }
  int64_t v4 = 4;
  if (v3 > 0x13) {
    int64_t v4 = 5;
  }
  if (v3 >= 0xF) {
    return v4;
  }
  else {
    return 3;
  }
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKPHQ9Assessment;
  int64_t v4 = -[HKSample _validateWithConfiguration:](&v8, sel__validateWithConfiguration_, a3.var0, a3.var1);
  uint64_t v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    [(HKPHQ9Assessment *)self _validateAnswers:self->_answers];
  }

  return v5;
}

- (void)_validateAnswers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count] != 9) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ requires 9 answers.", objc_opt_class() format];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int64_t v4 = objc_msgSend(v3, "subarrayWithRange:", 0, 8);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 integerValue] > 3 || objc_msgSend(v10, "integerValue") < 0) {
          [MEMORY[0x1E4F1CA00] raise:v8, @"%@ answer for questions #1-8 must be on a scale of 0 to 3.", objc_opt_class() format];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v11 = [v3 objectAtIndexedSubscript:8];
  if ([v11 integerValue] >= 5)
  {

LABEL_17:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ answer for questions #9 must be on a scale of 0 to 3 or unanswered.", objc_opt_class() format];
    goto LABEL_18;
  }
  long long v12 = [v3 objectAtIndexedSubscript:8];
  uint64_t v13 = [v12 integerValue];

  if (v13 < 0) {
    goto LABEL_17;
  }
LABEL_18:
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKPHQ9Assessment;
  if ([(HKScoredAssessment *)&v8 isEquivalent:v4])
  {
    uint64_t v5 = v4;
    if ([(NSArray *)self->_answers isEqual:v5[13]]) {
      BOOL v6 = self->_risk == v5[14];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_setAnswers:(id)a3
{
}

- (void)_setRisk:(int64_t)a3
{
  self->_risk = a3;
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)HKPHQ9Assessment;
  id v3 = [(HKScoredAssessment *)&v9 description];
  id v4 = [(HKSample *)self sampleType];
  uint64_t v5 = [(HKSample *)self startDate];
  BOOL v6 = [(HKPHQ9Assessment *)self answers];
  uint64_t v7 = [v3 stringByAppendingFormat:@"type: %@, date: %@, answers: %@, score: %ld, risk: %ld", v4, v5, v6, -[HKScoredAssessment score](self, "score"), -[HKPHQ9Assessment risk](self, "risk")];

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKPHQ9Assessment;
  id v4 = a3;
  [(HKScoredAssessment *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_answers, @"Answers", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_risk forKey:@"Risk"];
}

- (HKPHQ9Assessment)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKPHQ9Assessment;
  objc_super v5 = [(HKScoredAssessment *)&v10 initWithCoder:v4];
  if (v5)
  {
    BOOL v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForArrayOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"Answers"];
    answers = v5->_answers;
    v5->_answers = (NSArray *)v7;

    v5->_risk = [v4 decodeIntegerForKey:@"Risk"];
  }

  return v5;
}

- (NSArray)answers
{
  return self->_answers;
}

- (int64_t)risk
{
  return self->_risk;
}

- (void).cxx_destruct
{
}

@end