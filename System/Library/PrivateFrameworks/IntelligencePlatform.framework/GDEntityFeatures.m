@interface GDEntityFeatures
+ (BOOL)supportsSecureCoding;
- (GDEntityFeatures)initWithCandidateNameScore:(double)a3 candidateCommunicationScore:(double)a4 candidateOrganizationScore:(double)a5 candidateLocationScore:(double)a6 candidateEventLocationScore:(double)a7 candidateEventNameScore:(double)a8 topicScore:(double)a9 messagePopularityGivenTimeOfDay:(uint64_t)a10 callPopularityGivenTimeOfDay:(int)a11 facetimePopularityGivenTimeOfDay:(int)a12 timeOfDayGivenMessageWithEntity:(int)a13 timeOfDayGivenCallWithEntity:(double)a14 timeOfDayGivenFacetimeWithEntity:(double)a15 messageWithEntityGivenTimeOfDay:(double)a16 callWithEntityGivenTimeOfDay:(double)a17 facetimeWithEntityGivenTimeOfDay:(double)a18 messagePopularityGivenCoarseTimeOfDay:(double)a19 callPopularityGivenCoarseTimeOfDay:(double)a20 facetimePopularityGivenCoarseTimeOfDay:(double)a21 coarseTimeOfDayGivenMessageWithEntity:(double)a22 coarseTimeOfDayGivenCallWithEntity:(double)a23 coarseTimeOfDayGivenFacetimeWithEntity:(double)a24 messageWithEntityGivenCoarseTimeOfDay:(double)a25 callWithEntityGivenCoarseTimeOfDay:(double)a26 facetimeWithEntityGivenCoarseTimeOfDay:(double)a27 messagePopularityGivenDayOfWeek:(double)a28 callPopularityGivenDayOfWeek:(double)a29 facetimePopularityGivenDayOfWeek:(double)a30 dayOfWeekGivenMessageWithEntity:(double)a31 dayOfWeekGivenCallWithEntity:(double)a32 dayOfWeekGivenFacetimeWithEntity:(double)a33 messageWithEntityGivenDayOfWeek:(double)a34 callWithEntityGivenDayOfWeek:(double)a35 facetimeWithEntityGivenDayOfWeek:(double)a36 messagePopularityGivenFocusMode:(double)a37 callPopularityGivenFocusMode:(double)a38 facetimePopularityGivenFocusMode:(double)a39 focusModeGivenMessageWithEntity:(double)a40 focusModeGivenCallWithEntity:(double)a41 focusModeGivenFacetimeWithEntity:(double)a42 messageWithEntityGivenFocusMode:(double)a43 callWithEntityGivenFocusMode:(double)a44 facetimeWithEntityGivenFocusMode:(double)a45 messagePopularityGivenLOI:(double)a46 callPopularityGivenLOI:(double)a47 facetimePopularityGivenLOI:(double)a48 LOIGivenMessageWithEntity:(double)a49 LOIGivenCallWithEntity:(double)a50 LOIGivenFacetimeWithEntity:(double)a51 messageWithEntityGivenLOI:(double)a52 callWithEntityGivenLOI:(double)a53 facetimeWithEntityGivenLOI:(double)a54 messagePopularityGivenSpecificGeoHash:(double)a55 callPopularityGivenSpecificGeoHash:(double)a56 facetimePopularityGivenSpecificGeoHash:(double)a57 specificGeoHashGivenMessageWithEntity:(double)a58 specificGeoHashGivenCallWithEntity:(double)a59 specificGeoHashGivenFacetimeWithEntity:(double)a60 messageWithEntityGivenSpecificGeoHash:(double)a61 callWithEntityGivenSpecificGeoHash:(double)a62 facetimeWithEntityGivenSpecificGeoHash:(double)a63 messagePopularityGivenCoarseGeoHash:callPopularityGivenCoarseGeoHash:facetimePopularityGivenCoarseGeoHash:coarseGeoHashGivenMessageWithEntity:coarseGeoHashGivenCallWithEntity:coarseGeoHashGivenFacetimeWithEntity:messageWithEntityGivenCoarseGeoHash:callWithEntityGivenCoarseGeoHash:facetimeWithEntityGivenCoarseGeoHash:messagePopularityGivenLargeGeoHash:callPopularityGivenLargeGeoHash:facetimePopularityGivenLargeGeoHash:largeGeoHashGivenMessageWithEntity:largeGeoHashGivenCallWithEntity:largeGeoHashGivenFacetimeWithEntity:messageWithEntityGivenLargeGeoHash:callWithEntityGivenLargeGeoHash:facetimeWithEntityGivenLargeGeoHash:messagePopularityGivenMicroLocation:callPopularityGivenMicroLocation:facetimePopularityGivenMicroLocation:microLocationGivenMessageWithEntity:microLocationGivenCallWithEntity:microLocationGivenFacetimeWithEntity:messageWithEntityGivenMicroLocation:callWithEntityGivenMicroLocation:facetimeWithEntityGivenMicroLocation:messagePopularityGivenMotionState:callPopularityGivenMotionState:facetimePopularityGivenMotionState:motionStateGivenMessageWithEntity:motionStateGivenCallWithEntity:motionStateGivenFacetimeWithEntity:messageWithEntityGivenMotionState:callWithEntityGivenMotionState:facetimeWithEntityGivenMotionState:messagePopularityGivenWiFi:callPopularityGivenWiFi:facetimePopularityGivenWiFi:wiFiGivenMessageWithEntity:wiFiGivenCallWithEntity:wiFiGivenFacetimeWithEntity:messageWithEntityGivenWiFi:callWithEntityGivenWiFi:facetimeWithEntityGivenWiFi:messagePopularityGivenSequence:callPopularityGivenSequence:facetimePopularityGivenSequence:sequenceGivenMessageWithEntity:sequenceGivenCallWithEntity:sequenceGivenFacetimeWithEntity:lastExecutionAge:medianTimeIntervalBetweenExecution:dailyDoseL1Error:dailyDoseL2Error:shortTermTrendingPopularity:trendingPopularity:longTermTrendingPopularity:;
- (GDEntityFeatures)initWithCandidateNameScore:(double)a3 candidateCommunicationScore:(double)a4 candidateOrganizationScore:(double)a5 candidateLocationScore:(double)a6 candidateEventLocationScore:(double)a7 candidateEventNameScore:(double)a8 topicScore:(double)a9 messagePopularityGivenTimeOfDay:(uint64_t)a10 callPopularityGivenTimeOfDay:(int)a11 facetimePopularityGivenTimeOfDay:(int)a12 timeOfDayGivenMessageWithEntity:(int)a13 timeOfDayGivenCallWithEntity:(int)a14 timeOfDayGivenFacetimeWithEntity:(double)a15 messageWithEntityGivenTimeOfDay:(double)a16 callWithEntityGivenTimeOfDay:(double)a17 facetimeWithEntityGivenTimeOfDay:(double)a18 messagePopularityGivenCoarseTimeOfDay:(double)a19 callPopularityGivenCoarseTimeOfDay:(double)a20 facetimePopularityGivenCoarseTimeOfDay:(double)a21 coarseTimeOfDayGivenMessageWithEntity:(double)a22 coarseTimeOfDayGivenCallWithEntity:(double)a23 coarseTimeOfDayGivenFacetimeWithEntity:(double)a24 messageWithEntityGivenCoarseTimeOfDay:(double)a25 callWithEntityGivenCoarseTimeOfDay:(double)a26 facetimeWithEntityGivenCoarseTimeOfDay:(double)a27 messagePopularityGivenDayOfWeek:(double)a28 callPopularityGivenDayOfWeek:(double)a29 facetimePopularityGivenDayOfWeek:(double)a30 dayOfWeekGivenMessageWithEntity:(double)a31 dayOfWeekGivenCallWithEntity:(double)a32 dayOfWeekGivenFacetimeWithEntity:(double)a33 messageWithEntityGivenDayOfWeek:(double)a34 callWithEntityGivenDayOfWeek:(double)a35 facetimeWithEntityGivenDayOfWeek:(double)a36 messagePopularityGivenFocusMode:(double)a37 callPopularityGivenFocusMode:(double)a38 facetimePopularityGivenFocusMode:(double)a39 focusModeGivenMessageWithEntity:(double)a40 focusModeGivenCallWithEntity:(double)a41 focusModeGivenFacetimeWithEntity:(double)a42 messageWithEntityGivenFocusMode:(double)a43 callWithEntityGivenFocusMode:(double)a44 facetimeWithEntityGivenFocusMode:(double)a45 messagePopularityGivenLOI:(double)a46 callPopularityGivenLOI:(double)a47 facetimePopularityGivenLOI:(double)a48 LOIGivenMessageWithEntity:(double)a49 LOIGivenCallWithEntity:(double)a50 LOIGivenFacetimeWithEntity:(double)a51 messageWithEntityGivenLOI:(double)a52 callWithEntityGivenLOI:(double)a53 facetimeWithEntityGivenLOI:(double)a54 messagePopularityGivenSpecificGeoHash:(double)a55 callPopularityGivenSpecificGeoHash:(double)a56 facetimePopularityGivenSpecificGeoHash:(double)a57 specificGeoHashGivenMessageWithEntity:(double)a58 specificGeoHashGivenCallWithEntity:(double)a59 specificGeoHashGivenFacetimeWithEntity:(double)a60 messageWithEntityGivenSpecificGeoHash:(double)a61 callWithEntityGivenSpecificGeoHash:(double)a62 facetimeWithEntityGivenSpecificGeoHash:(double)a63 messagePopularityGivenCoarseGeoHash:callPopularityGivenCoarseGeoHash:facetimePopularityGivenCoarseGeoHash:coarseGeoHashGivenMessageWithEntity:coarseGeoHashGivenCallWithEntity:coarseGeoHashGivenFacetimeWithEntity:messageWithEntityGivenCoarseGeoHash:callWithEntityGivenCoarseGeoHash:facetimeWithEntityGivenCoarseGeoHash:messagePopularityGivenLargeGeoHash:callPopularityGivenLargeGeoHash:facetimePopularityGivenLargeGeoHash:largeGeoHashGivenMessageWithEntity:largeGeoHashGivenCallWithEntity:largeGeoHashGivenFacetimeWithEntity:messageWithEntityGivenLargeGeoHash:callWithEntityGivenLargeGeoHash:facetimeWithEntityGivenLargeGeoHash:messagePopularityGivenMicroLocation:callPopularityGivenMicroLocation:facetimePopularityGivenMicroLocation:microLocationGivenMessageWithEntity:microLocationGivenCallWithEntity:microLocationGivenFacetimeWithEntity:messageWithEntityGivenMicroLocation:callWithEntityGivenMicroLocation:facetimeWithEntityGivenMicroLocation:messagePopularityGivenMotionState:callPopularityGivenMotionState:facetimePopularityGivenMotionState:motionStateGivenMessageWithEntity:motionStateGivenCallWithEntity:motionStateGivenFacetimeWithEntity:messageWithEntityGivenMotionState:callWithEntityGivenMotionState:facetimeWithEntityGivenMotionState:messagePopularityGivenWiFi:callPopularityGivenWiFi:facetimePopularityGivenWiFi:wiFiGivenMessageWithEntity:wiFiGivenCallWithEntity:wiFiGivenFacetimeWithEntity:messageWithEntityGivenWiFi:callWithEntityGivenWiFi:facetimeWithEntityGivenWiFi:messagePopularityGivenSequence:callPopularityGivenSequence:facetimePopularityGivenSequence:sequenceGivenMessageWithEntity:sequenceGivenCallWithEntity:sequenceGivenFacetimeWithEntity:lastExecutionAge:medianTimeIntervalBetweenExecution:dailyDoseL1Error:dailyDoseL2Error:shortTermTrendingPopularity:trendingPopularity:longTermTrendingPopularity:locationLastExecutationAge:locationPopularityGivenSpecificGeoHash:locationTrendingPopularity:;
- (GDEntityFeatures)initWithCandidateNameSimilarity:(double)a3;
- (GDEntityFeatures)initWithCoder:(id)a3;
- (GDEntityFeatures)initWithLocationLastExecutationAge:(int)a3 locationPopularityGivenSpecificGeoHash:(double)a4 locationTrendingPopularity:(double)a5;
- (double)LOIGivenCallWithEntity;
- (double)LOIGivenFacetimeWithEntity;
- (double)LOIGivenMessageWithEntity;
- (double)callPopularityGivenCoarseGeoHash;
- (double)callPopularityGivenCoarseTimeOfDay;
- (double)callPopularityGivenDayOfWeek;
- (double)callPopularityGivenFocusMode;
- (double)callPopularityGivenLOI;
- (double)callPopularityGivenLargeGeoHash;
- (double)callPopularityGivenMicroLocation;
- (double)callPopularityGivenMotionState;
- (double)callPopularityGivenSequence;
- (double)callPopularityGivenSpecificGeoHash;
- (double)callPopularityGivenTimeOfDay;
- (double)callPopularityGivenWiFi;
- (double)callWithEntityGivenCoarseGeoHash;
- (double)callWithEntityGivenCoarseTimeOfDay;
- (double)callWithEntityGivenDayOfWeek;
- (double)callWithEntityGivenFocusMode;
- (double)callWithEntityGivenLOI;
- (double)callWithEntityGivenLargeGeoHash;
- (double)callWithEntityGivenMicroLocation;
- (double)callWithEntityGivenMotionState;
- (double)callWithEntityGivenSpecificGeoHash;
- (double)callWithEntityGivenTimeOfDay;
- (double)callWithEntityGivenWiFi;
- (double)candidateCommunicationScore;
- (double)candidateEventLocationScore;
- (double)candidateEventNameScore;
- (double)candidateLocationScore;
- (double)candidateNameScore;
- (double)candidateNameSimilarity;
- (double)candidateOrganizationScore;
- (double)coarseGeoHashGivenCallWithEntity;
- (double)coarseGeoHashGivenFacetimeWithEntity;
- (double)coarseGeoHashGivenMessageWithEntity;
- (double)coarseTimeOfDayGivenCallWithEntity;
- (double)coarseTimeOfDayGivenFacetimeWithEntity;
- (double)coarseTimeOfDayGivenMessageWithEntity;
- (double)dailyDoseL2Error;
- (double)dayOfWeekGivenCallWithEntity;
- (double)dayOfWeekGivenFacetimeWithEntity;
- (double)dayOfWeekGivenMessageWithEntity;
- (double)facetimePopularityGivenCoarseGeoHash;
- (double)facetimePopularityGivenCoarseTimeOfDay;
- (double)facetimePopularityGivenDayOfWeek;
- (double)facetimePopularityGivenFocusMode;
- (double)facetimePopularityGivenLOI;
- (double)facetimePopularityGivenLargeGeoHash;
- (double)facetimePopularityGivenMicroLocation;
- (double)facetimePopularityGivenMotionState;
- (double)facetimePopularityGivenSequence;
- (double)facetimePopularityGivenSpecificGeoHash;
- (double)facetimePopularityGivenTimeOfDay;
- (double)facetimePopularityGivenWiFi;
- (double)facetimeWithEntityGivenCoarseGeoHash;
- (double)facetimeWithEntityGivenCoarseTimeOfDay;
- (double)facetimeWithEntityGivenDayOfWeek;
- (double)facetimeWithEntityGivenFocusMode;
- (double)facetimeWithEntityGivenLOI;
- (double)facetimeWithEntityGivenLargeGeoHash;
- (double)facetimeWithEntityGivenMicroLocation;
- (double)facetimeWithEntityGivenMotionState;
- (double)facetimeWithEntityGivenSpecificGeoHash;
- (double)facetimeWithEntityGivenTimeOfDay;
- (double)facetimeWithEntityGivenWiFi;
- (double)focusModeGivenCallWithEntity;
- (double)focusModeGivenFacetimeWithEntity;
- (double)focusModeGivenMessageWithEntity;
- (double)largeGeoHashGivenCallWithEntity;
- (double)largeGeoHashGivenFacetimeWithEntity;
- (double)largeGeoHashGivenMessageWithEntity;
- (double)locationPopularityGivenSpecificGeoHash;
- (double)locationTrendingPopularity;
- (double)longTermTrendingPopularity;
- (double)messagePopularityGivenCoarseGeoHash;
- (double)messagePopularityGivenCoarseTimeOfDay;
- (double)messagePopularityGivenDayOfWeek;
- (double)messagePopularityGivenFocusMode;
- (double)messagePopularityGivenLOI;
- (double)messagePopularityGivenLargeGeoHash;
- (double)messagePopularityGivenMicroLocation;
- (double)messagePopularityGivenMotionState;
- (double)messagePopularityGivenSequence;
- (double)messagePopularityGivenSpecificGeoHash;
- (double)messagePopularityGivenTimeOfDay;
- (double)messagePopularityGivenWiFi;
- (double)messageWithEntityGivenCoarseGeoHash;
- (double)messageWithEntityGivenCoarseTimeOfDay;
- (double)messageWithEntityGivenDayOfWeek;
- (double)messageWithEntityGivenFocusMode;
- (double)messageWithEntityGivenLOI;
- (double)messageWithEntityGivenLargeGeoHash;
- (double)messageWithEntityGivenMicroLocation;
- (double)messageWithEntityGivenMotionState;
- (double)messageWithEntityGivenSpecificGeoHash;
- (double)messageWithEntityGivenTimeOfDay;
- (double)messageWithEntityGivenWiFi;
- (double)microLocationGivenCallWithEntity;
- (double)microLocationGivenFacetimeWithEntity;
- (double)microLocationGivenMessageWithEntity;
- (double)motionStateGivenCallWithEntity;
- (double)motionStateGivenFacetimeWithEntity;
- (double)motionStateGivenMessageWithEntity;
- (double)sequenceGivenCallWithEntity;
- (double)sequenceGivenFacetimeWithEntity;
- (double)sequenceGivenMessageWithEntity;
- (double)shortTermTrendingPopularity;
- (double)specificGeoHashGivenCallWithEntity;
- (double)specificGeoHashGivenFacetimeWithEntity;
- (double)specificGeoHashGivenMessageWithEntity;
- (double)timeOfDayGivenCallWithEntity;
- (double)timeOfDayGivenFacetimeWithEntity;
- (double)timeOfDayGivenMessageWithEntity;
- (double)topicScore;
- (double)trendingPopularity;
- (double)wiFiGivenCallWithEntity;
- (double)wiFiGivenFacetimeWithEntity;
- (double)wiFiGivenMessageWithEntity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)dailyDoseL1Error;
- (int)lastExecutionAge;
- (int)locationLastExecutionAge;
- (int)medianTimeIntervalBetweenExecution;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDEntityFeatures

