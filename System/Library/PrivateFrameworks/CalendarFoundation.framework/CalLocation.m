@interface CalLocation
+ (BOOL)supportsSecureCoding;
+ (id)coordinatesFromGeoURLString:(id)a3;
+ (id)displayStringForAddress:(id)a3 withoutTitle:(id)a4;
+ (id)fullDisplayStringWithTitle:(id)a3 address:(id)a4;
+ (id)geoURLStringFromCoordinates:(id)a3;
+ (id)routeTypeStringForCalLocationRoutingMode:(int64_t)a3;
+ (int64_t)routingModeEnumForCalRouteType:(id)a3;
- (BOOL)isCurrentLocation;
- (BOOL)isEqual:(id)a3;
- (CLLocation)location;
- (CLPlacemark)placemark;
- (CalLocation)initWithCoder:(id)a3;
- (NSData)mapKitHandle;
- (NSString)abURLString;
- (NSString)address;
- (NSString)displayName;
- (NSString)routeType;
- (NSString)title;
- (double)distanceFromLocation:(id)a3;
- (double)radius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)displayString;
- (id)fullTitleAndAddressString;
- (id)geoURLString;
- (id)typeString;
- (int)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAbURLString:(id)a3;
- (void)setAddress:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMapKitHandle:(id)a3;
- (void)setPlacemark:(id)a3;
- (void)setRadius:(double)a3;
- (void)setRouteType:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(int)a3;
@end

@implementation CalLocation

+ (id)fullDisplayStringWithTitle:(id)a3 address:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[v6 mutableCopy];
  if (!v8)
  {
    v8 = [MEMORY[0x1E4F28E78] string];
  }
  if ([v7 length])
  {
    if (![v6 length])
    {
      v9 = v7;
      goto LABEL_8;
    }
    v9 = [a1 displayStringForAddress:v7 withoutTitle:v6];

    if ([v9 length])
    {
      [v8 appendString:@"\n"];
      id v7 = v9;
LABEL_8:
      [v8 appendString:v9];
      goto LABEL_10;
    }
    id v7 = v9;
  }
LABEL_10:

  return v8;
}

- (void)setTitle:(id)a3
{
}

- (void)setAddress:(id)a3
{
}

- (void)setLocation:(id)a3
{
  v5 = (CLLocation *)a3;
  location = self->_location;
  p_location = &self->_location;
  if (location != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_location, a3);
    v5 = v8;
  }
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (void)setMapKitHandle:(id)a3
{
}

- (CLLocation)location
{
  location = self->_location;
  if (location)
  {
    v3 = location;
  }
  else
  {
    uint64_t v5 = [(CalLocation *)self placemark];
    if (!v5) {
      goto LABEL_6;
    }
    id v6 = (void *)v5;
    id v7 = [(CalLocation *)self placemark];
    v8 = [v7 location];

    if (v8)
    {
      v9 = [(CalLocation *)self placemark];
      v3 = [v9 location];
    }
    else
    {
LABEL_6:
      v3 = 0;
    }
  }

  return v3;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  v4 = [(CalLocation *)self location];

  if (v4)
  {
    [v14 encodeBool:1 forKey:@"hasValidLocation"];
    uint64_t v5 = [(CalLocation *)self location];
    [v5 coordinate];
    objc_msgSend(v14, "encodeDouble:forKey:", @"latitude");

    id v6 = [(CalLocation *)self location];
    [v6 coordinate];
    [v14 encodeDouble:@"longitude" forKey:v7];
  }
  objc_msgSend(v14, "encodeInteger:forKey:", -[CalLocation type](self, "type"), @"type");
  v8 = [(CalLocation *)self address];
  [v14 encodeObject:v8 forKey:@"address"];

  v9 = [(CalLocation *)self title];
  [v14 encodeObject:v9 forKey:@"title"];

  v10 = [(CalLocation *)self abURLString];
  [v14 encodeObject:v10 forKey:@"abURLString"];

  v11 = [(CalLocation *)self displayName];
  [v14 encodeObject:v11 forKey:@"displayName"];

  [(CalLocation *)self radius];
  objc_msgSend(v14, "encodeDouble:forKey:", @"radius");
  v12 = [(CalLocation *)self routeType];
  [v14 encodeObject:v12 forKey:@"routeType"];

  v13 = [(CalLocation *)self mapKitHandle];
  [v14 encodeObject:v13 forKey:@"mapKitHandle"];
}

