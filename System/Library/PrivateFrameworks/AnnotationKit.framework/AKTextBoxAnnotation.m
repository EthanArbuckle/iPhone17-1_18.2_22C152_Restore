@interface AKTextBoxAnnotation
+ (BOOL)deleteAfterEditingIfEmpty;
+ (id)defaultPlaceholderText;
- (AKTextBoxAnnotation)init;
- (CGRect)hitTestBounds;
- (id)displayName;
- (id)highlightColor;
- (id)keysForValuesToObserveForRedrawing;
- (void)setHighlightColor:(id)a3;
@end

@implementation AKTextBoxAnnotation

+ (BOOL)deleteAfterEditingIfEmpty
{
  return 0;
}

- (AKTextBoxAnnotation)init
{
  v7.receiver = self;
  v7.super_class = (Class)AKTextBoxAnnotation;
  v2 = [(AKRectangularShapeAnnotation *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(AKAnnotation *)v2 setTextIsFixedWidth:0];
    [(AKAnnotation *)v3 setTextIsFixedHeight:0];
    v4 = [MEMORY[0x263F1C550] systemBlueColor];
    v5 = [v4 colorWithAlphaComponent:0.12];
    [(AKTextBoxAnnotation *)v3 setHighlightColor:v5];
  }
  return v3;
}

- (id)highlightColor
{
  if ([(AKAnnotation *)self isFormField]
    && [(AKRectangularShapeAnnotation *)self isHighlighted]
    && ![(AKAnnotation *)self isEditingText])
  {
    highlightColor = self->_highlightColor;
  }
  else
  {
    highlightColor = 0;
  }

  return highlightColor;
}

+ (id)defaultPlaceholderText
{
  v2 = +[AKController akBundle];
  v3 = [v2 localizedStringForKey:@"DEFAULT_TEXT_CONTENTS" value:@"Text" table:@"AnnotationStrings"];

  return v3;
}

- (id)displayName
{
  v2 = +[AKController akBundle];
  v3 = [v2 localizedStringForKey:@"Text Box" value:&stru_26EA57918 table:@"AnnotationStrings"];

  return v3;
}

- (id)keysForValuesToObserveForRedrawing
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v6.receiver = self;
  v6.super_class = (Class)AKTextBoxAnnotation;
  v3 = [(AKRectangularShapeAnnotation *)&v6 keysForValuesToObserveForRedrawing];
  v4 = [v2 setWithSet:v3];

  [v4 addObjectsFromArray:&unk_26EA76250];

  return v4;
}

- (CGRect)hitTestBounds
{
  [(AKRectangularShapeAnnotation *)self rectangle];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  +[AKAnnotationRenderer draggingBoundsInsetsForAnnotation:self];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  v31.origin.CGFloat x = v4;
  v31.origin.CGFloat y = v6;
  v31.size.CGFloat width = v8;
  v31.size.CGFloat height = v10;
  CGRect v32 = CGRectInset(v31, v12, v14);
  CGFloat x = v32.origin.x;
  CGFloat y = v32.origin.y;
  CGFloat width = v32.size.width;
  CGFloat height = v32.size.height;
  [(AKStrokedAnnotation *)self strokeWidth];
  CGFloat v20 = v19 * -0.5;
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  CGRect v34 = CGRectInset(v33, v20, 0.0);
  double v21 = v34.origin.x;
  double v22 = v34.origin.y;
  double v23 = v34.size.width;
  double v24 = v34.size.height;
  [(AKRectangularShapeAnnotation *)self rotationAngle];

  +[AKGeometryHelper boundsOfRotatedRectangle:angle:](AKGeometryHelper, "boundsOfRotatedRectangle:angle:", v21, v22, v23, v24, v25);
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (void)setHighlightColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end