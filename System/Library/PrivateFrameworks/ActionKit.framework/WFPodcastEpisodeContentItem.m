@interface WFPodcastEpisodeContentItem
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (BOOL)loadsListThumbnailAsynchronously;
- (WFFileType)preferredFileType;
- (id)episode;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)getArtworkURLForSize:(CGSize)a3 type:(id)a4;
- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5;
- (void)getArtworkDataWithURL:(id)a3 completionHandler:(id)a4;
@end

@implementation WFPodcastEpisodeContentItem

- (WFFileType)preferredFileType
{
  return (WFFileType *)[MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC20]];
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ((Class)objc_opt_class() != a3)
  {
    v28.receiver = self;
    v28.super_class = (Class)WFPodcastEpisodeContentItem;
    v9 = [(WFPodcastEpisodeContentItem *)&v28 generateObjectRepresentationForClass:a3 options:v8 error:a5];
    goto LABEL_13;
  }
  v10 = [(WFPodcastEpisodeContentItem *)self episode];
  v11 = [v10 author];
  if (v11)
  {
    v12 = NSString;
    v13 = WFLocalizedString(@"%1$@ by %2$@");
    v14 = [v10 title];
    v15 = objc_msgSend(v12, "localizedStringWithFormat:", v13, v14, v11);
  }
  else
  {
    v15 = [v10 title];
  }
  uint64_t v16 = [v15 length];
  v17 = [v10 viewURL];
  v18 = v17;
  if (!v16)
  {
    id v24 = [v17 absoluteString];
LABEL_11:
    v23 = v24;
    goto LABEL_12;
  }
  if (!v17)
  {
    id v24 = v15;
    goto LABEL_11;
  }
  v19 = NSString;
  v20 = WFLocalizedString(@"%1$@ (%2$@)");
  v21 = [v10 viewURL];
  v22 = [v21 absoluteString];
  v23 = objc_msgSend(v19, "localizedStringWithFormat:", v20, v15, v22);

LABEL_12:
  v25 = (void *)MEMORY[0x263F33908];
  v26 = [(WFPodcastEpisodeContentItem *)self name];
  v9 = [v25 object:v23 named:v26];

LABEL_13:
  return v9;
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 conformsToUTType:*MEMORY[0x263F1DB18]])
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__21951;
    v17[4] = __Block_byref_object_dispose__21952;
    id v18 = 0;
    v11 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DAE8]];
    v12 = -[WFPodcastEpisodeContentItem getArtworkURLForSize:type:](self, "getArtworkURLForSize:type:", v11, 512.0, 512.0);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __74__WFPodcastEpisodeContentItem_generateFileRepresentation_options_forType___block_invoke;
    v14[3] = &unk_264E5E7F0;
    uint64_t v16 = v17;
    v14[4] = self;
    id v15 = v8;
    [(WFPodcastEpisodeContentItem *)self getArtworkDataWithURL:v12 completionHandler:v14];

    _Block_object_dispose(v17, 8);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFPodcastEpisodeContentItem;
    [(WFPodcastEpisodeContentItem *)&v13 generateFileRepresentation:v8 options:v9 forType:v10];
  }
}

void __74__WFPodcastEpisodeContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v6 = (void *)MEMORY[0x263F33870];
  v7 = (void *)MEMORY[0x263F852B8];
  uint64_t v8 = *MEMORY[0x263F1DAE8];
  id v15 = a4;
  id v9 = a2;
  id v10 = [v7 typeWithUTType:v8];
  v11 = [*(id *)(a1 + 32) name];
  uint64_t v12 = [v6 fileWithData:v9 ofType:v10 proposedFilename:v11];

  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getArtworkDataWithURL:(id)a3 completionHandler:(id)a4
{
  v5 = (void *)MEMORY[0x263EFC640];
  id v6 = a4;
  id v7 = a3;
  objc_msgSend(v5, "wf_sharedSession");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v9 dataTaskWithURL:v7 completionHandler:v6];

  [v8 resume];
}

- (id)getArtworkURLForSize:(CGSize)a3 type:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  uint64_t v8 = [(WFPodcastEpisodeContentItem *)self episode];
  id v9 = [v8 artworkURLTemplate];
  id v10 = (void *)[v9 mutableCopy];

  double v11 = height * 3.0;
  *(float *)&double v11 = height * 3.0;
  uint64_t v12 = [NSNumber numberWithFloat:v11];
  uint64_t v13 = [v12 stringValue];
  objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", @"{h}", v13, 0, 0, objc_msgSend(v10, "length"));

  double v14 = width * 3.0;
  *(float *)&double v14 = width * 3.0;
  id v15 = [NSNumber numberWithFloat:v14];
  uint64_t v16 = [v15 stringValue];
  objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", @"{w}", v16, 0, 0, objc_msgSend(v10, "length"));

  v17 = [v7 fileExtension];

  objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", @"{f}", v17, 0, 0, objc_msgSend(v10, "length"));
  id v18 = [NSURL URLWithString:v10];

  return v18;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DAE8]];
    id v9 = -[WFPodcastEpisodeContentItem getArtworkURLForSize:type:](self, "getArtworkURLForSize:type:", v8, width, height);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __56__WFPodcastEpisodeContentItem_getListThumbnail_forSize___block_invoke;
    v11[3] = &unk_264E5EC38;
    id v12 = v7;
    [(WFPodcastEpisodeContentItem *)self getArtworkDataWithURL:v9 completionHandler:v11];
  }
  return 1;
}

