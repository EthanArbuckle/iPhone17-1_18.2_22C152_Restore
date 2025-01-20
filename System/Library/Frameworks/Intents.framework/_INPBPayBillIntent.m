@interface _INPBPayBillIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBillPayee;
- (BOOL)hasBillType;
- (BOOL)hasDueDate;
- (BOOL)hasFromAccount;
- (BOOL)hasIntentMetadata;
- (BOOL)hasTransactionAmount;
- (BOOL)hasTransactionNote;
- (BOOL)hasTransactionScheduledDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBBillPayeeValue)billPayee;
- (_INPBDateTimeRange)dueDate;
- (_INPBDateTimeRange)transactionScheduledDate;
- (_INPBFinancialAccountValue)fromAccount;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBPayBillIntent)initWithCoder:(id)a3;
- (_INPBPaymentAmountValue)transactionAmount;
- (_INPBString)transactionNote;
- (id)billTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsBillType:(id)a3;
- (int)billType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBillPayee:(id)a3;
- (void)setBillType:(int)a3;
- (void)setDueDate:(id)a3;
- (void)setFromAccount:(id)a3;
- (void)setHasBillType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setTransactionAmount:(id)a3;
- (void)setTransactionNote:(id)a3;
- (void)setTransactionScheduledDate:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPayBillIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionScheduledDate, 0);
  objc_storeStrong((id *)&self->_transactionNote, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_fromAccount, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);

  objc_storeStrong((id *)&self->_billPayee, 0);
}

- (_INPBDateTimeRange)transactionScheduledDate
{
  return self->_transactionScheduledDate;
}

- (_INPBString)transactionNote
{
  return self->_transactionNote;
}

- (_INPBPaymentAmountValue)transactionAmount
{
  return self->_transactionAmount;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBFinancialAccountValue)fromAccount
{
  return self->_fromAccount;
}

- (_INPBDateTimeRange)dueDate
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

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBPayBillIntent *)self billPayee];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"billPayee"];

  if ([(_INPBPayBillIntent *)self hasBillType])
  {
    uint64_t v6 = [(_INPBPayBillIntent *)self billType];
    if ((v6 - 1) >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E5519FD0[(v6 - 1)];
    }
    [v3 setObject:v7 forKeyedSubscript:@"billType"];
  }
  v8 = [(_INPBPayBillIntent *)self dueDate];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"dueDate"];

  v10 = [(_INPBPayBillIntent *)self fromAccount];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"fromAccount"];

  v12 = [(_INPBPayBillIntent *)self intentMetadata];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"intentMetadata"];

  v14 = [(_INPBPayBillIntent *)self transactionAmount];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"transactionAmount"];

  v16 = [(_INPBPayBillIntent *)self transactionNote];
  v17 = [v16 dictionaryRepresentation];
  [v3 setObject:v17 forKeyedSubscript:@"transactionNote"];

  v18 = [(_INPBPayBillIntent *)self transactionScheduledDate];
  v19 = [v18 dictionaryRepresentation];
  [v3 setObject:v19 forKeyedSubscript:@"transactionScheduledDate"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBBillPayeeValue *)self->_billPayee hash];
  if ([(_INPBPayBillIntent *)self hasBillType]) {
    uint64_t v4 = 2654435761 * self->_billType;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  unint64_t v6 = [(_INPBDateTimeRange *)self->_dueDate hash];
  unint64_t v7 = v5 ^ v6 ^ [(_INPBFinancialAccountValue *)self->_fromAccount hash];
  unint64_t v8 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  unint64_t v9 = v8 ^ [(_INPBPaymentAmountValue *)self->_transactionAmount hash];
  unint64_t v10 = v7 ^ v9 ^ [(_INPBString *)self->_transactionNote hash];
  return v10 ^ [(_INPBDateTimeRange *)self->_transactionScheduledDate hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  unint64_t v5 = [(_INPBPayBillIntent *)self billPayee];
  unint64_t v6 = [v4 billPayee];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v7 = [(_INPBPayBillIntent *)self billPayee];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_INPBPayBillIntent *)self billPayee];
    unint64_t v10 = [v4 billPayee];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  int v12 = [(_INPBPayBillIntent *)self hasBillType];
  if (v12 != [v4 hasBillType]) {
    goto LABEL_41;
  }
  if ([(_INPBPayBillIntent *)self hasBillType])
  {
    if ([v4 hasBillType])
    {
      int billType = self->_billType;
      if (billType != [v4 billType]) {
        goto LABEL_41;
      }
    }
  }
  unint64_t v5 = [(_INPBPayBillIntent *)self dueDate];
  unint64_t v6 = [v4 dueDate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v14 = [(_INPBPayBillIntent *)self dueDate];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBPayBillIntent *)self dueDate];
    v17 = [v4 dueDate];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPayBillIntent *)self fromAccount];
  unint64_t v6 = [v4 fromAccount];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v19 = [(_INPBPayBillIntent *)self fromAccount];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBPayBillIntent *)self fromAccount];
    v22 = [v4 fromAccount];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPayBillIntent *)self intentMetadata];
  unint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v24 = [(_INPBPayBillIntent *)self intentMetadata];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_INPBPayBillIntent *)self intentMetadata];
    v27 = [v4 intentMetadata];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPayBillIntent *)self transactionAmount];
  unint64_t v6 = [v4 transactionAmount];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v29 = [(_INPBPayBillIntent *)self transactionAmount];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [(_INPBPayBillIntent *)self transactionAmount];
    v32 = [v4 transactionAmount];
    int v33 = [v31 isEqual:v32];

    if (!v33) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPayBillIntent *)self transactionNote];
  unint64_t v6 = [v4 transactionNote];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v34 = [(_INPBPayBillIntent *)self transactionNote];
  if (v34)
  {
    v35 = (void *)v34;
    v36 = [(_INPBPayBillIntent *)self transactionNote];
    v37 = [v4 transactionNote];
    int v38 = [v36 isEqual:v37];

    if (!v38) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPayBillIntent *)self transactionScheduledDate];
  unint64_t v6 = [v4 transactionScheduledDate];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v39 = [(_INPBPayBillIntent *)self transactionScheduledDate];
    if (!v39)
    {

LABEL_44:
      BOOL v44 = 1;
      goto LABEL_42;
    }
    v40 = (void *)v39;
    v41 = [(_INPBPayBillIntent *)self transactionScheduledDate];
    v42 = [v4 transactionScheduledDate];
    char v43 = [v41 isEqual:v42];

    if (v43) {
      goto LABEL_44;
    }
  }
  else
  {
LABEL_40:
  }
