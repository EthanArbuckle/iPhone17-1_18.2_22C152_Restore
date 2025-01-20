@interface PKToolConfiguration
+ (id)_configurationForFountainPen;
+ (id)_configurationForMonoline;
+ (id)_configurationForWatercolor;
+ (id)_deepCopyStrokeWeightDictionary:(id)a3;
+ (id)defaultColorForInkingToolWithIdentifier:(uint64_t)a1;
+ (id)defaultConfigurationForToolWithIdentifier:(id)a3;
+ (id)defaultConfigurationForToolWithIdentifier:(uint64_t)a3 inkVersion:;
+ (id)p_assetImageForToolIdentifier:(id)a3 assetNumber:(unint64_t)a4 bundle:(id)a5;
+ (id)p_bitmapEraserImageWithWeight:(double)a3 imageSize:(CGSize)a4;
+ (id)p_objectEraserImageWithWeight:(double)a3 imageSize:(CGSize)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEraserTool;
- (BOOL)supportsColor;
- (BOOL)supportsOpacity;
- (BOOL)supportsStrokeWeight;
- (CGSize)strokeWeightButtonSize;
- (NSDictionary)strokeWeightsToButtonImages;
- (NSString)localizedName;
- (PKToolConfiguration)init;
- (PKToolConfiguration)initWithLocalizedName:(id)a3 baseImage:(id)a4 shadowPath:(id)a5;
- (UIBezierPath)shadowPath;
- (UIBezierPath)shadowPathIncludingTip;
- (UIColor)defaultColor;
- (UIColor)weightButtonTintColorOverride;
- (UIImage)bandContourImage;
- (UIImage)bandMaskImage;
- (UIImage)baseImage;
- (UIImage)tipContourImage;
- (UIImage)tipMaskImage;
- (double)bandThicknessForStrokeWeight:(void *)a1;
- (double)bandVerticalOffset;
- (double)maximumBandThickness;
- (double)minimumBandThickness;
- (double)opacityLabelVerticalOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)p_strokeWeightRange;
- (id)viewControllerProvider;
- (unint64_t)hash;
- (void)clearTipMaskImageAndShadowPathIncludingTip;
- (void)setBandContourImage:(id)a3;
- (void)setBandMaskImage:(id)a3;
- (void)setBandVerticalOffset:(double)a3;
- (void)setBaseImage:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setMinimumBandThickness:(double)a3 andMaximumBandThickness:(double)a4;
- (void)setOpacityLabelVerticalOffset:(double)a3;
- (void)setShadowPath:(id)a3;
- (void)setStrokeWeightsToButtonImages:(id)a3;
- (void)setSupportsColor:(BOOL)a3 andOpacity:(BOOL)a4;
- (void)setSupportsColor:(BOOL)a3 andOpacity:(BOOL)a4 defaultColor:(id)a5;
- (void)setTipContourImage:(id)a3;
- (void)setTipMaskImage:(id)a3 withShadowPathIncludingTip:(id)a4;
- (void)setViewControllerProvider:(id)a3;
@end

@implementation PKToolConfiguration

+ (id)_configurationForMonoline
{
  return +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:@"com.apple.ink.monoline"];
}

+ (id)_configurationForFountainPen
{
  return +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:@"com.apple.ink.fountainpen"];
}

+ (id)_configurationForWatercolor
{
  return +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:@"com.apple.ink.watercolor"];
}

- (PKToolConfiguration)initWithLocalizedName:(id)a3 baseImage:(id)a4 shadowPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PKToolConfiguration;
  v11 = [(PKToolConfiguration *)&v24 init];
  if (v11)
  {
    if (v8)
    {
      if (v9)
      {
        if (v10)
        {
          uint64_t v12 = [v8 copy];
          v13 = (void *)*((void *)v11 + 3);
          *((void *)v11 + 3) = v12;

          uint64_t v14 = [v9 copy];
          v15 = (void *)*((void *)v11 + 4);
          *((void *)v11 + 4) = v14;

          uint64_t v16 = [v10 copy];
          v17 = (void *)*((void *)v11 + 5);
          *((void *)v11 + 5) = v16;

          v11[18] = 0;
          v18 = (void *)*((void *)v11 + 6);
          *((void *)v11 + 6) = 0;

          *(_WORD *)(v11 + 19) = 0;
          *((void *)v11 + 7) = 0;
          *((void *)v11 + 10) = 0;
          *((void *)v11 + 15) = 0;
          *((void *)v11 + 16) = 0;
          *((_WORD *)v11 + 8) = 257;
          goto LABEL_6;
        }
        v20 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v21 = *MEMORY[0x1E4F1C3C8];
        v22 = @"shadowPath must not be nil.";
      }
      else
      {
        v20 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v21 = *MEMORY[0x1E4F1C3C8];
        v22 = @"baseImage must not be nil.";
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v21 = *MEMORY[0x1E4F1C3C8];
      v22 = @"localizedName must not be nil.";
    }
    id v23 = [v20 exceptionWithName:v21 reason:v22 userInfo:0];
    objc_exception_throw(v23);
  }
LABEL_6:

  return (PKToolConfiguration *)v11;
}

- (PKToolConfiguration)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1818]);
  id v4 = objc_alloc_init(MEMORY[0x1E4FB14C0]);
  v5 = [(PKToolConfiguration *)self initWithLocalizedName:&stru_1F1FB2C00 baseImage:v3 shadowPath:v4];

  return v5;
}

+ (id)defaultConfigurationForToolWithIdentifier:(id)a3
{
  return +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:inkVersion:]((uint64_t)a1, a3, -1);
}

+ (id)defaultConfigurationForToolWithIdentifier:(uint64_t)a3 inkVersion:
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v119 = self;
  if (!v4)
  {
    v100 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v101 = *MEMORY[0x1E4F1C3C8];
    v102 = @"Can not get a default configuration for a nil tool identifier.";
    goto LABEL_266;
  }
  if ([v4 isEqualToString:@"com.apple.ink.custom"])
  {
    v100 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v101 = *MEMORY[0x1E4F1C3C8];
    v102 = @"Can not get a default configuration for custom ink.";
LABEL_266:
    id v103 = [v100 exceptionWithName:v101 reason:v102 userInfo:0];
    objc_exception_throw(v103);
  }
  id v5 = v4;
  if (([v5 isEqualToString:@"com.apple.ink.pen"] & 1) != 0
    || ([v5 isEqualToString:@"com.apple.ink.pencil"] & 1) != 0
    || ([v5 isEqualToString:@"com.apple.ink.marker"] & 1) != 0
    || ([v5 isEqualToString:@"com.apple.ink.monoline"] & 1) != 0
    || ([v5 isEqualToString:@"com.apple.ink.fountainpen"] & 1) != 0
    || ([v5 isEqualToString:@"com.apple.ink.watercolor"] & 1) != 0)
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = [v5 isEqualToString:@"com.apple.ink.crayon"];
  }

  id v7 = v5;
  if (objc_msgSend(v7, "isEqualToString:")) {
    int v116 = 1;
  }
  else {
    int v116 = [v7 isEqualToString:@"com.apple.ink.objectEraser"];
  }

  int v117 = [v7 isEqualToString:@"com.apple.ink.objectEraser"];
  char v8 = objc_msgSend(v7, "isEqualToString:");
  v118 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v9 = v7;
  if ([v9 isEqualToString:@"com.apple.ink.pen"])
  {
    id v10 = _PencilKitBundle();
    v11 = v10;
    uint64_t v12 = @"Pen";
LABEL_40:
    uint64_t v13 = [v10 localizedStringForKey:v12 value:v12 table:@"Localizable"];

    goto LABEL_41;
  }
  if ([v9 isEqualToString:@"com.apple.ink.pencil"])
  {
    id v10 = _PencilKitBundle();
    v11 = v10;
    uint64_t v12 = @"Pencil";
    goto LABEL_40;
  }
  if ([v9 isEqualToString:@"com.apple.ink.marker"])
  {
    id v10 = _PencilKitBundle();
    v11 = v10;
    uint64_t v12 = @"Marker";
    goto LABEL_40;
  }
  if ([v9 isEqualToString:@"com.apple.ink.monoline"])
  {
    id v10 = _PencilKitBundle();
    v11 = v10;
    uint64_t v12 = @"Monoline";
    goto LABEL_40;
  }
  if ([v9 isEqualToString:@"com.apple.ink.fountainpen"])
  {
    id v10 = _PencilKitBundle();
    v11 = v10;
    uint64_t v12 = @"Fountain Pen";
    goto LABEL_40;
  }
  if ([v9 isEqualToString:@"com.apple.ink.watercolor"])
  {
    id v10 = _PencilKitBundle();
    v11 = v10;
    uint64_t v12 = @"Watercolor";
    goto LABEL_40;
  }
  if ([v9 isEqualToString:@"com.apple.ink.crayon"])
  {
    id v10 = _PencilKitBundle();
    v11 = v10;
    uint64_t v12 = @"Crayon";
    goto LABEL_40;
  }
  if ([v9 isEqualToString:@"com.apple.ink.lasso"])
  {
    id v10 = _PencilKitBundle();
    v11 = v10;
    uint64_t v12 = @"Lasso";
    goto LABEL_40;
  }
  if ([v9 isEqualToString:@"com.apple.ink.eraser"])
  {
    id v10 = _PencilKitBundle();
    v11 = v10;
    uint64_t v12 = @"Pixel Eraser";
    goto LABEL_40;
  }
  if ([v9 isEqualToString:@"com.apple.ink.objectEraser"])
  {
    id v10 = _PencilKitBundle();
    v11 = v10;
    uint64_t v12 = @"Object Eraser";
    goto LABEL_40;
  }
  if ([v9 isEqualToString:@"com.apple.tool.ruler"])
  {
    id v10 = _PencilKitBundle();
    v11 = v10;
    uint64_t v12 = @"Ruler";
    goto LABEL_40;
  }
  if ([v9 isEqualToString:@"com.apple.ink.handwriting"])
  {
    id v10 = _PencilKitBundle();
    v11 = v10;
    uint64_t v12 = @"Scribble";
    goto LABEL_40;
  }
  if ([v9 isEqualToString:@"com.apple.ink.generationtool"])
  {
    id v10 = _PencilKitBundle();
    v11 = v10;
    uint64_t v12 = @"Generation Tool";
    goto LABEL_40;
  }
  uint64_t v13 = 0;
