@interface BMMomentsEngagement
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMomentsEngagement)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMomentsEngagement)initWithSuggestionEvent:(id)a3 entryEvent:(id)a4 clientActivityEvent:(id)a5;
- (BMMomentsEngagement)initWithSuggestionEvent:(id)a3 entryEvent:(id)a4 clientActivityEvent:(id)a5 onboardingFlowCompletionState:(int)a6 isJournalAppInstalled:(id)a7 isJournalAppLocked:(id)a8 isJournalSuggestionSkipped:(id)a9 isActivitySettingsSwitchEnabled:(id)a10 isCommunicationSettingsSwitchEnabled:(id)a11 isSignificantLocationSettingsSwitchEnabled:(id)a12 isMediaSettingsSwitchEnabled:(id)a13 isNearbyPeopleSettingsSwitchEnabled:(id)a14 isPhotoSettingsSwitchEnabled:(id)a15 isStateOfMindSettingsSwitchEnabled:(id)a16 isReflectionSettingsSwitchEnabled:(id)a17 isBroadSystemLocationSettingsSwitchEnabled:(id)a18;
- (BMMomentsEngagementAppEntryEvent)entryEvent;
- (BMMomentsEngagementClientActivityEvent)clientActivityEvent;
- (BMMomentsEngagementSuggestionEvent)suggestionEvent;
- (BOOL)hasIsActivitySettingsSwitchEnabled;
- (BOOL)hasIsBroadSystemLocationSettingsSwitchEnabled;
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
- (BOOL)isActivitySettingsSwitchEnabled;
- (BOOL)isBroadSystemLocationSettingsSwitchEnabled;
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
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)onboardingFlowCompletionState;
- (unsigned)dataVersion;
- (void)setHasIsActivitySettingsSwitchEnabled:(BOOL)a3;
- (void)setHasIsBroadSystemLocationSettingsSwitchEnabled:(BOOL)a3;
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
- (void)writeTo:(id)a3;
@end

@implementation BMMomentsEngagement

