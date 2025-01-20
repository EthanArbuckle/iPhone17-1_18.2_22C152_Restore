@interface _MKMapFeatureAnnotationView
- (BOOL)_isProvidingVKLabelContents;
- (BOOL)shouldShowCallout;
- (CGPoint)_anchorPointForCalloutAnchorPosition:(int64_t)a3;
- (CGPoint)_openInMapsAnchorPoint;
- (CGRect)_frameForSelectionAdjustment;
- (CGRect)_labelDisplayFrame;
- (_MKMapFeatureAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (unint64_t)_reasonToDeferSelectionAccessoryPresentationStyle:(id)a3;
@end

@implementation _MKMapFeatureAnnotationView

- (_MKMapFeatureAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_MKMapFeatureAnnotationView;
  v4 = [(MKAnnotationView *)&v7 initWithAnnotation:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    -[MKAnnotationView setBounds:](v4, "setBounds:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(MKAnnotationView *)v5 setCanShowCallout:0];
  }
  return v5;
}

- (BOOL)shouldShowCallout
{
  return 0;
}

- (CGPoint)_openInMapsAnchorPoint
{
  [(_MKMapFeatureAnnotationView *)self _labelDisplayFrame];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGFloat MidX = CGRectGetMidX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v11);
  double v8 = MidX;
  result.CGFloat y = MaxY;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)_anchorPointForCalloutAnchorPosition:(int64_t)a3
{
  [(_MKMapFeatureAnnotationView *)self _labelDisplayFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  v13 = [(MKAnnotationView *)self annotation];
  v14 = v13;
  switch(a3)
  {
    case 1:
      v34.origin.CGFloat x = v6;
      v34.origin.CGFloat y = v8;
      v34.size.CGFloat width = v10;
      v34.size.CGFloat height = v12;
      double MidX = CGRectGetMidX(v34);
      v35.origin.CGFloat x = v6;
      v35.origin.CGFloat y = v8;
      v35.size.CGFloat width = v10;
      v35.size.CGFloat height = v12;
      double MaxY = CGRectGetMaxY(v35);
      goto LABEL_10;
    case 2:
      v36.origin.CGFloat x = v6;
      v36.origin.CGFloat y = v8;
      v36.size.CGFloat width = v10;
      v36.size.CGFloat height = v12;
      double MidX = CGRectGetMidX(v36);
      v37.origin.CGFloat x = v6;
      v37.origin.CGFloat y = v8;
      v37.size.CGFloat width = v10;
      v37.size.CGFloat height = v12;
      double MaxY = CGRectGetMinY(v37);
      goto LABEL_10;
    case 3:
      uint64_t v18 = [v13 featureType];
      CGFloat v19 = v6;
      CGFloat v20 = v8;
      CGFloat v21 = v10;
      CGFloat v22 = v12;
      if (v18)
      {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v19);
        goto LABEL_9;
      }
      double v31 = CGRectGetMidX(*(CGRect *)&v19);
      double v32 = 30.0;
      goto LABEL_14;
    case 4:
      uint64_t v24 = [v13 featureType];
      CGFloat v25 = v6;
      CGFloat v26 = v8;
      CGFloat v27 = v10;
      CGFloat v28 = v12;
      if (v24)
      {
        double MaxX = CGRectGetMinX(*(CGRect *)&v25);
LABEL_9:
        double MidX = MaxX;
        v38.origin.CGFloat x = v6;
        v38.origin.CGFloat y = v8;
        v38.size.CGFloat width = v10;
        v38.size.CGFloat height = v12;
        double MaxY = CGRectGetMidY(v38);
LABEL_10:
        double v17 = MaxY;
      }
      else
      {
        double v31 = CGRectGetMidX(*(CGRect *)&v25);
        double v32 = -30.0;
LABEL_14:
        double MidX = v31 + v32;
        v39.origin.CGFloat x = v6;
        v39.origin.CGFloat y = v8;
        v39.size.CGFloat width = v10;
        v39.size.CGFloat height = v12;
        double v17 = CGRectGetMinY(v39) + 41.0;
      }
LABEL_11:

      double v29 = MidX;
      double v30 = v17;
      result.CGFloat y = v30;
      result.CGFloat x = v29;
      return result;
    default:
      double MidX = *MEMORY[0x1E4F1DAD8];
      double v17 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      goto LABEL_11;
  }
}

- (CGRect)_frameForSelectionAdjustment
{
  v2 = [(MKAnnotationView *)self annotation];
  v3 = [v2 marker];

  [v3 screenBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (BOOL)_isProvidingVKLabelContents
{
  return 1;
}

- (CGRect)_labelDisplayFrame
{
  v3 = [(MKAnnotationView *)self annotation];
  double v4 = [v3 marker];

  double v5 = [(MKAnnotationView *)self _mapView];
  [v4 screenBounds];
  objc_msgSend(v5, "convertRect:toView:", self);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (unint64_t)_reasonToDeferSelectionAccessoryPresentationStyle:(id)a3
{
  id v4 = a3;
  if (([v4 _style] | 2) == 3)
  {
    unint64_t v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_MKMapFeatureAnnotationView;
    unint64_t v5 = [(MKAnnotationView *)&v7 _reasonToDeferSelectionAccessoryPresentationStyle:v4];
  }

  return v5;
}

@end