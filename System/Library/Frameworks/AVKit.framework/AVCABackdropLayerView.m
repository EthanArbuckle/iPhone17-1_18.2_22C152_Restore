@interface AVCABackdropLayerView
+ (Class)layerClass;
+ (id)averageFilter;
+ (id)blurFilter;
+ (id)colorMatrixFilter;
+ (id)reducedTransparencyColor;
- (AVCABackdropLayerView)groupLeader;
- (AVCABackdropLayerView)initWithFrame:(CGRect)a3;
- (BOOL)forceLowQualityEffect;
- (BOOL)isCaptureOnly;
- (BOOL)overrideBlurOnlyFilter;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CAFilter)blurFilter;
- (CAFilter)variableBlurFilter;
- (NSHashTable)dependents;
- (UIColor)customBackgroundColor;
- (UIImage)variableBlurMaskImage;
- (double)blurRadius;
- (id)_blurRadiusNSNumberValue;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)activeBackdropEffect;
- (void)_ensureDependents;
- (void)_enumerateDependents:(id)a3;
- (void)_setUpBlurFilterIfNeeded;
- (void)_setUpVariableBlurFilterIfNeeded;
- (void)_updateBlurFilterRadiusIfNeeded;
- (void)_updateFilters;
- (void)_updateVariableBlurFilterMaskImageIfNeeded;
- (void)addDependent:(id)a3;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)removeDependent:(id)a3;
- (void)setActiveBackdropEffect:(int64_t)a3;
- (void)setBlurFilter:(id)a3;
- (void)setBlurRadius:(double)a3;
- (void)setCaptureOnly:(BOOL)a3;
- (void)setCustomBackgroundColor:(id)a3;
- (void)setForceLowQualityEffect:(BOOL)a3;
- (void)setGroupLeader:(id)a3;
- (void)setOverrideBlurOnlyFilter:(BOOL)a3;
- (void)setVariableBlurFilter:(id)a3;
- (void)setVariableBlurMaskImage:(id)a3;
- (void)updateActiveBackdropEffectIfGroupLeader;
- (void)updateGroupLeader;
@end

@implementation AVCABackdropLayerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variableBlurFilter, 0);
  objc_storeStrong((id *)&self->_blurFilter, 0);
  objc_storeStrong((id *)&self->_dependents, 0);
  objc_destroyWeak((id *)&self->_groupLeader);
  objc_storeStrong((id *)&self->_customBackgroundColor, 0);

  objc_storeStrong((id *)&self->_variableBlurMaskImage, 0);
}

- (void)setVariableBlurFilter:(id)a3
{
}

- (CAFilter)variableBlurFilter
{
  return self->_variableBlurFilter;
}

- (void)setBlurFilter:(id)a3
{
}

- (CAFilter)blurFilter
{
  return self->_blurFilter;
}

- (void)setActiveBackdropEffect:(int64_t)a3
{
  self->_activeBackdropEffect = a3;
}

- (int64_t)activeBackdropEffect
{
  return self->_activeBackdropEffect;
}

- (NSHashTable)dependents
{
  return self->_dependents;
}

- (AVCABackdropLayerView)groupLeader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupLeader);

  return (AVCABackdropLayerView *)WeakRetained;
}

- (UIColor)customBackgroundColor
{
  return self->_customBackgroundColor;
}

