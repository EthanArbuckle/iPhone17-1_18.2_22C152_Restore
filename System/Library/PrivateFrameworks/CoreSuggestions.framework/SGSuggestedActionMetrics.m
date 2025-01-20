@interface SGSuggestedActionMetrics
+ (id)instance;
+ (void)recordBannerConfirmedWithContact:(id)a3 proposedCNContact:(id)a4 confirmedCNContact:(id)a5 inApp:(SGMBannerDisplayApp_)a6 confirmationUI:(int)a7 pet2Tracker:(id)a8;
+ (void)recordBannerConfirmedWithEvent:(id)a3 proposedEKEvent:(id)a4 confirmedEKEvent:(id)a5 inApp:(SGMBannerDisplayApp_)a6;
+ (void)recordBannerRejectedWithEvent:(id)a3 inApp:(SGMBannerDisplayApp_)a4;
+ (void)recordBannerShownWithContacts:(id)a3 events:(id)a4 inApp:(SGMBannerDisplayApp_)a5;
+ (void)recordContactDetailEngagementWithResolution:(int64_t)a3 detailType:(SGMContactDetailType_)a4 extractionType:(unint64_t)a5 modelVersion:(id)a6 confirmRejectUI:(int)a7 pet2Tracker:(id)a8;
+ (void)recordContactDetailUsage:(id)a3 withApp:(id)a4;
+ (void)recordConversationTurnWithContact:(id)a3 received:(BOOL)a4 curated:(BOOL)a5 throughApp:(id)a6 withDetailName:(id)a7 withDetailExtraction:(id)a8;
+ (void)recordMaybeContactFrom:(unint64_t)a3 withVersion:(id)a4;
+ (void)recordRejectedContact:(id)a3 inApp:(SGMBannerDisplayApp_)a4 rejectionUI:(int)a5 pet2Tracker:(id)a6;
- (SGMContactConfirmed)contactConfirmed;
- (SGMContactDetailConfirmed)contactDetailConfirmed;
- (SGMContactDetailConversationTurn)contactDetailConversationTurn;
- (SGMContactDetailRejected)contactDetailRejected;
- (SGMContactDetailUsed)contactDetailUsed;
- (SGMContactInBanner)contactInBanner;
- (SGMContactRejected)contactRejected;
- (SGMEventBannerConfirmed)eventBannerConfirmed;
- (SGMEventBannerRejected)eventBannerRejected;
- (SGMEventInBanner)eventInBanner;
- (SGMMaybeInformationShown)maybeInformationShown;
- (SGMUnknownContactInformationShown)unknownContactInformationShown;
- (SGSuggestedActionMetrics)init;
- (void)setContactConfirmed:(id)a3;
- (void)setContactDetailConfirmed:(id)a3;
- (void)setContactDetailConversationTurn:(id)a3;
- (void)setContactDetailRejected:(id)a3;
- (void)setContactDetailUsed:(id)a3;
- (void)setContactInBanner:(id)a3;
- (void)setContactRejected:(id)a3;
- (void)setEventBannerConfirmed:(id)a3;
- (void)setEventBannerRejected:(id)a3;
- (void)setEventInBanner:(id)a3;
- (void)setMaybeInformationShown:(id)a3;
- (void)setUnknownContactInformationShown:(id)a3;
@end

@implementation SGSuggestedActionMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactDetailConversationTurn, 0);
  objc_storeStrong((id *)&self->_unknownContactInformationShown, 0);
  objc_storeStrong((id *)&self->_maybeInformationShown, 0);
  objc_storeStrong((id *)&self->_eventBannerRejected, 0);
  objc_storeStrong((id *)&self->_eventBannerConfirmed, 0);
  objc_storeStrong((id *)&self->_eventInBanner, 0);
  objc_storeStrong((id *)&self->_contactDetailUsed, 0);
  objc_storeStrong((id *)&self->_contactDetailRejected, 0);
  objc_storeStrong((id *)&self->_contactDetailConfirmed, 0);
  objc_storeStrong((id *)&self->_contactRejected, 0);
  objc_storeStrong((id *)&self->_contactConfirmed, 0);

  objc_storeStrong((id *)&self->_contactInBanner, 0);
}

