@interface WFReminderContentItem
+ (BOOL)hasLibrary;
+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3;
+ (id)allLists;
+ (id)contactRepresentationWithContact:(id)a3;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)defaultList;
+ (id)itemWithReminder:(id)a3 fromReminderStore:(id)a4;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6;
- (BOOL)canGenerateRepresentationForType:(id)a3;
- (BOOL)flagged;
- (BOOL)getListAltText:(id)a3;
- (BOOL)hasAlarms;
- (BOOL)hasSubtasks;
- (REMReminder)reminder;
- (REMStore)reminderStore;
- (id)URL;
- (id)changeTransaction;
- (id)defaultSourceForRepresentation:(id)a3;
- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5;
- (id)imageAttachments;
- (id)parentReminder;
- (id)subtasks;
- (void)copyStateToItem:(id)a3;
- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5;
- (void)setReminderStore:(id)a3;
@end

@implementation WFReminderContentItem

- (BOOL)getListAltText:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(WFReminderContentItem *)self reminder];
  v6 = [v5 dueDateComponents];

  if (v6)
  {
    v7 = [MEMORY[0x263EFF8F0] currentCalendar];
    v8 = [v7 dateFromComponents:v6];

    v9 = objc_opt_new();
    [v9 setDateStyle:1];
    [v9 setTimeStyle:1];
    [v9 setDoesRelativeDateFormatting:1];
    if (v4)
    {
      v10 = [v9 stringFromDate:v8];
      v4[2](v4, v10);
    }
  }

  return v6 != 0;
}

- (void).cxx_destruct
{
}

- (void)setReminderStore:(id)a3
{
}

- (REMStore)reminderStore
{
  return self->_reminderStore;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 wfType];
  int v6 = [v5 conformsToClass:getREMReminderClass()];

  if (v6)
  {
    v7 = [v4 object];

    v8 = [v7 account];
    v9 = [(WFContentItem *)self cachingIdentifier];
    v10 = WFMakeContentAttributionSetForRemindersAccount(v8, v9);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFReminderContentItem;
    v10 = [(WFContentItem *)&v12 defaultSourceForRepresentation:v4];
  }
  return v10;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToClass:objc_opt_class()])
  {
    v5 = [(WFReminderContentItem *)self reminder];
    int v6 = [v5 list];
    v7 = [v6 color];
    unsigned __int8 v8 = v7 != 0;

LABEL_13:
    goto LABEL_14;
  }
  if ([v4 isEqualToClass:objc_opt_class()])
  {
    v5 = [(WFReminderContentItem *)self reminder];
    int v6 = [v5 startDateComponents];
    if (v6)
    {
      unsigned __int8 v8 = 1;
    }
    else
    {
      v10 = [(WFReminderContentItem *)self reminder];
      v11 = [v10 dueDateComponents];
      if (v11)
      {
        unsigned __int8 v8 = 1;
      }
      else
      {
        objc_super v12 = [(WFReminderContentItem *)self reminder];
        v13 = [v12 completionDate];
        unsigned __int8 v8 = v13 != 0;
      }
    }
    goto LABEL_13;
  }
  if ([v4 isEqualToClass:objc_opt_class()])
  {
    v9 = [(WFReminderContentItem *)self URL];
    unsigned __int8 v8 = v9 != 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WFReminderContentItem;
    unsigned __int8 v8 = [(WFGenericFileContentItem *)&v15 canGenerateRepresentationForType:v4];
  }
