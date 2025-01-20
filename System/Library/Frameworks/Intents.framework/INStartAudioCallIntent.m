@interface INStartAudioCallIntent
+ (BOOL)supportsSecureCoding;
+ (id)_ignoredParameters;
- (BOOL)configureAttributeSet:(id)a3 includingData:(BOOL)a4;
- (BOOL)useSpeaker;
- (INCallDestinationType)destinationType;
- (INStartAudioCallIntent)initWithContacts:(NSArray *)contacts;
- (INStartAudioCallIntent)initWithDestinationType:(INCallDestinationType)destinationType contacts:(NSArray *)contacts;
- (INStartCallRequestMetadata)callRequestMetadata;
- (NSArray)contacts;
- (id)_categoryVerb;
- (id)_currentParameterCombination;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_spotlightContentType;
- (id)_subtitleWithLocalizer:(id)a3 fromBundleURL:(id)a4;
- (id)_typedBackingStore;
- (id)_validParameterCombinationsWithSchema:(id)a3;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (int64_t)audioRoute;
- (int64_t)preferredCallProvider;
- (int64_t)recordTypeForRedialing;
- (int64_t)ttyType;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAudioRoute:(int64_t)a3;
- (void)setCallRequestMetadata:(id)a3;
- (void)setContacts:(id)a3;
- (void)setDestinationType:(int64_t)a3;
- (void)setPreferredCallProvider:(int64_t)a3;
- (void)setRecordTypeForRedialing:(int64_t)a3;
- (void)setTTYType:(int64_t)a3;
- (void)setUseSpeaker:(BOOL)a3;
@end

@implementation INStartAudioCallIntent

- (id)_subtitleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int64_t v9 = [(INStartAudioCallIntent *)self preferredCallProvider];
  if ((unint64_t)(v9 - 2) < 2 || !v9)
  {
    -[INIntent _subtitleWithLocalizer:fromBundleURL:](&v39, sel__subtitleWithLocalizer_fromBundleURL_, v7, v8, self, INStartAudioCallIntent, v40.receiver, v40.super_class, v41.receiver, v41.super_class);
LABEL_20:
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (v9 != 1) {
    goto LABEL_21;
  }
  v10 = [(INStartAudioCallIntent *)self contacts];
  if ([v10 count] != 1)
  {

    goto LABEL_19;
  }
  v11 = [(INStartAudioCallIntent *)self contacts];
  v12 = [v11 firstObject];
  v13 = [v12 personHandle];
  uint64_t v14 = [v13 type];

  if (v14 != 2)
  {
LABEL_19:
    -[INIntent _subtitleWithLocalizer:fromBundleURL:](&v40, sel__subtitleWithLocalizer_fromBundleURL_, v7, v8, v39.receiver, v39.super_class, self, INStartAudioCallIntent, v41.receiver, v41.super_class);
    goto LABEL_20;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v15 = [(INStartAudioCallIntent *)self contacts];
  v16 = [v15 firstObject];
  v17 = [v16 aliases];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v18)
  {

LABEL_25:
    -[INIntent _subtitleWithLocalizer:fromBundleURL:](&v41, sel__subtitleWithLocalizer_fromBundleURL_, v7, v8, v39.receiver, v39.super_class, v40.receiver, v40.super_class, self, INStartAudioCallIntent);
    goto LABEL_20;
  }
  uint64_t v19 = v18;
  char v20 = 0;
  uint64_t v21 = *(void *)v43;
  do
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v43 != v21) {
        objc_enumerationMutation(v17);
      }
      v20 |= [*(id *)(*((void *)&v42 + 1) + 8 * i) type] == 2;
    }
    uint64_t v19 = [v17 countByEnumeratingWithState:&v42 objects:v46 count:16];
  }
  while (v19);

  if ((v20 & 1) == 0) {
    goto LABEL_25;
  }
  v23 = [(INStartAudioCallIntent *)self contacts];
  v24 = [v23 firstObject];
  v25 = [v24 personHandle];
  v26 = [v25 label];

  if (v26)
  {
    if ([v26 hasPrefix:@"com.apple.intents.PersonHandleLabel."])
    {
      v27 = [v26 substringFromIndex:objc_msgSend(@"com.apple.intents.PersonHandleLabel.", "length")];
      INLocalizedStringWithLocalizer(v26, v27, v7);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = v26;
    }
  }
  else
  {
    v29 = [v7 locale];
    v30 = [v29 regionCode];
    v31 = [v30 lowercaseString];

    if (!v31)
    {
      v31 = (void *)CPPhoneNumberCopyNetworkCountryCode();
      if (!v31) {
        v31 = (void *)CPPhoneNumberCopyHomeCountryCode();
      }
    }
    v32 = [(INStartAudioCallIntent *)self contacts];
    v33 = [v32 firstObject];
    v34 = [v33 personHandle];
    [v34 value];
    v35 = (void *)PNCreateFormattedStringWithCountry();

    if ([v35 length])
    {
      id v4 = v35;
    }
    else
    {
      v36 = [(INStartAudioCallIntent *)self contacts];
      v37 = [v36 firstObject];
      v38 = [v37 personHandle];
      id v4 = [v38 value];
    }
  }

