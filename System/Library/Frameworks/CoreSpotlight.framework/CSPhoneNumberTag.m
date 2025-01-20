@interface CSPhoneNumberTag
- (BOOL)isEqual:(id)a3;
- (CSPhoneNumberTag)initWithCoder:(id)a3;
- (CSPhoneNumberTag)initWithPhoneNumber:(id)a3 synonyms:(id)a4 countryCode:(int64_t)a5 confidence:(double)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)countryCodeValue;
- (unint64_t)hash;
- (void)encodeWithCSCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSPhoneNumberTag

- (void)encodeWithCSCoder:(id)a3
{
  id v8 = a3;
  [v8 beginType:"CSPhoneNumberTag"];
  id v4 = [(CSExternalAnalysisTag *)self label];
  objc_msgSend(v8, "encodeString:length:", objc_msgSend(v4, "UTF8String"), -1);

  uint64_t v5 = [(CSExternalAnalysisTag *)self synonyms];
  v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
  }
  [v8 encodeObject:v7];

  [(CSExternalAnalysisTag *)self confidence];
  objc_msgSend(v8, "encodeDouble:");
  objc_msgSend(v8, "encodeInt32:", -[CSPhoneNumberTag countryCodeValue](self, "countryCodeValue"));
  [v8 endType];
}

- (CSPhoneNumberTag)initWithPhoneNumber:(id)a3 synonyms:(id)a4 countryCode:(int64_t)a5 confidence:(double)a6
{
  v8.receiver = self;
  v8.super_class = (Class)CSPhoneNumberTag;
  result = [(CSExternalAnalysisTag *)&v8 initWithLabel:a3 synonyms:a4 confidence:a6];
  if (result) {
    result->_countryCodeValue = a5;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSPhoneNumberTag;
  id v4 = a3;
  [(CSExternalAnalysisTag *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_countryCodeValue, @"countryCode", v5.receiver, v5.super_class);
}

- (CSPhoneNumberTag)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSPhoneNumberTag;
  objc_super v5 = [(CSExternalAnalysisTag *)&v7 initWithCoder:v4];
  if (v5 && [v4 containsValueForKey:@"countryCode"]) {
    v5->_countryCodeValue = [v4 decodeIntegerForKey:@"countryCode"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  label = self->super._label;
  synonyms = self->super._synonyms;
  int64_t countryCodeValue = self->_countryCodeValue;
  double confidence = self->super._confidence;

  return (id)[v4 initWithPhoneNumber:label synonyms:synonyms countryCode:countryCodeValue confidence:confidence];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v9.receiver = self;
    v9.super_class = (Class)CSPhoneNumberTag;
    if ([(CSExternalAnalysisTag *)&v9 isEqual:v5])
    {
      int64_t countryCodeValue = self->_countryCodeValue;
      BOOL v7 = countryCodeValue == [v5 countryCodeValue];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)CSPhoneNumberTag;
  unint64_t v3 = [(CSExternalAnalysisTag *)&v5 hash];
  return MDUHash64(self->_countryCodeValue) ^ v3;
}

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p %@", objc_opt_class(), self, self->super._label];
  id v4 = v3;
  if (self->_countryCodeValue) {
    objc_msgSend(v3, "appendFormat:", @" countryCode: %ld", self->_countryCodeValue);
  }
  if (self->super._confidence != 0.0) {
    objc_msgSend(v4, "appendFormat:", @" confidence: %f", *(void *)&self->super._confidence);
  }
  [v4 appendFormat:@" label: %@", self->super._label];
  if ([(NSArray *)self->super._synonyms count])
  {
    objc_super v5 = [(NSArray *)self->super._synonyms componentsJoinedByString:@", "];
    [v4 appendFormat:@" synonyms: <%@>", v5];
  }
  [v4 appendString:@">"];

  return v4;
}

- (int64_t)countryCodeValue
{
  return self->_countryCodeValue;
}

@end