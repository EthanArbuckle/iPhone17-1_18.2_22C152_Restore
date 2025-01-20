@interface _INPBTransferMoneyIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasFromAccount;
- (BOOL)hasIntentMetadata;
- (BOOL)hasToAccount;
- (BOOL)hasTransactionAmount;
- (BOOL)hasTransactionNote;
- (BOOL)hasTransactionScheduledDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)transactionNote;
- (_INPBDateTimeRange)transactionScheduledDate;
- (_INPBFinancialAccountValue)fromAccount;
- (_INPBFinancialAccountValue)toAccount;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBPaymentAmountValue)transactionAmount;
- (_INPBTransferMoneyIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFromAccount:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setToAccount:(id)a3;
- (void)setTransactionAmount:(id)a3;
- (void)setTransactionNote:(id)a3;
- (void)setTransactionScheduledDate:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBTransferMoneyIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionScheduledDate, 0);
  objc_storeStrong((id *)&self->_transactionNote, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
  objc_storeStrong((id *)&self->_toAccount, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_fromAccount, 0);
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

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBFinancialAccountValue)fromAccount
{
  return self->_fromAccount;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBTransferMoneyIntent *)self fromAccount];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"fromAccount"];

  v6 = [(_INPBTransferMoneyIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  v8 = [(_INPBTransferMoneyIntent *)self toAccount];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"toAccount"];

  v10 = [(_INPBTransferMoneyIntent *)self transactionAmount];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"transactionAmount"];

  if (self->_transactionNote)
  {
    v12 = [(_INPBTransferMoneyIntent *)self transactionNote];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"transactionNote"];
  }
  v14 = [(_INPBTransferMoneyIntent *)self transactionScheduledDate];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"transactionScheduledDate"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBFinancialAccountValue *)self->_fromAccount hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
  unint64_t v5 = [(_INPBFinancialAccountValue *)self->_toAccount hash];
  unint64_t v6 = v4 ^ v5 ^ [(_INPBPaymentAmountValue *)self->_transactionAmount hash];
  NSUInteger v7 = [(NSString *)self->_transactionNote hash];
  return v6 ^ v7 ^ [(_INPBDateTimeRange *)self->_transactionScheduledDate hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  unint64_t v5 = [(_INPBTransferMoneyIntent *)self fromAccount];
  unint64_t v6 = [v4 fromAccount];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(_INPBTransferMoneyIntent *)self fromAccount];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBTransferMoneyIntent *)self fromAccount];
    v10 = [v4 fromAccount];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBTransferMoneyIntent *)self intentMetadata];
  unint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(_INPBTransferMoneyIntent *)self intentMetadata];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBTransferMoneyIntent *)self intentMetadata];
    v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBTransferMoneyIntent *)self toAccount];
  unint64_t v6 = [v4 toAccount];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(_INPBTransferMoneyIntent *)self toAccount];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBTransferMoneyIntent *)self toAccount];
    v20 = [v4 toAccount];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBTransferMoneyIntent *)self transactionAmount];
  unint64_t v6 = [v4 transactionAmount];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(_INPBTransferMoneyIntent *)self transactionAmount];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_INPBTransferMoneyIntent *)self transactionAmount];
    v25 = [v4 transactionAmount];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBTransferMoneyIntent *)self transactionNote];
  unint64_t v6 = [v4 transactionNote];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(_INPBTransferMoneyIntent *)self transactionNote];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_INPBTransferMoneyIntent *)self transactionNote];
    v30 = [v4 transactionNote];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBTransferMoneyIntent *)self transactionScheduledDate];
  unint64_t v6 = [v4 transactionScheduledDate];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v32 = [(_INPBTransferMoneyIntent *)self transactionScheduledDate];
    if (!v32)
    {

LABEL_35:
      BOOL v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    v34 = [(_INPBTransferMoneyIntent *)self transactionScheduledDate];
    v35 = [v4 transactionScheduledDate];
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
  unint64_t v5 = [+[_INPBTransferMoneyIntent allocWithZone:](_INPBTransferMoneyIntent, "allocWithZone:") init];
  id v6 = [(_INPBFinancialAccountValue *)self->_fromAccount copyWithZone:a3];
  [(_INPBTransferMoneyIntent *)v5 setFromAccount:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBTransferMoneyIntent *)v5 setIntentMetadata:v7];

  id v8 = [(_INPBFinancialAccountValue *)self->_toAccount copyWithZone:a3];
  [(_INPBTransferMoneyIntent *)v5 setToAccount:v8];

  id v9 = [(_INPBPaymentAmountValue *)self->_transactionAmount copyWithZone:a3];
  [(_INPBTransferMoneyIntent *)v5 setTransactionAmount:v9];

  v10 = (void *)[(NSString *)self->_transactionNote copyWithZone:a3];
  [(_INPBTransferMoneyIntent *)v5 setTransactionNote:v10];

  id v11 = [(_INPBDateTimeRange *)self->_transactionScheduledDate copyWithZone:a3];
  [(_INPBTransferMoneyIntent *)v5 setTransactionScheduledDate:v11];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBTransferMoneyIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBTransferMoneyIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBTransferMoneyIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBTransferMoneyIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBTransferMoneyIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v15 = a3;
  id v4 = [(_INPBTransferMoneyIntent *)self fromAccount];

  if (v4)
  {
    unint64_t v5 = [(_INPBTransferMoneyIntent *)self fromAccount];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBTransferMoneyIntent *)self intentMetadata];

  if (v6)
  {
    uint64_t v7 = [(_INPBTransferMoneyIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBTransferMoneyIntent *)self toAccount];

  if (v8)
  {
    id v9 = [(_INPBTransferMoneyIntent *)self toAccount];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(_INPBTransferMoneyIntent *)self transactionAmount];

  if (v10)
  {
    id v11 = [(_INPBTransferMoneyIntent *)self transactionAmount];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(_INPBTransferMoneyIntent *)self transactionNote];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  v13 = [(_INPBTransferMoneyIntent *)self transactionScheduledDate];

  if (v13)
  {
    v14 = [(_INPBTransferMoneyIntent *)self transactionScheduledDate];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBTransferMoneyIntentReadFrom(self, (uint64_t)a3);
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
  self->_transactionNote = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end