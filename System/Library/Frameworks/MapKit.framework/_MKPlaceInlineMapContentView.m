@interface _MKPlaceInlineMapContentView
- (BOOL)hasTitle;
- (BOOL)isBottomHairlineHidden;
- (BOOL)useImageView;
- (CGSize)intrinsicContentSize;
- (MKMapItemView)mapItemView;
- (UIImage)map;
- (_MKPlaceInlineMapContentView)initWithFrame:(CGRect)a3;
- (_MKPlaceInlineMapContentView)initWithFrame:(CGRect)a3 hideLookAroundView:(BOOL)a4 showMapAttribution:(BOOL)a5 mapSnapshotAuditToken:(id)a6;
- (double)mapViewHeight;
- (double)titleHeight;
- (void)_contentSizeDidChange;
- (void)infoCardThemeChanged;
- (void)setBottomHairlineHidden:(BOOL)a3;
- (void)setMap:(id)a3;
- (void)setMapItemView:(id)a3;
@end

@implementation _MKPlaceInlineMapContentView

- (BOOL)hasTitle
{
  return 0;
}

- (BOOL)useImageView
{
  return 0;
}

- (_MKPlaceInlineMapContentView)initWithFrame:(CGRect)a3
{
  return -[_MKPlaceInlineMapContentView initWithFrame:hideLookAroundView:showMapAttribution:mapSnapshotAuditToken:](self, "initWithFrame:hideLookAroundView:showMapAttribution:mapSnapshotAuditToken:", 0, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_MKPlaceInlineMapContentView)initWithFrame:(CGRect)a3 hideLookAroundView:(BOOL)a4 showMapAttribution:(BOOL)a5 mapSnapshotAuditToken:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v85[7] = *MEMORY[0x1E4F143B8];
  id v13 = a6;
  v82.receiver = self;
  v82.super_class = (Class)_MKPlaceInlineMapContentView;
  v14 = -[_MKUIViewControllerRootView initWithFrame:](&v82, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    [(_MKPlaceInlineMapContentView *)v14 setPreservesSuperviewLayoutMargins:1];
    v16 = -[MKViewWithHairline initWithFrame:]([MKViewWithHairline alloc], "initWithFrame:", x, y, width, height);
    hairlineView = v15->_hairlineView;
    v15->_hairlineView = v16;

    [(MKViewWithHairline *)v15->_hairlineView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKViewWithHairline *)v15->_hairlineView setTopHairlineHidden:1];
    [(MKViewWithHairline *)v15->_hairlineView setBottomHairlineHidden:0];
    [(_MKPlaceInlineMapContentView *)v15 addSubview:v15->_hairlineView];
    v18 = [[MKVibrantLabel alloc] initWithStyle:1];
    titleLabel = v15->_titleLabel;
    v15->_titleLabel = (_MKUILabel *)v18;

    [(_MKUILabel *)v15->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_MKUILabel *)v15->_titleLabel setPreservesSuperviewLayoutMargins:1];
    v20 = +[MKFontManager sharedManager];
    v21 = [v20 sectionHeaderFont];
    [(_MKUILabel *)v15->_titleLabel setFont:v21];

    [(MKViewWithHairline *)v15->_hairlineView addSubview:v15->_titleLabel];
    BOOL v22 = [(_MKPlaceInlineMapContentView *)v15 useImageView];
    if (v22)
    {
      uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", x, y, width, height);
      mapImageView = v15->_mapImageView;
      v15->_mapImageView = (UIImageView *)v23;

      objc_storeStrong((id *)&v15->_mapView, v15->_mapImageView);
    }
    else
    {
      v25 = -[MKMapItemView initWithFrame:]([MKMapItemView alloc], "initWithFrame:", x, y, width, height);
      mapItemView = v15->_mapItemView;
      v15->_mapItemView = v25;

      [(MKMapItemView *)v15->_mapItemView setShouldShowBorders:1];
      [(MKMapItemView *)v15->_mapItemView setShouldResolveMapItem:0];
      [(MKMapItemView *)v15->_mapItemView setHideLookAroundView:v7];
      [(MKMapItemView *)v15->_mapItemView setShouldShowMapAttribution:v6];
      [(MKMapItemView *)v15->_mapItemView _setAuditToken:v13];
      objc_storeStrong((id *)&v15->_mapView, v15->_mapItemView);
      [(_MKUIViewControllerClickableRootView *)v15 setTarget:0 action:0];
    }
    [(UIView *)v15->_mapView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v15->_mapView setPreservesSuperviewLayoutMargins:1];
    v27 = [(_MKPlaceInlineMapContentView *)v15 window];
    v28 = [v27 screen];
    v29 = v28;
    if (v28)
    {
      [v28 nativeScale];
      double v31 = v30;
    }
    else
    {
      v32 = [MEMORY[0x1E4F42D90] mainScreen];
      [v32 nativeScale];
      double v31 = v33;
    }
    id v79 = v13;

    v34 = [(UIView *)v15->_mapView layer];
    [v34 setCornerRadius:8.0];

    if (v22)
    {
      if (v31 <= 1.0) {
        double v35 = 1.0;
      }
      else {
        double v35 = 1.0 / v31;
      }
      v36 = [(UIView *)v15->_mapView layer];
      [v36 setBorderWidth:v35];
    }
    [(UIView *)v15->_mapView setClipsToBounds:1];
    [(UIView *)v15->_mapView setUserInteractionEnabled:1];
    [(UIView *)v15->_mapView setContentMode:2];
    [(MKViewWithHairline *)v15->_hairlineView addSubview:v15->_mapView];
    [(_MKPlaceInlineMapContentView *)v15 infoCardThemeChanged];
    v80 = (void *)MEMORY[0x1E4F1CA48];
    v77 = [(MKViewWithHairline *)v15->_hairlineView leadingAnchor];
    v78 = [(_MKPlaceInlineMapContentView *)v15 layoutMarginsGuide];
    v76 = [v78 leadingAnchor];
    v75 = [v77 constraintEqualToAnchor:v76];
    v85[0] = v75;
    v74 = [(_MKPlaceInlineMapContentView *)v15 layoutMarginsGuide];
    v73 = [v74 trailingAnchor];
    v72 = [(MKViewWithHairline *)v15->_hairlineView trailingAnchor];
    v71 = [v73 constraintEqualToAnchor:v72];
    v85[1] = v71;
    v70 = [(MKViewWithHairline *)v15->_hairlineView topAnchor];
    v69 = [(_MKPlaceInlineMapContentView *)v15 topAnchor];
    v68 = [v70 constraintEqualToAnchor:v69];
    v85[2] = v68;
    v67 = [(_MKPlaceInlineMapContentView *)v15 bottomAnchor];
    v66 = [(MKViewWithHairline *)v15->_hairlineView bottomAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v85[3] = v65;
    v64 = [(UIView *)v15->_mapView leadingAnchor];
    v63 = [(MKViewWithHairline *)v15->_hairlineView leadingAnchor];
    v37 = [v64 constraintEqualToAnchor:v63];
    v85[4] = v37;
    v38 = [(MKViewWithHairline *)v15->_hairlineView trailingAnchor];
    v39 = [(UIView *)v15->_mapView trailingAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    v85[5] = v40;
    v41 = [(MKViewWithHairline *)v15->_hairlineView bottomAnchor];
    v42 = [(UIView *)v15->_mapView bottomAnchor];
    v43 = [v41 constraintEqualToAnchor:v42 constant:0.0];
    v85[6] = v43;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:7];
    v81 = [v80 arrayWithArray:v44];

    if ([(_MKPlaceInlineMapContentView *)v15 hasTitle])
    {
      v45 = [(_MKUILabel *)v15->_titleLabel firstBaselineAnchor];
      v46 = [(_MKPlaceInlineMapContentView *)v15 topAnchor];
      uint64_t v47 = [v45 constraintEqualToAnchor:v46];
      topToTitleConstraint = v15->_topToTitleConstraint;
      v15->_topToTitleConstraint = (NSLayoutConstraint *)v47;

      v49 = [(UIView *)v15->_mapView topAnchor];
      v50 = [(_MKUILabel *)v15->_titleLabel lastBaselineAnchor];
      uint64_t v51 = [v49 constraintEqualToAnchor:v50];
      titleToBottomConstraint = v15->_titleToBottomConstraint;
      v15->_titleToBottomConstraint = (NSLayoutConstraint *)v51;

      v84[0] = v15->_topToTitleConstraint;
      v84[1] = v15->_titleToBottomConstraint;
      v53 = [(_MKUILabel *)v15->_titleLabel leadingAnchor];
      v54 = [(_MKPlaceInlineMapContentView *)v15 layoutMarginsGuide];
      v55 = [v54 leadingAnchor];
      v56 = [v53 constraintEqualToAnchor:v55];
      v84[2] = v56;
      v57 = [(_MKPlaceInlineMapContentView *)v15 layoutMarginsGuide];
      v58 = [v57 trailingAnchor];
      v59 = [(_MKUILabel *)v15->_titleLabel trailingAnchor];
      v60 = [v58 constraintEqualToAnchor:v59];
      v84[3] = v60;
      v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:4];
      [v81 addObjectsFromArray:v61];
    }
    else
    {
      v53 = [(UIView *)v15->_mapView topAnchor];
      v54 = [(MKViewWithHairline *)v15->_hairlineView topAnchor];
      v55 = [v53 constraintEqualToAnchor:v54];
      v83 = v55;
      v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
      [v81 addObjectsFromArray:v56];
    }
    id v13 = v79;

    [MEMORY[0x1E4F28DC8] activateConstraints:v81];
  }

  return v15;
}

