@interface TDCatalogGlobals
- (BOOL)allowsCustomTintColors;
- (BOOL)allowsSystemTintColors;
- (BOOL)allowsVibrancy;
- (BOOL)supportsBrightnessAdjustments;
- (BOOL)supportsMultipleAppearancesForEffects;
- (BOOL)supportsWhitePointAdjustments;
- (id)dictionaryForArchiving;
- (unint64_t)defaultBlendMode;
- (void)setAllowsCustomTintColors:(BOOL)a3;
- (void)setAllowsSystemTintColors:(BOOL)a3;
- (void)setAllowsVibrancy:(BOOL)a3;
- (void)setDefaultBlendMode:(unint64_t)a3;
- (void)setSupportsBrightnessAdjustments:(BOOL)a3;
- (void)setSupportsMultipleAppearancesForEffects:(BOOL)a3;
- (void)setSupportsWhitePointAdjustments:(BOOL)a3;
@end

@implementation TDCatalogGlobals

- (unint64_t)defaultBlendMode
{
  [(TDCatalogGlobals *)self willAccessValueForKey:@"defaultBlendMode"];
  unint64_t defaultBlendMode = self->_defaultBlendMode;
  [(TDCatalogGlobals *)self didAccessValueForKey:@"defaultBlendMode"];
  return defaultBlendMode;
}

- (void)setDefaultBlendMode:(unint64_t)a3
{
  [(TDCatalogGlobals *)self willChangeValueForKey:@"defaultBlendMode"];
  self->_unint64_t defaultBlendMode = a3;

  [(TDCatalogGlobals *)self didChangeValueForKey:@"defaultBlendMode"];
}

- (BOOL)allowsVibrancy
{
  [(TDCatalogGlobals *)self willAccessValueForKey:@"allowsVibrancy"];
  BOOL allowsVibrancy = self->_allowsVibrancy;
  [(TDCatalogGlobals *)self didAccessValueForKey:@"allowsVibrancy"];
  return allowsVibrancy;
}

- (void)setAllowsVibrancy:(BOOL)a3
{
  [(TDCatalogGlobals *)self willChangeValueForKey:@"allowsVibrancy"];
  self->_BOOL allowsVibrancy = a3;

  [(TDCatalogGlobals *)self didChangeValueForKey:@"allowsVibrancy"];
}

- (BOOL)supportsWhitePointAdjustments
{
  [(TDCatalogGlobals *)self willAccessValueForKey:@"supportsWhitePointAdjustments"];
  BOOL supportsBrightnessAdjustments = self->_supportsBrightnessAdjustments;
  [(TDCatalogGlobals *)self didAccessValueForKey:@"supportsWhitePointAdjustments"];
  return supportsBrightnessAdjustments;
}

- (void)setSupportsWhitePointAdjustments:(BOOL)a3
{
  [(TDCatalogGlobals *)self willChangeValueForKey:@"supportsWhitePointAdjustments"];
  self->_BOOL supportsBrightnessAdjustments = a3;

  [(TDCatalogGlobals *)self didChangeValueForKey:@"supportsWhitePointAdjustments"];
}

- (BOOL)supportsBrightnessAdjustments
{
  [(TDCatalogGlobals *)self willAccessValueForKey:@"supportsBrightnessAdjustments"];
  BOOL supportsBrightnessAdjustments = self->_supportsBrightnessAdjustments;
  [(TDCatalogGlobals *)self didAccessValueForKey:@"supportsBrightnessAdjustments"];
  return supportsBrightnessAdjustments;
}

- (void)setSupportsBrightnessAdjustments:(BOOL)a3
{
  [(TDCatalogGlobals *)self willChangeValueForKey:@"supportsBrightnessAdjustments"];
  self->_BOOL supportsBrightnessAdjustments = a3;

  [(TDCatalogGlobals *)self didChangeValueForKey:@"supportsBrightnessAdjustments"];
}

