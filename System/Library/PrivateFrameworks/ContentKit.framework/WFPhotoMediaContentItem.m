@interface WFPhotoMediaContentItem
+ (BOOL)hasLibrary;
+ (BOOL)isAvailableOnPlatform:(int64_t)a3;
+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)fetchOptionsForLibrary:(int64_t)a3;
+ (id)itemWithAssetIdentifier:(id)a3;
+ (id)itemWithAssetIdentifier:(id)a3 assetFile:(id)a4;
+ (id)itemWithAssetIdentifier:(id)a3 library:(int64_t)a4;
+ (id)itemWithAssetIdentifier:(id)a3 library:(int64_t)a4 assetFile:(id)a5;
+ (id)itemWithAssetIdentifier:(id)a3 library:(int64_t)a4 assetFile:(id)a5 nameIfKnown:(id)a6;
+ (id)itemWithAssetIdentifier:(id)a3 library:(int64_t)a4 assetFile:(id)a5 nameIfKnown:(id)a6 attributionSet:(id)a7 cachingIdentifier:(id)a8;
+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7;
+ (id)itemsWithBurstIdentifier:(id)a3;
+ (id)localizedFilterDescriptionWithContext:(id)a3;
+ (id)localizedPluralFilterDescriptionWithContext:(id)a3;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedPasteboardTypes;
+ (id)ownedTypes;
+ (id)photoAlbums;
+ (id)propertyBuilders;
+ (id)remoteItemWithAssetIdentifier:(id)a3 named:(id)a4;
+ (id)stringConversionBehavior;
+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6;
- (BOOL)canGenerateRepresentationForType:(id)a3;
- (BOOL)getListAltText:(id)a3;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPhotoType:(id)a3;
- (BOOL)isScreenRecording;
- (BOOL)isScreenshot;
- (BOOL)loadsListThumbnailAsynchronously;
- (CGSize)size;
- (NSDictionary)additionalRepresentationsForSerialization;
- (PHAsset)asset;
- (WFFileType)preferredFileType;
- (id)assetRepresentationTypes;
- (id)assetResourceManager;
- (id)defaultSourceForRepresentation:(id)a3;
- (id)duration;
- (id)fullSizeAssetResourcesInResources:(id)a3;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)height;
- (id)imageManager;
- (id)intermediaryTypesForCoercionToItemClass:(Class)a3;
- (id)isBurst;
- (id)isFavorite;
- (id)isHidden;
- (id)isLivePhoto;
- (id)location;
- (id)make;
- (id)mediaType;
- (id)metadataIfLocallyAvailable;
- (id)model;
- (id)orientation;
- (id)outputTypes;
- (id)photoTypes;
- (id)preferredAssetResourceForType:(id)a3;
- (id)width;
- (int64_t)library;
- (unint64_t)hash;
- (void)copyStateToItem:(id)a3;
- (void)generateAVAsset:(id)a3 networkAccessAllowed:(BOOL)a4;
- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5;
- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5;
- (void)getFrameRate:(id)a3;
- (void)getMetadata:(id)a3;
- (void)getPreferredFileExtension:(id)a3;
- (void)getPreferredFileSize:(id)a3;
- (void)getThumbnail:(id)a3 ofSize:(CGSize)a4;
- (void)retrieveAssetResource:(id)a3 withNetworkAccess:(BOOL)a4 completionHandler:(id)a5;
- (void)retrieveFileWithImageManager:(id)a3 forType:(id)a4;
- (void)setLibrary:(int64_t)a3;
@end

@implementation WFPhotoMediaContentItem

- (void).cxx_destruct
{
}

- (void)setLibrary:(int64_t)a3
{
  self->_library = a3;
}

- (int64_t)library
{
  return self->_library;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F0F988]);
  v5 = (void *)[v4 initWithBundleIdentifier:*MEMORY[0x263F85558]];
  v6 = [MEMORY[0x263F0F9B0] sharedResolver];
  v7 = [v6 resolvedAppMatchingDescriptor:v5];

  v8 = [(WFContentItem *)self cachingIdentifier];
  v9 = +[WFContentAttributionSet attributionSetWithAppDescriptor:v7 disclosureLevel:1 originalItemIdentifier:v8];

  return v9;
}

- (id)outputTypes
{
  v3 = (void *)MEMORY[0x263F852B8];
  id v4 = [(WFPhotoMediaContentItem *)self assetRepresentationTypes];
  v5 = [v3 typesFromStrings:v4];

  v6 = (void *)[objc_alloc(MEMORY[0x263EFF9B0]) initWithArray:v5];
  v10.receiver = self;
  v10.super_class = (Class)WFPhotoMediaContentItem;
  v7 = [(WFContentItem *)&v10 outputTypes];
  [v6 unionOrderedSet:v7];

  preferredFileType = self->_preferredFileType;
  if (preferredFileType) {
    [v6 insertObject:preferredFileType atIndex:0];
  }

  return v6;
}

- (id)intermediaryTypesForCoercionToItemClass:(Class)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFPhotoMediaContentItem;
  id v4 = -[WFContentItem intermediaryTypesForCoercionToItemClass:](&v10, sel_intermediaryTypesForCoercionToItemClass_);
  v5 = +[WFObjectType typeWithClassName:@"AVAsset" frameworkName:@"AVFoundation" location:0];
  if ([v4 containsObject:v5] && (Class)objc_opt_class() == a3)
  {
    v6 = (void *)[v4 mutableCopy];
    uint64_t v8 = [v6 indexOfObject:v5];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = [MEMORY[0x263F088D0] indexSetWithIndex:v8];
      [v6 moveObjectsAtIndexes:v9 toIndex:0];
    }
  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (WFFileType)preferredFileType
{
  preferredFileType = self->_preferredFileType;
  if (preferredFileType)
  {
    v3 = preferredFileType;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WFPhotoMediaContentItem;
    v3 = [(WFContentItem *)&v5 preferredFileType];
  }
  return v3;
}

- (id)assetRepresentationTypes
{
  v11[1] = *MEMORY[0x263EF8340];
  id PHAssetResourceClass = getPHAssetResourceClass();
  id v4 = [(WFPhotoMediaContentItem *)self asset];
  objc_super v5 = [PHAssetResourceClass assetResourcesForAsset:v4];

  if ([v5 count]
    || ([(WFPhotoMediaContentItem *)self asset],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v8 uniformTypeIdentifier],
        v6 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v6))
  {
    v6 = [(WFPhotoMediaContentItem *)self fullSizeAssetResourcesInResources:v5];
    uint64_t v7 = objc_msgSend(v6, "if_compactMap:", &__block_literal_global_372);
  }
  else
  {
    v11[0] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  }
  v9 = (void *)v7;

  return v9;
}

uint64_t __51__WFPhotoMediaContentItem_assetRepresentationTypes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniformTypeIdentifier];
}

- (id)fullSizeAssetResourcesInResources:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_msgSend(v4, "if_objectsPassingTest:", &__block_literal_global_366);
  if ([v5 count]) {
    v6 = v5;
  }
  else {
    v6 = v4;
  }
  id v7 = v6;

  uint64_t v8 = [(WFPhotoMediaContentItem *)self isLivePhoto];
  int v9 = [v8 BOOLValue];

  if (v9)
  {
    uint64_t v10 = [v7 sortedArrayUsingComparator:&__block_literal_global_369];

    id v7 = (id)v10;
  }

  return v7;
}

uint64_t __61__WFPhotoMediaContentItem_fullSizeAssetResourcesInResources___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 type];
  uint64_t v6 = [v4 type];

  BOOL v7 = (v6 & 0xFFFFFFFFFFFFFFFBLL) != 1 || (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  BOOL v8 = !v7;
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 && (v6 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return -1;
  }
  else {
    return v8;
  }
}

BOOL __61__WFPhotoMediaContentItem_fullSizeAssetResourcesInResources___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 type];
  return v2 == 10 || (unint64_t)(v2 - 5) < 2;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  BOOL v7 = [v6 string];

  LODWORD(v6) = [v7 isEqualToString:@"AVAsset"];
  if (!v6)
  {
    id v15 = v4;
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v16 = v15;
      }
      else {
        v16 = 0;
      }
    }
    else
    {
      v16 = 0;
    }
    id v17 = v16;

    v18 = [v17 string];
    if ([v18 isEqualToString:@"PHLivePhoto"])
    {
    }
    else
    {
      v19 = WFLivePhotoFileType();
      int v20 = [v15 conformsToUTType:v19];

      if (!v20)
      {
        id v23 = v15;
        if (v4)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v24 = v23;
          }
          else {
            v24 = 0;
          }
        }
        else
        {
          v24 = 0;
        }
        id v25 = v24;

        v26 = [v25 string];

        LODWORD(v25) = [v26 isEqualToString:@"CLLocation"];
        if (v25)
        {
          v27 = [(WFPhotoMediaContentItem *)self location];
          unsigned __int8 v14 = v27 != 0;

          goto LABEL_18;
        }
        if (![v23 isEqualToClass:objc_opt_class()])
        {
          v29.receiver = self;
          v29.super_class = (Class)WFPhotoMediaContentItem;
          unsigned __int8 v14 = [(WFGenericFileContentItem *)&v29 canGenerateRepresentationForType:v23];
          goto LABEL_18;
        }
        v21 = [(WFPhotoMediaContentItem *)self asset];
        v28 = [v21 creationDate];
        unsigned __int8 v14 = v28 != 0;

        goto LABEL_17;
      }
    }
    v21 = [(WFPhotoMediaContentItem *)self isLivePhoto];
    unsigned __int8 v14 = [v21 BOOLValue];
