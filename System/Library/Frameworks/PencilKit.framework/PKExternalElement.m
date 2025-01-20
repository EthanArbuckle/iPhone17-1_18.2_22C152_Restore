@interface PKExternalElement
- (BOOL)isEqual:(id)a3;
- (CGPath)path;
- (CGRect)boundingBox;
- (PKExternalElement)initWithIdentifier:(id)a3 path:(CGPath *)a4;
- (id)identifier;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation PKExternalElement

- (PKExternalElement)initWithIdentifier:(id)a3 path:(CGPath *)a4
{
  id v7 = a3;
  v8 = [(PKExternalElement *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_identifier, a3);
    v9->_path = (CGPath *)MEMORY[0x1C8783320](a4);
    v9->_boundingBox = CGPathGetBoundingBox(a4);
  }

  return v9;
}

- (void)dealloc
{
  CGPathRelease(self->_path);
  v3.receiver = self;
  v3.super_class = (Class)PKExternalElement;
  [(PKExternalElement *)&v3 dealloc];
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)hash
{
  v2 = [(PKExternalElement *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKExternalElement *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(PKExternalElement *)self identifier];
      v6 = [(PKExternalElement *)v4 identifier];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)identifier
{
  return self->_identifier;
}

- (CGPath)path
{
  return self->_path;
}

- (void).cxx_destruct
{
}

@end