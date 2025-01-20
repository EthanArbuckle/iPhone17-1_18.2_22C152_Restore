@interface NTKAnalogFireWaterFaceView
+ (id)_nameForColor:(unint64_t)a3;
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_wantsStatusBarIconShadow;
- (NSDictionary)dataSources;
- (id)_complicationsCompanionForegroundColor;
- (id)_swatchImageForColor:(unint64_t)a3 andDialShape:(unint64_t)a4;
- (id)_swatchImageForColorOption:(id)a3 size:(CGSize)a4;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)imageForEditOption:(id)a3;
- (unint64_t)currentColor;
- (unint64_t)currentDialShape;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_customizeVideoPlayerOnSetup;
- (void)_updateDialSize;
- (void)reloadDataSources;
- (void)setCurrentColor:(unint64_t)a3;
- (void)setCurrentDialShape:(unint64_t)a3;
- (void)setDataSources:(id)a3;
- (void)setupDataSources;
@end

@implementation NTKAnalogFireWaterFaceView

- (BOOL)_wantsStatusBarIconShadow
{
  v2 = [(NTKAnalogFireWaterFaceView *)self optionForCustomEditMode:15 slot:0];
  BOOL v3 = [v2 dialShape] == (char *)&dword_0 + 1;

  return v3;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKAnalogFireWaterFaceView;
  [(NTKAnalogFireWaterFaceView *)&v10 _applyOption:v8 forCustomEditMode:a4 slot:a5];
  if (a4 == 15)
  {
    -[NTKAnalogFireWaterFaceView setCurrentDialShape:](self, "setCurrentDialShape:", [v8 dialShape]);
    v9 = [(NTKAnalogFireWaterFaceView *)self delegate];
    [v9 faceViewDidChangeWantsStatusBarIconShadow];
  }
  else if (a4 == 10)
  {
    -[NTKAnalogFireWaterFaceView setCurrentColor:](self, "setCurrentColor:", [v8 color]);
  }
}

- (void)setCurrentColor:(unint64_t)a3
{
  self->_currentColor = a3;
  [(NTKAnalogFireWaterFaceView *)self reloadDataSources];
}

- (void)setCurrentDialShape:(unint64_t)a3
{
  self->_currentDialShape = a3;
  [(NTKAnalogFireWaterFaceView *)self _updateDialSize];

  [(NTKAnalogFireWaterFaceView *)self reloadDataSources];
}

- (void)_customizeVideoPlayerOnSetup
{
  [(NTKAnalogFireWaterFaceView *)self setupDataSources];
  BOOL v3 = [(NTKAnalogFireWaterFaceView *)self videoPlayerView];
  [v3 setPausedViewEnabled:0];

  [(NTKAnalogFireWaterFaceView *)self reloadDataSources];

  [(NTKAnalogFireWaterFaceView *)self _updateDialSize];
}

- (id)_complicationsCompanionForegroundColor
{
  unint64_t currentColor = self->_currentColor;
  switch(currentColor)
  {
    case 2uLL:
      sub_4F58();
      self = (NTKAnalogFireWaterFaceView *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      sub_4F04();
      self = (NTKAnalogFireWaterFaceView *)objc_claimAutoreleasedReturnValue();
      break;
    case 0uLL:
      self = +[UIColor whiteColor];
      break;
  }

  return self;
}

- (id)imageForEditOption:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 color];
    dataSources = self->_dataSources;
    v7 = +[NSNumber numberWithUnsignedInteger:self->_currentDialShape];
    id v8 = [(NSDictionary *)dataSources objectForKeyedSubscript:v7];
    unint64_t currentColor = (unint64_t)v5;
LABEL_5:
    v12 = +[NSNumber numberWithUnsignedInteger:currentColor];
    v13 = [v8 objectForKeyedSubscript:v12];

    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v4 dialShape];
    v11 = self->_dataSources;
    v7 = +[NSNumber numberWithUnsignedInteger:v10];
    id v8 = [(NSDictionary *)v11 objectForKeyedSubscript:v7];
    unint64_t currentColor = self->_currentColor;
    goto LABEL_5;
  }
  v13 = 0;