LABEL_14:

  return v8;
}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  v41[1] = *MEMORY[0x263EF8340];
  v7 = (void (**)(id, void *, void))a3;
  if ((Class)objc_opt_class() == a5)
  {
    v9 = objc_opt_new();
    v10 = [(WFReminderContentItem *)self reminder];
    v11 = [v10 startDateComponents];

    if (v11)
    {
      objc_super v12 = [MEMORY[0x263EFF8F0] currentCalendar];
      v13 = [(WFReminderContentItem *)self reminder];
      v14 = [v13 startDateComponents];
      objc_super v15 = [v12 dateFromComponents:v14];

      v16 = WFLocalizedString(@"Reminder Start Date");
      v17 = +[WFObjectRepresentation object:v15 named:v16];
      [v9 addObject:v17];
    }
    v18 = [(WFReminderContentItem *)self reminder];
    v19 = [v18 dueDateComponents];

    if (v19)
    {
      v20 = [MEMORY[0x263EFF8F0] currentCalendar];
      v21 = [(WFReminderContentItem *)self reminder];
      v22 = [v21 dueDateComponents];
      v23 = [v20 dateFromComponents:v22];

      v24 = WFLocalizedString(@"Reminder Due Date");
      v25 = +[WFObjectRepresentation object:v23 named:v24];
      [v9 addObject:v25];
    }
    v26 = [(WFReminderContentItem *)self reminder];
    v27 = [v26 completionDate];

    if (v27)
    {
      v28 = [(WFReminderContentItem *)self reminder];
      v29 = [v28 completionDate];
      v30 = WFLocalizedString(@"Reminder Completion Date");
      v31 = +[WFObjectRepresentation object:v29 named:v30];
      [v9 addObject:v31];
    }
    v7[2](v7, v9, 0);
    goto LABEL_18;
  }
  if ((Class)objc_opt_class() == a5)
  {
    unsigned __int8 v8 = [(WFReminderContentItem *)self URL];
    v32 = WFLocalizedStringWithKey(@"Show URL (Reminder Content Item)", @"Show URL");
    v33 = +[WFObjectRepresentation object:v8 named:v32];
    v41[0] = v33;
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
    v7[2](v7, v34, 0);

    goto LABEL_13;
  }
  if ((Class)objc_opt_class() == a5)
  {
    v35 = [(WFReminderContentItem *)self reminder];
    v36 = [v35 list];
    v9 = [v36 color];

    if (v9)
    {
      v37 = [MEMORY[0x263F851A8] colorWithRemindersColor:v9];
      v38 = +[WFObjectRepresentation object:v37];
      v40 = v38;
      v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v40 count:1];
      v7[2](v7, v39, 0);
    }
    else
    {
      v37 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
      ((void (**)(id, void *, void *))v7)[2](v7, 0, v37);
    }

LABEL_18:
    goto LABEL_19;
  }
  unsigned __int8 v8 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
  ((void (**)(id, void *, void *))v7)[2](v7, 0, v8);
LABEL_13:

LABEL_19:
}

- (REMReminder)reminder
{
  id REMReminderClass = getREMReminderClass();
  return (REMReminder *)[(WFContentItem *)self objectForClass:REMReminderClass];
}

- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ([v7 conformsToString:@"com.apple.ical.ics"])
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v9 = (void *)getREMExportingClass_softClass;
    uint64_t v24 = getREMExportingClass_softClass;
    if (!getREMExportingClass_softClass)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __getREMExportingClass_block_invoke;
      v20[3] = &unk_26428AC60;
      v20[4] = &v21;
      __getREMExportingClass_block_invoke((uint64_t)v20);
      v9 = (void *)v22[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v21, 8);
    v11 = [(WFReminderContentItem *)self reminder];
    v25[0] = v11;
    objc_super v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    v13 = [v10 exportICSCalendarFromReminders:v12];

    v14 = [v13 ICSStringWithOptions:0];
    objc_super v15 = [v14 dataUsingEncoding:4];

    v16 = [(WFContentItem *)self name];
    v17 = +[WFFileRepresentation proposedFilenameForFile:v16 ofType:v7];

    v18 = +[WFFileRepresentation fileWithData:v15 ofType:v7 proposedFilename:v17];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)copyStateToItem:(id)a3
{
}

