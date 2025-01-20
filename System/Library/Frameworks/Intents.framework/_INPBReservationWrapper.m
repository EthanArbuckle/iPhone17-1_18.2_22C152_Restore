@interface _INPBReservationWrapper
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBoatReservation;
- (BOOL)hasBusReservation;
- (BOOL)hasFlightReservation;
- (BOOL)hasLodgingReservation;
- (BOOL)hasRentalCarReservation;
- (BOOL)hasRestaurantReservation;
- (BOOL)hasTicketedEventReservation;
- (BOOL)hasTrainReservation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBBoatReservation)boatReservation;
- (_INPBBusReservation)busReservation;
- (_INPBFlightReservation)flightReservation;
- (_INPBLodgingReservation)lodgingReservation;
- (_INPBRentalCarReservation)rentalCarReservation;
- (_INPBReservationWrapper)initWithCoder:(id)a3;
- (_INPBRestaurantReservation)restaurantReservation;
- (_INPBTicketedEventReservation)ticketedEventReservation;
- (_INPBTrainReservation)trainReservation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBoatReservation:(id)a3;
- (void)setBusReservation:(id)a3;
- (void)setFlightReservation:(id)a3;
- (void)setLodgingReservation:(id)a3;
- (void)setRentalCarReservation:(id)a3;
- (void)setRestaurantReservation:(id)a3;
- (void)setTicketedEventReservation:(id)a3;
- (void)setTrainReservation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBReservationWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainReservation, 0);
  objc_storeStrong((id *)&self->_ticketedEventReservation, 0);
  objc_storeStrong((id *)&self->_restaurantReservation, 0);
  objc_storeStrong((id *)&self->_rentalCarReservation, 0);
  objc_storeStrong((id *)&self->_lodgingReservation, 0);
  objc_storeStrong((id *)&self->_flightReservation, 0);
  objc_storeStrong((id *)&self->_busReservation, 0);

  objc_storeStrong((id *)&self->_boatReservation, 0);
}

- (_INPBTrainReservation)trainReservation
{
  return self->_trainReservation;
}

- (_INPBTicketedEventReservation)ticketedEventReservation
{
  return self->_ticketedEventReservation;
}

- (_INPBRestaurantReservation)restaurantReservation
{
  return self->_restaurantReservation;
}

- (_INPBRentalCarReservation)rentalCarReservation
{
  return self->_rentalCarReservation;
}

- (_INPBLodgingReservation)lodgingReservation
{
  return self->_lodgingReservation;
}

- (_INPBFlightReservation)flightReservation
{
  return self->_flightReservation;
}

- (_INPBBusReservation)busReservation
{
  return self->_busReservation;
}

