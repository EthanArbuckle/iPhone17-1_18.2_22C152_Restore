@interface AVAnnotationImageRepresentation
- (AVAnnotationImageRepresentation)initWithImageData:(id)a3 fileType:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSData)imageData;
- (NSString)fileType;
- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4;
- (id)_propertyListAndBinaryData:(id *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)setFileType:(id)a3;
- (void)setImageData:(id)a3;
@end

@implementation AVAnnotationImageRepresentation

- (AVAnnotationImageRepresentation)initWithImageData:(id)a3 fileType:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVAnnotationImageRepresentation;
  v6 = [(AVAnnotationRepresentation *)&v8 _initWithRepresentationType:@"AVAnnotationRepresentationTypeImage"];
  if (v6)
  {
    v6->_imageData = (NSData *)[a3 copy];
    v6->_fileType = (NSString *)[a4 copy];
  }
  return v6;
}

- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AVAnnotationImageRepresentation;
  v6 = -[AVAnnotationRepresentation _initWithPropertyList:binaryData:](&v10, sel__initWithPropertyList_binaryData_);
  v7 = v6;
  if (a4
    && v6
    && (v6[4] = [a4 copy],
        objc_super v8 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyFileType"],
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7[5] = [v8 copy];
  }
  else
  {

    return 0;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAnnotationImageRepresentation;
  [(AVAnnotationRepresentation *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVAnnotationImageRepresentation;
  BOOL v5 = -[AVAnnotationRepresentation isEqual:](&v7, sel_isEqual_);
  if (a3 != self) {
    LOBYTE(v5) = a3
  }
              && (objc_opt_class(), (objc_opt_isKindOfClass() & v5) == 1)
              && -[NSData isEqualToData:](-[AVAnnotationImageRepresentation imageData](self, "imageData"), "isEqualToData:", [a3 imageData])&& -[NSString isEqualToString:](-[AVAnnotationImageRepresentation fileType](self, "fileType"), "isEqualToString:", objc_msgSend(a3, "fileType"));
  return v5;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)AVAnnotationImageRepresentation;
  unint64_t v3 = [(AVAnnotationRepresentation *)&v6 hash];
  uint64_t v4 = [(NSData *)[(AVAnnotationImageRepresentation *)self imageData] hash];
  return v4 ^ [(NSString *)[(AVAnnotationImageRepresentation *)self fileType] hash] ^ v3;
}

- (id)_propertyListAndBinaryData:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVAnnotationImageRepresentation;
  id v5 = -[AVAnnotationRepresentation _propertyListAndBinaryData:](&v7, sel__propertyListAndBinaryData_);
  objc_msgSend(v5, "setObject:forKey:", -[AVAnnotationImageRepresentation fileType](self, "fileType"), @"AVAnnotationRepresentationArchiveKeyFileType");
  if (a3) {
    *a3 = [(AVAnnotationImageRepresentation *)self imageData];
  }
  return v5;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p>", NSStringFromClass(v4), self];
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (NSString)fileType
{
  return self->_fileType;
}

- (void)setFileType:(id)a3
{
}

@end