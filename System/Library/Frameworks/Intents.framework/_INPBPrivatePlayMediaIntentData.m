@interface _INPBPrivatePlayMediaIntentData
+ (BOOL)supportsSecureCoding;
+ (Class)audioSearchResultsType;
- (BOOL)appInferred;
- (BOOL)appSelectionEnabled;
- (BOOL)appSelectionSignalsEnabled;
- (BOOL)entityConfidenceSignalsEnabled;
- (BOOL)hasAlternativeProviderBundleIdentifier;
- (BOOL)hasAmpPAFDataSetID;
- (BOOL)hasAppInferred;
- (BOOL)hasAppSelectionEnabled;
- (BOOL)hasAppSelectionSignalsEnabled;
- (BOOL)hasAppSelectionSignalsFrequencyDenominator;
- (BOOL)hasEntityConfidenceSignalsEnabled;
- (BOOL)hasEntityConfidenceSignalsFrequencyDenominatorInternal;
- (BOOL)hasEntityConfidenceSignalsFrequencyDenominatorProd;
- (BOOL)hasEntityConfidenceSignalsMaxItemsToDisambiguate;
- (BOOL)hasImmediatelyStartPlayback;
- (BOOL)hasIsAmbiguousPlay;
- (BOOL)hasIsPersonalizedRequest;
- (BOOL)hasPegasusMetaData;
- (BOOL)hasPrivateMediaIntentData;
- (BOOL)hasShouldSuppressCommonWholeHouseAudioRoutes;
- (BOOL)immediatelyStartPlayback;
- (BOOL)isAmbiguousPlay;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPersonalizedRequest;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldSuppressCommonWholeHouseAudioRoutes;
- (NSArray)audioSearchResults;
- (NSArray)internalSignals;
- (NSData)pegasusMetaData;
- (_INPBPrivateMediaIntentData)privateMediaIntentData;
- (_INPBPrivatePlayMediaIntentData)initWithCoder:(id)a3;
- (_INPBString)alternativeProviderBundleIdentifier;
- (_INPBString)ampPAFDataSetID;
- (id)audioSearchResultsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)internalSignalAtIndex:(unint64_t)a3;
- (int)appSelectionSignalsFrequencyDenominator;
- (int)entityConfidenceSignalsFrequencyDenominatorInternal;
- (int)entityConfidenceSignalsFrequencyDenominatorProd;
- (int)entityConfidenceSignalsMaxItemsToDisambiguate;
- (unint64_t)audioSearchResultsCount;
- (unint64_t)hash;
- (unint64_t)internalSignalsCount;
- (void)addAudioSearchResults:(id)a3;
- (void)addInternalSignal:(id)a3;
- (void)clearAudioSearchResults;
- (void)clearInternalSignals;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternativeProviderBundleIdentifier:(id)a3;
- (void)setAmpPAFDataSetID:(id)a3;
- (void)setAppInferred:(BOOL)a3;
- (void)setAppSelectionEnabled:(BOOL)a3;
- (void)setAppSelectionSignalsEnabled:(BOOL)a3;
- (void)setAppSelectionSignalsFrequencyDenominator:(int)a3;
- (void)setAudioSearchResults:(id)a3;
- (void)setEntityConfidenceSignalsEnabled:(BOOL)a3;
- (void)setEntityConfidenceSignalsFrequencyDenominatorInternal:(int)a3;
- (void)setEntityConfidenceSignalsFrequencyDenominatorProd:(int)a3;
- (void)setEntityConfidenceSignalsMaxItemsToDisambiguate:(int)a3;
- (void)setHasAppInferred:(BOOL)a3;
- (void)setHasAppSelectionEnabled:(BOOL)a3;
- (void)setHasAppSelectionSignalsEnabled:(BOOL)a3;
- (void)setHasAppSelectionSignalsFrequencyDenominator:(BOOL)a3;
- (void)setHasEntityConfidenceSignalsEnabled:(BOOL)a3;
- (void)setHasEntityConfidenceSignalsFrequencyDenominatorInternal:(BOOL)a3;
- (void)setHasEntityConfidenceSignalsFrequencyDenominatorProd:(BOOL)a3;
- (void)setHasEntityConfidenceSignalsMaxItemsToDisambiguate:(BOOL)a3;
- (void)setHasImmediatelyStartPlayback:(BOOL)a3;
- (void)setHasIsAmbiguousPlay:(BOOL)a3;
- (void)setHasIsPersonalizedRequest:(BOOL)a3;
- (void)setHasShouldSuppressCommonWholeHouseAudioRoutes:(BOOL)a3;
- (void)setImmediatelyStartPlayback:(BOOL)a3;
- (void)setInternalSignals:(id)a3;
- (void)setIsAmbiguousPlay:(BOOL)a3;
- (void)setIsPersonalizedRequest:(BOOL)a3;
- (void)setPegasusMetaData:(id)a3;
- (void)setPrivateMediaIntentData:(id)a3;
- (void)setShouldSuppressCommonWholeHouseAudioRoutes:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBPrivatePlayMediaIntentData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateMediaIntentData, 0);
  objc_storeStrong((id *)&self->_pegasusMetaData, 0);
  objc_storeStrong((id *)&self->_internalSignals, 0);
  objc_storeStrong((id *)&self->_audioSearchResults, 0);
  objc_storeStrong((id *)&self->_ampPAFDataSetID, 0);

  objc_storeStrong((id *)&self->_alternativeProviderBundleIdentifier, 0);
}

