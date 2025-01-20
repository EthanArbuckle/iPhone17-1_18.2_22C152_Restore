@interface _INPBRideOption
+ (BOOL)supportsSecureCoding;
+ (Class)availablePartySizeOptionsType;
+ (Class)fareLineItemsType;
- (BOOL)hasAvailablePartySizeOptionsSelectionPrompt;
- (BOOL)hasDisclaimerMessage;
- (BOOL)hasEstimatedPickupDate;
- (BOOL)hasName;
- (BOOL)hasPriceRange;
- (BOOL)hasSpecialPricing;
- (BOOL)hasSpecialPricingBadgeImage;
- (BOOL)hasSubtitle;
- (BOOL)hasUserActivityForBookingInApplication;
- (BOOL)hasUsesMeteredFare;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)usesMeteredFare;
- (NSArray)availablePartySizeOptions;
- (NSArray)fareLineItems;
- (NSString)availablePartySizeOptionsSelectionPrompt;
- (NSString)disclaimerMessage;
- (NSString)name;
- (NSString)specialPricing;
- (NSString)subtitle;
- (_INPBImageValue)specialPricingBadgeImage;
- (_INPBPriceRangeValue)priceRange;
- (_INPBRideOption)initWithCoder:(id)a3;
- (_INPBTimestamp)estimatedPickupDate;
- (_INPBUserActivity)userActivityForBookingInApplication;
- (id)availablePartySizeOptionsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)fareLineItemsAtIndex:(unint64_t)a3;
- (unint64_t)availablePartySizeOptionsCount;
- (unint64_t)fareLineItemsCount;
- (unint64_t)hash;
- (void)addAvailablePartySizeOptions:(id)a3;
- (void)addFareLineItems:(id)a3;
- (void)clearAvailablePartySizeOptions;
- (void)clearFareLineItems;
- (void)encodeWithCoder:(id)a3;
- (void)setAvailablePartySizeOptions:(id)a3;
- (void)setAvailablePartySizeOptionsSelectionPrompt:(id)a3;
- (void)setDisclaimerMessage:(id)a3;
- (void)setEstimatedPickupDate:(id)a3;
- (void)setFareLineItems:(id)a3;
- (void)setHasUsesMeteredFare:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPriceRange:(id)a3;
- (void)setSpecialPricing:(id)a3;
- (void)setSpecialPricingBadgeImage:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setUserActivityForBookingInApplication:(id)a3;
- (void)setUsesMeteredFare:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBRideOption

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityForBookingInApplication, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_specialPricingBadgeImage, 0);
  objc_storeStrong((id *)&self->_specialPricing, 0);
  objc_storeStrong((id *)&self->_priceRange, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fareLineItems, 0);
  objc_storeStrong((id *)&self->_estimatedPickupDate, 0);
  objc_storeStrong((id *)&self->_disclaimerMessage, 0);
  objc_storeStrong((id *)&self->_availablePartySizeOptionsSelectionPrompt, 0);

  objc_storeStrong((id *)&self->_availablePartySizeOptions, 0);
}

- (BOOL)usesMeteredFare
{
  return self->_usesMeteredFare;
}

