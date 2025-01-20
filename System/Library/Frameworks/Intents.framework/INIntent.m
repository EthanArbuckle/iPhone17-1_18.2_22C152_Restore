@interface INIntent
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (BOOL)shouldSkipDefaultSchemaCheck;
+ (BOOL)supportsSecureCoding;
+ (id)_ignoredParameters;
+ (id)_sharedExtensionContextUUIDForIntentClassName:(id)a3;
+ (id)intentDescription;
+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4;
+ (id)typeName;
+ (void)_setSharedExtensionContextUUID:(id)a3 forIntentClassName:(id)a4;
+ (void)initialize;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_intents_preferredScaledImageSize;
- (BOOL)_enumerateWithValueProcessingBlock:(id)a3;
- (BOOL)_hasMatchingIntentHandlerIncludingRemoteExecution:(BOOL)a3;
- (BOOL)_hasTitle;
- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4;
- (BOOL)_intents_hasSystemIntentHandler;
- (BOOL)_intents_isExemptFromMulitWindowRequirementForInAppHandling;
- (BOOL)_isConfigurable;
- (BOOL)_isEligibleForSuggestions;
- (BOOL)_isPrimaryDisplayDisabled;
- (BOOL)_isUserConfirmationRequired;
- (BOOL)_isValidKey:(id)a3;
- (BOOL)_isValueValidForKey:(id)a3 unsupportedReason:(id *)a4;
- (BOOL)_shouldForwardToAppOnSucccess;
- (BOOL)_supportsBackgroundExecution;
- (BOOL)_supportsBackgroundExecutionWithOptions:(unint64_t)a3;
- (BOOL)configureAttributeSet:(id)a3 includingData:(BOOL)a4;
- (BOOL)didAuthenticateAppProtection;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGenericIntent;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (INAppIntent)_asMigratedAppIntent;
- (INImage)_defaultImage;
- (INImage)_keyImage;
- (INImage)imageForParameterNamed:(NSString *)parameterName;
- (INIntent)init;
- (INIntent)initWithCoder:(id)a3;
- (INIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (INIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
- (INIntentCodableDescription)_codableDescription;
- (INIntentDonationMetadata)donationMetadata;
- (INIntentKeyParameter)_keyParameter;
- (INParameterContexts)_parameterContexts;
- (INShortcutAvailabilityOptions)shortcutAvailability;
- (NSArray)_codableAttributes;
- (NSArray)_parameterImages;
- (NSArray)_parametersForcedToNeedsValue;
- (NSArray)_sortedParameterImages;
- (NSArray)airPlayRouteIds;
- (NSDictionary)_JSONDictionaryRepresentation;
- (NSDictionary)_configurableParameterCombinations;
- (NSDictionary)_parameterCombinations;
- (NSDictionary)_resolvableParameterCombinations;
- (NSDictionary)_validParameterCombinations;
- (NSDictionary)parametersByName;
- (NSNumber)_endpointMediaPlaybackEnabled;
- (NSNumber)_isOwnedByCurrentUser;
- (NSNumber)_msLimitReached;
- (NSOrderedSet)_displayOrderedAttributes;
- (NSString)_categoryVerb;
- (NSString)_endpointId;
- (NSString)_localizedVerb;
- (NSString)_mediaRouteId;
- (NSString)_nanoLaunchId;
- (NSString)_originatingDeviceIDSIdentifier;
- (NSString)_originatingDeviceRapportEffectiveIdentifier;
- (NSString)_originatingDeviceRapportMediaSystemIdentifier;
- (NSString)_preferredAudioOutputRouteId;
- (NSString)_subtitle;
- (NSString)_title;
- (NSString)_uiExtensionBundleId;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)domain;
- (NSString)extensionBundleId;
- (NSString)identifier;
- (NSString)intentDescription;
- (NSString)intentId;
- (NSString)launchId;
- (NSString)recordDeviceIdentifier;
- (NSString)recordRoute;
- (NSString)suggestedInvocationPhrase;
- (NSString)typeName;
- (NSString)utteranceString;
- (NSString)verb;
- (NSUUID)recordDeviceUID;
- (PBCodable)backingStore;
- (_INPBIntentMetadata)_metadata;
- (id)_JSONDictionaryRepresentationWithConfiguration:(id)a3;
- (id)_backingStoreData;
- (id)_className;
- (id)_copyApplyingNewBackingStoreData:(id)a3 error:(id *)a4;
- (id)_copyWithoutBackingStoreData:(id *)a3;
- (id)_currentParameterCombination;
- (id)_defaultImageName;
- (id)_dictionaryRepresentation;
- (id)_displayOrderedNonNilParameters;
- (id)_emptyCopy;
- (id)_imageForParameter:(id)a3;
- (id)_inCodable;
- (id)_init;
- (id)_initWithIdentifier:(id)a3 backingStore:(id)a4 schema:(id)a5 error:(id *)a6;
- (id)_initWithIdentifier:(id)a3 schema:(id)a4 name:(id)a5 data:(id)a6;
- (id)_intentInstanceDescription;
- (id)_intents_backgroundHandlingAssertionForBundleIdentifier:(id)a3 context:(unint64_t)a4 error:(id *)a5;
- (id)_intents_bestBundleIdentifier;
- (id)_intents_bundleIdForDisplay;
- (id)_intents_bundleIdForLaunching;
- (id)_keyCodableAttributes;
- (id)_keyImageWithIntentDescriptionStrategy;
- (id)_localizedCombinationStringForKey:(id)a3 value:(id)a4 localizationTable:(id)a5 bundleURL:(id)a6 localizer:(id)a7;
- (id)_nonNilParameters;
- (id)_querySchemaWithBlock:(id)a3 contentOptions:(unint64_t)a4;
- (id)_spotlightContentType;
- (id)_subtitleForLanguage:(id)a3;
- (id)_subtitleWithLocalizer:(id)a3 fromBundleURL:(id)a4;
- (id)_titleForLanguage:(id)a3;
- (id)_titleWithLocalizer:(id)a3 fromBundleURL:(id)a4;
- (id)_typedBackingStore;
- (id)_validParameterCombinationsWithSchema:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionAtIndent:(unint64_t)a3;
- (id)intentSlotDescriptions;
- (id)localizeValueOfSlotDescription:(id)a3 withLocalizer:(id)a4;
- (id)valueForKey:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (id)widgetPlistableRepresentation:(id *)a3;
- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4;
- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4;
- (int64_t)_executionContext;
- (int64_t)_idiom;
- (int64_t)_indexingHash;
- (int64_t)_intentCategory;
- (int64_t)_intents_toggleState;
- (int64_t)_preferredInteractionDirection;
- (int64_t)_type;
- (int64_t)triggerMethod;
- (unint64_t)hash;
- (unsigned)audioSessionID;
- (void)_injectProxiesForImages:(id)a3 completion:(id)a4;
- (void)_injectProxiesForImagesUsingCustomCodableStrategy:(id)a3 completion:(id)a4;
- (void)_injectProxiesForImagesUsingIntentSlotDescriptionStrategy:(id)a3 completion:(id)a4;
- (void)_injectProxiesForParameterImages:(id)a3 completion:(id)a4;
- (void)_injectProxyForDefaultImage:(id)a3 completion:(id)a4;
- (void)_intents_allowAppToInitiatePlaybackForBundleIdentifier:(id)a3 context:(unint64_t)a4 error:(id *)a5;
- (void)_setAirPlayRouteIds:(id)a3;
- (void)_setAudioSessionID:(unsigned int)a3;
- (void)_setCategoryVerb:(id)a3;
- (void)_setConfigurableParameterCombinations:(id)a3;
- (void)_setDefaultImage:(id)a3;
- (void)_setEndpointMediaPlaybackEnabled:(id)a3;
- (void)_setExecutionContext:(int64_t)a3;
- (void)_setExtensionBundleId:(id)a3;
- (void)_setIdiom:(int64_t)a3;
- (void)_setImage:(id)a3 forParameter:(id)a4;
- (void)_setIntentCategory:(int64_t)a3;
- (void)_setIsOwnedByCurrentUser:(id)a3;
- (void)_setLaunchId:(id)a3;
- (void)_setMSLimitReached:(id)a3;
- (void)_setMetadata:(id)a3;
- (void)_setNanoLaunchId:(id)a3;
- (void)_setOriginatingDeviceIdsIdentifier:(id)a3;
- (void)_setOriginatingDeviceRapportEffectiveIdentifier:(id)a3;
- (void)_setOriginatingDeviceRapportMediaSystemIdentifier:(id)a3;
- (void)_setParameterCombinations:(id)a3;
- (void)_setParameterContexts:(id)a3;
- (void)_setParameterImages:(id)a3;
- (void)_setParametersForcedToNeedsValue:(id)a3;
- (void)_setPrimaryDisplayDisabled:(BOOL)a3;
- (void)_setRecordDeviceIdentifier:(id)a3;
- (void)_setRecordDeviceUID:(id)a3;
- (void)_setRecordRoute:(id)a3;
- (void)_setShouldForwardToAppOnSuccess:(BOOL)a3;
- (void)_setUiExtensionBundleId:(id)a3;
- (void)_setUserConfirmationRequired:(BOOL)a3;
- (void)_updateWithJSONDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBackingStore:(id)a3;
- (void)setDidAuthenticateAppProtection:(BOOL)a3;
- (void)setDomain:(id)a3;
- (void)setDonationMetadata:(INIntentDonationMetadata *)donationMetadata;
- (void)setIdentifier:(id)a3;
- (void)setImage:(INImage *)image forParameterNamed:(NSString *)parameterName;
- (void)setParametersByName:(id)a3;
- (void)setShortcutAvailability:(INShortcutAvailabilityOptions)shortcutAvailability;
- (void)setSuggestedInvocationPhrase:(NSString *)suggestedInvocationPhrase;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setVerb:(id)a3;
- (void)trimDataAgainstTCCForAuditToken:(id *)a3 bundle:(id)a4;
@end

@implementation INIntent

- (id)_intentInstanceDescription
{
  v3 = [(INIntent *)self backingStore];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(INIntent *)self backingStore];
    v6 = [v5 _objectDescription];
    uint64_t v7 = [v6 typeName];
    v8 = [(INIntent *)self _className];
    v9 = [(NSString *)v8 stringByAppendingString:@"Response"];
    if (!NSClassFromString(v9))
    {

      v9 = (NSString *)@"INIntentResponse";
    }
    v10 = [(INIntent *)self extensionBundleId];
    if (![v10 length])
    {
      v11 = [(INIntent *)self _intents_launchIdForCurrentPlatform];
      id v28 = v10;
      INExtractAppInfoFromSiriLaunchId(v11, &v28, 0);
      id v12 = v28;

      v10 = v12;
    }
    v26 = v9;
    v27 = v6;
    if ([v10 length] && -[NSString length](v8, "length"))
    {
      v24 = [NSString stringWithFormat:@"%@%@.%@", @"sirikit.intents.custom.", v10, v8];
    }
    else
    {
      v24 = 0;
    }
    v14 = [INIntentDescription alloc];
    Class v15 = NSClassFromString(v8);
    v16 = [NSString stringWithFormat:@"handle%@:completion:", v7];
    v17 = (void *)v7;
    SEL v18 = NSSelectorFromString(v16);
    v19 = [NSString stringWithFormat:@"confirm%@:completion:", v17];
    v20 = v8;
    SEL v21 = NSSelectorFromString(v19);
    INIntentSlotDescriptionsWithCodable(v5);
    v22 = v25 = v5;
    v13 = [(INIntentDescription *)v14 initWithName:v20 responseName:v26 facadeClass:v15 dataClass:0 type:v24 isPrivate:0 handleSelector:v18 confirmSelector:v21 slotsByName:v22];
  }
  else
  {
    v13 = [(id)objc_opt_class() intentDescription];
  }

  return v13;
}

- (NSString)extensionBundleId
{
  v2 = [(INIntent *)self _metadata];
  v3 = [v2 systemExtensionBundleId];

  return (NSString *)v3;
}

- (id)_initWithIdentifier:(id)a3 backingStore:(id)a4 schema:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if (!self) {
    goto LABEL_22;
  }
  id v12 = (NSString *)[a3 copy];
  identifier = self->_identifier;
  self->_identifier = v12;

  v14 = (objc_class *)objc_opt_class();
  Class v15 = INIntentSchemaGetIntentDescriptionWithFacadeClass(v14);
  uint64_t v16 = [v15 dataClass];
  if (v16)
  {
    v17 = (objc_class *)v16;
    if (![v10 isMemberOfClass:v16])
    {
      SEL v18 = (PBCodable *)objc_alloc_init(v17);
      goto LABEL_7;
    }
LABEL_6:
    SEL v18 = (PBCodable *)[v10 copy];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  SEL v18 = (PBCodable *)[v10 _copyWithZone:0 error:a6];
LABEL_7:
  backingStore = self->_backingStore;
  self->_backingStore = v18;

LABEL_8:
  v20 = [(INIntent *)self _metadata];

  if (!v20)
  {
    SEL v21 = objc_alloc_init(_INPBIntentMetadata);
    [(INIntent *)self _setMetadata:v21];
  }
  if (v11)
  {
    v22 = [(INIntent *)self _className];
    v23 = [v11 _parameterCombinationsForClassName:v22];
    parameterCombinations = self->_parameterCombinations;
    self->_parameterCombinations = v23;

    v25 = [(INIntent *)self _className];
    v26 = [v11 _configurableParameterCombinationsForClassName:v25];
    configurableParameterCombinations = self->_configurableParameterCombinations;
    self->_configurableParameterCombinations = v26;
  }
  id v28 = [(INIntent *)self _metadata];
  [v28 setDefaultImageValue:0];

  if ([(INIntent *)self _type] != 2) {
    goto LABEL_20;
  }
  v29 = [(INIntent *)self _inCodable];
  v30 = [v29 _objectDescription];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v32 = [(INIntent *)self _inCodable];
    v33 = [v32 _objectDescription];

    if (![(INIntent *)self _intentCategory]) {
      -[INIntent _setIntentCategory:](self, "_setIntentCategory:", [v33 intentCategory]);
    }
    v34 = [(INIntent *)self _metadata];
    v35 = [v34 categoryVerb];
    uint64_t v36 = [v35 length];

    if (!v36)
    {
      v37 = [v33 verb];
      [(INIntent *)self _setCategoryVerb:v37];
    }
    -[INIntent _setUserConfirmationRequired:](self, "_setUserConfirmationRequired:", [v33 userConfirmationRequired]);
    v38 = [v33 versioningHash];

    if (v38)
    {
      v39 = [(INIntent *)self _metadata];
      v40 = [v33 versioningHash];
      objc_msgSend(v39, "setVersioningHash:", objc_msgSend(v40, "unsignedLongLongValue"));
    }
  }
  else
  {
LABEL_20:
    [(INIntent *)self _setIntentCategory:[(INIntent *)self _intentCategory]];
    v33 = [(INIntent *)self _categoryVerb];
    [(INIntent *)self _setCategoryVerb:v33];
  }

  self->_keyParameterLock._os_unfair_lock_opaque = 0;
LABEL_22:

  return self;
}

