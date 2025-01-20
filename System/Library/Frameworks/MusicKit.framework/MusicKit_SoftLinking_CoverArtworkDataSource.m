@interface MusicKit_SoftLinking_CoverArtworkDataSource
+ (MusicKit_SoftLinking_CoverArtworkDataSource)sharedDataSource;
+ (id)_bundle;
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (MusicKit_SoftLinking_CoverArtworkDataSource)init;
- (double)roundValueFor:(double)a3 toScale:(double)a4;
- (id)_cacheIdentifierForCoverArtworkRecipeToken:(id)a3 withSize:(CGSize)a4;
- (id)_coverArtworkImageWithSize:(CGSize)a3 destinationScale:(double)a4 coverArtworkToken:(id)a5;
- (id)_errorWithDescription:(id)a3;
- (id)_generateAngularGradientImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6;
- (id)_generateGradientArchesImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6;
- (id)_generateGradientSoundwaveImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6;
- (id)_generateGradientVinylImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6;
- (id)_generateLinearGradientImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6;
- (id)_generateNineDotGradientImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6;
- (id)_generateRadialGradientImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6;
- (id)_generateSimpleGradientImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)imageForCoverArtworkRecipe:(id)a3;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4;
@end

@implementation MusicKit_SoftLinking_CoverArtworkDataSource

