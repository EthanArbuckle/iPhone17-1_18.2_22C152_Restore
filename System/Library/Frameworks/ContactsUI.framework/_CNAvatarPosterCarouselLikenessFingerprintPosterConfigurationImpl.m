@interface _CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl
+ (BOOL)supportsSecureCoding;
+ (id)fingerprintForPosterConfiguration:(id)a3 withConfigurationData:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSData)posterConfigurationData;
- (NSString)description;
- (UIColor)titleColor;
- (UIFont)titleFont;
- (_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl)initWithCoder:(id)a3;
- (_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl)initWithPosterConfigurationData:(id)a3 titleColor:(id)a4 titleFont:(id)a5 preferredTitleLayout:(unint64_t)a6 preferredTitleAlignment:(unint64_t)a7;
- (_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl)initWithPosterConfigurationData:(id)a3 titleStyleAttributes:(id)a4;
- (unint64_t)hash;
- (unint64_t)preferredTitleAlignment;
- (unint64_t)preferredTitleLayout;
- (void)encodeWithCoder:(id)a3;
- (void)setPosterConfigurationData:(id)a3;
- (void)setPreferredTitleAlignment:(unint64_t)a3;
- (void)setPreferredTitleLayout:(unint64_t)a3;
- (void)setTitleColor:(id)a3;
- (void)setTitleFont:(id)a3;
@end

@implementation _CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);

  objc_storeStrong((id *)&self->_posterConfigurationData, 0);
}

- (void)setPreferredTitleLayout:(unint64_t)a3
{
  self->_preferredTitleLayout = a3;
}

- (unint64_t)preferredTitleLayout
{
  return self->_preferredTitleLayout;
}

- (void)setPreferredTitleAlignment:(unint64_t)a3
{
  self->_preferredTitleAlignment = a3;
}

- (unint64_t)preferredTitleAlignment
{
  return self->_preferredTitleAlignment;
}

- (void)setTitleFont:(id)a3
{
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleColor:(id)a3
{
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setPosterConfigurationData:(id)a3
{
}

- (NSData)posterConfigurationData
{
  return self->_posterConfigurationData;
}

- (_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"posterConfigurationData"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleFont"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleColor"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"preferredTitleLayout"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"preferredTitleAlignment"];

  v10 = [(_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl *)self initWithPosterConfigurationData:v5 titleColor:v7 titleFont:v6 preferredTitleLayout:v8 preferredTitleAlignment:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  posterConfigurationData = self->_posterConfigurationData;
  id v5 = a3;
  [v5 encodeObject:posterConfigurationData forKey:@"posterConfigurationData"];
  [v5 encodeObject:self->_titleFont forKey:@"titleFont"];
  [v5 encodeObject:self->_titleColor forKey:@"titleColor"];
  [v5 encodeInteger:self->_preferredTitleLayout forKey:@"preferredTitleLayout"];
  [v5 encodeInteger:self->_preferredTitleAlignment forKey:@"preferredTitleAlignment"];
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F5A418] objectHash:self->_posterConfigurationData];
  uint64_t v4 = [MEMORY[0x1E4F5A418] objectHash:self->_titleFont] - v3 + 32 * v3;
  uint64_t v5 = [MEMORY[0x1E4F5A418] objectHash:self->_titleColor];
  unint64_t v6 = self->_preferredTitleLayout - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  return self->_preferredTitleAlignment - v6 + 32 * v6 + 486695567;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl *)a3;
  if (self == v4) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  unint64_t preferredTitleLayout = self->_preferredTitleLayout;
  if (preferredTitleLayout != [(_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl *)v4 preferredTitleLayout])goto LABEL_12; {
  unint64_t preferredTitleAlignment = self->_preferredTitleAlignment;
  }
  if (preferredTitleAlignment != [(_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl *)v4 preferredTitleAlignment])goto LABEL_12; {
  titleFont = self->_titleFont;
  }
  unint64_t v8 = (unint64_t)[(_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl *)v4 titleFont];
  if ((unint64_t)titleFont | v8)
  {
    if (![(UIFont *)titleFont isEqual:v8]) {
      goto LABEL_12;
    }
  }
  if (((titleColor = self->_titleColor,
         unint64_t v10 = (unint64_t)[(_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl *)v4 titleColor], !((unint64_t)titleColor | v10))|| [(UIColor *)titleColor isEqual:v10])&& ((posterConfigurationData = self->_posterConfigurationData, v12 = (unint64_t)[(_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl *)v4 posterConfigurationData], !((unint64_t)posterConfigurationData | v12))|| [(NSData *)posterConfigurationData isEqual:v12]))
  {
LABEL_11:
    BOOL v13 = 1;
  }
  else
  {
LABEL_12:
    BOOL v13 = 0;
  }

  return v13;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"posterConfigurationData" object:self->_posterConfigurationData];
  id v5 = (id)[v3 appendName:@"titleFont" object:self->_titleFont];
  id v6 = (id)[v3 appendName:@"titleColor" object:self->_titleColor];
  id v7 = (id)[v3 appendName:@"preferredTitleLayout" unsignedInteger:self->_preferredTitleLayout];
  id v8 = (id)[v3 appendName:@"preferredTitleAlignment" unsignedInteger:self->_preferredTitleAlignment];
  uint64_t v9 = [v3 build];

  return (NSString *)v9;
}

- (_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl)initWithPosterConfigurationData:(id)a3 titleColor:(id)a4 titleFont:(id)a5 preferredTitleLayout:(unint64_t)a6 preferredTitleAlignment:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl;
  v16 = [(_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl *)&v20 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_posterConfigurationData, a3);
    objc_storeStrong((id *)&v17->_titleColor, a4);
    objc_storeStrong((id *)&v17->_titleFont, a5);
    v17->_unint64_t preferredTitleAlignment = a7;
    v17->_unint64_t preferredTitleLayout = a6;
    v18 = v17;
  }

  return v17;
}

- (_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl)initWithPosterConfigurationData:(id)a3 titleStyleAttributes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 titleColor];
  uint64_t v9 = [v6 titleFont];
  uint64_t v10 = [v6 preferredTitleLayout];
  uint64_t v11 = [v6 preferredTitleAlignment];

  unint64_t v12 = [(_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl *)self initWithPosterConfigurationData:v7 titleColor:v8 titleFont:v9 preferredTitleLayout:v10 preferredTitleAlignment:v11];
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fingerprintForPosterConfiguration:(id)a3 withConfigurationData:(id)a4
{
  id v5 = a4;
  id v6 = +[CNPRUISPosterTitleStyleAttributes attributesForCNConfiguration:a3];
  id v7 = [[_CNAvatarPosterCarouselLikenessFingerprintPosterConfigurationImpl alloc] initWithPosterConfigurationData:v5 titleStyleAttributes:v6];

  return v7;
}

@end