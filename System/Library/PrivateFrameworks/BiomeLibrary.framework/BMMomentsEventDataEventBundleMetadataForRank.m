@interface BMMomentsEventDataEventBundleMetadataForRank
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMomentsEventDataEventBundleMetadataForRank)initWithDailyAggregateCallDuration:(id)a3 callDuration:(id)a4 burstyInteractionCount:(id)a5 burstyOutgoingInteractionCount:(id)a6 multipleInteractionTypes:(id)a7 contactLocationWork:(id)a8 isFamilyContact:(id)a9 isCoworkerContact:(id)a10 isRepetitiveContact:(id)a11 isGroupConversation:(id)a12 peopleCountWeightedSum:(id)a13 peopleCountWeightedAverage:(id)a14 peopleCountMax:(id)a15 peopleDensityWeightedSum:(id)a16 peopleDensityWeightedAverage:(id)a17 peopleDensityMax:(id)a18 peopleDensityWeightedConfidenceSum:(id)a19 peopleDensityWeightedConfidenceAverage:(id)a20 mediaTotalPlayTime:(id)a21 mediaLength:(id)a22 mediaActionIsRepeat:(id)a23 timeAtHomeDuration:(id)a24 photosAtHomeCurationScore:(id)a25 workoutDuration:(id)a26 motionActivityWalkSpan:(id)a27 visitDuration:(id)a28 poiCategoryInterestingness:(id)a29 familiarityIndex:(id)a30 stateOfMindDomains:(id)a31 stateOfMindLabels:(id)a32 stateOfMindReflectiveIntervals:(id)a33 stateOfMindValenceClassifications:(id)a34 stateOfMindValenceValues:(id)a35 stateOfMindLoggedIn3pApp:(id)a36 stateOfMindLoggedInJournalApp:(id)a37;
- (BMMomentsEventDataEventBundleMetadataForRank)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)contactLocationWork;
- (BOOL)hasBurstyInteractionCount;
- (BOOL)hasBurstyOutgoingInteractionCount;
- (BOOL)hasCallDuration;
- (BOOL)hasContactLocationWork;
- (BOOL)hasDailyAggregateCallDuration;
- (BOOL)hasFamiliarityIndex;
- (BOOL)hasIsCoworkerContact;
- (BOOL)hasIsFamilyContact;
- (BOOL)hasIsGroupConversation;
- (BOOL)hasIsRepetitiveContact;
- (BOOL)hasMediaActionIsRepeat;
- (BOOL)hasMediaLength;
- (BOOL)hasMediaTotalPlayTime;
- (BOOL)hasMotionActivityWalkSpan;
- (BOOL)hasMultipleInteractionTypes;
- (BOOL)hasPeopleCountMax;
- (BOOL)hasPeopleCountWeightedAverage;
- (BOOL)hasPeopleCountWeightedSum;
- (BOOL)hasPeopleDensityMax;
- (BOOL)hasPeopleDensityWeightedAverage;
- (BOOL)hasPeopleDensityWeightedConfidenceAverage;
- (BOOL)hasPeopleDensityWeightedConfidenceSum;
- (BOOL)hasPeopleDensityWeightedSum;
- (BOOL)hasPhotosAtHomeCurationScore;
- (BOOL)hasPoiCategoryInterestingness;
- (BOOL)hasStateOfMindLoggedIn3pApp;
- (BOOL)hasStateOfMindLoggedInJournalApp;
- (BOOL)hasTimeAtHomeDuration;
- (BOOL)hasVisitDuration;
- (BOOL)hasWorkoutDuration;
- (BOOL)isCoworkerContact;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFamilyContact;
- (BOOL)isGroupConversation;
- (BOOL)isRepetitiveContact;
- (BOOL)mediaActionIsRepeat;
- (BOOL)multipleInteractionTypes;
- (BOOL)stateOfMindLoggedIn3pApp;
- (BOOL)stateOfMindLoggedInJournalApp;
- (NSArray)stateOfMindDomains;
- (NSArray)stateOfMindLabels;
- (NSArray)stateOfMindReflectiveIntervals;
- (NSArray)stateOfMindValenceClassifications;
- (NSArray)stateOfMindValenceValues;
- (NSString)description;
- (double)callDuration;
- (double)dailyAggregateCallDuration;
- (double)familiarityIndex;
- (double)mediaLength;
- (double)mediaTotalPlayTime;
- (double)motionActivityWalkSpan;
- (double)peopleCountMax;
- (double)peopleCountWeightedAverage;
- (double)peopleCountWeightedSum;
- (double)peopleDensityMax;
- (double)peopleDensityWeightedAverage;
- (double)peopleDensityWeightedConfidenceAverage;
- (double)peopleDensityWeightedConfidenceSum;
- (double)peopleDensityWeightedSum;
- (double)photosAtHomeCurationScore;
- (double)poiCategoryInterestingness;
- (double)timeAtHomeDuration;
- (double)visitDuration;
- (double)workoutDuration;
- (id)_stateOfMindDomainsJSONArray;
- (id)_stateOfMindLabelsJSONArray;
- (id)_stateOfMindReflectiveIntervalsJSONArray;
- (id)_stateOfMindValenceClassificationsJSONArray;
- (id)_stateOfMindValenceValuesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)burstyInteractionCount;
- (int)burstyOutgoingInteractionCount;
- (unsigned)dataVersion;
- (void)setHasBurstyInteractionCount:(BOOL)a3;
- (void)setHasBurstyOutgoingInteractionCount:(BOOL)a3;
- (void)setHasCallDuration:(BOOL)a3;
- (void)setHasContactLocationWork:(BOOL)a3;
- (void)setHasDailyAggregateCallDuration:(BOOL)a3;
- (void)setHasFamiliarityIndex:(BOOL)a3;
- (void)setHasIsCoworkerContact:(BOOL)a3;
- (void)setHasIsFamilyContact:(BOOL)a3;
- (void)setHasIsGroupConversation:(BOOL)a3;
- (void)setHasIsRepetitiveContact:(BOOL)a3;
- (void)setHasMediaActionIsRepeat:(BOOL)a3;
- (void)setHasMediaLength:(BOOL)a3;
- (void)setHasMediaTotalPlayTime:(BOOL)a3;
- (void)setHasMotionActivityWalkSpan:(BOOL)a3;
- (void)setHasMultipleInteractionTypes:(BOOL)a3;
- (void)setHasPeopleCountMax:(BOOL)a3;
- (void)setHasPeopleCountWeightedAverage:(BOOL)a3;
- (void)setHasPeopleCountWeightedSum:(BOOL)a3;
- (void)setHasPeopleDensityMax:(BOOL)a3;
- (void)setHasPeopleDensityWeightedAverage:(BOOL)a3;
- (void)setHasPeopleDensityWeightedConfidenceAverage:(BOOL)a3;
- (void)setHasPeopleDensityWeightedConfidenceSum:(BOOL)a3;
- (void)setHasPeopleDensityWeightedSum:(BOOL)a3;
- (void)setHasPhotosAtHomeCurationScore:(BOOL)a3;
- (void)setHasPoiCategoryInterestingness:(BOOL)a3;
- (void)setHasStateOfMindLoggedIn3pApp:(BOOL)a3;
- (void)setHasStateOfMindLoggedInJournalApp:(BOOL)a3;
- (void)setHasTimeAtHomeDuration:(BOOL)a3;
- (void)setHasVisitDuration:(BOOL)a3;
- (void)setHasWorkoutDuration:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMomentsEventDataEventBundleMetadataForRank

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateOfMindValenceValues, 0);
  objc_storeStrong((id *)&self->_stateOfMindValenceClassifications, 0);
  objc_storeStrong((id *)&self->_stateOfMindReflectiveIntervals, 0);
  objc_storeStrong((id *)&self->_stateOfMindLabels, 0);

  objc_storeStrong((id *)&self->_stateOfMindDomains, 0);
}

- (void)setHasStateOfMindLoggedInJournalApp:(BOOL)a3
{
  self->_hasStateOfMindLoggedInJournalApp = a3;
}

- (BOOL)hasStateOfMindLoggedInJournalApp
{
  return self->_hasStateOfMindLoggedInJournalApp;
}

- (BOOL)stateOfMindLoggedInJournalApp
{
  return self->_stateOfMindLoggedInJournalApp;
}

- (void)setHasStateOfMindLoggedIn3pApp:(BOOL)a3
{
  self->_hasStateOfMindLoggedIn3pApp = a3;
}

- (BOOL)hasStateOfMindLoggedIn3pApp
{
  return self->_hasStateOfMindLoggedIn3pApp;
}

- (BOOL)stateOfMindLoggedIn3pApp
{
  return self->_stateOfMindLoggedIn3pApp;
}

- (NSArray)stateOfMindValenceValues
{
  return self->_stateOfMindValenceValues;
}

- (NSArray)stateOfMindValenceClassifications
{
  return self->_stateOfMindValenceClassifications;
}

- (NSArray)stateOfMindReflectiveIntervals
{
  return self->_stateOfMindReflectiveIntervals;
}

- (NSArray)stateOfMindLabels
{
  return self->_stateOfMindLabels;
}

- (NSArray)stateOfMindDomains
{
  return self->_stateOfMindDomains;
}

- (void)setHasFamiliarityIndex:(BOOL)a3
{
  self->_hasFamiliarityIndex = a3;
}

- (BOOL)hasFamiliarityIndex
{
  return self->_hasFamiliarityIndex;
}

- (double)familiarityIndex
{
  return self->_familiarityIndex;
}

- (void)setHasPoiCategoryInterestingness:(BOOL)a3
{
  self->_hasPoiCategoryInterestingness = a3;
}

- (BOOL)hasPoiCategoryInterestingness
{
  return self->_hasPoiCategoryInterestingness;
}

- (double)poiCategoryInterestingness
{
  return self->_poiCategoryInterestingness;
}

- (void)setHasVisitDuration:(BOOL)a3
{
  self->_hasVisitDuration = a3;
}

- (BOOL)hasVisitDuration
{
  return self->_hasVisitDuration;
}

- (double)visitDuration
{
  return self->_visitDuration;
}

- (void)setHasMotionActivityWalkSpan:(BOOL)a3
{
  self->_hasMotionActivityWalkSpan = a3;
}

- (BOOL)hasMotionActivityWalkSpan
{
  return self->_hasMotionActivityWalkSpan;
}

- (double)motionActivityWalkSpan
{
  return self->_motionActivityWalkSpan;
}

- (void)setHasWorkoutDuration:(BOOL)a3
{
  self->_hasWorkoutDuration = a3;
}

- (BOOL)hasWorkoutDuration
{
  return self->_hasWorkoutDuration;
}

- (double)workoutDuration
{
  return self->_workoutDuration;
}

- (void)setHasPhotosAtHomeCurationScore:(BOOL)a3
{
  self->_hasPhotosAtHomeCurationScore = a3;
}

- (BOOL)hasPhotosAtHomeCurationScore
{
  return self->_hasPhotosAtHomeCurationScore;
}

- (double)photosAtHomeCurationScore
{
  return self->_photosAtHomeCurationScore;
}

- (void)setHasTimeAtHomeDuration:(BOOL)a3
{
  self->_hasTimeAtHomeDuration = a3;
}

- (BOOL)hasTimeAtHomeDuration
{
  return self->_hasTimeAtHomeDuration;
}

- (double)timeAtHomeDuration
{
  return self->_timeAtHomeDuration;
}

- (void)setHasMediaActionIsRepeat:(BOOL)a3
{
  self->_hasMediaActionIsRepeat = a3;
}

- (BOOL)hasMediaActionIsRepeat
{
  return self->_hasMediaActionIsRepeat;
}

- (BOOL)mediaActionIsRepeat
{
  return self->_mediaActionIsRepeat;
}

- (void)setHasMediaLength:(BOOL)a3
{
  self->_hasMediaLength = a3;
}

- (BOOL)hasMediaLength
{
  return self->_hasMediaLength;
}

- (double)mediaLength
{
  return self->_mediaLength;
}

- (void)setHasMediaTotalPlayTime:(BOOL)a3
{
  self->_hasMediaTotalPlayTime = a3;
}

- (BOOL)hasMediaTotalPlayTime
{
  return self->_hasMediaTotalPlayTime;
}

- (double)mediaTotalPlayTime
{
  return self->_mediaTotalPlayTime;
}

- (void)setHasPeopleDensityWeightedConfidenceAverage:(BOOL)a3
{
  self->_hasPeopleDensityWeightedConfidenceAverage = a3;
}

- (BOOL)hasPeopleDensityWeightedConfidenceAverage
{
  return self->_hasPeopleDensityWeightedConfidenceAverage;
}

- (double)peopleDensityWeightedConfidenceAverage
{
  return self->_peopleDensityWeightedConfidenceAverage;
}

- (void)setHasPeopleDensityWeightedConfidenceSum:(BOOL)a3
{
  self->_hasPeopleDensityWeightedConfidenceSum = a3;
}

- (BOOL)hasPeopleDensityWeightedConfidenceSum
{
  return self->_hasPeopleDensityWeightedConfidenceSum;
}

- (double)peopleDensityWeightedConfidenceSum
{
  return self->_peopleDensityWeightedConfidenceSum;
}

- (void)setHasPeopleDensityMax:(BOOL)a3
{
  self->_hasPeopleDensityMax = a3;
}

- (BOOL)hasPeopleDensityMax
{
  return self->_hasPeopleDensityMax;
}

- (double)peopleDensityMax
{
  return self->_peopleDensityMax;
}

- (void)setHasPeopleDensityWeightedAverage:(BOOL)a3
{
  self->_hasPeopleDensityWeightedAverage = a3;
}

- (BOOL)hasPeopleDensityWeightedAverage
{
  return self->_hasPeopleDensityWeightedAverage;
}

- (double)peopleDensityWeightedAverage
{
  return self->_peopleDensityWeightedAverage;
}

- (void)setHasPeopleDensityWeightedSum:(BOOL)a3
{
  self->_hasPeopleDensityWeightedSum = a3;
}

- (BOOL)hasPeopleDensityWeightedSum
{
  return self->_hasPeopleDensityWeightedSum;
}

- (double)peopleDensityWeightedSum
{
  return self->_peopleDensityWeightedSum;
}

- (void)setHasPeopleCountMax:(BOOL)a3
{
  self->_hasPeopleCountMax = a3;
}

- (BOOL)hasPeopleCountMax
{
  return self->_hasPeopleCountMax;
}

- (double)peopleCountMax
{
  return self->_peopleCountMax;
}

- (void)setHasPeopleCountWeightedAverage:(BOOL)a3
{
  self->_hasPeopleCountWeightedAverage = a3;
}

- (BOOL)hasPeopleCountWeightedAverage
{
  return self->_hasPeopleCountWeightedAverage;
}

- (double)peopleCountWeightedAverage
{
  return self->_peopleCountWeightedAverage;
}

- (void)setHasPeopleCountWeightedSum:(BOOL)a3
{
  self->_hasPeopleCountWeightedSum = a3;
}

- (BOOL)hasPeopleCountWeightedSum
{
  return self->_hasPeopleCountWeightedSum;
}

- (double)peopleCountWeightedSum
{
  return self->_peopleCountWeightedSum;
}

- (void)setHasIsGroupConversation:(BOOL)a3
{
  self->_hasIsGroupConversation = a3;
}

- (BOOL)hasIsGroupConversation
{
  return self->_hasIsGroupConversation;
}

- (BOOL)isGroupConversation
{
  return self->_isGroupConversation;
}

- (void)setHasIsRepetitiveContact:(BOOL)a3
{
  self->_hasIsRepetitiveContact = a3;
}

- (BOOL)hasIsRepetitiveContact
{
  return self->_hasIsRepetitiveContact;
}

- (BOOL)isRepetitiveContact
{
  return self->_isRepetitiveContact;
}

- (void)setHasIsCoworkerContact:(BOOL)a3
{
  self->_hasIsCoworkerContact = a3;
}

- (BOOL)hasIsCoworkerContact
{
  return self->_hasIsCoworkerContact;
}

- (BOOL)isCoworkerContact
{
  return self->_isCoworkerContact;
}

- (void)setHasIsFamilyContact:(BOOL)a3
{
  self->_hasIsFamilyContact = a3;
}

- (BOOL)hasIsFamilyContact
{
  return self->_hasIsFamilyContact;
}

- (BOOL)isFamilyContact
{
  return self->_isFamilyContact;
}

- (void)setHasContactLocationWork:(BOOL)a3
{
  self->_hasContactLocationWork = a3;
}

- (BOOL)hasContactLocationWork
{
  return self->_hasContactLocationWork;
}

- (BOOL)contactLocationWork
{
  return self->_contactLocationWork;
}

- (void)setHasMultipleInteractionTypes:(BOOL)a3
{
  self->_hasMultipleInteractionTypes = a3;
}

- (BOOL)hasMultipleInteractionTypes
{
  return self->_hasMultipleInteractionTypes;
}

- (BOOL)multipleInteractionTypes
{
  return self->_multipleInteractionTypes;
}

- (void)setHasBurstyOutgoingInteractionCount:(BOOL)a3
{
  self->_hasBurstyOutgoingInteractionCount = a3;
}

- (BOOL)hasBurstyOutgoingInteractionCount
{
  return self->_hasBurstyOutgoingInteractionCount;
}

- (int)burstyOutgoingInteractionCount
{
  return self->_burstyOutgoingInteractionCount;
}

- (void)setHasBurstyInteractionCount:(BOOL)a3
{
  self->_hasBurstyInteractionCount = a3;
}

- (BOOL)hasBurstyInteractionCount
{
  return self->_hasBurstyInteractionCount;
}

- (int)burstyInteractionCount
{
  return self->_burstyInteractionCount;
}

- (void)setHasCallDuration:(BOOL)a3
{
  self->_hasCallDuration = a3;
}

- (BOOL)hasCallDuration
{
  return self->_hasCallDuration;
}

- (double)callDuration
{
  return self->_callDuration;
}

- (void)setHasDailyAggregateCallDuration:(BOOL)a3
{
  self->_hasDailyAggregateCallDuration = a3;
}

- (BOOL)hasDailyAggregateCallDuration
{
  return self->_hasDailyAggregateCallDuration;
}

