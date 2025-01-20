@interface INPrivatePlayMediaIntentData
+ (BOOL)supportsSecureCoding;
+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5;
- (BOOL)isEqual:(id)a3;
- (INPrivateMediaIntentData)privateMediaIntentData;
- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5;
- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6;
- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9;
- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10;
- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10 isAmbiguousPlay:(id)a11;
- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10 isAmbiguousPlay:(id)a11 isPersonalizedRequest:(id)a12;
- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10 isAmbiguousPlay:(id)a11 isPersonalizedRequest:(id)a12 internalSignals:(id)a13 entityConfidenceSignalsEnabled:(id)a14 entityConfidenceSignalsFrequencyDenominatorInternal:(id)a15 entityConfidenceSignalsFrequencyDenominatorProd:(id)a16 entityConfidenceSignalsMaxItemsToDisambiguate:(id)a17;
- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10 isAmbiguousPlay:(id)a11 isPersonalizedRequest:(id)a12 internalSignals:(id)a13 entityConfidenceSignalsEnabled:(id)a14 entityConfidenceSignalsFrequencyDenominatorInternal:(id)a15 entityConfidenceSignalsFrequencyDenominatorProd:(id)a16 entityConfidenceSignalsMaxItemsToDisambiguate:(id)a17 alternativeProviderBundleIdentifier:(id)a18;
- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10 isAmbiguousPlay:(id)a11 isPersonalizedRequest:(id)a12 internalSignals:(id)a13 entityConfidenceSignalsEnabled:(id)a14 entityConfidenceSignalsFrequencyDenominatorInternal:(id)a15 entityConfidenceSignalsFrequencyDenominatorProd:(id)a16 entityConfidenceSignalsMaxItemsToDisambiguate:(id)a17 alternativeProviderBundleIdentifier:(id)a18 ampPAFDataSetID:(id)a19;
- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10 isAmbiguousPlay:(id)a11 isPersonalizedRequest:(id)a12 internalSignals:(id)a13 entityConfidenceSignalsEnabled:(id)a14 entityConfidenceSignalsFrequencyDenominatorInternal:(id)a15 entityConfidenceSignalsFrequencyDenominatorProd:(id)a16 entityConfidenceSignalsMaxItemsToDisambiguate:(id)a17 alternativeProviderBundleIdentifier:(id)a18 ampPAFDataSetID:(id)a19 pegasusMetaData:(id)a20;
- (INPrivatePlayMediaIntentData)initWithCoder:(id)a3;
- (NSArray)audioSearchResults;
- (NSArray)internalSignals;
- (NSData)pegasusMetaData;
- (NSNumber)appInferred;
- (NSNumber)appSelectionEnabled;
- (NSNumber)appSelectionSignalsEnabled;
- (NSNumber)appSelectionSignalsFrequencyDenominator;
- (NSNumber)entityConfidenceSignalsEnabled;
- (NSNumber)entityConfidenceSignalsFrequencyDenominatorInternal;
- (NSNumber)entityConfidenceSignalsFrequencyDenominatorProd;
- (NSNumber)entityConfidenceSignalsMaxItemsToDisambiguate;
- (NSNumber)immediatelyStartPlayback;
- (NSNumber)isAmbiguousPlay;
- (NSNumber)isPersonalizedRequest;
- (NSNumber)shouldSuppressCommonWholeHouseAudioRoutes;
- (NSString)alternativeProviderBundleIdentifier;
- (NSString)ampPAFDataSetID;
- (NSString)description;
- (id)_dictionaryRepresentation;
- (id)_intents_cacheableObjects;
- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4;
- (id)descriptionAtIndent:(unint64_t)a3;
- (unint64_t)hash;
- (void)_intents_updateContainerWithCache:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPrivateMediaIntentData:(id)a3;
@end