LABEL_17:

    goto LABEL_18;
  }
  BOOL v8 = (void *)MEMORY[0x263EFFA08];
  int v9 = [(WFPhotoMediaContentItem *)self assetRepresentationTypes];
  uint64_t v10 = [v8 setWithArray:v9];
  v11 = (void *)MEMORY[0x263EFFA08];
  v12 = [getAVURLAssetClass() audiovisualTypes];
  v13 = [v11 setWithArray:v12];
  unsigned __int8 v14 = [v10 intersectsSet:v13];

LABEL_18:
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFPhotoMediaContentItem *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(WFPhotoMediaContentItem *)self asset];
      id v6 = [(WFPhotoMediaContentItem *)v4 asset];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2 = [(WFPhotoMediaContentItem *)self asset];
  unint64_t v3 = [v2 hash] ^ 0xC842;

  return v3;
}

- (void)copyStateToItem:(id)a3
{
  objc_storeStrong((id *)a3 + 6, self->_preferredFileType);
  uint64_t v5 = a3;
  v5[7] = self->_library;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a4;
  BOOL v8 = NSStringFromClass(a3);
  int v9 = [@"CLLocation" isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = [(WFPhotoMediaContentItem *)self location];
    v11 = +[WFObjectRepresentation object:v10];
LABEL_7:

    goto LABEL_8;
  }
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v10 = [(WFPhotoMediaContentItem *)self asset];
    v12 = [v10 creationDate];
    v11 = +[WFObjectRepresentation object:v12];

    goto LABEL_7;
  }
  if ((Class)objc_opt_class() == a3)
  {
    unsigned __int8 v14 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(WFPhotoMediaContentItem *)self asset];
      v16 = [v15 localIdentifier];
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WFPhotoMediaContentItem generateObjectRepresentationForClass:options:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_216505000, v14, OS_LOG_TYPE_DEFAULT, "%s Creating LNEntity for asset: %@", buf, 0x16u);
    }
    id v17 = objc_alloc(MEMORY[0x263F51F98]);
    v18 = (void *)[v17 initWithBundleIdentifier:*MEMORY[0x263F85558]];
    id v19 = objc_alloc(MEMORY[0x263F52108]);
    int v20 = [(WFPhotoMediaContentItem *)self asset];
    v21 = [v20 localIdentifier];
    v22 = (void *)[v19 initWithString:v21 entityType:@"LinkAsset"];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v33 = __Block_byref_object_copy_;
    v34 = __Block_byref_object_dispose_;
    id v35 = 0;
    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __78__WFPhotoMediaContentItem_generateObjectRepresentationForClass_options_error___block_invoke;
    objc_super v29 = &unk_2642890B8;
    v31 = buf;
    v24 = v23;
    v30 = v24;
    [v18 performQuery:v22 completionHandler:&v26];
    dispatch_time_t v25 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v24, v25);
    v11 = +[WFObjectRepresentation object:](WFObjectRepresentation, "object:", *(void *)(*(void *)&buf[8] + 40), v26, v27, v28, v29);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v11 = 0;
  }
LABEL_8:

  return v11;
}

void __78__WFPhotoMediaContentItem_generateObjectRepresentationForClass_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [v5 value];
    int v9 = [v8 value];
    int v20 = 136315650;
    v21 = "-[WFPhotoMediaContentItem generateObjectRepresentationForClass:options:error:]_block_invoke";
    __int16 v22 = 2112;
    dispatch_semaphore_t v23 = v9;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl(&dword_216505000, v7, OS_LOG_TYPE_DEFAULT, "%s Recieved output: %@ error: %@", (uint8_t *)&v20, 0x20u);
  }
  uint64_t v10 = [v5 value];
  v11 = [v10 value];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  unsigned __int8 v14 = [v13 firstObject];

  id v15 = [v14 value];

  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  id v17 = v16;

  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[WFPhotoMediaContentItem generateObjectRepresentation:options:forClass:]";
    _os_log_impl(&dword_216505000, v10, OS_LOG_TYPE_DEFAULT, "%s Calling old generate method", (uint8_t *)&buf, 0xCu);
  }

  if ((Class)objc_opt_class() == a5)
  {
    id v13 = objc_alloc_init((Class)getPHImageRequestOptionsClass());
    [v13 setNetworkAccessAllowed:1];
    [v13 setDeliveryMode:1];
    unsigned __int8 v14 = [(WFPhotoMediaContentItem *)self imageManager];
    id v15 = [(WFPhotoMediaContentItem *)self asset];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __73__WFPhotoMediaContentItem_generateObjectRepresentation_options_forClass___block_invoke;
    v40[3] = &unk_264285BD8;
    v40[4] = self;
    id v41 = v8;
    [v14 requestImageDataAndOrientationForAsset:v15 options:v13 resultHandler:v40];
  }
  else
  {
    v11 = NSStringFromClass(a5);
    int v12 = [@"AVAsset" isEqualToString:v11];

    if (v12)
    {
      [(WFPhotoMediaContentItem *)self generateAVAsset:v8 networkAccessAllowed:1];
    }
    else
    {
      v16 = NSStringFromClass(a5);
      int v17 = [@"AVPlayerItem" isEqualToString:v16];

      if (v17)
      {
        id v18 = objc_alloc_init((Class)getPHVideoRequestOptionsClass());
        [v18 setNetworkAccessAllowed:1];
        [v18 setDeliveryMode:1];
        id v19 = [(WFPhotoMediaContentItem *)self imageManager];
        int v20 = [(WFPhotoMediaContentItem *)self asset];
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __73__WFPhotoMediaContentItem_generateObjectRepresentation_options_forClass___block_invoke_2;
        v38[3] = &unk_264285C00;
        v38[4] = self;
        id v39 = v8;
        [v19 requestPlayerItemForVideo:v20 options:v18 resultHandler:v38];
      }
      else
      {
        v21 = NSStringFromClass(a5);
        int v22 = [@"PHLivePhoto" isEqualToString:v21];

        if (v22)
        {
          uint64_t v42 = 0;
          v43 = &v42;
          uint64_t v44 = 0x2050000000;
          dispatch_semaphore_t v23 = (void *)getPHLivePhotoRequestOptionsClass_softClass;
          uint64_t v45 = getPHLivePhotoRequestOptionsClass_softClass;
          if (!getPHLivePhotoRequestOptionsClass_softClass)
          {
            *(void *)&long long buf = MEMORY[0x263EF8330];
            *((void *)&buf + 1) = 3221225472;
            v47 = __getPHLivePhotoRequestOptionsClass_block_invoke;
            v48 = &unk_26428AC60;
            v49 = &v42;
            __getPHLivePhotoRequestOptionsClass_block_invoke((uint64_t)&buf);
            dispatch_semaphore_t v23 = (void *)v43[3];
          }
          __int16 v24 = v23;
          _Block_object_dispose(&v42, 8);
          id v25 = objc_alloc_init(v24);
          [v25 setNetworkAccessAllowed:1];
          [v25 setDeliveryMode:1];
          uint64_t v26 = [(WFPhotoMediaContentItem *)self imageManager];
          uint64_t v27 = [(WFPhotoMediaContentItem *)self asset];
          uint64_t v42 = 0;
          v43 = &v42;
          uint64_t v44 = 0x2020000000;
          v28 = (double *)getPHImageManagerMaximumSizeSymbolLoc_ptr;
          uint64_t v45 = getPHImageManagerMaximumSizeSymbolLoc_ptr;
          if (!getPHImageManagerMaximumSizeSymbolLoc_ptr)
          {
            *(void *)&long long buf = MEMORY[0x263EF8330];
            *((void *)&buf + 1) = 3221225472;
            v47 = __getPHImageManagerMaximumSizeSymbolLoc_block_invoke;
            v48 = &unk_26428AC60;
            v49 = &v42;
            objc_super v29 = PhotosLibrary();
            v30 = dlsym(v29, "PHImageManagerMaximumSize");
            *(void *)(v49[1] + 24) = v30;
            getPHImageManagerMaximumSizeSymbolLoc_ptr = *(void *)(v49[1] + 24);
            v28 = (double *)v43[3];
          }
          _Block_object_dispose(&v42, 8);
          if (!v28)
          {
            v34 = [MEMORY[0x263F08690] currentHandler];
            id v35 = [NSString stringWithUTF8String:"CGSize getPHImageManagerMaximumSize(void)"];
            objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"WFPhotoMediaContentItem.m", 56, @"%s", dlerror());

            __break(1u);
          }
          double v31 = *v28;
          double v32 = v28[1];
          v36[0] = MEMORY[0x263EF8330];
          v36[1] = 3221225472;
          v36[2] = __73__WFPhotoMediaContentItem_generateObjectRepresentation_options_forClass___block_invoke_3;
          v36[3] = &unk_264285C28;
          v36[4] = self;
          id v37 = v8;
          objc_msgSend(v26, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v27, 0, v25, v36, v31, v32);
        }
        else
        {
          v33 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
          (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v33);
        }
      }
    }
  }
}