- (id)imageAttachments
{
  v2 = [(WFReminderContentItem *)self reminder];
  v3 = [v2 attachmentContext];
  id v4 = [v3 imageAttachments];
  v5 = objc_msgSend(v4, "if_map:", &__block_literal_global_222_19178);

  return v5;
}

id __41__WFReminderContentItem_imageAttachments__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 fileURL];
  v3 = +[WFFileRepresentation fileWithURL:v2 options:13];

  return v3;
}

- (id)URL
{
  v2 = [(WFReminderContentItem *)self reminder];
  v3 = [v2 attachmentContext];
  id v4 = [v3 urlAttachments];
  v5 = [v4 firstObject];
  int v6 = [v5 url];

  return v6;
}

- (BOOL)flagged
{
  v2 = [(WFReminderContentItem *)self reminder];
  v3 = [v2 flaggedContext];
  BOOL v4 = [v3 flagged] > 0;

  return v4;
}

- (BOOL)hasAlarms
{
  v2 = [(WFReminderContentItem *)self reminder];
  v3 = [v2 alarms];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)subtasks
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [(WFReminderContentItem *)self reminder];
  v3 = [v2 subtaskContext];
  id v8 = 0;
  BOOL v4 = [v3 fetchRemindersWithError:&v8];
  id v5 = v8;

  if (!v4)
  {
    int v6 = getWFContentGraphLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v10 = "-[WFReminderContentItem subtasks]";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_216505000, v6, OS_LOG_TYPE_ERROR, "%s Failed to fetch subtasks with error %@", buf, 0x16u);
    }
  }
  return v4;
}

- (BOOL)hasSubtasks
{
  v2 = [(WFReminderContentItem *)self subtasks];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)parentReminder
{
  v2 = [(WFReminderContentItem *)self reminder];
  BOOL v3 = [v2 parentReminder];

  return v3;
}

- (id)changeTransaction
{
  v2 = [[WFReminderContentItemChangeTransaction alloc] initWithContentItem:self];
  return v2;
}

+ (id)contactRepresentationWithContact:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v4 = [v3 contact];
    if (v4)
    {
      id v5 = v4;
      int v6 = [v4 phoneNumbers];
      id v7 = objc_msgSend(v6, "if_map:", &__block_literal_global_281_19202);

      id v8 = [v5 emailAddresses];
      v9 = objc_msgSend(v8, "if_map:", &__block_literal_global_283);

      uint64_t v16 = 0;
      v17 = &v16;
      uint64_t v18 = 0x2050000000;
      id v10 = (void *)getREMContactRepresentationClass_softClass;
      uint64_t v19 = getREMContactRepresentationClass_softClass;
      if (!getREMContactRepresentationClass_softClass)
      {
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __getREMContactRepresentationClass_block_invoke;
        v15[3] = &unk_26428AC60;
        v15[4] = &v16;
        __getREMContactRepresentationClass_block_invoke((uint64_t)v15);
        id v10 = (void *)v17[3];
      }
      __int16 v11 = v10;
      _Block_object_dispose(&v16, 8);
      id v12 = (void *)[[v11 alloc] initWithPhones:v7 emails:v9];
    }
    else
    {
      id v12 = 0;
    }
    uint64_t v13 = v3;
  }
  else
  {

    uint64_t v13 = 0;
    id v12 = 0;
  }

  return v12;
}

uint64_t __58__WFReminderContentItem_contactRepresentationWithContact___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 value];
}

