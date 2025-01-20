@interface HUVelocitySampler
- (CGVector)velocity;
- (HUVelocitySample)currentSample;
- (HUVelocitySample)previousSample;
- (void)addTouchSample:(CGPoint)a3;
- (void)reset;
- (void)setCurrentSample:(id)a3;
- (void)setPreviousSample:(id)a3;
@end

@implementation HUVelocitySampler

- (void)addTouchSample:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = CACurrentMediaTime();
  uint64_t v7 = [(HUVelocitySampler *)self currentSample];
  if (v7
    && (v8 = (void *)v7,
        [(HUVelocitySampler *)self currentSample],
        v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_msgSend(v9, "isSampleDistinctFromPoint:", x, y),
        v9,
        v8,
        (v10 & 1) == 0))
  {
    v20 = [(HUVelocitySampler *)self currentSample];
    objc_msgSend(v20, "setEnd:", x, y);

    id v22 = [(HUVelocitySampler *)self currentSample];
    [v22 setEndTime:v6];
  }
  else
  {
    v11 = [(HUVelocitySampler *)self currentSample];

    if (v11)
    {
      v12 = [(HUVelocitySampler *)self currentSample];
      [v12 end];
      double v14 = v13;
      double v16 = v15;

      v17 = [(HUVelocitySampler *)self currentSample];
      [v17 endTime];
      double v19 = v18;
    }
    else
    {
      double v14 = x;
      double v16 = y;
      double v19 = v6;
    }
    v21 = [(HUVelocitySampler *)self currentSample];
    [(HUVelocitySampler *)self setPreviousSample:v21];

    +[HUVelocitySample sampleWithStart:end:startTime:endTime:](HUVelocitySample, "sampleWithStart:end:startTime:endTime:", v14, v16, x, y, v19, v6);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    [(HUVelocitySampler *)self setCurrentSample:v22];
  }
}

- (void)reset
{
  [(HUVelocitySampler *)self setPreviousSample:0];

  [(HUVelocitySampler *)self setCurrentSample:0];
}

- (CGVector)velocity
{
  v3 = [(HUVelocitySampler *)self currentSample];

  if (v3)
  {
    v4 = [(HUVelocitySampler *)self currentSample];
    [v4 velocity];
    double v6 = v5;
    double v8 = v7;

    uint64_t v9 = [(HUVelocitySampler *)self previousSample];
    if (v9)
    {
      char v10 = (void *)v9;
      v11 = [(HUVelocitySampler *)self previousSample];
      [v11 dt];
      double v13 = v12;

      if (v13 > 0.00000011920929)
      {
        double v14 = [(HUVelocitySampler *)self previousSample];
        [v14 velocity];
        double v16 = v15;
        double v18 = v17;

        double v6 = v16 * 0.75 + v6 * 0.25;
        double v8 = v18 * 0.75 + v8 * 0.25;
      }
    }
  }
  else
  {
    double v6 = 0.0;
    double v8 = 0.0;
  }
  double v19 = v6;
  double v20 = v8;
  result.ddouble y = v20;
  result.ddouble x = v19;
  return result;
}

- (HUVelocitySample)currentSample
{
  return self->_currentSample;
}

- (void)setCurrentSample:(id)a3
{
}

- (HUVelocitySample)previousSample
{
  return self->_previousSample;
}

- (void)setPreviousSample:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSample, 0);

  objc_storeStrong((id *)&self->_currentSample, 0);
}

@end