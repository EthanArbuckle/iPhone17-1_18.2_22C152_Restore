@interface _INPBTrainTrip
+ (BOOL)supportsSecureCoding;
- (BOOL)hasArrivalPlatform;
- (BOOL)hasArrivalStationLocation;
- (BOOL)hasDeparturePlatform;
- (BOOL)hasDepartureStationLocation;
- (BOOL)hasOnlineCheckInTime;
- (BOOL)hasProvider;
- (BOOL)hasTrainName;
- (BOOL)hasTrainNumber;
- (BOOL)hasTripDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)arrivalPlatform;
- (NSString)departurePlatform;
- (NSString)provider;
- (NSString)trainName;
- (NSString)trainNumber;
- (_INPBDateTime)onlineCheckInTime;
- (_INPBDateTimeRange)tripDuration;
- (_INPBLocationValue)arrivalStationLocation;
- (_INPBLocationValue)departureStationLocation;
- (_INPBTrainTrip)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setArrivalPlatform:(id)a3;
- (void)setArrivalStationLocation:(id)a3;
- (void)setDeparturePlatform:(id)a3;
- (void)setDepartureStationLocation:(id)a3;
- (void)setOnlineCheckInTime:(id)a3;
- (void)setProvider:(id)a3;
- (void)setTrainName:(id)a3;
- (void)setTrainNumber:(id)a3;
- (void)setTripDuration:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBTrainTrip

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripDuration, 0);
  objc_storeStrong((id *)&self->_trainNumber, 0);
  objc_storeStrong((id *)&self->_trainName, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_onlineCheckInTime, 0);
  objc_storeStrong((id *)&self->_departureStationLocation, 0);
  objc_storeStrong((id *)&self->_departurePlatform, 0);
  objc_storeStrong((id *)&self->_arrivalStationLocation, 0);

  objc_storeStrong((id *)&self->_arrivalPlatform, 0);
}

- (_INPBDateTimeRange)tripDuration
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

- (_INPBDateTime)onlineCheckInTime
{
  return self->_onlineCheckInTime;
}

- (_INPBLocationValue)departureStationLocation
{
  return self->_departureStationLocation;
}

- (NSString)departurePlatform
{
  return self->_departurePlatform;
}

- (_INPBLocationValue)arrivalStationLocation
{
  return self->_arrivalStationLocation;
}

- (NSString)arrivalPlatform
{
  return self->_arrivalPlatform;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_arrivalPlatform)
  {
    v4 = [(_INPBTrainTrip *)self arrivalPlatform];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"arrivalPlatform"];
  }
  v6 = [(_INPBTrainTrip *)self arrivalStationLocation];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"arrivalStationLocation"];

  if (self->_departurePlatform)
  {
    v8 = [(_INPBTrainTrip *)self departurePlatform];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"departurePlatform"];
  }
  v10 = [(_INPBTrainTrip *)self departureStationLocation];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"departureStationLocation"];

  v12 = [(_INPBTrainTrip *)self onlineCheckInTime];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"onlineCheckInTime"];

  if (self->_provider)
  {
    v14 = [(_INPBTrainTrip *)self provider];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"provider"];
  }
  if (self->_trainName)
  {
    v16 = [(_INPBTrainTrip *)self trainName];
    v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"trainName"];
  }
  if (self->_trainNumber)
  {
    v18 = [(_INPBTrainTrip *)self trainNumber];
    v19 = (void *)[v18 copy];
    [v3 setObject:v19 forKeyedSubscript:@"trainNumber"];
  }
  v20 = [(_INPBTrainTrip *)self tripDuration];
  v21 = [v20 dictionaryRepresentation];
  [v3 setObject:v21 forKeyedSubscript:@"tripDuration"];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_arrivalPlatform hash];
  unint64_t v4 = [(_INPBLocationValue *)self->_arrivalStationLocation hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_departurePlatform hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBLocationValue *)self->_departureStationLocation hash];
  unint64_t v7 = [(_INPBDateTime *)self->_onlineCheckInTime hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_provider hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_trainName hash];
  NSUInteger v10 = [(NSString *)self->_trainNumber hash];
  return v9 ^ v10 ^ [(_INPBDateTimeRange *)self->_tripDuration hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  NSUInteger v5 = [(_INPBTrainTrip *)self arrivalPlatform];
  unint64_t v6 = [v4 arrivalPlatform];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v7 = [(_INPBTrainTrip *)self arrivalPlatform];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    NSUInteger v9 = [(_INPBTrainTrip *)self arrivalPlatform];
    NSUInteger v10 = [v4 arrivalPlatform];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBTrainTrip *)self arrivalStationLocation];
  unint64_t v6 = [v4 arrivalStationLocation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v12 = [(_INPBTrainTrip *)self arrivalStationLocation];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBTrainTrip *)self arrivalStationLocation];
    v15 = [v4 arrivalStationLocation];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBTrainTrip *)self departurePlatform];
  unint64_t v6 = [v4 departurePlatform];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v17 = [(_INPBTrainTrip *)self departurePlatform];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBTrainTrip *)self departurePlatform];
    v20 = [v4 departurePlatform];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBTrainTrip *)self departureStationLocation];
  unint64_t v6 = [v4 departureStationLocation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v22 = [(_INPBTrainTrip *)self departureStationLocation];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBTrainTrip *)self departureStationLocation];
    v25 = [v4 departureStationLocation];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBTrainTrip *)self onlineCheckInTime];
  unint64_t v6 = [v4 onlineCheckInTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v27 = [(_INPBTrainTrip *)self onlineCheckInTime];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBTrainTrip *)self onlineCheckInTime];
    v30 = [v4 onlineCheckInTime];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBTrainTrip *)self provider];
  unint64_t v6 = [v4 provider];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v32 = [(_INPBTrainTrip *)self provider];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_INPBTrainTrip *)self provider];
    v35 = [v4 provider];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBTrainTrip *)self trainName];
  unint64_t v6 = [v4 trainName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v37 = [(_INPBTrainTrip *)self trainName];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_INPBTrainTrip *)self trainName];
    v40 = [v4 trainName];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBTrainTrip *)self trainNumber];
  unint64_t v6 = [v4 trainNumber];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v42 = [(_INPBTrainTrip *)self trainNumber];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(_INPBTrainTrip *)self trainNumber];
    v45 = [v4 trainNumber];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_INPBTrainTrip *)self tripDuration];
  unint64_t v6 = [v4 tripDuration];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v47 = [(_INPBTrainTrip *)self tripDuration];
    if (!v47)
    {

LABEL_50:
      BOOL v52 = 1;
      goto LABEL_48;
    }
    v48 = (void *)v47;
    v49 = [(_INPBTrainTrip *)self tripDuration];
    v50 = [v4 tripDuration];
    char v51 = [v49 isEqual:v50];

    if (v51) {
      goto LABEL_50;
    }
  }
  else
  {
LABEL_46:
  }