- (UIImage)variableBlurMaskImage
{
  return self->_variableBlurMaskImage;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (BOOL)overrideBlurOnlyFilter
{
  return self->_overrideBlurOnlyFilter;
}

- (void)setForceLowQualityEffect:(BOOL)a3
{
  self->_forceLowQualityEffect = a3;
}

- (BOOL)forceLowQualityEffect
{
  return self->_forceLowQualityEffect;
}

- (id)_blurRadiusNSNumberValue
{
  double blurRadius = self->_blurRadius;
  *(float *)&double blurRadius = blurRadius;
  return (id)[NSNumber numberWithFloat:blurRadius];
}

- (void)_enumerateDependents:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  v5 = (void *)[(NSHashTable *)self->_dependents copy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_ensureDependents
{
  if (!self->_dependents)
  {
    v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    dependents = self->_dependents;
    self->_dependents = v3;
    MEMORY[0x1F41817F8](v3, dependents);
  }
}

- (void)_updateFilters
{
  v60[1] = *MEMORY[0x1E4F143B8];
  if ([(AVCABackdropLayerView *)self overrideBlurOnlyFilter] && self->_blurFilter)
  {
    [(AVCABackdropLayerView *)self setBackgroundColor:0];
    variableBlurMaskImage = self->_variableBlurMaskImage;
    v4 = [(AVCABackdropLayerView *)self layer];
    if (variableBlurMaskImage)
    {
      variableBlurFilter = self->_variableBlurFilter;
      v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&variableBlurFilter count:1];
      [v4 setFilters:v5];

      id v6 = [(AVCABackdropLayerView *)self layer];
      uint64_t v7 = v6;
      double v8 = 1.0;
    }
    else
    {
      v60[0] = self->_blurFilter;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];
      [v4 setFilters:v27];

      id v6 = [(AVCABackdropLayerView *)self layer];
      uint64_t v7 = v6;
      double v8 = 0.25;
    }
    [v6 setScale:v8];

LABEL_24:
    v28 = [(AVCABackdropLayerView *)self layer];
    [v28 setEnabled:1];

    return;
  }
  uint64_t v9 = [(AVCABackdropLayerView *)self groupLeader];

  uint64_t v10 = [(AVCABackdropLayerView *)self groupLeader];

  long long v11 = [(AVCABackdropLayerView *)self dependents];
  uint64_t v12 = [v11 count];

  if (!v9)
  {
    v17 = [(AVCABackdropLayerView *)self layer];
    [v17 setGroupName:0];

    id v55 = [(AVCABackdropLayerView *)self layer];
    [v55 setFilters:MEMORY[0x1E4F1CBF0]];
LABEL_11:

    return;
  }
  if (v10 == self && (v12 || [(AVCABackdropLayerView *)self isCaptureOnly]))
  {
    v18 = [(AVCABackdropLayerView *)self layer];
    v19 = [v18 groupName];

    if (!v19)
    {
      v20 = [MEMORY[0x1E4F28F80] processInfo];
      v21 = [v20 globallyUniqueString];
      v22 = [(AVCABackdropLayerView *)self layer];
      [v22 setGroupName:v21];
    }
    int64_t v23 = [(AVCABackdropLayerView *)self activeBackdropEffect];
    if ((unint64_t)(v23 - 2) >= 2)
    {
      if (v23 == 1)
      {
        [(AVCABackdropLayerView *)self setHidden:0];
        v31 = [(AVCABackdropLayerView *)self layer];
        [v31 setEnabled:1];

        v32 = [(AVCABackdropLayerView *)self layer];
        [v32 setScale:0.25];

        v26 = +[AVCABackdropLayerView blurFilter];
        v58[0] = v26;
        v33 = +[AVCABackdropLayerView colorMatrixFilter];
        v58[1] = v33;
        v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
        v35 = [(AVCABackdropLayerView *)self layer];
        [v35 setFilters:v34];

        goto LABEL_28;
      }
      if (v23)
      {
LABEL_29:
        [(AVCABackdropLayerView *)self setBackgroundColor:0];
        [(AVCABackdropLayerView *)self _enumerateDependents:&__block_literal_global_50_15433];
        return;
      }
    }
    [(AVCABackdropLayerView *)self setHidden:[(AVCABackdropLayerView *)self isCaptureOnly]];
    v24 = [(AVCABackdropLayerView *)self layer];
    [v24 setEnabled:0];

    v25 = [(AVCABackdropLayerView *)self layer];
    [v25 setScale:0.0];

    v26 = [(AVCABackdropLayerView *)self layer];
    [v26 setFilters:MEMORY[0x1E4F1CBF0]];
LABEL_28:

    goto LABEL_29;
  }
  long long v13 = [(AVCABackdropLayerView *)self customBackgroundColor];

  if (v13)
  {
    long long v14 = [(AVCABackdropLayerView *)self layer];
    [v14 setGroupName:0];

    [(AVCABackdropLayerView *)self setActiveBackdropEffect:0];
    v15 = [(AVCABackdropLayerView *)self layer];
    [v15 setEnabled:0];

    uint64_t v16 = [(AVCABackdropLayerView *)self customBackgroundColor];
LABEL_9:
    [(AVCABackdropLayerView *)self setBackgroundColor:v16];
    goto LABEL_11;
  }
  v29 = [(AVCABackdropLayerView *)self groupLeader];
  -[AVCABackdropLayerView setActiveBackdropEffect:](self, "setActiveBackdropEffect:", [v29 activeBackdropEffect]);

  switch([(AVCABackdropLayerView *)self activeBackdropEffect])
  {
    case 0:
      [(AVCABackdropLayerView *)self setBackgroundColor:0];
      v30 = [(AVCABackdropLayerView *)self layer];
      [v30 setGroupName:0];

      id v55 = [(AVCABackdropLayerView *)self layer];
      [v55 setEnabled:0];
      goto LABEL_11;
    case 1:
      [(AVCABackdropLayerView *)self setBackgroundColor:0];
      v36 = [(AVCABackdropLayerView *)self groupLeader];
      v37 = [v36 layer];
      v38 = [v37 groupName];
      v39 = [(AVCABackdropLayerView *)self layer];
      [v39 setGroupName:v38];

      if (v10 == self)
      {
        v36 = +[AVCABackdropLayerView blurFilter];
        v56[0] = v36;
        v37 = +[AVCABackdropLayerView colorMatrixFilter];
        v56[1] = v37;
        v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
      }
      else
      {
        v38 = [(AVCABackdropLayerView *)self groupLeader];
        v39 = [v38 layer];
        v40 = [v39 filters];
      }
      v51 = [(AVCABackdropLayerView *)self layer];
      [v51 setFilters:v40];

      if (v10 == self)
      {

        double v53 = 0.25;
      }
      else
      {

        v36 = [(AVCABackdropLayerView *)self groupLeader];
        v37 = [v36 layer];
        [v37 scale];
        double v53 = v52;
      }
      v54 = [(AVCABackdropLayerView *)self layer];
      [v54 setScale:v53];

      if (v10 != self)
      {
      }
      goto LABEL_24;
    case 2:
      [(AVCABackdropLayerView *)self setBackgroundColor:0];
      v41 = [(AVCABackdropLayerView *)self layer];
      [v41 setGroupName:0];

      v42 = [(AVCABackdropLayerView *)self layer];
      [v42 setEnabled:1];

      v43 = [(AVCABackdropLayerView *)self layer];
      [v43 setScale:0.25];

      v44 = +[AVCABackdropLayerView averageFilter];
      v57[0] = v44;
      v45 = +[AVCABackdropLayerView colorMatrixFilter];
      v57[1] = v45;
      v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
      v47 = [(AVCABackdropLayerView *)self layer];
      [v47 setFilters:v46];

      break;
    case 3:
      v48 = [(AVCABackdropLayerView *)self layer];
      [v48 setGroupName:0];

      v49 = [(AVCABackdropLayerView *)self layer];
      [v49 setEnabled:0];

      v50 = [(AVCABackdropLayerView *)self layer];
      [v50 setFilters:MEMORY[0x1E4F1CBF0]];

      uint64_t v16 = +[AVCABackdropLayerView reducedTransparencyColor];
      goto LABEL_9;
    default:
      return;
  }
}

