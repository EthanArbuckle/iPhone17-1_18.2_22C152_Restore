@interface INBookRestaurantReservationIntent
+ (BOOL)supportsSecureCoding;
+ (id)intentDescription;
- (BOOL)isEqual:(id)a3;
- (INBookRestaurantReservationIntent)initWithCoder:(id)a3;
- (INBookRestaurantReservationIntent)initWithRestaurant:(INRestaurant *)restaurant bookingDateComponents:(NSDateComponents *)bookingDateComponents partySize:(NSUInteger)partySize bookingIdentifier:(NSString *)bookingIdentifier guest:(INRestaurantGuest *)guest selectedOffer:(INRestaurantOffer *)selectedOffer guestProvidedSpecialRequestText:(NSString *)guestProvidedSpecialRequestText;
- (INRestaurant)restaurant;
- (INRestaurantGuest)guest;
- (INRestaurantOffer)selectedOffer;
- (NSDate)bookingDate;
- (NSDateComponents)bookingDateComponents;
- (NSString)bookingIdentifier;
- (NSString)guestProvidedSpecialRequestText;
- (NSUInteger)partySize;
- (id)_dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBookingDate:(id)a3;
- (void)setBookingDateComponents:(NSDateComponents *)bookingDateComponents;
- (void)setBookingIdentifier:(NSString *)bookingIdentifier;
- (void)setGuest:(INRestaurantGuest *)guest;
- (void)setGuestProvidedSpecialRequestText:(NSString *)guestProvidedSpecialRequestText;
- (void)setPartySize:(NSUInteger)partySize;
- (void)setRestaurant:(INRestaurant *)restaurant;
- (void)setSelectedOffer:(INRestaurantOffer *)selectedOffer;
@end

@implementation INBookRestaurantReservationIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookingDate, 0);
  objc_storeStrong((id *)&self->_guestProvidedSpecialRequestText, 0);
  objc_storeStrong((id *)&self->_selectedOffer, 0);
  objc_storeStrong((id *)&self->_guest, 0);
  objc_storeStrong((id *)&self->_bookingIdentifier, 0);
  objc_storeStrong((id *)&self->_bookingDateComponents, 0);

  objc_storeStrong((id *)&self->_restaurant, 0);
}

- (void)setBookingDate:(id)a3
{
}

- (NSDate)bookingDate
{
  return self->_bookingDate;
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

- (void)setGuest:(INRestaurantGuest *)guest
{
}

- (INRestaurantGuest)guest
{
  return self->_guest;
}

- (void)setBookingIdentifier:(NSString *)bookingIdentifier
{
}

- (NSString)bookingIdentifier
{
  return self->_bookingIdentifier;
}

- (void)setPartySize:(NSUInteger)partySize
{
  self->_partySize = partySize;
}

- (NSUInteger)partySize
{
  return self->_partySize;
}

- (void)setBookingDateComponents:(NSDateComponents *)bookingDateComponents
{
}

- (NSDateComponents)bookingDateComponents
{
  return self->_bookingDateComponents;
}

- (void)setRestaurant:(INRestaurant *)restaurant
{
}

- (INRestaurant)restaurant
{
  return self->_restaurant;
}

- (id)_dictionaryRepresentation
{
  v21[7] = *MEMORY[0x1E4F143B8];
  uint64_t restaurant = (uint64_t)self->_restaurant;
  uint64_t v19 = restaurant;
  v20[0] = @"restaurant";
  if (!restaurant)
  {
    uint64_t restaurant = [MEMORY[0x1E4F1CA98] null];
  }
  v17 = (void *)restaurant;
  v21[0] = restaurant;
  v20[1] = @"bookingDateComponents";
  bookingDateComponents = self->_bookingDateComponents;
  uint64_t v5 = (uint64_t)bookingDateComponents;
  if (!bookingDateComponents)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[1] = v5;
  v20[2] = @"partySize";
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_partySize, v5);
  v21[2] = v18;
  v20[3] = @"bookingIdentifier";
  bookingIdentifier = self->_bookingIdentifier;
  v7 = bookingIdentifier;
  if (!bookingIdentifier)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[3] = v7;
  v20[4] = @"guest";
  guest = self->_guest;
  v9 = guest;
  if (!guest)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[4] = v9;
  v20[5] = @"selectedOffer";
  selectedOffer = self->_selectedOffer;
  v11 = selectedOffer;
  if (!selectedOffer)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[5] = v11;
  v20[6] = @"guestProvidedSpecialRequestText";
  guestProvidedSpecialRequestText = self->_guestProvidedSpecialRequestText;
  v13 = guestProvidedSpecialRequestText;
  if (!guestProvidedSpecialRequestText)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[6] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:7];
  if (guestProvidedSpecialRequestText)
  {
    if (selectedOffer) {
      goto LABEL_15;
    }
  }
  else
  {

    if (selectedOffer)
    {
LABEL_15:
      if (guest) {
        goto LABEL_16;
      }
LABEL_26:

      if (bookingIdentifier) {
        goto LABEL_17;
      }
      goto LABEL_27;
    }
  }

  if (!guest) {
    goto LABEL_26;
  }
