@interface INPlayMessageSoundIntent
+ (BOOL)supportsSecureCoding;
- (INPlayMessageSoundIntent)initWithSoundType:(int64_t)a3 messageIdentifier:(id)a4;
- (NSString)messageIdentifier;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (int64_t)soundType;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setMessageIdentifier:(id)a3;
- (void)setSoundType:(int64_t)a3;
@end

@implementation INPlayMessageSoundIntent

- (id)verb
{
  return @"PlayMessageSound";
}

- (id)domain
{
  return @"Messages";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INPlayMessageSoundIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"soundType";
  int64_t v3 = [(INPlayMessageSoundIntent *)self soundType];
  v4 = @"unknown";
  if (v3 == 1) {
    v4 = @"outgoingMessage";
  }
  v5 = v4;
  v10[1] = @"messageIdentifier";
  v11[0] = v5;
  id v6 = [(INPlayMessageSoundIntent *)self messageIdentifier];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (!v6) {

  }
  return v8;
}

- (void)setMessageIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INPlayMessageSoundIntent *)self _typedBackingStore];
  [v5 setMessageIdentifier:v4];
}

- (NSString)messageIdentifier
{
  v2 = [(INPlayMessageSoundIntent *)self _typedBackingStore];
  int64_t v3 = [v2 messageIdentifier];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setSoundType:(int64_t)a3
{
  id v4 = [(INPlayMessageSoundIntent *)self _typedBackingStore];
  id v5 = v4;
  if (a3 == 1) {
    [v4 setSoundType:1];
  }
  else {
    [v4 setHasSoundType:0];
  }
}

- (int64_t)soundType
{
  int64_t v3 = [(INPlayMessageSoundIntent *)self _typedBackingStore];
  LODWORD(v4) = [v3 hasSoundType];
  id v5 = [(INPlayMessageSoundIntent *)self _typedBackingStore];
  if ([v5 soundType] == 1) {
    int64_t v4 = v4;
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (INPlayMessageSoundIntent)initWithSoundType:(int64_t)a3 messageIdentifier:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)INPlayMessageSoundIntent;
  v7 = [(INIntent *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(INPlayMessageSoundIntent *)v7 setSoundType:a3];
    [(INPlayMessageSoundIntent *)v8 setMessageIdentifier:v6];
  }

  return v8;
}

- (id)_categoryVerb
{
  return @"Play";
}

- (int64_t)_intentCategory
{
  return 2;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INPlayMessageSoundIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INPlayMessageSoundIntent *)self _typedBackingStore];
  int64_t v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v3 = v2;
  }
  else {
    int64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end