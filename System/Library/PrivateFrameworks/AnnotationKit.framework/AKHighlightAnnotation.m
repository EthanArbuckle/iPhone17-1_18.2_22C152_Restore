@interface AKHighlightAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3;
+ (id)keyPathsForValuesAffectingDrawingBounds;
+ (id)keyPathsForValuesAffectingHitTestBounds;
- (AKHighlightAnnotation)initWithCoder:(id)a3;
- (NSArray)quadPoints;
- (UIColor)color;
- (id)displayName;
- (id)keysForValuesToObserveForRedrawing;
- (id)keysForValuesToObserveForUndo;
- (unint64_t)style;
- (void)encodeWithCoder:(id)a3;
- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4;
- (void)setColor:(id)a3;
- (void)setQuadPoints:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)translateBy:(CGPoint)a3;
@end

@implementation AKHighlightAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKHighlightAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75A70];

  return v4;
}

+ (id)keyPathsForValuesAffectingDrawingBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKHighlightAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75A88];

  return v4;
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"style"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Style";
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"color"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Color";
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"quadPoints"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Range";
LABEL_7:
    v8 = [v5 localizedStringForKey:v7 value:&stru_26EA57918 table:@"AnnotationStrings"];

    if (v8) {
      goto LABEL_9;
    }
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___AKHighlightAnnotation;
  v8 = objc_msgSendSuper2(&v10, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
LABEL_9:

  return v8;
}

- (id)keysForValuesToObserveForUndo
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKHighlightAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForUndo];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75AA0];

  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKHighlightAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForRedrawing];
  id v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75AB8];

  return v4;
}

- (id)displayName
{
  v2 = +[AKController akBundle];
  v3 = [v2 localizedStringForKey:@"Highlight" value:&stru_26EA57918 table:@"AnnotationStrings"];

  return v3;
}

- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v31 = *MEMORY[0x263EF8340];
  +[AKGeometryHelper adjustOriginalExifOrientationOnAnnotation:self flatteningOriginalModelExif:a3];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  +[AKGeometryHelper affineTransformFlatteningOriginalModelExif:withOriginalModelSize:](AKGeometryHelper, "affineTransformFlatteningOriginalModelExif:withOriginalModelSize:", a3, width, height);
  v8 = (void *)MEMORY[0x263EFF980];
  v9 = [(AKHighlightAnnotation *)self quadPoints];
  objc_super v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v11 = [(AKHighlightAnnotation *)self quadPoints];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        if (v16) {
          [v16 quadrilateralValue];
        }
        v18[0] = v19;
        v18[1] = v20;
        v18[2] = v21;
        v18[3] = v22;
        v17 = [MEMORY[0x263F08D40] valueWithQuadrilateral:v18];
        [v10 addObject:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v13);
  }

  [(AKHighlightAnnotation *)self setQuadPoints:v10];
}

