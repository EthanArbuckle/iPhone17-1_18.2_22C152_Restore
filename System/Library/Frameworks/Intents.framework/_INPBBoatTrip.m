@interface _INPBBoatTrip
+ (BOOL)supportsSecureCoding;
- (BOOL)hasArrivalBoatTerminalLocation;
- (BOOL)hasBoatName;
- (BOOL)hasBoatNumber;
- (BOOL)hasDepartureBoatTerminalLocation;
- (BOOL)hasProvider;
- (BOOL)hasTripDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)boatName;
- (NSString)boatNumber;
- (NSString)provider;
- (_INPBBoatTrip)initWithCoder:(id)a3;
- (_INPBDateTimeRange)tripDuration;
- (_INPBLocationValue)arrivalBoatTerminalLocation;
- (_INPBLocationValue)departureBoatTerminalLocation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setArrivalBoatTerminalLocation:(id)a3;
- (void)setBoatName:(id)a3;
- (void)setBoatNumber:(id)a3;
- (void)setDepartureBoatTerminalLocation:(id)a3;
- (void)setProvider:(id)a3;
- (void)setTripDuration:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBBoatTrip

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripDuration, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_departureBoatTerminalLocation, 0);
  objc_storeStrong((id *)&self->_boatNumber, 0);
  objc_storeStrong((id *)&self->_boatName, 0);

  objc_storeStrong((id *)&self->_arrivalBoatTerminalLocation, 0);
}

- (_INPBDateTimeRange)tripDuration
{
  return self->_tripDuration;
}

- (NSString)provider
{
  return self->_provider;
}

- (_INPBLocationValue)departureBoatTerminalLocation
{
  return self->_departureBoatTerminalLocation;
}

- (NSString)boatNumber
{
  return self->_boatNumber;
}

- (NSString)boatName
{
  return self->_boatName;
}

