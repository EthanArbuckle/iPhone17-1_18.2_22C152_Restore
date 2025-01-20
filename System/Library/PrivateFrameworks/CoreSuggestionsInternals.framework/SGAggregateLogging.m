@interface SGAggregateLogging
+ (id)_appNameForApp:(unint64_t)a3;
+ (id)aggregateKeyForKeySuffix:(id)a3;
+ (id)contactsFromEntity:(id)a3;
+ (id)eventsFromEntity:(id)a3;
+ (unint64_t)twoSigFigs:(id)a3;
+ (void)_pushValuesForContact:(id)a3 usingDomain:(id)a4 subdomain:(id)a5 type:(id)a6 action:(id)a7 extraSignature:(id)a8;
+ (void)addValueForScalarKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5 action:(id)a6 value:(int64_t)a7;
+ (void)app:(id)a3 performedAction:(id)a4 onContacts:(id)a5 withResult:(id)a6 elapsedTime:(unint64_t)a7;
+ (void)app:(id)a3 performedAction:(id)a4 onEvents:(id)a5 withResult:(id)a6 elapsedTime:(unint64_t)a7;
+ (void)assetVersion;
+ (void)assetVersion:(int64_t)a3;
+ (void)contactConfirmed:(id)a3 inApp:(unint64_t)a4;
+ (void)contactRejected:(id)a3 inApp:(unint64_t)a4;
+ (void)contactSuggestionImpressionsViaBanner:(int)a3;
+ (void)contactsFoundOnDeviceEnabled:(BOOL)a3;
+ (void)contactsSuggested:(id)a3 withElapsedTime:(unint64_t)a4 inApp:(unint64_t)a5;
+ (void)databaseCorruptionDetectedViaCorruptionMarker;
+ (void)databaseCorruptionDetectedViaIntegrityCheck;
+ (void)detail:(id)a3 confirmedForContact:(id)a4;
+ (void)detail:(id)a3 rejectedForContact:(id)a4;
+ (void)eventConfirmed:(id)a3 inApp:(unint64_t)a4;
+ (void)eventConfirmedByRecord:(id)a3;
+ (void)eventRejected:(id)a3 inApp:(unint64_t)a4;
+ (void)eventRejectedByRecord:(id)a3;
+ (void)eventSuggestionImpressionsViaBanner:(int)a3;
+ (void)eventsFoundOnDeviceEnabled:(BOOL)a3;
+ (void)eventsSuggested:(id)a3 withElapsedTime:(unint64_t)a4 inApp:(unint64_t)a5;
+ (void)harvestDrainedNumberOfMails:(int)a3;
+ (void)harvestedEntity:(id)a3 withElapsedTime:(unint64_t)a4;
+ (void)harvestedMessageInQueueSince:(double)a3;
+ (void)hypotheticalContactSuggestionImpressionsIncludingInsignificant:(int)a3;
+ (void)hypotheticalSuggestionImpressionsIncludingActedOn:(int)a3;
+ (void)identityGroupSize:(unint64_t)a3;
+ (void)incrementKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5;
+ (void)incrementKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5 action:(id)a6;
+ (void)incrementKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5 action:(id)a6 by:(unint64_t)a7;
+ (void)incrementKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5 by:(unint64_t)a6;
+ (void)incrementKeyWithDomain:(id)a3 suffix:(id)a4;
+ (void)incrementValuesInDomain:(id)a3 subdomain:(id)a4 type:(id)a5 action:(id)a6 withKeysAndIncrements:(id)a7 extraSignature:(id)a8;
+ (void)messagesAdded:(unint64_t)a3;
+ (void)messagesDeleted:(unint64_t)a3;
+ (void)messagesFound:(unint64_t)a3;
+ (void)messagesFoundAfterUndisplayablyLost:(unint64_t)a3;
+ (void)messagesLost:(unint64_t)a3;
+ (void)messagesPruned:(unint64_t)a3;
+ (void)messagesUndisplayablyLost:(int64_t)a3;
+ (void)performedAction:(id)a3 forApp:(id)a4 onContact:(id)a5;
+ (void)performedAction:(id)a3 forApp:(id)a4 onEvent:(id)a5;
+ (void)performedAction:(id)a3 onDetail:(id)a4 forContact:(id)a5;
+ (void)performedAction:(id)a3 onEventInCalendar:(id)a4;
+ (void)performedAction:(id)a3 onRecordForContact:(id)a4;
+ (void)pushValue:(double)a3 toDistKeyWithDomain:(id)a4 suffix:(id)a5;
+ (void)pushValue:(double)a3 toDistKeyWithSuffix:(id)a4;
+ (void)pushValueForDistributionKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5 action:(id)a6 value:(int64_t)a7;
+ (void)reMatched:(id)a3;
+ (void)recordConfirmedForContact:(id)a3;
+ (void)recordRejectedForContact:(id)a3;
+ (void)setKeyWithDomain:(id)a3 suffix:(id)a4 toValue:(unint64_t)a5;
+ (void)setValueForScalarKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5 action:(id)a6 value:(int64_t)a7;
+ (void)suggestionImpressionsViaBanner:(int)a3;
+ (void)suggestionImpressionsViaBannerSuppressed:(int)a3;
@end

