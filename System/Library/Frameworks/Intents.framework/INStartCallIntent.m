@interface INStartCallIntent
+ (BOOL)supportsSecureCoding;
+ (id)_ignoredParameters;
- (BOOL)configureAttributeSet:(id)a3 includingData:(BOOL)a4;
- (INCallAudioRoute)audioRoute;
- (INCallCapability)callCapability;
- (INCallDestinationType)destinationType;
- (INCallRecord)callRecordToCallBack;
- (INCallRecordFilter)callRecordFilter;
- (INCallRecordType)recordTypeForRedialing;
- (INStartCallIntent)initWithAudioRoute:(INCallAudioRoute)audioRoute destinationType:(INCallDestinationType)destinationType contacts:(NSArray *)contacts recordTypeForRedialing:(INCallRecordType)recordTypeForRedialing callCapability:(INCallCapability)callCapability;
- (INStartCallIntent)initWithAudioRoute:(int64_t)a3 destinationType:(int64_t)a4 contacts:(id)a5 callCapability:(int64_t)a6;
- (INStartCallIntent)initWithAudioRoute:(int64_t)a3 destinationType:(int64_t)a4 preferredCallProvider:(int64_t)a5 contacts:(id)a6 recordTypeForRedialing:(int64_t)a7 ttyType:(int64_t)a8 callCapability:(int64_t)a9;
- (INStartCallIntent)initWithCallRecordFilter:(INCallRecordFilter *)callRecordFilter callRecordToCallBack:(INCallRecord *)callRecordToCallBack audioRoute:(INCallAudioRoute)audioRoute destinationType:(INCallDestinationType)destinationType contacts:(NSArray *)contacts callCapability:(INCallCapability)callCapability;
- (INStartCallIntent)initWithCallRecordFilter:(id)a3 callRecordToCallBack:(id)a4 audioRoute:(int64_t)a5 destinationType:(int64_t)a6 preferredCallProvider:(int64_t)a7 contacts:(id)a8 ttyType:(int64_t)a9 callCapability:(int64_t)a10;
- (INStartCallIntent)initWithDestinationType:(int64_t)a3 contacts:(id)a4 callCapability:(int64_t)a5;
- (INStartCallRequestMetadata)callRequestMetadata;
- (NSArray)callGroups;
- (NSArray)contacts;
- (NSNumber)isGroupCall;
- (NSString)faceTimeLink;
- (NSString)notificationThreadIdentifier;
- (id)_categoryVerb;
- (id)_currentParameterCombination;
- (id)_dictionaryRepresentation;
- (id)_emptyCopy;
- (id)_metadata;
- (id)_spotlightContentType;
- (id)_subtitleWithLocalizer:(id)a3 fromBundleURL:(id)a4;
- (id)_titleWithLocalizer:(id)a3 fromBundleURL:(id)a4;
- (id)_typedBackingStore;
- (id)_validParameterCombinationsWithSchema:(id)a3;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (int64_t)preferredCallProvider;
- (int64_t)ttyType;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAudioRoute:(int64_t)a3;
- (void)setCallCapability:(int64_t)a3;
- (void)setCallGroups:(id)a3;
- (void)setCallRecordFilter:(id)a3;
- (void)setCallRecordToCallBack:(id)a3;
- (void)setCallRequestMetadata:(id)a3;
- (void)setContacts:(id)a3;
- (void)setDestinationType:(int64_t)a3;
- (void)setFaceTimeLink:(id)a3;
- (void)setIsGroupCall:(id)a3;
- (void)setNotificationThreadIdentifier:(id)a3;
- (void)setPreferredCallProvider:(int64_t)a3;
- (void)setRecordTypeForRedialing:(int64_t)a3;
- (void)setTTYType:(int64_t)a3;
@end

@implementation INStartCallIntent

