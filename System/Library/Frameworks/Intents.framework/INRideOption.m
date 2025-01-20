@interface INRideOption
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INImage)specialPricingBadgeImage;
- (INPriceRange)priceRange;
- (INRideOption)initWithCoder:(NSCoder *)decoder;
- (INRideOption)initWithName:(NSString *)name estimatedPickupDate:(NSDate *)estimatedPickupDate;
- (NSArray)availablePartySizeOptions;
- (NSArray)fareLineItems;
- (NSDate)estimatedPickupDate;
- (NSNumber)usesMeteredFare;
- (NSString)availablePartySizeOptionsSelectionPrompt;
- (NSString)description;
- (NSString)disclaimerMessage;
- (NSString)identifier;
- (NSString)name;
- (NSString)specialPricing;
- (NSUserActivity)userActivityForBookingInApplication;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAvailablePartySizeOptions:(NSArray *)availablePartySizeOptions;
- (void)setAvailablePartySizeOptionsSelectionPrompt:(NSString *)availablePartySizeOptionsSelectionPrompt;
- (void)setDisclaimerMessage:(NSString *)disclaimerMessage;
- (void)setEstimatedPickupDate:(NSDate *)estimatedPickupDate;
- (void)setFareLineItems:(NSArray *)fareLineItems;
- (void)setIdentifier:(NSString *)identifier;
- (void)setName:(NSString *)name;
- (void)setPriceRange:(INPriceRange *)priceRange;
- (void)setSpecialPricing:(NSString *)specialPricing;
- (void)setSpecialPricingBadgeImage:(INImage *)specialPricingBadgeImage;
- (void)setUserActivityForBookingInApplication:(NSUserActivity *)userActivityForBookingInApplication;
- (void)setUsesMeteredFare:(NSNumber *)usesMeteredFare;
@end

