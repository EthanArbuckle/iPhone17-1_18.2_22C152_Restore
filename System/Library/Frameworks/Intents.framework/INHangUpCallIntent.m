@interface INHangUpCallIntent
+ (BOOL)supportsSecureCoding;
- (INHangUpCallIntent)initWithCallIdentifier:(NSString *)callIdentifier;
- (NSString)callIdentifier;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setCallIdentifier:(id)a3;
@end

@implementation INHangUpCallIntent

- (id)verb
{
  return @"HangUpCall";
}

- (id)domain
{
  return @"Calls";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INHangUpCallIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"callIdentifier";
  v2 = [(INHangUpCallIntent *)self callIdentifier];
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

- (void)setCallIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INHangUpCallIntent *)self _typedBackingStore];
  [v5 setCallIdentifier:v4];
}

- (NSString)callIdentifier
{
  v2 = [(INHangUpCallIntent *)self _typedBackingStore];
  v3 = [v2 callIdentifier];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (INHangUpCallIntent)initWithCallIdentifier:(NSString *)callIdentifier
{
  id v4 = callIdentifier;
  v8.receiver = self;
  v8.super_class = (Class)INHangUpCallIntent;
  id v5 = [(INIntent *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(INHangUpCallIntent *)v5 setCallIdentifier:v4];
  }

  return v6;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INHangUpCallIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INHangUpCallIntent *)self _typedBackingStore];
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