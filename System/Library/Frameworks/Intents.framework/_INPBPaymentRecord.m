@interface _INPBPaymentRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCurrencyAmount;
- (BOOL)hasFeeAmount;
- (BOOL)hasNote;
- (BOOL)hasPayee;
- (BOOL)hasPayer;
- (BOOL)hasPaymentMethod;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBContact)payee;
- (_INPBContact)payer;
- (_INPBCurrencyAmount)currencyAmount;
- (_INPBCurrencyAmount)feeAmount;
- (_INPBPaymentMethodValue)paymentMethod;
- (_INPBPaymentRecord)initWithCoder:(id)a3;
- (_INPBString)note;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrencyAmount:(id)a3;
- (void)setFeeAmount:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setNote:(id)a3;
- (void)setPayee:(id)a3;
- (void)setPayer:(id)a3;
- (void)setPaymentMethod:(id)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPaymentRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_payer, 0);
  objc_storeStrong((id *)&self->_payee, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_feeAmount, 0);

  objc_storeStrong((id *)&self->_currencyAmount, 0);
}

- (int)status
{
  return self->_status;
}

- (_INPBPaymentMethodValue)paymentMethod
{
  return self->_paymentMethod;
}

- (_INPBContact)payer
{
  return self->_payer;
}

- (_INPBContact)payee
{
  return self->_payee;
}

- (_INPBString)note
{
  return self->_note;
}

- (_INPBCurrencyAmount)feeAmount
{
  return self->_feeAmount;
}

- (_INPBCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBPaymentRecord *)self currencyAmount];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"currencyAmount"];

  v6 = [(_INPBPaymentRecord *)self feeAmount];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"feeAmount"];

  v8 = [(_INPBPaymentRecord *)self note];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"note"];

  v10 = [(_INPBPaymentRecord *)self payee];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"payee"];

  v12 = [(_INPBPaymentRecord *)self payer];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"payer"];

  v14 = [(_INPBPaymentRecord *)self paymentMethod];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"paymentMethod"];

  if ([(_INPBPaymentRecord *)self hasStatus])
  {
    uint64_t v16 = [(_INPBPaymentRecord *)self status];
    if ((v16 - 1) >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v16);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_1E5517A60[(v16 - 1)];
    }
    [v3 setObject:v17 forKeyedSubscript:@"status"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBCurrencyAmount *)self->_currencyAmount hash];
  unint64_t v4 = [(_INPBCurrencyAmount *)self->_feeAmount hash];
  unint64_t v5 = [(_INPBString *)self->_note hash];
  unint64_t v6 = [(_INPBContact *)self->_payee hash];
  unint64_t v7 = [(_INPBContact *)self->_payer hash];
  unint64_t v8 = [(_INPBPaymentMethodValue *)self->_paymentMethod hash];
  if ([(_INPBPaymentRecord *)self hasStatus]) {
    uint64_t v9 = 2654435761 * self->_status;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  unint64_t v5 = [(_INPBPaymentRecord *)self currencyAmount];
  unint64_t v6 = [v4 currencyAmount];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(_INPBPaymentRecord *)self currencyAmount];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBPaymentRecord *)self currencyAmount];
    v10 = [v4 currencyAmount];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPaymentRecord *)self feeAmount];
  unint64_t v6 = [v4 feeAmount];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(_INPBPaymentRecord *)self feeAmount];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBPaymentRecord *)self feeAmount];
    v15 = [v4 feeAmount];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPaymentRecord *)self note];
  unint64_t v6 = [v4 note];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(_INPBPaymentRecord *)self note];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBPaymentRecord *)self note];
    v20 = [v4 note];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPaymentRecord *)self payee];
  unint64_t v6 = [v4 payee];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(_INPBPaymentRecord *)self payee];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBPaymentRecord *)self payee];
    v25 = [v4 payee];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPaymentRecord *)self payer];
  unint64_t v6 = [v4 payer];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(_INPBPaymentRecord *)self payer];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBPaymentRecord *)self payer];
    v30 = [v4 payer];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPaymentRecord *)self paymentMethod];
  unint64_t v6 = [v4 paymentMethod];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_31:

    goto LABEL_32;
  }
  uint64_t v32 = [(_INPBPaymentRecord *)self paymentMethod];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_INPBPaymentRecord *)self paymentMethod];
    v35 = [v4 paymentMethod];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  int v39 = [(_INPBPaymentRecord *)self hasStatus];
  if (v39 == [v4 hasStatus])
  {
    if (![(_INPBPaymentRecord *)self hasStatus]
      || ![v4 hasStatus]
      || (int status = self->_status, status == [v4 status]))
    {
      BOOL v37 = 1;
      goto LABEL_33;
    }
  }
