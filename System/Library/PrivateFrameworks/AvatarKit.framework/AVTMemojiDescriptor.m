@interface AVTMemojiDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)colorPresetFromColorData:(id)a3 forCategory:(int64_t)a4 colorIndex:(unint64_t)a5 version:(unsigned __int16)a6 didFail:(BOOL *)a7 error:(id *)a8;
+ (id)presetsDictionaryFromRecipe:(id)a3 didFail:(BOOL *)a4 error:(id *)a5;
+ (id)randomDescriptor;
+ (unsigned)classIdentifier;
- (AVTMemojiDescriptor)initWithCoder:(id)a3;
- (AVTMemojiDescriptor)initWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (AVTMemojiDescriptor)initWithDictionaryRepresentation:(id)a3 error:(id *)a4 isResettingToDefault:(BOOL)a5;
- (AVTMemojiDescriptor)initWithMemoji:(id)a3;
- (id)colorPresetForCategory:(int64_t)a3 colorIndex:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)presetIdentifierForCategory:(int64_t)a3;
- (void)_decode:(id)a3 isResettingToDefault:(BOOL)a4 error:(id *)a5;
- (void)applyToMemoji:(id)a3;
- (void)encodeInDictionaryRepresentation:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setColorPreset:(id)a3 forCategory:(int64_t)a4 colorIndex:(unint64_t)a5;
- (void)setPresetIdentifier:(id)a3 forCategory:(int64_t)a4;
@end

@implementation AVTMemojiDescriptor

- (AVTMemojiDescriptor)initWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  return [(AVTMemojiDescriptor *)self initWithDictionaryRepresentation:a3 error:a4 isResettingToDefault:0];
}

- (AVTMemojiDescriptor)initWithDictionaryRepresentation:(id)a3 error:(id *)a4 isResettingToDefault:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVTMemojiDescriptor;
  v9 = [(AVTMemojiDescriptor *)&v12 init];
  v10 = v9;
  if (v9) {
    [(AVTMemojiDescriptor *)v9 _decode:v8 isResettingToDefault:v5 error:a4];
  }

  return v10;
}

- (AVTMemojiDescriptor)initWithMemoji:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AVTMemojiDescriptor;
  BOOL v5 = [(AVTMemojiDescriptor *)&v16 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = 0;
    id v8 = v5;
    do
    {
      v9 = [v4 presetForCategory:v7];
      uint64_t v10 = [v9 identifier];
      v11 = v6->_presetIdentifiers[v7];
      v6->_presetIdentifiers[v7] = (NSString *)v10;

      for (uint64_t i = 0; i != 3; ++i)
      {
        uint64_t v13 = [v4 colorPresetForCategory:v7 colorIndex:i];
        v14 = v8->_colorPresets[0][i];
        v8->_colorPresets[0][i] = (AVTColorPreset *)v13;
      }
      ++v7;
      id v8 = (AVTMemojiDescriptor *)((char *)v8 + 24);
    }
    while (v7 != 40);
  }

  return v6;
}

+ (id)randomDescriptor
{
  id v2 = objc_alloc_init((Class)a1);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __39__AVTMemojiDescriptor_randomDescriptor__block_invoke;
  v9[3] = &unk_264021120;
  id v10 = v2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__AVTMemojiDescriptor_randomDescriptor__block_invoke_2;
  v7[3] = &unk_264021148;
  id v3 = v10;
  id v8 = v3;
  _AVTMemojiRandomize(v9, v7);
  id v4 = v8;
  id v5 = v3;

  return v5;
}

void __39__AVTMemojiDescriptor_randomDescriptor__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = [a2 identifier];
  [v4 setPresetIdentifier:v5 forCategory:a3];
}

uint64_t __39__AVTMemojiDescriptor_randomDescriptor__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) setColorPreset:a2 forCategory:a3 colorIndex:a4];
}

