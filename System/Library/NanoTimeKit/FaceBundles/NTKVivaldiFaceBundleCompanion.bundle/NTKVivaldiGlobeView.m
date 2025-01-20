@interface NTKVivaldiGlobeView
- (BOOL)animating;
- (NSDate)date;
- (NTKVivaldiGlobeView)initWithDevice:(id)a3;
- (id)_assetNameForSecond:(unint64_t)a3;
- (id)_displayDate;
- (id)_globeImageForSecond:(unint64_t)a3;
- (id)_tritiumGlobe;
- (unint64_t)_secondsFromDate:(id)a3;
- (void)_displayCurrentGlobeImage:(BOOL)a3;
- (void)_loadDefaultGlobe;
- (void)_startGlobeTimer;
- (void)_stopGlobeTimer;
- (void)_updateGlobeImage;
- (void)applyColorPalette:(id)a3;
- (void)layoutSubviews;
- (void)setAnimating:(BOOL)a3;
- (void)setDate:(id)a3;
- (void)setTritiumFraction:(double)a3;
- (void)updateColorsForComplicationsEditingFraction:(double)a3 withColorPalette:(id)a4;
@end

@implementation NTKVivaldiGlobeView

- (NTKVivaldiGlobeView)initWithDevice:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NTKVivaldiGlobeView;
  v6 = [(NTKVivaldiGlobeView *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v7->_imageLock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.NanoTimeKit.NTKVivaldiGlobeImage", 0);
    imageQueue = v7->_imageQueue;
    v7->_imageQueue = (OS_dispatch_queue *)v8;

    v7->_currentGlobeSecond = -1;
    v7->_nextGlobeSecond = -1;
    v10 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    globeView = v7->_globeView;
    v7->_globeView = v10;

    v12 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    globeOutgoingView = v7->_globeOutgoingView;
    v7->_globeOutgoingView = v12;

    [(UIImageView *)v7->_globeOutgoingView setAlpha:0.0];
    v14 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    globeTritiumView = v7->_globeTritiumView;
    v7->_globeTritiumView = v14;

    [(UIImageView *)v7->_globeTritiumView setAlpha:0.0];
    [(NTKVivaldiGlobeView *)v7 addSubview:v7->_globeView];
    [(NTKVivaldiGlobeView *)v7 addSubview:v7->_globeOutgoingView];
    [(NTKVivaldiGlobeView *)v7 addSubview:v7->_globeTritiumView];
    [(NTKVivaldiGlobeView *)v7 _loadDefaultGlobe];
  }

  return v7;
}

- (void)layoutSubviews
{
  v3 = self->_device;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2691E2658);
  id WeakRetained = objc_loadWeakRetained(&qword_2691E2660);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v6 = (CLKDevice *)objc_loadWeakRetained(&qword_2691E2660);
    if (v6 == v3)
    {
      uint64_t v7 = [(CLKDevice *)v3 version];
      uint64_t v8 = qword_2691E2668;

      if (v7 == v8) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v9 = objc_storeWeak(&qword_2691E2660, v3);
  qword_2691E2668 = [(CLKDevice *)v3 version];

  [MEMORY[0x263F57940] largeDialDiameterForDevice:v3];
  qword_2691E2648 = v10;
  qword_2691E2650 = 0x4008000000000000;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691E2658);
  double v11 = *(double *)&qword_2691E2648;
  double v12 = *(double *)&qword_2691E2650;

  [(NTKVivaldiGlobeView *)self bounds];
  double v14 = v12 + (v13 - v11) * 0.5;
  double v16 = v12 + (v15 - v11) * 0.5;
  double v17 = v11 + v12 * -2.0;
  -[UIImageView setFrame:](self->_globeView, "setFrame:", v14, v16, v17, v17);
  -[UIImageView setFrame:](self->_globeOutgoingView, "setFrame:", v14, v16, v17, v17);
  globeTritiumView = self->_globeTritiumView;

  -[UIImageView setFrame:](globeTritiumView, "setFrame:", v14, v16, v17, v17);
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  if (self->_animating != a3)
  {
    self->_animating = a3;
    if (a3) {
      MEMORY[0x270F9A6D0](self, sel__startGlobeTimer);
    }
    else {
      MEMORY[0x270F9A6D0](self, sel__stopGlobeTimer);
    }
  }
}

