@interface INDeleteEventIntent
+ (BOOL)supportsSecureCoding;
- (INDeleteEventIntent)initWithTargetEventIdentifier:(id)a3 deleteAllOccurrences:(id)a4;
- (NSNumber)deleteAllOccurrences;
- (NSString)targetEventIdentifier;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setDeleteAllOccurrences:(id)a3;
- (void)setTargetEventIdentifier:(id)a3;
@end

@implementation INDeleteEventIntent

- (id)verb
{
  return @"DeleteEvent";
}

- (id)domain
{
  return @"CalendarEvent";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INDeleteEventIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"targetEventIdentifier";
  v3 = [(INDeleteEventIntent *)self targetEventIdentifier];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"deleteAllOccurrences";
  v10[0] = v4;
  v5 = [(INDeleteEventIntent *)self deleteAllOccurrences];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (!v5) {

  }
  if (!v3) {

  }
  return v7;
}

- (void)setDeleteAllOccurrences:(id)a3
{
  id v5 = a3;
  v4 = [(INDeleteEventIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setDeleteAllOccurrences:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasDeleteAllOccurrences:0];
  }
}

- (NSNumber)deleteAllOccurrences
{
  v3 = [(INDeleteEventIntent *)self _typedBackingStore];
  if ([v3 hasDeleteAllOccurrences])
  {
    v4 = NSNumber;
    id v5 = [(INDeleteEventIntent *)self _typedBackingStore];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "deleteAllOccurrences"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setTargetEventIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INDeleteEventIntent *)self _typedBackingStore];
  [v5 setTargetEventIdentifier:v4];
}

- (NSString)targetEventIdentifier
{
  v2 = [(INDeleteEventIntent *)self _typedBackingStore];
  v3 = [v2 targetEventIdentifier];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (INDeleteEventIntent)initWithTargetEventIdentifier:(id)a3 deleteAllOccurrences:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INDeleteEventIntent;
  v8 = [(INIntent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(INDeleteEventIntent *)v8 setTargetEventIdentifier:v6];
    [(INDeleteEventIntent *)v9 setDeleteAllOccurrences:v7];
  }

  return v9;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INDeleteEventIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INDeleteEventIntent *)self _typedBackingStore];
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