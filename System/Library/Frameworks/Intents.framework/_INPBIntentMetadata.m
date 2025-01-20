@interface _INPBIntentMetadata
+ (BOOL)supportsSecureCoding;
+ (Class)parameterImagesType;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)backgroundLaunch;
- (BOOL)bypassAppProtectionAuthentication;
- (BOOL)confirmed;
- (BOOL)endpointMediaPlaybackEnabled;
- (BOOL)hasAuditTokenData;
- (BOOL)hasBackgroundLaunch;
- (BOOL)hasBypassAppProtectionAuthentication;
- (BOOL)hasCategoryVerb;
- (BOOL)hasConfirmed;
- (BOOL)hasDefaultImageValue;
- (BOOL)hasEndpointId;
- (BOOL)hasEndpointMediaPlaybackEnabled;
- (BOOL)hasExecutionContext;
- (BOOL)hasIdiom;
- (BOOL)hasIntentCategory;
- (BOOL)hasIntentDescription;
- (BOOL)hasIntentId;
- (BOOL)hasIsOwnedByCurrentUser;
- (BOOL)hasIsPrimaryDisplayDisabled;
- (BOOL)hasLaunchId;
- (BOOL)hasMediaRouteId;
- (BOOL)hasMsLimitReached;
- (BOOL)hasNanoLaunchId;
- (BOOL)hasOriginatingDeviceIdsIdentifier;
- (BOOL)hasOriginatingDeviceRapportEffectiveId;
- (BOOL)hasOriginatingDeviceRapportMediaSystemId;
- (BOOL)hasPreferredAudioOutputRouteId;
- (BOOL)hasShowsWhenRun;
- (BOOL)hasSuggestedInvocationPhrase;
- (BOOL)hasSystemExtensionBundleId;
- (BOOL)hasSystemUIExtensionBundleId;
- (BOOL)hasTriggerMethod;
- (BOOL)hasUserConfirmationRequired;
- (BOOL)hasUserUtterance;
- (BOOL)hasVersioningHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOwnedByCurrentUser;
- (BOOL)isPrimaryDisplayDisabled;
- (BOOL)msLimitReached;
- (BOOL)readFrom:(id)a3;
- (BOOL)showsWhenRun;
- (BOOL)userConfirmationRequired;
- (NSArray)airPlayRouteIds;
- (NSArray)forceNeedsValueForParameters;
- (NSArray)parameterImages;
- (NSData)auditTokenData;
- (NSString)categoryVerb;
- (NSString)endpointId;
- (NSString)intentDescription;
- (NSString)intentId;
- (NSString)launchId;
- (NSString)mediaRouteId;
- (NSString)nanoLaunchId;
- (NSString)originatingDeviceIdsIdentifier;
- (NSString)originatingDeviceRapportEffectiveId;
- (NSString)originatingDeviceRapportMediaSystemId;
- (NSString)preferredAudioOutputRouteId;
- (NSString)suggestedInvocationPhrase;
- (NSString)systemExtensionBundleId;
- (NSString)systemUIExtensionBundleId;
- (_INPBImageValue)defaultImageValue;
- (_INPBIntentMetadata)initWithCoder:(id)a3;
- (_INPBString)userUtterance;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)airPlayRouteIdsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)executionContextAsString:(int)a3;
- (id)forceNeedsValueForParameterAtIndex:(unint64_t)a3;
- (id)idiomAsString:(int)a3;
- (id)intentCategoryAsString:(int)a3;
- (id)parameterImagesAtIndex:(unint64_t)a3;
- (id)requiredEntitlementsAsString:(int)a3;
- (id)shortcutAvailabilitiesAsString:(int)a3;
- (id)triggerMethodAsString:(int)a3;
- (int)StringAsExecutionContext:(id)a3;
- (int)StringAsIdiom:(id)a3;
- (int)StringAsIntentCategory:(id)a3;
- (int)StringAsRequiredEntitlements:(id)a3;
- (int)StringAsShortcutAvailabilities:(id)a3;
- (int)StringAsTriggerMethod:(id)a3;
- (int)executionContext;
- (int)idiom;
- (int)intentCategory;
- (int)requiredEntitlementAtIndex:(unint64_t)a3;
- (int)requiredEntitlements;
- (int)shortcutAvailabilities;
- (int)shortcutAvailabilityAtIndex:(unint64_t)a3;
- (int)triggerMethod;
- (unint64_t)airPlayRouteIdsCount;
- (unint64_t)forceNeedsValueForParametersCount;
- (unint64_t)hash;
- (unint64_t)parameterImagesCount;
- (unint64_t)requiredEntitlementsCount;
- (unint64_t)shortcutAvailabilitiesCount;
- (unint64_t)versioningHash;
- (void)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (void)addAirPlayRouteIds:(id)a3;
- (void)addForceNeedsValueForParameter:(id)a3;
- (void)addParameterImages:(id)a3;
- (void)addRequiredEntitlement:(int)a3;
- (void)addShortcutAvailability:(int)a3;
- (void)clearAirPlayRouteIds;
- (void)clearForceNeedsValueForParameters;
- (void)clearParameterImages;
- (void)clearRequiredEntitlements;
- (void)clearShortcutAvailabilities;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAirPlayRouteIds:(id)a3;
- (void)setAuditTokenData:(id)a3;
- (void)setBackgroundLaunch:(BOOL)a3;
- (void)setBypassAppProtectionAuthentication:(BOOL)a3;
- (void)setCategoryVerb:(id)a3;
- (void)setConfirmed:(BOOL)a3;
- (void)setDefaultImageValue:(id)a3;
- (void)setEndpointId:(id)a3;
- (void)setEndpointMediaPlaybackEnabled:(BOOL)a3;
- (void)setExecutionContext:(int)a3;
- (void)setForceNeedsValueForParameters:(id)a3;
- (void)setHasBackgroundLaunch:(BOOL)a3;
- (void)setHasBypassAppProtectionAuthentication:(BOOL)a3;
- (void)setHasConfirmed:(BOOL)a3;
- (void)setHasEndpointMediaPlaybackEnabled:(BOOL)a3;
- (void)setHasExecutionContext:(BOOL)a3;
- (void)setHasIdiom:(BOOL)a3;
- (void)setHasIntentCategory:(BOOL)a3;
- (void)setHasIsOwnedByCurrentUser:(BOOL)a3;
- (void)setHasIsPrimaryDisplayDisabled:(BOOL)a3;
- (void)setHasMsLimitReached:(BOOL)a3;
- (void)setHasShowsWhenRun:(BOOL)a3;
- (void)setHasTriggerMethod:(BOOL)a3;
- (void)setHasUserConfirmationRequired:(BOOL)a3;
- (void)setHasVersioningHash:(BOOL)a3;
- (void)setIdiom:(int)a3;
- (void)setIntentCategory:(int)a3;
- (void)setIntentDescription:(id)a3;
- (void)setIntentId:(id)a3;
- (void)setIsOwnedByCurrentUser:(BOOL)a3;
- (void)setIsPrimaryDisplayDisabled:(BOOL)a3;
- (void)setLaunchId:(id)a3;
- (void)setMediaRouteId:(id)a3;
- (void)setMsLimitReached:(BOOL)a3;
- (void)setNanoLaunchId:(id)a3;
- (void)setOriginatingDeviceIdsIdentifier:(id)a3;
- (void)setOriginatingDeviceRapportEffectiveId:(id)a3;
- (void)setOriginatingDeviceRapportMediaSystemId:(id)a3;
- (void)setParameterImages:(id)a3;
- (void)setPreferredAudioOutputRouteId:(id)a3;
- (void)setRequiredEntitlements:(int *)a3 count:(unint64_t)a4;
- (void)setShortcutAvailabilities:(int *)a3 count:(unint64_t)a4;
- (void)setShowsWhenRun:(BOOL)a3;
- (void)setSuggestedInvocationPhrase:(id)a3;
- (void)setSystemExtensionBundleId:(id)a3;
- (void)setSystemUIExtensionBundleId:(id)a3;
- (void)setTriggerMethod:(int)a3;
- (void)setUserConfirmationRequired:(BOOL)a3;
- (void)setUserUtterance:(id)a3;
- (void)setVersioningHash:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBIntentMetadata

- (void)dealloc
{
  [(_INPBIntentMetadata *)self clearRequiredEntitlements];
  [(_INPBIntentMetadata *)self clearShortcutAvailabilities];
  v3.receiver = self;
  v3.super_class = (Class)_INPBIntentMetadata;
  [(_INPBIntentMetadata *)&v3 dealloc];
}

- (void)clearShortcutAvailabilities
{
}

- (void)clearRequiredEntitlements
{
}

- (void)writeTo:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_INPBIntentMetadata *)self categoryVerb];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(_INPBIntentMetadata *)self defaultImageValue];

  if (v6)
  {
    v7 = [(_INPBIntentMetadata *)self defaultImageValue];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBIntentMetadata *)self hasExecutionContext]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBIntentMetadata *)self hasIntentCategory]) {
    PBDataWriterWriteInt32Field();
  }
  v8 = [(_INPBIntentMetadata *)self launchId];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  v9 = [(_INPBIntentMetadata *)self nanoLaunchId];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  if (self->_requiredEntitlements.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v10;
    }
    while (v10 < self->_requiredEntitlements.count);
  }
  v11 = [(_INPBIntentMetadata *)self systemExtensionBundleId];

  if (v11) {
    PBDataWriterWriteStringField();
  }
  v12 = [(_INPBIntentMetadata *)self systemUIExtensionBundleId];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v13 = self->_airPlayRouteIds;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v50;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v50 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteStringField();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v15);
  }

  v18 = [(_INPBIntentMetadata *)self auditTokenData];

  if (v18) {
    PBDataWriterWriteDataField();
  }
  if ([(_INPBIntentMetadata *)self hasBackgroundLaunch]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBIntentMetadata *)self hasBypassAppProtectionAuthentication]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBIntentMetadata *)self hasConfirmed]) {
    PBDataWriterWriteBOOLField();
  }
  v19 = [(_INPBIntentMetadata *)self endpointId];

  if (v19) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBIntentMetadata *)self hasEndpointMediaPlaybackEnabled]) {
    PBDataWriterWriteBOOLField();
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v20 = self->_forceNeedsValueForParameters;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v46;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v46 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v22);
  }

  if ([(_INPBIntentMetadata *)self hasIdiom]) {
    PBDataWriterWriteInt32Field();
  }
  v25 = [(_INPBIntentMetadata *)self intentDescription];

  if (v25) {
    PBDataWriterWriteStringField();
  }
  v26 = [(_INPBIntentMetadata *)self intentId];

  if (v26) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBIntentMetadata *)self hasIsOwnedByCurrentUser]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBIntentMetadata *)self hasIsPrimaryDisplayDisabled]) {
    PBDataWriterWriteBOOLField();
  }
  v27 = [(_INPBIntentMetadata *)self mediaRouteId];

  if (v27) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBIntentMetadata *)self hasMsLimitReached]) {
    PBDataWriterWriteBOOLField();
  }
  v28 = [(_INPBIntentMetadata *)self originatingDeviceIdsIdentifier];

  if (v28) {
    PBDataWriterWriteStringField();
  }
  v29 = [(_INPBIntentMetadata *)self originatingDeviceRapportEffectiveId];

  if (v29) {
    PBDataWriterWriteStringField();
  }
  v30 = [(_INPBIntentMetadata *)self originatingDeviceRapportMediaSystemId];

  if (v30) {
    PBDataWriterWriteStringField();
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v31 = self->_parameterImages;
  uint64_t v32 = [(NSArray *)v31 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v42;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v42 != v34) {
          objc_enumerationMutation(v31);
        }
        PBDataWriterWriteSubmessage();
        ++v35;
      }
      while (v33 != v35);
      uint64_t v33 = [(NSArray *)v31 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v33);
  }

  v36 = [(_INPBIntentMetadata *)self preferredAudioOutputRouteId];

  if (v36) {
    PBDataWriterWriteStringField();
  }
  if (self->_shortcutAvailabilities.count)
  {
    unint64_t v37 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v37;
    }
    while (v37 < self->_shortcutAvailabilities.count);
  }
  if ([(_INPBIntentMetadata *)self hasShowsWhenRun]) {
    PBDataWriterWriteBOOLField();
  }
  v38 = [(_INPBIntentMetadata *)self suggestedInvocationPhrase];

  if (v38) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBIntentMetadata *)self hasTriggerMethod]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBIntentMetadata *)self hasUserConfirmationRequired]) {
    PBDataWriterWriteBOOLField();
  }
  v39 = [(_INPBIntentMetadata *)self userUtterance];

  if (v39)
  {
    v40 = [(_INPBIntentMetadata *)self userUtterance];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBIntentMetadata *)self hasVersioningHash]) {
    PBDataWriterWriteUint64Field();
  }
}

