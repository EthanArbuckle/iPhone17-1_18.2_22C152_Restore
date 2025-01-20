@interface FMFLocation
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)hasKnownLocation;
- (BOOL)isBorderEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocatingInProgress;
- (BOOL)isMoreRecentThan:(id)a3;
- (BOOL)isThisDevice;
- (BOOL)isValid;
- (CLLocation)location;
- (CLLocationCoordinate2D)coordinate;
- (FMAccuracyOverlay)overlay;
- (FMFHandle)handle;
- (FMFLocation)initWithCoder:(id)a3;
- (FMFLocation)initWithDictionary:(id)a3 forHandle:(id)a4 maxLocatingInterval:(double)a5 TTL:(double)a6;
- (FMFLocation)initWithHandle:(id)a3 locationType:(int64_t)a4 location:(id)a5 activityState:(int64_t)a6 label:(id)a7 locatingInProgress:(BOOL)a8 shortAddress:(id)a9 longAddress:(id)a10 placemark:(id)a11;
- (FMFLocation)initWithLatitude:(double)a3 longitude:(double)a4;
- (FMFPlacemark)placemark;
- (NSDate)timestamp;
- (NSString)age;
- (NSString)description;
- (NSString)distanceDescription;
- (NSString)label;
- (NSString)longAddress;
- (NSString)shortAddress;
- (NSString)shortAddressString;
- (NSString)title;
- (UIColor)tintColor;
- (UIImage)largeAnnotationIcon;
- (UIImage)largeOverlayIcon;
- (UIImage)smallAnnotationIcon;
- (UIImage)smallOverlayIcon;
- (double)TTL;
- (double)distance;
- (double)distanceFromUser;
- (double)horizontalAccuracy;
- (double)maxLocatingInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)locationAge;
- (id)locationShortAddressWithAge;
- (id)locationShortAddressWithAgeIncludeLocating;
- (int64_t)activityState;
- (int64_t)distanceThenNameCompare:(id)a3;
- (int64_t)locationType;
- (unint64_t)hash;
- (void)_updateLocation:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)resetLocateInProgress:(id)a3;
- (void)resetLocateInProgressTimer;
- (void)setActivityState:(int64_t)a3;
- (void)setAge:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setDistance:(double)a3;
- (void)setDistanceDescription:(id)a3;
- (void)setDistanceFromUser:(double)a3;
- (void)setHandle:(id)a3;
- (void)setHorizontalAccuracy:(double)a3;
- (void)setIsBorderEnabled:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLargeAnnotationIcon:(id)a3;
- (void)setLargeOverlayIcon:(id)a3;
- (void)setLocatingInProgress:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setLocationType:(int64_t)a3;
- (void)setLongAddress:(id)a3;
- (void)setMaxLocatingInterval:(double)a3;
- (void)setOverlay:(id)a3;
- (void)setPlacemark:(id)a3;
- (void)setShortAddressString:(id)a3;
- (void)setSmallAnnotationIcon:(id)a3;
- (void)setSmallOverlayIcon:(id)a3;
- (void)setTTL:(double)a3;
- (void)setTimestamp:(id)a3;
- (void)setTintColor:(id)a3;
- (void)updateHandle:(id)a3;
- (void)updateLocation:(id)a3;
- (void)updateLocationForCache:(id)a3;
@end

@implementation FMFLocation

