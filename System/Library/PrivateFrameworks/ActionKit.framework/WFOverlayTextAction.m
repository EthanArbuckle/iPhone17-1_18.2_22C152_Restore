@interface WFOverlayTextAction
- (BOOL)strokeEnabled;
- (BOOL)useProportionalSizing;
- (CGRect)drawingRectForImage:(id)a3;
- (double)boxWidth;
- (double)fontSize;
- (double)imageHeight;
- (double)imageWidth;
- (double)offset;
- (double)rotation;
- (double)strokeWidth;
- (double)xPosition;
- (double)yPosition;
- (id)font;
- (id)fontDescriptor;
- (id)outlinedTextAttributes;
- (id)paragraphStyle;
- (id)parameterKeysIgnoredForParameterSummary;
- (id)strokeColor;
- (id)strokeWidthPercentage;
- (id)text;
- (id)textAttributes;
- (id)textColor;
- (id)textPosition;
- (int64_t)textAlignment;
- (void)overlayImage:(id)a3 inContext:(id)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setImageHeight:(double)a3;
- (void)setImageWidth:(double)a3;
@end

@implementation WFOverlayTextAction

- (void)setImageHeight:(double)a3
{
  self->_imageHeight = a3;
}

- (double)imageHeight
{
  return self->_imageHeight;
}

- (void)setImageWidth:(double)a3
{
  self->_imageWidth = a3;
}

- (double)imageWidth
{
  return self->_imageWidth;
}

- (BOOL)useProportionalSizing
{
  v2 = [(WFOverlayTextAction *)self parameterValueForKey:@"WFSizingMethod" ofClass:objc_opt_class()];
  char v3 = [v2 isEqualToString:@"Proportional"];

  return v3;
}

- (id)strokeColor
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFOverlayTextAction *)self parameterValueForKey:@"WFTextStrokeColor" ofClass:v3];
}

- (double)strokeWidth
{
  BOOL v3 = [(WFOverlayTextAction *)self useProportionalSizing];
  uint64_t v4 = objc_opt_class();
  if (v3)
  {
    v5 = [(WFOverlayTextAction *)self parameterValueForKey:@"WFPercentageTextStrokeWidth" ofClass:v4];
    [v5 floatValue];
    double v7 = v6;
    [(WFOverlayTextAction *)self fontSize];
    double v9 = v8 * v7;
  }
  else
  {
    v5 = [(WFOverlayTextAction *)self parameterValueForKey:@"WFTextStrokeWidth" ofClass:v4];
    [v5 floatValue];
    double v9 = v10;
  }

  return v9;
}

- (double)rotation
{
  v2 = [(WFOverlayTextAction *)self parameterValueForKey:@"WFTextRotation" ofClass:objc_opt_class()];
  [v2 floatValue];
  double v4 = v3;

  return v4;
}

- (id)textColor
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFOverlayTextAction *)self parameterValueForKey:@"WFTextColor" ofClass:v3];
}

- (double)fontSize
{
  BOOL v3 = [(WFOverlayTextAction *)self useProportionalSizing];
  uint64_t v4 = objc_opt_class();
  if (v3)
  {
    v5 = [(WFOverlayTextAction *)self parameterValueForKey:@"WFPercentageFontSize" ofClass:v4];
    [v5 floatValue];
    double v7 = v6;
    [(WFOverlayTextAction *)self imageWidth];
    double v9 = v8 * v7;
  }
  else
  {
    v5 = [(WFOverlayTextAction *)self parameterValueForKey:@"WFFontSize" ofClass:v4];
    [v5 floatValue];
    double v9 = v10;
  }

  return v9;
}

- (id)fontDescriptor
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFOverlayTextAction *)self parameterValueForKey:@"WFFont" ofClass:v3];
}