- (_INPBIntentMetadata)_metadata
{
  if ([(INIntent *)self _type] == 2)
  {
    v3 = [(INIntent *)self _inCodable];
    uint64_t v4 = [v3 valueForPropertyNamed:@"_metadata"];
LABEL_5:
    v5 = (void *)v4;

    goto LABEL_7;
  }
  if ([(INIntent *)self _type] == 3)
  {
    v3 = [(INIntent *)self _typedBackingStore];
    uint64_t v4 = [v3 metadata];
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return (_INPBIntentMetadata *)v5;
}

- (id)_inCodable
{
  v3 = [(INIntent *)self backingStore];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(INIntent *)self backingStore];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isGenericIntent
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (int64_t)_type
{
  v3 = [(INIntent *)self backingStore];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 2;
  }
  if ([(INIntent *)self isGenericIntent]) {
    return 3;
  }
  v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = INIntentSchemaGetIntentDescriptionWithFacadeClass(v6);
  v8 = [v7 type];

  return v8 != 0;
}

- (PBCodable)backingStore
{
  return self->_backingStore;
}

- (int64_t)_intentCategory
{
  v3 = [(INIntent *)self _metadata];
  int v4 = [v3 hasIntentCategory];
  v5 = [(INIntent *)self _metadata];
  int v6 = [v5 intentCategory];
  if (v4 && (v6 - 1) <= 0x14) {
    int64_t v7 = qword_18CFC4F88[v6 - 1];
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)_setMetadata:(id)a3
{
  id v5 = a3;
  if ([(INIntent *)self _type] == 2)
  {
    int v4 = [(INIntent *)self _inCodable];
    if ([v4 isValidKey:@"_metadata"]) {
      [v4 setValue:v5 forPropertyNamed:@"_metadata"];
    }
  }
  else
  {
    if ([(INIntent *)self _type] != 3) {
      goto LABEL_7;
    }
    int v4 = [(INIntent *)self _typedBackingStore];
    [v4 setMetadata:v5];
  }

LABEL_7:
}

- (void)_setIntentCategory:(int64_t)a3
{
  int v4 = [(INIntent *)self _metadata];
  if ((unint64_t)(a3 - 1) > 0x13) {
    uint64_t v5 = 0x7FFFFFFFLL;
  }
  else {
    uint64_t v5 = dword_18CFC4F38[a3 - 1];
  }
  id v6 = v4;
  [v4 setIntentCategory:v5];
}

- (void)_setCategoryVerb:(id)a3
{
  id v4 = a3;
  id v5 = [(INIntent *)self _metadata];
  [v5 setCategoryVerb:v4];
}

- (INIntent)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class()) {
    goto LABEL_9;
  }
  id v4 = objc_opt_class();
  if (![v4 isSubclassOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  id v5 = [(id)objc_opt_class() intentDescription];

  if (v5) {
    goto LABEL_9;
  }
  id v6 = (objc_class *)objc_opt_class();
  int64_t v7 = NSStringFromClass(v6);
  if (([(id)objc_opt_class() shouldSkipDefaultSchemaCheck] & 1) == 0)
  {
    if (+[INSchema _defaultSchemaCanSupportIntent:v7])
    {
      v8 = +[INSchema defaultSchema];
      v9 = [v8 intentWithName:v7];

      if (v9) {
        goto LABEL_8;
      }
    }
  }
  id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v11 = +[INSchema _defaultSchemaForBundle:v10];
  v9 = [v11 intentWithName:v7];

  if (v9)
  {
LABEL_8:
    id v12 = v9;

    self = v12;
LABEL_9:
    v13 = [MEMORY[0x1E4F29128] UUID];
    v14 = [v13 UUIDString];
    Class v15 = [(INIntent *)self initWithIdentifier:v14 backingStore:0];

    uint64_t v16 = [(INIntent *)v15 launchId];

    if (!v16)
    {
      v17 = INContainingBundleIdentifierForCurrentProcess();
      [(INIntent *)v15 _setLaunchId:v17];
    }
    self = v15;
    SEL v18 = self;
    goto LABEL_12;
  }
  v20 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    int v21 = 136315394;
    v22 = "-[INIntent init]";
    __int16 v23 = 2112;
    v24 = v7;
    _os_log_error_impl(&dword_18CB2F000, v20, OS_LOG_TYPE_ERROR, "%s Unable to initialize '%@'. Please make sure that your intent definition file is valid.", (uint8_t *)&v21, 0x16u);
  }

  SEL v18 = 0;
LABEL_12:

  return v18;
}

- (NSString)launchId
{
  v2 = [(INIntent *)self _metadata];
  uint64_t v3 = [v2 launchId];

  return (NSString *)v3;
}

- (void)_setLaunchId:(id)a3
{
  id v4 = a3;
  id v5 = [(INIntent *)self _metadata];
  [v5 setLaunchId:v4];
}

- (INIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)INIntent;
  id v7 = a4;
  id v15 = 0;
  id v8 = [[(INIntent *)&v16 init] _initWithIdentifier:v6 backingStore:v7 schema:0 error:&v15];

  id v9 = v15;
  id v10 = v8;
  id v11 = v10;
  if (v9)
  {
    id v12 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      SEL v18 = "-[INIntent initWithIdentifier:backingStore:]";
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_error_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_ERROR, "%s Failed to initialize intent with identifier %@ due to error %@", buf, 0x20u);
    }
    v13 = 0;
  }
  else
  {
    v13 = (INIntent *)v10;
  }

  return v13;
}

- (NSString)_categoryVerb
{
  if ([(INIntent *)self _intentCategory] == 10
    && (int64_t v3 = [(INIntent *)self _intents_toggleState]) != 0)
  {
    id v4 = @"Turn Off";
    if (v3 != 2) {
      id v4 = 0;
    }
    if (v3 == 1) {
      id v4 = @"Turn On";
    }
    id v5 = v4;
  }
  else
  {
    id v6 = [(INIntent *)self _metadata];
    id v7 = [v6 categoryVerb];
    if ([v7 length])
    {
      id v8 = [(INIntent *)self _metadata];
      id v5 = [v8 categoryVerb];
    }
    else
    {
      id v5 = @"Do";
    }
  }

  return (NSString *)v5;
}

- (id)_className
{
  int64_t v3 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(INIntent *)self backingStore];
    id v5 = [v4 _objectDescription];
    id v6 = [v5 className];
  }
  else
  {
    id v7 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v7);
  }

  return v6;
}

- (void)_setUserConfirmationRequired:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(INIntent *)self _metadata];
  [v4 setUserConfirmationRequired:v3];
}

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 0;
}

+ (id)intentDescription
{
  v2 = (objc_class *)objc_opt_class();

  return INIntentSchemaGetIntentDescriptionWithFacadeClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setDomain:(id)a3
{
  id v4 = a3;
  id v5 = [(INIntent *)self _typedBackingStore];
  [v5 setDomain:v4];
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  return INResolveInstanceMethod(a3, (objc_class *)a1);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
  {
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_init");
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
    id v7 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v6;

    uint64_t v8 = [(PBCodable *)self->_backingStore copy];
    id v9 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v8;

    objc_storeStrong((id *)(v5 + 40), self->_parameterCombinations);
    uint64_t v10 = [(NSString *)self->_recordRoute copyWithZone:a3];
    id v11 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v10;

    objc_storeStrong((id *)(v5 + 112), self->_recordDeviceUID);
    uint64_t v12 = [(NSString *)self->_recordDeviceIdentifier copyWithZone:a3];
    v13 = *(void **)(v5 + 120);
    *(void *)(v5 + 120) = v12;

    *(_DWORD *)(v5 + 36) = self->_audioSessionID;
    objc_storeStrong((id *)(v5 + 56), self->_parameterContexts);
    *(unsigned char *)(v5 + 32) = self->_shouldForwardToAppOnSucccess;
    *(void *)(v5 + 64) = self->_indexingHash;
    id v14 = [(INIntentDonationMetadata *)self->_donationMetadata copyWithZone:a3];
    id v15 = *(void **)(v5 + 88);
    *(void *)(v5 + 88) = v14;
  }
  return (id)v5;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)INIntent;
  return [(INIntent *)&v3 init];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_recordDeviceUID, 0);
  objc_storeStrong((id *)&self->_recordRoute, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_donationMetadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_keyParameter, 0);
  objc_storeStrong((id *)&self->_parameterContexts, 0);
  objc_storeStrong((id *)&self->_configurableParameterCombinations, 0);
  objc_storeStrong((id *)&self->_parameterCombinations, 0);
  objc_storeStrong((id *)&self->_parameterImages, 0);

  objc_storeStrong((id *)&self->_intentInstanceDescriptionMapping, 0);
}

- (id)_validParameterCombinationsWithSchema:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(INIntent *)self _className];
    uint64_t v6 = [v4 _parameterCombinationsForClassName:v5];
  }
  else
  {
    uint64_t v6 = [(INIntent *)self _parameterCombinations];
  }
  id v7 = [(INIntent *)self _nonNilParameters];
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v14, "isSubsetOfSet:", v7, (void)v17))
        {
          id v15 = [v9 objectForKey:v14];
          [v8 setObject:v15 forKey:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v8;
}

- (NSDictionary)_parameterCombinations
{
  parameterCombinations = self->_parameterCombinations;
  if (!parameterCombinations)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__INIntent__parameterCombinations__block_invoke;
    v7[3] = &unk_1E551C2E8;
    v7[4] = self;
    id v4 = [(INIntent *)self _querySchemaWithBlock:v7 contentOptions:8];
    uint64_t v5 = self->_parameterCombinations;
    self->_parameterCombinations = v4;

    parameterCombinations = self->_parameterCombinations;
  }

  return parameterCombinations;
}

- (id)_nonNilParameters
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(INIntent *)self backingStore];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(INIntent *)self backingStore];
    uint64_t v6 = [v5 _nonNilAttributes];
  }
  else
  {
    id v7 = [(id)objc_opt_class() intentDescription];
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v8 = objc_msgSend(v7, "slotDescriptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v14 = [v13 facadePropertyName];
          id v15 = [(INIntent *)self valueForKey:v14];

          if ((INObjectIsConsideredNil(v15, [v13 isEnum]) & 1) == 0)
          {
            objc_super v16 = [v13 facadePropertyName];
            [v6 addObject:v16];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }

  return v6;
}

- (void)_setExecutionContext:(int64_t)a3
{
  id v4 = [(INIntent *)self _metadata];
  id v6 = v4;
  if ((unint64_t)(a3 - 1) < 0xA) {
    uint64_t v5 = a3;
  }
  else {
    uint64_t v5 = 0x7FFFFFFFLL;
  }
  [v4 setExecutionContext:v5];
}

- (INIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)INIntent;
  uint64_t v5 = [(INIntent *)&v39 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(INIntent *)v5 setIdentifier:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backingStore"];
    [(INIntent *)v5 setBackingStore:v7];

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"parameterCombinations"];
    parameterCombinations = v5->_parameterCombinations;
    v5->_parameterCombinations = (NSDictionary *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordRoute"];
    [(INIntent *)v5 _setRecordRoute:v15];

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordDeviceUID"];
    recordDeviceUID = v5->_recordDeviceUID;
    v5->_recordDeviceUID = (NSUUID *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordDeviceIdentifier"];
    recordDeviceIdentifier = v5->_recordDeviceIdentifier;
    v5->_recordDeviceIdentifier = (NSString *)v18;

    v5->_audioSessionID = [v4 decodeInt32ForKey:@"audioSessionID"];
    v5->_shouldForwardToAppOnSucccess = [v4 decodeBoolForKey:@"_shouldForwardToAppOnSucccess"];
    v5->_indexingHash = [v4 decodeInt64ForKey:@"_indexingHash"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"donationMetadata"];
    donationMetadata = v5->_donationMetadata;
    v5->_donationMetadata = (INIntentDonationMetadata *)v20;

    uint64_t v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v22, "setWithObjects:", v23, v24, v25, v26, objc_opt_class(), 0);
    id v28 = [v4 decodeObjectOfClasses:v27 forKey:@"_parameterContexts"];

    id v29 = v28;
    if (v29)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v30 = v29;
      }
      else {
        v30 = 0;
      }
    }
    else
    {
      v30 = 0;
    }
    id v31 = v30;

    v32 = [v31 allKeys];

    uint64_t v33 = [v32 count];
    if (v33)
    {
      v34 = objc_alloc_init(INJSONDecoder);
      v35 = [(INIntent *)v5 _codableDescription];
      uint64_t v36 = +[INParameterContexts _intents_decodeWithJSONDecoder:v34 codableDescription:v35 from:v29];
      parameterContexts = v5->_parameterContexts;
      v5->_parameterContexts = (INParameterContexts *)v36;
    }
  }

  return v5;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setBackingStore:(id)a3
{
}

- (void)_setRecordRoute:(id)a3
{
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntent *)self _inCodable];
  id v6 = v5;
  if (v5 && [v5 isValidKey:v4])
  {
    uint64_t v7 = [v6 valueForPropertyNamed:v4];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)INIntent;
    uint64_t v7 = [(INIntent *)&v10 valueForKey:v4];
  }
  uint64_t v8 = (void *)v7;

  return v8;
}

- (BOOL)_hasTitle
{
  objc_super v3 = [(INIntent *)self _nonNilParameters];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(id)objc_opt_class() _ignoredParameters];
  [v4 minusSet:v5];

  id v6 = [(INIntent *)self _parameterCombinations];
  uint64_t v7 = [v6 objectForKey:v4];

  if (v7
    && ([v7 titleFormatString],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 length],
        v8,
        v9))
  {
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v11 = [(INIntent *)self backingStore];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [(INIntent *)self backingStore];
      uint64_t v13 = [v12 _objectDescription];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        BOOL v10 = 0;
        goto LABEL_10;
      }
      id v15 = [(INIntent *)self backingStore];
      uint64_t v11 = [v15 _objectDescription];

      uint64_t v16 = [v11 title];
      BOOL v10 = [v16 length] != 0;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
LABEL_10:

  return v10;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_intents_preferredScaledImageSize
{
  double v2 = 390.0;
  double v3 = 390.0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)_injectProxiesForParameterImages:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(INIntent *)self _parameterImages];
  uint64_t v9 = [v8 valueForKey:@"image"];
  BOOL v10 = (void *)[(INIntent *)self copy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__INIntent_INImageProxyInjecting___injectProxiesForParameterImages_completion___block_invoke;
  v13[3] = &unk_1E5515DE8;
  id v14 = v8;
  id v15 = v10;
  id v16 = v6;
  id v11 = v6;
  id v12 = v8;
  [v9 _injectProxiesForImages:v7 completion:v13];
}

- (NSArray)_parameterImages
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v3 = [(INIntent *)self _metadata];
  id v4 = [v3 parameterImages];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        BOOL v10 = [INParameterImage alloc];
        uint64_t v11 = objc_opt_class();
        id v12 = [v9 key];
        uint64_t v13 = +[INParameter parameterForClass:v11 keyPath:v12];
        id v14 = [v9 pairImageValues];
        id v15 = [v14 firstObject];
        id v16 = INIntentSlotValueTransformFromImageValue(v15);
        long long v17 = [(INParameterImage *)v10 initWithParameter:v13 image:v16];
        [v21 addObject:v17];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  uint64_t v18 = (void *)[v21 copy];

  return (NSArray *)v18;
}

