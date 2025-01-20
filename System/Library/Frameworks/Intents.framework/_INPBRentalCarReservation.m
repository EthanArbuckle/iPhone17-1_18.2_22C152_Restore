@interface _INPBRentalCarReservation
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDropOffLocation;
- (BOOL)hasPickupLocation;
- (BOOL)hasRentalCar;
- (BOOL)hasRentalDuration;
- (BOOL)hasReservation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDateTimeRange)rentalDuration;
- (_INPBLocationValue)dropOffLocation;
- (_INPBLocationValue)pickupLocation;
- (_INPBRentalCar)rentalCar;
- (_INPBRentalCarReservation)initWithCoder:(id)a3;
- (_INPBReservation)reservation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDropOffLocation:(id)a3;
- (void)setPickupLocation:(id)a3;
- (void)setRentalCar:(id)a3;
- (void)setRentalDuration:(id)a3;
- (void)setReservation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBRentalCarReservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservation, 0);
  objc_storeStrong((id *)&self->_rentalDuration, 0);
  objc_storeStrong((id *)&self->_rentalCar, 0);
  objc_storeStrong((id *)&self->_pickupLocation, 0);

  objc_storeStrong((id *)&self->_dropOffLocation, 0);
}

- (_INPBReservation)reservation
{
  return self->_reservation;
}

- (_INPBDateTimeRange)rentalDuration
{
  return self->_rentalDuration;
}

- (_INPBRentalCar)rentalCar
{
  return self->_rentalCar;
}

- (_INPBLocationValue)pickupLocation
{
  return self->_pickupLocation;
}

- (_INPBLocationValue)dropOffLocation
{
  return self->_dropOffLocation;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBRentalCarReservation *)self dropOffLocation];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"dropOffLocation"];

  v6 = [(_INPBRentalCarReservation *)self pickupLocation];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"pickupLocation"];

  v8 = [(_INPBRentalCarReservation *)self rentalCar];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"rentalCar"];

  v10 = [(_INPBRentalCarReservation *)self rentalDuration];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"rentalDuration"];

  v12 = [(_INPBRentalCarReservation *)self reservation];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"reservation"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBLocationValue *)self->_dropOffLocation hash];
  unint64_t v4 = [(_INPBLocationValue *)self->_pickupLocation hash] ^ v3;
  unint64_t v5 = [(_INPBRentalCar *)self->_rentalCar hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBDateTimeRange *)self->_rentalDuration hash];
  return v6 ^ [(_INPBReservation *)self->_reservation hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  unint64_t v5 = [(_INPBRentalCarReservation *)self dropOffLocation];
  unint64_t v6 = [v4 dropOffLocation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(_INPBRentalCarReservation *)self dropOffLocation];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBRentalCarReservation *)self dropOffLocation];
    v10 = [v4 dropOffLocation];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRentalCarReservation *)self pickupLocation];
  unint64_t v6 = [v4 pickupLocation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(_INPBRentalCarReservation *)self pickupLocation];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBRentalCarReservation *)self pickupLocation];
    v15 = [v4 pickupLocation];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRentalCarReservation *)self rentalCar];
  unint64_t v6 = [v4 rentalCar];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(_INPBRentalCarReservation *)self rentalCar];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBRentalCarReservation *)self rentalCar];
    v20 = [v4 rentalCar];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRentalCarReservation *)self rentalDuration];
  unint64_t v6 = [v4 rentalDuration];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(_INPBRentalCarReservation *)self rentalDuration];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBRentalCarReservation *)self rentalDuration];
    v25 = [v4 rentalDuration];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRentalCarReservation *)self reservation];
  unint64_t v6 = [v4 reservation];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_INPBRentalCarReservation *)self reservation];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(_INPBRentalCarReservation *)self reservation];
    v30 = [v4 reservation];
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
  unint64_t v5 = [+[_INPBRentalCarReservation allocWithZone:](_INPBRentalCarReservation, "allocWithZone:") init];
  id v6 = [(_INPBLocationValue *)self->_dropOffLocation copyWithZone:a3];
  [(_INPBRentalCarReservation *)v5 setDropOffLocation:v6];

  id v7 = [(_INPBLocationValue *)self->_pickupLocation copyWithZone:a3];
  [(_INPBRentalCarReservation *)v5 setPickupLocation:v7];

  id v8 = [(_INPBRentalCar *)self->_rentalCar copyWithZone:a3];
  [(_INPBRentalCarReservation *)v5 setRentalCar:v8];

  id v9 = [(_INPBDateTimeRange *)self->_rentalDuration copyWithZone:a3];
  [(_INPBRentalCarReservation *)v5 setRentalDuration:v9];

  id v10 = [(_INPBReservation *)self->_reservation copyWithZone:a3];
  [(_INPBRentalCarReservation *)v5 setReservation:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBRentalCarReservation *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBRentalCarReservation)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBRentalCarReservation *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBRentalCarReservation *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBRentalCarReservation *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  id v4 = [(_INPBRentalCarReservation *)self dropOffLocation];

  if (v4)
  {
    unint64_t v5 = [(_INPBRentalCarReservation *)self dropOffLocation];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBRentalCarReservation *)self pickupLocation];

  if (v6)
  {
    uint64_t v7 = [(_INPBRentalCarReservation *)self pickupLocation];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBRentalCarReservation *)self rentalCar];

  if (v8)
  {
    id v9 = [(_INPBRentalCarReservation *)self rentalCar];
    PBDataWriterWriteSubmessage();
  }
  id v10 = [(_INPBRentalCarReservation *)self rentalDuration];

  if (v10)
  {
    int v11 = [(_INPBRentalCarReservation *)self rentalDuration];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(_INPBRentalCarReservation *)self reservation];

  if (v12)
  {
    v13 = [(_INPBRentalCarReservation *)self reservation];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRentalCarReservationReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasReservation
{
  return self->_reservation != 0;
}

- (void)setReservation:(id)a3
{
}

- (BOOL)hasRentalDuration
{
  return self->_rentalDuration != 0;
}

- (void)setRentalDuration:(id)a3
{
}

- (BOOL)hasRentalCar
{
  return self->_rentalCar != 0;
}

- (void)setRentalCar:(id)a3
{
}

- (BOOL)hasPickupLocation
{
  return self->_pickupLocation != 0;
}

- (void)setPickupLocation:(id)a3
{
}

- (BOOL)hasDropOffLocation
{
  return self->_dropOffLocation != 0;
}

- (void)setDropOffLocation:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end