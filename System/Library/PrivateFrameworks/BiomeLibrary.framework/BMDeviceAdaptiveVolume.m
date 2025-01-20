@interface BMDeviceAdaptiveVolume
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDeviceAdaptiveVolume)initWithControllerVersion:(id)a3 refMicdBA:(id)a4 refMicdBC:(id)a5 drumdBA:(id)a6 drumdBK:(id)a7 drumdBAPredicted:(id)a8 downlinkdBA:(id)a9 currentVolumePrct:(id)a10 lastUserVolChangeType:(id)a11 headphoneMode:(id)a12 streamType:(id)a13 windSpeechAggressorFlag:(id)a14 volumeChangeFlag:(id)a15 speechPresenceProbability:(id)a16 personalizationParamSnr:(id)a17 personalizationParamMistakes:(id)a18 lastEMediadBA:(id)a19 lastVolMediaPrct:(id)a20 lastETelephonydBA:(id)a21 lastVolTelephonyPrct:(id)a22 lastESiridBA:(id)a23 lastVolSiriPrct:(id)a24 smoothEae:(id)a25 desiredDeltaE:(id)a26 predVolMediaPrct:(id)a27 predVolTelephonyPrct:(id)a28 predVolSiriPrct:(id)a29 onStartPredictionFlag:(id)a30 guardrailsAvoidFlag:(id)a31 minMaxCutFlag:(id)a32 manualVolumeChangeFlag:(id)a33 bigWindowSize:(id)a34 smallWindowSize:(id)a35 activeAppName:(id)a36 activeAirpodsSerialNumber:(id)a37;
- (BMDeviceAdaptiveVolume)initWithControllerVersion:(void *)a3 refMicdBA:(void *)a4 refMicdBC:(void *)a5 drumdBA:(void *)a6 drumdBK:(void *)a7 drumdBAPredicted:(void *)a8 downlinkdBA:(id)a9 currentVolumePrct:(id)a10 lastUserVolChangeType:(id)a11 headphoneMode:(id)a12 streamType:(id)a13 windSpeechAggressorFlag:(id)a14 volumeChangeFlag:(id)a15 speechPresenceProbability:(id)a16 personalizationParamSnr:(id)a17 personalizationParamMistakes:(id)a18 lastEMediadBA:(id)a19 lastVolMediaPrct:(id)a20 lastETelephonydBA:(id)a21 lastVolTelephonyPrct:(id)a22 lastESiridBA:(id)a23 lastVolSiriPrct:(id)a24 smoothEae:(id)a25 desiredDeltaE:(id)a26 predVolMediaPrct:(id)a27 predVolTelephonyPrct:(id)a28 predVolSiriPrct:(id)a29 onStartPredictionFlag:(id)a30 guardrailsAvoidFlag:(id)a31 minMaxCutFlag:(id)a32 manualVolumeChangeFlag:(id)a33 bigWindowSize:(id)a34 smallWindowSize:(id)a35 activeAppName:(id)a36 activeAirpodsSerialNumber:(id)a37 anchorVol:(id)a38 anchorEnv:(id)a39 personalizationCoeff:(id)a40 unsignedPredVolMediaPrct:(id)a41 unsignedPredVolTelephonyPrct:(id)a42 unsignedPredVolSiriPrct:(id)a43 singleBudFlag:(id)a44 cdEngagementFlag:(id)a45 activeStreamFlag:(id)a46 pvFeatureEnableFlag:(id)a47 envSpectralData32B:(id)a48 windStrength:(id)a49 windProb:(id)a50 mediaType:(id)a51 sourceActivity:(id)a52 budActivity:(id)a53 location:(id)a54 locationType:(id)a55 focusMode:(id)a56 streamingAppBundleId:(id)a57 noiseType4B:(id)a58 instdBA:(id)a59 instdBC:(id)a60 nonCAListeningMode:(id)a61 fit:(id)a62 fixedAutoAncGain:(id)a63 adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:routedDRCGain:;
- (BMDeviceAdaptiveVolume)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasActiveStreamFlag;
- (BOOL)hasAdjustedAutoAncGain;
- (BOOL)hasAnchorEnv;
- (BOOL)hasAnchorVol;
- (BOOL)hasBigWindowSize;
- (BOOL)hasBudActivity;
- (BOOL)hasCdEngagementFlag;
- (BOOL)hasControllerVersion;
- (BOOL)hasCurrentVolumePrct;
- (BOOL)hasDRCappSelfVoiceFlag;
- (BOOL)hasDRCenablementBit;
- (BOOL)hasDRCwindFlag;
- (BOOL)hasDesiredDeltaE;
- (BOOL)hasDownlinkdBA;
- (BOOL)hasDrumDRC;
- (BOOL)hasDrumdBA;
- (BOOL)hasDrumdBAPredicted;
- (BOOL)hasDrumdBK;
- (BOOL)hasFit;
- (BOOL)hasFixedAutoAncGain;
- (BOOL)hasFocusMode;
- (BOOL)hasGuardrailsAvoidFlag;
- (BOOL)hasHeadphoneMode;
- (BOOL)hasInstdBA;
- (BOOL)hasInstdBC;
- (BOOL)hasLastEMediadBA;
- (BOOL)hasLastESiridBA;
- (BOOL)hasLastETelephonydBA;
- (BOOL)hasLastUserVolChangeType;
- (BOOL)hasLastVolMediaPrct;
- (BOOL)hasLastVolSiriPrct;
- (BOOL)hasLastVolTelephonyPrct;
- (BOOL)hasLocation;
- (BOOL)hasLocationType;
- (BOOL)hasManualVolumeChangeFlag;
- (BOOL)hasMediaType;
- (BOOL)hasMinMaxCutFlag;
- (BOOL)hasNonCAListeningMode;
- (BOOL)hasOnStartPredictionFlag;
- (BOOL)hasPersonalizationCoeff;
- (BOOL)hasPersonalizationParamMistakes;
- (BOOL)hasPersonalizationParamSnr;
- (BOOL)hasPredVolMediaPrct;
- (BOOL)hasPredVolSiriPrct;
- (BOOL)hasPredVolTelephonyPrct;
- (BOOL)hasPvFeatureEnableFlag;
- (BOOL)hasRefMicdBA;
- (BOOL)hasRefMicdBC;
- (BOOL)hasRoutedDRCGain;
- (BOOL)hasSingleBudFlag;
- (BOOL)hasSmallWindowSize;
- (BOOL)hasSmoothEae;
- (BOOL)hasSourceActivity;
- (BOOL)hasSpeechPresenceProbability;
- (BOOL)hasStreamType;
- (BOOL)hasStreamingAppBundleId;
- (BOOL)hasTimestamp;
- (BOOL)hasUnsignedPredVolMediaPrct;
- (BOOL)hasUnsignedPredVolSiriPrct;
- (BOOL)hasUnsignedPredVolTelephonyPrct;
- (BOOL)hasVolumeChangeFlag;
- (BOOL)hasWindProb;
- (BOOL)hasWindSpeechAggressorFlag;
- (BOOL)hasWindStrength;
- (BOOL)isEqual:(id)a3;
- (NSArray)envSpectralData32B;
- (NSArray)noiseType4B;
- (NSString)activeAirpodsSerialNumber;
- (NSString)activeAppName;
- (NSString)description;
- (id)_envSpectralData32BJSONArray;
- (id)_noiseType4BJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)desiredDeltaE;
- (int)personalizationParamMistakes;
- (int)personalizationParamSnr;
- (int)predVolMediaPrct;
- (int)predVolSiriPrct;
- (int)predVolTelephonyPrct;
- (uint64_t)initWithControllerVersion:(uint64_t)a3 refMicdBA:(uint64_t)a4 refMicdBC:(uint64_t)a5 drumdBA:(uint64_t)a6 drumdBK:(uint64_t)a7 drumdBAPredicted:(uint64_t)a8 downlinkdBA:(id)a9 currentVolumePrct:(uint64_t)a10 lastUserVolChangeType:(id)a11 headphoneMode:(uint64_t)a12 streamType:(id)a13 windSpeechAggressorFlag:(uint64_t)a14 volumeChangeFlag:(id)a15 speechPresenceProbability:(uint64_t)a16 personalizationParamSnr:(id)a17 personalizationParamMistakes:(uint64_t)a18 lastEMediadBA:(id)a19 lastVolMediaPrct:(uint64_t)a20 lastETelephonydBA:(id)a21 lastVolTelephonyPrct:(uint64_t)a22 lastESiridBA:(id)a23 lastVolSiriPrct:(uint64_t)a24 smoothEae:(id)a25 desiredDeltaE:(uint64_t)a26 predVolMediaPrct:(id)a27 predVolTelephonyPrct:(uint64_t)a28 predVolSiriPrct:(id)a29 onStartPredictionFlag:(uint64_t)a30 guardrailsAvoidFlag:(id)a31 minMaxCutFlag:(uint64_t)a32 manualVolumeChangeFlag:(id)a33 bigWindowSize:(uint64_t)a34 smallWindowSize:(id)a35 activeAppName:(uint64_t)a36 activeAirpodsSerialNumber:(id)a37 anchorVol:(uint64_t)a38 anchorEnv:(id)a39 personalizationCoeff:(uint64_t)a40 unsignedPredVolMediaPrct:(id)a41 unsignedPredVolTelephonyPrct:(uint64_t)a42 unsignedPredVolSiriPrct:(id)a43 singleBudFlag:(uint64_t)a44 cdEngagementFlag:(id)a45 activeStreamFlag:(uint64_t)a46 pvFeatureEnableFlag:(id)a47 envSpectralData_32B:(uint64_t)a48 wind_strength:(id)a49 wind_prob:(uint64_t)a50 mediaType:(id)a51 sourceActivity:(uint64_t)a52 budActivity:(id)a53 location:(uint64_t)a54 locationType:(id)a55 focusMode:(uint64_t)a56 streamingAppBundleId:(id)a57 noiseType_4B:(uint64_t)a58 instdBA:(id)a59 instdBC:(uint64_t)a60 nonCAListeningMode:(id)a61 fit:(uint64_t)a62 fixedAutoAncGain:(id)a63 adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:;
- (uint64_t)initWithControllerVersion:(uint64_t)a3 refMicdBA:(uint64_t)a4 refMicdBC:(uint64_t)a5 drumdBA:(uint64_t)a6 drumdBK:(uint64_t)a7 drumdBAPredicted:(uint64_t)a8 downlinkdBA:(id)a9 currentVolumePrct:(uint64_t)a10 lastUserVolChangeType:(id)a11 headphoneMode:(uint64_t)a12 streamType:(id)a13 windSpeechAggressorFlag:(uint64_t)a14 volumeChangeFlag:(id)a15 speechPresenceProbability:(uint64_t)a16 personalizationParamSnr:(id)a17 personalizationParamMistakes:(uint64_t)a18 lastEMediadBA:(id)a19 lastVolMediaPrct:(uint64_t)a20 lastETelephonydBA:(id)a21 lastVolTelephonyPrct:(uint64_t)a22 lastESiridBA:(id)a23 lastVolSiriPrct:(uint64_t)a24 smoothEae:(id)a25 desiredDeltaE:(uint64_t)a26 predVolMediaPrct:(id)a27 predVolTelephonyPrct:(uint64_t)a28 predVolSiriPrct:(id)a29 onStartPredictionFlag:(uint64_t)a30 guardrailsAvoidFlag:(id)a31 minMaxCutFlag:(uint64_t)a32 manualVolumeChangeFlag:(id)a33 bigWindowSize:(uint64_t)a34 smallWindowSize:(id)a35 activeAppName:(uint64_t)a36 activeAirpodsSerialNumber:(id)a37 anchorVol:(uint64_t)a38 anchorEnv:(id)a39 personalizationCoeff:(uint64_t)a40 unsignedPredVolMediaPrct:(id)a41 unsignedPredVolTelephonyPrct:(uint64_t)a42 unsignedPredVolSiriPrct:(id)a43 singleBudFlag:(uint64_t)a44 cdEngagementFlag:(id)a45 activeStreamFlag:(uint64_t)a46 pvFeatureEnableFlag:(id)a47 envSpectralData_32B:(uint64_t)a48 wind_strength:(id)a49 wind_prob:(uint64_t)a50 mediaType:(id)a51 sourceActivity:(uint64_t)a52 budActivity:(id)a53 location:(uint64_t)a54 locationType:(id)a55 focusMode:(uint64_t)a56 streamingAppBundleId:(id)a57 noiseType_4B:(uint64_t)a58 instdBA:(id)a59 instdBC:(uint64_t)a60 nonCAListeningMode:(id)a61 fit:(uint64_t)a62 fixedAutoAncGain:(id)a63 adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:;
- (uint64_t)initWithControllerVersion:(void *)a1 refMicdBA:refMicdBC:drumdBA:drumdBK:drumdBAPredicted:downlinkdBA:currentVolumePrct:lastUserVolChangeType:headphoneMode:streamType:windSpeechAggressorFlag:volumeChangeFlag:speechPresenceProbability:personalizationParamSnr:personalizationParamMistakes:lastEMediadBA:lastVolMediaPrct:lastETelephonydBA:lastVolTelephonyPrct:lastESiridBA:lastVolSiriPrct:smoothEae:desiredDeltaE:predVolMediaPrct:predVolTelephonyPrct:predVolSiriPrct:onStartPredictionFlag:guardrailsAvoidFlag:minMaxCutFlag:manualVolumeChangeFlag:bigWindowSize:smallWindowSize:activeAppName:activeAirpodsSerialNumber:anchorVol:anchorEnv:personalizationCoeff:unsignedPredVolMediaPrct:unsignedPredVolTelephonyPrct:unsignedPredVolSiriPrct:singleBudFlag:cdEngagementFlag:activeStreamFlag:pvFeatureEnableFlag:envSpectralData_32B:wind_strength:wind_prob:mediaType:sourceActivity:budActivity:location:locationType:focusMode:streamingAppBundleId:noiseType_4B:instdBA:instdBC:nonCAListeningMode:fit:fixedAutoAncGain:adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:routedDRCGain:;
- (unsigned)DRCappSelfVoiceFlag;
- (unsigned)DRCenablementBit;
- (unsigned)DRCwindFlag;
- (unsigned)activeStreamFlag;
- (unsigned)adjustedAutoAncGain;
- (unsigned)anchorEnv;
- (unsigned)anchorVol;
- (unsigned)bigWindowSize;
- (unsigned)budActivity;
- (unsigned)cdEngagementFlag;
- (unsigned)controllerVersion;
- (unsigned)currentVolumePrct;
- (unsigned)dataVersion;
- (unsigned)downlinkdBA;
- (unsigned)drumDRC;
- (unsigned)drumdBA;
- (unsigned)drumdBAPredicted;
- (unsigned)drumdBK;
- (unsigned)fit;
- (unsigned)fixedAutoAncGain;
- (unsigned)focusMode;
- (unsigned)guardrailsAvoidFlag;
- (unsigned)headphoneMode;
- (unsigned)instdBA;
- (unsigned)instdBC;
- (unsigned)lastEMediadBA;
- (unsigned)lastESiridBA;
- (unsigned)lastETelephonydBA;
- (unsigned)lastUserVolChangeType;
- (unsigned)lastVolMediaPrct;
- (unsigned)lastVolSiriPrct;
- (unsigned)lastVolTelephonyPrct;
- (unsigned)location;
- (unsigned)locationType;
- (unsigned)manualVolumeChangeFlag;
- (unsigned)mediaType;
- (unsigned)minMaxCutFlag;
- (unsigned)nonCAListeningMode;
- (unsigned)onStartPredictionFlag;
- (unsigned)personalizationCoeff;
- (unsigned)pvFeatureEnableFlag;
- (unsigned)refMicdBA;
- (unsigned)refMicdBC;
- (unsigned)routedDRCGain;
- (unsigned)singleBudFlag;
- (unsigned)smallWindowSize;
- (unsigned)smoothEae;
- (unsigned)sourceActivity;
- (unsigned)speechPresenceProbability;
- (unsigned)streamType;
- (unsigned)streamingAppBundleId;
- (unsigned)timestamp;
- (unsigned)unsignedPredVolMediaPrct;
- (unsigned)unsignedPredVolSiriPrct;
- (unsigned)unsignedPredVolTelephonyPrct;
- (unsigned)volumeChangeFlag;
- (unsigned)windProb;
- (unsigned)windSpeechAggressorFlag;
- (unsigned)windStrength;
- (void)setHasActiveStreamFlag:(BOOL)a3;
- (void)setHasAdjustedAutoAncGain:(BOOL)a3;
- (void)setHasAnchorEnv:(BOOL)a3;
- (void)setHasAnchorVol:(BOOL)a3;
- (void)setHasBigWindowSize:(BOOL)a3;
- (void)setHasBudActivity:(BOOL)a3;
- (void)setHasCdEngagementFlag:(BOOL)a3;
- (void)setHasControllerVersion:(BOOL)a3;
- (void)setHasCurrentVolumePrct:(BOOL)a3;
- (void)setHasDRCappSelfVoiceFlag:(BOOL)a3;
- (void)setHasDRCenablementBit:(BOOL)a3;
- (void)setHasDRCwindFlag:(BOOL)a3;
- (void)setHasDesiredDeltaE:(BOOL)a3;
- (void)setHasDownlinkdBA:(BOOL)a3;
- (void)setHasDrumDRC:(BOOL)a3;
- (void)setHasDrumdBA:(BOOL)a3;
- (void)setHasDrumdBAPredicted:(BOOL)a3;
- (void)setHasDrumdBK:(BOOL)a3;
- (void)setHasFit:(BOOL)a3;
- (void)setHasFixedAutoAncGain:(BOOL)a3;
- (void)setHasFocusMode:(BOOL)a3;
- (void)setHasGuardrailsAvoidFlag:(BOOL)a3;
- (void)setHasHeadphoneMode:(BOOL)a3;
- (void)setHasInstdBA:(BOOL)a3;
- (void)setHasInstdBC:(BOOL)a3;
- (void)setHasLastEMediadBA:(BOOL)a3;
- (void)setHasLastESiridBA:(BOOL)a3;
- (void)setHasLastETelephonydBA:(BOOL)a3;
- (void)setHasLastUserVolChangeType:(BOOL)a3;
- (void)setHasLastVolMediaPrct:(BOOL)a3;
- (void)setHasLastVolSiriPrct:(BOOL)a3;
- (void)setHasLastVolTelephonyPrct:(BOOL)a3;
- (void)setHasLocation:(BOOL)a3;
- (void)setHasLocationType:(BOOL)a3;
- (void)setHasManualVolumeChangeFlag:(BOOL)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setHasMinMaxCutFlag:(BOOL)a3;
- (void)setHasNonCAListeningMode:(BOOL)a3;
- (void)setHasOnStartPredictionFlag:(BOOL)a3;
- (void)setHasPersonalizationCoeff:(BOOL)a3;
- (void)setHasPersonalizationParamMistakes:(BOOL)a3;
- (void)setHasPersonalizationParamSnr:(BOOL)a3;
- (void)setHasPredVolMediaPrct:(BOOL)a3;
- (void)setHasPredVolSiriPrct:(BOOL)a3;
- (void)setHasPredVolTelephonyPrct:(BOOL)a3;
- (void)setHasPvFeatureEnableFlag:(BOOL)a3;
- (void)setHasRefMicdBA:(BOOL)a3;
- (void)setHasRefMicdBC:(BOOL)a3;
- (void)setHasRoutedDRCGain:(BOOL)a3;
- (void)setHasSingleBudFlag:(BOOL)a3;
- (void)setHasSmallWindowSize:(BOOL)a3;
- (void)setHasSmoothEae:(BOOL)a3;
- (void)setHasSourceActivity:(BOOL)a3;
- (void)setHasSpeechPresenceProbability:(BOOL)a3;
- (void)setHasStreamType:(BOOL)a3;
- (void)setHasStreamingAppBundleId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUnsignedPredVolMediaPrct:(BOOL)a3;
- (void)setHasUnsignedPredVolSiriPrct:(BOOL)a3;
- (void)setHasUnsignedPredVolTelephonyPrct:(BOOL)a3;
- (void)setHasVolumeChangeFlag:(BOOL)a3;
- (void)setHasWindProb:(BOOL)a3;
- (void)setHasWindSpeechAggressorFlag:(BOOL)a3;
- (void)setHasWindStrength:(BOOL)a3;
- (void)setHasWind_prob:(BOOL)a3;
- (void)setHasWind_strength:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDeviceAdaptiveVolume

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noiseType4B, 0);
  objc_storeStrong((id *)&self->_envSpectralData32B, 0);
  objc_storeStrong((id *)&self->_activeAirpodsSerialNumber, 0);

  objc_storeStrong((id *)&self->_activeAppName, 0);
}

- (void)setHasWind_prob:(BOOL)a3
{
  self->_hasWind_prob = a3;
}

- (void)setHasWind_strength:(BOOL)a3
{
  self->_hasWind_strength = a3;
}

- (void)setHasRoutedDRCGain:(BOOL)a3
{
  self->_hasRoutedDRCGain = a3;
}

- (BOOL)hasRoutedDRCGain
{
  return self->_hasRoutedDRCGain;
}

- (unsigned)routedDRCGain
{
  return self->_routedDRCGain;
}

- (void)setHasDrumDRC:(BOOL)a3
{
  self->_hasDrumDRC = a3;
}

- (BOOL)hasDrumDRC
{
  return self->_hasDrumDRC;
}

- (unsigned)drumDRC
{
  return self->_drumDRC;
}

- (void)setHasDRCappSelfVoiceFlag:(BOOL)a3
{
  self->_hasDRCappSelfVoiceFlag = a3;
}

- (BOOL)hasDRCappSelfVoiceFlag
{
  return self->_hasDRCappSelfVoiceFlag;
}

- (unsigned)DRCappSelfVoiceFlag
{
  return self->_DRCappSelfVoiceFlag;
}

- (void)setHasDRCwindFlag:(BOOL)a3
{
  self->_hasDRCwindFlag = a3;
}

- (BOOL)hasDRCwindFlag
{
  return self->_hasDRCwindFlag;
}

- (unsigned)DRCwindFlag
{
  return self->_DRCwindFlag;
}

- (void)setHasDRCenablementBit:(BOOL)a3
{
  self->_hasDRCenablementBit = a3;
}

- (BOOL)hasDRCenablementBit
{
  return self->_hasDRCenablementBit;
}

- (unsigned)DRCenablementBit
{
  return self->_DRCenablementBit;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_hasTimestamp = a3;
}

- (BOOL)hasTimestamp
{
  return self->_hasTimestamp;
}

- (unsigned)timestamp
{
  return self->_timestamp;
}

- (void)setHasAdjustedAutoAncGain:(BOOL)a3
{
  self->_hasAdjustedAutoAncGain = a3;
}

- (BOOL)hasAdjustedAutoAncGain
{
  return self->_hasAdjustedAutoAncGain;
}

- (unsigned)adjustedAutoAncGain
{
  return self->_adjustedAutoAncGain;
}

- (void)setHasFixedAutoAncGain:(BOOL)a3
{
  self->_hasFixedAutoAncGain = a3;
}

- (BOOL)hasFixedAutoAncGain
{
  return self->_hasFixedAutoAncGain;
}

- (unsigned)fixedAutoAncGain
{
  return self->_fixedAutoAncGain;
}

- (void)setHasFit:(BOOL)a3
{
  self->_hasFit = a3;
}

- (BOOL)hasFit
{
  return self->_hasFit;
}

- (unsigned)fit
{
  return self->_fit;
}

- (void)setHasNonCAListeningMode:(BOOL)a3
{
  self->_hasNonCAListeningMode = a3;
}

- (BOOL)hasNonCAListeningMode
{
  return self->_hasNonCAListeningMode;
}

- (unsigned)nonCAListeningMode
{
  return self->_nonCAListeningMode;
}

- (void)setHasInstdBC:(BOOL)a3
{
  self->_hasInstdBC = a3;
}

- (BOOL)hasInstdBC
{
  return self->_hasInstdBC;
}

- (unsigned)instdBC
{
  return self->_instdBC;
}

- (void)setHasInstdBA:(BOOL)a3
{
  self->_hasInstdBA = a3;
}

- (BOOL)hasInstdBA
{
  return self->_hasInstdBA;
}

- (unsigned)instdBA
{
  return self->_instdBA;
}

- (NSArray)noiseType4B
{
  return self->_noiseType4B;
}

- (void)setHasStreamingAppBundleId:(BOOL)a3
{
  self->_hasStreamingAppBundleId = a3;
}

- (BOOL)hasStreamingAppBundleId
{
  return self->_hasStreamingAppBundleId;
}

- (unsigned)streamingAppBundleId
{
  return self->_streamingAppBundleId;
}

- (void)setHasFocusMode:(BOOL)a3
{
  self->_hasFocusMode = a3;
}

- (BOOL)hasFocusMode
{
  return self->_hasFocusMode;
}

- (unsigned)focusMode
{
  return self->_focusMode;
}

- (void)setHasLocationType:(BOOL)a3
{
  self->_hasLocationType = a3;
}

- (BOOL)hasLocationType
{
  return self->_hasLocationType;
}

- (unsigned)locationType
{
  return self->_locationType;
}

- (void)setHasLocation:(BOOL)a3
{
  self->_hasLocation = a3;
}

- (BOOL)hasLocation
{
  return self->_hasLocation;
}

- (unsigned)location
{
  return self->_location;
}

- (void)setHasBudActivity:(BOOL)a3
{
  self->_hasBudActivity = a3;
}

- (BOOL)hasBudActivity
{
  return self->_hasBudActivity;
}

- (unsigned)budActivity
{
  return self->_budActivity;
}

- (void)setHasSourceActivity:(BOOL)a3
{
  self->_hasSourceActivity = a3;
}

- (BOOL)hasSourceActivity
{
  return self->_hasSourceActivity;
}

- (unsigned)sourceActivity
{
  return self->_sourceActivity;
}

- (void)setHasMediaType:(BOOL)a3
{
  self->_hasMediaType = a3;
}

