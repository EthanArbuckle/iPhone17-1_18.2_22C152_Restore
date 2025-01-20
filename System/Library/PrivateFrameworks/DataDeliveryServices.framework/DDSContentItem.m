@interface DDSContentItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContentItem:(id)a3;
- (DDSAsset)parentAsset;
- (DDSContentItem)init;
- (DDSContentItem)initWithParentAsset:(id)a3 contents:(id)a4;
- (NSDictionary)contents;
- (NSDictionary)region;
- (NSString)fileName;
- (NSString)locale;
- (NSString)type;
- (NSURL)path;
- (id)description;
- (void)setContents:(id)a3;
- (void)setParentAsset:(id)a3;
@end

@implementation DDSContentItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_parentAsset, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(DDSContentItem *)self isEqualToContentItem:v4];

  return v5;
}

- (BOOL)isEqualToContentItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DDSContentItem *)self parentAsset];
  v6 = [v4 parentAsset];
  if (DDSObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    v7 = [(DDSContentItem *)self contents];
    v8 = [v4 contents];
    char v9 = DDSObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSString)locale
{
  v2 = [(DDSContentItem *)self contents];
  v3 = [v2 objectForKeyedSubscript:kLocale];

  return (NSString *)v3;
}

- (NSString)fileName
{
  v2 = [(DDSContentItem *)self contents];
  v3 = [v2 objectForKeyedSubscript:kContentPath];

  return (NSString *)v3;
}

- (NSString)type
{
  v2 = [(DDSContentItem *)self contents];
  v3 = [v2 objectForKeyedSubscript:kContentType];

  return (NSString *)v3;
}

- (NSURL)path
{
  v3 = [(DDSContentItem *)self contents];
  id v4 = [v3 objectForKeyedSubscript:kContentPath];

  BOOL v5 = [(DDSContentItem *)self parentAsset];
  v6 = [v5 localURL];
  v7 = [v6 URLByAppendingPathComponent:v4];

  return (NSURL *)v7;
}

- (NSDictionary)contents
{
  return self->_contents;
}

- (DDSAsset)parentAsset
{
  return self->_parentAsset;
}

- (DDSContentItem)initWithParentAsset:(id)a3 contents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DDSContentItem;
  char v9 = [(DDSContentItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parentAsset, a3);
    objc_storeStrong((id *)&v10->_contents, a4);
  }

  return v10;
}

- (DDSContentItem)init
{
  return 0;
}

- (NSDictionary)region
{
  v2 = [(DDSContentItem *)self contents];
  v3 = [v2 objectForKeyedSubscript:kRegion];

  return (NSDictionary *)v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(DDSContentItem *)self contents];
  v6 = [v5 objectForKeyedSubscript:kContentType];
  id v7 = [(DDSContentItem *)self contents];
  id v8 = [v7 objectForKeyedSubscript:kContentPath];
  char v9 = [v3 stringWithFormat:@"<%@: %p, type: %@, path: %@>", v4, self, v6, v8];

  return v9;
}

- (void)setParentAsset:(id)a3
{
}

- (void)setContents:(id)a3
{
}

@end