@interface CAMSmartStyleCategoryInstructionLabel
- (CAMSmartStyleCategoryInstructionLabel)initWithFrame:(CGRect)a3;
- (NSSet)_systemStylePresetTypes;
- (double)_backgroundAlpha;
- (double)_backgroundColorWhiteValue;
- (int64_t)presetType;
- (void)_updateText;
- (void)setPresetType:(int64_t)a3;
@end

@implementation CAMSmartStyleCategoryInstructionLabel

- (CAMSmartStyleCategoryInstructionLabel)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CAMSmartStyleCategoryInstructionLabel;
  v3 = -[CAMInstructionLabel initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263EFFA08]);
    v5 = CEKSmartStyleSystemStylePresetTypes();
    uint64_t v6 = [v4 initWithArray:v5];
    systemStylePresetTypes = v3->__systemStylePresetTypes;
    v3->__systemStylePresetTypes = (NSSet *)v6;

    v3->_presetType = 1;
    [(CAMSmartStyleCategoryInstructionLabel *)v3 _updateText];
    v8 = v3;
  }

  return v3;
}

- (double)_backgroundAlpha
{
  return 0.9;
}

- (double)_backgroundColorWhiteValue
{
  return 0.2;
}

- (void)_updateText
{
  v3 = [(CAMSmartStyleCategoryInstructionLabel *)self _systemStylePresetTypes];
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMSmartStyleCategoryInstructionLabel presetType](self, "presetType"));
  int v5 = [v3 containsObject:v4];

  if (v5) {
    uint64_t v6 = @"SMART_STYLES_CATEGORY_LABEL_SYSTEM";
  }
  else {
    uint64_t v6 = @"SMART_STYLES_CATEGORY_LABEL_CREATIVE";
  }
  CAMLocalizedFrameworkString(v6, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(CAMInstructionLabel *)self setText:v7];
}

- (void)setPresetType:(int64_t)a3
{
  if (self->_presetType != a3)
  {
    self->_presetType = a3;
    [(CAMSmartStyleCategoryInstructionLabel *)self _updateText];
  }
}

- (int64_t)presetType
{
  return self->_presetType;
}

- (NSSet)_systemStylePresetTypes
{
  return self->__systemStylePresetTypes;
}

- (void).cxx_destruct
{
}

@end