- (BOOL)strokeEnabled
{
  v2 = [(WFOverlayTextAction *)self parameterValueForKey:@"WFTextOutlineEnabled" ofClass:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (double)offset
{
  if ([(WFOverlayTextAction *)self useProportionalSizing])
  {
    char v3 = [(WFOverlayTextAction *)self textPosition];
    if (WFTextPositionIsTopPosition(v3))
    {
    }
    else
    {
      double v7 = [(WFOverlayTextAction *)self textPosition];
      int IsBottomPosition = WFTextPositionIsBottomPosition(v7);

      if (!IsBottomPosition)
      {
        uint64_t v4 = [(WFOverlayTextAction *)self parameterValueForKey:@"WFPercentageTextOffset" ofClass:objc_opt_class()];
        [v4 floatValue];
        double v10 = v12;
        [(WFOverlayTextAction *)self imageWidth];
        goto LABEL_8;
      }
    }
    uint64_t v4 = [(WFOverlayTextAction *)self parameterValueForKey:@"WFPercentageTextOffset" ofClass:objc_opt_class()];
    [v4 floatValue];
    double v10 = v9;
    [(WFOverlayTextAction *)self imageHeight];
LABEL_8:
    double v6 = v11 * v10;
    goto LABEL_9;
  }
  uint64_t v4 = [(WFOverlayTextAction *)self parameterValueForKey:@"WFTextOffset" ofClass:objc_opt_class()];
  [v4 floatValue];
  double v6 = v5;
LABEL_9:

  return v6;
}

- (double)yPosition
{
  BOOL v3 = [(WFOverlayTextAction *)self useProportionalSizing];
  uint64_t v4 = objc_opt_class();
  if (v3)
  {
    float v5 = [(WFOverlayTextAction *)self parameterValueForKey:@"WFPercentageTextY" ofClass:v4];
    [v5 floatValue];
    double v7 = v6;
    [(WFOverlayTextAction *)self imageWidth];
    double v9 = v8 * v7;
  }
  else
  {
    float v5 = [(WFOverlayTextAction *)self parameterValueForKey:@"WFTextY" ofClass:v4];
    [v5 floatValue];
    double v9 = v10;
  }

  return v9;
}

- (double)xPosition
{
  BOOL v3 = [(WFOverlayTextAction *)self useProportionalSizing];
  uint64_t v4 = objc_opt_class();
  if (v3)
  {
    float v5 = [(WFOverlayTextAction *)self parameterValueForKey:@"WFPercentageTextX" ofClass:v4];
    [v5 floatValue];
    double v7 = v6;
    [(WFOverlayTextAction *)self imageWidth];
    double v9 = v8 * v7;
  }
  else
  {
    float v5 = [(WFOverlayTextAction *)self parameterValueForKey:@"WFTextX" ofClass:v4];
    [v5 floatValue];
    double v9 = v10;
  }

  return v9;
}

- (int64_t)textAlignment
{
  v2 = [(WFOverlayTextAction *)self parameterValueForKey:@"WFTextAlignment" ofClass:objc_opt_class()];
  BOOL v3 = v2;
  if (v2 == @"Left") {
    goto LABEL_4;
  }
  if (!v2)
  {
LABEL_10:
    int64_t v5 = 1;
    goto LABEL_11;
  }
  char v4 = [(__CFString *)v2 isEqualToString:@"Left"];

  if ((v4 & 1) == 0)
  {
    float v6 = v3;
    if (v6 != @"Center")
    {
      double v7 = v6;
      char v8 = [(__CFString *)v6 isEqualToString:@"Center"];

      if ((v8 & 1) == 0)
      {
        double v9 = v7;
        if (v9 == @"Right"
          || (float v10 = v9,
              int v11 = [(__CFString *)v9 isEqualToString:@"Right"],
              v10,
              v11))
        {
          int64_t v5 = 2;
          goto LABEL_11;
        }
      }
    }
    goto LABEL_10;
  }
LABEL_4:
  int64_t v5 = 0;
LABEL_11:

  return v5;
}

- (id)textPosition
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFOverlayTextAction *)self parameterValueForKey:@"WFTextPosition" ofClass:v3];
}

- (id)text
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFOverlayTextAction *)self parameterValueForKey:@"WFText" ofClass:v3];
}

