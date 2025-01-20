@interface NTKAnalogSmokeFaceView
+ (id)_nameForSmokeColor:(unint64_t)a3;
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_wantsStatusBarIconShadow;
- (NSDictionary)dataSources;
- (id)_complicationsCompanionForegroundColor;
- (id)_swatchImageForColorOption:(id)a3 size:(CGSize)a4;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)_swatchImageForSmokeColor:(unint64_t)a3 andDialShape:(unint64_t)a4;
- (id)imageForEditOption:(id)a3;
- (unint64_t)currentDialShape;
- (unint64_t)currentSmokeColor;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyVideoPlayerTransform;
- (void)_configureTimeView:(id)a3;
- (void)_customizeVideoPlayerOnSetup;
- (void)_handleEitherScreenWake;
- (void)_updateDialSize;
- (void)reloadDataSources;
- (void)setCurrentDialShape:(unint64_t)a3;
- (void)setCurrentSmokeColor:(unint64_t)a3;
- (void)setDataSources:(id)a3;
- (void)setupDataSources;
@end

@implementation NTKAnalogSmokeFaceView

- (BOOL)_wantsStatusBarIconShadow
{
  v2 = [(NTKAnalogSmokeFaceView *)self optionForCustomEditMode:15 slot:0];
  BOOL v3 = [v2 dialShape] == (char *)&dword_0 + 1;

  return v3;
}

- (void)_configureTimeView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKAnalogSmokeFaceView;
  id v3 = a3;
  [(NTKAnalogSmokeFaceView *)&v6 _configureTimeView:v3];
  v4 = +[UIColor blackColor];
  [v3 setInlayColor:v4];

  v5 = [v3 secondHandView];

  if (qword_CB40 != -1) {
    dispatch_once(&qword_CB40, &stru_8288);
  }
  [v5 setColor:qword_CB38];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKAnalogSmokeFaceView;
  [(NTKAnalogSmokeFaceView *)&v10 _applyOption:v8 forCustomEditMode:a4 slot:a5];
  if (a4 == 15)
  {
    -[NTKAnalogSmokeFaceView setCurrentDialShape:](self, "setCurrentDialShape:", [v8 dialShape]);
    v9 = [(NTKAnalogSmokeFaceView *)self delegate];
    [v9 faceViewDidChangeWantsStatusBarIconShadow];
  }
  else if (a4 == 10)
  {
    -[NTKAnalogSmokeFaceView setCurrentSmokeColor:](self, "setCurrentSmokeColor:", [v8 color]);
  }
}

- (void)setCurrentSmokeColor:(unint64_t)a3
{
  self->_currentSmokeColor = a3;
  [(NTKAnalogSmokeFaceView *)self reloadDataSources];
}

- (void)setCurrentDialShape:(unint64_t)a3
{
  if (self->_currentDialShape != a3) {
    self->_shouldApplyTransform = 1;
  }
  self->_currentDialShape = a3;
  [(NTKAnalogSmokeFaceView *)self _applyVideoPlayerTransform];
  [(NTKAnalogSmokeFaceView *)self _updateDialSize];

  [(NTKAnalogSmokeFaceView *)self reloadDataSources];
}

- (void)_handleEitherScreenWake
{
  self->_shouldApplyTransform = 1;
  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogSmokeFaceView;
  [(NTKAnalogSmokeFaceView *)&v3 _handleEitherScreenWake];
  [(NTKAnalogSmokeFaceView *)self _applyVideoPlayerTransform];
}

- (void)_customizeVideoPlayerOnSetup
{
  [(NTKAnalogSmokeFaceView *)self setupDataSources];
  objc_super v3 = [(NTKAnalogSmokeFaceView *)self videoPlayerView];
  [v3 setPausedViewEnabled:0];

  [(NTKAnalogSmokeFaceView *)self reloadDataSources];

  [(NTKAnalogSmokeFaceView *)self _updateDialSize];
}