- (BOOL)shouldSuppressCommonWholeHouseAudioRoutes
{
  return self->_shouldSuppressCommonWholeHouseAudioRoutes;
}

- (_INPBPrivateMediaIntentData)privateMediaIntentData
{
  return self->_privateMediaIntentData;
}

- (NSData)pegasusMetaData
{
  return self->_pegasusMetaData;
}

- (BOOL)isPersonalizedRequest
{
  return self->_isPersonalizedRequest;
}

- (BOOL)isAmbiguousPlay
{
  return self->_isAmbiguousPlay;
}

- (NSArray)internalSignals
{
  return self->_internalSignals;
}

- (BOOL)immediatelyStartPlayback
{
  return self->_immediatelyStartPlayback;
}

- (int)entityConfidenceSignalsMaxItemsToDisambiguate
{
  return self->_entityConfidenceSignalsMaxItemsToDisambiguate;
}

- (int)entityConfidenceSignalsFrequencyDenominatorProd
{
  return self->_entityConfidenceSignalsFrequencyDenominatorProd;
}

- (int)entityConfidenceSignalsFrequencyDenominatorInternal
{
  return self->_entityConfidenceSignalsFrequencyDenominatorInternal;
}

- (BOOL)entityConfidenceSignalsEnabled
{
  return self->_entityConfidenceSignalsEnabled;
}

- (NSArray)audioSearchResults
{
  return self->_audioSearchResults;
}

- (int)appSelectionSignalsFrequencyDenominator
{
  return self->_appSelectionSignalsFrequencyDenominator;
}

- (BOOL)appSelectionSignalsEnabled
{
  return self->_appSelectionSignalsEnabled;
}

- (BOOL)appSelectionEnabled
{
  return self->_appSelectionEnabled;
}

- (BOOL)appInferred
{
  return self->_appInferred;
}

- (_INPBString)ampPAFDataSetID
{
  return self->_ampPAFDataSetID;
}

- (_INPBString)alternativeProviderBundleIdentifier
{
  return self->_alternativeProviderBundleIdentifier;
}