- (id)parameterKeysIgnoredForParameterSummary
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"WFTextOutlineEnabled", @"WFFont", @"WFFontSize", @"WFPercentageFontSize", @"WFTextColor", @"WFTextRotation", @"WFTextStrokeWidth", @"WFPercentageTextStrokeWidth", @"WFTextStrokeColor", @"WFSizingMethod", @"WFTextAlignment", @"WFTextBoxWidth", @"WFPercentageTextBoxWidth", 0);
  return v2;
}

- (id)font
{
  uint64_t v3 = [(WFOverlayTextAction *)self fontDescriptor];
  [(WFOverlayTextAction *)self fontSize];
  char v4 = objc_msgSend(v3, "fontWithSize:");

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    uint64_t v11 = 0;
    float v12 = &v11;
    uint64_t v13 = 0x2050000000;
    float v6 = (void *)getUIFontClass_softClass;
    uint64_t v14 = getUIFontClass_softClass;
    if (!getUIFontClass_softClass)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __getUIFontClass_block_invoke;
      v10[3] = &unk_264E5EC88;
      v10[4] = &v11;
      __getUIFontClass_block_invoke((uint64_t)v10);
      float v6 = (void *)v12[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v11, 8);
    [(WFOverlayTextAction *)self fontSize];
    objc_msgSend(v7, "systemFontOfSize:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v8 = v5;

  return v8;
}

- (id)strokeWidthPercentage
{
  [(WFOverlayTextAction *)self strokeWidth];
  double v4 = v3;
  [(WFOverlayTextAction *)self fontSize];
  double v7 = v4 / v5 * -100.0;
  float v6 = NSNumber;
  *(float *)&double v7 = v7;
  return (id)[v6 numberWithFloat:v7];
}

- (id)outlinedTextAttributes
{
  v27[2] = *MEMORY[0x263EF8340];
  double v3 = [(WFOverlayTextAction *)self textAttributes];
  double v4 = (void *)[v3 mutableCopy];

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  double v5 = (id *)getNSStrokeColorAttributeNameSymbolLoc_ptr;
  uint64_t v24 = getNSStrokeColorAttributeNameSymbolLoc_ptr;
  if (!getNSStrokeColorAttributeNameSymbolLoc_ptr)
  {
    float v6 = UIKitLibrary();
    v22[3] = (uint64_t)dlsym(v6, "NSStrokeColorAttributeName");
    getNSStrokeColorAttributeNameSymbolLoc_ptr = v22[3];
    double v5 = (id *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v5)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    v18 = [NSString stringWithUTF8String:"NSString *getNSStrokeColorAttributeName(void)"];
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"WFOverlayTextAction.m", 20, @"%s", dlerror());

    goto LABEL_12;
  }
  id v7 = *v5;
  id v25 = v7;
  char v8 = [(WFOverlayTextAction *)self strokeColor];
  double v9 = [v8 platformColor];
  v27[0] = v9;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  float v10 = (id *)getNSStrokeWidthAttributeNameSymbolLoc_ptr;
  uint64_t v24 = getNSStrokeWidthAttributeNameSymbolLoc_ptr;
  if (!getNSStrokeWidthAttributeNameSymbolLoc_ptr)
  {
    uint64_t v11 = UIKitLibrary();
    v22[3] = (uint64_t)dlsym(v11, "NSStrokeWidthAttributeName");
    getNSStrokeWidthAttributeNameSymbolLoc_ptr = v22[3];
    float v10 = (id *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v10)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    v20 = [NSString stringWithUTF8String:"NSString *getNSStrokeWidthAttributeName(void)"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"WFOverlayTextAction.m", 19, @"%s", dlerror());

LABEL_12:
    __break(1u);
  }
  id v26 = *v10;
  id v12 = v26;
  uint64_t v13 = [(WFOverlayTextAction *)self strokeWidthPercentage];
  v27[1] = v13;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v25 count:2];
  [v4 addEntriesFromDictionary:v14];

  v15 = (void *)[v4 copy];
  return v15;
}

