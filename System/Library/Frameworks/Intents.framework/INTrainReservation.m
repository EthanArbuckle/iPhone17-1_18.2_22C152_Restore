@interface INTrainReservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INSeat)reservedSeat;
- (INTrainReservation)initWithCoder:(id)a3;
- (INTrainReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL reservedSeat:(INSeat *)reservedSeat trainTrip:(INTrainTrip *)trainTrip;
- (INTrainReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions reservedSeat:(INSeat *)reservedSeat trainTrip:(INTrainTrip *)trainTrip;
- (INTrainTrip)trainTrip;
- (id)_dictionaryRepresentation;
- (id)_duration;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INTrainReservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainTrip, 0);

  objc_storeStrong((id *)&self->_reservedSeat, 0);
}

- (INTrainTrip)trainTrip
{
  return self->_trainTrip;
}

- (INSeat)reservedSeat
{
  return self->_reservedSeat;
}

- (id)_dictionaryRepresentation
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)INTrainReservation;
  v3 = [(INReservation *)&v11 _dictionaryRepresentation];
  v4 = (void *)[v3 mutableCopy];

  v12[0] = @"reservedSeat";
  reservedSeat = self->_reservedSeat;
  v6 = reservedSeat;
  if (!reservedSeat)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = @"trainTrip";
  v13[0] = v6;
  trainTrip = self->_trainTrip;
  v8 = trainTrip;
  if (!trainTrip)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v4 addEntriesFromDictionary:v9];

  if (trainTrip)
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
  v9.receiver = self;
  v9.super_class = (Class)INTrainReservation;
  id v4 = a3;
  [(INReservation *)&v9 encodeWithCoder:v4];
  reservedSeat = self->_reservedSeat;
  v6 = NSStringFromSelector(sel_reservedSeat);
  objc_msgSend(v4, "encodeObject:forKey:", reservedSeat, v6, v9.receiver, v9.super_class);

  trainTrip = self->_trainTrip;
  v8 = NSStringFromSelector(sel_trainTrip);
  [v4 encodeObject:trainTrip forKey:v8];
}

- (INTrainReservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INTrainReservation;
  v5 = [(INReservation *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_reservedSeat);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    reservedSeat = v5->_reservedSeat;
    v5->_reservedSeat = (INSeat *)v8;

    uint64_t v10 = objc_opt_class();
    objc_super v11 = NSStringFromSelector(sel_trainTrip);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    trainTrip = v5->_trainTrip;
    v5->_trainTrip = (INTrainTrip *)v12;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INTrainReservation *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)INTrainReservation,
          [(INReservation *)&v10 isEqual:v4]))
    {
      v5 = v4;
      reservedSeat = self->_reservedSeat;
      BOOL v8 = 0;
      if (reservedSeat == v5->_reservedSeat || -[INSeat isEqual:](reservedSeat, "isEqual:"))
      {
        trainTrip = self->_trainTrip;
        if (trainTrip == v5->_trainTrip || -[INTrainTrip isEqual:](trainTrip, "isEqual:")) {
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
  v6.super_class = (Class)INTrainReservation;
  unint64_t v3 = [(INReservation *)&v6 hash];
  unint64_t v4 = [(INSeat *)self->_reservedSeat hash] ^ v3;
  return v4 ^ [(INTrainTrip *)self->_trainTrip hash];
}

- (id)_duration
{
  return [(INTrainTrip *)self->_trainTrip tripDuration];
}

- (INTrainReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions reservedSeat:(INSeat *)reservedSeat trainTrip:(INTrainTrip *)trainTrip
{
  return [(INTrainReservation *)self initWithItemReference:itemReference reservationNumber:reservationNumber bookingTime:bookingTime reservationStatus:reservationStatus reservationHolderName:reservationHolderName actions:actions URL:0 reservedSeat:reservedSeat trainTrip:trainTrip];
}

- (INTrainReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL reservedSeat:(INSeat *)reservedSeat trainTrip:(INTrainTrip *)trainTrip
{
  v18 = reservedSeat;
  v19 = trainTrip;
  v26.receiver = self;
  v26.super_class = (Class)INTrainReservation;
  v20 = [(INReservation *)&v26 initWithItemReference:itemReference reservationNumber:reservationNumber bookingTime:bookingTime reservationStatus:reservationStatus reservationHolderName:reservationHolderName actions:actions URL:URL];
  if (v20)
  {
    uint64_t v21 = [(INSeat *)v18 copy];
    v22 = v20->_reservedSeat;
    v20->_reservedSeat = (INSeat *)v21;

    uint64_t v23 = [(INTrainTrip *)v19 copy];
    v24 = v20->_trainTrip;
    v20->_trainTrip = (INTrainTrip *)v23;
  }
  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end