- (void)setContactDetailConversationTurn:(id)a3
{
}

- (SGMContactDetailConversationTurn)contactDetailConversationTurn
{
  return self->_contactDetailConversationTurn;
}

- (void)setUnknownContactInformationShown:(id)a3
{
}

- (SGMUnknownContactInformationShown)unknownContactInformationShown
{
  return self->_unknownContactInformationShown;
}

- (void)setMaybeInformationShown:(id)a3
{
}

- (SGMMaybeInformationShown)maybeInformationShown
{
  return self->_maybeInformationShown;
}

- (void)setEventBannerRejected:(id)a3
{
}

- (SGMEventBannerRejected)eventBannerRejected
{
  return self->_eventBannerRejected;
}

- (void)setEventBannerConfirmed:(id)a3
{
}

- (SGMEventBannerConfirmed)eventBannerConfirmed
{
  return self->_eventBannerConfirmed;
}

- (void)setEventInBanner:(id)a3
{
}

- (SGMEventInBanner)eventInBanner
{
  return self->_eventInBanner;
}

- (void)setContactDetailUsed:(id)a3
{
}

- (SGMContactDetailUsed)contactDetailUsed
{
  return self->_contactDetailUsed;
}

- (void)setContactDetailRejected:(id)a3
{
}

- (SGMContactDetailRejected)contactDetailRejected
{
  return self->_contactDetailRejected;
}

- (void)setContactDetailConfirmed:(id)a3
{
}

- (SGMContactDetailConfirmed)contactDetailConfirmed
{
  return self->_contactDetailConfirmed;
}

- (void)setContactRejected:(id)a3
{
}

- (SGMContactRejected)contactRejected
{
  return self->_contactRejected;
}

- (void)setContactConfirmed:(id)a3
{
}

- (SGMContactConfirmed)contactConfirmed
{
  return self->_contactConfirmed;
}

- (void)setContactInBanner:(id)a3
{
}

- (SGMContactInBanner)contactInBanner
{
  return self->_contactInBanner;
}

- (SGSuggestedActionMetrics)init
{
  v15.receiver = self;
  v15.super_class = (Class)SGSuggestedActionMetrics;
  v2 = [(SGSuggestedActionMetrics *)&v15 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(SGSuggestedActionMetrics *)v2 setContactInBanner:v3];

    v4 = objc_opt_new();
    [(SGSuggestedActionMetrics *)v2 setContactConfirmed:v4];

    v5 = objc_opt_new();
    [(SGSuggestedActionMetrics *)v2 setContactRejected:v5];

    v6 = objc_opt_new();
    [(SGSuggestedActionMetrics *)v2 setContactDetailConfirmed:v6];

    v7 = objc_opt_new();
    [(SGSuggestedActionMetrics *)v2 setContactDetailRejected:v7];

    v8 = objc_opt_new();
    [(SGSuggestedActionMetrics *)v2 setEventInBanner:v8];

    v9 = objc_opt_new();
    [(SGSuggestedActionMetrics *)v2 setEventBannerConfirmed:v9];

    v10 = objc_opt_new();
    [(SGSuggestedActionMetrics *)v2 setEventBannerRejected:v10];

    v11 = objc_opt_new();
    [(SGSuggestedActionMetrics *)v2 setMaybeInformationShown:v11];

    v12 = objc_opt_new();
    [(SGSuggestedActionMetrics *)v2 setContactDetailUsed:v12];

    v13 = objc_opt_new();
    [(SGSuggestedActionMetrics *)v2 setContactDetailConversationTurn:v13];
  }
  return v2;
}

