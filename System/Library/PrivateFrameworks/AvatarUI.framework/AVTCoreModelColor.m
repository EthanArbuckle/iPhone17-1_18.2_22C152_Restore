@interface AVTCoreModelColor
- ($0AC6E346AE4835514AAA8AC86D8F4844)settingKind;
- (AVTColorPreset)baseColorPreset;
- (AVTCoreModelColor)initWithColorPreset:(id)a3 settingKind:(id)a4 order:(unint64_t)a5 derivedColorsByCategories:(id)a6;
- (AVTCoreModelColor)initWithColorPreset:(id)a3 settingKind:(id)a4 order:(unint64_t)a5 showSlider:(BOOL)a6 rangeMin:(float)a7 rangeMax:(float)a8 derivedColorsByCategories:(id)a9;
- (BOOL)canShowSlider;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresEncryption;
- (NSDictionary)derivedColorsByCategories;
- (NSString)description;
- (NSString)identifier;
- (NSString)localizedName;
- (float)rangeMax;
- (float)rangeMin;
- (id)copyForCategory:(int64_t)a3 destination:(int64_t)a4;
- (id)copyForPairedCategory:(int64_t)a3;
- (id)copyWithRangeMin:(float)a3 rangeMax:(float)a4 showSlider:(BOOL)a5;
- (id)thumbnail;
- (id)volatileIdentifierForScope:(id)a3;
- (unint64_t)costForScope:(id)a3;
- (unint64_t)hash;
- (unint64_t)order;
@end

@implementation AVTCoreModelColor

- (AVTCoreModelColor)initWithColorPreset:(id)a3 settingKind:(id)a4 order:(unint64_t)a5 derivedColorsByCategories:(id)a6
{
  LODWORD(v6) = -1.0;
  LODWORD(v7) = 1.0;
  return -[AVTCoreModelColor initWithColorPreset:settingKind:order:showSlider:rangeMin:rangeMax:derivedColorsByCategories:](self, "initWithColorPreset:settingKind:order:showSlider:rangeMin:rangeMax:derivedColorsByCategories:", a3, a4.var0, a4.var1, a5, 0, a6, v6, v7);
}

- (AVTCoreModelColor)initWithColorPreset:(id)a3 settingKind:(id)a4 order:(unint64_t)a5 showSlider:(BOOL)a6 rangeMin:(float)a7 rangeMax:(float)a8 derivedColorsByCategories:(id)a9
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v18 = a3;
  id v19 = a9;
  v25.receiver = self;
  v25.super_class = (Class)AVTCoreModelColor;
  v20 = [(AVTCoreModelColor *)&v25 init];
  v21 = v20;
  if (v20)
  {
    v20->_settingKind.destination = var0;
    v20->_settingKind.category = var1;
    objc_storeStrong((id *)&v20->_baseColorPreset, a3);
    v21->_order = a5;
    v21->_showSlider = a6;
    v21->_rangeMin = a7;
    v21->_rangeMax = a8;
    uint64_t v22 = [v19 copy];
    derivedColorsByCategories = v21->_derivedColorsByCategories;
    v21->_derivedColorsByCategories = (NSDictionary *)v22;
  }
  return v21;
}

- (id)copyWithRangeMin:(float)a3 rangeMax:(float)a4 showSlider:(BOOL)a5
{
  BOOL v5 = a5;
  v9 = [AVTCoreModelColor alloc];
  baseColorPreset = self->_baseColorPreset;
  unint64_t order = self->_order;
  derivedColorsByCategories = self->_derivedColorsByCategories;
  int64_t destination = self->_settingKind.destination;
  int64_t category = self->_settingKind.category;
  *(float *)&double v15 = a3;
  *(float *)&double v16 = a4;
  return -[AVTCoreModelColor initWithColorPreset:settingKind:order:showSlider:rangeMin:rangeMax:derivedColorsByCategories:](v9, "initWithColorPreset:settingKind:order:showSlider:rangeMin:rangeMax:derivedColorsByCategories:", baseColorPreset, destination, category, order, v5, derivedColorsByCategories, v15, v16);
}

- (id)copyForPairedCategory:(int64_t)a3
{
  uint64_t v5 = [(AVTCoreModelColor *)self settingKind];
  return [(AVTCoreModelColor *)self copyForCategory:a3 destination:v5];
}

- (id)copyForCategory:(int64_t)a3 destination:(int64_t)a4
{
  uint64_t v6 = AVTAvatarSettingColorIndexForColorDestination(a4);
  double v7 = (void *)MEMORY[0x263F29678];
  v8 = [(AVTCoreModelColor *)self baseColorPreset];
  v9 = [v8 name];
  v10 = [(AVTCoreModelColor *)self baseColorPreset];
  [v10 variation];
  v11 = objc_msgSend(v7, "colorPresetWithName:category:colorIndex:variation:", v9, a3, v6);

  v12 = [AVTCoreModelColor alloc];
  uint64_t v13 = AVTColorSettingKind(a3, v6);
  uint64_t v15 = v14;
  unint64_t v16 = [(AVTCoreModelColor *)self order];
  v17 = [(AVTCoreModelColor *)self derivedColorsByCategories];
  id v18 = -[AVTCoreModelColor initWithColorPreset:settingKind:order:derivedColorsByCategories:](v12, "initWithColorPreset:settingKind:order:derivedColorsByCategories:", v11, v13, v15, v16, v17);

  return v18;
}

