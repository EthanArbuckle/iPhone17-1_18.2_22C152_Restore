@interface CNMonogrammer
+ (id)_initialsForContact:(id)a3;
+ (id)descriptorForRequiredKeysIncludingImage:(BOOL)a3;
+ (id)requiredKeyDescriptor;
+ (int64_t)monogramTypeForContact:(id)a3;
- (BOOL)textKnockout;
- (CNMonogrammer)init;
- (CNMonogrammer)initWithStyle:(int64_t)a3 diameter:(double)a4;
- (NSArray)keysToFetch;
- (UIColor)backgroundColor;
- (UIColor)textColor;
- (UIFont)font;
- (UIImage)knockoutMaskMonogram;
- (UIImage)questionMarkMonogram;
- (UIImage)silhouetteMonogram;
- (double)diameter;
- (double)innerBorderWidth;
- (id)_copyMonogramWithImageData:(id)a3;
- (id)_copyMonogramWithInitials:(id)a3;
- (id)_copyMonogramWithKnockoutMask;
- (id)_copyMonogramWithSilhouette;
- (id)_initialsForFirstName:(id)a3 lastName:(id)a4;
- (id)monogramForContact:(id)a3;
- (id)monogramForContact:(id)a3 isContactImage:(BOOL *)a4;
- (id)monogramForContacts:(id)a3;
- (id)monogramForPersonWithFirstName:(id)a3 lastName:(id)a4;
- (id)silhouetteImageName;
- (void)_clearMonogramCache;
- (void)dealloc;
- (void)monogramsAsFlatImages;
- (void)monogramsForStark;
- (void)monogramsWithTint:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setDiameter:(double)a3;
- (void)setFont:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTextKnockout:(BOOL)a3;
@end

@implementation CNMonogrammer

void __57__CNMonogrammer_descriptorForRequiredKeysIncludingImage___block_invoke()
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1B8F8];
  uint64_t v1 = *MEMORY[0x1E4F1ADF0];
  v7[0] = *MEMORY[0x1E4F1AF98];
  v7[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1AFA8];
  v7[2] = *MEMORY[0x1E4F1ADE0];
  v7[3] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  v4 = [NSString stringWithUTF8String:"+[CNMonogrammer descriptorForRequiredKeysIncludingImage:]_block_invoke"];
  uint64_t v5 = [v0 descriptorWithKeyDescriptors:v3 description:v4];
  v6 = (void *)descriptorForRequiredKeysIncludingImage__cn_once_object_1;
  descriptorForRequiredKeysIncludingImage__cn_once_object_1 = v5;
}

+ (id)descriptorForRequiredKeysIncludingImage:(BOOL)a3
{
  if (a3)
  {
    if (descriptorForRequiredKeysIncludingImage__cn_once_token_1 != -1) {
      dispatch_once(&descriptorForRequiredKeysIncludingImage__cn_once_token_1, &__block_literal_global_37087);
    }
    v3 = &descriptorForRequiredKeysIncludingImage__cn_once_object_1;
  }
  else
  {
    if (descriptorForRequiredKeysIncludingImage__cn_once_token_2 != -1) {
      dispatch_once(&descriptorForRequiredKeysIncludingImage__cn_once_token_2, &__block_literal_global_4_37088);
    }
    v3 = &descriptorForRequiredKeysIncludingImage__cn_once_object_2;
  }
  v4 = (void *)*v3;

  return v4;
}

+ (id)_initialsForContact:(id)a3
{
  id v3 = a3;
  if ([v3 contactType])
  {
    v4 = 0;
  }
  else
  {
    uint64_t v5 = [v3 givenName];
    uint64_t v6 = [v3 familyName];
    if (v5 | v6 && _isRomanName((void *)v5) && _isRomanName((void *)v6))
    {
      v7 = NSString;
      uint64_t v8 = [(id)v5 length];
      if (v8)
      {
        objc_msgSend((id)v5, "substringWithRange:", 0, 1);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = &stru_1ED8AC728;
      }
      if ([(id)v6 length])
      {
        v12 = objc_msgSend((id)v6, "substringWithRange:", 0, 1);
        v4 = [v7 stringWithFormat:@"%@%@", v9, v12];
      }
      else
      {
        v4 = [v7 stringWithFormat:@"%@%@", v9, &stru_1ED8AC728];
      }
      if (v8) {
    }
      }
    else
    {
      v4 = 0;
    }
  }
  if (![v4 length])
  {

    v4 = 0;
  }
  v10 = [v4 uppercaseString];

  return v10;
}

