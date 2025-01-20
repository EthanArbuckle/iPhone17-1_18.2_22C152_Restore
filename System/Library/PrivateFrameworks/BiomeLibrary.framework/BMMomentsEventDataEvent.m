@interface BMMomentsEventDataEvent
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMomentsEventDataEvent)initWithEventIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 creationDate:(id)a6 sourceCreationDate:(id)a7 expirationDate:(id)a8 provider:(int)a9 category:(int)a10 placeUserType:(int)a11 poiCategory:(int)a12 placeDiscovery:(int)a13 locationMode:(int)a14 workoutType:(int)a15 workoutBundleID:(id)a16 mediaGenre:(int)a17 mediaType:(int)a18 mediaRepetitions:(id)a19 mediaSumTimePlayed:(id)a20 sourceParty:(int)a21 mediaPlayerBundleID:(id)a22 numAudioMediaPlaySessionsPerDay:(id)a23 durationAudioMediaPlaySessionsPerDay:(id)a24 numVideoMediaPlaySessionsPerDay:(id)a25 durationVideoMediaPlaySessionsPerDay:(id)a26 numFirstPartyMediaPlaySessionsPerDay:(id)a27 numThirdPartyMediaPlaySessionsPerDay:(id)a28 numContacts:(id)a29 contactIDsInConversation:(id)a30 contactIDMostSignificantInConversation:(id)a31 interactionContactScore:(id)a32 textLikeMechanismIncluded:(id)a33 callLikeMechanismIncluded:(id)a34 numTextLikeInteractions:(id)a35 numAudioLikeInteractions:(id)a36 numVideoLikeInteractions:(id)a37 totalDurationOfCallLikeInteractions:(id)a38 minDurationOfCallLikeInteractions:(id)a39 maxDurationOfCallLikeInteractions:(id)a40 photoMomentSource:(int)a41 photoMomentInferences:(id)a42 photoMomentHolidays:(id)a43 numPhotoMomentHolidays:(id)a44 numPhotoMomentInferences:(id)a45 numPhotoMomentPublicEvents:(id)a46 numPhotoMomentPersons:(id)a47 isFamilyInPhotoMoment:(id)a48 momentIncludesFavoritedAsset:(id)a49 momentIncludesVideo:(id)a50 momentIncludesPhoto:(id)a51 suggestedEventCategory:(int)a52 numAttendees:(id)a53 numtripParts:(id)a54 tripMode:(int)a55 numScoredTopics:(id)a56 numItemAuthors:(id)a57 numItemRecipients:(id)a58;
- (BMMomentsEventDataEvent)initWithEventIdentifier:(void *)a3 startDate:(void *)a4 endDate:(void *)a5 creationDate:(void *)a6 sourceCreationDate:(void *)a7 expirationDate:(void *)a8 provider:(int)a9 category:(int)a10 placeUserType:(int)a11 poiCategory:(int)a12 placeDiscovery:(int)a13 locationMode:(int)a14 workoutType:(int)a15 workoutBundleID:(id)a16 mediaGenre:(int)a17 mediaType:(int)a18 mediaRepetitions:(id)a19 mediaSumTimePlayed:(id)a20 sourceParty:(int)a21 mediaPlayerBundleID:(id)a22 numAudioMediaPlaySessionsPerDay:(id)a23 durationAudioMediaPlaySessionsPerDay:(id)a24 numVideoMediaPlaySessionsPerDay:(id)a25 durationVideoMediaPlaySessionsPerDay:(id)a26 numFirstPartyMediaPlaySessionsPerDay:(id)a27 numThirdPartyMediaPlaySessionsPerDay:(id)a28 numContacts:(id)a29 contactIDsInConversation:(id)a30 contactIDMostSignificantInConversation:(id)a31 interactionContactScore:(id)a32 textLikeMechanismIncluded:(id)a33 callLikeMechanismIncluded:(id)a34 numTextLikeInteractions:(id)a35 numAudioLikeInteractions:(id)a36 numVideoLikeInteractions:(id)a37 totalDurationOfCallLikeInteractions:(id)a38 minDurationOfCallLikeInteractions:(id)a39 maxDurationOfCallLikeInteractions:(id)a40 photoMomentSource:(int)a41 photoMomentInferences:(id)a42 photoMomentHolidays:(id)a43 numPhotoMomentHolidays:(id)a44 numPhotoMomentInferences:(id)a45 numPhotoMomentPublicEvents:(id)a46 numPhotoMomentPersons:(id)a47 isFamilyInPhotoMoment:(id)a48 momentIncludesFavoritedAsset:(id)a49 momentIncludesVideo:(id)a50 momentIncludesPhoto:(id)a51 suggestedEventCategory:(int)a52 numAttendees:(id)a53 numtripParts:(id)a54 tripMode:(int)a55 numScoredTopics:(id)a56 numItemAuthors:(id)a57 numItemRecipients:(id)a58 isGatheringComplete:(id)a59 gaPR:(id)a60 pCount:(id)a61 mapItemSource:(int)a62 placeType:(int)a63 placeLabelGranularity:;
- (BMMomentsEventDataEvent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMomentsEventDataPR)gaPR;
- (BOOL)callLikeMechanismIncluded;
- (BOOL)hasCallLikeMechanismIncluded;
- (BOOL)hasDurationAudioMediaPlaySessionsPerDay;
- (BOOL)hasDurationVideoMediaPlaySessionsPerDay;
- (BOOL)hasInteractionContactScore;
- (BOOL)hasIsFamilyInPhotoMoment;
- (BOOL)hasIsGatheringComplete;
- (BOOL)hasMaxDurationOfCallLikeInteractions;
- (BOOL)hasMediaRepetitions;
- (BOOL)hasMediaSumTimePlayed;
- (BOOL)hasMinDurationOfCallLikeInteractions;
- (BOOL)hasMomentIncludesFavoritedAsset;
- (BOOL)hasMomentIncludesPhoto;
- (BOOL)hasMomentIncludesVideo;
- (BOOL)hasNumAttendees;
- (BOOL)hasNumAudioLikeInteractions;
- (BOOL)hasNumAudioMediaPlaySessionsPerDay;
- (BOOL)hasNumContacts;
- (BOOL)hasNumFirstPartyMediaPlaySessionsPerDay;
- (BOOL)hasNumItemAuthors;
- (BOOL)hasNumItemRecipients;
- (BOOL)hasNumPhotoMomentHolidays;
- (BOOL)hasNumPhotoMomentInferences;
- (BOOL)hasNumPhotoMomentPersons;
- (BOOL)hasNumPhotoMomentPublicEvents;
- (BOOL)hasNumScoredTopics;
- (BOOL)hasNumTextLikeInteractions;
- (BOOL)hasNumThirdPartyMediaPlaySessionsPerDay;
- (BOOL)hasNumVideoLikeInteractions;
- (BOOL)hasNumVideoMediaPlaySessionsPerDay;
- (BOOL)hasNumtripParts;
- (BOOL)hasPCount;
- (BOOL)hasTextLikeMechanismIncluded;
- (BOOL)hasTotalDurationOfCallLikeInteractions;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFamilyInPhotoMoment;
- (BOOL)isGatheringComplete;
- (BOOL)momentIncludesFavoritedAsset;
- (BOOL)momentIncludesPhoto;
- (BOOL)momentIncludesVideo;
- (BOOL)textLikeMechanismIncluded;
- (NSArray)contactIDsInConversation;
- (NSArray)photoMomentHolidays;
- (NSArray)photoMomentInferences;
- (NSDate)creationDate;
- (NSDate)endDate;
- (NSDate)expirationDate;
- (NSDate)sourceCreationDate;
- (NSDate)startDate;
- (NSString)contactIDMostSignificantInConversation;
- (NSString)description;
- (NSString)eventIdentifier;
- (NSString)mediaPlayerBundleID;
- (NSString)workoutBundleID;
- (double)durationAudioMediaPlaySessionsPerDay;
- (double)durationVideoMediaPlaySessionsPerDay;
- (double)interactionContactScore;
- (double)maxDurationOfCallLikeInteractions;
- (double)minDurationOfCallLikeInteractions;
- (double)totalDurationOfCallLikeInteractions;
- (id)_contactIDsInConversationJSONArray;
- (id)_photoMomentHolidaysJSONArray;
- (id)_photoMomentInferencesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)category;
- (int)locationMode;
- (int)mapItemSource;
- (int)mediaGenre;
- (int)mediaRepetitions;
- (int)mediaSumTimePlayed;
- (int)mediaType;
- (int)numAttendees;
- (int)numAudioLikeInteractions;
- (int)numAudioMediaPlaySessionsPerDay;
- (int)numContacts;
- (int)numFirstPartyMediaPlaySessionsPerDay;
- (int)numItemAuthors;
- (int)numItemRecipients;
- (int)numPhotoMomentHolidays;
- (int)numPhotoMomentInferences;
- (int)numPhotoMomentPersons;
- (int)numPhotoMomentPublicEvents;
- (int)numScoredTopics;
- (int)numTextLikeInteractions;
- (int)numThirdPartyMediaPlaySessionsPerDay;
- (int)numVideoLikeInteractions;
- (int)numVideoMediaPlaySessionsPerDay;
- (int)numtripParts;
- (int)pCount;
- (int)photoMomentSource;
- (int)placeDiscovery;
- (int)placeLabelGranularity;
- (int)placeType;
- (int)placeUserType;
- (int)poiCategory;
- (int)provider;
- (int)sourceParty;
- (int)suggestedEventCategory;
- (int)tripMode;
- (int)workoutType;
- (unsigned)dataVersion;
- (void)setHasCallLikeMechanismIncluded:(BOOL)a3;
- (void)setHasDurationAudioMediaPlaySessionsPerDay:(BOOL)a3;
- (void)setHasDurationVideoMediaPlaySessionsPerDay:(BOOL)a3;
- (void)setHasInteractionContactScore:(BOOL)a3;
- (void)setHasIsFamilyInPhotoMoment:(BOOL)a3;
- (void)setHasIsGatheringComplete:(BOOL)a3;
- (void)setHasMaxDurationOfCallLikeInteractions:(BOOL)a3;
- (void)setHasMediaRepetitions:(BOOL)a3;
- (void)setHasMediaSumTimePlayed:(BOOL)a3;
- (void)setHasMinDurationOfCallLikeInteractions:(BOOL)a3;
- (void)setHasMomentIncludesFavoritedAsset:(BOOL)a3;
- (void)setHasMomentIncludesPhoto:(BOOL)a3;
- (void)setHasMomentIncludesVideo:(BOOL)a3;
- (void)setHasNumAttendees:(BOOL)a3;
- (void)setHasNumAudioLikeInteractions:(BOOL)a3;
- (void)setHasNumAudioMediaPlaySessionsPerDay:(BOOL)a3;
- (void)setHasNumContacts:(BOOL)a3;
- (void)setHasNumFirstPartyMediaPlaySessionsPerDay:(BOOL)a3;
- (void)setHasNumItemAuthors:(BOOL)a3;
- (void)setHasNumItemRecipients:(BOOL)a3;
- (void)setHasNumPhotoMomentHolidays:(BOOL)a3;
- (void)setHasNumPhotoMomentInferences:(BOOL)a3;
- (void)setHasNumPhotoMomentPersons:(BOOL)a3;
- (void)setHasNumPhotoMomentPublicEvents:(BOOL)a3;
- (void)setHasNumScoredTopics:(BOOL)a3;
- (void)setHasNumTextLikeInteractions:(BOOL)a3;
- (void)setHasNumThirdPartyMediaPlaySessionsPerDay:(BOOL)a3;
- (void)setHasNumVideoLikeInteractions:(BOOL)a3;
- (void)setHasNumVideoMediaPlaySessionsPerDay:(BOOL)a3;
- (void)setHasNumtripParts:(BOOL)a3;
- (void)setHasPCount:(BOOL)a3;
- (void)setHasTextLikeMechanismIncluded:(BOOL)a3;
- (void)setHasTotalDurationOfCallLikeInteractions:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMomentsEventDataEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoMomentHolidays, 0);
  objc_storeStrong((id *)&self->_photoMomentInferences, 0);
  objc_storeStrong((id *)&self->_gaPR, 0);
  objc_storeStrong((id *)&self->_contactIDMostSignificantInConversation, 0);
  objc_storeStrong((id *)&self->_contactIDsInConversation, 0);
  objc_storeStrong((id *)&self->_mediaPlayerBundleID, 0);
  objc_storeStrong((id *)&self->_workoutBundleID, 0);

  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

- (void)setHasMomentIncludesPhoto:(BOOL)a3
{
  self->_hasMomentIncludesPhoto = a3;
}

- (BOOL)hasMomentIncludesPhoto
{
  return self->_hasMomentIncludesPhoto;
}

- (BOOL)momentIncludesPhoto
{
  return self->_momentIncludesPhoto;
}

- (void)setHasMomentIncludesVideo:(BOOL)a3
{
  self->_hasMomentIncludesVideo = a3;
}

- (BOOL)hasMomentIncludesVideo
{
  return self->_hasMomentIncludesVideo;
}

- (BOOL)momentIncludesVideo
{
  return self->_momentIncludesVideo;
}

- (void)setHasMomentIncludesFavoritedAsset:(BOOL)a3
{
  self->_hasMomentIncludesFavoritedAsset = a3;
}

- (BOOL)hasMomentIncludesFavoritedAsset
{
  return self->_hasMomentIncludesFavoritedAsset;
}

- (BOOL)momentIncludesFavoritedAsset
{
  return self->_momentIncludesFavoritedAsset;
}

- (void)setHasIsFamilyInPhotoMoment:(BOOL)a3
{
  self->_hasIsFamilyInPhotoMoment = a3;
}

- (BOOL)hasIsFamilyInPhotoMoment
{
  return self->_hasIsFamilyInPhotoMoment;
}

- (BOOL)isFamilyInPhotoMoment
{
  return self->_isFamilyInPhotoMoment;
}

- (void)setHasNumPhotoMomentPersons:(BOOL)a3
{
  self->_hasNumPhotoMomentPersons = a3;
}

- (BOOL)hasNumPhotoMomentPersons
{
  return self->_hasNumPhotoMomentPersons;
}

- (int)numPhotoMomentPersons
{
  return self->_numPhotoMomentPersons;
}

- (void)setHasNumPhotoMomentPublicEvents:(BOOL)a3
{
  self->_hasNumPhotoMomentPublicEvents = a3;
}

- (BOOL)hasNumPhotoMomentPublicEvents
{
  return self->_hasNumPhotoMomentPublicEvents;
}

- (int)numPhotoMomentPublicEvents
{
  return self->_numPhotoMomentPublicEvents;
}

- (void)setHasNumPhotoMomentInferences:(BOOL)a3
{
  self->_hasNumPhotoMomentInferences = a3;
}

- (BOOL)hasNumPhotoMomentInferences
{
  return self->_hasNumPhotoMomentInferences;
}

- (int)numPhotoMomentInferences
{
  return self->_numPhotoMomentInferences;
}

- (void)setHasNumPhotoMomentHolidays:(BOOL)a3
{
  self->_hasNumPhotoMomentHolidays = a3;
}

- (BOOL)hasNumPhotoMomentHolidays
{
  return self->_hasNumPhotoMomentHolidays;
}

- (int)numPhotoMomentHolidays
{
  return self->_numPhotoMomentHolidays;
}

- (NSArray)photoMomentHolidays
{
  return self->_photoMomentHolidays;
}

- (NSArray)photoMomentInferences
{
  return self->_photoMomentInferences;
}

- (int)photoMomentSource
{
  return self->_photoMomentSource;
}

- (int)placeLabelGranularity
{
  return self->_placeLabelGranularity;
}

- (int)placeType
{
  return self->_placeType;
}

- (int)mapItemSource
{
  return self->_mapItemSource;
}

- (void)setHasPCount:(BOOL)a3
{
  self->_hasPCount = a3;
}

- (BOOL)hasPCount
{
  return self->_hasPCount;
}

- (int)pCount
{
  return self->_pCount;
}

- (BMMomentsEventDataPR)gaPR
{
  return self->_gaPR;
}

- (void)setHasIsGatheringComplete:(BOOL)a3
{
  self->_hasIsGatheringComplete = a3;
}

- (BOOL)hasIsGatheringComplete
{
  return self->_hasIsGatheringComplete;
}

- (BOOL)isGatheringComplete
{
  return self->_isGatheringComplete;
}

- (void)setHasNumItemRecipients:(BOOL)a3
{
  self->_hasNumItemRecipients = a3;
}

- (BOOL)hasNumItemRecipients
{
  return self->_hasNumItemRecipients;
}

- (int)numItemRecipients
{
  return self->_numItemRecipients;
}

- (void)setHasNumItemAuthors:(BOOL)a3
{
  self->_hasNumItemAuthors = a3;
}

- (BOOL)hasNumItemAuthors
{
  return self->_hasNumItemAuthors;
}

- (int)numItemAuthors
{
  return self->_numItemAuthors;
}

- (void)setHasNumScoredTopics:(BOOL)a3
{
  self->_hasNumScoredTopics = a3;
}

- (BOOL)hasNumScoredTopics
{
  return self->_hasNumScoredTopics;
}

- (int)numScoredTopics
{
  return self->_numScoredTopics;
}

- (int)tripMode
{
  return self->_tripMode;
}

- (void)setHasNumtripParts:(BOOL)a3
{
  self->_hasNumtripParts = a3;
}

- (BOOL)hasNumtripParts
{
  return self->_hasNumtripParts;
}

- (int)numtripParts
{
  return self->_numtripParts;
}

- (void)setHasNumAttendees:(BOOL)a3
{
  self->_hasNumAttendees = a3;
}

- (BOOL)hasNumAttendees
{
  return self->_hasNumAttendees;
}

- (int)numAttendees
{
  return self->_numAttendees;
}

- (int)suggestedEventCategory
{
  return self->_suggestedEventCategory;
}

- (void)setHasMaxDurationOfCallLikeInteractions:(BOOL)a3
{
  self->_hasMaxDurationOfCallLikeInteractions = a3;
}

- (BOOL)hasMaxDurationOfCallLikeInteractions
{
  return self->_hasMaxDurationOfCallLikeInteractions;
}

- (double)maxDurationOfCallLikeInteractions
{
  return self->_maxDurationOfCallLikeInteractions;
}

- (void)setHasMinDurationOfCallLikeInteractions:(BOOL)a3
{
  self->_hasMinDurationOfCallLikeInteractions = a3;
}

- (BOOL)hasMinDurationOfCallLikeInteractions
{
  return self->_hasMinDurationOfCallLikeInteractions;
}

- (double)minDurationOfCallLikeInteractions
{
  return self->_minDurationOfCallLikeInteractions;
}

- (void)setHasTotalDurationOfCallLikeInteractions:(BOOL)a3
{
  self->_hasTotalDurationOfCallLikeInteractions = a3;
}

- (BOOL)hasTotalDurationOfCallLikeInteractions
{
  return self->_hasTotalDurationOfCallLikeInteractions;
}

- (double)totalDurationOfCallLikeInteractions
{
  return self->_totalDurationOfCallLikeInteractions;
}

- (void)setHasNumVideoLikeInteractions:(BOOL)a3
{
  self->_hasNumVideoLikeInteractions = a3;
}

- (BOOL)hasNumVideoLikeInteractions
{
  return self->_hasNumVideoLikeInteractions;
}

- (int)numVideoLikeInteractions
{
  return self->_numVideoLikeInteractions;
}

- (void)setHasNumAudioLikeInteractions:(BOOL)a3
{
  self->_hasNumAudioLikeInteractions = a3;
}

- (BOOL)hasNumAudioLikeInteractions
{
  return self->_hasNumAudioLikeInteractions;
}

- (int)numAudioLikeInteractions
{
  return self->_numAudioLikeInteractions;
}

- (void)setHasNumTextLikeInteractions:(BOOL)a3
{
  self->_hasNumTextLikeInteractions = a3;
}

- (BOOL)hasNumTextLikeInteractions
{
  return self->_hasNumTextLikeInteractions;
}

- (int)numTextLikeInteractions
{
  return self->_numTextLikeInteractions;
}

- (void)setHasCallLikeMechanismIncluded:(BOOL)a3
{
  self->_hasCallLikeMechanismIncluded = a3;
}

- (BOOL)hasCallLikeMechanismIncluded
{
  return self->_hasCallLikeMechanismIncluded;
}

- (BOOL)callLikeMechanismIncluded
{
  return self->_callLikeMechanismIncluded;
}

- (void)setHasTextLikeMechanismIncluded:(BOOL)a3
{
  self->_hasTextLikeMechanismIncluded = a3;
}

- (BOOL)hasTextLikeMechanismIncluded
{
  return self->_hasTextLikeMechanismIncluded;
}

- (BOOL)textLikeMechanismIncluded
{
  return self->_textLikeMechanismIncluded;
}

- (void)setHasInteractionContactScore:(BOOL)a3
{
  self->_hasInteractionContactScore = a3;
}

- (BOOL)hasInteractionContactScore
{
  return self->_hasInteractionContactScore;
}

- (double)interactionContactScore
{
  return self->_interactionContactScore;
}

- (NSString)contactIDMostSignificantInConversation
{
  return self->_contactIDMostSignificantInConversation;
}

- (NSArray)contactIDsInConversation
{
  return self->_contactIDsInConversation;
}

- (void)setHasNumContacts:(BOOL)a3
{
  self->_hasNumContacts = a3;
}

- (BOOL)hasNumContacts
{
  return self->_hasNumContacts;
}

- (int)numContacts
{
  return self->_numContacts;
}

- (void)setHasNumThirdPartyMediaPlaySessionsPerDay:(BOOL)a3
{
  self->_hasNumThirdPartyMediaPlaySessionsPerDay = a3;
}

- (BOOL)hasNumThirdPartyMediaPlaySessionsPerDay
{
  return self->_hasNumThirdPartyMediaPlaySessionsPerDay;
}

- (int)numThirdPartyMediaPlaySessionsPerDay
{
  return self->_numThirdPartyMediaPlaySessionsPerDay;
}

- (void)setHasNumFirstPartyMediaPlaySessionsPerDay:(BOOL)a3
{
  self->_hasNumFirstPartyMediaPlaySessionsPerDay = a3;
}

- (BOOL)hasNumFirstPartyMediaPlaySessionsPerDay
{
  return self->_hasNumFirstPartyMediaPlaySessionsPerDay;
}

- (int)numFirstPartyMediaPlaySessionsPerDay
{
  return self->_numFirstPartyMediaPlaySessionsPerDay;
}

- (void)setHasDurationVideoMediaPlaySessionsPerDay:(BOOL)a3
{
  self->_hasDurationVideoMediaPlaySessionsPerDay = a3;
}

- (BOOL)hasDurationVideoMediaPlaySessionsPerDay
{
  return self->_hasDurationVideoMediaPlaySessionsPerDay;
}

- (double)durationVideoMediaPlaySessionsPerDay
{
  return self->_durationVideoMediaPlaySessionsPerDay;
}

- (void)setHasNumVideoMediaPlaySessionsPerDay:(BOOL)a3
{
  self->_hasNumVideoMediaPlaySessionsPerDay = a3;
}

- (BOOL)hasNumVideoMediaPlaySessionsPerDay
{
  return self->_hasNumVideoMediaPlaySessionsPerDay;
}

- (int)numVideoMediaPlaySessionsPerDay
{
  return self->_numVideoMediaPlaySessionsPerDay;
}

- (void)setHasDurationAudioMediaPlaySessionsPerDay:(BOOL)a3
{
  self->_hasDurationAudioMediaPlaySessionsPerDay = a3;
}

- (BOOL)hasDurationAudioMediaPlaySessionsPerDay
{
  return self->_hasDurationAudioMediaPlaySessionsPerDay;
}

- (double)durationAudioMediaPlaySessionsPerDay
{
  return self->_durationAudioMediaPlaySessionsPerDay;
}

- (void)setHasNumAudioMediaPlaySessionsPerDay:(BOOL)a3
{
  self->_hasNumAudioMediaPlaySessionsPerDay = a3;
}

- (BOOL)hasNumAudioMediaPlaySessionsPerDay
{
  return self->_hasNumAudioMediaPlaySessionsPerDay;
}

- (int)numAudioMediaPlaySessionsPerDay
{
  return self->_numAudioMediaPlaySessionsPerDay;
}

- (NSString)mediaPlayerBundleID
{
  return self->_mediaPlayerBundleID;
}

- (int)sourceParty
{
  return self->_sourceParty;
}

- (void)setHasMediaSumTimePlayed:(BOOL)a3
{
  self->_hasMediaSumTimePlayed = a3;
}

- (BOOL)hasMediaSumTimePlayed
{
  return self->_hasMediaSumTimePlayed;
}

- (int)mediaSumTimePlayed
{
  return self->_mediaSumTimePlayed;
}

- (void)setHasMediaRepetitions:(BOOL)a3
{
  self->_hasMediaRepetitions = a3;
}

- (BOOL)hasMediaRepetitions
{
  return self->_hasMediaRepetitions;
}

