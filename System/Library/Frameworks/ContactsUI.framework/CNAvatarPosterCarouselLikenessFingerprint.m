@interface CNAvatarPosterCarouselLikenessFingerprint
+ (BOOL)supportsSecureCoding;
+ (id)archiveWithFingerprint:(id)a3;
+ (id)fingerprintForPosterConfiguration:(id)a3;
+ (id)fingerprintForPosterConfiguration:(id)a3 withConfigurationData:(id)a4;
+ (id)fingerprintForPosterConfiguration:(id)a3 withUUID:(id)a4;
+ (id)fingerprintFromArchive:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CNAvatarPosterCarouselLikenessFingerprint)initWithAvatarVisualFingerprint:(id)a3 sourceType:(int64_t)a4;
- (CNAvatarPosterCarouselLikenessFingerprint)initWithCoder:(id)a3;
- (CNAvatarPosterCarouselLikenessFingerprint)initWithImpl:(id)a3;
- (CNAvatarPosterCarouselLikenessFingerprint)initWithPosterConfigurationData:(id)a3;
- (CNAvatarPosterCarouselLikenessFingerprint)initWithPosterUUID:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNAvatarPosterCarouselLikenessFingerprint

- (void).cxx_destruct
{
}

- (CNAvatarPosterCarouselLikenessFingerprint)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v9 = [v5 decodeObjectOfClasses:v8 forKey:@"impl"];

  v10 = [(CNAvatarPosterCarouselLikenessFingerprint *)self initWithImpl:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  return (id)[(_CNAvatarPosterCarouselLikenessFingerprintImpl *)self->_impl description];
}

- (unint64_t)hash
{
  return [(_CNAvatarPosterCarouselLikenessFingerprintImpl *)self->_impl hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = v6;

  if (v7) {
    char v8 = [(_CNAvatarPosterCarouselLikenessFingerprintImpl *)self->_impl isEqual:v7[1]];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (CNAvatarPosterCarouselLikenessFingerprint)initWithPosterUUID:(id)a3
{
  id v4 = a3;
  id v5 = [[_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl alloc] initWithPosterUUID:v4];

  uint64_t v6 = [(CNAvatarPosterCarouselLikenessFingerprint *)self initWithImpl:v5];
  return v6;
}

- (CNAvatarPosterCarouselLikenessFingerprint)initWithAvatarVisualFingerprint:(id)a3 sourceType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [[_CNAvatarPosterCarouselLikenessFingerprintAvatarImpl alloc] initWithVisualFingerprint:v6 sourceType:a4];

  char v8 = [(CNAvatarPosterCarouselLikenessFingerprint *)self initWithImpl:v7];
  return v8;
}

- (CNAvatarPosterCarouselLikenessFingerprint)initWithPosterConfigurationData:(id)a3
{
  id v4 = a3;
  id v5 = +[CNPRUISPosterTitleStyleAttributes attributesFromData:v4 error:0];
  id v6 = [[_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl alloc] initWithPosterConfigurationData:v4 titleStyleAttributes:v5];

  uint64_t v7 = [(CNAvatarPosterCarouselLikenessFingerprint *)self initWithImpl:v6];
  return v7;
}

- (CNAvatarPosterCarouselLikenessFingerprint)initWithImpl:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAvatarPosterCarouselLikenessFingerprint;
  id v6 = [(CNAvatarPosterCarouselLikenessFingerprint *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_impl, a3);
    char v8 = v7;
  }

  return v7;
}

+ (id)archiveWithFingerprint:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28DB0];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initRequiringSecureCoding:1];
  [v5 encodeObject:v4 forKey:@"impl"];

  [v5 finishEncoding];
  id v6 = [v5 encodedData];

  return v6;
}

+ (id)fingerprintFromArchive:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  uint64_t v8 = 0;
  id v5 = (void *)[[v3 alloc] initForReadingFromData:v4 error:&v8];

  [v5 setRequiresSecureCoding:1];
  id v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"impl"];
  [v5 finishDecoding];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fingerprintForPosterConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1BAE0] wallpaperTypeFromConfiguration:v3];
  if ([v4 isEqualToString:*MEMORY[0x1E4F1B878]])
  {
    if (!+[CNMemojiPosterConfigurationReader canReadConfiguration])goto LABEL_13; {
    id v5 = [v3 loadUserInfoWithError:0];
    }
    uint64_t v6 = +[CNMemojiPosterConfigurationReader memojiPosterConfigurationDataFromUserInfo:v5];
  }
  else
  {
    if (![v4 isEqualToString:*MEMORY[0x1E4F1B880]])
    {
      [v4 isEqualToString:*MEMORY[0x1E4F1B888]];
      goto LABEL_13;
    }
    if (!+[CNMonogramPosterConfigurationReader canReadConfiguration])goto LABEL_13; {
    id v5 = [v3 loadUserInfoWithError:0];
    }
    uint64_t v6 = +[CNMonogramPosterConfigurationReader monogramPosterConfigurationDataFromUserInfo:v5];
  }
  uint64_t v7 = (void *)v6;
  if (v6)
  {
    uint64_t v8 = +[CNAvatarPosterCarouselLikenessFingerprint fingerprintForPosterConfiguration:v3 withConfigurationData:v6];

    if (v8)
    {
      v9 = CNUILogPosters();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        __int16 v16 = 0;
        objc_super v10 = "Using visual fingerprint generated from poster configuration data";
        v11 = (uint8_t *)&v16;
LABEL_20:
        _os_log_debug_impl(&dword_18B625000, v9, OS_LOG_TYPE_DEBUG, v10, v11, 2u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
  }
  else
  {
  }
LABEL_13:
  v12 = [v3 serverUUID];
  uint64_t v8 = +[CNAvatarPosterCarouselLikenessFingerprint fingerprintForPosterConfiguration:v3 withUUID:v12];

  if (!v8) {
    goto LABEL_16;
  }
  v9 = CNUILogPosters();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    __int16 v15 = 0;
    objc_super v10 = "Using fingerprint generated from poster UUID";
    v11 = (uint8_t *)&v15;
    goto LABEL_20;
  }
LABEL_15:

LABEL_16:
  id v13 = v8;

  return v13;
}

+ (id)fingerprintForPosterConfiguration:(id)a3 withUUID:(id)a4
{
  id v4 = +[_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl fingerprintForPosterConfiguration:](_CNAvatarPosterCarouselLikenessFingerprintPosterUUIDImpl, "fingerprintForPosterConfiguration:", a3, a4);
  id v5 = [[CNAvatarPosterCarouselLikenessFingerprint alloc] initWithImpl:v4];

  return v5;
}

+ (id)fingerprintForPosterConfiguration:(id)a3 withConfigurationData:(id)a4
{
  id v4 = +[_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl fingerprintForPosterConfiguration:a3 withConfigurationData:a4];
  id v5 = [[CNAvatarPosterCarouselLikenessFingerprint alloc] initWithImpl:v4];

  return v5;
}

@end