- (id)monogramForContact:(id)a3 isContactImage:(BOOL *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(id)objc_opt_class() descriptorForRequiredKeysIncludingImage:0];
  v14[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v6 assertKeysAreAvailable:v8];

  if (a4) {
    *a4 = 0;
  }
  if (self->_diameter == 0.0)
  {
    id v9 = 0;
  }
  else
  {
    if (!v6) {
      goto LABEL_14;
    }
    if ([v6 isKeyAvailable:*MEMORY[0x1E4F1AF98]]
      && ([v6 thumbnailImageData], (v10 = objc_claimAutoreleasedReturnValue()) != 0)
      || [v6 isKeyAvailable:*MEMORY[0x1E4F1AE28]]
      && ([v6 imageData], (v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v11 = [(CNMonogrammer *)self _copyMonogramWithImageData:v10];
      id v9 = v11;
      if (a4) {
        *a4 = v11 != 0;
      }
    }
    else
    {
      v12 = [(id)objc_opt_class() _initialsForContact:v6];
      id v9 = [(CNMonogrammer *)self _copyMonogramWithInitials:v12];

      v10 = 0;
    }

    if (!v9)
    {
LABEL_14:
      id v9 = [(CNMonogrammer *)self silhouetteMonogram];
    }
  }

  return v9;
}

- (id)_copyMonogramWithInitials:(id)a3
{
  v30[2] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  double diameter = self->_diameter;
  double scale = self->_scale;
  id v6 = a3;
  v31.width = diameter;
  v31.height = diameter;
  UIGraphicsBeginImageContextWithOptions(v31, 0, scale);
  v7 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 0.0, 0.0, diameter, diameter);
  [v7 addClip];
  [(UIColor *)self->_backgroundColor set];
  [v7 fill];
  id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v9 = *MEMORY[0x1E4FB06F8];
  v30[0] = self->_font;
  uint64_t v10 = *MEMORY[0x1E4FB0700];
  uint64_t v28 = v9;
  uint64_t v29 = v10;
  tintColor = self->_tintColor;
  if (!tintColor) {
    tintColor = self->_textColor;
  }
  v30[1] = tintColor;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v28 count:2];
  v13 = (void *)[v8 initWithString:v6 attributes:v12];

  [v13 size];
  double v27 = self->_scale;
  UIRectCenteredXInRectScale();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(UIFont *)self->_font capHeight];
  double v21 = (diameter - v20) * -0.5;
  [(UIFont *)self->_font pointSize];
  double v23 = diameter - v22 + v21;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(CurrentContext, (CGBlendMode)(16 * self->_textKnockout));
  objc_msgSend(v13, "drawInRect:", v15, v23, v17, v19);
  v25 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v25;
}

void __57__CNMonogrammer_descriptorForRequiredKeysIncludingImage___block_invoke_2()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1B8F8];
  uint64_t v1 = *MEMORY[0x1E4F1ADE0];
  v6[0] = *MEMORY[0x1E4F1ADF0];
  v6[1] = v1;
  v6[2] = *MEMORY[0x1E4F1AFA8];
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  id v3 = [NSString stringWithUTF8String:"+[CNMonogrammer descriptorForRequiredKeysIncludingImage:]_block_invoke_2"];
  uint64_t v4 = [v0 descriptorWithKeyDescriptors:v2 description:v3];
  uint64_t v5 = (void *)descriptorForRequiredKeysIncludingImage__cn_once_object_2;
  descriptorForRequiredKeysIncludingImage__cn_once_object_2 = v4;
}