- (double)locationPopularityGivenSpecificGeoHash
{
  return self->_locationPopularityGivenSpecificGeoHash;
}

- (double)locationTrendingPopularity
{
  return self->_locationTrendingPopularity;
}

- (int)locationLastExecutionAge
{
  return self->_locationLastExecutionAge;
}

- (double)longTermTrendingPopularity
{
  return self->_longTermTrendingPopularity;
}

- (double)trendingPopularity
{
  return self->_trendingPopularity;
}

- (double)shortTermTrendingPopularity
{
  return self->_shortTermTrendingPopularity;
}

- (double)dailyDoseL2Error
{
  return self->_dailyDoseL2Error;
}

- (int)dailyDoseL1Error
{
  return self->_dailyDoseL1Error;
}

- (int)medianTimeIntervalBetweenExecution
{
  return self->_medianTimeIntervalBetweenExecution;
}

- (int)lastExecutionAge
{
  return self->_lastExecutionAge;
}

- (double)sequenceGivenFacetimeWithEntity
{
  return self->_sequenceGivenFacetimeWithEntity;
}

- (double)sequenceGivenCallWithEntity
{
  return self->_sequenceGivenCallWithEntity;
}

- (double)sequenceGivenMessageWithEntity
{
  return self->_sequenceGivenMessageWithEntity;
}

- (double)facetimePopularityGivenSequence
{
  return self->_facetimePopularityGivenSequence;
}

- (double)callPopularityGivenSequence
{
  return self->_callPopularityGivenSequence;
}

- (double)messagePopularityGivenSequence
{
  return self->_messagePopularityGivenSequence;
}

- (double)facetimeWithEntityGivenWiFi
{
  return self->_facetimeWithEntityGivenWiFi;
}

- (double)callWithEntityGivenWiFi
{
  return self->_callWithEntityGivenWiFi;
}

- (double)messageWithEntityGivenWiFi
{
  return self->_messageWithEntityGivenWiFi;
}

- (double)wiFiGivenFacetimeWithEntity
{
  return self->_wiFiGivenFacetimeWithEntity;
}

- (double)wiFiGivenCallWithEntity
{
  return self->_wiFiGivenCallWithEntity;
}

- (double)wiFiGivenMessageWithEntity
{
  return self->_wiFiGivenMessageWithEntity;
}

- (double)facetimePopularityGivenWiFi
{
  return self->_facetimePopularityGivenWiFi;
}

- (double)callPopularityGivenWiFi
{
  return self->_callPopularityGivenWiFi;
}

- (double)messagePopularityGivenWiFi
{
  return self->_messagePopularityGivenWiFi;
}

- (double)facetimeWithEntityGivenMotionState
{
  return self->_facetimeWithEntityGivenMotionState;
}

- (double)callWithEntityGivenMotionState
{
  return self->_callWithEntityGivenMotionState;
}

- (double)messageWithEntityGivenMotionState
{
  return self->_messageWithEntityGivenMotionState;
}

- (double)motionStateGivenFacetimeWithEntity
{
  return self->_motionStateGivenFacetimeWithEntity;
}

- (double)motionStateGivenCallWithEntity
{
  return self->_motionStateGivenCallWithEntity;
}

- (double)motionStateGivenMessageWithEntity
{
  return self->_motionStateGivenMessageWithEntity;
}

- (double)facetimePopularityGivenMotionState
{
  return self->_facetimePopularityGivenMotionState;
}

- (double)callPopularityGivenMotionState
{
  return self->_callPopularityGivenMotionState;
}

- (double)messagePopularityGivenMotionState
{
  return self->_messagePopularityGivenMotionState;
}

- (double)facetimeWithEntityGivenMicroLocation
{
  return self->_facetimeWithEntityGivenMicroLocation;
}

- (double)callWithEntityGivenMicroLocation
{
  return self->_callWithEntityGivenMicroLocation;
}

- (double)messageWithEntityGivenMicroLocation
{
  return self->_messageWithEntityGivenMicroLocation;
}

- (double)microLocationGivenFacetimeWithEntity
{
  return self->_microLocationGivenFacetimeWithEntity;
}

- (double)microLocationGivenCallWithEntity
{
  return self->_microLocationGivenCallWithEntity;
}

- (double)microLocationGivenMessageWithEntity
{
  return self->_microLocationGivenMessageWithEntity;
}

- (double)facetimePopularityGivenMicroLocation
{
  return self->_facetimePopularityGivenMicroLocation;
}

- (double)callPopularityGivenMicroLocation
{
  return self->_callPopularityGivenMicroLocation;
}

- (double)messagePopularityGivenMicroLocation
{
  return self->_messagePopularityGivenMicroLocation;
}

- (double)facetimeWithEntityGivenLargeGeoHash
{
  return self->_facetimeWithEntityGivenLargeGeoHash;
}

- (double)callWithEntityGivenLargeGeoHash
{
  return self->_callWithEntityGivenLargeGeoHash;
}

- (double)messageWithEntityGivenLargeGeoHash
{
  return self->_messageWithEntityGivenLargeGeoHash;
}

- (double)largeGeoHashGivenFacetimeWithEntity
{
  return self->_largeGeoHashGivenFacetimeWithEntity;
}

- (double)largeGeoHashGivenCallWithEntity
{
  return self->_largeGeoHashGivenCallWithEntity;
}

- (double)largeGeoHashGivenMessageWithEntity
{
  return self->_largeGeoHashGivenMessageWithEntity;
}

- (double)facetimePopularityGivenLargeGeoHash
{
  return self->_facetimePopularityGivenLargeGeoHash;
}

- (double)callPopularityGivenLargeGeoHash
{
  return self->_callPopularityGivenLargeGeoHash;
}

- (double)messagePopularityGivenLargeGeoHash
{
  return self->_messagePopularityGivenLargeGeoHash;
}

- (double)facetimeWithEntityGivenCoarseGeoHash
{
  return self->_facetimeWithEntityGivenCoarseGeoHash;
}

- (double)callWithEntityGivenCoarseGeoHash
{
  return self->_callWithEntityGivenCoarseGeoHash;
}

- (double)messageWithEntityGivenCoarseGeoHash
{
  return self->_messageWithEntityGivenCoarseGeoHash;
}

- (double)coarseGeoHashGivenFacetimeWithEntity
{
  return self->_coarseGeoHashGivenFacetimeWithEntity;
}

- (double)coarseGeoHashGivenCallWithEntity
{
  return self->_coarseGeoHashGivenCallWithEntity;
}

- (double)coarseGeoHashGivenMessageWithEntity
{
  return self->_coarseGeoHashGivenMessageWithEntity;
}

- (double)facetimePopularityGivenCoarseGeoHash
{
  return self->_facetimePopularityGivenCoarseGeoHash;
}

- (double)callPopularityGivenCoarseGeoHash
{
  return self->_callPopularityGivenCoarseGeoHash;
}

- (double)messagePopularityGivenCoarseGeoHash
{
  return self->_messagePopularityGivenCoarseGeoHash;
}

- (double)facetimeWithEntityGivenSpecificGeoHash
{
  return self->_facetimeWithEntityGivenSpecificGeoHash;
}

- (double)callWithEntityGivenSpecificGeoHash
{
  return self->_callWithEntityGivenSpecificGeoHash;
}

- (double)messageWithEntityGivenSpecificGeoHash
{
  return self->_messageWithEntityGivenSpecificGeoHash;
}

- (double)specificGeoHashGivenFacetimeWithEntity
{
  return self->_specificGeoHashGivenFacetimeWithEntity;
}

- (double)specificGeoHashGivenCallWithEntity
{
  return self->_specificGeoHashGivenCallWithEntity;
}

- (double)specificGeoHashGivenMessageWithEntity
{
  return self->_specificGeoHashGivenMessageWithEntity;
}

- (double)facetimePopularityGivenSpecificGeoHash
{
  return self->_facetimePopularityGivenSpecificGeoHash;
}

- (double)callPopularityGivenSpecificGeoHash
{
  return self->_callPopularityGivenSpecificGeoHash;
}

- (double)messagePopularityGivenSpecificGeoHash
{
  return self->_messagePopularityGivenSpecificGeoHash;
}

- (double)facetimeWithEntityGivenLOI
{
  return self->_facetimeWithEntityGivenLOI;
}

- (double)callWithEntityGivenLOI
{
  return self->_callWithEntityGivenLOI;
}

- (double)messageWithEntityGivenLOI
{
  return self->_messageWithEntityGivenLOI;
}

- (double)LOIGivenFacetimeWithEntity
{
  return self->_LOIGivenFacetimeWithEntity;
}

- (double)LOIGivenCallWithEntity
{
  return self->_LOIGivenCallWithEntity;
}

- (double)LOIGivenMessageWithEntity
{
  return self->_LOIGivenMessageWithEntity;
}

- (double)facetimePopularityGivenLOI
{
  return self->_facetimePopularityGivenLOI;
}

- (double)callPopularityGivenLOI
{
  return self->_callPopularityGivenLOI;
}

- (double)messagePopularityGivenLOI
{
  return self->_messagePopularityGivenLOI;
}

- (double)facetimeWithEntityGivenFocusMode
{
  return self->_facetimeWithEntityGivenFocusMode;
}

- (double)callWithEntityGivenFocusMode
{
  return self->_callWithEntityGivenFocusMode;
}

- (double)messageWithEntityGivenFocusMode
{
  return self->_messageWithEntityGivenFocusMode;
}

- (double)focusModeGivenFacetimeWithEntity
{
  return self->_focusModeGivenFacetimeWithEntity;
}

- (double)focusModeGivenCallWithEntity
{
  return self->_focusModeGivenCallWithEntity;
}

- (double)focusModeGivenMessageWithEntity
{
  return self->_focusModeGivenMessageWithEntity;
}

- (double)facetimePopularityGivenFocusMode
{
  return self->_facetimePopularityGivenFocusMode;
}

- (double)callPopularityGivenFocusMode
{
  return self->_callPopularityGivenFocusMode;
}

- (double)messagePopularityGivenFocusMode
{
  return self->_messagePopularityGivenFocusMode;
}

- (double)facetimeWithEntityGivenDayOfWeek
{
  return self->_facetimeWithEntityGivenDayOfWeek;
}

- (double)callWithEntityGivenDayOfWeek
{
  return self->_callWithEntityGivenDayOfWeek;
}

- (double)messageWithEntityGivenDayOfWeek
{
  return self->_messageWithEntityGivenDayOfWeek;
}

- (double)dayOfWeekGivenFacetimeWithEntity
{
  return self->_dayOfWeekGivenFacetimeWithEntity;
}

- (double)dayOfWeekGivenCallWithEntity
{
  return self->_dayOfWeekGivenCallWithEntity;
}

- (double)dayOfWeekGivenMessageWithEntity
{
  return self->_dayOfWeekGivenMessageWithEntity;
}

- (double)facetimePopularityGivenDayOfWeek
{
  return self->_facetimePopularityGivenDayOfWeek;
}

- (double)callPopularityGivenDayOfWeek
{
  return self->_callPopularityGivenDayOfWeek;
}

- (double)messagePopularityGivenDayOfWeek
{
  return self->_messagePopularityGivenDayOfWeek;
}

- (double)facetimeWithEntityGivenCoarseTimeOfDay
{
  return self->_facetimeWithEntityGivenCoarseTimeOfDay;
}

- (double)callWithEntityGivenCoarseTimeOfDay
{
  return self->_callWithEntityGivenCoarseTimeOfDay;
}

- (double)messageWithEntityGivenCoarseTimeOfDay
{
  return self->_messageWithEntityGivenCoarseTimeOfDay;
}

- (double)coarseTimeOfDayGivenFacetimeWithEntity
{
  return self->_coarseTimeOfDayGivenFacetimeWithEntity;
}

- (double)coarseTimeOfDayGivenCallWithEntity
{
  return self->_coarseTimeOfDayGivenCallWithEntity;
}

- (double)coarseTimeOfDayGivenMessageWithEntity
{
  return self->_coarseTimeOfDayGivenMessageWithEntity;
}

- (double)facetimePopularityGivenCoarseTimeOfDay
{
  return self->_facetimePopularityGivenCoarseTimeOfDay;
}

- (double)callPopularityGivenCoarseTimeOfDay
{
  return self->_callPopularityGivenCoarseTimeOfDay;
}

- (double)messagePopularityGivenCoarseTimeOfDay
{
  return self->_messagePopularityGivenCoarseTimeOfDay;
}

- (double)facetimeWithEntityGivenTimeOfDay
{
  return self->_facetimeWithEntityGivenTimeOfDay;
}

- (double)callWithEntityGivenTimeOfDay
{
  return self->_callWithEntityGivenTimeOfDay;
}

- (double)messageWithEntityGivenTimeOfDay
{
  return self->_messageWithEntityGivenTimeOfDay;
}

- (double)timeOfDayGivenFacetimeWithEntity
{
  return self->_timeOfDayGivenFacetimeWithEntity;
}

- (double)timeOfDayGivenCallWithEntity
{
  return self->_timeOfDayGivenCallWithEntity;
}

- (double)timeOfDayGivenMessageWithEntity
{
  return self->_timeOfDayGivenMessageWithEntity;
}

- (double)facetimePopularityGivenTimeOfDay
{
  return self->_facetimePopularityGivenTimeOfDay;
}

- (double)callPopularityGivenTimeOfDay
{
  return self->_callPopularityGivenTimeOfDay;
}

- (double)messagePopularityGivenTimeOfDay
{
  return self->_messagePopularityGivenTimeOfDay;
}

- (double)topicScore
{
  return self->_topicScore;
}

- (double)candidateEventNameScore
{
  return self->_candidateEventNameScore;
}

- (double)candidateEventLocationScore
{
  return self->_candidateEventLocationScore;
}

- (double)candidateLocationScore
{
  return self->_candidateLocationScore;
}

- (double)candidateOrganizationScore
{
  return self->_candidateOrganizationScore;
}

- (double)candidateCommunicationScore
{
  return self->_candidateCommunicationScore;
}

- (double)candidateNameScore
{
  return self->_candidateNameScore;
}

- (double)candidateNameSimilarity
{
  return self->_candidateNameSimilarity;
}