void __56__WFPodcastEpisodeContentItem_getListThumbnail_forSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__WFPodcastEpisodeContentItem_getListThumbnail_forSize___block_invoke_2;
  v6[3] = &unk_264E5EE18;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __56__WFPodcastEpisodeContentItem_getListThumbnail_forSize___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v1)
  {
    id v5 = [MEMORY[0x263F85308] imageWithData:v1 scale:0 allowAnimated:1.0];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
  else
  {
    id v3 = *(void (**)(uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4, 0);
  }
}

- (BOOL)loadsListThumbnailAsynchronously
{
  return 1;
}

- (BOOL)getListSubtitle:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(WFPodcastEpisodeContentItem *)self episode];
    id v7 = [v6 author];
    (*((void (**)(id, void *))a3 + 2))(v5, v7);
  }
  return 1;
}

- (id)episode
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFPodcastEpisodeContentItem *)self objectForClass:v3];
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d podcast episodes");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = WFLocalizedStringResourceWithKey(@"Podcast episodes", @"Podcast episodes");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = WFLocalizedStringResourceWithKey(@"Podcast episode", @"Podcast episode");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)outputTypes
{
  uint64_t v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  uint64_t v4 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB18]];
  id v5 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  id v6 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);

  return v6;
}

+ (id)ownedTypes
{
  uint64_t v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  uint64_t v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)propertyBuilders
{
  v35[10] = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    id v3 = (void *)MEMORY[0x263F33808];
    v34 = WFLocalizedContentPropertyNameMarker(@"Store ID");
    v33 = [v3 keyPath:@"episode.identifier" name:v34 class:objc_opt_class()];
    v35[0] = v33;
    uint64_t v4 = (void *)MEMORY[0x263F33808];
    v32 = WFLocalizedContentPropertyNameMarker(@"Store URL");
    v31 = [v4 keyPath:@"episode.viewURL" name:v32 class:objc_opt_class()];
    v35[1] = v31;
    id v5 = (void *)MEMORY[0x263F33808];
    v30 = WFLocalizedContentPropertyNameMarker(@"Title");
    v29 = [v5 keyPath:@"episode.title" name:v30 class:objc_opt_class()];
    v35[2] = v29;
    id v6 = (void *)MEMORY[0x263F33808];
    objc_super v28 = WFLocalizedContentPropertyNameMarker(@"Author");
    v27 = [v6 keyPath:@"episode.author" name:v28 class:objc_opt_class()];
    v35[3] = v27;
    id v7 = (void *)MEMORY[0x263F33808];
    v26 = WFLocalizedContentPropertyNameMarker(@"Description");
    v25 = [v7 keyPath:@"episode.descriptionText" name:v26 class:objc_opt_class()];
    v35[4] = v25;
    id v8 = (void *)MEMORY[0x263F33808];
    id v24 = WFLocalizedContentPropertyNameMarker(@"Release Date");
    v23 = [v8 keyPath:@"episode.releaseDate" name:v24 class:objc_opt_class()];
    v35[5] = v23;
    id v9 = (void *)MEMORY[0x263F33808];
    v22 = WFLocalizedContentPropertyNameMarker(@"Genres");
    id v10 = [v9 keyPath:@"episode.genres" name:v22 class:objc_opt_class()];
    double v11 = [v10 multipleValues:1];
    v35[6] = v11;
    id v12 = (void *)MEMORY[0x263F33808];
    uint64_t v13 = WFLocalizedContentPropertyNameMarker(@"Duration");
    double v14 = [v12 keyPath:@"episode.duration" name:v13 class:objc_opt_class()];
    v35[7] = v14;
    id v15 = (void *)MEMORY[0x263F33808];
    uint64_t v16 = WFLocalizedContentPropertyNameMarker(@"Artwork");
    v17 = [v15 block:&__block_literal_global_22017 name:v16 class:objc_opt_class()];
    v35[8] = v17;
    id v18 = (void *)MEMORY[0x263F33808];
    v19 = WFLocalizedContentPropertyNameMarker(@"Artwork URL");
    v20 = [v18 block:&__block_literal_global_257 name:v19 class:objc_opt_class()];
    v35[9] = v20;
    uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:10];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

void __47__WFPodcastEpisodeContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  id v6 = (void *)MEMORY[0x263F852B8];
  uint64_t v7 = *MEMORY[0x263F1DAE8];
  id v8 = a4;
  id v9 = a2;
  id v11 = [v6 typeWithUTType:v7];
  id v10 = objc_msgSend(v9, "getArtworkURLForSize:type:", v11, 512.0, 512.0);

  ((void (**)(void, void *))a4)[2](v8, v10);
}

void __47__WFPodcastEpisodeContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__WFPodcastEpisodeContentItem_propertyBuilders__block_invoke_2;
  v8[3] = &unk_264E5E670;
  id v9 = v5;
  id v6 = v5;
  id v7 = a2;
  [v7 getObjectRepresentation:v8 forClass:objc_opt_class()];
}

uint64_t __47__WFPodcastEpisodeContentItem_propertyBuilders__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end