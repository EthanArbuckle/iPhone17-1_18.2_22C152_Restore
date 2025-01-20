@interface _INPBPayBillIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBillDetails;
- (BOOL)hasFromAccount;
- (BOOL)hasTransactionAmount;
- (BOOL)hasTransactionNote;
- (BOOL)hasTransactionScheduledDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBBillDetailsValue)billDetails;
- (_INPBDateTimeRange)transactionScheduledDate;
- (_INPBFinancialAccountValue)fromAccount;
- (_INPBPayBillIntentResponse)initWithCoder:(id)a3;
- (_INPBPaymentAmountValue)transactionAmount;
- (_INPBString)transactionNote;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBillDetails:(id)a3;
- (void)setFromAccount:(id)a3;
- (void)setTransactionAmount:(id)a3;
- (void)setTransactionNote:(id)a3;
- (void)setTransactionScheduledDate:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPayBillIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionScheduledDate, 0);
  objc_storeStrong((id *)&self->_transactionNote, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
  objc_storeStrong((id *)&self->_fromAccount, 0);

  objc_storeStrong((id *)&self->_billDetails, 0);
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

- (_INPBFinancialAccountValue)fromAccount
{
  return self->_fromAccount;
}

- (_INPBBillDetailsValue)billDetails
{
  return self->_billDetails;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBPayBillIntentResponse *)self billDetails];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"billDetails"];

  v6 = [(_INPBPayBillIntentResponse *)self fromAccount];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"fromAccount"];

  v8 = [(_INPBPayBillIntentResponse *)self transactionAmount];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"transactionAmount"];

  v10 = [(_INPBPayBillIntentResponse *)self transactionNote];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"transactionNote"];

  v12 = [(_INPBPayBillIntentResponse *)self transactionScheduledDate];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"transactionScheduledDate"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBBillDetailsValue *)self->_billDetails hash];
  unint64_t v4 = [(_INPBFinancialAccountValue *)self->_fromAccount hash] ^ v3;
  unint64_t v5 = [(_INPBPaymentAmountValue *)self->_transactionAmount hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBString *)self->_transactionNote hash];
  return v6 ^ [(_INPBDateTimeRange *)self->_transactionScheduledDate hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  unint64_t v5 = [(_INPBPayBillIntentResponse *)self billDetails];
  unint64_t v6 = [v4 billDetails];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(_INPBPayBillIntentResponse *)self billDetails];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBPayBillIntentResponse *)self billDetails];
    v10 = [v4 billDetails];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPayBillIntentResponse *)self fromAccount];
  unint64_t v6 = [v4 fromAccount];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(_INPBPayBillIntentResponse *)self fromAccount];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBPayBillIntentResponse *)self fromAccount];
    v15 = [v4 fromAccount];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPayBillIntentResponse *)self transactionAmount];
  unint64_t v6 = [v4 transactionAmount];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(_INPBPayBillIntentResponse *)self transactionAmount];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBPayBillIntentResponse *)self transactionAmount];
    v20 = [v4 transactionAmount];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPayBillIntentResponse *)self transactionNote];
  unint64_t v6 = [v4 transactionNote];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(_INPBPayBillIntentResponse *)self transactionNote];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBPayBillIntentResponse *)self transactionNote];
    v25 = [v4 transactionNote];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBPayBillIntentResponse *)self transactionScheduledDate];
  unint64_t v6 = [v4 transactionScheduledDate];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_INPBPayBillIntentResponse *)self transactionScheduledDate];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(_INPBPayBillIntentResponse *)self transactionScheduledDate];
    v30 = [v4 transactionScheduledDate];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBPayBillIntentResponse allocWithZone:](_INPBPayBillIntentResponse, "allocWithZone:") init];
  id v6 = [(_INPBBillDetailsValue *)self->_billDetails copyWithZone:a3];
  [(_INPBPayBillIntentResponse *)v5 setBillDetails:v6];

  id v7 = [(_INPBFinancialAccountValue *)self->_fromAccount copyWithZone:a3];
  [(_INPBPayBillIntentResponse *)v5 setFromAccount:v7];

  id v8 = [(_INPBPaymentAmountValue *)self->_transactionAmount copyWithZone:a3];
  [(_INPBPayBillIntentResponse *)v5 setTransactionAmount:v8];

  id v9 = [(_INPBString *)self->_transactionNote copyWithZone:a3];
  [(_INPBPayBillIntentResponse *)v5 setTransactionNote:v9];

  id v10 = [(_INPBDateTimeRange *)self->_transactionScheduledDate copyWithZone:a3];
  [(_INPBPayBillIntentResponse *)v5 setTransactionScheduledDate:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPayBillIntentResponse *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPayBillIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPayBillIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPayBillIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPayBillIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  id v4 = [(_INPBPayBillIntentResponse *)self billDetails];

  if (v4)
  {
    unint64_t v5 = [(_INPBPayBillIntentResponse *)self billDetails];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBPayBillIntentResponse *)self fromAccount];

  if (v6)
  {
    uint64_t v7 = [(_INPBPayBillIntentResponse *)self fromAccount];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBPayBillIntentResponse *)self transactionAmount];

  if (v8)
  {
    id v9 = [(_INPBPayBillIntentResponse *)self transactionAmount];
    PBDataWriterWriteSubmessage();
  }
  id v10 = [(_INPBPayBillIntentResponse *)self transactionNote];

  if (v10)
  {
    int v11 = [(_INPBPayBillIntentResponse *)self transactionNote];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(_INPBPayBillIntentResponse *)self transactionScheduledDate];

  if (v12)
  {
    v13 = [(_INPBPayBillIntentResponse *)self transactionScheduledDate];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPayBillIntentResponseReadFrom(self, (uint64_t)a3);
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

- (BOOL)hasFromAccount
{
  return self->_fromAccount != 0;
}

- (void)setFromAccount:(id)a3
{
}

- (BOOL)hasBillDetails
{
  return self->_billDetails != 0;
}

- (void)setBillDetails:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end