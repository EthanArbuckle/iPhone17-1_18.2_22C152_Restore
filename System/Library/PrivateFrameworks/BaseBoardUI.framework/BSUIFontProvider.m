@interface BSUIFontProvider
+ (id)defaultFontProvider;
+ (id)preferredFontProvider;
- (id)preferredFontForTextStyle:(id)a3 hiFontStyle:(int64_t)a4;
- (id)preferredFontForTextStyle:(id)a3 hiFontStyle:(int64_t)a4 contentSizeCategory:(id)a5;
@end

@implementation BSUIFontProvider

- (id)preferredFontForTextStyle:(id)a3 hiFontStyle:(int64_t)a4
{
  id v6 = a3;
  if (self->_isDefault) {
    objc_msgSend(MEMORY[0x1E4F42A30], "bsui_defaultFontForTextStyle:hiFontStyle:", v6, a4);
  }
  else {
  v7 = objc_msgSend(MEMORY[0x1E4F42A30], "bsui_preferredFontForTextStyle:hiFontStyle:", v6, a4);
  }

  return v7;
}

+ (id)defaultFontProvider
{
  v2 = objc_alloc((Class)a1);
  if (v2)
  {
    v4.receiver = v2;
    v4.super_class = (Class)BSUIFontProvider;
    v2 = objc_msgSendSuper2(&v4, sel_init);
    if (v2) {
      v2[8] = 1;
    }
  }

  return v2;
}

+ (id)preferredFontProvider
{
  v2 = objc_alloc((Class)a1);
  if (v2)
  {
    v4.receiver = v2;
    v4.super_class = (Class)BSUIFontProvider;
    v2 = objc_msgSendSuper2(&v4, sel_init);
    if (v2) {
      v2[8] = 0;
    }
  }

  return v2;
}

- (id)preferredFontForTextStyle:(id)a3 hiFontStyle:(int64_t)a4 contentSizeCategory:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self->_isDefault) {
    objc_msgSend(MEMORY[0x1E4F42A30], "bsui_defaultFontForTextStyle:hiFontStyle:", v8, a4);
  }
  else {
  v10 = objc_msgSend(MEMORY[0x1E4F42A30], "bsui_preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v8, a4, v9);
  }

  return v10;
}

@end