- (_INPBUserActivity)userActivityForBookingInApplication
{
  return self->_userActivityForBookingInApplication;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (_INPBImageValue)specialPricingBadgeImage
{
  return self->_specialPricingBadgeImage;
}

- (NSString)specialPricing
{
  return self->_specialPricing;
}

- (_INPBPriceRangeValue)priceRange
{
  return self->_priceRange;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)fareLineItems
{
  return self->_fareLineItems;
}

- (_INPBTimestamp)estimatedPickupDate
{
  return self->_estimatedPickupDate;
}

- (NSString)disclaimerMessage
{
  return self->_disclaimerMessage;
}

- (NSString)availablePartySizeOptionsSelectionPrompt
{
  return self->_availablePartySizeOptionsSelectionPrompt;
}

- (NSArray)availablePartySizeOptions
{
  return self->_availablePartySizeOptions;
}

- (id)dictionaryRepresentation
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_availablePartySizeOptions count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v5 = self->_availablePartySizeOptions;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v43 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v42 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"availablePartySizeOptions"];
  }
  if (self->_availablePartySizeOptionsSelectionPrompt)
  {
    v11 = [(_INPBRideOption *)self availablePartySizeOptionsSelectionPrompt];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"availablePartySizeOptionsSelectionPrompt"];
  }
  if (self->_disclaimerMessage)
  {
    v13 = [(_INPBRideOption *)self disclaimerMessage];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"disclaimerMessage"];
  }
  v15 = [(_INPBRideOption *)self estimatedPickupDate];
  v16 = [v15 dictionaryRepresentation];
  [v3 setObject:v16 forKeyedSubscript:@"estimatedPickupDate"];

  if ([(NSArray *)self->_fareLineItems count])
  {
    v17 = [MEMORY[0x1E4F1CA48] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v18 = self->_fareLineItems;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * j), "dictionaryRepresentation", (void)v38);
          [v17 addObject:v23];
        }
        uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v20);
    }

    [v3 setObject:v17 forKeyedSubscript:@"fareLineItems"];
  }
  if (self->_name)
  {
    v24 = [(_INPBRideOption *)self name];
    v25 = (void *)[v24 copy];
    [v3 setObject:v25 forKeyedSubscript:@"name"];
  }
  v26 = [(_INPBRideOption *)self priceRange];
  v27 = [v26 dictionaryRepresentation];
  [v3 setObject:v27 forKeyedSubscript:@"priceRange"];

  if (self->_specialPricing)
  {
    v28 = [(_INPBRideOption *)self specialPricing];
    v29 = (void *)[v28 copy];
    [v3 setObject:v29 forKeyedSubscript:@"specialPricing"];
  }
  v30 = [(_INPBRideOption *)self specialPricingBadgeImage];
  v31 = [v30 dictionaryRepresentation];
  [v3 setObject:v31 forKeyedSubscript:@"specialPricingBadgeImage"];

  if (self->_subtitle)
  {
    v32 = [(_INPBRideOption *)self subtitle];
    v33 = (void *)[v32 copy];
    [v3 setObject:v33 forKeyedSubscript:@"subtitle"];
  }
  v34 = [(_INPBRideOption *)self userActivityForBookingInApplication];
  v35 = [v34 dictionaryRepresentation];
  [v3 setObject:v35 forKeyedSubscript:@"userActivityForBookingInApplication"];

  if ([(_INPBRideOption *)self hasUsesMeteredFare])
  {
    v36 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBRideOption usesMeteredFare](self, "usesMeteredFare"));
    [v3 setObject:v36 forKeyedSubscript:@"usesMeteredFare"];
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v15 = [(NSArray *)self->_availablePartySizeOptions hash];
  NSUInteger v14 = [(NSString *)self->_availablePartySizeOptionsSelectionPrompt hash];
  NSUInteger v3 = [(NSString *)self->_disclaimerMessage hash];
  unint64_t v4 = [(_INPBTimestamp *)self->_estimatedPickupDate hash];
  uint64_t v5 = [(NSArray *)self->_fareLineItems hash];
  NSUInteger v6 = [(NSString *)self->_name hash];
  unint64_t v7 = [(_INPBPriceRangeValue *)self->_priceRange hash];
  NSUInteger v8 = [(NSString *)self->_specialPricing hash];
  unint64_t v9 = [(_INPBImageValue *)self->_specialPricingBadgeImage hash];
  NSUInteger v10 = [(NSString *)self->_subtitle hash];
  unint64_t v11 = [(_INPBUserActivity *)self->_userActivityForBookingInApplication hash];
  if ([(_INPBRideOption *)self hasUsesMeteredFare]) {
    uint64_t v12 = 2654435761 * self->_usesMeteredFare;
  }
  else {
    uint64_t v12 = 0;
  }
  return v14 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_57;
  }
  uint64_t v5 = [(_INPBRideOption *)self availablePartySizeOptions];
  NSUInteger v6 = [v4 availablePartySizeOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v7 = [(_INPBRideOption *)self availablePartySizeOptions];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    unint64_t v9 = [(_INPBRideOption *)self availablePartySizeOptions];
    NSUInteger v10 = [v4 availablePartySizeOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBRideOption *)self availablePartySizeOptionsSelectionPrompt];
  NSUInteger v6 = [v4 availablePartySizeOptionsSelectionPrompt];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v12 = [(_INPBRideOption *)self availablePartySizeOptionsSelectionPrompt];
  if (v12)
  {
    v13 = (void *)v12;
    NSUInteger v14 = [(_INPBRideOption *)self availablePartySizeOptionsSelectionPrompt];
    uint64_t v15 = [v4 availablePartySizeOptionsSelectionPrompt];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBRideOption *)self disclaimerMessage];
  NSUInteger v6 = [v4 disclaimerMessage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v17 = [(_INPBRideOption *)self disclaimerMessage];
  if (v17)
  {
    v18 = (void *)v17;
    uint64_t v19 = [(_INPBRideOption *)self disclaimerMessage];
    uint64_t v20 = [v4 disclaimerMessage];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBRideOption *)self estimatedPickupDate];
  NSUInteger v6 = [v4 estimatedPickupDate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v22 = [(_INPBRideOption *)self estimatedPickupDate];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBRideOption *)self estimatedPickupDate];
    v25 = [v4 estimatedPickupDate];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBRideOption *)self fareLineItems];
  NSUInteger v6 = [v4 fareLineItems];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v27 = [(_INPBRideOption *)self fareLineItems];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBRideOption *)self fareLineItems];
    v30 = [v4 fareLineItems];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBRideOption *)self name];
  NSUInteger v6 = [v4 name];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v32 = [(_INPBRideOption *)self name];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_INPBRideOption *)self name];
    v35 = [v4 name];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBRideOption *)self priceRange];
  NSUInteger v6 = [v4 priceRange];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v37 = [(_INPBRideOption *)self priceRange];
  if (v37)
  {
    long long v38 = (void *)v37;
    long long v39 = [(_INPBRideOption *)self priceRange];
    long long v40 = [v4 priceRange];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBRideOption *)self specialPricing];
  NSUInteger v6 = [v4 specialPricing];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v42 = [(_INPBRideOption *)self specialPricing];
  if (v42)
  {
    long long v43 = (void *)v42;
    long long v44 = [(_INPBRideOption *)self specialPricing];
    long long v45 = [v4 specialPricing];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBRideOption *)self specialPricingBadgeImage];
  NSUInteger v6 = [v4 specialPricingBadgeImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v47 = [(_INPBRideOption *)self specialPricingBadgeImage];
  if (v47)
  {
    uint64_t v48 = (void *)v47;
    v49 = [(_INPBRideOption *)self specialPricingBadgeImage];
    v50 = [v4 specialPricingBadgeImage];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBRideOption *)self subtitle];
  NSUInteger v6 = [v4 subtitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v52 = [(_INPBRideOption *)self subtitle];
  if (v52)
  {
    v53 = (void *)v52;
    v54 = [(_INPBRideOption *)self subtitle];
    v55 = [v4 subtitle];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBRideOption *)self userActivityForBookingInApplication];
  NSUInteger v6 = [v4 userActivityForBookingInApplication];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_56:

    goto LABEL_57;
  }
  uint64_t v57 = [(_INPBRideOption *)self userActivityForBookingInApplication];
  if (v57)
  {
    v58 = (void *)v57;
    v59 = [(_INPBRideOption *)self userActivityForBookingInApplication];
    v60 = [v4 userActivityForBookingInApplication];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  int v64 = [(_INPBRideOption *)self hasUsesMeteredFare];
  if (v64 == [v4 hasUsesMeteredFare])
  {
    if (![(_INPBRideOption *)self hasUsesMeteredFare]
      || ![v4 hasUsesMeteredFare]
      || (int usesMeteredFare = self->_usesMeteredFare, usesMeteredFare == [v4 usesMeteredFare]))
    {
      BOOL v62 = 1;
      goto LABEL_58;
    }
  }
LABEL_57:
  BOOL v62 = 0;
LABEL_58:

  return v62;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBRideOption allocWithZone:](_INPBRideOption, "allocWithZone:") init];
  NSUInteger v6 = (void *)[(NSArray *)self->_availablePartySizeOptions copyWithZone:a3];
  [(_INPBRideOption *)v5 setAvailablePartySizeOptions:v6];

  uint64_t v7 = (void *)[(NSString *)self->_availablePartySizeOptionsSelectionPrompt copyWithZone:a3];
  [(_INPBRideOption *)v5 setAvailablePartySizeOptionsSelectionPrompt:v7];

  NSUInteger v8 = (void *)[(NSString *)self->_disclaimerMessage copyWithZone:a3];
  [(_INPBRideOption *)v5 setDisclaimerMessage:v8];

  id v9 = [(_INPBTimestamp *)self->_estimatedPickupDate copyWithZone:a3];
  [(_INPBRideOption *)v5 setEstimatedPickupDate:v9];

  NSUInteger v10 = (void *)[(NSArray *)self->_fareLineItems copyWithZone:a3];
  [(_INPBRideOption *)v5 setFareLineItems:v10];

  int v11 = (void *)[(NSString *)self->_name copyWithZone:a3];
  [(_INPBRideOption *)v5 setName:v11];

  id v12 = [(_INPBPriceRangeValue *)self->_priceRange copyWithZone:a3];
  [(_INPBRideOption *)v5 setPriceRange:v12];

  v13 = (void *)[(NSString *)self->_specialPricing copyWithZone:a3];
  [(_INPBRideOption *)v5 setSpecialPricing:v13];

  id v14 = [(_INPBImageValue *)self->_specialPricingBadgeImage copyWithZone:a3];
  [(_INPBRideOption *)v5 setSpecialPricingBadgeImage:v14];

  uint64_t v15 = (void *)[(NSString *)self->_subtitle copyWithZone:a3];
  [(_INPBRideOption *)v5 setSubtitle:v15];

  id v16 = [(_INPBUserActivity *)self->_userActivityForBookingInApplication copyWithZone:a3];
  [(_INPBRideOption *)v5 setUserActivityForBookingInApplication:v16];

  if ([(_INPBRideOption *)self hasUsesMeteredFare]) {
    [(_INPBRideOption *)v5 setUsesMeteredFare:[(_INPBRideOption *)self usesMeteredFare]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBRideOption *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBRideOption)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBRideOption *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        NSUInteger v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBRideOption *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBRideOption *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v5 = self->_availablePartySizeOptions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v7);
  }

  NSUInteger v10 = [(_INPBRideOption *)self availablePartySizeOptionsSelectionPrompt];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  int v11 = [(_INPBRideOption *)self disclaimerMessage];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  id v12 = [(_INPBRideOption *)self estimatedPickupDate];

  if (v12)
  {
    v13 = [(_INPBRideOption *)self estimatedPickupDate];
    PBDataWriterWriteSubmessage();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = self->_fareLineItems;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v16);
  }

  uint64_t v19 = [(_INPBRideOption *)self name];

  if (v19) {
    PBDataWriterWriteStringField();
  }
  uint64_t v20 = [(_INPBRideOption *)self priceRange];

  if (v20)
  {
    int v21 = [(_INPBRideOption *)self priceRange];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v22 = [(_INPBRideOption *)self specialPricing];

  if (v22) {
    PBDataWriterWriteStringField();
  }
  v23 = [(_INPBRideOption *)self specialPricingBadgeImage];

  if (v23)
  {
    v24 = [(_INPBRideOption *)self specialPricingBadgeImage];
    PBDataWriterWriteSubmessage();
  }
  v25 = [(_INPBRideOption *)self subtitle];

  if (v25) {
    PBDataWriterWriteStringField();
  }
  int v26 = [(_INPBRideOption *)self userActivityForBookingInApplication];

  if (v26)
  {
    uint64_t v27 = [(_INPBRideOption *)self userActivityForBookingInApplication];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBRideOption *)self hasUsesMeteredFare]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRideOptionReadFrom(self, (uint64_t)a3);
}

