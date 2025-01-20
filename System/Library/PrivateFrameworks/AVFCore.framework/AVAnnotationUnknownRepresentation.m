@interface AVAnnotationUnknownRepresentation
- (BOOL)isEqual:(id)a3;
- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4;
- (id)_propertyListAndBinaryData:(id *)a3;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation AVAnnotationUnknownRepresentation

- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVAnnotationUnknownRepresentation;
  v6 = -[AVAnnotationRepresentation _initWithPropertyList:binaryData:](&v8, sel__initWithPropertyList_binaryData_);
  if (v6)
  {
    v6[4] = [a3 copy];
    v6[5] = [a4 copy];
    [v6 _setRepresentationType:@"AVAnnotationRepresentationTypeUnknown"];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAnnotationUnknownRepresentation;
  [(AVAnnotationRepresentation *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVAnnotationUnknownRepresentation;
  BOOL v5 = -[AVAnnotationRepresentation isEqual:](&v9, sel_isEqual_);
  if (a3 != self)
  {
    if (!a3) {
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    uint64_t v8 = 0;
    uint64_t v6 = [a3 _propertyListAndBinaryData:&v8];
    if (v5)
    {
      if ([(NSDictionary *)self->_properties isEqualToDictionary:v6])
      {
        LOBYTE(v5) = [(NSData *)self->_binaryData isEqualToData:v8];
        return v5;
      }
LABEL_7:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)AVAnnotationUnknownRepresentation;
  unint64_t v3 = [(AVAnnotationRepresentation *)&v6 hash];
  uint64_t v4 = [(NSDictionary *)self->_properties hash] ^ v3;
  return v4 ^ [(NSData *)self->_binaryData hash];
}

- (id)_propertyListAndBinaryData:(id *)a3
{
  if (a3) {
    *a3 = self->_binaryData;
  }
  unint64_t v3 = (void *)[(NSDictionary *)self->_properties mutableCopy];
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p>", NSStringFromClass(v4), self];
}

@end