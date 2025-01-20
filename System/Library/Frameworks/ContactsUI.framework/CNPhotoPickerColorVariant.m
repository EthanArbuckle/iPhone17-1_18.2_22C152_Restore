@interface CNPhotoPickerColorVariant
- (BOOL)isEqual:(id)a3;
- (CNPhotoPickerColorVariant)initWithColor:(id)a3 named:(id)a4;
- (NSString)colorName;
- (UIColor)color;
@end

@implementation CNPhotoPickerColorVariant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorName, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

- (NSString)colorName
{
  return self->_colorName;
}

- (UIColor)color
{
  return self->_color;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;

    v8 = (void *)MEMORY[0x1E4F5A3E0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __37__CNPhotoPickerColorVariant_isEqual___block_invoke;
    v12[3] = &unk_1E549BCB0;
    v12[4] = self;
    id v13 = v7;
    id v9 = v7;
    char v10 = objc_msgSend(v8, "isObject:equalToOther:withBlocks:", self, v9, v12, 0);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

uint64_t __37__CNPhotoPickerColorVariant_isEqual___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) color];
  v3 = [*(id *)(a1 + 40) color];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (CNPhotoPickerColorVariant)initWithColor:(id)a3 named:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNPhotoPickerColorVariant;
  id v9 = [(CNPhotoPickerColorVariant *)&v13 init];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_color, a3);
    objc_storeStrong((id *)&v10->_colorName, a4);
    v11 = v10;
  }

  return v10;
}

@end