@implementation SGAggregateLogging

+ (void)pushValueForDistributionKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5 action:(id)a6 value:(int64_t)a7
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v8 = aggdKeyForComponents(a3, a4, 0, a5, a6);
  v9 = objc_opt_new();
  [v9 setKey:v8];
  v10 = [MEMORY[0x1E4F93728] sharedInstance];
  [v10 trackDistributionForMessage:v9 value:(double)a7];

  id v11 = [NSString alloc];
  v12 = (void *)[v11 initWithFormat:@"%@.%@", *MEMORY[0x1E4F5DEF0], v8];
  v15 = @"count";
  v13 = [NSNumber numberWithInt:a7];
  v16[0] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  AnalyticsSendEvent();
}

+ (void)pushValue:(double)a3 toDistKeyWithDomain:(id)a4 suffix:(id)a5
{
}

+ (void)incrementValuesInDomain:(id)a3 subdomain:(id)a4 type:(id)a5 action:(id)a6 withKeysAndIncrements:(id)a7 extraSignature:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __110__SGAggregateLogging_PET__incrementValuesInDomain_subdomain_type_action_withKeysAndIncrements_extraSignature___block_invoke;
  v23[3] = &unk_1E65BEFD8;
  id v18 = v13;
  id v24 = v18;
  id v19 = v14;
  id v25 = v19;
  id v20 = v15;
  id v26 = v20;
  id v21 = v16;
  id v27 = v21;
  [a7 enumerateKeysAndObjectsUsingBlock:v23];
  if (v17)
  {
    v22 = aggdKeyForComponents(v18, v19, v20, v17, v21);
    SGPETAddValueForScalarKey(v22, 1);
  }
}

void __110__SGAggregateLogging_PET__incrementValuesInDomain_subdomain_type_action_withKeysAndIncrements_extraSignature___block_invoke(void **a1, void *a2, void *a3)
{
  id v5 = a3;
  id v9 = a2;
  if ([v9 isEqualToString:&stru_1F24EEF20]) {
    v6 = 0;
  }
  else {
    v6 = v9;
  }
  v7 = aggdKeyForComponents(a1[4], a1[5], a1[6], v6, a1[7]);
  int v8 = [v5 intValue];

  SGPETAddValueForScalarKey(v7, v8);
}

+ (void)setValueForScalarKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5 action:(id)a6 value:(int64_t)a7
{
  v16[1] = *MEMORY[0x1E4F143B8];
  int v8 = aggdKeyForComponents(a3, a4, 0, a5, a6);
  id v9 = objc_opt_new();
  [v9 setKey:v8];
  v10 = [MEMORY[0x1E4F93728] sharedInstance];
  [v10 trackScalarForMessage:v9 updateCount:a7];

  id v11 = [NSString alloc];
  v12 = (void *)[v11 initWithFormat:@"%@.%@", *MEMORY[0x1E4F5DEF0], v8];
  id v15 = @"count";
  id v13 = [NSNumber numberWithInt:a7];
  v16[0] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  AnalyticsSendEvent();
}

+ (void)addValueForScalarKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5 action:(id)a6 value:(int64_t)a7
{
  aggdKeyForComponents(a3, a4, 0, a5, a6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  SGPETAddValueForScalarKey(v8, a7);
}

+ (void)eventsFoundOnDeviceEnabled:(BOOL)a3
{
}

+ (void)contactsFoundOnDeviceEnabled:(BOOL)a3
{
}

+ (void)databaseCorruptionDetectedViaCorruptionMarker
{
}

+ (void)databaseCorruptionDetectedViaIntegrityCheck
{
}

+ (void)assetVersion:(int64_t)a3
{
}

+ (void)assetVersion
{
  v2 = +[SGAsset asset];
  uint64_t v3 = [v2 assetVersion];

  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v3;
  }
  +[SGAggregateLogging assetVersion:v4];
}

