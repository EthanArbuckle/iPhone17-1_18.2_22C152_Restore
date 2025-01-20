@interface BMMomentsEventData
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMomentsEventData)initWithEvent:(id)a3 bundle:(id)a4 isBundle:(id)a5 IHAState:(id)a6 age:(id)a7 ageRange:(int)a8 biologicalSex:(int)a9;
- (BMMomentsEventData)initWithEvent:(id)a3 bundle:(id)a4 isBundle:(id)a5 IHAState:(id)a6 age:(id)a7 ageRange:(int)a8 biologicalSex:(int)a9 startDate:(id)a10 endDate:(id)a11 categoryOfEvent:(id)a12 bundleInterface:(id)a13 bundleEvergreenType:(id)a14 sugSeetEngType:(id)a15 appEntryEngType:(id)a16 megaSignalTypeUsed:(id)a17 viewVisibleSuggestionsCount:(id)a18 viewTotalSuggestionsCount:(id)a19;
- (BMMomentsEventData)initWithEvent:(id)a3 bundle:(id)a4 isBundle:(id)a5 IHAState:(id)a6 age:(id)a7 ageRange:(int)a8 biologicalSex:(int)a9 startDate:(id)a10 endDate:(id)a11 categoryOfEvent:(id)a12 bundleInterface:(id)a13 bundleEvergreenType:(id)a14 sugSeetEngType:(id)a15 appEntryEngType:(id)a16 megaSignalTypeUsed:(id)a17 viewVisibleSuggestionsCount:(id)a18 viewTotalSuggestionsCount:(id)a19 onboardingFlowCompletionState:(int)a20 isJournalAppInstalled:(id)a21 isJournalAppLocked:(id)a22 isJournalSuggestionSkipped:(id)a23 isActivitySettingsSwitchEnabled:(id)a24 isCommunicationSettingsSwitchEnabled:(id)a25 isSignificantLocationSettingsSwitchEnabled:(id)a26 isMediaSettingsSwitchEnabled:(id)a27 isNearbyPeopleSettingsSwitchEnabled:(id)a28 isPhotoSettingsSwitchEnabled:(id)a29 isStateOfMindSettingsSwitchEnabled:(id)a30 isReflectionSettingsSwitchEnabled:(id)a31 isBroadSystemLocationSettingsSwitchEnabled:(id)a32;
- (BMMomentsEventData)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMomentsEventDataEvent)event;
- (BMMomentsEventDataEventBundle)bundle;
- (BOOL)IHAState;
- (BOOL)hasAge;
- (BOOL)hasIHAState;
- (BOOL)hasIsActivitySettingsSwitchEnabled;
- (BOOL)hasIsBroadSystemLocationSettingsSwitchEnabled;
- (BOOL)hasIsBundle;
- (BOOL)hasIsCommunicationSettingsSwitchEnabled;
- (BOOL)hasIsJournalAppInstalled;
- (BOOL)hasIsJournalAppLocked;
- (BOOL)hasIsJournalSuggestionSkipped;
- (BOOL)hasIsMediaSettingsSwitchEnabled;
- (BOOL)hasIsNearbyPeopleSettingsSwitchEnabled;
- (BOOL)hasIsPhotoSettingsSwitchEnabled;
- (BOOL)hasIsReflectionSettingsSwitchEnabled;
- (BOOL)hasIsSignificantLocationSettingsSwitchEnabled;
- (BOOL)hasIsStateOfMindSettingsSwitchEnabled;
- (BOOL)hasViewTotalSuggestionsCount;
- (BOOL)hasViewVisibleSuggestionsCount;
- (BOOL)isActivitySettingsSwitchEnabled;
- (BOOL)isBroadSystemLocationSettingsSwitchEnabled;
- (BOOL)isBundle;
- (BOOL)isCommunicationSettingsSwitchEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isJournalAppInstalled;
- (BOOL)isJournalAppLocked;
- (BOOL)isJournalSuggestionSkipped;
- (BOOL)isMediaSettingsSwitchEnabled;
- (BOOL)isNearbyPeopleSettingsSwitchEnabled;
- (BOOL)isPhotoSettingsSwitchEnabled;
- (BOOL)isReflectionSettingsSwitchEnabled;
- (BOOL)isSignificantLocationSettingsSwitchEnabled;
- (BOOL)isStateOfMindSettingsSwitchEnabled;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)appEntryEngType;
- (NSString)bundleEvergreenType;
- (NSString)bundleInterface;
- (NSString)categoryOfEvent;
- (NSString)description;
- (NSString)megaSignalTypeUsed;
- (NSString)sugSeetEngType;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)age;
- (int)ageRange;
- (int)biologicalSex;
- (int)onboardingFlowCompletionState;
- (int)viewTotalSuggestionsCount;
- (int)viewVisibleSuggestionsCount;
- (unsigned)dataVersion;
- (void)setHasAge:(BOOL)a3;
- (void)setHasIHAState:(BOOL)a3;
- (void)setHasIsActivitySettingsSwitchEnabled:(BOOL)a3;
- (void)setHasIsBroadSystemLocationSettingsSwitchEnabled:(BOOL)a3;
- (void)setHasIsBundle:(BOOL)a3;
- (void)setHasIsCommunicationSettingsSwitchEnabled:(BOOL)a3;
- (void)setHasIsJournalAppInstalled:(BOOL)a3;
- (void)setHasIsJournalAppLocked:(BOOL)a3;
- (void)setHasIsJournalSuggestionSkipped:(BOOL)a3;
- (void)setHasIsMediaSettingsSwitchEnabled:(BOOL)a3;
- (void)setHasIsNearbyPeopleSettingsSwitchEnabled:(BOOL)a3;
- (void)setHasIsPhotoSettingsSwitchEnabled:(BOOL)a3;
- (void)setHasIsReflectionSettingsSwitchEnabled:(BOOL)a3;
- (void)setHasIsSignificantLocationSettingsSwitchEnabled:(BOOL)a3;
- (void)setHasIsStateOfMindSettingsSwitchEnabled:(BOOL)a3;
- (void)setHasViewTotalSuggestionsCount:(BOOL)a3;
- (void)setHasViewVisibleSuggestionsCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMomentsEventData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_megaSignalTypeUsed, 0);
  objc_storeStrong((id *)&self->_appEntryEngType, 0);
  objc_storeStrong((id *)&self->_sugSeetEngType, 0);
  objc_storeStrong((id *)&self->_bundleEvergreenType, 0);
  objc_storeStrong((id *)&self->_bundleInterface, 0);
  objc_storeStrong((id *)&self->_categoryOfEvent, 0);
  objc_storeStrong((id *)&self->_bundle, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

- (void)setHasIsBroadSystemLocationSettingsSwitchEnabled:(BOOL)a3
{
  self->_hasIsBroadSystemLocationSettingsSwitchEnabled = a3;
}

- (BOOL)hasIsBroadSystemLocationSettingsSwitchEnabled
{
  return self->_hasIsBroadSystemLocationSettingsSwitchEnabled;
}

- (BOOL)isBroadSystemLocationSettingsSwitchEnabled
{
  return self->_isBroadSystemLocationSettingsSwitchEnabled;
}

- (void)setHasIsReflectionSettingsSwitchEnabled:(BOOL)a3
{
  self->_hasIsReflectionSettingsSwitchEnabled = a3;
}

- (BOOL)hasIsReflectionSettingsSwitchEnabled
{
  return self->_hasIsReflectionSettingsSwitchEnabled;
}

- (BOOL)isReflectionSettingsSwitchEnabled
{
  return self->_isReflectionSettingsSwitchEnabled;
}

- (void)setHasIsStateOfMindSettingsSwitchEnabled:(BOOL)a3
{
  self->_hasIsStateOfMindSettingsSwitchEnabled = a3;
}

- (BOOL)hasIsStateOfMindSettingsSwitchEnabled
{
  return self->_hasIsStateOfMindSettingsSwitchEnabled;
}

- (BOOL)isStateOfMindSettingsSwitchEnabled
{
  return self->_isStateOfMindSettingsSwitchEnabled;
}

- (void)setHasIsPhotoSettingsSwitchEnabled:(BOOL)a3
{
  self->_hasIsPhotoSettingsSwitchEnabled = a3;
}

- (BOOL)hasIsPhotoSettingsSwitchEnabled
{
  return self->_hasIsPhotoSettingsSwitchEnabled;
}

- (BOOL)isPhotoSettingsSwitchEnabled
{
  return self->_isPhotoSettingsSwitchEnabled;
}

- (void)setHasIsNearbyPeopleSettingsSwitchEnabled:(BOOL)a3
{
  self->_hasIsNearbyPeopleSettingsSwitchEnabled = a3;
}

- (BOOL)hasIsNearbyPeopleSettingsSwitchEnabled
{
  return self->_hasIsNearbyPeopleSettingsSwitchEnabled;
}

- (BOOL)isNearbyPeopleSettingsSwitchEnabled
{
  return self->_isNearbyPeopleSettingsSwitchEnabled;
}

- (void)setHasIsMediaSettingsSwitchEnabled:(BOOL)a3
{
  self->_hasIsMediaSettingsSwitchEnabled = a3;
}

- (BOOL)hasIsMediaSettingsSwitchEnabled
{
  return self->_hasIsMediaSettingsSwitchEnabled;
}

- (BOOL)isMediaSettingsSwitchEnabled
{
  return self->_isMediaSettingsSwitchEnabled;
}

- (void)setHasIsSignificantLocationSettingsSwitchEnabled:(BOOL)a3
{
  self->_hasIsSignificantLocationSettingsSwitchEnabled = a3;
}

- (BOOL)hasIsSignificantLocationSettingsSwitchEnabled
{
  return self->_hasIsSignificantLocationSettingsSwitchEnabled;
}

- (BOOL)isSignificantLocationSettingsSwitchEnabled
{
  return self->_isSignificantLocationSettingsSwitchEnabled;
}

- (void)setHasIsCommunicationSettingsSwitchEnabled:(BOOL)a3
{
  self->_hasIsCommunicationSettingsSwitchEnabled = a3;
}

- (BOOL)hasIsCommunicationSettingsSwitchEnabled
{
  return self->_hasIsCommunicationSettingsSwitchEnabled;
}

- (BOOL)isCommunicationSettingsSwitchEnabled
{
  return self->_isCommunicationSettingsSwitchEnabled;
}

- (void)setHasIsActivitySettingsSwitchEnabled:(BOOL)a3
{
  self->_hasIsActivitySettingsSwitchEnabled = a3;
}

- (BOOL)hasIsActivitySettingsSwitchEnabled
{
  return self->_hasIsActivitySettingsSwitchEnabled;
}

- (BOOL)isActivitySettingsSwitchEnabled
{
  return self->_isActivitySettingsSwitchEnabled;
}

- (void)setHasIsJournalSuggestionSkipped:(BOOL)a3
{
  self->_hasIsJournalSuggestionSkipped = a3;
}

- (BOOL)hasIsJournalSuggestionSkipped
{
  return self->_hasIsJournalSuggestionSkipped;
}

- (BOOL)isJournalSuggestionSkipped
{
  return self->_isJournalSuggestionSkipped;
}

- (void)setHasIsJournalAppLocked:(BOOL)a3
{
  self->_hasIsJournalAppLocked = a3;
}

- (BOOL)hasIsJournalAppLocked
{
  return self->_hasIsJournalAppLocked;
}

- (BOOL)isJournalAppLocked
{
  return self->_isJournalAppLocked;
}

- (void)setHasIsJournalAppInstalled:(BOOL)a3
{
  self->_hasIsJournalAppInstalled = a3;
}

- (BOOL)hasIsJournalAppInstalled
{
  return self->_hasIsJournalAppInstalled;
}

- (BOOL)isJournalAppInstalled
{
  return self->_isJournalAppInstalled;
}

- (int)onboardingFlowCompletionState
{
  return self->_onboardingFlowCompletionState;
}

- (void)setHasViewTotalSuggestionsCount:(BOOL)a3
{
  self->_hasViewTotalSuggestionsCount = a3;
}

- (BOOL)hasViewTotalSuggestionsCount
{
  return self->_hasViewTotalSuggestionsCount;
}

- (int)viewTotalSuggestionsCount
{
  return self->_viewTotalSuggestionsCount;
}

- (void)setHasViewVisibleSuggestionsCount:(BOOL)a3
{
  self->_hasViewVisibleSuggestionsCount = a3;
}

- (BOOL)hasViewVisibleSuggestionsCount
{
  return self->_hasViewVisibleSuggestionsCount;
}

- (int)viewVisibleSuggestionsCount
{
  return self->_viewVisibleSuggestionsCount;
}

- (NSString)megaSignalTypeUsed
{
  return self->_megaSignalTypeUsed;
}

- (NSString)appEntryEngType
{
  return self->_appEntryEngType;
}

- (NSString)sugSeetEngType
{
  return self->_sugSeetEngType;
}

- (NSString)bundleEvergreenType
{
  return self->_bundleEvergreenType;
}

- (NSString)bundleInterface
{
  return self->_bundleInterface;
}

- (NSString)categoryOfEvent
{
  return self->_categoryOfEvent;
}

- (int)biologicalSex
{
  return self->_biologicalSex;
}

- (int)ageRange
{
  return self->_ageRange;
}

- (void)setHasAge:(BOOL)a3
{
  self->_hasAge = a3;
}

- (BOOL)hasAge
{
  return self->_hasAge;
}

- (int)age
{
  return self->_age;
}

- (void)setHasIHAState:(BOOL)a3
{
  self->_hasIHAState = a3;
}

- (BOOL)hasIHAState
{
  return self->_hasIHAState;
}

- (BOOL)IHAState
{
  return self->_IHAState;
}

- (void)setHasIsBundle:(BOOL)a3
{
  self->_hasIsBundle = a3;
}

- (BOOL)hasIsBundle
{
  return self->_hasIsBundle;
}

- (BOOL)isBundle
{
  return self->_isBundle;
}

- (BMMomentsEventDataEventBundle)bundle
{
  return self->_bundle;
}

- (BMMomentsEventDataEvent)event
{
  return self->_event;
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
    v6 = [(BMMomentsEventData *)self event];
    uint64_t v7 = [v5 event];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMomentsEventData *)self event];
      v10 = [v5 event];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_131;
      }
    }
    v13 = [(BMMomentsEventData *)self bundle];
    uint64_t v14 = [v5 bundle];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMomentsEventData *)self bundle];
      v17 = [v5 bundle];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_131;
      }
    }
    if (-[BMMomentsEventData hasIsBundle](self, "hasIsBundle") || [v5 hasIsBundle])
    {
      if (![(BMMomentsEventData *)self hasIsBundle]) {
        goto LABEL_131;
      }
      if (![v5 hasIsBundle]) {
        goto LABEL_131;
      }
      int v19 = [(BMMomentsEventData *)self isBundle];
      if (v19 != [v5 isBundle]) {
        goto LABEL_131;
      }
    }
    if (-[BMMomentsEventData hasIHAState](self, "hasIHAState") || [v5 hasIHAState])
    {
      if (![(BMMomentsEventData *)self hasIHAState]) {
        goto LABEL_131;
      }
      if (![v5 hasIHAState]) {
        goto LABEL_131;
      }
      int v20 = [(BMMomentsEventData *)self IHAState];
      if (v20 != [v5 IHAState]) {
        goto LABEL_131;
      }
    }
    if (-[BMMomentsEventData hasAge](self, "hasAge") || [v5 hasAge])
    {
      if (![(BMMomentsEventData *)self hasAge]) {
        goto LABEL_131;
      }
      if (![v5 hasAge]) {
        goto LABEL_131;
      }
      int v21 = [(BMMomentsEventData *)self age];
      if (v21 != [v5 age]) {
        goto LABEL_131;
      }
    }
    int v22 = [(BMMomentsEventData *)self ageRange];
    if (v22 != [v5 ageRange]) {
      goto LABEL_131;
    }
    int v23 = [(BMMomentsEventData *)self biologicalSex];
    if (v23 != [v5 biologicalSex]) {
      goto LABEL_131;
    }
    v24 = [(BMMomentsEventData *)self startDate];
    uint64_t v25 = [v5 startDate];
    if (v24 == (void *)v25)
    {
    }
    else
    {
      v26 = (void *)v25;
      v27 = [(BMMomentsEventData *)self startDate];
      v28 = [v5 startDate];
      int v29 = [v27 isEqual:v28];

      if (!v29) {
        goto LABEL_131;
      }
    }
    v30 = [(BMMomentsEventData *)self endDate];
    uint64_t v31 = [v5 endDate];
    if (v30 == (void *)v31)
    {
    }
    else
    {
      v32 = (void *)v31;
      v33 = [(BMMomentsEventData *)self endDate];
      v34 = [v5 endDate];
      int v35 = [v33 isEqual:v34];

      if (!v35) {
        goto LABEL_131;
      }
    }
    v36 = [(BMMomentsEventData *)self categoryOfEvent];
    uint64_t v37 = [v5 categoryOfEvent];
    if (v36 == (void *)v37)
    {
    }
    else
    {
      v38 = (void *)v37;
      v39 = [(BMMomentsEventData *)self categoryOfEvent];
      v40 = [v5 categoryOfEvent];
      int v41 = [v39 isEqual:v40];

      if (!v41) {
        goto LABEL_131;
      }
    }
    v42 = [(BMMomentsEventData *)self bundleInterface];
    uint64_t v43 = [v5 bundleInterface];
    if (v42 == (void *)v43)
    {
    }
    else
    {
      v44 = (void *)v43;
      v45 = [(BMMomentsEventData *)self bundleInterface];
      v46 = [v5 bundleInterface];
      int v47 = [v45 isEqual:v46];

      if (!v47) {
        goto LABEL_131;
      }
    }
    v48 = [(BMMomentsEventData *)self bundleEvergreenType];
    uint64_t v49 = [v5 bundleEvergreenType];
    if (v48 == (void *)v49)
    {
    }
    else
    {
      v50 = (void *)v49;
      v51 = [(BMMomentsEventData *)self bundleEvergreenType];
      v52 = [v5 bundleEvergreenType];
      int v53 = [v51 isEqual:v52];

      if (!v53) {
        goto LABEL_131;
      }
    }
    v54 = [(BMMomentsEventData *)self sugSeetEngType];
    uint64_t v55 = [v5 sugSeetEngType];
    if (v54 == (void *)v55)
    {
    }
    else
    {
      v56 = (void *)v55;
      v57 = [(BMMomentsEventData *)self sugSeetEngType];
      v58 = [v5 sugSeetEngType];
      int v59 = [v57 isEqual:v58];

      if (!v59) {
        goto LABEL_131;
      }
    }
    v60 = [(BMMomentsEventData *)self appEntryEngType];
    uint64_t v61 = [v5 appEntryEngType];
    if (v60 == (void *)v61)
    {
    }
    else
    {
      v62 = (void *)v61;
      v63 = [(BMMomentsEventData *)self appEntryEngType];
      v64 = [v5 appEntryEngType];
      int v65 = [v63 isEqual:v64];

      if (!v65) {
        goto LABEL_131;
      }
    }
    v66 = [(BMMomentsEventData *)self megaSignalTypeUsed];
    uint64_t v67 = [v5 megaSignalTypeUsed];
    if (v66 == (void *)v67)
    {
    }
    else
    {
      v68 = (void *)v67;
      v69 = [(BMMomentsEventData *)self megaSignalTypeUsed];
      v70 = [v5 megaSignalTypeUsed];
      int v71 = [v69 isEqual:v70];

      if (!v71) {
        goto LABEL_131;
      }
    }
    if (![(BMMomentsEventData *)self hasViewVisibleSuggestionsCount]
      && ![v5 hasViewVisibleSuggestionsCount]
      || [(BMMomentsEventData *)self hasViewVisibleSuggestionsCount]
      && [v5 hasViewVisibleSuggestionsCount]
      && (int v72 = [(BMMomentsEventData *)self viewVisibleSuggestionsCount],
          v72 == [v5 viewVisibleSuggestionsCount]))
    {
      if (![(BMMomentsEventData *)self hasViewTotalSuggestionsCount]
        && ![v5 hasViewTotalSuggestionsCount]
        || [(BMMomentsEventData *)self hasViewTotalSuggestionsCount]
        && [v5 hasViewTotalSuggestionsCount]
        && (int v73 = [(BMMomentsEventData *)self viewTotalSuggestionsCount],
            v73 == [v5 viewTotalSuggestionsCount]))
      {
        int v74 = [(BMMomentsEventData *)self onboardingFlowCompletionState];
        if (v74 == [v5 onboardingFlowCompletionState])
        {
          if (![(BMMomentsEventData *)self hasIsJournalAppInstalled]
            && ![v5 hasIsJournalAppInstalled]
            || [(BMMomentsEventData *)self hasIsJournalAppInstalled]
            && [v5 hasIsJournalAppInstalled]
            && (int v75 = [(BMMomentsEventData *)self isJournalAppInstalled],
                v75 == [v5 isJournalAppInstalled]))
          {
            if (![(BMMomentsEventData *)self hasIsJournalAppLocked]
              && ![v5 hasIsJournalAppLocked]
              || [(BMMomentsEventData *)self hasIsJournalAppLocked]
              && [v5 hasIsJournalAppLocked]
              && (int v76 = [(BMMomentsEventData *)self isJournalAppLocked],
                  v76 == [v5 isJournalAppLocked]))
            {
              if (![(BMMomentsEventData *)self hasIsJournalSuggestionSkipped]
                && ![v5 hasIsJournalSuggestionSkipped]
                || [(BMMomentsEventData *)self hasIsJournalSuggestionSkipped]
                && [v5 hasIsJournalSuggestionSkipped]
                && (int v77 = [(BMMomentsEventData *)self isJournalSuggestionSkipped],
                    v77 == [v5 isJournalSuggestionSkipped]))
              {
                if (!-[BMMomentsEventData hasIsActivitySettingsSwitchEnabled](self, "hasIsActivitySettingsSwitchEnabled")&& ![v5 hasIsActivitySettingsSwitchEnabled]|| -[BMMomentsEventData hasIsActivitySettingsSwitchEnabled](self, "hasIsActivitySettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsActivitySettingsSwitchEnabled")&& (int v78 = -[BMMomentsEventData isActivitySettingsSwitchEnabled](self, "isActivitySettingsSwitchEnabled"), v78 == objc_msgSend(v5, "isActivitySettingsSwitchEnabled")))
                {
                  if (!-[BMMomentsEventData hasIsCommunicationSettingsSwitchEnabled](self, "hasIsCommunicationSettingsSwitchEnabled")&& ![v5 hasIsCommunicationSettingsSwitchEnabled]|| -[BMMomentsEventData hasIsCommunicationSettingsSwitchEnabled](self, "hasIsCommunicationSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsCommunicationSettingsSwitchEnabled")&& (int v79 = -[BMMomentsEventData isCommunicationSettingsSwitchEnabled](self, "isCommunicationSettingsSwitchEnabled"), v79 == objc_msgSend(v5, "isCommunicationSettingsSwitchEnabled")))
                  {
                    if (!-[BMMomentsEventData hasIsSignificantLocationSettingsSwitchEnabled](self, "hasIsSignificantLocationSettingsSwitchEnabled")&& ![v5 hasIsSignificantLocationSettingsSwitchEnabled]|| -[BMMomentsEventData hasIsSignificantLocationSettingsSwitchEnabled](self, "hasIsSignificantLocationSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsSignificantLocationSettingsSwitchEnabled")&& (int v80 = -[BMMomentsEventData isSignificantLocationSettingsSwitchEnabled](self, "isSignificantLocationSettingsSwitchEnabled"), v80 == objc_msgSend(v5, "isSignificantLocationSettingsSwitchEnabled")))
                    {
                      if (!-[BMMomentsEventData hasIsMediaSettingsSwitchEnabled](self, "hasIsMediaSettingsSwitchEnabled")&& ![v5 hasIsMediaSettingsSwitchEnabled]|| -[BMMomentsEventData hasIsMediaSettingsSwitchEnabled](self, "hasIsMediaSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsMediaSettingsSwitchEnabled")&& (int v81 = -[BMMomentsEventData isMediaSettingsSwitchEnabled](self, "isMediaSettingsSwitchEnabled"), v81 == objc_msgSend(v5, "isMediaSettingsSwitchEnabled")))
                      {
                        if (!-[BMMomentsEventData hasIsNearbyPeopleSettingsSwitchEnabled](self, "hasIsNearbyPeopleSettingsSwitchEnabled")&& ![v5 hasIsNearbyPeopleSettingsSwitchEnabled]|| -[BMMomentsEventData hasIsNearbyPeopleSettingsSwitchEnabled](self, "hasIsNearbyPeopleSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsNearbyPeopleSettingsSwitchEnabled")&& (int v82 = -[BMMomentsEventData isNearbyPeopleSettingsSwitchEnabled](self, "isNearbyPeopleSettingsSwitchEnabled"), v82 == objc_msgSend(v5, "isNearbyPeopleSettingsSwitchEnabled")))
                        {
                          if (!-[BMMomentsEventData hasIsPhotoSettingsSwitchEnabled](self, "hasIsPhotoSettingsSwitchEnabled")&& ![v5 hasIsPhotoSettingsSwitchEnabled]|| -[BMMomentsEventData hasIsPhotoSettingsSwitchEnabled](self, "hasIsPhotoSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsPhotoSettingsSwitchEnabled")&& (int v83 = -[BMMomentsEventData isPhotoSettingsSwitchEnabled](self, "isPhotoSettingsSwitchEnabled"), v83 == objc_msgSend(v5, "isPhotoSettingsSwitchEnabled")))
                          {
                            if (!-[BMMomentsEventData hasIsStateOfMindSettingsSwitchEnabled](self, "hasIsStateOfMindSettingsSwitchEnabled")&& ![v5 hasIsStateOfMindSettingsSwitchEnabled]|| -[BMMomentsEventData hasIsStateOfMindSettingsSwitchEnabled](self, "hasIsStateOfMindSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsStateOfMindSettingsSwitchEnabled")&& (int v84 = -[BMMomentsEventData isStateOfMindSettingsSwitchEnabled](self, "isStateOfMindSettingsSwitchEnabled"), v84 == objc_msgSend(v5, "isStateOfMindSettingsSwitchEnabled")))
                            {
                              if (!-[BMMomentsEventData hasIsReflectionSettingsSwitchEnabled](self, "hasIsReflectionSettingsSwitchEnabled")&& ![v5 hasIsReflectionSettingsSwitchEnabled]|| -[BMMomentsEventData hasIsReflectionSettingsSwitchEnabled](self, "hasIsReflectionSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsReflectionSettingsSwitchEnabled")&& (int v85 = -[BMMomentsEventData isReflectionSettingsSwitchEnabled](self, "isReflectionSettingsSwitchEnabled"), v85 == objc_msgSend(v5, "isReflectionSettingsSwitchEnabled")))
                              {
                                if (!-[BMMomentsEventData hasIsBroadSystemLocationSettingsSwitchEnabled](self, "hasIsBroadSystemLocationSettingsSwitchEnabled")&& ![v5 hasIsBroadSystemLocationSettingsSwitchEnabled])
                                {
                                  LOBYTE(v12) = 1;
                                  goto LABEL_132;
                                }
                                if (-[BMMomentsEventData hasIsBroadSystemLocationSettingsSwitchEnabled](self, "hasIsBroadSystemLocationSettingsSwitchEnabled")&& [v5 hasIsBroadSystemLocationSettingsSwitchEnabled])
                                {
                                  BOOL v86 = [(BMMomentsEventData *)self isBroadSystemLocationSettingsSwitchEnabled];
                                  int v12 = v86 ^ [v5 isBroadSystemLocationSettingsSwitchEnabled] ^ 1;
LABEL_132:

                                  goto LABEL_133;
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
        }
      }
    }
LABEL_131:
    LOBYTE(v12) = 0;
    goto LABEL_132;
  }
  LOBYTE(v12) = 0;
LABEL_133:

  return v12;
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
  v106[30] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMomentsEventData *)self event];
  uint64_t v4 = [v3 jsonDictionary];

  id v5 = [(BMMomentsEventData *)self bundle];
  uint64_t v6 = [v5 jsonDictionary];

  if ([(BMMomentsEventData *)self hasIsBundle])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isBundle](self, "isBundle"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  if ([(BMMomentsEventData *)self hasIHAState])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData IHAState](self, "IHAState"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  if ([(BMMomentsEventData *)self hasAge])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventData age](self, "age"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  v104 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventData ageRange](self, "ageRange"));
  v103 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventData biologicalSex](self, "biologicalSex"));
  v10 = [(BMMomentsEventData *)self startDate];
  if (v10)
  {
    int v11 = NSNumber;
    int v12 = [(BMMomentsEventData *)self startDate];
    [v12 timeIntervalSince1970];
    objc_msgSend(v11, "numberWithDouble:");
    id v102 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v102 = 0;
  }

  v13 = [(BMMomentsEventData *)self endDate];
  if (v13)
  {
    uint64_t v14 = NSNumber;
    v15 = [(BMMomentsEventData *)self endDate];
    [v15 timeIntervalSince1970];
    objc_msgSend(v14, "numberWithDouble:");
    id v101 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v101 = 0;
  }

  v100 = [(BMMomentsEventData *)self categoryOfEvent];
  v99 = [(BMMomentsEventData *)self bundleInterface];
  v98 = [(BMMomentsEventData *)self bundleEvergreenType];
  v97 = [(BMMomentsEventData *)self sugSeetEngType];
  v96 = [(BMMomentsEventData *)self appEntryEngType];
  v95 = [(BMMomentsEventData *)self megaSignalTypeUsed];
  if ([(BMMomentsEventData *)self hasViewVisibleSuggestionsCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventData viewVisibleSuggestionsCount](self, "viewVisibleSuggestionsCount"));
    id v94 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v94 = 0;
  }
  if ([(BMMomentsEventData *)self hasViewTotalSuggestionsCount])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventData viewTotalSuggestionsCount](self, "viewTotalSuggestionsCount"));
    id v93 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v93 = 0;
  }
  v92 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventData onboardingFlowCompletionState](self, "onboardingFlowCompletionState"));
  if ([(BMMomentsEventData *)self hasIsJournalAppInstalled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isJournalAppInstalled](self, "isJournalAppInstalled"));
    id v91 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v91 = 0;
  }
  if ([(BMMomentsEventData *)self hasIsJournalAppLocked])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isJournalAppLocked](self, "isJournalAppLocked"));
    id v90 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v90 = 0;
  }
  if ([(BMMomentsEventData *)self hasIsJournalSuggestionSkipped])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isJournalSuggestionSkipped](self, "isJournalSuggestionSkipped"));
    id v89 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v89 = 0;
  }
  if ([(BMMomentsEventData *)self hasIsActivitySettingsSwitchEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isActivitySettingsSwitchEnabled](self, "isActivitySettingsSwitchEnabled"));
    id v88 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v88 = 0;
  }
  if ([(BMMomentsEventData *)self hasIsCommunicationSettingsSwitchEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isCommunicationSettingsSwitchEnabled](self, "isCommunicationSettingsSwitchEnabled"));
    id v87 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v87 = 0;
  }
  if ([(BMMomentsEventData *)self hasIsSignificantLocationSettingsSwitchEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isSignificantLocationSettingsSwitchEnabled](self, "isSignificantLocationSettingsSwitchEnabled"));
    id v86 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v86 = 0;
  }
  if ([(BMMomentsEventData *)self hasIsMediaSettingsSwitchEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isMediaSettingsSwitchEnabled](self, "isMediaSettingsSwitchEnabled"));
    id v85 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v85 = 0;
  }
  if ([(BMMomentsEventData *)self hasIsNearbyPeopleSettingsSwitchEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isNearbyPeopleSettingsSwitchEnabled](self, "isNearbyPeopleSettingsSwitchEnabled"));
    id v84 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v84 = 0;
  }
  if ([(BMMomentsEventData *)self hasIsPhotoSettingsSwitchEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isPhotoSettingsSwitchEnabled](self, "isPhotoSettingsSwitchEnabled"));
    id v83 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v83 = 0;
  }
  if ([(BMMomentsEventData *)self hasIsStateOfMindSettingsSwitchEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isStateOfMindSettingsSwitchEnabled](self, "isStateOfMindSettingsSwitchEnabled"));
    id v82 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v82 = 0;
  }
  if ([(BMMomentsEventData *)self hasIsReflectionSettingsSwitchEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isReflectionSettingsSwitchEnabled](self, "isReflectionSettingsSwitchEnabled"));
    id v81 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v81 = 0;
  }
  if ([(BMMomentsEventData *)self hasIsBroadSystemLocationSettingsSwitchEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isBroadSystemLocationSettingsSwitchEnabled](self, "isBroadSystemLocationSettingsSwitchEnabled"));
    id v80 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v80 = 0;
  }
  v105[0] = @"event";
  uint64_t v16 = v4;
  if (!v4)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  int v71 = (void *)v16;
  v106[0] = v16;
  v105[1] = @"bundle";
  uint64_t v17 = v6;
  if (!v6)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v70 = (void *)v17;
  v106[1] = v17;
  v105[2] = @"isBundle";
  uint64_t v18 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v69 = (void *)v18;
  v106[2] = v18;
  v105[3] = @"IHAState";
  uint64_t v19 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v68 = (void *)v19;
  v106[3] = v19;
  v105[4] = @"age";
  uint64_t v20 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  int v21 = v9;
  uint64_t v67 = (void *)v20;
  v106[4] = v20;
  v105[5] = @"ageRange";
  uint64_t v22 = (uint64_t)v104;
  if (!v104)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  id v23 = v8;
  v106[5] = v22;
  v105[6] = @"biologicalSex";
  uint64_t v24 = (uint64_t)v103;
  if (!v103)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v25 = (void *)v6;
  v106[6] = v24;
  v105[7] = @"startDate";
  uint64_t v26 = (uint64_t)v102;
  if (!v102)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v106[7] = v26;
  v105[8] = @"endDate";
  uint64_t v27 = (uint64_t)v101;
  if (!v101)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v106[8] = v27;
  v105[9] = @"categoryOfEvent";
  uint64_t v28 = (uint64_t)v100;
  if (!v100)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  int v75 = (void *)v28;
  v106[9] = v28;
  v105[10] = @"bundleInterface";
  uint64_t v29 = (uint64_t)v99;
  if (!v99)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v63 = (void *)v29;
  v106[10] = v29;
  v105[11] = @"bundleEvergreenType";
  uint64_t v30 = (uint64_t)v98;
  if (!v98)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  int v74 = (void *)v30;
  v106[11] = v30;
  v105[12] = @"sugSeetEngType";
  uint64_t v31 = (uint64_t)v97;
  if (!v97)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  int v73 = (void *)v31;
  v106[12] = v31;
  v105[13] = @"appEntryEngType";
  uint64_t v32 = (uint64_t)v96;
  if (!v96)
  {
    uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v32;
  v106[13] = v32;
  v105[14] = @"megaSignalTypeUsed";
  uint64_t v34 = (uint64_t)v95;
  if (!v95)
  {
    uint64_t v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v62 = (void *)v34;
  v106[14] = v34;
  v105[15] = @"viewVisibleSuggestionsCount";
  uint64_t v35 = (uint64_t)v94;
  if (!v94)
  {
    uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v61 = (void *)v35;
  v106[15] = v35;
  v105[16] = @"viewTotalSuggestionsCount";
  uint64_t v36 = (uint64_t)v93;
  if (!v93)
  {
    uint64_t v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v60 = (void *)v36;
  v106[16] = v36;
  v105[17] = @"onboardingFlowCompletionState";
  uint64_t v37 = (uint64_t)v92;
  if (!v92)
  {
    uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
  }
  int v59 = (void *)v37;
  v106[17] = v37;
  v105[18] = @"isJournalAppInstalled";
  uint64_t v38 = (uint64_t)v91;
  if (!v91)
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
  }
  int v79 = (void *)v4;
  v58 = (void *)v38;
  v106[18] = v38;
  v105[19] = @"isJournalAppLocked";
  uint64_t v39 = (uint64_t)v90;
  if (!v90)
  {
    uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v57 = (void *)v39;
  v106[19] = v39;
  v105[20] = @"isJournalSuggestionSkipped";
  uint64_t v40 = (uint64_t)v89;
  if (!v89)
  {
    uint64_t v40 = [MEMORY[0x1E4F1CA98] null];
  }
  int v78 = v7;
  v56 = (void *)v40;
  v106[20] = v40;
  v105[21] = @"isActivitySettingsSwitchEnabled";
  uint64_t v41 = (uint64_t)v88;
  if (!v88)
  {
    uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
  }
  v66 = (void *)v22;
  uint64_t v55 = (void *)v41;
  v106[21] = v41;
  v105[22] = @"isCommunicationSettingsSwitchEnabled";
  uint64_t v42 = (uint64_t)v87;
  if (!v87)
  {
    uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
  }
  int v65 = (void *)v24;
  uint64_t v53 = v42;
  v106[22] = v42;
  v105[23] = @"isSignificantLocationSettingsSwitchEnabled";
  uint64_t v43 = v86;
  if (!v86)
  {
    uint64_t v43 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v42, v55, v56, v57, v58, v59, v60, v61, v62, v63);
  }
  int v76 = (void *)v27;
  int v77 = v25;
  v106[23] = v43;
  v105[24] = @"isMediaSettingsSwitchEnabled";
  v44 = v85;
  if (!v85)
  {
    v44 = [MEMORY[0x1E4F1CA98] null];
  }
  v106[24] = v44;
  v105[25] = @"isNearbyPeopleSettingsSwitchEnabled";
  v45 = v84;
  v46 = v23;
  if (!v84)
  {
    v45 = [MEMORY[0x1E4F1CA98] null];
  }
  v64 = (void *)v26;
  v106[25] = v45;
  v105[26] = @"isPhotoSettingsSwitchEnabled";
  int v47 = v83;
  if (!v83)
  {
    int v47 = [MEMORY[0x1E4F1CA98] null];
  }
  v106[26] = v47;
  v105[27] = @"isStateOfMindSettingsSwitchEnabled";
  v48 = v82;
  if (!v82)
  {
    v48 = [MEMORY[0x1E4F1CA98] null];
  }
  v106[27] = v48;
  v105[28] = @"isReflectionSettingsSwitchEnabled";
  uint64_t v49 = v81;
  if (!v81)
  {
    uint64_t v49 = [MEMORY[0x1E4F1CA98] null];
  }
  v106[28] = v49;
  v105[29] = @"isBroadSystemLocationSettingsSwitchEnabled";
  v50 = v80;
  if (!v80)
  {
    v50 = [MEMORY[0x1E4F1CA98] null];
  }
  v106[29] = v50;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v106, v105, 30, v53);
  id v72 = (id)objc_claimAutoreleasedReturnValue();
  if (!v80) {

  }
  v51 = v33;
  if (!v81)
  {

    v51 = v33;
  }
  if (!v82)
  {

    v51 = v33;
  }
  if (!v83)
  {

    v51 = v33;
  }
  if (!v84)
  {

    v51 = v33;
  }
  if (!v85)
  {

    v51 = v33;
  }
  if (!v86)
  {

    v51 = v33;
  }
  if (!v87)
  {

    v51 = v33;
  }
  if (!v88)
  {

    v51 = v33;
  }
  if (!v89)
  {

    v51 = v33;
  }
  if (!v90)
  {

    v51 = v33;
  }
  if (!v91)
  {

    v51 = v33;
  }
  if (!v92)
  {

    v51 = v33;
  }
  if (!v93)
  {

    v51 = v33;
  }
  if (!v94)
  {

    v51 = v33;
  }
  if (!v95)
  {

    v51 = v33;
  }
  if (!v96) {

  }
  if (!v97) {
  if (!v98)
  }

  if (!v99) {
  if (!v100)
  }

  if (!v101) {
  if (!v102)
  }

  if (!v103) {
  if (v104)
  }
  {
    if (v21) {
      goto LABEL_168;
    }
  }
  else
  {

    if (v21)
    {
LABEL_168:
      if (v46) {
        goto LABEL_169;
      }
      goto LABEL_177;
    }
  }

  if (v46)
  {
LABEL_169:
    if (v78) {
      goto LABEL_170;
    }
    goto LABEL_178;
  }
LABEL_177:

  if (v78)
  {
LABEL_170:
    if (v77) {
      goto LABEL_171;
    }
LABEL_179:

    if (v79) {
      goto LABEL_172;
    }
    goto LABEL_180;
  }
LABEL_178:

  if (!v77) {
    goto LABEL_179;
  }
LABEL_171:
  if (v79) {
    goto LABEL_172;
  }
LABEL_180:

LABEL_172:

  return v72;
}

- (BMMomentsEventData)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v368[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v306 = [v6 objectForKeyedSubscript:@"event"];
  if (!v306 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v308 = 0;
    id v305 = v306;
    id v7 = [[BMMomentsEventDataEvent alloc] initWithJSONDictionary:v305 error:&v308];
    id v12 = v308;
    if (v12)
    {
      v13 = v12;
      if (a4) {
        *a4 = v12;
      }

LABEL_39:
      uint64_t v16 = 0;
      goto LABEL_242;
    }

LABEL_4:
    id v305 = [v6 objectForKeyedSubscript:@"bundle"];
    if (!v305 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v301 = v7;
      v302 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v305;
      id v307 = 0;
      v302 = [[BMMomentsEventDataEventBundle alloc] initWithJSONDictionary:v8 error:&v307];
      id v14 = v307;
      if (v14)
      {
        v15 = v14;
        if (a4) {
          *a4 = v14;
        }

        uint64_t v16 = 0;
        goto LABEL_241;
      }
      v301 = v7;

LABEL_7:
      v304 = [v6 objectForKeyedSubscript:@"isBundle"];
      v299 = self;
      if (v304 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v8 = 0;
            uint64_t v16 = 0;
LABEL_240:

            id v7 = v301;
            goto LABEL_241;
          }
          id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v31 = *MEMORY[0x1E4F502C8];
          uint64_t v363 = *MEMORY[0x1E4F28568];
          uint64_t v32 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isBundle"];
          v364 = v32;
          v303 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v364 forKeys:&v363 count:1];
          id v8 = 0;
          uint64_t v16 = 0;
          *a4 = (id)[v30 initWithDomain:v31 code:2 userInfo:v303];
          goto LABEL_239;
        }
        id v8 = v304;
      }
      else
      {
        id v8 = 0;
      }
      [v6 objectForKeyedSubscript:@"IHAState"];
      v303 = id v300 = v8;
      if (!v303 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v297 = 0;
        goto LABEL_13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v297 = v303;
LABEL_13:
        id v9 = [v6 objectForKeyedSubscript:@"age"];
        v298 = v9;
        if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v292 = a4;
          id v293 = 0;
LABEL_16:
          uint64_t v10 = [v6 objectForKeyedSubscript:@"ageRange"];
          v296 = (void *)v10;
          if (v10 && (int v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v294 = v11;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v292)
                {
                  id v294 = 0;
                  uint64_t v16 = 0;
                  uint64_t v32 = v297;
                  uint64_t v37 = v293;
                  goto LABEL_237;
                }
                id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v89 = *MEMORY[0x1E4F502C8];
                uint64_t v357 = *MEMORY[0x1E4F28568];
                id v291 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"ageRange"];
                id v358 = v291;
                v290 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v358 forKeys:&v357 count:1];
                id v294 = 0;
                uint64_t v16 = 0;
                id *v292 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 2);
                goto LABEL_250;
              }
              id v43 = v11;
              id v294 = [NSNumber numberWithInt:BMMomentsEventDataAgeRangeTypeFromString(v43)];
            }
          }
          else
          {
            id v294 = 0;
          }
          uint64_t v44 = [v6 objectForKeyedSubscript:@"biologicalSex"];
          v290 = (void *)v44;
          if (!v44 || (v45 = (void *)v44, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v291 = 0;
            goto LABEL_61;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v291 = v45;
LABEL_60:

LABEL_61:
            int v47 = [v6 objectForKeyedSubscript:@"startDate"];
            v289 = v47;
            if (!v47 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v288 = 0;
              goto LABEL_64;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v55 = v47;
              id v56 = objc_alloc(MEMORY[0x1E4F1C9C8]);
              [v55 doubleValue];
              id v288 = (id)objc_msgSend(v56, "initWithTimeIntervalSince1970:");

              goto LABEL_64;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v64 = objc_alloc_init(MEMORY[0x1E4F28D48]);
              id v65 = v47;
              id v288 = [v64 dateFromString:v65];

              goto LABEL_64;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v288 = v47;
LABEL_64:
              uint64_t v48 = [v6 objectForKeyedSubscript:@"endDate"];
              v286 = (void *)v48;
              if (!v48 || (uint64_t v49 = (void *)v48, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v50 = 0;
                goto LABEL_67;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v57 = v49;
                id v58 = objc_alloc(MEMORY[0x1E4F1C9C8]);
                [v57 doubleValue];
                id v50 = (id)objc_msgSend(v58, "initWithTimeIntervalSince1970:");

                goto LABEL_67;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v66 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                id v67 = v49;
                id v50 = [v66 dateFromString:v67];

                goto LABEL_67;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v50 = v49;
LABEL_67:
                uint64_t v51 = [v6 objectForKeyedSubscript:@"categoryOfEvent"];
                v285 = (void *)v51;
                v287 = v50;
                if (!v51 || (v52 = (void *)v51, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v53 = 0;
LABEL_70:
                  v295 = [v6 objectForKeyedSubscript:@"bundleInterface"];
                  if (!v295)
                  {
                    id v283 = 0;
                    v54 = v53;
                    goto LABEL_82;
                  }
                  objc_opt_class();
                  v54 = v53;
                  if (objc_opt_isKindOfClass())
                  {
                    id v283 = 0;
                    goto LABEL_82;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v283 = v295;
LABEL_82:
                    uint64_t v59 = [v6 objectForKeyedSubscript:@"bundleEvergreenType"];
                    v282 = (void *)v59;
                    if (!v59 || (v60 = (void *)v59, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v61 = 0;
                      goto LABEL_85;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v61 = v60;
LABEL_85:
                      v284 = [v6 objectForKeyedSubscript:@"sugSeetEngType"];
                      v281 = v61;
                      if (!v284 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v62 = v54;
                        id v280 = 0;
                        goto LABEL_88;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v62 = v54;
                        id v280 = v284;
LABEL_88:
                        id v63 = [v6 objectForKeyedSubscript:@"appEntryEngType"];
                        v279 = v63;
                        if (v63)
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v63 = 0;
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              if (!v292)
                              {
                                id v72 = 0;
                                uint64_t v16 = 0;
                                uint64_t v32 = v297;
                                uint64_t v37 = v293;
                                v54 = v62;
                                goto LABEL_229;
                              }
                              id v95 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v96 = *MEMORY[0x1E4F502C8];
                              uint64_t v341 = *MEMORY[0x1E4F28568];
                              id v71 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"appEntryEngType"];
                              id v342 = v71;
                              v278 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v342 forKeys:&v341 count:1];
                              id v97 = (id)objc_msgSend(v95, "initWithDomain:code:userInfo:", v96, 2);
                              id v72 = 0;
                              uint64_t v16 = 0;
                              id *v292 = v97;
                              uint64_t v32 = v297;
                              uint64_t v37 = v293;
                              v54 = v62;
                              goto LABEL_228;
                            }
                            id v63 = v63;
                          }
                        }
                        uint64_t v68 = [v6 objectForKeyedSubscript:@"megaSignalTypeUsed"];
                        v278 = (void *)v68;
                        if (v68)
                        {
                          v69 = (void *)v68;
                          objc_opt_class();
                          v70 = v69;
                          v54 = v62;
                          if (objc_opt_isKindOfClass())
                          {
                            id v71 = 0;
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              if (!v292)
                              {
                                id v71 = 0;
                                uint64_t v16 = 0;
                                uint64_t v32 = v297;
                                uint64_t v37 = v293;
                                id v72 = v63;
                                goto LABEL_228;
                              }
                              id v98 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v99 = *MEMORY[0x1E4F502C8];
                              uint64_t v339 = *MEMORY[0x1E4F28568];
                              id v277 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"megaSignalTypeUsed"];
                              id v340 = v277;
                              uint64_t v100 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v340 forKeys:&v339 count:1];
                              id v101 = v98;
                              int v75 = (void *)v100;
                              id v71 = 0;
                              uint64_t v16 = 0;
                              id *v292 = (id)[v101 initWithDomain:v99 code:2 userInfo:v100];
                              uint64_t v32 = v297;
                              uint64_t v37 = v293;
                              id v72 = v63;
LABEL_227:

LABEL_228:
                              int v47 = v289;
                              goto LABEL_229;
                            }
                            id v71 = v70;
                          }
                          id v72 = v63;
                        }
                        else
                        {
                          id v71 = 0;
                          id v72 = v63;
                          v54 = v62;
                        }
                        int v75 = [v6 objectForKeyedSubscript:@"viewVisibleSuggestionsCount"];
                        v275 = v72;
                        if (v75)
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v272 = v54;
                            int v76 = v72;
                            id v77 = v71;
                            id v277 = 0;
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              if (!v292)
                              {
                                id v277 = 0;
                                uint64_t v16 = 0;
                                uint64_t v32 = v297;
                                uint64_t v37 = v293;
                                goto LABEL_227;
                              }
                              id v102 = v71;
                              id v103 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v104 = *MEMORY[0x1E4F502C8];
                              uint64_t v337 = *MEMORY[0x1E4F28568];
                              id v105 = [NSString alloc];
                              uint64_t v231 = objc_opt_class();
                              v106 = v105;
                              id v9 = v298;
                              id v82 = (id)[v106 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v231, @"viewVisibleSuggestionsCount"];
                              id v338 = v82;
                              uint64_t v107 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v338 forKeys:&v337 count:1];
                              v108 = v103;
                              id v71 = v102;
                              id v72 = v275;
                              v276 = (void *)v107;
                              id v277 = 0;
                              uint64_t v16 = 0;
                              id *v292 = (id)objc_msgSend(v108, "initWithDomain:code:userInfo:", v104, 2);
                              uint64_t v32 = v297;
                              uint64_t v37 = v293;
                              goto LABEL_226;
                            }
                            v272 = v54;
                            int v76 = v72;
                            id v77 = v71;
                            id v277 = v75;
                          }
                        }
                        else
                        {
                          v272 = v54;
                          int v76 = v72;
                          id v277 = 0;
                          id v77 = v71;
                        }
                        uint64_t v80 = [v6 objectForKeyedSubscript:@"viewTotalSuggestionsCount"];
                        v276 = (void *)v80;
                        v274 = v77;
                        if (v80 && (id v81 = (void *)v80, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            if (!v292)
                            {
                              id v82 = 0;
                              uint64_t v16 = 0;
                              uint64_t v32 = v297;
                              uint64_t v37 = v293;
                              id v71 = v77;
                              id v72 = v76;
                              v54 = v272;
                              goto LABEL_226;
                            }
                            v109 = v75;
                            id v110 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v111 = *MEMORY[0x1E4F502C8];
                            uint64_t v335 = *MEMORY[0x1E4F28568];
                            id v112 = [NSString alloc];
                            uint64_t v232 = objc_opt_class();
                            v113 = v112;
                            id v9 = v298;
                            uint64_t v114 = [v113 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v232, @"viewTotalSuggestionsCount"];
                            uint64_t v336 = v114;
                            uint64_t v115 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v336 forKeys:&v335 count:1];
                            v116 = v110;
                            int v75 = v109;
                            v117 = (void *)v114;
                            id v72 = v275;
                            v270 = (void *)v115;
                            id v82 = 0;
                            uint64_t v16 = 0;
                            id *v292 = (id)objc_msgSend(v116, "initWithDomain:code:userInfo:", v111, 2);
                            uint64_t v32 = v297;
                            uint64_t v37 = v293;
                            v54 = v272;
LABEL_225:

                            id v71 = v274;
LABEL_226:

                            goto LABEL_227;
                          }
                          id v82 = v81;
                        }
                        else
                        {
                          id v82 = 0;
                        }
                        uint64_t v83 = [v6 objectForKeyedSubscript:@"onboardingFlowCompletionState"];
                        v270 = (void *)v83;
                        v271 = v75;
                        id v269 = v82;
                        if (v83 && (id v84 = (void *)v83, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v85 = v84;
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              if (!v292)
                              {
                                v117 = 0;
                                uint64_t v16 = 0;
                                uint64_t v32 = v297;
                                uint64_t v37 = v293;
                                v54 = v272;
                                id v72 = v275;
                                goto LABEL_225;
                              }
                              id v179 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v180 = *MEMORY[0x1E4F502C8];
                              uint64_t v333 = *MEMORY[0x1E4F28568];
                              id v268 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"onboardingFlowCompletionState"];
                              id v334 = v268;
                              v267 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v334 forKeys:&v333 count:1];
                              v117 = 0;
                              uint64_t v16 = 0;
                              id *v292 = (id)objc_msgSend(v179, "initWithDomain:code:userInfo:", v180, 2);
                              uint64_t v32 = v297;
                              uint64_t v37 = v293;
                              int v75 = v271;
                              v54 = v272;
                              id v72 = v275;
                              goto LABEL_224;
                            }
                            id v122 = v84;
                            id v85 = [NSNumber numberWithInt:BMMomentsEventDataOnboardingFlowCompletionFromString(v122)];
                          }
                          int v76 = v275;
                        }
                        else
                        {
                          id v85 = 0;
                        }
                        uint64_t v123 = [v6 objectForKeyedSubscript:@"isJournalAppInstalled"];
                        v267 = (void *)v123;
                        if (v123 && (v124 = (void *)v123, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            if (!v292)
                            {
                              id v268 = 0;
                              uint64_t v16 = 0;
                              uint64_t v32 = v297;
                              uint64_t v37 = v293;
                              id v72 = v76;
                              v117 = v85;
                              int v75 = v271;
                              v54 = v272;
                              goto LABEL_224;
                            }
                            v117 = v85;
                            id v155 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v156 = *MEMORY[0x1E4F502C8];
                            uint64_t v331 = *MEMORY[0x1E4F28568];
                            id v157 = [NSString alloc];
                            uint64_t v233 = objc_opt_class();
                            v158 = v157;
                            id v9 = v298;
                            id v266 = (id)[v158 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v233, @"isJournalAppInstalled"];
                            id v332 = v266;
                            uint64_t v159 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v332 forKeys:&v331 count:1];
                            v160 = v155;
                            int v75 = v271;
                            id v72 = v275;
                            v265 = (void *)v159;
                            uint64_t v16 = 0;
                            id v268 = 0;
                            id *v292 = (id)objc_msgSend(v160, "initWithDomain:code:userInfo:", v156, 2);
                            uint64_t v32 = v297;
                            uint64_t v37 = v293;
                            v54 = v272;
LABEL_223:

LABEL_224:
                            goto LABEL_225;
                          }
                          id v268 = v124;
                        }
                        else
                        {
                          id v268 = 0;
                        }
                        uint64_t v125 = [v6 objectForKeyedSubscript:@"isJournalAppLocked"];
                        v265 = (void *)v125;
                        if (v125 && (v126 = (void *)v125, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            if (!v292)
                            {
                              id v266 = 0;
                              uint64_t v16 = 0;
                              uint64_t v32 = v297;
                              uint64_t v37 = v293;
                              id v72 = v76;
                              v117 = v85;
                              int v75 = v271;
                              v54 = v272;
                              goto LABEL_223;
                            }
                            v117 = v85;
                            id v161 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v162 = *MEMORY[0x1E4F502C8];
                            uint64_t v329 = *MEMORY[0x1E4F28568];
                            id v163 = [NSString alloc];
                            uint64_t v234 = objc_opt_class();
                            v164 = v163;
                            id v9 = v298;
                            v264 = (void *)[v164 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v234, @"isJournalAppLocked"];
                            v330 = v264;
                            uint64_t v165 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v330 forKeys:&v329 count:1];
                            v166 = v161;
                            int v75 = v271;
                            id v72 = v275;
                            v263 = (void *)v165;
                            uint64_t v16 = 0;
                            id v266 = 0;
                            id *v292 = (id)objc_msgSend(v166, "initWithDomain:code:userInfo:", v162, 2);
                            uint64_t v32 = v297;
                            uint64_t v37 = v293;
                            v54 = v272;
                            goto LABEL_222;
                          }
                          id v266 = v126;
                        }
                        else
                        {
                          id v266 = 0;
                        }
                        uint64_t v127 = [v6 objectForKeyedSubscript:@"isJournalSuggestionSkipped"];
                        v263 = (void *)v127;
                        if (v127 && (v128 = (void *)v127, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            if (!v292)
                            {
                              v264 = 0;
                              uint64_t v16 = 0;
                              uint64_t v32 = v297;
                              uint64_t v37 = v293;
                              id v72 = v76;
                              v117 = v85;
                              int v75 = v271;
                              v54 = v272;
                              goto LABEL_222;
                            }
                            v117 = v85;
                            id v167 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v168 = *MEMORY[0x1E4F502C8];
                            uint64_t v327 = *MEMORY[0x1E4F28568];
                            id v169 = [NSString alloc];
                            uint64_t v235 = objc_opt_class();
                            v170 = v169;
                            id v9 = v298;
                            id v262 = (id)[v170 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v235, @"isJournalSuggestionSkipped"];
                            id v328 = v262;
                            uint64_t v171 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v328 forKeys:&v327 count:1];
                            v172 = v167;
                            int v75 = v271;
                            id v72 = v275;
                            v261 = (void *)v171;
                            uint64_t v16 = 0;
                            v264 = 0;
                            id *v292 = (id)objc_msgSend(v172, "initWithDomain:code:userInfo:", v168, 2);
                            uint64_t v32 = v297;
                            uint64_t v37 = v293;
                            v54 = v272;
LABEL_221:

LABEL_222:
                            id v82 = v269;
                            goto LABEL_223;
                          }
                          id v129 = v128;
                        }
                        else
                        {
                          id v129 = 0;
                        }
                        uint64_t v130 = [v6 objectForKeyedSubscript:@"isActivitySettingsSwitchEnabled"];
                        v261 = (void *)v130;
                        v264 = v129;
                        if (v130)
                        {
                          v131 = (void *)v130;
                          objc_opt_class();
                          id v72 = v76;
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            objc_opt_class();
                            v54 = v272;
                            if ((objc_opt_isKindOfClass() & 1) == 0)
                            {
                              if (!v292)
                              {
                                id v262 = 0;
                                uint64_t v16 = 0;
                                uint64_t v32 = v297;
                                uint64_t v37 = v293;
                                v117 = v85;
                                int v75 = v271;
                                goto LABEL_221;
                              }
                              v117 = v85;
                              id v173 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v174 = *MEMORY[0x1E4F502C8];
                              uint64_t v325 = *MEMORY[0x1E4F28568];
                              id v175 = [NSString alloc];
                              uint64_t v236 = objc_opt_class();
                              v176 = v175;
                              id v9 = v298;
                              id v260 = (id)[v176 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v236, @"isActivitySettingsSwitchEnabled"];
                              id v326 = v260;
                              uint64_t v177 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v326 forKeys:&v325 count:1];
                              v178 = v173;
                              int v75 = v271;
                              id v72 = v275;
                              v259 = (void *)v177;
                              uint64_t v16 = 0;
                              id v262 = 0;
                              id *v292 = (id)objc_msgSend(v178, "initWithDomain:code:userInfo:", v174, 2);
                              goto LABEL_299;
                            }
                            id v262 = v131;