- (void)setHasUsesMeteredFare:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUsesMeteredFare
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUsesMeteredFare:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int usesMeteredFare = a3;
}

- (BOOL)hasUserActivityForBookingInApplication
{
  return self->_userActivityForBookingInApplication != 0;
}

- (void)setUserActivityForBookingInApplication:(id)a3
{
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (void)setSubtitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  subtitle = self->_subtitle;
  self->_subtitle = v4;

  MEMORY[0x1F41817F8](v4, subtitle);
}

- (BOOL)hasSpecialPricingBadgeImage
{
  return self->_specialPricingBadgeImage != 0;
}

- (void)setSpecialPricingBadgeImage:(id)a3
{
}

- (BOOL)hasSpecialPricing
{
  return self->_specialPricing != 0;
}

- (void)setSpecialPricing:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  specialPricing = self->_specialPricing;
  self->_specialPricing = v4;

  MEMORY[0x1F41817F8](v4, specialPricing);
}

- (BOOL)hasPriceRange
{
  return self->_priceRange != 0;
}

- (void)setPriceRange:(id)a3
{
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  name = self->_name;
  self->_name = v4;

  MEMORY[0x1F41817F8](v4, name);
}

- (id)fareLineItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_fareLineItems objectAtIndexedSubscript:a3];
}

