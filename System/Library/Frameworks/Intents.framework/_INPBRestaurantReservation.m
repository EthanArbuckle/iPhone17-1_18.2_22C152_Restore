@interface _INPBRestaurantReservation
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPartySize;
- (BOOL)hasReservation;
- (BOOL)hasReservationDuration;
- (BOOL)hasRestaurantLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBDateTimeRange)reservationDuration;
- (_INPBInteger)partySize;
- (_INPBLocation)restaurantLocation;
- (_INPBReservation)reservation;
- (_INPBRestaurantReservation)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPartySize:(id)a3;
- (void)setReservation:(id)a3;
- (void)setReservationDuration:(id)a3;
- (void)setRestaurantLocation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBRestaurantReservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restaurantLocation, 0);
  objc_storeStrong((id *)&self->_reservationDuration, 0);
  objc_storeStrong((id *)&self->_reservation, 0);

  objc_storeStrong((id *)&self->_partySize, 0);
}

- (_INPBLocation)restaurantLocation
{
  return self->_restaurantLocation;
}

- (_INPBDateTimeRange)reservationDuration
{
  return self->_reservationDuration;
}

- (_INPBReservation)reservation
{
  return self->_reservation;
}

- (_INPBInteger)partySize
{
  return self->_partySize;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBRestaurantReservation *)self partySize];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"partySize"];

  v6 = [(_INPBRestaurantReservation *)self reservation];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"reservation"];

  v8 = [(_INPBRestaurantReservation *)self reservationDuration];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"reservationDuration"];

  v10 = [(_INPBRestaurantReservation *)self restaurantLocation];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"restaurantLocation"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBInteger *)self->_partySize hash];
  unint64_t v4 = [(_INPBReservation *)self->_reservation hash] ^ v3;
  unint64_t v5 = [(_INPBDateTimeRange *)self->_reservationDuration hash];
  return v4 ^ v5 ^ [(_INPBLocation *)self->_restaurantLocation hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(_INPBRestaurantReservation *)self partySize];
  v6 = [v4 partySize];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBRestaurantReservation *)self partySize];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBRestaurantReservation *)self partySize];
    v10 = [v4 partySize];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRestaurantReservation *)self reservation];
  v6 = [v4 reservation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBRestaurantReservation *)self reservation];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBRestaurantReservation *)self reservation];
    v15 = [v4 reservation];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRestaurantReservation *)self reservationDuration];
  v6 = [v4 reservationDuration];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_INPBRestaurantReservation *)self reservationDuration];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBRestaurantReservation *)self reservationDuration];
    v20 = [v4 reservationDuration];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRestaurantReservation *)self restaurantLocation];
  v6 = [v4 restaurantLocation];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_INPBRestaurantReservation *)self restaurantLocation];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(_INPBRestaurantReservation *)self restaurantLocation];
    v25 = [v4 restaurantLocation];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBRestaurantReservation allocWithZone:](_INPBRestaurantReservation, "allocWithZone:") init];
  id v6 = [(_INPBInteger *)self->_partySize copyWithZone:a3];
  [(_INPBRestaurantReservation *)v5 setPartySize:v6];

  id v7 = [(_INPBReservation *)self->_reservation copyWithZone:a3];
  [(_INPBRestaurantReservation *)v5 setReservation:v7];

  id v8 = [(_INPBDateTimeRange *)self->_reservationDuration copyWithZone:a3];
  [(_INPBRestaurantReservation *)v5 setReservationDuration:v8];

  id v9 = [(_INPBLocation *)self->_restaurantLocation copyWithZone:a3];
  [(_INPBRestaurantReservation *)v5 setRestaurantLocation:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBRestaurantReservation *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBRestaurantReservation)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBRestaurantReservation *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBRestaurantReservation *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBRestaurantReservation *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  id v4 = [(_INPBRestaurantReservation *)self partySize];

  if (v4)
  {
    unint64_t v5 = [(_INPBRestaurantReservation *)self partySize];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBRestaurantReservation *)self reservation];

  if (v6)
  {
    uint64_t v7 = [(_INPBRestaurantReservation *)self reservation];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBRestaurantReservation *)self reservationDuration];

  if (v8)
  {
    id v9 = [(_INPBRestaurantReservation *)self reservationDuration];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(_INPBRestaurantReservation *)self restaurantLocation];

  if (v10)
  {
    int v11 = [(_INPBRestaurantReservation *)self restaurantLocation];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRestaurantReservationReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasRestaurantLocation
{
  return self->_restaurantLocation != 0;
}

- (void)setRestaurantLocation:(id)a3
{
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

- (BOOL)hasPartySize
{
  return self->_partySize != 0;
}

- (void)setPartySize:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end