LABEL_181:
                            uint64_t v132 = [v6 objectForKeyedSubscript:@"isCommunicationSettingsSwitchEnabled"];
                            v117 = v85;
                            v259 = (void *)v132;
                            if (!v132)
                            {
                              id v260 = 0;
                              int v75 = v271;
                              goto LABEL_191;
                            }
                            v133 = (void *)v132;
                            objc_opt_class();
                            int v75 = v271;
                            if (objc_opt_isKindOfClass())
                            {
                              id v260 = 0;
                              goto LABEL_191;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v260 = v133;
LABEL_191:
                              uint64_t v134 = [v6 objectForKeyedSubscript:@"isSignificantLocationSettingsSwitchEnabled"];
                              v258 = (void *)v134;
                              if (!v134 || (v135 = (void *)v134, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v273 = 0;
                                goto LABEL_194;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v273 = v135;
LABEL_194:
                                uint64_t v136 = [v6 objectForKeyedSubscript:@"isMediaSettingsSwitchEnabled"];
                                v255 = (void *)v136;
                                if (!v136
                                  || (v137 = (void *)v136, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  id v256 = 0;
                                  goto LABEL_197;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v256 = v137;
LABEL_197:
                                  uint64_t v138 = [v6 objectForKeyedSubscript:@"isNearbyPeopleSettingsSwitchEnabled"];
                                  v254 = (void *)v138;
                                  if (!v138
                                    || (v139 = (void *)v138, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v257 = 0;
LABEL_200:
                                    uint64_t v140 = [v6 objectForKeyedSubscript:@"isPhotoSettingsSwitchEnabled"];
                                    v251 = (void *)v140;
                                    if (v140
                                      && (v141 = (void *)v140, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                    {
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) == 0)
                                      {
                                        if (!v292)
                                        {
                                          id v253 = 0;
                                          uint64_t v16 = 0;
                                          uint64_t v32 = v297;
                                          uint64_t v37 = v293;
                                          v153 = v257;
                                          goto LABEL_216;
                                        }
                                        id v205 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v206 = *MEMORY[0x1E4F502C8];
                                        uint64_t v315 = *MEMORY[0x1E4F28568];
                                        id v207 = [NSString alloc];
                                        uint64_t v241 = objc_opt_class();
                                        v208 = v207;
                                        id v9 = v298;
                                        id v252 = (id)[v208 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v241, @"isPhotoSettingsSwitchEnabled"];
                                        id v316 = v252;
                                        uint64_t v209 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v316 forKeys:&v315 count:1];
                                        v210 = v205;
                                        int v75 = v271;
                                        id v72 = v275;
                                        v249 = (void *)v209;
                                        uint64_t v16 = 0;
                                        id v253 = 0;
                                        id *v292 = (id)objc_msgSend(v210, "initWithDomain:code:userInfo:", v206, 2);
                                        goto LABEL_313;
                                      }
                                      id v253 = v141;
                                    }
                                    else
                                    {
                                      id v253 = 0;
                                    }
                                    uint64_t v142 = [v6 objectForKeyedSubscript:@"isStateOfMindSettingsSwitchEnabled"];
                                    v249 = (void *)v142;
                                    if (!v142
                                      || (v143 = (void *)v142, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      id v252 = 0;
                                      goto LABEL_206;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v252 = v143;
LABEL_206:
                                      uint64_t v144 = [v6 objectForKeyedSubscript:@"isReflectionSettingsSwitchEnabled"];
                                      v248 = (void *)v144;
                                      if (!v144
                                        || (v145 = (void *)v144, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        id v250 = 0;
                                        goto LABEL_209;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v250 = v145;
LABEL_209:
                                        uint64_t v146 = [v6 objectForKeyedSubscript:@"isBroadSystemLocationSettingsSwitchEnabled"];
                                        v247 = (void *)v146;
                                        if (v146
                                          && (v147 = (void *)v146, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                        {
                                          objc_opt_class();
                                          uint64_t v37 = v293;
                                          if ((objc_opt_isKindOfClass() & 1) == 0)
                                          {
                                            if (v292)
                                            {
                                              id v223 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v224 = *MEMORY[0x1E4F502C8];
                                              uint64_t v309 = *MEMORY[0x1E4F28568];
                                              v225 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isBroadSystemLocationSettingsSwitchEnabled"];
                                              v310 = v225;
                                              v226 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v310 forKeys:&v309 count:1];
                                              v227 = v223;
                                              int v75 = v271;
                                              id v72 = v275;
                                              uint64_t v228 = v224;
                                              uint64_t v37 = v293;
                                              id *v292 = (id)[v227 initWithDomain:v228 code:2 userInfo:v226];

                                              id v9 = v298;
                                            }
                                            v152 = 0;
                                            uint64_t v16 = 0;
                                            uint64_t v32 = v297;
                                            goto LABEL_213;
                                          }
                                          v148 = v274;
                                          id v149 = v147;
                                        }
                                        else
                                        {
                                          v148 = v274;
                                          id v149 = 0;
                                          uint64_t v37 = v293;
                                        }
                                        uint64_t v150 = [v294 intValue];
                                        int v151 = [v291 intValue];
                                        v152 = v149;
                                        id v246 = v149;
                                        LODWORD(v245) = [v117 intValue];
                                        v244 = v148;
                                        id v72 = v275;
                                        LODWORD(v229) = v151;
                                        uint64_t v32 = v297;
                                        uint64_t v16 = objc_retain(-[BMMomentsEventData initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:](v299, "initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:", v301, v302, v300, v297, v37, v150, v229,
                                                  v288,
                                                  v287,
                                                  v54,
                                                  v283,
                                                  v281,
                                                  v280,
                                                  v275,
                                                  v244,
                                                  v277,
                                                  v269,
                                                  v245,
                                                  v268,
                                                  v266,
                                                  v264,
                                                  v262,
                                                  v260,
                                                  v273,
                                                  v256,
                                                  v257,
                                                  v253,
                                                  v252,
                                                  v250,
                                                  v246));
                                        v299 = v16;
                                        int v75 = v271;
LABEL_213:

LABEL_214:
                                        v153 = v257;

LABEL_215:
LABEL_216:

LABEL_217:
LABEL_218:

LABEL_219:
LABEL_220:

                                        goto LABEL_221;
                                      }
                                      if (v292)
                                      {
                                        id v217 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v218 = *MEMORY[0x1E4F502C8];
                                        uint64_t v311 = *MEMORY[0x1E4F28568];
                                        id v219 = [NSString alloc];
                                        uint64_t v243 = objc_opt_class();
                                        v220 = v219;
                                        id v9 = v298;
                                        v152 = (void *)[v220 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v243, @"isReflectionSettingsSwitchEnabled"];
                                        v312 = v152;
                                        uint64_t v221 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v312 forKeys:&v311 count:1];
                                        v222 = v217;
                                        int v75 = v271;
                                        id v72 = v275;
                                        v247 = (void *)v221;
                                        uint64_t v16 = 0;
                                        id v250 = 0;
                                        id *v292 = (id)objc_msgSend(v222, "initWithDomain:code:userInfo:", v218, 2);
                                        uint64_t v32 = v297;
                                        uint64_t v37 = v293;
                                        goto LABEL_213;
                                      }
                                      id v250 = 0;
                                      uint64_t v16 = 0;
LABEL_315:
                                      uint64_t v32 = v297;
                                      uint64_t v37 = v293;
                                      goto LABEL_214;
                                    }
                                    if (v292)
                                    {
                                      id v211 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v212 = *MEMORY[0x1E4F502C8];
                                      uint64_t v313 = *MEMORY[0x1E4F28568];
                                      id v213 = [NSString alloc];
                                      uint64_t v242 = objc_opt_class();
                                      v214 = v213;
                                      id v9 = v298;
                                      id v250 = (id)[v214 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v242, @"isStateOfMindSettingsSwitchEnabled"];
                                      id v314 = v250;
                                      uint64_t v215 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v314 forKeys:&v313 count:1];
                                      v216 = v211;
                                      int v75 = v271;
                                      id v72 = v275;
                                      v248 = (void *)v215;
                                      uint64_t v16 = 0;
                                      id v252 = 0;
                                      id *v292 = (id)objc_msgSend(v216, "initWithDomain:code:userInfo:", v212, 2);
                                      goto LABEL_315;
                                    }
                                    id v252 = 0;
                                    uint64_t v16 = 0;
LABEL_313:
                                    uint64_t v32 = v297;
                                    uint64_t v37 = v293;
                                    v153 = v257;
                                    goto LABEL_215;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v257 = v139;
                                    goto LABEL_200;
                                  }
                                  if (v292)
                                  {
                                    id v199 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v200 = *MEMORY[0x1E4F502C8];
                                    uint64_t v317 = *MEMORY[0x1E4F28568];
                                    id v201 = [NSString alloc];
                                    uint64_t v240 = objc_opt_class();
                                    v202 = v201;
                                    id v9 = v298;
                                    id v253 = (id)[v202 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v240, @"isNearbyPeopleSettingsSwitchEnabled"];
                                    id v318 = v253;
                                    uint64_t v203 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v318 forKeys:&v317 count:1];
                                    v204 = v199;
                                    int v75 = v271;
                                    id v72 = v275;
                                    v251 = (void *)v203;
                                    uint64_t v16 = 0;
                                    v153 = 0;
                                    id *v292 = (id)objc_msgSend(v204, "initWithDomain:code:userInfo:", v200, 2);
                                    uint64_t v32 = v297;
                                    uint64_t v37 = v293;
                                    goto LABEL_216;
                                  }
                                  v153 = 0;
                                  uint64_t v16 = 0;
LABEL_310:
                                  uint64_t v32 = v297;
                                  uint64_t v37 = v293;
                                  goto LABEL_217;
                                }
                                if (v292)
                                {
                                  id v193 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  uint64_t v194 = *MEMORY[0x1E4F502C8];
                                  uint64_t v319 = *MEMORY[0x1E4F28568];
                                  id v195 = [NSString alloc];
                                  uint64_t v239 = objc_opt_class();
                                  v196 = v195;
                                  id v9 = v298;
                                  v153 = (void *)[v196 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v239, @"isMediaSettingsSwitchEnabled"];
                                  v320 = v153;
                                  uint64_t v197 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v320 forKeys:&v319 count:1];
                                  v198 = v193;
                                  int v75 = v271;
                                  id v72 = v275;
                                  v254 = (void *)v197;
                                  uint64_t v16 = 0;
                                  id v256 = 0;
                                  id *v292 = (id)objc_msgSend(v198, "initWithDomain:code:userInfo:", v194, 2);
                                  goto LABEL_310;
                                }
                                id v256 = 0;
                                uint64_t v16 = 0;
LABEL_308:
                                uint64_t v32 = v297;
                                uint64_t v37 = v293;
                                goto LABEL_218;
                              }
                              if (v292)
                              {
                                id v187 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v188 = *MEMORY[0x1E4F502C8];
                                uint64_t v321 = *MEMORY[0x1E4F28568];
                                id v189 = [NSString alloc];
                                uint64_t v238 = objc_opt_class();
                                v190 = v189;
                                id v9 = v298;
                                id v256 = (id)[v190 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v238, @"isSignificantLocationSettingsSwitchEnabled"];
                                id v322 = v256;
                                uint64_t v191 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v322 forKeys:&v321 count:1];
                                v192 = v187;
                                int v75 = v271;
                                id v72 = v275;
                                v255 = (void *)v191;
                                uint64_t v16 = 0;
                                id v273 = 0;
                                id *v292 = (id)objc_msgSend(v192, "initWithDomain:code:userInfo:", v188, 2);
                                goto LABEL_308;
                              }
                              id v273 = 0;
                              uint64_t v16 = 0;
LABEL_303:
                              uint64_t v32 = v297;
                              uint64_t v37 = v293;
                              goto LABEL_219;
                            }
                            if (v292)
                            {
                              id v181 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v182 = *MEMORY[0x1E4F502C8];
                              uint64_t v323 = *MEMORY[0x1E4F28568];
                              id v183 = [NSString alloc];
                              uint64_t v237 = objc_opt_class();
                              v184 = v183;
                              id v9 = v298;
                              id v273 = (id)[v184 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v237, @"isCommunicationSettingsSwitchEnabled"];
                              id v324 = v273;
                              uint64_t v185 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v324 forKeys:&v323 count:1];
                              v186 = v181;
                              int v75 = v271;
                              id v72 = v275;
                              v258 = (void *)v185;
                              uint64_t v16 = 0;
                              id v260 = 0;
                              id *v292 = (id)objc_msgSend(v186, "initWithDomain:code:userInfo:", v182, 2);
                              goto LABEL_303;
                            }
                            id v260 = 0;
                            uint64_t v16 = 0;
