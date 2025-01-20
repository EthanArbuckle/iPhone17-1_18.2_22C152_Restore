@interface MRUActivityRouteView
- (BOOL)isSideConstraintActive;
- (CGSize)intrinsicContentSize;
- (MRUActivityArtworkView)artworkView;
- (MRUActivityRouteView)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)deviceIconViewHeightConstraint;
- (NSLayoutConstraint)deviceIconViewWidthConstraint;
- (UIImageView)deviceIconView;
- (double)side;
- (void)setDeviceIconViewHeightConstraint:(id)a3;
- (void)setDeviceIconViewWidthConstraint:(id)a3;
- (void)setSide:(double)a3;
- (void)setSideConstraintActive:(BOOL)a3;
- (void)setupConstraints;
@end

@implementation MRUActivityRouteView

- (MRUActivityRouteView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MRUActivityRouteView;
  v3 = -[MRUActivityRouteView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] whiteColor];
    [(MRUActivityRouteView *)v3 setTintColor:v4];

    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    [(UIImageView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v5 setContentMode:1];
    [(MRUActivityRouteView *)v3 addSubview:v5];
    deviceIconView = v3->_deviceIconView;
    v3->_deviceIconView = v5;
    v7 = v5;

    v8 = objc_alloc_init(MRUActivityArtworkView);
    [(MRUActivityArtworkView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MRUArtworkView *)v8 setStyle:7];
    [(MRUActivityRouteView *)v3 addSubview:v8];
    artworkView = v3->_artworkView;
    v3->_artworkView = v8;

    [(MRUActivityRouteView *)v3 setupConstraints];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double side = self->_side;
  if (fabs(side) <= 2.22044605e-16)
  {
    v4.receiver = self;
    v4.super_class = (Class)MRUActivityRouteView;
    [(MRUActivityRouteView *)&v4 intrinsicContentSize];
  }
  else
  {
    double v3 = self->_side;
  }
  result.height = v3;
  result.width = side;
  return result;
}

- (void)setSide:(double)a3
{
  if (vabdd_f64(self->_side, a3) > 2.22044605e-16)
  {
    self->_double side = a3;
    -[NSLayoutConstraint setConstant:](self->_deviceIconViewWidthConstraint, "setConstant:");
    [(MRUActivityRouteView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setSideConstraintActive:(BOOL)a3
{
  if (self->_sideConstraintActive != a3)
  {
    BOOL v3 = a3;
    self->_sideConstraintActive = a3;
    if (a3 && !self->_deviceIconViewWidthConstraint)
    {
      v5 = [(MRUActivityRouteView *)self deviceIconView];
      v6 = [v5 widthAnchor];
      v7 = [v6 constraintEqualToConstant:self->_side];
      deviceIconViewWidthConstraint = self->_deviceIconViewWidthConstraint;
      self->_deviceIconViewWidthConstraint = v7;

      v9 = [(MRUActivityRouteView *)self deviceIconView];
      v10 = [v9 widthAnchor];
      objc_super v11 = [(MRUActivityRouteView *)self deviceIconView];
      v12 = [v11 heightAnchor];
      v13 = [v10 constraintEqualToAnchor:v12];
      deviceIconViewHeightConstraint = self->_deviceIconViewHeightConstraint;
      self->_deviceIconViewHeightConstraint = v13;
    }
    [(NSLayoutConstraint *)self->_deviceIconViewWidthConstraint setActive:v3];
    v15 = self->_deviceIconViewHeightConstraint;
    [(NSLayoutConstraint *)v15 setActive:v3];
  }
}

- (void)setupConstraints
{
  v38[8] = *MEMORY[0x1E4F143B8];
  v23 = (void *)MEMORY[0x1E4F28DC8];
  v37 = [(MRUActivityRouteView *)self deviceIconView];
  v36 = [v37 leadingAnchor];
  v35 = [(MRUActivityRouteView *)self leadingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v38[0] = v34;
  v33 = [(MRUActivityRouteView *)self deviceIconView];
  v32 = [v33 trailingAnchor];
  v31 = [(MRUActivityRouteView *)self trailingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v38[1] = v30;
  v29 = [(MRUActivityRouteView *)self deviceIconView];
  v28 = [v29 topAnchor];
  v27 = [(MRUActivityRouteView *)self topAnchor];
  v26 = [v28 constraintEqualToAnchor:v27];
  v38[2] = v26;
  v25 = [(MRUActivityRouteView *)self deviceIconView];
  v24 = [v25 bottomAnchor];
  v22 = [(MRUActivityRouteView *)self bottomAnchor];
  v21 = [v24 constraintEqualToAnchor:v22];
  v38[3] = v21;
  v20 = [(MRUActivityRouteView *)self artworkView];
  v19 = [v20 trailingAnchor];
  v18 = [(MRUActivityRouteView *)self trailingAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v38[4] = v17;
  v16 = [(MRUActivityRouteView *)self artworkView];
  v15 = [v16 bottomAnchor];
  v14 = [(MRUActivityRouteView *)self bottomAnchor];
  v13 = [v15 constraintEqualToAnchor:v14];
  v38[5] = v13;
  BOOL v3 = [(MRUActivityRouteView *)self artworkView];
  objc_super v4 = [v3 heightAnchor];
  v5 = [(MRUActivityRouteView *)self artworkView];
  v6 = [v5 widthAnchor];
  v7 = [v4 constraintEqualToAnchor:v6];
  v38[6] = v7;
  v8 = [(MRUActivityRouteView *)self artworkView];
  v9 = [v8 widthAnchor];
  v10 = [(MRUActivityRouteView *)self widthAnchor];
  objc_super v11 = [v9 constraintEqualToAnchor:v10 multiplier:0.4];
  v38[7] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:8];
  [v23 activateConstraints:v12];
}

- (UIImageView)deviceIconView
{
  return self->_deviceIconView;
}

- (MRUActivityArtworkView)artworkView
{
  return self->_artworkView;
}

- (double)side
{
  return self->_side;
}

- (BOOL)isSideConstraintActive
{
  return self->_sideConstraintActive;
}

- (NSLayoutConstraint)deviceIconViewWidthConstraint
{
  return self->_deviceIconViewWidthConstraint;
}

- (void)setDeviceIconViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)deviceIconViewHeightConstraint
{
  return self->_deviceIconViewHeightConstraint;
}

- (void)setDeviceIconViewHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIconViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_deviceIconViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);

  objc_storeStrong((id *)&self->_deviceIconView, 0);
}

@end