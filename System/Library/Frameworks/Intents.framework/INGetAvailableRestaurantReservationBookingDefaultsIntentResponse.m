@interface INGetAvailableRestaurantReservationBookingDefaultsIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INGetAvailableRestaurantReservationBookingDefaultsIntentResponse)initWithBackingStore:(id)a3;
- (INGetAvailableRestaurantReservationBookingDefaultsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INGetAvailableRestaurantReservationBookingDefaultsIntentResponse)initWithCoder:(id)a3;
- (INGetAvailableRestaurantReservationBookingDefaultsIntentResponse)initWithDefaultPartySize:(NSUInteger)defaultPartySize defaultBookingDate:(NSDate *)defaultBookingDate code:(INGetAvailableRestaurantReservationBookingDefaultsIntentResponseCode)code userActivity:(NSUserActivity *)userActivity;
- (INGetAvailableRestaurantReservationBookingDefaultsIntentResponseCode)code;
- (INImage)providerImage;
- (NSDate)defaultBookingDate;
- (NSNumber)maximumPartySize;
- (NSNumber)minimumPartySize;
- (NSUInteger)defaultPartySize;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setMaximumPartySize:(NSNumber *)maximumPartySize;
- (void)setMinimumPartySize:(NSNumber *)minimumPartySize;
- (void)setProviderImage:(INImage *)providerImage;
@end

@implementation INGetAvailableRestaurantReservationBookingDefaultsIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerImage, 0);
  objc_storeStrong((id *)&self->_minimumPartySize, 0);
  objc_storeStrong((id *)&self->_maximumPartySize, 0);

  objc_storeStrong((id *)&self->_defaultBookingDate, 0);
}

- (void)setProviderImage:(INImage *)providerImage
{
}

- (INImage)providerImage
{
  return self->_providerImage;
}

- (void)setMinimumPartySize:(NSNumber *)minimumPartySize
{
}

- (NSNumber)minimumPartySize
{
  return self->_minimumPartySize;
}

- (void)setMaximumPartySize:(NSNumber *)maximumPartySize
{
}

- (NSNumber)maximumPartySize
{
  return self->_maximumPartySize;
}

- (NSDate)defaultBookingDate
{
  return self->_defaultBookingDate;
}

- (NSUInteger)defaultPartySize
{
  return self->_defaultPartySize;
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)self copyWithZone:0];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (id)_dictionaryRepresentation
{
  v17[6] = *MEMORY[0x1E4F143B8];
  v16[0] = @"defaultPartySize";
  uint64_t v14 = [NSNumber numberWithUnsignedInteger:self->_defaultPartySize];
  v17[0] = v14;
  v16[1] = @"defaultBookingDate";
  defaultBookingDate = self->_defaultBookingDate;
  v4 = defaultBookingDate;
  if (!defaultBookingDate)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v14);
  }
  v17[1] = v4;
  v16[2] = @"maximumPartySize";
  maximumPartySize = self->_maximumPartySize;
  id v6 = maximumPartySize;
  if (!maximumPartySize)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[2] = v6;
  v16[3] = @"minimumPartySize";
  minimumPartySize = self->_minimumPartySize;
  v8 = minimumPartySize;
  if (!minimumPartySize)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[3] = v8;
  v16[4] = @"providerImage";
  providerImage = self->_providerImage;
  v10 = providerImage;
  if (!providerImage)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[4] = v10;
  v16[5] = @"code";
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[INGetAvailableRestaurantReservationBookingDefaultsIntentResponse code](self, "code", v14));
  v17[5] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:6];

  if (providerImage)
  {
    if (minimumPartySize) {
      goto LABEL_11;
    }
  }
  else
  {

    if (minimumPartySize)
    {
LABEL_11:
      if (maximumPartySize) {
        goto LABEL_12;
      }
LABEL_18:

      if (defaultBookingDate) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!maximumPartySize) {
    goto LABEL_18;
  }
LABEL_12:
  if (defaultBookingDate) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v12;
}

- (INGetAvailableRestaurantReservationBookingDefaultsIntentResponseCode)code
{
  v3.receiver = self;
  v3.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (BOOL)isEqual:(id)a3
{
  v5 = (INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)a3;
  id v6 = v5;
  if (self == v5)
  {
    char v12 = 1;
    goto LABEL_29;
  }
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v12 = 0;
    goto LABEL_29;
  }
  id v7 = v6;
  v8 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)self minimumPartySize];
  if (!v8)
  {
    objc_super v3 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)v7 minimumPartySize];
    if (!v3)
    {
      int v26 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  v9 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)self minimumPartySize];
  v10 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)v7 minimumPartySize];
  if (v10)
  {
    v11 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)v7 minimumPartySize];
    int v26 = [v9 isEqualToNumber:v11];
  }
  else
  {
    v13 = NSNumber;
    v11 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)self minimumPartySize];
    uint64_t v14 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v11, "integerValue") - 1);
    int v26 = [v9 isEqualToNumber:v14];
  }
  if (!v8) {
    goto LABEL_14;
  }
