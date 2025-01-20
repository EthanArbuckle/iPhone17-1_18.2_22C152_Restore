@interface INFlight
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INAirline)airline;
- (INAirportGate)arrivalAirportGate;
- (INAirportGate)departureAirportGate;
- (INDateComponentsRange)boardingTime;
- (INDateComponentsRange)flightDuration;
- (INFlight)initWithAirline:(INAirline *)airline flightNumber:(NSString *)flightNumber boardingTime:(INDateComponentsRange *)boardingTime flightDuration:(INDateComponentsRange *)flightDuration departureAirportGate:(INAirportGate *)departureAirportGate arrivalAirportGate:(INAirportGate *)arrivalAirportGate;
- (INFlight)initWithCoder:(id)a3;
- (NSString)description;
- (NSString)flightNumber;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INFlight

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalAirportGate, 0);
  objc_storeStrong((id *)&self->_departureAirportGate, 0);
  objc_storeStrong((id *)&self->_flightDuration, 0);
  objc_storeStrong((id *)&self->_boardingTime, 0);
  objc_storeStrong((id *)&self->_flightNumber, 0);

  objc_storeStrong((id *)&self->_airline, 0);
}

- (INAirportGate)arrivalAirportGate
{
  return self->_arrivalAirportGate;
}

- (INAirportGate)departureAirportGate
{
  return self->_departureAirportGate;
}

- (INDateComponentsRange)flightDuration
{
  return self->_flightDuration;
}

- (INDateComponentsRange)boardingTime
{
  return self->_boardingTime;
}

- (NSString)flightNumber
{
  return self->_flightNumber;
}

- (INAirline)airline
{
  return self->_airline;
}

- (id)_dictionaryRepresentation
{
  v27[6] = *MEMORY[0x1E4F143B8];
  v21 = @"airline";
  airline = self->_airline;
  uint64_t v4 = (uint64_t)airline;
  if (!airline)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v4;
  v27[0] = v4;
  v22 = @"flightNumber";
  flightNumber = self->_flightNumber;
  uint64_t v6 = (uint64_t)flightNumber;
  if (!flightNumber)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v6;
  v27[1] = v6;
  v23 = @"boardingTime";
  boardingTime = self->_boardingTime;
  uint64_t v8 = (uint64_t)boardingTime;
  if (!boardingTime)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v8;
  v27[2] = v8;
  v24 = @"flightDuration";
  flightDuration = self->_flightDuration;
  v10 = flightDuration;
  if (!flightDuration)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v8, v19, v20, v21, v22, v23, v24);
  }
  v27[3] = v10;
  v25 = @"departureAirportGate";
  departureAirportGate = self->_departureAirportGate;
  v12 = departureAirportGate;
  if (!departureAirportGate)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[4] = v12;
  v26 = @"arrivalAirportGate";
  arrivalAirportGate = self->_arrivalAirportGate;
  v14 = arrivalAirportGate;
  if (!arrivalAirportGate)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[5] = v14;
  v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, &v21, 6, v17);
  if (arrivalAirportGate)
  {
    if (departureAirportGate) {
      goto LABEL_15;
    }
  }
  else
  {

    if (departureAirportGate)
    {
LABEL_15:
      if (flightDuration) {
        goto LABEL_16;
      }
      goto LABEL_24;
    }
  }

  if (flightDuration)
  {
LABEL_16:
    if (boardingTime) {
      goto LABEL_17;
    }
    goto LABEL_25;
  }
LABEL_24:

  if (boardingTime)
  {
LABEL_17:
    if (flightNumber) {
      goto LABEL_18;
    }
LABEL_26:

    if (airline) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }
LABEL_25:

  if (!flightNumber) {
    goto LABEL_26;
  }
LABEL_18:
  if (airline) {
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
  v11.super_class = (Class)INFlight;
  uint64_t v6 = [(INFlight *)&v11 description];
  v7 = [(INFlight *)self _dictionaryRepresentation];
  uint64_t v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INFlight *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  uint64_t v8 = [v6 encodeObject:self->_airline];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"airline");

  v9 = [v6 encodeObject:self->_flightNumber];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"flightNumber");

  v10 = [v6 encodeObject:self->_boardingTime];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"boardingTime");

  objc_super v11 = [v6 encodeObject:self->_flightDuration];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"flightDuration");

  v12 = [v6 encodeObject:self->_departureAirportGate];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"departureAirportGate");

  v13 = [v6 encodeObject:self->_arrivalAirportGate];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"arrivalAirportGate");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  airline = self->_airline;
  id v5 = a3;
  [v5 encodeObject:airline forKey:@"airline"];
  [v5 encodeObject:self->_flightNumber forKey:@"flightNumber"];
  [v5 encodeObject:self->_boardingTime forKey:@"boardingTime"];
  [v5 encodeObject:self->_flightDuration forKey:@"flightDuration"];
  [v5 encodeObject:self->_departureAirportGate forKey:@"departureAirportGate"];
  [v5 encodeObject:self->_arrivalAirportGate forKey:@"arrivalAirportGate"];
}