+ (void)hypotheticalContactSuggestionImpressionsIncludingInsignificant:(int)a3
{
}

+ (void)contactSuggestionImpressionsViaBanner:(int)a3
{
}

+ (void)eventSuggestionImpressionsViaBanner:(int)a3
{
}

+ (void)hypotheticalSuggestionImpressionsIncludingActedOn:(int)a3
{
}

+ (void)suggestionImpressionsViaBannerSuppressed:(int)a3
{
}

+ (void)suggestionImpressionsViaBanner:(int)a3
{
}

+ (void)reMatched:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v5 = v3;
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v4 = [v5 hashId];
      fastIncrementBy(&reMatched__count, 1u, @"re", v4);
    }
  }
  MEMORY[0x1F41817F8]();
}

+ (void)identityGroupSize:(unint64_t)a3
{
}

+ (void)harvestedEntity:(id)a3 withElapsedTime:(unint64_t)a4
{
  id v6 = a3;
  v7 = [a1 eventsFromEntity:v6];
  [a1 app:@"suggestd" performedAction:@"harvest" onEvents:v7 withResult:@"record" elapsedTime:a4];

  id v8 = [a1 contactsFromEntity:v6];

  [a1 app:@"suggestd" performedAction:@"harvest" onContacts:v8 withResult:@"record" elapsedTime:a4];
}

+ (id)contactsFromEntity:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v49 = [MEMORY[0x1E4F5DB20] recordIdForContactWithRowId:0];
  [MEMORY[0x1E4F5DAC8] originWithType:0 sourceKey:0 externalKey:0 fromForwardedMessage:0];
  v38 = id v37 = v3;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v4 = [v3 enrichments];
  uint64_t v51 = [v4 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v51)
  {
    v46 = 0;
    v47 = 0;
    id v5 = 0;
    v44 = v4;
    v45 = 0;
    v48 = 0;
    uint64_t v50 = *(void *)v53;
LABEL_3:
    uint64_t v6 = 0;
    while (2)
    {
      if (*(void *)v53 != v50) {
        objc_enumerationMutation(v4);
      }
      v7 = *(void **)(*((void *)&v52 + 1) + 8 * v6);
      id v8 = [v7 duplicateKey];
      uint64_t v9 = [v8 entityType];

      switch(v9)
      {
        case 4:
          id v11 = [v7 title];
          v12 = [v7 extractionInfo];
          +[SGNames sgNameFromString:v11 origin:v38 recordId:v49 extractionInfo:v12];
          v46 = id v13 = v46;
          goto LABEL_23;
        case 5:
        case 8:
          if (!v5) {
            id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
          }
          v10 = (void *)MEMORY[0x1E4F5D9E0];
          id v11 = [v7 title];
          v12 = [v7 extractionInfo];
          id v13 = [v10 emailAddress:v11 label:0 extractionInfo:v12 withRecordId:v49];
          id v14 = v5;
          goto LABEL_22;
        case 6:
          if (!v47) {
            v47 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
          }
          v30 = (void *)MEMORY[0x1E4F5DAD8];
          id v11 = [v7 title];
          v12 = [v7 extractionInfo];
          id v13 = [v30 phoneNumber:v11 label:0 extractionInfo:v12 recordId:v49];
          id v14 = v47;
LABEL_22:
          [v14 addObject:v13];
          goto LABEL_23;
        case 7:
          id v27 = v45;
          if (!v45) {
            id v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
          }
          id v11 = [MEMORY[0x1E4F5DAE8] components:0 city:0 state:0 postalCode:0 country:0];
          v28 = (void *)MEMORY[0x1E4F5DAE0];
          v12 = [v7 title];
          id v13 = [v7 extractionInfo];
          v29 = [v28 postalAddress:v12 components:v11 label:0 extractionInfo:v13 recordId:v49];
          v45 = v27;
          [v27 addObject:v29];

          uint64_t v4 = v44;
          goto LABEL_23;
        default:
          if (v9 != 19) {
            goto LABEL_25;
          }
          uint64_t v15 = (uint64_t)v48;
          if (!v48) {
            uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
          }
          v48 = (void *)v15;
          id v16 = [SGSocialProfileDetails alloc];
          id v17 = [v7 title];
          id v11 = [(SGSocialProfileDetails *)v16 initWithSerialized:v17];

          if (v11)
          {
            id v42 = objc_alloc(MEMORY[0x1E4F5DB48]);
            v12 = [(SGSocialProfileDetails *)v11 username];
            id v13 = [(SGSocialProfileDetails *)v11 userIdentifier];
            v40 = [(SGSocialProfileDetails *)v11 bundleIdentifier];
            uint64_t v18 = [(SGSocialProfileDetails *)v11 displayName];
            uint64_t v19 = [(SGSocialProfileDetails *)v11 service];
            id v20 = [(SGSocialProfileDetails *)v11 teamIdentifier];
            v41 = [v7 duplicateKey];
            v39 = [v41 contactDetailKey];
            [v39 label];
            id v21 = v43 = v5;
            v22 = [v7 extractionInfo];
            uint64_t v23 = v18;
            id v24 = (void *)v18;
            id v25 = (void *)v19;
            id v26 = (void *)[v42 initWithUsername:v12 userIdentifier:v13 bundleIdentifier:v40 displayName:v23 service:v19 teamIdentifier:v20 label:v21 extractionInfo:v22 recordId:v49];
            [v48 addObject:v26];

            uint64_t v4 = v44;
            id v5 = v43;

LABEL_23:
          }

LABEL_25:
          if (v51 != ++v6) {
            continue;
          }
          uint64_t v51 = [v4 countByEnumeratingWithState:&v52 objects:v57 count:16];
          if (!v51) {
            goto LABEL_29;
          }
          goto LABEL_3;
      }
    }
  }
  v46 = 0;
  v47 = 0;
  id v5 = 0;
  v45 = 0;
  v48 = 0;
