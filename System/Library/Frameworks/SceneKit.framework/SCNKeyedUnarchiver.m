@interface SCNKeyedUnarchiver
- (NSArray)allTargetsFromAnimCodec;
- (NSDictionary)context;
- (NSString)lookUpKey;
- (NSURL)documentEnclosingURL;
- (NSURL)documentURL;
- (SCNAssetCatalog)assetCatalog;
- (id)initForReadingWithData:(id)a3 secure:(BOOL)a4;
- (id)lookUpFoundInstance;
- (void)dealloc;
- (void)setAllTargetsFromAnimCodec:(id)a3;
- (void)setAssetCatalog:(id)a3;
- (void)setContext:(id)a3;
- (void)setDocumentURL:(id)a3;
- (void)setLookUpFoundInstance:(id)a3;
- (void)setLookUpKey:(id)a3;
@end

@implementation SCNKeyedUnarchiver

- (id)initForReadingWithData:(id)a3 secure:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SCNKeyedUnarchiver;
  id v10 = 0;
  id v5 = [(SCNKeyedUnarchiver *)&v9 initForReadingFromData:a3 error:&v10];
  v6 = v5;
  if (v5)
  {
    [v5 setDecodingFailurePolicy:0];
    [v6 setRequiresSecureCoding:v4];
  }
  if (v10)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNKeyedUnarchiver initForReadingWithData:secure:](&v10, v7);
    }
  }
  if (C3DSceneSourceGetSceneCount()) {
    [v6 _allowDecodingCyclesInSecureMode];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNKeyedUnarchiver;
  [(SCNKeyedUnarchiver *)&v3 dealloc];
}

- (NSURL)documentEnclosingURL
{
  objc_super v3 = [(SCNKeyedUnarchiver *)self documentURL];
  if (v3)
  {
    return [(NSURL *)v3 URLByDeletingLastPathComponent];
  }
  else
  {
    id v5 = [(SCNKeyedUnarchiver *)self context];
    return (NSURL *)[(NSDictionary *)v5 valueForKey:@"kEnclosingFolderURL"];
  }
}

- (NSURL)documentURL
{
  return self->_documentURL;
}

- (void)setDocumentURL:(id)a3
{
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (SCNAssetCatalog)assetCatalog
{
  return self->_assetCatalog;
}

- (void)setAssetCatalog:(id)a3
{
}

- (NSString)lookUpKey
{
  return self->_lookUpKey;
}

- (void)setLookUpKey:(id)a3
{
}

- (id)lookUpFoundInstance
{
  return self->_lookUpFoundInstance;
}

- (void)setLookUpFoundInstance:(id)a3
{
}

- (NSArray)allTargetsFromAnimCodec
{
  return self->_allTargetsFromAnimCodec;
}

- (void)setAllTargetsFromAnimCodec:(id)a3
{
}

- (void)initForReadingWithData:(id *)a1 secure:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Failed to instantiate unarchiver with error %@", (uint8_t *)&v4, 0xCu);
}

@end