LABEL_41:

  id v14 = v9;
  if ([v14 isEqualToString:@"com.apple.ink.pen"])
  {
    v15 = @"palette_tool_pen_base";
  }
  else if ([v14 isEqualToString:@"com.apple.ink.pencil"])
  {
    v15 = @"palette_tool_pencil_base";
  }
  else if ([v14 isEqualToString:@"com.apple.ink.marker"])
  {
    v15 = @"palette_tool_marker_base";
  }
  else if ([v14 isEqualToString:@"com.apple.ink.monoline"])
  {
    v15 = @"MonolineTool/Base";
  }
  else if ([v14 isEqualToString:@"com.apple.ink.fountainpen"])
  {
    v15 = @"FountainPenTool/Base";
  }
  else if ([v14 isEqualToString:@"com.apple.ink.watercolor"])
  {
    v15 = @"WatercolorTool/Base";
  }
  else if ([v14 isEqualToString:@"com.apple.ink.crayon"])
  {
    v15 = @"CrayonTool/Base";
  }
  else if ([v14 isEqualToString:@"com.apple.ink.lasso"])
  {
    v15 = @"palette_tool_selection";
  }
  else if ([v14 isEqualToString:@"com.apple.ink.eraser"])
  {
    v15 = @"palette_tool_bitmap_eraser";
  }
  else if ([v14 isEqualToString:@"com.apple.ink.objectEraser"])
  {
    v15 = @"palette_tool_object_eraser";
  }
  else if ([v14 isEqualToString:@"com.apple.tool.ruler"])
  {
    v15 = @"palette_tool_ruler";
  }
  else if ([v14 isEqualToString:@"com.apple.ink.handwriting"])
  {
    v15 = @"palette_tool_handwriting";
  }
  else if ([v14 isEqualToString:@"com.apple.ink.generationtool"])
  {
    v15 = @"palette_tool_generation";
  }
  else
  {
    v15 = 0;
  }

  v115 = [MEMORY[0x1E4FB1818] imageNamed:v15 inBundle:v118 compatibleWithTraitCollection:0];
  if (!v115)
  {
    v104 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v105 = *MEMORY[0x1E4F1C3B8];
    v106 = [NSString stringWithFormat:@"Unable to find image with name '%@' in bundle '%@'.", v15, v118];
    id v107 = [v104 exceptionWithName:v105 reason:v106 userInfo:0];

    objc_exception_throw(v107);
  }
  uint64_t v16 = off_1E64C4000;
  if (v6)
  {
    +[PKToolConfiguration defaultColorForInkingToolWithIdentifier:]((uint64_t)PKToolConfiguration, v14);
    id v114 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v114 = 0;
  }
  id v17 = v14;
  char v112 = v8;
  if ([v17 isEqualToString:@"com.apple.ink.pen"])
  {
    uint64_t v18 = a3;
    v19 = [MEMORY[0x1E4FB14C0] bezierPath];
    double v20 = 106.0;
    objc_msgSend(v19, "moveToPoint:", 12.0, 106.0);
    double v21 = 41.5;
    objc_msgSend(v19, "addLineToPoint:", 12.0, 41.5);
    objc_msgSend(v19, "addLineToPoint:", 19.5, 11.5);
    double v22 = 26.5;
    double v23 = 11.5;
LABEL_76:
    objc_super v24 = v19;
LABEL_77:
    objc_msgSend(v24, "addLineToPoint:", v22, v23);
    objc_msgSend(v19, "addLineToPoint:", 34.0, v21);
    objc_msgSend(v19, "addLineToPoint:", 34.0, 106.0);
    double v25 = 12.0;
LABEL_78:
    objc_msgSend(v19, "addLineToPoint:", v25, v20);
    [v19 closePath];
LABEL_79:
    id v26 = v19;

    goto LABEL_80;
  }
  if ([v17 isEqualToString:@"com.apple.ink.pencil"])
  {
    uint64_t v18 = a3;
    v19 = [MEMORY[0x1E4FB14C0] bezierPath];
    double v20 = 106.0;
    objc_msgSend(v19, "moveToPoint:", 12.0, 106.0);
    double v21 = 44.5;
    objc_msgSend(v19, "addLineToPoint:", 12.0, 44.5);
    objc_msgSend(v19, "addLineToPoint:", 19.0, 15.5);
    double v22 = 27.0;
    double v23 = 15.5;
    goto LABEL_76;
  }
  uint64_t v18 = a3;
  if ([v17 isEqualToString:@"com.apple.ink.marker"])
  {
    v19 = [MEMORY[0x1E4FB14C0] bezierPath];
    double v20 = 106.0;
    objc_msgSend(v19, "moveToPoint:", 12.0, 106.0);
    double v21 = 39.5;
    objc_msgSend(v19, "addLineToPoint:", 12.0, 39.5);
    objc_msgSend(v19, "addLineToPoint:", 13.0, 35.5);
    objc_msgSend(v19, "addLineToPoint:", 16.0, 28.5);
    objc_msgSend(v19, "addLineToPoint:", 16.0, 15.47);
    objc_msgSend(v19, "addLineToPoint:", 17.0, 14.5);
    objc_msgSend(v19, "addLineToPoint:", 28.5, 14.5);
    objc_msgSend(v19, "addLineToPoint:", 30.0, 15.5);
    objc_msgSend(v19, "addLineToPoint:", 30.0, 28.5);
    double v22 = 33.0;
    objc_super v24 = v19;
    double v23 = 35.5;
    goto LABEL_77;
  }
  if ([v17 isEqualToString:@"com.apple.ink.monoline"])
  {
    v19 = [MEMORY[0x1E4FB14C0] bezierPath];
    objc_msgSend(v19, "moveToPoint:", 12.2618099, 106.0);
    objc_msgSend(v19, "addLineToPoint:", 12.2618099, 43.2351562);
    objc_msgSend(v19, "addLineToPoint:", 14.2503486, 43.2351562);
    objc_msgSend(v19, "addLineToPoint:", 14.2503486, 23.597526);
    objc_msgSend(v19, "addLineToPoint:", 16.5339738, 23.597526);
    objc_msgSend(v19, "addLineToPoint:", 16.5339738, 16.4634978);
    objc_msgSend(v19, "addLineToPoint:", 21.7507188, 16.4634978);
    objc_msgSend(v19, "addLineToPoint:", 21.7507188, 8.32630841);
    objc_msgSend(v19, "addLineToPoint:", 21.7507188, 3.32473958);
    objc_msgSend(v19, "addLineToPoint:", 24.4343841, 3.32473958);
    objc_msgSend(v19, "addLineToPoint:", 24.4343841, 8.32630841);
    objc_msgSend(v19, "addLineToPoint:", 24.4343841, 16.4634978);
    objc_msgSend(v19, "addLineToPoint:", 29.8894292, 16.4634978);
    objc_msgSend(v19, "addLineToPoint:", 29.8894292, 23.597526);
    objc_msgSend(v19, "addLineToPoint:", 32.1598719, 23.597526);
    objc_msgSend(v19, "addLineToPoint:", 32.1598719, 43.2351562);
    objc_msgSend(v19, "addLineToPoint:", 34.0916241, 43.2351562);
    objc_msgSend(v19, "addLineToPoint:", 34.0916241, 106.0);
    goto LABEL_79;
  }
  if ([v17 isEqualToString:@"com.apple.ink.fountainpen"])
  {
    v19 = [MEMORY[0x1E4FB14C0] bezierPath];
    [v19 moveToPoint:12.2601668];
    objc_msgSend(v19, "addLineToPoint:", 13.2601668, 51.9198442);
    objc_msgSend(v19, "addLineToPoint:", 15.1484375, 48.0507036);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 15.0358887, 46.1215105, 15.0358887, 45.5854492, 14.7400716, 46.943262);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 14.9029147, 44.3973689, 14.6369669, 43.629392, 15.0358887, 45.0493879);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 15.0732805, 43.3439394, 15.9459078, 42.7730341, 14.6369669, 43.629392);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 12.2601668, 30.4790039, 12.2601668, 26.6476707, 15.9459078, 37.9335938);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 19.6647949, 10.418457, 23.0923308, 1.65112305, 12.2601668, 22.8163376);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 33.9244948, 22.1508102, 33.9244948, 26.6476707, 26.543457, 10.4182129);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 30.4541991, 37.3776855, 30.4541991, 42.7730341, 33.9244948, 31.1445313);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 31.7211492, 43.3271476, 32.0599319, 43.629392, 31.1859049, 43.041695);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 31.3964844, 45.0633311, 31.3964844, 45.5854492, 31.6176336, 44.411312);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 31.6176336, 46.9293188, 32.0599319, 48.0507036, 31.3964844, 46.1075674);
    objc_msgSend(v19, "addLineToPoint:", 33.9244948, 51.9198442);
    objc_msgSend(v19, "addLineToPoint:", 33.9244948, 106.0);
    v36 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 18.0, 21.25, 10.0, 10.0);
    v37 = [v36 bezierPathByReversingPath];
    [v19 appendPath:v37];

    uint64_t v16 = off_1E64C4000;
    goto LABEL_79;
  }
  if ([v17 isEqualToString:@"com.apple.ink.watercolor"])
  {
    v19 = [MEMORY[0x1E4FB14C0] bezierPath];
    [v19 moveToPoint:12.2158203];
    [v19 addCurveToPoint:12.2158203 controlPoint1:49.1869718 controlPoint2:12.2158203];
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 16.4457308, 35.171875, 12.2158203, 45.659218, 13.7754602, 41.0078087);
    objc_msgSend(v19, "addLineToPoint:", 16.4457308, 31.4229939);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 17.5809329, 31.4229939, 16.8986844, 31.4229939, 17.2770851, 31.4229939);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 23.0, 2.26262478, 17.5809329, 19.2776602, 20.4644097, 7.17426215);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 28.6675323, 31.4229939, 25.4383789, 7.22929688, 28.6675323, 19.2776602);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 29.8027344, 31.4229939, 28.9713802, 31.4229939, 29.3497808, 31.4229939);
    objc_msgSend(v19, "addLineToPoint:", 29.8027344, 35.171875);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 34.0, 49.1869718, 32.473005, 41.0078087, 34.0, 45.659218);
    objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", 34.0, 106.0, 34.0, 52.7147255, 34.0, 71.6524016);
    goto LABEL_79;
  }
  if ([v17 isEqualToString:@"com.apple.ink.crayon"])
  {
    v87 = (void *)MEMORY[0x1E4FB14C0];
    double v88 = 24.25;
    double v89 = 105.25;
    double v90 = 12.0;
    double v91 = 22.0;
LABEL_220:
    v19 = objc_msgSend(v87, "bezierPathWithRect:", v90, v88, v91, v89);
    goto LABEL_79;
  }
  if ([v17 isEqualToString:@"com.apple.ink.lasso"])
  {
    v19 = [MEMORY[0x1E4FB14C0] bezierPath];
    double v20 = 106.0;
    objc_msgSend(v19, "moveToPoint:", 12.0, 106.0);
    double v21 = 41.38;
    objc_msgSend(v19, "addLineToPoint:", 12.0, 41.38);
    objc_msgSend(v19, "addLineToPoint:", 22.48, 2.0);
    double v22 = 23.52;
    double v23 = 2.0;
    goto LABEL_76;
  }
  if (([v17 isEqualToString:@"com.apple.ink.eraser"] & 1) != 0
    || [v17 isEqualToString:@"com.apple.ink.objectEraser"])
  {
    v19 = [MEMORY[0x1E4FB14C0] bezierPath];
    double v20 = 106.0;
    objc_msgSend(v19, "moveToPoint:", 12.5, 106.0);
    objc_msgSend(v19, "addLineToPoint:", 12.5, 40.5);
    objc_msgSend(v19, "addLineToPoint:", 12.0, 40.5);
    objc_msgSend(v19, "addLineToPoint:", 12.0, 22.0);
    objc_msgSend(v19, "addLineToPoint:", 12.5, 22.0);
    objc_msgSend(v19, "addLineToPoint:", 12.5, 6.52);
    objc_msgSend(v19, "addLineToPoint:", 13.5, 4.51);
    objc_msgSend(v19, "addLineToPoint:", 17.5, 2.5);
    objc_msgSend(v19, "addLineToPoint:", 28.5, 2.5);
    objc_msgSend(v19, "addLineToPoint:", 32.5, 4.51);
    objc_msgSend(v19, "addLineToPoint:", 33.5, 6.52);
    objc_msgSend(v19, "addLineToPoint:", 33.5, 22.0);
    objc_msgSend(v19, "addLineToPoint:", 34.0, 22.0);
    objc_msgSend(v19, "addLineToPoint:", 34.0, 40.5);
    objc_msgSend(v19, "addLineToPoint:", 33.5, 40.5);
    objc_msgSend(v19, "addLineToPoint:", 33.5, 48.72);
    v94 = v19;
LABEL_236:
    objc_msgSend(v94, "addLineToPoint:", 33.5, v20);
    double v25 = 12.5;
    goto LABEL_78;
  }
  if ([v17 isEqualToString:@"com.apple.tool.ruler"])
  {
    v87 = (void *)MEMORY[0x1E4FB14C0];
    double v91 = 36.0;
    double v89 = 103.5;
    double v90 = 5.0;
    double v88 = 2.5;
    goto LABEL_220;
  }
  if ([v17 isEqualToString:@"com.apple.ink.handwriting"])
  {
    v19 = [MEMORY[0x1E4FB14C0] bezierPath];
    double v20 = 106.5;
    objc_msgSend(v19, "moveToPoint:", 12.5, 106.5);
    objc_msgSend(v19, "addLineToPoint:", 12.5, 65.5);
    objc_msgSend(v19, "addLineToPoint:", 13.5, 53.5);
    objc_msgSend(v19, "addLineToPoint:", 15.5, 36.83);
    objc_msgSend(v19, "addLineToPoint:", 19.5, 14.5);
    objc_msgSend(v19, "addLineToPoint:", 20.21, 11.73);
    objc_msgSend(v19, "addLineToPoint:", 20.5, 10.58);
    objc_msgSend(v19, "addLineToPoint:", 21.5, 3.51);
    objc_msgSend(v19, "addLineToPoint:", 22.5, 2.5);
    objc_msgSend(v19, "addLineToPoint:", 23.5, 2.5);
    objc_msgSend(v19, "addLineToPoint:", 24.5, 3.51);
    objc_msgSend(v19, "addLineToPoint:", 25.5, 10.58);
    objc_msgSend(v19, "addLineToPoint:", 26.5, 14.5);
    objc_msgSend(v19, "addLineToPoint:", 30.5, 36.83);
    objc_msgSend(v19, "addLineToPoint:", 32.5, 53.5);
    objc_msgSend(v19, "addLineToPoint:", 33.5, 65.5);
    v96 = v19;
    double v97 = 106.5;
LABEL_253:
    objc_msgSend(v96, "addLineToPoint:", 33.5, v97);
    v94 = v19;
    goto LABEL_236;
  }
  if ([v17 isEqualToString:@"com.apple.ink.generationtool"])
  {
    v19 = [MEMORY[0x1E4FB14C0] bezierPath];
    double v20 = 106.0;
    objc_msgSend(v19, "moveToPoint:", 12.5, 106.0);
    objc_msgSend(v19, "addLineToPoint:", 12.5, 6.52);
    objc_msgSend(v19, "addLineToPoint:", 13.5, 4.51);
    objc_msgSend(v19, "addLineToPoint:", 17.5, 2.5);
    objc_msgSend(v19, "addLineToPoint:", 28.5, 2.5);
    objc_msgSend(v19, "addLineToPoint:", 32.5, 4.51);
    v96 = v19;
    double v97 = 6.52;
    goto LABEL_253;
  }
  id v26 = 0;