- (double)dailyAggregateCallDuration
{
  return self->_dailyAggregateCallDuration;
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
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasDailyAggregateCallDuration](self, "hasDailyAggregateCallDuration")|| [v5 hasDailyAggregateCallDuration])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasDailyAggregateCallDuration])goto LABEL_173; {
      if (![v5 hasDailyAggregateCallDuration])
      }
        goto LABEL_173;
      [(BMMomentsEventDataEventBundleMetadataForRank *)self dailyAggregateCallDuration];
      double v7 = v6;
      [v5 dailyAggregateCallDuration];
      if (v7 != v8) {
        goto LABEL_173;
      }
    }
    if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasCallDuration]
      || [v5 hasCallDuration])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasCallDuration]) {
        goto LABEL_173;
      }
      if (![v5 hasCallDuration]) {
        goto LABEL_173;
      }
      [(BMMomentsEventDataEventBundleMetadataForRank *)self callDuration];
      double v10 = v9;
      [v5 callDuration];
      if (v10 != v11) {
        goto LABEL_173;
      }
    }
    if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasBurstyInteractionCount]
      || [v5 hasBurstyInteractionCount])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasBurstyInteractionCount]) {
        goto LABEL_173;
      }
      if (![v5 hasBurstyInteractionCount]) {
        goto LABEL_173;
      }
      int v12 = [(BMMomentsEventDataEventBundleMetadataForRank *)self burstyInteractionCount];
      if (v12 != [v5 burstyInteractionCount]) {
        goto LABEL_173;
      }
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasBurstyOutgoingInteractionCount](self, "hasBurstyOutgoingInteractionCount")|| [v5 hasBurstyOutgoingInteractionCount])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasBurstyOutgoingInteractionCount])goto LABEL_173; {
      if (![v5 hasBurstyOutgoingInteractionCount])
      }
        goto LABEL_173;
      int v13 = [(BMMomentsEventDataEventBundleMetadataForRank *)self burstyOutgoingInteractionCount];
      if (v13 != [v5 burstyOutgoingInteractionCount]) {
        goto LABEL_173;
      }
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasMultipleInteractionTypes](self, "hasMultipleInteractionTypes")|| [v5 hasMultipleInteractionTypes])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasMultipleInteractionTypes])goto LABEL_173; {
      if (![v5 hasMultipleInteractionTypes])
      }
        goto LABEL_173;
      int v14 = [(BMMomentsEventDataEventBundleMetadataForRank *)self multipleInteractionTypes];
      if (v14 != [v5 multipleInteractionTypes]) {
        goto LABEL_173;
      }
    }
    if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasContactLocationWork]
      || [v5 hasContactLocationWork])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasContactLocationWork]) {
        goto LABEL_173;
      }
      if (![v5 hasContactLocationWork]) {
        goto LABEL_173;
      }
      int v15 = [(BMMomentsEventDataEventBundleMetadataForRank *)self contactLocationWork];
      if (v15 != [v5 contactLocationWork]) {
        goto LABEL_173;
      }
    }
    if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasIsFamilyContact]
      || [v5 hasIsFamilyContact])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasIsFamilyContact]) {
        goto LABEL_173;
      }
      if (![v5 hasIsFamilyContact]) {
        goto LABEL_173;
      }
      int v16 = [(BMMomentsEventDataEventBundleMetadataForRank *)self isFamilyContact];
      if (v16 != [v5 isFamilyContact]) {
        goto LABEL_173;
      }
    }
    if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasIsCoworkerContact]
      || [v5 hasIsCoworkerContact])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasIsCoworkerContact]) {
        goto LABEL_173;
      }
      if (![v5 hasIsCoworkerContact]) {
        goto LABEL_173;
      }
      int v17 = [(BMMomentsEventDataEventBundleMetadataForRank *)self isCoworkerContact];
      if (v17 != [v5 isCoworkerContact]) {
        goto LABEL_173;
      }
    }
    if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasIsRepetitiveContact]
      || [v5 hasIsRepetitiveContact])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasIsRepetitiveContact]) {
        goto LABEL_173;
      }
      if (![v5 hasIsRepetitiveContact]) {
        goto LABEL_173;
      }
      int v18 = [(BMMomentsEventDataEventBundleMetadataForRank *)self isRepetitiveContact];
      if (v18 != [v5 isRepetitiveContact]) {
        goto LABEL_173;
      }
    }
    if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasIsGroupConversation]
      || [v5 hasIsGroupConversation])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasIsGroupConversation]) {
        goto LABEL_173;
      }
      if (![v5 hasIsGroupConversation]) {
        goto LABEL_173;
      }
      int v19 = [(BMMomentsEventDataEventBundleMetadataForRank *)self isGroupConversation];
      if (v19 != [v5 isGroupConversation]) {
        goto LABEL_173;
      }
    }
    if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleCountWeightedSum]
      || [v5 hasPeopleCountWeightedSum])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleCountWeightedSum]) {
        goto LABEL_173;
      }
      if (![v5 hasPeopleCountWeightedSum]) {
        goto LABEL_173;
      }
      [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleCountWeightedSum];
      double v21 = v20;
      [v5 peopleCountWeightedSum];
      if (v21 != v22) {
        goto LABEL_173;
      }
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleCountWeightedAverage](self, "hasPeopleCountWeightedAverage")|| [v5 hasPeopleCountWeightedAverage])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleCountWeightedAverage])goto LABEL_173; {
      if (![v5 hasPeopleCountWeightedAverage])
      }
        goto LABEL_173;
      [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleCountWeightedAverage];
      double v24 = v23;
      [v5 peopleCountWeightedAverage];
      if (v24 != v25) {
        goto LABEL_173;
      }
    }
    if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleCountMax]
      || [v5 hasPeopleCountMax])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleCountMax]) {
        goto LABEL_173;
      }
      if (![v5 hasPeopleCountMax]) {
        goto LABEL_173;
      }
      [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleCountMax];
      double v27 = v26;
      [v5 peopleCountMax];
      if (v27 != v28) {
        goto LABEL_173;
      }
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityWeightedSum](self, "hasPeopleDensityWeightedSum")|| [v5 hasPeopleDensityWeightedSum])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleDensityWeightedSum])goto LABEL_173; {
      if (![v5 hasPeopleDensityWeightedSum])
      }
        goto LABEL_173;
      [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityWeightedSum];
      double v30 = v29;
      [v5 peopleDensityWeightedSum];
      if (v30 != v31) {
        goto LABEL_173;
      }
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityWeightedAverage](self, "hasPeopleDensityWeightedAverage")|| [v5 hasPeopleDensityWeightedAverage])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleDensityWeightedAverage])goto LABEL_173; {
      if (![v5 hasPeopleDensityWeightedAverage])
      }
        goto LABEL_173;
      [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityWeightedAverage];
      double v33 = v32;
      [v5 peopleDensityWeightedAverage];
      if (v33 != v34) {
        goto LABEL_173;
      }
    }
    if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleDensityMax]
      || [v5 hasPeopleDensityMax])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleDensityMax]) {
        goto LABEL_173;
      }
      if (![v5 hasPeopleDensityMax]) {
        goto LABEL_173;
      }
      [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityMax];
      double v36 = v35;
      [v5 peopleDensityMax];
      if (v36 != v37) {
        goto LABEL_173;
      }
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityWeightedConfidenceSum](self, "hasPeopleDensityWeightedConfidenceSum")|| [v5 hasPeopleDensityWeightedConfidenceSum])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleDensityWeightedConfidenceSum])goto LABEL_173; {
      if (![v5 hasPeopleDensityWeightedConfidenceSum])
      }
        goto LABEL_173;
      [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityWeightedConfidenceSum];
      double v39 = v38;
      [v5 peopleDensityWeightedConfidenceSum];
      if (v39 != v40) {
        goto LABEL_173;
      }
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasPeopleDensityWeightedConfidenceAverage](self, "hasPeopleDensityWeightedConfidenceAverage")|| [v5 hasPeopleDensityWeightedConfidenceAverage])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleDensityWeightedConfidenceAverage])goto LABEL_173; {
      if (![v5 hasPeopleDensityWeightedConfidenceAverage])
      }
        goto LABEL_173;
      [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityWeightedConfidenceAverage];
      double v42 = v41;
      [v5 peopleDensityWeightedConfidenceAverage];
      if (v42 != v43) {
        goto LABEL_173;
      }
    }
    if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasMediaTotalPlayTime]
      || [v5 hasMediaTotalPlayTime])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasMediaTotalPlayTime]) {
        goto LABEL_173;
      }
      if (![v5 hasMediaTotalPlayTime]) {
        goto LABEL_173;
      }
      [(BMMomentsEventDataEventBundleMetadataForRank *)self mediaTotalPlayTime];
      double v45 = v44;
      [v5 mediaTotalPlayTime];
      if (v45 != v46) {
        goto LABEL_173;
      }
    }
    if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasMediaLength]
      || [v5 hasMediaLength])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasMediaLength]) {
        goto LABEL_173;
      }
      if (![v5 hasMediaLength]) {
        goto LABEL_173;
      }
      [(BMMomentsEventDataEventBundleMetadataForRank *)self mediaLength];
      double v48 = v47;
      [v5 mediaLength];
      if (v48 != v49) {
        goto LABEL_173;
      }
    }
    if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasMediaActionIsRepeat]
      || [v5 hasMediaActionIsRepeat])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasMediaActionIsRepeat]) {
        goto LABEL_173;
      }
      if (![v5 hasMediaActionIsRepeat]) {
        goto LABEL_173;
      }
      int v50 = [(BMMomentsEventDataEventBundleMetadataForRank *)self mediaActionIsRepeat];
      if (v50 != [v5 mediaActionIsRepeat]) {
        goto LABEL_173;
      }
    }
    if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasTimeAtHomeDuration]
      || [v5 hasTimeAtHomeDuration])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasTimeAtHomeDuration]) {
        goto LABEL_173;
      }
      if (![v5 hasTimeAtHomeDuration]) {
        goto LABEL_173;
      }
      [(BMMomentsEventDataEventBundleMetadataForRank *)self timeAtHomeDuration];
      double v52 = v51;
      [v5 timeAtHomeDuration];
      if (v52 != v53) {
        goto LABEL_173;
      }
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasPhotosAtHomeCurationScore](self, "hasPhotosAtHomeCurationScore")|| [v5 hasPhotosAtHomeCurationScore])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPhotosAtHomeCurationScore])goto LABEL_173; {
      if (![v5 hasPhotosAtHomeCurationScore])
      }
        goto LABEL_173;
      [(BMMomentsEventDataEventBundleMetadataForRank *)self photosAtHomeCurationScore];
      double v55 = v54;
      [v5 photosAtHomeCurationScore];
      if (v55 != v56) {
        goto LABEL_173;
      }
    }
    if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasWorkoutDuration]
      || [v5 hasWorkoutDuration])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasWorkoutDuration]) {
        goto LABEL_173;
      }
      if (![v5 hasWorkoutDuration]) {
        goto LABEL_173;
      }
      [(BMMomentsEventDataEventBundleMetadataForRank *)self workoutDuration];
      double v58 = v57;
      [v5 workoutDuration];
      if (v58 != v59) {
        goto LABEL_173;
      }
    }
    if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasMotionActivityWalkSpan]
      || [v5 hasMotionActivityWalkSpan])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasMotionActivityWalkSpan]) {
        goto LABEL_173;
      }
      if (![v5 hasMotionActivityWalkSpan]) {
        goto LABEL_173;
      }
      [(BMMomentsEventDataEventBundleMetadataForRank *)self motionActivityWalkSpan];
      double v61 = v60;
      [v5 motionActivityWalkSpan];
      if (v61 != v62) {
        goto LABEL_173;
      }
    }
    if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasVisitDuration]
      || [v5 hasVisitDuration])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasVisitDuration]) {
        goto LABEL_173;
      }
      if (![v5 hasVisitDuration]) {
        goto LABEL_173;
      }
      [(BMMomentsEventDataEventBundleMetadataForRank *)self visitDuration];
      double v64 = v63;
      [v5 visitDuration];
      if (v64 != v65) {
        goto LABEL_173;
      }
    }
    if (-[BMMomentsEventDataEventBundleMetadataForRank hasPoiCategoryInterestingness](self, "hasPoiCategoryInterestingness")|| [v5 hasPoiCategoryInterestingness])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPoiCategoryInterestingness])goto LABEL_173; {
      if (![v5 hasPoiCategoryInterestingness])
      }
        goto LABEL_173;
      [(BMMomentsEventDataEventBundleMetadataForRank *)self poiCategoryInterestingness];
      double v67 = v66;
      [v5 poiCategoryInterestingness];
      if (v67 != v68) {
        goto LABEL_173;
      }
    }
    if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasFamiliarityIndex]
      || [v5 hasFamiliarityIndex])
    {
      if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasFamiliarityIndex]) {
        goto LABEL_173;
      }
      if (![v5 hasFamiliarityIndex]) {
        goto LABEL_173;
      }
      [(BMMomentsEventDataEventBundleMetadataForRank *)self familiarityIndex];
      double v70 = v69;
      [v5 familiarityIndex];
      if (v70 != v71) {
        goto LABEL_173;
      }
    }
    v72 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindDomains];
    uint64_t v73 = [v5 stateOfMindDomains];
    if (v72 == (void *)v73)
    {
    }
    else
    {
      v74 = (void *)v73;
      v75 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindDomains];
      v76 = [v5 stateOfMindDomains];
      int v77 = [v75 isEqual:v76];

      if (!v77) {
        goto LABEL_173;
      }
    }
    v79 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindLabels];
    uint64_t v80 = [v5 stateOfMindLabels];
    if (v79 == (void *)v80)
    {
    }
    else
    {
      v81 = (void *)v80;
      v82 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindLabels];
      v83 = [v5 stateOfMindLabels];
      int v84 = [v82 isEqual:v83];

      if (!v84) {
        goto LABEL_173;
      }
    }
    v85 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindReflectiveIntervals];
    uint64_t v86 = [v5 stateOfMindReflectiveIntervals];
    if (v85 == (void *)v86)
    {
    }
    else
    {
      v87 = (void *)v86;
      v88 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindReflectiveIntervals];
      v89 = [v5 stateOfMindReflectiveIntervals];
      int v90 = [v88 isEqual:v89];

      if (!v90) {
        goto LABEL_173;
      }
    }
    v91 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindValenceClassifications];
    uint64_t v92 = [v5 stateOfMindValenceClassifications];
    if (v91 == (void *)v92)
    {
    }
    else
    {
      v93 = (void *)v92;
      v94 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindValenceClassifications];
      v95 = [v5 stateOfMindValenceClassifications];
      int v96 = [v94 isEqual:v95];

      if (!v96) {
        goto LABEL_173;
      }
    }
    v97 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindValenceValues];
    uint64_t v98 = [v5 stateOfMindValenceValues];
    if (v97 == (void *)v98)
    {
    }
    else
    {
      v99 = (void *)v98;
      v100 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindValenceValues];
      v101 = [v5 stateOfMindValenceValues];
      int v102 = [v100 isEqual:v101];

      if (!v102) {
        goto LABEL_173;
      }
    }
    if (!-[BMMomentsEventDataEventBundleMetadataForRank hasStateOfMindLoggedIn3pApp](self, "hasStateOfMindLoggedIn3pApp")&& ![v5 hasStateOfMindLoggedIn3pApp]|| -[BMMomentsEventDataEventBundleMetadataForRank hasStateOfMindLoggedIn3pApp](self, "hasStateOfMindLoggedIn3pApp")&& objc_msgSend(v5, "hasStateOfMindLoggedIn3pApp")&& (int v103 = -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindLoggedIn3pApp](self, "stateOfMindLoggedIn3pApp"), v103 == objc_msgSend(v5, "stateOfMindLoggedIn3pApp")))
    {
      if (!-[BMMomentsEventDataEventBundleMetadataForRank hasStateOfMindLoggedInJournalApp](self, "hasStateOfMindLoggedInJournalApp")&& ![v5 hasStateOfMindLoggedInJournalApp])
      {
        LOBYTE(v78) = 1;
        goto LABEL_174;
      }
      if (-[BMMomentsEventDataEventBundleMetadataForRank hasStateOfMindLoggedInJournalApp](self, "hasStateOfMindLoggedInJournalApp")&& [v5 hasStateOfMindLoggedInJournalApp])
      {
        BOOL v104 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindLoggedInJournalApp];
        int v78 = v104 ^ [v5 stateOfMindLoggedInJournalApp] ^ 1;
LABEL_174:

        goto LABEL_175;
      }
    }
LABEL_173:
    LOBYTE(v78) = 0;
    goto LABEL_174;
  }
  LOBYTE(v78) = 0;
LABEL_175:

  return v78;
}

