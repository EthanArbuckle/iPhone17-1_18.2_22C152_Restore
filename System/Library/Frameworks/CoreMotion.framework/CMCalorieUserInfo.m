@interface CMCalorieUserInfo
+ (BOOL)supportsSecureCoding;
+ (id)genderString:(int64_t)a3;
- (BOOL)betaBlockerUse;
- (CMCalorieUserInfo)initWithAge:(double)a3 gender:(int64_t)a4 height:(double)a5 weight:(double)a6;
- (CMCalorieUserInfo)initWithAge:(double)a3 gender:(int64_t)a4 height:(double)a5 weight:(double)a6 condition:(int64_t)a7;
- (CMCalorieUserInfo)initWithAge:(double)a3 gender:(int64_t)a4 height:(double)a5 weight:(double)a6 condition:(int64_t)a7 betaBlockerUse:(BOOL)a8;
- (CMCalorieUserInfo)initWithCoder:(id)a3;
- (double)age;
- (double)height;
- (double)weight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)condition;
- (int64_t)gender;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMCalorieUserInfo

- (CMCalorieUserInfo)initWithAge:(double)a3 gender:(int64_t)a4 height:(double)a5 weight:(double)a6
{
  return (CMCalorieUserInfo *)objc_msgSend_initWithAge_gender_height_weight_condition_betaBlockerUse_(self, a2, a4, 0, 0, a3, a5, a6);
}

- (CMCalorieUserInfo)initWithAge:(double)a3 gender:(int64_t)a4 height:(double)a5 weight:(double)a6 condition:(int64_t)a7
{
  return (CMCalorieUserInfo *)objc_msgSend_initWithAge_gender_height_weight_condition_betaBlockerUse_(self, a2, a4, a7, 0, a3, a5, a6);
}

- (CMCalorieUserInfo)initWithAge:(double)a3 gender:(int64_t)a4 height:(double)a5 weight:(double)a6 condition:(int64_t)a7 betaBlockerUse:(BOOL)a8
{
  v15.receiver = self;
  v15.super_class = (Class)CMCalorieUserInfo;
  result = [(CMCalorieUserInfo *)&v15 init];
  if (result)
  {
    result->fAge = a3;
    result->fGender = a4;
    result->fHeight = a5;
    result->fWeight = a6;
    result->fCondition = a7;
    result->fBetaBlockerUse = a8;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMCalorieUserInfo;
  [(CMLogItem *)&v2 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMCalorieUserInfo)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CMCalorieUserInfo;
  v5 = -[CMLogItem initWithCoder:](&v15, sel_initWithCoder_);
  if (v5)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, @"kCalorieUserInfoCodingKeyAge");
    v5->fAge = v6;
    v5->fGender = objc_msgSend_decodeIntegerForKey_(a3, v7, @"kCalorieUserInfoCodingKeyGender");
    objc_msgSend_decodeDoubleForKey_(a3, v8, @"kCalorieUserInfoCodingKeyHeight");
    v5->fHeight = v9;
    objc_msgSend_decodeDoubleForKey_(a3, v10, @"kCalorieUserInfoCodingKeyWeight");
    v5->fWeight = v11;
    v5->fCondition = objc_msgSend_decodeIntegerForKey_(a3, v12, @"kCalorieUserInfoCodingKeyCondition");
    v5->fBetaBlockerUse = objc_msgSend_decodeBoolForKey_(a3, v13, @"kCalorieUserInfoCodingKeyBetaBlockerUse");
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  double fAge = self->fAge;
  double fHeight = self->fHeight;
  int64_t fGender = self->fGender;
  double fWeight = self->fWeight;
  int64_t fCondition = self->fCondition;
  BOOL fBetaBlockerUse = self->fBetaBlockerUse;

  return (id)objc_msgSend_initWithAge_gender_height_weight_condition_betaBlockerUse_(v7, v8, fGender, fCondition, fBetaBlockerUse, fAge, fHeight, fWeight);
}

- (void)encodeWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CMCalorieUserInfo;
  -[CMLogItem encodeWithCoder:](&v11, sel_encodeWithCoder_);
  objc_msgSend_encodeDouble_forKey_(a3, v5, @"kCalorieUserInfoCodingKeyAge", self->fAge);
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->fGender, @"kCalorieUserInfoCodingKeyGender");
  objc_msgSend_encodeDouble_forKey_(a3, v7, @"kCalorieUserInfoCodingKeyHeight", self->fHeight);
  objc_msgSend_encodeDouble_forKey_(a3, v8, @"kCalorieUserInfoCodingKeyWeight", self->fWeight);
  objc_msgSend_encodeInteger_forKey_(a3, v9, self->fCondition, @"kCalorieUserInfoCodingKeyCondition");
  objc_msgSend_encodeBool_forKey_(a3, v10, self->fBetaBlockerUse, @"kCalorieUserInfoCodingKeyBetaBlockerUse");
}

- (double)age
{
  return self->fAge;
}

- (int64_t)gender
{
  return self->fGender;
}

- (double)height
{
  return self->fHeight;
}

- (double)weight
{
  return self->fWeight;
}

- (int64_t)condition
{
  return self->fCondition;
}

- (BOOL)betaBlockerUse
{
  return self->fBetaBlockerUse;
}

+ (id)genderString:(int64_t)a3
{
  v3 = @"Female";
  if (a3 != 1) {
    v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"Male";
  }
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_age(self, v6, v7);
  uint64_t v9 = v8;
  uint64_t v12 = objc_msgSend_gender(self, v10, v11);
  uint64_t v14 = objc_msgSend_genderString_(CMCalorieUserInfo, v13, v12);
  objc_msgSend_height(self, v15, v16);
  uint64_t v18 = v17;
  objc_msgSend_weight(self, v19, v20);
  uint64_t v22 = v21;
  uint64_t v25 = objc_msgSend_condition(self, v23, v24);
  unsigned int v28 = objc_msgSend_betaBlockerUse(self, v26, v27);
  return (id)objc_msgSend_stringWithFormat_(v3, v29, @"%@, <age %f, gender %@, height %f, weight %f, condition %ld, betaBlockerUse %d>", v5, v9, v14, v18, v22, v25, v28);
}

@end