@interface INBillDetails
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INBillDetails)initWithBillType:(INBillType)billType paymentStatus:(INPaymentStatus)paymentStatus billPayee:(INBillPayee *)billPayee amountDue:(INCurrencyAmount *)amountDue minimumDue:(INCurrencyAmount *)minimumDue lateFee:(INCurrencyAmount *)lateFee dueDate:(NSDateComponents *)dueDate paymentDate:(NSDateComponents *)paymentDate;
- (INBillDetails)initWithCoder:(id)a3;
- (INBillPayee)billPayee;
- (INBillType)billType;
- (INCurrencyAmount)amountDue;
- (INCurrencyAmount)lateFee;
- (INCurrencyAmount)minimumDue;
- (INPaymentStatus)paymentStatus;
- (NSDateComponents)dueDate;
- (NSDateComponents)paymentDate;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAmountDue:(INCurrencyAmount *)amountDue;
- (void)setBillPayee:(INBillPayee *)billPayee;
- (void)setBillType:(INBillType)billType;
- (void)setDueDate:(NSDateComponents *)dueDate;
- (void)setLateFee:(INCurrencyAmount *)lateFee;
- (void)setMinimumDue:(INCurrencyAmount *)minimumDue;
- (void)setPaymentDate:(NSDateComponents *)paymentDate;
- (void)setPaymentStatus:(INPaymentStatus)paymentStatus;
@end

@implementation INBillDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentDate, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_lateFee, 0);
  objc_storeStrong((id *)&self->_minimumDue, 0);
  objc_storeStrong((id *)&self->_amountDue, 0);

  objc_storeStrong((id *)&self->_billPayee, 0);
}

- (void)setPaymentStatus:(INPaymentStatus)paymentStatus
{
  self->_paymentStatus = paymentStatus;
}

- (INPaymentStatus)paymentStatus
{
  return self->_paymentStatus;
}

- (void)setBillType:(INBillType)billType
{
  self->_billType = billType;
}

- (INBillType)billType
{
  return self->_billType;
}

- (void)setPaymentDate:(NSDateComponents *)paymentDate
{
}

- (NSDateComponents)paymentDate
{
  return self->_paymentDate;
}

- (void)setDueDate:(NSDateComponents *)dueDate
{
}

- (NSDateComponents)dueDate
{
  return self->_dueDate;
}

- (void)setLateFee:(INCurrencyAmount *)lateFee
{
}

- (INCurrencyAmount)lateFee
{
  return self->_lateFee;
}

- (void)setMinimumDue:(INCurrencyAmount *)minimumDue
{
}

- (INCurrencyAmount)minimumDue
{
  return self->_minimumDue;
}

- (void)setAmountDue:(INCurrencyAmount *)amountDue
{
}

- (INCurrencyAmount)amountDue
{
  return self->_amountDue;
}

- (void)setBillPayee:(INBillPayee *)billPayee
{
}

- (INBillPayee)billPayee
{
  return self->_billPayee;
}

- (id)_dictionaryRepresentation
{
  v24[8] = *MEMORY[0x1E4F143B8];
  uint64_t billPayee = (uint64_t)self->_billPayee;
  uint64_t v22 = billPayee;
  v23[0] = @"billPayee";
  if (!billPayee)
  {
    uint64_t billPayee = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)billPayee;
  v24[0] = billPayee;
  v23[1] = @"amountDue";
  amountDue = self->_amountDue;
  uint64_t v5 = (uint64_t)amountDue;
  if (!amountDue)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v5;
  v24[1] = v5;
  v23[2] = @"minimumDue";
  minimumDue = self->_minimumDue;
  uint64_t v7 = (uint64_t)minimumDue;
  if (!minimumDue)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v7;
  v24[2] = v7;
  v23[3] = @"lateFee";
  lateFee = self->_lateFee;
  uint64_t v9 = (uint64_t)lateFee;
  if (!lateFee)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v18 = (void *)v9;
  v24[3] = v9;
  v23[4] = @"dueDate";
  dueDate = self->_dueDate;
  v11 = dueDate;
  if (!dueDate)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[4] = v11;
  v23[5] = @"paymentDate";
  paymentDate = self->_paymentDate;
  v13 = paymentDate;
  if (!paymentDate)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[5] = v13;
  v23[6] = @"billType";
  v14 = [NSNumber numberWithInteger:self->_billType];
  v24[6] = v14;
  v23[7] = @"paymentStatus";
  v15 = [NSNumber numberWithInteger:self->_paymentStatus];
  v24[7] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:8];

  if (paymentDate)
  {
    if (dueDate) {
      goto LABEL_15;
    }
  }
  else
  {

    if (dueDate)
    {
LABEL_15:
      if (lateFee) {
        goto LABEL_16;
      }
      goto LABEL_25;
    }
  }

  if (lateFee)
  {
LABEL_16:
    if (minimumDue) {
      goto LABEL_17;
    }
LABEL_26:

    if (amountDue) {
      goto LABEL_18;
    }
    goto LABEL_27;
  }