- (BOOL)allowsSystemTintColors
{
  [(TDCatalogGlobals *)self willAccessValueForKey:@"allowsSystemTintColors"];
  BOOL allowsSystemTintColors = self->_allowsSystemTintColors;
  [(TDCatalogGlobals *)self didAccessValueForKey:@"allowsSystemTintColors"];
  return allowsSystemTintColors;
}

- (void)setAllowsSystemTintColors:(BOOL)a3
{
  [(TDCatalogGlobals *)self willChangeValueForKey:@"allowsSystemTintColors"];
  self->_BOOL allowsSystemTintColors = a3;

  [(TDCatalogGlobals *)self didChangeValueForKey:@"allowsSystemTintColors"];
}

- (BOOL)allowsCustomTintColors
{
  [(TDCatalogGlobals *)self willAccessValueForKey:@"allowsCustomTintColors"];
  BOOL allowsCustomTintColors = self->_allowsCustomTintColors;
  [(TDCatalogGlobals *)self didAccessValueForKey:@"allowsCustomTintColors"];
  return allowsCustomTintColors;
}

- (void)setAllowsCustomTintColors:(BOOL)a3
{
  [(TDCatalogGlobals *)self willChangeValueForKey:@"allowsCustomTintColors"];
  self->_BOOL allowsCustomTintColors = a3;

  [(TDCatalogGlobals *)self didChangeValueForKey:@"allowsCustomTintColors"];
}

- (BOOL)supportsMultipleAppearancesForEffects
{
  [(TDCatalogGlobals *)self willAccessValueForKey:@"supportsMultipleAppearancesForEffects"];
  BOOL supportsMultipleAppearancesForEffects = self->_supportsMultipleAppearancesForEffects;
  [(TDCatalogGlobals *)self didAccessValueForKey:@"supportsMultipleAppearancesForEffects"];
  return supportsMultipleAppearancesForEffects;
}

- (void)setSupportsMultipleAppearancesForEffects:(BOOL)a3
{
  [(TDCatalogGlobals *)self willChangeValueForKey:@"supportsMultipleAppearancesForEffects"];
  self->_BOOL supportsMultipleAppearancesForEffects = a3;

  [(TDCatalogGlobals *)self didChangeValueForKey:@"supportsMultipleAppearancesForEffects"];
}

- (id)dictionaryForArchiving
{
  v5[7] = *MEMORY[0x263EF8340];
  v4[0] = @"defaultBlendMode";
  v5[0] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[TDCatalogGlobals defaultBlendMode](self, "defaultBlendMode"));
  v4[1] = @"allowsVibrancy";
  v5[1] = objc_msgSend(NSNumber, "numberWithBool:", -[TDCatalogGlobals allowsVibrancy](self, "allowsVibrancy"));
  v4[2] = @"supportsWhitePointAdjustments";
  v5[2] = objc_msgSend(NSNumber, "numberWithBool:", -[TDCatalogGlobals supportsWhitePointAdjustments](self, "supportsWhitePointAdjustments"));
  v4[3] = @"supportsBrightnessAdjustments";
  v5[3] = objc_msgSend(NSNumber, "numberWithBool:", -[TDCatalogGlobals supportsBrightnessAdjustments](self, "supportsBrightnessAdjustments"));
  v4[4] = @"allowsSystemTintColors";
  v5[4] = objc_msgSend(NSNumber, "numberWithBool:", -[TDCatalogGlobals allowsSystemTintColors](self, "allowsSystemTintColors"));
  v4[5] = @"allowsCustomTintColors";
  v5[5] = objc_msgSend(NSNumber, "numberWithBool:", -[TDCatalogGlobals allowsCustomTintColors](self, "allowsCustomTintColors"));
  v4[6] = @"supportsMultipleAppearancesForEffects";
  v5[6] = objc_msgSend(NSNumber, "numberWithBool:", -[TDCatalogGlobals supportsMultipleAppearancesForEffects](self, "supportsMultipleAppearancesForEffects"));
  return (id)[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
}

@end