@implementation INPrivatePlayMediaIntentData

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10 isAmbiguousPlay:(id)a11 isPersonalizedRequest:(id)a12
{
  return -[INPrivatePlayMediaIntentData initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:](self, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0, 0, 0, 0,
           0);
}

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10 isAmbiguousPlay:(id)a11
{
  return [(INPrivatePlayMediaIntentData *)self initWithAppSelectionEnabled:a3 appInferred:a4 audioSearchResults:a5 privateMediaIntentData:a6 appSelectionSignalsEnabled:a7 appSelectionSignalsFrequencyDenominator:a8 shouldSuppressCommonWholeHouseAudioRoutes:a9 immediatelyStartPlayback:a10 isAmbiguousPlay:a11 isPersonalizedRequest:0];
}

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10
{
  return [(INPrivatePlayMediaIntentData *)self initWithAppSelectionEnabled:a3 appInferred:a4 audioSearchResults:a5 privateMediaIntentData:a6 appSelectionSignalsEnabled:a7 appSelectionSignalsFrequencyDenominator:a8 shouldSuppressCommonWholeHouseAudioRoutes:a9 immediatelyStartPlayback:a10 isAmbiguousPlay:0];
}

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9
{
  return [(INPrivatePlayMediaIntentData *)self initWithAppSelectionEnabled:a3 appInferred:a4 audioSearchResults:a5 privateMediaIntentData:a6 appSelectionSignalsEnabled:a7 appSelectionSignalsFrequencyDenominator:a8 shouldSuppressCommonWholeHouseAudioRoutes:a9 immediatelyStartPlayback:0];
}

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6
{
  return [(INPrivatePlayMediaIntentData *)self initWithAppSelectionEnabled:a3 appInferred:a4 audioSearchResults:a5 privateMediaIntentData:a6 appSelectionSignalsEnabled:0 appSelectionSignalsFrequencyDenominator:0 shouldSuppressCommonWholeHouseAudioRoutes:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pegasusMetaData, 0);
  objc_storeStrong((id *)&self->_ampPAFDataSetID, 0);
  objc_storeStrong((id *)&self->_alternativeProviderBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_entityConfidenceSignalsMaxItemsToDisambiguate, 0);
  objc_storeStrong((id *)&self->_entityConfidenceSignalsFrequencyDenominatorProd, 0);
  objc_storeStrong((id *)&self->_entityConfidenceSignalsFrequencyDenominatorInternal, 0);
  objc_storeStrong((id *)&self->_entityConfidenceSignalsEnabled, 0);
  objc_storeStrong((id *)&self->_internalSignals, 0);
  objc_storeStrong((id *)&self->_isPersonalizedRequest, 0);
  objc_storeStrong((id *)&self->_isAmbiguousPlay, 0);
  objc_storeStrong((id *)&self->_immediatelyStartPlayback, 0);
  objc_storeStrong((id *)&self->_shouldSuppressCommonWholeHouseAudioRoutes, 0);
  objc_storeStrong((id *)&self->_appSelectionSignalsFrequencyDenominator, 0);
  objc_storeStrong((id *)&self->_appSelectionSignalsEnabled, 0);
  objc_storeStrong((id *)&self->_privateMediaIntentData, 0);
  objc_storeStrong((id *)&self->_audioSearchResults, 0);
  objc_storeStrong((id *)&self->_appInferred, 0);

  objc_storeStrong((id *)&self->_appSelectionEnabled, 0);
}

- (NSData)pegasusMetaData
{
  return self->_pegasusMetaData;
}

- (NSString)ampPAFDataSetID
{
  return self->_ampPAFDataSetID;
}

- (NSString)alternativeProviderBundleIdentifier
{
  return self->_alternativeProviderBundleIdentifier;
}

- (NSNumber)entityConfidenceSignalsMaxItemsToDisambiguate
{
  return self->_entityConfidenceSignalsMaxItemsToDisambiguate;
}

- (NSNumber)entityConfidenceSignalsFrequencyDenominatorProd
{
  return self->_entityConfidenceSignalsFrequencyDenominatorProd;
}

- (NSNumber)entityConfidenceSignalsFrequencyDenominatorInternal
{
  return self->_entityConfidenceSignalsFrequencyDenominatorInternal;
}

- (NSNumber)entityConfidenceSignalsEnabled
{
  return self->_entityConfidenceSignalsEnabled;
}

- (NSArray)internalSignals
{
  return self->_internalSignals;
}

- (NSNumber)isPersonalizedRequest
{
  return self->_isPersonalizedRequest;
}

- (NSNumber)isAmbiguousPlay
{
  return self->_isAmbiguousPlay;
}

- (NSNumber)immediatelyStartPlayback
{
  return self->_immediatelyStartPlayback;
}

- (NSNumber)shouldSuppressCommonWholeHouseAudioRoutes
{
  return self->_shouldSuppressCommonWholeHouseAudioRoutes;
}

- (NSNumber)appSelectionSignalsFrequencyDenominator
{
  return self->_appSelectionSignalsFrequencyDenominator;
}

- (NSNumber)appSelectionSignalsEnabled
{
  return self->_appSelectionSignalsEnabled;
}

- (void)setPrivateMediaIntentData:(id)a3
{
}

- (INPrivateMediaIntentData)privateMediaIntentData
{
  return self->_privateMediaIntentData;
}

- (NSArray)audioSearchResults
{
  return self->_audioSearchResults;
}

- (NSNumber)appInferred
{
  return self->_appInferred;
}

- (NSNumber)appSelectionEnabled
{
  return self->_appSelectionEnabled;
}