LABEL_299:
                            uint64_t v32 = v297;
                            uint64_t v37 = v293;
                            goto LABEL_220;
                          }
                          id v262 = 0;
                        }
                        else
                        {
                          id v262 = 0;
                          id v72 = v76;
                        }
                        v54 = v272;
                        goto LABEL_181;
                      }
                      if (v292)
                      {
                        id v90 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v91 = *MEMORY[0x1E4F502C8];
                        uint64_t v343 = *MEMORY[0x1E4F28568];
                        id v72 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sugSeetEngType"];
                        v344 = v72;
                        v279 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v344 forKeys:&v343 count:1];
                        id v280 = 0;
                        uint64_t v16 = 0;
                        id *v292 = (id)objc_msgSend(v90, "initWithDomain:code:userInfo:", v91, 2);
                        uint64_t v32 = v297;
                        uint64_t v37 = v293;
LABEL_229:

LABEL_230:
                        goto LABEL_231;
                      }
                      id v280 = 0;
                      uint64_t v16 = 0;
LABEL_248:
                      uint64_t v32 = v297;
                      uint64_t v37 = v293;
                      goto LABEL_230;
                    }
                    if (v292)
                    {
                      id v86 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v87 = *MEMORY[0x1E4F502C8];
                      uint64_t v345 = *MEMORY[0x1E4F28568];
                      id v280 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleEvergreenType"];
                      id v346 = v280;
                      v284 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v346 forKeys:&v345 count:1];
                      v281 = 0;
                      uint64_t v16 = 0;
                      id *v292 = (id)[v86 initWithDomain:v87 code:2 userInfo:v284];
                      goto LABEL_248;
                    }
                    v281 = 0;
                    uint64_t v16 = 0;
