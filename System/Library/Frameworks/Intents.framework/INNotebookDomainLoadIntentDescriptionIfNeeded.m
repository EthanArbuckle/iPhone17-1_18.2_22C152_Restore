@interface INNotebookDomainLoadIntentDescriptionIfNeeded
@end

@implementation INNotebookDomainLoadIntentDescriptionIfNeeded

void ___INNotebookDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v120[8] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v106 = [[INIntentSlotDescription alloc] initWithName:@"taskReference", 8, @"taskReference", @"taskReference", 0, 1, 136, 1, &unk_1EDBA9240, &unk_1EDBA9258, objc_opt_class(), sel_resolveTaskReferenceForAddTasks_withCompletion_, sel_resolveTaskReferenceForAddTasks_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v119[0] = v106;
  v105 = [[INIntentSlotDescription alloc] initWithName:@"targetTaskListMembers", 10, @"targetTaskListMembers", @"targetTaskListMembers", 0, 1, 10, 3, &unk_1EDBA9270, &unk_1EDBA9288, objc_opt_class(), sel_resolveTargetTaskListMembersForAddTasks_withCompletion_, sel_resolveTargetTaskListMembersForAddTasks_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v119[1] = v105;
  v104 = [[INIntentSlotDescription alloc] initWithName:@"targetTaskList", 2, @"targetTaskList", @"targetTaskList", 0, 0, 135, 1, &unk_1EDBA92A0, &unk_1EDBA92B8, objc_opt_class(), sel_resolveTargetTaskListForAddTasks_completion_, sel_resolveTargetTaskListForAddTasks_withCompletion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v119[2] = v104;
  v103 = [[INIntentSlotDescription alloc] initWithName:@"taskTitles", 3, @"taskTitles", @"taskTitles", 0, 0, 12, 3, &unk_1EDBA92D0, &unk_1EDBA92E8, objc_opt_class(), sel_resolveTaskTitlesForAddTasks_withCompletion_, sel_resolveTaskTitlesForAddTasks_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v119[3] = v103;
  v102 = [[INIntentSlotDescription alloc] initWithName:@"spatialEventTrigger", 5, @"spatialEventTrigger", @"spatialEventTrigger", 0, 0, 138, 1, &unk_1EDBA9300, &unk_1EDBA9318, objc_opt_class(), sel_resolveSpatialEventTriggerForAddTasks_withCompletion_, sel_resolveSpatialEventTriggerForAddTasks_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v119[4] = v102;
  v101 = [[INIntentSlotDescription alloc] initWithName:@"temporalEventTrigger", 6, @"temporalEventTrigger", @"temporalEventTrigger", 0, 0, 137, 1, &unk_1EDBA9330, &unk_1EDBA9348, objc_opt_class(), sel_resolveTemporalEventTriggerForAddTasks_completion_, sel_resolveTemporalEventTriggerForAddTasks_withCompletion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v119[5] = v101;
  v100 = [[INIntentSlotDescription alloc] initWithName:@"priority", 11, @"priority", @"priority", 0, 0, 141, 1, &unk_1EDBA9360, &unk_1EDBA9378, objc_opt_class(), sel_resolvePriorityForAddTasks_withCompletion_, sel_resolvePriorityForAddTasks_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v119[6] = v100;
  v99 = [[INIntentSlotDescription alloc] initWithName:@"contactEventTrigger", 7, @"contactEventTrigger", @"contactEventTrigger", 0, 1, 139, 1, &unk_1EDBA9390, &unk_1EDBA93A8, objc_opt_class(), sel_resolveContactEventTriggerForAddTasks_withCompletion_, sel_resolveContactEventTriggerForAddTasks_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v119[7] = v99;
  v98 = [[INIntentSlotDescription alloc] initWithName:@"intent" tag:9 facadePropertyName:@"intent" dataPropertyName:@"intent" isExtended:0 isPrivate:1 valueType:37 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v119[8] = v98;
  v97 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:9];
  v96 = _INIntentSchemaBuildIntentSlotDescriptionMap(v97);
  v95 = [(INIntentDescription *)v0 initWithName:@"AddTasksIntent" responseName:@"AddTasksIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.notes.AddTasksIntent" isPrivate:0 handleSelector:sel_handleAddTasks_completion_ confirmSelector:sel_confirmAddTasks_completion_ slotsByName:v96];
  v120[0] = v95;
  v3 = [INIntentDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v94 = [[INIntentSlotDescription alloc] initWithName:@"targetNote", 2, @"targetNote", @"targetNote", 0, 0, 133, 1, &unk_1EDBA93C0, &unk_1EDBA93D8, objc_opt_class(), sel_resolveTargetNoteForAppendToNote_withCompletion_, sel_resolveTargetNoteForAppendToNote_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v118[0] = v94;
  v93 = [[INIntentSlotDescription alloc] initWithName:@"content", 3, @"content", @"content", 0, 0, 132, 1, &unk_1EDBA93F0, &unk_1EDBA9408, objc_opt_class(), sel_resolveContentForAppendToNote_withCompletion_, sel_resolveContentForAppendToNote_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v118[1] = v93;
  v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:2];
  v91 = _INIntentSchemaBuildIntentSlotDescriptionMap(v92);
  v90 = [(INIntentDescription *)v3 initWithName:@"AppendToNoteIntent" responseName:@"AppendToNoteIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.notes.AppendToNoteIntent" isPrivate:0 handleSelector:sel_handleAppendToNote_completion_ confirmSelector:sel_confirmAppendToNote_completion_ slotsByName:v91];
  v120[1] = v90;
  v83 = [INIntentDescription alloc];
  uint64_t v81 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v89 = [[INIntentSlotDescription alloc] initWithName:@"title", 2, @"title", @"title", 0, 0, 12, 1, &unk_1EDBA9420, &unk_1EDBA9438, objc_opt_class(), sel_resolveTitleForCreateNote_withCompletion_, sel_resolveTitleForCreateNote_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v117[0] = v89;
  v88 = [[INIntentSlotDescription alloc] initWithName:@"content", 3, @"content", @"content", 0, 0, 132, 1, &unk_1EDBA9450, &unk_1EDBA9468, objc_opt_class(), sel_resolveContentForCreateNote_withCompletion_, sel_resolveContentForCreateNote_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v117[1] = v88;
  v87 = [[INIntentSlotDescription alloc] initWithName:@"groupName", 4, @"groupName", @"groupName", 0, 0, 12, 1, &unk_1EDBA9480, &unk_1EDBA9498, objc_opt_class(), sel_resolveGroupNameForCreateNote_withCompletion_, sel_resolveGroupNameForCreateNote_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v117[2] = v87;
  v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:3];
  v85 = _INIntentSchemaBuildIntentSlotDescriptionMap(v86);
  v84 = [(INIntentDescription *)v83 initWithName:@"CreateNoteIntent" responseName:@"CreateNoteIntentResponse" facadeClass:v81 dataClass:v6 type:@"sirikit.intent.notes.CreateNoteIntent" isPrivate:0 handleSelector:sel_handleCreateNote_completion_ confirmSelector:sel_confirmCreateNote_completion_ slotsByName:v85];
  v120[2] = v84;
  v75 = [INIntentDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v82 = [[INIntentSlotDescription alloc] initWithName:@"title", 2, @"title", @"title", 0, 0, 12, 1, &unk_1EDBA94B0, &unk_1EDBA94C8, objc_opt_class(), sel_resolveTitleForCreateTaskList_withCompletion_, sel_resolveTitleForCreateTaskList_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v116[0] = v82;
  v80 = [[INIntentSlotDescription alloc] initWithName:@"taskTitles", 3, @"taskTitles", @"taskTitles", 0, 0, 12, 3, &unk_1EDBA94E0, &unk_1EDBA94F8, objc_opt_class(), sel_resolveTaskTitlesForCreateTaskList_withCompletion_, sel_resolveTaskTitlesForCreateTaskList_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v116[1] = v80;
  v79 = [[INIntentSlotDescription alloc] initWithName:@"groupName", 4, @"groupName", @"groupName", 0, 0, 12, 1, &unk_1EDBA9510, &unk_1EDBA9528, objc_opt_class(), sel_resolveGroupNameForCreateTaskList_withCompletion_, sel_resolveGroupNameForCreateTaskList_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v116[2] = v79;
  v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:3];
  v77 = _INIntentSchemaBuildIntentSlotDescriptionMap(v78);
  v76 = [(INIntentDescription *)v75 initWithName:@"CreateTaskListIntent" responseName:@"CreateTaskListIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.notes.CreateTaskListIntent" isPrivate:0 handleSelector:sel_handleCreateTaskList_completion_ confirmSelector:sel_confirmCreateTaskList_completion_ slotsByName:v77];
  v120[3] = v76;
  v9 = [INIntentDescription alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v74 = [[INIntentSlotDescription alloc] initWithName:@"taskList", 2, @"taskList", @"taskList", 0, 0, 135, 1, &unk_1EDBA9540, &unk_1EDBA9558, objc_opt_class(), sel_resolveTaskListForDeleteTasks_withCompletion_, sel_resolveTaskListForDeleteTasks_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v115[0] = v74;
  v73 = [[INIntentSlotDescription alloc] initWithName:@"tasks", 3, @"tasks", @"tasks", 0, 0, 134, 3, &unk_1EDBA9570, &unk_1EDBA9588, objc_opt_class(), sel_resolveTasksForDeleteTasks_withCompletion_, sel_resolveTasksForDeleteTasks_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v115[1] = v73;
  v72 = [[INIntentSlotDescription alloc] initWithName:@"all" tag:4 facadePropertyName:@"all" dataPropertyName:@"all" isExtended:0 isPrivate:0 valueType:1 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v115[2] = v72;
  v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:3];
  v70 = _INIntentSchemaBuildIntentSlotDescriptionMap(v71);
  v69 = [(INIntentDescription *)v9 initWithName:@"DeleteTasksIntent" responseName:@"DeleteTasksIntentResponse" facadeClass:v10 dataClass:v11 type:@"sirikit.intent.notes.DeleteTasksIntent" isPrivate:0 handleSelector:sel_handleDeleteTasks_completion_ confirmSelector:sel_confirmDeleteTasks_completion_ slotsByName:v70];
  v120[4] = v69;
  v52 = [INIntentDescription alloc];
  uint64_t v50 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v68 = [[INIntentSlotDescription alloc] initWithName:@"title", 2, @"title", @"title", 0, 0, 12, 1, &unk_1EDBA95A0, &unk_1EDBA95B8, objc_opt_class(), sel_resolveTitleForSearchForNotebookItems_withCompletion_, sel_resolveTitleForSearchForNotebookItems_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v114[0] = v68;
  v67 = [[INIntentSlotDescription alloc] initWithName:@"content", 3, @"content", @"content", 0, 0, 7, 1, &unk_1EDBA95D0, &unk_1EDBA95E8, objc_opt_class(), sel_resolveContentForSearchForNotebookItems_withCompletion_, sel_resolveContentForSearchForNotebookItems_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v114[1] = v67;
  v66 = [[INIntentSlotDescription alloc] initWithName:@"itemType", 4, @"itemType", @"itemType", 0, 0, 129, 1, &unk_1EDBA9600, &unk_1EDBA9618, objc_opt_class(), sel_resolveItemTypeForSearchForNotebookItems_withCompletion_, sel_resolveItemTypeForSearchForNotebookItems_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v114[2] = v66;
  v65 = [[INIntentSlotDescription alloc] initWithName:@"status", 5, @"status", @"status", 0, 0, 128, 1, &unk_1EDBA9630, &unk_1EDBA9648, objc_opt_class(), sel_resolveStatusForSearchForNotebookItems_withCompletion_, sel_resolveStatusForSearchForNotebookItems_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v114[3] = v65;
  v64 = [[INIntentSlotDescription alloc] initWithName:@"location", 6, @"location", @"location", 0, 0, 27, 1, &unk_1EDBA9660, &unk_1EDBA9678, objc_opt_class(), sel_resolveLocationForSearchForNotebookItems_withCompletion_, sel_resolveLocationForSearchForNotebookItems_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v114[4] = v64;
  v63 = [[INIntentSlotDescription alloc] initWithName:@"locationSearchType", 7, @"locationSearchType", @"locationSearchType", 0, 0, 127, 1, &unk_1EDBA9690, &unk_1EDBA96A8, objc_opt_class(), sel_resolveLocationSearchTypeForSearchForNotebookItems_withCompletion_, sel_resolveLocationSearchTypeForSearchForNotebookItems_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v114[5] = v63;
  v62 = [[INIntentSlotDescription alloc] initWithName:@"dateTime", 8, @"dateTime", @"dateTime", 0, 0, 16, 1, &unk_1EDBA96C0, &unk_1EDBA96D8, objc_opt_class(), sel_resolveDateTimeForSearchForNotebookItems_withCompletion_, sel_resolveDateTimeForSearchForNotebookItems_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v114[6] = v62;
  v61 = [[INIntentSlotDescription alloc] initWithName:@"dateSearchType", 9, @"dateSearchType", @"dateSearchType", 0, 0, 126, 1, &unk_1EDBA96F0, &unk_1EDBA9708, objc_opt_class(), sel_resolveDateSearchTypeForSearchForNotebookItems_withCompletion_, sel_resolveDateSearchTypeForSearchForNotebookItems_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v114[7] = v61;
  v60 = [[INIntentSlotDescription alloc] initWithName:@"temporalEventTriggerType", 11, @"temporalEventTriggerTypes", @"temporalEventTriggerTypes", 0, 0, 140, 3, &unk_1EDBA9720, &unk_1EDBA9738, objc_opt_class(), sel_resolveTemporalEventTriggerTypesForSearchForNotebookItems_withCompletion_, sel_resolveTemporalEventTriggerTypesForSearchForNotebookItems_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v114[8] = v60;
  v59 = [[INIntentSlotDescription alloc] initWithName:@"taskPriority", 12, @"taskPriority", @"taskPriority", 0, 0, 141, 1, &unk_1EDBA9750, &unk_1EDBA9768, objc_opt_class(), sel_resolveTaskPriorityForSearchForNotebookItems_withCompletion_, sel_resolveTaskPriorityForSearchForNotebookItems_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v114[9] = v59;
  v58 = [[INIntentSlotDescription alloc] initWithName:@"groupName", 50, @"groupName", @"groupName", 0, 1, 12, 1, &unk_1EDBA9780, &unk_1EDBA9798, objc_opt_class(), sel_resolveGroupNameForSearchForNotebookItems_withCompletion_, sel_resolveGroupNameForSearchForNotebookItems_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v114[10] = v58;
  v57 = [[INIntentSlotDescription alloc] initWithName:@"includeAllNoteContents" tag:51 facadePropertyName:@"includeAllNoteContents" dataPropertyName:@"includeAllNoteContents" isExtended:0 isPrivate:1 valueType:1 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v114[11] = v57;
  v56 = [[INIntentSlotDescription alloc] initWithName:@"notebookItemIdentifier" tag:10 facadePropertyName:@"notebookItemIdentifier" dataPropertyName:@"notebookItemIdentifier" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v114[12] = v56;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:13];
  v54 = _INIntentSchemaBuildIntentSlotDescriptionMap(v55);
  v53 = [(INIntentDescription *)v52 initWithName:@"SearchForNotebookItemsIntent" responseName:@"SearchForNotebookItemsIntentResponse" facadeClass:v50 dataClass:v12 type:@"sirikit.intent.notes.SearchForNotebookItemsIntent" isPrivate:0 handleSelector:sel_handleSearchForNotebookItems_completion_ confirmSelector:sel_confirmSearchForNotebookItems_completion_ slotsByName:v54];
  v120[5] = v53;
  v44 = [INIntentDescription alloc];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v51 = [[INIntentSlotDescription alloc] initWithName:@"targetTask", 2, @"targetTask", @"targetTask", 0, 0, 134, 1, &unk_1EDBA97B0, &unk_1EDBA97C8, objc_opt_class(), sel_resolveTargetTaskForSetTaskAttribute_withCompletion_, sel_resolveTargetTaskForSetTaskAttribute_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v113[0] = v51;
  v49 = [[INIntentSlotDescription alloc] initWithName:@"taskTitle", 9, @"taskTitle", @"taskTitle", 0, 0, 12, 1, &unk_1EDBA97E0, &unk_1EDBA97F8, objc_opt_class(), sel_resolveTaskTitleForSetTaskAttribute_withCompletion_, sel_resolveTaskTitleForSetTaskAttribute_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v113[1] = v49;
  v48 = [[INIntentSlotDescription alloc] initWithName:@"status", 3, @"status", @"status", 0, 0, 128, 1, &unk_1EDBA9810, &unk_1EDBA9828, objc_opt_class(), sel_resolveStatusForSetTaskAttribute_withCompletion_, sel_resolveStatusForSetTaskAttribute_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v113[2] = v48;
  v47 = [[INIntentSlotDescription alloc] initWithName:@"priority", 8, @"priority", @"priority", 0, 0, 141, 1, &unk_1EDBA9840, &unk_1EDBA9858, objc_opt_class(), sel_resolvePriorityForSetTaskAttribute_withCompletion_, sel_resolvePriorityForSetTaskAttribute_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v113[3] = v47;
  v46 = [[INIntentSlotDescription alloc] initWithName:@"spatialEventTrigger", 5, @"spatialEventTrigger", @"spatialEventTrigger", 0, 0, 138, 1, &unk_1EDBA9870, &unk_1EDBA9888, objc_opt_class(), sel_resolveSpatialEventTriggerForSetTaskAttribute_withCompletion_, sel_resolveSpatialEventTriggerForSetTaskAttribute_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v113[4] = v46;
  v43 = [[INIntentSlotDescription alloc] initWithName:@"temporalEventTrigger", 6, @"temporalEventTrigger", @"temporalEventTrigger", 0, 0, 137, 1, &unk_1EDBA98A0, &unk_1EDBA98B8, objc_opt_class(), sel_resolveTemporalEventTriggerForSetTaskAttribute_completion_, sel_resolveTemporalEventTriggerForSetTaskAttribute_withCompletion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v113[5] = v43;
  v42 = [[INIntentSlotDescription alloc] initWithName:@"contactEventTrigger", 7, @"contactEventTrigger", @"contactEventTrigger", 0, 1, 139, 1, &unk_1EDBA98D0, &unk_1EDBA98E8, objc_opt_class(), sel_resolveContactEventTriggerForSetTaskAttribute_withCompletion_, sel_resolveContactEventTriggerForSetTaskAttribute_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v113[6] = v42;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v113 count:7];
  v40 = _INIntentSchemaBuildIntentSlotDescriptionMap(v41);
  v15 = [(INIntentDescription *)v44 initWithName:@"SetTaskAttributeIntent" responseName:@"SetTaskAttributeIntentResponse" facadeClass:v13 dataClass:v14 type:@"sirikit.intent.notes.SetTaskAttributeIntent" isPrivate:0 handleSelector:sel_handleSetTaskAttribute_completion_ confirmSelector:sel_confirmSetTaskAttribute_completion_ slotsByName:v40];
  v120[6] = v15;
  v45 = [INIntentDescription alloc];
  uint64_t v39 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  v17 = [[INIntentSlotDescription alloc] initWithName:@"tasks", 2, @"tasks", @"tasks", 0, 0, 134, 3, &unk_1EDBA9900, &unk_1EDBA9918, objc_opt_class(), sel_resolveTasksForSnoozeTasks_withCompletion_, sel_resolveTasksForSnoozeTasks_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v112[0] = v17;
  v18 = [[INIntentSlotDescription alloc] initWithName:@"nextTriggerTime", 3, @"nextTriggerTime", @"nextTriggerTime", 0, 0, 16, 1, &unk_1EDBA9930, &unk_1EDBA9948, objc_opt_class(), sel_resolveNextTriggerTimeForSnoozeTasks_withCompletion_, sel_resolveNextTriggerTimeForSnoozeTasks_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v112[1] = v18;
  v19 = [[INIntentSlotDescription alloc] initWithName:@"all" tag:4 facadePropertyName:@"all" dataPropertyName:@"all" isExtended:0 isPrivate:0 valueType:1 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v112[2] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:3];
  v21 = _INIntentSchemaBuildIntentSlotDescriptionMap(v20);
  v22 = [(INIntentDescription *)v45 initWithName:@"SnoozeTasksIntent" responseName:@"SnoozeTasksIntentResponse" facadeClass:v39 dataClass:v16 type:@"sirikit.intent.notes.SnoozeTasksIntent" isPrivate:0 handleSelector:sel_handleSnoozeTasks_completion_ confirmSelector:sel_confirmSnoozeTasks_completion_ slotsByName:v21];
  v120[7] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:8];

  uint64_t v24 = [v23 count];
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v24];
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v24];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v27 = v23;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v107 objects:v111 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v108;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v108 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v107 + 1) + 8 * i);
        v33 = [v32 name];
        [v25 setObject:v32 forKey:v33];

        v34 = [v32 type];
        [v26 setObject:v32 forKey:v34];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v107 objects:v111 count:16];
    }
    while (v29);
  }

  uint64_t v35 = [v25 copy];
  v36 = (void *)sNotebookDomain_intentDescsByName;
  sNotebookDomain_intentDescsByName = v35;

  uint64_t v37 = [v26 copy];
  v38 = (void *)sNotebookDomain_intentDescsByType;
  sNotebookDomain_intentDescsByType = v37;
}

@end