void __73__WFPhotoMediaContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v16 = a2;
  id v7 = a5;
  if (v16)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F85308]) initWithData:v16 scale:0 allowAnimated:1.0];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = [*(id *)(a1 + 32) name];
    (*(void (**)(uint64_t, void *, void *, void))(v9 + 16))(v9, v8, v10, 0);
  }
  else
  {
    v11 = getPHImageErrorKey();
    id v8 = [v7 objectForKey:v11];

    if (!v8)
    {
      int v12 = [*(id *)(a1 + 32) preferredFileType];
      int v13 = [v12 conformsToUTType:*MEMORY[0x263F1D9C0]];

      if (v13)
      {
        unsigned __int8 v14 = objc_opt_class();
        id v15 = WFLocalizedString(@"a video was provided instead of an image");
        id v8 = [v14 badCoercionErrorWithReasonString:v15];
      }
      else
      {
        id v8 = 0;
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __73__WFPhotoMediaContentItem_generateObjectRepresentation_options_forClass___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v9)
  {
    id v7 = [*(id *)(a1 + 32) name];
    (*(void (**)(uint64_t, id, void *, void))(v6 + 16))(v6, v9, v7, 0);
  }
  else
  {
    id v7 = getPHImageErrorKey();
    id v8 = [v5 objectForKey:v7];
    (*(void (**)(uint64_t, void, void, void *))(v6 + 16))(v6, 0, 0, v8);
  }
}

void __73__WFPhotoMediaContentItem_generateObjectRepresentation_options_forClass___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v9)
  {
    id v7 = [*(id *)(a1 + 32) name];
    (*(void (**)(uint64_t, id, void *, void))(v6 + 16))(v6, v9, v7, 0);
  }
  else
  {
    id v7 = getPHImageErrorKey();
    id v8 = [v5 objectForKey:v7];
    (*(void (**)(uint64_t, void, void, void *))(v6 + 16))(v6, 0, 0, v8);
  }
}

- (void)generateAVAsset:(id)a3 networkAccessAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)getPHVideoRequestOptionsClass());
  [v7 setNetworkAccessAllowed:v4];
  [v7 setDeliveryMode:1];
  id v8 = [(WFPhotoMediaContentItem *)self imageManager];
  id v9 = [(WFPhotoMediaContentItem *)self asset];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __64__WFPhotoMediaContentItem_generateAVAsset_networkAccessAllowed___block_invoke;
  v11[3] = &unk_264285BB0;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v8 requestAVAssetForVideo:v9 options:v7 resultHandler:v11];
}

void __64__WFPhotoMediaContentItem_generateAVAsset_networkAccessAllowed___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a2;
  id v6 = a4;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v10)
  {
    id v8 = [*(id *)(a1 + 32) name];
    (*(void (**)(uint64_t, id, void *, void))(v7 + 16))(v7, v10, v8, 0);
  }
  else
  {
    id v8 = getPHImageErrorKey();
    id v9 = [v6 objectForKey:v8];
    (*(void (**)(uint64_t, void, void, void *))(v7 + 16))(v7, 0, 0, v9);
  }
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WFPhotoMediaContentItem *)self asset];
  if ([v11 mediaType] == 2)
  {
    int v12 = [v10 conformsToUTType:*MEMORY[0x263F1D9C0]];

    if (v12)
    {
      [(WFPhotoMediaContentItem *)self retrieveFileWithImageManager:v8 forType:v10];
      goto LABEL_13;
    }
  }
  else
  {
  }
  int v13 = WFLivePhotoFileType();
  int v14 = [v10 conformsToUTType:v13];

  if (v14)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __70__WFPhotoMediaContentItem_generateFileRepresentation_options_forType___block_invoke;
    v21[3] = &unk_264285B88;
    id v23 = v8;
    id v22 = v10;
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2050000000;
    id v15 = (void *)getPHLivePhotoClass_softClass;
    uint64_t v28 = getPHLivePhotoClass_softClass;
    if (!getPHLivePhotoClass_softClass)
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __getPHLivePhotoClass_block_invoke;
      v24[3] = &unk_26428AC60;
      v24[4] = &v25;
      __getPHLivePhotoClass_block_invoke((uint64_t)v24);
      id v15 = (void *)v26[3];
    }
    id v16 = v15;
    _Block_object_dispose(&v25, 8);
    [(WFContentItem *)self getObjectRepresentation:v21 forClass:v16];
  }
  else
  {
    int v17 = [(WFPhotoMediaContentItem *)self preferredAssetResourceForType:v10];
    if (v17)
    {
      [(WFPhotoMediaContentItem *)self retrieveAssetResource:v17 withNetworkAccess:1 completionHandler:v8];
    }
    else
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __70__WFPhotoMediaContentItem_generateFileRepresentation_options_forType___block_invoke_2;
      v18[3] = &unk_26428AAB0;
      v18[4] = self;
      id v19 = v10;
      id v20 = v8;
      [(WFPhotoMediaContentItem *)self retrieveFileWithImageManager:v18 forType:v19];
    }
  }
LABEL_13:
}

void __70__WFPhotoMediaContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    id v9 = [a2 videoComplement];
    id v10 = +[WFFileRepresentation proposedFilenameForFile:v7 ofType:*(void *)(a1 + 32)];
    v11 = +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:v10];
    id v15 = v8;
    char v12 = [v9 writeToBundleAtURL:v11 error:&v15];
    id v13 = v15;

    if (v12)
    {
      int v14 = +[WFFileRepresentation fileWithURL:v11 options:1 ofType:*(void *)(a1 + 32)];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v13 = v8;
  }
}

void __70__WFPhotoMediaContentItem_generateFileRepresentation_options_forType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6 = a2;
  uint64_t v5 = a3;
  if (!(v6 | v5))
  {
    uint64_t v5 = [(id)objc_opt_class() badCoercionErrorForType:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)preferredAssetResourceForType:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id PHAssetResourceClass = getPHAssetResourceClass();
  unint64_t v6 = [(WFPhotoMediaContentItem *)self asset];
  id v7 = [PHAssetResourceClass assetResourcesForAsset:v6];

  id obj = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int v14 = (void *)MEMORY[0x263F852B8];
        id v15 = [v13 uniformTypeIdentifier];
        id v16 = [v14 typeWithString:v15];
        int v17 = [v16 conformsToType:v4];

        if (v17)
        {
          unint64_t v18 = [v13 type] - 7;
          id v19 = v13;
          if (v18 > 0xFFFFFFFFFFFFFFFDLL)
          {

            goto LABEL_15;
          }

          id v10 = v19;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v10 = 0;
  }

  id v10 = v10;
  id v19 = v10;
LABEL_15:

  return v19;
}

- (void)retrieveFileWithImageManager:(id)a3 forType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 conformsToUTType:*MEMORY[0x263F1DB18]])
  {
    id v8 = objc_alloc_init((Class)getPHImageRequestOptionsClass());
    [v8 setNetworkAccessAllowed:1];
    [v8 setDeliveryMode:1];
    uint64_t v9 = [(WFPhotoMediaContentItem *)self imageManager];
    id v10 = [(WFPhotoMediaContentItem *)self asset];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __64__WFPhotoMediaContentItem_retrieveFileWithImageManager_forType___block_invoke;
    v16[3] = &unk_264285B38;
    id v17 = v7;
    unint64_t v18 = self;
    id v19 = v6;
    [v9 requestImageDataAndOrientationForAsset:v10 options:v8 resultHandler:v16];

LABEL_8:
    goto LABEL_9;
  }
  if (([v7 conformsToUTType:*MEMORY[0x263F1D9C0]] & 1) != 0
    || [v7 conformsToUTType:*MEMORY[0x263F1D9B8]])
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __64__WFPhotoMediaContentItem_retrieveFileWithImageManager_forType___block_invoke_2;
    v13[3] = &unk_264285B60;
    id v15 = v6;
    v13[4] = self;
    id v14 = v7;
    uint64_t v21 = 0;
    long long v22 = &v21;
    uint64_t v23 = 0x2050000000;
    uint64_t v11 = (void *)getAVAssetClass_softClass;
    uint64_t v24 = getAVAssetClass_softClass;
    if (!getAVAssetClass_softClass)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __getAVAssetClass_block_invoke;
      v20[3] = &unk_26428AC60;
      v20[4] = &v21;
      __getAVAssetClass_block_invoke((uint64_t)v20);
      uint64_t v11 = (void *)v22[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v21, 8);
    [(WFContentItem *)self getObjectRepresentation:v13 forClass:v12];

    id v8 = v15;
    goto LABEL_8;
  }