- (FMFLocation)initWithDictionary:(id)a3 forHandle:(id)a4 maxLocatingInterval:(double)a5 TTL:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (FMFLocation *)objc_alloc_init((Class)objc_opt_class());
  [(FMFLocation *)v12 setHandle:v11];

  [(FMFLocation *)v12 setMaxLocatingInterval:a5];
  [(FMFLocation *)v12 setTTL:a6];
  v13 = [v10 objectForKeyedSubscript:@"location"];
  uint64_t v14 = [MEMORY[0x263EFF9D0] null];
  if (v13 == (void *)v14)
  {

    goto LABEL_6;
  }
  v15 = (void *)v14;
  v16 = [v10 objectForKeyedSubscript:@"location"];

  if (!v16)
  {
LABEL_6:
    [(FMFLocation *)v12 setLocation:0];
    goto LABEL_61;
  }
  v17 = [v16 objectForKey:@"timestamp"];
  v18 = (void *)MEMORY[0x263EFF910];
  v87 = v17;
  [v17 doubleValue];
  v92 = [v18 dateWithTimeIntervalSince1970:v19 / 1000.0];
  -[FMFLocation setTimestamp:](v12, "setTimestamp:");
  v20 = [v16 objectForKeyedSubscript:@"latitude"];
  v21 = [MEMORY[0x263EFF9D0] null];
  if (v20 == v21)
  {
    v22 = 0;
  }
  else
  {
    v22 = [v16 objectForKeyedSubscript:@"latitude"];
  }

  v23 = [v16 objectForKeyedSubscript:@"longitude"];
  v24 = [MEMORY[0x263EFF9D0] null];
  if (v23 == v24)
  {
    v94 = 0;
  }
  else
  {
    v94 = [v16 objectForKeyedSubscript:@"longitude"];
  }

  v25 = [v16 objectForKeyedSubscript:@"horizontalAccuracy"];
  v26 = [MEMORY[0x263EFF9D0] null];
  if (v25 == v26)
  {
    v27 = 0;
  }
  else
  {
    v27 = [v16 objectForKeyedSubscript:@"horizontalAccuracy"];
  }

  v28 = NSNumber;
  v29 = (void *)MEMORY[0x263EFF910];
  v30 = [v16 objectForKeyedSubscript:@"timestamp"];
  [v30 doubleValue];
  v32 = [v29 dateWithTimeIntervalSince1970:v31 / 1000.0];
  [v32 timeIntervalSinceReferenceDate];
  v33 = objc_msgSend(v28, "numberWithDouble:");

  [v22 doubleValue];
  double v35 = v34;
  [v94 doubleValue];
  double v37 = v36;
  [(FMFLocation *)v12 setLocationType:0];
  id v38 = objc_alloc(MEMORY[0x263F00A50]);
  v93 = v27;
  [v27 doubleValue];
  double v40 = v39;
  v41 = (void *)MEMORY[0x263EFF910];
  v91 = v33;
  [v33 doubleValue];
  v42 = objc_msgSend(v41, "dateWithTimeIntervalSinceReferenceDate:");
  v43 = objc_msgSend(v38, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:speed:timestamp:", v42, v35, v37, 0.0, v40, 0.0, -1.0, 0.0);
  [(FMFLocation *)v12 setLocation:v43];

  [(FMFLocation *)v12 setActivityState:0];
  v44 = [(FMFLocation *)v12 location];
  [v44 coordinate];
  -[FMFLocation setCoordinate:](v12, "setCoordinate:");

  v45 = [v16 objectForKeyedSubscript:@"address"];
  unint64_t v46 = 0x263EFF000uLL;
  uint64_t v47 = [MEMORY[0x263EFF9D0] null];
  v88 = v22;
  if (v45 == (void *)v47)
  {

    v53 = 0;
    uint64_t v54 = 0;
    v49 = 0;
LABEL_20:
    char v86 = 1;
    goto LABEL_21;
  }
  v48 = (void *)v47;
  v49 = [v16 objectForKeyedSubscript:@"address"];

  if (!v49)
  {
    v53 = 0;
    uint64_t v54 = 0;
    goto LABEL_20;
  }
  v50 = [v49 objectForKeyedSubscript:@"locality"];
  v51 = [MEMORY[0x263EFF9D0] null];
  if (v50 == v51)
  {
    v52 = 0;
  }
  else
  {
    v52 = [v49 objectForKeyedSubscript:@"locality"];
  }

  v55 = [v49 objectForKeyedSubscript:@"stateCode"];
  v56 = [MEMORY[0x263EFF9D0] null];
  if (v55 == v56)
  {
    uint64_t v54 = 0;
  }
  else
  {
    uint64_t v54 = [v49 objectForKeyedSubscript:@"stateCode"];
  }

  v57 = [v49 objectForKeyedSubscript:@"administrativeArea"];
  v58 = [MEMORY[0x263EFF9D0] null];
  v84 = self;
  if (v57 == v58)
  {
    v89 = 0;
  }
  else
  {
    v89 = [v49 objectForKeyedSubscript:@"administrativeArea"];
  }

  v59 = [v49 objectForKeyedSubscript:@"formattedAddressLines"];
  v60 = [MEMORY[0x263EFF9D0] null];
  if (v59 == v60)
  {
    v53 = 0;
  }
  else
  {
    v53 = [v49 objectForKeyedSubscript:@"formattedAddressLines"];
  }

  if (v52 && v54)
  {
    v61 = NSString;
    v62 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v62 localizedStringForKey:@"CITY_STATE_LABEL" value:&stru_26BEE3E40 table:0];
    v64 = uint64_t v63 = v54;
    v65 = objc_msgSend(v61, "stringWithFormat:", v64, v52, v63);
    [(FMFLocation *)v12 setShortAddressString:v65];

    uint64_t v54 = v63;
    unint64_t v46 = 0x263EFF000;

    char v86 = 0;
    self = v84;
    goto LABEL_40;
  }
  self = v84;
  if (!v52)
  {
    if (v89)
    {
      [(FMFLocation *)v12 setShortAddressString:v89];

      goto LABEL_39;
    }
    char v86 = 0;
LABEL_21:
    [(FMFLocation *)v12 setShortAddressString:v54];
    goto LABEL_40;
  }
  [(FMFLocation *)v12 setShortAddressString:v52];

