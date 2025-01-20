@interface PKPaletteConcreteBaseTool
- (BOOL)isCustomTool;
- (BOOL)isErasingTool;
- (BOOL)isGenerationTool;
- (BOOL)isHandwritingTool;
- (BOOL)isInkingTool;
- (BOOL)isLassoTool;
- (BOOL)isRulerTool;
- (NSString)toolIdentifier;
- (NSString)toolVariant;
- (PKPaletteErasingTool)erasingTool;
- (PKPaletteHandwritingTool)handwritingTool;
- (PKPaletteInkingTool)inkingTool;
- (PKToolConfiguration)configuration;
@end

@implementation PKPaletteConcreteBaseTool

- (NSString)toolIdentifier
{
  return (NSString *)@"com.apple.ink.pen";
}

- (PKToolConfiguration)configuration
{
  cachedConfiguration = self->_cachedConfiguration;
  if (!cachedConfiguration)
  {
    v4 = [(PKPaletteConcreteBaseTool *)self toolIdentifier];
    v5 = +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:v4];
    v6 = self->_cachedConfiguration;
    self->_cachedConfiguration = v5;

    cachedConfiguration = self->_cachedConfiguration;
  }

  return cachedConfiguration;
}

- (BOOL)isInkingTool
{
  return [(PKPaletteConcreteBaseTool *)self conformsToProtocol:&unk_1F204ABD8];
}

- (PKPaletteInkingTool)inkingTool
{
  if ([(PKPaletteConcreteBaseTool *)self isInkingTool]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }

  return (PKPaletteInkingTool *)v3;
}

- (BOOL)isRulerTool
{
  v2 = [(PKPaletteConcreteBaseTool *)self toolIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.tool.ruler"];

  return v3;
}

- (BOOL)isErasingTool
{
  return [(PKPaletteConcreteBaseTool *)self conformsToProtocol:&unk_1F2061A40];
}

- (PKPaletteErasingTool)erasingTool
{
  if ([(PKPaletteConcreteBaseTool *)self isErasingTool]) {
    char v3 = self;
  }
  else {
    char v3 = 0;
  }

  return (PKPaletteErasingTool *)v3;
}

- (BOOL)isLassoTool
{
  return [(PKPaletteConcreteBaseTool *)self conformsToProtocol:&unk_1F2076AF0];
}

- (BOOL)isGenerationTool
{
  v2 = [(PKPaletteConcreteBaseTool *)self toolIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.ink.generationtool"];

  return v3;
}

- (BOOL)isHandwritingTool
{
  return 0;
}

- (PKPaletteHandwritingTool)handwritingTool
{
  if ([(PKPaletteConcreteBaseTool *)self isHandwritingTool]) {
    char v3 = self;
  }
  else {
    char v3 = 0;
  }

  return (PKPaletteHandwritingTool *)v3;
}

- (BOOL)isCustomTool
{
  v2 = [(PKPaletteConcreteBaseTool *)self toolIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.ink.custom"];

  return v3;
}

- (NSString)toolVariant
{
  return self->_toolVariant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolVariant, 0);

  objc_storeStrong((id *)&self->_cachedConfiguration, 0);
}

@end