- (unint64_t)fareLineItemsCount
{
  return [(NSArray *)self->_fareLineItems count];
}

- (void)addFareLineItems:(id)a3
{
  id v4 = a3;
  fareLineItems = self->_fareLineItems;
  id v8 = v4;
  if (!fareLineItems)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_fareLineItems;
    self->_fareLineItems = v6;

    id v4 = v8;
    fareLineItems = self->_fareLineItems;
  }
  [(NSArray *)fareLineItems addObject:v4];
}

- (void)clearFareLineItems
{
}

- (void)setFareLineItems:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  fareLineItems = self->_fareLineItems;
  self->_fareLineItems = v4;

  MEMORY[0x1F41817F8](v4, fareLineItems);
}

- (BOOL)hasEstimatedPickupDate
{
  return self->_estimatedPickupDate != 0;
}

- (void)setEstimatedPickupDate:(id)a3
{
}

- (BOOL)hasDisclaimerMessage
{
  return self->_disclaimerMessage != 0;
}

- (void)setDisclaimerMessage:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  disclaimerMessage = self->_disclaimerMessage;
  self->_disclaimerMessage = v4;

  MEMORY[0x1F41817F8](v4, disclaimerMessage);
}

- (BOOL)hasAvailablePartySizeOptionsSelectionPrompt
{
  return self->_availablePartySizeOptionsSelectionPrompt != 0;
}

