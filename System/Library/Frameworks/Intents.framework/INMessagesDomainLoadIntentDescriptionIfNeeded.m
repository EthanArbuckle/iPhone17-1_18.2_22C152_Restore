@interface INMessagesDomainLoadIntentDescriptionIfNeeded
@end

@implementation INMessagesDomainLoadIntentDescriptionIfNeeded

void ___INMessagesDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v98[7] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v85 = [[INIntentSlotDescription alloc] initWithName:@"messageIdentifier" tag:2 facadePropertyName:@"messageIdentifier" dataPropertyName:@"messageIdentifier" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v97[0] = v85;
  v84 = [[INIntentSlotDescription alloc] initWithName:@"editedContent", 3, @"editedContent", @"editedContent", 0, 0, 7, 1, &unk_1EDBA8FD0, &unk_1EDBA8FE8, objc_opt_class(), sel_resolveEditedContentForEditMessage_withCompletion_, sel_resolveEditedContentForEditMessage_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v97[1] = v84;
  v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:2];
  v82 = _INIntentSchemaBuildIntentSlotDescriptionMap(v83);
  v81 = [(INIntentDescription *)v0 initWithName:@"EditMessageIntent" responseName:@"EditMessageIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.messages.EditMessageIntent" isPrivate:0 handleSelector:sel_handleEditMessage_completion_ confirmSelector:sel_confirmEditMessage_completion_ slotsByName:v82];
  v98[0] = v81;
  v3 = [INIntentDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v80 = [[INIntentSlotDescription alloc] initWithName:@"messageIdentifier" tag:2 facadePropertyName:@"messageIdentifier" dataPropertyName:@"messageIdentifier" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v96 = v80;
  v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v96 count:1];
  v78 = _INIntentSchemaBuildIntentSlotDescriptionMap(v79);
  v77 = [(INIntentDescription *)v3 initWithName:@"PlayAudioMessageIntent" responseName:@"PlayAudioMessageIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.messages.PlayAudioMessageIntent" isPrivate:0 handleSelector:sel_handlePlayAudioMessage_completion_ confirmSelector:sel_confirmPlayAudioMessage_completion_ slotsByName:v78];
  v98[1] = v77;
  v6 = [INIntentDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v76 = [[INIntentSlotDescription alloc] initWithName:@"soundType" tag:2 facadePropertyName:@"soundType" dataPropertyName:@"soundType" isExtended:0 isPrivate:0 valueType:91 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v95[0] = v76;
  v75 = [[INIntentSlotDescription alloc] initWithName:@"messageIdentifier" tag:3 facadePropertyName:@"messageIdentifier" dataPropertyName:@"messageIdentifier" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v95[1] = v75;
  v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:2];
  v73 = _INIntentSchemaBuildIntentSlotDescriptionMap(v74);
  v72 = [(INIntentDescription *)v6 initWithName:@"PlayMessageSoundIntent" responseName:@"PlayMessageSoundIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.messages.PlayMessageSoundIntent" isPrivate:0 handleSelector:sel_handlePlayMessageSound_completion_ confirmSelector:sel_confirmPlayMessageSound_completion_ slotsByName:v73];
  v98[2] = v72;
  v59 = [INIntentDescription alloc];
  uint64_t v57 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v71 = [[INIntentSlotDescription alloc] initWithName:@"recipient", 2, @"recipients", @"recipients", 0, 0, 11, 1, &unk_1EDBA9000, &unk_1EDBA9018, objc_opt_class(), sel_resolveRecipientsForSearchForMessages_withCompletion_, sel_resolveRecipientsForSearchForMessages_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v94[0] = v71;
  v70 = [[INIntentSlotDescription alloc] initWithName:@"sender", 3, @"senders", @"senders", 0, 0, 11, 1, &unk_1EDBA9030, &unk_1EDBA9048, objc_opt_class(), sel_resolveSendersForSearchForMessages_withCompletion_, sel_resolveSendersForSearchForMessages_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v94[1] = v70;
  v69 = [[INIntentSlotDescription alloc] initWithName:@"searchTerm" tag:9 facadePropertyName:@"searchTerms" dataPropertyName:@"searchTerms" isExtended:0 isPrivate:0 valueType:31 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v94[2] = v69;
  v68 = [[INIntentSlotDescription alloc] initWithName:@"attribute", 5, @"attributes", @"attributes", 0, 0, 85, 3, &unk_1EDBA9060, &unk_1EDBA9078, objc_opt_class(), sel_resolveAttributesForSearchForMessages_withCompletion_, sel_resolveAttributesForSearchForMessages_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v94[3] = v68;
  v67 = [[INIntentSlotDescription alloc] initWithName:@"dateTimeRange", 6, @"dateTimeRange", @"dateTimeRange", 0, 0, 16, 1, &unk_1EDBA9090, &unk_1EDBA90A8, objc_opt_class(), sel_resolveDateTimeRangeForSearchForMessages_withCompletion_, sel_resolveDateTimeRangeForSearchForMessages_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v94[4] = v67;
  v66 = [[INIntentSlotDescription alloc] initWithName:@"identifier" tag:7 facadePropertyName:@"identifiers" dataPropertyName:@"identifiers" isExtended:0 isPrivate:0 valueType:31 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v94[5] = v66;
  v65 = [[INIntentSlotDescription alloc] initWithName:@"notificationIdentifier" tag:8 facadePropertyName:@"notificationIdentifiers" dataPropertyName:@"notificationIdentifiers" isExtended:0 isPrivate:0 valueType:31 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v94[6] = v65;
  v64 = [[INIntentSlotDescription alloc] initWithName:@"speakableGroupName", 11, @"speakableGroupNames", @"speakableGroupNames", 0, 0, 13, 1, &unk_1EDBA90C0, &unk_1EDBA90D8, objc_opt_class(), sel_resolveSpeakableGroupNamesForSearchForMessages_withCompletion_, sel_resolveSpeakableGroupNamesForSearchForMessages_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v94[7] = v64;
  v63 = [[INIntentSlotDescription alloc] initWithName:@"conversationIdentifier" tag:12 facadePropertyName:@"conversationIdentifiers" dataPropertyName:@"conversationIdentifiers" isExtended:0 isPrivate:0 valueType:31 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v94[8] = v63;
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:9];
  v61 = _INIntentSchemaBuildIntentSlotDescriptionMap(v62);
  v60 = [(INIntentDescription *)v59 initWithName:@"SearchForMessagesIntent" responseName:@"SearchForMessagesIntentResponse" facadeClass:v57 dataClass:v9 type:@"sirikit.intent.messages.SearchForMessagesIntent" isPrivate:0 handleSelector:sel_handleSearchForMessages_completion_ confirmSelector:sel_confirmSearchForMessages_completion_ slotsByName:v61];
  v98[3] = v60;
  v49 = [INIntentDescription alloc];
  uint64_t v47 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  v58 = [[INIntentSlotDescription alloc] initWithName:@"recipient", 2, @"recipients", @"recipients", 0, 0, 10, 3, &unk_1EDBA90F0, &unk_1EDBA9108, objc_opt_class(), sel_resolveRecipientsForSendMessage_completion_, sel_resolveRecipientsForSendMessage_withCompletion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v93[0] = v58;
  v56 = [[INIntentSlotDescription alloc] initWithName:@"outgoingMessageType", 14, @"outgoingMessageType", @"outgoingMessageType", 0, 0, 90, 1, &unk_1EDBA9120, &unk_1EDBA9138, objc_opt_class(), sel_resolveOutgoingMessageTypeForSendMessage_withCompletion_, sel_resolveOutgoingMessageTypeForSendMessage_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v93[1] = v56;
  v55 = [[INIntentSlotDescription alloc] initWithName:@"content", 5, @"content", @"content", 0, 0, 30, 1, &unk_1EDBA9150, &unk_1EDBA9168, objc_opt_class(), sel_resolveContentForSendMessage_withCompletion_, sel_resolveContentForSendMessage_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v93[2] = v55;
  v54 = [[INIntentSlotDescription alloc] initWithName:@"speakableGroupName", 7, @"speakableGroupName", @"speakableGroupName", 0, 0, 12, 1, &unk_1EDBA9180, &unk_1EDBA9198, objc_opt_class(), sel_resolveSpeakableGroupNameForSendMessage_withCompletion_, sel_resolveGroupNameForSendMessage_withCompletion_, sel_resolveGroupNameForSendMessage_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v93[3] = v54;
  v53 = [[INIntentSlotDescription alloc] initWithName:@"conversationIdentifier" tag:8 facadePropertyName:@"conversationIdentifier" dataPropertyName:@"conversationIdentifier" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v93[4] = v53;
  v52 = [[INIntentSlotDescription alloc] initWithName:@"serviceName" tag:9 facadePropertyName:@"serviceName" dataPropertyName:@"serviceName" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v93[5] = v52;
  v51 = [[INIntentSlotDescription alloc] initWithName:@"sender" tag:10 facadePropertyName:@"sender" dataPropertyName:@"sender" isExtended:0 isPrivate:0 valueType:10 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v93[6] = v51;
  v43 = [[INIntentSlotDescription alloc] initWithName:@"effect", 12, @"effect", @"effect", 0, 1, 88, 1, &unk_1EDBA91B0, &unk_1EDBA91C8, objc_opt_class(), sel_resolveEffectForSendMessage_withCompletion_, sel_resolveEffectForSendMessage_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v93[7] = v43;
  v42 = [[INIntentSlotDescription alloc] initWithName:@"attachments" tag:13 facadePropertyName:@"attachments" dataPropertyName:@"attachments" isExtended:0 isPrivate:0 valueType:86 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v93[8] = v42;
  v41 = [[INIntentSlotDescription alloc] initWithName:@"notificationThreadIdentifier" tag:15 facadePropertyName:@"notificationThreadIdentifier" dataPropertyName:@"notificationThreadIdentifier" isExtended:0 isPrivate:1 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v93[9] = v41;
  v40 = [[INIntentSlotDescription alloc] initWithName:@"alternativeConversationIdentifier", 16, @"alternativeConversationIdentifier", @"alternativeConversationIdentifier", 0, 1, 7, 1, &unk_1EDBA91E0, &unk_1EDBA91F8, objc_opt_class(), sel_resolveAlternativeConversationIdentifierForSendMessage_withCompletion_, sel_resolveAlternativeConversationIdentifierForSendMessage_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v93[10] = v40;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:11];
  v38 = _INIntentSchemaBuildIntentSlotDescriptionMap(v39);
  v50 = [(INIntentDescription *)v49 initWithName:@"SendMessageIntent" responseName:@"SendMessageIntentResponse" facadeClass:v47 dataClass:v45 type:@"sirikit.intent.messages.SendMessageIntent" isPrivate:0 handleSelector:sel_handleSendMessage_completion_ confirmSelector:sel_confirmSendMessage_completion_ slotsByName:v38];
  v98[4] = v50;
  v10 = [INIntentDescription alloc];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v48 = [[INIntentSlotDescription alloc] initWithName:@"identifier" tag:2 facadePropertyName:@"identifiers" dataPropertyName:@"identifiers" isExtended:0 isPrivate:0 valueType:7 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v92[0] = v48;
  v46 = [[INIntentSlotDescription alloc] initWithName:@"attribute", 3, @"attribute", @"attribute", 0, 0, 84, 1, &unk_1EDBA9210, &unk_1EDBA9228, objc_opt_class(), sel_resolveAttributeForSetMessageAttribute_withCompletion_, sel_resolveAttributeForSetMessageAttribute_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v92[1] = v46;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:2];
  v37 = _INIntentSchemaBuildIntentSlotDescriptionMap(v44);
  v13 = [(INIntentDescription *)v10 initWithName:@"SetMessageAttributeIntent" responseName:@"SetMessageAttributeIntentResponse" facadeClass:v11 dataClass:v12 type:@"sirikit.intent.messages.SetMessageAttributeIntent" isPrivate:0 handleSelector:sel_handleSetMessageAttribute_completion_ confirmSelector:sel_confirmSetMessageAttribute_completion_ slotsByName:v37];
  v98[5] = v13;
  v14 = [INIntentDescription alloc];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  v17 = [[INIntentSlotDescription alloc] initWithName:@"messageIdentifiers" tag:2 facadePropertyName:@"messageIdentifiers" dataPropertyName:@"messageIdentifiers" isExtended:0 isPrivate:0 valueType:7 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v91 = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
  v19 = _INIntentSchemaBuildIntentSlotDescriptionMap(v18);
  v20 = [(INIntentDescription *)v14 initWithName:@"UnsendMessagesIntent" responseName:@"UnsendMessagesIntentResponse" facadeClass:v15 dataClass:v16 type:@"sirikit.intent.messages.UnsendMessagesIntent" isPrivate:0 handleSelector:sel_handleUnsendMessages_completion_ confirmSelector:sel_confirmUnsendMessages_completion_ slotsByName:v19];
  v98[6] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:7];

  uint64_t v22 = [v21 count];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v22];
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v22];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v25 = v21;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v86 objects:v90 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v87 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        v31 = [v30 name];
        [v23 setObject:v30 forKey:v31];

        v32 = [v30 type];
        [v24 setObject:v30 forKey:v32];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v86 objects:v90 count:16];
    }
    while (v27);
  }

  uint64_t v33 = [v23 copy];
  v34 = (void *)sMessagesDomain_intentDescsByName;
  sMessagesDomain_intentDescsByName = v33;

  uint64_t v35 = [v24 copy];
  v36 = (void *)sMessagesDomain_intentDescsByType;
  sMessagesDomain_intentDescsByType = v35;
}

@end