@interface ASCDefaultLockupTheme
+ (ASCDefaultLockupTheme)sharedTheme;
+ (CGSize)preferredIconSizeForSize:(id)a3 compatibleWithTraitCollection:(id)a4;
+ (id)headingLabelColorForView:(id)a3;
+ (id)headingLabelFontForSize:(id)a3 compatibleWithTraitCollection:(id)a4;
+ (id)offerStatusLabelFontForSize:(id)a3 compatibleWithTraitCollection:(id)a4;
+ (id)subtitleLabelFontForView:(id)a3 compatibleWithTraitCollection:(id)a4;
+ (id)titleLabelFontForView:(id)a3 compatibleWithTraitCollection:(id)a4;
+ (int64_t)numberOfLinesInSubtitleForSize:(id)a3 compatibleWithTraitCollection:(id)a4;
+ (int64_t)numberOfLinesInTitleForSize:(id)a3 compatibleWithTraitCollection:(id)a4;
+ (int64_t)preferredLabelAlignmentForSize:(id)a3;
+ (void)updateOfferStatusLabelColorForView:(id)a3;
- (void)applyToLockupContentView:(id)a3 compatibleWithTraitCollection:(id)a4;
@end

@implementation ASCDefaultLockupTheme

+ (ASCDefaultLockupTheme)sharedTheme
{
  if (sharedTheme_onceToken != -1) {
    dispatch_once(&sharedTheme_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedTheme_sharedTheme;

  return (ASCDefaultLockupTheme *)v2;
}

uint64_t __36__ASCDefaultLockupTheme_sharedTheme__block_invoke()
{
  sharedTheme_sharedTheme = objc_alloc_init(ASCDefaultLockupTheme);

  return MEMORY[0x1F41817F8]();
}

+ (CGSize)preferredIconSizeForSize:(id)a3 compatibleWithTraitCollection:(id)a4
{
  id v5 = a3;
  double IconSize = ASCLockupViewSizeGetIconSize(v5, [a4 horizontalSizeClass]);
  double v8 = v7;

  double v9 = IconSize;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (int64_t)preferredLabelAlignmentForSize:(id)a3
{
  id v3 = a3;
  if ((ASCLockupViewSizeIsMini(v3, v4) & 1) != 0
    || (ASCLockupViewSizeIsSmall(v3, v5) & 1) != 0
    || (ASCLockupViewSizeIsMedium(v3, v6) & 1) != 0
    || (ASCLockupViewSizeIsSmallOfferButton(v3, v7) & 1) != 0
    || (ASCLockupViewSizeIsMediumOfferButton(v3, v8) & 1) != 0)
  {
    int64_t v10 = 4;
  }
  else
  {
    if ((ASCLockupViewSizeIsLargeAppShowcase(v3, v9) & 1) == 0 && (ASCLockupViewSizeIsLargeAppAd(v3, v12) & 1) == 0) {
      ASCUnknownEnumCase(@"ASCLockupViewSize", v3);
    }
    int64_t v10 = 1;
  }

  return v10;
}

+ (id)headingLabelColorForView:(id)a3
{
  id v3 = [a3 lockupSize];
  if (ASCLockupViewSizeIsMini(v3, v4)) {
    +[ASCSemanticColor primaryLabel]();
  }
  else {
  id v5 = +[ASCSemanticColor secondaryLabel]();
  }

  return v5;
}

+ (id)headingLabelFontForSize:(id)a3 compatibleWithTraitCollection:(id)a4
{
  id v5 = a4;
  if (ASCLockupViewSizeIsMini(a3, v6)) {
    objc_msgSend(MEMORY[0x1E4FB1798], "asc_fontDerivedFromTextStyle:byApplyingFontWeight:compatibleWithTraitCollection:", *MEMORY[0x1E4FB28D8], v5, *MEMORY[0x1E4FB29C0]);
  }
  else {
  double v7 = objc_msgSend(MEMORY[0x1E4FB1798], "asc_preferredFontForTextStyle:withTraits:compatibleWithTraitCollection:", *MEMORY[0x1E4FB28F0], 0x8000, v5);
  }

  return v7;
}

+ (id)titleLabelFontForView:(id)a3 compatibleWithTraitCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 lockupSize];
  if (ASCLockupViewSizeIsMini(v7, v8))
  {
    int64_t v10 = (void *)MEMORY[0x1E4FB1798];
    uint64_t v11 = *MEMORY[0x1E4FB2950];
    uint64_t v12 = *MEMORY[0x1E4FB29C0];
LABEL_8:
    uint64_t v17 = objc_msgSend(v10, "asc_preferredFontForTextStyle:withTraits:compatibleWithTraitCollection:", v11, v12, v6);
    goto LABEL_9;
  }
  if ((ASCLockupViewSizeIsSmall(v7, v9) & 1) != 0
    || (ASCLockupViewSizeIsMedium(v7, v13) & 1) != 0
    || (ASCLockupViewSizeIsSmallOfferButton(v7, v14) & 1) != 0
    || ASCLockupViewSizeIsMediumOfferButton(v7, v15))
  {
    int64_t v10 = (void *)MEMORY[0x1E4FB1798];
    uint64_t v11 = *MEMORY[0x1E4FB28C8];
    uint64_t v12 = 0x8000;
    goto LABEL_8;
  }
  if ((ASCLockupViewSizeIsLargeAppShowcase(v7, v16) & 1) == 0 && !ASCLockupViewSizeIsLargeAppAd(v7, v20)) {
    ASCUnknownEnumCase(@"ASCLockupViewSize", v7);
  }
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4FB1798], "asc_preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E4FB2990], v6);
LABEL_9:
  v18 = (void *)v17;

  return v18;
}

