@interface INJoinCallIntent
+ (BOOL)supportsSecureCoding;
- (INCallGroupConversation)groupConversation;
- (INCallGroupConversationFilter)groupConversationFilter;
- (INJoinCallIntent)initWithGroupConversationFilter:(id)a3 groupConversation:(id)a4;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setGroupConversation:(id)a3;
- (void)setGroupConversationFilter:(id)a3;
@end

@implementation INJoinCallIntent

- (id)verb
{
  return @"JoinCall";
}

- (id)domain
{
  return @"Calls";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INJoinCallIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"groupConversationFilter";
  v3 = [(INJoinCallIntent *)self groupConversationFilter];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"groupConversation";
  v10[0] = v4;
  v5 = [(INJoinCallIntent *)self groupConversation];
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

- (void)setGroupConversation:(id)a3
{
  id v4 = a3;
  id v6 = [(INJoinCallIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToCallGroupConversation(v4);

  [v6 setGroupConversation:v5];
}

- (INCallGroupConversation)groupConversation
{
  v2 = [(INJoinCallIntent *)self _typedBackingStore];
  v3 = [v2 groupConversation];
  id v4 = INIntentSlotValueTransformFromCallGroupConversation(v3);

  return (INCallGroupConversation *)v4;
}

- (void)setGroupConversationFilter:(id)a3
{
  id v4 = a3;
  id v6 = [(INJoinCallIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToCallGroupConversationFilter(v4);

  [v6 setGroupConversationFilter:v5];
}

- (INCallGroupConversationFilter)groupConversationFilter
{
  v2 = [(INJoinCallIntent *)self _typedBackingStore];
  v3 = [v2 groupConversationFilter];
  id v4 = INIntentSlotValueTransformFromCallGroupConversationFilter(v3);

  return (INCallGroupConversationFilter *)v4;
}

- (INJoinCallIntent)initWithGroupConversationFilter:(id)a3 groupConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INJoinCallIntent;
  v8 = [(INIntent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(INJoinCallIntent *)v8 setGroupConversationFilter:v6];
    [(INJoinCallIntent *)v9 setGroupConversation:v7];
  }

  return v9;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INJoinCallIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INJoinCallIntent *)self _typedBackingStore];
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