- (double)titleHeight
{
  [(NSLayoutConstraint *)self->_topToTitleConstraint constant];
  double v4 = v3;
  [(NSLayoutConstraint *)self->_titleToBottomConstraint constant];
  return v4 + v5;
}

- (void)_contentSizeDidChange
{
  double v3 = +[MKFontManager sharedManager];
  id v4 = [v3 sectionHeaderFont];

  [(_MKUILabel *)self->_titleLabel setFont:v4];
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 22.0);
  -[NSLayoutConstraint setConstant:](self->_topToTitleConstraint, "setConstant:");
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 10.0);
  -[NSLayoutConstraint setConstant:](self->_titleToBottomConstraint, "setConstant:");
}

- (BOOL)isBottomHairlineHidden
{
  return [(MKViewWithHairline *)self->_hairlineView isBottomHairlineHidden];
}

- (void)setBottomHairlineHidden:(BOOL)a3
{
}

- (void)infoCardThemeChanged
{
  v12.receiver = self;
  v12.super_class = (Class)_MKPlaceInlineMapContentView;
  [(UIView *)&v12 infoCardThemeChanged];
  double v3 = [(UIView *)self mk_theme];
  id v4 = [v3 separatorLineColor];
  [(MKViewWithHairline *)self->_hairlineView setHairlineColor:v4];

  double v5 = [(UIView *)self mk_theme];
  LODWORD(v4) = [v5 isDarkTheme];

  double v6 = 0.0;
  if (v4) {
    double v6 = 1.0;
  }
  BOOL v7 = [MEMORY[0x1E4F428B8] colorWithWhite:v6 alpha:0.100000001];
  [(UIView *)self->_mapView _mapkit_setBackgroundColor:v7];
  v8 = [(UIView *)self mk_theme];
  id v9 = [v8 separatorLineColor];
  uint64_t v10 = [v9 CGColor];
  v11 = [(UIView *)self->_mapView layer];
  [v11 setBorderColor:v10];
}

- (UIImage)map
{
  return [(UIImageView *)self->_mapImageView image];
}

- (void)setMap:(id)a3
{
}

- (double)mapViewHeight
{
  return 148.0;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4F43ED8];
  [(_MKPlaceInlineMapContentView *)self mapViewHeight];
  double v4 = v3 + 0.0;
  double v5 = v2;
  result.double height = v4;
  result.double width = v5;
  return result;
}

- (MKMapItemView)mapItemView
{
  return self->_mapItemView;
}

- (void)setMapItemView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItemView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_mapImageView, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_titleToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topToTitleConstraint, 0);

  objc_storeStrong((id *)&self->_hairlineView, 0);
}

@end