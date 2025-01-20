@interface _INPBRequestRideIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDropOffLocation;
- (BOOL)hasIntentMetadata;
- (BOOL)hasPartySize;
- (BOOL)hasPaymentMethod;
- (BOOL)hasPaymentMethodName;
- (BOOL)hasPickupLocation;
- (BOOL)hasPickupTime;
- (BOOL)hasRideOptionName;
- (BOOL)hasScheduledPickupTime;
- (BOOL)hasUsesApplePayForPayment;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)usesApplePayForPayment;
- (_INPBDataString)paymentMethodName;
- (_INPBDataString)rideOptionName;
- (_INPBDateTimeRange)pickupTime;
- (_INPBDateTimeRange)scheduledPickupTime;
- (_INPBInteger)partySize;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBLocation)dropOffLocation;
- (_INPBLocation)pickupLocation;
- (_INPBPaymentMethod)paymentMethod;
- (_INPBRequestRideIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDropOffLocation:(id)a3;
- (void)setHasUsesApplePayForPayment:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setPartySize:(id)a3;
- (void)setPaymentMethod:(id)a3;
- (void)setPaymentMethodName:(id)a3;
- (void)setPickupLocation:(id)a3;
- (void)setPickupTime:(id)a3;
- (void)setRideOptionName:(id)a3;
- (void)setScheduledPickupTime:(id)a3;
- (void)setUsesApplePayForPayment:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBRequestRideIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledPickupTime, 0);
  objc_storeStrong((id *)&self->_rideOptionName, 0);
  objc_storeStrong((id *)&self->_pickupTime, 0);
  objc_storeStrong((id *)&self->_pickupLocation, 0);
  objc_storeStrong((id *)&self->_paymentMethodName, 0);
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_partySize, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_dropOffLocation, 0);
}

- (BOOL)usesApplePayForPayment
{
  return self->_usesApplePayForPayment;
}

- (_INPBDateTimeRange)scheduledPickupTime
{
  return self->_scheduledPickupTime;
}

- (_INPBDataString)rideOptionName
{
  return self->_rideOptionName;
}

- (_INPBDateTimeRange)pickupTime
{
  return self->_pickupTime;
}

- (_INPBLocation)pickupLocation
{
  return self->_pickupLocation;
}

- (_INPBDataString)paymentMethodName
{
  return self->_paymentMethodName;
}

- (_INPBPaymentMethod)paymentMethod
{
  return self->_paymentMethod;
}