LABEL_7:
  v14 = [v13 posterImage];

  return v14;
}

- (void)_updateDialSize
{
  if (self->_currentDialShape)
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  else
  {
    id v5 = [(NTKAnalogFireWaterFaceView *)self device];
    +[NTKAnalogUtilities dialSizeForDevice:v5];
    double width = v6;
    double height = v7;
  }

  -[NTKAnalogFireWaterFaceView setVideoDialSize:](self, "setVideoDialSize:", width, height);
}

- (void)setupDataSources
{
  v2 = [(NTKAnalogFireWaterFaceView *)self device];
  BOOL v3 = sub_4F04();
  id v4 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Fire_Fullscreen_008" andColor:v3];
  v69[0] = v4;
  id v5 = sub_4F04();
  double v6 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Fire_Fullscreen_008_Calm" andColor:v5];
  v69[1] = v6;
  v57 = +[NSArray arrayWithObjects:v69 count:2];

  double v7 = sub_4F58();
  id v8 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Water_Fullscreen_005" andColor:v7];
  v68[0] = v8;
  v9 = sub_4F58();
  id v10 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Water_Fullscreen_005_Edge" andColor:v9];
  v68[1] = v10;
  v56 = +[NSArray arrayWithObjects:v68 count:2];

  v11 = sub_4F04();
  v12 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Fire_Fullscreen_008" andColor:v11];
  v67[0] = v12;
  v13 = sub_4F58();
  v14 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Water_Fullscreen_005" andColor:v13];
  v67[1] = v14;
  v15 = sub_4F04();
  v16 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Fire_Fullscreen_008_Calm" andColor:v15];
  v67[2] = v16;
  v17 = sub_4F58();
  v18 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Water_Fullscreen_005_Edge" andColor:v17];
  v67[3] = v18;
  v52 = +[NSArray arrayWithObjects:v67 count:4];

  v65[0] = &off_88C0;
  v19 = NTKImageNamedFromAssetsBundle();
  v20 = +[NTKVideoPlayerArrayDataSource dataSourceForDevice:v2 withPosterImage:v19 order:0 andListings:v57];
  v66[0] = v20;
  v65[1] = &off_88D8;
  v21 = NTKImageNamedFromAssetsBundle();
  v22 = +[NTKVideoPlayerArrayDataSource dataSourceForDevice:v2 withPosterImage:v21 order:0 andListings:v56];
  v66[1] = v22;
  v65[2] = &off_88F0;
  v23 = NTKImageNamedFromAssetsBundle();
  v24 = +[NTKVideoPlayerArrayDataSource dataSourceForDevice:v2 withPosterImage:v23 order:0 andListings:v52];
  v66[2] = v24;
  v51 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:3];

  v25 = sub_4F04();
  v26 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Fire_Circular_008" andColor:v25];
  v64[0] = v26;
  v27 = sub_4F04();
  v28 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Fire_Circular_008_Calm" andColor:v27];
  v64[1] = v28;
  v55 = +[NSArray arrayWithObjects:v64 count:2];

  v29 = sub_4F58();
  v30 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Water_Circular_005" andColor:v29];
  v63[0] = v30;
  v31 = sub_4F58();
  v32 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Water_Circular_005_Edge" andColor:v31];
  v63[1] = v32;
  v54 = +[NSArray arrayWithObjects:v63 count:2];

  v33 = sub_4F04();
  v34 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Fire_Circular_008" andColor:v33];
  v62[0] = v34;
  v35 = sub_4F58();
  v36 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Water_Circular_005" andColor:v35];
  v62[1] = v36;
  v37 = sub_4F04();
  v38 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Fire_Circular_008_Calm" andColor:v37];
  v62[2] = v38;
  v39 = sub_4F58();
  v40 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Water_Circular_005_Edge" andColor:v39];
  v62[3] = v40;
  v41 = +[NSArray arrayWithObjects:v62 count:4];

  v60[0] = &off_88C0;
  v42 = NTKImageNamedFromAssetsBundle();
  v43 = +[NTKVideoPlayerArrayDataSource dataSourceForDevice:v2 withPosterImage:v42 order:0 andListings:v55];
  v61[0] = v43;
  v60[1] = &off_88D8;
  v44 = NTKImageNamedFromAssetsBundle();
  v45 = +[NTKVideoPlayerArrayDataSource dataSourceForDevice:v2 withPosterImage:v44 order:0 andListings:v54];
  v61[1] = v45;
  v60[2] = &off_88F0;
  v46 = NTKImageNamedFromAssetsBundle();
  v47 = +[NTKVideoPlayerArrayDataSource dataSourceForDevice:v2 withPosterImage:v46 order:0 andListings:v41];
  v61[2] = v47;
  v48 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:3];

  v58[0] = &off_88C0;
  v58[1] = &off_88F0;
  v59[0] = v51;
  v59[1] = v48;
  v49 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:2];
  dataSources = self->_dataSources;
  self->_dataSources = v49;
}