- (NSString)suggestedInvocationPhrase
{
  double v2 = [(INIntent *)self _metadata];
  double v3 = [v2 suggestedInvocationPhrase];
  id v4 = objc_msgSend(v3, "_intents_decodeFromProto");

  return (NSString *)v4;
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  return 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(INIntent *)self _inCodable];
  uint64_t v9 = [(INIntent *)self _inCodable];

  if (v9)
  {
    if ([v8 isValidKey:v7])
    {
      [v8 setValue:v6 forPropertyNamed:v7];
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __37__INIntent_setValue_forUndefinedKey___block_invoke;
      v16[3] = &unk_1E551C3B0;
      v16[4] = self;
      BOOL v10 = [(INIntent *)self _querySchemaWithBlock:v16 contentOptions:31];
      [v8 _setObjectDescription:v10];
      if ([v8 isValidKey:v7])
      {
        [v8 setValue:v6 forPropertyNamed:v7];
      }
      else
      {
        uint64_t v11 = (void *)INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
        {
          id v12 = v11;
          uint64_t v13 = (objc_class *)objc_opt_class();
          id v14 = NSStringFromClass(v13);
          *(_DWORD *)buf = 136315650;
          uint64_t v18 = "-[INIntent setValue:forUndefinedKey:]";
          __int16 v19 = 2112;
          id v20 = v7;
          __int16 v21 = 2112;
          long long v22 = v14;
          _os_log_fault_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_FAULT, "%s '%@' is an invalid parameter for '%@'. Please make sure that your intent definition file is valid.", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)INIntent;
    [(INIntent *)&v15 setValue:v6 forUndefinedKey:v7];
  }
}

- (void)setSuggestedInvocationPhrase:(NSString *)suggestedInvocationPhrase
{
  id v4 = suggestedInvocationPhrase;
  id v6 = [(INIntent *)self _metadata];
  uint64_t v5 = [(NSString *)v4 _intents_encodeForProto];

  [v6 setSuggestedInvocationPhrase:v5];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)_validParameterCombinations
{
  return (NSDictionary *)[(INIntent *)self _validParameterCombinationsWithSchema:0];
}

- (void)_setParameterCombinations:(id)a3
{
}

- (int64_t)_preferredInteractionDirection
{
  return self->__preferredInteractionDirection;
}

+ (id)_ignoredParameters
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

+ (id)_sharedExtensionContextUUIDForIntentClassName:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    os_unfair_lock_lock((os_unfair_lock_t)&sharedContextExtensionUUIDDictionaryLock);
    id v4 = [(id)sharedContextExtensionUUIDDictionary objectForKeyedSubscript:v3];

    os_unfair_lock_unlock((os_unfair_lock_t)&sharedContextExtensionUUIDDictionaryLock);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (int64_t)triggerMethod
{
  id v3 = [(INIntent *)self _metadata];
  int v4 = [v3 hasTriggerMethod];
  uint64_t v5 = [(INIntent *)self _metadata];
  int v6 = [v5 triggerMethod];
  uint64_t v7 = 3;
  uint64_t v8 = 4;
  if (v6 != 30) {
    uint64_t v8 = 0;
  }
  if (v6 != 20) {
    uint64_t v7 = v8;
  }
  uint64_t v9 = 1;
  uint64_t v10 = 2;
  if (v6 != 10) {
    uint64_t v10 = 0;
  }
  if (v6) {
    uint64_t v9 = v10;
  }
  if (v6 <= 19) {
    uint64_t v7 = v9;
  }
  if (v4) {
    int64_t v11 = v7;
  }
  else {
    int64_t v11 = 0;
  }

  return v11;
}

- (void)_setExtensionBundleId:(id)a3
{
  id v4 = a3;
  id v5 = [(INIntent *)self _metadata];
  [v5 setSystemExtensionBundleId:v4];
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__INIntent_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
  v10[3] = &unk_1E5515E10;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(INIntent *)self _injectProxyForDefaultImage:v9 completion:v10];
}

- (void)_injectProxyForDefaultImage:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *, void *))a3;
  id v7 = a4;
  id v8 = [(INIntent *)self _defaultImage];
  if (v8)
  {
    id v9 = (void *)[(INIntent *)self copy];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__INIntent_INImageProxyInjecting___injectProxyForDefaultImage_completion___block_invoke;
    v10[3] = &unk_1E551E2D0;
    void v10[4] = v9;
    id v11 = v7;
    v6[2](v6, v8, v10);
  }
  else if (v7)
  {
    (*((void (**)(id, INIntent *))v7 + 2))(v7, self);
  }
}

void __70__INIntent_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__INIntent_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2;
  v5[3] = &unk_1E5515E10;
  id v6 = v4;
  id v7 = *(id *)(a1 + 40);
  [a2 _injectProxiesForParameterImages:v6 completion:v5];
}

- (INImage)_defaultImage
{
  id v3 = [(INIntent *)self _metadata];
  id v4 = [v3 defaultImageValue];

  if (v4)
  {
    id v5 = INIntentSlotValueTransformFromImageValue(v4);
  }
  else
  {
    id v6 = [(INIntent *)self _defaultImageName];
    if (v6)
    {
      id v5 = +[INImage imageNamed:v6];
      id v7 = +[INImage imageNamed:v6];
      [(INIntent *)self _setDefaultImage:v7];
    }
    else
    {
      id v5 = 0;
    }
  }
  id v8 = [(INIntent *)self extensionBundleId];
  if (v8)
  {
    [v5 _setBundleIdentifier:v8];
  }
  else
  {
    id v9 = [(INIntent *)self launchId];
    [v5 _setBundleIdentifier:v9];
  }

  return (INImage *)v5;
}

- (id)_defaultImageName
{
  id v3 = [(INIntent *)self _className];
  id v4 = [(INIntent *)self _inCodable];
  id v5 = [v4 _objectDescription];

  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __29__INIntent__defaultImageName__block_invoke;
    v8[3] = &unk_1E551C220;
    id v9 = v3;
    id v5 = [(INIntent *)self _querySchemaWithBlock:v8 contentOptions:31];
  }
  id v6 = [v5 defaultImageName];

  return v6;
}

void __79__INIntent_INImageProxyInjecting___injectProxiesForParameterImages_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __79__INIntent_INImageProxyInjecting___injectProxiesForParameterImages_completion___block_invoke_2;
  id v11 = &unk_1E5515DC0;
  id v6 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 32);
  [v4 enumerateObjectsUsingBlock:&v8];

  objc_msgSend(*(id *)(a1 + 40), "_setParameterImages:", v6, v8, v9, v10, v11);
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(a1 + 40));
  }
}

void __70__INIntent_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 backingStore];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (isKindOfClass) {
    [v7 _injectProxiesForImagesUsingCustomCodableStrategy:v5 completion:v6];
  }
  else {
    [v7 _injectProxiesForImagesUsingIntentSlotDescriptionStrategy:v5 completion:v6];
  }
}

- (void)_injectProxiesForImagesUsingCustomCodableStrategy:(id)a3 completion:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v29 = (void (**)(id, id, void *))a3;
  id v26 = a4;
  id v28 = (void *)[(INIntent *)self copy];
  group = dispatch_group_create();
  long long v25 = dispatch_queue_create("com.apple.intents.custom-codable-strategy-queue", MEMORY[0x1E4F14430]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v31 = self;
  uint64_t v6 = [(INIntent *)self _codableDescription];
  id v7 = [v6 attributes];

  id obj = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v43;
    do
    {
      uint64_t v11 = 0;
      uint64_t v30 = v9;
      do
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v42 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          id v14 = [v13 valueTransformer];
          objc_super v15 = (objc_class *)[(id)objc_opt_class() transformedValueClass];
          id v16 = NSStringFromSelector((SEL)[v13 getter]);
          long long v17 = [(INIntent *)v31 backingStore];
          uint64_t v18 = [v17 valueForKey:v16];

          if (v18)
          {
            uint64_t v19 = v10;
            id v20 = NSStringFromClass(v15);
            __int16 v21 = (objc_class *)objc_opt_class();
            long long v22 = NSStringFromClass(v21);
            int v23 = [v20 isEqualToString:v22];

            if (v23)
            {
              id v24 = v18;
              dispatch_group_enter(group);
              v38[0] = MEMORY[0x1E4F143A8];
              v38[1] = 3221225472;
              v38[2] = __96__INIntent_INImageProxyInjecting___injectProxiesForImagesUsingCustomCodableStrategy_completion___block_invoke;
              v38[3] = &unk_1E5515D98;
              objc_super v39 = group;
              v40 = v28;
              id v41 = v16;
              v29[2](v29, v24, v38);

              uint64_t v10 = v19;
              uint64_t v9 = v30;
            }
            else
            {
              uint64_t v10 = v19;
              uint64_t v9 = v30;
              if ([(objc_class *)v15 conformsToProtocol:&unk_1EDBB20D0])
              {
                dispatch_group_enter(group);
                v35[0] = MEMORY[0x1E4F143A8];
                v35[1] = 3221225472;
                v35[2] = __96__INIntent_INImageProxyInjecting___injectProxiesForImagesUsingCustomCodableStrategy_completion___block_invoke_2;
                v35[3] = &unk_1E5515E50;
                v35[4] = v28;
                id v36 = v16;
                v37 = group;
                [v18 _injectProxiesForImages:v29 completion:v35];
              }
            }
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v9);
  }

  if (v26)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__INIntent_INImageProxyInjecting___injectProxiesForImagesUsingCustomCodableStrategy_completion___block_invoke_3;
    block[3] = &unk_1E551F740;
    block[4] = v28;
    id v34 = v26;
    dispatch_group_notify(group, v25, block);
  }
}

- (INIntentCodableDescription)_codableDescription
{
  id v3 = [(INIntent *)self _inCodable];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 _objectDescription];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __31__INIntent__codableDescription__block_invoke;
    v10[3] = &unk_1E551C3B0;
    void v10[4] = self;
    uint64_t v5 = [(INIntent *)self _querySchemaWithBlock:v10 contentOptions:31];
  }
  id v6 = v5;
  id v7 = v6;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  uint64_t v8 = (INIntentCodableDescription *)v6;

  return v8;
}

- (void)_setParameterImages:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntent *)self _parameterImages];
  char v6 = [v5 isEqualToArray:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __32__INIntent__setParameterImages___block_invoke;
    v10[3] = &unk_1E551C2C0;
    id v11 = v7;
    id v8 = v7;
    [v4 enumerateObjectsUsingBlock:v10];
    uint64_t v9 = [(INIntent *)self _metadata];
    [v9 setParameterImages:v8];
  }
}

- (id)_initWithIdentifier:(id)a3 schema:(id)a4 name:(id)a5 data:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (NSString *)a5;
  id v13 = a6;
  id v14 = [v11 intentCodableDescriptionWithIntentClassName:v12];
  if (v14)
  {
    objc_super v15 = NSClassFromString(v12);
    id v16 = INIntentSchemaGetIntentDescriptionWithFacadeClass(v15);

    if (v16)
    {
      long long v17 = NSClassFromString(v12);
      uint64_t v18 = INIntentSchemaGetIntentDescriptionWithFacadeClass(v17);
      uint64_t v19 = (objc_class *)[v18 dataClass];
      if (v19) {
        id v20 = (INCodable *)[[v19 alloc] initWithData:v13];
      }
      else {
        id v20 = 0;
      }
      __int16 v21 = (INIntent *)[[v17 alloc] _initWithIdentifier:v10 backingStore:v20 schema:v11 error:0];
    }
    else
    {
      id v20 = [[INCodable alloc] initWithCodableDescription:v14 data:v13];
      uint64_t v23 = 0;
      self = (INIntent *)[(INIntent *)self _initWithIdentifier:v10 backingStore:v20 schema:v11 error:&v23];
      __int16 v21 = self;
    }
  }
  else
  {
    __int16 v21 = 0;
  }

  return v21;
}

- (id)_dictionaryRepresentation
{
  double v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 dictionaryRepresentation];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v3;
}

uint64_t __96__INIntent_INImageProxyInjecting___injectProxiesForImagesUsingCustomCodableStrategy_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __56__INIntent_makeFromWidgetPlistableRepresentation_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (a3 != 1)
  {
    if (a3) {
      goto LABEL_28;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
    id v8 = v7;
    if (![v8 count])
    {
      uint64_t v19 = [MEMORY[0x1E4F1CAD0] set];
      uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
      __int16 v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;

LABEL_25:
LABEL_26:
      if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        long long v22 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to decode parameter combination key (expected NSSet<NSString *> *, but received: %@"), v7;
        uint64_t v23 = INIntentError(8001, v22, 0);
        uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
        long long v25 = *(void **)(v24 + 40);
        *(void *)(v24 + 40) = v23;
      }
      goto LABEL_28;
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      int v13 = 1;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_opt_class();
          v13 &= objc_opt_isKindOfClass();
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);

      if ((v13 & 1) == 0)
      {
        int v15 = 0;
        id v16 = 0;
        goto LABEL_23;
      }
    }
    else
    {
    }
    id v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    int v15 = 1;
LABEL_23:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v16);
    if (v15) {

    }
    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v17 + 40);
    uint64_t v18 = +[INParameterCombination makeFromWidgetPlistableRepresentation:v7 error:&obj];
    objc_storeStrong((id *)(v17 + 40), obj);
    if (v18 && *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v18);
    }
  }
  *a4 = 1;
LABEL_28:
}

- (void)_setUiExtensionBundleId:(id)a3
{
  id v4 = a3;
  id v5 = [(INIntent *)self _metadata];
  [v5 setSystemUIExtensionBundleId:v4];
}

- (void)_setParametersForcedToNeedsValue:(id)a3
{
  id v4 = a3;
  id v5 = [(INIntent *)self _metadata];
  [v5 setForceNeedsValueForParameters:v4];
}

- (void)_setOriginatingDeviceRapportMediaSystemIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INIntent *)self _metadata];
  [v5 setOriginatingDeviceRapportMediaSystemId:v4];
}

- (NSString)_nanoLaunchId
{
  double v2 = [(INIntent *)self _metadata];
  id v3 = [v2 nanoLaunchId];

  return (NSString *)v3;
}

- (void)_injectProxiesForImagesUsingIntentSlotDescriptionStrategy:(id)a3 completion:(id)a4
{
}

void __79__INIntent_INImageProxyInjecting___injectProxiesForParameterImages_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [INParameterImage alloc];
  id v10 = [*(id *)(a1 + 40) objectAtIndex:a3];
  id v8 = [v10 parameter];
  id v9 = [(INParameterImage *)v7 initWithParameter:v8 image:v6];

  [v5 addObject:v9];
}

uint64_t __74__INIntent_INImageProxyInjecting___injectProxyForDefaultImage_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _setDefaultImage:a2];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __96__INIntent_INImageProxyInjecting___injectProxiesForImagesUsingCustomCodableStrategy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  if (v4)
  {
    id v3 = [*(id *)(a1 + 40) backingStore];
    [v3 setValue:v4 forKey:*(void *)(a1 + 48)];
  }
}

void __96__INIntent_INImageProxyInjecting___injectProxiesForImagesUsingCustomCodableStrategy_completion___block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 backingStore];
  [v5 setValue:v4 forKey:a1[5]];

  id v6 = a1[6];

  dispatch_group_leave(v6);
}

- (void)_intents_allowAppToInitiatePlaybackForBundleIdentifier:(id)a3 context:(unint64_t)a4 error:(id *)a5
{
  if (!a4)
  {
    v13[7] = v5;
    v13[8] = v6;
    id v8 = a3;
    id v9 = [getAVSystemControllerClass() sharedAVSystemController];
    id v10 = getAVSystemController_AllowAppToInitiatePlaybackTemporarilyAttribute();
    v13[0] = 0;
    char v11 = [v9 setAttribute:v8 forKey:v10 error:v13];

    id v12 = v13[0];
    if ((v11 & 1) == 0) {
      *a5 = v12;
    }
  }
}

