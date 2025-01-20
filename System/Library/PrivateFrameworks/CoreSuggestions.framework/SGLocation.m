@interface SGLocation
+ (BOOL)supportsSecureCoding;
- (BOOL)geocodeIsEnd;
- (BOOL)geocodeIsStart;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLocation:(id)a3;
- (BOOL)isGeocoded;
- (NSData)handle;
- (NSString)address;
- (NSString)airportCode;
- (NSString)description;
- (NSString)label;
- (SGLocation)initWithCoder:(id)a3;
- (SGLocation)initWithId:(id)a3 origin:(id)a4 type:(unint64_t)a5 label:(id)a6 address:(id)a7 airportCode:(id)a8 accuracy:(double)a9 quality:(double)a10;
- (SGLocation)initWithId:(id)a3 origin:(id)a4 type:(unint64_t)a5 label:(id)a6 address:(id)a7 airportCode:(id)a8 latitude:(double)a9 longitude:(double)a10 accuracy:(double)a11 quality:(double)a12 handle:(id)a13;
- (SGLocation)initWithId:(id)a3 origin:(id)a4 type:(unint64_t)a5 label:(id)a6 airportCode:(id)a7 latitude:(double)a8 longitude:(double)a9 accuracy:(double)a10 quality:(double)a11;
- (SGLocation)initWithLocation:(id)a3 latitude:(double)a4 longitude:(double)a5 accuracy:(double)a6 handle:(id)a7;
- (double)accuracy;
- (double)latitude;
- (double)longitude;
- (double)quality;
- (id)geocodedLocationWithLabel:(id)a3 address:(id)a4 latitude:(double)a5 longitude:(double)a6 accuracy:(double)a7 handle:(id)a8;
- (id)geocodedLocationWithLatitude:(double)a3 longitude:(double)a4 accuracy:(double)a5 handle:(id)a6;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)locationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_airportCode, 0);
  objc_storeStrong((id *)&self->_address, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (NSData)handle
{
  return self->_handle;
}

- (NSString)airportCode
{
  return self->_airportCode;
}

- (double)quality
{
  return self->_quality;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)latitude
{
  return self->_latitude;
}

- (NSString)address
{
  return self->_address;
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)locationType
{
  return self->_locationType;
}

- (id)geocodedLocationWithLatitude:(double)a3 longitude:(double)a4 accuracy:(double)a5 handle:(id)a6
{
  id v10 = a6;
  v11 = [[SGLocation alloc] initWithLocation:self latitude:v10 longitude:a3 accuracy:a4 handle:a5];

  return v11;
}

- (id)geocodedLocationWithLabel:(id)a3 address:(id)a4 latitude:(double)a5 longitude:(double)a6 accuracy:(double)a7 handle:(id)a8
{
  id v14 = a8;
  id v15 = a4;
  id v16 = a3;
  v26 = [SGLocation alloc];
  v17 = [(SGObject *)self recordId];
  v18 = [(SGObject *)self origin];
  unint64_t v19 = [(SGLocation *)self locationType];
  v20 = v16;
  if (!v16)
  {
    v20 = [(SGLocation *)self label];
  }
  v21 = v15;
  if (!v15)
  {
    v21 = [(SGLocation *)self address];
  }
  v22 = [(SGLocation *)self airportCode];
  [(SGLocation *)self quality];
  v24 = [(SGLocation *)v26 initWithId:v17 origin:v18 type:v19 label:v20 address:v21 airportCode:v22 latitude:a5 longitude:a6 accuracy:a7 quality:v23 handle:v14];

  if (v15)
  {
    if (v16) {
      goto LABEL_7;
    }
  }
  else
  {

    if (v16) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v24;
}

- (BOOL)geocodeIsEnd
{
  return [(SGLocation *)self locationType] != 2;
}

- (BOOL)geocodeIsStart
{
  return [(SGLocation *)self locationType] != 3;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGLocation@%0.2f/%0.2f label: '%@' address: '%@'>", *(void *)&self->_latitude, *(void *)&self->_longitude, self->_label, self->_address];

  return (NSString *)v2;
}

- (BOOL)isGeocoded
{
  return 1;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    double quality = self->_quality;
    double v7 = *((double *)v5 + 9);
    if (quality >= v7) {
      int64_t v8 = 1;
    }
    else {
      int64_t v8 = -1;
    }
    if (quality >= v7 && quality <= v7)
    {
      NSUInteger v9 = [(NSString *)self->_label length];
      unint64_t v10 = [(NSString *)self->_address length] + v9;
      uint64_t v11 = [*((id *)v5 + 4) length];
      uint64_t v12 = [*((id *)v5 + 5) length];
      if (v10 > v12 + v11) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v8;
      }
      if (v10 < v12 + v11) {
        uint64_t v13 = -1;
      }
      if (v10 == v12 + v11) {
        int64_t v8 = 0;
      }
      else {
        int64_t v8 = v13;
      }
    }
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_address hash];
  NSUInteger v4 = [(NSString *)self->_airportCode hash];
  unint64_t v5 = (unint64_t)self->_latitude - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3);
  return (unint64_t)self->_longitude - v5 + 32 * v5;
}

