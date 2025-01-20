@interface INPaymentRecord
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INCurrencyAmount)currencyAmount;
- (INCurrencyAmount)feeAmount;
- (INPaymentMethod)paymentMethod;
- (INPaymentRecord)initWithCoder:(id)a3;
- (INPaymentRecord)initWithPayee:(INPerson *)payee payer:(INPerson *)payer currencyAmount:(INCurrencyAmount *)currencyAmount paymentMethod:(INPaymentMethod *)paymentMethod note:(NSString *)note status:(INPaymentStatus)status;
- (INPaymentRecord)initWithPayee:(INPerson *)payee payer:(INPerson *)payer currencyAmount:(INCurrencyAmount *)currencyAmount paymentMethod:(INPaymentMethod *)paymentMethod note:(NSString *)note status:(INPaymentStatus)status feeAmount:(INCurrencyAmount *)feeAmount;
- (INPaymentStatus)status;
- (INPerson)payee;
- (INPerson)payer;
- (NSString)description;
- (NSString)note;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INPaymentRecord

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4 = a3;
  v5 = [(INPaymentRecord *)self payee];
  objc_msgSend(v5, "_intents_updateContainerWithCache:", v4);

  v6 = [(INPaymentRecord *)self payer];
  objc_msgSend(v6, "_intents_updateContainerWithCache:", v4);

  id v7 = [(INPaymentRecord *)self paymentMethod];
  objc_msgSend(v7, "_intents_updateContainerWithCache:", v4);
}

- (id)_intents_cacheableObjects
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(INPaymentRecord *)self payee];
  v5 = objc_msgSend(v4, "_intents_cacheableObjects");
  [v3 unionSet:v5];

  v6 = [(INPaymentRecord *)self payer];
  id v7 = objc_msgSend(v6, "_intents_cacheableObjects");
  [v3 unionSet:v7];

  v8 = [(INPaymentRecord *)self paymentMethod];
  v9 = objc_msgSend(v8, "_intents_cacheableObjects");
  [v3 unionSet:v9];

  if ([v3 count]) {
    v10 = v3;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feeAmount, 0);
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_payer, 0);

  objc_storeStrong((id *)&self->_payee, 0);
}

- (INCurrencyAmount)feeAmount
{
  return self->_feeAmount;
}

- (INPaymentMethod)paymentMethod
{
  return self->_paymentMethod;
}

- (INPaymentStatus)status
{
  return self->_status;
}

- (NSString)note
{
  return self->_note;
}

- (INCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (INPerson)payer
{
  return self->_payer;
}

- (INPerson)payee
{
  return self->_payee;
}

- (id)_dictionaryRepresentation
{
  v23[7] = *MEMORY[0x1E4F143B8];
  uint64_t payee = (uint64_t)self->_payee;
  uint64_t v21 = payee;
  v22[0] = @"payee";
  if (!payee)
  {
    uint64_t payee = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)payee;
  v23[0] = payee;
  v22[1] = @"payer";
  payer = self->_payer;
  uint64_t v5 = (uint64_t)payer;
  if (!payer)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v5;
  v23[1] = v5;
  v22[2] = @"currencyAmount";
  currencyAmount = self->_currencyAmount;
  uint64_t v7 = (uint64_t)currencyAmount;
  if (!currencyAmount)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v7;
  v23[2] = v7;
  v22[3] = @"note";
  note = self->_note;
  v9 = note;
  if (!note)
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v7, v19, v20);
  }
  v23[3] = v9;
  v22[4] = @"status";
  v10 = objc_msgSend(NSNumber, "numberWithInteger:", self->_status, v17);
  v23[4] = v10;
  v22[5] = @"paymentMethod";
  paymentMethod = self->_paymentMethod;
  v12 = paymentMethod;
  if (!paymentMethod)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[5] = v12;
  v22[6] = @"feeAmount";
  feeAmount = self->_feeAmount;
  v14 = feeAmount;
  if (!feeAmount)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[6] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];
  if (feeAmount)
  {
    if (paymentMethod) {
      goto LABEL_15;
    }
  }
  else
  {

    if (paymentMethod) {
      goto LABEL_15;
    }
  }

