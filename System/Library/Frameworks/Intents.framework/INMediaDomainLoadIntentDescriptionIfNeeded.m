@interface INMediaDomainLoadIntentDescriptionIfNeeded
@end

@implementation INMediaDomainLoadIntentDescriptionIfNeeded

void ___INMediaDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v77[4] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v67 = [[INIntentSlotDescription alloc] initWithName:@"mediaItems", 2, @"mediaItems", @"mediaItems", 0, 0, 153, 3, &unk_1EDBA8DC0, &unk_1EDBA8DD8, objc_opt_class(), sel_resolveMediaItemsForAddMedia_withCompletion_, sel_resolveMediaItemsForAddMedia_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v76[0] = v67;
  v66 = [[INIntentSlotDescription alloc] initWithName:@"mediaSearch" tag:3 facadePropertyName:@"mediaSearch" dataPropertyName:@"mediaSearch" isExtended:0 isPrivate:0 valueType:157 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v76[1] = v66;
  v65 = [[INIntentSlotDescription alloc] initWithName:@"mediaDestination", 4, @"mediaDestination", @"mediaDestination", 0, 0, 159, 1, &unk_1EDBA8DF0, &unk_1EDBA8E08, objc_opt_class(), sel_resolveMediaDestinationForAddMedia_withCompletion_, sel_resolveMediaDestinationForAddMedia_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v76[2] = v65;
  v64 = [[INIntentSlotDescription alloc] initWithName:@"privateAddMediaIntentData" tag:6 facadePropertyName:@"privateAddMediaIntentData" dataPropertyName:@"privateAddMediaIntentData" isExtended:0 isPrivate:1 valueType:164 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v76[3] = v64;
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:4];
  v62 = _INIntentSchemaBuildIntentSlotDescriptionMap(v63);
  v61 = [(INIntentDescription *)v0 initWithName:@"AddMediaIntent" responseName:@"AddMediaIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.media.AddMediaIntent" isPrivate:0 handleSelector:sel_handleAddMedia_completion_ confirmSelector:sel_confirmAddMedia_completion_ slotsByName:v62];
  v77[0] = v61;
  v3 = [INIntentDescription alloc];
  uint64_t v47 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  v60 = [[INIntentSlotDescription alloc] initWithName:@"mediaItems", 2, @"mediaItems", @"mediaItems", 0, 0, 153, 3, &unk_1EDBA8E20, &unk_1EDBA8E38, objc_opt_class(), sel_resolveMediaItemsForPlayMedia_withCompletion_, sel_resolveMediaItemsForPlayMedia_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v75[0] = v60;
  v59 = [[INIntentSlotDescription alloc] initWithName:@"mediaContainer" tag:3 facadePropertyName:@"mediaContainer" dataPropertyName:@"mediaContainer" isExtended:0 isPrivate:0 valueType:153 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75[1] = v59;
  v58 = [[INIntentSlotDescription alloc] initWithName:@"playShuffled", 4, @"playShuffled", @"playShuffled", 0, 0, 1, 1, &unk_1EDBA8E50, &unk_1EDBA8E68, objc_opt_class(), sel_resolvePlayShuffledForPlayMedia_withCompletion_, sel_resolvePlayShuffledForPlayMedia_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v75[2] = v58;
  v57 = [[INIntentSlotDescription alloc] initWithName:@"playbackRepeatMode", 5, @"playbackRepeatMode", @"playbackRepeatMode", 0, 0, 155, 1, &unk_1EDBA8E80, &unk_1EDBA8E98, objc_opt_class(), sel_resolvePlaybackRepeatModeForPlayMedia_withCompletion_, sel_resolvePlaybackRepeatModeForPlayMedia_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v75[3] = v57;
  v56 = [[INIntentSlotDescription alloc] initWithName:@"resumePlayback", 6, @"resumePlayback", @"resumePlayback", 0, 0, 1, 1, &unk_1EDBA8EB0, &unk_1EDBA8EC8, objc_opt_class(), sel_resolveResumePlaybackForPlayMedia_withCompletion_, sel_resolveResumePlaybackForPlayMedia_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v75[4] = v56;
  v55 = [[INIntentSlotDescription alloc] initWithName:@"expirationDate" tag:7 facadePropertyName:@"expirationDate" dataPropertyName:@"expirationDate" isExtended:0 isPrivate:1 valueType:34 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75[5] = v55;
  v54 = [[INIntentSlotDescription alloc] initWithName:@"bucket" tag:8 facadePropertyName:@"buckets" dataPropertyName:@"buckets" isExtended:0 isPrivate:1 valueType:12 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75[6] = v54;
  v53 = [[INIntentSlotDescription alloc] initWithName:@"recoID" tag:9 facadePropertyName:@"recoID" dataPropertyName:@"recoID" isExtended:0 isPrivate:1 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75[7] = v53;
  v52 = [[INIntentSlotDescription alloc] initWithName:@"playbackQueueLocation", 10, @"playbackQueueLocation", @"playbackQueueLocation", 0, 0, 156, 1, &unk_1EDBA8EE0, &unk_1EDBA8EF8, objc_opt_class(), sel_resolvePlaybackQueueLocationForPlayMedia_withCompletion_, sel_resolvePlaybackQueueLocationForPlayMedia_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v75[8] = v52;
  v51 = [[INIntentSlotDescription alloc] initWithName:@"playbackSpeed", 11, @"playbackSpeed", @"playbackSpeed", 0, 0, 3, 1, &unk_1EDBA8F10, &unk_1EDBA8F28, objc_opt_class(), sel_resolvePlaybackSpeedForPlayMedia_withCompletion_, sel_resolvePlaybackSpeedForPlayMedia_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v75[9] = v51;
  v50 = [[INIntentSlotDescription alloc] initWithName:@"mediaSearch" tag:12 facadePropertyName:@"mediaSearch" dataPropertyName:@"mediaSearch" isExtended:0 isPrivate:0 valueType:157 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75[10] = v50;
  v49 = [[INIntentSlotDescription alloc] initWithName:@"hashedRouteUIDs" tag:13 facadePropertyName:@"hashedRouteUIDs" dataPropertyName:@"hashedRouteUIDs" isExtended:0 isPrivate:1 valueType:30 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75[11] = v49;
  v44 = [[INIntentSlotDescription alloc] initWithName:@"audioSearchResults" tag:20 facadePropertyName:@"audioSearchResults" dataPropertyName:@"audioSearchResults" isExtended:0 isPrivate:1 valueType:160 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75[12] = v44;
  v43 = [[INIntentSlotDescription alloc] initWithName:@"alternativeResults" tag:21 facadePropertyName:@"alternativeResults" dataPropertyName:@"alternativeResults" isExtended:0 isPrivate:1 valueType:160 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75[13] = v43;
  v42 = [[INIntentSlotDescription alloc] initWithName:@"parsecCategory" tag:22 facadePropertyName:@"parsecCategory" dataPropertyName:@"parsecCategory" isExtended:0 isPrivate:1 valueType:161 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75[14] = v42;
  v41 = [[INIntentSlotDescription alloc] initWithName:@"proxiedBundleIdentifier" tag:100 facadePropertyName:@"proxiedBundleIdentifier" dataPropertyName:@"proxiedBundleIdentifier" isExtended:0 isPrivate:1 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75[15] = v41;
  v40 = [[INIntentSlotDescription alloc] initWithName:@"privatePlayMediaIntentData" tag:110 facadePropertyName:@"privatePlayMediaIntentData" dataPropertyName:@"privatePlayMediaIntentData" isExtended:0 isPrivate:1 valueType:163 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75[16] = v40;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:17];
  v38 = _INIntentSchemaBuildIntentSlotDescriptionMap(v39);
  v48 = [(INIntentDescription *)v3 initWithName:@"PlayMediaIntent" responseName:@"PlayMediaIntentResponse" facadeClass:v47 dataClass:v45 type:@"sirikit.intent.media.PlayMediaIntent" isPrivate:0 handleSelector:sel_handlePlayMedia_completion_ confirmSelector:sel_confirmPlayMedia_completion_ slotsByName:v38];
  v77[1] = v48;
  v4 = [INIntentDescription alloc];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v46 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", 153, 3, &unk_1EDBA8F40, &unk_1EDBA8F58, objc_opt_class(), sel_resolveMediaItemsForSearchForMedia_withCompletion_, sel_resolveMediaItemsForSearchForMedia_completion_, 0);
  v74[0] = v46;
  v37 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", 157, 1, 0, 0, 0, 0);
  v74[1] = v37;
  v36 = [[INIntentSlotDescription alloc] initWithName:@"privateSearchForMediaIntentData" tag:100 facadePropertyName:@"privateSearchForMediaIntentData" dataPropertyName:@"privateSearchForMediaIntentData" isExtended:0 isPrivate:1 valueType:166 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v74[2] = v36;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:3];
  v34 = _INIntentSchemaBuildIntentSlotDescriptionMap(v35);
  v7 = [(INIntentDescription *)v4 initWithName:@"SearchForMediaIntent" responseName:@"SearchForMediaIntentResponse" facadeClass:v5 dataClass:v6 type:@"sirikit.intent.media.SearchForMediaIntent" isPrivate:0 handleSelector:sel_handleSearchForMedia_completion_ confirmSelector:sel_confirmSearchForMedia_completion_ slotsByName:v34];
  v77[2] = v7;
  v33 = [INIntentDescription alloc];
  uint64_t v32 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  v8 = [[INIntentSlotDescription alloc] initWithName:@"mediaItems", 2, @"mediaItems", @"mediaItems", 0, 0, 153, 3, &unk_1EDBA8F70, &unk_1EDBA8F88, objc_opt_class(), sel_resolveMediaItemsForUpdateMediaAffinity_withCompletion_, sel_resolveMediaItemsForUpdateMediaAffinity_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v73[0] = v8;
  v9 = [[INIntentSlotDescription alloc] initWithName:@"mediaSearch" tag:3 facadePropertyName:@"mediaSearch" dataPropertyName:@"mediaSearch" isExtended:0 isPrivate:0 valueType:157 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v73[1] = v9;
  v10 = [[INIntentSlotDescription alloc] initWithName:@"affinityType", 4, @"affinityType", @"affinityType", 0, 0, 158, 1, &unk_1EDBA8FA0, &unk_1EDBA8FB8, objc_opt_class(), sel_resolveAffinityTypeForUpdateMediaAffinity_withCompletion_, sel_resolveAffinityTypeForUpdateMediaAffinity_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v73[2] = v10;
  v11 = [[INIntentSlotDescription alloc] initWithName:@"privateUpdateMediaAffinityIntentData" tag:6 facadePropertyName:@"privateUpdateMediaAffinityIntentData" dataPropertyName:@"privateUpdateMediaAffinityIntentData" isExtended:0 isPrivate:1 valueType:165 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v73[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:4];
  v13 = _INIntentSchemaBuildIntentSlotDescriptionMap(v12);
  v14 = [(INIntentDescription *)v33 initWithName:@"UpdateMediaAffinityIntent" responseName:@"UpdateMediaAffinityIntentResponse" facadeClass:v32 dataClass:v31 type:@"sirikit.intent.media.UpdateMediaAffinityIntent" isPrivate:0 handleSelector:sel_handleUpdateMediaAffinity_completion_ confirmSelector:sel_confirmUpdateMediaAffinity_completion_ slotsByName:v13];
  v77[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:4];

  uint64_t v16 = [v15 count];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v16];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v16];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v19 = v15;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v68 objects:v72 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v69 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        v25 = [v24 name];
        [v17 setObject:v24 forKey:v25];

        v26 = [v24 type];
        [v18 setObject:v24 forKey:v26];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v68 objects:v72 count:16];
    }
    while (v21);
  }

  uint64_t v27 = [v17 copy];
  v28 = (void *)sMediaDomain_intentDescsByName;
  sMediaDomain_intentDescsByName = v27;

  uint64_t v29 = [v18 copy];
  v30 = (void *)sMediaDomain_intentDescsByType;
  sMediaDomain_intentDescsByType = v29;
}

@end