- (id)jsonDictionary
{
  v155[35] = *MEMORY[0x1E4F143B8];
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasDailyAggregateCallDuration]|| ([(BMMomentsEventDataEventBundleMetadataForRank *)self dailyAggregateCallDuration], fabs(v3) == INFINITY))
  {
    id v5 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self dailyAggregateCallDuration];
    id v4 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self dailyAggregateCallDuration];
    objc_msgSend(v4, "numberWithDouble:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasCallDuration]
    || ([(BMMomentsEventDataEventBundleMetadataForRank *)self callDuration], fabs(v6) == INFINITY))
  {
    id v8 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self callDuration];
    double v7 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self callDuration];
    objc_msgSend(v7, "numberWithDouble:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasBurstyInteractionCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundleMetadataForRank burstyInteractionCount](self, "burstyInteractionCount"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasBurstyOutgoingInteractionCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundleMetadataForRank burstyOutgoingInteractionCount](self, "burstyOutgoingInteractionCount"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
  if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasMultipleInteractionTypes])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank multipleInteractionTypes](self, "multipleInteractionTypes"));
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
  if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasContactLocationWork])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank contactLocationWork](self, "contactLocationWork"));
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }
  if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasIsFamilyContact])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank isFamilyContact](self, "isFamilyContact"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = 0;
  }
  if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasIsCoworkerContact])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank isCoworkerContact](self, "isCoworkerContact"));
    id v153 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v153 = 0;
  }
  if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasIsRepetitiveContact])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank isRepetitiveContact](self, "isRepetitiveContact"));
    id v152 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v152 = 0;
  }
  if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasIsGroupConversation])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank isGroupConversation](self, "isGroupConversation"));
    id v151 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v151 = 0;
  }
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleCountWeightedSum]
    || ([(BMMomentsEventDataEventBundleMetadataForRank *)self peopleCountWeightedSum],
        fabs(v14) == INFINITY))
  {
    id v150 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleCountWeightedSum];
    int v15 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleCountWeightedSum];
    objc_msgSend(v15, "numberWithDouble:");
    id v150 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleCountWeightedAverage]|| ([(BMMomentsEventDataEventBundleMetadataForRank *)self peopleCountWeightedAverage], fabs(v16) == INFINITY))
  {
    id v149 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleCountWeightedAverage];
    int v17 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleCountWeightedAverage];
    objc_msgSend(v17, "numberWithDouble:");
    id v149 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleCountMax]
    || ([(BMMomentsEventDataEventBundleMetadataForRank *)self peopleCountMax], fabs(v18) == INFINITY))
  {
    id v148 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleCountMax];
    int v19 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleCountMax];
    objc_msgSend(v19, "numberWithDouble:");
    id v148 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleDensityWeightedSum]
    || ([(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityWeightedSum],
        fabs(v20) == INFINITY))
  {
    id v147 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityWeightedSum];
    double v21 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityWeightedSum];
    objc_msgSend(v21, "numberWithDouble:");
    id v147 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleDensityWeightedAverage]|| ([(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityWeightedAverage], fabs(v22) == INFINITY))
  {
    id v146 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityWeightedAverage];
    double v23 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityWeightedAverage];
    objc_msgSend(v23, "numberWithDouble:");
    id v146 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleDensityMax]
    || ([(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityMax], fabs(v24) == INFINITY))
  {
    id v145 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityMax];
    double v25 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityMax];
    objc_msgSend(v25, "numberWithDouble:");
    id v145 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleDensityWeightedConfidenceSum]|| ([(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityWeightedConfidenceSum], fabs(v26) == INFINITY))
  {
    id v144 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityWeightedConfidenceSum];
    double v27 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityWeightedConfidenceSum];
    objc_msgSend(v27, "numberWithDouble:");
    id v144 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPeopleDensityWeightedConfidenceAverage]|| ([(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityWeightedConfidenceAverage], fabs(v28) == INFINITY))
  {
    id v143 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityWeightedConfidenceAverage];
    double v29 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self peopleDensityWeightedConfidenceAverage];
    objc_msgSend(v29, "numberWithDouble:");
    id v143 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasMediaTotalPlayTime]
    || ([(BMMomentsEventDataEventBundleMetadataForRank *)self mediaTotalPlayTime],
        fabs(v30) == INFINITY))
  {
    id v142 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self mediaTotalPlayTime];
    double v31 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self mediaTotalPlayTime];
    objc_msgSend(v31, "numberWithDouble:");
    id v142 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasMediaLength]
    || ([(BMMomentsEventDataEventBundleMetadataForRank *)self mediaLength], fabs(v32) == INFINITY))
  {
    id v141 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self mediaLength];
    double v33 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self mediaLength];
    objc_msgSend(v33, "numberWithDouble:");
    id v141 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasMediaActionIsRepeat])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank mediaActionIsRepeat](self, "mediaActionIsRepeat"));
    id v140 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v140 = 0;
  }
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasTimeAtHomeDuration]
    || ([(BMMomentsEventDataEventBundleMetadataForRank *)self timeAtHomeDuration],
        fabs(v34) == INFINITY))
  {
    id v139 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self timeAtHomeDuration];
    double v35 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self timeAtHomeDuration];
    objc_msgSend(v35, "numberWithDouble:");
    id v139 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPhotosAtHomeCurationScore]|| ([(BMMomentsEventDataEventBundleMetadataForRank *)self photosAtHomeCurationScore], fabs(v36) == INFINITY))
  {
    id v138 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self photosAtHomeCurationScore];
    double v37 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self photosAtHomeCurationScore];
    objc_msgSend(v37, "numberWithDouble:");
    id v138 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasWorkoutDuration]
    || ([(BMMomentsEventDataEventBundleMetadataForRank *)self workoutDuration], fabs(v38) == INFINITY))
  {
    id v137 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self workoutDuration];
    double v39 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self workoutDuration];
    objc_msgSend(v39, "numberWithDouble:");
    id v137 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasMotionActivityWalkSpan]
    || ([(BMMomentsEventDataEventBundleMetadataForRank *)self motionActivityWalkSpan],
        fabs(v40) == INFINITY))
  {
    id v136 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self motionActivityWalkSpan];
    double v41 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self motionActivityWalkSpan];
    objc_msgSend(v41, "numberWithDouble:");
    id v136 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasVisitDuration]
    || ([(BMMomentsEventDataEventBundleMetadataForRank *)self visitDuration], fabs(v42) == INFINITY))
  {
    id v135 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self visitDuration];
    double v43 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self visitDuration];
    objc_msgSend(v43, "numberWithDouble:");
    id v135 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasPoiCategoryInterestingness]|| ([(BMMomentsEventDataEventBundleMetadataForRank *)self poiCategoryInterestingness], fabs(v44) == INFINITY))
  {
    id v134 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self poiCategoryInterestingness];
    double v45 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self poiCategoryInterestingness];
    objc_msgSend(v45, "numberWithDouble:");
    id v134 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMMomentsEventDataEventBundleMetadataForRank *)self hasFamiliarityIndex]
    || ([(BMMomentsEventDataEventBundleMetadataForRank *)self familiarityIndex], fabs(v46) == INFINITY))
  {
    id v133 = 0;
  }
  else
  {
    [(BMMomentsEventDataEventBundleMetadataForRank *)self familiarityIndex];
    double v47 = NSNumber;
    [(BMMomentsEventDataEventBundleMetadataForRank *)self familiarityIndex];
    objc_msgSend(v47, "numberWithDouble:");
    id v133 = (id)objc_claimAutoreleasedReturnValue();
  }
  v132 = [(BMMomentsEventDataEventBundleMetadataForRank *)self _stateOfMindDomainsJSONArray];
  v131 = [(BMMomentsEventDataEventBundleMetadataForRank *)self _stateOfMindLabelsJSONArray];
  v130 = [(BMMomentsEventDataEventBundleMetadataForRank *)self _stateOfMindReflectiveIntervalsJSONArray];
  v129 = [(BMMomentsEventDataEventBundleMetadataForRank *)self _stateOfMindValenceClassificationsJSONArray];
  v128 = [(BMMomentsEventDataEventBundleMetadataForRank *)self _stateOfMindValenceValuesJSONArray];
  if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasStateOfMindLoggedIn3pApp])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindLoggedIn3pApp](self, "stateOfMindLoggedIn3pApp"));
    id v127 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v127 = 0;
  }
  if ([(BMMomentsEventDataEventBundleMetadataForRank *)self hasStateOfMindLoggedInJournalApp])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindLoggedInJournalApp](self, "stateOfMindLoggedInJournalApp"));
    id v126 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v126 = 0;
  }
  v154[0] = @"dailyAggregateCallDuration";
  uint64_t v48 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v48 = [MEMORY[0x1E4F1CA98] null];
  }
  v118 = (void *)v48;
  v155[0] = v48;
  v154[1] = @"callDuration";
  uint64_t v49 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v49 = [MEMORY[0x1E4F1CA98] null];
  }
  v117 = (void *)v49;
  v155[1] = v49;
  v154[2] = @"burstyInteractionCount";
  uint64_t v50 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v50 = [MEMORY[0x1E4F1CA98] null];
  }
  v116 = (void *)v50;
  v155[2] = v50;
  v154[3] = @"burstyOutgoingInteractionCount";
  uint64_t v51 = (uint64_t)v10;
  if (!v10)
  {
    uint64_t v51 = [MEMORY[0x1E4F1CA98] null];
  }
  v115 = (void *)v51;
  v155[3] = v51;
  v154[4] = @"multipleInteractionTypes";
  uint64_t v52 = (uint64_t)v11;
  if (!v11)
  {
    uint64_t v52 = [MEMORY[0x1E4F1CA98] null];
  }
  v114 = (void *)v52;
  v155[4] = v52;
  v154[5] = @"contactLocationWork";
  uint64_t v53 = (uint64_t)v12;
  if (!v12)
  {
    uint64_t v53 = [MEMORY[0x1E4F1CA98] null];
  }
  v113 = (void *)v53;
  v155[5] = v53;
  v154[6] = @"isFamilyContact";
  uint64_t v54 = (uint64_t)v13;
  if (!v13)
  {
    uint64_t v54 = [MEMORY[0x1E4F1CA98] null];
  }
  v112 = (void *)v54;
  v155[6] = v54;
  v154[7] = @"isCoworkerContact";
  uint64_t v55 = (uint64_t)v153;
  if (!v153)
  {
    uint64_t v55 = [MEMORY[0x1E4F1CA98] null];
  }
  double v56 = v13;
  v155[7] = v55;
  v154[8] = @"isRepetitiveContact";
  uint64_t v57 = (uint64_t)v152;
  if (!v152)
  {
    uint64_t v57 = [MEMORY[0x1E4F1CA98] null];
  }
  id v58 = v12;
  v155[8] = v57;
  v154[9] = @"isGroupConversation";
  uint64_t v59 = (uint64_t)v151;
  if (!v151)
  {
    uint64_t v59 = [MEMORY[0x1E4F1CA98] null];
  }
  double v60 = v11;
  v121 = (void *)v59;
  v155[9] = v59;
  v154[10] = @"peopleCountWeightedSum";
  uint64_t v61 = (uint64_t)v150;
  if (!v150)
  {
    uint64_t v61 = [MEMORY[0x1E4F1CA98] null];
  }
  id v62 = v8;
  v109 = (void *)v61;
  v155[10] = v61;
  v154[11] = @"peopleCountWeightedAverage";
  uint64_t v63 = (uint64_t)v149;
  if (!v149)
  {
    uint64_t v63 = [MEMORY[0x1E4F1CA98] null];
  }
  id v64 = v5;
  v120 = (void *)v63;
  v155[11] = v63;
  v154[12] = @"peopleCountMax";
  uint64_t v65 = (uint64_t)v148;
  if (!v148)
  {
    uint64_t v65 = [MEMORY[0x1E4F1CA98] null];
  }
  double v66 = (void *)v65;
  v155[12] = v65;
  v154[13] = @"peopleDensityWeightedSum";
  uint64_t v67 = (uint64_t)v147;
  if (!v147)
  {
    uint64_t v67 = [MEMORY[0x1E4F1CA98] null];
  }
  v108 = (void *)v67;
  v155[13] = v67;
  v154[14] = @"peopleDensityWeightedAverage";
  uint64_t v68 = (uint64_t)v146;
  if (!v146)
  {
    uint64_t v68 = [MEMORY[0x1E4F1CA98] null];
  }
  v107 = (void *)v68;
  v155[14] = v68;
  v154[15] = @"peopleDensityMax";
  uint64_t v69 = (uint64_t)v145;
  if (!v145)
  {
    uint64_t v69 = [MEMORY[0x1E4F1CA98] null];
  }
  v106 = (void *)v69;
  v155[15] = v69;
  v154[16] = @"peopleDensityWeightedConfidenceSum";
  uint64_t v70 = (uint64_t)v144;
  if (!v144)
  {
    uint64_t v70 = [MEMORY[0x1E4F1CA98] null];
  }
  v105 = (void *)v70;
  v155[16] = v70;
  v154[17] = @"peopleDensityWeightedConfidenceAverage";
  uint64_t v71 = (uint64_t)v143;
  if (!v143)
  {
    uint64_t v71 = [MEMORY[0x1E4F1CA98] null];
  }
  BOOL v104 = (void *)v71;
  v155[17] = v71;
  v154[18] = @"mediaTotalPlayTime";
  uint64_t v72 = (uint64_t)v142;
  if (!v142)
  {
    uint64_t v72 = [MEMORY[0x1E4F1CA98] null];
  }
  int v103 = (void *)v72;
  v155[18] = v72;
  v154[19] = @"mediaLength";
  uint64_t v73 = (uint64_t)v141;
  if (!v141)
  {
    uint64_t v73 = [MEMORY[0x1E4F1CA98] null];
  }
  int v102 = (void *)v73;
  v155[19] = v73;
  v154[20] = @"mediaActionIsRepeat";
  uint64_t v74 = (uint64_t)v140;
  if (!v140)
  {
    uint64_t v74 = [MEMORY[0x1E4F1CA98] null];
  }
  v101 = (void *)v74;
  v155[20] = v74;
  v154[21] = @"timeAtHomeDuration";
  uint64_t v75 = (uint64_t)v139;
  if (!v139)
  {
    uint64_t v75 = [MEMORY[0x1E4F1CA98] null];
  }
  v100 = (void *)v75;
  v155[21] = v75;
  v154[22] = @"photosAtHomeCurationScore";
  uint64_t v76 = (uint64_t)v138;
  if (!v138)
  {
    uint64_t v76 = [MEMORY[0x1E4F1CA98] null];
  }
  v99 = (void *)v76;
  v155[22] = v76;
  v154[23] = @"workoutDuration";
  uint64_t v77 = (uint64_t)v137;
  if (!v137)
  {
    uint64_t v77 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v98 = (void *)v77;
  v155[23] = v77;
  v154[24] = @"motionActivityWalkSpan";
  uint64_t v78 = (uint64_t)v136;
  if (!v136)
  {
    uint64_t v78 = [MEMORY[0x1E4F1CA98] null];
  }
  v97 = (void *)v78;
  v155[24] = v78;
  v154[25] = @"visitDuration";
  uint64_t v79 = (uint64_t)v135;
  if (!v135)
  {
    uint64_t v79 = [MEMORY[0x1E4F1CA98] null];
  }
  int v96 = (void *)v79;
  v155[25] = v79;
  v154[26] = @"poiCategoryInterestingness";
  uint64_t v80 = (uint64_t)v134;
  if (!v134)
  {
    uint64_t v80 = [MEMORY[0x1E4F1CA98] null];
  }
  v123 = v10;
  v95 = (void *)v80;
  v155[26] = v80;
  v154[27] = @"familiarityIndex";
  uint64_t v81 = (uint64_t)v133;
  if (!v133)
  {
    uint64_t v81 = [MEMORY[0x1E4F1CA98] null];
  }
  v110 = (void *)v57;
  v94 = (void *)v81;
  v155[27] = v81;
  v154[28] = @"stateOfMindDomains";
  uint64_t v82 = (uint64_t)v132;
  if (!v132)
  {
    uint64_t v82 = [MEMORY[0x1E4F1CA98] null];
  }
  v124 = v9;
  v125 = v64;
  uint64_t v92 = v82;
  v155[28] = v82;
  v154[29] = @"stateOfMindLabels";
  v83 = v131;
  if (!v131)
  {
    objc_msgSend(MEMORY[0x1E4F1CA98], "null", v82, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109,
    v83 = v110);
  }
  v111 = (void *)v55;
  v122 = v62;
  v155[29] = v83;
  v154[30] = @"stateOfMindReflectiveIntervals";
  int v84 = v130;
  if (!v130)
  {
    int v84 = [MEMORY[0x1E4F1CA98] null];
  }
  v85 = v58;
  v155[30] = v84;
  v154[31] = @"stateOfMindValenceClassifications";
  uint64_t v86 = v129;
  if (!v129)
  {
    uint64_t v86 = [MEMORY[0x1E4F1CA98] null];
  }
  v155[31] = v86;
  v154[32] = @"stateOfMindValenceValues";
  v87 = v128;
  if (!v128)
  {
    v87 = [MEMORY[0x1E4F1CA98] null];
  }
  v155[32] = v87;
  v154[33] = @"stateOfMindLoggedIn3pApp";
  v88 = v127;
  if (!v127)
  {
    v88 = [MEMORY[0x1E4F1CA98] null];
  }
  v155[33] = v88;
  v154[34] = @"stateOfMindLoggedInJournalApp";
  v89 = v126;
  if (!v126)
  {
    v89 = [MEMORY[0x1E4F1CA98] null];
  }
  v155[34] = v89;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v155, v154, 35, v92);
  id v119 = (id)objc_claimAutoreleasedReturnValue();
  if (!v126) {

  }
  int v90 = v66;
  if (!v127)
  {

    int v90 = v66;
  }
  if (!v128)
  {

    int v90 = v66;
  }
  if (!v129)
  {

    int v90 = v66;
  }
  if (!v130)
  {

    int v90 = v66;
  }
  if (!v131)
  {

    int v90 = v66;
  }
  if (!v132)
  {

    int v90 = v66;
  }
  if (!v133)
  {

    int v90 = v66;
  }
  if (!v134)
  {

    int v90 = v66;
  }
  if (!v135)
  {

    int v90 = v66;
  }
  if (!v136)
  {

    int v90 = v66;
  }
  if (!v137)
  {

    int v90 = v66;
  }
  if (!v138)
  {

    int v90 = v66;
  }
  if (!v139)
  {

    int v90 = v66;
  }
  if (!v140)
  {

    int v90 = v66;
  }
  if (!v141)
  {

    int v90 = v66;
  }
  if (!v142)
  {

    int v90 = v66;
  }
  if (!v143)
  {

    int v90 = v66;
  }
  if (!v144)
  {

    int v90 = v66;
  }
  if (!v145)
  {

    int v90 = v66;
  }
  if (!v146)
  {

    int v90 = v66;
  }
  if (!v147)
  {

    int v90 = v66;
  }
  if (!v148) {

  }
  if (!v149) {
  if (!v150)
  }

  if (!v151) {
  if (!v152)
  }

  if (v153)
  {
    if (v56) {
      goto LABEL_236;
    }
  }
  else
  {

    if (v56)
    {
LABEL_236:
      if (v85) {
        goto LABEL_237;
      }
      goto LABEL_247;
    }
  }

  if (v85)
  {
LABEL_237:
    if (v60) {
      goto LABEL_238;
    }
    goto LABEL_248;
  }
LABEL_247:

  if (v60)
  {
LABEL_238:
    if (v123) {
      goto LABEL_239;
    }
    goto LABEL_249;
  }
LABEL_248:

  if (v123)
  {
LABEL_239:
    if (v124) {
      goto LABEL_240;
    }
    goto LABEL_250;
  }
LABEL_249:

  if (v124)
  {
LABEL_240:
    if (v122) {
      goto LABEL_241;
    }
LABEL_251:

    if (v125) {
      goto LABEL_242;
    }
    goto LABEL_252;
  }
LABEL_250:

  if (!v122) {
    goto LABEL_251;
  }
LABEL_241:
  if (v125) {
    goto LABEL_242;
  }
LABEL_252:

LABEL_242:

  return v119;
}

- (id)_stateOfMindValenceValuesJSONArray
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindValenceValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v9 doubleValue];
        if (fabs(v10) == INFINITY)
        {
          id v11 = [MEMORY[0x1E4F1CA98] null];
          [v3 addObject:v11];
        }
        else
        {
          [v9 doubleValue];
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_stateOfMindValenceClassificationsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindValenceClassifications];
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

- (id)_stateOfMindReflectiveIntervalsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindReflectiveIntervals];
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

- (id)_stateOfMindLabelsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindLabels];
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

- (id)_stateOfMindDomainsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindDomains];
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