- (id)_intents_backgroundHandlingAssertionForBundleIdentifier:(id)a3 context:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if ([(INIntent *)self _type] == 2) {
    [(INIntent *)self _intents_allowAppToInitiatePlaybackForBundleIdentifier:v8 context:a4 error:a5];
  }
  id v9 = (void *)[MEMORY[0x1E4F1E5E8] newAssertionForBundleIdentifier:v8 withReason:@"User is directly engaging with the app in Siri" level:1];

  return v9;
}

- (int64_t)_intents_toggleState
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [(INIntent *)self _intentInstanceDescription];
  id v4 = [v3 slotDescriptions];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 valueType] == 204)
        {
          char v11 = [v9 name];
          id v12 = [(INIntent *)self valueForKey:v11];

          int64_t v10 = [v12 integerValue];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  int64_t v10 = 0;
LABEL_11:

  return v10;
}

- (id)localizeValueOfSlotDescription:(id)a3 withLocalizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 facadePropertyName];
  id v9 = [(INIntent *)self valueForKey:v8];
  int64_t v10 = [v7 localizeValue:v9 withLocalizer:v6];

  return v10;
}

- (id)intentSlotDescriptions
{
  double v2 = (objc_class *)objc_opt_class();
  id v3 = INIntentSchemaGetIntentDescriptionWithFacadeClass(v2);
  id v4 = [v3 slotDescriptions];

  return v4;
}

- (id)_localizedCombinationStringForKey:(id)a3 value:(id)a4 localizationTable:(id)a5 bundleURL:(id)a6 localizer:(id)a7
{
  id v12 = a3;
  id v42 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [v13 bundleIdentifier];
  if (!v16) {
    goto LABEL_6;
  }
  long long v17 = (void *)v16;
  uint64_t v18 = [(INIntent *)self extensionBundleId];
  uint64_t v19 = [v13 bundleIdentifier];
  if ([v18 containsString:v19])
  {
    id v20 = [(INIntent *)self extensionBundleId];
  }
  else
  {
    id v20 = 0;
  }

  if (!v20)
  {
LABEL_6:
    __int16 v21 = [(INIntent *)self _intents_launchIdForCurrentPlatform];
    id v45 = 0;
    INExtractAppInfoFromSiriLaunchId(v21, &v45, 0);
    id v20 = v45;
  }
  if ([v15 bundleWithIdentifier:0 fileURL:v14])
  {
    if (v14) {
      goto LABEL_16;
    }
  }
  else
  {
    [v15 bundleWithIdentifier:v20 fileURL:0];
    if (v14) {
      goto LABEL_16;
    }
  }
  long long v22 = [v15 languageCode];

  if (!v22 && v20)
  {
    id v23 = _INVCIntentDefinitionManagerClass();
    if (objc_opt_respondsToSelector())
    {
      id v14 = [v23 intentDefinitionBundleURLForBundleID:v20];
    }
    else
    {
      id v14 = 0;
    }
  }
LABEL_16:
  uint64_t v24 = (__CFBundle *)[v15 bundleWithIdentifier:v20 fileURL:v14];
  long long v25 = [v15 languageCode];
  v40 = v13;
  id v26 = [v13 tableName];
  id v41 = v12;
  if ([(INIntent *)self _type] == 2)
  {
    int v27 = [v20 hasPrefix:@"com.apple."];
    long long v28 = [(INIntent *)self backingStore];
    long long v44 = v25;
    long long v29 = INLocalizedFormatStringFromCodable(v12, v42, v26, v24, v15, v28, 0, &v44, v27);
    long long v30 = v44;

    if (!v29)
    {
      id v36 = 0;
      uint64_t v33 = v42;
      goto LABEL_30;
    }
    id v31 = [v15 languageCode];
    if ([v31 isEqualToString:v30])
    {
      id v32 = v15;
    }
    else
    {
      id v32 = +[INStringLocalizer localizerForLanguage:v30];
    }
    v37 = v32;

    v38 = [(INIntent *)self backingStore];
    id v36 = INReplaceVariablesInFormatStringFromCodable(v29, v37, v38, 0, v27);

    uint64_t v33 = v42;
  }
  else
  {
    long long v43 = v25;
    uint64_t v33 = v42;
    long long v29 = INLocalizedFormatStringFromSlotComposing(v12, v42, v26, v24, v15, self, MEMORY[0x1E4F1CC08], &v43);
    long long v30 = v43;

    if (!v29)
    {
      id v36 = 0;
      goto LABEL_30;
    }
    id v34 = [v15 languageCode];
    if ([v34 isEqualToString:v30])
    {
      id v35 = v15;
    }
    else
    {
      id v35 = +[INStringLocalizer localizerForLanguage:v30];
    }
    v37 = v35;

    id v36 = INReplaceVariablesInFormatStringFromSlotComposing(v29, v37, self);
  }

LABEL_30:

  return v36;
}

- (NSString)_localizedVerb
{
  double v2 = [(INIntent *)self _categoryVerb];
  id v3 = INLocalizedStringWithLocalizer(v2, 0, 0);

  return (NSString *)v3;
}

- (id)_subtitleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(INIntent *)self _nonNilParameters];
  id v9 = (void *)[v8 mutableCopy];

  int64_t v10 = [(id)objc_opt_class() _ignoredParameters];
  [v9 minusSet:v10];

  char v11 = [(INIntent *)self _parameterCombinations];
  id v12 = [v11 objectForKey:v9];

  if (!v12)
  {
    uint64_t v16 = 0;
    goto LABEL_17;
  }
  if ([(INIntent *)self _type] == 2)
  {
    id v13 = [v12 subtitleFormatStringLocID];
    id v14 = [v12 subtitleFormatString];
    id v15 = [v12 _localizationTable];
    uint64_t v16 = [(INIntent *)self _localizedCombinationStringForKey:v13 value:v14 localizationTable:v15 bundleURL:v7 localizer:v6];

    goto LABEL_17;
  }
  long long v17 = [(INIntent *)self _intents_launchIdForCurrentPlatform];
  id v50 = 0;
  INExtractAppInfoFromSiriLaunchId(v17, &v50, 0);
  id v18 = v50;

  uint64_t v19 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v18];
  v48 = v19;
  if (v19)
  {
    id v20 = (void *)MEMORY[0x1E4F1CAD0];
    __int16 v21 = [v19 siriActionDefinitionURLs];
    long long v22 = [v21 allKeys];
    id v23 = [v20 setWithArray:v22];

LABEL_9:
    goto LABEL_10;
  }
  if (v18)
  {
    __int16 v21 = [_INVCIntentDefinitionManagerClass() appInfoForBundleID:v18];
    id v23 = [v21 definedIntents];
    goto LABEL_9;
  }
  id v23 = 0;
LABEL_10:
  uint64_t v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  long long v25 = (objc_class *)objc_opt_class();
  id v26 = NSStringFromClass(v25);
  uint64_t v47 = v23;
  int v27 = [v23 containsObject:v26];

  v49 = (void *)v24;
  if (!v27)
  {
    id v31 = [v12 subtitleFormatStringLocID];
    id v34 = [v12 subtitleFormatString];
    uint64_t v38 = [v12 _localizationTable];
    objc_super v39 = (void *)v24;
    id v35 = (void *)v38;
    id v36 = [v39 bundleURL];
    v40 = self;
    id v41 = v31;
    id v42 = v34;
    long long v43 = v35;
    id v44 = v36;
LABEL_15:
    uint64_t v16 = [(INIntent *)v40 _localizedCombinationStringForKey:v41 value:v42 localizationTable:v43 bundleURL:v44 localizer:v6];
    goto LABEL_16;
  }
  long long v28 = +[INSchema _defaultSchemaForBundle:v24];
  long long v29 = [(INIntent *)self _className];
  long long v30 = [v28 _parameterCombinationsForClassName:v29];
  id v31 = [v30 objectForKey:v9];

  id v32 = [v31 subtitleFormatString];
  uint64_t v33 = [v12 subtitleFormatString];
  LODWORD(v30) = [v32 isEqualToString:v33];

  if (!v30)
  {
    id v34 = [v12 subtitleFormatStringLocID];
    id v35 = [v12 subtitleFormatString];
    id v36 = [v12 _localizationTable];
    v40 = self;
    id v41 = v34;
    id v42 = v35;
    long long v43 = v36;
    id v44 = v7;
    goto LABEL_15;
  }
  id v34 = [v31 subtitleFormatStringLocID];
  id v35 = [v31 subtitleFormatString];
  id v36 = [v31 _localizationTable];
  [v49 bundleURL];
  v37 = id v46 = v18;
  uint64_t v16 = [(INIntent *)self _localizedCombinationStringForKey:v34 value:v35 localizationTable:v36 bundleURL:v37 localizer:v6];

  id v18 = v46;
LABEL_16:

LABEL_17:

  return v16;
}

- (id)_subtitleForLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[INIntentSummaryCache sharedCache];
  id v13 = 0;
  char v6 = [v5 getSubtitle:&v13 forIntent:self languageCode:v4];
  id v7 = v13;

  if ((v6 & 1) == 0)
  {
    id v8 = +[INStringLocalizer localizerForLanguage:v4];
    uint64_t v9 = [(INIntent *)self _subtitleWithLocalizer:v8 fromBundleURL:0];

    int64_t v10 = +[INIntentSummaryCache sharedCache];
    [v10 setSubtitle:v9 forIntent:self languageCode:v4];

    id v7 = (id)v9;
  }
  id v11 = v7;

  return v11;
}

- (NSString)_subtitle
{
  return (NSString *)[(INIntent *)self _subtitleForLanguage:0];
}

- (id)_titleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(INIntent *)self _nonNilParameters];
  uint64_t v9 = (void *)[v8 mutableCopy];

  int64_t v10 = [(id)objc_opt_class() _ignoredParameters];
  [v9 minusSet:v10];

  id v11 = [(INIntent *)self _parameterCombinations];
  id v12 = [v11 objectForKey:v9];

  if (!v12)
  {
    uint64_t v16 = 0;
    goto LABEL_17;
  }
  if ([(INIntent *)self _type] == 2)
  {
    id v13 = [v12 titleFormatStringLocID];
    id v14 = [v12 titleFormatString];
    id v15 = [v12 _localizationTable];
    uint64_t v16 = [(INIntent *)self _localizedCombinationStringForKey:v13 value:v14 localizationTable:v15 bundleURL:v7 localizer:v6];

    goto LABEL_17;
  }
  long long v17 = [(INIntent *)self _intents_launchIdForCurrentPlatform];
  id v71 = 0;
  INExtractAppInfoFromSiriLaunchId(v17, &v71, 0);
  id v18 = v71;

  uint64_t v19 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v18];
  v66 = v19;
  v67 = v18;
  if (v19)
  {
    id v20 = (void *)MEMORY[0x1E4F1CAD0];
    __int16 v21 = [v19 siriActionDefinitionURLs];
    long long v22 = [v21 allKeys];
    id v23 = [v20 setWithArray:v22];

LABEL_9:
    goto LABEL_10;
  }
  if (v18)
  {
    __int16 v21 = [_INVCIntentDefinitionManagerClass() appInfoForBundleID:v18];
    id v23 = [v21 definedIntents];
    goto LABEL_9;
  }
  id v23 = 0;
LABEL_10:
  uint64_t v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  long long v25 = (objc_class *)objc_opt_class();
  id v26 = NSStringFromClass(v25);
  int v27 = [v23 containsObject:v26];

  v65 = v23;
  v68 = v24;
  if (!v27)
  {
    id v31 = [v12 titleFormatStringLocID];
    id v34 = [v12 titleFormatString];
    id v35 = [v12 _localizationTable];
    id v36 = [v24 bundleURL];
    objc_super v39 = self;
    v40 = v31;
    id v41 = v34;
    id v42 = v35;
    id v43 = v36;
LABEL_15:
    uint64_t v16 = [(INIntent *)v39 _localizedCombinationStringForKey:v40 value:v41 localizationTable:v42 bundleURL:v43 localizer:v6];
    goto LABEL_16;
  }
  long long v28 = +[INSchema _defaultSchemaForBundle:v24];
  long long v29 = [(INIntent *)self _className];
  long long v30 = [v28 _parameterCombinationsForClassName:v29];
  id v31 = [v30 objectForKey:v9];

  id v32 = [v31 titleFormatString];
  uint64_t v33 = [v12 titleFormatString];
  LODWORD(v30) = [v32 isEqualToString:v33];

  if (!v30)
  {
    id v34 = [v12 titleFormatStringLocID];
    id v35 = [v12 titleFormatString];
    id v36 = [v12 _localizationTable];
    objc_super v39 = self;
    v40 = v34;
    id v41 = v35;
    id v42 = v36;
    id v43 = v7;
    goto LABEL_15;
  }
  id v34 = [v31 titleFormatStringLocID];
  id v35 = [v31 titleFormatString];
  id v36 = [v31 _localizationTable];
  [v68 bundleURL];
  id v63 = v7;
  uint64_t v38 = v37 = v6;
  uint64_t v16 = [(INIntent *)self _localizedCombinationStringForKey:v34 value:v35 localizationTable:v36 bundleURL:v38 localizer:v37];

  id v6 = v37;
  id v7 = v63;
LABEL_16:

LABEL_17:
  if ([v16 length]) {
    goto LABEL_34;
  }
  id v44 = [(INIntent *)self backingStore];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_33;
  }
  id v45 = v6;
  id v46 = [(INIntent *)self backingStore];
  uint64_t v47 = [v46 _objectDescription];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v6 = v45;
    goto LABEL_34;
  }
  v49 = [(INIntent *)self backingStore];
  id v44 = [v49 _objectDescription];

  id v50 = [v44 title];

  v51 = [(INIntent *)self _intents_launchIdForCurrentPlatform];
  id v70 = 0;
  INExtractAppInfoFromSiriLaunchId(v51, &v70, 0);
  id v52 = v70;

  if (v52)
  {
    id v6 = v45;
    uint64_t v53 = [v45 bundleWithIdentifier:v52 fileURL:0];
    if (v53)
    {
      uint64_t v54 = v53;
      v69 = v50;
      id v64 = v7;
      v55 = [v44 titleLocID];
      v56 = [v44 titleLocID];
      v57 = [v44 _localizationTable];
      v58 = [v57 tableName];
      v59 = INLocalizedStringFromBundle(v55, v56, v58, v45, v54, 0);

      if ([v59 length])
      {
        v60 = [v44 titleLocID];
        char v61 = [v60 isEqualToString:v59];

        id v7 = v64;
        if ((v61 & 1) == 0)
        {
          id v50 = v59;

          id v6 = v45;
          goto LABEL_31;
        }
        id v6 = v45;
      }
      else
      {
        id v6 = v45;
        id v7 = v64;
      }
      id v50 = v69;
LABEL_31:
    }
  }
  else
  {
    id v6 = v45;
  }

  uint64_t v16 = v50;
LABEL_33:

LABEL_34:

  return v16;
}

- (id)_titleForLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[INIntentSummaryCache sharedCache];
  id v13 = 0;
  char v6 = [v5 getTitle:&v13 forIntent:self languageCode:v4];
  id v7 = v13;

  if ((v6 & 1) == 0)
  {
    id v8 = +[INStringLocalizer localizerForLanguage:v4];
    uint64_t v9 = [(INIntent *)self _titleWithLocalizer:v8 fromBundleURL:0];

    int64_t v10 = +[INIntentSummaryCache sharedCache];
    [v10 setTitle:v9 forIntent:self languageCode:v4];

    id v7 = (id)v9;
  }
  id v11 = v7;

  return v11;
}

- (NSString)_title
{
  return (NSString *)[(INIntent *)self _titleForLanguage:0];
}