- (int)mediaRepetitions
{
  return self->_mediaRepetitions;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (int)mediaGenre
{
  return self->_mediaGenre;
}

- (NSString)workoutBundleID
{
  return self->_workoutBundleID;
}

- (int)workoutType
{
  return self->_workoutType;
}

- (int)locationMode
{
  return self->_locationMode;
}

- (int)placeDiscovery
{
  return self->_placeDiscovery;
}

- (int)poiCategory
{
  return self->_poiCategory;
}

- (int)placeUserType
{
  return self->_placeUserType;
}

- (int)category
{
  return self->_category;
}

- (int)provider
{
  return self->_provider;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
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
    v6 = [(BMMomentsEventDataEvent *)self eventIdentifier];
    uint64_t v7 = [v5 eventIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMomentsEventDataEvent *)self eventIdentifier];
      v10 = [v5 eventIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_236;
      }
    }
    v13 = [(BMMomentsEventDataEvent *)self startDate];
    uint64_t v14 = [v5 startDate];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMomentsEventDataEvent *)self startDate];
      v17 = [v5 startDate];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_236;
      }
    }
    v19 = [(BMMomentsEventDataEvent *)self endDate];
    uint64_t v20 = [v5 endDate];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMMomentsEventDataEvent *)self endDate];
      v23 = [v5 endDate];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_236;
      }
    }
    v25 = [(BMMomentsEventDataEvent *)self creationDate];
    uint64_t v26 = [v5 creationDate];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMMomentsEventDataEvent *)self creationDate];
      v29 = [v5 creationDate];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_236;
      }
    }
    v31 = [(BMMomentsEventDataEvent *)self sourceCreationDate];
    uint64_t v32 = [v5 sourceCreationDate];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMMomentsEventDataEvent *)self sourceCreationDate];
      v35 = [v5 sourceCreationDate];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_236;
      }
    }
    v37 = [(BMMomentsEventDataEvent *)self expirationDate];
    uint64_t v38 = [v5 expirationDate];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMMomentsEventDataEvent *)self expirationDate];
      v41 = [v5 expirationDate];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_236;
      }
    }
    int v43 = [(BMMomentsEventDataEvent *)self provider];
    if (v43 != [v5 provider]) {
      goto LABEL_236;
    }
    int v44 = [(BMMomentsEventDataEvent *)self category];
    if (v44 != [v5 category]) {
      goto LABEL_236;
    }
    int v45 = [(BMMomentsEventDataEvent *)self placeUserType];
    if (v45 != [v5 placeUserType]) {
      goto LABEL_236;
    }
    int v46 = [(BMMomentsEventDataEvent *)self poiCategory];
    if (v46 != [v5 poiCategory]) {
      goto LABEL_236;
    }
    int v47 = [(BMMomentsEventDataEvent *)self placeDiscovery];
    if (v47 != [v5 placeDiscovery]) {
      goto LABEL_236;
    }
    int v48 = [(BMMomentsEventDataEvent *)self locationMode];
    if (v48 != [v5 locationMode]) {
      goto LABEL_236;
    }
    int v49 = [(BMMomentsEventDataEvent *)self workoutType];
    if (v49 != [v5 workoutType]) {
      goto LABEL_236;
    }
    v50 = [(BMMomentsEventDataEvent *)self workoutBundleID];
    uint64_t v51 = [v5 workoutBundleID];
    if (v50 == (void *)v51)
    {
    }
    else
    {
      v52 = (void *)v51;
      v53 = [(BMMomentsEventDataEvent *)self workoutBundleID];
      v54 = [v5 workoutBundleID];
      int v55 = [v53 isEqual:v54];

      if (!v55) {
        goto LABEL_236;
      }
    }
    int v56 = [(BMMomentsEventDataEvent *)self mediaGenre];
    if (v56 != [v5 mediaGenre]) {
      goto LABEL_236;
    }
    int v57 = [(BMMomentsEventDataEvent *)self mediaType];
    if (v57 != [v5 mediaType]) {
      goto LABEL_236;
    }
    if ([(BMMomentsEventDataEvent *)self hasMediaRepetitions]
      || [v5 hasMediaRepetitions])
    {
      if (![(BMMomentsEventDataEvent *)self hasMediaRepetitions]) {
        goto LABEL_236;
      }
      if (![v5 hasMediaRepetitions]) {
        goto LABEL_236;
      }
      int v58 = [(BMMomentsEventDataEvent *)self mediaRepetitions];
      if (v58 != [v5 mediaRepetitions]) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasMediaSumTimePlayed]
      || [v5 hasMediaSumTimePlayed])
    {
      if (![(BMMomentsEventDataEvent *)self hasMediaSumTimePlayed]) {
        goto LABEL_236;
      }
      if (![v5 hasMediaSumTimePlayed]) {
        goto LABEL_236;
      }
      int v59 = [(BMMomentsEventDataEvent *)self mediaSumTimePlayed];
      if (v59 != [v5 mediaSumTimePlayed]) {
        goto LABEL_236;
      }
    }
    int v60 = [(BMMomentsEventDataEvent *)self sourceParty];
    if (v60 != [v5 sourceParty]) {
      goto LABEL_236;
    }
    v61 = [(BMMomentsEventDataEvent *)self mediaPlayerBundleID];
    uint64_t v62 = [v5 mediaPlayerBundleID];
    if (v61 == (void *)v62)
    {
    }
    else
    {
      v63 = (void *)v62;
      v64 = [(BMMomentsEventDataEvent *)self mediaPlayerBundleID];
      v65 = [v5 mediaPlayerBundleID];
      int v66 = [v64 isEqual:v65];

      if (!v66) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasNumAudioMediaPlaySessionsPerDay]
      || [v5 hasNumAudioMediaPlaySessionsPerDay])
    {
      if (![(BMMomentsEventDataEvent *)self hasNumAudioMediaPlaySessionsPerDay]) {
        goto LABEL_236;
      }
      if (![v5 hasNumAudioMediaPlaySessionsPerDay]) {
        goto LABEL_236;
      }
      int v67 = [(BMMomentsEventDataEvent *)self numAudioMediaPlaySessionsPerDay];
      if (v67 != [v5 numAudioMediaPlaySessionsPerDay]) {
        goto LABEL_236;
      }
    }
    if (-[BMMomentsEventDataEvent hasDurationAudioMediaPlaySessionsPerDay](self, "hasDurationAudioMediaPlaySessionsPerDay")|| [v5 hasDurationAudioMediaPlaySessionsPerDay])
    {
      if (![(BMMomentsEventDataEvent *)self hasDurationAudioMediaPlaySessionsPerDay])goto LABEL_236; {
      if (![v5 hasDurationAudioMediaPlaySessionsPerDay])
      }
        goto LABEL_236;
      [(BMMomentsEventDataEvent *)self durationAudioMediaPlaySessionsPerDay];
      double v69 = v68;
      [v5 durationAudioMediaPlaySessionsPerDay];
      if (v69 != v70) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasNumVideoMediaPlaySessionsPerDay]
      || [v5 hasNumVideoMediaPlaySessionsPerDay])
    {
      if (![(BMMomentsEventDataEvent *)self hasNumVideoMediaPlaySessionsPerDay]) {
        goto LABEL_236;
      }
      if (![v5 hasNumVideoMediaPlaySessionsPerDay]) {
        goto LABEL_236;
      }
      int v71 = [(BMMomentsEventDataEvent *)self numVideoMediaPlaySessionsPerDay];
      if (v71 != [v5 numVideoMediaPlaySessionsPerDay]) {
        goto LABEL_236;
      }
    }
    if (-[BMMomentsEventDataEvent hasDurationVideoMediaPlaySessionsPerDay](self, "hasDurationVideoMediaPlaySessionsPerDay")|| [v5 hasDurationVideoMediaPlaySessionsPerDay])
    {
      if (![(BMMomentsEventDataEvent *)self hasDurationVideoMediaPlaySessionsPerDay])goto LABEL_236; {
      if (![v5 hasDurationVideoMediaPlaySessionsPerDay])
      }
        goto LABEL_236;
      [(BMMomentsEventDataEvent *)self durationVideoMediaPlaySessionsPerDay];
      double v73 = v72;
      [v5 durationVideoMediaPlaySessionsPerDay];
      if (v73 != v74) {
        goto LABEL_236;
      }
    }
    if (-[BMMomentsEventDataEvent hasNumFirstPartyMediaPlaySessionsPerDay](self, "hasNumFirstPartyMediaPlaySessionsPerDay")|| [v5 hasNumFirstPartyMediaPlaySessionsPerDay])
    {
      if (![(BMMomentsEventDataEvent *)self hasNumFirstPartyMediaPlaySessionsPerDay])goto LABEL_236; {
      if (![v5 hasNumFirstPartyMediaPlaySessionsPerDay])
      }
        goto LABEL_236;
      int v75 = [(BMMomentsEventDataEvent *)self numFirstPartyMediaPlaySessionsPerDay];
      if (v75 != [v5 numFirstPartyMediaPlaySessionsPerDay]) {
        goto LABEL_236;
      }
    }
    if (-[BMMomentsEventDataEvent hasNumThirdPartyMediaPlaySessionsPerDay](self, "hasNumThirdPartyMediaPlaySessionsPerDay")|| [v5 hasNumThirdPartyMediaPlaySessionsPerDay])
    {
      if (![(BMMomentsEventDataEvent *)self hasNumThirdPartyMediaPlaySessionsPerDay])goto LABEL_236; {
      if (![v5 hasNumThirdPartyMediaPlaySessionsPerDay])
      }
        goto LABEL_236;
      int v76 = [(BMMomentsEventDataEvent *)self numThirdPartyMediaPlaySessionsPerDay];
      if (v76 != [v5 numThirdPartyMediaPlaySessionsPerDay]) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasNumContacts]
      || [v5 hasNumContacts])
    {
      if (![(BMMomentsEventDataEvent *)self hasNumContacts]) {
        goto LABEL_236;
      }
      if (![v5 hasNumContacts]) {
        goto LABEL_236;
      }
      int v77 = [(BMMomentsEventDataEvent *)self numContacts];
      if (v77 != [v5 numContacts]) {
        goto LABEL_236;
      }
    }
    v78 = [(BMMomentsEventDataEvent *)self contactIDsInConversation];
    uint64_t v79 = [v5 contactIDsInConversation];
    if (v78 == (void *)v79)
    {
    }
    else
    {
      v80 = (void *)v79;
      v81 = [(BMMomentsEventDataEvent *)self contactIDsInConversation];
      v82 = [v5 contactIDsInConversation];
      int v83 = [v81 isEqual:v82];

      if (!v83) {
        goto LABEL_236;
      }
    }
    v84 = [(BMMomentsEventDataEvent *)self contactIDMostSignificantInConversation];
    uint64_t v85 = [v5 contactIDMostSignificantInConversation];
    if (v84 == (void *)v85)
    {
    }
    else
    {
      v86 = (void *)v85;
      v87 = [(BMMomentsEventDataEvent *)self contactIDMostSignificantInConversation];
      v88 = [v5 contactIDMostSignificantInConversation];
      int v89 = [v87 isEqual:v88];

      if (!v89) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasInteractionContactScore]
      || [v5 hasInteractionContactScore])
    {
      if (![(BMMomentsEventDataEvent *)self hasInteractionContactScore]) {
        goto LABEL_236;
      }
      if (![v5 hasInteractionContactScore]) {
        goto LABEL_236;
      }
      [(BMMomentsEventDataEvent *)self interactionContactScore];
      double v91 = v90;
      [v5 interactionContactScore];
      if (v91 != v92) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasTextLikeMechanismIncluded]
      || [v5 hasTextLikeMechanismIncluded])
    {
      if (![(BMMomentsEventDataEvent *)self hasTextLikeMechanismIncluded]) {
        goto LABEL_236;
      }
      if (![v5 hasTextLikeMechanismIncluded]) {
        goto LABEL_236;
      }
      int v93 = [(BMMomentsEventDataEvent *)self textLikeMechanismIncluded];
      if (v93 != [v5 textLikeMechanismIncluded]) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasCallLikeMechanismIncluded]
      || [v5 hasCallLikeMechanismIncluded])
    {
      if (![(BMMomentsEventDataEvent *)self hasCallLikeMechanismIncluded]) {
        goto LABEL_236;
      }
      if (![v5 hasCallLikeMechanismIncluded]) {
        goto LABEL_236;
      }
      int v94 = [(BMMomentsEventDataEvent *)self callLikeMechanismIncluded];
      if (v94 != [v5 callLikeMechanismIncluded]) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasNumTextLikeInteractions]
      || [v5 hasNumTextLikeInteractions])
    {
      if (![(BMMomentsEventDataEvent *)self hasNumTextLikeInteractions]) {
        goto LABEL_236;
      }
      if (![v5 hasNumTextLikeInteractions]) {
        goto LABEL_236;
      }
      int v95 = [(BMMomentsEventDataEvent *)self numTextLikeInteractions];
      if (v95 != [v5 numTextLikeInteractions]) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasNumAudioLikeInteractions]
      || [v5 hasNumAudioLikeInteractions])
    {
      if (![(BMMomentsEventDataEvent *)self hasNumAudioLikeInteractions]) {
        goto LABEL_236;
      }
      if (![v5 hasNumAudioLikeInteractions]) {
        goto LABEL_236;
      }
      int v96 = [(BMMomentsEventDataEvent *)self numAudioLikeInteractions];
      if (v96 != [v5 numAudioLikeInteractions]) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasNumVideoLikeInteractions]
      || [v5 hasNumVideoLikeInteractions])
    {
      if (![(BMMomentsEventDataEvent *)self hasNumVideoLikeInteractions]) {
        goto LABEL_236;
      }
      if (![v5 hasNumVideoLikeInteractions]) {
        goto LABEL_236;
      }
      int v97 = [(BMMomentsEventDataEvent *)self numVideoLikeInteractions];
      if (v97 != [v5 numVideoLikeInteractions]) {
        goto LABEL_236;
      }
    }
    if (-[BMMomentsEventDataEvent hasTotalDurationOfCallLikeInteractions](self, "hasTotalDurationOfCallLikeInteractions")|| [v5 hasTotalDurationOfCallLikeInteractions])
    {
      if (![(BMMomentsEventDataEvent *)self hasTotalDurationOfCallLikeInteractions])goto LABEL_236; {
      if (![v5 hasTotalDurationOfCallLikeInteractions])
      }
        goto LABEL_236;
      [(BMMomentsEventDataEvent *)self totalDurationOfCallLikeInteractions];
      double v99 = v98;
      [v5 totalDurationOfCallLikeInteractions];
      if (v99 != v100) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasMinDurationOfCallLikeInteractions]
      || [v5 hasMinDurationOfCallLikeInteractions])
    {
      if (![(BMMomentsEventDataEvent *)self hasMinDurationOfCallLikeInteractions])goto LABEL_236; {
      if (![v5 hasMinDurationOfCallLikeInteractions])
      }
        goto LABEL_236;
      [(BMMomentsEventDataEvent *)self minDurationOfCallLikeInteractions];
      double v102 = v101;
      [v5 minDurationOfCallLikeInteractions];
      if (v102 != v103) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasMaxDurationOfCallLikeInteractions]
      || [v5 hasMaxDurationOfCallLikeInteractions])
    {
      if (![(BMMomentsEventDataEvent *)self hasMaxDurationOfCallLikeInteractions])goto LABEL_236; {
      if (![v5 hasMaxDurationOfCallLikeInteractions])
      }
        goto LABEL_236;
      [(BMMomentsEventDataEvent *)self maxDurationOfCallLikeInteractions];
      double v105 = v104;
      [v5 maxDurationOfCallLikeInteractions];
      if (v105 != v106) {
        goto LABEL_236;
      }
    }
    int v107 = [(BMMomentsEventDataEvent *)self photoMomentSource];
    if (v107 != [v5 photoMomentSource]) {
      goto LABEL_236;
    }
    v108 = [(BMMomentsEventDataEvent *)self photoMomentInferences];
    uint64_t v109 = [v5 photoMomentInferences];
    if (v108 == (void *)v109)
    {
    }
    else
    {
      v110 = (void *)v109;
      v111 = [(BMMomentsEventDataEvent *)self photoMomentInferences];
      v112 = [v5 photoMomentInferences];
      int v113 = [v111 isEqual:v112];

      if (!v113) {
        goto LABEL_236;
      }
    }
    v114 = [(BMMomentsEventDataEvent *)self photoMomentHolidays];
    uint64_t v115 = [v5 photoMomentHolidays];
    if (v114 == (void *)v115)
    {
    }
    else
    {
      v116 = (void *)v115;
      v117 = [(BMMomentsEventDataEvent *)self photoMomentHolidays];
      v118 = [v5 photoMomentHolidays];
      int v119 = [v117 isEqual:v118];

      if (!v119) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasNumPhotoMomentHolidays]
      || [v5 hasNumPhotoMomentHolidays])
    {
      if (![(BMMomentsEventDataEvent *)self hasNumPhotoMomentHolidays]) {
        goto LABEL_236;
      }
      if (![v5 hasNumPhotoMomentHolidays]) {
        goto LABEL_236;
      }
      int v120 = [(BMMomentsEventDataEvent *)self numPhotoMomentHolidays];
      if (v120 != [v5 numPhotoMomentHolidays]) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasNumPhotoMomentInferences]
      || [v5 hasNumPhotoMomentInferences])
    {
      if (![(BMMomentsEventDataEvent *)self hasNumPhotoMomentInferences]) {
        goto LABEL_236;
      }
      if (![v5 hasNumPhotoMomentInferences]) {
        goto LABEL_236;
      }
      int v121 = [(BMMomentsEventDataEvent *)self numPhotoMomentInferences];
      if (v121 != [v5 numPhotoMomentInferences]) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasNumPhotoMomentPublicEvents]
      || [v5 hasNumPhotoMomentPublicEvents])
    {
      if (![(BMMomentsEventDataEvent *)self hasNumPhotoMomentPublicEvents]) {
        goto LABEL_236;
      }
      if (![v5 hasNumPhotoMomentPublicEvents]) {
        goto LABEL_236;
      }
      int v122 = [(BMMomentsEventDataEvent *)self numPhotoMomentPublicEvents];
      if (v122 != [v5 numPhotoMomentPublicEvents]) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasNumPhotoMomentPersons]
      || [v5 hasNumPhotoMomentPersons])
    {
      if (![(BMMomentsEventDataEvent *)self hasNumPhotoMomentPersons]) {
        goto LABEL_236;
      }
      if (![v5 hasNumPhotoMomentPersons]) {
        goto LABEL_236;
      }
      int v123 = [(BMMomentsEventDataEvent *)self numPhotoMomentPersons];
      if (v123 != [v5 numPhotoMomentPersons]) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasIsFamilyInPhotoMoment]
      || [v5 hasIsFamilyInPhotoMoment])
    {
      if (![(BMMomentsEventDataEvent *)self hasIsFamilyInPhotoMoment]) {
        goto LABEL_236;
      }
      if (![v5 hasIsFamilyInPhotoMoment]) {
        goto LABEL_236;
      }
      int v124 = [(BMMomentsEventDataEvent *)self isFamilyInPhotoMoment];
      if (v124 != [v5 isFamilyInPhotoMoment]) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasMomentIncludesFavoritedAsset]
      || [v5 hasMomentIncludesFavoritedAsset])
    {
      if (![(BMMomentsEventDataEvent *)self hasMomentIncludesFavoritedAsset]) {
        goto LABEL_236;
      }
      if (![v5 hasMomentIncludesFavoritedAsset]) {
        goto LABEL_236;
      }
      int v125 = [(BMMomentsEventDataEvent *)self momentIncludesFavoritedAsset];
      if (v125 != [v5 momentIncludesFavoritedAsset]) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasMomentIncludesVideo]
      || [v5 hasMomentIncludesVideo])
    {
      if (![(BMMomentsEventDataEvent *)self hasMomentIncludesVideo]) {
        goto LABEL_236;
      }
      if (![v5 hasMomentIncludesVideo]) {
        goto LABEL_236;
      }
      int v126 = [(BMMomentsEventDataEvent *)self momentIncludesVideo];
      if (v126 != [v5 momentIncludesVideo]) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasMomentIncludesPhoto]
      || [v5 hasMomentIncludesPhoto])
    {
      if (![(BMMomentsEventDataEvent *)self hasMomentIncludesPhoto]) {
        goto LABEL_236;
      }
      if (![v5 hasMomentIncludesPhoto]) {
        goto LABEL_236;
      }
      int v127 = [(BMMomentsEventDataEvent *)self momentIncludesPhoto];
      if (v127 != [v5 momentIncludesPhoto]) {
        goto LABEL_236;
      }
    }
    int v128 = [(BMMomentsEventDataEvent *)self suggestedEventCategory];
    if (v128 != [v5 suggestedEventCategory]) {
      goto LABEL_236;
    }
    if ([(BMMomentsEventDataEvent *)self hasNumAttendees]
      || [v5 hasNumAttendees])
    {
      if (![(BMMomentsEventDataEvent *)self hasNumAttendees]) {
        goto LABEL_236;
      }
      if (![v5 hasNumAttendees]) {
        goto LABEL_236;
      }
      int v129 = [(BMMomentsEventDataEvent *)self numAttendees];
      if (v129 != [v5 numAttendees]) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasNumtripParts]
      || [v5 hasNumtripParts])
    {
      if (![(BMMomentsEventDataEvent *)self hasNumtripParts]) {
        goto LABEL_236;
      }
      if (![v5 hasNumtripParts]) {
        goto LABEL_236;
      }
      int v130 = [(BMMomentsEventDataEvent *)self numtripParts];
      if (v130 != [v5 numtripParts]) {
        goto LABEL_236;
      }
    }
    int v131 = [(BMMomentsEventDataEvent *)self tripMode];
    if (v131 != [v5 tripMode]) {
      goto LABEL_236;
    }
    if ([(BMMomentsEventDataEvent *)self hasNumScoredTopics]
      || [v5 hasNumScoredTopics])
    {
      if (![(BMMomentsEventDataEvent *)self hasNumScoredTopics]) {
        goto LABEL_236;
      }
      if (![v5 hasNumScoredTopics]) {
        goto LABEL_236;
      }
      int v132 = [(BMMomentsEventDataEvent *)self numScoredTopics];
      if (v132 != [v5 numScoredTopics]) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasNumItemAuthors]
      || [v5 hasNumItemAuthors])
    {
      if (![(BMMomentsEventDataEvent *)self hasNumItemAuthors]) {
        goto LABEL_236;
      }
      if (![v5 hasNumItemAuthors]) {
        goto LABEL_236;
      }
      int v133 = [(BMMomentsEventDataEvent *)self numItemAuthors];
      if (v133 != [v5 numItemAuthors]) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasNumItemRecipients]
      || [v5 hasNumItemRecipients])
    {
      if (![(BMMomentsEventDataEvent *)self hasNumItemRecipients]) {
        goto LABEL_236;
      }
      if (![v5 hasNumItemRecipients]) {
        goto LABEL_236;
      }
      int v134 = [(BMMomentsEventDataEvent *)self numItemRecipients];
      if (v134 != [v5 numItemRecipients]) {
        goto LABEL_236;
      }
    }
    if ([(BMMomentsEventDataEvent *)self hasIsGatheringComplete]
      || [v5 hasIsGatheringComplete])
    {
      if (![(BMMomentsEventDataEvent *)self hasIsGatheringComplete]) {
        goto LABEL_236;
      }
      if (![v5 hasIsGatheringComplete]) {
        goto LABEL_236;
      }
      int v135 = [(BMMomentsEventDataEvent *)self isGatheringComplete];
      if (v135 != [v5 isGatheringComplete]) {
        goto LABEL_236;
      }
    }
    v136 = [(BMMomentsEventDataEvent *)self gaPR];
    uint64_t v137 = [v5 gaPR];
    if (v136 == (void *)v137)
    {
    }
    else
    {
      v138 = (void *)v137;
      v139 = [(BMMomentsEventDataEvent *)self gaPR];
      v140 = [v5 gaPR];
      int v141 = [v139 isEqual:v140];

      if (!v141) {
        goto LABEL_236;
      }
    }
    if (!-[BMMomentsEventDataEvent hasPCount](self, "hasPCount") && ![v5 hasPCount]
      || [(BMMomentsEventDataEvent *)self hasPCount]
      && [v5 hasPCount]
      && (int v142 = -[BMMomentsEventDataEvent pCount](self, "pCount"), v142 == [v5 pCount]))
    {
      int v143 = [(BMMomentsEventDataEvent *)self mapItemSource];
      if (v143 == [v5 mapItemSource])
      {
        int v144 = [(BMMomentsEventDataEvent *)self placeType];
        if (v144 == [v5 placeType])
        {
          int v145 = [(BMMomentsEventDataEvent *)self placeLabelGranularity];
          BOOL v12 = v145 == [v5 placeLabelGranularity];
LABEL_237:

          goto LABEL_238;
        }
      }
    }
LABEL_236:
    BOOL v12 = 0;
    goto LABEL_237;
  }
  BOOL v12 = 0;
LABEL_238:

  return v12;
}

- (NSDate)expirationDate
{
  if (self->_hasRaw_expirationDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_expirationDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)sourceCreationDate
{
  if (self->_hasRaw_sourceCreationDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_sourceCreationDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)creationDate
{
  if (self->_hasRaw_creationDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_creationDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)endDate
{
  if (self->_hasRaw_endDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_endDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)startDate
{
  if (self->_hasRaw_startDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_startDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v227[62] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMMomentsEventDataEvent *)self eventIdentifier];
  id v4 = [(BMMomentsEventDataEvent *)self startDate];
  if (v4)
  {
    id v5 = NSNumber;
    v6 = [(BMMomentsEventDataEvent *)self startDate];
    [v6 timeIntervalSince1970];
    objc_msgSend(v5, "numberWithDouble:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }

  v8 = [(BMMomentsEventDataEvent *)self endDate];
  if (v8)
  {
    v9 = NSNumber;
    v10 = [(BMMomentsEventDataEvent *)self endDate];
    [v10 timeIntervalSince1970];
    objc_msgSend(v9, "numberWithDouble:");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  BOOL v12 = [(BMMomentsEventDataEvent *)self creationDate];
  if (v12)
  {
    v13 = NSNumber;
    uint64_t v14 = [(BMMomentsEventDataEvent *)self creationDate];
    [v14 timeIntervalSince1970];
    objc_msgSend(v13, "numberWithDouble:");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = 0;
  }

  v16 = [(BMMomentsEventDataEvent *)self sourceCreationDate];
  if (v16)
  {
    v17 = NSNumber;
    int v18 = [(BMMomentsEventDataEvent *)self sourceCreationDate];
    [v18 timeIntervalSince1970];
    objc_msgSend(v17, "numberWithDouble:");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v19 = 0;
  }

  uint64_t v20 = [(BMMomentsEventDataEvent *)self expirationDate];
  if (v20)
  {
    v21 = NSNumber;
    v22 = [(BMMomentsEventDataEvent *)self expirationDate];
    [v22 timeIntervalSince1970];
    objc_msgSend(v21, "numberWithDouble:");
    id v171 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v171 = 0;
  }

  uint64_t v23 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent provider](self, "provider"));
  v225 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent category](self, "category"));
  v224 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent placeUserType](self, "placeUserType"));
  v223 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent poiCategory](self, "poiCategory"));
  v222 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent placeDiscovery](self, "placeDiscovery"));
  v221 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent locationMode](self, "locationMode"));
  v220 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent workoutType](self, "workoutType"));
  v219 = [(BMMomentsEventDataEvent *)self workoutBundleID];
  v218 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent mediaGenre](self, "mediaGenre"));
  v217 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent mediaType](self, "mediaType"));
  if ([(BMMomentsEventDataEvent *)self hasMediaRepetitions])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent mediaRepetitions](self, "mediaRepetitions"));
    id v216 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v216 = 0;
  }
  if ([(BMMomentsEventDataEvent *)self hasMediaSumTimePlayed])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent mediaSumTimePlayed](self, "mediaSumTimePlayed"));
    id v215 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v215 = 0;
  }
  v214 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent sourceParty](self, "sourceParty"));
  v213 = [(BMMomentsEventDataEvent *)self mediaPlayerBundleID];
  if ([(BMMomentsEventDataEvent *)self hasNumAudioMediaPlaySessionsPerDay])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numAudioMediaPlaySessionsPerDay](self, "numAudioMediaPlaySessionsPerDay"));
    id v212 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v212 = 0;
  }
  if (![(BMMomentsEventDataEvent *)self hasDurationAudioMediaPlaySessionsPerDay]|| ([(BMMomentsEventDataEvent *)self durationAudioMediaPlaySessionsPerDay], fabs(v24) == INFINITY))
  {
    id v211 = 0;
  }
  else
  {
    [(BMMomentsEventDataEvent *)self durationAudioMediaPlaySessionsPerDay];
    v25 = NSNumber;
    [(BMMomentsEventDataEvent *)self durationAudioMediaPlaySessionsPerDay];
    objc_msgSend(v25, "numberWithDouble:");
    id v211 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMMomentsEventDataEvent *)self hasNumVideoMediaPlaySessionsPerDay])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numVideoMediaPlaySessionsPerDay](self, "numVideoMediaPlaySessionsPerDay"));
    id v210 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v210 = 0;
  }
  if (![(BMMomentsEventDataEvent *)self hasDurationVideoMediaPlaySessionsPerDay]|| ([(BMMomentsEventDataEvent *)self durationVideoMediaPlaySessionsPerDay], fabs(v26) == INFINITY))
  {
    id v209 = 0;
  }
  else
  {
    [(BMMomentsEventDataEvent *)self durationVideoMediaPlaySessionsPerDay];
    v27 = NSNumber;
    [(BMMomentsEventDataEvent *)self durationVideoMediaPlaySessionsPerDay];
    objc_msgSend(v27, "numberWithDouble:");
    id v209 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMMomentsEventDataEvent *)self hasNumFirstPartyMediaPlaySessionsPerDay])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numFirstPartyMediaPlaySessionsPerDay](self, "numFirstPartyMediaPlaySessionsPerDay"));
    id v208 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v208 = 0;
  }
  if ([(BMMomentsEventDataEvent *)self hasNumThirdPartyMediaPlaySessionsPerDay])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numThirdPartyMediaPlaySessionsPerDay](self, "numThirdPartyMediaPlaySessionsPerDay"));
    id v207 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v207 = 0;
  }
  if ([(BMMomentsEventDataEvent *)self hasNumContacts])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numContacts](self, "numContacts"));
    id v206 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v206 = 0;
  }
  v205 = [(BMMomentsEventDataEvent *)self _contactIDsInConversationJSONArray];
  v204 = [(BMMomentsEventDataEvent *)self contactIDMostSignificantInConversation];
  if (![(BMMomentsEventDataEvent *)self hasInteractionContactScore]
    || ([(BMMomentsEventDataEvent *)self interactionContactScore], fabs(v28) == INFINITY))
  {
    id v203 = 0;
  }
  else
  {
    [(BMMomentsEventDataEvent *)self interactionContactScore];
    v29 = NSNumber;
    [(BMMomentsEventDataEvent *)self interactionContactScore];
    objc_msgSend(v29, "numberWithDouble:");
    id v203 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMMomentsEventDataEvent *)self hasTextLikeMechanismIncluded])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEvent textLikeMechanismIncluded](self, "textLikeMechanismIncluded"));
    id v202 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v202 = 0;
  }
  if ([(BMMomentsEventDataEvent *)self hasCallLikeMechanismIncluded])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEvent callLikeMechanismIncluded](self, "callLikeMechanismIncluded"));
    id v201 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v201 = 0;
  }
  if ([(BMMomentsEventDataEvent *)self hasNumTextLikeInteractions])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numTextLikeInteractions](self, "numTextLikeInteractions"));
    id v200 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v200 = 0;
  }
  if ([(BMMomentsEventDataEvent *)self hasNumAudioLikeInteractions])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numAudioLikeInteractions](self, "numAudioLikeInteractions"));
    id v199 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v199 = 0;
  }
  if ([(BMMomentsEventDataEvent *)self hasNumVideoLikeInteractions])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numVideoLikeInteractions](self, "numVideoLikeInteractions"));
    id v198 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v198 = 0;
  }
  if (![(BMMomentsEventDataEvent *)self hasTotalDurationOfCallLikeInteractions]|| ([(BMMomentsEventDataEvent *)self totalDurationOfCallLikeInteractions], fabs(v30) == INFINITY))
  {
    id v197 = 0;
  }
  else
  {
    [(BMMomentsEventDataEvent *)self totalDurationOfCallLikeInteractions];
    v31 = NSNumber;
    [(BMMomentsEventDataEvent *)self totalDurationOfCallLikeInteractions];
    objc_msgSend(v31, "numberWithDouble:");
    id v197 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEvent *)self hasMinDurationOfCallLikeInteractions]
    || ([(BMMomentsEventDataEvent *)self minDurationOfCallLikeInteractions],
        fabs(v32) == INFINITY))
  {
    id v196 = 0;
  }
  else
  {
    [(BMMomentsEventDataEvent *)self minDurationOfCallLikeInteractions];
    v33 = NSNumber;
    [(BMMomentsEventDataEvent *)self minDurationOfCallLikeInteractions];
    objc_msgSend(v33, "numberWithDouble:");
    id v196 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEvent *)self hasMaxDurationOfCallLikeInteractions]
    || ([(BMMomentsEventDataEvent *)self maxDurationOfCallLikeInteractions],
        fabs(v34) == INFINITY))
  {
    id v195 = 0;
  }
  else
  {
    [(BMMomentsEventDataEvent *)self maxDurationOfCallLikeInteractions];
    v35 = NSNumber;
    [(BMMomentsEventDataEvent *)self maxDurationOfCallLikeInteractions];
    objc_msgSend(v35, "numberWithDouble:");
    id v195 = (id)objc_claimAutoreleasedReturnValue();
  }
  v194 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent photoMomentSource](self, "photoMomentSource"));
  v193 = [(BMMomentsEventDataEvent *)self _photoMomentInferencesJSONArray];
  v192 = [(BMMomentsEventDataEvent *)self _photoMomentHolidaysJSONArray];
  if ([(BMMomentsEventDataEvent *)self hasNumPhotoMomentHolidays])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numPhotoMomentHolidays](self, "numPhotoMomentHolidays"));
    id v191 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v191 = 0;
  }
  if ([(BMMomentsEventDataEvent *)self hasNumPhotoMomentInferences])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numPhotoMomentInferences](self, "numPhotoMomentInferences"));
    id v190 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v190 = 0;
  }
  if ([(BMMomentsEventDataEvent *)self hasNumPhotoMomentPublicEvents])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numPhotoMomentPublicEvents](self, "numPhotoMomentPublicEvents"));
    id v189 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v189 = 0;
  }
  if ([(BMMomentsEventDataEvent *)self hasNumPhotoMomentPersons])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numPhotoMomentPersons](self, "numPhotoMomentPersons"));
    id v188 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v188 = 0;
  }
  if ([(BMMomentsEventDataEvent *)self hasIsFamilyInPhotoMoment])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEvent isFamilyInPhotoMoment](self, "isFamilyInPhotoMoment"));
    id v187 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v187 = 0;
  }
  if ([(BMMomentsEventDataEvent *)self hasMomentIncludesFavoritedAsset])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEvent momentIncludesFavoritedAsset](self, "momentIncludesFavoritedAsset"));
    id v186 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v186 = 0;
  }
  if ([(BMMomentsEventDataEvent *)self hasMomentIncludesVideo])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEvent momentIncludesVideo](self, "momentIncludesVideo"));
    id v185 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v185 = 0;
  }
  if ([(BMMomentsEventDataEvent *)self hasMomentIncludesPhoto])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEvent momentIncludesPhoto](self, "momentIncludesPhoto"));
    id v184 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v184 = 0;
  }
  v183 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent suggestedEventCategory](self, "suggestedEventCategory"));
  if ([(BMMomentsEventDataEvent *)self hasNumAttendees])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numAttendees](self, "numAttendees"));
    id v182 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v182 = 0;
  }
  if ([(BMMomentsEventDataEvent *)self hasNumtripParts])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numtripParts](self, "numtripParts"));
    id v181 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v181 = 0;
  }
  v180 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent tripMode](self, "tripMode"));
  if ([(BMMomentsEventDataEvent *)self hasNumScoredTopics])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numScoredTopics](self, "numScoredTopics"));
    id v179 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v179 = 0;
  }
  if ([(BMMomentsEventDataEvent *)self hasNumItemAuthors])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numItemAuthors](self, "numItemAuthors"));
    id v178 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v178 = 0;
  }
  if ([(BMMomentsEventDataEvent *)self hasNumItemRecipients])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numItemRecipients](self, "numItemRecipients"));
    id v177 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v177 = 0;
  }
  if ([(BMMomentsEventDataEvent *)self hasIsGatheringComplete])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEvent isGatheringComplete](self, "isGatheringComplete"));
    id v176 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v176 = 0;
  }
  int v36 = [(BMMomentsEventDataEvent *)self gaPR];
  v175 = [v36 jsonDictionary];

  if ([(BMMomentsEventDataEvent *)self hasPCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent pCount](self, "pCount"));
    id v174 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v174 = 0;
  }
  v173 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent mapItemSource](self, "mapItemSource"));
  v172 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent placeType](self, "placeType"));
  v170 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent placeLabelGranularity](self, "placeLabelGranularity"));
  v226[0] = @"eventIdentifier";
  uint64_t v37 = v3;
  if (!v3)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  }
  v163 = (void *)v37;
  v227[0] = v37;
  v226[1] = @"startDate";
  uint64_t v38 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v162 = (void *)v38;
  v227[1] = v38;
  v226[2] = @"endDate";
  uint64_t v39 = (uint64_t)v11;
  if (!v11)
  {
    uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v161 = (void *)v39;
  v227[2] = v39;
  v226[3] = @"creationDate";
  uint64_t v40 = (uint64_t)v15;
  if (!v15)
  {
    uint64_t v40 = [MEMORY[0x1E4F1CA98] null];
  }
  v160 = (void *)v40;
  v227[3] = v40;
  v226[4] = @"sourceCreationDate";
  uint64_t v41 = (uint64_t)v19;
  if (!v19)
  {
    uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
  }
  v159 = (void *)v41;
  v227[4] = v41;
  v226[5] = @"expirationDate";
  uint64_t v42 = (uint64_t)v171;
  if (!v171)
  {
    uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
  }
  v158 = (void *)v42;
  v227[5] = v42;
  v226[6] = @"provider";
  uint64_t v43 = v23;
  if (!v23)
  {
    uint64_t v43 = [MEMORY[0x1E4F1CA98] null];
  }
  v157 = (void *)v43;
  v227[6] = v43;
  v226[7] = @"category";
  uint64_t v44 = (uint64_t)v225;
  if (!v225)
  {
    uint64_t v44 = [MEMORY[0x1E4F1CA98] null];
  }
  id v45 = v19;
  v227[7] = v44;
  v226[8] = @"placeUserType";
  uint64_t v46 = (uint64_t)v224;
  if (!v224)
  {
    uint64_t v46 = [MEMORY[0x1E4F1CA98] null];
  }
  id v47 = v11;
  v227[8] = v46;
  v226[9] = @"poiCategory";
  uint64_t v48 = (uint64_t)v223;
  if (!v223)
  {
    uint64_t v48 = [MEMORY[0x1E4F1CA98] null];
  }
  id v49 = v15;
  v227[9] = v48;
  v226[10] = @"placeDiscovery";
  uint64_t v50 = (uint64_t)v222;
  if (!v222)
  {
    uint64_t v50 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v51 = v7;
  v166 = (void *)v50;
  v227[10] = v50;
  v226[11] = @"locationMode";
  uint64_t v52 = (uint64_t)v221;
  if (!v221)
  {
    uint64_t v52 = [MEMORY[0x1E4F1CA98] null];
  }
  v53 = (void *)v23;
  v165 = (void *)v52;
  v227[11] = v52;
  v226[12] = @"workoutType";
  uint64_t v54 = (uint64_t)v220;
  if (!v220)
  {
    uint64_t v54 = [MEMORY[0x1E4F1CA98] null];
  }
  int v55 = (void *)v3;
  v153 = (void *)v54;
  v227[12] = v54;
  v226[13] = @"workoutBundleID";
  uint64_t v56 = (uint64_t)v219;
  if (!v219)
  {
    uint64_t v56 = [MEMORY[0x1E4F1CA98] null];
  }
  int v57 = (void *)v56;
  v227[13] = v56;
  v226[14] = @"mediaGenre";
  uint64_t v58 = (uint64_t)v218;
  if (!v218)
  {
    uint64_t v58 = [MEMORY[0x1E4F1CA98] null];
  }
  v152 = (void *)v58;
  v227[14] = v58;
  v226[15] = @"mediaType";
  uint64_t v59 = (uint64_t)v217;
  if (!v217)
  {
    uint64_t v59 = [MEMORY[0x1E4F1CA98] null];
  }
  v151 = (void *)v59;
  v227[15] = v59;
  v226[16] = @"mediaRepetitions";
  uint64_t v60 = (uint64_t)v216;
  if (!v216)
  {
    uint64_t v60 = [MEMORY[0x1E4F1CA98] null];
  }
  v150 = (void *)v60;
  v227[16] = v60;
  v226[17] = @"mediaSumTimePlayed";
  uint64_t v61 = (uint64_t)v215;
  if (!v215)
  {
    uint64_t v61 = [MEMORY[0x1E4F1CA98] null];
  }
  v149 = (void *)v61;
  v227[17] = v61;
  v226[18] = @"sourceParty";
  uint64_t v62 = (uint64_t)v214;
  if (!v214)
  {
    uint64_t v62 = [MEMORY[0x1E4F1CA98] null];
  }
  v148 = (void *)v62;
  v227[18] = v62;
  v226[19] = @"mediaPlayerBundleID";
  uint64_t v63 = (uint64_t)v213;
  if (!v213)
  {
    uint64_t v63 = [MEMORY[0x1E4F1CA98] null];
  }
  v147 = (void *)v63;
  v227[19] = v63;
  v226[20] = @"numAudioMediaPlaySessionsPerDay";
  uint64_t v64 = (uint64_t)v212;
  if (!v212)
  {
    uint64_t v64 = [MEMORY[0x1E4F1CA98] null];
  }
  v146 = (void *)v64;
  v227[20] = v64;
  v226[21] = @"durationAudioMediaPlaySessionsPerDay";
  uint64_t v65 = (uint64_t)v211;
  if (!v211)
  {
    uint64_t v65 = [MEMORY[0x1E4F1CA98] null];
  }
  int v145 = (void *)v65;
  v227[21] = v65;
  v226[22] = @"numVideoMediaPlaySessionsPerDay";
  uint64_t v66 = (uint64_t)v210;
  if (!v210)
  {
    uint64_t v66 = [MEMORY[0x1E4F1CA98] null];
  }
  int v144 = (void *)v66;
  v227[22] = v66;
  v226[23] = @"durationVideoMediaPlaySessionsPerDay";
  uint64_t v67 = (uint64_t)v209;
  if (!v209)
  {
    uint64_t v67 = [MEMORY[0x1E4F1CA98] null];
  }
  int v143 = (void *)v67;
  v227[23] = v67;
  v226[24] = @"numFirstPartyMediaPlaySessionsPerDay";
  uint64_t v68 = (uint64_t)v208;
  if (!v208)
  {
    uint64_t v68 = [MEMORY[0x1E4F1CA98] null];
  }
  int v142 = (void *)v68;
  v227[24] = v68;
  v226[25] = @"numThirdPartyMediaPlaySessionsPerDay";
  uint64_t v69 = (uint64_t)v207;
  if (!v207)
  {
    uint64_t v69 = [MEMORY[0x1E4F1CA98] null];
  }
  int v141 = (void *)v69;
  v227[25] = v69;
  v226[26] = @"numContacts";
  uint64_t v70 = (uint64_t)v206;
  if (!v206)
  {
    uint64_t v70 = [MEMORY[0x1E4F1CA98] null];
  }
  v140 = (void *)v70;
  v227[26] = v70;
  v226[27] = @"contactIDsInConversation";
  uint64_t v71 = (uint64_t)v205;
  if (!v205)
  {
    uint64_t v71 = [MEMORY[0x1E4F1CA98] null];
  }
  v139 = (void *)v71;
  v227[27] = v71;
  v226[28] = @"contactIDMostSignificantInConversation";
  uint64_t v72 = (uint64_t)v204;
  if (!v204)
  {
    uint64_t v72 = [MEMORY[0x1E4F1CA98] null];
  }
  v138 = (void *)v72;
  v227[28] = v72;
  v226[29] = @"interactionContactScore";
  uint64_t v73 = (uint64_t)v203;
  if (!v203)
  {
    uint64_t v73 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v137 = (void *)v73;
  v227[29] = v73;
  v226[30] = @"textLikeMechanismIncluded";
  uint64_t v74 = (uint64_t)v202;
  if (!v202)
  {
    uint64_t v74 = [MEMORY[0x1E4F1CA98] null];
  }
  v136 = (void *)v74;
  v227[30] = v74;
  v226[31] = @"callLikeMechanismIncluded";
  uint64_t v75 = (uint64_t)v201;
  if (!v201)
  {
    uint64_t v75 = [MEMORY[0x1E4F1CA98] null];
  }
  int v135 = (void *)v75;
  v227[31] = v75;
  v226[32] = @"numTextLikeInteractions";
  uint64_t v76 = (uint64_t)v200;
  if (!v200)
  {
    uint64_t v76 = [MEMORY[0x1E4F1CA98] null];
  }
  int v134 = (void *)v76;
  v227[32] = v76;
  v226[33] = @"numAudioLikeInteractions";
  uint64_t v77 = (uint64_t)v199;
  if (!v199)
  {
    uint64_t v77 = [MEMORY[0x1E4F1CA98] null];
  }
  int v133 = (void *)v77;
  v227[33] = v77;
  v226[34] = @"numVideoLikeInteractions";
  uint64_t v78 = (uint64_t)v198;
  if (!v198)
  {
    uint64_t v78 = [MEMORY[0x1E4F1CA98] null];
  }
  int v132 = (void *)v78;
  v227[34] = v78;
  v226[35] = @"totalDurationOfCallLikeInteractions";
  uint64_t v79 = (uint64_t)v197;
  if (!v197)
  {
    uint64_t v79 = [MEMORY[0x1E4F1CA98] null];
  }
  int v131 = (void *)v79;
  v227[35] = v79;
  v226[36] = @"minDurationOfCallLikeInteractions";
  uint64_t v80 = (uint64_t)v196;
  if (!v196)
  {
    uint64_t v80 = [MEMORY[0x1E4F1CA98] null];
  }
  int v130 = (void *)v80;
  v227[36] = v80;
  v226[37] = @"maxDurationOfCallLikeInteractions";
  uint64_t v81 = (uint64_t)v195;
  if (!v195)
  {
    uint64_t v81 = [MEMORY[0x1E4F1CA98] null];
  }
  int v129 = (void *)v81;
  v227[37] = v81;
  v226[38] = @"photoMomentSource";
  uint64_t v82 = (uint64_t)v194;
  if (!v194)
  {
    uint64_t v82 = [MEMORY[0x1E4F1CA98] null];
  }
  int v128 = (void *)v82;
  v227[38] = v82;
  v226[39] = @"photoMomentInferences";
  uint64_t v83 = (uint64_t)v193;
  if (!v193)
  {
    uint64_t v83 = [MEMORY[0x1E4F1CA98] null];
  }
  int v127 = (void *)v83;
  v227[39] = v83;
  v226[40] = @"photoMomentHolidays";
  uint64_t v84 = (uint64_t)v192;
  if (!v192)
  {
    uint64_t v84 = [MEMORY[0x1E4F1CA98] null];
  }
  int v126 = (void *)v84;
  v227[40] = v84;
  v226[41] = @"numPhotoMomentHolidays";
  uint64_t v85 = (uint64_t)v191;
  if (!v191)
  {
    uint64_t v85 = [MEMORY[0x1E4F1CA98] null];
  }
  int v125 = (void *)v85;
  v227[41] = v85;
  v226[42] = @"numPhotoMomentInferences";
  uint64_t v86 = (uint64_t)v190;
  if (!v190)
  {
    uint64_t v86 = [MEMORY[0x1E4F1CA98] null];
  }
  int v124 = (void *)v86;
  v227[42] = v86;
  v226[43] = @"numPhotoMomentPublicEvents";
  uint64_t v87 = (uint64_t)v189;
  if (!v189)
  {
    uint64_t v87 = [MEMORY[0x1E4F1CA98] null];
  }
  int v123 = (void *)v87;
  v227[43] = v87;
  v226[44] = @"numPhotoMomentPersons";
  uint64_t v88 = (uint64_t)v188;
  if (!v188)
  {
    uint64_t v88 = [MEMORY[0x1E4F1CA98] null];
  }
  int v122 = (void *)v88;
  v227[44] = v88;
  v226[45] = @"isFamilyInPhotoMoment";
  uint64_t v89 = (uint64_t)v187;
  if (!v187)
  {
    uint64_t v89 = [MEMORY[0x1E4F1CA98] null];
  }
  int v121 = (void *)v89;
  v227[45] = v89;
  v226[46] = @"momentIncludesFavoritedAsset";
  uint64_t v90 = (uint64_t)v186;
  if (!v186)
  {
    uint64_t v90 = [MEMORY[0x1E4F1CA98] null];
  }
  int v120 = (void *)v90;
  v227[46] = v90;
  v226[47] = @"momentIncludesVideo";
  uint64_t v91 = (uint64_t)v185;
  if (!v185)
  {
    uint64_t v91 = [MEMORY[0x1E4F1CA98] null];
  }
  int v119 = (void *)v91;
  v227[47] = v91;
  v226[48] = @"momentIncludesPhoto";
  uint64_t v92 = (uint64_t)v184;
  if (!v184)
  {
    uint64_t v92 = [MEMORY[0x1E4F1CA98] null];
  }
  v118 = (void *)v92;
  v227[48] = v92;
  v226[49] = @"suggestedEventCategory";
  uint64_t v93 = (uint64_t)v183;
  if (!v183)
  {
    uint64_t v93 = [MEMORY[0x1E4F1CA98] null];
  }
  v117 = (void *)v93;
  v227[49] = v93;
  v226[50] = @"numAttendees";
  uint64_t v94 = (uint64_t)v182;
  if (!v182)
  {
    uint64_t v94 = [MEMORY[0x1E4F1CA98] null];
  }
  v116 = (void *)v94;
  v227[50] = v94;
  v226[51] = @"numtripParts";
  uint64_t v95 = (uint64_t)v181;
  if (!v181)
  {
    uint64_t v95 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v115 = (void *)v95;
  v227[51] = v95;
  v226[52] = @"tripMode";
  uint64_t v96 = (uint64_t)v180;
  if (!v180)
  {
    uint64_t v96 = [MEMORY[0x1E4F1CA98] null];
  }
  v114 = (void *)v96;
  v227[52] = v96;
  v226[53] = @"numScoredTopics";
  uint64_t v97 = (uint64_t)v179;
  if (!v179)
  {
    uint64_t v97 = [MEMORY[0x1E4F1CA98] null];
  }
  v169 = v55;
  int v113 = (void *)v97;
  v227[53] = v97;
  v226[54] = @"numItemAuthors";
  uint64_t v98 = (uint64_t)v178;
  if (!v178)
  {
    uint64_t v98 = [MEMORY[0x1E4F1CA98] null];
  }
  v155 = (void *)v46;
  v112 = (void *)v98;
  v227[54] = v98;
  v226[55] = @"numItemRecipients";
  uint64_t v99 = (uint64_t)v177;
  if (!v177)
  {
    uint64_t v99 = [MEMORY[0x1E4F1CA98] null];
  }
  v168 = v53;
  uint64_t v110 = v99;
  v227[55] = v99;
  v226[56] = @"isGatheringComplete";
  double v100 = v176;
  if (!v176)
  {
    objc_msgSend(MEMORY[0x1E4F1CA98], "null", v99, v112, v113, v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127,
      v128,
      v129,
      v130,
      v131,
      v132,
      v133,
      v134,
      v135,
      v136,
      v137,
      v138,
      v139,
      v140,
      v141,
      v142,
      v143,
      v144,
      v145,
      v146,
      v147,
      v148,
      v149,
      v150,
      v151,
      v152,
    double v100 = v153);
  }
  v167 = v47;
  v227[56] = v100;
  v226[57] = @"gaPR";
  double v101 = v175;
  double v102 = v49;
  if (!v175)
  {
    double v101 = [MEMORY[0x1E4F1CA98] null];
  }
  v156 = (void *)v44;
  v227[57] = v101;
  v226[58] = @"pCount";
  double v103 = v174;
  if (!v174)
  {
    double v103 = [MEMORY[0x1E4F1CA98] null];
  }
  v154 = (void *)v48;
  double v104 = v45;
  v227[58] = v103;
  v226[59] = @"mapItemSource";
  double v105 = v173;
  if (!v173)
  {
    double v105 = [MEMORY[0x1E4F1CA98] null];
  }
  v227[59] = v105;
  v226[60] = @"placeType";
  double v106 = v172;
  if (!v172)
  {
    double v106 = [MEMORY[0x1E4F1CA98] null];
  }
  v227[60] = v106;
  v226[61] = @"placeLabelGranularity";
  int v107 = v170;
  if (!v170)
  {
    int v107 = [MEMORY[0x1E4F1CA98] null];
  }
  v227[61] = v107;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v227, v226, 62, v110);
  id v164 = (id)objc_claimAutoreleasedReturnValue();
  if (!v170) {

  }
  v108 = v57;
  if (!v172)
  {

    v108 = v57;
  }
  if (!v173)
  {

    v108 = v57;
  }
  if (!v174)
  {

    v108 = v57;
  }
  if (!v175)
  {

    v108 = v57;
  }
  if (!v176)
  {

    v108 = v57;
  }
  if (!v177)
  {

    v108 = v57;
  }
  if (!v178)
  {

    v108 = v57;
  }
  if (!v179)
  {

    v108 = v57;
  }
  if (!v180)
  {

    v108 = v57;
  }
  if (!v181)
  {

    v108 = v57;
  }
  if (!v182)
  {

    v108 = v57;
  }
  if (!v183)
  {

    v108 = v57;
  }
  if (!v184)
  {

    v108 = v57;
  }
  if (!v185)
  {

    v108 = v57;
  }
  if (!v186)
  {

    v108 = v57;
  }
  if (!v187)
  {

    v108 = v57;
  }
  if (!v188)
  {

    v108 = v57;
  }
  if (!v189)
  {

    v108 = v57;
  }
  if (!v190)
  {

    v108 = v57;
  }
  if (!v191)
  {

    v108 = v57;
  }
  if (!v192)
  {

    v108 = v57;
  }
  if (!v193)
  {

    v108 = v57;
  }
  if (!v194)
  {

    v108 = v57;
  }
  if (!v195)
  {

    v108 = v57;
  }
  if (!v196)
  {

    v108 = v57;
  }
  if (!v197)
  {

    v108 = v57;
  }
  if (!v198)
  {

    v108 = v57;
  }
  if (!v199)
  {

    v108 = v57;
  }
  if (!v200)
  {

    v108 = v57;
  }
  if (!v201)
  {

    v108 = v57;
  }
  if (!v202)
  {

    v108 = v57;
  }
  if (!v203)
  {

    v108 = v57;
  }
  if (!v204)
  {

    v108 = v57;
  }
  if (!v205)
  {

    v108 = v57;
  }
  if (!v206)
  {

    v108 = v57;
  }
  if (!v207)
  {

    v108 = v57;
  }
  if (!v208)
  {

    v108 = v57;
  }
  if (!v209)
  {

    v108 = v57;
  }
  if (!v210)
  {

    v108 = v57;
  }
  if (!v211)
  {

    v108 = v57;
  }
  if (!v212)
  {

    v108 = v57;
  }
  if (!v213)
  {

    v108 = v57;
  }
  if (!v214)
  {

    v108 = v57;
  }
  if (!v215)
  {

    v108 = v57;
  }
  if (!v216)
  {

    v108 = v57;
  }
  if (!v217)
  {

    v108 = v57;
  }
  if (!v218)
  {

    v108 = v57;
  }
  if (!v219) {

  }
  if (!v220) {
  if (!v221)
  }

  if (!v222) {
  if (!v223)
  }

  if (!v224) {
  if (v225)
  }
  {
    if (v168) {
      goto LABEL_355;
    }
  }
  else
  {

    if (v168)
    {
LABEL_355:
      if (v171) {
        goto LABEL_356;
      }
      goto LABEL_366;
    }
  }

  if (v171)
  {
LABEL_356:
    if (v104) {
      goto LABEL_357;
    }
    goto LABEL_367;
  }
LABEL_366:

  if (v104)
  {
LABEL_357:
    if (v102) {
      goto LABEL_358;
    }
    goto LABEL_368;
  }
LABEL_367:

  if (v102)
  {
LABEL_358:
    if (v167) {
      goto LABEL_359;
    }
    goto LABEL_369;
  }
LABEL_368:

  if (v167)
  {
LABEL_359:
    if (v51) {
      goto LABEL_360;
    }
LABEL_370:

    if (v169) {
      goto LABEL_361;
    }
    goto LABEL_371;
  }
LABEL_369:

  if (!v51) {
    goto LABEL_370;
  }
LABEL_360:
  if (v169) {
    goto LABEL_361;
  }
LABEL_371:

LABEL_361:

  return v164;
}

- (id)_photoMomentHolidaysJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMMomentsEventDataEvent *)self photoMomentHolidays];
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

