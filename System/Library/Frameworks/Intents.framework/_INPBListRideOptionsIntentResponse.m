@interface _INPBListRideOptionsIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)paymentMethodsType;
+ (Class)rideOptionsType;
- (BOOL)hasExpirationDate;
- (BOOL)hasSupportsApplePayForPayment;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsApplePayForPayment;
- (NSArray)paymentMethods;
- (NSArray)rideOptions;
- (_INPBListRideOptionsIntentResponse)initWithCoder:(id)a3;
- (_INPBTimestamp)expirationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)paymentMethodsAtIndex:(unint64_t)a3;
- (id)rideOptionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)paymentMethodsCount;
- (unint64_t)rideOptionsCount;
- (void)addPaymentMethods:(id)a3;
- (void)addRideOptions:(id)a3;
- (void)clearPaymentMethods;
- (void)clearRideOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setHasSupportsApplePayForPayment:(BOOL)a3;
- (void)setPaymentMethods:(id)a3;
- (void)setRideOptions:(id)a3;
- (void)setSupportsApplePayForPayment:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBListRideOptionsIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideOptions, 0);
  objc_storeStrong((id *)&self->_paymentMethods, 0);

  objc_storeStrong((id *)&self->_expirationDate, 0);
}

- (BOOL)supportsApplePayForPayment
{
  return self->_supportsApplePayForPayment;
}

- (NSArray)rideOptions
{
  return self->_rideOptions;
}

- (NSArray)paymentMethods
{
  return self->_paymentMethods;
}

- (_INPBTimestamp)expirationDate
{
  return self->_expirationDate;
}

- (id)dictionaryRepresentation
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBListRideOptionsIntentResponse *)self expirationDate];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"expirationDate"];

  if ([(NSArray *)self->_paymentMethods count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v7 = self->_paymentMethods;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v26 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"paymentMethods"];
  }
  if ([(NSArray *)self->_rideOptions count])
  {
    v13 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v14 = self->_rideOptions;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "dictionaryRepresentation", (void)v22);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKeyedSubscript:@"rideOptions"];
  }
  if ([(_INPBListRideOptionsIntentResponse *)self hasSupportsApplePayForPayment])
  {
    v20 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBListRideOptionsIntentResponse supportsApplePayForPayment](self, "supportsApplePayForPayment"));
    [v3 setObject:v20 forKeyedSubscript:@"supportsApplePayForPayment"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBTimestamp *)self->_expirationDate hash];
  uint64_t v4 = [(NSArray *)self->_paymentMethods hash];
  uint64_t v5 = [(NSArray *)self->_rideOptions hash];
  if ([(_INPBListRideOptionsIntentResponse *)self hasSupportsApplePayForPayment]) {
    uint64_t v6 = 2654435761 * self->_supportsApplePayForPayment;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  uint64_t v5 = [(_INPBListRideOptionsIntentResponse *)self expirationDate];
  uint64_t v6 = [v4 expirationDate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_INPBListRideOptionsIntentResponse *)self expirationDate];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBListRideOptionsIntentResponse *)self expirationDate];
    uint64_t v10 = [v4 expirationDate];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBListRideOptionsIntentResponse *)self paymentMethods];
  uint64_t v6 = [v4 paymentMethods];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_INPBListRideOptionsIntentResponse *)self paymentMethods];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBListRideOptionsIntentResponse *)self paymentMethods];
    uint64_t v15 = [v4 paymentMethods];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBListRideOptionsIntentResponse *)self rideOptions];
  uint64_t v6 = [v4 rideOptions];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v17 = [(_INPBListRideOptionsIntentResponse *)self rideOptions];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBListRideOptionsIntentResponse *)self rideOptions];
    v20 = [v4 rideOptions];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  int v24 = [(_INPBListRideOptionsIntentResponse *)self hasSupportsApplePayForPayment];
  if (v24 == [v4 hasSupportsApplePayForPayment])
  {
    if (![(_INPBListRideOptionsIntentResponse *)self hasSupportsApplePayForPayment]
      || ![v4 hasSupportsApplePayForPayment]
      || (int supportsApplePayForPayment = self->_supportsApplePayForPayment,
          supportsApplePayForPayment == [v4 supportsApplePayForPayment]))
    {
      BOOL v22 = 1;
      goto LABEL_18;
    }
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBListRideOptionsIntentResponse allocWithZone:](_INPBListRideOptionsIntentResponse, "allocWithZone:") init];
  id v6 = [(_INPBTimestamp *)self->_expirationDate copyWithZone:a3];
  [(_INPBListRideOptionsIntentResponse *)v5 setExpirationDate:v6];

  uint64_t v7 = (void *)[(NSArray *)self->_paymentMethods copyWithZone:a3];
  [(_INPBListRideOptionsIntentResponse *)v5 setPaymentMethods:v7];

  uint64_t v8 = (void *)[(NSArray *)self->_rideOptions copyWithZone:a3];
  [(_INPBListRideOptionsIntentResponse *)v5 setRideOptions:v8];

  if ([(_INPBListRideOptionsIntentResponse *)self hasSupportsApplePayForPayment]) {
    [(_INPBListRideOptionsIntentResponse *)v5 setSupportsApplePayForPayment:[(_INPBListRideOptionsIntentResponse *)self supportsApplePayForPayment]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBListRideOptionsIntentResponse *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBListRideOptionsIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBListRideOptionsIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBListRideOptionsIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBListRideOptionsIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_INPBListRideOptionsIntentResponse *)self expirationDate];

  if (v5)
  {
    id v6 = [(_INPBListRideOptionsIntentResponse *)self expirationDate];
    PBDataWriterWriteSubmessage();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = self->_paymentMethods;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = self->_rideOptions;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }

  if ([(_INPBListRideOptionsIntentResponse *)self hasSupportsApplePayForPayment]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBListRideOptionsIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)setHasSupportsApplePayForPayment:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSupportsApplePayForPayment
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSupportsApplePayForPayment:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int supportsApplePayForPayment = a3;
}

- (id)rideOptionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_rideOptions objectAtIndexedSubscript:a3];
}

- (unint64_t)rideOptionsCount
{
  return [(NSArray *)self->_rideOptions count];
}

- (void)addRideOptions:(id)a3
{
  id v4 = a3;
  rideOptions = self->_rideOptions;
  id v8 = v4;
  if (!rideOptions)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_rideOptions;
    self->_rideOptions = v6;

    id v4 = v8;
    rideOptions = self->_rideOptions;
  }
  [(NSArray *)rideOptions addObject:v4];
}

- (void)clearRideOptions
{
}

- (void)setRideOptions:(id)a3
{
  self->_rideOptions = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (id)paymentMethodsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_paymentMethods objectAtIndexedSubscript:a3];
}

- (unint64_t)paymentMethodsCount
{
  return [(NSArray *)self->_paymentMethods count];
}

- (void)addPaymentMethods:(id)a3
{
  id v4 = a3;
  paymentMethods = self->_paymentMethods;
  id v8 = v4;
  if (!paymentMethods)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_paymentMethods;
    self->_paymentMethods = v6;

    id v4 = v8;
    paymentMethods = self->_paymentMethods;
  }
  [(NSArray *)paymentMethods addObject:v4];
}

- (void)clearPaymentMethods
{
}

- (void)setPaymentMethods:(id)a3
{
  self->_paymentMethods = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasExpirationDate
{
  return self->_expirationDate != 0;
}

- (void)setExpirationDate:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)rideOptionsType
{
  return (Class)objc_opt_class();
}

+ (Class)paymentMethodsType
{
  return (Class)objc_opt_class();
}

@end