LABEL_29:

  if (v46 || v5 || v47 || v45 || v48)
  {
    v33 = v48;
    v34 = [MEMORY[0x1E4F5D9B0] contactWithId:v49 name:v46 emailAddresses:v5 phones:v47 postalAddresses:v45 socialProfiles:v48];
    v35 = [MEMORY[0x1E4F5DAF8] realtimeContactForNewContact:v34];
    v56 = v35;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];

    v32 = v37;
  }
  else
  {
    v31 = 0;
    v32 = v37;
    v33 = 0;
  }

  return v31;
}

+ (id)eventsFromEntity:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 enrichments];
  id v8 = v3;
  id v5 = v3;
  uint64_t v6 = sgMapAndFilter();

  return v6;
}

id __39__SGAggregateLogging_eventsFromEntity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isEvent])
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F5DAC8];
    id v5 = [*(id *)(a1 + 32) duplicateKey];
    uint64_t v6 = [v5 messageKey];
    v7 = [v6 uniqueIdentifier];
    id v8 = [v4 originWithType:0 sourceKey:0 externalKey:v7 fromForwardedMessage:0];

    id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v10 = [v3 tags];
    id v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v12 = [v3 tags];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ([v17 tracked]) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v14);
    }

    uint64_t v18 = (void *)MEMORY[0x1E4F5DB00];
    uint64_t v19 = (void *)MEMORY[0x1E4F5DA00];
    id v20 = [MEMORY[0x1E4F5DB20] recordIdForEventWithRowId:0];
    LOBYTE(v24) = 0;
    id v21 = [v19 eventWithRecordId:v20 origin:v8 uniqueKey:0 opaqueKey:0 title:0 notes:0 start:0 startTimeZone:0 end:0 endTimeZone:0 isAllDay:v24 creationDate:0 lastModifiedDate:0 locations:0 tags:v11 URL:0];
    v22 = [v18 realtimeEventForNewEvent:v21];
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (void)harvestedMessageInQueueSince:(double)a3
{
  double v4 = fmax(CFAbsoluteTimeGetCurrent() - a3, 0.0);
  [a1 pushValue:@"messageTimeSpentInQueue" toDistKeyWithSuffix:v4];
}

+ (void)harvestDrainedNumberOfMails:(int)a3
{
  [a1 pushValue:@"mailsDrainedPerHarvest" toDistKeyWithSuffix:(double)a3];
  if (a3 >= 1)
  {
    +[SGAggregateLogging addValueForScalarKeyWithDomain:0 subdomain:0 suffix:@"harvestDrainedSomethingFromQueue" action:0 value:1];
    +[SGAggregateLogging addValueForScalarKeyWithDomain:0 subdomain:0 suffix:@"mailsDrained" action:0 value:a3];
  }
}