+ (void)recordConversationTurnWithContact:(id)a3 received:(BOOL)a4 curated:(BOOL)a5 throughApp:(id)a6 withDetailName:(id)a7 withDetailExtraction:(id)a8
{
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v28 = a3;
  id v14 = a8;
  id v15 = a7;
  uint64_t v16 = contactDetailUsedAppFromBundle(a6);
  v17 = [a1 instance];
  v18 = [v17 contactDetailConversationTurn];
  if (v28)
  {
    uint64_t v26 = mapDetailExtractionType([v14 extractionType]);
    unint64_t HasSelfIdPhrase = realTimeContactHasSelfIdPhrase(v28);
    [v14 modelVersion];
    v20 = id v27 = v14;
    uint64_t v21 = [v20 unsignedIntegerValue];
    BOOL v22 = v11;
    uint64_t v23 = contactDetailTypeFromDetailName(v15);

    [v18 trackEventWithScalar:1 detailExtraction:v26 selfIdName:HasSelfIdPhrase extractionModelVersion:v21 receivedConverstationTurn:v12 knownSuggestedContactDetail:1 curatedContactDetail:v22 throughApp:v16 contactDetailUsed:v23];
    id v14 = v27;
  }
  else
  {
    BOOL v24 = v11;
    uint64_t v25 = contactDetailTypeFromDetailName(v15);

    [v18 trackEventWithScalar:1 detailExtraction:6 selfIdName:0 extractionModelVersion:0 receivedConverstationTurn:v12 knownSuggestedContactDetail:0 curatedContactDetail:v24 throughApp:v16 contactDetailUsed:v25];
  }
}

+ (void)recordContactDetailUsage:(id)a3 withApp:(id)a4
{
  id v6 = a4;
  uint64_t v7 = contactDetailTypeFromDetailName(a3);
  uint64_t v8 = contactDetailUsedAppFromBundle(v6);

  v9 = [a1 instance];
  v10 = [v9 contactDetailUsed];
  [v10 trackEventWithScalar:1 app:v8 type:v7];

  id v16 = (id)objc_opt_new();
  [v16 setApp:v8];
  [v16 setType:v7];
  BOOL v11 = [MEMORY[0x1E4F93728] sharedInstance];
  [v11 trackScalarForMessage:v16];

  id v12 = [NSString alloc];
  v13 = [v16 key];
  id v14 = (void *)[v12 initWithFormat:@"%@.%@", @"com.apple.Proactive.CoreSuggestions", v13];

  id v15 = [v16 dictionaryRepresentation];
  AnalyticsSendEvent();
}

+ (void)recordContactDetailEngagementWithResolution:(int64_t)a3 detailType:(SGMContactDetailType_)a4 extractionType:(unint64_t)a5 modelVersion:(id)a6 confirmRejectUI:(int)a7 pet2Tracker:(id)a8
{
  uint64_t v8 = *(void *)&a7;
  id v14 = a8;
  id v15 = a6;
  id v16 = [a1 instance];
  v17 = v16;
  if (a3) {
    [v16 contactDetailRejected];
  }
  else {
  v18 = [v16 contactDetailConfirmed];
  }
  objc_msgSend(v18, "trackEventWithScalar:type:extracted:extractionModelVersion:", 1, a4.var0, mapDetailExtractionType(a5), objc_msgSend(v15, "unsignedIntegerValue"));

  id v24 = (id)objc_opt_new();
  [v24 setType:a4.var0];
  [v24 setExtracted:mapDetailExtractionType(a5)];
  uint64_t v19 = [v15 unsignedIntValue];

  [v24 setExtractionModelVersion:v19];
  [v24 setUiType:v8];
  [v14 trackScalarForMessage:v24];

  id v20 = [NSString alloc];
  uint64_t v21 = [v24 key];
  BOOL v22 = (void *)[v20 initWithFormat:@"%@.%@", @"com.apple.Proactive.CoreSuggestions", v21];

  uint64_t v23 = [v24 dictionaryRepresentation];
  AnalyticsSendEvent();
}

+ (void)recordBannerRejectedWithEvent:(id)a3 inApp:(SGMBannerDisplayApp_)a4
{
  id v25 = a3;
  id v6 = [v25 event];
  char v7 = [v6 isNaturalLanguageEvent];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [a1 instance];
    v9 = [v8 eventBannerRejected];
    v10 = [v25 event];
    BOOL v11 = [v10 tags];
    uint64_t v12 = tagsToEventCategory(v11);
    v13 = [v25 event];
    id v14 = [v13 tags];
    [v9 trackEventWithScalar:1 app:a4.var0 category:v12 extracted:tagsToEventExtraction(v14)];

    id v15 = objc_opt_new();
    [v15 setApp:a4.var0];
    id v16 = [v25 event];
    v17 = [v16 tags];
    [v15 setCategory:tagsToEventCategory(v17)];

    v18 = [v25 event];
    uint64_t v19 = [v18 tags];
    [v15 setExtracted:tagsToEventExtraction(v19)];

    id v20 = [MEMORY[0x1E4F93728] sharedInstance];
    [v20 trackScalarForMessage:v15];

    id v21 = [NSString alloc];
    BOOL v22 = [v15 key];
    uint64_t v23 = (void *)[v21 initWithFormat:@"%@.%@", @"com.apple.Proactive.CoreSuggestions", v22];

    id v24 = [v15 dictionaryRepresentation];
    AnalyticsSendEvent();
  }
}