LABEL_16:
  if (bookingIdentifier) {
    goto LABEL_17;
  }
LABEL_27:

LABEL_17:
  if (!bookingDateComponents) {

  }
  if (!v19) {

  }
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)INBookRestaurantReservationIntent;
  id v4 = [(INIntent *)&v13 copyWithZone:a3];
  uint64_t v5 = [(INBookRestaurantReservationIntent *)self restaurant];
  [v4 setRestaurant:v5];

  v6 = [(INBookRestaurantReservationIntent *)self bookingDateComponents];
  [v4 setBookingDateComponents:v6];

  objc_msgSend(v4, "setPartySize:", -[INBookRestaurantReservationIntent partySize](self, "partySize"));
  v7 = [(INBookRestaurantReservationIntent *)self bookingIdentifier];
  [v4 setBookingIdentifier:v7];

  v8 = [(INBookRestaurantReservationIntent *)self guest];
  [v4 setGuest:v8];

  v9 = [(INBookRestaurantReservationIntent *)self guestProvidedSpecialRequestText];
  [v4 setGuestProvidedSpecialRequestText:v9];

  v10 = [(INBookRestaurantReservationIntent *)self selectedOffer];
  [v4 setSelectedOffer:v10];

  v11 = [(INBookRestaurantReservationIntent *)self bookingDate];
  [v4 setBookingDate:v11];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v8 = (INBookRestaurantReservationIntent *)a3;
  v9 = v8;
  if (v8 == self)
  {
    LOBYTE(v12) = 1;
    goto LABEL_40;
  }
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v12) = 0;
    goto LABEL_40;
  }
  v10 = v9;
  v11 = [(INBookRestaurantReservationIntent *)self bookingIdentifier];
  if (!v11)
  {
    v3 = [(INBookRestaurantReservationIntent *)v10 bookingIdentifier];
    if (!v3)
    {
      int v28 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  id v4 = [(INBookRestaurantReservationIntent *)self bookingIdentifier];
  uint64_t v5 = [(INBookRestaurantReservationIntent *)v10 bookingIdentifier];
  if (v5)
  {
    v6 = [(INBookRestaurantReservationIntent *)v10 bookingIdentifier];
    int v28 = [v4 isEqualToString:v6];
  }
  else
  {
    int v28 = [v4 isEqualToString:&stru_1EDA6DB28];
  }

  if (!v11) {
    goto LABEL_14;
  }
LABEL_15:

  objc_super v13 = [(INBookRestaurantReservationIntent *)self guest];
  if (!v13)
  {
    id v4 = [(INBookRestaurantReservationIntent *)v10 guest];
    if (!v4)
    {
      int v14 = 1;
LABEL_20:

      goto LABEL_21;
    }
  }
  uint64_t v5 = [(INBookRestaurantReservationIntent *)self guest];
  v6 = [(INBookRestaurantReservationIntent *)v10 guest];
  int v14 = [v5 isEqual:v6];

  if (!v13) {
    goto LABEL_20;
  }
LABEL_21:

  v15 = [(INBookRestaurantReservationIntent *)self guestProvidedSpecialRequestText];
  if (!v15)
  {
    uint64_t v5 = [(INBookRestaurantReservationIntent *)v10 guestProvidedSpecialRequestText];
    if (!v5)
    {
      int v18 = 1;
LABEL_29:

      goto LABEL_30;
    }
  }
  v6 = [(INBookRestaurantReservationIntent *)self guestProvidedSpecialRequestText];
  v16 = [(INBookRestaurantReservationIntent *)v10 guestProvidedSpecialRequestText];
  if (v16)
  {
    v17 = [(INBookRestaurantReservationIntent *)v10 guestProvidedSpecialRequestText];
    int v18 = [v6 isEqualToString:v17];
  }
  else
  {
    int v18 = [v6 isEqualToString:&stru_1EDA6DB28];
  }

  if (!v15) {
    goto LABEL_29;
  }
LABEL_30:

  uint64_t v19 = [(INBookRestaurantReservationIntent *)self selectedOffer];
  if (!v19)
  {
    v6 = [(INBookRestaurantReservationIntent *)v10 selectedOffer];
    if (!v6)
    {
      int v22 = 1;
LABEL_35:

      goto LABEL_36;
    }
  }
  v20 = [(INBookRestaurantReservationIntent *)self selectedOffer];
  v21 = [(INBookRestaurantReservationIntent *)v10 selectedOffer];
  int v22 = [v20 isEqual:v21];

  if (!v19) {
    goto LABEL_35;
  }
LABEL_36:

  v23 = [(INBookRestaurantReservationIntent *)self restaurant];
  v24 = [(INBookRestaurantReservationIntent *)v10 restaurant];
  if ([v23 isEqual:v24])
  {
    v25 = [(INBookRestaurantReservationIntent *)self bookingDateComponents];
    v26 = [(INBookRestaurantReservationIntent *)v10 bookingDateComponents];
    int v12 = [v25 isEqual:v26] & v18 & v28 & v14 & v22;
  }
  else
  {
    LOBYTE(v12) = 0;
  }

LABEL_40:
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INBookRestaurantReservationIntent;
  id v4 = a3;
  [(INIntent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_bookingDate, @"bookingDate", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_restaurant forKey:@"restaurant"];
  [v4 encodeObject:self->_bookingDateComponents forKey:@"bookingDateComponents"];
  [v4 encodeInteger:self->_partySize forKey:@"partySize"];
  [v4 encodeObject:self->_bookingIdentifier forKey:@"bookingIdentifier"];
  [v4 encodeObject:self->_guest forKey:@"guest"];
  [v4 encodeObject:self->_guestProvidedSpecialRequestText forKey:@"guestProvidedSpecialRequestText"];
  [v4 encodeObject:self->_selectedOffer forKey:@"selectedOffer"];
}

- (INBookRestaurantReservationIntent)initWithCoder:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)INBookRestaurantReservationIntent;
  objc_super v5 = [(INIntent *)&v23 initWithCoder:v4];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"restaurant"];
  if (!v6)
  {
    v21 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
LABEL_9:
      v20 = 0;
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315394;
    v25 = "-[INBookRestaurantReservationIntent initWithCoder:]";
    __int16 v26 = 2080;
    v27 = "_restaurant";
LABEL_12:
    _os_log_error_impl(&dword_18CB2F000, v21, OS_LOG_TYPE_ERROR, "%s Null value for %s", buf, 0x16u);
    goto LABEL_9;
  }
  uint64_t restaurant = v5->_restaurant;
  v5->_uint64_t restaurant = (INRestaurant *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookingDateComponents"];
  if (!v8)
  {
    v21 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315394;
    v25 = "-[INBookRestaurantReservationIntent initWithCoder:]";
    __int16 v26 = 2080;
    v27 = "_bookingDateComponents";
    goto LABEL_12;
  }
  bookingDateComponents = v5->_bookingDateComponents;
  v5->_bookingDateComponents = (NSDateComponents *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookingDate"];
  bookingDate = v5->_bookingDate;
  v5->_bookingDate = (NSDate *)v10;

  v5->_partySize = [v4 decodeIntegerForKey:@"partySize"];
  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookingIdentifier"];
  bookingIdentifier = v5->_bookingIdentifier;
  v5->_bookingIdentifier = (NSString *)v12;

  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guest"];
  guest = v5->_guest;
  v5->_guest = (INRestaurantGuest *)v14;

  uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guestProvidedSpecialRequestText"];
  guestProvidedSpecialRequestText = v5->_guestProvidedSpecialRequestText;
  v5->_guestProvidedSpecialRequestText = (NSString *)v16;

  uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedOffer"];
  selectedOffer = v5->_selectedOffer;
  v5->_selectedOffer = (INRestaurantOffer *)v18;

LABEL_5:
  v20 = v5;
LABEL_10:

  return v20;
}

- (INBookRestaurantReservationIntent)initWithRestaurant:(INRestaurant *)restaurant bookingDateComponents:(NSDateComponents *)bookingDateComponents partySize:(NSUInteger)partySize bookingIdentifier:(NSString *)bookingIdentifier guest:(INRestaurantGuest *)guest selectedOffer:(INRestaurantOffer *)selectedOffer guestProvidedSpecialRequestText:(NSString *)guestProvidedSpecialRequestText
{
  v15 = restaurant;
  uint64_t v16 = bookingDateComponents;
  v17 = bookingIdentifier;
  uint64_t v18 = guest;
  uint64_t v19 = selectedOffer;
  v20 = guestProvidedSpecialRequestText;
  v24.receiver = self;
  v24.super_class = (Class)INBookRestaurantReservationIntent;
  v21 = [(INIntent *)&v24 init];
  int v22 = v21;
  if (v21)
  {
    [(INBookRestaurantReservationIntent *)v21 setRestaurant:v15];
    [(INBookRestaurantReservationIntent *)v22 setBookingDateComponents:v16];
    [(INBookRestaurantReservationIntent *)v22 setPartySize:partySize];
    [(INBookRestaurantReservationIntent *)v22 setBookingIdentifier:v17];
    [(INBookRestaurantReservationIntent *)v22 setGuest:v18];
    [(INBookRestaurantReservationIntent *)v22 setSelectedOffer:v19];
    [(INBookRestaurantReservationIntent *)v22 setGuestProvidedSpecialRequestText:v20];
  }

  return v22;
}

+ (id)intentDescription
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__INBookRestaurantReservationIntent_intentDescription__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (intentDescription_onceToken_64135 != -1) {
    dispatch_once(&intentDescription_onceToken_64135, block);
  }
  v2 = (void *)intentDescription_intentDescription_64136;

  return v2;
}

