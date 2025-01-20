@interface AFSharedConfidenceScore
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFSharedConfidenceScore)init;
- (AFSharedConfidenceScore)initWithBuilder:(id)a3;
- (AFSharedConfidenceScore)initWithCoder:(id)a3;
- (AFSharedConfidenceScore)initWithDictionaryRepresentation:(id)a3;
- (AFSharedConfidenceScore)initWithSharedUserId:(id)a3 confidenceScore:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)sharedUserId;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)confidenceScore;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSharedConfidenceScore

- (void).cxx_destruct
{
}

- (unint64_t)confidenceScore
{
  return self->_confidenceScore;
}

- (NSString)sharedUserId
{
  return self->_sharedUserId;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  sharedUserId = self->_sharedUserId;
  if (sharedUserId) {
    [v3 setObject:sharedUserId forKey:@"sharedUserId"];
  }
  v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_confidenceScore];
  [v4 setObject:v6 forKey:@"confidenceScore"];

  v7 = (void *)[v4 copy];
  return v7;
}

- (AFSharedConfidenceScore)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 objectForKey:@"sharedUserId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    v8 = [v4 objectForKey:@"confidenceScore"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    uint64_t v10 = [v9 unsignedIntegerValue];
    self = [(AFSharedConfidenceScore *)self initWithSharedUserId:v6 confidenceScore:v10];

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  sharedUserId = self->_sharedUserId;
  id v5 = a3;
  [v5 encodeObject:sharedUserId forKey:@"AFSharedConfidenceScore::sharedUserId"];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_confidenceScore];
  [v5 encodeObject:v6 forKey:@"AFSharedConfidenceScore::confidenceScore"];
}

- (AFSharedConfidenceScore)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSharedConfidenceScore::sharedUserId"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSharedConfidenceScore::confidenceScore"];

  uint64_t v7 = [v6 unsignedIntegerValue];
  v8 = [(AFSharedConfidenceScore *)self initWithSharedUserId:v5 confidenceScore:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFSharedConfidenceScore *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t confidenceScore = self->_confidenceScore;
      if (confidenceScore == [(AFSharedConfidenceScore *)v5 confidenceScore])
      {
        uint64_t v7 = [(AFSharedConfidenceScore *)v5 sharedUserId];
        sharedUserId = self->_sharedUserId;
        BOOL v9 = sharedUserId == v7 || [(NSString *)sharedUserId isEqual:v7];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sharedUserId hash];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_confidenceScore];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFSharedConfidenceScore;
  unint64_t v5 = [(AFSharedConfidenceScore *)&v8 description];
  id v6 = (void *)[v4 initWithFormat:@"%@ {sharedUserId = %@, confidenceScore = %llu}", v5, self->_sharedUserId, self->_confidenceScore];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(AFSharedConfidenceScore *)self _descriptionWithIndent:0];
}

- (AFSharedConfidenceScore)initWithSharedUserId:(id)a3 confidenceScore:(unint64_t)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__AFSharedConfidenceScore_initWithSharedUserId_confidenceScore___block_invoke;
  v10[3] = &unk_1E592B0A0;
  id v11 = v6;
  unint64_t v12 = a4;
  id v7 = v6;
  objc_super v8 = [(AFSharedConfidenceScore *)self initWithBuilder:v10];

  return v8;
}

void __64__AFSharedConfidenceScore_initWithSharedUserId_confidenceScore___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setSharedUserId:v3];
  [v4 setConfidenceScore:*(void *)(a1 + 40)];
}

- (AFSharedConfidenceScore)init
{
  return [(AFSharedConfidenceScore *)self initWithBuilder:0];
}

- (AFSharedConfidenceScore)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFSharedConfidenceScoreMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSharedConfidenceScore;
  unint64_t v5 = [(AFSharedConfidenceScore *)&v12 init];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [[_AFSharedConfidenceScoreMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFSharedConfidenceScoreMutation *)v7 isDirty])
    {
      objc_super v8 = [(_AFSharedConfidenceScoreMutation *)v7 getSharedUserId];
      uint64_t v9 = [v8 copy];
      sharedUserId = v6->_sharedUserId;
      v6->_sharedUserId = (NSString *)v9;

      v6->_unint64_t confidenceScore = [(_AFSharedConfidenceScoreMutation *)v7 getConfidenceScore];
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFSharedConfidenceScoreMutation *))a3;
  if (v4)
  {
    unint64_t v5 = [[_AFSharedConfidenceScoreMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFSharedConfidenceScoreMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(AFSharedConfidenceScore);
      id v7 = [(_AFSharedConfidenceScoreMutation *)v5 getSharedUserId];
      uint64_t v8 = [v7 copy];
      sharedUserId = v6->_sharedUserId;
      v6->_sharedUserId = (NSString *)v8;

      v6->_unint64_t confidenceScore = [(_AFSharedConfidenceScoreMutation *)v5 getConfidenceScore];
    }
    else
    {
      id v6 = (AFSharedConfidenceScore *)[(AFSharedConfidenceScore *)self copy];
    }
  }
  else
  {
    id v6 = (AFSharedConfidenceScore *)[(AFSharedConfidenceScore *)self copy];
  }

  return v6;
}

@end