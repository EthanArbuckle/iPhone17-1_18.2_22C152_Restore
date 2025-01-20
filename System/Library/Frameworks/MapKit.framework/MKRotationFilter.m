@interface MKRotationFilter
- (BOOL)hasAdditionalSnappingAngle;
- (BOOL)isSnappedToNorth;
- (MKRotationFilter)init;
- (MKRotationFilter)initWithMapLayer:(id)a3;
- (MKRotationFilterDelegate)delegate;
- (double)additionalSnappingAngle;
- (void)setAdditionalSnappingAngle:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setSnappedToNorth:(BOOL)a3;
- (void)snapToNorthAnimated:(BOOL)a3 forceTrueNorth:(BOOL)a4;
- (void)startRotatingWithFocusPoint:(CGPoint)a3 withSnapping:(BOOL)a4;
- (void)stopRotatingWithFocusPoint:(CGPoint)a3;
- (void)updateRotationWithFocusPoint:(CGPoint)a3 newValue:(double)a4;
- (void)updateSnappedToNorth;
@end

@implementation MKRotationFilter

- (void)setDelegate:(id)a3
{
}

- (MKRotationFilter)initWithMapLayer:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKRotationFilter;
  v5 = [(MKRotationFilter *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_mapLayer, v4);
  }

  return v6;
}

- (MKRotationFilter)init
{
  result = (MKRotationFilter *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (void)startRotatingWithFocusPoint:(CGPoint)a3 withSnapping:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  objc_super v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v13 = [v8 objectForKey:@"RotationFilterSnappingThreshold"];

  if (v13)
  {
    [v13 doubleValue];
    kRotationSnappingThreshold = v9;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapLayer);
  objc_msgSend(WeakRetained, "startRotatingWithFocusPoint:", x, y);

  id v11 = objc_loadWeakRetained((id *)&self->_mapLayer);
  [v11 yaw];
  self->_gestureStartAngle = v12;

  self->_snappingEnabled = a4;
  [(MKRotationFilter *)self updateSnappedToNorth];
  self->_snappedAtStart = self->_snappedToNorth;
}

- (void)updateRotationWithFocusPoint:(CGPoint)a3 newValue:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  double v7 = a4 * 57.2957795;
  if (!self->_snappingEnabled) {
    goto LABEL_35;
  }
  CGFloat v23 = a3.x;
  CGFloat v8 = a3.y;
  long double v9 = self->_gestureStartAngle + a4 * -57.2957795;
  double v10 = fmod(v9, 360.0);
  if (v9 >= 0.0) {
    double v11 = v10;
  }
  else {
    double v11 = v10 + 360.0;
  }
  double v12 = 0.0;
  double v13 = vabdd_f64(0.0, v11);
  if (v13 <= 180.0) {
    goto LABEL_8;
  }
  if (v11 > 0.0)
  {
    double v12 = 360.0;
LABEL_8:
    double v14 = v11;
    goto LABEL_10;
  }
  double v14 = v11 + 360.0;
LABEL_10:
  double v15 = v14 - v12;
  long double additionalSnappingAngle = self->_additionalSnappingAngle;
  double v17 = fmod(additionalSnappingAngle, 360.0);
  if (additionalSnappingAngle < 0.0) {
    double v17 = v17 + 360.0;
  }
  double v18 = vabdd_f64(v17, v11);
  double v19 = v17;
  double v20 = v11;
  if (v18 > 180.0)
  {
    if (v17 >= v11)
    {
      double v20 = v11 + 360.0;
      double v19 = v17;
    }
    else
    {
      double v19 = v17 + 360.0;
      double v20 = v11;
    }
  }
  if (fabs(v15) >= *(double *)&kRotationSnappingThreshold)
  {
    if (vabdd_f64(v20, v19) >= *(double *)&kRotationSnappingThreshold)
    {
      uint64_t v21 = 0;
      goto LABEL_25;
    }
    if (!self->_snappedAtStart)
    {
      if (v18 > 180.0)
      {
        double y = v8;
        double x = v23;
        if (v17 >= v11) {
          double v11 = v11 + 360.0;
        }
        else {
          double v17 = v17 + 360.0;
        }
        goto LABEL_31;
      }
LABEL_30:
      double y = v8;
      double x = v23;
LABEL_31:
      double v7 = v7 + v11 - v17;
      uint64_t v21 = 1;
      goto LABEL_32;
    }
  }
  else if (!self->_snappedAtStart)
  {
    double v17 = 0.0;
    if (v13 > 180.0)
    {
      if (v11 <= 0.0) {
        double v11 = v11 + 360.0;
      }
      else {
        double v17 = 360.0;
      }
    }
    goto LABEL_30;
  }
  uint64_t v21 = 1;
LABEL_25:
  double y = v8;
  double x = v23;
LABEL_32:
  if (self->_snappedToNorth != v21)
  {
    [(MKRotationFilter *)self setSnappedToNorth:v21];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained rotationFilter:self didChangeSnapping:v21];

    if ((v21 & 1) == 0) {
      self->_snappedAtStart = 0;
    }
  }