- (BOOL)hasMediaType
{
  return self->_hasMediaType;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (void)setHasWindProb:(BOOL)a3
{
  self->_hasWindProb = a3;
}

- (BOOL)hasWindProb
{
  return self->_hasWindProb;
}

- (unsigned)windProb
{
  return self->_windProb;
}

- (void)setHasWindStrength:(BOOL)a3
{
  self->_hasWindStrength = a3;
}

- (BOOL)hasWindStrength
{
  return self->_hasWindStrength;
}

- (unsigned)windStrength
{
  return self->_windStrength;
}

- (NSArray)envSpectralData32B
{
  return self->_envSpectralData32B;
}

- (void)setHasPvFeatureEnableFlag:(BOOL)a3
{
  self->_hasPvFeatureEnableFlag = a3;
}

- (BOOL)hasPvFeatureEnableFlag
{
  return self->_hasPvFeatureEnableFlag;
}

- (unsigned)pvFeatureEnableFlag
{
  return self->_pvFeatureEnableFlag;
}

- (void)setHasActiveStreamFlag:(BOOL)a3
{
  self->_hasActiveStreamFlag = a3;
}

- (BOOL)hasActiveStreamFlag
{
  return self->_hasActiveStreamFlag;
}

- (unsigned)activeStreamFlag
{
  return self->_activeStreamFlag;
}

- (void)setHasCdEngagementFlag:(BOOL)a3
{
  self->_hasCdEngagementFlag = a3;
}

- (BOOL)hasCdEngagementFlag
{
  return self->_hasCdEngagementFlag;
}

- (unsigned)cdEngagementFlag
{
  return self->_cdEngagementFlag;
}

- (void)setHasSingleBudFlag:(BOOL)a3
{
  self->_hasSingleBudFlag = a3;
}

- (BOOL)hasSingleBudFlag
{
  return self->_hasSingleBudFlag;
}

- (unsigned)singleBudFlag
{
  return self->_singleBudFlag;
}

- (void)setHasUnsignedPredVolSiriPrct:(BOOL)a3
{
  self->_hasUnsignedPredVolSiriPrct = a3;
}

- (BOOL)hasUnsignedPredVolSiriPrct
{
  return self->_hasUnsignedPredVolSiriPrct;
}

- (unsigned)unsignedPredVolSiriPrct
{
  return self->_unsignedPredVolSiriPrct;
}

- (void)setHasUnsignedPredVolTelephonyPrct:(BOOL)a3
{
  self->_hasUnsignedPredVolTelephonyPrct = a3;
}

- (BOOL)hasUnsignedPredVolTelephonyPrct
{
  return self->_hasUnsignedPredVolTelephonyPrct;
}

- (unsigned)unsignedPredVolTelephonyPrct
{
  return self->_unsignedPredVolTelephonyPrct;
}

- (void)setHasUnsignedPredVolMediaPrct:(BOOL)a3
{
  self->_hasUnsignedPredVolMediaPrct = a3;
}

- (BOOL)hasUnsignedPredVolMediaPrct
{
  return self->_hasUnsignedPredVolMediaPrct;
}

- (unsigned)unsignedPredVolMediaPrct
{
  return self->_unsignedPredVolMediaPrct;
}

- (void)setHasPersonalizationCoeff:(BOOL)a3
{
  self->_hasPersonalizationCoeff = a3;
}

- (BOOL)hasPersonalizationCoeff
{
  return self->_hasPersonalizationCoeff;
}

- (unsigned)personalizationCoeff
{
  return self->_personalizationCoeff;
}

- (void)setHasAnchorEnv:(BOOL)a3
{
  self->_hasAnchorEnv = a3;
}

- (BOOL)hasAnchorEnv
{
  return self->_hasAnchorEnv;
}

- (unsigned)anchorEnv
{
  return self->_anchorEnv;
}

- (void)setHasAnchorVol:(BOOL)a3
{
  self->_hasAnchorVol = a3;
}

- (BOOL)hasAnchorVol
{
  return self->_hasAnchorVol;
}

- (unsigned)anchorVol
{
  return self->_anchorVol;
}

- (NSString)activeAirpodsSerialNumber
{
  return self->_activeAirpodsSerialNumber;
}

- (NSString)activeAppName
{
  return self->_activeAppName;
}

- (void)setHasSmallWindowSize:(BOOL)a3
{
  self->_hasSmallWindowSize = a3;
}

- (BOOL)hasSmallWindowSize
{
  return self->_hasSmallWindowSize;
}

- (unsigned)smallWindowSize
{
  return self->_smallWindowSize;
}

- (void)setHasBigWindowSize:(BOOL)a3
{
  self->_hasBigWindowSize = a3;
}

- (BOOL)hasBigWindowSize
{
  return self->_hasBigWindowSize;
}

- (unsigned)bigWindowSize
{
  return self->_bigWindowSize;
}

- (void)setHasManualVolumeChangeFlag:(BOOL)a3
{
  self->_hasManualVolumeChangeFlag = a3;
}

- (BOOL)hasManualVolumeChangeFlag
{
  return self->_hasManualVolumeChangeFlag;
}

- (unsigned)manualVolumeChangeFlag
{
  return self->_manualVolumeChangeFlag;
}

- (void)setHasMinMaxCutFlag:(BOOL)a3
{
  self->_hasMinMaxCutFlag = a3;
}

- (BOOL)hasMinMaxCutFlag
{
  return self->_hasMinMaxCutFlag;
}

- (unsigned)minMaxCutFlag
{
  return self->_minMaxCutFlag;
}

- (void)setHasGuardrailsAvoidFlag:(BOOL)a3
{
  self->_hasGuardrailsAvoidFlag = a3;
}

- (BOOL)hasGuardrailsAvoidFlag
{
  return self->_hasGuardrailsAvoidFlag;
}

- (unsigned)guardrailsAvoidFlag
{
  return self->_guardrailsAvoidFlag;
}

- (void)setHasOnStartPredictionFlag:(BOOL)a3
{
  self->_hasOnStartPredictionFlag = a3;
}

- (BOOL)hasOnStartPredictionFlag
{
  return self->_hasOnStartPredictionFlag;
}

- (unsigned)onStartPredictionFlag
{
  return self->_onStartPredictionFlag;
}

- (void)setHasPredVolSiriPrct:(BOOL)a3
{
  self->_hasPredVolSiriPrct = a3;
}

- (BOOL)hasPredVolSiriPrct
{
  return self->_hasPredVolSiriPrct;
}

- (int)predVolSiriPrct
{
  return self->_predVolSiriPrct;
}

- (void)setHasPredVolTelephonyPrct:(BOOL)a3
{
  self->_hasPredVolTelephonyPrct = a3;
}

- (BOOL)hasPredVolTelephonyPrct
{
  return self->_hasPredVolTelephonyPrct;
}

- (int)predVolTelephonyPrct
{
  return self->_predVolTelephonyPrct;
}

- (void)setHasPredVolMediaPrct:(BOOL)a3
{
  self->_hasPredVolMediaPrct = a3;
}

- (BOOL)hasPredVolMediaPrct
{
  return self->_hasPredVolMediaPrct;
}

- (int)predVolMediaPrct
{
  return self->_predVolMediaPrct;
}

- (void)setHasDesiredDeltaE:(BOOL)a3
{
  self->_hasDesiredDeltaE = a3;
}

- (BOOL)hasDesiredDeltaE
{
  return self->_hasDesiredDeltaE;
}

- (int)desiredDeltaE
{
  return self->_desiredDeltaE;
}

- (void)setHasSmoothEae:(BOOL)a3
{
  self->_hasSmoothEae = a3;
}

- (BOOL)hasSmoothEae
{
  return self->_hasSmoothEae;
}

- (unsigned)smoothEae
{
  return self->_smoothEae;
}

- (void)setHasLastVolSiriPrct:(BOOL)a3
{
  self->_hasLastVolSiriPrct = a3;
}

- (BOOL)hasLastVolSiriPrct
{
  return self->_hasLastVolSiriPrct;
}

- (unsigned)lastVolSiriPrct
{
  return self->_lastVolSiriPrct;
}

- (void)setHasLastESiridBA:(BOOL)a3
{
  self->_hasLastESiridBA = a3;
}

- (BOOL)hasLastESiridBA
{
  return self->_hasLastESiridBA;
}

- (unsigned)lastESiridBA
{
  return self->_lastESiridBA;
}

- (void)setHasLastVolTelephonyPrct:(BOOL)a3
{
  self->_hasLastVolTelephonyPrct = a3;
}

- (BOOL)hasLastVolTelephonyPrct
{
  return self->_hasLastVolTelephonyPrct;
}

- (unsigned)lastVolTelephonyPrct
{
  return self->_lastVolTelephonyPrct;
}

- (void)setHasLastETelephonydBA:(BOOL)a3
{
  self->_hasLastETelephonydBA = a3;
}

- (BOOL)hasLastETelephonydBA
{
  return self->_hasLastETelephonydBA;
}

- (unsigned)lastETelephonydBA
{
  return self->_lastETelephonydBA;
}

- (void)setHasLastVolMediaPrct:(BOOL)a3
{
  self->_hasLastVolMediaPrct = a3;
}

- (BOOL)hasLastVolMediaPrct
{
  return self->_hasLastVolMediaPrct;
}

- (unsigned)lastVolMediaPrct
{
  return self->_lastVolMediaPrct;
}

- (void)setHasLastEMediadBA:(BOOL)a3
{
  self->_hasLastEMediadBA = a3;
}

- (BOOL)hasLastEMediadBA
{
  return self->_hasLastEMediadBA;
}

- (unsigned)lastEMediadBA
{
  return self->_lastEMediadBA;
}

- (void)setHasPersonalizationParamMistakes:(BOOL)a3
{
  self->_hasPersonalizationParamMistakes = a3;
}

- (BOOL)hasPersonalizationParamMistakes
{
  return self->_hasPersonalizationParamMistakes;
}

- (int)personalizationParamMistakes
{
  return self->_personalizationParamMistakes;
}

- (void)setHasPersonalizationParamSnr:(BOOL)a3
{
  self->_hasPersonalizationParamSnr = a3;
}

- (BOOL)hasPersonalizationParamSnr
{
  return self->_hasPersonalizationParamSnr;
}

- (int)personalizationParamSnr
{
  return self->_personalizationParamSnr;
}

- (void)setHasSpeechPresenceProbability:(BOOL)a3
{
  self->_hasSpeechPresenceProbability = a3;
}

- (BOOL)hasSpeechPresenceProbability
{
  return self->_hasSpeechPresenceProbability;
}

- (unsigned)speechPresenceProbability
{
  return self->_speechPresenceProbability;
}

- (void)setHasVolumeChangeFlag:(BOOL)a3
{
  self->_hasVolumeChangeFlag = a3;
}

- (BOOL)hasVolumeChangeFlag
{
  return self->_hasVolumeChangeFlag;
}

- (unsigned)volumeChangeFlag
{
  return self->_volumeChangeFlag;
}

- (void)setHasWindSpeechAggressorFlag:(BOOL)a3
{
  self->_hasWindSpeechAggressorFlag = a3;
}

- (BOOL)hasWindSpeechAggressorFlag
{
  return self->_hasWindSpeechAggressorFlag;
}

- (unsigned)windSpeechAggressorFlag
{
  return self->_windSpeechAggressorFlag;
}

- (void)setHasStreamType:(BOOL)a3
{
  self->_hasStreamType = a3;
}

- (BOOL)hasStreamType
{
  return self->_hasStreamType;
}

- (unsigned)streamType
{
  return self->_streamType;
}

- (void)setHasHeadphoneMode:(BOOL)a3
{
  self->_hasHeadphoneMode = a3;
}

- (BOOL)hasHeadphoneMode
{
  return self->_hasHeadphoneMode;
}

- (unsigned)headphoneMode
{
  return self->_headphoneMode;
}

- (void)setHasLastUserVolChangeType:(BOOL)a3
{
  self->_hasLastUserVolChangeType = a3;
}

- (BOOL)hasLastUserVolChangeType
{
  return self->_hasLastUserVolChangeType;
}

- (unsigned)lastUserVolChangeType
{
  return self->_lastUserVolChangeType;
}

- (void)setHasCurrentVolumePrct:(BOOL)a3
{
  self->_hasCurrentVolumePrct = a3;
}

- (BOOL)hasCurrentVolumePrct
{
  return self->_hasCurrentVolumePrct;
}

- (unsigned)currentVolumePrct
{
  return self->_currentVolumePrct;
}

- (void)setHasDownlinkdBA:(BOOL)a3
{
  self->_hasDownlinkdBA = a3;
}

- (BOOL)hasDownlinkdBA
{
  return self->_hasDownlinkdBA;
}

- (unsigned)downlinkdBA
{
  return self->_downlinkdBA;
}

- (void)setHasDrumdBAPredicted:(BOOL)a3
{
  self->_hasDrumdBAPredicted = a3;
}

- (BOOL)hasDrumdBAPredicted
{
  return self->_hasDrumdBAPredicted;
}

- (unsigned)drumdBAPredicted
{
  return self->_drumdBAPredicted;
}

- (void)setHasDrumdBK:(BOOL)a3
{
  self->_hasDrumdBK = a3;
}

- (BOOL)hasDrumdBK
{
  return self->_hasDrumdBK;
}

- (unsigned)drumdBK
{
  return self->_drumdBK;
}

- (void)setHasDrumdBA:(BOOL)a3
{
  self->_hasDrumdBA = a3;
}

- (BOOL)hasDrumdBA
{
  return self->_hasDrumdBA;
}

- (unsigned)drumdBA
{
  return self->_drumdBA;
}

- (void)setHasRefMicdBC:(BOOL)a3
{
  self->_hasRefMicdBC = a3;
}

- (BOOL)hasRefMicdBC
{
  return self->_hasRefMicdBC;
}

- (unsigned)refMicdBC
{
  return self->_refMicdBC;
}

- (void)setHasRefMicdBA:(BOOL)a3
{
  self->_hasRefMicdBA = a3;
}

- (BOOL)hasRefMicdBA
{
  return self->_hasRefMicdBA;
}

- (unsigned)refMicdBA
{
  return self->_refMicdBA;
}

- (void)setHasControllerVersion:(BOOL)a3
{
  self->_hasControllerVersion = a3;
}

- (BOOL)hasControllerVersion
{
  return self->_hasControllerVersion;
}

- (unsigned)controllerVersion
{
  return self->_controllerVersion;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(BMDeviceAdaptiveVolume *)self hasControllerVersion]
      || [v5 hasControllerVersion])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasControllerVersion]) {
        goto LABEL_339;
      }
      if (![v5 hasControllerVersion]) {
        goto LABEL_339;
      }
      unsigned int v6 = [(BMDeviceAdaptiveVolume *)self controllerVersion];
      if (v6 != [v5 controllerVersion]) {
        goto LABEL_339;
      }
    }
    if (-[BMDeviceAdaptiveVolume hasRefMicdBA](self, "hasRefMicdBA") || [v5 hasRefMicdBA])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasRefMicdBA]) {
        goto LABEL_339;
      }
      if (![v5 hasRefMicdBA]) {
        goto LABEL_339;
      }
      unsigned int v7 = [(BMDeviceAdaptiveVolume *)self refMicdBA];
      if (v7 != [v5 refMicdBA]) {
        goto LABEL_339;
      }
    }
    if (-[BMDeviceAdaptiveVolume hasRefMicdBC](self, "hasRefMicdBC") || [v5 hasRefMicdBC])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasRefMicdBC]) {
        goto LABEL_339;
      }
      if (![v5 hasRefMicdBC]) {
        goto LABEL_339;
      }
      unsigned int v8 = [(BMDeviceAdaptiveVolume *)self refMicdBC];
      if (v8 != [v5 refMicdBC]) {
        goto LABEL_339;
      }
    }
    if (-[BMDeviceAdaptiveVolume hasDrumdBA](self, "hasDrumdBA") || [v5 hasDrumdBA])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasDrumdBA]) {
        goto LABEL_339;
      }
      if (![v5 hasDrumdBA]) {
        goto LABEL_339;
      }
      unsigned int v9 = [(BMDeviceAdaptiveVolume *)self drumdBA];
      if (v9 != [v5 drumdBA]) {
        goto LABEL_339;
      }
    }
    if (-[BMDeviceAdaptiveVolume hasDrumdBK](self, "hasDrumdBK") || [v5 hasDrumdBK])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasDrumdBK]) {
        goto LABEL_339;
      }
      if (![v5 hasDrumdBK]) {
        goto LABEL_339;
      }
      unsigned int v10 = [(BMDeviceAdaptiveVolume *)self drumdBK];
      if (v10 != [v5 drumdBK]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasDrumdBAPredicted]
      || [v5 hasDrumdBAPredicted])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasDrumdBAPredicted]) {
        goto LABEL_339;
      }
      if (![v5 hasDrumdBAPredicted]) {
        goto LABEL_339;
      }
      unsigned int v11 = [(BMDeviceAdaptiveVolume *)self drumdBAPredicted];
      if (v11 != [v5 drumdBAPredicted]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasDownlinkdBA]
      || [v5 hasDownlinkdBA])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasDownlinkdBA]) {
        goto LABEL_339;
      }
      if (![v5 hasDownlinkdBA]) {
        goto LABEL_339;
      }
      unsigned int v12 = [(BMDeviceAdaptiveVolume *)self downlinkdBA];
      if (v12 != [v5 downlinkdBA]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasCurrentVolumePrct]
      || [v5 hasCurrentVolumePrct])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasCurrentVolumePrct]) {
        goto LABEL_339;
      }
      if (![v5 hasCurrentVolumePrct]) {
        goto LABEL_339;
      }
      unsigned int v13 = [(BMDeviceAdaptiveVolume *)self currentVolumePrct];
      if (v13 != [v5 currentVolumePrct]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasLastUserVolChangeType]
      || [v5 hasLastUserVolChangeType])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasLastUserVolChangeType]) {
        goto LABEL_339;
      }
      if (![v5 hasLastUserVolChangeType]) {
        goto LABEL_339;
      }
      unsigned int v14 = [(BMDeviceAdaptiveVolume *)self lastUserVolChangeType];
      if (v14 != [v5 lastUserVolChangeType]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasHeadphoneMode]
      || [v5 hasHeadphoneMode])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasHeadphoneMode]) {
        goto LABEL_339;
      }
      if (![v5 hasHeadphoneMode]) {
        goto LABEL_339;
      }
      unsigned int v15 = [(BMDeviceAdaptiveVolume *)self headphoneMode];
      if (v15 != [v5 headphoneMode]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasStreamType]
      || [v5 hasStreamType])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasStreamType]) {
        goto LABEL_339;
      }
      if (![v5 hasStreamType]) {
        goto LABEL_339;
      }
      unsigned int v16 = [(BMDeviceAdaptiveVolume *)self streamType];
      if (v16 != [v5 streamType]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasWindSpeechAggressorFlag]
      || [v5 hasWindSpeechAggressorFlag])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasWindSpeechAggressorFlag]) {
        goto LABEL_339;
      }
      if (![v5 hasWindSpeechAggressorFlag]) {
        goto LABEL_339;
      }
      unsigned int v17 = [(BMDeviceAdaptiveVolume *)self windSpeechAggressorFlag];
      if (v17 != [v5 windSpeechAggressorFlag]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasVolumeChangeFlag]
      || [v5 hasVolumeChangeFlag])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasVolumeChangeFlag]) {
        goto LABEL_339;
      }
      if (![v5 hasVolumeChangeFlag]) {
        goto LABEL_339;
      }
      unsigned int v18 = [(BMDeviceAdaptiveVolume *)self volumeChangeFlag];
      if (v18 != [v5 volumeChangeFlag]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasSpeechPresenceProbability]
      || [v5 hasSpeechPresenceProbability])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasSpeechPresenceProbability]) {
        goto LABEL_339;
      }
      if (![v5 hasSpeechPresenceProbability]) {
        goto LABEL_339;
      }
      unsigned int v19 = [(BMDeviceAdaptiveVolume *)self speechPresenceProbability];
      if (v19 != [v5 speechPresenceProbability]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasPersonalizationParamSnr]
      || [v5 hasPersonalizationParamSnr])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasPersonalizationParamSnr]) {
        goto LABEL_339;
      }
      if (![v5 hasPersonalizationParamSnr]) {
        goto LABEL_339;
      }
      int v20 = [(BMDeviceAdaptiveVolume *)self personalizationParamSnr];
      if (v20 != [v5 personalizationParamSnr]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasPersonalizationParamMistakes]
      || [v5 hasPersonalizationParamMistakes])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasPersonalizationParamMistakes]) {
        goto LABEL_339;
      }
      if (![v5 hasPersonalizationParamMistakes]) {
        goto LABEL_339;
      }
      int v21 = [(BMDeviceAdaptiveVolume *)self personalizationParamMistakes];
      if (v21 != [v5 personalizationParamMistakes]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasLastEMediadBA]
      || [v5 hasLastEMediadBA])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasLastEMediadBA]) {
        goto LABEL_339;
      }
      if (![v5 hasLastEMediadBA]) {
        goto LABEL_339;
      }
      unsigned int v22 = [(BMDeviceAdaptiveVolume *)self lastEMediadBA];
      if (v22 != [v5 lastEMediadBA]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasLastVolMediaPrct]
      || [v5 hasLastVolMediaPrct])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasLastVolMediaPrct]) {
        goto LABEL_339;
      }
      if (![v5 hasLastVolMediaPrct]) {
        goto LABEL_339;
      }
      unsigned int v23 = [(BMDeviceAdaptiveVolume *)self lastVolMediaPrct];
      if (v23 != [v5 lastVolMediaPrct]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasLastETelephonydBA]
      || [v5 hasLastETelephonydBA])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasLastETelephonydBA]) {
        goto LABEL_339;
      }
      if (![v5 hasLastETelephonydBA]) {
        goto LABEL_339;
      }
      unsigned int v24 = [(BMDeviceAdaptiveVolume *)self lastETelephonydBA];
      if (v24 != [v5 lastETelephonydBA]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasLastVolTelephonyPrct]
      || [v5 hasLastVolTelephonyPrct])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasLastVolTelephonyPrct]) {
        goto LABEL_339;
      }
      if (![v5 hasLastVolTelephonyPrct]) {
        goto LABEL_339;
      }
      unsigned int v25 = [(BMDeviceAdaptiveVolume *)self lastVolTelephonyPrct];
      if (v25 != [v5 lastVolTelephonyPrct]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasLastESiridBA]
      || [v5 hasLastESiridBA])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasLastESiridBA]) {
        goto LABEL_339;
      }
      if (![v5 hasLastESiridBA]) {
        goto LABEL_339;
      }
      unsigned int v26 = [(BMDeviceAdaptiveVolume *)self lastESiridBA];
      if (v26 != [v5 lastESiridBA]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasLastVolSiriPrct]
      || [v5 hasLastVolSiriPrct])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasLastVolSiriPrct]) {
        goto LABEL_339;
      }
      if (![v5 hasLastVolSiriPrct]) {
        goto LABEL_339;
      }
      unsigned int v27 = [(BMDeviceAdaptiveVolume *)self lastVolSiriPrct];
      if (v27 != [v5 lastVolSiriPrct]) {
        goto LABEL_339;
      }
    }
    if (-[BMDeviceAdaptiveVolume hasSmoothEae](self, "hasSmoothEae") || [v5 hasSmoothEae])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasSmoothEae]) {
        goto LABEL_339;
      }
      if (![v5 hasSmoothEae]) {
        goto LABEL_339;
      }
      unsigned int v28 = [(BMDeviceAdaptiveVolume *)self smoothEae];
      if (v28 != [v5 smoothEae]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasDesiredDeltaE]
      || [v5 hasDesiredDeltaE])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasDesiredDeltaE]) {
        goto LABEL_339;
      }
      if (![v5 hasDesiredDeltaE]) {
        goto LABEL_339;
      }
      int v29 = [(BMDeviceAdaptiveVolume *)self desiredDeltaE];
      if (v29 != [v5 desiredDeltaE]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasPredVolMediaPrct]
      || [v5 hasPredVolMediaPrct])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasPredVolMediaPrct]) {
        goto LABEL_339;
      }
      if (![v5 hasPredVolMediaPrct]) {
        goto LABEL_339;
      }
      int v30 = [(BMDeviceAdaptiveVolume *)self predVolMediaPrct];
      if (v30 != [v5 predVolMediaPrct]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasPredVolTelephonyPrct]
      || [v5 hasPredVolTelephonyPrct])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasPredVolTelephonyPrct]) {
        goto LABEL_339;
      }
      if (![v5 hasPredVolTelephonyPrct]) {
        goto LABEL_339;
      }
      int v31 = [(BMDeviceAdaptiveVolume *)self predVolTelephonyPrct];
      if (v31 != [v5 predVolTelephonyPrct]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasPredVolSiriPrct]
      || [v5 hasPredVolSiriPrct])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasPredVolSiriPrct]) {
        goto LABEL_339;
      }
      if (![v5 hasPredVolSiriPrct]) {
        goto LABEL_339;
      }
      int v32 = [(BMDeviceAdaptiveVolume *)self predVolSiriPrct];
      if (v32 != [v5 predVolSiriPrct]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasOnStartPredictionFlag]
      || [v5 hasOnStartPredictionFlag])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasOnStartPredictionFlag]) {
        goto LABEL_339;
      }
      if (![v5 hasOnStartPredictionFlag]) {
        goto LABEL_339;
      }
      unsigned int v33 = [(BMDeviceAdaptiveVolume *)self onStartPredictionFlag];
      if (v33 != [v5 onStartPredictionFlag]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasGuardrailsAvoidFlag]
      || [v5 hasGuardrailsAvoidFlag])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasGuardrailsAvoidFlag]) {
        goto LABEL_339;
      }
      if (![v5 hasGuardrailsAvoidFlag]) {
        goto LABEL_339;
      }
      unsigned int v34 = [(BMDeviceAdaptiveVolume *)self guardrailsAvoidFlag];
      if (v34 != [v5 guardrailsAvoidFlag]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasMinMaxCutFlag]
      || [v5 hasMinMaxCutFlag])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasMinMaxCutFlag]) {
        goto LABEL_339;
      }
      if (![v5 hasMinMaxCutFlag]) {
        goto LABEL_339;
      }
      unsigned int v35 = [(BMDeviceAdaptiveVolume *)self minMaxCutFlag];
      if (v35 != [v5 minMaxCutFlag]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasManualVolumeChangeFlag]
      || [v5 hasManualVolumeChangeFlag])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasManualVolumeChangeFlag]) {
        goto LABEL_339;
      }
      if (![v5 hasManualVolumeChangeFlag]) {
        goto LABEL_339;
      }
      unsigned int v36 = [(BMDeviceAdaptiveVolume *)self manualVolumeChangeFlag];
      if (v36 != [v5 manualVolumeChangeFlag]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasBigWindowSize]
      || [v5 hasBigWindowSize])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasBigWindowSize]) {
        goto LABEL_339;
      }
      if (![v5 hasBigWindowSize]) {
        goto LABEL_339;
      }
      unsigned int v37 = [(BMDeviceAdaptiveVolume *)self bigWindowSize];
      if (v37 != [v5 bigWindowSize]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasSmallWindowSize]
      || [v5 hasSmallWindowSize])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasSmallWindowSize]) {
        goto LABEL_339;
      }
      if (![v5 hasSmallWindowSize]) {
        goto LABEL_339;
      }
      unsigned int v38 = [(BMDeviceAdaptiveVolume *)self smallWindowSize];
      if (v38 != [v5 smallWindowSize]) {
        goto LABEL_339;
      }
    }
    v39 = [(BMDeviceAdaptiveVolume *)self activeAppName];
    uint64_t v40 = [v5 activeAppName];
    if (v39 == (void *)v40)
    {
    }
    else
    {
      v41 = (void *)v40;
      v42 = [(BMDeviceAdaptiveVolume *)self activeAppName];
      v43 = [v5 activeAppName];
      int v44 = [v42 isEqual:v43];

      if (!v44) {
        goto LABEL_339;
      }
    }
    v46 = [(BMDeviceAdaptiveVolume *)self activeAirpodsSerialNumber];
    uint64_t v47 = [v5 activeAirpodsSerialNumber];
    if (v46 == (void *)v47)
    {
    }
    else
    {
      v48 = (void *)v47;
      v49 = [(BMDeviceAdaptiveVolume *)self activeAirpodsSerialNumber];
      v50 = [v5 activeAirpodsSerialNumber];
      int v51 = [v49 isEqual:v50];

      if (!v51) {
        goto LABEL_339;
      }
    }
    if (-[BMDeviceAdaptiveVolume hasAnchorVol](self, "hasAnchorVol") || [v5 hasAnchorVol])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasAnchorVol]) {
        goto LABEL_339;
      }
      if (![v5 hasAnchorVol]) {
        goto LABEL_339;
      }
      unsigned int v52 = [(BMDeviceAdaptiveVolume *)self anchorVol];
      if (v52 != [v5 anchorVol]) {
        goto LABEL_339;
      }
    }
    if (-[BMDeviceAdaptiveVolume hasAnchorEnv](self, "hasAnchorEnv") || [v5 hasAnchorEnv])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasAnchorEnv]) {
        goto LABEL_339;
      }
      if (![v5 hasAnchorEnv]) {
        goto LABEL_339;
      }
      unsigned int v53 = [(BMDeviceAdaptiveVolume *)self anchorEnv];
      if (v53 != [v5 anchorEnv]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasPersonalizationCoeff]
      || [v5 hasPersonalizationCoeff])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasPersonalizationCoeff]) {
        goto LABEL_339;
      }
      if (![v5 hasPersonalizationCoeff]) {
        goto LABEL_339;
      }
      unsigned int v54 = [(BMDeviceAdaptiveVolume *)self personalizationCoeff];
      if (v54 != [v5 personalizationCoeff]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasUnsignedPredVolMediaPrct]
      || [v5 hasUnsignedPredVolMediaPrct])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasUnsignedPredVolMediaPrct]) {
        goto LABEL_339;
      }
      if (![v5 hasUnsignedPredVolMediaPrct]) {
        goto LABEL_339;
      }
      unsigned int v55 = [(BMDeviceAdaptiveVolume *)self unsignedPredVolMediaPrct];
      if (v55 != [v5 unsignedPredVolMediaPrct]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasUnsignedPredVolTelephonyPrct]
      || [v5 hasUnsignedPredVolTelephonyPrct])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasUnsignedPredVolTelephonyPrct]) {
        goto LABEL_339;
      }
      if (![v5 hasUnsignedPredVolTelephonyPrct]) {
        goto LABEL_339;
      }
      unsigned int v56 = [(BMDeviceAdaptiveVolume *)self unsignedPredVolTelephonyPrct];
      if (v56 != [v5 unsignedPredVolTelephonyPrct]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasUnsignedPredVolSiriPrct]
      || [v5 hasUnsignedPredVolSiriPrct])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasUnsignedPredVolSiriPrct]) {
        goto LABEL_339;
      }
      if (![v5 hasUnsignedPredVolSiriPrct]) {
        goto LABEL_339;
      }
      unsigned int v57 = [(BMDeviceAdaptiveVolume *)self unsignedPredVolSiriPrct];
      if (v57 != [v5 unsignedPredVolSiriPrct]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasSingleBudFlag]
      || [v5 hasSingleBudFlag])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasSingleBudFlag]) {
        goto LABEL_339;
      }
      if (![v5 hasSingleBudFlag]) {
        goto LABEL_339;
      }
      unsigned int v58 = [(BMDeviceAdaptiveVolume *)self singleBudFlag];
      if (v58 != [v5 singleBudFlag]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasCdEngagementFlag]
      || [v5 hasCdEngagementFlag])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasCdEngagementFlag]) {
        goto LABEL_339;
      }
      if (![v5 hasCdEngagementFlag]) {
        goto LABEL_339;
      }
      unsigned int v59 = [(BMDeviceAdaptiveVolume *)self cdEngagementFlag];
      if (v59 != [v5 cdEngagementFlag]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasActiveStreamFlag]
      || [v5 hasActiveStreamFlag])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasActiveStreamFlag]) {
        goto LABEL_339;
      }
      if (![v5 hasActiveStreamFlag]) {
        goto LABEL_339;
      }
      unsigned int v60 = [(BMDeviceAdaptiveVolume *)self activeStreamFlag];
      if (v60 != [v5 activeStreamFlag]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasPvFeatureEnableFlag]
      || [v5 hasPvFeatureEnableFlag])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasPvFeatureEnableFlag]) {
        goto LABEL_339;
      }
      if (![v5 hasPvFeatureEnableFlag]) {
        goto LABEL_339;
      }
      unsigned int v61 = [(BMDeviceAdaptiveVolume *)self pvFeatureEnableFlag];
      if (v61 != [v5 pvFeatureEnableFlag]) {
        goto LABEL_339;
      }
    }
    v62 = [(BMDeviceAdaptiveVolume *)self envSpectralData32B];
    uint64_t v63 = [v5 envSpectralData32B];
    if (v62 == (void *)v63)
    {
    }
    else
    {
      v64 = (void *)v63;
      v65 = [(BMDeviceAdaptiveVolume *)self envSpectralData32B];
      v66 = [v5 envSpectralData32B];
      int v67 = [v65 isEqual:v66];

      if (!v67) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasWindStrength]
      || [v5 hasWindStrength])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasWindStrength]) {
        goto LABEL_339;
      }
      if (![v5 hasWindStrength]) {
        goto LABEL_339;
      }
      unsigned int v68 = [(BMDeviceAdaptiveVolume *)self windStrength];
      if (v68 != [v5 windStrength]) {
        goto LABEL_339;
      }
    }
    if (-[BMDeviceAdaptiveVolume hasWindProb](self, "hasWindProb") || [v5 hasWindProb])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasWindProb]) {
        goto LABEL_339;
      }
      if (![v5 hasWindProb]) {
        goto LABEL_339;
      }
      unsigned int v69 = [(BMDeviceAdaptiveVolume *)self windProb];
      if (v69 != [v5 windProb]) {
        goto LABEL_339;
      }
    }
    if (-[BMDeviceAdaptiveVolume hasMediaType](self, "hasMediaType") || [v5 hasMediaType])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasMediaType]) {
        goto LABEL_339;
      }
      if (![v5 hasMediaType]) {
        goto LABEL_339;
      }
      unsigned int v70 = [(BMDeviceAdaptiveVolume *)self mediaType];
      if (v70 != [v5 mediaType]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasSourceActivity]
      || [v5 hasSourceActivity])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasSourceActivity]) {
        goto LABEL_339;
      }
      if (![v5 hasSourceActivity]) {
        goto LABEL_339;
      }
      unsigned int v71 = [(BMDeviceAdaptiveVolume *)self sourceActivity];
      if (v71 != [v5 sourceActivity]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasBudActivity]
      || [v5 hasBudActivity])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasBudActivity]) {
        goto LABEL_339;
      }
      if (![v5 hasBudActivity]) {
        goto LABEL_339;
      }
      unsigned int v72 = [(BMDeviceAdaptiveVolume *)self budActivity];
      if (v72 != [v5 budActivity]) {
        goto LABEL_339;
      }
    }
    if (-[BMDeviceAdaptiveVolume hasLocation](self, "hasLocation") || [v5 hasLocation])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasLocation]) {
        goto LABEL_339;
      }
      if (![v5 hasLocation]) {
        goto LABEL_339;
      }
      unsigned int v73 = [(BMDeviceAdaptiveVolume *)self location];
      if (v73 != [v5 location]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasLocationType]
      || [v5 hasLocationType])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasLocationType]) {
        goto LABEL_339;
      }
      if (![v5 hasLocationType]) {
        goto LABEL_339;
      }
      unsigned int v74 = [(BMDeviceAdaptiveVolume *)self locationType];
      if (v74 != [v5 locationType]) {
        goto LABEL_339;
      }
    }
    if (-[BMDeviceAdaptiveVolume hasFocusMode](self, "hasFocusMode") || [v5 hasFocusMode])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasFocusMode]) {
        goto LABEL_339;
      }
      if (![v5 hasFocusMode]) {
        goto LABEL_339;
      }
      unsigned int v75 = [(BMDeviceAdaptiveVolume *)self focusMode];
      if (v75 != [v5 focusMode]) {
        goto LABEL_339;
      }
    }
    if ([(BMDeviceAdaptiveVolume *)self hasStreamingAppBundleId]
      || [v5 hasStreamingAppBundleId])
    {
      if (![(BMDeviceAdaptiveVolume *)self hasStreamingAppBundleId]) {
        goto LABEL_339;
      }
      if (![v5 hasStreamingAppBundleId]) {
        goto LABEL_339;
      }
      unsigned int v76 = [(BMDeviceAdaptiveVolume *)self streamingAppBundleId];
      if (v76 != [v5 streamingAppBundleId]) {
        goto LABEL_339;
      }
    }
    v77 = [(BMDeviceAdaptiveVolume *)self noiseType4B];
    uint64_t v78 = [v5 noiseType4B];
    if (v77 == (void *)v78)
    {
    }
    else
    {
      v79 = (void *)v78;
      v80 = [(BMDeviceAdaptiveVolume *)self noiseType4B];
      v81 = [v5 noiseType4B];
      int v82 = [v80 isEqual:v81];

      if (!v82) {
        goto LABEL_339;
      }
    }
    if (!-[BMDeviceAdaptiveVolume hasInstdBA](self, "hasInstdBA") && ![v5 hasInstdBA]
      || [(BMDeviceAdaptiveVolume *)self hasInstdBA]
      && [v5 hasInstdBA]
      && (unsigned int v83 = -[BMDeviceAdaptiveVolume instdBA](self, "instdBA"), v83 == [v5 instdBA]))
    {
      if (!-[BMDeviceAdaptiveVolume hasInstdBC](self, "hasInstdBC") && ![v5 hasInstdBC]
        || [(BMDeviceAdaptiveVolume *)self hasInstdBC]
        && [v5 hasInstdBC]
        && (unsigned int v84 = -[BMDeviceAdaptiveVolume instdBC](self, "instdBC"), v84 == [v5 instdBC]))
      {
        if (![(BMDeviceAdaptiveVolume *)self hasNonCAListeningMode]
          && ![v5 hasNonCAListeningMode]
          || [(BMDeviceAdaptiveVolume *)self hasNonCAListeningMode]
          && [v5 hasNonCAListeningMode]
          && (unsigned int v85 = [(BMDeviceAdaptiveVolume *)self nonCAListeningMode],
              v85 == [v5 nonCAListeningMode]))
        {
          if (!-[BMDeviceAdaptiveVolume hasFit](self, "hasFit") && ![v5 hasFit]
            || [(BMDeviceAdaptiveVolume *)self hasFit]
            && [v5 hasFit]
            && (unsigned int v86 = -[BMDeviceAdaptiveVolume fit](self, "fit"), v86 == [v5 fit]))
          {
            if (![(BMDeviceAdaptiveVolume *)self hasFixedAutoAncGain]
              && ![v5 hasFixedAutoAncGain]
              || [(BMDeviceAdaptiveVolume *)self hasFixedAutoAncGain]
              && [v5 hasFixedAutoAncGain]
              && (unsigned int v87 = [(BMDeviceAdaptiveVolume *)self fixedAutoAncGain],
                  v87 == [v5 fixedAutoAncGain]))
            {
              if (![(BMDeviceAdaptiveVolume *)self hasAdjustedAutoAncGain]
                && ![v5 hasAdjustedAutoAncGain]
                || [(BMDeviceAdaptiveVolume *)self hasAdjustedAutoAncGain]
                && [v5 hasAdjustedAutoAncGain]
                && (unsigned int v88 = [(BMDeviceAdaptiveVolume *)self adjustedAutoAncGain],
                    v88 == [v5 adjustedAutoAncGain]))
              {
                if (![(BMDeviceAdaptiveVolume *)self hasTimestamp]
                  && ![v5 hasTimestamp]
                  || [(BMDeviceAdaptiveVolume *)self hasTimestamp]
                  && [v5 hasTimestamp]
                  && (unsigned int v89 = [(BMDeviceAdaptiveVolume *)self timestamp],
                      v89 == [v5 timestamp]))
                {
                  if (![(BMDeviceAdaptiveVolume *)self hasDRCenablementBit]
                    && ![v5 hasDRCenablementBit]
                    || [(BMDeviceAdaptiveVolume *)self hasDRCenablementBit]
                    && [v5 hasDRCenablementBit]
                    && (unsigned int v90 = [(BMDeviceAdaptiveVolume *)self DRCenablementBit],
                        v90 == [v5 DRCenablementBit]))
                  {
                    if (![(BMDeviceAdaptiveVolume *)self hasDRCwindFlag]
                      && ![v5 hasDRCwindFlag]
                      || [(BMDeviceAdaptiveVolume *)self hasDRCwindFlag]
                      && [v5 hasDRCwindFlag]
                      && (unsigned int v91 = [(BMDeviceAdaptiveVolume *)self DRCwindFlag],
                          v91 == [v5 DRCwindFlag]))
                    {
                      if (![(BMDeviceAdaptiveVolume *)self hasDRCappSelfVoiceFlag]
                        && ![v5 hasDRCappSelfVoiceFlag]
                        || [(BMDeviceAdaptiveVolume *)self hasDRCappSelfVoiceFlag]
                        && [v5 hasDRCappSelfVoiceFlag]
                        && (unsigned int v92 = [(BMDeviceAdaptiveVolume *)self DRCappSelfVoiceFlag],
                            v92 == [v5 DRCappSelfVoiceFlag]))
                      {
                        if (![(BMDeviceAdaptiveVolume *)self hasDrumDRC]
                          && ![v5 hasDrumDRC]
                          || [(BMDeviceAdaptiveVolume *)self hasDrumDRC]
                          && [v5 hasDrumDRC]
                          && (unsigned int v93 = [(BMDeviceAdaptiveVolume *)self drumDRC],
                              v93 == [v5 drumDRC]))
                        {
                          if (![(BMDeviceAdaptiveVolume *)self hasRoutedDRCGain]
                            && ![v5 hasRoutedDRCGain])
                          {
                            BOOL v45 = 1;
                            goto LABEL_340;
                          }
                          if ([(BMDeviceAdaptiveVolume *)self hasRoutedDRCGain]
                            && [v5 hasRoutedDRCGain])
                          {
                            unsigned int v94 = [(BMDeviceAdaptiveVolume *)self routedDRCGain];
                            BOOL v45 = v94 == [v5 routedDRCGain];
LABEL_340:

                            goto LABEL_341;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_339:
    BOOL v45 = 0;
    goto LABEL_340;
  }
  BOOL v45 = 0;
LABEL_341:

  return v45;
}

- (id)jsonDictionary
{
  uint64_t v269 = *MEMORY[0x1E4F143B8];
  if ([(BMDeviceAdaptiveVolume *)self hasControllerVersion])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume controllerVersion](self, "controllerVersion"));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasRefMicdBA])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume refMicdBA](self, "refMicdBA"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasRefMicdBC])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume refMicdBC](self, "refMicdBC"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasDrumdBA])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume drumdBA](self, "drumdBA"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasDrumdBK])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume drumdBK](self, "drumdBK"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasDrumdBAPredicted])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume drumdBAPredicted](self, "drumdBAPredicted"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasDownlinkdBA])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume downlinkdBA](self, "downlinkdBA"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasCurrentVolumePrct])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume currentVolumePrct](self, "currentVolumePrct"));
    id v212 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v212 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasLastUserVolChangeType])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastUserVolChangeType](self, "lastUserVolChangeType"));
    id v211 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v211 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasHeadphoneMode])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume headphoneMode](self, "headphoneMode"));
    id v210 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v210 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasStreamType])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume streamType](self, "streamType"));
    id v209 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v209 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasWindSpeechAggressorFlag])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume windSpeechAggressorFlag](self, "windSpeechAggressorFlag"));
    id v208 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v208 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasVolumeChangeFlag])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume volumeChangeFlag](self, "volumeChangeFlag"));
    id v207 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v207 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasSpeechPresenceProbability])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume speechPresenceProbability](self, "speechPresenceProbability"));
    id v206 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v206 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasPersonalizationParamSnr])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceAdaptiveVolume personalizationParamSnr](self, "personalizationParamSnr"));
    id v205 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v205 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasPersonalizationParamMistakes])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceAdaptiveVolume personalizationParamMistakes](self, "personalizationParamMistakes"));
    id v204 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v204 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasLastEMediadBA])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastEMediadBA](self, "lastEMediadBA"));
    id v203 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v203 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasLastVolMediaPrct])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastVolMediaPrct](self, "lastVolMediaPrct"));
    id v202 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v202 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasLastETelephonydBA])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastETelephonydBA](self, "lastETelephonydBA"));
    id v201 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v201 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasLastVolTelephonyPrct])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastVolTelephonyPrct](self, "lastVolTelephonyPrct"));
    id v200 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v200 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasLastESiridBA])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastESiridBA](self, "lastESiridBA"));
    id v199 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v199 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasLastVolSiriPrct])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastVolSiriPrct](self, "lastVolSiriPrct"));
    id v198 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v198 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasSmoothEae])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume smoothEae](self, "smoothEae"));
    id v197 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v197 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasDesiredDeltaE])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceAdaptiveVolume desiredDeltaE](self, "desiredDeltaE"));
    id v196 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v196 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasPredVolMediaPrct])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceAdaptiveVolume predVolMediaPrct](self, "predVolMediaPrct"));
    id v195 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v195 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasPredVolTelephonyPrct])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceAdaptiveVolume predVolTelephonyPrct](self, "predVolTelephonyPrct"));
    id v194 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v194 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasPredVolSiriPrct])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceAdaptiveVolume predVolSiriPrct](self, "predVolSiriPrct"));
    id v193 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v193 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasOnStartPredictionFlag])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume onStartPredictionFlag](self, "onStartPredictionFlag"));
    id v192 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v192 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasGuardrailsAvoidFlag])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume guardrailsAvoidFlag](self, "guardrailsAvoidFlag"));
    id v191 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v191 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasMinMaxCutFlag])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume minMaxCutFlag](self, "minMaxCutFlag"));
    id v190 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v190 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasManualVolumeChangeFlag])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume manualVolumeChangeFlag](self, "manualVolumeChangeFlag"));
    id v189 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v189 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasBigWindowSize])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume bigWindowSize](self, "bigWindowSize"));
    id v188 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v188 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasSmallWindowSize])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume smallWindowSize](self, "smallWindowSize"));
    id v187 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v187 = 0;
  }
  v186 = [(BMDeviceAdaptiveVolume *)self activeAppName];
  v185 = [(BMDeviceAdaptiveVolume *)self activeAirpodsSerialNumber];
  if ([(BMDeviceAdaptiveVolume *)self hasAnchorVol])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume anchorVol](self, "anchorVol"));
    id v184 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v184 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasAnchorEnv])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume anchorEnv](self, "anchorEnv"));
    id v183 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v183 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasPersonalizationCoeff])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume personalizationCoeff](self, "personalizationCoeff"));
    id v182 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v182 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasUnsignedPredVolMediaPrct])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume unsignedPredVolMediaPrct](self, "unsignedPredVolMediaPrct"));
    id v181 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v181 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasUnsignedPredVolTelephonyPrct])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume unsignedPredVolTelephonyPrct](self, "unsignedPredVolTelephonyPrct"));
    id v180 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v180 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasUnsignedPredVolSiriPrct])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume unsignedPredVolSiriPrct](self, "unsignedPredVolSiriPrct"));
    id v179 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v179 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasSingleBudFlag])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume singleBudFlag](self, "singleBudFlag"));
    id v178 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v178 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasCdEngagementFlag])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume cdEngagementFlag](self, "cdEngagementFlag"));
    id v177 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v177 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasActiveStreamFlag])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume activeStreamFlag](self, "activeStreamFlag"));
    id v176 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v176 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasPvFeatureEnableFlag])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume pvFeatureEnableFlag](self, "pvFeatureEnableFlag"));
    id v175 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v175 = 0;
  }
  v155 = [(BMDeviceAdaptiveVolume *)self _envSpectralData32BJSONArray];
  if ([(BMDeviceAdaptiveVolume *)self hasWindStrength])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume windStrength](self, "windStrength"));
    id v154 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v154 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasWindProb])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume windProb](self, "windProb"));
    id v153 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v153 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasMediaType])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume mediaType](self, "mediaType"));
    id v174 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v174 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasSourceActivity])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume sourceActivity](self, "sourceActivity"));
    id v173 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v173 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasBudActivity])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume budActivity](self, "budActivity"));
    id v172 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v172 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasLocation])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume location](self, "location"));
    id v171 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v171 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasLocationType])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume locationType](self, "locationType"));
    id v170 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v170 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasFocusMode])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume focusMode](self, "focusMode"));
    id v169 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v169 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasStreamingAppBundleId])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume streamingAppBundleId](self, "streamingAppBundleId"));
    id v168 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v168 = 0;
  }
  v167 = [(BMDeviceAdaptiveVolume *)self _noiseType4BJSONArray];
  if ([(BMDeviceAdaptiveVolume *)self hasInstdBA])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume instdBA](self, "instdBA"));
    id v166 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v166 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasInstdBC])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume instdBC](self, "instdBC"));
    id v165 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v165 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasNonCAListeningMode])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume nonCAListeningMode](self, "nonCAListeningMode"));
    id v164 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v164 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasFit])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume fit](self, "fit"));
    id v163 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v163 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasFixedAutoAncGain])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume fixedAutoAncGain](self, "fixedAutoAncGain"));
    id v162 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v162 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasAdjustedAutoAncGain])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume adjustedAutoAncGain](self, "adjustedAutoAncGain"));
    id v161 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v161 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasTimestamp])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume timestamp](self, "timestamp"));
    id v160 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v160 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasDRCenablementBit])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume DRCenablementBit](self, "DRCenablementBit"));
    id v159 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v159 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasDRCwindFlag])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume DRCwindFlag](self, "DRCwindFlag"));
    id v158 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v158 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasDRCappSelfVoiceFlag])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume DRCappSelfVoiceFlag](self, "DRCappSelfVoiceFlag"));
    id v157 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v157 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasDrumDRC])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume drumDRC](self, "drumDRC"));
    id v156 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v156 = 0;
  }
  if ([(BMDeviceAdaptiveVolume *)self hasRoutedDRCGain])
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume routedDRCGain](self, "routedDRCGain"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
  v214[0] = @"controllerVersion";
  uint64_t v11 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v146 = (void *)v11;
  v241[0] = v11;
  v214[1] = @"refMicdBA";
  uint64_t v12 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v145 = (void *)v12;
  v241[1] = v12;
  v214[2] = @"refMicdBC";
  uint64_t v13 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v144 = (void *)v13;
  v241[2] = v13;
  v214[3] = @"drumdBA";
  uint64_t v14 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v143 = (void *)v14;
  v241[3] = v14;
  v214[4] = @"drumdBK";
  uint64_t v15 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v142 = (void *)v15;
  v241[4] = v15;
  v214[5] = @"drumdBAPredicted";
  uint64_t v16 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v141 = (void *)v16;
  v241[5] = v16;
  v214[6] = @"downlinkdBA";
  uint64_t v17 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v140 = (void *)v17;
  v241[6] = v17;
  v214[7] = @"currentVolumePrct";
  uint64_t v18 = (uint64_t)v212;
  if (!v212)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v139 = (void *)v18;
  v241[7] = v18;
  v214[8] = @"lastUserVolChangeType";
  uint64_t v19 = (uint64_t)v211;
  if (!v211)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v138 = (void *)v19;
  v241[8] = v19;
  v214[9] = @"headphoneMode";
  uint64_t v20 = (uint64_t)v210;
  if (!v210)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v137 = (void *)v20;
  v241[9] = v20;
  v214[10] = @"streamType";
  uint64_t v21 = (uint64_t)v209;
  if (!v209)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v136 = (void *)v21;
  v241[10] = v21;
  v214[11] = @"windSpeechAggressorFlag";
  uint64_t v22 = (uint64_t)v208;
  if (!v208)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v135 = (void *)v22;
  v241[11] = v22;
  v214[12] = @"volumeChangeFlag";
  uint64_t v23 = (uint64_t)v207;
  if (!v207)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v134 = (void *)v23;
  v241[12] = v23;
  v214[13] = @"speechPresenceProbability";
  uint64_t v24 = (uint64_t)v206;
  if (!v206)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v133 = (void *)v24;
  v241[13] = v24;
  v214[14] = @"personalizationParamSnr";
  uint64_t v25 = (uint64_t)v205;
  if (!v205)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v132 = (void *)v25;
  v241[14] = v25;
  v214[15] = @"personalizationParamMistakes";
  uint64_t v26 = (uint64_t)v204;
  if (!v204)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v131 = (void *)v26;
  v241[15] = v26;
  v214[16] = @"lastEMediadBA";
  uint64_t v27 = (uint64_t)v203;
  if (!v203)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v130 = (void *)v27;
  v241[16] = v27;
  v214[17] = @"lastVolMediaPrct";
  uint64_t v28 = (uint64_t)v202;
  if (!v202)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v129 = (void *)v28;
  v241[17] = v28;
  v214[18] = @"lastETelephonydBA";
  uint64_t v29 = (uint64_t)v201;
  if (!v201)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v128 = (void *)v29;
  v241[18] = v29;
  v214[19] = @"lastVolTelephonyPrct";
  uint64_t v30 = (uint64_t)v200;
  if (!v200)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v127 = (void *)v30;
  v241[19] = v30;
  v214[20] = @"lastESiridBA";
  uint64_t v31 = (uint64_t)v199;
  if (!v199)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v126 = (void *)v31;
  v241[20] = v31;
  v214[21] = @"lastVolSiriPrct";
  uint64_t v32 = (uint64_t)v198;
  if (!v198)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v125 = (void *)v32;
  v241[21] = v32;
  v214[22] = @"smoothEae";
  uint64_t v33 = (uint64_t)v197;
  if (!v197)
  {
    uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v124 = (void *)v33;
  v241[22] = v33;
  v214[23] = @"desiredDeltaE";
  uint64_t v34 = (uint64_t)v196;
  if (!v196)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v123 = (void *)v34;
  v241[23] = v34;
  v214[24] = @"predVolMediaPrct";
  uint64_t v35 = (uint64_t)v195;
  if (!v195)
  {
    uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v122 = (void *)v35;
  v241[24] = v35;
  v214[25] = @"predVolTelephonyPrct";
  uint64_t v36 = (uint64_t)v194;
  if (!v194)
  {
    uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v121 = (void *)v36;
  v241[25] = v36;
  v214[26] = @"predVolSiriPrct";
  uint64_t v37 = (uint64_t)v193;
  if (!v193)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  }
  v120 = (void *)v37;
  v241[26] = v37;
  v214[27] = @"onStartPredictionFlag";
  uint64_t v38 = (uint64_t)v192;
  if (!v192)
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v119 = (void *)v38;
  v241[27] = v38;
  v214[28] = @"guardrailsAvoidFlag";
  uint64_t v39 = (uint64_t)v191;
  if (!v191)
  {
    uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v118 = (void *)v39;
  v241[28] = v39;
  v214[29] = @"minMaxCutFlag";
  uint64_t v40 = (uint64_t)v190;
  if (!v190)
  {
    uint64_t v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v117 = (void *)v40;
  v241[29] = v40;
  v214[30] = @"manualVolumeChangeFlag";
  uint64_t v41 = (uint64_t)v189;
  if (!v189)
  {
    uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
  }
  v116 = (void *)v41;
  v241[30] = v41;
  v214[31] = @"bigWindowSize";
  uint64_t v42 = (uint64_t)v188;
  if (!v188)
  {
    uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
  }
  v115 = (void *)v42;
  v241[31] = v42;
  v214[32] = @"smallWindowSize";
  uint64_t v43 = (uint64_t)v187;
  if (!v187)
  {
    uint64_t v43 = [MEMORY[0x1E4F1CA98] null];
  }
  v114 = (void *)v43;
  v241[32] = v43;
  v214[33] = @"activeAppName";
  uint64_t v44 = (uint64_t)v186;
  if (!v186)
  {
    uint64_t v44 = [MEMORY[0x1E4F1CA98] null];
  }
  v113 = (void *)v44;
  v241[33] = v44;
  v214[34] = @"activeAirpodsSerialNumber";
  uint64_t v45 = (uint64_t)v185;
  if (!v185)
  {
    uint64_t v45 = [MEMORY[0x1E4F1CA98] null];
  }
  v112 = (void *)v45;
  v241[34] = v45;
  v214[35] = @"anchorVol";
  uint64_t v46 = (uint64_t)v184;
  if (!v184)
  {
    uint64_t v46 = [MEMORY[0x1E4F1CA98] null];
  }
  v111 = (void *)v46;
  v241[35] = v46;
  v214[36] = @"anchorEnv";
  uint64_t v47 = (uint64_t)v183;
  if (!v183)
  {
    uint64_t v47 = [MEMORY[0x1E4F1CA98] null];
  }
  v110 = (void *)v47;
  v241[36] = v47;
  v214[37] = @"personalizationCoeff";
  uint64_t v48 = (uint64_t)v182;
  if (!v182)
  {
    uint64_t v48 = [MEMORY[0x1E4F1CA98] null];
  }
  v109 = (void *)v48;
  v241[37] = v48;
  v214[38] = @"unsignedPredVolMediaPrct";
  uint64_t v49 = (uint64_t)v181;
  if (!v181)
  {
    uint64_t v49 = [MEMORY[0x1E4F1CA98] null];
  }
  v108 = (void *)v49;
  v241[38] = v49;
  v214[39] = @"unsignedPredVolTelephonyPrct";
  uint64_t v50 = (uint64_t)v180;
  if (!v180)
  {
    uint64_t v50 = [MEMORY[0x1E4F1CA98] null];
  }
  v107 = (void *)v50;
  v241[39] = v50;
  v214[40] = @"unsignedPredVolSiriPrct";
  uint64_t v51 = (uint64_t)v179;
  if (!v179)
  {
    uint64_t v51 = [MEMORY[0x1E4F1CA98] null];
  }
  v106 = (void *)v51;
  v241[40] = v51;
  v214[41] = @"singleBudFlag";
  uint64_t v52 = (uint64_t)v178;
  if (!v178)
  {
    uint64_t v52 = [MEMORY[0x1E4F1CA98] null];
  }
  v105 = (void *)v52;
  v241[41] = v52;
  v214[42] = @"cdEngagementFlag";
  uint64_t v53 = (uint64_t)v177;
  if (!v177)
  {
    uint64_t v53 = [MEMORY[0x1E4F1CA98] null];
  }
  v104 = (void *)v53;
  v241[42] = v53;
  v214[43] = @"activeStreamFlag";
  uint64_t v54 = (uint64_t)v176;
  if (!v176)
  {
    uint64_t v54 = [MEMORY[0x1E4F1CA98] null];
  }
  v103 = (void *)v54;
  v152 = v10;
  v241[43] = v54;
  v214[44] = @"pvFeatureEnableFlag";
  uint64_t v55 = (uint64_t)v175;
  if (!v175)
  {
    uint64_t v55 = [MEMORY[0x1E4F1CA98] null];
  }
  v102 = (void *)v55;
  v241[44] = v55;
  v214[45] = @"envSpectralData32B";
  if (v155)
  {
    v242 = v155;
    v215 = @"envSpectralData_32B";
    uint64_t v56 = (uint64_t)v155;
  }
  else
  {
    unsigned int v86 = [MEMORY[0x1E4F1CA98] null];
    v242 = v86;
    v215 = @"envSpectralData_32B";
    uint64_t v56 = [MEMORY[0x1E4F1CA98] null];
  }
  v101 = (void *)v56;
  uint64_t v243 = v56;
  v216 = @"windStrength";
  if (v154)
  {
    id v244 = v154;
    v217 = @"wind_strength";
    uint64_t v57 = (uint64_t)v154;
  }
  else
  {
    unsigned int v85 = [MEMORY[0x1E4F1CA98] null];
    id v244 = v85;
    v217 = @"wind_strength";
    uint64_t v57 = [MEMORY[0x1E4F1CA98] null];
  }
  v100 = (void *)v57;
  uint64_t v245 = v57;
  v218 = @"windProb";
  if (v153)
  {
    id v246 = v153;
    v219 = @"wind_prob";
    uint64_t v58 = (uint64_t)v153;
  }
  else
  {
    unsigned int v84 = [MEMORY[0x1E4F1CA98] null];
    id v246 = v84;
    v219 = @"wind_prob";
    uint64_t v58 = [MEMORY[0x1E4F1CA98] null];
  }
  v99 = (void *)v58;
  uint64_t v247 = v58;
  v220 = @"mediaType";
  uint64_t v59 = (uint64_t)v174;
  if (!v174)
  {
    uint64_t v59 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v248 = v59;
  v221 = @"sourceActivity";
  uint64_t v60 = (uint64_t)v173;
  if (!v173)
  {
    uint64_t v60 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v249 = v60;
  v222 = @"budActivity";
  uint64_t v61 = (uint64_t)v172;
  if (!v172)
  {
    uint64_t v61 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v250 = v61;
  v223 = @"location";
  uint64_t v62 = (uint64_t)v171;
  if (!v171)
  {
    uint64_t v62 = [MEMORY[0x1E4F1CA98] null];
  }
  v95 = (void *)v62;
  uint64_t v251 = v62;
  v224 = @"locationType";
  uint64_t v63 = (uint64_t)v170;
  if (!v170)
  {
    uint64_t v63 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v94 = (void *)v63;
  uint64_t v252 = v63;
  v225 = @"focusMode";
  uint64_t v64 = (uint64_t)v169;
  if (!v169)
  {
    uint64_t v64 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v93 = (void *)v64;
  v98 = (void *)v59;
  uint64_t v253 = v64;
  v226 = @"streamingAppBundleId";
  uint64_t v65 = (uint64_t)v168;
  if (!v168)
  {
    uint64_t v65 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v92 = (void *)v65;
  uint64_t v254 = v65;
  v227 = @"noiseType4B";
  v96 = (void *)v61;
  if (v167)
  {
    v255 = v167;
    v228 = @"noiseType_4B";
    uint64_t v66 = (uint64_t)v167;
  }
  else
  {
    unsigned int v83 = [MEMORY[0x1E4F1CA98] null];
    v255 = v83;
    v228 = @"noiseType_4B";
    uint64_t v66 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v91 = (void *)v66;
  uint64_t v256 = v66;
  v229 = @"instdBA";
  uint64_t v67 = (uint64_t)v166;
  if (!v166)
  {
    uint64_t v67 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v257 = v67;
  v230 = @"instdBC";
  unsigned int v68 = v165;
  if (!v165)
  {
    unsigned int v68 = [MEMORY[0x1E4F1CA98] null];
  }
  v258 = v68;
  v231 = @"nonCAListeningMode";
  uint64_t v69 = (uint64_t)v164;
  if (!v164)
  {
    uint64_t v69 = [MEMORY[0x1E4F1CA98] null];
  }
  v213 = (void *)v69;
  uint64_t v259 = v69;
  v232 = @"fit";
  uint64_t v70 = (uint64_t)v163;
  if (!v163)
  {
    uint64_t v70 = [MEMORY[0x1E4F1CA98] null];
  }
  v148 = v9;
  unsigned int v89 = (void *)v70;
  uint64_t v260 = v70;
  v233 = @"fixedAutoAncGain";
  uint64_t v71 = (uint64_t)v162;
  if (!v162)
  {
    uint64_t v71 = [MEMORY[0x1E4F1CA98] null];
  }
  v97 = (void *)v60;
  unsigned int v88 = (void *)v71;
  uint64_t v261 = v71;
  v234 = @"adjustedAutoAncGain";
  uint64_t v72 = (uint64_t)v161;
  if (!v161)
  {
    uint64_t v72 = [MEMORY[0x1E4F1CA98] null];
  }
  v150 = v7;
  v151 = v6;
  unsigned int v87 = (void *)v72;
  uint64_t v262 = v72;
  v235 = @"timestamp";
  unsigned int v73 = v160;
  if (!v160)
  {
    unsigned int v73 = [MEMORY[0x1E4F1CA98] null];
  }
  v149 = v4;
  v263 = v73;
  v236 = @"DRCenablementBit";
  unsigned int v74 = v159;
  if (!v159)
  {
    unsigned int v74 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v90 = (void *)v67;
  unsigned int v75 = v8;
  v264 = v74;
  v237 = @"DRCwindFlag";
  unsigned int v76 = v158;
  if (!v158)
  {
    unsigned int v76 = [MEMORY[0x1E4F1CA98] null];
  }
  v77 = v3;
  v265 = v76;
  v238 = @"DRCappSelfVoiceFlag";
  uint64_t v78 = v157;
  if (!v157)
  {
    uint64_t v78 = [MEMORY[0x1E4F1CA98] null];
  }
  v266 = v78;
  v239 = @"drumDRC";
  v79 = v156;
  if (!v156)
  {
    v79 = [MEMORY[0x1E4F1CA98] null];
  }
  v267 = v79;
  v240 = @"routedDRCGain";
  v80 = v152;
  if (!v152)
  {
    v80 = [MEMORY[0x1E4F1CA98] null];
  }
  v268 = v80;
  id v147 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v241 forKeys:v214 count:72];
  if (!v152) {

  }
  v81 = v213;
  if (!v156)
  {

    v81 = v213;
  }
  if (!v157)
  {

    v81 = v213;
  }
  if (!v158)
  {

    v81 = v213;
  }
  if (!v159)
  {

    v81 = v213;
  }
  if (!v160)
  {

    v81 = v213;
  }
  if (!v161)
  {

    v81 = v213;
  }
  if (!v162)
  {

    v81 = v213;
  }
  if (!v163)
  {

    v81 = v213;
  }
  if (!v164) {

  }
  if (!v165) {
  if (!v166)
  }

  if (!v167)
  {
  }
  if (!v168) {

  }
  if (!v169) {
  if (!v170)
  }

  if (!v171) {
  if (!v172)
  }

  if (!v173) {
  if (v174)
  }
  {
    if (v153) {
      goto LABEL_373;
    }
  }
  else
  {

    if (v153)
    {
LABEL_373:
      if (v154) {
        goto LABEL_374;
      }
LABEL_462:

      if (v155) {
        goto LABEL_375;
      }
      goto LABEL_463;
    }
  }

  if (!v154) {
    goto LABEL_462;
  }
LABEL_374:
  if (v155) {
    goto LABEL_375;
  }
LABEL_463:

LABEL_375:
  if (!v175) {

  }
  if (!v176) {
  if (!v177)
  }

  if (!v178) {
  if (!v179)
  }

  if (!v180) {
  if (!v181)
  }

  if (!v182) {
  if (!v183)
  }

  if (!v184) {
  if (!v185)
  }

  if (!v186) {
  if (!v187)
  }

  if (!v188) {
  if (!v189)
  }

  if (!v190) {
  if (!v191)
  }

  if (!v192) {
  if (!v193)
  }

  if (!v194) {
  if (!v195)
  }

  if (!v196) {
  if (!v197)
  }

  if (!v198) {
  if (!v199)
  }

  if (!v200) {
  if (!v201)
  }

  if (!v202) {
  if (!v203)
  }

  if (!v204) {
  if (!v205)
  }

  if (!v206) {
  if (!v207)
  }

  if (!v208) {
  if (!v209)
  }

  if (!v210) {
  if (!v211)
  }

  if (v212)
  {
    if (v148) {
      goto LABEL_451;
    }
  }
  else
  {

    if (v148)
    {
LABEL_451:
      if (v75) {
        goto LABEL_452;
      }
      goto LABEL_466;
    }
  }

  if (v75)
  {
LABEL_452:
    if (v150) {
      goto LABEL_453;
    }
    goto LABEL_467;
  }
LABEL_466:

  if (v150)
  {
LABEL_453:
    if (v151) {
      goto LABEL_454;
    }
    goto LABEL_468;
  }
LABEL_467:

  if (v151)
  {
LABEL_454:
    if (v5) {
      goto LABEL_455;
    }
    goto LABEL_469;
  }
LABEL_468:

  if (v5)
  {
LABEL_455:
    if (v149) {
      goto LABEL_456;
    }
LABEL_470:

    if (v77) {
      goto LABEL_457;
    }
    goto LABEL_471;
  }
LABEL_469:

  if (!v149) {
    goto LABEL_470;
  }
LABEL_456:
  if (v77) {
    goto LABEL_457;
  }
LABEL_471:

LABEL_457:

  return v147;
}

- (id)_noiseType4BJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMDeviceAdaptiveVolume *)self noiseType4B];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_envSpectralData32BJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMDeviceAdaptiveVolume *)self envSpectralData32B];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMDeviceAdaptiveVolume)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v734[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"controllerVersion"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_4:
    id v9 = [v6 objectForKeyedSubscript:@"refMicdBA"];
    id v580 = v8;
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
LABEL_7:
      uint64_t v11 = [v6 objectForKeyedSubscript:@"refMicdBC"];
      v578 = (void *)v11;
      if (!v11 || (long long v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        long long v13 = a4;
        id v579 = 0;
LABEL_10:
        uint64_t v14 = [v6 objectForKeyedSubscript:@"drumdBA"];
        v577 = v9;
        if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v63 = v14;
            if (!v13)
            {
              uint64_t v60 = 0;
              uint64_t v49 = 0;
LABEL_599:
              long long v12 = v578;
              goto LABEL_600;
            }
            id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
            id v535 = v6;
            id v66 = v10;
            uint64_t v67 = self;
            uint64_t v68 = *MEMORY[0x1E4F502C8];
            uint64_t v727 = *MEMORY[0x1E4F28568];
            id v575 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"drumdBA"];
            id v728 = v575;
            uint64_t v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v728 forKeys:&v727 count:1];
            uint64_t v70 = v65;
            uint64_t v16 = (void *)v69;
            uint64_t v71 = v68;
            self = v67;
            id v10 = v66;
            id v6 = v535;
            uint64_t v60 = 0;
            uint64_t v49 = 0;
            *long long v13 = (id)[v70 initWithDomain:v71 code:2 userInfo:v69];
            goto LABEL_598;
          }
          v574 = v14;
          id v15 = v14;
        }
        else
        {
          v574 = v14;
          id v15 = 0;
        }
        uint64_t v16 = [v6 objectForKeyedSubscript:@"drumdBK"];
        if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v534 = v15;
          id v575 = 0;
          goto LABEL_16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v534 = v15;
          id v575 = v16;
LABEL_16:
          uint64_t v17 = [v6 objectForKeyedSubscript:@"drumdBAPredicted"];
          v573 = (void *)v17;
          if (!v17 || (uint64_t v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v532 = 0;
            goto LABEL_19;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v532 = v18;
LABEL_19:
            uint64_t v19 = [v6 objectForKeyedSubscript:@"downlinkdBA"];
            v530 = v16;
            v533 = (void *)v19;
            if (!v19 || (uint64_t v20 = (void *)v19, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v21 = 0;
LABEL_22:
              uint64_t v22 = [v6 objectForKeyedSubscript:@"currentVolumePrct"];
              v531 = (void *)v22;
              if (v22 && (uint64_t v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!v13)
                  {
                    uint64_t v24 = v6;
                    id v25 = 0;
                    uint64_t v49 = 0;
                    uint64_t v63 = v574;
                    uint64_t v60 = v534;
LABEL_594:
                    long long v13 = v532;
                    goto LABEL_595;
                  }
                  id v537 = v6;
                  id v528 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v84 = *MEMORY[0x1E4F502C8];
                  uint64_t v719 = *MEMORY[0x1E4F28568];
                  unsigned int v85 = v13;
                  uint64_t v60 = v534;
                  long long v13 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"currentVolumePrct"];
                  v720 = v13;
                  uint64_t v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v720 forKeys:&v719 count:1];
                  unsigned int v87 = v528;
                  uint64_t v24 = v537;
                  v527 = (void *)v86;
                  id v88 = (id)objc_msgSend(v87, "initWithDomain:code:userInfo:", v84, 2);
                  id v25 = 0;
                  uint64_t v49 = 0;
                  *unsigned int v85 = v88;
                  uint64_t v63 = v574;
                  goto LABEL_593;
                }
                uint64_t v24 = v6;
                id v25 = v23;
              }
              else
              {
                uint64_t v24 = v6;
                id v25 = 0;
              }
              uint64_t v26 = [v24 objectForKeyedSubscript:@"lastUserVolChangeType"];
              v527 = (void *)v26;
              if (!v26 || (uint64_t v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v525 = 0;
LABEL_28:
                uint64_t v28 = [v24 objectForKeyedSubscript:@"headphoneMode"];
                v526 = (void *)v28;
                if (v28 && (uint64_t v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (!v13)
                    {
                      id v523 = 0;
                      uint64_t v49 = 0;
                      uint64_t v63 = v574;
                      uint64_t v60 = v534;
LABEL_591:
                      long long v13 = v525;
                      goto LABEL_592;
                    }
                    v539 = v24;
                    id v95 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v524 = *MEMORY[0x1E4F502C8];
                    uint64_t v715 = *MEMORY[0x1E4F28568];
                    v510 = v13;
                    uint64_t v60 = v534;
                    long long v13 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"headphoneMode"];
                    v716 = v13;
                    uint64_t v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v716 forKeys:&v715 count:1];
                    v97 = v95;
                    uint64_t v24 = v539;
                    v522 = (void *)v96;
                    id v98 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v524, 2);
                    id v523 = 0;
                    uint64_t v49 = 0;
                    id *v510 = v98;
                    uint64_t v63 = v574;
                    goto LABEL_590;
                  }
                  id v523 = v29;
                }
                else
                {
                  id v523 = 0;
                }
                uint64_t v30 = [v24 objectForKeyedSubscript:@"streamType"];
                v522 = (void *)v30;
                if (!v30 || (uint64_t v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v506 = 0;
                  goto LABEL_34;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v506 = v31;
LABEL_34:
                  uint64_t v32 = [v24 objectForKeyedSubscript:@"windSpeechAggressorFlag"];
                  v502 = self;
                  v521 = (void *)v32;
                  if (!v32 || (uint64_t v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v507 = 0;
                    goto LABEL_37;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v507 = v33;
LABEL_37:
                    uint64_t v34 = [v24 objectForKeyedSubscript:@"volumeChangeFlag"];
                    v505 = (void *)v34;
                    if (!v34 || (uint64_t v35 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v503 = 0;
                      goto LABEL_40;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v503 = v35;
LABEL_40:
                      uint64_t v36 = [v24 objectForKeyedSubscript:@"speechPresenceProbability"];
                      v501 = (void *)v36;
                      if (!v36 || (uint64_t v37 = (void *)v36, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v499 = 0;
                        goto LABEL_43;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v499 = v37;
LABEL_43:
                        uint64_t v38 = [v24 objectForKeyedSubscript:@"personalizationParamSnr"];
                        id v493 = v21;
                        v498 = (void *)v38;
                        if (!v38 || (uint64_t v39 = (void *)v38, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v496 = 0;
                          goto LABEL_46;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v496 = v39;
LABEL_46:
                          uint64_t v40 = [v24 objectForKeyedSubscript:@"personalizationParamMistakes"];
                          v495 = (void *)v40;
                          if (!v40 || (uint64_t v41 = (void *)v40, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v494 = 0;
LABEL_49:
                            id v42 = [v24 objectForKeyedSubscript:@"lastEMediadBA"];
                            id v490 = v25;
                            v492 = v42;
                            if (!v42) {
                              goto LABEL_117;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v42 = 0;
                              goto LABEL_117;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v42 = v42;
LABEL_117:
                              v109 = [v24 objectForKeyedSubscript:@"lastVolMediaPrct"];
                              v110 = v13;
                              v491 = v42;
                              if (v109)
                              {
                                objc_opt_class();
                                v111 = v525;
                                if (objc_opt_isKindOfClass())
                                {
                                  id v489 = 0;
                                }
                                else
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    if (!v110)
                                    {
                                      id v489 = 0;
                                      uint64_t v49 = 0;
                                      uint64_t v63 = v574;
                                      uint64_t v60 = v534;
                                      id v21 = v493;
LABEL_582:
                                      long long v13 = v506;
                                      goto LABEL_583;
                                    }
                                    v547 = v24;
                                    id v187 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v188 = *MEMORY[0x1E4F502C8];
                                    uint64_t v699 = *MEMORY[0x1E4F28568];
                                    v518 = v110;
                                    id v21 = v493;
                                    id v189 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"lastVolMediaPrct"];
                                    v700 = v189;
                                    v116 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v700 forKeys:&v699 count:1];
                                    id v190 = v187;
                                    uint64_t v24 = v547;
                                    id v489 = 0;
                                    uint64_t v49 = 0;
                                    id *v518 = (id)[v190 initWithDomain:v188 code:2 userInfo:v116];
                                    uint64_t v63 = v574;
                                    goto LABEL_581;
                                  }
                                  id v489 = v109;
                                }
                              }
                              else
                              {
                                id v489 = 0;
                                v111 = v525;
                              }
                              v116 = [v24 objectForKeyedSubscript:@"lastETelephonydBA"];
                              if (!v116 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                v117 = v7;
                                id v488 = 0;
LABEL_129:
                                id v118 = [v24 objectForKeyedSubscript:@"lastVolTelephonyPrct"];
                                v485 = v116;
                                if (!v118)
                                {
                                  id v513 = 0;
                                  goto LABEL_143;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v513 = v118;
                                  id v118 = 0;
                                  goto LABEL_143;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v513 = v118;
                                  id v118 = v118;
LABEL_143:
                                  uint64_t v127 = [v24 objectForKeyedSubscript:@"lastESiridBA"];
                                  v487 = v118;
                                  v486 = (void *)v127;
                                  if (!v127
                                    || (v128 = (void *)v127, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v481 = 0;
                                    goto LABEL_146;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    v481 = v128;
LABEL_146:
                                    uint64_t v129 = [v24 objectForKeyedSubscript:@"lastVolSiriPrct"];
                                    v484 = (void *)v129;
                                    if (!v129
                                      || (v130 = (void *)v129, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      id v483 = 0;
                                      goto LABEL_149;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v483 = v130;
LABEL_149:
                                      uint64_t v131 = [v24 objectForKeyedSubscript:@"smoothEae"];
                                      v480 = (void *)v131;
                                      if (!v131
                                        || (v132 = (void *)v131, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        id v479 = 0;
                                        goto LABEL_152;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v479 = v132;
LABEL_152:
                                        uint64_t v133 = [v24 objectForKeyedSubscript:@"desiredDeltaE"];
                                        v478 = (void *)v133;
                                        if (!v133
                                          || (v134 = (void *)v133, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          id v477 = 0;
                                          goto LABEL_155;
                                        }
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          id v477 = v134;
LABEL_155:
                                          uint64_t v135 = [v24 objectForKeyedSubscript:@"predVolMediaPrct"];
                                          v476 = (void *)v135;
                                          if (!v135
                                            || (v136 = (void *)v135,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            id v475 = 0;
                                            goto LABEL_158;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v475 = v136;
LABEL_158:
                                            uint64_t v137 = [v24 objectForKeyedSubscript:@"predVolTelephonyPrct"];
                                            v474 = (void *)v137;
                                            if (!v137
                                              || (v138 = (void *)v137,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              id v473 = 0;
                                              goto LABEL_161;
                                            }
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v473 = v138;
LABEL_161:
                                              uint64_t v139 = [v24 objectForKeyedSubscript:@"predVolSiriPrct"];
                                              v472 = (void *)v139;
                                              if (!v139
                                                || (v140 = (void *)v139,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                id v471 = 0;
                                                goto LABEL_164;
                                              }
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                id v471 = v140;
LABEL_164:
                                                uint64_t v141 = [v24 objectForKeyedSubscript:@"onStartPredictionFlag"];
                                                v470 = (void *)v141;
                                                if (!v141
                                                  || (v142 = (void *)v141,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  id v469 = 0;
                                                  goto LABEL_167;
                                                }
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  id v469 = v142;
LABEL_167:
                                                  uint64_t v143 = [v24 objectForKeyedSubscript:@"guardrailsAvoidFlag"];
                                                  v468 = (void *)v143;
                                                  if (!v143
                                                    || (v144 = (void *)v143,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    id v467 = 0;
                                                    goto LABEL_170;
                                                  }
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    id v467 = v144;
LABEL_170:
                                                    uint64_t v145 = [v24 objectForKeyedSubscript:@"minMaxCutFlag"];
                                                    v466 = (void *)v145;
                                                    if (!v145
                                                      || (v146 = (void *)v145,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      id v465 = 0;
                                                      goto LABEL_173;
                                                    }
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      id v465 = v146;
LABEL_173:
                                                      uint64_t v147 = [v24 objectForKeyedSubscript:@"manualVolumeChangeFlag"];
                                                      v464 = (void *)v147;
                                                      if (!v147
                                                        || (v148 = (void *)v147,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        id v463 = 0;
                                                        goto LABEL_176;
                                                      }
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        id v463 = v148;
LABEL_176:
                                                        uint64_t v149 = [v24 objectForKeyedSubscript:@"bigWindowSize"];
                                                        v462 = (void *)v149;
                                                        if (!v149
                                                          || (v150 = (void *)v149,
                                                              objc_opt_class(),
                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          id v461 = 0;
                                                          goto LABEL_179;
                                                        }
                                                        objc_opt_class();
                                                        if (objc_opt_isKindOfClass())
                                                        {
                                                          id v461 = v150;
LABEL_179:
                                                          uint64_t v151 = [v24 objectForKeyedSubscript:@"smallWindowSize"];
                                                          v460 = (void *)v151;
                                                          if (!v151
                                                            || (v152 = (void *)v151,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            id v459 = 0;
LABEL_182:
                                                            uint64_t v153 = [v24 objectForKeyedSubscript:@"activeAppName"];
                                                            v457 = (void *)v153;
                                                            if (v153
                                                              && (id v154 = (void *)v153,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) == 0))
                                                            {
                                                              id v236 = v10;
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                              {
                                                                if (!v110)
                                                                {
                                                                  id v458 = 0;
                                                                  uint64_t v49 = 0;
                                                                  uint64_t v63 = v574;
                                                                  v116 = v485;
                                                                  id v193 = v513;
                                                                  v110 = (id *)v481;
                                                                  goto LABEL_565;
                                                                }
                                                                id v253 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                uint64_t v254 = *MEMORY[0x1E4F502C8];
                                                                uint64_t v667 = *MEMORY[0x1E4F28568];
                                                                id v456 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"activeAppName"];
                                                                id v668 = v456;
                                                                v455 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v668 forKeys:&v667 count:1];
                                                                id v458 = 0;
                                                                uint64_t v49 = 0;
                                                                id *v110 = (id)objc_msgSend(v253, "initWithDomain:code:userInfo:", v254, 2);
                                                                goto LABEL_356;
                                                              }
                                                              id v458 = v154;
                                                              v116 = v485;
                                                            }
                                                            else
                                                            {
                                                              id v458 = 0;
                                                            }
                                                            uint64_t v155 = [v24 objectForKeyedSubscript:@"activeAirpodsSerialNumber"];
                                                            v455 = (void *)v155;
                                                            if (!v155
                                                              || (id v156 = (void *)v155,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              id v456 = 0;
LABEL_188:
                                                              uint64_t v157 = [v24 objectForKeyedSubscript:@"anchorVol"];
                                                              v572 = v117;
                                                              v453 = (void *)v157;
                                                              if (v157
                                                                && (id v158 = (void *)v157,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                              {
                                                                objc_opt_class();
                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                {
                                                                  if (!v110)
                                                                  {
                                                                    id v454 = 0;
                                                                    uint64_t v49 = 0;
                                                                    uint64_t v63 = v574;
                                                                    id v193 = v513;
                                                                    v110 = (id *)v481;
                                                                    goto LABEL_562;
                                                                  }
                                                                  v563 = v24;
                                                                  id v258 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                  uint64_t v259 = *MEMORY[0x1E4F502C8];
                                                                  uint64_t v663 = *MEMORY[0x1E4F28568];
                                                                  v116 = v485;
                                                                  uint64_t v260 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"anchorVol"];
                                                                  v664 = v260;
                                                                  uint64_t v261 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v664 forKeys:&v663 count:1];
                                                                  uint64_t v262 = v258;
                                                                  uint64_t v24 = v563;
                                                                  v452 = (void *)v261;
                                                                  id v454 = 0;
                                                                  uint64_t v49 = 0;
                                                                  id *v110 = (id)objc_msgSend(v262, "initWithDomain:code:userInfo:", v259, 2);
                                                                  goto LABEL_365;
                                                                }
                                                                id v454 = v158;
                                                              }
                                                              else
                                                              {
                                                                id v454 = 0;
                                                              }
                                                              uint64_t v159 = [v24 objectForKeyedSubscript:@"anchorEnv"];
                                                              v452 = (void *)v159;
                                                              if (!v159
                                                                || (id v160 = (void *)v159,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                id v448 = 0;
LABEL_194:
                                                                uint64_t v161 = [v24 objectForKeyedSubscript:@"personalizationCoeff"];
                                                                v449 = (void *)v161;
                                                                if (v161
                                                                  && (id v162 = (void *)v161,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                                {
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                  {
                                                                    if (v110)
                                                                    {
                                                                      v565 = v24;
                                                                      id v268 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                      uint64_t v269 = *MEMORY[0x1E4F502C8];
                                                                      uint64_t v659 = *MEMORY[0x1E4F28568];
                                                                      v116 = v485;
                                                                      v270 = v506;
                                                                      id v445 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"personalizationCoeff"];
                                                                      id v660 = v445;
                                                                      uint64_t v271 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v660 forKeys:&v659 count:1];
                                                                      v272 = v268;
                                                                      uint64_t v24 = v565;
                                                                      v447 = (void *)v271;
                                                                      id v446 = 0;
                                                                      uint64_t v49 = 0;
                                                                      id *v110 = (id)objc_msgSend(v272, "initWithDomain:code:userInfo:", v269, 2);
                                                                      uint64_t v63 = v574;
                                                                      id v193 = v513;
                                                                      v110 = (id *)v481;
                                                                      goto LABEL_558;
                                                                    }
                                                                    v265 = 0;
                                                                    uint64_t v49 = 0;
                                                                    uint64_t v63 = v574;
                                                                    id v193 = v513;
                                                                    v110 = (id *)v481;
                                                                    goto LABEL_559;
                                                                  }
                                                                  id v446 = v162;
                                                                }
                                                                else
                                                                {
                                                                  id v446 = 0;
                                                                }
                                                                uint64_t v163 = [v24 objectForKeyedSubscript:@"unsignedPredVolMediaPrct"];
                                                                v447 = (void *)v163;
                                                                if (v163
                                                                  && (id v164 = (void *)v163,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                                {
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                  {
                                                                    if (v110)
                                                                    {
                                                                      v566 = v24;
                                                                      id v273 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                      uint64_t v274 = *MEMORY[0x1E4F502C8];
                                                                      uint64_t v657 = *MEMORY[0x1E4F28568];
                                                                      v116 = v485;
                                                                      v270 = v506;
                                                                      id v443 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"unsignedPredVolMediaPrct"];
                                                                      id v658 = v443;
                                                                      uint64_t v275 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v658 forKeys:&v657 count:1];
                                                                      v276 = v273;
                                                                      uint64_t v24 = v566;
                                                                      v442 = (void *)v275;
                                                                      id v445 = 0;
                                                                      uint64_t v49 = 0;
                                                                      id *v110 = (id)objc_msgSend(v276, "initWithDomain:code:userInfo:", v274, 2);
                                                                      uint64_t v63 = v574;
                                                                      id v193 = v513;
                                                                      v110 = (id *)v481;
                                                                      goto LABEL_557;
                                                                    }
                                                                    id v445 = 0;
                                                                    uint64_t v49 = 0;
                                                                    uint64_t v63 = v574;
                                                                    id v193 = v513;
                                                                    v110 = (id *)v481;
                                                                    v270 = v506;
                                                                    goto LABEL_558;
                                                                  }
                                                                  id v445 = v164;
                                                                }
                                                                else
                                                                {
                                                                  id v445 = 0;
                                                                }
                                                                uint64_t v165 = [v24 objectForKeyedSubscript:@"unsignedPredVolTelephonyPrct"];
                                                                v442 = (void *)v165;
                                                                if (v165
                                                                  && (id v166 = (void *)v165,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                                {
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                  {
                                                                    if (v110)
                                                                    {
                                                                      v567 = v24;
                                                                      id v286 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                      uint64_t v287 = *MEMORY[0x1E4F502C8];
                                                                      uint64_t v655 = *MEMORY[0x1E4F28568];
                                                                      v116 = v485;
                                                                      v270 = v506;
                                                                      id v440 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"unsignedPredVolTelephonyPrct"];
                                                                      id v656 = v440;
                                                                      uint64_t v288 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v656 forKeys:&v655 count:1];
                                                                      v289 = v286;
                                                                      uint64_t v24 = v567;
                                                                      v441 = (void *)v288;
                                                                      id v443 = 0;
                                                                      uint64_t v49 = 0;
                                                                      id *v110 = (id)objc_msgSend(v289, "initWithDomain:code:userInfo:", v287, 2);
                                                                      uint64_t v63 = v574;
                                                                      id v193 = v513;
                                                                      v110 = (id *)v481;
                                                                      goto LABEL_556;
                                                                    }
                                                                    id v443 = 0;
                                                                    uint64_t v49 = 0;
                                                                    uint64_t v63 = v574;
                                                                    id v193 = v513;
                                                                    v110 = (id *)v481;
                                                                    v270 = v506;
                                                                    goto LABEL_557;
                                                                  }
                                                                  id v443 = v166;
                                                                }
                                                                else
                                                                {
                                                                  id v443 = 0;
                                                                }
                                                                uint64_t v167 = [v24 objectForKeyedSubscript:@"unsignedPredVolSiriPrct"];
                                                                v441 = (void *)v167;
                                                                if (v167
                                                                  && (id v168 = (void *)v167,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                                {
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                  {
                                                                    if (v110)
                                                                    {
                                                                      v568 = v24;
                                                                      id v290 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                      uint64_t v291 = *MEMORY[0x1E4F502C8];
                                                                      uint64_t v653 = *MEMORY[0x1E4F28568];
                                                                      v116 = v485;
                                                                      v270 = v506;
                                                                      id v439 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"unsignedPredVolSiriPrct"];
                                                                      id v654 = v439;
                                                                      uint64_t v292 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v654 forKeys:&v653 count:1];
                                                                      v293 = v290;
                                                                      uint64_t v24 = v568;
                                                                      v438 = (void *)v292;
                                                                      id v440 = 0;
                                                                      uint64_t v49 = 0;
                                                                      id *v110 = (id)objc_msgSend(v293, "initWithDomain:code:userInfo:", v291, 2);
                                                                      uint64_t v63 = v574;
                                                                      id v193 = v513;
                                                                      v110 = (id *)v481;
                                                                      goto LABEL_555;
                                                                    }
                                                                    id v440 = 0;
                                                                    uint64_t v49 = 0;
                                                                    uint64_t v63 = v574;
                                                                    id v193 = v513;
                                                                    v110 = (id *)v481;
                                                                    v270 = v506;
                                                                    goto LABEL_556;
                                                                  }
                                                                  id v440 = v168;
                                                                }
                                                                else
                                                                {
                                                                  id v440 = 0;
                                                                }
                                                                uint64_t v169 = [v24 objectForKeyedSubscript:@"singleBudFlag"];
                                                                v438 = (void *)v169;
                                                                if (v169
                                                                  && (id v170 = (void *)v169,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) == 0))
                                                                {
                                                                  objc_opt_class();
                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                  {
                                                                    id v294 = v10;
                                                                    if (!v110)
                                                                    {
                                                                      id v439 = 0;
                                                                      uint64_t v49 = 0;
                                                                      uint64_t v63 = v574;
                                                                      v116 = v485;
                                                                      id v193 = v513;
                                                                      v110 = (id *)v481;
                                                                      v270 = v506;
                                                                      goto LABEL_555;
                                                                    }
                                                                    id v295 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                    uint64_t v296 = *MEMORY[0x1E4F502C8];
                                                                    uint64_t v651 = *MEMORY[0x1E4F28568];
                                                                    id v436 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"singleBudFlag"];
                                                                    id v652 = v436;
                                                                    v437 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v652 forKeys:&v651 count:1];
                                                                    id v439 = 0;
                                                                    uint64_t v49 = 0;
                                                                    id *v110 = (id)objc_msgSend(v295, "initWithDomain:code:userInfo:", v296, 2);
                                                                    goto LABEL_391;
                                                                  }
                                                                  id v439 = v170;
                                                                }
                                                                else
                                                                {
                                                                  id v439 = 0;
                                                                }
                                                                uint64_t v171 = [v24 objectForKeyedSubscript:@"cdEngagementFlag"];
                                                                v437 = (void *)v171;
                                                                if (!v171
                                                                  || (id v172 = (void *)v171,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  id v436 = 0;
                                                                  goto LABEL_212;
                                                                }
                                                                objc_opt_class();
                                                                if (objc_opt_isKindOfClass())
                                                                {
                                                                  id v436 = v172;
LABEL_212:
                                                                  uint64_t v173 = [v24 objectForKeyedSubscript:@"activeStreamFlag"];
                                                                  v434 = (void *)v173;
                                                                  if (!v173
                                                                    || (id v174 = (void *)v173,
                                                                        objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    id v435 = 0;
                                                                    goto LABEL_215;
                                                                  }
                                                                  objc_opt_class();
                                                                  if (objc_opt_isKindOfClass())
                                                                  {
                                                                    id v435 = v174;
LABEL_215:
                                                                    uint64_t v175 = [v24 objectForKeyedSubscript:@"pvFeatureEnableFlag"];
                                                                    id v529 = v10;
                                                                    v433 = (void *)v175;
                                                                    if (!v175
                                                                      || (id v176 = (void *)v175,
                                                                          objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      id v432 = 0;
                                                                      goto LABEL_218;
                                                                    }
                                                                    objc_opt_class();
                                                                    if (objc_opt_isKindOfClass())
                                                                    {
                                                                      id v432 = v176;
LABEL_218:
                                                                      id v177 = [v24 objectForKeyedSubscript:@"envSpectralData32B"];
                                                                      id v178 = [MEMORY[0x1E4F1CA98] null];
                                                                      int v179 = [v177 isEqual:v178];

                                                                      if (v179)
                                                                      {

                                                                        id v177 = 0;
                                                                      }
                                                                      else if (v177)
                                                                      {
                                                                        objc_opt_class();
                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                        {
                                                                          id obj = v177;
                                                                          if (!v110)
                                                                          {
                                                                            uint64_t v49 = 0;
                                                                            id v10 = v529;
                                                                            uint64_t v63 = v574;
                                                                            v116 = v485;
                                                                            id v193 = v513;
                                                                            v110 = (id *)v481;
                                                                            v270 = v506;
                                                                            goto LABEL_551;
                                                                          }
                                                                          v312 = v110;
                                                                          id v313 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                          uint64_t v314 = *MEMORY[0x1E4F502C8];
                                                                          uint64_t v643 = *MEMORY[0x1E4F28568];
                                                                          v450 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"envSpectralData32B"];
                                                                          v644 = v450;
                                                                          uint64_t v315 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v644 forKeys:&v643 count:1];
                                                                          id v316 = (id)[v313 initWithDomain:v314 code:2 userInfo:v315];
                                                                          uint64_t v49 = 0;
                                                                          id *v312 = v316;
                                                                          v308 = (void *)v315;
                                                                          goto LABEL_383;
                                                                        }
                                                                      }
                                                                      v450 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v177, "count"));
                                                                      long long v585 = 0u;
                                                                      long long v586 = 0u;
                                                                      long long v587 = 0u;
                                                                      long long v588 = 0u;
                                                                      id v277 = v177;
                                                                      uint64_t v278 = [v277 countByEnumeratingWithState:&v585 objects:v642 count:16];
                                                                      id obj = v277;
                                                                      if (!v278) {
                                                                        goto LABEL_348;
                                                                      }
                                                                      uint64_t v279 = v278;
                                                                      uint64_t v280 = *(void *)v586;
                                                                      while (1)
                                                                      {
                                                                        for (uint64_t i = 0; i != v279; ++i)
                                                                        {
                                                                          if (*(void *)v586 != v280) {
                                                                            objc_enumerationMutation(obj);
                                                                          }
                                                                          v282 = *(void **)(*((void *)&v585 + 1)
                                                                                          + 8 * i);
                                                                          objc_opt_class();
                                                                          if (objc_opt_isKindOfClass())
                                                                          {
                                                                            if (v110)
                                                                            {
                                                                              id v297 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                              uint64_t v298 = *MEMORY[0x1E4F502C8];
                                                                              uint64_t v640 = *MEMORY[0x1E4F28568];
                                                                              id v431 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"envSpectralData32B"];
                                                                              id v641 = v431;
                                                                              v299 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v641 forKeys:&v640 count:1];
                                                                              v300 = v297;
                                                                              uint64_t v301 = v298;
LABEL_372:
                                                                              uint64_t v49 = 0;
                                                                              id *v110 = (id)[v300 initWithDomain:v301 code:2 userInfo:v299];
                                                                              id v430 = obj;
                                                                              id v10 = v529;
                                                                              uint64_t v63 = v574;
                                                                              v116 = v485;
                                                                              id v193 = v513;
                                                                              v110 = (id *)v481;
                                                                              v270 = v506;
                                                                              goto LABEL_547;
                                                                            }
LABEL_376:
                                                                            uint64_t v49 = 0;
                                                                            v308 = obj;
LABEL_383:
                                                                            id v10 = v529;
                                                                            uint64_t v63 = v574;
                                                                            v116 = v485;
                                                                            id v193 = v513;
                                                                            v110 = (id *)v481;
                                                                            v270 = v506;
                                                                            goto LABEL_549;
                                                                          }
                                                                          objc_opt_class();
                                                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                          {
                                                                            if (v110)
                                                                            {
                                                                              id v304 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                              uint64_t v305 = *MEMORY[0x1E4F502C8];
                                                                              uint64_t v638 = *MEMORY[0x1E4F28568];
                                                                              id v431 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"envSpectralData32B"];
                                                                              id v639 = v431;
                                                                              v299 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v639 forKeys:&v638 count:1];
                                                                              v300 = v304;
                                                                              uint64_t v301 = v305;
                                                                              goto LABEL_372;
                                                                            }
                                                                            goto LABEL_376;
                                                                          }
                                                                          id v283 = v282;
                                                                          [v450 addObject:v283];
                                                                        }
                                                                        id v277 = obj;
                                                                        uint64_t v279 = [obj countByEnumeratingWithState:&v585 objects:v642 count:16];
                                                                        if (!v279)
                                                                        {
LABEL_348:

                                                                          v284 = [v24 objectForKeyedSubscript:@"windStrength"];
                                                                          v482 = v109;
                                                                          if (v284)
                                                                          {
                                                                            id v285 = v284;

                                                                            goto LABEL_386;
                                                                          }
                                                                          id v285 = [v24 objectForKeyedSubscript:@"wind_strength"];

                                                                          if (v285)
                                                                          {
LABEL_386:
                                                                            v317 = v110;
                                                                            objc_opt_class();
                                                                            id v431 = v285;
                                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                            {
                                                                              objc_opt_class();
                                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                              {
                                                                                if (v110)
                                                                                {
                                                                                  id v318 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                  uint64_t v319 = *MEMORY[0x1E4F502C8];
                                                                                  uint64_t v636 = *MEMORY[0x1E4F28568];
                                                                                  uint64_t v428 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"windStrength"];
                                                                                  uint64_t v637 = v428;
                                                                                  v320 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v637 forKeys:&v636 count:1];
                                                                                  id v430 = 0;
                                                                                  uint64_t v49 = 0;
                                                                                  id *v110 = (id)[v318 initWithDomain:v319 code:2 userInfo:v320];
                                                                                  goto LABEL_546;
                                                                                }
                                                                                id v430 = 0;
                                                                                uint64_t v49 = 0;
                                                                                id v10 = v529;
                                                                                uint64_t v63 = v574;
                                                                                v270 = v506;
                                                                                v116 = v485;
                                                                                id v193 = v513;
                                                                                v110 = (id *)v481;
                                                                                goto LABEL_548;
                                                                              }
                                                                              id v431 = v285;
                                                                              id v430 = v431;
LABEL_401:
                                                                              v321 = [v24 objectForKeyedSubscript:@"windProb"];
                                                                              v569 = v24;
                                                                              if (v321)
                                                                              {
                                                                                id v322 = v321;

                                                                                goto LABEL_404;
                                                                              }
                                                                              id v322 = [v24 objectForKeyedSubscript:@"wind_prob"];

                                                                              if (v322)
                                                                              {
LABEL_404:
                                                                                objc_opt_class();
                                                                                id v429 = v322;
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  objc_opt_class();
                                                                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                  {
                                                                                    if (v317)
                                                                                    {
                                                                                      id v323 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                      uint64_t v324 = *MEMORY[0x1E4F502C8];
                                                                                      uint64_t v634 = *MEMORY[0x1E4F28568];
                                                                                      v325 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"windProb"];
                                                                                      v635 = v325;
                                                                                      v326 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v635 forKeys:&v634 count:1];
                                                                                      uint64_t v428 = 0;
                                                                                      uint64_t v49 = 0;
                                                                                      id *v317 = (id)[v323 initWithDomain:v324 code:2 userInfo:v326];
                                                                                      goto LABEL_544;
                                                                                    }
                                                                                    uint64_t v428 = 0;
                                                                                    uint64_t v49 = 0;
                                                                                    goto LABEL_545;
                                                                                  }
                                                                                  id v429 = v322;
                                                                                  uint64_t v428 = (uint64_t)v429;
                                                                                  goto LABEL_411;
                                                                                }
                                                                              }
                                                                              else
                                                                              {
                                                                                id v429 = 0;
                                                                              }
                                                                              uint64_t v428 = 0;
LABEL_411:
                                                                              v326 = [v569 objectForKeyedSubscript:@"mediaType"];
                                                                              if (v326
                                                                                && (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (v317)
                                                                                  {
                                                                                    id v330 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                    uint64_t v331 = *MEMORY[0x1E4F502C8];
                                                                                    uint64_t v632 = *MEMORY[0x1E4F28568];
                                                                                    id v423 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"mediaType"];
                                                                                    id v633 = v423;
                                                                                    v426 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v633 forKeys:&v632 count:1];
                                                                                    id v424 = 0;
                                                                                    uint64_t v49 = 0;
                                                                                    id *v317 = (id)objc_msgSend(v330, "initWithDomain:code:userInfo:", v331, 2);
                                                                                    goto LABEL_543;
                                                                                  }
                                                                                  v325 = 0;
                                                                                  uint64_t v49 = 0;
                                                                                  goto LABEL_544;
                                                                                }
                                                                                id v424 = v326;
                                                                              }
                                                                              else
                                                                              {
                                                                                id v424 = 0;
                                                                              }
                                                                              v426 = [v569 objectForKeyedSubscript:@"sourceActivity"];
                                                                              if (v426
                                                                                && (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (v317)
                                                                                  {
                                                                                    id v343 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                    uint64_t v344 = *MEMORY[0x1E4F502C8];
                                                                                    uint64_t v630 = *MEMORY[0x1E4F28568];
                                                                                    id v421 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"sourceActivity"];
                                                                                    id v631 = v421;
                                                                                    v427 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v631 forKeys:&v630 count:1];
                                                                                    id v423 = 0;
                                                                                    uint64_t v49 = 0;
                                                                                    id *v317 = (id)objc_msgSend(v343, "initWithDomain:code:userInfo:", v344, 2);
                                                                                    goto LABEL_542;
                                                                                  }
                                                                                  id v423 = 0;
                                                                                  uint64_t v49 = 0;
                                                                                  goto LABEL_543;
                                                                                }
                                                                                id v423 = v426;
                                                                              }
                                                                              else
                                                                              {
                                                                                id v423 = 0;
                                                                              }
                                                                              v427 = [v569 objectForKeyedSubscript:@"budActivity"];
                                                                              if (v427
                                                                                && (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (v317)
                                                                                  {
                                                                                    id v345 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                    uint64_t v346 = *MEMORY[0x1E4F502C8];
                                                                                    uint64_t v628 = *MEMORY[0x1E4F28568];
                                                                                    id v419 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"budActivity"];
                                                                                    id v629 = v419;
                                                                                    v425 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v629 forKeys:&v628 count:1];
                                                                                    id v421 = 0;
                                                                                    uint64_t v49 = 0;
                                                                                    id *v317 = (id)objc_msgSend(v345, "initWithDomain:code:userInfo:", v346, 2);
                                                                                    goto LABEL_541;
                                                                                  }
                                                                                  id v421 = 0;
                                                                                  uint64_t v49 = 0;
                                                                                  goto LABEL_542;
                                                                                }
                                                                                id v421 = v427;
                                                                              }
                                                                              else
                                                                              {
                                                                                id v421 = 0;
                                                                              }
                                                                              v425 = [v569 objectForKeyedSubscript:@"location"];
                                                                              if (v425
                                                                                && (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (v317)
                                                                                  {
                                                                                    id v347 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                    uint64_t v348 = *MEMORY[0x1E4F502C8];
                                                                                    uint64_t v626 = *MEMORY[0x1E4F28568];
                                                                                    id v417 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"location"];
                                                                                    id v627 = v417;
                                                                                    v422 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v627 forKeys:&v626 count:1];
                                                                                    id v419 = 0;
                                                                                    uint64_t v49 = 0;
                                                                                    id *v317 = (id)objc_msgSend(v347, "initWithDomain:code:userInfo:", v348, 2);
                                                                                    goto LABEL_540;
                                                                                  }
                                                                                  id v419 = 0;
                                                                                  uint64_t v49 = 0;
                                                                                  goto LABEL_541;
                                                                                }
                                                                                id v419 = v425;
                                                                              }
                                                                              else
                                                                              {
                                                                                id v419 = 0;
                                                                              }
                                                                              v422 = [v569 objectForKeyedSubscript:@"locationType"];
                                                                              if (v422
                                                                                && (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (v317)
                                                                                  {
                                                                                    id v354 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                    uint64_t v355 = *MEMORY[0x1E4F502C8];
                                                                                    uint64_t v624 = *MEMORY[0x1E4F28568];
                                                                                    id v416 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"locationType"];
                                                                                    id v625 = v416;
                                                                                    v420 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v625 forKeys:&v624 count:1];
                                                                                    id v417 = 0;
                                                                                    uint64_t v49 = 0;
                                                                                    id *v317 = (id)objc_msgSend(v354, "initWithDomain:code:userInfo:", v355, 2);
                                                                                    goto LABEL_539;
                                                                                  }
                                                                                  id v417 = 0;
                                                                                  uint64_t v49 = 0;
                                                                                  goto LABEL_540;
                                                                                }
                                                                                id v417 = v422;
                                                                              }
                                                                              else
                                                                              {
                                                                                id v417 = 0;
                                                                              }
                                                                              v420 = [v569 objectForKeyedSubscript:@"focusMode"];
                                                                              if (v420
                                                                                && (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (v317)
                                                                                  {
                                                                                    id v358 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                    uint64_t v359 = *MEMORY[0x1E4F502C8];
                                                                                    uint64_t v622 = *MEMORY[0x1E4F28568];
                                                                                    id v415 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"focusMode"];
                                                                                    id v623 = v415;
                                                                                    v418 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v623 forKeys:&v622 count:1];
                                                                                    id v416 = 0;
                                                                                    uint64_t v49 = 0;
                                                                                    id *v317 = (id)objc_msgSend(v358, "initWithDomain:code:userInfo:", v359, 2);
                                                                                    goto LABEL_538;
                                                                                  }
                                                                                  id v416 = 0;
                                                                                  uint64_t v49 = 0;
                                                                                  goto LABEL_539;
                                                                                }
                                                                                id v416 = v420;
                                                                              }
                                                                              else
                                                                              {
                                                                                id v416 = 0;
                                                                              }
                                                                              v418 = [v569 objectForKeyedSubscript:@"streamingAppBundleId"];
                                                                              if (v418
                                                                                && (objc_opt_class(),
                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (v317)
                                                                                  {
                                                                                    id v360 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                    uint64_t v361 = *MEMORY[0x1E4F502C8];
                                                                                    uint64_t v620 = *MEMORY[0x1E4F28568];
                                                                                    id v329 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"streamingAppBundleId"];
                                                                                    id v621 = v329;
                                                                                    v332 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v621 forKeys:&v620 count:1];
                                                                                    id v415 = 0;
                                                                                    uint64_t v49 = 0;
                                                                                    id *v317 = (id)objc_msgSend(v360, "initWithDomain:code:userInfo:", v361, 2);
                                                                                    goto LABEL_536;
                                                                                  }
                                                                                  id v415 = 0;
                                                                                  uint64_t v49 = 0;
                                                                                  goto LABEL_538;
                                                                                }
                                                                                id v415 = v418;
                                                                              }
                                                                              else
                                                                              {
                                                                                id v415 = 0;
                                                                              }
                                                                              v327 = [v569 objectForKeyedSubscript:@"noiseType4B"];
                                                                              v328 = [MEMORY[0x1E4F1CA98] null];
                                                                              id v329 = v327;
                                                                              LODWORD(v327) = [v327 isEqual:v328];

                                                                              if (v327)
                                                                              {

                                                                                id v329 = 0;
                                                                              }
                                                                              else if (v329)
                                                                              {
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (v317)
                                                                                  {
                                                                                    id v362 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                    uint64_t v363 = *MEMORY[0x1E4F502C8];
                                                                                    uint64_t v618 = *MEMORY[0x1E4F28568];
                                                                                    v332 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"noiseType4B"];
                                                                                    v619 = v332;
                                                                                    id v414 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v619 forKeys:&v618 count:1];
                                                                                    id v364 = (id)objc_msgSend(v362, "initWithDomain:code:userInfo:", v363, 2);
                                                                                    uint64_t v49 = 0;
                                                                                    id *v317 = v364;
                                                                                    goto LABEL_535;
                                                                                  }
                                                                                  uint64_t v49 = 0;
                                                                                  goto LABEL_537;
                                                                                }
                                                                              }
                                                                              v332 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v329, "count"));
                                                                              long long v581 = 0u;
                                                                              long long v582 = 0u;
                                                                              long long v583 = 0u;
                                                                              long long v584 = 0u;
                                                                              id v329 = v329;
                                                                              uint64_t v333 = [v329 countByEnumeratingWithState:&v581 objects:v617 count:16];
                                                                              if (!v333) {
                                                                                goto LABEL_457;
                                                                              }
                                                                              uint64_t v334 = v333;
                                                                              uint64_t v335 = *(void *)v582;
LABEL_450:
                                                                              uint64_t v336 = 0;
                                                                              while (1)
                                                                              {
                                                                                if (*(void *)v582 != v335) {
                                                                                  objc_enumerationMutation(v329);
                                                                                }
                                                                                v337 = *(void **)(*((void *)&v581 + 1)
                                                                                                + 8 * v336);
                                                                                objc_opt_class();
                                                                                if (objc_opt_isKindOfClass()) {
                                                                                  break;
                                                                                }
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (v317)
                                                                                  {
                                                                                    id v356 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                    uint64_t v357 = *MEMORY[0x1E4F502C8];
                                                                                    uint64_t v613 = *MEMORY[0x1E4F28568];
                                                                                    v413 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"noiseType4B"];
                                                                                    v614 = v413;
                                                                                    uint64_t v351 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v614 forKeys:&v613 count:1];
                                                                                    v352 = v356;
                                                                                    uint64_t v353 = v357;
                                                                                    goto LABEL_523;
                                                                                  }
                                                                                  goto LABEL_528;
                                                                                }
                                                                                id v338 = v337;
                                                                                [v332 addObject:v338];

                                                                                if (v334 == ++v336)
                                                                                {
                                                                                  uint64_t v334 = [v329 countByEnumeratingWithState:&v581 objects:v617 count:16];
                                                                                  if (v334) {
                                                                                    goto LABEL_450;
                                                                                  }
LABEL_457:

                                                                                  v413 = [v569 objectForKeyedSubscript:@"instdBA"];
                                                                                  if (v413
                                                                                    && (objc_opt_class(),
                                                                                        (objc_opt_isKindOfClass() & 1) == 0))
                                                                                  {
                                                                                    objc_opt_class();
                                                                                    if (objc_opt_isKindOfClass())
                                                                                    {
                                                                                      id v414 = v413;
                                                                                      goto LABEL_460;
                                                                                    }
                                                                                    if (v317)
                                                                                    {
                                                                                      id v366 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                      uint64_t v367 = *MEMORY[0x1E4F502C8];
                                                                                      uint64_t v611 = *MEMORY[0x1E4F28568];
                                                                                      id v412 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"instdBA"];
                                                                                      id v612 = v412;
                                                                                      v411 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v612 forKeys:&v611 count:1];
                                                                                      uint64_t v49 = 0;
                                                                                      id v414 = 0;
                                                                                      id *v317 = (id)objc_msgSend(v366, "initWithDomain:code:userInfo:", v367, 2);
                                                                                      goto LABEL_504;
                                                                                    }
                                                                                    id v414 = 0;
                                                                                    uint64_t v49 = 0;
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    id v414 = 0;
LABEL_460:
                                                                                    v411 = [v569 objectForKeyedSubscript:@"instdBC"];
                                                                                    if (v411
                                                                                      && (objc_opt_class(),
                                                                                          (objc_opt_isKindOfClass() & 1) == 0))
                                                                                    {
                                                                                      objc_opt_class();
                                                                                      if (objc_opt_isKindOfClass())
                                                                                      {
                                                                                        id v412 = v411;
                                                                                        goto LABEL_463;
                                                                                      }
                                                                                      if (v317)
                                                                                      {
                                                                                        id v368 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                        uint64_t v369 = *MEMORY[0x1E4F502C8];
                                                                                        uint64_t v609 = *MEMORY[0x1E4F28568];
                                                                                        id v407 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"instdBC"];
                                                                                        id v610 = v407;
                                                                                        v410 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v610 forKeys:&v609 count:1];
                                                                                        uint64_t v49 = 0;
                                                                                        id v412 = 0;
                                                                                        id *v317 = (id)objc_msgSend(v368, "initWithDomain:code:userInfo:", v369, 2);
                                                                                        goto LABEL_503;
                                                                                      }
                                                                                      id v412 = 0;
                                                                                      uint64_t v49 = 0;
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      id v412 = 0;
LABEL_463:
                                                                                      v410 = [v569 objectForKeyedSubscript:@"nonCAListeningMode"];
                                                                                      if (v410
                                                                                        && (objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) == 0))
                                                                                      {
                                                                                        objc_opt_class();
                                                                                        if (objc_opt_isKindOfClass())
                                                                                        {
                                                                                          id v407 = v410;
                                                                                          goto LABEL_466;
                                                                                        }
                                                                                        if (v317)
                                                                                        {
                                                                                          id v370 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                          uint64_t v371 = *MEMORY[0x1E4F502C8];
                                                                                          uint64_t v607 = *MEMORY[0x1E4F28568];
                                                                                          id v406 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"nonCAListeningMode"];
                                                                                          id v608 = v406;
                                                                                          v409 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v608 forKeys:&v607 count:1];
                                                                                          uint64_t v49 = 0;
                                                                                          id v407 = 0;
                                                                                          id *v317 = (id)objc_msgSend(v370, "initWithDomain:code:userInfo:", v371, 2);
                                                                                          goto LABEL_502;
                                                                                        }
                                                                                        id v407 = 0;
                                                                                        uint64_t v49 = 0;
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        id v407 = 0;
LABEL_466:
                                                                                        v409 = [v569 objectForKeyedSubscript:@"fit"];
                                                                                        if (v409
                                                                                          && (objc_opt_class(),
                                                                                              (objc_opt_isKindOfClass() & 1) == 0))
                                                                                        {
                                                                                          objc_opt_class();
                                                                                          if (objc_opt_isKindOfClass())
                                                                                          {
                                                                                            id v406 = v409;
                                                                                            goto LABEL_469;
                                                                                          }
                                                                                          if (v317)
                                                                                          {
                                                                                            id v372 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                            uint64_t v373 = *MEMORY[0x1E4F502C8];
                                                                                            uint64_t v605 = *MEMORY[0x1E4F28568];
                                                                                            id v404 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"fit"];
                                                                                            id v606 = v404;
                                                                                            v408 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v606 forKeys:&v605 count:1];
                                                                                            uint64_t v49 = 0;
                                                                                            id v406 = 0;
                                                                                            id *v317 = (id)objc_msgSend(v372, "initWithDomain:code:userInfo:", v373, 2);
                                                                                            goto LABEL_501;
                                                                                          }
                                                                                          id v406 = 0;
                                                                                          uint64_t v49 = 0;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          id v406 = 0;
LABEL_469:
                                                                                          v408 = [v569 objectForKeyedSubscript:@"fixedAutoAncGain"];
                                                                                          if (v408
                                                                                            && (objc_opt_class(),
                                                                                                (objc_opt_isKindOfClass() & 1) == 0))
                                                                                          {
                                                                                            objc_opt_class();
                                                                                            if (objc_opt_isKindOfClass())
                                                                                            {
                                                                                              id v404 = v408;
                                                                                              goto LABEL_472;
                                                                                            }
                                                                                            if (v317)
                                                                                            {
                                                                                              id v374 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                              uint64_t v375 = *MEMORY[0x1E4F502C8];
                                                                                              uint64_t v603 = *MEMORY[0x1E4F28568];
                                                                                              id v402 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"fixedAutoAncGain"];
                                                                                              id v604 = v402;
                                                                                              v405 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v604 forKeys:&v603 count:1];
                                                                                              uint64_t v49 = 0;
                                                                                              id v404 = 0;
                                                                                              id *v317 = (id)objc_msgSend(v374, "initWithDomain:code:userInfo:", v375, 2);
                                                                                              goto LABEL_500;
                                                                                            }
                                                                                            id v404 = 0;
                                                                                            uint64_t v49 = 0;
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            id v404 = 0;
LABEL_472:
                                                                                            v405 = [v569 objectForKeyedSubscript:@"adjustedAutoAncGain"];
                                                                                            if (v405
                                                                                              && (objc_opt_class(),
                                                                                                  (objc_opt_isKindOfClass() & 1) == 0))
                                                                                            {
                                                                                              objc_opt_class();
                                                                                              if (objc_opt_isKindOfClass())
                                                                                              {
                                                                                                id v402 = v405;
                                                                                                goto LABEL_475;
                                                                                              }
                                                                                              if (v317)
                                                                                              {
                                                                                                id v376 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                uint64_t v377 = *MEMORY[0x1E4F502C8];
                                                                                                uint64_t v601 = *MEMORY[0x1E4F28568];
                                                                                                id v400 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"adjustedAutoAncGain"];
                                                                                                id v602 = v400;
                                                                                                v403 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v602 forKeys:&v601 count:1];
                                                                                                uint64_t v49 = 0;
                                                                                                id v402 = 0;
                                                                                                id *v317 = (id)objc_msgSend(v376, "initWithDomain:code:userInfo:", v377, 2);
                                                                                                goto LABEL_499;
                                                                                              }
                                                                                              id v402 = 0;
                                                                                              uint64_t v49 = 0;
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              id v402 = 0;
LABEL_475:
                                                                                              v403 = [v569 objectForKeyedSubscript:@"timestamp"];
                                                                                              if (v403
                                                                                                && (objc_opt_class(),
                                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                                              {
                                                                                                objc_opt_class();
                                                                                                if (objc_opt_isKindOfClass())
                                                                                                {
                                                                                                  id v400 = v403;
                                                                                                  goto LABEL_478;
                                                                                                }
                                                                                                if (v317)
                                                                                                {
                                                                                                  id v378 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                  uint64_t v379 = *MEMORY[0x1E4F502C8];
                                                                                                  uint64_t v599 = *MEMORY[0x1E4F28568];
                                                                                                  id v399 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"timestamp"];
                                                                                                  id v600 = v399;
                                                                                                  v401 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v600 forKeys:&v599 count:1];
                                                                                                  uint64_t v49 = 0;
                                                                                                  id v400 = 0;
                                                                                                  id *v317 = (id)objc_msgSend(v378, "initWithDomain:code:userInfo:", v379, 2);
                                                                                                  goto LABEL_498;
                                                                                                }
                                                                                                id v400 = 0;
                                                                                                uint64_t v49 = 0;
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                id v400 = 0;
LABEL_478:
                                                                                                v401 = [v569 objectForKeyedSubscript:@"DRCenablementBit"];
                                                                                                if (v401 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                {
                                                                                                  objc_opt_class();
                                                                                                  if (objc_opt_isKindOfClass())
                                                                                                  {
                                                                                                    id v399 = v401;
                                                                                                    goto LABEL_481;
                                                                                                  }
                                                                                                  if (v317)
                                                                                                  {
                                                                                                    id v380 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                    uint64_t v381 = *MEMORY[0x1E4F502C8];
                                                                                                    uint64_t v597 = *MEMORY[0x1E4F28568];
                                                                                                    id v397 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"DRCenablementBit"];
                                                                                                    id v598 = v397;
                                                                                                    v339 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v598 forKeys:&v597 count:1];
                                                                                                    uint64_t v49 = 0;
                                                                                                    id v399 = 0;
                                                                                                    id *v317 = (id)[v380 initWithDomain:v381 code:2 userInfo:v339];
                                                                                                    goto LABEL_497;
                                                                                                  }
                                                                                                  id v399 = 0;
                                                                                                  uint64_t v49 = 0;
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  id v399 = 0;
LABEL_481:
                                                                                                  v339 = [v569 objectForKeyedSubscript:@"DRCwindFlag"];
                                                                                                  if (v339 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                  {
                                                                                                    objc_opt_class();
                                                                                                    if (objc_opt_isKindOfClass())
                                                                                                    {
                                                                                                      id v397 = v339;
                                                                                                      goto LABEL_484;
                                                                                                    }
                                                                                                    if (v317)
                                                                                                    {
                                                                                                      id v382 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                      uint64_t v383 = *MEMORY[0x1E4F502C8];
                                                                                                      uint64_t v595 = *MEMORY[0x1E4F28568];
                                                                                                      id v395 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"DRCwindFlag"];
                                                                                                      id v596 = v395;
                                                                                                      v398 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v596 forKeys:&v595 count:1];
                                                                                                      uint64_t v49 = 0;
                                                                                                      id v397 = 0;
                                                                                                      id *v317 = (id)objc_msgSend(v382, "initWithDomain:code:userInfo:", v383, 2);
                                                                                                      goto LABEL_496;
                                                                                                    }
                                                                                                    id v397 = 0;
                                                                                                    uint64_t v49 = 0;
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    id v397 = 0;
LABEL_484:
                                                                                                    v398 = [v569 objectForKeyedSubscript:@"DRCappSelfVoiceFlag"];
                                                                                                    if (v398 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v395 = v398;
                                                                                                        goto LABEL_487;
                                                                                                      }
                                                                                                      if (v317)
                                                                                                      {
                                                                                                        id v384 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                        uint64_t v385 = *MEMORY[0x1E4F502C8];
                                                                                                        uint64_t v593 = *MEMORY[0x1E4F28568];
                                                                                                        id v340 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"DRCappSelfVoiceFlag"];
                                                                                                        id v594 = v340;
                                                                                                        v396 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v594 forKeys:&v593 count:1];
                                                                                                        uint64_t v49 = 0;
                                                                                                        id v395 = 0;
                                                                                                        id *v317 = (id)objc_msgSend(v384, "initWithDomain:code:userInfo:", v385, 2);
                                                                                                        goto LABEL_495;
                                                                                                      }
                                                                                                      id v395 = 0;
                                                                                                      uint64_t v49 = 0;
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v395 = 0;
LABEL_487:
                                                                                                      v396 = [v569 objectForKeyedSubscript:@"drumDRC"];
                                                                                                      if (v396 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if (objc_opt_isKindOfClass())
                                                                                                        {
                                                                                                          id v340 = v396;
                                                                                                          goto LABEL_490;
                                                                                                        }
                                                                                                        if (v317)
                                                                                                        {
                                                                                                          id v386 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                          uint64_t v387 = *MEMORY[0x1E4F502C8];
                                                                                                          uint64_t v591 = *MEMORY[0x1E4F28568];
                                                                                                          id v342 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"drumDRC"];
                                                                                                          id v592 = v342;
                                                                                                          uint64_t v388 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v592 forKeys:&v591 count:1];
                                                                                                          uint64_t v389 = v387;
                                                                                                          v341 = (void *)v388;
                                                                                                          uint64_t v49 = 0;
                                                                                                          id v340 = 0;
                                                                                                          id *v317 = (id)objc_msgSend(v386, "initWithDomain:code:userInfo:", v389, 2);
                                                                                                          goto LABEL_494;
                                                                                                        }
                                                                                                        id v340 = 0;
                                                                                                        uint64_t v49 = 0;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        id v340 = 0;
LABEL_490:
                                                                                                        v341 = [v569 objectForKeyedSubscript:@"routedDRCGain"];
                                                                                                        if (!v341 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                        {
                                                                                                          id v342 = 0;
                                                                                                          goto LABEL_493;
                                                                                                        }
                                                                                                        objc_opt_class();
                                                                                                        if (objc_opt_isKindOfClass())
                                                                                                        {
                                                                                                          id v342 = v341;
LABEL_493:
                                                                                                          uint64_t v49 = -[BMDeviceAdaptiveVolume initWithControllerVersion:refMicdBA:refMicdBC:drumdBA:drumdBK:drumdBAPredicted:downlinkdBA:currentVolumePrct:lastUserVolChangeType:headphoneMode:streamType:windSpeechAggressorFlag:volumeChangeFlag:speechPresenceProbability:personalizationParamSnr:personalizationParamMistakes:lastEMediadBA:lastVolMediaPrct:lastETelephonydBA:lastVolTelephonyPrct:lastESiridBA:lastVolSiriPrct:smoothEae:desiredDeltaE:predVolMediaPrct:predVolTelephonyPrct:predVolSiriPrct:onStartPredictionFlag:guardrailsAvoidFlag:minMaxCutFlag:manualVolumeChangeFlag:bigWindowSize:smallWindowSize:activeAppName:activeAirpodsSerialNumber:anchorVol:anchorEnv:personalizationCoeff:unsignedPredVolMediaPrct:unsignedPredVolTelephonyPrct:unsignedPredVolSiriPrct:singleBudFlag:cdEngagementFlag:activeStreamFlag:pvFeatureEnableFlag:envSpectralData32B:windStrength:windProb:mediaType:sourceActivity:budActivity:location:locationType:focusMode:streamingAppBundleId:noiseType4B:instdBA:instdBC:nonCAListeningMode:fit:fixedAutoAncGain:adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:routedDRCGain:](v502, "initWithControllerVersion:refMicdBA:refMicdBC:drumdBA:drumdBK:drumdBAPredicted:downlinkdBA:currentVolumePrct:lastUserVolChangeType:headphoneMode:streamType:windSpeechAggressorFlag:volumeChangeFlag:speechPresenceProbability:personalizationParamSnr:personalizationParamMistakes:lastEMediadBA:lastVolMediaPrct:lastETelephonydBA:lastVolTelephonyPrct:lastESiridBA:lastVolSiriPrct:smoothEae:desiredDeltaE:predVolMediaPrct:predVolTelephonyPrct:predVolSiriPrct:onStartPredictionFlag:guardrailsAvoidFlag:minMaxCutFlag:manualVolumeChangeFlag:bigWindowSize:smallWindowSize:activeAppName:activeAirpodsSerialNumber:anchorVol:anchorEnv:personalizationCoeff:unsignedPredVolMediaPrct:unsignedPredVolTelephonyPrct:unsignedPredVolSiriPrct:singleBudFlag:cdEngagementFlag:activeStreamFlag:pvFeatureEnableFlag:envSpectralData32B:windStrength:windProb:mediaType:sourceActivity:budActivity:location:locationType:focusMode:streamingAppBundleId:noiseType4B:instdBA:instdBC:nonCAListeningMode:fit:fixedAutoAncGain:adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:routedDRCGain:", v580, v529, v579, v534, v575, v532, v493, v490, v525, v523, v506, v507, v503, v499, v496, v494, v491, v489, v488, v487, v481, v483, v479, v477, v475, v473, v471, v469, v467, v465, v463, v461, v459, v458, v456, v454, v448, v446, v445, v443, v440, v439, v436, v435, v432, v450, v430, v428, v424, v423, v421, v419, v417, v416, v415, v332, v414, v412, v407, v406, v404);
                                                                                                          v502 = v49;
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          if (v317)
                                                                                                          {
                                                                                                            id v390 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                            uint64_t v394 = *MEMORY[0x1E4F502C8];
                                                                                                            uint64_t v589 = *MEMORY[0x1E4F28568];
                                                                                                            v391 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"routedDRCGain"];
                                                                                                            v590 = v391;
                                                                                                            v392 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v590 forKeys:&v589 count:1];
                                                                                                            id *v317 = (id)[v390 initWithDomain:v394 code:2 userInfo:v392];
                                                                                                          }
                                                                                                          id v342 = 0;
                                                                                                          uint64_t v49 = 0;
                                                                                                        }
LABEL_494:
                                                                                                      }