- (id)_photoMomentInferencesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMomentsEventDataEvent *)self photoMomentInferences];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_contactIDsInConversationJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMMomentsEventDataEvent *)self contactIDsInConversation];
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

- (BMMomentsEventDataEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v701[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"eventIdentifier"];
  v545 = self;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
LABEL_4:
    v8 = [v5 objectForKeyedSubscript:@"startDate"];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v543 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      id v10 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v9 doubleValue];
      id v543 = (id)objc_msgSend(v10, "initWithTimeIntervalSince1970:");
LABEL_15:

      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F28D48]);
      id v16 = v8;
      id v543 = [v9 dateFromString:v16];

      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v543 = v8;
LABEL_16:
      uint64_t v17 = [v5 objectForKeyedSubscript:@"endDate"];
      v544 = (void *)v17;
      if (!v17 || (int v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v542 = 0;
        goto LABEL_24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v18;
        id v20 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        [v19 doubleValue];
        id v542 = (id)objc_msgSend(v20, "initWithTimeIntervalSince1970:");
LABEL_23:

        goto LABEL_24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        id v21 = v18;
        id v542 = [v19 dateFromString:v21];

        goto LABEL_23;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v542 = v18;
LABEL_24:
        v22 = [v5 objectForKeyedSubscript:@"creationDate"];
        v548 = v22;
        if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v539 = 0;
          goto LABEL_32;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = v22;
          id v24 = objc_alloc(MEMORY[0x1E4F1C9C8]);
          [v23 doubleValue];
          v25 = v24;
          v22 = v548;
          v539 = (id *)objc_msgSend(v25, "initWithTimeIntervalSince1970:");
LABEL_31:

          goto LABEL_32;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          id v26 = v22;
          v539 = [v23 dateFromString:v26];

          v22 = v548;
          goto LABEL_31;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v539 = v22;
LABEL_32:
          uint64_t v27 = [v5 objectForKeyedSubscript:@"sourceCreationDate"];
          v541 = (void *)v27;
          if (!v27 || (double v28 = (void *)v27, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v540 = 0;
            goto LABEL_40;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v29 = v28;
            id v30 = objc_alloc(MEMORY[0x1E4F1C9C8]);
            [v29 doubleValue];
            id v540 = (id)objc_msgSend(v30, "initWithTimeIntervalSince1970:");
LABEL_39:

            goto LABEL_40;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v29 = objc_alloc_init(MEMORY[0x1E4F28D48]);
            id v31 = v28;
            id v540 = [v29 dateFromString:v31];

            goto LABEL_39;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v540 = v28;
LABEL_40:
            uint64_t v32 = [v5 objectForKeyedSubscript:@"expirationDate"];
            v538 = (void *)v32;
            if (!v32 || (v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v537 = 0;
              goto LABEL_48;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v34 = v33;
              id v35 = objc_alloc(MEMORY[0x1E4F1C9C8]);
              [v34 doubleValue];
              id v537 = (id)objc_msgSend(v35, "initWithTimeIntervalSince1970:");
LABEL_47:

              goto LABEL_48;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v34 = objc_alloc_init(MEMORY[0x1E4F28D48]);
              id v36 = v33;
              id v537 = [v34 dateFromString:v36];

              goto LABEL_47;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v537 = v33;
LABEL_48:
              uint64_t v37 = [v5 objectForKeyedSubscript:@"provider"];
              v536 = (void *)v37;
              if (!v37 || (uint64_t v38 = (void *)v37, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v535 = 0;
                v22 = v548;
                goto LABEL_56;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v535 = v38;
LABEL_55:
                v22 = v548;

LABEL_56:
                uint64_t v40 = [v5 objectForKeyedSubscript:@"category"];
                v534 = (void *)v40;
                if (!v40 || (uint64_t v41 = (void *)v40, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v42 = 0;
                  goto LABEL_64;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v42 = v41;
LABEL_63:

LABEL_64:
                  uint64_t v44 = [v5 objectForKeyedSubscript:@"placeUserType"];
                  v533 = (void *)v44;
                  if (!v44 || (id v45 = (void *)v44, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v532 = 0;
                    goto LABEL_72;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v532 = v45;
LABEL_71:

LABEL_72:
                    uint64_t v51 = [v5 objectForKeyedSubscript:@"poiCategory"];
                    v531 = (void *)v51;
                    if (!v51 || (uint64_t v52 = (void *)v51, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v530 = 0;
                      goto LABEL_80;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v530 = v52;
LABEL_79:

LABEL_80:
                      uint64_t v54 = [v5 objectForKeyedSubscript:@"placeDiscovery"];
                      v529 = (void *)v54;
                      if (!v54 || (int v55 = (void *)v54, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v528 = 0;
                        goto LABEL_88;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v528 = v55;
LABEL_87:

LABEL_88:
                        uint64_t v57 = [v5 objectForKeyedSubscript:@"locationMode"];
                        v527 = (void *)v57;
                        if (!v57 || (uint64_t v58 = (void *)v57, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v526 = 0;
                          goto LABEL_96;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v526 = v58;
LABEL_95:

LABEL_96:
                          uint64_t v60 = [v5 objectForKeyedSubscript:@"workoutType"];
                          v522 = (void *)v60;
                          if (!v60 || (uint64_t v61 = (void *)v60, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v521 = 0;
                            goto LABEL_104;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v521 = v61;
LABEL_103:

LABEL_104:
                            uint64_t v63 = [v5 objectForKeyedSubscript:@"workoutBundleID"];
                            v520 = (void *)v63;
                            if (!v63 || (uint64_t v64 = (void *)v63, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v519 = 0;
                              goto LABEL_107;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v519 = v64;
LABEL_107:
                              uint64_t v65 = [v5 objectForKeyedSubscript:@"mediaGenre"];
                              v518 = (void *)v65;
                              if (!v65 || (uint64_t v66 = (void *)v65, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v517 = 0;
                                goto LABEL_132;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v517 = v66;
LABEL_131:

LABEL_132:
                                uint64_t v77 = [v5 objectForKeyedSubscript:@"mediaType"];
                                v516 = (void *)v77;
                                if (!v77 || (uint64_t v78 = (void *)v77, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  id v515 = 0;
                                  goto LABEL_142;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v515 = v78;
LABEL_141:

LABEL_142:
                                  uint64_t v84 = [v5 objectForKeyedSubscript:@"mediaRepetitions"];
                                  v514 = (void *)v84;
                                  if (!v84
                                    || (uint64_t v85 = (void *)v84, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v513 = 0;
                                    goto LABEL_145;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v513 = v85;
LABEL_145:
                                    uint64_t v86 = [v5 objectForKeyedSubscript:@"mediaSumTimePlayed"];
                                    v512 = (void *)v86;
                                    if (!v86
                                      || (uint64_t v87 = (void *)v86, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      id v511 = 0;
                                      goto LABEL_148;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v511 = v87;
LABEL_148:
                                      uint64_t v88 = [v5 objectForKeyedSubscript:@"sourceParty"];
                                      v510 = (void *)v88;
                                      if (!v88
                                        || (uint64_t v89 = (void *)v88, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        id v509 = 0;
                                        goto LABEL_178;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v509 = v89;
LABEL_177:

LABEL_178:
                                        uint64_t v127 = [v5 objectForKeyedSubscript:@"mediaPlayerBundleID"];
                                        v508 = (void *)v127;
                                        if (!v127
                                          || (int v128 = (void *)v127, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          v503 = v42;
                                          id v507 = 0;
                                          goto LABEL_181;
                                        }
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass())
                                        {
                                          v503 = v42;
                                          id v507 = v128;
LABEL_181:
                                          uint64_t v129 = [v5 objectForKeyedSubscript:@"numAudioMediaPlaySessionsPerDay"];
                                          v506 = (void *)v129;
                                          if (!v129
                                            || (int v130 = (void *)v129,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            id v504 = 0;
                                            goto LABEL_184;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v504 = v130;
LABEL_184:
                                            uint64_t v131 = [v5 objectForKeyedSubscript:@"durationAudioMediaPlaySessionsPerDay"];
                                            v502 = (void *)v131;
                                            if (!v131
                                              || (int v132 = (void *)v131,
                                                  objc_opt_class(),
                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                            {
                                              id v501 = 0;
                                              goto LABEL_187;
                                            }
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v501 = v132;
LABEL_187:
                                              uint64_t v133 = [v5 objectForKeyedSubscript:@"numVideoMediaPlaySessionsPerDay"];
                                              v500 = (void *)v133;
                                              if (!v133
                                                || (int v134 = (void *)v133,
                                                    objc_opt_class(),
                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                              {
                                                id v499 = 0;
                                                goto LABEL_190;
                                              }
                                              objc_opt_class();
                                              if (objc_opt_isKindOfClass())
                                              {
                                                id v499 = v134;
LABEL_190:
                                                uint64_t v135 = [v5 objectForKeyedSubscript:@"durationVideoMediaPlaySessionsPerDay"];
                                                v498 = (void *)v135;
                                                if (!v135
                                                  || (v136 = (void *)v135,
                                                      objc_opt_class(),
                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                {
                                                  id v497 = 0;
                                                  goto LABEL_193;
                                                }
                                                objc_opt_class();
                                                if (objc_opt_isKindOfClass())
                                                {
                                                  id v497 = v136;
LABEL_193:
                                                  uint64_t v137 = [v5 objectForKeyedSubscript:@"numFirstPartyMediaPlaySessionsPerDay"];
                                                  v496 = (void *)v137;
                                                  if (!v137
                                                    || (v138 = (void *)v137,
                                                        objc_opt_class(),
                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                  {
                                                    id v495 = 0;
                                                    goto LABEL_196;
                                                  }
                                                  objc_opt_class();
                                                  if (objc_opt_isKindOfClass())
                                                  {
                                                    id v495 = v138;
LABEL_196:
                                                    uint64_t v139 = [v5 objectForKeyedSubscript:@"numThirdPartyMediaPlaySessionsPerDay"];
                                                    v494 = (void *)v139;
                                                    if (!v139
                                                      || (v140 = (void *)v139,
                                                          objc_opt_class(),
                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                    {
                                                      id v493 = 0;
                                                      goto LABEL_199;
                                                    }
                                                    objc_opt_class();
                                                    if (objc_opt_isKindOfClass())
                                                    {
                                                      id v493 = v140;
LABEL_199:
                                                      uint64_t v141 = [v5 objectForKeyedSubscript:@"numContacts"];
                                                      v491 = (void *)v141;
                                                      if (!v141
                                                        || (int v142 = (void *)v141,
                                                            objc_opt_class(),
                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                      {
                                                        id v492 = 0;
LABEL_202:
                                                        int v143 = [v5 objectForKeyedSubscript:@"contactIDsInConversation"];
                                                        int v144 = [MEMORY[0x1E4F1CA98] null];
                                                        int v145 = [v143 isEqual:v144];

                                                        if (v145)
                                                        {
                                                          id v488 = v7;

                                                          int v143 = 0;
                                                          v22 = v548;
                                                          goto LABEL_233;
                                                        }
                                                        v22 = v548;
                                                        if (!v143
                                                          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                        {
                                                          id v488 = v7;
LABEL_233:
                                                          v524 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v143, "count"));
                                                          long long v559 = 0u;
                                                          long long v560 = 0u;
                                                          long long v561 = 0u;
                                                          long long v562 = 0u;
                                                          id obj = v143;
                                                          uint64_t v175 = [obj countByEnumeratingWithState:&v559 objects:v645 count:16];
                                                          if (v175)
                                                          {
                                                            uint64_t v176 = v175;
                                                            uint64_t v177 = *(void *)v560;
LABEL_235:
                                                            uint64_t v178 = 0;
                                                            while (1)
                                                            {
                                                              if (*(void *)v560 != v177) {
                                                                objc_enumerationMutation(obj);
                                                              }
                                                              id v179 = *(void **)(*((void *)&v559 + 1) + 8 * v178);
                                                              objc_opt_class();
                                                              if (objc_opt_isKindOfClass()) {
                                                                break;
                                                              }
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                              {
                                                                if (a4)
                                                                {
                                                                  id v210 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                  uint64_t v211 = *MEMORY[0x1E4F502C8];
                                                                  uint64_t v641 = *MEMORY[0x1E4F28568];
                                                                  v487 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contactIDsInConversation"];
                                                                  v642 = v487;
                                                                  uint64_t v203 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v642 forKeys:&v641 count:1];
                                                                  v204 = v210;
                                                                  uint64_t v205 = v211;
                                                                  goto LABEL_284;
                                                                }
                                                                goto LABEL_294;
                                                              }
                                                              id v180 = v179;
                                                              [v524 addObject:v180];

                                                              if (v176 == ++v178)
                                                              {
                                                                uint64_t v176 = [obj countByEnumeratingWithState:&v559 objects:v645 count:16];
                                                                v22 = v548;
                                                                if (!v176) {
                                                                  goto LABEL_242;
                                                                }
                                                                goto LABEL_235;
                                                              }
                                                            }
                                                            if (a4)
                                                            {
                                                              id v201 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                              uint64_t v202 = *MEMORY[0x1E4F502C8];
                                                              uint64_t v643 = *MEMORY[0x1E4F28568];
                                                              v487 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"contactIDsInConversation"];
                                                              v644 = v487;
                                                              uint64_t v203 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v644 forKeys:&v643 count:1];
                                                              v204 = v201;
                                                              uint64_t v205 = v202;
LABEL_284:
                                                              v485 = (void *)v203;
                                                              long long v13 = v543;
                                                              uint64_t v71 = v542;
                                                              uint64_t v72 = v539;
                                                              id v42 = v503;
                                                              uint64_t v15 = 0;
                                                              *a4 = (id)objc_msgSend(v204, "initWithDomain:code:userInfo:", v205, 2);
                                                              id v486 = obj;
                                                              id v7 = v488;
                                                              v22 = v548;

                                                              goto LABEL_677;
                                                            }
LABEL_294:
                                                            uint64_t v15 = 0;
                                                            id v216 = obj;
                                                            id v7 = v488;
                                                            long long v13 = v543;
                                                            uint64_t v71 = v542;
                                                            v22 = v548;
                                                            goto LABEL_303;
                                                          }
LABEL_242:

                                                          uint64_t v181 = [v5 objectForKeyedSubscript:@"contactIDMostSignificantInConversation"];
                                                          v487 = (void *)v181;
                                                          if (v181
                                                            && (id v182 = (void *)v181,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) == 0))
                                                          {
                                                            objc_opt_class();
                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                            {
                                                              id v7 = v488;
                                                              id v42 = v503;
                                                              if (a4)
                                                              {
                                                                id v243 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                uint64_t v244 = *MEMORY[0x1E4F502C8];
                                                                uint64_t v639 = *MEMORY[0x1E4F28568];
                                                                id v484 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"contactIDMostSignificantInConversation"];
                                                                id v640 = v484;
                                                                uint64_t v245 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v640 forKeys:&v639 count:1];
                                                                uint64_t v246 = v244;
                                                                v22 = v548;
                                                                v483 = (void *)v245;
                                                                id v486 = 0;
                                                                uint64_t v15 = 0;
                                                                *a4 = (id)objc_msgSend(v243, "initWithDomain:code:userInfo:", v246, 2);
                                                                long long v13 = v543;
                                                                uint64_t v71 = v542;
                                                                uint64_t v72 = v539;

                                                                goto LABEL_676;
                                                              }
                                                              id v486 = 0;
                                                              uint64_t v15 = 0;
                                                              long long v13 = v543;
                                                              uint64_t v71 = v542;
                                                              uint64_t v72 = v539;
LABEL_677:

                                                              id v216 = v486;
                                                              goto LABEL_678;
                                                            }
                                                            id v486 = v182;
                                                          }
                                                          else
                                                          {
                                                            id v486 = 0;
                                                          }
                                                          uint64_t v183 = [v5 objectForKeyedSubscript:@"interactionContactScore"];
                                                          v482 = (void *)v183;
                                                          if (v183)
                                                          {
                                                            id v184 = (void *)v183;
                                                            objc_opt_class();
                                                            id v7 = v488;
                                                            if (objc_opt_isKindOfClass())
                                                            {
                                                              id v484 = 0;
                                                            }
                                                            else
                                                            {
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                              {
                                                                if (!a4)
                                                                {
                                                                  id v484 = 0;
                                                                  uint64_t v15 = 0;
                                                                  long long v13 = v543;
                                                                  uint64_t v71 = v542;
                                                                  uint64_t v72 = v539;
                                                                  id v42 = v503;
                                                                  goto LABEL_675;
                                                                }
                                                                id v247 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                uint64_t v248 = *MEMORY[0x1E4F502C8];
                                                                uint64_t v637 = *MEMORY[0x1E4F28568];
                                                                id v480 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"interactionContactScore"];
                                                                id v638 = v480;
                                                                uint64_t v249 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v638 forKeys:&v637 count:1];
                                                                uint64_t v250 = v248;
                                                                v22 = v548;
                                                                v481 = (void *)v249;
                                                                id v484 = 0;
                                                                uint64_t v15 = 0;
                                                                *a4 = (id)objc_msgSend(v247, "initWithDomain:code:userInfo:", v250, 2);
                                                                goto LABEL_385;
                                                              }
                                                              id v484 = v184;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            id v484 = 0;
                                                            id v7 = v488;
                                                          }
                                                          uint64_t v225 = [v5 objectForKeyedSubscript:@"textLikeMechanismIncluded"];
                                                          v481 = (void *)v225;
                                                          if (!v225
                                                            || (v226 = (void *)v225,
                                                                objc_opt_class(),
                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                          {
                                                            id v480 = 0;
LABEL_319:
                                                            uint64_t v227 = [v5 objectForKeyedSubscript:@"callLikeMechanismIncluded"];
                                                            id v42 = v503;
                                                            v479 = (void *)v227;
                                                            if (v227
                                                              && (v228 = (void *)v227,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) == 0))
                                                            {
                                                              objc_opt_class();
                                                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                                              {
                                                                if (!a4)
                                                                {
                                                                  id v478 = 0;
                                                                  uint64_t v15 = 0;
                                                                  long long v13 = v543;
                                                                  uint64_t v71 = v542;
                                                                  uint64_t v72 = v539;
                                                                  goto LABEL_673;
                                                                }
                                                                id v255 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                uint64_t v256 = *MEMORY[0x1E4F502C8];
                                                                uint64_t v633 = *MEMORY[0x1E4F28568];
                                                                id v474 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"callLikeMechanismIncluded"];
                                                                id v634 = v474;
                                                                uint64_t v257 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v634 forKeys:&v633 count:1];
                                                                uint64_t v258 = v256;
                                                                v22 = v548;
                                                                v475 = (void *)v257;
                                                                id v478 = 0;
                                                                uint64_t v15 = 0;
                                                                *a4 = (id)objc_msgSend(v255, "initWithDomain:code:userInfo:", v258, 2);
                                                                goto LABEL_392;
                                                              }
                                                              id v478 = v228;
                                                            }
                                                            else
                                                            {
                                                              id v478 = 0;
                                                            }
                                                            uint64_t v229 = [v5 objectForKeyedSubscript:@"numTextLikeInteractions"];
                                                            v475 = (void *)v229;
                                                            if (!v229
                                                              || (v230 = (void *)v229,
                                                                  objc_opt_class(),
                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                            {
                                                              id v474 = 0;
                                                              goto LABEL_325;
                                                            }
                                                            objc_opt_class();
                                                            if (objc_opt_isKindOfClass())
                                                            {
                                                              id v474 = v230;
LABEL_325:
                                                              uint64_t v231 = [v5 objectForKeyedSubscript:@"numAudioLikeInteractions"];
                                                              v472 = (void *)v231;
                                                              if (!v231
                                                                || (v232 = (void *)v231,
                                                                    objc_opt_class(),
                                                                    (objc_opt_isKindOfClass() & 1) != 0))
                                                              {
                                                                id v471 = 0;
                                                                goto LABEL_328;
                                                              }
                                                              objc_opt_class();
                                                              if (objc_opt_isKindOfClass())
                                                              {
                                                                id v471 = v232;
LABEL_328:
                                                                uint64_t v233 = [v5 objectForKeyedSubscript:@"numVideoLikeInteractions"];
                                                                v470 = (void *)v233;
                                                                if (!v233
                                                                  || (v234 = (void *)v233,
                                                                      objc_opt_class(),
                                                                      (objc_opt_isKindOfClass() & 1) != 0))
                                                                {
                                                                  id v469 = 0;
                                                                  goto LABEL_331;
                                                                }
                                                                objc_opt_class();
                                                                if (objc_opt_isKindOfClass())
                                                                {
                                                                  id v469 = v234;
LABEL_331:
                                                                  uint64_t v235 = [v5 objectForKeyedSubscript:@"totalDurationOfCallLikeInteractions"];
                                                                  v468 = (void *)v235;
                                                                  if (!v235
                                                                    || (v236 = (void *)v235,
                                                                        objc_opt_class(),
                                                                        (objc_opt_isKindOfClass() & 1) != 0))
                                                                  {
                                                                    id v467 = 0;
                                                                    goto LABEL_334;
                                                                  }
                                                                  objc_opt_class();
                                                                  if (objc_opt_isKindOfClass())
                                                                  {
                                                                    id v467 = v236;
LABEL_334:
                                                                    uint64_t v237 = [v5 objectForKeyedSubscript:@"minDurationOfCallLikeInteractions"];
                                                                    v464 = (void *)v237;
                                                                    if (!v237
                                                                      || (v238 = (void *)v237,
                                                                          objc_opt_class(),
                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                    {
                                                                      id v463 = 0;
                                                                      goto LABEL_337;
                                                                    }
                                                                    objc_opt_class();
                                                                    if (objc_opt_isKindOfClass())
                                                                    {
                                                                      id v463 = v238;
LABEL_337:
                                                                      uint64_t v239 = [v5 objectForKeyedSubscript:@"maxDurationOfCallLikeInteractions"];
                                                                      v462 = (void *)v239;
                                                                      if (!v239
                                                                        || (v240 = (void *)v239,
                                                                            objc_opt_class(),
                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                      {
                                                                        id v461 = 0;
LABEL_340:
                                                                        uint64_t v241 = [v5 objectForKeyedSubscript:@"photoMomentSource"];
                                                                        v460 = (void *)v241;
                                                                        if (v241
                                                                          && (v242 = (void *)v241,
                                                                              objc_opt_class(),
                                                                              (objc_opt_isKindOfClass() & 1) == 0))
                                                                        {
                                                                          objc_opt_class();
                                                                          if (objc_opt_isKindOfClass())
                                                                          {
                                                                            id v459 = v242;
                                                                          }
                                                                          else
                                                                          {
                                                                            objc_opt_class();
                                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                            {
                                                                              if (a4)
                                                                              {
                                                                                id v327 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                uint64_t v328 = *MEMORY[0x1E4F502C8];
                                                                                uint64_t v619 = *MEMORY[0x1E4F28568];
                                                                                id v473 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"photoMomentSource"];
                                                                                id v620 = v473;
                                                                                uint64_t v329 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v620 forKeys:&v619 count:1];
                                                                                uint64_t v330 = v328;
                                                                                v22 = v548;
                                                                                v477 = (void *)v329;
                                                                                id v459 = 0;
                                                                                uint64_t v15 = 0;
                                                                                *a4 = (id)objc_msgSend(v327, "initWithDomain:code:userInfo:", v330, 2);
                                                                                long long v13 = v543;
                                                                                uint64_t v71 = v542;
                                                                                uint64_t v72 = v539;
                                                                                id v42 = v503;

                                                                                goto LABEL_665;
                                                                              }
                                                                              id v459 = 0;
                                                                              uint64_t v15 = 0;
                                                                              long long v13 = v543;
                                                                              uint64_t v71 = v542;
                                                                              uint64_t v72 = v539;
                                                                              id v42 = v503;
                                                                              goto LABEL_666;
                                                                            }
                                                                            id v283 = v242;
                                                                            id v459 = [NSNumber numberWithInt:BMMomentsEventDataPhotoMomentSourceTypeFromString(v283)];
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          id v459 = 0;
                                                                        }
                                                                        v284 = [v5 objectForKeyedSubscript:@"photoMomentInferences"];
                                                                        v285 = [MEMORY[0x1E4F1CA98] null];
                                                                        int v286 = [v284 isEqual:v285];

                                                                        if (v286)
                                                                        {

                                                                          v284 = 0;
                                                                          v22 = v548;
                                                                        }
                                                                        else
                                                                        {
                                                                          v22 = v548;
                                                                          if (v284)
                                                                          {
                                                                            objc_opt_class();
                                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                            {
                                                                              id v473 = v284;
                                                                              if (!a4)
                                                                              {
                                                                                uint64_t v15 = 0;
                                                                                long long v13 = v543;
                                                                                uint64_t v71 = v542;
                                                                                uint64_t v72 = v539;
                                                                                goto LABEL_665;
                                                                              }
                                                                              id v318 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                              uint64_t v319 = *MEMORY[0x1E4F502C8];
                                                                              uint64_t v617 = *MEMORY[0x1E4F28568];
                                                                              v476 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"photoMomentInferences"];
                                                                              v618 = v476;
                                                                              uint64_t v320 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v618 forKeys:&v617 count:1];
                                                                              uint64_t v321 = v319;
                                                                              v22 = v548;
                                                                              id v465 = (id)v320;
                                                                              uint64_t v15 = 0;
                                                                              *a4 = (id)objc_msgSend(v318, "initWithDomain:code:userInfo:", v321, 2);
                                                                              goto LABEL_465;
                                                                            }
                                                                          }
                                                                        }
                                                                        v476 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v284, "count"));
                                                                        long long v555 = 0u;
                                                                        long long v556 = 0u;
                                                                        long long v557 = 0u;
                                                                        long long v558 = 0u;
                                                                        id v473 = v284;
                                                                        uint64_t v287 = [v473 countByEnumeratingWithState:&v555 objects:v616 count:16];
                                                                        if (!v287) {
                                                                          goto LABEL_410;
                                                                        }
                                                                        uint64_t v288 = v287;
                                                                        uint64_t v489 = *(void *)v556;
                                                                        while (1)
                                                                        {
                                                                          id v289 = v7;
                                                                          for (uint64_t i = 0; i != v288; ++i)
                                                                          {
                                                                            if (*(void *)v556 != v489) {
                                                                              objc_enumerationMutation(v473);
                                                                            }
                                                                            v291 = *(void **)(*((void *)&v555 + 1)
                                                                                            + 8 * i);
                                                                            objc_opt_class();
                                                                            if (objc_opt_isKindOfClass())
                                                                            {
                                                                              v299 = a4;
                                                                              if (a4)
                                                                              {
                                                                                id v300 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                uint64_t v301 = *MEMORY[0x1E4F502C8];
                                                                                uint64_t v614 = *MEMORY[0x1E4F28568];
                                                                                v466 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"photoMomentInferences"];
                                                                                v615 = v466;
                                                                                uint64_t v302 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v615 forKeys:&v614 count:1];
                                                                                v303 = v300;
LABEL_416:
                                                                                uint64_t v305 = v301;
                                                                                v22 = v548;
                                                                                uint64_t v15 = 0;
                                                                                id *v299 = (id)[v303 initWithDomain:v305 code:2 userInfo:v302];
                                                                                v306 = (void *)v302;
                                                                                id v465 = v473;
                                                                                id v7 = v289;
                                                                                long long v13 = v543;
                                                                                uint64_t v71 = v542;
LABEL_417:
                                                                                uint64_t v72 = v539;
                                                                                goto LABEL_662;
                                                                              }
LABEL_464:
                                                                              uint64_t v15 = 0;
                                                                              id v465 = v473;
                                                                              id v7 = v289;
LABEL_465:
                                                                              long long v13 = v543;
                                                                              uint64_t v71 = v542;
                                                                              goto LABEL_466;
                                                                            }
                                                                            objc_opt_class();
                                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                            {
                                                                              v299 = a4;
                                                                              if (a4)
                                                                              {
                                                                                id v304 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                uint64_t v301 = *MEMORY[0x1E4F502C8];
                                                                                uint64_t v612 = *MEMORY[0x1E4F28568];
                                                                                v466 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"photoMomentInferences"];
                                                                                v613 = v466;
                                                                                uint64_t v302 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v613 forKeys:&v612 count:1];
                                                                                v303 = v304;
                                                                                goto LABEL_416;
                                                                              }
                                                                              goto LABEL_464;
                                                                            }
                                                                            id v292 = v291;
                                                                            v293 = [BMMomentsEventDataPhotoMomentInference alloc];
                                                                            id v554 = 0;
                                                                            v294 = [(BMMomentsEventDataPhotoMomentInference *)v293 initWithJSONDictionary:v292 error:&v554];
                                                                            id v295 = v554;
                                                                            if (v295)
                                                                            {
                                                                              id v458 = v295;
                                                                              v466 = v292;
                                                                              id v7 = v289;
                                                                              if (a4) {
                                                                                *a4 = v295;
                                                                              }

                                                                              uint64_t v15 = 0;
                                                                              id v465 = v473;
                                                                              long long v13 = v543;
                                                                              uint64_t v71 = v542;
                                                                              v22 = v548;
                                                                              uint64_t v72 = v539;
                                                                              goto LABEL_661;
                                                                            }
                                                                            [v476 addObject:v294];

                                                                            v22 = v548;
                                                                          }
                                                                          id v7 = v289;
                                                                          uint64_t v288 = [v473 countByEnumeratingWithState:&v555 objects:v616 count:16];
                                                                          if (!v288)
                                                                          {
LABEL_410:

                                                                            v296 = [v5 objectForKeyedSubscript:@"photoMomentHolidays"];
                                                                            v297 = [MEMORY[0x1E4F1CA98] null];
                                                                            int v298 = [v296 isEqual:v297];

                                                                            if (v298)
                                                                            {
                                                                              id v490 = v7;

                                                                              v296 = 0;
LABEL_424:
                                                                              v466 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v296, "count"));
                                                                              long long v550 = 0u;
                                                                              long long v551 = 0u;
                                                                              long long v552 = 0u;
                                                                              long long v553 = 0u;
                                                                              id v465 = v296;
                                                                              uint64_t v307 = [v465 countByEnumeratingWithState:&v550 objects:v609 count:16];
                                                                              if (!v307) {
                                                                                goto LABEL_433;
                                                                              }
                                                                              uint64_t v308 = v307;
                                                                              uint64_t v309 = *(void *)v551;
LABEL_426:
                                                                              uint64_t v310 = 0;
                                                                              while (1)
                                                                              {
                                                                                if (*(void *)v551 != v309) {
                                                                                  objc_enumerationMutation(v465);
                                                                                }
                                                                                v311 = *(void **)(*((void *)&v550 + 1)
                                                                                                + 8 * v310);
                                                                                objc_opt_class();
                                                                                if (objc_opt_isKindOfClass()) {
                                                                                  break;
                                                                                }
                                                                                objc_opt_class();
                                                                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                {
                                                                                  if (a4)
                                                                                  {
                                                                                    id v331 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                    uint64_t v332 = *MEMORY[0x1E4F502C8];
                                                                                    uint64_t v605 = *MEMORY[0x1E4F28568];
                                                                                    v457 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"photoMomentHolidays"];
                                                                                    v606 = v457;
                                                                                    uint64_t v324 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v606 forKeys:&v605 count:1];
                                                                                    v325 = v331;
                                                                                    uint64_t v326 = v332;
                                                                                    goto LABEL_479;
                                                                                  }
                                                                                  goto LABEL_482;
                                                                                }
                                                                                id v312 = v311;
                                                                                [v466 addObject:v312];

                                                                                if (v308 == ++v310)
                                                                                {
                                                                                  uint64_t v308 = [v465 countByEnumeratingWithState:&v550 objects:v609 count:16];
                                                                                  if (v308) {
                                                                                    goto LABEL_426;
                                                                                  }
LABEL_433:

                                                                                  uint64_t v313 = [v5 objectForKeyedSubscript:@"numPhotoMomentHolidays"];
                                                                                  v457 = (void *)v313;
                                                                                  if (v313
                                                                                    && (v314 = (void *)v313,
                                                                                        objc_opt_class(),
                                                                                        (objc_opt_isKindOfClass() & 1) == 0))
                                                                                  {
                                                                                    objc_opt_class();
                                                                                    if (objc_opt_isKindOfClass())
                                                                                    {
                                                                                      id v458 = v314;
                                                                                      goto LABEL_436;
                                                                                    }
                                                                                    if (!a4)
                                                                                    {
                                                                                      id v458 = 0;
                                                                                      uint64_t v15 = 0;
                                                                                      id v7 = v490;
                                                                                      long long v13 = v543;
                                                                                      uint64_t v71 = v542;
                                                                                      v22 = v548;
                                                                                      uint64_t v72 = v539;
                                                                                      id v42 = v503;
                                                                                      goto LABEL_660;
                                                                                    }
                                                                                    id v336 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                    uint64_t v337 = *MEMORY[0x1E4F502C8];
                                                                                    uint64_t v603 = *MEMORY[0x1E4F28568];
                                                                                    id v455 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numPhotoMomentHolidays"];
                                                                                    id v604 = v455;
                                                                                    v454 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v604 forKeys:&v603 count:1];
                                                                                    id v458 = 0;
                                                                                    uint64_t v15 = 0;
                                                                                    *a4 = (id)objc_msgSend(v336, "initWithDomain:code:userInfo:", v337, 2);
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    id v458 = 0;
LABEL_436:
                                                                                    v454 = [v5 objectForKeyedSubscript:@"numPhotoMomentInferences"];
                                                                                    if (!v454
                                                                                      || (objc_opt_class(),
                                                                                          (objc_opt_isKindOfClass() & 1) != 0))
                                                                                    {
                                                                                      id v455 = 0;
LABEL_439:
                                                                                      v453 = [v5 objectForKeyedSubscript:@"numPhotoMomentPublicEvents"];
                                                                                      if (!v453
                                                                                        || (objc_opt_class(),
                                                                                            (objc_opt_isKindOfClass() & 1) != 0))
                                                                                      {
                                                                                        id v452 = 0;
LABEL_442:
                                                                                        v451 = [v5 objectForKeyedSubscript:@"numPhotoMomentPersons"];
                                                                                        if (!v451
                                                                                          || (objc_opt_class(),
                                                                                              (objc_opt_isKindOfClass() & 1) != 0))
                                                                                        {
                                                                                          id v450 = 0;
LABEL_445:
                                                                                          v449 = [v5 objectForKeyedSubscript:@"isFamilyInPhotoMoment"];
                                                                                          if (!v449
                                                                                            || (objc_opt_class(),
                                                                                                (objc_opt_isKindOfClass() & 1) != 0))
                                                                                          {
                                                                                            id v448 = 0;
LABEL_448:
                                                                                            v315 = v5;
                                                                                            v447 = [v5 objectForKeyedSubscript:@"momentIncludesFavoritedAsset"];
                                                                                            if (v447
                                                                                              && (objc_opt_class(),
                                                                                                  (objc_opt_isKindOfClass() & 1) == 0))
                                                                                            {
                                                                                              objc_opt_class();
                                                                                              if (objc_opt_isKindOfClass())
                                                                                              {
                                                                                                id v445 = v447;
                                                                                                goto LABEL_451;
                                                                                              }
                                                                                              if (a4)
                                                                                              {
                                                                                                id v350 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                uint64_t v351 = *MEMORY[0x1E4F502C8];
                                                                                                uint64_t v593 = *MEMORY[0x1E4F28568];
                                                                                                v352 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"momentIncludesFavoritedAsset"];
                                                                                                v594 = v352;
                                                                                                v316 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v594 forKeys:&v593 count:1];
                                                                                                id v445 = 0;
                                                                                                uint64_t v15 = 0;
                                                                                                *a4 = (id)[v350 initWithDomain:v351 code:2 userInfo:v316];
                                                                                                goto LABEL_653;
                                                                                              }
                                                                                              v346 = 0;
                                                                                              uint64_t v15 = 0;
                                                                                              id v7 = v490;
                                                                                              id v42 = v503;
                                                                                              v349 = v447;
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              id v445 = 0;
LABEL_451:
                                                                                              v316 = [v5 objectForKeyedSubscript:@"momentIncludesVideo"];
                                                                                              if (v316
                                                                                                && (objc_opt_class(),
                                                                                                    (objc_opt_isKindOfClass() & 1) == 0))
                                                                                              {
                                                                                                objc_opt_class();
                                                                                                if (objc_opt_isKindOfClass())
                                                                                                {
                                                                                                  id v443 = v316;
                                                                                                  goto LABEL_454;
                                                                                                }
                                                                                                if (a4)
                                                                                                {
                                                                                                  id v353 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                  uint64_t v354 = *MEMORY[0x1E4F502C8];
                                                                                                  uint64_t v591 = *MEMORY[0x1E4F28568];
                                                                                                  id v442 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"momentIncludesVideo"];
                                                                                                  id v592 = v442;
                                                                                                  v446 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v592 forKeys:&v591 count:1];
                                                                                                  id v443 = 0;
                                                                                                  uint64_t v15 = 0;
                                                                                                  *a4 = (id)objc_msgSend(v353, "initWithDomain:code:userInfo:", v354, 2);
                                                                                                  goto LABEL_652;
                                                                                                }
                                                                                                v352 = 0;
                                                                                                uint64_t v15 = 0;
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                id v443 = 0;
LABEL_454:
                                                                                                v446 = [v5 objectForKeyedSubscript:@"momentIncludesPhoto"];
                                                                                                if (v446 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                {
                                                                                                  objc_opt_class();
                                                                                                  if (objc_opt_isKindOfClass())
                                                                                                  {
                                                                                                    id v442 = v446;
                                                                                                    goto LABEL_457;
                                                                                                  }
                                                                                                  if (a4)
                                                                                                  {
                                                                                                    id v355 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                    uint64_t v356 = *MEMORY[0x1E4F502C8];
                                                                                                    uint64_t v589 = *MEMORY[0x1E4F28568];
                                                                                                    id v439 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"momentIncludesPhoto"];
                                                                                                    id v590 = v439;
                                                                                                    v317 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v590 forKeys:&v589 count:1];
                                                                                                    id v442 = 0;
                                                                                                    uint64_t v15 = 0;
                                                                                                    *a4 = (id)objc_msgSend(v355, "initWithDomain:code:userInfo:", v356, 2);
                                                                                                    goto LABEL_651;
                                                                                                  }
                                                                                                  id v442 = 0;
                                                                                                  uint64_t v15 = 0;
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  id v442 = 0;
LABEL_457:
                                                                                                  v317 = [v5 objectForKeyedSubscript:@"suggestedEventCategory"];
                                                                                                  if (!v317 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                  {
                                                                                                    id v439 = 0;
LABEL_530:
                                                                                                    v444 = [v5 objectForKeyedSubscript:@"numAttendees"];
                                                                                                    if (v444 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                    {
                                                                                                      objc_opt_class();
                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                      {
                                                                                                        id v438 = v444;
                                                                                                        goto LABEL_533;
                                                                                                      }
                                                                                                      if (a4)
                                                                                                      {
                                                                                                        id v358 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                        uint64_t v359 = *MEMORY[0x1E4F502C8];
                                                                                                        uint64_t v585 = *MEMORY[0x1E4F28568];
                                                                                                        id v436 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numAttendees"];
                                                                                                        id v586 = v436;
                                                                                                        v441 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v586 forKeys:&v585 count:1];
                                                                                                        id v438 = 0;
                                                                                                        uint64_t v15 = 0;
                                                                                                        *a4 = (id)objc_msgSend(v358, "initWithDomain:code:userInfo:", v359, 2);
                                                                                                        goto LABEL_649;
                                                                                                      }
                                                                                                      id v438 = 0;
                                                                                                      uint64_t v15 = 0;
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      id v438 = 0;
LABEL_533:
                                                                                                      v441 = [v5 objectForKeyedSubscript:@"numtripParts"];
                                                                                                      if (v441 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                      {
                                                                                                        objc_opt_class();
                                                                                                        if (objc_opt_isKindOfClass())
                                                                                                        {
                                                                                                          id v436 = v441;
                                                                                                          goto LABEL_536;
                                                                                                        }
                                                                                                        if (a4)
                                                                                                        {
                                                                                                          id v360 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                          uint64_t v361 = *MEMORY[0x1E4F502C8];
                                                                                                          uint64_t v583 = *MEMORY[0x1E4F28568];
                                                                                                          id v434 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numtripParts"];
                                                                                                          id v584 = v434;
                                                                                                          v440 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v584 forKeys:&v583 count:1];
                                                                                                          id v436 = 0;
                                                                                                          uint64_t v15 = 0;
                                                                                                          *a4 = (id)objc_msgSend(v360, "initWithDomain:code:userInfo:", v361, 2);
                                                                                                          goto LABEL_648;
                                                                                                        }
                                                                                                        id v436 = 0;
                                                                                                        uint64_t v15 = 0;
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        id v436 = 0;
LABEL_536:
                                                                                                        v440 = [v5 objectForKeyedSubscript:@"tripMode"];
                                                                                                        if (!v440 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                        {
                                                                                                          id v434 = 0;
LABEL_556:
                                                                                                          v437 = [v5 objectForKeyedSubscript:@"numScoredTopics"];
                                                                                                          if (v437 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                          {
                                                                                                            objc_opt_class();
                                                                                                            if (objc_opt_isKindOfClass())
                                                                                                            {
                                                                                                              id v431 = v437;
                                                                                                              goto LABEL_559;
                                                                                                            }
                                                                                                            if (a4)
                                                                                                            {
                                                                                                              id v367 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                              uint64_t v368 = *MEMORY[0x1E4F502C8];
                                                                                                              uint64_t v579 = *MEMORY[0x1E4F28568];
                                                                                                              id v430 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numScoredTopics"];
                                                                                                              id v580 = v430;
                                                                                                              v435 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v580 forKeys:&v579 count:1];
                                                                                                              id v431 = 0;
                                                                                                              uint64_t v15 = 0;
                                                                                                              *a4 = (id)objc_msgSend(v367, "initWithDomain:code:userInfo:", v368, 2);
                                                                                                              goto LABEL_646;
                                                                                                            }
                                                                                                            id v431 = 0;
                                                                                                            uint64_t v15 = 0;
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            id v431 = 0;
LABEL_559:
                                                                                                            v435 = [v5 objectForKeyedSubscript:@"numItemAuthors"];
                                                                                                            if (v435 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                            {
                                                                                                              objc_opt_class();
                                                                                                              if (objc_opt_isKindOfClass())
                                                                                                              {
                                                                                                                id v430 = v435;
                                                                                                                goto LABEL_562;
                                                                                                              }
                                                                                                              if (a4)
                                                                                                              {
                                                                                                                id v369 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                uint64_t v370 = *MEMORY[0x1E4F502C8];
                                                                                                                uint64_t v577 = *MEMORY[0x1E4F28568];
                                                                                                                id v428 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numItemAuthors"];
                                                                                                                id v578 = v428;
                                                                                                                v432 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v578 forKeys:&v577 count:1];
                                                                                                                id v430 = 0;
                                                                                                                uint64_t v15 = 0;
                                                                                                                *a4 = (id)objc_msgSend(v369, "initWithDomain:code:userInfo:", v370, 2);
                                                                                                                goto LABEL_645;
                                                                                                              }
                                                                                                              id v430 = 0;
                                                                                                              uint64_t v15 = 0;
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              id v430 = 0;
LABEL_562:
                                                                                                              v432 = [v5 objectForKeyedSubscript:@"numItemRecipients"];
                                                                                                              if (v432 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                              {
                                                                                                                objc_opt_class();
                                                                                                                if (objc_opt_isKindOfClass())
                                                                                                                {
                                                                                                                  id v428 = v432;
                                                                                                                  goto LABEL_565;
                                                                                                                }
                                                                                                                if (a4)
                                                                                                                {
                                                                                                                  id v373 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                  uint64_t v374 = *MEMORY[0x1E4F502C8];
                                                                                                                  uint64_t v575 = *MEMORY[0x1E4F28568];
                                                                                                                  id v427 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numItemRecipients"];
                                                                                                                  id v576 = v427;
                                                                                                                  v429 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v576 forKeys:&v575 count:1];
                                                                                                                  id v428 = 0;
                                                                                                                  uint64_t v15 = 0;
                                                                                                                  *a4 = (id)objc_msgSend(v373, "initWithDomain:code:userInfo:", v374, 2);
                                                                                                                  goto LABEL_644;
                                                                                                                }
                                                                                                                id v428 = 0;
                                                                                                                uint64_t v15 = 0;
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                id v428 = 0;
LABEL_565:
                                                                                                                v429 = [v5 objectForKeyedSubscript:@"isGatheringComplete"];
                                                                                                                if (v429 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                {
                                                                                                                  objc_opt_class();
                                                                                                                  if (objc_opt_isKindOfClass())
                                                                                                                  {
                                                                                                                    id v427 = v429;
                                                                                                                    goto LABEL_568;
                                                                                                                  }
                                                                                                                  if (a4)
                                                                                                                  {
                                                                                                                    id v375 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                    uint64_t v376 = *MEMORY[0x1E4F502C8];
                                                                                                                    uint64_t v573 = *MEMORY[0x1E4F28568];
                                                                                                                    id v363 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isGatheringComplete"];
                                                                                                                    id v574 = v363;
                                                                                                                    v426 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v574 forKeys:&v573 count:1];
                                                                                                                    id v427 = 0;
                                                                                                                    uint64_t v15 = 0;
                                                                                                                    *a4 = (id)objc_msgSend(v375, "initWithDomain:code:userInfo:", v376, 2);
                                                                                                                    goto LABEL_642;
                                                                                                                  }
                                                                                                                  id v427 = 0;
                                                                                                                  uint64_t v15 = 0;
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                  id v427 = 0;
LABEL_568:
                                                                                                                  v433 = [v5 objectForKeyedSubscript:@"gaPR"];
                                                                                                                  if (v433 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                  {
                                                                                                                    objc_opt_class();
                                                                                                                    if (objc_opt_isKindOfClass())
                                                                                                                    {
                                                                                                                      id v363 = v433;
                                                                                                                      v364 = [BMMomentsEventDataPR alloc];
                                                                                                                      id v549 = 0;
                                                                                                                      v426 = [(BMMomentsEventDataPR *)v364 initWithJSONDictionary:v363 error:&v549];
                                                                                                                      id v365 = v549;
                                                                                                                      if (!v365)
                                                                                                                      {

                                                                                                                        goto LABEL_571;
                                                                                                                      }
                                                                                                                      v366 = v365;
                                                                                                                      if (a4) {
                                                                                                                        *a4 = v365;
                                                                                                                      }

                                                                                                                      uint64_t v15 = 0;
                                                                                                                      goto LABEL_642;
                                                                                                                    }
                                                                                                                    if (a4)
                                                                                                                    {
                                                                                                                      id v425 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                      uint64_t v379 = *MEMORY[0x1E4F502C8];
                                                                                                                      uint64_t v571 = *MEMORY[0x1E4F28568];
                                                                                                                      v426 = (BMMomentsEventDataPR *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"gaPR"];
                                                                                                                      v572 = v426;
                                                                                                                      v380 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v572 forKeys:&v571 count:1];
                                                                                                                      *a4 = (id)[v425 initWithDomain:v379 code:2 userInfo:v380];

                                                                                                                      uint64_t v15 = 0;
                                                                                                                      id v363 = v433;
                                                                                                                      goto LABEL_642;
                                                                                                                    }
                                                                                                                    uint64_t v15 = 0;
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    v426 = 0;
LABEL_571:
                                                                                                                    v423 = [v315 objectForKeyedSubscript:@"pCount"];
                                                                                                                    if (v423 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                                                                                                    {
                                                                                                                      objc_opt_class();
                                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                                      {
                                                                                                                        id v421 = v423;
                                                                                                                        goto LABEL_574;
                                                                                                                      }
                                                                                                                      if (a4)
                                                                                                                      {
                                                                                                                        id v381 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                        uint64_t v382 = *MEMORY[0x1E4F502C8];
                                                                                                                        uint64_t v569 = *MEMORY[0x1E4F28568];
                                                                                                                        id v418 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"pCount"];
                                                                                                                        id v570 = v418;
                                                                                                                        v424 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v570 forKeys:&v569 count:1];
                                                                                                                        id v421 = 0;
                                                                                                                        uint64_t v15 = 0;
                                                                                                                        *a4 = (id)objc_msgSend(v381, "initWithDomain:code:userInfo:", v382, 2);
                                                                                                                        goto LABEL_640;
                                                                                                                      }
                                                                                                                      id v421 = 0;
                                                                                                                      uint64_t v15 = 0;
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      id v421 = 0;
LABEL_574:
                                                                                                                      v424 = [v315 objectForKeyedSubscript:@"mapItemSource"];
                                                                                                                      if (v424)
                                                                                                                      {
                                                                                                                        objc_opt_class();
                                                                                                                        if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                                        {
                                                                                                                          objc_opt_class();
                                                                                                                          if (objc_opt_isKindOfClass())
                                                                                                                          {
                                                                                                                            id v418 = v424;
                                                                                                                          }
                                                                                                                          else
                                                                                                                          {
                                                                                                                            objc_opt_class();
                                                                                                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                                                                                                            {
                                                                                                                              if (a4)
                                                                                                                              {
                                                                                                                                id v392 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                                uint64_t v393 = *MEMORY[0x1E4F502C8];
                                                                                                                                uint64_t v567 = *MEMORY[0x1E4F28568];
                                                                                                                                id v417 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"mapItemSource"];
                                                                                                                                id v568 = v417;
                                                                                                                                v422 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v568 forKeys:&v567 count:1];
                                                                                                                                id v418 = 0;
                                                                                                                                uint64_t v15 = 0;
                                                                                                                                *a4 = (id)objc_msgSend(v392, "initWithDomain:code:userInfo:", v393, 2);
                                                                                                                                goto LABEL_639;
                                                                                                                              }
                                                                                                                              id v418 = 0;
                                                                                                                              uint64_t v15 = 0;
                                                                                                                              goto LABEL_640;
                                                                                                                            }
                                                                                                                            id v383 = v424;
                                                                                                                            id v418 = [NSNumber numberWithInt:BMMomentsEventDataMapItemSourceTypeFromString(v383)];
                                                                                                                          }
                                                                                                                          goto LABEL_619;
                                                                                                                        }
                                                                                                                      }
                                                                                                                      id v418 = 0;
LABEL_619:
                                                                                                                      v422 = [v315 objectForKeyedSubscript:@"placeType"];
                                                                                                                      if (!v422 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                                      {
                                                                                                                        id v417 = 0;
LABEL_629:
                                                                                                                        v419 = [v315 objectForKeyedSubscript:@"placeLabelGranularity"];
                                                                                                                        if (!v419 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                                                                                                        {
                                                                                                                          id v385 = 0;
                                                                                                                          goto LABEL_637;
                                                                                                                        }
                                                                                                                        objc_opt_class();
                                                                                                                        if (objc_opt_isKindOfClass())
                                                                                                                        {
                                                                                                                          id v385 = v419;
LABEL_636:

LABEL_637:
                                                                                                                          unsigned int v547 = [v535 intValue];
                                                                                                                          unsigned int v416 = [v503 intValue];
                                                                                                                          unsigned int v415 = [v532 intValue];
                                                                                                                          unsigned int v414 = [v530 intValue];
                                                                                                                          unsigned int v413 = [v528 intValue];
                                                                                                                          unsigned int v412 = [v526 intValue];
                                                                                                                          int v411 = [v521 intValue];
                                                                                                                          unsigned int v410 = [v517 intValue];
                                                                                                                          unsigned int v409 = [v515 intValue];
                                                                                                                          int v408 = [v509 intValue];
                                                                                                                          int v407 = [v459 intValue];
                                                                                                                          int v387 = [v439 intValue];
                                                                                                                          int v388 = [v434 intValue];
                                                                                                                          unsigned int v389 = [v418 intValue];
                                                                                                                          unsigned int v390 = [v417 intValue];
                                                                                                                          LODWORD(v406) = [v385 intValue];
                                                                                                                          LODWORD(v405) = v388;
                                                                                                                          LODWORD(v404) = v387;
                                                                                                                          LODWORD(v403) = v407;
                                                                                                                          LODWORD(v402) = v408;
                                                                                                                          LODWORD(v401) = v411;
                                                                                                                          uint64_t v15 = -[BMMomentsEventDataEvent initWithEventIdentifier:startDate:endDate:creationDate:sourceCreationDate:expirationDate:provider:category:placeUserType:poiCategory:placeDiscovery:locationMode:workoutType:workoutBundleID:mediaGenre:mediaType:mediaRepetitions:mediaSumTimePlayed:sourceParty:mediaPlayerBundleID:numAudioMediaPlaySessionsPerDay:durationAudioMediaPlaySessionsPerDay:numVideoMediaPlaySessionsPerDay:durationVideoMediaPlaySessionsPerDay:numFirstPartyMediaPlaySessionsPerDay:numThirdPartyMediaPlaySessionsPerDay:numContacts:contactIDsInConversation:contactIDMostSignificantInConversation:interactionContactScore:textLikeMechanismIncluded:callLikeMechanismIncluded:numTextLikeInteractions:numAudioLikeInteractions:numVideoLikeInteractions:totalDurationOfCallLikeInteractions:minDurationOfCallLikeInteractions:maxDurationOfCallLikeInteractions:photoMomentSource:photoMomentInferences:photoMomentHolidays:numPhotoMomentHolidays:numPhotoMomentInferences:numPhotoMomentPublicEvents:numPhotoMomentPersons:isFamilyInPhotoMoment:momentIncludesFavoritedAsset:momentIncludesVideo:momentIncludesPhoto:suggestedEventCategory:numAttendees:numtripParts:tripMode:numScoredTopics:numItemAuthors:numItemRecipients:isGatheringComplete:gaPR:pCount:mapItemSource:placeType:placeLabelGranularity:](v545, "initWithEventIdentifier:startDate:endDate:creationDate:sourceCreationDate:expirationDate:provider:category:placeUserType:poiCategory:placeDiscovery:locationMode:workoutType:workoutBundleID:mediaGenre:mediaType:mediaRepetitions:mediaSumTimePlayed:sourceParty:mediaPlayerBundleID:numAudioMediaPlaySessionsPerDay:durationAudioMediaPlaySessionsPerDay:numVideoMediaPlaySessionsPerDay:durationVideoMediaPlaySessionsPerDay:numFirstPartyMediaPlaySessionsPerDay:numThirdPartyMediaPlaySessionsPerDay:numContacts:contactIDsInConversation:contactIDMostSignificantInConversation:interactionContactScore:textLikeMechanismIncluded:callLikeMechanismIncluded:numTextLikeInteractions:numAudioLikeInteractions:numVideoLikeInteractions:totalDurationOfCallLikeInteractions:minDurationOfCallLikeInteractions:maxDurationOfCallLikeInteractions:photoMomentSource:photoMomentInferences:photoMomentHolidays:numPhotoMomentHolidays:numPhotoMomentInferences:numPhotoMomentPublicEvents:numPhotoMomentPersons:isFamilyInPhotoMoment:momentIncludesFavoritedAsset:momentIncludesVideo:momentIncludesPhoto:suggestedEventCategory:numAttendees:numtripParts:tripMode:numScoredTopics:numItemAuthors:numItemRecipients:isGatheringComplete:gaPR:pCount:mapItemSource:placeType:placeLabelGranularity:", v490, v543, v542, v539, v540, v537, __PAIR64__(v416, v547), __PAIR64__(v414, v415), __PAIR64__(v412, v413), v401, v519, __PAIR64__(v409, v410), v513, v511, v402, v507, v504, v501, v499, v497, v495, v493, v492, v524, v486, v484, v480, v478, v474, v471, v469, v467, v463, v461, v403, v476, v466, v458, v455, v452, v450, v448, v445, v443, v442, v404, v438, v436, v405, v431, v430, v428, v427, v426, v421, __PAIR64__(v390, v389), v406);
                                                                                                                          v545 = v15;
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          objc_opt_class();
                                                                                                                          if (objc_opt_isKindOfClass())
                                                                                                                          {
                                                                                                                            id v386 = v419;
                                                                                                                            id v385 = [NSNumber numberWithInt:BMMomentsEventDataPlaceInferenceGranularityTypeFromString(v386)];

                                                                                                                            goto LABEL_636;
                                                                                                                          }
                                                                                                                          if (a4)
                                                                                                                          {
                                                                                                                            id v397 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                            uint64_t v398 = *MEMORY[0x1E4F502C8];
                                                                                                                            uint64_t v563 = *MEMORY[0x1E4F28568];
                                                                                                                            v399 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"placeLabelGranularity"];
                                                                                                                            v564 = v399;
                                                                                                                            v400 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v564 forKeys:&v563 count:1];
                                                                                                                            *a4 = (id)[v397 initWithDomain:v398 code:2 userInfo:v400];
                                                                                                                          }
                                                                                                                          id v385 = 0;
                                                                                                                          uint64_t v15 = 0;
                                                                                                                        }
LABEL_638:

                                                                                                                        goto LABEL_639;
                                                                                                                      }
                                                                                                                      objc_opt_class();
                                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                                      {
                                                                                                                        id v417 = v422;
LABEL_628:

                                                                                                                        goto LABEL_629;
                                                                                                                      }
                                                                                                                      objc_opt_class();
                                                                                                                      if (objc_opt_isKindOfClass())
                                                                                                                      {
                                                                                                                        id v384 = v422;
                                                                                                                        id v417 = [NSNumber numberWithInt:BMMomentsEventDataVisitPlaceTypesFromString(v384)];

                                                                                                                        goto LABEL_628;
                                                                                                                      }
                                                                                                                      if (a4)
                                                                                                                      {
                                                                                                                        id v420 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                                        uint64_t v394 = *MEMORY[0x1E4F502C8];
                                                                                                                        uint64_t v565 = *MEMORY[0x1E4F28568];
                                                                                                                        id v385 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"placeType"];
                                                                                                                        id v566 = v385;
                                                                                                                        uint64_t v395 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v566 forKeys:&v565 count:1];
                                                                                                                        v396 = v420;
                                                                                                                        v419 = (void *)v395;
                                                                                                                        id v417 = 0;
                                                                                                                        uint64_t v15 = 0;
                                                                                                                        *a4 = (id)objc_msgSend(v396, "initWithDomain:code:userInfo:", v394, 2);
                                                                                                                        goto LABEL_638;
                                                                                                                      }
                                                                                                                      id v417 = 0;
                                                                                                                      uint64_t v15 = 0;
LABEL_639:

LABEL_640:
                                                                                                                    }

                                                                                                                    id v363 = v433;
LABEL_642:

                                                                                                                    v433 = v363;
                                                                                                                  }
                                                                                                                }
LABEL_644:
                                                                                                              }
LABEL_645:
                                                                                                            }
LABEL_646:
                                                                                                          }
LABEL_647:

                                                                                                          goto LABEL_648;
                                                                                                        }
                                                                                                        objc_opt_class();
                                                                                                        if (objc_opt_isKindOfClass())
                                                                                                        {
                                                                                                          id v434 = v440;
LABEL_555:

                                                                                                          goto LABEL_556;
                                                                                                        }
                                                                                                        objc_opt_class();
                                                                                                        if (objc_opt_isKindOfClass())
                                                                                                        {
                                                                                                          id v362 = v440;
                                                                                                          id v434 = [NSNumber numberWithInt:BMMomentsEventDataTripModeTypeFromString(v362)];

                                                                                                          goto LABEL_555;
                                                                                                        }
                                                                                                        if (a4)
                                                                                                        {
                                                                                                          id v377 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                          uint64_t v378 = *MEMORY[0x1E4F502C8];
                                                                                                          uint64_t v581 = *MEMORY[0x1E4F28568];
                                                                                                          id v431 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"tripMode"];
                                                                                                          id v582 = v431;
                                                                                                          v437 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v582 forKeys:&v581 count:1];
                                                                                                          id v434 = 0;
                                                                                                          uint64_t v15 = 0;
                                                                                                          *a4 = (id)objc_msgSend(v377, "initWithDomain:code:userInfo:", v378, 2);
                                                                                                          goto LABEL_647;
                                                                                                        }
                                                                                                        id v434 = 0;
                                                                                                        uint64_t v15 = 0;
LABEL_648:
                                                                                                      }
LABEL_649:
                                                                                                    }
LABEL_650:

                                                                                                    goto LABEL_651;
                                                                                                  }
                                                                                                  objc_opt_class();
                                                                                                  if (objc_opt_isKindOfClass())
                                                                                                  {
                                                                                                    id v439 = v317;
LABEL_529:

                                                                                                    goto LABEL_530;
                                                                                                  }
                                                                                                  objc_opt_class();
                                                                                                  if (objc_opt_isKindOfClass())
                                                                                                  {
                                                                                                    id v357 = v317;
                                                                                                    id v439 = [NSNumber numberWithInt:BMMomentsEventDataSuggestedEventCategoryTypeFromString(v357)];

                                                                                                    goto LABEL_529;
                                                                                                  }
                                                                                                  if (a4)
                                                                                                  {
                                                                                                    id v371 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                                    uint64_t v372 = *MEMORY[0x1E4F502C8];
                                                                                                    uint64_t v587 = *MEMORY[0x1E4F28568];
                                                                                                    id v438 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"suggestedEventCategory"];
                                                                                                    id v588 = v438;
                                                                                                    v444 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v588 forKeys:&v587 count:1];
                                                                                                    id v439 = 0;
                                                                                                    uint64_t v15 = 0;
                                                                                                    *a4 = (id)objc_msgSend(v371, "initWithDomain:code:userInfo:", v372, 2);
                                                                                                    goto LABEL_650;
                                                                                                  }
                                                                                                  id v439 = 0;
                                                                                                  uint64_t v15 = 0;
LABEL_651:
                                                                                                }
LABEL_652:

                                                                                                v352 = v443;
                                                                                              }
LABEL_653:

                                                                                              id v7 = v490;
                                                                                              id v42 = v503;
                                                                                              id v5 = v315;
                                                                                              v349 = v447;
                                                                                              v346 = v445;
                                                                                            }
LABEL_654:

                                                                                            long long v13 = v543;
                                                                                            uint64_t v71 = v542;
                                                                                            v22 = v548;
                                                                                            uint64_t v72 = v539;
LABEL_655:

LABEL_656:
LABEL_657:

LABEL_658:
LABEL_660:

LABEL_661:
                                                                                            v306 = v458;
LABEL_662:

LABEL_663:
LABEL_665:

LABEL_666:
LABEL_667:

LABEL_668:
LABEL_669:

LABEL_670:
LABEL_671:

LABEL_672:
LABEL_673:

LABEL_674:
LABEL_675:

LABEL_676:
                                                                                            goto LABEL_677;
                                                                                          }
                                                                                          objc_opt_class();
                                                                                          if (objc_opt_isKindOfClass())
                                                                                          {
                                                                                            id v448 = v449;
                                                                                            goto LABEL_448;
                                                                                          }
                                                                                          if (a4)
                                                                                          {
                                                                                            id v344 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                            uint64_t v345 = *MEMORY[0x1E4F502C8];
                                                                                            uint64_t v595 = *MEMORY[0x1E4F28568];
                                                                                            v346 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isFamilyInPhotoMoment"];
                                                                                            v596 = v346;
                                                                                            uint64_t v347 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v596 forKeys:&v595 count:1];
                                                                                            v348 = v344;
                                                                                            v349 = (void *)v347;
                                                                                            id v448 = 0;
                                                                                            uint64_t v15 = 0;
                                                                                            *a4 = (id)[v348 initWithDomain:v345 code:2 userInfo:v347];
                                                                                            id v7 = v490;
                                                                                            id v42 = v503;
                                                                                            goto LABEL_654;
                                                                                          }
                                                                                          id v448 = 0;
                                                                                          uint64_t v15 = 0;
LABEL_552:
                                                                                          id v7 = v490;
                                                                                          long long v13 = v543;
                                                                                          uint64_t v71 = v542;
                                                                                          v22 = v548;
                                                                                          uint64_t v72 = v539;
                                                                                          id v42 = v503;
                                                                                          goto LABEL_655;
                                                                                        }
                                                                                        objc_opt_class();
                                                                                        if (objc_opt_isKindOfClass())
                                                                                        {
                                                                                          id v450 = v451;
                                                                                          goto LABEL_445;
                                                                                        }
                                                                                        if (a4)
                                                                                        {
                                                                                          id v342 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                          uint64_t v343 = *MEMORY[0x1E4F502C8];
                                                                                          uint64_t v597 = *MEMORY[0x1E4F28568];
                                                                                          id v448 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numPhotoMomentPersons"];
                                                                                          id v598 = v448;
                                                                                          v449 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v598 forKeys:&v597 count:1];
                                                                                          id v450 = 0;
                                                                                          uint64_t v15 = 0;
                                                                                          *a4 = (id)objc_msgSend(v342, "initWithDomain:code:userInfo:", v343, 2);
                                                                                          goto LABEL_552;
                                                                                        }
                                                                                        id v450 = 0;
                                                                                        uint64_t v15 = 0;
LABEL_548:
                                                                                        id v7 = v490;
                                                                                        long long v13 = v543;
                                                                                        uint64_t v71 = v542;
                                                                                        v22 = v548;
                                                                                        uint64_t v72 = v539;
                                                                                        id v42 = v503;
                                                                                        goto LABEL_656;
                                                                                      }
                                                                                      objc_opt_class();
                                                                                      if (objc_opt_isKindOfClass())
                                                                                      {
                                                                                        id v452 = v453;
                                                                                        goto LABEL_442;
                                                                                      }
                                                                                      if (a4)
                                                                                      {
                                                                                        id v340 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                        uint64_t v341 = *MEMORY[0x1E4F502C8];
                                                                                        uint64_t v599 = *MEMORY[0x1E4F28568];
                                                                                        id v450 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numPhotoMomentPublicEvents"];
                                                                                        id v600 = v450;
                                                                                        v451 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v600 forKeys:&v599 count:1];
                                                                                        id v452 = 0;
                                                                                        uint64_t v15 = 0;
                                                                                        *a4 = (id)objc_msgSend(v340, "initWithDomain:code:userInfo:", v341, 2);
                                                                                        goto LABEL_548;
                                                                                      }
                                                                                      id v452 = 0;
                                                                                      uint64_t v15 = 0;
LABEL_526:
                                                                                      id v7 = v490;
                                                                                      long long v13 = v543;
                                                                                      uint64_t v71 = v542;
                                                                                      v22 = v548;
                                                                                      uint64_t v72 = v539;
                                                                                      id v42 = v503;
                                                                                      goto LABEL_657;
                                                                                    }
                                                                                    objc_opt_class();
                                                                                    if (objc_opt_isKindOfClass())
                                                                                    {
                                                                                      id v455 = v454;
                                                                                      goto LABEL_439;
                                                                                    }
                                                                                    if (a4)
                                                                                    {
                                                                                      id v338 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                      uint64_t v339 = *MEMORY[0x1E4F502C8];
                                                                                      uint64_t v601 = *MEMORY[0x1E4F28568];
                                                                                      id v452 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numPhotoMomentInferences"];
                                                                                      id v602 = v452;
                                                                                      v453 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v602 forKeys:&v601 count:1];
                                                                                      id v455 = 0;
                                                                                      uint64_t v15 = 0;
                                                                                      *a4 = (id)objc_msgSend(v338, "initWithDomain:code:userInfo:", v339, 2);
                                                                                      goto LABEL_526;
                                                                                    }
                                                                                    id v455 = 0;
                                                                                    uint64_t v15 = 0;
                                                                                  }
                                                                                  id v7 = v490;
                                                                                  long long v13 = v543;
                                                                                  uint64_t v71 = v542;
                                                                                  v22 = v548;
                                                                                  uint64_t v72 = v539;
                                                                                  id v42 = v503;
                                                                                  goto LABEL_658;
                                                                                }
                                                                              }
                                                                              if (a4)
                                                                              {
                                                                                id v322 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                                uint64_t v323 = *MEMORY[0x1E4F502C8];
                                                                                uint64_t v607 = *MEMORY[0x1E4F28568];
                                                                                v457 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"photoMomentHolidays"];
                                                                                v608 = v457;
                                                                                uint64_t v324 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v608 forKeys:&v607 count:1];
                                                                                v325 = v322;
                                                                                uint64_t v326 = v323;
LABEL_479:
                                                                                v456 = (void *)v324;
                                                                                long long v13 = v543;
                                                                                uint64_t v71 = v542;
                                                                                uint64_t v72 = v539;
                                                                                id v42 = v503;
                                                                                uint64_t v15 = 0;
                                                                                *a4 = (id)objc_msgSend(v325, "initWithDomain:code:userInfo:", v326, 2);
                                                                                id v458 = v465;
                                                                                id v7 = v490;
                                                                                v22 = v548;

                                                                                goto LABEL_660;
                                                                              }
LABEL_482:
                                                                              uint64_t v15 = 0;
                                                                              v306 = v465;
                                                                              id v7 = v490;
                                                                              long long v13 = v543;
                                                                              uint64_t v71 = v542;
                                                                              v22 = v548;
                                                                              uint64_t v72 = v539;
                                                                              id v42 = v503;
                                                                              goto LABEL_662;
                                                                            }
                                                                            if (!v296
                                                                              || (objc_opt_class(),
                                                                                  (objc_opt_isKindOfClass() & 1) != 0))
                                                                            {
                                                                              id v490 = v7;
                                                                              goto LABEL_424;
                                                                            }
                                                                            id v465 = v296;
                                                                            if (a4)
                                                                            {
                                                                              id v333 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                              uint64_t v334 = *MEMORY[0x1E4F502C8];
                                                                              uint64_t v610 = *MEMORY[0x1E4F28568];
                                                                              v466 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"photoMomentHolidays"];
                                                                              v611 = v466;
                                                                              uint64_t v335 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v611 forKeys:&v610 count:1];
                                                                              uint64_t v15 = 0;
                                                                              *a4 = (id)[v333 initWithDomain:v334 code:2 userInfo:v335];
                                                                              v306 = (void *)v335;
                                                                              long long v13 = v543;
                                                                              uint64_t v71 = v542;
                                                                              v22 = v548;
                                                                              goto LABEL_417;
                                                                            }
                                                                            uint64_t v15 = 0;
                                                                            long long v13 = v543;
                                                                            uint64_t v71 = v542;
                                                                            v22 = v548;
LABEL_466:
                                                                            uint64_t v72 = v539;
                                                                            goto LABEL_663;
                                                                          }
                                                                        }
                                                                      }
                                                                      objc_opt_class();
                                                                      if (objc_opt_isKindOfClass())
                                                                      {
                                                                        id v461 = v240;
                                                                        goto LABEL_340;
                                                                      }
                                                                      if (a4)
                                                                      {
                                                                        id v279 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                        uint64_t v280 = *MEMORY[0x1E4F502C8];
                                                                        uint64_t v621 = *MEMORY[0x1E4F28568];
                                                                        id v459 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"maxDurationOfCallLikeInteractions"];
                                                                        id v622 = v459;
                                                                        uint64_t v281 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v622 forKeys:&v621 count:1];
                                                                        uint64_t v282 = v280;
                                                                        v22 = v548;
                                                                        v460 = (void *)v281;
                                                                        id v461 = 0;
                                                                        uint64_t v15 = 0;
                                                                        *a4 = (id)objc_msgSend(v279, "initWithDomain:code:userInfo:", v282, 2);
                                                                        long long v13 = v543;
                                                                        uint64_t v71 = v542;
                                                                        uint64_t v72 = v539;
                                                                        goto LABEL_666;
                                                                      }
                                                                      id v461 = 0;
                                                                      uint64_t v15 = 0;
LABEL_481:
                                                                      long long v13 = v543;
                                                                      uint64_t v71 = v542;
                                                                      uint64_t v72 = v539;
                                                                      goto LABEL_667;
                                                                    }
                                                                    if (a4)
                                                                    {
                                                                      id v275 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                      uint64_t v276 = *MEMORY[0x1E4F502C8];
                                                                      uint64_t v623 = *MEMORY[0x1E4F28568];
                                                                      id v461 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"minDurationOfCallLikeInteractions"];
                                                                      id v624 = v461;
                                                                      uint64_t v277 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v624 forKeys:&v623 count:1];
                                                                      uint64_t v278 = v276;
                                                                      v22 = v548;
                                                                      v462 = (void *)v277;
                                                                      id v463 = 0;
                                                                      uint64_t v15 = 0;
                                                                      *a4 = (id)objc_msgSend(v275, "initWithDomain:code:userInfo:", v278, 2);
                                                                      goto LABEL_481;
                                                                    }
                                                                    id v463 = 0;
                                                                    uint64_t v15 = 0;
LABEL_472:
                                                                    long long v13 = v543;
                                                                    uint64_t v71 = v542;
                                                                    uint64_t v72 = v539;
                                                                    goto LABEL_668;
                                                                  }
                                                                  if (a4)
                                                                  {
                                                                    id v271 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                    uint64_t v272 = *MEMORY[0x1E4F502C8];
                                                                    uint64_t v625 = *MEMORY[0x1E4F28568];
                                                                    id v463 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"totalDurationOfCallLikeInteractions"];
                                                                    id v626 = v463;
                                                                    uint64_t v273 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v626 forKeys:&v625 count:1];
                                                                    uint64_t v274 = v272;
                                                                    v22 = v548;
                                                                    v464 = (void *)v273;
                                                                    id v467 = 0;
                                                                    uint64_t v15 = 0;
                                                                    *a4 = (id)objc_msgSend(v271, "initWithDomain:code:userInfo:", v274, 2);
                                                                    goto LABEL_472;
                                                                  }
                                                                  id v467 = 0;
                                                                  uint64_t v15 = 0;
LABEL_470:
                                                                  long long v13 = v543;
                                                                  uint64_t v71 = v542;
                                                                  uint64_t v72 = v539;
                                                                  goto LABEL_669;
                                                                }
                                                                if (a4)
                                                                {
                                                                  id v267 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                  uint64_t v268 = *MEMORY[0x1E4F502C8];
                                                                  uint64_t v627 = *MEMORY[0x1E4F28568];
                                                                  id v467 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numVideoLikeInteractions"];
                                                                  id v628 = v467;
                                                                  uint64_t v269 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v628 forKeys:&v627 count:1];
                                                                  uint64_t v270 = v268;
                                                                  v22 = v548;
                                                                  v468 = (void *)v269;
                                                                  id v469 = 0;
                                                                  uint64_t v15 = 0;
                                                                  *a4 = (id)objc_msgSend(v267, "initWithDomain:code:userInfo:", v270, 2);
                                                                  goto LABEL_470;
                                                                }
                                                                id v469 = 0;
                                                                uint64_t v15 = 0;
LABEL_468:
                                                                long long v13 = v543;
                                                                uint64_t v71 = v542;
                                                                uint64_t v72 = v539;
                                                                goto LABEL_670;
                                                              }
                                                              if (a4)
                                                              {
                                                                id v263 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                                uint64_t v264 = *MEMORY[0x1E4F502C8];
                                                                uint64_t v629 = *MEMORY[0x1E4F28568];
                                                                id v469 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numAudioLikeInteractions"];
                                                                id v630 = v469;
                                                                uint64_t v265 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v630 forKeys:&v629 count:1];
                                                                uint64_t v266 = v264;
                                                                v22 = v548;
                                                                v470 = (void *)v265;
                                                                id v471 = 0;
                                                                uint64_t v15 = 0;
                                                                *a4 = (id)objc_msgSend(v263, "initWithDomain:code:userInfo:", v266, 2);
                                                                goto LABEL_468;
                                                              }
                                                              id v471 = 0;
                                                              uint64_t v15 = 0;
LABEL_463:
                                                              long long v13 = v543;
                                                              uint64_t v71 = v542;
                                                              uint64_t v72 = v539;
                                                              goto LABEL_671;
                                                            }
                                                            if (a4)
                                                            {
                                                              id v259 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                              uint64_t v260 = *MEMORY[0x1E4F502C8];
                                                              uint64_t v631 = *MEMORY[0x1E4F28568];
                                                              id v471 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numTextLikeInteractions"];
                                                              id v632 = v471;
                                                              uint64_t v261 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v632 forKeys:&v631 count:1];
                                                              uint64_t v262 = v260;
                                                              v22 = v548;
                                                              v472 = (void *)v261;
                                                              id v474 = 0;
                                                              uint64_t v15 = 0;
                                                              *a4 = (id)objc_msgSend(v259, "initWithDomain:code:userInfo:", v262, 2);
                                                              goto LABEL_463;
                                                            }
                                                            id v474 = 0;
                                                            uint64_t v15 = 0;
LABEL_392:
                                                            long long v13 = v543;
                                                            uint64_t v71 = v542;
                                                            uint64_t v72 = v539;
                                                            goto LABEL_672;
                                                          }
                                                          objc_opt_class();
                                                          if (objc_opt_isKindOfClass())
                                                          {
                                                            id v480 = v226;
                                                            goto LABEL_319;
                                                          }
                                                          if (a4)
                                                          {
                                                            id v251 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                            uint64_t v252 = *MEMORY[0x1E4F502C8];
                                                            uint64_t v635 = *MEMORY[0x1E4F28568];
                                                            id v478 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"textLikeMechanismIncluded"];
                                                            id v636 = v478;
                                                            uint64_t v253 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v636 forKeys:&v635 count:1];
                                                            uint64_t v254 = v252;
                                                            v22 = v548;
                                                            v479 = (void *)v253;
                                                            id v480 = 0;
                                                            uint64_t v15 = 0;
                                                            *a4 = (id)objc_msgSend(v251, "initWithDomain:code:userInfo:", v254, 2);
                                                            long long v13 = v543;
                                                            uint64_t v71 = v542;
                                                            uint64_t v72 = v539;
                                                            id v42 = v503;
                                                            goto LABEL_673;
                                                          }
                                                          id v480 = 0;
                                                          uint64_t v15 = 0;
LABEL_385:
                                                          long long v13 = v543;
                                                          uint64_t v71 = v542;
                                                          uint64_t v72 = v539;
                                                          id v42 = v503;
                                                          goto LABEL_674;
                                                        }
                                                        id obj = v143;
                                                        if (a4)
                                                        {
                                                          id v221 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                          uint64_t v222 = *MEMORY[0x1E4F502C8];
                                                          uint64_t v646 = *MEMORY[0x1E4F28568];
                                                          v524 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"contactIDsInConversation"];
                                                          v647 = v524;
                                                          uint64_t v223 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v647 forKeys:&v646 count:1];
                                                          uint64_t v224 = v222;
                                                          v22 = v548;
                                                          uint64_t v15 = 0;
                                                          *a4 = (id)[v221 initWithDomain:v224 code:2 userInfo:v223];
                                                          id v216 = (void *)v223;
                                                          long long v13 = v543;
                                                          uint64_t v71 = v542;
LABEL_303:
                                                          uint64_t v72 = v539;
                                                          id v42 = v503;
LABEL_678:

                                                          goto LABEL_680;
                                                        }
                                                        uint64_t v15 = 0;
                                                        long long v13 = v543;
                                                        uint64_t v71 = v542;
                                                        uint64_t v72 = v539;
                                                        id v42 = v503;
LABEL_680:

                                                        goto LABEL_681;
                                                      }
                                                      objc_opt_class();
                                                      if (objc_opt_isKindOfClass())
                                                      {
                                                        id v492 = v142;
                                                        goto LABEL_202;
                                                      }
                                                      if (a4)
                                                      {
                                                        id v217 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                        uint64_t v218 = *MEMORY[0x1E4F502C8];
                                                        uint64_t v648 = *MEMORY[0x1E4F28568];
                                                        id obj = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numContacts"];
                                                        id v649 = obj;
                                                        uint64_t v219 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v649 forKeys:&v648 count:1];
                                                        uint64_t v220 = v218;
                                                        v22 = v548;
                                                        v525 = (void *)v219;
                                                        id v492 = 0;
                                                        uint64_t v15 = 0;
                                                        *a4 = (id)objc_msgSend(v217, "initWithDomain:code:userInfo:", v220, 2);
                                                        long long v13 = v543;
                                                        uint64_t v71 = v542;
                                                        uint64_t v72 = v539;
                                                        id v42 = v503;

                                                        goto LABEL_680;
                                                      }
                                                      id v492 = 0;
                                                      uint64_t v15 = 0;