- (void)_startGlobeTimer
{
  if (!self->_globeTimerToken)
  {
    objc_initWeak(&location, self);
    v3 = [MEMORY[0x263EFCF88] sharedInstance];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = sub_246CB399C;
    v6[3] = &unk_265200FD0;
    objc_copyWeak(&v7, &location);
    v4 = [v3 startUpdatesWithUpdateFrequency:1 withHandler:v6 identificationLog:&unk_26FB3B990];
    globeTimerToken = self->_globeTimerToken;
    self->_globeTimerToken = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_stopGlobeTimer
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (self->_globeTimerToken)
  {
    v3 = [MEMORY[0x263EFCF88] sharedInstance];
    [v3 stopUpdatesForToken:self->_globeTimerToken];

    globeTimerToken = self->_globeTimerToken;
    self->_globeTimerToken = 0;
  }
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);

  [(NTKVivaldiGlobeView *)self _updateGlobeImage];
}

- (id)_displayDate
{
  date = self->_date;
  if (date)
  {
    v3 = date;
  }
  else
  {
    v3 = [MEMORY[0x263F579B0] faceDate];
  }

  return v3;
}

- (unint64_t)_secondsFromDate:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  v6 = [v5 components:128 fromDate:v4];

  unint64_t v7 = [v6 second];
  return v7;
}

- (id)_assetNameForSecond:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Globe_%02d", a3);
}