- (NSString)launchId
{
  return self->_launchId;
}

- (NSString)systemExtensionBundleId
{
  return self->_systemExtensionBundleId;
}

- (BOOL)hasIntentCategory
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (NSString)categoryVerb
{
  return self->_categoryVerb;
}

- (NSString)suggestedInvocationPhrase
{
  return self->_suggestedInvocationPhrase;
}

- (_INPBImageValue)defaultImageValue
{
  return self->_defaultImageValue;
}

- (_INPBString)userUtterance
{
  return self->_userUtterance;
}

- (NSString)systemUIExtensionBundleId
{
  return self->_systemUIExtensionBundleId;
}

- (NSString)preferredAudioOutputRouteId
{
  return self->_preferredAudioOutputRouteId;
}

- (NSString)originatingDeviceRapportMediaSystemId
{
  return self->_originatingDeviceRapportMediaSystemId;
}

- (NSString)originatingDeviceRapportEffectiveId
{
  return self->_originatingDeviceRapportEffectiveId;
}

- (NSString)originatingDeviceIdsIdentifier
{
  return self->_originatingDeviceIdsIdentifier;
}

- (NSString)nanoLaunchId
{
  return self->_nanoLaunchId;
}

- (NSString)mediaRouteId
{
  return self->_mediaRouteId;
}

- (NSString)intentId
{
  return self->_intentId;
}

- (NSString)intentDescription
{
  return self->_intentDescription;
}

- (BOOL)hasVersioningHash
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasUserConfirmationRequired
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasTriggerMethod
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasShowsWhenRun
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasMsLimitReached
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasIsPrimaryDisplayDisabled
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasIsOwnedByCurrentUser
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasIdiom
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasExecutionContext
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasEndpointMediaPlaybackEnabled
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasConfirmed
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasBypassAppProtectionAuthentication
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasBackgroundLaunch
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (NSString)endpointId
{
  return self->_endpointId;
}

- (NSData)auditTokenData
{
  return self->_auditTokenData;
}

- (void)setDefaultImageValue:(id)a3
{
}

- (int)intentCategory
{
  return self->_intentCategory;
}

- (void)setVersioningHash:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_versioningHash = a3;
}

- (void)setUserConfirmationRequired:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_userConfirmationRequired = a3;
}

- (void)setLaunchId:(id)a3
{
  self->_launchId = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setIntentCategory:(int)a3
{
  __int16 has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->___int16 has = has & 0xFFFD;
  }
  else
  {
    *(_WORD *)&self->___int16 has = has | 2;
    self->_intentCategory = a3;
  }
}

- (void)setCategoryVerb:(id)a3
{
  self->_categoryVerb = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentMetadataReadFrom(self, (uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userUtterance, 0);
  objc_storeStrong((id *)&self->_suggestedInvocationPhrase, 0);
  objc_storeStrong((id *)&self->_preferredAudioOutputRouteId, 0);
  objc_storeStrong((id *)&self->_parameterImages, 0);
  objc_storeStrong((id *)&self->_originatingDeviceRapportMediaSystemId, 0);
  objc_storeStrong((id *)&self->_originatingDeviceRapportEffectiveId, 0);
  objc_storeStrong((id *)&self->_originatingDeviceIdsIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaRouteId, 0);
  objc_storeStrong((id *)&self->_intentId, 0);
  objc_storeStrong((id *)&self->_intentDescription, 0);
  objc_storeStrong((id *)&self->_forceNeedsValueForParameters, 0);
  objc_storeStrong((id *)&self->_endpointId, 0);
  objc_storeStrong((id *)&self->_auditTokenData, 0);
  objc_storeStrong((id *)&self->_airPlayRouteIds, 0);
  objc_storeStrong((id *)&self->_systemUIExtensionBundleId, 0);
  objc_storeStrong((id *)&self->_systemExtensionBundleId, 0);
  objc_storeStrong((id *)&self->_nanoLaunchId, 0);
  objc_storeStrong((id *)&self->_launchId, 0);
  objc_storeStrong((id *)&self->_defaultImageValue, 0);

  objc_storeStrong((id *)&self->_categoryVerb, 0);
}

- (NSArray)parameterImages
{
  return self->_parameterImages;
}

- (void)setSuggestedInvocationPhrase:(id)a3
{
  self->_suggestedInvocationPhrase = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setSystemExtensionBundleId:(id)a3
{
  self->_systemExtensionBundleId = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (unint64_t)versioningHash
{
  return self->_versioningHash;
}

- (BOOL)userConfirmationRequired
{
  return self->_userConfirmationRequired;
}

- (int)triggerMethod
{
  return self->_triggerMethod;
}

- (BOOL)showsWhenRun
{
  return self->_showsWhenRun;
}

- (BOOL)msLimitReached
{
  return self->_msLimitReached;
}

- (BOOL)isPrimaryDisplayDisabled
{
  return self->_isPrimaryDisplayDisabled;
}

- (BOOL)isOwnedByCurrentUser
{
  return self->_isOwnedByCurrentUser;
}

- (int)idiom
{
  return self->_idiom;
}

- (NSArray)forceNeedsValueForParameters
{
  return self->_forceNeedsValueForParameters;
}

- (BOOL)endpointMediaPlaybackEnabled
{
  return self->_endpointMediaPlaybackEnabled;
}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (BOOL)bypassAppProtectionAuthentication
{
  return self->_bypassAppProtectionAuthentication;
}

- (BOOL)backgroundLaunch
{
  return self->_backgroundLaunch;
}

- (NSArray)airPlayRouteIds
{
  return self->_airPlayRouteIds;
}

- (int)executionContext
{
  return self->_executionContext;
}

- (id)dictionaryRepresentation
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_categoryVerb)
  {
    id v4 = [(_INPBIntentMetadata *)self categoryVerb];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"_categoryVerb"];
  }
  v6 = [(_INPBIntentMetadata *)self defaultImageValue];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"_defaultImageValue"];

  if ([(_INPBIntentMetadata *)self hasExecutionContext])
  {
    uint64_t v8 = [(_INPBIntentMetadata *)self executionContext];
    if ((v8 - 1) >= 0xA)
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
    }
    else
    {
      v9 = *(&off_1E5516988 + (v8 - 1));
    }
    [v3 setObject:v9 forKeyedSubscript:@"_executionContext"];
  }
  if ([(_INPBIntentMetadata *)self hasIntentCategory])
  {
    uint64_t v10 = [(_INPBIntentMetadata *)self intentCategory];
    unsigned int v11 = v10 - 1;
    if (v10 - 1) < 0x15 && ((0x1FFDFFu >> v11))
    {
      v12 = *(&off_1E55169D8 + v11);
    }
    else
    {
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
    }
    [v3 setObject:v12 forKeyedSubscript:@"_intentCategory"];
  }
  if (self->_launchId)
  {
    v13 = [(_INPBIntentMetadata *)self launchId];
    uint64_t v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"_launchId"];
  }
  if (self->_nanoLaunchId)
  {
    uint64_t v15 = [(_INPBIntentMetadata *)self nanoLaunchId];
    uint64_t v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"_nanoLaunchId"];
  }
  if (self->_requiredEntitlements.count)
  {
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBIntentMetadata requiredEntitlementsCount](self, "requiredEntitlementsCount"));
    if ([(_INPBIntentMetadata *)self requiredEntitlementsCount])
    {
      unint64_t v18 = 0;
      do
      {
        int v19 = self->_requiredEntitlements.list[v18];
        if (v19 == 1)
        {
          v20 = @"CONTACTS";
        }
        else if (v19 == 2)
        {
          v20 = @"LOCATION";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_requiredEntitlements.list[v18]);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        [v17 addObject:v20];

        ++v18;
      }
      while (v18 < [(_INPBIntentMetadata *)self requiredEntitlementsCount]);
    }
    [v3 setObject:v17 forKeyedSubscript:@"_requiredEntitlement"];
  }
  if (self->_systemExtensionBundleId)
  {
    uint64_t v21 = [(_INPBIntentMetadata *)self systemExtensionBundleId];
    uint64_t v22 = (void *)[v21 copy];
    [v3 setObject:v22 forKeyedSubscript:@"_systemExtensionBundleId"];
  }
  if (self->_systemUIExtensionBundleId)
  {
    uint64_t v23 = [(_INPBIntentMetadata *)self systemUIExtensionBundleId];
    uint64_t v24 = (void *)[v23 copy];
    [v3 setObject:v24 forKeyedSubscript:@"_systemUIExtensionBundleId"];
  }
  if (self->_airPlayRouteIds)
  {
    v25 = [(_INPBIntentMetadata *)self airPlayRouteIds];
    v26 = (void *)[v25 copy];
    [v3 setObject:v26 forKeyedSubscript:@"airPlayRouteIds"];
  }
  if (self->_auditTokenData)
  {
    v27 = [(_INPBIntentMetadata *)self auditTokenData];
    v28 = (void *)[v27 copy];
    [v3 setObject:v28 forKeyedSubscript:@"auditTokenData"];
  }
  if ([(_INPBIntentMetadata *)self hasBackgroundLaunch])
  {
    v29 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBIntentMetadata backgroundLaunch](self, "backgroundLaunch"));
    [v3 setObject:v29 forKeyedSubscript:@"backgroundLaunch"];
  }
  if ([(_INPBIntentMetadata *)self hasBypassAppProtectionAuthentication])
  {
    v30 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBIntentMetadata bypassAppProtectionAuthentication](self, "bypassAppProtectionAuthentication"));
    [v3 setObject:v30 forKeyedSubscript:@"bypassAppProtectionAuthentication"];
  }
  if ([(_INPBIntentMetadata *)self hasConfirmed])
  {
    v31 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBIntentMetadata confirmed](self, "confirmed"));
    [v3 setObject:v31 forKeyedSubscript:@"confirmed"];
  }
  if (self->_endpointId)
  {
    uint64_t v32 = [(_INPBIntentMetadata *)self endpointId];
    uint64_t v33 = (void *)[v32 copy];
    [v3 setObject:v33 forKeyedSubscript:@"endpointId"];
  }
  if ([(_INPBIntentMetadata *)self hasEndpointMediaPlaybackEnabled])
  {
    uint64_t v34 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBIntentMetadata endpointMediaPlaybackEnabled](self, "endpointMediaPlaybackEnabled"));
    [v3 setObject:v34 forKeyedSubscript:@"endpointMediaPlaybackEnabled"];
  }
  if (self->_forceNeedsValueForParameters)
  {
    uint64_t v35 = [(_INPBIntentMetadata *)self forceNeedsValueForParameters];
    v36 = (void *)[v35 copy];
    [v3 setObject:v36 forKeyedSubscript:@"forceNeedsValueForParameter"];
  }
  if ([(_INPBIntentMetadata *)self hasIdiom])
  {
    uint64_t v37 = [(_INPBIntentMetadata *)self idiom];
    if ((v37 - 1) >= 7)
    {
      v38 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v37);
    }
    else
    {
      v38 = *(&off_1E5516A80 + (v37 - 1));
    }
    [v3 setObject:v38 forKeyedSubscript:@"idiom"];
  }
  if (self->_intentDescription)
  {
    v39 = [(_INPBIntentMetadata *)self intentDescription];
    v40 = (void *)[v39 copy];
    [v3 setObject:v40 forKeyedSubscript:@"intentDescription"];
  }
  if (self->_intentId)
  {
    long long v41 = [(_INPBIntentMetadata *)self intentId];
    long long v42 = (void *)[v41 copy];
    [v3 setObject:v42 forKeyedSubscript:@"intent_id"];
  }
  if ([(_INPBIntentMetadata *)self hasIsOwnedByCurrentUser])
  {
    long long v43 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBIntentMetadata isOwnedByCurrentUser](self, "isOwnedByCurrentUser"));
    [v3 setObject:v43 forKeyedSubscript:@"isOwnedByCurrentUser"];
  }
  if ([(_INPBIntentMetadata *)self hasIsPrimaryDisplayDisabled])
  {
    long long v44 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBIntentMetadata isPrimaryDisplayDisabled](self, "isPrimaryDisplayDisabled"));
    [v3 setObject:v44 forKeyedSubscript:@"isPrimaryDisplayDisabled"];
  }
  if (self->_mediaRouteId)
  {
    long long v45 = [(_INPBIntentMetadata *)self mediaRouteId];
    long long v46 = (void *)[v45 copy];
    [v3 setObject:v46 forKeyedSubscript:@"mediaRouteId"];
  }
  if ([(_INPBIntentMetadata *)self hasMsLimitReached])
  {
    long long v47 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBIntentMetadata msLimitReached](self, "msLimitReached"));
    [v3 setObject:v47 forKeyedSubscript:@"msLimitReached"];
  }
  if (self->_originatingDeviceIdsIdentifier)
  {
    long long v48 = [(_INPBIntentMetadata *)self originatingDeviceIdsIdentifier];
    long long v49 = (void *)[v48 copy];
    [v3 setObject:v49 forKeyedSubscript:@"originatingDeviceIdsIdentifier"];
  }
  if (self->_originatingDeviceRapportEffectiveId)
  {
    long long v50 = [(_INPBIntentMetadata *)self originatingDeviceRapportEffectiveId];
    long long v51 = (void *)[v50 copy];
    [v3 setObject:v51 forKeyedSubscript:@"originatingDeviceRapportEffectiveId"];
  }
  if (self->_originatingDeviceRapportMediaSystemId)
  {
    long long v52 = [(_INPBIntentMetadata *)self originatingDeviceRapportMediaSystemId];
    v53 = (void *)[v52 copy];
    [v3 setObject:v53 forKeyedSubscript:@"originatingDeviceRapportMediaSystemId"];
  }
  if ([(NSArray *)self->_parameterImages count])
  {
    v54 = [MEMORY[0x1E4F1CA48] array];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v55 = self->_parameterImages;
    uint64_t v56 = [(NSArray *)v55 countByEnumeratingWithState:&v78 objects:v82 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v57; ++i)
        {
          if (*(void *)v79 != v58) {
            objc_enumerationMutation(v55);
          }
          v60 = [*(id *)(*((void *)&v78 + 1) + 8 * i) dictionaryRepresentation];
          [v54 addObject:v60];
        }
        uint64_t v57 = [(NSArray *)v55 countByEnumeratingWithState:&v78 objects:v82 count:16];
      }
      while (v57);
    }

    [v3 setObject:v54 forKeyedSubscript:@"parameterImages"];
  }
  if (self->_preferredAudioOutputRouteId)
  {
    v61 = [(_INPBIntentMetadata *)self preferredAudioOutputRouteId];
    v62 = (void *)[v61 copy];
    [v3 setObject:v62 forKeyedSubscript:@"preferredAudioOutputRouteId"];
  }
  if (self->_shortcutAvailabilities.count)
  {
    v63 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBIntentMetadata shortcutAvailabilitiesCount](self, "shortcutAvailabilitiesCount"));
    if ([(_INPBIntentMetadata *)self shortcutAvailabilitiesCount])
    {
      unint64_t v64 = 0;
      do
      {
        uint64_t v65 = self->_shortcutAvailabilities.list[v64];
        if (v65 >= 7)
        {
          v66 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_shortcutAvailabilities.list[v64]);
        }
        else
        {
          v66 = *(&off_1E5516AB8 + v65);
        }
        [v63 addObject:v66];

        ++v64;
      }
      while (v64 < [(_INPBIntentMetadata *)self shortcutAvailabilitiesCount]);
    }
    [v3 setObject:v63 forKeyedSubscript:@"shortcutAvailability"];
  }
  if ([(_INPBIntentMetadata *)self hasShowsWhenRun])
  {
    v67 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBIntentMetadata showsWhenRun](self, "showsWhenRun"));
    [v3 setObject:v67 forKeyedSubscript:@"showsWhenRun"];
  }
  if (self->_suggestedInvocationPhrase)
  {
    v68 = [(_INPBIntentMetadata *)self suggestedInvocationPhrase];
    v69 = (void *)[v68 copy];
    [v3 setObject:v69 forKeyedSubscript:@"suggestedInvocationPhrase"];
  }
  if ([(_INPBIntentMetadata *)self hasTriggerMethod])
  {
    uint64_t v70 = [(_INPBIntentMetadata *)self triggerMethod];
    if ((int)v70 > 19)
    {
      if (v70 == 20)
      {
        v71 = @"RemoteButton";
        goto LABEL_105;
      }
      if (v70 == 30)
      {
        v71 = @"VoiceTrigger";
        goto LABEL_105;
      }
    }
    else
    {
      if (!v70)
      {
        v71 = @"Other";
        goto LABEL_105;
      }
      if (v70 == 10)
      {
        v71 = @"HomeButton";
LABEL_105:
        [v3 setObject:v71 forKeyedSubscript:@"triggerMethod"];

        goto LABEL_106;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v70);
    v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_105;
  }
LABEL_106:
  if ([(_INPBIntentMetadata *)self hasUserConfirmationRequired])
  {
    v72 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBIntentMetadata userConfirmationRequired](self, "userConfirmationRequired"));
    [v3 setObject:v72 forKeyedSubscript:@"userConfirmationRequired"];
  }
  v73 = [(_INPBIntentMetadata *)self userUtterance];
  v74 = [v73 dictionaryRepresentation];
  [v3 setObject:v74 forKeyedSubscript:@"userUtterance"];

  if ([(_INPBIntentMetadata *)self hasVersioningHash])
  {
    v75 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_INPBIntentMetadata versioningHash](self, "versioningHash"));
    [v3 setObject:v75 forKeyedSubscript:@"versioningHash"];
  }
  id v76 = v3;

  return v76;
}