uint64_t __39__AVCABackdropLayerView__updateFilters__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updateFilters];
}

- (void)_updateVariableBlurFilterMaskImageIfNeeded
{
  if (self->_overrideBlurOnlyFilter)
  {
    [(CAFilter *)self->_variableBlurFilter setValue:[(UIImage *)self->_variableBlurMaskImage CGImage] forKey:@"inputMaskImage"];
    v3 = [(AVCABackdropLayerView *)self layer];
    [v3 setFilters:0];

    [(AVCABackdropLayerView *)self _updateFilters];
  }
}

- (void)_updateBlurFilterRadiusIfNeeded
{
  if (self->_overrideBlurOnlyFilter)
  {
    id v3 = [(AVCABackdropLayerView *)self _blurRadiusNSNumberValue];
    [(CAFilter *)self->_blurFilter setValue:v3 forKey:@"inputRadius"];
    [(CAFilter *)self->_variableBlurFilter setValue:v3 forKey:@"inputRadius"];
  }
}

- (void)_setUpVariableBlurFilterIfNeeded
{
  if (!self->_variableBlurFilter && self->_overrideBlurOnlyFilter && self->_variableBlurMaskImage)
  {
    id v3 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A348]];
    [v3 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputNormalizeEdges"];
    [v3 setValue:MEMORY[0x1E4F1CC28] forKey:@"inputDither"];
    variableBlurFilter = self->_variableBlurFilter;
    self->_variableBlurFilter = (CAFilter *)v3;
  }
}

