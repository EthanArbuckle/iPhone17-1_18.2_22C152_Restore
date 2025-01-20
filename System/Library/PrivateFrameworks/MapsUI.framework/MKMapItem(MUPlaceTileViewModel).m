@interface MKMapItem(MUPlaceTileViewModel)
- (id)footerAttributedStringForFont:()MUPlaceTileViewModel;
- (id)tileSubtitle;
- (uint64_t)expectedNumberOfFooterLines;
- (uint64_t)subtitleAttributedStringForFont:()MUPlaceTileViewModel;
- (void)fetchBadgeIconWithCompletion:()MUPlaceTileViewModel;
- (void)fetchFallbackIconWithCompletion:()MUPlaceTileViewModel;
- (void)fetchImageTilewWithSize:()MUPlaceTileViewModel completion:;
@end

@implementation MKMapItem(MUPlaceTileViewModel)

- (id)tileSubtitle
{
  if ([a1 _hasHikeInfo])
  {
    v2 = [MEMORY[0x1E4F1CA20] currentLocale];
    v3 = [v2 objectForKey:*MEMORY[0x1E4F1C490]];
    char v4 = [v3 BOOLValue];

    v5 = [a1 _hikeSummary];
    if (v4) {
      [MEMORY[0x1E4F291E0] kilometers];
    }
    else {
    v6 = [MEMORY[0x1E4F291E0] miles];
    }
    v7 = [v5 lengthStringForUnit:v6];

    v8 = [a1 _hikeSummary];
    if (v4) {
      [MEMORY[0x1E4F291E0] meters];
    }
    else {
    v9 = [MEMORY[0x1E4F291E0] feet];
    }
    v10 = [v8 elevationGainStringForUnit:v9];

    if ([v7 length] && objc_msgSend(v10, "length"))
    {
      [NSString localizedStringWithFormat:@"%@ · ↗ %@", v7, v10];
LABEL_15:
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    if ([v7 length])
    {
      id v11 = v7;
LABEL_16:
      v12 = v11;

      goto LABEL_19;
    }
    if ([v10 length])
    {
      [NSString localizedStringWithFormat:@"↗ %@", v10, v14];
      goto LABEL_15;
    }
  }
  v12 = [a1 _shortAddress];
LABEL_19:
  return v12;
}

- (void)fetchImageTilewWithSize:()MUPlaceTileViewModel completion:
{
  id v8 = a5;
  v9 = [MEMORY[0x1E4F31038] sharedInstance];
  [v9 screenScale];
  double v11 = v10;

  if ([a1 _hasHikeInfo])
  {
    v12 = (void *)MEMORY[0x1E4F649B8];
    v13 = [a1 _geoMapItem];
    uint64_t v14 = [v12 builderWithMapItem:v13];

    v15 = [v14 buildRoute];
    v16 = [v15 uniqueRouteID];
    v17 = v16;
    if (v16) {
      id v18 = v16;
    }
    else {
      id v18 = objc_alloc_init(MEMORY[0x1E4F29128]);
    }
    v26 = v18;

    v27 = [MEMORY[0x1E4FB1BA8] mainScreen];
    v28 = [v27 traitCollection];
    BOOL v29 = [v28 userInterfaceStyle] == 2;

    v30 = -[MURouteSnapshotKey initWithIdentifier:width:height:scale:padding:darkMode:]([MURouteSnapshotKey alloc], "initWithIdentifier:width:height:scale:padding:darkMode:", v26, v29, a2, a3, v11, 15.0, 15.0, 15.0, 15.0);
    v31 = +[MURouteSnapshotManager sharedInstance];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __70__MKMapItem_MUPlaceTileViewModel__fetchImageTilewWithSize_completion___block_invoke;
    v37[3] = &unk_1E5750BF8;
    id v38 = v8;
    [v31 getSnapshotForKey:v30 route:v15 completion:v37];
  }
  else
  {
    v19 = [a1 _geoMapItem];
    v20 = [v19 _photos];
    uint64_t v14 = objc_msgSend(v20, "_geo_firstPhotoOfAtLeastSize:", a2 * v11, a3 * v11);

    v21 = [v14 url];
    v22 = [v21 absoluteString];
    uint64_t v23 = [v22 length];

    if (v23)
    {
      v24 = [MEMORY[0x1E4F30E38] sharedImageManager];
      v25 = [v14 url];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __70__MKMapItem_MUPlaceTileViewModel__fetchImageTilewWithSize_completion___block_invoke_2;
      v32[3] = &unk_1E574F678;
      id v33 = v8;
      double v34 = a2;
      double v35 = a3;
      double v36 = v11;
      [v24 loadAppImageAtURL:v25 completionHandler:v32];
    }
    else
    {
      (*((void (**)(id, void, void, void))v8 + 2))(v8, 0, 0, 0);
    }
  }
}

- (void)fetchFallbackIconWithCompletion:()MUPlaceTileViewModel
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [a1 _styleAttributes];
    _MUFetchBadgeIconWithStyleAttributes(v5, 1, v4);
  }
}

- (void)fetchBadgeIconWithCompletion:()MUPlaceTileViewModel
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [a1 _styleAttributes];
    _MUFetchBadgeIconWithStyleAttributes(v5, 0, v4);
  }
}

- (uint64_t)subtitleAttributedStringForFont:()MUPlaceTileViewModel
{
  return 0;
}

- (id)footerAttributedStringForFont:()MUPlaceTileViewModel
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 tileSubtitle];
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