- (BMMomentsEventDataEventBundleMetadataForRank)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v531[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"dailyAggregateCallDuration"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v64 = *MEMORY[0x1E4F502C8];
        uint64_t v530 = *MEMORY[0x1E4F28568];
        uint64_t v65 = v7;
        id v66 = [NSString alloc];
        uint64_t v319 = objc_opt_class();
        uint64_t v67 = v66;
        uint64_t v7 = v65;
        uint64_t v68 = [v67 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v319, @"dailyAggregateCallDuration"];
        v531[0] = v68;
        uint64_t v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v531 forKeys:&v530 count:1];
        uint64_t v70 = v63;
        id v9 = (void *)v69;
        uint64_t v71 = (void *)v68;
        id v8 = 0;
        uint64_t v72 = 0;
        *a4 = (id)[v70 initWithDomain:v64 code:2 userInfo:v69];
        goto LABEL_423;
      }
      id v8 = 0;
      uint64_t v72 = 0;
      goto LABEL_424;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [v6 objectForKeyedSubscript:@"callDuration"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        uint64_t v73 = v9;
        id v74 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v75 = *MEMORY[0x1E4F502C8];
        uint64_t v528 = *MEMORY[0x1E4F28568];
        uint64_t v76 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"callDuration"];
        uint64_t v529 = v76;
        long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v529 forKeys:&v528 count:1];
        uint64_t v77 = v74;
        id v9 = v73;
        uint64_t v78 = v75;
        id v11 = (id)v76;
        uint64_t v71 = 0;
        uint64_t v72 = 0;
        *a4 = (id)[v77 initWithDomain:v78 code:2 userInfo:v10];
        goto LABEL_422;
      }
      uint64_t v71 = 0;
      uint64_t v72 = 0;
      goto LABEL_423;
    }
    id v415 = v9;
  }
  else
  {
    id v415 = 0;
  }
  long long v10 = [v6 objectForKeyedSubscript:@"burstyInteractionCount"];
  v412 = v7;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v79 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v80 = *MEMORY[0x1E4F502C8];
        uint64_t v526 = *MEMORY[0x1E4F28568];
        id v81 = v8;
        id v82 = [NSString alloc];
        uint64_t v320 = objc_opt_class();
        v83 = v82;
        id v8 = v81;
        int v84 = (void *)[v83 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v320, @"burstyInteractionCount"];
        v527 = v84;
        long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v527 forKeys:&v526 count:1];
        id v85 = (id)[v79 initWithDomain:v80 code:2 userInfo:v13];
        id v11 = 0;
        v413 = 0;
        *a4 = v85;
        uint64_t v7 = v412;
        goto LABEL_421;
      }
      id v11 = 0;
      uint64_t v72 = 0;
      uint64_t v71 = v415;
      goto LABEL_422;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v12 = [v6 objectForKeyedSubscript:@"burstyOutgoingInteractionCount"];
  id v409 = v8;
  id v411 = v11;
  v410 = (void *)v12;
  if (v12 && (long long v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v399 = v6;
        uint64_t v86 = v9;
        v407 = a4;
        id v87 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v88 = *MEMORY[0x1E4F502C8];
        uint64_t v524 = *MEMORY[0x1E4F28568];
        a4 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"burstyOutgoingInteractionCount"];
        v525 = a4;
        uint64_t v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v525 forKeys:&v524 count:1];
        int v90 = v87;
        id v9 = v86;
        id v6 = v399;
        v416 = (void *)v89;
        int v84 = 0;
        v413 = 0;
        id *v407 = (id)[v90 initWithDomain:v88 code:2 userInfo:v89];
        goto LABEL_420;
      }
      int v84 = 0;
      v413 = 0;
      goto LABEL_421;
    }
    id v408 = v13;
  }
  else
  {
    id v408 = 0;
  }
  v416 = [v6 objectForKeyedSubscript:@"multipleInteractionTypes"];
  if (v416 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v373 = v9;
        v91 = a4;
        id v92 = objc_alloc(MEMORY[0x1E4F28C58]);
        v93 = self;
        uint64_t v94 = *MEMORY[0x1E4F502C8];
        uint64_t v522 = *MEMORY[0x1E4F28568];
        v405 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"multipleInteractionTypes"];
        v523 = v405;
        long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v523 forKeys:&v522 count:1];
        v95 = v92;
        id v9 = v373;
        uint64_t v96 = v94;
        self = v93;
        uint64_t v7 = v412;
        a4 = 0;
        v413 = 0;
        id *v91 = (id)[v95 initWithDomain:v96 code:2 userInfo:v14];
        int v84 = v408;
        goto LABEL_419;
      }
      v413 = 0;
      int v84 = v408;
      goto LABEL_420;
    }
    v404 = v416;
  }
  else
  {
    v404 = 0;
  }
  long long v14 = [v6 objectForKeyedSubscript:@"contactLocationWork"];
  v406 = a4;
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        v374 = v9;
        id v97 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v98 = *MEMORY[0x1E4F502C8];
        uint64_t v520 = *MEMORY[0x1E4F28568];
        id v402 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"contactLocationWork"];
        id v521 = v402;
        uint64_t v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v521 forKeys:&v520 count:1];
        v100 = v97;
        id v9 = v374;
        a4 = v404;
        v403 = (void *)v99;
        v405 = 0;
        v413 = 0;
        id *v406 = (id)[v100 initWithDomain:v98 code:2 userInfo:v99];
        int v84 = v408;
        goto LABEL_418;
      }
      v405 = 0;
      v413 = 0;
      int v84 = v408;
      a4 = v404;
      goto LABEL_419;
    }
    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }
  uint64_t v16 = [v6 objectForKeyedSubscript:@"isFamilyContact"];
  v405 = v15;
  v397 = v10;
  v403 = (void *)v16;
  if (v16 && (int v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v406)
      {
        v375 = v9;
        id v101 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v102 = *MEMORY[0x1E4F502C8];
        uint64_t v518 = *MEMORY[0x1E4F28568];
        uint64_t v103 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isFamilyContact"];
        uint64_t v519 = v103;
        uint64_t v104 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v519 forKeys:&v518 count:1];
        v105 = v101;
        id v9 = v375;
        uint64_t v106 = v102;
        a4 = v404;
        id v20 = (id)v103;
        v398 = (void *)v104;
        id v402 = 0;
        v413 = 0;
        id *v406 = (id)objc_msgSend(v105, "initWithDomain:code:userInfo:", v106, 2);
        int v84 = v408;
        goto LABEL_417;
      }
      id v402 = 0;
      v413 = 0;
      int v84 = v408;
      a4 = v404;
      goto LABEL_418;
    }
    id v402 = v17;
  }
  else
  {
    id v402 = 0;
  }
  uint64_t v18 = [v6 objectForKeyedSubscript:@"isCoworkerContact"];
  v398 = (void *)v18;
  if (v18 && (int v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v406)
      {
        v376 = v9;
        id v107 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v108 = *MEMORY[0x1E4F502C8];
        uint64_t v516 = *MEMORY[0x1E4F28568];
        uint64_t v109 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isCoworkerContact"];
        uint64_t v517 = v109;
        uint64_t v110 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v517 forKeys:&v516 count:1];
        v111 = v107;
        long long v10 = v397;
        id v9 = v376;
        v371 = (void *)v110;
        id v112 = (id)objc_msgSend(v111, "initWithDomain:code:userInfo:", v108, 2);
        id v20 = 0;
        v413 = 0;
        id *v406 = v112;
        a4 = v404;
        id v23 = (id)v109;
        int v84 = v408;
        goto LABEL_416;
      }
      id v20 = 0;
      v413 = 0;
      int v84 = v408;
      long long v10 = v397;
      a4 = v404;
      goto LABEL_417;
    }
    id v20 = v19;
  }
  else
  {
    id v20 = 0;
  }
  uint64_t v21 = [v6 objectForKeyedSubscript:@"isRepetitiveContact"];
  v369 = v14;
  v371 = (void *)v21;
  if (v21 && (double v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v406)
      {
        id v400 = v6;
        id v113 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v114 = *MEMORY[0x1E4F502C8];
        uint64_t v514 = *MEMORY[0x1E4F28568];
        id v368 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isRepetitiveContact"];
        id v515 = v368;
        uint64_t v115 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v515 forKeys:&v514 count:1];
        v116 = v113;
        id v6 = v400;
        uint64_t v117 = v114;
        a4 = v404;
        long long v10 = v397;
        v370 = (void *)v115;
        id v23 = 0;
        v413 = 0;
        id *v406 = (id)objc_msgSend(v116, "initWithDomain:code:userInfo:", v117, 2);
        int v84 = v408;
        goto LABEL_415;
      }
      v413 = 0;
      int v84 = v408;
      long long v10 = v397;
      a4 = v404;
      id v23 = 0;
      goto LABEL_416;
    }
    id v23 = v22;
  }
  else
  {
    id v23 = 0;
  }
  uint64_t v24 = [v6 objectForKeyedSubscript:@"isGroupConversation"];
  v396 = self;
  id v364 = v23;
  v370 = (void *)v24;
  if (v24 && (double v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v406)
      {
        v377 = v9;
        id v118 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v119 = v20;
        uint64_t v120 = *MEMORY[0x1E4F502C8];
        uint64_t v512 = *MEMORY[0x1E4F28568];
        id v367 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isGroupConversation"];
        id v513 = v367;
        uint64_t v121 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v513 forKeys:&v512 count:1];
        v122 = v118;
        id v9 = v377;
        uint64_t v123 = v120;
        id v20 = v119;
        v124 = (void *)v121;
        id v368 = 0;
        v413 = 0;
        id *v406 = (id)[v122 initWithDomain:v123 code:2 userInfo:v121];
        a4 = v404;
        int v84 = v408;
        goto LABEL_414;
      }
      id v368 = 0;
      v413 = 0;
      int v84 = v408;
      long long v10 = v397;
      a4 = v404;
      goto LABEL_415;
    }
    id v368 = v25;
  }
  else
  {
    id v368 = 0;
  }
  uint64_t v26 = [v6 objectForKeyedSubscript:@"peopleCountWeightedSum"];
  v366 = (void *)v26;
  id v360 = v20;
  if (v26 && (double v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v406)
      {
        v378 = v9;
        id v125 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v126 = *MEMORY[0x1E4F502C8];
        uint64_t v510 = *MEMORY[0x1E4F28568];
        id v362 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"peopleCountWeightedSum"];
        id v511 = v362;
        uint64_t v127 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v511 forKeys:&v510 count:1];
        v128 = v125;
        id v9 = v378;
        uint64_t v129 = v126;
        a4 = v404;
        id v20 = v360;
        v365 = (void *)v127;
        id v367 = 0;
        v413 = 0;
        id *v406 = (id)objc_msgSend(v128, "initWithDomain:code:userInfo:", v129, 2);
        v124 = v366;
        int v84 = v408;
        goto LABEL_412;
      }
      id v367 = 0;
      v413 = 0;
      int v84 = v408;
      v124 = v366;
      self = v396;
      a4 = v404;
      goto LABEL_414;
    }
    id v367 = v27;
  }
  else
  {
    id v367 = 0;
  }
  uint64_t v28 = [v6 objectForKeyedSubscript:@"peopleCountWeightedAverage"];
  v365 = (void *)v28;
  if (v28 && (double v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v406)
      {
        v379 = v9;
        id v130 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v131 = *MEMORY[0x1E4F502C8];
        uint64_t v508 = *MEMORY[0x1E4F28568];
        id v359 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"peopleCountWeightedAverage"];
        id v509 = v359;
        uint64_t v132 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v509 forKeys:&v508 count:1];
        id v133 = v130;
        id v9 = v379;
        uint64_t v134 = v131;
        a4 = v404;
        id v20 = v360;
        v361 = (void *)v132;
        id v362 = 0;
        v413 = 0;
        id *v406 = (id)objc_msgSend(v133, "initWithDomain:code:userInfo:", v134, 2);
        int v84 = v408;
        v124 = v366;
        goto LABEL_411;
      }
      id v362 = 0;
      v413 = 0;
      int v84 = v408;
      v124 = v366;
      self = v396;
      a4 = v404;
      goto LABEL_413;
    }
    id v362 = v29;
  }
  else
  {
    id v362 = 0;
  }
  uint64_t v30 = [v6 objectForKeyedSubscript:@"peopleCountMax"];
  v361 = (void *)v30;
  if (v30 && (double v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v406)
      {
        v380 = v9;
        id v135 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v136 = *MEMORY[0x1E4F502C8];
        uint64_t v506 = *MEMORY[0x1E4F28568];
        uint64_t v137 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"peopleCountMax"];
        uint64_t v507 = v137;
        id v138 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v507 forKeys:&v506 count:1];
        id v139 = v135;
        id v9 = v380;
        uint64_t v140 = v136;
        id v20 = v360;
        id v141 = (void *)v137;
        id v359 = 0;
        v413 = 0;
        id *v406 = (id)[v139 initWithDomain:v140 code:2 userInfo:v138];
        int v84 = v408;
        v124 = v366;
        goto LABEL_409;
      }
      id v359 = 0;
      v413 = 0;
      int v84 = v408;
      v124 = v366;
      goto LABEL_410;
    }
    id v359 = v31;
  }
  else
  {
    id v359 = 0;
  }
  uint64_t v32 = [v6 objectForKeyedSubscript:@"peopleDensityWeightedSum"];
  v363 = (void *)v32;
  if (v32 && (double v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v406)
      {
        v381 = v9;
        id v142 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v143 = *MEMORY[0x1E4F502C8];
        uint64_t v504 = *MEMORY[0x1E4F28568];
        id v138 = v363;
        id v358 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"peopleDensityWeightedSum"];
        id v505 = v358;
        uint64_t v144 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v505 forKeys:&v504 count:1];
        id v145 = v142;
        id v9 = v381;
        uint64_t v146 = v143;
        id v20 = v360;
        v357 = (void *)v144;
        id v356 = 0;
        v413 = 0;
        id *v406 = (id)objc_msgSend(v145, "initWithDomain:code:userInfo:", v146, 2);
        int v84 = v408;
        v124 = v366;
        goto LABEL_408;
      }
      id v141 = 0;
      v413 = 0;
      int v84 = v408;
      v124 = v366;
      id v138 = v363;
      goto LABEL_409;
    }
    id v356 = v33;
  }
  else
  {
    id v356 = 0;
  }
  uint64_t v34 = [v6 objectForKeyedSubscript:@"peopleDensityWeightedAverage"];
  v357 = (void *)v34;
  if (v34 && (double v35 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v406)
      {
        id v358 = 0;
        v413 = 0;
        int v84 = v408;
        v124 = v366;
        id v138 = v363;
        goto LABEL_408;
      }
      v382 = v9;
      id v147 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v148 = *MEMORY[0x1E4F502C8];
      uint64_t v502 = *MEMORY[0x1E4F28568];
      id v355 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"peopleDensityWeightedAverage"];
      id v503 = v355;
      uint64_t v149 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v503 forKeys:&v502 count:1];
      id v150 = v147;
      id v9 = v382;
      uint64_t v151 = v148;
      id v20 = v360;
      v354 = (void *)v149;
      id v358 = 0;
      v413 = 0;
      id *v406 = (id)objc_msgSend(v150, "initWithDomain:code:userInfo:", v151, 2);
      goto LABEL_195;
    }
    id v358 = v35;
  }
  else
  {
    id v358 = 0;
  }
  uint64_t v36 = [v6 objectForKeyedSubscript:@"peopleDensityMax"];
  v354 = (void *)v36;
  if (v36)
  {
    double v37 = (void *)v36;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v355 = v37;
        goto LABEL_49;
      }
      if (v406)
      {
        v383 = v9;
        id v152 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v153 = *MEMORY[0x1E4F502C8];
        uint64_t v500 = *MEMORY[0x1E4F28568];
        id v353 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"peopleDensityMax"];
        id v501 = v353;
        double v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v501 forKeys:&v500 count:1];
        v154 = v152;
        id v9 = v383;
        uint64_t v155 = v153;
        id v20 = v360;
        id v355 = 0;
        v413 = 0;
        id *v406 = (id)[v154 initWithDomain:v155 code:2 userInfo:v38];
        goto LABEL_204;
      }
      id v355 = 0;
      v413 = 0;
LABEL_195:
      int v84 = v408;
      v124 = v366;
      id v138 = v363;
      goto LABEL_407;
    }
  }
  id v355 = 0;
LABEL_49:
  double v38 = [v6 objectForKeyedSubscript:@"peopleDensityWeightedConfidenceSum"];
  v352 = v38;
  if (v38)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v353 = v38;
        goto LABEL_52;
      }
      if (v406)
      {
        v384 = v9;
        id v156 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v157 = *MEMORY[0x1E4F502C8];
        uint64_t v498 = *MEMORY[0x1E4F28568];
        id v351 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"peopleDensityWeightedConfidenceSum"];
        id v499 = v351;
        uint64_t v158 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v499 forKeys:&v498 count:1];
        v159 = v156;
        id v9 = v384;
        uint64_t v160 = v157;
        id v20 = v360;
        v350 = (void *)v158;
        id v353 = 0;
        v413 = 0;
        id *v406 = (id)objc_msgSend(v159, "initWithDomain:code:userInfo:", v160, 2);
        goto LABEL_210;
      }
      id v353 = 0;
      v413 = 0;
LABEL_204:
      int v84 = v408;
      v124 = v366;
      id v138 = v363;
      goto LABEL_406;
    }
  }
  id v353 = 0;
LABEL_52:
  uint64_t v39 = [v6 objectForKeyedSubscript:@"peopleDensityWeightedConfidenceAverage"];
  v350 = (void *)v39;
  if (v39)
  {
    double v40 = (void *)v39;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v351 = v40;
        goto LABEL_55;
      }
      if (v406)
      {
        v385 = v9;
        id v161 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v162 = *MEMORY[0x1E4F502C8];
        uint64_t v496 = *MEMORY[0x1E4F28568];
        id v349 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"peopleDensityWeightedConfidenceAverage"];
        id v497 = v349;
        uint64_t v163 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v497 forKeys:&v496 count:1];
        v164 = v161;
        id v9 = v385;
        uint64_t v165 = v162;
        id v20 = v360;
        v348 = (void *)v163;
        id v351 = 0;
        v413 = 0;
        id *v406 = (id)objc_msgSend(v164, "initWithDomain:code:userInfo:", v165, 2);
        goto LABEL_216;
      }
      id v351 = 0;
      v413 = 0;
LABEL_210:
      int v84 = v408;
      v124 = v366;
      id v138 = v363;
      goto LABEL_405;
    }
  }
  id v351 = 0;
LABEL_55:
  uint64_t v41 = [v6 objectForKeyedSubscript:@"mediaTotalPlayTime"];
  v348 = (void *)v41;
  if (v41)
  {
    double v42 = (void *)v41;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v349 = v42;
        goto LABEL_58;
      }
      if (v406)
      {
        v386 = v9;
        id v166 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v167 = *MEMORY[0x1E4F502C8];
        uint64_t v494 = *MEMORY[0x1E4F28568];
        id v347 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"mediaTotalPlayTime"];
        id v495 = v347;
        uint64_t v168 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v495 forKeys:&v494 count:1];
        v169 = v166;
        id v9 = v386;
        uint64_t v170 = v167;
        id v20 = v360;
        v346 = (void *)v168;
        id v349 = 0;
        v413 = 0;
        id *v406 = (id)objc_msgSend(v169, "initWithDomain:code:userInfo:", v170, 2);
        goto LABEL_220;
      }
      id v349 = 0;
      v413 = 0;
LABEL_216:
      int v84 = v408;
      v124 = v366;
      id v138 = v363;
      goto LABEL_404;
    }
  }
  id v349 = 0;
LABEL_58:
  uint64_t v43 = [v6 objectForKeyedSubscript:@"mediaLength"];
  v346 = (void *)v43;
  if (v43)
  {
    double v44 = (void *)v43;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v347 = v44;
        goto LABEL_61;
      }
      if (v406)
      {
        v387 = v9;
        id v171 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v172 = *MEMORY[0x1E4F502C8];
        uint64_t v492 = *MEMORY[0x1E4F28568];
        id v345 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"mediaLength"];
        id v493 = v345;
        uint64_t v173 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v493 forKeys:&v492 count:1];
        v174 = v171;
        id v9 = v387;
        uint64_t v175 = v172;
        id v20 = v360;
        v344 = (void *)v173;
        id v347 = 0;
        v413 = 0;
        id *v406 = (id)objc_msgSend(v174, "initWithDomain:code:userInfo:", v175, 2);
        goto LABEL_224;
      }
      id v347 = 0;
      v413 = 0;
LABEL_220:
      int v84 = v408;
      v124 = v366;
      id v138 = v363;
      goto LABEL_403;
    }
  }
  id v347 = 0;
LABEL_61:
  uint64_t v45 = [v6 objectForKeyedSubscript:@"mediaActionIsRepeat"];
  v344 = (void *)v45;
  if (v45)
  {
    double v46 = (void *)v45;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v345 = v46;
        goto LABEL_64;
      }
      if (v406)
      {
        v388 = v9;
        id v176 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v177 = *MEMORY[0x1E4F502C8];
        uint64_t v490 = *MEMORY[0x1E4F28568];
        id v342 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"mediaActionIsRepeat"];
        id v491 = v342;
        double v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v491 forKeys:&v490 count:1];
        v178 = v176;
        id v9 = v388;
        uint64_t v179 = v177;
        id v20 = v360;
        id v345 = 0;
        v413 = 0;
        id *v406 = (id)[v178 initWithDomain:v179 code:2 userInfo:v47];
        goto LABEL_228;
      }
      id v345 = 0;
      v413 = 0;
LABEL_224:
      int v84 = v408;
      v124 = v366;
      id v138 = v363;
      goto LABEL_402;
    }
  }
  id v345 = 0;
LABEL_64:
  double v47 = [v6 objectForKeyedSubscript:@"timeAtHomeDuration"];
  v339 = v47;
  if (v47)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v342 = v47;
        goto LABEL_67;
      }
      if (v406)
      {
        v389 = v9;
        id v180 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v181 = *MEMORY[0x1E4F502C8];
        uint64_t v488 = *MEMORY[0x1E4F28568];
        id v343 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"timeAtHomeDuration"];
        id v489 = v343;
        uint64_t v182 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v489 forKeys:&v488 count:1];
        v183 = v180;
        id v9 = v389;
        uint64_t v184 = v181;
        id v20 = v360;
        v340 = (void *)v182;
        id v342 = 0;
        v413 = 0;
        id *v406 = (id)objc_msgSend(v183, "initWithDomain:code:userInfo:", v184, 2);
        goto LABEL_256;
      }
      id v342 = 0;
      v413 = 0;
LABEL_228:
      int v84 = v408;
      v124 = v366;
      id v138 = v363;
      goto LABEL_401;
    }
  }
  id v342 = 0;
LABEL_67:
  uint64_t v48 = [v6 objectForKeyedSubscript:@"photosAtHomeCurationScore"];
  v340 = (void *)v48;
  if (v48)
  {
    uint64_t v49 = (void *)v48;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v343 = v49;
        goto LABEL_70;
      }
      if (v406)
      {
        v390 = v9;
        id v186 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v187 = *MEMORY[0x1E4F502C8];
        uint64_t v486 = *MEMORY[0x1E4F28568];
        id v341 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"photosAtHomeCurationScore"];
        id v487 = v341;
        uint64_t v188 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v487 forKeys:&v486 count:1];
        v189 = v186;
        id v9 = v390;
        uint64_t v190 = v187;
        id v20 = v360;
        v337 = (void *)v188;
        id v343 = 0;
        v413 = 0;
        id *v406 = (id)objc_msgSend(v189, "initWithDomain:code:userInfo:", v190, 2);
        goto LABEL_260;
      }
      id v343 = 0;
      v413 = 0;
LABEL_256:
      int v84 = v408;
      v124 = v366;
      id v138 = v363;
      goto LABEL_400;
    }
  }
  id v343 = 0;
LABEL_70:
  uint64_t v50 = [v6 objectForKeyedSubscript:@"workoutDuration"];
  v337 = (void *)v50;
  if (v50)
  {
    uint64_t v51 = (void *)v50;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v341 = v51;
        goto LABEL_73;
      }
      if (v406)
      {
        v391 = v9;
        id v191 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v192 = *MEMORY[0x1E4F502C8];
        uint64_t v484 = *MEMORY[0x1E4F28568];
        id v338 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"workoutDuration"];
        id v485 = v338;
        uint64_t v193 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v485 forKeys:&v484 count:1];
        v194 = v191;
        id v9 = v391;
        uint64_t v195 = v192;
        id v20 = v360;
        v334 = (void *)v193;
        id v341 = 0;
        v413 = 0;
        id *v406 = (id)objc_msgSend(v194, "initWithDomain:code:userInfo:", v195, 2);
        goto LABEL_263;
      }
      id v341 = 0;
      v413 = 0;
LABEL_260:
      int v84 = v408;
      v124 = v366;
      id v138 = v363;
      goto LABEL_399;
    }
  }
  id v341 = 0;
LABEL_73:
  uint64_t v52 = [v6 objectForKeyedSubscript:@"motionActivityWalkSpan"];
  v334 = (void *)v52;
  if (v52)
  {
    uint64_t v53 = (void *)v52;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v338 = v53;
        goto LABEL_76;
      }
      if (v406)
      {
        v392 = v9;
        id v196 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v197 = *MEMORY[0x1E4F502C8];
        uint64_t v482 = *MEMORY[0x1E4F28568];
        id v333 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"motionActivityWalkSpan"];
        id v483 = v333;
        uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v483 forKeys:&v482 count:1];
        v198 = v196;
        id v9 = v392;
        uint64_t v199 = v197;
        id v20 = v360;
        id v338 = 0;
        v413 = 0;
        id *v406 = (id)[v198 initWithDomain:v199 code:2 userInfo:v54];
        goto LABEL_265;
      }
      id v338 = 0;
      v413 = 0;
LABEL_263:
      int v84 = v408;
      v124 = v366;
      id v138 = v363;
      goto LABEL_398;
    }
  }
  id v338 = 0;
LABEL_76:
  uint64_t v54 = [v6 objectForKeyedSubscript:@"visitDuration"];
  if (v54)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v333 = v54;
        goto LABEL_79;
      }
      if (v406)
      {
        v393 = v9;
        id v200 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v201 = *MEMORY[0x1E4F502C8];
        uint64_t v480 = *MEMORY[0x1E4F28568];
        id v330 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"visitDuration"];
        id v481 = v330;
        uint64_t v202 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v481 forKeys:&v480 count:1];
        v203 = v200;
        id v9 = v393;
        uint64_t v204 = v201;
        id v20 = v360;
        v331 = (void *)v202;
        id v333 = 0;
        v413 = 0;
        id *v406 = (id)objc_msgSend(v203, "initWithDomain:code:userInfo:", v204, 2);
        int v84 = v408;
        v124 = v366;
        id v138 = v363;
        goto LABEL_396;
      }
      id v333 = 0;
      v413 = 0;
LABEL_265:
      int v84 = v408;
      v124 = v366;
      id v138 = v363;
      goto LABEL_397;
    }
  }
  id v333 = 0;
LABEL_79:
  uint64_t v55 = [v6 objectForKeyedSubscript:@"poiCategoryInterestingness"];
  v327 = v54;
  v331 = (void *)v55;
  if (v55 && (double v56 = (void *)v55, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v406)
      {
        id v330 = 0;
        v413 = 0;
        int v84 = v408;
        v124 = v366;
        id v138 = v363;
        double v47 = v339;
        goto LABEL_396;
      }
      v394 = v9;
      id v205 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v206 = *MEMORY[0x1E4F502C8];
      uint64_t v478 = *MEMORY[0x1E4F28568];
      id v326 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"poiCategoryInterestingness"];
      id v479 = v326;
      uint64_t v207 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v479 forKeys:&v478 count:1];
      v208 = v205;
      id v9 = v394;
      uint64_t v209 = v206;
      double v47 = v339;
      id v20 = v360;
      v328 = (void *)v207;
      id v330 = 0;
      v413 = 0;
      id *v406 = (id)objc_msgSend(v208, "initWithDomain:code:userInfo:", v209, 2);
