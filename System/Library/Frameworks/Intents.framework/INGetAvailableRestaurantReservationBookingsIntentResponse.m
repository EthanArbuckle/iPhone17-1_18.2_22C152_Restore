@interface INGetAvailableRestaurantReservationBookingsIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INGetAvailableRestaurantReservationBookingsIntentCode)code;
- (INGetAvailableRestaurantReservationBookingsIntentResponse)initWithAvailableBookings:(NSArray *)availableBookings code:(INGetAvailableRestaurantReservationBookingsIntentCode)code userActivity:(NSUserActivity *)userActivity;
- (INGetAvailableRestaurantReservationBookingsIntentResponse)initWithBackingStore:(id)a3;
- (INGetAvailableRestaurantReservationBookingsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INGetAvailableRestaurantReservationBookingsIntentResponse)initWithCoder:(id)a3;
- (INTermsAndConditions)termsAndConditions;
- (NSArray)availableBookings;
- (NSString)localizedBookingAdvisementText;
- (NSString)localizedRestaurantDescriptionText;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setLocalizedBookingAdvisementText:(NSString *)localizedBookingAdvisementText;
- (void)setLocalizedRestaurantDescriptionText:(NSString *)localizedRestaurantDescriptionText;
- (void)setTermsAndConditions:(INTermsAndConditions *)termsAndConditions;
@end

@implementation INGetAvailableRestaurantReservationBookingsIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableBookings, 0);
  objc_storeStrong((id *)&self->_termsAndConditions, 0);
  objc_storeStrong((id *)&self->_localizedBookingAdvisementText, 0);

  objc_storeStrong((id *)&self->_localizedRestaurantDescriptionText, 0);
}

- (NSArray)availableBookings
{
  return self->_availableBookings;
}

- (void)setTermsAndConditions:(INTermsAndConditions *)termsAndConditions
{
}

- (INTermsAndConditions)termsAndConditions
{
  return self->_termsAndConditions;
}

- (void)setLocalizedBookingAdvisementText:(NSString *)localizedBookingAdvisementText
{
}

- (NSString)localizedBookingAdvisementText
{
  return self->_localizedBookingAdvisementText;
}

- (void)setLocalizedRestaurantDescriptionText:(NSString *)localizedRestaurantDescriptionText
{
}

- (NSString)localizedRestaurantDescriptionText
{
  return self->_localizedRestaurantDescriptionText;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)self copyWithZone:0];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (id)_dictionaryRepresentation
{
  v15[5] = *MEMORY[0x1E4F143B8];
  v14[0] = @"code";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[INGetAvailableRestaurantReservationBookingsIntentResponse code](self, "code"));
  v15[0] = v3;
  v14[1] = @"localizedRestaurantDescriptionText";
  localizedRestaurantDescriptionText = self->_localizedRestaurantDescriptionText;
  v5 = localizedRestaurantDescriptionText;
  if (!localizedRestaurantDescriptionText)
  {
    v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v5;
  v14[2] = @"localizedBookingAdvisementText";
  localizedBookingAdvisementText = self->_localizedBookingAdvisementText;
  id v7 = localizedBookingAdvisementText;
  if (!localizedBookingAdvisementText)
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v7;
  v14[3] = @"termsAndConditions";
  termsAndConditions = self->_termsAndConditions;
  v9 = termsAndConditions;
  if (!termsAndConditions)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[3] = v9;
  v14[4] = @"availableBookings";
  availableBookings = self->_availableBookings;
  v11 = availableBookings;
  if (!availableBookings)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[4] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];
  if (availableBookings)
  {
    if (termsAndConditions) {
      goto LABEL_11;
    }
  }
  else
  {

    if (termsAndConditions)
    {
LABEL_11:
      if (localizedBookingAdvisementText) {
        goto LABEL_12;
      }
LABEL_18:

      if (localizedRestaurantDescriptionText) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!localizedBookingAdvisementText) {
    goto LABEL_18;
  }
LABEL_12:
  if (localizedRestaurantDescriptionText) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v12;
}

- (INGetAvailableRestaurantReservationBookingsIntentCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (INGetAvailableRestaurantReservationBookingsIntentResponse *)a3;
  id v7 = v6;
  if (v6 == self)
  {
    char v13 = 1;
    goto LABEL_34;
  }
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v13 = 0;
    goto LABEL_34;
  }
  v8 = v7;
  v9 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)self localizedBookingAdvisementText];
  if (!v9)
  {
    objc_super v3 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)v8 localizedBookingAdvisementText];
    if (!v3)
    {
      int v12 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  v4 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)self localizedBookingAdvisementText];
  v10 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)v8 localizedBookingAdvisementText];
  if (v10)
  {
    v11 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)v8 localizedBookingAdvisementText];
    int v12 = [v4 isEqualToString:v11];
  }
  else
  {
    int v12 = [v4 isEqualToString:&stru_1EDA6DB28];
  }

  if (!v9) {
    goto LABEL_14;
  }