+ (void)recordBannerConfirmedWithEvent:(id)a3 proposedEKEvent:(id)a4 confirmedEKEvent:(id)a5 inApp:(SGMBannerDisplayApp_)a6
{
  id v52 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v52 event];
  char v13 = [v12 isNaturalLanguageEvent];

  if ((v13 & 1) == 0)
  {
    v14.unint64_t var0 = 0;
    unint64_t var0 = a6.var0;
    if (v10)
    {
      v51.unint64_t var0 = 0;
      v15.unint64_t var0 = 0;
      if (v11)
      {
        id v16 = [v10 title];
        v17 = [v11 title];
        v15.unint64_t var0 = (unint64_t)+[SGNLEventSuggestionsMetrics diffEventTitleChangedFrom:v16 to:v17];

        v18 = [v10 startDate];
        uint64_t v19 = [v10 timeZone];
        id v20 = [v11 startDate];
        id v21 = [v11 timeZone];
        v51.unint64_t var0 = (unint64_t)+[SGNLEventSuggestionsMetrics diffEventStartDateChangedFrom:v18 oldTimeZone:v19 to:v20 newTimeZone:v21];

        [v10 duration];
        double v23 = v22;
        [v11 duration];
        v14.unint64_t var0 = (unint64_t)+[SGNLEventSuggestionsMetrics diffEventDurationChangedFrom:v23 to:v24];
      }
    }
    else
    {
      v51.unint64_t var0 = 0;
      v15.unint64_t var0 = 0;
    }
    v48 = [a1 instance];
    id v25 = [v48 eventBannerConfirmed];
    uint64_t v26 = [v52 event];
    id v27 = [v26 tags];
    unint64_t v49 = v15.var0;
    uint64_t v47 = tagsToEventCategory(v27);
    id v28 = [v52 event];
    [v28 tags];
    id v29 = v10;
    v31 = id v30 = v11;
    uint64_t v32 = tagsToEventExtraction(v31);
    int v33 = [v52 state];
    if (v33 == 3) {
      uint64_t v34 = 1;
    }
    else {
      uint64_t v34 = 2 * (v33 != 2);
    }
    [v25 trackEventWithScalar:1 app:var0 category:v47 extracted:v32 state:v34 titleAdj:v15.var0 dateAdj:v51.var0 duraAdj:v14.var0];

    id v11 = v30;
    id v10 = v29;

    v35 = objc_opt_new();
    [v35 setApp:var0];
    v36 = [v52 event];
    v37 = [v36 tags];
    [v35 setCategory:tagsToEventCategory(v37)];

    v38 = [v52 event];
    v39 = [v38 tags];
    [v35 setExtracted:tagsToEventExtraction(v39)];

    int v40 = [v52 state];
    if (v40 == 3) {
      uint64_t v41 = 1;
    }
    else {
      uint64_t v41 = 2 * (v40 != 2);
    }
    [v35 setState:v41];
    [v35 setTitleAdj:v49];
    [v35 setDateAdj:v51.var0];
    [v35 setDuraAdj:v14.var0];
    v42 = [MEMORY[0x1E4F93728] sharedInstance];
    [v42 trackScalarForMessage:v35];

    id v43 = [NSString alloc];
    v44 = [v35 key];
    v45 = (void *)[v43 initWithFormat:@"%@.%@", @"com.apple.Proactive.CoreSuggestions", v44];

    v46 = [v35 dictionaryRepresentation];
    AnalyticsSendEvent();
  }
}

