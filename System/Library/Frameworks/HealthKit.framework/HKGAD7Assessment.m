@interface HKGAD7Assessment
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)assessmentWithDate:(id)a3 answers:(id)a4;
+ (id)assessmentWithDate:(id)a3 answers:(id)a4 metadata:(id)a5;
+ (int64_t)_riskForAnswers:(id)a3;
+ (int64_t)_scoreForAnswers:(id)a3;
- (BOOL)isEquivalent:(id)a3;
- (HKGAD7Assessment)initWithCoder:(id)a3;
- (HKGAD7Assessment)initWithDate:(id)a3 answers:(id)a4 metadata:(id)a5;
- (NSArray)answers;
- (NSString)description;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (int64_t)risk;
- (void)_setAnswers:(id)a3;
- (void)_setRisk:(int64_t)a3;
- (void)_validateAnswers:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKGAD7Assessment

+ (id)assessmentWithDate:(id)a3 answers:(id)a4 metadata:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = +[HKObjectType scoredAssessmentTypeForIdentifier:@"HKScoredAssessmentTypeIdentifierGAD7"];
  int64_t v12 = +[HKGAD7Assessment _scoreForAnswers:v8];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __56__HKGAD7Assessment_assessmentWithDate_answers_metadata___block_invoke;
  v17[3] = &unk_1E58BBF38;
  id v18 = v8;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___HKGAD7Assessment;
  id v13 = v8;
  v14 = objc_msgSendSuper2(&v16, sel_assessmentWithDate_type_score_metadata_config_, v10, v11, v12, v9, v17);

  return v14;
}

uint64_t __56__HKGAD7Assessment_assessmentWithDate_answers_metadata___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  v7 = a2;
  uint64_t v4 = [v3 copy];
  v5 = (void *)v7[13];
  v7[13] = v4;

  v7[14] = +[HKGAD7Assessment _riskForAnswers:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

+ (id)assessmentWithDate:(id)a3 answers:(id)a4
{
  return (id)[a1 assessmentWithDate:a3 answers:a4 metadata:0];
}

- (HKGAD7Assessment)initWithDate:(id)a3 answers:(id)a4 metadata:(id)a5
{
  v6 = +[HKGAD7Assessment assessmentWithDate:a3 answers:a4 metadata:a5];

  return v6;
}

+ (int64_t)_scoreForAnswers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v10 + 1) + 8 * i) integerValue];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

+ (int64_t)_riskForAnswers:(id)a3
{
  uint64_t v3 = +[HKGAD7Assessment _scoreForAnswers:a3];
  if (v3 < 5) {
    return 1;
  }
  int64_t v4 = 3;
  if ((unint64_t)v3 > 0xE) {
    int64_t v4 = 4;
  }
  if ((unint64_t)v3 >= 0xA) {
    return v4;
  }
  else {
    return 2;
  }
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKGAD7Assessment;
  int64_t v4 = -[HKSample _validateWithConfiguration:](&v8, sel__validateWithConfiguration_, a3.var0, a3.var1);
  uint64_t v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    [(HKGAD7Assessment *)self _validateAnswers:self->_answers];
  }

  return v5;
}

- (void)_validateAnswers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 count];
  uint64_t v5 = (uint64_t *)MEMORY[0x1E4F1C3C8];
  if (v4 != 7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ requires 7 answers.", objc_opt_class() format];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    uint64_t v10 = *v5;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v12 integerValue] > 3 || objc_msgSend(v12, "integerValue") < 0) {
          [MEMORY[0x1E4F1CA00] raise:v10, @"%@ answer must be on a scale of 0 to 3.", objc_opt_class() format];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKGAD7Assessment;
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
  v9.super_class = (Class)HKGAD7Assessment;
  id v3 = [(HKScoredAssessment *)&v9 description];
  id v4 = [(HKSample *)self sampleType];
  uint64_t v5 = [(HKSample *)self startDate];
  BOOL v6 = [(HKGAD7Assessment *)self answers];
  uint64_t v7 = [v3 stringByAppendingFormat:@"type: %@, date: %@, answers: %@, score: %ld, risk: %ld", v4, v5, v6, -[HKScoredAssessment score](self, "score"), -[HKGAD7Assessment risk](self, "risk")];

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKGAD7Assessment;
  id v4 = a3;
  [(HKScoredAssessment *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_answers, @"Answers", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_risk forKey:@"Risk"];
}

- (HKGAD7Assessment)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKGAD7Assessment;
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