+ (MusicKit_SoftLinking_CoverArtworkDataSource)sharedDataSource
{
  if (sharedDataSource_sOnceToken != -1) {
    dispatch_once(&sharedDataSource_sOnceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedDataSource_sSharedDataSource;

  return (MusicKit_SoftLinking_CoverArtworkDataSource *)v2;
}

- (MusicKit_SoftLinking_CoverArtworkDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)MusicKit_SoftLinking_CoverArtworkDataSource;
  v2 = [(MusicKit_SoftLinking_CoverArtworkDataSource *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    cache = v2->_cache;
    v2->_cache = v3;
  }
  return v2;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return 1;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4 = a3;
  v5 = [v4 token];
  if (v5
    && ([v4 fittingSize],
        -[MusicKit_SoftLinking_CoverArtworkDataSource _cacheIdentifierForCoverArtworkRecipeToken:withSize:](self, "_cacheIdentifierForCoverArtworkRecipeToken:withSize:", v5), (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    v8 = [(NSCache *)self->_cache objectForKey:v6];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  v8 = [v6 token];
  if (v8)
  {
    [v6 fittingSize];
    double v10 = v9;
    double v12 = v11;
    [v6 destinationScale];
    v14 = -[MusicKit_SoftLinking_CoverArtworkDataSource _coverArtworkImageWithSize:destinationScale:coverArtworkToken:](self, "_coverArtworkImageWithSize:destinationScale:coverArtworkToken:", v8, v10, v12, v13);
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v15 = (void *)getMPArtworkRepresentationClass_softClass;
    uint64_t v27 = getMPArtworkRepresentationClass_softClass;
    if (!getMPArtworkRepresentationClass_softClass)
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __getMPArtworkRepresentationClass_block_invoke;
      v23[3] = &unk_26443F950;
      v23[4] = &v24;
      __getMPArtworkRepresentationClass_block_invoke((uint64_t)v23);
      v15 = (void *)v25[3];
    }
    id v16 = v15;
    _Block_object_dispose(&v24, 8);
    v17 = objc_msgSend(v16, "representationForVisualIdentity:withSize:image:", v8, v14, v10, v12);
    v18 = -[MusicKit_SoftLinking_CoverArtworkDataSource _cacheIdentifierForCoverArtworkRecipeToken:withSize:](self, "_cacheIdentifierForCoverArtworkRecipeToken:withSize:", v8, v10, v12);
    if (v18) {
      [(NSCache *)self->_cache setObject:v17 forKey:v18];
    }
    v7[2](v7, v17, 0);
  }
  else
  {
    v19 = NSString;
    v20 = [v6 token];
    v21 = [v19 stringWithFormat:@"MPArtworkCatalog token can not be converted to MusicKit_SoftLinking_CoverArtworkToken: %@", v20];
    v22 = [(MusicKit_SoftLinking_CoverArtworkDataSource *)self _errorWithDescription:v21];

    ((void (**)(id, void *, void *))v7)[2](v7, 0, v22);
  }
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  return (id)[a3 token];
}

- (id)_cacheIdentifierForCoverArtworkRecipeToken:(id)a3 withSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v6 = [a3 stringRepresentation];
  if (v6)
  {
    v7 = [NSString stringWithFormat:@"%@, width: %f, height: %f", v6, *(void *)&width, *(void *)&height];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_coverArtworkImageWithSize:(CGSize)a3 destinationScale:(double)a4 coverArtworkToken:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  double v10 = [v9 playlistName];
  double v11 = [getUIGraphicsImageRendererFormatClass() preferredFormat];
  [v11 setScale:a4];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2050000000;
  double v12 = (void *)getEMFStringUtilitiesClass_softClass;
  uint64_t v42 = getEMFStringUtilitiesClass_softClass;
  if (!getEMFStringUtilitiesClass_softClass)
  {
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __getEMFStringUtilitiesClass_block_invoke;
    v38[3] = &unk_26443F950;
    v38[4] = &v39;
    __getEMFStringUtilitiesClass_block_invoke((uint64_t)v38);
    double v12 = (void *)v40[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v39, 8);
  int v14 = [v10 _containsEmoji];
  if (width >= 270.0) {
    double v15 = width;
  }
  else {
    double v15 = 270.0;
  }
  if (v14) {
    double v16 = height;
  }
  else {
    double v16 = v15;
  }
  if (v14) {
    double v17 = width;
  }
  else {
    double v17 = v15;
  }
  v18 = objc_msgSend(objc_alloc((Class)getUIGraphicsImageRendererClass()), "initWithSize:format:", v11, v17, v16);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __109__MusicKit_SoftLinking_CoverArtworkDataSource__coverArtworkImageWithSize_destinationScale_coverArtworkToken___block_invoke;
  v31[3] = &unk_26443FA90;
  double v35 = v17;
  double v36 = v16;
  v31[4] = self;
  id v19 = v9;
  id v32 = v19;
  id v20 = v10;
  id v33 = v20;
  double v37 = 270.0 / v17;
  id v21 = v11;
  id v34 = v21;
  v22 = [v18 imageWithActions:v31];
  if (v17 != width || v16 != height)
  {
    uint64_t v24 = objc_msgSend(objc_alloc((Class)getUIGraphicsImageRendererClass()), "initWithSize:format:", v21, width, height);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __109__MusicKit_SoftLinking_CoverArtworkDataSource__coverArtworkImageWithSize_destinationScale_coverArtworkToken___block_invoke_2;
    v27[3] = &unk_26443FAB8;
    id v28 = v22;
    double v29 = width;
    double v30 = height;
    id v25 = v22;
    v22 = [v24 imageWithActions:v27];
  }

  return v22;
}

- (double)roundValueFor:(double)a3 toScale:(double)a4
{
  BOOL v4 = 0;
  if (a4 != 0.0)
  {
    double v5 = fabs(a4);
    BOOL v4 = v5 != INFINITY;
    if (v5 > fmax(v5 * 0.0000000149011612, 0.0)) {
      BOOL v4 = 0;
    }
  }
  if (a4 < 0.0) {
    BOOL v4 = 1;
  }
  double v6 = 1.0;
  if (!v4) {
    double v6 = a4;
  }
  return round(a3 * a4) / v6;
}

- (id)_errorWithDescription:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = *MEMORY[0x263F07F80];
  v9[0] = a3;
  v3 = NSDictionary;
  id v4 = a3;
  double v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  double v6 = [MEMORY[0x263F087E8] errorWithDomain:@"MusicKit_SoftLinking_CoverArtworkRecipeError" code:0 userInfo:v5];

  return v6;
}

- (id)imageForCoverArtworkRecipe:(id)a3
{
  id v4 = a3;
  double v5 = [v4 version];
  int v6 = [v5 isEqual:@"1.0"];

  if (!v6) {
    goto LABEL_8;
  }
  uint64_t v7 = [v4 backgroundColor];
  if (!v7) {
    goto LABEL_8;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = [v4 primaryColor];
  if (v9)
  {
    double v10 = (void *)v9;
    uint64_t v11 = [v4 secondaryColor];
    if (!v11)
    {
LABEL_10:
      double v16 = 0;
LABEL_19:

      goto LABEL_20;
    }
    double v12 = (void *)v11;
    id v13 = [v4 tertiaryColor];

    if (v13)
    {
      uint64_t v8 = [getUIGraphicsImageRendererFormatClass() preferredFormat];
      double v10 = objc_msgSend(objc_alloc((Class)getUIGraphicsImageRendererClass()), "initWithSize:format:", v8, 180.0, 180.0);
      CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
      switch([v4 expression])
      {
        case 1:
          uint64_t v15 = -[MusicKit_SoftLinking_CoverArtworkDataSource _generateSimpleGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:](self, "_generateSimpleGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:", v4, v10, DeviceRGB, 180.0, 180.0);
          break;
        case 2:
          uint64_t v15 = -[MusicKit_SoftLinking_CoverArtworkDataSource _generateGradientVinylImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:](self, "_generateGradientVinylImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:", v4, v10, DeviceRGB, 180.0, 180.0);
          break;
        case 3:
          uint64_t v15 = -[MusicKit_SoftLinking_CoverArtworkDataSource _generateLinearGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:](self, "_generateLinearGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:", v4, v10, DeviceRGB, 180.0, 180.0);
          break;
        case 4:
          uint64_t v15 = -[MusicKit_SoftLinking_CoverArtworkDataSource _generateGradientSoundwaveImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:](self, "_generateGradientSoundwaveImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:", v4, v10, DeviceRGB, 180.0, 180.0);
          break;
        case 5:
          uint64_t v15 = -[MusicKit_SoftLinking_CoverArtworkDataSource _generateAngularGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:](self, "_generateAngularGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:", v4, v10, DeviceRGB, 180.0, 180.0);
          break;
        case 6:
          uint64_t v15 = -[MusicKit_SoftLinking_CoverArtworkDataSource _generateRadialGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:](self, "_generateRadialGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:", v4, v10, DeviceRGB, 180.0, 180.0);
          break;
        case 7:
          uint64_t v15 = -[MusicKit_SoftLinking_CoverArtworkDataSource _generateGradientArchesImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:](self, "_generateGradientArchesImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:", v4, v10, DeviceRGB, 180.0, 180.0);
          break;
        case 8:
          uint64_t v15 = -[MusicKit_SoftLinking_CoverArtworkDataSource _generateNineDotGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:](self, "_generateNineDotGradientImageForCoverArtworkRecipe:withImageRenderer:size:andSpace:", v4, v10, DeviceRGB, 180.0, 180.0);
          break;
        default:
          goto LABEL_10;
      }
      double v16 = (void *)v15;
      goto LABEL_19;
    }
LABEL_8:
    double v16 = 0;
    goto LABEL_21;
  }
  double v16 = 0;
LABEL_20:

LABEL_21:

  return v16;
}

- (id)_generateSimpleGradientImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v10 = a4;
  id v11 = a3;
  double v12 = [v11 backgroundColor];

  id v13 = [v11 primaryColor];

  int v14 = [v11 secondaryColor];

  uint64_t v15 = [v11 tertiaryColor];

  double v16 = 0;
  if (v12 && v13 && v14 && v15)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __129__MusicKit_SoftLinking_CoverArtworkDataSource__generateSimpleGradientImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke;
    v18[3] = &__block_descriptor_80_e40_v16__0__UIGraphicsImageRendererContext_8l;
    v18[4] = v12;
    *(CGFloat *)&v18[5] = width;
    *(CGFloat *)&v18[6] = height;
    v18[7] = v15;
    v18[8] = a6;
    v18[9] = v13;
    double v16 = [v10 imageWithActions:v18];
  }

  return v16;
}

- (id)_generateGradientVinylImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v10 = a4;
  id v11 = a3;
  double v12 = [v11 backgroundColor];

  id v13 = [v11 primaryColor];

  int v14 = [v11 secondaryColor];

  uint64_t v15 = [v11 tertiaryColor];

  double v16 = 0;
  if (v12 && v13 && v14 && v15)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __128__MusicKit_SoftLinking_CoverArtworkDataSource__generateGradientVinylImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke;
    v18[3] = &unk_26443FB28;
    id v20 = v12;
    CGFloat v21 = width;
    CGFloat v22 = height;
    v23 = v15;
    uint64_t v24 = a6;
    id v25 = v14;
    id v19 = v10;
    double v16 = [v19 imageWithActions:v18];
  }

  return v16;
}

- (id)_generateLinearGradientImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v10 = a4;
  id v11 = a3;
  double v12 = [v11 backgroundColor];

  id v13 = [v11 primaryColor];

  int v14 = [v11 secondaryColor];

  uint64_t v15 = [v11 tertiaryColor];

  double v16 = 0;
  if (v12 && v13 && v14 && v15)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __129__MusicKit_SoftLinking_CoverArtworkDataSource__generateLinearGradientImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke;
    v18[3] = &__block_descriptor_80_e40_v16__0__UIGraphicsImageRendererContext_8l;
    void v18[4] = v12;
    *(CGFloat *)&v18[5] = width;
    *(CGFloat *)&v18[6] = height;
    v18[7] = v13;
    v18[8] = v14;
    v18[9] = a6;
    double v16 = [v10 imageWithActions:v18];
  }

  return v16;
}

