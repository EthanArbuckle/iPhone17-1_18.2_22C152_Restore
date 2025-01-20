@interface INPlayAudioMessageIntent
+ (BOOL)supportsSecureCoding;
- (INPlayAudioMessageIntent)initWithMessageIdentifier:(id)a3;
- (NSString)messageIdentifier;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setMessageIdentifier:(id)a3;
@end

@implementation INPlayAudioMessageIntent

- (id)verb
{
  return @"PlayAudioMessage";
}

- (id)domain
{
  return @"Messages";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INPlayAudioMessageIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"messageIdentifier";
  v2 = [(INPlayAudioMessageIntent *)self messageIdentifier];
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

- (void)setMessageIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INPlayAudioMessageIntent *)self _typedBackingStore];
  [v5 setMessageIdentifier:v4];
}

- (NSString)messageIdentifier
{
  v2 = [(INPlayAudioMessageIntent *)self _typedBackingStore];
  v3 = [v2 messageIdentifier];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (INPlayAudioMessageIntent)initWithMessageIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)INPlayAudioMessageIntent;
  id v5 = [(INIntent *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(INPlayAudioMessageIntent *)v5 setMessageIdentifier:v4];
  }

  return v6;
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
  id v5 = [(INPlayAudioMessageIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INPlayAudioMessageIntent *)self _typedBackingStore];
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