- (id)_dictionaryRepresentation
{
  v58[18] = *MEMORY[0x1E4F143B8];
  v57[0] = @"appSelectionEnabled";
  appSelectionEnabled = self->_appSelectionEnabled;
  uint64_t v3 = (uint64_t)appSelectionEnabled;
  if (!appSelectionEnabled)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v58[0] = v3;
  v57[1] = @"appInferred";
  uint64_t appInferred = (uint64_t)self->_appInferred;
  uint64_t v53 = appInferred;
  if (!appInferred)
  {
    uint64_t appInferred = [MEMORY[0x1E4F1CA98] null];
  }
  v58[1] = appInferred;
  v57[2] = @"audioSearchResults";
  uint64_t audioSearchResults = (uint64_t)self->_audioSearchResults;
  uint64_t v51 = audioSearchResults;
  if (!audioSearchResults)
  {
    uint64_t audioSearchResults = [MEMORY[0x1E4F1CA98] null];
  }
  v58[2] = audioSearchResults;
  v57[3] = @"privateMediaIntentData";
  uint64_t privateMediaIntentData = (uint64_t)self->_privateMediaIntentData;
  uint64_t v49 = privateMediaIntentData;
  if (!privateMediaIntentData)
  {
    uint64_t privateMediaIntentData = [MEMORY[0x1E4F1CA98] null];
  }
  v58[3] = privateMediaIntentData;
  v57[4] = @"appSelectionSignalsEnabled";
  uint64_t appSelectionSignalsEnabled = (uint64_t)self->_appSelectionSignalsEnabled;
  uint64_t v47 = appSelectionSignalsEnabled;
  if (!appSelectionSignalsEnabled)
  {
    uint64_t appSelectionSignalsEnabled = [MEMORY[0x1E4F1CA98] null];
  }
  v58[4] = appSelectionSignalsEnabled;
  v57[5] = @"appSelectionSignalsFrequencyDenominator";
  uint64_t appSelectionSignalsFrequencyDenominator = (uint64_t)self->_appSelectionSignalsFrequencyDenominator;
  uint64_t v45 = appSelectionSignalsFrequencyDenominator;
  if (!appSelectionSignalsFrequencyDenominator)
  {
    uint64_t appSelectionSignalsFrequencyDenominator = [MEMORY[0x1E4F1CA98] null];
  }
  v58[5] = appSelectionSignalsFrequencyDenominator;
  v57[6] = @"shouldSuppressCommonWholeHouseAudioRoutes";
  uint64_t shouldSuppressCommonWholeHouseAudioRoutes = (uint64_t)self->_shouldSuppressCommonWholeHouseAudioRoutes;
  uint64_t v43 = shouldSuppressCommonWholeHouseAudioRoutes;
  if (!shouldSuppressCommonWholeHouseAudioRoutes)
  {
    uint64_t shouldSuppressCommonWholeHouseAudioRoutes = [MEMORY[0x1E4F1CA98] null];
  }
  v58[6] = shouldSuppressCommonWholeHouseAudioRoutes;
  v57[7] = @"immediatelyStartPlayback";
  uint64_t immediatelyStartPlayback = (uint64_t)self->_immediatelyStartPlayback;
  uint64_t v41 = immediatelyStartPlayback;
  if (!immediatelyStartPlayback)
  {
    uint64_t immediatelyStartPlayback = [MEMORY[0x1E4F1CA98] null];
  }
  v58[7] = immediatelyStartPlayback;
  v57[8] = @"isAmbiguousPlay";
  uint64_t isAmbiguousPlay = (uint64_t)self->_isAmbiguousPlay;
  uint64_t v39 = isAmbiguousPlay;
  if (!isAmbiguousPlay)
  {
    uint64_t isAmbiguousPlay = [MEMORY[0x1E4F1CA98] null];
  }
  v58[8] = isAmbiguousPlay;
  v57[9] = @"isPersonalizedRequest";
  uint64_t isPersonalizedRequest = (uint64_t)self->_isPersonalizedRequest;
  uint64_t v38 = isPersonalizedRequest;
  if (!isPersonalizedRequest)
  {
    uint64_t isPersonalizedRequest = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)isPersonalizedRequest;
  v58[9] = isPersonalizedRequest;
  v57[10] = @"internalSignals";
  uint64_t internalSignals = (uint64_t)self->_internalSignals;
  uint64_t v36 = internalSignals;
  if (!internalSignals)
  {
    uint64_t internalSignals = [MEMORY[0x1E4F1CA98] null];
  }
  v48 = (void *)privateMediaIntentData;
  v56 = (void *)internalSignals;
  v58[10] = internalSignals;
  v57[11] = @"entityConfidenceSignalsEnabled";
  uint64_t entityConfidenceSignalsEnabled = (uint64_t)self->_entityConfidenceSignalsEnabled;
  uint64_t v35 = entityConfidenceSignalsEnabled;
  if (!entityConfidenceSignalsEnabled)
  {
    uint64_t entityConfidenceSignalsEnabled = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = (void *)appSelectionSignalsEnabled;
  v33 = (void *)entityConfidenceSignalsEnabled;
  v58[11] = entityConfidenceSignalsEnabled;
  v57[12] = @"entityConfidenceSignalsFrequencyDenominatorInternal";
  entityConfidenceSignalsFrequencyDenominatorInternal = self->_entityConfidenceSignalsFrequencyDenominatorInternal;
  uint64_t v16 = (uint64_t)entityConfidenceSignalsFrequencyDenominatorInternal;
  if (!entityConfidenceSignalsFrequencyDenominatorInternal)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v44 = (void *)appSelectionSignalsFrequencyDenominator;
  v50 = (void *)audioSearchResults;
  v32 = (void *)v16;
  v58[12] = v16;
  v57[13] = @"entityConfidenceSignalsFrequencyDenominatorProd";
  entityConfidenceSignalsFrequencyDenominatorProd = self->_entityConfidenceSignalsFrequencyDenominatorProd;
  uint64_t v18 = (uint64_t)entityConfidenceSignalsFrequencyDenominatorProd;
  if (!entityConfidenceSignalsFrequencyDenominatorProd)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v42 = (void *)shouldSuppressCommonWholeHouseAudioRoutes;
  v54 = (void *)v3;
  v31 = (void *)v18;
  v58[13] = v18;
  v57[14] = @"entityConfidenceSignalsMaxItemsToDisambiguate";
  entityConfidenceSignalsMaxItemsToDisambiguate = self->_entityConfidenceSignalsMaxItemsToDisambiguate;
  uint64_t v20 = (uint64_t)entityConfidenceSignalsMaxItemsToDisambiguate;
  if (!entityConfidenceSignalsMaxItemsToDisambiguate)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v40 = (void *)immediatelyStartPlayback;
  v52 = (void *)appInferred;
  v30 = (void *)v20;
  v58[14] = v20;
  v57[15] = @"alternativeProviderBundleIdentifier";
  alternativeProviderBundleIdentifier = self->_alternativeProviderBundleIdentifier;
  v22 = alternativeProviderBundleIdentifier;
  if (!alternativeProviderBundleIdentifier)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)isAmbiguousPlay;
  v58[15] = v22;
  v57[16] = @"ampPAFDataSetID";
  ampPAFDataSetID = self->_ampPAFDataSetID;
  v25 = ampPAFDataSetID;
  if (!ampPAFDataSetID)
  {
    v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v58[16] = v25;
  v57[17] = @"pegasusMetaData";
  pegasusMetaData = self->_pegasusMetaData;
  v27 = pegasusMetaData;
  if (!pegasusMetaData)
  {
    v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v58[17] = v27;
  id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:18];
  if (!pegasusMetaData) {

  }
  v28 = v56;
  if (!ampPAFDataSetID)
  {

    v28 = v56;
  }
  if (!alternativeProviderBundleIdentifier)
  {

    v28 = v56;
  }
  if (!entityConfidenceSignalsMaxItemsToDisambiguate)
  {

    v28 = v56;
  }
  if (!entityConfidenceSignalsFrequencyDenominatorProd)
  {

    v28 = v56;
  }
  if (!entityConfidenceSignalsFrequencyDenominatorInternal)
  {

    v28 = v56;
  }
  if (!v35)
  {

    v28 = v56;
  }
  if (!v36) {

  }
  if (!v38) {
  if (!v39)
  }

  if (!v41) {
  if (!v43)
  }

  if (!v45) {
  if (!v47)
  }

  if (!v49) {
  if (!v51)
  }

  if (!v53) {
  if (!appSelectionEnabled)
  }

  return v34;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INPrivatePlayMediaIntentData;
  v6 = [(INPrivatePlayMediaIntentData *)&v11 description];
  v7 = [(INPrivatePlayMediaIntentData *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (NSString)description
{
  return (NSString *)[(INPrivatePlayMediaIntentData *)self descriptionAtIndent:0];
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  v7 = [v5 dictionary];
  v8 = [v6 encodeObject:self->_appSelectionEnabled];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, @"appSelectionEnabled");

  v9 = [v6 encodeObject:self->_appInferred];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, @"appInferred");

  v10 = [v6 encodeObject:self->_audioSearchResults];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, @"audioSearchResults");

  objc_super v11 = [v6 encodeObject:self->_privateMediaIntentData];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, @"privateMediaIntentData");

  v12 = [v6 encodeObject:self->_appSelectionSignalsEnabled];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, @"appSelectionSignalsEnabled");

  v13 = [v6 encodeObject:self->_appSelectionSignalsFrequencyDenominator];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, @"appSelectionSignalsFrequencyDenominator");

  v14 = [v6 encodeObject:self->_shouldSuppressCommonWholeHouseAudioRoutes];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, @"shouldSuppressCommonWholeHouseAudioRoutes");

  v15 = [v6 encodeObject:self->_immediatelyStartPlayback];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, @"immediatelyStartPlayback");

  uint64_t v16 = [v6 encodeObject:self->_isAmbiguousPlay];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, @"isAmbiguousPlay");

  v17 = [v6 encodeObject:self->_isPersonalizedRequest];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, @"isPersonalizedRequest");

  uint64_t v18 = [v6 encodeObject:self->_internalSignals];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v18, @"internalSignals");

  v19 = [v6 encodeObject:self->_entityConfidenceSignalsEnabled];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, @"entityConfidenceSignalsEnabled");

  uint64_t v20 = [v6 encodeObject:self->_entityConfidenceSignalsFrequencyDenominatorInternal];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v20, @"entityConfidenceSignalsFrequencyDenominatorInternal");

  v21 = [v6 encodeObject:self->_entityConfidenceSignalsFrequencyDenominatorProd];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v21, @"entityConfidenceSignalsFrequencyDenominatorProd");

  v22 = [v6 encodeObject:self->_entityConfidenceSignalsMaxItemsToDisambiguate];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v22, @"entityConfidenceSignalsMaxItemsToDisambiguate");

  v23 = [v6 encodeObject:self->_alternativeProviderBundleIdentifier];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v23, @"alternativeProviderBundleIdentifier");

  v24 = [v6 encodeObject:self->_ampPAFDataSetID];
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v24, @"ampPAFDataSetID");

  v25 = [v6 encodeObject:self->_pegasusMetaData];

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v25, @"pegasusMetaData");

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  appSelectionEnabled = self->_appSelectionEnabled;
  id v5 = a3;
  [v5 encodeObject:appSelectionEnabled forKey:@"appSelectionEnabled"];
  [v5 encodeObject:self->_appInferred forKey:@"appInferred"];
  [v5 encodeObject:self->_audioSearchResults forKey:@"audioSearchResults"];
  [v5 encodeObject:self->_privateMediaIntentData forKey:@"privateMediaIntentData"];
  [v5 encodeObject:self->_appSelectionSignalsEnabled forKey:@"appSelectionSignalsEnabled"];
  [v5 encodeObject:self->_appSelectionSignalsFrequencyDenominator forKey:@"appSelectionSignalsFrequencyDenominator"];
  [v5 encodeObject:self->_shouldSuppressCommonWholeHouseAudioRoutes forKey:@"shouldSuppressCommonWholeHouseAudioRoutes"];
  [v5 encodeObject:self->_immediatelyStartPlayback forKey:@"immediatelyStartPlayback"];
  [v5 encodeObject:self->_isAmbiguousPlay forKey:@"isAmbiguousPlay"];
  [v5 encodeObject:self->_isPersonalizedRequest forKey:@"isPersonalizedRequest"];
  [v5 encodeObject:self->_internalSignals forKey:@"internalSignals"];
  [v5 encodeObject:self->_entityConfidenceSignalsEnabled forKey:@"entityConfidenceSignalsEnabled"];
  [v5 encodeObject:self->_entityConfidenceSignalsFrequencyDenominatorInternal forKey:@"entityConfidenceSignalsFrequencyDenominatorInternal"];
  [v5 encodeObject:self->_entityConfidenceSignalsFrequencyDenominatorProd forKey:@"entityConfidenceSignalsFrequencyDenominatorProd"];
  [v5 encodeObject:self->_entityConfidenceSignalsMaxItemsToDisambiguate forKey:@"entityConfidenceSignalsMaxItemsToDisambiguate"];
  [v5 encodeObject:self->_alternativeProviderBundleIdentifier forKey:@"alternativeProviderBundleIdentifier"];
  [v5 encodeObject:self->_ampPAFDataSetID forKey:@"ampPAFDataSetID"];
  [v5 encodeObject:self->_pegasusMetaData forKey:@"pegasusMetaData"];
}

