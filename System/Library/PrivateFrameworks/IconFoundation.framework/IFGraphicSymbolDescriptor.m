@interface IFGraphicSymbolDescriptor
- (BOOL)_addDarkModeBorder;
- (BOOL)_addLightModeBorder;
- (BOOL)_isDebugGraphicIconColourEnabled;
- (BOOL)debugColourSet;
- (BOOL)flipXOffsetOverride;
- (BOOL)isExtendedAppearanceVariant;
- (CGSize)size;
- (CGSize)symbolOffset;
- (IFColor)resolvedBorderColor;
- (IFColor)tintColor;
- (IFGraphicSymbolDescriptor)init;
- (IFGraphicSymbolOverride)symbolOverride;
- (NSArray)_processedEnclosureColors;
- (NSArray)_processedSymbolColors;
- (NSArray)enclosureColors;
- (NSArray)resolvedEnclosureColors;
- (NSArray)resolvedSymbolColors;
- (NSArray)symbolColors;
- (NSString)name;
- (NSString)resolvedName;
- (double)pointSize;
- (double)resolvedBorderWidth;
- (id)_colorForIFSystemColor:(int64_t)a3;
- (id)_debugDynamicGraphicIconColor;
- (id)_defaultEnclosureColor;
- (id)_defaultSymbolColor;
- (id)_resolvedColorsForColors:(id)a3 defaultColor:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)appearance;
- (int64_t)appearanceVariant;
- (int64_t)contrast;
- (int64_t)enclosureEffect;
- (int64_t)fill;
- (int64_t)renderingMode;
- (int64_t)resolvedFill;
- (int64_t)resolvedRenderingModeFromSuggestedMode:(int64_t)a3;
- (int64_t)resolvedShape;
- (int64_t)shape;
- (int64_t)symbolEffect;
- (int64_t)symbolWeight;
- (int64_t)vibrancy;
- (unint64_t)platform;
- (unint64_t)symbolSize;
- (void)checkForSymbolOverride;
- (void)pointSize;
- (void)setAppearance:(int64_t)a3;
- (void)setAppearanceVariant:(int64_t)a3;
- (void)setContrast:(int64_t)a3;
- (void)setDebugColourSet:(BOOL)a3;
- (void)setEnclosureColors:(id)a3;
- (void)setEnclosureEffect:(int64_t)a3;
- (void)setFill:(int64_t)a3;
- (void)setFlipXOffsetOverride:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPlatform:(unint64_t)a3;
- (void)setRenderingMode:(int64_t)a3;
- (void)setResolvedBorderColor:(id)a3;
- (void)setResolvedBorderWidth:(double)a3;
- (void)setResolvedEnclosureColors:(id)a3;
- (void)setResolvedEnclosureEffect:(int64_t)a3;
- (void)setResolvedFill:(int64_t)a3;
- (void)setResolvedName:(id)a3;
- (void)setResolvedShape:(int64_t)a3;
- (void)setResolvedSymbolColors:(id)a3;
- (void)setResolvedSymbolEffect:(int64_t)a3;
- (void)setShape:(int64_t)a3;
- (void)setSize:(CGSize)a3;
- (void)setSymbolColors:(id)a3;
- (void)setSymbolEffect:(int64_t)a3;
- (void)setSymbolOffset:(CGSize)a3;
- (void)setSymbolOverride:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setVibrancy:(int64_t)a3;
- (void)set_processedEnclosureColors:(id)a3;
- (void)set_processedSymbolColors:(id)a3;
- (void)symbolOffset;
- (void)symbolSize;
- (void)symbolWeight;
@end

@implementation IFGraphicSymbolDescriptor