LABEL_25:

  if (!minimumDue) {
    goto LABEL_26;
  }
LABEL_17:
  if (amountDue) {
    goto LABEL_18;
  }
LABEL_27:

LABEL_18:
  if (!v22) {

  }
  return v16;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  uint64_t v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INBillDetails;
  v6 = [(INBillDetails *)&v11 description];
  uint64_t v7 = [(INBillDetails *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  uint64_t v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INBillDetails *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  uint64_t v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_billPayee];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"billPayee");

  uint64_t v9 = [v6 encodeObject:self->_amountDue];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"amountDue");

  v10 = [v6 encodeObject:self->_minimumDue];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"minimumDue");

  objc_super v11 = [v6 encodeObject:self->_lateFee];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"lateFee");

  v12 = [v6 encodeObject:self->_dueDate];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"dueDate");

  v13 = [v6 encodeObject:self->_paymentDate];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"paymentDate");
  unint64_t v14 = self->_billType - 1;
  if (v14 > 0x15) {
    v15 = @"unknown";
  }
  else {
    v15 = off_1E5519408[v14];
  }
  v16 = v15;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, @"billType");

  unint64_t v17 = self->_paymentStatus - 1;
  if (v17 > 4) {
    v18 = @"unknown";
  }
  else {
    v18 = *(&off_1E5516D88 + v17);
  }
  v19 = v18;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, @"paymentStatus");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t billPayee = self->_billPayee;
  id v5 = a3;
  [v5 encodeObject:billPayee forKey:@"billPayee"];
  [v5 encodeObject:self->_amountDue forKey:@"amountDue"];
  [v5 encodeObject:self->_minimumDue forKey:@"minimumDue"];
  [v5 encodeObject:self->_lateFee forKey:@"lateFee"];
  [v5 encodeObject:self->_dueDate forKey:@"dueDate"];
  [v5 encodeObject:self->_paymentDate forKey:@"paymentDate"];
  [v5 encodeInteger:self->_billType forKey:@"billType"];
  [v5 encodeInteger:self->_paymentStatus forKey:@"paymentStatus"];
}

- (INBillDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"billPayee"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amountDue"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumDue"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lateFee"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dueDate"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentDate"];
  uint64_t v11 = [v4 decodeIntegerForKey:@"billType"];
  uint64_t v12 = [v4 decodeIntegerForKey:@"paymentStatus"];

  v13 = [(INBillDetails *)self initWithBillType:v11 paymentStatus:v12 billPayee:v5 amountDue:v6 minimumDue:v7 lateFee:v8 dueDate:v9 paymentDate:v10];
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (INBillDetails *)a3;
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
      uint64_t billPayee = self->_billPayee;
      BOOL v12 = (billPayee == v5->_billPayee || -[INBillPayee isEqual:](billPayee, "isEqual:"))
         && ((amountDue = self->_amountDue, amountDue == v5->_amountDue)
          || -[INCurrencyAmount isEqual:](amountDue, "isEqual:"))
         && ((minimumDue = self->_minimumDue, minimumDue == v5->_minimumDue)
          || -[INCurrencyAmount isEqual:](minimumDue, "isEqual:"))
         && ((lateFee = self->_lateFee, lateFee == v5->_lateFee) || -[INCurrencyAmount isEqual:](lateFee, "isEqual:"))
         && ((dueDate = self->_dueDate, dueDate == v5->_dueDate)
          || -[NSDateComponents isEqual:](dueDate, "isEqual:"))
         && ((paymentDate = self->_paymentDate, paymentDate == v5->_paymentDate)
          || -[NSDateComponents isEqual:](paymentDate, "isEqual:"))
         && self->_billType == v5->_billType
         && self->_paymentStatus == v5->_paymentStatus;
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
  unint64_t v3 = [(INBillPayee *)self->_billPayee hash];
  unint64_t v4 = [(INCurrencyAmount *)self->_amountDue hash] ^ v3;
  unint64_t v5 = [(INCurrencyAmount *)self->_minimumDue hash];
  unint64_t v6 = v4 ^ v5 ^ [(INCurrencyAmount *)self->_lateFee hash];
  uint64_t v7 = [(NSDateComponents *)self->_dueDate hash];
  uint64_t v8 = v6 ^ v7 ^ [(NSDateComponents *)self->_paymentDate hash];
  uint64_t v9 = [NSNumber numberWithInteger:self->_billType];
  uint64_t v10 = [v9 hash];
  uint64_t v11 = [NSNumber numberWithInteger:self->_paymentStatus];
  unint64_t v12 = v8 ^ v10 ^ [v11 hash];

  return v12;
}

