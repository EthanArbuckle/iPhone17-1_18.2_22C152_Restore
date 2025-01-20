@interface CLLocation
+ (CLLocation)locationWithCPLLocationDictionary:(id)a3;
- (id)cplLocationDictionary;
@end

@implementation CLLocation

+ (CLLocation)locationWithCPLLocationDictionary:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"lat", objc_opt_class());
    v5 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"lon", objc_opt_class());
    v6 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"alt", objc_opt_class());
    v7 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"horzAcc", objc_opt_class());
    v8 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"vertAcc", objc_opt_class());
    v9 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"timestamp", objc_opt_class());
    v10 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"course", objc_opt_class());
    v11 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"speed", objc_opt_class());

    id v12 = 0;
    if (v4 && v5)
    {
      [v4 doubleValue];
      CLLocationDegrees v14 = v13;
      [v5 doubleValue];
      CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(v14, v15);
      id v17 = objc_alloc((Class)CLLocation);
      [v6 doubleValue];
      double v19 = v18;
      [v7 doubleValue];
      double v21 = v20;
      [v8 doubleValue];
      double v23 = v22;
      [v10 doubleValue];
      double v25 = v24;
      [v11 doubleValue];
      id v12 = objc_msgSend(v17, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v9, v16.latitude, v16.longitude, v19, v21, v23, v25, v26);
    }
  }
  else
  {
    id v12 = 0;
  }
  return (CLLocation *)v12;
}

- (id)cplLocationDictionary
{
  v14[0] = @"lat";
  [(CLLocation *)self coordinate];
  id v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v15[0] = v3;
  v14[1] = @"lon";
  [(CLLocation *)self coordinate];
  v5 = +[NSNumber numberWithDouble:v4];
  v15[1] = v5;
  v14[2] = @"alt";
  [(CLLocation *)self altitude];
  v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v15[2] = v6;
  v14[3] = @"horzAcc";
  [(CLLocation *)self horizontalAccuracy];
  v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v15[3] = v7;
  v14[4] = @"vertAcc";
  [(CLLocation *)self verticalAccuracy];
  v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v15[4] = v8;
  v14[5] = @"timestamp";
  v9 = [(CLLocation *)self timestamp];
  v15[5] = v9;
  v14[6] = @"course";
  [(CLLocation *)self course];
  v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v15[6] = v10;
  v14[7] = @"speed";
  [(CLLocation *)self speed];
  v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v15[7] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:8];

  return v12;
}

@end