@interface HKScoredAssessment
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsEquivalence;
+ (BOOL)supportsSecureCoding;
+ (id)assessmentWithDate:(id)a3 type:(id)a4 score:(int64_t)a5 metadata:(id)a6 config:(id)a7;
- (BOOL)isEquivalent:(id)a3;
- (HKScoredAssessment)initWithCoder:(id)a3;
- (id)description;
- (int64_t)score;
- (void)_setScore:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKScoredAssessment

+ (id)assessmentWithDate:(id)a3 type:(id)a4 score:(int64_t)a5 metadata:(id)a6 config:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  if ([v13 count]) {
    id v16 = v13;
  }
  else {
    id v16 = 0;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __68__HKScoredAssessment_assessmentWithDate_type_score_metadata_config___block_invoke;
  v21[3] = &unk_1E58C9598;
  id v22 = v12;
  int64_t v23 = a5;
  v20.receiver = a1;
  v20.super_class = (Class)&OBJC_METACLASS___HKScoredAssessment;
  id v17 = v12;
  id v18 = objc_msgSendSuper2(&v20, sel__newSampleFromDatesWithType_startDate_endDate_device_metadata_config_, v14, v15, v15, 0, v16, v21);

  return v18;
}

uint64_t __68__HKScoredAssessment_assessmentWithDate_type_score_metadata_config___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 96) = *(void *)(a1 + 40);
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (BOOL)_isConcreteObjectClass
{
  return 0;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKScoredAssessment;
  if ([(HKSample *)&v7 isEquivalent:v4]) {
    BOOL v5 = self->_score == v4[12];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(HKSample *)self sampleType];
  v6 = [(HKSample *)self startDate];
  objc_super v7 = [v3 stringWithFormat:@"<%@:%p type: %@, date: %@, score: %ld>", v4, self, v5, v6, -[HKScoredAssessment score](self, "score")];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKScoredAssessment;
  id v4 = a3;
  [(HKSample *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_score, @"Score", v5.receiver, v5.super_class);
}

- (HKScoredAssessment)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKScoredAssessment;
  objc_super v5 = [(HKSample *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_score = (int)[v4 decodeIntegerForKey:@"Score"];
  }

  return v5;
}

- (int64_t)score
{
  return self->_score;
}

- (void)_setScore:(int64_t)a3
{
  self->_score = a3;
}

@end