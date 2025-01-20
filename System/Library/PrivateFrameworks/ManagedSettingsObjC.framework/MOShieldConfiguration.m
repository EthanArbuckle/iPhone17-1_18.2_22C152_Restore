@interface MOShieldConfiguration
+ (BOOL)supportsSecureCoding;
- (MOShieldConfiguration)initWithBackgroundColorData:(id)a3 backgroundEffectData:(id)a4 iconData:(id)a5 title:(id)a6 subtitle:(id)a7 primaryButtonLabel:(id)a8 primaryButtonColorData:(id)a9 secondaryButtonLabel:(id)a10;
- (MOShieldConfiguration)initWithCoder:(id)a3;
- (MOShieldLabel)primaryButtonLabel;
- (MOShieldLabel)secondaryButtonLabel;
- (MOShieldLabel)subtitle;
- (MOShieldLabel)title;
- (NSData)backgroundColorData;
- (NSData)backgroundEffectData;
- (NSData)iconData;
- (NSData)primaryButtonColorData;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOShieldConfiguration

- (MOShieldConfiguration)initWithBackgroundColorData:(id)a3 backgroundEffectData:(id)a4 iconData:(id)a5 title:(id)a6 subtitle:(id)a7 primaryButtonLabel:(id)a8 primaryButtonColorData:(id)a9 secondaryButtonLabel:(id)a10
{
  v16 = (MOShieldLabel *)a6;
  v17 = (MOShieldLabel *)a7;
  v18 = (MOShieldLabel *)a8;
  v40 = (MOShieldLabel *)a10;
  v41.receiver = self;
  v41.super_class = (Class)MOShieldConfiguration;
  id v19 = a9;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = [(MOShieldConfiguration *)&v41 init];
  uint64_t v24 = [v22 copy];

  backgroundColorData = v23->_backgroundColorData;
  v23->_backgroundColorData = (NSData *)v24;

  uint64_t v26 = [v21 copy];
  backgroundEffectData = v23->_backgroundEffectData;
  v23->_backgroundEffectData = (NSData *)v26;

  uint64_t v28 = [v20 copy];
  iconData = v23->_iconData;
  v23->_iconData = (NSData *)v28;

  title = v23->_title;
  v23->_title = v16;
  v31 = v16;

  subtitle = v23->_subtitle;
  v23->_subtitle = v17;
  v33 = v17;

  primaryButtonLabel = v23->_primaryButtonLabel;
  v23->_primaryButtonLabel = v18;
  v35 = v18;

  uint64_t v36 = [v19 copy];
  primaryButtonColorData = v23->_primaryButtonColorData;
  v23->_primaryButtonColorData = (NSData *)v36;

  secondaryButtonLabel = v23->_secondaryButtonLabel;
  v23->_secondaryButtonLabel = v40;

  return v23;
}

- (MOShieldConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BackgroundColorData"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BackgroundEffectData"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IconData"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Title"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Subtitle"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrimaryButtonLabel"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrimaryButtonColorData"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SecondaryButtonLabel"];

  v13 = [(MOShieldConfiguration *)self initWithBackgroundColorData:v5 backgroundEffectData:v6 iconData:v7 title:v8 subtitle:v9 primaryButtonLabel:v10 primaryButtonColorData:v11 secondaryButtonLabel:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  backgroundColorData = self->_backgroundColorData;
  id v5 = a3;
  [v5 encodeObject:backgroundColorData forKey:@"BackgroundColorData"];
  [v5 encodeObject:self->_backgroundEffectData forKey:@"BackgroundEffectData"];
  [v5 encodeObject:self->_iconData forKey:@"IconData"];
  [v5 encodeObject:self->_title forKey:@"Title"];
  [v5 encodeObject:self->_subtitle forKey:@"Subtitle"];
  [v5 encodeObject:self->_primaryButtonLabel forKey:@"PrimaryButtonLabel"];
  [v5 encodeObject:self->_primaryButtonColorData forKey:@"PrimaryButtonColorData"];
  [v5 encodeObject:self->_secondaryButtonLabel forKey:@"SecondaryButtonLabel"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)backgroundColorData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)backgroundEffectData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)iconData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (MOShieldLabel)title
{
  return (MOShieldLabel *)objc_getProperty(self, a2, 32, 1);
}

- (MOShieldLabel)subtitle
{
  return (MOShieldLabel *)objc_getProperty(self, a2, 40, 1);
}

- (MOShieldLabel)primaryButtonLabel
{
  return (MOShieldLabel *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)primaryButtonColorData
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (MOShieldLabel)secondaryButtonLabel
{
  return (MOShieldLabel *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButtonLabel, 0);
  objc_storeStrong((id *)&self->_primaryButtonColorData, 0);
  objc_storeStrong((id *)&self->_primaryButtonLabel, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_backgroundEffectData, 0);
  objc_storeStrong((id *)&self->_backgroundColorData, 0);
}

@end