+ (void)recordRejectedForContact:(id)a3
{
}

+ (void)recordConfirmedForContact:(id)a3
{
}

+ (void)detail:(id)a3 rejectedForContact:(id)a4
{
}

+ (void)detail:(id)a3 confirmedForContact:(id)a4
{
}

+ (void)contactRejected:(id)a3 inApp:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _appNameForApp:a4];
  [a1 performedAction:@"reject" forApp:v7 onContact:v6];
}

+ (void)contactConfirmed:(id)a3 inApp:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _appNameForApp:a4];
  [a1 performedAction:@"confirm" forApp:v7 onContact:v6];
}

+ (void)eventRejectedByRecord:(id)a3
{
}

+ (void)eventConfirmedByRecord:(id)a3
{
}

+ (void)eventRejected:(id)a3 inApp:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _appNameForApp:a4];
  [a1 performedAction:@"reject" forApp:v7 onEvent:v6];
}

+ (void)eventConfirmed:(id)a3 inApp:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _appNameForApp:a4];
  [a1 performedAction:@"confirm" forApp:v7 onEvent:v6];
}

+ (void)app:(id)a3 performedAction:(id)a4 onContacts:(id)a5 withResult:(id)a6 elapsedTime:(unint64_t)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v13 && [v13 count])
  {
    uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"contacts.%@s", v14];
    [a1 incrementKeyWithDomain:@"behavior.scalar" subdomain:v11 suffix:v15 action:v12];

    double v16 = (double)(unint64_t)[v13 count];
    id v17 = (void *)[[NSString alloc] initWithFormat:@"behavior.distribution.%@.%@.contacts", v12, v11];
    [a1 pushValue:v17 toDistKeyWithSuffix:v16];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v18 = v13;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v24;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(v18);
          }
          [a1 performedAction:v12 forApp:v11 onContact:*(void *)(*((void *)&v23 + 1) + 8 * v22++)];
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v20);
    }
  }
}

+ (void)contactsSuggested:(id)a3 withElapsedTime:(unint64_t)a4 inApp:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [a1 _appNameForApp:a5];
  [a1 app:v9 performedAction:@"suggest" onContacts:v8 withResult:@"banner" elapsedTime:a4];
}

+ (void)app:(id)a3 performedAction:(id)a4 onEvents:(id)a5 withResult:(id)a6 elapsedTime:(unint64_t)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v13 && [v13 count])
  {
    uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"events.%@s", v14];
    [a1 incrementKeyWithDomain:@"behavior.scalar" subdomain:v11 suffix:v15 action:v12];

    double v16 = (double)(unint64_t)[v13 count];
    id v17 = (void *)[[NSString alloc] initWithFormat:@"behavior.distribution.%@.%@.events", v12, v11];
    [a1 pushValue:v17 toDistKeyWithSuffix:v16];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v18 = v13;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v24;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(v18);
          }
          [a1 performedAction:v12 forApp:v11 onEvent:*(void *)(*((void *)&v23 + 1) + 8 * v22++)];
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v20);
    }
  }
}

+ (void)eventsSuggested:(id)a3 withElapsedTime:(unint64_t)a4 inApp:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [a1 _appNameForApp:a5];
  [a1 app:v9 performedAction:@"suggest" onEvents:v8 withResult:@"banner" elapsedTime:a4];
}

+ (id)_appNameForApp:(unint64_t)a3
{
  id v3 = @"unknown";
  if (a3 == 1) {
    id v3 = @"messagesApp";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"mailApp";
  }
}