- (_INPBLocationValue)arrivalBoatTerminalLocation
{
  return self->_arrivalBoatTerminalLocation;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBBoatTrip *)self arrivalBoatTerminalLocation];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"arrivalBoatTerminalLocation"];

  if (self->_boatName)
  {
    v6 = [(_INPBBoatTrip *)self boatName];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"boatName"];
  }
  if (self->_boatNumber)
  {
    v8 = [(_INPBBoatTrip *)self boatNumber];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"boatNumber"];
  }
  v10 = [(_INPBBoatTrip *)self departureBoatTerminalLocation];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"departureBoatTerminalLocation"];

  if (self->_provider)
  {
    v12 = [(_INPBBoatTrip *)self provider];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"provider"];
  }
  v14 = [(_INPBBoatTrip *)self tripDuration];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"tripDuration"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBLocationValue *)self->_arrivalBoatTerminalLocation hash];
  NSUInteger v4 = [(NSString *)self->_boatName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_boatNumber hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBLocationValue *)self->_departureBoatTerminalLocation hash];
  NSUInteger v7 = [(NSString *)self->_provider hash];
  return v6 ^ v7 ^ [(_INPBDateTimeRange *)self->_tripDuration hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  NSUInteger v5 = [(_INPBBoatTrip *)self arrivalBoatTerminalLocation];
  unint64_t v6 = [v4 arrivalBoatTerminalLocation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(_INPBBoatTrip *)self arrivalBoatTerminalLocation];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBBoatTrip *)self arrivalBoatTerminalLocation];
    v10 = [v4 arrivalBoatTerminalLocation];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBBoatTrip *)self boatName];
  unint64_t v6 = [v4 boatName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(_INPBBoatTrip *)self boatName];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBBoatTrip *)self boatName];
    v15 = [v4 boatName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBBoatTrip *)self boatNumber];
  unint64_t v6 = [v4 boatNumber];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(_INPBBoatTrip *)self boatNumber];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBBoatTrip *)self boatNumber];
    v20 = [v4 boatNumber];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBBoatTrip *)self departureBoatTerminalLocation];
  unint64_t v6 = [v4 departureBoatTerminalLocation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(_INPBBoatTrip *)self departureBoatTerminalLocation];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBBoatTrip *)self departureBoatTerminalLocation];
    v25 = [v4 departureBoatTerminalLocation];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBBoatTrip *)self provider];
  unint64_t v6 = [v4 provider];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(_INPBBoatTrip *)self provider];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBBoatTrip *)self provider];
    v30 = [v4 provider];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBBoatTrip *)self tripDuration];
  unint64_t v6 = [v4 tripDuration];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v32 = [(_INPBBoatTrip *)self tripDuration];
    if (!v32)
    {

LABEL_35:
      BOOL v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    v34 = [(_INPBBoatTrip *)self tripDuration];
    v35 = [v4 tripDuration];
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
  NSUInteger v5 = [+[_INPBBoatTrip allocWithZone:](_INPBBoatTrip, "allocWithZone:") init];
  id v6 = [(_INPBLocationValue *)self->_arrivalBoatTerminalLocation copyWithZone:a3];
  [(_INPBBoatTrip *)v5 setArrivalBoatTerminalLocation:v6];

  uint64_t v7 = (void *)[(NSString *)self->_boatName copyWithZone:a3];
  [(_INPBBoatTrip *)v5 setBoatName:v7];

  v8 = (void *)[(NSString *)self->_boatNumber copyWithZone:a3];
  [(_INPBBoatTrip *)v5 setBoatNumber:v8];

  id v9 = [(_INPBLocationValue *)self->_departureBoatTerminalLocation copyWithZone:a3];
  [(_INPBBoatTrip *)v5 setDepartureBoatTerminalLocation:v9];

  v10 = (void *)[(NSString *)self->_provider copyWithZone:a3];
  [(_INPBBoatTrip *)v5 setProvider:v10];

  id v11 = [(_INPBDateTimeRange *)self->_tripDuration copyWithZone:a3];
  [(_INPBBoatTrip *)v5 setTripDuration:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBBoatTrip *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBBoatTrip)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBBoatTrip *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBBoatTrip *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBBoatTrip *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  id v4 = [(_INPBBoatTrip *)self arrivalBoatTerminalLocation];

  if (v4)
  {
    NSUInteger v5 = [(_INPBBoatTrip *)self arrivalBoatTerminalLocation];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBBoatTrip *)self boatName];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_INPBBoatTrip *)self boatNumber];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  v8 = [(_INPBBoatTrip *)self departureBoatTerminalLocation];

  if (v8)
  {
    id v9 = [(_INPBBoatTrip *)self departureBoatTerminalLocation];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(_INPBBoatTrip *)self provider];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  id v11 = [(_INPBBoatTrip *)self tripDuration];

  if (v11)
  {
    uint64_t v12 = [(_INPBBoatTrip *)self tripDuration];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBBoatTripReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTripDuration
{
  return self->_tripDuration != 0;
}

- (void)setTripDuration:(id)a3
{
}

- (BOOL)hasProvider
{
  return self->_provider != 0;
}

- (void)setProvider:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  provider = self->_provider;
  self->_provider = v4;

  MEMORY[0x1F41817F8](v4, provider);
}

- (BOOL)hasDepartureBoatTerminalLocation
{
  return self->_departureBoatTerminalLocation != 0;
}

- (void)setDepartureBoatTerminalLocation:(id)a3
{
}

- (BOOL)hasBoatNumber
{
  return self->_boatNumber != 0;
}

- (void)setBoatNumber:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  boatNumber = self->_boatNumber;
  self->_boatNumber = v4;

  MEMORY[0x1F41817F8](v4, boatNumber);
}

- (BOOL)hasBoatName
{
  return self->_boatName != 0;
}

- (void)setBoatName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  boatName = self->_boatName;
  self->_boatName = v4;

  MEMORY[0x1F41817F8](v4, boatName);
}

- (BOOL)hasArrivalBoatTerminalLocation
{
  return self->_arrivalBoatTerminalLocation != 0;
}

- (void)setArrivalBoatTerminalLocation:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end