LABEL_348:
                                                      long long v13 = v543;
                                                      uint64_t v71 = v542;
                                                      uint64_t v72 = v539;
                                                      id v42 = v503;
LABEL_681:

                                                      goto LABEL_682;
                                                    }
                                                    if (a4)
                                                    {
                                                      id v212 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                      uint64_t v213 = *MEMORY[0x1E4F502C8];
                                                      uint64_t v650 = *MEMORY[0x1E4F28568];
                                                      id v492 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numThirdPartyMediaPlaySessionsPerDay"];
                                                      id v651 = v492;
                                                      uint64_t v214 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v651 forKeys:&v650 count:1];
                                                      uint64_t v215 = v213;
                                                      v22 = v548;
                                                      v491 = (void *)v214;
                                                      id v493 = 0;
                                                      uint64_t v15 = 0;
                                                      *a4 = (id)objc_msgSend(v212, "initWithDomain:code:userInfo:", v215, 2);
                                                      goto LABEL_348;
                                                    }
                                                    id v493 = 0;
                                                    uint64_t v15 = 0;
LABEL_344:
                                                    long long v13 = v543;
                                                    uint64_t v71 = v542;
                                                    uint64_t v72 = v539;
                                                    id v42 = v503;
LABEL_682:

                                                    goto LABEL_683;
                                                  }
                                                  if (a4)
                                                  {
                                                    id v206 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                    uint64_t v207 = *MEMORY[0x1E4F502C8];
                                                    uint64_t v652 = *MEMORY[0x1E4F28568];
                                                    id v493 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numFirstPartyMediaPlaySessionsPerDay"];
                                                    id v653 = v493;
                                                    uint64_t v208 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v653 forKeys:&v652 count:1];
                                                    uint64_t v209 = v207;
                                                    v22 = v548;
                                                    v494 = (void *)v208;
                                                    id v495 = 0;
                                                    uint64_t v15 = 0;
                                                    *a4 = (id)objc_msgSend(v206, "initWithDomain:code:userInfo:", v209, 2);
                                                    goto LABEL_344;
                                                  }
                                                  id v495 = 0;
                                                  uint64_t v15 = 0;
