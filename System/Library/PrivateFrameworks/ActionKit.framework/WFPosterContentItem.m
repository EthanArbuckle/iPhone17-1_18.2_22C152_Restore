@interface WFPosterContentItem
+ (BOOL)canLowercaseTypeDescription;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (BOOL)loadsListThumbnailAsynchronously;
- (id)poster;
- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5;
@end

@implementation WFPosterContentItem

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F33A38];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFF9D8];
  v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v7[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  v5 = [v2 orderedSetWithArray:v4];

  return v5;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (BOOL)canLowercaseTypeDescription
{
  return 1;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Wallpapers");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Wallpapers", @"Wallpapers");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Wallpaper", @"Wallpaper");
  v5 = [v3 localize:v4];

  return v5;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__WFPosterContentItem_getListThumbnail_forSize___block_invoke;
  v8[3] = &unk_264E5E670;
  id v9 = v5;
  id v6 = v5;
  [(WFPosterContentItem *)self getObjectRepresentation:v8 forClass:objc_opt_class()];

  return 1;
}

void __48__WFPosterContentItem_getListThumbnail_forSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__WFPosterContentItem_getListThumbnail_forSize___block_invoke_2;
  v6[3] = &unk_264E5EE18;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __48__WFPosterContentItem_getListThumbnail_forSize___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (BOOL)loadsListThumbnailAsynchronously
{
  return 1;
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  if ((Class)objc_opt_class() == a5)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    v11 = (void *)getPRSServiceClass_softClass_54192;
    uint64_t v21 = getPRSServiceClass_softClass_54192;
    if (!getPRSServiceClass_softClass_54192)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __getPRSServiceClass_block_invoke_54193;
      v17[3] = &unk_264E5EC88;
      v17[4] = &v18;
      __getPRSServiceClass_block_invoke_54193((uint64_t)v17);
      v11 = (void *)v19[3];
    }
    v12 = v11;
    _Block_object_dispose(&v18, 8);
    id v13 = objc_alloc_init(v12);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __69__WFPosterContentItem_generateObjectRepresentation_options_forClass___block_invoke;
    v14[3] = &unk_264E5E648;
    id v15 = v13;
    id v16 = v8;
    v14[4] = self;
    id v10 = v13;
    [v10 fetchPosterConfigurationsForRole:0 completion:v14];
  }
  else
  {
    id v10 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
    (*((void (**)(id, void, void, id))v8 + 2))(v8, 0, 0, v10);
  }
}

void __69__WFPosterContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __69__WFPosterContentItem_generateObjectRepresentation_options_forClass___block_invoke_2;
    v16[3] = &unk_264E5E5F8;
    v16[4] = *(void *)(a1 + 32);
    id v7 = objc_msgSend(v5, "if_firstObjectPassingTest:", v16);
    if (!v7)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_9;
    }
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    id v8 = (void *)getPRSPosterSnapshotRequestClass_softClass;
    uint64_t v21 = getPRSPosterSnapshotRequestClass_softClass;
    if (!getPRSPosterSnapshotRequestClass_softClass)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __getPRSPosterSnapshotRequestClass_block_invoke;
      v17[3] = &unk_264E5EC88;
      v17[4] = &v18;
      __getPRSPosterSnapshotRequestClass_block_invoke((uint64_t)v17);
      id v8 = (void *)v19[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v18, 8);
    id v10 = (void *)[[v9 alloc] initWithConfiguration:v7 variantType:0 options:0];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __69__WFPosterContentItem_generateObjectRepresentation_options_forClass___block_invoke_3;
    v14[3] = &unk_264E5E620;
    v11 = *(void **)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    v14[4] = *(void *)(a1 + 32);
    id v15 = v12;
    [v11 fetchPosterSnapshotsWithRequest:v10 completion:v14];
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 48);
    id v7 = WFLocalizedString(@"Show Wallpaper");
    id v10 = WFSanitizedPostersError();
    (*(void (**)(uint64_t, void, void, void *))(v13 + 16))(v13, 0, 0, v10);
  }

LABEL_9:
}

uint64_t __69__WFPosterContentItem_generateObjectRepresentation_options_forClass___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 serverUUID];
  id v4 = [*(id *)(a1 + 32) poster];
  id v5 = [v4 UUID];
  uint64_t v6 = [v3 isEqual:v5];

  return v6;
}

void __69__WFPosterContentItem_generateObjectRepresentation_options_forClass___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v13 = a3;
  id v5 = [a2 snapshots];
  uint64_t v6 = [v5 firstObject];

  if (v6)
  {
    uint64_t v7 = [v6 image];
    id v8 = (void *)[objc_alloc(MEMORY[0x263F85308]) initWithCGImage:v7 scale:1 orientation:1.0];
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [*(id *)(a1 + 32) poster];
    v11 = [v10 name];
    (*(void (**)(uint64_t, void *, void *, void))(v9 + 16))(v9, v8, v11, 0);
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 40);
    id v8 = WFLocalizedString(@"Show Wallpaper");
    id v10 = WFSanitizedPostersError();
    (*(void (**)(uint64_t, void, void, void *))(v12 + 16))(v12, 0, 0, v10);
  }
}

- (id)poster
{
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  id v4 = [(WFPosterContentItem *)self getRepresentationsForType:v3 error:0];
  id v5 = [v4 firstObject];
  uint64_t v6 = [v5 object];

  return v6;
}

@end