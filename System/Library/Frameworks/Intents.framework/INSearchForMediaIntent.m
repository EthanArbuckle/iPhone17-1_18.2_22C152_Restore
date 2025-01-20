@interface INSearchForMediaIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)_intents_isExemptFromMulitWindowRequirementForInAppHandling;
- (INMediaSearch)mediaSearch;
- (INPrivateSearchForMediaIntentData)privateSearchForMediaIntentData;
- (INSearchForMediaIntent)initWithMediaItems:(NSArray *)mediaItems mediaSearch:(INMediaSearch *)mediaSearch;
- (NSArray)mediaItems;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setMediaItems:(id)a3;
- (void)setMediaSearch:(id)a3;
- (void)setPrivateSearchForMediaIntentData:(id)a3;
@end

@implementation INSearchForMediaIntent

- (BOOL)_intents_isExemptFromMulitWindowRequirementForInAppHandling
{
  return 1;
}

- (id)verb
{
  return @"SearchForMedia";
}

- (id)domain
{
  return @"Media";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INSearchForMediaIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"mediaItems";
  v3 = [(INSearchForMediaIntent *)self mediaItems];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"mediaSearch";
  v10[0] = v4;
  v5 = [(INSearchForMediaIntent *)self mediaSearch];
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

- (void)setPrivateSearchForMediaIntentData:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchForMediaIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToPrivateSearchForMediaIntentData(v4);

  [v6 setPrivateSearchForMediaIntentData:v5];
}

- (INPrivateSearchForMediaIntentData)privateSearchForMediaIntentData
{
  v2 = [(INSearchForMediaIntent *)self _typedBackingStore];
  v3 = [v2 privateSearchForMediaIntentData];
  id v4 = INIntentSlotValueTransformFromPrivateSearchForMediaIntentData(v3);

  return (INPrivateSearchForMediaIntentData *)v4;
}

- (void)setMediaSearch:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchForMediaIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToMediaSearch(v4);

  [v6 setMediaSearch:v5];
}

- (INMediaSearch)mediaSearch
{
  v2 = [(INSearchForMediaIntent *)self _typedBackingStore];
  v3 = [v2 mediaSearch];
  id v4 = INIntentSlotValueTransformFromMediaSearch(v3);

  return (INMediaSearch *)v4;
}

- (void)setMediaItems:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchForMediaIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToMediaItemValues(v4);

  [v6 setMediaItems:v5];
}

- (NSArray)mediaItems
{
  v2 = [(INSearchForMediaIntent *)self _typedBackingStore];
  v3 = [v2 mediaItems];
  id v4 = INIntentSlotValueTransformFromMediaItemValues(v3);

  return (NSArray *)v4;
}

- (INSearchForMediaIntent)initWithMediaItems:(NSArray *)mediaItems mediaSearch:(INMediaSearch *)mediaSearch
{
  id v6 = mediaItems;
  v7 = mediaSearch;
  v11.receiver = self;
  v11.super_class = (Class)INSearchForMediaIntent;
  v8 = [(INIntent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(INSearchForMediaIntent *)v8 setMediaItems:v6];
    [(INSearchForMediaIntent *)v9 setMediaSearch:v7];
  }

  return v9;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INSearchForMediaIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSearchForMediaIntent *)self _typedBackingStore];
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