- (void)applyToMemoji:(id)a3
{
  id v10 = a3;
  uint64_t v4 = 0;
  presetIdentifiers = self->_presetIdentifiers;
  do
  {
    v6 = presetIdentifiers[v4];
    if (v6)
    {
      uint64_t v7 = +[AVTPreset presetWithCategory:v4 identifier:v6];
      [v10 setPreset:v7 forCategory:v4 animated:0];
    }
    else
    {
      [v10 setPreset:0 forCategory:v4 animated:0];
    }
    for (uint64_t i = 0; i != 3; ++i)
    {
      v9 = self->_colorPresets[0][i];
      if (v9) {
        [v10 setColorPreset:v9 forCategory:v4 colorIndex:i];
      }
    }

    ++v4;
    self = (AVTMemojiDescriptor *)((char *)self + 24);
  }
  while (v4 != 40);
}

- (id)presetIdentifierForCategory:(int64_t)a3
{
  if (a3 < 40)
  {
    uint64_t v4 = self->_presetIdentifiers[a3];
  }
  else
  {
    id v3 = avt_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[AVTMemojiDescriptor presetIdentifierForCategory:]();
    }

    uint64_t v4 = 0;
  }
  return v4;
}

- (void)setPresetIdentifier:(id)a3 forCategory:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4 < 40)
  {
    if (v6)
    {
      v9 = +[AVTPreset presetWithCategory:a4 identifier:v6];
      if (!v9)
      {
        id v10 = avt_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[AVTMemojiDescriptor setPresetIdentifier:forCategory:](v10, v11, v12, v13, v14, v15, v16, v17);
        }
      }
    }
    presetIdentifiers = self->_presetIdentifiers;
    v19 = v7;
    id v8 = self->_presetIdentifiers[a4];
    presetIdentifiers[a4] = v19;
  }
  else
  {
    id v8 = avt_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AVTMemojiDescriptor presetIdentifierForCategory:]();
    }
  }
}

- (void)setColorPreset:(id)a3 forCategory:(int64_t)a4 colorIndex:(unint64_t)a5
{
  id v8 = a3;
  v9 = v8;
  if (a4 < 40)
  {
    if (v8 && [v8 category] != a4)
    {
      uint64_t v11 = avt_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[AVTMemojiDescriptor setColorPreset:forCategory:colorIndex:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    if (a5 >= 3) {
      -[AVTMemojiDescriptor setColorPreset:forCategory:colorIndex:]();
    }
    v19 = self->_colorPresets[a4];
    v20 = v9;
    p_super = &v19[a5]->super;
    v19[a5] = v20;
  }
  else
  {
    p_super = avt_default_log();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      -[AVTMemojiDescriptor presetIdentifierForCategory:]();
    }
  }
}

- (id)colorPresetForCategory:(int64_t)a3 colorIndex:(unint64_t)a4
{
  if (a3 < 40)
  {
    if (a4 >= 3) {
      -[AVTMemojiDescriptor colorPresetForCategory:colorIndex:]();
    }
    id v5 = self->_colorPresets[a3][a4];
  }
  else
  {
    uint64_t v4 = avt_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AVTMemojiDescriptor presetIdentifierForCategory:]();
    }

    id v5 = 0;
  }
  return v5;
}

+ (id)presetsDictionaryFromRecipe:(id)a3 didFail:(BOOL *)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = objc_msgSend(v7, "avt_objectForKey:ofClass:didFail:error:", @"presets", objc_opt_class(), a4, a5);

  if (*a4)
  {
    id v9 = 0;
  }
  else
  {
    id v10 = AVTUpgradePairedPresetCategoriesIfNeeded(v8);

    id v9 = v10;
    id v8 = v9;
  }

  return v9;
}

