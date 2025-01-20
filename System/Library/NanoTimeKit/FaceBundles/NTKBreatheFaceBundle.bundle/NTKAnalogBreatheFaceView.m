@interface NTKAnalogBreatheFaceView
- (BOOL)_shouldAnimateComplicationsOnTap;
- (id)_complicationsPlatterColor;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)_tapHighlightImage;
- (id)imageForEditOption:(id)a3;
- (unint64_t)currentVideoStyle;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyVideoPlayerTransform;
- (void)_configureTimeView:(id)a3;
- (void)_customizeVideoPlayerOnSetup;
- (void)_faceViewWasTapped;
- (void)_handleEitherScreenWake;
- (void)_updateDialSize;
- (void)customizeFaceViewForListing:(id)a3 changeEvent:(unint64_t)a4 animated:(BOOL)a5;
- (void)screenDidTurnOffAnimated:(BOOL)a3;
- (void)setCurrentVideoStyle:(unint64_t)a3;
- (void)setupDataSources;
@end

@implementation NTKAnalogBreatheFaceView

- (void)_configureTimeView:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKAnalogBreatheFaceView;
  id v3 = a3;
  [(NTKAnalogBreatheFaceView *)&v8 _configureTimeView:v3];
  v4 = objc_msgSend(v3, "secondHandView", v8.receiver, v8.super_class);
  [v4 setHidden:1];

  v5 = sub_4384();
  [v3 setInlayColor:v5];

  v6 = [v3 minuteHandView];

  v7 = sub_4384();
  [v6 setHandDotColor:v7];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v8 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKAnalogBreatheFaceView;
  [(NTKAnalogBreatheFaceView *)&v10 _applyOption:v8 forCustomEditMode:a4 slot:a5];
  if (a4 == 12)
  {
    id v9 = [(NTKAnalogBreatheFaceView *)self currentVideoStyle];
    if (v9 != [v8 style]) {
      -[NTKAnalogBreatheFaceView setCurrentVideoStyle:](self, "setCurrentVideoStyle:", [v8 style]);
    }
  }
}

- (void)setCurrentVideoStyle:(unint64_t)a3
{
  self->_currentVideoStyle = a3;
  editOptionDataSources = self->_editOptionDataSources;
  v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  v6 = [(NSDictionary *)editOptionDataSources objectForKeyedSubscript:v5];
  [(NTKAnalogBreatheFaceView *)self _setVideoPlayerDataSource:v6];

  [(NTKAnalogBreatheFaceView *)self _applyVideoPlayerTransform];

  [(NTKAnalogBreatheFaceView *)self _updateDialSize];
}

- (void)customizeFaceViewForListing:(id)a3 changeEvent:(unint64_t)a4 animated:(BOOL)a5
{
  v5.receiver = self;
  v5.super_class = (Class)NTKAnalogBreatheFaceView;
  [(NTKAnalogBreatheFaceView *)&v5 customizeFaceViewForListing:a3 changeEvent:a4 animated:a5];
}

- (void)_customizeVideoPlayerOnSetup
{
  [(NTKAnalogBreatheFaceView *)self setupDataSources];
  id v3 = [(NTKAnalogBreatheFaceView *)self videoPlayerView];
  [v3 setPlayerBehavior:1];

  v4 = [(NTKAnalogBreatheFaceView *)self videoPlayerView];
  [v4 setPausedViewEnabled:0];

  unint64_t currentVideoStyle = self->_currentVideoStyle;

  [(NTKAnalogBreatheFaceView *)self setCurrentVideoStyle:currentVideoStyle];
}

- (void)_handleEitherScreenWake
{
  self->_shouldApplyTransform = 1;
  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogBreatheFaceView;
  [(NTKAnalogBreatheFaceView *)&v3 _handleEitherScreenWake];
  [(NTKAnalogBreatheFaceView *)self _takeBacklightAssertion];
  [(NTKAnalogBreatheFaceView *)self _applyVideoPlayerTransform];
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAnalogBreatheFaceView;
  [(NTKAnalogBreatheFaceView *)&v4 screenDidTurnOffAnimated:a3];
  [(NTKAnalogBreatheFaceView *)self _releaseBacklightAssertion];
}

- (void)_faceViewWasTapped
{
  NTKDefaultAppLaunchLocation();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  NTKLaunchApp();
}

