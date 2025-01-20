@interface _CNAvatarPosterCarouselLikenessFingerprintAvatarImpl
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNVisualFingerprint)visualFingerprint;
- (NSString)description;
- (_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl)initWithCoder:(id)a3;
- (_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl)initWithVisualFingerprint:(id)a3 sourceType:(int64_t)a4;
- (double)similarityThreshold;
- (int64_t)sourceType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSourceType:(int64_t)a3;
- (void)setVisualFingerprint:(id)a3;
@end

@implementation _CNAvatarPosterCarouselLikenessFingerprintAvatarImpl

- (void).cxx_destruct
{
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setVisualFingerprint:(id)a3
{
}

- (CNVisualFingerprint)visualFingerprint
{
  return self->_visualFingerprint;
}

- (_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"visualFingerprint"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"sourceType"];

  v7 = [(_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl *)self initWithVisualFingerprint:v5 sourceType:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  visualFingerprint = self->_visualFingerprint;
  id v5 = a3;
  [v5 encodeObject:visualFingerprint forKey:@"visualFingerprint"];
  [v5 encodeInteger:self->_sourceType forKey:@"sourceType"];
}

- (unint64_t)hash
{
  if (self->_visualFingerprint) {
    return 528;
  }
  else {
    return 527;
  }
}

- (double)similarityThreshold
{
  unint64_t v2 = [(_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl *)self sourceType];
  double result = 2.0;
  if (v2 <= 4) {
    return dbl_18B9C3818[v2];
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = (void *)MEMORY[0x1E4F1BAD8];
      visualFingerprint = self->_visualFingerprint;
      v7 = [(_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl *)v4 visualFingerprint];
      [(_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl *)self similarityThreshold];
      char v8 = objc_msgSend(v5, "isFingerprint:similarTo:threshold:", visualFingerprint, v7);
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"visualFingerprint" object:self->_visualFingerprint];
  id v5 = (id)[v3 appendName:@"sourceType" unsignedInteger:self->_sourceType];
  uint64_t v6 = [v3 build];

  return (NSString *)v6;
}

- (_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl)initWithVisualFingerprint:(id)a3 sourceType:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl;
  char v8 = [(_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_visualFingerprint, a3);
    v9->_sourceType = a4;
    v10 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end