id __58__WFReminderContentItem_contactRepresentationWithContact___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 value];
  id v3 = [v2 unformattedInternationalStringValue];

  return v3;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Reminders");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  BOOL v4 = WFLocalizedStringResourceWithKey(@"Reminders", @"Reminders");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  BOOL v4 = WFLocalizedStringResourceWithKey(@"Reminder (singular)", @"Reminder");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Location";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  BOOL v4 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v5 = +[WFObjectType typeWithClass:objc_opt_class()];
  int v6 = [MEMORY[0x263F852B8] typeWithString:@"com.apple.ical.ics"];
  id v7 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, 0);

  return v7;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClassName:@"REMReminder" frameworkName:@"ReminderKit" location:1];
  BOOL v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToClass:objc_opt_class()] & 1) != 0
    || ([v4 isEqualToClass:objc_opt_class()] & 1) != 0
    || ([v4 isEqualToClass:objc_opt_class()] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFReminderContentItem;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
}

+ (BOOL)hasLibrary
{
  return 1;
}

+ (id)defaultList
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = WFGetWorkflowReminderStore();
  id v8 = 0;
  id v3 = [v2 fetchDefaultListWithError:&v8];
  id v4 = v8;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    int v6 = getWFContentGraphLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v10 = "+[WFReminderContentItem defaultList]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_216505000, v6, OS_LOG_TYPE_ERROR, "%s Failed to fetch default list with error %@", buf, 0x16u);
    }
  }
  return v3;
}

+ (id)allLists
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = WFGetWorkflowReminderStore();
  id v3 = objc_opt_new();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__WFReminderContentItem_allLists__block_invoke;
  v8[3] = &unk_2642894E0;
  id v4 = v3;
  id v9 = v4;
  [v2 enumerateAllListsWithBlock:v8];
  id v5 = getWFContentGraphLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [v4 count];
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "+[WFReminderContentItem allLists]";
    __int16 v12 = 2048;
    uint64_t v13 = v6;
    _os_log_impl(&dword_216505000, v5, OS_LOG_TYPE_INFO, "%s Fetched %ld Reminders lists", buf, 0x16u);
  }

  return v4;
}

uint64_t __33__WFReminderContentItem_allLists__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (id)stringConversionBehavior
{
  v2 = [a1 propertyForName:@"Title"];
  id v3 = +[WFContentItemStringConversionBehavior accessingProperty:v2];

  return v3;
}

