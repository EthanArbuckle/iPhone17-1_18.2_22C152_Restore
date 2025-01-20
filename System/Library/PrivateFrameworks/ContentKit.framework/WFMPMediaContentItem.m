@interface WFMPMediaContentItem
+ (BOOL)hasLibrary;
+ (BOOL)isAvailableOnPlatform:(int64_t)a3;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedFilterDescriptionWithContext:(id)a3;
+ (id)localizedPluralFilterDescriptionWithContext:(id)a3;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6;
- (BOOL)getListAltText:(id)a3;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (MPMediaItem)mediaItem;
- (NSDictionary)additionalRepresentationsForSerialization;
- (NSString)albumTitle;
- (NSString)artist;
- (NSString)title;
- (WFFileType)preferredFileType;
- (id)assetURL;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (void)getPreferredFileSize:(id)a3;
@end

@implementation WFMPMediaContentItem

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  v45[2] = *MEMORY[0x263EF8340];
  if ((Class)objc_opt_class() == a3)
  {
    v13 = [(WFMPMediaContentItem *)self mediaItem];
    v14 = getMPMediaItemPropertyArtwork();
    v10 = [v13 valueForProperty:v14];

    v15 = [(WFMPMediaContentItem *)self mediaItem];
    v16 = getMPMediaItemPropertyAlbumTitle();
    v17 = [v15 valueForProperty:v16];
    v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = [(WFContentItem *)self name];
    }
    v11 = v19;

    [v10 bounds];
    v22 = objc_msgSend(v10, "imageWithSize:", v20, v21);
    if (v22)
    {
      v23 = (void *)[objc_alloc(MEMORY[0x263F85308]) initWithPlatformImage:v22];
      a5 = +[WFObjectRepresentation object:v23 named:v11];
    }
    else if (a5)
    {
      v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v41 = *MEMORY[0x263F08438];
      v44[0] = *MEMORY[0x263F08338];
      v25 = WFLocalizedString(@"Item Has No Album Art");
      v45[0] = v25;
      v44[1] = *MEMORY[0x263F08320];
      v26 = NSString;
      v27 = WFLocalizedString(@"The item “%@” cannot be converted to an image, because it has no artwork.");
      v28 = [(WFContentItem *)self name];
      v29 = objc_msgSend(v26, "localizedStringWithFormat:", v27, v28);
      v45[1] = v29;
      v30 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
      *a5 = [v24 errorWithDomain:v41 code:79 userInfo:v30];

      a5 = 0;
    }

    goto LABEL_20;
  }
  v8 = NSStringFromClass(a3);
  int v9 = [@"AVAsset" isEqualToString:v8];

  if (v9)
  {
    v10 = [(WFMPMediaContentItem *)self assetURL];
    if (!v10)
    {
      if (a5)
      {
        v31 = (void *)MEMORY[0x263F087E8];
        uint64_t v32 = *MEMORY[0x263F08438];
        v42[0] = *MEMORY[0x263F08338];
        v33 = WFLocalizedString(@"Item Not Downloaded");
        v43[0] = v33;
        v42[1] = *MEMORY[0x263F08320];
        v34 = NSString;
        v35 = WFLocalizedString(@"The item “%@” cannot be exported, likely because it is only stored in iCloud or has not yet been synced to this device.");
        v36 = [(WFContentItem *)self name];
        v37 = objc_msgSend(v34, "localizedStringWithFormat:", v35, v36);
        v43[1] = v37;
        v38 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
        *a5 = [v31 errorWithDomain:v32 code:79 userInfo:v38];

        a5 = 0;
      }
      goto LABEL_21;
    }
    v11 = [getAVURLAssetClass_10305() assetWithURL:v10];
    v12 = [(WFContentItem *)self name];
    a5 = +[WFObjectRepresentation object:v11 named:v12];
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
    {
      a5 = 0;
      goto LABEL_22;
    }
    v10 = [(WFMPMediaContentItem *)self mediaItem];
    v11 = [v10 releaseDate];
    if (!v11)
    {
      a5 = 0;
      goto LABEL_20;
    }
    v12 = [(WFMPMediaContentItem *)self mediaItem];
    v39 = [v12 releaseDate];
    a5 = +[WFObjectRepresentation object:v39 named:@"Release Date"];
  }
LABEL_20:

LABEL_21:
LABEL_22:
  return a5;
}

- (WFFileType)preferredFileType
{
  v3 = [(WFMPMediaContentItem *)self assetURL];
  v4 = [v3 pathExtension];

  if ([v4 length])
  {
    v5 = [MEMORY[0x263F852B8] typeFromFileExtension:v4];
    if ([v5 conformsToUTType:*MEMORY[0x263F1DB80]])
    {
      id v6 = [MEMORY[0x263F852B8] typeWithString:*MEMORY[0x263F856A8]];
    }
    else
    {
      id v6 = v5;
    }
    v7 = v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFMPMediaContentItem;
    v7 = [(WFContentItem *)&v9 preferredFileType];
  }

  return (WFFileType *)v7;
}

