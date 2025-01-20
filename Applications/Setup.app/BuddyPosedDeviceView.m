@interface BuddyPosedDeviceView
- (BuddyPosedDeviceView)initWithFrame:(CGRect)a3;
- (BuddyPosedDeviceView)initWithPairForProductType:(id)a3;
- (id)_helloBackgroundForProductType:(id)a3;
- (id)_helloScreenViewForProductType:(id)a3;
- (id)_helloScreenViewWithBackgroundImage:(id)a3 cursiveImage:(id)a4 labelBottomOffset:(double)a5 labelHorizontalInset:(double)a6 deviceType:(int64_t)a7;
- (id)_homeScreenImageForProductType:(id)a3;
- (id)_homeScreenViewForProductType:(id)a3;
- (id)_homeScreenViewWithImage:(id)a3;
- (id)_localizedHelloCursiveAssetForDeviceType:(int64_t)a3;
- (id)_screenImagePrefixForProductType:(id)a3;
- (int64_t)_deviceTypeForProductType:(id)a3;
- (void)_addPairForiPad;
- (void)_addPairForiPhone:(id)a3;
@end

@implementation BuddyPosedDeviceView

- (BuddyPosedDeviceView)initWithFrame:(CGRect)a3
{
  CGRect v9 = a3;
  SEL v7 = a2;
  id location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyPosedDeviceView;
  id location = -[BuddyPosedDeviceView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    v3 = +[UIColor systemGray6Color];
    [location setBackgroundColor:v3];

    [location setClipsToBounds:1];
    [location setAccessibilityIgnoresInvertColors:1];
  }
  v4 = (BuddyPosedDeviceView *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (BuddyPosedDeviceView)initWithPairForProductType:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v7;
  id v7 = 0;
  id v7 = [v3 initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  objc_storeStrong(&v7, v7);
  if (v7)
  {
    if ([location[0] containsString:@"iPad"]) {
      [v7 _addPairForiPad];
    }
    else {
      [v7 _addPairForiPhone:location[0]];
    }
  }
  v4 = (BuddyPosedDeviceView *)v7;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v7, 0);
  return v4;
}

- (id)_localizedHelloCursiveAssetForDeviceType:(int64_t)a3
{
  v13[3] = self;
  v13[2] = (id)a2;
  v13[1] = (id)a3;
  id v3 = +[NSLocale preferredLanguages];
  v4 = +[NSBundle preferredLocalizationsFromArray:&off_1002C14B8 forPreferences:v3];
  v13[0] = [(NSArray *)v4 firstObject];

  id v12 = &off_1002C1548;
  id v5 = [v12 objectForKey:v13[0]];

  if (v5)
  {
    id v6 = [v12 objectForKey:v13[0]];
    id v7 = v13[0];
    v13[0] = v6;
  }
  id v11 = +[NSString stringWithFormat:@"Cursive Hello %@", v13[0]];
  id location = +[UIImage imageNamed:v11];
  if (!location)
  {
    id location = +[UIImage imageNamed:@"Cursive Hello en"];
  }
  id v8 = location;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  return v8;
}

- (void)_addPairForiPad
{
  v42 = self;
  v41[1] = (id)a2;
  v41[0] = [(BuddyPosedDeviceView *)self _localizedHelloCursiveAssetForDeviceType:1];
  v2 = +[UIImage imageNamed:@"iPad Pair Hello"];
  id v40 = [(BuddyPosedDeviceView *)v42 _helloScreenViewWithBackgroundImage:v2 cursiveImage:v41[0] labelBottomOffset:1 labelHorizontalInset:88.0 deviceType:88.0];

  id v3 = +[UIImage imageNamed:@"iPad Phone Pair Home"];
  id v39 = [(BuddyPosedDeviceView *)v42 _homeScreenViewWithImage:v3];

  [(BuddyPosedDeviceView *)v42 addSubview:v40];
  [(BuddyPosedDeviceView *)v42 addSubview:v39];
  id location = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [location setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = +[UIColor systemGray6Color];
  [location setBackgroundColor:v4];

  [(BuddyPosedDeviceView *)v42 addSubview:location];
  id v37 = [v40 leadingAnchor];
  id v36 = [(BuddyPosedDeviceView *)v42 leadingAnchor];
  id v35 = [v37 constraintEqualToAnchor:];
  v43[0] = v35;
  id v34 = [v40 trailingAnchor];
  id v33 = [(BuddyPosedDeviceView *)v42 trailingAnchor];
  id v32 = [v34 constraintEqualToAnchor:];
  v43[1] = v32;
  id v31 = [v40 topAnchor];
  id v30 = [(BuddyPosedDeviceView *)v42 topAnchor];
  id v29 = [v31 constraintEqualToAnchor:];
  v43[2] = v29;
  id v28 = [v40 bottomAnchor];
  id v27 = [(BuddyPosedDeviceView *)v42 bottomAnchor];
  id v26 = [v28 constraintEqualToAnchor:];
  v43[3] = v26;
  id v25 = [v39 topAnchor];
  id v24 = [(BuddyPosedDeviceView *)v42 topAnchor];
  id v23 = [v25 constraintGreaterThanOrEqualToAnchor:];
  v43[4] = v23;
  id v22 = [v39 bottomAnchor];
  id v21 = [(BuddyPosedDeviceView *)v42 bottomAnchor];
  id v20 = [v22 constraintEqualToAnchor:];
  v43[5] = v20;
  id v19 = [(BuddyPosedDeviceView *)v42 trailingAnchor];
  id v18 = [v39 trailingAnchor];
  id v17 = [v19 constraintEqualToAnchor:28.0];
  v43[6] = v17;
  id v16 = [location leadingAnchor];
  id v15 = [(BuddyPosedDeviceView *)v42 leadingAnchor];
  id v5 = [v16 constraintEqualToAnchor:];
  v43[7] = v5;
  id v6 = [location trailingAnchor];
  id v7 = [(BuddyPosedDeviceView *)v42 trailingAnchor];
  id v8 = [v6 constraintEqualToAnchor:v7];
  v43[8] = v8;
  id v9 = [location bottomAnchor];
  id v10 = [(BuddyPosedDeviceView *)v42 bottomAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];
  v43[9] = v11;
  id v12 = [location heightAnchor];
  id v13 = [v12 constraintEqualToConstant:0.5];
  v43[10] = v13;
  v14 = +[NSArray arrayWithObjects:v43 count:11];
  +[NSLayoutConstraint activateConstraints:v14];

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(v41, 0);
}

- (void)_addPairForiPhone:(id)a3
{
  v49 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v47 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v47 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BuddyPosedDeviceView *)v49 addSubview:v47];
  id v3 = [v47 centerXAnchor];
  id v4 = [(BuddyPosedDeviceView *)v49 centerXAnchor];
  id v5 = [v3 constraintEqualToAnchor:v4];
  v51[0] = v5;
  id v6 = [v47 topAnchor];
  id v7 = [(BuddyPosedDeviceView *)v49 topAnchor];
  id v8 = [v6 constraintGreaterThanOrEqualToAnchor:v7];
  v51[1] = v8;
  id v9 = [v47 bottomAnchor];
  id v10 = [(BuddyPosedDeviceView *)v49 bottomAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];
  v51[2] = v11;
  id v12 = +[NSArray arrayWithObjects:v51 count:3];
  +[NSLayoutConstraint activateConstraints:v12];

  id v46 = [(BuddyPosedDeviceView *)v49 _helloScreenViewForProductType:location[0]];
  id v45 = [(BuddyPosedDeviceView *)v49 _homeScreenViewForProductType:location[0]];
  LODWORD(v13) = 1148846080;
  [v46 setContentCompressionResistancePriority:0 forAxis:v13];
  LODWORD(v14) = 1148846080;
  [v45 setContentCompressionResistancePriority:0 forAxis:v14];
  [v47 addSubview:v46];
  [v47 addSubview:v45];
  double v44 = 0.0;
  switch([(BuddyPosedDeviceView *)v49 _deviceTypeForProductType:location[0]])
  {
    case 1:
      double v44 = 59.0;
      break;
    case 2:
      double v44 = 62.0;
      break;
    case 3:
      double v44 = 60.0;
      break;
    case 4:
      double v44 = 74.0;
      break;
    case 5:
      double v44 = 71.0;
      break;
    default:
      break;
  }
  id v41 = [v47 topAnchor];
  id v40 = [v46 topAnchor];
  id v39 = [v41 constraintEqualToAnchor:];
  v50[0] = v39;
  id v38 = [v47 bottomAnchor];
  id v37 = [v45 bottomAnchor];
  [v38 constraintEqualToAnchor:];
  v50[1] = v36;
  id v35 = [v47 leftAnchor];
  id v34 = [v46 leftAnchor];
  id v33 = [v35 constraintEqualToAnchor:];
  v50[2] = v33;
  id v32 = [v47 rightAnchor];
  id v31 = [v45 rightAnchor];
  id v30 = [v32 constraintEqualToAnchor:];
  v50[3] = v30;
  id v15 = [v47 bottomAnchor];
  id v16 = [v46 bottomAnchor];
  id v17 = [v15 constraintEqualToAnchor:v16 constant:20.0];
  v50[4] = v17;
  id v18 = [v45 topAnchor];
  id v19 = [v46 topAnchor];
  id v20 = [v18 constraintEqualToAnchor:v19 constant:v44];
  v50[5] = v20;
  id v21 = [v46 rightAnchor];
  id v22 = [v45 leftAnchor];
  id v23 = [v21 constraintEqualToAnchor:v22 constant:20.0];
  v50[6] = v23;
  id v24 = +[NSArray arrayWithObjects:v50 count:7];
  +[NSLayoutConstraint activateConstraints:v24];

  id v25 = [v45 layer];
  LODWORD(v26) = 1045220557;
  [v25 setShadowOpacity:v26];

  id v27 = [v45 layer];
  [v27 setShadowRadius:18.0];

  double v42 = sub_1000701CC();
  double v43 = v28;
  id v29 = [v45 layer];
  [v29 setShadowOffset:v42, v43];

  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(location, 0);
}