- (BOOL)isEqualToLocation:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SGLocation;
  if (![(SGObject *)&v27 isEqualToSuggestion:v4]) {
    goto LABEL_26;
  }
  if ([(SGLocation *)self isGeocoded])
  {
    if (self->_latitude != *((double *)v4 + 6) || self->_longitude != *((double *)v4 + 7)) {
      goto LABEL_26;
    }
  }
  else if ([v4 isGeocoded])
  {
LABEL_26:
    BOOL v25 = 0;
    goto LABEL_27;
  }
  address = self->_address;
  v6 = (NSString *)*((id *)v4 + 5);
  if (address == v6)
  {
  }
  else
  {
    double v7 = v6;
    int64_t v8 = address;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_26;
    }
  }
  airportCode = self->_airportCode;
  uint64_t v11 = (NSString *)*((id *)v4 + 10);
  if (airportCode == v11)
  {
  }
  else
  {
    uint64_t v12 = v11;
    uint64_t v13 = airportCode;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_26;
    }
  }
  handle = self->_handle;
  id v16 = (NSData *)*((id *)v4 + 11);
  if (handle == v16)
  {
  }
  else
  {
    v17 = v16;
    v18 = handle;
    char v19 = [(NSData *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_26;
    }
  }
  label = self->_label;
  v21 = (NSString *)*((id *)v4 + 4);
  if (label == v21)
  {
  }
  else
  {
    v22 = v21;
    double v23 = label;
    char v24 = [(NSString *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_26;
    }
  }
  if (self->_locationType != *((void *)v4 + 3) || self->_accuracy != *((double *)v4 + 8)) {
    goto LABEL_26;
  }
  BOOL v25 = self->_quality == *((double *)v4 + 9);
LABEL_27:

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SGLocation *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGLocation *)self isEqualToLocation:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGLocation;
  id v4 = a3;
  [(SGObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_locationType, @"locationType", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_label forKey:@"label"];
  [v4 encodeObject:self->_address forKey:@"address"];
  [v4 encodeObject:self->_airportCode forKey:@"airportCode"];
  [v4 encodeDouble:@"latitude" forKey:self->_latitude];
  [v4 encodeDouble:@"longitude" forKey:self->_longitude];
  [v4 encodeDouble:@"accuracy" forKey:self->_accuracy];
  [v4 encodeDouble:@"quality" forKey:self->_quality];
  [v4 encodeObject:self->_handle forKey:@"handle"];
}

- (SGLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SGLocation;
  objc_super v5 = [(SGObject *)&v23 initWithCoder:v4];
  if (v5)
  {
    v5->_locationType = [v4 decodeInt64ForKey:@"locationType"];
    BOOL v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v7;

    char v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"address"];
    address = v5->_address;
    v5->_address = (NSString *)v10;

    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"airportCode"];
    airportCode = v5->_airportCode;
    v5->_airportCode = (NSString *)v13;

    [v4 decodeDoubleForKey:@"latitude"];
    v5->_latitude = v15;
    [v4 decodeDoubleForKey:@"longitude"];
    v5->_longitude = v16;
    [v4 decodeDoubleForKey:@"accuracy"];
    v5->_accuracy = v17;
    [v4 decodeDoubleForKey:@"quality"];
    v5->_double quality = v18;
    char v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"handle"];
    handle = v5->_handle;
    v5->_handle = (NSData *)v20;
  }
  return v5;
}

