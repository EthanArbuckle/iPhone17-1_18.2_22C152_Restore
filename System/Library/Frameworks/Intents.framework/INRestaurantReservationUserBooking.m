@interface INRestaurantReservationUserBooking
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INRestaurantGuest)guest;
- (INRestaurantOffer)selectedOffer;
- (INRestaurantReservationUserBooking)initWithCoder:(id)a3;
- (INRestaurantReservationUserBooking)initWithRestaurant:(INRestaurant *)restaurant bookingDate:(NSDate *)bookingDate partySize:(NSUInteger)partySize bookingIdentifier:(NSString *)bookingIdentifier guest:(INRestaurantGuest *)guest status:(INRestaurantReservationUserBookingStatus)status dateStatusModified:(NSDate *)dateStatusModified;
- (INRestaurantReservationUserBookingStatus)status;
- (NSDate)dateStatusModified;
- (NSString)advisementText;
- (NSString)guestProvidedSpecialRequestText;
- (id)_dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdvisementText:(NSString *)advisementText;
- (void)setDateStatusModified:(NSDate *)dateStatusModified;
- (void)setGuest:(INRestaurantGuest *)guest;
- (void)setGuestProvidedSpecialRequestText:(NSString *)guestProvidedSpecialRequestText;
- (void)setSelectedOffer:(INRestaurantOffer *)selectedOffer;
- (void)setStatus:(INRestaurantReservationUserBookingStatus)status;
@end

@implementation INRestaurantReservationUserBooking

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateStatusModified, 0);
  objc_storeStrong((id *)&self->_guestProvidedSpecialRequestText, 0);
  objc_storeStrong((id *)&self->_selectedOffer, 0);
  objc_storeStrong((id *)&self->_advisementText, 0);

  objc_storeStrong((id *)&self->_guest, 0);
}

- (void)setDateStatusModified:(NSDate *)dateStatusModified
{
}

- (NSDate)dateStatusModified
{
  return self->_dateStatusModified;
}

- (void)setStatus:(INRestaurantReservationUserBookingStatus)status
{
  self->_status = status;
}

- (INRestaurantReservationUserBookingStatus)status
{
  return self->_status;
}

- (void)setGuestProvidedSpecialRequestText:(NSString *)guestProvidedSpecialRequestText
{
}

- (NSString)guestProvidedSpecialRequestText
{
  return self->_guestProvidedSpecialRequestText;
}

- (void)setSelectedOffer:(INRestaurantOffer *)selectedOffer
{
}

- (INRestaurantOffer)selectedOffer
{
  return self->_selectedOffer;
}

- (void)setAdvisementText:(NSString *)advisementText
{
}

- (NSString)advisementText
{
  return self->_advisementText;
}

- (void)setGuest:(INRestaurantGuest *)guest
{
}

- (INRestaurantGuest)guest
{
  return self->_guest;
}

- (id)_dictionaryRepresentation
{
  v28[6] = *MEMORY[0x1E4F143B8];
  v22 = @"guest";
  guest = self->_guest;
  uint64_t v4 = (uint64_t)guest;
  if (!guest)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v4;
  v28[0] = v4;
  v23 = @"advisementText";
  advisementText = self->_advisementText;
  uint64_t v6 = (uint64_t)advisementText;
  if (!advisementText)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v6;
  v28[1] = v6;
  v24 = @"selectedOffer";
  selectedOffer = self->_selectedOffer;
  uint64_t v8 = (uint64_t)selectedOffer;
  if (!selectedOffer)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v18 = v8;
  v28[2] = v8;
  v25 = @"guestProvidedSpecialRequestText";
  guestProvidedSpecialRequestText = self->_guestProvidedSpecialRequestText;
  v10 = guestProvidedSpecialRequestText;
  if (!guestProvidedSpecialRequestText)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v8, v20, v21, v22, v23, v24, v25);
  }
  v28[3] = v10;
  v26 = @"status";
  INRestaurantReservationUserBookingStatus v11 = [(INRestaurantReservationUserBooking *)self status];
  unint64_t v12 = v11;
  if (v11 <= INRestaurantReservationUserBookingStatusDenied)
  {
    v13 = off_1E55188E8[v11];
  }
  else
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[4] = v13;
  v27 = @"dateStatusModified";
  dateStatusModified = self->_dateStatusModified;
  v15 = dateStatusModified;
  if (!dateStatusModified)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[5] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v22 count:6];
  if (!dateStatusModified) {

  }
  if (v12 >= 3)
  {

    if (guestProvidedSpecialRequestText)
    {
LABEL_18:
      if (selectedOffer) {
        goto LABEL_19;
      }
      goto LABEL_26;
    }
  }
  else if (guestProvidedSpecialRequestText)
  {
    goto LABEL_18;
  }

  if (selectedOffer)
  {
LABEL_19:
    if (advisementText) {
      goto LABEL_20;
    }
LABEL_27:

    if (guest) {
      goto LABEL_21;
    }
    goto LABEL_28;
  }
