@interface _LSEnumeratedBundleInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaceholder;
- (NSString)bundleID;
- (_LSEnumeratedBundleInfo)initWithBundleID:(id)a3 isPlaceholder:(BOOL)a4;
- (unint64_t)hash;
@end

@implementation _LSEnumeratedBundleInfo

- (_LSEnumeratedBundleInfo)initWithBundleID:(id)a3 isPlaceholder:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_LSEnumeratedBundleInfo;
  v8 = [(_LSEnumeratedBundleInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bundleID, a3);
    v9->_isPlaceholder = a4;
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_isPlaceholder | (2 * [(NSString *)self->_bundleID hash]);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 bundleID];
    if ([v6 isEqualToString:self->_bundleID]) {
      BOOL v7 = self->_isPlaceholder == [v5 isPlaceholder];
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void).cxx_destruct
{
}

@end