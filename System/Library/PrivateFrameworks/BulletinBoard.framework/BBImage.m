@interface BBImage
+ (BBImage)imageWithData:(id)a3;
+ (BBImage)imageWithName:(id)a3 inBundle:(id)a4;
+ (BBImage)imageWithName:(id)a3 inBundlePath:(id)a4;
+ (BOOL)supportsSecureCoding;
- (BBImage)initWithCoder:(id)a3;
- (BBImage)initWithData:(id)a3 path:(id)a4 name:(id)a5 bundlePath:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (NSString)bundlePath;
- (NSString)name;
- (NSString)path;
- (id)awakeAfterUsingCoder:(id)a3;
- (id)replacementObjectForCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundlePath:(id)a3;
- (void)setData:(id)a3;
- (void)setName:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation BBImage

+ (BBImage)imageWithData:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setData:v4];

  return (BBImage *)v5;
}

+ (BBImage)imageWithName:(id)a3 inBundle:(id)a4
{
  id v6 = a3;
  v7 = [a4 bundlePath];
  v8 = [a1 imageWithName:v6 inBundlePath:v7];

  return (BBImage *)v8;
}

+ (BBImage)imageWithName:(id)a3 inBundlePath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setName:v7];

  [v8 setBundlePath:v6];
  return (BBImage *)v8;
}

- (BBImage)initWithData:(id)a3 path:(id)a4 name:(id)a5 bundlePath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(BBImage *)self init];
  v15 = v14;
  if (v14)
  {
    [(BBImage *)v14 setData:v10];
    [(BBImage *)v15 setPath:v11];
    [(BBImage *)v15 setName:v12];
    [(BBImage *)v15 setBundlePath:v13];
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BBImage *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v5 = v4;
      id v6 = [(BBImage *)self name];
      id v7 = [(BBImage *)v5 name];
      if (BSEqualObjects())
      {
        id v8 = [(BBImage *)self bundlePath];
        v9 = [(BBImage *)v5 bundlePath];
        if (BSEqualObjects())
        {
          id v10 = [(BBImage *)self path];
          id v11 = [(BBImage *)v5 path];
          if (BSEqualObjects())
          {
            v15 = [(BBImage *)self data];
            id v12 = [(BBImage *)v5 data];
            char v13 = BSEqualObjects();
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(BBImage *)self data];
  uint64_t v4 = [v3 hash];
  id v5 = [(BBImage *)self path];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(BBImage *)self name];
  uint64_t v8 = [v7 hash];
  v9 = [(BBImage *)self bundlePath];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBImage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imagePath"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageName"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundlePath"];

  v9 = [(BBImage *)self initWithData:v5 path:v6 name:v7 bundlePath:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BBImage *)self data];
  [v4 encodeObject:v5 forKey:@"imageData"];

  uint64_t v6 = [(BBImage *)self path];
  [v4 encodeObject:v6 forKey:@"imagePath"];

  id v7 = [(BBImage *)self name];
  [v4 encodeObject:v7 forKey:@"imageName"];

  id v8 = [(BBImage *)self bundlePath];
  [v4 encodeObject:v8 forKey:@"bundlePath"];
}

- (id)replacementObjectForCoder:(id)a3
{
  id v4 = [self bb_objectCache];
  id v5 = [v4 cacheObject:self];

  return v5;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  id v4 = [self bb_objectCache];
  id v5 = [v4 cacheObject:self];

  return v5;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (void)setBundlePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end