LABEL_15:

  v15 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)self maximumPartySize];
  if (!v15)
  {
    objc_super v3 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)v7 maximumPartySize];
    if (!v3)
    {
      int v19 = 1;
LABEL_23:

      goto LABEL_24;
    }
  }
  v16 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)self maximumPartySize];
  v17 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)v7 maximumPartySize];
  if (v17)
  {
    v18 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)v7 maximumPartySize];
    int v19 = [v16 isEqualToNumber:v18];
  }
  else
  {
    v20 = NSNumber;
    v18 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)self maximumPartySize];
    v21 = objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v18, "integerValue") - 1);
    int v19 = [v16 isEqualToNumber:v21];
  }
  if (!v15) {
    goto LABEL_23;
  }
LABEL_24:

  uint64_t v22 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)v7 defaultPartySize];
  char v12 = 0;
  if (v22 == [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)self defaultPartySize]&& ((v26 ^ 1) & 1) == 0&& v19)
  {
    v23 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)v7 defaultBookingDate];
    v24 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)self defaultBookingDate];
    char v12 = [v23 isEqualToDate:v24];
  }
LABEL_29:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntentResponse;
  v4 = [(INIntentResponse *)&v11 copyWithZone:a3];
  v4[8] = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)self defaultPartySize];
  uint64_t v5 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)self defaultBookingDate];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  id v7 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)self maximumPartySize];
  [v4 setMaximumPartySize:v7];

  v8 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)self minimumPartySize];
  [v4 setMinimumPartySize:v8];

  v9 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)self providerImage];
  [v4 setProviderImage:v9];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntentResponse;
  id v4 = a3;
  [(INIntentResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_defaultPartySize, @"defaultPartySize", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_defaultBookingDate forKey:@"defaultBookingDate"];
  [v4 encodeObject:self->_minimumPartySize forKey:@"minimumPartySize"];
  [v4 encodeObject:self->_maximumPartySize forKey:@"maximumPartySize"];
  [v4 encodeObject:self->_providerImage forKey:@"providerImage"];
}

- (INGetAvailableRestaurantReservationBookingDefaultsIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntentResponse;
  objc_super v5 = [(INIntentResponse *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumPartySize"];
    minimumPartySize = v5->_minimumPartySize;
    v5->_minimumPartySize = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maximumPartySize"];
    maximumPartySize = v5->_maximumPartySize;
    v5->_maximumPartySize = (NSNumber *)v8;

    v5->_defaultPartySize = [v4 decodeIntegerForKey:@"defaultPartySize"];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultBookingDate"];
    objc_super v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"providerImage"];
    if (v10) {
      objc_storeStrong((id *)&v5->_defaultBookingDate, v10);
    }
    if (v11) {
      objc_storeStrong((id *)&v5->_providerImage, v11);
    }
  }
  return v5;
}

- (INGetAvailableRestaurantReservationBookingDefaultsIntentResponse)initWithDefaultPartySize:(NSUInteger)defaultPartySize defaultBookingDate:(NSDate *)defaultBookingDate code:(INGetAvailableRestaurantReservationBookingDefaultsIntentResponseCode)code userActivity:(NSUserActivity *)userActivity
{
  objc_super v11 = defaultBookingDate;
  v15.receiver = self;
  v15.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntentResponse;
  char v12 = [(INIntentResponse *)&v15 _initWithCode:code userActivity:userActivity];
  objc_super v13 = v12;
  if (v12)
  {
    v12->_defaultPartySize = defaultPartySize;
    objc_storeStrong((id *)&v12->_defaultBookingDate, defaultBookingDate);
  }

  return v13;
}

- (INGetAvailableRestaurantReservationBookingDefaultsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  uint64_t v8 = [v6 date];
  v9 = [(INGetAvailableRestaurantReservationBookingDefaultsIntentResponse *)self initWithDefaultPartySize:2 defaultBookingDate:v8 code:a3 userActivity:v7];

  return v9;
}

- (INGetAvailableRestaurantReservationBookingDefaultsIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INGetAvailableRestaurantReservationBookingDefaultsIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end