- (IFGraphicSymbolDescriptor)init
{
  v8.receiver = self;
  v8.super_class = (Class)IFGraphicSymbolDescriptor;
  v2 = [(IFSymbolImageDescriptor *)&v8 init];
  v3 = (IFGraphicSymbolDescriptor *)v2;
  if (v2)
  {
    *(int64x2_t *)(v2 + 264) = vdupq_n_s64(0x4040000000000000uLL);
    *((void *)v2 + 25) = 0;
    *((void *)v2 + 26) = 0;
    *((void *)v2 + 27) = 0;
    *((void *)v2 + 31) = 0;
    v4 = (void *)*((void *)v2 + 30);
    *((void *)v2 + 30) = 0;

    name = v3->_name;
    v3->_name = 0;

    v6 = +[IFPlatformInfo sharedInstance];
    v3->_platform = [v6 nativePlatform];

    [(IFSymbolImageDescriptor *)v3 setPointSize:0.0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)IFGraphicSymbolDescriptor;
  v4 = [(IFSymbolImageDescriptor *)&v12 copyWithZone:a3];
  *(CGSize *)(v4 + 264) = self->_size;
  uint64_t v5 = [(NSArray *)self->_enclosureColors copy];
  v6 = (void *)*((void *)v4 + 9);
  *((void *)v4 + 9) = v5;

  uint64_t v7 = [(NSArray *)self->_symbolColors copy];
  objc_super v8 = (void *)*((void *)v4 + 10);
  *((void *)v4 + 10) = v7;

  *((void *)v4 + 11) = self->_renderingMode;
  uint64_t v9 = [(NSString *)self->_name copy];
  v10 = (void *)*((void *)v4 + 24);
  *((void *)v4 + 24) = v9;

  *((void *)v4 + 25) = self->_appearance;
  *((void *)v4 + 26) = self->_contrast;
  *((void *)v4 + 27) = self->_vibrancy;
  *(CGSize *)(v4 + 280) = self->_symbolOffset;
  *((void *)v4 + 28) = self->_symbolEffect;
  *((void *)v4 + 29) = self->_enclosureEffect;
  *((void *)v4 + 8) = self->_shape;
  *((void *)v4 + 12) = self->_fill;
  v4[49] = self->_debugColourSet;
  return v4;
}

- (BOOL)_isDebugGraphicIconColourEnabled
{
  if (_isDebugGraphicIconColourEnabled_once != -1) {
    dispatch_once(&_isDebugGraphicIconColourEnabled_once, &__block_literal_global_45);
  }
  return _isDebugGraphicIconColourEnabled_result;
}

void __61__IFGraphicSymbolDescriptor__isDebugGraphicIconColourEnabled__block_invoke()
{
  if (os_variant_has_internal_content())
  {
    v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v1 = [v0 BOOLForKey:@"ISDebugGraphicIcons"];

    if (v1) {
      _isDebugGraphicIconColourEnabled_result = 1;
    }
  }
}

- (id)_debugDynamicGraphicIconColor
{
  if (_debugDynamicGraphicIconColor_once != -1) {
    dispatch_once(&_debugDynamicGraphicIconColor_once, &__block_literal_global_52);
  }
  v2 = (void *)_debugDynamicGraphicIconColor_color;

  return v2;
}

uint64_t __58__IFGraphicSymbolDescriptor__debugDynamicGraphicIconColor__block_invoke()
{
  _debugDynamicGraphicIconColor_color = [[IFColor alloc] initWithRed:225.0 green:225.0 blue:230.0 alpha:255.0];

  return MEMORY[0x1F41817F8]();
}

- (id)_colorForIFSystemColor:(int64_t)a3
{
  v3 = [[IFColor alloc] initWithSystemColor:a3 appearance:[(IFGraphicSymbolDescriptor *)self appearance] contrast:[(IFGraphicSymbolDescriptor *)self contrast] vibrancy:[(IFGraphicSymbolDescriptor *)self vibrancy]];

  return v3;
}

- (id)_resolvedColorsForColors:(id)a3 defaultColor:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(void))a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v22;
    *(void *)&long long v10 = 138412290;
    long long v19 = v10;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v14;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            -[IFGraphicSymbolDescriptor _colorForIFSystemColor:](self, "_colorForIFSystemColor:", (int)[v14 intValue]);
            id v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = IFDefaultLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v19;
              v26 = v14;
              _os_log_debug_impl(&dword_1DC6CA000, v16, OS_LOG_TYPE_DEBUG, "Unexpected color %@", buf, 0xCu);
            }

            v6[2](v6);
            id v15 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        v17 = v15;
        objc_msgSend(v7, "addObject:", v15, v19);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v11);
  }

  return v7;
}

