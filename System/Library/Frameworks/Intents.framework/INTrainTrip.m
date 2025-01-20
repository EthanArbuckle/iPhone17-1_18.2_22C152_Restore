@interface INTrainTrip
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (CLPlacemark)arrivalStationLocation;
- (CLPlacemark)departureStationLocation;
- (INDateComponentsRange)tripDuration;
- (INTrainTrip)initWithCoder:(id)a3;
- (INTrainTrip)initWithProvider:(NSString *)provider trainName:(NSString *)trainName trainNumber:(NSString *)trainNumber tripDuration:(INDateComponentsRange *)tripDuration departureStationLocation:(CLPlacemark *)departureStationLocation departurePlatform:(NSString *)departurePlatform arrivalStationLocation:(CLPlacemark *)arrivalStationLocation arrivalPlatform:(NSString *)arrivalPlatform;
- (NSString)arrivalPlatform;
- (NSString)departurePlatform;
- (NSString)description;
- (NSString)provider;
- (NSString)trainName;
- (NSString)trainNumber;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INTrainTrip

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalPlatform, 0);
  objc_storeStrong((id *)&self->_arrivalStationLocation, 0);
  objc_storeStrong((id *)&self->_departurePlatform, 0);
  objc_storeStrong((id *)&self->_departureStationLocation, 0);
  objc_storeStrong((id *)&self->_tripDuration, 0);
  objc_storeStrong((id *)&self->_trainNumber, 0);
  objc_storeStrong((id *)&self->_trainName, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

- (NSString)arrivalPlatform
{
  return self->_arrivalPlatform;
}

- (CLPlacemark)arrivalStationLocation
{
  return self->_arrivalStationLocation;
}

- (NSString)departurePlatform
{
  return self->_departurePlatform;
}

- (CLPlacemark)departureStationLocation
{
  return self->_departureStationLocation;
}

- (INDateComponentsRange)tripDuration
{
  return self->_tripDuration;
}

- (NSString)trainNumber
{
  return self->_trainNumber;
}

- (NSString)trainName
{
  return self->_trainName;
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
  v26[1] = @"trainName";
  uint64_t trainName = (uint64_t)self->_trainName;
  uint64_t v23 = trainName;
  if (!trainName)
  {
    uint64_t trainName = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)trainName;
  v27[1] = trainName;
  v26[2] = @"trainNumber";
  trainNumber = self->_trainNumber;
  uint64_t v6 = (uint64_t)trainNumber;
  if (!trainNumber)
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
  v26[4] = @"departureStationLocation";
  departureStationLocation = self->_departureStationLocation;
  uint64_t v10 = (uint64_t)departureStationLocation;
  if (!departureStationLocation)
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
  v26[6] = @"arrivalStationLocation";
  arrivalStationLocation = self->_arrivalStationLocation;
  v14 = arrivalStationLocation;
  if (!arrivalStationLocation)
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
    if (arrivalStationLocation) {
      goto LABEL_19;
    }
  }
  else
  {

    if (arrivalStationLocation)
    {
LABEL_19:
      if (departurePlatform) {
        goto LABEL_20;
      }
LABEL_32:

      if (departureStationLocation) {
        goto LABEL_21;
      }
      goto LABEL_33;
    }
  }

  if (!departurePlatform) {
    goto LABEL_32;
  }
LABEL_20:
  if (departureStationLocation) {
    goto LABEL_21;
  }
LABEL_33:

LABEL_21:
  if (tripDuration)
  {
    if (trainNumber) {
      goto LABEL_23;
    }
  }
  else
  {

    if (trainNumber) {
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
  v11.super_class = (Class)INTrainTrip;
  uint64_t v6 = [(INTrainTrip *)&v11 description];
  v7 = [(INTrainTrip *)self _dictionaryRepresentation];
  uint64_t v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INTrainTrip *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  uint64_t v8 = [v6 encodeObject:self->_provider];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"provider");

  v9 = [v6 encodeObject:self->_trainName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"trainName");

  uint64_t v10 = [v6 encodeObject:self->_trainNumber];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"trainNumber");

  objc_super v11 = [v6 encodeObject:self->_tripDuration];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"tripDuration");

  v12 = [v6 encodeObject:self->_departureStationLocation];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"departureStationLocation");

  v13 = [v6 encodeObject:self->_departurePlatform];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"departurePlatform");

  v14 = [v6 encodeObject:self->_arrivalStationLocation];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"arrivalStationLocation");

  v15 = [v6 encodeObject:self->_arrivalPlatform];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"arrivalPlatform");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  provider = self->_provider;
  id v5 = a3;
  [v5 encodeObject:provider forKey:@"provider"];
  [v5 encodeObject:self->_trainName forKey:@"trainName"];
  [v5 encodeObject:self->_trainNumber forKey:@"trainNumber"];
  [v5 encodeObject:self->_tripDuration forKey:@"tripDuration"];
  [v5 encodeObject:self->_departureStationLocation forKey:@"departureStationLocation"];
  [v5 encodeObject:self->_departurePlatform forKey:@"departurePlatform"];
  [v5 encodeObject:self->_arrivalStationLocation forKey:@"arrivalStationLocation"];
  [v5 encodeObject:self->_arrivalPlatform forKey:@"arrivalPlatform"];
}