- (BMMomentsEngagement)initWithSuggestionEvent:(id)a3 entryEvent:(id)a4 clientActivityEvent:(id)a5
{
  return -[BMMomentsEngagement initWithSuggestionEvent:entryEvent:clientActivityEvent:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:](self, "initWithSuggestionEvent:entryEvent:clientActivityEvent:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:", a3, a4, a5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientActivityEvent, 0);
  objc_storeStrong((id *)&self->_entryEvent, 0);

  objc_storeStrong((id *)&self->_suggestionEvent, 0);
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

- (BMMomentsEngagementClientActivityEvent)clientActivityEvent
{
  return self->_clientActivityEvent;
}

- (BMMomentsEngagementAppEntryEvent)entryEvent
{
  return self->_entryEvent;
}

- (BMMomentsEngagementSuggestionEvent)suggestionEvent
{
  return self->_suggestionEvent;
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
    v6 = [(BMMomentsEngagement *)self suggestionEvent];
    uint64_t v7 = [v5 suggestionEvent];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMomentsEngagement *)self suggestionEvent];
      v10 = [v5 suggestionEvent];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_76;
      }
    }
    v13 = [(BMMomentsEngagement *)self entryEvent];
    uint64_t v14 = [v5 entryEvent];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMomentsEngagement *)self entryEvent];
      v17 = [v5 entryEvent];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_76;
      }
    }
    v19 = [(BMMomentsEngagement *)self clientActivityEvent];
    uint64_t v20 = [v5 clientActivityEvent];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMMomentsEngagement *)self clientActivityEvent];
      v23 = [v5 clientActivityEvent];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_76;
      }
    }
    int v25 = [(BMMomentsEngagement *)self onboardingFlowCompletionState];
    if (v25 == [v5 onboardingFlowCompletionState])
    {
      if (![(BMMomentsEngagement *)self hasIsJournalAppInstalled]
        && ![v5 hasIsJournalAppInstalled]
        || [(BMMomentsEngagement *)self hasIsJournalAppInstalled]
        && [v5 hasIsJournalAppInstalled]
        && (int v26 = [(BMMomentsEngagement *)self isJournalAppInstalled],
            v26 == [v5 isJournalAppInstalled]))
      {
        if (![(BMMomentsEngagement *)self hasIsJournalAppLocked]
          && ![v5 hasIsJournalAppLocked]
          || [(BMMomentsEngagement *)self hasIsJournalAppLocked]
          && [v5 hasIsJournalAppLocked]
          && (int v27 = [(BMMomentsEngagement *)self isJournalAppLocked],
              v27 == [v5 isJournalAppLocked]))
        {
          if (![(BMMomentsEngagement *)self hasIsJournalSuggestionSkipped]
            && ![v5 hasIsJournalSuggestionSkipped]
            || [(BMMomentsEngagement *)self hasIsJournalSuggestionSkipped]
            && [v5 hasIsJournalSuggestionSkipped]
            && (int v28 = [(BMMomentsEngagement *)self isJournalSuggestionSkipped],
                v28 == [v5 isJournalSuggestionSkipped]))
          {
            if (![(BMMomentsEngagement *)self hasIsActivitySettingsSwitchEnabled]
              && ![v5 hasIsActivitySettingsSwitchEnabled]
              || [(BMMomentsEngagement *)self hasIsActivitySettingsSwitchEnabled]
              && [v5 hasIsActivitySettingsSwitchEnabled]
              && (int v29 = [(BMMomentsEngagement *)self isActivitySettingsSwitchEnabled],
                  v29 == [v5 isActivitySettingsSwitchEnabled]))
            {
              if (!-[BMMomentsEngagement hasIsCommunicationSettingsSwitchEnabled](self, "hasIsCommunicationSettingsSwitchEnabled")&& ![v5 hasIsCommunicationSettingsSwitchEnabled]|| -[BMMomentsEngagement hasIsCommunicationSettingsSwitchEnabled](self, "hasIsCommunicationSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsCommunicationSettingsSwitchEnabled")&& (int v30 = -[BMMomentsEngagement isCommunicationSettingsSwitchEnabled](self, "isCommunicationSettingsSwitchEnabled"), v30 == objc_msgSend(v5, "isCommunicationSettingsSwitchEnabled")))
              {
                if (!-[BMMomentsEngagement hasIsSignificantLocationSettingsSwitchEnabled](self, "hasIsSignificantLocationSettingsSwitchEnabled")&& ![v5 hasIsSignificantLocationSettingsSwitchEnabled]|| -[BMMomentsEngagement hasIsSignificantLocationSettingsSwitchEnabled](self, "hasIsSignificantLocationSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsSignificantLocationSettingsSwitchEnabled")&& (int v31 = -[BMMomentsEngagement isSignificantLocationSettingsSwitchEnabled](self, "isSignificantLocationSettingsSwitchEnabled"), v31 == objc_msgSend(v5, "isSignificantLocationSettingsSwitchEnabled")))
                {
                  if (![(BMMomentsEngagement *)self hasIsMediaSettingsSwitchEnabled]
                    && ![v5 hasIsMediaSettingsSwitchEnabled]
                    || [(BMMomentsEngagement *)self hasIsMediaSettingsSwitchEnabled]
                    && [v5 hasIsMediaSettingsSwitchEnabled]
                    && (int v32 = [(BMMomentsEngagement *)self isMediaSettingsSwitchEnabled],
                        v32 == [v5 isMediaSettingsSwitchEnabled]))
                  {
                    if (!-[BMMomentsEngagement hasIsNearbyPeopleSettingsSwitchEnabled](self, "hasIsNearbyPeopleSettingsSwitchEnabled")&& ![v5 hasIsNearbyPeopleSettingsSwitchEnabled]|| -[BMMomentsEngagement hasIsNearbyPeopleSettingsSwitchEnabled](self, "hasIsNearbyPeopleSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsNearbyPeopleSettingsSwitchEnabled")&& (int v33 = -[BMMomentsEngagement isNearbyPeopleSettingsSwitchEnabled](self, "isNearbyPeopleSettingsSwitchEnabled"), v33 == objc_msgSend(v5, "isNearbyPeopleSettingsSwitchEnabled")))
                    {
                      if (!-[BMMomentsEngagement hasIsPhotoSettingsSwitchEnabled](self, "hasIsPhotoSettingsSwitchEnabled")&& ![v5 hasIsPhotoSettingsSwitchEnabled]|| -[BMMomentsEngagement hasIsPhotoSettingsSwitchEnabled](self, "hasIsPhotoSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsPhotoSettingsSwitchEnabled")&& (int v34 = -[BMMomentsEngagement isPhotoSettingsSwitchEnabled](self, "isPhotoSettingsSwitchEnabled"), v34 == objc_msgSend(v5, "isPhotoSettingsSwitchEnabled")))
                      {
                        if (!-[BMMomentsEngagement hasIsStateOfMindSettingsSwitchEnabled](self, "hasIsStateOfMindSettingsSwitchEnabled")&& ![v5 hasIsStateOfMindSettingsSwitchEnabled]|| -[BMMomentsEngagement hasIsStateOfMindSettingsSwitchEnabled](self, "hasIsStateOfMindSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsStateOfMindSettingsSwitchEnabled")&& (int v35 = -[BMMomentsEngagement isStateOfMindSettingsSwitchEnabled](self, "isStateOfMindSettingsSwitchEnabled"), v35 == objc_msgSend(v5, "isStateOfMindSettingsSwitchEnabled")))
                        {
                          if (!-[BMMomentsEngagement hasIsReflectionSettingsSwitchEnabled](self, "hasIsReflectionSettingsSwitchEnabled")&& ![v5 hasIsReflectionSettingsSwitchEnabled]|| -[BMMomentsEngagement hasIsReflectionSettingsSwitchEnabled](self, "hasIsReflectionSettingsSwitchEnabled")&& objc_msgSend(v5, "hasIsReflectionSettingsSwitchEnabled")&& (int v36 = -[BMMomentsEngagement isReflectionSettingsSwitchEnabled](self, "isReflectionSettingsSwitchEnabled"), v36 == objc_msgSend(v5, "isReflectionSettingsSwitchEnabled")))
                          {
                            if (!-[BMMomentsEngagement hasIsBroadSystemLocationSettingsSwitchEnabled](self, "hasIsBroadSystemLocationSettingsSwitchEnabled")&& ![v5 hasIsBroadSystemLocationSettingsSwitchEnabled])
                            {
                              LOBYTE(v12) = 1;
                              goto LABEL_77;
                            }
                            if (-[BMMomentsEngagement hasIsBroadSystemLocationSettingsSwitchEnabled](self, "hasIsBroadSystemLocationSettingsSwitchEnabled")&& [v5 hasIsBroadSystemLocationSettingsSwitchEnabled])
                            {
                              BOOL v37 = [(BMMomentsEngagement *)self isBroadSystemLocationSettingsSwitchEnabled];
                              int v12 = v37 ^ [v5 isBroadSystemLocationSettingsSwitchEnabled] ^ 1;
LABEL_77:

                              goto LABEL_78;
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
LABEL_76:
    LOBYTE(v12) = 0;
    goto LABEL_77;
  }
  LOBYTE(v12) = 0;
LABEL_78:

  return v12;
}

- (id)jsonDictionary
{
  v58[16] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMomentsEngagement *)self suggestionEvent];
  uint64_t v4 = [v3 jsonDictionary];

  id v5 = [(BMMomentsEngagement *)self entryEvent];
  uint64_t v6 = [v5 jsonDictionary];

  uint64_t v7 = [(BMMomentsEngagement *)self clientActivityEvent];
  uint64_t v8 = [v7 jsonDictionary];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagement onboardingFlowCompletionState](self, "onboardingFlowCompletionState"));
  if ([(BMMomentsEngagement *)self hasIsJournalAppInstalled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isJournalAppInstalled](self, "isJournalAppInstalled"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
  if ([(BMMomentsEngagement *)self hasIsJournalAppLocked])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isJournalAppLocked](self, "isJournalAppLocked"));
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
  if ([(BMMomentsEngagement *)self hasIsJournalSuggestionSkipped])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isJournalSuggestionSkipped](self, "isJournalSuggestionSkipped"));
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }
  if ([(BMMomentsEngagement *)self hasIsActivitySettingsSwitchEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isActivitySettingsSwitchEnabled](self, "isActivitySettingsSwitchEnabled"));
    id v56 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v56 = 0;
  }
  if ([(BMMomentsEngagement *)self hasIsCommunicationSettingsSwitchEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isCommunicationSettingsSwitchEnabled](self, "isCommunicationSettingsSwitchEnabled"));
    id v55 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v55 = 0;
  }
  if ([(BMMomentsEngagement *)self hasIsSignificantLocationSettingsSwitchEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isSignificantLocationSettingsSwitchEnabled](self, "isSignificantLocationSettingsSwitchEnabled"));
    id v54 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v54 = 0;
  }
  if ([(BMMomentsEngagement *)self hasIsMediaSettingsSwitchEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isMediaSettingsSwitchEnabled](self, "isMediaSettingsSwitchEnabled"));
    id v53 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v53 = 0;
  }
  if ([(BMMomentsEngagement *)self hasIsNearbyPeopleSettingsSwitchEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isNearbyPeopleSettingsSwitchEnabled](self, "isNearbyPeopleSettingsSwitchEnabled"));
    id v52 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v52 = 0;
  }
  if ([(BMMomentsEngagement *)self hasIsPhotoSettingsSwitchEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isPhotoSettingsSwitchEnabled](self, "isPhotoSettingsSwitchEnabled"));
    id v51 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v51 = 0;
  }
  if ([(BMMomentsEngagement *)self hasIsStateOfMindSettingsSwitchEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isStateOfMindSettingsSwitchEnabled](self, "isStateOfMindSettingsSwitchEnabled"));
    id v50 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v50 = 0;
  }
  if ([(BMMomentsEngagement *)self hasIsReflectionSettingsSwitchEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isReflectionSettingsSwitchEnabled](self, "isReflectionSettingsSwitchEnabled"));
    id v49 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v49 = 0;
  }
  if ([(BMMomentsEngagement *)self hasIsBroadSystemLocationSettingsSwitchEnabled])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isBroadSystemLocationSettingsSwitchEnabled](self, "isBroadSystemLocationSettingsSwitchEnabled"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = 0;
  }
  v57[0] = @"suggestionEvent";
  uint64_t v14 = v4;
  if (!v4)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v43 = (void *)v14;
  v58[0] = v14;
  v57[1] = @"entryEvent";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v42 = (void *)v15;
  v58[1] = v15;
  v57[2] = @"clientActivityEvent";
  uint64_t v16 = v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v41 = (void *)v16;
  v58[2] = v16;
  v57[3] = @"onboardingFlowCompletionState";
  uint64_t v17 = v9;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v40 = (void *)v17;
  v58[3] = v17;
  v57[4] = @"isJournalAppInstalled";
  uint64_t v18 = (uint64_t)v10;
  if (!v10)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v39 = (void *)v18;
  v58[4] = v18;
  v57[5] = @"isJournalAppLocked";
  uint64_t v19 = (uint64_t)v11;
  if (!v11)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v38 = (void *)v19;
  v58[5] = v19;
  v57[6] = @"isJournalSuggestionSkipped";
  uint64_t v20 = (uint64_t)v12;
  if (!v12)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  BOOL v37 = (void *)v20;
  v58[6] = v20;
  v57[7] = @"isActivitySettingsSwitchEnabled";
  uint64_t v21 = (uint64_t)v56;
  if (!v56)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v58[7] = v21;
  v57[8] = @"isCommunicationSettingsSwitchEnabled";
  uint64_t v22 = (uint64_t)v55;
  if (!v55)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  int v35 = (void *)v22;
  int v36 = (void *)v21;
  v58[8] = v22;
  v57[9] = @"isSignificantLocationSettingsSwitchEnabled";
  uint64_t v23 = (uint64_t)v54;
  if (!v54)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v48 = (void *)v4;
  uint64_t v33 = v23;
  v58[9] = v23;
  v57[10] = @"isMediaSettingsSwitchEnabled";
  int v24 = v53;
  if (!v53)
  {
    int v24 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v23, v35, v21, v37, v38, v39, v40, v41, v42, v43);
  }
  v47 = v10;
  v46 = (void *)v9;
  v58[10] = v24;
  v57[11] = @"isNearbyPeopleSettingsSwitchEnabled";
  int v25 = v52;
  if (!v52)
  {
    int v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v45 = v12;
  int v26 = (void *)v6;
  v58[11] = v25;
  v57[12] = @"isPhotoSettingsSwitchEnabled";
  int v27 = v51;
  if (!v51)
  {
    int v27 = [MEMORY[0x1E4F1CA98] null];
  }
  int v28 = (void *)v8;
  v58[12] = v27;
  v57[13] = @"isStateOfMindSettingsSwitchEnabled";
  int v29 = v50;
  if (!v50)
  {
    int v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v58[13] = v29;
  v57[14] = @"isReflectionSettingsSwitchEnabled";
  int v30 = v49;
  if (!v49)
  {
    int v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v58[14] = v30;
  v57[15] = @"isBroadSystemLocationSettingsSwitchEnabled";
  int v31 = v13;
  if (!v13)
  {
    int v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v58[15] = v31;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v58, v57, 16, v33);
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13) {

  }
  if (!v49) {
  if (!v50)
  }

  if (!v51) {
  if (!v52)
  }

  if (!v53) {
  if (!v54)
  }

  if (!v55) {
  if (v56)
  }
  {
    if (v45) {
      goto LABEL_87;
    }
  }
  else
  {

    if (v45)
    {
LABEL_87:
      if (v11) {
        goto LABEL_88;
      }
      goto LABEL_98;
    }
  }

  if (v11)
  {
LABEL_88:
    if (v47) {
      goto LABEL_89;
    }
    goto LABEL_99;
  }
LABEL_98:

  if (v47)
  {
LABEL_89:
    if (v46) {
      goto LABEL_90;
    }
    goto LABEL_100;
  }
LABEL_99:

  if (v46)
  {
LABEL_90:
    if (v28) {
      goto LABEL_91;
    }
    goto LABEL_101;
  }
LABEL_100:

  if (v28)
  {
LABEL_91:
    if (v26) {
      goto LABEL_92;
    }
LABEL_102:

    if (v48) {
      goto LABEL_93;
    }
    goto LABEL_103;
  }
LABEL_101:

  if (!v26) {
    goto LABEL_102;
  }
LABEL_92:
  if (v48) {
    goto LABEL_93;
  }
LABEL_103:

LABEL_93:

  return v44;
}

- (BMMomentsEngagement)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v245[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"suggestionEvent"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v209 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v213 = 0;
    id v210 = v7;
    v209 = [[BMMomentsEngagementSuggestionEvent alloc] initWithJSONDictionary:v210 error:&v213];
    id v24 = v213;
    if (v24)
    {
      int v25 = v24;
      if (a4) {
        *a4 = v24;
      }

LABEL_57:
      int v32 = 0;
      goto LABEL_115;
    }

LABEL_4:
    id v210 = [v6 objectForKeyedSubscript:@"entryEvent"];
    if (!v210 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v208 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v210;
      id v212 = 0;
      v208 = [[BMMomentsEngagementAppEntryEvent alloc] initWithJSONDictionary:v8 error:&v212];
      id v26 = v212;
      if (v26)
      {
        int v27 = v26;
        if (a4) {
          *a4 = v26;
        }

LABEL_62:
        int v32 = 0;
        goto LABEL_114;
      }

LABEL_7:
      id v8 = [v6 objectForKeyedSubscript:@"clientActivityEvent"];
      if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v207 = 0;
        goto LABEL_10;
      }
      int v28 = a4;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        a4 = (id *)v8;
        id v211 = 0;
        int v29 = [[BMMomentsEngagementClientActivityEvent alloc] initWithJSONDictionary:a4 error:&v211];
        id v30 = v211;
        if (v30)
        {
          int v31 = v30;
          if (v28) {
            *int v28 = v30;
          }

          int v32 = 0;
          goto LABEL_113;
        }
        v207 = v29;

        a4 = v28;
LABEL_10:
        uint64_t v9 = [v6 objectForKeyedSubscript:@"onboardingFlowCompletionState"];
        id v206 = v8;
        if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v204 = v9;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v94 = v9;
              if (!a4)
              {
                int v32 = 0;
                goto LABEL_112;
              }
              v95 = a4;
              id v96 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v205 = *MEMORY[0x1E4F502C8];
              uint64_t v238 = *MEMORY[0x1E4F28568];
              uint64_t v97 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"onboardingFlowCompletionState"];
              uint64_t v239 = v97;
              uint64_t v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v239 forKeys:&v238 count:1];
              id v99 = (id)[v96 initWithDomain:v205 code:2 userInfo:v98];
              a4 = 0;
              int v32 = 0;
              id *v95 = v99;
              id v10 = (void *)v98;
              uint64_t v9 = v94;
              v58 = (void *)v97;
