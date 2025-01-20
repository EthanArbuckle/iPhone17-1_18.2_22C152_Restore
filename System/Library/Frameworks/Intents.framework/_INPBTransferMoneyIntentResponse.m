@interface _INPBTransferMoneyIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasFromAccount;
- (BOOL)hasToAccount;
- (BOOL)hasTransactionAmount;
- (BOOL)hasTransactionNote;
- (BOOL)hasTransactionScheduledDate;
- (BOOL)hasTransferFee;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)transactionNote;
- (_INPBCurrencyAmountValue)transferFee;
- (_INPBDateTimeRange)transactionScheduledDate;
- (_INPBFinancialAccountValue)fromAccount;
- (_INPBFinancialAccountValue)toAccount;
- (_INPBPaymentAmountValue)transactionAmount;
- (_INPBTransferMoneyIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFromAccount:(id)a3;
- (void)setToAccount:(id)a3;
- (void)setTransactionAmount:(id)a3;
- (void)setTransactionNote:(id)a3;
- (void)setTransactionScheduledDate:(id)a3;
- (void)setTransferFee:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBTransferMoneyIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferFee, 0);
  objc_storeStrong((id *)&self->_transactionScheduledDate, 0);
  objc_storeStrong((id *)&self->_transactionNote, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
  objc_storeStrong((id *)&self->_toAccount, 0);

  objc_storeStrong((id *)&self->_fromAccount, 0);
}

- (_INPBCurrencyAmountValue)transferFee
{
  return self->_transferFee;
}

- (_INPBDateTimeRange)transactionScheduledDate
{
  return self->_transactionScheduledDate;
}

- (NSString)transactionNote
{
  return self->_transactionNote;
}

- (_INPBPaymentAmountValue)transactionAmount
{
  return self->_transactionAmount;
}

- (_INPBFinancialAccountValue)toAccount
{
  return self->_toAccount;
}

- (_INPBFinancialAccountValue)fromAccount
{
  return self->_fromAccount;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBTransferMoneyIntentResponse *)self fromAccount];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"fromAccount"];

  v6 = [(_INPBTransferMoneyIntentResponse *)self toAccount];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"toAccount"];

  v8 = [(_INPBTransferMoneyIntentResponse *)self transactionAmount];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"transactionAmount"];

  if (self->_transactionNote)
  {
    v10 = [(_INPBTransferMoneyIntentResponse *)self transactionNote];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"transactionNote"];
  }
  v12 = [(_INPBTransferMoneyIntentResponse *)self transactionScheduledDate];
  v13 = [v12 dictionaryRepresentation];
  [v3 setObject:v13 forKeyedSubscript:@"transactionScheduledDate"];

  v14 = [(_INPBTransferMoneyIntentResponse *)self transferFee];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"transferFee"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBFinancialAccountValue *)self->_fromAccount hash];
  unint64_t v4 = [(_INPBFinancialAccountValue *)self->_toAccount hash] ^ v3;
  unint64_t v5 = [(_INPBPaymentAmountValue *)self->_transactionAmount hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_transactionNote hash];
  unint64_t v7 = [(_INPBDateTimeRange *)self->_transactionScheduledDate hash];
  return v6 ^ v7 ^ [(_INPBCurrencyAmountValue *)self->_transferFee hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  unint64_t v5 = [(_INPBTransferMoneyIntentResponse *)self fromAccount];
  NSUInteger v6 = [v4 fromAccount];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(_INPBTransferMoneyIntentResponse *)self fromAccount];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBTransferMoneyIntentResponse *)self fromAccount];
    v10 = [v4 fromAccount];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBTransferMoneyIntentResponse *)self toAccount];
  NSUInteger v6 = [v4 toAccount];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(_INPBTransferMoneyIntentResponse *)self toAccount];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBTransferMoneyIntentResponse *)self toAccount];
    v15 = [v4 toAccount];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBTransferMoneyIntentResponse *)self transactionAmount];
  NSUInteger v6 = [v4 transactionAmount];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(_INPBTransferMoneyIntentResponse *)self transactionAmount];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBTransferMoneyIntentResponse *)self transactionAmount];
    v20 = [v4 transactionAmount];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBTransferMoneyIntentResponse *)self transactionNote];
  NSUInteger v6 = [v4 transactionNote];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(_INPBTransferMoneyIntentResponse *)self transactionNote];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBTransferMoneyIntentResponse *)self transactionNote];
    v25 = [v4 transactionNote];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBTransferMoneyIntentResponse *)self transactionScheduledDate];
  NSUInteger v6 = [v4 transactionScheduledDate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(_INPBTransferMoneyIntentResponse *)self transactionScheduledDate];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBTransferMoneyIntentResponse *)self transactionScheduledDate];
    v30 = [v4 transactionScheduledDate];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBTransferMoneyIntentResponse *)self transferFee];
  NSUInteger v6 = [v4 transferFee];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v32 = [(_INPBTransferMoneyIntentResponse *)self transferFee];
    if (!v32)
    {

LABEL_35:
      BOOL v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    v34 = [(_INPBTransferMoneyIntentResponse *)self transferFee];
    v35 = [v4 transferFee];
    char v36 = [v34 isEqual:v35];

    if (v36) {
      goto LABEL_35;
    }
  }
  else
  {
LABEL_31:
  }