- (CNMonogrammer)initWithStyle:(int64_t)a3 diameter:(double)a4
{
  v43.receiver = self;
  v43.super_class = (Class)CNMonogrammer;
  id v6 = [(CNMonogrammer *)&v43 init];
  v7 = v6;
  if (!v6) {
    return v7;
  }
  v6->_double diameter = a4;
  v6->_innerBorderWidth = 1.0;
  tintColor = v6->_tintColor;
  v6->_tintColor = 0;

  v7->_double scale = 0.0;
  if (a4 <= 14.0)
  {
    v13 = (void *)MEMORY[0x1E4FB08E0];
    double v14 = *MEMORY[0x1E4FB09D8];
    double v15 = 7.0;
LABEL_19:
    uint64_t v16 = [v13 systemFontOfSize:v15 weight:v14];
    font = v7->_font;
    v7->_font = (UIFont *)v16;

    silhouetteImageName = v7->_silhouetteImageName;
    v12 = @"silhouette-S";
    goto LABEL_20;
  }
  if (a4 <= 20.0)
  {
    v13 = (void *)MEMORY[0x1E4FB08E0];
    double v14 = *MEMORY[0x1E4FB09D8];
    double v15 = 10.0;
    goto LABEL_19;
  }
  if (a4 <= 32.0)
  {
    v13 = (void *)MEMORY[0x1E4FB08E0];
    double v14 = *MEMORY[0x1E4FB09D8];
    double v15 = 14.0;
    goto LABEL_19;
  }
  if (a4 <= 45.0)
  {
    uint64_t v29 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0 weight:*MEMORY[0x1E4FB09D8]];
    v30 = v7->_font;
    v7->_font = (UIFont *)v29;

    silhouetteImageName = v7->_silhouetteImageName;
    v12 = @"silhouette-M";
    goto LABEL_20;
  }
  if (a4 <= 60.0)
  {
    CGSize v31 = (void *)MEMORY[0x1E4FB08E0];
    double v32 = 24.0;
LABEL_33:
    uint64_t v33 = [v31 systemFontOfSize:v32];
    v34 = v7->_font;
    v7->_font = (UIFont *)v33;

    silhouetteImageName = v7->_silhouetteImageName;
    v12 = @"silhouette-L";
    goto LABEL_20;
  }
  if (a4 <= 76.0)
  {
    CGSize v31 = (void *)MEMORY[0x1E4FB08E0];
    double v32 = 30.0;
    goto LABEL_33;
  }
  if (a4 <= 96.0)
  {
    CGSize v31 = (void *)MEMORY[0x1E4FB08E0];
    double v32 = 38.0;
    goto LABEL_33;
  }
  if (a4 <= 118.0)
  {
    uint64_t v35 = [MEMORY[0x1E4FB08E0] systemFontOfSize:48.0];
LABEL_36:
    v36 = v7->_font;
    v7->_font = (UIFont *)v35;

    silhouetteImageName = v7->_silhouetteImageName;
    v12 = @"silhouette-ATV-M";
    goto LABEL_20;
  }
  if (a4 <= 120.0)
  {
    uint64_t v35 = [MEMORY[0x1E4FB08E0] systemFontOfSize:52.0 weight:*MEMORY[0x1E4FB09E8]];
    goto LABEL_36;
  }
  if (a4 <= 148.0)
  {
    uint64_t v37 = [MEMORY[0x1E4FB08E0] systemFontOfSize:52.0];
    v38 = v7->_font;
    v7->_font = (UIFont *)v37;

    silhouetteImageName = v7->_silhouetteImageName;
    v12 = @"silhouette-ATV-L";
    goto LABEL_20;
  }
  if (a4 <= 178.0)
  {
    uint64_t v39 = [MEMORY[0x1E4FB08E0] systemFontOfSize:76.0];
LABEL_40:
    v40 = v7->_font;
    v7->_font = (UIFont *)v39;

    silhouetteImageName = v7->_silhouetteImageName;
    v12 = @"silhouette-ATV-XL";
    goto LABEL_20;
  }
  if (a4 <= 180.0)
  {
    uint64_t v39 = [MEMORY[0x1E4FB08E0] systemFontOfSize:76.0 weight:*MEMORY[0x1E4FB09E8]];
    goto LABEL_40;
  }
  if (a4 <= 250.0)
  {
    uint64_t v41 = [MEMORY[0x1E4FB08E0] systemFontOfSize:87.0];
    v42 = v7->_font;
    v7->_font = (UIFont *)v41;

    silhouetteImageName = v7->_silhouetteImageName;
    v12 = @"silhouette-ATV-XXL";
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:109.0 weight:*MEMORY[0x1E4FB09E8]];
    uint64_t v10 = v7->_font;
    v7->_font = (UIFont *)v9;

    silhouetteImageName = v7->_silhouetteImageName;
    v12 = @"silhouette-EDU-XL";
  }