- (id)textAttributes
{
  v30[3] = *MEMORY[0x263EF8340];
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  double v3 = (id *)getNSForegroundColorAttributeNameSymbolLoc_ptr;
  uint64_t v27 = getNSForegroundColorAttributeNameSymbolLoc_ptr;
  if (!getNSForegroundColorAttributeNameSymbolLoc_ptr)
  {
    double v4 = UIKitLibrary();
    v25[3] = (uint64_t)dlsym(v4, "NSForegroundColorAttributeName");
    getNSForegroundColorAttributeNameSymbolLoc_ptr = v25[3];
    double v3 = (id *)v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v3)
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    v19 = [NSString stringWithUTF8String:"NSString *getNSForegroundColorAttributeName(void)"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"WFOverlayTextAction.m", 16, @"%s", dlerror());

    goto LABEL_16;
  }
  id v5 = *v3;
  v28[0] = v5;
  float v6 = [(WFOverlayTextAction *)self textColor];
  id v7 = [v6 platformColor];
  v30[0] = v7;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v8 = (id *)getNSFontAttributeNameSymbolLoc_ptr;
  uint64_t v27 = getNSFontAttributeNameSymbolLoc_ptr;
  if (!getNSFontAttributeNameSymbolLoc_ptr)
  {
    double v9 = UIKitLibrary();
    v25[3] = (uint64_t)dlsym(v9, "NSFontAttributeName");
    getNSFontAttributeNameSymbolLoc_ptr = v25[3];
    char v8 = (id *)v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v8)
  {
    v20 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v21 = [NSString stringWithUTF8String:"NSString *getNSFontAttributeName(void)"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"WFOverlayTextAction.m", 17, @"%s", dlerror());

    goto LABEL_16;
  }
  id v10 = *v8;
  v28[1] = v10;
  uint64_t v11 = [(WFOverlayTextAction *)self font];
  v30[1] = v11;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  id v12 = (id *)getNSParagraphStyleAttributeNameSymbolLoc_ptr;
  uint64_t v27 = getNSParagraphStyleAttributeNameSymbolLoc_ptr;
  if (!getNSParagraphStyleAttributeNameSymbolLoc_ptr)
  {
    uint64_t v13 = UIKitLibrary();
    v25[3] = (uint64_t)dlsym(v13, "NSParagraphStyleAttributeName");
    getNSParagraphStyleAttributeNameSymbolLoc_ptr = v25[3];
    id v12 = (id *)v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v12)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v23 = [NSString stringWithUTF8String:"NSString *getNSParagraphStyleAttributeName(void)"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"WFOverlayTextAction.m", 18, @"%s", dlerror());

LABEL_16:
    __break(1u);
  }
  id v29 = *v12;
  id v14 = v29;
  v15 = [(WFOverlayTextAction *)self paragraphStyle];
  v30[2] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v30 forKeys:v28 count:3];

  return v16;
}

- (id)paragraphStyle
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2050000000;
  double v3 = (void *)getNSParagraphStyleClass_softClass;
  uint64_t v13 = getNSParagraphStyleClass_softClass;
  if (!getNSParagraphStyleClass_softClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getNSParagraphStyleClass_block_invoke;
    v9[3] = &unk_264E5EC88;
    v9[4] = &v10;
    __getNSParagraphStyleClass_block_invoke((uint64_t)v9);
    double v3 = (void *)v11[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v10, 8);
  id v5 = [v4 defaultParagraphStyle];
  float v6 = (void *)[v5 mutableCopy];

  objc_msgSend(v6, "setAlignment:", -[WFOverlayTextAction textAlignment](self, "textAlignment"));
  [v6 setLineBreakMode:0];
  id v7 = (void *)[v6 copy];

  return v7;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClass:v5 completionHandler:v6];
}

void __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke_2;
    v9[3] = &unk_264E58F98;
    uint64_t v10 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke_6;
    v8[3] = &unk_264E5E840;
    v8[4] = v10;
    [v6 transformItemsUsingBlock:v9 completionHandler:v8];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

void __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke_3;
  v9[3] = &unk_264E5DB78;
  id v10 = v5;
  id v11 = v6;
  void v9[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = v6;
  [v7 getFileRepresentation:v9 forType:0];
}

