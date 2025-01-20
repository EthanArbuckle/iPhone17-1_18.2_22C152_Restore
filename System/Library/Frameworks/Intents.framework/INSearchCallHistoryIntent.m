@interface INSearchCallHistoryIntent
+ (BOOL)supportsSecureCoding;
- (INCallCapabilityOptions)callCapabilities;
- (INCallRecordType)callType;
- (INCallRecordTypeOptions)callTypes;
- (INDateComponentsRange)dateCreated;
- (INPerson)recipient;
- (INSearchCallHistoryIntent)initWithCallType:(INCallRecordType)callType dateCreated:(INDateComponentsRange *)dateCreated recipient:(INPerson *)recipient callCapabilities:(INCallCapabilityOptions)callCapabilities;
- (INSearchCallHistoryIntent)initWithDateCreated:(INDateComponentsRange *)dateCreated recipient:(INPerson *)recipient callCapabilities:(INCallCapabilityOptions)callCapabilities callTypes:(INCallRecordTypeOptions)callTypes unseen:(NSNumber *)unseen;
- (INSearchCallHistoryIntent)initWithDateCreated:(id)a3 recipient:(id)a4 callCapabilities:(unint64_t)a5 callTypes:(unint64_t)a6;
- (NSNumber)unseen;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)preferredCallProvider;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setCallCapabilities:(unint64_t)a3;
- (void)setCallTypes:(unint64_t)a3;
- (void)setDateCreated:(id)a3;
- (void)setPreferredCallProvider:(int64_t)a3;
- (void)setRecipient:(id)a3;
- (void)setUnseen:(id)a3;
@end

@implementation INSearchCallHistoryIntent

- (INCallRecordType)callType
{
  v2 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
  if ([v2 callTypesCount])
  {
    INCallRecordType v3 = INCallRecordTypeUnknown;
    unsigned int v4 = [v2 callTypesAtIndex:0] - 2;
    if (v4 <= 8) {
      INCallRecordType v3 = qword_18CFC4620[v4];
    }
  }
  else
  {
    INCallRecordType v3 = INCallRecordTypeUnknown;
  }

  return v3;
}

- (INSearchCallHistoryIntent)initWithCallType:(INCallRecordType)callType dateCreated:(INDateComponentsRange *)dateCreated recipient:(INPerson *)recipient callCapabilities:(INCallCapabilityOptions)callCapabilities
{
  if ((unint64_t)(callType - 1) > 7) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = qword_18CFC4A98[callType - 1];
  }
  return [(INSearchCallHistoryIntent *)self initWithDateCreated:dateCreated recipient:recipient callCapabilities:callCapabilities callTypes:v7];
}

- (INSearchCallHistoryIntent)initWithDateCreated:(id)a3 recipient:(id)a4 callCapabilities:(unint64_t)a5 callTypes:(unint64_t)a6
{
  return [(INSearchCallHistoryIntent *)self initWithDateCreated:a3 recipient:a4 callCapabilities:a5 callTypes:a6 unseen:&unk_1EDBA7570];
}

- (id)verb
{
  return @"SearchCallHistory";
}

- (id)domain
{
  return @"Calls";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
  id v13 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 dateCreated];
  v10 = INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v9, a3);
  [v8 setDateCreated:v10];

  v11 = [v7 recipient];
  v12 = INIntentSlotValueRedactedContactFromContact(v11, a3, v13);

  [v8 setRecipient:v12];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v17[5] = *MEMORY[0x1E4F143B8];
  v16[0] = @"dateCreated";
  uint64_t v3 = [(INSearchCallHistoryIntent *)self dateCreated];
  unsigned int v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v3;
  v16[1] = @"recipient";
  v5 = [(INSearchCallHistoryIntent *)self recipient];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v6;
  v16[2] = @"callCapabilities";
  uint64_t v7 = INCallCapabilityOptionsGetNames([(INSearchCallHistoryIntent *)self callCapabilities]);
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[2] = v8;
  v16[3] = @"callTypes";
  v9 = INCallRecordTypeOptionsGetNames([(INSearchCallHistoryIntent *)self callTypes]);
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[3] = v10;
  v16[4] = @"unseen";
  v11 = [(INSearchCallHistoryIntent *)self unseen];
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

- (void)setUnseen:(id)a3
{
  id v5 = a3;
  unsigned int v4 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setUnseen:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasUnseen:0];
  }
}