LABEL_157:
                    uint64_t v32 = v297;
                    uint64_t v37 = v293;
LABEL_231:

                    goto LABEL_232;
                  }
                  if (v292)
                  {
                    id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v79 = *MEMORY[0x1E4F502C8];
                    uint64_t v347 = *MEMORY[0x1E4F28568];
                    v281 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleInterface"];
                    v348 = v281;
                    v282 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v348 forKeys:&v347 count:1];
                    id v283 = 0;
                    uint64_t v16 = 0;
                    id *v292 = (id)objc_msgSend(v78, "initWithDomain:code:userInfo:", v79, 2);
                    goto LABEL_157;
                  }
                  id v283 = 0;
                  uint64_t v16 = 0;
                  uint64_t v32 = v297;
                  uint64_t v37 = v293;
LABEL_232:

                  goto LABEL_233;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v53 = v52;
                  goto LABEL_70;
                }
                if (v292)
                {
                  id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v74 = *MEMORY[0x1E4F502C8];
                  uint64_t v349 = *MEMORY[0x1E4F28568];
                  id v283 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"categoryOfEvent"];
                  id v350 = v283;
                  v295 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v350 forKeys:&v349 count:1];
                  uint64_t v16 = 0;
                  id *v292 = (id)[v73 initWithDomain:v74 code:2 userInfo:v295];
                  uint64_t v32 = v297;
                  uint64_t v37 = v293;
                  v54 = 0;
                  goto LABEL_232;
                }
                uint64_t v16 = 0;
                uint64_t v32 = v297;
                uint64_t v37 = v293;
                v54 = 0;
