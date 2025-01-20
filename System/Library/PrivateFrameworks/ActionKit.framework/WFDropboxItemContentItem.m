@interface WFDropboxItemContentItem
+ (BOOL)isAvailableOnPlatform:(int64_t)a3;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
- (BOOL)canEncodeWithCoder:(id)a3;
- (BOOL)getListAltText:(id)a3;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (BOOL)hasStringOutput;
- (id)metadata;
- (id)outputTypes;
- (id)overrideFilename;
- (id)representedFileType;
- (id)representedFilename;
- (id)richListTitle;
- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5;
- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5;
- (void)getPreferredFileExtension:(id)a3;
- (void)getPreferredFileSize:(id)a3;
@end

@implementation WFDropboxItemContentItem

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  v5 = (void (**)(id, void *, void))a3;
  v6 = [(WFDropboxItemContentItem *)self metadata];
  int v7 = [v6 isDirectory];

  if (v7)
  {
    v8 = [MEMORY[0x263F85308] actionKitImageNamed:@"Folder"];
    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v9 = [(WFDropboxItemContentItem *)self preferredFileType];
  v8 = [v9 documentIcon];

  if (v5) {
LABEL_5:
  }
    v5[2](v5, v8, 0);
LABEL_6:

  return v8 != 0;
}

- (BOOL)getListAltText:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(WFDropboxItemContentItem *)self metadata];
  char v6 = [v5 isDirectory];
  if ((v6 & 1) == 0)
  {
    id v7 = objc_alloc(MEMORY[0x263F33878]);
    v8 = [v5 fileSize];
    v9 = objc_msgSend(v7, "initWithByteCount:", objc_msgSend(v8, "longLongValue"));

    if (v4)
    {
      v10 = [v9 formattedString];
      v4[2](v4, v10);
    }
  }

  return v6 ^ 1;
}

- (BOOL)getListSubtitle:(id)a3
{
  v4 = (void (**)(id, id))a3;
  if (v4)
  {
    v5 = [(WFDropboxItemContentItem *)self metadata];
    int v6 = [v5 isDirectory];

    if (v6)
    {
      WFLocalizedString(@"Folder");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v7);
    }
    else
    {
      v8 = [(WFDropboxItemContentItem *)self metadata];
      v9 = [v8 clientModifiedDate];
      v10 = v9;
      if (v9)
      {
        id v7 = v9;
      }
      else
      {
        v11 = [(WFDropboxItemContentItem *)self metadata];
        id v7 = [v11 serverModifiedDate];
      }
      id v12 = objc_alloc_init(MEMORY[0x263F08790]);
      [v12 setDoesRelativeDateFormatting:1];
      [v12 setDateStyle:1];
      [v7 timeIntervalSinceNow];
      [v12 setTimeStyle:fabs(v13) < 172800.0];
      v14 = [v12 stringFromDate:v7];
      v4[2](v4, v14);
    }
  }

  return 1;
}

- (id)richListTitle
{
  v2 = [(WFDropboxItemContentItem *)self metadata];
  v3 = [v2 name];

  return v3;
}

- (BOOL)canEncodeWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 wfFileCoder];
  if (v4)
  {
    v5 = [v3 wfFileCoder];
    BOOL v6 = [v5 targetPlatform] == 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)getPreferredFileExtension:(id)a3
{
  id v5 = a3;
  id v7 = [(WFDropboxItemContentItem *)self representedFilename];
  BOOL v6 = [v7 pathExtension];
  (*((void (**)(id, void *))a3 + 2))(v5, v6);
}

- (void)getPreferredFileSize:(id)a3
{
  id v5 = a3;
  id v7 = [(WFDropboxItemContentItem *)self metadata];
  BOOL v6 = [v7 fileSize];
  (*((void (**)(id, uint64_t))a3 + 2))(v5, [v6 longLongValue]);
}

- (id)representedFilename
{
  id v3 = [(WFDropboxItemContentItem *)self overrideFilename];
  v4 = [v3 pathExtension];
  if ([v4 length])
  {
    id v5 = [MEMORY[0x263F852B8] typeFromFilename:v3];
    int v6 = [v5 isDeclared];

    if (v6)
    {
      id v7 = v3;
      goto LABEL_6;
    }
  }
  else
  {
  }
  v8 = [(WFDropboxItemContentItem *)self metadata];
  id v7 = [v8 name];

LABEL_6:
  return v7;
}

- (id)representedFileType
{
  v2 = (void *)MEMORY[0x263F852B8];
  id v3 = [(WFDropboxItemContentItem *)self representedFilename];
  v4 = [v2 typeFromFilename:v3];

  return v4;
}

- (id)overrideFilename
{
  v2 = [(WFDropboxItemContentItem *)self objectRepresentationForClass:objc_opt_class()];
  id v3 = [v2 specifiedName];

  return v3;
}