LABEL_495:
                                                                                                    }
LABEL_496:
                                                                                                  }
LABEL_497:
                                                                                                }
LABEL_498:
                                                                                              }
LABEL_499:
                                                                                            }
LABEL_500:
                                                                                          }
LABEL_501:
                                                                                        }
LABEL_502:
                                                                                      }
LABEL_503:
                                                                                    }
LABEL_504:

LABEL_524:
                                                                                  }

LABEL_535:
LABEL_536:

LABEL_537:
LABEL_538:

LABEL_539:
LABEL_540:

LABEL_541:
LABEL_542:

LABEL_543:
                                                                                  v325 = v424;
LABEL_544:

LABEL_545:
                                                                                  uint64_t v24 = v569;
                                                                                  v320 = v429;
LABEL_546:

                                                                                  id v10 = v529;
                                                                                  uint64_t v63 = v574;
                                                                                  v270 = v506;
                                                                                  v109 = v482;
                                                                                  v116 = v485;
                                                                                  id v193 = v513;
                                                                                  v110 = (id *)v481;
                                                                                  v299 = (void *)v428;
LABEL_547:

LABEL_548:
                                                                                  v308 = v430;
LABEL_549:

LABEL_551:
LABEL_552:

LABEL_553:
LABEL_554:

LABEL_555:
LABEL_556:

LABEL_557:
LABEL_558:
                                                                                  v506 = v270;

                                                                                  v265 = v446;
LABEL_559:
                                                                                  v117 = v572;
LABEL_560:

                                                                                  uint64_t v260 = v448;
LABEL_561:

LABEL_562:
                                                                                  uint64_t v257 = v453;
LABEL_563:

LABEL_564:
LABEL_565:
                                                                                  uint64_t v7 = v117;
LABEL_566:

                                                                                  goto LABEL_567;
                                                                                }
                                                                              }
                                                                              if (v317)
                                                                              {
                                                                                id v349 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                uint64_t v350 = *MEMORY[0x1E4F502C8];
                                                                                uint64_t v615 = *MEMORY[0x1E4F28568];
                                                                                v413 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"noiseType4B"];
                                                                                v616 = v413;
                                                                                uint64_t v351 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v616 forKeys:&v615 count:1];
                                                                                v352 = v349;
                                                                                uint64_t v353 = v350;
LABEL_523:
                                                                                id v412 = (id)v351;
                                                                                uint64_t v49 = 0;
                                                                                id *v317 = (id)objc_msgSend(v352, "initWithDomain:code:userInfo:", v353, 2);
                                                                                id v414 = v329;
                                                                                goto LABEL_524;
                                                                              }