+ (id)colorPresetFromColorData:(id)a3 forCategory:(int64_t)a4 colorIndex:(unint64_t)a5 version:(unsigned __int16)a6 didFail:(BOOL *)a7 error:(id *)a8
{
  unsigned int v10 = a6;
  id v13 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = AVTUpgradeColorPresetIdentifierIfNeeded(a4, v13, v10);
    uint64_t v15 = +[AVTColorPreset colorPresetWithName:v14 category:a4 colorIndex:a5 variation:0.0];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v15 = 0;
      goto LABEL_17;
    }
    uint64_t v16 = objc_msgSend(v13, "avt_objectForKey:ofClass:didFail:error:", @"variation", objc_opt_class(), a7, a8);
    uint64_t v14 = v16;
    if (*a7)
    {
      uint64_t v15 = 0;
    }
    else
    {
      [v16 floatValue];
      float v18 = v17;
      v19 = objc_msgSend(v13, "avt_objectForKey:ofClass:didFail:error:", @"name", objc_opt_class(), a7, a8);
      if (*a7)
      {
        uint64_t v15 = 0;
      }
      else
      {
        if (v10 < 8 && a4 == 10) {
          float v18 = -v18;
        }
        uint64_t v21 = AVTUpgradeColorPresetIdentifierIfNeeded(a4, v19, v10);

        *(float *)&double v22 = v18;
        uint64_t v15 = +[AVTColorPreset colorPresetWithName:v21 category:a4 colorIndex:a5 variation:v22];
        v19 = (void *)v21;
      }
    }
  }

LABEL_17:
  return v15;
}

+ (unsigned)classIdentifier
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)AVTMemojiDescriptor;
  [(AVTAvatarDescriptor *)&v40 encodeWithCoder:v4];
  unint64_t v5 = 0;
  unint64_t v6 = 0x263F08000uLL;
  do
  {
    id v7 = AVTPresetCategoryToString(v5);
    id v8 = [(AVTMemojiDescriptor *)self presetIdentifierForCategory:v5];
    if (v8)
    {
      id v9 = [*(id *)(v6 + 2880) stringWithFormat:@"%@-presetIdentifier", v7];
      [v4 encodeObject:v8 forKey:v9];
    }
    unsigned int v10 = [(AVTMemojiDescriptor *)self colorPresetForCategory:v5 colorIndex:0];
    uint64_t v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 name];
      id v13 = [*(id *)(v6 + 2880) stringWithFormat:@"%@-primaryColorName", v7];
      [v4 encodeObject:v12 forKey:v13];

      [v11 variation];
      int v15 = v14;
      uint64_t v16 = [*(id *)(v6 + 2880) stringWithFormat:@"%@-primaryColorVariation", v7];
      LODWORD(v17) = v15;
      [v4 encodeFloat:v16 forKey:v17];
    }
    float v18 = [(AVTMemojiDescriptor *)self colorPresetForCategory:v5 colorIndex:1];
    v19 = v18;
    if (v18)
    {
      v20 = [v18 name];
      uint64_t v21 = [*(id *)(v6 + 2880) stringWithFormat:@"%@-secondaryColorName", v7];
      [v4 encodeObject:v20 forKey:v21];

      [v19 variation];
      int v23 = v22;
      v24 = [*(id *)(v6 + 2880) stringWithFormat:@"%@-secondaryColorVariation", v7];
      LODWORD(v25) = v23;
      [v4 encodeFloat:v24 forKey:v25];
    }
    v26 = [(AVTMemojiDescriptor *)self colorPresetForCategory:v5 colorIndex:2];
    v27 = v26;
    if (v26)
    {
      v28 = [v26 name];
      [*(id *)(v6 + 2880) stringWithFormat:@"%@-tertiaryColorName", v7];
      v39 = v19;
      v29 = v7;
      v30 = v11;
      v31 = v8;
      v32 = self;
      v34 = unint64_t v33 = v6;
      [v4 encodeObject:v28 forKey:v34];

      unint64_t v6 = v33;
      self = v32;
      id v8 = v31;
      uint64_t v11 = v30;
      id v7 = v29;
      v19 = v39;

      [v27 variation];
      int v36 = v35;
      v37 = [*(id *)(v6 + 2880) stringWithFormat:@"%@-tertiaryColorVariation", v7];
      LODWORD(v38) = v36;
      [v4 encodeFloat:v37 forKey:v38];
    }
    ++v5;
  }
  while (v5 != 40);
}

