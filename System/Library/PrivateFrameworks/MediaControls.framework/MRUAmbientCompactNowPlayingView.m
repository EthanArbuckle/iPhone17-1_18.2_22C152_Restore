@interface MRUAmbientCompactNowPlayingView
- (MRUAmbientCompactNowPlayingView)initWithWaveformView:(id)a3;
- (MRUWaveformView)waveformView;
- (void)layoutSubviews;
@end

@implementation MRUAmbientCompactNowPlayingView

- (MRUAmbientCompactNowPlayingView)initWithWaveformView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUAmbientCompactNowPlayingView;
  v6 = [(MRUAmbientCompactNowPlayingView *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_waveformView, a3);
    [(MRUAmbientCompactNowPlayingView *)v7 addSubview:v7->_waveformView];
  }

  return v7;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)MRUAmbientCompactNowPlayingView;
  [(MRUAmbientCompactNowPlayingView *)&v12 layoutSubviews];
  [(MRUAmbientCompactNowPlayingView *)self bounds];
  CGRectGetWidth(v13);
  [(MRUAmbientCompactNowPlayingView *)self bounds];
  UIRectCenteredRect();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(MRUAmbientCompactNowPlayingView *)self waveformView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (MRUWaveformView)waveformView
{
  return self->_waveformView;
}

- (void).cxx_destruct
{
}

@end