LABEL_528:
                                                                              uint64_t v49 = 0;

                                                                              goto LABEL_536;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            v317 = v110;
                                                                            id v431 = 0;
                                                                          }
                                                                          id v430 = 0;
                                                                          goto LABEL_401;
                                                                        }
                                                                      }
                                                                    }
                                                                    if (v110)
                                                                    {
                                                                      id v309 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                      uint64_t v310 = *MEMORY[0x1E4F502C8];
                                                                      uint64_t v645 = *MEMORY[0x1E4F28568];
                                                                      id obj = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"pvFeatureEnableFlag"];
                                                                      id v646 = obj;
                                                                      v451 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v646 forKeys:&v645 count:1];
                                                                      id v311 = (id)objc_msgSend(v309, "initWithDomain:code:userInfo:", v310, 2);
                                                                      id v432 = 0;
                                                                      uint64_t v49 = 0;
                                                                      id *v110 = v311;
                                                                      uint64_t v63 = v574;
                                                                      v116 = v485;
                                                                      id v193 = v513;
                                                                      v110 = (id *)v481;
                                                                      v270 = v506;

                                                                      goto LABEL_551;
                                                                    }
                                                                    id v432 = 0;
                                                                    uint64_t v49 = 0;
LABEL_397:
                                                                    uint64_t v63 = v574;
                                                                    v116 = v485;
                                                                    id v193 = v513;
                                                                    v110 = (id *)v481;
                                                                    v270 = v506;
                                                                    goto LABEL_552;
                                                                  }
                                                                  id v294 = v10;
                                                                  if (v110)
                                                                  {
                                                                    id v306 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                    uint64_t v307 = *MEMORY[0x1E4F502C8];
                                                                    uint64_t v647 = *MEMORY[0x1E4F28568];
                                                                    id v432 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"activeStreamFlag"];
                                                                    id v648 = v432;
                                                                    v433 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v648 forKeys:&v647 count:1];
                                                                    id v435 = 0;
                                                                    uint64_t v49 = 0;
                                                                    id *v110 = (id)objc_msgSend(v306, "initWithDomain:code:userInfo:", v307, 2);
                                                                    goto LABEL_397;
                                                                  }
                                                                  id v435 = 0;
                                                                  uint64_t v49 = 0;
LABEL_393:
                                                                  id v10 = v294;
                                                                  uint64_t v63 = v574;
                                                                  v116 = v485;
                                                                  id v193 = v513;
                                                                  v110 = (id *)v481;
                                                                  v270 = v506;
                                                                  goto LABEL_553;
                                                                }
                                                                id v294 = v10;
                                                                if (v110)
                                                                {
                                                                  id v302 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                  uint64_t v303 = *MEMORY[0x1E4F502C8];
                                                                  uint64_t v649 = *MEMORY[0x1E4F28568];
                                                                  id v435 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cdEngagementFlag"];
                                                                  id v650 = v435;
                                                                  v434 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v650 forKeys:&v649 count:1];
                                                                  id v436 = 0;
                                                                  uint64_t v49 = 0;
                                                                  id *v110 = (id)objc_msgSend(v302, "initWithDomain:code:userInfo:", v303, 2);
                                                                  goto LABEL_393;
                                                                }
                                                                id v436 = 0;
                                                                uint64_t v49 = 0;
LABEL_391:
                                                                id v10 = v294;
                                                                uint64_t v63 = v574;
                                                                v116 = v485;
                                                                id v193 = v513;
                                                                v110 = (id *)v481;
                                                                v270 = v506;
                                                                goto LABEL_554;
                                                              }
                                                              objc_opt_class();
                                                              if (objc_opt_isKindOfClass())
                                                              {
                                                                id v448 = v160;
                                                                goto LABEL_194;
                                                              }
                                                              if (v110)
                                                              {
                                                                v564 = v24;
                                                                id v263 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                uint64_t v264 = *MEMORY[0x1E4F502C8];
                                                                uint64_t v661 = *MEMORY[0x1E4F28568];
                                                                v116 = v485;
                                                                v265 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"anchorEnv"];
                                                                v662 = v265;
                                                                uint64_t v266 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v662 forKeys:&v661 count:1];
                                                                v267 = v263;
                                                                v117 = v572;
                                                                uint64_t v24 = v564;
                                                                v449 = (void *)v266;
                                                                id v448 = 0;
                                                                uint64_t v49 = 0;
                                                                id *v110 = (id)objc_msgSend(v267, "initWithDomain:code:userInfo:", v264, 2);
                                                                uint64_t v63 = v574;
                                                                id v193 = v513;
                                                                v110 = (id *)v481;
                                                                goto LABEL_560;
                                                              }
                                                              v117 = v572;
                                                              uint64_t v260 = 0;
                                                              uint64_t v49 = 0;
LABEL_365:
                                                              uint64_t v63 = v574;
                                                              id v193 = v513;
                                                              v110 = (id *)v481;
                                                              goto LABEL_561;
                                                            }
                                                            id v236 = v10;
                                                            objc_opt_class();
                                                            if (objc_opt_isKindOfClass())
                                                            {
                                                              id v456 = v156;
                                                              v116 = v485;
                                                              goto LABEL_188;
                                                            }
                                                            if (v110)
                                                            {
                                                              id v255 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                              uint64_t v256 = *MEMORY[0x1E4F502C8];
                                                              uint64_t v665 = *MEMORY[0x1E4F28568];
                                                              id v454 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"activeAirpodsSerialNumber"];
                                                              id v666 = v454;
                                                              uint64_t v257 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v666 forKeys:&v665 count:1];
                                                              id v456 = 0;
                                                              uint64_t v49 = 0;
                                                              id *v110 = (id)[v255 initWithDomain:v256 code:2 userInfo:v257];
                                                              uint64_t v63 = v574;
                                                              v116 = v485;
                                                              id v193 = v513;
                                                              v110 = (id *)v481;
                                                              goto LABEL_563;
                                                            }
                                                            id v456 = 0;
                                                            uint64_t v49 = 0;
LABEL_356:
                                                            id v10 = v236;
                                                            uint64_t v63 = v574;
                                                            v116 = v485;
                                                            id v193 = v513;
                                                            v110 = (id *)v481;
                                                            goto LABEL_564;
                                                          }
                                                          objc_opt_class();
                                                          if (objc_opt_isKindOfClass())
                                                          {
                                                            id v459 = v152;
                                                            goto LABEL_182;
                                                          }
                                                          if (v110)
                                                          {
                                                            v562 = v24;
                                                            id v249 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            uint64_t v250 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v669 = *MEMORY[0x1E4F28568];
                                                            id v458 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"smallWindowSize"];
                                                            id v670 = v458;
                                                            uint64_t v251 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v670 forKeys:&v669 count:1];
                                                            uint64_t v252 = v249;
                                                            uint64_t v7 = v117;
                                                            uint64_t v24 = v562;
                                                            v457 = (void *)v251;
                                                            id v459 = 0;
                                                            uint64_t v49 = 0;
                                                            id *v110 = (id)objc_msgSend(v252, "initWithDomain:code:userInfo:", v250, 2);
                                                            uint64_t v63 = v574;
                                                            id v193 = v513;
                                                            v110 = (id *)v481;
                                                            goto LABEL_566;
                                                          }
                                                          id v459 = 0;
                                                          uint64_t v49 = 0;
                                                          uint64_t v63 = v574;
                                                          id v193 = v513;
                                                          v110 = (id *)v481;
                                                          uint64_t v7 = v117;
LABEL_567:

                                                          goto LABEL_568;
                                                        }
                                                        if (v110)
                                                        {
                                                          v561 = v24;
                                                          id v245 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                          uint64_t v246 = *MEMORY[0x1E4F502C8];
                                                          uint64_t v671 = *MEMORY[0x1E4F28568];
                                                          id v459 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"bigWindowSize"];
                                                          id v672 = v459;
                                                          uint64_t v247 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v672 forKeys:&v671 count:1];
                                                          uint64_t v248 = v245;
                                                          uint64_t v7 = v117;
                                                          uint64_t v24 = v561;
                                                          v460 = (void *)v247;
                                                          id v461 = 0;
                                                          uint64_t v49 = 0;
                                                          id *v110 = (id)objc_msgSend(v248, "initWithDomain:code:userInfo:", v246, 2);
                                                          uint64_t v63 = v574;
                                                          id v193 = v513;
                                                          v110 = (id *)v481;
                                                          goto LABEL_567;
                                                        }
                                                        id v461 = 0;
                                                        uint64_t v49 = 0;
                                                        uint64_t v63 = v574;
                                                        id v193 = v513;
                                                        v110 = (id *)v481;
                                                        uint64_t v7 = v117;
LABEL_568:

                                                        goto LABEL_569;
                                                      }
                                                      if (v110)
                                                      {
                                                        v560 = v24;
                                                        id v241 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                        uint64_t v242 = *MEMORY[0x1E4F502C8];
                                                        uint64_t v673 = *MEMORY[0x1E4F28568];
                                                        id v461 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"manualVolumeChangeFlag"];
                                                        id v674 = v461;
                                                        uint64_t v243 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v674 forKeys:&v673 count:1];
                                                        id v244 = v241;
                                                        uint64_t v7 = v117;
                                                        uint64_t v24 = v560;
                                                        v462 = (void *)v243;
                                                        id v463 = 0;
                                                        uint64_t v49 = 0;
                                                        id *v110 = (id)objc_msgSend(v244, "initWithDomain:code:userInfo:", v242, 2);
                                                        uint64_t v63 = v574;
                                                        id v193 = v513;
                                                        v110 = (id *)v481;
                                                        goto LABEL_568;
                                                      }
                                                      id v463 = 0;
                                                      uint64_t v49 = 0;
                                                      uint64_t v63 = v574;
                                                      id v193 = v513;
                                                      v110 = (id *)v481;
                                                      uint64_t v7 = v117;
LABEL_569:

                                                      goto LABEL_570;
                                                    }
                                                    if (v110)
                                                    {
                                                      v559 = v24;
                                                      id v237 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                      uint64_t v238 = *MEMORY[0x1E4F502C8];
                                                      uint64_t v675 = *MEMORY[0x1E4F28568];
                                                      id v463 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"minMaxCutFlag"];
                                                      id v676 = v463;
                                                      uint64_t v239 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v676 forKeys:&v675 count:1];
                                                      v240 = v237;
                                                      uint64_t v7 = v117;
                                                      uint64_t v24 = v559;
                                                      v464 = (void *)v239;
                                                      id v465 = 0;
                                                      uint64_t v49 = 0;
                                                      id *v110 = (id)objc_msgSend(v240, "initWithDomain:code:userInfo:", v238, 2);
                                                      uint64_t v63 = v574;
                                                      id v193 = v513;
                                                      v110 = (id *)v481;
                                                      goto LABEL_569;
                                                    }
                                                    id v465 = 0;
                                                    uint64_t v49 = 0;
                                                    uint64_t v63 = v574;
                                                    id v193 = v513;
                                                    v110 = (id *)v481;
                                                    uint64_t v7 = v117;
LABEL_570:

                                                    goto LABEL_571;
                                                  }
                                                  if (v110)
                                                  {
                                                    v558 = v24;
                                                    id v232 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                    uint64_t v233 = *MEMORY[0x1E4F502C8];
                                                    uint64_t v677 = *MEMORY[0x1E4F28568];
                                                    id v465 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"guardrailsAvoidFlag"];
                                                    id v678 = v465;
                                                    uint64_t v234 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v678 forKeys:&v677 count:1];
                                                    v235 = v232;
                                                    uint64_t v7 = v117;
                                                    uint64_t v24 = v558;
                                                    v466 = (void *)v234;
                                                    id v467 = 0;
                                                    uint64_t v49 = 0;
                                                    id *v110 = (id)objc_msgSend(v235, "initWithDomain:code:userInfo:", v233, 2);
                                                    uint64_t v63 = v574;
                                                    id v193 = v513;
                                                    v110 = (id *)v481;
                                                    goto LABEL_570;
                                                  }
                                                  id v467 = 0;
                                                  uint64_t v49 = 0;
                                                  uint64_t v63 = v574;
                                                  id v193 = v513;
                                                  v110 = (id *)v481;
                                                  uint64_t v7 = v117;
LABEL_571:

                                                  goto LABEL_572;
                                                }
                                                if (v110)
                                                {
                                                  v557 = v24;
                                                  id v228 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  uint64_t v229 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v679 = *MEMORY[0x1E4F28568];
                                                  id v467 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"onStartPredictionFlag"];
                                                  id v680 = v467;
                                                  uint64_t v230 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v680 forKeys:&v679 count:1];
                                                  v231 = v228;
                                                  uint64_t v7 = v117;
                                                  uint64_t v24 = v557;
                                                  v468 = (void *)v230;
                                                  id v469 = 0;
                                                  uint64_t v49 = 0;
                                                  id *v110 = (id)objc_msgSend(v231, "initWithDomain:code:userInfo:", v229, 2);
                                                  uint64_t v63 = v574;
                                                  id v193 = v513;
                                                  v110 = (id *)v481;
                                                  goto LABEL_571;
                                                }
                                                id v469 = 0;
                                                uint64_t v49 = 0;
                                                uint64_t v63 = v574;
                                                id v193 = v513;
                                                v110 = (id *)v481;
                                                uint64_t v7 = v117;
LABEL_572:

                                                goto LABEL_573;
                                              }
                                              if (v110)
                                              {
                                                v556 = v24;
                                                id v224 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                uint64_t v225 = *MEMORY[0x1E4F502C8];
                                                uint64_t v681 = *MEMORY[0x1E4F28568];
                                                id v469 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"predVolSiriPrct"];
                                                id v682 = v469;
                                                uint64_t v226 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v682 forKeys:&v681 count:1];
                                                v227 = v224;
                                                uint64_t v7 = v117;
                                                uint64_t v24 = v556;
                                                v470 = (void *)v226;
                                                id v471 = 0;
                                                uint64_t v49 = 0;
                                                id *v110 = (id)objc_msgSend(v227, "initWithDomain:code:userInfo:", v225, 2);
                                                uint64_t v63 = v574;
                                                id v193 = v513;
                                                v110 = (id *)v481;
                                                goto LABEL_572;
                                              }
                                              id v471 = 0;
                                              uint64_t v49 = 0;
                                              uint64_t v63 = v574;
                                              id v193 = v513;
                                              v110 = (id *)v481;
                                              uint64_t v7 = v117;
LABEL_573:

                                              goto LABEL_574;
                                            }
                                            if (v110)
                                            {
                                              v555 = v24;
                                              id v220 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v221 = *MEMORY[0x1E4F502C8];
                                              uint64_t v683 = *MEMORY[0x1E4F28568];
                                              id v471 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"predVolTelephonyPrct"];
                                              id v684 = v471;
                                              uint64_t v222 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v684 forKeys:&v683 count:1];
                                              v223 = v220;
                                              uint64_t v7 = v117;
                                              uint64_t v24 = v555;
                                              v472 = (void *)v222;
                                              id v473 = 0;
                                              uint64_t v49 = 0;
                                              id *v110 = (id)objc_msgSend(v223, "initWithDomain:code:userInfo:", v221, 2);
                                              uint64_t v63 = v574;
                                              id v193 = v513;
                                              v110 = (id *)v481;
                                              goto LABEL_573;
                                            }
                                            id v473 = 0;
                                            uint64_t v49 = 0;
                                            uint64_t v63 = v574;
                                            id v193 = v513;
                                            v110 = (id *)v481;
                                            uint64_t v7 = v117;
LABEL_574:

                                            goto LABEL_575;
                                          }
                                          if (v110)
                                          {
                                            v554 = v24;
                                            id v216 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v217 = *MEMORY[0x1E4F502C8];
                                            uint64_t v685 = *MEMORY[0x1E4F28568];
                                            id v473 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"predVolMediaPrct"];
                                            id v686 = v473;
                                            uint64_t v218 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v686 forKeys:&v685 count:1];
                                            v219 = v216;
                                            uint64_t v7 = v117;
                                            uint64_t v24 = v554;
                                            v474 = (void *)v218;
                                            id v475 = 0;
                                            uint64_t v49 = 0;
                                            id *v110 = (id)objc_msgSend(v219, "initWithDomain:code:userInfo:", v217, 2);
                                            uint64_t v63 = v574;
                                            id v193 = v513;
                                            v110 = (id *)v481;
                                            goto LABEL_574;
                                          }
                                          id v475 = 0;
                                          uint64_t v49 = 0;
                                          uint64_t v63 = v574;
                                          id v193 = v513;
                                          v110 = (id *)v481;
                                          uint64_t v7 = v117;
LABEL_575:

                                          goto LABEL_576;
                                        }
                                        if (v110)
                                        {
                                          v553 = v24;
                                          id v212 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          uint64_t v213 = *MEMORY[0x1E4F502C8];
                                          uint64_t v687 = *MEMORY[0x1E4F28568];
                                          id v475 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"desiredDeltaE"];
                                          id v688 = v475;
                                          uint64_t v214 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v688 forKeys:&v687 count:1];
                                          v215 = v212;
                                          uint64_t v7 = v117;
                                          uint64_t v24 = v553;
                                          v476 = (void *)v214;
                                          id v477 = 0;
                                          uint64_t v49 = 0;
                                          id *v110 = (id)objc_msgSend(v215, "initWithDomain:code:userInfo:", v213, 2);
                                          uint64_t v63 = v574;
                                          id v193 = v513;
                                          v110 = (id *)v481;
                                          goto LABEL_575;
                                        }
                                        id v477 = 0;
                                        uint64_t v49 = 0;
                                        uint64_t v63 = v574;
                                        id v193 = v513;
                                        v110 = (id *)v481;
                                        uint64_t v7 = v117;
LABEL_576:

                                        goto LABEL_577;
                                      }
                                      if (v110)
                                      {
                                        v552 = v24;
                                        id v208 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v209 = *MEMORY[0x1E4F502C8];
                                        uint64_t v689 = *MEMORY[0x1E4F28568];
                                        id v477 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"smoothEae"];
                                        id v690 = v477;
                                        uint64_t v210 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v690 forKeys:&v689 count:1];
                                        id v211 = v208;
                                        uint64_t v7 = v117;
                                        uint64_t v24 = v552;
                                        v478 = (void *)v210;
                                        id v479 = 0;
                                        uint64_t v49 = 0;
                                        id *v110 = (id)objc_msgSend(v211, "initWithDomain:code:userInfo:", v209, 2);
                                        uint64_t v63 = v574;
                                        id v193 = v513;
                                        v110 = (id *)v481;
                                        goto LABEL_576;
                                      }
                                      id v479 = 0;
                                      uint64_t v49 = 0;
                                      uint64_t v63 = v574;
                                      id v193 = v513;
                                      v110 = (id *)v481;
                                      uint64_t v7 = v117;
LABEL_577:

                                      goto LABEL_578;
                                    }
                                    if (v110)
                                    {
                                      v551 = v24;
                                      id v204 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v205 = *MEMORY[0x1E4F502C8];
                                      uint64_t v691 = *MEMORY[0x1E4F28568];
                                      id v479 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"lastVolSiriPrct"];
                                      id v692 = v479;
                                      uint64_t v206 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v692 forKeys:&v691 count:1];
                                      id v207 = v204;
                                      uint64_t v7 = v117;
                                      uint64_t v24 = v551;
                                      v480 = (void *)v206;
                                      id v483 = 0;
                                      uint64_t v49 = 0;
                                      id *v110 = (id)objc_msgSend(v207, "initWithDomain:code:userInfo:", v205, 2);
                                      uint64_t v63 = v574;
                                      id v193 = v513;
                                      v110 = (id *)v481;
                                      goto LABEL_577;
                                    }
                                    id v483 = 0;
                                    uint64_t v49 = 0;
                                    uint64_t v63 = v574;
                                    id v193 = v513;
                                    v110 = (id *)v481;
                                    uint64_t v7 = v117;
LABEL_578:

                                    goto LABEL_579;
                                  }
                                  uint64_t v7 = v117;
                                  if (v110)
                                  {
                                    v550 = v24;
                                    id v199 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v200 = *MEMORY[0x1E4F502C8];
                                    uint64_t v693 = *MEMORY[0x1E4F28568];
                                    id v201 = v110;
                                    id v483 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"lastESiridBA"];
                                    id v694 = v483;
                                    uint64_t v202 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v694 forKeys:&v693 count:1];
                                    id v203 = v199;
                                    uint64_t v7 = v117;
                                    uint64_t v24 = v550;
                                    v484 = (void *)v202;
                                    v110 = 0;
                                    uint64_t v49 = 0;
                                    *id v201 = (id)objc_msgSend(v203, "initWithDomain:code:userInfo:", v200, 2);
                                    uint64_t v63 = v574;
                                    id v193 = v513;
                                    goto LABEL_578;
                                  }
                                  uint64_t v49 = 0;
                                  uint64_t v63 = v574;
                                  id v193 = v513;
LABEL_579:

                                  id v21 = v493;
                                  goto LABEL_580;
                                }
                                if (v110)
                                {
                                  v549 = v24;
                                  id v195 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  uint64_t v196 = *MEMORY[0x1E4F502C8];
                                  uint64_t v695 = *MEMORY[0x1E4F28568];
                                  v520 = v110;
                                  id v193 = v118;
                                  v110 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"lastVolTelephonyPrct"];
                                  v696 = v110;
                                  uint64_t v197 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v696 forKeys:&v695 count:1];
                                  id v198 = v195;
                                  uint64_t v7 = v117;
                                  uint64_t v24 = v549;
                                  v486 = (void *)v197;
                                  v487 = 0;
                                  uint64_t v49 = 0;
                                  id *v520 = (id)objc_msgSend(v198, "initWithDomain:code:userInfo:", v196, 2);
                                  uint64_t v63 = v574;
                                  goto LABEL_579;
                                }
                                v487 = 0;
                                uint64_t v49 = 0;
                                uint64_t v63 = v574;
                                id v193 = v118;
                                id v21 = v493;
                                uint64_t v7 = v117;
LABEL_580:

                                id v189 = v488;
                                goto LABEL_581;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                v117 = v7;
                                id v488 = v116;
                                goto LABEL_129;
                              }
                              if (v110)
                              {
                                v548 = v24;
                                id v191 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v192 = *MEMORY[0x1E4F502C8];
                                uint64_t v697 = *MEMORY[0x1E4F28568];
                                v525 = v111;
                                v519 = v110;
                                id v21 = v493;
                                v487 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"lastETelephonydBA"];
                                v698 = v487;
                                id v193 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v698 forKeys:&v697 count:1];
                                id v194 = v191;
                                uint64_t v24 = v548;
                                id v488 = 0;
                                uint64_t v49 = 0;
                                id *v519 = (id)[v194 initWithDomain:v192 code:2 userInfo:v193];
                                uint64_t v63 = v574;
                                goto LABEL_580;
                              }
                              id v189 = 0;
                              uint64_t v49 = 0;
                              uint64_t v63 = v574;
                              id v21 = v493;
LABEL_581:

                              uint64_t v60 = v534;
                              self = v502;
                              goto LABEL_582;
                            }
                            if (v13)
                            {
                              v546 = v24;
                              id v184 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v185 = *MEMORY[0x1E4F502C8];
                              uint64_t v701 = *MEMORY[0x1E4F28568];
                              v517 = v13;
                              uint64_t v60 = v534;
                              long long v13 = v506;
                              id v489 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"lastEMediadBA"];
                              id v702 = v489;
                              v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v702 forKeys:&v701 count:1];
                              v186 = v184;
                              uint64_t v24 = v546;
                              v491 = 0;
                              uint64_t v49 = 0;
                              id *v517 = (id)[v186 initWithDomain:v185 code:2 userInfo:v109];
                              uint64_t v63 = v574;
LABEL_583:

                              id v25 = v490;
                              goto LABEL_584;
                            }
                            v491 = 0;
                            uint64_t v49 = 0;
                            uint64_t v63 = v574;
                            uint64_t v60 = v534;
                            long long v13 = v506;
LABEL_584:

                            goto LABEL_585;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v494 = v41;
                            goto LABEL_49;
                          }
                          if (v13)
                          {
                            v545 = v24;
                            id v180 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v181 = *MEMORY[0x1E4F502C8];
                            uint64_t v703 = *MEMORY[0x1E4F28568];
                            v516 = v13;
                            uint64_t v60 = v534;
                            long long v13 = v506;
                            v491 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"personalizationParamMistakes"];
                            v704 = v491;
                            uint64_t v182 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v704 forKeys:&v703 count:1];
                            id v183 = v180;
                            uint64_t v24 = v545;
                            v492 = (void *)v182;
                            id v494 = 0;
                            uint64_t v49 = 0;
                            id *v516 = (id)objc_msgSend(v183, "initWithDomain:code:userInfo:", v181, 2);
                            uint64_t v63 = v574;
                            goto LABEL_584;
                          }
                          id v494 = 0;
                          uint64_t v49 = 0;
                          uint64_t v63 = v574;
                          uint64_t v60 = v534;
                          long long v13 = v506;
LABEL_585:

                          goto LABEL_586;
                        }
                        if (v13)
                        {
                          v544 = v24;
                          id v123 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v497 = *MEMORY[0x1E4F502C8];
                          uint64_t v705 = *MEMORY[0x1E4F28568];
                          v515 = v13;
                          uint64_t v60 = v534;
                          long long v13 = v506;
                          id v494 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"personalizationParamSnr"];
                          id v706 = v494;
                          uint64_t v124 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v706 forKeys:&v705 count:1];
                          v125 = v123;
                          uint64_t v24 = v544;
                          v495 = (void *)v124;
                          id v126 = (id)objc_msgSend(v125, "initWithDomain:code:userInfo:", v497, 2);
                          id v496 = 0;
                          uint64_t v49 = 0;
                          id *v515 = v126;
                          uint64_t v63 = v574;
                          goto LABEL_585;
                        }
                        id v496 = 0;
                        uint64_t v49 = 0;
                        uint64_t v63 = v574;
                        uint64_t v60 = v534;
                        long long v13 = v506;
LABEL_586:

                        goto LABEL_587;
                      }
                      if (v13)
                      {
                        v543 = v24;
                        id v119 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v500 = *MEMORY[0x1E4F502C8];
                        uint64_t v707 = *MEMORY[0x1E4F28568];
                        v514 = v13;
                        uint64_t v60 = v534;
                        long long v13 = v506;
                        id v496 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"speechPresenceProbability"];
                        id v708 = v496;
                        uint64_t v120 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v708 forKeys:&v707 count:1];
                        v121 = v119;
                        uint64_t v24 = v543;
                        v498 = (void *)v120;
                        id v122 = (id)objc_msgSend(v121, "initWithDomain:code:userInfo:", v500, 2);
                        id v499 = 0;
                        uint64_t v49 = 0;
                        id *v514 = v122;
                        uint64_t v63 = v574;
                        goto LABEL_586;
                      }
                      id v499 = 0;
                      uint64_t v49 = 0;
                      uint64_t v63 = v574;
                      uint64_t v60 = v534;
                      long long v13 = v506;
LABEL_587:

                      goto LABEL_588;
                    }
                    if (v13)
                    {
                      v542 = v24;
                      id v112 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v504 = *MEMORY[0x1E4F502C8];
                      uint64_t v709 = *MEMORY[0x1E4F28568];
                      v512 = v13;
                      uint64_t v60 = v534;
                      long long v13 = v506;
                      id v499 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"volumeChangeFlag"];
                      id v710 = v499;
                      uint64_t v113 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v710 forKeys:&v709 count:1];
                      v114 = v112;
                      uint64_t v24 = v542;
                      v501 = (void *)v113;
                      id v115 = (id)objc_msgSend(v114, "initWithDomain:code:userInfo:", v504, 2);
                      id v503 = 0;
                      uint64_t v49 = 0;
                      id *v512 = v115;
                      uint64_t v63 = v574;
                      goto LABEL_587;
                    }
                    id v503 = 0;
                    uint64_t v49 = 0;
                    uint64_t v63 = v574;
                    uint64_t v60 = v534;
                    long long v13 = v506;
LABEL_588:

                    goto LABEL_589;
                  }
                  if (v13)
                  {
                    v541 = v24;
                    id v105 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v508 = *MEMORY[0x1E4F502C8];
                    uint64_t v711 = *MEMORY[0x1E4F28568];
                    v511 = v13;
                    uint64_t v60 = v534;
                    long long v13 = v506;
                    id v503 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"windSpeechAggressorFlag"];
                    id v712 = v503;
                    uint64_t v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v712 forKeys:&v711 count:1];
                    v107 = v105;
                    uint64_t v24 = v541;
                    v505 = (void *)v106;
                    id v108 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v508, 2);
                    id v507 = 0;
                    uint64_t v49 = 0;
                    id *v511 = v108;
                    uint64_t v63 = v574;
                    goto LABEL_588;
                  }
                  id v507 = 0;
                  uint64_t v49 = 0;
                  uint64_t v63 = v574;
                  uint64_t v60 = v534;
                  long long v13 = v506;
LABEL_589:

                  goto LABEL_590;
                }
                if (v13)
                {
                  v99 = v13;
                  v540 = v24;
                  id v100 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v101 = *MEMORY[0x1E4F502C8];
                  uint64_t v713 = *MEMORY[0x1E4F28568];
                  uint64_t v60 = v534;
                  id v507 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"streamType"];
                  id v714 = v507;
                  uint64_t v102 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v714 forKeys:&v713 count:1];
                  v103 = v100;
                  uint64_t v24 = v540;
                  v521 = (void *)v102;
                  id v104 = (id)objc_msgSend(v103, "initWithDomain:code:userInfo:", v101, 2);
                  long long v13 = 0;
                  uint64_t v49 = 0;
                  id *v99 = v104;
                  uint64_t v63 = v574;
                  goto LABEL_589;
                }
                uint64_t v49 = 0;
                uint64_t v63 = v574;
                uint64_t v60 = v534;
LABEL_590:

                goto LABEL_591;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v525 = v27;
                goto LABEL_28;
              }
              if (v13)
              {
                unsigned int v89 = v13;
                v538 = v24;
                id v90 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v91 = *MEMORY[0x1E4F502C8];
                uint64_t v717 = *MEMORY[0x1E4F28568];
                uint64_t v60 = v534;
                id v523 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"lastUserVolChangeType"];
                id v718 = v523;
                uint64_t v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v718 forKeys:&v717 count:1];
                unsigned int v93 = v90;
                uint64_t v24 = v538;
                v526 = (void *)v92;
                id v94 = (id)objc_msgSend(v93, "initWithDomain:code:userInfo:", v91, 2);
                long long v13 = 0;
                uint64_t v49 = 0;
                *unsigned int v89 = v94;
                uint64_t v63 = v574;
LABEL_592:

                goto LABEL_593;
              }
              uint64_t v49 = 0;
              uint64_t v63 = v574;
              uint64_t v60 = v534;
LABEL_593:

              goto LABEL_594;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v21 = v20;
              goto LABEL_22;
            }
            if (v13)
            {
              id v80 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v81 = *MEMORY[0x1E4F502C8];
              uint64_t v721 = *MEMORY[0x1E4F28568];
              v509 = v13;
              uint64_t v60 = v534;
              uint64_t v82 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"downlinkdBA"];
              uint64_t v722 = v82;
              [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v722 forKeys:&v721 count:1];
              v531 = uint64_t v24 = v6;
              id v83 = (id)objc_msgSend(v80, "initWithDomain:code:userInfo:", v81, 2);
              id v21 = 0;
              uint64_t v49 = 0;
              id *v509 = v83;
              id v25 = (id)v82;
              long long v13 = v532;
              uint64_t v63 = v574;
LABEL_595:

              id v6 = v24;
              uint64_t v16 = v530;
              goto LABEL_596;
            }
            id v21 = 0;
            uint64_t v49 = 0;
            uint64_t v63 = v574;
            uint64_t v60 = v534;
            long long v13 = v532;
LABEL_596:

            goto LABEL_597;
          }
          if (v13)
          {
            v571 = v7;
            unsigned int v75 = self;
            id v76 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v77 = *MEMORY[0x1E4F502C8];
            uint64_t v723 = *MEMORY[0x1E4F28568];
            uint64_t v60 = v534;
            id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"drumdBAPredicted"];
            id v724 = v21;
            uint64_t v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v724 forKeys:&v723 count:1];
            v79 = v76;
            self = v75;
            v533 = (void *)v78;
            uint64_t v49 = 0;
            *long long v13 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v77, 2);
            uint64_t v7 = v571;
            long long v13 = 0;
            uint64_t v63 = v574;
            goto LABEL_596;
          }
          uint64_t v49 = 0;
          uint64_t v63 = v574;
          uint64_t v60 = v534;
LABEL_597:

          goto LABEL_598;
        }
        if (v13)
        {
          id v536 = v6;
          id v576 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v72 = *MEMORY[0x1E4F502C8];
          uint64_t v725 = *MEMORY[0x1E4F28568];
          unsigned int v73 = v13;
          uint64_t v60 = v15;
          long long v13 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"drumdBK"];
          v726 = v13;
          v573 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v726 forKeys:&v725 count:1];
          id v74 = (id)objc_msgSend(v576, "initWithDomain:code:userInfo:", v72, 2);
          id v575 = 0;
          uint64_t v49 = 0;
          *unsigned int v73 = v74;
          id v6 = v536;
          uint64_t v63 = v574;
          goto LABEL_597;
        }
        id v575 = 0;
        uint64_t v49 = 0;
        uint64_t v63 = v574;
        uint64_t v60 = v15;
LABEL_598:

        id v9 = v577;
        goto LABEL_599;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v43 = v12;
        long long v13 = a4;
        id v579 = v43;
        goto LABEL_10;
      }
      if (a4)
      {
        id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
        v570 = v7;
        id v57 = v10;
        uint64_t v58 = *MEMORY[0x1E4F502C8];
        uint64_t v729 = *MEMORY[0x1E4F28568];
        uint64_t v59 = a4;
        uint64_t v60 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"refMicdBC"];
        v730 = v60;
        uint64_t v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v730 forKeys:&v729 count:1];
        uint64_t v62 = v56;
        uint64_t v63 = (void *)v61;
        uint64_t v64 = v58;
        id v10 = v57;
        uint64_t v7 = v570;
        id v579 = 0;
        uint64_t v49 = 0;
        *uint64_t v59 = (id)[v62 initWithDomain:v64 code:2 userInfo:v61];
LABEL_600:

        uint64_t v55 = v579;
        goto LABEL_601;
      }
      uint64_t v55 = 0;
      uint64_t v49 = 0;
