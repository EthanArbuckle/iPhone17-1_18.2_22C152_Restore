@interface ASCSemanticColor
+ (id)artworkBorder;
+ (id)artworkPlaceholder;
+ (id)artworkSymbolTint;
+ (id)loading;
+ (uint64_t)primaryLabel;
+ (uint64_t)secondaryLabel;
+ (uint64_t)tint;
@end

@implementation ASCSemanticColor

+ (uint64_t)tint
{
  self;
  v0 = (void *)MEMORY[0x1E4FB1618];

  return [v0 systemBlueColor];
}

+ (uint64_t)primaryLabel
{
  self;
  v0 = (void *)MEMORY[0x1E4FB1618];

  return [v0 labelColor];
}

+ (uint64_t)secondaryLabel
{
  self;
  v0 = (void *)MEMORY[0x1E4FB1618];

  return [v0 secondaryLabelColor];
}

+ (id)artworkPlaceholder
{
  self;
  if (artworkPlaceholder_onceToken != -1) {
    dispatch_once(&artworkPlaceholder_onceToken, &__block_literal_global_25);
  }
  v0 = (void *)artworkPlaceholder_defaultPlaceholderColor;

  return v0;
}

void __38__ASCSemanticColor_artworkPlaceholder__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4FB1618];
  id v4 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  v1 = [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
  uint64_t v2 = objc_msgSend(v0, "asc_colorWithLightColor:darkColor:", v4, v1);
  v3 = (void *)artworkPlaceholder_defaultPlaceholderColor;
  artworkPlaceholder_defaultPlaceholderColor = v2;
}

+ (id)artworkBorder
{
  self;
  if (artworkBorder_onceToken != -1) {
    dispatch_once(&artworkBorder_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)artworkBorder_borderColor;

  return v0;
}

void __33__ASCSemanticColor_artworkBorder__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4FB1618];
  id v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.08];
  v1 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.08];
  uint64_t v2 = objc_msgSend(v0, "asc_colorWithLightColor:darkColor:", v4, v1);
  v3 = (void *)artworkBorder_borderColor;
  artworkBorder_borderColor = v2;
}

+ (id)artworkSymbolTint
{
  self;
  if (artworkSymbolTint_onceToken != -1) {
    dispatch_once(&artworkSymbolTint_onceToken, &__block_literal_global_4_0);
  }
  v0 = (void *)artworkSymbolTint_symbolTintColor;

  return v0;
}

void __37__ASCSemanticColor_artworkSymbolTint__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4FB1618];
  id v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.32];
  v1 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.32];
  uint64_t v2 = objc_msgSend(v0, "asc_colorWithLightColor:darkColor:", v4, v1);
  v3 = (void *)artworkSymbolTint_symbolTintColor;
  artworkSymbolTint_symbolTintColor = v2;
}

+ (id)loading
{
  self;

  return +[ASCSemanticColor artworkPlaceholder]();
}

@end