LABEL_111:

LABEL_112:
              id v8 = v206;
              int v29 = v207;
              goto LABEL_113;
            }
            v204 = [NSNumber numberWithInt:BMMomentsEventDataOnboardingFlowCompletionFromString(v9)];
          }
        }
        else
        {
          v204 = 0;
        }
        id v10 = [v6 objectForKeyedSubscript:@"isJournalAppInstalled"];
        if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              v58 = 0;
              int v32 = 0;
              a4 = v204;
              goto LABEL_111;
            }
            id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v53 = *MEMORY[0x1E4F502C8];
            uint64_t v236 = *MEMORY[0x1E4F28568];
            id v54 = self;
            id v55 = [NSString alloc];
            uint64_t v153 = objc_opt_class();
            id v56 = v55;
            self = v54;
            id v203 = (id)[v56 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v153, @"isJournalAppInstalled"];
            id v237 = v203;
            v202 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v237 forKeys:&v236 count:1];
            id v57 = (id)objc_msgSend(v52, "initWithDomain:code:userInfo:", v53, 2);
            int v32 = 0;
            v58 = 0;
            *a4 = v57;
            a4 = v204;
            goto LABEL_110;
          }
          id v201 = v10;
        }
        else
        {
          id v201 = 0;
        }
        uint64_t v11 = [v6 objectForKeyedSubscript:@"isJournalAppLocked"];
        v202 = (void *)v11;
        if (v11 && (id v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v203 = 0;
              int v32 = 0;
              a4 = v204;
              v58 = v201;
              goto LABEL_110;
            }
            id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
            v177 = self;
            uint64_t v60 = *MEMORY[0x1E4F502C8];
            uint64_t v234 = *MEMORY[0x1E4F28568];
            v61 = v9;
            id v62 = [NSString alloc];
            uint64_t v154 = objc_opt_class();
            v63 = v62;
            uint64_t v9 = v61;
            id v199 = (id)[v63 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v154, @"isJournalAppLocked"];
            id v235 = v199;
            id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v235 forKeys:&v234 count:1];
            uint64_t v64 = v60;
            self = v177;
            int v32 = 0;
            id v203 = 0;
            *a4 = (id)[v59 initWithDomain:v64 code:2 userInfo:v13];
            goto LABEL_145;
          }
          id v203 = v12;
        }
        else
        {
          id v203 = 0;
        }
        id v13 = [v6 objectForKeyedSubscript:@"isJournalSuggestionSkipped"];
        if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v192 = v7;
          uint64_t v14 = v10;
          uint64_t v15 = v13;
          id v199 = 0;