+ (void)recordRejectedContact:(id)a3 inApp:(SGMBannerDisplayApp_)a4 rejectionUI:(int)a5 pet2Tracker:(id)a6
{
  id v9 = a6;
  id v10 = a3;
  id v11 = [v10 extractionInfo];
  uint64_t v12 = [v11 extractionType];
  if ((unint64_t)(v12 - 1) > 2) {
    char v13 = &SGMBannerExtractionTypeOther;
  }
  else {
    char v13 = (uint64_t *)*(&off_1E5B90100 + v12 - 1);
  }
  uint64_t v14 = *v13;

  unint64_t HasSelfIdPhrase = realTimeContactHasSelfIdPhrase(v10);
  id v16 = [a1 instance];
  v17 = [v16 contactRejected];
  v18 = [v10 extractionInfo];
  uint64_t v19 = [v18 modelVersion];
  objc_msgSend(v17, "trackEventWithScalar:app:extracted:selfId:extractionModelVersion:contactDetail:", 1, a4.var0, v14, HasSelfIdPhrase, objc_msgSend(v19, "unsignedIntegerValue"), detailTypeFromSGContact(v10));

  id v28 = (id)objc_opt_new();
  [v28 setApp:a4.var0];
  [v28 setExtracted:v14];
  [v28 setSelfId:HasSelfIdPhrase != 0];
  id v20 = [v10 extractionInfo];
  id v21 = [v20 modelVersion];
  objc_msgSend(v28, "setExtractionModelVersion:", objc_msgSend(v21, "unsignedIntValue"));

  uint64_t v22 = detailTypeFromSGContact(v10);
  [v28 setType:v22];
  [v28 setUiType:a5];
  [v9 trackScalarForMessage:v28];

  id v23 = [NSString alloc];
  double v24 = [v28 key];
  id v25 = (void *)[v23 initWithFormat:@"%@.%@", @"com.apple.Proactive.CoreSuggestions", v24];

  uint64_t v26 = [v28 dictionaryRepresentation];
  AnalyticsSendEvent();
}

+ (void)recordBannerConfirmedWithContact:(id)a3 proposedCNContact:(id)a4 confirmedCNContact:(id)a5 inApp:(SGMBannerDisplayApp_)a6 confirmationUI:(int)a7 pet2Tracker:(id)a8
{
  id v12 = a3;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __131__SGSuggestedActionMetrics_recordBannerConfirmedWithContact_proposedCNContact_confirmedCNContact_inApp_confirmationUI_pet2Tracker___block_invoke_2;
  v53[3] = &unk_1E5B900A8;
  id v54 = &__block_literal_global_115;
  id v48 = a8;
  id v13 = a5;
  id v14 = a4;
  uint64_t v15 = MEMORY[0x1A62654A0](v53);
  unint64_t HasSelfIdPhrase = realTimeContactHasSelfIdPhrase(v12);
  id v16 = [v12 extractionInfo];
  uint64_t v17 = [v16 extractionType];
  if ((unint64_t)(v17 - 1) > 2) {
    v18 = &SGMBannerExtractionTypeOther;
  }
  else {
    v18 = (uint64_t *)*(&off_1E5B90100 + v17 - 1);
  }
  uint64_t v51 = *v18;

  BOOL v50 = [v12 state] == 2;
  v46 = [a1 instance];
  v42 = [v46 contactConfirmed];
  v45 = [v14 givenName];
  id v43 = [v13 givenName];
  uint64_t v19 = (uint64_t (**)(void *, void *, void *))(v15 + 16);
  uint64_t v39 = (*(uint64_t (**)(uint64_t, void *, void *))(v15 + 16))(v15, v45, v43);
  uint64_t v41 = [v14 familyName];
  int v40 = [v13 familyName];
  v44 = (void *)v15;
  uint64_t v38 = (*(uint64_t (**)(uint64_t, void *, void *))(v15 + 16))(v15, v41, v40);
  id v20 = [v14 middleName];
  id v21 = [v13 middleName];
  uint64_t v22 = (*v19)(v44, v20, v21);
  id v23 = [v12 extractionInfo];
  double v24 = [v23 modelVersion];
  objc_msgSend(v42, "trackEventWithScalar:app:firstNameAdj:lastNameAdj:middleNameAdj:isUpdate:extracted:extractionModelVersion:selfId:contactDetail:", 1, a6.var0, v39, v38, v22, v50, v51, objc_msgSend(v24, "unsignedIntegerValue"), HasSelfIdPhrase, detailTypeFromSGContact(v12));

  id v25 = objc_opt_new();
  [v25 setApp:a6.var0];
  uint64_t v26 = [v14 givenName];
  id v27 = [v13 givenName];
  objc_msgSend(v25, "setFirstNameAdj:", (*v19)(v44, v26, v27) != 0);

  id v28 = [v14 familyName];
  id v29 = [v13 familyName];
  objc_msgSend(v25, "setLastNameAdj:", (*v19)(v44, v28, v29) != 0);

  id v30 = [v14 middleName];

  v31 = [v13 middleName];

  objc_msgSend(v25, "setMiddleNameAdj:", (*v19)(v44, v30, v31) != 0);
  [v25 setIsUpdate:v50];
  [v25 setExtracted:v51];
  uint64_t v32 = [v12 extractionInfo];
  int v33 = [v32 modelVersion];
  objc_msgSend(v25, "setExtractionModelVersion:", objc_msgSend(v33, "unsignedIntValue"));

  [v25 setSelfId:HasSelfIdPhrase != 0];
  [v25 setType:detailTypeFromSGContact(v12)];
  [v25 setUiType:a7];
  [v48 trackScalarForMessage:v25];

  id v34 = [NSString alloc];
  v35 = [v25 key];
  v36 = (void *)[v34 initWithFormat:@"%@.%@", @"com.apple.Proactive.CoreSuggestions", v35];

  v37 = [v25 dictionaryRepresentation];
  AnalyticsSendEvent();
}