- (INPrivatePlayMediaIntentData)initWithCoder:(id)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v30 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"appSelectionEnabled"];
  v29 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"appInferred"];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  id v6 = [v4 setWithArray:v5];
  v28 = [v3 decodeObjectOfClasses:v6 forKey:@"audioSearchResults"];

  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"privateMediaIntentData"];
  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"appSelectionSignalsEnabled"];
  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"appSelectionSignalsFrequencyDenominator"];
  v27 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"shouldSuppressCommonWholeHouseAudioRoutes"];
  uint64_t v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"immediatelyStartPlayback"];
  v26 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"isAmbiguousPlay"];
  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"isPersonalizedRequest"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  v31[2] = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
  v9 = [v7 setWithArray:v8];
  uint64_t v18 = [v3 decodeObjectOfClasses:v9 forKey:@"internalSignals"];

  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"entityConfidenceSignalsEnabled"];
  uint64_t v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"entityConfidenceSignalsFrequencyDenominatorInternal"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"entityConfidenceSignalsFrequencyDenominatorProd"];
  objc_super v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"entityConfidenceSignalsMaxItemsToDisambiguate"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"alternativeProviderBundleIdentifier"];
  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ampPAFDataSetID"];
  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"pegasusMetaData"];

  v25 = -[INPrivatePlayMediaIntentData initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:](self, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:", v30, v29, v28, v23, v22, v21, v27, v20, v26, v19, v18, v17, v16,
          v10,
          v11,
          v12,
          v13,
          v14);

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (INPrivatePlayMediaIntentData *)a3;
  if (v4 == self)
  {
    BOOL v24 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      appSelectionEnabled = self->_appSelectionEnabled;
      if (appSelectionEnabled != v5->_appSelectionEnabled
        && !-[NSNumber isEqual:](appSelectionEnabled, "isEqual:"))
      {
        goto LABEL_42;
      }
      uint64_t appInferred = self->_appInferred;
      if (appInferred != v5->_appInferred && !-[NSNumber isEqual:](appInferred, "isEqual:")) {
        goto LABEL_42;
      }
      uint64_t audioSearchResults = self->_audioSearchResults;
      if (audioSearchResults != v5->_audioSearchResults
        && !-[NSArray isEqual:](audioSearchResults, "isEqual:"))
      {
        goto LABEL_42;
      }
      uint64_t privateMediaIntentData = self->_privateMediaIntentData;
      if (privateMediaIntentData != v5->_privateMediaIntentData
        && !-[INPrivateMediaIntentData isEqual:](privateMediaIntentData, "isEqual:"))
      {
        goto LABEL_42;
      }
      uint64_t appSelectionSignalsEnabled = self->_appSelectionSignalsEnabled;
      if (appSelectionSignalsEnabled != v5->_appSelectionSignalsEnabled
        && !-[NSNumber isEqual:](appSelectionSignalsEnabled, "isEqual:"))
      {
        goto LABEL_42;
      }
      uint64_t appSelectionSignalsFrequencyDenominator = self->_appSelectionSignalsFrequencyDenominator;
      if (appSelectionSignalsFrequencyDenominator != v5->_appSelectionSignalsFrequencyDenominator
        && !-[NSNumber isEqual:](appSelectionSignalsFrequencyDenominator, "isEqual:"))
      {
        goto LABEL_42;
      }
      uint64_t shouldSuppressCommonWholeHouseAudioRoutes = self->_shouldSuppressCommonWholeHouseAudioRoutes;
      if (shouldSuppressCommonWholeHouseAudioRoutes != v5->_shouldSuppressCommonWholeHouseAudioRoutes
        && !-[NSNumber isEqual:](shouldSuppressCommonWholeHouseAudioRoutes, "isEqual:"))
      {
        goto LABEL_42;
      }
      uint64_t immediatelyStartPlayback = self->_immediatelyStartPlayback;
      if (immediatelyStartPlayback != v5->_immediatelyStartPlayback
        && !-[NSNumber isEqual:](immediatelyStartPlayback, "isEqual:"))
      {
        goto LABEL_42;
      }
      uint64_t isAmbiguousPlay = self->_isAmbiguousPlay;
      if (isAmbiguousPlay != v5->_isAmbiguousPlay && !-[NSNumber isEqual:](isAmbiguousPlay, "isEqual:")) {
        goto LABEL_42;
      }
      uint64_t isPersonalizedRequest = self->_isPersonalizedRequest;
      if (isPersonalizedRequest != v5->_isPersonalizedRequest
        && !-[NSNumber isEqual:](isPersonalizedRequest, "isEqual:"))
      {
        goto LABEL_42;
      }
      uint64_t internalSignals = self->_internalSignals;
      if (internalSignals != v5->_internalSignals && !-[NSArray isEqual:](internalSignals, "isEqual:")) {
        goto LABEL_42;
      }
      if (((uint64_t entityConfidenceSignalsEnabled = self->_entityConfidenceSignalsEnabled,
             entityConfidenceSignalsEnabled == v5->_entityConfidenceSignalsEnabled)
         || -[NSNumber isEqual:](entityConfidenceSignalsEnabled, "isEqual:"))
        && ((entityConfidenceSignalsFrequencyDenominatorInternal = self->_entityConfidenceSignalsFrequencyDenominatorInternal,
             entityConfidenceSignalsFrequencyDenominatorInternal == v5->_entityConfidenceSignalsFrequencyDenominatorInternal)
         || -[NSNumber isEqual:](entityConfidenceSignalsFrequencyDenominatorInternal, "isEqual:"))
        && ((entityConfidenceSignalsFrequencyDenominatorProd = self->_entityConfidenceSignalsFrequencyDenominatorProd,
             entityConfidenceSignalsFrequencyDenominatorProd == v5->_entityConfidenceSignalsFrequencyDenominatorProd)
         || -[NSNumber isEqual:](entityConfidenceSignalsFrequencyDenominatorProd, "isEqual:"))
        && ((entityConfidenceSignalsMaxItemsToDisambiguate = self->_entityConfidenceSignalsMaxItemsToDisambiguate,
             entityConfidenceSignalsMaxItemsToDisambiguate == v5->_entityConfidenceSignalsMaxItemsToDisambiguate)
         || -[NSNumber isEqual:](entityConfidenceSignalsMaxItemsToDisambiguate, "isEqual:"))
        && ((alternativeProviderBundleIdentifier = self->_alternativeProviderBundleIdentifier,
             alternativeProviderBundleIdentifier == v5->_alternativeProviderBundleIdentifier)
         || -[NSString isEqual:](alternativeProviderBundleIdentifier, "isEqual:"))
        && ((ampPAFDataSetID = self->_ampPAFDataSetID, ampPAFDataSetID == v5->_ampPAFDataSetID)
         || -[NSString isEqual:](ampPAFDataSetID, "isEqual:"))
        && ((pegasusMetaData = self->_pegasusMetaData, pegasusMetaData == v5->_pegasusMetaData)
         || -[NSData isEqual:](pegasusMetaData, "isEqual:")))
      {
        BOOL v24 = 1;
      }
      else
      {
LABEL_42:
        BOOL v24 = 0;
      }
    }
    else
    {
      BOOL v24 = 0;
    }
  }

  return v24;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_appSelectionEnabled hash];
  uint64_t v4 = [(NSNumber *)self->_appInferred hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_audioSearchResults hash];
  unint64_t v6 = v4 ^ v5 ^ [(INPrivateMediaIntentData *)self->_privateMediaIntentData hash];
  uint64_t v7 = [(NSNumber *)self->_appSelectionSignalsEnabled hash];
  uint64_t v8 = v7 ^ [(NSNumber *)self->_appSelectionSignalsFrequencyDenominator hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSNumber *)self->_shouldSuppressCommonWholeHouseAudioRoutes hash];
  uint64_t v10 = [(NSNumber *)self->_immediatelyStartPlayback hash];
  uint64_t v11 = v10 ^ [(NSNumber *)self->_isAmbiguousPlay hash];
  uint64_t v12 = v11 ^ [(NSNumber *)self->_isPersonalizedRequest hash];
  uint64_t v13 = v9 ^ v12 ^ [(NSArray *)self->_internalSignals hash];
  uint64_t v14 = [(NSNumber *)self->_entityConfidenceSignalsEnabled hash];
  uint64_t v15 = v14 ^ [(NSNumber *)self->_entityConfidenceSignalsFrequencyDenominatorInternal hash];
  uint64_t v16 = v15 ^ [(NSNumber *)self->_entityConfidenceSignalsFrequencyDenominatorProd hash];
  uint64_t v17 = v16 ^ [(NSNumber *)self->_entityConfidenceSignalsMaxItemsToDisambiguate hash];
  NSUInteger v18 = v13 ^ v17 ^ [(NSString *)self->_alternativeProviderBundleIdentifier hash];
  NSUInteger v19 = [(NSString *)self->_ampPAFDataSetID hash];
  return v18 ^ v19 ^ [(NSData *)self->_pegasusMetaData hash];
}

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10 isAmbiguousPlay:(id)a11 isPersonalizedRequest:(id)a12 internalSignals:(id)a13 entityConfidenceSignalsEnabled:(id)a14 entityConfidenceSignalsFrequencyDenominatorInternal:(id)a15 entityConfidenceSignalsFrequencyDenominatorProd:(id)a16 entityConfidenceSignalsMaxItemsToDisambiguate:(id)a17 alternativeProviderBundleIdentifier:(id)a18 ampPAFDataSetID:(id)a19
{
  return -[INPrivatePlayMediaIntentData initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:](self, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
           a16,
           a17,
           a18,
           a19,
           0);
}

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10 isAmbiguousPlay:(id)a11 isPersonalizedRequest:(id)a12 internalSignals:(id)a13 entityConfidenceSignalsEnabled:(id)a14 entityConfidenceSignalsFrequencyDenominatorInternal:(id)a15 entityConfidenceSignalsFrequencyDenominatorProd:(id)a16 entityConfidenceSignalsMaxItemsToDisambiguate:(id)a17 alternativeProviderBundleIdentifier:(id)a18
{
  return -[INPrivatePlayMediaIntentData initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:](self, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
           a16,
           a17,
           a18,
           0,
           0);
}

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10 isAmbiguousPlay:(id)a11 isPersonalizedRequest:(id)a12 internalSignals:(id)a13 entityConfidenceSignalsEnabled:(id)a14 entityConfidenceSignalsFrequencyDenominatorInternal:(id)a15 entityConfidenceSignalsFrequencyDenominatorProd:(id)a16 entityConfidenceSignalsMaxItemsToDisambiguate:(id)a17
{
  return -[INPrivatePlayMediaIntentData initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:](self, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
           a16,
           a17,
           0,
           0,
           0);
}

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5
{
  return -[INPrivatePlayMediaIntentData initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:](self, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:", a3, a4, a5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0,
           0,
           0);
}