LABEL_39:
  char v86 = 0;
LABEL_40:
  v90 = (void *)v54;
  if (v53)
  {
    v66 = [v53 componentsJoinedByString:@"\n"];
    [(FMFLocation *)v12 setLongAddress:v66];
  }
  v67 = [v16 objectForKeyedSubscript:@"labels"];
  uint64_t v68 = [*(id *)(v46 + 2512) null];
  if (v67 == (void *)v68)
  {

    v70 = 0;
    goto LABEL_50;
  }
  v69 = (void *)v68;
  v70 = [v16 objectForKeyedSubscript:@"labels"];

  if (!v70)
  {
LABEL_50:
    v76 = v87;
    v80 = v88;
    goto LABEL_51;
  }
  if ([v70 count])
  {
    v85 = self;
    v71 = [v70 firstObject];
    v72 = [v71 objectForKeyedSubscript:@"label"];
    uint64_t v73 = [*(id *)(v46 + 2512) null];
    if (v72 == (void *)v73)
    {

      v76 = v87;
      v77 = v93;
    }
    else
    {
      v74 = (void *)v73;
      uint64_t v75 = [v71 objectForKeyedSubscript:@"label"];

      v72 = (void *)v75;
      v76 = v87;
      v77 = v93;
      if (!v72)
      {
LABEL_57:

        self = v85;
        v80 = v88;
        goto LABEL_58;
      }
      if (+[FMFLabelUtil isDefaultLabel:v72])
      {
        v78 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        [v78 localizedStringForKey:v72 value:&stru_26BEE3E40 table:0];
        v79 = v83 = v72;
        [(FMFLocation *)v12 setLabel:v79];

        v77 = v93;
        v72 = v83;
      }
      else
      {
        [(FMFLocation *)v12 setLabel:v72];
      }
    }

    goto LABEL_57;
  }
  v76 = v87;
  v80 = v88;
  if (![v70 count]) {
    [(FMFLocation *)v12 setLabel:0];
  }
LABEL_51:
  v77 = v93;
LABEL_58:
  if ((v86 & 1) == 0)
  {
    v81 = [[FMFPlacemark alloc] initWithDictionary:v49];
    [(FMFLocation *)v12 setPlacemark:v81];

    v77 = v93;
  }

LABEL_61:
  return v12;
}

- (FMFLocation)initWithLatitude:(double)a3 longitude:(double)a4
{
  v7 = (FMFLocation *)objc_alloc_init((Class)objc_opt_class());
  v8 = (void *)[objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:a3 longitude:a4];
  [(FMFLocation *)v7 setLocationType:0];
  [(FMFLocation *)v7 setLocation:v8];
  [(FMFLocation *)v7 setActivityState:0];
  [v8 coordinate];
  -[FMFLocation setCoordinate:](v7, "setCoordinate:");

  return v7;
}

- (FMFLocation)initWithHandle:(id)a3 locationType:(int64_t)a4 location:(id)a5 activityState:(int64_t)a6 label:(id)a7 locatingInProgress:(BOOL)a8 shortAddress:(id)a9 longAddress:(id)a10 placemark:(id)a11
{
  BOOL v11 = a8;
  id v30 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a7;
  id v21 = a5;
  id v22 = a3;
  v23 = (FMFLocation *)objc_alloc_init((Class)objc_opt_class());
  [(FMFLocation *)v23 setHandle:v22];

  [(FMFLocation *)v23 setLocationType:a4];
  [(FMFLocation *)v23 setLocation:v21];
  [(FMFLocation *)v23 setActivityState:a6];
  [(FMFLocation *)v23 setLabel:v20];

  [(FMFLocation *)v23 setLocatingInProgress:v11];
  [(FMFLocation *)v23 setShortAddressString:v19];

  [(FMFLocation *)v23 setLongAddress:v18];
  v24 = [v21 timestamp];
  [(FMFLocation *)v23 setTimestamp:v24];

  [(FMFLocation *)v23 setMaxLocatingInterval:3.40282347e38];
  [(FMFLocation *)v23 setTTL:3.40282347e38];
  [(FMFLocation *)v23 setDistance:3.40282347e38];
  [(FMFLocation *)v23 setDistanceDescription:0];
  [(FMFLocation *)v23 setAge:0];
  [v21 coordinate];
  double v26 = v25;
  double v28 = v27;

  -[FMFLocation setCoordinate:](v23, "setCoordinate:", v26, v28);
  [(FMFLocation *)v23 setPlacemark:v30];

  return v23;
}

