@interface MPSGraphShapedType
- (BOOL)isEqualTo:(MPSGraphShapedType *)object;
- (MPSDataType)dataType;
- (MPSGraphShapedType)initWithShape:(MPSShape *)shape dataType:(MPSDataType)dataType;
- (MPSShape)shape;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)setDataType:(MPSDataType)dataType;
- (void)setShape:(MPSShape *)shape;
@end

@implementation MPSGraphShapedType

- (MPSGraphShapedType)initWithShape:(MPSShape *)shape dataType:(MPSDataType)dataType
{
  v6 = shape;
  v11.receiver = self;
  v11.super_class = (Class)MPSGraphShapedType;
  v7 = [(MPSGraphShapedType *)&v11 init];
  uint64_t v8 = [(MPSShape *)v6 copyWithZone:0];
  v9 = v7->_shape;
  v7->_shape = (NSArray *)v8;

  v7->_dataType = dataType;
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MPSGraphShapedType alloc];
  shape = self->_shape;
  uint64_t dataType = self->_dataType;

  return [(MPSGraphShapedType *)v4 initWithShape:shape dataType:dataType];
}

- (BOOL)isEqualTo:(MPSGraphShapedType *)object
{
  v4 = object;
  unsigned int dataType = self->_dataType;
  if (dataType != [(MPSGraphShapedType *)v4 dataType]) {
    goto LABEL_13;
  }
  if (self->_shape) {
    goto LABEL_3;
  }
  v17 = [(MPSGraphShapedType *)v4 shape];

  if (!v17)
  {
    LOBYTE(v6) = 1;
    goto LABEL_14;
  }
  if (self->_shape) {
    goto LABEL_3;
  }
  v18 = [(MPSGraphShapedType *)v4 shape];

  if (v18) {
    goto LABEL_13;
  }
  if (self->_shape)
  {
LABEL_3:
    v6 = [(MPSGraphShapedType *)v4 shape];

    if (!v6) {
      goto LABEL_14;
    }
    shape = self->_shape;
  }
  else
  {
    shape = 0;
  }
  uint64_t v8 = [(NSArray *)shape count];
  v9 = [(MPSGraphShapedType *)v4 shape];
  uint64_t v10 = [v9 count];

  if (v8 != v10)
  {
LABEL_13:
    LOBYTE(v6) = 0;
    goto LABEL_14;
  }
  NSUInteger v11 = 0;
  do
  {
    NSUInteger v12 = [(NSArray *)self->_shape count];
    LOBYTE(v6) = v11 >= v12;
    if (v11 >= v12) {
      break;
    }
    v13 = [(NSArray *)self->_shape objectAtIndexedSubscript:v11];
    v14 = [(MPSGraphShapedType *)v4 shape];
    v15 = [v14 objectAtIndexedSubscript:v11];
    char v16 = [v13 isEqualToNumber:v15];

    ++v11;
  }
  while ((v16 & 1) != 0);
LABEL_14:

  return (char)v6;
}

- (id)debugDescription
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MPSGraphShapedType;
  v4 = [(MPSGraphShapedType *)&v8 debugDescription];
  v5 = [(NSArray *)self->_shape debugDescription];
  v6 = [v3 stringWithFormat:@"%@ : %@", v4, v5];

  return v6;
}

- (MPSShape)shape
{
  return (MPSShape *)objc_getProperty(self, a2, 16, 1);
}

- (void)setShape:(MPSShape *)shape
{
}

- (MPSDataType)dataType
{
  return self->_dataType;
}

- (void)setDataType:(MPSDataType)dataType
{
  self->_unsigned int dataType = dataType;
}

- (void).cxx_destruct
{
}

@end