@interface INFindEventsIntent
+ (BOOL)supportsSecureCoding;
- (CLPlacemark)location;
- (INDateComponentsRange)dateTimeRange;
- (INFindEventsIntent)initWithSearchQuery:(id)a3 dateTimeRange:(id)a4 participants:(id)a5 location:(id)a6 requestedEventAttribute:(int64_t)a7;
- (NSArray)participants;
- (NSString)searchQuery;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (int64_t)requestedEventAttribute;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setDateTimeRange:(id)a3;
- (void)setLocation:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setRequestedEventAttribute:(int64_t)a3;
- (void)setSearchQuery:(id)a3;
@end

@implementation INFindEventsIntent

- (id)verb
{
  return @"FindEvents";
}

- (id)domain
{
  return @"CalendarEvent";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INFindEventsIntent *)self _typedBackingStore];
  id v13 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 participants];
  v10 = INIntentSlotValueRedactedContactsFromContacts(v9, a3, v13);

  [v8 setParticipants:v10];
  v11 = [v7 location];
  v12 = INIntentSlotValueRedactedLocationFromLocation(v11, a3, v13);

  [v8 setLocation:v12];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v17[5] = *MEMORY[0x1E4F143B8];
  v16[0] = @"searchQuery";
  v3 = [(INFindEventsIntent *)self searchQuery];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v4;
  v16[1] = @"dateTimeRange";
  v5 = [(INFindEventsIntent *)self dateTimeRange];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v6;
  v16[2] = @"participants";
  v7 = [(INFindEventsIntent *)self participants];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[2] = v8;
  v16[3] = @"location";
  v9 = [(INFindEventsIntent *)self location];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[3] = v10;
  v16[4] = @"requestedEventAttribute";
  int64_t v11 = [(INFindEventsIntent *)self requestedEventAttribute];
  if ((unint64_t)(v11 - 1) > 2) {
    v12 = @"unknown";
  }
  else {
    v12 = *(&off_1E551E680 + v11 - 1);
  }
  id v13 = v12;
  v17[4] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];

  if (!v9) {
  if (!v7)
  }

  if (!v5) {
  if (!v3)
  }

  return v14;
}

- (void)setRequestedEventAttribute:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  v4 = [(INFindEventsIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 2) {
    [v4 setHasRequestedEventAttribute:0];
  }
  else {
    objc_msgSend(v4, "setRequestedEventAttribute:");
  }
}

- (int64_t)requestedEventAttribute
{
  unint64_t v3 = [(INFindEventsIntent *)self _typedBackingStore];
  int v4 = [v3 hasRequestedEventAttribute];
  id v5 = [(INFindEventsIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 requestedEventAttribute] - 1;
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

- (void)setLocation:(id)a3
{
  id v4 = a3;
  id v6 = [(INFindEventsIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToLocation(v4);

  [v6 setLocation:v5];
}

- (CLPlacemark)location
{
  v2 = [(INFindEventsIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 location];
  id v4 = INIntentSlotValueTransformFromLocation(v3);

  return (CLPlacemark *)v4;
}

- (void)setParticipants:(id)a3
{
  id v4 = a3;
  id v6 = [(INFindEventsIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToContacts(v4);

  [v6 setParticipants:v5];
}

- (NSArray)participants
{
  v2 = [(INFindEventsIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 participants];
  id v4 = INIntentSlotValueTransformFromContacts(v3);

  return (NSArray *)v4;
}

- (void)setDateTimeRange:(id)a3
{
  id v4 = a3;
  id v6 = [(INFindEventsIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDateTimeRangeValue(v4);

  [v6 setDateTimeRange:v5];
}

- (INDateComponentsRange)dateTimeRange
{
  v2 = [(INFindEventsIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 dateTimeRange];
  id v4 = INIntentSlotValueTransformFromDateTimeRangeValue(v3);

  return (INDateComponentsRange *)v4;
}

- (void)setSearchQuery:(id)a3
{
  id v4 = a3;
  id v5 = [(INFindEventsIntent *)self _typedBackingStore];
  [v5 setSearchQuery:v4];
}

- (NSString)searchQuery
{
  v2 = [(INFindEventsIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 searchQuery];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (INFindEventsIntent)initWithSearchQuery:(id)a3 dateTimeRange:(id)a4 participants:(id)a5 location:(id)a6 requestedEventAttribute:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)INFindEventsIntent;
  v16 = [(INIntent *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(INFindEventsIntent *)v16 setSearchQuery:v12];
    [(INFindEventsIntent *)v17 setDateTimeRange:v13];
    [(INFindEventsIntent *)v17 setParticipants:v14];
    [(INFindEventsIntent *)v17 setLocation:v15];
    [(INFindEventsIntent *)v17 setRequestedEventAttribute:a7];
  }

  return v17;
}

- (id)_categoryVerb
{
  return @"Search";
}

- (int64_t)_intentCategory
{
  return 9;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INFindEventsIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INFindEventsIntent *)self _typedBackingStore];
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