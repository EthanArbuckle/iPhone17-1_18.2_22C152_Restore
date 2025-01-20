@interface _CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl
+ (BOOL)supportsSecureCoding;
+ (id)fingerprintForPosterConfiguration:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSUUID)UUID;
- (_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl)initWithCoder:(id)a3;
- (_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl)initWithPosterUUID:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation _CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl

- (void).cxx_destruct
{
}

- (void)setUUID:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"posterUUID"];

  v6 = [(_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl *)self initWithPosterUUID:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)hash
{
  return [MEMORY[0x1E4F5A418] objectHash:self->_UUID] + 527;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl *)a3;
  BOOL v7 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (UUID = self->_UUID,
          unint64_t v6 = (unint64_t)[(_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl *)v4 UUID],
          (unint64_t)UUID | v6)
      && ![(NSUUID *)UUID isEqual:v6])
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"UUID" object:self->_UUID];
  v5 = [v3 build];

  return (NSString *)v5;
}

- (_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl)initWithPosterUUID:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl;
  unint64_t v6 = [(_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl *)&v10 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_UUID, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fingerprintForPosterConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = [_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl alloc];
  id v5 = [v3 serverUUID];

  unint64_t v6 = [(_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl *)v4 initWithPosterUUID:v5];

  return v6;
}

@end