- (id)_complicationsCompanionForegroundColor
{
  switch(self->_currentSmokeColor)
  {
    case 0uLL:
      self = +[UIColor whiteColor];
      break;
    case 1uLL:
      sub_511C();
      self = (NTKAnalogSmokeFaceView *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      sub_51C4();
      self = (NTKAnalogSmokeFaceView *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      sub_5170();
      self = (NTKAnalogSmokeFaceView *)objc_claimAutoreleasedReturnValue();
      break;
    default:
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
    unint64_t currentSmokeColor = (unint64_t)v5;
LABEL_5:
    v12 = +[NSNumber numberWithUnsignedInteger:currentSmokeColor];
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
    unint64_t currentSmokeColor = self->_currentSmokeColor;
    goto LABEL_5;
  }
  v13 = 0;
LABEL_7:
  v14 = [v13 posterImage];

  return v14;
}

- (void)_applyVideoPlayerTransform
{
  if (self->_shouldApplyTransform)
  {
    self->_shouldApplyTransform = 0;
    unint64_t currentDialShape = self->_currentDialShape;
    if (currentDialShape)
    {
      if (currentDialShape == 1) {
        [(NTKAnalogSmokeFaceView *)self _transformVideoPlayerView:2];
      }
    }
    else
    {
      [(NTKAnalogSmokeFaceView *)self _transformVideoPlayerView:1];
    }
  }
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
    id v5 = [(NTKAnalogSmokeFaceView *)self device];
    +[NTKAnalogUtilities dialSizeForDevice:v5];
    double width = v6;
    double height = v7;
  }

  -[NTKAnalogSmokeFaceView setVideoDialSize:](self, "setVideoDialSize:", width, height);
}

- (void)setupDataSources
{
  v2 = [(NTKAnalogSmokeFaceView *)self device];
  v69[0] = &off_8A78;
  objc_super v3 = sub_511C();
  id v4 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Smoke_Fullscreen_Spearmint_007" andColor:v3];
  v70[0] = v4;
  v69[1] = &off_8A90;
  id v5 = sub_51C4();
  double v6 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Smoke_Fullscreen_Citrus_007" andColor:v5];
  v70[1] = v6;
  v69[2] = &off_8AA8;
  double v7 = sub_5170();
  id v8 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Smoke_Fullscreen_Neutral_007" andColor:v7];
  v70[2] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:3];

  v67[0] = &off_8A78;
  v48 = NTKImageNamedFromAssetsBundle();
  id v10 = v9;
  v50 = [v9 objectForKeyedSubscript:&off_8A78];
  v66 = v50;
  v46 = +[NSArray arrayWithObjects:&v66 count:1];
  v44 = +[NTKVideoPlayerArrayDataSource dataSourceForDevice:v2 withPosterImage:v48 andListings:v46];
  v68[0] = v44;
  v67[1] = &off_8A90;
  v40 = NTKImageNamedFromAssetsBundle();
  v42 = [v9 objectForKeyedSubscript:&off_8A90];
  v65 = v42;
  v11 = +[NSArray arrayWithObjects:&v65 count:1];
  v12 = +[NTKVideoPlayerArrayDataSource dataSourceForDevice:v2 withPosterImage:v40 andListings:v11];
  v68[1] = v12;
  v67[2] = &off_8AA8;
  v13 = NTKImageNamedFromAssetsBundle();
  v53 = v9;
  v14 = [v9 objectForKeyedSubscript:&off_8AA8];
  v64 = v14;
  v15 = +[NSArray arrayWithObjects:&v64 count:1];
  v16 = +[NTKVideoPlayerArrayDataSource dataSourceForDevice:v2 withPosterImage:v13 andListings:v15];
  v68[2] = v16;
  v67[3] = &off_8AC0;
  v17 = NTKImageNamedFromAssetsBundle();
  v18 = [v10 allValues];
  v19 = +[NTKVideoPlayerArrayDataSource dataSourceForDevice:v2 withPosterImage:v17 order:1 andListings:v18];
  v68[3] = v19;
  v52 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:4];

  v62[0] = &off_8A78;
  v20 = sub_511C();
  v21 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Smoke_Circular_Spearmint_007" andColor:v20];
  v63[0] = v21;
  v62[1] = &off_8A90;
  v22 = sub_51C4();
  v23 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Smoke_Circular_Citrus_007" andColor:v22];
  v63[1] = v23;
  v62[2] = &off_8AA8;
  v24 = sub_5170();
  v25 = +[NTKVideoPlayerListing listingForDevice:v2 withFilename:@"Smoke_Circular_Neutral_007" andColor:v24];
  v63[2] = v25;
  v26 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:3];

  v60[0] = &off_8A78;
  v49 = NTKImageNamedFromAssetsBundle();
  v51 = [v26 objectForKeyedSubscript:&off_8A78];
  v59 = v51;
  v47 = +[NSArray arrayWithObjects:&v59 count:1];
  v45 = +[NTKVideoPlayerArrayDataSource dataSourceForDevice:v2 withPosterImage:v49 andListings:v47];
  v61[0] = v45;
  v60[1] = &off_8A90;
  v39 = NTKImageNamedFromAssetsBundle();
  v43 = [v26 objectForKeyedSubscript:&off_8A90];
  v58 = v43;
  v38 = +[NSArray arrayWithObjects:&v58 count:1];
  v27 = +[NTKVideoPlayerArrayDataSource dataSourceForDevice:v2 withPosterImage:v39 andListings:v38];
  v61[1] = v27;
  v60[2] = &off_8AA8;
  v28 = NTKImageNamedFromAssetsBundle();
  v41 = v26;
  v29 = [v26 objectForKeyedSubscript:&off_8AA8];
  v57 = v29;
  v30 = +[NSArray arrayWithObjects:&v57 count:1];
  v31 = +[NTKVideoPlayerArrayDataSource dataSourceForDevice:v2 withPosterImage:v28 andListings:v30];
  v61[2] = v31;
  v60[3] = &off_8AC0;
  v32 = NTKImageNamedFromAssetsBundle();
  v33 = [v26 allValues];
  v34 = +[NTKVideoPlayerArrayDataSource dataSourceForDevice:v2 withPosterImage:v32 order:1 andListings:v33];
  v61[3] = v34;
  v35 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:4];

  v55[0] = &off_8A78;
  v55[1] = &off_8AC0;
  v56[0] = v52;
  v56[1] = v35;
  v36 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
  dataSources = self->_dataSources;
  self->_dataSources = v36;
}