LABEL_15:

  v14 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)self termsAndConditions];
  if (!v14)
  {
    v4 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)v8 termsAndConditions];
    if (!v4)
    {
      int v17 = 1;
LABEL_20:

      goto LABEL_21;
    }
  }
  v15 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)self termsAndConditions];
  v16 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)v8 termsAndConditions];
  int v17 = [v15 isEqual:v16];

  if (!v14) {
    goto LABEL_20;
  }
LABEL_21:

  v18 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)self localizedRestaurantDescriptionText];
  if (!v18)
  {
    v28 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)v8 localizedRestaurantDescriptionText];
    if (!v28)
    {
      v28 = 0;
      int v24 = 1;
LABEL_29:

      goto LABEL_30;
    }
  }
  v19 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)self localizedRestaurantDescriptionText];
  v20 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)v8 localizedRestaurantDescriptionText];
  if (v20)
  {
    [(INGetAvailableRestaurantReservationBookingsIntentResponse *)v8 localizedRestaurantDescriptionText];
    int v21 = v17;
    v23 = int v22 = v12;
    int v24 = [v19 isEqualToString:v23];

    int v12 = v22;
    int v17 = v21;
  }
  else
  {
    int v24 = [v19 isEqualToString:&stru_1EDA6DB28];
  }

  if (!v18) {
    goto LABEL_29;
  }
LABEL_30:

  char v13 = 0;
  if ((v12 & v17) == 1 && v24)
  {
    v25 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)self availableBookings];
    v26 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)v8 availableBookings];
    char v13 = [v25 isEqualToArray:v26];
  }
LABEL_34:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntentResponse;
  v4 = [(INIntentResponse *)&v14 copyWithZone:a3];
  v5 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)self localizedRestaurantDescriptionText];
  [v4 setLocalizedRestaurantDescriptionText:v5];

  id v6 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)self localizedBookingAdvisementText];
  [v4 setLocalizedBookingAdvisementText:v6];

  id v7 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)self termsAndConditions];
  [v4 setTermsAndConditions:v7];

  v8 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)self availableBookings];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1C978]);
    v10 = [(INGetAvailableRestaurantReservationBookingsIntentResponse *)self availableBookings];
    uint64_t v11 = [v9 initWithArray:v10 copyItems:1];
    int v12 = (void *)v4[11];
    v4[11] = v11;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntentResponse;
  id v4 = a3;
  [(INIntentResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_availableBookings, @"availableBookings", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_localizedRestaurantDescriptionText forKey:@"localizedRestaurantDescriptionText"];
  [v4 encodeObject:self->_localizedBookingAdvisementText forKey:@"localizedBookingAdvisementText"];
  [v4 encodeObject:self->_termsAndConditions forKey:@"termsAndConditions"];
}

- (INGetAvailableRestaurantReservationBookingsIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntentResponse;
  objc_super v5 = [(INIntentResponse *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedBookingAdvisementText"];
    localizedBookingAdvisementText = v5->_localizedBookingAdvisementText;
    v5->_localizedBookingAdvisementText = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsAndConditions"];
    termsAndConditions = v5->_termsAndConditions;
    v5->_termsAndConditions = (INTermsAndConditions *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedRestaurantDescriptionText"];
    localizedRestaurantDescriptionText = v5->_localizedRestaurantDescriptionText;
    v5->_localizedRestaurantDescriptionText = (NSString *)v10;

    int v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    objc_super v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"availableBookings"];

    if (v15) {
      objc_storeStrong((id *)&v5->_availableBookings, v15);
    }
  }
  return v5;
}

- (INGetAvailableRestaurantReservationBookingsIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INGetAvailableRestaurantReservationBookingsIntentResponse)initWithAvailableBookings:(NSArray *)availableBookings code:(INGetAvailableRestaurantReservationBookingsIntentCode)code userActivity:(NSUserActivity *)userActivity
{
  uint64_t v8 = availableBookings;
  v13.receiver = self;
  v13.super_class = (Class)INGetAvailableRestaurantReservationBookingsIntentResponse;
  id v9 = [(INIntentResponse *)&v13 _initWithCode:code userActivity:userActivity];
  if (v9)
  {
    uint64_t v10 = [(NSArray *)v8 copy];
    uint64_t v11 = v9->_availableBookings;
    v9->_availableBookings = (NSArray *)v10;
  }
  return v9;
}

- (INGetAvailableRestaurantReservationBookingsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  return [(INGetAvailableRestaurantReservationBookingsIntentResponse *)self initWithAvailableBookings:MEMORY[0x1E4F1CBF0] code:a3 userActivity:a4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end