- (void)_setUpBlurFilterIfNeeded
{
  if (!self->_blurFilter && self->_overrideBlurOnlyFilter && !self->_variableBlurMaskImage)
  {
    id v3 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    v4 = [(AVCABackdropLayerView *)self _blurRadiusNSNumberValue];
    [v3 setValue:v4 forKey:@"inputRadius"];

    uint64_t v5 = MEMORY[0x1E4F1CC38];
    [v3 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputNormalizeEdges"];
    [v3 setValue:v5 forKey:@"inputHardEdges"];
    [v3 setValue:@"high" forKey:@"inputQuality"];
    [v3 setValue:@"high" forKey:@"inputIntermediateBitDepth"];
    blurFilter = self->_blurFilter;
    self->_blurFilter = (CAFilter *)v3;
  }
}

- (void)setVariableBlurMaskImage:(id)a3
{
  uint64_t v5 = (UIImage *)a3;
  p_variableBlurMaskImage = &self->_variableBlurMaskImage;
  if (self->_variableBlurMaskImage != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_variableBlurMaskImage, a3);
    [(AVCABackdropLayerView *)self _setUpVariableBlurFilterIfNeeded];
    [(AVCABackdropLayerView *)self _updateBlurFilterRadiusIfNeeded];
    [(AVCABackdropLayerView *)self _updateVariableBlurFilterMaskImageIfNeeded];
    p_variableBlurMaskImage = (UIImage **)[(AVCABackdropLayerView *)self _updateFilters];
    uint64_t v5 = v7;
  }

  MEMORY[0x1F41817F8](p_variableBlurMaskImage, v5);
}

- (void)setBlurRadius:(double)a3
{
  float blurRadius = self->_blurRadius;
  float v4 = a3;
  if (vabds_f32(blurRadius, v4) >= 0.00000011921)
  {
    self->_float blurRadius = a3;
    [(AVCABackdropLayerView *)self _setUpBlurFilterIfNeeded];
    [(AVCABackdropLayerView *)self _setUpVariableBlurFilterIfNeeded];
    [(AVCABackdropLayerView *)self _updateBlurFilterRadiusIfNeeded];
    [(AVCABackdropLayerView *)self _updateFilters];
  }
}

- (void)setOverrideBlurOnlyFilter:(BOOL)a3
{
  if (self->_overrideBlurOnlyFilter != a3)
  {
    BOOL v3 = a3;
    self->_overrideBlurOnlyFilter = a3;
    uint64_t v5 = [(AVCABackdropLayerView *)self layer];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v7 = [(AVCABackdropLayerView *)self layer];
      [v7 setShouldOverrideScale:!v3];
    }
    [(AVCABackdropLayerView *)self _setUpBlurFilterIfNeeded];
  }
}

- (void)removeDependent:(id)a3
{
  float v4 = (AVCABackdropLayerView *)a3;
  if (v4 != self)
  {
    uint64_t v7 = v4;
    uint64_t v5 = [(AVCABackdropLayerView *)self groupLeader];

    if (v5 == self)
    {
      [(AVCABackdropLayerView *)self _ensureDependents];
      id v6 = [(AVCABackdropLayerView *)self dependents];
      [v6 removeObject:v7];
    }
    else
    {
      id v6 = [(AVCABackdropLayerView *)self groupLeader];
      [v6 removeDependent:v7];
    }

    float v4 = v7;
  }
}

