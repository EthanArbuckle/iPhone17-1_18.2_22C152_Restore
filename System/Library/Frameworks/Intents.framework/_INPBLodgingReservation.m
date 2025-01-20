@interface _INPBLodgingReservation
+ (BOOL)supportsSecureCoding;
- (BOOL)hasLodgingBusinessLocation;
- (BOOL)hasNumberOfAdults;
- (BOOL)hasNumberOfChildren;
- (BOOL)hasReservation;
- (BOOL)hasReservationDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDateTimeRange)reservationDuration;
- (_INPBInteger)numberOfAdults;
- (_INPBInteger)numberOfChildren;
- (_INPBLocation)lodgingBusinessLocation;
- (_INPBLodgingReservation)initWithCoder:(id)a3;
- (_INPBReservation)reservation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLodgingBusinessLocation:(id)a3;
- (void)setNumberOfAdults:(id)a3;
- (void)setNumberOfChildren:(id)a3;
- (void)setReservation:(id)a3;
- (void)setReservationDuration:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBLodgingReservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservationDuration, 0);
  objc_storeStrong((id *)&self->_reservation, 0);
  objc_storeStrong((id *)&self->_numberOfChildren, 0);
  objc_storeStrong((id *)&self->_numberOfAdults, 0);

  objc_storeStrong((id *)&self->_lodgingBusinessLocation, 0);
}

- (_INPBDateTimeRange)reservationDuration
{
  return self->_reservationDuration;
}

- (_INPBReservation)reservation
{
  return self->_reservation;
}

- (_INPBInteger)numberOfChildren
{
  return self->_numberOfChildren;
}

- (_INPBInteger)numberOfAdults
{
  return self->_numberOfAdults;
}

- (_INPBLocation)lodgingBusinessLocation
{
  return self->_lodgingBusinessLocation;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBLodgingReservation *)self lodgingBusinessLocation];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"lodgingBusinessLocation"];

  v6 = [(_INPBLodgingReservation *)self numberOfAdults];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"numberOfAdults"];

  v8 = [(_INPBLodgingReservation *)self numberOfChildren];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"numberOfChildren"];

  v10 = [(_INPBLodgingReservation *)self reservation];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"reservation"];

  v12 = [(_INPBLodgingReservation *)self reservationDuration];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"reservationDuration"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBLocation *)self->_lodgingBusinessLocation hash];
  unint64_t v4 = [(_INPBInteger *)self->_numberOfAdults hash] ^ v3;
  unint64_t v5 = [(_INPBInteger *)self->_numberOfChildren hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBReservation *)self->_reservation hash];
  return v6 ^ [(_INPBDateTimeRange *)self->_reservationDuration hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  unint64_t v5 = [(_INPBLodgingReservation *)self lodgingBusinessLocation];
  unint64_t v6 = [v4 lodgingBusinessLocation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(_INPBLodgingReservation *)self lodgingBusinessLocation];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBLodgingReservation *)self lodgingBusinessLocation];
    v10 = [v4 lodgingBusinessLocation];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBLodgingReservation *)self numberOfAdults];
  unint64_t v6 = [v4 numberOfAdults];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(_INPBLodgingReservation *)self numberOfAdults];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBLodgingReservation *)self numberOfAdults];
    v15 = [v4 numberOfAdults];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBLodgingReservation *)self numberOfChildren];
  unint64_t v6 = [v4 numberOfChildren];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(_INPBLodgingReservation *)self numberOfChildren];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBLodgingReservation *)self numberOfChildren];
    v20 = [v4 numberOfChildren];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBLodgingReservation *)self reservation];
  unint64_t v6 = [v4 reservation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(_INPBLodgingReservation *)self reservation];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBLodgingReservation *)self reservation];
    v25 = [v4 reservation];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBLodgingReservation *)self reservationDuration];
  unint64_t v6 = [v4 reservationDuration];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_INPBLodgingReservation *)self reservationDuration];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(_INPBLodgingReservation *)self reservationDuration];
    v30 = [v4 reservationDuration];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBLodgingReservation allocWithZone:](_INPBLodgingReservation, "allocWithZone:") init];
  id v6 = [(_INPBLocation *)self->_lodgingBusinessLocation copyWithZone:a3];
  [(_INPBLodgingReservation *)v5 setLodgingBusinessLocation:v6];

  id v7 = [(_INPBInteger *)self->_numberOfAdults copyWithZone:a3];
  [(_INPBLodgingReservation *)v5 setNumberOfAdults:v7];

  id v8 = [(_INPBInteger *)self->_numberOfChildren copyWithZone:a3];
  [(_INPBLodgingReservation *)v5 setNumberOfChildren:v8];

  id v9 = [(_INPBReservation *)self->_reservation copyWithZone:a3];
  [(_INPBLodgingReservation *)v5 setReservation:v9];

  id v10 = [(_INPBDateTimeRange *)self->_reservationDuration copyWithZone:a3];
  [(_INPBLodgingReservation *)v5 setReservationDuration:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBLodgingReservation *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBLodgingReservation)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBLodgingReservation *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBLodgingReservation *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBLodgingReservation *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  id v4 = [(_INPBLodgingReservation *)self lodgingBusinessLocation];

  if (v4)
  {
    unint64_t v5 = [(_INPBLodgingReservation *)self lodgingBusinessLocation];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBLodgingReservation *)self numberOfAdults];

  if (v6)
  {
    uint64_t v7 = [(_INPBLodgingReservation *)self numberOfAdults];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBLodgingReservation *)self numberOfChildren];

  if (v8)
  {
    id v9 = [(_INPBLodgingReservation *)self numberOfChildren];
    PBDataWriterWriteSubmessage();
  }
  id v10 = [(_INPBLodgingReservation *)self reservation];

  if (v10)
  {
    int v11 = [(_INPBLodgingReservation *)self reservation];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(_INPBLodgingReservation *)self reservationDuration];

  if (v12)
  {
    v13 = [(_INPBLodgingReservation *)self reservationDuration];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBLodgingReservationReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasReservationDuration
{
  return self->_reservationDuration != 0;
}

- (void)setReservationDuration:(id)a3
{
}

- (BOOL)hasReservation
{
  return self->_reservation != 0;
}

- (void)setReservation:(id)a3
{
}

- (BOOL)hasNumberOfChildren
{
  return self->_numberOfChildren != 0;
}

- (void)setNumberOfChildren:(id)a3
{
}

- (BOOL)hasNumberOfAdults
{
  return self->_numberOfAdults != 0;
}

- (void)setNumberOfAdults:(id)a3
{
}

- (BOOL)hasLodgingBusinessLocation
{
  return self->_lodgingBusinessLocation != 0;
}

- (void)setLodgingBusinessLocation:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end