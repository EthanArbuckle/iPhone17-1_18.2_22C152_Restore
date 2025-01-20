@interface CSFTensorProperties
+ (id)propertyWithShape:(id)a3 dataType:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)shape;
- (id)description;
- (unint64_t)dataType;
- (void)setDataType:(unint64_t)a3;
- (void)setShape:(id)a3;
@end

@implementation CSFTensorProperties

- (void).cxx_destruct
{
}

- (void)setDataType:(unint64_t)a3
{
  self->_dataType = a3;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (void)setShape:(id)a3
{
}

- (NSArray)shape
{
  return self->_shape;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"shape: %@ dataType: %lu", self->_shape, self->_dataType];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [v4 shape];
  v6 = [(CSFTensorProperties *)self shape];
  char v7 = [v5 isEqualToArray:v6];

  uint64_t v8 = [v4 dataType];
  if (v8 == [(CSFTensorProperties *)self dataType]) {
    BOOL v9 = v7;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)propertyWithShape:(id)a3 dataType:(unint64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(CSFTensorProperties);
  [(CSFTensorProperties *)v6 setShape:v5];
  [(CSFTensorProperties *)v6 setDataType:a4];

  return v6;
}

@end