- (id)_generateGradientSoundwaveImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v10 = a4;
  id v11 = a3;
  double v12 = [v11 backgroundColor];

  id v13 = [v11 primaryColor];

  int v14 = [v11 secondaryColor];

  uint64_t v15 = [v11 tertiaryColor];

  double v16 = 0;
  if (v12 && v13 && v14 && v15)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __132__MusicKit_SoftLinking_CoverArtworkDataSource__generateGradientSoundwaveImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke;
    v18[3] = &__block_descriptor_80_e40_v16__0__UIGraphicsImageRendererContext_8l;
    void v18[4] = v15;
    *(CGFloat *)&v18[5] = width;
    *(CGFloat *)&v18[6] = height;
    v18[7] = v12;
    v18[8] = v13;
    v18[9] = a6;
    double v16 = [v10 imageWithActions:v18];
  }

  return v16;
}

- (id)_generateAngularGradientImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v10 = a4;
  id v11 = a3;
  double v12 = [v11 backgroundColor];

  id v13 = [v11 primaryColor];

  int v14 = [v11 secondaryColor];

  uint64_t v15 = [v11 tertiaryColor];

  double v16 = 0;
  if (v12 && v13 && v14 && v15)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __130__MusicKit_SoftLinking_CoverArtworkDataSource__generateAngularGradientImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke;
    v18[3] = &__block_descriptor_80_e40_v16__0__UIGraphicsImageRendererContext_8l;
    void v18[4] = v12;
    v18[5] = v14;
    v18[6] = v15;
    v18[7] = a6;
    *(CGFloat *)&v18[8] = width;
    *(CGFloat *)&v18[9] = height;
    double v16 = [v10 imageWithActions:v18];
  }

  return v16;
}

