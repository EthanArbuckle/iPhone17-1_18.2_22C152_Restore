@interface ISBundleResourceProvider
- (BOOL)_isAppleResource;
- (ISBundleResourceProvider)initWithBundle:(id)a3 options:(unint64_t)a4;
- (ISBundleResourceProvider)initWithBundleURL:(id)a3 iconDictionary:(id)a4 options:(unint64_t)a5;
- (NSDictionary)iconDictionary;
- (NSString)templateType;
- (NSURL)bundleURL;
- (id)description;
- (id)iconResource;
- (id)resourceNamed:(id)a3;
- (id)symbol;
- (void)resolveResources;
- (void)setBundleURL:(id)a3;
- (void)setIconDictionary:(id)a3;
- (void)setTemplateType:(id)a3;
@end

@implementation ISBundleResourceProvider

- (ISBundleResourceProvider)initWithBundleURL:(id)a3 iconDictionary:(id)a4 options:(unint64_t)a5
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ISBundleResourceProvider;
  v10 = [(ISResourceProvider *)&v19 init];
  if (v10)
  {
    if ([v8 isFileReferenceURL]) {
      [v8 filePathURL];
    }
    else {
    uint64_t v11 = [v8 absoluteURL];
    }
    bundleURL = v10->_bundleURL;
    v10->_bundleURL = (NSURL *)v11;

    objc_storeStrong((id *)&v10->_iconDictionary, a4);
    iconDictionary = v10->_iconDictionary;
    v20[0] = @"UTTypeIconBadgeName";
    v20[1] = @"UTTypeIconText";
    v20[2] = @"UTTypeIconBackgroundName";
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
    v15 = [(NSDictionary *)iconDictionary _IF_stringForKeys:v14];

    if (v15) {
      unint64_t v16 = a5 | 2;
    }
    else {
      unint64_t v16 = a5;
    }
    v18.receiver = v10;
    v18.super_class = (Class)ISBundleResourceProvider;
    [(ISResourceProvider *)&v18 setOptions:v16];
  }

  return v10;
}

- (ISBundleResourceProvider)initWithBundle:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 bundleURL];
  id v8 = [v6 iconDictionary];
  id v9 = [(ISBundleResourceProvider *)self initWithBundleURL:v7 iconDictionary:v8 options:a4];

  if (v9 && [v6 platform]) {
    -[ISResourceProvider setPlatform:](v9, "setPlatform:", [v6 platform]);
  }

  return v9;
}

- (void)resolveResources
{
  if (![(ISResourceProvider *)self resolved])
  {
    [(ISResourceProvider *)self setResolved:1];
    id v9 = self->_bundleURL;
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C0]) initWithURL:v9];
    v4 = self->_iconDictionary;
    v5 = +[ISResourceProvider resourceWithBundleURL:v9 iconDictionary:v4 options:0];
    uint64_t v6 = [(ISResourceProvider *)self resourcesByResourceKey];
    [(id)v6 setObject:v5 forKeyedSubscript:@"kISPrimaryResourceKey"];

    [(ISResourceProvider *)self _findTextResourceWithIconDictionary:v4];
    [(ISResourceProvider *)self setPlatformWithBundle:v3];
    LOBYTE(v6) = [(ISResourceProvider *)self _findBadgeResourceWithIconDictionary:v4 bundle:v3 record:0];
    BOOL v7 = [(ISResourceProvider *)self _findBackgroundResourceWithIconDictionary:v4 bundle:v3];
    if ((v6 & 1) == 0 && !v7 && v5)
    {
      id v8 = [(ISResourceProvider *)self resourcesByResourceKey];
      [v8 setObject:v5 forKeyedSubscript:@"kISBadgeResourceKey"];
    }
    [(ISResourceProvider *)self _findCustomRecipeWithIconDictionary:v4 bundle:v3];
  }
}

- (id)iconResource
{
  v6.receiver = self;
  v6.super_class = (Class)ISBundleResourceProvider;
  v3 = [(ISResourceProvider *)&v6 iconResource];
  if (!v3)
  {
    [(ISBundleResourceProvider *)self resolveResources];
    v5.receiver = self;
    v5.super_class = (Class)ISBundleResourceProvider;
    v3 = [(ISResourceProvider *)&v5 iconResource];
  }
  return v3;
}

- (id)resourceNamed:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ISBundleResourceProvider;
  objc_super v5 = [(ISResourceProvider *)&v8 resourceNamed:v4];
  if (!v5)
  {
    [(ISBundleResourceProvider *)self resolveResources];
    v7.receiver = self;
    v7.super_class = (Class)ISBundleResourceProvider;
    objc_super v5 = [(ISResourceProvider *)&v7 resourceNamed:v4];
  }

  return v5;
}

- (id)symbol
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F6F1C0] coreTypesBundle];
  id v4 = [v3 bundleURL];
  char v5 = [v4 isEqual:self->_bundleURL];

  if (v5) {
    objc_super v6 = 0;
  }
  else {
    objc_super v6 = self->_bundleURL;
  }
  objc_super v7 = self->_iconDictionary;
  v15[0] = @"CFBundleSymbolName";
  v15[1] = @"UTTypeSymbolName";
  objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  id v9 = [(NSDictionary *)v7 _IF_stringForKeys:v8];

  if (v9) {
    goto LABEL_7;
  }
  v10 = [(NSURL *)v6 lastPathComponent];
  uint64_t v11 = [v10 lowercaseString];
  int v12 = [v11 isEqualToString:@"mydocuments.cannedsearch"];

  if (v12)
  {
    id v9 = @"clock";
LABEL_7:
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F6F210]) initWithSymbolName:v9 bundleURL:v6];
    goto LABEL_8;
  }
  id v9 = 0;
  v13 = 0;
LABEL_8:

  return v13;
}

- (BOOL)_isAppleResource
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C0]) initWithURL:self->_bundleURL];
  v3 = [v2 bundleID];
  char v4 = [v3 hasPrefix:@"com.apple"];

  return v4;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)ISBundleResourceProvider;
  char v4 = [(ISBundleResourceProvider *)&v9 description];
  char v5 = [(ISBundleResourceProvider *)self bundleURL];
  objc_super v6 = [(ISBundleResourceProvider *)self iconDictionary];
  objc_super v7 = [v3 stringWithFormat:@"%@ - %@ %@", v4, v5, v6];

  return v7;
}

- (NSString)templateType
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTemplateType:(id)a3
{
}

- (NSURL)bundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 120, 1);
}

- (void)setBundleURL:(id)a3
{
}

- (NSDictionary)iconDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setIconDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDictionary, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_templateType, 0);
}

@end