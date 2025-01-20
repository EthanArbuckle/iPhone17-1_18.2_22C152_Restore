@interface AKPopupAdornmentLayer
- (void)updateAdornmentElements;
- (void)updateSublayersWithScale:(double)a3;
@end

@implementation AKPopupAdornmentLayer

- (void)updateAdornmentElements
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v3 = [(AKPopupAdornmentLayer *)self sublayers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v37;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v37 != v6) {
        objc_enumerationMutation(v3);
      }
      v8 = *(void **)(*((void *)&v36 + 1) + 8 * v7);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v9 = v8;

    if (v9) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  v9 = objc_alloc_init(AKMiniNoteLayer);
  [(AKMiniNoteLayer *)v9 setBorderWidth:1.0];
  [(AKPopupAdornmentLayer *)self addSublayer:v9];
LABEL_12:
  v10 = [(AKAdornmentLayer *)self annotation];
  v11 = [v10 parentAnnotation];
  v12 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v14 = v11;
    v15 = [v14 color];
    int64_t v16 = +[AKHighlightAppearanceHelper attributeTagForHighlightOfColor:v15];

    if (v16 == 763000)
    {
      id v17 = [v14 color];
      v18 = v17;
    }
    else
    {
      v18 = +[AKHighlightAppearanceHelper colorForNoteOfHighlightAttributeTag:v16];
      id v17 = +[AKHighlightAppearanceHelper borderColorForNoteOfHighlightAttributeTag:v16];
    }
    id v19 = v18;
    -[AKMiniNoteLayer setBackgroundColor:](v9, "setBackgroundColor:", [v19 CGColor]);
    id v20 = v17;
    -[AKMiniNoteLayer setBorderColor:](v9, "setBorderColor:", [v20 CGColor]);
  }
  v21 = [(AKAdornmentLayer *)self pageController];
  [v10 rectangle];
  CGFloat x = v42.origin.x;
  CGFloat y = v42.origin.y;
  double width = v42.size.width;
  double height = v42.size.height;
  double MidX = CGRectGetMidX(v42);
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.double width = width;
  v43.size.double height = height;
  double MidY = CGRectGetMidY(v43);
  v28 = [v21 geometryHelper];
  objc_msgSend(v28, "convertPoint:fromModelToLayer:", self, MidX, MidY);
  double v30 = v29;
  double v32 = v31;

  -[AKMiniNoteLayer setBounds:](v9, "setBounds:", 0.0, 0.0, width, height);
  -[AKMiniNoteLayer setAnchorPoint:](v9, "setAnchorPoint:", 0.5, 0.5);
  -[AKMiniNoteLayer setPosition:](v9, "setPosition:", v30, v32);
  [(AKAdornmentLayer *)self currentScaleFactor];
  if (v33 != 9.22337204e18)
  {
    CGAffineTransformMakeScale(&v35, 1.0 / v33, 1.0 / v33);
    [(AKMiniNoteLayer *)v9 setAffineTransform:&v35];
  }
  v34.receiver = self;
  v34.super_class = (Class)AKPopupAdornmentLayer;
  [(AKAdornmentLayer *)&v34 updateAdornmentElements];
  [MEMORY[0x263F158F8] commit];
}

- (void)updateSublayersWithScale:(double)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(AKPopupAdornmentLayer *)self sublayers];
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [v6 setBorderWidth:1.0 / a3];
  v10.receiver = self;
  v10.super_class = (Class)AKPopupAdornmentLayer;
  [(AKAdornmentLayer *)&v10 updateSublayersWithScale:a3];
}

@end