- (SGLocation)initWithId:(id)a3 origin:(id)a4 type:(unint64_t)a5 label:(id)a6 address:(id)a7 airportCode:(id)a8 latitude:(double)a9 longitude:(double)a10 accuracy:(double)a11 quality:(double)a12 handle:(id)a13
{
  id v24 = a3;
  id v25 = a4;
  id v26 = a6;
  id v27 = a7;
  id v28 = a8;
  id v29 = a13;
  if (a9 < -90.0 || a9 > 90.0)
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"SGLocation.m", 99, @"Invalid parameter not satisfying: %@", @"isnan(latitude) || (-90 <= latitude && latitude <= 90)" object file lineNumber description];
  }
  if (a10 < -180.0 || a10 > 180.0)
  {
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"SGLocation.m", 101, @"Invalid parameter not satisfying: %@", @"isnan(longitude) || (-180 <= longitude && longitude <= 180)" object file lineNumber description];
  }
  double v30 = fabs(a11);
  if (v30 >= INFINITY && v30 <= INFINITY)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"SGLocation.m", 106, @"Invalid parameter not satisfying: %@", @"isfinite(accuracy)" object file lineNumber description];
  }
  double v32 = fabs(a12);
  if (v32 >= INFINITY && v32 <= INFINITY)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"SGLocation.m", 107, @"Invalid parameter not satisfying: %@", @"isfinite(quality)" object file lineNumber description];
  }
  v47.receiver = self;
  v47.super_class = (Class)SGLocation;
  v34 = [(SGObject *)&v47 initWithRecordId:v24 origin:v25];
  v35 = v34;
  if (v34)
  {
    v34->_locationType = a5;
    uint64_t v36 = [v26 copy];
    label = v35->_label;
    v35->_label = (NSString *)v36;

    uint64_t v38 = [v27 copy];
    address = v35->_address;
    v35->_address = (NSString *)v38;

    uint64_t v40 = [v28 copy];
    airportCode = v35->_airportCode;
    v35->_airportCode = (NSString *)v40;

    v35->_latitude = a9;
    v35->_longitude = a10;
    v35->_accuracy = a11;
    v35->_double quality = a12;
    uint64_t v42 = [v29 copy];
    handle = v35->_handle;
    v35->_handle = (NSData *)v42;
  }
  return v35;
}

- (SGLocation)initWithLocation:(id)a3 latitude:(double)a4 longitude:(double)a5 accuracy:(double)a6 handle:(id)a7
{
  id v12 = a7;
  id v13 = a3;
  char v14 = [v13 recordId];
  double v15 = [v13 origin];
  uint64_t v16 = [v13 locationType];
  double v17 = [v13 label];
  double v18 = [v13 address];
  char v19 = [v13 airportCode];
  [v13 quality];
  double v21 = v20;

  v22 = [(SGLocation *)self initWithId:v14 origin:v15 type:v16 label:v17 address:v18 airportCode:v19 latitude:a4 longitude:a5 accuracy:a6 quality:v21 handle:v12];
  return v22;
}

- (SGLocation)initWithId:(id)a3 origin:(id)a4 type:(unint64_t)a5 label:(id)a6 airportCode:(id)a7 latitude:(double)a8 longitude:(double)a9 accuracy:(double)a10 quality:(double)a11
{
  return [(SGLocation *)self initWithId:a3 origin:a4 type:a5 label:a6 address:0 airportCode:a7 latitude:a8 longitude:a9 accuracy:a10 quality:a11 handle:0];
}

- (SGLocation)initWithId:(id)a3 origin:(id)a4 type:(unint64_t)a5 label:(id)a6 address:(id)a7 airportCode:(id)a8 accuracy:(double)a9 quality:(double)a10
{
  return [(SGLocation *)self initWithId:a3 origin:a4 type:a5 label:a6 address:a7 airportCode:a8 latitude:NAN longitude:NAN accuracy:a9 quality:a10 handle:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end