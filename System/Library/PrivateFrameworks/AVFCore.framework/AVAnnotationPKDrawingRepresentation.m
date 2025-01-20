@interface AVAnnotationPKDrawingRepresentation
- (AVAnnotationPKDrawingRepresentation)initWithDrawingData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)drawingData;
- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4;
- (id)_propertyListAndBinaryData:(id *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)setDrawingData:(id)a3;
@end

@implementation AVAnnotationPKDrawingRepresentation

- (AVAnnotationPKDrawingRepresentation)initWithDrawingData:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVAnnotationPKDrawingRepresentation;
  v4 = [(AVAnnotationRepresentation *)&v6 _initWithRepresentationType:@"AVAnnotationRepresentationTypePKDrawing"];
  if (v4) {
    v4->_drawingData = (NSData *)[a3 copy];
  }
  return v4;
}

- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVAnnotationPKDrawingRepresentation;
  v5 = -[AVAnnotationRepresentation _initWithPropertyList:binaryData:](&v8, sel__initWithPropertyList_binaryData_, a3);
  objc_super v6 = v5;
  if (a4 && v5)
  {
    v5[4] = [a4 copy];
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAnnotationPKDrawingRepresentation;
  [(AVAnnotationRepresentation *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVAnnotationPKDrawingRepresentation;
  BOOL v5 = -[AVAnnotationRepresentation isEqual:](&v7, sel_isEqual_);
  if (a3 != self) {
    LOBYTE(v5) = a3
  }
              && (objc_opt_class(), (objc_opt_isKindOfClass() & v5) == 1)
              && -[NSData isEqualToData:](-[AVAnnotationPKDrawingRepresentation drawingData](self, "drawingData"), "isEqualToData:", [a3 drawingData]);
  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)AVAnnotationPKDrawingRepresentation;
  unint64_t v3 = [(AVAnnotationRepresentation *)&v5 hash];
  return [(NSData *)[(AVAnnotationPKDrawingRepresentation *)self drawingData] hash] ^ v3;
}

- (id)_propertyListAndBinaryData:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVAnnotationPKDrawingRepresentation;
  id v5 = -[AVAnnotationRepresentation _propertyListAndBinaryData:](&v7, sel__propertyListAndBinaryData_);
  if (a3) {
    *a3 = [(AVAnnotationPKDrawingRepresentation *)self drawingData];
  }
  return v5;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p>", NSStringFromClass(v4), self];
}

- (NSData)drawingData
{
  return self->_drawingData;
}

- (void)setDrawingData:(id)a3
{
}

@end