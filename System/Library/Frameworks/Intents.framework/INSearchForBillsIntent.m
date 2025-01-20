@interface INSearchForBillsIntent
+ (BOOL)supportsSecureCoding;
- (INBillPayee)billPayee;
- (INBillType)billType;
- (INDateComponentsRange)dueDateRange;
- (INDateComponentsRange)paymentDateRange;
- (INPaymentStatus)status;
- (INSearchForBillsIntent)initWithBillPayee:(INBillPayee *)billPayee paymentDateRange:(INDateComponentsRange *)paymentDateRange billType:(INBillType)billType status:(INPaymentStatus)status dueDateRange:(INDateComponentsRange *)dueDateRange;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setBillPayee:(id)a3;
- (void)setBillType:(int64_t)a3;
- (void)setDueDateRange:(id)a3;
- (void)setPaymentDateRange:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation INSearchForBillsIntent

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INSearchForBillsIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (INBillPayee)billPayee
{
  v2 = [(INSearchForBillsIntent *)self _typedBackingStore];
  v3 = [v2 billPayee];
  id v4 = INIntentSlotValueTransformFromBillPayeeValue(v3);

  return (INBillPayee *)v4;
}

- (INSearchForBillsIntent)initWithBillPayee:(INBillPayee *)billPayee paymentDateRange:(INDateComponentsRange *)paymentDateRange billType:(INBillType)billType status:(INPaymentStatus)status dueDateRange:(INDateComponentsRange *)dueDateRange
{
  v12 = billPayee;
  v13 = paymentDateRange;
  v14 = dueDateRange;
  v18.receiver = self;
  v18.super_class = (Class)INSearchForBillsIntent;
  v15 = [(INIntent *)&v18 init];
  v16 = v15;
  if (v15)
  {
    [(INSearchForBillsIntent *)v15 setBillPayee:v12];
    [(INSearchForBillsIntent *)v16 setPaymentDateRange:v13];
    [(INSearchForBillsIntent *)v16 setBillType:billType];
    [(INSearchForBillsIntent *)v16 setStatus:status];
    [(INSearchForBillsIntent *)v16 setDueDateRange:v14];
  }

  return v16;
}

- (id)verb
{
  return @"SearchForBills";
}

- (id)domain
{
  return @"Payments";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INSearchForBillsIntent *)self _typedBackingStore];
  id v15 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 billPayee];
  v10 = INIntentSlotValueRedactedBillPayeeValueFromBillPayeeValue(v9, a3);
  [v8 setBillPayee:v10];

  v11 = [v7 paymentDateRange];
  v12 = INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v11, a3);
  [v8 setPaymentDateRange:v12];

  v13 = [v7 dueDateRange];
  v14 = INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v13, a3);

  [v8 setDueDateRange:v14];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v18[5] = *MEMORY[0x1E4F143B8];
  v17[0] = @"billPayee";
  v3 = [(INSearchForBillsIntent *)self billPayee];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[0] = v4;
  v17[1] = @"paymentDateRange";
  id v5 = [(INSearchForBillsIntent *)self paymentDateRange];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[1] = v6;
  v17[2] = @"billType";
  INBillType v7 = [(INSearchForBillsIntent *)self billType];
  if ((unint64_t)(v7 - 1) > 0x15) {
    v8 = @"unknown";
  }
  else {
    v8 = off_1E5519408[v7 - 1];
  }
  v9 = v8;
  v18[2] = v9;
  v17[3] = @"status";
  INPaymentStatus v10 = [(INSearchForBillsIntent *)self status];
  if ((unint64_t)(v10 - 1) > 4) {
    v11 = @"unknown";
  }
  else {
    v11 = *(&off_1E5516D88 + v10 - 1);
  }
  v12 = v11;
  v18[3] = v12;
  v17[4] = @"dueDateRange";
  v13 = [(INSearchForBillsIntent *)self dueDateRange];
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[4] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  if (!v13) {

  }
  if (!v5) {
  if (!v3)
  }

  return v15;
}

- (void)setDueDateRange:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchForBillsIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v6 setDueDateRange:v5];
}

- (INDateComponentsRange)dueDateRange
{
  v2 = [(INSearchForBillsIntent *)self _typedBackingStore];
  v3 = [v2 dueDateRange];
  id v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (void)setStatus:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  id v4 = [(INSearchForBillsIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 4) {
    [v4 setHasStatus:0];
  }
  else {
    objc_msgSend(v4, "setStatus:");
  }
}

- (INPaymentStatus)status
{
  unint64_t v3 = [(INSearchForBillsIntent *)self _typedBackingStore];
  int v4 = [v3 hasStatus];
  id v5 = [(INSearchForBillsIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 status] - 1;
  if (v6 <= 4) {
    INPaymentStatus v7 = v6 + 1;
  }
  else {
    INPaymentStatus v7 = INPaymentStatusUnknown;
  }
  if (v4) {
    INPaymentStatus v8 = v7;
  }
  else {
    INPaymentStatus v8 = INPaymentStatusUnknown;
  }

  return v8;
}

- (void)setBillType:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  int v4 = [(INSearchForBillsIntent *)self _typedBackingStore];
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
  unint64_t v3 = [(INSearchForBillsIntent *)self _typedBackingStore];
  int v4 = [v3 hasBillType];
  id v5 = [(INSearchForBillsIntent *)self _typedBackingStore];
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

- (void)setPaymentDateRange:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchForBillsIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v6 setPaymentDateRange:v5];
}

- (INDateComponentsRange)paymentDateRange
{
  v2 = [(INSearchForBillsIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 paymentDateRange];
  id v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (void)setBillPayee:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchForBillsIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToBillPayeeValue(v4);

  [v6 setBillPayee:v5];
}

- (id)_metadata
{
  v2 = [(INSearchForBillsIntent *)self _typedBackingStore];
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