- (id)_helloScreenViewForProductType:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = [(BuddyPosedDeviceView *)v10 _localizedHelloCursiveAssetForDeviceType:0];
  id v7 = [(BuddyPosedDeviceView *)v10 _helloBackgroundForProductType:location[0]];
  double v6 = 0.0;
  switch([(BuddyPosedDeviceView *)v10 _deviceTypeForProductType:location[0]])
  {
    case 1:
      id v3 = -[BuddyPosedDeviceView _helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:](v10, "_helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:", v7, v8, 0, 92.0, 10.0, 0x4057000000000000);
      break;
    case 2:
      id v3 = -[BuddyPosedDeviceView _helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:](v10, "_helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:", v7, v8, 0, 108.0, 10.0, 0x405B000000000000);
      break;
    case 3:
      id v3 = -[BuddyPosedDeviceView _helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:](v10, "_helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:", v7, v8, 0, 122.0, 10.0, 0x405E800000000000);
      break;
    case 4:
      id v3 = -[BuddyPosedDeviceView _helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:](v10, "_helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:", v7, v8, 0, 134.0, 10.0, 0x4060C00000000000);
      break;
    case 5:
      double v6 = 149.0;
      goto LABEL_7;
    default:
LABEL_7:
      id v3 = -[BuddyPosedDeviceView _helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:](v10, "_helloScreenViewWithBackgroundImage:cursiveImage:labelBottomOffset:labelHorizontalInset:deviceType:", v7, v8, 0, v6, 10.0, *(void *)&v6);
      break;
  }
  id v4 = v3;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (id)_helloScreenViewWithBackgroundImage:(id)a3 cursiveImage:(id)a4 labelBottomOffset:(double)a5 labelHorizontalInset:(double)a6 deviceType:(int64_t)a7
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v55 = 0;
  objc_storeStrong(&v55, a4);
  double v54 = a5;
  double v53 = a6;
  int64_t v52 = a7;
  id v11 = objc_alloc((Class)UIImageView);
  id v51 = [v11 initWithImage:location[0]];
  [v51 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v51 setContentMode:1];
  id v12 = objc_alloc((Class)UIImageView);
  id v50 = [v12 initWithImage:location[0]];
  [v50 setHidden:1];
  [v50 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v13) = 1148846080;
  [v50 setContentHuggingPriority:0 forAxis:v13];
  [v51 addSubview:v50];
  id v47 = [v50 topAnchor];
  id v46 = [v51 topAnchor];
  id v45 = [v47 constraintEqualToAnchor:];
  v58[0] = v45;
  id v14 = [v50 bottomAnchor];
  id v15 = [v51 bottomAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];
  v58[1] = v16;
  id v17 = [v50 centerXAnchor];
  id v18 = [v51 centerXAnchor];
  id v19 = [v17 constraintEqualToAnchor:v18];
  v58[2] = v19;
  id v20 = [v50 widthAnchor];
  id v21 = [v50 heightAnchor];
  [location[0] size];
  v49[3] = v22;
  v49[4] = v23;
  double v24 = *(double *)&v22;
  [location[0] size];
  v49[1] = v25;
  v49[2] = v26;
  id v27 = [v20 constraintEqualToAnchor:v21 multiplier:v24 / *(double *)&v26];
  v58[3] = v27;
  double v28 = +[NSArray arrayWithObjects:v58 count:4];
  +[NSLayoutConstraint activateConstraints:v28];

  id v29 = objc_alloc((Class)UIImageView);
  v49[0] = [v29 initWithImage:v55];
  [v49[0] setContentMode:1];
  [v49[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  [v51 addSubview:v49[0]];
  double v48 = 20.0;
  if (v52 == 1) {
    double v48 = 30.0;
  }
  id v44 = [v50 centerXAnchor];
  id v43 = [v49[0] centerXAnchor];
  id v30 = [v44 constraintEqualToAnchor:];
  v57[0] = v30;
  id v31 = [v50 widthAnchor];
  id v32 = [v49[0] widthAnchor];
  id v33 = [v31 constraintGreaterThanOrEqualToAnchor:v32 constant:v53 * 2.0];
  v57[1] = v33;
  id v34 = [v51 bottomAnchor];
  id v35 = [v49[0] bottomAnchor];
  id v36 = [v34 constraintEqualToAnchor:v35 constant:v54];
  v57[2] = v36;
  id v37 = [v49[0] heightAnchor];
  id v38 = [v37 constraintLessThanOrEqualToConstant:v48];
  v57[3] = v38;
  id v39 = +[NSArray arrayWithObjects:v57 count:4];
  [v42 activateConstraints:v39];

  id v40 = v51;
  objc_storeStrong(v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(location, 0);
  return v40;
}

- (id)_homeScreenViewForProductType:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyPosedDeviceView *)v8 _homeScreenImageForProductType:location[0]];
  id v4 = -[BuddyPosedDeviceView _homeScreenViewWithImage:](v8, "_homeScreenViewWithImage:", v3, v3);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (id)_homeScreenViewWithImage:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = objc_alloc((Class)UIImageView);
  id v6 = [v3 initWithImage:location[0]];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setContentMode:1];
  id v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_homeScreenImageForProductType:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = [(BuddyPosedDeviceView *)v8 _screenImagePrefixForProductType:location[0]];
  id v3 = +[NSString stringWithFormat:@"%@ Pair Home", v6];
  id v4 = +[UIImage imageNamed:v3];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (id)_helloBackgroundForProductType:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyPosedDeviceView *)v8 _screenImagePrefixForProductType:location[0]];
  id v4 = +[NSString stringWithFormat:@"%@ Pair Hello", v3];
  id v5 = +[UIImage imageNamed:v4];

  objc_storeStrong(location, 0);

  return v5;
}