LABEL_601:

      id v8 = v580;
      goto LABEL_602;
    }
    if (a4)
    {
      uint64_t v50 = self;
      id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v52 = *MEMORY[0x1E4F502C8];
      uint64_t v731 = *MEMORY[0x1E4F28568];
      uint64_t v53 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"refMicdBA"];
      uint64_t v732 = v53;
      long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v732 forKeys:&v731 count:1];
      uint64_t v54 = v51;
      self = v50;
      uint64_t v55 = (void *)v53;
      id v10 = 0;
      uint64_t v49 = 0;
      *a4 = (id)[v54 initWithDomain:v52 code:2 userInfo:v12];
      goto LABEL_601;
    }
    id v10 = 0;
    uint64_t v49 = 0;
LABEL_602:

    goto LABEL_603;
  }
  if (a4)
  {
    id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v45 = *MEMORY[0x1E4F502C8];
    uint64_t v733 = *MEMORY[0x1E4F28568];
    uint64_t v46 = v7;
    id v47 = [NSString alloc];
    uint64_t v393 = objc_opt_class();
    uint64_t v48 = v47;
    uint64_t v7 = v46;
    id v10 = (id)[v48 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v393, @"controllerVersion"];
    v734[0] = v10;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v734 forKeys:&v733 count:1];
    id v8 = 0;
    uint64_t v49 = 0;
    *a4 = (id)[v44 initWithDomain:v45 code:2 userInfo:v9];
    goto LABEL_602;
  }
  id v8 = 0;
  uint64_t v49 = 0;
LABEL_603:

  return v49;
}

- (id)serialize
{
  id v3 = objc_opt_new();
  [(BMDeviceAdaptiveVolume *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasControllerVersion) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasRefMicdBA) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasRefMicdBC) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasDrumdBA) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasDrumdBK) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasDrumdBAPredicted) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasDownlinkdBA) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasCurrentVolumePrct) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasLastUserVolChangeType) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasHeadphoneMode) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasStreamType) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasWindSpeechAggressorFlag) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasVolumeChangeFlag) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasSpeechPresenceProbability) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasPersonalizationParamSnr) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasPersonalizationParamMistakes) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasLastEMediadBA) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasLastVolMediaPrct) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasLastETelephonydBA) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasLastVolTelephonyPrct) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasLastESiridBA) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasLastVolSiriPrct) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasSmoothEae) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasDesiredDeltaE) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasPredVolMediaPrct) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasPredVolTelephonyPrct) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasPredVolSiriPrct) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasOnStartPredictionFlag) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasGuardrailsAvoidFlag) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasMinMaxCutFlag) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasManualVolumeChangeFlag) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasBigWindowSize) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasSmallWindowSize) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_activeAppName) {
    PBDataWriterWriteStringField();
  }
  if (self->_activeAirpodsSerialNumber) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasAnchorVol) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasAnchorEnv) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasPersonalizationCoeff) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasUnsignedPredVolMediaPrct) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasUnsignedPredVolTelephonyPrct) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasUnsignedPredVolSiriPrct) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasSingleBudFlag) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasCdEngagementFlag) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasActiveStreamFlag) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasPvFeatureEnableFlag) {
    PBDataWriterWriteUint32Field();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = self->_envSpectralData32B;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v9) unsignedIntValue];
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (self->_hasWindStrength) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasWindProb) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasMediaType) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasSourceActivity) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasBudActivity) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasLocation) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasLocationType) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasFocusMode) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasStreamingAppBundleId) {
    PBDataWriterWriteUint32Field();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = self->_noiseType4B;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14), "unsignedIntValue", (void)v15);
        PBDataWriterWriteUint32Field();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_hasInstdBA) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasInstdBC) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasNonCAListeningMode) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasFit) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasFixedAutoAncGain) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasAdjustedAutoAncGain) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasTimestamp) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasDRCenablementBit) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasDRCwindFlag) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasDRCappSelfVoiceFlag) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasDrumDRC) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasRoutedDRCGain) {
    PBDataWriterWriteUint32Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v373.receiver = self;
  v373.super_class = (Class)BMDeviceAdaptiveVolume;
  uint64_t v5 = [(BMEventBase *)&v373 init];
  if (!v5)
  {
LABEL_760:
    uint64_t v371 = v5;
    goto LABEL_761;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  id v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_758:
    uint64_t v366 = [v6 copy];
    envSpectralData32B = v5->_envSpectralData32B;
    v5->_envSpectralData32B = (NSArray *)v366;

    uint64_t v368 = [v7 copy];
    noiseType4B = v5->_noiseType4B;
    v5->_noiseType4B = (NSArray *)v368;

    int v370 = v4[*v10];
    if (v370) {
      goto LABEL_759;
    }
    goto LABEL_760;
  }
  uint64_t v11 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v10]) {
      goto LABEL_758;
    }
    char v12 = 0;
    unsigned int v13 = 0;
    unint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = *v8;
      unint64_t v16 = *(void *)&v4[v15];
      if (v16 == -1 || v16 >= *(void *)&v4[*v9]) {
        break;
      }
      char v17 = *(unsigned char *)(*(void *)&v4[*v11] + v16);
      *(void *)&v4[v15] = v16 + 1;
      v14 |= (unint64_t)(v17 & 0x7F) << v12;
      if ((v17 & 0x80) == 0) {
        goto LABEL_13;
      }
      v12 += 7;
      BOOL v18 = v13++ >= 9;
      if (v18)
      {
        unint64_t v14 = 0;
        int v19 = v4[*v10];
        goto LABEL_15;
      }
    }
    v4[*v10] = 1;
LABEL_13:
    int v19 = v4[*v10];
    if (v4[*v10]) {
      unint64_t v14 = 0;
    }
LABEL_15:
    if (v19 || (v14 & 7) == 4) {
      goto LABEL_758;
    }
    switch((v14 >> 3))
    {
      case 1u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        v5->_hasControllerVersion = 1;
        while (1)
        {
          uint64_t v24 = *v8;
          unint64_t v25 = *(void *)&v4[v24];
          if (v25 == -1 || v25 >= *(void *)&v4[*v9]) {
            break;
          }
          char v26 = *(unsigned char *)(*(void *)&v4[*v11] + v25);
          *(void *)&v4[v24] = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0) {
            goto LABEL_488;
          }
          v21 += 7;
          BOOL v18 = v22++ >= 9;
          if (v18)
          {
            LODWORD(v23) = 0;
            goto LABEL_490;
          }
        }
        v4[*v10] = 1;
