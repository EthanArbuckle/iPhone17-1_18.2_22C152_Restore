@interface INAddCallParticipantIntent
+ (BOOL)supportsSecureCoding;
- (INAddCallParticipantIntent)initWithParticipants:(id)a3;
- (NSArray)participants;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setParticipants:(id)a3;
@end

@implementation INAddCallParticipantIntent

- (id)verb
{
  return @"AddCallParticipant";
}

- (id)domain
{
  return @"Calls";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INAddCallParticipantIntent *)self _typedBackingStore];
  id v11 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 participants];
  v10 = INIntentSlotValueRedactedContactsFromContacts(v9, a3, v11);

  [v8 setParticipants:v10];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"participants";
  v2 = [(INAddCallParticipantIntent *)self participants];
  v3 = v2;
  if (!v2)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (!v2) {

  }
  return v4;
}

- (void)setParticipants:(id)a3
{
  id v4 = a3;
  id v6 = [(INAddCallParticipantIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToContacts(v4);

  [v6 setParticipants:v5];
}

- (NSArray)participants
{
  v2 = [(INAddCallParticipantIntent *)self _typedBackingStore];
  v3 = [v2 participants];
  id v4 = INIntentSlotValueTransformFromContacts(v3);

  return (NSArray *)v4;
}

- (INAddCallParticipantIntent)initWithParticipants:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)INAddCallParticipantIntent;
  v5 = [(INIntent *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(INAddCallParticipantIntent *)v5 setParticipants:v4];
  }

  return v6;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INAddCallParticipantIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INAddCallParticipantIntent *)self _typedBackingStore];
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