- (id)_screenImagePrefixForProductType:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v6 = [(BuddyPosedDeviceView *)v8 _deviceTypeForProductType:location[0]];
  id v5 = 0;
  switch(v6)
  {
    case 1:
      objc_storeStrong(&v5, @"iPhone SE");
      break;
    case 2:
      objc_storeStrong(&v5, @"iPhone 7");
      break;
    case 3:
      objc_storeStrong(&v5, @"iPhone 7 Plus");
      break;
    case 4:
      objc_storeStrong(&v5, @"iPhone 11 Pro");
      break;
    case 5:
      objc_storeStrong(&v5, @"iPhone 11 Pro Max");
      break;
    default:
      break;
  }
  id v3 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v3;
}

- (int64_t)_deviceTypeForProductType:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (([location[0] containsString:@"iPhone"] & 1) == 0) {
    goto LABEL_21;
  }
  if (([location[0] containsString:@"iPhone8,4"] & 1) != 0
    || ([location[0] containsString:@"iPhone6"] & 1) != 0)
  {
    int64_t v8 = 1;
    int v6 = 1;
    goto LABEL_22;
  }
  if (([location[0] containsString:@"iPhone10,3"] & 1) != 0
    || ([location[0] containsString:@"iPhone10,6"] & 1) != 0
    || ([location[0] containsString:@"iPhone11,2"] & 1) != 0
    || ([location[0] containsString:@"iPhone11,8"] & 1) != 0
    || ([location[0] containsString:@"iPhone12,3"] & 1) != 0)
  {
    int64_t v8 = 4;
    int v6 = 1;
    goto LABEL_22;
  }
  if (([location[0] containsString:@"iPhone11,4"] & 1) != 0
    || ([location[0] containsString:@"iPhone11,6"] & 1) != 0
    || ([location[0] containsString:@"iPhone12,5"] & 1) != 0)
  {
    int64_t v8 = 5;
    int v6 = 1;
    goto LABEL_22;
  }
  id v5 = &off_1002C14D0;
  id v4 = &off_1002C14E8;
  if ([v5 containsObject:location[0]])
  {
    int64_t v8 = 2;
    int v6 = 1;
  }
  else if ([v4 containsObject:location[0]])
  {
    int64_t v8 = 3;
    int v6 = 1;
  }
  else
  {
    int v6 = 0;
  }
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  if (!v6)
  {
LABEL_21:
    int64_t v8 = 4;
    int v6 = 1;
  }
LABEL_22:
  objc_storeStrong(location, 0);
  return v8;
}

@end