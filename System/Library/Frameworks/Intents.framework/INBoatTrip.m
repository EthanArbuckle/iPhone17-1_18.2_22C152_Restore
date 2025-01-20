@interface INBoatTrip
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (CLPlacemark)arrivalBoatTerminalLocation;
- (CLPlacemark)departureBoatTerminalLocation;
- (INBoatTrip)initWithCoder:(id)a3;
- (INBoatTrip)initWithProvider:(NSString *)provider boatName:(NSString *)boatName boatNumber:(NSString *)boatNumber tripDuration:(INDateComponentsRange *)tripDuration departureBoatTerminalLocation:(CLPlacemark *)departureBoatTerminalLocation arrivalBoatTerminalLocation:(CLPlacemark *)arrivalBoatTerminalLocation;
- (INDateComponentsRange)tripDuration;
- (NSString)boatName;
- (NSString)boatNumber;
- (NSString)description;
- (NSString)provider;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INBoatTrip

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalBoatTerminalLocation, 0);
  objc_storeStrong((id *)&self->_departureBoatTerminalLocation, 0);
  objc_storeStrong((id *)&self->_tripDuration, 0);
  objc_storeStrong((id *)&self->_boatNumber, 0);
  objc_storeStrong((id *)&self->_boatName, 0);

  objc_storeStrong((id *)&self->_provider, 0);
}

- (CLPlacemark)arrivalBoatTerminalLocation
{
  return self->_arrivalBoatTerminalLocation;
}

- (CLPlacemark)departureBoatTerminalLocation
{
  return self->_departureBoatTerminalLocation;
}

- (INDateComponentsRange)tripDuration
{
  return self->_tripDuration;
}

- (NSString)boatNumber
{
  return self->_boatNumber;
}

- (NSString)boatName
{
  return self->_boatName;
}

- (NSString)provider
{
  return self->_provider;
}

- (id)_dictionaryRepresentation
{
  v27[6] = *MEMORY[0x1E4F143B8];
  v21 = @"provider";
  provider = self->_provider;
  uint64_t v4 = (uint64_t)provider;
  if (!provider)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v4;
  v27[0] = v4;
  v22 = @"boatName";
  boatName = self->_boatName;
  uint64_t v6 = (uint64_t)boatName;
  if (!boatName)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v6;
  v27[1] = v6;
  v23 = @"boatNumber";
  boatNumber = self->_boatNumber;
  uint64_t v8 = (uint64_t)boatNumber;
  if (!boatNumber)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v8;
  v27[2] = v8;
  v24 = @"tripDuration";
  tripDuration = self->_tripDuration;
  v10 = tripDuration;
  if (!tripDuration)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v8, v19, v20, v21, v22, v23, v24);
  }
  v27[3] = v10;
  v25 = @"departureBoatTerminalLocation";
  departureBoatTerminalLocation = self->_departureBoatTerminalLocation;
  v12 = departureBoatTerminalLocation;
  if (!departureBoatTerminalLocation)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[4] = v12;
  v26 = @"arrivalBoatTerminalLocation";
  arrivalBoatTerminalLocation = self->_arrivalBoatTerminalLocation;
  v14 = arrivalBoatTerminalLocation;
  if (!arrivalBoatTerminalLocation)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[5] = v14;
  v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, &v21, 6, v17);
  if (arrivalBoatTerminalLocation)
  {
    if (departureBoatTerminalLocation) {
      goto LABEL_15;
    }
  }
  else
  {

    if (departureBoatTerminalLocation)
    {
LABEL_15:
      if (tripDuration) {
        goto LABEL_16;
      }
      goto LABEL_24;
    }
  }

  if (tripDuration)
  {
LABEL_16:
    if (boatNumber) {
      goto LABEL_17;
    }
    goto LABEL_25;
  }
LABEL_24:

  if (boatNumber)
  {
LABEL_17:
    if (boatName) {
      goto LABEL_18;
    }
LABEL_26:

    if (provider) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }
LABEL_25:

  if (!boatName) {
    goto LABEL_26;
  }
LABEL_18:
  if (provider) {
    goto LABEL_19;
  }
LABEL_27:

LABEL_19:

  return v15;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INBoatTrip;
  uint64_t v6 = [(INBoatTrip *)&v11 description];
  v7 = [(INBoatTrip *)self _dictionaryRepresentation];
  uint64_t v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INBoatTrip *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  uint64_t v8 = [v6 encodeObject:self->_provider];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"provider");

  v9 = [v6 encodeObject:self->_boatName];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"boatName");

  v10 = [v6 encodeObject:self->_boatNumber];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"boatNumber");

  objc_super v11 = [v6 encodeObject:self->_tripDuration];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"tripDuration");

  v12 = [v6 encodeObject:self->_departureBoatTerminalLocation];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"departureBoatTerminalLocation");

  v13 = [v6 encodeObject:self->_arrivalBoatTerminalLocation];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"arrivalBoatTerminalLocation");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  provider = self->_provider;
  id v5 = a3;
  [v5 encodeObject:provider forKey:@"provider"];
  [v5 encodeObject:self->_boatName forKey:@"boatName"];
  [v5 encodeObject:self->_boatNumber forKey:@"boatNumber"];
  [v5 encodeObject:self->_tripDuration forKey:@"tripDuration"];
  [v5 encodeObject:self->_departureBoatTerminalLocation forKey:@"departureBoatTerminalLocation"];
  [v5 encodeObject:self->_arrivalBoatTerminalLocation forKey:@"arrivalBoatTerminalLocation"];
}