- (void)translateBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (a3.x != *MEMORY[0x263F00148] || a3.y != *(double *)(MEMORY[0x263F00148] + 8))
  {
    BOOL v7 = [(AKAnnotation *)self isTranslating];
    [(AKAnnotation *)self setIsTranslating:1];
    v8 = (void *)MEMORY[0x263EFF980];
    v9 = [(AKHighlightAnnotation *)self quadPoints];
    objc_super v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v11 = [(AKHighlightAnnotation *)self quadPoints];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          if (v16)
          {
            [v16 quadrilateralValue];
            double v17 = *((double *)&v28 + 1);
            double v18 = *(double *)&v28;
            double v19 = *((double *)&v29 + 1);
            double v20 = *(double *)&v29;
            double v21 = *((double *)&v27 + 1);
            double v22 = *(double *)&v27;
            double v23 = *((double *)&v30 + 1);
            double v24 = *(double *)&v30;
          }
          else
          {
            double v23 = 0.0;
            double v24 = 0.0;
            double v21 = 0.0;
            double v22 = 0.0;
            double v19 = 0.0;
            double v20 = 0.0;
            double v17 = 0.0;
            double v18 = 0.0;
          }
          *(double *)&long long v28 = x + v18;
          *((double *)&v28 + 1) = y + v17;
          *(double *)&long long v29 = x + v20;
          *((double *)&v29 + 1) = y + v19;
          *(double *)&long long v27 = x + v22;
          *((double *)&v27 + 1) = y + v21;
          *(double *)&long long v30 = x + v24;
          *((double *)&v30 + 1) = y + v23;
          v26[0] = v27;
          v26[1] = v28;
          v26[2] = v29;
          v26[3] = v30;
          long long v25 = [MEMORY[0x263F08D40] valueWithQuadrilateral:v26];
          [v10 addObject:v25];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v13);
    }

    [(AKHighlightAnnotation *)self setQuadPoints:v10];
    [(AKAnnotation *)self setIsTranslating:v7];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AKHighlightAnnotation;
  [(AKAnnotation *)&v27 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[AKHighlightAnnotation style](self, "style"), @"style");
  v5 = [(AKHighlightAnnotation *)self color];
  [v4 akEncodeColor:v5 forKey:@"color"];

  objc_super v6 = [(AKHighlightAnnotation *)self quadPoints];

  if (v6)
  {
    BOOL v7 = (void *)MEMORY[0x263EFF980];
    v8 = [(AKHighlightAnnotation *)self quadPoints];
    v9 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    objc_super v10 = [(AKHighlightAnnotation *)self quadPoints];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          if (v15) {
            [v15 quadrilateralValue];
          }
          v18[0] = v19;
          v18[1] = v20;
          v18[2] = v21;
          v18[3] = v22;
          v16 = AKQuadrilateralCreateDictionaryRepresentation((double *)v18);
          [v9 addObject:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v12);
    }

    double v17 = [MEMORY[0x263EFF8C0] arrayWithArray:v9];
    [v4 encodeObject:v17 forKey:@"quadPoints"];
  }
}

- (AKHighlightAnnotation)initWithCoder:(id)a3
{
  v31[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)AKHighlightAnnotation;
  v5 = [(AKAnnotation *)&v29 initWithCoder:v4];
  if (v5)
  {
    -[AKHighlightAnnotation setStyle:](v5, "setStyle:", [v4 decodeIntegerForKey:@"style"]);
    objc_super v6 = [v4 akDecodeColorForKey:@"color"];
    [(AKHighlightAnnotation *)v5 setColor:v6];

    if ([v4 containsValueForKey:@"quadPoints"])
    {
      BOOL v7 = (void *)MEMORY[0x263EFFA08];
      v31[0] = objc_opt_class();
      v31[1] = objc_opt_class();
      v31[2] = objc_opt_class();
      v31[3] = objc_opt_class();
      v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];
      v9 = [v7 setWithArray:v8];
      objc_super v10 = [v4 decodeObjectOfClasses:v9 forKey:@"quadPoints"];

      uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v26;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v26 != v15) {
              objc_enumerationMutation(v12);
            }
            double v17 = *(void **)(*((void *)&v25 + 1) + 8 * v16);
            long long v23 = 0u;
            long long v24 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            AKQuadrilateralMakeWithDictionaryRepresentation(v17, (uint64_t)&v21);
            v20[0] = v21;
            v20[1] = v22;
            v20[2] = v23;
            v20[3] = v24;
            double v18 = [MEMORY[0x263F08D40] valueWithQuadrilateral:v20];
            [v11 addObject:v18];

            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v14);
      }

      [(AKHighlightAnnotation *)v5 setQuadPoints:v11];
    }
  }

  return v5;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (UIColor)color
{
  return (UIColor *)objc_getProperty(self, a2, 192, 1);
}

- (void)setColor:(id)a3
{
}

- (NSArray)quadPoints
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setQuadPoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quadPoints, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

@end