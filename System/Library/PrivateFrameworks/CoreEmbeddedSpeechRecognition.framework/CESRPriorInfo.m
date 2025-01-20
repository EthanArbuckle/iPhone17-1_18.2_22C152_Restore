@interface CESRPriorInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPriorInfo:(id)a3;
- (CESRPriorInfo)init;
- (CESRPriorInfo)initWithCoder:(id)a3;
- (CESRPriorInfo)initWithOrdinality:(unsigned int)a3 score:(float)a4;
- (float)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)ordinality;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CESRPriorInfo

- (CESRPriorInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CESRPriorInfo;
  v5 = [(CESRPriorInfo *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"o"];
    v5->_ordinality = [v6 unsignedIntValue];

    [v4 decodeFloatForKey:@"s"];
    v5->_score = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [NSNumber numberWithUnsignedInt:self->_ordinality];
  [v6 encodeObject:v4 forKey:@"o"];

  *(float *)&double v5 = self->_score;
  [v6 encodeFloat:@"s" forKey:v5];
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithUnsignedInt:self->_ordinality];
  uint64_t v4 = [v3 hash];
  *(float *)&double v5 = self->_score;
  id v6 = [NSNumber numberWithFloat:v5];
  unint64_t v7 = [v6 hash] ^ v4;

  return v7;
}

- (BOOL)isEqualToPriorInfo:(id)a3
{
  id v4 = a3;
  unsigned int ordinality = self->_ordinality;
  if (ordinality == [v4 ordinality])
  {
    float score = self->_score;
    [v4 score];
    BOOL v8 = score == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CESRPriorInfo *)a3;
  double v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CESRPriorInfo *)self isEqualToPriorInfo:v5];

  return v6;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CESRPriorInfo;
  v3 = [(CESRPriorInfo *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" ordinality: %d, prior score: %f", self->_ordinality, self->_score];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[(id)objc_opt_class() allocWithZone:a3];
  *((_DWORD *)result + 2) = self->_ordinality;
  *((_DWORD *)result + 3) = LODWORD(self->_score);
  return result;
}

- (float)score
{
  return self->_score;
}

- (unsigned)ordinality
{
  return self->_ordinality;
}

- (CESRPriorInfo)initWithOrdinality:(unsigned int)a3 score:(float)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)CESRPriorInfo;
  objc_super v6 = [(CESRPriorInfo *)&v11 init];
  float v7 = v6;
  if (!v6) {
    goto LABEL_5;
  }
  v6->_float score = a4;
  if (a4 >= 0.0 && a4 <= 1.0)
  {
    v6->_unsigned int ordinality = a3;
LABEL_5:
    BOOL v8 = v6;
    goto LABEL_9;
  }
  objc_super v9 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[CESRPriorInfo initWithOrdinality:score:]";
    __int16 v14 = 2048;
    double v15 = a4;
    _os_log_error_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_ERROR, "%s Invalid score: %f", buf, 0x16u);
  }
  BOOL v8 = 0;
LABEL_9:

  return v8;
}

- (CESRPriorInfo)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"init unsupported" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end