- (id)_intents_bundleIdForDisplay
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(INIntent *)self _intents_bestBundleIdentifier];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      uint64_t v4 = [(INIntent *)self preferredCallProvider];
    }
    else {
      uint64_t v4 = 0;
    }
    char v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = v3;
    id v9 = v7;
    if (_INSpecialCaseDisplayableBundleIdentifier_onceToken != -1) {
      dispatch_once(&_INSpecialCaseDisplayableBundleIdentifier_onceToken, &__block_literal_global_10);
    }
    int64_t v10 = [(id)_INSpecialCaseDisplayableBundleIdentifier_overrides objectForKeyedSubscript:v8];
    id v11 = [v10 objectForKeyedSubscript:v9];

    if ([v11 count])
    {
      uint64_t v20 = 0;
      __int16 v21 = &v20;
      uint64_t v22 = 0x3032000000;
      id v23 = __Block_byref_object_copy__37058;
      uint64_t v24 = __Block_byref_object_dispose__37059;
      id v25 = 0;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = ___INSpecialCaseDisplayableBundleIdentifier_block_invoke_24;
      v19[3] = &unk_1E55188A8;
      v19[4] = &v20;
      [v11 enumerateObjectsUsingBlock:v19];
      int v12 = [(id)v21[5] isEqualToString:@"com.apple.mobilephone"] ^ 1;
      if (v4 != 2) {
        LOBYTE(v12) = 1;
      }
      if ((v12 & 1) == 0)
      {
        id v13 = (void *)v21[5];
        v21[5] = @"com.apple.facetime";
      }
      id v14 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = v21[5];
        *(_DWORD *)buf = 136315394;
        int v27 = "_INSpecialCaseDisplayableBundleIdentifier";
        __int16 v28 = 2114;
        uint64_t v29 = v15;
        _os_log_impl(&dword_18CB2F000, v14, OS_LOG_TYPE_INFO, "%s Choosing displayableApplicationBundleIdentifier=%{public}@, from displayableBundleIdentifierOverrides", buf, 0x16u);
      }
      id v16 = (id)v21[5];
      _Block_object_dispose(&v20, 8);
    }
    else
    {
      id v16 = 0;
    }

    if (v16)
    {
      id v17 = v16;
    }
    else
    {
      INLocalAppBundleIdentifierForIntentBundleIdentifier(v8);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v5 = v17;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_intents_bundleIdForLaunching
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v2 = [(INIntent *)self _intents_bestBundleIdentifier];
  if (v2)
  {
    id v3 = (objc_class *)objc_opt_class();
    uint64_t v4 = NSStringFromClass(v3);
    id v5 = v2;
    id v6 = v4;
    if (_INSpecialCaseLaunchableBundleIdentifier_onceToken != -1) {
      dispatch_once(&_INSpecialCaseLaunchableBundleIdentifier_onceToken, &__block_literal_global_37080);
    }
    id v7 = [(id)_INSpecialCaseLaunchableBundleIdentifier_overrides objectForKeyedSubscript:v5];
    id v8 = [v7 objectForKeyedSubscript:v6];

    if (v8)
    {
      id v9 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        int v13 = 136315394;
        id v14 = "_INSpecialCaseLaunchableBundleIdentifier";
        __int16 v15 = 2114;
        id v16 = v8;
        _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s Choosing launchableApplicationBundleIdentifier=%{public}@, from launchableBundleIdentifierOverrides", (uint8_t *)&v13, 0x16u);
      }

      id v10 = v8;
    }
    else
    {

      INLocalAppBundleIdentifierForIntentBundleIdentifier(v5);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_intents_bestBundleIdentifier
{
  id v3 = [(INIntent *)self _intents_launchIdForCurrentPlatform];
  id v10 = 0;
  INExtractAppInfoFromSiriLaunchId(v3, &v10, 0);
  id v4 = v10;

  if (!v4)
  {
    id v5 = [(INIntent *)self extensionBundleId];
    id v6 = INAppProxyForAppOrContainedPluginWithBundleIdentifier((uint64_t)v5);
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 bundleIdentifier];
    }
    else
    {
      id v8 = v5;
    }
    id v4 = v8;
  }

  return v4;
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  return INKeyImageUtilitiesDefaultCompareSubProducers(a3, a4);
}

- (INImage)_keyImage
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [(INIntent *)self _sortedParameterImages];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v4)
  {

LABEL_14:
    if ([(INIntent *)self _type] != 1
      || ([(INIntent *)self _keyImageWithIntentDescriptionStrategy],
          (id v6 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v6 = [(INIntent *)self _defaultImage];
    }
    goto LABEL_17;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  uint64_t v7 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v3);
      }
      id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      id v10 = [v9 image];
      if (v10)
      {
        id v11 = [v9 parameter];
        int v12 = [v11 _parameterValueForParameterizedObject:self];

        if (v12)
        {
          id v13 = v10;

          id v6 = v13;
        }
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v5);

  if (!v6) {
    goto LABEL_14;
  }
LABEL_17:

  return (INImage *)v6;
}

- (id)_keyImageWithIntentDescriptionStrategy
{
  id v3 = INKeyImageUtilitiesSortedSubProducersForSlotComposingProducer(self);
  uint64_t v4 = [v3 firstObject];

  uint64_t v5 = [v4 valueForSlotComposer:self];
  if ([v5 conformsToProtocol:&unk_1EDBB1E40])
  {
    id v6 = [v5 _keyImage];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (void)_setSharedExtensionContextUUID:(id)a3 forIntentClassName:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    os_unfair_lock_lock((os_unfair_lock_t)&sharedContextExtensionUUIDDictionaryLock);
    uint64_t v7 = (void *)sharedContextExtensionUUIDDictionary;
    if (!sharedContextExtensionUUIDDictionary)
    {
      sharedContextExtensionUUIDDictionary = MEMORY[0x1E4F1CC08];
      uint64_t v7 = (void *)MEMORY[0x1E4F1CC08];
    }
    id v10 = (id)[v7 mutableCopy];
    [v10 setObject:v6 forKeyedSubscript:v5];

    uint64_t v8 = [v10 copy];
    id v9 = (void *)sharedContextExtensionUUIDDictionary;
    sharedContextExtensionUUIDDictionary = v8;

    os_unfair_lock_unlock((os_unfair_lock_t)&sharedContextExtensionUUIDDictionaryLock);
  }
}

- (void)_setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)_setRecordDeviceIdentifier:(id)a3
{
}

- (NSString)recordDeviceIdentifier
{
  return self->_recordDeviceIdentifier;
}

- (void)_setRecordDeviceUID:(id)a3
{
}

- (NSUUID)recordDeviceUID
{
  return self->_recordDeviceUID;
}

- (NSString)recordRoute
{
  return self->_recordRoute;
}

- (INIntentDonationMetadata)donationMetadata
{
  return self->_donationMetadata;
}

- (void)_setShouldForwardToAppOnSuccess:(BOOL)a3
{
  self->_shouldForwardToAppOnSucccess = a3;
}

- (BOOL)_shouldForwardToAppOnSucccess
{
  return self->_shouldForwardToAppOnSucccess;
}

- (void)_setParameterContexts:(id)a3
{
}

- (INParameterContexts)_parameterContexts
{
  return self->_parameterContexts;
}

- (void)_setConfigurableParameterCombinations:(id)a3
{
}

- (id)_spotlightContentType
{
  double v2 = @"com.apple.siri.interaction";
  return @"com.apple.siri.interaction";
}

- (BOOL)configureAttributeSet:(id)a3 includingData:(BOOL)a4
{
  BOOL v46 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 displayName];

  if (!v6)
  {
    uint64_t v7 = [(INIntent *)self _title];
    [v5 setDisplayName:v7];
  }
  uint64_t v8 = [v5 contentDescription];

  if (!v8)
  {
    id v9 = [(INIntent *)self _subtitle];
    [v5 setContentDescription:v9];
  }
  id v10 = NSString;
  uint64_t v11 = [(INIntent *)self launchId];
  int v12 = (void *)v11;
  if (v11) {
    id v13 = (__CFString *)v11;
  }
  else {
    id v13 = @"no-launchId";
  }
  uint64_t v14 = [(INIntent *)self extensionBundleId];
  long long v15 = (void *)v14;
  if (v14) {
    long long v16 = (__CFString *)v14;
  }
  else {
    long long v16 = @"no-extensionBundleId";
  }
  long long v17 = [v5 displayName];
  uint64_t v18 = [v17 length];
  if (v18)
  {
    [v5 displayName];
  }
  else
  {
    id v45 = [MEMORY[0x1E4F29128] UUID];
    [v45 UUIDString];
  uint64_t v19 = };
  uint64_t v20 = [v10 stringWithFormat:@"%@-%@-%@", v13, v16, v19];
  [v5 setUniqueIdentifier:v20];

  if (!v18)
  {

    uint64_t v19 = v45;
  }

  __int16 v21 = [(INIntent *)self _spotlightContentType];
  [v5 setContentType:v21];

  uint64_t v22 = [(INIntent *)self _className];
  [v5 setAttribute:v22 forKey:@"_kMDItemIntentClass"];

  id v23 = objc_msgSend(NSNumber, "numberWithBool:", -[INIntent _supportsBackgroundExecutionWithOptions:](self, "_supportsBackgroundExecutionWithOptions:", 0));
  [v5 setBackgroundRunnable:v23];

  uint64_t v24 = [(INIntent *)self _categoryVerb];
  id v25 = [(INIntent *)self _categoryVerb];
  id v26 = INCSLocalizedString(v24, v25);
  [v5 setPunchoutLabel:v26];

  int v27 = [v5 thumbnailData];
  if (v27)
  {
  }
  else
  {
    __int16 v28 = [v5 thumbnailURL];

    if (!v28)
    {
      uint64_t v29 = [(INIntent *)self keyImage];
      uint64_t v30 = v29;
      if (v29)
      {
        id v31 = [v29 _uri];
        int v32 = [v31 isFileURL];

        if (v32)
        {
          uint64_t v33 = [v30 _uri];
          [v5 setThumbnailURL:v33];
        }
        else
        {
          id v34 = [v30 _imageData];
          if (![v34 length])
          {
            id v35 = +[INImageServiceConnection sharedConnection];
            id v48 = 0;
            id v36 = objc_msgSend(v35, "loadDataImageFromImage:scaledSize:error:", v30, &v48, 0.0, 0.0);
            id v37 = v48;
            uint64_t v38 = [v36 _imageData];

            if (v37)
            {
              objc_super v39 = INSiriLogContextIntents;
              if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                id v50 = "-[INIntent configureAttributeSet:includingData:]";
                __int16 v51 = 2112;
                id v52 = v30;
                __int16 v53 = 2112;
                id v54 = v37;
                _os_log_error_impl(&dword_18CB2F000, v39, OS_LOG_TYPE_ERROR, "%s Failed to load image data for %@ for indexing: %@", buf, 0x20u);
              }
            }

            id v34 = (void *)v38;
          }
          if ([v34 length]) {
            [v5 setThumbnailData:v34];
          }
        }
      }
    }
  }
  if (v46)
  {
    id v47 = 0;
    v40 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v47];
    id v41 = v47;
    BOOL v42 = v40 != 0;
    if (v40)
    {
      [v5 setAttribute:v40 forKey:@"_kMDItemUserActivityData"];
    }
    else
    {
      id v43 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v50 = "-[INIntent configureAttributeSet:includingData:]";
        __int16 v51 = 2112;
        id v52 = v41;
        _os_log_error_impl(&dword_18CB2F000, v43, OS_LOG_TYPE_ERROR, "%s Failed to encode intent into attribute set: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    BOOL v42 = 1;
  }

  return v42;
}

id __37__INIntent_setValue_forUndefinedKey___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 _className];
  id v5 = [v3 intentCodableDescriptionWithIntentClassName:v4];

  return v5;
}

- (id)valueForUndefinedKey:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(INIntent *)self _inCodable];
  id v6 = v5;
  if (!v5)
  {
    v16.receiver = self;
    v16.super_class = (Class)INIntent;
    uint64_t v8 = [(INIntent *)&v16 valueForUndefinedKey:v4];
    goto LABEL_7;
  }
  if ([v5 isValidKey:v4])
  {
LABEL_5:
    uint64_t v8 = [v6 valueForPropertyNamed:v4];
LABEL_7:
    id v9 = (void *)v8;
    goto LABEL_8;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __33__INIntent_valueForUndefinedKey___block_invoke;
  v15[3] = &unk_1E551C3B0;
  v15[4] = self;
  uint64_t v7 = [(INIntent *)self _querySchemaWithBlock:v15 contentOptions:31];
  [v6 _setObjectDescription:v7];
  if ([v6 isValidKey:v4])
  {

    goto LABEL_5;
  }
  uint64_t v11 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
  {
    int v12 = v11;
    id v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 136315650;
    uint64_t v18 = "-[INIntent valueForUndefinedKey:]";
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2112;
    uint64_t v22 = v14;
    _os_log_fault_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_FAULT, "%s '%@' is an invalid parameter for '%@'. Please make sure that your intent definition file is valid.", buf, 0x20u);
  }
  id v9 = 0;
LABEL_8:

  return v9;
}

id __33__INIntent_valueForUndefinedKey___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _className];
  id v5 = [v3 intentCodableDescriptionWithIntentClassName:v4];

  return v5;
}

- (BOOL)_isValueValidForKey:(id)a3 unsupportedReason:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  if ([(INIntent *)self _isValidKey:v6])
  {
    uint64_t v7 = [(INIntent *)self valueForKey:v6];
    if (v7)
    {
      uint64_t v8 = [(INIntent *)self _codableDescription];
      id v9 = [v8 attributeByName:v6];

      id v10 = [v9 unsupportedReasons];
      uint64_t v11 = [v10 count];

      if (v11)
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        int v12 = [v9 unsupportedReasons];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          id v27 = v6;
          uint64_t v15 = *(void *)v29;
          while (2)
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v29 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              uint64_t v18 = [v17 predicateFormat];
              uint64_t v19 = [v18 length];

              if (v19)
              {
                id v20 = (void *)MEMORY[0x1E4F28F60];
                __int16 v21 = [v17 predicateFormat];
                uint64_t v22 = objc_msgSend(v20, "predicateWithFormat:", v21, v7);

                int v23 = [v22 evaluateWithObject:v9];
                int v24 = v23;
                if (a4 && (v23 & 1) == 0) {
                  *a4 = v17;
                }

                if (!v24)
                {
                  BOOL v25 = 0;
                  goto LABEL_23;
                }
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
            if (v14) {
              continue;
            }
            break;
          }
          BOOL v25 = 1;
LABEL_23:
          id v6 = v27;
        }
        else
        {
          BOOL v25 = 1;
        }
      }
      else
      {
        BOOL v25 = 1;
      }
    }
    else
    {
      BOOL v25 = 1;
    }
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)_isValidKey:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = [(INIntent *)self _inCodable];
  id v6 = v5;
  if (v5)
  {
    char v7 = [v5 isValidKey:v4];
  }
  else
  {
    NSSelectorFromString(v4);

    char v7 = objc_opt_respondsToSelector();
  }

  return v7 & 1;
}

- (INAppIntent)_asMigratedAppIntent
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = _INVCVoiceShortcutClient();
  if (!v3)
  {
    char v7 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
LABEL_10:
      id v4 = 0;
      goto LABEL_11;
    }
    *(_DWORD *)buf = 136315138;
    int v12 = "-[INIntent _asMigratedAppIntent]";
    uint64_t v8 = "%s No VoiceShortcutClient; completing with nil";