- (id)description
{
  v6 = NSString;
  objc_msgSend_candidateNameScore(self, a2, v2, v3, v4);
  uint64_t v8 = v7;
  objc_msgSend_candidateCommunicationScore(self, v9, v10, v11, v12);
  uint64_t v14 = v13;
  objc_msgSend_candidateLocationScore(self, v15, v16, v17, v18);
  uint64_t v20 = v19;
  objc_msgSend_candidateEventNameScore(self, v21, v22, v23, v24);
  uint64_t v26 = v25;
  objc_msgSend_candidateOrganizationScore(self, v27, v28, v29, v30);
  uint64_t v32 = v31;
  objc_msgSend_messagePopularityGivenCoarseTimeOfDay(self, v33, v34, v35, v36);
  uint64_t v38 = v37;
  objc_msgSend_locationTrendingPopularity(self, v39, v40, v41, v42);
  return (id)objc_msgSend_stringWithFormat_(v6, v43, @"<GDEntityFeatures: name score: %f, communication score: %f, location score: %f, event name score: %f, misc/organization score: %f, course time of day message score: %f, location trending popularity: %f>", v44, v45, v8, v14, v20, v26, v32, v38, v46);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  return (id)objc_msgSend_initWithCandidateNameScore_candidateCommunicationScore_candidateOrganizationScore_candidateLocationScore_candidateEventLocationScore_candidateEventNameScore_topicScore_messagePopularityGivenTimeOfDay_callPopularityGivenTimeOfDay_facetimePopularityGivenTimeOfDay_timeOfDayGivenMessageWithEntity_timeOfDayGivenCallWithEntity_timeOfDayGivenFacetimeWithEntity_messageWithEntityGivenTimeOfDay_callWithEntityGivenTimeOfDay_facetimeWithEntityGivenTimeOfDay_messagePopularityGivenCoarseTimeOfDay_callPopularityGivenCoarseTimeOfDay_facetimePopularityGivenCoarseTimeOfDay_coarseTimeOfDayGivenMessageWithEntity_coarseTimeOfDayGivenCallWithEntity_coarseTimeOfDayGivenFacetimeWithEntity_messageWithEntityGivenCoarseTimeOfDay_callWithEntityGivenCoarseTimeOfDay_facetimeWithEntityGivenCoarseTimeOfDay_messagePopularityGivenDayOfWeek_callPopularityGivenDayOfWeek_facetimePopularityGivenDayOfWeek_dayOfWeekGivenMessageWithEntity_dayOfWeekGivenCallWithEntity_dayOfWeekGivenFacetimeWithEntity_messageWithEntityGivenDayOfWeek_callWithEntityGivenDayOfWeek_facetimeWithEntityGivenDayOfWeek_messagePopularityGivenFocusMode_callPopularityGivenFocusMode_facetimePopularityGivenFocusMode_focusModeGivenMessageWithEntity_focusModeGivenCallWithEntity_focusModeGivenFacetimeWithEntity_messageWithEntityGivenFocusMode_callWithEntityGivenFocusMode_facetimeWithEntityGivenFocusMode_messagePopularityGivenLOI_callPopularityGivenLOI_facetimePopularityGivenLOI_LOIGivenMessageWithEntity_LOIGivenCallWithEntity_LOIGivenFacetimeWithEntity_messageWithEntityGivenLOI_callWithEntityGivenLOI_facetimeWithEntityGivenLOI_messagePopularityGivenSpecificGeoHash_callPopularityGivenSpecificGeoHash_facetimePopularityGivenSpecificGeoHash_specificGeoHashGivenMessageWithEntity_specificGeoHashGivenCallWithEntity_specificGeoHashGivenFacetimeWithEntity_messageWithEntityGivenSpecificGeoHash_callWithEntityGivenSpecificGeoHash_facetimeWithEntityGivenSpecificGeoHash_messagePopularityGivenCoarseGeoHash_callPopularityGivenCoarseGeoHash_facetimePopularityGivenCoarseGeoHash_coarseGeoHashGivenMessageWithEntity_coarseGeoHashGivenCallWithEntity_coarseGeoHashGivenFacetimeWithEntity_messageWithEntityGivenCoarseGeoHash_callWithEntityGivenCoarseGeoHash_facetimeWithEntityGivenCoarseGeoHash_messagePopularityGivenLargeGeoHash_callPopularityGivenLargeGeoHash_facetimePopularityGivenLargeGeoHash_largeGeoHashGivenMessageWithEntity_largeGeoHashGivenCallWithEntity_largeGeoHashGivenFacetimeWithEntity_messageWithEntityGivenLargeGeoHash_callWithEntityGivenLargeGeoHash_facetimeWithEntityGivenLargeGeoHash_messagePopularityGivenMicroLocation_callPopularityGivenMicroLocation_facetimePopularityGivenMicroLocation_microLocationGivenMessageWithEntity_microLocationGivenCallWithEntity_microLocationGivenFacetimeWithEntity_messageWithEntityGivenMicroLocation_callWithEntityGivenMicroLocation_facetimeWithEntityGivenMicroLocation_messagePopularityGivenMotionState_callPopularityGivenMotionState_facetimePopularityGivenMotionState_motionStateGivenMessageWithEntity_motionStateGivenCallWithEntity_motionStateGivenFacetimeWithEntity_messageWithEntityGivenMotionState_callWithEntityGivenMotionState_facetimeWithEntityGivenMotionState_messagePopularityGivenWiFi_callPopularityGivenWiFi_facetimePopularityGivenWiFi_wiFiGivenMessageWithEntity_wiFiGivenCallWithEntity_wiFiGivenFacetimeWithEntity_messageWithEntityGivenWiFi_callWithEntityGivenWiFi_facetimeWithEntityGivenWiFi_messagePopularityGivenSequence_callPopularityGivenSequence_facetimePopularityGivenSequence_sequenceGivenMessageWithEntity_sequenceGivenCallWithEntity_sequenceGivenFacetimeWithEntity_lastExecutionAge_medianTimeIntervalBetweenExecution_dailyDoseL1Error_dailyDoseL2Error_shortTermTrendingPopularity_trendingPopularity_longTermTrendingPopularity_locationLastExecutationAge_locationPopularityGivenSpecificGeoHash_locationTrendingPopularity_(v9, v10, self->_lastExecutionAge, self->_medianTimeIntervalBetweenExecution, self->_dailyDoseL1Error, self->_locationLastExecutionAge, self->_candidateNameScore, self->_candidateCommunicationScore, self->_candidateOrganizationScore, self->_candidateLocationScore, self->_candidateEventLocationScore, self->_candidateEventNameScore, self->_topicScore, self->_messagePopularityGivenTimeOfDay, *(void *)&self->_callPopularityGivenTimeOfDay, *(void *)&self->_facetimePopularityGivenTimeOfDay, *(void *)&self->_timeOfDayGivenMessageWithEntity, *(void *)&self->_timeOfDayGivenCallWithEntity, *(void *)&self->_timeOfDayGivenFacetimeWithEntity,
               *(void *)&self->_messageWithEntityGivenTimeOfDay,
               *(void *)&self->_callWithEntityGivenTimeOfDay,
               *(void *)&self->_facetimeWithEntityGivenTimeOfDay,
               *(void *)&self->_messagePopularityGivenCoarseTimeOfDay,
               *(void *)&self->_callPopularityGivenCoarseTimeOfDay,
               *(void *)&self->_facetimePopularityGivenCoarseTimeOfDay,
               *(void *)&self->_coarseTimeOfDayGivenMessageWithEntity,
               *(_OWORD *)&self->_coarseTimeOfDayGivenCallWithEntity,
               *(void *)&self->_messageWithEntityGivenCoarseTimeOfDay,
               *(void *)&self->_callWithEntityGivenCoarseTimeOfDay,
               *(_OWORD *)&self->_facetimeWithEntityGivenCoarseTimeOfDay,
               *(_OWORD *)&self->_callPopularityGivenDayOfWeek,
               *(_OWORD *)&self->_dayOfWeekGivenMessageWithEntity,
               *(_OWORD *)&self->_dayOfWeekGivenFacetimeWithEntity,
               *(_OWORD *)&self->_callWithEntityGivenDayOfWeek,
               *(_OWORD *)&self->_messagePopularityGivenFocusMode,
               *(_OWORD *)&self->_facetimePopularityGivenFocusMode,
               *(_OWORD *)&self->_focusModeGivenCallWithEntity,
               *(_OWORD *)&self->_messageWithEntityGivenFocusMode,
               *(_OWORD *)&self->_facetimeWithEntityGivenFocusMode,
               *(_OWORD *)&self->_callPopularityGivenLOI,
               *(_OWORD *)&self->_LOIGivenMessageWithEntity,
               *(_OWORD *)&self->_LOIGivenFacetimeWithEntity,
               *(_OWORD *)&self->_callWithEntityGivenLOI,
               *(_OWORD *)&self->_messagePopularityGivenSpecificGeoHash,
               *(_OWORD *)&self->_facetimePopularityGivenSpecificGeoHash,
               *(void *)&self->_specificGeoHashGivenCallWithEntity);
}