- (id)_defaultSymbolColor
{
  enclosureColors = self->_enclosureColors;
  if (enclosureColors && [(NSArray *)enclosureColors count])
  {
    v4 = +[IFGraphicSymbolDefaults sharedInstance];
    uint64_t v5 = [v4 symbolColorAlternate];
  }
  else
  {
    v4 = +[IFGraphicSymbolDefaults sharedInstance];
    uint64_t v5 = [v4 symbolColor];
  }
  v6 = [(IFGraphicSymbolDescriptor *)self _colorForIFSystemColor:v5];

  return v6;
}

- (id)_defaultEnclosureColor
{
  symbolColors = self->_symbolColors;
  if (symbolColors && [(NSArray *)symbolColors count])
  {
    v4 = +[IFGraphicSymbolDefaults sharedInstance];
    uint64_t v5 = [v4 enclosureColorAlternate];
  }
  else
  {
    v4 = +[IFGraphicSymbolDefaults sharedInstance];
    uint64_t v5 = [v4 enclosureColor];
  }
  v6 = [(IFGraphicSymbolDescriptor *)self _colorForIFSystemColor:v5];

  return v6;
}

- (NSArray)_processedSymbolColors
{
  v9[1] = *MEMORY[0x1E4F143B8];
  symbolColors = self->_symbolColors;
  if (symbolColors && [(NSArray *)symbolColors count])
  {
    v4 = self->_symbolColors;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__IFGraphicSymbolDescriptor__processedSymbolColors__block_invoke;
    v8[3] = &unk_1E6C9C340;
    v8[4] = self;
    uint64_t v5 = [(IFGraphicSymbolDescriptor *)self _resolvedColorsForColors:v4 defaultColor:v8];
  }
  else
  {
    v6 = [(IFGraphicSymbolDescriptor *)self _defaultSymbolColor];
    v9[0] = v6;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }

  return (NSArray *)v5;
}

uint64_t __51__IFGraphicSymbolDescriptor__processedSymbolColors__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _defaultSymbolColor];
}

- (NSArray)_processedEnclosureColors
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if ([(IFGraphicSymbolDescriptor *)self _isDebugGraphicIconColourEnabled]
    && ![(IFGraphicSymbolDescriptor *)self debugColourSet]
    && ([(IFGraphicSymbolDescriptor *)self _debugDynamicGraphicIconColor],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    v13[0] = v3;
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = (void **)v13;
  }
  else
  {
    enclosureColors = self->_enclosureColors;
    if (enclosureColors && [(NSArray *)enclosureColors count])
    {
      id v8 = self->_enclosureColors;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __54__IFGraphicSymbolDescriptor__processedEnclosureColors__block_invoke;
      v11[3] = &unk_1E6C9C340;
      v11[4] = self;
      uint64_t v9 = [(IFGraphicSymbolDescriptor *)self _resolvedColorsForColors:v8 defaultColor:v11];
      goto LABEL_10;
    }
    v4 = [(IFGraphicSymbolDescriptor *)self _defaultEnclosureColor];
    uint64_t v12 = v4;
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = &v12;
  }
  uint64_t v9 = [v5 arrayWithObjects:v6 count:1];

LABEL_10:

  return (NSArray *)v9;
}

uint64_t __54__IFGraphicSymbolDescriptor__processedEnclosureColors__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _defaultEnclosureColor];
}

