@interface AKStrokedAnnotation
+ (BOOL)supportsSecureCoding;
+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3;
+ (id)keyPathsForValuesAffectingDrawingBounds;
+ (id)keyPathsForValuesAffectingHitTestBounds;
- (AKStrokedAnnotation)initWithCoder:(id)a3;
- (BOOL)hasShadow;
- (BOOL)isDashed;
- (UIColor)strokeColor;
- (double)strokeWidth;
- (id)displayName;
- (id)keysForValuesToObserveForRedrawing;
- (id)keysForValuesToObserveForUndo;
- (int64_t)brushStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setBrushStyle:(int64_t)a3;
- (void)setDashed:(BOOL)a3;
- (void)setHasShadow:(BOOL)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeWidth:(double)a3;
@end

@implementation AKStrokedAnnotation

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKStrokedAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingHitTestBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75D40];

  return v4;
}

+ (id)keyPathsForValuesAffectingDrawingBounds
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AKStrokedAnnotation;
  v3 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingDrawingBounds);
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75D58];

  return v4;
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"strokeWidth"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Border Line Width";
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"strokeColor"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Border Color";
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"dashed"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Border Dashed";
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"hasShadow"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Shadow";
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"brushStyle"])
  {
    v5 = +[AKController akBundle];
    objc_super v6 = v5;
    v7 = @"Brush Style";
LABEL_11:
    v8 = [v5 localizedStringForKey:v7 value:&stru_26EA57918 table:@"AnnotationStrings"];

    if (v8) {
      goto LABEL_13;
    }
  }
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___AKStrokedAnnotation;
  v8 = objc_msgSendSuper2(&v10, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
LABEL_13:

  return v8;
}

- (id)displayName
{
  v4.receiver = self;
  v4.super_class = (Class)AKStrokedAnnotation;
  v2 = [(AKAnnotation *)&v4 displayName];

  return v2;
}

- (id)keysForValuesToObserveForUndo
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKStrokedAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForUndo];
  objc_super v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75D70];

  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKStrokedAnnotation;
  v3 = [(AKAnnotation *)&v6 keysForValuesToObserveForRedrawing];
  objc_super v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA75D88];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKStrokedAnnotation;
  id v4 = a3;
  [(AKAnnotation *)&v6 encodeWithCoder:v4];
  v5 = [(AKStrokedAnnotation *)self strokeColor];
  [v4 akEncodeColor:v5 forKey:@"strokeColorString"];

  [(AKStrokedAnnotation *)self strokeWidth];
  objc_msgSend(v4, "encodeDouble:forKey:", @"strokeWidth");
  objc_msgSend(v4, "encodeBool:forKey:", -[AKStrokedAnnotation isDashed](self, "isDashed"), @"dashed");
  objc_msgSend(v4, "encodeBool:forKey:", -[AKStrokedAnnotation hasShadow](self, "hasShadow"), @"hasShadow");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AKStrokedAnnotation brushStyle](self, "brushStyle"), @"brushStyle");
}

- (AKStrokedAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKStrokedAnnotation;
  v5 = [(AKAnnotation *)&v9 initWithCoder:v4];
  if (v5)
  {
    if ([v4 containsValueForKey:@"strokeColorString"])
    {
      objc_super v6 = [v4 akDecodeColorForKey:@"strokeColorString"];
      [(AKStrokedAnnotation *)v5 setStrokeColor:v6];
    }
    else
    {
      if (![v4 containsValueForKey:@"strokeColor"])
      {
LABEL_8:
        [v4 decodeDoubleForKey:@"strokeWidth"];
        -[AKStrokedAnnotation setStrokeWidth:](v5, "setStrokeWidth:");
        -[AKStrokedAnnotation setDashed:](v5, "setDashed:", [v4 decodeBoolForKey:@"dashed"]);
        -[AKStrokedAnnotation setHasShadow:](v5, "setHasShadow:", [v4 decodeBoolForKey:@"hasShadow"]);
        -[AKStrokedAnnotation setBrushStyle:](v5, "setBrushStyle:", [v4 decodeIntegerForKey:@"brushStyle"]);
        goto LABEL_9;
      }
      objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"strokeColor"];
      if (v6)
      {
        v7 = [MEMORY[0x263F1C550] akColorWithCIColor:v6];
        [(AKStrokedAnnotation *)v5 setStrokeColor:v7];
      }
    }

    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (UIColor)strokeColor
{
  return (UIColor *)objc_getProperty(self, a2, 200, 1);
}

- (void)setStrokeColor:(id)a3
{
}

- (BOOL)isDashed
{
  return self->_dashed;
}

- (void)setDashed:(BOOL)a3
{
  self->_dashed = a3;
}

- (int64_t)brushStyle
{
  return self->_brushStyle;
}

- (void)setBrushStyle:(int64_t)a3
{
  self->_brushStyle = a3;
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
}

- (void).cxx_destruct
{
}

@end