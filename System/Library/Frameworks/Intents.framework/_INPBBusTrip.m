@interface _INPBBusTrip
+ (BOOL)supportsSecureCoding;
- (BOOL)hasArrivalBusStopLocation;
- (BOOL)hasArrivalPlatform;
- (BOOL)hasBusName;
- (BOOL)hasBusNumber;
- (BOOL)hasDepartureBusStopLocation;
- (BOOL)hasDeparturePlatform;
- (BOOL)hasProvider;
- (BOOL)hasTripDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)arrivalPlatform;
- (NSString)busName;
- (NSString)busNumber;
- (NSString)departurePlatform;
- (NSString)provider;
- (_INPBBusTrip)initWithCoder:(id)a3;
- (_INPBDateTimeRange)tripDuration;
- (_INPBLocationValue)arrivalBusStopLocation;
- (_INPBLocationValue)departureBusStopLocation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setArrivalBusStopLocation:(id)a3;
- (void)setArrivalPlatform:(id)a3;
- (void)setBusName:(id)a3;
- (void)setBusNumber:(id)a3;
- (void)setDepartureBusStopLocation:(id)a3;
- (void)setDeparturePlatform:(id)a3;
- (void)setProvider:(id)a3;
- (void)setTripDuration:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBBusTrip

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripDuration, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_departurePlatform, 0);
  objc_storeStrong((id *)&self->_departureBusStopLocation, 0);
  objc_storeStrong((id *)&self->_busNumber, 0);
  objc_storeStrong((id *)&self->_busName, 0);
  objc_storeStrong((id *)&self->_arrivalPlatform, 0);

  objc_storeStrong((id *)&self->_arrivalBusStopLocation, 0);
}

- (_INPBDateTimeRange)tripDuration
{
  return self->_tripDuration;
}

- (NSString)provider
{
  return self->_provider;
}

- (NSString)departurePlatform
{
  return self->_departurePlatform;
}

- (_INPBLocationValue)departureBusStopLocation
{
  return self->_departureBusStopLocation;
}

- (NSString)busNumber
{
  return self->_busNumber;
}

- (NSString)busName
{
  return self->_busName;
}

- (NSString)arrivalPlatform
{
  return self->_arrivalPlatform;
}

- (_INPBLocationValue)arrivalBusStopLocation
{
  return self->_arrivalBusStopLocation;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBBusTrip *)self arrivalBusStopLocation];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"arrivalBusStopLocation"];

  if (self->_arrivalPlatform)
  {
    v6 = [(_INPBBusTrip *)self arrivalPlatform];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"arrivalPlatform"];
  }
  if (self->_busName)
  {
    v8 = [(_INPBBusTrip *)self busName];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"busName"];
  }
  if (self->_busNumber)
  {
    v10 = [(_INPBBusTrip *)self busNumber];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"busNumber"];
  }
  v12 = [(_INPBBusTrip *)self departureBusStopLocation];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"departureBusStopLocation"];

  if (self->_departurePlatform)
  {
    v14 = [(_INPBBusTrip *)self departurePlatform];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"departurePlatform"];
  }
  if (self->_provider)
  {
    v16 = [(_INPBBusTrip *)self provider];
    v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"provider"];
  }
  v18 = [(_INPBBusTrip *)self tripDuration];
  v19 = [v18 dictionaryRepresentation];
  [v3 setObject:v19 forKeyedSubscript:@"tripDuration"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBLocationValue *)self->_arrivalBusStopLocation hash];
  NSUInteger v4 = [(NSString *)self->_arrivalPlatform hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_busName hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_busNumber hash];
  unint64_t v7 = [(_INPBLocationValue *)self->_departureBusStopLocation hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_departurePlatform hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_provider hash];
  return v9 ^ [(_INPBDateTimeRange *)self->_tripDuration hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  NSUInteger v5 = [(_INPBBusTrip *)self arrivalBusStopLocation];
  NSUInteger v6 = [v4 arrivalBusStopLocation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v7 = [(_INPBBusTrip *)self arrivalBusStopLocation];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    NSUInteger v9 = [(_INPBBusTrip *)self arrivalBusStopLocation];
    v10 = [v4 arrivalBusStopLocation];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBBusTrip *)self arrivalPlatform];
  NSUInteger v6 = [v4 arrivalPlatform];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v12 = [(_INPBBusTrip *)self arrivalPlatform];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBBusTrip *)self arrivalPlatform];
    v15 = [v4 arrivalPlatform];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBBusTrip *)self busName];
  NSUInteger v6 = [v4 busName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v17 = [(_INPBBusTrip *)self busName];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBBusTrip *)self busName];
    v20 = [v4 busName];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBBusTrip *)self busNumber];
  NSUInteger v6 = [v4 busNumber];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v22 = [(_INPBBusTrip *)self busNumber];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBBusTrip *)self busNumber];
    v25 = [v4 busNumber];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBBusTrip *)self departureBusStopLocation];
  NSUInteger v6 = [v4 departureBusStopLocation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v27 = [(_INPBBusTrip *)self departureBusStopLocation];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBBusTrip *)self departureBusStopLocation];
    v30 = [v4 departureBusStopLocation];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBBusTrip *)self departurePlatform];
  NSUInteger v6 = [v4 departurePlatform];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v32 = [(_INPBBusTrip *)self departurePlatform];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_INPBBusTrip *)self departurePlatform];
    v35 = [v4 departurePlatform];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBBusTrip *)self provider];
  NSUInteger v6 = [v4 provider];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v37 = [(_INPBBusTrip *)self provider];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_INPBBusTrip *)self provider];
    v40 = [v4 provider];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBBusTrip *)self tripDuration];
  NSUInteger v6 = [v4 tripDuration];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v42 = [(_INPBBusTrip *)self tripDuration];
    if (!v42)
    {

LABEL_45:
      BOOL v47 = 1;
      goto LABEL_43;
    }
    v43 = (void *)v42;
    v44 = [(_INPBBusTrip *)self tripDuration];
    v45 = [v4 tripDuration];
    char v46 = [v44 isEqual:v45];

    if (v46) {
      goto LABEL_45;
    }
  }
  else
  {
LABEL_41:
  }