LABEL_26:

  if (!advisementText) {
    goto LABEL_27;
  }
LABEL_20:
  if (guest) {
    goto LABEL_21;
  }
LABEL_28:

LABEL_21:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (INRestaurantReservationUserBooking *)a3;
  v31.receiver = self;
  v31.super_class = (Class)INRestaurantReservationUserBooking;
  if (![(INRestaurantReservationBooking *)&v31 isEqual:v6]) {
    goto LABEL_9;
  }
  if (v6 == self)
  {
    char v12 = 1;
    goto LABEL_37;
  }
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_9:
    char v12 = 0;
    goto LABEL_37;
  }
  v7 = v6;
  uint64_t v8 = [(INRestaurantReservationUserBooking *)self advisementText];
  if (!v8)
  {
    v3 = [(INRestaurantReservationUserBooking *)v7 advisementText];
    if (!v3)
    {
      int v11 = 1;
LABEL_15:

      goto LABEL_16;
    }
  }
  uint64_t v4 = [(INRestaurantReservationUserBooking *)v7 advisementText];
  v9 = [(INRestaurantReservationUserBooking *)self advisementText];
  if (v9)
  {
    v10 = [(INRestaurantReservationUserBooking *)self advisementText];
    int v11 = [v4 isEqualToString:v10];
  }
  else
  {
    int v11 = [v4 isEqualToString:&stru_1EDA6DB28];
  }

  if (!v8) {
    goto LABEL_15;
  }
LABEL_16:

  v13 = [(INRestaurantReservationUserBooking *)self selectedOffer];
  if (!v13)
  {
    uint64_t v4 = [(INRestaurantReservationUserBooking *)v7 selectedOffer];
    if (!v4)
    {
      int v16 = 1;
LABEL_21:

      goto LABEL_22;
    }
  }
  v14 = [(INRestaurantReservationUserBooking *)self selectedOffer];
  v15 = [(INRestaurantReservationUserBooking *)v7 selectedOffer];
  int v16 = [v14 isEqual:v15];

  if (!v13) {
    goto LABEL_21;
  }
LABEL_22:

  v17 = [(INRestaurantReservationUserBooking *)self guestProvidedSpecialRequestText];
  if (!v17)
  {
    v30 = [(INRestaurantReservationUserBooking *)v7 guestProvidedSpecialRequestText];
    if (!v30)
    {
      v30 = 0;
      int v23 = 1;
LABEL_30:

      goto LABEL_31;
    }
  }
  uint64_t v18 = [(INRestaurantReservationUserBooking *)self guestProvidedSpecialRequestText];
  v19 = [(INRestaurantReservationUserBooking *)self guestProvidedSpecialRequestText];
  if (v19)
  {
    [(INRestaurantReservationUserBooking *)self guestProvidedSpecialRequestText];
    int v20 = v16;
    v22 = int v21 = v11;
    int v23 = [v18 isEqualToString:v22];

    int v11 = v21;
    int v16 = v20;
  }
  else
  {
    int v23 = [v18 isEqualToString:&stru_1EDA6DB28];
  }

  if (!v17) {
    goto LABEL_30;
  }