LABEL_22:
          uint64_t v16 = [v6 objectForKeyedSubscript:@"isActivitySettingsSwitchEnabled"];
          v198 = (void *)v16;
          if (v16 && (uint64_t v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                int v32 = 0;
                a4 = v204;
                v58 = v201;
                id v13 = v15;
                id v10 = v14;
                v65 = 0;
                uint64_t v7 = v192;
                goto LABEL_108;
              }
              id v197 = objc_alloc(MEMORY[0x1E4F28C58]);
              v179 = self;
              uint64_t v88 = *MEMORY[0x1E4F502C8];
              uint64_t v230 = *MEMORY[0x1E4F28568];
              id v13 = v15;
              v89 = v9;
              id v90 = [NSString alloc];
              uint64_t v156 = objc_opt_class();
              v91 = v90;
              id v10 = v14;
              uint64_t v9 = v89;
              id v195 = (id)[v91 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v156, @"isActivitySettingsSwitchEnabled"];
              id v231 = v195;
              uint64_t v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v231 forKeys:&v230 count:1];
              uint64_t v93 = v88;
              self = v179;
              v191 = (void *)v92;
              int v32 = 0;
              v65 = 0;
              *a4 = (id)objc_msgSend(v197, "initWithDomain:code:userInfo:", v93, 2);
              a4 = v204;
              v58 = v201;
              uint64_t v7 = v192;
              goto LABEL_107;
            }
            id v196 = v17;
          }
          else
          {
            id v196 = 0;
          }
          uint64_t v18 = [v6 objectForKeyedSubscript:@"isCommunicationSettingsSwitchEnabled"];
          v191 = (void *)v18;
          if (v18 && (uint64_t v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                id v195 = 0;
                int v32 = 0;
                a4 = v204;
                v58 = v201;
                id v13 = v15;
                id v10 = v14;
                uint64_t v7 = v192;
                v65 = v196;
                goto LABEL_107;
              }
              id v100 = objc_alloc(MEMORY[0x1E4F28C58]);
              v180 = self;
              uint64_t v101 = *MEMORY[0x1E4F502C8];
              uint64_t v228 = *MEMORY[0x1E4F28568];
              v168 = v15;
              v102 = v9;
              id v103 = [NSString alloc];
              uint64_t v157 = objc_opt_class();
              v104 = v103;
              id v10 = v14;
              uint64_t v9 = v102;
              v65 = v196;
              id v13 = v168;
              id v189 = (id)[v104 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v157, @"isCommunicationSettingsSwitchEnabled"];
              id v229 = v189;
              uint64_t v105 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v229 forKeys:&v228 count:1];
              uint64_t v106 = v101;
              self = v180;
              v188 = (void *)v105;
              int v32 = 0;
              id v195 = 0;
              *a4 = (id)objc_msgSend(v100, "initWithDomain:code:userInfo:", v106, 2);
              a4 = v204;
              v58 = v201;
              uint64_t v7 = v192;
LABEL_106:

LABEL_107:
LABEL_108:

LABEL_109:
LABEL_110:

              goto LABEL_111;
            }
            id v195 = v19;
          }
          else
          {
            id v195 = 0;
          }
          uint64_t v20 = [v6 objectForKeyedSubscript:@"isSignificantLocationSettingsSwitchEnabled"];
          v188 = (void *)v20;
          if (v20 && (uint64_t v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v7 = v192;
              if (!a4)
              {
                id v189 = 0;
                int v32 = 0;
                a4 = v204;
                v58 = v201;
                id v13 = v15;
                id v10 = v14;
                v65 = v196;
                goto LABEL_106;
              }
              id v190 = objc_alloc(MEMORY[0x1E4F28C58]);
              v181 = self;
              uint64_t v107 = *MEMORY[0x1E4F502C8];
              uint64_t v226 = *MEMORY[0x1E4F28568];
              v108 = v15;
              v109 = v9;
              id v110 = [NSString alloc];
              uint64_t v158 = objc_opt_class();
              v111 = v110;
              id v10 = v14;
              uint64_t v9 = v109;
              v65 = v196;
              id v13 = v108;
              id v186 = (id)[v111 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v158, @"isSignificantLocationSettingsSwitchEnabled"];
              id v227 = v186;
              uint64_t v112 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v227 forKeys:&v226 count:1];
              uint64_t v113 = v107;
              self = v181;
              v176 = (void *)v112;
              id v114 = (id)objc_msgSend(v190, "initWithDomain:code:userInfo:", v113, 2);
              int v32 = 0;
              id v189 = 0;
              *a4 = v114;
              goto LABEL_160;
            }
            id v189 = v21;
          }
          else
          {
            id v189 = 0;
          }
          uint64_t v22 = [v6 objectForKeyedSubscript:@"isMediaSettingsSwitchEnabled"];
          id v13 = v15;
          v176 = (void *)v22;
          if (!v22)
          {
            id v186 = 0;
            uint64_t v7 = v192;
            id v10 = v14;
            goto LABEL_83;
          }
          uint64_t v23 = (void *)v22;
          objc_opt_class();
          uint64_t v7 = v192;
          id v10 = v14;
          if (objc_opt_isKindOfClass())
          {
            id v186 = 0;
LABEL_83:
            uint64_t v66 = [v6 objectForKeyedSubscript:@"isNearbyPeopleSettingsSwitchEnabled"];
            v173 = (void *)v66;
            if (v66 && (v67 = (void *)v66, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  id v174 = 0;
                  int v32 = 0;
                  a4 = v204;
                  v58 = v201;
                  v65 = v196;
                  goto LABEL_104;
                }
                id v175 = objc_alloc(MEMORY[0x1E4F28C58]);
                v182 = self;
                uint64_t v121 = *MEMORY[0x1E4F502C8];
                uint64_t v222 = *MEMORY[0x1E4F28568];
                v122 = v13;
                v123 = v9;
                id v124 = [NSString alloc];
                uint64_t v160 = objc_opt_class();
                v125 = v124;
                uint64_t v9 = v123;
                v65 = v196;
                id v13 = v122;
                id v193 = (id)[v125 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v160, @"isNearbyPeopleSettingsSwitchEnabled"];
                id v223 = v193;
                uint64_t v126 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v223 forKeys:&v222 count:1];
                uint64_t v127 = v121;
                self = v182;
                v170 = (void *)v126;
                id v128 = (id)objc_msgSend(v175, "initWithDomain:code:userInfo:", v127, 2);
                int v32 = 0;
                id v174 = 0;
                *a4 = v128;
                a4 = v204;
                v58 = v201;
                goto LABEL_103;
              }
              id v174 = v67;
            }
            else
            {
              id v174 = 0;
            }
            uint64_t v68 = [v6 objectForKeyedSubscript:@"isPhotoSettingsSwitchEnabled"];
            v170 = (void *)v68;
            if (v68 && (v69 = (void *)v68, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  id v193 = 0;
                  int v32 = 0;
                  a4 = v204;
                  v58 = v201;
                  v65 = v196;
                  goto LABEL_103;
                }
                id v194 = objc_alloc(MEMORY[0x1E4F28C58]);
                v183 = self;
                uint64_t v129 = *MEMORY[0x1E4F502C8];
                uint64_t v220 = *MEMORY[0x1E4F28568];
                v130 = v13;
                v131 = v9;
                id v132 = [NSString alloc];
                uint64_t v161 = objc_opt_class();
                v133 = v132;
                uint64_t v9 = v131;
                v65 = v196;
                id v13 = v130;
                id v171 = (id)[v133 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v161, @"isPhotoSettingsSwitchEnabled"];
                id v221 = v171;
                uint64_t v134 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v221 forKeys:&v220 count:1];
                uint64_t v135 = v129;
                self = v183;
                v169 = (void *)v134;
                id v136 = (id)objc_msgSend(v194, "initWithDomain:code:userInfo:", v135, 2);
                int v32 = 0;
                id v193 = 0;
                *a4 = v136;
LABEL_102:
                a4 = v204;
                v58 = v201;

LABEL_103:
LABEL_104:

LABEL_105:
                goto LABEL_106;
              }
              id v193 = v69;
            }
            else
            {
              id v193 = 0;
            }
            uint64_t v70 = [v6 objectForKeyedSubscript:@"isStateOfMindSettingsSwitchEnabled"];
            v65 = v196;
            v169 = (void *)v70;
            if (v70 && (v71 = (void *)v70, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  id v171 = 0;
                  int v32 = 0;
                  goto LABEL_102;
                }
                id v137 = objc_alloc(MEMORY[0x1E4F28C58]);
                v166 = a4;
                uint64_t v172 = *MEMORY[0x1E4F502C8];
                uint64_t v218 = *MEMORY[0x1E4F28568];
                v138 = v13;
                v139 = v9;
                id v140 = [NSString alloc];
                uint64_t v162 = objc_opt_class();
                v141 = v140;
                uint64_t v9 = v139;
                id v13 = v138;
                a4 = (id *)[v141 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v162, @"isStateOfMindSettingsSwitchEnabled"];
                v219 = a4;
                v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v219 forKeys:&v218 count:1];
                id v142 = (id)[v137 initWithDomain:v172 code:2 userInfo:v78];
                int v32 = 0;
                id v171 = 0;
                id *v166 = v142;
                goto LABEL_101;
              }
              id v171 = v71;
            }
            else
            {
              id v171 = 0;
            }
            uint64_t v72 = [v6 objectForKeyedSubscript:@"isReflectionSettingsSwitchEnabled"];
            v164 = v10;
            v165 = (void *)v72;
            v167 = v13;
            if (v72 && (v73 = (void *)v72, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  int v32 = 0;
                  goto LABEL_100;
                }
                id v76 = v196;
                v143 = a4;
                id v144 = objc_alloc(MEMORY[0x1E4F28C58]);
                v184 = self;
                uint64_t v145 = *MEMORY[0x1E4F502C8];
                uint64_t v216 = *MEMORY[0x1E4F28568];
                id v77 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isReflectionSettingsSwitchEnabled"];
                id v217 = v77;
                v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v217 forKeys:&v216 count:1];
                uint64_t v146 = v145;
                self = v184;
                id v147 = (id)[v144 initWithDomain:v146 code:2 userInfo:v75];
                int v32 = 0;
                a4 = 0;
                id *v143 = v147;
                goto LABEL_99;
              }
              v74 = a4;
              a4 = v73;
            }
            else
            {
              v74 = a4;
              a4 = 0;
            }
            v75 = [v6 objectForKeyedSubscript:@"isBroadSystemLocationSettingsSwitchEnabled"];
            if (v75 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                id v76 = v196;
                if (v74)
                {
                  id v163 = objc_alloc(MEMORY[0x1E4F28C58]);
                  v185 = v9;
                  v148 = self;
                  uint64_t v149 = *MEMORY[0x1E4F502C8];
                  uint64_t v214 = *MEMORY[0x1E4F28568];
                  v150 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isBroadSystemLocationSettingsSwitchEnabled"];
                  v215 = v150;
                  v151 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v215 forKeys:&v214 count:1];
                  uint64_t v152 = v149;
                  self = v148;
                  uint64_t v9 = v185;
                  id *v74 = (id)[v163 initWithDomain:v152 code:2 userInfo:v151];
                }
                id v77 = 0;
                int v32 = 0;
                goto LABEL_99;
              }
              id v76 = v196;
              id v77 = v75;
            }
            else
            {
              id v76 = v196;
              id v77 = 0;
            }
            self = objc_retain(-[BMMomentsEngagement initWithSuggestionEvent:entryEvent:clientActivityEvent:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:](self, "initWithSuggestionEvent:entryEvent:clientActivityEvent:onboardingFlowCompletionState:isJournalAppInstalled:isJournalAppLocked:isJournalSuggestionSkipped:isActivitySettingsSwitchEnabled:isCommunicationSettingsSwitchEnabled:isSignificantLocationSettingsSwitchEnabled:isMediaSettingsSwitchEnabled:isNearbyPeopleSettingsSwitchEnabled:isPhotoSettingsSwitchEnabled:isStateOfMindSettingsSwitchEnabled:isReflectionSettingsSwitchEnabled:isBroadSystemLocationSettingsSwitchEnabled:", v209, v208, v207, [v204 intValue], v201, v203, v199, v76, v195, v189, v186, v174,
                       v193,
                       v171,
                       a4,
                       v77));
            int v32 = self;
LABEL_99:
            id v10 = v164;

            id v13 = v167;
            v65 = v76;
LABEL_100:
            v78 = v165;
LABEL_101:

            goto LABEL_102;
          }
          objc_opt_class();
          v65 = v196;
          if (objc_opt_isKindOfClass())
          {
            id v186 = v23;
            goto LABEL_83;
          }
          if (a4)
          {
            id v115 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v187 = *MEMORY[0x1E4F502C8];
            uint64_t v224 = *MEMORY[0x1E4F28568];
            v116 = v13;
            v117 = v9;
            id v118 = [NSString alloc];
            uint64_t v159 = objc_opt_class();
            v119 = v118;
            uint64_t v9 = v117;
            id v13 = v116;
            id v174 = (id)[v119 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v159, @"isMediaSettingsSwitchEnabled"];
            id v225 = v174;
            v173 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v225 forKeys:&v224 count:1];
            id v120 = (id)objc_msgSend(v115, "initWithDomain:code:userInfo:", v187, 2);
            int v32 = 0;
            id v186 = 0;
            *a4 = v120;
            a4 = v204;
            v58 = v201;
            goto LABEL_104;
          }
          id v186 = 0;
          int v32 = 0;
LABEL_160:
          a4 = v204;
          v58 = v201;
          goto LABEL_105;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v192 = v7;
          uint64_t v14 = v10;
          uint64_t v15 = v13;
          id v199 = v13;
          goto LABEL_22;
        }
        if (a4)
        {
          id v200 = objc_alloc(MEMORY[0x1E4F28C58]);
          v178 = self;
          uint64_t v80 = *MEMORY[0x1E4F502C8];
          uint64_t v232 = *MEMORY[0x1E4F28568];
          v81 = v13;
          v82 = v9;
          id v83 = [NSString alloc];
          uint64_t v155 = objc_opt_class();
          v84 = v83;
          uint64_t v9 = v82;
          id v13 = v81;
          v65 = (void *)[v84 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v155, @"isJournalSuggestionSkipped"];
          v233 = v65;
          uint64_t v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v233 forKeys:&v232 count:1];
          uint64_t v86 = v80;
          self = v178;
          v198 = (void *)v85;
          id v87 = (id)objc_msgSend(v200, "initWithDomain:code:userInfo:", v86, 2);
          int v32 = 0;
          id v199 = 0;
          *a4 = v87;
          a4 = v204;
          v58 = v201;
          goto LABEL_108;
        }
        id v199 = 0;
        int v32 = 0;
LABEL_145:
        a4 = v204;
        v58 = v201;
        goto LABEL_109;
      }
      if (a4)
      {
        id v45 = v8;
        id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
        v47 = self;
        uint64_t v48 = *MEMORY[0x1E4F502C8];
        uint64_t v240 = *MEMORY[0x1E4F28568];
        uint64_t v49 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"clientActivityEvent"];
        uint64_t v241 = v49;
        a4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v241 forKeys:&v240 count:1];
        id v50 = v46;
        id v8 = v45;
        uint64_t v51 = v48;
        self = v47;
        int v29 = (BMMomentsEngagementClientActivityEvent *)v49;
        int v32 = 0;
        *int v28 = (id)[v50 initWithDomain:v51 code:2 userInfo:a4];
LABEL_113:

        goto LABEL_114;
      }
      goto LABEL_62;
    }
    if (a4)
    {
      id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
      v39 = a4;
      v40 = self;
      uint64_t v41 = *MEMORY[0x1E4F502C8];
      uint64_t v242 = *MEMORY[0x1E4F28568];
      v208 = (BMMomentsEngagementAppEntryEvent *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"entryEvent"];
      v243 = v208;
      uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v243 forKeys:&v242 count:1];
      v43 = v38;
      id v8 = (id)v42;
      uint64_t v44 = v41;
      self = v40;
      int v32 = 0;
      id *v39 = (id)[v43 initWithDomain:v44 code:2 userInfo:v42];
