@interface INBoatReservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INBoatReservation)initWithCoder:(id)a3;
- (INBoatReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL reservedSeat:(INSeat *)reservedSeat boatTrip:(INBoatTrip *)boatTrip;
- (INBoatReservation)initWithItemReference:(id)a3 reservationNumber:(id)a4 bookingTime:(id)a5 reservationStatus:(int64_t)a6 reservationHolderName:(id)a7 actions:(id)a8 url:(id)a9 reservedSeat:(id)a10 boatTrip:(id)a11;
- (INBoatTrip)boatTrip;
- (INSeat)reservedSeat;
- (id)_dictionaryRepresentation;
- (id)_duration;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INBoatReservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boatTrip, 0);

  objc_storeStrong((id *)&self->_reservedSeat, 0);
}

- (INBoatTrip)boatTrip
{
  return self->_boatTrip;
}

- (INSeat)reservedSeat
{
  return self->_reservedSeat;
}

- (id)_dictionaryRepresentation
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)INBoatReservation;
  v3 = [(INReservation *)&v11 _dictionaryRepresentation];
  v4 = (void *)[v3 mutableCopy];

  v12[0] = @"reservedSeat";
  reservedSeat = self->_reservedSeat;
  v6 = reservedSeat;
  if (!reservedSeat)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = @"boatTrip";
  v13[0] = v6;
  boatTrip = self->_boatTrip;
  v8 = boatTrip;
  if (!boatTrip)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v4 addEntriesFromDictionary:v9];

  if (boatTrip)
  {
    if (reservedSeat) {
      goto LABEL_7;
    }
  }
  else
  {

    if (reservedSeat) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INBoatReservation;
  id v4 = a3;
  [(INReservation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_reservedSeat, @"reservedSeat", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_boatTrip forKey:@"boatTrip"];
}

- (INBoatReservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INBoatReservation;
  objc_super v5 = [(INReservation *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reservedSeat"];
    reservedSeat = v5->_reservedSeat;
    v5->_reservedSeat = (INSeat *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"boatTrip"];
    boatTrip = v5->_boatTrip;
    v5->_boatTrip = (INBoatTrip *)v8;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INBoatReservation *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)INBoatReservation,
          [(INReservation *)&v10 isEqual:v4]))
    {
      objc_super v5 = v4;
      reservedSeat = self->_reservedSeat;
      BOOL v8 = 0;
      if (reservedSeat == v5->_reservedSeat || -[INSeat isEqual:](reservedSeat, "isEqual:"))
      {
        boatTrip = self->_boatTrip;
        if (boatTrip == v5->_boatTrip || -[INBoatTrip isEqual:](boatTrip, "isEqual:")) {
          BOOL v8 = 1;
        }
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)INBoatReservation;
  unint64_t v3 = [(INReservation *)&v6 hash];
  unint64_t v4 = [(INSeat *)self->_reservedSeat hash] ^ v3;
  return v4 ^ [(INBoatTrip *)self->_boatTrip hash];
}

- (id)_duration
{
  return [(INBoatTrip *)self->_boatTrip tripDuration];
}

- (INBoatReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL reservedSeat:(INSeat *)reservedSeat boatTrip:(INBoatTrip *)boatTrip
{
  v18 = reservedSeat;
  v19 = boatTrip;
  v26.receiver = self;
  v26.super_class = (Class)INBoatReservation;
  v20 = [(INReservation *)&v26 initWithItemReference:itemReference reservationNumber:reservationNumber bookingTime:bookingTime reservationStatus:reservationStatus reservationHolderName:reservationHolderName actions:actions URL:URL];
  if (v20)
  {
    uint64_t v21 = [(INSeat *)v18 copy];
    v22 = v20->_reservedSeat;
    v20->_reservedSeat = (INSeat *)v21;

    uint64_t v23 = [(INBoatTrip *)v19 copy];
    v24 = v20->_boatTrip;
    v20->_boatTrip = (INBoatTrip *)v23;
  }
  return v20;
}

- (INBoatReservation)initWithItemReference:(id)a3 reservationNumber:(id)a4 bookingTime:(id)a5 reservationStatus:(int64_t)a6 reservationHolderName:(id)a7 actions:(id)a8 url:(id)a9 reservedSeat:(id)a10 boatTrip:(id)a11
{
  return -[INBoatReservation initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:reservedSeat:boatTrip:](self, "initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:reservedSeat:boatTrip:", a3, a4, a5, a6, a7, a8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end