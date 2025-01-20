@interface CNPhotoPickerDefaultEmoji
- (CNPhotoPickerColorVariant)colorVariant;
- (CNPhotoPickerDefaultEmoji)initWithEmojiString:(id)a3 colorVariant:(id)a4;
- (NSString)emojiString;
- (void)setColorVariant:(id)a3;
- (void)setEmojiString:(id)a3;
@end

@implementation CNPhotoPickerDefaultEmoji

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorVariant, 0);

  objc_storeStrong((id *)&self->_emojiString, 0);
}

- (void)setColorVariant:(id)a3
{
}

- (CNPhotoPickerColorVariant)colorVariant
{
  return self->_colorVariant;
}

- (void)setEmojiString:(id)a3
{
}

- (NSString)emojiString
{
  return self->_emojiString;
}

- (CNPhotoPickerDefaultEmoji)initWithEmojiString:(id)a3 colorVariant:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNPhotoPickerDefaultEmoji;
  v9 = [(CNPhotoPickerDefaultEmoji *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_emojiString, a3);
    objc_storeStrong((id *)&v10->_colorVariant, a4);
    v11 = v10;
  }

  return v10;
}

@end