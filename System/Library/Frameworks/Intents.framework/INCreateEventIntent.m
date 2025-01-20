@interface INCreateEventIntent
+ (BOOL)supportsSecureCoding;
- (CLPlacemark)location;
- (INCreateEventIntent)initWithTitle:(id)a3 dateTimeRange:(id)a4 participants:(id)a5 location:(id)a6;
- (INDateComponentsRange)dateTimeRange;
- (NSArray)participants;
- (NSString)title;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setDateTimeRange:(id)a3;
- (void)setLocation:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation INCreateEventIntent

- (id)verb
{
  return @"CreateEvent";
}

- (id)domain
{
  return @"CalendarEvent";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INCreateEventIntent *)self _typedBackingStore];
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
  v14[4] = *MEMORY[0x1E4F143B8];
  v13[0] = @"title";
  v3 = [(INCreateEventIntent *)self title];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v4;
  v13[1] = @"dateTimeRange";
  v5 = [(INCreateEventIntent *)self dateTimeRange];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v6;
  v13[2] = @"participants";
  v7 = [(INCreateEventIntent *)self participants];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v8;
  v13[3] = @"location";
  v9 = [(INCreateEventIntent *)self location];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (!v9) {

  }
  if (!v7) {
  if (!v5)
  }

  if (!v3) {

  }
  return v11;
}

- (void)setLocation:(id)a3
{
  id v4 = a3;
  id v6 = [(INCreateEventIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToLocation(v4);

  [v6 setLocation:v5];
}

- (CLPlacemark)location
{
  v2 = [(INCreateEventIntent *)self _typedBackingStore];
  v3 = [v2 location];
  id v4 = INIntentSlotValueTransformFromLocation(v3);

  return (CLPlacemark *)v4;
}

- (void)setParticipants:(id)a3
{
  id v4 = a3;
  id v6 = [(INCreateEventIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToContacts(v4);

  [v6 setParticipants:v5];
}

- (NSArray)participants
{
  v2 = [(INCreateEventIntent *)self _typedBackingStore];
  v3 = [v2 participants];
  id v4 = INIntentSlotValueTransformFromContacts(v3);

  return (NSArray *)v4;
}

- (void)setDateTimeRange:(id)a3
{
  id v4 = a3;
  id v6 = [(INCreateEventIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDateTimeRangeValue(v4);

  [v6 setDateTimeRange:v5];
}

- (INDateComponentsRange)dateTimeRange
{
  v2 = [(INCreateEventIntent *)self _typedBackingStore];
  v3 = [v2 dateTimeRange];
  id v4 = INIntentSlotValueTransformFromDateTimeRangeValue(v3);

  return (INDateComponentsRange *)v4;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(INCreateEventIntent *)self _typedBackingStore];
  [v5 setTitle:v4];
}

- (NSString)title
{
  v2 = [(INCreateEventIntent *)self _typedBackingStore];
  v3 = [v2 title];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (INCreateEventIntent)initWithTitle:(id)a3 dateTimeRange:(id)a4 participants:(id)a5 location:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)INCreateEventIntent;
  v14 = [(INIntent *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(INCreateEventIntent *)v14 setTitle:v10];
    [(INCreateEventIntent *)v15 setDateTimeRange:v11];
    [(INCreateEventIntent *)v15 setParticipants:v12];
    [(INCreateEventIntent *)v15 setLocation:v13];
  }

  return v15;
}

- (id)_categoryVerb
{
  return @"Create";
}

- (int64_t)_intentCategory
{
  return 8;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INCreateEventIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INCreateEventIntent *)self _typedBackingStore];
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