uint64_t __131__SGSuggestedActionMetrics_recordBannerConfirmedWithContact_proposedCNContact_confirmedCNContact_inApp_confirmationUI_pet2Tracker___block_invoke_2(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

uint64_t __131__SGSuggestedActionMetrics_recordBannerConfirmedWithContact_proposedCNContact_confirmedCNContact_inApp_confirmationUI_pet2Tracker___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 | a3) {
    return objc_msgSend((id)a2, "isEqualToString:");
  }
  else {
    return 1;
  }
}

+ (void)recordBannerShownWithContacts:(id)a3 events:(id)a4 inApp:(SGMBannerDisplayApp_)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  obuint64_t j = a3;
  id v54 = a4;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v58 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (v58)
  {
    uint64_t v56 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v58; ++i)
      {
        if (*(void *)v67 != v56) {
          objc_enumerationMutation(obj);
        }
        char v7 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        uint64_t v8 = [v7 extractionInfo];
        uint64_t v9 = [v8 extractionType];
        id v10 = &SGMBannerExtractionTypeOther;
        if ((unint64_t)(v9 - 1) <= 2) {
          id v10 = (uint64_t *)*(&off_1E5B90100 + v9 - 1);
        }
        uint64_t v11 = *v10;

        unint64_t HasSelfIdPhrase = realTimeContactHasSelfIdPhrase(v7);
        id v13 = [a1 instance];
        id v14 = [v13 contactInBanner];
        uint64_t v15 = [v7 extractionInfo];
        id v16 = [v15 modelVersion];
        objc_msgSend(v14, "trackEventWithScalar:app:extracted:selfId:extractionModelVersion:contactDetail:", 1, a5.var0, v11, HasSelfIdPhrase, objc_msgSend(v16, "unsignedIntegerValue"), detailTypeFromSGContact(v7));

        uint64_t v17 = objc_opt_new();
        [v17 setApp:a5.var0];
        [v17 setExtracted:v11];
        [v17 setSelfId:HasSelfIdPhrase != 0];
        [v17 setType:v11];
        v18 = [v7 extractionInfo];
        uint64_t v19 = [v18 modelVersion];
        objc_msgSend(v17, "setExtractionModelVersion:", objc_msgSend(v19, "unsignedIntValue"));

        id v20 = [MEMORY[0x1E4F93728] sharedInstance];
        [v20 trackScalarForMessage:v17];

        id v21 = [NSString alloc];
        uint64_t v22 = [v17 key];
        id v23 = (void *)[v21 initWithFormat:@"%@.%@", @"com.apple.Proactive.CoreSuggestions", v22];

        double v24 = [v17 dictionaryRepresentation];
        AnalyticsSendEvent();
      }
      uint64_t v58 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
    }
    while (v58);
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v52 = v54;
  uint64_t v25 = [v52 countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v63 != v27) {
          objc_enumerationMutation(v52);
        }
        id v29 = *(void **)(*((void *)&v62 + 1) + 8 * j);
        id v30 = [v29 event];
        char v31 = [v30 isNaturalLanguageEvent];

        if ((v31 & 1) == 0)
        {
          v59 = [a1 instance];
          uint64_t v32 = [v59 eventInBanner];
          v57 = [v29 event];
          int v33 = [v57 tags];
          uint64_t v55 = tagsToEventCategory(v33);
          id v34 = [v29 event];
          [v34 tags];
          v36 = uint64_t v35 = v27;
          uint64_t v37 = tagsToEventExtraction(v36);
          int v38 = [v29 state];
          if (v38 == 3) {
            uint64_t v39 = 1;
          }
          else {
            uint64_t v39 = 2 * (v38 != 2);
          }
          [v32 trackEventWithScalar:1 app:a5.var0 category:v55 extracted:v37 state:v39];

          uint64_t v27 = v35;
          int v40 = objc_opt_new();
          [v40 setApp:a5.var0];
          uint64_t v41 = [v29 event];
          v42 = [v41 tags];
          [v40 setCategory:tagsToEventCategory(v42)];

          id v43 = [v29 event];
          v44 = [v43 tags];
          [v40 setExtracted:tagsToEventExtraction(v44)];

          int v45 = [v29 state];
          if (v45 == 3) {
            uint64_t v46 = 1;
          }
          else {
            uint64_t v46 = 2 * (v45 != 2);
          }
          [v40 setState:v46];
          uint64_t v47 = [MEMORY[0x1E4F93728] sharedInstance];
          [v47 trackScalarForMessage:v40];

          id v48 = [NSString alloc];
          unint64_t v49 = [v40 key];
          BOOL v50 = (void *)[v48 initWithFormat:@"%@.%@", @"com.apple.Proactive.CoreSuggestions", v49];

          uint64_t v51 = [v40 dictionaryRepresentation];
          AnalyticsSendEvent();
        }
      }
      uint64_t v26 = [v52 countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v26);
  }
}

