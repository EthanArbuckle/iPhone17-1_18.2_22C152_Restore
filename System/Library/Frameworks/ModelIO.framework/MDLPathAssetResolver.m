@interface MDLPathAssetResolver
- (BOOL)canResolveAssetNamed:(id)a3;
- (MDLPathAssetResolver)initWithPath:(NSString *)path;
- (NSString)path;
- (id)resolveAssetNamed:(id)a3;
- (void)setPath:(NSString *)path;
@end

@implementation MDLPathAssetResolver

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(NSString *)path
{
  v7 = path;
  if (objc_msgSend_hasSuffix_(v7, v4, @"/"))
  {
    v5 = v7;
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, (const char *)v7, @"%@/", v7);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v6 = self->_path;
  self->_path = v5;
}

- (MDLPathAssetResolver)initWithPath:(NSString *)path
{
  v5 = path;
  v10.receiver = self;
  v10.super_class = (Class)MDLPathAssetResolver;
  v6 = [(MDLPathAssetResolver *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, path);
    v8 = v7;
  }

  return v7;
}

- (BOOL)canResolveAssetNamed:(id)a3
{
  id v5 = a3;
  if (v5 && self->_path)
  {
    v6 = objc_msgSend_resolveAssetNamed_(self, v4, (uint64_t)v5);
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)resolveAssetNamed:(id)a3
{
  id v4 = a3;
  v6 = objc_msgSend_fileURLWithPath_isDirectory_(NSURL, v5, (uint64_t)self->_path, 1);
  v8 = objc_msgSend_URLByAppendingPathComponent_(v6, v7, (uint64_t)v4);

  return v8;
}

- (void).cxx_destruct
{
}

@end