- (NSArray)resolvedSymbolColors
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if ([(IFGraphicSymbolDescriptor *)self appearanceVariant] == 1)
  {
    if ([(IFGraphicSymbolDescriptor *)self appearance] == 1)
    {
      uint64_t v3 = [(IFGraphicSymbolDescriptor *)self _processedEnclosureColors];
      if ([v3 count] == 1)
      {
        v4 = [v3 objectAtIndexedSubscript:0];
        uint64_t v5 = +[IFColor white];
        if ([v4 isEqual:v5])
        {

LABEL_10:
          uint64_t v7 = [(IFGraphicSymbolDescriptor *)self _processedSymbolColors];
          goto LABEL_12;
        }
        id v8 = [v3 objectAtIndexedSubscript:0];
        uint64_t v9 = +[IFColor black];
        int v10 = [v8 isEqual:v9];

        if (v10) {
          goto LABEL_10;
        }
      }
      uint64_t v7 = [(IFGraphicSymbolDescriptor *)self _processedEnclosureColors];
      goto LABEL_12;
    }
    if ([(IFGraphicSymbolDescriptor *)self appearance] == 2)
    {
      v6 = [(IFGraphicSymbolDescriptor *)self tintColor];

      if (v6)
      {
        uint64_t v3 = [(IFGraphicSymbolDescriptor *)self tintColor];
        v15[0] = v3;
        uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
LABEL_12:
        uint64_t v11 = (void *)v7;

        goto LABEL_17;
      }
      uint64_t v12 = IFDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1DC6CA000, v12, OS_LOG_TYPE_INFO, "No tint colour set for tintable request", v14, 2u);
      }
    }
  }
  uint64_t v11 = [(IFGraphicSymbolDescriptor *)self _processedSymbolColors];
LABEL_17:

  return (NSArray *)v11;
}

- (NSArray)resolvedEnclosureColors
{
  v7[2] = *MEMORY[0x1E4F143B8];
  if ([(IFGraphicSymbolDescriptor *)self isExtendedAppearanceVariant])
  {
    uint64_t v3 = [[IFColor alloc] initWithRed:0.1922 green:0.1922 blue:0.1922 alpha:1.0];
    v4 = [[IFColor alloc] initWithRed:0.0784 green:0.0784 blue:0.0784 alpha:1.0];
    v7[0] = v3;
    v7[1] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  }
  else
  {
    uint64_t v5 = [(IFGraphicSymbolDescriptor *)self _processedEnclosureColors];
  }

  return (NSArray *)v5;
}

- (int64_t)resolvedRenderingModeFromSuggestedMode:(int64_t)a3
{
  int64_t v5 = [(IFGraphicSymbolDescriptor *)self renderingMode] - 2;
  int64_t result = 1;
  switch(v5)
  {
    case 0:
      int64_t result = 3;
      break;
    case 1:
      return result;
    case 2:
      if ([(IFGraphicSymbolDescriptor *)self appearance] != 2
        || (int64_t result = [(IFGraphicSymbolDescriptor *)self appearanceVariant], result != 1))
      {
        int64_t result = 2;
      }
      break;
    case 3:
      int64_t result = 4;
      break;
    default:
      if ((unint64_t)(a3 - 1) >= 3) {
        int64_t result = 1;
      }
      else {
        int64_t result = a3;
      }
      break;
  }
  return result;
}

- (int64_t)resolvedShape
{
  int64_t v2 = [(IFGraphicSymbolDescriptor *)self shape];
  if (v2 == 3) {
    return 2;
  }
  else {
    return v2 == 2;
  }
}

- (int64_t)fill
{
  if (!self->_fill)
  {
    if ([(IFGraphicSymbolDescriptor *)self platform] == 1
      || [(IFGraphicSymbolDescriptor *)self platform] == 2)
    {
      int64_t v3 = 2;
    }
    else
    {
      unint64_t v4 = [(IFGraphicSymbolDescriptor *)self platform];
      int64_t v3 = 1;
      if (v4 == 16) {
        int64_t v3 = 2;
      }
    }
    self->_fill = v3;
  }
  if ([(IFGraphicSymbolDescriptor *)self isExtendedAppearanceVariant]) {
    return 4;
  }
  else {
    return self->_fill;
  }
}

- (int64_t)resolvedFill
{
  int64_t v2 = [(IFGraphicSymbolDescriptor *)self fill];
  if ((unint64_t)(v2 - 2) >= 3) {
    return 0;
  }
  else {
    return v2 - 1;
  }
}

- (int64_t)symbolEffect
{
  int64_t result = [(IFGraphicSymbolDescriptor *)self platform];
  if (result != 1) {
    return [(IFGraphicSymbolDescriptor *)self platform] == 2;
  }
  return result;
}

