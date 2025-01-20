@interface NTKSiderealSolarContainerView
- (NTKSiderealSolarContainerView)initWithFrame:(CGRect)a3 orbitDiameter:(double)a4 device:(id)a5;
- (UIView)dayAccessoryContainerView;
- (UIView)dayContainerView;
- (UIView)dayDisk;
- (UIView)nightAccessoryContainerView;
- (UIView)nightContainerView;
- (UIView)nightDisk;
- (UIView)nightRing;
- (double)poseForDayDiskBloomImage;
- (double)poseForDayDiskImage;
- (double)poseForDayGnomonImage;
- (double)poseForNightDiskImage;
- (double)poseForNightGnomonImage;
- (double)poseForNightRingImage;
- (id)_dayPathGlowImage;
- (id)_diskGlow;
- (id)_newGnomonView;
- (id)_solarSun;
- (void)setDayAccessoryContainerView:(id)a3;
- (void)setDayContainerView:(id)a3;
- (void)setDayDisk:(id)a3;
- (void)setNightAccessoryContainerView:(id)a3;
- (void)setNightContainerView:(id)a3;
- (void)setNightDisk:(id)a3;
- (void)setNightRing:(id)a3;
- (void)setSolarDayProgress:(double)a3;
@end

@implementation NTKSiderealSolarContainerView

