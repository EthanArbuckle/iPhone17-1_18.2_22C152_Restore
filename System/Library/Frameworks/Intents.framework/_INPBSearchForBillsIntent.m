@interface _INPBSearchForBillsIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBillPayee;
- (BOOL)hasBillType;
- (BOOL)hasDueDateRange;
- (BOOL)hasIntentMetadata;
- (BOOL)hasPaymentDateRange;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBBillPayeeValue)billPayee;
- (_INPBDateTimeRange)dueDateRange;
- (_INPBDateTimeRange)paymentDateRange;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSearchForBillsIntent)initWithCoder:(id)a3;
- (id)billTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsBillType:(id)a3;
- (int)StringAsStatus:(id)a3;
- (int)billType;
- (int)status;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBillPayee:(id)a3;
- (void)setBillType:(int)a3;
- (void)setDueDateRange:(id)a3;
- (void)setHasBillType:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setPaymentDateRange:(id)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSearchForBillsIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentDateRange, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_dueDateRange, 0);

  objc_storeStrong((id *)&self->_billPayee, 0);
}

- (int)status
{
  return self->_status;
}

- (_INPBDateTimeRange)paymentDateRange
{
  return self->_paymentDateRange;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDateTimeRange)dueDateRange
{
  return self->_dueDateRange;
}

- (int)billType
{
  return self->_billType;
}

- (_INPBBillPayeeValue)billPayee
{
  return self->_billPayee;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSearchForBillsIntent *)self billPayee];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"billPayee"];

  if ([(_INPBSearchForBillsIntent *)self hasBillType])
  {
    uint64_t v6 = [(_INPBSearchForBillsIntent *)self billType];
    if ((v6 - 1) >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E551C010[(v6 - 1)];
    }
    [v3 setObject:v7 forKeyedSubscript:@"billType"];
  }
  v8 = [(_INPBSearchForBillsIntent *)self dueDateRange];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"dueDateRange"];

  v10 = [(_INPBSearchForBillsIntent *)self intentMetadata];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"intentMetadata"];

  v12 = [(_INPBSearchForBillsIntent *)self paymentDateRange];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"paymentDateRange"];

  if ([(_INPBSearchForBillsIntent *)self hasStatus])
  {
    uint64_t v14 = [(_INPBSearchForBillsIntent *)self status];
    if ((v14 - 1) >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E551C0C0[(v14 - 1)];
    }
    [v3 setObject:v15 forKeyedSubscript:@"status"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBBillPayeeValue *)self->_billPayee hash];
  if ([(_INPBSearchForBillsIntent *)self hasBillType]) {
    uint64_t v4 = 2654435761 * self->_billType;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(_INPBDateTimeRange *)self->_dueDateRange hash];
  unint64_t v6 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v7 = [(_INPBDateTimeRange *)self->_paymentDateRange hash];
  if ([(_INPBSearchForBillsIntent *)self hasStatus]) {
    uint64_t v8 = 2654435761 * self->_status;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  unint64_t v5 = [(_INPBSearchForBillsIntent *)self billPayee];
  unint64_t v6 = [v4 billPayee];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_25;
  }
  uint64_t v7 = [(_INPBSearchForBillsIntent *)self billPayee];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBSearchForBillsIntent *)self billPayee];
    v10 = [v4 billPayee];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  int v12 = [(_INPBSearchForBillsIntent *)self hasBillType];
  if (v12 != [v4 hasBillType]) {
    goto LABEL_26;
  }
  if ([(_INPBSearchForBillsIntent *)self hasBillType])
  {
    if ([v4 hasBillType])
    {
      int billType = self->_billType;
      if (billType != [v4 billType]) {
        goto LABEL_26;
      }
    }
  }
  unint64_t v5 = [(_INPBSearchForBillsIntent *)self dueDateRange];
  unint64_t v6 = [v4 dueDateRange];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_25;
  }
  uint64_t v14 = [(_INPBSearchForBillsIntent *)self dueDateRange];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBSearchForBillsIntent *)self dueDateRange];
    v17 = [v4 dueDateRange];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForBillsIntent *)self intentMetadata];
  unint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_25;
  }
  uint64_t v19 = [(_INPBSearchForBillsIntent *)self intentMetadata];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBSearchForBillsIntent *)self intentMetadata];
    v22 = [v4 intentMetadata];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForBillsIntent *)self paymentDateRange];
  unint64_t v6 = [v4 paymentDateRange];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v24 = [(_INPBSearchForBillsIntent *)self paymentDateRange];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_INPBSearchForBillsIntent *)self paymentDateRange];
    v27 = [v4 paymentDateRange];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  int v31 = [(_INPBSearchForBillsIntent *)self hasStatus];
  if (v31 == [v4 hasStatus])
  {
    if (![(_INPBSearchForBillsIntent *)self hasStatus]
      || ![v4 hasStatus]
      || (int status = self->_status, status == [v4 status]))
    {
      BOOL v29 = 1;
      goto LABEL_27;
    }
  }