@implementation INRideOption

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityForBookingInApplication, 0);
  objc_storeStrong((id *)&self->_specialPricingBadgeImage, 0);
  objc_storeStrong((id *)&self->_specialPricing, 0);
  objc_storeStrong((id *)&self->_availablePartySizeOptionsSelectionPrompt, 0);
  objc_storeStrong((id *)&self->_disclaimerMessage, 0);
  objc_storeStrong((id *)&self->_usesMeteredFare, 0);
  objc_storeStrong((id *)&self->_priceRange, 0);
  objc_storeStrong((id *)&self->_estimatedPickupDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fareLineItems, 0);
  objc_storeStrong((id *)&self->_availablePartySizeOptions, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setUserActivityForBookingInApplication:(NSUserActivity *)userActivityForBookingInApplication
{
}

- (NSUserActivity)userActivityForBookingInApplication
{
  return self->_userActivityForBookingInApplication;
}

- (void)setSpecialPricingBadgeImage:(INImage *)specialPricingBadgeImage
{
}

- (INImage)specialPricingBadgeImage
{
  return self->_specialPricingBadgeImage;
}

- (void)setSpecialPricing:(NSString *)specialPricing
{
}

- (NSString)specialPricing
{
  return self->_specialPricing;
}

- (void)setAvailablePartySizeOptionsSelectionPrompt:(NSString *)availablePartySizeOptionsSelectionPrompt
{
}

- (NSString)availablePartySizeOptionsSelectionPrompt
{
  return self->_availablePartySizeOptionsSelectionPrompt;
}

- (void)setDisclaimerMessage:(NSString *)disclaimerMessage
{
}

- (NSString)disclaimerMessage
{
  return self->_disclaimerMessage;
}

- (void)setUsesMeteredFare:(NSNumber *)usesMeteredFare
{
}

- (NSNumber)usesMeteredFare
{
  return self->_usesMeteredFare;
}

- (void)setPriceRange:(INPriceRange *)priceRange
{
}

- (INPriceRange)priceRange
{
  return self->_priceRange;
}

- (void)setEstimatedPickupDate:(NSDate *)estimatedPickupDate
{
}

- (NSDate)estimatedPickupDate
{
  return self->_estimatedPickupDate;
}

- (void)setName:(NSString *)name
{
}

- (NSString)name
{
  return self->_name;
}

- (id)_dictionaryRepresentation
{
  v36[11] = *MEMORY[0x1E4F143B8];
  name = self->_name;
  uint64_t v3 = (uint64_t)name;
  v35[0] = @"name";
  if (!name)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v36[0] = v3;
  v35[1] = @"estimatedPickupDate";
  uint64_t estimatedPickupDate = (uint64_t)self->_estimatedPickupDate;
  uint64_t v32 = estimatedPickupDate;
  if (!estimatedPickupDate)
  {
    uint64_t estimatedPickupDate = [MEMORY[0x1E4F1CA98] null];
  }
  v36[1] = estimatedPickupDate;
  v35[2] = @"priceRange";
  uint64_t priceRange = (uint64_t)self->_priceRange;
  uint64_t v31 = priceRange;
  if (!priceRange)
  {
    uint64_t priceRange = [MEMORY[0x1E4F1CA98] null];
  }
  v36[2] = priceRange;
  v35[3] = @"usesMeteredFare";
  uint64_t usesMeteredFare = (uint64_t)self->_usesMeteredFare;
  uint64_t v30 = usesMeteredFare;
  if (!usesMeteredFare)
  {
    uint64_t usesMeteredFare = [MEMORY[0x1E4F1CA98] null];
  }
  v36[3] = usesMeteredFare;
  v35[4] = @"disclaimerMessage";
  uint64_t disclaimerMessage = (uint64_t)self->_disclaimerMessage;
  uint64_t v29 = disclaimerMessage;
  if (!disclaimerMessage)
  {
    uint64_t disclaimerMessage = [MEMORY[0x1E4F1CA98] null];
  }
  v36[4] = disclaimerMessage;
  v35[5] = @"availablePartySizeOptions";
  availablePartySizeOptions = self->_availablePartySizeOptions;
  uint64_t v9 = (uint64_t)availablePartySizeOptions;
  if (!availablePartySizeOptions)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v9;
  v36[5] = v9;
  v35[6] = @"availablePartySizeOptionsSelectionPrompt";
  availablePartySizeOptionsSelectionPrompt = self->_availablePartySizeOptionsSelectionPrompt;
  uint64_t v11 = (uint64_t)availablePartySizeOptionsSelectionPrompt;
  if (!availablePartySizeOptionsSelectionPrompt)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v11;
  v36[6] = v11;
  v35[7] = @"specialPricing";
  specialPricing = self->_specialPricing;
  uint64_t v13 = (uint64_t)specialPricing;
  if (!specialPricing)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)disclaimerMessage;
  v26 = (void *)usesMeteredFare;
  v27 = (void *)priceRange;
  v33 = (void *)v3;
  v22 = (void *)v13;
  v36[7] = v13;
  v35[8] = @"specialPricingBadgeImage";
  specialPricingBadgeImage = self->_specialPricingBadgeImage;
  v15 = specialPricingBadgeImage;
  if (!specialPricingBadgeImage)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v16 = (void *)estimatedPickupDate;
  v36[8] = v15;
  v35[9] = @"fareLineItems";
  fareLineItems = self->_fareLineItems;
  v18 = fareLineItems;
  if (!fareLineItems)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v36[9] = v18;
  v35[10] = @"userActivityForBookingInApplication";
  userActivityForBookingInApplication = self->_userActivityForBookingInApplication;
  v20 = userActivityForBookingInApplication;
  if (!userActivityForBookingInApplication)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v36[10] = v20;
  id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:11];
  if (userActivityForBookingInApplication)
  {
    if (fareLineItems) {
      goto LABEL_25;
    }
LABEL_43:

    if (specialPricingBadgeImage) {
      goto LABEL_26;
    }
    goto LABEL_44;
  }

  if (!fareLineItems) {
    goto LABEL_43;
  }
LABEL_25:
  if (specialPricingBadgeImage) {
    goto LABEL_26;
  }
LABEL_44:

