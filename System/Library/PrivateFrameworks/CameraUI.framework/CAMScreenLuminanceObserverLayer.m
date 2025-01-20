@interface CAMScreenLuminanceObserverLayer
- (CAMScreenLuminanceObserverLayer)init;
- (double)_interpolatedGainModulation;
- (id)gainModulationCallback;
- (void)backdropLayer:(id)a3 didChangeLuma:(double)a4;
- (void)setGainModulationCallback:(id)a3;
- (void)set_interpolatedGainModulation:(double)a3;
@end

@implementation CAMScreenLuminanceObserverLayer

- (CAMScreenLuminanceObserverLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)CAMScreenLuminanceObserverLayer;
  v2 = [(CAMScreenLuminanceObserverLayer *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->__interpolatedGainModulation = 0.0;
    [(CAMScreenLuminanceObserverLayer *)v2 setDelegate:v2];
    [(CAMScreenLuminanceObserverLayer *)v3 setCaptureOnly:1];
    [(CAMScreenLuminanceObserverLayer *)v3 setTracksLuma:1];
  }
  return v3;
}

- (void)backdropLayer:(id)a3 didChangeLuma:(double)a4
{
  v6 = [(CAMScreenLuminanceObserverLayer *)self gainModulationCallback];

  if (v6)
  {
    self->__interpolatedGainModulation = ((a4 + -0.25) * 4.0 / 0.75 + 0.0) * 0.25
                                       + self->__interpolatedGainModulation * 0.75;
    v7 = [(CAMScreenLuminanceObserverLayer *)self gainModulationCallback];
    v7[2](self->__interpolatedGainModulation);
  }
}

- (id)gainModulationCallback
{
  return self->_gainModulationCallback;
}

- (void)setGainModulationCallback:(id)a3
{
}

- (double)_interpolatedGainModulation
{
  return self->__interpolatedGainModulation;
}

- (void)set_interpolatedGainModulation:(double)a3
{
  self->__interpolatedGainModulation = a3;
}

- (void).cxx_destruct
{
}

@end