- (id)_tapHighlightImage
{
  id v2 = [(NTKAnalogBreatheFaceView *)self device];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_CB80);
  id WeakRetained = objc_loadWeakRetained(&qword_CB88);
  if (WeakRetained)
  {
    objc_super v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_CB88);
    if (v5 == v2)
    {
      id v6 = [v2 version];
      uint64_t v7 = qword_CB90;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_CB88, v2);
  qword_CB90 = (uint64_t)[v2 version];

  sub_4DA8(v9, v2);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_CB80);
  if (qword_CBA0 != -1) {
    dispatch_once(&qword_CBA0, &stru_8388);
  }
  id v10 = (id)qword_CB78;

  return v10;
}

- (id)_complicationsPlatterColor
{
  id v2 = sub_4800();
  objc_super v3 = NTKColorByPremultiplyingAlpha();

  return v3;
}

- (BOOL)_shouldAnimateComplicationsOnTap
{
  return 0;
}

- (id)imageForEditOption:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 style];
    editOptionDataSources = self->_editOptionDataSources;
    uint64_t v7 = +[NSNumber numberWithUnsignedInteger:v5];
    id v8 = [(NSDictionary *)editOptionDataSources objectForKeyedSubscript:v7];
    uint64_t v9 = [v8 posterImage];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_applyVideoPlayerTransform
{
  if (self->_currentVideoStyle == 1 && self->_shouldApplyTransform)
  {
    self->_shouldApplyTransform = 0;
    [(NTKAnalogBreatheFaceView *)self _transformVideoPlayerView:2];
  }
  else
  {
    [(NTKAnalogBreatheFaceView *)self _transformVideoPlayerView:0];
  }
}

- (void)_updateDialSize
{
  unint64_t currentVideoStyle = self->_currentVideoStyle;
  if (currentVideoStyle > 3 || currentVideoStyle == 1)
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  else
  {
    id v5 = [(NTKAnalogBreatheFaceView *)self device];
    +[NTKAnalogUtilities dialSizeForDevice:v5];
    double width = v6;
    double height = v8;
  }

  -[NTKAnalogBreatheFaceView setVideoDialSize:](self, "setVideoDialSize:", width, height);
}

- (void)setupDataSources
{
  id v19 = +[NSMutableDictionary dictionary];
  objc_super v3 = [(NTKAnalogBreatheFaceView *)self device];
  id v4 = NTKImageNamedFromAssetsBundle();
  id v5 = +[NTKVideoPlayerArrayDataSource dataSourceForDevice:v3 withPosterImage:v4 order:1 endBehavior:2 andFilenames:&off_8C08];
  [v19 setObject:v5 forKeyedSubscript:&off_89E0];

  double v6 = [(NTKAnalogBreatheFaceView *)self device];
  uint64_t v7 = NTKImageNamedFromAssetsBundle();
  double v8 = +[NTKVideoPlayerSingleVideoDataSource dataSourceForDevice:v6 withPosterImage:v7 endBehavior:2 andFilename:@"Breathe_Flower"];
  [v19 setObject:v8 forKeyedSubscript:&off_89F8];

  uint64_t v9 = [(NTKAnalogBreatheFaceView *)self device];
  id v10 = NTKImageNamedFromAssetsBundle();
  v11 = +[NTKVideoPlayerSingleVideoDataSource dataSourceForDevice:v9 withPosterImage:v10 endBehavior:2 andFilename:@"Breathe_Rings"];
  [v19 setObject:v11 forKeyedSubscript:&off_8A10];

  v12 = [(NTKAnalogBreatheFaceView *)self device];
  id v13 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
  LODWORD(v10) = [v12 supportsCapability:v13];

  if (v10)
  {
    v14 = [(NTKAnalogBreatheFaceView *)self device];
    v15 = NTKImageNamedFromAssetsBundle();
    v16 = +[NTKVideoPlayerSingleVideoDataSource dataSourceForDevice:v14 withPosterImage:v15 endBehavior:2 andFilename:@"Breathe_Orbs"];
    [v19 setObject:v16 forKeyedSubscript:&off_8A28];
  }
  v17 = (NSDictionary *)[v19 copy];
  editOptionDataSources = self->_editOptionDataSources;
  self->_editOptionDataSources = v17;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v5 = [a3 style];
  if ((unint64_t)v5 > 3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = (uint64_t)*(&off_8408 + (void)v5);
  }

  return +[NTKBreatheFaceBundle imageWithName:v6];
}

- (unint64_t)currentVideoStyle
{
  return self->_currentVideoStyle;
}

- (void).cxx_destruct
{
}

@end