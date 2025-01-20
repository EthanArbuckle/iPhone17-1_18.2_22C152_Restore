@interface INNotebookDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INNotebookDomainLoadIntentResponseDescriptionIfNeeded

void ___INNotebookDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v91[8] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v77 = [[INIntentSlotDescription alloc] initWithName:@"modifiedTaskList" tag:1 facadePropertyName:@"modifiedTaskList" dataPropertyName:@"modifiedTaskList" isExtended:0 isPrivate:0 valueType:135 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v90[0] = v77;
  v76 = [[INIntentSlotDescription alloc] initWithName:@"addedTasks" tag:2 facadePropertyName:@"addedTasks" dataPropertyName:@"addedTasks" isExtended:0 isPrivate:0 valueType:134 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v90[1] = v76;
  v75 = [[INIntentSlotDescription alloc] initWithName:@"warnings" tag:3 facadePropertyName:@"warnings" dataPropertyName:@"warnings" isExtended:0 isPrivate:1 valueType:142 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v90[2] = v75;
  v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:3];
  v73 = _INIntentSchemaBuildIntentSlotDescriptionMap(v74);
  v72 = [(INIntentResponseDescription *)v0 initWithName:@"AddTasksIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.notes.AddTasksIntentResponse" isPrivate:0 slotsByName:v73];
  v91[0] = v72;
  v3 = [INIntentResponseDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v71 = [[INIntentSlotDescription alloc] initWithName:@"note" tag:1 facadePropertyName:@"note" dataPropertyName:@"note" isExtended:0 isPrivate:0 valueType:133 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v89 = v71;
  v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
  v69 = _INIntentSchemaBuildIntentSlotDescriptionMap(v70);
  v68 = [(INIntentResponseDescription *)v3 initWithName:@"AppendToNoteIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.notes.AppendToNoteIntentResponse" isPrivate:0 slotsByName:v69];
  v91[1] = v68;
  v6 = [INIntentResponseDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v67 = [[INIntentSlotDescription alloc] initWithName:@"createdNote" tag:1 facadePropertyName:@"createdNote" dataPropertyName:@"createdNote" isExtended:0 isPrivate:0 valueType:133 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v88 = v67;
  v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
  v65 = _INIntentSchemaBuildIntentSlotDescriptionMap(v66);
  v64 = [(INIntentResponseDescription *)v6 initWithName:@"CreateNoteIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.notes.CreateNoteIntentResponse" isPrivate:0 slotsByName:v65];
  v91[2] = v64;
  v9 = [INIntentResponseDescription alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v63 = [[INIntentSlotDescription alloc] initWithName:@"createdTaskList" tag:1 facadePropertyName:@"createdTaskList" dataPropertyName:@"createdTaskList" isExtended:0 isPrivate:0 valueType:135 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v87 = v63;
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
  v61 = _INIntentSchemaBuildIntentSlotDescriptionMap(v62);
  v60 = [(INIntentResponseDescription *)v9 initWithName:@"CreateTaskListIntentResponse" facadeClass:v10 dataClass:v11 type:@"sirikit.intent.notes.CreateTaskListIntentResponse" isPrivate:0 slotsByName:v61];
  v91[3] = v60;
  v12 = [INIntentResponseDescription alloc];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v59 = [[INIntentSlotDescription alloc] initWithName:@"deletedTasks" tag:1 facadePropertyName:@"deletedTasks" dataPropertyName:@"deletedTasks" isExtended:0 isPrivate:0 valueType:134 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v86 = v59;
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
  v57 = _INIntentSchemaBuildIntentSlotDescriptionMap(v58);
  v56 = [(INIntentResponseDescription *)v12 initWithName:@"DeleteTasksIntentResponse" facadeClass:v13 dataClass:v14 type:@"sirikit.intent.notes.DeleteTasksIntentResponse" isPrivate:0 slotsByName:v57];
  v91[4] = v56;
  v15 = [INIntentResponseDescription alloc];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v55 = [[INIntentSlotDescription alloc] initWithName:@"notes" tag:1 facadePropertyName:@"notes" dataPropertyName:@"notes" isExtended:0 isPrivate:0 valueType:133 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v85[0] = v55;
  v54 = [[INIntentSlotDescription alloc] initWithName:@"taskLists" tag:2 facadePropertyName:@"taskLists" dataPropertyName:@"taskLists" isExtended:0 isPrivate:0 valueType:135 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v85[1] = v54;
  v53 = [[INIntentSlotDescription alloc] initWithName:@"tasks" tag:3 facadePropertyName:@"tasks" dataPropertyName:@"tasks" isExtended:0 isPrivate:0 valueType:134 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v85[2] = v53;
  v52 = [[INIntentSlotDescription alloc] initWithName:@"sortType" tag:4 facadePropertyName:@"sortType" dataPropertyName:@"sortType" isExtended:0 isPrivate:0 valueType:131 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v85[3] = v52;
  v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:4];
  v50 = _INIntentSchemaBuildIntentSlotDescriptionMap(v51);
  v49 = [(INIntentResponseDescription *)v15 initWithName:@"SearchForNotebookItemsIntentResponse" facadeClass:v16 dataClass:v17 type:@"sirikit.intent.notes.SearchForNotebookItemsIntentResponse" isPrivate:0 slotsByName:v50];
  v91[5] = v49;
  v18 = [INIntentResponseDescription alloc];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  v48 = [[INIntentSlotDescription alloc] initWithName:@"modifiedTask" tag:1 facadePropertyName:@"modifiedTask" dataPropertyName:@"modifiedTask" isExtended:0 isPrivate:0 valueType:134 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v84[0] = v48;
  v47 = [[INIntentSlotDescription alloc] initWithName:@"warnings" tag:2 facadePropertyName:@"warnings" dataPropertyName:@"warnings" isExtended:0 isPrivate:1 valueType:142 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v84[1] = v47;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:2];
  v22 = _INIntentSchemaBuildIntentSlotDescriptionMap(v21);
  v23 = [(INIntentResponseDescription *)v18 initWithName:@"SetTaskAttributeIntentResponse" facadeClass:v19 dataClass:v20 type:@"sirikit.intent.notes.SetTaskAttributeIntentResponse" isPrivate:0 slotsByName:v22];
  v91[6] = v23;
  v24 = [INIntentResponseDescription alloc];
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  v27 = [[INIntentSlotDescription alloc] initWithName:@"snoozedTasks" tag:1 facadePropertyName:@"snoozedTasks" dataPropertyName:@"snoozedTasks" isExtended:0 isPrivate:0 valueType:134 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v83 = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
  v29 = _INIntentSchemaBuildIntentSlotDescriptionMap(v28);
  v30 = [(INIntentResponseDescription *)v24 initWithName:@"SnoozeTasksIntentResponse" facadeClass:v25 dataClass:v26 type:@"sirikit.intent.notes.SnoozeTasksIntentResponse" isPrivate:0 slotsByName:v29];
  v91[7] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:8];

  uint64_t v32 = [v31 count];
  v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v32];
  v34 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v32];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v35 = v31;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v78 objects:v82 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v79;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v79 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        v41 = [v40 name];
        [v33 setObject:v40 forKey:v41];

        v42 = [v40 type];
        [v34 setObject:v40 forKey:v42];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v78 objects:v82 count:16];
    }
    while (v37);
  }

  uint64_t v43 = [v33 copy];
  v44 = (void *)sNotebookDomain_intentResponseDescsByName;
  sNotebookDomain_intentResponseDescsByName = v43;

  uint64_t v45 = [v34 copy];
  v46 = (void *)sNotebookDomain_intentResponseDescsByType;
  sNotebookDomain_intentResponseDescsByType = v45;
}

@end