LABEL_268:
      int v84 = v408;
      v124 = v366;
      id v138 = v363;
      goto LABEL_395;
    }
    id v330 = v56;
  }
  else
  {
    id v330 = 0;
  }
  uint64_t v57 = [v6 objectForKeyedSubscript:@"familiarityIndex"];
  v328 = (void *)v57;
  if (!v57 || (id v58 = (void *)v57, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v59 = v9;
    id v326 = 0;
    goto LABEL_85;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v47 = v339;
    if (v406)
    {
      v395 = v9;
      id v226 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v227 = *MEMORY[0x1E4F502C8];
      uint64_t v476 = *MEMORY[0x1E4F28568];
      v329 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"familiarityIndex"];
      v477 = v329;
      v210 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v477 forKeys:&v476 count:1];
      v228 = v226;
      id v9 = v395;
      uint64_t v229 = v227;
      id v20 = v360;
      id v326 = 0;
      v413 = 0;
      id *v406 = (id)[v228 initWithDomain:v229 code:2 userInfo:v210];
      int v84 = v408;
      v124 = v366;
      id v138 = v363;
      goto LABEL_393;
    }
    id v326 = 0;
    v413 = 0;
    goto LABEL_268;
  }
  uint64_t v59 = v9;
  id v326 = v58;
LABEL_85:
  double v60 = [v6 objectForKeyedSubscript:@"stateOfMindDomains"];
  uint64_t v61 = [MEMORY[0x1E4F1CA98] null];
  int v62 = [v60 isEqual:v61];

  if (v62)
  {
    v372 = v59;

LABEL_230:
    v185 = 0;
    goto LABEL_231;
  }
  if (!v60)
  {
    v372 = v59;
    goto LABEL_230;
  }
  objc_opt_class();
  v329 = v60;
  id v9 = v59;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v406)
    {
      v413 = 0;
      int v84 = v408;
      v124 = v366;
      id v138 = v363;
      uint64_t v54 = v327;
      goto LABEL_394;
    }
    id v232 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v233 = *MEMORY[0x1E4F502C8];
    uint64_t v474 = *MEMORY[0x1E4F28568];
    v210 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"stateOfMindDomains"];
    v475 = v210;
    id v211 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v475 forKeys:&v474 count:1];
    uint64_t v234 = v233;
    id v9 = v59;
    v413 = 0;
    id *v406 = (id)[v232 initWithDomain:v234 code:2 userInfo:v211];
    int v84 = v408;
LABEL_270:
    v124 = v366;
    id v138 = v363;
    goto LABEL_271;
  }
  v372 = v59;
  v185 = v60;
LABEL_231:
  v210 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v185, "count"));
  long long v433 = 0u;
  long long v434 = 0u;
  long long v435 = 0u;
  long long v436 = 0u;
  id v211 = v185;
  uint64_t v212 = [v211 countByEnumeratingWithState:&v433 objects:v473 count:16];
  id v138 = v363;
  v329 = v211;
  if (v212)
  {
    uint64_t v213 = *(void *)v434;
    do
    {
      for (uint64_t i = 0; i != v212; ++i)
      {
        if (*(void *)v434 != v213) {
          objc_enumerationMutation(v211);
        }
        v215 = *(void **)(*((void *)&v433 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v222 = v406;
          if (v406)
          {
            id v223 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v224 = *MEMORY[0x1E4F502C8];
            uint64_t v471 = *MEMORY[0x1E4F28568];
            v335 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"stateOfMindDomains"];
            v472 = v335;
            id v325 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v472 forKeys:&v471 count:1];
            v225 = objc_msgSend(v223, "initWithDomain:code:userInfo:", v224, 2);
            int v84 = v408;
            id v20 = v360;
            v124 = v366;
LABEL_251:
            uint64_t v54 = v327;
            v413 = 0;
            id *v222 = v225;
            id obj = v211;
            id v9 = v372;
            double v38 = v352;
            goto LABEL_390;
          }
          v413 = 0;
          id v9 = v372;
          int v84 = v408;
          id v20 = v360;
          v124 = v366;
LABEL_271:
          double v38 = v352;
          uint64_t v54 = v327;
          goto LABEL_392;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v216 = v215;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v222 = v406;
            if (v406)
            {
              id v230 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v231 = *MEMORY[0x1E4F502C8];
              uint64_t v469 = *MEMORY[0x1E4F28568];
              v335 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"stateOfMindDomains"];
              v470 = v335;
              id v325 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v470 forKeys:&v469 count:1];
              v225 = objc_msgSend(v230, "initWithDomain:code:userInfo:", v231, 2);
              int v84 = v408;
              id v20 = v360;
              v124 = v366;
              id v138 = v363;
              goto LABEL_251;
            }
            v413 = 0;
            id v9 = v372;
            int v84 = v408;
            id v20 = v360;
            goto LABEL_270;
          }
          id v217 = v215;
          id v216 = [NSNumber numberWithInt:BMMomentsEventDataStateOfMindDomainFromString(v217)];
        }
        [v210 addObject:v216];

        id v138 = v363;
      }
      uint64_t v212 = [v211 countByEnumeratingWithState:&v433 objects:v473 count:16];
    }
    while (v212);
  }

  v218 = [v6 objectForKeyedSubscript:@"stateOfMindLabels"];
  v219 = [MEMORY[0x1E4F1CA98] null];
  int v220 = [v218 isEqual:v219];

  if (v220)
  {

    v221 = 0;
    id v20 = v360;
    v124 = v366;
  }
  else
  {
    v124 = v366;
    if (v218)
    {
      objc_opt_class();
      id obj = v218;
      id v20 = v360;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v406)
        {
          v413 = 0;
          id v9 = v372;
          int v84 = v408;
          v124 = v366;
          uint64_t v54 = v327;
          goto LABEL_391;
        }
        id v266 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v267 = *MEMORY[0x1E4F502C8];
        uint64_t v467 = *MEMORY[0x1E4F28568];
        v335 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"stateOfMindLabels"];
        v468 = v335;
        id v325 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v468 forKeys:&v467 count:1];
        v413 = 0;
        id *v406 = (id)objc_msgSend(v266, "initWithDomain:code:userInfo:", v267, 2);
        id v9 = v372;
        int v84 = v408;
        v124 = v366;
        goto LABEL_312;
      }
      v221 = v218;
    }
    else
    {
      v221 = 0;
      id v20 = v360;
    }
  }
  v335 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v221, "count"));
  long long v429 = 0u;
  long long v430 = 0u;
  long long v431 = 0u;
  long long v432 = 0u;
  id obj = v221;
  uint64_t v235 = [obj countByEnumeratingWithState:&v429 objects:v466 count:16];
  v336 = v210;
  if (!v235) {
    goto LABEL_285;
  }
  uint64_t v236 = v235;
  uint64_t v414 = *(void *)v430;
  do
  {
    uint64_t v237 = 0;
    do
    {
      if (*(void *)v430 != v414) {
        objc_enumerationMutation(obj);
      }
      v238 = *(void **)(*((void *)&v429 + 1) + 8 * v237);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v246 = v406;
        if (v406)
        {
          id v247 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v248 = *MEMORY[0x1E4F502C8];
          uint64_t v464 = *MEMORY[0x1E4F28568];
          v324 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"stateOfMindLabels"];
          v465 = v324;
          uint64_t v249 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v465 forKeys:&v464 count:1];
          v250 = v247;
          uint64_t v251 = v248;
LABEL_292:
          v322 = (void *)v249;
          int v84 = v408;
          uint64_t v54 = v327;
          v413 = 0;
          id *v246 = (id)objc_msgSend(v250, "initWithDomain:code:userInfo:", v251, 2);
          id v325 = obj;
          id v9 = v372;
          double v38 = v352;
          goto LABEL_389;
        }
LABEL_293:
        v413 = 0;
        id v325 = obj;
        id v9 = v372;
        int v84 = v408;
LABEL_312:
        double v38 = v352;
LABEL_313:
        uint64_t v54 = v327;
        goto LABEL_390;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v239 = v20;
        v240 = v404;
        id v241 = v238;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v246 = v406;
          if (v406)
          {
            id v252 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v253 = *MEMORY[0x1E4F502C8];
            uint64_t v462 = *MEMORY[0x1E4F28568];
            v324 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"stateOfMindLabels"];
            v463 = v324;
            uint64_t v249 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v463 forKeys:&v462 count:1];
            v250 = v252;
            uint64_t v251 = v253;
            goto LABEL_292;
          }
          goto LABEL_293;
        }
        id v239 = v20;
        v240 = v404;
        id v242 = v238;
        id v241 = [NSNumber numberWithInt:BMMomentsEventDataStateOfMindLabelFromString(v242)];
      }
      v404 = v240;

      [v335 addObject:v241];
      ++v237;
      id v20 = v239;
      v124 = v366;
      id v138 = v363;
      v210 = v336;
    }
    while (v236 != v237);
    uint64_t v236 = [obj countByEnumeratingWithState:&v429 objects:v466 count:16];
  }
  while (v236);
LABEL_285:

  v243 = [v6 objectForKeyedSubscript:@"stateOfMindReflectiveIntervals"];
  v244 = [MEMORY[0x1E4F1CA98] null];
  int v245 = [v243 isEqual:v244];

  if (v245)
  {

    v243 = 0;
    goto LABEL_296;
  }
  if (v243)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v325 = v243;
      if (v406)
      {
        id v284 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v285 = *MEMORY[0x1E4F502C8];
        uint64_t v460 = *MEMORY[0x1E4F28568];
        v324 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"stateOfMindReflectiveIntervals"];
        v461 = v324;
        v322 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v461 forKeys:&v460 count:1];
        v413 = 0;
        id *v406 = (id)objc_msgSend(v284, "initWithDomain:code:userInfo:", v285, 2);
        id v9 = v372;
        int v84 = v408;
        goto LABEL_340;
      }
      v413 = 0;
      id v9 = v372;
      int v84 = v408;
      goto LABEL_313;
    }
  }
LABEL_296:
  v324 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v243, "count"));
  long long v425 = 0u;
  long long v426 = 0u;
  long long v427 = 0u;
  long long v428 = 0u;
  id v254 = v243;
  uint64_t v255 = [v254 countByEnumeratingWithState:&v425 objects:v459 count:16];
  id v325 = v254;
  if (!v255) {
    goto LABEL_308;
  }
  uint64_t v256 = v255;
  uint64_t v257 = *(void *)v426;
  while (2)
  {
    uint64_t v258 = 0;
    while (2)
    {
      if (*(void *)v426 != v257) {
        objc_enumerationMutation(v325);
      }
      v259 = *(void **)(*((void *)&v425 + 1) + 8 * v258);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v406)
        {
          id v268 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v269 = *MEMORY[0x1E4F502C8];
          uint64_t v457 = *MEMORY[0x1E4F28568];
          v323 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"stateOfMindReflectiveIntervals"];
          v458 = v323;
          v321 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v458 forKeys:&v457 count:1];
          v270 = objc_msgSend(v268, "initWithDomain:code:userInfo:", v269, 2);
          int v84 = v408;
          id v20 = v360;
          v124 = v366;
          uint64_t v54 = v327;
LABEL_319:
          v413 = 0;
          id *v406 = v270;
          v322 = v325;
          id v9 = v372;
          goto LABEL_388;
        }
        v413 = 0;
        v322 = v325;
        id v9 = v372;
        int v84 = v408;
        id v20 = v360;
        v124 = v366;
LABEL_340:
        uint64_t v54 = v327;
        goto LABEL_389;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v260 = v404;
        id v261 = v259;
        goto LABEL_306;
      }
      v260 = v404;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v406)
        {
          id v271 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v272 = *MEMORY[0x1E4F502C8];
          uint64_t v455 = *MEMORY[0x1E4F28568];
          v323 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"stateOfMindReflectiveIntervals"];
          v456 = v323;
          v321 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v456 forKeys:&v455 count:1];
          v270 = objc_msgSend(v271, "initWithDomain:code:userInfo:", v272, 2);
          int v84 = v408;
          id v20 = v360;
          v124 = v366;
          id v138 = v363;
          uint64_t v54 = v327;
          v210 = v336;
          goto LABEL_319;
        }
        v413 = 0;
        v322 = v325;
        id v9 = v372;
        int v84 = v408;
        id v20 = v360;
        v124 = v366;
        id v138 = v363;
        goto LABEL_383;
      }
      id v262 = v259;
      id v261 = [NSNumber numberWithInt:BMMomentsEventDataStateOfMindReflectiveIntervalFromString(v262)];

LABEL_306:
      v404 = v260;

      [v324 addObject:v261];
      ++v258;
      id v138 = v363;
      v210 = v336;
      if (v256 != v258) {
        continue;
      }
      break;
    }
    id v254 = v325;
    uint64_t v256 = [v325 countByEnumeratingWithState:&v425 objects:v459 count:16];
    if (v256) {
      continue;
    }
    break;
  }
LABEL_308:

  v263 = [v6 objectForKeyedSubscript:@"stateOfMindValenceClassifications"];
  v264 = [MEMORY[0x1E4F1CA98] null];
  int v265 = [v263 isEqual:v264];

  if (v265)
  {

    v263 = 0;
    goto LABEL_323;
  }
  if (v263)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v322 = v263;
      if (v406)
      {
        id v302 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v303 = *MEMORY[0x1E4F502C8];
        uint64_t v453 = *MEMORY[0x1E4F28568];
        v323 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"stateOfMindValenceClassifications"];
        v454 = v323;
        v321 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v454 forKeys:&v453 count:1];
        v413 = 0;
        id *v406 = (id)objc_msgSend(v302, "initWithDomain:code:userInfo:", v303, 2);
LABEL_379:
        id v9 = v372;
LABEL_380:
        int v84 = v408;
        id v20 = v360;
        v124 = v366;
        id v138 = v363;
        goto LABEL_381;
      }
      v413 = 0;
      id v9 = v372;
      int v84 = v408;
      id v20 = v360;
      v124 = v366;
      id v138 = v363;
LABEL_383:
      uint64_t v54 = v327;
      v210 = v336;
      goto LABEL_389;
    }
  }
  id v138 = v363;
LABEL_323:
  v323 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v263, "count"));
  long long v421 = 0u;
  long long v422 = 0u;
  long long v423 = 0u;
  long long v424 = 0u;
  id v273 = v263;
  uint64_t v274 = [v273 countByEnumeratingWithState:&v421 objects:v452 count:16];
  v322 = v273;
  if (!v274) {
    goto LABEL_335;
  }
  uint64_t v275 = v274;
  uint64_t v276 = *(void *)v422;
  while (2)
  {
    uint64_t v277 = 0;
    while (2)
    {
      if (*(void *)v422 != v276) {
        objc_enumerationMutation(v273);
      }
      v278 = *(void **)(*((void *)&v421 + 1) + 8 * v277);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v406)
        {
          id v286 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v287 = *MEMORY[0x1E4F502C8];
          uint64_t v450 = *MEMORY[0x1E4F28568];
          v288 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"stateOfMindValenceClassifications"];
          v451 = v288;
          id v289 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v451 forKeys:&v450 count:1];
          v290 = (void *)[v286 initWithDomain:v287 code:2 userInfo:v289];
LABEL_347:
          v413 = 0;
          id *v406 = v290;
          v321 = v273;
          int v84 = v408;
          goto LABEL_387;
        }
        v413 = 0;
        v321 = v273;
        id v9 = v372;
        int v84 = v408;
        id v20 = v360;
        v124 = v366;
LABEL_381:
        uint64_t v54 = v327;
        v210 = v336;
        goto LABEL_388;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v279 = v278;
        goto LABEL_333;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v406)
        {
          id v291 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v292 = *MEMORY[0x1E4F502C8];
          uint64_t v448 = *MEMORY[0x1E4F28568];
          v288 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"stateOfMindValenceClassifications"];
          v449 = v288;
          id v289 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v449 forKeys:&v448 count:1];
          v290 = (void *)[v291 initWithDomain:v292 code:2 userInfo:v289];
          goto LABEL_347;
        }
        v413 = 0;
        v321 = v273;
        goto LABEL_379;
      }
      id v280 = v278;
      id v279 = [NSNumber numberWithInt:BMMomentsEventDataStateOfMindValenceClassificationFromString(v280)];

LABEL_333:
      [v323 addObject:v279];

      ++v277;
      id v138 = v363;
      if (v275 != v277) {
        continue;
      }
      break;
    }
    uint64_t v275 = [v273 countByEnumeratingWithState:&v421 objects:v452 count:16];
    if (v275) {
      continue;
    }
    break;
  }
LABEL_335:

  v401 = v6;
  v281 = [v6 objectForKeyedSubscript:@"stateOfMindValenceValues"];
  v282 = [MEMORY[0x1E4F1CA98] null];
  int v283 = [v281 isEqual:v282];

  if (v283)
  {

    v281 = 0;
    goto LABEL_350;
  }
  v321 = v281;
  if (v281)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v406)
      {
        id v310 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v311 = *MEMORY[0x1E4F502C8];
        uint64_t v446 = *MEMORY[0x1E4F28568];
        v288 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"stateOfMindValenceValues"];
        v447 = v288;
        id v289 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v447 forKeys:&v446 count:1];
        v413 = 0;
        id *v406 = (id)[v310 initWithDomain:v311 code:2 userInfo:v289];
        goto LABEL_386;
      }
      v413 = 0;
      id v9 = v372;
      id v6 = v401;
      goto LABEL_380;
    }
  }
LABEL_350:
  v288 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v281, "count"));
  long long v417 = 0u;
  long long v418 = 0u;
  long long v419 = 0u;
  long long v420 = 0u;
  id v289 = v281;
  uint64_t v293 = [v289 countByEnumeratingWithState:&v417 objects:v445 count:16];
  v321 = v289;
  if (!v293) {
    goto LABEL_359;
  }
  uint64_t v294 = v293;
  uint64_t v295 = *(void *)v418;
  while (2)
  {
    uint64_t v296 = 0;
    while (2)
    {
      if (*(void *)v418 != v295) {
        objc_enumerationMutation(v289);
      }
      v297 = *(void **)(*((void *)&v417 + 1) + 8 * v296);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v406)
        {
          id v304 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v305 = *MEMORY[0x1E4F502C8];
          uint64_t v443 = *MEMORY[0x1E4F28568];
          v299 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"stateOfMindValenceValues"];
          v444 = v299;
          id v301 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v444 forKeys:&v443 count:1];
          v306 = v304;
          uint64_t v307 = v305;
LABEL_374:
          v413 = 0;
          id *v406 = (id)[v306 initWithDomain:v307 code:2 userInfo:v301];
          goto LABEL_375;
        }
LABEL_377:
        v413 = 0;
        goto LABEL_386;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v406)
        {
          id v308 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v309 = *MEMORY[0x1E4F502C8];
          uint64_t v441 = *MEMORY[0x1E4F28568];
          v299 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"stateOfMindValenceValues"];
          v442 = v299;
          id v301 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v442 forKeys:&v441 count:1];
          v306 = v308;
          uint64_t v307 = v309;
          goto LABEL_374;
        }
        goto LABEL_377;
      }
      id v298 = v297;
      [v288 addObject:v298];

      if (v294 != ++v296) {
        continue;
      }
      break;
    }
    uint64_t v294 = [v289 countByEnumeratingWithState:&v417 objects:v445 count:16];
    if (v294) {
      continue;
    }
    break;
  }