LABEL_9:
}

void __64__WFPhotoMediaContentItem_retrieveFileWithImageManager_forType___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v19 = a2;
  id v8 = a3;
  id v9 = a5;
  if (v19
    && ([MEMORY[0x263F852B8] typeWithString:v8],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 conformsToType:*(void *)(a1 + 32)],
        v10,
        (v11 & 1) != 0))
  {
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = [MEMORY[0x263F852B8] typeWithString:v8];
    id v14 = [*(id *)(a1 + 40) name];
    id v15 = +[WFFileRepresentation fileWithData:v19 ofType:v13 proposedFilename:v14];
    id v16 = getPHImageErrorKey();
    id v17 = [v9 objectForKey:v16];
    (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v15, v17);
  }
  else
  {
    uint64_t v18 = *(void *)(a1 + 48);
    id v13 = getPHImageErrorKey();
    id v14 = [v9 objectForKey:v13];
    (*(void (**)(uint64_t, void, void *))(v18 + 16))(v18, 0, v14);
  }
}

void __64__WFPhotoMediaContentItem_retrieveFileWithImageManager_forType___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v13)
  {
    getAVURLAssetClass();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v13 URL];
      uint64_t v10 = *(void *)(a1 + 48);
      char v11 = [*(id *)(a1 + 32) name];
      uint64_t v12 = +[WFFileRepresentation fileWithURL:v9 options:5 ofType:0 proposedFilename:v11];
      (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v12, 0);
    }
    else
    {
      id v9 = +[WFContentItem itemWithObject:v13];
      [v9 getFileRepresentation:*(void *)(a1 + 48) forType:*(void *)(a1 + 40)];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)retrieveAssetResource:(id)a3 withNetworkAccess:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(WFContentItem *)self name];
  char v11 = (void *)MEMORY[0x263F852B8];
  uint64_t v12 = [v8 uniformTypeIdentifier];
  id v13 = [v11 typeWithString:v12];
  id v14 = +[WFFileRepresentation proposedFilenameForFile:v10 ofType:v13];
  id v15 = +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:v14];

  uint64_t v28 = 0;
  objc_super v29 = &v28;
  uint64_t v30 = 0x2050000000;
  id v16 = (void *)getPHAssetResourceRequestOptionsClass_softClass;
  uint64_t v31 = getPHAssetResourceRequestOptionsClass_softClass;
  if (!getPHAssetResourceRequestOptionsClass_softClass)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __getPHAssetResourceRequestOptionsClass_block_invoke;
    v27[3] = &unk_26428AC60;
    v27[4] = &v28;
    __getPHAssetResourceRequestOptionsClass_block_invoke((uint64_t)v27);
    id v16 = (void *)v29[3];
  }
  id v17 = v16;
  _Block_object_dispose(&v28, 8);
  uint64_t v18 = objc_opt_new();
  [v18 setNetworkAccessAllowed:v6];
  id v19 = [(WFPhotoMediaContentItem *)self assetResourceManager];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __85__WFPhotoMediaContentItem_retrieveAssetResource_withNetworkAccess_completionHandler___block_invoke;
  v23[3] = &unk_264285B10;
  id v25 = v8;
  id v26 = v9;
  id v24 = v15;
  id v20 = v8;
  id v21 = v15;
  id v22 = v9;
  [v19 writeDataForAssetResource:v20 toFile:v21 options:v18 completionHandler:v23];
}

void __85__WFPhotoMediaContentItem_retrieveAssetResource_withNetworkAccess_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v13[2] = *MEMORY[0x263EF8340];
  if (a2)
  {
    unint64_t v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *MEMORY[0x263EFF5F8];
    v13[0] = *MEMORY[0x263EFF610];
    v13[1] = v5;
    BOOL v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
    id v7 = (id)[v4 resourceValuesForKeys:v6 error:0];

    id v8 = (void *)MEMORY[0x263F852B8];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [*(id *)(a1 + 40) uniformTypeIdentifier];
    char v11 = [v8 typeWithString:v10];
    uint64_t v12 = +[WFFileRepresentation fileWithURL:v9 options:1 ofType:v11];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)getThumbnail:(id)a3 ofSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)getPHImageRequestOptionsClass());
  [v8 setNetworkAccessAllowed:1];
  [v8 setDeliveryMode:1];
  [v8 setResizeMode:2];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__WFPhotoMediaContentItem_getThumbnail_ofSize___block_invoke;
  aBlock[3] = &unk_26428A9D8;
  aBlock[4] = self;
  id v9 = v8;
  id v20 = v9;
  id v10 = v7;
  id v21 = v10;
  char v11 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v12 = [(WFPhotoMediaContentItem *)self asset];
  int v13 = [v12 isAnimatedGIF];

  if (v13)
  {
    v11[2](v11);
  }
  else
  {
    id v14 = [(WFPhotoMediaContentItem *)self imageManager];
    id v15 = [(WFPhotoMediaContentItem *)self asset];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __47__WFPhotoMediaContentItem_getThumbnail_ofSize___block_invoke_3;
    v16[3] = &unk_264285AE8;
    id v17 = v11;
    id v18 = v10;
    objc_msgSend(v14, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v15, 1, v9, v16, width, height);
  }
}

void __47__WFPhotoMediaContentItem_getThumbnail_ofSize___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) imageManager];
  unint64_t v3 = [*(id *)(a1 + 32) asset];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__WFPhotoMediaContentItem_getThumbnail_ofSize___block_invoke_2;
  v5[3] = &unk_264285AC0;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v2 requestImageDataAndOrientationForAsset:v3 options:v4 resultHandler:v5];
}

void __47__WFPhotoMediaContentItem_getThumbnail_ofSize___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (v12)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F85308]) initWithPlatformImage:v12];
LABEL_5:
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = getPHImageErrorKey();
    char v11 = [v5 objectForKey:v10];
    (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v6, v11);

    goto LABEL_6;
  }
  id v7 = getPHImageErrorKey();
  id v8 = [v5 objectForKey:v7];

  if (v8)
  {
    id v6 = 0;
    goto LABEL_5;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_6:
}

void __47__WFPhotoMediaContentItem_getThumbnail_ofSize___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v10 = a5;
  if (a2)
  {
    a2 = [MEMORY[0x263F85308] imageWithData:a2];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = getPHImageErrorKey();
  uint64_t v9 = [v10 objectForKey:v8];
  (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, a2, v9);
}

- (PHAsset)asset
{
  id PHAssetClass = getPHAssetClass();
  return (PHAsset *)[(WFContentItem *)self objectForClass:PHAssetClass];
}

- (id)orientation
{
  uint64_t v2 = [(WFPhotoMediaContentItem *)self asset];
  if ([v2 mediaType] == 1)
  {
    unint64_t v3 = [v2 imageOrientation] - 1;
    if (v3 > 6) {
      int v4 = 1;
    }
    else {
      int v4 = dword_216612A70[v3];
    }
    id v5 = WFImageStringFromOrientation(v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)isScreenRecording
{
  uint64_t v2 = [(WFPhotoMediaContentItem *)self asset];
  unint64_t v3 = ((unint64_t)[v2 mediaSubtypes] >> 19) & 1;

  return v3;
}

- (BOOL)isScreenshot
{
  uint64_t v2 = [(WFPhotoMediaContentItem *)self asset];
  unint64_t v3 = ((unint64_t)[v2 mediaSubtypes] >> 2) & 1;

  return v3;
}

- (id)mediaType
{
  uint64_t v2 = [(WFPhotoMediaContentItem *)self asset];
  uint64_t v3 = [v2 mediaType];

  if ((unint64_t)(v3 - 1) > 2)
  {
    int v4 = 0;
  }
  else
  {
    int v4 = WFLocalizedContentPropertyPossibleValueMarker(off_26428B138[v3 - 1]);
  }
  return v4;
}

- (id)isFavorite
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [(WFPhotoMediaContentItem *)self asset];
  int v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isFavorite"));

  return v4;
}

- (id)isHidden
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [(WFPhotoMediaContentItem *)self asset];
  int v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isHidden"));

  return v4;
}

- (id)isLivePhoto
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [(WFPhotoMediaContentItem *)self asset];
  int v4 = objc_msgSend(v2, "numberWithInt:", (objc_msgSend(v3, "mediaSubtypes") >> 3) & 1);

  return v4;
}

- (id)isBurst
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = [(WFPhotoMediaContentItem *)self asset];
  int v4 = [v3 burstIdentifier];
  id v5 = [v2 numberWithInt:v4 != 0];

  return v5;
}

