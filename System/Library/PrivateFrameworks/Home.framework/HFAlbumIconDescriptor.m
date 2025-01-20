@interface HFAlbumIconDescriptor
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldForceLTR;
- (HFAlbumIconDescriptor)initWithImageData:(id)a3;
- (NSData)imageData;
- (NSString)description;
- (NSString)identifier;
- (id)iconDescriptorByMergingWithIconDescriptor:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
@end

@implementation HFAlbumIconDescriptor

- (HFAlbumIconDescriptor)initWithImageData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFAlbumIconDescriptor;
  v6 = [(HFAlbumIconDescriptor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_imageData, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HFAlbumIconDescriptor *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(HFAlbumIconDescriptor *)v4 imageData];
      v6 = [(HFAlbumIconDescriptor *)self imageData];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(HFAlbumIconDescriptor *)self imageData];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)identifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(HFAlbumIconDescriptor *)self imageData];
  char v7 = [v3 stringWithFormat:@"<%@: %p, \"%@\">", v5, self, v6];

  return (NSString *)v7;
}

- (id)iconDescriptorByMergingWithIconDescriptor:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7
    && ([v7 imageData],
        v8 = objc_claimAutoreleasedReturnValue(),
        [(HFAlbumIconDescriptor *)self imageData],
        objc_super v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v8 isEqual:v9],
        v9,
        v8,
        v10))
  {
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)compare:(id)a3
{
  return 0;
}

- (BOOL)shouldForceLTR
{
  return self->_shouldForceLTR;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
}

@end