- (NTKSiderealSolarContainerView)initWithFrame:(CGRect)a3 orbitDiameter:(double)a4 device:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a5;
  v78.receiver = self;
  v78.super_class = (Class)NTKSiderealSolarContainerView;
  v13 = -[NTKSiderealSolarContainerView initWithFrame:](&v78, "initWithFrame:", x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_device, a5);
    v14->_orbitDiameter = a4;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    sub_F690(v14->_device, &v74);
    uint64_t v15 = +[NTKSiderealColorManager sharedInstance];
    colorManager = v14->_colorManager;
    v14->_colorManager = (NTKSiderealColorManager *)v15;

    id v17 = objc_alloc((Class)UIView);
    [(NTKSiderealSolarContainerView *)v14 bounds];
    v18 = (UIView *)objc_msgSend(v17, "initWithFrame:");
    nightContainerView = v14->_nightContainerView;
    v14->_nightContainerView = v18;

    [(NTKSiderealSolarContainerView *)v14 addSubview:v14->_nightContainerView];
    id v20 = objc_alloc((Class)UIView);
    [(NTKSiderealSolarContainerView *)v14 bounds];
    v21 = (UIView *)objc_msgSend(v20, "initWithFrame:");
    nightAccessoryContainerView = v14->_nightAccessoryContainerView;
    v14->_nightAccessoryContainerView = v21;

    [(UIView *)v14->_nightContainerView addSubview:v14->_nightAccessoryContainerView];
    v23 = [(NTKSiderealSolarContainerView *)v14 _newGnomonView];
    nightDiskGnomon = v14->_nightDiskGnomon;
    v14->_nightDiskGnomon = v23;

    v25 = v14->_nightDiskGnomon;
    CGColorRef SRGB = CGColorCreateSRGB(1.0, 1.0, 1.0, 0.0);
    v80[0] = SRGB;
    CGColorRef v27 = CGColorCreateSRGB(0.498039216, 0.498039216, 1.0, 0.75);
    v80[1] = v27;
    CGColorRef v28 = CGColorCreateSRGB(1.0, 1.0, 1.0, 0.0);
    v80[2] = v28;
    v29 = +[NSArray arrayWithObjects:v80 count:3];
    [(CAGradientLayer *)v25 setColors:v29];

    v30 = [(UIView *)v14->_nightAccessoryContainerView layer];
    [v30 addSublayer:v14->_nightDiskGnomon];

    id v31 = objc_alloc((Class)UIView);
    double v32 = *(double *)&v75;
    double v33 = *(double *)&v75 + -1.0;
    v34 = (UIView *)objc_msgSend(v31, "initWithFrame:", 0.0, 0.0, *(double *)&v75 + -1.0, *(double *)&v75 + -1.0);
    nightDisk = v14->_nightDisk;
    v14->_nightDisk = v34;

    v36 = [(UIView *)v14->_nightDisk layer];
    [v36 setCornerRadius:v33 * 0.5];

    v37 = v14->_nightDisk;
    v38 = +[UIColor whiteColor];
    [(UIView *)v37 setBackgroundColor:v38];

    [(UIView *)v14->_nightContainerView addSubview:v14->_nightDisk];
    v39 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v32, v32);
    nightRing = v14->_nightRing;
    v14->_nightRing = v39;

    v41 = [(UIView *)v14->_nightRing layer];
    [v41 setCornerRadius:v32 * 0.5];

    v42 = [(UIView *)v14->_nightRing layer];
    id v43 = +[UIColor whiteColor];
    objc_msgSend(v42, "setBorderColor:", objc_msgSend(v43, "CGColor"));

    v44 = [(UIView *)v14->_nightRing layer];
    [v44 setBorderWidth:*((double *)&v75 + 1)];

    [(UIView *)v14->_nightRing setBackgroundColor:0];
    [(UIView *)v14->_nightContainerView addSubview:v14->_nightRing];
    id v45 = objc_alloc((Class)UIView);
    [(NTKSiderealSolarContainerView *)v14 bounds];
    v46 = (UIView *)objc_msgSend(v45, "initWithFrame:");
    dayContainerView = v14->_dayContainerView;
    v14->_dayContainerView = v46;

    [(NTKSiderealSolarContainerView *)v14 addSubview:v14->_dayContainerView];
    id v48 = objc_alloc((Class)UIView);
    [(NTKSiderealSolarContainerView *)v14 bounds];
    v49 = (UIView *)objc_msgSend(v48, "initWithFrame:");
    dayAccessoryContainerView = v14->_dayAccessoryContainerView;
    v14->_dayAccessoryContainerView = v49;

    [(UIView *)v14->_dayContainerView addSubview:v14->_dayAccessoryContainerView];
    v51 = [(NTKSiderealSolarContainerView *)v14 _newGnomonView];
    dayDiskGnomon = v14->_dayDiskGnomon;
    v14->_dayDiskGnomon = v51;

    v53 = v14->_dayDiskGnomon;
    CGColorRef v54 = CGColorCreateSRGB(1.0, 1.0, 1.0, 0.0);
    v79[0] = v54;
    CGColorRef v55 = CGColorCreateSRGB(0.8, 0.941176471, 1.0, 1.0);
    v79[1] = v55;
    CGColorRef v56 = CGColorCreateSRGB(1.0, 1.0, 1.0, 0.0);
    v79[2] = v56;
    v57 = +[NSArray arrayWithObjects:v79 count:3];
    [(CAGradientLayer *)v53 setColors:v57];

    v58 = [(UIView *)v14->_dayAccessoryContainerView layer];
    [v58 addSublayer:v14->_dayDiskGnomon];

    id v59 = objc_alloc((Class)UIImageView);
    v60 = [(NTKSiderealSolarContainerView *)v14 _dayPathGlowImage];
    v61 = (UIImageView *)[v59 initWithImage:v60];
    dayPathGlow = v14->_dayPathGlow;
    v14->_dayPathGlow = v61;

    [(UIImageView *)v14->_dayPathGlow setContentMode:1];
    [(NTKSiderealSolarContainerView *)v14 bounds];
    CLKRectGetCenter();
    -[UIImageView setCenter:](v14->_dayPathGlow, "setCenter:");
    [(UIView *)v14->_dayAccessoryContainerView addSubview:v14->_dayPathGlow];
    id v63 = objc_alloc((Class)UIImageView);
    v64 = [(NTKSiderealSolarContainerView *)v14 _diskGlow];
    v65 = (UIImageView *)[v63 initWithImage:v64];
    dayDiskBloom = v14->_dayDiskBloom;
    v14->_dayDiskBloom = v65;

    [(UIView *)v14->_dayAccessoryContainerView addSubview:v14->_dayDiskBloom];
    id v67 = objc_alloc((Class)UIView);
    double v68 = *(double *)&v74;
    v69 = (UIView *)objc_msgSend(v67, "initWithFrame:", 0.0, 0.0, *(double *)&v74, *(double *)&v74);
    dayDisk = v14->_dayDisk;
    v14->_dayDisk = v69;

    id v71 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 0.0, 0.0, v68, v68);
    v72 = [(NTKSiderealSolarContainerView *)v14 _solarSun];
    [v71 setImage:v72];

    [(UIView *)v14->_dayDisk addSubview:v71];
    [(UIView *)v14->_dayContainerView insertSubview:v14->_dayDisk aboveSubview:v14->_dayAccessoryContainerView];
  }
  return v14;
}

