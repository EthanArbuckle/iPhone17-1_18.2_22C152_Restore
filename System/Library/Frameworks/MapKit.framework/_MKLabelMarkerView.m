@interface _MKLabelMarkerView
+ (BOOL)_followsTerrain;
- (BOOL)shouldShowCallout;
- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3;
- (MKMapView)mapView;
- (_MKLabelMarkerView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (void)_deregisterObserver;
- (void)_registerObserver;
- (void)_updateAnchorOffset;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAnnotation:(id)a3;
- (void)setMapView:(id)a3;
@end

@implementation _MKLabelMarkerView

+ (BOOL)_followsTerrain
{
  return 0;
}

- (_MKLabelMarkerView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_MKLabelMarkerView;
  v4 = [(MKAnnotationView *)&v7 initWithAnnotation:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    -[MKAnnotationView setBounds:](v4, "setBounds:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(MKAnnotationView *)v5 setCanShowCallout:1];
  }
  return v5;
}

- (BOOL)shouldShowCallout
{
  v3 = [(MKAnnotationView *)self annotation];
  if ([v3 suppressCallout] & 1) != 0 || (objc_msgSend(v3, "isRouteEta"))
  {
    BOOL v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_MKLabelMarkerView;
    BOOL v4 = [(MKAnnotationView *)&v6 shouldShowCallout];
  }

  return v4;
}

- (void)_registerObserver
{
  id v3 = [(MKAnnotationView *)self annotation];
  [v3 addObserver:self forKeyPath:@"leftCalloutAccessoryView" options:0 context:0];
  [v3 addObserver:self forKeyPath:@"rightCalloutAccessoryView" options:0 context:0];
  [v3 addObserver:self forKeyPath:@"detailCalloutAccessoryView" options:0 context:0];
}

- (void)_deregisterObserver
{
  id v3 = [(MKAnnotationView *)self annotation];
  [v3 removeObserver:self forKeyPath:@"leftCalloutAccessoryView"];
  [v3 removeObserver:self forKeyPath:@"rightCalloutAccessoryView"];
  [v3 removeObserver:self forKeyPath:@"detailCalloutAccessoryView"];
}

- (void)setAnnotation:(id)a3
{
  BOOL v4 = (MKAnnotation *)a3;
  annotation = self->super._annotation;
  if (annotation != v4)
  {
    if (annotation) {
      [(_MKLabelMarkerView *)self _deregisterObserver];
    }
    v17.receiver = self;
    v17.super_class = (Class)_MKLabelMarkerView;
    [(MKAnnotationView *)&v17 setAnnotation:v4];
    objc_super v6 = [(MKAnnotationView *)self annotation];
    [v6 calloutAnchorRect];
    CGFloat x = v18.origin.x;
    CGFloat y = v18.origin.y;
    CGFloat width = v18.size.width;
    CGFloat height = v18.size.height;
    double MidX = CGRectGetMidX(v18);
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    -[MKAnnotationView setCalloutOffset:](self, "setCalloutOffset:", MidX, CGRectGetMinY(v19));
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v20);
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    -[MKAnnotationView setLeftCalloutOffset:](self, "setLeftCalloutOffset:", MinX, CGRectGetMidY(v21));
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v22);
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    -[MKAnnotationView setRightCalloutOffset:](self, "setRightCalloutOffset:", MaxX, CGRectGetMidY(v23));
    v14 = [v6 leftCalloutAccessoryView];
    [(MKAnnotationView *)self setLeftCalloutAccessoryView:v14];

    v15 = [v6 rightCalloutAccessoryView];
    [(MKAnnotationView *)self setRightCalloutAccessoryView:v15];

    v16 = [v6 detailCalloutAccessoryView];
    [(MKAnnotationView *)self setDetailCalloutAccessoryView:v16];

    [(MKAnnotationView *)self setCanShowCallout:[(_MKLabelMarkerView *)self shouldShowCallout]];
    [(_MKLabelMarkerView *)self _registerObserver];
  }
}

- (void)dealloc
{
  [(_MKLabelMarkerView *)self _deregisterObserver];
  v3.receiver = self;
  v3.super_class = (Class)_MKLabelMarkerView;
  [(MKAnnotationView *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  objc_super v7 = [(MKAnnotationView *)self annotation];
  if ([v9 isEqualToString:@"leftCalloutAccessoryView"])
  {
    v8 = [v7 leftCalloutAccessoryView];
    [(MKAnnotationView *)self setLeftCalloutAccessoryView:v8];
  }
  else if ([v9 isEqualToString:@"rightCalloutAccessoryView"])
  {
    v8 = [v7 rightCalloutAccessoryView];
    [(MKAnnotationView *)self setRightCalloutAccessoryView:v8];
  }
  else
  {
    if (![v9 isEqualToString:@"detailCalloutAccessoryView"]) {
      goto LABEL_8;
    }
    v8 = [v7 detailCalloutAccessoryView];
    [(MKAnnotationView *)self setDetailCalloutAccessoryView:v8];
  }

LABEL_8:
}

- (void)_updateAnchorOffset
{
  id v3 = [(MKAnnotationView *)self annotation];
  [v3 calloutAnchorRect];
  -[MKAnnotationView setCalloutOffset:](self, "setCalloutOffset:", CGRectGetMidX(v5), -8.0);
}

- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(_MKLabelMarkerView *)self _updateAnchorOffset];
  v6.receiver = self;
  v6.super_class = (Class)_MKLabelMarkerView;
  return [(MKAnnotationView *)&v6 updateCalloutViewIfNeededAnimated:v3];
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (void)setMapView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end