LABEL_233:

                id v8 = v300;
LABEL_234:

LABEL_235:
LABEL_236:

                goto LABEL_237;
              }
              if (v292)
              {
                id v120 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v121 = *MEMORY[0x1E4F502C8];
                uint64_t v351 = *MEMORY[0x1E4F28568];
                v54 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"endDate"];
                v352 = v54;
                v285 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v352 forKeys:&v351 count:1];
                v287 = 0;
                uint64_t v16 = 0;
                id *v292 = (id)objc_msgSend(v120, "initWithDomain:code:userInfo:", v121, 2);
                uint64_t v32 = v297;
                uint64_t v37 = v293;
                goto LABEL_233;
              }
              v287 = 0;
              uint64_t v16 = 0;
LABEL_280:
              uint64_t v32 = v297;
              uint64_t v37 = v293;
              goto LABEL_234;
            }
            if (v292)
            {
              id v118 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v119 = *MEMORY[0x1E4F502C8];
              uint64_t v353 = *MEMORY[0x1E4F28568];
              v287 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"startDate"];
              v354 = v287;
              v286 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v354 forKeys:&v353 count:1];
              id v288 = 0;
              uint64_t v16 = 0;
              id *v292 = (id)objc_msgSend(v118, "initWithDomain:code:userInfo:", v119, 2);
              goto LABEL_280;
            }
            id v288 = 0;
            uint64_t v16 = 0;
LABEL_276:
            uint64_t v32 = v297;
            uint64_t v37 = v293;
            goto LABEL_235;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v46 = v45;
            id v291 = [NSNumber numberWithInt:BMMomentsEventDataBiologicalSexTypeFromString(v46)];

            goto LABEL_60;
          }
          if (v292)
          {
            id v92 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v93 = *MEMORY[0x1E4F502C8];
            uint64_t v355 = *MEMORY[0x1E4F28568];
            id v288 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"biologicalSex"];
            id v356 = v288;
            uint64_t v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v356 forKeys:&v355 count:1];
            id v291 = 0;
            uint64_t v16 = 0;
            id *v292 = (id)[v92 initWithDomain:v93 code:2 userInfo:v94];
            int v47 = (void *)v94;
            goto LABEL_276;
          }
          id v291 = 0;
          uint64_t v16 = 0;
LABEL_250:
          uint64_t v32 = v297;
          uint64_t v37 = v293;
          goto LABEL_236;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v292 = a4;
          id v293 = v9;
          goto LABEL_16;
        }
        if (a4)
        {
          id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v39 = *MEMORY[0x1E4F502C8];
          uint64_t v359 = *MEMORY[0x1E4F28568];
          id v40 = [NSString alloc];
          uint64_t v230 = objc_opt_class();
          uint64_t v41 = v40;
          id v9 = v298;
          id v294 = (id)[v41 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v230, @"age"];
          id v360 = v294;
          v296 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v360 forKeys:&v359 count:1];
          id v42 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 2);
          uint64_t v37 = 0;
          uint64_t v16 = 0;
          *a4 = v42;
          uint64_t v32 = v297;
LABEL_237:

          goto LABEL_238;
        }
        uint64_t v37 = 0;
        uint64_t v16 = 0;
        uint64_t v32 = v297;
LABEL_238:

        goto LABEL_239;
      }
      if (a4)
      {
        id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v361 = *MEMORY[0x1E4F28568];
        uint64_t v35 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"IHAState"];
        uint64_t v362 = v35;
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v362 forKeys:&v361 count:1];
        uint64_t v36 = v33;
        uint64_t v37 = (void *)v35;
        uint64_t v32 = 0;
        uint64_t v16 = 0;
        *a4 = (id)[v36 initWithDomain:v34 code:2 userInfo:v9];
        goto LABEL_238;
      }
      uint64_t v32 = 0;
      uint64_t v16 = 0;
LABEL_239:

      self = v299;
      goto LABEL_240;
    }
    if (a4)
    {
      uint64_t v24 = v7;
      id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v26 = self;
      uint64_t v27 = *MEMORY[0x1E4F502C8];
      uint64_t v365 = *MEMORY[0x1E4F28568];
      v302 = (BMMomentsEventDataEventBundle *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"bundle"];
      v366 = v302;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v366 forKeys:&v365 count:1];
      uint64_t v28 = v25;
      id v7 = v24;
      uint64_t v29 = v27;
      self = v26;
      uint64_t v16 = 0;
      *a4 = (id)[v28 initWithDomain:v29 code:2 userInfo:v8];
LABEL_241:

      goto LABEL_242;
    }
    goto LABEL_39;
  }
  if (a4)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v18 = self;
    uint64_t v19 = *MEMORY[0x1E4F502C8];
    uint64_t v367 = *MEMORY[0x1E4F28568];
    uint64_t v20 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"event"];
    v368[0] = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v368 forKeys:&v367 count:1];
    uint64_t v22 = v17;
    id v7 = (BMMomentsEventDataEvent *)v20;
    uint64_t v23 = v19;
    self = v18;
    id v305 = (id)v21;
    uint64_t v16 = 0;
    *a4 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", v23, 2);
LABEL_242:

    goto LABEL_243;
  }
  uint64_t v16 = 0;
