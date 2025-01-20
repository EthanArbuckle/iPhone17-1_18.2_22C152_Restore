@interface DADeviceImageViewManager
+ (id)sharedInstance;
- (id)getDeviceSizeTokenForCurrentDeviceClass:(id)a3;
- (id)getFormattedDeviceColor:(id)a3 deviceEnclosureColor:(id)a4;
- (id)getImageFromCacheWithRequest:(id)a3;
- (id)imageURLForDeviceClass:(id)a3 deviceModel:(id)a4 deviceColor:(id)a5 deviceEnclosureColor:(id)a6 scale:(float)a7;
- (id)prepareSession;
- (void)deviceImageViewForDeviceState:(id)a3 completion:(id)a4;
- (void)downloadAndCreateDeviceImageForDeviceState:(id)a3 completion:(id)a4;
- (void)downloadAndSetImageForURL:(id)a3 fallbackUrl:(id)a4 withDeviceState:(id)a5 andCompletionHandler:(id)a6;
- (void)setDeviceImage:(id)a3 forDeviceState:(id)a4 withCompletion:(id)a5;
@end

@implementation DADeviceImageViewManager

+ (id)sharedInstance
{
  if (qword_1001868E8 != -1) {
    dispatch_once(&qword_1001868E8, &stru_10014BB70);
  }
  v2 = (void *)qword_1001868E0;

  return v2;
}

- (void)deviceImageViewForDeviceState:(id)a3 completion:(id)a4
{
}

- (void)downloadAndCreateDeviceImageForDeviceState:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = dispatch_get_global_queue(0, 0);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100016530;
  v11[3] = &unk_10014BB98;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)downloadAndSetImageForURL:(id)a3 fallbackUrl:(id)a4 withDeviceState:(id)a5 andCompletionHandler:(id)a6
{
  id v10 = a3;
  id v22 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_100016B4C;
  v39 = sub_100016B5C;
  id v40 = 0;
  id v13 = [(DADeviceImageViewManager *)self prepareSession];
  id v14 = +[NSMutableURLRequest requestWithURL:v10];
  [v14 setHTTPMethod:@"GET"];
  uint64_t v15 = [(DADeviceImageViewManager *)self getImageFromCacheWithRequest:v14];
  v16 = (void *)v36[5];
  v36[5] = v15;

  uint64_t v17 = v36[5];
  if (v17)
  {
    [(DADeviceImageViewManager *)self setDeviceImage:v17 forDeviceState:v11 withCompletion:v12];
  }
  else
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100016B64;
    v31[3] = &unk_10014BBC0;
    v34 = &v35;
    v31[4] = self;
    id v18 = v11;
    id v32 = v18;
    id v19 = v12;
    id v33 = v19;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100016BCC;
    v23[3] = &unk_10014BBE8;
    v20 = objc_retainBlock(v31);
    id v28 = v20;
    v30 = &v35;
    id v24 = v22;
    v25 = self;
    id v26 = v18;
    id v29 = v19;
    id v27 = v13;
    v21 = [v27 dataTaskWithRequest:v14 completionHandler:v23];
    [v21 resume];
  }
  _Block_object_dispose(&v35, 8);
}

- (id)getImageFromCacheWithRequest:(id)a3
{
  id v3 = a3;
  v4 = +[NSURLCache sharedURLCache];
  v5 = [v4 cachedResponseForRequest:v3];

  id v6 = [v5 data];

  if (v6)
  {
    id v7 = [v5 data];
    id v6 = +[UIImage imageWithData:v7];
  }

  return v6;
}

- (id)prepareSession
{
  v2 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  id v3 = +[NSURLSession sessionWithConfiguration:v2];

  return v3;
}

- (void)setDeviceImage:(id)a3 forDeviceState:(id)a4 withCompletion:(id)a5
{
  id v6 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = sub_100016B4C;
  v12[4] = sub_100016B5C;
  id v13 = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100016F40;
  v9[3] = &unk_10014BC10;
  id v10 = a5;
  id v11 = v12;
  id v7 = v10;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

  _Block_object_dispose(v12, 8);
}

- (id)imageURLForDeviceClass:(id)a3 deviceModel:(id)a4 deviceColor:(id)a5 deviceEnclosureColor:(id)a6 scale:(float)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(DADeviceImageViewManager *)self getDeviceSizeTokenForCurrentDeviceClass:v15];
  uint64_t v17 = [(DADeviceImageViewManager *)self getFormattedDeviceColor:v13 deviceEnclosureColor:v12];

  id v18 = [@"https://statici.icloud.com/fmipmobile/deviceImages-9.0/" mutableCopy];
  id v19 = +[NSCharacterSet URLPathAllowedCharacterSet];
  v20 = [v15 stringByAddingPercentEncodingWithAllowedCharacters:v19];

  [v18 appendFormat:@"%@/", v20];
  v21 = +[NSCharacterSet URLPathAllowedCharacterSet];
  id v22 = [v14 stringByAddingPercentEncodingWithAllowedCharacters:v21];

  [v18 appendFormat:@"%@", v22];
  if (v17) {
    [v18 appendFormat:@"-%@", v17];
  }
  [v18 appendString:@"/"];
  if (a7 <= 1.0) {
    v23 = &stru_1001548A0;
  }
  else {
    v23 = [objc_alloc((Class)NSString) initWithFormat:@"__%.0fx" a7];
  }
  [v18 appendFormat:@"%@-%@%@.png", @"online", v16, v23];
  id v24 = +[NSURL URLWithString:v18];

  return v24;
}

- (id)getDeviceSizeTokenForCurrentDeviceClass:(id)a3
{
  id v3 = a3;
  v4 = (void *)MGCopyAnswer();
  v5 = (void *)MGCopyAnswer();
  if (([v3 isEqualToString:v4] & 1) != 0
    || [v3 isEqualToString:v5])
  {
    CFStringRef v6 = @"nolocation_ipad";
  }
  else
  {
    CFStringRef v6 = @"nolocation_iphone";
  }

  return (id)v6;
}

- (id)getFormattedDeviceColor:(id)a3 deviceEnclosureColor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  id v8 = 0;
  if (v5 && v6)
  {
    id v8 = objc_opt_new();
    if ([v5 length])
    {
      id v9 = +[NSCharacterSet URLPathAllowedCharacterSet];
      id v10 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v9];
      [v8 appendFormat:@"%@", v10];
    }
    if ([v7 length])
    {
      id v11 = +[NSCharacterSet URLPathAllowedCharacterSet];
      id v12 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v11];
      [v8 appendFormat:@"-%@", v12];
    }
    if ([v7 intValue]) {
      [v8 appendFormat:@"-%@", @"0"];
    }
  }

  return v8;
}

@end