- (unint64_t)hash
{
  NSUInteger v39 = [(NSString *)self->_categoryVerb hash];
  unint64_t v38 = [(_INPBImageValue *)self->_defaultImageValue hash];
  if ([(_INPBIntentMetadata *)self hasExecutionContext]) {
    uint64_t v37 = 2654435761 * self->_executionContext;
  }
  else {
    uint64_t v37 = 0;
  }
  if ([(_INPBIntentMetadata *)self hasIntentCategory]) {
    uint64_t v36 = 2654435761 * self->_intentCategory;
  }
  else {
    uint64_t v36 = 0;
  }
  NSUInteger v35 = [(NSString *)self->_launchId hash];
  NSUInteger v34 = [(NSString *)self->_nanoLaunchId hash];
  uint64_t v33 = PBRepeatedInt32Hash();
  NSUInteger v32 = [(NSString *)self->_systemExtensionBundleId hash];
  NSUInteger v31 = [(NSString *)self->_systemUIExtensionBundleId hash];
  uint64_t v30 = [(NSArray *)self->_airPlayRouteIds hash];
  uint64_t v29 = [(NSData *)self->_auditTokenData hash];
  if ([(_INPBIntentMetadata *)self hasBackgroundLaunch]) {
    uint64_t v28 = 2654435761 * self->_backgroundLaunch;
  }
  else {
    uint64_t v28 = 0;
  }
  if ([(_INPBIntentMetadata *)self hasBypassAppProtectionAuthentication]) {
    uint64_t v27 = 2654435761 * self->_bypassAppProtectionAuthentication;
  }
  else {
    uint64_t v27 = 0;
  }
  if ([(_INPBIntentMetadata *)self hasConfirmed]) {
    uint64_t v26 = 2654435761 * self->_confirmed;
  }
  else {
    uint64_t v26 = 0;
  }
  NSUInteger v25 = [(NSString *)self->_endpointId hash];
  if ([(_INPBIntentMetadata *)self hasEndpointMediaPlaybackEnabled]) {
    uint64_t v24 = 2654435761 * self->_endpointMediaPlaybackEnabled;
  }
  else {
    uint64_t v24 = 0;
  }
  uint64_t v23 = [(NSArray *)self->_forceNeedsValueForParameters hash];
  if ([(_INPBIntentMetadata *)self hasIdiom]) {
    uint64_t v22 = 2654435761 * self->_idiom;
  }
  else {
    uint64_t v22 = 0;
  }
  NSUInteger v21 = [(NSString *)self->_intentDescription hash];
  NSUInteger v20 = [(NSString *)self->_intentId hash];
  if ([(_INPBIntentMetadata *)self hasIsOwnedByCurrentUser]) {
    uint64_t v19 = 2654435761 * self->_isOwnedByCurrentUser;
  }
  else {
    uint64_t v19 = 0;
  }
  if ([(_INPBIntentMetadata *)self hasIsPrimaryDisplayDisabled]) {
    uint64_t v18 = 2654435761 * self->_isPrimaryDisplayDisabled;
  }
  else {
    uint64_t v18 = 0;
  }
  NSUInteger v17 = [(NSString *)self->_mediaRouteId hash];
  if ([(_INPBIntentMetadata *)self hasMsLimitReached]) {
    uint64_t v16 = 2654435761 * self->_msLimitReached;
  }
  else {
    uint64_t v16 = 0;
  }
  NSUInteger v15 = [(NSString *)self->_originatingDeviceIdsIdentifier hash];
  NSUInteger v14 = [(NSString *)self->_originatingDeviceRapportEffectiveId hash];
  NSUInteger v13 = [(NSString *)self->_originatingDeviceRapportMediaSystemId hash];
  uint64_t v3 = [(NSArray *)self->_parameterImages hash];
  NSUInteger v4 = [(NSString *)self->_preferredAudioOutputRouteId hash];
  uint64_t v5 = PBRepeatedInt32Hash();
  if ([(_INPBIntentMetadata *)self hasShowsWhenRun]) {
    uint64_t v6 = 2654435761 * self->_showsWhenRun;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_suggestedInvocationPhrase hash];
  if ([(_INPBIntentMetadata *)self hasTriggerMethod]) {
    uint64_t v8 = 2654435761 * self->_triggerMethod;
  }
  else {
    uint64_t v8 = 0;
  }
  if ([(_INPBIntentMetadata *)self hasUserConfirmationRequired]) {
    uint64_t v9 = 2654435761 * self->_userConfirmationRequired;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = [(_INPBString *)self->_userUtterance hash];
  if ([(_INPBIntentMetadata *)self hasVersioningHash]) {
    unint64_t v11 = 2654435761u * self->_versioningHash;
  }
  else {
    unint64_t v11 = 0;
  }
  return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_156;
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self categoryVerb];
  uint64_t v6 = [v4 categoryVerb];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v7 = [(_INPBIntentMetadata *)self categoryVerb];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBIntentMetadata *)self categoryVerb];
    unint64_t v10 = [v4 categoryVerb];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self defaultImageValue];
  uint64_t v6 = [v4 defaultImageValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v12 = [(_INPBIntentMetadata *)self defaultImageValue];
  if (v12)
  {
    NSUInteger v13 = (void *)v12;
    NSUInteger v14 = [(_INPBIntentMetadata *)self defaultImageValue];
    NSUInteger v15 = [v4 defaultImageValue];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  int v17 = [(_INPBIntentMetadata *)self hasExecutionContext];
  if (v17 != [v4 hasExecutionContext]) {
    goto LABEL_156;
  }
  if ([(_INPBIntentMetadata *)self hasExecutionContext])
  {
    if ([v4 hasExecutionContext])
    {
      int executionContext = self->_executionContext;
      if (executionContext != [v4 executionContext]) {
        goto LABEL_156;
      }
    }
  }
  int v19 = [(_INPBIntentMetadata *)self hasIntentCategory];
  if (v19 != [v4 hasIntentCategory]) {
    goto LABEL_156;
  }
  if ([(_INPBIntentMetadata *)self hasIntentCategory])
  {
    if ([v4 hasIntentCategory])
    {
      int intentCategory = self->_intentCategory;
      if (intentCategory != [v4 intentCategory]) {
        goto LABEL_156;
      }
    }
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self launchId];
  uint64_t v6 = [v4 launchId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v21 = [(_INPBIntentMetadata *)self launchId];
  if (v21)
  {
    uint64_t v22 = (void *)v21;
    uint64_t v23 = [(_INPBIntentMetadata *)self launchId];
    uint64_t v24 = [v4 launchId];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self nanoLaunchId];
  uint64_t v6 = [v4 nanoLaunchId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v26 = [(_INPBIntentMetadata *)self nanoLaunchId];
  if (v26)
  {
    uint64_t v27 = (void *)v26;
    uint64_t v28 = [(_INPBIntentMetadata *)self nanoLaunchId];
    uint64_t v29 = [v4 nanoLaunchId];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_156;
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self systemExtensionBundleId];
  uint64_t v6 = [v4 systemExtensionBundleId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v31 = [(_INPBIntentMetadata *)self systemExtensionBundleId];
  if (v31)
  {
    NSUInteger v32 = (void *)v31;
    uint64_t v33 = [(_INPBIntentMetadata *)self systemExtensionBundleId];
    NSUInteger v34 = [v4 systemExtensionBundleId];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self systemUIExtensionBundleId];
  uint64_t v6 = [v4 systemUIExtensionBundleId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v36 = [(_INPBIntentMetadata *)self systemUIExtensionBundleId];
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    unint64_t v38 = [(_INPBIntentMetadata *)self systemUIExtensionBundleId];
    NSUInteger v39 = [v4 systemUIExtensionBundleId];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self airPlayRouteIds];
  uint64_t v6 = [v4 airPlayRouteIds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v41 = [(_INPBIntentMetadata *)self airPlayRouteIds];
  if (v41)
  {
    long long v42 = (void *)v41;
    long long v43 = [(_INPBIntentMetadata *)self airPlayRouteIds];
    long long v44 = [v4 airPlayRouteIds];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self auditTokenData];
  uint64_t v6 = [v4 auditTokenData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v46 = [(_INPBIntentMetadata *)self auditTokenData];
  if (v46)
  {
    long long v47 = (void *)v46;
    long long v48 = [(_INPBIntentMetadata *)self auditTokenData];
    long long v49 = [v4 auditTokenData];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  int v51 = [(_INPBIntentMetadata *)self hasBypassAppProtectionAuthentication];
  if (v51 != [v4 hasBypassAppProtectionAuthentication]) {
    goto LABEL_156;
  }
  if ([(_INPBIntentMetadata *)self hasBypassAppProtectionAuthentication])
  {
    if ([v4 hasBypassAppProtectionAuthentication])
    {
      int bypassAppProtectionAuthentication = self->_bypassAppProtectionAuthentication;
      if (bypassAppProtectionAuthentication != [v4 bypassAppProtectionAuthentication]) {
        goto LABEL_156;
      }
    }
  }
  int v53 = [(_INPBIntentMetadata *)self hasBackgroundLaunch];
  if (v53 != [v4 hasBackgroundLaunch]) {
    goto LABEL_156;
  }
  if ([(_INPBIntentMetadata *)self hasBackgroundLaunch])
  {
    if ([v4 hasBackgroundLaunch])
    {
      int backgroundLaunch = self->_backgroundLaunch;
      if (backgroundLaunch != [v4 backgroundLaunch]) {
        goto LABEL_156;
      }
    }
  }
  int v55 = [(_INPBIntentMetadata *)self hasConfirmed];
  if (v55 != [v4 hasConfirmed]) {
    goto LABEL_156;
  }
  if ([(_INPBIntentMetadata *)self hasConfirmed])
  {
    if ([v4 hasConfirmed])
    {
      int confirmed = self->_confirmed;
      if (confirmed != [v4 confirmed]) {
        goto LABEL_156;
      }
    }
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self endpointId];
  uint64_t v6 = [v4 endpointId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v57 = [(_INPBIntentMetadata *)self endpointId];
  if (v57)
  {
    uint64_t v58 = (void *)v57;
    v59 = [(_INPBIntentMetadata *)self endpointId];
    v60 = [v4 endpointId];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  int v62 = [(_INPBIntentMetadata *)self hasEndpointMediaPlaybackEnabled];
  if (v62 != [v4 hasEndpointMediaPlaybackEnabled]) {
    goto LABEL_156;
  }
  if ([(_INPBIntentMetadata *)self hasEndpointMediaPlaybackEnabled])
  {
    if ([v4 hasEndpointMediaPlaybackEnabled])
    {
      int endpointMediaPlaybackEnabled = self->_endpointMediaPlaybackEnabled;
      if (endpointMediaPlaybackEnabled != [v4 endpointMediaPlaybackEnabled]) {
        goto LABEL_156;
      }
    }
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self forceNeedsValueForParameters];
  uint64_t v6 = [v4 forceNeedsValueForParameters];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v64 = [(_INPBIntentMetadata *)self forceNeedsValueForParameters];
  if (v64)
  {
    uint64_t v65 = (void *)v64;
    v66 = [(_INPBIntentMetadata *)self forceNeedsValueForParameters];
    v67 = [v4 forceNeedsValueForParameters];
    int v68 = [v66 isEqual:v67];

    if (!v68) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  int v69 = [(_INPBIntentMetadata *)self hasIdiom];
  if (v69 != [v4 hasIdiom]) {
    goto LABEL_156;
  }
  if ([(_INPBIntentMetadata *)self hasIdiom])
  {
    if ([v4 hasIdiom])
    {
      int idiom = self->_idiom;
      if (idiom != [v4 idiom]) {
        goto LABEL_156;
      }
    }
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self intentDescription];
  uint64_t v6 = [v4 intentDescription];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v71 = [(_INPBIntentMetadata *)self intentDescription];
  if (v71)
  {
    v72 = (void *)v71;
    v73 = [(_INPBIntentMetadata *)self intentDescription];
    v74 = [v4 intentDescription];
    int v75 = [v73 isEqual:v74];

    if (!v75) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self intentId];
  uint64_t v6 = [v4 intentId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v76 = [(_INPBIntentMetadata *)self intentId];
  if (v76)
  {
    v77 = (void *)v76;
    long long v78 = [(_INPBIntentMetadata *)self intentId];
    long long v79 = [v4 intentId];
    int v80 = [v78 isEqual:v79];

    if (!v80) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  int v81 = [(_INPBIntentMetadata *)self hasIsOwnedByCurrentUser];
  if (v81 != [v4 hasIsOwnedByCurrentUser]) {
    goto LABEL_156;
  }
  if ([(_INPBIntentMetadata *)self hasIsOwnedByCurrentUser])
  {
    if ([v4 hasIsOwnedByCurrentUser])
    {
      int isOwnedByCurrentUser = self->_isOwnedByCurrentUser;
      if (isOwnedByCurrentUser != [v4 isOwnedByCurrentUser]) {
        goto LABEL_156;
      }
    }
  }
  int v83 = [(_INPBIntentMetadata *)self hasIsPrimaryDisplayDisabled];
  if (v83 != [v4 hasIsPrimaryDisplayDisabled]) {
    goto LABEL_156;
  }
  if ([(_INPBIntentMetadata *)self hasIsPrimaryDisplayDisabled])
  {
    if ([v4 hasIsPrimaryDisplayDisabled])
    {
      int isPrimaryDisplayDisabled = self->_isPrimaryDisplayDisabled;
      if (isPrimaryDisplayDisabled != [v4 isPrimaryDisplayDisabled]) {
        goto LABEL_156;
      }
    }
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self mediaRouteId];
  uint64_t v6 = [v4 mediaRouteId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v85 = [(_INPBIntentMetadata *)self mediaRouteId];
  if (v85)
  {
    v86 = (void *)v85;
    v87 = [(_INPBIntentMetadata *)self mediaRouteId];
    v88 = [v4 mediaRouteId];
    int v89 = [v87 isEqual:v88];

    if (!v89) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  int v90 = [(_INPBIntentMetadata *)self hasMsLimitReached];
  if (v90 != [v4 hasMsLimitReached]) {
    goto LABEL_156;
  }
  if ([(_INPBIntentMetadata *)self hasMsLimitReached])
  {
    if ([v4 hasMsLimitReached])
    {
      int msLimitReached = self->_msLimitReached;
      if (msLimitReached != [v4 msLimitReached]) {
        goto LABEL_156;
      }
    }
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self originatingDeviceIdsIdentifier];
  uint64_t v6 = [v4 originatingDeviceIdsIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v92 = [(_INPBIntentMetadata *)self originatingDeviceIdsIdentifier];
  if (v92)
  {
    v93 = (void *)v92;
    v94 = [(_INPBIntentMetadata *)self originatingDeviceIdsIdentifier];
    v95 = [v4 originatingDeviceIdsIdentifier];
    int v96 = [v94 isEqual:v95];

    if (!v96) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self originatingDeviceRapportEffectiveId];
  uint64_t v6 = [v4 originatingDeviceRapportEffectiveId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v97 = [(_INPBIntentMetadata *)self originatingDeviceRapportEffectiveId];
  if (v97)
  {
    v98 = (void *)v97;
    v99 = [(_INPBIntentMetadata *)self originatingDeviceRapportEffectiveId];
    v100 = [v4 originatingDeviceRapportEffectiveId];
    int v101 = [v99 isEqual:v100];

    if (!v101) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self originatingDeviceRapportMediaSystemId];
  uint64_t v6 = [v4 originatingDeviceRapportMediaSystemId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v102 = [(_INPBIntentMetadata *)self originatingDeviceRapportMediaSystemId];
  if (v102)
  {
    v103 = (void *)v102;
    v104 = [(_INPBIntentMetadata *)self originatingDeviceRapportMediaSystemId];
    v105 = [v4 originatingDeviceRapportMediaSystemId];
    int v106 = [v104 isEqual:v105];

    if (!v106) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self parameterImages];
  uint64_t v6 = [v4 parameterImages];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v107 = [(_INPBIntentMetadata *)self parameterImages];
  if (v107)
  {
    v108 = (void *)v107;
    v109 = [(_INPBIntentMetadata *)self parameterImages];
    v110 = [v4 parameterImages];
    int v111 = [v109 isEqual:v110];

    if (!v111) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self preferredAudioOutputRouteId];
  uint64_t v6 = [v4 preferredAudioOutputRouteId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v112 = [(_INPBIntentMetadata *)self preferredAudioOutputRouteId];
  if (v112)
  {
    v113 = (void *)v112;
    v114 = [(_INPBIntentMetadata *)self preferredAudioOutputRouteId];
    v115 = [v4 preferredAudioOutputRouteId];
    int v116 = [v114 isEqual:v115];

    if (!v116) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_156;
  }
  int v117 = [(_INPBIntentMetadata *)self hasShowsWhenRun];
  if (v117 != [v4 hasShowsWhenRun]) {
    goto LABEL_156;
  }
  if ([(_INPBIntentMetadata *)self hasShowsWhenRun])
  {
    if ([v4 hasShowsWhenRun])
    {
      int showsWhenRun = self->_showsWhenRun;
      if (showsWhenRun != [v4 showsWhenRun]) {
        goto LABEL_156;
      }
    }
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self suggestedInvocationPhrase];
  uint64_t v6 = [v4 suggestedInvocationPhrase];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_155;
  }
  uint64_t v119 = [(_INPBIntentMetadata *)self suggestedInvocationPhrase];
  if (v119)
  {
    v120 = (void *)v119;
    v121 = [(_INPBIntentMetadata *)self suggestedInvocationPhrase];
    v122 = [v4 suggestedInvocationPhrase];
    int v123 = [v121 isEqual:v122];

    if (!v123) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  int v124 = [(_INPBIntentMetadata *)self hasTriggerMethod];
  if (v124 != [v4 hasTriggerMethod]) {
    goto LABEL_156;
  }
  if ([(_INPBIntentMetadata *)self hasTriggerMethod])
  {
    if ([v4 hasTriggerMethod])
    {
      int triggerMethod = self->_triggerMethod;
      if (triggerMethod != [v4 triggerMethod]) {
        goto LABEL_156;
      }
    }
  }
  int v126 = [(_INPBIntentMetadata *)self hasUserConfirmationRequired];
  if (v126 != [v4 hasUserConfirmationRequired]) {
    goto LABEL_156;
  }
  if ([(_INPBIntentMetadata *)self hasUserConfirmationRequired])
  {
    if ([v4 hasUserConfirmationRequired])
    {
      int userConfirmationRequired = self->_userConfirmationRequired;
      if (userConfirmationRequired != [v4 userConfirmationRequired]) {
        goto LABEL_156;
      }
    }
  }
  uint64_t v5 = [(_INPBIntentMetadata *)self userUtterance];
  uint64_t v6 = [v4 userUtterance];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_155:

    goto LABEL_156;
  }
  uint64_t v128 = [(_INPBIntentMetadata *)self userUtterance];
  if (v128)
  {
    v129 = (void *)v128;
    v130 = [(_INPBIntentMetadata *)self userUtterance];
    v131 = [v4 userUtterance];
    int v132 = [v130 isEqual:v131];

    if (!v132) {
      goto LABEL_156;
    }
  }
  else
  {
  }
  int v135 = [(_INPBIntentMetadata *)self hasVersioningHash];
  if (v135 == [v4 hasVersioningHash])
  {
    if (![(_INPBIntentMetadata *)self hasVersioningHash]
      || ![v4 hasVersioningHash]
      || (unint64_t versioningHash = self->_versioningHash, versioningHash == [v4 versioningHash]))
    {
      BOOL v133 = 1;
      goto LABEL_157;
    }
  }
LABEL_156:
  BOOL v133 = 0;
LABEL_157:

  return v133;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBIntentMetadata allocWithZone:](_INPBIntentMetadata, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSString *)self->_categoryVerb copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setCategoryVerb:v6];

  id v7 = [(_INPBImageValue *)self->_defaultImageValue copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setDefaultImageValue:v7];

  if ([(_INPBIntentMetadata *)self hasExecutionContext]) {
    [(_INPBIntentMetadata *)v5 setExecutionContext:[(_INPBIntentMetadata *)self executionContext]];
  }
  if ([(_INPBIntentMetadata *)self hasIntentCategory]) {
    [(_INPBIntentMetadata *)v5 setIntentCategory:[(_INPBIntentMetadata *)self intentCategory]];
  }
  uint64_t v8 = (void *)[(NSString *)self->_launchId copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setLaunchId:v8];

  uint64_t v9 = (void *)[(NSString *)self->_nanoLaunchId copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setNanoLaunchId:v9];

  PBRepeatedInt32Copy();
  unint64_t v10 = (void *)[(NSString *)self->_systemExtensionBundleId copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setSystemExtensionBundleId:v10];

  int v11 = (void *)[(NSString *)self->_systemUIExtensionBundleId copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setSystemUIExtensionBundleId:v11];

  uint64_t v12 = (void *)[(NSArray *)self->_airPlayRouteIds copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setAirPlayRouteIds:v12];

  NSUInteger v13 = (void *)[(NSData *)self->_auditTokenData copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setAuditTokenData:v13];

  if ([(_INPBIntentMetadata *)self hasBackgroundLaunch]) {
    [(_INPBIntentMetadata *)v5 setBackgroundLaunch:[(_INPBIntentMetadata *)self backgroundLaunch]];
  }
  if ([(_INPBIntentMetadata *)self hasBypassAppProtectionAuthentication]) {
    [(_INPBIntentMetadata *)v5 setBypassAppProtectionAuthentication:[(_INPBIntentMetadata *)self bypassAppProtectionAuthentication]];
  }
  if ([(_INPBIntentMetadata *)self hasConfirmed]) {
    [(_INPBIntentMetadata *)v5 setConfirmed:[(_INPBIntentMetadata *)self confirmed]];
  }
  NSUInteger v14 = (void *)[(NSString *)self->_endpointId copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setEndpointId:v14];

  if ([(_INPBIntentMetadata *)self hasEndpointMediaPlaybackEnabled]) {
    [(_INPBIntentMetadata *)v5 setEndpointMediaPlaybackEnabled:[(_INPBIntentMetadata *)self endpointMediaPlaybackEnabled]];
  }
  NSUInteger v15 = (void *)[(NSArray *)self->_forceNeedsValueForParameters copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setForceNeedsValueForParameters:v15];

  if ([(_INPBIntentMetadata *)self hasIdiom]) {
    [(_INPBIntentMetadata *)v5 setIdiom:[(_INPBIntentMetadata *)self idiom]];
  }
  int v16 = (void *)[(NSString *)self->_intentDescription copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setIntentDescription:v16];

  int v17 = (void *)[(NSString *)self->_intentId copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setIntentId:v17];

  if ([(_INPBIntentMetadata *)self hasIsOwnedByCurrentUser]) {
    [(_INPBIntentMetadata *)v5 setIsOwnedByCurrentUser:[(_INPBIntentMetadata *)self isOwnedByCurrentUser]];
  }
  if ([(_INPBIntentMetadata *)self hasIsPrimaryDisplayDisabled]) {
    [(_INPBIntentMetadata *)v5 setIsPrimaryDisplayDisabled:[(_INPBIntentMetadata *)self isPrimaryDisplayDisabled]];
  }
  uint64_t v18 = (void *)[(NSString *)self->_mediaRouteId copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setMediaRouteId:v18];

  if ([(_INPBIntentMetadata *)self hasMsLimitReached]) {
    [(_INPBIntentMetadata *)v5 setMsLimitReached:[(_INPBIntentMetadata *)self msLimitReached]];
  }
  int v19 = (void *)[(NSString *)self->_originatingDeviceIdsIdentifier copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setOriginatingDeviceIdsIdentifier:v19];

  NSUInteger v20 = (void *)[(NSString *)self->_originatingDeviceRapportEffectiveId copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setOriginatingDeviceRapportEffectiveId:v20];

  uint64_t v21 = (void *)[(NSString *)self->_originatingDeviceRapportMediaSystemId copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setOriginatingDeviceRapportMediaSystemId:v21];

  uint64_t v22 = (void *)[(NSArray *)self->_parameterImages copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setParameterImages:v22];

  uint64_t v23 = (void *)[(NSString *)self->_preferredAudioOutputRouteId copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setPreferredAudioOutputRouteId:v23];

  PBRepeatedInt32Copy();
  if ([(_INPBIntentMetadata *)self hasShowsWhenRun]) {
    [(_INPBIntentMetadata *)v5 setShowsWhenRun:[(_INPBIntentMetadata *)self showsWhenRun]];
  }
  uint64_t v24 = (void *)[(NSString *)self->_suggestedInvocationPhrase copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setSuggestedInvocationPhrase:v24];

  if ([(_INPBIntentMetadata *)self hasTriggerMethod]) {
    [(_INPBIntentMetadata *)v5 setTriggerMethod:[(_INPBIntentMetadata *)self triggerMethod]];
  }
  if ([(_INPBIntentMetadata *)self hasUserConfirmationRequired]) {
    [(_INPBIntentMetadata *)v5 setUserConfirmationRequired:[(_INPBIntentMetadata *)self userConfirmationRequired]];
  }
  id v25 = [(_INPBString *)self->_userUtterance copyWithZone:a3];
  [(_INPBIntentMetadata *)v5 setUserUtterance:v25];

  if ([(_INPBIntentMetadata *)self hasVersioningHash]) {
    [(_INPBIntentMetadata *)v5 setVersioningHash:[(_INPBIntentMetadata *)self versioningHash]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBIntentMetadata *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBIntentMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBIntentMetadata *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBIntentMetadata *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBIntentMetadata *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)setHasVersioningHash:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasUserUtterance
{
  return self->_userUtterance != 0;
}

- (void)setUserUtterance:(id)a3
{
}

- (void)setHasUserConfirmationRequired:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (int)StringAsTriggerMethod:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Other"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"HomeButton"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"RemoteButton"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"VoiceTrigger"])
  {
    int v4 = 30;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)triggerMethodAsString:(int)a3
{
  if (a3 > 19)
  {
    if (a3 == 20)
    {
      int v4 = @"RemoteButton";
    }
    else
    {
      if (a3 != 30)
      {
LABEL_12:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      int v4 = @"VoiceTrigger";
    }
  }
  else
  {
    if (a3)
    {
      if (a3 == 10)
      {
        int v4 = @"HomeButton";
        return v4;
      }
      goto LABEL_12;
    }
    int v4 = @"Other";
  }
  return v4;
}

- (void)setHasTriggerMethod:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (void)setTriggerMethod:(int)a3
{
  __int16 has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->___int16 has = has & 0xF7FF;
  }
  else
  {
    *(_WORD *)&self->___int16 has = has | 0x800;
    self->_int triggerMethod = a3;
  }
}

- (BOOL)hasSuggestedInvocationPhrase
{
  return self->_suggestedInvocationPhrase != 0;
}

- (void)setHasShowsWhenRun:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (void)setShowsWhenRun:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_int showsWhenRun = a3;
}

- (int)StringAsShortcutAvailabilities:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SLEEP_MINDFULNESS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SLEEP_JOURNALING"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SLEEP_MUSIC"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SLEEP_PODCASTS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SLEEP_READING"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SLEEP_WRAP_UP_YOUR_DAY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SLEEP_YOGA_AND_STRETCHING"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)shortcutAvailabilitiesAsString:(int)a3
{
  if (a3 >= 7)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5516AB8 + a3);
  }

  return v3;
}

- (int)shortcutAvailabilityAtIndex:(unint64_t)a3
{
  return self->_shortcutAvailabilities.list[a3];
}

- (unint64_t)shortcutAvailabilitiesCount
{
  return self->_shortcutAvailabilities.count;
}

- (void)addShortcutAvailability:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (int)shortcutAvailabilities
{
  return self->_shortcutAvailabilities.list;
}

- (void)setShortcutAvailabilities:(int *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasPreferredAudioOutputRouteId
{
  return self->_preferredAudioOutputRouteId != 0;
}

- (void)setPreferredAudioOutputRouteId:(id)a3
{
  self->_preferredAudioOutputRouteId = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)parameterImagesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_parameterImages objectAtIndexedSubscript:a3];
}

- (unint64_t)parameterImagesCount
{
  return [(NSArray *)self->_parameterImages count];
}

- (void)addParameterImages:(id)a3
{
  id v4 = a3;
  parameterImages = self->_parameterImages;
  id v8 = v4;
  if (!parameterImages)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_parameterImages;
    self->_parameterImages = v6;

    id v4 = v8;
    parameterImages = self->_parameterImages;
  }
  [(NSArray *)parameterImages addObject:v4];
}

- (void)clearParameterImages
{
}

- (void)setParameterImages:(id)a3
{
  self->_parameterImages = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasOriginatingDeviceRapportMediaSystemId
{
  return self->_originatingDeviceRapportMediaSystemId != 0;
}

- (void)setOriginatingDeviceRapportMediaSystemId:(id)a3
{
  self->_originatingDeviceRapportMediaSystemId = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasOriginatingDeviceRapportEffectiveId
{
  return self->_originatingDeviceRapportEffectiveId != 0;
}

- (void)setOriginatingDeviceRapportEffectiveId:(id)a3
{
  self->_originatingDeviceRapportEffectiveId = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasOriginatingDeviceIdsIdentifier
{
  return self->_originatingDeviceIdsIdentifier != 0;
}

- (void)setOriginatingDeviceIdsIdentifier:(id)a3
{
  self->_originatingDeviceIdsIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setHasMsLimitReached:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (void)setMsLimitReached:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_int msLimitReached = a3;
}

- (BOOL)hasMediaRouteId
{
  return self->_mediaRouteId != 0;
}

- (void)setMediaRouteId:(id)a3
{
  self->_mediaRouteId = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setHasIsPrimaryDisplayDisabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (void)setIsPrimaryDisplayDisabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int isPrimaryDisplayDisabled = a3;
}

- (void)setHasIsOwnedByCurrentUser:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (void)setIsOwnedByCurrentUser:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int isOwnedByCurrentUser = a3;
}

- (BOOL)hasIntentId
{
  return self->_intentId != 0;
}

- (void)setIntentId:(id)a3
{
  self->_intentId = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasIntentDescription
{
  return self->_intentDescription != 0;
}

- (void)setIntentDescription:(id)a3
{
  self->_intentDescription = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (int)StringAsIdiom:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PHONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PAD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WATCH"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HOME_POD"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CARPLAY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"APPLE_TV"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MAC"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)idiomAsString:(int)a3
{
  if ((a3 - 1) >= 7)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5516A80 + (a3 - 1));
  }

  return v3;
}

- (void)setHasIdiom:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (void)setIdiom:(int)a3
{
  __int16 has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->___int16 has = has & 0xFFBF;
  }
  else
  {
    *(_WORD *)&self->___int16 has = has | 0x40;
    self->_int idiom = a3;
  }
}

- (id)forceNeedsValueForParameterAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_forceNeedsValueForParameters objectAtIndexedSubscript:a3];
}

- (unint64_t)forceNeedsValueForParametersCount
{
  return [(NSArray *)self->_forceNeedsValueForParameters count];
}

- (void)addForceNeedsValueForParameter:(id)a3
{
  id v4 = a3;
  forceNeedsValueForParameters = self->_forceNeedsValueForParameters;
  id v8 = v4;
  if (!forceNeedsValueForParameters)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_forceNeedsValueForParameters;
    self->_forceNeedsValueForParameters = v6;

    id v4 = v8;
    forceNeedsValueForParameters = self->_forceNeedsValueForParameters;
  }
  [(NSArray *)forceNeedsValueForParameters addObject:v4];
}

- (void)clearForceNeedsValueForParameters
{
}

- (void)setForceNeedsValueForParameters:(id)a3
{
  self->_forceNeedsValueForParameters = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (void)setHasEndpointMediaPlaybackEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (void)setEndpointMediaPlaybackEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int endpointMediaPlaybackEnabled = a3;
}

- (BOOL)hasEndpointId
{
  return self->_endpointId != 0;
}

- (void)setEndpointId:(id)a3
{
  self->_endpointId = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setHasConfirmed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (void)setConfirmed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int confirmed = a3;
}

- (void)setHasBypassAppProtectionAuthentication:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setBypassAppProtectionAuthentication:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int bypassAppProtectionAuthentication = a3;
}

- (void)setHasBackgroundLaunch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setBackgroundLaunch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_int backgroundLaunch = a3;
}

- (BOOL)hasAuditTokenData
{
  return self->_auditTokenData != 0;
}

- (void)setAuditTokenData:(id)a3
{
  self->_auditTokenData = (NSData *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)airPlayRouteIdsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_airPlayRouteIds objectAtIndexedSubscript:a3];
}

- (unint64_t)airPlayRouteIdsCount
{
  return [(NSArray *)self->_airPlayRouteIds count];
}

- (void)addAirPlayRouteIds:(id)a3
{
  id v4 = a3;
  airPlayRouteIds = self->_airPlayRouteIds;
  id v8 = v4;
  if (!airPlayRouteIds)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_airPlayRouteIds;
    self->_airPlayRouteIds = v6;

    id v4 = v8;
    airPlayRouteIds = self->_airPlayRouteIds;
  }
  [(NSArray *)airPlayRouteIds addObject:v4];
}

- (void)clearAirPlayRouteIds
{
}

- (void)setAirPlayRouteIds:(id)a3
{
  self->_airPlayRouteIds = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasSystemUIExtensionBundleId
{
  return self->_systemUIExtensionBundleId != 0;
}

- (void)setSystemUIExtensionBundleId:(id)a3
{
  self->_systemUIExtensionBundleId = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasSystemExtensionBundleId
{
  return self->_systemExtensionBundleId != 0;
}

- (int)StringAsRequiredEntitlements:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"CONTACTS"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"LOCATION"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)requiredEntitlementsAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"CONTACTS";
  }
  else if (a3 == 2)
  {
    int v4 = @"LOCATION";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)requiredEntitlementAtIndex:(unint64_t)a3
{
  return self->_requiredEntitlements.list[a3];
}

- (unint64_t)requiredEntitlementsCount
{
  return self->_requiredEntitlements.count;
}

- (void)addRequiredEntitlement:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (int)requiredEntitlements
{
  return self->_requiredEntitlements.list;
}

- (void)setRequiredEntitlements:(int *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasNanoLaunchId
{
  return self->_nanoLaunchId != 0;
}

- (void)setNanoLaunchId:(id)a3
{
  self->_nanoLaunchId = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasLaunchId
{
  return self->_launchId != 0;
}

- (int)StringAsIntentCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CATEGORY_INFORMATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CATEGORY_PLAY_AUDIO"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CATEGORY_PLAY_VIDEO"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CATEGORY_ORDER"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CATEGORY_NAVIGATION"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CATEGORY_START"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CATEGORY_SHARE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CATEGORY_CREATE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CATEGORY_SEARCH"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CATEGORY_TOGGLE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"CATEGORY_DOWNLOAD"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"CATEGORY_LOG"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"CATEGORY_CHECK_IN"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"CATEGORY_WORKFLOW"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"CATEGORY_REQUEST"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"CATEGORY_SET"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"CATEGORY_CALL_AUDIO"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"CATEGORY_CALL_VIDEO"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"CATEGORY_PLAY_SOUND"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"CATEGORY_USER_ACTIVITY"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)intentCategoryAsString:(int)a3
{
  unsigned int v3 = a3 - 1;
  if (a3 - 1) < 0x15 && ((0x1FFDFFu >> v3))
  {
    int v4 = *(&off_1E55169D8 + v3);
  }
  else
  {
    int v4 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }

  return v4;
}

- (void)setHasIntentCategory:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (int)StringAsExecutionContext:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ASSISTANT_DIALOG"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ASSISTANT_VOICE_SHORTCUT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"COVER_SHEET_PREDICTION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SPOTLIGHT_PREDICTION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SPOTLIGHT_SEARCH"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MAPS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"WORKFLOW"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"WATCH_FACE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ASSISTANT_VOICE_SHORTCUT_VIA_CLOUD_RELAY"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CARPLAY_HOME_SCREEN"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)executionContextAsString:(int)a3
{
  if ((a3 - 1) >= 0xA)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5516988 + (a3 - 1));
  }

  return v3;
}

- (void)setHasExecutionContext:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setExecutionContext:(int)a3
{
  __int16 has = (__int16)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_WORD *)&self->___int16 has = has & 0xFFFE;
  }
  else
  {
    *(_WORD *)&self->___int16 has = has | 1;
    self->_int executionContext = a3;
  }
}

- (BOOL)hasDefaultImageValue
{
  return self->_defaultImageValue != 0;
}

- (BOOL)hasCategoryVerb
{
  return self->_categoryVerb != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)parameterImagesType
{
  return (Class)objc_opt_class();
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v7 = [(_INPBIntentMetadata *)self categoryVerb];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v7, @"categoryVerb");

  id v8 = [(_INPBIntentMetadata *)self launchId];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v8, @"launchId");

  uint64_t v9 = [(_INPBIntentMetadata *)self nanoLaunchId];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v9, @"nanoLaunchId");

  unint64_t v10 = [(_INPBIntentMetadata *)self systemExtensionBundleId];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v10, @"systemExtensionBundleId");

  int v11 = [(_INPBIntentMetadata *)self systemUIExtensionBundleId];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v11, @"systemUIExtensionBundleId");

  uint64_t v12 = [(_INPBIntentMetadata *)self intentDescription];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v12, @"intentDescription");

  NSUInteger v13 = [(_INPBIntentMetadata *)self intentId];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v13, @"intentId");

  NSUInteger v14 = [(_INPBIntentMetadata *)self originatingDeviceIdsIdentifier];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v14, @"originatingDeviceIdsIdentifier");

  NSUInteger v15 = [(_INPBIntentMetadata *)self suggestedInvocationPhrase];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v15, @"suggestedInvocationPhrase");

  int v16 = [(_INPBIntentMetadata *)self auditTokenData];
  int v17 = [v5 encodeObject:v16];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v17, @"auditTokenData");

  uint64_t v18 = [(_INPBIntentMetadata *)self endpointId];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v18, @"endpointId");

  int v19 = [(_INPBIntentMetadata *)self mediaRouteId];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v19, @"mediaRouteId");

  NSUInteger v20 = [(_INPBIntentMetadata *)self preferredAudioOutputRouteId];
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v20, @"preferredAudioOutputRouteId");

  objc_msgSend(v6, "if_setBoolIfYES:forKey:", -[_INPBIntentMetadata msLimitReached](self, "msLimitReached"), @"msLimitReached");
  objc_msgSend(v6, "if_setBoolIfYES:forKey:", -[_INPBIntentMetadata endpointMediaPlaybackEnabled](self, "endpointMediaPlaybackEnabled"), @"endpointMediaPlaybackEnabled");
  objc_msgSend(v6, "if_setBoolIfYES:forKey:", -[_INPBIntentMetadata userConfirmationRequired](self, "userConfirmationRequired"), @"userConfirmationRequired");
  objc_msgSend(v6, "if_setBoolIfYES:forKey:", -[_INPBIntentMetadata backgroundLaunch](self, "backgroundLaunch"), @"backgroundLaunch");
  objc_msgSend(v6, "if_setBoolIfYES:forKey:", -[_INPBIntentMetadata confirmed](self, "confirmed"), @"confirmed");
  if ([(_INPBIntentMetadata *)self hasShowsWhenRun])
  {
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBIntentMetadata showsWhenRun](self, "showsWhenRun"));
    [v6 setObject:v21 forKey:@"showsWhenRun"];
  }
  if ([(_INPBIntentMetadata *)self hasExecutionContext])
  {
    uint64_t v22 = [(_INPBIntentMetadata *)self executionContext];
    if ((v22 - 1) >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v22);
      uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v23 = off_1E551A190[(v22 - 1)];
    }
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v23, @"executionContext");
  }
  else
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, @"executionContext");
  }
  if ([(_INPBIntentMetadata *)self hasIntentCategory])
  {
    uint64_t v24 = [(_INPBIntentMetadata *)self intentCategory];
    int v25 = v24 - 1;
    if (v24 - 1) < 0x15 && ((0x1FFDFFu >> v25))
    {
      uint64_t v26 = off_1E551A1E0[v25];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v24);
      uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v26, @"intentCategory");
  }
  else
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, @"intentCategory");
  }
  if (![(_INPBIntentMetadata *)self hasTriggerMethod])
  {
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", 0, @"triggerMethod");
    goto LABEL_29;
  }
  uint64_t v27 = [(_INPBIntentMetadata *)self triggerMethod];
  if ((int)v27 > 19)
  {
    if (v27 == 20)
    {
      uint64_t v28 = @"RemoteButton";
      goto LABEL_28;
    }
    if (v27 == 30)
    {
      uint64_t v28 = @"VoiceTrigger";
      goto LABEL_28;
    }
LABEL_27:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v27);
    uint64_t v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (!v27)
  {
    uint64_t v28 = @"Other";
    goto LABEL_28;
  }
  if (v27 != 10) {
    goto LABEL_27;
  }
  uint64_t v28 = @"HomeButton";