- (INFlight)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"airline"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"flightNumber"];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"boardingTime"];
  objc_super v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flightDuration"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"departureAirportGate"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"arrivalAirportGate"];

  v14 = [(INFlight *)self initWithAirline:v5 flightNumber:v9 boardingTime:v10 flightDuration:v11 departureAirportGate:v12 arrivalAirportGate:v13];
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INFlight *)a3;
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
      airline = self->_airline;
      BOOL v12 = 0;
      if (airline == v5->_airline || -[INAirline isEqual:](airline, "isEqual:"))
      {
        flightNumber = self->_flightNumber;
        if (flightNumber == v5->_flightNumber || -[NSString isEqual:](flightNumber, "isEqual:"))
        {
          boardingTime = self->_boardingTime;
          if (boardingTime == v5->_boardingTime || -[INDateComponentsRange isEqual:](boardingTime, "isEqual:"))
          {
            flightDuration = self->_flightDuration;
            if (flightDuration == v5->_flightDuration || -[INDateComponentsRange isEqual:](flightDuration, "isEqual:"))
            {
              departureAirportGate = self->_departureAirportGate;
              if (departureAirportGate == v5->_departureAirportGate
                || -[INAirportGate isEqual:](departureAirportGate, "isEqual:"))
              {
                arrivalAirportGate = self->_arrivalAirportGate;
                if (arrivalAirportGate == v5->_arrivalAirportGate
                  || -[INAirportGate isEqual:](arrivalAirportGate, "isEqual:"))
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
  unint64_t v3 = [(INAirline *)self->_airline hash];
  NSUInteger v4 = [(NSString *)self->_flightNumber hash] ^ v3;
  unint64_t v5 = [(INDateComponentsRange *)self->_boardingTime hash];
  unint64_t v6 = v4 ^ v5 ^ [(INDateComponentsRange *)self->_flightDuration hash];
  unint64_t v7 = [(INAirportGate *)self->_departureAirportGate hash];
  return v6 ^ v7 ^ [(INAirportGate *)self->_arrivalAirportGate hash];
}

- (INFlight)initWithAirline:(INAirline *)airline flightNumber:(NSString *)flightNumber boardingTime:(INDateComponentsRange *)boardingTime flightDuration:(INDateComponentsRange *)flightDuration departureAirportGate:(INAirportGate *)departureAirportGate arrivalAirportGate:(INAirportGate *)arrivalAirportGate
{
  v14 = airline;
  v15 = flightNumber;
  v16 = boardingTime;
  uint64_t v17 = flightDuration;
  v18 = departureAirportGate;
  v19 = arrivalAirportGate;
  v34.receiver = self;
  v34.super_class = (Class)INFlight;
  v20 = [(INFlight *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [(INAirline *)v14 copy];
    v22 = v20->_airline;
    v20->_airline = (INAirline *)v21;

    uint64_t v23 = [(NSString *)v15 copy];
    v24 = v20->_flightNumber;
    v20->_flightNumber = (NSString *)v23;

    uint64_t v25 = [(INDateComponentsRange *)v16 copy];
    v26 = v20->_boardingTime;
    v20->_boardingTime = (INDateComponentsRange *)v25;

    uint64_t v27 = [(INDateComponentsRange *)v17 copy];
    v28 = v20->_flightDuration;
    v20->_flightDuration = (INDateComponentsRange *)v27;

    uint64_t v29 = [(INAirportGate *)v18 copy];
    v30 = v20->_departureAirportGate;
    v20->_departureAirportGate = (INAirportGate *)v29;

    uint64_t v31 = [(INAirportGate *)v19 copy];
    v32 = v20->_arrivalAirportGate;
    v20->_arrivalAirportGate = (INAirportGate *)v31;
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
    uint64_t v9 = objc_opt_class();
    v10 = [v8 objectForKeyedSubscript:@"airline"];
    objc_super v11 = [v7 decodeObjectOfClass:v9 from:v10];

    BOOL v12 = [v8 objectForKeyedSubscript:@"flightNumber"];
    uint64_t v13 = objc_opt_class();
    v14 = [v8 objectForKeyedSubscript:@"boardingTime"];
    v15 = [v7 decodeObjectOfClass:v13 from:v14];

    uint64_t v16 = objc_opt_class();
    uint64_t v17 = [v8 objectForKeyedSubscript:@"flightDuration"];
    v18 = [v7 decodeObjectOfClass:v16 from:v17];

    uint64_t v19 = objc_opt_class();
    v20 = [v8 objectForKeyedSubscript:@"departureAirportGate"];
    uint64_t v21 = [v7 decodeObjectOfClass:v19 from:v20];

    uint64_t v22 = objc_opt_class();
    uint64_t v23 = [v8 objectForKeyedSubscript:@"arrivalAirportGate"];
    v24 = [v7 decodeObjectOfClass:v22 from:v23];

    uint64_t v25 = (void *)[objc_alloc((Class)a1) initWithAirline:v11 flightNumber:v12 boardingTime:v15 flightDuration:v18 departureAirportGate:v21 arrivalAirportGate:v24];
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end