LABEL_26:
  if (specialPricing)
  {
    if (availablePartySizeOptionsSelectionPrompt) {
      goto LABEL_28;
    }
LABEL_46:

    if (availablePartySizeOptions) {
      goto LABEL_29;
    }
    goto LABEL_47;
  }

  if (!availablePartySizeOptionsSelectionPrompt) {
    goto LABEL_46;
  }
LABEL_28:
  if (availablePartySizeOptions) {
    goto LABEL_29;
  }
LABEL_47:

LABEL_29:
  if (!v29) {

  }
  if (!v30) {
  if (!v31)
  }

  if (!v32) {
  if (!name)
  }

  return v28;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INRideOption;
  v6 = [(INRideOption *)&v11 description];
  v7 = [(INRideOption *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INRideOption *)self descriptionAtIndent:0];
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_estimatedPickupDate forKey:@"estimatedPickupDate"];
  [v5 encodeObject:self->_priceRange forKey:@"priceRange"];
  [v5 encodeObject:self->_disclaimerMessage forKey:@"disclaimerMessage"];
  [v5 encodeObject:self->_availablePartySizeOptions forKey:@"availablePartySizeOptions"];
  [v5 encodeObject:self->_availablePartySizeOptionsSelectionPrompt forKey:@"availablePartySizeOptionsSelectionPrompt"];
  [v5 encodeObject:self->_specialPricing forKey:@"specialPricing"];
  [v5 encodeObject:self->_specialPricingBadgeImage forKey:@"specialPricingBadgeImage"];
  [v5 encodeObject:self->_fareLineItems forKey:@"fareLineItems"];
  [v5 encodeObject:self->_usesMeteredFare forKey:@"usesMeteredFare"];
  INUserActivitySerializeToData(self->_userActivityForBookingInApplication);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"userActivityForBookingInApplication"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
}