- (INBillDetails)initWithBillType:(INBillType)billType paymentStatus:(INPaymentStatus)paymentStatus billPayee:(INBillPayee *)billPayee amountDue:(INCurrencyAmount *)amountDue minimumDue:(INCurrencyAmount *)minimumDue lateFee:(INCurrencyAmount *)lateFee dueDate:(NSDateComponents *)dueDate paymentDate:(NSDateComponents *)paymentDate
{
  v16 = billPayee;
  unint64_t v17 = amountDue;
  v18 = minimumDue;
  v19 = lateFee;
  v20 = dueDate;
  v21 = paymentDate;
  v36.receiver = self;
  v36.super_class = (Class)INBillDetails;
  uint64_t v22 = [(INBillDetails *)&v36 init];
  if (v22)
  {
    uint64_t v23 = [(INBillPayee *)v16 copy];
    v24 = v22->_billPayee;
    v22->_uint64_t billPayee = (INBillPayee *)v23;

    uint64_t v25 = [(INCurrencyAmount *)v17 copy];
    v26 = v22->_amountDue;
    v22->_amountDue = (INCurrencyAmount *)v25;

    uint64_t v27 = [(INCurrencyAmount *)v18 copy];
    v28 = v22->_minimumDue;
    v22->_minimumDue = (INCurrencyAmount *)v27;

    uint64_t v29 = [(INCurrencyAmount *)v19 copy];
    v30 = v22->_lateFee;
    v22->_lateFee = (INCurrencyAmount *)v29;

    uint64_t v31 = [(NSDateComponents *)v20 copy];
    v32 = v22->_dueDate;
    v22->_dueDate = (NSDateComponents *)v31;

    uint64_t v33 = [(NSDateComponents *)v21 copy];
    v34 = v22->_paymentDate;
    v22->_paymentDate = (NSDateComponents *)v33;

    v22->_billType = billType;
    v22->_paymentStatus = paymentStatus;
  }

  return v22;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [v8 objectForKeyedSubscript:@"billPayee"];
    uint64_t v33 = [v7 decodeObjectOfClass:v9 from:v10];

    v32 = (objc_class *)a1;
    uint64_t v11 = objc_opt_class();
    unint64_t v12 = [v8 objectForKeyedSubscript:@"amountDue"];
    v13 = [v7 decodeObjectOfClass:v11 from:v12];

    uint64_t v14 = objc_opt_class();
    v15 = [v8 objectForKeyedSubscript:@"minimumDue"];
    v16 = [v7 decodeObjectOfClass:v14 from:v15];

    uint64_t v17 = objc_opt_class();
    v18 = [v8 objectForKeyedSubscript:@"lateFee"];
    v19 = [v7 decodeObjectOfClass:v17 from:v18];

    uint64_t v20 = objc_opt_class();
    v21 = [v8 objectForKeyedSubscript:@"dueDate"];
    uint64_t v22 = [v7 decodeObjectOfClass:v20 from:v21];

    uint64_t v23 = objc_opt_class();
    v24 = [v8 objectForKeyedSubscript:@"paymentDate"];
    uint64_t v25 = [v7 decodeObjectOfClass:v23 from:v24];

    v26 = [v8 objectForKeyedSubscript:@"billType"];
    uint64_t v27 = INBillTypeWithString(v26);

    v28 = [v8 objectForKeyedSubscript:@"paymentStatus"];
    uint64_t v29 = INPaymentStatusWithString(v28);

    v30 = (void *)[[v32 alloc] initWithBillType:v27 paymentStatus:v29 billPayee:v33 amountDue:v13 minimumDue:v16 lateFee:v19 dueDate:v22 paymentDate:v25];
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end