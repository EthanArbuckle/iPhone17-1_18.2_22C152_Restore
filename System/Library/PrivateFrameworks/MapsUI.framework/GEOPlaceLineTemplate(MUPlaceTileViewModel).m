@interface GEOPlaceLineTemplate(MUPlaceTileViewModel)
- (id)_businessHoursAttributedStringForFont:()MUPlaceTileViewModel;
- (id)_categoryStringForFont:()MUPlaceTileViewModel;
- (id)_factoidAttributedStringForFont:()MUPlaceTileViewModel;
- (id)_locationAttributedStringForFont:()MUPlaceTileViewModel;
- (id)_ratingGlyphAttributedStringForFont:()MUPlaceTileViewModel;
- (id)_ratingSummaryAttributedStringForFont:()MUPlaceTileViewModel;
- (id)attributedStringForFont:()MUPlaceTileViewModel;
@end

@implementation GEOPlaceLineTemplate(MUPlaceTileViewModel)

- (id)attributedStringForFont:()MUPlaceTileViewModel
{
  id v4 = a3;
  switch([a1 type])
  {
    case 1u:
      uint64_t v5 = [a1 _categoryStringForFont:v4];
      goto LABEL_8;
    case 2u:
      uint64_t v5 = [a1 _businessHoursAttributedStringForFont:v4];
      goto LABEL_8;
    case 3u:
      uint64_t v5 = [a1 _ratingSummaryAttributedStringForFont:v4];
      goto LABEL_8;
    case 4u:
      uint64_t v5 = [a1 _factoidAttributedStringForFont:v4];
      goto LABEL_8;
    case 5u:
      uint64_t v5 = [a1 _locationAttributedStringForFont:v4];
LABEL_8:
      v6 = (void *)v5;
      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

- (id)_businessHoursAttributedStringForFont:()MUPlaceTileViewModel
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F310E0]);
  v6 = [a1 businessHours];
  v7 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  v8 = (void *)[v5 initWithBusinessHours:v6 timeZone:v7 localizedHoursStringOptions:128];

  v9 = [v8 localizedOpenState];
  id v10 = v4;
  if ([v9 length])
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    v12 = [MEMORY[0x1E4FB1618] systemGrayColor];
    uint64_t v13 = *MEMORY[0x1E4FB0700];
    v19[0] = *MEMORY[0x1E4FB06F8];
    v19[1] = v13;
    v20[0] = v10;
    v20[1] = v12;
    v14 = (void *)MEMORY[0x1E4F1C9E8];
    id v15 = v10;
    v16 = [v14 dictionaryWithObjects:v20 forKeys:v19 count:2];

    v17 = (void *)[v11 initWithString:v9 attributes:v16];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_categoryStringForFont:()MUPlaceTileViewModel
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 categoryName];
  id v6 = v4;
  if ([v5 length])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
    v8 = [MEMORY[0x1E4FB1618] systemGrayColor];
    uint64_t v9 = *MEMORY[0x1E4FB0700];
    v15[0] = *MEMORY[0x1E4FB06F8];
    v15[1] = v9;
    v16[0] = v6;
    v16[1] = v8;
    id v10 = (void *)MEMORY[0x1E4F1C9E8];
    id v11 = v6;
    v12 = [v10 dictionaryWithObjects:v16 forKeys:v15 count:2];

    uint64_t v13 = (void *)[v7 initWithString:v5 attributes:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)_ratingSummaryAttributedStringForFont:()MUPlaceTileViewModel
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 ratingSummary];

  if (v5)
  {
    id v6 = NSString;
    id v7 = (void *)MEMORY[0x1E4F30E98];
    v8 = [a1 ratingSummary];
    [v8 sampleSizeUsedForScore];
    id v10 = [v7 stringFromCount:(unint64_t)v9];
    id v11 = [v6 stringWithFormat:@"(%@)", v10];

    id v12 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    uint64_t v13 = objc_msgSend(v4, "_mapkit_fontWithWeight:", *MEMORY[0x1E4FB09E0]);
    v14 = [a1 _ratingGlyphAttributedStringForFont:v13];

    id v15 = [a1 ratingSummary];
    char v16 = [v15 isAppleRating];

    if ((v16 & 1) == 0)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
      v18 = NSString;
      v19 = [a1 ratingSummary];
      v20 = [v19 vendorName];
      v21 = [v18 stringWithFormat:@"%@\n", v20];
      v22 = (void *)[v17 initWithString:v21];

      [v12 appendAttributedString:v22];
    }
    uint64_t v31 = *MEMORY[0x1E4FB06F8];
    v32[0] = v4;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" " attributes:v23];
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v11 attributes:v23];
    v30[0] = v14;
    v30[1] = v24;
    v30[2] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
    v27 = +[MapsUILayout buildAttributedDisplayStringForComponents:v26 reverseIfRTLLayout:1];

    [v12 appendAttributedString:v27];
    v28 = (void *)[v12 copy];
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)_ratingGlyphAttributedStringForFont:()MUPlaceTileViewModel
{
  v39[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 ratingSummary];
  int v6 = [v5 isAppleRating];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F30EA0] ratingSymbolName];
    v36 = [MEMORY[0x1E4FB1618] labelColor];
    v8 = NSString;
    float v9 = [a1 ratingSummary];
    [v9 normalizedUserRatingScore];
    uint64_t v11 = objc_msgSend(v8, "localizedStringWithFormat:", @"%lu%%", (unint64_t)v10);
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F31030];
    uint64_t v13 = [a1 ratingSummary];
    [v13 normalizedUserRatingScore];
    v36 = [v12 colorForRating:v14];

    id v15 = NSString;
    float v9 = [a1 ratingSummary];
    [v9 normalizedUserRatingScore];
    uint64_t v11 = objc_msgSend(v15, "localizedStringWithFormat:", @"%.1f", v16);
    id v7 = @"star.fill";
  }

  id v17 = (void *)MEMORY[0x1E4FB1818];
  v18 = (void *)MEMORY[0x1E4FB1830];
  id v19 = v4;
  v20 = v7;
  v21 = [v18 configurationWithFont:v19 scale:1];
  v22 = objc_msgSend(v17, "_mapsui_resolvedSymbolImageNamed:withConfiguration:", v20, v21);

  v35 = [v22 imageWithRenderingMode:2];

  id v23 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  [v23 setImage:v35];
  v24 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v23];
  v39[0] = v24;
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
  v39[1] = v25;
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v11];
  v39[2] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
  +[MapsUILayout buildAttributedDisplayStringForComponents:v27 reverseIfRTLLayout:1];
  v29 = v28 = (void *)v11;
  v30 = (void *)[v29 mutableCopy];

  uint64_t v31 = *MEMORY[0x1E4FB06F8];
  v37[0] = *MEMORY[0x1E4FB0700];
  v37[1] = v31;
  v38[0] = v36;
  v38[1] = v19;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  objc_msgSend(v30, "addAttributes:range:", v32, 0, objc_msgSend(v30, "length"));

  v33 = (void *)[v30 copy];
  return v33;
}

- (id)_factoidAttributedStringForFont:()MUPlaceTileViewModel
{
  id v4 = a3;
  id v5 = [a1 factoid];
  int v6 = _MUFactoidStringForFactoid((uint64_t)v5, v4);

  return v6;
}

- (id)_locationAttributedStringForFont:()MUPlaceTileViewModel
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 locationName];
  id v6 = v4;
  if ([v5 length])
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
    v8 = [MEMORY[0x1E4FB1618] systemGrayColor];
    uint64_t v9 = *MEMORY[0x1E4FB0700];
    v15[0] = *MEMORY[0x1E4FB06F8];
    v15[1] = v9;
    v16[0] = v6;
    v16[1] = v8;
    float v10 = (void *)MEMORY[0x1E4F1C9E8];
    id v11 = v6;
    id v12 = [v10 dictionaryWithObjects:v16 forKeys:v15 count:2];

    uint64_t v13 = (void *)[v7 initWithString:v5 attributes:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

@end