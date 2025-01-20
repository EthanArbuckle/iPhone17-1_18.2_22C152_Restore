@interface _INPBBillDetailsValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAmountDue;
- (BOOL)hasBillPayee;
- (BOOL)hasBillType;
- (BOOL)hasDueDate;
- (BOOL)hasLateFee;
- (BOOL)hasMinimumDue;
- (BOOL)hasPaymentDate;
- (BOOL)hasStatus;
- (BOOL)hasValueMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBBillDetailsValue)initWithCoder:(id)a3;
- (_INPBBillPayeeValue)billPayee;
- (_INPBCurrencyAmountValue)amountDue;
- (_INPBCurrencyAmountValue)lateFee;
- (_INPBCurrencyAmountValue)minimumDue;
- (_INPBDateTime)dueDate;
- (_INPBDateTime)paymentDate;
- (_INPBValueMetadata)valueMetadata;
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
- (void)setAmountDue:(id)a3;
- (void)setBillPayee:(id)a3;
- (void)setBillType:(int)a3;
- (void)setDueDate:(id)a3;
- (void)setHasBillType:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setLateFee:(id)a3;
- (void)setMinimumDue:(id)a3;
- (void)setPaymentDate:(id)a3;
- (void)setStatus:(int)a3;
- (void)setValueMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBBillDetailsValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMetadata, 0);
  objc_storeStrong((id *)&self->_paymentDate, 0);
  objc_storeStrong((id *)&self->_minimumDue, 0);
  objc_storeStrong((id *)&self->_lateFee, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_billPayee, 0);

  objc_storeStrong((id *)&self->_amountDue, 0);
}

- (_INPBValueMetadata)valueMetadata
{
  return self->_valueMetadata;
}

- (int)status
{
  return self->_status;
}

- (_INPBDateTime)paymentDate
{
  return self->_paymentDate;
}

- (_INPBCurrencyAmountValue)minimumDue
{
  return self->_minimumDue;
}

- (_INPBCurrencyAmountValue)lateFee
{
  return self->_lateFee;
}

- (_INPBDateTime)dueDate
{
  return self->_dueDate;
}

- (int)billType
{
  return self->_billType;
}

- (_INPBBillPayeeValue)billPayee
{
  return self->_billPayee;
}