LABEL_80:

  uint64_t v27 = [objc_alloc(v16[185]) initWithLocalizedName:v13 baseImage:v115 shadowPath:v26];
  *(unsigned char *)(v27 + 21) = v116;
  *(unsigned char *)(v27 + 20) = v112;
  *(void *)(v27 + 152) = v18;
  if ([v17 isEqualToString:@"com.apple.ink.eraser"])
  {
    uint64_t v28 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    v29 = *(void **)(v27 + 136);
    *(void *)(v27 + 136) = v28;
  }
  [(id)v27 setSupportsColor:v6 andOpacity:v6 defaultColor:v114];
  if (v6) {
    [(id)v27 setOpacityLabelVerticalOffset:70.0];
  }
  id v30 = v17;
  if ([v30 isEqualToString:@"com.apple.ink.pen"])
  {
    v31 = @"palette_tool_pen_band";
LABEL_88:
    v32 = (void *)v13;
LABEL_89:

    v33 = [MEMORY[0x1E4FB1818] imageNamed:v31 inBundle:v118 compatibleWithTraitCollection:0];
    [(id)v27 setBandMaskImage:v33];
    goto LABEL_90;
  }
  if ([v30 isEqualToString:@"com.apple.ink.pencil"])
  {
    v31 = @"palette_tool_pencil_band";
    goto LABEL_88;
  }
  v32 = (void *)v13;
  if ([v30 isEqualToString:@"com.apple.ink.marker"])
  {
    v31 = @"palette_tool_marker_band";
    goto LABEL_89;
  }
  if ([v30 isEqualToString:@"com.apple.ink.monoline"]) {
    goto LABEL_111;
  }
  if ([v30 isEqualToString:@"com.apple.ink.fountainpen"])
  {
    v31 = @"FountainPenTool/BandMask";
    goto LABEL_89;
  }
  if ([v30 isEqualToString:@"com.apple.ink.watercolor"])
  {
LABEL_111:
    v31 = @"MonolineTool/BandMask";
    goto LABEL_89;
  }
  v33 = v30;
  if ([v30 isEqualToString:@"com.apple.ink.crayon"])
  {
    v31 = @"CrayonTool/BandMask";
    goto LABEL_89;
  }
LABEL_90:

  id v34 = v30;
  if ([v34 isEqualToString:@"com.apple.ink.pen"])
  {
    v35 = @"palette_tool_pen_band_contour";
LABEL_114:

    v38 = [MEMORY[0x1E4FB1818] imageNamed:v35 inBundle:v118 compatibleWithTraitCollection:0];
    [(id)v27 setBandContourImage:v38];
    goto LABEL_115;
  }
  if ([v34 isEqualToString:@"com.apple.ink.pencil"])
  {
    v35 = @"palette_tool_pencil_band_contour";
    goto LABEL_114;
  }
  if ([v34 isEqualToString:@"com.apple.ink.marker"])
  {
    v35 = @"palette_tool_marker_band_contour";
    goto LABEL_114;
  }
  if ([v34 isEqualToString:@"com.apple.ink.monoline"]) {
    goto LABEL_113;
  }
  if ([v34 isEqualToString:@"com.apple.ink.fountainpen"])
  {
    v35 = @"FountainPenTool/BandContour";
    goto LABEL_114;
  }
  if ([v34 isEqualToString:@"com.apple.ink.watercolor"])
  {
LABEL_113:
    v35 = @"MonolineTool/BandContour";
    goto LABEL_114;
  }
  v38 = v34;
  if ([v34 isEqualToString:@"com.apple.ink.crayon"])
  {
    v35 = @"CrayonTool/BandContour";
    goto LABEL_114;
  }
