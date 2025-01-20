@interface AVAnnotationShapeRepresentation
- (AVAnnotationShapeRepresentation)initWithShape:(id)a3;
- (BOOL)dashed;
- (BOOL)hasShadow;
- (BOOL)isEqual:(id)a3;
- (CGColor)strokeColor;
- (NSString)shape;
- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4;
- (id)_propertyListAndBinaryData:(id *)a3;
- (id)description;
- (int64_t)strokeWidth;
- (unint64_t)hash;
- (void)dealloc;
- (void)setDashed:(BOOL)a3;
- (void)setHasShadow:(BOOL)a3;
- (void)setShape:(id)a3;
- (void)setStrokeColor:(CGColor *)a3;
- (void)setStrokeWidth:(int64_t)a3;
@end

@implementation AVAnnotationShapeRepresentation

- (AVAnnotationShapeRepresentation)initWithShape:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVAnnotationShapeRepresentation;
  v4 = [(AVAnnotationRepresentation *)&v6 _initWithRepresentationType:@"AVAnnotationRepresentationTypeShape"];
  if (v4)
  {
    v4->_shape = (NSString *)[a3 copy];
    v4->_strokeColor = (CGColor *)FigCreateCGColorSRGBFromArray();
    v4->_strokeWidth = 1;
    v4->_dashed = 0;
    v4->_hasShadow = 0;
  }
  return v4;
}

- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)AVAnnotationShapeRepresentation;
  v5 = [(AVAnnotationRepresentation *)&v20 _initWithPropertyList:a3 binaryData:a4];
  if (!v5) {
    goto LABEL_17;
  }
  objc_super v6 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyShape"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_17;
  }
  v5[4] = [v6 copy];
  v7 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyStrokeColor"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v7 count] != 4) {
    goto LABEL_17;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_7:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_17;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v9) {
          goto LABEL_7;
        }
        break;
      }
    }
  }
  v5[5] = FigCreateCGColorSRGBFromArray();
  v12 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyStrokeWidth"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v5[6] = [v12 integerValue],
        v13 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyDashed"],
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) == 0)
    || (*((unsigned char *)v5 + 56) = [v13 BOOLValue],
        v14 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyHasShadow"],
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_17:

    return 0;
  }
  *((unsigned char *)v5 + 57) = [v14 BOOLValue];
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAnnotationShapeRepresentation;
  [(AVAnnotationRepresentation *)&v3 dealloc];
}

- (CGColor)strokeColor
{
  v2 = self->_strokeColor;
  return v2;
}

- (void)setStrokeColor:(CGColor *)a3
{
  v4 = CGColorRetain(a3);
  CGColorRelease(self->_strokeColor);
  self->_strokeColor = v4;
}

- (BOOL)isEqual:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AVAnnotationShapeRepresentation;
  BOOL v5 = -[AVAnnotationRepresentation isEqual:](&v10, sel_isEqual_);
  if (a3 != self)
  {
    if (a3
      && (objc_opt_class(), (objc_opt_isKindOfClass() & v5) == 1)
      && -[NSString isEqualToString:](-[AVAnnotationShapeRepresentation shape](self, "shape"), "isEqualToString:", [a3 shape])&& CGColorEqualToColor(-[AVAnnotationShapeRepresentation strokeColor](self, "strokeColor"), (CGColorRef)objc_msgSend(a3, "strokeColor"))&& (int64_t v6 = -[AVAnnotationShapeRepresentation strokeWidth](self, "strokeWidth"), v6 == objc_msgSend(a3, "strokeWidth"))&& (v7 = -[AVAnnotationShapeRepresentation dashed](self, "dashed"), v7 == objc_msgSend(a3, "dashed")))
    {
      BOOL v9 = [(AVAnnotationShapeRepresentation *)self hasShadow];
      return v9 ^ [a3 hasShadow] ^ 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)AVAnnotationShapeRepresentation;
  unint64_t v3 = [(AVAnnotationRepresentation *)&v9 hash];
  NSUInteger v4 = [(NSString *)[(AVAnnotationShapeRepresentation *)self shape] hash];
  [(AVAnnotationShapeRepresentation *)self strokeColor];
  uint64_t v5 = v4 ^ [(id)FigCopyCGColorSRGBAsArray() hash] ^ v3;
  uint64_t v6 = v5 ^ objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AVAnnotationShapeRepresentation strokeWidth](self, "strokeWidth")), "hash");
  uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AVAnnotationShapeRepresentation dashed](self, "dashed")), "hash");
  return v6 ^ v7 ^ objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AVAnnotationShapeRepresentation hasShadow](self, "hasShadow")), "hash");
}

- (id)_propertyListAndBinaryData:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVAnnotationShapeRepresentation;
  id v5 = -[AVAnnotationRepresentation _propertyListAndBinaryData:](&v7, sel__propertyListAndBinaryData_);
  objc_msgSend(v5, "setObject:forKey:", -[AVAnnotationShapeRepresentation shape](self, "shape"), @"AVAnnotationRepresentationArchiveKeyShape");
  [(AVAnnotationShapeRepresentation *)self strokeColor];
  [v5 setObject:(id)FigCopyCGColorSRGBAsArray() forKey:@"AVAnnotationRepresentationArchiveKeyStrokeColor"];
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AVAnnotationShapeRepresentation strokeWidth](self, "strokeWidth")), @"AVAnnotationRepresentationArchiveKeyStrokeWidth");
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AVAnnotationShapeRepresentation dashed](self, "dashed")), @"AVAnnotationRepresentationArchiveKeyDashed");
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AVAnnotationShapeRepresentation hasShadow](self, "hasShadow")), @"AVAnnotationRepresentationArchiveKeyHasShadow");
  if (a3) {
    *a3 = (id)[MEMORY[0x1E4F1C9B8] data];
  }
  return v5;
}

- (id)description
{
  unint64_t v3 = NSString;
  NSUInteger v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, %@>", NSStringFromClass(v4), self, -[AVAnnotationShapeRepresentation shape](self, "shape")];
}

- (NSString)shape
{
  return self->_shape;
}

- (void)setShape:(id)a3
{
}

- (int64_t)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(int64_t)a3
{
  self->_strokeWidth = a3;
}

- (BOOL)dashed
{
  return self->_dashed;
}

- (void)setDashed:(BOOL)a3
{
  self->_dashed = a3;
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
}

@end