LABEL_15:
    _os_log_error_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_ERROR, v8, buf, 0xCu);
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    char v7 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    int v12 = "-[INIntent _asMigratedAppIntent]";
    uint64_t v8 = "%s VoiceShortcutClient hasn't implement migratedAppIntentWithINIntent:error: yet.";
    goto LABEL_15;
  }
  id v10 = 0;
  id v4 = [v3 migratedAppIntentWithINIntent:self error:&v10];
  id v5 = v10;
  if (!v4)
  {
    id v6 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v12 = "-[INIntent _asMigratedAppIntent]";
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_error_impl(&dword_18CB2F000, v6, OS_LOG_TYPE_ERROR, "%s No AppIntent; returning nil. Error: %{public}@",
        buf,
        0x16u);
    }
  }

LABEL_11:

  return (INAppIntent *)v4;
}

- (INIntentKeyParameter)_keyParameter
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_keyParameterLock = &self->_keyParameterLock;
  os_unfair_lock_lock(&self->_keyParameterLock);
  if (!self->_hasLoadedKeyParameter)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = [(INIntent *)self _keyCodableAttributes];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v10 = [v9 propertyName];
          if ([(INIntent *)self _isValidKey:v10])
          {
            uint64_t v11 = [(INIntent *)self valueForKey:v10];
            if (v11)
            {
              int v12 = (void *)v11;
              __int16 v13 = [INIntentKeyParameter alloc];
              id v14 = [(INIntent *)self imageForParameterNamed:v10];
              uint64_t v15 = [(INIntentKeyParameter *)v13 initWithCodableAttribute:v9 value:v12 image:v14];
              keyParameter = self->_keyParameter;
              self->_keyParameter = v15;

              goto LABEL_13;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    self->_hasLoadedKeyParameter = 1;
  }
  os_unfair_lock_unlock(p_keyParameterLock);
  long long v17 = self->_keyParameter;

  return v17;
}

id __31__INIntent__codableDescription__block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _className];
  uint64_t v5 = [v3 intentCodableDescriptionWithIntentClassName:v4];

  return v5;
}

- (void)_updateWithJSONDictionary:(id)a3
{
  id v29 = a3;
  id v4 = objc_alloc_init(INJSONDecoder);
  uint64_t v5 = [(INIntent *)self _metadata];
  uint64_t v6 = [v29 objectForKeyedSubscript:@"metadata"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  id v9 = (void *)MEMORY[0x1E4F1CC08];
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)MEMORY[0x1E4F1CC08];
  }
  [(INJSONDecoder *)v4 decodeObject:v5 withCodableDescription:0 from:v10];

  uint64_t v11 = [(INIntent *)self _codableDescription];
  int v12 = [v29 objectForKeyedSubscript:@"parameters"];
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v13 = v12;
    }
    else {
      __int16 v13 = 0;
    }
  }
  else
  {
    __int16 v13 = 0;
  }
  id v14 = v13;

  if (v14) {
    id v15 = v14;
  }
  else {
    id v15 = v9;
  }
  [(INJSONDecoder *)v4 decodeObject:self withCodableDescription:v11 from:v15];

  objc_super v16 = [INParameterContexts alloc];
  long long v17 = [v29 objectForKeyedSubscript:@"parameterContexts"];
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  id v19 = v18;

  if (v19) {
    id v20 = v19;
  }
  else {
    id v20 = v9;
  }
  id v21 = [(INParameterContexts *)v16 _initWithIntent:self decoder:v4 JSONDictionary:v20];

  [(INIntent *)self _setParameterContexts:v21];
  long long v22 = [(INIntent *)self _codableDescription];
  if (v22)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v23 = v22;
    }
    else {
      int v23 = 0;
    }
  }
  else
  {
    int v23 = 0;
  }
  id v24 = v23;

  BOOL v25 = objc_msgSend(v24, "_nullable_schema");
  id v26 = [(INIntent *)self _className];
  id v27 = [v25 intentResponseCodableDescriptionWithIntentClassName:v26];

  long long v28 = [v25 _types];
  [v24 _reestablishReferencedCodableDescriptionsUsingTypes:v28 intentResponseCodableDescription:v27];
}

- (NSDictionary)_JSONDictionaryRepresentation
{
  id v3 = objc_alloc_init(INJSONEncoderConfiguration);
  id v4 = +[INPreferences siriLanguageCode];
  [(INJSONEncoderConfiguration *)v3 setLanguageCode:v4];

  uint64_t v5 = [(INIntent *)self _JSONDictionaryRepresentationWithConfiguration:v3];

  return (NSDictionary *)v5;
}

- (id)_JSONDictionaryRepresentationWithConfiguration:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = [[INJSONEncoder alloc] initWithConfiguration:v5];

  id v8 = [(INIntent *)self typeName];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v8, @"typeName");

  id v9 = [(INIntent *)self _metadata];
  id v10 = [(INJSONEncoder *)v7 encodeObject:v9];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v10, @"metadata");

  uint64_t v11 = [(INIntent *)self _codableDescription];
  int v12 = [(INJSONEncoder *)v7 encodeObject:self withCodableDescription:v11];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v12, @"parameters");

  return v6;
}

- (void)setParametersByName:(id)a3
{
  id v4 = a3;
  id v5 = [(INIntent *)self _typedBackingStore];

  if (v5)
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __32__INIntent_setParametersByName___block_invoke;
    v12[3] = &unk_1E551D838;
    id v13 = v6;
    id v7 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v12];
    id v8 = [(INIntent *)self _typedBackingStore];
    [v8 setParameters:v7];
  }
  else
  {
    id v9 = [(INIntent *)self backingStore];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __32__INIntent_setParametersByName___block_invoke_2;
      v11[3] = &unk_1E551D838;
      v11[4] = self;
      [v4 enumerateKeysAndObjectsUsingBlock:v11];
    }
  }
}

void __32__INIntent_setParametersByName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  INIntentSlotValueTransformToProperty(a3, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

uint64_t __32__INIntent_setParametersByName___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forUndefinedKey:a2];
}

- (NSDictionary)parametersByName
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [(INIntent *)self _typedBackingStore];

  if (v3)
  {
    id v4 = [(INIntent *)self _typedBackingStore];
    id v5 = [v4 parameters];

    if ([v5 count]) {
      id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
    }
    else {
      id v6 = 0;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_super v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          long long v17 = objc_msgSend(v16, "role", (void)v20);
          if (v17)
          {
            uint64_t v18 = INIntentSlotValueTransformFromProperty(v16);
            [v6 setObject:v18 forKeyedSubscript:v17];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    id v10 = (void *)[v6 copy];
  }
  else
  {
    id v7 = [(INIntent *)self backingStore];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v9 = [(INIntent *)self backingStore];
      id v10 = [v9 _dictionaryRepresentationWithNullValues:0];
    }
    else
    {
      id v10 = 0;
    }
  }

  return (NSDictionary *)v10;
}

- (NSArray)_parametersForcedToNeedsValue
{
  double v2 = [(INIntent *)self _metadata];
  id v3 = [v2 forceNeedsValueForParameters];

  return (NSArray *)v3;
}

- (void)setVerb:(id)a3
{
  id v4 = a3;
  id v5 = [(INIntent *)self _typedBackingStore];
  [v5 setVerb:v4];
}

- (NSString)verb
{
  double v2 = [(INIntent *)self _typedBackingStore];
  id v3 = [v2 verb];

  return (NSString *)v3;
}

- (NSString)domain
{
  double v2 = [(INIntent *)self _typedBackingStore];
  id v3 = [v2 domain];

  return (NSString *)v3;
}

- (INIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)INIntent;
  id v11 = [(INIntent *)&v16 init];
  if (v11)
  {
    uint64_t v12 = objc_alloc_init(_INPBGenericIntent);
    backingStore = v11->_backingStore;
    v11->_backingStore = &v12->super;

    uint64_t v14 = objc_alloc_init(_INPBIntentMetadata);
    [(INIntent *)v11 _setMetadata:v14];

    [(INIntent *)v11 setDomain:v8];
    [(INIntent *)v11 setVerb:v9];
    [(INIntent *)v11 setParametersByName:v10];
    [(INIntent *)v11 _setIntentCategory:0];
    [(INIntent *)v11 _setCategoryVerb:@"Do"];
  }

  return v11;
}

- (id)_typedBackingStore
{
  double v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSOrderedSet)_displayOrderedAttributes
{
  double v2 = [(INIntent *)self _codableDescription];
  id v3 = [v2 displayOrderedAttributes];

  return (NSOrderedSet *)v3;
}

- (NSArray)_codableAttributes
{
  double v2 = [(INIntent *)self _codableDescription];
  id v3 = [v2 attributes];
  id v4 = [v3 allValues];

  return (NSArray *)v4;
}

- (NSString)debugDescription
{
  double v2 = [(INIntent *)self _redactedDictionaryRepresentation];
  id v3 = [v2 descriptionAtIndent:0];

  return (NSString *)v3;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  id v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INIntent;
  id v6 = [(INIntent *)&v11 description];
  id v7 = [(INIntent *)self _redactedDictionaryRepresentation];
  id v8 = [v7 descriptionAtIndent:a3];
  id v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INIntent *)self descriptionAtIndent:0];
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  [v9 encodeObject:self->_identifier forKey:@"identifier"];
  [v9 encodeObject:self->_backingStore forKey:@"backingStore"];
  [v9 encodeObject:self->_parameterCombinations forKey:@"parameterCombinations"];
  [v9 encodeObject:self->_recordRoute forKey:@"recordRoute"];
  [v9 encodeObject:self->_recordDeviceUID forKey:@"recordDeviceUID"];
  [v9 encodeObject:self->_recordDeviceIdentifier forKey:@"recordDeviceIdentifier"];
  [v9 encodeInt32:self->_audioSessionID forKey:@"audioSessionID"];
  [v9 encodeInt64:self->_indexingHash forKey:@"_indexingHash"];
  [v9 encodeObject:self->_donationMetadata forKey:@"donationMetadata"];
  [v9 encodeBool:self->_shouldForwardToAppOnSucccess forKey:@"_shouldForwardToAppOnSucccess"];
  parameterContexts = self->_parameterContexts;
  if (parameterContexts && ![(INParameterContexts *)parameterContexts _isEmpty])
  {
    id v5 = self->_parameterContexts;
    id v6 = objc_alloc_init(INJSONEncoder);
    id v7 = [(INIntent *)self _codableDescription];
    id v8 = [(INParameterContexts *)v5 _intents_encodeWithJSONEncoder:v6 codableDescription:v7];

    [v9 encodeObject:v8 forKey:@"_parameterContexts"];
  }
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_identifier, @"identifier");
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__90373;
  objc_super v39 = __Block_byref_object_dispose__90374;
  id v40 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    backingStore = self->_backingStore;
    id v9 = (id *)(v36 + 5);
    id obj = (id)v36[5];
    objc_msgSend(v7, "intents_setWidgetPlistRepresentable:forKey:parameters:error:", backingStore, @"backingStore", v6, &obj);
    objc_storeStrong(v9, obj);
  }
  else
  {
    id v10 = NSString;
    objc_super v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    uint64_t v13 = [v10 stringWithFormat:@"Unsupported backing store type: %@", v12];
    uint64_t v14 = INIntentError(8001, v13, 0);
    id v15 = (void *)v36[5];
    v36[5] = v14;
  }
  objc_super v16 = (void *)v36[5];
  if (v16)
  {
    if (a4)
    {
      id v17 = 0;
      *a4 = v16;
      goto LABEL_20;
    }
    goto LABEL_13;
  }
  if (self->_parameterCombinations)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    parameterCombinations = self->_parameterCombinations;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __62__INIntent_widgetPlistableRepresentationWithParameters_error___block_invoke;
    v29[3] = &unk_1E551C338;
    id v30 = v6;
    uint64_t v33 = &v35;
    id v20 = v18;
    id v31 = v20;
    int v32 = self;
    [(NSDictionary *)parameterCombinations enumerateKeysAndObjectsUsingBlock:v29];
    long long v21 = (void *)v36[5];
    if (v21)
    {
      if (a4) {
        *a4 = v21;
      }
    }
    else
    {
      objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v20, @"parameterCombinations");
    }

    if (v21)
    {
LABEL_13:
      id v17 = 0;
      goto LABEL_20;
    }
  }
  if (self->_indexingHash)
  {
    long long v22 = objc_msgSend(NSNumber, "numberWithLongLong:");
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v22, @"_indexingHash");
  }
  parameterContexts = self->_parameterContexts;
  if (parameterContexts && ![(INParameterContexts *)parameterContexts _isEmpty])
  {
    id v24 = self->_parameterContexts;
    uint64_t v25 = objc_alloc_init(INJSONEncoder);
    id v26 = [(INIntent *)self _codableDescription];
    id v27 = [(INParameterContexts *)v24 _intents_encodeWithJSONEncoder:v25 codableDescription:v26];

    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v27, @"_parameterContexts");
  }
  id v17 = v7;
LABEL_20:
  _Block_object_dispose(&v35, 8);

  return v17;
}

void __62__INIntent_widgetPlistableRepresentationWithParameters_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v9 + 40);
  id v10 = [a3 widgetPlistableRepresentationWithParameters:v8 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    objc_super v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    uint64_t v12 = [v7 allObjects];
    [v11 addObject:v12];

    [v11 addObject:v10];
    [*(id *)(a1 + 40) addObject:v11];
  }
  else
  {
    *a4 = 1;
    objc_super v11 = [NSString stringWithFormat:@"Unable to encode INParameterCombination for intent: %@", *(void *)(a1 + 48)];
    uint64_t v13 = INIntentError(8001, v11, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

- (id)widgetPlistableRepresentation:(id *)a3
{
  return [(INIntent *)self widgetPlistableRepresentationWithParameters:0 error:a3];
}

- (id)_backingStoreData
{
  v8[2] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    identifier = self->_identifier;
    v7[0] = @"id";
    v7[1] = @"data";
    v8[0] = identifier;
    id v4 = [(PBCodable *)self->_backingStore data];
    v8[1] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_copyApplyingNewBackingStoreData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 objectForKey:@"data"];
  uint64_t v8 = [v6 objectForKey:@"id"];

  if (!v8)
  {
    uint64_t v12 = [NSString stringWithFormat:@"Unable to create new intent from backing store data:  Identifier not found"];
    uint64_t v13 = INIntentError(8001, v12, 0);

    if (v13)
    {
      if (a4) {
        *a4 = v13;
      }

LABEL_12:
      uint64_t v9 = 0;
      goto LABEL_13;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = NSString;
    id v15 = (objc_class *)objc_opt_class();
    objc_super v16 = NSStringFromClass(v15);
    id v17 = [v14 stringWithFormat:@"Unsupported backing store to set data on: %@", v16];
    uint64_t v18 = INIntentError(8001, v17, 0);

    if (a4 && v18) {
      *a4 = v18;
    }

    goto LABEL_12;
  }
  uint64_t v9 = [(INIntent *)self copyWithZone:0];
  [v9[12] _setData:v7 error:a4];
  uint64_t v10 = [v8 copy];
  id v11 = v9[10];
  v9[10] = (id)v10;

  v9[8] = 0;
LABEL_13:

  return v9;
}

- (id)_copyWithoutBackingStoreData:(id *)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(INIntent *)self copyWithZone:0];
    [v5[12] _setData:0 error:a3];
    id v6 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v7 = [v6 UUIDString];
    id v8 = v5[10];
    v5[10] = (id)v7;

    v5[8] = 0;
  }
  else
  {
    uint64_t v9 = NSString;
    uint64_t v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    uint64_t v12 = [v9 stringWithFormat:@"Unsupported backing store to set data on: %@", v11];
    uint64_t v13 = INIntentError(8001, v12, 0);

    if (a3 && v13) {
      *a3 = v13;
    }

    return 0;
  }
  return v5;
}