LABEL_42:
  BOOL v47 = 0;
LABEL_43:

  return v47;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBBusTrip allocWithZone:](_INPBBusTrip, "allocWithZone:") init];
  id v6 = [(_INPBLocationValue *)self->_arrivalBusStopLocation copyWithZone:a3];
  [(_INPBBusTrip *)v5 setArrivalBusStopLocation:v6];

  uint64_t v7 = (void *)[(NSString *)self->_arrivalPlatform copyWithZone:a3];
  [(_INPBBusTrip *)v5 setArrivalPlatform:v7];

  NSUInteger v8 = (void *)[(NSString *)self->_busName copyWithZone:a3];
  [(_INPBBusTrip *)v5 setBusName:v8];

  NSUInteger v9 = (void *)[(NSString *)self->_busNumber copyWithZone:a3];
  [(_INPBBusTrip *)v5 setBusNumber:v9];

  id v10 = [(_INPBLocationValue *)self->_departureBusStopLocation copyWithZone:a3];
  [(_INPBBusTrip *)v5 setDepartureBusStopLocation:v10];

  int v11 = (void *)[(NSString *)self->_departurePlatform copyWithZone:a3];
  [(_INPBBusTrip *)v5 setDeparturePlatform:v11];

  uint64_t v12 = (void *)[(NSString *)self->_provider copyWithZone:a3];
  [(_INPBBusTrip *)v5 setProvider:v12];

  id v13 = [(_INPBDateTimeRange *)self->_tripDuration copyWithZone:a3];
  [(_INPBBusTrip *)v5 setTripDuration:v13];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBBusTrip *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBBusTrip)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBBusTrip *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        NSUInteger v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBBusTrip *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBBusTrip *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v15 = a3;
  id v4 = [(_INPBBusTrip *)self arrivalBusStopLocation];

  if (v4)
  {
    NSUInteger v5 = [(_INPBBusTrip *)self arrivalBusStopLocation];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBBusTrip *)self arrivalPlatform];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_INPBBusTrip *)self busName];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v8 = [(_INPBBusTrip *)self busNumber];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v9 = [(_INPBBusTrip *)self departureBusStopLocation];

  if (v9)
  {
    id v10 = [(_INPBBusTrip *)self departureBusStopLocation];
    PBDataWriterWriteSubmessage();
  }
  int v11 = [(_INPBBusTrip *)self departurePlatform];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  uint64_t v12 = [(_INPBBusTrip *)self provider];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  id v13 = [(_INPBBusTrip *)self tripDuration];

  if (v13)
  {
    v14 = [(_INPBBusTrip *)self tripDuration];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBBusTripReadFrom(self, (uint64_t)a3);
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

- (BOOL)hasDeparturePlatform
{
  return self->_departurePlatform != 0;
}

- (void)setDeparturePlatform:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  departurePlatform = self->_departurePlatform;
  self->_departurePlatform = v4;

  MEMORY[0x1F41817F8](v4, departurePlatform);
}

- (BOOL)hasDepartureBusStopLocation
{
  return self->_departureBusStopLocation != 0;
}

- (void)setDepartureBusStopLocation:(id)a3
{
}

- (BOOL)hasBusNumber
{
  return self->_busNumber != 0;
}

- (void)setBusNumber:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  busNumber = self->_busNumber;
  self->_busNumber = v4;

  MEMORY[0x1F41817F8](v4, busNumber);
}

- (BOOL)hasBusName
{
  return self->_busName != 0;
}

- (void)setBusName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  busName = self->_busName;
  self->_busName = v4;

  MEMORY[0x1F41817F8](v4, busName);
}

- (BOOL)hasArrivalPlatform
{
  return self->_arrivalPlatform != 0;
}

- (void)setArrivalPlatform:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  arrivalPlatform = self->_arrivalPlatform;
  self->_arrivalPlatform = v4;

  MEMORY[0x1F41817F8](v4, arrivalPlatform);
}

- (BOOL)hasArrivalBusStopLocation
{
  return self->_arrivalBusStopLocation != 0;
}

- (void)setArrivalBusStopLocation:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end