@interface _MKAnnotationViewAnchor
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (CGPoint)pointInLayer:(id)a3 bound:(CGRect)a4;
- (MKAnnotationView)annotationView;
- (double)pointOffsetForDistanceOffset:(double)a3;
- (void)setAnnotationView:(id)a3;
@end

@implementation _MKAnnotationViewAnchor

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  [(MKAnnotationView *)self->_annotationView _presentationCoordinate];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (CGPoint)pointInLayer:(id)a3 bound:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v10 = [(MKAnnotationView *)self->_annotationView _staticMapView];
  if (v10)
  {
    [(_MKAnnotationViewAnchor *)self coordinate];
    objc_msgSend(v10, "convertCoordinate:toPointToView:", v10);
    double v12 = v11;
    double v14 = v13;
    if (v9)
    {
      v15 = [v10 layer];
      objc_msgSend(v15, "convertPoint:toLayer:", v9, v12, v14);
      double v12 = v16;
      double v14 = v17;
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)_MKAnnotationViewAnchor;
    -[VKAnchorWrapper pointInLayer:bound:](&v22, sel_pointInLayer_bound_, v9, x, y, width, height);
    double v12 = v18;
    double v14 = v19;
  }

  double v20 = v12;
  double v21 = v14;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (double)pointOffsetForDistanceOffset:(double)a3
{
  v5 = [(MKAnnotationView *)self->_annotationView _staticMapView];
  if (v5)
  {
    [(_MKAnnotationViewAnchor *)self coordinate];
    double v7 = v6;
    double v9 = v8;
    double v10 = MKMapRectMakeWithRadialDistance(v6, v8, a3);
    v25.double x = v10 + v11;
    v25.double y = v13 + v12 * 0.5;
    CLLocationCoordinate2D v14 = MKCoordinateForMapPoint(v25);
    objc_msgSend(v5, "convertCoordinate:toPointToView:", v5, v7, v9);
    double v16 = v15;
    double v18 = v17;
    objc_msgSend(v5, "convertCoordinate:toPointToView:", v5, v14.latitude, v14.longitude);
    double v21 = sqrt((v20 - v18) * (v20 - v18) + (v19 - v16) * (v19 - v16));
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)_MKAnnotationViewAnchor;
    [(VKAnchorWrapper *)&v24 pointOffsetForDistanceOffset:a3];
    double v21 = v22;
  }

  return v21;
}

- (void)setAnnotationView:(id)a3
{
  self->_annotationView = (MKAnnotationView *)a3;
}

- (MKAnnotationView)annotationView
{
  return self->_annotationView;
}

@end