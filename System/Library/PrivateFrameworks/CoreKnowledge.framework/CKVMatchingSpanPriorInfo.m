@interface CKVMatchingSpanPriorInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMatchingSpanPriorInfo:(id)a3;
- (CKVMatchingSpanPriorInfo)init;
- (CKVMatchingSpanPriorInfo)initWithCoder:(id)a3;
- (CKVMatchingSpanPriorInfo)initWithOrdinality:(unsigned int)a3 score:(float)a4;
- (float)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)ordinality;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKVMatchingSpanPriorInfo

- (float)score
{
  return self->_score;
}

- (unsigned)ordinality
{
  return self->_ordinality;
}

- (BOOL)isEqualToMatchingSpanPriorInfo:(id)a3
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
  id v4 = (CKVMatchingSpanPriorInfo *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CKVMatchingSpanPriorInfo *)self isEqualToMatchingSpanPriorInfo:v5];

  return v6;
}

- (CKVMatchingSpanPriorInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKVMatchingSpanPriorInfo;
  v5 = [(CKVMatchingSpanPriorInfo *)&v9 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ordinality"];
    v5->_unsigned int ordinality = [v6 unsignedIntValue];

    [v4 decodeFloatForKey:@"score"];
    v5->_float score = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  uint64_t ordinality = self->_ordinality;
  id v8 = a3;
  BOOL v6 = [v4 numberWithUnsignedInt:ordinality];
  [v8 encodeObject:v6 forKey:@"ordinality"];

  *(float *)&double v7 = self->_score;
  [v8 encodeFloat:@"score" forKey:v7];
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithUnsignedInt:self->_ordinality];
  uint64_t v4 = [v3 hash];
  *(float *)&double v5 = self->_score;
  BOOL v6 = [NSNumber numberWithFloat:v5];
  unint64_t v7 = [v6 hash] ^ v4;

  return v7;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CKVMatchingSpanPriorInfo;
  v3 = [(CKVMatchingSpanPriorInfo *)&v6 description];
  uint64_t v4 = [v3 stringByAppendingFormat:@" ordinality: %d, prior score: %f", self->_ordinality, self->_score];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[(id)objc_opt_class() allocWithZone:a3];
  *((_DWORD *)result + 2) = self->_ordinality;
  *((_DWORD *)result + 3) = LODWORD(self->_score);
  return result;
}

- (CKVMatchingSpanPriorInfo)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"You must use supported initializers" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CKVMatchingSpanPriorInfo)initWithOrdinality:(unsigned int)a3 score:(float)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)CKVMatchingSpanPriorInfo;
  objc_super v6 = [(CKVMatchingSpanPriorInfo *)&v11 init];
  unint64_t v7 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  if (a4 >= 0.0)
  {
    v6->_uint64_t ordinality = a3;
    v6->_float score = a4;
LABEL_7:
    objc_super v9 = v6;
    goto LABEL_8;
  }
  id v8 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[CKVMatchingSpanPriorInfo initWithOrdinality:score:]";
    _os_log_error_impl(&dword_1A77B3000, v8, OS_LOG_TYPE_ERROR, "%s Cannot construct CKVMatchingSpanPriorInfo with negative prior score.", buf, 0xCu);
  }
  objc_super v9 = 0;
LABEL_8:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end