- (int64_t)preferredCallProvider
{
  v3 = [(INStartCallIntent *)self _typedBackingStore];
  int v4 = [v3 hasPreferredCallProvider];
  v5 = [(INStartCallIntent *)self _typedBackingStore];
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

- (void)setPreferredCallProvider:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  int v4 = [(INStartCallIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 2) {
    [v4 setHasPreferredCallProvider:0];
  }
  else {
    objc_msgSend(v4, "setPreferredCallProvider:");
  }
}

- (int64_t)ttyType
{
  unint64_t v3 = [(INStartCallIntent *)self _typedBackingStore];
  unsigned __int8 v4 = [v3 hasTtyType];
  id v5 = [(INStartCallIntent *)self _typedBackingStore];
  unsigned int v6 = [v5 ttyType];
  if (((v6 < 3) & v4) != 0) {
    int64_t v7 = v6 + 1;
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)_subtitleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(INStartCallIntent *)self callCapability] == INCallCapabilityVideoCall) {
    goto LABEL_2;
  }
  int64_t v8 = [(INStartCallIntent *)self preferredCallProvider];
  if ((unint64_t)(v8 - 2) < 2 || !v8)
  {
    -[INIntent _subtitleWithLocalizer:fromBundleURL:](&v39, sel__subtitleWithLocalizer_fromBundleURL_, v6, v7, v38.receiver, v38.super_class, self, INStartCallIntent, v40.receiver, v40.super_class, v41.receiver, v41.super_class);
    goto LABEL_20;
  }
  if (v8 != 1)
  {
LABEL_2:
    -[INIntent _subtitleWithLocalizer:fromBundleURL:](&v38, sel__subtitleWithLocalizer_fromBundleURL_, v6, v7, self, INStartCallIntent, v39.receiver, v39.super_class, v40.receiver, v40.super_class, v41.receiver, v41.super_class);
LABEL_20:
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v9 = [(INStartCallIntent *)self contacts];
  if ([v9 count] != 1)
  {

    goto LABEL_25;
  }
  v10 = [(INStartCallIntent *)self contacts];
  v11 = [v10 firstObject];
  v12 = [v11 personHandle];
  uint64_t v13 = [v12 type];

  if (v13 != 2)
  {
LABEL_25:
    -[INIntent _subtitleWithLocalizer:fromBundleURL:](&v40, sel__subtitleWithLocalizer_fromBundleURL_, v6, v7, v38.receiver, v38.super_class, v39.receiver, v39.super_class, self, INStartCallIntent, v41.receiver, v41.super_class);
    goto LABEL_20;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v14 = [(INStartCallIntent *)self contacts];
  v15 = [v14 firstObject];
  v16 = [v15 aliases];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v17)
  {

LABEL_27:
    -[INIntent _subtitleWithLocalizer:fromBundleURL:](&v41, sel__subtitleWithLocalizer_fromBundleURL_, v6, v7, v38.receiver, v38.super_class, v39.receiver, v39.super_class, v40.receiver, v40.super_class, self, INStartCallIntent);
    goto LABEL_20;
  }
  uint64_t v18 = v17;
  char v19 = 0;
  uint64_t v20 = *(void *)v43;
  do
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v43 != v20) {
        objc_enumerationMutation(v16);
      }
      v19 |= [*(id *)(*((void *)&v42 + 1) + 8 * i) type] == 2;
    }
    uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
  }
  while (v18);

  if ((v19 & 1) == 0) {
    goto LABEL_27;
  }
  v22 = [(INStartCallIntent *)self contacts];
  v23 = [v22 firstObject];
  v24 = [v23 personHandle];
  v25 = [v24 label];

  if (!v25)
  {
    v29 = [v6 locale];
    v30 = [v29 regionCode];
    v26 = [v30 lowercaseString];

    if (!v26)
    {
      v26 = (void *)CPPhoneNumberCopyNetworkCountryCode();
      if (!v26) {
        v26 = (void *)CPPhoneNumberCopyHomeCountryCode();
      }
    }
    v31 = [(INStartCallIntent *)self contacts];
    v32 = [v31 firstObject];
    v33 = [v32 personHandle];
    [v33 value];
    v34 = (void *)PNCreateFormattedStringWithCountry();

    if ([v34 length])
    {
      id v27 = v34;
    }
    else
    {
      v35 = [(INStartCallIntent *)self contacts];
      v36 = [v35 firstObject];
      v37 = [v36 personHandle];
      id v27 = [v37 value];
    }
    goto LABEL_36;
  }
  if ([v25 hasPrefix:@"com.apple.intents.PersonHandleLabel."])
  {
    v26 = [v25 substringFromIndex:objc_msgSend(@"com.apple.intents.PersonHandleLabel.", "length")];
    INLocalizedStringWithLocalizer(v25, v26, v6);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

    goto LABEL_37;
  }
  id v27 = v25;