LABEL_313:
                                                  long long v13 = v543;
                                                  uint64_t v71 = v542;
                                                  uint64_t v72 = v539;
                                                  id v42 = v503;
LABEL_683:

                                                  goto LABEL_684;
                                                }
                                                if (a4)
                                                {
                                                  id v197 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                  uint64_t v198 = *MEMORY[0x1E4F502C8];
                                                  uint64_t v654 = *MEMORY[0x1E4F28568];
                                                  id v495 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"durationVideoMediaPlaySessionsPerDay"];
                                                  id v655 = v495;
                                                  uint64_t v199 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v655 forKeys:&v654 count:1];
                                                  uint64_t v200 = v198;
                                                  v22 = v548;
                                                  v496 = (void *)v199;
                                                  id v497 = 0;
                                                  uint64_t v15 = 0;
                                                  *a4 = (id)objc_msgSend(v197, "initWithDomain:code:userInfo:", v200, 2);
                                                  goto LABEL_313;
                                                }
                                                id v497 = 0;
                                                uint64_t v15 = 0;
LABEL_308:
                                                long long v13 = v543;
                                                uint64_t v71 = v542;
                                                uint64_t v72 = v539;
                                                id v42 = v503;
LABEL_684:

                                                goto LABEL_685;
                                              }
                                              if (a4)
                                              {
                                                id v189 = objc_alloc(MEMORY[0x1E4F28C58]);
                                                uint64_t v190 = *MEMORY[0x1E4F502C8];
                                                uint64_t v656 = *MEMORY[0x1E4F28568];
                                                id v497 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numVideoMediaPlaySessionsPerDay"];
                                                id v657 = v497;
                                                uint64_t v191 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v657 forKeys:&v656 count:1];
                                                uint64_t v192 = v190;
                                                v22 = v548;
                                                v498 = (void *)v191;
                                                id v499 = 0;
                                                uint64_t v15 = 0;
                                                *a4 = (id)objc_msgSend(v189, "initWithDomain:code:userInfo:", v192, 2);
                                                goto LABEL_308;
                                              }
                                              id v499 = 0;
                                              uint64_t v15 = 0;
LABEL_305:
                                              long long v13 = v543;
                                              uint64_t v71 = v542;
                                              uint64_t v72 = v539;
                                              id v42 = v503;
LABEL_685:

                                              goto LABEL_686;
                                            }
                                            if (a4)
                                            {
                                              id v185 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v186 = *MEMORY[0x1E4F502C8];
                                              uint64_t v658 = *MEMORY[0x1E4F28568];
                                              id v499 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"durationAudioMediaPlaySessionsPerDay"];
                                              id v659 = v499;
                                              uint64_t v187 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v659 forKeys:&v658 count:1];
                                              uint64_t v188 = v186;
                                              v22 = v548;
                                              v500 = (void *)v187;
                                              id v501 = 0;
                                              uint64_t v15 = 0;
                                              *a4 = (id)objc_msgSend(v185, "initWithDomain:code:userInfo:", v188, 2);
                                              goto LABEL_305;
                                            }
                                            id v501 = 0;
                                            uint64_t v15 = 0;
LABEL_300:
                                            long long v13 = v543;
                                            uint64_t v71 = v542;
                                            uint64_t v72 = v539;
                                            id v42 = v503;
LABEL_686:

                                            goto LABEL_687;
                                          }
                                          if (a4)
                                          {
                                            id v167 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v168 = *MEMORY[0x1E4F502C8];
                                            uint64_t v660 = *MEMORY[0x1E4F28568];
                                            id v501 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numAudioMediaPlaySessionsPerDay"];
                                            id v661 = v501;
                                            uint64_t v169 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v661 forKeys:&v660 count:1];
                                            uint64_t v170 = v168;
                                            v22 = v548;
                                            v502 = (void *)v169;
                                            id v504 = 0;
                                            uint64_t v15 = 0;
                                            *a4 = (id)objc_msgSend(v167, "initWithDomain:code:userInfo:", v170, 2);
                                            goto LABEL_300;
                                          }
                                          id v504 = 0;
                                          uint64_t v15 = 0;
                                          long long v13 = v543;
                                          uint64_t v71 = v542;
                                          uint64_t v72 = v539;
                                          id v42 = v503;
LABEL_687:

                                          goto LABEL_688;
                                        }
                                        if (a4)
                                        {
                                          id v156 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          uint64_t v157 = *MEMORY[0x1E4F502C8];
                                          uint64_t v662 = *MEMORY[0x1E4F28568];
                                          id v504 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"mediaPlayerBundleID"];
                                          id v663 = v504;
                                          uint64_t v158 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v663 forKeys:&v662 count:1];
                                          uint64_t v159 = v157;
                                          v22 = v548;
                                          v506 = (void *)v158;
                                          id v507 = 0;
                                          uint64_t v15 = 0;
                                          *a4 = (id)objc_msgSend(v156, "initWithDomain:code:userInfo:", v159, 2);
                                          long long v13 = v543;
                                          uint64_t v71 = v542;
                                          uint64_t v72 = v539;
                                          goto LABEL_687;
                                        }
                                        id v507 = 0;
                                        uint64_t v15 = 0;
                                        long long v13 = v543;
                                        uint64_t v71 = v542;
                                        uint64_t v72 = v539;
LABEL_688:

                                        goto LABEL_689;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v126 = v89;
                                        id v509 = [NSNumber numberWithInt:BMMomentsEventDataSourceAppTypeFromString(v126)];

                                        goto LABEL_177;
                                      }
                                      if (a4)
                                      {
                                        id v193 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v194 = *MEMORY[0x1E4F502C8];
                                        uint64_t v664 = *MEMORY[0x1E4F28568];
                                        id v507 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"sourceParty"];
                                        id v665 = v507;
                                        uint64_t v195 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v665 forKeys:&v664 count:1];
                                        uint64_t v196 = v194;
                                        v22 = v548;
                                        v508 = (void *)v195;
                                        id v509 = 0;
                                        uint64_t v15 = 0;
                                        *a4 = (id)objc_msgSend(v193, "initWithDomain:code:userInfo:", v196, 2);
                                        long long v13 = v543;
                                        uint64_t v71 = v542;
                                        uint64_t v72 = v539;
                                        goto LABEL_688;
                                      }
                                      id v509 = 0;
                                      uint64_t v15 = 0;
                                      long long v13 = v543;
                                      uint64_t v71 = v542;
                                      uint64_t v72 = v539;
LABEL_689:

                                      goto LABEL_690;
                                    }
                                    if (a4)
                                    {
                                      id v106 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v107 = *MEMORY[0x1E4F502C8];
                                      uint64_t v666 = *MEMORY[0x1E4F28568];
                                      id v509 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"mediaSumTimePlayed"];
                                      id v667 = v509;
                                      uint64_t v108 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v667 forKeys:&v666 count:1];
                                      uint64_t v109 = v107;
                                      v22 = v548;
                                      v510 = (void *)v108;
                                      id v511 = 0;
                                      uint64_t v15 = 0;
                                      *a4 = (id)objc_msgSend(v106, "initWithDomain:code:userInfo:", v109, 2);
                                      long long v13 = v543;
                                      uint64_t v71 = v542;
                                      uint64_t v72 = v539;
                                      goto LABEL_689;
                                    }
                                    id v511 = 0;
                                    uint64_t v15 = 0;
LABEL_272:
                                    long long v13 = v543;
                                    uint64_t v71 = v542;
                                    uint64_t v72 = v539;
LABEL_690:

                                    goto LABEL_691;
                                  }
                                  if (a4)
                                  {
                                    id v94 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v95 = *MEMORY[0x1E4F502C8];
                                    uint64_t v668 = *MEMORY[0x1E4F28568];
                                    id v511 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"mediaRepetitions"];
                                    id v669 = v511;
                                    uint64_t v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v669 forKeys:&v668 count:1];
                                    uint64_t v97 = v95;
                                    v22 = v548;
                                    v512 = (void *)v96;
                                    id v513 = 0;
                                    uint64_t v15 = 0;
                                    *a4 = (id)objc_msgSend(v94, "initWithDomain:code:userInfo:", v97, 2);
                                    goto LABEL_272;
                                  }
                                  id v513 = 0;
                                  uint64_t v15 = 0;
                                  long long v13 = v543;
                                  uint64_t v71 = v542;
                                  uint64_t v72 = v539;
LABEL_691:

                                  goto LABEL_692;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v83 = v78;
                                  id v515 = [NSNumber numberWithInt:BMMomentsEventDataMediaTypeFromString(v83)];

                                  goto LABEL_141;
                                }
                                if (a4)
                                {
                                  id v171 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  uint64_t v172 = *MEMORY[0x1E4F502C8];
                                  uint64_t v670 = *MEMORY[0x1E4F28568];
                                  id v513 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"mediaType"];
                                  id v671 = v513;
                                  uint64_t v173 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v671 forKeys:&v670 count:1];
                                  uint64_t v174 = v172;
                                  v22 = v548;
                                  v514 = (void *)v173;
                                  id v515 = 0;
                                  uint64_t v15 = 0;
                                  *a4 = (id)objc_msgSend(v171, "initWithDomain:code:userInfo:", v174, 2);
                                  long long v13 = v543;
                                  uint64_t v71 = v542;
                                  uint64_t v72 = v539;
                                  goto LABEL_691;
                                }
                                id v515 = 0;
                                uint64_t v15 = 0;
                                long long v13 = v543;
                                uint64_t v71 = v542;
                                uint64_t v72 = v539;
LABEL_692:

                                goto LABEL_693;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v76 = v66;
                                id v517 = [NSNumber numberWithInt:BMMomentsEventDataGenreTypeFromString(v76)];

                                goto LABEL_131;
                              }
                              if (a4)
                              {
                                id v163 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v164 = *MEMORY[0x1E4F502C8];
                                uint64_t v672 = *MEMORY[0x1E4F28568];
                                id v515 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"mediaGenre"];
                                id v673 = v515;
                                uint64_t v165 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v673 forKeys:&v672 count:1];
                                uint64_t v166 = v164;
                                v22 = v548;
                                v516 = (void *)v165;
                                id v517 = 0;
                                uint64_t v15 = 0;
                                *a4 = (id)objc_msgSend(v163, "initWithDomain:code:userInfo:", v166, 2);
                                long long v13 = v543;
                                uint64_t v71 = v542;
                                uint64_t v72 = v539;
                                goto LABEL_692;
                              }
                              id v517 = 0;
                              uint64_t v15 = 0;
                              long long v13 = v543;
                              uint64_t v71 = v542;
                              uint64_t v72 = v539;
LABEL_693:

                              goto LABEL_694;
                            }
                            if (a4)
                            {
                              id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v68 = *MEMORY[0x1E4F502C8];
                              uint64_t v674 = *MEMORY[0x1E4F28568];
                              id v517 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"workoutBundleID"];
                              id v675 = v517;
                              uint64_t v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v675 forKeys:&v674 count:1];
                              uint64_t v70 = v68;
                              v22 = v548;
                              v518 = (void *)v69;
                              id v519 = 0;
                              uint64_t v15 = 0;
                              *a4 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v70, 2);
                              long long v13 = v543;
                              uint64_t v71 = v542;
                              uint64_t v72 = v539;
                              goto LABEL_693;
                            }
                            id v519 = 0;
                            uint64_t v15 = 0;
                            long long v13 = v543;
                            uint64_t v71 = v542;
                            uint64_t v72 = v539;