+ (void)performedAction:(id)a3 forApp:(id)a4 onEvent:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v21 = a4;
  id v7 = a5;
  unsigned int v8 = [v7 state] - 1;
  if (v8 > 5) {
    id v9 = @"unknown";
  }
  else {
    id v9 = off_1E65BA368[v8];
  }
  uint64_t v19 = v9;
  v10 = objc_opt_new();
  [v10 setObject:&unk_1F2535F40 forKeyedSubscript:&stru_1F24EEF20];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = [v7 event];
  id v12 = [v11 tags];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v18 = objc_msgSend(MEMORY[0x1E4F5D9F0], "resolveName:", v17, v19);
        if ([v18 tracked]) {
          [v10 setObject:&unk_1F2535F40 forKeyedSubscript:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  [a1 incrementValuesInDomain:@"behavior.scalar" subdomain:v21 type:v19 action:v22 withKeysAndIncrements:v10 extraSignature:0];
}

+ (void)performedAction:(id)a3 onEventInCalendar:(id)a4
{
}

+ (void)performedAction:(id)a3 forApp:(id)a4 onContact:(id)a5
{
  id v14 = a5;
  id v8 = a4;
  id v9 = a3;
  if ([v14 state] == 1)
  {
    v10 = @"contact";
  }
  else if ([v14 state] == 2)
  {
    v10 = @"contactUpdate";
  }
  else
  {
    v10 = 0;
  }
  id v11 = [v14 extractionInfo];
  [v11 extractionType];
  id v12 = SGExtractionTypeDescription();

  uint64_t v13 = [v14 contact];
  [a1 _pushValuesForContact:v13 usingDomain:@"behavior" subdomain:v8 type:v10 action:v9 extraSignature:v12];
}

+ (void)performedAction:(id)a3 onDetail:(id)a4 forContact:(id)a5
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 extractionInfo];
  [v9 extractionType];
  v10 = SGExtractionTypeDescription();

  if (objc_opt_respondsToSelector())
  {
    id v11 = @"phone";
  }
  else
  {
    char v12 = objc_opt_respondsToSelector();
    id v11 = @"emailAddress";
    if (v12) {
      id v11 = @"postalAddress";
    }
  }
  v14[0] = &stru_1F24EEF20;
  v14[1] = v11;
  v15[0] = &unk_1F2535F40;
  v15[1] = &unk_1F2535F40;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [a1 incrementValuesInDomain:@"behavior.scalar" subdomain:@"contacts" type:@"detail" action:v8 withKeysAndIncrements:v13 extraSignature:v10];
}

+ (void)performedAction:(id)a3 onRecordForContact:(id)a4
{
}