- (_INPBInteger)partySize
{
  return self->_partySize;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBLocation)dropOffLocation
{
  return self->_dropOffLocation;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBRequestRideIntent *)self dropOffLocation];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"dropOffLocation"];

  v6 = [(_INPBRequestRideIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  v8 = [(_INPBRequestRideIntent *)self partySize];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"partySize"];

  v10 = [(_INPBRequestRideIntent *)self paymentMethod];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"paymentMethod"];

  v12 = [(_INPBRequestRideIntent *)self paymentMethodName];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"paymentMethodName"];

  v14 = [(_INPBRequestRideIntent *)self pickupLocation];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"pickupLocation"];

  v16 = [(_INPBRequestRideIntent *)self pickupTime];
  v17 = [v16 dictionaryRepresentation];
  [v3 setObject:v17 forKeyedSubscript:@"pickupTime"];

  v18 = [(_INPBRequestRideIntent *)self rideOptionName];
  v19 = [v18 dictionaryRepresentation];
  [v3 setObject:v19 forKeyedSubscript:@"rideOptionName"];

  v20 = [(_INPBRequestRideIntent *)self scheduledPickupTime];
  v21 = [v20 dictionaryRepresentation];
  [v3 setObject:v21 forKeyedSubscript:@"scheduledPickupTime"];

  if ([(_INPBRequestRideIntent *)self hasUsesApplePayForPayment])
  {
    v22 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBRequestRideIntent usesApplePayForPayment](self, "usesApplePayForPayment"));
    [v3 setObject:v22 forKeyedSubscript:@"usesApplePayForPayment"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBLocation *)self->_dropOffLocation hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v5 = [(_INPBInteger *)self->_partySize hash];
  unint64_t v6 = [(_INPBPaymentMethod *)self->_paymentMethod hash];
  unint64_t v7 = [(_INPBDataString *)self->_paymentMethodName hash];
  unint64_t v8 = [(_INPBLocation *)self->_pickupLocation hash];
  unint64_t v9 = [(_INPBDateTimeRange *)self->_pickupTime hash];
  unint64_t v10 = [(_INPBDataString *)self->_rideOptionName hash];
  unint64_t v11 = [(_INPBDateTimeRange *)self->_scheduledPickupTime hash];
  if ([(_INPBRequestRideIntent *)self hasUsesApplePayForPayment]) {
    uint64_t v12 = 2654435761 * self->_usesApplePayForPayment;
  }
  else {
    uint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  unint64_t v5 = [(_INPBRequestRideIntent *)self dropOffLocation];
  unint64_t v6 = [v4 dropOffLocation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v7 = [(_INPBRequestRideIntent *)self dropOffLocation];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_INPBRequestRideIntent *)self dropOffLocation];
    unint64_t v10 = [v4 dropOffLocation];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRequestRideIntent *)self intentMetadata];
  unint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v12 = [(_INPBRequestRideIntent *)self intentMetadata];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBRequestRideIntent *)self intentMetadata];
    v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRequestRideIntent *)self partySize];
  unint64_t v6 = [v4 partySize];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v17 = [(_INPBRequestRideIntent *)self partySize];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBRequestRideIntent *)self partySize];
    v20 = [v4 partySize];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRequestRideIntent *)self paymentMethod];
  unint64_t v6 = [v4 paymentMethod];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v22 = [(_INPBRequestRideIntent *)self paymentMethod];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBRequestRideIntent *)self paymentMethod];
    v25 = [v4 paymentMethod];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRequestRideIntent *)self paymentMethodName];
  unint64_t v6 = [v4 paymentMethodName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v27 = [(_INPBRequestRideIntent *)self paymentMethodName];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBRequestRideIntent *)self paymentMethodName];
    v30 = [v4 paymentMethodName];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRequestRideIntent *)self pickupLocation];
  unint64_t v6 = [v4 pickupLocation];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v32 = [(_INPBRequestRideIntent *)self pickupLocation];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_INPBRequestRideIntent *)self pickupLocation];
    v35 = [v4 pickupLocation];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRequestRideIntent *)self pickupTime];
  unint64_t v6 = [v4 pickupTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v37 = [(_INPBRequestRideIntent *)self pickupTime];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_INPBRequestRideIntent *)self pickupTime];
    v40 = [v4 pickupTime];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRequestRideIntent *)self rideOptionName];
  unint64_t v6 = [v4 rideOptionName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v42 = [(_INPBRequestRideIntent *)self rideOptionName];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(_INPBRequestRideIntent *)self rideOptionName];
    v45 = [v4 rideOptionName];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBRequestRideIntent *)self scheduledPickupTime];
  unint64_t v6 = [v4 scheduledPickupTime];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_46:

    goto LABEL_47;
  }
  uint64_t v47 = [(_INPBRequestRideIntent *)self scheduledPickupTime];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [(_INPBRequestRideIntent *)self scheduledPickupTime];
    v50 = [v4 scheduledPickupTime];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  int v54 = [(_INPBRequestRideIntent *)self hasUsesApplePayForPayment];
  if (v54 == [v4 hasUsesApplePayForPayment])
  {
    if (![(_INPBRequestRideIntent *)self hasUsesApplePayForPayment]
      || ![v4 hasUsesApplePayForPayment]
      || (int usesApplePayForPayment = self->_usesApplePayForPayment,
          usesApplePayForPayment == [v4 usesApplePayForPayment]))
    {
      BOOL v52 = 1;
      goto LABEL_48;
    }
  }
LABEL_47:
  BOOL v52 = 0;