- (void)_loadDefaultGlobe
{
  p_imageLock = &self->_imageLock;
  os_unfair_lock_lock(&self->_imageLock);
  if (self->_globeTritiumImage || self->_loadingTritiumImage)
  {
    os_unfair_lock_unlock(p_imageLock);
  }
  else
  {
    self->_loadingTritiumImage = 1;
    os_unfair_lock_unlock(p_imageLock);
    objc_initWeak(&location, self);
    imageQueue = self->_imageQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_246CB3D20;
    block[3] = &unk_265201040;
    objc_copyWeak(&v6, &location);
    block[4] = self;
    dispatch_async(imageQueue, block);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_updateGlobeImage
{
  v3 = [(NTKVivaldiGlobeView *)self _displayDate];
  id v4 = [(NTKVivaldiGlobeView *)self _secondsFromDate:v3];

  unint64_t v5 = ((unint64_t)v4 + 1) % 0x3C;
  if (v4) {
    uint64_t v6 = (uint64_t)v4 - 1;
  }
  else {
    uint64_t v6 = 59;
  }
  os_unfair_lock_lock(&self->_imageLock);
  int64_t currentGlobeSecond = self->_currentGlobeSecond;
  int64_t nextGlobeSecond = self->_nextGlobeSecond;
  if ((void *)currentGlobeSecond == v4 && nextGlobeSecond == v5)
  {
    os_unfair_lock_unlock(&self->_imageLock);
  }
  else
  {
    int64_t v10 = self->_currentGlobeSecond;
    if ((void *)nextGlobeSecond == v4)
    {
      self->_int64_t currentGlobeSecond = (int64_t)v4;
      objc_storeStrong((id *)&self->_currentGlobeSecondImage, self->_nextGlobeSecondImage);
      self->_int64_t nextGlobeSecond = -1;
      nextGlobeSecondImage = self->_nextGlobeSecondImage;
      self->_nextGlobeSecondImage = 0;

      int64_t v10 = self->_currentGlobeSecond;
    }
    if ((void *)v10 != v4)
    {
      self->_int64_t currentGlobeSecond = -1;
      currentGlobeSecondImage = self->_currentGlobeSecondImage;
      self->_currentGlobeSecondImage = 0;
    }
    if (self->_nextGlobeSecond != v5)
    {
      self->_int64_t nextGlobeSecond = -1;
      double v13 = self->_nextGlobeSecondImage;
      self->_nextGlobeSecondImage = 0;
    }
    if (!self->_loadingImages && (self->_nextGlobeSecond == -1 || self->_currentGlobeSecond == -1))
    {
      int v14 = 1;
      self->_loadingImages = 1;
    }
    else
    {
      int v14 = 0;
    }
    os_unfair_lock_unlock(&self->_imageLock);
    if ((void *)nextGlobeSecond == v4) {
      [(NTKVivaldiGlobeView *)self _displayCurrentGlobeImage:currentGlobeSecond == v6];
    }
    if (v14)
    {
      objc_initWeak(&location, self);
      imageQueue = self->_imageQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_246CB4114;
      block[3] = &unk_265201090;
      objc_copyWeak(v17, &location);
      v17[1] = v4;
      v17[2] = (id)(((unint64_t)v4 + 1) % 0x3C);
      block[4] = self;
      BOOL v18 = currentGlobeSecond == v6;
      dispatch_async(imageQueue, block);
      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_displayCurrentGlobeImage:(BOOL)a3
{
  BOOL v3 = a3;
  p_imageLock = &self->_imageLock;
  os_unfair_lock_lock(&self->_imageLock);
  uint64_t v6 = [(UIImageView *)self->_globeView image];
  if (!v6 || self->_tritiumFraction > 0.0) {
    BOOL v3 = 0;
  }
  unint64_t v7 = self->_currentGlobeSecondImage;
  os_unfair_lock_unlock(p_imageLock);
  if (v3)
  {
    [(UIImageView *)self->_globeOutgoingView setImage:v6];
    [(UIImageView *)self->_globeView setImage:v7];
    [(UIImageView *)self->_globeOutgoingView setAlpha:1.0];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_246CB45D0;
    v9[3] = &unk_265201018;
    v9[4] = self;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = sub_246CB45E8;
    v8[3] = &unk_2652010B8;
    v8[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v9 animations:v8 completion:0.2];
  }
  else
  {
    [(UIImageView *)self->_globeView setImage:v7];
  }
}

- (void)applyColorPalette:(id)a3
{
}

- (void)updateColorsForComplicationsEditingFraction:(double)a3 withColorPalette:(id)a4
{
  unint64_t v5 = (void *)MEMORY[0x263F1C550];
  id v6 = a4;
  unint64_t v7 = [v5 blackColor];
  uint64_t v8 = [v6 background];
  CLKInterpolateBetweenColors();
  id v20 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = [v6 background];
  int64_t v10 = CLKInterpolateBetweenColors();

  double v11 = [MEMORY[0x263F1C550] blackColor];
  double v12 = [v6 globeGrid];
  double v13 = CLKInterpolateBetweenColors();

  int v14 = [v6 globeGrid];
  double v15 = CLKInterpolateBetweenColors();

  [(UIImageView *)self->_globeView setTintColor:v15];
  [(UIImageView *)self->_globeOutgoingView setTintColor:v15];
  [(UIImageView *)self->_globeView setBackgroundColor:v10];
  [(UIImageView *)self->_globeOutgoingView setBackgroundColor:v10];
  globeTritiumView = self->_globeTritiumView;
  double v17 = objc_msgSend(v6, "globeGrid_tritium");
  [(UIImageView *)globeTritiumView setTintColor:v17];

  BOOL v18 = self->_globeTritiumView;
  v19 = [v6 background];

  [(UIImageView *)v18 setBackgroundColor:v19];
}

- (void)setTritiumFraction:(double)a3
{
  self->_tritiumFraction = a3;
  [(UIImageView *)self->_globeView setAlpha:1.0 - a3];
  [(UIImageView *)self->_globeOutgoingView setAlpha:0.0];
  globeTritiumView = self->_globeTritiumView;

  [(UIImageView *)globeTritiumView setAlpha:a3];
}

- (id)_globeImageForSecond:(unint64_t)a3
{
  BOOL v3 = [(NTKVivaldiGlobeView *)self _assetNameForSecond:a3];
  id v4 = +[NTKFaceBundle imageWithName:v3];

  return v4;
}

- (id)_tritiumGlobe
{
  return +[NTKFaceBundle imageWithName:@"Globe"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_nextGlobeSecondImage, 0);
  objc_storeStrong((id *)&self->_currentGlobeSecondImage, 0);
  objc_storeStrong((id *)&self->_imageQueue, 0);
  objc_storeStrong((id *)&self->_globeTimerToken, 0);
  objc_storeStrong((id *)&self->_globeTritiumView, 0);
  objc_storeStrong((id *)&self->_globeTritiumImage, 0);
  objc_storeStrong((id *)&self->_globeOutgoingView, 0);
  objc_storeStrong((id *)&self->_globeView, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end