- (id)dictionaryRepresentation
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBPrivatePlayMediaIntentData *)self alternativeProviderBundleIdentifier];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"alternativeProviderBundleIdentifier"];

  v6 = [(_INPBPrivatePlayMediaIntentData *)self ampPAFDataSetID];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"ampPAFDataSetID"];

  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppInferred])
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPrivatePlayMediaIntentData appInferred](self, "appInferred"));
    [v3 setObject:v8 forKeyedSubscript:@"appInferred"];
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppSelectionEnabled])
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPrivatePlayMediaIntentData appSelectionEnabled](self, "appSelectionEnabled"));
    [v3 setObject:v9 forKeyedSubscript:@"appSelectionEnabled"];
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppSelectionSignalsEnabled])
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPrivatePlayMediaIntentData appSelectionSignalsEnabled](self, "appSelectionSignalsEnabled"));
    [v3 setObject:v10 forKeyedSubscript:@"appSelectionSignalsEnabled"];
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppSelectionSignalsFrequencyDenominator])
  {
    v11 = objc_msgSend(NSNumber, "numberWithInt:", -[_INPBPrivatePlayMediaIntentData appSelectionSignalsFrequencyDenominator](self, "appSelectionSignalsFrequencyDenominator"));
    [v3 setObject:v11 forKeyedSubscript:@"appSelectionSignalsFrequencyDenominator"];
  }
  if ([(NSArray *)self->_audioSearchResults count])
  {
    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v13 = self->_audioSearchResults;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "dictionaryRepresentation", (void)v34);
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"audioSearchResults"];
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsEnabled])
  {
    v19 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPrivatePlayMediaIntentData entityConfidenceSignalsEnabled](self, "entityConfidenceSignalsEnabled"));
    [v3 setObject:v19 forKeyedSubscript:@"entityConfidenceSignalsEnabled"];
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsFrequencyDenominatorInternal])
  {
    v20 = objc_msgSend(NSNumber, "numberWithInt:", -[_INPBPrivatePlayMediaIntentData entityConfidenceSignalsFrequencyDenominatorInternal](self, "entityConfidenceSignalsFrequencyDenominatorInternal"));
    [v3 setObject:v20 forKeyedSubscript:@"entityConfidenceSignalsFrequencyDenominatorInternal"];
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsFrequencyDenominatorProd])
  {
    v21 = objc_msgSend(NSNumber, "numberWithInt:", -[_INPBPrivatePlayMediaIntentData entityConfidenceSignalsFrequencyDenominatorProd](self, "entityConfidenceSignalsFrequencyDenominatorProd"));
    [v3 setObject:v21 forKeyedSubscript:@"entityConfidenceSignalsFrequencyDenominatorProd"];
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsMaxItemsToDisambiguate])
  {
    v22 = objc_msgSend(NSNumber, "numberWithInt:", -[_INPBPrivatePlayMediaIntentData entityConfidenceSignalsMaxItemsToDisambiguate](self, "entityConfidenceSignalsMaxItemsToDisambiguate"));
    [v3 setObject:v22 forKeyedSubscript:@"entityConfidenceSignalsMaxItemsToDisambiguate"];
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasImmediatelyStartPlayback])
  {
    v23 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPrivatePlayMediaIntentData immediatelyStartPlayback](self, "immediatelyStartPlayback"));
    [v3 setObject:v23 forKeyedSubscript:@"immediatelyStartPlayback"];
  }
  if (self->_internalSignals)
  {
    v24 = [(_INPBPrivatePlayMediaIntentData *)self internalSignals];
    v25 = (void *)[v24 copy];
    [v3 setObject:v25 forKeyedSubscript:@"internalSignal"];
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasIsAmbiguousPlay])
  {
    v26 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPrivatePlayMediaIntentData isAmbiguousPlay](self, "isAmbiguousPlay"));
    [v3 setObject:v26 forKeyedSubscript:@"isAmbiguousPlay"];
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasIsPersonalizedRequest])
  {
    v27 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPrivatePlayMediaIntentData isPersonalizedRequest](self, "isPersonalizedRequest"));
    [v3 setObject:v27 forKeyedSubscript:@"isPersonalizedRequest"];
  }
  if (self->_pegasusMetaData)
  {
    v28 = [(_INPBPrivatePlayMediaIntentData *)self pegasusMetaData];
    v29 = (void *)[v28 copy];
    [v3 setObject:v29 forKeyedSubscript:@"pegasusMetaData"];
  }
  v30 = [(_INPBPrivatePlayMediaIntentData *)self privateMediaIntentData];
  v31 = [v30 dictionaryRepresentation];
  [v3 setObject:v31 forKeyedSubscript:@"privateMediaIntentData"];

  if ([(_INPBPrivatePlayMediaIntentData *)self hasShouldSuppressCommonWholeHouseAudioRoutes])
  {
    v32 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBPrivatePlayMediaIntentData shouldSuppressCommonWholeHouseAudioRoutes](self, "shouldSuppressCommonWholeHouseAudioRoutes"));
    [v3 setObject:v32 forKeyedSubscript:@"shouldSuppressCommonWholeHouseAudioRoutes"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v21 = [(_INPBString *)self->_alternativeProviderBundleIdentifier hash];
  unint64_t v20 = [(_INPBString *)self->_ampPAFDataSetID hash];
  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppInferred]) {
    uint64_t v19 = 2654435761 * self->_appInferred;
  }
  else {
    uint64_t v19 = 0;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppSelectionEnabled]) {
    uint64_t v18 = 2654435761 * self->_appSelectionEnabled;
  }
  else {
    uint64_t v18 = 0;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppSelectionSignalsEnabled]) {
    uint64_t v17 = 2654435761 * self->_appSelectionSignalsEnabled;
  }
  else {
    uint64_t v17 = 0;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppSelectionSignalsFrequencyDenominator])
  {
    uint64_t v16 = 2654435761 * self->_appSelectionSignalsFrequencyDenominator;
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint64_t v15 = [(NSArray *)self->_audioSearchResults hash];
  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsEnabled]) {
    uint64_t v14 = 2654435761 * self->_entityConfidenceSignalsEnabled;
  }
  else {
    uint64_t v14 = 0;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsFrequencyDenominatorInternal])
  {
    uint64_t v13 = 2654435761 * self->_entityConfidenceSignalsFrequencyDenominatorInternal;
  }
  else
  {
    uint64_t v13 = 0;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsFrequencyDenominatorProd])
  {
    uint64_t v3 = 2654435761 * self->_entityConfidenceSignalsFrequencyDenominatorProd;
  }
  else
  {
    uint64_t v3 = 0;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsMaxItemsToDisambiguate])
  {
    uint64_t v4 = 2654435761 * self->_entityConfidenceSignalsMaxItemsToDisambiguate;
  }
  else
  {
    uint64_t v4 = 0;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasImmediatelyStartPlayback]) {
    uint64_t v5 = 2654435761 * self->_immediatelyStartPlayback;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [(NSArray *)self->_internalSignals hash];
  if ([(_INPBPrivatePlayMediaIntentData *)self hasIsAmbiguousPlay]) {
    uint64_t v7 = 2654435761 * self->_isAmbiguousPlay;
  }
  else {
    uint64_t v7 = 0;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasIsPersonalizedRequest]) {
    uint64_t v8 = 2654435761 * self->_isPersonalizedRequest;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [(NSData *)self->_pegasusMetaData hash];
  unint64_t v10 = [(_INPBPrivateMediaIntentData *)self->_privateMediaIntentData hash];
  if ([(_INPBPrivatePlayMediaIntentData *)self hasShouldSuppressCommonWholeHouseAudioRoutes])
  {
    uint64_t v11 = 2654435761 * self->_shouldSuppressCommonWholeHouseAudioRoutes;
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_76;
  }
  uint64_t v5 = [(_INPBPrivatePlayMediaIntentData *)self alternativeProviderBundleIdentifier];
  uint64_t v6 = [v4 alternativeProviderBundleIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_75;
  }
  uint64_t v7 = [(_INPBPrivatePlayMediaIntentData *)self alternativeProviderBundleIdentifier];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBPrivatePlayMediaIntentData *)self alternativeProviderBundleIdentifier];
    unint64_t v10 = [v4 alternativeProviderBundleIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPrivatePlayMediaIntentData *)self ampPAFDataSetID];
  uint64_t v6 = [v4 ampPAFDataSetID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_75;
  }
  uint64_t v12 = [(_INPBPrivatePlayMediaIntentData *)self ampPAFDataSetID];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_INPBPrivatePlayMediaIntentData *)self ampPAFDataSetID];
    uint64_t v15 = [v4 ampPAFDataSetID];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  int v17 = [(_INPBPrivatePlayMediaIntentData *)self hasAppInferred];
  if (v17 != [v4 hasAppInferred]) {
    goto LABEL_76;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppInferred])
  {
    if ([v4 hasAppInferred])
    {
      int appInferred = self->_appInferred;
      if (appInferred != [v4 appInferred]) {
        goto LABEL_76;
      }
    }
  }
  int v19 = [(_INPBPrivatePlayMediaIntentData *)self hasAppSelectionEnabled];
  if (v19 != [v4 hasAppSelectionEnabled]) {
    goto LABEL_76;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppSelectionEnabled])
  {
    if ([v4 hasAppSelectionEnabled])
    {
      int appSelectionEnabled = self->_appSelectionEnabled;
      if (appSelectionEnabled != [v4 appSelectionEnabled]) {
        goto LABEL_76;
      }
    }
  }
  int v21 = [(_INPBPrivatePlayMediaIntentData *)self hasAppSelectionSignalsEnabled];
  if (v21 != [v4 hasAppSelectionSignalsEnabled]) {
    goto LABEL_76;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppSelectionSignalsEnabled])
  {
    if ([v4 hasAppSelectionSignalsEnabled])
    {
      int appSelectionSignalsEnabled = self->_appSelectionSignalsEnabled;
      if (appSelectionSignalsEnabled != [v4 appSelectionSignalsEnabled]) {
        goto LABEL_76;
      }
    }
  }
  int v23 = [(_INPBPrivatePlayMediaIntentData *)self hasAppSelectionSignalsFrequencyDenominator];
  if (v23 != [v4 hasAppSelectionSignalsFrequencyDenominator]) {
    goto LABEL_76;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppSelectionSignalsFrequencyDenominator])
  {
    if ([v4 hasAppSelectionSignalsFrequencyDenominator])
    {
      int appSelectionSignalsFrequencyDenominator = self->_appSelectionSignalsFrequencyDenominator;
      if (appSelectionSignalsFrequencyDenominator != [v4 appSelectionSignalsFrequencyDenominator])goto LABEL_76; {
    }
      }
  }
  uint64_t v5 = [(_INPBPrivatePlayMediaIntentData *)self audioSearchResults];
  uint64_t v6 = [v4 audioSearchResults];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_75;
  }
  uint64_t v25 = [(_INPBPrivatePlayMediaIntentData *)self audioSearchResults];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [(_INPBPrivatePlayMediaIntentData *)self audioSearchResults];
    v28 = [v4 audioSearchResults];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  int v30 = [(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsEnabled];
  if (v30 != [v4 hasEntityConfidenceSignalsEnabled]) {
    goto LABEL_76;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsEnabled])
  {
    if ([v4 hasEntityConfidenceSignalsEnabled])
    {
      int entityConfidenceSignalsEnabled = self->_entityConfidenceSignalsEnabled;
      if (entityConfidenceSignalsEnabled != [v4 entityConfidenceSignalsEnabled]) {
        goto LABEL_76;
      }
    }
  }
  int v32 = [(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsFrequencyDenominatorInternal];
  if (v32 != [v4 hasEntityConfidenceSignalsFrequencyDenominatorInternal]) {
    goto LABEL_76;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsFrequencyDenominatorInternal])
  {
    if ([v4 hasEntityConfidenceSignalsFrequencyDenominatorInternal])
    {
      int entityConfidenceSignalsFrequencyDenominatorInternal = self->_entityConfidenceSignalsFrequencyDenominatorInternal;
      if (entityConfidenceSignalsFrequencyDenominatorInternal != [v4 entityConfidenceSignalsFrequencyDenominatorInternal])goto LABEL_76; {
    }
      }
  }
  int v34 = [(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsFrequencyDenominatorProd];
  if (v34 != [v4 hasEntityConfidenceSignalsFrequencyDenominatorProd]) {
    goto LABEL_76;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsFrequencyDenominatorProd])
  {
    if ([v4 hasEntityConfidenceSignalsFrequencyDenominatorProd])
    {
      int entityConfidenceSignalsFrequencyDenominatorProd = self->_entityConfidenceSignalsFrequencyDenominatorProd;
      if (entityConfidenceSignalsFrequencyDenominatorProd != [v4 entityConfidenceSignalsFrequencyDenominatorProd])goto LABEL_76; {
    }
      }
  }
  int v36 = [(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsMaxItemsToDisambiguate];
  if (v36 != [v4 hasEntityConfidenceSignalsMaxItemsToDisambiguate]) {
    goto LABEL_76;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsMaxItemsToDisambiguate])
  {
    if ([v4 hasEntityConfidenceSignalsMaxItemsToDisambiguate])
    {
      int entityConfidenceSignalsMaxItemsToDisambiguate = self->_entityConfidenceSignalsMaxItemsToDisambiguate;
      if (entityConfidenceSignalsMaxItemsToDisambiguate != [v4 entityConfidenceSignalsMaxItemsToDisambiguate])goto LABEL_76; {
    }
      }
  }
  int v38 = [(_INPBPrivatePlayMediaIntentData *)self hasImmediatelyStartPlayback];
  if (v38 != [v4 hasImmediatelyStartPlayback]) {
    goto LABEL_76;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasImmediatelyStartPlayback])
  {
    if ([v4 hasImmediatelyStartPlayback])
    {
      int immediatelyStartPlayback = self->_immediatelyStartPlayback;
      if (immediatelyStartPlayback != [v4 immediatelyStartPlayback]) {
        goto LABEL_76;
      }
    }
  }
  uint64_t v5 = [(_INPBPrivatePlayMediaIntentData *)self internalSignals];
  uint64_t v6 = [v4 internalSignals];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_75;
  }
  uint64_t v40 = [(_INPBPrivatePlayMediaIntentData *)self internalSignals];
  if (v40)
  {
    v41 = (void *)v40;
    v42 = [(_INPBPrivatePlayMediaIntentData *)self internalSignals];
    v43 = [v4 internalSignals];
    int v44 = [v42 isEqual:v43];

    if (!v44) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  int v45 = [(_INPBPrivatePlayMediaIntentData *)self hasIsAmbiguousPlay];
  if (v45 != [v4 hasIsAmbiguousPlay]) {
    goto LABEL_76;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasIsAmbiguousPlay])
  {
    if ([v4 hasIsAmbiguousPlay])
    {
      int isAmbiguousPlay = self->_isAmbiguousPlay;
      if (isAmbiguousPlay != [v4 isAmbiguousPlay]) {
        goto LABEL_76;
      }
    }
  }
  int v47 = [(_INPBPrivatePlayMediaIntentData *)self hasIsPersonalizedRequest];
  if (v47 != [v4 hasIsPersonalizedRequest]) {
    goto LABEL_76;
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasIsPersonalizedRequest])
  {
    if ([v4 hasIsPersonalizedRequest])
    {
      int isPersonalizedRequest = self->_isPersonalizedRequest;
      if (isPersonalizedRequest != [v4 isPersonalizedRequest]) {
        goto LABEL_76;
      }
    }
  }
  uint64_t v5 = [(_INPBPrivatePlayMediaIntentData *)self pegasusMetaData];
  uint64_t v6 = [v4 pegasusMetaData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_75;
  }
  uint64_t v49 = [(_INPBPrivatePlayMediaIntentData *)self pegasusMetaData];
  if (v49)
  {
    v50 = (void *)v49;
    v51 = [(_INPBPrivatePlayMediaIntentData *)self pegasusMetaData];
    v52 = [v4 pegasusMetaData];
    int v53 = [v51 isEqual:v52];

    if (!v53) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBPrivatePlayMediaIntentData *)self privateMediaIntentData];
  uint64_t v6 = [v4 privateMediaIntentData];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_75:

    goto LABEL_76;
  }
  uint64_t v54 = [(_INPBPrivatePlayMediaIntentData *)self privateMediaIntentData];
  if (v54)
  {
    v55 = (void *)v54;
    v56 = [(_INPBPrivatePlayMediaIntentData *)self privateMediaIntentData];
    v57 = [v4 privateMediaIntentData];
    int v58 = [v56 isEqual:v57];

    if (!v58) {
      goto LABEL_76;
    }
  }
  else
  {
  }
  int v61 = [(_INPBPrivatePlayMediaIntentData *)self hasShouldSuppressCommonWholeHouseAudioRoutes];
  if (v61 == [v4 hasShouldSuppressCommonWholeHouseAudioRoutes])
  {
    if (!-[_INPBPrivatePlayMediaIntentData hasShouldSuppressCommonWholeHouseAudioRoutes](self, "hasShouldSuppressCommonWholeHouseAudioRoutes")|| ![v4 hasShouldSuppressCommonWholeHouseAudioRoutes]|| (int shouldSuppressCommonWholeHouseAudioRoutes = self->_shouldSuppressCommonWholeHouseAudioRoutes, shouldSuppressCommonWholeHouseAudioRoutes == objc_msgSend(v4, "shouldSuppressCommonWholeHouseAudioRoutes")))
    {
      BOOL v59 = 1;
      goto LABEL_77;
    }
  }