- (NSNumber)unseen
{
  uint64_t v3 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
  if ([v3 hasUnseen])
  {
    unsigned int v4 = NSNumber;
    id v5 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "unseen"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setPreferredCallProvider:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  unsigned int v4 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 2) {
    [v4 setHasPreferredCallProvider:0];
  }
  else {
    objc_msgSend(v4, "setPreferredCallProvider:");
  }
}

- (int64_t)preferredCallProvider
{
  unint64_t v3 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
  int v4 = [v3 hasPreferredCallProvider];
  id v5 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 preferredCallProvider] - 2;
  if (v6 <= 2) {
    int64_t v7 = v6 + 1;
  }
  else {
    int64_t v7 = 0;
  }
  if (v4) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)setCallTypes:(unint64_t)a3
{
  id v5 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
  [v5 clearCallTypes];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__INSearchCallHistoryIntent_setCallTypes___block_invoke;
  v6[3] = &unk_1E5520C28;
  v6[4] = self;
  INCallRecordTypeOptionsEnumerateBackingTypes(a3, v6);
}

void __42__INSearchCallHistoryIntent_setCallTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _typedBackingStore];
  [v3 addCallTypes:a2];
}

- (INCallRecordTypeOptions)callTypes
{
  INCallRecordTypeOptions v8 = 0;
  id v3 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
  uint64_t v4 = [v3 callTypesCount];

  if (!v4) {
    return 0;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    uint64_t v6 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
    INCallRecordTypeOptionsAddBackingType((uint64_t *)&v8, [v6 callTypesAtIndex:i]);
  }
  return v8;
}

- (void)setCallCapabilities:(unint64_t)a3
{
  id v5 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
  [v5 clearCallCapabilities];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__INSearchCallHistoryIntent_setCallCapabilities___block_invoke;
  v6[3] = &unk_1E5520C28;
  v6[4] = self;
  INCallCapabilityOptionsEnumerateBackingTypes(a3, v6);
}

void __49__INSearchCallHistoryIntent_setCallCapabilities___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _typedBackingStore];
  [v3 addCallCapabilities:a2];
}

- (INCallCapabilityOptions)callCapabilities
{
  id v3 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
  uint64_t v4 = [v3 callCapabilitiesCount];

  INCallCapabilityOptions v5 = 0;
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      int64_t v7 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
      int v8 = [v7 callCapabilitiesAtIndex:i];
      uint64_t v9 = v5 | 1;
      if (v8 != 1) {
        uint64_t v9 = v5;
      }
      if (v8 == 2) {
        v5 |= 2uLL;
      }
      else {
        INCallCapabilityOptions v5 = v9;
      }
    }
  }
  return v5;
}

- (void)setRecipient:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
  INCallCapabilityOptions v5 = INIntentSlotValueTransformToContact(v4);

  [v6 setRecipient:v5];
}

- (INPerson)recipient
{
  v2 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
  id v3 = [v2 recipient];
  id v4 = INIntentSlotValueTransformFromContact(v3);

  return (INPerson *)v4;
}

- (void)setDateCreated:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
  INCallCapabilityOptions v5 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v6 setDateCreated:v5];
}

- (INDateComponentsRange)dateCreated
{
  v2 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
  id v3 = [v2 dateCreated];
  id v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (INSearchCallHistoryIntent)initWithDateCreated:(INDateComponentsRange *)dateCreated recipient:(INPerson *)recipient callCapabilities:(INCallCapabilityOptions)callCapabilities callTypes:(INCallRecordTypeOptions)callTypes unseen:(NSNumber *)unseen
{
  v12 = dateCreated;
  id v13 = recipient;
  v14 = unseen;
  v18.receiver = self;
  v18.super_class = (Class)INSearchCallHistoryIntent;
  v15 = [(INIntent *)&v18 init];
  v16 = v15;
  if (v15)
  {
    [(INSearchCallHistoryIntent *)v15 setDateCreated:v12];
    [(INSearchCallHistoryIntent *)v16 setRecipient:v13];
    [(INSearchCallHistoryIntent *)v16 setCallCapabilities:callCapabilities];
    [(INSearchCallHistoryIntent *)v16 setCallTypes:callTypes];
    [(INSearchCallHistoryIntent *)v16 setUnseen:v14];
  }

  return v16;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSearchCallHistoryIntent *)self _typedBackingStore];
  id v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end