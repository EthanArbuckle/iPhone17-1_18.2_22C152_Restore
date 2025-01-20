@interface INCallsDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INCallsDomainLoadIntentResponseDescriptionIfNeeded

void ___INCallsDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v102[10] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v88 = [[INIntentSlotDescription alloc] initWithName:@"invites" tag:1 facadePropertyName:@"invites" dataPropertyName:@"invites" isExtended:0 isPrivate:0 valueType:82 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v101 = v88;
  v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
  v86 = _INIntentSchemaBuildIntentSlotDescriptionMap(v87);
  v85 = [(INIntentResponseDescription *)v0 initWithName:@"AddCallParticipantIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.call.AddCallParticipantIntentResponse" isPrivate:0 slotsByName:v86];
  v102[0] = v85;
  v3 = [INIntentResponseDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v84 = [[INIntentSlotDescription alloc] initWithName:@"statusCode" tag:1 facadePropertyName:@"statusCode" dataPropertyName:@"statusCode" isExtended:0 isPrivate:1 valueType:75 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v100[0] = v84;
  v83 = [[INIntentSlotDescription alloc] initWithName:@"callRecords" tag:2 facadePropertyName:@"callRecords" dataPropertyName:@"callRecords" isExtended:0 isPrivate:0 valueType:74 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v100[1] = v83;
  v82 = [[INIntentSlotDescription alloc] initWithName:@"answeredCall" tag:3 facadePropertyName:@"answeredCall" dataPropertyName:@"answeredCall" isExtended:0 isPrivate:1 valueType:77 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v100[2] = v82;
  v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:3];
  v80 = _INIntentSchemaBuildIntentSlotDescriptionMap(v81);
  v79 = [(INIntentResponseDescription *)v3 initWithName:@"AnswerCallIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.call.AnswerCallIntentResponse" isPrivate:0 slotsByName:v80];
  v102[1] = v79;
  v6 = [INIntentResponseDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v78 = [[INIntentSlotDescription alloc] initWithName:@"hungUpCallType" tag:1 facadePropertyName:@"hungUpCallType" dataPropertyName:@"hungUpCallType" isExtended:0 isPrivate:1 valueType:71 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v99 = v78;
  v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
  v76 = _INIntentSchemaBuildIntentSlotDescriptionMap(v77);
  v75 = [(INIntentResponseDescription *)v6 initWithName:@"HangUpCallIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.call.HangUpCallIntentResponse" isPrivate:0 slotsByName:v76];
  v102[2] = v75;
  v9 = [INIntentResponseDescription alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v74 = [[INIntentSlotDescription alloc] initWithName:@"statusCode" tag:1 facadePropertyName:@"statusCode" dataPropertyName:@"statusCode" isExtended:0 isPrivate:0 valueType:75 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v98[0] = v74;
  v73 = [[INIntentSlotDescription alloc] initWithName:@"callRecords" tag:2 facadePropertyName:@"callRecords" dataPropertyName:@"callRecords" isExtended:0 isPrivate:0 valueType:74 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v98[1] = v73;
  v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:2];
  v71 = _INIntentSchemaBuildIntentSlotDescriptionMap(v72);
  v70 = [(INIntentResponseDescription *)v9 initWithName:@"IdentifyIncomingCallerIntentResponse" facadeClass:v10 dataClass:v11 type:@"sirikit.intent.call.IdentifyIncomingCallerIntentResponse" isPrivate:0 slotsByName:v71];
  v102[3] = v70;
  v12 = [INIntentResponseDescription alloc];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = (void *)MEMORY[0x1E4F1CBF0];
  v69 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v68 = [(INIntentResponseDescription *)v12 initWithName:@"JoinCallIntentResponse" facadeClass:v13 dataClass:v14 type:@"sirikit.intent.call.JoinCallIntentResponse" isPrivate:0 slotsByName:v69];
  v102[4] = v68;
  v16 = [INIntentResponseDescription alloc];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  v67 = _INIntentSchemaBuildIntentSlotDescriptionMap(v15);
  v66 = [(INIntentResponseDescription *)v16 initWithName:@"PlayVoicemailIntentResponse" facadeClass:v17 dataClass:v18 type:@"sirikit.intent.call.PlayVoicemailIntentResponse" isPrivate:0 slotsByName:v67];
  v102[5] = v66;
  v19 = [INIntentResponseDescription alloc];
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  v65 = [[INIntentSlotDescription alloc] initWithName:@"callRecords" tag:6 facadePropertyName:@"callRecords" dataPropertyName:@"callRecords" isExtended:0 isPrivate:0 valueType:74 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v97 = v65;
  v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
  v63 = _INIntentSchemaBuildIntentSlotDescriptionMap(v64);
  v62 = [(INIntentResponseDescription *)v19 initWithName:@"SearchCallHistoryIntentResponse" facadeClass:v20 dataClass:v21 type:@"sirikit.intent.call.SearchCallHistoryIntentResponse" isPrivate:0 slotsByName:v63];
  v102[6] = v62;
  v22 = [INIntentResponseDescription alloc];
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  v61 = [[INIntentSlotDescription alloc] initWithName:@"metrics" tag:1000 facadePropertyName:@"timeToEstablishCall" dataPropertyName:@"metrics" isExtended:0 isPrivate:1 valueType:3 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v96 = v61;
  v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v96 count:1];
  v59 = _INIntentSchemaBuildIntentSlotDescriptionMap(v60);
  v58 = [(INIntentResponseDescription *)v22 initWithName:@"StartAudioCallIntentResponse" facadeClass:v23 dataClass:v24 type:@"sirikit.intent.call.StartAudioCallIntentResponse" isPrivate:0 slotsByName:v59];
  v102[7] = v58;
  v25 = [INIntentResponseDescription alloc];
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  v57 = [[INIntentSlotDescription alloc] initWithName:@"shouldDoEmergencyCountdown" tag:1 facadePropertyName:@"shouldDoEmergencyCountdown" dataPropertyName:@"shouldDoEmergencyCountdown" isExtended:0 isPrivate:1 valueType:1 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v95[0] = v57;
  v56 = [[INIntentSlotDescription alloc] initWithName:@"confirmationReason" tag:2 facadePropertyName:@"confirmationReason" dataPropertyName:@"confirmationReason" isExtended:0 isPrivate:1 valueType:76 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v95[1] = v56;
  v55 = [[INIntentSlotDescription alloc] initWithName:@"startedCall" tag:3 facadePropertyName:@"startedCall" dataPropertyName:@"startedCall" isExtended:0 isPrivate:1 valueType:77 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v95[2] = v55;
  v54 = [[INIntentSlotDescription alloc] initWithName:@"restrictedContacts" tag:4 facadePropertyName:@"restrictedContacts" dataPropertyName:@"restrictedContacts" isExtended:0 isPrivate:1 valueType:10 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v95[3] = v54;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:4];
  v29 = _INIntentSchemaBuildIntentSlotDescriptionMap(v28);
  v30 = [(INIntentResponseDescription *)v25 initWithName:@"StartCallIntentResponse" facadeClass:v26 dataClass:v27 type:@"sirikit.intent.call.StartCallIntentResponse" isPrivate:0 slotsByName:v29];
  v102[8] = v30;
  v31 = [INIntentResponseDescription alloc];
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  v34 = [[INIntentSlotDescription alloc] initWithName:@"metrics" tag:1000 facadePropertyName:@"timeToEstablishCall" dataPropertyName:@"metrics" isExtended:0 isPrivate:1 valueType:3 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v94 = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
  v36 = _INIntentSchemaBuildIntentSlotDescriptionMap(v35);
  v37 = [(INIntentResponseDescription *)v31 initWithName:@"StartVideoCallIntentResponse" facadeClass:v32 dataClass:v33 type:@"sirikit.intent.call.StartVideoCallIntentResponse" isPrivate:0 slotsByName:v36];
  v102[9] = v37;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:10];

  uint64_t v39 = [v38 count];
  v40 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v39];
  v41 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v39];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v42 = v38;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v89 objects:v93 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v90;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v90 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        v48 = [v47 name];
        [v40 setObject:v47 forKey:v48];

        v49 = [v47 type];
        [v41 setObject:v47 forKey:v49];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v89 objects:v93 count:16];
    }
    while (v44);
  }

  uint64_t v50 = [v40 copy];
  v51 = (void *)sCallsDomain_intentResponseDescsByName;
  sCallsDomain_intentResponseDescsByName = v50;

  uint64_t v52 = [v41 copy];
  v53 = (void *)sCallsDomain_intentResponseDescsByType;
  sCallsDomain_intentResponseDescsByType = v52;
}

@end