LABEL_243:

  return v16;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMomentsEventData *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_event)
  {
    PBDataWriterPlaceMark();
    [(BMMomentsEventDataEvent *)self->_event writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_bundle)
  {
    PBDataWriterPlaceMark();
    [(BMMomentsEventDataEventBundle *)self->_bundle writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasIsBundle) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIHAState) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasAge) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasRaw_startDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_endDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_categoryOfEvent) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundleInterface) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundleEvergreenType) {
    PBDataWriterWriteStringField();
  }
  if (self->_sugSeetEngType) {
    PBDataWriterWriteStringField();
  }
  if (self->_appEntryEngType) {
    PBDataWriterWriteStringField();
  }
  if (self->_megaSignalTypeUsed) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasViewVisibleSuggestionsCount) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasViewTotalSuggestionsCount) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasIsJournalAppInstalled) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsJournalAppLocked) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsJournalSuggestionSkipped) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsActivitySettingsSwitchEnabled) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsCommunicationSettingsSwitchEnabled) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsSignificantLocationSettingsSwitchEnabled) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsMediaSettingsSwitchEnabled) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsNearbyPeopleSettingsSwitchEnabled) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsPhotoSettingsSwitchEnabled) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsStateOfMindSettingsSwitchEnabled) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsReflectionSettingsSwitchEnabled) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasIsBroadSystemLocationSettingsSwitchEnabled) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v174.receiver = self;
  v174.super_class = (Class)BMMomentsEventData;
  id v5 = [(BMEventBase *)&v174 init];
  if (!v5) {
    goto LABEL_280;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v175 = 0;
          uint64_t v176 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_279;
          }
          uint64_t v20 = [[BMMomentsEventDataEvent alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_279;
          }
          uint64_t v21 = 112;
          goto LABEL_28;
        case 2u:
          uint64_t v175 = 0;
          uint64_t v176 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_279;
          }
          uint64_t v20 = [[BMMomentsEventDataEventBundle alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_279;
          }
          uint64_t v21 = 120;
LABEL_28:
          uint64_t v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = v20;

          PBReaderRecallMark();
          continue;
        case 3u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          v5->_hasIsBundle = 1;
          while (2)
          {
            uint64_t v26 = *v6;
            uint64_t v27 = *(void *)&v4[v26];
            unint64_t v28 = v27 + 1;
            if (v27 == -1 || v28 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)&v4[*v9] + v27);
              *(void *)&v4[v26] = v28;
              v25 |= (unint64_t)(v29 & 0x7F) << v23;
              if (v29 < 0)
              {
                v23 += 7;
                BOOL v17 = v24++ >= 9;
                if (v17)
                {
                  uint64_t v25 = 0;
                  goto LABEL_185;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v25 = 0;
          }
LABEL_185:
          BOOL v167 = v25 != 0;
          uint64_t v168 = 48;
          goto LABEL_270;
        case 4u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          v5->_hasIHAState = 1;
          while (2)
          {
            uint64_t v33 = *v6;
            uint64_t v34 = *(void *)&v4[v33];
            unint64_t v35 = v34 + 1;
            if (v34 == -1 || v35 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v34);
              *(void *)&v4[v33] = v35;
              v32 |= (unint64_t)(v36 & 0x7F) << v30;
              if (v36 < 0)
              {
                v30 += 7;
                BOOL v17 = v31++ >= 9;
                if (v17)
                {
                  uint64_t v32 = 0;
                  goto LABEL_189;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v32 = 0;
          }
LABEL_189:
          BOOL v167 = v32 != 0;
          uint64_t v168 = 50;
          goto LABEL_270;
        case 5u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v39 = 0;
          v5->_hasAge = 1;
          while (2)
          {
            uint64_t v40 = *v6;
            uint64_t v41 = *(void *)&v4[v40];
            unint64_t v42 = v41 + 1;
            if (v41 == -1 || v42 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v43 = *(unsigned char *)(*(void *)&v4[*v9] + v41);
              *(void *)&v4[v40] = v42;
              v39 |= (unint64_t)(v43 & 0x7F) << v37;
              if (v43 < 0)
              {
                v37 += 7;
                BOOL v17 = v38++ >= 9;
                if (v17)
                {
                  LODWORD(v39) = 0;
                  goto LABEL_193;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v39) = 0;
          }
LABEL_193:
          uint64_t v169 = 84;
          goto LABEL_214;
        case 6u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          while (2)
          {
            uint64_t v47 = *v6;
            uint64_t v48 = *(void *)&v4[v47];
            unint64_t v49 = v48 + 1;
            if (v48 == -1 || v49 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v50 = *(unsigned char *)(*(void *)&v4[*v9] + v48);
              *(void *)&v4[v47] = v49;
              v46 |= (unint64_t)(v50 & 0x7F) << v44;
              if (v50 < 0)
              {
                v44 += 7;
                BOOL v17 = v45++ >= 9;
                if (v17)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_197;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v46) = 0;
          }
LABEL_197:
          if (v46 >= 7) {
            LODWORD(v46) = 0;
          }
          uint64_t v170 = 88;
          goto LABEL_221;
        case 7u:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v46 = 0;
          while (2)
          {
            uint64_t v53 = *v6;
            uint64_t v54 = *(void *)&v4[v53];
            unint64_t v55 = v54 + 1;
            if (v54 == -1 || v55 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v56 = *(unsigned char *)(*(void *)&v4[*v9] + v54);
              *(void *)&v4[v53] = v55;
              v46 |= (unint64_t)(v56 & 0x7F) << v51;
              if (v56 < 0)
              {
                v51 += 7;
                BOOL v17 = v52++ >= 9;
                if (v17)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_203;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v46) = 0;
          }
LABEL_203:
          if (v46 >= 4) {
            LODWORD(v46) = 0;
          }
          uint64_t v170 = 92;
          goto LABEL_221;
        case 8u:
          v5->_hasRaw_startDate = 1;
          uint64_t v57 = *v6;
          unint64_t v58 = *(void *)&v4[v57];
          if (v58 <= 0xFFFFFFFFFFFFFFF7 && v58 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v59 = *(objc_class **)(*(void *)&v4[*v9] + v58);
            *(void *)&v4[v57] = v58 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v59 = 0;
          }
          uint64_t v171 = 24;
          goto LABEL_277;
        case 9u:
          v5->_hasRaw_endDate = 1;
          uint64_t v60 = *v6;
          unint64_t v61 = *(void *)&v4[v60];
          if (v61 <= 0xFFFFFFFFFFFFFFF7 && v61 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v59 = *(objc_class **)(*(void *)&v4[*v9] + v61);
            *(void *)&v4[v60] = v61 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v59 = 0;
          }
          uint64_t v171 = 40;
LABEL_277:
          *(Class *)((char *)&v5->super.super.isa + v171) = v59;
          continue;
        case 0xAu:
          uint64_t v62 = PBReaderReadString();
          uint64_t v63 = 128;
          goto LABEL_76;
        case 0xBu:
          uint64_t v62 = PBReaderReadString();
          uint64_t v63 = 136;
          goto LABEL_76;
        case 0xCu:
          uint64_t v62 = PBReaderReadString();
          uint64_t v63 = 144;
          goto LABEL_76;
        case 0xDu:
          uint64_t v62 = PBReaderReadString();
          uint64_t v63 = 152;
          goto LABEL_76;
        case 0xEu:
          uint64_t v62 = PBReaderReadString();
          uint64_t v63 = 160;
          goto LABEL_76;
        case 0xFu:
          uint64_t v62 = PBReaderReadString();
          uint64_t v63 = 168;
LABEL_76:
          id v64 = *(Class *)((char *)&v5->super.super.isa + v63);
          *(Class *)((char *)&v5->super.super.isa + v63) = (Class)v62;

          continue;
        case 0x10u:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v39 = 0;
          v5->_hasViewVisibleSuggestionsCount = 1;
          while (2)
          {
            uint64_t v67 = *v6;
            uint64_t v68 = *(void *)&v4[v67];
            unint64_t v69 = v68 + 1;
            if (v68 == -1 || v69 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v70 = *(unsigned char *)(*(void *)&v4[*v9] + v68);
              *(void *)&v4[v67] = v69;
              v39 |= (unint64_t)(v70 & 0x7F) << v65;
              if (v70 < 0)
              {
                v65 += 7;
                BOOL v17 = v66++ >= 9;
                if (v17)
                {
                  LODWORD(v39) = 0;
                  goto LABEL_209;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v39) = 0;
          }
LABEL_209:
          uint64_t v169 = 96;
          goto LABEL_214;
        case 0x11u:
          char v71 = 0;
          unsigned int v72 = 0;
          uint64_t v39 = 0;
          v5->_hasViewTotalSuggestionsCount = 1;
          while (2)
          {
            uint64_t v73 = *v6;
            uint64_t v74 = *(void *)&v4[v73];
            unint64_t v75 = v74 + 1;
            if (v74 == -1 || v75 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v76 = *(unsigned char *)(*(void *)&v4[*v9] + v74);
              *(void *)&v4[v73] = v75;
              v39 |= (unint64_t)(v76 & 0x7F) << v71;
              if (v76 < 0)
              {
                v71 += 7;
                BOOL v17 = v72++ >= 9;
                if (v17)
                {
                  LODWORD(v39) = 0;
                  goto LABEL_213;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v39) = 0;
          }
LABEL_213:
          uint64_t v169 = 100;
LABEL_214:
          *(_DWORD *)((char *)&v5->super.super.isa + v169) = v39;
          continue;
        case 0x12u:
          char v77 = 0;
          unsigned int v78 = 0;
          uint64_t v46 = 0;
          while (2)
          {
            uint64_t v79 = *v6;
            uint64_t v80 = *(void *)&v4[v79];
            unint64_t v81 = v80 + 1;
            if (v80 == -1 || v81 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v82 = *(unsigned char *)(*(void *)&v4[*v9] + v80);
              *(void *)&v4[v79] = v81;
              v46 |= (unint64_t)(v82 & 0x7F) << v77;
              if (v82 < 0)
              {
                v77 += 7;
                BOOL v17 = v78++ >= 9;
                if (v17)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_218;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v46) = 0;
          }
LABEL_218:
          if (v46 >= 5) {
            LODWORD(v46) = 0;
          }
          uint64_t v170 = 104;
LABEL_221:
          *(_DWORD *)((char *)&v5->super.super.isa + v170) = v46;
          continue;
        case 0x13u:
          char v83 = 0;
          unsigned int v84 = 0;
          uint64_t v85 = 0;
          v5->_hasIsJournalAppInstalled = 1;
          while (2)
          {
            uint64_t v86 = *v6;
            uint64_t v87 = *(void *)&v4[v86];
            unint64_t v88 = v87 + 1;
            if (v87 == -1 || v88 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v89 = *(unsigned char *)(*(void *)&v4[*v9] + v87);
              *(void *)&v4[v86] = v88;
              v85 |= (unint64_t)(v89 & 0x7F) << v83;
              if (v89 < 0)
              {
                v83 += 7;
                BOOL v17 = v84++ >= 9;
                if (v17)
                {
                  uint64_t v85 = 0;
                  goto LABEL_225;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v85 = 0;
          }
LABEL_225:
          BOOL v167 = v85 != 0;
          uint64_t v168 = 55;
          goto LABEL_270;
        case 0x14u:
          char v90 = 0;
          unsigned int v91 = 0;
          uint64_t v92 = 0;
          v5->_hasIsJournalAppLocked = 1;
          while (2)
          {
            uint64_t v93 = *v6;
            uint64_t v94 = *(void *)&v4[v93];
            unint64_t v95 = v94 + 1;
            if (v94 == -1 || v95 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v96 = *(unsigned char *)(*(void *)&v4[*v9] + v94);
              *(void *)&v4[v93] = v95;
              v92 |= (unint64_t)(v96 & 0x7F) << v90;
              if (v96 < 0)
              {
                v90 += 7;
                BOOL v17 = v91++ >= 9;
                if (v17)
                {
                  uint64_t v92 = 0;
                  goto LABEL_229;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v92 = 0;
          }
LABEL_229:
          BOOL v167 = v92 != 0;
          uint64_t v168 = 57;
          goto LABEL_270;
        case 0x15u:
          char v97 = 0;
          unsigned int v98 = 0;
          uint64_t v99 = 0;
          v5->_hasIsJournalSuggestionSkipped = 1;
          while (2)
          {
            uint64_t v100 = *v6;
            uint64_t v101 = *(void *)&v4[v100];
            unint64_t v102 = v101 + 1;
            if (v101 == -1 || v102 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v103 = *(unsigned char *)(*(void *)&v4[*v9] + v101);
              *(void *)&v4[v100] = v102;
              v99 |= (unint64_t)(v103 & 0x7F) << v97;
              if (v103 < 0)
              {
                v97 += 7;
                BOOL v17 = v98++ >= 9;
                if (v17)
                {
                  uint64_t v99 = 0;
                  goto LABEL_233;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v99 = 0;
          }
LABEL_233:
          BOOL v167 = v99 != 0;
          uint64_t v168 = 59;
          goto LABEL_270;
        case 0x16u:
          char v104 = 0;
          unsigned int v105 = 0;
          uint64_t v106 = 0;
          v5->_hasIsActivitySettingsSwitchEnabled = 1;
          while (2)
          {
            uint64_t v107 = *v6;
            uint64_t v108 = *(void *)&v4[v107];
            unint64_t v109 = v108 + 1;
            if (v108 == -1 || v109 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v110 = *(unsigned char *)(*(void *)&v4[*v9] + v108);
              *(void *)&v4[v107] = v109;
              v106 |= (unint64_t)(v110 & 0x7F) << v104;
              if (v110 < 0)
              {
                v104 += 7;
                BOOL v17 = v105++ >= 9;
                if (v17)
                {
                  uint64_t v106 = 0;
                  goto LABEL_237;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v106 = 0;
          }
LABEL_237:
          BOOL v167 = v106 != 0;
          uint64_t v168 = 61;
          goto LABEL_270;
        case 0x17u:
          char v111 = 0;
          unsigned int v112 = 0;
          uint64_t v113 = 0;
          v5->_hasIsCommunicationSettingsSwitchEnabled = 1;
          while (2)
          {
            uint64_t v114 = *v6;
            uint64_t v115 = *(void *)&v4[v114];
            unint64_t v116 = v115 + 1;
            if (v115 == -1 || v116 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v117 = *(unsigned char *)(*(void *)&v4[*v9] + v115);
              *(void *)&v4[v114] = v116;
              v113 |= (unint64_t)(v117 & 0x7F) << v111;
              if (v117 < 0)
              {
                v111 += 7;
                BOOL v17 = v112++ >= 9;
                if (v17)
                {
                  uint64_t v113 = 0;
                  goto LABEL_241;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v113 = 0;
          }
LABEL_241:
          BOOL v167 = v113 != 0;
          uint64_t v168 = 63;
          goto LABEL_270;
        case 0x18u:
          char v118 = 0;
          unsigned int v119 = 0;
          uint64_t v120 = 0;
          v5->_hasIsSignificantLocationSettingsSwitchEnabled = 1;
          while (2)
          {
            uint64_t v121 = *v6;
            uint64_t v122 = *(void *)&v4[v121];
            unint64_t v123 = v122 + 1;
            if (v122 == -1 || v123 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v124 = *(unsigned char *)(*(void *)&v4[*v9] + v122);
              *(void *)&v4[v121] = v123;
              v120 |= (unint64_t)(v124 & 0x7F) << v118;
              if (v124 < 0)
              {
                v118 += 7;
                BOOL v17 = v119++ >= 9;
                if (v17)
                {
                  uint64_t v120 = 0;
                  goto LABEL_245;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v120 = 0;
          }
LABEL_245:
          BOOL v167 = v120 != 0;
          uint64_t v168 = 65;
          goto LABEL_270;
        case 0x19u:
          char v125 = 0;
          unsigned int v126 = 0;
          uint64_t v127 = 0;
          v5->_hasIsMediaSettingsSwitchEnabled = 1;
          while (2)
          {
            uint64_t v128 = *v6;
            uint64_t v129 = *(void *)&v4[v128];
            unint64_t v130 = v129 + 1;
            if (v129 == -1 || v130 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v131 = *(unsigned char *)(*(void *)&v4[*v9] + v129);
              *(void *)&v4[v128] = v130;
              v127 |= (unint64_t)(v131 & 0x7F) << v125;
              if (v131 < 0)
              {
                v125 += 7;
                BOOL v17 = v126++ >= 9;
                if (v17)
                {
                  uint64_t v127 = 0;
                  goto LABEL_249;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v127 = 0;
          }
LABEL_249:
          BOOL v167 = v127 != 0;
          uint64_t v168 = 67;
          goto LABEL_270;
        case 0x1Au:
          char v132 = 0;
          unsigned int v133 = 0;
          uint64_t v134 = 0;
          v5->_hasIsNearbyPeopleSettingsSwitchEnabled = 1;
          while (2)
          {
            uint64_t v135 = *v6;
            uint64_t v136 = *(void *)&v4[v135];
            unint64_t v137 = v136 + 1;
            if (v136 == -1 || v137 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v138 = *(unsigned char *)(*(void *)&v4[*v9] + v136);
              *(void *)&v4[v135] = v137;
              v134 |= (unint64_t)(v138 & 0x7F) << v132;
              if (v138 < 0)
              {
                v132 += 7;
                BOOL v17 = v133++ >= 9;
                if (v17)
                {
                  uint64_t v134 = 0;
                  goto LABEL_253;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v134 = 0;
          }
LABEL_253:
          BOOL v167 = v134 != 0;
          uint64_t v168 = 69;
          goto LABEL_270;
        case 0x1Bu:
          char v139 = 0;
          unsigned int v140 = 0;
          uint64_t v141 = 0;
          v5->_hasIsPhotoSettingsSwitchEnabled = 1;
          while (2)
          {
            uint64_t v142 = *v6;
            uint64_t v143 = *(void *)&v4[v142];
            unint64_t v144 = v143 + 1;
            if (v143 == -1 || v144 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v145 = *(unsigned char *)(*(void *)&v4[*v9] + v143);
              *(void *)&v4[v142] = v144;
              v141 |= (unint64_t)(v145 & 0x7F) << v139;
              if (v145 < 0)
              {
                v139 += 7;
                BOOL v17 = v140++ >= 9;
                if (v17)
                {
                  uint64_t v141 = 0;
                  goto LABEL_257;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v141 = 0;
          }
LABEL_257:
          BOOL v167 = v141 != 0;
          uint64_t v168 = 71;
          goto LABEL_270;
        case 0x1Cu:
          char v146 = 0;
          unsigned int v147 = 0;
          uint64_t v148 = 0;
          v5->_hasIsStateOfMindSettingsSwitchEnabled = 1;
          while (2)
          {
            uint64_t v149 = *v6;
            uint64_t v150 = *(void *)&v4[v149];
            unint64_t v151 = v150 + 1;
            if (v150 == -1 || v151 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v152 = *(unsigned char *)(*(void *)&v4[*v9] + v150);
              *(void *)&v4[v149] = v151;
              v148 |= (unint64_t)(v152 & 0x7F) << v146;
              if (v152 < 0)
              {
                v146 += 7;
                BOOL v17 = v147++ >= 9;
                if (v17)
                {
                  uint64_t v148 = 0;
                  goto LABEL_261;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v148 = 0;
          }
LABEL_261:
          BOOL v167 = v148 != 0;
          uint64_t v168 = 73;
          goto LABEL_270;
        case 0x1Du:
          char v153 = 0;
          unsigned int v154 = 0;
          uint64_t v155 = 0;
          v5->_hasIsReflectionSettingsSwitchEnabled = 1;
          while (2)
          {
            uint64_t v156 = *v6;
            uint64_t v157 = *(void *)&v4[v156];
            unint64_t v158 = v157 + 1;
            if (v157 == -1 || v158 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v159 = *(unsigned char *)(*(void *)&v4[*v9] + v157);
              *(void *)&v4[v156] = v158;
              v155 |= (unint64_t)(v159 & 0x7F) << v153;
              if (v159 < 0)
              {
                v153 += 7;
                BOOL v17 = v154++ >= 9;
                if (v17)
                {
                  uint64_t v155 = 0;
                  goto LABEL_265;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v155 = 0;
          }
LABEL_265:
          BOOL v167 = v155 != 0;
          uint64_t v168 = 75;
          goto LABEL_270;
        case 0x1Eu:
          char v160 = 0;
          unsigned int v161 = 0;
          uint64_t v162 = 0;
          v5->_hasIsBroadSystemLocationSettingsSwitchEnabled = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_279;
          }
          continue;
      }
      while (1)
      {
        uint64_t v163 = *v6;
        uint64_t v164 = *(void *)&v4[v163];
        unint64_t v165 = v164 + 1;
        if (v164 == -1 || v165 > *(void *)&v4[*v7]) {
          break;
        }
        char v166 = *(unsigned char *)(*(void *)&v4[*v9] + v164);
        *(void *)&v4[v163] = v165;
        v162 |= (unint64_t)(v166 & 0x7F) << v160;
        if ((v166 & 0x80) == 0) {
          goto LABEL_267;
        }
        v160 += 7;
        BOOL v17 = v161++ >= 9;
        if (v17)
        {
          uint64_t v162 = 0;
          goto LABEL_269;
        }
      }
      v4[*v8] = 1;
LABEL_267:
      if (v4[*v8]) {
        uint64_t v162 = 0;
      }
LABEL_269:
      BOOL v167 = v162 != 0;
      uint64_t v168 = 77;
LABEL_270:
      *((unsigned char *)&v5->super.super.isa + v168) = v167;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_279:
  }
    v172 = 0;
  else {
LABEL_280:
  }
    v172 = v5;

  return v172;
}

- (NSString)description
{
  id v18 = [NSString alloc];
  unint64_t v35 = [(BMMomentsEventData *)self event];
  uint64_t v33 = [(BMMomentsEventData *)self bundle];
  uint64_t v34 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isBundle](self, "isBundle"));
  char v30 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData IHAState](self, "IHAState"));
  uint64_t v32 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventData age](self, "age"));
  unint64_t v28 = BMMomentsEventDataAgeRangeTypeAsString([(BMMomentsEventData *)self ageRange]);
  unsigned int v31 = BMMomentsEventDataBiologicalSexTypeAsString([(BMMomentsEventData *)self biologicalSex]);
  uint64_t v27 = [(BMMomentsEventData *)self startDate];
  uint64_t v26 = [(BMMomentsEventData *)self endDate];
  char v29 = [(BMMomentsEventData *)self categoryOfEvent];
  unsigned int v24 = [(BMMomentsEventData *)self bundleInterface];
  uint64_t v25 = [(BMMomentsEventData *)self bundleEvergreenType];
  char v23 = [(BMMomentsEventData *)self sugSeetEngType];
  BOOL v17 = [(BMMomentsEventData *)self appEntryEngType];
  uint64_t v22 = [(BMMomentsEventData *)self megaSignalTypeUsed];
  char v16 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventData viewVisibleSuggestionsCount](self, "viewVisibleSuggestionsCount"));
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventData viewTotalSuggestionsCount](self, "viewTotalSuggestionsCount"));
  unint64_t v15 = BMMomentsEventDataOnboardingFlowCompletionAsString([(BMMomentsEventData *)self onboardingFlowCompletionState]);
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isJournalAppInstalled](self, "isJournalAppInstalled"));
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isJournalAppLocked](self, "isJournalAppLocked"));
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isJournalSuggestionSkipped](self, "isJournalSuggestionSkipped"));
  unint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isActivitySettingsSwitchEnabled](self, "isActivitySettingsSwitchEnabled"));
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isCommunicationSettingsSwitchEnabled](self, "isCommunicationSettingsSwitchEnabled"));
  char v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isSignificantLocationSettingsSwitchEnabled](self, "isSignificantLocationSettingsSwitchEnabled"));
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isMediaSettingsSwitchEnabled](self, "isMediaSettingsSwitchEnabled"));
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isNearbyPeopleSettingsSwitchEnabled](self, "isNearbyPeopleSettingsSwitchEnabled"));
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isPhotoSettingsSwitchEnabled](self, "isPhotoSettingsSwitchEnabled"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isStateOfMindSettingsSwitchEnabled](self, "isStateOfMindSettingsSwitchEnabled"));
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isReflectionSettingsSwitchEnabled](self, "isReflectionSettingsSwitchEnabled"));
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEventData isBroadSystemLocationSettingsSwitchEnabled](self, "isBroadSystemLocationSettingsSwitchEnabled"));
  uint64_t v19 = objc_msgSend(v18, "initWithFormat:", @"BMMomentsEventData with event: %@, bundle: %@, isBundle: %@, IHAState: %@, age: %@, ageRange: %@, biologicalSex: %@, startDate: %@, endDate: %@, categoryOfEvent: %@, bundleInterface: %@, bundleEvergreenType: %@, sugSeetEngType: %@, appEntryEngType: %@, megaSignalTypeUsed: %@, viewVisibleSuggestionsCount: %@, viewTotalSuggestionsCount: %@, onboardingFlowCompletionState: %@, isJournalAppInstalled: %@, isJournalAppLocked: %@, isJournalSuggestionSkipped: %@, isActivitySettingsSwitchEnabled: %@, isCommunicationSettingsSwitchEnabled: %@, isSignificantLocationSettingsSwitchEnabled: %@, isMediaSettingsSwitchEnabled: %@, isNearbyPeopleSettingsSwitchEnabled: %@, isPhotoSettingsSwitchEnabled: %@, isStateOfMindSettingsSwitchEnabled: %@, isReflectionSettingsSwitchEnabled: %@, isBroadSystemLocationSettingsSwitchEnabled: %@", v35, v33, v34, v30, v32, v28, v31, v27, v26, v29, v24, v25, v23, v17, v22, v16,
                  v21,
                  v15,
                  v20,
                  v14,
                  v13,
                  v12,
                  v11,
                  v10,
                  v9,
                  v3,
                  v4,
                  v5,
                  v6,
                  v7);

  return (NSString *)v19;
}

- (BMMomentsEventData)initWithEvent:(id)a3 bundle:(id)a4 isBundle:(id)a5 IHAState:(id)a6 age:(id)a7 ageRange:(int)a8 biologicalSex:(int)a9 startDate:(id)a10 endDate:(id)a11 categoryOfEvent:(id)a12 bundleInterface:(id)a13 bundleEvergreenType:(id)a14 sugSeetEngType:(id)a15 appEntryEngType:(id)a16 megaSignalTypeUsed:(id)a17 viewVisibleSuggestionsCount:(id)a18 viewTotalSuggestionsCount:(id)a19 onboardingFlowCompletionState:(int)a20 isJournalAppInstalled:(id)a21 isJournalAppLocked:(id)a22 isJournalSuggestionSkipped:(id)a23 isActivitySettingsSwitchEnabled:(id)a24 isCommunicationSettingsSwitchEnabled:(id)a25 isSignificantLocationSettingsSwitchEnabled:(id)a26 isMediaSettingsSwitchEnabled:(id)a27 isNearbyPeopleSettingsSwitchEnabled:(id)a28 isPhotoSettingsSwitchEnabled:(id)a29 isStateOfMindSettingsSwitchEnabled:(id)a30 isReflectionSettingsSwitchEnabled:(id)a31 isBroadSystemLocationSettingsSwitchEnabled:(id)a32
{
  id v57 = a3;
  id v47 = a4;
  id v56 = a4;
  id v35 = a5;
  id v68 = a6;
  id v73 = a7;
  id v71 = a10;
  id v65 = a11;
  id v55 = a12;
  id v54 = a13;
  id v53 = a14;
  id v52 = a15;
  id v51 = a16;
  id v50 = a17;
  id v69 = a18;
  id v70 = a19;
  id v67 = a21;
  id v66 = a22;
  id v36 = a23;
  id v64 = a24;
  id v63 = a25;
  id v62 = a26;
  id v61 = a27;
  id v60 = a28;
  id v59 = a29;
  id v58 = a30;
  id v37 = a31;
  id v38 = a32;
  v74.receiver = self;
  v74.super_class = (Class)BMMomentsEventData;
  uint64_t v39 = [(BMEventBase *)&v74 init];
  if (v39)
  {
    v39->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v39->_event, a3);
    objc_storeStrong((id *)&v39->_bundle, v47);
    if (v35)
    {
      v39->_hasIsBundle = 1;
      v39->_isBundle = [v35 BOOLValue];
    }
    else
    {
      id v35 = 0;
      v39->_hasIsBundle = 0;
      v39->_isBundle = 0;
    }
    if (v68)
    {
      v39->_hasIHAState = 1;
      v39->_IHAState = [v68 BOOLValue];
    }
    else
    {
      v39->_hasIHAState = 0;
      v39->_IHAState = 0;
    }
    if (v73)
    {
      v39->_hasAge = 1;
      int v40 = [v73 intValue];
    }
    else
    {
      v39->_hasAge = 0;
      int v40 = -1;
    }
    v39->_age = v40;
    v39->_ageRange = a8;
    v39->_biologicalSex = a9;
    if (v71)
    {
      v39->_hasRaw_startDate = 1;
      [v71 timeIntervalSince1970];
    }
    else
    {
      v39->_hasRaw_startDate = 0;
      double v41 = -1.0;
    }
    v39->_raw_startDate = v41;
    if (v65)
    {
      v39->_hasRaw_endDate = 1;
      [v65 timeIntervalSince1970];
    }
    else
    {
      v39->_hasRaw_endDate = 0;
      double v42 = -1.0;
    }
    v39->_raw_endDate = v42;
    objc_storeStrong((id *)&v39->_categoryOfEvent, a12);
    objc_storeStrong((id *)&v39->_bundleInterface, a13);
    objc_storeStrong((id *)&v39->_bundleEvergreenType, a14);
    objc_storeStrong((id *)&v39->_sugSeetEngType, a15);
    objc_storeStrong((id *)&v39->_appEntryEngType, a16);
    objc_storeStrong((id *)&v39->_megaSignalTypeUsed, a17);
    if (v69)
    {
      v39->_hasViewVisibleSuggestionsCount = 1;
      int v43 = [v69 intValue];
    }
    else
    {
      v39->_hasViewVisibleSuggestionsCount = 0;
      int v43 = -1;
    }
    v39->_viewVisibleSuggestionsCount = v43;
    if (v70)
    {
      v39->_hasViewTotalSuggestionsCount = 1;
      int v44 = [v70 intValue];
    }
    else
    {
      v39->_hasViewTotalSuggestionsCount = 0;
      int v44 = -1;
    }
    v39->_viewTotalSuggestionsCount = v44;
    v39->_onboardingFlowCompletionState = a20;
    if (v67)
    {
      v39->_hasIsJournalAppInstalled = 1;
      v39->_isJournalAppInstalled = [v67 BOOLValue];
    }
    else
    {
      v39->_hasIsJournalAppInstalled = 0;
      v39->_isJournalAppInstalled = 0;
    }
    if (v66)
    {
      v39->_hasIsJournalAppLocked = 1;
      v39->_isJournalAppLocked = [v66 BOOLValue];
    }
    else
    {
      v39->_hasIsJournalAppLocked = 0;
      v39->_isJournalAppLocked = 0;
    }
    if (v36)
    {
      v39->_hasIsJournalSuggestionSkipped = 1;
      v39->_isJournalSuggestionSkipped = [v36 BOOLValue];
    }
    else
    {
      v39->_hasIsJournalSuggestionSkipped = 0;
      v39->_isJournalSuggestionSkipped = 0;
    }
    if (v64)
    {
      v39->_hasIsActivitySettingsSwitchEnabled = 1;
      v39->_isActivitySettingsSwitchEnabled = [v64 BOOLValue];
    }
    else
    {
      v39->_hasIsActivitySettingsSwitchEnabled = 0;
      v39->_isActivitySettingsSwitchEnabled = 0;
    }
    if (v63)
    {
      v39->_hasIsCommunicationSettingsSwitchEnabled = 1;
      v39->_isCommunicationSettingsSwitchEnabled = [v63 BOOLValue];
    }
    else
    {
      v39->_hasIsCommunicationSettingsSwitchEnabled = 0;
      v39->_isCommunicationSettingsSwitchEnabled = 0;
    }
    if (v62)
    {
      v39->_hasIsSignificantLocationSettingsSwitchEnabled = 1;
      v39->_isSignificantLocationSettingsSwitchEnabled = [v62 BOOLValue];
    }
    else
    {
      v39->_hasIsSignificantLocationSettingsSwitchEnabled = 0;
      v39->_isSignificantLocationSettingsSwitchEnabled = 0;
    }
    if (v61)
    {
      v39->_hasIsMediaSettingsSwitchEnabled = 1;
      v39->_isMediaSettingsSwitchEnabled = [v61 BOOLValue];
    }
    else
    {
      v39->_hasIsMediaSettingsSwitchEnabled = 0;
      v39->_isMediaSettingsSwitchEnabled = 0;
    }
    if (v60)
    {
      v39->_hasIsNearbyPeopleSettingsSwitchEnabled = 1;
      v39->_isNearbyPeopleSettingsSwitchEnabled = [v60 BOOLValue];
    }
    else
    {
      v39->_hasIsNearbyPeopleSettingsSwitchEnabled = 0;
      v39->_isNearbyPeopleSettingsSwitchEnabled = 0;
    }
    if (v59)
    {
      v39->_hasIsPhotoSettingsSwitchEnabled = 1;
      v39->_isPhotoSettingsSwitchEnabled = [v59 BOOLValue];
    }
    else
    {
      v39->_hasIsPhotoSettingsSwitchEnabled = 0;
      v39->_isPhotoSettingsSwitchEnabled = 0;
    }
    if (v58)
    {
      v39->_hasIsStateOfMindSettingsSwitchEnabled = 1;
      v39->_isStateOfMindSettingsSwitchEnabled = [v58 BOOLValue];
    }
    else
    {
      v39->_hasIsStateOfMindSettingsSwitchEnabled = 0;
      v39->_isStateOfMindSettingsSwitchEnabled = 0;
    }
    if (v37)
    {
      v39->_hasIsReflectionSettingsSwitchEnabled = 1;
      v39->_isReflectionSettingsSwitchEnabled = [v37 BOOLValue];
    }
    else
    {
      v39->_hasIsReflectionSettingsSwitchEnabled = 0;
      v39->_isReflectionSettingsSwitchEnabled = 0;
    }
    if (v38)
    {
      v39->_hasIsBroadSystemLocationSettingsSwitchEnabled = 1;
      v39->_isBroadSystemLocationSettingsSwitchEnabled = [v38 BOOLValue];
    }
    else
    {
      v39->_hasIsBroadSystemLocationSettingsSwitchEnabled = 0;
      v39->_isBroadSystemLocationSettingsSwitchEnabled = 0;
    }
  }

  return v39;
}

+ (id)protoFields
{
  v34[30] = *MEMORY[0x1E4F143B8];
  uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"event" number:1 type:14 subMessageClass:objc_opt_class()];
  v34[0] = v33;
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundle" number:2 type:14 subMessageClass:objc_opt_class()];
  v34[1] = v32;
  unsigned int v31 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isBundle" number:3 type:12 subMessageClass:0];
  v34[2] = v31;
  char v30 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"IHAState" number:4 type:12 subMessageClass:0];
  v34[3] = v30;
  char v29 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"age" number:5 type:2 subMessageClass:0];
  v34[4] = v29;
  unint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ageRange" number:6 type:4 subMessageClass:0];
  v34[5] = v28;
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"biologicalSex" number:7 type:4 subMessageClass:0];
  v34[6] = v27;
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"startDate" number:8 type:0 subMessageClass:0];
  v34[7] = v26;
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"endDate" number:9 type:0 subMessageClass:0];
  v34[8] = v25;
  unsigned int v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"categoryOfEvent" number:10 type:13 subMessageClass:0];
  v34[9] = v24;
  char v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleInterface" number:11 type:13 subMessageClass:0];
  v34[10] = v23;
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleEvergreenType" number:12 type:13 subMessageClass:0];
  v34[11] = v22;
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sugSeetEngType" number:13 type:13 subMessageClass:0];
  v34[12] = v21;
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appEntryEngType" number:14 type:13 subMessageClass:0];
  v34[13] = v20;
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"megaSignalTypeUsed" number:15 type:13 subMessageClass:0];
  v34[14] = v19;
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"viewVisibleSuggestionsCount" number:16 type:2 subMessageClass:0];
  v34[15] = v18;
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"viewTotalSuggestionsCount" number:17 type:2 subMessageClass:0];
  v34[16] = v17;
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"onboardingFlowCompletionState" number:18 type:4 subMessageClass:0];
  v34[17] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isJournalAppInstalled" number:19 type:12 subMessageClass:0];
  v34[18] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isJournalAppLocked" number:20 type:12 subMessageClass:0];
  v34[19] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isJournalSuggestionSkipped" number:21 type:12 subMessageClass:0];
  v34[20] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isActivitySettingsSwitchEnabled" number:22 type:12 subMessageClass:0];
  v34[21] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isCommunicationSettingsSwitchEnabled" number:23 type:12 subMessageClass:0];
  v34[22] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isSignificantLocationSettingsSwitchEnabled" number:24 type:12 subMessageClass:0];
  v34[23] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isMediaSettingsSwitchEnabled" number:25 type:12 subMessageClass:0];
  v34[24] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isNearbyPeopleSettingsSwitchEnabled" number:26 type:12 subMessageClass:0];
  v34[25] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isPhotoSettingsSwitchEnabled" number:27 type:12 subMessageClass:0];
  v34[26] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isStateOfMindSettingsSwitchEnabled" number:28 type:12 subMessageClass:0];
  v34[27] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isReflectionSettingsSwitchEnabled" number:29 type:12 subMessageClass:0];
  v34[28] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isBroadSystemLocationSettingsSwitchEnabled" number:30 type:12 subMessageClass:0];
  v34[29] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:30];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3378;
}