- (AVTMemojiDescriptor)initWithCoder:(id)a3
{
  v70[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)AVTMemojiDescriptor;
  unint64_t v5 = [(AVTAvatarDescriptor *)&v64 initWithCoder:v4];
  unint64_t v6 = v5;
  if (v5)
  {
    v57 = v5;
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v8 = [v4 decodeIntegerForKey:@"version"];
    unint64_t v9 = 0x263F08000uLL;
    unsigned int v10 = [NSNumber numberWithInteger:v8];
    v56 = v7;
    [v7 setValue:v10 forKey:@"version"];

    id v60 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v59 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v61 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v58 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    unint64_t v11 = 0;
    uint64_t v12 = @"name";
    unint64_t v13 = 0x263F08000uLL;
    do
    {
      int v14 = AVTPresetCategoryToString(v11);
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = [*(id *)(v13 + 2880) stringWithFormat:@"%@-presetIdentifier", v14];
      uint64_t v17 = [v4 decodeObjectOfClass:v15 forKey:v16];

      if (v17) {
        [v60 setObject:v17 forKeyedSubscript:v14];
      }
      v63 = (void *)v17;
      uint64_t v18 = objc_opt_class();
      v19 = [*(id *)(v13 + 2880) stringWithFormat:@"%@-primaryColorName", v14];
      v20 = [v4 decodeObjectOfClass:v18 forKey:v19];

      if (v20)
      {
        uint64_t v21 = [*(id *)(v13 + 2880) stringWithFormat:@"%@-primaryColorVariation", v14];
        [v4 decodeFloatForKey:v21];
        int v23 = v22;

        v69[0] = v12;
        v69[1] = @"variation";
        v70[0] = v20;
        LODWORD(v24) = v23;
        double v25 = [*(id *)(v9 + 2584) numberWithFloat:v24];
        v70[1] = v25;
        v26 = [NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:2];
        [v59 setObject:v26 forKeyedSubscript:v14];
      }
      uint64_t v27 = objc_opt_class();
      v28 = [*(id *)(v13 + 2880) stringWithFormat:@"%@-secondaryColorName", v14];
      v29 = [v4 decodeObjectOfClass:v27 forKey:v28];

      if (v29)
      {
        v30 = [*(id *)(v13 + 2880) stringWithFormat:@"%@-secondaryColorVariation", v14];
        [v4 decodeFloatForKey:v30];
        int v32 = v31;

        v67[0] = v12;
        v67[1] = @"variation";
        v68[0] = v29;
        LODWORD(v33) = v32;
        v34 = [*(id *)(v9 + 2584) numberWithFloat:v33];
        v68[1] = v34;
        [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
        int v35 = v29;
        int v36 = v20;
        double v38 = v37 = v13;
        [v61 setObject:v38 forKeyedSubscript:v14];

        unint64_t v13 = v37;
        v20 = v36;
        v29 = v35;
      }
      uint64_t v39 = objc_opt_class();
      [*(id *)(v13 + 2880) stringWithFormat:@"%@-tertiaryColorName", v14];
      v41 = unint64_t v40 = v13;
      v42 = [v4 decodeObjectOfClass:v39 forKey:v41];

      if (v42)
      {
        v43 = [*(id *)(v40 + 2880) stringWithFormat:@"%@-tertiaryColorVariation", v14];
        [v4 decodeFloatForKey:v43];
        int v45 = v44;

        v65[0] = v12;
        v65[1] = @"variation";
        v66[0] = v42;
        LODWORD(v46) = v45;
        v47 = [*(id *)(v9 + 2584) numberWithFloat:v46];
        v66[1] = v47;
        [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:2];
        v62 = v29;
        unint64_t v48 = v11;
        v49 = v20;
        v50 = v12;
        unint64_t v51 = v9;
        id v52 = v4;
        v54 = unint64_t v53 = v40;
        [v58 setObject:v54 forKeyedSubscript:v14];

        unint64_t v40 = v53;
        id v4 = v52;
        unint64_t v9 = v51;
        uint64_t v12 = v50;
        v20 = v49;
        unint64_t v11 = v48;
        v29 = v62;
      }
      ++v11;
      unint64_t v13 = v40;
    }
    while (v11 != 40);
    [v56 setObject:v60 forKeyedSubscript:@"presets"];
    [v56 setObject:v59 forKeyedSubscript:@"colors"];
    if ([v61 count]) {
      [v56 setObject:v61 forKeyedSubscript:@"secondaryColors"];
    }
    unint64_t v6 = v57;
    if ([v58 count]) {
      [v56 setObject:v58 forKeyedSubscript:@"tertiaryColors"];
    }
    [(AVTMemojiDescriptor *)v57 _decode:v56 isResettingToDefault:0 error:0];
  }
  return v6;
}

- (void)encodeInDictionaryRepresentation:(id)a3
{
  v46[2] = *MEMORY[0x263EF8340];
  id v33 = a3;
  id v36 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v35 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v37 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v34 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unint64_t v4 = 0;
  unint64_t v5 = @"name";
  unint64_t v6 = 0x263F08000uLL;
  unint64_t v7 = 0x263EFF000uLL;
  do
  {
    uint64_t v8 = AVTPresetCategoryToString(v4);
    uint64_t v9 = [(AVTMemojiDescriptor *)self presetIdentifierForCategory:v4];
    if (v9) {
      [v36 setObject:v9 forKeyedSubscript:v8];
    }
    unint64_t v40 = (void *)v9;
    unsigned int v10 = -[AVTMemojiDescriptor colorPresetForCategory:colorIndex:](self, "colorPresetForCategory:colorIndex:", v4, 0, v33);
    unint64_t v11 = v10;
    if (v10)
    {
      v45[0] = v5;
      uint64_t v12 = [v10 name];
      v46[0] = v12;
      v45[1] = @"variation";
      unint64_t v13 = *(void **)(v6 + 2584);
      [v11 variation];
      int v14 = objc_msgSend(v13, "numberWithFloat:");
      v46[1] = v14;
      uint64_t v15 = [*(id *)(v7 + 2352) dictionaryWithObjects:v46 forKeys:v45 count:2];
      [v35 setObject:v15 forKeyedSubscript:v8];
    }
    uint64_t v39 = v11;
    uint64_t v16 = (void *)v8;
    uint64_t v17 = [(AVTMemojiDescriptor *)self colorPresetForCategory:v4 colorIndex:1];
    uint64_t v18 = v17;
    if (v17)
    {
      v43[0] = v5;
      v19 = [v17 name];
      v43[1] = @"variation";
      v44[0] = v19;
      v20 = *(void **)(v6 + 2584);
      [v18 variation];
      uint64_t v21 = objc_msgSend(v20, "numberWithFloat:");
      v44[1] = v21;
      int v22 = [*(id *)(v7 + 2352) dictionaryWithObjects:v44 forKeys:v43 count:2];
      [v37 setObject:v22 forKeyedSubscript:v16];
    }
    int v23 = [(AVTMemojiDescriptor *)self colorPresetForCategory:v4 colorIndex:2];
    double v24 = v23;
    if (v23)
    {
      v41[0] = v5;
      double v38 = [v23 name];
      v41[1] = @"variation";
      v42[0] = v38;
      double v25 = *(void **)(v6 + 2584);
      [v24 variation];
      v26 = objc_msgSend(v25, "numberWithFloat:");
      v42[1] = v26;
      [*(id *)(v7 + 2352) dictionaryWithObjects:v42 forKeys:v41 count:2];
      unint64_t v27 = v7;
      unint64_t v28 = v6;
      v29 = v5;
      v30 = self;
      v32 = int v31 = v16;
      [v34 setObject:v32 forKeyedSubscript:v31];

      uint64_t v16 = v31;
      self = v30;
      unint64_t v5 = v29;
      unint64_t v6 = v28;
      unint64_t v7 = v27;
    }
    ++v4;
  }
  while (v4 != 40);
  [v33 setObject:v36 forKeyedSubscript:@"presets"];
  [v33 setObject:v35 forKeyedSubscript:@"colors"];
  if ([v37 count]) {
    [v33 setObject:v37 forKeyedSubscript:@"secondaryColors"];
  }
  if ([v34 count]) {
    [v33 setObject:v34 forKeyedSubscript:@"tertiaryColors"];
  }
}

- (void)_decode:(id)a3 isResettingToDefault:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v8 = a3;
  unsigned __int8 v82 = 0;
  uint64_t v9 = objc_msgSend(v8, "avt_objectForKey:ofClass:didFail:error:", @"version", objc_opt_class(), &v82, a5);
  unsigned int v10 = [(id)objc_opt_class() presetsDictionaryFromRecipe:v8 didFail:&v82 error:a5];
  v71 = objc_msgSend(v8, "avt_objectForKey:ofClass:didFail:error:", @"colors", objc_opt_class(), &v82, a5);
  unint64_t v11 = objc_msgSend(v8, "avt_objectForKey:ofClass:didFail:error:", @"secondaryColors", objc_opt_class(), &v82, a5);
  uint64_t v12 = objc_msgSend(v8, "avt_objectForKey:ofClass:didFail:error:", @"tertiaryColors", objc_opt_class(), &v82, a5);
  if (v82) {
    goto LABEL_90;
  }
  v66 = v12;
  v67 = v11;
  v72 = self;
  v63 = v9;
  id v64 = v8;
  unsigned __int16 v73 = [v9 intValue];
  unint64_t v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = objc_opt_class();
  v70 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  unint64_t v15 = 0;
  BOOL v65 = v6;
  BOOL v68 = !v6;
  while (1)
  {
    uint64_t v16 = AVTPresetCategoryToString(v15);
    uint64_t v17 = objc_msgSend(v10, "avt_objectForKey:ofClass:didFail:error:", v16, objc_opt_class(), &v82, a5);
    uint64_t v18 = (void *)v17;
    if (v82) {
      break;
    }
    if (v17)
    {
LABEL_5:
      v19 = AVTUpgradePresetIdentifierIfNeeded(v15, v18, v73);
      if (v19 == v18) {
        LOBYTE(v20) = 1;
      }
      else {
        int v20 = [v18 isEqualToString:@"none"] ^ 1;
      }
      [(AVTMemojiDescriptor *)v72 setPresetIdentifier:v19 forCategory:v15];
      goto LABEL_20;
    }
    uint64_t v21 = AVTUpgradesForPresetCategory(v15, v73);
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v22 = v21;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v78 objects:v83 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v79;
      while (2)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v79 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = objc_msgSend(v10, "avt_objectForKey:ofClass:didFail:error:", *(void *)(*((void *)&v78 + 1) + 8 * i), objc_opt_class(), &v82, a5);
          uint64_t v18 = (void *)v27;
          if (v82)
          {

            goto LABEL_88;
          }
          if (v27)
          {

            goto LABEL_5;
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v78 objects:v83 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }

    if (v65)
    {
      unint64_t v28 = +[AVTPreset availablePresetsForCategory:v15];
      uint64_t v18 = [v28 firstObject];

      v29 = [v18 identifier];
      [(AVTMemojiDescriptor *)v72 setPresetIdentifier:v29 forCategory:v15];

      v19 = 0;
      LOBYTE(v20) = 1;
LABEL_20:

      goto LABEL_21;
    }
    v19 = 0;
    LOBYTE(v20) = 1;
LABEL_21:
    int v77 = 0;
    v30 = AVTIdentifierOfUpgradedColorPresetForAssetPresetIdentifier(v15, v19, 0, &v77, v73);
    if (v30)
    {
      LODWORD(v31) = v77;
      int v32 = +[AVTColorPreset colorPresetWithName:v30 category:v15 colorIndex:0 variation:v31];
      id v33 = v72;
      [(AVTMemojiDescriptor *)v72 setColorPreset:v32 forCategory:v15 colorIndex:0];
      goto LABEL_23;
    }
    uint64_t v41 = objc_msgSend(v71, "avt_objectForKey:ofClasses:didFail:error:", v16, v70, &v82, a5);
    int v32 = (void *)v41;
    if (v82) {
      goto LABEL_30;
    }
    BOOL v47 = v15 == 34 && v41 == 0;
    if (v47) {
      int v32 = 0;
    }
    if (v47 && !v65)
    {
      unint64_t v48 = AVTPresetCategoryToColorCategoryString(4uLL);
      int v32 = objc_msgSend(v71, "avt_objectForKey:ofClasses:didFail:error:", v48, v70, &v82, a5);
      int v49 = v82;

      v30 = 0;
      if (v49)
      {
LABEL_30:

        int v42 = 1;
        goto LABEL_77;
      }
    }
    char v50 = v20 ^ 1;
    if (!v32) {
      char v50 = 1;
    }
    if ((v50 & 1) == 0)
    {
      id v33 = v72;
      [(id)objc_opt_class() colorPresetFromColorData:v32 forCategory:v15 colorIndex:0 version:v73 didFail:&v82 error:a5];
      v52 = unint64_t v51 = v30;
      [(AVTMemojiDescriptor *)v72 setColorPreset:v52 forCategory:v15 colorIndex:0];

      v30 = v51;
LABEL_23:
      char v34 = v68;
LABEL_24:

      goto LABEL_25;
    }

    char v34 = v68;
    id v33 = v72;
    if (v65)
    {
      int v32 = +[AVTColorPreset fallbackColorPresetForNilPresetAndCategory:v15 colorIndex:0];
      if (v32) {
        [(AVTMemojiDescriptor *)v72 setColorPreset:v32 forCategory:v15 colorIndex:0];
      }
      char v34 = 0;
      goto LABEL_24;
    }
LABEL_25:
    id v35 = [(AVTMemojiDescriptor *)v33 colorPresetForCategory:v15 colorIndex:0];
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __58__AVTMemojiDescriptor__decode_isResettingToDefault_error___block_invoke;
    v76[3] = &unk_264021170;
    v76[4] = v33;
    [v35 enumerateDerivedColorPresetsUsingBlock:v76];

    int v75 = 0;
    id v36 = AVTIdentifierOfUpgradedColorPresetForAssetPresetIdentifier(v15, v19, 1uLL, &v75, v73);
    id v37 = v36;
    v69 = v30;
    if (v36)
    {
      if (![v36 isEqualToString:@"$archived-primary"])
      {
        LODWORD(v38) = v75;
        int v44 = +[AVTColorPreset colorPresetWithName:v37 category:v15 colorIndex:1 variation:v38];
        goto LABEL_53;
      }
      uint64_t v39 = objc_msgSend(v71, "avt_objectForKey:ofClasses:didFail:error:", v16, v70, &v82, a5);
      unint64_t v40 = v39;
      if (!v82)
      {
        int v44 = [(id)objc_opt_class() colorPresetFromColorData:v39 forCategory:v15 colorIndex:0 version:v73 didFail:&v82 error:a5];

        goto LABEL_53;
      }
    }
    else
    {
      v43 = objc_msgSend(v67, "avt_objectForKey:ofClasses:didFail:error:", v16, v70, &v82, a5);
      int v44 = v43;
      int v45 = v82;
      if (!v82 && v43)
      {
        double v46 = [(id)objc_opt_class() colorPresetFromColorData:v43 forCategory:v15 colorIndex:1 version:v73 didFail:&v82 error:a5];
        [(AVTMemojiDescriptor *)v33 setColorPreset:v46 forCategory:v15 colorIndex:1];

        goto LABEL_54;
      }

      if (!v45)
      {
        if ((v34 & 1) == 0)
        {
          int v44 = +[AVTColorPreset fallbackColorPresetForNilPresetAndCategory:v15 colorIndex:1];
          if (!v44)
          {
LABEL_54:

            goto LABEL_55;
          }
LABEL_53:
          [(AVTMemojiDescriptor *)v33 setColorPreset:v44 forCategory:v15 colorIndex:1];
          goto LABEL_54;
        }
LABEL_55:
        int v74 = 0;
        unint64_t v53 = AVTIdentifierOfUpgradedColorPresetForAssetPresetIdentifier(v15, v19, 2uLL, &v74, v73);
        v54 = v53;
        if (v53)
        {
          if ([v53 isEqualToString:@"$archived-primary"])
          {
            v56 = objc_msgSend(v71, "avt_objectForKey:ofClasses:didFail:error:", v16, v70, &v82, a5);
            if (v82)
            {
              int v42 = 1;
              goto LABEL_74;
            }
            id v59 = v72;
            uint64_t v62 = [(id)objc_opt_class() colorPresetFromColorData:v56 forCategory:v15 colorIndex:0 version:v73 didFail:&v82 error:a5];

            v56 = (void *)v62;
          }
          else
          {
            LODWORD(v55) = v74;
            v56 = +[AVTColorPreset colorPresetWithName:v54 category:v15 colorIndex:2 variation:v55];
            id v59 = v72;
          }
          id v61 = v59;
LABEL_72:
          [(AVTMemojiDescriptor *)v61 setColorPreset:v56 forCategory:v15 colorIndex:2];
          goto LABEL_73;
        }
        v57 = objc_msgSend(v66, "avt_objectForKey:ofClasses:didFail:error:", v16, v70, &v82, a5);
        v56 = v57;
        int v42 = v82;
        if (!v82 && v57)
        {
          id v58 = [(id)objc_opt_class() colorPresetFromColorData:v57 forCategory:v15 colorIndex:2 version:v73 didFail:&v82 error:a5];
          [(AVTMemojiDescriptor *)v72 setColorPreset:v58 forCategory:v15 colorIndex:2];

          goto LABEL_73;
        }

        if (v42) {
          char v60 = 1;
        }
        else {
          char v60 = v34;
        }
        if ((v60 & 1) == 0)
        {
          v56 = +[AVTColorPreset fallbackColorPresetForNilPresetAndCategory:v15 colorIndex:2];
          if (v56)
          {
            id v61 = v72;
            goto LABEL_72;
          }
LABEL_73:
          int v42 = 0;
LABEL_74:
        }
        goto LABEL_76;
      }
    }
    int v42 = 1;
LABEL_76:

    v30 = v69;
LABEL_77:

    if (!v42 && ++v15 != 40) {
      continue;
    }
    goto LABEL_89;
  }
LABEL_88:

LABEL_89:
  uint64_t v9 = v63;
  id v8 = v64;
  uint64_t v12 = v66;
  unint64_t v11 = v67;
LABEL_90:
}