- (void)addDependent:(id)a3
{
  float v4 = (AVCABackdropLayerView *)a3;
  if (v4 != self)
  {
    uint64_t v7 = v4;
    uint64_t v5 = [(AVCABackdropLayerView *)self groupLeader];

    if (v5 == self)
    {
      [(AVCABackdropLayerView *)self _ensureDependents];
      id v6 = [(AVCABackdropLayerView *)self dependents];
      [v6 addObject:v7];
    }
    else
    {
      id v6 = [(AVCABackdropLayerView *)self groupLeader];
      [v6 addDependent:v7];
    }

    float v4 = v7;
  }
}

- (void)updateGroupLeader
{
  BOOL v3 = [(UIView *)self avkit_backdropGroupLeader];
  [(AVCABackdropLayerView *)self setGroupLeader:v3];

  uint64_t v4 = [(AVCABackdropLayerView *)self window];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = [(AVCABackdropLayerView *)self groupLeader];

    if (!v6)
    {
      [(AVCABackdropLayerView *)self setGroupLeader:self];
    }
  }
}

- (void)setGroupLeader:(id)a3
{
  obj = (AVCABackdropLayerView *)a3;
  id WeakRetained = (AVCABackdropLayerView *)objc_loadWeakRetained((id *)&self->_groupLeader);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = (AVCABackdropLayerView *)objc_loadWeakRetained((id *)&self->_groupLeader);
    BOOL v7 = v6 != self;

    id v8 = objc_loadWeakRetained((id *)&self->_groupLeader);
    [v8 removeDependent:self];

    id v9 = objc_storeWeak((id *)&self->_groupLeader, obj);
    [(AVCABackdropLayerView *)obj addDependent:self];

    if ((((obj == self) ^ v7) & 1) == 0)
    {
      uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      if (obj == self)
      {
        [v10 addObserver:self selector:sel_updateActiveBackdropEffectIfGroupLeader name:*MEMORY[0x1E4FB24A8] object:0];

        [(AVCABackdropLayerView *)self updateActiveBackdropEffectIfGroupLeader];
      }
      else
      {
        [v10 removeObserver:self name:*MEMORY[0x1E4FB24A8] object:0];
      }
    }
    [(AVCABackdropLayerView *)self _updateFilters];
    uint64_t v5 = obj;
  }
}

- (void)setCustomBackgroundColor:(id)a3
{
  uint64_t v4 = (UIColor *)[a3 copy];
  customBackgroundColor = self->_customBackgroundColor;
  self->_customBackgroundColor = v4;

  [(AVCABackdropLayerView *)self _updateFilters];
}

- (void)setCaptureOnly:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AVCABackdropLayerView *)self layer];
  [v4 setCaptureOnly:v3];
}

- (BOOL)isCaptureOnly
{
  v2 = [(AVCABackdropLayerView *)self layer];
  char v3 = [v2 captureOnly];

  return v3;
}

- (void)updateActiveBackdropEffectIfGroupLeader
{
  char v3 = [(AVCABackdropLayerView *)self groupLeader];

  if (v3 == self)
  {
    int64_t v4 = [(AVCABackdropLayerView *)self activeBackdropEffect];
    if (UIAccessibilityIsReduceTransparencyEnabled())
    {
      uint64_t v5 = 3;
    }
    else if ([(AVCABackdropLayerView *)self forceLowQualityEffect])
    {
      uint64_t v5 = 2;
    }
    else
    {
      id v6 = [(AVCABackdropLayerView *)self dependents];
      uint64_t v7 = [v6 count];

      if (v7 < 1)
      {
        uint64_t v5 = 1;
      }
      else
      {
        uint64_t v10 = 0;
        long long v11 = &v10;
        uint64_t v12 = 0x2020000000;
        uint64_t v13 = 0;
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __64__AVCABackdropLayerView_updateActiveBackdropEffectIfGroupLeader__block_invoke;
        v9[3] = &unk_1E5FC3350;
        v9[4] = &v10;
        [(AVCABackdropLayerView *)self _enumerateDependents:v9];
        uint64_t v8 = v11[3];
        if (v8)
        {
          if (v8 <= 2 && [(UIView *)self avkit_isInAScrollView]) {
            uint64_t v5 = 2;
          }
          else {
            uint64_t v5 = 1;
          }
        }
        else
        {
          uint64_t v5 = 0;
        }
        _Block_object_dispose(&v10, 8);
      }
    }
    [(AVCABackdropLayerView *)self setActiveBackdropEffect:v5];
    if (v4 != [(AVCABackdropLayerView *)self activeBackdropEffect]) {
      [(AVCABackdropLayerView *)self _updateFilters];
    }
  }
}