LABEL_37:

LABEL_21:

  return v27;
}

- (id)_titleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(INStartCallIntent *)self callCapability] == INCallCapabilityVideoCall
    && [(INStartCallIntent *)self preferredCallProvider] == 2)
  {
    int64_t v8 = NSString;
    v9 = INLocalizedStringWithLocalizer(@"FaceTime %@", @"FaceTime %@", v6);
    v10 = [(INStartCallIntent *)self contacts];
    v11 = objc_msgSend(v10, "_intents_readableTitleWithLocalizer:", v6);
    v12 = objc_msgSend(v8, "stringWithFormat:", v9, v11);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)INStartCallIntent;
    v12 = [(INIntent *)&v14 _titleWithLocalizer:v6 fromBundleURL:v7];
  }

  return v12;
}

+ (id)_ignoredParameters
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"audioRoute", @"destinationType", @"preferredCallProvider", @"ttyType", @"recordTypeForRedialing", @"callCapability", @"callGroups", @"notificationThreadIdentifier", 0);
}

- (void)setRecordTypeForRedialing:(int64_t)a3
{
  uint64_t v3 = 0x7FFFFFFFLL;
  if ((unint64_t)(a3 - 1) <= 7) {
    uint64_t v3 = dword_18CFC4600[a3 - 1];
  }
  unsigned __int8 v4 = [(INStartCallIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 == 0x7FFFFFFF) {
    [v4 setHasRecordTypeForRedialing:0];
  }
  else {
    [v4 setRecordTypeForRedialing:v3];
  }
}

- (INCallRecordType)recordTypeForRedialing
{
  uint64_t v3 = [(INStartCallIntent *)self _typedBackingStore];
  int v4 = [v3 hasRecordTypeForRedialing];
  id v5 = [(INStartCallIntent *)self _typedBackingStore];
  int v6 = [v5 recordTypeForRedialing];
  if (v4 && (v6 - 2) <= 8) {
    INCallRecordType v7 = qword_18CFC4620[v6 - 2];
  }
  else {
    INCallRecordType v7 = INCallRecordTypeUnknown;
  }

  return v7;
}

- (INStartCallIntent)initWithAudioRoute:(int64_t)a3 destinationType:(int64_t)a4 preferredCallProvider:(int64_t)a5 contacts:(id)a6 recordTypeForRedialing:(int64_t)a7 ttyType:(int64_t)a8 callCapability:(int64_t)a9
{
  v10 = [(INStartCallIntent *)self initWithCallRecordFilter:0 callRecordToCallBack:0 audioRoute:a3 destinationType:a4 preferredCallProvider:a5 contacts:a6 ttyType:a8 callCapability:a9];
  v11 = v10;
  if (v10) {
    [(INStartCallIntent *)v10 setRecordTypeForRedialing:a7];
  }
  return v11;
}

- (INStartCallIntent)initWithAudioRoute:(int64_t)a3 destinationType:(int64_t)a4 contacts:(id)a5 callCapability:(int64_t)a6
{
  return [(INStartCallIntent *)self initWithAudioRoute:a3 destinationType:a4 contacts:a5 recordTypeForRedialing:0 callCapability:a6];
}

- (INStartCallIntent)initWithDestinationType:(int64_t)a3 contacts:(id)a4 callCapability:(int64_t)a5
{
  return [(INStartCallIntent *)self initWithAudioRoute:0 destinationType:a3 contacts:a4 recordTypeForRedialing:0 callCapability:a5];
}

- (INStartCallIntent)initWithAudioRoute:(INCallAudioRoute)audioRoute destinationType:(INCallDestinationType)destinationType contacts:(NSArray *)contacts recordTypeForRedialing:(INCallRecordType)recordTypeForRedialing callCapability:(INCallCapability)callCapability
{
  return [(INStartCallIntent *)self initWithAudioRoute:audioRoute destinationType:destinationType preferredCallProvider:0 contacts:contacts recordTypeForRedialing:recordTypeForRedialing ttyType:0 callCapability:callCapability];
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
  INCallRecordType v7 = [(INStartCallIntent *)self contacts];
  int64_t v8 = objc_opt_new();
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
        objc_super v14 = INPersonToCSPerson(*(void **)(*((void *)&v21 + 1) + 8 * v13));
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

  uint64_t v17 = [v8 valueForKeyPath:@"handles.@distinctUnionOfArrays.self"];
  [v6 setRecipientAddresses:v17];

  v20.receiver = self;
  v20.super_class = (Class)INStartCallIntent;
  BOOL v18 = [(INIntent *)&v20 configureAttributeSet:v6 includingData:v4];

  return v18;
}

- (id)verb
{
  return @"StartCall";
}

- (id)domain
{
  return @"Calls";
}

- (id)_currentParameterCombination
{
  uint64_t v3 = [(INIntent *)self _nonNilParameters];
  BOOL v4 = (void *)[v3 mutableCopy];

  id v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"audioRoute", @"destinationType", @"ttyType", @"recordTypeForRedialing", @"callCapability", 0);
  [v4 minusSet:v5];

  id v6 = [(INIntent *)self _nonNilParameters];
  int v7 = [v6 containsObject:@"preferredCallProvider"];

  if (!v7) {
    goto LABEL_4;
  }
  int64_t v8 = [(INIntent *)self _parameterCombinations];
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
      v12.super_class = (Class)INStartCallIntent;
      id v9 = [(INIntent *)&v12 _currentParameterCombination];
    }
  }

  return v9;
}