uint64_t __58__AVTMemojiDescriptor__decode_isResettingToDefault_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setColorPreset:a3 forCategory:a2 colorIndex:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_alloc_init(AVTMemojiDescriptor);
  uint64_t v5 = 0;
  presetIdentifiers = self->_presetIdentifiers;
  unint64_t v7 = v4;
  do
  {
    objc_storeStrong((id *)&v4->_presetIdentifiers[v5], presetIdentifiers[v5]);
    for (uint64_t i = 0; i != 3; ++i)
      objc_storeStrong((id *)&v7->_colorPresets[0][i], self->_colorPresets[0][i]);
    ++v5;
    self = (AVTMemojiDescriptor *)((char *)self + 24);
    unint64_t v7 = (AVTMemojiDescriptor *)((char *)v7 + 24);
  }
  while (v5 != 40);
  return v4;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)AVTMemojiDescriptor;
  id v2 = [(AVTMemojiDescriptor *)&v4 description];
  return v2;
}

- (id)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  for (unint64_t i = 0; i != 40; ++i)
  {
    uint64_t v5 = self->_presetIdentifiers[i];
    BOOL v6 = v5;
    if (v5 && ![(NSString *)v5 isEqualToString:@"none"])
    {
      unint64_t v7 = AVTPresetCategoryToString(i);
      [v3 appendFormat:@", %@=%@", v7, v6];
    }
  }
  id v8 = NSString;
  uint64_t v9 = (objc_class *)objc_opt_class();
  unsigned int v10 = NSStringFromClass(v9);
  unint64_t v11 = [v8 stringWithFormat:@"<%@: %p%@>", v10, self, v3];

  return v11;
}

- (void).cxx_destruct
{
  colorPresets = self->_colorPresets;
  for (uint64_t i = 119; i != -1; --i)
    objc_storeStrong((id *)&(*colorPresets)[i], 0);
  presetIdentifiers = self->_presetIdentifiers;
  for (uint64_t j = 39; j != -1; --j)
    objc_storeStrong((id *)&presetIdentifiers[j], 0);
}

- (void)presetIdentifierForCategory:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_20B819000, v0, v1, "Error: Unreachable code: Unexpected category %d", v2, v3, v4, v5, v6);
}

- (void)setPresetIdentifier:(uint64_t)a3 forCategory:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setColorPreset:forCategory:colorIndex:.cold.2()
{
}

- (void)setColorPreset:(uint64_t)a3 forCategory:(uint64_t)a4 colorIndex:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)colorPresetForCategory:colorIndex:.cold.2()
{
}

@end