LABEL_76:
  BOOL v59 = 0;
LABEL_77:

  return v59;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBPrivatePlayMediaIntentData allocWithZone:](_INPBPrivatePlayMediaIntentData, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_alternativeProviderBundleIdentifier copyWithZone:a3];
  [(_INPBPrivatePlayMediaIntentData *)v5 setAlternativeProviderBundleIdentifier:v6];

  id v7 = [(_INPBString *)self->_ampPAFDataSetID copyWithZone:a3];
  [(_INPBPrivatePlayMediaIntentData *)v5 setAmpPAFDataSetID:v7];

  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppInferred]) {
    [(_INPBPrivatePlayMediaIntentData *)v5 setAppInferred:[(_INPBPrivatePlayMediaIntentData *)self appInferred]];
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppSelectionEnabled]) {
    [(_INPBPrivatePlayMediaIntentData *)v5 setAppSelectionEnabled:[(_INPBPrivatePlayMediaIntentData *)self appSelectionEnabled]];
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppSelectionSignalsEnabled]) {
    [(_INPBPrivatePlayMediaIntentData *)v5 setAppSelectionSignalsEnabled:[(_INPBPrivatePlayMediaIntentData *)self appSelectionSignalsEnabled]];
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppSelectionSignalsFrequencyDenominator])
  {
    [(_INPBPrivatePlayMediaIntentData *)v5 setAppSelectionSignalsFrequencyDenominator:[(_INPBPrivatePlayMediaIntentData *)self appSelectionSignalsFrequencyDenominator]];
  }
  uint64_t v8 = (void *)[(NSArray *)self->_audioSearchResults copyWithZone:a3];
  [(_INPBPrivatePlayMediaIntentData *)v5 setAudioSearchResults:v8];

  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsEnabled]) {
    [(_INPBPrivatePlayMediaIntentData *)v5 setEntityConfidenceSignalsEnabled:[(_INPBPrivatePlayMediaIntentData *)self entityConfidenceSignalsEnabled]];
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsFrequencyDenominatorInternal])
  {
    [(_INPBPrivatePlayMediaIntentData *)v5 setEntityConfidenceSignalsFrequencyDenominatorInternal:[(_INPBPrivatePlayMediaIntentData *)self entityConfidenceSignalsFrequencyDenominatorInternal]];
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsFrequencyDenominatorProd])
  {
    [(_INPBPrivatePlayMediaIntentData *)v5 setEntityConfidenceSignalsFrequencyDenominatorProd:[(_INPBPrivatePlayMediaIntentData *)self entityConfidenceSignalsFrequencyDenominatorProd]];
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsMaxItemsToDisambiguate])
  {
    [(_INPBPrivatePlayMediaIntentData *)v5 setEntityConfidenceSignalsMaxItemsToDisambiguate:[(_INPBPrivatePlayMediaIntentData *)self entityConfidenceSignalsMaxItemsToDisambiguate]];
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasImmediatelyStartPlayback]) {
    [(_INPBPrivatePlayMediaIntentData *)v5 setImmediatelyStartPlayback:[(_INPBPrivatePlayMediaIntentData *)self immediatelyStartPlayback]];
  }
  uint64_t v9 = (void *)[(NSArray *)self->_internalSignals copyWithZone:a3];
  [(_INPBPrivatePlayMediaIntentData *)v5 setInternalSignals:v9];

  if ([(_INPBPrivatePlayMediaIntentData *)self hasIsAmbiguousPlay]) {
    [(_INPBPrivatePlayMediaIntentData *)v5 setIsAmbiguousPlay:[(_INPBPrivatePlayMediaIntentData *)self isAmbiguousPlay]];
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasIsPersonalizedRequest]) {
    [(_INPBPrivatePlayMediaIntentData *)v5 setIsPersonalizedRequest:[(_INPBPrivatePlayMediaIntentData *)self isPersonalizedRequest]];
  }
  unint64_t v10 = (void *)[(NSData *)self->_pegasusMetaData copyWithZone:a3];
  [(_INPBPrivatePlayMediaIntentData *)v5 setPegasusMetaData:v10];

  id v11 = [(_INPBPrivateMediaIntentData *)self->_privateMediaIntentData copyWithZone:a3];
  [(_INPBPrivatePlayMediaIntentData *)v5 setPrivateMediaIntentData:v11];

  if ([(_INPBPrivatePlayMediaIntentData *)self hasShouldSuppressCommonWholeHouseAudioRoutes])
  {
    [(_INPBPrivatePlayMediaIntentData *)v5 setShouldSuppressCommonWholeHouseAudioRoutes:[(_INPBPrivatePlayMediaIntentData *)self shouldSuppressCommonWholeHouseAudioRoutes]];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBPrivatePlayMediaIntentData *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBPrivatePlayMediaIntentData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBPrivatePlayMediaIntentData *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBPrivatePlayMediaIntentData *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBPrivatePlayMediaIntentData *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_INPBPrivatePlayMediaIntentData *)self alternativeProviderBundleIdentifier];

  if (v5)
  {
    id v6 = [(_INPBPrivatePlayMediaIntentData *)self alternativeProviderBundleIdentifier];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBPrivatePlayMediaIntentData *)self ampPAFDataSetID];

  if (v7)
  {
    uint64_t v8 = [(_INPBPrivatePlayMediaIntentData *)self ampPAFDataSetID];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppInferred]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppSelectionEnabled]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppSelectionSignalsEnabled]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasAppSelectionSignalsFrequencyDenominator])
  {
    PBDataWriterWriteInt32Field();
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = self->_audioSearchResults;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v11);
  }

  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsEnabled]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsFrequencyDenominatorInternal])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsFrequencyDenominatorProd])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasEntityConfidenceSignalsMaxItemsToDisambiguate])
  {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasImmediatelyStartPlayback]) {
    PBDataWriterWriteBOOLField();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v14 = self->_internalSignals;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteStringField();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  if ([(_INPBPrivatePlayMediaIntentData *)self hasIsAmbiguousPlay]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasIsPersonalizedRequest]) {
    PBDataWriterWriteBOOLField();
  }
  int v19 = [(_INPBPrivatePlayMediaIntentData *)self pegasusMetaData];

  if (v19) {
    PBDataWriterWriteDataField();
  }
  unint64_t v20 = [(_INPBPrivatePlayMediaIntentData *)self privateMediaIntentData];

  if (v20)
  {
    int v21 = [(_INPBPrivatePlayMediaIntentData *)self privateMediaIntentData];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBPrivatePlayMediaIntentData *)self hasShouldSuppressCommonWholeHouseAudioRoutes])
  {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBPrivatePlayMediaIntentDataReadFrom(self, (uint64_t)a3);
}