LABEL_115:

  if (!v6) {
    goto LABEL_123;
  }
  id v39 = v34;
  if (([v39 isEqualToString:@"com.apple.ink.pen"] & 1) != 0
    || ([v39 isEqualToString:@"com.apple.ink.pencil"] & 1) != 0
    || ([v39 isEqualToString:@"com.apple.ink.marker"] & 1) != 0
    || ([v39 isEqualToString:@"com.apple.ink.crayon"] & 1) != 0)
  {
    *(double *)&uint64_t v40 = 50.0;
  }
  else
  {
    if (([v39 isEqualToString:@"com.apple.ink.monoline"] & 1) == 0
      && ([v39 isEqualToString:@"com.apple.ink.fountainpen"] & 1) == 0)
    {
      if ([v39 isEqualToString:@"com.apple.ink.watercolor"]) {
        double v41 = 60.0;
      }
      else {
        double v41 = 0.0;
      }
      goto LABEL_122;
    }
    *(double *)&uint64_t v40 = 60.0;
  }
  double v41 = *(double *)&v40;
LABEL_122:

  [(id)v27 setBandVerticalOffset:v41];
LABEL_123:
  id v42 = v34;
  if ([v42 isEqualToString:@"com.apple.ink.pen"])
  {
    v43 = @"palette_tool_pen_tip";
  }
  else if ([v42 isEqualToString:@"com.apple.ink.pencil"])
  {
    v43 = @"palette_tool_pencil_tip";
  }
  else if ([v42 isEqualToString:@"com.apple.ink.marker"])
  {
    v43 = @"palette_tool_marker_tip";
  }
  else if ([v42 isEqualToString:@"com.apple.ink.monoline"])
  {
    v43 = @"MonolineTool/Tip";
  }
  else if ([v42 isEqualToString:@"com.apple.ink.watercolor"])
  {
    v43 = @"WatercolorTool/Tip";
  }
  else
  {
    v44 = v42;
    if (![v42 isEqualToString:@"com.apple.ink.crayon"]) {
      goto LABEL_149;
    }
    v43 = @"CrayonTool/Tip";
  }

  v44 = [MEMORY[0x1E4FB1818] imageNamed:v43 inBundle:v118 compatibleWithTraitCollection:0];
  if (v44)
  {
    v45 = v32;
    id v46 = v42;
    v111 = v46;
    if ([v46 isEqualToString:@"com.apple.ink.pen"])
    {
      v47 = [MEMORY[0x1E4FB14C0] bezierPath];
      objc_msgSend(v47, "moveToPoint:", 12.0, 106.0);
      double v48 = 41.5;
      objc_msgSend(v47, "addLineToPoint:", 12.0, 41.5);
      objc_msgSend(v47, "addLineToPoint:", 19.5, 11.5);
      objc_msgSend(v47, "addLineToPoint:", 23.0, 0.0);
      double v49 = 26.5;
      double v50 = 11.5;
LABEL_145:
      objc_msgSend(v47, "addLineToPoint:", v49, v50);
      objc_msgSend(v47, "addLineToPoint:", 34.0, v48);
      objc_msgSend(v47, "addLineToPoint:", 34.0, 106.0);
      objc_msgSend(v47, "addLineToPoint:", 12.0, 106.0);
      [v47 closePath];
      id v51 = v47;
      id v52 = v51;
LABEL_146:
      v32 = v45;
LABEL_147:

LABEL_148:
      [(id)v27 setTipMaskImage:v44 withShadowPathIncludingTip:v52];

      goto LABEL_149;
    }
    if ([v46 isEqualToString:@"com.apple.ink.pencil"])
    {
      v47 = [MEMORY[0x1E4FB14C0] bezierPath];
      objc_msgSend(v47, "moveToPoint:", 12.0, 106.0);
      double v48 = 44.5;
      objc_msgSend(v47, "addLineToPoint:", 12.0, 44.5);
      objc_msgSend(v47, "addLineToPoint:", 19.0, 15.5);
      objc_msgSend(v47, "addLineToPoint:", 23.0, 0.0);
      double v49 = 27.0;
      double v50 = 15.5;
      goto LABEL_145;
    }
    if ([v46 isEqualToString:@"com.apple.ink.marker"])
    {
      v55 = [MEMORY[0x1E4FB14C0] bezierPath];
      double v56 = 106.0;
      objc_msgSend(v55, "moveToPoint:", 12.0, 106.0);
      objc_msgSend(v55, "addLineToPoint:", 12.0, 39.5);
      objc_msgSend(v55, "addLineToPoint:", 13.0, 35.5);
      objc_msgSend(v55, "addLineToPoint:", 16.0, 28.5);
      objc_msgSend(v55, "addLineToPoint:", 16.0, 15.47);
      objc_msgSend(v55, "addLineToPoint:", 17.0, 14.5);
      objc_msgSend(v55, "addLineToPoint:", 17.0, 8.0);
      objc_msgSend(v55, "addLineToPoint:", 28.5, 2.0);
      objc_msgSend(v55, "addLineToPoint:", 28.5, 14.5);
      objc_msgSend(v55, "addLineToPoint:", 30.0, 15.5);
      objc_msgSend(v55, "addLineToPoint:", 30.0, 28.5);
      objc_msgSend(v55, "addLineToPoint:", 33.0, 35.5);
      objc_msgSend(v55, "addLineToPoint:", 34.0, 39.5);
      v57 = v55;
LABEL_157:
      objc_msgSend(v57, "addLineToPoint:", 34.0, v56);
      objc_msgSend(v55, "addLineToPoint:", 12.0, v56);
      [v55 closePath];
      id v51 = v55;
      id v52 = v51;
      goto LABEL_146;
    }
    if ((objc_msgSend(v46, "isEqualToString:") & 1) == 0
      && ([v46 isEqualToString:@"com.apple.ink.fountainpen"] & 1) == 0
      && ![v46 isEqualToString:@"com.apple.ink.watercolor"])
    {
      if (![v46 isEqualToString:@"com.apple.ink.crayon"])
      {
        id v52 = 0;
        v32 = v45;
        goto LABEL_148;
      }
      v55 = [MEMORY[0x1E4FB14C0] bezierPath];
      objc_msgSend(v55, "moveToPoint:", 12.0, 24.25);
      objc_msgSend(v55, "addLineToPoint:", 14.5, 24.25);
      objc_msgSend(v55, "addLineToPoint:", 21.0, 0.0);
      objc_msgSend(v55, "addLineToPoint:", 25.0, 0.0);
      objc_msgSend(v55, "addLineToPoint:", 31.5, 24.25);
      objc_msgSend(v55, "addLineToPoint:", 34.0, 24.25);
      double v56 = 129.5;
      v57 = v55;
      goto LABEL_157;
    }
    id v58 = v46;
    id v108 = v58;
    if ([v58 isEqualToString:@"com.apple.ink.pen"])
    {
      v59 = [MEMORY[0x1E4FB14C0] bezierPath];
      objc_msgSend(v59, "moveToPoint:", 12.0, 106.0);
      objc_msgSend(v59, "addLineToPoint:", 12.0, 41.5);
      objc_msgSend(v59, "addLineToPoint:", 19.5, 11.5);
      objc_msgSend(v59, "addLineToPoint:", 26.5, 11.5);
      objc_msgSend(v59, "addLineToPoint:", 34.0, 41.5);
      objc_msgSend(v59, "addLineToPoint:", 34.0, 106.0);
      objc_msgSend(v59, "addLineToPoint:", 12.0, 106.0);
      [v59 closePath];
      v32 = v45;
LABEL_213:
      id v52 = v59;

      id v51 = v108;
      goto LABEL_147;
    }
    v32 = v45;
    if ([v58 isEqualToString:@"com.apple.ink.pencil"])
    {
      v59 = [MEMORY[0x1E4FB14C0] bezierPath];
      double v60 = 106.0;
      objc_msgSend(v59, "moveToPoint:", 12.0, 106.0);
      double v61 = 44.5;
      objc_msgSend(v59, "addLineToPoint:", 12.0, 44.5);
      objc_msgSend(v59, "addLineToPoint:", 19.0, 15.5);
      double v62 = 27.0;
      double v63 = 15.5;
      v64 = v59;
    }
    else
    {
      if (![v58 isEqualToString:@"com.apple.ink.marker"])
      {
        if ([v58 isEqualToString:@"com.apple.ink.monoline"])
        {
          v59 = [MEMORY[0x1E4FB14C0] bezierPath];
          objc_msgSend(v59, "moveToPoint:", 12.2618099, 106.0);
          objc_msgSend(v59, "addLineToPoint:", 12.2618099, 43.2351562);
          objc_msgSend(v59, "addLineToPoint:", 14.2503486, 43.2351562);
          objc_msgSend(v59, "addLineToPoint:", 14.2503486, 23.597526);
          objc_msgSend(v59, "addLineToPoint:", 16.5339738, 23.597526);
          objc_msgSend(v59, "addLineToPoint:", 16.5339738, 16.4634978);
          objc_msgSend(v59, "addLineToPoint:", 21.7507188, 16.4634978);
          objc_msgSend(v59, "addLineToPoint:", 21.7507188, 8.32630841);
          objc_msgSend(v59, "addLineToPoint:", 21.7507188, 3.32473958);
          objc_msgSend(v59, "addLineToPoint:", 24.4343841, 3.32473958);
          objc_msgSend(v59, "addLineToPoint:", 24.4343841, 8.32630841);
          objc_msgSend(v59, "addLineToPoint:", 24.4343841, 16.4634978);
          objc_msgSend(v59, "addLineToPoint:", 29.8894292, 16.4634978);
          objc_msgSend(v59, "addLineToPoint:", 29.8894292, 23.597526);
          objc_msgSend(v59, "addLineToPoint:", 32.1598719, 23.597526);
          objc_msgSend(v59, "addLineToPoint:", 32.1598719, 43.2351562);
          objc_msgSend(v59, "addLineToPoint:", 34.0916241, 43.2351562);
          objc_msgSend(v59, "addLineToPoint:", 34.0916241, 106.0);
          goto LABEL_213;
        }
        if ([v58 isEqualToString:@"com.apple.ink.fountainpen"])
        {
          v59 = [MEMORY[0x1E4FB14C0] bezierPath];
          [v59 moveToPoint:12.2601668];
          objc_msgSend(v59, "addLineToPoint:", 13.2601668, 51.9198442);
          objc_msgSend(v59, "addLineToPoint:", 15.1484375, 48.0507036);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 15.0358887, 46.1215105, 15.0358887, 45.5854492, 14.7400716, 46.943262);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 14.9029147, 44.3973689, 14.6369669, 43.629392, 15.0358887, 45.0493879);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 15.0732805, 43.3439394, 15.9459078, 42.7730341, 14.6369669, 43.629392);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 12.2601668, 30.4790039, 12.2601668, 26.6476707, 15.9459078, 37.9335938);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 19.6647949, 10.418457, 23.0923308, 1.65112305, 12.2601668, 22.8163376);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 33.9244948, 22.1508102, 33.9244948, 26.6476707, 26.543457, 10.4182129);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 30.4541991, 37.3776855, 30.4541991, 42.7730341, 33.9244948, 31.1445313);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 31.7211492, 43.3271476, 32.0599319, 43.629392, 31.1859049, 43.041695);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 31.3964844, 45.0633311, 31.3964844, 45.5854492, 31.6176336, 44.411312);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 31.6176336, 46.9293188, 32.0599319, 48.0507036, 31.3964844, 46.1075674);
          objc_msgSend(v59, "addLineToPoint:", 33.9244948, 51.9198442);
          objc_msgSend(v59, "addLineToPoint:", 33.9244948, 106.0);
          v92 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 18.0, 21.25, 10.0, 10.0);
          v93 = [v92 bezierPathByReversingPath];
          [v59 appendPath:v93];

          goto LABEL_213;
        }
        if ([v58 isEqualToString:@"com.apple.ink.watercolor"])
        {
          v59 = [MEMORY[0x1E4FB14C0] bezierPath];
          [v59 moveToPoint:12.2158203];
          [v59 addCurveToPoint:12.2158203 controlPoint1:49.1869718 controlPoint2:12.2158203];
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 16.4457308, 35.171875, 12.2158203, 45.659218, 13.7754602, 41.0078087);
          objc_msgSend(v59, "addLineToPoint:", 16.4457308, 31.4229939);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 17.5809329, 31.4229939, 16.8986844, 31.4229939, 17.2770851, 31.4229939);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 23.0, 2.26262478, 17.5809329, 19.2776602, 20.4644097, 7.17426215);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 28.6675323, 31.4229939, 25.4383789, 7.22929688, 28.6675323, 19.2776602);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 29.8027344, 31.4229939, 28.9713802, 31.4229939, 29.3497808, 31.4229939);
          objc_msgSend(v59, "addLineToPoint:", 29.8027344, 35.171875);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 34.0, 49.1869718, 32.473005, 41.0078087, 34.0, 45.659218);
          objc_msgSend(v59, "addCurveToPoint:controlPoint1:controlPoint2:", 34.0, 106.0, 34.0, 52.7147255, 34.0, 71.6524016);
          goto LABEL_213;
        }
        if ([v58 isEqualToString:@"com.apple.ink.crayon"])
        {
          v59 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", 12.0, 24.25, 22.0, 105.25);
          goto LABEL_213;
        }
        if ([v58 isEqualToString:@"com.apple.ink.lasso"])
        {
          v59 = [MEMORY[0x1E4FB14C0] bezierPath];
          objc_msgSend(v59, "moveToPoint:", 12.0, 106.0);
          objc_msgSend(v59, "addLineToPoint:", 12.0, 41.38);
          objc_msgSend(v59, "addLineToPoint:", 22.48, 2.0);
          objc_msgSend(v59, "addLineToPoint:", 23.52, 2.0);
          objc_msgSend(v59, "addLineToPoint:", 34.0, 41.38);
          objc_msgSend(v59, "addLineToPoint:", 34.0, 106.0);
          double v95 = 12.0;
        }
        else
        {
          if (([v58 isEqualToString:@"com.apple.ink.eraser"] & 1) == 0
            && ![v58 isEqualToString:@"com.apple.ink.objectEraser"])
          {
            if ([v58 isEqualToString:@"com.apple.tool.ruler"])
            {
              v59 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", 5.0, 2.5, 36.0, 103.5);
              goto LABEL_213;
            }
            if ([v58 isEqualToString:@"com.apple.ink.handwriting"])
            {
              v59 = [MEMORY[0x1E4FB14C0] bezierPath];
              double v60 = 106.5;
              objc_msgSend(v59, "moveToPoint:", 12.5, 106.5);
              objc_msgSend(v59, "addLineToPoint:", 12.5, 65.5);
              objc_msgSend(v59, "addLineToPoint:", 13.5, 53.5);
              objc_msgSend(v59, "addLineToPoint:", 15.5, 36.83);
              objc_msgSend(v59, "addLineToPoint:", 19.5, 14.5);
              objc_msgSend(v59, "addLineToPoint:", 20.21, 11.73);
              objc_msgSend(v59, "addLineToPoint:", 20.5, 10.58);
              objc_msgSend(v59, "addLineToPoint:", 21.5, 3.51);
              objc_msgSend(v59, "addLineToPoint:", 22.5, 2.5);
              objc_msgSend(v59, "addLineToPoint:", 23.5, 2.5);
              objc_msgSend(v59, "addLineToPoint:", 24.5, 3.51);
              objc_msgSend(v59, "addLineToPoint:", 25.5, 10.58);
              objc_msgSend(v59, "addLineToPoint:", 26.5, 14.5);
              objc_msgSend(v59, "addLineToPoint:", 30.5, 36.83);
              objc_msgSend(v59, "addLineToPoint:", 32.5, 53.5);
              objc_msgSend(v59, "addLineToPoint:", 33.5, 65.5);
              v98 = v59;
              double v99 = 106.5;
            }
            else
            {
              if (![v58 isEqualToString:@"com.apple.ink.generationtool"])
              {
                id v52 = 0;
                id v51 = v58;
                goto LABEL_147;
              }
              v59 = [MEMORY[0x1E4FB14C0] bezierPath];
              double v60 = 106.0;
              objc_msgSend(v59, "moveToPoint:", 12.5, 106.0);
              objc_msgSend(v59, "addLineToPoint:", 12.5, 6.52);
              objc_msgSend(v59, "addLineToPoint:", 13.5, 4.51);
              objc_msgSend(v59, "addLineToPoint:", 17.5, 2.5);
              objc_msgSend(v59, "addLineToPoint:", 28.5, 2.5);
              objc_msgSend(v59, "addLineToPoint:", 32.5, 4.51);
              v98 = v59;
              double v99 = 6.52;
            }
            objc_msgSend(v98, "addLineToPoint:", 33.5, v99);
            objc_msgSend(v59, "addLineToPoint:", 33.5, v60);
            double v86 = 12.5;
            goto LABEL_212;
          }
          v59 = [MEMORY[0x1E4FB14C0] bezierPath];
          objc_msgSend(v59, "moveToPoint:", 12.5, 106.0);
          objc_msgSend(v59, "addLineToPoint:", 12.5, 40.5);
          objc_msgSend(v59, "addLineToPoint:", 12.0, 40.5);
          objc_msgSend(v59, "addLineToPoint:", 12.0, 22.0);
          objc_msgSend(v59, "addLineToPoint:", 12.5, 22.0);
          objc_msgSend(v59, "addLineToPoint:", 12.5, 6.52);
          objc_msgSend(v59, "addLineToPoint:", 13.5, 4.51);
          objc_msgSend(v59, "addLineToPoint:", 17.5, 2.5);
          objc_msgSend(v59, "addLineToPoint:", 28.5, 2.5);
          objc_msgSend(v59, "addLineToPoint:", 32.5, 4.51);
          objc_msgSend(v59, "addLineToPoint:", 33.5, 6.52);
          objc_msgSend(v59, "addLineToPoint:", 33.5, 22.0);
          objc_msgSend(v59, "addLineToPoint:", 34.0, 22.0);
          objc_msgSend(v59, "addLineToPoint:", 34.0, 40.5);
          objc_msgSend(v59, "addLineToPoint:", 33.5, 40.5);
          objc_msgSend(v59, "addLineToPoint:", 33.5, 48.72);
          objc_msgSend(v59, "addLineToPoint:", 33.5, 106.0);
          double v95 = 12.5;
        }
        objc_msgSend(v59, "addLineToPoint:", v95, 106.0);
        [v59 closePath];
        goto LABEL_213;
      }
      v59 = [MEMORY[0x1E4FB14C0] bezierPath];
      double v60 = 106.0;
      objc_msgSend(v59, "moveToPoint:", 12.0, 106.0);
      double v61 = 39.5;
      objc_msgSend(v59, "addLineToPoint:", 12.0, 39.5);
      objc_msgSend(v59, "addLineToPoint:", 13.0, 35.5);
      objc_msgSend(v59, "addLineToPoint:", 16.0, 28.5);
      objc_msgSend(v59, "addLineToPoint:", 16.0, 15.47);
      objc_msgSend(v59, "addLineToPoint:", 17.0, 14.5);
      objc_msgSend(v59, "addLineToPoint:", 28.5, 14.5);
      objc_msgSend(v59, "addLineToPoint:", 30.0, 15.5);
      objc_msgSend(v59, "addLineToPoint:", 30.0, 28.5);
      double v62 = 33.0;
      v64 = v59;
      double v63 = 35.5;
    }
    objc_msgSend(v64, "addLineToPoint:", v62, v63);
    objc_msgSend(v59, "addLineToPoint:", 34.0, v61);
    objc_msgSend(v59, "addLineToPoint:", 34.0, 106.0);
    double v86 = 12.0;