LABEL_114:

      goto LABEL_115;
    }
    goto LABEL_57;
  }
  if (a4)
  {
    id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
    int v34 = self;
    uint64_t v35 = *MEMORY[0x1E4F502C8];
    uint64_t v244 = *MEMORY[0x1E4F28568];
    v209 = (BMMomentsEngagementSuggestionEvent *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"suggestionEvent"];
    v245[0] = v209;
    uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v245 forKeys:&v244 count:1];
    uint64_t v37 = v35;
    self = v34;
    id v210 = (id)v36;
    int v32 = 0;
    *a4 = (id)objc_msgSend(v33, "initWithDomain:code:userInfo:", v37, 2);
LABEL_115:

    goto LABEL_116;
  }
  int v32 = 0;
LABEL_116:

  return v32;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMomentsEngagement *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_suggestionEvent)
  {
    PBDataWriterPlaceMark();
    [(BMMomentsEngagementSuggestionEvent *)self->_suggestionEvent writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_entryEvent)
  {
    PBDataWriterPlaceMark();
    [(BMMomentsEngagementAppEntryEvent *)self->_entryEvent writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_clientActivityEvent)
  {
    PBDataWriterPlaceMark();
    [(BMMomentsEngagementClientActivityEvent *)self->_clientActivityEvent writeTo:v4];
    PBDataWriterRecallMark();
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
  v118.receiver = self;
  v118.super_class = (Class)BMMomentsEngagement;
  id v5 = [(BMEventBase *)&v118 init];
  if (!v5) {
    goto LABEL_181;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v9 = (int *)MEMORY[0x1E4F940B8];
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
          uint64_t v119 = 0;
          uint64_t v120 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_180;
          }
          uint64_t v20 = [[BMMomentsEngagementSuggestionEvent alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_180;
          }
          uint64_t v21 = 48;
          goto LABEL_31;
        case 2u:
          uint64_t v119 = 0;
          uint64_t v120 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_180;
          }
          uint64_t v20 = [[BMMomentsEngagementAppEntryEvent alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_180;
          }
          uint64_t v21 = 56;
          goto LABEL_31;
        case 3u:
          uint64_t v119 = 0;
          uint64_t v120 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_180;
          }
          uint64_t v20 = [[BMMomentsEngagementClientActivityEvent alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_180;
          }
          uint64_t v21 = 64;
LABEL_31:
          uint64_t v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = v20;

          PBReaderRecallMark();
          continue;
        case 4u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
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
                  LODWORD(v25) = 0;
                  goto LABEL_126;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v25) = 0;
          }
LABEL_126:
          if (v25 >= 5) {
            LODWORD(v25) = 0;
          }
          v5->_onboardingFlowCompletionState = v25;
          continue;
        case 5u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          v5->_hasIsJournalAppInstalled = 1;
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
                  goto LABEL_132;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v32 = 0;
          }
LABEL_132:
          BOOL v114 = v32 != 0;
          uint64_t v115 = 16;
          goto LABEL_177;
        case 6u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v39 = 0;
          v5->_hasIsJournalAppLocked = 1;
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
                  uint64_t v39 = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v39 = 0;
          }
LABEL_136:
          BOOL v114 = v39 != 0;
          uint64_t v115 = 18;
          goto LABEL_177;
        case 7u:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0;
          v5->_hasIsJournalSuggestionSkipped = 1;
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
                  uint64_t v46 = 0;
                  goto LABEL_140;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v46 = 0;
          }