- (id)_validParameterCombinationsWithSchema:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)INStartCallIntent;
  BOOL v4 = [(INIntent *)&v20 _validParameterCombinationsWithSchema:a3];
  id v5 = [MEMORY[0x1E4F1CA80] set];
  if ([(INStartCallIntent *)self preferredCallProvider]) {
    [v5 addObject:@"preferredCallProvider"];
  }
  if ([(INStartCallIntent *)self destinationType]) {
    [v5 addObject:@"destinationType"];
  }
  if ([(INStartCallIntent *)self callCapability]) {
    [v5 addObject:@"callCapability"];
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
          objc_super v14 = [v12 setByAddingObjectsFromSet:v5];
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
  int v7 = [(INStartCallIntent *)self _typedBackingStore];
  id v11 = v6;
  uint64_t v8 = (void *)[v7 copy];
  uint64_t v9 = [v7 contacts];
  uint64_t v10 = INIntentSlotValueRedactedContactsFromContacts(v9, a3, v11);

  [v8 setContacts:v10];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v23[6] = *MEMORY[0x1E4F143B8];
  v22[0] = @"callRecordFilter";
  uint64_t v3 = [(INStartCallIntent *)self callRecordFilter];
  BOOL v4 = v3;
  if (!v3)
  {
    BOOL v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[0] = v4;
  v22[1] = @"callRecordToCallBack";
  id v5 = [(INStartCallIntent *)self callRecordToCallBack];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[1] = v6;
  v22[2] = @"audioRoute";
  INCallAudioRoute v7 = [(INStartCallIntent *)self audioRoute];
  uint64_t v8 = @"speakerphoneAudioRoute";
  uint64_t v9 = @"heySiriAudioRoute";
  uint64_t v10 = @"unknown";
  if (v7 == INCallAudioRouteBluetoothAudioRoute) {
    uint64_t v10 = @"bluetoothAudioRoute";
  }
  if (v7 != 1000) {
    uint64_t v9 = v10;
  }
  if (v7 != INCallAudioRouteSpeakerphoneAudioRoute) {
    uint64_t v8 = v9;
  }
  id v11 = v8;
  v23[2] = v11;
  v22[3] = @"destinationType";
  INCallDestinationType v12 = [(INStartCallIntent *)self destinationType];
  if ((unint64_t)(v12 - 1) > 4) {
    uint64_t v13 = @"unknown";
  }
  else {
    uint64_t v13 = off_1E5518558[v12 - 1];
  }
  objc_super v14 = v13;
  v23[3] = v14;
  v22[4] = @"contacts";
  v15 = [(INStartCallIntent *)self contacts];
  long long v16 = v15;
  if (!v15)
  {
    long long v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[4] = v16;
  v22[5] = @"callCapability";
  INCallCapability v17 = [(INStartCallIntent *)self callCapability];
  long long v18 = @"unknown";
  if (v17 == INCallCapabilityVideoCall) {
    long long v18 = @"videoCall";
  }
  if (v17 == INCallCapabilityAudioCall) {
    long long v18 = @"audioCall";
  }
  long long v19 = v18;
  v23[5] = v19;
  objc_super v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:6];

  if (!v15) {
  if (!v5)
  }

  if (!v3) {

  }
  return v20;
}

- (void)setCallRequestMetadata:(id)a3
{
  id v4 = a3;
  id v6 = [(INStartCallIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToStartCallRequestMetadata(v4);

  [v6 setCallRequestMetadata:v5];
}

- (INStartCallRequestMetadata)callRequestMetadata
{
  v2 = [(INStartCallIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 callRequestMetadata];
  id v4 = INIntentSlotValueTransformFromStartCallRequestMetadata(v3);

  return (INStartCallRequestMetadata *)v4;
}

- (void)setFaceTimeLink:(id)a3
{
  id v4 = a3;
  id v5 = [(INStartCallIntent *)self _typedBackingStore];
  [v5 setFaceTimeLink:v4];
}

- (NSString)faceTimeLink
{
  v2 = [(INStartCallIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 faceTimeLink];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setNotificationThreadIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INStartCallIntent *)self _typedBackingStore];
  [v5 setNotificationThreadIdentifier:v4];
}

- (NSString)notificationThreadIdentifier
{
  v2 = [(INStartCallIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 notificationThreadIdentifier];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setCallGroups:(id)a3
{
  id v4 = a3;
  id v6 = [(INStartCallIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToCallGroups(v4);

  [v6 setCallGroups:v5];
}

- (NSArray)callGroups
{
  v2 = [(INStartCallIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 callGroups];
  id v4 = INIntentSlotValueTransformFromCallGroups(v3);

  return (NSArray *)v4;
}

- (void)setIsGroupCall:(id)a3
{
  id v5 = a3;
  id v4 = [(INStartCallIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setIsGroupCall:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasIsGroupCall:0];
  }
}

- (NSNumber)isGroupCall
{
  uint64_t v3 = [(INStartCallIntent *)self _typedBackingStore];
  if ([v3 hasIsGroupCall])
  {
    id v4 = NSNumber;
    id v5 = [(INStartCallIntent *)self _typedBackingStore];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isGroupCall"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setCallCapability:(int64_t)a3
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
  id v5 = [(INStartCallIntent *)self _typedBackingStore];
  id v6 = v5;
  if (v4 == 0x7FFFFFFF) {
    [v5 setHasCallCapability:0];
  }
  else {
    [v5 setCallCapability:v4];
  }
}

- (INCallCapability)callCapability
{
  unsigned int v3 = [(INStartCallIntent *)self _typedBackingStore];
  int v4 = [v3 hasCallCapability];
  id v5 = [(INStartCallIntent *)self _typedBackingStore];
  int v6 = [v5 callCapability];
  uint64_t v7 = 2 * (v6 == 2);
  if (v6 == 1) {
    uint64_t v7 = 1;
  }
  if (v4) {
    INCallCapability v8 = v7;
  }
  else {
    INCallCapability v8 = INCallCapabilityUnknown;
  }

  return v8;
}

- (void)setTTYType:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  int v4 = [(INStartCallIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 2) {
    [v4 setHasTtyType:0];
  }
  else {
    [v4 setTtyType:v3];
  }
}

- (void)setContacts:(id)a3
{
  id v4 = a3;
  id v6 = [(INStartCallIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToContacts(v4);

  [v6 setContacts:v5];
}

- (NSArray)contacts
{
  v2 = [(INStartCallIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 contacts];
  id v4 = INIntentSlotValueTransformFromContacts(v3);

  return (NSArray *)v4;
}

- (void)setDestinationType:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  id v4 = [(INStartCallIntent *)self _typedBackingStore];
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
  unint64_t v3 = [(INStartCallIntent *)self _typedBackingStore];
  int v4 = [v3 hasDestinationType];
  id v5 = [(INStartCallIntent *)self _typedBackingStore];
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
      id v4 = [(INStartCallIntent *)self _typedBackingStore];
      [v4 setAudioRoute:v3];
      goto LABEL_9;
  }
  id v4 = [(INStartCallIntent *)self _typedBackingStore];
  [v4 setHasAudioRoute:0];
LABEL_9:
}

- (INCallAudioRoute)audioRoute
{
  uint64_t v3 = [(INStartCallIntent *)self _typedBackingStore];
  int v4 = [v3 hasAudioRoute];
  id v5 = [(INStartCallIntent *)self _typedBackingStore];
  int v6 = [v5 audioRoute];
  if (v4 && (v6 - 2) <= 2) {
    INCallAudioRoute v7 = qword_18CFC4B68[v6 - 2];
  }
  else {
    INCallAudioRoute v7 = INCallAudioRouteUnknown;
  }

  return v7;
}

- (void)setCallRecordToCallBack:(id)a3
{
  id v4 = a3;
  id v6 = [(INStartCallIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToCallRecordValue(v4);

  [v6 setCallRecordToCallBack:v5];
}

- (INCallRecord)callRecordToCallBack
{
  v2 = [(INStartCallIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 callRecordToCallBack];
  id v4 = INIntentSlotValueTransformFromCallRecordValue(v3);

  return (INCallRecord *)v4;
}

- (void)setCallRecordFilter:(id)a3
{
  id v4 = a3;
  id v6 = [(INStartCallIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToCallRecordFilter(v4);

  [v6 setCallRecordFilter:v5];
}

- (INCallRecordFilter)callRecordFilter
{
  v2 = [(INStartCallIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 callRecordFilter];
  id v4 = INIntentSlotValueTransformFromCallRecordFilter(v3);

  return (INCallRecordFilter *)v4;
}

- (id)_emptyCopy
{
  v5.receiver = self;
  v5.super_class = (Class)INStartCallIntent;
  uint64_t v3 = [(INIntent *)&v5 _emptyCopy];
  objc_msgSend(v3, "setPreferredCallProvider:", -[INStartCallIntent preferredCallProvider](self, "preferredCallProvider"));

  return v3;
}

- (INStartCallIntent)initWithCallRecordFilter:(id)a3 callRecordToCallBack:(id)a4 audioRoute:(int64_t)a5 destinationType:(int64_t)a6 preferredCallProvider:(int64_t)a7 contacts:(id)a8 ttyType:(int64_t)a9 callCapability:(int64_t)a10
{
  id v11 = [(INStartCallIntent *)self initWithCallRecordFilter:a3 callRecordToCallBack:a4 audioRoute:a5 destinationType:a6 contacts:a8 callCapability:a10];
  INCallDestinationType v12 = v11;
  if (v11)
  {
    [(INStartCallIntent *)v11 setPreferredCallProvider:a7];
    [(INStartCallIntent *)v12 setTTYType:a9];
  }
  return v12;
}

- (INStartCallIntent)initWithCallRecordFilter:(INCallRecordFilter *)callRecordFilter callRecordToCallBack:(INCallRecord *)callRecordToCallBack audioRoute:(INCallAudioRoute)audioRoute destinationType:(INCallDestinationType)destinationType contacts:(NSArray *)contacts callCapability:(INCallCapability)callCapability
{
  objc_super v14 = callRecordFilter;
  v15 = callRecordToCallBack;
  long long v16 = contacts;
  v20.receiver = self;
  v20.super_class = (Class)INStartCallIntent;
  INCallCapability v17 = [(INIntent *)&v20 init];
  long long v18 = v17;
  if (v17)
  {
    [(INStartCallIntent *)v17 setCallRecordFilter:v14];
    [(INStartCallIntent *)v18 setCallRecordToCallBack:v15];
    [(INStartCallIntent *)v18 setAudioRoute:audioRoute];
    [(INStartCallIntent *)v18 setDestinationType:destinationType];
    [(INStartCallIntent *)v18 setContacts:v16];
    [(INStartCallIntent *)v18 setCallCapability:callCapability];
  }

  return v18;
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
  id v5 = [(INStartCallIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INStartCallIntent *)self _typedBackingStore];
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

@end