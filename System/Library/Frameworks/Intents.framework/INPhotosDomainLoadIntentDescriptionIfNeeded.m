@interface INPhotosDomainLoadIntentDescriptionIfNeeded
@end

@implementation INPhotosDomainLoadIntentDescriptionIfNeeded

void ___INPhotosDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v54[2] = *MEMORY[0x1E4F143B8];
  v36 = [INIntentDescription alloc];
  uint64_t v34 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  v46 = [[INIntentSlotDescription alloc] initWithName:@"dateCreated", 2, @"dateCreated", @"dateCreated", 0, 0, 16, 1, &unk_1EDBA9E70, &unk_1EDBA9E88, objc_opt_class(), sel_resolveDateCreatedForSearchForPhotos_withCompletion_, sel_resolveDateCreatedForSearchForPhotos_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v53[0] = v46;
  v45 = [[INIntentSlotDescription alloc] initWithName:@"locationCreated", 3, @"locationCreated", @"locationCreated", 0, 0, 27, 1, &unk_1EDBA9EA0, &unk_1EDBA9EB8, objc_opt_class(), sel_resolveLocationCreatedForSearchForPhotos_withCompletion_, sel_resolveLocationCreatedForSearchForPhotos_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v53[1] = v45;
  v44 = [[INIntentSlotDescription alloc] initWithName:@"albumName", 5, @"albumName", @"albumName", 0, 0, 30, 1, &unk_1EDBA9ED0, &unk_1EDBA9EE8, objc_opt_class(), sel_resolveAlbumNameForSearchForPhotos_withCompletion_, sel_resolveAlbumNameForSearchForPhotos_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v53[2] = v44;
  v43 = [[INIntentSlotDescription alloc] initWithName:@"searchTerm", 8, @"searchTerms", @"searchTerms", 0, 0, 31, 1, &unk_1EDBA9F00, &unk_1EDBA9F18, objc_opt_class(), sel_resolveSearchTermsForSearchForPhotos_withCompletion_, sel_resolveSearchTermsForSearchForPhotos_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v53[3] = v43;
  v42 = [[INIntentSlotDescription alloc] initWithName:@"includedAttribute" tag:9 facadePropertyName:@"includedAttributes" dataPropertyName:@"includedAttributes" isExtended:0 isPrivate:0 valueType:98 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v53[4] = v42;
  v41 = [[INIntentSlotDescription alloc] initWithName:@"excludedAttribute" tag:10 facadePropertyName:@"excludedAttributes" dataPropertyName:@"excludedAttributes" isExtended:0 isPrivate:0 valueType:98 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v53[5] = v41;
  v40 = [[INIntentSlotDescription alloc] initWithName:@"peopleInPhoto", 11, @"peopleInPhoto", @"peopleInPhoto", 0, 0, 11, 1, &unk_1EDBA9F30, &unk_1EDBA9F48, objc_opt_class(), sel_resolvePeopleInPhotoForSearchForPhotos_withCompletion_, sel_resolvePeopleInPhotoForSearchForPhotos_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v53[6] = v40;
  v39 = [[INIntentSlotDescription alloc] initWithName:@"events" tag:12 facadePropertyName:@"events" dataPropertyName:@"events" isExtended:0 isPrivate:1 valueType:100 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v53[7] = v39;
  v38 = [[INIntentSlotDescription alloc] initWithName:@"places" tag:13 facadePropertyName:@"places" dataPropertyName:@"places" isExtended:0 isPrivate:1 valueType:102 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v53[8] = v38;
  v30 = [[INIntentSlotDescription alloc] initWithName:@"activities" tag:14 facadePropertyName:@"activities" dataPropertyName:@"activities" isExtended:0 isPrivate:1 valueType:105 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v53[9] = v30;
  v29 = [[INIntentSlotDescription alloc] initWithName:@"geographicalFeatures" tag:15 facadePropertyName:@"geographicalFeatures" dataPropertyName:@"geographicalFeatures" isExtended:0 isPrivate:1 valueType:107 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v53[10] = v29;
  v28 = [[INIntentSlotDescription alloc] initWithName:@"memoryName" tag:16 facadePropertyName:@"memoryName" dataPropertyName:@"memoryName" isExtended:0 isPrivate:1 valueType:30 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v53[11] = v28;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:12];
  v26 = _INIntentSchemaBuildIntentSlotDescriptionMap(v27);
  v37 = [(INIntentDescription *)v36 initWithName:@"SearchForPhotosIntent" responseName:@"SearchForPhotosIntentResponse" facadeClass:v34 dataClass:v32 type:@"sirikit.intent.photos.SearchForPhotosIntent" isPrivate:0 handleSelector:sel_handleSearchForPhotos_completion_ confirmSelector:sel_confirmSearchForPhotos_completion_ slotsByName:v26];
  v54[0] = v37;
  v33 = [INIntentDescription alloc];
  uint64_t v31 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  v35 = [[INIntentSlotDescription alloc] initWithName:@"dateCreated", 2, @"dateCreated", @"dateCreated", 0, 0, 16, 1, &unk_1EDBA9F60, &unk_1EDBA9F78, objc_opt_class(), sel_resolveDateCreatedForStartPhotoPlayback_withCompletion_, sel_resolveDateCreatedForStartPhotoPlayback_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v52[0] = v35;
  v0 = [[INIntentSlotDescription alloc] initWithName:@"locationCreated", 3, @"locationCreated", @"locationCreated", 0, 0, 27, 1, &unk_1EDBA9F90, &unk_1EDBA9FA8, objc_opt_class(), sel_resolveLocationCreatedForStartPhotoPlayback_withCompletion_, sel_resolveLocationCreatedForStartPhotoPlayback_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v52[1] = v0;
  v1 = [[INIntentSlotDescription alloc] initWithName:@"albumName", 5, @"albumName", @"albumName", 0, 0, 30, 1, &unk_1EDBA9FC0, &unk_1EDBA9FD8, objc_opt_class(), sel_resolveAlbumNameForStartPhotoPlayback_withCompletion_, sel_resolveAlbumNameForStartPhotoPlayback_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v52[2] = v1;
  v2 = [[INIntentSlotDescription alloc] initWithName:@"searchTerm" tag:7 facadePropertyName:@"searchTerms" dataPropertyName:@"searchTerms" isExtended:0 isPrivate:0 valueType:31 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v52[3] = v2;
  v3 = [[INIntentSlotDescription alloc] initWithName:@"includedAttribute" tag:8 facadePropertyName:@"includedAttributes" dataPropertyName:@"includedAttributes" isExtended:0 isPrivate:0 valueType:98 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v52[4] = v3;
  v4 = [[INIntentSlotDescription alloc] initWithName:@"excludedAttribute" tag:9 facadePropertyName:@"excludedAttributes" dataPropertyName:@"excludedAttributes" isExtended:0 isPrivate:0 valueType:98 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v52[5] = v4;
  v5 = [[INIntentSlotDescription alloc] initWithName:@"peopleInPhoto", 10, @"peopleInPhoto", @"peopleInPhoto", 0, 0, 11, 1, &unk_1EDBA9FF0, &unk_1EDBAA008, objc_opt_class(), sel_resolvePeopleInPhotoForStartPhotoPlayback_withCompletion_, sel_resolvePeopleInPhotoForStartPhotoPlayback_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v52[6] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:7];
  v7 = _INIntentSchemaBuildIntentSlotDescriptionMap(v6);
  v8 = [(INIntentDescription *)v33 initWithName:@"StartPhotoPlaybackIntent" responseName:@"StartPhotoPlaybackIntentResponse" facadeClass:v31 dataClass:v25 type:@"sirikit.intent.photos.StartPhotoPlaybackIntent" isPrivate:0 handleSelector:sel_handleStartPhotoPlayback_completion_ confirmSelector:sel_confirmStartPhotoPlayback_completion_ slotsByName:v7];
  v54[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];

  uint64_t v10 = [v9 count];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v10];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v10];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v48 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v19 = [v18 name];
        [v11 setObject:v18 forKey:v19];

        v20 = [v18 type];
        [v12 setObject:v18 forKey:v20];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v15);
  }

  uint64_t v21 = [v11 copy];
  v22 = (void *)sPhotosDomain_intentDescsByName;
  sPhotosDomain_intentDescsByName = v21;

  uint64_t v23 = [v12 copy];
  v24 = (void *)sPhotosDomain_intentDescsByType;
  sPhotosDomain_intentDescsByType = v23;
}

@end