- (int64_t)enclosureEffect
{
  int64_t result = [(IFGraphicSymbolDescriptor *)self platform];
  if (result != 1) {
    return [(IFGraphicSymbolDescriptor *)self platform] == 2;
  }
  return result;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);

  [(IFGraphicSymbolDescriptor *)self checkForSymbolOverride];
}

- (void)setResolvedName:(id)a3
{
  objc_storeStrong((id *)&self->_resolvedName, a3);

  [(IFGraphicSymbolDescriptor *)self checkForSymbolOverride];
}

- (NSString)resolvedName
{
  resolvedName = self->_resolvedName;
  if (resolvedName)
  {
    int64_t v3 = resolvedName;
  }
  else
  {
    int64_t v3 = [(IFGraphicSymbolDescriptor *)self name];
  }

  return v3;
}

- (BOOL)_addLightModeBorder
{
  if (([(IFGraphicSymbolDescriptor *)self platform] & 0x3C) == 0) {
    return 0;
  }
  if ([(IFGraphicSymbolDescriptor *)self fill] != 1) {
    return 0;
  }
  if ([(IFGraphicSymbolDescriptor *)self appearance]) {
    return 0;
  }
  int64_t v3 = [(IFGraphicSymbolDescriptor *)self _processedEnclosureColors];
  unint64_t v4 = [v3 objectAtIndexedSubscript:0];
  int64_t v5 = +[IFColor white];
  char v6 = [v4 isEqual:v5];

  return (v6 & 1) != 0;
}

- (BOOL)_addDarkModeBorder
{
  if (([(IFGraphicSymbolDescriptor *)self platform] & 0x3C) == 0) {
    return 0;
  }
  if ([(IFGraphicSymbolDescriptor *)self fill] == 1
    && [(IFGraphicSymbolDescriptor *)self appearance] == 1)
  {
    int64_t v3 = [(IFGraphicSymbolDescriptor *)self _processedEnclosureColors];
    unint64_t v4 = [v3 objectAtIndexedSubscript:0];
    int64_t v5 = +[IFColor black];
    char v6 = [v4 isEqual:v5];

    if (v6) {
      return 1;
    }
  }
  return [(IFGraphicSymbolDescriptor *)self isExtendedAppearanceVariant];
}

- (double)resolvedBorderWidth
{
  if ([(IFGraphicSymbolDescriptor *)self _addLightModeBorder]
    || (v4 = [(IFGraphicSymbolDescriptor *)self _addDarkModeBorder], double result = 0.0, v4))
  {
    [(IFSymbolImageDescriptor *)self scale];
    return 1.0 / v5;
  }
  return result;
}

- (IFColor)resolvedBorderColor
{
  if ([(IFGraphicSymbolDescriptor *)self _addLightModeBorder]
    || [(IFGraphicSymbolDescriptor *)self _addDarkModeBorder])
  {
    int64_t v3 = +[IFColor borderColorForAppearance:[(IFGraphicSymbolDescriptor *)self appearance]];
  }
  else
  {
    int64_t v3 = 0;
  }

  return (IFColor *)v3;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
  [(IFGraphicSymbolDescriptor *)self checkForSymbolOverride];
}

- (int64_t)shape
{
  int64_t result = self->_shape;
  if (!result)
  {
    if ([(IFGraphicSymbolDescriptor *)self platform] == 8)
    {
      int64_t result = 2;
    }
    else if ([(IFGraphicSymbolDescriptor *)self platform] == 16)
    {
      int64_t result = 2;
    }
    else
    {
      int64_t result = 1;
    }
    self->_shape = result;
  }
  return result;
}

- (void)setShape:(int64_t)a3
{
  self->_shape = a3;
  [(IFGraphicSymbolDescriptor *)self checkForSymbolOverride];
}

- (void)checkForSymbolOverride
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [a1 symbolOverride];
  OUTLINED_FUNCTION_1();
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
}

