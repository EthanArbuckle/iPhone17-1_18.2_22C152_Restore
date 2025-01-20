@interface HSPCFixedSizeCenterContentViewController
- (BOOL)pinSides;
- (CGSize)contentSize;
- (HSPCFixedSizeCenterContentViewController)initWithCenterContentView:(id)a3;
- (HSPCFixedSizeCenterContentViewController)initWithCenterContentView:(id)a3 size:(CGSize)a4;
- (HSPCFixedSizeCenterContentViewController)initWithCenterContentView:(id)a3 size:(CGSize)a4 pinSides:(BOOL)a5;
- (UIView)centerContentView;
- (void)setCenterContentView:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setPinSides:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HSPCFixedSizeCenterContentViewController

- (HSPCFixedSizeCenterContentViewController)initWithCenterContentView:(id)a3
{
  return -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:](self, "initWithCenterContentView:size:", a3, 115.0, 115.0);
}

- (HSPCFixedSizeCenterContentViewController)initWithCenterContentView:(id)a3 size:(CGSize)a4
{
  return -[HSPCFixedSizeCenterContentViewController initWithCenterContentView:size:pinSides:](self, "initWithCenterContentView:size:pinSides:", a3, 0, a4.width, a4.height);
}

- (HSPCFixedSizeCenterContentViewController)initWithCenterContentView:(id)a3 size:(CGSize)a4 pinSides:(BOOL)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HSPCFixedSizeCenterContentViewController;
  v11 = [(HSPCFixedSizeCenterContentViewController *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_centerContentView, a3);
    v12->_contentSize.CGFloat width = width;
    v12->_contentSize.CGFloat height = height;
    v12->_pinSides = a5;
  }

  return v12;
}

- (void)viewDidLoad
{
  v42.receiver = self;
  v42.super_class = (Class)HSPCFixedSizeCenterContentViewController;
  [(HSPCFixedSizeCenterContentViewController *)&v42 viewDidLoad];
  v3 = [(HSPCFixedSizeCenterContentViewController *)self contentView];
  v41 = [v3 mainContentGuide];

  v4 = [(HSPCFixedSizeCenterContentViewController *)self centerContentView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(HSPCFixedSizeCenterContentViewController *)self contentView];
  v6 = [(HSPCFixedSizeCenterContentViewController *)self centerContentView];
  [v5 addSubview:v6];

  v7 = [(HSPCFixedSizeCenterContentViewController *)self contentView];
  [v7 setClipsToBounds:0];

  v8 = [(HSPCFixedSizeCenterContentViewController *)self contentView];
  v9 = [v8 superview];
  [v9 setClipsToBounds:0];

  id v10 = [(HSPCFixedSizeCenterContentViewController *)self centerContentView];
  v11 = [v10 heightAnchor];
  [(HSPCFixedSizeCenterContentViewController *)self contentSize];
  v13 = [v11 constraintEqualToConstant:v12];
  v45[0] = v13;
  objc_super v14 = [(HSPCFixedSizeCenterContentViewController *)self centerContentView];
  v15 = [v14 widthAnchor];
  [(HSPCFixedSizeCenterContentViewController *)self contentSize];
  v16 = [v15 constraintEqualToConstant:];
  v45[1] = v16;
  v17 = +[NSArray arrayWithObjects:v45 count:2];
  +[NSLayoutConstraint activateConstraints:v17];

  LODWORD(v11) = [(HSPCFixedSizeCenterContentViewController *)self pinSides];
  v18 = [(HSPCFixedSizeCenterContentViewController *)self centerContentView];
  v40 = v18;
  if (v11)
  {
    v19 = [v18 leadingAnchor];
    v38 = [v41 leadingAnchor];
    v39 = v19;
    v37 = [v19 constraintEqualToAnchor:];
    v44[0] = v37;
    v36 = [(HSPCFixedSizeCenterContentViewController *)self centerContentView];
    v20 = [v36 topAnchor];
    v34 = [v41 topAnchor];
    v35 = v20;
    v21 = [v20 constraintEqualToAnchor:];
    v44[1] = v21;
    v22 = [(HSPCFixedSizeCenterContentViewController *)self centerContentView];
    v23 = [v22 trailingAnchor];
    v24 = [v41 trailingAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v44[2] = v25;
    v26 = [(HSPCFixedSizeCenterContentViewController *)self centerContentView];
    v27 = [v26 bottomAnchor];
    v28 = [v41 bottomAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    v44[3] = v29;
    v30 = v44;
  }
  else
  {
    v31 = [v18 centerXAnchor];
    v38 = [v41 centerXAnchor];
    v39 = v31;
    v37 = [v31 constraintEqualToAnchor:];
    v43[0] = v37;
    v36 = [(HSPCFixedSizeCenterContentViewController *)self centerContentView];
    v32 = [v36 centerYAnchor];
    v34 = [v41 centerYAnchor];
    v35 = v32;
    v21 = [v32 constraintEqualToAnchor:];
    v43[1] = v21;
    v22 = [(HSPCFixedSizeCenterContentViewController *)self centerContentView];
    v23 = [v22 topAnchor];
    v24 = [v41 topAnchor];
    v25 = [v23 constraintGreaterThanOrEqualToAnchor:v24 constant:0.0];
    v43[2] = v25;
    v26 = [(HSPCFixedSizeCenterContentViewController *)self centerContentView];
    v27 = [v26 bottomAnchor];
    v28 = [v41 bottomAnchor];
    v29 = [v27 constraintLessThanOrEqualToAnchor:v28 constant:0.0];
    v43[3] = v29;
    v30 = v43;
  }
  v33 = +[NSArray arrayWithObjects:v30 count:4];
  +[NSLayoutConstraint activateConstraints:v33];
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (UIView)centerContentView
{
  return self->_centerContentView;
}

- (void)setCenterContentView:(id)a3
{
}

- (BOOL)pinSides
{
  return self->_pinSides;
}

- (void)setPinSides:(BOOL)a3
{
  self->_pinSides = a3;
}

- (void).cxx_destruct
{
}

@end