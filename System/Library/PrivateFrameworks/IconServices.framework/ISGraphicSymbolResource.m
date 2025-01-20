@interface ISGraphicSymbolResource
+ (id)defaultResource;
+ (id)graphicSymbolResourceWithConfiguration:(id)a3 symbolName:(id)a4 url:(id)a5;
+ (id)graphicSymbolResourceWithRecipe:(id)a3 url:(id)a4;
- (IFGraphicSymbolDescriptor)descriptor;
- (ISGraphicSymbolResource)initWithGraphicSymbolDescriptor:(id)a3 symbolName:(id)a4 url:(id)a5;
- (NSString)symbolName;
- (NSURL)url;
- (id)imageForSize:(CGSize)a3 scale:(double)a4;
- (void)setDescriptor:(id)a3;
- (void)setSymbolName:(id)a3;
- (void)updateDescriptorWithImageDescriptor:(id)a3;
@end

@implementation ISGraphicSymbolResource

+ (id)graphicSymbolResourceWithRecipe:(id)a3 url:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = +[ISGraphicSymbolDescriptor descriptorFromGraphicSymbolRecipe:v5];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F6F210]);
    v9 = [v7 name];
    v10 = [v8 initWithSymbolName:v9 bundleURL:v6];

    v11 = [v10 imageForDescriptor:v7];
    if (v11)
    {
      v12 = [ISGraphicSymbolResource alloc];
      v13 = [v7 name];
      v14 = [(ISGraphicSymbolResource *)v12 initWithGraphicSymbolDescriptor:v7 symbolName:v13 url:v6];
    }
    else
    {
      v15 = _ISDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = [v7 name];
        int v18 = 138412546;
        v19 = v16;
        __int16 v20 = 2112;
        id v21 = v6;
      }
      v14 = 0;
    }
  }
  else
  {
    v10 = _ISDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[ISGraphicSymbolResource graphicSymbolResourceWithRecipe:url:]((uint64_t)v5, (uint64_t)v6, v10);
    }
    v14 = 0;
  }

  return v14;
}

+ (id)graphicSymbolResourceWithConfiguration:(id)a3 symbolName:(id)a4 url:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[ISGraphicSymbolDescriptor descriptorFromGraphicIconConfiguration:v7];
  v11 = v10;
  if (v10)
  {
    [v10 setName:v8];
    id v12 = objc_alloc(MEMORY[0x1E4F6F210]);
    v13 = [v11 name];
    v14 = [v12 initWithSymbolName:v13 bundleURL:v9];

    v15 = [v14 imageForDescriptor:v11];
    if (v15)
    {
      v16 = [ISGraphicSymbolResource alloc];
      v17 = [v11 name];
      int v18 = [(ISGraphicSymbolResource *)v16 initWithGraphicSymbolDescriptor:v11 symbolName:v17 url:v9];
    }
    else
    {
      v19 = _ISDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = [v11 name];
        int v22 = 138412802;
        id v23 = v20;
        __int16 v24 = 2112;
        id v25 = v9;
        __int16 v26 = 2112;
        id v27 = v7;
      }
      int v18 = 0;
    }
  }
  else
  {
    v14 = _ISDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138412802;
      id v23 = v7;
      __int16 v24 = 2112;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_error_impl(&dword_1AE771000, v14, OS_LOG_TYPE_ERROR, "Failed to read config %@ - %@ - %@.", (uint8_t *)&v22, 0x20u);
    }
    int v18 = 0;
  }

  return v18;
}

+ (id)defaultResource
{
  v2 = +[ISGraphicSymbolDescriptor descriptorFromGraphicSymbolRecipe:MEMORY[0x1E4F1CC08]];
  v3 = [ISGraphicSymbolResource alloc];
  v4 = [v2 name];
  id v5 = [v2 _url];
  id v6 = [(ISGraphicSymbolResource *)v3 initWithGraphicSymbolDescriptor:v2 symbolName:v4 url:v5];

  return v6;
}

- (ISGraphicSymbolResource)initWithGraphicSymbolDescriptor:(id)a3 symbolName:(id)a4 url:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ISGraphicSymbolResource;
  v11 = [(ISGraphicSymbolResource *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    descriptor = v11->_descriptor;
    v11->_descriptor = (IFGraphicSymbolDescriptor *)v12;

    uint64_t v14 = [v9 copy];
    symbolName = v11->_symbolName;
    v11->_symbolName = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    url = v11->_url;
    v11->_url = (NSURL *)v16;
  }
  return v11;
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc(MEMORY[0x1E4F6F210]);
  id v9 = [(ISGraphicSymbolResource *)self symbolName];
  id v10 = [(ISGraphicSymbolResource *)self url];
  v11 = (void *)[v8 initWithSymbolName:v9 bundleURL:v10];

  if (v11)
  {
    uint64_t v12 = [(ISGraphicSymbolResource *)self descriptor];
    objc_msgSend(v12, "setSize:", width, height);

    v13 = [(ISGraphicSymbolResource *)self descriptor];
    [v13 setScale:a4];

    uint64_t v14 = [(ISGraphicSymbolResource *)self descriptor];
    v15 = [v11 imageForGraphicSymbolDescriptor:v14];

    if (v15)
    {
      uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F1E8]), "initWithCGImage:scale:", -[NSObject CGImage](v15, "CGImage"), a4);
      goto LABEL_10;
    }
    int v18 = _ISDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_super v19 = [(ISGraphicSymbolResource *)self symbolName];
      int v21 = 138412290;
      int v22 = v19;
    }
  }
  else
  {
    v15 = _ISDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v17 = [(ISGraphicSymbolResource *)self symbolName];
      int v21 = 138412290;
      int v22 = v17;
    }
  }
  uint64_t v16 = 0;
LABEL_10:

  return v16;
}

- (void)updateDescriptorWithImageDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 appearance];
  id v6 = [(ISGraphicSymbolResource *)self descriptor];
  [v6 setAppearance:v5];

  uint64_t v7 = [v4 contrast];
  id v8 = [(ISGraphicSymbolResource *)self descriptor];
  [v8 setContrast:v7];

  uint64_t v9 = [v4 vibrancy];
  id v10 = [(ISGraphicSymbolResource *)self descriptor];
  [v10 setVibrancy:v9];

  uint64_t v11 = [v4 layoutDirection];
  uint64_t v12 = [(ISGraphicSymbolResource *)self descriptor];
  [v12 setLayoutDirection:v11];

  v13 = [v4 tintColor];
  uint64_t v14 = [(ISGraphicSymbolResource *)self descriptor];
  [v14 setTintColor:v13];

  uint64_t v15 = [v4 appearanceVariant];
  uint64_t v16 = [(ISGraphicSymbolResource *)self descriptor];
  [v16 setAppearanceVariant:v15];

  uint64_t v17 = [v4 platformStyle];
  if (v17 == 1)
  {
    id v20 = [(ISGraphicSymbolResource *)self descriptor];
    [v20 setPlatform:4];
  }
  else
  {
    id v20 = +[ISPlatformInfo sharedInstance];
    uint64_t v18 = [v20 nativePlatform];
    objc_super v19 = [(ISGraphicSymbolResource *)self descriptor];
    [v19 setPlatform:v18];
  }
}

- (IFGraphicSymbolDescriptor)descriptor
{
  return (IFGraphicSymbolDescriptor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDescriptor:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)symbolName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSymbolName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

+ (void)graphicSymbolResourceWithRecipe:(os_log_t)log url:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1AE771000, log, OS_LOG_TYPE_ERROR, "Failed to read recipe %@ - %@.", (uint8_t *)&v3, 0x16u);
}

@end