- (GDEntityFeatures)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_candidateNameScore);
  objc_msgSend_decodeDoubleForKey_(v4, v6, (uint64_t)v5, v7, v8);
  double v618 = v9;

  uint64_t v10 = NSStringFromSelector(sel_candidateCommunicationScore);
  objc_msgSend_decodeDoubleForKey_(v4, v11, (uint64_t)v10, v12, v13);
  double v617 = v14;

  v15 = NSStringFromSelector(sel_candidateOrganizationScore);
  objc_msgSend_decodeDoubleForKey_(v4, v16, (uint64_t)v15, v17, v18);
  double v616 = v19;

  uint64_t v20 = NSStringFromSelector(sel_candidateLocationScore);
  objc_msgSend_decodeDoubleForKey_(v4, v21, (uint64_t)v20, v22, v23);
  double v615 = v24;

  uint64_t v25 = NSStringFromSelector(sel_candidateEventLocationScore);
  objc_msgSend_decodeDoubleForKey_(v4, v26, (uint64_t)v25, v27, v28);
  double v614 = v29;

  uint64_t v30 = NSStringFromSelector(sel_candidateEventNameScore);
  objc_msgSend_decodeDoubleForKey_(v4, v31, (uint64_t)v30, v32, v33);
  double v613 = v34;

  uint64_t v35 = NSStringFromSelector(sel_topicScore);
  objc_msgSend_decodeDoubleForKey_(v4, v36, (uint64_t)v35, v37, v38);
  double v612 = v39;

  uint64_t v40 = NSStringFromSelector(sel_messagePopularityGivenTimeOfDay);
  objc_msgSend_decodeDoubleForKey_(v4, v41, (uint64_t)v40, v42, v43);
  double v611 = v44;

  uint64_t v45 = NSStringFromSelector(sel_callPopularityGivenTimeOfDay);
  objc_msgSend_decodeDoubleForKey_(v4, v46, (uint64_t)v45, v47, v48);
  uint64_t v610 = v49;

  v50 = NSStringFromSelector(sel_facetimePopularityGivenTimeOfDay);
  objc_msgSend_decodeDoubleForKey_(v4, v51, (uint64_t)v50, v52, v53);
  uint64_t v609 = v54;

  v55 = NSStringFromSelector(sel_timeOfDayGivenMessageWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v56, (uint64_t)v55, v57, v58);
  uint64_t v608 = v59;

  v60 = NSStringFromSelector(sel_timeOfDayGivenCallWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v61, (uint64_t)v60, v62, v63);
  uint64_t v607 = v64;

  v65 = NSStringFromSelector(sel_timeOfDayGivenFacetimeWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v66, (uint64_t)v65, v67, v68);
  uint64_t v606 = v69;

  v70 = NSStringFromSelector(sel_messageWithEntityGivenTimeOfDay);
  objc_msgSend_decodeDoubleForKey_(v4, v71, (uint64_t)v70, v72, v73);
  uint64_t v605 = v74;

  v75 = NSStringFromSelector(sel_callWithEntityGivenTimeOfDay);
  objc_msgSend_decodeDoubleForKey_(v4, v76, (uint64_t)v75, v77, v78);
  uint64_t v604 = v79;

  v80 = NSStringFromSelector(sel_facetimeWithEntityGivenTimeOfDay);
  objc_msgSend_decodeDoubleForKey_(v4, v81, (uint64_t)v80, v82, v83);
  uint64_t v603 = v84;

  v85 = NSStringFromSelector(sel_messagePopularityGivenCoarseTimeOfDay);
  objc_msgSend_decodeDoubleForKey_(v4, v86, (uint64_t)v85, v87, v88);
  uint64_t v602 = v89;

  v90 = NSStringFromSelector(sel_callPopularityGivenCoarseTimeOfDay);
  objc_msgSend_decodeDoubleForKey_(v4, v91, (uint64_t)v90, v92, v93);
  uint64_t v601 = v94;

  v95 = NSStringFromSelector(sel_facetimePopularityGivenCoarseTimeOfDay);
  objc_msgSend_decodeDoubleForKey_(v4, v96, (uint64_t)v95, v97, v98);
  uint64_t v600 = v99;

  v100 = NSStringFromSelector(sel_coarseTimeOfDayGivenMessageWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v101, (uint64_t)v100, v102, v103);
  uint64_t v599 = v104;

  v105 = NSStringFromSelector(sel_coarseTimeOfDayGivenCallWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v106, (uint64_t)v105, v107, v108);
  uint64_t v598 = v109;

  v110 = NSStringFromSelector(sel_coarseTimeOfDayGivenFacetimeWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v111, (uint64_t)v110, v112, v113);
  uint64_t v597 = v114;

  v115 = NSStringFromSelector(sel_messageWithEntityGivenCoarseTimeOfDay);
  objc_msgSend_decodeDoubleForKey_(v4, v116, (uint64_t)v115, v117, v118);
  uint64_t v596 = v119;

  v120 = NSStringFromSelector(sel_callWithEntityGivenCoarseTimeOfDay);
  objc_msgSend_decodeDoubleForKey_(v4, v121, (uint64_t)v120, v122, v123);
  uint64_t v595 = v124;

  v125 = NSStringFromSelector(sel_facetimeWithEntityGivenCoarseTimeOfDay);
  objc_msgSend_decodeDoubleForKey_(v4, v126, (uint64_t)v125, v127, v128);
  uint64_t v594 = v129;

  v130 = NSStringFromSelector(sel_messagePopularityGivenDayOfWeek);
  objc_msgSend_decodeDoubleForKey_(v4, v131, (uint64_t)v130, v132, v133);
  uint64_t v593 = v134;

  v135 = NSStringFromSelector(sel_callPopularityGivenDayOfWeek);
  objc_msgSend_decodeDoubleForKey_(v4, v136, (uint64_t)v135, v137, v138);
  uint64_t v592 = v139;

  v140 = NSStringFromSelector(sel_facetimePopularityGivenDayOfWeek);
  objc_msgSend_decodeDoubleForKey_(v4, v141, (uint64_t)v140, v142, v143);
  uint64_t v591 = v144;

  v145 = NSStringFromSelector(sel_dayOfWeekGivenMessageWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v146, (uint64_t)v145, v147, v148);
  uint64_t v590 = v149;

  v150 = NSStringFromSelector(sel_dayOfWeekGivenCallWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v151, (uint64_t)v150, v152, v153);
  uint64_t v589 = v154;

  v155 = NSStringFromSelector(sel_dayOfWeekGivenFacetimeWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v156, (uint64_t)v155, v157, v158);
  uint64_t v588 = v159;

  v160 = NSStringFromSelector(sel_messageWithEntityGivenDayOfWeek);
  objc_msgSend_decodeDoubleForKey_(v4, v161, (uint64_t)v160, v162, v163);
  uint64_t v587 = v164;

  v165 = NSStringFromSelector(sel_callWithEntityGivenDayOfWeek);
  objc_msgSend_decodeDoubleForKey_(v4, v166, (uint64_t)v165, v167, v168);
  uint64_t v586 = v169;

  v170 = NSStringFromSelector(sel_facetimeWithEntityGivenDayOfWeek);
  objc_msgSend_decodeDoubleForKey_(v4, v171, (uint64_t)v170, v172, v173);
  uint64_t v585 = v174;

  v175 = NSStringFromSelector(sel_messagePopularityGivenFocusMode);
  objc_msgSend_decodeDoubleForKey_(v4, v176, (uint64_t)v175, v177, v178);
  uint64_t v584 = v179;

  v180 = NSStringFromSelector(sel_callPopularityGivenFocusMode);
  objc_msgSend_decodeDoubleForKey_(v4, v181, (uint64_t)v180, v182, v183);
  uint64_t v583 = v184;

  v185 = NSStringFromSelector(sel_facetimePopularityGivenFocusMode);
  objc_msgSend_decodeDoubleForKey_(v4, v186, (uint64_t)v185, v187, v188);
  uint64_t v582 = v189;

  v190 = NSStringFromSelector(sel_focusModeGivenMessageWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v191, (uint64_t)v190, v192, v193);
  uint64_t v581 = v194;

  v195 = NSStringFromSelector(sel_focusModeGivenCallWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v196, (uint64_t)v195, v197, v198);
  uint64_t v580 = v199;

  v200 = NSStringFromSelector(sel_focusModeGivenFacetimeWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v201, (uint64_t)v200, v202, v203);
  uint64_t v579 = v204;

  v205 = NSStringFromSelector(sel_messageWithEntityGivenFocusMode);
  objc_msgSend_decodeDoubleForKey_(v4, v206, (uint64_t)v205, v207, v208);
  uint64_t v578 = v209;

  v210 = NSStringFromSelector(sel_callWithEntityGivenFocusMode);
  objc_msgSend_decodeDoubleForKey_(v4, v211, (uint64_t)v210, v212, v213);
  uint64_t v577 = v214;

  v215 = NSStringFromSelector(sel_facetimeWithEntityGivenFocusMode);
  objc_msgSend_decodeDoubleForKey_(v4, v216, (uint64_t)v215, v217, v218);
  uint64_t v576 = v219;

  v220 = NSStringFromSelector(sel_messagePopularityGivenLOI);
  objc_msgSend_decodeDoubleForKey_(v4, v221, (uint64_t)v220, v222, v223);
  uint64_t v575 = v224;

  v225 = NSStringFromSelector(sel_callPopularityGivenLOI);
  objc_msgSend_decodeDoubleForKey_(v4, v226, (uint64_t)v225, v227, v228);
  uint64_t v574 = v229;

  v230 = NSStringFromSelector(sel_facetimePopularityGivenLOI);
  objc_msgSend_decodeDoubleForKey_(v4, v231, (uint64_t)v230, v232, v233);
  uint64_t v573 = v234;

  v235 = NSStringFromSelector(sel_LOIGivenMessageWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v236, (uint64_t)v235, v237, v238);
  uint64_t v572 = v239;

  v240 = NSStringFromSelector(sel_LOIGivenCallWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v241, (uint64_t)v240, v242, v243);
  uint64_t v571 = v244;

  v245 = NSStringFromSelector(sel_LOIGivenFacetimeWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v246, (uint64_t)v245, v247, v248);
  uint64_t v570 = v249;

  v250 = NSStringFromSelector(sel_messageWithEntityGivenLOI);
  objc_msgSend_decodeDoubleForKey_(v4, v251, (uint64_t)v250, v252, v253);
  uint64_t v569 = v254;

  v255 = NSStringFromSelector(sel_callWithEntityGivenLOI);
  objc_msgSend_decodeDoubleForKey_(v4, v256, (uint64_t)v255, v257, v258);
  uint64_t v568 = v259;

  v260 = NSStringFromSelector(sel_facetimeWithEntityGivenLOI);
  objc_msgSend_decodeDoubleForKey_(v4, v261, (uint64_t)v260, v262, v263);
  uint64_t v567 = v264;

  v265 = NSStringFromSelector(sel_messagePopularityGivenSpecificGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v266, (uint64_t)v265, v267, v268);
  uint64_t v566 = v269;

  v270 = NSStringFromSelector(sel_callPopularityGivenSpecificGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v271, (uint64_t)v270, v272, v273);
  uint64_t v565 = v274;

  v275 = NSStringFromSelector(sel_facetimePopularityGivenSpecificGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v276, (uint64_t)v275, v277, v278);
  uint64_t v564 = v279;

  v280 = NSStringFromSelector(sel_specificGeoHashGivenMessageWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v281, (uint64_t)v280, v282, v283);
  uint64_t v563 = v284;

  v285 = NSStringFromSelector(sel_specificGeoHashGivenCallWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v286, (uint64_t)v285, v287, v288);
  uint64_t v562 = v289;

  v290 = NSStringFromSelector(sel_specificGeoHashGivenFacetimeWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v291, (uint64_t)v290, v292, v293);

  v294 = NSStringFromSelector(sel_messageWithEntityGivenSpecificGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v295, (uint64_t)v294, v296, v297);

  v298 = NSStringFromSelector(sel_callWithEntityGivenSpecificGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v299, (uint64_t)v298, v300, v301);

  v302 = NSStringFromSelector(sel_facetimeWithEntityGivenSpecificGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v303, (uint64_t)v302, v304, v305);

  v306 = NSStringFromSelector(sel_messagePopularityGivenCoarseGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v307, (uint64_t)v306, v308, v309);

  v310 = NSStringFromSelector(sel_callPopularityGivenCoarseGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v311, (uint64_t)v310, v312, v313);

  v314 = NSStringFromSelector(sel_facetimePopularityGivenCoarseGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v315, (uint64_t)v314, v316, v317);

  v318 = NSStringFromSelector(sel_coarseGeoHashGivenMessageWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v319, (uint64_t)v318, v320, v321);

  v322 = NSStringFromSelector(sel_coarseGeoHashGivenCallWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v323, (uint64_t)v322, v324, v325);

  v326 = NSStringFromSelector(sel_coarseGeoHashGivenFacetimeWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v327, (uint64_t)v326, v328, v329);

  v330 = NSStringFromSelector(sel_messageWithEntityGivenCoarseGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v331, (uint64_t)v330, v332, v333);

  v334 = NSStringFromSelector(sel_callWithEntityGivenCoarseGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v335, (uint64_t)v334, v336, v337);

  v338 = NSStringFromSelector(sel_facetimeWithEntityGivenCoarseGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v339, (uint64_t)v338, v340, v341);

  v342 = NSStringFromSelector(sel_messagePopularityGivenLargeGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v343, (uint64_t)v342, v344, v345);

  v346 = NSStringFromSelector(sel_callPopularityGivenLargeGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v347, (uint64_t)v346, v348, v349);

  v350 = NSStringFromSelector(sel_facetimePopularityGivenLargeGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v351, (uint64_t)v350, v352, v353);

  v354 = NSStringFromSelector(sel_largeGeoHashGivenMessageWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v355, (uint64_t)v354, v356, v357);

  v358 = NSStringFromSelector(sel_largeGeoHashGivenCallWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v359, (uint64_t)v358, v360, v361);

  v362 = NSStringFromSelector(sel_largeGeoHashGivenFacetimeWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v363, (uint64_t)v362, v364, v365);

  v366 = NSStringFromSelector(sel_messageWithEntityGivenLargeGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v367, (uint64_t)v366, v368, v369);

  v370 = NSStringFromSelector(sel_callWithEntityGivenLargeGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v371, (uint64_t)v370, v372, v373);

  v374 = NSStringFromSelector(sel_facetimeWithEntityGivenLargeGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v375, (uint64_t)v374, v376, v377);

  v378 = NSStringFromSelector(sel_messagePopularityGivenMicroLocation);
  objc_msgSend_decodeDoubleForKey_(v4, v379, (uint64_t)v378, v380, v381);

  v382 = NSStringFromSelector(sel_callPopularityGivenMicroLocation);
  objc_msgSend_decodeDoubleForKey_(v4, v383, (uint64_t)v382, v384, v385);

  v386 = NSStringFromSelector(sel_facetimePopularityGivenMicroLocation);
  objc_msgSend_decodeDoubleForKey_(v4, v387, (uint64_t)v386, v388, v389);

  v390 = NSStringFromSelector(sel_microLocationGivenMessageWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v391, (uint64_t)v390, v392, v393);

  v394 = NSStringFromSelector(sel_microLocationGivenCallWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v395, (uint64_t)v394, v396, v397);

  v398 = NSStringFromSelector(sel_microLocationGivenFacetimeWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v399, (uint64_t)v398, v400, v401);

  v402 = NSStringFromSelector(sel_messageWithEntityGivenMicroLocation);
  objc_msgSend_decodeDoubleForKey_(v4, v403, (uint64_t)v402, v404, v405);

  v406 = NSStringFromSelector(sel_callWithEntityGivenMicroLocation);
  objc_msgSend_decodeDoubleForKey_(v4, v407, (uint64_t)v406, v408, v409);

  v410 = NSStringFromSelector(sel_facetimeWithEntityGivenMicroLocation);
  objc_msgSend_decodeDoubleForKey_(v4, v411, (uint64_t)v410, v412, v413);

  v414 = NSStringFromSelector(sel_messagePopularityGivenMotionState);
  objc_msgSend_decodeDoubleForKey_(v4, v415, (uint64_t)v414, v416, v417);

  v418 = NSStringFromSelector(sel_callPopularityGivenMotionState);
  objc_msgSend_decodeDoubleForKey_(v4, v419, (uint64_t)v418, v420, v421);

  v422 = NSStringFromSelector(sel_facetimePopularityGivenMotionState);
  objc_msgSend_decodeDoubleForKey_(v4, v423, (uint64_t)v422, v424, v425);

  v426 = NSStringFromSelector(sel_motionStateGivenMessageWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v427, (uint64_t)v426, v428, v429);

  v430 = NSStringFromSelector(sel_motionStateGivenCallWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v431, (uint64_t)v430, v432, v433);

  v434 = NSStringFromSelector(sel_motionStateGivenFacetimeWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v435, (uint64_t)v434, v436, v437);

  v438 = NSStringFromSelector(sel_messageWithEntityGivenMotionState);
  objc_msgSend_decodeDoubleForKey_(v4, v439, (uint64_t)v438, v440, v441);

  v442 = NSStringFromSelector(sel_callWithEntityGivenMotionState);
  objc_msgSend_decodeDoubleForKey_(v4, v443, (uint64_t)v442, v444, v445);

  v446 = NSStringFromSelector(sel_facetimeWithEntityGivenMotionState);
  objc_msgSend_decodeDoubleForKey_(v4, v447, (uint64_t)v446, v448, v449);

  v450 = NSStringFromSelector(sel_messagePopularityGivenWiFi);
  objc_msgSend_decodeDoubleForKey_(v4, v451, (uint64_t)v450, v452, v453);

  v454 = NSStringFromSelector(sel_callPopularityGivenWiFi);
  objc_msgSend_decodeDoubleForKey_(v4, v455, (uint64_t)v454, v456, v457);

  v458 = NSStringFromSelector(sel_facetimePopularityGivenWiFi);
  objc_msgSend_decodeDoubleForKey_(v4, v459, (uint64_t)v458, v460, v461);

  v462 = NSStringFromSelector(sel_wiFiGivenMessageWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v463, (uint64_t)v462, v464, v465);

  v466 = NSStringFromSelector(sel_wiFiGivenCallWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v467, (uint64_t)v466, v468, v469);

  v470 = NSStringFromSelector(sel_wiFiGivenFacetimeWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v471, (uint64_t)v470, v472, v473);

  v474 = NSStringFromSelector(sel_messageWithEntityGivenWiFi);
  objc_msgSend_decodeDoubleForKey_(v4, v475, (uint64_t)v474, v476, v477);

  v478 = NSStringFromSelector(sel_callWithEntityGivenWiFi);
  objc_msgSend_decodeDoubleForKey_(v4, v479, (uint64_t)v478, v480, v481);

  v482 = NSStringFromSelector(sel_facetimeWithEntityGivenWiFi);
  objc_msgSend_decodeDoubleForKey_(v4, v483, (uint64_t)v482, v484, v485);

  v486 = NSStringFromSelector(sel_messagePopularityGivenSequence);
  objc_msgSend_decodeDoubleForKey_(v4, v487, (uint64_t)v486, v488, v489);

  v490 = NSStringFromSelector(sel_callPopularityGivenSequence);
  objc_msgSend_decodeDoubleForKey_(v4, v491, (uint64_t)v490, v492, v493);

  v494 = NSStringFromSelector(sel_facetimePopularityGivenSequence);
  objc_msgSend_decodeDoubleForKey_(v4, v495, (uint64_t)v494, v496, v497);

  v498 = NSStringFromSelector(sel_sequenceGivenMessageWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v499, (uint64_t)v498, v500, v501);

  v502 = NSStringFromSelector(sel_sequenceGivenCallWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v503, (uint64_t)v502, v504, v505);

  v506 = NSStringFromSelector(sel_sequenceGivenFacetimeWithEntity);
  objc_msgSend_decodeDoubleForKey_(v4, v507, (uint64_t)v506, v508, v509);

  v510 = NSStringFromSelector(sel_lastExecutionAge);
  uint64_t v514 = objc_msgSend_decodeIntForKey_(v4, v511, (uint64_t)v510, v512, v513);

  v515 = NSStringFromSelector(sel_medianTimeIntervalBetweenExecution);
  uint64_t v519 = objc_msgSend_decodeIntForKey_(v4, v516, (uint64_t)v515, v517, v518);

  v520 = NSStringFromSelector(sel_dailyDoseL1Error);
  uint64_t v524 = objc_msgSend_decodeIntForKey_(v4, v521, (uint64_t)v520, v522, v523);

  v525 = NSStringFromSelector(sel_dailyDoseL2Error);
  objc_msgSend_decodeDoubleForKey_(v4, v526, (uint64_t)v525, v527, v528);

  v529 = NSStringFromSelector(sel_shortTermTrendingPopularity);
  objc_msgSend_decodeDoubleForKey_(v4, v530, (uint64_t)v529, v531, v532);

  v533 = NSStringFromSelector(sel_trendingPopularity);
  objc_msgSend_decodeDoubleForKey_(v4, v534, (uint64_t)v533, v535, v536);

  v537 = NSStringFromSelector(sel_longTermTrendingPopularity);
  objc_msgSend_decodeDoubleForKey_(v4, v538, (uint64_t)v537, v539, v540);

  v541 = NSStringFromSelector(sel_locationLastExecutionAge);
  uint64_t v545 = objc_msgSend_decodeIntForKey_(v4, v542, (uint64_t)v541, v543, v544);

  v546 = NSStringFromSelector(sel_locationTrendingPopularity);
  objc_msgSend_decodeDoubleForKey_(v4, v547, (uint64_t)v546, v548, v549);

  v550 = NSStringFromSelector(sel_locationPopularityGivenSpecificGeoHash);
  objc_msgSend_decodeDoubleForKey_(v4, v551, (uint64_t)v550, v552, v553);

  v558 = objc_msgSend_error(v4, v554, v555, v556, v557);

  if (v558)
  {
    v560 = 0;
  }
  else
  {
    self = (GDEntityFeatures *)objc_retain((id)objc_msgSend_initWithCandidateNameScore_candidateCommunicationScore_candidateOrganizationScore_candidateLocationScore_candidateEventLocationScore_candidateEventNameScore_topicScore_messagePopularityGivenTimeOfDay_callPopularityGivenTimeOfDay_facetimePopularityGivenTimeOfDay_timeOfDayGivenMessageWithEntity_timeOfDayGivenCallWithEntity_timeOfDayGivenFacetimeWithEntity_messageWithEntityGivenTimeOfDay_callWithEntityGivenTimeOfDay_facetimeWithEntityGivenTimeOfDay_messagePopularityGivenCoarseTimeOfDay_callPopularityGivenCoarseTimeOfDay_facetimePopularityGivenCoarseTimeOfDay_coarseTimeOfDayGivenMessageWithEntity_coarseTimeOfDayGivenCallWithEntity_coarseTimeOfDayGivenFacetimeWithEntity_messageWithEntityGivenCoarseTimeOfDay_callWithEntityGivenCoarseTimeOfDay_facetimeWithEntityGivenCoarseTimeOfDay_messagePopularityGivenDayOfWeek_callPopularityGivenDayOfWeek_facetimePopularityGivenDayOfWeek_dayOfWeekGivenMessageWithEntity_dayOfWeekGivenCallWithEntity_dayOfWeekGivenFacetimeWithEntity_messageWithEntityGivenDayOfWeek_callWithEntityGivenDayOfWeek_facetimeWithEntityGivenDayOfWeek_messagePopularityGivenFocusMode_callPopularityGivenFocusMode_facetimePopularityGivenFocusMode_focusModeGivenMessageWithEntity_focusModeGivenCallWithEntity_focusModeGivenFacetimeWithEntity_messageWithEntityGivenFocusMode_callWithEntityGivenFocusMode_facetimeWithEntityGivenFocusMode_messagePopularityGivenLOI_callPopularityGivenLOI_facetimePopularityGivenLOI_LOIGivenMessageWithEntity_LOIGivenCallWithEntity_LOIGivenFacetimeWithEntity_messageWithEntityGivenLOI_callWithEntityGivenLOI_facetimeWithEntityGivenLOI_messagePopularityGivenSpecificGeoHash_callPopularityGivenSpecificGeoHash_facetimePopularityGivenSpecificGeoHash_specificGeoHashGivenMessageWithEntity_specificGeoHashGivenCallWithEntity_specificGeoHashGivenFacetimeWithEntity_messageWithEntityGivenSpecificGeoHash_callWithEntityGivenSpecificGeoHash_facetimeWithEntityGivenSpecificGeoHash_messagePopularityGivenCoarseGeoHash_callPopularityGivenCoarseGeoHash_facetimePopularityGivenCoarseGeoHash_coarseGeoHashGivenMessageWithEntity_coarseGeoHashGivenCallWithEntity_coarseGeoHashGivenFacetimeWithEntity_messageWithEntityGivenCoarseGeoHash_callWithEntityGivenCoarseGeoHash_facetimeWithEntityGivenCoarseGeoHash_messagePopularityGivenLargeGeoHash_callPopularityGivenLargeGeoHash_facetimePopularityGivenLargeGeoHash_largeGeoHashGivenMessageWithEntity_largeGeoHashGivenCallWithEntity_largeGeoHashGivenFacetimeWithEntity_messageWithEntityGivenLargeGeoHash_callWithEntityGivenLargeGeoHash_facetimeWithEntityGivenLargeGeoHash_messagePopularityGivenMicroLocation_callPopularityGivenMicroLocation_facetimePopularityGivenMicroLocation_microLocationGivenMessageWithEntity_microLocationGivenCallWithEntity_microLocationGivenFacetimeWithEntity_messageWithEntityGivenMicroLocation_callWithEntityGivenMicroLocation_facetimeWithEntityGivenMicroLocation_messagePopularityGivenMotionState_callPopularityGivenMotionState_facetimePopularityGivenMotionState_motionStateGivenMessageWithEntity_motionStateGivenCallWithEntity_motionStateGivenFacetimeWithEntity_messageWithEntityGivenMotionState_callWithEntityGivenMotionState_facetimeWithEntityGivenMotionState_messagePopularityGivenWiFi_callPopularityGivenWiFi_facetimePopularityGivenWiFi_wiFiGivenMessageWithEntity_wiFiGivenCallWithEntity_wiFiGivenFacetimeWithEntity_messageWithEntityGivenWiFi_callWithEntityGivenWiFi_facetimeWithEntityGivenWiFi_messagePopularityGivenSequence_callPopularityGivenSequence_facetimePopularityGivenSequence_sequenceGivenMessageWithEntity_sequenceGivenCallWithEntity_sequenceGivenFacetimeWithEntity_lastExecutionAge_medianTimeIntervalBetweenExecution_dailyDoseL1Error_dailyDoseL2Error_shortTermTrendingPopularity_trendingPopularity_longTermTrendingPopularity_locationLastExecutationAge_locationPopularityGivenSpecificGeoHash_locationTrendingPopularity_(self, v559, v514, v519, v524, v545, v618, v617, v616, v615, v614, v613, v612, v611, v610, v609, v608, v607, v606,
                                                 v605,
                                                 v604,
                                                 v603,
                                                 v602,
                                                 v601,
                                                 v600,
                                                 v599,
                                                 v598,
                                                 v597,
                                                 v596,
                                                 v595,
                                                 v594,
                                                 v593,
                                                 v592,
                                                 v591,
                                                 v590,
                                                 v589,
                                                 v588,
                                                 v587,
                                                 v586,
                                                 v585,
                                                 v584,
                                                 v583,
                                                 v582,
                                                 v581,
                                                 v580,
                                                 v579,
                                                 v578,
                                                 v577,
                                                 v576,
                                                 v575,
                                                 v574,
                                                 v573,
                                                 v572,
                                                 v571,
                                                 v570,
                                                 v569,
                                                 v568,
                                                 v567,
                                                 v566,
                                                 v565,
                                                 v564,
                                                 v563,
                                                 v562));
    v560 = self;
  }

  return v560;
}