+ (void)_pushValuesForContact:(id)a3 usingDomain:(id)a4 subdomain:(id)a5 type:(id)a6 action:(id)a7 extraSignature:(id)a8
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v114 = a6;
  id v17 = a7;
  id v105 = a8;
  uint64_t v18 = [[NSString alloc] initWithFormat:@"%@.distribution", v15];
  v103 = v15;
  v112 = (void *)[[NSString alloc] initWithFormat:@"%@.scalar", v15];
  double v19 = (double)(unint64_t)[v14 richness];
  v102 = v16;
  v113 = v17;
  v104 = (void *)v18;
  uint64_t v20 = (void *)[[NSString alloc] initWithFormat:@"%@.%@.%@.richness", v18, v17, v16];
  id v111 = a1;
  [a1 pushValue:v20 toDistKeyWithSuffix:v19];

  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id v21 = [v14 phones];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v135 objects:v146 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    LODWORD(v24) = 0;
    LODWORD(v25) = 0;
    uint64_t v26 = *(void *)v136;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v136 != v26) {
          objc_enumerationMutation(v21);
        }
        uint64_t v28 = *(void **)(*((void *)&v135 + 1) + 8 * i);
        v29 = [v28 extractionInfo];
        if ([v29 extractionType] == 1) {
          uint64_t v25 = (v25 + 1);
        }
        else {
          uint64_t v25 = v25;
        }

        uint64_t v30 = [v28 extractionInfo];
        if ([v30 extractionType] == 2) {
          uint64_t v24 = (v24 + 1);
        }
        else {
          uint64_t v24 = v24;
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v135 objects:v146 count:16];
    }
    while (v23);
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v25 = 0;
  }

  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  v106 = v14;
  v31 = [v14 emailAddresses];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v131 objects:v145 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    LODWORD(v34) = 0;
    LODWORD(v35) = 0;
    uint64_t v36 = *(void *)v132;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v132 != v36) {
          objc_enumerationMutation(v31);
        }
        v38 = *(void **)(*((void *)&v131 + 1) + 8 * j);
        v39 = [v38 extractionInfo];
        if ([v39 extractionType] == 1) {
          uint64_t v34 = (v34 + 1);
        }
        else {
          uint64_t v34 = v34;
        }

        v40 = [v38 extractionInfo];
        if ([v40 extractionType] == 2) {
          uint64_t v35 = (v35 + 1);
        }
        else {
          uint64_t v35 = v35;
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v131 objects:v145 count:16];
    }
    while (v33);
  }
  else
  {
    uint64_t v34 = 0;
    uint64_t v35 = 0;
  }

  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  obuint64_t j = [v106 postalAddresses];
  uint64_t v41 = [obj countByEnumeratingWithState:&v127 objects:v144 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    LODWORD(v43) = 0;
    LODWORD(v44) = 0;
    uint64_t v109 = *(void *)v128;
    do
    {
      for (uint64_t k = 0; k != v42; ++k)
      {
        if (*(void *)v128 != v109) {
          objc_enumerationMutation(obj);
        }
        v46 = *(void **)(*((void *)&v127 + 1) + 8 * k);
        v47 = [v46 extractionInfo];
        if ([v47 extractionType] == 1) {
          uint64_t v43 = (v43 + 1);
        }
        else {
          uint64_t v43 = v43;
        }

        v48 = [v46 extractionInfo];
        if ([v48 extractionType] == 2) {
          uint64_t v44 = (v44 + 1);
        }
        else {
          uint64_t v44 = v44;
        }
      }
      uint64_t v42 = [obj countByEnumeratingWithState:&v127 objects:v144 count:16];
    }
    while (v42);
  }
  else
  {
    uint64_t v43 = 0;
    uint64_t v44 = 0;
  }

  v143[0] = &unk_1F2535F40;
  v142[0] = &stru_1F24EEF20;
  v142[1] = @"phones";
  v49 = NSNumber;
  v110 = [v106 phones];
  objc_msgSend(v49, "numberWithUnsignedInteger:", objc_msgSend(v110, "count"));
  id obja = (id)objc_claimAutoreleasedReturnValue();
  v143[1] = obja;
  v142[2] = @"phones.sig";
  v101 = [NSNumber numberWithInt:v25];
  v143[2] = v101;
  v142[3] = @"phones.phrase";
  v100 = [NSNumber numberWithInt:v24];
  v143[3] = v100;
  v142[4] = @"emailAddresses";
  uint64_t v50 = NSNumber;
  uint64_t v51 = [v106 emailAddresses];
  long long v52 = objc_msgSend(v50, "numberWithUnsignedInteger:", objc_msgSend(v51, "count"));
  v143[4] = v52;
  v142[5] = @"emailAddresses.sig";
  long long v53 = [NSNumber numberWithInt:v34];
  v143[5] = v53;
  v142[6] = @"emailAddresses.phrase";
  long long v54 = [NSNumber numberWithInt:v35];
  v143[6] = v54;
  v142[7] = @"postalAddresses";
  long long v55 = NSNumber;
  v56 = [v106 postalAddresses];
  v57 = objc_msgSend(v55, "numberWithUnsignedInteger:", objc_msgSend(v56, "count"));
  v143[7] = v57;
  v142[8] = @"postalAddresses.sig";
  uint64_t v58 = [NSNumber numberWithInt:v43];
  v143[8] = v58;
  v142[9] = @"postalAddresses.phrase";
  v59 = [NSNumber numberWithInt:v44];
  v143[9] = v59;
  v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v143 forKeys:v142 count:10];

  [v111 incrementValuesInDomain:v112 subdomain:v102 type:v114 action:v113 withKeysAndIncrements:v60 extraSignature:v105];
  v61 = [v106 phones];
  double v62 = (double)(unint64_t)[v61 count];
  v63 = (void *)[[NSString alloc] initWithFormat:@"%@.phones", v104];
  [v111 pushValue:v63 toDistKeyWithSuffix:v62];

  v64 = [v106 emailAddresses];
  double v65 = (double)(unint64_t)[v64 count];
  v66 = (void *)[[NSString alloc] initWithFormat:@"%@.emailAddresses", v104];
  [v111 pushValue:v66 toDistKeyWithSuffix:v65];

  v67 = [v106 postalAddresses];
  double v68 = (double)(unint64_t)[v67 count];
  v69 = (void *)[[NSString alloc] initWithFormat:@"%@.postalAddresses", v104];
  [v111 pushValue:v69 toDistKeyWithSuffix:v68];

  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  v70 = [v106 phones];
  uint64_t v71 = [v70 countByEnumeratingWithState:&v123 objects:v141 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v124;
    do
    {
      for (uint64_t m = 0; m != v72; ++m)
      {
        if (*(void *)v124 != v73) {
          objc_enumerationMutation(v70);
        }
        v75 = *(void **)(*((void *)&v123 + 1) + 8 * m);
        v76 = [v75 label];

        if (v76)
        {
          id v77 = [NSString alloc];
          v78 = [v75 label];
          v79 = (void *)[v77 initWithFormat:@"%@.phones.%@", v114, v78];
          [v111 incrementKeyWithDomain:v112 subdomain:v102 suffix:v79 action:v113];
        }
      }
      uint64_t v72 = [v70 countByEnumeratingWithState:&v123 objects:v141 count:16];
    }
    while (v72);
  }

  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  v80 = [v106 emailAddresses];
  uint64_t v81 = [v80 countByEnumeratingWithState:&v119 objects:v140 count:16];
  if (v81)
  {
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v120;
    do
    {
      for (uint64_t n = 0; n != v82; ++n)
      {
        if (*(void *)v120 != v83) {
          objc_enumerationMutation(v80);
        }
        v85 = *(void **)(*((void *)&v119 + 1) + 8 * n);
        v86 = [v85 label];

        if (v86)
        {
          id v87 = [NSString alloc];
          v88 = [v85 label];
          v89 = (void *)[v87 initWithFormat:@"%@.emailAddresses.%@", v114, v88];
          [v111 incrementKeyWithDomain:v112 subdomain:v102 suffix:v89 action:v113];
        }
      }
      uint64_t v82 = [v80 countByEnumeratingWithState:&v119 objects:v140 count:16];
    }
    while (v82);
  }

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  v90 = [v106 postalAddresses];
  uint64_t v91 = [v90 countByEnumeratingWithState:&v115 objects:v139 count:16];
  if (v91)
  {
    uint64_t v92 = v91;
    uint64_t v93 = *(void *)v116;
    do
    {
      for (iuint64_t i = 0; ii != v92; ++ii)
      {
        if (*(void *)v116 != v93) {
          objc_enumerationMutation(v90);
        }
        v95 = *(void **)(*((void *)&v115 + 1) + 8 * ii);
        v96 = [v95 label];

        if (v96)
        {
          id v97 = [NSString alloc];
          v98 = [v95 label];
          v99 = (void *)[v97 initWithFormat:@"%@.postalAddresses.%@", v114, v98];
          [v111 incrementKeyWithDomain:v112 subdomain:v102 suffix:v99 action:v113];
        }
      }
      uint64_t v92 = [v90 countByEnumeratingWithState:&v115 objects:v139 count:16];
    }
    while (v92);
  }
}