- (CLPlacemark)placemark
{
  return (CLPlacemark *)objc_getProperty(self, a2, 48, 1);
}

- (int)type
{
  return self->_type;
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)abURLString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (double)radius
{
  double radius = self->_radius;
  float v3 = radius;
  if (fabsf(v3) < 0.00000011921)
  {
    v4 = [(CalLocation *)self placemark];
    uint64_t v5 = [v4 region];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v5)
    {
      [v5 radius];
      double radius = v6;
    }
  }
  return radius;
}

- (NSString)routeType
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSData)mapKitHandle
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeType, 0);
  objc_storeStrong((id *)&self->_mapKitHandle, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_abURLString, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_address, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CalLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CalLocation;
  uint64_t v5 = [(CalLocation *)&v31 init];
  if (v5)
  {
    if ([v4 decodeBoolForKey:@"hasValidLocation"])
    {
      [v4 decodeDoubleForKey:@"longitude"];
      double v7 = v6;
      [v4 decodeDoubleForKey:@"latitude"];
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v8 longitude:v7];
      location = v5->_location;
      v5->_location = (CLLocation *)v9;
    }
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
    uint64_t v12 = [v11 copy];
    address = v5->_address;
    v5->_address = (NSString *)v12;

    id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    uint64_t v15 = [v14 copy];
    title = v5->_title;
    v5->_title = (NSString *)v15;

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"abURLString"];
    uint64_t v18 = [v17 copy];
    abURLString = v5->_abURLString;
    v5->_abURLString = (NSString *)v18;

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    uint64_t v21 = [v20 copy];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v21;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
    [v4 decodeDoubleForKey:@"radius"];
    v5->_double radius = v23;
    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"routeType"];
    uint64_t v25 = [v24 copy];
    routeType = v5->_routeType;
    v5->_routeType = (NSString *)v25;

    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mapKitHandle"];
    uint64_t v28 = [v27 copy];
    mapKitHandle = v5->_mapKitHandle;
    v5->_mapKitHandle = (NSData *)v28;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CalLocation);
  uint64_t v5 = [(CalLocation *)self location];
  [(CalLocation *)v4 setLocation:v5];

  double v6 = [(CalLocation *)self address];
  [(CalLocation *)v4 setAddress:v6];

  double v7 = [(CalLocation *)self title];
  [(CalLocation *)v4 setTitle:v7];

  double v8 = [(CalLocation *)self displayName];
  [(CalLocation *)v4 setDisplayName:v8];

  uint64_t v9 = [(CalLocation *)self abURLString];
  [(CalLocation *)v4 setAbURLString:v9];

  [(CalLocation *)v4 setType:[(CalLocation *)self type]];
  [(CalLocation *)self radius];
  -[CalLocation setRadius:](v4, "setRadius:");
  v10 = [(CalLocation *)self routeType];
  [(CalLocation *)v4 setRouteType:v10];

  v11 = [(CalLocation *)self mapKitHandle];
  [(CalLocation *)v4 setMapKitHandle:v11];

  return v4;
}

- (void)setDisplayName:(id)a3
{
}

- (void)setAbURLString:(id)a3
{
}

- (void)setRouteType:(id)a3
{
}

- (id)description
{
  float v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  double v6 = [v3 stringWithFormat:@"<%@ %p>", v5, self];

  double v7 = [(CalLocation *)self displayName];
  [v6 appendFormat:@"\n\tdisplayName: %@", v7];

  double v8 = [(CalLocation *)self title];
  [v6 appendFormat:@"\n\ttitle: %@", v8];

  uint64_t v9 = [(CalLocation *)self address];
  [v6 appendFormat:@"\n\taddress: %@", v9];

  v10 = [(CalLocation *)self location];
  [v6 appendFormat:@"\n\tlocation: %@", v10];

  v11 = [(CalLocation *)self typeString];
  [v6 appendFormat:@"\n\ttype: %@", v11];

  uint64_t v12 = [(CalLocation *)self geoURLString];
  [v6 appendFormat:@"\n\tgeoURLString: %@", v12];

  v13 = [(CalLocation *)self abURLString];
  [v6 appendFormat:@"\n\tabURLString: %@", v13];

  objc_msgSend(v6, "appendFormat:", @"\n\tisCurrentLocation: %d", -[CalLocation isCurrentLocation](self, "isCurrentLocation"));
  [(CalLocation *)self radius];
  objc_msgSend(v6, "appendFormat:", @"\n\tradius: %f", v14);

  return v6;
}

