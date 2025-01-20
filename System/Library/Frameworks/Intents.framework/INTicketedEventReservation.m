@interface INTicketedEventReservation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INSeat)reservedSeat;
- (INTicketedEvent)event;
- (INTicketedEventReservation)initWithCoder:(id)a3;
- (INTicketedEventReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL reservedSeat:(INSeat *)reservedSeat event:(INTicketedEvent *)event;
- (INTicketedEventReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions reservedSeat:(INSeat *)reservedSeat event:(INTicketedEvent *)event;
- (id)_dictionaryRepresentation;
- (id)_duration;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INTicketedEventReservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservedSeat, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

- (INSeat)reservedSeat
{
  return self->_reservedSeat;
}

- (INTicketedEvent)event
{
  return self->_event;
}

- (id)_dictionaryRepresentation
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)INTicketedEventReservation;
  v3 = [(INReservation *)&v11 _dictionaryRepresentation];
  v4 = (void *)[v3 mutableCopy];

  v12[0] = @"event";
  event = self->_event;
  v6 = event;
  if (!event)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = @"reservedSeat";
  v13[0] = v6;
  reservedSeat = self->_reservedSeat;
  v8 = reservedSeat;
  if (!reservedSeat)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v4 addEntriesFromDictionary:v9];

  if (reservedSeat)
  {
    if (event) {
      goto LABEL_7;
    }
  }
  else
  {

    if (event) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)INTicketedEventReservation;
  id v4 = a3;
  [(INReservation *)&v9 encodeWithCoder:v4];
  event = self->_event;
  v6 = NSStringFromSelector(sel_event);
  objc_msgSend(v4, "encodeObject:forKey:", event, v6, v9.receiver, v9.super_class);

  reservedSeat = self->_reservedSeat;
  v8 = NSStringFromSelector(sel_reservedSeat);
  [v4 encodeObject:reservedSeat forKey:v8];
}

- (INTicketedEventReservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INTicketedEventReservation;
  v5 = [(INReservation *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_event);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    event = v5->_event;
    v5->_event = (INTicketedEvent *)v8;

    uint64_t v10 = objc_opt_class();
    objc_super v11 = NSStringFromSelector(sel_reservedSeat);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    reservedSeat = v5->_reservedSeat;
    v5->_reservedSeat = (INSeat *)v12;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INTicketedEventReservation *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v10.receiver = self,
          v10.super_class = (Class)INTicketedEventReservation,
          [(INReservation *)&v10 isEqual:v4]))
    {
      v5 = v4;
      event = self->_event;
      BOOL v8 = 0;
      if (event == v5->_event || -[INTicketedEvent isEqual:](event, "isEqual:"))
      {
        reservedSeat = self->_reservedSeat;
        if (reservedSeat == v5->_reservedSeat || -[INSeat isEqual:](reservedSeat, "isEqual:")) {
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
  v6.super_class = (Class)INTicketedEventReservation;
  unint64_t v3 = [(INReservation *)&v6 hash];
  unint64_t v4 = [(INTicketedEvent *)self->_event hash] ^ v3;
  return v4 ^ [(INSeat *)self->_reservedSeat hash];
}

- (id)_duration
{
  return [(INTicketedEvent *)self->_event eventDuration];
}

- (INTicketedEventReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions reservedSeat:(INSeat *)reservedSeat event:(INTicketedEvent *)event
{
  return [(INTicketedEventReservation *)self initWithItemReference:itemReference reservationNumber:reservationNumber bookingTime:bookingTime reservationStatus:reservationStatus reservationHolderName:reservationHolderName actions:actions URL:0 reservedSeat:reservedSeat event:event];
}

- (INTicketedEventReservation)initWithItemReference:(INSpeakableString *)itemReference reservationNumber:(NSString *)reservationNumber bookingTime:(NSDate *)bookingTime reservationStatus:(INReservationStatus)reservationStatus reservationHolderName:(NSString *)reservationHolderName actions:(NSArray *)actions URL:(NSURL *)URL reservedSeat:(INSeat *)reservedSeat event:(INTicketedEvent *)event
{
  v18 = reservedSeat;
  v19 = event;
  v26.receiver = self;
  v26.super_class = (Class)INTicketedEventReservation;
  v20 = [(INReservation *)&v26 initWithItemReference:itemReference reservationNumber:reservationNumber bookingTime:bookingTime reservationStatus:reservationStatus reservationHolderName:reservationHolderName actions:actions URL:URL];
  if (v20)
  {
    uint64_t v21 = [(INTicketedEvent *)v19 copy];
    v22 = v20->_event;
    v20->_event = (INTicketedEvent *)v21;

    uint64_t v23 = [(INSeat *)v18 copy];
    v24 = v20->_reservedSeat;
    v20->_reservedSeat = (INSeat *)v23;
  }
  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end