+ (id)columns
{
  v34[30] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"event_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_4556];
  uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"bundle_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_4558];
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isBundle" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  unsigned int v31 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"IHAState" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  char v30 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"age" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:2 convertedType:0];
  char v29 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ageRange" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  unint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"biologicalSex" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"startDate" dataType:3 requestOnly:0 fieldNumber:8 protoDataType:0 convertedType:2];
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"endDate" dataType:3 requestOnly:0 fieldNumber:9 protoDataType:0 convertedType:2];
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"categoryOfEvent" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  unsigned int v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleInterface" dataType:2 requestOnly:0 fieldNumber:11 protoDataType:13 convertedType:0];
  char v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleEvergreenType" dataType:2 requestOnly:0 fieldNumber:12 protoDataType:13 convertedType:0];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sugSeetEngType" dataType:2 requestOnly:0 fieldNumber:13 protoDataType:13 convertedType:0];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appEntryEngType" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"megaSignalTypeUsed" dataType:2 requestOnly:0 fieldNumber:15 protoDataType:13 convertedType:0];
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"viewVisibleSuggestionsCount" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:2 convertedType:0];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"viewTotalSuggestionsCount" dataType:0 requestOnly:0 fieldNumber:17 protoDataType:2 convertedType:0];
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"onboardingFlowCompletionState" dataType:0 requestOnly:0 fieldNumber:18 protoDataType:4 convertedType:0];
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isJournalAppInstalled" dataType:0 requestOnly:0 fieldNumber:19 protoDataType:12 convertedType:0];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isJournalAppLocked" dataType:0 requestOnly:0 fieldNumber:20 protoDataType:12 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isJournalSuggestionSkipped" dataType:0 requestOnly:0 fieldNumber:21 protoDataType:12 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isActivitySettingsSwitchEnabled" dataType:0 requestOnly:0 fieldNumber:22 protoDataType:12 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isCommunicationSettingsSwitchEnabled" dataType:0 requestOnly:0 fieldNumber:23 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isSignificantLocationSettingsSwitchEnabled" dataType:0 requestOnly:0 fieldNumber:24 protoDataType:12 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isMediaSettingsSwitchEnabled" dataType:0 requestOnly:0 fieldNumber:25 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isNearbyPeopleSettingsSwitchEnabled" dataType:0 requestOnly:0 fieldNumber:26 protoDataType:12 convertedType:0];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isPhotoSettingsSwitchEnabled" dataType:0 requestOnly:0 fieldNumber:27 protoDataType:12 convertedType:0];
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isStateOfMindSettingsSwitchEnabled" dataType:0 requestOnly:0 fieldNumber:28 protoDataType:12 convertedType:0];
  unsigned int v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isReflectionSettingsSwitchEnabled" dataType:0 requestOnly:0 fieldNumber:29 protoDataType:12 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isBroadSystemLocationSettingsSwitchEnabled" dataType:0 requestOnly:0 fieldNumber:30 protoDataType:12 convertedType:0];
  v34[0] = v13;
  v34[1] = v33;
  v34[2] = v32;
  v34[3] = v31;
  v34[4] = v30;
  v34[5] = v29;
  v34[6] = v28;
  v34[7] = v27;
  v34[8] = v26;
  v34[9] = v25;
  v34[10] = v24;
  v34[11] = v23;
  v34[12] = v22;
  v34[13] = v21;
  v34[14] = v20;
  v34[15] = v19;
  v34[16] = v18;
  v34[17] = v17;
  v34[18] = v16;
  v34[19] = v15;
  v34[20] = v2;
  v34[21] = v3;
  v34[22] = v14;
  v34[23] = v4;
  v34[24] = v5;
  v34[25] = v6;
  v34[26] = v7;
  v34[27] = v12;
  v34[28] = v11;
  v34[29] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:30];

  return v10;
}

