@interface CKDetailsMapViewCell
+ (BOOL)shouldHighlight;
+ (id)reuseIdentifier;
- (BOOL)shouldShowLocationString;
- (CKDetailsLocationStringCell)locationStringView;
- (CKDetailsMapViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIView)mapView;
- (void)layoutSubviews;
- (void)setLocationStringView:(id)a3;
- (void)setMapView:(id)a3;
- (void)setShouldShowLocationString:(BOOL)a3;
@end

@implementation CKDetailsMapViewCell

- (CKDetailsMapViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CKDetailsMapViewCell;
  v4 = [(CKDetailsCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(CKDetailsMapViewCell *)v4 setSelectionStyle:0];
  }
  return v5;
}

+ (id)reuseIdentifier
{
  return @"CKDetailsMapViewCell_reuseIdentifier";
}

+ (BOOL)shouldHighlight
{
  return 1;
}

- (void)setMapView:(id)a3
{
  p_mapView = &self->_mapView;
  v9 = (UIView *)a3;
  if (*p_mapView != v9)
  {
    objc_storeStrong((id *)&self->_mapView, a3);
    v6 = [(CKDetailsMapViewCell *)self contentView];
    [v6 addSubview:*p_mapView];

    if (CKIsRunningInMacCatalyst())
    {
      objc_super v7 = [(UIView *)*p_mapView layer];
      [v7 setCornerRadius:4.0];

      v8 = [(UIView *)*p_mapView layer];
      [v8 setMasksToBounds:1];
    }
  }
}

- (void)setLocationStringView:(id)a3
{
  v5 = (CKDetailsLocationStringCell *)a3;
  if (self->_locationStringView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_locationStringView, a3);
    [(CKDetailsMapViewCell *)self setNeedsLayout];
    v5 = v6;
  }
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)CKDetailsMapViewCell;
  [(CKDetailsCell *)&v26 layoutSubviews];
  v3 = [(CKDetailsCell *)self topSeperator];
  [v3 setHidden:1];

  v4 = [(CKDetailsCell *)self bottomSeperator];
  [v4 setHidden:1];

  v5 = [(CKDetailsMapViewCell *)self contentView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = [(CKDetailsCell *)self bottomSeperator];
  [v14 setHidden:1];

  v15 = [(CKDetailsMapViewCell *)self mapView];
  objc_msgSend(v15, "setFrame:", v7, v9, v11, v13);

  if (self->_shouldShowLocationString)
  {
    v16 = [(CKDetailsMapViewCell *)self locationStringView];
    [v16 frame];

    [(CKDetailsMapViewCell *)self bounds];
    double v18 = v17;
    [(CKDetailsMapViewCell *)self bounds];
    double v20 = v19 + -44.0;
    if (CKMainScreenScale_once_28 != -1) {
      dispatch_once(&CKMainScreenScale_once_28, &__block_literal_global_66);
    }
    double v21 = *(double *)&CKMainScreenScale_sMainScreenScale_28;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_28 == 0.0) {
      double v21 = 1.0;
    }
    double v22 = floor(v18 * v21) / v21;
    double v23 = floor(v20 * v21) / v21;
    [(CKDetailsMapViewCell *)self bounds];
    -[CKDetailsLocationStringCell setFrame:](self->_locationStringView, "setFrame:", v22, v23);
    v24 = [(CKDetailsMapViewCell *)self contentView];
    [v24 addSubview:self->_locationStringView];

    v25 = [(CKDetailsMapViewCell *)self contentView];
    [v25 bringSubviewToFront:self->_locationStringView];
  }
}

- (UIView)mapView
{
  return self->_mapView;
}

- (BOOL)shouldShowLocationString
{
  return self->_shouldShowLocationString;
}

- (void)setShouldShowLocationString:(BOOL)a3
{
  self->_shouldShowLocationString = a3;
}

- (CKDetailsLocationStringCell)locationStringView
{
  return self->_locationStringView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationStringView, 0);

  objc_storeStrong((id *)&self->_mapView, 0);
}

@end