LABEL_35:
  id v24 = objc_loadWeakRetained((id *)&self->_mapLayer);
  objc_msgSend(v24, "updateRotationWithFocusPoint:newValue:", x, y, v7 * 0.0174532925);
}

- (void)stopRotatingWithFocusPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapLayer);
  objc_msgSend(WeakRetained, "stopRotatingWithFocusPoint:", x, y);
}

- (void)snapToNorthAnimated:(BOOL)a3 forceTrueNorth:(BOOL)a4
{
  BOOL v5 = a3;
  double additionalSnappingAngle = 0.0;
  if ([(MKRotationFilter *)self hasAdditionalSnappingAngle] && !a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mapLayer);
    [WeakRetained yaw];
    long double v10 = v9;

    double v11 = fmod(v10, 360.0);
    if (v10 >= 0.0) {
      double v12 = v11;
    }
    else {
      double v12 = v11 + 360.0;
    }
    double v13 = 0.0;
    if (fabs(v12) <= 180.0)
    {
      double v14 = v12;
    }
    else
    {
      double v14 = v12;
      double v13 = 360.0;
      if (v12 < 0.0)
      {
        double v14 = v12 + 360.0;
        double v13 = 0.0;
      }
    }
    double v15 = vabdd_f64(v13, v14);
    double additionalSnappingAngle = self->_additionalSnappingAngle;
    double v16 = fmod(additionalSnappingAngle, 360.0);
    if (additionalSnappingAngle < 0.0) {
      double v16 = v16 + 360.0;
    }
    if (vabdd_f64(v12, v16) > 180.0)
    {
      if (v12 >= v16) {
        double v16 = v16 + 360.0;
      }
      else {
        double v12 = v12 + 360.0;
      }
    }
    if (v15 >= 0.1)
    {
      double v17 = vabdd_f64(v16, v12);
      if (v15 < v17 || v17 < 0.1) {
        double additionalSnappingAngle = 0.0;
      }
    }
  }
  id v19 = objc_loadWeakRetained((id *)&self->_mapLayer);
  [v19 setYaw:v5 animated:additionalSnappingAngle];
}

- (void)updateSnappedToNorth
{
  p_mapLayer = &self->_mapLayer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapLayer);
  [WeakRetained yaw];
  double v5 = v4;
  double v6 = fmod(v4, 360.0);
  if (v5 < 0.0) {
    double v6 = v6 + 360.0;
  }
  double v7 = 0.0;
  if (fabs(v6) > 180.0)
  {
    if (v6 >= 0.0) {
      double v7 = 360.0;
    }
    else {
      double v6 = v6 + 360.0;
    }
  }
  if (vabdd_f64(v7, v6) < 0.1)
  {
    [(MKRotationFilter *)self setSnappedToNorth:1];
  }
  else
  {
    id v8 = objc_loadWeakRetained((id *)p_mapLayer);
    [v8 yaw];
    double v10 = v9;
    long double additionalSnappingAngle = self->_additionalSnappingAngle;
    double v12 = fmod(v9, 360.0);
    if (v10 >= 0.0) {
      double v13 = v12;
    }
    else {
      double v13 = v12 + 360.0;
    }
    double v14 = fmod(additionalSnappingAngle, 360.0);
    if (additionalSnappingAngle < 0.0) {
      double v14 = v14 + 360.0;
    }
    if (vabdd_f64(v13, v14) > 180.0)
    {
      if (v13 >= v14) {
        double v14 = v14 + 360.0;
      }
      else {
        double v13 = v13 + 360.0;
      }
    }
    [(MKRotationFilter *)self setSnappedToNorth:vabdd_f64(v14, v13) < 0.1];
  }
}

- (BOOL)hasAdditionalSnappingAngle
{
  long double additionalSnappingAngle = self->_additionalSnappingAngle;
  double v3 = fmod(additionalSnappingAngle, 360.0);
  if (additionalSnappingAngle < 0.0) {
    double v3 = v3 + 360.0;
  }
  double v4 = 0.0;
  if (vabdd_f64(0.0, v3) > 180.0)
  {
    if (v3 <= 0.0) {
      double v3 = v3 + 360.0;
    }
    else {
      double v4 = 360.0;
    }
  }
  return vabdd_f64(v3, v4) >= 0.1;
}

- (BOOL)isSnappedToNorth
{
  return self->_snappedToNorth;
}

- (void)setSnappedToNorth:(BOOL)a3
{
  self->_snappedToNorth = a3;
}

- (double)additionalSnappingAngle
{
  return self->_additionalSnappingAngle;
}

- (void)setAdditionalSnappingAngle:(double)a3
{
  self->_long double additionalSnappingAngle = a3;
}

- (MKRotationFilterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKRotationFilterDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_mapLayer);
}

@end