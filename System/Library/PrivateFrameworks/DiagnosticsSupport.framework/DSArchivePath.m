@interface DSArchivePath
+ (id)archivePathWithSource:(id)a3 prefix:(id)a4 root:(BOOL)a5;
- (BOOL)root;
- (DSArchivePath)initWithSource:(id)a3 prefix:(id)a4 root:(BOOL)a5;
- (NSString)prefix;
- (NSURL)sourceUrl;
- (void)setPrefix:(id)a3;
- (void)setRoot:(BOOL)a3;
- (void)setSourceUrl:(id)a3;
@end

@implementation DSArchivePath

- (DSArchivePath)initWithSource:(id)a3 prefix:(id)a4 root:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DSArchivePath;
  v11 = [(DSArchivePath *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sourceUrl, a3);
    objc_storeStrong((id *)&v12->_prefix, a4);
    v12->_root = a5;
  }

  return v12;
}

+ (id)archivePathWithSource:(id)a3 prefix:(id)a4 root:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [[DSArchivePath alloc] initWithSource:v8 prefix:v7 root:v5];

  return v9;
}

- (NSURL)sourceUrl
{
  return self->_sourceUrl;
}

- (void)setSourceUrl:(id)a3
{
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
}

- (BOOL)root
{
  return self->_root;
}

- (void)setRoot:(BOOL)a3
{
  self->_root = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_sourceUrl, 0);
}

@end