- (void)getPreferredFileSize:(id)a3
{
  void (*v19)(_OWORD *__return_ptr, long long *, long long *);
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _OWORD v24[3];
  long long v25;
  uint64_t v26;
  long long v27;
  void *v28;
  _OWORD v29[3];
  void v30[4];
  void (**v31)(id, void);
  long long v32;
  void *v33;
  void *v34;
  long long *v35;
  long long v36;
  uint64_t v37;
  void *v38;

  v4 = (void (**)(id, void))a3;
  v5 = [(WFMPMediaContentItem *)self assetURL];

  if (!v5)
  {
    v4[2](v4, 0);
LABEL_21:

    return;
  }
  id AVURLAssetClass_10305 = getAVURLAssetClass_10305();
  v7 = [(WFMPMediaContentItem *)self assetURL];
  v8 = [AVURLAssetClass_10305 assetWithURL:v7];

  objc_super v9 = [(WFMPMediaContentItem *)self preferredFileType];
  if (([v9 conformsToString:*MEMORY[0x263F856A8]] & 1) == 0)
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __45__WFMPMediaContentItem_getPreferredFileSize___block_invoke;
    v30[3] = &unk_26428AA60;
    v31 = v4;
    [(WFContentItem *)self getFileRepresentation:v30 forType:0];
    v15 = v31;
LABEL_20:

    goto LABEL_21;
  }
  *(void *)&v36 = 0;
  *((void *)&v36 + 1) = &v36;
  v37 = 0x2050000000;
  v10 = (void *)getAVAssetExportSessionClass_softClass_10350;
  v38 = (void *)getAVAssetExportSessionClass_softClass_10350;
  if (!getAVAssetExportSessionClass_softClass_10350)
  {
    *(void *)&uint64_t v32 = MEMORY[0x263EF8330];
    *((void *)&v32 + 1) = 3221225472;
    v33 = __getAVAssetExportSessionClass_block_invoke_10351;
    v34 = &unk_26428AC60;
    v35 = &v36;
    __getAVAssetExportSessionClass_block_invoke_10351((uint64_t)&v32);
    v10 = *(void **)(*((void *)&v36 + 1) + 24);
  }
  id v11 = v10;
  _Block_object_dispose(&v36, 8);
  *(void *)&v36 = 0;
  *((void *)&v36 + 1) = &v36;
  v37 = 0x2020000000;
  v12 = (void *)getAVAssetExportPresetAppleM4ASymbolLoc_ptr_10352;
  v38 = (void *)getAVAssetExportPresetAppleM4ASymbolLoc_ptr_10352;
  if (!getAVAssetExportPresetAppleM4ASymbolLoc_ptr_10352)
  {
    *(void *)&uint64_t v32 = MEMORY[0x263EF8330];
    *((void *)&v32 + 1) = 3221225472;
    v33 = __getAVAssetExportPresetAppleM4ASymbolLoc_block_invoke_10353;
    v34 = &unk_26428AC60;
    v35 = &v36;
    v13 = AVFoundationLibrary_10312();
    v14 = dlsym(v13, "AVAssetExportPresetAppleM4A");
    *(void *)(*((void *)v35 + 1) + 24) = v14;
    getAVAssetExportPresetAppleM4ASymbolLoc_ptr_10352 = *(void *)(*((void *)v35 + 1) + 24);
    v12 = *(void **)(*((void *)&v36 + 1) + 24);
  }
  _Block_object_dispose(&v36, 8);
  if (v12)
  {
    v15 = [v11 exportSessionWithAsset:v8 presetName:*v12];
    *(void *)&v36 = 0;
    *((void *)&v36 + 1) = &v36;
    v37 = 0x2020000000;
    uint64_t v16 = getkCMTimeZeroSymbolLoc_ptr_10356;
    v38 = (void *)getkCMTimeZeroSymbolLoc_ptr_10356;
    if (!getkCMTimeZeroSymbolLoc_ptr_10356)
    {
      *(void *)&uint64_t v32 = MEMORY[0x263EF8330];
      *((void *)&v32 + 1) = 3221225472;
      v33 = __getkCMTimeZeroSymbolLoc_block_invoke_10357;
      v34 = &unk_26428AC60;
      v35 = &v36;
      v17 = CoreMediaLibrary_10358();
      v18 = dlsym(v17, "kCMTimeZero");
      *(void *)(*((void *)v35 + 1) + 24) = v18;
      getkCMTimeZeroSymbolLoc_ptr_10356 = *(void *)(*((void *)v35 + 1) + 24);
      uint64_t v16 = *(void *)(*((void *)&v36 + 1) + 24);
    }
    _Block_object_dispose(&v36, 8);
    if (v16)
    {
      v27 = *(_OWORD *)v16;
      v28 = *(void **)(v16 + 16);
      if (v8)
      {
        [v8 duration];
      }
      else
      {
        v25 = 0uLL;
        v26 = 0;
      }
      *(void *)&v36 = 0;
      *((void *)&v36 + 1) = &v36;
      v37 = 0x2020000000;
      id v19 = (void (*)(_OWORD *__return_ptr, long long *, long long *))getCMTimeRangeMakeSymbolLoc_ptr_10361;
      v38 = getCMTimeRangeMakeSymbolLoc_ptr_10361;
      if (!getCMTimeRangeMakeSymbolLoc_ptr_10361)
      {
        *(void *)&uint64_t v32 = MEMORY[0x263EF8330];
        *((void *)&v32 + 1) = 3221225472;
        v33 = __getCMTimeRangeMakeSymbolLoc_block_invoke_10362;
        v34 = &unk_26428AC60;
        v35 = &v36;
        double v20 = CoreMediaLibrary_10358();
        double v21 = dlsym(v20, "CMTimeRangeMake");
        *(void *)(*((void *)v35 + 1) + 24) = v21;
        getCMTimeRangeMakeSymbolLoc_ptr_10361 = *(_UNKNOWN **)(*((void *)v35 + 1) + 24);
        id v19 = *(void (**)(_OWORD *__return_ptr, long long *, long long *))(*((void *)&v36 + 1) + 24);
      }
      _Block_object_dispose(&v36, 8);
      if (v19)
      {
        uint64_t v32 = v27;
        v33 = v28;
        v36 = v25;
        v37 = v26;
        v19(v29, &v32, &v36);
        v24[0] = v29[0];
        v24[1] = v29[1];
        v24[2] = v29[2];
        [v15 setTimeRange:v24];
        v4[2](v4, [v15 estimatedOutputFileLength]);
        goto LABEL_20;
      }
      v22 = [MEMORY[0x263F08690] currentHandler];
      v23 = objc_msgSend(NSString, "stringWithUTF8String:", "CMTimeRange soft_CMTimeRangeMake(CMTime, CMTime)");
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"WFMPMediaContentItem.m", 25, @"%s", dlerror());
    }
    else
    {
      v22 = [MEMORY[0x263F08690] currentHandler];
      v23 = [NSString stringWithUTF8String:"CMTime getkCMTimeZero(void)"];
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"WFMPMediaContentItem.m", 24, @"%s", dlerror());
    }
  }
  else
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    v23 = [NSString stringWithUTF8String:"NSString *getAVAssetExportPresetAppleM4A(void)"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"WFMPMediaContentItem.m", 30, @"%s", dlerror());
  }

  __break(1u);
}

uint64_t __45__WFMPMediaContentItem_getPreferredFileSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 fileSize];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

- (NSString)albumTitle
{
  uint64_t v2 = [(WFMPMediaContentItem *)self mediaItem];
  uint64_t v3 = [v2 albumTitle];

  return (NSString *)v3;
}

- (NSString)artist
{
  uint64_t v2 = [(WFMPMediaContentItem *)self mediaItem];
  uint64_t v3 = [v2 artist];

  return (NSString *)v3;
}

- (NSString)title
{
  uint64_t v2 = [(WFMPMediaContentItem *)self mediaItem];
  uint64_t v3 = [v2 title];

  return (NSString *)v3;
}

- (NSDictionary)additionalRepresentationsForSerialization
{
  v10.receiver = self;
  v10.super_class = (Class)WFMPMediaContentItem;
  uint64_t v3 = [(WFContentItem *)&v10 additionalRepresentationsForSerialization];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(WFMPMediaContentItem *)self preferredFileType];
  id v6 = [v5 string];
  [v4 setObject:v6 forKey:@"link.contentkit.remoteitem.preferredfiletype"];

  v7 = [(WFMPMediaContentItem *)self artist];
  [v4 setValue:v7 forKey:@"link.contentkit.mpmediaitem.artist"];

  v8 = [(WFMPMediaContentItem *)self albumTitle];
  [v4 setValue:v8 forKey:@"link.contentkit.mpmediaitem.album"];

  return (NSDictionary *)v4;
}