- (NSString)description
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = +[FMFLocationDateFormatter sharedInstance];
  v51 = [(FMFLocation *)v2 handle];
  if ([(FMFLocation *)v2 locationType])
  {
    if ([(FMFLocation *)v2 locationType] == 2)
    {
      v4 = @"live";
    }
    else
    {
      uint64_t v6 = [(FMFLocation *)v2 locationType];
      v4 = @"shallow";
      if (v6 == 3) {
        v4 = @"stewie";
      }
    }
  }
  else
  {
    BOOL v5 = [(FMFLocation *)v2 isLocatingInProgress];
    v4 = @"legacy";
    if (v5) {
      v4 = @"legacy in progress";
    }
  }
  v50 = v4;
  v7 = [(FMFLocation *)v2 timestamp];
  uint64_t v47 = v3;
  if (v7)
  {
    v8 = [(FMFLocation *)v2 timestamp];
    v49 = [v3 stringFromDate:v8];
  }
  else
  {
    v49 = &stru_26BEE3E40;
  }

  v9 = (void *)0x263F08000;
  id v10 = NSString;
  [(FMFLocation *)v2 coordinate];
  uint64_t v12 = v11;
  [(FMFLocation *)v2 coordinate];
  v52 = objc_msgSend(v10, "stringWithFormat:", @"%01.6lf°,%01.6lf°", v12, v13);
  uint64_t v14 = [(FMFLocation *)v2 location];
  [v14 coordinate];
  double v16 = v15;
  [(FMFLocation *)v2 coordinate];
  if (v16 != v17)
  {

    goto LABEL_16;
  }
  id v18 = [(FMFLocation *)v2 location];
  [v18 coordinate];
  double v20 = v19;
  [(FMFLocation *)v2 coordinate];
  double v22 = v21;

  if (v20 != v22)
  {
LABEL_16:
    v23 = NSString;
    [(FMFLocation *)v2 coordinate];
    uint64_t v25 = v24;
    [(FMFLocation *)v2 coordinate];
    uint64_t v27 = v26;
    double v28 = [(FMFLocation *)v2 location];
    [v28 coordinate];
    uint64_t v30 = v29;
    v3 = [(FMFLocation *)v2 location];
    [v3 coordinate];
    uint64_t v32 = objc_msgSend(v23, "stringWithFormat:", @"%01.6lf°,%01.6lf°/%01.6lf°,%01.6lf°", v25, v27, v30, v31);

    v52 = (void *)v32;
  }
  v33 = NSString;
  double v34 = (objc_class *)objc_opt_class();
  v48 = NSStringFromClass(v34);
  double v35 = [(FMFLocation *)v2 label];
  if (v35)
  {
    double v36 = NSString;
    unint64_t v46 = [(FMFLocation *)v2 label];
    double v37 = [v36 stringWithFormat:@" - labl: '%@'", v46];
  }
  else
  {
    double v37 = &stru_26BEE3E40;
  }
  id v38 = [(FMFLocation *)v2 shortAddressString];
  if (v38)
  {
    double v39 = NSString;
    v3 = [(FMFLocation *)v2 shortAddressString];
    double v40 = [v39 stringWithFormat:@" - sadr: '%@'", v3];
  }
  else
  {
    double v40 = &stru_26BEE3E40;
  }
  v41 = [(FMFLocation *)v2 longAddress];
  if (v41)
  {
    v42 = NSString;
    v9 = [(FMFLocation *)v2 longAddress];
    v43 = [v42 stringWithFormat:@" - ladr: '%@'", v9];
  }
  else
  {
    v43 = &stru_26BEE3E40;
  }
  v44 = [v33 stringWithFormat:@"%@(0x%lx): %@ - %@: {%@@%@}%@%@%@", v48, v2, v51, v50, v52, v49, v37, v40, v43];
  if (v41)
  {
  }
  if (v38)
  {
  }
  if (v35)
  {
  }
  objc_sync_exit(v2);

  return (NSString *)v44;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  BOOL v5 = [(FMFLocation *)self handle];
  [v4 setHandle:v5];

  objc_msgSend(v4, "setLocationType:", -[FMFLocation locationType](self, "locationType"));
  uint64_t v6 = [(FMFLocation *)self location];
  [v4 setLocation:v6];

  objc_msgSend(v4, "setActivityState:", -[FMFLocation activityState](self, "activityState"));
  v7 = [(FMFLocation *)self label];
  [v4 setLabel:v7];

  v8 = [(FMFLocation *)self shortAddressString];
  [v4 setShortAddressString:v8];

  v9 = [(FMFLocation *)self longAddress];
  [v4 setLongAddress:v9];

  id v10 = [(FMFLocation *)self timestamp];
  [v4 setTimestamp:v10];

  objc_msgSend(v4, "setLocatingInProgress:", -[FMFLocation isLocatingInProgress](self, "isLocatingInProgress"));
  [(FMFLocation *)self maxLocatingInterval];
  objc_msgSend(v4, "setMaxLocatingInterval:");
  [(FMFLocation *)self TTL];
  objc_msgSend(v4, "setTTL:");
  uint64_t v11 = [(FMFLocation *)self placemark];
  [v4 setPlacemark:v11];

  uint64_t v12 = [v4 location];
  [v12 coordinate];
  objc_msgSend(v4, "setCoordinate:");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(FMFLocation *)self handle];
    v7 = [v6 serverId];
    v8 = [v5 handle];

    v9 = [v8 serverId];
    char v10 = [v7 isEqualToString:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(FMFLocation *)self handle];
  v3 = [v2 serverId];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)hasKnownLocation
{
  return 1;
}

