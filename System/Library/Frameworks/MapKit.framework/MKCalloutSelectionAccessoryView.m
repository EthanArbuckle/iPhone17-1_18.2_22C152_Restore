@interface MKCalloutSelectionAccessoryView
+ (Class)layerClass;
+ (double)pointerHeight;
+ (double)pointerMargin;
- (MKCalloutSelectionAccessoryView)initWithSelectionAccessoryView:(id)a3 style:(int64_t)a4 pointerEdge:(int64_t)a5 pointerUnitLocation:(double)a6;
- (id)delegate;
- (int64_t)calloutStyle;
- (int64_t)pointerEdge;
- (void)_updateLayerColors;
- (void)_updateShape;
- (void)displayError;
- (void)displayLoading;
- (void)displayMapItem:(id)a3;
- (void)layoutSubviews;
- (void)placeCardPreferredContentSizeDidChange:(CGSize)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MKCalloutSelectionAccessoryView

- (MKCalloutSelectionAccessoryView)initWithSelectionAccessoryView:(id)a3 style:(int64_t)a4 pointerEdge:(int64_t)a5 pointerUnitLocation:(double)a6
{
  v64[8] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v63.receiver = self;
  v63.super_class = (Class)MKCalloutSelectionAccessoryView;
  double v12 = *MEMORY[0x1E4F1DB28];
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v16 = -[MKSelectionAccessoryView initWithFrame:](&v63, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v13, v14, v15);
  v17 = v16;
  if (v16)
  {
    v16->_calloutStyle = a4;
    v16->_pointerEdge = a5;
    v16->_pointerUnitLocation = a6;
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F428B8], "_mapkit_colorNamed:", @"DeveloperPlaceCardBorderColor");
    borderColor = v17->_borderColor;
    v17->_borderColor = (UIColor *)v18;

    id v62 = v11;
    if (a4 == 2)
    {
      v20 = (void *)MEMORY[0x1E4F428B8];
      v21 = @"DeveloperPlaceCardCompactBackgroundColor";
    }
    else
    {
      if (a4 != 1)
      {
        v24 = v17->_borderColor;
        fillColor = v17->_fillColor;
        v17->_fillColor = v24;
        goto LABEL_8;
      }
      v20 = (void *)MEMORY[0x1E4F428B8];
      v21 = @"DeveloperPlaceCardFullBackgroundColor";
    }
    uint64_t v22 = objc_msgSend(v20, "_mapkit_colorNamed:", v21);
    fillColor = v17->_fillColor;
    v17->_fillColor = (UIColor *)v22;
LABEL_8:

    v25 = [(MKCalloutSelectionAccessoryView *)v17 layer];
    [v25 setLineWidth:1.0];

    v26 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    [(CAShapeLayer *)v26 setShadowRadius:15.0];
    LODWORD(v27) = 1047904911;
    [(CAShapeLayer *)v26 setShadowOpacity:v27];
    id v28 = [MEMORY[0x1E4F428B8] blackColor];
    -[CAShapeLayer setShadowColor:](v26, "setShadowColor:", [v28 CGColor]);

    -[CAShapeLayer setShadowOffset:](v26, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [(CAShapeLayer *)v26 setCornerRadius:14.0];
    v29 = [(MKCalloutSelectionAccessoryView *)v17 layer];
    [v29 insertSublayer:v26 atIndex:0];

    shadowLayer = v17->_shadowLayer;
    v17->_shadowLayer = v26;
    v61 = v26;

    [(MKCalloutSelectionAccessoryView *)v17 _updateLayerColors];
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v12, v13, v14, v15);
    [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
    v32 = [v31 layer];
    [v32 setCornerRadius:14.0];

    v33 = [v31 layer];
    [v33 setMasksToBounds:1];

    [(MKCalloutSelectionAccessoryView *)v17 addSubview:v31];
    objc_storeStrong((id *)&v17->_wrappedView, a3);
    [(MKSelectionAccessoryView *)v17->_wrappedView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKSelectionAccessoryView *)v17->_wrappedView setPlaceCardContentSizeDelegate:v17];
    [v31 addSubview:v17->_wrappedView];
    v50 = (void *)MEMORY[0x1E4F28DC8];
    v60 = [(MKSelectionAccessoryView *)v17->_wrappedView topAnchor];
    v59 = [v31 topAnchor];
    v58 = [v60 constraintEqualToAnchor:v59];
    v64[0] = v58;
    v57 = [(MKSelectionAccessoryView *)v17->_wrappedView leadingAnchor];
    v56 = [v31 leadingAnchor];
    v55 = [v57 constraintEqualToAnchor:v56];
    v64[1] = v55;
    v54 = [v31 trailingAnchor];
    v53 = [(MKSelectionAccessoryView *)v17->_wrappedView trailingAnchor];
    v52 = [v54 constraintEqualToAnchor:v53];
    v64[2] = v52;
    v51 = [v31 bottomAnchor];
    v49 = [(MKSelectionAccessoryView *)v17->_wrappedView bottomAnchor];
    v48 = [v51 constraintEqualToAnchor:v49];
    v64[3] = v48;
    v47 = [v31 topAnchor];
    v46 = [(MKCalloutSelectionAccessoryView *)v17 topAnchor];
    v45 = [v47 constraintEqualToAnchor:v46 constant:0.5];
    v64[4] = v45;
    v44 = [v31 leadingAnchor];
    v43 = [(MKCalloutSelectionAccessoryView *)v17 leadingAnchor];
    v34 = [v44 constraintEqualToAnchor:v43 constant:0.5];
    v64[5] = v34;
    v35 = [(MKCalloutSelectionAccessoryView *)v17 trailingAnchor];
    v36 = [v31 trailingAnchor];
    v37 = [v35 constraintEqualToAnchor:v36 constant:0.5];
    v64[6] = v37;
    v38 = [(MKCalloutSelectionAccessoryView *)v17 bottomAnchor];
    v39 = [v31 bottomAnchor];
    v40 = [v38 constraintEqualToAnchor:v39 constant:0.5];
    v64[7] = v40;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:8];
    [v50 activateConstraints:v41];

    id v11 = v62;
  }

  return v17;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(MKCalloutSelectionAccessoryView *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v6)
  {
    [(MKCalloutSelectionAccessoryView *)self _updateLayerColors];
  }
}