LABEL_488:
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_490:
        uint64_t v361 = 88;
        goto LABEL_756;
      case 2u:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v23 = 0;
        v5->_hasRefMicdBA = 1;
        while (2)
        {
          uint64_t v29 = *v8;
          unint64_t v30 = *(void *)&v4[v29];
          if (v30 == -1 || v30 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)&v4[*v11] + v30);
            *(void *)&v4[v29] = v30 + 1;
            v23 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              BOOL v18 = v28++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_494;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_494:
        uint64_t v361 = 92;
        goto LABEL_756;
      case 3u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v23 = 0;
        v5->_hasRefMicdBC = 1;
        while (2)
        {
          uint64_t v34 = *v8;
          unint64_t v35 = *(void *)&v4[v34];
          if (v35 == -1 || v35 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)&v4[*v11] + v35);
            *(void *)&v4[v34] = v35 + 1;
            v23 |= (unint64_t)(v36 & 0x7F) << v32;
            if (v36 < 0)
            {
              v32 += 7;
              BOOL v18 = v33++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_498;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_498:
        uint64_t v361 = 96;
        goto LABEL_756;
      case 4u:
        char v37 = 0;
        unsigned int v38 = 0;
        uint64_t v23 = 0;
        v5->_hasDrumdBA = 1;
        while (2)
        {
          uint64_t v39 = *v8;
          unint64_t v40 = *(void *)&v4[v39];
          if (v40 == -1 || v40 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v41 = *(unsigned char *)(*(void *)&v4[*v11] + v40);
            *(void *)&v4[v39] = v40 + 1;
            v23 |= (unint64_t)(v41 & 0x7F) << v37;
            if (v41 < 0)
            {
              v37 += 7;
              BOOL v18 = v38++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_502;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_502:
        uint64_t v361 = 100;
        goto LABEL_756;
      case 5u:
        char v42 = 0;
        unsigned int v43 = 0;
        uint64_t v23 = 0;
        v5->_hasDrumdBK = 1;
        while (2)
        {
          uint64_t v44 = *v8;
          unint64_t v45 = *(void *)&v4[v44];
          if (v45 == -1 || v45 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v46 = *(unsigned char *)(*(void *)&v4[*v11] + v45);
            *(void *)&v4[v44] = v45 + 1;
            v23 |= (unint64_t)(v46 & 0x7F) << v42;
            if (v46 < 0)
            {
              v42 += 7;
              BOOL v18 = v43++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_506;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_506:
        uint64_t v361 = 104;
        goto LABEL_756;
      case 6u:
        char v47 = 0;
        unsigned int v48 = 0;
        uint64_t v23 = 0;
        v5->_hasDrumdBAPredicted = 1;
        while (2)
        {
          uint64_t v49 = *v8;
          unint64_t v50 = *(void *)&v4[v49];
          if (v50 == -1 || v50 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v51 = *(unsigned char *)(*(void *)&v4[*v11] + v50);
            *(void *)&v4[v49] = v50 + 1;
            v23 |= (unint64_t)(v51 & 0x7F) << v47;
            if (v51 < 0)
            {
              v47 += 7;
              BOOL v18 = v48++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_510;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_510:
        uint64_t v361 = 108;
        goto LABEL_756;
      case 7u:
        char v52 = 0;
        unsigned int v53 = 0;
        uint64_t v23 = 0;
        v5->_hasDownlinkdBA = 1;
        while (2)
        {
          uint64_t v54 = *v8;
          unint64_t v55 = *(void *)&v4[v54];
          if (v55 == -1 || v55 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v56 = *(unsigned char *)(*(void *)&v4[*v11] + v55);
            *(void *)&v4[v54] = v55 + 1;
            v23 |= (unint64_t)(v56 & 0x7F) << v52;
            if (v56 < 0)
            {
              v52 += 7;
              BOOL v18 = v53++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_514;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_514:
        uint64_t v361 = 112;
        goto LABEL_756;
      case 8u:
        char v57 = 0;
        unsigned int v58 = 0;
        uint64_t v23 = 0;
        v5->_hasCurrentVolumePrct = 1;
        while (2)
        {
          uint64_t v59 = *v8;
          unint64_t v60 = *(void *)&v4[v59];
          if (v60 == -1 || v60 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v61 = *(unsigned char *)(*(void *)&v4[*v11] + v60);
            *(void *)&v4[v59] = v60 + 1;
            v23 |= (unint64_t)(v61 & 0x7F) << v57;
            if (v61 < 0)
            {
              v57 += 7;
              BOOL v18 = v58++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_518;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_518:
        uint64_t v361 = 116;
        goto LABEL_756;
      case 9u:
        char v62 = 0;
        unsigned int v63 = 0;
        uint64_t v23 = 0;
        v5->_hasLastUserVolChangeType = 1;
        while (2)
        {
          uint64_t v64 = *v8;
          unint64_t v65 = *(void *)&v4[v64];
          if (v65 == -1 || v65 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v66 = *(unsigned char *)(*(void *)&v4[*v11] + v65);
            *(void *)&v4[v64] = v65 + 1;
            v23 |= (unint64_t)(v66 & 0x7F) << v62;
            if (v66 < 0)
            {
              v62 += 7;
              BOOL v18 = v63++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_522;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_522:
        uint64_t v361 = 120;
        goto LABEL_756;
      case 0xAu:
        char v67 = 0;
        unsigned int v68 = 0;
        uint64_t v23 = 0;
        v5->_hasHeadphoneMode = 1;
        while (2)
        {
          uint64_t v69 = *v8;
          unint64_t v70 = *(void *)&v4[v69];
          if (v70 == -1 || v70 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v71 = *(unsigned char *)(*(void *)&v4[*v11] + v70);
            *(void *)&v4[v69] = v70 + 1;
            v23 |= (unint64_t)(v71 & 0x7F) << v67;
            if (v71 < 0)
            {
              v67 += 7;
              BOOL v18 = v68++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_526;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_526:
        uint64_t v361 = 124;
        goto LABEL_756;
      case 0xBu:
        char v72 = 0;
        unsigned int v73 = 0;
        uint64_t v23 = 0;
        v5->_hasStreamType = 1;
        while (2)
        {
          uint64_t v74 = *v8;
          unint64_t v75 = *(void *)&v4[v74];
          if (v75 == -1 || v75 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v76 = *(unsigned char *)(*(void *)&v4[*v11] + v75);
            *(void *)&v4[v74] = v75 + 1;
            v23 |= (unint64_t)(v76 & 0x7F) << v72;
            if (v76 < 0)
            {
              v72 += 7;
              BOOL v18 = v73++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_530;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_530:
        uint64_t v361 = 128;
        goto LABEL_756;
      case 0xCu:
        char v77 = 0;
        unsigned int v78 = 0;
        uint64_t v23 = 0;
        v5->_hasWindSpeechAggressorFlag = 1;
        while (2)
        {
          uint64_t v79 = *v8;
          unint64_t v80 = *(void *)&v4[v79];
          if (v80 == -1 || v80 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v81 = *(unsigned char *)(*(void *)&v4[*v11] + v80);
            *(void *)&v4[v79] = v80 + 1;
            v23 |= (unint64_t)(v81 & 0x7F) << v77;
            if (v81 < 0)
            {
              v77 += 7;
              BOOL v18 = v78++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_534;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_534:
        uint64_t v361 = 132;
        goto LABEL_756;
      case 0xDu:
        char v82 = 0;
        unsigned int v83 = 0;
        uint64_t v23 = 0;
        v5->_hasVolumeChangeFlag = 1;
        while (2)
        {
          uint64_t v84 = *v8;
          unint64_t v85 = *(void *)&v4[v84];
          if (v85 == -1 || v85 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v86 = *(unsigned char *)(*(void *)&v4[*v11] + v85);
            *(void *)&v4[v84] = v85 + 1;
            v23 |= (unint64_t)(v86 & 0x7F) << v82;
            if (v86 < 0)
            {
              v82 += 7;
              BOOL v18 = v83++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_538;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_538:
        uint64_t v361 = 136;
        goto LABEL_756;
      case 0xEu:
        char v87 = 0;
        unsigned int v88 = 0;
        uint64_t v23 = 0;
        v5->_hasSpeechPresenceProbability = 1;
        while (2)
        {
          uint64_t v89 = *v8;
          unint64_t v90 = *(void *)&v4[v89];
          if (v90 == -1 || v90 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v91 = *(unsigned char *)(*(void *)&v4[*v11] + v90);
            *(void *)&v4[v89] = v90 + 1;
            v23 |= (unint64_t)(v91 & 0x7F) << v87;
            if (v91 < 0)
            {
              v87 += 7;
              BOOL v18 = v88++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_542;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_542:
        uint64_t v361 = 140;
        goto LABEL_756;
      case 0xFu:
        char v92 = 0;
        unsigned int v93 = 0;
        uint64_t v23 = 0;
        v5->_hasPersonalizationParamSnr = 1;
        while (2)
        {
          uint64_t v94 = *v8;
          unint64_t v95 = *(void *)&v4[v94];
          if (v95 == -1 || v95 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v96 = *(unsigned char *)(*(void *)&v4[*v11] + v95);
            *(void *)&v4[v94] = v95 + 1;
            v23 |= (unint64_t)(v96 & 0x7F) << v92;
            if (v96 < 0)
            {
              v92 += 7;
              BOOL v18 = v93++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_546;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_546:
        uint64_t v361 = 144;
        goto LABEL_756;
      case 0x10u:
        char v97 = 0;
        unsigned int v98 = 0;
        uint64_t v23 = 0;
        v5->_hasPersonalizationParamMistakes = 1;
        while (2)
        {
          uint64_t v99 = *v8;
          unint64_t v100 = *(void *)&v4[v99];
          if (v100 == -1 || v100 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v101 = *(unsigned char *)(*(void *)&v4[*v11] + v100);
            *(void *)&v4[v99] = v100 + 1;
            v23 |= (unint64_t)(v101 & 0x7F) << v97;
            if (v101 < 0)
            {
              v97 += 7;
              BOOL v18 = v98++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_550;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_550:
        uint64_t v361 = 148;
        goto LABEL_756;
      case 0x11u:
        char v102 = 0;
        unsigned int v103 = 0;
        uint64_t v23 = 0;
        v5->_hasLastEMediadBA = 1;
        while (2)
        {
          uint64_t v104 = *v8;
          unint64_t v105 = *(void *)&v4[v104];
          if (v105 == -1 || v105 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v106 = *(unsigned char *)(*(void *)&v4[*v11] + v105);
            *(void *)&v4[v104] = v105 + 1;
            v23 |= (unint64_t)(v106 & 0x7F) << v102;
            if (v106 < 0)
            {
              v102 += 7;
              BOOL v18 = v103++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_554;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_554:
        uint64_t v361 = 152;
        goto LABEL_756;
      case 0x12u:
        char v107 = 0;
        unsigned int v108 = 0;
        uint64_t v23 = 0;
        v5->_hasLastVolMediaPrct = 1;
        while (2)
        {
          uint64_t v109 = *v8;
          unint64_t v110 = *(void *)&v4[v109];
          if (v110 == -1 || v110 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v111 = *(unsigned char *)(*(void *)&v4[*v11] + v110);
            *(void *)&v4[v109] = v110 + 1;
            v23 |= (unint64_t)(v111 & 0x7F) << v107;
            if (v111 < 0)
            {
              v107 += 7;
              BOOL v18 = v108++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_558;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_558:
        uint64_t v361 = 156;
        goto LABEL_756;
      case 0x13u:
        char v112 = 0;
        unsigned int v113 = 0;
        uint64_t v23 = 0;
        v5->_hasLastETelephonydBA = 1;
        while (2)
        {
          uint64_t v114 = *v8;
          unint64_t v115 = *(void *)&v4[v114];
          if (v115 == -1 || v115 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v116 = *(unsigned char *)(*(void *)&v4[*v11] + v115);
            *(void *)&v4[v114] = v115 + 1;
            v23 |= (unint64_t)(v116 & 0x7F) << v112;
            if (v116 < 0)
            {
              v112 += 7;
              BOOL v18 = v113++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_562;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_562:
        uint64_t v361 = 160;
        goto LABEL_756;
      case 0x14u:
        char v117 = 0;
        unsigned int v118 = 0;
        uint64_t v23 = 0;
        v5->_hasLastVolTelephonyPrct = 1;
        while (2)
        {
          uint64_t v119 = *v8;
          unint64_t v120 = *(void *)&v4[v119];
          if (v120 == -1 || v120 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v121 = *(unsigned char *)(*(void *)&v4[*v11] + v120);
            *(void *)&v4[v119] = v120 + 1;
            v23 |= (unint64_t)(v121 & 0x7F) << v117;
            if (v121 < 0)
            {
              v117 += 7;
              BOOL v18 = v118++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_566;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_566:
        uint64_t v361 = 164;
        goto LABEL_756;
      case 0x15u:
        char v122 = 0;
        unsigned int v123 = 0;
        uint64_t v23 = 0;
        v5->_hasLastESiridBA = 1;
        while (2)
        {
          uint64_t v124 = *v8;
          unint64_t v125 = *(void *)&v4[v124];
          if (v125 == -1 || v125 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v126 = *(unsigned char *)(*(void *)&v4[*v11] + v125);
            *(void *)&v4[v124] = v125 + 1;
            v23 |= (unint64_t)(v126 & 0x7F) << v122;
            if (v126 < 0)
            {
              v122 += 7;
              BOOL v18 = v123++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_570;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_570:
        uint64_t v361 = 168;
        goto LABEL_756;
      case 0x16u:
        char v127 = 0;
        unsigned int v128 = 0;
        uint64_t v23 = 0;
        v5->_hasLastVolSiriPrct = 1;
        while (2)
        {
          uint64_t v129 = *v8;
          unint64_t v130 = *(void *)&v4[v129];
          if (v130 == -1 || v130 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v131 = *(unsigned char *)(*(void *)&v4[*v11] + v130);
            *(void *)&v4[v129] = v130 + 1;
            v23 |= (unint64_t)(v131 & 0x7F) << v127;
            if (v131 < 0)
            {
              v127 += 7;
              BOOL v18 = v128++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_574;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_574:
        uint64_t v361 = 172;
        goto LABEL_756;
      case 0x17u:
        char v132 = 0;
        unsigned int v133 = 0;
        uint64_t v23 = 0;
        v5->_hasSmoothEae = 1;
        while (2)
        {
          uint64_t v134 = *v8;
          unint64_t v135 = *(void *)&v4[v134];
          if (v135 == -1 || v135 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v136 = *(unsigned char *)(*(void *)&v4[*v11] + v135);
            *(void *)&v4[v134] = v135 + 1;
            v23 |= (unint64_t)(v136 & 0x7F) << v132;
            if (v136 < 0)
            {
              v132 += 7;
              BOOL v18 = v133++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_578;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_578:
        uint64_t v361 = 176;
        goto LABEL_756;
      case 0x18u:
        char v137 = 0;
        unsigned int v138 = 0;
        uint64_t v23 = 0;
        v5->_hasDesiredDeltaE = 1;
        while (2)
        {
          uint64_t v139 = *v8;
          unint64_t v140 = *(void *)&v4[v139];
          if (v140 == -1 || v140 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v141 = *(unsigned char *)(*(void *)&v4[*v11] + v140);
            *(void *)&v4[v139] = v140 + 1;
            v23 |= (unint64_t)(v141 & 0x7F) << v137;
            if (v141 < 0)
            {
              v137 += 7;
              BOOL v18 = v138++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_582;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_582:
        uint64_t v361 = 180;
        goto LABEL_756;
      case 0x19u:
        char v142 = 0;
        unsigned int v143 = 0;
        uint64_t v23 = 0;
        v5->_hasPredVolMediaPrct = 1;
        while (2)
        {
          uint64_t v144 = *v8;
          unint64_t v145 = *(void *)&v4[v144];
          if (v145 == -1 || v145 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v146 = *(unsigned char *)(*(void *)&v4[*v11] + v145);
            *(void *)&v4[v144] = v145 + 1;
            v23 |= (unint64_t)(v146 & 0x7F) << v142;
            if (v146 < 0)
            {
              v142 += 7;
              BOOL v18 = v143++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_586;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_586:
        uint64_t v361 = 184;
        goto LABEL_756;
      case 0x1Au:
        char v147 = 0;
        unsigned int v148 = 0;
        uint64_t v23 = 0;
        v5->_hasPredVolTelephonyPrct = 1;
        while (2)
        {
          uint64_t v149 = *v8;
          unint64_t v150 = *(void *)&v4[v149];
          if (v150 == -1 || v150 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v151 = *(unsigned char *)(*(void *)&v4[*v11] + v150);
            *(void *)&v4[v149] = v150 + 1;
            v23 |= (unint64_t)(v151 & 0x7F) << v147;
            if (v151 < 0)
            {
              v147 += 7;
              BOOL v18 = v148++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_590;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_590:
        uint64_t v361 = 188;
        goto LABEL_756;
      case 0x1Bu:
        char v152 = 0;
        unsigned int v153 = 0;
        uint64_t v23 = 0;
        v5->_hasPredVolSiriPrct = 1;
        while (2)
        {
          uint64_t v154 = *v8;
          unint64_t v155 = *(void *)&v4[v154];
          if (v155 == -1 || v155 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v156 = *(unsigned char *)(*(void *)&v4[*v11] + v155);
            *(void *)&v4[v154] = v155 + 1;
            v23 |= (unint64_t)(v156 & 0x7F) << v152;
            if (v156 < 0)
            {
              v152 += 7;
              BOOL v18 = v153++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_594;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_594:
        uint64_t v361 = 192;
        goto LABEL_756;
      case 0x1Cu:
        char v157 = 0;
        unsigned int v158 = 0;
        uint64_t v23 = 0;
        v5->_hasOnStartPredictionFlag = 1;
        while (2)
        {
          uint64_t v159 = *v8;
          unint64_t v160 = *(void *)&v4[v159];
          if (v160 == -1 || v160 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v161 = *(unsigned char *)(*(void *)&v4[*v11] + v160);
            *(void *)&v4[v159] = v160 + 1;
            v23 |= (unint64_t)(v161 & 0x7F) << v157;
            if (v161 < 0)
            {
              v157 += 7;
              BOOL v18 = v158++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_598;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_598:
        uint64_t v361 = 196;
        goto LABEL_756;
      case 0x1Du:
        char v162 = 0;
        unsigned int v163 = 0;
        uint64_t v23 = 0;
        v5->_hasGuardrailsAvoidFlag = 1;
        while (2)
        {
          uint64_t v164 = *v8;
          unint64_t v165 = *(void *)&v4[v164];
          if (v165 == -1 || v165 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v166 = *(unsigned char *)(*(void *)&v4[*v11] + v165);
            *(void *)&v4[v164] = v165 + 1;
            v23 |= (unint64_t)(v166 & 0x7F) << v162;
            if (v166 < 0)
            {
              v162 += 7;
              BOOL v18 = v163++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_602;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_602:
        uint64_t v361 = 200;
        goto LABEL_756;
      case 0x1Eu:
        char v167 = 0;
        unsigned int v168 = 0;
        uint64_t v23 = 0;
        v5->_hasMinMaxCutFlag = 1;
        while (2)
        {
          uint64_t v169 = *v8;
          unint64_t v170 = *(void *)&v4[v169];
          if (v170 == -1 || v170 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v171 = *(unsigned char *)(*(void *)&v4[*v11] + v170);
            *(void *)&v4[v169] = v170 + 1;
            v23 |= (unint64_t)(v171 & 0x7F) << v167;
            if (v171 < 0)
            {
              v167 += 7;
              BOOL v18 = v168++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_606;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_606:
        uint64_t v361 = 204;
        goto LABEL_756;
      case 0x1Fu:
        char v172 = 0;
        unsigned int v173 = 0;
        uint64_t v23 = 0;
        v5->_hasManualVolumeChangeFlag = 1;
        while (2)
        {
          uint64_t v174 = *v8;
          unint64_t v175 = *(void *)&v4[v174];
          if (v175 == -1 || v175 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v176 = *(unsigned char *)(*(void *)&v4[*v11] + v175);
            *(void *)&v4[v174] = v175 + 1;
            v23 |= (unint64_t)(v176 & 0x7F) << v172;
            if (v176 < 0)
            {
              v172 += 7;
              BOOL v18 = v173++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_610;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_610:
        uint64_t v361 = 208;
        goto LABEL_756;
      case 0x20u:
        char v177 = 0;
        unsigned int v178 = 0;
        uint64_t v23 = 0;
        v5->_hasBigWindowSize = 1;
        while (2)
        {
          uint64_t v179 = *v8;
          unint64_t v180 = *(void *)&v4[v179];
          if (v180 == -1 || v180 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v181 = *(unsigned char *)(*(void *)&v4[*v11] + v180);
            *(void *)&v4[v179] = v180 + 1;
            v23 |= (unint64_t)(v181 & 0x7F) << v177;
            if (v181 < 0)
            {
              v177 += 7;
              BOOL v18 = v178++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_614;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_614:
        uint64_t v361 = 212;
        goto LABEL_756;
      case 0x21u:
        char v182 = 0;
        unsigned int v183 = 0;
        uint64_t v23 = 0;
        v5->_hasSmallWindowSize = 1;
        while (2)
        {
          uint64_t v184 = *v8;
          unint64_t v185 = *(void *)&v4[v184];
          if (v185 == -1 || v185 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v186 = *(unsigned char *)(*(void *)&v4[*v11] + v185);
            *(void *)&v4[v184] = v185 + 1;
            v23 |= (unint64_t)(v186 & 0x7F) << v182;
            if (v186 < 0)
            {
              v182 += 7;
              BOOL v18 = v183++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_618;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_618:
        uint64_t v361 = 216;
        goto LABEL_756;
      case 0x22u:
        uint64_t v187 = PBReaderReadString();
        uint64_t v188 = 344;
        goto LABEL_255;
      case 0x23u:
        uint64_t v187 = PBReaderReadString();
        uint64_t v188 = 352;
LABEL_255:
        id v189 = *(Class *)((char *)&v5->super.super.isa + v188);
        *(Class *)((char *)&v5->super.super.isa + v188) = (Class)v187;

        goto LABEL_757;
      case 0x24u:
        char v190 = 0;
        unsigned int v191 = 0;
        uint64_t v23 = 0;
        v5->_hasAnchorVol = 1;
        while (2)
        {
          uint64_t v192 = *v8;
          unint64_t v193 = *(void *)&v4[v192];
          if (v193 == -1 || v193 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v194 = *(unsigned char *)(*(void *)&v4[*v11] + v193);
            *(void *)&v4[v192] = v193 + 1;
            v23 |= (unint64_t)(v194 & 0x7F) << v190;
            if (v194 < 0)
            {
              v190 += 7;
              BOOL v18 = v191++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_622;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_622:
        uint64_t v361 = 220;
        goto LABEL_756;
      case 0x25u:
        char v195 = 0;
        unsigned int v196 = 0;
        uint64_t v23 = 0;
        v5->_hasAnchorEnv = 1;
        while (2)
        {
          uint64_t v197 = *v8;
          unint64_t v198 = *(void *)&v4[v197];
          if (v198 == -1 || v198 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v199 = *(unsigned char *)(*(void *)&v4[*v11] + v198);
            *(void *)&v4[v197] = v198 + 1;
            v23 |= (unint64_t)(v199 & 0x7F) << v195;
            if (v199 < 0)
            {
              v195 += 7;
              BOOL v18 = v196++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_626;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_626:
        uint64_t v361 = 224;
        goto LABEL_756;
      case 0x26u:
        char v200 = 0;
        unsigned int v201 = 0;
        uint64_t v23 = 0;
        v5->_hasPersonalizationCoeff = 1;
        while (2)
        {
          uint64_t v202 = *v8;
          unint64_t v203 = *(void *)&v4[v202];
          if (v203 == -1 || v203 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v204 = *(unsigned char *)(*(void *)&v4[*v11] + v203);
            *(void *)&v4[v202] = v203 + 1;
            v23 |= (unint64_t)(v204 & 0x7F) << v200;
            if (v204 < 0)
            {
              v200 += 7;
              BOOL v18 = v201++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_630;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_630:
        uint64_t v361 = 228;
        goto LABEL_756;
      case 0x27u:
        char v205 = 0;
        unsigned int v206 = 0;
        uint64_t v23 = 0;
        v5->_hasUnsignedPredVolMediaPrct = 1;
        while (2)
        {
          uint64_t v207 = *v8;
          unint64_t v208 = *(void *)&v4[v207];
          if (v208 == -1 || v208 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v209 = *(unsigned char *)(*(void *)&v4[*v11] + v208);
            *(void *)&v4[v207] = v208 + 1;
            v23 |= (unint64_t)(v209 & 0x7F) << v205;
            if (v209 < 0)
            {
              v205 += 7;
              BOOL v18 = v206++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_634;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_634:
        uint64_t v361 = 232;
        goto LABEL_756;
      case 0x28u:
        char v210 = 0;
        unsigned int v211 = 0;
        uint64_t v23 = 0;
        v5->_hasUnsignedPredVolTelephonyPrct = 1;
        while (2)
        {
          uint64_t v212 = *v8;
          unint64_t v213 = *(void *)&v4[v212];
          if (v213 == -1 || v213 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v214 = *(unsigned char *)(*(void *)&v4[*v11] + v213);
            *(void *)&v4[v212] = v213 + 1;
            v23 |= (unint64_t)(v214 & 0x7F) << v210;
            if (v214 < 0)
            {
              v210 += 7;
              BOOL v18 = v211++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_638;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_638:
        uint64_t v361 = 236;
        goto LABEL_756;
      case 0x29u:
        char v215 = 0;
        unsigned int v216 = 0;
        uint64_t v23 = 0;
        v5->_hasUnsignedPredVolSiriPrct = 1;
        while (2)
        {
          uint64_t v217 = *v8;
          unint64_t v218 = *(void *)&v4[v217];
          if (v218 == -1 || v218 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v219 = *(unsigned char *)(*(void *)&v4[*v11] + v218);
            *(void *)&v4[v217] = v218 + 1;
            v23 |= (unint64_t)(v219 & 0x7F) << v215;
            if (v219 < 0)
            {
              v215 += 7;
              BOOL v18 = v216++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_642;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_642:
        uint64_t v361 = 240;
        goto LABEL_756;
      case 0x2Au:
        char v220 = 0;
        unsigned int v221 = 0;
        uint64_t v23 = 0;
        v5->_hasSingleBudFlag = 1;
        while (2)
        {
          uint64_t v222 = *v8;
          unint64_t v223 = *(void *)&v4[v222];
          if (v223 == -1 || v223 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v224 = *(unsigned char *)(*(void *)&v4[*v11] + v223);
            *(void *)&v4[v222] = v223 + 1;
            v23 |= (unint64_t)(v224 & 0x7F) << v220;
            if (v224 < 0)
            {
              v220 += 7;
              BOOL v18 = v221++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_646;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_646:
        uint64_t v361 = 244;
        goto LABEL_756;
      case 0x2Bu:
        char v225 = 0;
        unsigned int v226 = 0;
        uint64_t v23 = 0;
        v5->_hasCdEngagementFlag = 1;
        while (2)
        {
          uint64_t v227 = *v8;
          unint64_t v228 = *(void *)&v4[v227];
          if (v228 == -1 || v228 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v229 = *(unsigned char *)(*(void *)&v4[*v11] + v228);
            *(void *)&v4[v227] = v228 + 1;
            v23 |= (unint64_t)(v229 & 0x7F) << v225;
            if (v229 < 0)
            {
              v225 += 7;
              BOOL v18 = v226++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_650;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_650:
        uint64_t v361 = 248;
        goto LABEL_756;
      case 0x2Cu:
        char v230 = 0;
        unsigned int v231 = 0;
        uint64_t v23 = 0;
        v5->_hasActiveStreamFlag = 1;
        while (2)
        {
          uint64_t v232 = *v8;
          unint64_t v233 = *(void *)&v4[v232];
          if (v233 == -1 || v233 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v234 = *(unsigned char *)(*(void *)&v4[*v11] + v233);
            *(void *)&v4[v232] = v233 + 1;
            v23 |= (unint64_t)(v234 & 0x7F) << v230;
            if (v234 < 0)
            {
              v230 += 7;
              BOOL v18 = v231++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_654;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_654:
        uint64_t v361 = 252;
        goto LABEL_756;
      case 0x2Du:
        char v235 = 0;
        unsigned int v236 = 0;
        uint64_t v23 = 0;
        v5->_hasPvFeatureEnableFlag = 1;
        while (2)
        {
          uint64_t v237 = *v8;
          unint64_t v238 = *(void *)&v4[v237];
          if (v238 == -1 || v238 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v239 = *(unsigned char *)(*(void *)&v4[*v11] + v238);
            *(void *)&v4[v237] = v238 + 1;
            v23 |= (unint64_t)(v239 & 0x7F) << v235;
            if (v239 < 0)
            {
              v235 += 7;
              BOOL v18 = v236++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_658;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_658:
        uint64_t v361 = 256;
        goto LABEL_756;
      case 0x2Eu:
        char v240 = 0;
        unsigned int v241 = 0;
        uint64_t v242 = 0;
        uint64_t v243 = NSNumber;
        while (2)
        {
          uint64_t v244 = *v8;
          unint64_t v245 = *(void *)&v4[v244];
          if (v245 == -1 || v245 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v246 = *(unsigned char *)(*(void *)&v4[*v11] + v245);
            *(void *)&v4[v244] = v245 + 1;
            v242 |= (unint64_t)(v246 & 0x7F) << v240;
            if (v246 < 0)
            {
              v240 += 7;
              BOOL v18 = v241++ >= 9;
              if (v18)
              {
                uint64_t v247 = 0;
                goto LABEL_663;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          uint64_t v247 = 0;
        }
        else {
          uint64_t v247 = v242;
        }
LABEL_663:
        uint64_t v362 = [v243 numberWithUnsignedInt:v247];
        if (!v362) {
          goto LABEL_762;
        }
        uint64_t v363 = (void *)v362;
        id v364 = v6;
        goto LABEL_707;
      case 0x2Fu:
        char v248 = 0;
        unsigned int v249 = 0;
        uint64_t v23 = 0;
        v5->_hasWindStrength = 1;
        while (2)
        {
          uint64_t v250 = *v8;
          unint64_t v251 = *(void *)&v4[v250];
          if (v251 == -1 || v251 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v252 = *(unsigned char *)(*(void *)&v4[*v11] + v251);
            *(void *)&v4[v250] = v251 + 1;
            v23 |= (unint64_t)(v252 & 0x7F) << v248;
            if (v252 < 0)
            {
              v248 += 7;
              BOOL v18 = v249++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_668;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_668:
        uint64_t v361 = 260;
        goto LABEL_756;
      case 0x30u:
        char v253 = 0;
        unsigned int v254 = 0;
        uint64_t v23 = 0;
        v5->_hasWindProb = 1;
        while (2)
        {
          uint64_t v255 = *v8;
          unint64_t v256 = *(void *)&v4[v255];
          if (v256 == -1 || v256 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v257 = *(unsigned char *)(*(void *)&v4[*v11] + v256);
            *(void *)&v4[v255] = v256 + 1;
            v23 |= (unint64_t)(v257 & 0x7F) << v253;
            if (v257 < 0)
            {
              v253 += 7;
              BOOL v18 = v254++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_672;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_672:
        uint64_t v361 = 264;
        goto LABEL_756;
      case 0x31u:
        char v258 = 0;
        unsigned int v259 = 0;
        uint64_t v23 = 0;
        v5->_hasMediaType = 1;
        while (2)
        {
          uint64_t v260 = *v8;
          unint64_t v261 = *(void *)&v4[v260];
          if (v261 == -1 || v261 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v262 = *(unsigned char *)(*(void *)&v4[*v11] + v261);
            *(void *)&v4[v260] = v261 + 1;
            v23 |= (unint64_t)(v262 & 0x7F) << v258;
            if (v262 < 0)
            {
              v258 += 7;
              BOOL v18 = v259++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_676;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_676:
        uint64_t v361 = 268;
        goto LABEL_756;
      case 0x32u:
        char v263 = 0;
        unsigned int v264 = 0;
        uint64_t v23 = 0;
        v5->_hasSourceActivity = 1;
        while (2)
        {
          uint64_t v265 = *v8;
          unint64_t v266 = *(void *)&v4[v265];
          if (v266 == -1 || v266 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v267 = *(unsigned char *)(*(void *)&v4[*v11] + v266);
            *(void *)&v4[v265] = v266 + 1;
            v23 |= (unint64_t)(v267 & 0x7F) << v263;
            if (v267 < 0)
            {
              v263 += 7;
              BOOL v18 = v264++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_680;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_680:
        uint64_t v361 = 272;
        goto LABEL_756;
      case 0x33u:
        char v268 = 0;
        unsigned int v269 = 0;
        uint64_t v23 = 0;
        v5->_hasBudActivity = 1;
        while (2)
        {
          uint64_t v270 = *v8;
          unint64_t v271 = *(void *)&v4[v270];
          if (v271 == -1 || v271 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v272 = *(unsigned char *)(*(void *)&v4[*v11] + v271);
            *(void *)&v4[v270] = v271 + 1;
            v23 |= (unint64_t)(v272 & 0x7F) << v268;
            if (v272 < 0)
            {
              v268 += 7;
              BOOL v18 = v269++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_684;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_684:
        uint64_t v361 = 276;
        goto LABEL_756;
      case 0x34u:
        char v273 = 0;
        unsigned int v274 = 0;
        uint64_t v23 = 0;
        v5->_hasLocation = 1;
        while (2)
        {
          uint64_t v275 = *v8;
          unint64_t v276 = *(void *)&v4[v275];
          if (v276 == -1 || v276 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v277 = *(unsigned char *)(*(void *)&v4[*v11] + v276);
            *(void *)&v4[v275] = v276 + 1;
            v23 |= (unint64_t)(v277 & 0x7F) << v273;
            if (v277 < 0)
            {
              v273 += 7;
              BOOL v18 = v274++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_688;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_688:
        uint64_t v361 = 280;
        goto LABEL_756;
      case 0x35u:
        char v278 = 0;
        unsigned int v279 = 0;
        uint64_t v23 = 0;
        v5->_hasLocationType = 1;
        while (2)
        {
          uint64_t v280 = *v8;
          unint64_t v281 = *(void *)&v4[v280];
          if (v281 == -1 || v281 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v282 = *(unsigned char *)(*(void *)&v4[*v11] + v281);
            *(void *)&v4[v280] = v281 + 1;
            v23 |= (unint64_t)(v282 & 0x7F) << v278;
            if (v282 < 0)
            {
              v278 += 7;
              BOOL v18 = v279++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_692;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_692:
        uint64_t v361 = 284;
        goto LABEL_756;
      case 0x36u:
        char v283 = 0;
        unsigned int v284 = 0;
        uint64_t v23 = 0;
        v5->_hasFocusMode = 1;
        while (2)
        {
          uint64_t v285 = *v8;
          unint64_t v286 = *(void *)&v4[v285];
          if (v286 == -1 || v286 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v287 = *(unsigned char *)(*(void *)&v4[*v11] + v286);
            *(void *)&v4[v285] = v286 + 1;
            v23 |= (unint64_t)(v287 & 0x7F) << v283;
            if (v287 < 0)
            {
              v283 += 7;
              BOOL v18 = v284++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_696;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_696:
        uint64_t v361 = 288;
        goto LABEL_756;
      case 0x37u:
        char v288 = 0;
        unsigned int v289 = 0;
        uint64_t v23 = 0;
        v5->_hasStreamingAppBundleId = 1;
        while (2)
        {
          uint64_t v290 = *v8;
          unint64_t v291 = *(void *)&v4[v290];
          if (v291 == -1 || v291 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v292 = *(unsigned char *)(*(void *)&v4[*v11] + v291);
            *(void *)&v4[v290] = v291 + 1;
            v23 |= (unint64_t)(v292 & 0x7F) << v288;
            if (v292 < 0)
            {
              v288 += 7;
              BOOL v18 = v289++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_700;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_700:
        uint64_t v361 = 292;
        goto LABEL_756;
      case 0x38u:
        char v293 = 0;
        unsigned int v294 = 0;
        uint64_t v295 = 0;
        uint64_t v296 = NSNumber;
        while (2)
        {
          uint64_t v297 = *v8;
          unint64_t v298 = *(void *)&v4[v297];
          if (v298 == -1 || v298 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v299 = *(unsigned char *)(*(void *)&v4[*v11] + v298);
            *(void *)&v4[v297] = v298 + 1;
            v295 |= (unint64_t)(v299 & 0x7F) << v293;
            if (v299 < 0)
            {
              v293 += 7;
              BOOL v18 = v294++ >= 9;
              if (v18)
              {
                uint64_t v300 = 0;
                goto LABEL_705;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          uint64_t v300 = 0;
        }
        else {
          uint64_t v300 = v295;
        }
LABEL_705:
        uint64_t v365 = [v296 numberWithUnsignedInt:v300];
        if (v365)
        {
          uint64_t v363 = (void *)v365;
          id v364 = v7;
LABEL_707:
          [v364 addObject:v363];

LABEL_757:
          if (*(void *)&v4[*v8] >= *(void *)&v4[*v9]) {
            goto LABEL_758;
          }
          continue;
        }
LABEL_762:

LABEL_759:
        uint64_t v371 = 0;
LABEL_761:

        return v371;
      case 0x39u:
        char v301 = 0;
        unsigned int v302 = 0;
        uint64_t v23 = 0;
        v5->_hasInstdBA = 1;
        while (2)
        {
          uint64_t v303 = *v8;
          unint64_t v304 = *(void *)&v4[v303];
          if (v304 == -1 || v304 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v305 = *(unsigned char *)(*(void *)&v4[*v11] + v304);
            *(void *)&v4[v303] = v304 + 1;
            v23 |= (unint64_t)(v305 & 0x7F) << v301;
            if (v305 < 0)
            {
              v301 += 7;
              BOOL v18 = v302++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_711;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_711:
        uint64_t v361 = 296;
        goto LABEL_756;
      case 0x3Au:
        char v306 = 0;
        unsigned int v307 = 0;
        uint64_t v23 = 0;
        v5->_hasInstdBC = 1;
        while (2)
        {
          uint64_t v308 = *v8;
          unint64_t v309 = *(void *)&v4[v308];
          if (v309 == -1 || v309 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v310 = *(unsigned char *)(*(void *)&v4[*v11] + v309);
            *(void *)&v4[v308] = v309 + 1;
            v23 |= (unint64_t)(v310 & 0x7F) << v306;
            if (v310 < 0)
            {
              v306 += 7;
              BOOL v18 = v307++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_715;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_715:
        uint64_t v361 = 300;
        goto LABEL_756;
      case 0x3Bu:
        char v311 = 0;
        unsigned int v312 = 0;
        uint64_t v23 = 0;
        v5->_hasNonCAListeningMode = 1;
        while (2)
        {
          uint64_t v313 = *v8;
          unint64_t v314 = *(void *)&v4[v313];
          if (v314 == -1 || v314 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v315 = *(unsigned char *)(*(void *)&v4[*v11] + v314);
            *(void *)&v4[v313] = v314 + 1;
            v23 |= (unint64_t)(v315 & 0x7F) << v311;
            if (v315 < 0)
            {
              v311 += 7;
              BOOL v18 = v312++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_719;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_719:
        uint64_t v361 = 304;
        goto LABEL_756;
      case 0x3Cu:
        char v316 = 0;
        unsigned int v317 = 0;
        uint64_t v23 = 0;
        v5->_hasFit = 1;
        while (2)
        {
          uint64_t v318 = *v8;
          unint64_t v319 = *(void *)&v4[v318];
          if (v319 == -1 || v319 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v320 = *(unsigned char *)(*(void *)&v4[*v11] + v319);
            *(void *)&v4[v318] = v319 + 1;
            v23 |= (unint64_t)(v320 & 0x7F) << v316;
            if (v320 < 0)
            {
              v316 += 7;
              BOOL v18 = v317++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_723;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_723:
        uint64_t v361 = 308;
        goto LABEL_756;
      case 0x3Du:
        char v321 = 0;
        unsigned int v322 = 0;
        uint64_t v23 = 0;
        v5->_hasFixedAutoAncGain = 1;
        while (2)
        {
          uint64_t v323 = *v8;
          unint64_t v324 = *(void *)&v4[v323];
          if (v324 == -1 || v324 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v325 = *(unsigned char *)(*(void *)&v4[*v11] + v324);
            *(void *)&v4[v323] = v324 + 1;
            v23 |= (unint64_t)(v325 & 0x7F) << v321;
            if (v325 < 0)
            {
              v321 += 7;
              BOOL v18 = v322++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_727;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_727:
        uint64_t v361 = 312;
        goto LABEL_756;
      case 0x3Eu:
        char v326 = 0;
        unsigned int v327 = 0;
        uint64_t v23 = 0;
        v5->_hasAdjustedAutoAncGain = 1;
        while (2)
        {
          uint64_t v328 = *v8;
          unint64_t v329 = *(void *)&v4[v328];
          if (v329 == -1 || v329 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v330 = *(unsigned char *)(*(void *)&v4[*v11] + v329);
            *(void *)&v4[v328] = v329 + 1;
            v23 |= (unint64_t)(v330 & 0x7F) << v326;
            if (v330 < 0)
            {
              v326 += 7;
              BOOL v18 = v327++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_731;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_731:
        uint64_t v361 = 316;
        goto LABEL_756;
      case 0x3Fu:
        char v331 = 0;
        unsigned int v332 = 0;
        uint64_t v23 = 0;
        v5->_hasTimestamp = 1;
        while (2)
        {
          uint64_t v333 = *v8;
          unint64_t v334 = *(void *)&v4[v333];
          if (v334 == -1 || v334 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v335 = *(unsigned char *)(*(void *)&v4[*v11] + v334);
            *(void *)&v4[v333] = v334 + 1;
            v23 |= (unint64_t)(v335 & 0x7F) << v331;
            if (v335 < 0)
            {
              v331 += 7;
              BOOL v18 = v332++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_735;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_735:
        uint64_t v361 = 320;
        goto LABEL_756;
      case 0x40u:
        char v336 = 0;
        unsigned int v337 = 0;
        uint64_t v23 = 0;
        v5->_hasDRCenablementBit = 1;
        while (2)
        {
          uint64_t v338 = *v8;
          unint64_t v339 = *(void *)&v4[v338];
          if (v339 == -1 || v339 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v340 = *(unsigned char *)(*(void *)&v4[*v11] + v339);
            *(void *)&v4[v338] = v339 + 1;
            v23 |= (unint64_t)(v340 & 0x7F) << v336;
            if (v340 < 0)
            {
              v336 += 7;
              BOOL v18 = v337++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_739;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_739:
        uint64_t v361 = 324;
        goto LABEL_756;
      case 0x41u:
        char v341 = 0;
        unsigned int v342 = 0;
        uint64_t v23 = 0;
        v5->_hasDRCwindFlag = 1;
        while (2)
        {
          uint64_t v343 = *v8;
          unint64_t v344 = *(void *)&v4[v343];
          if (v344 == -1 || v344 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v345 = *(unsigned char *)(*(void *)&v4[*v11] + v344);
            *(void *)&v4[v343] = v344 + 1;
            v23 |= (unint64_t)(v345 & 0x7F) << v341;
            if (v345 < 0)
            {
              v341 += 7;
              BOOL v18 = v342++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_743;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_743:
        uint64_t v361 = 328;
        goto LABEL_756;
      case 0x42u:
        char v346 = 0;
        unsigned int v347 = 0;
        uint64_t v23 = 0;
        v5->_hasDRCappSelfVoiceFlag = 1;
        while (2)
        {
          uint64_t v348 = *v8;
          unint64_t v349 = *(void *)&v4[v348];
          if (v349 == -1 || v349 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v350 = *(unsigned char *)(*(void *)&v4[*v11] + v349);
            *(void *)&v4[v348] = v349 + 1;
            v23 |= (unint64_t)(v350 & 0x7F) << v346;
            if (v350 < 0)
            {
              v346 += 7;
              BOOL v18 = v347++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_747;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_747:
        uint64_t v361 = 332;
        goto LABEL_756;
      case 0x43u:
        char v351 = 0;
        unsigned int v352 = 0;
        uint64_t v23 = 0;
        v5->_hasDrumDRC = 1;
        while (2)
        {
          uint64_t v353 = *v8;
          unint64_t v354 = *(void *)&v4[v353];
          if (v354 == -1 || v354 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v355 = *(unsigned char *)(*(void *)&v4[*v11] + v354);
            *(void *)&v4[v353] = v354 + 1;
            v23 |= (unint64_t)(v355 & 0x7F) << v351;
            if (v355 < 0)
            {
              v351 += 7;
              BOOL v18 = v352++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_751;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_751:
        uint64_t v361 = 336;
        goto LABEL_756;
      case 0x44u:
        char v356 = 0;
        unsigned int v357 = 0;
        uint64_t v23 = 0;
        v5->_hasRoutedDRCGain = 1;
        while (2)
        {
          uint64_t v358 = *v8;
          unint64_t v359 = *(void *)&v4[v358];
          if (v359 == -1 || v359 >= *(void *)&v4[*v9])
          {
            v4[*v10] = 1;
          }
          else
          {
            char v360 = *(unsigned char *)(*(void *)&v4[*v11] + v359);
            *(void *)&v4[v358] = v359 + 1;
            v23 |= (unint64_t)(v360 & 0x7F) << v356;
            if (v360 < 0)
            {
              v356 += 7;
              BOOL v18 = v357++ >= 9;
              if (v18)
              {
                LODWORD(v23) = 0;
                goto LABEL_755;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v10]) {
          LODWORD(v23) = 0;
        }
LABEL_755:
        uint64_t v361 = 340;
LABEL_756:
        *(_DWORD *)((char *)&v5->super.super.isa + v361) = v23;
        goto LABEL_757;
      default:
        if (!PBReaderSkipValueWithTag()) {
          goto LABEL_762;
        }
        goto LABEL_757;
    }
  }
}

- (NSString)description
{
  id v18 = [NSString alloc];
  unint64_t v70 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume controllerVersion](self, "controllerVersion"));
  unsigned int v73 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume refMicdBA](self, "refMicdBA"));
  char v72 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume refMicdBC](self, "refMicdBC"));
  char v71 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume drumdBA](self, "drumdBA"));
  char v66 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume drumdBK](self, "drumdBK"));
  uint64_t v69 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume drumdBAPredicted](self, "drumdBAPredicted"));
  unsigned int v68 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume downlinkdBA](self, "downlinkdBA"));
  char v67 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume currentVolumePrct](self, "currentVolumePrct"));
  unsigned int v63 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastUserVolChangeType](self, "lastUserVolChangeType"));
  unint64_t v65 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume headphoneMode](self, "headphoneMode"));
  uint64_t v64 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume streamType](self, "streamType"));
  unint64_t v60 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume windSpeechAggressorFlag](self, "windSpeechAggressorFlag"));
  char v62 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume volumeChangeFlag](self, "volumeChangeFlag"));
  char v61 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume speechPresenceProbability](self, "speechPresenceProbability"));
  char v57 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceAdaptiveVolume personalizationParamSnr](self, "personalizationParamSnr"));
  uint64_t v59 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceAdaptiveVolume personalizationParamMistakes](self, "personalizationParamMistakes"));
  unsigned int v58 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastEMediadBA](self, "lastEMediadBA"));
  uint64_t v54 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastVolMediaPrct](self, "lastVolMediaPrct"));
  char v56 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastETelephonydBA](self, "lastETelephonydBA"));
  unint64_t v55 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastVolTelephonyPrct](self, "lastVolTelephonyPrct"));
  char v51 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastESiridBA](self, "lastESiridBA"));
  unsigned int v53 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume lastVolSiriPrct](self, "lastVolSiriPrct"));
  char v52 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume smoothEae](self, "smoothEae"));
  unsigned int v48 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceAdaptiveVolume desiredDeltaE](self, "desiredDeltaE"));
  unint64_t v50 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceAdaptiveVolume predVolMediaPrct](self, "predVolMediaPrct"));
  uint64_t v49 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceAdaptiveVolume predVolTelephonyPrct](self, "predVolTelephonyPrct"));
  char v47 = objc_msgSend(NSNumber, "numberWithInt:", -[BMDeviceAdaptiveVolume predVolSiriPrct](self, "predVolSiriPrct"));
  uint64_t v44 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume onStartPredictionFlag](self, "onStartPredictionFlag"));
  char v46 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume guardrailsAvoidFlag](self, "guardrailsAvoidFlag"));
  unsigned int v43 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume minMaxCutFlag](self, "minMaxCutFlag"));
  unint64_t v45 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume manualVolumeChangeFlag](self, "manualVolumeChangeFlag"));
  unint64_t v40 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume bigWindowSize](self, "bigWindowSize"));
  char v42 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume smallWindowSize](self, "smallWindowSize"));
  unsigned int v38 = [(BMDeviceAdaptiveVolume *)self activeAppName];
  char v41 = [(BMDeviceAdaptiveVolume *)self activeAirpodsSerialNumber];
  char v37 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume anchorVol](self, "anchorVol"));
  uint64_t v39 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume anchorEnv](self, "anchorEnv"));
  uint64_t v34 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume personalizationCoeff](self, "personalizationCoeff"));
  char v36 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume unsignedPredVolMediaPrct](self, "unsignedPredVolMediaPrct"));
  char v32 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume unsignedPredVolTelephonyPrct](self, "unsignedPredVolTelephonyPrct"));
  unint64_t v35 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume unsignedPredVolSiriPrct](self, "unsignedPredVolSiriPrct"));
  unint64_t v30 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume singleBudFlag](self, "singleBudFlag"));
  unsigned int v33 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume cdEngagementFlag](self, "cdEngagementFlag"));
  unsigned int v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume activeStreamFlag](self, "activeStreamFlag"));
  char v31 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume pvFeatureEnableFlag](self, "pvFeatureEnableFlag"));
  char v17 = [(BMDeviceAdaptiveVolume *)self envSpectralData32B];
  uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume windStrength](self, "windStrength"));
  unint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume windProb](self, "windProb"));
  char v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume mediaType](self, "mediaType"));
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume sourceActivity](self, "sourceActivity"));
  char v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume budActivity](self, "budActivity"));
  unint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume location](self, "location"));
  uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume locationType](self, "locationType"));
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume focusMode](self, "focusMode"));
  unint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume streamingAppBundleId](self, "streamingAppBundleId"));
  unsigned int v22 = [(BMDeviceAdaptiveVolume *)self noiseType4B];
  unsigned int v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume instdBA](self, "instdBA"));
  char v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume instdBC](self, "instdBC"));
  long long v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume nonCAListeningMode](self, "nonCAListeningMode"));
  char v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume fit](self, "fit"));
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume fixedAutoAncGain](self, "fixedAutoAncGain"));
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume adjustedAutoAncGain](self, "adjustedAutoAncGain"));
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume timestamp](self, "timestamp"));
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume DRCenablementBit](self, "DRCenablementBit"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume DRCwindFlag](self, "DRCwindFlag"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume DRCappSelfVoiceFlag](self, "DRCappSelfVoiceFlag"));
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume drumDRC](self, "drumDRC"));
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDeviceAdaptiveVolume routedDRCGain](self, "routedDRCGain"));
  id v19 = (id)objc_msgSend(v18, "initWithFormat:", @"BMDeviceAdaptiveVolume with controllerVersion: %@, refMicdBA: %@, refMicdBC: %@, drumdBA: %@, drumdBK: %@, drumdBAPredicted: %@, downlinkdBA: %@, currentVolumePrct: %@, lastUserVolChangeType: %@, headphoneMode: %@, streamType: %@, windSpeechAggressorFlag: %@, volumeChangeFlag: %@, speechPresenceProbability: %@, personalizationParamSnr: %@, personalizationParamMistakes: %@, lastEMediadBA: %@, lastVolMediaPrct: %@, lastETelephonydBA: %@, lastVolTelephonyPrct: %@, lastESiridBA: %@, lastVolSiriPrct: %@, smoothEae: %@, desiredDeltaE: %@, predVolMediaPrct: %@, predVolTelephonyPrct: %@, predVolSiriPrct: %@, onStartPredictionFlag: %@, guardrailsAvoidFlag: %@, minMaxCutFlag: %@, manualVolumeChangeFlag: %@, bigWindowSize: %@, smallWindowSize: %@, activeAppName: %@, activeAirpodsSerialNumber: %@, anchorVol: %@, anchorEnv: %@, personalizationCoeff: %@, unsignedPredVolMediaPrct: %@, unsignedPredVolTelephonyPrct: %@, unsignedPredVolSiriPrct: %@, singleBudFlag: %@, cdEngagementFlag: %@, activeStreamFlag: %@, pvFeatureEnableFlag: %@, envSpectralData32B: %@, windStrength: %@, windProb: %@, mediaType: %@, sourceActivity: %@, budActivity: %@, location: %@, locationType: %@, focusMode: %@, streamingAppBundleId: %@, noiseType4B: %@, instdBA: %@, instdBC: %@, nonCAListeningMode: %@, fit: %@, fixedAutoAncGain: %@, adjustedAutoAncGain: %@, timestamp: %@, DRCenablementBit: %@, DRCwindFlag: %@, DRCappSelfVoiceFlag: %@, drumDRC: %@, routedDRCGain: %@", v70, v73, v72, v71, v66, v69, v68, v67, v63, v65, v64, v60, v62, v61, v57, v59,
              v58,
              v54,
              v56,
              v55,
              v51,
              v53,
              v52,
              v48,
              v50,
              v49,
              v47,
              v44,
              v46,
              v43,
              v45,
              v40,
              v42,
              v38,
              v41,
              v37,
              v39,
              v34,
              v36,
              v32,
              v35,
              v30,
              v33,
              v28,
              v31,
              v17,
              v29,
              v16,
              v27,
              v15,
              v26,
              v25,
              v24,
              v23,
              v14,
              v22,
              v13,
              v21,
              v20,
              v12);

  return (NSString *)v19;
}

- (BMDeviceAdaptiveVolume)initWithControllerVersion:(void *)a3 refMicdBA:(void *)a4 refMicdBC:(void *)a5 drumdBA:(void *)a6 drumdBK:(void *)a7 drumdBAPredicted:(void *)a8 downlinkdBA:(id)a9 currentVolumePrct:(id)a10 lastUserVolChangeType:(id)a11 headphoneMode:(id)a12 streamType:(id)a13 windSpeechAggressorFlag:(id)a14 volumeChangeFlag:(id)a15 speechPresenceProbability:(id)a16 personalizationParamSnr:(id)a17 personalizationParamMistakes:(id)a18 lastEMediadBA:(id)a19 lastVolMediaPrct:(id)a20 lastETelephonydBA:(id)a21 lastVolTelephonyPrct:(id)a22 lastESiridBA:(id)a23 lastVolSiriPrct:(id)a24 smoothEae:(id)a25 desiredDeltaE:(id)a26 predVolMediaPrct:(id)a27 predVolTelephonyPrct:(id)a28 predVolSiriPrct:(id)a29 onStartPredictionFlag:(id)a30 guardrailsAvoidFlag:(id)a31 minMaxCutFlag:(id)a32 manualVolumeChangeFlag:(id)a33 bigWindowSize:(id)a34 smallWindowSize:(id)a35 activeAppName:(id)a36 activeAirpodsSerialNumber:(id)a37 anchorVol:(id)a38 anchorEnv:(id)a39 personalizationCoeff:(id)a40 unsignedPredVolMediaPrct:(id)a41 unsignedPredVolTelephonyPrct:(id)a42 unsignedPredVolSiriPrct:(id)a43 singleBudFlag:(id)a44 cdEngagementFlag:(id)a45 activeStreamFlag:(id)a46 pvFeatureEnableFlag:(id)a47 envSpectralData32B:(id)a48 windStrength:(id)a49 windProb:(id)a50 mediaType:(id)a51 sourceActivity:(id)a52 budActivity:(id)a53 location:(id)a54 locationType:(id)a55 focusMode:(id)a56 streamingAppBundleId:(id)a57 noiseType4B:(id)a58 instdBA:(id)a59 instdBC:(id)a60 nonCAListeningMode:(id)a61 fit:(id)a62 fixedAutoAncGain:(id)a63 adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:routedDRCGain:
{
  id v208 = a3;
  id v209 = a4;
  id v210 = a5;
  id v207 = a6;
  id v205 = a7;
  id v203 = a8;
  id v201 = a9;
  id v200 = a10;
  id v199 = a11;
  id v198 = a12;
  id v197 = a13;
  id v196 = a14;
  id v195 = a15;
  id v194 = a16;
  id v193 = a17;
  id v192 = a18;
  id v191 = a19;
  id v190 = a20;
  id v189 = a21;
  id v188 = a22;
  id v187 = a23;
  id v186 = a24;
  id v185 = a25;
  id v184 = a26;
  id v183 = a27;
  id v182 = a28;
  id v181 = a29;
  id v180 = a30;
  id v179 = a31;
  id v178 = a32;
  id v177 = a33;
  id v176 = a34;
  id v175 = a35;
  id v152 = a36;
  id v151 = a37;
  id v174 = a38;
  id v173 = a39;
  id v172 = a40;
  id v171 = a41;
  id v170 = a42;
  id v169 = a43;
  id v168 = a44;
  id v167 = a45;
  id v166 = a46;
  id v165 = a47;
  id v150 = a48;
  id v164 = a49;
  id v163 = a50;
  id v162 = a51;
  id v161 = a52;
  id v160 = a53;
  id v159 = a54;
  id v158 = a55;
  id v72 = a56;
  id v157 = a57;
  id v149 = a58;
  id v156 = a59;
  id v155 = a60;
  id v154 = a61;
  id v153 = a62;
  id v73 = a63;
  id v74 = a64;
  id v75 = a65;
  id v76 = a66;
  id v77 = a67;
  id v78 = a68;
  id v79 = a69;
  id v80 = a70;
  v211.receiver = a1;
  v211.super_class = (Class)BMDeviceAdaptiveVolume;
  char v81 = [(BMEventBase *)&v211 init];

  if (v81)
  {
    v81->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v208)
    {
      v81->_hasControllerVersion = 1;
      unsigned int v82 = [v208 unsignedIntValue];
    }
    else
    {
      unsigned int v82 = 0;
      v81->_hasControllerVersion = 0;
    }
    v81->_controllerVersion = v82;
    if (v209)
    {
      v81->_hasRefMicdBA = 1;
      unsigned int v83 = [v209 unsignedIntValue];
    }
    else
    {
      unsigned int v83 = 0;
      v81->_hasRefMicdBA = 0;
    }
    v81->_refMicdBA = v83;
    if (v210)
    {
      v81->_hasRefMicdBC = 1;
      unsigned int v84 = [v210 unsignedIntValue];
    }
    else
    {
      unsigned int v84 = 0;
      v81->_hasRefMicdBC = 0;
    }
    v81->_refMicdBC = v84;
    if (v207)
    {
      v81->_hasDrumdBA = 1;
      unsigned int v85 = [v207 unsignedIntValue];
    }
    else
    {
      unsigned int v85 = 0;
      v81->_hasDrumdBA = 0;
    }
    v81->_drumdBA = v85;
    unsigned int v86 = v205;
    if (v205)
    {
      v81->_hasDrumdBK = 1;
      unsigned int v86 = [v205 unsignedIntValue];
    }
    else
    {
      v81->_hasDrumdBK = 0;
    }
    v81->_drumdBK = v86;
    unsigned int v87 = v203;
    if (v203)
    {
      v81->_hasDrumdBAPredicted = 1;
      unsigned int v87 = [v203 unsignedIntValue];
    }
    else
    {
      v81->_hasDrumdBAPredicted = 0;
    }
    v81->_drumdBAPredicted = v87;
    unsigned int v88 = v201;
    if (v201)
    {
      v81->_hasDownlinkdBA = 1;
      unsigned int v88 = [v201 unsignedIntValue];
    }
    else
    {
      v81->_hasDownlinkdBA = 0;
    }
    v81->_downlinkdBA = v88;
    unsigned int v89 = v200;
    if (v200)
    {
      v81->_hasCurrentVolumePrct = 1;
      unsigned int v89 = [v200 unsignedIntValue];
    }
    else
    {
      v81->_hasCurrentVolumePrct = 0;
    }
    v81->_currentVolumePrct = v89;
    unsigned int v90 = v199;
    if (v199)
    {
      v81->_hasLastUserVolChangeType = 1;
      unsigned int v90 = [v199 unsignedIntValue];
    }
    else
    {
      v81->_hasLastUserVolChangeType = 0;
    }
    v81->_lastUserVolChangeType = v90;
    unsigned int v91 = v198;
    if (v198)
    {
      v81->_hasHeadphoneMode = 1;
      unsigned int v91 = [v198 unsignedIntValue];
    }
    else
    {
      v81->_hasHeadphoneMode = 0;
    }
    v81->_headphoneMode = v91;
    unsigned int v92 = v197;
    if (v197)
    {
      v81->_hasStreamType = 1;
      unsigned int v92 = [v197 unsignedIntValue];
    }
    else
    {
      v81->_hasStreamType = 0;
    }
    v81->_streamType = v92;
    unsigned int v93 = v196;
    if (v196)
    {
      v81->_hasWindSpeechAggressorFlag = 1;
      unsigned int v93 = [v196 unsignedIntValue];
    }
    else
    {
      v81->_hasWindSpeechAggressorFlag = 0;
    }
    v81->_windSpeechAggressorFlag = v93;
    unsigned int v94 = v195;
    if (v195)
    {
      v81->_hasVolumeChangeFlag = 1;
      unsigned int v94 = [v195 unsignedIntValue];
    }
    else
    {
      v81->_hasVolumeChangeFlag = 0;
    }
    v81->_volumeChangeFlag = v94;
    unsigned int v95 = v194;
    if (v194)
    {
      v81->_hasSpeechPresenceProbability = 1;
      unsigned int v95 = [v194 unsignedIntValue];
    }
    else
    {
      v81->_hasSpeechPresenceProbability = 0;
    }
    v81->_speechPresenceProbability = v95;
    if (v193)
    {
      v81->_hasPersonalizationParamSnr = 1;
      int v96 = [v193 intValue];
    }
    else
    {
      v81->_hasPersonalizationParamSnr = 0;
      int v96 = -1;
    }
    v81->_personalizationParamSnr = v96;
    if (v192)
    {
      v81->_hasPersonalizationParamMistakes = 1;
      int v97 = [v192 intValue];
    }
    else
    {
      v81->_hasPersonalizationParamMistakes = 0;
      int v97 = -1;
    }
    v81->_personalizationParamMistakes = v97;
    unsigned int v98 = v191;
    if (v191)
    {
      v81->_hasLastEMediadBA = 1;
      unsigned int v98 = [v191 unsignedIntValue];
    }
    else
    {
      v81->_hasLastEMediadBA = 0;
    }
    v81->_lastEMediadBA = v98;
    unsigned int v99 = v190;
    if (v190)
    {
      v81->_hasLastVolMediaPrct = 1;
      unsigned int v99 = [v190 unsignedIntValue];
    }
    else
    {
      v81->_hasLastVolMediaPrct = 0;
    }
    v81->_lastVolMediaPrct = v99;
    unsigned int v100 = v189;
    if (v189)
    {
      v81->_hasLastETelephonydBA = 1;
      unsigned int v100 = [v189 unsignedIntValue];
    }
    else
    {
      v81->_hasLastETelephonydBA = 0;
    }
    v81->_lastETelephonydBA = v100;
    unsigned int v101 = v188;
    if (v188)
    {
      v81->_hasLastVolTelephonyPrct = 1;
      unsigned int v101 = [v188 unsignedIntValue];
    }
    else
    {
      v81->_hasLastVolTelephonyPrct = 0;
    }
    v81->_lastVolTelephonyPrct = v101;
    unsigned int v102 = v187;
    if (v187)
    {
      v81->_hasLastESiridBA = 1;
      unsigned int v102 = [v187 unsignedIntValue];
    }
    else
    {
      v81->_hasLastESiridBA = 0;
    }
    v81->_lastESiridBA = v102;
    unsigned int v103 = v186;
    if (v186)
    {
      v81->_hasLastVolSiriPrct = 1;
      unsigned int v103 = [v186 unsignedIntValue];
    }
    else
    {
      v81->_hasLastVolSiriPrct = 0;
    }
    v81->_lastVolSiriPrct = v103;
    unsigned int v104 = v185;
    if (v185)
    {
      v81->_hasSmoothEae = 1;
      unsigned int v104 = [v185 unsignedIntValue];
    }
    else
    {
      v81->_hasSmoothEae = 0;
    }
    v81->_smoothEae = v104;
    if (v184)
    {
      v81->_hasDesiredDeltaE = 1;
      int v105 = [v184 intValue];
    }
    else
    {
      v81->_hasDesiredDeltaE = 0;
      int v105 = -1;
    }
    v81->_desiredDeltaE = v105;
    if (v183)
    {
      v81->_hasPredVolMediaPrct = 1;
      int v106 = [v183 intValue];
    }
    else
    {
      v81->_hasPredVolMediaPrct = 0;
      int v106 = -1;
    }
    v81->_predVolMediaPrct = v106;
    if (v182)
    {
      v81->_hasPredVolTelephonyPrct = 1;
      int v107 = [v182 intValue];
    }
    else
    {
      v81->_hasPredVolTelephonyPrct = 0;
      int v107 = -1;
    }
    v81->_predVolTelephonyPrct = v107;
    if (v181)
    {
      v81->_hasPredVolSiriPrct = 1;
      int v108 = [v181 intValue];
    }
    else
    {
      v81->_hasPredVolSiriPrct = 0;
      int v108 = -1;
    }
    v81->_predVolSiriPrct = v108;
    unsigned int v109 = v180;
    if (v180)
    {
      v81->_hasOnStartPredictionFlag = 1;
      unsigned int v109 = [v180 unsignedIntValue];
    }
    else
    {
      v81->_hasOnStartPredictionFlag = 0;
    }
    v81->_onStartPredictionFlag = v109;
    unsigned int v110 = v179;
    if (v179)
    {
      v81->_hasGuardrailsAvoidFlag = 1;
      unsigned int v110 = [v179 unsignedIntValue];
    }
    else
    {
      v81->_hasGuardrailsAvoidFlag = 0;
    }
    v81->_guardrailsAvoidFlag = v110;
    unsigned int v111 = v178;
    if (v178)
    {
      v81->_hasMinMaxCutFlag = 1;
      unsigned int v111 = [v178 unsignedIntValue];
    }
    else
    {
      v81->_hasMinMaxCutFlag = 0;
    }
    v81->_minMaxCutFlag = v111;
    unsigned int v112 = v177;
    if (v177)
    {
      v81->_hasManualVolumeChangeFlag = 1;
      unsigned int v112 = [v177 unsignedIntValue];
    }
    else
    {
      v81->_hasManualVolumeChangeFlag = 0;
    }
    v81->_manualVolumeChangeFlag = v112;
    unsigned int v113 = v176;
    if (v176)
    {
      v81->_hasBigWindowSize = 1;
      unsigned int v113 = [v176 unsignedIntValue];
    }
    else
    {
      v81->_hasBigWindowSize = 0;
    }
    v81->_bigWindowSize = v113;
    unsigned int v114 = v175;
    if (v175)
    {
      v81->_hasSmallWindowSize = 1;
      unsigned int v114 = [v175 unsignedIntValue];
    }
    else
    {
      v81->_hasSmallWindowSize = 0;
    }
    v81->_smallWindowSize = v114;
    objc_storeStrong((id *)&v81->_activeAppName, a36);
    objc_storeStrong((id *)&v81->_activeAirpodsSerialNumber, a37);
    unsigned int v115 = v174;
    if (v174)
    {
      v81->_hasAnchorVol = 1;
      unsigned int v115 = [v174 unsignedIntValue];
    }
    else
    {
      v81->_hasAnchorVol = 0;
    }
    v81->_anchorVol = v115;
    unsigned int v116 = v173;
    if (v173)
    {
      v81->_hasAnchorEnv = 1;
      unsigned int v116 = [v173 unsignedIntValue];
    }
    else
    {
      v81->_hasAnchorEnv = 0;
    }
    v81->_anchorEnv = v116;
    unsigned int v117 = v172;
    if (v172)
    {
      v81->_hasPersonalizationCoeff = 1;
      unsigned int v117 = [v172 unsignedIntValue];
    }
    else
    {
      v81->_hasPersonalizationCoeff = 0;
    }
    v81->_personalizationCoeff = v117;
    unsigned int v118 = v171;
    if (v171)
    {
      v81->_hasUnsignedPredVolMediaPrct = 1;
      unsigned int v118 = [v171 unsignedIntValue];
    }
    else
    {
      v81->_hasUnsignedPredVolMediaPrct = 0;
    }
    v81->_unsignedPredVolMediaPrct = v118;
    unsigned int v119 = v170;
    if (v170)
    {
      v81->_hasUnsignedPredVolTelephonyPrct = 1;
      unsigned int v119 = [v170 unsignedIntValue];
    }
    else
    {
      v81->_hasUnsignedPredVolTelephonyPrct = 0;
    }
    v81->_unsignedPredVolTelephonyPrct = v119;
    unsigned int v120 = v169;
    if (v169)
    {
      v81->_hasUnsignedPredVolSiriPrct = 1;
      unsigned int v120 = [v169 unsignedIntValue];
    }
    else
    {
      v81->_hasUnsignedPredVolSiriPrct = 0;
    }
    v81->_unsignedPredVolSiriPrct = v120;
    unsigned int v121 = v168;
    if (v168)
    {
      v81->_hasSingleBudFlag = 1;
      unsigned int v121 = [v168 unsignedIntValue];
    }
    else
    {
      v81->_hasSingleBudFlag = 0;
    }
    v81->_singleBudFlag = v121;
    unsigned int v122 = v167;
    if (v167)
    {
      v81->_hasCdEngagementFlag = 1;
      unsigned int v122 = [v167 unsignedIntValue];
    }
    else
    {
      v81->_hasCdEngagementFlag = 0;
    }
    v81->_cdEngagementFlag = v122;
    unsigned int v123 = v166;
    if (v166)
    {
      v81->_hasActiveStreamFlag = 1;
      unsigned int v123 = [v166 unsignedIntValue];
    }
    else
    {
      v81->_hasActiveStreamFlag = 0;
    }
    v81->_activeStreamFlag = v123;
    unsigned int v124 = v165;
    if (v165)
    {
      v81->_hasPvFeatureEnableFlag = 1;
      unsigned int v124 = [v165 unsignedIntValue];
    }
    else
    {
      v81->_hasPvFeatureEnableFlag = 0;
    }
    v81->_pvFeatureEnableFlag = v124;
    objc_storeStrong((id *)&v81->_envSpectralData32B, a48);
    unsigned int v125 = v164;
    if (v164)
    {
      v81->_hasWindStrength = 1;
      unsigned int v125 = [v164 unsignedIntValue];
    }
    else
    {
      v81->_hasWindStrength = 0;
    }
    v81->_windStrength = v125;
    unsigned int v126 = v163;
    if (v163)
    {
      v81->_hasWindProb = 1;
      unsigned int v126 = [v163 unsignedIntValue];
    }
    else
    {
      v81->_hasWindProb = 0;
    }
    v81->_windProb = v126;
    unsigned int v127 = v162;
    if (v162)
    {
      v81->_hasMediaType = 1;
      unsigned int v127 = [v162 unsignedIntValue];
    }
    else
    {
      v81->_hasMediaType = 0;
    }
    v81->_mediaType = v127;
    unsigned int v128 = v161;
    if (v161)
    {
      v81->_hasSourceActivity = 1;
      unsigned int v128 = [v161 unsignedIntValue];
    }
    else
    {
      v81->_hasSourceActivity = 0;
    }
    v81->_sourceActivity = v128;
    unsigned int v129 = v160;
    if (v160)
    {
      v81->_hasBudActivity = 1;
      unsigned int v129 = [v160 unsignedIntValue];
    }
    else
    {
      v81->_hasBudActivity = 0;
    }
    v81->_budActivity = v129;
    unsigned int v130 = v159;
    if (v159)
    {
      v81->_hasLocation = 1;
      unsigned int v130 = [v159 unsignedIntValue];
    }
    else
    {
      v81->_hasLocation = 0;
    }
    v81->_location = v130;
    unsigned int v131 = v158;
    if (v158)
    {
      v81->_hasLocationType = 1;
      unsigned int v131 = [v158 unsignedIntValue];
    }
    else
    {
      v81->_hasLocationType = 0;
    }
    v81->_locationType = v131;
    if (v72)
    {
      v81->_hasFocusMode = 1;
      unsigned int v132 = [v72 unsignedIntValue];
    }
    else
    {
      unsigned int v132 = 0;
      v81->_hasFocusMode = 0;
    }
    v81->_focusMode = v132;
    unsigned int v133 = v157;
    if (v157)
    {
      v81->_hasStreamingAppBundleId = 1;
      unsigned int v133 = [v157 unsignedIntValue];
    }
    else
    {
      v81->_hasStreamingAppBundleId = 0;
    }
    v81->_streamingAppBundleId = v133;
    objc_storeStrong((id *)&v81->_noiseType4B, a58);
    unsigned int v134 = v156;
    if (v156)
    {
      v81->_hasInstdBA = 1;
      unsigned int v134 = [v156 unsignedIntValue];
    }
    else
    {
      v81->_hasInstdBA = 0;
    }
    v81->_instdBA = v134;
    unsigned int v135 = v155;
    if (v155)
    {
      v81->_hasInstdBC = 1;
      unsigned int v135 = [v155 unsignedIntValue];
    }
    else
    {
      v81->_hasInstdBC = 0;
    }
    v81->_instdBC = v135;
    unsigned int v136 = v154;
    if (v154)
    {
      v81->_hasNonCAListeningMode = 1;
      unsigned int v136 = [v154 unsignedIntValue];
    }
    else
    {
      v81->_hasNonCAListeningMode = 0;
    }
    v81->_nonCAListeningMode = v136;
    unsigned int v137 = v153;
    if (v153)
    {
      v81->_hasFit = 1;
      unsigned int v137 = [v153 unsignedIntValue];
    }
    else
    {
      v81->_hasFit = 0;
    }
    v81->_fit = v137;
    unsigned int v138 = v73;
    if (v73)
    {
      v81->_hasFixedAutoAncGain = 1;
      unsigned int v138 = [v73 unsignedIntValue];
    }
    else
    {
      v81->_hasFixedAutoAncGain = 0;
    }
    v81->_fixedAutoAncGain = v138;
    unsigned int v139 = v74;
    if (v74)
    {
      v81->_hasAdjustedAutoAncGain = 1;
      unsigned int v139 = [v74 unsignedIntValue];
    }
    else
    {
      v81->_hasAdjustedAutoAncGain = 0;
    }
    v81->_adjustedAutoAncGain = v139;
    unsigned int v140 = v75;
    if (v75)
    {
      v81->_hasTimestamp = 1;
      unsigned int v140 = [v75 unsignedIntValue];
    }
    else
    {
      v81->_hasTimestamp = 0;
    }
    v81->_timestamp = v140;
    if (v76)
    {
      v81->_hasDRCenablementBit = 1;
      unsigned int v141 = [v76 unsignedIntValue];
    }
    else
    {
      unsigned int v141 = 0;
      v81->_hasDRCenablementBit = 0;
    }
    v81->_DRCenablementBit = v141;
    if (v77)
    {
      v81->_hasDRCwindFlag = 1;
      unsigned int v142 = [v77 unsignedIntValue];
    }
    else
    {
      unsigned int v142 = 0;
      v81->_hasDRCwindFlag = 0;
    }
    v81->_DRCwindFlag = v142;
    if (v78)
    {
      v81->_hasDRCappSelfVoiceFlag = 1;
      unsigned int v143 = [v78 unsignedIntValue];
    }
    else
    {
      unsigned int v143 = 0;
      v81->_hasDRCappSelfVoiceFlag = 0;
    }
    v81->_DRCappSelfVoiceFlag = v143;
    if (v79)
    {
      v81->_hasDrumDRC = 1;
      unsigned int v144 = [v79 unsignedIntValue];
    }
    else
    {
      unsigned int v144 = 0;
      v81->_hasDrumDRC = 0;
    }
    v81->_drumDRC = v144;
    if (v80)
    {
      v81->_hasRoutedDRCGain = 1;
      unsigned int v145 = [v80 unsignedIntValue];
    }
    else
    {
      unsigned int v145 = 0;
      v81->_hasRoutedDRCGain = 0;
    }
    v81->_routedDRCGain = v145;
  }
  char v146 = v81;

  return v146;
}

+ (id)protoFields
{
  v72[68] = *MEMORY[0x1E4F143B8];
  char v71 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"controllerVersion" number:1 type:4 subMessageClass:0];
  v72[0] = v71;
  unint64_t v70 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"refMicdBA" number:2 type:4 subMessageClass:0];
  v72[1] = v70;
  uint64_t v69 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"refMicdBC" number:3 type:4 subMessageClass:0];
  v72[2] = v69;
  unsigned int v68 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"drumdBA" number:4 type:4 subMessageClass:0];
  v72[3] = v68;
  char v67 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"drumdBK" number:5 type:4 subMessageClass:0];
  v72[4] = v67;
  char v66 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"drumdBAPredicted" number:6 type:4 subMessageClass:0];
  v72[5] = v66;
  unint64_t v65 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"downlinkdBA" number:7 type:4 subMessageClass:0];
  v72[6] = v65;
  uint64_t v64 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"currentVolumePrct" number:8 type:4 subMessageClass:0];
  v72[7] = v64;
  unsigned int v63 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"lastUserVolChangeType" number:9 type:4 subMessageClass:0];
  v72[8] = v63;
  char v62 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"headphoneMode" number:10 type:4 subMessageClass:0];
  v72[9] = v62;
  char v61 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"streamType" number:11 type:4 subMessageClass:0];
  v72[10] = v61;
  unint64_t v60 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"windSpeechAggressorFlag" number:12 type:4 subMessageClass:0];
  v72[11] = v60;
  uint64_t v59 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"volumeChangeFlag" number:13 type:4 subMessageClass:0];
  v72[12] = v59;
  unsigned int v58 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"speechPresenceProbability" number:14 type:4 subMessageClass:0];
  v72[13] = v58;
  char v57 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"personalizationParamSnr" number:15 type:2 subMessageClass:0];
  v72[14] = v57;
  char v56 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"personalizationParamMistakes" number:16 type:2 subMessageClass:0];
  v72[15] = v56;
  unint64_t v55 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"lastEMediadBA" number:17 type:4 subMessageClass:0];
  v72[16] = v55;
  uint64_t v54 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"lastVolMediaPrct" number:18 type:4 subMessageClass:0];
  v72[17] = v54;
  unsigned int v53 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"lastETelephonydBA" number:19 type:4 subMessageClass:0];
  v72[18] = v53;
  char v52 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"lastVolTelephonyPrct" number:20 type:4 subMessageClass:0];
  v72[19] = v52;
  char v51 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"lastESiridBA" number:21 type:4 subMessageClass:0];
  v72[20] = v51;
  unint64_t v50 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"lastVolSiriPrct" number:22 type:4 subMessageClass:0];
  v72[21] = v50;
  uint64_t v49 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"smoothEae" number:23 type:4 subMessageClass:0];
  v72[22] = v49;
  unsigned int v48 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"desiredDeltaE" number:24 type:2 subMessageClass:0];
  v72[23] = v48;
  char v47 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"predVolMediaPrct" number:25 type:2 subMessageClass:0];
  v72[24] = v47;
  char v46 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"predVolTelephonyPrct" number:26 type:2 subMessageClass:0];
  v72[25] = v46;
  unint64_t v45 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"predVolSiriPrct" number:27 type:2 subMessageClass:0];
  v72[26] = v45;
  uint64_t v44 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"onStartPredictionFlag" number:28 type:4 subMessageClass:0];
  v72[27] = v44;
  unsigned int v43 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"guardrailsAvoidFlag" number:29 type:4 subMessageClass:0];
  v72[28] = v43;
  char v42 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"minMaxCutFlag" number:30 type:4 subMessageClass:0];
  v72[29] = v42;
  char v41 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"manualVolumeChangeFlag" number:31 type:4 subMessageClass:0];
  v72[30] = v41;
  unint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bigWindowSize" number:32 type:4 subMessageClass:0];
  v72[31] = v40;
  uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"smallWindowSize" number:33 type:4 subMessageClass:0];
  v72[32] = v39;
  unsigned int v38 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activeAppName" number:34 type:13 subMessageClass:0];
  v72[33] = v38;
  char v37 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activeAirpodsSerialNumber" number:35 type:13 subMessageClass:0];
  v72[34] = v37;
  char v36 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"anchorVol" number:36 type:4 subMessageClass:0];
  v72[35] = v36;
  unint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"anchorEnv" number:37 type:4 subMessageClass:0];
  v72[36] = v35;
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"personalizationCoeff" number:38 type:4 subMessageClass:0];
  v72[37] = v34;
  unsigned int v33 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"unsignedPredVolMediaPrct" number:39 type:4 subMessageClass:0];
  v72[38] = v33;
  char v32 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"unsignedPredVolTelephonyPrct" number:40 type:4 subMessageClass:0];
  v72[39] = v32;
  char v31 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"unsignedPredVolSiriPrct" number:41 type:4 subMessageClass:0];
  v72[40] = v31;
  unint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"singleBudFlag" number:42 type:4 subMessageClass:0];
  v72[41] = v30;
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cdEngagementFlag" number:43 type:4 subMessageClass:0];
  v72[42] = v29;
  unsigned int v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activeStreamFlag" number:44 type:4 subMessageClass:0];
  v72[43] = v28;
  char v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pvFeatureEnableFlag" number:45 type:4 subMessageClass:0];
  v72[44] = v27;
  char v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"envSpectralData32B" number:46 type:4 subMessageClass:0];
  v72[45] = v26;
  unint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"windStrength" number:47 type:4 subMessageClass:0];
  v72[46] = v25;
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"windProb" number:48 type:4 subMessageClass:0];
  v72[47] = v24;
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaType" number:49 type:4 subMessageClass:0];
  v72[48] = v23;
  unsigned int v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceActivity" number:50 type:4 subMessageClass:0];
  v72[49] = v22;
  char v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"budActivity" number:51 type:4 subMessageClass:0];
  v72[50] = v21;
  long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"location" number:52 type:4 subMessageClass:0];
  v72[51] = v20;
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"locationType" number:53 type:4 subMessageClass:0];
  v72[52] = v19;
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"focusMode" number:54 type:4 subMessageClass:0];
  v72[53] = v18;
  char v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"streamingAppBundleId" number:55 type:4 subMessageClass:0];
  v72[54] = v17;
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"noiseType4B" number:56 type:4 subMessageClass:0];
  v72[55] = v16;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"instdBA" number:57 type:4 subMessageClass:0];
  v72[56] = v15;
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"instdBC" number:58 type:4 subMessageClass:0];
  v72[57] = v14;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nonCAListeningMode" number:59 type:4 subMessageClass:0];
  v72[58] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fit" number:60 type:4 subMessageClass:0];
  v72[59] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fixedAutoAncGain" number:61 type:4 subMessageClass:0];
  v72[60] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"adjustedAutoAncGain" number:62 type:4 subMessageClass:0];
  v72[61] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timestamp" number:63 type:4 subMessageClass:0];
  v72[62] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"DRCenablementBit" number:64 type:4 subMessageClass:0];
  v72[63] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"DRCwindFlag" number:65 type:4 subMessageClass:0];
  v72[64] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"DRCappSelfVoiceFlag" number:66 type:4 subMessageClass:0];
  v72[65] = v9;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"drumDRC" number:67 type:4 subMessageClass:0];
  v72[66] = v10;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"routedDRCGain" number:68 type:4 subMessageClass:0];
  v72[67] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:68];

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3600;
}

+ (id)columns
{
  v76[72] = *MEMORY[0x1E4F143B8];
  id v75 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"controllerVersion" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v74 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"refMicdBA" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v73 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"refMicdBC" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v72 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"drumdBA" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  char v71 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"drumdBK" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  unint64_t v70 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"drumdBAPredicted" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  uint64_t v69 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"downlinkdBA" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  unsigned int v68 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"currentVolumePrct" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:4 convertedType:0];
  char v67 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"lastUserVolChangeType" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:4 convertedType:0];
  char v66 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"headphoneMode" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:4 convertedType:0];
  unint64_t v65 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"streamType" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:4 convertedType:0];
  uint64_t v64 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"windSpeechAggressorFlag" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:4 convertedType:0];
  unsigned int v63 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"volumeChangeFlag" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:4 convertedType:0];
  char v62 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"speechPresenceProbability" dataType:0 requestOnly:0 fieldNumber:14 protoDataType:4 convertedType:0];
  char v61 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"personalizationParamSnr" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:2 convertedType:0];
  unint64_t v60 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"personalizationParamMistakes" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:2 convertedType:0];
  unsigned int v58 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"lastEMediadBA" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:4 convertedType:0];
  uint64_t v59 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"lastVolMediaPrct" dataType:0 requestOnly:0 fieldNumber:18 protoDataType:4 convertedType:0];
  char v56 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"lastETelephonydBA" dataType:0 requestOnly:0 fieldNumber:19 protoDataType:4 convertedType:0];
  char v57 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"lastVolTelephonyPrct" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:4 convertedType:0];
  unint64_t v55 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"lastESiridBA" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:4 convertedType:0];
  uint64_t v54 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"lastVolSiriPrct" dataType:0 requestOnly:0 fieldNumber:22 protoDataType:4 convertedType:0];
  unsigned int v53 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"smoothEae" dataType:0 requestOnly:0 fieldNumber:23 protoDataType:4 convertedType:0];
  char v52 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"desiredDeltaE" dataType:0 requestOnly:0 fieldNumber:24 protoDataType:2 convertedType:0];
  char v51 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"predVolMediaPrct" dataType:0 requestOnly:0 fieldNumber:25 protoDataType:2 convertedType:0];
  unint64_t v50 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"predVolTelephonyPrct" dataType:0 requestOnly:0 fieldNumber:26 protoDataType:2 convertedType:0];
  uint64_t v49 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"predVolSiriPrct" dataType:0 requestOnly:0 fieldNumber:27 protoDataType:2 convertedType:0];
  unsigned int v48 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"onStartPredictionFlag" dataType:0 requestOnly:0 fieldNumber:28 protoDataType:4 convertedType:0];
  char v47 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"guardrailsAvoidFlag" dataType:0 requestOnly:0 fieldNumber:29 protoDataType:4 convertedType:0];
  char v46 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"minMaxCutFlag" dataType:0 requestOnly:0 fieldNumber:30 protoDataType:4 convertedType:0];
  unint64_t v45 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"manualVolumeChangeFlag" dataType:0 requestOnly:0 fieldNumber:31 protoDataType:4 convertedType:0];
  uint64_t v44 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bigWindowSize" dataType:0 requestOnly:0 fieldNumber:32 protoDataType:4 convertedType:0];
  unsigned int v43 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"smallWindowSize" dataType:0 requestOnly:0 fieldNumber:33 protoDataType:4 convertedType:0];
  char v42 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activeAppName" dataType:2 requestOnly:0 fieldNumber:34 protoDataType:13 convertedType:0];
  char v41 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activeAirpodsSerialNumber" dataType:2 requestOnly:0 fieldNumber:35 protoDataType:13 convertedType:0];
  unint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"anchorVol" dataType:0 requestOnly:0 fieldNumber:36 protoDataType:4 convertedType:0];
  uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"anchorEnv" dataType:0 requestOnly:0 fieldNumber:37 protoDataType:4 convertedType:0];
  unsigned int v38 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"personalizationCoeff" dataType:0 requestOnly:0 fieldNumber:38 protoDataType:4 convertedType:0];
  char v37 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"unsignedPredVolMediaPrct" dataType:0 requestOnly:0 fieldNumber:39 protoDataType:4 convertedType:0];
  char v36 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"unsignedPredVolTelephonyPrct" dataType:0 requestOnly:0 fieldNumber:40 protoDataType:4 convertedType:0];
  unint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"unsignedPredVolSiriPrct" dataType:0 requestOnly:0 fieldNumber:41 protoDataType:4 convertedType:0];
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"singleBudFlag" dataType:0 requestOnly:0 fieldNumber:42 protoDataType:4 convertedType:0];
  unsigned int v33 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cdEngagementFlag" dataType:0 requestOnly:0 fieldNumber:43 protoDataType:4 convertedType:0];
  char v32 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activeStreamFlag" dataType:0 requestOnly:0 fieldNumber:44 protoDataType:4 convertedType:0];
  char v31 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"pvFeatureEnableFlag" dataType:0 requestOnly:0 fieldNumber:45 protoDataType:4 convertedType:0];
  unint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"envSpectralData32B_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_5428];
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"envSpectralData_32B_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_251];
  unsigned int v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"windStrength" dataType:0 requestOnly:0 fieldNumber:47 protoDataType:4 convertedType:0];
  char v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"wind_strength" dataType:0 requestOnly:0 fieldNumber:47 protoDataType:4 convertedType:0];
  char v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"windProb" dataType:0 requestOnly:0 fieldNumber:48 protoDataType:4 convertedType:0];
  unint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"wind_prob" dataType:0 requestOnly:0 fieldNumber:48 protoDataType:4 convertedType:0];
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mediaType" dataType:0 requestOnly:0 fieldNumber:49 protoDataType:4 convertedType:0];
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceActivity" dataType:0 requestOnly:0 fieldNumber:50 protoDataType:4 convertedType:0];
  unsigned int v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"budActivity" dataType:0 requestOnly:0 fieldNumber:51 protoDataType:4 convertedType:0];
  char v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"location" dataType:0 requestOnly:0 fieldNumber:52 protoDataType:4 convertedType:0];
  long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"locationType" dataType:0 requestOnly:0 fieldNumber:53 protoDataType:4 convertedType:0];
  id v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"focusMode" dataType:0 requestOnly:0 fieldNumber:54 protoDataType:4 convertedType:0];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"streamingAppBundleId" dataType:0 requestOnly:0 fieldNumber:55 protoDataType:4 convertedType:0];
  char v17 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"noiseType4B_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_253];
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"noiseType_4B_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_258];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"instdBA" dataType:0 requestOnly:0 fieldNumber:57 protoDataType:4 convertedType:0];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"instdBC" dataType:0 requestOnly:0 fieldNumber:58 protoDataType:4 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nonCAListeningMode" dataType:0 requestOnly:0 fieldNumber:59 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fit" dataType:0 requestOnly:0 fieldNumber:60 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fixedAutoAncGain" dataType:0 requestOnly:0 fieldNumber:61 protoDataType:4 convertedType:0];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"adjustedAutoAncGain" dataType:0 requestOnly:0 fieldNumber:62 protoDataType:4 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestamp" dataType:0 requestOnly:0 fieldNumber:63 protoDataType:4 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"DRCenablementBit" dataType:0 requestOnly:0 fieldNumber:64 protoDataType:4 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"DRCwindFlag" dataType:0 requestOnly:0 fieldNumber:65 protoDataType:4 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"DRCappSelfVoiceFlag" dataType:0 requestOnly:0 fieldNumber:66 protoDataType:4 convertedType:0];
  char v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"drumDRC" dataType:0 requestOnly:0 fieldNumber:67 protoDataType:4 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"routedDRCGain" dataType:0 requestOnly:0 fieldNumber:68 protoDataType:4 convertedType:0];
  v76[0] = v75;
  v76[1] = v74;
  v76[2] = v73;
  v76[3] = v72;
  v76[4] = v71;
  v76[5] = v70;
  v76[6] = v69;
  v76[7] = v68;
  v76[8] = v67;
  v76[9] = v66;
  v76[10] = v65;
  v76[11] = v64;
  v76[12] = v63;
  v76[13] = v62;
  v76[14] = v61;
  v76[15] = v60;
  v76[16] = v58;
  v76[17] = v59;
  v76[18] = v56;
  v76[19] = v57;
  v76[20] = v55;
  v76[21] = v54;
  v76[22] = v53;
  v76[23] = v52;
  v76[24] = v51;
  v76[25] = v50;
  v76[26] = v49;
  v76[27] = v48;
  v76[28] = v47;
  v76[29] = v46;
  v76[30] = v45;
  v76[31] = v44;
  v76[32] = v43;
  v76[33] = v42;
  v76[34] = v41;
  v76[35] = v40;
  v76[36] = v39;
  v76[37] = v38;
  v76[38] = v37;
  v76[39] = v36;
  v76[40] = v35;
  v76[41] = v34;
  v76[42] = v33;
  v76[43] = v32;
  v76[44] = v31;
  v76[45] = v30;
  v76[46] = v29;
  v76[47] = v28;
  v76[48] = v27;
  v76[49] = v26;
  v76[50] = v25;
  v76[51] = v24;
  v76[52] = v23;
  v76[53] = v22;
  v76[54] = v21;
  v76[55] = v20;
  v76[56] = v19;
  v76[57] = v18;
  v76[58] = v17;
  v76[59] = v16;
  v76[60] = v15;
  v76[61] = v14;
  v76[62] = v2;
  v76[63] = v3;
  v76[64] = v4;
  v76[65] = v13;
  v76[66] = v5;
  v76[67] = v6;
  v76[68] = v7;
  v76[69] = v8;
  v76[70] = v12;
  v76[71] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:72];

  return v11;
}