- (void)setHasShouldSuppressCommonWholeHouseAudioRoutes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasShouldSuppressCommonWholeHouseAudioRoutes
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setShouldSuppressCommonWholeHouseAudioRoutes:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_int shouldSuppressCommonWholeHouseAudioRoutes = a3;
}

- (BOOL)hasPrivateMediaIntentData
{
  return self->_privateMediaIntentData != 0;
}

- (void)setPrivateMediaIntentData:(id)a3
{
}

- (BOOL)hasPegasusMetaData
{
  return self->_pegasusMetaData != 0;
}

- (void)setPegasusMetaData:(id)a3
{
  id v4 = (NSData *)[a3 copy];
  pegasusMetaData = self->_pegasusMetaData;
  self->_pegasusMetaData = v4;

  MEMORY[0x1F41817F8](v4, pegasusMetaData);
}

- (void)setHasIsPersonalizedRequest:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsPersonalizedRequest
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setIsPersonalizedRequest:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_int isPersonalizedRequest = a3;
}

- (void)setHasIsAmbiguousPlay:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsAmbiguousPlay
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsAmbiguousPlay:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_int isAmbiguousPlay = a3;
}

- (id)internalSignalAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_internalSignals objectAtIndexedSubscript:a3];
}

- (unint64_t)internalSignalsCount
{
  return [(NSArray *)self->_internalSignals count];
}