LABEL_140:
          BOOL v114 = v46 != 0;
          uint64_t v115 = 20;
          goto LABEL_177;
        case 8u:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v53 = 0;
          v5->_hasIsActivitySettingsSwitchEnabled = 1;
          while (2)
          {
            uint64_t v54 = *v6;
            uint64_t v55 = *(void *)&v4[v54];
            unint64_t v56 = v55 + 1;
            if (v55 == -1 || v56 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v57 = *(unsigned char *)(*(void *)&v4[*v9] + v55);
              *(void *)&v4[v54] = v56;
              v53 |= (unint64_t)(v57 & 0x7F) << v51;
              if (v57 < 0)
              {
                v51 += 7;
                BOOL v17 = v52++ >= 9;
                if (v17)
                {
                  uint64_t v53 = 0;
                  goto LABEL_144;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v53 = 0;
          }
LABEL_144:
          BOOL v114 = v53 != 0;
          uint64_t v115 = 22;
          goto LABEL_177;
        case 9u:
          char v58 = 0;
          unsigned int v59 = 0;
          uint64_t v60 = 0;
          v5->_hasIsCommunicationSettingsSwitchEnabled = 1;
          while (2)
          {
            uint64_t v61 = *v6;
            uint64_t v62 = *(void *)&v4[v61];
            unint64_t v63 = v62 + 1;
            if (v62 == -1 || v63 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v64 = *(unsigned char *)(*(void *)&v4[*v9] + v62);
              *(void *)&v4[v61] = v63;
              v60 |= (unint64_t)(v64 & 0x7F) << v58;
              if (v64 < 0)
              {
                v58 += 7;
                BOOL v17 = v59++ >= 9;
                if (v17)
                {
                  uint64_t v60 = 0;
                  goto LABEL_148;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v60 = 0;
          }
LABEL_148:
          BOOL v114 = v60 != 0;
          uint64_t v115 = 24;
          goto LABEL_177;
        case 0xAu:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v67 = 0;
          v5->_hasIsSignificantLocationSettingsSwitchEnabled = 1;
          while (2)
          {
            uint64_t v68 = *v6;
            uint64_t v69 = *(void *)&v4[v68];
            unint64_t v70 = v69 + 1;
            if (v69 == -1 || v70 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v71 = *(unsigned char *)(*(void *)&v4[*v9] + v69);
              *(void *)&v4[v68] = v70;
              v67 |= (unint64_t)(v71 & 0x7F) << v65;
              if (v71 < 0)
              {
                v65 += 7;
                BOOL v17 = v66++ >= 9;
                if (v17)
                {
                  uint64_t v67 = 0;
                  goto LABEL_152;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v67 = 0;
          }
LABEL_152:
          BOOL v114 = v67 != 0;
          uint64_t v115 = 26;
          goto LABEL_177;
        case 0xBu:
          char v72 = 0;
          unsigned int v73 = 0;
          uint64_t v74 = 0;
          v5->_hasIsMediaSettingsSwitchEnabled = 1;
          while (2)
          {
            uint64_t v75 = *v6;
            uint64_t v76 = *(void *)&v4[v75];
            unint64_t v77 = v76 + 1;
            if (v76 == -1 || v77 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v78 = *(unsigned char *)(*(void *)&v4[*v9] + v76);
              *(void *)&v4[v75] = v77;
              v74 |= (unint64_t)(v78 & 0x7F) << v72;
              if (v78 < 0)
              {
                v72 += 7;
                BOOL v17 = v73++ >= 9;
                if (v17)
                {
                  uint64_t v74 = 0;
                  goto LABEL_156;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v74 = 0;
          }
LABEL_156:
          BOOL v114 = v74 != 0;
          uint64_t v115 = 28;
          goto LABEL_177;
        case 0xCu:
          char v79 = 0;
          unsigned int v80 = 0;
          uint64_t v81 = 0;
          v5->_hasIsNearbyPeopleSettingsSwitchEnabled = 1;
          while (2)
          {
            uint64_t v82 = *v6;
            uint64_t v83 = *(void *)&v4[v82];
            unint64_t v84 = v83 + 1;
            if (v83 == -1 || v84 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v85 = *(unsigned char *)(*(void *)&v4[*v9] + v83);
              *(void *)&v4[v82] = v84;
              v81 |= (unint64_t)(v85 & 0x7F) << v79;
              if (v85 < 0)
              {
                v79 += 7;
                BOOL v17 = v80++ >= 9;
                if (v17)
                {
                  uint64_t v81 = 0;
                  goto LABEL_160;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v81 = 0;
          }
LABEL_160:
          BOOL v114 = v81 != 0;
          uint64_t v115 = 30;
          goto LABEL_177;
        case 0xDu:
          char v86 = 0;
          unsigned int v87 = 0;
          uint64_t v88 = 0;
          v5->_hasIsPhotoSettingsSwitchEnabled = 1;
          while (2)
          {
            uint64_t v89 = *v6;
            uint64_t v90 = *(void *)&v4[v89];
            unint64_t v91 = v90 + 1;
            if (v90 == -1 || v91 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v92 = *(unsigned char *)(*(void *)&v4[*v9] + v90);
              *(void *)&v4[v89] = v91;
              v88 |= (unint64_t)(v92 & 0x7F) << v86;
              if (v92 < 0)
              {
                v86 += 7;
                BOOL v17 = v87++ >= 9;
                if (v17)
                {
                  uint64_t v88 = 0;
                  goto LABEL_164;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v88 = 0;
          }
LABEL_164:
          BOOL v114 = v88 != 0;
          uint64_t v115 = 32;
          goto LABEL_177;
        case 0xEu:
          char v93 = 0;
          unsigned int v94 = 0;
          uint64_t v95 = 0;
          v5->_hasIsStateOfMindSettingsSwitchEnabled = 1;
          while (2)
          {
            uint64_t v96 = *v6;
            uint64_t v97 = *(void *)&v4[v96];
            unint64_t v98 = v97 + 1;
            if (v97 == -1 || v98 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v99 = *(unsigned char *)(*(void *)&v4[*v9] + v97);
              *(void *)&v4[v96] = v98;
              v95 |= (unint64_t)(v99 & 0x7F) << v93;
              if (v99 < 0)
              {
                v93 += 7;
                BOOL v17 = v94++ >= 9;
                if (v17)
                {
                  uint64_t v95 = 0;
                  goto LABEL_168;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v95 = 0;
          }
LABEL_168:
          BOOL v114 = v95 != 0;
          uint64_t v115 = 34;
          goto LABEL_177;
        case 0xFu:
          char v100 = 0;
          unsigned int v101 = 0;
          uint64_t v102 = 0;
          v5->_hasIsReflectionSettingsSwitchEnabled = 1;
          while (2)
          {
            uint64_t v103 = *v6;
            uint64_t v104 = *(void *)&v4[v103];
            unint64_t v105 = v104 + 1;
            if (v104 == -1 || v105 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v106 = *(unsigned char *)(*(void *)&v4[*v9] + v104);
              *(void *)&v4[v103] = v105;
              v102 |= (unint64_t)(v106 & 0x7F) << v100;
              if (v106 < 0)
              {
                v100 += 7;
                BOOL v17 = v101++ >= 9;
                if (v17)
                {
                  uint64_t v102 = 0;
                  goto LABEL_172;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v102 = 0;
          }
LABEL_172:
          BOOL v114 = v102 != 0;
          uint64_t v115 = 36;
          goto LABEL_177;
        case 0x10u:
          char v107 = 0;
          unsigned int v108 = 0;
          uint64_t v109 = 0;
          v5->_hasIsBroadSystemLocationSettingsSwitchEnabled = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_180;
          }
          continue;
      }
      while (1)
      {
        uint64_t v110 = *v6;
        uint64_t v111 = *(void *)&v4[v110];
        unint64_t v112 = v111 + 1;
        if (v111 == -1 || v112 > *(void *)&v4[*v7]) {
          break;
        }
        char v113 = *(unsigned char *)(*(void *)&v4[*v9] + v111);
        *(void *)&v4[v110] = v112;
        v109 |= (unint64_t)(v113 & 0x7F) << v107;
        if ((v113 & 0x80) == 0) {
          goto LABEL_174;
        }
        v107 += 7;
        BOOL v17 = v108++ >= 9;
        if (v17)
        {
          uint64_t v109 = 0;
          goto LABEL_176;
        }
      }
      v4[*v8] = 1;
LABEL_174:
      if (v4[*v8]) {
        uint64_t v109 = 0;
      }
LABEL_176:
      BOOL v114 = v109 != 0;
      uint64_t v115 = 38;
LABEL_177:
      *((unsigned char *)&v5->super.super.isa + v115) = v114;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_180:
  }
    v116 = 0;
  else {
LABEL_181:
  }
    v116 = v5;

  return v116;
}

- (NSString)description
{
  id v18 = [NSString alloc];
  uint64_t v21 = [(BMMomentsEngagement *)self suggestionEvent];
  BOOL v17 = [(BMMomentsEngagement *)self entryEvent];
  uint64_t v20 = [(BMMomentsEngagement *)self clientActivityEvent];
  char v16 = BMMomentsEventDataOnboardingFlowCompletionAsString([(BMMomentsEngagement *)self onboardingFlowCompletionState]);
  unint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isJournalAppInstalled](self, "isJournalAppInstalled"));
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isJournalAppLocked](self, "isJournalAppLocked"));
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isJournalSuggestionSkipped](self, "isJournalSuggestionSkipped"));
  unint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isActivitySettingsSwitchEnabled](self, "isActivitySettingsSwitchEnabled"));
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isCommunicationSettingsSwitchEnabled](self, "isCommunicationSettingsSwitchEnabled"));
  char v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isSignificantLocationSettingsSwitchEnabled](self, "isSignificantLocationSettingsSwitchEnabled"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isMediaSettingsSwitchEnabled](self, "isMediaSettingsSwitchEnabled"));
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isNearbyPeopleSettingsSwitchEnabled](self, "isNearbyPeopleSettingsSwitchEnabled"));
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isPhotoSettingsSwitchEnabled](self, "isPhotoSettingsSwitchEnabled"));
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isStateOfMindSettingsSwitchEnabled](self, "isStateOfMindSettingsSwitchEnabled"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isReflectionSettingsSwitchEnabled](self, "isReflectionSettingsSwitchEnabled"));
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMomentsEngagement isBroadSystemLocationSettingsSwitchEnabled](self, "isBroadSystemLocationSettingsSwitchEnabled"));
  uint64_t v19 = (void *)[v18 initWithFormat:@"BMMomentsEngagement with suggestionEvent: %@, entryEvent: %@, clientActivityEvent: %@, onboardingFlowCompletionState: %@, isJournalAppInstalled: %@, isJournalAppLocked: %@, isJournalSuggestionSkipped: %@, isActivitySettingsSwitchEnabled: %@, isCommunicationSettingsSwitchEnabled: %@, isSignificantLocationSettingsSwitchEnabled: %@, isMediaSettingsSwitchEnabled: %@, isNearbyPeopleSettingsSwitchEnabled: %@, isPhotoSettingsSwitchEnabled: %@, isStateOfMindSettingsSwitchEnabled: %@, isReflectionSettingsSwitchEnabled: %@, isBroadSystemLocationSettingsSwitchEnabled: %@", v21, v17, v20, v16, v15, v14, v13, v12, v11, v10, v9, v8, v3, v4, v5, v6];

  return (NSString *)v19;
}