LABEL_28:
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v28, @"triggerMethod");

LABEL_29:
  uint64_t v29 = [(_INPBIntentMetadata *)self defaultImageValue];
  int v30 = INIntentSlotValueTransformFromImageValue(v29);
  uint64_t v31 = v5;
  NSUInteger v32 = [v5 encodeObject:v30];
  v63 = v6;
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v32, @"defaultImageValue");

  uint64_t v33 = (void *)MEMORY[0x1E4F1CA60];
  NSUInteger v34 = [(_INPBIntentMetadata *)self parameterImages];
  uint64_t v64 = objc_msgSend(v33, "dictionaryWithCapacity:", objc_msgSend(v34, "count"));

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  int v62 = self;
  int v35 = [(_INPBIntentMetadata *)self parameterImages];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v69 objects:v74 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v70 != v38) {
          objc_enumerationMutation(v35);
        }
        int v40 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        uint64_t v41 = [v40 pairImageValues];
        long long v42 = [v41 firstObject];
        long long v43 = INIntentSlotValueTransformFromImageValue(v42);
        long long v44 = [v31 encodeObject:v43];
        int v45 = [v40 key];
        objc_msgSend(v64, "if_setObjectIfNonNil:forKey:", v44, v45);
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v69 objects:v74 count:16];
    }
    while (v37);
  }

  if ([v64 count]) {
    objc_msgSend(v63, "if_setObjectIfNonNil:forKey:", v64, @"parameterImages");
  }
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v47 = [(_INPBIntentMetadata *)v62 forceNeedsValueForParameters];
  uint64_t v48 = [v47 countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v49; ++j)
      {
        if (*(void *)v66 != v50) {
          objc_enumerationMutation(v47);
        }
        long long v52 = [v31 encodeObject:*(void *)(*((void *)&v65 + 1) + 8 * j)];
        objc_msgSend(v46, "if_addObjectIfNonNil:", v52);
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v65 objects:v73 count:16];
    }
    while (v49);
  }

  if ([v46 count]) {
    objc_msgSend(v63, "if_setObjectIfNonNil:forKey:", v46, @"forceNeedsValueForParameters");
  }
  int v53 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBIntentMetadata requiredEntitlementsCount](v62, "requiredEntitlementsCount"));
  if ([(_INPBIntentMetadata *)v62 requiredEntitlementsCount])
  {
    unint64_t v54 = 0;
    do
    {
      uint64_t v55 = [(_INPBIntentMetadata *)v62 requiredEntitlementAtIndex:v54];
      if (v55 == 1)
      {
        uint64_t v56 = @"CONTACTS";
      }
      else if (v55 == 2)
      {
        uint64_t v56 = @"LOCATION";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v55);
        uint64_t v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      [v53 addObject:v56];

      ++v54;
    }
    while (v54 < [(_INPBIntentMetadata *)v62 requiredEntitlementsCount]);
  }
  if ([v53 count]) {
    objc_msgSend(v63, "if_setObjectIfNonNil:forKey:", v53, @"requiredEntitlements");
  }
  uint64_t v57 = [(_INPBIntentMetadata *)v62 userUtterance];
  uint64_t v58 = INIntentSlotValueTransformFromString(v57);
  objc_msgSend(v63, "if_setObjectIfNonNil:forKey:", v58, @"userUtterance");

  if ([(_INPBIntentMetadata *)v62 hasVersioningHash])
  {
    v59 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_INPBIntentMetadata versioningHash](v62, "versioningHash"));
    objc_msgSend(v63, "if_setObjectIfNonNil:forKey:", v59, @"versioningHash");
  }
  v60 = (void *)[v63 copy];

  return v60;
}