LABEL_212:
    objc_msgSend(v59, "addLineToPoint:", v86, v60);
    [v59 closePath];
    goto LABEL_213;
  }
LABEL_149:

  id v53 = v42;
  if ([v53 isEqualToString:@"com.apple.ink.pen"])
  {
    v54 = @"palette_tool_pen_tip_contour";
  }
  else if ([v53 isEqualToString:@"com.apple.ink.pencil"])
  {
    v54 = @"palette_tool_pencil_tip_contour";
  }
  else if ([v53 isEqualToString:@"com.apple.ink.marker"])
  {
    v54 = @"palette_tool_marker_tip_contour";
  }
  else if ([v53 isEqualToString:@"com.apple.ink.monoline"])
  {
    v54 = @"MonolineTool/TipContour";
  }
  else if ([v53 isEqualToString:@"com.apple.ink.watercolor"])
  {
    v54 = @"WatercolorTool/TipContour";
  }
  else
  {
    v65 = v53;
    if (![v53 isEqualToString:@"com.apple.ink.crayon"]) {
      goto LABEL_172;
    }
    v54 = @"CrayonTool/TipContour";
  }

  v65 = [MEMORY[0x1E4FB1818] imageNamed:v54 inBundle:v118 compatibleWithTraitCollection:0];
  [(id)v27 setTipContourImage:v65];
