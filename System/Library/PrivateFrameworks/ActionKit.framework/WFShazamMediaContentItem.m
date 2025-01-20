@interface WFShazamMediaContentItem
+ (BOOL)canLowercaseTypeDescription;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
- (WFFileType)preferredFileType;
- (WFShazamMedia)media;
- (id)appleMusicID;
- (id)appleMusicURL;
- (id)artist;
- (id)artworkURL;
- (id)isExplicit;
- (id)lyricsSnippet;
- (id)lyricsSnippetSynced;
- (id)shazamURL;
- (id)title;
- (id)videoURL;
- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5;
- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5;
- (void)getArtworkDataWithURL:(id)a3 completionHandler:(id)a4;
@end

@implementation WFShazamMediaContentItem

- (void)getArtworkDataWithURL:(id)a3 completionHandler:(id)a4
{
  v5 = (void *)MEMORY[0x263EFC640];
  id v6 = a4;
  id v7 = a3;
  objc_msgSend(v5, "wf_sharedSession");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = [v9 dataTaskWithURL:v7 completionHandler:v6];

  [v8 resume];
}

- (WFFileType)preferredFileType
{
  return (WFFileType *)[MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC20]];
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  v26[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = NSStringFromClass(a5);
  int v9 = [@"WFiTunesMediaTrackObject" isEqualToString:v8];

  if (v9)
  {
    v10 = [(WFShazamMediaContentItem *)self appleMusicID];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      v12 = objc_opt_new();
      v13 = [(WFShazamMediaContentItem *)self appleMusicID];
      v26[0] = v13;
      v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
      v15 = [MEMORY[0x263EFF960] currentLocale];
      v16 = [v15 countryCode];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __74__WFShazamMediaContentItem_generateObjectRepresentation_options_forClass___block_invoke;
      v23[3] = &unk_264E5AB38;
      v23[4] = self;
      id v24 = v7;
      Class v25 = a5;
      [v12 lookupMediaWithIdentifiers:v14 countryCode:v16 completion:v23];
    }
    else
    {
      v18 = NSString;
      v19 = WFLocalizedString(@"'%@' was not found in Apple Music");
      v20 = [(WFShazamMediaContentItem *)self name];
      v21 = objc_msgSend(v18, "localizedStringWithFormat:", v19, v20);

      v22 = [(id)objc_opt_class() badCoercionErrorWithReasonString:v21];
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v22);
    }
  }
  else
  {
    v17 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v17);
  }
}

void __74__WFShazamMediaContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 firstObject];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {

    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = [(id)objc_opt_class() badCoercionErrorForObjectClass:*(void *)(a1 + 48)];
    v3 = *(void (**)(void))(v4 + 16);
    id v6 = (id)v5;
  }
  v3();
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 conformsToUTType:*MEMORY[0x263F1DB18]])
  {
    uint64_t v11 = [(WFShazamMediaContentItem *)self artworkURL];

    if (v11)
    {
      v12 = [(WFShazamMediaContentItem *)self artworkURL];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __71__WFShazamMediaContentItem_generateFileRepresentation_options_forType___block_invoke;
      v15[3] = &unk_264E5B258;
      v15[4] = self;
      id v16 = v8;
      [(WFShazamMediaContentItem *)self getArtworkDataWithURL:v12 completionHandler:v15];
    }
    else
    {
      v13 = [(id)objc_opt_class() badCoercionErrorForType:v10];
      (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v13);
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)WFShazamMediaContentItem;
    [(WFShazamMediaContentItem *)&v14 generateFileRepresentation:v8 options:v9 forType:v10];
  }
}

void __71__WFShazamMediaContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a2;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x263F33870];
    id v8 = (void *)MEMORY[0x263F852B8];
    uint64_t v9 = *MEMORY[0x263F1DB40];
    id v10 = a4;
    uint64_t v11 = [v8 typeWithUTType:v9];
    v12 = [*(id *)(a1 + 32) name];
    v13 = [v7 fileWithData:v6 ofType:v11 proposedFilename:v12];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v14 = a4;
    v15 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315138;
      v17 = "-[WFShazamMediaContentItem generateFileRepresentation:options:forType:]_block_invoke";
      _os_log_impl(&dword_23C364000, v15, OS_LOG_TYPE_ERROR, "%s Coercion of WFShazamMediaContentItem to image failed because Shazam returned nil artworkData", (uint8_t *)&v16, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)lyricsSnippetSynced
{
  v2 = [(WFShazamMediaContentItem *)self media];
  v3 = [v2 lyricsSnippetSynced];

  return v3;
}

- (id)lyricsSnippet
{
  v2 = [(WFShazamMediaContentItem *)self media];
  v3 = [v2 lyricsSnippet];

  return v3;
}

- (id)videoURL
{
  v2 = [(WFShazamMediaContentItem *)self media];
  v3 = [v2 videoURL];

  return v3;
}

- (id)isExplicit
{
  v2 = NSNumber;
  v3 = [(WFShazamMediaContentItem *)self media];
  uint64_t v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isExplicit"));

  return v4;
}