- (BOOL)isThisDevice
{
  return 0;
}

- (BOOL)conformsToProtocol:(id)a3
{
  unint64_t v4 = (Protocol *)a3;
  id v5 = [NSString stringWithUTF8String:protocol_getName(v4)];
  if ([v5 isEqualToString:@"MKAnnotation"])
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)FMFLocation;
    BOOL v6 = [(FMFLocation *)&v8 conformsToProtocol:v4];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  unint64_t v4 = self;
  objc_sync_enter(v4);
  id v5 = [(FMFLocation *)v4 handle];
  [v20 encodeObject:v5 forKey:@"handle"];

  BOOL v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[FMFLocation locationType](v4, "locationType"));
  [v20 encodeObject:v6 forKey:@"locationType"];

  v7 = [(FMFLocation *)v4 location];
  [v20 encodeObject:v7 forKey:@"location"];

  objc_super v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[FMFLocation activityState](v4, "activityState"));
  [v20 encodeObject:v8 forKey:@"activityState"];

  v9 = [(FMFLocation *)v4 label];
  [v20 encodeObject:v9 forKey:@"label"];

  char v10 = [(FMFLocation *)v4 shortAddressString];
  [v20 encodeObject:v10 forKey:@"shortAddressString"];

  uint64_t v11 = [(FMFLocation *)v4 longAddress];
  [v20 encodeObject:v11 forKey:@"longAddress"];

  uint64_t v12 = [(FMFLocation *)v4 timestamp];
  [v20 encodeObject:v12 forKey:@"timestamp"];

  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[FMFLocation isLocatingInProgress](v4, "isLocatingInProgress"));
  [v20 encodeObject:v13 forKey:@"isLocatingInProgress"];

  uint64_t v14 = NSNumber;
  [(FMFLocation *)v4 maxLocatingInterval];
  double v15 = objc_msgSend(v14, "numberWithDouble:");
  [v20 encodeObject:v15 forKey:@"maxLocatingInterval"];

  double v16 = NSNumber;
  [(FMFLocation *)v4 TTL];
  double v17 = objc_msgSend(v16, "numberWithDouble:");
  [v20 encodeObject:v17 forKey:@"TTL"];

  [(FMFLocation *)v4 coordinate];
  objc_msgSend(v20, "encodeDouble:forKey:", @"latitude");
  [(FMFLocation *)v4 coordinate];
  [v20 encodeDouble:@"longitude" forKey:v18];
  double v19 = [(FMFLocation *)v4 placemark];
  [v20 encodeObject:v19 forKey:@"placemark"];

  objc_sync_exit(v4);
}

