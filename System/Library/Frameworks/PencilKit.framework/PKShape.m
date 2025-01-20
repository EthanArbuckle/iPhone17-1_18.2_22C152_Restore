@interface PKShape
+ (BOOL)isFillableForShapeType:(int64_t)a3;
+ (id)snapToShapeActionNameForNumShapes:(unint64_t)a3;
- (BOOL)fillable;
- (NSArray)strokes;
- (PKShape)initWithShapeType:(int64_t)a3 strokes:(id)a4 originalStroke:(id)a5;
- (PKStroke)originalStroke;
- (int64_t)type;
@end

@implementation PKShape

- (PKShape)initWithShapeType:(int64_t)a3 strokes:(id)a4 originalStroke:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKShape;
  v11 = [(PKShape *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_strokes, a4);
    objc_storeStrong((id *)&v12->_originalStroke, a5);
  }

  return v12;
}

- (BOOL)fillable
{
  return +[PKShape isFillableForShapeType:self->_type];
}

+ (id)snapToShapeActionNameForNumShapes:(unint64_t)a3
{
  v4 = _PencilKitBundle();
  v5 = v4;
  if (a3 > 1) {
    v6 = @"Snap to Shapes";
  }
  else {
    v6 = @"Snap to Shape";
  }
  v7 = [v4 localizedStringForKey:v6 value:v6 table:@"Localizable"];

  return v7;
}

+ (BOOL)isFillableForShapeType:(int64_t)a3
{
  return ((unint64_t)a3 < 0xD) & (0x1F1Eu >> a3);
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)strokes
{
  return self->_strokes;
}

- (PKStroke)originalStroke
{
  return self->_originalStroke;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalStroke, 0);

  objc_storeStrong((id *)&self->_strokes, 0);
}

@end