LABEL_47:
  BOOL v52 = 0;
LABEL_48:

  return v52;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[_INPBTrainTrip allocWithZone:](_INPBTrainTrip, "allocWithZone:") init];
  unint64_t v6 = (void *)[(NSString *)self->_arrivalPlatform copyWithZone:a3];
  [(_INPBTrainTrip *)v5 setArrivalPlatform:v6];

  id v7 = [(_INPBLocationValue *)self->_arrivalStationLocation copyWithZone:a3];
  [(_INPBTrainTrip *)v5 setArrivalStationLocation:v7];

  NSUInteger v8 = (void *)[(NSString *)self->_departurePlatform copyWithZone:a3];
  [(_INPBTrainTrip *)v5 setDeparturePlatform:v8];

  id v9 = [(_INPBLocationValue *)self->_departureStationLocation copyWithZone:a3];
  [(_INPBTrainTrip *)v5 setDepartureStationLocation:v9];

  id v10 = [(_INPBDateTime *)self->_onlineCheckInTime copyWithZone:a3];
  [(_INPBTrainTrip *)v5 setOnlineCheckInTime:v10];

  int v11 = (void *)[(NSString *)self->_provider copyWithZone:a3];
  [(_INPBTrainTrip *)v5 setProvider:v11];

  uint64_t v12 = (void *)[(NSString *)self->_trainName copyWithZone:a3];
  [(_INPBTrainTrip *)v5 setTrainName:v12];

  v13 = (void *)[(NSString *)self->_trainNumber copyWithZone:a3];
  [(_INPBTrainTrip *)v5 setTrainNumber:v13];

  id v14 = [(_INPBDateTimeRange *)self->_tripDuration copyWithZone:a3];
  [(_INPBTrainTrip *)v5 setTripDuration:v14];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBTrainTrip *)self data];
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBTrainTrip)initWithCoder:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBTrainTrip *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        NSUInteger v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBTrainTrip *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBTrainTrip *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v17 = a3;
  id v4 = [(_INPBTrainTrip *)self arrivalPlatform];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(_INPBTrainTrip *)self arrivalStationLocation];

  if (v5)
  {
    id v6 = [(_INPBTrainTrip *)self arrivalStationLocation];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBTrainTrip *)self departurePlatform];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v8 = [(_INPBTrainTrip *)self departureStationLocation];

  if (v8)
  {
    id v9 = [(_INPBTrainTrip *)self departureStationLocation];
    PBDataWriterWriteSubmessage();
  }
  id v10 = [(_INPBTrainTrip *)self onlineCheckInTime];

  if (v10)
  {
    int v11 = [(_INPBTrainTrip *)self onlineCheckInTime];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(_INPBTrainTrip *)self provider];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  v13 = [(_INPBTrainTrip *)self trainName];

  if (v13) {
    PBDataWriterWriteStringField();
  }
  id v14 = [(_INPBTrainTrip *)self trainNumber];

  if (v14) {
    PBDataWriterWriteStringField();
  }
  v15 = [(_INPBTrainTrip *)self tripDuration];

  if (v15)
  {
    int v16 = [(_INPBTrainTrip *)self tripDuration];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBTrainTripReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTripDuration
{
  return self->_tripDuration != 0;
}

- (void)setTripDuration:(id)a3
{
}

- (BOOL)hasTrainNumber
{
  return self->_trainNumber != 0;
}

- (void)setTrainNumber:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  trainNumber = self->_trainNumber;
  self->_trainNumber = v4;

  MEMORY[0x1F41817F8](v4, trainNumber);
}

- (BOOL)hasTrainName
{
  return self->_trainName != 0;
}

- (void)setTrainName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  trainName = self->_trainName;
  self->_trainName = v4;

  MEMORY[0x1F41817F8](v4, trainName);
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

- (BOOL)hasOnlineCheckInTime
{
  return self->_onlineCheckInTime != 0;
}

- (void)setOnlineCheckInTime:(id)a3
{
}

- (BOOL)hasDepartureStationLocation
{
  return self->_departureStationLocation != 0;
}

- (void)setDepartureStationLocation:(id)a3
{
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

- (BOOL)hasArrivalStationLocation
{
  return self->_arrivalStationLocation != 0;
}

- (void)setArrivalStationLocation:(id)a3
{
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end