- (_INPBCurrencyAmountValue)amountDue
{
  return self->_amountDue;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBBillDetailsValue *)self amountDue];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"amountDue"];

  v6 = [(_INPBBillDetailsValue *)self billPayee];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"billPayee"];

  if ([(_INPBBillDetailsValue *)self hasBillType])
  {
    uint64_t v8 = [(_INPBBillDetailsValue *)self billType];
    if ((v8 - 1) >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E5518DA0[(v8 - 1)];
    }
    [v3 setObject:v9 forKeyedSubscript:@"billType"];
  }
  v10 = [(_INPBBillDetailsValue *)self dueDate];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"dueDate"];

  v12 = [(_INPBBillDetailsValue *)self lateFee];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"lateFee"];

  v14 = [(_INPBBillDetailsValue *)self minimumDue];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"minimumDue"];

  v16 = [(_INPBBillDetailsValue *)self paymentDate];
  v17 = [v16 dictionaryRepresentation];
  [v3 setObject:v17 forKeyedSubscript:@"paymentDate"];

  if ([(_INPBBillDetailsValue *)self hasStatus])
  {
    uint64_t v18 = [(_INPBBillDetailsValue *)self status];
    if ((v18 - 1) >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v18);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E5518E50[(v18 - 1)];
    }
    [v3 setObject:v19 forKeyedSubscript:@"status"];
  }
  v20 = [(_INPBBillDetailsValue *)self valueMetadata];
  v21 = [v20 dictionaryRepresentation];
  [v3 setObject:v21 forKeyedSubscript:@"valueMetadata"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBCurrencyAmountValue *)self->_amountDue hash];
  unint64_t v4 = [(_INPBBillPayeeValue *)self->_billPayee hash];
  if ([(_INPBBillDetailsValue *)self hasBillType]) {
    uint64_t v5 = 2654435761 * self->_billType;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(_INPBDateTime *)self->_dueDate hash];
  unint64_t v7 = [(_INPBCurrencyAmountValue *)self->_lateFee hash];
  unint64_t v8 = [(_INPBCurrencyAmountValue *)self->_minimumDue hash];
  unint64_t v9 = [(_INPBDateTime *)self->_paymentDate hash];
  if ([(_INPBBillDetailsValue *)self hasStatus]) {
    uint64_t v10 = 2654435761 * self->_status;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(_INPBValueMetadata *)self->_valueMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_45;
  }
  uint64_t v5 = [(_INPBBillDetailsValue *)self amountDue];
  unint64_t v6 = [v4 amountDue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v7 = [(_INPBBillDetailsValue *)self amountDue];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_INPBBillDetailsValue *)self amountDue];
    uint64_t v10 = [v4 amountDue];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBBillDetailsValue *)self billPayee];
  unint64_t v6 = [v4 billPayee];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v12 = [(_INPBBillDetailsValue *)self billPayee];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBBillDetailsValue *)self billPayee];
    v15 = [v4 billPayee];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  int v17 = [(_INPBBillDetailsValue *)self hasBillType];
  if (v17 != [v4 hasBillType]) {
    goto LABEL_45;
  }
  if ([(_INPBBillDetailsValue *)self hasBillType])
  {
    if ([v4 hasBillType])
    {
      int billType = self->_billType;
      if (billType != [v4 billType]) {
        goto LABEL_45;
      }
    }
  }
  uint64_t v5 = [(_INPBBillDetailsValue *)self dueDate];
  unint64_t v6 = [v4 dueDate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v19 = [(_INPBBillDetailsValue *)self dueDate];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBBillDetailsValue *)self dueDate];
    v22 = [v4 dueDate];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBBillDetailsValue *)self lateFee];
  unint64_t v6 = [v4 lateFee];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v24 = [(_INPBBillDetailsValue *)self lateFee];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_INPBBillDetailsValue *)self lateFee];
    v27 = [v4 lateFee];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBBillDetailsValue *)self minimumDue];
  unint64_t v6 = [v4 minimumDue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v29 = [(_INPBBillDetailsValue *)self minimumDue];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [(_INPBBillDetailsValue *)self minimumDue];
    v32 = [v4 minimumDue];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBBillDetailsValue *)self paymentDate];
  unint64_t v6 = [v4 paymentDate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_44;
  }
  uint64_t v34 = [(_INPBBillDetailsValue *)self paymentDate];
  if (v34)
  {
    v35 = (void *)v34;
    v36 = [(_INPBBillDetailsValue *)self paymentDate];
    v37 = [v4 paymentDate];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_45;
    }
  }
  else
  {
  }
  int v39 = [(_INPBBillDetailsValue *)self hasStatus];
  if (v39 != [v4 hasStatus]) {
    goto LABEL_45;
  }
  if ([(_INPBBillDetailsValue *)self hasStatus])
  {
    if ([v4 hasStatus])
    {
      int status = self->_status;
      if (status != [v4 status]) {
        goto LABEL_45;
      }
    }
  }
  uint64_t v5 = [(_INPBBillDetailsValue *)self valueMetadata];
  unint64_t v6 = [v4 valueMetadata];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v41 = [(_INPBBillDetailsValue *)self valueMetadata];
    if (!v41)
    {

LABEL_48:
      BOOL v46 = 1;
      goto LABEL_46;
    }
    v42 = (void *)v41;
    v43 = [(_INPBBillDetailsValue *)self valueMetadata];
    v44 = [v4 valueMetadata];
    char v45 = [v43 isEqual:v44];

    if (v45) {
      goto LABEL_48;
    }
  }
  else
  {
LABEL_44:
  }
LABEL_45:
  BOOL v46 = 0;