- (id)outputTypes
{
  id v3 = [(WFDropboxItemContentItem *)self representedFileType];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC20]];
  }
  v4 = [MEMORY[0x263EFF9D8] orderedSetWithObject:v3];
  v8.receiver = self;
  v8.super_class = (Class)WFDropboxItemContentItem;
  id v5 = [(WFDropboxItemContentItem *)&v8 outputTypes];
  int v6 = [v4 orderedSetByAddingObjectsFromOrderedSet:v5];

  return v6;
}

- (BOOL)hasStringOutput
{
  v2 = [(WFDropboxItemContentItem *)self representedFileType];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 conformsToUTType:*MEMORY[0x263F1DC20]];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v7 = a3;
  if ((Class)objc_opt_class() == a5)
  {
    v9 = +[WFAccount accounts];
    v10 = [v9 firstObject];

    v11 = objc_alloc_init(WFDropboxSessionManager);
    id v12 = [v10 credential];
    [(WFDropboxSessionManager *)v11 setCredential:v12];

    double v13 = [(WFDropboxItemContentItem *)self metadata];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __74__WFDropboxItemContentItem_generateObjectRepresentation_options_forClass___block_invoke;
    v14[3] = &unk_264E5BF00;
    v14[4] = self;
    id v15 = v7;
    [(WFDropboxSessionManager *)v11 getSharedLinkForFile:v13 completionHandler:v14];
  }
  else
  {
    objc_super v8 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v8);
  }
}

void __74__WFDropboxItemContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 metadata];
  objc_super v8 = [v9 name];
  (*(void (**)(uint64_t, id, void *, id))(v4 + 16))(v4, v7, v8, v6);
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v6 = (void (**)(id, void *, void))a3;
  id v7 = +[WFAccount accounts];
  objc_super v8 = [v7 firstObject];

  id v9 = objc_alloc_init(WFDropboxSessionManager);
  v10 = [v8 credential];
  [(WFDropboxSessionManager *)v9 setCredential:v10];

  v11 = [(WFDropboxItemContentItem *)self metadata];
  if ([v11 isDirectory])
  {
    id v12 = (void *)MEMORY[0x263F33870];
    double v13 = (void *)MEMORY[0x263F339A0];
    v14 = [v11 name];
    id v15 = [v13 createTemporaryDirectoryWithFilename:v14];
    v16 = [v12 fileWithURL:v15 options:1];

    v6[2](v6, v16, 0);
  }
  else
  {
    v17 = [(WFDropboxItemContentItem *)self representedFileType];
    v18 = [(WFDropboxItemContentItem *)self name];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __71__WFDropboxItemContentItem_generateFileRepresentation_options_forType___block_invoke;
    v19[3] = &unk_264E5BED8;
    v20 = v6;
    [(WFDropboxSessionManager *)v9 downloadFile:v11 ofType:v17 proposedFilename:v18 completionHandler:v19];
  }
}

uint64_t __71__WFDropboxItemContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)metadata
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFDropboxItemContentItem *)self objectForClass:v3];
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Dropbox files");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = WFLocalizedStringResourceWithKey(@"Dropbox files", @"Dropbox files");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v4 = WFLocalizedStringResourceWithKey(@"Dropbox file", @"Dropbox file");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F33A20];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  uint64_t v4 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DA48]];
  id v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  uint64_t v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (BOOL)isAvailableOnPlatform:(int64_t)a3
{
  return a3 == 0;
}

+ (id)stringConversionBehavior
{
  v2 = (void *)MEMORY[0x263F337E0];
  id v3 = [a1 propertyForName:@"Name"];
  uint64_t v4 = [v2 accessingProperty:v3];

  return v4;
}

+ (id)propertyBuilders
{
  v12[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F33808] block:&__block_literal_global_44459 name:@"Creation Date" class:objc_opt_class()];
  id v3 = [v2 userInfo:*MEMORY[0x263F33AF0]];
  uint64_t v4 = [v3 tense:1];
  id v5 = [v4 timeUnits:8444];
  v12[0] = v5;
  id v6 = [MEMORY[0x263F33808] block:&__block_literal_global_173 name:@"Last Modified Date" class:objc_opt_class()];
  id v7 = [v6 userInfo:*MEMORY[0x263F33AF8]];
  objc_super v8 = [v7 tense:1];
  id v9 = [v8 timeUnits:8444];
  v12[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  return v10;
}

void __44__WFDropboxItemContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a2;
  id v5 = a4;
  id v6 = [v10 metadata];
  id v7 = [v6 clientModifiedDate];
  if (v7)
  {
    v5[2](v5, v7);
  }
  else
  {
    objc_super v8 = [v10 metadata];
    id v9 = [v8 serverModifiedDate];
    v5[2](v5, v9);
  }
}

uint64_t __44__WFDropboxItemContentItem_propertyBuilders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, void))(a4 + 16))(a4, 0);
}

@end