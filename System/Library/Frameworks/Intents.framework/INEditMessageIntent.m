@interface INEditMessageIntent
+ (BOOL)supportsSecureCoding;
- (INEditMessageIntent)initWithMessageIdentifier:(NSString *)messageIdentifier editedContent:(NSString *)editedContent;
- (NSString)editedContent;
- (NSString)messageIdentifier;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_redactedDictionaryRepresentation;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setEditedContent:(id)a3;
- (void)setMessageIdentifier:(id)a3;
@end

@implementation INEditMessageIntent

- (id)verb
{
  return @"EditMessage";
}

- (id)domain
{
  return @"Messages";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INEditMessageIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"messageIdentifier";
  v3 = [(INEditMessageIntent *)self messageIdentifier];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"editedContent";
  v10[0] = v4;
  v5 = [(INEditMessageIntent *)self editedContent];
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

- (id)_redactedDictionaryRepresentation
{
  v2 = [(INEditMessageIntent *)self _dictionaryRepresentation];
  v3 = (void *)[v2 mutableCopy];

  [v3 setObject:@"<redacted>" forKey:@"editedContent"];

  return v3;
}

- (void)setEditedContent:(id)a3
{
  id v4 = a3;
  id v5 = [(INEditMessageIntent *)self _typedBackingStore];
  [v5 setEditedContent:v4];
}

- (NSString)editedContent
{
  v2 = [(INEditMessageIntent *)self _typedBackingStore];
  v3 = [v2 editedContent];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setMessageIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INEditMessageIntent *)self _typedBackingStore];
  [v5 setMessageIdentifier:v4];
}

- (NSString)messageIdentifier
{
  v2 = [(INEditMessageIntent *)self _typedBackingStore];
  v3 = [v2 messageIdentifier];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (INEditMessageIntent)initWithMessageIdentifier:(NSString *)messageIdentifier editedContent:(NSString *)editedContent
{
  id v6 = messageIdentifier;
  v7 = editedContent;
  v11.receiver = self;
  v11.super_class = (Class)INEditMessageIntent;
  v8 = [(INIntent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(INEditMessageIntent *)v8 setMessageIdentifier:v6];
    [(INEditMessageIntent *)v9 setEditedContent:v7];
  }

  return v9;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INEditMessageIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INEditMessageIntent *)self _typedBackingStore];
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