- (void)reloadDataSources
{
  dataSources = self->_dataSources;
  id v7 = +[NSNumber numberWithUnsignedInteger:self->_currentDialShape];
  id v4 = [(NSDictionary *)dataSources objectForKeyedSubscript:v7];
  id v5 = +[NSNumber numberWithUnsignedInteger:self->_currentSmokeColor];
  double v6 = [v4 objectForKeyedSubscript:v5];
  [(NTKAnalogSmokeFaceView *)self _setVideoPlayerDataSource:v6];
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15) {
    return &off_8C60;
  }
  else {
    return 0;
  }
}

+ (id)_nameForSmokeColor:(unint64_t)a3
{
  if (a3 > 3) {
    return @"BlueGreen";
  }
  else {
    return *(&off_8308 + a3);
  }
}

- (id)_swatchImageForColorOption:(id)a3 size:(CGSize)a4
{
  id v4 = +[NTKAnalogSmokeFaceView _nameForSmokeColor:](NTKAnalogSmokeFaceView, "_nameForSmokeColor:", objc_msgSend(a3, "color", a4.width, a4.height));
  id v5 = +[NSString stringWithFormat:@"Swatch-Smoke-Color-%@", v4];

  double v6 = +[NTKVaporFaceBundle imageWithName:v5];

  return v6;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  if (a4 == 15)
  {
    v9 = [a5 objectForKeyedSubscript:&off_8AD8];
    id v10 = v8;
    id v11 = [v9 color];
    id v12 = [v10 dialShape];

    v13 = [(NTKAnalogSmokeFaceView *)self _swatchImageForSmokeColor:v11 andDialShape:v12];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKAnalogSmokeFaceView;
    v13 = [(NTKAnalogSmokeFaceView *)&v15 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:a5];
  }

  return v13;
}

- (id)_swatchImageForSmokeColor:(unint64_t)a3 andDialShape:(unint64_t)a4
{
  id v5 = +[NTKAnalogSmokeFaceView _nameForSmokeColor:a3];
  CFStringRef v6 = @"Circular";
  if (a4) {
    CFStringRef v6 = 0;
  }
  if (a4 == 1) {
    CFStringRef v6 = @"Fullscreen";
  }
  id v7 = +[NSString stringWithFormat:@"Swatch-Smoke-%@-%@", v6, v5];
  id v8 = +[NTKVaporFaceBundle imageWithName:v7];

  return v8;
}

- (unint64_t)currentSmokeColor
{
  return self->_currentSmokeColor;
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