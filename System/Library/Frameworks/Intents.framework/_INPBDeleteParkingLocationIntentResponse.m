@interface _INPBDeleteParkingLocationIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasParkingLocation;
- (BOOL)hasParkingNote;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDeleteParkingLocationIntentResponse)initWithCoder:(id)a3;
- (_INPBLocation)parkingLocation;
- (_INPBString)parkingNote;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setParkingLocation:(id)a3;
- (void)setParkingNote:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBDeleteParkingLocationIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parkingNote, 0);

  objc_storeStrong((id *)&self->_parkingLocation, 0);
}

- (_INPBString)parkingNote
{
  return self->_parkingNote;
}

- (_INPBLocation)parkingLocation
{
  return self->_parkingLocation;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBDeleteParkingLocationIntentResponse *)self parkingLocation];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"parkingLocation"];

  v6 = [(_INPBDeleteParkingLocationIntentResponse *)self parkingNote];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"parkingNote"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBLocation *)self->_parkingLocation hash];
  return [(_INPBString *)self->_parkingNote hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBDeleteParkingLocationIntentResponse *)self parkingLocation];
  v6 = [v4 parkingLocation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBDeleteParkingLocationIntentResponse *)self parkingLocation];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBDeleteParkingLocationIntentResponse *)self parkingLocation];
    v10 = [v4 parkingLocation];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBDeleteParkingLocationIntentResponse *)self parkingNote];
  v6 = [v4 parkingNote];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBDeleteParkingLocationIntentResponse *)self parkingNote];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBDeleteParkingLocationIntentResponse *)self parkingNote];
    v15 = [v4 parkingNote];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBDeleteParkingLocationIntentResponse allocWithZone:](_INPBDeleteParkingLocationIntentResponse, "allocWithZone:") init];
  id v6 = [(_INPBLocation *)self->_parkingLocation copyWithZone:a3];
  [(_INPBDeleteParkingLocationIntentResponse *)v5 setParkingLocation:v6];

  id v7 = [(_INPBString *)self->_parkingNote copyWithZone:a3];
  [(_INPBDeleteParkingLocationIntentResponse *)v5 setParkingNote:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBDeleteParkingLocationIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBDeleteParkingLocationIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBDeleteParkingLocationIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBDeleteParkingLocationIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBDeleteParkingLocationIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_INPBDeleteParkingLocationIntentResponse *)self parkingLocation];

  if (v4)
  {
    v5 = [(_INPBDeleteParkingLocationIntentResponse *)self parkingLocation];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBDeleteParkingLocationIntentResponse *)self parkingNote];

  if (v6)
  {
    uint64_t v7 = [(_INPBDeleteParkingLocationIntentResponse *)self parkingNote];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDeleteParkingLocationIntentResponseReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasParkingNote
{
  return self->_parkingNote != 0;
}

- (void)setParkingNote:(id)a3
{
}

- (BOOL)hasParkingLocation
{
  return self->_parkingLocation != 0;
}

- (void)setParkingLocation:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end