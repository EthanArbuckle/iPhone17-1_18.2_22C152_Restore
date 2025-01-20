@interface INGetVisualCodeIntent
+ (BOOL)supportsSecureCoding;
- (INGetVisualCodeIntent)initWithVisualCodeType:(INVisualCodeType)visualCodeType;
- (INVisualCodeType)visualCodeType;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setVisualCodeType:(int64_t)a3;
@end

@implementation INGetVisualCodeIntent

- (id)verb
{
  return @"GetVisualCode";
}

- (id)domain
{
  return @"VisualCode";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INGetVisualCodeIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"visualCodeType";
  INVisualCodeType v2 = [(INGetVisualCodeIntent *)self visualCodeType];
  if ((unint64_t)(v2 - 1) > 5) {
    v3 = @"unknown";
  }
  else {
    v3 = off_1E551A908[v2 - 1];
  }
  v4 = v3;
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (void)setVisualCodeType:(int64_t)a3
{
  v4 = [(INGetVisualCodeIntent *)self _typedBackingStore];
  id v5 = v4;
  if ((unint64_t)a3 > 6) {
    [v4 setHasVisualCodeType:0];
  }
  else {
    [v4 setVisualCodeType:a3];
  }
}

- (INVisualCodeType)visualCodeType
{
  v3 = [(INGetVisualCodeIntent *)self _typedBackingStore];
  int v4 = [v3 hasVisualCodeType];
  id v5 = [(INGetVisualCodeIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 visualCodeType] - 1;
  if (v6 <= 5) {
    INVisualCodeType v7 = v6 + 1;
  }
  else {
    INVisualCodeType v7 = INVisualCodeTypeUnknown;
  }
  if (v4) {
    INVisualCodeType v8 = v7;
  }
  else {
    INVisualCodeType v8 = INVisualCodeTypeUnknown;
  }

  return v8;
}

- (INGetVisualCodeIntent)initWithVisualCodeType:(INVisualCodeType)visualCodeType
{
  v7.receiver = self;
  v7.super_class = (Class)INGetVisualCodeIntent;
  int v4 = [(INIntent *)&v7 init];
  id v5 = v4;
  if (v4) {
    [(INGetVisualCodeIntent *)v4 setVisualCodeType:visualCodeType];
  }
  return v5;
}

- (id)_categoryVerb
{
  return @"View";
}

- (int64_t)_intentCategory
{
  return 1;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INGetVisualCodeIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  INVisualCodeType v2 = [(INGetVisualCodeIntent *)self _typedBackingStore];
  v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  INVisualCodeType v2 = [(INIntent *)self backingStore];
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