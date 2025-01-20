@interface HazeProperties
- (HazeProperties)init;
- (float)evmExpRatio;
- (float)evtBkt;
- (float)ispRes;
- (float)maxHazePercentile;
- (float)min_display_black;
- (float)reluC1;
- (float)reluC2;
- (float)reluC3;
- (float)reluC4;
- (float)reluC5;
- (float)sr_min;
- (float)sr_pow;
- (float)sr_sat;
- (float)sr_var;
- (void)reset;
- (void)setEvmExpRatio:(float)a3;
- (void)setEvtBkt:(float)a3;
- (void)setIspRes:(float)a3;
- (void)setMaxHazePercentile:(float)a3;
- (void)setMin_display_black:(float)a3;
- (void)setReluC1:(float)a3;
- (void)setReluC2:(float)a3;
- (void)setReluC3:(float)a3;
- (void)setReluC4:(float)a3;
- (void)setReluC5:(float)a3;
- (void)setSr_min:(float)a3;
- (void)setSr_pow:(float)a3;
- (void)setSr_sat:(float)a3;
- (void)setSr_var:(float)a3;
@end

@implementation HazeProperties

- (HazeProperties)init
{
  v6.receiver = self;
  v6.super_class = (Class)HazeProperties;
  v2 = [(HazeProperties *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(HazeProperties *)v2 reset];
    v4 = v3;
  }

  return v3;
}

- (void)reset
{
  *(_OWORD *)&self->_ispRes = xmmword_23FF51280;
  *(_OWORD *)&self->_reluC2 = xmmword_23FF51290;
  *(_OWORD *)&self->_min_display_black = xmmword_23FF512A0;
  *(void *)&self->_sr_sat = 0x3B449BA640000000;
}

- (float)ispRes
{
  return self->_ispRes;
}

- (void)setIspRes:(float)a3
{
  self->_ispRes = a3;
}

- (float)evmExpRatio
{
  return self->_evmExpRatio;
}

- (void)setEvmExpRatio:(float)a3
{
  self->_evmExpRatio = a3;
}

- (float)evtBkt
{
  return self->_evtBkt;
}

- (void)setEvtBkt:(float)a3
{
  self->_evtBkt = a3;
}

- (float)reluC1
{
  return self->_reluC1;
}

- (void)setReluC1:(float)a3
{
  self->_reluC1 = a3;
}

- (float)reluC2
{
  return self->_reluC2;
}

- (void)setReluC2:(float)a3
{
  self->_reluC2 = a3;
}

- (float)reluC3
{
  return self->_reluC3;
}

- (void)setReluC3:(float)a3
{
  self->_reluC3 = a3;
}

- (float)reluC4
{
  return self->_reluC4;
}

- (void)setReluC4:(float)a3
{
  self->_reluC4 = a3;
}

- (float)reluC5
{
  return self->_reluC5;
}

- (void)setReluC5:(float)a3
{
  self->_reluC5 = a3;
}

- (float)min_display_black
{
  return self->_min_display_black;
}

- (void)setMin_display_black:(float)a3
{
  self->_min_display_black = a3;
}

- (float)sr_min
{
  return self->_sr_min;
}

- (void)setSr_min:(float)a3
{
  self->_sr_min = a3;
}

- (float)sr_var
{
  return self->_sr_var;
}

- (void)setSr_var:(float)a3
{
  self->_sr_var = a3;
}

- (float)sr_pow
{
  return self->_sr_pow;
}

- (void)setSr_pow:(float)a3
{
  self->_sr_pow = a3;
}

- (float)sr_sat
{
  return self->_sr_sat;
}

- (void)setSr_sat:(float)a3
{
  self->_sr_sat = a3;
}

- (float)maxHazePercentile
{
  return self->_maxHazePercentile;
}

- (void)setMaxHazePercentile:(float)a3
{
  self->_maxHazePercentile = a3;
}

@end