- (id)typeString
{
  unsigned int v2 = [(CalLocation *)self type];
  if (v2 > 8) {
    return &stru_1EE0C39E0;
  }
  else {
    return off_1E56CED28[v2];
  }
}

- (id)geoURLString
{
  float v3 = [(CalLocation *)self location];

  if (v3)
  {
    float v3 = [(CalLocation *)self location];
  }
  uint64_t v4 = [(CalLocation *)self placemark];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    double v6 = [(CalLocation *)self placemark];
    double v7 = [v6 location];

    if (v7)
    {
      double v8 = [(CalLocation *)self placemark];
      uint64_t v9 = [v8 location];

      float v3 = (void *)v9;
    }
  }
  v10 = [(id)objc_opt_class() geoURLStringFromCoordinates:v3];

  return v10;
}

+ (id)geoURLStringFromCoordinates:(id)a3
{
  if (a3)
  {
    uint64_t v4 = NSString;
    id v5 = a3;
    [v5 coordinate];
    uint64_t v7 = v6;
    [v5 coordinate];
    uint64_t v9 = v8;

    v10 = objc_msgSend(v4, "stringWithFormat:", @"geo:%f,%f", v7, v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (BOOL)isCurrentLocation
{
  return self->_type == 2;
}

- (id)displayString
{
  uint64_t v3 = [(CalLocation *)self displayName];

  if (v3)
  {
    uint64_t v4 = [(CalLocation *)self displayName];
  }
  else
  {
    id v5 = [(CalLocation *)self title];

    if (v5)
    {
      uint64_t v4 = [(CalLocation *)self title];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }

  return v4;
}

- (void)setPlacemark:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (CalLocation *)a3;
  if (self == v5)
  {
    LOBYTE(v7) = 1;
    goto LABEL_39;
  }
  uint64_t v6 = objc_opt_class();
  if (v6 != objc_opt_class())
  {
    LOBYTE(v7) = 0;
    goto LABEL_39;
  }
  uint64_t v8 = [(CalLocation *)self address];
  if (!v8)
  {
    uint64_t v3 = [(CalLocation *)v5 address];
    if (!v3)
    {
      int v11 = 1;
LABEL_10:

      goto LABEL_11;
    }
  }
  uint64_t v9 = [(CalLocation *)self address];
  v10 = [(CalLocation *)v5 address];
  int v11 = [v9 isEqual:v10];

  if (!v8) {
    goto LABEL_10;
  }
LABEL_11:

  uint64_t v12 = [(CalLocation *)self title];
  if (!v12)
  {
    uint64_t v3 = [(CalLocation *)v5 title];
    if (!v3) {
      goto LABEL_14;
    }
  }
  v13 = [(CalLocation *)self title];
  uint64_t v14 = [(CalLocation *)v5 title];
  v11 &= [v13 isEqual:v14];

  if (!v12) {
LABEL_14:
  }

  uint64_t v15 = [(CalLocation *)self displayName];
  if (!v15)
  {
    uint64_t v3 = [(CalLocation *)v5 displayName];
    if (!v3) {
      goto LABEL_18;
    }
  }
  v16 = [(CalLocation *)self displayName];
  v17 = [(CalLocation *)v5 displayName];
  v11 &= [v16 isEqual:v17];

  if (!v15) {
LABEL_18:
  }

  uint64_t v18 = [(CalLocation *)self abURLString];
  if (!v18)
  {
    uint64_t v3 = [(CalLocation *)v5 abURLString];
    if (!v3) {
      goto LABEL_22;
    }
  }
  v19 = [(CalLocation *)self abURLString];
  v20 = [(CalLocation *)v5 abURLString];
  v11 &= [v19 isEqual:v20];

  if (!v18) {
LABEL_22:
  }

  uint64_t v21 = [(CalLocation *)self placemark];
  if (!v21)
  {
    uint64_t v3 = [(CalLocation *)v5 placemark];
    if (!v3) {
      goto LABEL_26;
    }
  }
  v22 = [(CalLocation *)self placemark];
  double v23 = [(CalLocation *)v5 placemark];
  v11 &= [v22 isEqual:v23];

  if (!v21) {
LABEL_26:
  }

  int v24 = [(CalLocation *)self type];
  if (v24 != [(CalLocation *)v5 type]) {
    int v11 = 0;
  }
  [(CalLocation *)self radius];
  double v26 = v25;
  [(CalLocation *)v5 radius];
  if (vabdd_f64(v26, v27) < 2.22044605e-16) {
    int v28 = v11;
  }
  else {
    int v28 = 0;
  }
  v29 = [(CalLocation *)self routeType];
  v30 = [(CalLocation *)v5 routeType];
  if (v29 != v30) {
    int v28 = 0;
  }

  BOOL v31 = [(CalLocation *)self isCurrentLocation];
  int v7 = v28 & (v31 ^ [(CalLocation *)v5 isCurrentLocation] ^ 1);
  v32 = [(CalLocation *)self mapKitHandle];
  if (!v32)
  {
    uint64_t v3 = [(CalLocation *)v5 mapKitHandle];
    if (!v3) {
      goto LABEL_37;
    }
  }
  v33 = [(CalLocation *)self mapKitHandle];
  v34 = [(CalLocation *)v5 mapKitHandle];
  v7 &= [v33 isEqual:v34];

  if (!v32) {
LABEL_37:
  }

LABEL_39:
  return v7;
}

- (double)distanceFromLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(CalLocation *)self location];
  uint64_t v6 = [v4 location];

  [v5 distanceFromLocation:v6];
  double v8 = v7;

  return v8;
}

- (id)fullTitleAndAddressString
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(CalLocation *)self title];
  id v5 = [(CalLocation *)self address];
  uint64_t v6 = [v3 fullDisplayStringWithTitle:v4 address:v5];

  return v6;
}