- (void)addInternalSignal:(id)a3
{
  id v4 = a3;
  internalSignals = self->_internalSignals;
  id v8 = v4;
  if (!internalSignals)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_internalSignals;
    self->_internalSignals = v6;

    id v4 = v8;
    internalSignals = self->_internalSignals;
  }
  [(NSArray *)internalSignals addObject:v4];
}

- (void)clearInternalSignals
{
}

- (void)setInternalSignals:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  internalSignals = self->_internalSignals;
  self->_internalSignals = v4;

  MEMORY[0x1F41817F8](v4, internalSignals);
}

- (void)setHasImmediatelyStartPlayback:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasImmediatelyStartPlayback
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setImmediatelyStartPlayback:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int immediatelyStartPlayback = a3;
}

- (void)setHasEntityConfidenceSignalsMaxItemsToDisambiguate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasEntityConfidenceSignalsMaxItemsToDisambiguate
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setEntityConfidenceSignalsMaxItemsToDisambiguate:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int entityConfidenceSignalsMaxItemsToDisambiguate = a3;
}

- (void)setHasEntityConfidenceSignalsFrequencyDenominatorProd:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasEntityConfidenceSignalsFrequencyDenominatorProd
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setEntityConfidenceSignalsFrequencyDenominatorProd:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int entityConfidenceSignalsFrequencyDenominatorProd = a3;
}