- (id)_generateRadialGradientImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v10 = a4;
  id v11 = a3;
  double v12 = [v11 backgroundColor];

  id v13 = [v11 primaryColor];

  int v14 = [v11 secondaryColor];

  uint64_t v15 = [v11 tertiaryColor];

  double v16 = 0;
  if (v12 && v13 && v14 && v15)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __129__MusicKit_SoftLinking_CoverArtworkDataSource__generateRadialGradientImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke;
    v18[3] = &__block_descriptor_80_e40_v16__0__UIGraphicsImageRendererContext_8l;
    void v18[4] = v15;
    v18[5] = v12;
    v18[6] = v13;
    v18[7] = a6;
    *(CGFloat *)&v18[8] = width;
    *(CGFloat *)&v18[9] = height;
    double v16 = [v10 imageWithActions:v18];
  }

  return v16;
}

- (id)_generateGradientArchesImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v12 backgroundColor];

  int v14 = [v12 primaryColor];

  uint64_t v15 = [v12 secondaryColor];

  double v16 = [v12 tertiaryColor];

  double v17 = 0;
  if (v13 && v14 && v15 && v16)
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __129__MusicKit_SoftLinking_CoverArtworkDataSource__generateGradientArchesImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke;
    v33[3] = &unk_26443FB50;
    v33[5] = 0;
    v33[6] = 0;
    v33[4] = self;
    *(CGFloat *)&v33[7] = width;
    *(CGFloat *)&v33[8] = height;
    v18 = [v11 imageWithActions:v33];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __129__MusicKit_SoftLinking_CoverArtworkDataSource__generateGradientArchesImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke_2;
    v21[3] = &unk_26443FB00;
    uint64_t v24 = v14;
    id v25 = v16;
    uint64_t v26 = a6;
    CGFloat v27 = width;
    CGFloat v28 = height;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    CGFloat v31 = width;
    CGFloat v32 = height;
    id v22 = v18;
    v23 = v13;
    id v19 = v18;
    double v17 = [v11 imageWithActions:v21];
  }

  return v17;
}

