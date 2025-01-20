@interface HUWaveformSlice
- (BOOL)isHidden;
- (CALayer)waveformlayer;
- (CGRect)layerFrame;
- (double)opacity;
- (void)dealloc;
- (void)setHidden:(BOOL)a3;
- (void)setLayerFrame:(CGRect)a3;
- (void)setOpacity:(double)a3;
- (void)setWaveformlayer:(id)a3;
@end

@implementation HUWaveformSlice

- (void)dealloc
{
  [(CALayer *)self->_waveformlayer removeFromSuperlayer];
  v3.receiver = self;
  v3.super_class = (Class)HUWaveformSlice;
  [(HUWaveformSlice *)&v3 dealloc];
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (CALayer)waveformlayer
{
  return self->_waveformlayer;
}

- (void)setWaveformlayer:(id)a3
{
}

- (CGRect)layerFrame
{
  double x = self->_layerFrame.origin.x;
  double y = self->_layerFrame.origin.y;
  double width = self->_layerFrame.size.width;
  double height = self->_layerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLayerFrame:(CGRect)a3
{
  self->_layerFrame = a3;
}

- (void).cxx_destruct
{
}

@end