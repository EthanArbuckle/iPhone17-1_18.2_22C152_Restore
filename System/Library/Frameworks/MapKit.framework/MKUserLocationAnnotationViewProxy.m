@interface MKUserLocationAnnotationViewProxy
- ($F24F406B2B787EFB06265DBA3D28CBD5)presentationCoordinate;
- (BOOL)isAnimatingAccuracy;
- (BOOL)tracking;
- (CGSize)collisionSize;
- (GEORouteMatch)routeMatch;
- (MKAnnotationView)annotationView;
- (VKEdgeInsets)annotationTrackingEdgeInsets;
- (double)minimumAccuracy;
- (double)presentationAccuracy;
- (double)presentationCourse;
- (void)setAnimatingAccuracy:(BOOL)a3;
- (void)setAnimatingToCoordinate:(BOOL)a3;
- (void)setAnnotationView:(id)a3;
- (void)setPresentationAccuracy:(double)a3;
- (void)setPresentationCoordinate:(id)a3;
- (void)setPresentationCourse:(double)a3;
- (void)setRouteMatch:(id)a3;
- (void)setTracking:(BOOL)a3;
@end

@implementation MKUserLocationAnnotationViewProxy

- (CGSize)collisionSize
{
  v2 = [(MKUserLocationAnnotationViewProxy *)self annotationView];
  [v2 _collisionFrame];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setAnimatingToCoordinate:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MKUserLocationAnnotationViewProxy *)self annotationView];
  [v4 _setAnimatingToCoordinate:v3];
}

- (MKAnnotationView)annotationView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationView);

  return (MKAnnotationView *)WeakRetained;
}

- (void)setAnnotationView:(id)a3
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)presentationCoordinate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_annotationView);
  [WeakRetained _presentationCoordinate];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (void)setPresentationCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v5 = [(MKUserLocationAnnotationViewProxy *)self annotationView];
  objc_msgSend(v5, "_setPresentationCoordinate:", var0, var1);
}

- (double)presentationCourse
{
  v2 = [(MKUserLocationAnnotationViewProxy *)self annotationView];
  [v2 _presentationCourse];
  double v4 = v3;

  return v4;
}

- (void)setPresentationCourse:(double)a3
{
  id v4 = [(MKUserLocationAnnotationViewProxy *)self annotationView];
  [v4 _setPresentationCourse:a3];
}

- (double)presentationAccuracy
{
  id v2 = [(MKUserLocationAnnotationViewProxy *)self annotationView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = 0;
      goto LABEL_7;
    }
    id v3 = [v2 _mkUserLocationView];
  }
  id v4 = v3;
LABEL_7:

  [v4 presentationAccuracy];
  double v6 = v5;

  return v6;
}

- (void)setPresentationAccuracy:(double)a3
{
  id v6 = [(MKUserLocationAnnotationViewProxy *)self annotationView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v6;
LABEL_5:
    double v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v6 _mkUserLocationView];
    goto LABEL_5;
  }
  double v5 = 0;
LABEL_7:

  [v5 setPresentationAccuracy:a3];
}

- (BOOL)isAnimatingAccuracy
{
  id v2 = [(MKUserLocationAnnotationViewProxy *)self annotationView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = 0;
      goto LABEL_7;
    }
    id v3 = [v2 _mkUserLocationView];
  }
  id v4 = v3;
LABEL_7:

  char v5 = [v4 isAnimatingPresentationAccuracy];
  return v5;
}

- (void)setAnimatingAccuracy:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(MKUserLocationAnnotationViewProxy *)self annotationView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v6;
LABEL_5:
    char v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v6 _mkUserLocationView];
    goto LABEL_5;
  }
  char v5 = 0;
LABEL_7:

  [v5 setAnimatingPresentationAccuracy:v3];
}

- (double)minimumAccuracy
{
  id v2 = [(MKUserLocationAnnotationViewProxy *)self annotationView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = 0;
      goto LABEL_7;
    }
    id v3 = [v2 _mkUserLocationView];
  }
  id v4 = v3;
LABEL_7:

  [v4 _minimumAccuracyUncertainty];
  double v6 = v5;

  return v6;
}

- (BOOL)tracking
{
  id v2 = [(MKUserLocationAnnotationViewProxy *)self annotationView];
  char v3 = [v2 _isTracking];

  return v3;
}

- (void)setTracking:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MKUserLocationAnnotationViewProxy *)self annotationView];
  [v4 _setTracking:v3];
}

- (GEORouteMatch)routeMatch
{
  id v2 = [(MKUserLocationAnnotationViewProxy *)self annotationView];
  BOOL v3 = [v2 _routeMatch];

  return (GEORouteMatch *)v3;
}

- (void)setRouteMatch:(id)a3
{
  id v4 = a3;
  id v5 = [(MKUserLocationAnnotationViewProxy *)self annotationView];
  [v5 _setRouteMatch:v4];
}

- (VKEdgeInsets)annotationTrackingEdgeInsets
{
  id v2 = [(MKUserLocationAnnotationViewProxy *)self annotationView];
  [v2 _annotationTrackingInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  float v11 = v4;
  float v12 = v6;
  float v13 = v8;
  float v14 = v10;
  result.var3 = v14;
  result.var2 = v13;
  result.double var1 = v12;
  result.double var0 = v11;
  return result;
}

- (void).cxx_destruct
{
}

@end