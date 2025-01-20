@interface AVAnnotationSVGRepresentation
- (AVAnnotationSVGRepresentation)initWithSVG:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)svg;
- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4;
- (id)_propertyListAndBinaryData:(id *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)setSvg:(id)a3;
@end

@implementation AVAnnotationSVGRepresentation

- (AVAnnotationSVGRepresentation)initWithSVG:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVAnnotationSVGRepresentation;
  v4 = [(AVAnnotationRepresentation *)&v6 _initWithRepresentationType:@"AVAnnotationRepresentationTypeSVG"];
  if (v4) {
    v4->_svg = (NSString *)[a3 copy];
  }
  return v4;
}

- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVAnnotationSVGRepresentation;
  v5 = [(AVAnnotationRepresentation *)&v8 _initWithPropertyList:a3 binaryData:a4];
  if (v5
    && (objc_super v6 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeySVG"],
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5[4] = [v6 copy];
  }
  else
  {

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAnnotationSVGRepresentation;
  [(AVAnnotationRepresentation *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVAnnotationSVGRepresentation;
  BOOL v5 = -[AVAnnotationRepresentation isEqual:](&v7, sel_isEqual_);
  if (a3 != self) {
    LOBYTE(v5) = a3
  }
              && (objc_opt_class(), (objc_opt_isKindOfClass() & v5) == 1)
              && -[NSString isEqualToString:](-[AVAnnotationSVGRepresentation svg](self, "svg"), "isEqualToString:", [a3 svg]);
  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)AVAnnotationSVGRepresentation;
  unint64_t v3 = [(AVAnnotationRepresentation *)&v5 hash];
  return [(NSString *)[(AVAnnotationSVGRepresentation *)self svg] hash] ^ v3;
}

- (id)_propertyListAndBinaryData:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVAnnotationSVGRepresentation;
  id v5 = -[AVAnnotationRepresentation _propertyListAndBinaryData:](&v7, sel__propertyListAndBinaryData_);
  objc_msgSend(v5, "setObject:forKey:", -[AVAnnotationSVGRepresentation svg](self, "svg"), @"AVAnnotationRepresentationArchiveKeySVG");
  if (a3) {
    *a3 = (id)[MEMORY[0x1E4F1C9B8] data];
  }
  return v5;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p>", NSStringFromClass(v4), self];
}

- (NSString)svg
{
  return self->_svg;
}

- (void)setSvg:(id)a3
{
}

@end