+ (id)propertyBuilders
{
  v135[4] = *MEMORY[0x263EF8340];
  v2 = WFLocalizedString(@"None");
  v135[0] = v2;
  id v3 = WFLocalizedString(@"Low");
  v135[1] = v3;
  id v4 = WFLocalizedString(@"Medium");
  v135[2] = v4;
  id v5 = WFLocalizedString(@"High");
  v135[3] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v135 count:4];

  objc_super v7 = [MEMORY[0x263F088D0] indexSetWithIndex:0];
  v133[0] = v7;
  id v8 = [v6 objectAtIndex:0];
  v134[0] = v8;
  id v9 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 1, 4);
  v133[1] = v9;
  id v10 = [v6 objectAtIndex:3];
  v134[1] = v10;
  __int16 v11 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 5, 1);
  v133[2] = v11;
  __int16 v12 = [v6 objectAtIndex:2];
  v134[2] = v12;
  uint64_t v13 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 6, 4);
  v133[3] = v13;
  v103 = v6;
  uint64_t v14 = [v6 objectAtIndex:1];
  v134[3] = v14;
  objc_super v15 = [NSDictionary dictionaryWithObjects:v134 forKeys:v133 count:4];

  v125 = WFLocalizedContentPropertyNameMarker(@"Title");
  v124 = +[WFContentPropertyBuilder keyPath:@"reminder.title.string" name:v125 class:objc_opt_class()];
  v123 = [v124 setterBlock:&__block_literal_global_19249];
  v132[0] = v123;
  v122 = WFLocalizedContentPropertyNameMarker(@"Notes");
  v121 = +[WFContentPropertyBuilder keyPath:@"reminder.notes.string" name:v122 class:objc_opt_class()];
  v120 = [v121 sortable:0];
  v119 = [v120 appendable:1];
  v118 = [v119 setterBlock:&__block_literal_global_66];
  v132[1] = v118;
  v117 = WFLocalizedContentPropertyNameMarker(@"Last Modified Date");
  v116 = +[WFContentPropertyBuilder keyPath:@"reminder.lastModifiedDate" name:v117 class:objc_opt_class()];
  v115 = [v116 tense:1];
  v114 = [v115 timeUnits:8444];
  v113 = [v114 userInfo:@"WFFileModificationDate"];
  v132[2] = v113;
  v112 = WFLocalizedContentPropertyNameMarker(@"Creation Date");
  v111 = +[WFContentPropertyBuilder keyPath:@"reminder.creationDate" name:v112 class:objc_opt_class()];
  v110 = [v111 tense:1];
  v109 = [v110 timeUnits:8444];
  v108 = [v109 userInfo:@"WFFileCreationDate"];
  v132[3] = v108;
  v107 = WFLocalizedContentPropertyNameMarker(@"File Size");
  v106 = +[WFContentPropertyBuilder block:&__block_literal_global_79 name:v107 class:objc_opt_class()];
  v105 = [v106 userInfo:@"WFFileSizeProperty"];
  v104 = [v105 filterable:0];
  v102 = [v104 sortable:0];
  v132[4] = v102;
  v101 = WFLocalizedContentPropertyNameMarker(@"Due Date");
  v100 = +[WFContentPropertyBuilder block:&__block_literal_global_86 name:v101 class:objc_opt_class()];
  v99 = [v100 timeUnits:8444];
  v98 = [v99 setterBlock:&__block_literal_global_90];
  v97 = [v98 timeUnits:8316];
  v132[5] = v97;
  v130[0] = MEMORY[0x263EF8330];
  v130[1] = 3221225472;
  v130[2] = __41__WFReminderContentItem_propertyBuilders__block_invoke_7;
  v130[3] = &unk_264289370;
  id v16 = v15;
  id v131 = v16;
  v96 = WFLocalizedContentPropertyNameMarker(@"Priority");
  v95 = +[WFContentPropertyBuilder block:v130 name:v96 class:objc_opt_class()];
  v93 = [v95 possibleValues:v6];
  v128[0] = MEMORY[0x263EF8330];
  v128[1] = 3221225472;
  v128[2] = __41__WFReminderContentItem_propertyBuilders__block_invoke_8;
  v128[3] = &unk_264289398;
  id v129 = v16;
  id v94 = v16;
  v92 = [v93 setterBlock:v128];
  v132[6] = v92;
  v90 = WFLocalizedContentPropertyNameMarker(@"Is Completed");
  v91 = [NSNumber numberWithBool:1];
  v89 = +[WFContentPropertyBuilder keyPath:@"reminder.completed" name:v90 class:objc_opt_class()];
  v88 = WFLocalizedContentPropertyNameMarker(@"Is Not Completed");
  v87 = [v89 negativeName:v88];
  v86 = WFLocalizedString(@"Reminder");
  v85 = [v87 singularItemName:v86];
  v84 = [v85 setterBlock:&__block_literal_global_106_19265];
  v132[7] = v84;
  v82 = WFLocalizedContentPropertyNameMarker(@"Is Flagged");
  v83 = [NSNumber numberWithBool:1];
  v81 = +[WFContentPropertyBuilder keyPath:@"flagged" name:v82 class:objc_opt_class()];
  v80 = WFLocalizedContentPropertyNameMarker(@"Is Not Flagged");
  v79 = [v81 negativeName:v80];
  v78 = WFLocalizedString(@"Reminder");
  v77 = [v79 singularItemName:v78];
  v76 = [v77 setterBlock:&__block_literal_global_117];
  v132[8] = v76;
  v75 = WFLocalizedContentPropertyNameMarker(@"Completion Date");
  v74 = +[WFContentPropertyBuilder keyPath:@"reminder.completionDate" name:v75 class:objc_opt_class()];
  v132[9] = v74;
  v73 = WFLocalizedContentPropertyNameMarker(@"List");
  v70 = +[WFContentPropertyBuilder keyPath:@"reminder.list.name" name:v73 class:objc_opt_class()];
  v127[0] = MEMORY[0x263EF8330];
  v127[1] = 3221225472;
  v127[2] = __41__WFReminderContentItem_propertyBuilders__block_invoke_11;
  v127[3] = &__block_descriptor_40_e14___NSArray_8__0l;
  v127[4] = a1;
  v69 = [v70 possibleValuesGetter:v127];
  v126[0] = MEMORY[0x263EF8330];
  v126[1] = 3221225472;
  v126[2] = __41__WFReminderContentItem_propertyBuilders__block_invoke_12;
  v126[3] = &__block_descriptor_40_e61_v24__0__WFReminderContentItemChangeTransaction_8__NSString_16l;
  v126[4] = a1;
  v72 = [v69 setterBlock:v126];
  v132[10] = v72;
  v68 = WFLocalizedContentPropertyNameMarker(@"Tags");
  v67 = +[WFContentPropertyBuilder block:&__block_literal_global_134_19274 name:v68 class:objc_opt_class()];
  v66 = [v67 multipleValues:1];
  v65 = [v66 allowedOperators:&unk_26C743B28];
  v64 = [v65 setterBlock:&__block_literal_global_141];
  v132[11] = v64;
  v63 = WFLocalizedContentPropertyNameMarker(@"URL");
  v62 = +[WFContentPropertyBuilder keyPath:@"URL" name:v63 class:objc_opt_class()];
  v61 = [v62 sortable:0];
  v60 = [v61 setterBlock:&__block_literal_global_149];
  v59 = [v60 canLowercaseName:0];
  v132[12] = v59;
  v58 = WFLocalizedContentPropertyNameMarker(@"Images");
  v57 = +[WFContentPropertyBuilder keyPath:@"imageAttachments" name:v58 class:objc_opt_class()];
  v56 = [v57 sortable:0];
  v55 = [v56 removable:0];
  v54 = [v55 multipleValues:1];
  v53 = [v54 setterBlock:&__block_literal_global_159];
  v52 = WFLocalizedContentPropertyNameMarker(@"Image");
  v51 = [v53 singularItemName:v52];
  v132[13] = v51;
  v49 = WFLocalizedContentPropertyNameMarker(@"Has Subtasks");
  v50 = [NSNumber numberWithBool:1];
  v48 = +[WFContentPropertyBuilder keyPath:@"hasSubtasks" name:v49 class:objc_opt_class()];
  v47 = WFLocalizedContentPropertyNameMarker(@"Has No Subtasks");
  v46 = [v48 negativeName:v47];
  v45 = WFLocalizedString(@"Reminder");
  v44 = [v46 singularItemName:v45];
  v132[14] = v44;
  v43 = WFLocalizedContentPropertyNameMarker(@"Subtasks");
  getREMReminderClass();
  v42 = +[WFContentPropertyBuilder keyPath:@"subtasks" name:v43 class:objc_opt_class()];
  v41 = [v42 multipleValues:1];
  v40 = [v41 sortable:0];
  v39 = [v40 filterable:0];
  v38 = [v39 setterBlock:&__block_literal_global_180_19285];
  v132[15] = v38;
  v37 = WFLocalizedContentPropertyNameMarker(@"Parent Reminder");
  getREMReminderClass();
  v36 = +[WFContentPropertyBuilder keyPath:@"parentReminder" name:v37 class:objc_opt_class()];
  v35 = [v36 sortable:0];
  v34 = [v35 filterable:0];
  v33 = [v34 setterBlock:&__block_literal_global_190];
  v132[16] = v33;
  v31 = WFLocalizedContentPropertyNameMarker(@"Has Alarms");
  v32 = [NSNumber numberWithBool:1];
  v30 = +[WFContentPropertyBuilder keyPath:@"hasAlarms" name:v31 class:objc_opt_class()];
  v29 = WFLocalizedContentPropertyNameMarker(@"Has No Alarms");
  v17 = [v30 negativeName:v29];
  uint64_t v18 = WFLocalizedString(@"Reminder");
  uint64_t v19 = [v17 singularItemName:v18];
  v132[17] = v19;
  v20 = WFLocalizedContentPropertyNameMarker(@"Reminder Location");
  uint64_t v21 = +[WFContentPropertyBuilder block:&__block_literal_global_203 name:v20 class:getCLLocationClass_19292()];
  v132[18] = v21;
  v22 = WFLocalizedContentPropertyNameMarker(@"When Messaging Person");
  uint64_t v23 = +[WFContentPropertyBuilder block:&__block_literal_global_209 name:v22 class:objc_opt_class()];
  uint64_t v24 = [v23 gettable:0];
  v25 = [v24 filterable:0];
  v26 = [v25 setterBlock:&__block_literal_global_217_19294];
  v132[19] = v26;
  id v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v132 count:20];

  return v28;
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a2;
  objc_super v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
        uint64_t v14 = [v6 reminder];
        int v15 = objc_msgSend(v13, "containsIndex:", objc_msgSend(v14, "priority"));

        if (v15)
        {
          id v16 = [*(id *)(a1 + 32) objectForKey:v13];
          v7[2](v7, v16);

          goto LABEL_11;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v7[2](v7, 0);
LABEL_11:
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v11 = v5;
  if (a3)
  {
    id v6 = [*(id *)(a1 + 32) allKeysForObject:a3];
    objc_super v7 = [v6 firstObject];

    if (v7)
    {
      id v8 = [v6 firstObject];
      uint64_t v9 = [v8 firstIndex];
      uint64_t v10 = [v11 mutableReminder];
      [v10 setPriority:v9];
    }
  }
  else
  {
    id v6 = [v5 mutableReminder];
    [v6 setPriority:0];
  }
}