- (_INPBBoatReservation)boatReservation
{
  return self->_boatReservation;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBReservationWrapper *)self boatReservation];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"boatReservation"];

  v6 = [(_INPBReservationWrapper *)self busReservation];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"busReservation"];

  v8 = [(_INPBReservationWrapper *)self flightReservation];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"flightReservation"];

  v10 = [(_INPBReservationWrapper *)self lodgingReservation];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"lodgingReservation"];

  v12 = [(_INPBReservationWrapper *)self rentalCarReservation];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"rentalCarReservation"];

  v14 = [(_INPBReservationWrapper *)self restaurantReservation];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"restaurantReservation"];

  v16 = [(_INPBReservationWrapper *)self ticketedEventReservation];
  v17 = [v16 dictionaryRepresentation];
  [v3 setObject:v17 forKeyedSubscript:@"ticketedEventReservation"];

  v18 = [(_INPBReservationWrapper *)self trainReservation];
  v19 = [v18 dictionaryRepresentation];
  [v3 setObject:v19 forKeyedSubscript:@"trainReservation"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBBoatReservation *)self->_boatReservation hash];
  unint64_t v4 = [(_INPBBusReservation *)self->_busReservation hash] ^ v3;
  unint64_t v5 = [(_INPBFlightReservation *)self->_flightReservation hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBLodgingReservation *)self->_lodgingReservation hash];
  unint64_t v7 = [(_INPBRentalCarReservation *)self->_rentalCarReservation hash];
  unint64_t v8 = v7 ^ [(_INPBRestaurantReservation *)self->_restaurantReservation hash];
  unint64_t v9 = v6 ^ v8 ^ [(_INPBTicketedEventReservation *)self->_ticketedEventReservation hash];
  return v9 ^ [(_INPBTrainReservation *)self->_trainReservation hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  unint64_t v5 = [(_INPBReservationWrapper *)self boatReservation];
  unint64_t v6 = [v4 boatReservation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v7 = [(_INPBReservationWrapper *)self boatReservation];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_INPBReservationWrapper *)self boatReservation];
    v10 = [v4 boatReservation];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBReservationWrapper *)self busReservation];
  unint64_t v6 = [v4 busReservation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v12 = [(_INPBReservationWrapper *)self busReservation];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBReservationWrapper *)self busReservation];
    v15 = [v4 busReservation];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBReservationWrapper *)self flightReservation];
  unint64_t v6 = [v4 flightReservation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v17 = [(_INPBReservationWrapper *)self flightReservation];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBReservationWrapper *)self flightReservation];
    v20 = [v4 flightReservation];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBReservationWrapper *)self lodgingReservation];
  unint64_t v6 = [v4 lodgingReservation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v22 = [(_INPBReservationWrapper *)self lodgingReservation];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBReservationWrapper *)self lodgingReservation];
    v25 = [v4 lodgingReservation];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBReservationWrapper *)self rentalCarReservation];
  unint64_t v6 = [v4 rentalCarReservation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v27 = [(_INPBReservationWrapper *)self rentalCarReservation];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBReservationWrapper *)self rentalCarReservation];
    v30 = [v4 rentalCarReservation];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBReservationWrapper *)self restaurantReservation];
  unint64_t v6 = [v4 restaurantReservation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v32 = [(_INPBReservationWrapper *)self restaurantReservation];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_INPBReservationWrapper *)self restaurantReservation];
    v35 = [v4 restaurantReservation];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBReservationWrapper *)self ticketedEventReservation];
  unint64_t v6 = [v4 ticketedEventReservation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v37 = [(_INPBReservationWrapper *)self ticketedEventReservation];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_INPBReservationWrapper *)self ticketedEventReservation];
    v40 = [v4 ticketedEventReservation];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBReservationWrapper *)self trainReservation];
  unint64_t v6 = [v4 trainReservation];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v42 = [(_INPBReservationWrapper *)self trainReservation];
    if (!v42)
    {

LABEL_45:
      BOOL v47 = 1;
      goto LABEL_43;
    }
    v43 = (void *)v42;
    v44 = [(_INPBReservationWrapper *)self trainReservation];
    v45 = [v4 trainReservation];
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
  unint64_t v5 = [+[_INPBReservationWrapper allocWithZone:](_INPBReservationWrapper, "allocWithZone:") init];
  id v6 = [(_INPBBoatReservation *)self->_boatReservation copyWithZone:a3];
  [(_INPBReservationWrapper *)v5 setBoatReservation:v6];

  id v7 = [(_INPBBusReservation *)self->_busReservation copyWithZone:a3];
  [(_INPBReservationWrapper *)v5 setBusReservation:v7];

  id v8 = [(_INPBFlightReservation *)self->_flightReservation copyWithZone:a3];
  [(_INPBReservationWrapper *)v5 setFlightReservation:v8];

  id v9 = [(_INPBLodgingReservation *)self->_lodgingReservation copyWithZone:a3];
  [(_INPBReservationWrapper *)v5 setLodgingReservation:v9];

  id v10 = [(_INPBRentalCarReservation *)self->_rentalCarReservation copyWithZone:a3];
  [(_INPBReservationWrapper *)v5 setRentalCarReservation:v10];

  id v11 = [(_INPBRestaurantReservation *)self->_restaurantReservation copyWithZone:a3];
  [(_INPBReservationWrapper *)v5 setRestaurantReservation:v11];

  id v12 = [(_INPBTicketedEventReservation *)self->_ticketedEventReservation copyWithZone:a3];
  [(_INPBReservationWrapper *)v5 setTicketedEventReservation:v12];

  id v13 = [(_INPBTrainReservation *)self->_trainReservation copyWithZone:a3];
  [(_INPBReservationWrapper *)v5 setTrainReservation:v13];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBReservationWrapper *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBReservationWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBReservationWrapper *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBReservationWrapper *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBReservationWrapper *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v20 = a3;
  id v4 = [(_INPBReservationWrapper *)self boatReservation];

  if (v4)
  {
    unint64_t v5 = [(_INPBReservationWrapper *)self boatReservation];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBReservationWrapper *)self busReservation];

  if (v6)
  {
    uint64_t v7 = [(_INPBReservationWrapper *)self busReservation];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBReservationWrapper *)self flightReservation];

  if (v8)
  {
    id v9 = [(_INPBReservationWrapper *)self flightReservation];
    PBDataWriterWriteSubmessage();
  }
  id v10 = [(_INPBReservationWrapper *)self lodgingReservation];

  if (v10)
  {
    id v11 = [(_INPBReservationWrapper *)self lodgingReservation];
    PBDataWriterWriteSubmessage();
  }
  id v12 = [(_INPBReservationWrapper *)self rentalCarReservation];

  if (v12)
  {
    id v13 = [(_INPBReservationWrapper *)self rentalCarReservation];
    PBDataWriterWriteSubmessage();
  }
  v14 = [(_INPBReservationWrapper *)self restaurantReservation];

  if (v14)
  {
    v15 = [(_INPBReservationWrapper *)self restaurantReservation];
    PBDataWriterWriteSubmessage();
  }
  int v16 = [(_INPBReservationWrapper *)self ticketedEventReservation];

  if (v16)
  {
    uint64_t v17 = [(_INPBReservationWrapper *)self ticketedEventReservation];
    PBDataWriterWriteSubmessage();
  }
  v18 = [(_INPBReservationWrapper *)self trainReservation];

  if (v18)
  {
    v19 = [(_INPBReservationWrapper *)self trainReservation];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBReservationWrapperReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTrainReservation
{
  return self->_trainReservation != 0;
}

- (void)setTrainReservation:(id)a3
{
}

- (BOOL)hasTicketedEventReservation
{
  return self->_ticketedEventReservation != 0;
}

- (void)setTicketedEventReservation:(id)a3
{
}

- (BOOL)hasRestaurantReservation
{
  return self->_restaurantReservation != 0;
}

- (void)setRestaurantReservation:(id)a3
{
}

- (BOOL)hasRentalCarReservation
{
  return self->_rentalCarReservation != 0;
}

- (void)setRentalCarReservation:(id)a3
{
}

- (BOOL)hasLodgingReservation
{
  return self->_lodgingReservation != 0;
}

- (void)setLodgingReservation:(id)a3
{
}

- (BOOL)hasFlightReservation
{
  return self->_flightReservation != 0;
}

- (void)setFlightReservation:(id)a3
{
}

- (BOOL)hasBusReservation
{
  return self->_busReservation != 0;
}

- (void)setBusReservation:(id)a3
{
}

- (BOOL)hasBoatReservation
{
  return self->_boatReservation != 0;
}

- (void)setBoatReservation:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end