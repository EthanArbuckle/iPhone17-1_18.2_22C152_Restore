@interface INTransferMoneyIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)_isUserConfirmationRequired;
- (INDateComponentsRange)transactionScheduledDate;
- (INPaymentAccount)fromAccount;
- (INPaymentAccount)toAccount;
- (INPaymentAmount)transactionAmount;
- (INTransferMoneyIntent)initWithFromAccount:(INPaymentAccount *)fromAccount toAccount:(INPaymentAccount *)toAccount transactionAmount:(INPaymentAmount *)transactionAmount transactionScheduledDate:(INDateComponentsRange *)transactionScheduledDate transactionNote:(NSString *)transactionNote;
- (NSString)transactionNote;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setFromAccount:(id)a3;
- (void)setToAccount:(id)a3;
- (void)setTransactionAmount:(id)a3;
- (void)setTransactionNote:(id)a3;
- (void)setTransactionScheduledDate:(id)a3;
@end

@implementation INTransferMoneyIntent

- (id)verb
{
  return @"TransferMoney";
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
  v7 = [(INTransferMoneyIntent *)self _typedBackingStore];
  id v16 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 fromAccount];
  v10 = INIntentSlotValueRedactedFinancialAccountValueFromFinancialAccountValue(v9, a3, v16);
  [v8 setFromAccount:v10];

  v11 = [v7 toAccount];
  v12 = INIntentSlotValueRedactedFinancialAccountValueFromFinancialAccountValue(v11, a3, v16);
  [v8 setToAccount:v12];

  id v13 = [v7 transactionAmount];
  [v8 setTransactionAmount:v13];

  v14 = [v7 transactionScheduledDate];
  v15 = INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v14, a3);

  [v8 setTransactionScheduledDate:v15];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v17[5] = *MEMORY[0x1E4F143B8];
  v16[0] = @"fromAccount";
  uint64_t v3 = [(INTransferMoneyIntent *)self fromAccount];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v3;
  v16[1] = @"toAccount";
  v5 = [(INTransferMoneyIntent *)self toAccount];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v6;
  v16[2] = @"transactionAmount";
  v7 = [(INTransferMoneyIntent *)self transactionAmount];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[2] = v8;
  v16[3] = @"transactionScheduledDate";
  v9 = [(INTransferMoneyIntent *)self transactionScheduledDate];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[3] = v10;
  v16[4] = @"transactionNote";
  v11 = [(INTransferMoneyIntent *)self transactionNote];
  v12 = v11;
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[4] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
  if (!v11) {

  }
  if (!v9) {
  if (!v7)
  }

  if (!v5) {
  if (!v4)
  }

  return v13;
}

- (void)setTransactionNote:(id)a3
{
  id v4 = a3;
  id v5 = [(INTransferMoneyIntent *)self _typedBackingStore];
  [v5 setTransactionNote:v4];
}

- (NSString)transactionNote
{
  v2 = [(INTransferMoneyIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 transactionNote];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setTransactionScheduledDate:(id)a3
{
  id v4 = a3;
  id v6 = [(INTransferMoneyIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v6 setTransactionScheduledDate:v5];
}

- (INDateComponentsRange)transactionScheduledDate
{
  v2 = [(INTransferMoneyIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 transactionScheduledDate];
  id v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (void)setTransactionAmount:(id)a3
{
  id v4 = a3;
  id v6 = [(INTransferMoneyIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToPaymentAmountValue(v4);

  [v6 setTransactionAmount:v5];
}

- (INPaymentAmount)transactionAmount
{
  v2 = [(INTransferMoneyIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 transactionAmount];
  id v4 = INIntentSlotValueTransformFromPaymentAmountValue(v3);

  return (INPaymentAmount *)v4;
}

- (void)setToAccount:(id)a3
{
  id v4 = a3;
  id v6 = [(INTransferMoneyIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToFinancialAccountValue(v4);

  [v6 setToAccount:v5];
}

- (INPaymentAccount)toAccount
{
  v2 = [(INTransferMoneyIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 toAccount];
  id v4 = INIntentSlotValueTransformFromFinancialAccountValue(v3);

  return (INPaymentAccount *)v4;
}

- (void)setFromAccount:(id)a3
{
  id v4 = a3;
  id v6 = [(INTransferMoneyIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToFinancialAccountValue(v4);

  [v6 setFromAccount:v5];
}

- (INPaymentAccount)fromAccount
{
  v2 = [(INTransferMoneyIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 fromAccount];
  id v4 = INIntentSlotValueTransformFromFinancialAccountValue(v3);

  return (INPaymentAccount *)v4;
}

- (INTransferMoneyIntent)initWithFromAccount:(INPaymentAccount *)fromAccount toAccount:(INPaymentAccount *)toAccount transactionAmount:(INPaymentAmount *)transactionAmount transactionScheduledDate:(INDateComponentsRange *)transactionScheduledDate transactionNote:(NSString *)transactionNote
{
  v12 = fromAccount;
  id v13 = toAccount;
  v14 = transactionAmount;
  v15 = transactionScheduledDate;
  id v16 = transactionNote;
  v20.receiver = self;
  v20.super_class = (Class)INTransferMoneyIntent;
  v17 = [(INIntent *)&v20 init];
  v18 = v17;
  if (v17)
  {
    [(INTransferMoneyIntent *)v17 setFromAccount:v12];
    [(INTransferMoneyIntent *)v18 setToAccount:v13];
    [(INTransferMoneyIntent *)v18 setTransactionAmount:v14];
    [(INTransferMoneyIntent *)v18 setTransactionScheduledDate:v15];
    [(INTransferMoneyIntent *)v18 setTransactionNote:v16];
  }

  return v18;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INTransferMoneyIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INTransferMoneyIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end