LABEL_21:

  return v4;
}

+ (id)_ignoredParameters
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"audioRoute", @"destinationType", @"preferredCallProvider", @"ttyType", 0);
}

- (id)_spotlightContentType
{
  v2 = @"com.apple.siri.interaction.phone";
  return @"com.apple.siri.interaction.phone";
}

- (BOOL)configureAttributeSet:(id)a3 includingData:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(INStartAudioCallIntent *)self contacts];
  id v8 = objc_opt_new();
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
        uint64_t v14 = INPersonToCSPerson(*(void **)(*((void *)&v21 + 1) + 8 * v13));
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
  v20.super_class = (Class)INStartAudioCallIntent;
  BOOL v18 = [(INIntent *)&v20 configureAttributeSet:v6 includingData:v4];

  return v18;
}

- (id)verb
{
  return @"StartAudioCall";
}

- (id)domain
{
  return @"Calls";
}

- (id)_currentParameterCombination
{
  v3 = [(INIntent *)self _nonNilParameters];
  BOOL v4 = (void *)[v3 mutableCopy];

  v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"audioRoute", @"destinationType", @"ttyType", 0);
  [v4 minusSet:v5];

  id v6 = [(INIntent *)self _nonNilParameters];
  int v7 = [v6 containsObject:@"preferredCallProvider"];

  if (!v7) {
    goto LABEL_4;
  }
  id v8 = [(INIntent *)self _parameterCombinations];
  id v9 = [v8 objectForKey:v4];

  if (!v9)
  {
    [v4 removeObject:@"preferredCallProvider"];
    uint64_t v10 = [(INIntent *)self _parameterCombinations];
    id v9 = [v10 objectForKey:v4];

    if (!v9)
    {
LABEL_4:
      v12.receiver = self;
      v12.super_class = (Class)INStartAudioCallIntent;
      id v9 = [(INIntent *)&v12 _currentParameterCombination];
    }
  }

  return v9;
}