+ (id)coordinatesFromGeoURLString:(id)a3
{
  if (a3)
  {
    double v13 = 0.0;
    double v14 = 0.0;
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28FE8], "scannerWithString:");
    int v4 = [v3 scanString:@"geo:" intoString:0];
    int v5 = [v3 scanDouble:&v14];
    int v6 = [v3 scanString:@"," intoString:0];
    double v7 = 0;
    if ([v3 scanDouble:&v13]) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8 && v5 != 0 && v4 != 0)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      double v7 = (void *)[v11 initWithLatitude:v14 longitude:v13];
    }
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

+ (id)displayStringForAddress:(id)a3 withoutTitle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 hasPrefix:v6])
  {
    double v7 = [v5 stringByReplacingOccurrencesOfString:v6 withString:&stru_1EE0C39E0];

    BOOL v8 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    uint64_t v9 = [v7 stringByTrimmingCharactersInSet:v8];

    v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v5 = [v9 stringByTrimmingCharactersInSet:v10];
  }

  return v5;
}

+ (id)routeTypeStringForCalLocationRoutingMode:(int64_t)a3
{
  int64_t v4 = a3 + 1;
  if (unint64_t)(a3 + 1) <= 5 && ((0x3Du >> v4))
  {
    id v5 = (id)*off_1E56CED70[v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (int64_t)routingModeEnumForCalRouteType:(id)a3
{
  id v3 = a3;
  int64_t v4 = v3;
  if (v3 && [v3 length])
  {
    if ([v4 isEqualToString:CalRouteType_Driving])
    {
      int64_t v5 = 1;
    }
    else if ([v4 isEqualToString:CalRouteType_Walking])
    {
      int64_t v5 = 2;
    }
    else if ([v4 isEqualToString:CalRouteType_Transit])
    {
      int64_t v5 = 3;
    }
    else if ([v4 isEqualToString:CalRouteType_Bicycle])
    {
      int64_t v5 = 4;
    }
    else
    {
      int64_t v5 = -1;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

@end