@interface HFMultiSizeImageIconDescriptor
- (BOOL)isEqual:(id)a3;
- (HFMultiSizeImageIconDescriptor)initWithImageIdentifiersKeyedBySize:(id)a3;
- (HFMultiSizeImageIconDescriptor)initWithImageIdentifiersKeyedBySize:(id)a3 defaultImageIdentifier:(id)a4;
- (NSDictionary)imageIdentifiersKeyedBySize;
- (id)imageIdentifierForSize:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)setImageIdentifiersKeyedBySize:(id)a3;
@end

@implementation HFMultiSizeImageIconDescriptor

- (HFMultiSizeImageIconDescriptor)initWithImageIdentifiersKeyedBySize:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"HFImageIconIdentifierSizeRegular"];
  v6 = [(HFMultiSizeImageIconDescriptor *)self initWithImageIdentifiersKeyedBySize:v4 defaultImageIdentifier:v5];

  return v6;
}

- (HFMultiSizeImageIconDescriptor)initWithImageIdentifiersKeyedBySize:(id)a3 defaultImageIdentifier:(id)a4
{
  id v7 = a3;
  v8 = (__CFString *)a4;
  v9 = v8;
  if (!v8)
  {
    NSLog(&cfstr_NoDefaultImage.isa);
    v9 = @"HFImageIconIdentifierSizeRegular";
  }
  v13.receiver = self;
  v13.super_class = (Class)HFMultiSizeImageIconDescriptor;
  v10 = [(HFImageIconDescriptor *)&v13 initWithImageIdentifier:v9];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_imageIdentifiersKeyedBySize, a3);
  }

  return v11;
}

- (id)imageIdentifierForSize:(id)a3
{
  id v4 = a3;
  v5 = [(HFMultiSizeImageIconDescriptor *)self imageIdentifiersKeyedBySize];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    id v7 = [(HFMultiSizeImageIconDescriptor *)self imageIdentifiersKeyedBySize];
    v6 = [v7 objectForKeyedSubscript:@"HFImageIconIdentifierSizeRegular"];
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HFMultiSizeImageIconDescriptor *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HFMultiSizeImageIconDescriptor *)v5 imageIdentifiersKeyedBySize];
      id v7 = [(HFMultiSizeImageIconDescriptor *)self imageIdentifiersKeyedBySize];
      if (v6 == v7)
      {
        char v10 = 1;
      }
      else
      {
        v8 = [(HFMultiSizeImageIconDescriptor *)v5 imageIdentifiersKeyedBySize];
        v9 = [(HFMultiSizeImageIconDescriptor *)self imageIdentifiersKeyedBySize];
        char v10 = [v8 isEqualToDictionary:v9];
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(HFMultiSizeImageIconDescriptor *)self imageIdentifiersKeyedBySize];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (int64_t)compare:(id)a3
{
  return 0;
}

- (NSDictionary)imageIdentifiersKeyedBySize
{
  return self->_imageIdentifiersKeyedBySize;
}

- (void)setImageIdentifiersKeyedBySize:(id)a3
{
}

- (void).cxx_destruct
{
}

@end