id __33__BMDeviceAdaptiveVolume_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = objc_msgSend(v2, "_noiseType_4BJSONArray");
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __33__BMDeviceAdaptiveVolume_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _noiseType4BJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __33__BMDeviceAdaptiveVolume_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = objc_msgSend(v2, "_envSpectralData_32BJSONArray");
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __33__BMDeviceAdaptiveVolume_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _envSpectralData32BJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMDeviceAdaptiveVolume alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[21] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (uint64_t)initWithControllerVersion:(void *)a1 refMicdBA:refMicdBC:drumdBA:drumdBK:drumdBAPredicted:downlinkdBA:currentVolumePrct:lastUserVolChangeType:headphoneMode:streamType:windSpeechAggressorFlag:volumeChangeFlag:speechPresenceProbability:personalizationParamSnr:personalizationParamMistakes:lastEMediadBA:lastVolMediaPrct:lastETelephonydBA:lastVolTelephonyPrct:lastESiridBA:lastVolSiriPrct:smoothEae:desiredDeltaE:predVolMediaPrct:predVolTelephonyPrct:predVolSiriPrct:onStartPredictionFlag:guardrailsAvoidFlag:minMaxCutFlag:manualVolumeChangeFlag:bigWindowSize:smallWindowSize:activeAppName:activeAirpodsSerialNumber:anchorVol:anchorEnv:personalizationCoeff:unsignedPredVolMediaPrct:unsignedPredVolTelephonyPrct:unsignedPredVolSiriPrct:singleBudFlag:cdEngagementFlag:activeStreamFlag:pvFeatureEnableFlag:envSpectralData_32B:wind_strength:wind_prob:mediaType:sourceActivity:budActivity:location:locationType:focusMode:streamingAppBundleId:noiseType_4B:instdBA:instdBC:nonCAListeningMode:fit:fixedAutoAncGain:adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:routedDRCGain:
{
  return objc_msgSend(a1, "initWithControllerVersion:refMicdBA:refMicdBC:drumdBA:drumdBK:drumdBAPredicted:downlinkdBA:currentVolumePrct:lastUserVolChangeType:headphoneMode:streamType:windSpeechAggressorFlag:volumeChangeFlag:speechPresenceProbability:personalizationParamSnr:personalizationParamMistakes:lastEMediadBA:lastVolMediaPrct:lastETelephonydBA:lastVolTelephonyPrct:lastESiridBA:lastVolSiriPrct:smoothEae:desiredDeltaE:predVolMediaPrct:predVolTelephonyPrct:predVolSiriPrct:onStartPredictionFlag:guardrailsAvoidFlag:minMaxCutFlag:manualVolumeChangeFlag:bigWindowSize:smallWindowSize:activeAppName:activeAirpodsSerialNumber:anchorVol:anchorEnv:personalizationCoeff:unsignedPredVolMediaPrct:unsignedPredVolTelephonyPrct:unsignedPredVolSiriPrct:singleBudFlag:cdEngagementFlag:activeStreamFlag:pvFeatureEnableFlag:envSpectralData32B:windStrength:windProb:mediaType:sourceActivity:budActivity:location:locationType:focusMode:streamingAppBundleId:noiseType4B:instdBA:instdBC:nonCAListeningMode:fit:fixedAutoAncGain:adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:routedDRCGain:");
}

- (uint64_t)initWithControllerVersion:(uint64_t)a3 refMicdBA:(uint64_t)a4 refMicdBC:(uint64_t)a5 drumdBA:(uint64_t)a6 drumdBK:(uint64_t)a7 drumdBAPredicted:(uint64_t)a8 downlinkdBA:(id)a9 currentVolumePrct:(uint64_t)a10 lastUserVolChangeType:(id)a11 headphoneMode:(uint64_t)a12 streamType:(id)a13 windSpeechAggressorFlag:(uint64_t)a14 volumeChangeFlag:(id)a15 speechPresenceProbability:(uint64_t)a16 personalizationParamSnr:(id)a17 personalizationParamMistakes:(uint64_t)a18 lastEMediadBA:(id)a19 lastVolMediaPrct:(uint64_t)a20 lastETelephonydBA:(id)a21 lastVolTelephonyPrct:(uint64_t)a22 lastESiridBA:(id)a23 lastVolSiriPrct:(uint64_t)a24 smoothEae:(id)a25 desiredDeltaE:(uint64_t)a26 predVolMediaPrct:(id)a27 predVolTelephonyPrct:(uint64_t)a28 predVolSiriPrct:(id)a29 onStartPredictionFlag:(uint64_t)a30 guardrailsAvoidFlag:(id)a31 minMaxCutFlag:(uint64_t)a32 manualVolumeChangeFlag:(id)a33 bigWindowSize:(uint64_t)a34 smallWindowSize:(id)a35 activeAppName:(uint64_t)a36 activeAirpodsSerialNumber:(id)a37 anchorVol:(uint64_t)a38 anchorEnv:(id)a39 personalizationCoeff:(uint64_t)a40 unsignedPredVolMediaPrct:(id)a41 unsignedPredVolTelephonyPrct:(uint64_t)a42 unsignedPredVolSiriPrct:(id)a43 singleBudFlag:(uint64_t)a44 cdEngagementFlag:(id)a45 activeStreamFlag:(uint64_t)a46 pvFeatureEnableFlag:(id)a47 envSpectralData_32B:(uint64_t)a48 wind_strength:(id)a49 wind_prob:(uint64_t)a50 mediaType:(id)a51 sourceActivity:(uint64_t)a52 budActivity:(id)a53 location:(uint64_t)a54 locationType:(id)a55 focusMode:(uint64_t)a56 streamingAppBundleId:(id)a57 noiseType_4B:(uint64_t)a58 instdBA:(id)a59 instdBC:(uint64_t)a60 nonCAListeningMode:(id)a61 fit:(uint64_t)a62 fixedAutoAncGain:(id)a63 adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:
{
  return objc_msgSend(a1, "initWithControllerVersion:refMicdBA:refMicdBC:drumdBA:drumdBK:drumdBAPredicted:downlinkdBA:currentVolumePrct:lastUserVolChangeType:headphoneMode:streamType:windSpeechAggressorFlag:volumeChangeFlag:speechPresenceProbability:personalizationParamSnr:personalizationParamMistakes:lastEMediadBA:lastVolMediaPrct:lastETelephonydBA:lastVolTelephonyPrct:lastESiridBA:lastVolSiriPrct:smoothEae:desiredDeltaE:predVolMediaPrct:predVolTelephonyPrct:predVolSiriPrct:onStartPredictionFlag:guardrailsAvoidFlag:minMaxCutFlag:manualVolumeChangeFlag:bigWindowSize:smallWindowSize:activeAppName:activeAirpodsSerialNumber:anchorVol:anchorEnv:personalizationCoeff:unsignedPredVolMediaPrct:unsignedPredVolTelephonyPrct:unsignedPredVolSiriPrct:singleBudFlag:cdEngagementFlag:activeStreamFlag:pvFeatureEnableFlag:envSpectralData_32B:wind_strength:wind_prob:mediaType:sourceActivity:budActivity:location:locationType:focusMode:streamingAppBundleId:noiseType_4B:instdBA:instdBC:nonCAListeningMode:fit:fixedAutoAncGain:adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:routedDRCGain:", a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63,
           a64,
           a65,
           a66,
           a67,
           a68,
           a69);
}

- (uint64_t)initWithControllerVersion:(uint64_t)a3 refMicdBA:(uint64_t)a4 refMicdBC:(uint64_t)a5 drumdBA:(uint64_t)a6 drumdBK:(uint64_t)a7 drumdBAPredicted:(uint64_t)a8 downlinkdBA:(id)a9 currentVolumePrct:(uint64_t)a10 lastUserVolChangeType:(id)a11 headphoneMode:(uint64_t)a12 streamType:(id)a13 windSpeechAggressorFlag:(uint64_t)a14 volumeChangeFlag:(id)a15 speechPresenceProbability:(uint64_t)a16 personalizationParamSnr:(id)a17 personalizationParamMistakes:(uint64_t)a18 lastEMediadBA:(id)a19 lastVolMediaPrct:(uint64_t)a20 lastETelephonydBA:(id)a21 lastVolTelephonyPrct:(uint64_t)a22 lastESiridBA:(id)a23 lastVolSiriPrct:(uint64_t)a24 smoothEae:(id)a25 desiredDeltaE:(uint64_t)a26 predVolMediaPrct:(id)a27 predVolTelephonyPrct:(uint64_t)a28 predVolSiriPrct:(id)a29 onStartPredictionFlag:(uint64_t)a30 guardrailsAvoidFlag:(id)a31 minMaxCutFlag:(uint64_t)a32 manualVolumeChangeFlag:(id)a33 bigWindowSize:(uint64_t)a34 smallWindowSize:(id)a35 activeAppName:(uint64_t)a36 activeAirpodsSerialNumber:(id)a37 anchorVol:(uint64_t)a38 anchorEnv:(id)a39 personalizationCoeff:(uint64_t)a40 unsignedPredVolMediaPrct:(id)a41 unsignedPredVolTelephonyPrct:(uint64_t)a42 unsignedPredVolSiriPrct:(id)a43 singleBudFlag:(uint64_t)a44 cdEngagementFlag:(id)a45 activeStreamFlag:(uint64_t)a46 pvFeatureEnableFlag:(id)a47 envSpectralData_32B:(uint64_t)a48 wind_strength:(id)a49 wind_prob:(uint64_t)a50 mediaType:(id)a51 sourceActivity:(uint64_t)a52 budActivity:(id)a53 location:(uint64_t)a54 locationType:(id)a55 focusMode:(uint64_t)a56 streamingAppBundleId:(id)a57 noiseType_4B:(uint64_t)a58 instdBA:(id)a59 instdBC:(uint64_t)a60 nonCAListeningMode:(id)a61 fit:(uint64_t)a62 fixedAutoAncGain:(id)a63 adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:
{
  return objc_msgSend(a1, "initWithControllerVersion:refMicdBA:refMicdBC:drumdBA:drumdBK:drumdBAPredicted:downlinkdBA:currentVolumePrct:lastUserVolChangeType:headphoneMode:streamType:windSpeechAggressorFlag:volumeChangeFlag:speechPresenceProbability:personalizationParamSnr:personalizationParamMistakes:lastEMediadBA:lastVolMediaPrct:lastETelephonydBA:lastVolTelephonyPrct:lastESiridBA:lastVolSiriPrct:smoothEae:desiredDeltaE:predVolMediaPrct:predVolTelephonyPrct:predVolSiriPrct:onStartPredictionFlag:guardrailsAvoidFlag:minMaxCutFlag:manualVolumeChangeFlag:bigWindowSize:smallWindowSize:activeAppName:activeAirpodsSerialNumber:anchorVol:anchorEnv:personalizationCoeff:unsignedPredVolMediaPrct:unsignedPredVolTelephonyPrct:unsignedPredVolSiriPrct:singleBudFlag:cdEngagementFlag:activeStreamFlag:pvFeatureEnableFlag:envSpectralData_32B:wind_strength:wind_prob:mediaType:sourceActivity:budActivity:location:locationType:focusMode:streamingAppBundleId:noiseType_4B:instdBA:instdBC:nonCAListeningMode:fit:fixedAutoAncGain:adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:drumDRC:", a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48,
           a49,
           a50,
           a51,
           a52,
           a53,
           a54,
           a55,
           a56,
           a57,
           a58,
           a59,
           a60,
           a61,
           a62,
           a63,
           a64,
           a65,
           a66,
           a67,
           a68,
           0);
}

- (BMDeviceAdaptiveVolume)initWithControllerVersion:(id)a3 refMicdBA:(id)a4 refMicdBC:(id)a5 drumdBA:(id)a6 drumdBK:(id)a7 drumdBAPredicted:(id)a8 downlinkdBA:(id)a9 currentVolumePrct:(id)a10 lastUserVolChangeType:(id)a11 headphoneMode:(id)a12 streamType:(id)a13 windSpeechAggressorFlag:(id)a14 volumeChangeFlag:(id)a15 speechPresenceProbability:(id)a16 personalizationParamSnr:(id)a17 personalizationParamMistakes:(id)a18 lastEMediadBA:(id)a19 lastVolMediaPrct:(id)a20 lastETelephonydBA:(id)a21 lastVolTelephonyPrct:(id)a22 lastESiridBA:(id)a23 lastVolSiriPrct:(id)a24 smoothEae:(id)a25 desiredDeltaE:(id)a26 predVolMediaPrct:(id)a27 predVolTelephonyPrct:(id)a28 predVolSiriPrct:(id)a29 onStartPredictionFlag:(id)a30 guardrailsAvoidFlag:(id)a31 minMaxCutFlag:(id)a32 manualVolumeChangeFlag:(id)a33 bigWindowSize:(id)a34 smallWindowSize:(id)a35 activeAppName:(id)a36 activeAirpodsSerialNumber:(id)a37
{
  long long v39 = 0u;
  long long v40 = 0u;
  long long v38 = 0u;
  return -[BMDeviceAdaptiveVolume initWithControllerVersion:refMicdBA:refMicdBC:drumdBA:drumdBK:drumdBAPredicted:downlinkdBA:currentVolumePrct:lastUserVolChangeType:headphoneMode:streamType:windSpeechAggressorFlag:volumeChangeFlag:speechPresenceProbability:personalizationParamSnr:personalizationParamMistakes:lastEMediadBA:lastVolMediaPrct:lastETelephonydBA:lastVolTelephonyPrct:lastESiridBA:lastVolSiriPrct:smoothEae:desiredDeltaE:predVolMediaPrct:predVolTelephonyPrct:predVolSiriPrct:onStartPredictionFlag:guardrailsAvoidFlag:minMaxCutFlag:manualVolumeChangeFlag:bigWindowSize:smallWindowSize:activeAppName:activeAirpodsSerialNumber:anchorVol:anchorEnv:personalizationCoeff:unsignedPredVolMediaPrct:unsignedPredVolTelephonyPrct:unsignedPredVolSiriPrct:singleBudFlag:cdEngagementFlag:activeStreamFlag:pvFeatureEnableFlag:envSpectralData_32B:wind_strength:wind_prob:mediaType:sourceActivity:budActivity:location:locationType:focusMode:streamingAppBundleId:noiseType_4B:instdBA:instdBC:nonCAListeningMode:fit:fixedAutoAncGain:adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:](self, "initWithControllerVersion:refMicdBA:refMicdBC:drumdBA:drumdBK:drumdBAPredicted:downlinkdBA:currentVolumePrct:lastUserVolChangeType:headphoneMode:streamType:windSpeechAggressorFlag:volumeChangeFlag:speechPresenceProbability:personalizationParamSnr:personalizationParamMistakes:lastEMediadBA:lastVolMediaPrct:lastETelephonydBA:lastVolTelephonyPrct:lastESiridBA:lastVolSiriPrct:smoothEae:desiredDeltaE:predVolMediaPrct:predVolTelephonyPrct:predVolSiriPrct:onStartPredictionFlag:guardrailsAvoidFlag:minMaxCutFlag:manualVolumeChangeFlag:bigWindowSize:smallWindowSize:activeAppName:activeAirpodsSerialNumber:anchorVol:anchorEnv:personalizationCoeff:unsignedPredVolMediaPrct:unsignedPredVolTelephonyPrct:unsignedPredVolSiriPrct:singleBudFlag:cdEngagementFlag:activeStreamFlag:pvFeatureEnableFlag:envSpectralData_32B:wind_strength:wind_prob:mediaType:sourceActivity:budActivity:location:locationType:focusMode:streamingAppBundleId:noiseType_4B:instdBA:instdBC:nonCAListeningMode:fit:fixedAutoAncGain:adjustedAutoAncGain:timestamp:DRCenablementBit:DRCwindFlag:DRCappSelfVoiceFlag:", a3, a4, a5, a6, a7, a8, a9, a10,
           a11,
           a12,
           a13,
           a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           MEMORY[0x1E4F1CBF0],
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           MEMORY[0x1E4F1CBF0],
           0,
           0,
           0,
           0,
           0);
}

@end