+ (void)pushValue:(double)a3 toDistKeyWithSuffix:(id)a4
{
}

+ (void)setKeyWithDomain:(id)a3 suffix:(id)a4 toValue:(unint64_t)a5
{
}

+ (void)incrementKeyWithDomain:(id)a3 suffix:(id)a4
{
}

+ (void)incrementKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5
{
}

+ (void)incrementKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5 by:(unint64_t)a6
{
}

+ (void)incrementKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5 action:(id)a6
{
}

+ (void)incrementKeyWithDomain:(id)a3 subdomain:(id)a4 suffix:(id)a5 action:(id)a6 by:(unint64_t)a7
{
  if (a7) {
    +[SGAggregateLogging addValueForScalarKeyWithDomain:subdomain:suffix:action:value:](SGAggregateLogging, "addValueForScalarKeyWithDomain:subdomain:suffix:action:value:", a3, a4, a5, a6);
  }
}

+ (void)messagesFoundAfterUndisplayablyLost:(unint64_t)a3
{
}

+ (void)messagesUndisplayablyLost:(int64_t)a3
{
}

+ (void)messagesDeleted:(unint64_t)a3
{
}

+ (void)messagesFound:(unint64_t)a3
{
}

+ (void)messagesPruned:(unint64_t)a3
{
}

+ (void)messagesLost:(unint64_t)a3
{
}

+ (void)messagesAdded:(unint64_t)a3
{
}

+ (id)aggregateKeyForKeySuffix:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    double v4 = (void *)MEMORY[0x1CB79B230]();
    id v5 = [@"com.apple.suggestions" stringByAppendingString:@"."];
    id v6 = [v5 stringByAppendingString:v3];
  }
  else
  {
    id v6 = @"com.apple.suggestions";
  }

  return v6;
}

+ (unint64_t)twoSigFigs:(id)a3
{
  unint64_t result = [a3 longLongValue];
  if (result >= 0x65)
  {
    int v4 = 1;
    do
    {
      unint64_t v5 = result;
      result /= 0xAuLL;
      ++v4;
    }
    while (v5 > 0x3F1);
    do
    {
      result *= 10;
      --v4;
    }
    while (v4 > 1);
  }
  return result;
}

@end