+ (int64_t)numberOfLinesInTitleForSize:(id)a3 compatibleWithTraitCollection:(id)a4
{
  return ASCLockupViewSizeIsMini(a3, a2);
}

+ (id)subtitleLabelFontForView:(id)a3 compatibleWithTraitCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 lockupSize];
  if (ASCLockupViewSizeIsMini(v7, v8))
  {
    int64_t v10 = (void *)MEMORY[0x1E4FB28D8];
  }
  else if ((ASCLockupViewSizeIsSmall(v7, v9) & 1) != 0 {
         || (ASCLockupViewSizeIsMedium(v7, v11) & 1) != 0
  }
         || (ASCLockupViewSizeIsSmallOfferButton(v7, v12) & 1) != 0
         || (ASCLockupViewSizeIsMediumOfferButton(v7, v13) & 1) != 0)
  {
    int64_t v10 = (void *)MEMORY[0x1E4FB28F0];
  }
  else
  {
    if ((ASCLockupViewSizeIsLargeAppShowcase(v7, v14) & 1) == 0 && (ASCLockupViewSizeIsLargeAppAd(v7, v17) & 1) == 0) {
      ASCUnknownEnumCase(@"ASCLockupViewSize", v7);
    }
    int64_t v10 = (void *)MEMORY[0x1E4FB2950];
  }
  v15 = objc_msgSend(MEMORY[0x1E4FB1798], "asc_preferredFontForTextStyle:compatibleWithTraitCollection:", *v10, v6);

  return v15;
}

+ (int64_t)numberOfLinesInSubtitleForSize:(id)a3 compatibleWithTraitCollection:(id)a4
{
  return ASCLockupViewSizeIsMini(a3, a2);
}

+ (void)updateOfferStatusLabelColorForView:(id)a3
{
  id v3 = [a3 offerStatusLabelIfLoaded];
  [v3 _setTextColorFollowsTintColor:1];
}

+ (id)offerStatusLabelFontForSize:(id)a3 compatibleWithTraitCollection:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1798], "asc_preferredFontForTextStyle:withTraits:compatibleWithTraitCollection:", *MEMORY[0x1E4FB28F0], 0x8000, a4);
}

- (void)applyToLockupContentView:(id)a3 compatibleWithTraitCollection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v45 = [v6 lockupSize];
  +[ASCDefaultLockupTheme preferredIconSizeForSize:v45 compatibleWithTraitCollection:v5];
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [v6 iconArtworkView];
  objc_msgSend(v11, "setPreferredSize:", v8, v10);

  int64_t v12 = +[ASCDefaultLockupTheme preferredLabelAlignmentForSize:v45];
  v13 = +[ASCDefaultLockupTheme headingLabelFontForSize:v45 compatibleWithTraitCollection:v5];
  v14 = [v6 headingLabelIfLoaded];
  [v14 setFont:v13];

  v15 = +[ASCDefaultLockupTheme headingLabelColorForView:v6];
  v16 = [v6 headingLabelIfLoaded];
  [v16 setTextColor:v15];

  uint64_t v17 = [v6 headingLabelIfLoaded];
  [v17 setTextAlignment:v12];

  v18 = [v6 headingLabelIfLoaded];
  [v18 setNumberOfLines:1];

  v19 = [v6 headingLabelIfLoaded];
  [v19 setLineBreakMode:4];

  v20 = +[ASCDefaultLockupTheme titleLabelFontForView:v6 compatibleWithTraitCollection:v5];
  v21 = [v6 titleLabel];
  [v21 setFont:v20];

  v22 = [v6 titleLabel];
  [v22 setTextAlignment:v12];

  v23 = +[ASCSemanticColor loading]();
  v24 = [v6 titleLabel];
  [v24 setSkeletonColor:v23];

  v25 = +[ASCSemanticColor primaryLabel]();
  v26 = [v6 titleLabel];
  [v26 setTextColor:v25];

  int64_t v27 = +[ASCDefaultLockupTheme numberOfLinesInTitleForSize:v45 compatibleWithTraitCollection:v5];
  v28 = [v6 titleLabel];
  [v28 setNumberOfLines:v27];

  v29 = [v6 titleLabel];
  [v29 setLineBreakMode:4];

  v30 = +[ASCDefaultLockupTheme subtitleLabelFontForView:v6 compatibleWithTraitCollection:v5];
  v31 = [v6 subtitleLabel];
  [v31 setFont:v30];

  v32 = [v6 subtitleLabel];
  [v32 setTextAlignment:v12];

  v33 = +[ASCSemanticColor loading]();
  v34 = [v6 subtitleLabel];
  [v34 setSkeletonColor:v33];

  v35 = +[ASCSemanticColor secondaryLabel]();
  v36 = [v6 subtitleLabel];
  [v36 setTextColor:v35];

  int64_t v37 = +[ASCDefaultLockupTheme numberOfLinesInSubtitleForSize:v45 compatibleWithTraitCollection:v5];
  v38 = [v6 subtitleLabel];
  [v38 setNumberOfLines:v37];

  v39 = [v6 subtitleLabel];
  [v39 setLineBreakMode:4];

  +[ASCDefaultLockupTheme updateOfferStatusLabelColorForView:v6];
  v40 = +[ASCDefaultLockupTheme offerStatusLabelFontForSize:v45 compatibleWithTraitCollection:v5];

  v41 = [v6 offerStatusLabelIfLoaded];
  [v41 setFont:v40];

  v42 = [v6 offerStatusLabelIfLoaded];
  [v42 setTextAlignment:v12];

  v43 = [v6 offerStatusLabelIfLoaded];
  [v43 setNumberOfLines:1];

  v44 = [v6 offerStatusLabelIfLoaded];

  [v44 setLineBreakMode:4];
}

@end