- (double)pointSize
{
  int64_t v3 = [(IFGraphicSymbolDescriptor *)self symbolOverride];
  [v3 pointSizeAdjuster];
  float v5 = v4;

  if (v5 <= 0.0)
  {
    v18.receiver = self;
    v18.super_class = (Class)IFGraphicSymbolDescriptor;
    [(IFSymbolImageDescriptor *)&v18 pointSize];
    if (v12 >= 1.0)
    {
      v17.receiver = self;
      v17.super_class = (Class)IFGraphicSymbolDescriptor;
      [(IFSymbolImageDescriptor *)&v17 pointSize];
      return v15;
    }
    [(IFGraphicSymbolDescriptor *)self size];
    double v8 = v13;
    __int16 v9 = +[IFGraphicSymbolDefaults sharedInstance];
    [v9 enclosureSizeMultiplier];
  }
  else
  {
    char v6 = IFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[IFGraphicSymbolDescriptor pointSize](self);
    }

    [(IFGraphicSymbolDescriptor *)self size];
    double v8 = v7;
    __int16 v9 = [(IFGraphicSymbolDescriptor *)self symbolOverride];
    [v9 pointSizeAdjuster];
    double v11 = v10;
  }
  double v14 = v8 / v11;

  return v14;
}

- (unint64_t)symbolSize
{
  int64_t v3 = [(IFGraphicSymbolDescriptor *)self symbolOverride];
  uint64_t v4 = [v3 symbolSize];

  if (v4)
  {
    float v5 = IFDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[IFGraphicSymbolDescriptor symbolSize](self);
    }

    char v6 = [(IFGraphicSymbolDescriptor *)self symbolOverride];
    unint64_t v7 = [v6 symbolSize];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)IFGraphicSymbolDescriptor;
    return [(IFSymbolImageDescriptor *)&v9 symbolSize];
  }
  return v7;
}

- (int64_t)symbolWeight
{
  int64_t v3 = [(IFGraphicSymbolDescriptor *)self symbolOverride];
  uint64_t v4 = [v3 symbolWeight];

  if (v4)
  {
    float v5 = IFDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[IFGraphicSymbolDescriptor symbolWeight](self);
    }

    char v6 = [(IFGraphicSymbolDescriptor *)self symbolOverride];
    int64_t v7 = [v6 symbolWeight];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)IFGraphicSymbolDescriptor;
    return [(IFSymbolImageDescriptor *)&v9 symbolWeight];
  }
  return v7;
}

- (CGSize)symbolOffset
{
  int64_t v3 = [(IFGraphicSymbolDescriptor *)self symbolOverride];
  [v3 offset];
  double v5 = v4;
  double v7 = v6;
  double v8 = *MEMORY[0x1E4F1DB30];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

  if (v5 == v8 && v7 == v9)
  {
    double width = self->_symbolOffset.width;
    CGFloat height = self->_symbolOffset.height;
  }
  else
  {
    double v11 = IFDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[IFGraphicSymbolDescriptor symbolOffset](self);
    }

    double v12 = [(IFGraphicSymbolDescriptor *)self symbolOverride];
    [v12 offset];
    double v14 = v13;
    CGFloat height = v15;

    BOOL v17 = [(IFGraphicSymbolDescriptor *)self flipXOffsetOverride];
    double width = -v14;
    if (!v17) {
      double width = v14;
    }
  }
  double v19 = height;
  result.CGFloat height = v19;
  result.double width = width;
  return result;
}

- (BOOL)isExtendedAppearanceVariant
{
  if ([(IFGraphicSymbolDescriptor *)self appearanceVariant] != 1) {
    goto LABEL_5;
  }
  int64_t v3 = [(IFGraphicSymbolDescriptor *)self appearance];
  if (v3 != 1)
  {
    if ([(IFGraphicSymbolDescriptor *)self appearance] == 2)
    {
      LOBYTE(v3) = 1;
      return v3;
    }
LABEL_5:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)description
{
  int64_t v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)IFGraphicSymbolDescriptor;
  double v4 = [(IFGraphicSymbolDescriptor *)&v12 description];
  [(IFGraphicSymbolDescriptor *)self size];
  uint64_t v6 = v5;
  [(IFGraphicSymbolDescriptor *)self size];
  uint64_t v8 = v7;
  [(IFSymbolImageDescriptor *)self scale];
  float v10 = [v3 stringWithFormat:@"%@ - (%0.2f, %0.2f)@%.0fx", v4, v6, v8, v9];

  return v10;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSArray)enclosureColors
{
  return self->_enclosureColors;
}