LABEL_20:
  v7->_silhouetteImageName = &v12->isa;

  v7->_monogrammerStyle = a3;
  switch(a3)
  {
    case 0:
      uint64_t v18 = +[CNUIColorRepository monogrammerBackgroundWhiteColor];
      backgroundColor = v7->_backgroundColor;
      v7->_backgroundColor = (UIColor *)v18;

      uint64_t v20 = +[CNUIColorRepository monogrammerBackTextWhiteColor];
      goto LABEL_26;
    case 1:
      uint64_t v21 = +[CNUIColorRepository monogrammerBackgroundGrayColor];
      double v22 = v7->_backgroundColor;
      v7->_backgroundColor = (UIColor *)v21;

      uint64_t v23 = +[CNUIColorRepository monogrammerTextGrayColor];
      char v24 = 0;
      textColor = v7->_textColor;
      v7->_textColor = (UIColor *)v23;
      goto LABEL_27;
    case 2:
      uint64_t v26 = +[CNUIColorRepository monogrammerBackgroundLightColor];
      goto LABEL_25;
    case 3:
      uint64_t v26 = +[CNUIColorRepository monogrammerBackgroundDarkColor];
LABEL_25:
      double v27 = v7->_backgroundColor;
      v7->_backgroundColor = (UIColor *)v26;

      uint64_t v20 = [MEMORY[0x1E4FB1618] clearColor];
LABEL_26:
      textColor = v7->_textColor;
      v7->_textColor = (UIColor *)v20;
      char v24 = 1;
LABEL_27:

      v7->_textKnockout = v24;
      break;
    default:
      return v7;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_subMonogrammer, 0);
  objc_storeStrong((id *)&self->_silhouetteImageName, 0);
  objc_storeStrong((id *)&self->_knockoutMaskMonogram, 0);
  objc_storeStrong((id *)&self->_questionMarkMonogram, 0);

  objc_storeStrong((id *)&self->_silhouetteMonogram, 0);
}

- (BOOL)textKnockout
{
  return self->_textKnockout;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (double)diameter
{
  return self->_diameter;
}

- (UIFont)font
{
  return self->_font;
}

- (NSArray)keysToFetch
{
  void v6[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1ADF0];
  v6[0] = *MEMORY[0x1E4F1AF98];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AFA8];
  v6[2] = *MEMORY[0x1E4F1ADE0];
  v6[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];

  return (NSArray *)v4;
}

- (id)_copyMonogramWithKnockoutMask
{
  double diameter = self->_diameter;
  v7.width = diameter;
  v7.height = diameter;
  UIGraphicsBeginImageContextWithOptions(v7, 0, self->_scale);
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 0.0, 0.0, diameter, diameter);
  [v3 addClip];
  uint64_t v4 = +[CNUIColorRepository monogrammerBackgroundFlatDarkColor];
  [v4 set];

  [v3 fill];
  uint64_t v5 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v5;
}

