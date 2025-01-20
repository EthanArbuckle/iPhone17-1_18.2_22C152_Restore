@interface _INPBRequestPaymentIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPaymentRecord;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBPaymentRecord)paymentRecord;
- (_INPBRequestPaymentIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPaymentRecord:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBRequestPaymentIntentResponse

- (_INPBRequestPaymentIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBRequestPaymentIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        v6 = (_INPBRequestPaymentIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBRequestPaymentIntentResponse *)self initWithData:v6];

    v6 = self;
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (_INPBPaymentRecord)paymentRecord
{
  return self->_paymentRecord;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(_INPBRequestPaymentIntentResponse *)self paymentRecord];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"paymentRecord"];

  return v3;
}

- (unint64_t)hash
{
  return [(_INPBPaymentRecord *)self->_paymentRecord hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_INPBRequestPaymentIntentResponse *)self paymentRecord];
    v6 = [v4 paymentRecord];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_INPBRequestPaymentIntentResponse *)self paymentRecord];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_INPBRequestPaymentIntentResponse *)self paymentRecord];
      v11 = [v4 paymentRecord];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBRequestPaymentIntentResponse allocWithZone:](_INPBRequestPaymentIntentResponse, "allocWithZone:") init];
  id v6 = [(_INPBPaymentRecord *)self->_paymentRecord copyWithZone:a3];
  [(_INPBRequestPaymentIntentResponse *)v5 setPaymentRecord:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBRequestPaymentIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBRequestPaymentIntentResponse *)self paymentRecord];

  if (v4)
  {
    v5 = [(_INPBRequestPaymentIntentResponse *)self paymentRecord];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRequestPaymentIntentResponseReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasPaymentRecord
{
  return self->_paymentRecord != 0;
}

- (void)setPaymentRecord:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end