- (id)_dayPathGlowImage
{
  *(_OWORD *)v18 = 0u;
  memset(v17, 0, sizeof(v17));
  sub_F690(self->_device, v17);
  v2 = +[CAGradientLayer layer];
  double v3 = v18[0];
  objc_msgSend(v2, "setBounds:", 0.0, 0.0, v18[0], v18[0]);
  [v2 setType:kCAGradientLayerConic];
  id v4 = +[UIColor whiteColor];
  v19[0] = [v4 CGColor];
  id v5 = +[UIColor colorWithWhite:1.0 alpha:0.0];
  v19[1] = [v5 CGColor];
  id v6 = +[UIColor colorWithWhite:1.0 alpha:0.0];
  v19[2] = [v6 CGColor];
  id v7 = +[UIColor whiteColor];
  v19[3] = [v7 CGColor];
  v8 = +[NSArray arrayWithObjects:v19 count:4];
  [v2 setColors:v8];

  [v2 setLocations:&off_2DFC8];
  objc_msgSend(v2, "setStartPoint:", 0.5, 0.5);
  objc_msgSend(v2, "setEndPoint:", 0.5, 0.0);
  double v9 = v3 * 0.5;
  [v2 setCornerRadius:v9];
  v10 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v9, v9, v9 + -0.5, 0.0, 6.28318531);
  v11 = +[CAShapeLayer layer];
  [v2 bounds];
  objc_msgSend(v11, "setFrame:");
  [v11 setCornerRadius:v9];
  id v12 = v10;
  objc_msgSend(v11, "setPath:", objc_msgSend(v12, "CGPath"));
  id v13 = +[UIColor whiteColor];
  objc_msgSend(v11, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

  [v11 setLineWidth:1.0];
  id v14 = +[UIColor clearColor];
  objc_msgSend(v11, "setFillColor:", objc_msgSend(v14, "CGColor"));

  [v2 setMask:v11];
  [v2 size];
  UIGraphicsBeginImageContextWithOptions(v21, 0, 0.0);
  [v2 renderInContext:UIGraphicsGetCurrentContext()];
  uint64_t v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

- (id)_diskGlow
{
  long long v17 = 0u;
  memset(v16, 0, sizeof(v16));
  sub_F690(self->_device, v16);
  v2 = +[CAGradientLayer layer];
  objc_msgSend(v2, "setFrame:", 0.0, 0.0, *((double *)&v17 + 1), *((double *)&v17 + 1));
  [v2 setType:kCAGradientLayerRadial];
  id v15 = +[UIColor whiteColor];
  v18[0] = [v15 CGColor];
  id v14 = +[UIColor colorWithWhite:1.0 alpha:0.862745];
  v18[1] = [v14 CGColor];
  id v3 = +[UIColor colorWithWhite:1.0 alpha:0.67451];
  v18[2] = [v3 CGColor];
  id v4 = +[UIColor colorWithWhite:1.0 alpha:0.411765];
  double v18[3] = [v4 CGColor];
  id v5 = +[UIColor colorWithWhite:1.0 alpha:0.278431];
  v18[4] = [v5 CGColor];
  id v6 = +[UIColor colorWithWhite:1.0 alpha:0.184314];
  v18[5] = [v6 CGColor];
  id v7 = +[UIColor colorWithWhite:1.0 alpha:0.117647];
  v18[6] = [v7 CGColor];
  id v8 = +[UIColor colorWithWhite:1.0 alpha:0.0588235];
  v18[7] = [v8 CGColor];
  id v9 = +[UIColor colorWithWhite:1.0 alpha:0.0156863];
  v18[8] = [v9 CGColor];
  id v10 = +[UIColor colorWithWhite:1.0 alpha:0.0];
  v18[9] = [v10 CGColor];
  v11 = +[NSArray arrayWithObjects:v18 count:10];
  [v2 setColors:v11];

  [v2 setLocations:&off_2DFE0];
  objc_msgSend(v2, "setStartPoint:", 0.5, 0.5);
  objc_msgSend(v2, "setEndPoint:", 0.0, 0.0);
  [v2 size];
  UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
  [v2 renderInContext:UIGraphicsGetCurrentContext()];
  id v12 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v12;
}

- (id)_solarSun
{
  memset(v9, 0, sizeof(v9));
  sub_F690(self->_device, v9);
  v2 = +[CAGradientLayer layer];
  objc_msgSend(v2, "setFrame:", 0.0, 0.0, *(double *)v9, *(double *)v9);
  [v2 setType:kCAGradientLayerRadial];
  id v3 = +[UIColor whiteColor];
  v10[0] = [v3 CGColor];
  id v4 = +[UIColor whiteColor];
  v10[1] = [v4 CGColor];
  id v5 = +[UIColor colorWithWhite:1.0 alpha:0.0];
  v10[2] = [v5 CGColor];
  id v6 = +[NSArray arrayWithObjects:v10 count:3];
  [v2 setColors:v6];

  [v2 setLocations:&off_2DFF8];
  objc_msgSend(v2, "setStartPoint:", 0.5, 0.5);
  objc_msgSend(v2, "setEndPoint:", 0.0, 0.0);
  [v2 size];
  UIGraphicsBeginImageContextWithOptions(v12, 0, 0.0);
  [v2 renderInContext:UIGraphicsGetCurrentContext()];
  id v7 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v7;
}

- (double)poseForDayGnomonImage
{
  [(CAGradientLayer *)self->_dayDiskGnomon setHidden:0];
  [(UIImageView *)self->_dayPathGlow setHidden:0];
  [(UIImageView *)self->_dayDiskBloom setHidden:1];
  [(UIView *)self->_dayDisk setHidden:1];
  [(CAGradientLayer *)self->_dayDiskGnomon bounds];
  return v3;
}

- (double)poseForDayDiskBloomImage
{
  [(CAGradientLayer *)self->_dayDiskGnomon setHidden:1];
  [(UIImageView *)self->_dayPathGlow setHidden:1];
  [(UIImageView *)self->_dayDiskBloom setHidden:0];
  [(UIView *)self->_dayDisk setHidden:1];
  [(UIImageView *)self->_dayDiskBloom bounds];
  return v3;
}

- (double)poseForDayDiskImage
{
  [(CAGradientLayer *)self->_dayDiskGnomon setHidden:1];
  [(UIImageView *)self->_dayPathGlow setHidden:1];
  [(UIImageView *)self->_dayDiskBloom setHidden:1];
  [(UIView *)self->_dayDisk setHidden:0];
  [(UIView *)self->_dayDisk bounds];
  return v3;
}

- (double)poseForNightGnomonImage
{
  [(CAGradientLayer *)self->_nightDiskGnomon setHidden:0];
  [(UIView *)self->_nightDisk setHidden:1];
  [(UIView *)self->_nightRing setHidden:1];
  [(CAGradientLayer *)self->_nightDiskGnomon bounds];
  return v3;
}

- (double)poseForNightDiskImage
{
  [(CAGradientLayer *)self->_nightDiskGnomon setHidden:1];
  [(UIView *)self->_nightDisk setHidden:0];
  [(UIView *)self->_nightRing setHidden:1];
  nightDisk = self->_nightDisk;
  id v4 = +[UIColor whiteColor];
  [(UIView *)nightDisk setBackgroundColor:v4];

  [(UIView *)self->_nightDisk bounds];
  return v5 + 2.0;
}

- (double)poseForNightRingImage
{
  [(CAGradientLayer *)self->_nightDiskGnomon setHidden:1];
  [(UIView *)self->_nightDisk setHidden:1];
  [(UIView *)self->_nightRing setHidden:0];
  [(UIView *)self->_nightDisk bounds];
  return v3 + 2.0;
}

- (void)setSolarDayProgress:(double)a3
{
  CLKDegreesToRadians();
  double v5 = v4;
  CGFloat v6 = v4 + 1.57079633;
  [(NTKSiderealSolarContainerView *)self bounds];
  CLKRectGetCenter();
  NTKPointOnCircle();
  double v8 = v7;
  double v10 = v9;
  -[UIView setCenter:](self->_nightDisk, "setCenter:");
  -[UIView setCenter:](self->_nightRing, "setCenter:", v8, v10);
  -[UIView setCenter:](self->_dayDisk, "setCenter:", v8, v10);
  -[UIImageView setCenter:](self->_dayDiskBloom, "setCenter:", v8, v10);
  memset(&v16, 0, sizeof(v16));
  CATransform3DMakeRotation(&v16, v6, 0.0, 0.0, 1.0);
  +[CATransaction begin];
  +[CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
  dayPathGlow = self->_dayPathGlow;
  CGAffineTransformMakeRotation(&v15, v5 + 3.14159265);
  [(UIImageView *)dayPathGlow setTransform:&v15];
  dayDiskGnomon = self->_dayDiskGnomon;
  CATransform3D v14 = v16;
  [(CAGradientLayer *)dayDiskGnomon setTransform:&v14];
  nightDiskGnomon = self->_nightDiskGnomon;
  CATransform3D v14 = v16;
  [(CAGradientLayer *)nightDiskGnomon setTransform:&v14];
  +[CATransaction commit];
}

- (id)_newGnomonView
{
  long long v6 = 0u;
  long long v7 = 0u;
  memset(v5, 0, sizeof(v5));
  sub_F690(self->_device, v5);
  double v3 = +[CAGradientLayer layer];
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, v6);
  [(NTKSiderealSolarContainerView *)self bounds];
  CLKRectGetCenter();
  objc_msgSend(v3, "setPosition:");
  objc_msgSend(v3, "setAnchorPoint:", 0.0, 0.5);
  objc_msgSend(v3, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v3, "setEndPoint:", 1.0, 0.5);
  [v3 setType:kCAGradientLayerAxial];
  [v3 setLocations:&off_2E010];
  return v3;
}

- (UIView)dayContainerView
{
  return self->_dayContainerView;
}

- (void)setDayContainerView:(id)a3
{
}

- (UIView)nightContainerView
{
  return self->_nightContainerView;
}

- (void)setNightContainerView:(id)a3
{
}

- (UIView)dayDisk
{
  return self->_dayDisk;
}

- (void)setDayDisk:(id)a3
{
}

- (UIView)dayAccessoryContainerView
{
  return self->_dayAccessoryContainerView;
}

- (void)setDayAccessoryContainerView:(id)a3
{
}

- (UIView)nightDisk
{
  return self->_nightDisk;
}

- (void)setNightDisk:(id)a3
{
}

- (UIView)nightRing
{
  return self->_nightRing;
}

- (void)setNightRing:(id)a3
{
}

- (UIView)nightAccessoryContainerView
{
  return self->_nightAccessoryContainerView;
}

- (void)setNightAccessoryContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nightAccessoryContainerView, 0);
  objc_storeStrong((id *)&self->_nightRing, 0);
  objc_storeStrong((id *)&self->_nightDisk, 0);
  objc_storeStrong((id *)&self->_dayAccessoryContainerView, 0);
  objc_storeStrong((id *)&self->_dayDisk, 0);
  objc_storeStrong((id *)&self->_nightContainerView, 0);
  objc_storeStrong((id *)&self->_dayContainerView, 0);
  objc_storeStrong((id *)&self->_colorManager, 0);
  objc_storeStrong((id *)&self->_nightDiskGnomon, 0);
  objc_storeStrong((id *)&self->_dayDiskGnomon, 0);
  objc_storeStrong((id *)&self->_dayDiskBloom, 0);
  objc_storeStrong((id *)&self->_dayPathGlow, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end