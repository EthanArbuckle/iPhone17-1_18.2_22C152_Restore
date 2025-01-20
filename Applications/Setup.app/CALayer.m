@interface CALayer
+ (id)buddy_layerForPackageWithData:(id)a3 geometryFlipped:(BOOL)a4 scale:(double)a5;
@end

@implementation CALayer

+ (id)buddy_layerForPackageWithData:(id)a3 geometryFlipped:(BOOL)a4 scale:(double)a5
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v21 = a4;
  double v20 = a5;
  id v19 = 0;
  id v17 = 0;
  v7 = +[CAPackage packageWithData:location[0] type:kCAPackageTypeArchive options:0 error:&v17];
  objc_storeStrong(&v19, v17);
  id v18 = v7;
  if (v19)
  {
    id v16 = (id)_BYLoggingFacility();
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      sub_10004B238((uint64_t)buf, (uint64_t)v19);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v16, v15, "Failed to load package data with error %@", buf, 0xCu);
    }
    objc_storeStrong(&v16, 0);
  }
  BOOL v8 = v21;
  id v9 = [v18 rootLayer];
  [v9 setGeometryFlipped:v8];

  CATransform3DMakeScale(&v14, 1.0 / v20, 1.0 / v20, 1.0);
  id v10 = [v18 rootLayer];
  CATransform3D v13 = v14;
  [v10 setTransform:&v13];

  id v11 = [v18 rootLayer];
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);

  return v11;
}

@end