- (void)encodeWithCoder:(id)a3
{
  double candidateNameScore = self->_candidateNameScore;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_candidateNameScore);
  objc_msgSend_encodeDouble_forKey_(v5, v7, (uint64_t)v6, v8, v9, candidateNameScore);

  double candidateCommunicationScore = self->_candidateCommunicationScore;
  uint64_t v11 = NSStringFromSelector(sel_candidateCommunicationScore);
  objc_msgSend_encodeDouble_forKey_(v5, v12, (uint64_t)v11, v13, v14, candidateCommunicationScore);

  double candidateOrganizationScore = self->_candidateOrganizationScore;
  uint64_t v16 = NSStringFromSelector(sel_candidateOrganizationScore);
  objc_msgSend_encodeDouble_forKey_(v5, v17, (uint64_t)v16, v18, v19, candidateOrganizationScore);

  double candidateLocationScore = self->_candidateLocationScore;
  v21 = NSStringFromSelector(sel_candidateLocationScore);
  objc_msgSend_encodeDouble_forKey_(v5, v22, (uint64_t)v21, v23, v24, candidateLocationScore);

  double candidateEventLocationScore = self->_candidateEventLocationScore;
  uint64_t v26 = NSStringFromSelector(sel_candidateEventLocationScore);
  objc_msgSend_encodeDouble_forKey_(v5, v27, (uint64_t)v26, v28, v29, candidateEventLocationScore);

  double candidateEventNameScore = self->_candidateEventNameScore;
  uint64_t v31 = NSStringFromSelector(sel_candidateEventNameScore);
  objc_msgSend_encodeDouble_forKey_(v5, v32, (uint64_t)v31, v33, v34, candidateEventNameScore);

  double topicScore = self->_topicScore;
  uint64_t v36 = NSStringFromSelector(sel_topicScore);
  objc_msgSend_encodeDouble_forKey_(v5, v37, (uint64_t)v36, v38, v39, topicScore);

  double messagePopularityGivenTimeOfDay = self->_messagePopularityGivenTimeOfDay;
  uint64_t v41 = NSStringFromSelector(sel_messagePopularityGivenTimeOfDay);
  objc_msgSend_encodeDouble_forKey_(v5, v42, (uint64_t)v41, v43, v44, messagePopularityGivenTimeOfDay);

  double callPopularityGivenTimeOfDay = self->_callPopularityGivenTimeOfDay;
  uint64_t v46 = NSStringFromSelector(sel_callPopularityGivenTimeOfDay);
  objc_msgSend_encodeDouble_forKey_(v5, v47, (uint64_t)v46, v48, v49, callPopularityGivenTimeOfDay);

  double facetimePopularityGivenTimeOfDay = self->_facetimePopularityGivenTimeOfDay;
  v51 = NSStringFromSelector(sel_facetimePopularityGivenTimeOfDay);
  objc_msgSend_encodeDouble_forKey_(v5, v52, (uint64_t)v51, v53, v54, facetimePopularityGivenTimeOfDay);

  double timeOfDayGivenMessageWithEntity = self->_timeOfDayGivenMessageWithEntity;
  v56 = NSStringFromSelector(sel_timeOfDayGivenMessageWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v57, (uint64_t)v56, v58, v59, timeOfDayGivenMessageWithEntity);

  double timeOfDayGivenCallWithEntity = self->_timeOfDayGivenCallWithEntity;
  v61 = NSStringFromSelector(sel_timeOfDayGivenCallWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v62, (uint64_t)v61, v63, v64, timeOfDayGivenCallWithEntity);

  double timeOfDayGivenFacetimeWithEntity = self->_timeOfDayGivenFacetimeWithEntity;
  v66 = NSStringFromSelector(sel_timeOfDayGivenFacetimeWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v67, (uint64_t)v66, v68, v69, timeOfDayGivenFacetimeWithEntity);

  double messageWithEntityGivenTimeOfDay = self->_messageWithEntityGivenTimeOfDay;
  v71 = NSStringFromSelector(sel_messageWithEntityGivenTimeOfDay);
  objc_msgSend_encodeDouble_forKey_(v5, v72, (uint64_t)v71, v73, v74, messageWithEntityGivenTimeOfDay);

  double callWithEntityGivenTimeOfDay = self->_callWithEntityGivenTimeOfDay;
  v76 = NSStringFromSelector(sel_callWithEntityGivenTimeOfDay);
  objc_msgSend_encodeDouble_forKey_(v5, v77, (uint64_t)v76, v78, v79, callWithEntityGivenTimeOfDay);

  double facetimeWithEntityGivenTimeOfDay = self->_facetimeWithEntityGivenTimeOfDay;
  v81 = NSStringFromSelector(sel_facetimeWithEntityGivenTimeOfDay);
  objc_msgSend_encodeDouble_forKey_(v5, v82, (uint64_t)v81, v83, v84, facetimeWithEntityGivenTimeOfDay);

  double messagePopularityGivenCoarseTimeOfDay = self->_messagePopularityGivenCoarseTimeOfDay;
  v86 = NSStringFromSelector(sel_messagePopularityGivenCoarseTimeOfDay);
  objc_msgSend_encodeDouble_forKey_(v5, v87, (uint64_t)v86, v88, v89, messagePopularityGivenCoarseTimeOfDay);

  double callPopularityGivenCoarseTimeOfDay = self->_callPopularityGivenCoarseTimeOfDay;
  v91 = NSStringFromSelector(sel_callPopularityGivenCoarseTimeOfDay);
  objc_msgSend_encodeDouble_forKey_(v5, v92, (uint64_t)v91, v93, v94, callPopularityGivenCoarseTimeOfDay);

  double facetimePopularityGivenCoarseTimeOfDay = self->_facetimePopularityGivenCoarseTimeOfDay;
  v96 = NSStringFromSelector(sel_facetimePopularityGivenCoarseTimeOfDay);
  objc_msgSend_encodeDouble_forKey_(v5, v97, (uint64_t)v96, v98, v99, facetimePopularityGivenCoarseTimeOfDay);

  double coarseTimeOfDayGivenMessageWithEntity = self->_coarseTimeOfDayGivenMessageWithEntity;
  v101 = NSStringFromSelector(sel_coarseTimeOfDayGivenMessageWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v102, (uint64_t)v101, v103, v104, coarseTimeOfDayGivenMessageWithEntity);

  double coarseTimeOfDayGivenCallWithEntity = self->_coarseTimeOfDayGivenCallWithEntity;
  v106 = NSStringFromSelector(sel_coarseTimeOfDayGivenCallWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v107, (uint64_t)v106, v108, v109, coarseTimeOfDayGivenCallWithEntity);

  double coarseTimeOfDayGivenFacetimeWithEntity = self->_coarseTimeOfDayGivenFacetimeWithEntity;
  v111 = NSStringFromSelector(sel_coarseTimeOfDayGivenFacetimeWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v112, (uint64_t)v111, v113, v114, coarseTimeOfDayGivenFacetimeWithEntity);

  double messageWithEntityGivenCoarseTimeOfDay = self->_messageWithEntityGivenCoarseTimeOfDay;
  v116 = NSStringFromSelector(sel_messageWithEntityGivenCoarseTimeOfDay);
  objc_msgSend_encodeDouble_forKey_(v5, v117, (uint64_t)v116, v118, v119, messageWithEntityGivenCoarseTimeOfDay);

  double callWithEntityGivenCoarseTimeOfDay = self->_callWithEntityGivenCoarseTimeOfDay;
  v121 = NSStringFromSelector(sel_callWithEntityGivenCoarseTimeOfDay);
  objc_msgSend_encodeDouble_forKey_(v5, v122, (uint64_t)v121, v123, v124, callWithEntityGivenCoarseTimeOfDay);

  double facetimeWithEntityGivenCoarseTimeOfDay = self->_facetimeWithEntityGivenCoarseTimeOfDay;
  v126 = NSStringFromSelector(sel_facetimeWithEntityGivenCoarseTimeOfDay);
  objc_msgSend_encodeDouble_forKey_(v5, v127, (uint64_t)v126, v128, v129, facetimeWithEntityGivenCoarseTimeOfDay);

  double messagePopularityGivenDayOfWeek = self->_messagePopularityGivenDayOfWeek;
  v131 = NSStringFromSelector(sel_messagePopularityGivenDayOfWeek);
  objc_msgSend_encodeDouble_forKey_(v5, v132, (uint64_t)v131, v133, v134, messagePopularityGivenDayOfWeek);

  double callPopularityGivenDayOfWeek = self->_callPopularityGivenDayOfWeek;
  v136 = NSStringFromSelector(sel_callPopularityGivenDayOfWeek);
  objc_msgSend_encodeDouble_forKey_(v5, v137, (uint64_t)v136, v138, v139, callPopularityGivenDayOfWeek);

  double facetimePopularityGivenDayOfWeek = self->_facetimePopularityGivenDayOfWeek;
  v141 = NSStringFromSelector(sel_facetimePopularityGivenDayOfWeek);
  objc_msgSend_encodeDouble_forKey_(v5, v142, (uint64_t)v141, v143, v144, facetimePopularityGivenDayOfWeek);

  double dayOfWeekGivenMessageWithEntity = self->_dayOfWeekGivenMessageWithEntity;
  v146 = NSStringFromSelector(sel_dayOfWeekGivenMessageWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v147, (uint64_t)v146, v148, v149, dayOfWeekGivenMessageWithEntity);

  double dayOfWeekGivenCallWithEntity = self->_dayOfWeekGivenCallWithEntity;
  v151 = NSStringFromSelector(sel_dayOfWeekGivenCallWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v152, (uint64_t)v151, v153, v154, dayOfWeekGivenCallWithEntity);

  double dayOfWeekGivenFacetimeWithEntity = self->_dayOfWeekGivenFacetimeWithEntity;
  v156 = NSStringFromSelector(sel_dayOfWeekGivenFacetimeWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v157, (uint64_t)v156, v158, v159, dayOfWeekGivenFacetimeWithEntity);

  double messageWithEntityGivenDayOfWeek = self->_messageWithEntityGivenDayOfWeek;
  v161 = NSStringFromSelector(sel_messageWithEntityGivenDayOfWeek);
  objc_msgSend_encodeDouble_forKey_(v5, v162, (uint64_t)v161, v163, v164, messageWithEntityGivenDayOfWeek);

  double callWithEntityGivenDayOfWeek = self->_callWithEntityGivenDayOfWeek;
  v166 = NSStringFromSelector(sel_callWithEntityGivenDayOfWeek);
  objc_msgSend_encodeDouble_forKey_(v5, v167, (uint64_t)v166, v168, v169, callWithEntityGivenDayOfWeek);

  double facetimeWithEntityGivenDayOfWeek = self->_facetimeWithEntityGivenDayOfWeek;
  v171 = NSStringFromSelector(sel_facetimeWithEntityGivenDayOfWeek);
  objc_msgSend_encodeDouble_forKey_(v5, v172, (uint64_t)v171, v173, v174, facetimeWithEntityGivenDayOfWeek);

  double messagePopularityGivenFocusMode = self->_messagePopularityGivenFocusMode;
  v176 = NSStringFromSelector(sel_messagePopularityGivenFocusMode);
  objc_msgSend_encodeDouble_forKey_(v5, v177, (uint64_t)v176, v178, v179, messagePopularityGivenFocusMode);

  double callPopularityGivenFocusMode = self->_callPopularityGivenFocusMode;
  v181 = NSStringFromSelector(sel_callPopularityGivenFocusMode);
  objc_msgSend_encodeDouble_forKey_(v5, v182, (uint64_t)v181, v183, v184, callPopularityGivenFocusMode);

  double facetimePopularityGivenFocusMode = self->_facetimePopularityGivenFocusMode;
  v186 = NSStringFromSelector(sel_facetimePopularityGivenFocusMode);
  objc_msgSend_encodeDouble_forKey_(v5, v187, (uint64_t)v186, v188, v189, facetimePopularityGivenFocusMode);

  double focusModeGivenMessageWithEntity = self->_focusModeGivenMessageWithEntity;
  v191 = NSStringFromSelector(sel_focusModeGivenMessageWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v192, (uint64_t)v191, v193, v194, focusModeGivenMessageWithEntity);

  double focusModeGivenCallWithEntity = self->_focusModeGivenCallWithEntity;
  v196 = NSStringFromSelector(sel_focusModeGivenCallWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v197, (uint64_t)v196, v198, v199, focusModeGivenCallWithEntity);

  double focusModeGivenFacetimeWithEntity = self->_focusModeGivenFacetimeWithEntity;
  v201 = NSStringFromSelector(sel_focusModeGivenFacetimeWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v202, (uint64_t)v201, v203, v204, focusModeGivenFacetimeWithEntity);

  double messageWithEntityGivenFocusMode = self->_messageWithEntityGivenFocusMode;
  v206 = NSStringFromSelector(sel_messageWithEntityGivenFocusMode);
  objc_msgSend_encodeDouble_forKey_(v5, v207, (uint64_t)v206, v208, v209, messageWithEntityGivenFocusMode);

  double callWithEntityGivenFocusMode = self->_callWithEntityGivenFocusMode;
  v211 = NSStringFromSelector(sel_callWithEntityGivenFocusMode);
  objc_msgSend_encodeDouble_forKey_(v5, v212, (uint64_t)v211, v213, v214, callWithEntityGivenFocusMode);

  double facetimeWithEntityGivenFocusMode = self->_facetimeWithEntityGivenFocusMode;
  v216 = NSStringFromSelector(sel_facetimeWithEntityGivenFocusMode);
  objc_msgSend_encodeDouble_forKey_(v5, v217, (uint64_t)v216, v218, v219, facetimeWithEntityGivenFocusMode);

  double messagePopularityGivenLOI = self->_messagePopularityGivenLOI;
  v221 = NSStringFromSelector(sel_messagePopularityGivenLOI);
  objc_msgSend_encodeDouble_forKey_(v5, v222, (uint64_t)v221, v223, v224, messagePopularityGivenLOI);

  double callPopularityGivenLOI = self->_callPopularityGivenLOI;
  v226 = NSStringFromSelector(sel_callPopularityGivenLOI);
  objc_msgSend_encodeDouble_forKey_(v5, v227, (uint64_t)v226, v228, v229, callPopularityGivenLOI);

  double facetimePopularityGivenLOI = self->_facetimePopularityGivenLOI;
  v231 = NSStringFromSelector(sel_facetimePopularityGivenLOI);
  objc_msgSend_encodeDouble_forKey_(v5, v232, (uint64_t)v231, v233, v234, facetimePopularityGivenLOI);

  double LOIGivenMessageWithEntity = self->_LOIGivenMessageWithEntity;
  v236 = NSStringFromSelector(sel_LOIGivenMessageWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v237, (uint64_t)v236, v238, v239, LOIGivenMessageWithEntity);

  double LOIGivenCallWithEntity = self->_LOIGivenCallWithEntity;
  v241 = NSStringFromSelector(sel_LOIGivenCallWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v242, (uint64_t)v241, v243, v244, LOIGivenCallWithEntity);

  double LOIGivenFacetimeWithEntity = self->_LOIGivenFacetimeWithEntity;
  v246 = NSStringFromSelector(sel_LOIGivenFacetimeWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v247, (uint64_t)v246, v248, v249, LOIGivenFacetimeWithEntity);

  double messageWithEntityGivenLOI = self->_messageWithEntityGivenLOI;
  v251 = NSStringFromSelector(sel_messageWithEntityGivenLOI);
  objc_msgSend_encodeDouble_forKey_(v5, v252, (uint64_t)v251, v253, v254, messageWithEntityGivenLOI);

  double callWithEntityGivenLOI = self->_callWithEntityGivenLOI;
  v256 = NSStringFromSelector(sel_callWithEntityGivenLOI);
  objc_msgSend_encodeDouble_forKey_(v5, v257, (uint64_t)v256, v258, v259, callWithEntityGivenLOI);

  double facetimeWithEntityGivenLOI = self->_facetimeWithEntityGivenLOI;
  v261 = NSStringFromSelector(sel_facetimeWithEntityGivenLOI);
  objc_msgSend_encodeDouble_forKey_(v5, v262, (uint64_t)v261, v263, v264, facetimeWithEntityGivenLOI);

  double messagePopularityGivenSpecificGeoHash = self->_messagePopularityGivenSpecificGeoHash;
  v266 = NSStringFromSelector(sel_messagePopularityGivenSpecificGeoHash);
  objc_msgSend_encodeDouble_forKey_(v5, v267, (uint64_t)v266, v268, v269, messagePopularityGivenSpecificGeoHash);

  double callPopularityGivenSpecificGeoHash = self->_callPopularityGivenSpecificGeoHash;
  v271 = NSStringFromSelector(sel_callPopularityGivenSpecificGeoHash);
  objc_msgSend_encodeDouble_forKey_(v5, v272, (uint64_t)v271, v273, v274, callPopularityGivenSpecificGeoHash);

  double facetimePopularityGivenSpecificGeoHash = self->_facetimePopularityGivenSpecificGeoHash;
  v276 = NSStringFromSelector(sel_facetimePopularityGivenSpecificGeoHash);
  objc_msgSend_encodeDouble_forKey_(v5, v277, (uint64_t)v276, v278, v279, facetimePopularityGivenSpecificGeoHash);

  double specificGeoHashGivenMessageWithEntity = self->_specificGeoHashGivenMessageWithEntity;
  v281 = NSStringFromSelector(sel_specificGeoHashGivenMessageWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v282, (uint64_t)v281, v283, v284, specificGeoHashGivenMessageWithEntity);

  double specificGeoHashGivenCallWithEntity = self->_specificGeoHashGivenCallWithEntity;
  v286 = NSStringFromSelector(sel_specificGeoHashGivenCallWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v287, (uint64_t)v286, v288, v289, specificGeoHashGivenCallWithEntity);

  double specificGeoHashGivenFacetimeWithEntity = self->_specificGeoHashGivenFacetimeWithEntity;
  v291 = NSStringFromSelector(sel_specificGeoHashGivenFacetimeWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v292, (uint64_t)v291, v293, v294, specificGeoHashGivenFacetimeWithEntity);

  double messageWithEntityGivenSpecificGeoHash = self->_messageWithEntityGivenSpecificGeoHash;
  uint64_t v296 = NSStringFromSelector(sel_messageWithEntityGivenSpecificGeoHash);
  objc_msgSend_encodeDouble_forKey_(v5, v297, (uint64_t)v296, v298, v299, messageWithEntityGivenSpecificGeoHash);

  double callWithEntityGivenSpecificGeoHash = self->_callWithEntityGivenSpecificGeoHash;
  uint64_t v301 = NSStringFromSelector(sel_callWithEntityGivenSpecificGeoHash);
  objc_msgSend_encodeDouble_forKey_(v5, v302, (uint64_t)v301, v303, v304, callWithEntityGivenSpecificGeoHash);

  double facetimeWithEntityGivenSpecificGeoHash = self->_facetimeWithEntityGivenSpecificGeoHash;
  v306 = NSStringFromSelector(sel_facetimeWithEntityGivenSpecificGeoHash);
  objc_msgSend_encodeDouble_forKey_(v5, v307, (uint64_t)v306, v308, v309, facetimeWithEntityGivenSpecificGeoHash);

  double messagePopularityGivenCoarseGeoHash = self->_messagePopularityGivenCoarseGeoHash;
  v311 = NSStringFromSelector(sel_messagePopularityGivenCoarseGeoHash);
  objc_msgSend_encodeDouble_forKey_(v5, v312, (uint64_t)v311, v313, v314, messagePopularityGivenCoarseGeoHash);

  double callPopularityGivenCoarseGeoHash = self->_callPopularityGivenCoarseGeoHash;
  uint64_t v316 = NSStringFromSelector(sel_callPopularityGivenCoarseGeoHash);
  objc_msgSend_encodeDouble_forKey_(v5, v317, (uint64_t)v316, v318, v319, callPopularityGivenCoarseGeoHash);

  double facetimePopularityGivenCoarseGeoHash = self->_facetimePopularityGivenCoarseGeoHash;
  uint64_t v321 = NSStringFromSelector(sel_facetimePopularityGivenCoarseGeoHash);
  objc_msgSend_encodeDouble_forKey_(v5, v322, (uint64_t)v321, v323, v324, facetimePopularityGivenCoarseGeoHash);

  double coarseGeoHashGivenMessageWithEntity = self->_coarseGeoHashGivenMessageWithEntity;
  v326 = NSStringFromSelector(sel_coarseGeoHashGivenMessageWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v327, (uint64_t)v326, v328, v329, coarseGeoHashGivenMessageWithEntity);

  double coarseGeoHashGivenCallWithEntity = self->_coarseGeoHashGivenCallWithEntity;
  v331 = NSStringFromSelector(sel_coarseGeoHashGivenCallWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v332, (uint64_t)v331, v333, v334, coarseGeoHashGivenCallWithEntity);

  double coarseGeoHashGivenFacetimeWithEntity = self->_coarseGeoHashGivenFacetimeWithEntity;
  uint64_t v336 = NSStringFromSelector(sel_coarseGeoHashGivenFacetimeWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v337, (uint64_t)v336, v338, v339, coarseGeoHashGivenFacetimeWithEntity);

  double messageWithEntityGivenCoarseGeoHash = self->_messageWithEntityGivenCoarseGeoHash;
  uint64_t v341 = NSStringFromSelector(sel_messageWithEntityGivenCoarseGeoHash);
  objc_msgSend_encodeDouble_forKey_(v5, v342, (uint64_t)v341, v343, v344, messageWithEntityGivenCoarseGeoHash);

  double callWithEntityGivenCoarseGeoHash = self->_callWithEntityGivenCoarseGeoHash;
  v346 = NSStringFromSelector(sel_callWithEntityGivenCoarseGeoHash);
  objc_msgSend_encodeDouble_forKey_(v5, v347, (uint64_t)v346, v348, v349, callWithEntityGivenCoarseGeoHash);

  double facetimeWithEntityGivenCoarseGeoHash = self->_facetimeWithEntityGivenCoarseGeoHash;
  v351 = NSStringFromSelector(sel_facetimeWithEntityGivenCoarseGeoHash);
  objc_msgSend_encodeDouble_forKey_(v5, v352, (uint64_t)v351, v353, v354, facetimeWithEntityGivenCoarseGeoHash);

  double messagePopularityGivenLargeGeoHash = self->_messagePopularityGivenLargeGeoHash;
  uint64_t v356 = NSStringFromSelector(sel_messagePopularityGivenLargeGeoHash);
  objc_msgSend_encodeDouble_forKey_(v5, v357, (uint64_t)v356, v358, v359, messagePopularityGivenLargeGeoHash);

  double callPopularityGivenLargeGeoHash = self->_callPopularityGivenLargeGeoHash;
  uint64_t v361 = NSStringFromSelector(sel_callPopularityGivenLargeGeoHash);
  objc_msgSend_encodeDouble_forKey_(v5, v362, (uint64_t)v361, v363, v364, callPopularityGivenLargeGeoHash);

  double facetimePopularityGivenLargeGeoHash = self->_facetimePopularityGivenLargeGeoHash;
  v366 = NSStringFromSelector(sel_facetimePopularityGivenLargeGeoHash);
  objc_msgSend_encodeDouble_forKey_(v5, v367, (uint64_t)v366, v368, v369, facetimePopularityGivenLargeGeoHash);

  double largeGeoHashGivenMessageWithEntity = self->_largeGeoHashGivenMessageWithEntity;
  v371 = NSStringFromSelector(sel_largeGeoHashGivenMessageWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v372, (uint64_t)v371, v373, v374, largeGeoHashGivenMessageWithEntity);

  double largeGeoHashGivenCallWithEntity = self->_largeGeoHashGivenCallWithEntity;
  uint64_t v376 = NSStringFromSelector(sel_largeGeoHashGivenCallWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v377, (uint64_t)v376, v378, v379, largeGeoHashGivenCallWithEntity);

  double largeGeoHashGivenFacetimeWithEntity = self->_largeGeoHashGivenFacetimeWithEntity;
  uint64_t v381 = NSStringFromSelector(sel_largeGeoHashGivenFacetimeWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v382, (uint64_t)v381, v383, v384, largeGeoHashGivenFacetimeWithEntity);

  double messageWithEntityGivenLargeGeoHash = self->_messageWithEntityGivenLargeGeoHash;
  v386 = NSStringFromSelector(sel_messageWithEntityGivenLargeGeoHash);
  objc_msgSend_encodeDouble_forKey_(v5, v387, (uint64_t)v386, v388, v389, messageWithEntityGivenLargeGeoHash);

  double callWithEntityGivenLargeGeoHash = self->_callWithEntityGivenLargeGeoHash;
  v391 = NSStringFromSelector(sel_callWithEntityGivenLargeGeoHash);
  objc_msgSend_encodeDouble_forKey_(v5, v392, (uint64_t)v391, v393, v394, callWithEntityGivenLargeGeoHash);

  double facetimeWithEntityGivenLargeGeoHash = self->_facetimeWithEntityGivenLargeGeoHash;
  uint64_t v396 = NSStringFromSelector(sel_facetimeWithEntityGivenLargeGeoHash);
  objc_msgSend_encodeDouble_forKey_(v5, v397, (uint64_t)v396, v398, v399, facetimeWithEntityGivenLargeGeoHash);

  double messagePopularityGivenMicroLocation = self->_messagePopularityGivenMicroLocation;
  uint64_t v401 = NSStringFromSelector(sel_messagePopularityGivenMicroLocation);
  objc_msgSend_encodeDouble_forKey_(v5, v402, (uint64_t)v401, v403, v404, messagePopularityGivenMicroLocation);

  double callPopularityGivenMicroLocation = self->_callPopularityGivenMicroLocation;
  v406 = NSStringFromSelector(sel_callPopularityGivenMicroLocation);
  objc_msgSend_encodeDouble_forKey_(v5, v407, (uint64_t)v406, v408, v409, callPopularityGivenMicroLocation);

  double facetimePopularityGivenMicroLocation = self->_facetimePopularityGivenMicroLocation;
  v411 = NSStringFromSelector(sel_facetimePopularityGivenMicroLocation);
  objc_msgSend_encodeDouble_forKey_(v5, v412, (uint64_t)v411, v413, v414, facetimePopularityGivenMicroLocation);

  double microLocationGivenMessageWithEntity = self->_microLocationGivenMessageWithEntity;
  uint64_t v416 = NSStringFromSelector(sel_microLocationGivenMessageWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v417, (uint64_t)v416, v418, v419, microLocationGivenMessageWithEntity);

  double microLocationGivenCallWithEntity = self->_microLocationGivenCallWithEntity;
  uint64_t v421 = NSStringFromSelector(sel_microLocationGivenCallWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v422, (uint64_t)v421, v423, v424, microLocationGivenCallWithEntity);

  double microLocationGivenFacetimeWithEntity = self->_microLocationGivenFacetimeWithEntity;
  v426 = NSStringFromSelector(sel_microLocationGivenFacetimeWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v427, (uint64_t)v426, v428, v429, microLocationGivenFacetimeWithEntity);

  double messageWithEntityGivenMicroLocation = self->_messageWithEntityGivenMicroLocation;
  v431 = NSStringFromSelector(sel_messageWithEntityGivenMicroLocation);
  objc_msgSend_encodeDouble_forKey_(v5, v432, (uint64_t)v431, v433, v434, messageWithEntityGivenMicroLocation);

  double callWithEntityGivenMicroLocation = self->_callWithEntityGivenMicroLocation;
  uint64_t v436 = NSStringFromSelector(sel_callWithEntityGivenMicroLocation);
  objc_msgSend_encodeDouble_forKey_(v5, v437, (uint64_t)v436, v438, v439, callWithEntityGivenMicroLocation);

  double facetimeWithEntityGivenMicroLocation = self->_facetimeWithEntityGivenMicroLocation;
  uint64_t v441 = NSStringFromSelector(sel_facetimeWithEntityGivenMicroLocation);
  objc_msgSend_encodeDouble_forKey_(v5, v442, (uint64_t)v441, v443, v444, facetimeWithEntityGivenMicroLocation);

  double messagePopularityGivenMotionState = self->_messagePopularityGivenMotionState;
  v446 = NSStringFromSelector(sel_messagePopularityGivenMotionState);
  objc_msgSend_encodeDouble_forKey_(v5, v447, (uint64_t)v446, v448, v449, messagePopularityGivenMotionState);

  double callPopularityGivenMotionState = self->_callPopularityGivenMotionState;
  v451 = NSStringFromSelector(sel_callPopularityGivenMotionState);
  objc_msgSend_encodeDouble_forKey_(v5, v452, (uint64_t)v451, v453, v454, callPopularityGivenMotionState);

  double facetimePopularityGivenMotionState = self->_facetimePopularityGivenMotionState;
  uint64_t v456 = NSStringFromSelector(sel_facetimePopularityGivenMotionState);
  objc_msgSend_encodeDouble_forKey_(v5, v457, (uint64_t)v456, v458, v459, facetimePopularityGivenMotionState);

  double motionStateGivenMessageWithEntity = self->_motionStateGivenMessageWithEntity;
  uint64_t v461 = NSStringFromSelector(sel_motionStateGivenMessageWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v462, (uint64_t)v461, v463, v464, motionStateGivenMessageWithEntity);

  double motionStateGivenCallWithEntity = self->_motionStateGivenCallWithEntity;
  v466 = NSStringFromSelector(sel_motionStateGivenCallWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v467, (uint64_t)v466, v468, v469, motionStateGivenCallWithEntity);

  double motionStateGivenFacetimeWithEntity = self->_motionStateGivenFacetimeWithEntity;
  v471 = NSStringFromSelector(sel_motionStateGivenFacetimeWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v472, (uint64_t)v471, v473, v474, motionStateGivenFacetimeWithEntity);

  double messageWithEntityGivenMotionState = self->_messageWithEntityGivenMotionState;
  uint64_t v476 = NSStringFromSelector(sel_messageWithEntityGivenMotionState);
  objc_msgSend_encodeDouble_forKey_(v5, v477, (uint64_t)v476, v478, v479, messageWithEntityGivenMotionState);

  double callWithEntityGivenMotionState = self->_callWithEntityGivenMotionState;
  uint64_t v481 = NSStringFromSelector(sel_callWithEntityGivenMotionState);
  objc_msgSend_encodeDouble_forKey_(v5, v482, (uint64_t)v481, v483, v484, callWithEntityGivenMotionState);

  double facetimeWithEntityGivenMotionState = self->_facetimeWithEntityGivenMotionState;
  v486 = NSStringFromSelector(sel_facetimeWithEntityGivenMotionState);
  objc_msgSend_encodeDouble_forKey_(v5, v487, (uint64_t)v486, v488, v489, facetimeWithEntityGivenMotionState);

  double messagePopularityGivenWiFi = self->_messagePopularityGivenWiFi;
  v491 = NSStringFromSelector(sel_messagePopularityGivenWiFi);
  objc_msgSend_encodeDouble_forKey_(v5, v492, (uint64_t)v491, v493, v494, messagePopularityGivenWiFi);

  double callPopularityGivenWiFi = self->_callPopularityGivenWiFi;
  uint64_t v496 = NSStringFromSelector(sel_callPopularityGivenWiFi);
  objc_msgSend_encodeDouble_forKey_(v5, v497, (uint64_t)v496, v498, v499, callPopularityGivenWiFi);

  double facetimePopularityGivenWiFi = self->_facetimePopularityGivenWiFi;
  uint64_t v501 = NSStringFromSelector(sel_facetimePopularityGivenWiFi);
  objc_msgSend_encodeDouble_forKey_(v5, v502, (uint64_t)v501, v503, v504, facetimePopularityGivenWiFi);

  double wiFiGivenMessageWithEntity = self->_wiFiGivenMessageWithEntity;
  v506 = NSStringFromSelector(sel_wiFiGivenMessageWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v507, (uint64_t)v506, v508, v509, wiFiGivenMessageWithEntity);

  double wiFiGivenCallWithEntity = self->_wiFiGivenCallWithEntity;
  v511 = NSStringFromSelector(sel_wiFiGivenCallWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v512, (uint64_t)v511, v513, v514, wiFiGivenCallWithEntity);

  double wiFiGivenFacetimeWithEntity = self->_wiFiGivenFacetimeWithEntity;
  v516 = NSStringFromSelector(sel_wiFiGivenFacetimeWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v517, (uint64_t)v516, v518, v519, wiFiGivenFacetimeWithEntity);

  double messageWithEntityGivenWiFi = self->_messageWithEntityGivenWiFi;
  v521 = NSStringFromSelector(sel_messageWithEntityGivenWiFi);
  objc_msgSend_encodeDouble_forKey_(v5, v522, (uint64_t)v521, v523, v524, messageWithEntityGivenWiFi);

  double callWithEntityGivenWiFi = self->_callWithEntityGivenWiFi;
  v526 = NSStringFromSelector(sel_callWithEntityGivenWiFi);
  objc_msgSend_encodeDouble_forKey_(v5, v527, (uint64_t)v526, v528, v529, callWithEntityGivenWiFi);

  double facetimeWithEntityGivenWiFi = self->_facetimeWithEntityGivenWiFi;
  uint64_t v531 = NSStringFromSelector(sel_facetimeWithEntityGivenWiFi);
  objc_msgSend_encodeDouble_forKey_(v5, v532, (uint64_t)v531, v533, v534, facetimeWithEntityGivenWiFi);

  double messagePopularityGivenSequence = self->_messagePopularityGivenSequence;
  uint64_t v536 = NSStringFromSelector(sel_messagePopularityGivenSequence);
  objc_msgSend_encodeDouble_forKey_(v5, v537, (uint64_t)v536, v538, v539, messagePopularityGivenSequence);

  double callPopularityGivenSequence = self->_callPopularityGivenSequence;
  v541 = NSStringFromSelector(sel_callPopularityGivenSequence);
  objc_msgSend_encodeDouble_forKey_(v5, v542, (uint64_t)v541, v543, v544, callPopularityGivenSequence);

  double facetimePopularityGivenSequence = self->_facetimePopularityGivenSequence;
  v546 = NSStringFromSelector(sel_facetimePopularityGivenSequence);
  objc_msgSend_encodeDouble_forKey_(v5, v547, (uint64_t)v546, v548, v549, facetimePopularityGivenSequence);

  double sequenceGivenMessageWithEntity = self->_sequenceGivenMessageWithEntity;
  v551 = NSStringFromSelector(sel_sequenceGivenMessageWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v552, (uint64_t)v551, v553, v554, sequenceGivenMessageWithEntity);

  double sequenceGivenCallWithEntity = self->_sequenceGivenCallWithEntity;
  uint64_t v556 = NSStringFromSelector(sel_sequenceGivenCallWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v557, (uint64_t)v556, v558, v559, sequenceGivenCallWithEntity);

  double sequenceGivenFacetimeWithEntity = self->_sequenceGivenFacetimeWithEntity;
  v561 = NSStringFromSelector(sel_sequenceGivenFacetimeWithEntity);
  objc_msgSend_encodeDouble_forKey_(v5, v562, (uint64_t)v561, v563, v564, sequenceGivenFacetimeWithEntity);

  uint64_t lastExecutionAge = self->_lastExecutionAge;
  uint64_t v566 = NSStringFromSelector(sel_lastExecutionAge);
  objc_msgSend_encodeInt_forKey_(v5, v567, lastExecutionAge, (uint64_t)v566, v568);

  uint64_t medianTimeIntervalBetweenExecution = self->_medianTimeIntervalBetweenExecution;
  uint64_t v570 = NSStringFromSelector(sel_medianTimeIntervalBetweenExecution);
  objc_msgSend_encodeInt_forKey_(v5, v571, medianTimeIntervalBetweenExecution, (uint64_t)v570, v572);

  uint64_t dailyDoseL1Error = self->_dailyDoseL1Error;
  uint64_t v574 = NSStringFromSelector(sel_dailyDoseL1Error);
  objc_msgSend_encodeInt_forKey_(v5, v575, dailyDoseL1Error, (uint64_t)v574, v576);

  double dailyDoseL2Error = self->_dailyDoseL2Error;
  uint64_t v578 = NSStringFromSelector(sel_dailyDoseL2Error);
  objc_msgSend_encodeDouble_forKey_(v5, v579, (uint64_t)v578, v580, v581, dailyDoseL2Error);

  double shortTermTrendingPopularity = self->_shortTermTrendingPopularity;
  uint64_t v583 = NSStringFromSelector(sel_shortTermTrendingPopularity);
  objc_msgSend_encodeDouble_forKey_(v5, v584, (uint64_t)v583, v585, v586, shortTermTrendingPopularity);

  double trendingPopularity = self->_trendingPopularity;
  uint64_t v588 = NSStringFromSelector(sel_trendingPopularity);
  objc_msgSend_encodeDouble_forKey_(v5, v589, (uint64_t)v588, v590, v591, trendingPopularity);

  double longTermTrendingPopularity = self->_longTermTrendingPopularity;
  uint64_t v593 = NSStringFromSelector(sel_longTermTrendingPopularity);
  objc_msgSend_encodeDouble_forKey_(v5, v594, (uint64_t)v593, v595, v596, longTermTrendingPopularity);

  uint64_t locationLastExecutionAge = self->_locationLastExecutionAge;
  uint64_t v598 = NSStringFromSelector(sel_locationLastExecutionAge);
  objc_msgSend_encodeInt_forKey_(v5, v599, locationLastExecutionAge, (uint64_t)v598, v600);

  double locationTrendingPopularity = self->_locationTrendingPopularity;
  uint64_t v602 = NSStringFromSelector(sel_locationTrendingPopularity);
  objc_msgSend_encodeDouble_forKey_(v5, v603, (uint64_t)v602, v604, v605, locationTrendingPopularity);

  double locationPopularityGivenSpecificGeoHash = self->_locationPopularityGivenSpecificGeoHash;
  NSStringFromSelector(sel_locationPopularityGivenSpecificGeoHash);
  id v610 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeDouble_forKey_(v5, v607, (uint64_t)v610, v608, v609, locationPopularityGivenSpecificGeoHash);
}