- (INBoatTrip)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"provider"];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  objc_super v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"boatName"];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v16 = [v5 decodeObjectOfClasses:v15 forKey:@"boatNumber"];

  uint64_t v17 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"tripDuration"];
  v18 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"departureBoatTerminalLocation"];
  v19 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"arrivalBoatTerminalLocation"];

  v20 = [(INBoatTrip *)self initWithProvider:v8 boatName:v12 boatNumber:v16 tripDuration:v17 departureBoatTerminalLocation:v18 arrivalBoatTerminalLocation:v19];
  return v20;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (INBoatTrip *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      provider = self->_provider;
      BOOL v12 = 0;
      if (provider == v5->_provider || -[NSString isEqual:](provider, "isEqual:"))
      {
        boatName = self->_boatName;
        if (boatName == v5->_boatName || -[NSString isEqual:](boatName, "isEqual:"))
        {
          boatNumber = self->_boatNumber;
          if (boatNumber == v5->_boatNumber || -[NSString isEqual:](boatNumber, "isEqual:"))
          {
            tripDuration = self->_tripDuration;
            if (tripDuration == v5->_tripDuration || -[INDateComponentsRange isEqual:](tripDuration, "isEqual:"))
            {
              departureBoatTerminalLocation = self->_departureBoatTerminalLocation;
              if (departureBoatTerminalLocation == v5->_departureBoatTerminalLocation
                || -[CLPlacemark isEqual:](departureBoatTerminalLocation, "isEqual:"))
              {
                arrivalBoatTerminalLocation = self->_arrivalBoatTerminalLocation;
                if (arrivalBoatTerminalLocation == v5->_arrivalBoatTerminalLocation
                  || -[CLPlacemark isEqual:](arrivalBoatTerminalLocation, "isEqual:"))
                {
                  BOOL v12 = 1;
                }
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_provider hash];
  NSUInteger v4 = [(NSString *)self->_boatName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_boatNumber hash];
  unint64_t v6 = v4 ^ v5 ^ [(INDateComponentsRange *)self->_tripDuration hash];
  uint64_t v7 = [(CLPlacemark *)self->_departureBoatTerminalLocation hash];
  return v6 ^ v7 ^ [(CLPlacemark *)self->_arrivalBoatTerminalLocation hash];
}

- (INBoatTrip)initWithProvider:(NSString *)provider boatName:(NSString *)boatName boatNumber:(NSString *)boatNumber tripDuration:(INDateComponentsRange *)tripDuration departureBoatTerminalLocation:(CLPlacemark *)departureBoatTerminalLocation arrivalBoatTerminalLocation:(CLPlacemark *)arrivalBoatTerminalLocation
{
  uint64_t v14 = provider;
  v15 = boatName;
  v16 = boatNumber;
  uint64_t v17 = tripDuration;
  v18 = departureBoatTerminalLocation;
  v19 = arrivalBoatTerminalLocation;
  v34.receiver = self;
  v34.super_class = (Class)INBoatTrip;
  v20 = [(INBoatTrip *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [(NSString *)v14 copy];
    v22 = v20->_provider;
    v20->_provider = (NSString *)v21;

    uint64_t v23 = [(NSString *)v15 copy];
    v24 = v20->_boatName;
    v20->_boatName = (NSString *)v23;

    uint64_t v25 = [(NSString *)v16 copy];
    v26 = v20->_boatNumber;
    v20->_boatNumber = (NSString *)v25;

    uint64_t v27 = [(INDateComponentsRange *)v17 copy];
    v28 = v20->_tripDuration;
    v20->_tripDuration = (INDateComponentsRange *)v27;

    uint64_t v29 = [(CLPlacemark *)v18 copy];
    v30 = v20->_departureBoatTerminalLocation;
    v20->_departureBoatTerminalLocation = (CLPlacemark *)v29;

    uint64_t v31 = [(CLPlacemark *)v19 copy];
    v32 = v20->_arrivalBoatTerminalLocation;
    v20->_arrivalBoatTerminalLocation = (CLPlacemark *)v31;
  }
  return v20;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v8 objectForKeyedSubscript:@"provider"];
    uint64_t v10 = [v8 objectForKeyedSubscript:@"boatName"];
    objc_super v11 = [v8 objectForKeyedSubscript:@"boatNumber"];
    uint64_t v12 = objc_opt_class();
    v13 = [v8 objectForKeyedSubscript:@"tripDuration"];
    uint64_t v14 = [v7 decodeObjectOfClass:v12 from:v13];

    uint64_t v15 = objc_opt_class();
    v16 = [v8 objectForKeyedSubscript:@"departureBoatTerminalLocation"];
    uint64_t v17 = [v7 decodeObjectOfClass:v15 from:v16];

    uint64_t v18 = objc_opt_class();
    v19 = [v8 objectForKeyedSubscript:@"arrivalBoatTerminalLocation"];
    v20 = [v7 decodeObjectOfClass:v18 from:v19];

    uint64_t v21 = (void *)[objc_alloc((Class)a1) initWithProvider:v9 boatName:v10 boatNumber:v11 tripDuration:v14 departureBoatTerminalLocation:v17 arrivalBoatTerminalLocation:v20];
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end