@interface INSetMessageAttributeIntent
+ (BOOL)supportsSecureCoding;
- (INMessageAttribute)attribute;
- (INSetMessageAttributeIntent)initWithIdentifiers:(NSArray *)identifiers attribute:(INMessageAttribute)attribute;
- (NSArray)identifiers;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAttribute:(int64_t)a3;
- (void)setIdentifiers:(id)a3;
@end

@implementation INSetMessageAttributeIntent

- (id)verb
{
  return @"SetMessageAttribute";
}

- (id)domain
{
  return @"Messages";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INSetMessageAttributeIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"identifiers";
  v3 = [(INSetMessageAttributeIntent *)self identifiers];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"attribute";
  v11[0] = v4;
  INMessageAttribute v5 = [(INSetMessageAttributeIntent *)self attribute];
  if ((unint64_t)(v5 - 1) > 4) {
    id v6 = @"unknown";
  }
  else {
    id v6 = off_1E5518CF8[v5 - 1];
  }
  v7 = v6;
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  if (!v3) {

  }
  return v8;
}

- (void)setAttribute:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  v4 = [(INSetMessageAttributeIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 4) {
    [v4 setHasAttribute:0];
  }
  else {
    objc_msgSend(v4, "setAttribute:");
  }
}

- (INMessageAttribute)attribute
{
  unint64_t v3 = [(INSetMessageAttributeIntent *)self _typedBackingStore];
  int v4 = [v3 hasAttribute];
  id v5 = [(INSetMessageAttributeIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 attribute] - 1;
  if (v6 <= 4) {
    INMessageAttribute v7 = v6 + 1;
  }
  else {
    INMessageAttribute v7 = INMessageAttributeUnknown;
  }
  if (v4) {
    INMessageAttribute v8 = v7;
  }
  else {
    INMessageAttribute v8 = INMessageAttributeUnknown;
  }

  return v8;
}

- (void)setIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(INSetMessageAttributeIntent *)self _typedBackingStore];
  [v5 clearIdentifiers];

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
        v12 = [(INSetMessageAttributeIntent *)self _typedBackingStore];
        [v12 addIdentifier:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (NSArray)identifiers
{
  v2 = [(INSetMessageAttributeIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 identifiers];

  if (v3) {
    id v4 = (void *)[v3 copy];
  }
  else {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

- (INSetMessageAttributeIntent)initWithIdentifiers:(NSArray *)identifiers attribute:(INMessageAttribute)attribute
{
  id v6 = identifiers;
  v10.receiver = self;
  v10.super_class = (Class)INSetMessageAttributeIntent;
  uint64_t v7 = [(INIntent *)&v10 init];
  uint64_t v8 = v7;
  if (v7)
  {
    [(INSetMessageAttributeIntent *)v7 setIdentifiers:v6];
    [(INSetMessageAttributeIntent *)v8 setAttribute:attribute];
  }

  return v8;
}

- (id)_categoryVerb
{
  return @"Set";
}

- (int64_t)_intentCategory
{
  return 16;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INSetMessageAttributeIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSetMessageAttributeIntent *)self _typedBackingStore];
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