@interface IFGraphicSymbolDefaults
+ (id)sharedInstance;
- (IFGraphicSymbolDefaults)init;
- (NSString)symbolName;
- (double)enclosureSizeMultiplier;
- (int64_t)enclosureColor;
- (int64_t)enclosureColorAlternate;
- (int64_t)renderingMode;
- (int64_t)symbolColor;
- (int64_t)symbolColorAlternate;
@end

@implementation IFGraphicSymbolDefaults

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;

  return v2;
}

uint64_t __41__IFGraphicSymbolDefaults_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = objc_alloc_init(IFGraphicSymbolDefaults);

  return MEMORY[0x1F41817F8]();
}

- (IFGraphicSymbolDefaults)init
{
  v7.receiver = self;
  v7.super_class = (Class)IFGraphicSymbolDefaults;
  v2 = [(IFGraphicSymbolDefaults *)&v7 init];
  v3 = v2;
  if (v2)
  {
    symbolName = v2->_symbolName;
    v2->_symbolName = (NSString *)@"questionmark.app.dashed";

    *(_OWORD *)&v3->_renderingMode = xmmword_1DC701EB0;
    *(int64x2_t *)&v3->_symbolColorAlternate = vdupq_n_s64(7uLL);
    v3->_enclosureColorAlternate = 11;
    [MEMORY[0x1E4F5E090] defaultSymbolPointSizeRatio];
    v3->_enclosureSizeMultiplier = v5;
  }
  return v3;
}

- (NSString)symbolName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (int64_t)symbolColor
{
  return self->_symbolColor;
}

- (int64_t)symbolColorAlternate
{
  return self->_symbolColorAlternate;
}

- (int64_t)enclosureColor
{
  return self->_enclosureColor;
}

- (int64_t)enclosureColorAlternate
{
  return self->_enclosureColorAlternate;
}

- (double)enclosureSizeMultiplier
{
  return self->_enclosureSizeMultiplier;
}

- (void).cxx_destruct
{
}

@end