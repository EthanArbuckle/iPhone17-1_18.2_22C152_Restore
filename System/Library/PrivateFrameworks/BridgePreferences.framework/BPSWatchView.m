@interface BPSWatchView
- (BOOL)wantsInternalFPOLabel;
- (BOOL)wantsLightenBlendedScreen;
- (BPSRemoteImageView)watchImageView;
- (BPSWatchView)initWithStyle:(unint64_t)a3;
- (BPSWatchView)initWithStyle:(unint64_t)a3 allowsMaterialFallback:(BOOL)a4;
- (BPSWatchView)initWithStyle:(unint64_t)a3 andVersionModifier:(id)a4;
- (BPSWatchView)initWithStyle:(unint64_t)a3 versionModifier:(id)a4 allowsMaterialFallback:(BOOL)a5;
- (CGRect)watchScreenInsetGuide;
- (CGSize)intrinsicContentSize;
- (CGSize)screenImageSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)screenImageName;
- (NSString)screenImageSearchBundleIdentifier;
- (NSString)styleVersionSuffix;
- (UIImageView)watchScreenImageView;
- (id)image;
- (id)screenBackground:(CGSize)a3;
- (id)watchAssetBundle;
- (unint64_t)deviceSize;
- (unint64_t)sizeOverride;
- (unint64_t)style;
- (void)_cleanedImageName:(id *)a3 withFallbackImage:(id *)a4;
- (void)layoutSubviews;
- (void)layoutWatchScreenImageView;
- (void)overrideMaterial:(unint64_t)a3 size:(unint64_t)a4;
- (void)setScreenImageName:(id)a3;
- (void)setScreenImageSearchBundleIdentifier:(id)a3;
- (void)setSizeOverride:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setStyleVersionSuffix:(id)a3;
- (void)setWantsInternalFPOLabel:(BOOL)a3;
- (void)setWantsLightenBlendedScreen:(BOOL)a3;
- (void)setWatchImageView:(id)a3;
@end

@implementation BPSWatchView

- (BPSWatchView)initWithStyle:(unint64_t)a3
{
  return [(BPSWatchView *)self initWithStyle:a3 versionModifier:0 allowsMaterialFallback:0];
}

- (BPSWatchView)initWithStyle:(unint64_t)a3 andVersionModifier:(id)a4
{
  return [(BPSWatchView *)self initWithStyle:a3 versionModifier:a4 allowsMaterialFallback:0];
}

- (BPSWatchView)initWithStyle:(unint64_t)a3 allowsMaterialFallback:(BOOL)a4
{
  return [(BPSWatchView *)self initWithStyle:a3 versionModifier:0 allowsMaterialFallback:a4];
}

- (BPSWatchView)initWithStyle:(unint64_t)a3 versionModifier:(id)a4 allowsMaterialFallback:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)BPSWatchView;
  v9 = -[BPSWatchView initWithFrame:](&v44, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    styleVersionSuffix = v9->_styleVersionSuffix;
    v9->_styleVersionSuffix = (NSString *)v10;

    v9->_style = a3;
    v12 = _WatchImageNameForStyle(a3, 0);
    v13 = _WatchImageNameForStyle(v9->_style, 1);
    v43 = v12;
    if (v9->_styleVersionSuffix)
    {
      objc_msgSend(v12, "stringByAppendingString:");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      id v15 = [v13 stringByAppendingString:v9->_styleVersionSuffix];
    }
    else
    {
      id v14 = v12;
      id v15 = v13;
    }
    v16 = v15;
    v17 = [MEMORY[0x263F5B978] sharedDeviceController];
    v18 = v17;
    if (v5 && ![v17 material])
    {
      uint64_t v33 = BPSGetActiveSetupCompletedDevice();
      uint64_t v34 = [MEMORY[0x263F5B978] materialFromDevice:v33];
      v42 = (void *)v33;
      uint64_t v35 = [MEMORY[0x263F5B978] sizeFromDevice:v33];
      unint64_t v36 = v9->_style - 1;
      if (v36 > 7) {
        uint64_t v37 = 0;
      }
      else {
        uint64_t v37 = qword_21C53C948[v36];
      }
      v22 = [MEMORY[0x263F5B978] resourceString:v14 material:v34 size:v35 forAttributes:v37];
      v38 = (void *)MEMORY[0x263F5B978];
      uint64_t v39 = [v18 fallbackMaterialForSize:v35];
      unint64_t v40 = v9->_style - 1;
      if (v40 > 7) {
        uint64_t v41 = 0;
      }
      else {
        uint64_t v41 = qword_21C53C948[v40];
      }
      v27 = [v38 resourceString:v16 material:v39 size:v35 forAttributes:v41];
    }
    else
    {
      uint64_t v19 = [v18 size];
      unint64_t v20 = v9->_style - 1;
      if (v20 > 7) {
        uint64_t v21 = 0;
      }
      else {
        uint64_t v21 = qword_21C53C948[v20];
      }
      v22 = [v18 resourceString:v14 forAttributes:v21];
      v23 = (void *)MEMORY[0x263F5B978];
      uint64_t v24 = [v18 fallbackMaterialForSize:v19];
      unint64_t v25 = v9->_style - 1;
      if (v25 > 7) {
        uint64_t v26 = 0;
      }
      else {
        uint64_t v26 = qword_21C53C948[v25];
      }
      v27 = [v23 resourceString:v16 material:v24 size:v19 forAttributes:v26];
    }
    v28 = objc_alloc_init(BPSRemoteImageView);
    watchImageView = v9->_watchImageView;
    v9->_watchImageView = v28;

    [(BPSRemoteImageView *)v9->_watchImageView setFallbackImageName:v27];
    [(BPSRemoteImageView *)v9->_watchImageView setDesiredImageName:v22];
    [(BPSRemoteImageView *)v9->_watchImageView updateImagesWithAnimation:0];
    [(BPSWatchView *)v9 addSubview:v9->_watchImageView];
    v30 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    watchScreenImageView = v9->_watchScreenImageView;
    v9->_watchScreenImageView = v30;

    [(BPSRemoteImageView *)v9->_watchImageView addSubview:v9->_watchScreenImageView];
  }

  return v9;
}

