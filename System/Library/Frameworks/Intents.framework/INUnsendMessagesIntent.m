@interface INUnsendMessagesIntent
+ (BOOL)supportsSecureCoding;
- (INUnsendMessagesIntent)initWithMessageIdentifiers:(NSArray *)messageIdentifiers;
- (NSArray)messageIdentifiers;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setMessageIdentifiers:(id)a3;
@end

@implementation INUnsendMessagesIntent

- (id)verb
{
  return @"UnsendMessages";
}

- (id)domain
{
  return @"Messages";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INUnsendMessagesIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"messageIdentifiers";
  v2 = [(INUnsendMessagesIntent *)self messageIdentifiers];
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

- (void)setMessageIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(INUnsendMessagesIntent *)self _typedBackingStore];
  [v5 clearMessageIdentifiers];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        v12 = [(INUnsendMessagesIntent *)self _typedBackingStore];
        [v12 addMessageIdentifiers:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (NSArray)messageIdentifiers
{
  v2 = [(INUnsendMessagesIntent *)self _typedBackingStore];
  v3 = [v2 messageIdentifiers];

  if (v3) {
    id v4 = (void *)[v3 copy];
  }
  else {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

- (INUnsendMessagesIntent)initWithMessageIdentifiers:(NSArray *)messageIdentifiers
{
  id v4 = messageIdentifiers;
  v8.receiver = self;
  v8.super_class = (Class)INUnsendMessagesIntent;
  v5 = [(INIntent *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(INUnsendMessagesIntent *)v5 setMessageIdentifiers:v4];
  }

  return v6;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INUnsendMessagesIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INUnsendMessagesIntent *)self _typedBackingStore];
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