- (id)assetURL
{
  uint64_t v2 = [(WFMPMediaContentItem *)self mediaItem];
  uint64_t v9 = 0;
  objc_super v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v3 = (void *)getMPMediaItemPropertyAssetURLSymbolLoc_ptr;
  uint64_t v12 = getMPMediaItemPropertyAssetURLSymbolLoc_ptr;
  if (!getMPMediaItemPropertyAssetURLSymbolLoc_ptr)
  {
    v4 = MediaPlayerLibrary();
    v10[3] = (uint64_t)dlsym(v4, "MPMediaItemPropertyAssetURL");
    getMPMediaItemPropertyAssetURLSymbolLoc_ptr = v10[3];
    uint64_t v3 = (void *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (v3)
  {
    v5 = [v2 valueForProperty:*v3];

    return v5;
  }
  else
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyAssetURL(void)"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"WFMPMediaContentItem.m", 35, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (MPMediaItem)mediaItem
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2050000000;
  uint64_t v3 = (void *)getMPMediaItemClass_softClass_10379;
  uint64_t v11 = getMPMediaItemClass_softClass_10379;
  if (!getMPMediaItemClass_softClass_10379)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getMPMediaItemClass_block_invoke_10380;
    v7[3] = &unk_26428AC60;
    v7[4] = &v8;
    __getMPMediaItemClass_block_invoke_10380((uint64_t)v7);
    uint64_t v3 = (void *)v9[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  v5 = [(WFContentItem *)self objectForClass:v4];
  return (MPMediaItem *)v5;
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
  return WFLocalizedPluralString(@"%d Music Items");
}

+ (id)localizedPluralFilterDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Music (plural)", @"Music");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedFilterDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Music (singular)", @"Music");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"iTunes media (plural)", @"iTunes media");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"iTunes media (singular)", @"iTunes media");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Media";
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  uint64_t v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClassName:@"AVAsset" frameworkName:@"AVFoundation" location:0];
  id v4 = +[WFObjectType typeWithClass:objc_opt_class()];
  v5 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v6 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);

  return v6;
}

+ (id)ownedTypes
{
  uint64_t v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClassName:@"MPMediaItem" frameworkName:@"MediaPlayer" location:2];
  id v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [a1 allProperties];
  v15 = getMPMediaItemPropertyDiscNumber();
  uint64_t v16 = [v14 objectMatchingKey:@"userInfo" value:v15];

  v17 = getMPMediaItemPropertyAlbumTrackNumber();
  v18 = [v14 objectMatchingKey:@"userInfo" value:v17];

  id v19 = getMPMediaItemPropertyAlbumTitle();
  WFInsertSortDescriptorAroundDescriptorMatchingUserInfo(v10, v18, 0, 1u, v19);

  double v20 = getMPMediaItemPropertyAlbumTrackNumber();
  WFInsertSortDescriptorAroundDescriptorMatchingUserInfo(v10, v16, 1, 0, v20);

  double v21 = getWFContentGraphLogObject();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "+[WFMPMediaContentItem runQuery:withItems:permissionRequestor:completionHandler:]";
    __int16 v31 = 2112;
    id v32 = v10;
    __int16 v33 = 2048;
    uint64_t v34 = [v11 count];
    _os_log_impl(&dword_216505000, v21, OS_LOG_TYPE_INFO, "%s Running query %@ with %lu input items", buf, 0x20u);
  }

  if ([v11 count])
  {
    v28.receiver = a1;
    v28.super_class = (Class)&OBJC_METACLASS___WFMPMediaContentItem;
    objc_msgSendSuper2(&v28, sel_runQuery_withItems_permissionRequestor_completionHandler_, v10, v11, v12, v13);
  }
  else
  {
    v22 = [v10 predicate];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __81__WFMPMediaContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke;
    v23[3] = &unk_264287B50;
    id v24 = v10;
    id v25 = v12;
    id v26 = v13;
    id v27 = a1;
    +[WFContentLibraryANDFiltering getItemsMatchingPredicate:v22 resultHandler:v23];
  }
}

void __81__WFMPMediaContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (WFContentQuery *)*(id *)(a1 + 32);
  if (v3)
  {
    v5 = [[WFContentQuery alloc] initWithPredicate:0];

    id v6 = [*(id *)(a1 + 32) sortDescriptors];
    [(WFContentQuery *)v5 setSortDescriptors:v6];

    uint64_t v7 = [*(id *)(a1 + 32) slice];
    -[WFContentQuery setSlice:](v5, "setSlice:", v7, v8);
    uint64_t v9 = [*(id *)(a1 + 32) userInfo];
    [(WFContentQuery *)v5 setUserInfo:v9];

    id v4 = v5;
  }
  else
  {
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x2050000000;
    id v10 = (void *)getMPMediaQueryClass_softClass;
    uint64_t v21 = getMPMediaQueryClass_softClass;
    if (!getMPMediaQueryClass_softClass)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __getMPMediaQueryClass_block_invoke;
      v17[3] = &unk_26428AC60;
      v17[4] = &v18;
      __getMPMediaQueryClass_block_invoke((uint64_t)v17);
      id v10 = (void *)v19[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v18, 8);
    id v12 = objc_opt_new();
    id v3 = [v12 items];
  }
  id v13 = objc_msgSend(v3, "if_map:", &__block_literal_global_157);
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 40);
  v16.receiver = *(id *)(a1 + 56);
  v16.super_class = (Class)&OBJC_METACLASS___WFMPMediaContentItem;
  objc_msgSendSuper2(&v16, sel_runQuery_withItems_permissionRequestor_completionHandler_, v4, v13, v15, v14);
}

WFMPMediaContentItem *__81__WFMPMediaContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[WFContentItem itemWithObject:a2];
}

+ (id)stringConversionBehavior
{
  uint64_t v2 = [a1 propertyForName:@"Title"];
  id v3 = +[WFContentItemStringConversionBehavior accessingProperty:v2];

  return v3;
}