- (id)photoTypes
{
  uint64_t v3 = WFPhotoLibraryPossiblePhotoTypes();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__WFPhotoMediaContentItem_photoTypes__block_invoke;
  v6[3] = &unk_264285A98;
  v6[4] = self;
  int v4 = objc_msgSend(v3, "if_objectsPassingTest:", v6);

  return v4;
}

uint64_t __37__WFPhotoMediaContentItem_photoTypes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isPhotoType:a2];
}

- (BOOL)isPhotoType:(id)a3
{
  id v4 = a3;
  id v5 = WFLocalizedContentPropertyPossibleValueMarker(@"HDR");
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = [(WFPhotoMediaContentItem *)self asset];
    unint64_t v8 = ((unint64_t)[v7 mediaSubtypes] >> 1) & 1;
  }
  else
  {
    uint64_t v9 = WFLocalizedContentPropertyPossibleValueMarker(@"Panorama");
    int v10 = [v4 isEqualToString:v9];

    if (v10)
    {
      uint64_t v7 = [(WFPhotoMediaContentItem *)self asset];
      unint64_t v8 = [v7 mediaSubtypes] & 1;
    }
    else
    {
      char v11 = WFLocalizedContentPropertyPossibleValueMarker(@"Burst");
      int v12 = [v4 isEqualToString:v11];

      if (v12)
      {
        uint64_t v7 = [(WFPhotoMediaContentItem *)self asset];
        int v13 = [v7 burstIdentifier];
        LOBYTE(v8) = v13 != 0;
      }
      else
      {
        id v14 = WFLocalizedContentPropertyPossibleValueMarker(@"Live Photo");
        int v15 = [v4 isEqualToString:v14];

        if (!v15)
        {
          LOBYTE(v8) = 0;
          goto LABEL_10;
        }
        uint64_t v7 = [(WFPhotoMediaContentItem *)self isLivePhoto];
        LOBYTE(v8) = [v7 BOOLValue];
      }
    }
  }

LABEL_10:
  return v8;
}

- (id)height
{
  uint64_t v2 = NSNumber;
  [(WFPhotoMediaContentItem *)self size];
  return (id)[v2 numberWithDouble:v3];
}

- (id)width
{
  uint64_t v2 = NSNumber;
  [(WFPhotoMediaContentItem *)self size];
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (id)model
{
  uint64_t v2 = [(WFPhotoMediaContentItem *)self metadataIfLocallyAvailable];
  double v3 = WFImageModelFromMetadata(v2);

  return v3;
}

- (id)make
{
  uint64_t v2 = [(WFPhotoMediaContentItem *)self metadataIfLocallyAvailable];
  double v3 = WFImageMakeFromMetadata(v2);

  return v3;
}

- (CGSize)size
{
  uint64_t v2 = [(WFPhotoMediaContentItem *)self asset];
  double v3 = (double)(unint64_t)[v2 pixelWidth];
  double v4 = (double)(unint64_t)[v2 pixelHeight];

  double v5 = v3;
  double v6 = v4;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (id)location
{
  double v3 = [(WFContentItem *)self fileRepresentationForType:self->_preferredFileType];
  if (v3)
  {
    double v4 = +[WFContentItem itemWithFile:v3];
    if (!v4)
    {
      double v5 = +[WFContentItem itemWithFile:v3];
      double v6 = v5;
      if (v5)
      {
        uint64_t v7 = [v5 location];
      }
      else
      {
        uint64_t v7 = 0;
      }

      unint64_t v8 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    double v4 = [(WFPhotoMediaContentItem *)self asset];
  }
  unint64_t v8 = v4;
  uint64_t v7 = [v4 location];
LABEL_9:

  return v7;
}

- (id)metadataIfLocallyAvailable
{
  double v3 = [(WFPhotoMediaContentItem *)self asset];
  if ([v3 mediaType] == 1)
  {
    uint64_t v9 = 0;
    int v10 = &v9;
    uint64_t v11 = 0x3032000000;
    int v12 = __Block_byref_object_copy_;
    int v13 = __Block_byref_object_dispose_;
    id v14 = 0;
    id v4 = objc_alloc_init((Class)getPHImageRequestOptionsClass());
    [v4 setNetworkAccessAllowed:0];
    [v4 setSynchronous:1];
    [v4 setDeliveryMode:1];
    double v5 = [(WFPhotoMediaContentItem *)self imageManager];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53__WFPhotoMediaContentItem_metadataIfLocallyAvailable__block_invoke;
    v8[3] = &unk_264285A70;
    v8[4] = &v9;
    [v5 requestImageDataAndOrientationForAsset:v3 options:v4 resultHandler:v8];

    id v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __53__WFPhotoMediaContentItem_metadataIfLocallyAvailable__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  CFDataRef data = a2;
  id v8 = a3;
  id v9 = a5;
  if (data)
  {
    int v10 = CGImageSourceCreateWithData(data, 0);
    if (v10)
    {
      uint64_t v11 = v10;
      CFDictionaryRef v12 = CGImageSourceCopyPropertiesAtIndex(v10, 0, 0);
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      CFRelease(v11);
    }
  }
}

- (void)getFrameRate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__WFPhotoMediaContentItem_getFrameRate___block_invoke;
  v6[3] = &unk_264285A48;
  id v7 = v4;
  id v5 = v4;
  [(WFPhotoMediaContentItem *)self generateAVAsset:v6 networkAccessAllowed:0];
}

void __40__WFPhotoMediaContentItem_getFrameRate___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_7;
  }
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v10 = (void *)getAVMediaTypeVideoSymbolLoc_ptr;
  uint64_t v24 = getAVMediaTypeVideoSymbolLoc_ptr;
  if (!getAVMediaTypeVideoSymbolLoc_ptr)
  {
    uint64_t v11 = AVFoundationLibrary();
    v22[3] = (uint64_t)dlsym(v11, "AVMediaTypeVideo");
    getAVMediaTypeVideoSymbolLoc_ptr = v22[3];
    int v10 = (void *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (v10)
  {
    CFDictionaryRef v12 = [v7 tracksWithMediaType:*v10];
    uint64_t v13 = [v12 firstObject];
    [v13 nominalFrameRate];
    int v15 = v14;

    uint64_t v16 = *(void *)(a1 + 32);
    LODWORD(v17) = v15;
    id v18 = [NSNumber numberWithFloat:v17];
    (*(void (**)(uint64_t, void *, void))(v16 + 16))(v16, v18, 0);

LABEL_7:
    return;
  }
  id v19 = [MEMORY[0x263F08690] currentHandler];
  id v20 = [NSString stringWithUTF8String:"AVMediaType getAVMediaTypeVideo(void)"];
  objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"WFPhotoMediaContentItem.m", 65, @"%s", dlerror());

  __break(1u);
}

- (void)getMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(WFPhotoMediaContentItem *)self asset];
  if ([v5 mediaType] == 1)
  {
    v11[0] = 0;
    v11[1] = v11;
    void v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy_;
    v11[4] = __Block_byref_object_dispose_;
    id v12 = 0;
    id v6 = objc_alloc_init((Class)getPHImageRequestOptionsClass());
    [v6 setNetworkAccessAllowed:1];
    [v6 setSynchronous:0];
    [v6 setDeliveryMode:1];
    id v7 = [(WFPhotoMediaContentItem *)self imageManager];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __39__WFPhotoMediaContentItem_getMetadata___block_invoke;
    v8[3] = &unk_264285A20;
    id v9 = v4;
    int v10 = v11;
    [v7 requestImageDataAndOrientationForAsset:v5 options:v6 resultHandler:v8];

    _Block_object_dispose(v11, 8);
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __39__WFPhotoMediaContentItem_getMetadata___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  CFDataRef data = a2;
  id v8 = a3;
  id v9 = a5;
  if (data && (int v10 = CGImageSourceCreateWithData(data, 0)) != 0)
  {
    uint64_t v11 = v10;
    CFDictionaryRef v12 = CGImageSourceCopyPropertiesAtIndex(v10, 0, 0);
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    int v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    CFRelease(v11);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = getPHImageErrorKey();
    double v17 = [v9 objectForKey:v16];
    (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v17);
  }
}

- (id)assetResourceManager
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2050000000;
  uint64_t v2 = (void *)getPHAssetResourceManagerClass_softClass;
  uint64_t v10 = getPHAssetResourceManagerClass_softClass;
  if (!getPHAssetResourceManagerClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getPHAssetResourceManagerClass_block_invoke;
    v6[3] = &unk_26428AC60;
    void v6[4] = &v7;
    __getPHAssetResourceManagerClass_block_invoke((uint64_t)v6);
    uint64_t v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = [v3 defaultManager];
  return v4;
}

- (id)imageManager
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2050000000;
  uint64_t v2 = (void *)getPHImageManagerClass_softClass;
  uint64_t v10 = getPHImageManagerClass_softClass;
  if (!getPHImageManagerClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getPHImageManagerClass_block_invoke;
    v6[3] = &unk_26428AC60;
    void v6[4] = &v7;
    __getPHImageManagerClass_block_invoke((uint64_t)v6);
    uint64_t v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = [v3 defaultManager];
  return v4;
}

- (id)duration
{
  uint64_t v2 = [(WFPhotoMediaContentItem *)self asset];
  [v2 duration];
  double v4 = v3;

  if (v4 == 0.0)
  {
    uint64_t v11 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x263EFF910] date];
    id v6 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v7 = [v5 dateByAddingTimeInterval:v4];
    uint64_t v8 = 224;
    uint64_t v9 = [v6 components:224 fromDate:v5 toDate:v7 options:0];

    if ([v9 hour])
    {
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v12 = [v9 minute];
      if (v12) {
        uint64_t v8 = 224;
      }
      else {
        uint64_t v8 = 192;
      }
      if (v12) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = 0x10000;
      }
    }
    uint64_t v11 = [[WFTimeInterval alloc] initWithTimeInterval:v8 allowedUnits:0 unitsStyle:v10 zeroFormattingBehavior:v4];
  }
  return v11;
}