LABEL_359:

  v299 = [v401 objectForKeyedSubscript:@"stateOfMindLoggedIn3pApp"];
  if (v299 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v289 = v299;
      goto LABEL_362;
    }
    if (v406)
    {
      id v313 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v314 = *MEMORY[0x1E4F502C8];
      uint64_t v439 = *MEMORY[0x1E4F28568];
      id v301 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"stateOfMindLoggedIn3pApp"];
      id v440 = v301;
      v300 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v440 forKeys:&v439 count:1];
      v413 = 0;
      id v289 = 0;
      id *v406 = (id)[v313 initWithDomain:v314 code:2 userInfo:v300];
      goto LABEL_366;
    }
    id v289 = 0;
    v413 = 0;
  }
  else
  {
    id v289 = 0;
LABEL_362:
    v300 = [v401 objectForKeyedSubscript:@"stateOfMindLoggedInJournalApp"];
    if (!v300 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v301 = 0;
      goto LABEL_365;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v301 = v300;
LABEL_365:
      v396 = objc_retain(-[BMMomentsEventDataEventBundleMetadataForRank initWithDailyAggregateCallDuration:callDuration:burstyInteractionCount:burstyOutgoingInteractionCount:multipleInteractionTypes:contactLocationWork:isFamilyContact:isCoworkerContact:isRepetitiveContact:isGroupConversation:peopleCountWeightedSum:peopleCountWeightedAverage:peopleCountMax:peopleDensityWeightedSum:peopleDensityWeightedAverage:peopleDensityMax:peopleDensityWeightedConfidenceSum:peopleDensityWeightedConfidenceAverage:mediaTotalPlayTime:mediaLength:mediaActionIsRepeat:timeAtHomeDuration:photosAtHomeCurationScore:workoutDuration:motionActivityWalkSpan:visitDuration:poiCategoryInterestingness:familiarityIndex:stateOfMindDomains:stateOfMindLabels:stateOfMindReflectiveIntervals:stateOfMindValenceClassifications:stateOfMindValenceValues:stateOfMindLoggedIn3pApp:stateOfMindLoggedInJournalApp:](v396, "initWithDailyAggregateCallDuration:callDuration:burstyInteractionCount:burstyOutgoingInteractionCount:multipleInteractionTypes:contactLocationWork:isFamilyContact:isCoworkerContact:isRepetitiveContact:isGroupConversation:peopleCountWeightedSum:peopleCountWeightedAverage:peopleCountMax:peopleDensityWeightedSum:peopleDensityWeightedAverage:peopleDensityMax:peopleDensityWeightedConfidenceSum:peopleDensityWeightedConfidenceAverage:mediaTotalPlayTime:mediaLength:mediaActionIsRepeat:timeAtHomeDuration:photosAtHomeCurationScore:workoutDuration:motionActivityWalkSpan:visitDuration:poiCategoryInterestingness:familiarityIndex:stateOfMindDomains:stateOfMindLabels:stateOfMindReflectiveIntervals:stateOfMindValenceClassifications:stateOfMindValenceValues:stateOfMindLoggedIn3pApp:stateOfMindLoggedInJournalApp:", v409, v415, v411, v408, v404, v405, v402, v360, v364,
                 v368,
                 v367,
                 v362,
                 v359,
                 v356,
                 v358,
                 v355,
                 v353,
                 v351,
                 v349,
                 v347,
                 v345,
                 v342,
                 v343,
                 v341,
                 v338,
                 v333,
                 v330,
                 v326,
                 v336,
                 v335,
                 v324,
                 v323,
                 v288,
                 v289,
                 v301));
      v413 = v396;
    }
    else
    {
      if (v406)
      {
        id v315 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v316 = *MEMORY[0x1E4F502C8];
        uint64_t v437 = *MEMORY[0x1E4F28568];
        v317 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"stateOfMindLoggedInJournalApp"];
        v438 = v317;
        v318 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v438 forKeys:&v437 count:1];
        id *v406 = (id)[v315 initWithDomain:v316 code:2 userInfo:v318];
      }
      id v301 = 0;
      v413 = 0;
    }
LABEL_366:

LABEL_375:
  }

LABEL_386:
  id v6 = v401;
  int v84 = v408;
  double v38 = v352;
LABEL_387:
  uint64_t v54 = v327;
  v210 = v336;

  id v9 = v372;
  id v20 = v360;
  v124 = v366;
  id v138 = v363;
LABEL_388:

LABEL_389:
LABEL_390:

LABEL_391:
  id v211 = obj;
LABEL_392:

LABEL_393:
LABEL_394:

  double v47 = v339;
LABEL_395:

  id v23 = v364;
LABEL_396:

LABEL_397:
LABEL_398:

LABEL_399:
LABEL_400:

LABEL_401:
  long long v14 = v369;
LABEL_402:

LABEL_403:
LABEL_404:

LABEL_405:
LABEL_406:

  uint64_t v7 = v412;
LABEL_407:

LABEL_408:
  id v141 = v356;
LABEL_409:

LABEL_410:
  a4 = v404;
LABEL_411:

LABEL_412:
  self = v396;
LABEL_413:

LABEL_414:
  long long v10 = v397;
LABEL_415:

LABEL_416:
LABEL_417:

LABEL_418:
LABEL_419:

  id v8 = v409;
LABEL_420:

  id v11 = v411;
  long long v13 = v410;
LABEL_421:

  uint64_t v71 = v415;
  uint64_t v72 = v413;
LABEL_422:

LABEL_423:
LABEL_424:

  return v72;
}

- (id)serialize
{
  double v3 = objc_opt_new();
  [(BMMomentsEventDataEventBundleMetadataForRank *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasDailyAggregateCallDuration) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasCallDuration) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasBurstyInteractionCount) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasBurstyOutgoingInteractionCount) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasMultipleInteractionTypes) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasContactLocationWork) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsFamilyContact) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsCoworkerContact) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsRepetitiveContact) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsGroupConversation) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasPeopleCountWeightedSum) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasPeopleCountWeightedAverage) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasPeopleCountMax) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasPeopleDensityWeightedSum) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasPeopleDensityWeightedAverage) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasPeopleDensityMax) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasPeopleDensityWeightedConfidenceSum) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasPeopleDensityWeightedConfidenceAverage) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasMediaTotalPlayTime) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasMediaLength) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasMediaActionIsRepeat) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasTimeAtHomeDuration) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasPhotosAtHomeCurationScore) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasWorkoutDuration) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasMotionActivityWalkSpan) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasVisitDuration) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasPoiCategoryInterestingness) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasFamiliarityIndex) {
    PBDataWriterWriteFloatField();
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v5 = self->_stateOfMindDomains;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * v9) unsignedIntValue];
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v10 = self->_stateOfMindLabels;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * v14) unsignedIntValue];
        PBDataWriterWriteUint32Field();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v12);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v15 = self->_stateOfMindReflectiveIntervals;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * v19) unsignedIntValue];
        PBDataWriterWriteUint32Field();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v17);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v20 = self->_stateOfMindValenceClassifications;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * v24) unsignedIntValue];
        PBDataWriterWriteUint32Field();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
    }
    while (v22);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  double v25 = self->_stateOfMindValenceValues;
  uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v29), "doubleValue", (void)v30);
        PBDataWriterWriteDoubleField();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
    }
    while (v27);
  }

  if (self->_hasStateOfMindLoggedIn3pApp) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasStateOfMindLoggedInJournalApp) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v225.receiver = self;
  v225.super_class = (Class)BMMomentsEventDataEventBundleMetadataForRank;
  uint64_t v5 = [(BMEventBase *)&v225 init];
  if (!v5)
  {
LABEL_311:
    int v220 = v5;
    goto LABEL_312;
  }
  uint64_t v224 = objc_opt_new();
  v222 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (int *)MEMORY[0x1E4F940E8];
  long long v10 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v11 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_309:
    uint64_t v209 = objc_msgSend(v224, "copy", v222);
    stateOfMindDomains = v5->_stateOfMindDomains;
    v5->_stateOfMindDomains = (NSArray *)v209;

    uint64_t v211 = [v223 copy];
    stateOfMindLabels = v5->_stateOfMindLabels;
    v5->_stateOfMindLabels = (NSArray *)v211;

    uint64_t v213 = [v6 copy];
    stateOfMindReflectiveIntervals = v5->_stateOfMindReflectiveIntervals;
    v5->_stateOfMindReflectiveIntervals = (NSArray *)v213;

    uint64_t v215 = [v7 copy];
    stateOfMindValenceClassifications = v5->_stateOfMindValenceClassifications;
    v5->_stateOfMindValenceClassifications = (NSArray *)v215;

    uint64_t v217 = [v8 copy];
    stateOfMindValenceValues = v5->_stateOfMindValenceValues;
    v5->_stateOfMindValenceValues = (NSArray *)v217;

    int v219 = v4[*v11];
    if (v219) {
      goto LABEL_310;
    }
    goto LABEL_311;
  }
  uint64_t v12 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v11]) {
      goto LABEL_309;
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
        uint64_t v21 = *v11;
        int v22 = v4[v21];
        goto LABEL_15;
      }
    }
    v4[*v11] = 1;
LABEL_13:
    uint64_t v21 = *v11;
    int v22 = v4[v21];
    if (v4[v21]) {
      unint64_t v15 = 0;
    }