+ (id)propertyBuilders
{
  v252[26] = *MEMORY[0x263EF8340];
  uint64_t v2 = WFMPMediaTypeMapping();
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__WFMPMediaContentItem_propertyBuilders__block_invoke_3;
  aBlock[3] = &unk_264287A70;
  id v242 = &__block_literal_global_10448;
  id v220 = v2;
  id v241 = v220;
  v221 = _Block_copy(aBlock);
  v235 = WFLocalizedContentPropertyNameMarker(@"Title");
  v234 = +[WFContentPropertyBuilder block:&__block_literal_global_10448 name:v235 class:objc_opt_class()];
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  id v3 = (id *)getMPMediaItemPropertyTitleSymbolLoc_ptr;
  uint64_t v251 = getMPMediaItemPropertyTitleSymbolLoc_ptr;
  if (!getMPMediaItemPropertyTitleSymbolLoc_ptr)
  {
    uint64_t v243 = MEMORY[0x263EF8330];
    uint64_t v244 = 3221225472;
    v245 = __getMPMediaItemPropertyTitleSymbolLoc_block_invoke;
    v246 = &unk_26428AC60;
    v247 = &v248;
    id v4 = MediaPlayerLibrary();
    v5 = dlsym(v4, "MPMediaItemPropertyTitle");
    *(void *)(v247[1] + 24) = v5;
    getMPMediaItemPropertyTitleSymbolLoc_ptr = *(void *)(v247[1] + 24);
    id v3 = (id *)v249[3];
  }
  _Block_object_dispose(&v248, 8);
  if (!v3)
  {
    v65 = [MEMORY[0x263F08690] currentHandler];
    v66 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyTitle(void)"];
    objc_msgSend(v65, "handleFailureInFunction:file:lineNumber:description:", v66, @"WFMPMediaContentItem.m", 36, @"%s", dlerror());

    goto LABEL_72;
  }
  id v116 = *v3;
  v233 = objc_msgSend(v234, "userInfo:");
  v252[0] = v233;
  v232 = WFLocalizedContentPropertyNameMarkerWithContext(@"Album", @"Music Content Item");
  v231 = +[WFContentPropertyBuilder block:&__block_literal_global_10448 name:v232 class:objc_opt_class()];
  v230 = getMPMediaItemPropertyAlbumTitle();
  v229 = [v231 userInfo:v230];
  v252[1] = v229;
  v228 = WFLocalizedContentPropertyNameMarker(@"Artist");
  v227 = +[WFContentPropertyBuilder block:&__block_literal_global_10448 name:v228 class:objc_opt_class()];
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  id v6 = (id *)getMPMediaItemPropertyArtistSymbolLoc_ptr;
  uint64_t v251 = getMPMediaItemPropertyArtistSymbolLoc_ptr;
  if (!getMPMediaItemPropertyArtistSymbolLoc_ptr)
  {
    uint64_t v243 = MEMORY[0x263EF8330];
    uint64_t v244 = 3221225472;
    v245 = __getMPMediaItemPropertyArtistSymbolLoc_block_invoke;
    v246 = &unk_26428AC60;
    v247 = &v248;
    uint64_t v7 = MediaPlayerLibrary();
    uint64_t v8 = dlsym(v7, "MPMediaItemPropertyArtist");
    *(void *)(v247[1] + 24) = v8;
    getMPMediaItemPropertyArtistSymbolLoc_ptr = *(void *)(v247[1] + 24);
    id v6 = (id *)v249[3];
  }
  _Block_object_dispose(&v248, 8);
  if (!v6)
  {
    v67 = [MEMORY[0x263F08690] currentHandler];
    v68 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyArtist(void)"];
    objc_msgSend(v67, "handleFailureInFunction:file:lineNumber:description:", v68, @"WFMPMediaContentItem.m", 38, @"%s", dlerror());

    goto LABEL_72;
  }
  id v115 = *v6;
  v226 = objc_msgSend(v227, "userInfo:");
  v252[2] = v226;
  v225 = WFLocalizedContentPropertyNameMarker(@"Album Artist");
  v224 = +[WFContentPropertyBuilder block:&__block_literal_global_10448 name:v225 class:objc_opt_class()];
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  uint64_t v9 = (id *)getMPMediaItemPropertyAlbumArtistSymbolLoc_ptr;
  uint64_t v251 = getMPMediaItemPropertyAlbumArtistSymbolLoc_ptr;
  if (!getMPMediaItemPropertyAlbumArtistSymbolLoc_ptr)
  {
    uint64_t v243 = MEMORY[0x263EF8330];
    uint64_t v244 = 3221225472;
    v245 = __getMPMediaItemPropertyAlbumArtistSymbolLoc_block_invoke;
    v246 = &unk_26428AC60;
    v247 = &v248;
    id v10 = MediaPlayerLibrary();
    id v11 = dlsym(v10, "MPMediaItemPropertyAlbumArtist");
    *(void *)(v247[1] + 24) = v11;
    getMPMediaItemPropertyAlbumArtistSymbolLoc_ptr = *(void *)(v247[1] + 24);
    uint64_t v9 = (id *)v249[3];
  }
  _Block_object_dispose(&v248, 8);
  if (!v9)
  {
    v69 = [MEMORY[0x263F08690] currentHandler];
    v70 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyAlbumArtist(void)"];
    objc_msgSend(v69, "handleFailureInFunction:file:lineNumber:description:", v70, @"WFMPMediaContentItem.m", 39, @"%s", dlerror());

    goto LABEL_72;
  }
  id v114 = *v9;
  v223 = objc_msgSend(v224, "userInfo:");
  v252[3] = v223;
  v222 = WFLocalizedContentPropertyNameMarker(@"Genre");
  v219 = +[WFContentPropertyBuilder block:&__block_literal_global_10448 name:v222 class:objc_opt_class()];
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  id v12 = (id *)getMPMediaItemPropertyGenreSymbolLoc_ptr;
  uint64_t v251 = getMPMediaItemPropertyGenreSymbolLoc_ptr;
  if (!getMPMediaItemPropertyGenreSymbolLoc_ptr)
  {
    uint64_t v243 = MEMORY[0x263EF8330];
    uint64_t v244 = 3221225472;
    v245 = __getMPMediaItemPropertyGenreSymbolLoc_block_invoke;
    v246 = &unk_26428AC60;
    v247 = &v248;
    id v13 = MediaPlayerLibrary();
    uint64_t v14 = dlsym(v13, "MPMediaItemPropertyGenre");
    *(void *)(v247[1] + 24) = v14;
    getMPMediaItemPropertyGenreSymbolLoc_ptr = *(void *)(v247[1] + 24);
    id v12 = (id *)v249[3];
  }
  _Block_object_dispose(&v248, 8);
  if (!v12)
  {
    v71 = [MEMORY[0x263F08690] currentHandler];
    v72 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyGenre(void)"];
    objc_msgSend(v71, "handleFailureInFunction:file:lineNumber:description:", v72, @"WFMPMediaContentItem.m", 40, @"%s", dlerror());

    goto LABEL_72;
  }
  id v113 = *v12;
  v218 = objc_msgSend(v219, "userInfo:");
  v252[4] = v218;
  v217 = WFLocalizedContentPropertyNameMarker(@"Composer");
  v216 = +[WFContentPropertyBuilder block:&__block_literal_global_10448 name:v217 class:objc_opt_class()];
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  uint64_t v15 = (id *)getMPMediaItemPropertyComposerSymbolLoc_ptr;
  uint64_t v251 = getMPMediaItemPropertyComposerSymbolLoc_ptr;
  if (!getMPMediaItemPropertyComposerSymbolLoc_ptr)
  {
    uint64_t v243 = MEMORY[0x263EF8330];
    uint64_t v244 = 3221225472;
    v245 = __getMPMediaItemPropertyComposerSymbolLoc_block_invoke;
    v246 = &unk_26428AC60;
    v247 = &v248;
    objc_super v16 = MediaPlayerLibrary();
    v17 = dlsym(v16, "MPMediaItemPropertyComposer");
    *(void *)(v247[1] + 24) = v17;
    getMPMediaItemPropertyComposerSymbolLoc_ptr = *(void *)(v247[1] + 24);
    uint64_t v15 = (id *)v249[3];
  }
  _Block_object_dispose(&v248, 8);
  if (!v15)
  {
    v73 = [MEMORY[0x263F08690] currentHandler];
    v74 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyComposer(void)"];
    objc_msgSend(v73, "handleFailureInFunction:file:lineNumber:description:", v74, @"WFMPMediaContentItem.m", 41, @"%s", dlerror());

    goto LABEL_72;
  }
  id v112 = *v15;
  v215 = objc_msgSend(v216, "userInfo:");
  v252[5] = v215;
  v214 = WFLocalizedContentPropertyNameMarker(@"Date Added");
  v213 = +[WFContentPropertyBuilder block:&__block_literal_global_10448 name:v214 class:objc_opt_class()];
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  uint64_t v18 = (id *)getMPMediaItemPropertyDateAddedSymbolLoc_ptr;
  uint64_t v251 = getMPMediaItemPropertyDateAddedSymbolLoc_ptr;
  if (!getMPMediaItemPropertyDateAddedSymbolLoc_ptr)
  {
    uint64_t v243 = MEMORY[0x263EF8330];
    uint64_t v244 = 3221225472;
    v245 = __getMPMediaItemPropertyDateAddedSymbolLoc_block_invoke;
    v246 = &unk_26428AC60;
    v247 = &v248;
    id v19 = MediaPlayerLibrary();
    uint64_t v20 = dlsym(v19, "MPMediaItemPropertyDateAdded");
    *(void *)(v247[1] + 24) = v20;
    getMPMediaItemPropertyDateAddedSymbolLoc_ptr = *(void *)(v247[1] + 24);
    uint64_t v18 = (id *)v249[3];
  }
  _Block_object_dispose(&v248, 8);
  if (!v18)
  {
    v75 = [MEMORY[0x263F08690] currentHandler];
    v76 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyDateAdded(void)"];
    objc_msgSend(v75, "handleFailureInFunction:file:lineNumber:description:", v76, @"WFMPMediaContentItem.m", 42, @"%s", dlerror());

    goto LABEL_72;
  }
  id v111 = *v18;
  v212 = objc_msgSend(v213, "userInfo:");
  v211 = [v212 tense:1];
  v252[6] = v211;
  v210 = WFLocalizedContentPropertyNameMarker(@"Media Kind");
  v209 = +[WFContentPropertyBuilder block:v221 name:v210 class:objc_opt_class()];
  v208 = [v220 allValues];
  v207 = [v209 possibleValues:v208];
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  uint64_t v21 = (id *)getMPMediaItemPropertyMediaTypeSymbolLoc_ptr;
  uint64_t v251 = getMPMediaItemPropertyMediaTypeSymbolLoc_ptr;
  if (!getMPMediaItemPropertyMediaTypeSymbolLoc_ptr)
  {
    uint64_t v243 = MEMORY[0x263EF8330];
    uint64_t v244 = 3221225472;
    v245 = __getMPMediaItemPropertyMediaTypeSymbolLoc_block_invoke;
    v246 = &unk_26428AC60;
    v247 = &v248;
    v22 = MediaPlayerLibrary();
    v23 = dlsym(v22, "MPMediaItemPropertyMediaType");
    *(void *)(v247[1] + 24) = v23;
    getMPMediaItemPropertyMediaTypeSymbolLoc_ptr = *(void *)(v247[1] + 24);
    uint64_t v21 = (id *)v249[3];
  }
  _Block_object_dispose(&v248, 8);
  if (!v21)
  {
    v77 = [MEMORY[0x263F08690] currentHandler];
    v78 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyMediaType(void)"];
    objc_msgSend(v77, "handleFailureInFunction:file:lineNumber:description:", v78, @"WFMPMediaContentItem.m", 43, @"%s", dlerror());

    goto LABEL_72;
  }
  id v110 = *v21;
  v206 = objc_msgSend(v207, "userInfo:");
  v252[7] = v206;
  v238[0] = MEMORY[0x263EF8330];
  v238[1] = 3221225472;
  v238[2] = __40__WFMPMediaContentItem_propertyBuilders__block_invoke_5;
  v238[3] = &unk_264287AC0;
  id v239 = &__block_literal_global_10448;
  v205 = WFLocalizedContentPropertyNameMarker(@"Duration");
  v204 = +[WFContentPropertyBuilder block:v238 name:v205 class:objc_opt_class()];
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  id v24 = (id *)getMPMediaItemPropertyPlaybackDurationSymbolLoc_ptr;
  uint64_t v251 = getMPMediaItemPropertyPlaybackDurationSymbolLoc_ptr;
  if (!getMPMediaItemPropertyPlaybackDurationSymbolLoc_ptr)
  {
    uint64_t v243 = MEMORY[0x263EF8330];
    uint64_t v244 = 3221225472;
    v245 = __getMPMediaItemPropertyPlaybackDurationSymbolLoc_block_invoke;
    v246 = &unk_26428AC60;
    v247 = &v248;
    id v25 = MediaPlayerLibrary();
    id v26 = dlsym(v25, "MPMediaItemPropertyPlaybackDuration");
    *(void *)(v247[1] + 24) = v26;
    getMPMediaItemPropertyPlaybackDurationSymbolLoc_ptr = *(void *)(v247[1] + 24);
    id v24 = (id *)v249[3];
  }
  _Block_object_dispose(&v248, 8);
  if (!v24)
  {
    v79 = [MEMORY[0x263F08690] currentHandler];
    v80 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyPlaybackDuration(void)"];
    objc_msgSend(v79, "handleFailureInFunction:file:lineNumber:description:", v80, @"WFMPMediaContentItem.m", 44, @"%s", dlerror());

    goto LABEL_72;
  }
  id v109 = *v24;
  v203 = objc_msgSend(v204, "userInfo:");
  v202 = [v203 timeUnits:224];
  v252[8] = v202;
  v201 = WFLocalizedContentPropertyNameMarker(@"Play Count");
  v200 = +[WFContentPropertyBuilder block:&__block_literal_global_10448 name:v201 class:objc_opt_class()];
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  id v27 = (id *)getMPMediaItemPropertyPlayCountSymbolLoc_ptr;
  uint64_t v251 = getMPMediaItemPropertyPlayCountSymbolLoc_ptr;
  if (!getMPMediaItemPropertyPlayCountSymbolLoc_ptr)
  {
    uint64_t v243 = MEMORY[0x263EF8330];
    uint64_t v244 = 3221225472;
    v245 = __getMPMediaItemPropertyPlayCountSymbolLoc_block_invoke;
    v246 = &unk_26428AC60;
    v247 = &v248;
    objc_super v28 = MediaPlayerLibrary();
    v29 = dlsym(v28, "MPMediaItemPropertyPlayCount");
    *(void *)(v247[1] + 24) = v29;
    getMPMediaItemPropertyPlayCountSymbolLoc_ptr = *(void *)(v247[1] + 24);
    id v27 = (id *)v249[3];
  }
  _Block_object_dispose(&v248, 8);
  if (!v27)
  {
    v81 = [MEMORY[0x263F08690] currentHandler];
    v82 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyPlayCount(void)"];
    objc_msgSend(v81, "handleFailureInFunction:file:lineNumber:description:", v82, @"WFMPMediaContentItem.m", 45, @"%s", dlerror());

    goto LABEL_72;
  }
  id v108 = *v27;
  v199 = objc_msgSend(v200, "userInfo:");
  v252[9] = v199;
  v198 = +[WFContentPropertyBuilder block:&__block_literal_global_10448 name:@"Album Track #" class:objc_opt_class()];
  v197 = getMPMediaItemPropertyAlbumTrackNumber();
  v195 = [v198 userInfo:v197];
  v196 = WFLocalizedContentPropertyNameMarker(@"Track Number");
  v194 = [v195 displayName:v196];
  v252[10] = v194;
  v193 = +[WFContentPropertyBuilder block:&__block_literal_global_10448 name:@"Disc #" class:objc_opt_class()];
  v192 = getMPMediaItemPropertyDiscNumber();
  v191 = [v193 userInfo:v192];
  v190 = WFLocalizedContentPropertyNameMarker(@"Disc Number");
  v189 = [v191 displayName:v190];
  v252[11] = v189;
  v236[0] = MEMORY[0x263EF8330];
  v236[1] = 3221225472;
  v236[2] = __40__WFMPMediaContentItem_propertyBuilders__block_invoke_7;
  v236[3] = &unk_264287AC0;
  id v237 = &__block_literal_global_10448;
  v188 = WFLocalizedContentPropertyNameMarker(@"Album Artwork");
  v187 = +[WFContentPropertyBuilder block:v236 name:v188 class:objc_opt_class()];
  v186 = getMPMediaItemPropertyArtwork();
  v185 = [v187 userInfo:v186];
  v252[12] = v185;
  v183 = WFLocalizedContentPropertyNameMarker(@"Is Explicit");
  v184 = [NSNumber numberWithBool:1];
  v182 = +[WFContentPropertyBuilder block:&__block_literal_global_15_10449 name:v183 class:objc_opt_class()];
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  v30 = (id *)getMPMediaItemPropertyIsExplicitSymbolLoc_ptr;
  uint64_t v251 = getMPMediaItemPropertyIsExplicitSymbolLoc_ptr;
  if (!getMPMediaItemPropertyIsExplicitSymbolLoc_ptr)
  {
    uint64_t v243 = MEMORY[0x263EF8330];
    uint64_t v244 = 3221225472;
    v245 = __getMPMediaItemPropertyIsExplicitSymbolLoc_block_invoke;
    v246 = &unk_26428AC60;
    v247 = &v248;
    __int16 v31 = MediaPlayerLibrary();
    id v32 = dlsym(v31, "MPMediaItemPropertyIsExplicit");
    *(void *)(v247[1] + 24) = v32;
    getMPMediaItemPropertyIsExplicitSymbolLoc_ptr = *(void *)(v247[1] + 24);
    v30 = (id *)v249[3];
  }
  _Block_object_dispose(&v248, 8);
  if (!v30)
  {
    v83 = [MEMORY[0x263F08690] currentHandler];
    v84 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyIsExplicit(void)"];
    objc_msgSend(v83, "handleFailureInFunction:file:lineNumber:description:", v84, @"WFMPMediaContentItem.m", 49, @"%s", dlerror());

    goto LABEL_72;
  }
  id v107 = *v30;
  v181 = objc_msgSend(v182, "userInfo:");
  v180 = WFLocalizedContentPropertyNameMarker(@"Is Not Explicit");
  v179 = [v181 negativeName:v180];
  v178 = WFLocalizedStringWithKey(@"Track (item name)", @"Track");
  v177 = [v179 singularItemName:v178];
  v252[13] = v177;
  v176 = WFLocalizedContentPropertyNameMarker(@"Lyrics");
  v175 = +[WFContentPropertyBuilder block:&__block_literal_global_10448 name:v176 class:objc_opt_class()];
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  __int16 v33 = (id *)getMPMediaItemPropertyLyricsSymbolLoc_ptr;
  uint64_t v251 = getMPMediaItemPropertyLyricsSymbolLoc_ptr;
  if (!getMPMediaItemPropertyLyricsSymbolLoc_ptr)
  {
    uint64_t v243 = MEMORY[0x263EF8330];
    uint64_t v244 = 3221225472;
    v245 = __getMPMediaItemPropertyLyricsSymbolLoc_block_invoke;
    v246 = &unk_26428AC60;
    v247 = &v248;
    uint64_t v34 = MediaPlayerLibrary();
    uint64_t v35 = dlsym(v34, "MPMediaItemPropertyLyrics");
    *(void *)(v247[1] + 24) = v35;
    getMPMediaItemPropertyLyricsSymbolLoc_ptr = *(void *)(v247[1] + 24);
    __int16 v33 = (id *)v249[3];
  }
  _Block_object_dispose(&v248, 8);
  if (!v33)
  {
    v85 = [MEMORY[0x263F08690] currentHandler];
    v86 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyLyrics(void)"];
    objc_msgSend(v85, "handleFailureInFunction:file:lineNumber:description:", v86, @"WFMPMediaContentItem.m", 50, @"%s", dlerror());

    goto LABEL_72;
  }
  id v106 = *v33;
  v174 = objc_msgSend(v175, "userInfo:");
  v173 = [v174 sortable:0];
  v252[14] = v173;
  v172 = WFLocalizedContentPropertyNameMarker(@"Release Date");
  v171 = +[WFContentPropertyBuilder block:&__block_literal_global_10448 name:v172 class:objc_opt_class()];
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  v36 = (id *)getMPMediaItemPropertyReleaseDateSymbolLoc_ptr;
  uint64_t v251 = getMPMediaItemPropertyReleaseDateSymbolLoc_ptr;
  if (!getMPMediaItemPropertyReleaseDateSymbolLoc_ptr)
  {
    uint64_t v243 = MEMORY[0x263EF8330];
    uint64_t v244 = 3221225472;
    v245 = __getMPMediaItemPropertyReleaseDateSymbolLoc_block_invoke;
    v246 = &unk_26428AC60;
    v247 = &v248;
    v37 = MediaPlayerLibrary();
    v38 = dlsym(v37, "MPMediaItemPropertyReleaseDate");
    *(void *)(v247[1] + 24) = v38;
    getMPMediaItemPropertyReleaseDateSymbolLoc_ptr = *(void *)(v247[1] + 24);
    v36 = (id *)v249[3];
  }
  _Block_object_dispose(&v248, 8);
  if (!v36)
  {
    v87 = [MEMORY[0x263F08690] currentHandler];
    v88 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyReleaseDate(void)"];
    objc_msgSend(v87, "handleFailureInFunction:file:lineNumber:description:", v88, @"WFMPMediaContentItem.m", 51, @"%s", dlerror());

    goto LABEL_72;
  }
  id v105 = *v36;
  v170 = objc_msgSend(v171, "userInfo:");
  v169 = [v170 tense:1];
  v168 = [v169 timeUnits:8220];
  v167 = [v168 comparableUnits:8220];
  v252[15] = v167;
  v166 = WFLocalizedContentPropertyNameMarker(@"Comments");
  v165 = +[WFContentPropertyBuilder block:&__block_literal_global_10448 name:v166 class:objc_opt_class()];
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  v39 = (id *)getMPMediaItemPropertyCommentsSymbolLoc_ptr;
  uint64_t v251 = getMPMediaItemPropertyCommentsSymbolLoc_ptr;
  if (!getMPMediaItemPropertyCommentsSymbolLoc_ptr)
  {
    uint64_t v243 = MEMORY[0x263EF8330];
    uint64_t v244 = 3221225472;
    v245 = __getMPMediaItemPropertyCommentsSymbolLoc_block_invoke;
    v246 = &unk_26428AC60;
    v247 = &v248;
    v40 = MediaPlayerLibrary();
    uint64_t v41 = dlsym(v40, "MPMediaItemPropertyComments");
    *(void *)(v247[1] + 24) = v41;
    getMPMediaItemPropertyCommentsSymbolLoc_ptr = *(void *)(v247[1] + 24);
    v39 = (id *)v249[3];
  }
  _Block_object_dispose(&v248, 8);
  if (!v39)
  {
    v89 = [MEMORY[0x263F08690] currentHandler];
    v90 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyComments(void)"];
    objc_msgSend(v89, "handleFailureInFunction:file:lineNumber:description:", v90, @"WFMPMediaContentItem.m", 52, @"%s", dlerror());

    goto LABEL_72;
  }
  id v104 = *v39;
  v164 = objc_msgSend(v165, "userInfo:");
  v163 = [v164 sortable:0];
  v252[16] = v163;
  v161 = WFLocalizedContentPropertyNameMarker(@"Is Cloud Item");
  v162 = [NSNumber numberWithBool:1];
  v160 = +[WFContentPropertyBuilder block:&__block_literal_global_10448 name:v161 class:objc_opt_class()];
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  v42 = (id *)getMPMediaItemPropertyIsCloudItemSymbolLoc_ptr;
  uint64_t v251 = getMPMediaItemPropertyIsCloudItemSymbolLoc_ptr;
  if (!getMPMediaItemPropertyIsCloudItemSymbolLoc_ptr)
  {
    uint64_t v243 = MEMORY[0x263EF8330];
    uint64_t v244 = 3221225472;
    v245 = __getMPMediaItemPropertyIsCloudItemSymbolLoc_block_invoke;
    v246 = &unk_26428AC60;
    v247 = &v248;
    v43 = MediaPlayerLibrary();
    v44 = dlsym(v43, "MPMediaItemPropertyIsCloudItem");
    *(void *)(v247[1] + 24) = v44;
    getMPMediaItemPropertyIsCloudItemSymbolLoc_ptr = *(void *)(v247[1] + 24);
    v42 = (id *)v249[3];
  }
  _Block_object_dispose(&v248, 8);
  if (!v42)
  {
    v91 = [MEMORY[0x263F08690] currentHandler];
    v92 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyIsCloudItem(void)"];
    objc_msgSend(v91, "handleFailureInFunction:file:lineNumber:description:", v92, @"WFMPMediaContentItem.m", 53, @"%s", dlerror());

    goto LABEL_72;
  }
  id v103 = *v42;
  v159 = objc_msgSend(v160, "userInfo:");
  v158 = WFLocalizedContentPropertyNameMarker(@"Is Not Cloud Item");
  v157 = [v159 negativeName:v158];
  v156 = WFLocalizedStringWithKey(@"Track (item name)", @"Track");
  v155 = [v157 singularItemName:v156];
  v252[17] = v155;
  v153 = WFLocalizedContentPropertyNameMarker(@"Has Album Artwork");
  v154 = [NSNumber numberWithBool:1];
  v152 = +[WFContentPropertyBuilder block:&__block_literal_global_105 name:v153 class:objc_opt_class()];
  v151 = WFLocalizedContentPropertyNameMarker(@"Has No Album Artwork");
  v150 = [v152 negativeName:v151];
  v149 = WFLocalizedContentPropertyNameMarker(@"Track");
  v148 = [v150 singularItemName:v149];
  v147 = [v148 gettable:0];
  v252[18] = v147;
  v146 = WFLocalizedContentPropertyNameMarker(@"Skip Count");
  v145 = +[WFContentPropertyBuilder block:&__block_literal_global_10448 name:v146 class:objc_opt_class()];
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  v45 = (id *)getMPMediaItemPropertySkipCountSymbolLoc_ptr;
  uint64_t v251 = getMPMediaItemPropertySkipCountSymbolLoc_ptr;
  if (!getMPMediaItemPropertySkipCountSymbolLoc_ptr)
  {
    uint64_t v243 = MEMORY[0x263EF8330];
    uint64_t v244 = 3221225472;
    v245 = __getMPMediaItemPropertySkipCountSymbolLoc_block_invoke;
    v246 = &unk_26428AC60;
    v247 = &v248;
    v46 = MediaPlayerLibrary();
    v47 = dlsym(v46, "MPMediaItemPropertySkipCount");
    *(void *)(v247[1] + 24) = v47;
    getMPMediaItemPropertySkipCountSymbolLoc_ptr = *(void *)(v247[1] + 24);
    v45 = (id *)v249[3];
  }
  _Block_object_dispose(&v248, 8);
  if (!v45)
  {
    v93 = [MEMORY[0x263F08690] currentHandler];
    v94 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertySkipCount(void)"];
    objc_msgSend(v93, "handleFailureInFunction:file:lineNumber:description:", v94, @"WFMPMediaContentItem.m", 54, @"%s", dlerror());

    goto LABEL_72;
  }
  id v102 = *v45;
  v144 = objc_msgSend(v145, "userInfo:");
  v252[19] = v144;
  v143 = WFLocalizedContentPropertyNameMarker(@"Last Played Date");
  v142 = +[WFContentPropertyBuilder block:&__block_literal_global_10448 name:v143 class:objc_opt_class()];
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  v48 = (id *)getMPMediaItemPropertyLastPlayedDateSymbolLoc_ptr;
  uint64_t v251 = getMPMediaItemPropertyLastPlayedDateSymbolLoc_ptr;
  if (!getMPMediaItemPropertyLastPlayedDateSymbolLoc_ptr)
  {
    uint64_t v243 = MEMORY[0x263EF8330];
    uint64_t v244 = 3221225472;
    v245 = __getMPMediaItemPropertyLastPlayedDateSymbolLoc_block_invoke;
    v246 = &unk_26428AC60;
    v247 = &v248;
    v49 = MediaPlayerLibrary();
    v50 = dlsym(v49, "MPMediaItemPropertyLastPlayedDate");
    *(void *)(v247[1] + 24) = v50;
    getMPMediaItemPropertyLastPlayedDateSymbolLoc_ptr = *(void *)(v247[1] + 24);
    v48 = (id *)v249[3];
  }
  _Block_object_dispose(&v248, 8);
  if (!v48)
  {
    v95 = [MEMORY[0x263F08690] currentHandler];
    v96 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyLastPlayedDate(void)"];
    objc_msgSend(v95, "handleFailureInFunction:file:lineNumber:description:", v96, @"WFMPMediaContentItem.m", 55, @"%s", dlerror());

    goto LABEL_72;
  }
  id v101 = *v48;
  v141 = objc_msgSend(v142, "userInfo:");
  v140 = [v141 tense:1];
  v139 = [v140 timeUnits:8444];
  v252[20] = v139;
  v138 = WFLocalizedContentPropertyNameMarker(@"Rating");
  v137 = +[WFContentPropertyBuilder block:&__block_literal_global_10448 name:v138 class:objc_opt_class()];
  uint64_t v248 = 0;
  v249 = &v248;
  uint64_t v250 = 0x2020000000;
  v51 = (id *)getMPMediaItemPropertyRatingSymbolLoc_ptr;
  uint64_t v251 = getMPMediaItemPropertyRatingSymbolLoc_ptr;
  if (!getMPMediaItemPropertyRatingSymbolLoc_ptr)
  {
    uint64_t v243 = MEMORY[0x263EF8330];
    uint64_t v244 = 3221225472;
    v245 = __getMPMediaItemPropertyRatingSymbolLoc_block_invoke;
    v246 = &unk_26428AC60;
    v247 = &v248;
    v52 = MediaPlayerLibrary();
    v53 = dlsym(v52, "MPMediaItemPropertyRating");
    *(void *)(v247[1] + 24) = v53;
    getMPMediaItemPropertyRatingSymbolLoc_ptr = *(void *)(v247[1] + 24);
    v51 = (id *)v249[3];
  }
  _Block_object_dispose(&v248, 8);
  if (!v51)
  {
    v97 = [MEMORY[0x263F08690] currentHandler];
    v98 = [NSString stringWithUTF8String:"NSString *getMPMediaItemPropertyRating(void)"];
    objc_msgSend(v97, "handleFailureInFunction:file:lineNumber:description:", v98, @"WFMPMediaContentItem.m", 56, @"%s", dlerror());

LABEL_72:
    __break(1u);
  }
  id v100 = *v51;
  v136 = objc_msgSend(v137, "userInfo:");
  v252[21] = v136;
  v135 = WFLocalizedContentPropertyNameMarker(@"File Size");
  v134 = +[WFContentPropertyBuilder block:&__block_literal_global_123 name:v135 class:objc_opt_class()];
  v133 = [v134 userInfo:@"WFFileSizeProperty"];
  v132 = [v133 sortable:0];
  v131 = [v132 filterable:0];
  v130 = [v131 gettable:0];
  v252[22] = v130;
  v129 = WFLocalizedContentPropertyNameMarker(@"File Extension");
  v128 = +[WFContentPropertyBuilder block:&__block_literal_global_130 name:v129 class:objc_opt_class()];
  v127 = [v128 userInfo:@"WFFileExtensionProperty"];
  v126 = [v127 caseInsensitive:1];
  v125 = [v126 sortable:0];
  v124 = [v125 filterable:0];
  v123 = [v124 gettable:0];
  v252[23] = v123;
  v122 = WFLocalizedContentPropertyNameMarker(@"Last Modified Date");
  v121 = +[WFContentPropertyBuilder block:&__block_literal_global_135 name:v122 class:objc_opt_class()];
  v120 = [v121 userInfo:@"WFFileModificationDate"];
  v119 = [v120 tense:1];
  v118 = [v119 timeUnits:8444];
  v117 = [v118 sortable:0];
  v54 = [v117 filterable:0];
  v55 = [v54 gettable:0];
  v252[24] = v55;
  v56 = WFLocalizedContentPropertyNameMarker(@"Creation Date");
  v57 = +[WFContentPropertyBuilder block:&__block_literal_global_140_10495 name:v56 class:objc_opt_class()];
  v58 = [v57 userInfo:@"WFFileCreationDate"];
  v59 = [v58 tense:1];
  v60 = [v59 timeUnits:8444];
  v61 = [v60 sortable:0];
  v62 = [v61 filterable:0];
  v63 = [v62 gettable:0];
  v252[25] = v63;
  id v99 = [MEMORY[0x263EFF8C0] arrayWithObjects:v252 count:26];

  return v99;
}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__WFMPMediaContentItem_propertyBuilders__block_invoke_4;
  v11[3] = &unk_264288AF0;
  id v13 = v7;
  uint64_t v8 = *(void *)(a1 + 40);
  id v12 = *(id *)(a1 + 32);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(v8 + 16);
  id v10 = v7;
  v9(v8, a2, a3, v11);
}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__WFMPMediaContentItem_propertyBuilders__block_invoke_6;
  v11[3] = &unk_264287A98;
  id v12 = v7;
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(v8 + 16);
  id v10 = v7;
  v9(v8, a2, a3, v11);
}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__WFMPMediaContentItem_propertyBuilders__block_invoke_8;
  v11[3] = &unk_264287AE8;
  id v12 = v7;
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(v8 + 16);
  id v10 = v7;
  v9(v8, a2, a3, v11);
}