- (id)_copyMonogramWithSilhouette
{
  double diameter = self->_diameter;
  v13.width = diameter;
  v13.height = diameter;
  UIGraphicsBeginImageContextWithOptions(v13, 0, self->_scale);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 0.0, 0.0, diameter, diameter);
  [(UIColor *)self->_backgroundColor set];
  [v5 setLineWidth:self->_innerBorderWidth];
  [v5 addClip];
  [v5 fill];
  id v6 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_imageNamed:", self->_silhouetteImageName);
  CGSize v7 = v6;
  if (self->_tintColor)
  {
    uint64_t v8 = objc_msgSend(v6, "imageWithTintColor:");

    CGSize v7 = (void *)v8;
  }
  if (self->_textKnockout) {
    uint64_t v9 = 23;
  }
  else {
    uint64_t v9 = 0;
  }
  objc_msgSend(v7, "drawInRect:blendMode:alpha:", v9, 0.0, 0.0, diameter, diameter, 1.0);
  uint64_t v10 = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(v10, kCGBlendModeCopy);
  [v5 stroke];
  id v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v11;
}

- (id)_copyMonogramWithImageData:(id)a3
{
  if (!a3) {
    return 0;
  }
  double diameter = self->_diameter;
  double scale = self->_scale;
  id v5 = a3;
  v10.width = diameter;
  v10.height = diameter;
  UIGraphicsBeginImageContextWithOptions(v10, 0, scale);
  id v6 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 0.0, 0.0, diameter, diameter);
  [v6 addClip];
  CGSize v7 = [MEMORY[0x1E4FB1818] imageWithData:v5];

  objc_msgSend(v7, "drawInRect:", 0.0, 0.0, diameter, diameter);
  uint64_t v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v8;
}

- (id)_initialsForFirstName:(id)a3 lastName:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (!(v5 | v6) || !_isRomanName((void *)v5) || !_isRomanName((void *)v6)) {
    goto LABEL_12;
  }
  CGSize v7 = NSString;
  uint64_t v8 = [(id)v5 length];
  if (v8)
  {
    objc_msgSend((id)v5, "substringWithRange:", 0, 1);
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = &stru_1ED8AC728;
  }
  if (![(id)v6 length])
  {
    id v11 = [v7 stringWithFormat:@"%@%@", v9, &stru_1ED8AC728];
    if (!v8) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  CGSize v10 = objc_msgSend((id)v6, "substringWithRange:", 0, 1);
  id v11 = [v7 stringWithFormat:@"%@%@", v9, v10];

  if (v8) {
LABEL_9:
  }

LABEL_10:
  if ([v11 length]) {
    goto LABEL_13;
  }

LABEL_12:
  id v11 = 0;
LABEL_13:
  v12 = [v11 uppercaseString];

  return v12;
}

- (void)_clearMonogramCache
{
  silhouetteMonogram = self->_silhouetteMonogram;
  if (silhouetteMonogram)
  {
    self->_silhouetteMonogram = 0;
  }
  questionMarkMonogram = self->_questionMarkMonogram;
  if (questionMarkMonogram)
  {
    self->_questionMarkMonogram = 0;
  }
  knockoutMaskMonogram = self->_knockoutMaskMonogram;
  if (knockoutMaskMonogram)
  {
    self->_knockoutMaskMonogram = 0;
  }
}

- (UIImage)knockoutMaskMonogram
{
  knockoutMaskMonogram = self->_knockoutMaskMonogram;
  if (!knockoutMaskMonogram)
  {
    uint64_t v4 = [(CNMonogrammer *)self _copyMonogramWithKnockoutMask];
    unint64_t v5 = self->_knockoutMaskMonogram;
    self->_knockoutMaskMonogram = v4;

    knockoutMaskMonogram = self->_knockoutMaskMonogram;
  }

  return knockoutMaskMonogram;
}

- (UIImage)questionMarkMonogram
{
  questionMarkMonogram = self->_questionMarkMonogram;
  if (!questionMarkMonogram)
  {
    uint64_t v4 = [(CNMonogrammer *)self _copyMonogramWithInitials:@"?"];
    unint64_t v5 = self->_questionMarkMonogram;
    self->_questionMarkMonogram = v4;

    questionMarkMonogram = self->_questionMarkMonogram;
  }

  return questionMarkMonogram;
}

