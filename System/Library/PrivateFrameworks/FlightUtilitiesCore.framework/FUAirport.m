@interface FUAirport
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLLocationCoordinate2D)location;
- (CLPlacemark)placemark;
- (FUAirport)initWithCoder:(id)a3;
- (NSString)IATACode;
- (NSString)city;
- (NSString)name;
- (NSTimeZone)timeZone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)fetchPlacemarkWithCompletionHandler:(id)a3;
- (void)setCity:(id)a3;
- (void)setIATACode:(id)a3;
- (void)setLocation:(CLLocationCoordinate2D)a3;
- (void)setName:(id)a3;
- (void)setPlacemark:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation FUAirport

- (BOOL)isEqual:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [(FUAirport *)self IATACode];
    v9 = [v7 IATACode];
    if (v8 != v9)
    {
      v3 = [(FUAirport *)self IATACode];
      v5 = [v7 IATACode];
      if (![v3 isEqual:v5])
      {
        BOOL v10 = 0;
        goto LABEL_35;
      }
    }
    uint64_t v11 = [(FUAirport *)self name];
    v12 = [v7 name];
    v41 = (void *)v11;
    if ((void *)v11 != v12)
    {
      v13 = [(FUAirport *)self name];
      v14 = [v7 name];
      if (![v13 isEqual:v14])
      {
        BOOL v10 = 0;
LABEL_33:

LABEL_34:
        if (v8 == v9)
        {
LABEL_36:

          goto LABEL_37;
        }
LABEL_35:

        goto LABEL_36;
      }
      v39 = v14;
      v40 = v13;
    }
    v15 = [(FUAirport *)self city];
    uint64_t v16 = [v7 city];
    v17 = (void *)v16;
    if (v15 == (void *)v16)
    {
      v35 = v15;
    }
    else
    {
      v4 = (void *)v16;
      v18 = [(FUAirport *)self city];
      v36 = [v7 city];
      v37 = v18;
      if (!objc_msgSend(v18, "isEqual:"))
      {
        BOOL v10 = 0;
        v17 = v4;
LABEL_31:

LABEL_32:
        v13 = v40;
        v14 = v39;
        if (v41 == v12) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }
      v35 = v15;
      v17 = v4;
    }
    v19 = [(FUAirport *)self timeZone];
    uint64_t v38 = [v7 timeZone];
    if (v19 == (void *)v38)
    {
      v33 = v5;
      v34 = v3;
    }
    else
    {
      v4 = [(FUAirport *)self timeZone];
      v31 = [v7 timeZone];
      v32 = v4;
      if (!objc_msgSend(v4, "isEqual:"))
      {
        BOOL v10 = 0;
        v22 = (void *)v38;
LABEL_29:

LABEL_30:
        v15 = v35;
        if (v35 == v17) {
          goto LABEL_32;
        }
        goto LABEL_31;
      }
      v33 = v5;
      v34 = v3;
    }
    v20 = [(FUAirport *)self placemark];
    v21 = [v7 placemark];
    if (v20 == v21
      || ([(FUAirport *)self placemark],
          v4 = objc_claimAutoreleasedReturnValue(),
          [v7 placemark],
          v30 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "isEqual:")))
    {
      [(FUAirport *)self location];
      double v24 = v23;
      [v7 location];
      if (v24 == v25)
      {
        [(FUAirport *)self location];
        double v27 = v26;
        [v7 location];
        BOOL v10 = v27 == v28;
      }
      else
      {
        BOOL v10 = 0;
      }
      if (v20 == v21)
      {
LABEL_28:

        v22 = (void *)v38;
        v5 = v33;
        v3 = v34;
        if (v19 == (void *)v38) {
          goto LABEL_30;
        }
        goto LABEL_29;
      }
    }
    else
    {
      BOOL v10 = 0;
    }

    goto LABEL_28;
  }
  BOOL v10 = 0;
