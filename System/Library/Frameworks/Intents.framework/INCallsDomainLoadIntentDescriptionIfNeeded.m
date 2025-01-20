@interface INCallsDomainLoadIntentDescriptionIfNeeded
@end

@implementation INCallsDomainLoadIntentDescriptionIfNeeded

void ___INCallsDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v125[10] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v110 = [[INIntentSlotDescription alloc] initWithName:@"participants", 2, @"participants", @"participants", 0, 0, 10, 3, &unk_1EDBA8010, &unk_1EDBA8028, objc_opt_class(), sel_resolveParticipantsForAddCallParticipant_withCompletion_, sel_resolveParticipantsForAddCallParticipant_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v124 = v110;
  v109 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v124 count:1];
  v108 = _INIntentSchemaBuildIntentSlotDescriptionMap(v109);
  v107 = [(INIntentDescription *)v0 initWithName:@"AddCallParticipantIntent" responseName:@"AddCallParticipantIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.call.AddCallParticipantIntent" isPrivate:0 handleSelector:sel_handleAddCallParticipant_completion_ confirmSelector:sel_confirmAddCallParticipant_completion_ slotsByName:v108];
  v125[0] = v107;
  v3 = [INIntentDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v106 = [[INIntentSlotDescription alloc] initWithName:@"audioRoute" tag:2 facadePropertyName:@"audioRoute" dataPropertyName:@"audioRoute" isExtended:0 isPrivate:0 valueType:67 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v123[0] = v106;
  v105 = [[INIntentSlotDescription alloc] initWithName:@"callIdentifier" tag:3 facadePropertyName:@"callIdentifier" dataPropertyName:@"callIdentifier" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v123[1] = v105;
  v104 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:2];
  v103 = _INIntentSchemaBuildIntentSlotDescriptionMap(v104);
  v102 = [(INIntentDescription *)v3 initWithName:@"AnswerCallIntent" responseName:@"AnswerCallIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.call.AnswerCallIntent" isPrivate:0 handleSelector:sel_handleAnswerCall_completion_ confirmSelector:sel_confirmAnswerCall_completion_ slotsByName:v103];
  v125[1] = v102;
  v6 = [INIntentDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v101 = [[INIntentSlotDescription alloc] initWithName:@"callIdentifier" tag:2 facadePropertyName:@"callIdentifier" dataPropertyName:@"callIdentifier" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v122 = v101;
  v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v122 count:1];
  v99 = _INIntentSchemaBuildIntentSlotDescriptionMap(v100);
  v98 = [(INIntentDescription *)v6 initWithName:@"HangUpCallIntent" responseName:@"HangUpCallIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.call.HangUpCallIntent" isPrivate:0 handleSelector:sel_handleHangUpCall_completion_ confirmSelector:sel_confirmHangUpCall_completion_ slotsByName:v99];
  v125[2] = v98;
  v9 = [INIntentDescription alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v97 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v96 = [(INIntentDescription *)v9 initWithName:@"IdentifyIncomingCallerIntent" responseName:@"IdentifyIncomingCallerIntentResponse" facadeClass:v10 dataClass:v11 type:@"sirikit.intent.call.IdentifyIncomingCallerIntent" isPrivate:0 handleSelector:sel_handleIdentifyIncomingCaller_completion_ confirmSelector:sel_confirmIdentifyIncomingCaller_completion_ slotsByName:v97];
  v125[3] = v96;
  v12 = [INIntentDescription alloc];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v95 = [[INIntentSlotDescription alloc] initWithName:@"groupConversationFilter" tag:2 facadePropertyName:@"groupConversationFilter" dataPropertyName:@"groupConversationFilter" isExtended:0 isPrivate:0 valueType:81 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v121[0] = v95;
  v94 = [[INIntentSlotDescription alloc] initWithName:@"groupConversation", 10, @"groupConversation", @"groupConversation", 0, 0, 80, 1, &unk_1EDBA8040, &unk_1EDBA8058, objc_opt_class(), sel_resolveGroupConversationForJoinCall_withCompletion_, sel_resolveGroupConversationForJoinCall_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v121[1] = v94;
  v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:2];
  v92 = _INIntentSchemaBuildIntentSlotDescriptionMap(v93);
  v91 = [(INIntentDescription *)v12 initWithName:@"JoinCallIntent" responseName:@"JoinCallIntentResponse" facadeClass:v13 dataClass:v14 type:@"sirikit.intent.call.JoinCallIntent" isPrivate:0 handleSelector:sel_handleJoinCall_completion_ confirmSelector:sel_confirmJoinCall_completion_ slotsByName:v92];
  v125[4] = v91;
  v15 = [INIntentDescription alloc];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v90 = [[INIntentSlotDescription alloc] initWithName:@"callRecordIdentifier" tag:2 facadePropertyName:@"callRecordIdentifier" dataPropertyName:@"callRecordIdentifier" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v120 = v90;
  v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v120 count:1];
  v88 = _INIntentSchemaBuildIntentSlotDescriptionMap(v89);
  v87 = [(INIntentDescription *)v15 initWithName:@"PlayVoicemailIntent" responseName:@"PlayVoicemailIntentResponse" facadeClass:v16 dataClass:v17 type:@"sirikit.intent.call.PlayVoicemailIntent" isPrivate:0 handleSelector:sel_handlePlayVoicemail_completion_ confirmSelector:sel_confirmPlayVoicemail_completion_ slotsByName:v88];
  v125[5] = v87;
  v18 = [INIntentDescription alloc];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  v86 = [[INIntentSlotDescription alloc] initWithName:@"dateCreated", 5, @"dateCreated", @"dateCreated", 0, 0, 16, 1, &unk_1EDBA8070, &unk_1EDBA8088, objc_opt_class(), sel_resolveDateCreatedForSearchCallHistory_withCompletion_, sel_resolveDateCreatedForSearchCallHistory_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v119[0] = v86;
  v85 = [[INIntentSlotDescription alloc] initWithName:@"recipient", 6, @"recipient", @"recipient", 0, 0, 10, 1, &unk_1EDBA80A0, &unk_1EDBA80B8, objc_opt_class(), sel_resolveRecipientForSearchCallHistory_withCompletion_, sel_resolveRecipientForSearchCallHistory_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v119[1] = v85;
  v84 = [[INIntentSlotDescription alloc] initWithName:@"callCapabilities" tag:7 facadePropertyName:@"callCapabilities" dataPropertyName:@"callCapabilities" isExtended:0 isPrivate:0 valueType:68 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v119[2] = v84;
  v83 = [[INIntentSlotDescription alloc] initWithName:@"callTypes", 8, @"callTypes", @"callTypes", 0, 0, 72, 3, &unk_1EDBA80D0, &unk_1EDBA80E8, objc_opt_class(), sel_resolveCallTypesForSearchCallHistory_withCompletion_, sel_resolveCallTypeForSearchCallHistory_withCompletion_, sel_resolveCallTypeForSearchCallHistory_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v119[3] = v83;
  v82 = [[INIntentSlotDescription alloc] initWithName:@"preferredCallProvider" tag:9 facadePropertyName:@"preferredCallProvider" dataPropertyName:@"preferredCallProvider" isExtended:0 isPrivate:1 valueType:73 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v119[4] = v82;
  v81 = [[INIntentSlotDescription alloc] initWithName:@"unseen", 10, @"unseen", @"unseen", 0, 0, 1, 1, &unk_1EDBA8100, &unk_1EDBA8118, objc_opt_class(), sel_resolveUnseenForSearchCallHistory_withCompletion_, sel_resolveUnseenForSearchCallHistory_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v119[5] = v81;
  v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:6];
  v79 = _INIntentSchemaBuildIntentSlotDescriptionMap(v80);
  v78 = [(INIntentDescription *)v18 initWithName:@"SearchCallHistoryIntent" responseName:@"SearchCallHistoryIntentResponse" facadeClass:v19 dataClass:v20 type:@"sirikit.intent.call.SearchCallHistoryIntent" isPrivate:0 handleSelector:sel_handleSearchCallHistory_completion_ confirmSelector:sel_confirmSearchCallHistory_completion_ slotsByName:v79];
  v125[6] = v78;
  v21 = [INIntentDescription alloc];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  v77 = [[INIntentSlotDescription alloc] initWithName:@"audioRoute" tag:3 facadePropertyName:@"audioRoute" dataPropertyName:@"audioRoute" isExtended:0 isPrivate:1 valueType:67 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v118[0] = v77;
  v76 = [[INIntentSlotDescription alloc] initWithName:@"destinationType", 4, @"destinationType", @"destinationType", 0, 0, 70, 1, &unk_1EDBA8130, &unk_1EDBA8148, objc_opt_class(), sel_resolveDestinationTypeForStartAudioCall_withCompletion_, sel_resolveDestinationTypeForStartAudioCall_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v118[1] = v76;
  v75 = [[INIntentSlotDescription alloc] initWithName:@"preferredCallProvider" tag:5 facadePropertyName:@"preferredCallProvider" dataPropertyName:@"preferredCallProvider" isExtended:0 isPrivate:1 valueType:73 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v118[2] = v75;
  v74 = [[INIntentSlotDescription alloc] initWithName:@"contact", 6, @"contacts", @"contacts", 0, 0, 18, 3, &unk_1EDBA8160, &unk_1EDBA8178, objc_opt_class(), sel_resolveContactsForStartAudioCall_withCompletion_, sel_resolveContactsForStartAudioCall_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v118[3] = v74;
  v73 = [[INIntentSlotDescription alloc] initWithName:@"recordTypeForRedialing" tag:7 facadePropertyName:@"recordTypeForRedialing" dataPropertyName:@"recordTypeForRedialing" isExtended:0 isPrivate:1 valueType:71 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v118[4] = v73;
  v72 = [[INIntentSlotDescription alloc] initWithName:@"ttyType" tag:8 facadePropertyName:@"ttyType" dataPropertyName:@"ttyType" isExtended:0 isPrivate:1 valueType:66 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v118[5] = v72;
  v71 = [[INIntentSlotDescription alloc] initWithName:@"callRequestMetadata" tag:9 facadePropertyName:@"callRequestMetadata" dataPropertyName:@"callRequestMetadata" isExtended:0 isPrivate:1 valueType:83 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v118[6] = v71;
  v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:7];
  v69 = _INIntentSchemaBuildIntentSlotDescriptionMap(v70);
  v68 = [(INIntentDescription *)v21 initWithName:@"StartAudioCallIntent" responseName:@"StartAudioCallIntentResponse" facadeClass:v22 dataClass:v23 type:@"sirikit.intent.call.StartAudioCallIntent" isPrivate:0 handleSelector:sel_handleStartAudioCall_completion_ confirmSelector:sel_confirmStartAudioCall_completion_ slotsByName:v69];
  v125[7] = v68;
  v24 = [INIntentDescription alloc];
  uint64_t v61 = objc_opt_class();
  uint64_t v58 = objc_opt_class();
  v67 = [[INIntentSlotDescription alloc] initWithName:@"callRecordFilter" tag:13 facadePropertyName:@"callRecordFilter" dataPropertyName:@"callRecordFilter" isExtended:0 isPrivate:0 valueType:78 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v117[0] = v67;
  v66 = [[INIntentSlotDescription alloc] initWithName:@"callRecordToCallBack", 14, @"callRecordToCallBack", @"callRecordToCallBack", 0, 0, 74, 1, &unk_1EDBA8190, &unk_1EDBA81A8, objc_opt_class(), sel_resolveCallRecordToCallBackForStartCall_withCompletion_, sel_resolveCallRecordToCallBackForStartCall_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v117[1] = v66;
  v65 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", 67, 1, 0, 0, 0, 0);
  v117[2] = v65;
  v64 = [[INIntentSlotDescription alloc] initWithName:@"destinationType", 3, @"destinationType", @"destinationType", 0, 0, 70, 1, &unk_1EDBA81C0, &unk_1EDBA81D8, objc_opt_class(), sel_resolveDestinationTypeForStartCall_withCompletion_, sel_resolveDestinationTypeForStartCall_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v117[3] = v64;
  v63 = [[INIntentSlotDescription alloc] initWithName:@"preferredCallProvider", 4, @"preferredCallProvider", @"preferredCallProvider", 0, 1, 73, 1, &unk_1EDBA81F0, &unk_1EDBA8208, objc_opt_class(), sel_resolvePreferredCallProviderForStartCall_withCompletion_, sel_resolvePreferredCallProviderForStartCall_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v117[4] = v63;
  v60 = [[INIntentSlotDescription alloc] initWithName:@"contacts", 5, @"contacts", @"contacts", 0, 0, 10, 3, &unk_1EDBA8220, &unk_1EDBA8238, objc_opt_class(), sel_resolveContactsForStartCall_withCompletion_, sel_resolveContactsForStartCall_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v117[5] = v60;
  v57 = [[INIntentSlotDescription alloc] initWithName:@"ttyType" tag:7 facadePropertyName:@"ttyType" dataPropertyName:@"ttyType" isExtended:0 isPrivate:1 valueType:66 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v117[6] = v57;
  v56 = [[INIntentSlotDescription alloc] initWithName:@"callCapability", 8, @"callCapability", @"callCapability", 0, 0, 69, 1, &unk_1EDBA8250, &unk_1EDBA8268, objc_opt_class(), sel_resolveCallCapabilityForStartCall_withCompletion_, sel_resolveCallCapabilityForStartCall_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v117[7] = v56;
  v55 = [[INIntentSlotDescription alloc] initWithName:@"isGroupCall" tag:9 facadePropertyName:@"isGroupCall" dataPropertyName:@"isGroupCall" isExtended:0 isPrivate:1 valueType:1 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v117[8] = v55;
  v54 = [[INIntentSlotDescription alloc] initWithName:@"callGroups" tag:10 facadePropertyName:@"callGroups" dataPropertyName:@"callGroups" isExtended:0 isPrivate:1 valueType:79 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v117[9] = v54;
  v53 = [[INIntentSlotDescription alloc] initWithName:@"notificationThreadIdentifier" tag:11 facadePropertyName:@"notificationThreadIdentifier" dataPropertyName:@"notificationThreadIdentifier" isExtended:0 isPrivate:1 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v117[10] = v53;
  v52 = [[INIntentSlotDescription alloc] initWithName:@"faceTimeLink", 12, @"faceTimeLink", @"faceTimeLink", 0, 1, 7, 1, &unk_1EDBA8280, &unk_1EDBA8298, objc_opt_class(), sel_resolveFaceTimeLinkForStartCall_withCompletion_, sel_resolveFaceTimeLinkForStartCall_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v117[11] = v52;
  v51 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", 83, 1, 0, 0, 0, 0);
  v117[12] = v51;
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:13];
  v49 = _INIntentSchemaBuildIntentSlotDescriptionMap(v50);
  v25 = [(INIntentDescription *)v24 initWithName:@"StartCallIntent" responseName:@"StartCallIntentResponse" facadeClass:v61 dataClass:v58 type:@"sirikit.intent.call.StartCallIntent" isPrivate:0 handleSelector:sel_handleStartCall_completion_ confirmSelector:sel_confirmStartCall_completion_ slotsByName:v49];
  v125[8] = v25;
  v62 = [INIntentDescription alloc];
  uint64_t v59 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  v27 = [[INIntentSlotDescription alloc] initWithName:@"audioRoute" tag:3 facadePropertyName:@"audioRoute" dataPropertyName:@"audioRoute" isExtended:0 isPrivate:1 valueType:67 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v116[0] = v27;
  v28 = [[INIntentSlotDescription alloc] initWithName:@"contact", 4, @"contacts", @"contacts", 0, 0, 18, 3, &unk_1EDBA82B0, &unk_1EDBA82C8, objc_opt_class(), sel_resolveContactsForStartVideoCall_withCompletion_, sel_resolveContactsForStartVideoCall_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v116[1] = v28;
  v29 = [[INIntentSlotDescription alloc] initWithName:@"callRequestMetadata" tag:5 facadePropertyName:@"callRequestMetadata" dataPropertyName:@"callRequestMetadata" isExtended:0 isPrivate:1 valueType:83 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v116[2] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:3];
  v31 = _INIntentSchemaBuildIntentSlotDescriptionMap(v30);
  v32 = [(INIntentDescription *)v62 initWithName:@"StartVideoCallIntent" responseName:@"StartVideoCallIntentResponse" facadeClass:v59 dataClass:v26 type:@"sirikit.intent.call.StartVideoCallIntent" isPrivate:0 handleSelector:sel_handleStartVideoCall_completion_ confirmSelector:sel_confirmStartVideoCall_completion_ slotsByName:v31];
  v125[9] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v125 count:10];

  uint64_t v34 = [v33 count];
  v35 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v34];
  v36 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v34];
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v37 = v33;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v111 objects:v115 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v112;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v112 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = *(void **)(*((void *)&v111 + 1) + 8 * i);
        v43 = [v42 name];
        [v35 setObject:v42 forKey:v43];

        v44 = [v42 type];
        [v36 setObject:v42 forKey:v44];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v111 objects:v115 count:16];
    }
    while (v39);
  }

  uint64_t v45 = [v35 copy];
  v46 = (void *)sCallsDomain_intentDescsByName;
  sCallsDomain_intentDescsByName = v45;

  uint64_t v47 = [v36 copy];
  v48 = (void *)sCallsDomain_intentDescsByType;
  sCallsDomain_intentDescsByType = v47;
}

@end