LABEL_15:
    if (v22 || (v15 & 7) == 4) {
      goto LABEL_309;
    }
    switch((v15 >> 3))
    {
      case 1u:
        v5->_hasDailyAggregateCallDuration = 1;
        uint64_t v24 = *v9;
        unint64_t v25 = *(void *)&v4[v24];
        if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(void *)&v4[*v10])
        {
          float v26 = *(float *)(*(void *)&v4[*v12] + v25);
          *(void *)&v4[v24] = v25 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v26 = 0.0;
        }
        double v206 = v26;
        uint64_t v207 = 72;
        goto LABEL_303;
      case 2u:
        v5->_hasCallDuration = 1;
        uint64_t v27 = *v9;
        unint64_t v28 = *(void *)&v4[v27];
        if (v28 <= 0xFFFFFFFFFFFFFFFBLL && v28 + 4 <= *(void *)&v4[*v10])
        {
          float v29 = *(float *)(*(void *)&v4[*v12] + v28);
          *(void *)&v4[v27] = v28 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v29 = 0.0;
        }
        double v206 = v29;
        uint64_t v207 = 80;
        goto LABEL_303;
      case 3u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v32 = 0;
        v5->_hasBurstyInteractionCount = 1;
        while (2)
        {
          uint64_t v33 = *v9;
          uint64_t v34 = *(void *)&v4[v33];
          unint64_t v35 = v34 + 1;
          if (v34 == -1 || v35 > *(void *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)&v4[*v12] + v34);
            *(void *)&v4[v33] = v35;
            v32 |= (unint64_t)(v36 & 0x7F) << v30;
            if (v36 < 0)
            {
              v30 += 7;
              BOOL v20 = v31++ >= 9;
              if (v20)
              {
                LODWORD(v32) = 0;
                goto LABEL_190;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11]) {
          LODWORD(v32) = 0;
        }
LABEL_190:
        uint64_t v193 = 60;
        goto LABEL_195;
      case 4u:
        char v37 = 0;
        unsigned int v38 = 0;
        uint64_t v32 = 0;
        v5->_hasBurstyOutgoingInteractionCount = 1;
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
            v32 |= (unint64_t)(v42 & 0x7F) << v37;
            if (v42 < 0)
            {
              v37 += 7;
              BOOL v20 = v38++ >= 9;
              if (v20)
              {
                LODWORD(v32) = 0;
                goto LABEL_194;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11]) {
          LODWORD(v32) = 0;
        }
LABEL_194:
        uint64_t v193 = 64;
LABEL_195:
        *(_DWORD *)((char *)&v5->super.super.isa + v193) = v32;
        goto LABEL_308;
      case 5u:
        char v43 = 0;
        unsigned int v44 = 0;
        uint64_t v45 = 0;
        v5->_hasMultipleInteractionTypes = 1;
        while (2)
        {
          uint64_t v46 = *v9;
          uint64_t v47 = *(void *)&v4[v46];
          unint64_t v48 = v47 + 1;
          if (v47 == -1 || v48 > *(void *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            char v49 = *(unsigned char *)(*(void *)&v4[*v12] + v47);
            *(void *)&v4[v46] = v48;
            v45 |= (unint64_t)(v49 & 0x7F) << v43;
            if (v49 < 0)
            {
              v43 += 7;
              BOOL v20 = v44++ >= 9;
              if (v20)
              {
                uint64_t v45 = 0;
                goto LABEL_199;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11]) {
          uint64_t v45 = 0;
        }
LABEL_199:
        BOOL v194 = v45 != 0;
        uint64_t v195 = 20;
        goto LABEL_264;
      case 6u:
        char v50 = 0;
        unsigned int v51 = 0;
        uint64_t v52 = 0;
        v5->_hasContactLocationWork = 1;
        while (2)
        {
          uint64_t v53 = *v9;
          uint64_t v54 = *(void *)&v4[v53];
          unint64_t v55 = v54 + 1;
          if (v54 == -1 || v55 > *(void *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            char v56 = *(unsigned char *)(*(void *)&v4[*v12] + v54);
            *(void *)&v4[v53] = v55;
            v52 |= (unint64_t)(v56 & 0x7F) << v50;
            if (v56 < 0)
            {
              v50 += 7;
              BOOL v20 = v51++ >= 9;
              if (v20)
              {
                uint64_t v52 = 0;
                goto LABEL_203;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11]) {
          uint64_t v52 = 0;
        }
LABEL_203:
        BOOL v194 = v52 != 0;
        uint64_t v195 = 22;
        goto LABEL_264;
      case 7u:
        char v57 = 0;
        unsigned int v58 = 0;
        uint64_t v59 = 0;
        v5->_hasIsFamilyContact = 1;
        while (2)
        {
          uint64_t v60 = *v9;
          uint64_t v61 = *(void *)&v4[v60];
          unint64_t v62 = v61 + 1;
          if (v61 == -1 || v62 > *(void *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            char v63 = *(unsigned char *)(*(void *)&v4[*v12] + v61);
            *(void *)&v4[v60] = v62;
            v59 |= (unint64_t)(v63 & 0x7F) << v57;
            if (v63 < 0)
            {
              v57 += 7;
              BOOL v20 = v58++ >= 9;
              if (v20)
              {
                uint64_t v59 = 0;
                goto LABEL_207;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11]) {
          uint64_t v59 = 0;
        }
LABEL_207:
        BOOL v194 = v59 != 0;
        uint64_t v195 = 24;
        goto LABEL_264;
      case 8u:
        char v64 = 0;
        unsigned int v65 = 0;
        uint64_t v66 = 0;
        v5->_hasIsCoworkerContact = 1;
        while (2)
        {
          uint64_t v67 = *v9;
          uint64_t v68 = *(void *)&v4[v67];
          unint64_t v69 = v68 + 1;
          if (v68 == -1 || v69 > *(void *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            char v70 = *(unsigned char *)(*(void *)&v4[*v12] + v68);
            *(void *)&v4[v67] = v69;
            v66 |= (unint64_t)(v70 & 0x7F) << v64;
            if (v70 < 0)
            {
              v64 += 7;
              BOOL v20 = v65++ >= 9;
              if (v20)
              {
                uint64_t v66 = 0;
                goto LABEL_211;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11]) {
          uint64_t v66 = 0;
        }
LABEL_211:
        BOOL v194 = v66 != 0;
        uint64_t v195 = 26;
        goto LABEL_264;
      case 9u:
        char v71 = 0;
        unsigned int v72 = 0;
        uint64_t v73 = 0;
        v5->_hasIsRepetitiveContact = 1;
        while (2)
        {
          uint64_t v74 = *v9;
          uint64_t v75 = *(void *)&v4[v74];
          unint64_t v76 = v75 + 1;
          if (v75 == -1 || v76 > *(void *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            char v77 = *(unsigned char *)(*(void *)&v4[*v12] + v75);
            *(void *)&v4[v74] = v76;
            v73 |= (unint64_t)(v77 & 0x7F) << v71;
            if (v77 < 0)
            {
              v71 += 7;
              BOOL v20 = v72++ >= 9;
              if (v20)
              {
                uint64_t v73 = 0;
                goto LABEL_215;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11]) {
          uint64_t v73 = 0;
        }
LABEL_215:
        BOOL v194 = v73 != 0;
        uint64_t v195 = 28;
        goto LABEL_264;
      case 0xAu:
        char v78 = 0;
        unsigned int v79 = 0;
        uint64_t v80 = 0;
        v5->_hasIsGroupConversation = 1;
        while (2)
        {
          uint64_t v81 = *v9;
          uint64_t v82 = *(void *)&v4[v81];
          unint64_t v83 = v82 + 1;
          if (v82 == -1 || v83 > *(void *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            char v84 = *(unsigned char *)(*(void *)&v4[*v12] + v82);
            *(void *)&v4[v81] = v83;
            v80 |= (unint64_t)(v84 & 0x7F) << v78;
            if (v84 < 0)
            {
              v78 += 7;
              BOOL v20 = v79++ >= 9;
              if (v20)
              {
                uint64_t v80 = 0;
                goto LABEL_219;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11]) {
          uint64_t v80 = 0;
        }
LABEL_219:
        BOOL v194 = v80 != 0;
        uint64_t v195 = 30;
        goto LABEL_264;
      case 0xBu:
        v5->_hasPeopleCountWeightedSum = 1;
        uint64_t v85 = *v9;
        unint64_t v86 = *(void *)&v4[v85];
        if (v86 <= 0xFFFFFFFFFFFFFFFBLL && v86 + 4 <= *(void *)&v4[*v10])
        {
          float v87 = *(float *)(*(void *)&v4[*v12] + v86);
          *(void *)&v4[v85] = v86 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v87 = 0.0;
        }
        double v206 = v87;
        uint64_t v207 = 88;
        goto LABEL_303;
      case 0xCu:
        v5->_hasPeopleCountWeightedAverage = 1;
        uint64_t v88 = *v9;
        unint64_t v89 = *(void *)&v4[v88];
        if (v89 <= 0xFFFFFFFFFFFFFFFBLL && v89 + 4 <= *(void *)&v4[*v10])
        {
          float v90 = *(float *)(*(void *)&v4[*v12] + v89);
          *(void *)&v4[v88] = v89 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v90 = 0.0;
        }
        double v206 = v90;
        uint64_t v207 = 96;
        goto LABEL_303;
      case 0xDu:
        v5->_hasPeopleCountMax = 1;
        uint64_t v91 = *v9;
        unint64_t v92 = *(void *)&v4[v91];
        if (v92 <= 0xFFFFFFFFFFFFFFFBLL && v92 + 4 <= *(void *)&v4[*v10])
        {
          float v93 = *(float *)(*(void *)&v4[*v12] + v92);
          *(void *)&v4[v91] = v92 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v93 = 0.0;
        }
        double v206 = v93;
        uint64_t v207 = 104;
        goto LABEL_303;
      case 0xEu:
        v5->_hasPeopleDensityWeightedSum = 1;
        uint64_t v94 = *v9;
        unint64_t v95 = *(void *)&v4[v94];
        if (v95 <= 0xFFFFFFFFFFFFFFFBLL && v95 + 4 <= *(void *)&v4[*v10])
        {
          float v96 = *(float *)(*(void *)&v4[*v12] + v95);
          *(void *)&v4[v94] = v95 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v96 = 0.0;
        }
        double v206 = v96;
        uint64_t v207 = 112;
        goto LABEL_303;
      case 0xFu:
        v5->_hasPeopleDensityWeightedAverage = 1;
        uint64_t v97 = *v9;
        unint64_t v98 = *(void *)&v4[v97];
        if (v98 <= 0xFFFFFFFFFFFFFFFBLL && v98 + 4 <= *(void *)&v4[*v10])
        {
          float v99 = *(float *)(*(void *)&v4[*v12] + v98);
          *(void *)&v4[v97] = v98 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v99 = 0.0;
        }
        double v206 = v99;
        uint64_t v207 = 120;
        goto LABEL_303;
      case 0x10u:
        v5->_hasPeopleDensityMax = 1;
        uint64_t v100 = *v9;
        unint64_t v101 = *(void *)&v4[v100];
        if (v101 <= 0xFFFFFFFFFFFFFFFBLL && v101 + 4 <= *(void *)&v4[*v10])
        {
          float v102 = *(float *)(*(void *)&v4[*v12] + v101);
          *(void *)&v4[v100] = v101 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v102 = 0.0;
        }
        double v206 = v102;
        uint64_t v207 = 128;
        goto LABEL_303;
      case 0x11u:
        v5->_hasPeopleDensityWeightedConfidenceSum = 1;
        uint64_t v103 = *v9;
        unint64_t v104 = *(void *)&v4[v103];
        if (v104 <= 0xFFFFFFFFFFFFFFFBLL && v104 + 4 <= *(void *)&v4[*v10])
        {
          float v105 = *(float *)(*(void *)&v4[*v12] + v104);
          *(void *)&v4[v103] = v104 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v105 = 0.0;
        }
        double v206 = v105;
        uint64_t v207 = 136;
        goto LABEL_303;
      case 0x12u:
        v5->_hasPeopleDensityWeightedConfidenceAverage = 1;
        uint64_t v106 = *v9;
        unint64_t v107 = *(void *)&v4[v106];
        if (v107 <= 0xFFFFFFFFFFFFFFFBLL && v107 + 4 <= *(void *)&v4[*v10])
        {
          float v108 = *(float *)(*(void *)&v4[*v12] + v107);
          *(void *)&v4[v106] = v107 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v108 = 0.0;
        }
        double v206 = v108;
        uint64_t v207 = 144;
        goto LABEL_303;
      case 0x13u:
        v5->_hasMediaTotalPlayTime = 1;
        uint64_t v109 = *v9;
        unint64_t v110 = *(void *)&v4[v109];
        if (v110 <= 0xFFFFFFFFFFFFFFFBLL && v110 + 4 <= *(void *)&v4[*v10])
        {
          float v111 = *(float *)(*(void *)&v4[*v12] + v110);
          *(void *)&v4[v109] = v110 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v111 = 0.0;
        }
        double v206 = v111;
        uint64_t v207 = 152;
        goto LABEL_303;
      case 0x14u:
        v5->_hasMediaLength = 1;
        uint64_t v112 = *v9;
        unint64_t v113 = *(void *)&v4[v112];
        if (v113 <= 0xFFFFFFFFFFFFFFFBLL && v113 + 4 <= *(void *)&v4[*v10])
        {
          float v114 = *(float *)(*(void *)&v4[*v12] + v113);
          *(void *)&v4[v112] = v113 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v114 = 0.0;
        }
        double v206 = v114;
        uint64_t v207 = 160;
        goto LABEL_303;
      case 0x15u:
        char v115 = 0;
        unsigned int v116 = 0;
        uint64_t v117 = 0;
        v5->_hasMediaActionIsRepeat = 1;
        while (2)
        {
          uint64_t v118 = *v9;
          uint64_t v119 = *(void *)&v4[v118];
          unint64_t v120 = v119 + 1;
          if (v119 == -1 || v120 > *(void *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            char v121 = *(unsigned char *)(*(void *)&v4[*v12] + v119);
            *(void *)&v4[v118] = v120;
            v117 |= (unint64_t)(v121 & 0x7F) << v115;
            if (v121 < 0)
            {
              v115 += 7;
              BOOL v20 = v116++ >= 9;
              if (v20)
              {
                uint64_t v117 = 0;
                goto LABEL_223;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11]) {
          uint64_t v117 = 0;
        }
LABEL_223:
        BOOL v194 = v117 != 0;
        uint64_t v195 = 42;
        goto LABEL_264;
      case 0x16u:
        v5->_hasTimeAtHomeDuration = 1;
        uint64_t v122 = *v9;
        unint64_t v123 = *(void *)&v4[v122];
        if (v123 <= 0xFFFFFFFFFFFFFFFBLL && v123 + 4 <= *(void *)&v4[*v10])
        {
          float v124 = *(float *)(*(void *)&v4[*v12] + v123);
          *(void *)&v4[v122] = v123 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v124 = 0.0;
        }
        double v206 = v124;
        uint64_t v207 = 168;
        goto LABEL_303;
      case 0x17u:
        v5->_hasPhotosAtHomeCurationScore = 1;
        uint64_t v125 = *v9;
        unint64_t v126 = *(void *)&v4[v125];
        if (v126 <= 0xFFFFFFFFFFFFFFFBLL && v126 + 4 <= *(void *)&v4[*v10])
        {
          float v127 = *(float *)(*(void *)&v4[*v12] + v126);
          *(void *)&v4[v125] = v126 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v127 = 0.0;
        }
        double v206 = v127;
        uint64_t v207 = 176;
        goto LABEL_303;
      case 0x18u:
        v5->_hasWorkoutDuration = 1;
        uint64_t v128 = *v9;
        unint64_t v129 = *(void *)&v4[v128];
        if (v129 <= 0xFFFFFFFFFFFFFFFBLL && v129 + 4 <= *(void *)&v4[*v10])
        {
          float v130 = *(float *)(*(void *)&v4[*v12] + v129);
          *(void *)&v4[v128] = v129 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v130 = 0.0;
        }
        double v206 = v130;
        uint64_t v207 = 184;
        goto LABEL_303;
      case 0x19u:
        v5->_hasMotionActivityWalkSpan = 1;
        uint64_t v131 = *v9;
        unint64_t v132 = *(void *)&v4[v131];
        if (v132 <= 0xFFFFFFFFFFFFFFFBLL && v132 + 4 <= *(void *)&v4[*v10])
        {
          float v133 = *(float *)(*(void *)&v4[*v12] + v132);
          *(void *)&v4[v131] = v132 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v133 = 0.0;
        }
        double v206 = v133;
        uint64_t v207 = 192;
        goto LABEL_303;
      case 0x1Au:
        v5->_hasVisitDuration = 1;
        uint64_t v134 = *v9;
        unint64_t v135 = *(void *)&v4[v134];
        if (v135 <= 0xFFFFFFFFFFFFFFFBLL && v135 + 4 <= *(void *)&v4[*v10])
        {
          float v136 = *(float *)(*(void *)&v4[*v12] + v135);
          *(void *)&v4[v134] = v135 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v136 = 0.0;
        }
        double v206 = v136;
        uint64_t v207 = 200;
        goto LABEL_303;
      case 0x1Bu:
        v5->_hasPoiCategoryInterestingness = 1;
        uint64_t v137 = *v9;
        unint64_t v138 = *(void *)&v4[v137];
        if (v138 <= 0xFFFFFFFFFFFFFFFBLL && v138 + 4 <= *(void *)&v4[*v10])
        {
          float v139 = *(float *)(*(void *)&v4[*v12] + v138);
          *(void *)&v4[v137] = v138 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v139 = 0.0;
        }
        double v206 = v139;
        uint64_t v207 = 208;
        goto LABEL_303;
      case 0x1Cu:
        v5->_hasFamiliarityIndex = 1;
        uint64_t v140 = *v9;
        unint64_t v141 = *(void *)&v4[v140];
        if (v141 <= 0xFFFFFFFFFFFFFFFBLL && v141 + 4 <= *(void *)&v4[*v10])
        {
          float v142 = *(float *)(*(void *)&v4[*v12] + v141);
          *(void *)&v4[v140] = v141 + 4;
        }
        else
        {
          v4[*v11] = 1;
          float v142 = 0.0;
        }
        double v206 = v142;
        uint64_t v207 = 216;
LABEL_303:
        *(double *)((char *)&v5->super.super.isa + v207) = v206;
        goto LABEL_308;
      case 0x1Du:
        char v143 = 0;
        unsigned int v144 = 0;
        uint64_t v145 = 0;
        uint64_t v146 = NSNumber;
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
            v145 |= (unint64_t)(v150 & 0x7F) << v143;
            if (v150 < 0)
            {
              v143 += 7;
              BOOL v20 = v144++ >= 9;
              if (v20)
              {
                LODWORD(v145) = 0;
                goto LABEL_227;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11]) {
          LODWORD(v145) = 0;
        }
LABEL_227:
        if (v145 >= 0x13) {
          uint64_t v196 = 0;
        }
        else {
          uint64_t v196 = v145;
        }
        uint64_t v197 = objc_msgSend(v146, "numberWithUnsignedInt:", v196, v222);
        if (!v197) {
          goto LABEL_313;
        }
        v198 = (void *)v197;
        uint64_t v199 = v224;
        goto LABEL_307;
      case 0x1Eu:
        char v151 = 0;
        unsigned int v152 = 0;
        uint64_t v153 = 0;
        v154 = NSNumber;
        while (2)
        {
          uint64_t v155 = *v9;
          uint64_t v156 = *(void *)&v4[v155];
          unint64_t v157 = v156 + 1;
          if (v156 == -1 || v157 > *(void *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            char v158 = *(unsigned char *)(*(void *)&v4[*v12] + v156);
            *(void *)&v4[v155] = v157;
            v153 |= (unint64_t)(v158 & 0x7F) << v151;
            if (v158 < 0)
            {
              v151 += 7;
              BOOL v20 = v152++ >= 9;
              if (v20)
              {
                LODWORD(v153) = 0;
                goto LABEL_235;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11]) {
          LODWORD(v153) = 0;
        }
LABEL_235:
        if (v153 >= 0x27) {
          uint64_t v200 = 0;
        }
        else {
          uint64_t v200 = v153;
        }
        uint64_t v201 = objc_msgSend(v154, "numberWithUnsignedInt:", v200, v222);
        if (!v201) {
          goto LABEL_313;
        }
        v198 = (void *)v201;
        uint64_t v199 = v222;
        goto LABEL_307;
      case 0x1Fu:
        char v159 = 0;
        unsigned int v160 = 0;
        uint64_t v161 = 0;
        uint64_t v162 = NSNumber;
        while (2)
        {
          uint64_t v163 = *v9;
          uint64_t v164 = *(void *)&v4[v163];
          unint64_t v165 = v164 + 1;
          if (v164 == -1 || v165 > *(void *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            char v166 = *(unsigned char *)(*(void *)&v4[*v12] + v164);
            *(void *)&v4[v163] = v165;
            v161 |= (unint64_t)(v166 & 0x7F) << v159;
            if (v166 < 0)
            {
              v159 += 7;
              BOOL v20 = v160++ >= 9;
              if (v20)
              {
                LODWORD(v161) = 0;
                goto LABEL_243;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11]) {
          LODWORD(v161) = 0;
        }
LABEL_243:
        if (v161 >= 3) {
          uint64_t v202 = 0;
        }
        else {
          uint64_t v202 = v161;
        }
        uint64_t v203 = objc_msgSend(v162, "numberWithUnsignedInt:", v202, v222);
        if (!v203) {
          goto LABEL_313;
        }
        v198 = (void *)v203;
        uint64_t v199 = v6;
        goto LABEL_307;
      case 0x20u:
        char v167 = 0;
        unsigned int v168 = 0;
        uint64_t v169 = 0;
        uint64_t v170 = NSNumber;
        while (2)
        {
          uint64_t v171 = *v9;
          uint64_t v172 = *(void *)&v4[v171];
          unint64_t v173 = v172 + 1;
          if (v172 == -1 || v173 > *(void *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            char v174 = *(unsigned char *)(*(void *)&v4[*v12] + v172);
            *(void *)&v4[v171] = v173;
            v169 |= (unint64_t)(v174 & 0x7F) << v167;
            if (v174 < 0)
            {
              v167 += 7;
              BOOL v20 = v168++ >= 9;
              if (v20)
              {
                LODWORD(v169) = 0;
                goto LABEL_251;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11]) {
          LODWORD(v169) = 0;
        }
LABEL_251:
        if (v169 >= 8) {
          uint64_t v204 = 0;
        }
        else {
          uint64_t v204 = v169;
        }
        uint64_t v205 = objc_msgSend(v170, "numberWithUnsignedInt:", v204, v222);
        if (v205)
        {
          v198 = (void *)v205;
          uint64_t v199 = v7;
LABEL_307:
          [v199 addObject:v198];

LABEL_308:
          if (*(void *)&v4[*v9] >= *(void *)&v4[*v10]) {
            goto LABEL_309;
          }
          continue;
        }
LABEL_313:

LABEL_310:
        int v220 = 0;
LABEL_312:

        return v220;
      case 0x21u:
        uint64_t v175 = NSNumber;
        uint64_t v176 = *v9;
        unint64_t v177 = *(void *)&v4[v176];
        if (v177 <= 0xFFFFFFFFFFFFFFF7 && v177 + 8 <= *(void *)&v4[*v10])
        {
          double v178 = *(double *)(*(void *)&v4[*v12] + v177);
          *(void *)&v4[v176] = v177 + 8;
        }
        else
        {
          v4[v21] = 1;
          double v178 = 0.0;
        }
        uint64_t v208 = objc_msgSend(v175, "numberWithDouble:", v178, v222);
        if (!v208) {
          goto LABEL_313;
        }
        v198 = (void *)v208;
        uint64_t v199 = v8;
        goto LABEL_307;
      case 0x22u:
        char v179 = 0;
        unsigned int v180 = 0;
        uint64_t v181 = 0;
        v5->_hasStateOfMindLoggedIn3pApp = 1;
        while (2)
        {
          uint64_t v182 = *v9;
          uint64_t v183 = *(void *)&v4[v182];
          unint64_t v184 = v183 + 1;
          if (v183 == -1 || v184 > *(void *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            char v185 = *(unsigned char *)(*(void *)&v4[*v12] + v183);
            *(void *)&v4[v182] = v184;
            v181 |= (unint64_t)(v185 & 0x7F) << v179;
            if (v185 < 0)
            {
              v179 += 7;
              BOOL v20 = v180++ >= 9;
              if (v20)
              {
                uint64_t v181 = 0;
                goto LABEL_259;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11]) {
          uint64_t v181 = 0;
        }
LABEL_259:
        BOOL v194 = v181 != 0;
        uint64_t v195 = 51;
        goto LABEL_264;
      case 0x23u:
        char v186 = 0;
        unsigned int v187 = 0;
        uint64_t v188 = 0;
        v5->_hasStateOfMindLoggedInJournalApp = 1;
        while (2)
        {
          uint64_t v189 = *v9;
          uint64_t v190 = *(void *)&v4[v189];
          unint64_t v191 = v190 + 1;
          if (v190 == -1 || v191 > *(void *)&v4[*v10])
          {
            v4[*v11] = 1;
          }
          else
          {
            char v192 = *(unsigned char *)(*(void *)&v4[*v12] + v190);
            *(void *)&v4[v189] = v191;
            v188 |= (unint64_t)(v192 & 0x7F) << v186;
            if (v192 < 0)
            {
              v186 += 7;
              BOOL v20 = v187++ >= 9;
              if (v20)
              {
                uint64_t v188 = 0;
                goto LABEL_263;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v11]) {
          uint64_t v188 = 0;
        }
LABEL_263:
        BOOL v194 = v188 != 0;
        uint64_t v195 = 53;
LABEL_264:
        *((unsigned char *)&v5->super.super.isa + v195) = v194;
        goto LABEL_308;
      default:
        if (!PBReaderSkipValueWithTag()) {
          goto LABEL_313;
        }
        goto LABEL_308;
    }
  }
}

- (NSString)description
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  double v3 = objc_opt_new();
  [v3 appendString:@"["];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v4 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindDomains];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v101 objects:v108 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v102;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v102 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v101 + 1) + 8 * i);
        if ([v3 length] != 1) {
          [v3 appendString:@", "];
        }
        long long v10 = BMMomentsEventDataStateOfMindDomainAsString([v9 unsignedIntValue]);
        [v3 appendString:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v101 objects:v108 count:16];
    }
    while (v6);
  }

  [v3 appendString:@"]"];
  uint64_t v11 = objc_opt_new();
  [v11 appendString:@"["];
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  uint64_t v12 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindLabels];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v97 objects:v107 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v98;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v98 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v97 + 1) + 8 * j);
        if ([v11 length] != 1) {
          [v11 appendString:@", "];
        }
        unint64_t v18 = BMMomentsEventDataStateOfMindLabelAsString([v17 unsignedIntValue]);
        [v11 appendString:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v97 objects:v107 count:16];
    }
    while (v14);
  }

  [v11 appendString:@"]"];
  char v19 = objc_opt_new();
  [v19 appendString:@"["];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  BOOL v20 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindReflectiveIntervals];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v93 objects:v106 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v94;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v94 != v23) {
          objc_enumerationMutation(v20);
        }
        unint64_t v25 = *(void **)(*((void *)&v93 + 1) + 8 * k);
        if ([v19 length] != 1) {
          [v19 appendString:@", "];
        }
        float v26 = BMMomentsEventDataStateOfMindReflectiveIntervalAsString([v25 unsignedIntValue]);
        [v19 appendString:v26];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v93 objects:v106 count:16];
    }
    while (v22);
  }

  [v19 appendString:@"]"];
  uint64_t v27 = objc_opt_new();
  [v27 appendString:@"["];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  char v64 = self;
  unint64_t v28 = [(BMMomentsEventDataEventBundleMetadataForRank *)self stateOfMindValenceClassifications];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v89 objects:v105 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v90;
    do
    {
      for (uint64_t m = 0; m != v30; ++m)
      {
        if (*(void *)v90 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void **)(*((void *)&v89 + 1) + 8 * m);
        if ([v27 length] != 1) {
          [v27 appendString:@", "];
        }
        uint64_t v34 = BMMomentsEventDataStateOfMindValenceClassificationAsString([v33 unsignedIntValue]);
        [v27 appendString:v34];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v89 objects:v105 count:16];
    }
    while (v30);
  }

  [v27 appendString:@"]"];
  id v63 = [NSString alloc];
  unint64_t v35 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 dailyAggregateCallDuration];
  float v87 = objc_msgSend(v35, "numberWithDouble:");
  char v36 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 callDuration];
  unint64_t v86 = objc_msgSend(v36, "numberWithDouble:");
  uint64_t v88 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundleMetadataForRank burstyInteractionCount](v64, "burstyInteractionCount"));
  uint64_t v85 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataEventBundleMetadataForRank burstyOutgoingInteractionCount](v64, "burstyOutgoingInteractionCount"));
  char v84 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank multipleInteractionTypes](v64, "multipleInteractionTypes"));
  unint64_t v83 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank contactLocationWork](v64, "contactLocationWork"));
  uint64_t v82 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank isFamilyContact](v64, "isFamilyContact"));
  uint64_t v81 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank isCoworkerContact](v64, "isCoworkerContact"));
  uint64_t v80 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank isRepetitiveContact](v64, "isRepetitiveContact"));
  unsigned int v79 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank isGroupConversation](v64, "isGroupConversation"));
  char v37 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 peopleCountWeightedSum];
  char v78 = objc_msgSend(v37, "numberWithDouble:");
  unsigned int v38 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 peopleCountWeightedAverage];
  char v77 = objc_msgSend(v38, "numberWithDouble:");
  uint64_t v39 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 peopleCountMax];
  unint64_t v76 = objc_msgSend(v39, "numberWithDouble:");
  uint64_t v40 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 peopleDensityWeightedSum];
  uint64_t v75 = objc_msgSend(v40, "numberWithDouble:");
  unint64_t v41 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 peopleDensityWeightedAverage];
  uint64_t v74 = objc_msgSend(v41, "numberWithDouble:");
  char v42 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 peopleDensityMax];
  uint64_t v73 = objc_msgSend(v42, "numberWithDouble:");
  char v43 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 peopleDensityWeightedConfidenceSum];
  unsigned int v72 = objc_msgSend(v43, "numberWithDouble:");
  unsigned int v44 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 peopleDensityWeightedConfidenceAverage];
  char v71 = objc_msgSend(v44, "numberWithDouble:");
  uint64_t v45 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 mediaTotalPlayTime];
  char v70 = objc_msgSend(v45, "numberWithDouble:");
  uint64_t v46 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 mediaLength];
  unint64_t v69 = objc_msgSend(v46, "numberWithDouble:");
  uint64_t v68 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank mediaActionIsRepeat](v64, "mediaActionIsRepeat"));
  uint64_t v47 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 timeAtHomeDuration];
  uint64_t v67 = objc_msgSend(v47, "numberWithDouble:");
  unint64_t v48 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 photosAtHomeCurationScore];
  unint64_t v62 = objc_msgSend(v48, "numberWithDouble:");
  char v49 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 workoutDuration];
  uint64_t v61 = objc_msgSend(v49, "numberWithDouble:");
  char v50 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 motionActivityWalkSpan];
  uint64_t v60 = objc_msgSend(v50, "numberWithDouble:");
  unsigned int v51 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 visitDuration];
  uint64_t v59 = objc_msgSend(v51, "numberWithDouble:");
  uint64_t v52 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 poiCategoryInterestingness];
  uint64_t v66 = objc_msgSend(v52, "numberWithDouble:");
  uint64_t v53 = NSNumber;
  [(BMMomentsEventDataEventBundleMetadataForRank *)v64 familiarityIndex];
  char v57 = objc_msgSend(v53, "numberWithDouble:");
  unsigned int v58 = [(BMMomentsEventDataEventBundleMetadataForRank *)v64 stateOfMindValenceValues];
  uint64_t v54 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindLoggedIn3pApp](v64, "stateOfMindLoggedIn3pApp"));
  unint64_t v55 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventDataEventBundleMetadataForRank stateOfMindLoggedInJournalApp](v64, "stateOfMindLoggedInJournalApp"));
  id v65 = (id)objc_msgSend(v63, "initWithFormat:", @"BMMomentsEventDataEventBundleMetadataForRank with dailyAggregateCallDuration: %@, callDuration: %@, burstyInteractionCount: %@, burstyOutgoingInteractionCount: %@, multipleInteractionTypes: %@, contactLocationWork: %@, isFamilyContact: %@, isCoworkerContact: %@, isRepetitiveContact: %@, isGroupConversation: %@, peopleCountWeightedSum: %@, peopleCountWeightedAverage: %@, peopleCountMax: %@, peopleDensityWeightedSum: %@, peopleDensityWeightedAverage: %@, peopleDensityMax: %@, peopleDensityWeightedConfidenceSum: %@, peopleDensityWeightedConfidenceAverage: %@, mediaTotalPlayTime: %@, mediaLength: %@, mediaActionIsRepeat: %@, timeAtHomeDuration: %@, photosAtHomeCurationScore: %@, workoutDuration: %@, motionActivityWalkSpan: %@, visitDuration: %@, poiCategoryInterestingness: %@, familiarityIndex: %@, stateOfMindDomains: %@, stateOfMindLabels: %@, stateOfMindReflectiveIntervals: %@, stateOfMindValenceClassifications: %@, stateOfMindValenceValues: %@, stateOfMindLoggedIn3pApp: %@, stateOfMindLoggedInJournalApp: %@", v87, v86, v88, v85, v84, v83, v82, v81, v80, v79, v78, v77, v76, v75, v74, v73,
              v72,
              v71,
              v70,
              v69,
              v68,
              v67,
              v62,
              v61,
              v60,
              v59,
              v66,
              v57,
              v3,
              v11,
              v19,
              v27,
              v58,
              v54,
              v55);

  return (NSString *)v65;
}