- (FMFLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (FMFLocation *)objc_alloc_init((Class)objc_opt_class());
  BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
  [(FMFLocation *)v5 setHandle:v6];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placemark"];
  [(FMFLocation *)v5 setPlacemark:v7];

  objc_super v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationType"];
  -[FMFLocation setLocationType:](v5, "setLocationType:", [v8 integerValue]);

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
  [(FMFLocation *)v5 setLocation:v9];

  char v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityState"];
  -[FMFLocation setActivityState:](v5, "setActivityState:", [v10 integerValue]);

  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
  [(FMFLocation *)v5 setLabel:v11];

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortAddressString"];
  [(FMFLocation *)v5 setShortAddressString:v12];

  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"longAddress"];
  [(FMFLocation *)v5 setLongAddress:v13];

  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  [(FMFLocation *)v5 setTimestamp:v14];

  double v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isLocatingInProgress"];
  -[FMFLocation setLocatingInProgress:](v5, "setLocatingInProgress:", [v15 BOOLValue]);

  double v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxLocatingInterval"];
  [v16 doubleValue];
  -[FMFLocation setMaxLocatingInterval:](v5, "setMaxLocatingInterval:");

  double v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TTL"];
  [v17 doubleValue];
  -[FMFLocation setTTL:](v5, "setTTL:");

  [v4 decodeDoubleForKey:@"latitude"];
  CLLocationDegrees v19 = v18;
  [v4 decodeDoubleForKey:@"longitude"];
  CLLocationDegrees v21 = v20;

  CLLocationCoordinate2D v22 = CLLocationCoordinate2DMake(v19, v21);
  -[FMFLocation setCoordinate:](v5, "setCoordinate:", v22.latitude, v22.longitude);

  return v5;
}

- (NSString)shortAddress
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(FMFLocation *)v2 label];
  if ([v3 length]) {
    [(FMFLocation *)v2 label];
  }
  else {
  id v4 = [(FMFLocation *)v2 shortAddressString];
  }

  objc_sync_exit(v2);

  return (NSString *)v4;
}

- (NSString)title
{
  v2 = [(FMFLocation *)self handle];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (id)locationAge
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(FMFLocation *)v2 timestamp];
  [v3 timeIntervalSinceNow];
  if ((int)v4 >= 0) {
    int v5 = (int)v4;
  }
  else {
    int v5 = -(int)v4;
  }
  if ([(FMFLocation *)v2 locationType] == 3)
  {
    BOOL v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"LOCATION_AGE_STEWIE" value:&stru_26BEE3E40 table:@"Localizable-STEWIE"];
LABEL_13:
    uint64_t v13 = (void *)v7;
    goto LABEL_14;
  }
  if ([(FMFLocation *)v2 locationType] == 2)
  {
    BOOL v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"LOCATION_AGE_LIVE" value:&stru_26BEE3E40 table:0];
    goto LABEL_13;
  }
  double v8 = (double)v5 / 60.0;
  if (v8 <= 0.5)
  {
    BOOL v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"LOCATION_AGE_NOW" value:&stru_26BEE3E40 table:0];
    goto LABEL_13;
  }
  if (v8 < 1.0)
  {
    double v15 = NSString;
    BOOL v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v10 = [v6 localizedStringForKey:@"LOCATION_AGE_LESS_THAN_30SECONDS" value:&stru_26BEE3E40 table:0];
    uint64_t v16 = objc_msgSend(v15, "localizedStringWithFormat:", v10, &unk_26BEEAE60);
  }
  else
  {
    if (v8 < 60.0)
    {
      v9 = NSString;
      BOOL v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v10 = [v6 localizedStringForKey:@"LOCATION_AGE_MINUTES" value:&stru_26BEE3E40 table:0];
      uint64_t v11 = [NSNumber numberWithUnsignedInteger:vcvtmd_u64_f64(v8)];
      uint64_t v12 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v11);
LABEL_22:
      uint64_t v13 = (void *)v12;

      goto LABEL_23;
    }
    if (v8 >= 120.0)
    {
      double v18 = NSString;
      BOOL v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v10 = [v6 localizedStringForKey:@"LOCATION_AGE_MORE_THAN_1HR" value:&stru_26BEE3E40 table:0];
      uint64_t v11 = [NSNumber numberWithUnsignedInteger:vcvtmd_u64_f64(v8 / 60.0)];
      uint64_t v12 = objc_msgSend(v18, "localizedStringWithFormat:", v10, v11);
      goto LABEL_22;
    }
    double v17 = NSString;
    BOOL v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v10 = [v6 localizedStringForKey:@"LOCATION_AGE_LESS_THAN_1HR" value:&stru_26BEE3E40 table:0];
    uint64_t v16 = objc_msgSend(v17, "localizedStringWithFormat:", v10, &unk_26BEEAE78);
  }
  uint64_t v13 = (void *)v16;
LABEL_23:

LABEL_14:
  objc_sync_exit(v2);

  return v13;
}

- (id)locationShortAddressWithAge
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(FMFLocation *)v2 shortAddress];
  double v4 = [(FMFLocation *)v2 locationAge];
  if ([v3 length] && objc_msgSend(v4, "length"))
  {
    int v5 = NSString;
    BOOL v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"LOCATION_LABEL_WITH_AGE" value:&stru_26BEE3E40 table:0];
    uint64_t v8 = objc_msgSend(v5, "stringWithFormat:", v7, v3, v4);

    v3 = (void *)v8;
  }

  objc_sync_exit(v2);

  return v3;
}

