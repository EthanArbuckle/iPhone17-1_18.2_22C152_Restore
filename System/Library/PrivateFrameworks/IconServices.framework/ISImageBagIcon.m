@interface ISImageBagIcon
- (ISImageBagIcon)initWithImageBag:(id)a3;
- (ISImageBagIcon)initWithImages:(id)a3;
- (ISImageBagIcon)initWithImages:(id)a3 decorations:(id)a4;
- (ISImageCache)imageCache;
- (NSArray)images;
- (id)_generateImageWithDescriptor:(id)a3;
- (id)decorations;
- (id)imageForImageDescriptor:(id)a3;
- (void)_prepareImagesForImageDescriptors:(id)a3;
- (void)getImageForImageDescriptor:(id)a3 completion:(id)a4;
- (void)setImageCache:(id)a3;
@end

@implementation ISImageBagIcon

- (ISImageBagIcon)initWithImages:(id)a3
{
  return [(ISImageBagIcon *)self initWithImages:a3 decorations:MEMORY[0x1E4F1CBF0]];
}

- (ISImageBagIcon)initWithImages:(id)a3 decorations:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ISImageBagIcon;
  v9 = [(ISIcon *)&v15 _init];
  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    imageCache = v9->_imageCache;
    v9->_imageCache = (ISImageCache *)v10;

    objc_storeStrong((id *)&v9->_images, a3);
    uint64_t v12 = [v8 copy];
    decorations = v9->_decorations;
    v9->_decorations = (NSArray *)v12;
  }
  return v9;
}

- (ISImageBagIcon)initWithImageBag:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ISImageBagIcon;
  v5 = [(ISIcon *)&v12 _init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    imageCache = v5->_imageCache;
    v5->_imageCache = (ISImageCache *)v6;

    uint64_t v8 = [v4 images];
    images = v5->_images;
    v5->_images = (NSArray *)v8;

    decorations = v5->_decorations;
    v5->_decorations = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (id)_generateImageWithDescriptor:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F6F1F0]);
  uint64_t v6 = [(ISImageBagIcon *)self images];
  id v7 = (void *)[v5 initWithImages:v6];

  uint64_t v8 = [(ISImageBagIcon *)self images];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    if (v7)
    {
LABEL_3:
      uint64_t v10 = +[ISRecipeFactory factoryWithDescriptor:v4];
      v11 = v10;
      if (v9) {
        [v10 recipe];
      }
      else {
      v16 = [v10 genericTaggedRecipe];
      }
      v17 = objc_alloc_init(ISCompositor);
      if ([v4 shape] == 5 || objc_msgSend(v4, "shape") == 6) {
        [(ISCompositor *)v17 setRenderingMode:2];
      }
      v26 = @"kISPrimaryResourceKey";
      v27[0] = v7;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      [(ISCompositor *)v17 addElementWithRecipe:v16 resources:v18];

      [v4 size];
      double v20 = v19;
      double v22 = v21;
      [v4 scale];
      objc_super v15 = -[ISCompositor imageForSize:scale:](v17, "imageForSize:scale:", v20, v22, v23);

      goto LABEL_16;
    }
  }
  else
  {
    objc_super v12 = _ISDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1AE771000, v12, OS_LOG_TYPE_DEFAULT, "No images provided. Attempting to fallback to default assets", v25, 2u);
    }

    v13 = +[ISStaticResources sharedInstance];
    uint64_t v14 = [v13 fallbackResourceForHint:0 descriptor:v4 referenceObj:self];

    id v7 = (void *)v14;
    if (v14) {
      goto LABEL_3;
    }
  }
  v11 = _ISDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[ISImageBagIcon _generateImageWithDescriptor:]((uint64_t)self, v11);
  }
  objc_super v15 = 0;
LABEL_16:

  return v15;
}

- (void)_prepareImagesForImageDescriptors:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)[*(id *)(*((void *)&v20 + 1) + 8 * i) copy];
        uint64_t v10 = [(ISImageCache *)self->_imageCache imageForDescriptor:v9];
        v11 = v10;
        if (!v10
          || (([v10 size], v13 = v12, double v15 = v14, objc_msgSend(v9, "size"), v13 == v17)
            ? (BOOL v18 = v15 == v16)
            : (BOOL v18 = 0),
              !v18))
        {
          uint64_t v19 = [(ISImageBagIcon *)self _generateImageWithDescriptor:v9];

          [(ISImageCache *)self->_imageCache setImage:v19 forDescriptor:v9];
          v11 = (void *)v19;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }
}

- (id)imageForImageDescriptor:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ISImageCache *)self->_imageCache imageForDescriptor:v4];
  uint64_t v6 = v5;
  if (!v5
    || (([v5 size], double v8 = v7, v10 = v9, objc_msgSend(v4, "size"), v8 == v12)
      ? (BOOL v13 = v10 == v11)
      : (BOOL v13 = 0),
        !v13))
  {
    v17[0] = v4;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [(ISIcon *)self prepareImagesForImageDescriptors:v14];

    uint64_t v15 = [(ISImageCache *)self->_imageCache imageForDescriptor:v4];

    uint64_t v6 = (void *)v15;
  }

  return v6;
}

- (void)getImageForImageDescriptor:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  double v7 = (void (**)(id, void *))a4;
  id v8 = a3;
  double v9 = [v6 arrayWithObjects:&v11 count:1];
  -[ISIcon prepareImagesForImageDescriptors:](self, "prepareImagesForImageDescriptors:", v9, v11, v12);

  double v10 = [(ISImageBagIcon *)self imageForImageDescriptor:v8];

  v7[2](v7, v10);
}

- (NSArray)images
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (id)decorations
{
  return self->_decorations;
}

- (ISImageCache)imageCache
{
  return (ISImageCache *)objc_getProperty(self, a2, 40, 1);
}

- (void)setImageCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_decorations, 0);
  objc_storeStrong((id *)&self->_images, 0);
}

- (void)_generateImageWithDescriptor:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AE771000, a2, OS_LOG_TYPE_ERROR, "Unable to create icon! Failed to create resource for %@", (uint8_t *)&v2, 0xCu);
}

@end