void __64__AVCABackdropLayerView_updateActiveBackdropEffectIfGroupLeader__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _isInAWindow] && (objc_msgSend(v3, "isHidden") & 1) == 0) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)AVCABackdropLayerView;
  [(AVCABackdropLayerView *)&v3 didMoveToSuperview];
  [(AVCABackdropLayerView *)self updateGroupLeader];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)AVCABackdropLayerView;
  [(AVCABackdropLayerView *)&v3 didMoveToWindow];
  [(AVCABackdropLayerView *)self updateGroupLeader];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (AVCABackdropLayerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVCABackdropLayerView;
  objc_super v3 = -[AVCABackdropLayerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  int64_t v4 = v3;
  if (v3)
  {
    v3->_float blurRadius = 50.0;
    [(AVCABackdropLayerView *)v3 setUserInteractionEnabled:0];
  }
  return v4;
}

+ (id)reducedTransparencyColor
{
  if (reducedTransparencyColor_onceToken != -1) {
    dispatch_once(&reducedTransparencyColor_onceToken, &__block_literal_global_24_15475);
  }
  v2 = (void *)reducedTransparencyColor_reducedTransparencyColor;

  return v2;
}

uint64_t __49__AVCABackdropLayerView_reducedTransparencyColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.168627451 green:0.180392157 blue:0.188235294 alpha:1.0];
  uint64_t v1 = reducedTransparencyColor_reducedTransparencyColor;
  reducedTransparencyColor_reducedTransparencyColor = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)colorMatrixFilter
{
  if (colorMatrixFilter_onceToken != -1) {
    dispatch_once(&colorMatrixFilter_onceToken, &__block_literal_global_18_15478);
  }
  v2 = (void *)colorMatrixFilter_colorMatrixFilter;

  return v2;
}

void __42__AVCABackdropLayerView_colorMatrixFilter__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A038]];
  uint64_t v1 = (void *)colorMatrixFilter_colorMatrixFilter;
  colorMatrixFilter_colorMatrixFilter = v0;

  CAColorMatrixMakeSaturation();
  CAColorMatrixMakeColorSourceOver();
  CAColorMatrixMakeColorSourceOver();
  memset(&v4[10], 0, 320);
  CAColorMatrixConcat();
  CAColorMatrixConcat();
  v2 = (void *)colorMatrixFilter_colorMatrixFilter;
  memset(v4, 0, 80);
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCAColorMatrix:", v4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  [v2 setValue:v3 forKey:@"inputColorMatrix"];
}

+ (id)averageFilter
{
  if (averageFilter_onceToken != -1) {
    dispatch_once(&averageFilter_onceToken, &__block_literal_global_16_15484);
  }
  v2 = (void *)averageFilter_averageFilter;

  return v2;
}

uint64_t __38__AVCABackdropLayerView_averageFilter__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F39FD0]];
  uint64_t v1 = averageFilter_averageFilter;
  averageFilter_averageFilter = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)blurFilter
{
  if (blurFilter_onceToken != -1) {
    dispatch_once(&blurFilter_onceToken, &__block_literal_global_15486);
  }
  v2 = (void *)blurFilter_blurFilter;

  return v2;
}

uint64_t __35__AVCABackdropLayerView_blurFilter__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  uint64_t v1 = (void *)blurFilter_blurFilter;
  blurFilter_blurFilter = v0;

  [(id)blurFilter_blurFilter setValue:&unk_1F094A6A8 forKey:@"inputRadius"];
  [(id)blurFilter_blurFilter setValue:MEMORY[0x1E4F1CC38] forKey:@"inputNormalizeEdges"];
  [(id)blurFilter_blurFilter setValue:@"low" forKey:@"inputQuality"];
  v2 = (void *)blurFilter_blurFilter;

  return [v2 setValue:@"low" forKey:@"inputIntermediateBitDepth"];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end