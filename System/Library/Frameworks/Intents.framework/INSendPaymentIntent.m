@interface INSendPaymentIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)_isUserConfirmationRequired;
- (BOOL)configureAttributeSet:(id)a3 includingData:(BOOL)a4;
- (INCurrencyAmount)currencyAmount;
- (INPerson)payee;
- (INSendPaymentIntent)initWithPayee:(INPerson *)payee currencyAmount:(INCurrencyAmount *)currencyAmount note:(NSString *)note;
- (NSString)note;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_redactedDictionaryRepresentation;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setCurrencyAmount:(id)a3;
- (void)setNote:(id)a3;
- (void)setPayee:(id)a3;
@end

@implementation INSendPaymentIntent

- (BOOL)configureAttributeSet:(id)a3 includingData:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F1C978]);
  v8 = [(INSendPaymentIntent *)self payee];
  v9 = objc_msgSend(v7, "initWithObjects:", v8, 0);

  v10 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = INPersonToCSPerson(*(void **)(*((void *)&v24 + 1) + 8 * v15));
        if (v16) {
          [v10 addObject:v16];
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  [v6 setPrimaryRecipients:v10];
  v17 = NSStringFromSelector(sel_displayName);
  v18 = [v10 valueForKey:v17];
  [v6 setRecipientNames:v18];

  v19 = [v10 valueForKeyPath:@"handles.@distinctUnionOfArrays.self"];
  [v6 setRecipientAddresses:v19];

  v20 = [(INSendPaymentIntent *)self note];
  [v6 setTextContent:v20];

  v23.receiver = self;
  v23.super_class = (Class)INSendPaymentIntent;
  BOOL v21 = [(INIntent *)&v23 configureAttributeSet:v6 includingData:v4];

  return v21;
}

- (id)verb
{
  return @"SendPayment";
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
  id v7 = [(INSendPaymentIntent *)self _typedBackingStore];
  id v15 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 payee];
  v10 = INIntentSlotValueRedactedContactFromContact(v9, a3, v15);
  [v8 setPayee:v10];

  id v11 = [v7 currencyAmount];
  uint64_t v12 = INIntentSlotValueRedactedCurrencyAmountFromCurrencyAmount(v11, a3, v15);
  [v8 setCurrencyAmount:v12];

  uint64_t v13 = [v7 note];
  uint64_t v14 = INIntentSlotValueRedactedStringFromString(v13, a3, v15);

  [v8 setNote:v14];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"payee";
  v3 = [(INSendPaymentIntent *)self payee];
  BOOL v4 = v3;
  if (!v3)
  {
    BOOL v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"currencyAmount";
  v5 = [(INSendPaymentIntent *)self currencyAmount];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"note";
  id v7 = [(INSendPaymentIntent *)self note];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (!v7) {

  }
  if (!v5) {
  if (!v3)
  }

  return v9;
}

- (id)_redactedDictionaryRepresentation
{
  v2 = [(INSendPaymentIntent *)self _dictionaryRepresentation];
  v3 = (void *)[v2 mutableCopy];

  [v3 setObject:@"<redacted>" forKey:@"note"];

  return v3;
}

- (void)setNote:(id)a3
{
  id v4 = a3;
  id v6 = [(INSendPaymentIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToString(v4);

  [v6 setNote:v5];
}

- (NSString)note
{
  v2 = [(INSendPaymentIntent *)self _typedBackingStore];
  v3 = [v2 note];
  id v4 = INIntentSlotValueTransformFromString(v3);

  return (NSString *)v4;
}

- (void)setCurrencyAmount:(id)a3
{
  id v4 = a3;
  id v6 = [(INSendPaymentIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToCurrencyAmount(v4);

  [v6 setCurrencyAmount:v5];
}

- (INCurrencyAmount)currencyAmount
{
  v2 = [(INSendPaymentIntent *)self _typedBackingStore];
  v3 = [v2 currencyAmount];
  id v4 = INIntentSlotValueTransformFromCurrencyAmount(v3);

  return (INCurrencyAmount *)v4;
}

- (void)setPayee:(id)a3
{
  id v4 = a3;
  id v6 = [(INSendPaymentIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToContact(v4);

  [v6 setPayee:v5];
}

- (INPerson)payee
{
  v2 = [(INSendPaymentIntent *)self _typedBackingStore];
  v3 = [v2 payee];
  id v4 = INIntentSlotValueTransformFromContact(v3);

  return (INPerson *)v4;
}

- (INSendPaymentIntent)initWithPayee:(INPerson *)payee currencyAmount:(INCurrencyAmount *)currencyAmount note:(NSString *)note
{
  v8 = payee;
  v9 = currencyAmount;
  v10 = note;
  v14.receiver = self;
  v14.super_class = (Class)INSendPaymentIntent;
  id v11 = [(INIntent *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    [(INSendPaymentIntent *)v11 setPayee:v8];
    [(INSendPaymentIntent *)v12 setCurrencyAmount:v9];
    [(INSendPaymentIntent *)v12 setNote:v10];
  }

  return v12;
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
  id v5 = [(INSendPaymentIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSendPaymentIntent *)self _typedBackingStore];
  v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end