- (UIImage)silhouetteMonogram
{
  silhouetteMonogram = self->_silhouetteMonogram;
  if (!silhouetteMonogram)
  {
    uint64_t v4 = [(CNMonogrammer *)self _copyMonogramWithSilhouette];
    unint64_t v5 = self->_silhouetteMonogram;
    self->_silhouetteMonogram = v4;

    silhouetteMonogram = self->_silhouetteMonogram;
  }

  return silhouetteMonogram;
}

- (id)monogramForContacts:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    unint64_t v5 = [v4 firstObject];
    unint64_t v6 = [(CNMonogrammer *)self monogramForContact:v5];
LABEL_3:

    goto LABEL_11;
  }
  if ((unint64_t)[v4 count] >= 2)
  {
    double v7 = (self->_diameter + self->_diameter) / 3.0;
    subMonogrammer = self->_subMonogrammer;
    if (!subMonogrammer)
    {
      uint64_t v9 = [[CNMonogrammer alloc] initWithStyle:self->_monogrammerStyle diameter:v7];
      CGSize v10 = self->_subMonogrammer;
      self->_subMonogrammer = v9;

      subMonogrammer = self->_subMonogrammer;
    }
    id v11 = [v4 objectAtIndexedSubscript:0];
    unint64_t v5 = [(CNMonogrammer *)subMonogrammer monogramForContact:v11];

    v12 = self->_subMonogrammer;
    CGSize v13 = [v4 objectAtIndexedSubscript:1];
    double v14 = [(CNMonogrammer *)v12 monogramForContact:v13];

    if (v5 && v14)
    {
      double diameter = self->_diameter;
      CGFloat v16 = diameter - v7;
      double v17 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", 0.0, 0.0, diameter, diameter);
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", diameter - v7, diameter - v7, v7, v7);
      v26.width = diameter;
      v26.height = diameter;
      UIGraphicsBeginImageContextWithOptions(v26, 0, 0.0);
      double v19 = [MEMORY[0x1E4FB1618] clearColor];
      [v19 set];

      [v17 fill];
      objc_msgSend(v5, "drawInRect:blendMode:alpha:", 0, 0.0, 0.0, v7, v7, 1.0);
      double v20 = round(self->_diameter / 12.0);
      uint64_t v21 = [MEMORY[0x1E4FB1618] clearColor];
      [v21 set];

      double v22 = (void *)MEMORY[0x1E4FB14C0];
      v27.origin.x = v16;
      v27.origin.y = v16;
      v27.size.width = v7;
      v27.size.height = v7;
      CGRect v28 = CGRectInset(v27, v20 * -0.5, v20 * -0.5);
      uint64_t v23 = objc_msgSend(v22, "bezierPathWithOvalInRect:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
      [v23 fillWithBlendMode:17 alpha:1.0];
      [v18 addClip];
      objc_msgSend(v14, "drawInRect:blendMode:alpha:", 17, v16, v16, v7, v7, 1.0);
      unint64_t v6 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
    }
    else
    {

      unint64_t v6 = 0;
    }
    goto LABEL_3;
  }
  unint64_t v6 = 0;
LABEL_11:

  return v6;
}

- (id)monogramForPersonWithFirstName:(id)a3 lastName:(id)a4
{
  unint64_t v5 = [(CNMonogrammer *)self _initialsForFirstName:a3 lastName:a4];
  id v6 = [(CNMonogrammer *)self _copyMonogramWithInitials:v5];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [(CNMonogrammer *)self silhouetteMonogram];
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)monogramForContact:(id)a3
{
  char v5 = 0;
  uint64_t v3 = [(CNMonogrammer *)self monogramForContact:a3 isContactImage:&v5];

  return v3;
}

- (id)silhouetteImageName
{
  return self->_silhouetteImageName;
}

- (double)innerBorderWidth
{
  return self->_innerBorderWidth;
}

- (void)setTextKnockout:(BOOL)a3
{
  if (self->_textKnockout != a3)
  {
    self->_textKnockout = a3;
    [(CNMonogrammer *)self _clearMonogramCache];
  }
}

- (void)setTextColor:(id)a3
{
  char v5 = (UIColor *)a3;
  if (self->_textColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_textColor, a3);
    [(CNMonogrammer *)self _clearMonogramCache];
    char v5 = v6;
  }
}

