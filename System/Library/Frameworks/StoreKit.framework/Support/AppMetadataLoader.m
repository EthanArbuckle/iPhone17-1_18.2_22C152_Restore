@interface AppMetadataLoader
+ (id)_loaderForApplicationRecord:(id)a3 error:(id *)a4;
+ (id)loadMetadataFromApplicationRecord:(id)a3 withError:(id *)a4;
+ (id)loadMetadataFromBundleContainerURL:(id)a3 withError:(id *)a4;
- (id)_initWithTargetURL:(id)a3 isContainer:(BOOL)a4;
- (id)_loadMetadataFromBundleContainerURLWithError:(id *)a3;
- (id)_loadMetadataFromExtendedAttributeWithError:(id *)a3;
- (id)_loadMetadataWithError:(id *)a3;
@end

@implementation AppMetadataLoader

+ (id)loadMetadataFromApplicationRecord:(id)a3 withError:(id *)a4
{
  v5 = +[AppMetadataLoader _loaderForApplicationRecord:error:](AppMetadataLoader, "_loaderForApplicationRecord:error:", a3);
  v6 = v5;
  if (v5)
  {
    v7 = [v5 _loadMetadataWithError:a4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_loadMetadataWithError:(id *)a3
{
  if (self->_targetIsContainer) {
    [(AppMetadataLoader *)self _loadMetadataFromBundleContainerURLWithError:a3];
  }
  else {
  v3 = [(AppMetadataLoader *)self _loadMetadataFromExtendedAttributeWithError:a3];
  }

  return v3;
}

- (id)_loadMetadataFromBundleContainerURLWithError:(id *)a3
{
  v5 = [(NSURL *)self->_targetURL URLByAppendingPathComponent:@"iTunesMetadata"];
  v6 = [v5 URLByAppendingPathExtension:@"plist"];

  if (v6)
  {
    id v10 = 0;
    v7 = +[MIStoreMetadata metadataFromPlistAtURL:v6 error:&v10];
    id v8 = v10;
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    v7 = 0;
    id v8 = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  if (!v7)
  {
    sub_10001FAF4(self->_targetURL, v8, @"Loading failed");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:

  return v7;
}

+ (id)_loaderForApplicationRecord:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = [AppMetadataLoader alloc];
  v6 = [v4 bundleContainerURL];

  id v7 = [(AppMetadataLoader *)v5 _initWithTargetURL:v6 isContainer:1];

  return v7;
}

- (id)_initWithTargetURL:(id)a3 isContainer:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AppMetadataLoader;
  id v8 = [(AppMetadataLoader *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_targetIsContainer = a4;
    objc_storeStrong((id *)&v8->_targetURL, a3);
  }

  return v9;
}

- (void).cxx_destruct
{
}

+ (id)loadMetadataFromBundleContainerURL:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  id v6 = [[AppMetadataLoader alloc] _initWithTargetURL:v5 isContainer:1];

  id v7 = [v6 _loadMetadataWithError:a4];

  return v7;
}

- (id)_loadMetadataFromExtendedAttributeWithError:(id *)a3
{
  if (a3)
  {
    sub_10001FAF4(self->_targetURL, 0, @"Extended attribute is not available on this platform");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

@end