@interface _MKMarkerAnnotationBaseImageContent
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (_MKMarkerAnnotationBaseImageContent)initWithFillColor:(id)a3 strokeColor:(id)a4 strokeWidth:(double)a5 blendMode:(int)a6 baseImageType:(int64_t)a7;
- (double)strokeWidth;
- (int)blendMode;
- (int64_t)baseImageType;
@end

@implementation _MKMarkerAnnotationBaseImageContent

- (_MKMarkerAnnotationBaseImageContent)initWithFillColor:(id)a3 strokeColor:(id)a4 strokeWidth:(double)a5 blendMode:(int)a6 baseImageType:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_MKMarkerAnnotationBaseImageContent;
  v15 = [(_MKMarkerAnnotationBaseImageContent *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fillColor, a3);
    objc_storeStrong((id *)&v16->_strokeColor, a4);
    v16->_strokeWidth = a5;
    v16->_blendMode = a6;
    v16->_baseImageType = a7;
  }

  return v16;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (int64_t)baseImageType
{
  return self->_baseImageType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);

  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end