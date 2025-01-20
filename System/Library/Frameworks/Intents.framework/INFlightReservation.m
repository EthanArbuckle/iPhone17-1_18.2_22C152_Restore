@interface INFlightReservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INFlight)flight;
- (INFlightReservation)initWithCoder:(id)a3;
- (INFlightReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL reservedSeat:(INSeat *)reservedSeat flight:(INFlight *)flight;
- (INFlightReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions reservedSeat:(INSeat *)reservedSeat flight:(INFlight *)flight;
- (INSeat)reservedSeat;
- (id)_dictionaryRepresentation;
- (id)_duration;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INFlightReservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flight, 0);

  objc_storeStrong((id *)&self->_reservedSeat, 0);
}

- (INFlight)flight
{
  return self->_flight;
}

- (INSeat)reservedSeat
{
  return self->_reservedSeat;
}

- (id)_dictionaryRepresentation
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)INFlightReservation;
  v3 = [(INReservation *)&v11 _dictionaryRepresentation];
  v4 = (void *)[v3 mutableCopy];

  v12[0] = @"reservedSeat";
  reservedSeat = self->_reservedSeat;
  v6 = reservedSeat;
  if (!reservedSeat)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = @"flight";
  v13[0] = v6;
  flight = self->_flight;
  v8 = flight;
  if (!flight)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v4 addEntriesFromDictionary:v9];

  if (flight)
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
  v5.super_class = (Class)INFlightReservation;
  id v4 = a3;
  [(INReservation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_reservedSeat, @"reservedSeat", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_flight forKey:@"flight"];
}

- (INFlightReservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INFlightReservation;
  objc_super v5 = [(INReservation *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reservedSeat"];
    reservedSeat = v5->_reservedSeat;
    v5->_reservedSeat = (INSeat *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"flight"];
    flight = v5->_flight;
    v5->_flight = (INFlight *)v8;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INFlightReservation *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)INFlightReservation,
          [(INReservation *)&v10 isEqual:v4]))
    {
      objc_super v5 = v4;
      reservedSeat = self->_reservedSeat;
      BOOL v8 = 0;
      if (reservedSeat == v5->_reservedSeat || -[INSeat isEqual:](reservedSeat, "isEqual:"))
      {
        flight = self->_flight;
        if (flight == v5->_flight || -[INFlight isEqual:](flight, "isEqual:")) {
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
  v6.super_class = (Class)INFlightReservation;
  unint64_t v3 = [(INReservation *)&v6 hash];
  unint64_t v4 = [(INSeat *)self->_reservedSeat hash] ^ v3;
  return v4 ^ [(INFlight *)self->_flight hash];
}

- (id)_duration
{
  return [(INFlight *)self->_flight flightDuration];
}

- (INFlightReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions reservedSeat:(INSeat *)reservedSeat flight:(INFlight *)flight
{
  return [(INFlightReservation *)self initWithItemReference:itemReference reservationNumber:reservationNumber bookingTime:bookingTime reservationStatus:reservationStatus reservationHolderName:reservationHolderName actions:actions URL:0 reservedSeat:reservedSeat flight:flight];
}

- (INFlightReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL reservedSeat:(INSeat *)reservedSeat flight:(INFlight *)flight
{
  v18 = reservedSeat;
  v19 = flight;
  v26.receiver = self;
  v26.super_class = (Class)INFlightReservation;
  v20 = [(INReservation *)&v26 initWithItemReference:itemReference reservationNumber:reservationNumber bookingTime:bookingTime reservationStatus:reservationStatus reservationHolderName:reservationHolderName actions:actions URL:URL];
  if (v20)
  {
    uint64_t v21 = [(INSeat *)v18 copy];
    v22 = v20->_reservedSeat;
    v20->_reservedSeat = (INSeat *)v21;

    uint64_t v23 = [(INFlight *)v19 copy];
    v24 = v20->_flight;
    v20->_flight = (INFlight *)v23;
  }
  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end