LABEL_32:
  BOOL v37 = 0;
LABEL_33:

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBPaymentRecord allocWithZone:](_INPBPaymentRecord, "allocWithZone:") init];
  id v6 = [(_INPBCurrencyAmount *)self->_currencyAmount copyWithZone:a3];
  [(_INPBPaymentRecord *)v5 setCurrencyAmount:v6];

  id v7 = [(_INPBCurrencyAmount *)self->_feeAmount copyWithZone:a3];
  [(_INPBPaymentRecord *)v5 setFeeAmount:v7];

  id v8 = [(_INPBString *)self->_note copyWithZone:a3];
  [(_INPBPaymentRecord *)v5 setNote:v8];

  id v9 = [(_INPBContact *)self->_payee copyWithZone:a3];
  [(_INPBPaymentRecord *)v5 setPayee:v9];

  id v10 = [(_INPBContact *)self->_payer copyWithZone:a3];
  [(_INPBPaymentRecord *)v5 setPayer:v10];

  id v11 = [(_INPBPaymentMethodValue *)self->_paymentMethod copyWithZone:a3];
  [(_INPBPaymentRecord *)v5 setPaymentMethod:v11];

  if ([(_INPBPaymentRecord *)self hasStatus]) {
    [(_INPBPaymentRecord *)v5 setStatus:[(_INPBPaymentRecord *)self status]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPaymentRecord *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPaymentRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPaymentRecord *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPaymentRecord *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPaymentRecord *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v16 = a3;
  id v4 = [(_INPBPaymentRecord *)self currencyAmount];

  if (v4)
  {
    unint64_t v5 = [(_INPBPaymentRecord *)self currencyAmount];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBPaymentRecord *)self feeAmount];

  if (v6)
  {
    uint64_t v7 = [(_INPBPaymentRecord *)self feeAmount];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBPaymentRecord *)self note];

  if (v8)
  {
    id v9 = [(_INPBPaymentRecord *)self note];
    PBDataWriterWriteSubmessage();
  }
  id v10 = [(_INPBPaymentRecord *)self payee];

  if (v10)
  {
    id v11 = [(_INPBPaymentRecord *)self payee];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(_INPBPaymentRecord *)self payer];

  if (v12)
  {
    v13 = [(_INPBPaymentRecord *)self payer];
    PBDataWriterWriteSubmessage();
  }
  v14 = [(_INPBPaymentRecord *)self paymentMethod];

  if (v14)
  {
    v15 = [(_INPBPaymentRecord *)self paymentMethod];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBPaymentRecord *)self hasStatus]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPaymentRecordReadFrom(self, (uint64_t)a3);
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
    id v3 = off_1E5517A60[a3 - 1];
  }

  return v3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStatus:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int status = a3;
  }
}

- (BOOL)hasPaymentMethod
{
  return self->_paymentMethod != 0;
}

- (void)setPaymentMethod:(id)a3
{
}

- (BOOL)hasPayer
{
  return self->_payer != 0;
}

- (void)setPayer:(id)a3
{
}

- (BOOL)hasPayee
{
  return self->_payee != 0;
}

- (void)setPayee:(id)a3
{
}

- (BOOL)hasNote
{
  return self->_note != 0;
}

- (void)setNote:(id)a3
{
}

- (BOOL)hasFeeAmount
{
  return self->_feeAmount != 0;
}

- (void)setFeeAmount:(id)a3
{
}

- (BOOL)hasCurrencyAmount
{
  return self->_currencyAmount != 0;
}

- (void)setCurrencyAmount:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end