@interface MPSGraphListType
- (MPSGraphListType)initWithElementType:(id)a3;
- (MPSGraphType)elementType;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setElementType:(id)a3;
@end

@implementation MPSGraphListType

- (MPSGraphListType)initWithElementType:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPSGraphListType;
  v5 = [(MPSGraphListType *)&v9 init];
  uint64_t v6 = [v4 copyWithZone:0];
  elementType = v5->_elementType;
  v5->_elementType = (MPSGraphType *)v6;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MPSGraphListType alloc];
  elementType = self->_elementType;

  return [(MPSGraphListType *)v4 initWithElementType:elementType];
}

- (MPSGraphType)elementType
{
  return (MPSGraphType *)objc_getProperty(self, a2, 8, 1);
}

- (void)setElementType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end