LABEL_694:

                            goto LABEL_695;
                          }
                          id v523 = v5;
                          uint64_t v46 = v6;
                          id v47 = v8;
                          id v48 = v7;
                          id v49 = v42;
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v62 = v61;
                            id v521 = [NSNumber numberWithInt:BMMomentsEventDataWorkoutActivityTypeFromString(v62)];

                            id v7 = v48;
                            v8 = v47;
                            uint64_t v6 = v46;
                            id v5 = v523;
                            goto LABEL_103;
                          }
                          if (a4)
                          {
                            id v114 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v115 = *MEMORY[0x1E4F502C8];
                            uint64_t v676 = *MEMORY[0x1E4F28568];
                            id v519 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"workoutType"];
                            id v677 = v519;
                            uint64_t v116 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v677 forKeys:&v676 count:1];
                            uint64_t v117 = v115;
                            v22 = v548;
                            v520 = (void *)v116;
                            id v521 = 0;
                            uint64_t v15 = 0;
                            *a4 = (id)objc_msgSend(v114, "initWithDomain:code:userInfo:", v117, 2);
                            long long v13 = v543;
                            uint64_t v71 = v542;
                            uint64_t v72 = v539;
                            id v7 = v48;
                            v8 = v47;
                            uint64_t v6 = v46;
                            id v5 = v523;
                            goto LABEL_694;
                          }
                          id v521 = 0;
                          uint64_t v15 = 0;
LABEL_278:
                          long long v13 = v543;
                          uint64_t v71 = v542;
                          uint64_t v72 = v539;
                          id v42 = v49;
                          id v7 = v48;
                          v8 = v47;
                          uint64_t v6 = v46;
                          id v5 = v523;
LABEL_695:

                          goto LABEL_696;
                        }
                        id v523 = v5;
                        uint64_t v46 = v6;
                        id v47 = v8;
                        id v48 = v7;
                        id v49 = v42;
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v59 = v58;
                          id v526 = [NSNumber numberWithInt:BMMomentsEventDataLocationModeTypeFromString(v59)];

                          id v7 = v48;
                          v8 = v47;
                          uint64_t v6 = v46;
                          id v5 = v523;
                          goto LABEL_95;
                        }
                        if (a4)
                        {
                          id v110 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v111 = *MEMORY[0x1E4F502C8];
                          uint64_t v678 = *MEMORY[0x1E4F28568];
                          id v521 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"locationMode"];
                          id v679 = v521;
                          uint64_t v112 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v679 forKeys:&v678 count:1];
                          uint64_t v113 = v111;
                          v22 = v548;
                          v522 = (void *)v112;
                          id v526 = 0;
                          uint64_t v15 = 0;
                          *a4 = (id)objc_msgSend(v110, "initWithDomain:code:userInfo:", v113, 2);
                          goto LABEL_278;
                        }
                        id v526 = 0;
                        uint64_t v15 = 0;
LABEL_274:
                        long long v13 = v543;
                        uint64_t v71 = v542;
                        uint64_t v72 = v539;
                        id v42 = v49;
                        id v7 = v48;
                        v8 = v47;
                        uint64_t v6 = v46;
                        id v5 = v523;
LABEL_696:

                        goto LABEL_697;
                      }
                      id v523 = v5;
                      uint64_t v46 = v6;
                      id v47 = v8;
                      id v48 = v7;
                      id v49 = v42;
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v56 = v55;
                        id v528 = [NSNumber numberWithInt:BMMomentsEventDataPlaceDiscoveryTypeFromString(v56)];

                        id v7 = v48;
                        v8 = v47;
                        uint64_t v6 = v46;
                        id v5 = v523;
                        goto LABEL_87;
                      }
                      if (a4)
                      {
                        id v102 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v103 = *MEMORY[0x1E4F502C8];
                        uint64_t v680 = *MEMORY[0x1E4F28568];
                        id v526 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"placeDiscovery"];
                        id v681 = v526;
                        uint64_t v104 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v681 forKeys:&v680 count:1];
                        uint64_t v105 = v103;
                        v22 = v548;
                        v527 = (void *)v104;
                        id v528 = 0;
                        uint64_t v15 = 0;
                        *a4 = (id)objc_msgSend(v102, "initWithDomain:code:userInfo:", v105, 2);
                        goto LABEL_274;
                      }
                      id v528 = 0;
                      uint64_t v15 = 0;
LABEL_268:
                      long long v13 = v543;
                      uint64_t v71 = v542;
                      uint64_t v72 = v539;
                      id v42 = v49;
                      id v7 = v48;
                      v8 = v47;
                      uint64_t v6 = v46;
                      id v5 = v523;
LABEL_697:

                      goto LABEL_698;
                    }
                    id v523 = v5;
                    uint64_t v46 = v6;
                    id v47 = v8;
                    id v48 = v7;
                    id v49 = v42;
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v53 = v52;
                      id v530 = [NSNumber numberWithInt:BMMomentsEventDataGeoPOICategoryTypeFromString(v53)];

                      id v7 = v48;
                      v8 = v47;
                      uint64_t v6 = v46;
                      id v5 = v523;
                      goto LABEL_79;
                    }
                    if (a4)
                    {
                      id v98 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v99 = *MEMORY[0x1E4F502C8];
                      uint64_t v682 = *MEMORY[0x1E4F28568];
                      id v528 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"poiCategory"];
                      id v683 = v528;
                      uint64_t v100 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v683 forKeys:&v682 count:1];
                      uint64_t v101 = v99;
                      v22 = v548;
                      v529 = (void *)v100;
                      id v530 = 0;
                      uint64_t v15 = 0;
                      *a4 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v101, 2);
                      goto LABEL_268;
                    }
                    id v530 = 0;
                    uint64_t v15 = 0;
LABEL_264:
                    long long v13 = v543;
                    uint64_t v71 = v542;
                    uint64_t v72 = v539;
                    id v42 = v49;
                    id v7 = v48;
                    v8 = v47;
                    uint64_t v6 = v46;
                    id v5 = v523;
LABEL_698:

                    goto LABEL_699;
                  }
                  id v523 = v5;
                  uint64_t v46 = v6;
                  id v47 = v8;
                  id v48 = v7;
                  id v49 = v42;
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v50 = v45;
                    id v532 = [NSNumber numberWithInt:BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeFromString(v50)];

                    id v7 = v48;
                    v8 = v47;
                    uint64_t v6 = v46;
                    id v5 = v523;
                    goto LABEL_71;
                  }
                  if (a4)
                  {
                    id v90 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v91 = *MEMORY[0x1E4F502C8];
                    uint64_t v684 = *MEMORY[0x1E4F28568];
                    id v530 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"placeUserType"];
                    id v685 = v530;
                    uint64_t v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v685 forKeys:&v684 count:1];
                    uint64_t v93 = v91;
                    v22 = v548;
                    v531 = (void *)v92;
                    id v532 = 0;
                    uint64_t v15 = 0;
                    *a4 = (id)objc_msgSend(v90, "initWithDomain:code:userInfo:", v93, 2);
                    goto LABEL_264;
                  }
                  id v532 = 0;
                  uint64_t v15 = 0;
                  long long v13 = v543;
                  uint64_t v71 = v542;
                  uint64_t v72 = v539;
                  id v7 = v48;
                  v8 = v47;
                  uint64_t v6 = v46;
                  id v5 = v523;
LABEL_699:

                  goto LABEL_700;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v43 = v41;
                  id v42 = [NSNumber numberWithInt:BMMomentsEventDataEventCategoryTypeFromString(v43)];

                  goto LABEL_63;
                }
                if (a4)
                {
                  id v79 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v80 = *MEMORY[0x1E4F502C8];
                  uint64_t v686 = *MEMORY[0x1E4F28568];
                  id v532 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"category"];
                  id v687 = v532;
                  uint64_t v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v687 forKeys:&v686 count:1];
                  uint64_t v82 = v80;
                  v22 = v548;
                  v533 = (void *)v81;
                  id v42 = 0;
                  uint64_t v15 = 0;
                  *a4 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v82, 2);
                  long long v13 = v543;
                  uint64_t v71 = v542;
                  uint64_t v72 = v539;
                  goto LABEL_699;
                }
                id v42 = 0;
                uint64_t v15 = 0;
                long long v13 = v543;
                uint64_t v71 = v542;
LABEL_256:
                uint64_t v72 = v539;
LABEL_700:

                goto LABEL_701;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v39 = v38;
                id v535 = [NSNumber numberWithInt:BMMomentsEventDataEventProviderTypeFromString(v39)];

                goto LABEL_55;
              }
              if (a4)
              {
                id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v74 = *MEMORY[0x1E4F502C8];
                uint64_t v688 = *MEMORY[0x1E4F28568];
                id v42 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"provider"];
                id v689 = v42;
                v534 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v689 forKeys:&v688 count:1];
                id v75 = (id)objc_msgSend(v73, "initWithDomain:code:userInfo:", v74, 2);
                id v535 = 0;
                uint64_t v15 = 0;
                *a4 = v75;
                long long v13 = v543;
                uint64_t v71 = v542;
                v22 = v548;
                goto LABEL_256;
              }
              id v535 = 0;
              uint64_t v15 = 0;
LABEL_254:
              long long v13 = v543;
              uint64_t v71 = v542;
              v22 = v548;
              uint64_t v72 = v539;
LABEL_701:

              goto LABEL_702;
            }
            if (a4)
            {
              id v160 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v161 = *MEMORY[0x1E4F502C8];
              uint64_t v690 = *MEMORY[0x1E4F28568];
              id v535 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"expirationDate"];
              id v691 = v535;
              v536 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v691 forKeys:&v690 count:1];
              id v162 = (id)objc_msgSend(v160, "initWithDomain:code:userInfo:", v161, 2);
              id v537 = 0;
              uint64_t v15 = 0;
              *a4 = v162;
              goto LABEL_254;
            }
            id v537 = 0;
            uint64_t v15 = 0;
            long long v13 = v543;
            uint64_t v71 = v542;
            v22 = v548;
LABEL_290:
            uint64_t v72 = v539;
LABEL_702:

            goto LABEL_703;
          }
          if (a4)
          {
            id v151 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v152 = *MEMORY[0x1E4F502C8];
            uint64_t v692 = *MEMORY[0x1E4F28568];
            id v537 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"sourceCreationDate"];
            id v693 = v537;
            uint64_t v153 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v693 forKeys:&v692 count:1];
            v154 = v151;
            v22 = v548;
            v538 = (void *)v153;
            id v155 = (id)objc_msgSend(v154, "initWithDomain:code:userInfo:", v152, 2);
            id v540 = 0;
            uint64_t v15 = 0;
            *a4 = v155;
            long long v13 = v543;
            uint64_t v71 = v542;
            goto LABEL_290;
          }
          id v540 = 0;
          uint64_t v15 = 0;
          long long v13 = v543;
          uint64_t v71 = v542;
          uint64_t v72 = v539;
LABEL_703:

          goto LABEL_704;
        }
        uint64_t v72 = a4;
        if (a4)
        {
          id v146 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v147 = *MEMORY[0x1E4F502C8];
          uint64_t v694 = *MEMORY[0x1E4F28568];
          id v540 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"creationDate"];
          id v695 = v540;
          uint64_t v148 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v695 forKeys:&v694 count:1];
          v149 = v146;
          v22 = v548;
          v541 = (void *)v148;
          id v150 = (id)objc_msgSend(v149, "initWithDomain:code:userInfo:", v147, 2);
          uint64_t v72 = 0;
          uint64_t v15 = 0;
          *a4 = v150;
          long long v13 = v543;
          uint64_t v71 = v542;
          goto LABEL_703;
        }
        uint64_t v15 = 0;
        long long v13 = v543;
        uint64_t v71 = v542;
LABEL_704:

        goto LABEL_705;
      }
      if (a4)
      {
        id v121 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v122 = *MEMORY[0x1E4F502C8];
        uint64_t v696 = *MEMORY[0x1E4F28568];
        uint64_t v72 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"endDate"];
        v697 = v72;
        uint64_t v123 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v697 forKeys:&v696 count:1];
        int v124 = v121;
        v22 = (void *)v123;
        id v125 = (id)[v124 initWithDomain:v122 code:2 userInfo:v123];
        uint64_t v71 = 0;
        uint64_t v15 = 0;
        *a4 = v125;
        long long v13 = v543;
        goto LABEL_704;
      }
      uint64_t v71 = 0;
      uint64_t v15 = 0;
      long long v13 = v543;
LABEL_705:

      goto LABEL_706;
    }
    if (a4)
    {
      id v118 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v119 = *MEMORY[0x1E4F502C8];
      uint64_t v698 = *MEMORY[0x1E4F28568];
      uint64_t v71 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"startDate"];
      v699 = v71;
      v544 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v699 forKeys:&v698 count:1];
      id v120 = (id)objc_msgSend(v118, "initWithDomain:code:userInfo:", v119, 2);
      long long v13 = 0;
      uint64_t v15 = 0;
      *a4 = v120;
      goto LABEL_705;
    }
    long long v13 = 0;
    uint64_t v15 = 0;
LABEL_706:

    goto LABEL_707;
  }
  if (a4)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v12 = *MEMORY[0x1E4F502C8];
    uint64_t v700 = *MEMORY[0x1E4F28568];
    long long v13 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"eventIdentifier"];
    v701[0] = v13;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v701 forKeys:&v700 count:1];
    id v14 = (id)[v11 initWithDomain:v12 code:2 userInfo:v8];
    id v7 = 0;
    uint64_t v15 = 0;
    *a4 = v14;
    goto LABEL_706;
  }
  id v7 = 0;
  uint64_t v15 = 0;
LABEL_707:

  return v15;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMomentsEventDataEvent *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_eventIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_startDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_endDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_creationDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_sourceCreationDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_expirationDate) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_workoutBundleID) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasMediaRepetitions) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasMediaSumTimePlayed) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteUint32Field();
  if (self->_mediaPlayerBundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasNumAudioMediaPlaySessionsPerDay) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasDurationAudioMediaPlaySessionsPerDay) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasNumVideoMediaPlaySessionsPerDay) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasDurationVideoMediaPlaySessionsPerDay) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasNumFirstPartyMediaPlaySessionsPerDay) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasNumThirdPartyMediaPlaySessionsPerDay) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasNumContacts) {
    PBDataWriterWriteInt32Field();
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = self->_contactIDsInConversation;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v7);
  }

  if (self->_contactIDMostSignificantInConversation) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasInteractionContactScore) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasTextLikeMechanismIncluded) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasCallLikeMechanismIncluded) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasNumTextLikeInteractions) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasNumAudioLikeInteractions) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasNumVideoLikeInteractions) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasTotalDurationOfCallLikeInteractions) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasMinDurationOfCallLikeInteractions) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasMaxDurationOfCallLikeInteractions) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = self->_photoMomentInferences;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
        uint64_t v25 = 0;
        PBDataWriterPlaceMark();
        [v15 writeTo:v4];
        PBDataWriterRecallMark();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v12);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = self->_photoMomentHolidays;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v34 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteStringField();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v34 count:16];
    }
    while (v18);
  }

  if (self->_hasNumPhotoMomentHolidays) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasNumPhotoMomentInferences) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasNumPhotoMomentPublicEvents) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasNumPhotoMomentPersons) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasIsFamilyInPhotoMoment) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasMomentIncludesFavoritedAsset) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasMomentIncludesVideo) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasMomentIncludesPhoto) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasNumAttendees) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasNumtripParts) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasNumScoredTopics) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasNumItemAuthors) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasNumItemRecipients) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasIsGatheringComplete) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_gaPR)
  {
    uint64_t v25 = 0;
    PBDataWriterPlaceMark();
    -[BMMomentsEventDataPR writeTo:](self->_gaPR, "writeTo:", v4, v21);
    PBDataWriterRecallMark();
  }
  if (self->_hasPCount) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v346.receiver = self;
  v346.super_class = (Class)BMMomentsEventDataEvent;
  id v5 = [(BMEventBase *)&v346 init];
  if (!v5) {
    goto LABEL_605;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (int *)MEMORY[0x1E4F940E8];
  id v10 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v11 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v12 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v11]) {
        break;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v9;
        uint64_t v17 = *(void *)&v4[v16];
        unint64_t v18 = v17 + 1;
        if (v17 == -1 || v18 > *(void *)&v4[*v10]) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)&v4[*v12] + v17);
        *(void *)&v4[v16] = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0) {
          goto LABEL_13;
        }
        v13 += 7;
        BOOL v20 = v14++ >= 9;
        if (v20)
        {
          unint64_t v15 = 0;
          int v21 = v4[*v11];
          goto LABEL_15;
        }
      }
      v4[*v11] = 1;
LABEL_13:
      int v21 = v4[*v11];
      if (v4[*v11]) {
        unint64_t v15 = 0;
      }