- (void)setAvailablePartySizeOptionsSelectionPrompt:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  availablePartySizeOptionsSelectionPrompt = self->_availablePartySizeOptionsSelectionPrompt;
  self->_availablePartySizeOptionsSelectionPrompt = v4;

  MEMORY[0x1F41817F8](v4, availablePartySizeOptionsSelectionPrompt);
}

- (id)availablePartySizeOptionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_availablePartySizeOptions objectAtIndexedSubscript:a3];
}

- (unint64_t)availablePartySizeOptionsCount
{
  return [(NSArray *)self->_availablePartySizeOptions count];
}

- (void)addAvailablePartySizeOptions:(id)a3
{
  id v4 = a3;
  availablePartySizeOptions = self->_availablePartySizeOptions;
  id v8 = v4;
  if (!availablePartySizeOptions)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_availablePartySizeOptions;
    self->_availablePartySizeOptions = v6;

    id v4 = v8;
    availablePartySizeOptions = self->_availablePartySizeOptions;
  }
  [(NSArray *)availablePartySizeOptions addObject:v4];
}

- (void)clearAvailablePartySizeOptions
{
}

- (void)setAvailablePartySizeOptions:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  availablePartySizeOptions = self->_availablePartySizeOptions;
  self->_availablePartySizeOptions = v4;

  MEMORY[0x1F41817F8](v4, availablePartySizeOptions);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)fareLineItemsType
{
  return (Class)objc_opt_class();
}

+ (Class)availablePartySizeOptionsType
{
  return (Class)objc_opt_class();
}

@end