LABEL_41:
  BOOL v44 = 0;
LABEL_42:

  return v44;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBPayBillIntent allocWithZone:](_INPBPayBillIntent, "allocWithZone:") init];
  id v6 = [(_INPBBillPayeeValue *)self->_billPayee copyWithZone:a3];
  [(_INPBPayBillIntent *)v5 setBillPayee:v6];

  if ([(_INPBPayBillIntent *)self hasBillType]) {
    [(_INPBPayBillIntent *)v5 setBillType:[(_INPBPayBillIntent *)self billType]];
  }
  id v7 = [(_INPBDateTimeRange *)self->_dueDate copyWithZone:a3];
  [(_INPBPayBillIntent *)v5 setDueDate:v7];

  id v8 = [(_INPBFinancialAccountValue *)self->_fromAccount copyWithZone:a3];
  [(_INPBPayBillIntent *)v5 setFromAccount:v8];

  id v9 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBPayBillIntent *)v5 setIntentMetadata:v9];

  id v10 = [(_INPBPaymentAmountValue *)self->_transactionAmount copyWithZone:a3];
  [(_INPBPayBillIntent *)v5 setTransactionAmount:v10];

  id v11 = [(_INPBString *)self->_transactionNote copyWithZone:a3];
  [(_INPBPayBillIntent *)v5 setTransactionNote:v11];

  id v12 = [(_INPBDateTimeRange *)self->_transactionScheduledDate copyWithZone:a3];
  [(_INPBPayBillIntent *)v5 setTransactionScheduledDate:v12];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPayBillIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPayBillIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPayBillIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPayBillIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPayBillIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v19 = a3;
  id v4 = [(_INPBPayBillIntent *)self billPayee];

  if (v4)
  {
    unint64_t v5 = [(_INPBPayBillIntent *)self billPayee];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBPayBillIntent *)self hasBillType]) {
    PBDataWriterWriteInt32Field();
  }
  id v6 = [(_INPBPayBillIntent *)self dueDate];

  if (v6)
  {
    uint64_t v7 = [(_INPBPayBillIntent *)self dueDate];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBPayBillIntent *)self fromAccount];

  if (v8)
  {
    id v9 = [(_INPBPayBillIntent *)self fromAccount];
    PBDataWriterWriteSubmessage();
  }
  id v10 = [(_INPBPayBillIntent *)self intentMetadata];

  if (v10)
  {
    id v11 = [(_INPBPayBillIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v12 = [(_INPBPayBillIntent *)self transactionAmount];

  if (v12)
  {
    v13 = [(_INPBPayBillIntent *)self transactionAmount];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v14 = [(_INPBPayBillIntent *)self transactionNote];

  if (v14)
  {
    v15 = [(_INPBPayBillIntent *)self transactionNote];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(_INPBPayBillIntent *)self transactionScheduledDate];

  v17 = v19;
  if (v16)
  {
    int v18 = [(_INPBPayBillIntent *)self transactionScheduledDate];
    PBDataWriterWriteSubmessage();

    v17 = v19;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPayBillIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTransactionScheduledDate
{
  return self->_transactionScheduledDate != 0;
}

- (void)setTransactionScheduledDate:(id)a3
{
}

- (BOOL)hasTransactionNote
{
  return self->_transactionNote != 0;
}

- (void)setTransactionNote:(id)a3
{
}

- (BOOL)hasTransactionAmount
{
  return self->_transactionAmount != 0;
}

- (void)setTransactionAmount:(id)a3
{
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (BOOL)hasFromAccount
{
  return self->_fromAccount != 0;
}

- (void)setFromAccount:(id)a3
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
    id v3 = off_1E5519FD0[a3 - 1];
  }

  return v3;
}

- (void)setHasBillType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
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