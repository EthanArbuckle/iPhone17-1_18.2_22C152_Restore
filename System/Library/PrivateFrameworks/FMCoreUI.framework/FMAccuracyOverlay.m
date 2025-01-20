@interface FMAccuracyOverlay
- (MKAnnotation)parentAnnotation;
- (double)horizontalAccuracy;
- (id)description;
- (void)setHorizontalAccuracy:(double)a3;
- (void)setParentAnnotation:(id)a3;
@end

@implementation FMAccuracyOverlay

- (id)description
{
  v3 = [(FMAccuracyOverlay *)self parentAnnotation];
  v4 = [v3 description];
  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  [(MKCircle *)self coordinate];
  uint64_t v8 = v7;
  [(MKCircle *)self coordinate];
  uint64_t v10 = v9;
  [(MKCircle *)self radius];
  v12 = [v5 stringWithFormat:@"<%@: %p> [%@] %.6f/%6f @ %f", v6, self, v4, v8, v10, v11];

  return v12;
}

- (MKAnnotation)parentAnnotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentAnnotation);
  return (MKAnnotation *)WeakRetained;
}

- (void)setParentAnnotation:(id)a3
{
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_horizontalAccuracy = a3;
}

- (void).cxx_destruct
{
}

@end