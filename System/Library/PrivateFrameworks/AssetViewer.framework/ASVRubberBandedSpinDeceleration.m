@interface ASVRubberBandedSpinDeceleration
- (ASVRubberBand)rubberBand;
- (ASVRubberBandedSpinDeceleration)initWithVelocity:(float)a3 minEndDelta:(float)a4 startingOffset:(float)a5 decelerationRate:(float)a6 rubberBand:(id)a7;
- (float)currentOffset;
- (float)decelerationDelta;
- (float)previousRubberBandedOffset;
- (void)setCurrentOffset:(float)a3;
- (void)setPreviousRubberBandedOffset:(float)a3;
- (void)setRubberBand:(id)a3;
@end

@implementation ASVRubberBandedSpinDeceleration

- (ASVRubberBandedSpinDeceleration)initWithVelocity:(float)a3 minEndDelta:(float)a4 startingOffset:(float)a5 decelerationRate:(float)a6 rubberBand:(id)a7
{
  id v13 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ASVRubberBandedSpinDeceleration;
  *(float *)&double v14 = a3;
  *(float *)&double v15 = a4;
  *(float *)&double v16 = a6;
  v17 = [(ASVDampingDeceleration *)&v22 initWithVelocity:v14 minEndDelta:v15 decelerationRate:v16];
  v18 = v17;
  if (v17)
  {
    v17->_currentOffset = a5;
    objc_storeStrong((id *)&v17->_rubberBand, a7);
    *(float *)&double v19 = a5;
    [v13 rubberBandOffsetForOffset:v19];
    v18->_previousRubberBandedOffset = v20;
  }

  return v18;
}

- (float)decelerationDelta
{
  float v3 = 0.0;
  if (![(ASVDeceleration *)self isDecelerating]) {
    return v3;
  }
  v27.receiver = self;
  v27.super_class = (Class)ASVRubberBandedSpinDeceleration;
  [(ASVDampingDeceleration *)&v27 decelerationDelta];
  float v5 = v4;
  [(ASVRubberBandedSpinDeceleration *)self currentOffset];
  *(float *)&double v7 = v5 + v6;
  [(ASVRubberBandedSpinDeceleration *)self setCurrentOffset:v7];
  [(ASVRubberBandedSpinDeceleration *)self currentOffset];
  float v9 = v8;
  v10 = [(ASVRubberBandedSpinDeceleration *)self rubberBand];
  [v10 maxOffset];
  if (v9 <= v11 || ([(ASVDeceleration *)self velocity], v12 <= 0.0))
  {
    [(ASVRubberBandedSpinDeceleration *)self currentOffset];
    float v14 = v13;
    double v15 = [(ASVRubberBandedSpinDeceleration *)self rubberBand];
    [v15 minOffset];
    if (v14 >= v16)
    {
    }
    else
    {
      [(ASVDeceleration *)self velocity];
      float v18 = v17;

      if (v18 < 0.0) {
        goto LABEL_7;
      }
    }
    [(ASVRubberBandedSpinDeceleration *)self currentOffset];
    float v21 = v22;
    goto LABEL_10;
  }

LABEL_7:
  double v19 = [(ASVRubberBandedSpinDeceleration *)self rubberBand];
  [(ASVRubberBandedSpinDeceleration *)self currentOffset];
  objc_msgSend(v19, "rubberBandOffsetForOffset:");
  float v21 = v20;

LABEL_10:
  [(ASVRubberBandedSpinDeceleration *)self previousRubberBandedOffset];
  float v3 = v21 - v23;
  *(float *)&double v24 = v21;
  [(ASVRubberBandedSpinDeceleration *)self setPreviousRubberBandedOffset:v24];
  if ([(ASVDeceleration *)self frameCount])
  {
    [(ASVDeceleration *)self minEndDelta];
    if (fabsf(v3) <= v25)
    {
      [(ASVDeceleration *)self setIsDecelerating:0];
      return 0.0;
    }
  }
  return v3;
}

- (float)currentOffset
{
  return self->_currentOffset;
}

- (void)setCurrentOffset:(float)a3
{
  self->_currentOffset = a3;
}

- (float)previousRubberBandedOffset
{
  return self->_previousRubberBandedOffset;
}

- (void)setPreviousRubberBandedOffset:(float)a3
{
  self->_previousRubberBandedOffset = a3;
}

- (ASVRubberBand)rubberBand
{
  return self->_rubberBand;
}

- (void)setRubberBand:(id)a3
{
}

- (void).cxx_destruct
{
}

@end