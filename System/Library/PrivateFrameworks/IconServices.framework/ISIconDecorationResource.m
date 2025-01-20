@interface ISIconDecorationResource
- (ISIconDecoration)decoration;
- (ISIconDecorationResource)initWithDecoration:(id)a3;
- (ISScalableCompositorResource)internalResource;
- (id)imageForSize:(CGSize)a3 scale:(double)a4;
- (void)configureWithType:(id)a3;
@end

@implementation ISIconDecorationResource

- (ISIconDecorationResource)initWithDecoration:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ISIconDecorationResource;
  v6 = [(ISIconDecorationResource *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_decoration, a3);
    if ([(ISIconDecoration *)v7->_decoration identifierKind] == 2)
    {
      v8 = [(ISIconDecoration *)v7->_decoration identifier];
      [(ISIconDecorationResource *)v7 configureWithType:v8];
    }
    else
    {
      v8 = _ISDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_1AE771000, v8, OS_LOG_TYPE_DEFAULT, "Invalid decoration %@. Badging with app an icon is not currently supported.", buf, 0xCu);
      }
    }
  }
  return v7;
}

- (void)configureWithType:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = [(ISIconDecoration *)self->_decoration identifier];
  int v6 = UTTypeConformsTo(v5, @"com.apple.icon-decoration");

  if (v6)
  {
    v7 = [(ISIconDecoration *)self->_decoration identifier];
    v8 = _UTTypeCopyGlyphName();

    if (!v8)
    {
      v18 = [(ISIconDecoration *)self->_decoration identifier];
      int v19 = UTTypeConformsTo(v18, @"com.apple.icon-decoration.system");

      if (!v19) {
        goto LABEL_17;
      }
      v20 = _ISDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[ISIconDecorationResource configureWithType:]((uint64_t)v4, v20);
      }

      v21 = [(ISIconDecoration *)self->_decoration identifier];
      v8 = _UTTypeCopyIconName();

      if (!v8)
      {
LABEL_17:
        uint64_t v13 = _ISDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v4;
          _os_log_impl(&dword_1AE771000, v13, OS_LOG_TYPE_DEFAULT, "No resource named for decoration type '%@'", buf, 0xCu);
        }
        v8 = 0;
        goto LABEL_21;
      }
    }
    v9 = [(ISIconDecoration *)self->_decoration identifier];
    CFURLRef v10 = UTTypeCopyDeclaringBundleURL(v9);

    Unique = (__CFBundle *)_CFBundleCreateUnique();
    if (!Unique)
    {
      uint64_t v13 = v10;
LABEL_21:

      goto LABEL_22;
    }
    id v12 = Unique;
    uint64_t v13 = CFBundleCopyResourceURL(Unique, @"Assets", @"car", 0);
    CFRelease(v12);

    if (v13)
    {
      id v22 = 0;
      v14 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v13 imageName:v8 error:&v22];
      id v15 = v22;
      internalResource = self->_internalResource;
      self->_internalResource = v14;

      if (!self->_internalResource && v15)
      {
        v17 = _ISDefaultLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v24 = v8;
          __int16 v25 = 2112;
          v26 = v13;
          __int16 v27 = 2112;
          id v28 = v15;
          _os_log_impl(&dword_1AE771000, v17, OS_LOG_TYPE_DEFAULT, "Failed to load resource named: %@ from asset catalog at URL: %@ with error: %@", buf, 0x20u);
        }
      }
      goto LABEL_21;
    }
  }
  else
  {
    v8 = _ISDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(ISIconDecorationResource *)(uint64_t)v4 configureWithType:v8];
    }
  }
LABEL_22:
}

- (id)imageForSize:(CGSize)a3 scale:(double)a4
{
  internalResource = self->_internalResource;
  if (internalResource)
  {
    internalResource = objc_msgSend(internalResource, "imageForSize:scale:", a3.width, a3.height, a4);
  }
  return internalResource;
}

- (ISIconDecoration)decoration
{
  return (ISIconDecoration *)objc_getProperty(self, a2, 8, 1);
}

- (ISScalableCompositorResource)internalResource
{
  return (ISScalableCompositorResource *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalResource, 0);
  objc_storeStrong((id *)&self->_decoration, 0);
}

- (void)configureWithType:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1AE771000, log, OS_LOG_TYPE_ERROR, "Decoration type %@ does not conform to %@", (uint8_t *)&v3, 0x16u);
}

- (void)configureWithType:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AE771000, a2, OS_LOG_TYPE_DEBUG, "No glyph resource specified, looking for an icon resource for system type '%@'", (uint8_t *)&v2, 0xCu);
}

@end