- (id)_validParameterCombinationsWithSchema:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)INStartAudioCallIntent;
  BOOL v4 = [(INIntent *)&v20 _validParameterCombinationsWithSchema:a3];
  v5 = [MEMORY[0x1E4F1CA80] set];
  if ([(INStartAudioCallIntent *)self preferredCallProvider]) {
    [v5 addObject:@"preferredCallProvider"];
  }
  if ([(INStartAudioCallIntent *)self destinationType]) {
    [v5 addObject:@"destinationType"];
  }
  if ([v5 count])
  {
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    int v7 = objc_msgSend(v4, "allKeys", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v13 = [v4 objectForKey:v12];
          uint64_t v14 = [v12 setByAddingObjectsFromSet:v5];
          [v6 setObject:v13 forKey:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  int v7 = [(INStartAudioCallIntent *)self _typedBackingStore];
  id v11 = v6;
  uint64_t v8 = (void *)[v7 copy];
  uint64_t v9 = [v7 contacts];
  uint64_t v10 = INIntentSlotValueRedactedDialingContactsFromDialingContacts(v9, a3, v11);

  [v8 setContacts:v10];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"destinationType";
  INCallDestinationType v3 = [(INStartAudioCallIntent *)self destinationType];
  if ((unint64_t)(v3 - 1) > 4) {
    BOOL v4 = @"unknown";
  }
  else {
    BOOL v4 = off_1E5518558[v3 - 1];
  }
  v5 = v4;
  v10[1] = @"contacts";
  v11[0] = v5;
  id v6 = [(INStartAudioCallIntent *)self contacts];
  int v7 = v6;
  if (!v6)
  {
    int v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (!v6) {

  }
  return v8;
}

- (void)setCallRequestMetadata:(id)a3
{
  id v4 = a3;
  id v6 = [(INStartAudioCallIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToStartCallRequestMetadata(v4);

  [v6 setCallRequestMetadata:v5];
}

- (INStartCallRequestMetadata)callRequestMetadata
{
  v2 = [(INStartAudioCallIntent *)self _typedBackingStore];
  INCallDestinationType v3 = [v2 callRequestMetadata];
  id v4 = INIntentSlotValueTransformFromStartCallRequestMetadata(v3);

  return (INStartCallRequestMetadata *)v4;
}

- (void)setTTYType:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  id v4 = [(INStartAudioCallIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 2) {
    [v4 setHasTtyType:0];
  }
  else {
    [v4 setTtyType:v3];
  }
}

- (int64_t)ttyType
{
  unint64_t v3 = [(INStartAudioCallIntent *)self _typedBackingStore];
  unsigned __int8 v4 = [v3 hasTtyType];
  id v5 = [(INStartAudioCallIntent *)self _typedBackingStore];
  unsigned int v6 = [v5 ttyType];
  if (((v6 < 3) & v4) != 0) {
    int64_t v7 = v6 + 1;
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)setRecordTypeForRedialing:(int64_t)a3
{
  uint64_t v3 = 0x7FFFFFFFLL;
  if ((unint64_t)(a3 - 1) <= 7) {
    uint64_t v3 = dword_18CFC4600[a3 - 1];
  }
  unsigned __int8 v4 = [(INStartAudioCallIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 == 0x7FFFFFFF) {
    [v4 setHasRecordTypeForRedialing:0];
  }
  else {
    [v4 setRecordTypeForRedialing:v3];
  }
}

- (int64_t)recordTypeForRedialing
{
  uint64_t v3 = [(INStartAudioCallIntent *)self _typedBackingStore];
  int v4 = [v3 hasRecordTypeForRedialing];
  id v5 = [(INStartAudioCallIntent *)self _typedBackingStore];
  int v6 = [v5 recordTypeForRedialing];
  if (v4 && (v6 - 2) <= 8) {
    int64_t v7 = qword_18CFC4620[v6 - 2];
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)setContacts:(id)a3
{
  id v4 = a3;
  id v6 = [(INStartAudioCallIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDialingContacts(v4);

  [v6 setContacts:v5];
}

- (NSArray)contacts
{
  v2 = [(INStartAudioCallIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 contacts];
  id v4 = INIntentSlotValueTransformFromDialingContacts(v3);

  return (NSArray *)v4;
}

- (void)setPreferredCallProvider:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  id v4 = [(INStartAudioCallIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 2) {
    [v4 setHasPreferredCallProvider:0];
  }
  else {
    objc_msgSend(v4, "setPreferredCallProvider:");
  }
}

- (int64_t)preferredCallProvider
{
  unint64_t v3 = [(INStartAudioCallIntent *)self _typedBackingStore];
  int v4 = [v3 hasPreferredCallProvider];
  id v5 = [(INStartAudioCallIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 preferredCallProvider] - 2;
  if (v6 <= 2) {
    int64_t v7 = v6 + 1;
  }
  else {
    int64_t v7 = 0;
  }
  if (v4) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)setDestinationType:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  int v4 = [(INStartAudioCallIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 4) {
    [v4 setHasDestinationType:0];
  }
  else {
    objc_msgSend(v4, "setDestinationType:");
  }
}

- (INCallDestinationType)destinationType
{
  unint64_t v3 = [(INStartAudioCallIntent *)self _typedBackingStore];
  int v4 = [v3 hasDestinationType];
  id v5 = [(INStartAudioCallIntent *)self _typedBackingStore];
  uint64_t v6 = [v5 destinationType] - 1;
  if (v6 <= 4) {
    INCallDestinationType v7 = v6 + 1;
  }
  else {
    INCallDestinationType v7 = INCallDestinationTypeUnknown;
  }
  if (v4) {
    INCallDestinationType v8 = v7;
  }
  else {
    INCallDestinationType v8 = INCallDestinationTypeUnknown;
  }

  return v8;
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
      id v4 = [(INStartAudioCallIntent *)self _typedBackingStore];
      [v4 setAudioRoute:v3];
      goto LABEL_9;
  }
  id v4 = [(INStartAudioCallIntent *)self _typedBackingStore];
  [v4 setHasAudioRoute:0];
LABEL_9:
}

- (int64_t)audioRoute
{
  uint64_t v3 = [(INStartAudioCallIntent *)self _typedBackingStore];
  int v4 = [v3 hasAudioRoute];
  id v5 = [(INStartAudioCallIntent *)self _typedBackingStore];
  int v6 = [v5 audioRoute];
  if (v4 && (v6 - 2) <= 2) {
    int64_t v7 = qword_18CFC4B68[v6 - 2];
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (INStartAudioCallIntent)initWithDestinationType:(INCallDestinationType)destinationType contacts:(NSArray *)contacts
{
  int v6 = contacts;
  v10.receiver = self;
  v10.super_class = (Class)INStartAudioCallIntent;
  int64_t v7 = [(INIntent *)&v10 init];
  INCallDestinationType v8 = v7;
  if (v7)
  {
    [(INStartAudioCallIntent *)v7 setDestinationType:destinationType];
    [(INStartAudioCallIntent *)v8 setContacts:v6];
  }

  return v8;
}

- (id)_categoryVerb
{
  return @"Call";
}

- (int64_t)_intentCategory
{
  return 17;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INStartAudioCallIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INStartAudioCallIntent *)self _typedBackingStore];
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

- (INStartAudioCallIntent)initWithContacts:(NSArray *)contacts
{
  return [(INStartAudioCallIntent *)self initWithDestinationType:0 contacts:contacts];
}

- (void)setUseSpeaker:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(INStartAudioCallIntent *)self useSpeaker] != a3)
  {
    [(INStartAudioCallIntent *)self setAudioRoute:v3];
  }
}

- (BOOL)useSpeaker
{
  return [(INStartAudioCallIntent *)self audioRoute] == 1;
}

@end