- (void)getPreferredFileExtension:(id)a3
{
  id v5 = a3;
  id v7 = [(WFPhotoMediaContentItem *)self preferredFileType];
  id v6 = [v7 fileExtension];
  (*((void (**)(id, void *))a3 + 2))(v5, v6);
}

- (void)getPreferredFileSize:(id)a3
{
  double v4 = (void (**)(id, uint64_t))a3;
  id v5 = [(WFPhotoMediaContentItem *)self preferredFileType];
  id v6 = [(WFPhotoMediaContentItem *)self preferredAssetResourceForType:v5];

  v4[2](v4, [v6 fileSize]);
}

- (NSDictionary)additionalRepresentationsForSerialization
{
  v19[4] = *MEMORY[0x263EF8340];
  double v3 = (void *)MEMORY[0x263EFF9A0];
  v18[0] = @"com.apple.mobileslideshow.asset.localidentifier";
  double v4 = [(WFPhotoMediaContentItem *)self asset];
  id v5 = [v4 localIdentifier];
  v19[0] = v5;
  v18[1] = @"link.contentkit.phasset.representationtypes";
  id v6 = [(WFPhotoMediaContentItem *)self assetRepresentationTypes];
  v19[1] = v6;
  v18[2] = @"link.contentkit.remoteitem.preferredfiletype";
  id v7 = [(WFPhotoMediaContentItem *)self preferredFileType];
  uint64_t v8 = [v7 string];
  v19[2] = v8;
  v18[3] = @"library";
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[WFPhotoMediaContentItem library](self, "library"));
  v19[3] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
  uint64_t v11 = [v3 dictionaryWithDictionary:v10];

  uint64_t v12 = [(WFPhotoMediaContentItem *)self preferredFileType];
  uint64_t v13 = [(WFContentItem *)self fileRepresentationForType:v12];

  int v14 = [v13 originalURL];
  uint64_t v15 = [v14 absoluteString];

  if (v15)
  {
    uint64_t v16 = [v13 originalURL];
    [v11 setObject:v16 forKey:@"fileURL"];
  }
  return (NSDictionary *)v11;
}

+ (BOOL)isAvailableOnPlatform:(int64_t)a3
{
  return a3 == 0;
}

+ (BOOL)hasLibrary
{
  return 1;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Photos");
}

+ (id)localizedPluralFilterDescriptionWithContext:(id)a3
{
  id v3 = a3;
  double v4 = WFLocalizedStringResourceWithKey(@"Photos", @"Photos");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedFilterDescriptionWithContext:(id)a3
{
  id v3 = a3;
  double v4 = WFLocalizedStringResourceWithKey(@"Photo (singular)", @"Photo");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)outputTypes
{
  uint64_t v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  double v4 = +[WFObjectType typeWithClassName:@"AVAsset" frameworkName:@"AVFoundation" location:0];
  id v5 = +[WFObjectType typeWithClassName:@"AVPlayerItem" frameworkName:@"AVFoundation" location:0];
  id v6 = +[WFObjectType typeWithClassName:@"PHLivePhoto" frameworkName:@"Photos" location:0];
  id v7 = (void *)MEMORY[0x263F852B8];
  uint64_t v8 = WFLivePhotoFileType();
  uint64_t v9 = [v7 typeWithUTType:v8];
  uint64_t v10 = +[WFObjectType typeWithClassName:@"CLLocation" frameworkName:@"CoreLocation" location:0];
  uint64_t v11 = +[WFObjectType typeWithClass:objc_opt_class()];
  uint64_t v12 = +[WFObjectType typeWithClass:objc_opt_class()];
  uint64_t v13 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v9, v10, v11, v12, 0);

  return v13;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  double v4 = WFLocalizedStringResourceWithKey(@"Photo media (plural)", @"Photo media");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  double v4 = WFLocalizedStringResourceWithKey(@"Photo media (singular)", @"Photo media");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)ownedPasteboardTypes
{
  uint64_t v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F852B8] typeWithString:@"com.apple.mobileslideshow.asset.localidentifier"];
  double v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)ownedTypes
{
  uint64_t v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClassName:@"PHAsset" frameworkName:@"Photos" location:0];
  double v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;
  id v7 = [v6 string];

  LOBYTE(v6) = [v7 isEqualToString:@"AVAsset"];
  if (v6) {
    goto LABEL_14;
  }
  id v8 = v4;
  if (v4)
  {
    objc_opt_class();
    id v9 = (objc_opt_isKindOfClass() & 1) != 0 ? v8 : 0;
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  uint64_t v11 = [v10 string];

  LOBYTE(v10) = [v11 isEqualToString:@"CLLocation"];
  if (v10 & 1) != 0 || ([v8 isEqualToClass:objc_opt_class()])
  {
LABEL_14:
    unsigned __int8 v12 = 1;
  }
  else
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___WFPhotoMediaContentItem;
    unsigned __int8 v12 = objc_msgSendSuper2(&v14, sel_supportedTypeMustBeDeterminedByInstance_, v8);
  }

  return v12;
}

+ (id)remoteItemWithAssetIdentifier:(id)a3 named:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  unsigned __int8 v12 = @"com.apple.mobileslideshow.asset.localidentifier";
  v13[0] = a3;
  id v6 = NSDictionary;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 dictionaryWithObjects:v13 forKeys:&v12 count:1];

  id v10 = [a1 itemWithSerializedItem:v9 forType:0 named:v7 attributionSet:0 cachingIdentifier:0];

  return v10;
}

+ (id)stringConversionBehavior
{
  uint64_t v2 = [a1 propertyForName:@"Name"];
  id v3 = +[WFContentItemStringConversionBehavior accessingProperty:v2];

  return v3;
}

