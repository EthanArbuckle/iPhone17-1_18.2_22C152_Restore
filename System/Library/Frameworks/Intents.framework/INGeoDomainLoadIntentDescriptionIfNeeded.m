@interface INGeoDomainLoadIntentDescriptionIfNeeded
@end

@implementation INGeoDomainLoadIntentDescriptionIfNeeded

void ___INGeoDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v69[6] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = (void *)MEMORY[0x1E4F1CBF0];
  v59 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v58 = [(INIntentDescription *)v0 initWithName:@"DeleteParkingLocationIntent" responseName:@"DeleteParkingLocationIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.geo.DeleteParkingLocationIntent" isPrivate:0 handleSelector:sel_handleDeleteParkingLocation_completion_ confirmSelector:sel_confirmDeleteParkingLocation_completion_ slotsByName:v59];
  v69[0] = v58;
  v4 = [INIntentDescription alloc];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v57 = [[INIntentSlotDescription alloc] initWithName:@"incidentType", 2, @"incidentType", @"incidentType", 0, 0, 229, 1, &unk_1EDBA8A60, &unk_1EDBA8A78, objc_opt_class(), sel_resolveIncidentTypeForReportIncident_withCompletion_, sel_resolveIncidentTypeForReportIncident_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v68[0] = v57;
  v56 = [[INIntentSlotDescription alloc] initWithName:@"startTime", 3, @"startTime", @"startTime", 0, 0, 3, 1, &unk_1EDBA8A90, &unk_1EDBA8AA8, objc_opt_class(), sel_resolveStartTimeForReportIncident_withCompletion_, sel_resolveStartTimeForReportIncident_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v68[1] = v56;
  v55 = [[INIntentSlotDescription alloc] initWithName:@"isClear", 4, @"isClear", @"isClear", 0, 0, 1, 1, &unk_1EDBA8AC0, &unk_1EDBA8AD8, objc_opt_class(), sel_resolveIsClearForReportIncident_withCompletion_, sel_resolveIsClearForReportIncident_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v68[2] = v55;
  v54 = [[INIntentSlotDescription alloc] initWithName:@"userLocation", 5, @"userLocation", @"userLocation", 0, 0, 27, 1, &unk_1EDBA8AF0, &unk_1EDBA8B08, objc_opt_class(), sel_resolveUserLocationForReportIncident_withCompletion_, sel_resolveUserLocationForReportIncident_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v68[3] = v54;
  v53 = [[INIntentSlotDescription alloc] initWithName:@"additionalDetails", 6, @"additionalDetails", @"additionalDetails", 0, 0, 30, 1, &unk_1EDBA8B20, &unk_1EDBA8B38, objc_opt_class(), sel_resolveAdditionalDetailsForReportIncident_withCompletion_, sel_resolveAdditionalDetailsForReportIncident_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v68[4] = v53;
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:5];
  v51 = _INIntentSchemaBuildIntentSlotDescriptionMap(v52);
  v50 = [(INIntentDescription *)v4 initWithName:@"ReportIncidentIntent" responseName:@"ReportIncidentIntentResponse" facadeClass:v5 dataClass:v6 type:@"sirikit.intent.geo.ReportIncidentIntent" isPrivate:0 handleSelector:sel_handleReportIncident_completion_ confirmSelector:sel_confirmReportIncident_completion_ slotsByName:v51];
  v69[1] = v50;
  v7 = [INIntentDescription alloc];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v49 = _INIntentSchemaBuildIntentSlotDescriptionMap(v3);
  v48 = [(INIntentDescription *)v7 initWithName:@"RetrieveParkingLocationIntent" responseName:@"RetrieveParkingLocationIntentResponse" facadeClass:v8 dataClass:v9 type:@"sirikit.intent.geo.RetrieveParkingLocationIntent" isPrivate:0 handleSelector:sel_handleRetrieveParkingLocation_completion_ confirmSelector:sel_confirmRetrieveParkingLocation_completion_ slotsByName:v49];
  v69[2] = v48;
  v10 = [INIntentDescription alloc];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v47 = [[INIntentSlotDescription alloc] initWithName:@"parkingLocation", 2, @"parkingLocation", @"parkingLocation", 0, 0, 27, 1, &unk_1EDBA8B50, &unk_1EDBA8B68, objc_opt_class(), sel_resolveParkingLocationForSaveParkingLocation_withCompletion_, sel_resolveParkingLocationForSaveParkingLocation_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v67[0] = v47;
  v46 = [[INIntentSlotDescription alloc] initWithName:@"parkingNote", 3, @"parkingNote", @"parkingNote", 0, 0, 30, 1, &unk_1EDBA8B80, &unk_1EDBA8B98, objc_opt_class(), sel_resolveParkingNoteForSaveParkingLocation_withCompletion_, sel_resolveParkingNoteForSaveParkingLocation_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v67[1] = v46;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
  v44 = _INIntentSchemaBuildIntentSlotDescriptionMap(v45);
  v43 = [(INIntentDescription *)v10 initWithName:@"SaveParkingLocationIntent" responseName:@"SaveParkingLocationIntentResponse" facadeClass:v11 dataClass:v12 type:@"sirikit.intent.geo.SaveParkingLocationIntent" isPrivate:0 handleSelector:sel_handleSaveParkingLocation_completion_ confirmSelector:sel_confirmSaveParkingLocation_completion_ slotsByName:v44];
  v69[3] = v43;
  v13 = [INIntentDescription alloc];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v42 = [[INIntentSlotDescription alloc] initWithName:@"recipient", 2, @"recipients", @"recipients", 0, 0, 10, 3, &unk_1EDBA8BB0, &unk_1EDBA8BC8, objc_opt_class(), sel_resolveRecipientsForShareETA_withCompletion_, sel_resolveRecipientsForShareETA_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v66 = v42;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
  v40 = _INIntentSchemaBuildIntentSlotDescriptionMap(v41);
  v16 = [(INIntentDescription *)v13 initWithName:@"ShareETAIntent" responseName:@"ShareETAIntentResponse" facadeClass:v14 dataClass:v15 type:@"sirikit.intent.geo.ShareETAIntent" isPrivate:0 handleSelector:sel_handleShareETA_completion_ confirmSelector:sel_confirmShareETA_completion_ slotsByName:v40];
  v69[4] = v16;
  v17 = [INIntentDescription alloc];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  v20 = [[INIntentSlotDescription alloc] initWithName:@"recipient", 2, @"recipients", @"recipients", 0, 0, 10, 3, &unk_1EDBA8BE0, &unk_1EDBA8BF8, objc_opt_class(), sel_resolveRecipientsForStopShareETA_withCompletion_, sel_resolveRecipientsForStopShareETA_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v65 = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
  v22 = _INIntentSchemaBuildIntentSlotDescriptionMap(v21);
  v23 = [(INIntentDescription *)v17 initWithName:@"StopShareETAIntent" responseName:@"StopShareETAIntentResponse" facadeClass:v18 dataClass:v19 type:@"sirikit.intent.geo.StopShareETAIntent" isPrivate:0 handleSelector:sel_handleStopShareETA_completion_ confirmSelector:sel_confirmStopShareETA_completion_ slotsByName:v22];
  v69[5] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:6];

  uint64_t v25 = [v24 count];
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v25];
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v25];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v28 = v24;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v61 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        v34 = [v33 name];
        [v26 setObject:v33 forKey:v34];

        v35 = [v33 type];
        [v27 setObject:v33 forKey:v35];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v60 objects:v64 count:16];
    }
    while (v30);
  }

  uint64_t v36 = [v26 copy];
  v37 = (void *)sGeoDomain_intentDescsByName;
  sGeoDomain_intentDescsByName = v36;

  uint64_t v38 = [v27 copy];
  v39 = (void *)sGeoDomain_intentDescsByType;
  sGeoDomain_intentDescsByType = v38;
}

@end