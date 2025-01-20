@interface LPVisualMediaViewStyle
- (CAMediaTimingFunction)pulsingLoadIndicatorTimingFunction;
- (LPImageViewStyle)muteButton;
- (LPPadding)muteButtonPadding;
- (LPVideoPlayButtonStyle)playButton;
- (LPVisualMediaViewStyle)initWithPlatform:(int64_t)a3;
- (UIColor)pulsingLoadIndicatorColor;
- (double)muteButtonHighlightedOpacity;
- (double)muteButtonOpacity;
- (double)pulsingLoadIndicatorDuration;
- (double)pulsingLoadIndicatorMaximumOpacity;
- (void)setMuteButtonHighlightedOpacity:(double)a3;
- (void)setMuteButtonOpacity:(double)a3;
- (void)setPulsingLoadIndicatorColor:(id)a3;
- (void)setPulsingLoadIndicatorDuration:(double)a3;
- (void)setPulsingLoadIndicatorMaximumOpacity:(double)a3;
- (void)setPulsingLoadIndicatorTimingFunction:(id)a3;
@end

@implementation LPVisualMediaViewStyle

- (LPVisualMediaViewStyle)initWithPlatform:(int64_t)a3
{
  v24.receiver = self;
  v24.super_class = (Class)LPVisualMediaViewStyle;
  v4 = [(LPVisualMediaViewStyle *)&v24 init];
  if (v4)
  {
    v5 = [[LPVideoPlayButtonStyle alloc] initWithPlatform:a3];
    v6 = (void *)*((void *)v4 + 1);
    *((void *)v4 + 1) = v5;

    v7 = objc_alloc_init(LPImageViewStyle);
    v8 = (void *)*((void *)v4 + 2);
    *((void *)v4 + 2) = v7;

    v9 = [[LPSize alloc] initWithSquareSize:30.0];
    [*((id *)v4 + 2) setFixedSize:v9];

    v10 = objc_alloc_init(LPPadding);
    v11 = (void *)*((void *)v4 + 3);
    *((void *)v4 + 3) = v10;

    v12 = [[LPPointUnit alloc] initWithValue:12.0];
    [*((id *)v4 + 3) setTrailing:v12];

    v13 = [*((id *)v4 + 3) trailing];
    [*((id *)v4 + 3) setLeading:v13];

    v14 = [[LPPointUnit alloc] initWithValue:11.0];
    [*((id *)v4 + 3) setTop:v14];

    v15 = [*((id *)v4 + 3) top];
    [*((id *)v4 + 3) setBottom:v15];

    *((_OWORD *)v4 + 2) = xmmword_1A3711AD0;
    uint64_t v16 = [MEMORY[0x1E4FB1618] blackColor];
    v17 = (void *)*((void *)v4 + 6);
    *((void *)v4 + 6) = v16;

    *(_OWORD *)(v4 + 56) = xmmword_1A3711AD0;
    LODWORD(v18) = 1058306785;
    LODWORD(v19) = 1.0;
    uint64_t v20 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.500000117 :0.0 :v18 :v19];
    v21 = (void *)*((void *)v4 + 9);
    *((void *)v4 + 9) = v20;

    v22 = v4;
  }

  return (LPVisualMediaViewStyle *)v4;
}

- (LPVideoPlayButtonStyle)playButton
{
  return self->_playButton;
}

- (LPImageViewStyle)muteButton
{
  return self->_muteButton;
}

- (LPPadding)muteButtonPadding
{
  return self->_muteButtonPadding;
}

- (double)muteButtonOpacity
{
  return self->_muteButtonOpacity;
}

- (void)setMuteButtonOpacity:(double)a3
{
  self->_muteButtonOpacity = a3;
}

- (double)muteButtonHighlightedOpacity
{
  return self->_muteButtonHighlightedOpacity;
}

- (void)setMuteButtonHighlightedOpacity:(double)a3
{
  self->_muteButtonHighlightedOpacity = a3;
}

- (UIColor)pulsingLoadIndicatorColor
{
  return self->_pulsingLoadIndicatorColor;
}

- (void)setPulsingLoadIndicatorColor:(id)a3
{
}

- (double)pulsingLoadIndicatorMaximumOpacity
{
  return self->_pulsingLoadIndicatorMaximumOpacity;
}

- (void)setPulsingLoadIndicatorMaximumOpacity:(double)a3
{
  self->_pulsingLoadIndicatorMaximumOpacity = a3;
}

- (double)pulsingLoadIndicatorDuration
{
  return self->_pulsingLoadIndicatorDuration;
}

- (void)setPulsingLoadIndicatorDuration:(double)a3
{
  self->_pulsingLoadIndicatorDuration = a3;
}

- (CAMediaTimingFunction)pulsingLoadIndicatorTimingFunction
{
  return self->_pulsingLoadIndicatorTimingFunction;
}

- (void)setPulsingLoadIndicatorTimingFunction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pulsingLoadIndicatorTimingFunction, 0);
  objc_storeStrong((id *)&self->_pulsingLoadIndicatorColor, 0);
  objc_storeStrong((id *)&self->_muteButtonPadding, 0);
  objc_storeStrong((id *)&self->_muteButton, 0);

  objc_storeStrong((id *)&self->_playButton, 0);
}

@end