- (id)locationShortAddressWithAgeIncludeLocating
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(FMFLocation *)v2 isLocatingInProgress])
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = [v3 localizedStringForKey:@"LOCATING" value:&stru_26BEE3E40 table:0];
  }
  else
  {
    v3 = [(FMFLocation *)v2 locationShortAddressWithAge];
    if (![v3 length])
    {
      uint64_t v7 = [(FMFLocation *)v2 location];

      [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      if (v7) {
        uint64_t v8 = {;
      }
        [v8 localizedStringForKey:@"ADDRESS_UNAVAILABLE" value:&stru_26BEE3E40 table:0];
      }
      else {
        uint64_t v8 = {;
      }
        [v8 localizedStringForKey:@"LOCATION_NOT_AVAILABLE" value:&stru_26BEE3E40 table:0];
      int v5 = };

      goto LABEL_6;
    }
    id v4 = v3;
    v3 = v4;
  }
  int v5 = v4;
LABEL_6:

  objc_sync_exit(v2);

  return v5;
}

- (BOOL)isLocatingInProgress
{
  return self->_locatingInProgress;
}

- (void)setLocatingInProgress:(BOOL)a3
{
  int v3 = a3;
  int locatingInProgress = self->_locatingInProgress;
  if (locatingInProgress != a3 && a3) {
    [(FMFLocation *)self resetLocateInProgressTimer];
  }
  self->_int locatingInProgress = v3;
  if (locatingInProgress != v3)
  {
    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 postNotificationName:@"locatingInProgressChanged" object:self];
  }
}

- (void)resetLocateInProgress:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = LogCategory_Daemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [(FMFLocation *)self handle];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_20AD87000, v4, OS_LOG_TYPE_DEFAULT, "resetLocateInProgress_fired: %@", (uint8_t *)&v6, 0xCu);
  }
  [(FMFLocation *)self setLocatingInProgress:0];
}

- (void)resetLocateInProgressTimer
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(FMFLocation *)self maxLocatingInterval];
  if (v3 > 0.0)
  {
    double v4 = v3;
    int v5 = LogCategory_Daemon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(FMFLocation *)self handle];
      *(_DWORD *)buf = 134218498;
      double v11 = v4;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      double v15 = self;
      _os_log_impl(&dword_20AD87000, v5, OS_LOG_TYPE_DEFAULT, "resetLocateInProgressTimerForSeconds: %f forHandle: %@ location: %@", buf, 0x20u);
    }
    objc_initWeak((id *)buf, self);
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__FMFLocation_resetLocateInProgressTimer__block_invoke;
    block[3] = &unk_263FE7508;
    objc_copyWeak(&v9, (id *)buf);
    dispatch_after(v7, MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

void __41__FMFLocation_resetLocateInProgressTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetLocateInProgress:0];
}

- (int64_t)distanceThenNameCompare:(id)a3
{
  id v4 = a3;
  [(FMFLocation *)self distance];
  if (v5 <= 0.0 || ([v4 distance], v6 <= 0.0))
  {
    [(FMFLocation *)self distance];
    if (v17 <= 0.0)
    {
      [v4 distance];
      if (v18 <= 0.0) {
        goto LABEL_11;
      }
LABEL_10:
      int64_t v16 = 1;
      goto LABEL_12;
    }
LABEL_8:
    int64_t v16 = -1;
    goto LABEL_12;
  }
  [(FMFLocation *)self distance];
  double v8 = v7;
  [v4 distance];
  if (v8 < v9) {
    goto LABEL_8;
  }
  [(FMFLocation *)self distance];
  double v11 = v10;
  [v4 distance];
  if (v11 > v12) {
    goto LABEL_10;
  }
  [(FMFLocation *)self distance];
  double v14 = v13;
  [v4 distance];
  if (v14 != v15)
  {
LABEL_11:
    CLLocationDegrees v19 = [(FMFLocation *)self handle];
    double v20 = [v4 handle];
    int64_t v16 = [v19 prettyNameCompare:v20];

    goto LABEL_12;
  }
  int64_t v16 = 0;
LABEL_12:

  return v16;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)_updateLocation:(id)a3
{
  id v4 = a3;
  double v5 = [v4 location];
  [(FMFLocation *)self setLocation:v5];

  -[FMFLocation setLocationType:](self, "setLocationType:", [v4 locationType]);
  double v6 = [v4 label];
  [(FMFLocation *)self setLabel:v6];

  double v7 = [v4 shortAddressString];
  [(FMFLocation *)self setShortAddressString:v7];

  double v8 = [v4 longAddress];
  [(FMFLocation *)self setLongAddress:v8];

  double v9 = [v4 timestamp];
  [(FMFLocation *)self setTimestamp:v9];

  -[FMFLocation setLocatingInProgress:](self, "setLocatingInProgress:", [v4 isLocatingInProgress]);
  id v10 = [v4 placemark];

  [(FMFLocation *)self setPlacemark:v10];
}