+ (void)recordMaybeContactFrom:(unint64_t)a3 withVersion:(id)a4
{
  id v18 = a4;
  id v6 = [a1 instance];
  char v7 = [v6 maybeInformationShown];
  unint64_t v8 = a3 - 1;
  if (a3 - 1 > 2) {
    uint64_t v9 = &SGMBannerExtractionTypeOther;
  }
  else {
    uint64_t v9 = (uint64_t *)*(&off_1E5B90100 + v8);
  }
  objc_msgSend(v7, "trackEventWithScalar:extracted:extractionModelVersion:", 1, *v9, objc_msgSend(v18, "unsignedIntegerValue"));

  id v10 = objc_opt_new();
  uint64_t v11 = v10;
  if (v8 > 2) {
    id v12 = (unsigned int *)&SGMBannerExtractionTypeOther;
  }
  else {
    id v12 = (unsigned int *)*(&off_1E5B90100 + v8);
  }
  [v10 setExtracted:*v12];
  objc_msgSend(v11, "setExtractionModelVersion:", objc_msgSend(v18, "unsignedIntValue"));
  id v13 = [MEMORY[0x1E4F93728] sharedInstance];
  [v13 trackScalarForMessage:v11];

  id v14 = [NSString alloc];
  uint64_t v15 = [v11 key];
  id v16 = (void *)[v14 initWithFormat:@"%@.%@", @"com.apple.Proactive.CoreSuggestions", v15];

  uint64_t v17 = [v11 dictionaryRepresentation];
  AnalyticsSendEvent();
}

+ (id)instance
{
  if (instance_onceToken_94 != -1) {
    dispatch_once(&instance_onceToken_94, &__block_literal_global_96);
  }
  v2 = (void *)instance__instance_93;

  return v2;
}

uint64_t __36__SGSuggestedActionMetrics_instance__block_invoke()
{
  instance__instance_93 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end