- (void)reloadDataSources
{
  dataSources = self->_dataSources;
  id v7 = +[NSNumber numberWithUnsignedInteger:self->_currentDialShape];
  id v4 = [(NSDictionary *)dataSources objectForKeyedSubscript:v7];
  id v5 = +[NSNumber numberWithUnsignedInteger:self->_currentColor];
  double v6 = [v4 objectForKeyedSubscript:v5];
  [(NTKAnalogFireWaterFaceView *)self _setVideoPlayerDataSource:v6];
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15) {
    return &off_8AF0;
  }
  else {
    return 0;
  }
}

+ (id)_nameForColor:(unint64_t)a3
{
  CFStringRef v3 = @"All";
  if (a3 == 1) {
    CFStringRef v3 = @"Fire";
  }
  if (a3 == 2) {
    return @"Water";
  }
  else {
    return (id)v3;
  }
}

- (id)_swatchImageForColorOption:(id)a3 size:(CGSize)a4
{
  id v4 = +[NTKAnalogFireWaterFaceView _nameForColor:](NTKAnalogFireWaterFaceView, "_nameForColor:", objc_msgSend(a3, "color", a4.width, a4.height));
  id v5 = +[NSString stringWithFormat:@"Swatch-FireWater-Color-%@", v4];

  double v6 = +[NTKFireWaterFaceBundle imageWithName:v5];

  return v6;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  if (a4 == 15)
  {
    v9 = [a5 objectForKeyedSubscript:&off_8908];
    id v10 = v8;
    id v11 = [v9 color];
    id v12 = [v10 dialShape];

    v13 = [(NTKAnalogFireWaterFaceView *)self _swatchImageForColor:v11 andDialShape:v12];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKAnalogFireWaterFaceView;
    v13 = [(NTKAnalogFireWaterFaceView *)&v15 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:a5];
  }

  return v13;
}

- (id)_swatchImageForColor:(unint64_t)a3 andDialShape:(unint64_t)a4
{
  id v5 = +[NTKAnalogFireWaterFaceView _nameForColor:a3];
  CFStringRef v6 = @"Circular";
  if (a4) {
    CFStringRef v6 = 0;
  }
  if (a4 == 1) {
    CFStringRef v6 = @"Fullscreen";
  }
  id v7 = +[NSString stringWithFormat:@"Swatch-FireWater-%@-%@", v6, v5];
  id v8 = +[NTKFireWaterFaceBundle imageWithName:v7];

  return v8;
}

- (unint64_t)currentColor
{
  return self->_currentColor;
}

- (unint64_t)currentDialShape
{
  return self->_currentDialShape;
}

- (NSDictionary)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
}

- (void).cxx_destruct
{
}

@end