LABEL_15:
  if (note)
  {
    if (currencyAmount) {
      goto LABEL_17;
    }
LABEL_26:

    if (payer) {
      goto LABEL_18;
    }
    goto LABEL_27;
  }

  if (!currencyAmount) {
    goto LABEL_26;
  }
LABEL_17:
  if (payer) {
    goto LABEL_18;
  }
LABEL_27:

LABEL_18:
  if (!v21) {

  }
  return v15;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  uint64_t v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INPaymentRecord;
  v6 = [(INPaymentRecord *)&v11 description];
  uint64_t v7 = [(INPaymentRecord *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INPaymentRecord *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  uint64_t v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_payee];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"payee");

  v9 = [v6 encodeObject:self->_payer];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"payer");

  v10 = [v6 encodeObject:self->_currencyAmount];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"currencyAmount");

  objc_super v11 = [v6 encodeObject:self->_note];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"note");

  unint64_t v12 = self->_status - 1;
  if (v12 > 4) {
    v13 = @"unknown";
  }
  else {
    v13 = *(&off_1E5516D88 + v12);
  }
  v14 = v13;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"status");

  v15 = [v6 encodeObject:self->_paymentMethod];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"paymentMethod");

  v16 = [v6 encodeObject:self->_feeAmount];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, @"feeAmount");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t payee = self->_payee;
  id v5 = a3;
  [v5 encodeObject:payee forKey:@"payee"];
  [v5 encodeObject:self->_payer forKey:@"payer"];
  [v5 encodeObject:self->_currencyAmount forKey:@"currencyAmount"];
  [v5 encodeObject:self->_note forKey:@"note"];
  [v5 encodeInteger:self->_status forKey:@"status"];
  [v5 encodeObject:self->_paymentMethod forKey:@"paymentMethod"];
  [v5 encodeObject:self->_feeAmount forKey:@"feeAmount"];
}

- (INPaymentRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payee"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payer"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyAmount"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"note"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"status"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentMethod"];
  objc_super v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"feeAmount"];

  unint64_t v12 = [(INPaymentRecord *)self initWithPayee:v5 payer:v6 currencyAmount:v7 paymentMethod:v10 note:v8 status:v9 feeAmount:v11];
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INPaymentRecord *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t payee = self->_payee;
      BOOL v12 = 0;
      if (payee == v5->_payee || -[INPerson isEqual:](payee, "isEqual:"))
      {
        payer = self->_payer;
        if (payer == v5->_payer || -[INPerson isEqual:](payer, "isEqual:"))
        {
          currencyAmount = self->_currencyAmount;
          if (currencyAmount == v5->_currencyAmount || -[INCurrencyAmount isEqual:](currencyAmount, "isEqual:"))
          {
            note = self->_note;
            if ((note == v5->_note || -[NSString isEqual:](note, "isEqual:"))
              && self->_status == v5->_status)
            {
              paymentMethod = self->_paymentMethod;
              if (paymentMethod == v5->_paymentMethod || -[INPaymentMethod isEqual:](paymentMethod, "isEqual:"))
              {
                feeAmount = self->_feeAmount;
                if (feeAmount == v5->_feeAmount || -[INCurrencyAmount isEqual:](feeAmount, "isEqual:")) {
                  BOOL v12 = 1;
                }
              }
            }
          }
        }
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INPerson *)self->_payee hash];
  unint64_t v4 = [(INPerson *)self->_payer hash] ^ v3;
  unint64_t v5 = [(INCurrencyAmount *)self->_currencyAmount hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_note hash];
  uint64_t v7 = [NSNumber numberWithInteger:self->_status];
  uint64_t v8 = v6 ^ [v7 hash];
  unint64_t v9 = [(INPaymentMethod *)self->_paymentMethod hash];
  unint64_t v10 = v8 ^ v9 ^ [(INCurrencyAmount *)self->_feeAmount hash];

  return v10;
}