- (void)_updateLayerColors
{
  v3 = [(UIColor *)self->_fillColor CGColor];
  id v4 = [(MKCalloutSelectionAccessoryView *)self layer];
  [v4 setFillColor:v3];

  id v5 = [(UIColor *)self->_borderColor colorWithAlphaComponent:0.5];
  uint64_t v6 = [v5 CGColor];
  v7 = [(MKCalloutSelectionAccessoryView *)self layer];
  [v7 setStrokeColor:v6];

  v8 = [(UIColor *)self->_fillColor CGColor];
  shadowLayer = self->_shadowLayer;

  [(CAShapeLayer *)shadowLayer setFillColor:v8];
}

- (void)placeCardPreferredContentSizeDidChange:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (qword_1E9154140 != -1) {
    dispatch_once(&qword_1E9154140, &__block_literal_global_38);
  }
  uint64_t v6 = (void *)_MergedGlobals_1_5;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_1_5, OS_LOG_TYPE_DEBUG))
  {
    v7 = NSString;
    v8 = v6;
    v9 = [v7 stringWithFormat:@"{%.1f, %.1f}", *(void *)&width, *(void *)&height];
    *(_DWORD *)buf = 138543362;
    v21 = v9;
    _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_DEBUG, "CalloutSelectionAccessoryView placeCardPreferredContentSizeDidChange: %{public}@", buf, 0xCu);
  }
  v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  wrappedViewWidthConstraint = self->_wrappedViewWidthConstraint;
  if (wrappedViewWidthConstraint)
  {
    [(NSLayoutConstraint *)wrappedViewWidthConstraint setConstant:width];
  }
  else
  {
    double v12 = [(MKSelectionAccessoryView *)self->_wrappedView widthAnchor];
    double v13 = [v12 constraintEqualToConstant:width];
    double v14 = self->_wrappedViewWidthConstraint;
    self->_wrappedViewWidthConstraint = v13;

    [v10 addObject:self->_wrappedViewWidthConstraint];
  }
  wrappedViewHeightConstraint = self->_wrappedViewHeightConstraint;
  if (wrappedViewHeightConstraint)
  {
    [(NSLayoutConstraint *)wrappedViewHeightConstraint setConstant:height];
  }
  else
  {
    v16 = [(MKSelectionAccessoryView *)self->_wrappedView heightAnchor];
    v17 = [v16 constraintEqualToConstant:height];
    uint64_t v18 = self->_wrappedViewHeightConstraint;
    self->_wrappedViewHeightConstraint = v17;

    LODWORD(v19) = 1144750080;
    [(NSLayoutConstraint *)self->_wrappedViewHeightConstraint setPriority:v19];
    [v10 addObject:self->_wrappedViewHeightConstraint];
  }
  if ([v10 count]) {
    [MEMORY[0x1E4F28DC8] activateConstraints:v10];
  }
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MKCalloutSelectionAccessoryView;
  [(MKCalloutSelectionAccessoryView *)&v3 layoutSubviews];
  [(MKCalloutSelectionAccessoryView *)self _updateShape];
}

- (void)_updateShape
{
  objc_super v3 = (void *)MEMORY[0x1E4F427D0];
  [(MKCalloutSelectionAccessoryView *)self bounds];
  objc_msgSend(v3, "bezierPathWithCalloutRect:unitLocation:edge:", self->_pointerEdge);
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 CGPath];
  uint64_t v6 = [(MKCalloutSelectionAccessoryView *)self layer];
  [v6 setPath:v5];

  id v7 = v4;
  -[CAShapeLayer setPath:](self->_shadowLayer, "setPath:", [v7 CGPath]);
  id v8 = v7;
  -[CAShapeLayer setShadowPath:](self->_shadowLayer, "setShadowPath:", [v8 CGPath]);
}

- (id)delegate
{
  return 0;
}

- (void)displayLoading
{
}

- (void)displayMapItem:(id)a3
{
}

- (void)displayError
{
}

+ (double)pointerMargin
{
  [MEMORY[0x1E4F427D0] pointerMargin];
  return result;
}

+ (double)pointerHeight
{
  return 14.0;
}

- (int64_t)calloutStyle
{
  return self->_calloutStyle;
}

- (int64_t)pointerEdge
{
  return self->_pointerEdge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_wrappedViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_wrappedViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);

  objc_storeStrong((id *)&self->_wrappedView, 0);
}

@end