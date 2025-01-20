@interface INSetAudioSourceInCarIntent
+ (BOOL)supportsSecureCoding;
- (INCarAudioSource)audioSource;
- (INRelativeReference)relativeAudioSourceReference;
- (INSetAudioSourceInCarIntent)initWithAudioSource:(INCarAudioSource)audioSource relativeAudioSourceReference:(INRelativeReference)relativeAudioSourceReference;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAudioSource:(int64_t)a3;
- (void)setRelativeAudioSourceReference:(int64_t)a3;
@end

@implementation INSetAudioSourceInCarIntent

- (id)verb
{
  return @"SetAudioSourceInCar";
}

- (id)domain
{
  return @"CarPlay";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INSetAudioSourceInCarIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"audioSource";
  INCarAudioSource v3 = [(INSetAudioSourceInCarIntent *)self audioSource];
  if ((unint64_t)(v3 - 1) > 8) {
    v4 = @"unknown";
  }
  else {
    v4 = *(&off_1E5516AF0 + v3 - 1);
  }
  v5 = v4;
  v11[1] = @"relativeAudioSourceReference";
  v12[0] = v5;
  INRelativeReference v6 = [(INSetAudioSourceInCarIntent *)self relativeAudioSourceReference];
  v7 = @"unknown";
  if (v6 == INRelativeReferencePrevious) {
    v7 = @"previous";
  }
  if (v6 == INRelativeReferenceNext) {
    v7 = @"next";
  }
  v8 = v7;
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (void)setRelativeAudioSourceReference:(int64_t)a3
{
  if (a3 == 1) {
    unsigned int v3 = 1;
  }
  else {
    unsigned int v3 = 0x7FFFFFFF;
  }
  if (a3 == 2) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = v3;
  }
  v5 = [(INSetAudioSourceInCarIntent *)self _typedBackingStore];
  id v6 = v5;
  if (v4 == 0x7FFFFFFF) {
    [v5 setHasRelativeAudioSourceReference:0];
  }
  else {
    [v5 setRelativeAudioSourceReference:v4];
  }
}

- (INRelativeReference)relativeAudioSourceReference
{
  unsigned int v3 = [(INSetAudioSourceInCarIntent *)self _typedBackingStore];
  int v4 = [v3 hasRelativeAudioSourceReference];
  v5 = [(INSetAudioSourceInCarIntent *)self _typedBackingStore];
  int v6 = [v5 relativeAudioSourceReference];
  uint64_t v7 = 2 * (v6 == 2);
  if (v6 == 1) {
    uint64_t v7 = 1;
  }
  if (v4) {
    INRelativeReference v8 = v7;
  }
  else {
    INRelativeReference v8 = INRelativeReferenceUnknown;
  }

  return v8;
}

- (void)setAudioSource:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  int v4 = [(INSetAudioSourceInCarIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 8) {
    [v4 setHasAudioSource:0];
  }
  else {
    objc_msgSend(v4, "setAudioSource:");
  }
}

- (INCarAudioSource)audioSource
{
  unint64_t v3 = [(INSetAudioSourceInCarIntent *)self _typedBackingStore];
  int v4 = [v3 hasAudioSource];
  id v5 = [(INSetAudioSourceInCarIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 audioSource] - 1;
  if (v6 <= 8) {
    INCarAudioSource v7 = v6 + 1;
  }
  else {
    INCarAudioSource v7 = INCarAudioSourceUnknown;
  }
  if (v4) {
    INCarAudioSource v8 = v7;
  }
  else {
    INCarAudioSource v8 = INCarAudioSourceUnknown;
  }

  return v8;
}

- (INSetAudioSourceInCarIntent)initWithAudioSource:(INCarAudioSource)audioSource relativeAudioSourceReference:(INRelativeReference)relativeAudioSourceReference
{
  v9.receiver = self;
  v9.super_class = (Class)INSetAudioSourceInCarIntent;
  uint64_t v6 = [(INIntent *)&v9 init];
  INCarAudioSource v7 = v6;
  if (v6)
  {
    [(INSetAudioSourceInCarIntent *)v6 setAudioSource:audioSource];
    [(INSetAudioSourceInCarIntent *)v7 setRelativeAudioSourceReference:relativeAudioSourceReference];
  }
  return v7;
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
  id v5 = [(INSetAudioSourceInCarIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSetAudioSourceInCarIntent *)self _typedBackingStore];
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