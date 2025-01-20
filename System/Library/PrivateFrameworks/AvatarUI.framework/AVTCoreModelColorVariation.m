@interface AVTCoreModelColorVariation
- (AVTColorPreset)colorPreset;
- (AVTCoreModelColor)color;
- (AVTCoreModelColorVariation)initWithColor:(id)a3 colorPreset:(id)a4;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation AVTCoreModelColorVariation

- (AVTCoreModelColorVariation)initWithColor:(id)a3 colorPreset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7 || !v8) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Missing color or colorPreset!"];
  }
  v13.receiver = self;
  v13.super_class = (Class)AVTCoreModelColorVariation;
  v10 = [(AVTCoreModelColorVariation *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_color, a3);
    objc_storeStrong((id *)&v11->_colorPreset, a4);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (AVTCoreModelColorVariation *)a3;
  if (v5 == self)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [(AVTCoreModelColorVariation *)self color];
      if (!v6)
      {
        v3 = [(AVTCoreModelColorVariation *)v5 color];
        if (!v3)
        {
LABEL_7:
          v10 = [(AVTCoreModelColorVariation *)self colorPreset];
          if (v10
            || ([(AVTCoreModelColorVariation *)v5 colorPreset],
                (v3 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v11 = [(AVTCoreModelColorVariation *)self colorPreset];
            v12 = [(AVTCoreModelColorVariation *)v5 colorPreset];
            char v13 = [v11 isEqual:v12];

            if (v10)
            {
LABEL_16:

              goto LABEL_17;
            }
          }
          else
          {
            char v13 = 1;
          }

          goto LABEL_16;
        }
      }
      id v7 = [(AVTCoreModelColorVariation *)self color];
      id v8 = [(AVTCoreModelColorVariation *)v5 color];
      int v9 = [v7 isEqual:v8];

      if (v6)
      {

        if (v9) {
          goto LABEL_7;
        }
      }
      else
      {

        if (v9) {
          goto LABEL_7;
        }
      }
    }
    char v13 = 0;
  }
LABEL_17:

  return v13;
}

- (unint64_t)hash
{
  v3 = [(AVTCoreModelColorVariation *)self color];
  uint64_t v4 = [v3 hash];
  v5 = [(AVTCoreModelColorVariation *)self color];
  *((void *)&v6 + 1) = v4;
  *(void *)&long long v6 = [v5 hash];
  id v7 = NSNumber;
  id v8 = [(AVTCoreModelColorVariation *)self colorPreset];
  [v8 variation];
  int v9 = objc_msgSend(v7, "numberWithFloat:");
  unint64_t v10 = [v9 hash] ^ (v6 >> 32);

  return v10;
}

- (id)description
{
  v14.receiver = self;
  v14.super_class = (Class)AVTCoreModelColorVariation;
  v3 = [(AVTCoreModelColorVariation *)&v14 description];
  uint64_t v4 = (void *)[v3 mutableCopy];

  v5 = [(AVTCoreModelColorVariation *)self colorPreset];
  long long v6 = [v5 name];
  [v4 appendFormat:@" name: %@", v6];

  id v7 = [(AVTCoreModelColorVariation *)self color];
  id v8 = AVTAvatarSettingKindDescription([v7 settingKind]);
  [v4 appendFormat:@" settingKind: %@", v8];

  int v9 = NSNumber;
  unint64_t v10 = [(AVTCoreModelColorVariation *)self colorPreset];
  [v10 variation];
  v11 = objc_msgSend(v9, "numberWithFloat:");
  [v4 appendFormat:@" variation: %@", v11];

  v12 = (void *)[v4 copy];
  return v12;
}

- (AVTColorPreset)colorPreset
{
  return self->_colorPreset;
}

- (AVTCoreModelColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_colorPreset, 0);
}

@end