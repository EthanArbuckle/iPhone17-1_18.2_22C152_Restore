@interface INStartVideoCallIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)configureAttributeSet:(id)a3 includingData:(BOOL)a4;
- (INStartCallRequestMetadata)callRequestMetadata;
- (INStartVideoCallIntent)initWithContacts:(NSArray *)contacts;
- (NSArray)contacts;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_spotlightContentType;
- (id)_titleWithLocalizer:(id)a3 fromBundleURL:(id)a4;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (int64_t)audioRoute;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAudioRoute:(int64_t)a3;
- (void)setCallRequestMetadata:(id)a3;
- (void)setContacts:(id)a3;
@end

@implementation INStartVideoCallIntent

- (id)_spotlightContentType
{
  v2 = @"com.apple.siri.interaction.video";
  return @"com.apple.siri.interaction.video";
}

- (BOOL)configureAttributeSet:(id)a3 includingData:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(INStartVideoCallIntent *)self contacts];
  v8 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = INPersonToCSPerson(*(void **)(*((void *)&v21 + 1) + 8 * v13));
        if (v14) {
          [v8 addObject:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  [v6 setPrimaryRecipients:v8];
  v15 = NSStringFromSelector(sel_displayName);
  v16 = [v8 valueForKey:v15];
  [v6 setRecipientNames:v16];

  v17 = [v8 valueForKeyPath:@"handles.@distinctUnionOfArrays.self"];
  [v6 setRecipientAddresses:v17];

  v20.receiver = self;
  v20.super_class = (Class)INStartVideoCallIntent;
  BOOL v18 = [(INIntent *)&v20 configureAttributeSet:v6 includingData:v4];

  return v18;
}

- (id)verb
{
  return @"StartVideoCall";
}

- (id)domain
{
  return @"Calls";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INStartVideoCallIntent *)self _typedBackingStore];
  id v11 = v6;
  v8 = (void *)[v7 copy];
  id v9 = [v7 contacts];
  uint64_t v10 = INIntentSlotValueRedactedDialingContactsFromDialingContacts(v9, a3, v11);

  [v8 setContacts:v10];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"contacts";
  v2 = [(INStartVideoCallIntent *)self contacts];
  v3 = v2;
  if (!v2)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v7[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (!v2) {

  }
  return v4;
}

- (void)setCallRequestMetadata:(id)a3
{
  id v4 = a3;
  id v6 = [(INStartVideoCallIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToStartCallRequestMetadata(v4);

  [v6 setCallRequestMetadata:v5];
}

- (INStartCallRequestMetadata)callRequestMetadata
{
  v2 = [(INStartVideoCallIntent *)self _typedBackingStore];
  v3 = [v2 callRequestMetadata];
  id v4 = INIntentSlotValueTransformFromStartCallRequestMetadata(v3);

  return (INStartCallRequestMetadata *)v4;
}

- (void)setContacts:(id)a3
{
  id v4 = a3;
  id v6 = [(INStartVideoCallIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDialingContacts(v4);

  [v6 setContacts:v5];
}

- (NSArray)contacts
{
  v2 = [(INStartVideoCallIntent *)self _typedBackingStore];
  v3 = [v2 contacts];
  id v4 = INIntentSlotValueTransformFromDialingContacts(v3);

  return (NSArray *)v4;
}

- (void)setAudioRoute:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      uint64_t v3 = 2;
      goto LABEL_7;
    case 1000:
      uint64_t v3 = 4;
      goto LABEL_7;
    case 2:
      uint64_t v3 = 3;
LABEL_7:
      id v4 = [(INStartVideoCallIntent *)self _typedBackingStore];
      [v4 setAudioRoute:v3];
      goto LABEL_9;
  }
  id v4 = [(INStartVideoCallIntent *)self _typedBackingStore];
  [v4 setHasAudioRoute:0];
LABEL_9:
}

- (int64_t)audioRoute
{
  uint64_t v3 = [(INStartVideoCallIntent *)self _typedBackingStore];
  int v4 = [v3 hasAudioRoute];
  v5 = [(INStartVideoCallIntent *)self _typedBackingStore];
  int v6 = [v5 audioRoute];
  if (v4 && (v6 - 2) <= 2) {
    int64_t v7 = qword_18CFC4B68[v6 - 2];
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (INStartVideoCallIntent)initWithContacts:(NSArray *)contacts
{
  int v4 = contacts;
  v8.receiver = self;
  v8.super_class = (Class)INStartVideoCallIntent;
  v5 = [(INIntent *)&v8 init];
  int v6 = v5;
  if (v5) {
    [(INStartVideoCallIntent *)v5 setContacts:v4];
  }

  return v6;
}

- (id)_categoryVerb
{
  return @"Call";
}

- (int64_t)_intentCategory
{
  return 18;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INStartVideoCallIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INStartVideoCallIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_titleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(INIntent *)self _intents_bundleIdForDisplay];
  int v9 = [v8 isEqualToString:@"com.apple.facetime"];

  if (v9)
  {
    uint64_t v10 = NSString;
    id v11 = INLocalizedStringWithLocalizer(@"FaceTime %@", @"FaceTime %@", v6);
    uint64_t v12 = [(INStartVideoCallIntent *)self contacts];
    uint64_t v13 = objc_msgSend(v12, "_intents_readableTitleWithLocalizer:", v6);
    v14 = objc_msgSend(v10, "stringWithFormat:", v11, v13);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)INStartVideoCallIntent;
    v14 = [(INIntent *)&v16 _titleWithLocalizer:v6 fromBundleURL:v7];
  }

  return v14;
}

@end