LABEL_172:

  if ((v6 | v116) == 1)
  {
    v113 = (void *)v27;
    [(id)v27 strokeWeightButtonSize];
    v66 = [MEMORY[0x1E4F1CA60] dictionary];
    v110 = v32;
    id v109 = v26;
    if (v6)
    {
      v67 = +[PKInkManager defaultInkManager];
      v68 = [v67 inkBehaviorForIdentifier:v53 variant:@"default"];

      v69 = [v68 uiWidths];
      if ([v69 count]) {
        id v70 = v69;
      }
      else {
        id v70 = &unk_1F200EF28;
      }
    }
    else
    {
      id v70 = &unk_1F200EF28;
    }
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    id v71 = v70;
    uint64_t v72 = [v71 countByEnumeratingWithState:&v120 objects:v124 count:16];
    if (v72)
    {
      uint64_t v73 = v72;
      uint64_t v74 = *(void *)v121;
      uint64_t v75 = 1;
      do
      {
        for (uint64_t i = 0; i != v73; ++i)
        {
          if (*(void *)v121 != v74) {
            objc_enumerationMutation(v71);
          }
          uint64_t v77 = *(void *)(*((void *)&v120 + 1) + 8 * i);
          if (v6)
          {
            uint64_t v78 = objc_msgSend(v119, "p_assetImageForToolIdentifier:assetNumber:bundle:", v53, v75 + i, v118);
          }
          else if (v117)
          {
            [*(id *)(*((void *)&v120 + 1) + 8 * i) doubleValue];
            uint64_t v78 = objc_msgSend(v119, "p_objectEraserImageWithWeight:imageSize:");
          }
          else
          {
            if (!v116) {
              continue;
            }
            [*(id *)(*((void *)&v120 + 1) + 8 * i) doubleValue];
            uint64_t v78 = objc_msgSend(v119, "p_bitmapEraserImageWithWeight:imageSize:");
          }
          v79 = (void *)v78;
          [v66 setObject:v78 forKeyedSubscript:v77];
        }
        uint64_t v73 = [v71 countByEnumeratingWithState:&v120 objects:v124 count:16];
        v75 += i;
      }
      while (v73);
    }

    [v113 setStrokeWeightsToButtonImages:v66];
    id v80 = v53;
    double v81 = 8.0;
    double v82 = 2.0;
    if ([v80 isEqualToString:@"com.apple.ink.pen"])
    {
      id v26 = v109;
      v32 = v110;
    }
    else
    {
      double v81 = 12.0;
      id v26 = v109;
      v32 = v110;
      if (([v80 isEqualToString:@"com.apple.ink.pencil"] & 1) == 0)
      {
        if ([v80 isEqualToString:@"com.apple.ink.marker"])
        {
          double v81 = 18.0;
          double v82 = 6.0;
        }
        else
        {
          double v81 = 10.0;
          if (([v80 isEqualToString:@"com.apple.ink.monoline"] & 1) == 0
            && ([v80 isEqualToString:@"com.apple.ink.fountainpen"] & 1) == 0
            && ([v80 isEqualToString:@"com.apple.ink.watercolor"] & 1) == 0)
          {
            int v83 = [v80 isEqualToString:@"com.apple.ink.crayon"];
            if (v83) {
              double v82 = 2.0;
            }
            else {
              double v82 = 0.0;
            }
            if (v83) {
              double v81 = 10.0;
            }
            else {
              double v81 = 0.0;
            }
          }
        }
      }
    }

    [v113 setMinimumBandThickness:v82 andMaximumBandThickness:v81];
    uint64_t v27 = (uint64_t)v113;
  }
  id v84 = (id)v27;

  return v84;
}

+ (id)defaultColorForInkingToolWithIdentifier:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  id v4 = +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v3, @"black");
  id v5 = [v4 color];

  if ([v2 isEqualToString:@"com.apple.ink.pencil"])
  {
    uint64_t v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.0823529412 green:0.494117647 blue:0.984313725 alpha:1.0];
    id v7 = @"blue";
  }
  else if ([v2 isEqualToString:@"com.apple.ink.marker"])
  {
    uint64_t v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.996078431 green:0.815686275 blue:0.188235294 alpha:1.0];
    id v7 = @"yellow";
  }
  else
  {
    if (![v2 isEqualToString:@"com.apple.ink.crayon"]) {
      goto LABEL_8;
    }
    uint64_t v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.988235294 green:0.192156863 blue:0.258823529 alpha:1.0];
    id v7 = @"red";
  }
  char v8 = +[PKSwatchColor swatchColor:identifier:]((uint64_t)PKSwatchColor, v6, v7);
  uint64_t v9 = [v8 color];

  id v5 = (void *)v9;
LABEL_8:
  +[PKInk defaultOpacityForIdentifier:v2];
  id v10 = objc_msgSend(v5, "colorWithAlphaComponent:");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKToolConfiguration *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        localizedName = v6->_localizedName;
        char v8 = self->_localizedName;
        uint64_t v9 = localizedName;
        if (v8 == v9)
        {
        }
        else
        {
          id v10 = v9;
          if (!v8 || !v9) {
            goto LABEL_45;
          }
          int v11 = [(UIImage *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_46;
          }
        }
        baseImage = v6->_baseImage;
        char v8 = self->_baseImage;
        unint64_t v14 = baseImage;
        if ((unint64_t)v8 | v14)
        {
          id v10 = (void *)v14;
          if (!v8 || !v14) {
            goto LABEL_45;
          }
          int v25 = [(UIImage *)v8 isEqual:v14];

          if (!v25) {
            goto LABEL_46;
          }
        }
        shadowPath = v6->_shadowPath;
        char v8 = self->_shadowPath;
        unint64_t v16 = shadowPath;
        if (!((unint64_t)v8 | v16))
        {
LABEL_14:
          if (self->_supportsColor == v6->_supportsColor && self->_supportsOpacity == v6->_supportsOpacity)
          {
            double opacityLabelVerticalOffset = self->_opacityLabelVerticalOffset;
            double v18 = v6->_opacityLabelVerticalOffset;
            if (opacityLabelVerticalOffset == v18
              || vabdd_f64(opacityLabelVerticalOffset, v18) < fabs(v18 * 0.000000999999997))
            {
              if (DKUNilsEquivalentEqualObjects(self->_bandMaskImage, v6->_bandMaskImage))
              {
                if (DKUNilsEquivalentEqualObjects(self->_bandContourImage, v6->_bandContourImage))
                {
                  double bandVerticalOffset = self->_bandVerticalOffset;
                  double v20 = v6->_bandVerticalOffset;
                  if (bandVerticalOffset == v20 || vabdd_f64(bandVerticalOffset, v20) < fabs(v20 * 0.000000999999997))
                  {
                    if (DKUNilsEquivalentEqualObjects(self->_tipMaskImage, v6->_tipMaskImage))
                    {
                      if (DKUNilsEquivalentEqualObjects(self->_tipContourImage, v6->_tipContourImage))
                      {
                        if (DKUNilsEquivalentEqualObjects(self->_shadowPathIncludingTip, v6->_shadowPathIncludingTip))
                        {
                          if (DKUNilsEquivalentEqualHashes(self->_strokeWeightsToButtonImages, v6->_strokeWeightsToButtonImages))
                          {
                            double minimumBandThickness = self->_minimumBandThickness;
                            double v22 = v6->_minimumBandThickness;
                            if (minimumBandThickness == v22
                              || vabdd_f64(minimumBandThickness, v22) < fabs(v22 * 0.000000999999997))
                            {
                              double maximumBandThickness = self->_maximumBandThickness;
                              double v24 = v6->_maximumBandThickness;
                              if ((maximumBandThickness == v24
                                 || vabdd_f64(maximumBandThickness, v24) < fabs(v24 * 0.000000999999997))
                                && self->_isEraserTool == v6->_isEraserTool
                                && self->_inkVersion == v6->_inkVersion
                                && self->_viewControllerProvider == v6->_viewControllerProvider
                                && self->_imageProvider == v6->_imageProvider
                                && self->_supportsLassoBehaviors == v6->_supportsLassoBehaviors
                                && self->_wantsStrokeWeightControl == v6->_wantsStrokeWeightControl)
                              {
                                BOOL v12 = self->_wantsTopLevelOpacityControl == v6->_wantsTopLevelOpacityControl;
LABEL_47:

                                goto LABEL_48;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
LABEL_46:
          BOOL v12 = 0;
          goto LABEL_47;
        }
        id v10 = (void *)v16;
        if (v8 && v16)
        {
          int v26 = [(UIImage *)v8 isEqual:v16];

          if (!v26) {
            goto LABEL_46;
          }
          goto LABEL_14;
        }
LABEL_45:

        goto LABEL_46;
      }
    }
    BOOL v12 = 0;
  }
LABEL_48:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v21 = [(NSString *)self->_localizedName hash];
  uint64_t v3 = [(UIImage *)self->_baseImage hash];
  unint64_t v19 = 0x94D049BB133111EBLL
      * ((0xBF58476D1CE4E5B9 * self->_supportsColor) ^ ((0xBF58476D1CE4E5B9 * self->_supportsColor) >> 27));
  uint64_t v20 = v3;
  unint64_t v4 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * self->_supportsOpacity) ^ ((0xBF58476D1CE4E5B9 * self->_supportsOpacity) >> 27));
  unint64_t v5 = 0xBF58476D1CE4E5B9
     * ((unint64_t)self->_opacityLabelVerticalOffset ^ ((unint64_t)self->_opacityLabelVerticalOffset >> 30));
  unint64_t v6 = 0x94D049BB133111EBLL * (v5 ^ (v5 >> 27));
  uint64_t v18 = [(UIImage *)self->_bandMaskImage hash];
  uint64_t v17 = [(UIImage *)self->_bandContourImage hash];
  unint64_t v7 = 0xBF58476D1CE4E5B9
     * ((unint64_t)self->_bandVerticalOffset ^ ((unint64_t)self->_bandVerticalOffset >> 30));
  unint64_t v8 = 0x94D049BB133111EBLL * (v7 ^ (v7 >> 27));
  uint64_t v9 = [(UIImage *)self->_tipMaskImage hash];
  uint64_t v10 = [(UIImage *)self->_tipContourImage hash];
  uint64_t v11 = [(NSDictionary *)self->_strokeWeightsToButtonImages hash];
  uint64_t v12 = PKHashBytes((uint64_t)&self->_minimumBandThickness, 8);
  uint64_t v13 = PKHashBytes((uint64_t)&self->_maximumBandThickness, 8);
  unint64_t v14 = 0xBF58476D1CE4E5B9 * (self->_inkVersion ^ ((unint64_t)self->_inkVersion >> 30));
  unint64_t v15 = (0x94D049BB133111EBLL
       * ((0xBF58476D1CE4E5B9 * self->_isEraserTool) ^ ((0xBF58476D1CE4E5B9 * self->_isEraserTool) >> 27))) ^ (0x94D049BB133111EBLL * ((0xBF58476D1CE4E5B9 * self->_supportsLassoBehaviors) ^ ((0xBF58476D1CE4E5B9 * self->_supportsLassoBehaviors) >> 27))) ^ (0x94D049BB133111EBLL * ((0xBF58476D1CE4E5B9 * self->_wantsStrokeWeightControl) ^ ((0xBF58476D1CE4E5B9 * self->_wantsStrokeWeightControl) >> 27))) ^ (0x94D049BB133111EBLL * ((0xBF58476D1CE4E5B9 * self->_wantsTopLevelOpacityControl) ^ ((0xBF58476D1CE4E5B9 * self->_wantsTopLevelOpacityControl) >> 27))) ^ (0x94D049BB133111EBLL * (v14 ^ (v14 >> 27)));
  return v15 ^ v20 ^ v21 ^ v18 ^ (v19 >> 31) ^ v17 ^ (v4 >> 31) ^ v9 ^ (v6 >> 31) ^ v10 ^ v11 ^ v12 ^ (v8 >> 31) ^ v13 ^ (v15 >> 31) ^ v19 ^ v4 ^ v6 ^ v8;
}

- (void)setLocalizedName:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"localizedName must not be nil." userInfo:0];
    objc_exception_throw(v7);
  }
  id v8 = v4;
  unint64_t v5 = (NSString *)[v4 copy];
  localizedName = self->_localizedName;
  self->_localizedName = v5;
}

- (void)setBaseImage:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"baseImage must not be nil." userInfo:0];
    objc_exception_throw(v7);
  }
  id v8 = v4;
  unint64_t v5 = (UIImage *)[v4 copy];
  baseImage = self->_baseImage;
  self->_baseImage = v5;
}