id __29__BMMomentsEventData_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 bundle];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __29__BMMomentsEventData_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 event];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMMomentsEventData alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[20] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (BMMomentsEventData)initWithEvent:(id)a3 bundle:(id)a4 isBundle:(id)a5 IHAState:(id)a6 age:(id)a7 ageRange:(int)a8 biologicalSex:(int)a9 startDate:(id)a10 endDate:(id)a11 categoryOfEvent:(id)a12 bundleInterface:(id)a13 bundleEvergreenType:(id)a14 sugSeetEngType:(id)a15 appEntryEngType:(id)a16 megaSignalTypeUsed:(id)a17 viewVisibleSuggestionsCount:(id)a18 viewTotalSuggestionsCount:(id)a19
{
  LODWORD(v21) = 0;
  LODWORD(v20) = a9;
  return -[BMMomentsEventData initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:](self, "initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:", a3, a4, a5, a6, a7, *(void *)&a8, v20, a10, a11, a12, a13, a14,
           a15,
           a16,
           a17,
           a18,
           a19,
           v21,
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
           0,
           0);
}

- (BMMomentsEventData)initWithEvent:(id)a3 bundle:(id)a4 isBundle:(id)a5 IHAState:(id)a6 age:(id)a7 ageRange:(int)a8 biologicalSex:(int)a9
{
  v45[14] = *MEMORY[0x1E4F143B8];
  id v34 = a7;
  id v33 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v32 = v14;
  char v30 = v16;
  if ([v14 BOOLValue])
  {
    id v37 = [v15 bundleStartDate];
    unsigned int v31 = [v15 bundleEndDate];
    v44[0] = &unk_1F0BF7AB8;
    v44[1] = &unk_1F0BF7AD0;
    v45[0] = @"Unknown";
    v45[1] = @"Activity";
    v44[2] = &unk_1F0BF7AE8;
    v44[3] = &unk_1F0BF7B00;
    v45[2] = @"Outing";
    v45[3] = @"PhotoMoment";
    v44[4] = &unk_1F0BF7B18;
    v44[5] = &unk_1F0BF7B30;
    v45[4] = @"SignificantContact";
    v45[5] = @"Media";
    v44[6] = &unk_1F0BF7B48;
    v44[7] = &unk_1F0BF7B60;
    v45[6] = @"SharedContent";
    v45[7] = @"TimeAtHome";
    v44[8] = &unk_1F0BF7B78;
    v44[9] = &unk_1F0BF7B90;
    v45[8] = @"TopicsOfInterest";
    v45[9] = @"Trend";
    v44[10] = &unk_1F0BF7BA8;
    v44[11] = &unk_1F0BF7BC0;
    v45[10] = @"PhotoMemory";
    v45[11] = @"Evergreen";
    unint64_t v28 = self;
    v44[12] = &unk_1F0BF7BD8;
    v44[13] = &unk_1F0BF7BF0;
    v45[12] = @"TimeContext";
    v45[13] = @"Trip";
    BOOL v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:14];
    id v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "bundleInterfaceType"));
    char v29 = [v17 objectForKeyedSubscript:v18];

    v43[0] = @"Unknown";
    v43[1] = @"Selected";
    v43[2] = @"Shared";
    v43[3] = @"Liked";
    v42[0] = &unk_1F0BF7AB8;
    v42[1] = &unk_1F0BF7AD0;
    v42[4] = &unk_1F0BF7B18;
    v42[5] = &unk_1F0BF7B30;
    v42[2] = &unk_1F0BF7AE8;
    v42[3] = &unk_1F0BF7B00;
    v43[4] = @"Disliked";
    v43[5] = @"Dismissed";
    v42[6] = &unk_1F0BF7B48;
    v42[7] = &unk_1F0BF7B60;
    v43[6] = @"Deleted";
    v43[7] = @"Hidden";
    v42[8] = &unk_1F0BF7B78;
    v42[9] = &unk_1F0BF7B90;
    v43[8] = @"QuickAddEntry";
    v43[9] = @"Viewed";
    v42[10] = &unk_1F0BF7BA8;
    v42[11] = &unk_1F0BF7BC0;
    v43[10] = @"ThumbsDown";
    v43[11] = @"Favorite";
    v42[12] = &unk_1F0BF7BD8;
    v42[13] = &unk_1F0BF7BF0;
    v43[12] = @"ThumbsUp";
    v43[13] = @"EntryCreated";
    v42[14] = &unk_1F0BF7C08;
    v42[15] = &unk_1F0BF7C20;
    v43[14] = @"EntryEdited";
    v43[15] = @"EntryDeleted";
    v42[16] = &unk_1F0BF7C38;
    v42[17] = &unk_1F0BF7C50;
    v43[16] = @"EntryCancelled";
    v43[17] = @"Annotated";
    v42[18] = &unk_1F0BF7C68;
    v42[19] = &unk_1F0BF7C80;
    v43[18] = @"Positive";
    v43[19] = @"Negative";
    v42[20] = &unk_1F0BF7C98;
    v42[21] = &unk_1F0BF7CB0;
    v43[20] = @"Neutral";
    v43[21] = @"Rejected";
    v42[22] = &unk_1F0BF7CC8;
    v42[23] = &unk_1F0BF7CE0;
    v43[22] = @"Accepted";
    v43[23] = @"Posted";
    v42[24] = &unk_1F0BF7CF8;
    v42[25] = &unk_1F0BF7D10;
    v43[24] = @"Filtered";
    v43[25] = @"EntryCreatedWithUpdates";
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:26];
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "suggestionType"));
    uint64_t v21 = [v19 objectForKeyedSubscript:v20];

    v40[0] = &unk_1F0BF7AB8;
    v40[1] = &unk_1F0BF7AD0;
    v41[0] = @"Unknown";
    v41[1] = @"EntryCreated";
    v40[2] = &unk_1F0BF7AE8;
    v40[3] = &unk_1F0BF7B00;
    v41[2] = @"EntryEdited";
    v41[3] = @"EntryDeleted";
    v40[4] = &unk_1F0BF7B18;
    v41[4] = @"EntryCancelled";
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:5];
    char v23 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "appEntryEventType"));
    unsigned int v24 = [v22 objectForKeyedSubscript:v23];

    self = v28;
    uint64_t v25 = 0;
  }
  else
  {
    id v37 = [v16 startDate];
    unsigned int v31 = [v16 endDate];
    v38[0] = &unk_1F0BF7AB8;
    v38[1] = &unk_1F0BF7AD0;
    v39[0] = @"Unknown";
    v39[1] = @"Visit";
    v38[2] = &unk_1F0BF7AE8;
    v38[3] = &unk_1F0BF7B00;
    v39[2] = @"Workout";
    v39[3] = @"MediaOnRepeat";
    v38[4] = &unk_1F0BF7B18;
    v38[5] = &unk_1F0BF7B30;
    v39[4] = @"LeisureMedia";
    v39[5] = @"PhotoMoment";
    v38[6] = &unk_1F0BF7B48;
    v38[7] = &unk_1F0BF7B60;
    v39[6] = @"MediaPlaySessions";
    v39[7] = @"Topic";
    v38[8] = &unk_1F0BF7B78;
    v38[9] = &unk_1F0BF7B90;
    v39[8] = @"TravelEvent";
    v39[9] = @"SharedWithYouEvent";
    v38[10] = &unk_1F0BF7BA8;
    v38[11] = &unk_1F0BF7BC0;
    v39[10] = @"SignificantContact";
    v39[11] = @"StructuredEvent";
    v38[12] = &unk_1F0BF7BD8;
    v38[13] = &unk_1F0BF7BF0;
    v39[12] = @"NLEvent";
    v39[13] = @"MindfulSession";
    v38[14] = &unk_1F0BF7C08;
    v38[15] = &unk_1F0BF7C20;
    v39[14] = @"SharedPhoto";
    v39[15] = @"ProximityEvent";
    v38[16] = &unk_1F0BF7C38;
    v38[17] = &unk_1F0BF7C50;
    v39[16] = @"MotionActivity";
    v39[17] = @"PhotoMemory";
    v38[18] = &unk_1F0BF7C68;
    v38[19] = &unk_1F0BF7C80;
    v39[18] = @"TextCelebration";
    v39[19] = @"Books";
    v38[20] = &unk_1F0BF7C98;
    v38[21] = &unk_1F0BF7CB0;
    v39[20] = @"ScreenTimeEvent";
    v39[21] = @"SoConEvent";
    v38[22] = &unk_1F0BF7CC8;
    v38[23] = &unk_1F0BF7CE0;
    v39[22] = @"LifeEvent";
    v39[23] = @"PDenEvent";
    BOOL v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:24];
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v16, "category"));
    uint64_t v25 = [v17 objectForKeyedSubscript:v19];
    char v29 = 0;
    uint64_t v21 = 0;
    unsigned int v24 = 0;
  }

  LODWORD(v27) = a9;
  id v36 = -[BMMomentsEventData initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:](self, "initWithEvent:bundle:isBundle:IHAState:age:ageRange:biologicalSex:startDate:endDate:categoryOfEvent:bundleInterface:bundleEvergreenType:sugSeetEngType:appEntryEngType:megaSignalTypeUsed:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:", v30, v15, v32, v33, v34, a8, v27, v37, v31, v25, v29, 0, v21, v24, 0,
          0,
          0);

  return v36;
}

@end