LABEL_26:
  BOOL v29 = 0;
LABEL_27:

  return v29;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBSearchForBillsIntent allocWithZone:](_INPBSearchForBillsIntent, "allocWithZone:") init];
  id v6 = [(_INPBBillPayeeValue *)self->_billPayee copyWithZone:a3];
  [(_INPBSearchForBillsIntent *)v5 setBillPayee:v6];

  if ([(_INPBSearchForBillsIntent *)self hasBillType]) {
    [(_INPBSearchForBillsIntent *)v5 setBillType:[(_INPBSearchForBillsIntent *)self billType]];
  }
  id v7 = [(_INPBDateTimeRange *)self->_dueDateRange copyWithZone:a3];
  [(_INPBSearchForBillsIntent *)v5 setDueDateRange:v7];

  id v8 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSearchForBillsIntent *)v5 setIntentMetadata:v8];

  id v9 = [(_INPBDateTimeRange *)self->_paymentDateRange copyWithZone:a3];
  [(_INPBSearchForBillsIntent *)v5 setPaymentDateRange:v9];

  if ([(_INPBSearchForBillsIntent *)self hasStatus]) {
    [(_INPBSearchForBillsIntent *)v5 setStatus:[(_INPBSearchForBillsIntent *)self status]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSearchForBillsIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSearchForBillsIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSearchForBillsIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSearchForBillsIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSearchForBillsIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  id v4 = [(_INPBSearchForBillsIntent *)self billPayee];

  if (v4)
  {
    unint64_t v5 = [(_INPBSearchForBillsIntent *)self billPayee];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSearchForBillsIntent *)self hasBillType]) {
    PBDataWriterWriteInt32Field();
  }
  id v6 = [(_INPBSearchForBillsIntent *)self dueDateRange];

  if (v6)
  {
    uint64_t v7 = [(_INPBSearchForBillsIntent *)self dueDateRange];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBSearchForBillsIntent *)self intentMetadata];

  if (v8)
  {
    id v9 = [(_INPBSearchForBillsIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(_INPBSearchForBillsIntent *)self paymentDateRange];

  if (v10)
  {
    int v11 = [(_INPBSearchForBillsIntent *)self paymentDateRange];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSearchForBillsIntent *)self hasStatus]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForBillsIntentReadFrom(self, (uint64_t)a3);
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PENDING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"COMPLETED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CANCELED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FAILED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"UNPAID"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)statusAsString:(int)a3
{
  if ((a3 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551C0C0[a3 - 1];
  }

  return v3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setStatus:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int status = a3;
  }
}

- (BOOL)hasPaymentDateRange
{
  return self->_paymentDateRange != 0;
}

- (void)setPaymentDateRange:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasDueDateRange
{
  return self->_dueDateRange != 0;
}

- (void)setDueDateRange:(id)a3
{
}

- (int)StringAsBillType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTO_INSURANCE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CABLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CAR_LEASE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CAR_LOAN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CREDIT_CARD"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ELECTRICITY"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"GAS"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"GARBAGE_AND_RECYCLING"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"HEALTH_INSURANCE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"HOME_INSURANCE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"INTERNET"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"LIFE_INSURANCE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MORTGAGE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"MUSIC_STREAMING"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"PHONE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"RENT"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SEWER"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"STUDENT_LOAN"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"TRAFFIC_TICKET"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"TUITION"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"UTILITIES"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"WATER"])
  {
    int v4 = 22;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)billTypeAsString:(int)a3
{
  if ((a3 - 1) >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551C010[a3 - 1];
  }

  return v3;
}

- (void)setHasBillType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBillType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBillType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int billType = a3;
  }
}

- (BOOL)hasBillPayee
{
  return self->_billPayee != 0;
}

- (void)setBillPayee:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end