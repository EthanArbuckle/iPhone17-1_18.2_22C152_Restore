@interface ISSymbolIcon
+ (BOOL)supportsSecureCoding;
- (ISGraphicIconConfiguration)config;
- (ISGraphicSymbolDescriptor)graphicSymbolDescriptor;
- (ISImageCache)imageCache;
- (ISSymbolIcon)initWithCoder:(id)a3;
- (ISSymbolIcon)initWithSymbolName:(id)a3;
- (ISSymbolIcon)initWithSymbolName:(id)a3 configuration:(id)a4;
- (NSString)symbolName;
- (id)_generateImageWithDescriptor:(id)a3;
- (id)_specUpdatedDescriptorForDescriptor:(id)a3;
- (id)description;
- (id)imageForImageDescriptor:(id)a3;
- (id)symbol;
- (void)_prepareImagesForImageDescriptors:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)getImageForImageDescriptor:(id)a3 completion:(id)a4;
@end

@implementation ISSymbolIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISSymbolIcon)initWithSymbolName:(id)a3
{
  return [(ISSymbolIcon *)self initWithSymbolName:a3 configuration:0];
}

- (ISSymbolIcon)initWithSymbolName:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ISSymbolIcon;
  v9 = [(ISCodableIcon *)&v16 _init];
  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    imageCache = v9->_imageCache;
    v9->_imageCache = (ISImageCache *)v10;

    objc_storeStrong((id *)&v9->_symbolName, a3);
    graphicSymbolDescriptor = v9->_graphicSymbolDescriptor;
    v9->_graphicSymbolDescriptor = 0;

    uint64_t v13 = [v8 copy];
    config = v9->_config;
    v9->_config = (ISGraphicIconConfiguration *)v13;
  }
  return v9;
}

- (ISSymbolIcon)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolName"];
  if ([v4 decodeBoolForKey:@"configset"])
  {
    v6 = objc_opt_new();
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v9 = [v7 setWithArray:v8];
    uint64_t v10 = [v4 decodeArrayOfObjectsOfClasses:v9 forKey:@"symbolColors"];
    [v6 setSymbolColors:v10];

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    uint64_t v13 = [v11 setWithArray:v12];
    v14 = [v4 decodeArrayOfObjectsOfClasses:v13 forKey:@"enclosureColors"];
    [v6 setEnclosureColors:v14];

    objc_msgSend(v6, "setRenderingMode:", objc_msgSend(v4, "decodeIntegerForKey:", @"renderingMode"));
    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v6 = 0;
  if (v5) {
LABEL_5:
  }
    self = [(ISSymbolIcon *)self initWithSymbolName:v5 configuration:v6];
LABEL_6:

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_symbolName forKey:@"symbolName"];
  id v4 = [(ISGraphicIconConfiguration *)self->_config symbolColors];
  [v6 encodeObject:v4 forKey:@"symbolColors"];

  v5 = [(ISGraphicIconConfiguration *)self->_config enclosureColors];
  [v6 encodeObject:v5 forKey:@"enclosureColors"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[ISGraphicIconConfiguration renderingMode](self->_config, "renderingMode"), @"renderingMode");
  if (self->_config) {
    [v6 encodeBool:1 forKey:@"configset"];
  }
}

- (id)symbol
{
  id v3 = objc_alloc(MEMORY[0x1E4F6F210]);
  id v4 = [(ISSymbolIcon *)self symbolName];
  v5 = (void *)[v3 initWithSymbolName:v4 bundleURL:0];

  return v5;
}

- (id)_generateImageWithDescriptor:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F6F210]);
  id v6 = [(ISSymbolIcon *)self symbolName];
  id v7 = (void *)[v5 initWithSymbolName:v6 bundleURL:0];

  if (v7)
  {
    id v8 = [(ISSymbolIcon *)self config];

    if (v8)
    {
      v9 = [(ISSymbolIcon *)self config];
      uint64_t v10 = [(ISSymbolIcon *)self symbolName];
      v11 = +[ISGraphicSymbolResource graphicSymbolResourceWithConfiguration:v9 symbolName:v10 url:0];

      [v11 updateDescriptorWithImageDescriptor:v4];
      [v4 size];
      double v13 = v12;
      double v15 = v14;
      [v4 scale];
      v17 = objc_msgSend(v11, "imageForSize:scale:", v13, v15, v16);
    }
    else
    {
      [v4 size];
      double v21 = v20;
      double v23 = v22;
      [v4 scale];
      v17 = objc_msgSend(v7, "imageForSize:scale:", v21, v23, v24);
    }
  }
  else
  {
    v18 = _ISDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = [(ISSymbolIcon *)self symbolName];
      int v26 = 138412290;
      v27 = v19;
    }
    v17 = 0;
  }

  return v17;
}

