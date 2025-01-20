@interface INUpdateEventIntent
+ (BOOL)supportsSecureCoding;
- (CLPlacemark)setLocation;
- (INDateComponentsRange)setDateTimeRange;
- (INUpdateEventIntent)initWithTargetEventIdentifier:(id)a3 setTitle:(id)a4 setDateTimeRange:(id)a5 setLocation:(id)a6 addParticipants:(id)a7 removeParticipants:(id)a8 updateAllOccurrences:(id)a9 removeLocation:(id)a10;
- (NSArray)addParticipants;
- (NSArray)removeParticipants;
- (NSNumber)removeLocation;
- (NSNumber)updateAllOccurrences;
- (NSString)setTitle;
- (NSString)targetEventIdentifier;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAddParticipants:(id)a3;
- (void)setRemoveLocation:(id)a3;
- (void)setRemoveParticipants:(id)a3;
- (void)setSetDateTimeRange:(id)a3;
- (void)setSetLocation:(id)a3;
- (void)setSetTitle:(id)a3;
- (void)setTargetEventIdentifier:(id)a3;
- (void)setUpdateAllOccurrences:(id)a3;
@end

@implementation INUpdateEventIntent

- (id)verb
{
  return @"UpdateEvent";
}

- (id)domain
{
  return @"CalendarEvent";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INUpdateEventIntent *)self _typedBackingStore];
  id v15 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 setLocation];
  v10 = INIntentSlotValueRedactedLocationFromLocation(v9, a3, v15);
  [v8 setSetLocation:v10];

  v11 = [v7 addParticipants];
  v12 = INIntentSlotValueRedactedContactsFromContacts(v11, a3, v15);

  [v8 setAddParticipants:v12];
  v13 = [v7 removeParticipants];
  v14 = INIntentSlotValueRedactedContactsFromContacts(v13, a3, v15);

  [v8 setRemoveParticipants:v14];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v28[8] = *MEMORY[0x1E4F143B8];
  v27[0] = @"targetEventIdentifier";
  uint64_t v3 = [(INUpdateEventIntent *)self targetEventIdentifier];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v3;
  v28[0] = v3;
  v27[1] = @"setTitle";
  uint64_t v5 = [(INUpdateEventIntent *)self setTitle];
  id v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v5;
  v28[1] = v5;
  v27[2] = @"setDateTimeRange";
  uint64_t v7 = [(INUpdateEventIntent *)self setDateTimeRange];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v7;
  v28[2] = v7;
  v27[3] = @"setLocation";
  uint64_t v9 = [(INUpdateEventIntent *)self setLocation];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v9;
  v28[3] = v9;
  v27[4] = @"addParticipants";
  uint64_t v11 = [(INUpdateEventIntent *)self addParticipants];
  v12 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = v4;
  v20 = (void *)v11;
  v28[4] = v11;
  v27[5] = @"removeParticipants";
  v13 = [(INUpdateEventIntent *)self removeParticipants];
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[5] = v14;
  v27[6] = @"updateAllOccurrences";
  id v15 = [(INUpdateEventIntent *)self updateAllOccurrences];
  v16 = v15;
  if (!v15)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[6] = v16;
  v27[7] = @"removeLocation";
  v17 = [(INUpdateEventIntent *)self removeLocation];
  v18 = v17;
  if (!v17)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[7] = v18;
  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:8];
  if (!v17) {

  }
  if (!v15) {
  if (!v13)
  }

  if (!v12) {
  if (!v10)
  }

  if (!v8) {
  if (!v6)
  }

  if (!v26) {

  }
  return v25;
}

- (void)setRemoveLocation:(id)a3
{
  id v5 = a3;
  v4 = [(INUpdateEventIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setRemoveLocation:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasRemoveLocation:0];
  }
}