- (NSString)localizedName
{
  v2 = [(AVTCoreModelColor *)self baseColorPreset];
  v3 = [v2 localizedName];
  v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (NSString)identifier
{
  v2 = [(AVTCoreModelColor *)self baseColorPreset];
  v3 = [v2 name];
  v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)AVTCoreModelColor;
  v3 = [(AVTCoreModelColor *)&v9 description];
  v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "appendFormat:", @" %lu", -[AVTCoreModelColor order](self, "order"));
  uint64_t v5 = [(AVTCoreModelColor *)self identifier];
  [v4 appendFormat:@" identifier: %@", v5];

  uint64_t v6 = AVTAvatarSettingKindDescription([(AVTCoreModelColor *)self settingKind]);
  [v4 appendFormat:@" setting: %@", v6];

  double v7 = (void *)[v4 copy];
  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (AVTCoreModelColor *)a3;
  if (v5 != self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [(AVTCoreModelColor *)self identifier];
      if (v6
        || ([(AVTCoreModelColor *)v5 identifier], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        double v7 = [(AVTCoreModelColor *)self identifier];
        v8 = [(AVTCoreModelColor *)v5 identifier];
        int v9 = [v7 isEqual:v8];

        if (v6)
        {

          if (!v9) {
            goto LABEL_15;
          }
        }
        else
        {

          if ((v9 & 1) == 0) {
            goto LABEL_15;
          }
        }
      }
      uint64_t v11 = [(AVTCoreModelColor *)self settingKind];
      uint64_t v13 = v12;
      uint64_t v14 = [(AVTCoreModelColor *)v5 settingKind];
      if (AVTAvatarSettingKindEqual(v11, (uint64_t)v13, v14, v15))
      {
        unint64_t v16 = [(AVTCoreModelColor *)self derivedColorsByCategories];
        if (v16
          || ([(AVTCoreModelColor *)v5 derivedColorsByCategories],
              (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v17 = [(AVTCoreModelColor *)self derivedColorsByCategories];
          id v18 = [(AVTCoreModelColor *)v5 derivedColorsByCategories];
          char v10 = [v17 isEqual:v18];

          if (v16)
          {
LABEL_19:

            goto LABEL_16;
          }
        }
        else
        {
          char v10 = 1;
        }

        goto LABEL_19;
      }
    }
LABEL_15:
    char v10 = 0;
    goto LABEL_16;
  }
  char v10 = 1;
LABEL_16:

  return v10;
}

- (unint64_t)hash
{
  v3 = [(AVTCoreModelColor *)self identifier];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(AVTCoreModelColor *)self identifier];
  *((void *)&v6 + 1) = v4;
  *(void *)&long long v6 = [v5 hash];
  uint64_t v7 = [(AVTCoreModelColor *)self settingKind];
  unint64_t v9 = AVTAvatarSettingKindHash(v7, v8) ^ (v6 >> 32);

  return v9;
}

- (AVTColorPreset)baseColorPreset
{
  return self->_baseColorPreset;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)settingKind
{
  int64_t category = self->_settingKind.category;
  int64_t destination = self->_settingKind.destination;
  result.int64_t var1 = category;
  result.int64_t var0 = destination;
  return result;
}

- (unint64_t)order
{
  return self->_order;
}

- (BOOL)canShowSlider
{
  return self->_showSlider;
}

- (float)rangeMin
{
  return self->_rangeMin;
}

- (float)rangeMax
{
  return self->_rangeMax;
}

- (NSDictionary)derivedColorsByCategories
{
  return self->_derivedColorsByCategories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivedColorsByCategories, 0);
  objc_storeStrong((id *)&self->_baseColorPreset, 0);
}

- (id)volatileIdentifierForScope:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F089D8], "string", a3);
  unint64_t v5 = [(AVTCoreModelColor *)self settingKind];
  uint64_t v7 = AVTAvatarSettingKindIdentifier(v5, v6);
  uint64_t v8 = [(AVTCoreModelColor *)self identifier];
  [v4 appendFormat:@"color_%@_%@", v7, v8];

  unint64_t v9 = (void *)[v4 copy];
  return v9;
}

- (unint64_t)costForScope:(id)a3
{
  return 1600;
}

- (BOOL)requiresEncryption
{
  return 0;
}

- (id)thumbnail
{
  v2 = [(AVTCoreModelColor *)self baseColorPreset];
  v3 = [v2 thumbnail];

  return v3;
}

@end