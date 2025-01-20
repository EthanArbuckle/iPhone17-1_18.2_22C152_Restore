@interface JTLocalAssetMediaItem
- (BOOL)canSaveToCameraRoll;
- (BOOL)isEqual:(id)a3;
- (JTLocalAssetMediaItem)initWithInfo:(id)a3 delegate:(id)a4;
- (JTLocalAssetMediaItem)initWithURL:(id)a3;
- (NSString)localFileName;
- (NSURL)localFileURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)info;
- (unint64_t)hash;
- (void)dealloc;
- (void)setLocalFileName:(id)a3;
- (void)setLocalFileURL:(id)a3;
@end

@implementation JTLocalAssetMediaItem

- (JTLocalAssetMediaItem)initWithURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)JTLocalAssetMediaItem;
  v5 = [(JFXMediaItem *)&v8 init];
  v6 = v5;
  if (v5) {
    [(JTLocalAssetMediaItem *)v5 setLocalFileURL:v4];
  }

  return v6;
}

- (void)dealloc
{
  localFileURL = self->_localFileURL;
  self->_localFileURL = 0;

  localFileName = self->_localFileName;
  self->_localFileName = 0;

  v5.receiver = self;
  v5.super_class = (Class)JTLocalAssetMediaItem;
  [(JFXMediaItem *)&v5 dealloc];
}

- (id)description
{
  if (self->_localFileURL)
  {
    v8.receiver = self;
    v8.super_class = (Class)JTLocalAssetMediaItem;
    v3 = [(JFXMediaItem *)&v8 description];
    id v4 = [NSString stringWithFormat:@"\r\turl: %@", self->_localFileURL];
    objc_super v5 = [v3 stringByAppendingString:v4];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)JTLocalAssetMediaItem;
    objc_super v5 = [(JFXMediaItem *)&v7 description];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)JTLocalAssetMediaItem;
  objc_super v5 = -[JFXMediaItem copyWithZone:](&v13, sel_copyWithZone_);
  localFileURL = self->_localFileURL;
  if (localFileURL)
  {
    uint64_t v7 = [(NSURL *)localFileURL copyWithZone:a3];
    objc_super v8 = (void *)v5[8];
    v5[8] = v7;
  }
  else
  {
    objc_super v8 = (void *)v5[8];
    v5[8] = 0;
  }

  localFileName = self->_localFileName;
  if (localFileName)
  {
    uint64_t v10 = [(NSString *)localFileName copyWithZone:a3];
    v11 = (void *)v5[7];
    v5[7] = v10;
  }
  else
  {
    v11 = (void *)v5[7];
    v5[7] = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (JTLocalAssetMediaItem *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      v6 = [(JTLocalAssetMediaItem *)self localFileURL];

      if (v6)
      {
        uint64_t v7 = [(JTLocalAssetMediaItem *)self localFileURL];
        objc_super v8 = [v7 path];
        v9 = [(JTLocalAssetMediaItem *)v5 localFileURL];
        uint64_t v10 = [v9 path];
        LOBYTE(v11) = [v8 isEqualToString:v10];
      }
      else
      {
        v11 = [(JTLocalAssetMediaItem *)self localFileName];

        if (!v11)
        {
LABEL_10:

          goto LABEL_11;
        }
        uint64_t v7 = [(JTLocalAssetMediaItem *)self localFileName];
        objc_super v8 = [(JTLocalAssetMediaItem *)v5 localFileName];
        LOBYTE(v11) = [v7 isEqual:v8];
      }

      goto LABEL_10;
    }
    LOBYTE(v11) = 0;
  }
LABEL_11:

  return (char)v11;
}

- (unint64_t)hash
{
  v3 = [(JTLocalAssetMediaItem *)self localFileURL];
  if (v3) {
    [(JTLocalAssetMediaItem *)self localFileURL];
  }
  else {
  id v4 = [(JTLocalAssetMediaItem *)self localFileName];
  }
  unint64_t v5 = [v4 hash];

  return v5;
}

- (void)setLocalFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_localFileURL, a3);
  id v7 = a3;
  unint64_t v5 = [v7 lastPathComponent];
  localFileName = self->_localFileName;
  self->_localFileName = v5;
}

- (BOOL)canSaveToCameraRoll
{
  return self->_localFileURL != 0;
}

- (JTLocalAssetMediaItem)initWithInfo:(id)a3 delegate:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)JTLocalAssetMediaItem;
  id v5 = a3;
  v6 = [(JFXMediaItem *)&v10 initWithInfo:v5 delegate:a4];
  uint64_t v7 = objc_msgSend(v5, "objectForKey:", kMediaItemLocalFileNameKey, v10.receiver, v10.super_class);

  localFileName = v6->_localFileName;
  v6->_localFileName = (NSString *)v7;

  return v6;
}

- (id)info
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  v8.receiver = self;
  v8.super_class = (Class)JTLocalAssetMediaItem;
  id v4 = [(JFXMediaItem *)&v8 info];
  id v5 = [v3 dictionaryWithDictionary:v4];

  localFileName = self->_localFileName;
  if (localFileName) {
    [v5 setObject:localFileName forKey:kMediaItemLocalFileNameKey];
  }
  return v5;
}

- (NSString)localFileName
{
  return self->_localFileName;
}

- (void)setLocalFileName:(id)a3
{
}

- (NSURL)localFileURL
{
  return self->_localFileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localFileURL, 0);
  objc_storeStrong((id *)&self->_localFileName, 0);
}

@end