- (id)_emptyCopy
{
  id v3 = [(INIntent *)self _inCodable];

  if (v3)
  {
    uint64_t v4 = [(INIntent *)self copy];
    id v5 = [(id)v4 _inCodable];
    [v5 setNilValueForAllKeys];
  }
  else
  {
    uint64_t v4 = [objc_alloc((Class)objc_opt_class()) _init];
    if (!v4) {
      goto LABEL_6;
    }
    id v6 = objc_alloc_init((Class)objc_opt_class());
    uint64_t v7 = *(void **)(v4 + 96);
    *(void *)(v4 + 96) = v6;

    objc_storeStrong((id *)(v4 + 40), self->_parameterCombinations);
    objc_storeStrong((id *)(v4 + 104), self->_recordRoute);
    objc_storeStrong((id *)(v4 + 112), self->_recordDeviceUID);
    objc_storeStrong((id *)(v4 + 120), self->_recordDeviceIdentifier);
    *(_DWORD *)(v4 + 36) = self->_audioSessionID;
    objc_storeStrong((id *)(v4 + 56), self->_parameterContexts);
    *(unsigned char *)(v4 + 32) = self->_shouldForwardToAppOnSucccess;
    id v5 = [(INIntent *)self _metadata];
    [(id)v4 _setMetadata:v5];
  }

LABEL_6:
  id v8 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v9 = [v8 UUIDString];
  uint64_t v10 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v9;

  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    identifier = self->_identifier;
    BOOL v8 = 0;
    if (identifier == (NSString *)v5[10] || -[NSString isEqual:](identifier, "isEqual:"))
    {
      backingStore = self->_backingStore;
      if (backingStore == (PBCodable *)v5[12] || -[PBCodable isEqual:](backingStore, "isEqual:")) {
        BOOL v8 = 1;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(PBCodable *)self->_backingStore hash] ^ v3;
}

- (void)trimDataAgainstTCCForAuditToken:(id *)a3 bundle:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(INIntent *)self _metadata];
  uint64_t v8 = INPrivacyEntitlementOptionsForIntentMetadata(v7);

  if (v8)
  {
    long long v9 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)objc_super v16 = *(_OWORD *)a3->var0;
    *(_OWORD *)&v16[16] = v9;
    uint64_t v10 = INPrivacyEntitlementOptionsMissingForExtension(v8, v16, v6);
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = (void *)INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = v12;
        uint64_t v14 = INPrivacyEntitlementOptionsGetNames(v11);
        *(_DWORD *)objc_super v16 = 136315394;
        *(void *)&v16[4] = "-[INIntent trimDataAgainstTCCForAuditToken:bundle:]";
        *(_WORD *)&v16[12] = 2114;
        *(void *)&v16[14] = v14;
        _os_log_impl(&dword_18CB2F000, v13, OS_LOG_TYPE_INFO, "%s Missing required entitlement: %{public}@, redacting data accordingly", v16, 0x16u);
      }
      id v15 = INContainingAppBundleIdentifierForBundle(v6);
      [(INIntent *)self _redactForMissingPrivacyEntitlementOptions:v11 containingAppBundleId:v15];
    }
  }
}

- (BOOL)_isUserConfirmationRequired
{
  double v2 = [(INIntent *)self _metadata];
  char v3 = [v2 userConfirmationRequired];

  return v3;
}

- (int64_t)_indexingHash
{
  int64_t result = self->_indexingHash;
  if (!result)
  {
    if ([(INIntent *)self _type] == 2)
    {
      id v4 = objc_alloc_init(INJSONEncoderConfiguration);
      id v5 = [(INIntent *)self _JSONDictionaryRepresentationWithConfiguration:v4];
      id v6 = [v5 objectForKeyedSubscript:@"parameters"];
    }
    else
    {
      id v4 = [(INIntent *)self _dictionaryRepresentation];
      id v6 = [v4 _intents_indexingRepresentation];
    }

    uint64_t v7 = (void *)[v6 mutableCopy];
    uint64_t v8 = [(INIntent *)self launchId];

    if (v8)
    {
      long long v9 = [(INIntent *)self launchId];
      [v7 setObject:v9 forKey:@"_launchId"];
    }
    uint64_t v10 = [(INIntent *)self extensionBundleId];

    if (v10)
    {
      uint64_t v11 = [(INIntent *)self extensionBundleId];
      [v7 setObject:v11 forKey:@"_extensionBundleId"];
    }
    uint64_t v12 = [(INIntent *)self _className];
    [v7 setObject:v12 forKey:@"_className"];

    id v13 = objc_alloc_init(MEMORY[0x1E4F70C20]);
    id v14 = (id)[v13 combineContentsOfPropertyListObject:v7];
    self->_indexingHash = [v13 finalize];

    return self->_indexingHash;
  }
  return result;
}

- (id)_displayOrderedNonNilParameters
{
  char v3 = (void *)MEMORY[0x1E4F1CA70];
  id v4 = [(INIntent *)self _nonNilParameters];
  id v5 = [v3 orderedSetWithSet:v4];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__INIntent__displayOrderedNonNilParameters__block_invoke;
  void v8[3] = &unk_1E551C310;
  void v8[4] = self;
  [v5 sortUsingComparator:v8];
  id v6 = (void *)[v5 copy];

  return v6;
}

uint64_t __43__INIntent__displayOrderedNonNilParameters__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 _codableDescription];
  uint64_t v9 = [v8 attributeByName:v7];

  uint64_t v10 = [*(id *)(a1 + 32) _codableDescription];
  uint64_t v11 = [v10 attributeByName:v6];

  if (v9 || !v11)
  {
    if (!v9 || v11)
    {
      if (v9 | v11)
      {
        id v13 = [(id)v9 displayPriorityRank];
        id v14 = [(id)v11 displayPriorityRank];
        uint64_t v12 = [v13 compare:v14];
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = -1;
    }
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

- (BOOL)_isEligibleForSuggestions
{
  double v2 = [(INIntent *)self _codableDescription];
  char v3 = [v2 isEligibleForSuggestions];

  return v3;
}

- (BOOL)_isConfigurable
{
  double v2 = [(INIntent *)self _codableDescription];
  char v3 = [v2 isConfigurable];

  return v3;
}

- (BOOL)_hasMatchingIntentHandlerIncludingRemoteExecution:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(INIntent *)self extensionBundleId];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    id v7 = 0;
    LOBYTE(v8) = 1;
  }
  else
  {
    uint64_t v9 = [(INIntent *)self launchId];
    id v17 = 0;
    INExtractAppInfoFromSiriLaunchId(v9, &v17, 0);
    id v7 = v17;

    uint64_t v10 = +[INAppInfo appInfoWithIntent:self];
    uint64_t v11 = [v10 supportedIntents];
    uint64_t v12 = [(INIntent *)self _className];
    int v8 = [v11 containsObject:v12];

    if (!v8 && v3 && v7)
    {
      id v13 = [_INVCIntentDefinitionManagerClass() appInfoForBundleID:v7];
      id v14 = [v13 supportedActionsByExtensions];
      id v15 = [(INIntent *)self _className];
      LOBYTE(v8) = [v14 containsObject:v15];
    }
  }

  return v8;
}

- (BOOL)_supportsBackgroundExecutionWithOptions:(unint64_t)a3
{
  int v4 = [(INIntent *)self _hasMatchingIntentHandlerIncludingRemoteExecution:a3 & 1];
  id v5 = [(INIntent *)self _currentParameterCombination];
  uint64_t v6 = v5;
  if (v5) {
    v4 &= [v5 supportsBackgroundExecution];
  }

  return v4;
}

- (BOOL)_supportsBackgroundExecution
{
  return [(INIntent *)self _supportsBackgroundExecutionWithOptions:1];
}

- (NSDictionary)_resolvableParameterCombinations
{
  BOOL v3 = [(INIntent *)self _codableDescription];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v4 = v3;
    }
    else {
      int v4 = 0;
    }
  }
  else
  {
    int v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [(INIntent *)self _parameterCombinations];
  id v7 = [v5 resolvableParameterCombinationsWithParameterCombinations:v6];

  return (NSDictionary *)v7;
}

- (NSDictionary)_configurableParameterCombinations
{
  configurableParameterCombinations = self->_configurableParameterCombinations;
  if (!configurableParameterCombinations)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __46__INIntent__configurableParameterCombinations__block_invoke;
    v7[3] = &unk_1E551C2E8;
    v7[4] = self;
    int v4 = [(INIntent *)self _querySchemaWithBlock:v7 contentOptions:16];
    id v5 = self->_configurableParameterCombinations;
    self->_configurableParameterCombinations = v4;

    configurableParameterCombinations = self->_configurableParameterCombinations;
  }

  return configurableParameterCombinations;
}

id __46__INIntent__configurableParameterCombinations__block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  int v4 = [v2 _className];
  id v5 = [v3 _configurableParameterCombinationsForClassName:v4];

  return v5;
}

- (id)_currentParameterCombination
{
  id v3 = [(INIntent *)self _parameterCombinations];
  int v4 = [(INIntent *)self _nonNilParameters];
  id v5 = [v3 objectForKey:v4];

  return v5;
}

id __34__INIntent__parameterCombinations__block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  int v4 = [v2 _className];
  id v5 = [v3 _parameterCombinationsForClassName:v4];

  return v5;
}

- (id)_querySchemaWithBlock:(id)a3 contentOptions:(unint64_t)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, uint64_t))a3;
  id v7 = [(INIntent *)self launchId];

  if (!v7)
  {
    id v15 = 0;
LABEL_23:
    int v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v33 = +[INSchema _defaultSchemaForBundle:v32 contentOptions:a4];

    id v24 = v6[2](v6, v33);
    id v15 = (void *)v33;
    goto LABEL_24;
  }
  int v8 = [(INIntent *)self launchId];
  id v37 = 0;
  INExtractAppInfoFromSiriLaunchId(v8, &v37, 0);
  id v9 = v37;

  int CanMapLSDatabase = INThisProcessCanMapLSDatabase(0);
  uint64_t v11 = [MEMORY[0x1E4F223F8] bundleRecordForCurrentProcess];
  uint64_t v12 = [v11 bundleIdentifier];
  int v13 = [v12 isEqualToString:v9];

  if (v13)
  {
    id v14 = v11;
  }
  else if (CanMapLSDatabase)
  {
    id v36 = 0;
    id v14 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v9 allowPlaceholder:0 error:&v36];
    id v16 = v36;
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v40 = "-[INIntent _querySchemaWithBlock:contentOptions:]";
        __int16 v41 = 2114;
        id v42 = v9;
        __int16 v43 = 2114;
        id v44 = v17;
        _os_log_error_impl(&dword_18CB2F000, v18, OS_LOG_TYPE_ERROR, "%s Unable to get bundle record with identifier: %{public}@, error: %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v14 = 0;
  }
  id v19 = [v14 intentDefinitionURLs];
  id v20 = [(INIntent *)self _className];
  long long v21 = [v19 objectForKey:v20];

  if (v21)
  {
    id v22 = v14;
    uint64_t v35 = v11;
    if (v22)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v23 = v22;
      }
      else {
        long long v23 = 0;
      }
    }
    else
    {
      long long v23 = 0;
    }
    id v25 = v23;

    uint64_t v26 = [v25 containingBundleRecord];
    id v27 = (void *)v26;
    if (v26) {
      long long v28 = (void *)v26;
    }
    else {
      long long v28 = v22;
    }
    id v29 = v28;

    id v30 = [v29 bundleIdentifier];

    uint64_t v38 = v21;
    id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    id v15 = +[INSchema _schemaWithIntentDefinitionURLs:v31 bundleIdentifier:v9 mainBundleIdentifier:v30 contentOptions:a4];

    id v24 = v6[2](v6, (uint64_t)v15);

    uint64_t v11 = v35;
  }
  else
  {
    id v15 = 0;
    id v24 = 0;
  }

  if (!v24) {
    goto LABEL_23;
  }
LABEL_24:

  return v24;
}

void __32__INIntent__setParameterImages___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 parameter];
  id v5 = [v4 parameterKeyPath];
  uint64_t v6 = [v3 image];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = objc_alloc_init(_INPBPair);
    int v8 = INIntentSlotValueTransformToImageValue(v6);
    id v15 = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    [(_INPBPair *)v7 setPairImageValues:v9];

    [(_INPBPair *)v7 setKey:v5];
    [*(id *)(a1 + 32) addObject:v7];
  }
  else
  {

    uint64_t v10 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = v10;
      uint64_t v12 = [v3 image];
      int v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 136315650;
      id v17 = "-[INIntent _setParameterImages:]_block_invoke";
      __int16 v18 = 2112;
      id v19 = v14;
      __int16 v20 = 2112;
      long long v21 = v5;
      _os_log_error_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_ERROR, "%s Wrong image class (%@) for parameter keyPath: %@", buf, 0x20u);
    }
  }
}

- (NSArray)_sortedParameterImages
{
  id v3 = [(INIntent *)self _parameterImages];
  if ([(INIntent *)self _type] == 1)
  {
    int v4 = v13;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    id v5 = __34__INIntent__sortedParameterImages__block_invoke;
  }
  else
  {
    uint64_t v6 = v3;
    if ([(INIntent *)self _type] != 2) {
      goto LABEL_7;
    }
    int v4 = v12;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v5 = __34__INIntent__sortedParameterImages__block_invoke_2;
  }
  v4[2] = v5;
  v4[3] = &unk_1E551C270;
  v4[4] = self;
  id v7 = (void *)MEMORY[0x192F984C0]();
  uint64_t v6 = v3;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __34__INIntent__sortedParameterImages__block_invoke_3;
    v10[3] = &unk_1E551C298;
    id v11 = v7;
    id v8 = v7;
    uint64_t v6 = [v3 sortedArrayUsingComparator:v10];
  }
LABEL_7:

  return (NSArray *)v6;
}

uint64_t __34__INIntent__sortedParameterImages__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 parameter];
  int v4 = [v3 parameterKeyPath];
  id v5 = [v4 pathComponents];
  uint64_t v6 = [v5 firstObject];

  id v7 = [*(id *)(a1 + 32) _intentInstanceDescription];
  id v8 = [v7 slotByName:v6];
  uint64_t v9 = [v8 tag];

  return v9;
}

uint64_t __34__INIntent__sortedParameterImages__block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  int v4 = [v2 _inCodable];
  id v5 = [v4 _objectDescription];

  uint64_t v6 = [v5 displayOrderedAttributes];
  id v7 = [v3 parameter];

  id v8 = [v7 parameterKeyPath];
  uint64_t v9 = [v8 pathComponents];
  uint64_t v10 = [v9 firstObject];

  id v11 = [v5 attributeByName:v10];
  uint64_t v12 = [v6 indexOfObject:v11];

  return v12;
}

uint64_t __34__INIntent__sortedParameterImages__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a3;
  unint64_t v8 = v6(v5, a2);
  unint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  if (v8 >= v9) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = -1;
  }
  if (v8 > v9) {
    return 1;
  }
  else {
    return v10;
  }
}

