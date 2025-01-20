@interface CNMeCardSharingPickerLayoutAttributes
+ (id)buddyHeaderFont;
+ (id)layoutAttributesForBuddy;
+ (id)layoutAttributesForSettings;
+ (id)settingsHeaderFont;
- (CGSize)avatarViewSize;
- (CNMeCardSharingPickerLayoutAttributes)initWithTopToAvatarPadding:(double)a3 headerFont:(id)a4 avatarViewSize:(CGSize)a5 avatarViewToNamePadding:(double)a6 backgroundColor:(id)a7;
- (UIColor)backgroundColor;
- (UIFont)headerFont;
- (double)avatarViewToNamePadding;
- (double)topToAvatarPadding;
@end

@implementation CNMeCardSharingPickerLayoutAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);

  objc_storeStrong((id *)&self->_headerFont, 0);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (double)avatarViewToNamePadding
{
  return self->_avatarViewToNamePadding;
}

- (CGSize)avatarViewSize
{
  double width = self->_avatarViewSize.width;
  double height = self->_avatarViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIFont)headerFont
{
  return self->_headerFont;
}

- (double)topToAvatarPadding
{
  return self->_topToAvatarPadding;
}

- (CNMeCardSharingPickerLayoutAttributes)initWithTopToAvatarPadding:(double)a3 headerFont:(id)a4 avatarViewSize:(CGSize)a5 avatarViewToNamePadding:(double)a6 backgroundColor:(id)a7
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v14 = a4;
  id v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CNMeCardSharingPickerLayoutAttributes;
  v16 = [(CNMeCardSharingPickerLayoutAttributes *)&v20 init];
  v17 = v16;
  if (v16)
  {
    v16->_topToAvatarPadding = a3;
    objc_storeStrong((id *)&v16->_headerFont, a4);
    v17->_avatarViewSize.CGFloat width = width;
    v17->_avatarViewSize.CGFloat height = height;
    v17->_avatarViewToNamePadding = a6;
    objc_storeStrong((id *)&v17->_backgroundColor, a7);
    v18 = v17;
  }

  return v17;
}

+ (id)layoutAttributesForSettings
{
  v3 = [a1 settingsHeaderFont];
  v4 = objc_msgSend(objc_alloc((Class)a1), "initWithTopToAvatarPadding:headerFont:avatarViewSize:avatarViewToNamePadding:backgroundColor:", v3, 0, 10.0, 80.0, 80.0, 5.0);

  return v4;
}

+ (id)layoutAttributesForBuddy
{
  v3 = [a1 buddyHeaderFont];
  v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithTopToAvatarPadding:headerFont:avatarViewSize:avatarViewToNamePadding:backgroundColor:", v3, v4, 20.0, 100.0, 100.0, 20.0);

  return v5;
}

+ (id)settingsHeaderFont
{
  id v2 = (id)*MEMORY[0x1E4FB2980];
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  double v5 = v4;

  if (v5 <= 320.0)
  {
    id v6 = (id)*MEMORY[0x1E4FB2988];

    id v2 = v6;
  }
  v7 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v2];
  v8 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v7 size:0.0];

  return v8;
}

+ (id)buddyHeaderFont
{
  id v2 = (id)*MEMORY[0x1E4FB2928];
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  double v5 = v4;

  if (v5 <= 320.0)
  {
    id v6 = (id)*MEMORY[0x1E4FB2988];

    id v2 = v6;
  }
  v7 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v2];
  v8 = (void *)MEMORY[0x1E4FB08E0];
  v9 = [v7 fontDescriptorWithSymbolicTraits:2];
  v10 = [v8 fontWithDescriptor:v9 size:0.0];

  return v10;
}

@end