+ (id)propertyBuilders
{
  v103[20] = *MEMORY[0x263EF8340];
  v96 = WFLocalizedContentPropertyNameMarkerWithContext(@"Album", @"Image Content Item");
  v95 = +[WFContentPropertyBuilder block:&__block_literal_global_610 name:v96 class:objc_opt_class()];
  v94 = [v95 multipleValues:1];
  v97[0] = MEMORY[0x263EF8330];
  v97[1] = 3221225472;
  v97[2] = __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_218;
  v97[3] = &__block_descriptor_40_e14___NSArray_8__0l;
  v97[4] = a1;
  v93 = [v94 possibleValuesGetter:v97];
  v103[0] = v93;
  v92 = WFLocalizedContentPropertyNameMarker(@"Width");
  v91 = +[WFContentPropertyBuilder keyPath:@"width" name:v92 class:objc_opt_class()];
  v103[1] = v91;
  v90 = WFLocalizedContentPropertyNameMarker(@"Height");
  v89 = +[WFContentPropertyBuilder keyPath:@"height" name:v90 class:objc_opt_class()];
  v103[2] = v89;
  v88 = WFLocalizedContentPropertyNameMarker(@"Date Taken");
  v87 = +[WFContentPropertyBuilder keyPath:@"asset.creationDate" name:v88 class:objc_opt_class()];
  v86 = [v87 tense:1];
  v85 = [v86 timeUnits:8220];
  v84 = [v85 comparableUnits:8220];
  v103[3] = v84;
  v83 = WFLocalizedContentPropertyNameMarker(@"Time Taken");
  v82 = +[WFContentPropertyBuilder keyPath:@"asset.creationDate" name:v83 class:objc_opt_class()];
  v81 = [v82 tense:1];
  v80 = [v81 timeUnits:224];
  v79 = [v80 comparableUnits:224];
  v78 = [v79 gettable:0];
  v103[4] = v78;
  v77 = WFLocalizedContentPropertyNameMarker(@"Media Type");
  v76 = +[WFContentPropertyBuilder keyPath:@"mediaType" name:v77 class:objc_opt_class()];
  v75 = WFPhotoLibraryPossibleMediaTypes();
  v74 = [v76 possibleValues:v75];
  v103[5] = v74;
  v73 = WFLocalizedContentPropertyNameMarker(@"Photo Type");
  v72 = +[WFContentPropertyBuilder keyPath:@"photoTypes" name:v73 class:objc_opt_class()];
  v71 = WFPhotoLibraryPossiblePhotoTypes();
  v70 = [v72 possibleValues:v71];
  v69 = [v70 multipleValues:1];
  v68 = [v69 sortable:0];
  v103[6] = v68;
  v66 = WFLocalizedContentPropertyNameMarker(@"Is a Screenshot");
  v67 = [NSNumber numberWithBool:1];
  v65 = +[WFContentPropertyBuilder keyPath:@"isScreenshot" name:v66 class:objc_opt_class()];
  v64 = WFLocalizedContentPropertyNameMarker(@"Is Not a Screenshot");
  v63 = [v65 negativeName:v64];
  v62 = WFLocalizedString(@"Photo");
  v61 = [v63 singularItemName:v62];
  v103[7] = v61;
  v59 = WFLocalizedContentPropertyNameMarker(@"Is a Screen Recording");
  v60 = [NSNumber numberWithBool:1];
  v58 = +[WFContentPropertyBuilder keyPath:@"isScreenRecording" name:v59 class:objc_opt_class()];
  v57 = WFLocalizedContentPropertyNameMarker(@"Is Not a Screen Recording");
  v56 = [v58 negativeName:v57];
  v55 = WFLocalizedString(@"Video");
  v54 = [v56 singularItemName:v55];
  v103[8] = v54;
  v53 = WFLocalizedContentPropertyNameMarker(@"Location");
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x2050000000;
  id v3 = (void *)getCLLocationClass_softClass;
  uint64_t v102 = getCLLocationClass_softClass;
  if (!getCLLocationClass_softClass)
  {
    v98[0] = MEMORY[0x263EF8330];
    v98[1] = 3221225472;
    v98[2] = __getCLLocationClass_block_invoke;
    v98[3] = &unk_26428AC60;
    v98[4] = &v99;
    __getCLLocationClass_block_invoke((uint64_t)v98);
    id v3 = (void *)v100[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v99, 8);
  v52 = +[WFContentPropertyBuilder keyPath:@"location" name:v53 class:v4];
  v103[9] = v52;
  v51 = WFLocalizedContentPropertyNameMarker(@"Duration");
  uint64_t v50 = +[WFContentPropertyBuilder keyPath:@"duration" name:v51 class:objc_opt_class()];
  v49 = [v50 timeUnits:224];
  v103[10] = v49;
  v48 = WFLocalizedContentPropertyNameMarker(@"Frame Rate");
  v47 = +[WFContentPropertyBuilder block:&__block_literal_global_274 name:v48 class:objc_opt_class()];
  v46 = [v47 irrational:1];
  v103[11] = v46;
  uint64_t v45 = WFLocalizedContentPropertyNameMarker(@"Orientation");
  uint64_t v44 = +[WFContentPropertyBuilder keyPath:@"orientation" name:v45 class:objc_opt_class()];
  v43 = WFImagePossibleOrientationStrings();
  uint64_t v42 = [v44 possibleValues:v43];
  id v41 = [v42 sortable:0];
  v103[12] = v41;
  v40 = WFLocalizedContentPropertyNameMarker(@"Camera Make");
  id v39 = +[WFContentPropertyBuilder keyPath:@"make" name:v40 class:objc_opt_class()];
  v38 = [v39 sortable:0];
  id v37 = [v38 filterable:0];
  v103[13] = v37;
  uint64_t v36 = WFLocalizedContentPropertyNameMarker(@"Camera Model");
  id v35 = +[WFContentPropertyBuilder keyPath:@"model" name:v36 class:objc_opt_class()];
  v34 = [v35 sortable:0];
  v33 = [v34 filterable:0];
  v103[14] = v33;
  double v32 = WFLocalizedContentPropertyNameMarker(@"Metadata Dictionary");
  uint64_t v31 = +[WFContentPropertyBuilder block:&__block_literal_global_289 name:v32 class:objc_opt_class()];
  uint64_t v30 = [v31 sortable:0];
  objc_super v29 = [v30 filterable:0];
  v103[15] = v29;
  uint64_t v27 = WFLocalizedContentPropertyNameMarker(@"Is Favorite");
  uint64_t v28 = [NSNumber numberWithBool:1];
  id v26 = +[WFContentPropertyBuilder keyPath:@"isFavorite" name:v27 class:objc_opt_class()];
  id v25 = WFLocalizedContentPropertyNameMarker(@"Is Not Favorite");
  uint64_t v24 = [v26 negativeName:v25];
  uint64_t v23 = WFLocalizedString(@"Photo");
  id v22 = [v24 singularItemName:v23];
  v103[16] = v22;
  uint64_t v21 = WFLocalizedContentPropertyNameMarker(@"Creation Date");
  id v20 = +[WFContentPropertyBuilder keyPath:@"asset.creationDate" name:v21 class:objc_opt_class()];
  id v19 = [v20 userInfo:@"WFFileCreationDate"];
  id v18 = [v19 tense:1];
  double v17 = [v18 timeUnits:8444];
  v103[17] = v17;
  id v5 = WFLocalizedContentPropertyNameMarker(@"Last Modified Date");
  id v6 = +[WFContentPropertyBuilder keyPath:@"asset.modificationDate" name:v5 class:objc_opt_class()];
  id v7 = [v6 userInfo:@"WFFileModificationDate"];
  id v8 = [v7 tense:1];
  id v9 = [v8 timeUnits:8444];
  v103[18] = v9;
  id v10 = WFLocalizedContentPropertyNameMarker(@"File Size");
  uint64_t v11 = +[WFContentPropertyBuilder block:&__block_literal_global_308 name:v10 class:objc_opt_class()];
  unsigned __int8 v12 = [v11 userInfo:@"WFFileSizeProperty"];
  uint64_t v13 = [v12 sortable:0];
  objc_super v14 = [v13 filterable:0];
  v103[19] = v14;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v103 count:20];

  return v16;
}

id __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_218(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) photoAlbums];
  uint64_t v2 = objc_msgSend(v1, "if_compactMap:", &__block_literal_global_221);

  return v2;
}

void __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_8;
  v7[3] = &unk_26428A288;
  id v8 = v5;
  id v6 = v5;
  [a2 getPreferredFileSize:v7];
}

void __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [[WFFileSize alloc] initWithByteCount:a2];
  (*(void (**)(uint64_t, WFFileSize *))(v2 + 16))(v2, v3);
}

void __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_6;
  v7[3] = &unk_264287040;
  id v8 = v5;
  id v6 = v5;
  [a2 getMetadata:v7];
}

uint64_t __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_4;
  v7[3] = &unk_2642859D8;
  id v8 = v5;
  id v6 = v5;
  [a2 getFrameRate:v7];
}

uint64_t __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 wfName];
}

void __43__WFPhotoMediaContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a4;
  id v7 = objc_opt_new();
  id v8 = +[WFSharedPhotoLibrary sharedLibrary];
  id v27 = 0;
  id v9 = [v8 fetchOptionsWithError:&v27];
  id v10 = v27;

  if (v9)
  {
    [v9 setWantsIncrementalChangeDetails:0];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id PHAssetCollectionClass = getPHAssetCollectionClass();
    unsigned __int8 v12 = [v5 asset];
    uint64_t v13 = [PHAssetCollectionClass fetchAssetCollectionsContainingAsset:v12 withType:1 options:v9];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      id v22 = v5;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v19 = [v18 wfName];

          if (v19)
          {
            id v20 = [v18 wfName];
            [v7 addObject:v20];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v15);
      uint64_t v21 = v7;
      id v5 = v22;
    }
    else
    {
      uint64_t v21 = v7;
    }
  }
  else
  {
    uint64_t v13 = getWFGeneralLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v30 = "+[WFPhotoMediaContentItem propertyBuilders]_block_invoke";
      __int16 v31 = 2112;
      id v32 = v10;
      _os_log_impl(&dword_216505000, v13, OS_LOG_TYPE_ERROR, "%s Unable to get fetch options for photo library: %@", buf, 0x16u);
    }
    uint64_t v21 = 0;
  }

  ((void (**)(id, void *))v6)[2](v6, v21);
}