- (id)watchAssetBundle
{
  return (id)[MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.Bridge"];
}

- (void)setScreenImageName:(id)a3
{
  v34[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = (NSString *)[v4 copy];
  screenImageName = self->_screenImageName;
  self->_screenImageName = v5;

  if ([(NSString *)self->_screenImageName length])
  {
    unint64_t sizeOverride = self->_sizeOverride;
    if (sizeOverride)
    {
      id v8 = [MEMORY[0x263F5B978] resourceString:self->_screenImageName material:0 size:sizeOverride forAttributes:4];
    }
    else
    {
      v9 = [MEMORY[0x263F5B978] sharedDeviceController];
      id v8 = [v9 resourceString:self->_screenImageName forAttributes:4];
    }
    if (!self->_screenImageSearchBundleIdentifier
      || (objc_msgSend(MEMORY[0x263F086E0], "bundleWithIdentifier:"),
          (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v10 = [(BPSWatchView *)self watchAssetBundle];
    }
    v11 = [MEMORY[0x263F1C6B0] imageNamed:v8 inBundle:v10 compatibleWithTraitCollection:0];
    if (self->_wantsLightenBlendedScreen)
    {
      v12 = (void *)[objc_alloc(MEMORY[0x263F00650]) initWithImage:v11];
      [v11 size];
      v13 = -[BPSWatchView screenBackground:](self, "screenBackground:");
      uint64_t v14 = [objc_alloc(MEMORY[0x263F00650]) initWithImage:v13];
      id v15 = (void *)v14;
      if (v12 && v14)
      {
        v32 = v8;
        v16 = (void *)MEMORY[0x263F00640];
        v33[0] = @"inputImage";
        v33[1] = @"inputBackgroundImage";
        v34[0] = v12;
        v34[1] = v14;
        [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
        v17 = v31 = v10;
        v18 = [v16 filterWithName:@"CILightenBlendMode" withInputParameters:v17];
        uint64_t v19 = [v18 outputImage];

        unint64_t v20 = (void *)[objc_alloc(MEMORY[0x263F00628]) initWithOptions:0];
        [v19 extent];
        uint64_t v21 = objc_msgSend(v20, "createCGImage:fromRect:", v19);
        id v22 = objc_alloc(MEMORY[0x263F1C6B0]);
        [v11 scale];
        uint64_t v23 = v21;
        uint64_t v10 = v31;
        uint64_t v24 = objc_msgSend(v22, "initWithCGImage:scale:orientation:", v23, 0);

        id v8 = v32;
        v11 = (void *)v24;
      }
      else
      {
        NSLog(&cfstr_ErrorUnableToC.isa, v4);
      }
    }
    if (PBIsInternalInstall() && [(BPSWatchView *)self wantsInternalFPOLabel])
    {
      id v25 = objc_alloc(MEMORY[0x263F1C768]);
      [v11 size];
      uint64_t v26 = objc_msgSend(v25, "initWithSize:");
      v27 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.5];
      [v26 setBackgroundColor:v27];

      v28 = [MEMORY[0x263F1C658] boldSystemFontOfSize:10.0];
      [v26 setFont:v28];

      v29 = [MEMORY[0x263F1C550] systemGreenColor];
      [v26 setTextColor:v29];

      [v26 setNumberOfLines:0];
      v30 = [NSString stringWithFormat:@"FPO [No Radars Please] %@", v4];
      [v26 setText:v30];

      [(UIImageView *)self->_watchScreenImageView addSubview:v26];
    }
    [(UIImageView *)self->_watchScreenImageView setImage:v11];
    [(BPSWatchView *)self setNeedsLayout];
  }
  else
  {
    [(UIImageView *)self->_watchScreenImageView setImage:0];
  }
  [(BPSWatchView *)self applyScreenStyle];
}

- (id)screenBackground:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (a3.width == *MEMORY[0x263F001B0] && a3.height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    uint64_t v10 = 0;
  }
  else
  {
    v7 = [(BPSWatchView *)self image];
    v13.CGFloat width = width;
    v13.CGFloat height = height;
    UIGraphicsBeginImageContextWithOptions(v13, 1, 0.0);
    double v8 = _ScreenInsets(self->_style, [(BPSWatchView *)self deviceSize]);
    objc_msgSend(v7, "drawAtPoint:", -v8, -v9);
    uint64_t v10 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  return v10;
}

- (CGRect)watchScreenInsetGuide
{
  double v3 = _ScreenInsets(self->_style, [(BPSWatchView *)self deviceSize]);
  double v5 = v4;
  [(BPSWatchView *)self screenImageSize];
  double v7 = v6;
  double v9 = v8;
  double v10 = v3;
  double v11 = v5;
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v7;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[BPSRemoteImageView sizeThatFits:](self->_watchImageView, "sizeThatFits:", a3.width, a3.height);
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(BPSRemoteImageView *)self->_watchImageView intrinsicContentSize];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)BPSWatchView;
  [(BPSWatchView *)&v5 layoutSubviews];
  -[BPSRemoteImageView sizeThatFits:](self->_watchImageView, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  -[BPSRemoteImageView setFrame:](self->_watchImageView, "setFrame:", 0.0, 0.0, v3, v4);
  [(BPSWatchView *)self layoutWatchScreenImageView];
}

- (void)layoutWatchScreenImageView
{
  uint64_t v3 = [(BPSWatchView *)self deviceSize];
  [(BPSWatchView *)self screenImageSize];
  double v4 = _ScreenInsets(self->_style, v3);
  watchScreenImageView = self->_watchScreenImageView;
  [(UIImageView *)watchScreenImageView setFrame:v4];
}

- (void)_cleanedImageName:(id *)a3 withFallbackImage:(id *)a4
{
  if (PBIsInternalInstall())
  {
    [*a4 rangeOfString:@"448h"];
    uint64_t v7 = v6;
    [*a4 rangeOfString:@"394h"];
    if (v8 | v7)
    {
      double v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v15 = [v9 pathForResource:*a4 ofType:@"png"];

      double v10 = v15;
      if (!v15)
      {
        if (v7) {
          double v11 = @"448h";
        }
        else {
          double v11 = @"394h";
        }
        id v12 = *a4;
        CGSize v13 = v11;
        *a4 = [v12 stringByReplacingOccurrencesOfString:v13 withString:@"regular"];
        uint64_t v14 = [*a3 stringByReplacingOccurrencesOfString:v13 withString:@"regular"];

        *a3 = v14;
        double v10 = 0;
      }
    }
  }
}

- (void)overrideMaterial:(unint64_t)a3 size:(unint64_t)a4
{
  self->_unint64_t sizeOverride = a4;
  _WatchImageNameForStyle(self->_style, 0);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = _WatchImageNameForStyle(self->_style, 1);
  if (self->_styleVersionSuffix)
  {
    objc_msgSend(v17, "stringByAppendingString:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [v7 stringByAppendingString:self->_styleVersionSuffix];
  }
  else
  {
    id v8 = v17;
    id v9 = v7;
  }
  double v10 = v9;
  double v11 = [MEMORY[0x263F5B978] resourceString:v8 material:a3 size:self->_sizeOverride forAttributes:6];
  id v12 = (void *)MEMORY[0x263F5B978];
  CGSize v13 = [MEMORY[0x263F5B978] sharedDeviceController];
  uint64_t v14 = objc_msgSend(v12, "resourceString:material:size:forAttributes:", v10, objc_msgSend(v13, "fallbackMaterialForSize:", a4), a4, 6);

  id v15 = [(BPSWatchView *)self watchImageView];
  [v15 setDesiredImageName:v11];

  v16 = [(BPSWatchView *)self watchImageView];
  [v16 setFallbackImageName:v14];

  [(BPSRemoteImageView *)self->_watchImageView updateImagesWithAnimation:0];
}

- (unint64_t)deviceSize
{
  uint64_t v3 = [MEMORY[0x263F5B978] sharedDeviceController];
  unint64_t v4 = [v3 size];

  if (self->_sizeOverride) {
    return self->_sizeOverride;
  }
  else {
    return v4;
  }
}

- (CGSize)screenImageSize
{
  unint64_t v3 = [(BPSWatchView *)self deviceSize];
  -[UIImageView sizeThatFits:](self->_watchScreenImageView, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  double v5 = v4;
  double v7 = v6;
  unint64_t style = self->_style;
  if (style == 3 || style == 7)
  {
    double v10 = [MEMORY[0x263F1C920] mainScreen];
    [v10 scale];
    double v12 = v11;

    unint64_t v13 = v3 - 1;
    if (v12 <= 2.0)
    {
      if (v13 < 0x15 && ((0x1C30C3u >> v13) & 1) != 0)
      {
        uint64_t v14 = (double *)((char *)&unk_21C53D728 + 8 * v13);
        id v15 = &unk_21C53D7D0;
        goto LABEL_17;
      }
    }
    else if (v13 < 0x15 && ((0x1C30C3u >> v13) & 1) != 0)
    {
      uint64_t v14 = (double *)((char *)&unk_21C53D5D8 + 8 * v13);
      id v15 = &unk_21C53D680;
LABEL_17:
      double v7 = *v14;
      double v5 = *(double *)&v15[v13];
    }
  }
  else if (style == 6)
  {
    unint64_t v13 = v3 - 1;
    if (v3 - 1 < 8 && ((0xC3u >> v13) & 1) != 0)
    {
      uint64_t v14 = (double *)((char *)&unk_21C53D558 + 8 * v13);
      id v15 = &unk_21C53D598;
      goto LABEL_17;
    }
  }
  double v16 = v5;
  double v17 = v7;
  result.CGFloat height = v17;
  result.CGFloat width = v16;
  return result;
}

- (id)image
{
  return (id)[(BPSRemoteImageView *)self->_watchImageView image];
}

- (NSString)screenImageSearchBundleIdentifier
{
  return self->_screenImageSearchBundleIdentifier;
}

- (void)setScreenImageSearchBundleIdentifier:(id)a3
{
}

- (NSString)screenImageName
{
  return self->_screenImageName;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_unint64_t style = a3;
}

- (unint64_t)sizeOverride
{
  return self->_sizeOverride;
}

- (void)setSizeOverride:(unint64_t)a3
{
  self->_unint64_t sizeOverride = a3;
}

- (BPSRemoteImageView)watchImageView
{
  return self->_watchImageView;
}

- (void)setWatchImageView:(id)a3
{
}

- (NSString)styleVersionSuffix
{
  return self->_styleVersionSuffix;
}

- (void)setStyleVersionSuffix:(id)a3
{
}

- (UIImageView)watchScreenImageView
{
  return self->_watchScreenImageView;
}

- (BOOL)wantsLightenBlendedScreen
{
  return self->_wantsLightenBlendedScreen;
}

- (void)setWantsLightenBlendedScreen:(BOOL)a3
{
  self->_wantsLightenBlendedScreen = a3;
}

- (BOOL)wantsInternalFPOLabel
{
  return self->_wantsInternalFPOLabel;
}

- (void)setWantsInternalFPOLabel:(BOOL)a3
{
  self->_wantsInternalFPOLabel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchScreenImageView, 0);
  objc_storeStrong((id *)&self->_styleVersionSuffix, 0);
  objc_storeStrong((id *)&self->_watchImageView, 0);
  objc_storeStrong((id *)&self->_screenImageName, 0);
  objc_storeStrong((id *)&self->_screenImageSearchBundleIdentifier, 0);
}

@end