LABEL_31:

  v24 = [(INRestaurantReservationUserBooking *)v7 guest];
  v25 = [(INRestaurantReservationUserBooking *)self guest];
  char v12 = 0;
  if (([v24 isEqual:v25] & v11 & v16) == 1 && v23)
  {
    INRestaurantReservationUserBookingStatus v26 = [(INRestaurantReservationUserBooking *)self status];
    if (v26 == [(INRestaurantReservationUserBooking *)v7 status])
    {
      v27 = [(INRestaurantReservationUserBooking *)v7 dateStatusModified];
      v28 = [(INRestaurantReservationUserBooking *)self dateStatusModified];
      char v12 = [v27 isEqualToDate:v28];
    }
    else
    {
      char v12 = 0;
    }
  }

LABEL_37:
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)INRestaurantReservationUserBooking;
  id v4 = [(INRestaurantReservationBooking *)&v11 copyWithZone:a3];
  v5 = [(INRestaurantReservationUserBooking *)self guest];
  [v4 setGuest:v5];

  uint64_t v6 = [(INRestaurantReservationUserBooking *)self advisementText];
  [v4 setAdvisementText:v6];

  v7 = [(INRestaurantReservationUserBooking *)self selectedOffer];
  [v4 setSelectedOffer:v7];

  uint64_t v8 = [(INRestaurantReservationUserBooking *)self guestProvidedSpecialRequestText];
  [v4 setGuestProvidedSpecialRequestText:v8];

  objc_msgSend(v4, "setStatus:", -[INRestaurantReservationUserBooking status](self, "status"));
  v9 = [(INRestaurantReservationUserBooking *)self dateStatusModified];
  [v4 setDateStatusModified:v9];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INRestaurantReservationUserBooking;
  id v4 = a3;
  [(INRestaurantReservationBooking *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_guest, @"guest", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_advisementText forKey:@"advisementText"];
  [v4 encodeObject:self->_selectedOffer forKey:@"selectedOffer"];
  [v4 encodeObject:self->_guestProvidedSpecialRequestText forKey:@"guestProvidedSpecialRequestText"];
  [v4 encodeInteger:self->_status forKey:@"status"];
  [v4 encodeObject:self->_dateStatusModified forKey:@"dateStatusModified"];
}

- (INRestaurantReservationUserBooking)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INRestaurantReservationUserBooking;
  objc_super v5 = [(INRestaurantReservationBooking *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guest"];
    if (v6) {
      objc_storeStrong((id *)&v5->_guest, v6);
    }
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"advisementText"];
    advisementText = v5->_advisementText;
    v5->_advisementText = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedOffer"];
    selectedOffer = v5->_selectedOffer;
    v5->_selectedOffer = (INRestaurantOffer *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guestProvidedSpecialRequestText"];
    guestProvidedSpecialRequestText = v5->_guestProvidedSpecialRequestText;
    v5->_guestProvidedSpecialRequestText = (NSString *)v11;

    v5->_status = [v4 decodeIntegerForKey:@"status"];
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateStatusModified"];
    if (v13) {
      objc_storeStrong((id *)&v5->_dateStatusModified, v13);
    }
  }
  return v5;
}

- (INRestaurantReservationUserBooking)initWithRestaurant:(INRestaurant *)restaurant bookingDate:(NSDate *)bookingDate partySize:(NSUInteger)partySize bookingIdentifier:(NSString *)bookingIdentifier guest:(INRestaurantGuest *)guest status:(INRestaurantReservationUserBookingStatus)status dateStatusModified:(NSDate *)dateStatusModified
{
  objc_super v15 = guest;
  int v16 = dateStatusModified;
  v23.receiver = self;
  v23.super_class = (Class)INRestaurantReservationUserBooking;
  v17 = [(INRestaurantReservationBooking *)&v23 initWithRestaurant:restaurant bookingDate:bookingDate partySize:partySize bookingIdentifier:bookingIdentifier];
  if (v17)
  {
    uint64_t v18 = [(INRestaurantGuest *)v15 copy];
    v19 = v17->_guest;
    v17->_guest = (INRestaurantGuest *)v18;

    v17->_status = status;
    uint64_t v20 = [(NSDate *)v16 copy];
    int v21 = v17->_dateStatusModified;
    v17->_dateStatusModified = (NSDate *)v20;
  }
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end