- (id)_imageForParameter:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(INIntent *)self _parameterImages];
  uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        unint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 parameter];
        char v11 = [v10 isEqualToParameter:v4];

        if (v11)
        {
          uint64_t v6 = [v9 image];
          goto LABEL_11;
        }
      }
      uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_setImage:(id)a3 forParameter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = 0;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  id v10 = v9;

  char v11 = [(INIntent *)self _parameterImages];
  if (v10)
  {
    uint64_t v12 = [[INParameterImage alloc] initWithParameter:v7 image:v10];
    long long v13 = [v11 arrayByAddingObject:v12];
    [(INIntent *)self _setParameterImages:v13];
  }
  else
  {
    long long v14 = (void *)MEMORY[0x1E4F28F60];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __35__INIntent__setImage_forParameter___block_invoke;
    v17[3] = &unk_1E551C248;
    id v18 = v7;
    long long v15 = [v14 predicateWithBlock:v17];
    long long v16 = [v11 filteredArrayUsingPredicate:v15];
    [(INIntent *)self _setParameterImages:v16];
  }
}

uint64_t __35__INIntent__setImage_forParameter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 parameter];
  LODWORD(a1) = [v3 isEqualToParameter:*(void *)(a1 + 32)];

  return a1 ^ 1;
}

- (id)_keyCodableAttributes
{
  double v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = [(INIntent *)self _codableDescription];
  id v4 = [v3 keyAttribute];
  uint64_t v5 = objc_msgSend(v2, "if_arrayWithObjectIfNonNil:", v4);

  return v5;
}

- (INImage)imageForParameterNamed:(NSString *)parameterName
{
  id v4 = parameterName;
  uint64_t v5 = +[INParameter parameterForClass:objc_opt_class() keyPath:v4];

  id v6 = [(INIntent *)self _imageForParameter:v5];

  return (INImage *)v6;
}

- (void)setImage:(INImage *)image forParameterNamed:(NSString *)parameterName
{
  id v6 = parameterName;
  id v7 = image;
  id v8 = +[INParameter parameterForClass:objc_opt_class() keyPath:v6];

  [(INIntent *)self _setImage:v7 forParameter:v8];
}

- (NSString)intentDescription
{
  double v2 = [(INIntent *)self _metadata];
  id v3 = [v2 intentDescription];

  return (NSString *)v3;
}

- (void)setDidAuthenticateAppProtection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(INIntent *)self _metadata];
  [v4 setBypassAppProtectionAuthentication:v3];
}

- (BOOL)didAuthenticateAppProtection
{
  double v2 = [(INIntent *)self _metadata];
  char v3 = [v2 bypassAppProtectionAuthentication];

  return v3;
}

- (NSString)_preferredAudioOutputRouteId
{
  double v2 = [(INIntent *)self _metadata];
  char v3 = [v2 preferredAudioOutputRouteId];

  return (NSString *)v3;
}

- (NSString)_mediaRouteId
{
  double v2 = [(INIntent *)self _metadata];
  char v3 = [v2 mediaRouteId];

  return (NSString *)v3;
}

- (NSString)_endpointId
{
  double v2 = [(INIntent *)self _metadata];
  char v3 = [v2 endpointId];

  return (NSString *)v3;
}

- (NSArray)airPlayRouteIds
{
  double v2 = [(INIntent *)self _metadata];
  char v3 = [v2 airPlayRouteIds];

  return (NSArray *)v3;
}

- (void)_setAirPlayRouteIds:(id)a3
{
  id v4 = a3;
  id v5 = [(INIntent *)self _metadata];
  [v5 setAirPlayRouteIds:v4];
}

- (void)setDonationMetadata:(INIntentDonationMetadata *)donationMetadata
{
  id v4 = (INIntentDonationMetadata *)[(INIntentDonationMetadata *)donationMetadata copy];
  id v5 = self->_donationMetadata;
  self->_donationMetadata = v4;

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)setShortcutAvailability:(INShortcutAvailabilityOptions)shortcutAvailability
{
  id v5 = [(INIntent *)self _metadata];
  [v5 clearShortcutAvailabilities];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__INIntent_setShortcutAvailability___block_invoke;
  v6[3] = &unk_1E5520C28;
  v6[4] = self;
  INShortcutAvailabilityOptionsEnumerateBackingTypes(shortcutAvailability, v6);
}

void __36__INIntent_setShortcutAvailability___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _metadata];
  [v3 addShortcutAvailability:a2];
}

- (INShortcutAvailabilityOptions)shortcutAvailability
{
  INShortcutAvailabilityOptions v8 = 0;
  id v3 = [(INIntent *)self _metadata];
  uint64_t v4 = [v3 shortcutAvailabilitiesCount];

  if (!v4) {
    return 0;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    id v6 = [(INIntent *)self _metadata];
    INShortcutAvailabilityOptionsAddBackingType((uint64_t *)&v8, [v6 shortcutAvailabilityAtIndex:i]);
  }
  return v8;
}

- (void)_setEndpointMediaPlaybackEnabled:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(INIntent *)self _metadata];
  if (v6) {
    uint64_t v5 = [v6 BOOLValue];
  }
  else {
    uint64_t v5 = 0;
  }
  [v4 setEndpointMediaPlaybackEnabled:v5];
}

- (NSNumber)_endpointMediaPlaybackEnabled
{
  id v3 = [(INIntent *)self _metadata];
  if ([v3 hasEndpointMediaPlaybackEnabled])
  {
    uint64_t v4 = NSNumber;
    uint64_t v5 = [(INIntent *)self _metadata];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "endpointMediaPlaybackEnabled"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)_setMSLimitReached:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(INIntent *)self _metadata];
  if (v6) {
    uint64_t v5 = [v6 BOOLValue];
  }
  else {
    uint64_t v5 = 0;
  }
  [v4 setMsLimitReached:v5];
}

- (NSNumber)_msLimitReached
{
  id v3 = [(INIntent *)self _metadata];
  if ([v3 hasMsLimitReached])
  {
    uint64_t v4 = NSNumber;
    uint64_t v5 = [(INIntent *)self _metadata];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "msLimitReached"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)_setIsOwnedByCurrentUser:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(INIntent *)self _metadata];
  if (v5) {
    objc_msgSend(v4, "setIsOwnedByCurrentUser:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasIsOwnedByCurrentUser:0];
  }
}

- (NSNumber)_isOwnedByCurrentUser
{
  id v3 = [(INIntent *)self _metadata];
  if ([v3 hasIsOwnedByCurrentUser])
  {
    uint64_t v4 = NSNumber;
    id v5 = [(INIntent *)self _metadata];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isOwnedByCurrentUser"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)_setOriginatingDeviceRapportEffectiveIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INIntent *)self _metadata];
  [v5 setOriginatingDeviceRapportEffectiveId:v4];
}

- (NSString)_originatingDeviceRapportEffectiveIdentifier
{
  double v2 = [(INIntent *)self _metadata];
  id v3 = [v2 originatingDeviceRapportEffectiveId];

  return (NSString *)v3;
}

- (NSString)_originatingDeviceRapportMediaSystemIdentifier
{
  double v2 = [(INIntent *)self _metadata];
  id v3 = [v2 originatingDeviceRapportMediaSystemId];

  return (NSString *)v3;
}

- (void)_setOriginatingDeviceIdsIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INIntent *)self _metadata];
  [v5 setOriginatingDeviceIdsIdentifier:v4];
}

- (NSString)_originatingDeviceIDSIdentifier
{
  double v2 = [(INIntent *)self _metadata];
  id v3 = [v2 originatingDeviceIdsIdentifier];

  return (NSString *)v3;
}

- (void)_setPrimaryDisplayDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(INIntent *)self _metadata];
  [v4 setIsPrimaryDisplayDisabled:v3];
}

- (BOOL)_isPrimaryDisplayDisabled
{
  double v2 = [(INIntent *)self _metadata];
  char v3 = [v2 isPrimaryDisplayDisabled];

  return v3;
}

- (void)_setIdiom:(int64_t)a3
{
  id v4 = [(INIntent *)self _metadata];
  id v6 = v4;
  if ((unint64_t)(a3 - 1) < 7) {
    uint64_t v5 = a3;
  }
  else {
    uint64_t v5 = 0x7FFFFFFFLL;
  }
  [v4 setIdiom:v5];
}

- (int64_t)_idiom
{
  char v3 = [(INIntent *)self _metadata];
  int v4 = [v3 hasIdiom];
  uint64_t v5 = [(INIntent *)self _metadata];
  uint64_t v6 = [v5 idiom] - 1;
  if (v6 <= 6) {
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

- (int64_t)_executionContext
{
  char v3 = [(INIntent *)self _metadata];
  int v4 = [v3 hasExecutionContext];
  uint64_t v5 = [(INIntent *)self _metadata];
  uint64_t v6 = [v5 executionContext] - 1;
  if (v6 <= 9) {
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

- (void)_setNanoLaunchId:(id)a3
{
  id v4 = a3;
  id v5 = [(INIntent *)self _metadata];
  [v5 setNanoLaunchId:v4];
}

- (NSString)_uiExtensionBundleId
{
  double v2 = [(INIntent *)self _metadata];
  char v3 = [v2 systemUIExtensionBundleId];

  return (NSString *)v3;
}

- (void)_setDefaultImage:(id)a3
{
  id v4 = a3;
  id v7 = [(INIntent *)self _metadata];
  id v5 = INIntentSlotValueTransformToImageValue(v4);

  if (v5)
  {
    [v7 setDefaultImageValue:v5];
  }
  else
  {
    uint64_t v6 = objc_alloc_init(_INPBImageValue);
    [v7 setDefaultImageValue:v6];
  }
}

uint64_t __29__INIntent__defaultImageName__block_invoke(uint64_t a1, void *a2)
{
  return [a2 intentCodableDescriptionWithIntentClassName:*(void *)(a1 + 32)];
}

- (NSString)intentId
{
  double v2 = [(INIntent *)self _metadata];
  char v3 = [v2 intentId];

  return (NSString *)v3;
}

- (NSString)utteranceString
{
  double v2 = [(INIntent *)self _metadata];
  char v3 = [v2 userUtterance];
  id v4 = INIntentSlotValueTransformFromString(v3);

  return (NSString *)v4;
}

- (NSString)typeName
{
  char v3 = [(INIntent *)self backingStore];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(INIntent *)self launchId];
    id v15 = 0;
    INExtractAppInfoFromSiriLaunchId(v5, &v15, 0);
    id v6 = v15;

    uint64_t v7 = [(INIntent *)self extensionBundleId];
    int64_t v8 = (void *)v7;
    if (v7) {
      unint64_t v9 = (void *)v7;
    }
    else {
      unint64_t v9 = v6;
    }
    id v10 = v9;

    if (!v10)
    {
      char v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v10 = [v11 bundleIdentifier];
    }
    uint64_t v12 = [(INIntent *)self _className];
    long long v13 = [NSString stringWithFormat:@"%@%@.%@", @"sirikit.intents.custom.", v10, v12];
  }
  else
  {
    long long v13 = [(id)objc_opt_class() typeName];
  }

  return (NSString *)v13;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_alloc_init((Class)a1);
  if (!v7) {
    goto LABEL_26;
  }
  int64_t v8 = objc_msgSend(v6, "intents_stringForKey:", @"identifier");
  [v7 setIdentifier:v8];

  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = __Block_byref_object_copy__90373;
  uint64_t v38 = __Block_byref_object_dispose__90374;
  id v39 = 0;
  unint64_t v9 = objc_msgSend(v6, "intents_safeObjectForKey:ofType:", @"backingStore", objc_opt_class());
  if (!v9)
  {
LABEL_8:
    char v11 = objc_msgSend(v6, "intents_safeObjectForKey:ofType:", @"parameterCombinations", objc_opt_class());
    if (v11)
    {
      id v15 = [MEMORY[0x1E4F1CA60] dictionary];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __56__INIntent_makeFromWidgetPlistableRepresentation_error___block_invoke;
      v30[3] = &unk_1E551C388;
      int v32 = &v34;
      long long v16 = v15;
      id v31 = v16;
      [v11 enumerateObjectsUsingBlock:v30];
      id v17 = (void *)v35[5];
      if (v17)
      {
        if (a4) {
          *a4 = v17;
        }
        int v13 = 1;
        id v18 = v31;
        goto LABEL_21;
      }
      id v19 = (void *)v7[5];
      void v7[5] = v16;
      __int16 v20 = v16;
    }
    v7[8] = objc_msgSend(v6, "intents_int64ForKey:", @"_indexingHash");
    objc_msgSend(v6, "intents_safeObjectForKey:ofType:", @"_parameterContexts", objc_opt_class());
    long long v16 = (INJSONDecoder *)(id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v21 = v16;
      }
      else {
        long long v21 = 0;
      }
    }
    else
    {
      long long v21 = 0;
    }
    uint64_t v22 = v21;

    long long v23 = [(INJSONDecoder *)v22 allKeys];
    uint64_t v24 = [v23 count];

    if (!v24)
    {
      int v13 = 0;
      goto LABEL_23;
    }
    id v18 = objc_alloc_init(INJSONDecoder);
    id v25 = [v7 _codableDescription];
    uint64_t v26 = +[INParameterContexts _intents_decodeWithJSONDecoder:v18 codableDescription:v25 from:v16];
    id v27 = (void *)v7[7];
    v7[7] = v26;

    int v13 = 0;
LABEL_21:

LABEL_23:
    goto LABEL_24;
  }
  id v10 = (id *)(v35 + 5);
  id obj = (id)v35[5];
  char v11 = +[INCodable makeFromWidgetPlistableRepresentation:v9 error:&obj];
  objc_storeStrong(v10, obj);
  uint64_t v12 = (void *)v35[5];
  if (!v12)
  {
    long long v14 = (void *)v7[12];
    v7[12] = v11;

    goto LABEL_8;
  }
  if (a4) {
    *a4 = v12;
  }
  int v13 = 1;
LABEL_24:

  _Block_object_dispose(&v34, 8);
  if (v13)
  {
    long long v28 = 0;
    goto LABEL_27;
  }
LABEL_26:
  long long v28 = v7;
LABEL_27:

  return v28;
}

void __56__INIntent_makeFromWidgetPlistableRepresentation_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__90373;
    void v17[4] = __Block_byref_object_dispose__90374;
    id v18 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__INIntent_makeFromWidgetPlistableRepresentation_error___block_invoke_2;
    v13[3] = &unk_1E551C360;
    unint64_t v9 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v15 = v17;
    uint64_t v16 = v8;
    id v14 = v9;
    [v7 enumerateObjectsUsingBlock:v13];

    _Block_object_dispose(v17, 8);
  }
  else
  {
    *a4 = 1;
    id v7 = [NSString stringWithFormat:@"Unable to decode parameter combinations: %@", v6];
    uint64_t v10 = INIntentError(8001, v7, *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

+ (id)typeName
{
  double v2 = INIntentSchemaGetIntentDescriptionWithFacadeClass((objc_class *)a1);
  uint64_t v3 = [v2 type];
  if (v3) {
    id v4 = (__CFString *)v3;
  }
  else {
    id v4 = @"GenericIntent";
  }

  return v4;
}

- (BOOL)_intents_hasSystemIntentHandler
{
  return 0;
}

- (BOOL)_intents_isExemptFromMulitWindowRequirementForInAppHandling
{
  return 0;
}

- (BOOL)_enumerateWithValueProcessingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(INIntent *)self backingStore];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v6 = INEnumerateObjectsInCodable(v5, v4);
  }
  else
  {

    char v6 = INEnumerateObjectsInIntentSlotComposing(self, v4);
  }

  return v6;
}

- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4
{
  id v5 = _INEnumerableValueProcessingBlock((uint64_t)a3, a4);
  LOBYTE(self) = [(INIntent *)self _enumerateWithValueProcessingBlock:v5];

  return (char)self;
}

@end