- (INTrainTrip)initWithCoder:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v28 = [v4 decodeObjectOfClasses:v6 forKey:@"provider"];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v27 = [v4 decodeObjectOfClasses:v9 forKey:@"trainName"];

  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"trainNumber"];

  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tripDuration"];
  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"departureStationLocation"];
  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v19 = [v4 decodeObjectOfClasses:v18 forKey:@"departurePlatform"];

  v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"arrivalStationLocation"];
  v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v24 = [v4 decodeObjectOfClasses:v23 forKey:@"arrivalPlatform"];

  v25 = [(INTrainTrip *)self initWithProvider:v28 trainName:v27 trainNumber:v13 tripDuration:v14 departureStationLocation:v15 departurePlatform:v19 arrivalStationLocation:v20 arrivalPlatform:v24];
  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INTrainTrip *)a3;
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
        uint64_t trainName = self->_trainName;
        if (trainName == v5->_trainName || -[NSString isEqual:](trainName, "isEqual:"))
        {
          trainNumber = self->_trainNumber;
          if (trainNumber == v5->_trainNumber || -[NSString isEqual:](trainNumber, "isEqual:"))
          {
            tripDuration = self->_tripDuration;
            if (tripDuration == v5->_tripDuration || -[INDateComponentsRange isEqual:](tripDuration, "isEqual:"))
            {
              departureStationLocation = self->_departureStationLocation;
              if (departureStationLocation == v5->_departureStationLocation
                || -[CLPlacemark isEqual:](departureStationLocation, "isEqual:"))
              {
                departurePlatform = self->_departurePlatform;
                if (departurePlatform == v5->_departurePlatform
                  || -[NSString isEqual:](departurePlatform, "isEqual:"))
                {
                  arrivalStationLocation = self->_arrivalStationLocation;
                  if (arrivalStationLocation == v5->_arrivalStationLocation
                    || -[CLPlacemark isEqual:](arrivalStationLocation, "isEqual:"))
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
  NSUInteger v4 = [(NSString *)self->_trainName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_trainNumber hash];
  unint64_t v6 = v4 ^ v5 ^ [(INDateComponentsRange *)self->_tripDuration hash];
  uint64_t v7 = [(CLPlacemark *)self->_departureStationLocation hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_departurePlatform hash];
  uint64_t v9 = v6 ^ v8 ^ [(CLPlacemark *)self->_arrivalStationLocation hash];
  return v9 ^ [(NSString *)self->_arrivalPlatform hash];
}

- (INTrainTrip)initWithProvider:(NSString *)provider trainName:(NSString *)trainName trainNumber:(NSString *)trainNumber tripDuration:(INDateComponentsRange *)tripDuration departureStationLocation:(CLPlacemark *)departureStationLocation departurePlatform:(NSString *)departurePlatform arrivalStationLocation:(CLPlacemark *)arrivalStationLocation arrivalPlatform:(NSString *)arrivalPlatform
{
  v16 = provider;
  uint64_t v17 = trainName;
  v18 = trainNumber;
  v19 = tripDuration;
  v20 = departureStationLocation;
  v21 = departurePlatform;
  uint64_t v22 = arrivalStationLocation;
  uint64_t v23 = arrivalPlatform;
  v42.receiver = self;
  v42.super_class = (Class)INTrainTrip;
  v24 = [(INTrainTrip *)&v42 init];
  if (v24)
  {
    uint64_t v25 = [(NSString *)v16 copy];
    v26 = v24->_provider;
    v24->_provider = (NSString *)v25;

    uint64_t v27 = [(NSString *)v17 copy];
    v28 = v24->_trainName;
    v24->_uint64_t trainName = (NSString *)v27;

    uint64_t v29 = [(NSString *)v18 copy];
    v30 = v24->_trainNumber;
    v24->_trainNumber = (NSString *)v29;

    uint64_t v31 = [(INDateComponentsRange *)v19 copy];
    v32 = v24->_tripDuration;
    v24->_tripDuration = (INDateComponentsRange *)v31;

    uint64_t v33 = [(CLPlacemark *)v20 copy];
    v34 = v24->_departureStationLocation;
    v24->_departureStationLocation = (CLPlacemark *)v33;

    uint64_t v35 = [(NSString *)v21 copy];
    v36 = v24->_departurePlatform;
    v24->_departurePlatform = (NSString *)v35;

    uint64_t v37 = [(CLPlacemark *)v22 copy];
    v38 = v24->_arrivalStationLocation;
    v24->_arrivalStationLocation = (CLPlacemark *)v37;

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
    uint64_t v9 = [v8 objectForKeyedSubscript:@"trainName"];
    uint64_t v25 = [v8 objectForKeyedSubscript:@"trainNumber"];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v8 objectForKeyedSubscript:@"tripDuration"];
    v12 = [v7 decodeObjectOfClass:v10 from:v11];

    uint64_t v13 = objc_opt_class();
    BOOL v14 = [v8 objectForKeyedSubscript:@"departureStationLocation"];
    uint64_t v15 = [v7 decodeObjectOfClass:v13 from:v14];

    v16 = [v8 objectForKeyedSubscript:@"departurePlatform"];
    uint64_t v17 = objc_opt_class();
    v18 = [v8 objectForKeyedSubscript:@"arrivalStationLocation"];
    v19 = [v7 decodeObjectOfClass:v17 from:v18];

    v20 = [v8 objectForKeyedSubscript:@"arrivalPlatform"];
    id v24 = v7;
    v21 = (void *)v15;
    uint64_t v22 = (void *)[objc_alloc((Class)a1) initWithProvider:v26 trainName:v9 trainNumber:v25 tripDuration:v12 departureStationLocation:v15 departurePlatform:v16 arrivalStationLocation:v19 arrivalPlatform:v20];

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