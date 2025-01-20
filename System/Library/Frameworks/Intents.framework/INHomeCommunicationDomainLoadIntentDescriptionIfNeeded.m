@interface INHomeCommunicationDomainLoadIntentDescriptionIfNeeded
@end

@implementation INHomeCommunicationDomainLoadIntentDescriptionIfNeeded

void ___INHomeCommunicationDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v61[5] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v52 = [[INIntentSlotDescription alloc] initWithName:@"soundType" tag:2 facadePropertyName:@"soundType" dataPropertyName:@"soundType" isExtended:0 isPrivate:0 valueType:95 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v60 = v52;
  v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
  v50 = _INIntentSchemaBuildIntentSlotDescriptionMap(v51);
  v49 = [(INIntentDescription *)v0 initWithName:@"PlayAnnouncementSoundIntent" responseName:@"PlayAnnouncementSoundIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.home.communication.PlayAnnouncementSoundIntent" isPrivate:0 handleSelector:sel_handlePlayAnnouncementSound_completion_ confirmSelector:sel_confirmPlayAnnouncementSound_completion_ slotsByName:v50];
  v61[0] = v49;
  v3 = [INIntentDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v48 = [[INIntentSlotDescription alloc] initWithName:@"readType" tag:2 facadePropertyName:@"readType" dataPropertyName:@"readType" isExtended:0 isPrivate:0 valueType:96 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v59[0] = v48;
  v47 = [[INIntentSlotDescription alloc] initWithName:@"startAnnouncementIdentifier" tag:3 facadePropertyName:@"startAnnouncementIdentifier" dataPropertyName:@"startAnnouncementIdentifier" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v59[1] = v47;
  v46 = [[INIntentSlotDescription alloc] initWithName:@"userNotificationType" tag:4 facadePropertyName:@"userNotificationType" dataPropertyName:@"userNotificationType" isExtended:0 isPrivate:0 valueType:97 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v59[2] = v46;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:3];
  v44 = _INIntentSchemaBuildIntentSlotDescriptionMap(v45);
  v43 = [(INIntentDescription *)v3 initWithName:@"ReadAnnouncementIntent" responseName:@"ReadAnnouncementIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.home.communication.ReadAnnouncementIntent" isPrivate:0 handleSelector:sel_handleReadAnnouncement_completion_ confirmSelector:sel_confirmReadAnnouncement_completion_ slotsByName:v44];
  v61[1] = v43;
  v6 = [INIntentDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v42 = [[INIntentSlotDescription alloc] initWithName:@"announcement", 2, @"announcement", @"announcement", 0, 0, 93, 1, &unk_1EDBA8C10, &unk_1EDBA8C28, objc_opt_class(), sel_resolveAnnouncementForSendAnnouncement_withCompletion_, sel_resolveAnnouncementForSendAnnouncement_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v58[0] = v42;
  v41 = [[INIntentSlotDescription alloc] initWithName:@"recipients", 3, @"recipients", @"recipients", 0, 0, 49, 3, &unk_1EDBA8C40, &unk_1EDBA8C58, objc_opt_class(), sel_resolveRecipientsForSendAnnouncement_withCompletion_, sel_resolveRecipientsForSendAnnouncement_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v58[1] = v41;
  v40 = [[INIntentSlotDescription alloc] initWithName:@"isReply" tag:4 facadePropertyName:@"isReply" dataPropertyName:@"isReply" isExtended:0 isPrivate:0 valueType:1 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v58[2] = v40;
  v39 = [[INIntentSlotDescription alloc] initWithName:@"sharedUserID" tag:5 facadePropertyName:@"sharedUserID" dataPropertyName:@"sharedUserID" isExtended:0 isPrivate:1 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v58[3] = v39;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];
  v9 = _INIntentSchemaBuildIntentSlotDescriptionMap(v38);
  v10 = [(INIntentDescription *)v6 initWithName:@"SendAnnouncementIntent" responseName:@"SendAnnouncementIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.home.communication.SendAnnouncementIntent" isPrivate:0 handleSelector:sel_handleSendAnnouncement_completion_ confirmSelector:sel_confirmSendAnnouncement_completion_ slotsByName:v9];
  v61[2] = v10;
  v11 = [INIntentDescription alloc];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = (void *)MEMORY[0x1E4F1CBF0];
  v15 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v16 = [(INIntentDescription *)v11 initWithName:@"SkipAnnouncementIntent" responseName:@"SkipAnnouncementIntentResponse" facadeClass:v12 dataClass:v13 type:@"sirikit.intent.home.communication.SkipAnnouncementIntent" isPrivate:0 handleSelector:sel_handleSkipAnnouncement_completion_ confirmSelector:sel_confirmSkipAnnouncement_completion_ slotsByName:v15];
  v61[3] = v16;
  v17 = [INIntentDescription alloc];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  v20 = _INIntentSchemaBuildIntentSlotDescriptionMap(v14);
  v21 = [(INIntentDescription *)v17 initWithName:@"StopAnnouncementIntent" responseName:@"StopAnnouncementIntentResponse" facadeClass:v18 dataClass:v19 type:@"sirikit.intent.home.communication.StopAnnouncementIntent" isPrivate:0 handleSelector:sel_handleStopAnnouncement_completion_ confirmSelector:sel_confirmStopAnnouncement_completion_ slotsByName:v20];
  v61[4] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:5];

  uint64_t v23 = [v22 count];
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v23];
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v23];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v26 = v22;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v54 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        v32 = [v31 name];
        [v24 setObject:v31 forKey:v32];

        v33 = [v31 type];
        [v25 setObject:v31 forKey:v33];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v28);
  }

  uint64_t v34 = [v24 copy];
  v35 = (void *)sHomeCommunicationDomain_intentDescsByName;
  sHomeCommunicationDomain_intentDescsByName = v34;

  uint64_t v36 = [v25 copy];
  v37 = (void *)sHomeCommunicationDomain_intentDescsByType;
  sHomeCommunicationDomain_intentDescsByType = v36;
}

@end