- (BMMomentsEventDataEventBundleMetadataForRank)initWithDailyAggregateCallDuration:(id)a3 callDuration:(id)a4 burstyInteractionCount:(id)a5 burstyOutgoingInteractionCount:(id)a6 multipleInteractionTypes:(id)a7 contactLocationWork:(id)a8 isFamilyContact:(id)a9 isCoworkerContact:(id)a10 isRepetitiveContact:(id)a11 isGroupConversation:(id)a12 peopleCountWeightedSum:(id)a13 peopleCountWeightedAverage:(id)a14 peopleCountMax:(id)a15 peopleDensityWeightedSum:(id)a16 peopleDensityWeightedAverage:(id)a17 peopleDensityMax:(id)a18 peopleDensityWeightedConfidenceSum:(id)a19 peopleDensityWeightedConfidenceAverage:(id)a20 mediaTotalPlayTime:(id)a21 mediaLength:(id)a22 mediaActionIsRepeat:(id)a23 timeAtHomeDuration:(id)a24 photosAtHomeCurationScore:(id)a25 workoutDuration:(id)a26 motionActivityWalkSpan:(id)a27 visitDuration:(id)a28 poiCategoryInterestingness:(id)a29 familiarityIndex:(id)a30 stateOfMindDomains:(id)a31 stateOfMindLabels:(id)a32 stateOfMindReflectiveIntervals:(id)a33 stateOfMindValenceClassifications:(id)a34 stateOfMindValenceValues:(id)a35 stateOfMindLoggedIn3pApp:(id)a36 stateOfMindLoggedInJournalApp:(id)a37
{
  id v119 = a3;
  id v118 = a4;
  id v117 = a5;
  id v116 = a6;
  id v115 = a7;
  id v114 = a8;
  id v113 = a9;
  id v112 = a10;
  id v111 = a11;
  id v110 = a12;
  id v42 = a13;
  id v43 = a14;
  id v44 = a15;
  id v45 = a16;
  id v46 = a17;
  id v47 = a18;
  id v48 = a19;
  id v49 = a20;
  id v109 = a21;
  id v108 = a22;
  id v107 = a23;
  id v106 = a24;
  id v105 = a25;
  id v104 = a26;
  id v103 = a27;
  id v102 = a28;
  id v101 = a29;
  id v100 = a30;
  id v98 = a31;
  id v97 = a32;
  id v96 = a33;
  id v95 = a34;
  id v94 = a35;
  id v99 = a36;
  id v50 = a37;
  v120.receiver = self;
  v120.super_class = (Class)BMMomentsEventDataEventBundleMetadataForRank;
  unsigned int v51 = [(BMEventBase *)&v120 init];
  if (v51)
  {
    v51->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v119)
    {
      v51->_hasDailyAggregateCallDuration = 1;
      [v119 floatValue];
      double v53 = v52;
    }
    else
    {
      v51->_hasDailyAggregateCallDuration = 0;
      double v53 = -1.0;
    }
    v51->_dailyAggregateCallDuration = v53;
    if (v118)
    {
      v51->_hasCallDuration = 1;
      [v118 floatValue];
      double v55 = v54;
    }
    else
    {
      v51->_hasCallDuration = 0;
      double v55 = -1.0;
    }
    v51->_callDuration = v55;
    if (v117)
    {
      v51->_hasBurstyInteractionCount = 1;
      int v56 = [v117 intValue];
    }
    else
    {
      v51->_hasBurstyInteractionCount = 0;
      int v56 = -1;
    }
    v51->_burstyInteractionCount = v56;
    if (v116)
    {
      v51->_hasBurstyOutgoingInteractionCount = 1;
      int v57 = [v116 intValue];
    }
    else
    {
      v51->_hasBurstyOutgoingInteractionCount = 0;
      int v57 = -1;
    }
    v51->_burstyOutgoingInteractionCount = v57;
    if (v115)
    {
      v51->_hasMultipleInteractionTypes = 1;
      v51->_multipleInteractionTypes = [v115 BOOLValue];
    }
    else
    {
      v51->_hasMultipleInteractionTypes = 0;
      v51->_multipleInteractionTypes = 0;
    }
    if (v114)
    {
      v51->_hasContactLocationWoruint64_t k = 1;
      v51->_contactLocationWoruint64_t k = [v114 BOOLValue];
    }
    else
    {
      v51->_hasContactLocationWoruint64_t k = 0;
      v51->_contactLocationWoruint64_t k = 0;
    }
    if (v113)
    {
      v51->_hasIsFamilyContact = 1;
      v51->_isFamilyContact = [v113 BOOLValue];
    }
    else
    {
      v51->_hasIsFamilyContact = 0;
      v51->_isFamilyContact = 0;
    }
    if (v112)
    {
      v51->_hasIsCoworkerContact = 1;
      v51->_isCoworkerContact = [v112 BOOLValue];
    }
    else
    {
      v51->_hasIsCoworkerContact = 0;
      v51->_isCoworkerContact = 0;
    }
    if (v111)
    {
      v51->_hasIsRepetitiveContact = 1;
      v51->_isRepetitiveContact = [v111 BOOLValue];
    }
    else
    {
      v51->_hasIsRepetitiveContact = 0;
      v51->_isRepetitiveContact = 0;
    }
    if (v110)
    {
      v51->_hasIsGroupConversation = 1;
      v51->_isGroupConversation = [v110 BOOLValue];
    }
    else
    {
      v51->_hasIsGroupConversation = 0;
      v51->_isGroupConversation = 0;
    }
    if (v42)
    {
      v51->_hasPeopleCountWeightedSuuint64_t m = 1;
      [v42 floatValue];
      double v59 = v58;
    }
    else
    {
      v51->_hasPeopleCountWeightedSuuint64_t m = 0;
      double v59 = -1.0;
    }
    v51->_peopleCountWeightedSuuint64_t m = v59;
    if (v43)
    {
      v51->_hasPeopleCountWeightedAverage = 1;
      [v43 floatValue];
      double v61 = v60;
    }
    else
    {
      v51->_hasPeopleCountWeightedAverage = 0;
      double v61 = -1.0;
    }
    v51->_peopleCountWeightedAverage = v61;
    if (v44)
    {
      v51->_hasPeopleCountMax = 1;
      [v44 floatValue];
      double v63 = v62;
    }
    else
    {
      v51->_hasPeopleCountMax = 0;
      double v63 = -1.0;
    }
    v51->_peopleCountMax = v63;
    if (v45)
    {
      v51->_hasPeopleDensityWeightedSuuint64_t m = 1;
      [v45 floatValue];
      double v65 = v64;
    }
    else
    {
      v51->_hasPeopleDensityWeightedSuuint64_t m = 0;
      double v65 = -1.0;
    }
    v51->_peopleDensityWeightedSuuint64_t m = v65;
    if (v46)
    {
      v51->_hasPeopleDensityWeightedAverage = 1;
      [v46 floatValue];
      double v67 = v66;
    }
    else
    {
      v51->_hasPeopleDensityWeightedAverage = 0;
      double v67 = -1.0;
    }
    v51->_peopleDensityWeightedAverage = v67;
    if (v47)
    {
      v51->_hasPeopleDensityMax = 1;
      [v47 floatValue];
      double v69 = v68;
    }
    else
    {
      v51->_hasPeopleDensityMax = 0;
      double v69 = -1.0;
    }
    v51->_peopleDensityMax = v69;
    if (v48)
    {
      v51->_hasPeopleDensityWeightedConfidenceSuuint64_t m = 1;
      [v48 floatValue];
      double v71 = v70;
    }
    else
    {
      v51->_hasPeopleDensityWeightedConfidenceSuuint64_t m = 0;
      double v71 = -1.0;
    }
    v51->_peopleDensityWeightedConfidenceSuuint64_t m = v71;
    if (v49)
    {
      v51->_hasPeopleDensityWeightedConfidenceAverage = 1;
      [v49 floatValue];
      double v73 = v72;
    }
    else
    {
      v51->_hasPeopleDensityWeightedConfidenceAverage = 0;
      double v73 = -1.0;
    }
    v51->_peopleDensityWeightedConfidenceAverage = v73;
    if (v109)
    {
      v51->_hasMediaTotalPlayTime = 1;
      [v109 floatValue];
      double v75 = v74;
    }
    else
    {
      v51->_hasMediaTotalPlayTime = 0;
      double v75 = -1.0;
    }
    v51->_mediaTotalPlayTime = v75;
    if (v108)
    {
      v51->_hasMediaLength = 1;
      [v108 floatValue];
      double v77 = v76;
    }
    else
    {
      v51->_hasMediaLength = 0;
      double v77 = -1.0;
    }
    v51->_mediaLength = v77;
    if (v107)
    {
      v51->_hasMediaActionIsRepeat = 1;
      v51->_mediaActionIsRepeat = [v107 BOOLValue];
    }
    else
    {
      v51->_hasMediaActionIsRepeat = 0;
      v51->_mediaActionIsRepeat = 0;
    }
    if (v106)
    {
      v51->_hasTimeAtHomeDuration = 1;
      [v106 floatValue];
      double v79 = v78;
    }
    else
    {
      v51->_hasTimeAtHomeDuration = 0;
      double v79 = -1.0;
    }
    v51->_timeAtHomeDuration = v79;
    if (v105)
    {
      v51->_hasPhotosAtHomeCurationScore = 1;
      [v105 floatValue];
      double v81 = v80;
    }
    else
    {
      v51->_hasPhotosAtHomeCurationScore = 0;
      double v81 = -1.0;
    }
    v51->_photosAtHomeCurationScore = v81;
    if (v104)
    {
      v51->_hasWorkoutDuration = 1;
      [v104 floatValue];
      double v83 = v82;
    }
    else
    {
      v51->_hasWorkoutDuration = 0;
      double v83 = -1.0;
    }
    v51->_workoutDuration = v83;
    if (v103)
    {
      v51->_hasMotionActivityWalkSpan = 1;
      [v103 floatValue];
      double v85 = v84;
    }
    else
    {
      v51->_hasMotionActivityWalkSpan = 0;
      double v85 = -1.0;
    }
    v51->_motionActivityWalkSpan = v85;
    if (v102)
    {
      v51->_hasVisitDuration = 1;
      [v102 floatValue];
      double v87 = v86;
    }
    else
    {
      v51->_hasVisitDuration = 0;
      double v87 = -1.0;
    }
    v51->_visitDuration = v87;
    if (v101)
    {
      v51->_hasPoiCategoryInterestingness = 1;
      [v101 floatValue];
      double v89 = v88;
    }
    else
    {
      v51->_hasPoiCategoryInterestingness = 0;
      double v89 = -1.0;
    }
    v51->_poiCategoryInterestingness = v89;
    if (v100)
    {
      v51->_hasFamiliarityIndex = 1;
      [v100 floatValue];
      double v91 = v90;
    }
    else
    {
      v51->_hasFamiliarityIndex = 0;
      double v91 = -1.0;
    }
    v51->_familiarityIndex = v91;
    objc_storeStrong((id *)&v51->_stateOfMindDomains, a31);
    objc_storeStrong((id *)&v51->_stateOfMindLabels, a32);
    objc_storeStrong((id *)&v51->_stateOfMindReflectiveIntervals, a33);
    objc_storeStrong((id *)&v51->_stateOfMindValenceClassifications, a34);
    objc_storeStrong((id *)&v51->_stateOfMindValenceValues, a35);
    if (v99)
    {
      v51->_hasStateOfMindLoggedIn3pApp = 1;
      v51->_stateOfMindLoggedIn3pApp = [v99 BOOLValue];
    }
    else
    {
      v51->_hasStateOfMindLoggedIn3pApp = 0;
      v51->_stateOfMindLoggedIn3pApp = 0;
    }
    if (v50)
    {
      v51->_hasStateOfMindLoggedInJournalApp = 1;
      v51->_stateOfMindLoggedInJournalApp = [v50 BOOLValue];
    }
    else
    {
      v51->_hasStateOfMindLoggedInJournalApp = 0;
      v51->_stateOfMindLoggedInJournalApp = 0;
    }
  }

  return v51;
}

+ (id)protoFields
{
  v39[35] = *MEMORY[0x1E4F143B8];
  unsigned int v38 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dailyAggregateCallDuration" number:1 type:1 subMessageClass:0];
  v39[0] = v38;
  char v37 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"callDuration" number:2 type:1 subMessageClass:0];
  v39[1] = v37;
  char v36 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"burstyInteractionCount" number:3 type:2 subMessageClass:0];
  v39[2] = v36;
  unint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"burstyOutgoingInteractionCount" number:4 type:2 subMessageClass:0];
  v39[3] = v35;
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"multipleInteractionTypes" number:5 type:12 subMessageClass:0];
  v39[4] = v34;
  uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contactLocationWork" number:6 type:12 subMessageClass:0];
  v39[5] = v33;
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isFamilyContact" number:7 type:12 subMessageClass:0];
  v39[6] = v32;
  uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isCoworkerContact" number:8 type:12 subMessageClass:0];
  v39[7] = v31;
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isRepetitiveContact" number:9 type:12 subMessageClass:0];
  v39[8] = v30;
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isGroupConversation" number:10 type:12 subMessageClass:0];
  v39[9] = v29;
  unint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"peopleCountWeightedSum" number:11 type:1 subMessageClass:0];
  v39[10] = v28;
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"peopleCountWeightedAverage" number:12 type:1 subMessageClass:0];
  v39[11] = v27;
  float v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"peopleCountMax" number:13 type:1 subMessageClass:0];
  v39[12] = v26;
  unint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"peopleDensityWeightedSum" number:14 type:1 subMessageClass:0];
  v39[13] = v25;
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"peopleDensityWeightedAverage" number:15 type:1 subMessageClass:0];
  v39[14] = v24;
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"peopleDensityMax" number:16 type:1 subMessageClass:0];
  v39[15] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"peopleDensityWeightedConfidenceSum" number:17 type:1 subMessageClass:0];
  v39[16] = v22;
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"peopleDensityWeightedConfidenceAverage" number:18 type:1 subMessageClass:0];
  v39[17] = v21;
  BOOL v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaTotalPlayTime" number:19 type:1 subMessageClass:0];
  v39[18] = v20;
  char v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaLength" number:20 type:1 subMessageClass:0];
  v39[19] = v19;
  unint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaActionIsRepeat" number:21 type:12 subMessageClass:0];
  v39[20] = v18;
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timeAtHomeDuration" number:22 type:1 subMessageClass:0];
  v39[21] = v17;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"photosAtHomeCurationScore" number:23 type:1 subMessageClass:0];
  v39[22] = v16;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"workoutDuration" number:24 type:1 subMessageClass:0];
  v39[23] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"motionActivityWalkSpan" number:25 type:1 subMessageClass:0];
  v39[24] = v14;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"visitDuration" number:26 type:1 subMessageClass:0];
  v39[25] = v2;
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"poiCategoryInterestingness" number:27 type:1 subMessageClass:0];
  v39[26] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"familiarityIndex" number:28 type:1 subMessageClass:0];
  v39[27] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stateOfMindDomains" number:29 type:4 subMessageClass:0];
  v39[28] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stateOfMindLabels" number:30 type:4 subMessageClass:0];
  v39[29] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stateOfMindReflectiveIntervals" number:31 type:4 subMessageClass:0];
  v39[30] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stateOfMindValenceClassifications" number:32 type:4 subMessageClass:0];
  v39[31] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stateOfMindValenceValues" number:33 type:0 subMessageClass:0];
  v39[32] = v9;
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stateOfMindLoggedIn3pApp" number:34 type:12 subMessageClass:0];
  v39[33] = v10;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stateOfMindLoggedInJournalApp" number:35 type:12 subMessageClass:0];
  v39[34] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:35];

  return v13;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3348;
}

+ (id)columns
{
  v39[35] = *MEMORY[0x1E4F143B8];
  unsigned int v38 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dailyAggregateCallDuration" dataType:1 requestOnly:0 fieldNumber:1 protoDataType:1 convertedType:0];
  char v37 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"callDuration" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:1 convertedType:0];
  char v36 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"burstyInteractionCount" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  unint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"burstyOutgoingInteractionCount" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:2 convertedType:0];
  uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"multipleInteractionTypes" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"contactLocationWork" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isFamilyContact" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isCoworkerContact" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isRepetitiveContact" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:12 convertedType:0];
  uint64_t v29 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isGroupConversation" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:12 convertedType:0];
  unint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"peopleCountWeightedSum" dataType:1 requestOnly:0 fieldNumber:11 protoDataType:1 convertedType:0];
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"peopleCountWeightedAverage" dataType:1 requestOnly:0 fieldNumber:12 protoDataType:1 convertedType:0];
  float v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"peopleCountMax" dataType:1 requestOnly:0 fieldNumber:13 protoDataType:1 convertedType:0];
  unint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"peopleDensityWeightedSum" dataType:1 requestOnly:0 fieldNumber:14 protoDataType:1 convertedType:0];
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"peopleDensityWeightedAverage" dataType:1 requestOnly:0 fieldNumber:15 protoDataType:1 convertedType:0];
  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"peopleDensityMax" dataType:1 requestOnly:0 fieldNumber:16 protoDataType:1 convertedType:0];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"peopleDensityWeightedConfidenceSum" dataType:1 requestOnly:0 fieldNumber:17 protoDataType:1 convertedType:0];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"peopleDensityWeightedConfidenceAverage" dataType:1 requestOnly:0 fieldNumber:18 protoDataType:1 convertedType:0];
  BOOL v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mediaTotalPlayTime" dataType:1 requestOnly:0 fieldNumber:19 protoDataType:1 convertedType:0];
  unint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mediaLength" dataType:1 requestOnly:0 fieldNumber:20 protoDataType:1 convertedType:0];
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mediaActionIsRepeat" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:12 convertedType:0];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timeAtHomeDuration" dataType:1 requestOnly:0 fieldNumber:22 protoDataType:1 convertedType:0];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"photosAtHomeCurationScore" dataType:1 requestOnly:0 fieldNumber:23 protoDataType:1 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"workoutDuration" dataType:1 requestOnly:0 fieldNumber:24 protoDataType:1 convertedType:0];
  char v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"motionActivityWalkSpan" dataType:1 requestOnly:0 fieldNumber:25 protoDataType:1 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"visitDuration" dataType:1 requestOnly:0 fieldNumber:26 protoDataType:1 convertedType:0];
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"poiCategoryInterestingness" dataType:1 requestOnly:0 fieldNumber:27 protoDataType:1 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"familiarityIndex" dataType:1 requestOnly:0 fieldNumber:28 protoDataType:1 convertedType:0];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"stateOfMindDomains_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3273];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"stateOfMindLabels_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3275];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"stateOfMindReflectiveIntervals_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3277];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"stateOfMindValenceClassifications_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3279];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"stateOfMindValenceValues_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3281];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stateOfMindLoggedIn3pApp" dataType:0 requestOnly:0 fieldNumber:34 protoDataType:12 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stateOfMindLoggedInJournalApp" dataType:0 requestOnly:0 fieldNumber:35 protoDataType:12 convertedType:0];
  v39[0] = v38;
  v39[1] = v37;
  v39[2] = v36;
  v39[3] = v35;
  v39[4] = v34;
  v39[5] = v33;
  v39[6] = v32;
  v39[7] = v31;
  v39[8] = v30;
  v39[9] = v29;
  v39[10] = v28;
  v39[11] = v27;
  v39[12] = v26;
  v39[13] = v25;
  v39[14] = v24;
  v39[15] = v23;
  v39[16] = v22;
  v39[17] = v21;
  v39[18] = v20;
  v39[19] = v18;
  v39[20] = v17;
  v39[21] = v16;
  v39[22] = v15;
  v39[23] = v14;
  v39[24] = v19;
  v39[25] = v2;
  v39[26] = v3;
  v39[27] = v4;
  v39[28] = v13;
  v39[29] = v12;
  v39[30] = v5;
  v39[31] = v6;
  v39[32] = v11;
  v39[33] = v7;
  v39[34] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:35];

  return v10;
}

id __55__BMMomentsEventDataEventBundleMetadataForRank_columns__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  double v3 = [v2 _stateOfMindValenceValuesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __55__BMMomentsEventDataEventBundleMetadataForRank_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  double v3 = [v2 _stateOfMindValenceClassificationsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __55__BMMomentsEventDataEventBundleMetadataForRank_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  double v3 = [v2 _stateOfMindReflectiveIntervalsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __55__BMMomentsEventDataEventBundleMetadataForRank_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  double v3 = [v2 _stateOfMindLabelsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __55__BMMomentsEventDataEventBundleMetadataForRank_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  double v3 = [v2 _stateOfMindDomainsJSONArray];
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

    uint64_t v8 = [[BMMomentsEventDataEventBundleMetadataForRank alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[14] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end