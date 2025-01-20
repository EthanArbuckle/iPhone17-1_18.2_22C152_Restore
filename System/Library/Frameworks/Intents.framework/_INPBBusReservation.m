@interface _INPBBusReservation
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBusTrip;
- (BOOL)hasReservation;
- (BOOL)hasReservedSeat;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBBusReservation)initWithCoder:(id)a3;
- (_INPBBusTrip)busTrip;
- (_INPBReservation)reservation;
- (_INPBSeat)reservedSeat;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBusTrip:(id)a3;
- (void)setReservation:(id)a3;
- (void)setReservedSeat:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBBusReservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservedSeat, 0);
  objc_storeStrong((id *)&self->_reservation, 0);

  objc_storeStrong((id *)&self->_busTrip, 0);
}

- (_INPBSeat)reservedSeat
{
  return self->_reservedSeat;
}

- (_INPBReservation)reservation
{
  return self->_reservation;
}

- (_INPBBusTrip)busTrip
{
  return self->_busTrip;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBBusReservation *)self busTrip];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"busTrip"];

  v6 = [(_INPBBusReservation *)self reservation];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"reservation"];

  v8 = [(_INPBBusReservation *)self reservedSeat];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"reservedSeat"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBBusTrip *)self->_busTrip hash];
  unint64_t v4 = [(_INPBReservation *)self->_reservation hash] ^ v3;
  return v4 ^ [(_INPBSeat *)self->_reservedSeat hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_INPBBusReservation *)self busTrip];
  v6 = [v4 busTrip];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBBusReservation *)self busTrip];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBBusReservation *)self busTrip];
    v10 = [v4 busTrip];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBBusReservation *)self reservation];
  v6 = [v4 reservation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBBusReservation *)self reservation];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBBusReservation *)self reservation];
    v15 = [v4 reservation];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_INPBBusReservation *)self reservedSeat];
  v6 = [v4 reservedSeat];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_INPBBusReservation *)self reservedSeat];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_INPBBusReservation *)self reservedSeat];
    v20 = [v4 reservedSeat];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBBusReservation allocWithZone:](_INPBBusReservation, "allocWithZone:") init];
  id v6 = [(_INPBBusTrip *)self->_busTrip copyWithZone:a3];
  [(_INPBBusReservation *)v5 setBusTrip:v6];

  id v7 = [(_INPBReservation *)self->_reservation copyWithZone:a3];
  [(_INPBBusReservation *)v5 setReservation:v7];

  id v8 = [(_INPBSeat *)self->_reservedSeat copyWithZone:a3];
  [(_INPBBusReservation *)v5 setReservedSeat:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBBusReservation *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBBusReservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBBusReservation *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBBusReservation *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBBusReservation *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(_INPBBusReservation *)self busTrip];

  if (v4)
  {
    v5 = [(_INPBBusReservation *)self busTrip];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBBusReservation *)self reservation];

  if (v6)
  {
    uint64_t v7 = [(_INPBBusReservation *)self reservation];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBBusReservation *)self reservedSeat];

  if (v8)
  {
    v9 = [(_INPBBusReservation *)self reservedSeat];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBBusReservationReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasReservedSeat
{
  return self->_reservedSeat != 0;
}

- (void)setReservedSeat:(id)a3
{
}

- (BOOL)hasReservation
{
  return self->_reservation != 0;
}

- (void)setReservation:(id)a3
{
}

- (BOOL)hasBusTrip
{
  return self->_busTrip != 0;
}

- (void)setBusTrip:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end