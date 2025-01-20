@interface ASVRubberBand
- (ASVRubberBand)initWithRubberBandFactor:(float)a3 minOffset:(float)a4 maxOffset:(float)a5 overshoot:(float)a6;
- (BOOL)offsetIsWithinRubberBandedRange:(float)a3;
- (float)maxOffset;
- (float)minOffset;
- (float)offsetForRubberBandOffset:(float)a3;
- (float)overshoot;
- (float)rubberBandFactor;
- (float)rubberBandOffsetForOffset:(float)a3;
- (void)setMaxOffset:(float)a3;
- (void)setMinOffset:(float)a3;
- (void)setOvershoot:(float)a3;
- (void)setRubberBandFactor:(float)a3;
@end

@implementation ASVRubberBand

- (ASVRubberBand)initWithRubberBandFactor:(float)a3 minOffset:(float)a4 maxOffset:(float)a5 overshoot:(float)a6
{
  v11.receiver = self;
  v11.super_class = (Class)ASVRubberBand;
  result = [(ASVRubberBand *)&v11 init];
  if (result)
  {
    result->_rubberBandFactor = a3;
    result->_minOffset = a4;
    result->_maxOffset = a5;
    result->_overshoot = a6;
  }
  return result;
}

- (float)rubberBandOffsetForOffset:(float)a3
{
  [(ASVRubberBand *)self maxOffset];
  if (v5 >= a3)
  {
    [(ASVRubberBand *)self minOffset];
    if (v16 <= a3)
    {
      return a3;
    }
    else
    {
      [(ASVRubberBand *)self minOffset];
      float v18 = v17 - a3;
      [(ASVRubberBand *)self overshoot];
      float v20 = v18 / v19;
      [(ASVRubberBand *)self rubberBandFactor];
      float v22 = 1.0 - (float)(1.0 / (float)((float)(v21 * v20) + 1.0));
      [(ASVRubberBand *)self minOffset];
      float v24 = v23;
      [(ASVRubberBand *)self overshoot];
      return v24 - (float)(v22 * v25);
    }
  }
  else
  {
    [(ASVRubberBand *)self maxOffset];
    float v7 = a3 - v6;
    [(ASVRubberBand *)self overshoot];
    float v9 = v7 / v8;
    [(ASVRubberBand *)self rubberBandFactor];
    float v11 = 1.0 - (float)(1.0 / (float)((float)(v10 * v9) + 1.0));
    [(ASVRubberBand *)self overshoot];
    float v13 = v12;
    [(ASVRubberBand *)self maxOffset];
    return v14 + (float)(v11 * v13);
  }
}

- (float)offsetForRubberBandOffset:(float)a3
{
  [(ASVRubberBand *)self maxOffset];
  if (v5 >= a3)
  {
    [(ASVRubberBand *)self minOffset];
    if (v17 > a3)
    {
      [(ASVRubberBand *)self minOffset];
      float v19 = v18 - a3;
      [(ASVRubberBand *)self overshoot];
      float v21 = (float)(v19 / v20) + -1.0;
      if (v21 != 0.0)
      {
        float v22 = (float)(-1.0 / v21) + -1.0;
        [(ASVRubberBand *)self rubberBandFactor];
        float v24 = v23;
        [(ASVRubberBand *)self minOffset];
        float v26 = v25;
        [(ASVRubberBand *)self overshoot];
        return v26 + (float)((float)((float)-v22 / v24) * v27);
      }
    }
  }
  else
  {
    [(ASVRubberBand *)self maxOffset];
    float v7 = a3 - v6;
    [(ASVRubberBand *)self overshoot];
    float v9 = (float)(v7 / v8) + -1.0;
    if (v9 != 0.0)
    {
      float v10 = (float)(-1.0 / v9) + -1.0;
      [(ASVRubberBand *)self rubberBandFactor];
      float v12 = v10 / v11;
      [(ASVRubberBand *)self overshoot];
      float v14 = v13;
      [(ASVRubberBand *)self maxOffset];
      return v15 + (float)(v12 * v14);
    }
  }
  return a3;
}

- (BOOL)offsetIsWithinRubberBandedRange:(float)a3
{
  [(ASVRubberBand *)self maxOffset];
  if (v5 < a3) {
    return 1;
  }
  [(ASVRubberBand *)self minOffset];
  return v7 > a3;
}

- (float)rubberBandFactor
{
  return self->_rubberBandFactor;
}

- (void)setRubberBandFactor:(float)a3
{
  self->_rubberBandFactor = a3;
}

- (float)minOffset
{
  return self->_minOffset;
}

- (void)setMinOffset:(float)a3
{
  self->_minOffset = a3;
}

- (float)maxOffset
{
  return self->_maxOffset;
}

- (void)setMaxOffset:(float)a3
{
  self->_maxOffset = a3;
}

- (float)overshoot
{
  return self->_overshoot;
}

- (void)setOvershoot:(float)a3
{
  self->_overshoot = a3;
}

@end