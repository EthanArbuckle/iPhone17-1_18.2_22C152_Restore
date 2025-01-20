@interface GEOURLOptions(MKURLSerializerExtras)
- (id)initWithLaunchOptions:()MKURLSerializerExtras;
- (id)launchOptions;
@end

@implementation GEOURLOptions(MKURLSerializerExtras)

- (id)initWithLaunchOptions:()MKURLSerializerExtras
{
  id v4 = a3;
  v32.receiver = a1;
  v32.super_class = (Class)&off_1EDA2CB80;
  id v5 = objc_msgSendSuper2(&v32, sel_init);
  if (v5)
  {
    v6 = [v4 objectForKey:@"MKLaunchOptionsMapType"];
    v7 = v6;
    if (v6)
    {
      unint64_t v8 = [v6 unsignedIntegerValue] - 1;
      if (v8 > 3) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = dword_18BD1BE80[v8];
      }
      [v5 setMapType:v9];
    }
    uint64_t v10 = [v4 objectForKey:@"MKLaunchOptionsMapCenter"];
    uint64_t v11 = [v4 objectForKey:@"MKLaunchOptionsMapSpan"];
    if (v10 | v11)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F64B48]);
      if (v10)
      {
        [(id)v10 MKCoordinateValue];
        double v14 = v13;
        objc_msgSend(v12, "setLatitude:");
        [v12 setLongitude:v14];
      }
      if (v11)
      {
        [(id)v11 MKCoordinateSpanValue];
        double v16 = v15;
        objc_msgSend(v12, "setLatitudeDelta:");
        [v12 setLongitudeDelta:v16];
      }
      [v5 setCenterSpan:v12];
    }
    v17 = [v4 objectForKey:@"MKLaunchOptionsCameraKey"];
    if (v17)
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F64B40]);
      [v17 centerCoordinate];
      objc_msgSend(v18, "setLatitude:");
      [v17 centerCoordinate];
      [v18 setLongitude:v19];
      [v17 heading];
      objc_msgSend(v18, "setHeading:");
      [v17 _precisePitch];
      objc_msgSend(v18, "setPitch:");
      [v17 altitude];
      objc_msgSend(v18, "setAltitude:");
      [v5 setCamera:v18];
    }
    v20 = [v4 objectForKey:@"MKLaunchOptionsShowsTraffic"];
    v21 = v20;
    if (v20) {
      objc_msgSend(v5, "setEnableTraffic:", objc_msgSend(v20, "BOOLValue"));
    }
    v31 = (void *)v11;
    v22 = [v4 objectForKey:@"MKLaunchOptionsReferralIdentifierKey"];
    if (v22) {
      [v5 setReferralIdentifier:v22];
    }
    v23 = (void *)v10;
    v24 = [v4 objectForKey:@"MKLaunchOptionsRouteHandle"];
    if (v24) {
      [v5 setRouteHandle:v24];
    }
    v25 = v7;
    v26 = [v4 objectForKey:@"MKLaunchOptionsTimePointKey"];
    if (v26) {
      [v5 setTimePoint:v26];
    }
    v27 = [v4 objectForKey:@"MKLaunchOptionsConnectedToCarKey"];
    v28 = v27;
    if (v27) {
      objc_msgSend(v5, "setConnectedToCar:", objc_msgSend(v27, "BOOLValue"));
    }
    id v29 = v5;
  }
  return v5;
}

- (id)launchOptions
{
  if (([a1 hasEnableTraffic] & 1) == 0
    && ([a1 hasMapType] & 1) == 0
    && ([a1 hasTransportType] & 1) == 0
    && ([a1 hasCenterSpan] & 1) == 0
    && ([a1 hasCamera] & 1) == 0
    && ![a1 hasReferralIdentifier])
  {
    v2 = 0;
    goto LABEL_38;
  }
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([a1 hasMapType])
  {
    int v3 = [a1 mapType];
    if (v3 == 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2 * (v3 == 2);
    }
    id v5 = [NSNumber numberWithUnsignedInteger:v4];
    [v2 setObject:v5 forKey:@"MKLaunchOptionsMapType"];
  }
  if ([a1 hasTransportType])
  {
    unsigned int v6 = [a1 transportType];
    if (v6 > 3) {
      v7 = &MKLaunchOptionsDirectionsModeDefault;
    }
    else {
      v7 = (NSString *const *)off_1E54BEA60[v6];
    }
    [v2 setObject:*v7 forKey:@"MKLaunchOptionsDirectionsMode"];
  }
  if ([a1 hasCamera])
  {
    unint64_t v8 = [a1 camera];
    uint64_t v9 = objc_alloc_init(MKMapCamera);
    [v8 latitude];
    CLLocationDegrees v11 = v10;
    [v8 longitude];
    CLLocationCoordinate2D v13 = CLLocationCoordinate2DMake(v11, v12);
    -[MKMapCamera setCenterCoordinate:](v9, "setCenterCoordinate:", v13.latitude, v13.longitude);
    [v8 heading];
    -[MKMapCamera setHeading:](v9, "setHeading:");
    [v8 pitch];
    -[MKMapCamera _setPrecisePitch:](v9, "_setPrecisePitch:");
    [v8 altitude];
    -[MKMapCamera setAltitude:](v9, "setAltitude:");
    double v14 = &MKLaunchOptionsCameraKey;
LABEL_19:
    [v2 setObject:v9 forKey:*v14];

    goto LABEL_20;
  }
  if (![a1 hasCenterSpan]) {
    goto LABEL_28;
  }
  unint64_t v8 = [a1 centerSpan];
  if ([v8 hasLatitude] && objc_msgSend(v8, "hasLongitude"))
  {
    [v8 latitude];
    CLLocationDegrees v16 = v15;
    [v8 longitude];
    CLLocationCoordinate2D v18 = CLLocationCoordinate2DMake(v16, v17);
    double v19 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithMKCoordinate:", v18.latitude, v18.longitude);
    [v2 setObject:v19 forKey:@"MKLaunchOptionsMapCenter"];
  }
  if ([v8 hasLatitudeDelta] && objc_msgSend(v8, "hasLongitudeDelta"))
  {
    [v8 latitudeDelta];
    double v21 = v20;
    [v8 longitudeDelta];
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithMKCoordinateSpan:", v21, v22);
    uint64_t v9 = (MKMapCamera *)objc_claimAutoreleasedReturnValue();
    double v14 = &MKLaunchOptionsMapSpanKey;
    goto LABEL_19;
  }
LABEL_20:

LABEL_28:
  if ([a1 hasEnableTraffic])
  {
    v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "enableTraffic"));
    [v2 setObject:v23 forKey:@"MKLaunchOptionsShowsTraffic"];
  }
  if ([a1 hasReferralIdentifier])
  {
    v24 = [a1 referralIdentifier];
    [v2 setObject:v24 forKey:@"MKLaunchOptionsReferralIdentifierKey"];
  }
  if ([a1 hasRouteHandle])
  {
    v25 = [a1 routeHandle];
    [v2 setObject:v25 forKey:@"MKLaunchOptionsRouteHandle"];
  }
  if ([a1 hasTimePoint])
  {
    v26 = [a1 timePoint];
    [v2 setObject:v26 forKey:@"MKLaunchOptionsTimePointKey"];
  }
  if ([a1 hasConnectedToCar])
  {
    v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "connectedToCar"));
    [v2 setObject:v27 forKey:@"MKLaunchOptionsConnectedToCarKey"];
  }
LABEL_38:

  return v2;
}

@end