- (GDEntityFeatures)initWithLocationLastExecutationAge:(int)a3 locationPopularityGivenSpecificGeoHash:(double)a4 locationTrendingPopularity:(double)a5
{
  self->_double locationPopularityGivenSpecificGeoHash = a4;
  self->_double locationTrendingPopularity = a5;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_double candidateNameScore = _Q0;
  *(_OWORD *)&self->_double candidateOrganizationScore = _Q0;
  *(_OWORD *)&self->_double candidateEventLocationScore = _Q0;
  *(_OWORD *)&self->_double topicScore = _Q0;
  *(_OWORD *)&self->_double callPopularityGivenTimeOfDay = _Q0;
  *(_OWORD *)&self->_double timeOfDayGivenMessageWithEntity = _Q0;
  *(_OWORD *)&self->_double timeOfDayGivenFacetimeWithEntity = _Q0;
  *(_OWORD *)&self->_double callWithEntityGivenTimeOfDay = _Q0;
  *(_OWORD *)&self->_double messagePopularityGivenCoarseTimeOfDay = _Q0;
  *(_OWORD *)&self->_double facetimePopularityGivenCoarseTimeOfDay = _Q0;
  *(_OWORD *)&self->_double coarseTimeOfDayGivenCallWithEntity = _Q0;
  *(_OWORD *)&self->_double messageWithEntityGivenCoarseTimeOfDay = _Q0;
  *(_OWORD *)&self->_double facetimeWithEntityGivenCoarseTimeOfDay = _Q0;
  *(_OWORD *)&self->_double callPopularityGivenDayOfWeek = _Q0;
  *(_OWORD *)&self->_double dayOfWeekGivenMessageWithEntity = _Q0;
  *(_OWORD *)&self->_double dayOfWeekGivenFacetimeWithEntity = _Q0;
  *(_OWORD *)&self->_double callWithEntityGivenDayOfWeek = _Q0;
  *(_OWORD *)&self->_double messagePopularityGivenFocusMode = _Q0;
  *(_OWORD *)&self->_double facetimePopularityGivenFocusMode = _Q0;
  *(_OWORD *)&self->_double focusModeGivenCallWithEntity = _Q0;
  *(_OWORD *)&self->_double messageWithEntityGivenFocusMode = _Q0;
  *(_OWORD *)&self->_double facetimeWithEntityGivenFocusMode = _Q0;
  *(_OWORD *)&self->_double callPopularityGivenLOI = _Q0;
  *(_OWORD *)&self->_double LOIGivenMessageWithEntity = _Q0;
  *(_OWORD *)&self->_double LOIGivenFacetimeWithEntity = _Q0;
  *(_OWORD *)&self->_double callWithEntityGivenLOI = _Q0;
  *(_OWORD *)&self->_double messagePopularityGivenSpecificGeoHash = _Q0;
  *(_OWORD *)&self->_double facetimePopularityGivenSpecificGeoHash = _Q0;
  *(_OWORD *)&self->_double specificGeoHashGivenCallWithEntity = _Q0;
  *(_OWORD *)&self->_double messageWithEntityGivenSpecificGeoHash = _Q0;
  *(_OWORD *)&self->_double facetimeWithEntityGivenSpecificGeoHash = _Q0;
  *(_OWORD *)&self->_double callPopularityGivenCoarseGeoHash = _Q0;
  *(_OWORD *)&self->_double coarseGeoHashGivenMessageWithEntity = _Q0;
  *(_OWORD *)&self->_double coarseGeoHashGivenFacetimeWithEntity = _Q0;
  *(_OWORD *)&self->_double callWithEntityGivenCoarseGeoHash = _Q0;
  *(_OWORD *)&self->_double messagePopularityGivenLargeGeoHash = _Q0;
  *(_OWORD *)&self->_double facetimePopularityGivenLargeGeoHash = _Q0;
  *(_OWORD *)&self->_double largeGeoHashGivenCallWithEntity = _Q0;
  *(_OWORD *)&self->_double messageWithEntityGivenLargeGeoHash = _Q0;
  *(_OWORD *)&self->_double facetimeWithEntityGivenLargeGeoHash = _Q0;
  *(_OWORD *)&self->_double callPopularityGivenMicroLocation = _Q0;
  *(_OWORD *)&self->_double microLocationGivenMessageWithEntity = _Q0;
  *(_OWORD *)&self->_double microLocationGivenFacetimeWithEntity = _Q0;
  *(_OWORD *)&self->_double callWithEntityGivenMicroLocation = _Q0;
  *(_OWORD *)&self->_double messagePopularityGivenMotionState = _Q0;
  *(_OWORD *)&self->_double facetimePopularityGivenMotionState = _Q0;
  *(_OWORD *)&self->_double motionStateGivenCallWithEntity = _Q0;
  *(_OWORD *)&self->_double messageWithEntityGivenMotionState = _Q0;
  *(_OWORD *)&self->_double facetimeWithEntityGivenMotionState = _Q0;
  *(_OWORD *)&self->_double callPopularityGivenWiFi = _Q0;
  *(_OWORD *)&self->_double wiFiGivenMessageWithEntity = _Q0;
  *(_OWORD *)&self->_double wiFiGivenFacetimeWithEntity = _Q0;
  *(_OWORD *)&self->_double callWithEntityGivenWiFi = _Q0;
  *(_OWORD *)&self->_double messagePopularityGivenSequence = _Q0;
  *(_OWORD *)&self->_double facetimePopularityGivenSequence = _Q0;
  *(_OWORD *)&self->_double sequenceGivenCallWithEntity = _Q0;
  *(void *)&self->_uint64_t lastExecutionAge = -1;
  self->_uint64_t dailyDoseL1Error = -1;
  self->_uint64_t locationLastExecutionAge = a3;
  *(_OWORD *)&self->_double dailyDoseL2Error = _Q0;
  *(_OWORD *)&self->_double trendingPopularity = _Q0;
  return self;
}