- (INPrivatePlayMediaIntentData)initWithAppSelectionEnabled:(id)a3 appInferred:(id)a4 audioSearchResults:(id)a5 privateMediaIntentData:(id)a6 appSelectionSignalsEnabled:(id)a7 appSelectionSignalsFrequencyDenominator:(id)a8 shouldSuppressCommonWholeHouseAudioRoutes:(id)a9 immediatelyStartPlayback:(id)a10 isAmbiguousPlay:(id)a11 isPersonalizedRequest:(id)a12 internalSignals:(id)a13 entityConfidenceSignalsEnabled:(id)a14 entityConfidenceSignalsFrequencyDenominatorInternal:(id)a15 entityConfidenceSignalsFrequencyDenominatorProd:(id)a16 entityConfidenceSignalsMaxItemsToDisambiguate:(id)a17 alternativeProviderBundleIdentifier:(id)a18 ampPAFDataSetID:(id)a19 pegasusMetaData:(id)a20
{
  id v25 = a3;
  id v81 = a4;
  id v80 = a5;
  id v79 = a6;
  id v78 = a7;
  id v77 = a8;
  id v76 = a9;
  id v75 = a10;
  id v74 = a11;
  id v73 = a12;
  id v26 = a13;
  id v27 = a14;
  id v28 = a15;
  id v29 = a16;
  id v30 = a17;
  id v31 = a18;
  id v32 = a19;
  id v33 = a20;
  v82.receiver = self;
  v82.super_class = (Class)INPrivatePlayMediaIntentData;
  id v34 = [(INPrivatePlayMediaIntentData *)&v82 init];
  if (v34)
  {
    uint64_t v35 = [v25 copy];
    appSelectionEnabled = v34->_appSelectionEnabled;
    v34->_appSelectionEnabled = (NSNumber *)v35;

    uint64_t v37 = [v81 copy];
    uint64_t appInferred = v34->_appInferred;
    v34->_uint64_t appInferred = (NSNumber *)v37;

    uint64_t v39 = [v80 copy];
    uint64_t audioSearchResults = v34->_audioSearchResults;
    v34->_uint64_t audioSearchResults = (NSArray *)v39;

    uint64_t v41 = [v79 copy];
    uint64_t privateMediaIntentData = v34->_privateMediaIntentData;
    v34->_uint64_t privateMediaIntentData = (INPrivateMediaIntentData *)v41;

    uint64_t v43 = [v78 copy];
    uint64_t appSelectionSignalsEnabled = v34->_appSelectionSignalsEnabled;
    v34->_uint64_t appSelectionSignalsEnabled = (NSNumber *)v43;

    uint64_t v45 = [v77 copy];
    uint64_t appSelectionSignalsFrequencyDenominator = v34->_appSelectionSignalsFrequencyDenominator;
    v34->_uint64_t appSelectionSignalsFrequencyDenominator = (NSNumber *)v45;

    uint64_t v47 = [v76 copy];
    uint64_t shouldSuppressCommonWholeHouseAudioRoutes = v34->_shouldSuppressCommonWholeHouseAudioRoutes;
    v34->_uint64_t shouldSuppressCommonWholeHouseAudioRoutes = (NSNumber *)v47;

    uint64_t v49 = [v75 copy];
    uint64_t immediatelyStartPlayback = v34->_immediatelyStartPlayback;
    v34->_uint64_t immediatelyStartPlayback = (NSNumber *)v49;

    uint64_t v51 = [v74 copy];
    uint64_t isAmbiguousPlay = v34->_isAmbiguousPlay;
    v34->_uint64_t isAmbiguousPlay = (NSNumber *)v51;

    uint64_t v53 = [v73 copy];
    uint64_t isPersonalizedRequest = v34->_isPersonalizedRequest;
    v34->_uint64_t isPersonalizedRequest = (NSNumber *)v53;

    uint64_t v55 = [v26 copy];
    uint64_t internalSignals = v34->_internalSignals;
    v34->_uint64_t internalSignals = (NSArray *)v55;

    uint64_t v57 = [v27 copy];
    uint64_t entityConfidenceSignalsEnabled = v34->_entityConfidenceSignalsEnabled;
    v34->_uint64_t entityConfidenceSignalsEnabled = (NSNumber *)v57;

    uint64_t v59 = [v28 copy];
    entityConfidenceSignalsFrequencyDenominatorInternal = v34->_entityConfidenceSignalsFrequencyDenominatorInternal;
    v34->_entityConfidenceSignalsFrequencyDenominatorInternal = (NSNumber *)v59;

    uint64_t v61 = [v29 copy];
    entityConfidenceSignalsFrequencyDenominatorProd = v34->_entityConfidenceSignalsFrequencyDenominatorProd;
    v34->_entityConfidenceSignalsFrequencyDenominatorProd = (NSNumber *)v61;

    uint64_t v63 = [v30 copy];
    entityConfidenceSignalsMaxItemsToDisambiguate = v34->_entityConfidenceSignalsMaxItemsToDisambiguate;
    v34->_entityConfidenceSignalsMaxItemsToDisambiguate = (NSNumber *)v63;

    uint64_t v65 = [v31 copy];
    alternativeProviderBundleIdentifier = v34->_alternativeProviderBundleIdentifier;
    v34->_alternativeProviderBundleIdentifier = (NSString *)v65;

    uint64_t v67 = [v32 copy];
    ampPAFDataSetID = v34->_ampPAFDataSetID;
    v34->_ampPAFDataSetID = (NSString *)v67;

    uint64_t v69 = [v33 copy];
    pegasusMetaData = v34->_pegasusMetaData;
    v34->_pegasusMetaData = (NSData *)v69;
  }
  return v34;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v43 = [v8 objectForKeyedSubscript:@"appSelectionEnabled"];
    uint64_t v41 = [v8 objectForKeyedSubscript:@"appInferred"];
    uint64_t v35 = (objc_class *)a1;
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [v8 objectForKeyedSubscript:@"audioSearchResults"];
    v42 = [v7 decodeObjectsOfClass:v9 from:v10];

    uint64_t v11 = objc_opt_class();
    uint64_t v12 = [v8 objectForKeyedSubscript:@"privateMediaIntentData"];
    v40 = [v7 decodeObjectOfClass:v11 from:v12];

    uint64_t v39 = [v8 objectForKeyedSubscript:@"appSelectionSignalsEnabled"];
    id v34 = [v8 objectForKeyedSubscript:@"appSelectionSignalsFrequencyDenominator"];
    uint64_t v38 = [v8 objectForKeyedSubscript:@"shouldSuppressCommonWholeHouseAudioRoutes"];
    uint64_t v37 = [v8 objectForKeyedSubscript:@"immediatelyStartPlayback"];
    id v33 = [v8 objectForKeyedSubscript:@"isAmbiguousPlay"];
    id v32 = [v8 objectForKeyedSubscript:@"isPersonalizedRequest"];
    id v31 = [v8 objectForKeyedSubscript:@"internalSignals"];
    id v28 = [v8 objectForKeyedSubscript:@"entityConfidenceSignalsEnabled"];
    id v30 = [v8 objectForKeyedSubscript:@"entityConfidenceSignalsFrequencyDenominatorInternal"];
    uint64_t v13 = [v8 objectForKeyedSubscript:@"entityConfidenceSignalsFrequencyDenominatorProd"];
    id v27 = [v8 objectForKeyedSubscript:@"entityConfidenceSignalsMaxItemsToDisambiguate"];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [v8 objectForKeyedSubscript:@"alternativeProviderBundleIdentifier"];
    uint64_t v16 = [v7 decodeObjectOfClass:v14 from:v15];

    uint64_t v17 = objc_opt_class();
    NSUInteger v18 = [v8 objectForKeyedSubscript:@"ampPAFDataSetID"];
    id v19 = v7;
    uint64_t v20 = [v7 decodeObjectOfClass:v17 from:v18];

    uint64_t v21 = objc_opt_class();
    v22 = [v8 objectForKeyedSubscript:@"pegasusMetaData"];
    v23 = [v7 decodeObjectOfClass:v21 from:v22];

    id v24 = [v35 alloc];
    uint64_t v36 = v19;
    uint64_t v29 = objc_msgSend(v24, "initWithAppSelectionEnabled:appInferred:audioSearchResults:privateMediaIntentData:appSelectionSignalsEnabled:appSelectionSignalsFrequencyDenominator:shouldSuppressCommonWholeHouseAudioRoutes:immediatelyStartPlayback:isAmbiguousPlay:isPersonalizedRequest:internalSignals:entityConfidenceSignalsEnabled:entityConfidenceSignalsFrequencyDenominatorInternal:entityConfidenceSignalsFrequencyDenominatorProd:entityConfidenceSignalsMaxItemsToDisambiguate:alternativeProviderBundleIdentifier:ampPAFDataSetID:pegasusMetaData:", v43, v41, v42, v40, v39, v34, v38, v37, v33, v32, v31, v28, v30,
            v13,
            v27,
            v16,
            v20,
            v23);

    id v25 = (void *)v29;
    id v7 = v36;
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(INPrivatePlayMediaIntentData *)self audioSearchResults];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_intents_updateContainerWithCache:", v4);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_intents_cacheableObjects
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(INPrivatePlayMediaIntentData *)self audioSearchResults];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8), "_intents_cacheableObjects");
        [v3 unionSet:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  if ([v3 count]) {
    long long v10 = v3;
  }
  else {
    long long v10 = 0;
  }
  id v11 = v10;

  return v11;
}

@end