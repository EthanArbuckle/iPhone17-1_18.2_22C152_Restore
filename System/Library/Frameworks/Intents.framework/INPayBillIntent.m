@interface INPayBillIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)_isUserConfirmationRequired;
- (INBillPayee)billPayee;
- (INBillType)billType;
- (INDateComponentsRange)dueDate;
- (INDateComponentsRange)transactionScheduledDate;
- (INPayBillIntent)initWithBillPayee:(INBillPayee *)billPayee fromAccount:(INPaymentAccount *)fromAccount transactionAmount:(INPaymentAmount *)transactionAmount transactionScheduledDate:(INDateComponentsRange *)transactionScheduledDate transactionNote:(NSString *)transactionNote billType:(INBillType)billType dueDate:(INDateComponentsRange *)dueDate;
- (INPaymentAccount)fromAccount;
- (INPaymentAmount)transactionAmount;
- (NSString)transactionNote;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setBillPayee:(id)a3;
- (void)setBillType:(int64_t)a3;
- (void)setDueDate:(id)a3;
- (void)setFromAccount:(id)a3;
- (void)setTransactionAmount:(id)a3;
- (void)setTransactionNote:(id)a3;
- (void)setTransactionScheduledDate:(id)a3;
@end

@implementation INPayBillIntent

- (id)verb
{
  return @"PayBill";
}

- (id)domain
{
  return @"Payments";
}

- (BOOL)_isUserConfirmationRequired
{
  return 1;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INPayBillIntent *)self _typedBackingStore];
  id v20 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 billPayee];
  v10 = INIntentSlotValueRedactedBillPayeeValueFromBillPayeeValue(v9, a3);
  [v8 setBillPayee:v10];

  v11 = [v7 fromAccount];
  v12 = INIntentSlotValueRedactedFinancialAccountValueFromFinancialAccountValue(v11, a3, v20);
  [v8 setFromAccount:v12];

  id v13 = [v7 transactionAmount];
  [v8 setTransactionAmount:v13];

  v14 = [v7 transactionScheduledDate];
  v15 = INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v14, a3);
  [v8 setTransactionScheduledDate:v15];

  v16 = [v7 transactionNote];
  v17 = INIntentSlotValueRedactedStringFromString(v16, a3, v20);
  [v8 setTransactionNote:v17];

  v18 = [v7 dueDate];
  v19 = INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v18, a3);

  [v8 setDueDate:v19];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v25[7] = *MEMORY[0x1E4F143B8];
  v24[0] = @"billPayee";
  uint64_t v3 = [(INPayBillIntent *)self billPayee];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v3;
  v25[0] = v3;
  v24[1] = @"fromAccount";
  uint64_t v5 = [(INPayBillIntent *)self fromAccount];
  id v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v5;
  v25[1] = v5;
  v24[2] = @"transactionAmount";
  uint64_t v7 = [(INPayBillIntent *)self transactionAmount];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v7;
  v25[2] = v7;
  v24[3] = @"transactionScheduledDate";
  uint64_t v9 = [(INPayBillIntent *)self transactionScheduledDate];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[3] = v9;
  v24[4] = @"transactionNote";
  v11 = [(INPayBillIntent *)self transactionNote];
  v12 = v11;
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v12;
  v24[5] = @"billType";
  INBillType v13 = [(INPayBillIntent *)self billType];
  if ((unint64_t)(v13 - 1) > 0x15) {
    v14 = @"unknown";
  }
  else {
    v14 = off_1E5519408[v13 - 1];
  }
  v15 = v14;
  v25[5] = v15;
  v24[6] = @"dueDate";
  v16 = [(INPayBillIntent *)self dueDate];
  v17 = v16;
  if (!v16)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[6] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:7];
  if (!v16) {

  }
  if (!v11) {
  if (!v10)
  }

  if (!v8) {
  if (!v6)
  }

  if (!v4) {

  }
  return v18;
}

- (void)setDueDate:(id)a3
{
  id v4 = a3;
  id v6 = [(INPayBillIntent *)self _typedBackingStore];
  uint64_t v5 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v6 setDueDate:v5];
}

