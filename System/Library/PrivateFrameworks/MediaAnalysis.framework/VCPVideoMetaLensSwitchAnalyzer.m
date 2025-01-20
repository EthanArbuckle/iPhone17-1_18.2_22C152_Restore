@interface VCPVideoMetaLensSwitchAnalyzer
- (BOOL)hadZoom;
- (BOOL)settlingHadZoom;
- (VCPVideoMetaLensSwitchAnalyzer)init;
- (float)maxZoom;
- (float)minZoom;
- (float)settlingMaxZoom;
- (float)settlingMinZoom;
- (id)results;
- (void)setHadZoom:(BOOL)a3;
- (void)setMaxZoom:(float)a3;
- (void)setMinZoom:(float)a3;
- (void)setSettlingHadZoom:(BOOL)a3;
- (void)setSettlingMaxZoom:(float)a3;
- (void)setSettlingMinZoom:(float)a3;
@end

@implementation VCPVideoMetaLensSwitchAnalyzer

- (VCPVideoMetaLensSwitchAnalyzer)init
{
  v6.receiver = self;
  v6.super_class = (Class)VCPVideoMetaLensSwitchAnalyzer;
  v2 = [(VCPVideoMetaLensSwitchAnalyzer *)&v6 init];
  v3 = (VCPVideoMetaLensSwitchAnalyzer *)v2;
  if (v2)
  {
    *((_WORD *)v2 + 4) = 0;
    *(_OWORD *)(v2 + 12) = xmmword_1BC2837A0;
    v4 = v2;
  }

  return v3;
}

- (id)results
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithBool:", self->_hadZoom, @"quality");
  v9[0] = v3;
  v8[1] = @"ZoomChangeScore";
  v4 = [NSNumber numberWithBool:self->_settlingHadZoom];
  v9[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v10[0] = v5;
  objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  return v6;
}

- (BOOL)hadZoom
{
  return self->_hadZoom;
}

- (void)setHadZoom:(BOOL)a3
{
  self->_hadZoom = a3;
}

- (float)minZoom
{
  return self->_minZoom;
}

- (void)setMinZoom:(float)a3
{
  self->_minZoom = a3;
}

- (float)maxZoom
{
  return self->_maxZoom;
}

- (void)setMaxZoom:(float)a3
{
  self->_maxZoom = a3;
}

- (BOOL)settlingHadZoom
{
  return self->_settlingHadZoom;
}

- (void)setSettlingHadZoom:(BOOL)a3
{
  self->_settlingHadZoom = a3;
}

- (float)settlingMinZoom
{
  return self->_settlingMinZoom;
}

- (void)setSettlingMinZoom:(float)a3
{
  self->_settlingMinZoom = a3;
}

- (float)settlingMaxZoom
{
  return self->_settlingMaxZoom;
}

- (void)setSettlingMaxZoom:(float)a3
{
  self->_settlingMaxZoom = a3;
}

@end