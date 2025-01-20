@interface MPArtworkColorAnalysis
+ (BOOL)supportsSecureCoding;
+ (id)translateFromMSVColorAnalysis:(id)a3;
- (BOOL)isBackgroundColorLight;
- (BOOL)isPrimaryTextColorLight;
- (BOOL)isSecondaryTextColorLight;
- (BOOL)isTertiaryTextColorLight;
- (MPArtworkColorAnalysis)initWithCoder:(id)a3;
- (UIColor)backgroundColor;
- (UIColor)primaryTextColor;
- (UIColor)secondaryTextColor;
- (UIColor)tertiaryTextColor;
- (id)_copyWithClass:(Class)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)translateToMSVColorAnalysis;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setPrimaryTextColor:(id)a3;
- (void)setSecondaryTextColor:(id)a3;
- (void)setTertiaryTextColor:(id)a3;
@end

@implementation MPArtworkColorAnalysis

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (BOOL)isTertiaryTextColorLight
{
  return self->_tertiaryTextColorLight;
}

- (void)setTertiaryTextColor:(id)a3
{
}

- (UIColor)tertiaryTextColor
{
  return self->_tertiaryTextColor;
}

- (BOOL)isSecondaryTextColorLight
{
  return self->_secondaryTextColorLight;
}

