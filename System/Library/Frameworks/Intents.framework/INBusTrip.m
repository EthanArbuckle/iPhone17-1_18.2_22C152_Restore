@interface INBusTrip
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (CLPlacemark)arrivalBusStopLocation;
- (CLPlacemark)departureBusStopLocation;
- (INBusTrip)initWithCoder:(id)a3;
- (INBusTrip)initWithProvider:(NSString *)provider busName:(NSString *)busName busNumber:(NSString *)busNumber tripDuration:(INDateComponentsRange *)tripDuration departureBusStopLocation:(CLPlacemark *)departureBusStopLocation departurePlatform:(NSString *)departurePlatform arrivalBusStopLocation:(CLPlacemark *)arrivalBusStopLocation arrivalPlatform:(NSString *)arrivalPlatform;
- (INDateComponentsRange)tripDuration;
- (NSString)arrivalPlatform;
- (NSString)busName;
- (NSString)busNumber;
- (NSString)departurePlatform;
- (NSString)description;
- (NSString)provider;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INBusTrip

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalPlatform, 0);
  objc_storeStrong((id *)&self->_arrivalBusStopLocation, 0);
  objc_storeStrong((id *)&self->_departurePlatform, 0);
  objc_storeStrong((id *)&self->_departureBusStopLocation, 0);
  objc_storeStrong((id *)&self->_tripDuration, 0);
  objc_storeStrong((id *)&self->_busNumber, 0);
  objc_storeStrong((id *)&self->_busName, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

- (NSString)arrivalPlatform
{
  return self->_arrivalPlatform;
}

- (CLPlacemark)arrivalBusStopLocation
{
  return self->_arrivalBusStopLocation;
}

- (NSString)departurePlatform
{
  return self->_departurePlatform;
}

- (CLPlacemark)departureBusStopLocation
{
  return self->_departureBusStopLocation;
}

- (INDateComponentsRange)tripDuration
{
  return self->_tripDuration;
}

- (NSString)busNumber
{
  return self->_busNumber;
}

- (NSString)busName
{
  return self->_busName;
}

- (NSString)provider
{
  return self->_provider;
}

- (id)_dictionaryRepresentation
{
  v27[8] = *MEMORY[0x1E4F143B8];
  provider = self->_provider;
  uint64_t v3 = (uint64_t)provider;
  v26[0] = @"provider";
  if (!provider)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[0] = v3;
  v26[1] = @"busName";
  uint64_t busName = (uint64_t)self->_busName;
  uint64_t v23 = busName;
  if (!busName)
  {
    uint64_t busName = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)busName;
  v27[1] = busName;
  v26[2] = @"busNumber";
  busNumber = self->_busNumber;
  uint64_t v6 = (uint64_t)busNumber;
  if (!busNumber)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v6;
  v27[2] = v6;
  v26[3] = @"tripDuration";
  tripDuration = self->_tripDuration;
  uint64_t v8 = (uint64_t)tripDuration;
  if (!tripDuration)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v3;
  v20 = (void *)v8;
  v27[3] = v8;
  v26[4] = @"departureBusStopLocation";
  departureBusStopLocation = self->_departureBusStopLocation;
  uint64_t v10 = (uint64_t)departureBusStopLocation;
  if (!departureBusStopLocation)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v10;
  v27[4] = v10;
  v26[5] = @"departurePlatform";
  departurePlatform = self->_departurePlatform;
  v12 = departurePlatform;
  if (!departurePlatform)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[5] = v12;
  v26[6] = @"arrivalBusStopLocation";
  arrivalBusStopLocation = self->_arrivalBusStopLocation;
  v14 = arrivalBusStopLocation;
  if (!arrivalBusStopLocation)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[6] = v14;
  v26[7] = @"arrivalPlatform";
  arrivalPlatform = self->_arrivalPlatform;
  v16 = arrivalPlatform;
  if (!arrivalPlatform)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[7] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:8];
  if (arrivalPlatform)
  {
    if (arrivalBusStopLocation) {
      goto LABEL_19;
    }
  }
  else
  {

    if (arrivalBusStopLocation)
    {
LABEL_19:
      if (departurePlatform) {
        goto LABEL_20;
      }
LABEL_32:

      if (departureBusStopLocation) {
        goto LABEL_21;
      }
      goto LABEL_33;
    }
  }

  if (!departurePlatform) {
    goto LABEL_32;
  }
LABEL_20:
  if (departureBusStopLocation) {
    goto LABEL_21;
  }
LABEL_33:

LABEL_21:
  if (tripDuration)
  {
    if (busNumber) {
      goto LABEL_23;
    }
  }
  else
  {

    if (busNumber) {
      goto LABEL_23;
    }
  }

LABEL_23:
  if (!v23) {

  }
  if (!provider) {

  }
  return v17;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INBusTrip;
  uint64_t v6 = [(INBusTrip *)&v11 description];
  v7 = [(INBusTrip *)self _dictionaryRepresentation];
  uint64_t v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INBusTrip *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  uint64_t v8 = [v6 encodeObject:self->_provider];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"provider");

  v9 = [v6 encodeObject:self->_busName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"busName");

  uint64_t v10 = [v6 encodeObject:self->_busNumber];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"busNumber");

  objc_super v11 = [v6 encodeObject:self->_tripDuration];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"tripDuration");

  v12 = [v6 encodeObject:self->_departureBusStopLocation];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"departureBusStopLocation");

  v13 = [v6 encodeObject:self->_departurePlatform];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"departurePlatform");

  v14 = [v6 encodeObject:self->_arrivalBusStopLocation];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"arrivalBusStopLocation");

  v15 = [v6 encodeObject:self->_arrivalPlatform];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"arrivalPlatform");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  provider = self->_provider;
  id v5 = a3;
  [v5 encodeObject:provider forKey:@"provider"];
  [v5 encodeObject:self->_busName forKey:@"busName"];
  [v5 encodeObject:self->_busNumber forKey:@"busNumber"];
  [v5 encodeObject:self->_tripDuration forKey:@"tripDuration"];
  [v5 encodeObject:self->_departureBusStopLocation forKey:@"departureBusStopLocation"];
  [v5 encodeObject:self->_departurePlatform forKey:@"departurePlatform"];
  [v5 encodeObject:self->_arrivalBusStopLocation forKey:@"arrivalBusStopLocation"];
  [v5 encodeObject:self->_arrivalPlatform forKey:@"arrivalPlatform"];
}