LABEL_46:

  return v46;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBBillDetailsValue allocWithZone:](_INPBBillDetailsValue, "allocWithZone:") init];
  id v6 = [(_INPBCurrencyAmountValue *)self->_amountDue copyWithZone:a3];
  [(_INPBBillDetailsValue *)v5 setAmountDue:v6];

  id v7 = [(_INPBBillPayeeValue *)self->_billPayee copyWithZone:a3];
  [(_INPBBillDetailsValue *)v5 setBillPayee:v7];

  if ([(_INPBBillDetailsValue *)self hasBillType]) {
    [(_INPBBillDetailsValue *)v5 setBillType:[(_INPBBillDetailsValue *)self billType]];
  }
  id v8 = [(_INPBDateTime *)self->_dueDate copyWithZone:a3];
  [(_INPBBillDetailsValue *)v5 setDueDate:v8];

  id v9 = [(_INPBCurrencyAmountValue *)self->_lateFee copyWithZone:a3];
  [(_INPBBillDetailsValue *)v5 setLateFee:v9];

  id v10 = [(_INPBCurrencyAmountValue *)self->_minimumDue copyWithZone:a3];
  [(_INPBBillDetailsValue *)v5 setMinimumDue:v10];

  id v11 = [(_INPBDateTime *)self->_paymentDate copyWithZone:a3];
  [(_INPBBillDetailsValue *)v5 setPaymentDate:v11];

  if ([(_INPBBillDetailsValue *)self hasStatus]) {
    [(_INPBBillDetailsValue *)v5 setStatus:[(_INPBBillDetailsValue *)self status]];
  }
  id v12 = [(_INPBValueMetadata *)self->_valueMetadata copyWithZone:a3];
  [(_INPBBillDetailsValue *)v5 setValueMetadata:v12];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBBillDetailsValue *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBBillDetailsValue)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBBillDetailsValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBBillDetailsValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBBillDetailsValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v19 = a3;
  id v4 = [(_INPBBillDetailsValue *)self amountDue];

  if (v4)
  {
    uint64_t v5 = [(_INPBBillDetailsValue *)self amountDue];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBBillDetailsValue *)self billPayee];

  if (v6)
  {
    uint64_t v7 = [(_INPBBillDetailsValue *)self billPayee];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBBillDetailsValue *)self hasBillType]) {
    PBDataWriterWriteInt32Field();
  }
  id v8 = [(_INPBBillDetailsValue *)self dueDate];

  if (v8)
  {
    id v9 = [(_INPBBillDetailsValue *)self dueDate];
    PBDataWriterWriteSubmessage();
  }
  id v10 = [(_INPBBillDetailsValue *)self lateFee];

  if (v10)
  {
    id v11 = [(_INPBBillDetailsValue *)self lateFee];
    PBDataWriterWriteSubmessage();
  }
  id v12 = [(_INPBBillDetailsValue *)self minimumDue];

  if (v12)
  {
    v13 = [(_INPBBillDetailsValue *)self minimumDue];
    PBDataWriterWriteSubmessage();
  }
  v14 = [(_INPBBillDetailsValue *)self paymentDate];

  if (v14)
  {
    v15 = [(_INPBBillDetailsValue *)self paymentDate];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBBillDetailsValue *)self hasStatus]) {
    PBDataWriterWriteInt32Field();
  }
  int v16 = [(_INPBBillDetailsValue *)self valueMetadata];

  int v17 = v19;
  if (v16)
  {
    uint64_t v18 = [(_INPBBillDetailsValue *)self valueMetadata];
    PBDataWriterWriteSubmessage();

    int v17 = v19;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBBillDetailsValueReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasValueMetadata
{
  return self->_valueMetadata != 0;
}

- (void)setValueMetadata:(id)a3
{
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
    id v3 = off_1E5518E50[a3 - 1];
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

- (BOOL)hasPaymentDate
{
  return self->_paymentDate != 0;
}

- (void)setPaymentDate:(id)a3
{
}

- (BOOL)hasMinimumDue
{
  return self->_minimumDue != 0;
}

- (void)setMinimumDue:(id)a3
{
}

- (BOOL)hasLateFee
{
  return self->_lateFee != 0;
}

- (void)setLateFee:(id)a3
{
}

- (BOOL)hasDueDate
{
  return self->_dueDate != 0;
}

- (void)setDueDate:(id)a3
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
    id v3 = off_1E5518DA0[a3 - 1];
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

- (BOOL)hasAmountDue
{
  return self->_amountDue != 0;
}

- (void)setAmountDue:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end