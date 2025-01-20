@interface SGStorageLocation
+ (BOOL)supportsSecureCoding;
- (BOOL)geocodeIsEnd;
- (BOOL)geocodeIsStart;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStorageLocation:(id)a3;
- (NSData)handle;
- (NSString)address;
- (NSString)airportCode;
- (NSString)description;
- (NSString)label;
- (SGStorageLocation)initWithCoder:(id)a3;
- (SGStorageLocation)initWithType:(int)a3 label:(id)a4 address:(id)a5 airportCode:(id)a6 accuracy:(double)a7 quality:(double)a8;
- (SGStorageLocation)initWithType:(int)a3 label:(id)a4 address:(id)a5 airportCode:(id)a6 latitude:(double)a7 longitude:(double)a8 accuracy:(double)a9 quality:(double)a10 handle:(id)a11;
- (SGStorageLocation)initWithType:(int)a3 label:(id)a4 airportCode:(id)a5 latitude:(double)a6 longitude:(double)a7 accuracy:(double)a8 quality:(double)a9;
- (double)accuracy;
- (double)latitude;
- (double)longitude;
- (double)quality;
- (id)convertToLocationWithId:(id)a3 origin:(id)a4;
- (id)geocodedLocationWithLabel:(id)a3 address:(id)a4 latitude:(double)a5 longitude:(double)a6 accuracy:(double)a7 handle:(id)a8;
- (id)geocodedLocationWithLatitude:(double)a3 longitude:(double)a4 accuracy:(double)a5 handle:(id)a6;
- (int)locationType;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGStorageLocation

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

- (NSString)airportCode
{
  return self->_airportCode;
}

- (NSString)address
{
  return self->_address;
}

- (NSString)label
{
  return self->_label;
}

- (int)locationType
{
  return self->_locationType;
}

- (id)geocodedLocationWithLatitude:(double)a3 longitude:(double)a4 accuracy:(double)a5 handle:(id)a6
{
  id v10 = a6;
  v11 = [SGStorageLocation alloc];
  uint64_t v12 = [(SGStorageLocation *)self locationType];
  v13 = [(SGStorageLocation *)self label];
  v14 = [(SGStorageLocation *)self address];
  v15 = [(SGStorageLocation *)self airportCode];
  [(SGStorageLocation *)self quality];
  v17 = [(SGStorageLocation *)v11 initWithType:v12 label:v13 address:v14 airportCode:v15 latitude:v10 longitude:a3 accuracy:a4 quality:a5 handle:v16];

  return v17;
}

- (id)geocodedLocationWithLabel:(id)a3 address:(id)a4 latitude:(double)a5 longitude:(double)a6 accuracy:(double)a7 handle:(id)a8
{
  id v14 = a8;
  id v15 = a4;
  id v16 = a3;
  v17 = [SGStorageLocation alloc];
  uint64_t v18 = [(SGStorageLocation *)self locationType];
  v19 = v16;
  if (!v16)
  {
    v19 = [(SGStorageLocation *)self label];
  }
  v20 = v15;
  if (!v15)
  {
    v20 = [(SGStorageLocation *)self address];
  }
  v21 = [(SGStorageLocation *)self airportCode];
  [(SGStorageLocation *)self quality];
  v23 = [(SGStorageLocation *)v17 initWithType:v18 label:v19 address:v20 airportCode:v21 latitude:v14 longitude:a5 accuracy:a6 quality:a7 handle:v22];

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
  return v23;
}

- (BOOL)geocodeIsEnd
{
  return [(SGStorageLocation *)self locationType] != 2;
}

- (BOOL)geocodeIsStart
{
  return [(SGStorageLocation *)self locationType] != 3;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGStorageLocation@%0.2f/%0.2f label: '%@' address: '%@' airportCode: '%@'", *(void *)&self->_latitude, *(void *)&self->_longitude, self->_label, self->_address, self->_airportCode];
  return (NSString *)v2;
}

- (id)convertToLocationWithId:(id)a3 origin:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F5DA48];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithId:v8 origin:v7 type:self->_locationType label:self->_label address:self->_address airportCode:self->_airportCode latitude:self->_latitude longitude:self->_longitude accuracy:self->_accuracy quality:self->_quality handle:self->_handle];

  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    double quality = self->_quality;
    double v7 = *((double *)v5 + 8);
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
      uint64_t v11 = [*((id *)v5 + 2) length];
      uint64_t v12 = [*((id *)v5 + 3) length];
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
  NSUInteger v4 = [(NSString *)self->_airportCode hash] - v3 + 32 * v3;
  id v5 = [NSNumber numberWithDouble:self->_latitude];
  uint64_t v6 = [v5 hash] - v4 + 32 * v4;

  double v7 = [NSNumber numberWithDouble:self->_longitude];
  unint64_t v8 = [v7 hash] - v6 + 32 * v6;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (SGStorageLocation *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGStorageLocation *)self isEqualToStorageLocation:v5];

  return v6;
}

