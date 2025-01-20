@interface NSAttributedString(TransitFormattedStringExtras)
+ (id)_mapkit_attributedLiveTransitStringFromAttributedDepartureString:()TransitFormattedStringExtras liveStatus:darkMode:symbolOverrideColor:;
+ (id)_mapkit_attributedLiveTransitStringFromDepartureString:()TransitFormattedStringExtras departure:textAttributes:darkMode:symbolOverrideColor:;
+ (id)_mapkit_attributedStringForComposedString:()TransitFormattedStringExtras defaultAttributes:argumentOverrideHandler:;
+ (id)_mapkit_attributedTransitStringForServerFormattedString:()TransitFormattedStringExtras defaultAttributes:variableOverrides:;
+ (id)_mapkit_attributedTransitStringForServerFormattedString:()TransitFormattedStringExtras defaultAttributes:variableOverrides:options:;
+ (uint64_t)_mapkit_attributedLiveTransitStringFromDepartureString:()TransitFormattedStringExtras departure:darkMode:;
+ (uint64_t)_mapkit_attributedStringForComposedString:()TransitFormattedStringExtras defaultAttributes:;
+ (uint64_t)_mapkit_attributedTransitStringForServerFormattedString:()TransitFormattedStringExtras defaultAttributes:;
@end

@implementation NSAttributedString(TransitFormattedStringExtras)

+ (uint64_t)_mapkit_attributedTransitStringForServerFormattedString:()TransitFormattedStringExtras defaultAttributes:
{
  return objc_msgSend(a1, "_mapkit_attributedTransitStringForServerFormattedString:defaultAttributes:variableOverrides:", a3, a4, 0);
}

+ (id)_mapkit_attributedTransitStringForServerFormattedString:()TransitFormattedStringExtras defaultAttributes:variableOverrides:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  memset((char *)&v14[1] + 7, 0, 5);
  BYTE2(v14[2]) = MKApplicationLayoutDirectionIsRightToLeft();
  +[MKTransitItemReferenceDateUpdater referenceDateAsTimeInterval];
  v14[3] = v11;
  v12 = objc_msgSend(a1, "_mapkit_attributedTransitStringForServerFormattedString:defaultAttributes:variableOverrides:options:", v10, v9, v8, v14);

  return v12;
}

+ (id)_mapkit_attributedTransitStringForServerFormattedString:()TransitFormattedStringExtras defaultAttributes:variableOverrides:options:
{
  if (a3)
  {
    id v9 = a5;
    id v10 = a4;
    id v11 = a3;
    v12 = [MKServerFormattedStringParameters alloc];
    long long v13 = a6[1];
    v19[0] = *a6;
    v19[1] = v13;
    v14 = [(MKServerFormattedStringParameters *)v12 initWithOptions:v19 variableOverrides:v9];

    v15 = [[MKServerFormattedString alloc] initWithGeoServerString:v11 parameters:v14];
    v16 = [(MKServerFormattedString *)v15 multiPartAttributedStringWithAttributes:v10];

    v17 = [v16 attributedString];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (uint64_t)_mapkit_attributedStringForComposedString:()TransitFormattedStringExtras defaultAttributes:
{
  return objc_msgSend(MEMORY[0x1E4F28B18], "_mapkit_attributedStringForComposedString:defaultAttributes:argumentOverrideHandler:", a3, a4, 0);
}

+ (id)_mapkit_attributedStringForComposedString:()TransitFormattedStringExtras defaultAttributes:argumentOverrideHandler:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v7)
  {
    if (v9)
    {
      id v11 = [v7 optionsWithArgumentHandler:v9];
      [v11 setShouldUpdateFormatStrings:0];
      uint64_t v12 = [v7 composedStringWithOptions:v11];

      id v7 = (id)v12;
    }
    long long v13 = [[MKServerFormattedString alloc] initWithComposedString:v7];
    v14 = [(MKServerFormattedString *)v13 multiPartAttributedStringWithAttributes:v8];
    v15 = [v14 attributedString];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (uint64_t)_mapkit_attributedLiveTransitStringFromDepartureString:()TransitFormattedStringExtras departure:darkMode:
{
  return objc_msgSend(a1, "_mapkit_attributedLiveTransitStringFromDepartureString:departure:textAttributes:darkMode:symbolOverrideColor:", a3, a4, 0, a5, 0);
}

+ (id)_mapkit_attributedLiveTransitStringFromDepartureString:()TransitFormattedStringExtras departure:textAttributes:darkMode:symbolOverrideColor:
{
  uint64_t v12 = (objc_class *)MEMORY[0x1E4F28B18];
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)[[v12 alloc] initWithString:v16 attributes:v14];

  uint64_t v18 = [v15 liveStatus];
  v19 = objc_msgSend(a1, "_mapkit_attributedLiveTransitStringFromAttributedDepartureString:liveStatus:darkMode:symbolOverrideColor:", v17, v18, a6, v13);

  return v19;
}

+ (id)_mapkit_attributedLiveTransitStringFromAttributedDepartureString:()TransitFormattedStringExtras liveStatus:darkMode:symbolOverrideColor:
{
  id v9 = a3;
  id v10 = a6;
  if (a4
    && (objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_liveTransitIndicatorImageUsingDarkMode:", a5),
        (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v12 = (void *)v11;
    if (v10)
    {
      id v13 = v10;
    }
    else
    {
      MKTransitLiveDepartureColorForLiveStatus(a4);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v15 = v13;
    id v16 = [v12 _flatImageWithColor:v13];

    id v17 = objc_alloc_init(MEMORY[0x1E4F42698]);
    [v17 setImage:v16];
    double v18 = *MEMORY[0x1E4F1DAD8];
    double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v16 size];
    objc_msgSend(v17, "setBounds:", v18, v19, v20, v21);
    v22 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v17];
    v23 = (void *)[v22 mutableCopy];

    v24 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    v25 = (void *)[v9 mutableCopy];
    [v25 appendAttributedString:v24];
    [v25 appendAttributedString:v23];
    id v14 = (id)[v25 copy];
  }
  else
  {
    id v14 = v9;
  }

  return v14;
}

@end