LABEL_48:

  return v52;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBRequestRideIntent allocWithZone:](_INPBRequestRideIntent, "allocWithZone:") init];
  id v6 = [(_INPBLocation *)self->_dropOffLocation copyWithZone:a3];
  [(_INPBRequestRideIntent *)v5 setDropOffLocation:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBRequestRideIntent *)v5 setIntentMetadata:v7];

  id v8 = [(_INPBInteger *)self->_partySize copyWithZone:a3];
  [(_INPBRequestRideIntent *)v5 setPartySize:v8];

  id v9 = [(_INPBPaymentMethod *)self->_paymentMethod copyWithZone:a3];
  [(_INPBRequestRideIntent *)v5 setPaymentMethod:v9];

  id v10 = [(_INPBDataString *)self->_paymentMethodName copyWithZone:a3];
  [(_INPBRequestRideIntent *)v5 setPaymentMethodName:v10];

  id v11 = [(_INPBLocation *)self->_pickupLocation copyWithZone:a3];
  [(_INPBRequestRideIntent *)v5 setPickupLocation:v11];

  id v12 = [(_INPBDateTimeRange *)self->_pickupTime copyWithZone:a3];
  [(_INPBRequestRideIntent *)v5 setPickupTime:v12];

  id v13 = [(_INPBDataString *)self->_rideOptionName copyWithZone:a3];
  [(_INPBRequestRideIntent *)v5 setRideOptionName:v13];

  id v14 = [(_INPBDateTimeRange *)self->_scheduledPickupTime copyWithZone:a3];
  [(_INPBRequestRideIntent *)v5 setScheduledPickupTime:v14];

  if ([(_INPBRequestRideIntent *)self hasUsesApplePayForPayment]) {
    [(_INPBRequestRideIntent *)v5 setUsesApplePayForPayment:[(_INPBRequestRideIntent *)self usesApplePayForPayment]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBRequestRideIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBRequestRideIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBRequestRideIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBRequestRideIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBRequestRideIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v22 = a3;
  id v4 = [(_INPBRequestRideIntent *)self dropOffLocation];

  if (v4)
  {
    unint64_t v5 = [(_INPBRequestRideIntent *)self dropOffLocation];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBRequestRideIntent *)self intentMetadata];

  if (v6)
  {
    uint64_t v7 = [(_INPBRequestRideIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBRequestRideIntent *)self partySize];

  if (v8)
  {
    id v9 = [(_INPBRequestRideIntent *)self partySize];
    PBDataWriterWriteSubmessage();
  }
  id v10 = [(_INPBRequestRideIntent *)self paymentMethod];

  if (v10)
  {
    id v11 = [(_INPBRequestRideIntent *)self paymentMethod];
    PBDataWriterWriteSubmessage();
  }
  id v12 = [(_INPBRequestRideIntent *)self paymentMethodName];

  if (v12)
  {
    id v13 = [(_INPBRequestRideIntent *)self paymentMethodName];
    PBDataWriterWriteSubmessage();
  }
  id v14 = [(_INPBRequestRideIntent *)self pickupLocation];

  if (v14)
  {
    v15 = [(_INPBRequestRideIntent *)self pickupLocation];
    PBDataWriterWriteSubmessage();
  }
  int v16 = [(_INPBRequestRideIntent *)self pickupTime];

  if (v16)
  {
    uint64_t v17 = [(_INPBRequestRideIntent *)self pickupTime];
    PBDataWriterWriteSubmessage();
  }
  v18 = [(_INPBRequestRideIntent *)self rideOptionName];

  if (v18)
  {
    v19 = [(_INPBRequestRideIntent *)self rideOptionName];
    PBDataWriterWriteSubmessage();
  }
  v20 = [(_INPBRequestRideIntent *)self scheduledPickupTime];

  if (v20)
  {
    int v21 = [(_INPBRequestRideIntent *)self scheduledPickupTime];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBRequestRideIntent *)self hasUsesApplePayForPayment]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRequestRideIntentReadFrom(self, (uint64_t)a3);
}

- (void)setHasUsesApplePayForPayment:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUsesApplePayForPayment
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUsesApplePayForPayment:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int usesApplePayForPayment = a3;
}

- (BOOL)hasScheduledPickupTime
{
  return self->_scheduledPickupTime != 0;
}

- (void)setScheduledPickupTime:(id)a3
{
}

- (BOOL)hasRideOptionName
{
  return self->_rideOptionName != 0;
}

- (void)setRideOptionName:(id)a3
{
}

- (BOOL)hasPickupTime
{
  return self->_pickupTime != 0;
}

- (void)setPickupTime:(id)a3
{
}

- (BOOL)hasPickupLocation
{
  return self->_pickupLocation != 0;
}

- (void)setPickupLocation:(id)a3
{
}

- (BOOL)hasPaymentMethodName
{
  return self->_paymentMethodName != 0;
}

- (void)setPaymentMethodName:(id)a3
{
}

- (BOOL)hasPaymentMethod
{
  return self->_paymentMethod != 0;
}

- (void)setPaymentMethod:(id)a3
{
}

- (BOOL)hasPartySize
{
  return self->_partySize != 0;
}

- (void)setPartySize:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasDropOffLocation
{
  return self->_dropOffLocation != 0;
}

- (void)setDropOffLocation:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end