- (void)setShadowPath:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"shadowPath must not be nil." userInfo:0];
    objc_exception_throw(v7);
  }
  id v8 = v4;
  unint64_t v5 = (UIBezierPath *)[v4 copy];
  shadowPath = self->_shadowPath;
  self->_shadowPath = v5;
}

- (void)setSupportsColor:(BOOL)a3 andOpacity:(BOOL)a4 defaultColor:(id)a5
{
  BOOL v5 = a4;
  id v8 = (UIColor *)a5;
  if (v5 && !a3)
  {
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Tools can not support opacity without supporting color." userInfo:0];
    objc_exception_throw(v10);
  }
  self->_supportsColor = a3;
  self->_supportsOpacity = v5;
  defaultColor = self->_defaultColor;
  self->_defaultColor = v8;
}

- (void)setSupportsColor:(BOOL)a3 andOpacity:(BOOL)a4
{
}

- (void)clearTipMaskImageAndShadowPathIncludingTip
{
  tipMaskImage = self->_tipMaskImage;
  self->_tipMaskImage = 0;

  shadowPathIncludingTip = self->_shadowPathIncludingTip;
  self->_shadowPathIncludingTip = 0;
}

- (void)setTipMaskImage:(id)a3 withShadowPathIncludingTip:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (!v16)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    unint64_t v14 = @"tipMaskImage must not be nil.";
    goto LABEL_8;
  }
  id v7 = v6;
  if (!v6)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    unint64_t v14 = @"shadowPathIncludingTip must not be nil.";
LABEL_8:
    id v15 = [v12 exceptionWithName:v13 reason:v14 userInfo:0];
    objc_exception_throw(v15);
  }
  id v8 = (UIImage *)[v16 copy];
  tipMaskImage = self->_tipMaskImage;
  self->_tipMaskImage = v8;

  id v10 = (UIBezierPath *)[v7 copy];
  shadowPathIncludingTip = self->_shadowPathIncludingTip;
  self->_shadowPathIncludingTip = v10;
}

- (BOOL)supportsStrokeWeight
{
  id v2 = [(PKToolConfiguration *)self strokeWeightsToButtonImages];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setStrokeWeightsToButtonImages:(id)a3
{
  id v4 = +[PKToolConfiguration _deepCopyStrokeWeightDictionary:a3];
  strokeWeightsToButtonImages = self->_strokeWeightsToButtonImages;
  self->_strokeWeightsToButtonImages = v4;

  cachedStrokeWeightRange = self->_cachedStrokeWeightRange;
  self->_cachedStrokeWeightRange = 0;
}

+ (id)_deepCopyStrokeWeightDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v15);
          uint64_t v12 = (void *)[v11 copy];
          [v4 setObject:v12 forKeyedSubscript:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    uint64_t v13 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)setMinimumBandThickness:(double)a3 andMaximumBandThickness:(double)a4
{
  if (a3 < 0.0)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    uint64_t v6 = @"minimumBandThickness must not be less than zero.";
    goto LABEL_8;
  }
  if (a4 < 0.0)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    uint64_t v6 = @"maximumBandThickness must not be less than zero.";
    goto LABEL_8;
  }
  if (a4 < a3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v5 = *MEMORY[0x1E4F1C3C8];
    uint64_t v6 = @"maximumBandThickness must not be less than minimumBandThickness.";
LABEL_8:
    id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];
    objc_exception_throw(v7);
  }
  self->_double minimumBandThickness = a3;
  self->_double maximumBandThickness = a4;
}

- (double)bandThicknessForStrokeWeight:(void *)a1
{
  if (!a1) {
    return 0.0;
  }
  if (([a1 supportsStrokeWeight] & 1) == 0)
  {
    id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Should not attempt to calculate band thickness a tool configuration that does not support stroke weight." userInfo:0];
    objc_exception_throw(v15);
  }
  id v4 = objc_msgSend(a1, "p_strokeWeightRange");
  [v4 lowerBound];
  double v6 = v5;
  [v4 upperBound];
  double v8 = v7;
  [a1 minimumBandThickness];
  double v10 = v9;
  [a1 maximumBandThickness];
  if (v6 != v8 && vabdd_f64(v6, v8) >= fabs(v8 * 0.000000999999997))
  {
    double v12 = (a2 - v6) / (v8 - v6);
    double v13 = 0.0;
    if (v12 >= 0.0)
    {
      double v13 = (a2 - v6) / (v8 - v6);
      if (v12 > 1.0) {
        double v13 = 1.0;
      }
    }
    double v10 = v10 + (v11 - v10) * v13;
  }

  return v10;
}

+ (id)p_assetImageForToolIdentifier:(id)a3 assetNumber:(unint64_t)a4 bundle:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = v7;
  if ([v9 isEqualToString:@"com.apple.ink.pen"])
  {
    double v10 = @"com.apple.ink.pen.";
  }
  else if ([v9 isEqualToString:@"com.apple.ink.pencil"])
  {
    double v10 = @"com.apple.ink.pencil.";
  }
  else if ([v9 isEqualToString:@"com.apple.ink.marker"])
  {
    double v10 = @"com.apple.ink.marker.";
  }
  else if ([v9 isEqualToString:@"com.apple.ink.monoline"])
  {
    double v10 = @"MonolineTool/StrokeWeight/Weight";
  }
  else if ([v9 isEqualToString:@"com.apple.ink.fountainpen"])
  {
    double v10 = @"FountainPenTool/StrokeWeight/Weight";
  }
  else if ([v9 isEqualToString:@"com.apple.ink.watercolor"])
  {
    double v10 = @"WatercolorTool/StrokeWeight/Weight";
  }
  else if ([v9 isEqualToString:@"com.apple.ink.crayon"])
  {
    double v10 = @"CrayonTool/StrokeWeight/Weight";
  }
  else
  {
    double v10 = 0;
  }

  double v11 = [NSString stringWithFormat:@"%@%zu", v10, a4];
  uint64_t v12 = [MEMORY[0x1E4FB1818] imageNamed:v11 inBundle:v8 compatibleWithTraitCollection:0];
  if (v12)
  {
    double v13 = (void *)v12;
  }
  else
  {
    unint64_t v14 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v18 = a4;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_fault_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_FAULT, "Unable to find stroke weight asset (%zu) for tool identifier (%@). Defaulting to pen.", buf, 0x16u);
    }

    uint64_t v15 = [NSString stringWithFormat:@"%@.%zu", @"com.apple.ink.pen", a4];

    double v13 = [MEMORY[0x1E4FB1818] imageNamed:v15 inBundle:v8 compatibleWithTraitCollection:0];
    double v11 = (void *)v15;
  }

  return v13;
}

