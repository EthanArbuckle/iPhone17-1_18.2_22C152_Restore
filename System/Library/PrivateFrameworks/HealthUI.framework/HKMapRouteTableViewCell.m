@interface HKMapRouteTableViewCell
+ (NSString)defaultReuseIdentifier;
- (HKMapRouteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MKMapView)mapView;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (void)setMapView:(id)a3;
- (void)setUpConstraints;
- (void)setupSubviews;
@end

@implementation HKMapRouteTableViewCell

+ (NSString)defaultReuseIdentifier
{
  return (NSString *)@"HKMapRouteTableViewCell";
}

- (HKMapRouteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKMapRouteTableViewCell;
  v4 = [(HKMapRouteTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(HKMapRouteTableViewCell *)v4 setupSubviews];
    [(HKMapRouteTableViewCell *)v5 setUpConstraints];
  }
  return v5;
}

- (void)setupSubviews
{
  v3 = objc_opt_new();
  [(HKMapRouteTableViewCell *)self setMapView:v3];

  v4 = [(HKMapRouteTableViewCell *)self mapView];
  [v4 setDelegate:self];

  v5 = [(HKMapRouteTableViewCell *)self mapView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v7 = [(HKMapRouteTableViewCell *)self contentView];
  v6 = [(HKMapRouteTableViewCell *)self mapView];
  [v7 addSubview:v6];
}

- (void)setUpConstraints
{
  v3 = [(HKMapRouteTableViewCell *)self contentView];
  v4 = [v3 topAnchor];
  v5 = [(HKMapRouteTableViewCell *)self mapView];
  v6 = [v5 topAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  v8 = [(HKMapRouteTableViewCell *)self contentView];
  v9 = [v8 bottomAnchor];
  v10 = [(HKMapRouteTableViewCell *)self mapView];
  v11 = [v10 bottomAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  [v12 setActive:1];

  v13 = [(HKMapRouteTableViewCell *)self contentView];
  v14 = [v13 leftAnchor];
  v15 = [(HKMapRouteTableViewCell *)self mapView];
  v16 = [v15 leftAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  v18 = [(HKMapRouteTableViewCell *)self contentView];
  v19 = [v18 rightAnchor];
  v20 = [(HKMapRouteTableViewCell *)self mapView];
  v21 = [v20 rightAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  v23 = [(HKMapRouteTableViewCell *)self mapView];
  v24 = [v23 heightAnchor];
  id v26 = [v24 constraintEqualToConstant:300.0];

  LODWORD(v25) = 1132068864;
  [v26 setPriority:v25];
  [v26 setActive:1];
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  v4 = (objc_class *)MEMORY[0x1E4F30F80];
  id v5 = a4;
  v6 = (void *)[[v4 alloc] initWithAnnotation:v5 reuseIdentifier:0];

  id v7 = [MEMORY[0x1E4FB1618] greenColor];
  [v6 setPinTintColor:v7];

  return v6;
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  v4 = (objc_class *)MEMORY[0x1E4F30FF8];
  id v5 = a4;
  v6 = (void *)[[v4 alloc] initWithOverlay:v5];

  [v6 setLineWidth:5.0];
  id v7 = [MEMORY[0x1E4F30F80] greenPinColor];
  [v6 setStrokeColor:v7];

  return v6;
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setMapView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end