void __54__INBookRestaurantReservationIntent_intentDescription__block_invoke()
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v10[0] = @"restaurant";
  v0 = [[INIntentSlotDescription alloc] initWithName:@"restaurant", 1, @"restaurant", 0, 0, 0, 0, 2, &unk_1EDBAB010, &unk_1EDBAB028, objc_opt_class(), sel_resolveRestaurantForBookRestaurantReservation_withCompletion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v11[0] = v0;
  v10[1] = @"bookingDateComponents";
  v1 = [[INIntentSlotDescription alloc] initWithName:@"bookingDateComponents", 2, @"bookingDateComponents", 0, 0, 0, 14, 2, &unk_1EDBAB040, &unk_1EDBAB058, objc_opt_class(), sel_resolveBookingDateComponentsForBookRestaurantReservation_withCompletion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v11[1] = v1;
  v10[2] = @"partySize";
  v2 = [[INIntentSlotDescription alloc] initWithName:@"partySize", 3, @"partySize", 0, 0, 0, 8, 2, &unk_1EDBAB070, &unk_1EDBAB088, objc_opt_class(), sel_resolvePartySizeForBookRestaurantReservation_withCompletion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v11[2] = v2;
  v10[3] = @"bookingIdentifier";
  v3 = [[INIntentSlotDescription alloc] initWithName:@"bookingIdentifier" tag:4 facadePropertyName:@"bookingIdentifier" dataPropertyName:0 isExtended:0 isPrivate:1 valueType:30 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v11[3] = v3;
  v10[4] = @"guest";
  id v4 = [[INIntentSlotDescription alloc] initWithName:@"guest", 5, @"guest", 0, 0, 0, 0, 2, &unk_1EDBAB0A0, &unk_1EDBAB0B8, objc_opt_class(), sel_resolveGuestForBookRestaurantReservation_withCompletion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v11[4] = v4;
  v10[5] = @"selectedOffer";
  objc_super v5 = [[INIntentSlotDescription alloc] initWithName:@"selectedOffer" tag:6 facadePropertyName:@"selectedOffer" dataPropertyName:0 isExtended:0 isPrivate:1 valueType:0 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v11[5] = v5;
  v10[6] = @"guestProvidedSpecialRequestText";
  uint64_t v6 = [[INIntentSlotDescription alloc] initWithName:@"guestProvidedSpecialRequestText", 7, @"guestProvidedSpecialRequestText", 0, 0, 0, 30, 1, &unk_1EDBAB0D0, &unk_1EDBAB0E8, objc_opt_class(), sel_resolveGuestProvidedSpecialRequestTextForBookRestaurantReservation_withCompletion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v11[6] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:7];

  uint64_t v8 = [[INIntentDescription alloc] initWithName:@"BookRestaurantReservationIntent" responseName:@"BookRestaurantReservationIntentResponse" facadeClass:objc_opt_class() dataClass:0 type:0 isPrivate:0 handleSelector:sel_handleBookRestaurantReservation_completion_ confirmSelector:sel_confirmBookRestaurantReservation_completion_ slotsByName:v7];
  v9 = (void *)intentDescription_intentDescription_64136;
  intentDescription_intentDescription_64136 = (uint64_t)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end