- (id)appleMusicURL
{
  v2 = [(WFShazamMediaContentItem *)self media];
  v3 = [v2 appleMusicURL];

  return v3;
}

- (id)shazamURL
{
  v2 = [(WFShazamMediaContentItem *)self media];
  v3 = [v2 shazamURL];

  return v3;
}

- (id)artworkURL
{
  v2 = [(WFShazamMediaContentItem *)self media];
  v3 = [v2 artworkURL];

  return v3;
}

- (id)title
{
  v2 = [(WFShazamMediaContentItem *)self media];
  v3 = [v2 title];

  return v3;
}

- (id)artist
{
  v2 = [(WFShazamMediaContentItem *)self media];
  v3 = [v2 artist];

  return v3;
}

- (id)appleMusicID
{
  v2 = [(WFShazamMediaContentItem *)self media];
  v3 = [v2 appleMusicID];

  return v3;
}

- (WFShazamMedia)media
{
  uint64_t v3 = objc_opt_class();
  return (WFShazamMedia *)[(WFShazamMediaContentItem *)self objectForClass:v3];
}

+ (BOOL)canLowercaseTypeDescription
{
  return 0;
}

+ (id)propertyBuilders
{
  v37[10] = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v3 = (void *)MEMORY[0x263F33808];
    v36 = WFLocalizedContentPropertyNameMarker(@"Apple Music ID");
    v35 = [v3 keyPath:@"appleMusicID" name:v36 class:objc_opt_class()];
    v37[0] = v35;
    uint64_t v4 = (void *)MEMORY[0x263F33808];
    v34 = WFLocalizedContentPropertyNameMarker(@"Artist");
    v33 = [v4 keyPath:@"artist" name:v34 class:objc_opt_class()];
    v37[1] = v33;
    uint64_t v5 = (void *)MEMORY[0x263F33808];
    v32 = WFLocalizedContentPropertyNameMarker(@"Title");
    v31 = [v5 keyPath:@"title" name:v32 class:objc_opt_class()];
    v37[2] = v31;
    id v6 = (void *)MEMORY[0x263F33808];
    v29 = WFLocalizedContentPropertyNameMarker(@"Is Explicit");
    v30 = [NSNumber numberWithBool:1];
    v28 = [v6 keyPath:@"isExplicit" name:v29 class:objc_opt_class()];
    v27 = WFLocalizedContentPropertyNameMarker(@"Is Not Explicit");
    v26 = [v28 negativeName:v27];
    v37[3] = v26;
    id v7 = (void *)MEMORY[0x263F33808];
    Class v25 = WFLocalizedContentPropertyNameMarker(@"Lyrics Snippet");
    id v24 = [v7 keyPath:@"lyricsSnippet" name:v25 class:objc_opt_class()];
    v37[4] = v24;
    id v8 = (void *)MEMORY[0x263F33808];
    v23 = WFLocalizedContentPropertyNameMarker(@"Lyric Snippet Synced");
    uint64_t v9 = [v8 keyPath:@"lyricsSnippetSynced" name:v23 class:objc_opt_class()];
    v37[5] = v9;
    id v10 = (void *)MEMORY[0x263F33808];
    uint64_t v11 = WFLocalizedContentPropertyNameMarker(@"Artwork");
    v12 = [v10 block:&__block_literal_global_37253 name:v11 class:objc_opt_class()];
    v37[6] = v12;
    v13 = (void *)MEMORY[0x263F33808];
    id v14 = WFLocalizedContentPropertyNameMarker(@"Video URL");
    v15 = [v13 keyPath:@"videoURL" name:v14 class:objc_opt_class()];
    v37[7] = v15;
    int v16 = (void *)MEMORY[0x263F33808];
    v17 = WFLocalizedContentPropertyNameMarker(@"Shazam URL");
    uint64_t v18 = [v16 keyPath:@"shazamURL" name:v17 class:objc_opt_class()];
    v37[8] = v18;
    v19 = (void *)MEMORY[0x263F33808];
    v20 = WFLocalizedContentPropertyNameMarker(@"Apple Music URL");
    v21 = [v19 keyPath:@"appleMusicURL" name:v20 class:objc_opt_class()];
    v37[9] = v21;
    v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:10];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __44__WFShazamMediaContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = a4;
  id v7 = [v5 artworkURL];

  if (v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __44__WFShazamMediaContentItem_propertyBuilders__block_invoke_2;
    v8[3] = &unk_264E5E670;
    id v9 = v6;
    [v5 getObjectRepresentation:v8 forClass:objc_opt_class()];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

uint64_t __44__WFShazamMediaContentItem_propertyBuilders__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Shazam media");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = WFLocalizedStringResourceWithKey(@"Shazam media (Plural)", @"Shazam media");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = WFLocalizedStringResourceWithKey(@"Shazam media (Single)", @"Shazam media");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F33A30];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  uint64_t v4 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB18]];
  id v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  uint64_t v4 = objc_msgSend(v2, "orderedSetWithObjects:", v3, 0);

  return v4;
}

@end