LABEL_15:
      if (v21 || (v15 & 7) == 4) {
        break;
      }
      switch((v15 >> 3))
      {
        case 1u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 288;
          goto LABEL_168;
        case 2u:
          v5->_hasRaw_startDate = 1;
          uint64_t v25 = *v9;
          unint64_t v26 = *(void *)&v4[v25];
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(void *)&v4[*v10])
          {
            long long v27 = *(objc_class **)(*(void *)&v4[*v12] + v26);
            *(void *)&v4[v25] = v26 + 8;
          }
          else
          {
            v4[*v11] = 1;
            long long v27 = 0;
          }
          uint64_t v336 = 24;
          goto LABEL_601;
        case 3u:
          v5->_hasRaw_endDate = 1;
          uint64_t v28 = *v9;
          unint64_t v29 = *(void *)&v4[v28];
          if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)&v4[*v10])
          {
            long long v27 = *(objc_class **)(*(void *)&v4[*v12] + v29);
            *(void *)&v4[v28] = v29 + 8;
          }
          else
          {
            v4[*v11] = 1;
            long long v27 = 0;
          }
          uint64_t v336 = 40;
          goto LABEL_601;
        case 4u:
          v5->_hasRaw_creationDate = 1;
          uint64_t v30 = *v9;
          unint64_t v31 = *(void *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)&v4[*v10])
          {
            long long v27 = *(objc_class **)(*(void *)&v4[*v12] + v31);
            *(void *)&v4[v30] = v31 + 8;
          }
          else
          {
            v4[*v11] = 1;
            long long v27 = 0;
          }
          uint64_t v336 = 56;
          goto LABEL_601;
        case 5u:
          v5->_hasRaw_sourceCreationDate = 1;
          uint64_t v32 = *v9;
          unint64_t v33 = *(void *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)&v4[*v10])
          {
            long long v27 = *(objc_class **)(*(void *)&v4[*v12] + v33);
            *(void *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v11] = 1;
            long long v27 = 0;
          }
          uint64_t v336 = 72;
          goto LABEL_601;
        case 6u:
          v5->_hasRaw_expirationDate = 1;
          uint64_t v34 = *v9;
          unint64_t v35 = *(void *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)&v4[*v10])
          {
            long long v27 = *(objc_class **)(*(void *)&v4[*v12] + v35);
            *(void *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v11] = 1;
            long long v27 = 0;
          }
          uint64_t v336 = 88;
          goto LABEL_601;
        case 7u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v38 = 0;
          while (2)
          {
            uint64_t v39 = *v9;
            uint64_t v40 = *(void *)&v4[v39];
            unint64_t v41 = v40 + 1;
            if (v40 == -1 || v41 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v42 = *(unsigned char *)(*(void *)&v4[*v12] + v40);
              *(void *)&v4[v39] = v41;
              v38 |= (unint64_t)(v42 & 0x7F) << v36;
              if (v42 < 0)
              {
                v36 += 7;
                BOOL v20 = v37++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_376;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v38) = 0;
          }
LABEL_376:
          if (v38 >= 0xC) {
            LODWORD(v38) = 0;
          }
          uint64_t v330 = 140;
          goto LABEL_578;
        case 8u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v38 = 0;
          while (2)
          {
            uint64_t v45 = *v9;
            uint64_t v46 = *(void *)&v4[v45];
            unint64_t v47 = v46 + 1;
            if (v46 == -1 || v47 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v48 = *(unsigned char *)(*(void *)&v4[*v12] + v46);
              *(void *)&v4[v45] = v47;
              v38 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                BOOL v20 = v44++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_382;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v38) = 0;
          }
LABEL_382:
          if (v38 >= 0x19) {
            LODWORD(v38) = 0;
          }
          uint64_t v330 = 144;
          goto LABEL_578;
        case 9u:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v51 = 0;
          while (2)
          {
            uint64_t v52 = *v9;
            uint64_t v53 = *(void *)&v4[v52];
            unint64_t v54 = v53 + 1;
            if (v53 == -1 || v54 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v55 = *(unsigned char *)(*(void *)&v4[*v12] + v53);
              *(void *)&v4[v52] = v54;
              v51 |= (unint64_t)(v55 & 0x7F) << v49;
              if (v55 < 0)
              {
                v49 += 7;
                BOOL v20 = v50++ >= 9;
                if (v20)
                {
                  uint64_t v56 = 0;
                  goto LABEL_389;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v56 = 0;
          }
          else {
            uint64_t v56 = v51;
          }
LABEL_389:
          int v331 = BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeDecode(v56);
          uint64_t v332 = 148;
          goto LABEL_413;
        case 0xAu:
          char v57 = 0;
          unsigned int v58 = 0;
          uint64_t v38 = 0;
          while (2)
          {
            uint64_t v59 = *v9;
            uint64_t v60 = *(void *)&v4[v59];
            unint64_t v61 = v60 + 1;
            if (v60 == -1 || v61 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v62 = *(unsigned char *)(*(void *)&v4[*v12] + v60);
              *(void *)&v4[v59] = v61;
              v38 |= (unint64_t)(v62 & 0x7F) << v57;
              if (v62 < 0)
              {
                v57 += 7;
                BOOL v20 = v58++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_393;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v38) = 0;
          }
LABEL_393:
          if (v38 >= 0x4E) {
            LODWORD(v38) = 0;
          }
          uint64_t v330 = 152;
          goto LABEL_578;
        case 0xBu:
          char v63 = 0;
          unsigned int v64 = 0;
          uint64_t v38 = 0;
          while (2)
          {
            uint64_t v65 = *v9;
            uint64_t v66 = *(void *)&v4[v65];
            unint64_t v67 = v66 + 1;
            if (v66 == -1 || v67 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v68 = *(unsigned char *)(*(void *)&v4[*v12] + v66);
              *(void *)&v4[v65] = v67;
              v38 |= (unint64_t)(v68 & 0x7F) << v63;
              if (v68 < 0)
              {
                v63 += 7;
                BOOL v20 = v64++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_399;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v38) = 0;
          }
LABEL_399:
          if (v38 >= 3) {
            LODWORD(v38) = 0;
          }
          uint64_t v330 = 156;
          goto LABEL_578;
        case 0xCu:
          char v69 = 0;
          unsigned int v70 = 0;
          uint64_t v38 = 0;
          while (2)
          {
            uint64_t v71 = *v9;
            uint64_t v72 = *(void *)&v4[v71];
            unint64_t v73 = v72 + 1;
            if (v72 == -1 || v73 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v74 = *(unsigned char *)(*(void *)&v4[*v12] + v72);
              *(void *)&v4[v71] = v73;
              v38 |= (unint64_t)(v74 & 0x7F) << v69;
              if (v74 < 0)
              {
                v69 += 7;
                BOOL v20 = v70++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_405;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v38) = 0;
          }
LABEL_405:
          if (v38 >= 3) {
            LODWORD(v38) = 0;
          }
          uint64_t v330 = 160;
          goto LABEL_578;
        case 0xDu:
          char v75 = 0;
          unsigned int v76 = 0;
          uint64_t v77 = 0;
          while (2)
          {
            uint64_t v78 = *v9;
            uint64_t v79 = *(void *)&v4[v78];
            unint64_t v80 = v79 + 1;
            if (v79 == -1 || v80 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v81 = *(unsigned char *)(*(void *)&v4[*v12] + v79);
              *(void *)&v4[v78] = v80;
              v77 |= (unint64_t)(v81 & 0x7F) << v75;
              if (v81 < 0)
              {
                v75 += 7;
                BOOL v20 = v76++ >= 9;
                if (v20)
                {
                  uint64_t v82 = 0;
                  goto LABEL_412;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v82 = 0;
          }
          else {
            uint64_t v82 = v77;
          }
LABEL_412:
          int v331 = BMMomentsEventDataWorkoutActivityTypeDecode(v82);
          uint64_t v332 = 164;
LABEL_413:
          *(_DWORD *)((char *)&v5->super.super.isa + v332) = v331;
          continue;
        case 0xEu:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 296;
          goto LABEL_168;
        case 0xFu:
          char v83 = 0;
          unsigned int v84 = 0;
          uint64_t v38 = 0;
          while (2)
          {
            uint64_t v85 = *v9;
            uint64_t v86 = *(void *)&v4[v85];
            unint64_t v87 = v86 + 1;
            if (v86 == -1 || v87 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v88 = *(unsigned char *)(*(void *)&v4[*v12] + v86);
              *(void *)&v4[v85] = v87;
              v38 |= (unint64_t)(v88 & 0x7F) << v83;
              if (v88 < 0)
              {
                v83 += 7;
                BOOL v20 = v84++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_417;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v38) = 0;
          }
LABEL_417:
          if (v38 >= 0x1D) {
            LODWORD(v38) = 0;
          }
          uint64_t v330 = 168;
          goto LABEL_578;
        case 0x10u:
          char v89 = 0;
          unsigned int v90 = 0;
          uint64_t v38 = 0;
          while (2)
          {
            uint64_t v91 = *v9;
            uint64_t v92 = *(void *)&v4[v91];
            unint64_t v93 = v92 + 1;
            if (v92 == -1 || v93 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v94 = *(unsigned char *)(*(void *)&v4[*v12] + v92);
              *(void *)&v4[v91] = v93;
              v38 |= (unint64_t)(v94 & 0x7F) << v89;
              if (v94 < 0)
              {
                v89 += 7;
                BOOL v20 = v90++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_423;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v38) = 0;
          }
LABEL_423:
          if (v38 >= 9) {
            LODWORD(v38) = 0;
          }
          uint64_t v330 = 172;
          goto LABEL_578;
        case 0x11u:
          char v95 = 0;
          unsigned int v96 = 0;
          uint64_t v97 = 0;
          v5->_hasMediaRepetitions = 1;
          while (2)
          {
            uint64_t v98 = *v9;
            uint64_t v99 = *(void *)&v4[v98];
            unint64_t v100 = v99 + 1;
            if (v99 == -1 || v100 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v101 = *(unsigned char *)(*(void *)&v4[*v12] + v99);
              *(void *)&v4[v98] = v100;
              v97 |= (unint64_t)(v101 & 0x7F) << v95;
              if (v101 < 0)
              {
                v95 += 7;
                BOOL v20 = v96++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_429;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_429:
          uint64_t v333 = 176;
          goto LABEL_559;
        case 0x12u:
          char v102 = 0;
          unsigned int v103 = 0;
          uint64_t v97 = 0;
          v5->_hasMediaSumTimePlayed = 1;
          while (2)
          {
            uint64_t v104 = *v9;
            uint64_t v105 = *(void *)&v4[v104];
            unint64_t v106 = v105 + 1;
            if (v105 == -1 || v106 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v107 = *(unsigned char *)(*(void *)&v4[*v12] + v105);
              *(void *)&v4[v104] = v106;
              v97 |= (unint64_t)(v107 & 0x7F) << v102;
              if (v107 < 0)
              {
                v102 += 7;
                BOOL v20 = v103++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_433;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_433:
          uint64_t v333 = 180;
          goto LABEL_559;
        case 0x13u:
          char v108 = 0;
          unsigned int v109 = 0;
          uint64_t v110 = 0;
          while (2)
          {
            uint64_t v111 = *v9;
            uint64_t v112 = *(void *)&v4[v111];
            unint64_t v113 = v112 + 1;
            if (v112 == -1 || v113 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v114 = *(unsigned char *)(*(void *)&v4[*v12] + v112);
              *(void *)&v4[v111] = v113;
              v110 |= (unint64_t)(v114 & 0x7F) << v108;
              if (v114 < 0)
              {
                v108 += 7;
                if (v109++ > 8)
                {
                  unsigned int v116 = 0;
                  goto LABEL_439;
                }
                continue;
              }
            }
            break;
          }
          unsigned int v116 = 0;
          if (v4[*v11]) {
            LODWORD(v110) = 0;
          }
          if (v110 <= 4) {
            unsigned int v116 = dword_1B35D6F50[v110];
          }
LABEL_439:
          v5->_sourceParty = v116;
          continue;
        case 0x14u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 304;
          goto LABEL_168;
        case 0x15u:
          char v117 = 0;
          unsigned int v118 = 0;
          uint64_t v97 = 0;
          v5->_hasNumAudioMediaPlaySessionsPerDay = 1;
          while (2)
          {
            uint64_t v119 = *v9;
            uint64_t v120 = *(void *)&v4[v119];
            unint64_t v121 = v120 + 1;
            if (v120 == -1 || v121 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v122 = *(unsigned char *)(*(void *)&v4[*v12] + v120);
              *(void *)&v4[v119] = v121;
              v97 |= (unint64_t)(v122 & 0x7F) << v117;
              if (v122 < 0)
              {
                v117 += 7;
                BOOL v20 = v118++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_443;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_443:
          uint64_t v333 = 188;
          goto LABEL_559;
        case 0x16u:
          v5->_hasDurationAudioMediaPlaySessionsPerDay = 1;
          uint64_t v123 = *v9;
          unint64_t v124 = *(void *)&v4[v123];
          if (v124 <= 0xFFFFFFFFFFFFFFF7 && v124 + 8 <= *(void *)&v4[*v10])
          {
            long long v27 = *(objc_class **)(*(void *)&v4[*v12] + v124);
            *(void *)&v4[v123] = v124 + 8;
          }
          else
          {
            v4[*v11] = 1;
            long long v27 = 0;
          }
          uint64_t v336 = 312;
          goto LABEL_601;
        case 0x17u:
          char v125 = 0;
          unsigned int v126 = 0;
          uint64_t v97 = 0;
          v5->_hasNumVideoMediaPlaySessionsPerDay = 1;
          while (2)
          {
            uint64_t v127 = *v9;
            uint64_t v128 = *(void *)&v4[v127];
            unint64_t v129 = v128 + 1;
            if (v128 == -1 || v129 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v130 = *(unsigned char *)(*(void *)&v4[*v12] + v128);
              *(void *)&v4[v127] = v129;
              v97 |= (unint64_t)(v130 & 0x7F) << v125;
              if (v130 < 0)
              {
                v125 += 7;
                BOOL v20 = v126++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_447;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_447:
          uint64_t v333 = 192;
          goto LABEL_559;
        case 0x18u:
          v5->_hasDurationVideoMediaPlaySessionsPerDay = 1;
          uint64_t v131 = *v9;
          unint64_t v132 = *(void *)&v4[v131];
          if (v132 <= 0xFFFFFFFFFFFFFFF7 && v132 + 8 <= *(void *)&v4[*v10])
          {
            long long v27 = *(objc_class **)(*(void *)&v4[*v12] + v132);
            *(void *)&v4[v131] = v132 + 8;
          }
          else
          {
            v4[*v11] = 1;
            long long v27 = 0;
          }
          uint64_t v336 = 320;
          goto LABEL_601;
        case 0x19u:
          char v133 = 0;
          unsigned int v134 = 0;
          uint64_t v97 = 0;
          v5->_hasNumFirstPartyMediaPlaySessionsPerDay = 1;
          while (2)
          {
            uint64_t v135 = *v9;
            uint64_t v136 = *(void *)&v4[v135];
            unint64_t v137 = v136 + 1;
            if (v136 == -1 || v137 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v138 = *(unsigned char *)(*(void *)&v4[*v12] + v136);
              *(void *)&v4[v135] = v137;
              v97 |= (unint64_t)(v138 & 0x7F) << v133;
              if (v138 < 0)
              {
                v133 += 7;
                BOOL v20 = v134++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_451;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_451:
          uint64_t v333 = 196;
          goto LABEL_559;
        case 0x1Au:
          char v139 = 0;
          unsigned int v140 = 0;
          uint64_t v97 = 0;
          v5->_hasNumThirdPartyMediaPlaySessionsPerDay = 1;
          while (2)
          {
            uint64_t v141 = *v9;
            uint64_t v142 = *(void *)&v4[v141];
            unint64_t v143 = v142 + 1;
            if (v142 == -1 || v143 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v144 = *(unsigned char *)(*(void *)&v4[*v12] + v142);
              *(void *)&v4[v141] = v143;
              v97 |= (unint64_t)(v144 & 0x7F) << v139;
              if (v144 < 0)
              {
                v139 += 7;
                BOOL v20 = v140++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_455;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_455:
          uint64_t v333 = 200;
          goto LABEL_559;
        case 0x1Bu:
          char v145 = 0;
          unsigned int v146 = 0;
          uint64_t v97 = 0;
          v5->_hasNumContacts = 1;
          while (2)
          {
            uint64_t v147 = *v9;
            uint64_t v148 = *(void *)&v4[v147];
            unint64_t v149 = v148 + 1;
            if (v148 == -1 || v149 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v150 = *(unsigned char *)(*(void *)&v4[*v12] + v148);
              *(void *)&v4[v147] = v149;
              v97 |= (unint64_t)(v150 & 0x7F) << v145;
              if (v150 < 0)
              {
                v145 += 7;
                BOOL v20 = v146++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_459;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_459:
          uint64_t v333 = 204;
          goto LABEL_559;
        case 0x1Cu:
          uint64_t v151 = PBReaderReadString();
          if (!v151) {
            goto LABEL_607;
          }
          uint64_t v152 = (void *)v151;
          uint64_t v153 = v6;
          goto LABEL_228;
        case 0x1Du:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 336;
LABEL_168:
          v154 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        case 0x1Eu:
          v5->_hasInteractionContactScore = 1;
          uint64_t v155 = *v9;
          unint64_t v156 = *(void *)&v4[v155];
          if (v156 <= 0xFFFFFFFFFFFFFFF7 && v156 + 8 <= *(void *)&v4[*v10])
          {
            long long v27 = *(objc_class **)(*(void *)&v4[*v12] + v156);
            *(void *)&v4[v155] = v156 + 8;
          }
          else
          {
            v4[*v11] = 1;
            long long v27 = 0;
          }
          uint64_t v336 = 344;
          goto LABEL_601;
        case 0x1Fu:
          char v157 = 0;
          unsigned int v158 = 0;
          uint64_t v159 = 0;
          v5->_hasTextLikeMechanismIncluded = 1;
          while (2)
          {
            uint64_t v160 = *v9;
            uint64_t v161 = *(void *)&v4[v160];
            unint64_t v162 = v161 + 1;
            if (v161 == -1 || v162 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v163 = *(unsigned char *)(*(void *)&v4[*v12] + v161);
              *(void *)&v4[v160] = v162;
              v159 |= (unint64_t)(v163 & 0x7F) << v157;
              if (v163 < 0)
              {
                v157 += 7;
                BOOL v20 = v158++ >= 9;
                if (v20)
                {
                  uint64_t v159 = 0;
                  goto LABEL_463;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v159 = 0;
          }
LABEL_463:
          BOOL v334 = v159 != 0;
          uint64_t v335 = 106;
          goto LABEL_554;
        case 0x20u:
          char v164 = 0;
          unsigned int v165 = 0;
          uint64_t v166 = 0;
          v5->_hasCallLikeMechanismIncluded = 1;
          while (2)
          {
            uint64_t v167 = *v9;
            uint64_t v168 = *(void *)&v4[v167];
            unint64_t v169 = v168 + 1;
            if (v168 == -1 || v169 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v170 = *(unsigned char *)(*(void *)&v4[*v12] + v168);
              *(void *)&v4[v167] = v169;
              v166 |= (unint64_t)(v170 & 0x7F) << v164;
              if (v170 < 0)
              {
                v164 += 7;
                BOOL v20 = v165++ >= 9;
                if (v20)
                {
                  uint64_t v166 = 0;
                  goto LABEL_467;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v166 = 0;
          }
LABEL_467:
          BOOL v334 = v166 != 0;
          uint64_t v335 = 108;
          goto LABEL_554;
        case 0x21u:
          char v171 = 0;
          unsigned int v172 = 0;
          uint64_t v97 = 0;
          v5->_hasNumTextLikeInteractions = 1;
          while (2)
          {
            uint64_t v173 = *v9;
            uint64_t v174 = *(void *)&v4[v173];
            unint64_t v175 = v174 + 1;
            if (v174 == -1 || v175 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v176 = *(unsigned char *)(*(void *)&v4[*v12] + v174);
              *(void *)&v4[v173] = v175;
              v97 |= (unint64_t)(v176 & 0x7F) << v171;
              if (v176 < 0)
              {
                v171 += 7;
                BOOL v20 = v172++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_471;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_471:
          uint64_t v333 = 208;
          goto LABEL_559;
        case 0x22u:
          char v177 = 0;
          unsigned int v178 = 0;
          uint64_t v97 = 0;
          v5->_hasNumAudioLikeInteractions = 1;
          while (2)
          {
            uint64_t v179 = *v9;
            uint64_t v180 = *(void *)&v4[v179];
            unint64_t v181 = v180 + 1;
            if (v180 == -1 || v181 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v182 = *(unsigned char *)(*(void *)&v4[*v12] + v180);
              *(void *)&v4[v179] = v181;
              v97 |= (unint64_t)(v182 & 0x7F) << v177;
              if (v182 < 0)
              {
                v177 += 7;
                BOOL v20 = v178++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_475;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_475:
          uint64_t v333 = 212;
          goto LABEL_559;
        case 0x23u:
          char v183 = 0;
          unsigned int v184 = 0;
          uint64_t v97 = 0;
          v5->_hasNumVideoLikeInteractions = 1;
          while (2)
          {
            uint64_t v185 = *v9;
            uint64_t v186 = *(void *)&v4[v185];
            unint64_t v187 = v186 + 1;
            if (v186 == -1 || v187 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v188 = *(unsigned char *)(*(void *)&v4[*v12] + v186);
              *(void *)&v4[v185] = v187;
              v97 |= (unint64_t)(v188 & 0x7F) << v183;
              if (v188 < 0)
              {
                v183 += 7;
                BOOL v20 = v184++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_479;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_479:
          uint64_t v333 = 216;
          goto LABEL_559;
        case 0x24u:
          v5->_hasTotalDurationOfCallLikeInteractions = 1;
          uint64_t v189 = *v9;
          unint64_t v190 = *(void *)&v4[v189];
          if (v190 <= 0xFFFFFFFFFFFFFFF7 && v190 + 8 <= *(void *)&v4[*v10])
          {
            long long v27 = *(objc_class **)(*(void *)&v4[*v12] + v190);
            *(void *)&v4[v189] = v190 + 8;
          }
          else
          {
            v4[*v11] = 1;
            long long v27 = 0;
          }
          uint64_t v336 = 352;
          goto LABEL_601;
        case 0x25u:
          v5->_hasMinDurationOfCallLikeInteractions = 1;
          uint64_t v191 = *v9;
          unint64_t v192 = *(void *)&v4[v191];
          if (v192 <= 0xFFFFFFFFFFFFFFF7 && v192 + 8 <= *(void *)&v4[*v10])
          {
            long long v27 = *(objc_class **)(*(void *)&v4[*v12] + v192);
            *(void *)&v4[v191] = v192 + 8;
          }
          else
          {
            v4[*v11] = 1;
            long long v27 = 0;
          }
          uint64_t v336 = 360;
          goto LABEL_601;
        case 0x26u:
          v5->_hasMaxDurationOfCallLikeInteractions = 1;
          uint64_t v193 = *v9;
          unint64_t v194 = *(void *)&v4[v193];
          if (v194 <= 0xFFFFFFFFFFFFFFF7 && v194 + 8 <= *(void *)&v4[*v10])
          {
            long long v27 = *(objc_class **)(*(void *)&v4[*v12] + v194);
            *(void *)&v4[v193] = v194 + 8;
          }
          else
          {
            v4[*v11] = 1;
            long long v27 = 0;
          }
          uint64_t v336 = 368;
LABEL_601:
          *(Class *)((char *)&v5->super.super.isa + v336) = v27;
          continue;
        case 0x27u:
          char v195 = 0;
          unsigned int v196 = 0;
          uint64_t v38 = 0;
          while (2)
          {
            uint64_t v197 = *v9;
            uint64_t v198 = *(void *)&v4[v197];
            unint64_t v199 = v198 + 1;
            if (v198 == -1 || v199 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v200 = *(unsigned char *)(*(void *)&v4[*v12] + v198);
              *(void *)&v4[v197] = v199;
              v38 |= (unint64_t)(v200 & 0x7F) << v195;
              if (v200 < 0)
              {
                v195 += 7;
                BOOL v20 = v196++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_483;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v38) = 0;
          }
LABEL_483:
          if (v38 >= 3) {
            LODWORD(v38) = 0;
          }
          uint64_t v330 = 264;
          goto LABEL_578;
        case 0x28u:
          uint64_t v347 = 0;
          uint64_t v348 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_607;
          }
          id v201 = [[BMMomentsEventDataPhotoMomentInference alloc] initByReadFrom:v4];
          if (!v201) {
            goto LABEL_607;
          }
          uint64_t v152 = v201;
          [v7 addObject:v201];
          PBReaderRecallMark();
          goto LABEL_229;
        case 0x29u:
          uint64_t v202 = PBReaderReadString();
          if (!v202) {
            goto LABEL_607;
          }
          uint64_t v152 = (void *)v202;
          uint64_t v153 = v8;
LABEL_228:
          [v153 addObject:v152];
LABEL_229:

          continue;
        case 0x2Au:
          char v203 = 0;
          unsigned int v204 = 0;
          uint64_t v97 = 0;
          v5->_hasNumPhotoMomentHolidays = 1;
          while (2)
          {
            uint64_t v205 = *v9;
            uint64_t v206 = *(void *)&v4[v205];
            unint64_t v207 = v206 + 1;
            if (v206 == -1 || v207 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v208 = *(unsigned char *)(*(void *)&v4[*v12] + v206);
              *(void *)&v4[v205] = v207;
              v97 |= (unint64_t)(v208 & 0x7F) << v203;
              if (v208 < 0)
              {
                v203 += 7;
                BOOL v20 = v204++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_489;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_489:
          uint64_t v333 = 268;
          goto LABEL_559;
        case 0x2Bu:
          char v209 = 0;
          unsigned int v210 = 0;
          uint64_t v97 = 0;
          v5->_hasNumPhotoMomentInferences = 1;
          while (2)
          {
            uint64_t v211 = *v9;
            uint64_t v212 = *(void *)&v4[v211];
            unint64_t v213 = v212 + 1;
            if (v212 == -1 || v213 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v214 = *(unsigned char *)(*(void *)&v4[*v12] + v212);
              *(void *)&v4[v211] = v213;
              v97 |= (unint64_t)(v214 & 0x7F) << v209;
              if (v214 < 0)
              {
                v209 += 7;
                BOOL v20 = v210++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_493;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_493:
          uint64_t v333 = 272;
          goto LABEL_559;
        case 0x2Cu:
          char v215 = 0;
          unsigned int v216 = 0;
          uint64_t v97 = 0;
          v5->_hasNumPhotoMomentPublicEvents = 1;
          while (2)
          {
            uint64_t v217 = *v9;
            uint64_t v218 = *(void *)&v4[v217];
            unint64_t v219 = v218 + 1;
            if (v218 == -1 || v219 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v220 = *(unsigned char *)(*(void *)&v4[*v12] + v218);
              *(void *)&v4[v217] = v219;
              v97 |= (unint64_t)(v220 & 0x7F) << v215;
              if (v220 < 0)
              {
                v215 += 7;
                BOOL v20 = v216++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_497;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_497:
          uint64_t v333 = 276;
          goto LABEL_559;
        case 0x2Du:
          char v221 = 0;
          unsigned int v222 = 0;
          uint64_t v97 = 0;
          v5->_hasNumPhotoMomentPersons = 1;
          while (2)
          {
            uint64_t v223 = *v9;
            uint64_t v224 = *(void *)&v4[v223];
            unint64_t v225 = v224 + 1;
            if (v224 == -1 || v225 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v226 = *(unsigned char *)(*(void *)&v4[*v12] + v224);
              *(void *)&v4[v223] = v225;
              v97 |= (unint64_t)(v226 & 0x7F) << v221;
              if (v226 < 0)
              {
                v221 += 7;
                BOOL v20 = v222++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_501;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_501:
          uint64_t v333 = 280;
          goto LABEL_559;
        case 0x2Eu:
          char v227 = 0;
          unsigned int v228 = 0;
          uint64_t v229 = 0;
          v5->_hasIsFamilyInPhotoMoment = 1;
          while (2)
          {
            uint64_t v230 = *v9;
            uint64_t v231 = *(void *)&v4[v230];
            unint64_t v232 = v231 + 1;
            if (v231 == -1 || v232 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v233 = *(unsigned char *)(*(void *)&v4[*v12] + v231);
              *(void *)&v4[v230] = v232;
              v229 |= (unint64_t)(v233 & 0x7F) << v227;
              if (v233 < 0)
              {
                v227 += 7;
                BOOL v20 = v228++ >= 9;
                if (v20)
                {
                  uint64_t v229 = 0;
                  goto LABEL_505;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v229 = 0;
          }
LABEL_505:
          BOOL v334 = v229 != 0;
          uint64_t v335 = 128;
          goto LABEL_554;
        case 0x2Fu:
          char v234 = 0;
          unsigned int v235 = 0;
          uint64_t v236 = 0;
          v5->_hasMomentIncludesFavoritedAsset = 1;
          while (2)
          {
            uint64_t v237 = *v9;
            uint64_t v238 = *(void *)&v4[v237];
            unint64_t v239 = v238 + 1;
            if (v238 == -1 || v239 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v240 = *(unsigned char *)(*(void *)&v4[*v12] + v238);
              *(void *)&v4[v237] = v239;
              v236 |= (unint64_t)(v240 & 0x7F) << v234;
              if (v240 < 0)
              {
                v234 += 7;
                BOOL v20 = v235++ >= 9;
                if (v20)
                {
                  uint64_t v236 = 0;
                  goto LABEL_509;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v236 = 0;
          }
LABEL_509:
          BOOL v334 = v236 != 0;
          uint64_t v335 = 130;
          goto LABEL_554;
        case 0x30u:
          char v241 = 0;
          unsigned int v242 = 0;
          uint64_t v243 = 0;
          v5->_hasMomentIncludesVideo = 1;
          while (2)
          {
            uint64_t v244 = *v9;
            uint64_t v245 = *(void *)&v4[v244];
            unint64_t v246 = v245 + 1;
            if (v245 == -1 || v246 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v247 = *(unsigned char *)(*(void *)&v4[*v12] + v245);
              *(void *)&v4[v244] = v246;
              v243 |= (unint64_t)(v247 & 0x7F) << v241;
              if (v247 < 0)
              {
                v241 += 7;
                BOOL v20 = v242++ >= 9;
                if (v20)
                {
                  uint64_t v243 = 0;
                  goto LABEL_513;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v243 = 0;
          }
LABEL_513:
          BOOL v334 = v243 != 0;
          uint64_t v335 = 132;
          goto LABEL_554;
        case 0x31u:
          char v248 = 0;
          unsigned int v249 = 0;
          uint64_t v250 = 0;
          v5->_hasMomentIncludesPhoto = 1;
          while (2)
          {
            uint64_t v251 = *v9;
            uint64_t v252 = *(void *)&v4[v251];
            unint64_t v253 = v252 + 1;
            if (v252 == -1 || v253 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v254 = *(unsigned char *)(*(void *)&v4[*v12] + v252);
              *(void *)&v4[v251] = v253;
              v250 |= (unint64_t)(v254 & 0x7F) << v248;
              if (v254 < 0)
              {
                v248 += 7;
                BOOL v20 = v249++ >= 9;
                if (v20)
                {
                  uint64_t v250 = 0;
                  goto LABEL_517;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v250 = 0;
          }
LABEL_517:
          BOOL v334 = v250 != 0;
          uint64_t v335 = 134;
          goto LABEL_554;
        case 0x32u:
          char v255 = 0;
          unsigned int v256 = 0;
          uint64_t v38 = 0;
          while (2)
          {
            uint64_t v257 = *v9;
            uint64_t v258 = *(void *)&v4[v257];
            unint64_t v259 = v258 + 1;
            if (v258 == -1 || v259 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v260 = *(unsigned char *)(*(void *)&v4[*v12] + v258);
              *(void *)&v4[v257] = v259;
              v38 |= (unint64_t)(v260 & 0x7F) << v255;
              if (v260 < 0)
              {
                v255 += 7;
                BOOL v20 = v256++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_521;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v38) = 0;
          }
LABEL_521:
          if (v38 >= 0xD) {
            LODWORD(v38) = 0;
          }
          uint64_t v330 = 220;
          goto LABEL_578;
        case 0x33u:
          char v261 = 0;
          unsigned int v262 = 0;
          uint64_t v97 = 0;
          v5->_hasNumAttendees = 1;
          while (2)
          {
            uint64_t v263 = *v9;
            uint64_t v264 = *(void *)&v4[v263];
            unint64_t v265 = v264 + 1;
            if (v264 == -1 || v265 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v266 = *(unsigned char *)(*(void *)&v4[*v12] + v264);
              *(void *)&v4[v263] = v265;
              v97 |= (unint64_t)(v266 & 0x7F) << v261;
              if (v266 < 0)
              {
                v261 += 7;
                BOOL v20 = v262++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_527;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_527:
          uint64_t v333 = 224;
          goto LABEL_559;
        case 0x34u:
          char v267 = 0;
          unsigned int v268 = 0;
          uint64_t v97 = 0;
          v5->_hasNumtripParts = 1;
          while (2)
          {
            uint64_t v269 = *v9;
            uint64_t v270 = *(void *)&v4[v269];
            unint64_t v271 = v270 + 1;
            if (v270 == -1 || v271 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v272 = *(unsigned char *)(*(void *)&v4[*v12] + v270);
              *(void *)&v4[v269] = v271;
              v97 |= (unint64_t)(v272 & 0x7F) << v267;
              if (v272 < 0)
              {
                v267 += 7;
                BOOL v20 = v268++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_531;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_531:
          uint64_t v333 = 228;
          goto LABEL_559;
        case 0x35u:
          char v273 = 0;
          unsigned int v274 = 0;
          uint64_t v38 = 0;
          while (2)
          {
            uint64_t v275 = *v9;
            uint64_t v276 = *(void *)&v4[v275];
            unint64_t v277 = v276 + 1;
            if (v276 == -1 || v277 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v278 = *(unsigned char *)(*(void *)&v4[*v12] + v276);
              *(void *)&v4[v275] = v277;
              v38 |= (unint64_t)(v278 & 0x7F) << v273;
              if (v278 < 0)
              {
                v273 += 7;
                BOOL v20 = v274++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_535;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v38) = 0;
          }
LABEL_535:
          if (v38 >= 3) {
            LODWORD(v38) = 0;
          }
          uint64_t v330 = 232;
          goto LABEL_578;
        case 0x36u:
          char v279 = 0;
          unsigned int v280 = 0;
          uint64_t v97 = 0;
          v5->_hasNumScoredTopics = 1;
          while (2)
          {
            uint64_t v281 = *v9;
            uint64_t v282 = *(void *)&v4[v281];
            unint64_t v283 = v282 + 1;
            if (v282 == -1 || v283 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v284 = *(unsigned char *)(*(void *)&v4[*v12] + v282);
              *(void *)&v4[v281] = v283;
              v97 |= (unint64_t)(v284 & 0x7F) << v279;
              if (v284 < 0)
              {
                v279 += 7;
                BOOL v20 = v280++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_541;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_541:
          uint64_t v333 = 236;
          goto LABEL_559;
        case 0x37u:
          char v285 = 0;
          unsigned int v286 = 0;
          uint64_t v97 = 0;
          v5->_hasNumItemAuthors = 1;
          while (2)
          {
            uint64_t v287 = *v9;
            uint64_t v288 = *(void *)&v4[v287];
            unint64_t v289 = v288 + 1;
            if (v288 == -1 || v289 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v290 = *(unsigned char *)(*(void *)&v4[*v12] + v288);
              *(void *)&v4[v287] = v289;
              v97 |= (unint64_t)(v290 & 0x7F) << v285;
              if (v290 < 0)
              {
                v285 += 7;
                BOOL v20 = v286++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_545;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_545:
          uint64_t v333 = 240;
          goto LABEL_559;
        case 0x38u:
          char v291 = 0;
          unsigned int v292 = 0;
          uint64_t v97 = 0;
          v5->_hasNumItemRecipients = 1;
          while (2)
          {
            uint64_t v293 = *v9;
            uint64_t v294 = *(void *)&v4[v293];
            unint64_t v295 = v294 + 1;
            if (v294 == -1 || v295 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v296 = *(unsigned char *)(*(void *)&v4[*v12] + v294);
              *(void *)&v4[v293] = v295;
              v97 |= (unint64_t)(v296 & 0x7F) << v291;
              if (v296 < 0)
              {
                v291 += 7;
                BOOL v20 = v292++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_549;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_549:
          uint64_t v333 = 244;
          goto LABEL_559;
        case 0x39u:
          char v297 = 0;
          unsigned int v298 = 0;
          uint64_t v299 = 0;
          v5->_hasIsGatheringComplete = 1;
          while (2)
          {
            uint64_t v300 = *v9;
            uint64_t v301 = *(void *)&v4[v300];
            unint64_t v302 = v301 + 1;
            if (v301 == -1 || v302 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v303 = *(unsigned char *)(*(void *)&v4[*v12] + v301);
              *(void *)&v4[v300] = v302;
              v299 |= (unint64_t)(v303 & 0x7F) << v297;
              if (v303 < 0)
              {
                v297 += 7;
                BOOL v20 = v298++ >= 9;
                if (v20)
                {
                  uint64_t v299 = 0;
                  goto LABEL_553;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            uint64_t v299 = 0;
          }
LABEL_553:
          BOOL v334 = v299 != 0;
          uint64_t v335 = 121;
LABEL_554:
          *((unsigned char *)&v5->super.super.isa + v335) = v334;
          continue;
        case 0x3Au:
          uint64_t v347 = 0;
          uint64_t v348 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_607;
          }
          id v304 = [[BMMomentsEventDataPR alloc] initByReadFrom:v4];
          if (!v304) {
            goto LABEL_607;
          }
          gaPR = v5->_gaPR;
          v5->_gaPR = v304;

          PBReaderRecallMark();
          continue;
        case 0x3Bu:
          char v306 = 0;
          unsigned int v307 = 0;
          uint64_t v97 = 0;
          v5->_hasPCount = 1;
          while (2)
          {
            uint64_t v308 = *v9;
            uint64_t v309 = *(void *)&v4[v308];
            unint64_t v310 = v309 + 1;
            if (v309 == -1 || v310 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v311 = *(unsigned char *)(*(void *)&v4[*v12] + v309);
              *(void *)&v4[v308] = v310;
              v97 |= (unint64_t)(v311 & 0x7F) << v306;
              if (v311 < 0)
              {
                v306 += 7;
                BOOL v20 = v307++ >= 9;
                if (v20)
                {
                  LODWORD(v97) = 0;
                  goto LABEL_558;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v97) = 0;
          }
LABEL_558:
          uint64_t v333 = 248;
LABEL_559:
          *(_DWORD *)((char *)&v5->super.super.isa + v333) = v97;
          continue;
        case 0x3Cu:
          char v312 = 0;
          unsigned int v313 = 0;
          uint64_t v38 = 0;
          while (2)
          {
            uint64_t v314 = *v9;
            uint64_t v315 = *(void *)&v4[v314];
            unint64_t v316 = v315 + 1;
            if (v315 == -1 || v316 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v317 = *(unsigned char *)(*(void *)&v4[*v12] + v315);
              *(void *)&v4[v314] = v316;
              v38 |= (unint64_t)(v317 & 0x7F) << v312;
              if (v317 < 0)
              {
                v312 += 7;
                BOOL v20 = v313++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_563;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v38) = 0;
          }
LABEL_563:
          if (v38 >= 0x12) {
            LODWORD(v38) = 0;
          }
          uint64_t v330 = 252;
          goto LABEL_578;
        case 0x3Du:
          char v318 = 0;
          unsigned int v319 = 0;
          uint64_t v38 = 0;
          while (2)
          {
            uint64_t v320 = *v9;
            uint64_t v321 = *(void *)&v4[v320];
            unint64_t v322 = v321 + 1;
            if (v321 == -1 || v322 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v323 = *(unsigned char *)(*(void *)&v4[*v12] + v321);
              *(void *)&v4[v320] = v322;
              v38 |= (unint64_t)(v323 & 0x7F) << v318;
              if (v323 < 0)
              {
                v318 += 7;
                BOOL v20 = v319++ >= 9;
                if (v20)
                {
                  LODWORD(v38) = 0;
                  goto LABEL_569;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v38) = 0;
          }
LABEL_569:
          if (v38 >= 4) {
            LODWORD(v38) = 0;
          }
          uint64_t v330 = 256;
          goto LABEL_578;
        case 0x3Eu:
          char v324 = 0;
          unsigned int v325 = 0;
          uint64_t v38 = 0;
          break;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_607:

          goto LABEL_604;
      }
      while (1)
      {
        uint64_t v326 = *v9;
        uint64_t v327 = *(void *)&v4[v326];
        unint64_t v328 = v327 + 1;
        if (v327 == -1 || v328 > *(void *)&v4[*v10]) {
          break;
        }
        char v329 = *(unsigned char *)(*(void *)&v4[*v12] + v327);
        *(void *)&v4[v326] = v328;
        v38 |= (unint64_t)(v329 & 0x7F) << v324;
        if ((v329 & 0x80) == 0) {
          goto LABEL_573;
        }
        v324 += 7;
        BOOL v20 = v325++ >= 9;
        if (v20)
        {
          LODWORD(v38) = 0;
          goto LABEL_575;
        }
      }
      v4[*v11] = 1;
LABEL_573:
      if (v4[*v11]) {
        LODWORD(v38) = 0;
      }
LABEL_575:
      if (v38 >= 6) {
        LODWORD(v38) = 0;
      }
      uint64_t v330 = 260;
LABEL_578:
      *(_DWORD *)((char *)&v5->super.super.isa + v330) = v38;
    }
    while (*(void *)&v4[*v9] < *(void *)&v4[*v10]);
  }
  uint64_t v337 = [v6 copy];
  contactIDsInConversation = v5->_contactIDsInConversation;
  v5->_contactIDsInConversation = (NSArray *)v337;

  uint64_t v339 = [v7 copy];
  photoMomentInferences = v5->_photoMomentInferences;
  v5->_photoMomentInferences = (NSArray *)v339;

  uint64_t v341 = [v8 copy];
  photoMomentHolidays = v5->_photoMomentHolidays;
  v5->_photoMomentHolidays = (NSArray *)v341;

  int v343 = v4[*v11];
  if (v343) {
LABEL_604:
  }
    id v344 = 0;
  else {
LABEL_605:
  }
    id v344 = v5;

  return v344;
}

- (NSString)description
{
  id v24 = [NSString alloc];
  unint64_t v73 = [(BMMomentsEventDataEvent *)self eventIdentifier];
  uint64_t v72 = [(BMMomentsEventDataEvent *)self startDate];
  uint64_t v71 = [(BMMomentsEventDataEvent *)self endDate];
  unsigned int v70 = [(BMMomentsEventDataEvent *)self creationDate];
  char v69 = [(BMMomentsEventDataEvent *)self sourceCreationDate];
  char v68 = [(BMMomentsEventDataEvent *)self expirationDate];
  unint64_t v67 = BMMomentsEventDataEventProviderTypeAsString([(BMMomentsEventDataEvent *)self provider]);
  uint64_t v66 = BMMomentsEventDataEventCategoryTypeAsString([(BMMomentsEventDataEvent *)self category]);
  uint64_t v65 = BMMomentsEventDataPlaceInferenceUserSpecificPlaceTypeAsString([(BMMomentsEventDataEvent *)self placeUserType]);
  unsigned int v64 = BMMomentsEventDataGeoPOICategoryTypeAsString([(BMMomentsEventDataEvent *)self poiCategory]);
  char v63 = BMMomentsEventDataPlaceDiscoveryTypeAsString([(BMMomentsEventDataEvent *)self placeDiscovery]);
  char v62 = BMMomentsEventDataLocationModeTypeAsString([(BMMomentsEventDataEvent *)self locationMode]);
  unint64_t v61 = BMMomentsEventDataWorkoutActivityTypeAsString([(BMMomentsEventDataEvent *)self workoutType]);
  uint64_t v60 = [(BMMomentsEventDataEvent *)self workoutBundleID];
  uint64_t v59 = BMMomentsEventDataGenreTypeAsString([(BMMomentsEventDataEvent *)self mediaGenre]);
  unsigned int v58 = BMMomentsEventDataMediaTypeAsString([(BMMomentsEventDataEvent *)self mediaType]);
  char v57 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent mediaRepetitions](self, "mediaRepetitions"));
  uint64_t v56 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent mediaSumTimePlayed](self, "mediaSumTimePlayed"));
  char v55 = BMMomentsEventDataSourceAppTypeAsString([(BMMomentsEventDataEvent *)self sourceParty]);
  uint64_t v51 = [(BMMomentsEventDataEvent *)self mediaPlayerBundleID];
  uint64_t v53 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numAudioMediaPlaySessionsPerDay](self, "numAudioMediaPlaySessionsPerDay"));
  uint64_t v3 = NSNumber;
  [(BMMomentsEventDataEvent *)self durationAudioMediaPlaySessionsPerDay];
  unint64_t v54 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v52 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numVideoMediaPlaySessionsPerDay](self, "numVideoMediaPlaySessionsPerDay"));
  id v4 = NSNumber;
  [(BMMomentsEventDataEvent *)self durationVideoMediaPlaySessionsPerDay];
  char v48 = objc_msgSend(v4, "numberWithDouble:");
  unsigned int v50 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numFirstPartyMediaPlaySessionsPerDay](self, "numFirstPartyMediaPlaySessionsPerDay"));
  uint64_t v46 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numThirdPartyMediaPlaySessionsPerDay](self, "numThirdPartyMediaPlaySessionsPerDay"));
  char v49 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numContacts](self, "numContacts"));
  unint64_t v47 = [(BMMomentsEventDataEvent *)self contactIDsInConversation];
  unint64_t v41 = [(BMMomentsEventDataEvent *)self contactIDMostSignificantInConversation];
  id v5 = NSNumber;
  [(BMMomentsEventDataEvent *)self interactionContactScore];
  uint64_t v45 = objc_msgSend(v5, "numberWithDouble:");
  uint64_t v39 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEvent textLikeMechanismIncluded](self, "textLikeMechanismIncluded"));
  unsigned int v44 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEvent callLikeMechanismIncluded](self, "callLikeMechanismIncluded"));
  unsigned int v37 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numTextLikeInteractions](self, "numTextLikeInteractions"));
  char v43 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numAudioLikeInteractions](self, "numAudioLikeInteractions"));
  char v42 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numVideoLikeInteractions](self, "numVideoLikeInteractions"));
  uint64_t v6 = NSNumber;
  [(BMMomentsEventDataEvent *)self totalDurationOfCallLikeInteractions];
  uint64_t v40 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [(BMMomentsEventDataEvent *)self minDurationOfCallLikeInteractions];
  uint64_t v38 = objc_msgSend(v7, "numberWithDouble:");
  uint64_t v8 = NSNumber;
  [(BMMomentsEventDataEvent *)self maxDurationOfCallLikeInteractions];
  uint64_t v34 = objc_msgSend(v8, "numberWithDouble:");
  char v36 = BMMomentsEventDataPhotoMomentSourceTypeAsString([(BMMomentsEventDataEvent *)self photoMomentSource]);
  uint64_t v23 = [(BMMomentsEventDataEvent *)self photoMomentInferences];
  unint64_t v35 = [(BMMomentsEventDataEvent *)self photoMomentHolidays];
  long long v22 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numPhotoMomentHolidays](self, "numPhotoMomentHolidays"));
  unint64_t v33 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numPhotoMomentInferences](self, "numPhotoMomentInferences"));
  int v21 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numPhotoMomentPublicEvents](self, "numPhotoMomentPublicEvents"));
  uint64_t v32 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numPhotoMomentPersons](self, "numPhotoMomentPersons"));
  unint64_t v31 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEvent isFamilyInPhotoMoment](self, "isFamilyInPhotoMoment"));
  uint64_t v30 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEvent momentIncludesFavoritedAsset](self, "momentIncludesFavoritedAsset"));
  unint64_t v29 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEvent momentIncludesVideo](self, "momentIncludesVideo"));
  BOOL v20 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEvent momentIncludesPhoto](self, "momentIncludesPhoto"));
  uint64_t v28 = BMMomentsEventDataSuggestedEventCategoryTypeAsString([(BMMomentsEventDataEvent *)self suggestedEventCategory]);
  long long v27 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numAttendees](self, "numAttendees"));
  unint64_t v26 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numtripParts](self, "numtripParts"));
  char v19 = BMMomentsEventDataTripModeTypeAsString([(BMMomentsEventDataEvent *)self tripMode]);
  unint64_t v18 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numScoredTopics](self, "numScoredTopics"));
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numItemAuthors](self, "numItemAuthors"));
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent numItemRecipients](self, "numItemRecipients"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEvent isGatheringComplete](self, "isGatheringComplete"));
  id v10 = [(BMMomentsEventDataEvent *)self gaPR];
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEvent pCount](self, "pCount"));
  uint64_t v12 = BMMomentsEventDataMapItemSourceTypeAsString([(BMMomentsEventDataEvent *)self mapItemSource]);
  char v13 = BMMomentsEventDataVisitPlaceTypesAsString([(BMMomentsEventDataEvent *)self placeType]);
  unint64_t v15 = BMMomentsEventDataPlaceInferenceGranularityTypeAsString([(BMMomentsEventDataEvent *)self placeLabelGranularity]);
  id v25 = (id)objc_msgSend(v24, "initWithFormat:", @"BMMomentsEventDataEvent with eventIdentifier: %@, startDate: %@, endDate: %@, creationDate: %@, sourceCreationDate: %@, expirationDate: %@, provider: %@, category: %@, placeUserType: %@, poiCategory: %@, placeDiscovery: %@, locationMode: %@, workoutType: %@, workoutBundleID: %@, mediaGenre: %@, mediaType: %@, mediaRepetitions: %@, mediaSumTimePlayed: %@, sourceParty: %@, mediaPlayerBundleID: %@, numAudioMediaPlaySessionsPerDay: %@, durationAudioMediaPlaySessionsPerDay: %@, numVideoMediaPlaySessionsPerDay: %@, durationVideoMediaPlaySessionsPerDay: %@, numFirstPartyMediaPlaySessionsPerDay: %@, numThirdPartyMediaPlaySessionsPerDay: %@, numContacts: %@, contactIDsInConversation: %@, contactIDMostSignificantInConversation: %@, interactionContactScore: %@, textLikeMechanismIncluded: %@, callLikeMechanismIncluded: %@, numTextLikeInteractions: %@, numAudioLikeInteractions: %@, numVideoLikeInteractions: %@, totalDurationOfCallLikeInteractions: %@, minDurationOfCallLikeInteractions: %@, maxDurationOfCallLikeInteractions: %@, photoMomentSource: %@, photoMomentInferences: %@, photoMomentHolidays: %@, numPhotoMomentHolidays: %@, numPhotoMomentInferences: %@, numPhotoMomentPublicEvents: %@, numPhotoMomentPersons: %@, isFamilyInPhotoMoment: %@, momentIncludesFavoritedAsset: %@, momentIncludesVideo: %@, momentIncludesPhoto: %@, suggestedEventCategory: %@, numAttendees: %@, numtripParts: %@, tripMode: %@, numScoredTopics: %@, numItemAuthors: %@, numItemRecipients: %@, isGatheringComplete: %@, gaPR: %@, pCount: %@, mapItemSource: %@, placeType: %@, placeLabelGranularity: %@", v73, v72, v71, v70, v69, v68, v67, v66, v65, v64, v63, v62, v61, v60, v59, v58,
              v57,
              v56,
              v55,
              v51,
              v53,
              v54,
              v52,
              v48,
              v50,
              v46,
              v49,
              v47,
              v41,
              v45,
              v39,
              v44,
              v37,
              v43,
              v42,
              v40,
              v38,
              v34,
              v36,
              v23,
              v35,
              v22,
              v33,
              v21,
              v32,
              v31,
              v30,
              v29,
              v20,
              v28,
              v27,
              v26,
              v19,
              v18,
              v17,
              v16,
              v9,
              v10,
              v11,
              v12);

  return (NSString *)v25;
}

- (BMMomentsEventDataEvent)initWithEventIdentifier:(void *)a3 startDate:(void *)a4 endDate:(void *)a5 creationDate:(void *)a6 sourceCreationDate:(void *)a7 expirationDate:(void *)a8 provider:(int)a9 category:(int)a10 placeUserType:(int)a11 poiCategory:(int)a12 placeDiscovery:(int)a13 locationMode:(int)a14 workoutType:(int)a15 workoutBundleID:(id)a16 mediaGenre:(int)a17 mediaType:(int)a18 mediaRepetitions:(id)a19 mediaSumTimePlayed:(id)a20 sourceParty:(int)a21 mediaPlayerBundleID:(id)a22 numAudioMediaPlaySessionsPerDay:(id)a23 durationAudioMediaPlaySessionsPerDay:(id)a24 numVideoMediaPlaySessionsPerDay:(id)a25 durationVideoMediaPlaySessionsPerDay:(id)a26 numFirstPartyMediaPlaySessionsPerDay:(id)a27 numThirdPartyMediaPlaySessionsPerDay:(id)a28 numContacts:(id)a29 contactIDsInConversation:(id)a30 contactIDMostSignificantInConversation:(id)a31 interactionContactScore:(id)a32 textLikeMechanismIncluded:(id)a33 callLikeMechanismIncluded:(id)a34 numTextLikeInteractions:(id)a35 numAudioLikeInteractions:(id)a36 numVideoLikeInteractions:(id)a37 totalDurationOfCallLikeInteractions:(id)a38 minDurationOfCallLikeInteractions:(id)a39 maxDurationOfCallLikeInteractions:(id)a40 photoMomentSource:(int)a41 photoMomentInferences:(id)a42 photoMomentHolidays:(id)a43 numPhotoMomentHolidays:(id)a44 numPhotoMomentInferences:(id)a45 numPhotoMomentPublicEvents:(id)a46 numPhotoMomentPersons:(id)a47 isFamilyInPhotoMoment:(id)a48 momentIncludesFavoritedAsset:(id)a49 momentIncludesVideo:(id)a50 momentIncludesPhoto:(id)a51 suggestedEventCategory:(int)a52 numAttendees:(id)a53 numtripParts:(id)a54 tripMode:(int)a55 numScoredTopics:(id)a56 numItemAuthors:(id)a57 numItemRecipients:(id)a58 isGatheringComplete:(id)a59 gaPR:(id)a60 pCount:(id)a61 mapItemSource:(int)a62 placeType:(int)a63 placeLabelGranularity:
{
  id v118 = a3;
  id v68 = a4;
  id v69 = a5;
  id v70 = a6;
  id v71 = a7;
  id v150 = a8;
  id v72 = a16;
  id v148 = a19;
  id v73 = a20;
  id v117 = a22;
  id v74 = a23;
  id v147 = a24;
  id v75 = a25;
  id v146 = a26;
  id v145 = a27;
  id v144 = a28;
  id v143 = a29;
  id v116 = a30;
  id v115 = a31;
  id v142 = a32;
  id v141 = a33;
  id v140 = a34;
  id v139 = a35;
  id v138 = a36;
  id v137 = a37;
  id v136 = a38;
  id v135 = a39;
  id v134 = a40;
  id v114 = a42;
  id v113 = a43;
  id v133 = a44;
  id v132 = a45;
  id v131 = a46;
  id v130 = a47;
  id v129 = a48;
  id v128 = a49;
  id v127 = a50;
  id v126 = a51;
  id v125 = a53;
  id v124 = a54;
  id v123 = a56;
  id v122 = a57;
  id v121 = a58;
  id v120 = a59;
  id v112 = a60;
  id v119 = a61;
  v151.receiver = a1;
  v151.super_class = (Class)BMMomentsEventDataEvent;
  unsigned int v76 = [(BMEventBase *)&v151 init];

  if (v76)
  {
    v76->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v76->_eventIdentifier, a3);
    if (v68)
    {
      v76->_hasRaw_startDate = 1;
      [v68 timeIntervalSince1970];
    }
    else
    {
      v76->_hasRaw_startDate = 0;
      double v77 = -1.0;
    }
    v76->_raw_startDate = v77;
    if (v69)
    {
      v76->_hasRaw_endDate = 1;
      [v69 timeIntervalSince1970];
    }
    else
    {
      v76->_hasRaw_endDate = 0;
      double v78 = -1.0;
    }
    v76->_raw_endDate = v78;
    if (v70)
    {
      v76->_hasRaw_creationDate = 1;
      [v70 timeIntervalSince1970];
    }
    else
    {
      v76->_hasRaw_creationDate = 0;
      double v79 = -1.0;
    }
    v76->_raw_creationDate = v79;
    if (v71)
    {
      v76->_hasRaw_sourceCreationDate = 1;
      [v71 timeIntervalSince1970];
    }
    else
    {
      v76->_hasRaw_sourceCreationDate = 0;
      double v80 = -1.0;
    }
    v76->_raw_sourceCreationDate = v80;
    if (v150)
    {
      v76->_hasRaw_expirationDate = 1;
      [v150 timeIntervalSince1970];
    }
    else
    {
      v76->_hasRaw_expirationDate = 0;
      double v81 = -1.0;
    }
    v76->_raw_expirationDate = v81;
    v76->_provider = a9;
    v76->_category = a10;
    v76->_placeUserType = a11;
    v76->_poiCategory = a12;
    v76->_placeDiscovery = a13;
    v76->_locationMode = a14;
    v76->_workoutType = a15;
    objc_storeStrong((id *)&v76->_workoutBundleID, a16);
    v76->_mediaGenre = a17;
    v76->_mediaType = a18;
    if (v148)
    {
      v76->_hasMediaRepetitions = 1;
      int v82 = [v148 intValue];
    }
    else
    {
      v76->_hasMediaRepetitions = 0;
      int v82 = -1;
    }
    v76->_mediaRepetitions = v82;
    if (v73)
    {
      v76->_hasMediaSumTimePlayed = 1;
      int v83 = [v73 intValue];
    }
    else
    {
      v76->_hasMediaSumTimePlayed = 0;
      int v83 = -1;
    }
    v76->_mediaSumTimePlayed = v83;
    v76->_sourceParty = a21;
    objc_storeStrong((id *)&v76->_mediaPlayerBundleID, a22);
    if (v74)
    {
      v76->_hasNumAudioMediaPlaySessionsPerDay = 1;
      int v84 = [v74 intValue];
    }
    else
    {
      v76->_hasNumAudioMediaPlaySessionsPerDay = 0;
      int v84 = -1;
    }
    v76->_numAudioMediaPlaySessionsPerDay = v84;
    if (v147)
    {
      v76->_hasDurationAudioMediaPlaySessionsPerDay = 1;
      [v147 doubleValue];
    }
    else
    {
      v76->_hasDurationAudioMediaPlaySessionsPerDay = 0;
      double v85 = -1.0;
    }
    v76->_durationAudioMediaPlaySessionsPerDay = v85;
    if (v75)
    {
      v76->_hasNumVideoMediaPlaySessionsPerDay = 1;
      int v86 = [v75 intValue];
    }
    else
    {
      v76->_hasNumVideoMediaPlaySessionsPerDay = 0;
      int v86 = -1;
    }
    v76->_numVideoMediaPlaySessionsPerDay = v86;
    if (v146)
    {
      v76->_hasDurationVideoMediaPlaySessionsPerDay = 1;
      [v146 doubleValue];
    }
    else
    {
      v76->_hasDurationVideoMediaPlaySessionsPerDay = 0;
      double v87 = -1.0;
    }
    v76->_durationVideoMediaPlaySessionsPerDay = v87;
    if (v145)
    {
      v76->_hasNumFirstPartyMediaPlaySessionsPerDay = 1;
      int v88 = [v145 intValue];
    }
    else
    {
      v76->_hasNumFirstPartyMediaPlaySessionsPerDay = 0;
      int v88 = -1;
    }
    v76->_numFirstPartyMediaPlaySessionsPerDay = v88;
    if (v144)
    {
      v76->_hasNumThirdPartyMediaPlaySessionsPerDay = 1;
      int v89 = [v144 intValue];
    }
    else
    {
      v76->_hasNumThirdPartyMediaPlaySessionsPerDay = 0;
      int v89 = -1;
    }
    v76->_numThirdPartyMediaPlaySessionsPerDay = v89;
    if (v143)
    {
      v76->_hasNumContacts = 1;
      int v90 = [v143 intValue];
    }
    else
    {
      v76->_hasNumContacts = 0;
      int v90 = -1;
    }
    v76->_numContacts = v90;
    objc_storeStrong((id *)&v76->_contactIDsInConversation, a30);
    objc_storeStrong((id *)&v76->_contactIDMostSignificantInConversation, a31);
    if (v142)
    {
      v76->_hasInteractionContactScore = 1;
      [v142 doubleValue];
    }
    else
    {
      v76->_hasInteractionContactScore = 0;
      double v91 = -1.0;
    }
    v76->_interactionContactScore = v91;
    if (v141)
    {
      v76->_hasTextLikeMechanismIncluded = 1;
      v76->_textLikeMechanismIncluded = [v141 BOOLValue];
    }
    else
    {
      v76->_hasTextLikeMechanismIncluded = 0;
      v76->_textLikeMechanismIncluded = 0;
    }
    if (v140)
    {
      v76->_hasCallLikeMechanismIncluded = 1;
      v76->_callLikeMechanismIncluded = [v140 BOOLValue];
    }
    else
    {
      v76->_hasCallLikeMechanismIncluded = 0;
      v76->_callLikeMechanismIncluded = 0;
    }
    if (v139)
    {
      v76->_hasNumTextLikeInteractions = 1;
      int v92 = [v139 intValue];
    }
    else
    {
      v76->_hasNumTextLikeInteractions = 0;
      int v92 = -1;
    }
    v76->_numTextLikeInteractions = v92;
    if (v138)
    {
      v76->_hasNumAudioLikeInteractions = 1;
      int v93 = [v138 intValue];
    }
    else
    {
      v76->_hasNumAudioLikeInteractions = 0;
      int v93 = -1;
    }
    v76->_numAudioLikeInteractions = v93;
    if (v137)
    {
      v76->_hasNumVideoLikeInteractions = 1;
      int v94 = [v137 intValue];
    }
    else
    {
      v76->_hasNumVideoLikeInteractions = 0;
      int v94 = -1;
    }
    v76->_numVideoLikeInteractions = v94;
    if (v136)
    {
      v76->_hasTotalDurationOfCallLikeInteractions = 1;
      [v136 doubleValue];
    }
    else
    {
      v76->_hasTotalDurationOfCallLikeInteractions = 0;
      double v95 = -1.0;
    }
    v76->_totalDurationOfCallLikeInteractions = v95;
    if (v135)
    {
      v76->_hasMinDurationOfCallLikeInteractions = 1;
      [v135 doubleValue];
    }
    else
    {
      v76->_hasMinDurationOfCallLikeInteractions = 0;
      double v96 = -1.0;
    }
    v76->_minDurationOfCallLikeInteractions = v96;
    if (v134)
    {
      v76->_hasMaxDurationOfCallLikeInteractions = 1;
      [v134 doubleValue];
    }
    else
    {
      v76->_hasMaxDurationOfCallLikeInteractions = 0;
      double v97 = -1.0;
    }
    v76->_maxDurationOfCallLikeInteractions = v97;
    v76->_photoMomentSource = a41;
    objc_storeStrong((id *)&v76->_photoMomentInferences, a42);
    objc_storeStrong((id *)&v76->_photoMomentHolidays, a43);
    if (v133)
    {
      v76->_hasNumPhotoMomentHolidays = 1;
      int v98 = [v133 intValue];
    }
    else
    {
      v76->_hasNumPhotoMomentHolidays = 0;
      int v98 = -1;
    }
    v76->_numPhotoMomentHolidays = v98;
    if (v132)
    {
      v76->_hasNumPhotoMomentInferences = 1;
      int v99 = [v132 intValue];
    }
    else
    {
      v76->_hasNumPhotoMomentInferences = 0;
      int v99 = -1;
    }
    v76->_numPhotoMomentInferences = v99;
    if (v131)
    {
      v76->_hasNumPhotoMomentPublicEvents = 1;
      int v100 = [v131 intValue];
    }
    else
    {
      v76->_hasNumPhotoMomentPublicEvents = 0;
      int v100 = -1;
    }
    v76->_numPhotoMomentPublicEvents = v100;
    if (v130)
    {
      v76->_hasNumPhotoMomentPersons = 1;
      int v101 = [v130 intValue];
    }
    else
    {
      v76->_hasNumPhotoMomentPersons = 0;
      int v101 = -1;
    }
    v76->_numPhotoMomentPersons = v101;
    if (v129)
    {
      v76->_hasIsFamilyInPhotoMoment = 1;
      v76->_isFamilyInPhotoMoment = [v129 BOOLValue];
    }
    else
    {
      v76->_hasIsFamilyInPhotoMoment = 0;
      v76->_isFamilyInPhotoMoment = 0;
    }
    if (v128)
    {
      v76->_hasMomentIncludesFavoritedAsset = 1;
      v76->_momentIncludesFavoritedAsset = [v128 BOOLValue];
    }
    else
    {
      v76->_hasMomentIncludesFavoritedAsset = 0;
      v76->_momentIncludesFavoritedAsset = 0;
    }
    if (v127)
    {
      v76->_hasMomentIncludesVideo = 1;
      v76->_momentIncludesVideo = [v127 BOOLValue];
    }
    else
    {
      v76->_hasMomentIncludesVideo = 0;
      v76->_momentIncludesVideo = 0;
    }
    if (v126)
    {
      v76->_hasMomentIncludesPhoto = 1;
      v76->_momentIncludesPhoto = [v126 BOOLValue];
    }
    else
    {
      v76->_hasMomentIncludesPhoto = 0;
      v76->_momentIncludesPhoto = 0;
    }
    v76->_suggestedEventCategory = a52;
    if (v125)
    {
      v76->_hasNumAttendees = 1;
      int v102 = [v125 intValue];
    }
    else
    {
      v76->_hasNumAttendees = 0;
      int v102 = -1;
    }
    v76->_numAttendees = v102;
    if (v124)
    {
      v76->_hasNumtripParts = 1;
      int v103 = [v124 intValue];
    }
    else
    {
      v76->_hasNumtripParts = 0;
      int v103 = -1;
    }
    v76->_numtripParts = v103;
    v76->_tripMode = a55;
    if (v123)
    {
      v76->_hasNumScoredTopics = 1;
      int v104 = [v123 intValue];
    }
    else
    {
      v76->_hasNumScoredTopics = 0;
      int v104 = -1;
    }
    v76->_numScoredTopics = v104;
    if (v122)
    {
      v76->_hasNumItemAuthors = 1;
      int v105 = [v122 intValue];
    }
    else
    {
      v76->_hasNumItemAuthors = 0;
      int v105 = -1;
    }
    v76->_numItemAuthors = v105;
    if (v121)
    {
      v76->_hasNumItemRecipients = 1;
      int v106 = [v121 intValue];
    }
    else
    {
      v76->_hasNumItemRecipients = 0;
      int v106 = -1;
    }
    v76->_numItemRecipients = v106;
    if (v120)
    {
      v76->_hasIsGatheringComplete = 1;
      v76->_isGatheringComplete = [v120 BOOLValue];
    }
    else
    {
      v76->_hasIsGatheringComplete = 0;
      v76->_isGatheringComplete = 0;
    }
    objc_storeStrong((id *)&v76->_gaPR, a60);
    if (v119)
    {
      v76->_hasPCount = 1;
      int v107 = [v119 intValue];
    }
    else
    {
      v76->_hasPCount = 0;
      int v107 = -1;
    }
    v76->_pCount = v107;
    v76->_mapItemSource = a62;
    v76->_placeType = a63;
    v76->_placeLabelGranularity = a64;
  }
  char v108 = v76;

  return v108;
}

+ (id)protoFields
{
  v66[62] = *MEMORY[0x1E4F143B8];
  uint64_t v65 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventIdentifier" number:1 type:13 subMessageClass:0];
  v66[0] = v65;
  unsigned int v64 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"startDate" number:2 type:0 subMessageClass:0];
  v66[1] = v64;
  char v63 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"endDate" number:3 type:0 subMessageClass:0];
  v66[2] = v63;
  char v62 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"creationDate" number:4 type:0 subMessageClass:0];
  v66[3] = v62;
  unint64_t v61 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceCreationDate" number:5 type:0 subMessageClass:0];
  v66[4] = v61;
  uint64_t v60 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"expirationDate" number:6 type:0 subMessageClass:0];
  v66[5] = v60;
  uint64_t v59 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"provider" number:7 type:4 subMessageClass:0];
  v66[6] = v59;
  unsigned int v58 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"category" number:8 type:4 subMessageClass:0];
  v66[7] = v58;
  char v57 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"placeUserType" number:9 type:4 subMessageClass:0];
  v66[8] = v57;
  uint64_t v56 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"poiCategory" number:10 type:4 subMessageClass:0];
  v66[9] = v56;
  char v55 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"placeDiscovery" number:11 type:4 subMessageClass:0];
  v66[10] = v55;
  unint64_t v54 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"locationMode" number:12 type:4 subMessageClass:0];
  v66[11] = v54;
  uint64_t v53 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"workoutType" number:13 type:4 subMessageClass:0];
  v66[12] = v53;
  uint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"workoutBundleID" number:14 type:13 subMessageClass:0];
  v66[13] = v52;
  uint64_t v51 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaGenre" number:15 type:4 subMessageClass:0];
  v66[14] = v51;
  unsigned int v50 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaType" number:16 type:4 subMessageClass:0];
  v66[15] = v50;
  char v49 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaRepetitions" number:17 type:2 subMessageClass:0];
  v66[16] = v49;
  char v48 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaSumTimePlayed" number:18 type:2 subMessageClass:0];
  v66[17] = v48;
  unint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceParty" number:19 type:4 subMessageClass:0];
  v66[18] = v47;
  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaPlayerBundleID" number:20 type:13 subMessageClass:0];
  v66[19] = v46;
  uint64_t v45 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numAudioMediaPlaySessionsPerDay" number:21 type:2 subMessageClass:0];
  v66[20] = v45;
  unsigned int v44 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"durationAudioMediaPlaySessionsPerDay" number:22 type:0 subMessageClass:0];
  v66[21] = v44;
  char v43 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numVideoMediaPlaySessionsPerDay" number:23 type:2 subMessageClass:0];
  v66[22] = v43;
  char v42 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"durationVideoMediaPlaySessionsPerDay" number:24 type:0 subMessageClass:0];
  v66[23] = v42;
  unint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numFirstPartyMediaPlaySessionsPerDay" number:25 type:2 subMessageClass:0];
  v66[24] = v41;
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numThirdPartyMediaPlaySessionsPerDay" number:26 type:2 subMessageClass:0];
  v66[25] = v40;
  uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numContacts" number:27 type:2 subMessageClass:0];
  v66[26] = v39;
  uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contactIDsInConversation" number:28 type:13 subMessageClass:0];
  v66[27] = v38;
  unsigned int v37 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contactIDMostSignificantInConversation" number:29 type:13 subMessageClass:0];
  v66[28] = v37;
  char v36 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"interactionContactScore" number:30 type:0 subMessageClass:0];
  v66[29] = v36;
  unint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"textLikeMechanismIncluded" number:31 type:12 subMessageClass:0];
  v66[30] = v35;
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"callLikeMechanismIncluded" number:32 type:12 subMessageClass:0];
  v66[31] = v34;
  unint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numTextLikeInteractions" number:33 type:2 subMessageClass:0];
  v66[32] = v33;
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numAudioLikeInteractions" number:34 type:2 subMessageClass:0];
  v66[33] = v32;
  unint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numVideoLikeInteractions" number:35 type:2 subMessageClass:0];
  v66[34] = v31;
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"totalDurationOfCallLikeInteractions" number:36 type:0 subMessageClass:0];
  v66[35] = v30;
  unint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"minDurationOfCallLikeInteractions" number:37 type:0 subMessageClass:0];
  v66[36] = v29;
  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"maxDurationOfCallLikeInteractions" number:38 type:0 subMessageClass:0];
  v66[37] = v28;
  long long v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"photoMomentSource" number:39 type:4 subMessageClass:0];
  v66[38] = v27;
  unint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"photoMomentInferences" number:40 type:14 subMessageClass:objc_opt_class()];
  v66[39] = v26;
  id v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"photoMomentHolidays" number:41 type:13 subMessageClass:0];
  v66[40] = v25;
  id v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numPhotoMomentHolidays" number:42 type:2 subMessageClass:0];
  v66[41] = v24;
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numPhotoMomentInferences" number:43 type:2 subMessageClass:0];
  v66[42] = v23;
  long long v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numPhotoMomentPublicEvents" number:44 type:2 subMessageClass:0];
  v66[43] = v22;
  int v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numPhotoMomentPersons" number:45 type:2 subMessageClass:0];
  v66[44] = v21;
  BOOL v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isFamilyInPhotoMoment" number:46 type:12 subMessageClass:0];
  v66[45] = v20;
  char v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"momentIncludesFavoritedAsset" number:47 type:12 subMessageClass:0];
  v66[46] = v19;
  unint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"momentIncludesVideo" number:48 type:12 subMessageClass:0];
  v66[47] = v18;
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"momentIncludesPhoto" number:49 type:12 subMessageClass:0];
  v66[48] = v17;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"suggestedEventCategory" number:50 type:4 subMessageClass:0];
  v66[49] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numAttendees" number:51 type:2 subMessageClass:0];
  v66[50] = v15;
  unsigned int v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numtripParts" number:52 type:2 subMessageClass:0];
  v66[51] = v14;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tripMode" number:53 type:4 subMessageClass:0];
  v66[52] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numScoredTopics" number:54 type:2 subMessageClass:0];
  v66[53] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numItemAuthors" number:55 type:2 subMessageClass:0];
  v66[54] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numItemRecipients" number:56 type:2 subMessageClass:0];
  v66[55] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isGatheringComplete" number:57 type:12 subMessageClass:0];
  v66[56] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"gaPR" number:58 type:14 subMessageClass:objc_opt_class()];
  v66[57] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pCount" number:59 type:2 subMessageClass:0];
  v66[58] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mapItemSource" number:60 type:4 subMessageClass:0];
  v66[59] = v9;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"placeType" number:61 type:4 subMessageClass:0];
  v66[60] = v10;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"placeLabelGranularity" number:62 type:4 subMessageClass:0];
  v66[61] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:62];

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF32A0;
}

+ (id)columns
{
  v66[62] = *MEMORY[0x1E4F143B8];
  uint64_t v65 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventIdentifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  unsigned int v64 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"startDate" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  char v63 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"endDate" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  char v62 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"creationDate" dataType:3 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:2];
  unint64_t v61 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceCreationDate" dataType:3 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:2];
  uint64_t v60 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"expirationDate" dataType:3 requestOnly:0 fieldNumber:6 protoDataType:0 convertedType:2];
  uint64_t v59 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"provider" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  unsigned int v58 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"category" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:4 convertedType:0];
  char v57 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"placeUserType" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:4 convertedType:0];
  char v55 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"poiCategory" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:4 convertedType:0];
  uint64_t v56 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"placeDiscovery" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:4 convertedType:0];
  uint64_t v53 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"locationMode" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:4 convertedType:0];
  unint64_t v54 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"workoutType" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:4 convertedType:0];
  uint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"workoutBundleID" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  uint64_t v51 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mediaGenre" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:4 convertedType:0];
  unsigned int v50 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mediaType" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:4 convertedType:0];
  char v49 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mediaRepetitions" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:2 convertedType:0];
  char v48 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mediaSumTimePlayed" dataType:0 requestOnly:0 fieldNumber:18 protoDataType:2 convertedType:0];
  unint64_t v47 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceParty" dataType:0 requestOnly:0 fieldNumber:19 protoDataType:4 convertedType:0];
  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mediaPlayerBundleID" dataType:2 requestOnly:0 fieldNumber:20 protoDataType:13 convertedType:0];
  uint64_t v45 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numAudioMediaPlaySessionsPerDay" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:2 convertedType:0];
  unsigned int v44 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"durationAudioMediaPlaySessionsPerDay" dataType:1 requestOnly:0 fieldNumber:22 protoDataType:0 convertedType:0];
  char v43 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numVideoMediaPlaySessionsPerDay" dataType:0 requestOnly:0 fieldNumber:23 protoDataType:2 convertedType:0];
  char v42 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"durationVideoMediaPlaySessionsPerDay" dataType:1 requestOnly:0 fieldNumber:24 protoDataType:0 convertedType:0];
  unint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numFirstPartyMediaPlaySessionsPerDay" dataType:0 requestOnly:0 fieldNumber:25 protoDataType:2 convertedType:0];
  uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numThirdPartyMediaPlaySessionsPerDay" dataType:0 requestOnly:0 fieldNumber:26 protoDataType:2 convertedType:0];
  uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numContacts" dataType:0 requestOnly:0 fieldNumber:27 protoDataType:2 convertedType:0];
  uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"contactIDsInConversation_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_2226];
  unsigned int v37 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contactIDMostSignificantInConversation" dataType:2 requestOnly:0 fieldNumber:29 protoDataType:13 convertedType:0];
  char v36 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"interactionContactScore" dataType:1 requestOnly:0 fieldNumber:30 protoDataType:0 convertedType:0];
  unint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"textLikeMechanismIncluded" dataType:0 requestOnly:0 fieldNumber:31 protoDataType:12 convertedType:0];
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"callLikeMechanismIncluded" dataType:0 requestOnly:0 fieldNumber:32 protoDataType:12 convertedType:0];
  unint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numTextLikeInteractions" dataType:0 requestOnly:0 fieldNumber:33 protoDataType:2 convertedType:0];
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numAudioLikeInteractions" dataType:0 requestOnly:0 fieldNumber:34 protoDataType:2 convertedType:0];
  unint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numVideoLikeInteractions" dataType:0 requestOnly:0 fieldNumber:35 protoDataType:2 convertedType:0];
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"totalDurationOfCallLikeInteractions" dataType:1 requestOnly:0 fieldNumber:36 protoDataType:0 convertedType:0];
  unint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"minDurationOfCallLikeInteractions" dataType:1 requestOnly:0 fieldNumber:37 protoDataType:0 convertedType:0];
  uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"maxDurationOfCallLikeInteractions" dataType:1 requestOnly:0 fieldNumber:38 protoDataType:0 convertedType:0];
  long long v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"photoMomentSource" dataType:0 requestOnly:0 fieldNumber:39 protoDataType:4 convertedType:0];
  unint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"photoMomentInferences_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_2228];
  id v25 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"photoMomentHolidays_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_2230];
  id v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numPhotoMomentHolidays" dataType:0 requestOnly:0 fieldNumber:42 protoDataType:2 convertedType:0];
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numPhotoMomentInferences" dataType:0 requestOnly:0 fieldNumber:43 protoDataType:2 convertedType:0];
  long long v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numPhotoMomentPublicEvents" dataType:0 requestOnly:0 fieldNumber:44 protoDataType:2 convertedType:0];
  int v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numPhotoMomentPersons" dataType:0 requestOnly:0 fieldNumber:45 protoDataType:2 convertedType:0];
  BOOL v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isFamilyInPhotoMoment" dataType:0 requestOnly:0 fieldNumber:46 protoDataType:12 convertedType:0];
  char v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"momentIncludesFavoritedAsset" dataType:0 requestOnly:0 fieldNumber:47 protoDataType:12 convertedType:0];
  unint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"momentIncludesVideo" dataType:0 requestOnly:0 fieldNumber:48 protoDataType:12 convertedType:0];
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"momentIncludesPhoto" dataType:0 requestOnly:0 fieldNumber:49 protoDataType:12 convertedType:0];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"suggestedEventCategory" dataType:0 requestOnly:0 fieldNumber:50 protoDataType:4 convertedType:0];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numAttendees" dataType:0 requestOnly:0 fieldNumber:51 protoDataType:2 convertedType:0];
  unsigned int v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numtripParts" dataType:0 requestOnly:0 fieldNumber:52 protoDataType:2 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tripMode" dataType:0 requestOnly:0 fieldNumber:53 protoDataType:4 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numScoredTopics" dataType:0 requestOnly:0 fieldNumber:54 protoDataType:2 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numItemAuthors" dataType:0 requestOnly:0 fieldNumber:55 protoDataType:2 convertedType:0];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numItemRecipients" dataType:0 requestOnly:0 fieldNumber:56 protoDataType:2 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isGatheringComplete" dataType:0 requestOnly:0 fieldNumber:57 protoDataType:12 convertedType:0];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"gaPR_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_2232];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"pCount" dataType:0 requestOnly:0 fieldNumber:59 protoDataType:2 convertedType:0];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mapItemSource" dataType:0 requestOnly:0 fieldNumber:60 protoDataType:4 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"placeType" dataType:0 requestOnly:0 fieldNumber:61 protoDataType:4 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"placeLabelGranularity" dataType:0 requestOnly:0 fieldNumber:62 protoDataType:4 convertedType:0];
  v66[0] = v65;
  v66[1] = v64;
  v66[2] = v63;
  v66[3] = v62;
  v66[4] = v61;
  v66[5] = v60;
  v66[6] = v59;
  v66[7] = v58;
  v66[8] = v57;
  v66[9] = v55;
  v66[10] = v56;
  v66[11] = v53;
  v66[12] = v54;
  v66[13] = v52;
  v66[14] = v51;
  v66[15] = v50;
  v66[16] = v49;
  v66[17] = v48;
  v66[18] = v47;
  v66[19] = v46;
  v66[20] = v45;
  v66[21] = v44;
  v66[22] = v43;
  v66[23] = v42;
  v66[24] = v41;
  v66[25] = v40;
  v66[26] = v39;
  v66[27] = v38;
  v66[28] = v37;
  v66[29] = v36;
  v66[30] = v35;
  v66[31] = v34;
  v66[32] = v33;
  v66[33] = v32;
  v66[34] = v31;
  v66[35] = v30;
  v66[36] = v29;
  v66[37] = v28;
  v66[38] = v27;
  v66[39] = v26;
  v66[40] = v25;
  v66[41] = v24;
  v66[42] = v23;
  v66[43] = v22;
  v66[44] = v21;
  v66[45] = v20;
  v66[46] = v19;
  v66[47] = v18;
  v66[48] = v17;
  v66[49] = v16;
  v66[50] = v15;
  v66[51] = v14;
  v66[52] = v2;
  v66[53] = v3;
  v66[54] = v4;
  v66[55] = v13;
  v66[56] = v5;
  v66[57] = v12;
  v66[58] = v6;
  v66[59] = v11;
  v66[60] = v7;
  v66[61] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:62];

  return v10;
}