- (void)setSecondaryTextColor:(id)a3
{
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (BOOL)isPrimaryTextColorLight
{
  return self->_primaryTextColorLight;
}

- (void)setPrimaryTextColor:(id)a3
{
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (BOOL)isBackgroundColorLight
{
  return self->_backgroundColorLight;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (id)_copyWithClass:(Class)a3
{
  v4 = (id *)objc_alloc_init(a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_backgroundColor);
    *((unsigned char *)v5 + 16) = self->_backgroundColorLight;
    objc_storeStrong(v5 + 3, self->_primaryTextColor);
    *((unsigned char *)v5 + 32) = self->_primaryTextColorLight;
    objc_storeStrong(v5 + 5, self->_secondaryTextColor);
    *((unsigned char *)v5 + 48) = self->_secondaryTextColorLight;
    objc_storeStrong(v5 + 7, self->_tertiaryTextColor);
    *((unsigned char *)v5 + 64) = self->_tertiaryTextColorLight;
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();

  return [(MPArtworkColorAnalysis *)self _copyWithClass:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(MPArtworkColorAnalysis *)self backgroundColor];
  [v8 encodeObject:v4 forKey:@"backgroundColor"];

  objc_msgSend(v8, "encodeBool:forKey:", -[MPArtworkColorAnalysis isBackgroundColorLight](self, "isBackgroundColorLight"), @"backgroundColorLight");
  v5 = [(MPArtworkColorAnalysis *)self primaryTextColor];
  [v8 encodeObject:v5 forKey:@"primaryTextColor"];

  objc_msgSend(v8, "encodeBool:forKey:", -[MPArtworkColorAnalysis isPrimaryTextColorLight](self, "isPrimaryTextColorLight"), @"primaryTextColorLight");
  v6 = [(MPArtworkColorAnalysis *)self secondaryTextColor];
  [v8 encodeObject:v6 forKey:@"secondaryTextColor"];

  objc_msgSend(v8, "encodeBool:forKey:", -[MPArtworkColorAnalysis isSecondaryTextColorLight](self, "isSecondaryTextColorLight"), @"secondaryTextColorLight");
  v7 = [(MPArtworkColorAnalysis *)self tertiaryTextColor];
  [v8 encodeObject:v7 forKey:@"tertiaryTextColor"];

  objc_msgSend(v8, "encodeBool:forKey:", -[MPArtworkColorAnalysis isTertiaryTextColorLight](self, "isTertiaryTextColorLight"), @"tertiaryTextColorLight");
}

- (MPArtworkColorAnalysis)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MPArtworkColorAnalysis *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColor"];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v6;

    v5->_backgroundColorLight = [v4 decodeBoolForKey:@"backgroundColorLight"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryTextColor"];
    primaryTextColor = v5->_primaryTextColor;
    v5->_primaryTextColor = (UIColor *)v8;

    v5->_primaryTextColorLight = [v4 decodeBoolForKey:@"primaryTextColorLight"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryTextColor"];
    secondaryTextColor = v5->_secondaryTextColor;
    v5->_secondaryTextColor = (UIColor *)v10;

    v5->_secondaryTextColorLight = [v4 decodeBoolForKey:@"secondaryTextColorLight"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tertiaryTextColor"];
    tertiaryTextColor = v5->_tertiaryTextColor;
    v5->_tertiaryTextColor = (UIColor *)v12;

    v5->_tertiaryTextColorLight = [v4 decodeBoolForKey:@"tertiaryTextColorLight"];
  }

  return v5;
}

- (id)description
{
  v15 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v3);
  id v4 = [(MPArtworkColorAnalysis *)self backgroundColor];
  if ([(MPArtworkColorAnalysis *)self isBackgroundColorLight]) {
    v5 = @"Light";
  }
  else {
    v5 = @"Dark";
  }
  uint64_t v6 = [(MPArtworkColorAnalysis *)self primaryTextColor];
  if ([(MPArtworkColorAnalysis *)self isPrimaryTextColorLight]) {
    v7 = @"Light";
  }
  else {
    v7 = @"Dark";
  }
  uint64_t v8 = [(MPArtworkColorAnalysis *)self secondaryTextColor];
  if ([(MPArtworkColorAnalysis *)self isSecondaryTextColorLight]) {
    v9 = @"Light";
  }
  else {
    v9 = @"Dark";
  }
  uint64_t v10 = [(MPArtworkColorAnalysis *)self tertiaryTextColor];
  if ([(MPArtworkColorAnalysis *)self isTertiaryTextColorLight]) {
    v11 = @"Light";
  }
  else {
    v11 = @"Dark";
  }
  uint64_t v12 = [v15 stringWithFormat:@"<%@: %p> (\n  backgroundColor: %@ (%@)\n  primaryTextColor: %@ (%@)\n  secondaryTextColor: %@ (%@)\n  tertiaryTextColor: %@ (%@)\n)", v14, self, v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (id)translateToMSVColorAnalysis
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F779B0]);
  id v4 = NSString;
  v5 = [(MPArtworkColorAnalysis *)self backgroundColor];
  uint64_t v6 = objc_msgSend(v4, "MP_hexStringFromColor:", v5);
  [v3 setBackgroundColorHex:v6];

  objc_msgSend(v3, "setBackgroundColorLight:", -[MPArtworkColorAnalysis isBackgroundColorLight](self, "isBackgroundColorLight"));
  v7 = NSString;
  uint64_t v8 = [(MPArtworkColorAnalysis *)self primaryTextColor];
  v9 = objc_msgSend(v7, "MP_hexStringFromColor:", v8);
  [v3 setPrimaryTextColorHex:v9];

  objc_msgSend(v3, "setPrimaryTextColorLight:", -[MPArtworkColorAnalysis isPrimaryTextColorLight](self, "isPrimaryTextColorLight"));
  uint64_t v10 = NSString;
  v11 = [(MPArtworkColorAnalysis *)self secondaryTextColor];
  uint64_t v12 = objc_msgSend(v10, "MP_hexStringFromColor:", v11);
  [v3 setSecondaryTextColorHex:v12];

  objc_msgSend(v3, "setSecondaryTextColorLight:", -[MPArtworkColorAnalysis isSecondaryTextColorLight](self, "isSecondaryTextColorLight"));
  v13 = NSString;
  v14 = [(MPArtworkColorAnalysis *)self tertiaryTextColor];
  v15 = objc_msgSend(v13, "MP_hexStringFromColor:", v14);
  [v3 setTertiaryTextColorHex:v15];

  objc_msgSend(v3, "setTertiaryTextColorLight:", -[MPArtworkColorAnalysis isTertiaryTextColorLight](self, "isTertiaryTextColorLight"));

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)translateFromMSVColorAnalysis:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MPMutableArtworkColorAnalysis);
  v5 = [v3 backgroundColorHex];
  uint64_t v6 = objc_msgSend(v5, "MP_colorFromHexString");
  [(MPMutableArtworkColorAnalysis *)v4 setBackgroundColor:v6];

  -[MPMutableArtworkColorAnalysis setBackgroundColorLight:](v4, "setBackgroundColorLight:", [v3 isBackgroundColorLight]);
  v7 = [v3 primaryTextColorHex];
  uint64_t v8 = objc_msgSend(v7, "MP_colorFromHexString");
  [(MPMutableArtworkColorAnalysis *)v4 setPrimaryTextColor:v8];

  -[MPMutableArtworkColorAnalysis setPrimaryTextColorLight:](v4, "setPrimaryTextColorLight:", [v3 isPrimaryTextColorLight]);
  v9 = [v3 secondaryTextColorHex];
  uint64_t v10 = objc_msgSend(v9, "MP_colorFromHexString");
  [(MPMutableArtworkColorAnalysis *)v4 setSecondaryTextColor:v10];

  -[MPMutableArtworkColorAnalysis setSecondaryTextColorLight:](v4, "setSecondaryTextColorLight:", [v3 isSecondaryTextColorLight]);
  v11 = [v3 tertiaryTextColorHex];
  uint64_t v12 = objc_msgSend(v11, "MP_colorFromHexString");
  [(MPMutableArtworkColorAnalysis *)v4 setTertiaryTextColor:v12];

  uint64_t v13 = [v3 isTertiaryTextColorLight];
  [(MPMutableArtworkColorAnalysis *)v4 setTertiaryTextColorLight:v13];

  return v4;
}

@end