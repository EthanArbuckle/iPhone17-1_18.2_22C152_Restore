@interface GEOPlaceTemplate(MUPlaceTileViewModel)
- (id)footerAttributedStringForFont:()MUPlaceTileViewModel;
- (id)subtitleAttributedStringForFont:()MUPlaceTileViewModel;
- (uint64_t)expectedNumberOfFooterLines;
- (void)fetchBadgeIconWithCompletion:()MUPlaceTileViewModel;
- (void)fetchFallbackIconWithCompletion:()MUPlaceTileViewModel;
- (void)fetchImageTilewWithSize:()MUPlaceTileViewModel completion:;
@end

@implementation GEOPlaceTemplate(MUPlaceTileViewModel)

- (void)fetchFallbackIconWithCompletion:()MUPlaceTileViewModel
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [a1 styleAttributes];
    _MUFetchBadgeIconWithStyleAttributes(v5, 1, v4);
  }
}

- (void)fetchBadgeIconWithCompletion:()MUPlaceTileViewModel
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [a1 styleAttributes];
    _MUFetchBadgeIconWithStyleAttributes(v5, 0, v4);
  }
}

- (void)fetchImageTilewWithSize:()MUPlaceTileViewModel completion:
{
  id v8 = a5;
  v9 = [MEMORY[0x1E4F31038] sharedInstance];
  [v9 screenScale];
  double v11 = v10;

  v12 = [MEMORY[0x1E4F646D0] defaultPhotoOptionsWithAllowSmaller:1];
  v13 = [a1 heroImage];
  v14 = objc_msgSend(v13, "bestPhotoForFrameSize:displayScale:options:", v12, a2, a3, v11);

  v15 = [v14 url];

  if (v15)
  {
    v16 = [MEMORY[0x1E4F30E38] sharedImageManager];
    v17 = [v14 url];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __77__GEOPlaceTemplate_MUPlaceTileViewModel__fetchImageTilewWithSize_completion___block_invoke;
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

- (id)subtitleAttributedStringForFont:()MUPlaceTileViewModel
{
  id v4 = a3;
  id v5 = [a1 subtitleLine];
  v6 = [v5 attributedStringForFont:v4];

  return v6;
}

- (id)footerAttributedStringForFont:()MUPlaceTileViewModel
{
  id v4 = a3;
  id v5 = [a1 footerLine];
  v6 = [v5 attributedStringForFont:v4];

  return v6;
}

- (uint64_t)expectedNumberOfFooterLines
{
  v2 = [a1 footerLine];
  v3 = [v2 locationName];

  id v4 = [a1 footerLine];
  id v5 = [v4 categoryName];

  if ([v3 length] || objc_msgSend(v5, "length"))
  {
    uint64_t v6 = 2;
  }
  else
  {
    id v8 = [a1 footerLine];
    v9 = [v8 ratingSummary];

    if (v9)
    {
      if ([v9 isAppleRating]) {
        uint64_t v6 = 1;
      }
      else {
        uint64_t v6 = 2;
      }
    }
    else
    {
      uint64_t v6 = 1;
    }
  }
  return v6;
}

@end