- (INBusTrip)initWithCoder:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v28 = [v4 decodeObjectOfClasses:v6 forKey:@"provider"];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v27 = [v4 decodeObjectOfClasses:v9 forKey:@"busName"];

  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"busNumber"];

  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tripDuration"];
  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"departureBusStopLocation"];
  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v19 = [v4 decodeObjectOfClasses:v18 forKey:@"departurePlatform"];

  v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"arrivalBusStopLocation"];
  v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v24 = [v4 decodeObjectOfClasses:v23 forKey:@"arrivalPlatform"];

  v25 = [(INBusTrip *)self initWithProvider:v28 busName:v27 busNumber:v13 tripDuration:v14 departureBusStopLocation:v15 departurePlatform:v19 arrivalBusStopLocation:v20 arrivalPlatform:v24];
  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INBusTrip *)a3;
  if (v4 == self)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      provider = self->_provider;
      BOOL v14 = 0;
      if (provider == v5->_provider || -[NSString isEqual:](provider, "isEqual:"))
      {
        uint64_t busName = self->_busName;
        if (busName == v5->_busName || -[NSString isEqual:](busName, "isEqual:"))
        {
          busNumber = self->_busNumber;
          if (busNumber == v5->_busNumber || -[NSString isEqual:](busNumber, "isEqual:"))
          {
            tripDuration = self->_tripDuration;
            if (tripDuration == v5->_tripDuration || -[INDateComponentsRange isEqual:](tripDuration, "isEqual:"))
            {
              departureBusStopLocation = self->_departureBusStopLocation;
              if (departureBusStopLocation == v5->_departureBusStopLocation
                || -[CLPlacemark isEqual:](departureBusStopLocation, "isEqual:"))
              {
                departurePlatform = self->_departurePlatform;
                if (departurePlatform == v5->_departurePlatform
                  || -[NSString isEqual:](departurePlatform, "isEqual:"))
                {
                  arrivalBusStopLocation = self->_arrivalBusStopLocation;
                  if (arrivalBusStopLocation == v5->_arrivalBusStopLocation
                    || -[CLPlacemark isEqual:](arrivalBusStopLocation, "isEqual:"))
                  {
                    arrivalPlatform = self->_arrivalPlatform;
                    if (arrivalPlatform == v5->_arrivalPlatform
                      || -[NSString isEqual:](arrivalPlatform, "isEqual:"))
                    {
                      BOOL v14 = 1;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_provider hash];
  NSUInteger v4 = [(NSString *)self->_busName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_busNumber hash];
  unint64_t v6 = v4 ^ v5 ^ [(INDateComponentsRange *)self->_tripDuration hash];
  uint64_t v7 = [(CLPlacemark *)self->_departureBusStopLocation hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_departurePlatform hash];
  uint64_t v9 = v6 ^ v8 ^ [(CLPlacemark *)self->_arrivalBusStopLocation hash];
  return v9 ^ [(NSString *)self->_arrivalPlatform hash];
}

- (INBusTrip)initWithProvider:(NSString *)provider busName:(NSString *)busName busNumber:(NSString *)busNumber tripDuration:(INDateComponentsRange *)tripDuration departureBusStopLocation:(CLPlacemark *)departureBusStopLocation departurePlatform:(NSString *)departurePlatform arrivalBusStopLocation:(CLPlacemark *)arrivalBusStopLocation arrivalPlatform:(NSString *)arrivalPlatform
{
  v16 = provider;
  uint64_t v17 = busName;
  v18 = busNumber;
  v19 = tripDuration;
  v20 = departureBusStopLocation;
  v21 = departurePlatform;
  uint64_t v22 = arrivalBusStopLocation;
  uint64_t v23 = arrivalPlatform;
  v42.receiver = self;
  v42.super_class = (Class)INBusTrip;
  v24 = [(INBusTrip *)&v42 init];
  if (v24)
  {
    uint64_t v25 = [(NSString *)v16 copy];
    v26 = v24->_provider;
    v24->_provider = (NSString *)v25;

    uint64_t v27 = [(NSString *)v17 copy];
    v28 = v24->_busName;
    v24->_uint64_t busName = (NSString *)v27;

    uint64_t v29 = [(NSString *)v18 copy];
    v30 = v24->_busNumber;
    v24->_busNumber = (NSString *)v29;

    uint64_t v31 = [(INDateComponentsRange *)v19 copy];
    v32 = v24->_tripDuration;
    v24->_tripDuration = (INDateComponentsRange *)v31;

    uint64_t v33 = [(CLPlacemark *)v20 copy];
    v34 = v24->_departureBusStopLocation;
    v24->_departureBusStopLocation = (CLPlacemark *)v33;

    uint64_t v35 = [(NSString *)v21 copy];
    v36 = v24->_departurePlatform;
    v24->_departurePlatform = (NSString *)v35;

    uint64_t v37 = [(CLPlacemark *)v22 copy];
    v38 = v24->_arrivalBusStopLocation;
    v24->_arrivalBusStopLocation = (CLPlacemark *)v37;

    uint64_t v39 = [(NSString *)v23 copy];
    v40 = v24->_arrivalPlatform;
    v24->_arrivalPlatform = (NSString *)v39;
  }
  return v24;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26 = [v8 objectForKeyedSubscript:@"provider"];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"busName"];
    uint64_t v25 = [v8 objectForKeyedSubscript:@"busNumber"];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v8 objectForKeyedSubscript:@"tripDuration"];
    v12 = [v7 decodeObjectOfClass:v10 from:v11];

    uint64_t v13 = objc_opt_class();
    BOOL v14 = [v8 objectForKeyedSubscript:@"departureBusStopLocation"];
    uint64_t v15 = [v7 decodeObjectOfClass:v13 from:v14];

    v16 = [v8 objectForKeyedSubscript:@"departurePlatform"];
    uint64_t v17 = objc_opt_class();
    v18 = [v8 objectForKeyedSubscript:@"arrivalBusStopLocation"];
    v19 = [v7 decodeObjectOfClass:v17 from:v18];

    v20 = [v8 objectForKeyedSubscript:@"arrivalPlatform"];
    id v24 = v7;
    v21 = (void *)v15;
    uint64_t v22 = (void *)[objc_alloc((Class)a1) initWithProvider:v26 busName:v9 busNumber:v25 tripDuration:v12 departureBusStopLocation:v15 departurePlatform:v16 arrivalBusStopLocation:v19 arrivalPlatform:v20];

    id v7 = v24;
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end