- (NSNumber)removeLocation
{
  uint64_t v3 = [(INUpdateEventIntent *)self _typedBackingStore];
  if ([v3 hasRemoveLocation])
  {
    v4 = NSNumber;
    id v5 = [(INUpdateEventIntent *)self _typedBackingStore];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "removeLocation"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setUpdateAllOccurrences:(id)a3
{
  id v5 = a3;
  v4 = [(INUpdateEventIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setUpdateAllOccurrences:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasUpdateAllOccurrences:0];
  }
}

- (NSNumber)updateAllOccurrences
{
  uint64_t v3 = [(INUpdateEventIntent *)self _typedBackingStore];
  if ([v3 hasUpdateAllOccurrences])
  {
    v4 = NSNumber;
    id v5 = [(INUpdateEventIntent *)self _typedBackingStore];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "updateAllOccurrences"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setRemoveParticipants:(id)a3
{
  id v4 = a3;
  id v6 = [(INUpdateEventIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToContacts(v4);

  [v6 setRemoveParticipants:v5];
}

- (NSArray)removeParticipants
{
  v2 = [(INUpdateEventIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 removeParticipants];
  id v4 = INIntentSlotValueTransformFromContacts(v3);

  return (NSArray *)v4;
}

- (void)setAddParticipants:(id)a3
{
  id v4 = a3;
  id v6 = [(INUpdateEventIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToContacts(v4);

  [v6 setAddParticipants:v5];
}

- (NSArray)addParticipants
{
  v2 = [(INUpdateEventIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 addParticipants];
  id v4 = INIntentSlotValueTransformFromContacts(v3);

  return (NSArray *)v4;
}

- (void)setSetLocation:(id)a3
{
  id v4 = a3;
  id v6 = [(INUpdateEventIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToLocation(v4);

  [v6 setSetLocation:v5];
}

- (CLPlacemark)setLocation
{
  v2 = [(INUpdateEventIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 setLocation];
  id v4 = INIntentSlotValueTransformFromLocation(v3);

  return (CLPlacemark *)v4;
}

- (void)setSetDateTimeRange:(id)a3
{
  id v4 = a3;
  id v6 = [(INUpdateEventIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDateTimeRangeValue(v4);

  [v6 setSetDateTimeRange:v5];
}

- (INDateComponentsRange)setDateTimeRange
{
  v2 = [(INUpdateEventIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 setDateTimeRange];
  id v4 = INIntentSlotValueTransformFromDateTimeRangeValue(v3);

  return (INDateComponentsRange *)v4;
}

- (void)setSetTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(INUpdateEventIntent *)self _typedBackingStore];
  [v5 setSetTitle:v4];
}

- (NSString)setTitle
{
  v2 = [(INUpdateEventIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 setTitle];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setTargetEventIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INUpdateEventIntent *)self _typedBackingStore];
  [v5 setTargetEventIdentifier:v4];
}

- (NSString)targetEventIdentifier
{
  v2 = [(INUpdateEventIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 targetEventIdentifier];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (INUpdateEventIntent)initWithTargetEventIdentifier:(id)a3 setTitle:(id)a4 setDateTimeRange:(id)a5 setLocation:(id)a6 addParticipants:(id)a7 removeParticipants:(id)a8 updateAllOccurrences:(id)a9 removeLocation:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v27.receiver = self;
  v27.super_class = (Class)INUpdateEventIntent;
  v24 = [(INIntent *)&v27 init];
  id v25 = v24;
  if (v24)
  {
    [(INUpdateEventIntent *)v24 setTargetEventIdentifier:v16];
    [(INUpdateEventIntent *)v25 setSetTitle:v17];
    [(INUpdateEventIntent *)v25 setSetDateTimeRange:v18];
    [(INUpdateEventIntent *)v25 setSetLocation:v19];
    [(INUpdateEventIntent *)v25 setAddParticipants:v20];
    [(INUpdateEventIntent *)v25 setRemoveParticipants:v21];
    [(INUpdateEventIntent *)v25 setUpdateAllOccurrences:v22];
    [(INUpdateEventIntent *)v25 setRemoveLocation:v23];
  }

  return v25;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INUpdateEventIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INUpdateEventIntent *)self _typedBackingStore];
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