- (void)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v140 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v137 = v7;
    id v9 = v8;

    unint64_t v10 = [v9 objectForKeyedSubscript:@"categoryVerb"];
    id v135 = v8;
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v11 = v10;
      }
      else {
        int v11 = 0;
      }
    }
    else
    {
      int v11 = 0;
    }
    id v12 = v11;

    [(_INPBIntentMetadata *)self if_setValueIfNonNil:v12 forKey:@"categoryVerb"];
    NSUInteger v13 = [v9 objectForKeyedSubscript:@"launchId"];
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        NSUInteger v14 = v13;
      }
      else {
        NSUInteger v14 = 0;
      }
    }
    else
    {
      NSUInteger v14 = 0;
    }
    id v15 = v14;

    [(_INPBIntentMetadata *)self if_setValueIfNonNil:v15 forKey:@"launchId"];
    int v16 = [v9 objectForKeyedSubscript:@"nanoLaunchId"];
    if (v16)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v17 = v16;
      }
      else {
        int v17 = 0;
      }
    }
    else
    {
      int v17 = 0;
    }
    id v18 = v17;

    [(_INPBIntentMetadata *)self if_setValueIfNonNil:v18 forKey:@"nanoLaunchId"];
    int v19 = [v9 objectForKeyedSubscript:@"systemExtensionBundleId"];
    if (v19)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        NSUInteger v20 = v19;
      }
      else {
        NSUInteger v20 = 0;
      }
    }
    else
    {
      NSUInteger v20 = 0;
    }
    id v21 = v20;

    [(_INPBIntentMetadata *)self if_setValueIfNonNil:v21 forKey:@"systemExtensionBundleId"];
    uint64_t v22 = [v9 objectForKeyedSubscript:@"systemUIExtensionBundleId"];
    if (v22)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = 0;
      }
    }
    else
    {
      uint64_t v23 = 0;
    }
    id v24 = v23;

    [(_INPBIntentMetadata *)self if_setValueIfNonNil:v24 forKey:@"systemUIExtensionBundleId"];
    int v25 = [v9 objectForKeyedSubscript:@"intentDescription"];
    if (v25)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v26 = v25;
      }
      else {
        uint64_t v26 = 0;
      }
    }
    else
    {
      uint64_t v26 = 0;
    }
    id v27 = v26;

    [(_INPBIntentMetadata *)self if_setValueIfNonNil:v27 forKey:@"intentDescription"];
    uint64_t v28 = [v9 objectForKeyedSubscript:@"intentId"];
    if (v28)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v29 = v28;
      }
      else {
        uint64_t v29 = 0;
      }
    }
    else
    {
      uint64_t v29 = 0;
    }
    id v30 = v29;

    [(_INPBIntentMetadata *)self if_setValueIfNonNil:v30 forKey:@"intentId"];
    uint64_t v31 = [v9 objectForKeyedSubscript:@"originatingDeviceIdsIdentifier"];
    if (v31)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        NSUInteger v32 = v31;
      }
      else {
        NSUInteger v32 = 0;
      }
    }
    else
    {
      NSUInteger v32 = 0;
    }
    id v33 = v32;

    [(_INPBIntentMetadata *)self if_setValueIfNonNil:v33 forKey:@"originatingDeviceIdsIdentifier"];
    NSUInteger v34 = [v9 objectForKeyedSubscript:@"suggestedInvocationPhrase"];
    if (v34)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v35 = v34;
      }
      else {
        int v35 = 0;
      }
    }
    else
    {
      int v35 = 0;
    }
    id v36 = v35;

    [(_INPBIntentMetadata *)self if_setValueIfNonNil:v36 forKey:@"suggestedInvocationPhrase"];
    uint64_t v37 = objc_opt_class();
    uint64_t v38 = [v9 objectForKeyedSubscript:@"auditTokenData"];
    if (v38)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        NSUInteger v39 = v38;
      }
      else {
        NSUInteger v39 = 0;
      }
    }
    else
    {
      NSUInteger v39 = 0;
    }
    id v40 = v39;

    uint64_t v41 = [v140 decodeObjectOfClass:v37 from:v40];
    [(_INPBIntentMetadata *)self if_setValueIfNonNil:v41 forKey:@"auditTokenData"];

    long long v42 = [v9 objectForKeyedSubscript:@"endpointId"];
    if (v42)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v43 = v42;
      }
      else {
        long long v43 = 0;
      }
    }
    else
    {
      long long v43 = 0;
    }
    id v44 = v43;

    [(_INPBIntentMetadata *)self if_setValueIfNonNil:v44 forKey:@"endpointId"];
    int v45 = [v9 objectForKeyedSubscript:@"mediaRouteId"];
    if (v45)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v46 = v45;
      }
      else {
        id v46 = 0;
      }
    }
    else
    {
      id v46 = 0;
    }
    id v47 = v46;

    [(_INPBIntentMetadata *)self if_setValueIfNonNil:v47 forKey:@"mediaRouteId"];
    uint64_t v48 = [v9 objectForKeyedSubscript:@"preferredAudioOutputRouteId"];
    if (v48)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v49 = v48;
      }
      else {
        uint64_t v49 = 0;
      }
    }
    else
    {
      uint64_t v49 = 0;
    }
    id v50 = v49;

    [(_INPBIntentMetadata *)self if_setValueIfNonNil:v50 forKey:@"preferredAudioOutputRouteId"];
    int v51 = [v9 objectForKeyedSubscript:@"msLimitReached"];
    if (v51)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v52 = v51;
      }
      else {
        long long v52 = 0;
      }
    }
    else
    {
      long long v52 = 0;
    }
    id v53 = v52;

    -[_INPBIntentMetadata setMsLimitReached:](self, "setMsLimitReached:", [v53 BOOLValue]);
    unint64_t v54 = [v9 objectForKeyedSubscript:@"endpointMediaPlaybackEnabled"];
    if (v54)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v55 = v54;
      }
      else {
        uint64_t v55 = 0;
      }
    }
    else
    {
      uint64_t v55 = 0;
    }
    id v56 = v55;

    -[_INPBIntentMetadata setEndpointMediaPlaybackEnabled:](self, "setEndpointMediaPlaybackEnabled:", [v56 BOOLValue]);
    uint64_t v57 = [v9 objectForKeyedSubscript:@"userConfirmationRequired"];
    if (v57)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v58 = v57;
      }
      else {
        uint64_t v58 = 0;
      }
    }
    else
    {
      uint64_t v58 = 0;
    }
    id v59 = v58;

    -[_INPBIntentMetadata setUserConfirmationRequired:](self, "setUserConfirmationRequired:", [v59 BOOLValue]);
    v60 = [v9 objectForKeyedSubscript:@"backgroundLaunch"];
    if (v60)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v61 = v60;
      }
      else {
        int v61 = 0;
      }
    }
    else
    {
      int v61 = 0;
    }
    id v62 = v61;

    -[_INPBIntentMetadata setBackgroundLaunch:](self, "setBackgroundLaunch:", [v62 BOOLValue]);
    v63 = [v9 objectForKeyedSubscript:@"confirmed"];
    if (v63)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v64 = v63;
      }
      else {
        uint64_t v64 = 0;
      }
    }
    else
    {
      uint64_t v64 = 0;
    }
    id v65 = v64;

    -[_INPBIntentMetadata setConfirmed:](self, "setConfirmed:", [v65 BOOLValue]);
    id v66 = [v9 objectForKeyedSubscript:@"showsWhenRun"];
    if (v66)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v66 = v66;

        -[_INPBIntentMetadata setShowsWhenRun:](self, "setShowsWhenRun:", [v66 BOOLValue]);
      }
    }

    long long v67 = [v9 objectForKeyedSubscript:@"executionContext"];
    if (v67)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v68 = v67;
      }
      else {
        long long v68 = 0;
      }
    }
    else
    {
      long long v68 = 0;
    }
    id v69 = v68;

    if (v69)
    {
      id v70 = [v9 objectForKeyedSubscript:@"executionContext"];
      if ([v70 isEqualToString:@"ASSISTANT_DIALOG"])
      {
        uint64_t v71 = 1;
      }
      else if ([v70 isEqualToString:@"ASSISTANT_VOICE_SHORTCUT"])
      {
        uint64_t v71 = 2;
      }
      else if ([v70 isEqualToString:@"COVER_SHEET_PREDICTION"])
      {
        uint64_t v71 = 3;
      }
      else if ([v70 isEqualToString:@"SPOTLIGHT_PREDICTION"])
      {
        uint64_t v71 = 4;
      }
      else if ([v70 isEqualToString:@"SPOTLIGHT_SEARCH"])
      {
        uint64_t v71 = 5;
      }
      else if ([v70 isEqualToString:@"MAPS"])
      {
        uint64_t v71 = 6;
      }
      else if ([v70 isEqualToString:@"WORKFLOW"])
      {
        uint64_t v71 = 7;
      }
      else if ([v70 isEqualToString:@"WATCH_FACE"])
      {
        uint64_t v71 = 8;
      }
      else if ([v70 isEqualToString:@"ASSISTANT_VOICE_SHORTCUT_VIA_CLOUD_RELAY"])
      {
        uint64_t v71 = 9;
      }
      else if ([v70 isEqualToString:@"CARPLAY_HOME_SCREEN"])
      {
        uint64_t v71 = 10;
      }
      else
      {
        uint64_t v71 = 1;
      }

      [(_INPBIntentMetadata *)self setExecutionContext:v71];
    }
    long long v72 = objc_msgSend(v9, "objectForKeyedSubscript:", @"intentCategory", v135);
    if (v72)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v73 = v72;
      }
      else {
        v73 = 0;
      }
    }
    else
    {
      v73 = 0;
    }
    id v74 = v73;

    v138 = v9;
    if (v74)
    {
      id v75 = [v9 objectForKeyedSubscript:@"intentCategory"];
      if ([v75 isEqualToString:@"CATEGORY_INFORMATION"])
      {
        uint64_t v76 = 1;
      }
      else if ([v75 isEqualToString:@"CATEGORY_PLAY_AUDIO"])
      {
        uint64_t v76 = 2;
      }
      else if ([v75 isEqualToString:@"CATEGORY_PLAY_VIDEO"])
      {
        uint64_t v76 = 3;
      }
      else if ([v75 isEqualToString:@"CATEGORY_ORDER"])
      {
        uint64_t v76 = 4;
      }
      else if ([v75 isEqualToString:@"CATEGORY_NAVIGATION"])
      {
        uint64_t v76 = 5;
      }
      else if ([v75 isEqualToString:@"CATEGORY_START"])
      {
        uint64_t v76 = 6;
      }
      else if ([v75 isEqualToString:@"CATEGORY_SHARE"])
      {
        uint64_t v76 = 7;
      }
      else if ([v75 isEqualToString:@"CATEGORY_CREATE"])
      {
        uint64_t v76 = 8;
      }
      else if ([v75 isEqualToString:@"CATEGORY_SEARCH"])
      {
        uint64_t v76 = 9;
      }
      else if ([v75 isEqualToString:@"CATEGORY_TOGGLE"])
      {
        uint64_t v76 = 11;
      }
      else if ([v75 isEqualToString:@"CATEGORY_DOWNLOAD"])
      {
        uint64_t v76 = 12;
      }
      else if ([v75 isEqualToString:@"CATEGORY_LOG"])
      {
        uint64_t v76 = 13;
      }
      else if ([v75 isEqualToString:@"CATEGORY_CHECK_IN"])
      {
        uint64_t v76 = 14;
      }
      else if ([v75 isEqualToString:@"CATEGORY_WORKFLOW"])
      {
        uint64_t v76 = 15;
      }
      else if ([v75 isEqualToString:@"CATEGORY_REQUEST"])
      {
        uint64_t v76 = 16;
      }
      else if ([v75 isEqualToString:@"CATEGORY_SET"])
      {
        uint64_t v76 = 17;
      }
      else if ([v75 isEqualToString:@"CATEGORY_CALL_AUDIO"])
      {
        uint64_t v76 = 18;
      }
      else if ([v75 isEqualToString:@"CATEGORY_CALL_VIDEO"])
      {
        uint64_t v76 = 19;
      }
      else if ([v75 isEqualToString:@"CATEGORY_PLAY_SOUND"])
      {
        uint64_t v76 = 20;
      }
      else if ([v75 isEqualToString:@"CATEGORY_USER_ACTIVITY"])
      {
        uint64_t v76 = 21;
      }
      else
      {
        uint64_t v76 = 1;
      }

      [(_INPBIntentMetadata *)self setIntentCategory:v76];
    }
    v77 = [v9 objectForKeyedSubscript:@"triggerMethod"];
    if (v77)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v78 = v77;
      }
      else {
        long long v78 = 0;
      }
    }
    else
    {
      long long v78 = 0;
    }
    id v79 = v78;

    if (v79)
    {
      id v80 = [v9 objectForKeyedSubscript:@"triggerMethod"];
      if ([v80 isEqualToString:@"Other"])
      {
        uint64_t v81 = 0;
      }
      else if ([v80 isEqualToString:@"HomeButton"])
      {
        uint64_t v81 = 10;
      }
      else if ([v80 isEqualToString:@"RemoteButton"])
      {
        uint64_t v81 = 20;
      }
      else if ([v80 isEqualToString:@"VoiceTrigger"])
      {
        uint64_t v81 = 30;
      }
      else
      {
        uint64_t v81 = 0;
      }

      [(_INPBIntentMetadata *)self setTriggerMethod:v81];
    }
    uint64_t v82 = objc_opt_class();
    int v83 = [v9 objectForKeyedSubscript:@"defaultImageValue"];
    v84 = [v140 decodeObjectOfClass:v82 from:v83];
    uint64_t v85 = INIntentSlotValueTransformToImageValue(v84);
    [(_INPBIntentMetadata *)self setDefaultImageValue:v85];

    v86 = [v9 objectForKeyedSubscript:@"parameterImages"];
    if (v86)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v87 = v86;
      }
      else {
        v87 = 0;
      }
    }
    else
    {
      v87 = 0;
    }
    id v88 = v87;

    long long v152 = 0u;
    long long v153 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    v139 = v88;
    int v89 = [v88 allKeys];
    uint64_t v90 = [v89 countByEnumeratingWithState:&v150 objects:v156 count:16];
    if (v90)
    {
      uint64_t v91 = v90;
      uint64_t v92 = *(void *)v151;
      do
      {
        for (uint64_t i = 0; i != v91; ++i)
        {
          if (*(void *)v151 != v92) {
            objc_enumerationMutation(v89);
          }
          id v94 = *(id *)(*((void *)&v150 + 1) + 8 * i);
          if (v94)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v95 = v94;
            }
            else {
              v95 = 0;
            }
          }
          else
          {
            v95 = 0;
          }
          id v96 = v95;

          if (v96)
          {
            uint64_t v97 = objc_alloc_init(_INPBPair);
            [(_INPBPair *)v97 setKey:v94];
            uint64_t v98 = objc_opt_class();
            v99 = [v139 objectForKeyedSubscript:v94];
            v100 = [v140 decodeObjectOfClass:v98 from:v99];
            int v101 = INIntentSlotValueTransformToImageValue(v100);
            [(_INPBPair *)v97 addPairImageValue:v101];

            [(_INPBIntentMetadata *)self addParameterImages:v97];
          }
        }
        uint64_t v91 = [v89 countByEnumeratingWithState:&v150 objects:v156 count:16];
      }
      while (v91);
    }

    uint64_t v102 = [v9 objectForKeyedSubscript:@"forceNeedsValueForParameters"];
    if (v102)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v103 = v102;
      }
      else {
        v103 = 0;
      }
    }
    else
    {
      v103 = 0;
    }
    id v104 = v103;

    id v105 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v146 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    id v106 = v104;
    uint64_t v107 = [v106 countByEnumeratingWithState:&v146 objects:v155 count:16];
    if (v107)
    {
      uint64_t v108 = v107;
      uint64_t v109 = *(void *)v147;
      do
      {
        for (uint64_t j = 0; j != v108; ++j)
        {
          if (*(void *)v147 != v109) {
            objc_enumerationMutation(v106);
          }
          id v111 = *(id *)(*((void *)&v146 + 1) + 8 * j);
          if (v111)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v112 = v111;
            }
            else {
              uint64_t v112 = 0;
            }
          }
          else
          {
            uint64_t v112 = 0;
          }
          id v113 = v112;

          objc_msgSend(v105, "if_addObjectIfNonNil:", v113);
        }
        uint64_t v108 = [v106 countByEnumeratingWithState:&v146 objects:v155 count:16];
      }
      while (v108);
    }

    [(_INPBIntentMetadata *)self setForceNeedsValueForParameters:v105];
    v114 = [v138 objectForKeyedSubscript:@"requiredEntitlements"];
    if (v114)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v115 = v114;
      }
      else {
        v115 = 0;
      }
    }
    else
    {
      v115 = 0;
    }
    id v116 = v115;

    long long v144 = 0u;
    long long v145 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    id v117 = v116;
    uint64_t v118 = [v117 countByEnumeratingWithState:&v142 objects:v154 count:16];
    if (v118)
    {
      uint64_t v119 = v118;
      uint64_t v120 = *(void *)v143;
      do
      {
        for (uint64_t k = 0; k != v119; ++k)
        {
          if (*(void *)v143 != v120) {
            objc_enumerationMutation(v117);
          }
          id v122 = *(id *)(*((void *)&v142 + 1) + 8 * k);
          if (v122)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              int v123 = v122;
            }
            else {
              int v123 = 0;
            }
          }
          else
          {
            int v123 = 0;
          }
          id v124 = v123;

          if (v124)
          {
            id v125 = v122;
            if ([v125 isEqualToString:@"CONTACTS"])
            {
              uint64_t v126 = 1;
            }
            else if ([v125 isEqualToString:@"LOCATION"])
            {
              uint64_t v126 = 2;
            }
            else
            {
              uint64_t v126 = 1;
            }

            [(_INPBIntentMetadata *)self addRequiredEntitlement:v126];
          }
        }
        uint64_t v119 = [v117 countByEnumeratingWithState:&v142 objects:v154 count:16];
      }
      while (v119);
    }

    v127 = [v138 objectForKeyedSubscript:@"userUtterance"];
    if (v127)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v128 = v127;
      }
      else {
        uint64_t v128 = 0;
      }
    }
    else
    {
      uint64_t v128 = 0;
    }
    id v129 = v128;

    v130 = INIntentSlotValueTransformToString(v129);
    [(_INPBIntentMetadata *)self setUserUtterance:v130];

    v131 = [v138 objectForKeyedSubscript:@"versioningHash"];
    if (v131)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v132 = v131;
      }
      else {
        int v132 = 0;
      }
    }
    else
    {
      int v132 = 0;
    }
    id v133 = v132;

    if (v133)
    {
      v134 = [v138 objectForKeyedSubscript:@"versioningHash"];
      -[_INPBIntentMetadata setVersioningHash:](self, "setVersioningHash:", [v134 unsignedLongLongValue]);
    }
    id v8 = v136;
    id v7 = v137;
  }
  else
  {
  }
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  unint64_t v10 = objc_alloc_init(_INPBIntentMetadata);
  [(_INPBIntentMetadata *)v10 _intents_decodeWithJSONDecoder:v9 codableDescription:v8 from:v7];

  return v10;
}

@end