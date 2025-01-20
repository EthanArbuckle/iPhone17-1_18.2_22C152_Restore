@interface _INPBSendPaymentIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCurrencyAmount;
- (BOOL)hasIntentMetadata;
- (BOOL)hasNote;
- (BOOL)hasPayee;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBContact)payee;
- (_INPBCurrencyAmount)currencyAmount;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSendPaymentIntent)initWithCoder:(id)a3;
- (_INPBString)note;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrencyAmount:(id)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setNote:(id)a3;
- (void)setPayee:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSendPaymentIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payee, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);

  objc_storeStrong((id *)&self->_currencyAmount, 0);
}

- (_INPBContact)payee
{
  return self->_payee;
}

- (_INPBString)note
{
  return self->_note;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSendPaymentIntent *)self currencyAmount];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"currencyAmount"];

  v6 = [(_INPBSendPaymentIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  v8 = [(_INPBSendPaymentIntent *)self note];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"note"];

  v10 = [(_INPBSendPaymentIntent *)self payee];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"payee"];

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBCurrencyAmount *)self->_currencyAmount hash];
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash] ^ v3;
  unint64_t v5 = [(_INPBString *)self->_note hash];
  return v4 ^ v5 ^ [(_INPBContact *)self->_payee hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(_INPBSendPaymentIntent *)self currencyAmount];
  v6 = [v4 currencyAmount];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(_INPBSendPaymentIntent *)self currencyAmount];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBSendPaymentIntent *)self currencyAmount];
    v10 = [v4 currencyAmount];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSendPaymentIntent *)self intentMetadata];
  v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(_INPBSendPaymentIntent *)self intentMetadata];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBSendPaymentIntent *)self intentMetadata];
    v15 = [v4 intentMetadata];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSendPaymentIntent *)self note];
  v6 = [v4 note];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(_INPBSendPaymentIntent *)self note];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBSendPaymentIntent *)self note];
    v20 = [v4 note];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSendPaymentIntent *)self payee];
  v6 = [v4 payee];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(_INPBSendPaymentIntent *)self payee];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(_INPBSendPaymentIntent *)self payee];
    v25 = [v4 payee];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBSendPaymentIntent allocWithZone:](_INPBSendPaymentIntent, "allocWithZone:") init];
  id v6 = [(_INPBCurrencyAmount *)self->_currencyAmount copyWithZone:a3];
  [(_INPBSendPaymentIntent *)v5 setCurrencyAmount:v6];

  id v7 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSendPaymentIntent *)v5 setIntentMetadata:v7];

  id v8 = [(_INPBString *)self->_note copyWithZone:a3];
  [(_INPBSendPaymentIntent *)v5 setNote:v8];

  id v9 = [(_INPBContact *)self->_payee copyWithZone:a3];
  [(_INPBSendPaymentIntent *)v5 setPayee:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSendPaymentIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSendPaymentIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSendPaymentIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSendPaymentIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSendPaymentIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  id v4 = [(_INPBSendPaymentIntent *)self currencyAmount];

  if (v4)
  {
    unint64_t v5 = [(_INPBSendPaymentIntent *)self currencyAmount];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBSendPaymentIntent *)self intentMetadata];

  if (v6)
  {
    uint64_t v7 = [(_INPBSendPaymentIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  id v8 = [(_INPBSendPaymentIntent *)self note];

  if (v8)
  {
    id v9 = [(_INPBSendPaymentIntent *)self note];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(_INPBSendPaymentIntent *)self payee];

  if (v10)
  {
    int v11 = [(_INPBSendPaymentIntent *)self payee];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSendPaymentIntentReadFrom(self, (uint64_t)a3);
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

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
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