void __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    WFImageSizeFromFile();
    id v5 = *(id *)(a1 + 48);
    id v4 = *(id *)(a1 + 40);
    WFAsyncTransformedImageFromImage();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) overlayImage:a2 inContext:a3];
}

void __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  id v13 = v5;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x263F337C8];
    id v8 = *(void **)(a1 + 32);
    id v9 = a3;
    id v10 = [v8 attributionSet];
    id v11 = [v7 itemWithFile:v13 attributionSet:v10];
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v11, v9);
  }
  else
  {
    uint64_t v12 = *(void (**)(uint64_t, void, id))(v6 + 16);
    id v10 = a3;
    v12(v6, 0, v10);
  }
}

- (CGRect)drawingRectForImage:(id)a3
{
  id v4 = a3;
  [v4 CGImageSize];
  double v6 = v5;
  [v4 CGImageSize];
  double v8 = v7;

  [(WFOverlayTextAction *)self boxWidth];
  double v10 = v9;
  id v11 = [(WFOverlayTextAction *)self text];
  if (v10 == 0.0)
  {
    v16 = [(WFOverlayTextAction *)self textAttributes];
    double v18 = 1.79769313e308;
    v17 = v11;
    double v19 = 1.79769313e308;
    uint64_t v20 = 2;
  }
  else
  {
    [(WFOverlayTextAction *)self boxWidth];
    double v13 = v12;
    [(WFOverlayTextAction *)self imageHeight];
    double v15 = v14;
    v16 = [(WFOverlayTextAction *)self textAttributes];
    v17 = v11;
    double v18 = v13;
    double v19 = v15;
    uint64_t v20 = 3;
  }
  objc_msgSend(v17, "boundingRectWithSize:options:attributes:context:", v20, v16, 0, v18, v19);
  double v22 = v21;
  double v24 = v23;

  id v25 = [(WFOverlayTextAction *)self textPosition];
  if (([v25 isEqualToString:@"Top Left"] & 1) != 0
    || [v25 isEqualToString:@"Middle Left"])
  {

LABEL_7:
    [(WFOverlayTextAction *)self offset];
    double v27 = v26 + 0.0;
    goto LABEL_8;
  }
  int v41 = [v25 isEqualToString:@"Bottom Left"];

  if (v41) {
    goto LABEL_7;
  }
  id v42 = [(WFOverlayTextAction *)self textPosition];
  if (([v42 isEqualToString:@"Top Center"] & 1) != 0
    || [v42 isEqualToString:@"Center"])
  {

LABEL_21:
    double v27 = v6 * 0.5 - v22 * 0.5;
    goto LABEL_8;
  }
  int v47 = [v42 isEqualToString:@"Bottom Center"];

  if (v47) {
    goto LABEL_21;
  }
  id v48 = [(WFOverlayTextAction *)self textPosition];
  if (([v48 isEqualToString:@"Top Right"] & 1) != 0
    || [v48 isEqualToString:@"Middle Right"])
  {

LABEL_29:
    [(WFOverlayTextAction *)self offset];
    double v27 = v6 - v22 - v49;
    goto LABEL_8;
  }
  int v50 = [v48 isEqualToString:@"Bottom Right"];

  double v27 = 0.0;
  if (v50) {
    goto LABEL_29;
  }
LABEL_8:
  v28 = [(WFOverlayTextAction *)self textPosition];
  int IsTopPosition = WFTextPositionIsTopPosition(v28);

  if (IsTopPosition)
  {
    [(WFOverlayTextAction *)self offset];
    double v31 = v30 + 0.0;
    goto LABEL_14;
  }
  id v32 = [(WFOverlayTextAction *)self textPosition];
  if (([v32 isEqualToString:@"Middle Left"] & 1) != 0
    || [v32 isEqualToString:@"Center"])
  {

LABEL_13:
    double v31 = (v8 - v24) * 0.5;
    goto LABEL_14;
  }
  int v43 = [v32 isEqualToString:@"Middle Right"];

  if (v43) {
    goto LABEL_13;
  }
  v44 = [(WFOverlayTextAction *)self textPosition];
  int IsBottomPosition = WFTextPositionIsBottomPosition(v44);

  double v31 = 0.0;
  if (IsBottomPosition)
  {
    [(WFOverlayTextAction *)self offset];
    double v31 = v8 - v24 - v46;
  }
LABEL_14:
  v33 = [(WFOverlayTextAction *)self textPosition];
  int v34 = [v33 isEqualToString:@"Custom Position"];

  if (v34)
  {
    [(WFOverlayTextAction *)self yPosition];
    double v31 = v35 + 0.0;
    [(WFOverlayTextAction *)self xPosition];
    double v27 = v36;
  }
  double v37 = v27;
  double v38 = v31;
  double v39 = v22;
  double v40 = v24;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (double)boxWidth
{
  BOOL v3 = [(WFOverlayTextAction *)self useProportionalSizing];
  uint64_t v4 = objc_opt_class();
  if (v3)
  {
    double v5 = [(WFOverlayTextAction *)self parameterValueForKey:@"WFPercentageTextBoxWidth" ofClass:v4];
    [v5 floatValue];
    double v7 = v6;
    [(WFOverlayTextAction *)self imageWidth];
    double v9 = v8 * v7;
  }
  else
  {
    double v5 = [(WFOverlayTextAction *)self parameterValueForKey:@"WFTextBoxWidth" ofClass:v4];
    [v5 floatValue];
    double v9 = v10;
  }

  return v9;
}

- (void)overlayImage:(id)a3 inContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 CGImageSize];
  double v9 = v8;
  [v7 CGImageSize];
  double v11 = v10;
  [v7 CGImageSize];
  -[WFOverlayTextAction setImageWidth:](self, "setImageWidth:");
  [v7 CGImageSize];
  [(WFOverlayTextAction *)self setImageHeight:v12];
  [(WFOverlayTextAction *)self drawingRectForImage:v7];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [v6 becomeCurrent];
  objc_msgSend(v7, "drawInContext:inRect:", v6, 0.0, 0.0, v9, v11);

  v38.origin.x = v14;
  v38.origin.y = v16;
  v38.size.width = v18;
  v38.size.height = v20;
  CGFloat MidX = CGRectGetMidX(v38);
  v39.origin.x = v14;
  v39.origin.y = v16;
  v39.size.width = v18;
  v39.size.height = v20;
  CGFloat MidY = CGRectGetMidY(v39);
  id v23 = v6;
  CGContextSaveGState((CGContextRef)[v23 CGContext]);
  id v24 = v23;
  CGContextTranslateCTM((CGContextRef)[v24 CGContext], MidX, MidY);
  id v25 = v24;
  double v26 = (CGContext *)[v25 CGContext];
  [(WFOverlayTextAction *)self rotation];
  CGContextRotateCTM(v26, v27 * 3.14159265 / 180.0);
  [(WFOverlayTextAction *)self boxWidth];
  if (v28 == 0.0) {
    uint64_t v29 = 2;
  }
  else {
    uint64_t v29 = 3;
  }
  if ([(WFOverlayTextAction *)self strokeEnabled])
  {
    [(WFOverlayTextAction *)self strokeWidth];
    if (v30 != 0.0)
    {
      double v31 = [(WFOverlayTextAction *)self strokeColor];

      if (v31)
      {
        id v32 = [(WFOverlayTextAction *)self text];
        v33 = [(WFOverlayTextAction *)self outlinedTextAttributes];
        objc_msgSend(v32, "drawWithRect:options:attributes:context:", v29, v33, 0, v18 * -0.5, v20 * -0.5, v18, v20);
      }
    }
  }
  int v34 = [(WFOverlayTextAction *)self text];
  double v35 = [(WFOverlayTextAction *)self textAttributes];
  objc_msgSend(v34, "drawWithRect:options:attributes:context:", v29, v35, 0, v18 * -0.5, v20 * -0.5, v18, v20);

  id v36 = v25;
  CGContextRestoreGState((CGContextRef)[v36 CGContext]);
  [v36 resignCurrent];
}

@end