- (void)updateLocationForCache:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(FMFLocation *)v4 _updateLocation:v5];
  objc_sync_exit(v4);
}

- (void)updateLocation:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(FMFLocation *)v4 _updateLocation:v5];
  [(CLLocation *)v4->_location coordinate];
  -[FMFLocation setCoordinate:](v4, "setCoordinate:");
  objc_sync_exit(v4);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (void)updateHandle:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(FMFLocation *)v4 setHandle:v5];
  objc_sync_exit(v4);
}

- (BOOL)isValid
{
  uint64_t v3 = [(FMFLocation *)self timestamp];
  if (!v3) {
    return 1;
  }
  id v4 = (void *)v3;
  [(FMFLocation *)self TTL];
  double v6 = v5;

  if (v6 <= 0.0) {
    return 1;
  }
  double v7 = [MEMORY[0x263EFF910] date];
  double v8 = [(FMFLocation *)self timestamp];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  [(FMFLocation *)self TTL];
  return v10 < v11;
}

- (BOOL)isMoreRecentThan:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4
    && ([v4 timestamp], double v6 = objc_claimAutoreleasedReturnValue(), v6, v6)
    && ([(FMFLocation *)self timestamp],
        double v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    double v8 = [(FMFLocation *)self timestamp];
    double v9 = [v5 timestamp];
    BOOL v10 = [v8 compare:v9] != -1;
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(int64_t)a3
{
  self->_locationType = a3;
}

- (int64_t)activityState
{
  return self->_activityState;
}

- (void)setActivityState:(int64_t)a3
{
  self->_activityState = a3;
}

- (FMAccuracyOverlay)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (void)setHorizontalAccuracy:(double)a3
{
  self->_horizontalAccuracy = a3;
}

- (UIImage)smallAnnotationIcon
{
  return self->_smallAnnotationIcon;
}

- (void)setSmallAnnotationIcon:(id)a3
{
}

- (UIImage)smallOverlayIcon
{
  return self->_smallOverlayIcon;
}

- (void)setSmallOverlayIcon:(id)a3
{
}

- (UIImage)largeOverlayIcon
{
  return self->_largeOverlayIcon;
}

- (void)setLargeOverlayIcon:(id)a3
{
}

- (UIImage)largeAnnotationIcon
{
  return self->_largeAnnotationIcon;
}

- (void)setLargeAnnotationIcon:(id)a3
{
}

- (double)distanceFromUser
{
  return self->_distanceFromUser;
}

- (void)setDistanceFromUser:(double)a3
{
  self->_distanceFromUser = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (BOOL)isBorderEnabled
{
  return self->_isBorderEnabled;
}

- (void)setIsBorderEnabled:(BOOL)a3
{
  self->_isBorderEnabled = a3;
}

- (FMFPlacemark)placemark
{
  return self->_placemark;
}

- (void)setPlacemark:(id)a3
{
}

- (FMFHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)longAddress
{
  return self->_longAddress;
}

- (void)setLongAddress:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)shortAddressString
{
  return self->_shortAddressString;
}

- (void)setShortAddressString:(id)a3
{
}

- (double)maxLocatingInterval
{
  return self->_maxLocatingInterval;
}

- (void)setMaxLocatingInterval:(double)a3
{
  self->_maxLocatingInterval = a3;
}

- (double)TTL
{
  return self->_TTL;
}

- (void)setTTL:(double)a3
{
  self->_TTL = a3;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (NSString)distanceDescription
{
  return self->_distanceDescription;
}

- (void)setDistanceDescription:(id)a3
{
}

- (NSString)age
{
  return self->_age;
}

- (void)setAge:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_age, 0);
  objc_storeStrong((id *)&self->_distanceDescription, 0);
  objc_storeStrong((id *)&self->_shortAddressString, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_longAddress, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_largeAnnotationIcon, 0);
  objc_storeStrong((id *)&self->_largeOverlayIcon, 0);
  objc_storeStrong((id *)&self->_smallOverlayIcon, 0);
  objc_storeStrong((id *)&self->_smallAnnotationIcon, 0);
  objc_storeStrong((id *)&self->_overlay, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end