uint64_t __40__WFMPMediaContentItem_propertyBuilders__block_invoke_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, void))(a4 + 16))(a4, 0);
}

uint64_t __40__WFMPMediaContentItem_propertyBuilders__block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, void))(a4 + 16))(a4, 0);
}

uint64_t __40__WFMPMediaContentItem_propertyBuilders__block_invoke_12(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 getPreferredFileExtension:a4];
}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_10(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__WFMPMediaContentItem_propertyBuilders__block_invoke_11;
  v7[3] = &unk_26428A288;
  id v8 = v5;
  id v6 = v5;
  [a2 getPreferredFileSize:v7];
}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [[WFFileSize alloc] initWithByteCount:a2];
  (*(void (**)(uint64_t, WFFileSize *))(v2 + 16))(v2, v3);
}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_9(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  id v6 = NSNumber;
  id v7 = a4;
  id v11 = [a2 mediaItem];
  id v8 = getMPMediaItemPropertyArtwork();
  uint64_t v9 = [v11 valueForProperty:v8];
  id v10 = [v6 numberWithInt:v9 != 0];
  ((void (**)(void, void *))a4)[2](v7, v10);
}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (objc_class *)MEMORY[0x263F85308];
  id v4 = a2;
  id v5 = [v3 alloc];
  [v4 bounds];
  objc_msgSend(v4, "imageWithSize:", v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = (void *)[v5 initWithPlatformImage:v9];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v8);
}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_6(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  double v4 = v3;
  id v13 = [MEMORY[0x263EFF910] date];
  id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  double v6 = [v13 dateByAddingTimeInterval:v4];
  uint64_t v7 = 224;
  id v8 = [v5 components:224 fromDate:v13 toDate:v6 options:0];

  if ([v8 hour])
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v10 = [v8 minute];
    if (v10) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 0x10000;
    }
    if (v10) {
      uint64_t v7 = 224;
    }
    else {
      uint64_t v7 = 192;
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = [[WFTimeInterval alloc] initWithTimeInterval:v7 allowedUnits:0 unitsStyle:v9 zeroFormattingBehavior:v4];
  (*(void (**)(uint64_t, WFTimeInterval *))(v11 + 16))(v11, v12);
}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 unsignedIntegerValue];
  if ((v3 & (v3 - 1)) != 0)
  {
    id v8 = [*(id *)(a1 + 32) allKeys];
    uint64_t v9 = [v8 sortedArrayUsingSelector:sel_compare_];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v10 = [v9 reverseObjectEnumerator];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (([v15 unsignedIntegerValue] & v3) != 0)
          {
            uint64_t v16 = *(void *)(a1 + 40);
            v17 = [*(id *)(a1 + 32) objectForKey:v15];
            (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);

            return;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v6 = a1 + 32;
    double v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(v6 + 8);
    id v18 = [NSNumber numberWithUnsignedInteger:v3];
    uint64_t v7 = objc_msgSend(v4, "objectForKey:");
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v7);
  }
}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  uint64_t v6 = NSNumber;
  uint64_t v7 = a4;
  id v9 = [a2 mediaItem];
  id v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v9, "isExplicitItem"));
  ((void (**)(void, void *))a4)[2](v7, v8);
}