id __41__WFReminderContentItem_propertyBuilders__block_invoke_11(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) allLists];
  v2 = [v1 valueForKey:@"name"];

  return v2;
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  objc_super v7 = [v5 allLists];
  id v8 = [v7 objectMatchingKey:@"name" value:v6];

  if (v8) {
    [v9 updateList:v8];
  }
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_8_214(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v6 = [a2 mutableReminder];
  id v5 = +[WFReminderContentItem contactRepresentationWithContact:v4];

  [v6 setContactHandles:v5];
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_6_200(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v24 = a3;
  v25 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  objc_super v7 = [v6 reminder];
  id v8 = [v7 alarms];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v13 = [v12 trigger];
        uint64_t v31 = 0;
        v32 = &v31;
        uint64_t v33 = 0x2050000000;
        uint64_t v14 = (void *)getREMAlarmLocationTriggerClass_softClass;
        uint64_t v34 = getREMAlarmLocationTriggerClass_softClass;
        if (!getREMAlarmLocationTriggerClass_softClass)
        {
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __getREMAlarmLocationTriggerClass_block_invoke;
          v30[3] = &unk_26428AC60;
          v30[4] = &v31;
          __getREMAlarmLocationTriggerClass_block_invoke((uint64_t)v30);
          uint64_t v14 = (void *)v32[3];
        }
        id v15 = v14;
        _Block_object_dispose(&v31, 8);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          long long v17 = [v12 trigger];
          long long v18 = [v17 structuredLocation];

          id v19 = objc_alloc((Class)getCLLocationClass_19292());
          [v18 latitude];
          double v21 = v20;
          [v18 longitude];
          uint64_t v23 = (void *)[v19 initWithLatitude:v21 longitude:v22];
          v25[2](v25, v23);

          goto LABEL_13;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v35 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  v25[2](v25, 0);
LABEL_13:
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_5_187(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 remObjectID];
  }
  else
  {
    id v6 = 0;
  }
  objc_super v7 = [v8 mutableReminder];
  [v7 setParentReminderID:v6];

  if (v5) {
}
  }

