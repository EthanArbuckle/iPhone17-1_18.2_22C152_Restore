@interface INRideVehicle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLLocation)location;
- (INImage)mapAnnotationImage;
- (INRideVehicle)initWithCoder:(id)a3;
- (NSString)description;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)registrationPlate;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLocation:(CLLocation *)location;
- (void)setManufacturer:(NSString *)manufacturer;
- (void)setMapAnnotationImage:(INImage *)mapAnnotationImage;
- (void)setModel:(NSString *)model;
- (void)setRegistrationPlate:(NSString *)registrationPlate;
@end

@implementation INRideVehicle

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, void *, void *))a3;
  id v7 = a4;
  if (v7)
  {
    v8 = (void *)[(INRideVehicle *)self copy];
    v9 = [(INRideVehicle *)self mapAnnotationImage];
    if (v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __75__INRideVehicle_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
      v10[3] = &unk_1E551E2D0;
      v10[4] = v8;
      id v11 = v7;
      v6[2](v6, v9, v10);
    }
    else
    {
      (*((void (**)(id, void *))v7 + 2))(v7, v8);
    }
  }
}

uint64_t __75__INRideVehicle_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setMapAnnotationImage:a2];
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapAnnotationImage, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_registrationPlate, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

- (void)setMapAnnotationImage:(INImage *)mapAnnotationImage
{
}

- (INImage)mapAnnotationImage
{
  return self->_mapAnnotationImage;
}

- (void)setModel:(NSString *)model
{
}

- (NSString)model
{
  return self->_model;
}

- (void)setManufacturer:(NSString *)manufacturer
{
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setRegistrationPlate:(NSString *)registrationPlate
{
}

- (NSString)registrationPlate
{
  return self->_registrationPlate;
}

- (void)setLocation:(CLLocation *)location
{
}

- (CLLocation)location
{
  return self->_location;
}

- (id)_dictionaryRepresentation
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v17 = @"location";
  location = self->_location;
  uint64_t v4 = (uint64_t)location;
  if (!location)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v15 = v4;
  v22[0] = v4;
  v18 = @"registrationPlate";
  registrationPlate = self->_registrationPlate;
  v6 = registrationPlate;
  if (!registrationPlate)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v4, v17, v18);
  }
  v22[1] = v6;
  v19 = @"manufacturer";
  manufacturer = self->_manufacturer;
  v8 = manufacturer;
  if (!manufacturer)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[2] = v8;
  v20 = @"model";
  model = self->_model;
  v10 = model;
  if (!model)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v10;
  v21 = @"mapAnnotationImage";
  mapAnnotationImage = self->_mapAnnotationImage;
  v12 = mapAnnotationImage;
  if (!mapAnnotationImage)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v12;
  v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v17, 5, v15);
  if (mapAnnotationImage)
  {
    if (model) {
      goto LABEL_13;
    }
  }
  else
  {

    if (model)
    {
LABEL_13:
      if (manufacturer) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }

  if (manufacturer)
  {
LABEL_14:
    if (registrationPlate) {
      goto LABEL_15;
    }
LABEL_22:

    if (location) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }
LABEL_21:

  if (!registrationPlate) {
    goto LABEL_22;
  }
LABEL_15:
  if (location) {
    goto LABEL_16;
  }
LABEL_23:

LABEL_16:

  return v13;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INRideVehicle;
  v6 = [(INRideVehicle *)&v11 description];
  id v7 = [(INRideVehicle *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INRideVehicle *)self descriptionAtIndent:0];
}

- (void)encodeWithCoder:(id)a3
{
  location = self->_location;
  id v5 = a3;
  [v5 encodeObject:location forKey:@"location"];
  [v5 encodeObject:self->_registrationPlate forKey:@"registrationPlate"];
  [v5 encodeObject:self->_manufacturer forKey:@"manufacturer"];
  [v5 encodeObject:self->_model forKey:@"model"];
  [v5 encodeObject:self->_mapAnnotationImage forKey:@"mapAnnotationImage"];
}

- (INRideVehicle)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)INRideVehicle;
  id v5 = [(INRideVehicle *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    location = v5->_location;
    v5->_location = (CLLocation *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"registrationPlate"];
    registrationPlate = v5->_registrationPlate;
    v5->_registrationPlate = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manufacturer"];
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
    model = v5->_model;
    v5->_model = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mapAnnotationImage"];
    mapAnnotationImage = v5->_mapAnnotationImage;
    v5->_mapAnnotationImage = (INImage *)v14;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setLocation:self->_location];
  [v4 setRegistrationPlate:self->_registrationPlate];
  [v4 setManufacturer:self->_manufacturer];
  [v4 setModel:self->_model];
  [v4 setMapAnnotationImage:self->_mapAnnotationImage];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    location = self->_location;
    BOOL v11 = 0;
    if (location == (CLLocation *)v5[1] || -[CLLocation isEqual:](location, "isEqual:"))
    {
      registrationPlate = self->_registrationPlate;
      if (registrationPlate == (NSString *)v5[2] || -[NSString isEqual:](registrationPlate, "isEqual:"))
      {
        manufacturer = self->_manufacturer;
        if (manufacturer == (NSString *)v5[3] || -[NSString isEqual:](manufacturer, "isEqual:"))
        {
          model = self->_model;
          if (model == (NSString *)v5[4] || -[NSString isEqual:](model, "isEqual:"))
          {
            mapAnnotationImage = self->_mapAnnotationImage;
            if (mapAnnotationImage == (INImage *)v5[5] || -[INImage isEqual:](mapAnnotationImage, "isEqual:")) {
              BOOL v11 = 1;
            }
          }
        }
      }
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(CLLocation *)self->_location hash];
  NSUInteger v4 = [(NSString *)self->_registrationPlate hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_manufacturer hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_model hash];
  return v6 ^ [(INImage *)self->_mapAnnotationImage hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(INRideVehicle *)self mapAnnotationImage];
  if (v4)
  {
    NSUInteger v5 = (void *)v4;
    NSUInteger v6 = [(INRideVehicle *)self mapAnnotationImage];
    id v7 = [v6 _identifier];
    uint64_t v8 = [v13 cacheableObjectForIdentifier:v7];

    if (v8)
    {
      v9 = [(INRideVehicle *)self mapAnnotationImage];
      uint64_t v10 = [v9 _identifier];
      BOOL v11 = [v13 cacheableObjectForIdentifier:v10];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [(INRideVehicle *)self mapAnnotationImage];
        [v11 _imageSize];
        objc_msgSend(v12, "_setImageSize:");
      }
    }
  }
}

- (id)_intents_cacheableObjects
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [(INRideVehicle *)self mapAnnotationImage];

  if (v4)
  {
    NSUInteger v5 = [(INRideVehicle *)self mapAnnotationImage];
    [v3 addObject:v5];
  }
  if ([v3 count]) {
    NSUInteger v6 = v3;
  }
  else {
    NSUInteger v6 = 0;
  }
  id v7 = v6;

  return v7;
}

@end