@interface CKMapBalloonView
- (CKMapBalloonView)initWithFrame:(CGRect)a3;
- (MKMarkerAnnotationView)annotationView;
- (void)layoutSubviews;
- (void)setAnnotationView:(id)a3;
@end

@implementation CKMapBalloonView

- (CKMapBalloonView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKMapBalloonView;
  v3 = -[CKTitledImageBalloonView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)MEMORY[0x192FBA860](@"MKMarkerAnnotationView", @"MapKit");
    if (v4)
    {
      v5 = (void *)[[v4 alloc] initWithAnnotation:0 reuseIdentifier:@"TranscriptReuse"];
      [(CKMapBalloonView *)v3 addSubview:v5];
      [(CKMapBalloonView *)v3 setAnnotationView:v5];
    }
  }
  return v3;
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)CKMapBalloonView;
  [(CKTitledImageBalloonView *)&v29 layoutSubviews];
  [(CKMapBalloonView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKMapBalloonView *)self annotationView];
  [(CKMapBalloonView *)self bringSubviewToFront:v11];
  [v11 sizeToFit];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  if (CKMainScreenScale_once_71 != -1) {
    dispatch_once(&CKMainScreenScale_once_71, &__block_literal_global_181);
  }
  double v16 = *(double *)&CKMainScreenScale_sMainScreenScale_71;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_71 == 0.0) {
    double v16 = 1.0;
  }
  double v17 = v13 * v16;
  double v18 = v15 * v16;
  double v19 = v4 * v16 + floor((v8 * v16 - v13 * v16) * 0.5);
  double v20 = v6 * v16 + floor((v10 * v16 - v15 * v16) * 0.5);
  double v21 = 1.0 / v16;
  CGFloat v23 = v21 * v20;
  CGFloat v24 = v17 * v21;
  CGFloat v25 = v18 * v21;
  v30.origin.double x = v21 * v19;
  double x = v30.origin.x;
  v30.origin.y = v23;
  v30.size.width = v24;
  v30.size.height = v25;
  double MaxY = CGRectGetMaxY(v30);
  v31.origin.double x = x;
  v31.origin.y = v23;
  v31.size.width = v24;
  v31.size.height = v25;
  CGRectGetMidX(v31);
  v32.origin.double x = x;
  v32.origin.y = v23;
  v32.size.width = v24;
  v32.size.height = v25;
  CGFloat v27 = v23 - (MaxY - CGRectGetMidY(v32));
  v28 = [(CKMapBalloonView *)self annotationView];
  objc_msgSend(v28, "setFrame:", x, v27, v24, v25);
}

- (MKMarkerAnnotationView)annotationView
{
  return self->_annotationView;
}

- (void)setAnnotationView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end