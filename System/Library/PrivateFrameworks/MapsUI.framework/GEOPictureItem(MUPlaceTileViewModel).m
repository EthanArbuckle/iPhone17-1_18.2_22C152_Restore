@interface GEOPictureItem(MUPlaceTileViewModel)
- (id)footerAttributedStringForFont:()MUPlaceTileViewModel;
- (uint64_t)expectedNumberOfFooterLines;
- (uint64_t)fetchBadgeIconWithCompletion:()MUPlaceTileViewModel;
- (uint64_t)fetchFallbackIconWithCompletion:()MUPlaceTileViewModel;
- (uint64_t)subtitleAttributedStringForFont:()MUPlaceTileViewModel;
- (void)fetchImageTilewWithSize:()MUPlaceTileViewModel completion:;
@end

@implementation GEOPictureItem(MUPlaceTileViewModel)

- (void)fetchImageTilewWithSize:()MUPlaceTileViewModel completion:
{
  id v8 = a5;
  v9 = [MEMORY[0x1E4F31038] sharedInstance];
  [v9 screenScale];
  double v11 = v10;

  v12 = [MEMORY[0x1E4F646D0] defaultPhotoOptionsWithAllowSmaller:1];
  v13 = [a1 photo];
  v14 = objc_msgSend(v13, "bestPhotoForFrameSize:displayScale:options:", v12, a2, a3, v11);

  v15 = [v14 url];

  if (v15)
  {
    v16 = [MEMORY[0x1E4F30E38] sharedImageManager];
    v17 = [v14 url];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__GEOPictureItem_MUPlaceTileViewModel__fetchImageTilewWithSize_completion___block_invoke;
    v18[3] = &unk_1E574F678;
    id v19 = v8;
    double v20 = a2;
    double v21 = a3;
    double v22 = v11;
    [v16 loadAppImageAtURL:v17 completionHandler:v18];
  }
  else
  {
    (*((void (**)(id, void, void, void))v8 + 2))(v8, 0, 0, 0);
  }
}

- (uint64_t)fetchBadgeIconWithCompletion:()MUPlaceTileViewModel
{
  if (a3) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(a3 + 16))(a3, 0, 0, 0);
  }
  return result;
}

- (uint64_t)fetchFallbackIconWithCompletion:()MUPlaceTileViewModel
{
  if (a3) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(a3 + 16))(a3, 0, 0, 0);
  }
  return result;
}

- (uint64_t)subtitleAttributedStringForFont:()MUPlaceTileViewModel
{
  return 0;
}

- (id)footerAttributedStringForFont:()MUPlaceTileViewModel
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 tileSubtitle];
  id v6 = v4;
  if ([v5 length])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v8 = [MEMORY[0x1E4FB1618] systemGrayColor];
    uint64_t v9 = *MEMORY[0x1E4FB0700];
    v15[0] = *MEMORY[0x1E4FB06F8];
    v15[1] = v9;
    v16[0] = v6;
    v16[1] = v8;
    double v10 = (void *)MEMORY[0x1E4F1C9E8];
    id v11 = v6;
    v12 = [v10 dictionaryWithObjects:v16 forKeys:v15 count:2];

    v13 = (void *)[v7 initWithString:v5 attributes:v12];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (uint64_t)expectedNumberOfFooterLines
{
  return 2;
}

@end