- (INRideOption)initWithCoder:(NSCoder *)decoder
{
  v40[2] = *MEMORY[0x1E4F143B8];
  v4 = decoder;
  v38.receiver = self;
  v38.super_class = (Class)INRideOption;
  id v5 = [(INRideOption *)&v38 init];
  if (v5)
  {
    uint64_t v6 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"estimatedPickupDate"];
    uint64_t estimatedPickupDate = v5->_estimatedPickupDate;
    v5->_uint64_t estimatedPickupDate = (NSDate *)v8;

    uint64_t v10 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"priceRange"];
    uint64_t priceRange = v5->_priceRange;
    v5->_uint64_t priceRange = (INPriceRange *)v10;

    uint64_t v12 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"disclaimerMessage"];
    uint64_t disclaimerMessage = v5->_disclaimerMessage;
    v5->_uint64_t disclaimerMessage = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    v16 = [v14 setWithArray:v15];
    uint64_t v17 = [(NSCoder *)v4 decodeObjectOfClasses:v16 forKey:@"availablePartySizeOptions"];
    availablePartySizeOptions = v5->_availablePartySizeOptions;
    v5->_availablePartySizeOptions = (NSArray *)v17;

    uint64_t v19 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"availablePartySizeOptionsSelectionPrompt"];
    availablePartySizeOptionsSelectionPrompt = v5->_availablePartySizeOptionsSelectionPrompt;
    v5->_availablePartySizeOptionsSelectionPrompt = (NSString *)v19;

    uint64_t v21 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"specialPricing"];
    specialPricing = v5->_specialPricing;
    v5->_specialPricing = (NSString *)v21;

    uint64_t v23 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"specialPricingBadgeImage"];
    specialPricingBadgeImage = v5->_specialPricingBadgeImage;
    v5->_specialPricingBadgeImage = (INImage *)v23;

    v25 = (void *)MEMORY[0x1E4F1CAD0];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    v27 = [v25 setWithArray:v26];
    uint64_t v28 = [(NSCoder *)v4 decodeObjectOfClasses:v27 forKey:@"fareLineItems"];
    fareLineItems = v5->_fareLineItems;
    v5->_fareLineItems = (NSArray *)v28;

    uint64_t v30 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"usesMeteredFare"];
    uint64_t usesMeteredFare = v5->_usesMeteredFare;
    v5->_uint64_t usesMeteredFare = (NSNumber *)v30;

    uint64_t v32 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"userActivityForBookingInApplication"];
    uint64_t v33 = INUserActivityDeserializeFromData(v32);
    userActivityForBookingInApplication = v5->_userActivityForBookingInApplication;
    v5->_userActivityForBookingInApplication = (NSUserActivity *)v33;

    uint64_t v35 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v35;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithName:estimatedPickupDate:", self->_name, self->_estimatedPickupDate);
  [v4 setPriceRange:self->_priceRange];
  [v4 setDisclaimerMessage:self->_disclaimerMessage];
  [v4 setAvailablePartySizeOptions:self->_availablePartySizeOptions];
  [v4 setAvailablePartySizeOptionsSelectionPrompt:self->_availablePartySizeOptionsSelectionPrompt];
  [v4 setSpecialPricing:self->_specialPricing];
  [v4 setSpecialPricingBadgeImage:self->_specialPricingBadgeImage];
  [v4 setFareLineItems:self->_fareLineItems];
  [v4 setUserActivityForBookingInApplication:self->_userActivityForBookingInApplication];
  [v4 setUsesMeteredFare:self->_usesMeteredFare];
  [v4 setIdentifier:self->_identifier];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    name = self->_name;
    if (name != (NSString *)v5[4] && !-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_28;
    }
    uint64_t estimatedPickupDate = self->_estimatedPickupDate;
    if (estimatedPickupDate != (NSDate *)v5[5] && !-[NSDate isEqual:](estimatedPickupDate, "isEqual:")) {
      goto LABEL_28;
    }
    uint64_t priceRange = self->_priceRange;
    if (priceRange != (INPriceRange *)v5[6] && !-[INPriceRange isEqual:](priceRange, "isEqual:")) {
      goto LABEL_28;
    }
    uint64_t disclaimerMessage = self->_disclaimerMessage;
    if (disclaimerMessage != (NSString *)v5[8] && !-[NSString isEqual:](disclaimerMessage, "isEqual:")) {
      goto LABEL_28;
    }
    availablePartySizeOptionsSelectionPrompt = self->_availablePartySizeOptionsSelectionPrompt;
    if (availablePartySizeOptionsSelectionPrompt != (NSString *)v5[9]
      && !-[NSString isEqual:](availablePartySizeOptionsSelectionPrompt, "isEqual:"))
    {
      goto LABEL_28;
    }
    if (((availablePartySizeOptions = self->_availablePartySizeOptions, availablePartySizeOptions == (NSArray *)v5[2])
       || -[NSArray isEqual:](availablePartySizeOptions, "isEqual:"))
      && ((specialPricing = self->_specialPricing, specialPricing == (NSString *)v5[10])
       || -[NSString isEqual:](specialPricing, "isEqual:"))
      && ((specialPricingBadgeImage = self->_specialPricingBadgeImage, specialPricingBadgeImage == (INImage *)v5[11])
       || -[INImage isEqual:](specialPricingBadgeImage, "isEqual:"))
      && ((fareLineItems = self->_fareLineItems, fareLineItems == (NSArray *)v5[3])
       || -[NSArray isEqual:](fareLineItems, "isEqual:"))
      && ((userActivityForBookingInApplication = self->_userActivityForBookingInApplication,
           userActivityForBookingInApplication == (NSUserActivity *)v5[12])
       || -[NSUserActivity isEqual:](userActivityForBookingInApplication, "isEqual:"))
      && ((uint64_t usesMeteredFare = self->_usesMeteredFare, usesMeteredFare == (NSNumber *)v5[7])
       || -[NSNumber isEqual:](usesMeteredFare, "isEqual:"))
      && ((identifier = self->_identifier, identifier == (NSString *)v5[1])
       || -[NSString isEqual:](identifier, "isEqual:")))
    {
      BOOL v18 = 1;
    }
    else
    {
LABEL_28:
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  uint64_t v4 = [(NSDate *)self->_estimatedPickupDate hash] ^ v3;
  unint64_t v5 = [(INPriceRange *)self->_priceRange hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_disclaimerMessage hash];
  uint64_t v7 = [(NSArray *)self->_availablePartySizeOptions hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_availablePartySizeOptionsSelectionPrompt hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_specialPricing hash];
  unint64_t v10 = [(INImage *)self->_specialPricingBadgeImage hash];
  uint64_t v11 = v10 ^ [(NSArray *)self->_fareLineItems hash];
  uint64_t v12 = v11 ^ [(NSUserActivity *)self->_userActivityForBookingInApplication hash];
  uint64_t v13 = v9 ^ v12 ^ [(NSNumber *)self->_usesMeteredFare hash];
  return v13 ^ [(NSString *)self->_identifier hash];
}