- (id)_generateNineDotGradientImageForCoverArtworkRecipe:(id)a3 withImageRenderer:(id)a4 size:(CGSize)a5 andSpace:(CGColorSpace *)a6
{
  double height = a5.height;
  double width = a5.width;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v11 backgroundColor];

  id v13 = [v11 primaryColor];

  int v14 = [v11 secondaryColor];

  uint64_t v15 = [v11 tertiaryColor];

  double v16 = 0;
  if (v12 && v13 && v14 && v15)
  {
    double v17 = [getUIColorClass() colorWithCGColor:v15];
    id v18 = objc_alloc((Class)getUIGraphicsImageRendererClass());
    id v19 = [v10 format];
    id v20 = objc_msgSend(v18, "initWithSize:format:", v19, width * 1.1, height * 1.1);

    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __130__MusicKit_SoftLinking_CoverArtworkDataSource__generateNineDotGradientImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke;
    v53[3] = &unk_26443FB28;
    v55 = v12;
    double v56 = width * 1.1;
    double v57 = height * 1.1;
    v58 = v14;
    id v21 = v17;
    id v54 = v21;
    v59 = v15;
    v60 = a6;
    id v22 = [v20 imageWithActions:v53];
    [v22 scale];
    CGFloat v24 = width * v23;
    [v22 scale];
    CGFloat v26 = height * v25;
    CGFloat v27 = height * v25 * 0.05;
    id v28 = v22;
    uint64_t v29 = (CGImage *)[v28 CGImage];
    v62.origin.x = v24 * 0.05;
    v62.origin.y = v27;
    v62.size.double width = v24;
    v62.size.double height = v26;
    CGImageRef v30 = CGImageCreateWithImageInRect(v29, v62);
    v38 = objc_msgSend(objc_alloc((Class)getUIImageClass((uint64_t)v30, v31, v32, v33, v34, v35, v36, v37)), "initWithCGImage:", v30);

    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __130__MusicKit_SoftLinking_CoverArtworkDataSource__generateNineDotGradientImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke_2;
    v52[3] = &__block_descriptor_48_e40_v16__0__UIGraphicsImageRendererContext_8l;
    *(double *)&v52[4] = width;
    *(double *)&v52[5] = height;
    uint64_t v39 = [v10 imageWithActions:v52];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __130__MusicKit_SoftLinking_CoverArtworkDataSource__generateNineDotGradientImageForCoverArtworkRecipe_withImageRenderer_size_andSpace___block_invoke_3;
    v44[3] = &unk_26443FB98;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    double v50 = width;
    double v51 = height;
    id v45 = v21;
    id v46 = v39;
    id v47 = v38;
    id v40 = v38;
    id v41 = v39;
    id v42 = v21;
    double v16 = [v10 imageWithActions:v44];
  }

  return v16;
}

+ (id)_bundle
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__MusicKit_SoftLinking_CoverArtworkDataSource__bundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bundle_sOnceToken != -1) {
    dispatch_once(&_bundle_sOnceToken, block);
  }
  v2 = (void *)_bundle_sBundle;

  return v2;
}

- (void).cxx_destruct
{
}

@end