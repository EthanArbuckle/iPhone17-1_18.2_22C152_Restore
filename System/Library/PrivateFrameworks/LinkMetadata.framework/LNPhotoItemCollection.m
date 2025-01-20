@interface LNPhotoItemCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNPhotoItemCollection)initWithCoder:(id)a3;
- (LNPhotoItemCollection)initWithItems:(id)a3;
- (NSArray)items;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNPhotoItemCollection

- (void).cxx_destruct
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNPhotoItemCollection *)self items];
  [v4 encodeObject:v5 forKey:@"items"];
}

- (LNPhotoItemCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"items"];

  if (v5)
  {
    self = [(LNPhotoItemCollection *)self initWithItems:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNPhotoItemCollection *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNPhotoItemCollection *)self items];
      v8 = [(LNPhotoItemCollection *)v6 items];
      id v9 = v7;
      id v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        char v12 = 1;
      }
      else
      {
        char v12 = 0;
        if (v9 && v10) {
          char v12 = [v9 isEqualToArray:v10];
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (LNPhotoItemCollection)initWithItems:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"LNPhotoItemCollection.m", 17, @"Invalid parameter not satisfying: %@", @"items" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)LNPhotoItemCollection;
  v7 = [(LNPhotoItemCollection *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_items, a3);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end