+ (id)photoAlbums
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2050000000;
  uint64_t v2 = (void *)getPHPhotoLibraryClass_softClass;
  uint64_t v32 = getPHPhotoLibraryClass_softClass;
  if (!getPHPhotoLibraryClass_softClass)
  {
    *(void *)long long buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getPHPhotoLibraryClass_block_invoke;
    uint64_t v36 = &unk_26428AC60;
    id v37 = &v29;
    __getPHPhotoLibraryClass_block_invoke((uint64_t)buf);
    uint64_t v2 = (void *)v30[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v29, 8);
  if ([v3 authorizationStatus] == 3)
  {
    id v4 = +[WFSharedPhotoLibrary sharedLibrary];
    id v28 = 0;
    id v19 = [v4 fetchOptionsWithError:&v28];
    id v18 = v28;

    if (v19)
    {
      [v19 setWantsIncrementalChangeDetails:0];
      id v5 = objc_opt_new();
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v6 = [getPHAssetCollectionClass() fetchAssetCollectionsWithType:1 subtype:0x7FFFFFFFFFFFFFFFLL options:v19];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v34 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v25 != v8) {
              objc_enumerationMutation(v6);
            }
            objc_msgSend(v5, "addObject:", *(void *)(*((void *)&v24 + 1) + 8 * i), v18);
          }
          uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v34 count:16];
        }
        while (v7);
      }

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = [getPHAssetCollectionClass() fetchAssetCollectionsWithType:2 subtype:0x7FFFFFFFFFFFFFFFLL options:v19];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v33 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v21;
        do
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * j);
            if (objc_msgSend(v14, "assetCollectionSubtype", v18) == 209)
            {
              [v5 insertObject:v14 atIndex:0];
            }
            else
            {
              uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "assetCollectionSubtype"));
              char v16 = [&unk_26C743AF8 containsObject:v15];

              if ((v16 & 1) == 0) {
                [v5 addObject:v14];
              }
            }
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v33 count:16];
        }
        while (v11);
      }
    }
    else
    {
      id v10 = getWFGeneralLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        *(void *)&uint8_t buf[4] = "+[WFPhotoMediaContentItem photoAlbums]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        _os_log_impl(&dword_216505000, v10, OS_LOG_TYPE_ERROR, "%s Unable to get fetch options for photo library: %@", buf, 0x16u);
      }
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
}

+ (id)itemWithSerializedItem:(id)a3 forType:(id)a4 named:(id)a5 attributionSet:(id)a6 cachingIdentifier:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  uint64_t v15 = [v14 wfObjectOfClass:objc_opt_class() forKey:@"com.apple.mobileslideshow.asset.localidentifier"];
  char v16 = [v14 wfObjectOfClass:objc_opt_class() forKey:@"library"];
  double v17 = [v14 wfObjectOfClass:objc_opt_class() forKey:@"fileURL"];

  id v18 = +[WFFileRepresentation fileWithURL:v17 options:0];
  id v19 = objc_msgSend(a1, "itemWithAssetIdentifier:library:assetFile:nameIfKnown:attributionSet:cachingIdentifier:", v15, objc_msgSend(v16, "integerValue"), v18, v13, v12, v11);

  return v19;
}

+ (id)fetchOptionsForLibrary:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = +[WFSharedPhotoLibrary sharedLibrary];
  id v9 = 0;
  id v5 = [v4 fetchOptionsWithError:&v9];
  id v6 = v9;

  if (!v5)
  {
    uint64_t v7 = getWFGeneralLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315650;
      id v11 = "+[WFPhotoMediaContentItem fetchOptionsForLibrary:]";
      __int16 v12 = 2048;
      int64_t v13 = a3;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_216505000, v7, OS_LOG_TYPE_ERROR, "%s Unable to get fetch options for library: %li, error: %@", buf, 0x20u);
    }
  }
  [v5 setWantsIncrementalChangeDetails:0];
  [v5 setIncludeGuestAssets:1];

  return v5;
}

+ (id)itemsWithBurstIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 fetchOptionsForLibrary:0];
  id v6 = v5;
  if (v5)
  {
    [v5 setIncludeAssetSourceTypes:7];
    [v6 setIncludeAllBurstAssets:1];
    [v6 setWantsIncrementalChangeDetails:0];
    uint64_t v7 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"creationDate" ascending:1];
    long long v22 = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    [v6 setSortDescriptors:v8];

    id v9 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = objc_msgSend(getPHAssetClass(), "fetchAssetsWithBurstIdentifier:options:", v4, v6, 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [a1 itemWithObject:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          [v9 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v10 = getWFGeneralLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v24 = "+[WFPhotoMediaContentItem itemsWithBurstIdentifier:]";
      _os_log_impl(&dword_216505000, v10, OS_LOG_TYPE_ERROR, "%s Unable to get fetch options for photo library", buf, 0xCu);
    }
    id v9 = 0;
  }

  return v9;
}

+ (id)itemWithAssetIdentifier:(id)a3 library:(int64_t)a4 assetFile:(id)a5 nameIfKnown:(id)a6 attributionSet:(id)a7 cachingIdentifier:(id)a8
{
  v37[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!v14)
  {
    long long v24 = 0;
    goto LABEL_11;
  }
  long long v19 = [a1 fetchOptionsForLibrary:a4];
  id PHAssetClass = getPHAssetClass();
  v37[0] = v14;
  long long v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
  long long v22 = [PHAssetClass fetchAssetsWithLocalIdentifiers:v21 options:v19];

  if (![v22 count])
  {
    long long v27 = getWFGeneralLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315650;
      uint64_t v32 = "+[WFPhotoMediaContentItem itemWithAssetIdentifier:library:assetFile:nameIfKnown:attributionSet:cachingIdentifier:]";
      __int16 v33 = 2112;
      id v34 = v14;
      __int16 v35 = 2048;
      int64_t v36 = a4;
      _os_log_impl(&dword_216505000, v27, OS_LOG_TYPE_DEFAULT, "%s No PHAsset found for asset identifier: %@, library: %li", buf, 0x20u);
    }
    long long v24 = 0;
    goto LABEL_9;
  }
  long long v23 = [v22 firstObject];
  long long v24 = [a1 itemWithObject:v23 named:v16 attributionSet:v17 cachingIdentifier:v18];

  [v24 setLibrary:a4];
  if (v15)
  {
    uint64_t v25 = [v15 wfType];
    long long v26 = (void *)v24[6];
    v24[6] = v25;

    id v30 = v15;
    long long v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
    id v28 = [v15 wfType];
    [v24 setFileRepresentations:v27 forType:v28];

LABEL_9:
  }

LABEL_11:
  return v24;
}

+ (id)itemWithAssetIdentifier:(id)a3 library:(int64_t)a4 assetFile:(id)a5 nameIfKnown:(id)a6
{
  return (id)[a1 itemWithAssetIdentifier:a3 library:a4 assetFile:a5 nameIfKnown:a6 attributionSet:0 cachingIdentifier:0];
}

+ (id)itemWithAssetIdentifier:(id)a3 library:(int64_t)a4 assetFile:(id)a5
{
  return (id)[a1 itemWithAssetIdentifier:a3 library:a4 assetFile:a5 nameIfKnown:0];
}

+ (id)itemWithAssetIdentifier:(id)a3 library:(int64_t)a4
{
  return (id)[a1 itemWithAssetIdentifier:a3 library:a4 assetFile:0];
}

+ (id)itemWithAssetIdentifier:(id)a3 assetFile:(id)a4
{
  return (id)[a1 itemWithAssetIdentifier:a3 library:0 assetFile:a4 nameIfKnown:0];
}

+ (id)itemWithAssetIdentifier:(id)a3
{
  return (id)[a1 itemWithAssetIdentifier:a3 library:0 assetFile:0];
}

- (BOOL)loadsListThumbnailAsynchronously
{
  return 1;
}

- (BOOL)getListAltText:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(WFPhotoMediaContentItem *)self asset];
  if (([v5 mediaType] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v6 = [(WFPhotoMediaContentItem *)self asset];
    [v6 duration];
    uint64_t v8 = WFChooseFromListFormatPlaybackDuration(v7);

    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v8 = 0;
  if (v4) {
LABEL_5:
  }
    v4[2](v4, v8);
LABEL_6:

  return 1;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F85258] currentDevice];
    [v8 screenScale];
    CGFloat v10 = v9;

    CGAffineTransformMakeScale(&v16, v10, v10);
    double v11 = height * v16.c + v16.a * width;
    double v12 = height * v16.d + v16.b * width;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__WFPhotoMediaContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke;
    v14[3] = &unk_264288760;
    id v15 = v7;
    -[WFPhotoMediaContentItem getThumbnail:ofSize:](self, "getThumbnail:ofSize:", v14, v11, v12);
  }
  return 1;
}

uint64_t __68__WFPhotoMediaContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)getListSubtitle:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  id v5 = [(WFPhotoMediaContentItem *)self asset];
  uint64_t v6 = [v5 mediaType];
  switch(v6)
  {
    case 3:
      uint64_t v8 = @"Audio";
      break;
    case 2:
      uint64_t v8 = @"Video";
      break;
    case 1:
      uint64_t v7 = WFLocalizedStringWithKey(@"Photo (media type)", @"Photo");
      goto LABEL_9;
    default:
      uint64_t v8 = @"Unknown";
      break;
  }
  uint64_t v7 = WFLocalizedString(v8);
LABEL_9:
  double v9 = (void *)v7;
  if (v4) {
    v4[2](v4, v7);
  }

  return 1;
}

@end