+ (id)p_objectEraserImageWithWeight:(double)a3 imageSize:(CGSize)a4
{
  CGFloat v5 = a4.width * 0.5;
  CGFloat v6 = a4.height * 0.5;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", a4.width, a4.height);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__PKToolConfiguration_p_objectEraserImageWithWeight_imageSize___block_invoke;
  v10[3] = &__block_descriptor_56_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v10[4] = a3;
  *(CGFloat *)&v10[5] = v5;
  *(CGFloat *)&v10[6] = v6;
  id v8 = [v7 imageWithActions:v10];

  return v8;
}

void __63__PKToolConfiguration_p_objectEraserImageWithWeight_imageSize___block_invoke(double *a1, void *a2)
{
  uint64_t v3 = [a2 CGContext];
  if (fabs(a1[4]) < 0.00999999978)
  {
    id v4 = (CGContext *)v3;
    id v5 = [MEMORY[0x1E4FB1618] blackColor];
    CGContextSetStrokeColorWithColor(v4, (CGColorRef)[v5 CGColor]);

    CGContextSetLineWidth(v4, 2.0);
    CGContextSetLineCap(v4, kCGLineCapRound);
    CGContextMoveToPoint(v4, a1[5] + -5.0, a1[5] + -5.0);
    CGContextAddLineToPoint(v4, a1[5] + 5.0, a1[6] + 5.0);
    CGContextStrokePath(v4);
    CGContextMoveToPoint(v4, a1[5] + -5.0, a1[5] + 5.0);
    CGContextAddLineToPoint(v4, a1[5] + 5.0, a1[6] + -5.0);
    CGContextStrokePath(v4);
  }
}

+ (id)p_bitmapEraserImageWithWeight:(double)a3 imageSize:(CGSize)a4
{
  CGFloat v4 = a4.width * 0.5;
  CGFloat v5 = a4.height * 0.5;
  double v6 = (a3 + 1.0) * 0.5 * 18.0 + 14.0;
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", a4.width, a4.height);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__PKToolConfiguration_p_bitmapEraserImageWithWeight_imageSize___block_invoke;
  v10[3] = &__block_descriptor_56_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(CGFloat *)&v10[4] = v4;
  *(CGFloat *)&v10[5] = v5;
  *(double *)&v10[6] = v6;
  id v8 = [v7 imageWithActions:v10];

  return v8;
}

void __63__PKToolConfiguration_p_bitmapEraserImageWithWeight_imageSize___block_invoke(double *a1, void *a2)
{
  uint64_t v3 = (CGContext *)[a2 CGContext];
  id v4 = [MEMORY[0x1E4FB1618] blackColor];
  CGContextSetStrokeColorWithColor(v3, (CGColorRef)[v4 CGColor]);

  CGContextSetLineWidth(v3, 2.0);
  double v5 = a1[6];
  double v6 = a1[4] - v5 * 0.5;
  double v7 = a1[5] - v5 * 0.5;
  double v8 = v5;

  CGContextStrokeEllipseInRect(v3, *(CGRect *)&v6);
}

- (id)p_strokeWeightRange
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_cachedStrokeWeightRange)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    cachedStrokeWeightRange = [(PKToolConfiguration *)self strokeWeightsToButtonImages];
    uint64_t v4 = [cachedStrokeWeightRange countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (!v4)
    {
LABEL_18:

      goto LABEL_19;
    }
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    double v7 = 1.79769313e308;
    double v8 = 2.22507386e-308;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(cachedStrokeWeightRange);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) floatValue];
        double v11 = v10;
        if (v7 > v11) {
          double v7 = v11;
        }
        if (v8 < v11) {
          double v8 = v11;
        }
      }
      uint64_t v5 = [cachedStrokeWeightRange countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);

    if (v7 < 1.79769313e308 && v8 > 2.22507386e-308)
    {
      double v13 = [[PKFloatRange alloc] initWithLowerBound:v7 upperBound:v8];
      cachedStrokeWeightRange = self->_cachedStrokeWeightRange;
      self->_cachedStrokeWeightRange = v13;
      goto LABEL_18;
    }
  }
LABEL_19:
  unint64_t v14 = self->_cachedStrokeWeightRange;

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLocalizedName:baseImage:shadowPath:", self->_localizedName, self->_baseImage, self->_shadowPath);
  *(unsigned char *)(v4 + 18) = self->_supportsColor;
  *(unsigned char *)(v4 + 19) = self->_supportsOpacity;
  *(double *)(v4 + 56) = self->_opacityLabelVerticalOffset;
  uint64_t v5 = [(UIImage *)self->_bandMaskImage copy];
  uint64_t v6 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v5;

  uint64_t v7 = [(UIImage *)self->_bandContourImage copy];
  double v8 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v7;

  *(double *)(v4 + 80) = self->_bandVerticalOffset;
  uint64_t v9 = [(UIImage *)self->_tipMaskImage copy];
  float v10 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = v9;

  uint64_t v11 = [(UIImage *)self->_tipContourImage copy];
  uint64_t v12 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v11;

  uint64_t v13 = [(UIBezierPath *)self->_shadowPathIncludingTip copy];
  unint64_t v14 = *(void **)(v4 + 104);
  *(void *)(v4 + 104) = v13;

  uint64_t v15 = +[PKToolConfiguration _deepCopyStrokeWeightDictionary:self->_strokeWeightsToButtonImages];
  long long v16 = *(void **)(v4 + 112);
  *(void *)(v4 + 112) = v15;

  *(double *)(v4 + 120) = self->_minimumBandThickness;
  *(double *)(v4 + 128) = self->_maximumBandThickness;
  *(unsigned char *)(v4 + 21) = self->_isEraserTool;
  *(void *)(v4 + 152) = self->_inkVersion;
  uint64_t v17 = [self->_viewControllerProvider copy];
  long long v18 = *(void **)(v4 + 144);
  *(void *)(v4 + 144) = v17;

  uint64_t v19 = [self->_imageProvider copy];
  id v20 = *(void **)(v4 + 160);
  *(void *)(v4 + 160) = v19;

  *(unsigned char *)(v4 + 20) = self->_supportsLassoBehaviors;
  *(unsigned char *)(v4 + 16) = self->_wantsStrokeWeightControl;
  *(unsigned char *)(v4 + 17) = self->_wantsTopLevelOpacityControl;
  return (id)v4;
}

- (CGSize)strokeWeightButtonSize
{
  BOOL v2 = [(PKToolConfiguration *)self isEraserTool];
  double v3 = 32.0;
  if (v2) {
    double v3 = 44.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (UIImage)baseImage
{
  return self->_baseImage;
}

- (UIBezierPath)shadowPath
{
  return self->_shadowPath;
}

- (BOOL)supportsColor
{
  return self->_supportsColor;
}

- (UIColor)defaultColor
{
  return self->_defaultColor;
}

- (BOOL)supportsOpacity
{
  return self->_supportsOpacity;
}

- (double)opacityLabelVerticalOffset
{
  return self->_opacityLabelVerticalOffset;
}

- (void)setOpacityLabelVerticalOffset:(double)a3
{
  self->_double opacityLabelVerticalOffset = a3;
}

- (UIImage)bandMaskImage
{
  return self->_bandMaskImage;
}

- (void)setBandMaskImage:(id)a3
{
}

- (UIImage)bandContourImage
{
  return self->_bandContourImage;
}

- (void)setBandContourImage:(id)a3
{
}

- (double)bandVerticalOffset
{
  return self->_bandVerticalOffset;
}

- (void)setBandVerticalOffset:(double)a3
{
  self->_double bandVerticalOffset = a3;
}

- (UIImage)tipMaskImage
{
  return self->_tipMaskImage;
}

- (UIImage)tipContourImage
{
  return self->_tipContourImage;
}

- (void)setTipContourImage:(id)a3
{
}

- (UIBezierPath)shadowPathIncludingTip
{
  return self->_shadowPathIncludingTip;
}

- (NSDictionary)strokeWeightsToButtonImages
{
  return self->_strokeWeightsToButtonImages;
}

- (double)minimumBandThickness
{
  return self->_minimumBandThickness;
}

- (double)maximumBandThickness
{
  return self->_maximumBandThickness;
}

- (BOOL)isEraserTool
{
  return self->_isEraserTool;
}

- (UIColor)weightButtonTintColorOverride
{
  return self->_weightButtonTintColorOverride;
}

- (id)viewControllerProvider
{
  return self->_viewControllerProvider;
}

- (void)setViewControllerProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_imageProvider, 0);
  objc_storeStrong(&self->_viewControllerProvider, 0);
  objc_storeStrong((id *)&self->_weightButtonTintColorOverride, 0);
  objc_storeStrong((id *)&self->_strokeWeightsToButtonImages, 0);
  objc_storeStrong((id *)&self->_shadowPathIncludingTip, 0);
  objc_storeStrong((id *)&self->_tipContourImage, 0);
  objc_storeStrong((id *)&self->_tipMaskImage, 0);
  objc_storeStrong((id *)&self->_bandContourImage, 0);
  objc_storeStrong((id *)&self->_bandMaskImage, 0);
  objc_storeStrong((id *)&self->_defaultColor, 0);
  objc_storeStrong((id *)&self->_shadowPath, 0);
  objc_storeStrong((id *)&self->_baseImage, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);

  objc_storeStrong((id *)&self->_cachedStrokeWeightRange, 0);
}

@end