- (GDEntityFeatures)initWithCandidateNameScore:(double)a3 candidateCommunicationScore:(double)a4 candidateOrganizationScore:(double)a5 candidateLocationScore:(double)a6 candidateEventLocationScore:(double)a7 candidateEventNameScore:(double)a8 topicScore:(double)a9 messagePopularityGivenTimeOfDay:(uint64_t)a10 callPopularityGivenTimeOfDay:(int)a11 facetimePopularityGivenTimeOfDay:(int)a12 timeOfDayGivenMessageWithEntity:(int)a13 timeOfDayGivenCallWithEntity:(int)a14 timeOfDayGivenFacetimeWithEntity:(double)a15 messageWithEntityGivenTimeOfDay:(double)a16 callWithEntityGivenTimeOfDay:(double)a17 facetimeWithEntityGivenTimeOfDay:(double)a18 messagePopularityGivenCoarseTimeOfDay:(double)a19 callPopularityGivenCoarseTimeOfDay:(double)a20 facetimePopularityGivenCoarseTimeOfDay:(double)a21 coarseTimeOfDayGivenMessageWithEntity:(double)a22 coarseTimeOfDayGivenCallWithEntity:(double)a23 coarseTimeOfDayGivenFacetimeWithEntity:(double)a24 messageWithEntityGivenCoarseTimeOfDay:(double)a25 callWithEntityGivenCoarseTimeOfDay:(double)a26 facetimeWithEntityGivenCoarseTimeOfDay:(double)a27 messagePopularityGivenDayOfWeek:(double)a28 callPopularityGivenDayOfWeek:(double)a29 facetimePopularityGivenDayOfWeek:(double)a30 dayOfWeekGivenMessageWithEntity:(double)a31 dayOfWeekGivenCallWithEntity:(double)a32 dayOfWeekGivenFacetimeWithEntity:(double)a33 messageWithEntityGivenDayOfWeek:(double)a34 callWithEntityGivenDayOfWeek:(double)a35 facetimeWithEntityGivenDayOfWeek:(double)a36 messagePopularityGivenFocusMode:(double)a37 callPopularityGivenFocusMode:(double)a38 facetimePopularityGivenFocusMode:(double)a39 focusModeGivenMessageWithEntity:(double)a40 focusModeGivenCallWithEntity:(double)a41 focusModeGivenFacetimeWithEntity:(double)a42 messageWithEntityGivenFocusMode:(double)a43 callWithEntityGivenFocusMode:(double)a44 facetimeWithEntityGivenFocusMode:(double)a45 messagePopularityGivenLOI:(double)a46 callPopularityGivenLOI:(double)a47 facetimePopularityGivenLOI:(double)a48 LOIGivenMessageWithEntity:(double)a49 LOIGivenCallWithEntity:(double)a50 LOIGivenFacetimeWithEntity:(double)a51 messageWithEntityGivenLOI:(double)a52 callWithEntityGivenLOI:(double)a53 facetimeWithEntityGivenLOI:(double)a54 messagePopularityGivenSpecificGeoHash:(double)a55 callPopularityGivenSpecificGeoHash:(double)a56 facetimePopularityGivenSpecificGeoHash:(double)a57 specificGeoHashGivenMessageWithEntity:(double)a58 specificGeoHashGivenCallWithEntity:(double)a59 specificGeoHashGivenFacetimeWithEntity:(double)a60 messageWithEntityGivenSpecificGeoHash:(double)a61 callWithEntityGivenSpecificGeoHash:(double)a62 facetimeWithEntityGivenSpecificGeoHash:(double)a63 messagePopularityGivenCoarseGeoHash:callPopularityGivenCoarseGeoHash:facetimePopularityGivenCoarseGeoHash:coarseGeoHashGivenMessageWithEntity:coarseGeoHashGivenCallWithEntity:coarseGeoHashGivenFacetimeWithEntity:messageWithEntityGivenCoarseGeoHash:callWithEntityGivenCoarseGeoHash:facetimeWithEntityGivenCoarseGeoHash:messagePopularityGivenLargeGeoHash:callPopularityGivenLargeGeoHash:facetimePopularityGivenLargeGeoHash:largeGeoHashGivenMessageWithEntity:largeGeoHashGivenCallWithEntity:largeGeoHashGivenFacetimeWithEntity:messageWithEntityGivenLargeGeoHash:callWithEntityGivenLargeGeoHash:facetimeWithEntityGivenLargeGeoHash:messagePopularityGivenMicroLocation:callPopularityGivenMicroLocation:facetimePopularityGivenMicroLocation:microLocationGivenMessageWithEntity:microLocationGivenCallWithEntity:microLocationGivenFacetimeWithEntity:messageWithEntityGivenMicroLocation:callWithEntityGivenMicroLocation:facetimeWithEntityGivenMicroLocation:messagePopularityGivenMotionState:callPopularityGivenMotionState:facetimePopularityGivenMotionState:motionStateGivenMessageWithEntity:motionStateGivenCallWithEntity:motionStateGivenFacetimeWithEntity:messageWithEntityGivenMotionState:callWithEntityGivenMotionState:facetimeWithEntityGivenMotionState:messagePopularityGivenWiFi:callPopularityGivenWiFi:facetimePopularityGivenWiFi:wiFiGivenMessageWithEntity:wiFiGivenCallWithEntity:wiFiGivenFacetimeWithEntity:messageWithEntityGivenWiFi:callWithEntityGivenWiFi:facetimeWithEntityGivenWiFi:messagePopularityGivenSequence:callPopularityGivenSequence:facetimePopularityGivenSequence:sequenceGivenMessageWithEntity:sequenceGivenCallWithEntity:sequenceGivenFacetimeWithEntity:lastExecutionAge:medianTimeIntervalBetweenExecution:dailyDoseL1Error:dailyDoseL2Error:shortTermTrendingPopularity:trendingPopularity:longTermTrendingPopularity:locationLastExecutationAge:locationPopularityGivenSpecificGeoHash:locationTrendingPopularity:
{
  v93.receiver = a1;
  v93.super_class = (Class)GDEntityFeatures;
  result = [(GDEntityFeatures *)&v93 init];
  if (result)
  {
    result->_double candidateNameScore = a2;
    result->_double candidateCommunicationScore = a3;
    result->_double candidateOrganizationScore = a4;
    result->_double candidateLocationScore = a5;
    result->_double candidateEventLocationScore = a6;
    result->_double candidateEventNameScore = a7;
    result->_double topicScore = a8;
    result->_double messagePopularityGivenTimeOfDay = a9;
    result->_double callPopularityGivenTimeOfDay = a15;
    result->_double facetimePopularityGivenTimeOfDay = a16;
    result->_double timeOfDayGivenMessageWithEntity = a17;
    result->_double timeOfDayGivenCallWithEntity = a18;
    result->_double timeOfDayGivenFacetimeWithEntity = a19;
    result->_double messageWithEntityGivenTimeOfDay = a20;
    result->_double callWithEntityGivenTimeOfDay = a21;
    result->_double facetimeWithEntityGivenTimeOfDay = a22;
    result->_double messagePopularityGivenCoarseTimeOfDay = a23;
    result->_double callPopularityGivenCoarseTimeOfDay = a24;
    result->_double facetimePopularityGivenCoarseTimeOfDay = a25;
    result->_double coarseTimeOfDayGivenMessageWithEntity = a26;
    result->_double coarseTimeOfDayGivenCallWithEntity = a27;
    result->_double coarseTimeOfDayGivenFacetimeWithEntity = a28;
    result->_double messageWithEntityGivenCoarseTimeOfDay = a29;
    result->_double callWithEntityGivenCoarseTimeOfDay = a30;
    result->_double facetimeWithEntityGivenCoarseTimeOfDay = a31;
    result->_double messagePopularityGivenDayOfWeek = a32;
    result->_double callPopularityGivenDayOfWeek = a33;
    result->_double facetimePopularityGivenDayOfWeek = a34;
    result->_double dayOfWeekGivenMessageWithEntity = a35;
    result->_double dayOfWeekGivenCallWithEntity = a36;
    result->_double dayOfWeekGivenFacetimeWithEntity = a37;
    result->_double messageWithEntityGivenDayOfWeek = a38;
    result->_double callWithEntityGivenDayOfWeek = a39;
    result->_double facetimeWithEntityGivenDayOfWeek = a40;
    result->_double messagePopularityGivenFocusMode = a41;
    result->_double callPopularityGivenFocusMode = a42;
    result->_double facetimePopularityGivenFocusMode = a43;
    result->_double focusModeGivenMessageWithEntity = a44;
    result->_double focusModeGivenCallWithEntity = a45;
    result->_double focusModeGivenFacetimeWithEntity = a46;
    result->_double messageWithEntityGivenFocusMode = a47;
    result->_double callWithEntityGivenFocusMode = a48;
    result->_double facetimeWithEntityGivenFocusMode = a49;
    result->_double messagePopularityGivenLOI = a50;
    result->_double callPopularityGivenLOI = a51;
    result->_double facetimePopularityGivenLOI = a52;
    result->_double LOIGivenMessageWithEntity = a53;
    result->_double LOIGivenCallWithEntity = a54;
    result->_double LOIGivenFacetimeWithEntity = a55;
    result->_double messageWithEntityGivenLOI = a56;
    result->_double callWithEntityGivenLOI = a57;
    result->_double facetimeWithEntityGivenLOI = a58;
    result->_double messagePopularityGivenSpecificGeoHash = a59;
    result->_double callPopularityGivenSpecificGeoHash = a60;
    result->_double facetimePopularityGivenSpecificGeoHash = a61;
    result->_double specificGeoHashGivenMessageWithEntity = a62;
    result->_double specificGeoHashGivenCallWithEntity = a63;
    result->_double specificGeoHashGivenFacetimeWithEntity = a64;
    result->_double messageWithEntityGivenSpecificGeoHash = a65;
    result->_double callWithEntityGivenSpecificGeoHash = a66;
    result->_double facetimeWithEntityGivenSpecificGeoHash = a67;
    result->_double messagePopularityGivenCoarseGeoHash = a68;
    result->_double callPopularityGivenCoarseGeoHash = a69;
    result->_double facetimePopularityGivenCoarseGeoHash = a70;
    result->_double coarseGeoHashGivenMessageWithEntity = a71;
    result->_double coarseGeoHashGivenCallWithEntity = a72;
    result->_double coarseGeoHashGivenFacetimeWithEntity = a73;
    result->_double messageWithEntityGivenCoarseGeoHash = a74;
    result->_double callWithEntityGivenCoarseGeoHash = a75;
    result->_double facetimeWithEntityGivenCoarseGeoHash = a76;
    result->_double messagePopularityGivenLargeGeoHash = a77;
    result->_double callPopularityGivenLargeGeoHash = a78;
    *(void *)&result->_double facetimePopularityGivenLargeGeoHash = STACK[0x290];
    *(void *)&result->_double largeGeoHashGivenMessageWithEntity = STACK[0x298];
    *(void *)&result->_double largeGeoHashGivenCallWithEntity = STACK[0x2A0];
    *(void *)&result->_double largeGeoHashGivenFacetimeWithEntity = STACK[0x2A8];
    *(void *)&result->_double messageWithEntityGivenLargeGeoHash = STACK[0x2B0];
    *(void *)&result->_double callWithEntityGivenLargeGeoHash = STACK[0x2B8];
    *(void *)&result->_double facetimeWithEntityGivenLargeGeoHash = STACK[0x2C0];
    *(void *)&result->_double messagePopularityGivenMicroLocation = STACK[0x2C8];
    *(void *)&result->_double callPopularityGivenMicroLocation = STACK[0x2D0];
    *(void *)&result->_double facetimePopularityGivenMicroLocation = STACK[0x2D8];
    *(void *)&result->_double microLocationGivenMessageWithEntity = STACK[0x2E0];
    *(void *)&result->_double microLocationGivenCallWithEntity = STACK[0x2E8];
    *(void *)&result->_double microLocationGivenFacetimeWithEntity = STACK[0x2F0];
    *(void *)&result->_double messageWithEntityGivenMicroLocation = STACK[0x2F8];
    *(void *)&result->_double callWithEntityGivenMicroLocation = STACK[0x300];
    *(void *)&result->_double facetimeWithEntityGivenMicroLocation = STACK[0x308];
    *(void *)&result->_double messagePopularityGivenMotionState = STACK[0x310];
    *(void *)&result->_double callPopularityGivenMotionState = STACK[0x318];
    *(void *)&result->_double facetimePopularityGivenMotionState = STACK[0x320];
    *(void *)&result->_double motionStateGivenMessageWithEntity = STACK[0x328];
    *(void *)&result->_double motionStateGivenCallWithEntity = STACK[0x330];
    *(void *)&result->_double motionStateGivenFacetimeWithEntity = STACK[0x338];
    *(void *)&result->_double messageWithEntityGivenMotionState = STACK[0x340];
    *(void *)&result->_double callWithEntityGivenMotionState = STACK[0x348];
    *(void *)&result->_double facetimeWithEntityGivenMotionState = STACK[0x350];
    *(void *)&result->_double messagePopularityGivenWiFi = STACK[0x358];
    *(void *)&result->_double callPopularityGivenWiFi = STACK[0x360];
    *(void *)&result->_double facetimePopularityGivenWiFi = STACK[0x368];
    *(void *)&result->_double wiFiGivenMessageWithEntity = STACK[0x370];
    *(void *)&result->_double wiFiGivenCallWithEntity = STACK[0x378];
    *(void *)&result->_double wiFiGivenFacetimeWithEntity = STACK[0x380];
    *(void *)&result->_double messageWithEntityGivenWiFi = STACK[0x388];
    *(void *)&result->_double callWithEntityGivenWiFi = STACK[0x390];
    *(void *)&result->_double facetimeWithEntityGivenWiFi = STACK[0x398];
    *(void *)&result->_double messagePopularityGivenSequence = STACK[0x3A0];
    *(void *)&result->_double callPopularityGivenSequence = STACK[0x3A8];
    *(void *)&result->_double facetimePopularityGivenSequence = STACK[0x3B0];
    *(void *)&result->_double sequenceGivenMessageWithEntity = STACK[0x3B8];
    *(void *)&result->_double sequenceGivenCallWithEntity = STACK[0x3C0];
    *(void *)&result->_double sequenceGivenFacetimeWithEntity = STACK[0x3C8];
    *(void *)&result->_double dailyDoseL2Error = STACK[0x3D0];
    *(void *)&result->_double shortTermTrendingPopularity = STACK[0x3D8];
    *(void *)&result->_double trendingPopularity = STACK[0x3E0];
    *(void *)&result->_double longTermTrendingPopularity = STACK[0x3E8];
    *(void *)&result->_double locationPopularityGivenSpecificGeoHash = STACK[0x3F0];
    *(void *)&result->_double locationTrendingPopularity = STACK[0x3F8];
    result->_uint64_t lastExecutionAge = a11;
    result->_uint64_t medianTimeIntervalBetweenExecution = a12;
    result->_uint64_t dailyDoseL1Error = a13;
    result->_uint64_t locationLastExecutionAge = a14;
  }
  return result;
}