- (void)setEnclosureColors:(id)a3
{
}

- (NSArray)symbolColors
{
  return self->_symbolColors;
}

- (void)setSymbolColors:(id)a3
{
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (void)setRenderingMode:(int64_t)a3
{
  self->_renderingMode = a3;
}

- (void)setFill:(int64_t)a3
{
  self->_fill = a3;
}

- (void)setResolvedShape:(int64_t)a3
{
  self->_resolvedShape = a3;
}

- (void)setResolvedSymbolEffect:(int64_t)a3
{
  self->_resolvedSymbolEffect = a3;
}

- (void)setResolvedEnclosureEffect:(int64_t)a3
{
  self->_resolvedEnclosureEffect = a3;
}

- (void)setResolvedFill:(int64_t)a3
{
  self->_resolvedFill = a3;
}

- (void)set_processedSymbolColors:(id)a3
{
}

- (void)set_processedEnclosureColors:(id)a3
{
}

- (void)setResolvedSymbolColors:(id)a3
{
}

- (void)setResolvedEnclosureColors:(id)a3
{
}

- (void)setResolvedBorderWidth:(double)a3
{
  self->_resolvedBorderWidth = a3;
}

- (void)setResolvedBorderColor:(id)a3
{
}

- (IFGraphicSymbolOverride)symbolOverride
{
  return (IFGraphicSymbolOverride *)objc_getProperty(self, a2, 184, 1);
}

- (void)setSymbolOverride:(id)a3
{
}

- (BOOL)flipXOffsetOverride
{
  return self->_flipXOffsetOverride;
}

- (void)setFlipXOffsetOverride:(BOOL)a3
{
  self->_flipXOffsetOverride = a3;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(int64_t)a3
{
  self->_appearance = a3;
}

- (int64_t)contrast
{
  return self->_contrast;
}

- (void)setContrast:(int64_t)a3
{
  self->_contrast = a3;
}

- (int64_t)vibrancy
{
  return self->_vibrancy;
}

- (void)setVibrancy:(int64_t)a3
{
  self->_vibrancy = a3;
}

- (void)setSymbolOffset:(CGSize)a3
{
  self->_symbolOffset = a3;
}

- (void)setSymbolEffect:(int64_t)a3
{
  self->_symbolEffect = a3;
}

- (void)setEnclosureEffect:(int64_t)a3
{
  self->_enclosureEffect = a3;
}

- (BOOL)debugColourSet
{
  return self->_debugColourSet;
}

- (void)setDebugColourSet:(BOOL)a3
{
  self->_debugColourSet = a3;
}

- (IFColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (int64_t)appearanceVariant
{
  return self->_appearanceVariant;
}

- (void)setAppearanceVariant:(int64_t)a3
{
  self->_appearanceVariant = a3;
}

- (unint64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(unint64_t)a3
{
  self->_platform = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_symbolOverride, 0);
  objc_storeStrong((id *)&self->_resolvedBorderColor, 0);
  objc_storeStrong((id *)&self->_resolvedEnclosureColors, 0);
  objc_storeStrong((id *)&self->_resolvedSymbolColors, 0);
  objc_storeStrong((id *)&self->__processedEnclosureColors, 0);
  objc_storeStrong((id *)&self->__processedSymbolColors, 0);
  objc_storeStrong((id *)&self->_symbolColors, 0);
  objc_storeStrong((id *)&self->_enclosureColors, 0);

  objc_storeStrong((id *)&self->_resolvedName, 0);
}

- (void)pointSize
{
  int v1 = [a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC6CA000, v2, v3, "Found point size override for %@", v4, v5, v6, v7, v8);
}

- (void)symbolSize
{
  int v1 = [a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC6CA000, v2, v3, "Found symbol size override for %@", v4, v5, v6, v7, v8);
}

- (void)symbolWeight
{
  int v1 = [a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC6CA000, v2, v3, "Found symbol weight override for %@", v4, v5, v6, v7, v8);
}

- (void)symbolOffset
{
  int v1 = [a1 name];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC6CA000, v2, v3, "Found offset override for %@", v4, v5, v6, v7, v8);
}

@end