- (BMMomentsEngagement)initWithSuggestionEvent:(id)a3 entryEvent:(id)a4 clientActivityEvent:(id)a5 onboardingFlowCompletionState:(int)a6 isJournalAppInstalled:(id)a7 isJournalAppLocked:(id)a8 isJournalSuggestionSkipped:(id)a9 isActivitySettingsSwitchEnabled:(id)a10 isCommunicationSettingsSwitchEnabled:(id)a11 isSignificantLocationSettingsSwitchEnabled:(id)a12 isMediaSettingsSwitchEnabled:(id)a13 isNearbyPeopleSettingsSwitchEnabled:(id)a14 isPhotoSettingsSwitchEnabled:(id)a15 isStateOfMindSettingsSwitchEnabled:(id)a16 isReflectionSettingsSwitchEnabled:(id)a17 isBroadSystemLocationSettingsSwitchEnabled:(id)a18
{
  id v41 = a3;
  id v40 = a4;
  id v36 = a5;
  id v39 = a5;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v45 = a10;
  uint64_t v25 = v24;
  id v44 = a11;
  id v43 = a12;
  uint64_t v26 = v23;
  id v42 = a13;
  uint64_t v27 = v22;
  id v28 = a14;
  id v29 = a15;
  id v30 = a16;
  id v31 = a17;
  id v32 = a18;
  v46.receiver = self;
  v46.super_class = (Class)BMMomentsEngagement;
  uint64_t v33 = [(BMEventBase *)&v46 init];
  if (v33)
  {
    v33->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v33->_suggestionEvent, a3);
    objc_storeStrong((id *)&v33->_entryEvent, a4);
    objc_storeStrong((id *)&v33->_clientActivityEvent, v36);
    v33->_onboardingFlowCompletionState = a6;
    if (v27)
    {
      v33->_hasIsJournalAppInstalled = 1;
      v33->_isJournalAppInstalled = [v27 BOOLValue];
    }
    else
    {
      v33->_hasIsJournalAppInstalled = 0;
      v33->_isJournalAppInstalled = 0;
    }
    if (v26)
    {
      v33->_hasIsJournalAppLocked = 1;
      v33->_isJournalAppLocked = [v26 BOOLValue];
    }
    else
    {
      v33->_hasIsJournalAppLocked = 0;
      v33->_isJournalAppLocked = 0;
    }
    if (v25)
    {
      v33->_hasIsJournalSuggestionSkipped = 1;
      v33->_isJournalSuggestionSkipped = [v25 BOOLValue];
    }
    else
    {
      v33->_hasIsJournalSuggestionSkipped = 0;
      v33->_isJournalSuggestionSkipped = 0;
    }
    if (v45)
    {
      v33->_hasIsActivitySettingsSwitchEnabled = 1;
      v33->_isActivitySettingsSwitchEnabled = [v45 BOOLValue];
    }
    else
    {
      v33->_hasIsActivitySettingsSwitchEnabled = 0;
      v33->_isActivitySettingsSwitchEnabled = 0;
    }
    if (v44)
    {
      v33->_hasIsCommunicationSettingsSwitchEnabled = 1;
      v33->_isCommunicationSettingsSwitchEnabled = [v44 BOOLValue];
    }
    else
    {
      v33->_hasIsCommunicationSettingsSwitchEnabled = 0;
      v33->_isCommunicationSettingsSwitchEnabled = 0;
    }
    if (v43)
    {
      v33->_hasIsSignificantLocationSettingsSwitchEnabled = 1;
      v33->_isSignificantLocationSettingsSwitchEnabled = [v43 BOOLValue];
    }
    else
    {
      v33->_hasIsSignificantLocationSettingsSwitchEnabled = 0;
      v33->_isSignificantLocationSettingsSwitchEnabled = 0;
    }
    if (v42)
    {
      v33->_hasIsMediaSettingsSwitchEnabled = 1;
      v33->_isMediaSettingsSwitchEnabled = [v42 BOOLValue];
    }
    else
    {
      v33->_hasIsMediaSettingsSwitchEnabled = 0;
      v33->_isMediaSettingsSwitchEnabled = 0;
    }
    if (v28)
    {
      v33->_hasIsNearbyPeopleSettingsSwitchEnabled = 1;
      v33->_isNearbyPeopleSettingsSwitchEnabled = [v28 BOOLValue];
    }
    else
    {
      v33->_hasIsNearbyPeopleSettingsSwitchEnabled = 0;
      v33->_isNearbyPeopleSettingsSwitchEnabled = 0;
    }
    if (v29)
    {
      v33->_hasIsPhotoSettingsSwitchEnabled = 1;
      v33->_isPhotoSettingsSwitchEnabled = [v29 BOOLValue];
    }
    else
    {
      v33->_hasIsPhotoSettingsSwitchEnabled = 0;
      v33->_isPhotoSettingsSwitchEnabled = 0;
    }
    if (v30)
    {
      v33->_hasIsStateOfMindSettingsSwitchEnabled = 1;
      v33->_isStateOfMindSettingsSwitchEnabled = [v30 BOOLValue];
    }
    else
    {
      v33->_hasIsStateOfMindSettingsSwitchEnabled = 0;
      v33->_isStateOfMindSettingsSwitchEnabled = 0;
    }
    if (v31)
    {
      v33->_hasIsReflectionSettingsSwitchEnabled = 1;
      v33->_isReflectionSettingsSwitchEnabled = [v31 BOOLValue];
    }
    else
    {
      v33->_hasIsReflectionSettingsSwitchEnabled = 0;
      v33->_isReflectionSettingsSwitchEnabled = 0;
    }
    if (v32)
    {
      v33->_hasIsBroadSystemLocationSettingsSwitchEnabled = 1;
      v33->_isBroadSystemLocationSettingsSwitchEnabled = [v32 BOOLValue];
    }
    else
    {
      v33->_hasIsBroadSystemLocationSettingsSwitchEnabled = 0;
      v33->_isBroadSystemLocationSettingsSwitchEnabled = 0;
    }
  }

  return v33;
}

+ (id)protoFields
{
  v20[16] = *MEMORY[0x1E4F143B8];
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"suggestionEvent" number:1 type:14 subMessageClass:objc_opt_class()];
  v20[0] = v19;
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"entryEvent" number:2 type:14 subMessageClass:objc_opt_class()];
  v20[1] = v18;
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientActivityEvent" number:3 type:14 subMessageClass:objc_opt_class()];
  v20[2] = v17;
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"onboardingFlowCompletionState" number:4 type:4 subMessageClass:0];
  v20[3] = v16;
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isJournalAppInstalled" number:5 type:12 subMessageClass:0];
  v20[4] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isJournalAppLocked" number:6 type:12 subMessageClass:0];
  v20[5] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isJournalSuggestionSkipped" number:7 type:12 subMessageClass:0];
  v20[6] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isActivitySettingsSwitchEnabled" number:8 type:12 subMessageClass:0];
  v20[7] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isCommunicationSettingsSwitchEnabled" number:9 type:12 subMessageClass:0];
  v20[8] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isSignificantLocationSettingsSwitchEnabled" number:10 type:12 subMessageClass:0];
  v20[9] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isMediaSettingsSwitchEnabled" number:11 type:12 subMessageClass:0];
  v20[10] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isNearbyPeopleSettingsSwitchEnabled" number:12 type:12 subMessageClass:0];
  v20[11] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isPhotoSettingsSwitchEnabled" number:13 type:12 subMessageClass:0];
  v20[12] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isStateOfMindSettingsSwitchEnabled" number:14 type:12 subMessageClass:0];
  v20[13] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isReflectionSettingsSwitchEnabled" number:15 type:12 subMessageClass:0];
  v20[14] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isBroadSystemLocationSettingsSwitchEnabled" number:16 type:12 subMessageClass:0];
  v20[15] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:16];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5958;
}

+ (id)columns
{
  v20[16] = *MEMORY[0x1E4F143B8];
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"suggestionEvent_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_911];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"entryEvent_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_913];
  BOOL v17 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"clientActivityEvent_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_915];
  char v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"onboardingFlowCompletionState" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isJournalAppInstalled" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:12 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isJournalAppLocked" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:12 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isJournalSuggestionSkipped" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isActivitySettingsSwitchEnabled" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isCommunicationSettingsSwitchEnabled" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:12 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isSignificantLocationSettingsSwitchEnabled" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:12 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isMediaSettingsSwitchEnabled" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:12 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isNearbyPeopleSettingsSwitchEnabled" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:12 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isPhotoSettingsSwitchEnabled" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:12 convertedType:0];
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isStateOfMindSettingsSwitchEnabled" dataType:0 requestOnly:0 fieldNumber:14 protoDataType:12 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isReflectionSettingsSwitchEnabled" dataType:0 requestOnly:0 fieldNumber:15 protoDataType:12 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isBroadSystemLocationSettingsSwitchEnabled" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:12 convertedType:0];
  v20[0] = v19;
  v20[1] = v18;
  v20[2] = v17;
  v20[3] = v16;
  v20[4] = v15;
  v20[5] = v14;
  v20[6] = v2;
  v20[7] = v3;
  v20[8] = v4;
  v20[9] = v5;
  v20[10] = v13;
  v20[11] = v6;
  v20[12] = v7;
  v20[13] = v12;
  v20[14] = v8;
  v20[15] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:16];

  return v11;
}

id __30__BMMomentsEngagement_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 clientActivityEvent];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __30__BMMomentsEngagement_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 entryEvent];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __30__BMMomentsEngagement_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 suggestionEvent];
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMMomentsEngagement alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[10] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end