- (void)setFont:(id)a3
{
  char v5 = (UIFont *)a3;
  if (self->_font != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_font, a3);
    [(CNMonogrammer *)self _clearMonogramCache];
    char v5 = v6;
  }
}

- (void)setBackgroundColor:(id)a3
{
  char v5 = (UIColor *)a3;
  if (self->_backgroundColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    [(CNMonogrammer *)self _clearMonogramCache];
    char v5 = v6;
  }
}

- (void)setDiameter:(double)a3
{
  if (self->_diameter != a3)
  {
    self->_double diameter = a3;
    [(CNMonogrammer *)self _clearMonogramCache];
  }
}

- (void)monogramsForStark
{
  id v4 = [MEMORY[0x1E4FB1BA8] _carScreen];
  [v4 scale];
  self->_double scale = v3;
}

- (void)monogramsWithTint:(id)a3
{
  id v5 = a3;
  if (self->_monogrammerStyle <= 1uLL)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_tintColor, a3);
    id v5 = v6;
  }
}

- (void)monogramsAsFlatImages
{
  if ((self->_monogrammerStyle & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    double v3 = +[CNUIColorRepository monogrammerBackgroundFlatDarkColor];
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v3;

    [(CNMonogrammer *)self _clearMonogramCache];
  }
}

- (void)dealloc
{
  [(CNMonogrammer *)self _clearMonogramCache];
  v3.receiver = self;
  v3.super_class = (Class)CNMonogrammer;
  [(CNMonogrammer *)&v3 dealloc];
}

- (CNMonogrammer)init
{
  v15.receiver = self;
  v15.super_class = (Class)CNMonogrammer;
  uint64_t v2 = [(CNMonogrammer *)&v15 init];
  id v7 = v2;
  if (v2)
  {
    v2->_double diameter = 0.0;
    uint64_t v8 = +[CNUIColorRepository monogrammerBackgroundStandardGrayColor];
    backgroundColor = v7->_backgroundColor;
    v7->_backgroundColor = (UIColor *)v8;

    uint64_t v10 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
    font = v7->_font;
    v7->_font = (UIFont *)v10;

    uint64_t v12 = +[CNUIColorRepository monogrammerTextStandardGrayColor];
    textColor = v7->_textColor;
    v7->_textColor = (UIColor *)v12;

    v7->_textKnockout = 0;
  }
  _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNMonogrammer.m", 91, 4, @"Please switch to initWithStyle:diameter: when creating ABMonogrammer objects", v3, v4, v5, v6, (uint64_t)v15.receiver);
  return v7;
}

+ (id)requiredKeyDescriptor
{
  return 0;
}

+ (int64_t)monogramTypeForContact:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    int v6 = [v4 isKeyAvailable:*MEMORY[0x1E4F1AF98]];
    if (v6)
    {
      id v7 = [v5 thumbnailImageData];
      if (v7)
      {

LABEL_20:
        int64_t v10 = 2;
        goto LABEL_21;
      }
    }
    if ([v5 isKeyAvailable:*MEMORY[0x1E4F1AE28]])
    {
      uint64_t v8 = [v5 imageData];
      if (v8)
      {
        char v9 = 1;
      }
      else if ([v5 isKeyAvailable:*MEMORY[0x1E4F1AE20]])
      {
        char v9 = [v5 imageDataAvailable];
      }
      else
      {
        char v9 = 0;
      }

      if (v6)
      {
LABEL_19:
        if (v9) {
          goto LABEL_20;
        }
LABEL_14:
        id v11 = [a1 _initialsForContact:v5];
        int64_t v10 = v11 != 0;

        goto LABEL_21;
      }
    }
    else if ([v5 isKeyAvailable:*MEMORY[0x1E4F1AE20]])
    {
      char v9 = [v5 imageDataAvailable];
      if (v6) {
        goto LABEL_19;
      }
    }
    else
    {
      char v9 = 0;
      if (v6) {
        goto LABEL_19;
      }
    }
    if (v9) {
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  int64_t v10 = 0;
LABEL_21:

  return v10;
}

@end