LABEL_32:
  BOOL v37 = 0;
LABEL_33:

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBTransferMoneyIntentResponse allocWithZone:](_INPBTransferMoneyIntentResponse, "allocWithZone:") init];
  id v6 = [(_INPBFinancialAccountValue *)self->_fromAccount copyWithZone:a3];
  [(_INPBTransferMoneyIntentResponse *)v5 setFromAccount:v6];

  id v7 = [(_INPBFinancialAccountValue *)self->_toAccount copyWithZone:a3];
  [(_INPBTransferMoneyIntentResponse *)v5 setToAccount:v7];

  id v8 = [(_INPBPaymentAmountValue *)self->_transactionAmount copyWithZone:a3];
  [(_INPBTransferMoneyIntentResponse *)v5 setTransactionAmount:v8];

  v9 = (void *)[(NSString *)self->_transactionNote copyWithZone:a3];
  [(_INPBTransferMoneyIntentResponse *)v5 setTransactionNote:v9];

  id v10 = [(_INPBDateTimeRange *)self->_transactionScheduledDate copyWithZone:a3];
  [(_INPBTransferMoneyIntentResponse *)v5 setTransactionScheduledDate:v10];

  id v11 = [(_INPBCurrencyAmountValue *)self->_transferFee copyWithZone:a3];
  [(_INPBTransferMoneyIntentResponse *)v5 setTransferFee:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBTransferMoneyIntentResponse *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBTransferMoneyIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBTransferMoneyIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBTransferMoneyIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBTransferMoneyIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v15 = a3;
  id v4 = [(_INPBTransferMoneyIntentResponse *)self fromAccount];

  if (v4)
  {
    unint64_t v5 = [(_INPBTransferMoneyIntentResponse *)self fromAccount];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBTransferMoneyIntentResponse *)self toAccount];

  if (v6)
  {
    uint64_t v7 = [(_INPBTransferMoneyIntentResponse *)self toAccount];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBTransferMoneyIntentResponse *)self transactionAmount];

  if (v8)
  {
    v9 = [(_INPBTransferMoneyIntentResponse *)self transactionAmount];
    PBDataWriterWriteSubmessage();
  }
  id v10 = [(_INPBTransferMoneyIntentResponse *)self transactionNote];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  id v11 = [(_INPBTransferMoneyIntentResponse *)self transactionScheduledDate];

  if (v11)
  {
    uint64_t v12 = [(_INPBTransferMoneyIntentResponse *)self transactionScheduledDate];
    PBDataWriterWriteSubmessage();
  }
  v13 = [(_INPBTransferMoneyIntentResponse *)self transferFee];

  if (v13)
  {
    v14 = [(_INPBTransferMoneyIntentResponse *)self transferFee];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBTransferMoneyIntentResponseReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTransferFee
{
  return self->_transferFee != 0;
}

- (void)setTransferFee:(id)a3
{
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
  id v4 = (NSString *)[a3 copy];
  transactionNote = self->_transactionNote;
  self->_transactionNote = v4;

  MEMORY[0x1F41817F8](v4, transactionNote);
}

- (BOOL)hasTransactionAmount
{
  return self->_transactionAmount != 0;
}

- (void)setTransactionAmount:(id)a3
{
}

- (BOOL)hasToAccount
{
  return self->_toAccount != 0;
}

- (void)setToAccount:(id)a3
{
}

- (BOOL)hasFromAccount
{
  return self->_fromAccount != 0;
}

- (void)setFromAccount:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end