- (INDateComponentsRange)dueDate
{
  v2 = [(INPayBillIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 dueDate];
  id v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (void)setBillType:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  id v4 = [(INPayBillIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 0x15) {
    [v4 setHasBillType:0];
  }
  else {
    objc_msgSend(v4, "setBillType:");
  }
}

- (INBillType)billType
{
  unint64_t v3 = [(INPayBillIntent *)self _typedBackingStore];
  int v4 = [v3 hasBillType];
  id v5 = [(INPayBillIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 billType] - 1;
  if (v6 <= 0x15) {
    INBillType v7 = v6 + 1;
  }
  else {
    INBillType v7 = INBillTypeUnknown;
  }
  if (v4) {
    INBillType v8 = v7;
  }
  else {
    INBillType v8 = INBillTypeUnknown;
  }

  return v8;
}

- (void)setTransactionNote:(id)a3
{
  id v4 = a3;
  id v6 = [(INPayBillIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToString(v4);

  [v6 setTransactionNote:v5];
}

- (NSString)transactionNote
{
  v2 = [(INPayBillIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 transactionNote];
  id v4 = INIntentSlotValueTransformFromString(v3);

  return (NSString *)v4;
}

- (void)setTransactionScheduledDate:(id)a3
{
  id v4 = a3;
  id v6 = [(INPayBillIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v6 setTransactionScheduledDate:v5];
}

- (INDateComponentsRange)transactionScheduledDate
{
  v2 = [(INPayBillIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 transactionScheduledDate];
  id v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (void)setTransactionAmount:(id)a3
{
  id v4 = a3;
  id v6 = [(INPayBillIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToPaymentAmountValue(v4);

  [v6 setTransactionAmount:v5];
}

- (INPaymentAmount)transactionAmount
{
  v2 = [(INPayBillIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 transactionAmount];
  id v4 = INIntentSlotValueTransformFromPaymentAmountValue(v3);

  return (INPaymentAmount *)v4;
}

- (void)setFromAccount:(id)a3
{
  id v4 = a3;
  id v6 = [(INPayBillIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToFinancialAccountValue(v4);

  [v6 setFromAccount:v5];
}

- (INPaymentAccount)fromAccount
{
  v2 = [(INPayBillIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 fromAccount];
  id v4 = INIntentSlotValueTransformFromFinancialAccountValue(v3);

  return (INPaymentAccount *)v4;
}

- (void)setBillPayee:(id)a3
{
  id v4 = a3;
  id v6 = [(INPayBillIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToBillPayeeValue(v4);

  [v6 setBillPayee:v5];
}

- (INBillPayee)billPayee
{
  v2 = [(INPayBillIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 billPayee];
  id v4 = INIntentSlotValueTransformFromBillPayeeValue(v3);

  return (INBillPayee *)v4;
}

- (INPayBillIntent)initWithBillPayee:(INBillPayee *)billPayee fromAccount:(INPaymentAccount *)fromAccount transactionAmount:(INPaymentAmount *)transactionAmount transactionScheduledDate:(INDateComponentsRange *)transactionScheduledDate transactionNote:(NSString *)transactionNote billType:(INBillType)billType dueDate:(INDateComponentsRange *)dueDate
{
  v15 = billPayee;
  v16 = fromAccount;
  v17 = transactionAmount;
  v18 = transactionScheduledDate;
  v19 = transactionNote;
  id v20 = dueDate;
  v24.receiver = self;
  v24.super_class = (Class)INPayBillIntent;
  v21 = [(INIntent *)&v24 init];
  v22 = v21;
  if (v21)
  {
    [(INPayBillIntent *)v21 setBillPayee:v15];
    [(INPayBillIntent *)v22 setFromAccount:v16];
    [(INPayBillIntent *)v22 setTransactionAmount:v17];
    [(INPayBillIntent *)v22 setTransactionScheduledDate:v18];
    [(INPayBillIntent *)v22 setTransactionNote:v19];
    [(INPayBillIntent *)v22 setBillType:billType];
    [(INPayBillIntent *)v22 setDueDate:v20];
  }

  return v22;
}

- (id)_categoryVerb
{
  return @"Pay";
}

- (int64_t)_intentCategory
{
  return 4;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INPayBillIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INPayBillIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = v2;
  }
  else {
    unint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end