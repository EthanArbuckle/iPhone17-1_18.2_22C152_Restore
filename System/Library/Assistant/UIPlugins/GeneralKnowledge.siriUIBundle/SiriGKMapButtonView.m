@interface SiriGKMapButtonView
- (BOOL)isSelectable;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SiriGKMapButtonView)initWithCoordinate:(CLLocationCoordinate2D)a3 mapSpan:(double)a4 mapTitle:(id)a5;
- (id)mapViewSnippet;
- (void)layoutSubviews;
@end

@implementation SiriGKMapButtonView

- (SiriGKMapButtonView)initWithCoordinate:(CLLocationCoordinate2D)a3 mapSpan:(double)a4 mapTitle:(id)a5
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  id v9 = a5;
  v29.receiver = self;
  v29.super_class = (Class)SiriGKMapButtonView;
  v10 = [(SiriGKMapButtonView *)&v29 init];
  v11 = v10;
  if (v10)
  {
    v10->_coordinate.CLLocationDegrees latitude = latitude;
    v10->_coordinate.CLLocationDegrees longitude = longitude;
    v10->_mapSpan = a4;
    v12 = (NSString *)[v9 copy];
    mapSnippetTitleString = v11->_mapSnippetTitleString;
    v11->_mapSnippetTitleString = v12;

    -[SiriGKView setEdgeInsets:](v11, "setEdgeInsets:", 0.0, SiriUIPlatterStyle[32], 0.0, SiriUIPlatterStyle[34]);
    uint64_t v14 = +[SiriSharedUIContentLabel label];
    titleLabel = v11->_titleLabel;
    v11->_titleLabel = (SiriSharedUIContentLabel *)v14;

    v16 = v11->_titleLabel;
    v17 = SiriGKLocalizedString(@"MAP_BUTTON_TITLE");
    [(SiriSharedUIContentLabel *)v16 setText:v17];

    v18 = v11->_titleLabel;
    int v19 = SiriUIIsCompactWidth();
    double v20 = 18.0;
    if (v19) {
      double v20 = 14.0;
    }
    v21 = +[UIFont siriui_lightWeightFontWithSize:v20];
    [(SiriSharedUIContentLabel *)v18 setFont:v21];

    [(SiriGKMapButtonView *)v11 addSubview:v11->_titleLabel];
    id v22 = objc_alloc((Class)UIImageView);
    v23 = +[UIImage siriui_semiTransparentChevronImage];
    v24 = (UIImageView *)[v22 initWithImage:v23];
    chevronImageView = v11->_chevronImageView;
    v11->_chevronImageView = v24;

    [(SiriGKMapButtonView *)v11 addSubview:v11->_chevronImageView];
    uint64_t v26 = +[SiriUIKeyline keyline];
    keyline = v11->_keyline;
    v11->_keyline = (SiriUIKeyline *)v26;

    [(SiriGKMapButtonView *)v11 addSubview:v11->_keyline];
  }

  return v11;
}

- (BOOL)isSelectable
{
  return 1;
}

- (id)mapViewSnippet
{
  id v3 = objc_alloc_init((Class)SAGKMapPod);
  v4 = +[NSNumber numberWithDouble:self->_mapSpan];
  [v3 setZoomLevel:v4];

  id v5 = objc_alloc_init((Class)SALocation);
  v6 = +[NSNumber numberWithDouble:self->_coordinate.latitude];
  [v5 setLatitude:v6];

  v7 = +[NSNumber numberWithDouble:self->_coordinate.longitude];
  [v5 setLongitude:v7];

  [v3 setLocation:v5];
  id v8 = objc_alloc_init((Class)SAGKSnippet);
  id v11 = v3;
  id v9 = +[NSArray arrayWithObjects:&v11 count:1];
  [v8 setPods:v9];

  [v8 setTitle:self->_mapSnippetTitleString];

  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(SiriGKView *)self edgeInsets];
  double v6 = width - (v4 + v5);
  double v7 = SiriUIPlatterStyle[26];
  result.height = v7;
  result.double width = v6;
  return result;
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)SiriGKMapButtonView;
  [(SiriGKMapButtonView *)&v35 layoutSubviews];
  [(SiriGKMapButtonView *)self bounds];
  double v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  id v9 = +[UIScreen mainScreen];
  [v9 scale];
  SiriUIRectForLabelWithDistanceFromTopToBaseline();
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  -[SiriSharedUIContentLabel setFrame:](self->_titleLabel, "setFrame:", v11, v13, v15, v17);
  [(UIImageView *)self->_chevronImageView frame];
  double v19 = v18;
  double v21 = v20;
  double v22 = v4 + v8;
  double v23 = SiriUIPlatterStyle[34];
  v24 = +[UIScreen mainScreen];
  [v24 scale];
  if (v25 >= 2.0) {
    double v26 = 15.5;
  }
  else {
    double v26 = 16.0;
  }

  -[UIImageView setFrame:](self->_chevronImageView, "setFrame:", v22 - v19 - v23, v26, v19, v21);
  keyline = self->_keyline;
  [(SiriGKMapButtonView *)self bounds];
  -[SiriUIKeyline sizeThatFits:](keyline, "sizeThatFits:", v28, v29);
  double v31 = v30;
  double v33 = v32;
  [(SiriGKMapButtonView *)self bounds];
  double Height = CGRectGetHeight(v36);
  v37.origin.x = v4;
  v37.origin.y = v6;
  v37.size.double width = v31;
  v37.size.height = v33;
  -[SiriUIKeyline setFrame:](self->_keyline, "setFrame:", v4, Height - CGRectGetHeight(v37), v31, v33);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapSnippetTitleString, 0);
  objc_storeStrong((id *)&self->_keyline, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end