void __40__WFMPMediaContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, void *a3, void (**a4)(void, void))
{
  uint64_t v7 = a4;
  id v8 = a3;
  id v10 = [a2 mediaItem];
  id v9 = [v10 valueForProperty:v8];

  ((void (**)(void, void *))a4)[2](v7, v9);
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  if (a3)
  {
    double height = a4.height;
    double width = a4.width;
    id v8 = (objc_class *)MEMORY[0x263F85308];
    id v9 = a3;
    id v10 = [v8 alloc];
    uint64_t v11 = [(WFMPMediaContentItem *)self mediaItem];
    uint64_t v12 = [v11 artwork];
    uint64_t v13 = objc_msgSend(v12, "imageWithSize:", width, height);
    uint64_t v14 = (void *)[v10 initWithPlatformImage:v13];
    (*((void (**)(id, void *, void))a3 + 2))(v9, v14, 0);
  }
  return 1;
}

- (BOOL)getListAltText:(id)a3
{
  double v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(WFMPMediaContentItem *)self mediaItem];
  [v5 playbackDuration];
  uint64_t v7 = WFChooseFromListFormatPlaybackDuration(v6);

  if (v4) {
    v4[2](v4, v7);
  }

  return 1;
}

- (BOOL)getListSubtitle:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    double v6 = [(WFMPMediaContentItem *)self artist];
    (*((void (**)(id, void *))a3 + 2))(v5, v6);
  }
  return 1;
}

@end