- (BOOL)isEqualToStorageLocation:(id)a3
{
  NSUInteger v4 = (id *)a3;
  id v5 = v4;
  if (self->_latitude != *((double *)v4 + 5) || self->_longitude != *((double *)v4 + 6)) {
    goto LABEL_3;
  }
  address = self->_address;
  NSUInteger v9 = (NSString *)v4[3];
  if (address == v9)
  {
  }
  else
  {
    unint64_t v10 = v9;
    uint64_t v11 = address;
    char v12 = [(NSString *)v11 isEqual:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_3;
    }
  }
  airportCode = self->_airportCode;
  id v14 = (NSString *)v5[4];
  if (airportCode == v14)
  {
  }
  else
  {
    id v15 = v14;
    id v16 = airportCode;
    char v17 = [(NSString *)v16 isEqual:v15];

    if ((v17 & 1) == 0) {
      goto LABEL_3;
    }
  }
  handle = self->_handle;
  v19 = (NSData *)v5[9];
  if (handle == v19)
  {
  }
  else
  {
    v20 = v19;
    v21 = handle;
    char v22 = [(NSData *)v21 isEqual:v20];

    if ((v22 & 1) == 0) {
      goto LABEL_3;
    }
  }
  label = self->_label;
  v24 = (NSString *)v5[2];
  if (label == v24)
  {
  }
  else
  {
    v25 = v24;
    v26 = label;
    char v27 = [(NSString *)v26 isEqual:v25];

    if ((v27 & 1) == 0) {
      goto LABEL_3;
    }
  }
  if (self->_locationType == *((_DWORD *)v5 + 2) && self->_accuracy == *((double *)v5 + 7))
  {
    BOOL v6 = self->_quality == *((double *)v5 + 8);
    goto LABEL_4;
  }
LABEL_3:
  BOOL v6 = 0;
LABEL_4:

  return v6;
}

- (SGStorageLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SGStorageLocation;
  id v5 = [(SGStorageLocation *)&v23 init];
  if (v5)
  {
    v5->_locationType = [v4 decodeInt64ForKey:@"locationType"];
    BOOL v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v7;

    NSUInteger v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"address"];
    address = v5->_address;
    v5->_address = (NSString *)v10;

    char v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
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
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"handle"];
    handle = v5->_handle;
    v5->_handle = (NSData *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t locationType = self->_locationType;
  id v5 = a3;
  [v5 encodeInt64:locationType forKey:@"locationType"];
  [v5 encodeObject:self->_label forKey:@"label"];
  [v5 encodeObject:self->_address forKey:@"address"];
  [v5 encodeObject:self->_airportCode forKey:@"airportCode"];
  [v5 encodeDouble:@"latitude" forKey:self->_latitude];
  [v5 encodeDouble:@"longitude" forKey:self->_longitude];
  [v5 encodeDouble:@"accuracy" forKey:self->_accuracy];
  [v5 encodeDouble:@"quality" forKey:self->_quality];
  [v5 encodeObject:self->_handle forKey:@"handle"];
}

- (SGStorageLocation)initWithType:(int)a3 label:(id)a4 address:(id)a5 airportCode:(id)a6 latitude:(double)a7 longitude:(double)a8 accuracy:(double)a9 quality:(double)a10 handle:(id)a11
{
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = a11;
  if (a7 < -90.0 || a7 > 90.0)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"SGStorageLocation.m", 69, @"Invalid parameter not satisfying: %@", @"isnan(latitude) || (-90 <= latitude && latitude <= 90)" object file lineNumber description];
  }
  if (a8 < -180.0 || a8 > 180.0)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"SGStorageLocation.m", 71, @"Invalid parameter not satisfying: %@", @"isnan(longitude) || (-180 <= longitude && longitude <= 180)" object file lineNumber description];
  }
  double v25 = fabs(a9);
  if (v25 >= INFINITY && v25 <= INFINITY)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SGStorageLocation.m", 76, @"Invalid parameter not satisfying: %@", @"isfinite(accuracy)" object file lineNumber description];
  }
  double v27 = fabs(a10);
  if (v27 >= INFINITY && v27 <= INFINITY)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"SGStorageLocation.m", 77, @"Invalid parameter not satisfying: %@", @"isfinite(quality)" object file lineNumber description];
  }
  v42.receiver = self;
  v42.super_class = (Class)SGStorageLocation;
  v29 = [(SGStorageLocation *)&v42 init];
  v30 = v29;
  if (v29)
  {
    v29->_uint64_t locationType = a3;
    uint64_t v31 = [v21 copy];
    label = v30->_label;
    v30->_label = (NSString *)v31;

    uint64_t v33 = [v22 copy];
    address = v30->_address;
    v30->_address = (NSString *)v33;

    uint64_t v35 = [v23 copy];
    airportCode = v30->_airportCode;
    v30->_airportCode = (NSString *)v35;

    v30->_latitude = a7;
    v30->_longitude = a8;
    v30->_accuracy = a9;
    v30->_double quality = a10;
    uint64_t v37 = [v24 copy];
    handle = v30->_handle;
    v30->_handle = (NSData *)v37;
  }
  return v30;
}

- (SGStorageLocation)initWithType:(int)a3 label:(id)a4 airportCode:(id)a5 latitude:(double)a6 longitude:(double)a7 accuracy:(double)a8 quality:(double)a9
{
  return [(SGStorageLocation *)self initWithType:*(void *)&a3 label:a4 address:0 airportCode:a5 latitude:0 longitude:a6 accuracy:a7 quality:a8 handle:a9];
}

- (SGStorageLocation)initWithType:(int)a3 label:(id)a4 address:(id)a5 airportCode:(id)a6 accuracy:(double)a7 quality:(double)a8
{
  return [(SGStorageLocation *)self initWithType:*(void *)&a3 label:a4 address:a5 airportCode:a6 latitude:0 longitude:NAN accuracy:NAN quality:a7 handle:a8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end