LABEL_37:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(FUAirport *)self IATACode];
  v6 = (void *)[v5 copy];
  [v4 setIATACode:v6];

  id v7 = [(FUAirport *)self name];
  v8 = (void *)[v7 copy];
  [v4 setName:v8];

  v9 = [(FUAirport *)self city];
  BOOL v10 = (void *)[v9 copy];
  [v4 setCity:v10];

  uint64_t v11 = [(FUAirport *)self timeZone];
  v12 = (void *)[v11 copy];
  [v4 setTimeZone:v12];

  [(FUAirport *)self location];
  objc_msgSend(v4, "setLocation:");
  v13 = [(FUAirport *)self placemark];
  v14 = (void *)[v13 copy];
  [v4 setPlacemark:v14];

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = [(FUAirport *)self IATACode];
  v5 = [(FUAirport *)self name];
  [(FUAirport *)self location];
  uint64_t v7 = v6;
  [(FUAirport *)self location];
  v9 = [v3 stringWithFormat:@"Airport: %@ (%@) [%f,%f]", v4, v5, v7, v8];

  return v9;
}

- (void)fetchPlacemarkWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(FUAirport *)self placemark];

  if (v5)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__FUAirport_fetchPlacemarkWithCompletionHandler___block_invoke;
    block[3] = &unk_264545E08;
    block[4] = self;
    id v15 = v4;
    id v6 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
    uint64_t v7 = v15;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263F00A40]);
    id v8 = objc_alloc(MEMORY[0x263F00A50]);
    [(FUAirport *)self location];
    double v10 = v9;
    [(FUAirport *)self location];
    uint64_t v7 = objc_msgSend(v8, "initWithLatitude:longitude:", v10);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __49__FUAirport_fetchPlacemarkWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_264545DE0;
    v12[4] = self;
    id v13 = v4;
    id v11 = v4;
    [v6 reverseGeocodeLocation:v7 completionHandler:v12];
  }
}

void __49__FUAirport_fetchPlacemarkWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) placemark];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __49__FUAirport_fetchPlacemarkWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (!a3 && [v8 count])
  {
    v5 = [v8 firstObject];
    [*(id *)(a1 + 32) setPlacemark:v5];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = [*(id *)(a1 + 32) placemark];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v19 = a3;
  id v4 = [(FUAirport *)self IATACode];

  if (v4)
  {
    v5 = [(FUAirport *)self IATACode];
    [v19 encodeObject:v5 forKey:@"IATACode"];
  }
  uint64_t v6 = [(FUAirport *)self name];

  if (v6)
  {
    uint64_t v7 = [(FUAirport *)self name];
    [v19 encodeObject:v7 forKey:@"name"];
  }
  id v8 = [(FUAirport *)self city];

  if (v8)
  {
    double v9 = [(FUAirport *)self city];
    [v19 encodeObject:v9 forKey:@"city"];
  }
  double v10 = [(FUAirport *)self timeZone];

  if (v10)
  {
    id v11 = [(FUAirport *)self timeZone];
    [v19 encodeObject:v11 forKey:@"timeZone"];
  }
  v12 = [(FUAirport *)self placemark];

  if (v12)
  {
    id v13 = [(FUAirport *)self placemark];
    [v19 encodeObject:v13 forKey:@"placemark"];
  }
  v14 = NSNumber;
  [(FUAirport *)self location];
  id v15 = objc_msgSend(v14, "numberWithDouble:");
  [v19 encodeObject:v15 forKey:@"location.latitude"];

  uint64_t v16 = NSNumber;
  [(FUAirport *)self location];
  v18 = [v16 numberWithDouble:v17];
  [v19 encodeObject:v18 forKey:@"location.longitude"];
}

- (FUAirport)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FUAirport;
  v5 = [(FUAirport *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IATACode"];
    IATACode = v5->_IATACode;
    v5->_IATACode = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"city"];
    city = v5->_city;
    v5->_city = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placemark"];
    placemark = v5->_placemark;
    v5->_placemark = (CLPlacemark *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location.latitude"];
    [v16 doubleValue];
    v5->_location.latitude = v17;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location.longitude"];
    [v18 doubleValue];
    v5->_location.longitude = v19;

    v20 = v5;
  }

  return v5;
}

- (NSString)IATACode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIATACode:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)city
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCity:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (CLLocationCoordinate2D)location
{
  objc_copyStruct(v4, &self->_location, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (void)setLocation:(CLLocationCoordinate2D)a3
{
  CLLocationCoordinate2D v3 = a3;
  objc_copyStruct(&self->_location, &v3, 16, 1, 0);
}

- (CLPlacemark)placemark
{
  return (CLPlacemark *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPlacemark:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_IATACode, 0);
}

@end