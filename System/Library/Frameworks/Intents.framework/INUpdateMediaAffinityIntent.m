@interface INUpdateMediaAffinityIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)_intents_isExemptFromMulitWindowRequirementForInAppHandling;
- (INMediaAffinityType)affinityType;
- (INMediaSearch)mediaSearch;
- (INPrivateUpdateMediaAffinityIntentData)privateUpdateMediaAffinityIntentData;
- (INUpdateMediaAffinityIntent)initWithMediaItems:(NSArray *)mediaItems mediaSearch:(INMediaSearch *)mediaSearch affinityType:(INMediaAffinityType)affinityType;
- (NSArray)mediaItems;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAffinityType:(int64_t)a3;
- (void)setMediaItems:(id)a3;
- (void)setMediaSearch:(id)a3;
- (void)setPrivateUpdateMediaAffinityIntentData:(id)a3;
@end

@implementation INUpdateMediaAffinityIntent

- (BOOL)_intents_isExemptFromMulitWindowRequirementForInAppHandling
{
  return 1;
}

- (id)verb
{
  return @"UpdateMediaAffinity";
}

- (id)domain
{
  return @"Media";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INUpdateMediaAffinityIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"mediaItems";
  v3 = [(INUpdateMediaAffinityIntent *)self mediaItems];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v4;
  v12[1] = @"mediaSearch";
  v5 = [(INUpdateMediaAffinityIntent *)self mediaSearch];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v6;
  v12[2] = @"affinityType";
  INMediaAffinityType v7 = [(INUpdateMediaAffinityIntent *)self affinityType];
  v8 = @"unknown";
  if (v7 == INMediaAffinityTypeDislike) {
    v8 = @"dislike";
  }
  if (v7 == INMediaAffinityTypeLike) {
    v8 = @"like";
  }
  v9 = v8;
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  if (!v5) {
  if (!v3)
  }

  return v10;
}

- (void)setPrivateUpdateMediaAffinityIntentData:(id)a3
{
  id v4 = a3;
  id v6 = [(INUpdateMediaAffinityIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToPrivateUpdateMediaAffinityIntentData(v4);

  [v6 setPrivateUpdateMediaAffinityIntentData:v5];
}

- (INPrivateUpdateMediaAffinityIntentData)privateUpdateMediaAffinityIntentData
{
  v2 = [(INUpdateMediaAffinityIntent *)self _typedBackingStore];
  v3 = [v2 privateUpdateMediaAffinityIntentData];
  id v4 = INIntentSlotValueTransformFromPrivateUpdateMediaAffinityIntentData(v3);

  return (INPrivateUpdateMediaAffinityIntentData *)v4;
}

- (void)setAffinityType:(int64_t)a3
{
  id v4 = [(INUpdateMediaAffinityIntent *)self _typedBackingStore];
  id v5 = v4;
  if ((unint64_t)a3 > 2) {
    [v4 setHasAffinityType:0];
  }
  else {
    [v4 setAffinityType:a3];
  }
}

- (INMediaAffinityType)affinityType
{
  v3 = [(INUpdateMediaAffinityIntent *)self _typedBackingStore];
  int v4 = [v3 hasAffinityType];
  id v5 = [(INUpdateMediaAffinityIntent *)self _typedBackingStore];
  int v6 = [v5 affinityType];
  uint64_t v7 = v6 == 1;
  if (v6 == 2) {
    uint64_t v7 = 2;
  }
  if (v4) {
    INMediaAffinityType v8 = v7;
  }
  else {
    INMediaAffinityType v8 = INMediaAffinityTypeUnknown;
  }

  return v8;
}

- (void)setMediaSearch:(id)a3
{
  id v4 = a3;
  id v6 = [(INUpdateMediaAffinityIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToMediaSearch(v4);

  [v6 setMediaSearch:v5];
}

- (INMediaSearch)mediaSearch
{
  v2 = [(INUpdateMediaAffinityIntent *)self _typedBackingStore];
  v3 = [v2 mediaSearch];
  id v4 = INIntentSlotValueTransformFromMediaSearch(v3);

  return (INMediaSearch *)v4;
}

- (void)setMediaItems:(id)a3
{
  id v4 = a3;
  id v6 = [(INUpdateMediaAffinityIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToMediaItemValues(v4);

  [v6 setMediaItems:v5];
}

- (NSArray)mediaItems
{
  v2 = [(INUpdateMediaAffinityIntent *)self _typedBackingStore];
  v3 = [v2 mediaItems];
  id v4 = INIntentSlotValueTransformFromMediaItemValues(v3);

  return (NSArray *)v4;
}

- (INUpdateMediaAffinityIntent)initWithMediaItems:(NSArray *)mediaItems mediaSearch:(INMediaSearch *)mediaSearch affinityType:(INMediaAffinityType)affinityType
{
  INMediaAffinityType v8 = mediaItems;
  v9 = mediaSearch;
  v13.receiver = self;
  v13.super_class = (Class)INUpdateMediaAffinityIntent;
  v10 = [(INIntent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(INUpdateMediaAffinityIntent *)v10 setMediaItems:v8];
    [(INUpdateMediaAffinityIntent *)v11 setMediaSearch:v9];
    [(INUpdateMediaAffinityIntent *)v11 setAffinityType:affinityType];
  }

  return v11;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INUpdateMediaAffinityIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INUpdateMediaAffinityIntent *)self _typedBackingStore];
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