- (INPaymentRecord)initWithPayee:(INPerson *)payee payer:(INPerson *)payer currencyAmount:(INCurrencyAmount *)currencyAmount paymentMethod:(INPaymentMethod *)paymentMethod note:(NSString *)note status:(INPaymentStatus)status
{
  return [(INPaymentRecord *)self initWithPayee:payee payer:payer currencyAmount:currencyAmount paymentMethod:paymentMethod note:note status:status feeAmount:0];
}

- (INPaymentRecord)initWithPayee:(INPerson *)payee payer:(INPerson *)payer currencyAmount:(INCurrencyAmount *)currencyAmount paymentMethod:(INPaymentMethod *)paymentMethod note:(NSString *)note status:(INPaymentStatus)status feeAmount:(INCurrencyAmount *)feeAmount
{
  v15 = payee;
  v16 = payer;
  uint64_t v17 = currencyAmount;
  v18 = paymentMethod;
  v19 = note;
  v20 = feeAmount;
  v35.receiver = self;
  v35.super_class = (Class)INPaymentRecord;
  uint64_t v21 = [(INPaymentRecord *)&v35 init];
  if (v21)
  {
    uint64_t v22 = [(INPerson *)v15 copy];
    v23 = v21->_payee;
    v21->_uint64_t payee = (INPerson *)v22;

    uint64_t v24 = [(INPerson *)v16 copy];
    v25 = v21->_payer;
    v21->_payer = (INPerson *)v24;

    uint64_t v26 = [(INCurrencyAmount *)v17 copy];
    v27 = v21->_currencyAmount;
    v21->_currencyAmount = (INCurrencyAmount *)v26;

    uint64_t v28 = [(NSString *)v19 copy];
    v29 = v21->_note;
    v21->_note = (NSString *)v28;

    v21->_status = status;
    uint64_t v30 = [(INPaymentMethod *)v18 copy];
    v31 = v21->_paymentMethod;
    v21->_paymentMethod = (INPaymentMethod *)v30;

    uint64_t v32 = [(INCurrencyAmount *)v20 copy];
    v33 = v21->_feeAmount;
    v21->_feeAmount = (INCurrencyAmount *)v32;
  }
  return v21;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31 = (objc_class *)a1;
    uint64_t v9 = objc_opt_class();
    unint64_t v10 = [v8 objectForKeyedSubscript:@"payee"];
    objc_super v11 = [v7 decodeObjectOfClass:v9 from:v10];

    uint64_t v12 = objc_opt_class();
    v13 = [v8 objectForKeyedSubscript:@"payer"];
    v14 = [v7 decodeObjectOfClass:v12 from:v13];

    uint64_t v15 = objc_opt_class();
    v16 = [v8 objectForKeyedSubscript:@"currencyAmount"];
    uint64_t v17 = [v7 decodeObjectOfClass:v15 from:v16];

    uint64_t v18 = objc_opt_class();
    v19 = [v8 objectForKeyedSubscript:@"note"];
    v20 = [v7 decodeObjectOfClass:v18 from:v19];

    uint64_t v21 = [v8 objectForKeyedSubscript:@"status"];
    uint64_t v22 = INPaymentStatusWithString(v21);

    uint64_t v23 = objc_opt_class();
    uint64_t v24 = [v8 objectForKeyedSubscript:@"paymentMethod"];
    v25 = [v7 decodeObjectOfClass:v23 from:v24];

    uint64_t v26 = objc_opt_class();
    v27 = [v8 objectForKeyedSubscript:@"feeAmount"];
    uint64_t v28 = [v7 decodeObjectOfClass:v26 from:v27];

    v29 = (void *)[[v31 alloc] initWithPayee:v11 payer:v14 currencyAmount:v17 paymentMethod:v25 note:v20 status:v22 feeAmount:v28];
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end