- (GDEntityFeatures)initWithCandidateNameScore:(double)a3 candidateCommunicationScore:(double)a4 candidateOrganizationScore:(double)a5 candidateLocationScore:(double)a6 candidateEventLocationScore:(double)a7 candidateEventNameScore:(double)a8 topicScore:(double)a9 messagePopularityGivenTimeOfDay:(uint64_t)a10 callPopularityGivenTimeOfDay:(int)a11 facetimePopularityGivenTimeOfDay:(int)a12 timeOfDayGivenMessageWithEntity:(int)a13 timeOfDayGivenCallWithEntity:(double)a14 timeOfDayGivenFacetimeWithEntity:(double)a15 messageWithEntityGivenTimeOfDay:(double)a16 callWithEntityGivenTimeOfDay:(double)a17 facetimeWithEntityGivenTimeOfDay:(double)a18 messagePopularityGivenCoarseTimeOfDay:(double)a19 callPopularityGivenCoarseTimeOfDay:(double)a20 facetimePopularityGivenCoarseTimeOfDay:(double)a21 coarseTimeOfDayGivenMessageWithEntity:(double)a22 coarseTimeOfDayGivenCallWithEntity:(double)a23 coarseTimeOfDayGivenFacetimeWithEntity:(double)a24 messageWithEntityGivenCoarseTimeOfDay:(double)a25 callWithEntityGivenCoarseTimeOfDay:(double)a26 facetimeWithEntityGivenCoarseTimeOfDay:(double)a27 messagePopularityGivenDayOfWeek:(double)a28 callPopularityGivenDayOfWeek:(double)a29 facetimePopularityGivenDayOfWeek:(double)a30 dayOfWeekGivenMessageWithEntity:(double)a31 dayOfWeekGivenCallWithEntity:(double)a32 dayOfWeekGivenFacetimeWithEntity:(double)a33 messageWithEntityGivenDayOfWeek:(double)a34 callWithEntityGivenDayOfWeek:(double)a35 facetimeWithEntityGivenDayOfWeek:(double)a36 messagePopularityGivenFocusMode:(double)a37 callPopularityGivenFocusMode:(double)a38 facetimePopularityGivenFocusMode:(double)a39 focusModeGivenMessageWithEntity:(double)a40 focusModeGivenCallWithEntity:(double)a41 focusModeGivenFacetimeWithEntity:(double)a42 messageWithEntityGivenFocusMode:(double)a43 callWithEntityGivenFocusMode:(double)a44 facetimeWithEntityGivenFocusMode:(double)a45 messagePopularityGivenLOI:(double)a46 callPopularityGivenLOI:(double)a47 facetimePopularityGivenLOI:(double)a48 LOIGivenMessageWithEntity:(double)a49 LOIGivenCallWithEntity:(double)a50 LOIGivenFacetimeWithEntity:(double)a51 messageWithEntityGivenLOI:(double)a52 callWithEntityGivenLOI:(double)a53 facetimeWithEntityGivenLOI:(double)a54 messagePopularityGivenSpecificGeoHash:(double)a55 callPopularityGivenSpecificGeoHash:(double)a56 facetimePopularityGivenSpecificGeoHash:(double)a57 specificGeoHashGivenMessageWithEntity:(double)a58 specificGeoHashGivenCallWithEntity:(double)a59 specificGeoHashGivenFacetimeWithEntity:(double)a60 messageWithEntityGivenSpecificGeoHash:(double)a61 callWithEntityGivenSpecificGeoHash:(double)a62 facetimeWithEntityGivenSpecificGeoHash:(double)a63 messagePopularityGivenCoarseGeoHash:callPopularityGivenCoarseGeoHash:facetimePopularityGivenCoarseGeoHash:coarseGeoHashGivenMessageWithEntity:coarseGeoHashGivenCallWithEntity:coarseGeoHashGivenFacetimeWithEntity:messageWithEntityGivenCoarseGeoHash:callWithEntityGivenCoarseGeoHash:facetimeWithEntityGivenCoarseGeoHash:messagePopularityGivenLargeGeoHash:callPopularityGivenLargeGeoHash:facetimePopularityGivenLargeGeoHash:largeGeoHashGivenMessageWithEntity:largeGeoHashGivenCallWithEntity:largeGeoHashGivenFacetimeWithEntity:messageWithEntityGivenLargeGeoHash:callWithEntityGivenLargeGeoHash:facetimeWithEntityGivenLargeGeoHash:messagePopularityGivenMicroLocation:callPopularityGivenMicroLocation:facetimePopularityGivenMicroLocation:microLocationGivenMessageWithEntity:microLocationGivenCallWithEntity:microLocationGivenFacetimeWithEntity:messageWithEntityGivenMicroLocation:callWithEntityGivenMicroLocation:facetimeWithEntityGivenMicroLocation:messagePopularityGivenMotionState:callPopularityGivenMotionState:facetimePopularityGivenMotionState:motionStateGivenMessageWithEntity:motionStateGivenCallWithEntity:motionStateGivenFacetimeWithEntity:messageWithEntityGivenMotionState:callWithEntityGivenMotionState:facetimeWithEntityGivenMotionState:messagePopularityGivenWiFi:callPopularityGivenWiFi:facetimePopularityGivenWiFi:wiFiGivenMessageWithEntity:wiFiGivenCallWithEntity:wiFiGivenFacetimeWithEntity:messageWithEntityGivenWiFi:callWithEntityGivenWiFi:facetimeWithEntityGivenWiFi:messagePopularityGivenSequence:callPopularityGivenSequence:facetimePopularityGivenSequence:sequenceGivenMessageWithEntity:sequenceGivenCallWithEntity:sequenceGivenFacetimeWithEntity:lastExecutionAge:medianTimeIntervalBetweenExecution:dailyDoseL1Error:dailyDoseL2Error:shortTermTrendingPopularity:trendingPopularity:longTermTrendingPopularity:
{
  v97.receiver = a1;
  v97.super_class = (Class)GDEntityFeatures;
  result = [(GDEntityFeatures *)&v97 init];
  if (result)
  {
    result->_double candidateNameScore = a2;
    result->_double candidateCommunicationScore = a3;
    result->_double candidateOrganizationScore = a4;
    result->_double candidateLocationScore = a5;
    result->_double candidateEventLocationScore = a6;
    result->_double candidateEventNameScore = a7;
    result->_double topicScore = a8;
    result->_double messagePopularityGivenTimeOfDay = a9;
    result->_double callPopularityGivenTimeOfDay = a14;
    result->_double facetimePopularityGivenTimeOfDay = a15;
    result->_double timeOfDayGivenMessageWithEntity = a16;
    result->_double timeOfDayGivenCallWithEntity = a17;
    result->_double timeOfDayGivenFacetimeWithEntity = a18;
    result->_double messageWithEntityGivenTimeOfDay = a19;
    result->_double callWithEntityGivenTimeOfDay = a20;
    result->_double facetimeWithEntityGivenTimeOfDay = a21;
    result->_double messagePopularityGivenCoarseTimeOfDay = a22;
    result->_double callPopularityGivenCoarseTimeOfDay = a23;
    result->_double facetimePopularityGivenCoarseTimeOfDay = a24;
    result->_double coarseTimeOfDayGivenMessageWithEntity = a25;
    result->_double coarseTimeOfDayGivenCallWithEntity = a26;
    result->_double coarseTimeOfDayGivenFacetimeWithEntity = a27;
    result->_double messageWithEntityGivenCoarseTimeOfDay = a28;
    result->_double callWithEntityGivenCoarseTimeOfDay = a29;
    result->_double facetimeWithEntityGivenCoarseTimeOfDay = a30;
    result->_double messagePopularityGivenDayOfWeek = a31;
    result->_double callPopularityGivenDayOfWeek = a32;
    result->_double facetimePopularityGivenDayOfWeek = a33;
    result->_double dayOfWeekGivenMessageWithEntity = a34;
    result->_double dayOfWeekGivenCallWithEntity = a35;
    result->_double dayOfWeekGivenFacetimeWithEntity = a36;
    result->_double messageWithEntityGivenDayOfWeek = a37;
    result->_double callWithEntityGivenDayOfWeek = a38;
    result->_double facetimeWithEntityGivenDayOfWeek = a39;
    result->_double messagePopularityGivenFocusMode = a40;
    result->_double callPopularityGivenFocusMode = a41;
    result->_double facetimePopularityGivenFocusMode = a42;
    result->_double focusModeGivenMessageWithEntity = a43;
    result->_double focusModeGivenCallWithEntity = a44;
    result->_double focusModeGivenFacetimeWithEntity = a45;
    result->_double messageWithEntityGivenFocusMode = a46;
    result->_double callWithEntityGivenFocusMode = a47;
    result->_double facetimeWithEntityGivenFocusMode = a48;
    result->_double messagePopularityGivenLOI = a49;
    result->_double callPopularityGivenLOI = a50;
    result->_double facetimePopularityGivenLOI = a51;
    result->_double LOIGivenMessageWithEntity = a52;
    result->_double LOIGivenCallWithEntity = a53;
    result->_double LOIGivenFacetimeWithEntity = a54;
    result->_double messageWithEntityGivenLOI = a55;
    result->_double callWithEntityGivenLOI = a56;
    result->_double facetimeWithEntityGivenLOI = a57;
    result->_double messagePopularityGivenSpecificGeoHash = a58;
    result->_double callPopularityGivenSpecificGeoHash = a59;
    result->_double facetimePopularityGivenSpecificGeoHash = a60;
    result->_double specificGeoHashGivenMessageWithEntity = a61;
    result->_double specificGeoHashGivenCallWithEntity = a62;
    result->_double specificGeoHashGivenFacetimeWithEntity = a63;
    result->_double messageWithEntityGivenSpecificGeoHash = a64;
    result->_double callWithEntityGivenSpecificGeoHash = a65;
    result->_double facetimeWithEntityGivenSpecificGeoHash = a66;
    result->_double messagePopularityGivenCoarseGeoHash = a67;
    result->_double callPopularityGivenCoarseGeoHash = a68;
    result->_double facetimePopularityGivenCoarseGeoHash = a69;
    result->_double coarseGeoHashGivenMessageWithEntity = a70;
    result->_double coarseGeoHashGivenCallWithEntity = a71;
    result->_double coarseGeoHashGivenFacetimeWithEntity = a72;
    result->_double messageWithEntityGivenCoarseGeoHash = a73;
    result->_double callWithEntityGivenCoarseGeoHash = a74;
    result->_double facetimeWithEntityGivenCoarseGeoHash = a75;
    result->_double messagePopularityGivenLargeGeoHash = a76;
    result->_double callPopularityGivenLargeGeoHash = a77;
    *(void *)&result->_double facetimePopularityGivenLargeGeoHash = STACK[0x280];
    *(void *)&result->_double largeGeoHashGivenMessageWithEntity = STACK[0x288];
    *(void *)&result->_double largeGeoHashGivenCallWithEntity = STACK[0x290];
    *(void *)&result->_double largeGeoHashGivenFacetimeWithEntity = STACK[0x298];
    *(void *)&result->_double messageWithEntityGivenLargeGeoHash = STACK[0x2A0];
    *(void *)&result->_double callWithEntityGivenLargeGeoHash = STACK[0x2A8];
    *(void *)&result->_double facetimeWithEntityGivenLargeGeoHash = STACK[0x2B0];
    *(void *)&result->_double messagePopularityGivenMicroLocation = STACK[0x2B8];
    *(void *)&result->_double callPopularityGivenMicroLocation = STACK[0x2C0];
    *(void *)&result->_double facetimePopularityGivenMicroLocation = STACK[0x2C8];
    *(void *)&result->_double microLocationGivenMessageWithEntity = STACK[0x2D0];
    *(void *)&result->_double microLocationGivenCallWithEntity = STACK[0x2D8];
    *(void *)&result->_double microLocationGivenFacetimeWithEntity = STACK[0x2E0];
    *(void *)&result->_double messageWithEntityGivenMicroLocation = STACK[0x2E8];
    *(void *)&result->_double callWithEntityGivenMicroLocation = STACK[0x2F0];
    *(void *)&result->_double facetimeWithEntityGivenMicroLocation = STACK[0x2F8];
    *(void *)&result->_double messagePopularityGivenMotionState = STACK[0x300];
    *(void *)&result->_double callPopularityGivenMotionState = STACK[0x308];
    *(void *)&result->_double facetimePopularityGivenMotionState = STACK[0x310];
    *(void *)&result->_double motionStateGivenMessageWithEntity = STACK[0x318];
    *(void *)&result->_double motionStateGivenCallWithEntity = STACK[0x320];
    *(void *)&result->_double motionStateGivenFacetimeWithEntity = STACK[0x328];
    *(void *)&result->_double messageWithEntityGivenMotionState = STACK[0x330];
    *(void *)&result->_double callWithEntityGivenMotionState = STACK[0x338];
    *(void *)&result->_double facetimeWithEntityGivenMotionState = STACK[0x340];
    *(void *)&result->_double messagePopularityGivenWiFi = STACK[0x348];
    *(void *)&result->_double callPopularityGivenWiFi = STACK[0x350];
    *(void *)&result->_double facetimePopularityGivenWiFi = STACK[0x358];
    *(void *)&result->_double wiFiGivenMessageWithEntity = STACK[0x360];
    *(void *)&result->_double wiFiGivenCallWithEntity = STACK[0x368];
    *(void *)&result->_double wiFiGivenFacetimeWithEntity = STACK[0x370];
    *(void *)&result->_double messageWithEntityGivenWiFi = STACK[0x378];
    *(void *)&result->_double callWithEntityGivenWiFi = STACK[0x380];
    *(void *)&result->_double facetimeWithEntityGivenWiFi = STACK[0x388];
    *(void *)&result->_double messagePopularityGivenSequence = STACK[0x390];
    *(void *)&result->_double callPopularityGivenSequence = STACK[0x398];
    *(void *)&result->_double facetimePopularityGivenSequence = STACK[0x3A0];
    *(void *)&result->_double sequenceGivenMessageWithEntity = STACK[0x3A8];
    *(void *)&result->_double sequenceGivenCallWithEntity = STACK[0x3B0];
    *(void *)&result->_double sequenceGivenFacetimeWithEntity = STACK[0x3B8];
    *(void *)&result->_double dailyDoseL2Error = STACK[0x3C0];
    *(void *)&result->_double shortTermTrendingPopularity = STACK[0x3C8];
    *(void *)&result->_double trendingPopularity = STACK[0x3D0];
    *(void *)&result->_double longTermTrendingPopularity = STACK[0x3D8];
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&result->_double locationTrendingPopularity = _Q0;
    result->_uint64_t lastExecutionAge = a11;
    result->_uint64_t medianTimeIntervalBetweenExecution = a12;
    result->_uint64_t dailyDoseL1Error = a13;
    result->_uint64_t locationLastExecutionAge = -1;
  }
  return result;
}

- (GDEntityFeatures)initWithCandidateNameSimilarity:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GDEntityFeatures;
  result = [(GDEntityFeatures *)&v5 init];
  if (result) {
    result->_candidateNameSimilarity = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end