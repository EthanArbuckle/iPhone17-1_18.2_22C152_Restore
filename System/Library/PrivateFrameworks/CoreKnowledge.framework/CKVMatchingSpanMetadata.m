@interface CKVMatchingSpanMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMatchingSpanMetadata:(id)a3;
- (CKVMatchingSpanMetadata)init;
- (CKVMatchingSpanMetadata)initWithCoder:(id)a3;
- (CKVMatchingSpanMetadata)initWithMatchScore:(float)a3;
- (CKVMatchingSpanMetadata)initWithMatchingSpanPriorInfo:(id)a3 matchScore:(float)a4;
- (CKVMatchingSpanPriorInfo)priorInfo;
- (float)matchScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKVMatchingSpanMetadata

- (void).cxx_destruct
{
}

- (CKVMatchingSpanPriorInfo)priorInfo
{
  return self->_priorInfo;
}

- (float)matchScore
{
  return self->_matchScore;
}

- (BOOL)isEqualToMatchingSpanMetadata:(id)a3
{
  id v4 = a3;
  float matchScore = self->_matchScore;
  [v4 matchScore];
  if (matchScore == v6)
  {
    uint64_t v8 = [v4 priorInfo];
    priorInfo = self->_priorInfo;
    if ((unint64_t)priorInfo | v8)
    {
      char v7 = 0;
      if (priorInfo && v8) {
        char v7 = [(CKVMatchingSpanPriorInfo *)priorInfo isEqual:v8];
      }
    }
    else
    {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKVMatchingSpanMetadata *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CKVMatchingSpanMetadata *)self isEqualToMatchingSpanMetadata:v5];

  return v6;
}

- (CKVMatchingSpanMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKVMatchingSpanMetadata;
  v5 = [(CKVMatchingSpanMetadata *)&v10 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"matchScore"];
    v5->_float matchScore = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"priorInfo"];
    priorInfo = v5->_priorInfo;
    v5->_priorInfo = (CKVMatchingSpanPriorInfo *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  float matchScore = self->_matchScore;
  id v6 = a3;
  *(float *)&double v5 = matchScore;
  [v6 encodeFloat:@"matchScore" forKey:v5];
  [v6 encodeObject:self->_priorInfo forKey:@"priorInfo"];
}

- (unint64_t)hash
{
  *(float *)&double v2 = self->_matchScore;
  id v4 = [NSNumber numberWithFloat:v2];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = [(CKVMatchingSpanPriorInfo *)self->_priorInfo hash] ^ v5;

  return v6;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CKVMatchingSpanMetadata;
  v3 = [(CKVMatchingSpanMetadata *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" prior information: %@, match score: %f", self->_priorInfo, self->_matchScore];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  *(float *)(v4 + 8) = self->_matchScore;
  uint64_t v5 = [(CKVMatchingSpanPriorInfo *)self->_priorInfo copy];
  objc_super v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  return (id)v4;
}

- (CKVMatchingSpanMetadata)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"You must use supported initializers" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CKVMatchingSpanMetadata)initWithMatchingSpanPriorInfo:(id)a3 matchScore:(float)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKVMatchingSpanMetadata;
  uint64_t v8 = [(CKVMatchingSpanMetadata *)&v13 init];
  v9 = (float *)v8;
  if (!v8) {
    goto LABEL_7;
  }
  if (a4 >= 0.0)
  {
    objc_storeStrong((id *)&v8->_priorInfo, a3);
    v9[2] = a4;
LABEL_7:
    v11 = v9;
    goto LABEL_8;
  }
  objc_super v10 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CKVMatchingSpanMetadata initWithMatchingSpanPriorInfo:matchScore:]";
    _os_log_error_impl(&dword_1A77B3000, v10, OS_LOG_TYPE_ERROR, "%s Cannot construct CKVMatchingSpanMetadata with negative match score.", buf, 0xCu);
  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (CKVMatchingSpanMetadata)initWithMatchScore:(float)a3
{
  return -[CKVMatchingSpanMetadata initWithMatchingSpanPriorInfo:matchScore:](self, "initWithMatchingSpanPriorInfo:matchScore:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end