uint64_t __41__WFReminderContentItem_propertyBuilders__block_invoke_4_178(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateSubtasks:");
}

uint64_t __41__WFReminderContentItem_propertyBuilders__block_invoke_3_157(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateImageFiles:");
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_2_146(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v4 = a3;
  id v5 = [v10 mutableReminder];
  id v6 = [v5 attachmentContext];
  [v6 removeURLAttachments];

  if (v4)
  {
    objc_super v7 = [v10 mutableReminder];
    id v8 = [v7 attachmentContext];
    id v9 = (id)[v8 addURLAttachmentWithURL:v4];
  }
}

uint64_t __41__WFReminderContentItem_propertyBuilders__block_invoke_138(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTags:");
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_13(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  id v6 = a4;
  id v10 = [a2 reminder];
  objc_super v7 = [v10 hashtags];
  id v8 = [v7 allObjects];
  id v9 = [v8 valueForKey:@"name"];
  ((void (**)(void, void *))a4)[2](v6, v9);
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_10(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if (a3) {
    a3 = [(id)a3 BOOLValue];
  }
  id v4 = [v5 mutableReminder];
  [v4 setFlagged:a3];
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3) {
    a3 = (void *)[a3 BOOLValue];
  }
  id v4 = [v5 mutableReminder];
  [v4 setCompleted:a3];
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 mutableReminder];
  [v5 setDueDateComponentsWithAlarmsIfNeeded:v4];
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v12 = a2;
  id v5 = a4;
  id v6 = [v12 reminder];
  objc_super v7 = [v6 dueDateComponents];
  if (v7)
  {
    id v8 = [MEMORY[0x263EFF8F0] currentCalendar];
    id v9 = [v12 reminder];
    id v10 = [v9 dueDateComponents];
    id v11 = [v8 dateFromComponents:v10];
    v5[2](v5, v11);
  }
  else
  {
    v5[2](v5, 0);
  }
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__WFReminderContentItem_propertyBuilders__block_invoke_4;
  v7[3] = &unk_26428A288;
  id v8 = v5;
  id v6 = v5;
  [a2 getPreferredFileSize:v7];
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [[WFFileSize alloc] initWithByteCount:a2];
  (*(void (**)(uint64_t, WFFileSize *))(v2 + 16))(v2, v3);
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v5 mode];
  int v7 = [v6 isEqual:@"Append"];

  id v8 = objc_alloc(MEMORY[0x263F086A0]);
  id v9 = v8;
  if (v7)
  {
    id v16 = [v5 mutableReminder];
    id v10 = [v16 notes];
    id v11 = [v10 string];
    id v12 = [v11 stringByAppendingAsNewLine:v4];

    uint64_t v13 = (void *)[v9 initWithString:v12];
    uint64_t v14 = [v5 mutableReminder];

    [v14 setNotes:v13];
  }
  else
  {
    if (v4) {
      id v15 = v4;
    }
    else {
      id v15 = &stru_26C71CE08;
    }
    id v16 = (id)[v8 initWithString:v15];

    id v10 = [v5 mutableReminder];

    [v10 setNotes:v16];
  }
}

void __41__WFReminderContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (objc_class *)MEMORY[0x263F086A0];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 alloc];
  if (v5) {
    id v8 = v5;
  }
  else {
    id v8 = &stru_26C71CE08;
  }
  id v10 = (id)[v7 initWithString:v8];

  id v9 = [v6 mutableReminder];

  [v9 setTitle:v10];
}

+ (id)itemWithReminder:(id)a3 fromReminderStore:(id)a4
{
  id v6 = a4;
  id v7 = [a1 itemWithObject:a3 named:0];
  [v7 setReminderStore:v6];

  return v7;
}

@end