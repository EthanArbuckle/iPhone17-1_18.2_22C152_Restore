@interface AVMediaDataStorage
- (AVMediaDataStorage)init;
- (AVMediaDataStorage)initWithURL:(NSURL *)URL options:(NSDictionary *)options;
- (BOOL)isEqual:(id)a3;
- (NSURL)URL;
- (id)description;
- (unint64_t)hash;
@end

@implementation AVMediaDataStorage

- (AVMediaDataStorage)init
{
  return [(AVMediaDataStorage *)self initWithURL:0 options:0];
}

- (AVMediaDataStorage)initWithURL:(NSURL *)URL options:(NSDictionary *)options
{
  v6 = URL;
  v13.receiver = self;
  v13.super_class = (Class)AVMediaDataStorage;
  v7 = [(AVMediaDataStorage *)&v13 init];
  if (v7)
  {
    v8 = objc_alloc_init(AVMediaDataStorageInternal);
    mediaDataStorageInternal = v7->_mediaDataStorageInternal;
    v7->_mediaDataStorageInternal = v8;

    v10 = v7->_mediaDataStorageInternal;
    if (!v10)
    {
      v11 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v10->URL, URL);
  }
  v11 = v7;
LABEL_6:

  return v11;
}

- (NSURL)URL
{
  return self->_mediaDataStorageInternal->URL;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AVMediaDataStorage *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(AVMediaDataStorage *)self URL];
      v6 = [(AVMediaDataStorage *)v4 URL];
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
  if (self->_mediaDataStorageInternal->URL)
  {
    URL = self->_mediaDataStorageInternal->URL;
    return CFHash(URL);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)AVMediaDataStorage;
    return [(AVMediaDataStorage *)&v4 hash];
  }
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(AVMediaDataStorage *)self URL];
  char v7 = [v3 stringWithFormat:@"<%@: %p, URL = %@>", v5, self, v6];

  return v7;
}

- (void).cxx_destruct
{
}

@end