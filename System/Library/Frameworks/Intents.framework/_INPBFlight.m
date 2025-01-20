@interface _INPBFlight
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAirline;
- (BOOL)hasArrivalAirportGate;
- (BOOL)hasBoardingTime;
- (BOOL)hasDepartureAirportGate;
- (BOOL)hasFlightDuration;
- (BOOL)hasFlightNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)flightNumber;
- (_INPBAirline)airline;
- (_INPBAirportGate)arrivalAirportGate;
- (_INPBAirportGate)departureAirportGate;
- (_INPBDateTimeRange)boardingTime;
- (_INPBDateTimeRange)flightDuration;
- (_INPBFlight)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAirline:(id)a3;
- (void)setArrivalAirportGate:(id)a3;
- (void)setBoardingTime:(id)a3;
- (void)setDepartureAirportGate:(id)a3;
- (void)setFlightDuration:(id)a3;
- (void)setFlightNumber:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBFlight

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flightNumber, 0);
  objc_storeStrong((id *)&self->_flightDuration, 0);
  objc_storeStrong((id *)&self->_departureAirportGate, 0);
  objc_storeStrong((id *)&self->_boardingTime, 0);
  objc_storeStrong((id *)&self->_arrivalAirportGate, 0);

  objc_storeStrong((id *)&self->_airline, 0);
}

- (NSString)flightNumber
{
  return self->_flightNumber;
}

- (_INPBDateTimeRange)flightDuration
{
  return self->_flightDuration;
}

- (_INPBAirportGate)departureAirportGate
{
  return self->_departureAirportGate;
}

- (_INPBDateTimeRange)boardingTime
{
  return self->_boardingTime;
}

- (_INPBAirportGate)arrivalAirportGate
{
  return self->_arrivalAirportGate;
}

- (_INPBAirline)airline
{
  return self->_airline;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBFlight *)self airline];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"airline"];

  v6 = [(_INPBFlight *)self arrivalAirportGate];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"arrivalAirportGate"];

  v8 = [(_INPBFlight *)self boardingTime];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"boardingTime"];

  v10 = [(_INPBFlight *)self departureAirportGate];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"departureAirportGate"];

  v12 = [(_INPBFlight *)self flightDuration];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"flightDuration"];

  if (self->_flightNumber)
  {
    v14 = [(_INPBFlight *)self flightNumber];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"flightNumber"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBAirline *)self->_airline hash];
  unint64_t v4 = [(_INPBAirportGate *)self->_arrivalAirportGate hash] ^ v3;
  unint64_t v5 = [(_INPBDateTimeRange *)self->_boardingTime hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBAirportGate *)self->_departureAirportGate hash];
  unint64_t v7 = [(_INPBDateTimeRange *)self->_flightDuration hash];
  return v6 ^ v7 ^ [(NSString *)self->_flightNumber hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  unint64_t v5 = [(_INPBFlight *)self airline];
  unint64_t v6 = [v4 airline];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(_INPBFlight *)self airline];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBFlight *)self airline];
    v10 = [v4 airline];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBFlight *)self arrivalAirportGate];
  unint64_t v6 = [v4 arrivalAirportGate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(_INPBFlight *)self arrivalAirportGate];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBFlight *)self arrivalAirportGate];
    v15 = [v4 arrivalAirportGate];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBFlight *)self boardingTime];
  unint64_t v6 = [v4 boardingTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(_INPBFlight *)self boardingTime];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBFlight *)self boardingTime];
    v20 = [v4 boardingTime];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBFlight *)self departureAirportGate];
  unint64_t v6 = [v4 departureAirportGate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(_INPBFlight *)self departureAirportGate];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBFlight *)self departureAirportGate];
    v25 = [v4 departureAirportGate];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBFlight *)self flightDuration];
  unint64_t v6 = [v4 flightDuration];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(_INPBFlight *)self flightDuration];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBFlight *)self flightDuration];
    v30 = [v4 flightDuration];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBFlight *)self flightNumber];
  unint64_t v6 = [v4 flightNumber];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v32 = [(_INPBFlight *)self flightNumber];
    if (!v32)
    {

LABEL_35:
      BOOL v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    v34 = [(_INPBFlight *)self flightNumber];
    v35 = [v4 flightNumber];
    char v36 = [v34 isEqual:v35];

    if (v36) {
      goto LABEL_35;
    }
  }
  else
  {
LABEL_31:
  }
LABEL_32:
  BOOL v37 = 0;
LABEL_33:

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBFlight allocWithZone:](_INPBFlight, "allocWithZone:") init];
  id v6 = [(_INPBAirline *)self->_airline copyWithZone:a3];
  [(_INPBFlight *)v5 setAirline:v6];

  id v7 = [(_INPBAirportGate *)self->_arrivalAirportGate copyWithZone:a3];
  [(_INPBFlight *)v5 setArrivalAirportGate:v7];

  id v8 = [(_INPBDateTimeRange *)self->_boardingTime copyWithZone:a3];
  [(_INPBFlight *)v5 setBoardingTime:v8];

  id v9 = [(_INPBAirportGate *)self->_departureAirportGate copyWithZone:a3];
  [(_INPBFlight *)v5 setDepartureAirportGate:v9];

  id v10 = [(_INPBDateTimeRange *)self->_flightDuration copyWithZone:a3];
  [(_INPBFlight *)v5 setFlightDuration:v10];

  int v11 = (void *)[(NSString *)self->_flightNumber copyWithZone:a3];
  [(_INPBFlight *)v5 setFlightNumber:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBFlight *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBFlight)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBFlight *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBFlight *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBFlight *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v16 = a3;
  id v4 = [(_INPBFlight *)self airline];

  if (v4)
  {
    unint64_t v5 = [(_INPBFlight *)self airline];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBFlight *)self arrivalAirportGate];

  if (v6)
  {
    uint64_t v7 = [(_INPBFlight *)self arrivalAirportGate];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBFlight *)self boardingTime];

  if (v8)
  {
    id v9 = [(_INPBFlight *)self boardingTime];
    PBDataWriterWriteSubmessage();
  }
  id v10 = [(_INPBFlight *)self departureAirportGate];

  if (v10)
  {
    int v11 = [(_INPBFlight *)self departureAirportGate];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(_INPBFlight *)self flightDuration];

  if (v12)
  {
    v13 = [(_INPBFlight *)self flightDuration];
    PBDataWriterWriteSubmessage();
  }
  v14 = [(_INPBFlight *)self flightNumber];

  v15 = v16;
  if (v14)
  {
    PBDataWriterWriteStringField();
    v15 = v16;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBFlightReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasFlightNumber
{
  return self->_flightNumber != 0;
}

- (void)setFlightNumber:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  flightNumber = self->_flightNumber;
  self->_flightNumber = v4;

  MEMORY[0x1F41817F8](v4, flightNumber);
}

- (BOOL)hasFlightDuration
{
  return self->_flightDuration != 0;
}

- (void)setFlightDuration:(id)a3
{
}

- (BOOL)hasDepartureAirportGate
{
  return self->_departureAirportGate != 0;
}

- (void)setDepartureAirportGate:(id)a3
{
}

- (BOOL)hasBoardingTime
{
  return self->_boardingTime != 0;
}

- (void)setBoardingTime:(id)a3
{
}

- (BOOL)hasArrivalAirportGate
{
  return self->_arrivalAirportGate != 0;
}

- (void)setArrivalAirportGate:(id)a3
{
}

- (BOOL)hasAirline
{
  return self->_airline != 0;
}

- (void)setAirline:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end