- (void)setFareLineItems:(NSArray *)fareLineItems
{
  uint64_t v4 = fareLineItems;
  uint64_t v7 = v4;
  if (v4)
  {
    if ([(NSArray *)v4 count])
    {
      unint64_t v5 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v7 copyItems:1];
      NSUInteger v6 = self->_fareLineItems;
      self->_fareLineItems = v5;
    }
    else
    {
      NSUInteger v6 = self->_fareLineItems;
      self->_fareLineItems = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    NSUInteger v6 = self->_fareLineItems;
    self->_fareLineItems = 0;
  }
}

- (NSArray)fareLineItems
{
  return self->_fareLineItems;
}

- (void)setAvailablePartySizeOptions:(NSArray *)availablePartySizeOptions
{
  uint64_t v4 = availablePartySizeOptions;
  uint64_t v7 = v4;
  if (v4)
  {
    if ([(NSArray *)v4 count])
    {
      unint64_t v5 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v7 copyItems:1];
      NSUInteger v6 = self->_availablePartySizeOptions;
      self->_availablePartySizeOptions = v5;
    }
    else
    {
      NSUInteger v6 = self->_availablePartySizeOptions;
      self->_availablePartySizeOptions = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    NSUInteger v6 = self->_availablePartySizeOptions;
    self->_availablePartySizeOptions = 0;
  }
}

- (NSArray)availablePartySizeOptions
{
  return self->_availablePartySizeOptions;
}

- (INRideOption)initWithName:(NSString *)name estimatedPickupDate:(NSDate *)estimatedPickupDate
{
  NSUInteger v6 = name;
  uint64_t v7 = estimatedPickupDate;
  v14.receiver = self;
  v14.super_class = (Class)INRideOption;
  NSUInteger v8 = [(INRideOption *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [(NSString *)v6 copy];
    unint64_t v10 = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [(NSDate *)v7 copy];
    uint64_t v12 = v8->_estimatedPickupDate;
    v8->_uint64_t estimatedPickupDate = (NSDate *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIdentifier:(NSString *)identifier
{
  self->_identifier = (NSString *)[(NSString *)identifier copy];

  MEMORY[0x1F41817F8]();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(INRideOption *)self specialPricingBadgeImage];
  if (v4)
  {
    unint64_t v5 = (void *)v4;
    NSUInteger v6 = [(INRideOption *)self specialPricingBadgeImage];
    uint64_t v7 = [v6 _identifier];
    NSUInteger v8 = [v13 cacheableObjectForIdentifier:v7];

    if (v8)
    {
      uint64_t v9 = [(INRideOption *)self specialPricingBadgeImage];
      unint64_t v10 = [v9 _identifier];
      uint64_t v11 = [v13 cacheableObjectForIdentifier:v10];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [(INRideOption *)self specialPricingBadgeImage];
        [v11 _imageSize];
        objc_msgSend(v12, "_setImageSize:");
      }
    }
  }
}

- (id)_intents_cacheableObjects
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [(INRideOption *)self specialPricingBadgeImage];

  if (v4)
  {
    unint64_t v5 = [(INRideOption *)self specialPricingBadgeImage];
    [v3 addObject:v5];
  }
  NSUInteger v6 = [(INRideOption *)self userActivityForBookingInApplication];

  if (v6)
  {
    uint64_t v7 = [(INRideOption *)self userActivityForBookingInApplication];
    [v3 addObject:v7];
  }
  if ([v3 count]) {
    NSUInteger v8 = v3;
  }
  else {
    NSUInteger v8 = 0;
  }
  id v9 = v8;

  return v9;
}

@end