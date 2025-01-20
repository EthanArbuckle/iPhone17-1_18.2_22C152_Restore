@interface CPImageSetAssetRegistration
- (CPImageSetAssetRegistration)initWithLightImage:(id)a3 darkImage:(id)a4 baseTraitCollection:(id)a5;
- (UIImage)combinedImage;
- (UITraitCollection)baseTraitCollection;
- (UITraitCollection)darkTraitCollection;
- (UITraitCollection)lightTraitCollection;
- (void)dealloc;
@end

@implementation CPImageSetAssetRegistration

- (CPImageSetAssetRegistration)initWithLightImage:(id)a3 darkImage:(id)a4 baseTraitCollection:(id)a5
{
  v30[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CPImageSetAssetRegistration;
  v11 = [(CPImageSetAssetRegistration *)&v28 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_baseTraitCollection, a5);
    v13 = (void *)MEMORY[0x263F1CB00];
    v30[0] = v10;
    v14 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
    v30[1] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
    uint64_t v16 = [v13 traitCollectionWithTraitsFromCollections:v15];
    lightTraitCollection = v12->_lightTraitCollection;
    v12->_lightTraitCollection = (UITraitCollection *)v16;

    v18 = (void *)MEMORY[0x263F1CB00];
    v29[0] = v10;
    v19 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
    v29[1] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
    uint64_t v21 = [v18 traitCollectionWithTraitsFromCollections:v20];
    darkTraitCollection = v12->_darkTraitCollection;
    v12->_darkTraitCollection = (UITraitCollection *)v21;

    id v23 = objc_alloc_init(MEMORY[0x263F1C6B8]);
    v24 = v23;
    if (v8) {
      [v23 registerImage:v8 withTraitCollection:v12->_lightTraitCollection];
    }
    if (v9) {
      [v24 registerImage:v9 withTraitCollection:v12->_darkTraitCollection];
    }
    uint64_t v25 = [v24 imageWithTraitCollection:v10];
    combinedImage = v12->_combinedImage;
    v12->_combinedImage = (UIImage *)v25;
  }
  return v12;
}

- (void)dealloc
{
  v3 = [(CPImageSetAssetRegistration *)self combinedImage];
  v4 = [v3 imageAsset];
  v5 = [(CPImageSetAssetRegistration *)self lightTraitCollection];
  [v4 unregisterImageWithTraitCollection:v5];

  v6 = [(CPImageSetAssetRegistration *)self combinedImage];
  v7 = [v6 imageAsset];
  id v8 = [(CPImageSetAssetRegistration *)self darkTraitCollection];
  [v7 unregisterImageWithTraitCollection:v8];

  v9.receiver = self;
  v9.super_class = (Class)CPImageSetAssetRegistration;
  [(CPImageSetAssetRegistration *)&v9 dealloc];
}

- (UITraitCollection)baseTraitCollection
{
  return self->_baseTraitCollection;
}

- (UITraitCollection)lightTraitCollection
{
  return self->_lightTraitCollection;
}

- (UITraitCollection)darkTraitCollection
{
  return self->_darkTraitCollection;
}

- (UIImage)combinedImage
{
  return self->_combinedImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedImage, 0);
  objc_storeStrong((id *)&self->_darkTraitCollection, 0);
  objc_storeStrong((id *)&self->_lightTraitCollection, 0);

  objc_storeStrong((id *)&self->_baseTraitCollection, 0);
}

@end