id __34__BMMomentsEventDataEvent_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 gaPR];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __34__BMMomentsEventDataEvent_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _photoMomentHolidaysJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __34__BMMomentsEventDataEvent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _photoMomentInferencesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __34__BMMomentsEventDataEvent_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _contactIDsInConversationJSONArray];
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
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMMomentsEventDataEvent alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[34] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (BMMomentsEventDataEvent)initWithEventIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 creationDate:(id)a6 sourceCreationDate:(id)a7 expirationDate:(id)a8 provider:(int)a9 category:(int)a10 placeUserType:(int)a11 poiCategory:(int)a12 placeDiscovery:(int)a13 locationMode:(int)a14 workoutType:(int)a15 workoutBundleID:(id)a16 mediaGenre:(int)a17 mediaType:(int)a18 mediaRepetitions:(id)a19 mediaSumTimePlayed:(id)a20 sourceParty:(int)a21 mediaPlayerBundleID:(id)a22 numAudioMediaPlaySessionsPerDay:(id)a23 durationAudioMediaPlaySessionsPerDay:(id)a24 numVideoMediaPlaySessionsPerDay:(id)a25 durationVideoMediaPlaySessionsPerDay:(id)a26 numFirstPartyMediaPlaySessionsPerDay:(id)a27 numThirdPartyMediaPlaySessionsPerDay:(id)a28 numContacts:(id)a29 contactIDsInConversation:(id)a30 contactIDMostSignificantInConversation:(id)a31 interactionContactScore:(id)a32 textLikeMechanismIncluded:(id)a33 callLikeMechanismIncluded:(id)a34 numTextLikeInteractions:(id)a35 numAudioLikeInteractions:(id)a36 numVideoLikeInteractions:(id)a37 totalDurationOfCallLikeInteractions:(id)a38 minDurationOfCallLikeInteractions:(id)a39 maxDurationOfCallLikeInteractions:(id)a40 photoMomentSource:(int)a41 photoMomentInferences:(id)a42 photoMomentHolidays:(id)a43 numPhotoMomentHolidays:(id)a44 numPhotoMomentInferences:(id)a45 numPhotoMomentPublicEvents:(id)a46 numPhotoMomentPersons:(id)a47 isFamilyInPhotoMoment:(id)a48 momentIncludesFavoritedAsset:(id)a49 momentIncludesVideo:(id)a50 momentIncludesPhoto:(id)a51 suggestedEventCategory:(int)a52 numAttendees:(id)a53 numtripParts:(id)a54 tripMode:(int)a55 numScoredTopics:(id)a56 numItemAuthors:(id)a57 numItemRecipients:(id)a58
{
  LODWORD(v64) = 0;
  LODWORD(v63) = a55;
  LODWORD(v62) = a52;
  LODWORD(v61) = a41;
  LODWORD(v60) = a21;
  LODWORD(v59) = a15;
  return -[BMMomentsEventDataEvent initWithEventIdentifier:startDate:endDate:creationDate:sourceCreationDate:expirationDate:provider:category:placeUserType:poiCategory:placeDiscovery:locationMode:workoutType:workoutBundleID:mediaGenre:mediaType:mediaRepetitions:mediaSumTimePlayed:sourceParty:mediaPlayerBundleID:numAudioMediaPlaySessionsPerDay:durationAudioMediaPlaySessionsPerDay:numVideoMediaPlaySessionsPerDay:durationVideoMediaPlaySessionsPerDay:numFirstPartyMediaPlaySessionsPerDay:numThirdPartyMediaPlaySessionsPerDay:numContacts:contactIDsInConversation:contactIDMostSignificantInConversation:interactionContactScore:textLikeMechanismIncluded:callLikeMechanismIncluded:numTextLikeInteractions:numAudioLikeInteractions:numVideoLikeInteractions:totalDurationOfCallLikeInteractions:minDurationOfCallLikeInteractions:maxDurationOfCallLikeInteractions:photoMomentSource:photoMomentInferences:photoMomentHolidays:numPhotoMomentHolidays:numPhotoMomentInferences:numPhotoMomentPublicEvents:numPhotoMomentPersons:isFamilyInPhotoMoment:momentIncludesFavoritedAsset:momentIncludesVideo:momentIncludesPhoto:suggestedEventCategory:numAttendees:numtripParts:tripMode:numScoredTopics:numItemAuthors:numItemRecipients:isGatheringComplete:gaPR:pCount:mapItemSource:placeType:placeLabelGranularity:](self, "initWithEventIdentifier:startDate:endDate:creationDate:sourceCreationDate:expirationDate:provider:category:placeUserType:poiCategory:placeDiscovery:locationMode:workoutType:workoutBundleID:mediaGenre:mediaType:mediaRepetitions:mediaSumTimePlayed:sourceParty:mediaPlayerBundleID:numAudioMediaPlaySessionsPerDay:durationAudioMediaPlaySessionsPerDay:numVideoMediaPlaySessionsPerDay:durationVideoMediaPlaySessionsPerDay:numFirstPartyMediaPlaySessionsPerDay:numThirdPartyMediaPlaySessionsPerDay:numContacts:contactIDsInConversation:contactIDMostSignificantInConversation:interactionContactScore:textLikeMechanismIncluded:callLikeMechanismIncluded:numTextLikeInteractions:numAudioLikeInteractions:numVideoLikeInteractions:totalDurationOfCallLikeInteractions:minDurationOfCallLikeInteractions:maxDurationOfCallLikeInteractions:photoMomentSource:photoMomentInferences:photoMomentHolidays:numPhotoMomentHolidays:numPhotoMomentInferences:numPhotoMomentPublicEvents:numPhotoMomentPersons:isFamilyInPhotoMoment:momentIncludesFavoritedAsset:momentIncludesVideo:momentIncludesPhoto:suggestedEventCategory:numAttendees:numtripParts:tripMode:numScoredTopics:numItemAuthors:numItemRecipients:isGatheringComplete:gaPR:pCount:mapItemSource:placeType:placeLabelGranularity:", a3, a4, a5, a6, a7, a8,
           *(void *)&a9,
           *(void *)&a11,
           *(void *)&a13,
           v59,
           a16,
           __PAIR64__(a18, a17),
           a19,
           a20,
           v60,
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
           v61,
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
           v62,
           a53,
           a54,
           v63,
           a56,
           a57,
           a58,
           0,
           0,
           0,
           0,
           v64);
}

@end