- (id)_specUpdatedDescriptorForDescriptor:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F6F1E0] defaultIconSpecification];
  [v3 size];
  double v6 = v5;
  double v8 = v7;
  [v3 scale];
  uint64_t v10 = objc_msgSend(v4, "imageSpecificationForSize:scale:", v6, v8, v9);
  [v10 size];
  objc_msgSend(v3, "setSize:");
  [v10 scale];
  objc_msgSend(v3, "setScale:");

  return v3;
}

- (void)_prepareImagesForImageDescriptors:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = (void *)[*(id *)(*((void *)&v21 + 1) + 8 * i) copy];
        uint64_t v10 = [(ISSymbolIcon *)self _specUpdatedDescriptorForDescriptor:v9];

        v11 = [(ISImageCache *)self->_imageCache imageForDescriptor:v10];
        double v12 = v11;
        if (!v11
          || (([v11 size], v14 = v13, double v16 = v15, objc_msgSend(v10, "size"), v14 == v18)
            ? (BOOL v19 = v16 == v17)
            : (BOOL v19 = 0),
              !v19))
        {
          uint64_t v20 = [(ISSymbolIcon *)self _generateImageWithDescriptor:v10];

          [(ISImageCache *)self->_imageCache setImage:v20 forDescriptor:v10];
          double v12 = (void *)v20;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }
}

- (id)imageForImageDescriptor:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[a3 copy];
  uint64_t v5 = [(ISSymbolIcon *)self _specUpdatedDescriptorForDescriptor:v4];

  uint64_t v6 = [(ISImageCache *)self->_imageCache imageForDescriptor:v5];
  uint64_t v7 = v6;
  if (!v6
    || (([v6 size], double v9 = v8, v11 = v10, objc_msgSend(v5, "size"), v9 == v13)
      ? (BOOL v14 = v11 == v12)
      : (BOOL v14 = 0),
        !v14))
  {
    v18[0] = v5;
    double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [(ISIcon *)self prepareImagesForImageDescriptors:v15];

    uint64_t v16 = [(ISImageCache *)self->_imageCache imageForDescriptor:v5];

    uint64_t v7 = (void *)v16;
  }

  return v7;
}

- (void)getImageForImageDescriptor:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v7 = (void (**)(id, void *))a4;
  id v8 = a3;
  double v9 = [v6 arrayWithObjects:&v11 count:1];
  -[ISIcon prepareImagesForImageDescriptors:](self, "prepareImagesForImageDescriptors:", v9, v11, v12);

  double v10 = [(ISSymbolIcon *)self imageForImageDescriptor:v8];

  v7[2](v7, v10);
}

- (id)description
{
  id v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)ISSymbolIcon;
  id v4 = [(ISSymbolIcon *)&v10 description];
  uint64_t v5 = [(ISSymbolIcon *)self symbolName];
  uint64_t v6 = [(ISSymbolIcon *)self config];
  uint64_t v7 = [(ISSymbolIcon *)self config];
  id v8 = [v3 stringWithFormat:@"%@ Symbol name: %@ Config: %d - %@", v4, v5, v6 != 0, v7];

  return v8;
}

- (NSString)symbolName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (ISGraphicIconConfiguration)config
{
  return self->_config;
}

- (ISGraphicSymbolDescriptor)graphicSymbolDescriptor
{
  return (ISGraphicSymbolDescriptor *)objc_getProperty(self, a2, 40, 1);
}

- (ISImageCache)imageCache
{
  return (ISImageCache *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_graphicSymbolDescriptor, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end