- (void)setHasEntityConfidenceSignalsFrequencyDenominatorInternal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasEntityConfidenceSignalsFrequencyDenominatorInternal
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setEntityConfidenceSignalsFrequencyDenominatorInternal:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int entityConfidenceSignalsFrequencyDenominatorInternal = a3;
}

- (void)setHasEntityConfidenceSignalsEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasEntityConfidenceSignalsEnabled
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setEntityConfidenceSignalsEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int entityConfidenceSignalsEnabled = a3;
}

- (id)audioSearchResultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_audioSearchResults objectAtIndexedSubscript:a3];
}

- (unint64_t)audioSearchResultsCount
{
  return [(NSArray *)self->_audioSearchResults count];
}

- (void)addAudioSearchResults:(id)a3
{
  id v4 = a3;
  audioSearchResults = self->_audioSearchResults;
  id v8 = v4;
  if (!audioSearchResults)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_audioSearchResults;
    self->_audioSearchResults = v6;

    id v4 = v8;
    audioSearchResults = self->_audioSearchResults;
  }
  [(NSArray *)audioSearchResults addObject:v4];
}

- (void)clearAudioSearchResults
{
}

- (void)setAudioSearchResults:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  audioSearchResults = self->_audioSearchResults;
  self->_audioSearchResults = v4;

  MEMORY[0x1F41817F8](v4, audioSearchResults);
}

- (void)setHasAppSelectionSignalsFrequencyDenominator:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAppSelectionSignalsFrequencyDenominator
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setAppSelectionSignalsFrequencyDenominator:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int appSelectionSignalsFrequencyDenominator = a3;
}

- (void)setHasAppSelectionSignalsEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAppSelectionSignalsEnabled
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setAppSelectionSignalsEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_int appSelectionSignalsEnabled = a3;
}

- (void)setHasAppSelectionEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAppSelectionEnabled
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAppSelectionEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int appSelectionEnabled = a3;
}

- (void)setHasAppInferred:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAppInferred
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setAppInferred:(BOOL)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int appInferred = a3;
}

- (BOOL)hasAmpPAFDataSetID
{
  return self->_ampPAFDataSetID != 0;
}

- (void)setAmpPAFDataSetID:(id)a3
{
}

- (BOOL)hasAlternativeProviderBundleIdentifier
{
  return self->_alternativeProviderBundleIdentifier != 0;
}

- (void)setAlternativeProviderBundleIdentifier:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)audioSearchResultsType
{
  return (Class)objc_opt_class();
}

@end