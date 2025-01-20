@interface INHomeCommunicationDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INHomeCommunicationDomainLoadIntentResponseDescriptionIfNeeded

void ___INHomeCommunicationDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v56[5] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = (void *)MEMORY[0x1E4F1CBF0];
  v47 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v46 = [(INIntentResponseDescription *)v0 initWithName:@"PlayAnnouncementSoundIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.home.communication.PlayAnnouncementSoundIntentResponse" isPrivate:0 slotsByName:v47];
  v56[0] = v46;
  v4 = [INIntentResponseDescription alloc];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v45 = [[INIntentSlotDescription alloc] initWithName:@"announcementRecords" tag:1 facadePropertyName:@"announcementRecords" dataPropertyName:@"announcementRecords" isExtended:0 isPrivate:0 valueType:94 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v55 = v45;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
  v43 = _INIntentSchemaBuildIntentSlotDescriptionMap(v44);
  v42 = [(INIntentResponseDescription *)v4 initWithName:@"ReadAnnouncementIntentResponse" facadeClass:v5 dataClass:v6 type:@"sirikit.intent.home.communication.ReadAnnouncementIntentResponse" isPrivate:0 slotsByName:v43];
  v56[1] = v42;
  v7 = [INIntentResponseDescription alloc];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v41 = [[INIntentSlotDescription alloc] initWithName:@"sentAnnouncements" tag:1 facadePropertyName:@"sentAnnouncements" dataPropertyName:@"sentAnnouncements" isExtended:0 isPrivate:0 valueType:94 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v54 = v41;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
  v39 = _INIntentSchemaBuildIntentSlotDescriptionMap(v40);
  v10 = [(INIntentResponseDescription *)v7 initWithName:@"SendAnnouncementIntentResponse" facadeClass:v8 dataClass:v9 type:@"sirikit.intent.home.communication.SendAnnouncementIntentResponse" isPrivate:0 slotsByName:v39];
  v56[2] = v10;
  v11 = [INIntentResponseDescription alloc];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = _INIntentSchemaBuildIntentSlotDescriptionMap(v3);
  v15 = [(INIntentResponseDescription *)v11 initWithName:@"SkipAnnouncementIntentResponse" facadeClass:v12 dataClass:v13 type:@"sirikit.intent.home.communication.SkipAnnouncementIntentResponse" isPrivate:0 slotsByName:v14];
  v56[3] = v15;
  v16 = [INIntentResponseDescription alloc];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  v19 = [[INIntentSlotDescription alloc] initWithName:@"stoppedAnnouncementRecords" tag:1 facadePropertyName:@"stoppedAnnouncementRecords" dataPropertyName:@"stoppedAnnouncementRecords" isExtended:0 isPrivate:0 valueType:94 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v53 = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
  v21 = _INIntentSchemaBuildIntentSlotDescriptionMap(v20);
  v22 = [(INIntentResponseDescription *)v16 initWithName:@"StopAnnouncementIntentResponse" facadeClass:v17 dataClass:v18 type:@"sirikit.intent.home.communication.StopAnnouncementIntentResponse" isPrivate:0 slotsByName:v21];
  v56[4] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:5];

  uint64_t v24 = [v23 count];
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v24];
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v24];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v27 = v23;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v49 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v33 = [v32 name];
        [v25 setObject:v32 forKey:v33];

        v34 = [v32 type];
        [v26 setObject:v32 forKey:v34];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v29);
  }

  uint64_t v35 = [v25 copy];
  v36 = (void *)sHomeCommunicationDomain_intentResponseDescsByName;
  sHomeCommunicationDomain_intentResponseDescsByName = v35;

  uint64_t v37 = [v26 copy];
  v38 = (void *)sHomeCommunicationDomain_intentResponseDescsByType;
  sHomeCommunicationDomain_intentResponseDescsByType = v37;
}

@end