@interface EKUIContextMenuActions
+ (BOOL)_canEmailOrganizerForEvent:(id)a3;
+ (BOOL)eventsAllDeletable:(id)a3;
+ (BOOL)remindersAllCompleted:(id)a3;
+ (BOOL)remindersAllTogglable:(id)a3;
+ (id)_allActionInfos;
+ (id)_createCalendarsMenuForEvents:(id)a3 presentationController:(id)a4 isEditMenu:(BOOL)a5 overrideActionBlock:(id)a6 completionBlock:(id)a7;
+ (id)_filteredSortedActionInfosForEvents:(id)a3 presentationController:(id)a4 isEditMenu:(BOOL)a5;
+ (id)_organizerContactForEvent:(id)a3;
+ (id)_proposedDateForEvent:(id)a3;
+ (id)menuForEvents:(id)a3 presentationController:(id)a4 isEditMenu:(BOOL)a5 overrideActionBlock:(id)a6 completionBlock:(id)a7;
+ (int64_t)_menuStateForStatus:(int64_t)a3 events:(id)a4;
+ (int64_t)statusButtonsActionFromContextMenuAction:(unint64_t)a3;
+ (void)_acceptProposedTimeForEvent:(id)a3 presentationController:(id)a4;
+ (void)_performSaveWithEvent:(id)a3 span:(int64_t)a4 editor:(id)a5;
+ (void)_presentMailViewControllerSendingToOrganizer:(BOOL)a3 event:(id)a4 presentationController:(id)a5;
+ (void)_saveStatus:(int64_t)a3 forEvent:(id)a4 presentationController:(id)a5;
+ (void)deleteEvents:(id)a3 presentationController:(id)a4;
+ (void)markReminders:(id)a3 completed:(BOOL)a4 editor:(id)a5;
@end

@implementation EKUIContextMenuActions

+ (id)_allActionInfos
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_allActionInfos_onceToken != -1) {
    dispatch_once(&_allActionInfos_onceToken, block);
  }
  v2 = (void *)_allActionInfos_actions;

  return v2;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke(uint64_t a1)
{
  v66[23] = *MEMORY[0x1E4F143B8];
  v2 = [EKUIContextMenuActionInfo alloc];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_2;
  v64[3] = &__block_descriptor_40_e35_B16__0__ShouldShowBlockParameters_8l;
  uint64_t v65 = *(void *)(a1 + 32);
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_3;
  v63[3] = &__block_descriptor_40_e33_v28__0__NSArray_8__UIAction_16B24l;
  v63[4] = v65;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_4;
  v62[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v62[4] = v65;
  v38 = [(EKUIContextMenuActionInfo *)v2 initWithAction:0x400000 showsInEditMenu:1 group:6 positionInGroup:0 shouldShowBlock:v64 configureUIActionBlock:v63 actionBlock:v62];
  v66[0] = v38;
  v37 = [[EKUIContextMenuActionInfo alloc] initWithAction:0x800000 showsInEditMenu:1 group:6 positionInGroup:0 shouldShowBlock:&__block_literal_global_51 configureUIActionBlock:&__block_literal_global_96 actionBlock:&__block_literal_global_107];
  v66[1] = v37;
  v3 = [EKUIContextMenuActionInfo alloc];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_2_116;
  v60[3] = &__block_descriptor_40_e33_v28__0__NSArray_8__UIAction_16B24l;
  uint64_t v61 = *(void *)(a1 + 32);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_3_132;
  v59[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v59[4] = v61;
  v36 = [(EKUIContextMenuActionInfo *)v3 initWithAction:1 showsInEditMenu:1 group:2 positionInGroup:0 shouldShowBlock:&__block_literal_global_115 configureUIActionBlock:v60 actionBlock:v59];
  v66[2] = v36;
  v4 = [EKUIContextMenuActionInfo alloc];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_5_136;
  v57[3] = &__block_descriptor_40_e33_v28__0__NSArray_8__UIAction_16B24l;
  uint64_t v58 = *(void *)(a1 + 32);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_6_152;
  v56[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v56[4] = v58;
  v35 = [(EKUIContextMenuActionInfo *)v4 initWithAction:2 showsInEditMenu:1 group:2 positionInGroup:1 shouldShowBlock:&__block_literal_global_135 configureUIActionBlock:v57 actionBlock:v56];
  v66[3] = v35;
  v5 = [EKUIContextMenuActionInfo alloc];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_8_156;
  v54[3] = &__block_descriptor_40_e33_v28__0__NSArray_8__UIAction_16B24l;
  uint64_t v55 = *(void *)(a1 + 32);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_9;
  v53[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v53[4] = v55;
  v34 = [(EKUIContextMenuActionInfo *)v5 initWithAction:4 showsInEditMenu:1 group:2 positionInGroup:2 shouldShowBlock:&__block_literal_global_155 configureUIActionBlock:v54 actionBlock:v53];
  v66[4] = v34;
  v6 = [EKUIContextMenuActionInfo alloc];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_12;
  v52[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v52[4] = *(void *)(a1 + 32);
  v33 = [(EKUIContextMenuActionInfo *)v6 initWithAction:128 showsInEditMenu:1 group:1 positionInGroup:2 shouldShowBlock:&__block_literal_global_173 configureUIActionBlock:&__block_literal_global_175 actionBlock:v52];
  v66[5] = v33;
  v7 = [EKUIContextMenuActionInfo alloc];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_15;
  v51[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v51[4] = *(void *)(a1 + 32);
  v32 = [(EKUIContextMenuActionInfo *)v7 initWithAction:256 showsInEditMenu:1 group:1 positionInGroup:3 shouldShowBlock:&__block_literal_global_186 configureUIActionBlock:&__block_literal_global_188_0 actionBlock:v51];
  v66[6] = v32;
  v31 = [[EKUIContextMenuActionInfo alloc] initWithAction:8 showsInEditMenu:1 group:1 positionInGroup:0 shouldShowBlock:&__block_literal_global_200 configureUIActionBlock:&__block_literal_global_202 actionBlock:&__block_literal_global_211];
  v66[7] = v31;
  v30 = [[EKUIContextMenuActionInfo alloc] initWithAction:32 showsInEditMenu:1 group:1 positionInGroup:1 shouldShowBlock:&__block_literal_global_214 configureUIActionBlock:&__block_literal_global_216 actionBlock:&__block_literal_global_221];
  v66[8] = v30;
  v29 = [[EKUIContextMenuActionInfo alloc] initWithAction:0x200000 showsInEditMenu:1 group:4 positionInGroup:0 shouldShowBlock:&__block_literal_global_223 configureUIActionBlock:&__block_literal_global_227 actionBlock:&__block_literal_global_244];
  v66[9] = v29;
  v28 = [[EKUIContextMenuActionInfo alloc] initWithAction:0x100000 showsInEditMenu:1 group:4 positionInGroup:1 shouldShowBlock:&__block_literal_global_246 configureUIActionBlock:&__block_literal_global_248 actionBlock:&__block_literal_global_265];
  v66[10] = v28;
  v8 = [EKUIContextMenuActionInfo alloc];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_28;
  v49[3] = &__block_descriptor_40_e35_B16__0__ShouldShowBlockParameters_8l;
  uint64_t v50 = *(void *)(a1 + 32);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_30;
  v48[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v48[4] = v50;
  v27 = [(EKUIContextMenuActionInfo *)v8 initWithAction:2048 showsInEditMenu:0 group:5 positionInGroup:0 shouldShowBlock:v49 configureUIActionBlock:&__block_literal_global_267 actionBlock:v48];
  v66[11] = v27;
  v9 = [EKUIContextMenuActionInfo alloc];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_31;
  v46[3] = &__block_descriptor_40_e35_B16__0__ShouldShowBlockParameters_8l;
  uint64_t v47 = *(void *)(a1 + 32);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_33;
  v45[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v45[4] = v47;
  v26 = [(EKUIContextMenuActionInfo *)v9 initWithAction:4096 showsInEditMenu:0 group:5 positionInGroup:1 shouldShowBlock:v46 configureUIActionBlock:&__block_literal_global_281 actionBlock:v45];
  v66[12] = v26;
  v10 = [EKUIContextMenuActionInfo alloc];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_36;
  v44[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v44[4] = *(void *)(a1 + 32);
  v25 = [(EKUIContextMenuActionInfo *)v10 initWithAction:0x2000 showsInEditMenu:0 group:5 positionInGroup:2 shouldShowBlock:&__block_literal_global_292 configureUIActionBlock:&__block_literal_global_295 actionBlock:v44];
  v66[13] = v25;
  v24 = [[EKUIContextMenuActionInfo alloc] initWithAction:0x4000 showsInEditMenu:0 group:5 positionInGroup:3 shouldShowBlock:&__block_literal_global_303 configureUIActionBlock:&__block_literal_global_306 actionBlock:&__block_literal_global_317];
  v66[14] = v24;
  v11 = [[EKUIContextMenuActionInfo alloc] initWithAction:0x80000 showsInEditMenu:1 group:0 positionInGroup:0 shouldShowBlock:&__block_literal_global_322 configureUIActionBlock:&__block_literal_global_328 actionBlock:&__block_literal_global_340];
  v66[15] = v11;
  v12 = [[EKUIContextMenuActionInfo alloc] initWithAction:0x8000 showsInEditMenu:1 group:0 positionInGroup:1 shouldShowBlock:&__block_literal_global_397 configureUIActionBlock:&__block_literal_global_400 actionBlock:&__block_literal_global_422];
  v66[16] = v12;
  v13 = [[EKUIContextMenuActionInfo alloc] initWithAction:1024 showsInEditMenu:1 group:0 positionInGroup:2 shouldShowBlock:&__block_literal_global_428 configureUIActionBlock:&__block_literal_global_431 actionBlock:&__block_literal_global_440];
  v66[17] = v13;
  v14 = [EKUIContextMenuActionInfo alloc];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_3_457;
  v43[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v43[4] = *(void *)(a1 + 32);
  v15 = [(EKUIContextMenuActionInfo *)v14 initWithAction:512 showsInEditMenu:1 group:1 positionInGroup:4 shouldShowBlock:&__block_literal_global_447 configureUIActionBlock:&__block_literal_global_450 actionBlock:v43];
  v66[18] = v15;
  v16 = [EKUIContextMenuActionInfo alloc];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_4_458;
  v41[3] = &__block_descriptor_40_e35_B16__0__ShouldShowBlockParameters_8l;
  uint64_t v42 = *(void *)(a1 + 32);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_6_474;
  v40[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v40[4] = v42;
  v17 = [(EKUIContextMenuActionInfo *)v16 initWithAction:16 showsInEditMenu:1 group:7 positionInGroup:1 shouldShowBlock:v41 configureUIActionBlock:&__block_literal_global_461 actionBlock:v40];
  v66[19] = v17;
  v18 = [[EKUIContextMenuActionInfo alloc] initWithAction:0x10000 showsInEditMenu:1 group:7 positionInGroup:0 shouldShowBlock:&__block_literal_global_477 configureUIActionBlock:&__block_literal_global_481 actionBlock:&__block_literal_global_490];
  v66[20] = v18;
  id v19 = [[EKUIContextMenuActionInfo alloc] initCalendarMenuPlaceholderInGroup:3 positionInGroup:1];
  v66[21] = v19;
  v20 = [EKUIContextMenuActionInfo alloc];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_3_510;
  v39[3] = &__block_descriptor_40_e38_v24__0__NSArray_8__UIViewController_16l;
  v39[4] = *(void *)(a1 + 32);
  v21 = [(EKUIContextMenuActionInfo *)v20 initWithAction:0x40000 showsInEditMenu:0 group:3 positionInGroup:2 shouldShowBlock:&__block_literal_global_497 configureUIActionBlock:&__block_literal_global_500 actionBlock:v39];
  v66[22] = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:23];
  v23 = (void *)_allActionInfos_actions;
  _allActionInfos_actions = v22;
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 events];
  uint64_t v4 = [*(id *)(a1 + 32) remindersAllTogglable:v3];

  return v4;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  v6 = *(void **)(a1 + 32);
  id v7 = a3;
  LODWORD(v6) = [v6 remindersAllCompleted:a2];
  v8 = EventKitUIBundle();
  v9 = v8;
  if (v6)
  {
    id v15 = [v8 localizedStringForKey:@"Uncomplete - context menu" value:@"Mark as Incomplete" table:0];

    if (a4)
    {
      v10 = EventKitUIBundle();
      uint64_t v11 = [v10 localizedStringForKey:@"Uncomplete - edit menu" value:@"Mark as Incomplete" table:0];
      v12 = (void *)MEMORY[0x1E4F57AA0];
LABEL_6:

      id v13 = (id)v11;
      goto LABEL_10;
    }
    v12 = (void *)MEMORY[0x1E4F57AA0];
  }
  else
  {
    id v15 = [v8 localizedStringForKey:@"Complete - context menu" value:@"Mark as Completed" table:0];

    if (a4)
    {
      v10 = EventKitUIBundle();
      uint64_t v11 = [v10 localizedStringForKey:@"Complete - edit menu" value:@"Complete" table:0];
      v12 = (void *)MEMORY[0x1E4F57A88];
      goto LABEL_6;
    }
    v12 = (void *)MEMORY[0x1E4F57A88];
  }
  id v13 = v15;
LABEL_10:
  id v16 = v13;
  [v7 setTitle:v13];
  v14 = [MEMORY[0x1E4FB1818] systemImageNamed:*v12];
  [v7 setImage:v14];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v4 remindersAllCompleted:v6] ^ 1;
  objc_msgSend(v5, "EKUI_editor");
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [v4 markReminders:v6 completed:v7 editor:v8];
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 events];
  if ([v2 count] == 1)
  {
    v3 = [v2 objectAtIndexedSubscript:0];
    uint64_t v4 = [v3 isReminderIntegrationEvent];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = EventKitUIBundle();
  id v5 = [v4 localizedStringForKey:@"Show in Reminders" value:&stru_1F0CC2140 table:0];
  [v3 setTitle:v5];

  id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.forward.app"];
  [v3 setImage:v6];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_7(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = [a2 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 uniqueID];
  id v6 = [v2 URLWithString:v4];

  id v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v5 openURL:v6 configuration:0 completionHandler:&__block_literal_global_112];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (!v4)
  {
    id v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_ERROR, "Failed to open URL when Open in Reminders tapped: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_113(uint64_t a1, void *a2)
{
  v2 = [a2 events];
  if ([v2 count] == 1)
  {
    id v3 = [v2 objectAtIndexedSubscript:0];
    uint64_t v4 = [v3 allowsParticipationStatusModifications];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_2_116(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  uint64_t v8 = [v6 _menuStateForStatus:2 events:a2];
  uint64_t v9 = EventKitUIBundle();
  id v14 = [v9 localizedStringForKey:@"Accept - context menu" value:@"Accept" table:0];

  if (a4 && v8 == 1)
  {
    v10 = EventKitUIBundle();
    uint64_t v11 = [v10 localizedStringForKey:@"Accept - edit menu checked" value:@"✓ Accept" table:0];

    id v12 = (id)v11;
  }
  else
  {
    id v12 = v14;
  }
  id v15 = v12;
  [v7 setTitle:v12];
  id v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle"];
  [v7 setImage:v13];

  [v7 setState:v8];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_3_132(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 objectAtIndexedSubscript:0];
  [v4 _saveStatus:2 forEvent:v6 presentationController:v5];
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_4_133(uint64_t a1, void *a2)
{
  v2 = [a2 events];
  if ([v2 count] == 1)
  {
    id v3 = [v2 objectAtIndexedSubscript:0];
    uint64_t v4 = [v3 allowsParticipationStatusModifications];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_5_136(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  uint64_t v8 = [v6 _menuStateForStatus:4 events:a2];
  uint64_t v9 = EventKitUIBundle();
  id v14 = [v9 localizedStringForKey:@"Maybe - context menu" value:@"Maybe" table:0];

  if (a4 && v8 == 1)
  {
    v10 = EventKitUIBundle();
    uint64_t v11 = [v10 localizedStringForKey:@"Maybe - edit menu checked" value:@"✓ Maybe" table:0];

    id v12 = (id)v11;
  }
  else
  {
    id v12 = v14;
  }
  id v15 = v12;
  [v7 setTitle:v12];
  id v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"questionmark.circle"];
  [v7 setImage:v13];

  [v7 setState:v8];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_6_152(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 objectAtIndexedSubscript:0];
  [v4 _saveStatus:4 forEvent:v6 presentationController:v5];
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_7_153(uint64_t a1, void *a2)
{
  v2 = [a2 events];
  if ([v2 count] == 1)
  {
    id v3 = [v2 objectAtIndexedSubscript:0];
    uint64_t v4 = [v3 allowsParticipationStatusModifications];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_8_156(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  uint64_t v8 = [v6 _menuStateForStatus:3 events:a2];
  uint64_t v9 = EventKitUIBundle();
  id v14 = [v9 localizedStringForKey:@"Decline - context menu" value:@"Decline" table:0];

  if (a4 && v8 == 1)
  {
    v10 = EventKitUIBundle();
    uint64_t v11 = [v10 localizedStringForKey:@"Decline - edit menu checked" value:@"✓ Decline" table:0];

    id v12 = (id)v11;
  }
  else
  {
    id v12 = v14;
  }
  id v15 = v12;
  [v7 setTitle:v12];
  id v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle"];
  [v7 setImage:v13];

  [v7 setState:v8];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 objectAtIndexedSubscript:0];
  [v4 _saveStatus:3 forEvent:v6 presentationController:v5];
}

BOOL __41__EKUIContextMenuActions__allActionInfos__block_invoke_10(uint64_t a1, void *a2)
{
  v2 = [a2 events];
  if ([v2 count] == 1)
  {
    id v3 = [v2 objectAtIndexedSubscript:0];
    if ([v3 isSelfOrganizedInvitation])
    {
      uint64_t v4 = [v2 objectAtIndexedSubscript:0];
      if ([v4 isProposedTimeEvent])
      {
        BOOL v5 = 1;
      }
      else
      {
        id v6 = [v2 objectAtIndexedSubscript:0];
        BOOL v5 = [v6 countOfAttendeeProposedTimes] == 1;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = EventKitUIBundle();
  BOOL v5 = [v4 localizedStringForKey:@"Accept New Time - context menu" value:@"Accept New Time" table:0];
  [v3 setTitle:v5];

  id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark"];
  [v3 setImage:v6];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 objectAtIndexedSubscript:0];
  [v4 _acceptProposedTimeForEvent:v6 presentationController:v5];
}

BOOL __41__EKUIContextMenuActions__allActionInfos__block_invoke_13(uint64_t a1, void *a2)
{
  v2 = [a2 events];
  if ([v2 count] == 1)
  {
    id v3 = [v2 objectAtIndexedSubscript:0];
    if ([v3 isSelfOrganizedInvitation])
    {
      uint64_t v4 = [v2 objectAtIndexedSubscript:0];
      if ([v4 isProposedTimeEvent])
      {
        BOOL v5 = 1;
      }
      else
      {
        id v6 = [v2 objectAtIndexedSubscript:0];
        BOOL v5 = [v6 countOfAttendeeProposedTimes] == 1;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = EventKitUIBundle();
  BOOL v5 = [v4 localizedStringForKey:@"Reject New Time - context menu" value:@"Reject New Time" table:0];
  [v3 setTitle:v5];

  id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
  [v3 setImage:v6];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = objc_msgSend(v5, "objectAtIndexedSubscript:", 0, 0);
  uint64_t v8 = [v7 attendees];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          [v14 setCommentChanged:0];
          [v14 setStatusChanged:0];
          [v14 setProposedStartDateChanged:0];
          [v14 setProposedStartDateStatus:3];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  id v15 = [v5 objectAtIndexedSubscript:0];
  if ([v15 isOrWasPartOfRecurringSeries]) {
    uint64_t v16 = 4;
  }
  else {
    uint64_t v16 = 0;
  }

  v17 = *(void **)(a1 + 32);
  v18 = [v5 objectAtIndexedSubscript:0];
  id v19 = objc_msgSend(v6, "EKUI_editor");
  [v17 _performSaveWithEvent:v18 span:v16 editor:v19];
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [a2 events];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v7, "allowsParticipationStatusModifications", (void)v12) & 1) == 0)
        {
          uint64_t v8 = [v7 calendar];
          uint64_t v9 = [v8 type];

          if (v9 == 5) {
            continue;
          }
        }
        uint64_t v10 = 0;
        goto LABEL_13;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v10 = 1;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }
LABEL_13:

  return v10;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSString;
  id v5 = a3;
  id v6 = a2;
  id v7 = EventKitUIBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"add_x_suggested_events_to_calendar" value:&stru_1F0CC2140 table:0];
  uint64_t v9 = [v6 count];

  uint64_t v10 = objc_msgSend(v4, "localizedStringWithFormat:", v8, v9);
  [v5 setTitle:v10];

  id v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"calendar.badge.plus"];
  [v5 setImage:v11];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = [v7 suggestionInfo];
        [v8 setChangedFields:0];

        uint64_t v9 = [v7 eventStore];
        [v9 acceptSuggestedEvent:v7];

        uint64_t v10 = (void *)MEMORY[0x1E4F57848];
        id v11 = [v7 suggestionInfo];
        long long v12 = [v11 uniqueIdentifier];
        [v10 logEventConfirmedDetailsWithUniqueKey:v12];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [a2 events];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v7, "allowsParticipationStatusModifications", (void)v12) & 1) == 0)
        {
          uint64_t v8 = [v7 calendar];
          uint64_t v9 = [v8 type];

          if (v9 == 5) {
            continue;
          }
        }
        uint64_t v10 = 0;
        goto LABEL_13;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v10 = 1;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }
LABEL_13:

  return v10;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSString;
  id v11 = a3;
  id v5 = a2;
  id v6 = EventKitUIBundle();
  id v7 = [v6 localizedStringForKey:@"ignore_x_suggested_events" value:&stru_1F0CC2140 table:0];
  uint64_t v8 = [v5 count];

  uint64_t v9 = objc_msgSend(v4, "localizedStringWithFormat:", v7, v8);
  [v11 setTitle:v9];

  uint64_t v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
  [v11 setImage:v10];

  [v11 setAttributes:2];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = [v7 suggestionInfo];
        [v8 setChangedFields:0];

        uint64_t v9 = (void *)MEMORY[0x1E4F57848];
        uint64_t v10 = [v7 suggestionInfo];
        id v11 = [v10 uniqueIdentifier];
        [v9 logEventRejectedDetailsWithUniqueKey:v11];

        long long v12 = [v7 eventStore];
        [v12 deleteSuggestedEvent:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_22(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 presentationController];
  uint64_t v4 = [v2 events];

  if ([v4 count] == 1
    && ([v4 objectAtIndexedSubscript:0],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 hasRecurrenceRules],
        v5,
        v6)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v7 = [v4 objectAtIndexedSubscript:0];
    uint64_t v8 = [v3 eventViewDelegateShouldShowNextOccurrenceOfEvent:v7 forward:0];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_23(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v11 = a3;
  uint64_t v5 = EventKitUIBundle();
  int v6 = v5;
  if (a4)
  {
    id v7 = @"Previous - context menu";
    uint64_t v8 = @"Previous";
  }
  else
  {
    id v7 = @"Show Previous Occurrence - context menu";
    uint64_t v8 = @"Go to Previous Occurrence";
  }
  uint64_t v9 = [v5 localizedStringForKey:v7 value:v8 table:0];
  [v11 setTitle:v9];

  uint64_t v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.backward.circle"];
  [v11 setImage:v10];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objectAtIndexedSubscript:0];
  [v4 eventViewDelegateShowNextOccurrenceOfEvent:v5 forward:0];
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_25(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 presentationController];
  id v4 = [v2 events];

  if ([v4 count] == 1
    && ([v4 objectAtIndexedSubscript:0],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 hasRecurrenceRules],
        v5,
        v6)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v7 = [v4 objectAtIndexedSubscript:0];
    uint64_t v8 = [v3 eventViewDelegateShouldShowNextOccurrenceOfEvent:v7 forward:1];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_26(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v11 = a3;
  id v5 = EventKitUIBundle();
  int v6 = v5;
  if (a4)
  {
    id v7 = @"Next - context menu";
    uint64_t v8 = @"Next";
  }
  else
  {
    id v7 = @"Show Next Occurrence - context menu";
    uint64_t v8 = @"Go to Next Occurrence";
  }
  uint64_t v9 = [v5 localizedStringForKey:v7 value:v8 table:0];
  [v11 setTitle:v9];

  uint64_t v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.forward.circle"];
  [v11 setImage:v10];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objectAtIndexedSubscript:0];
  [v4 eventViewDelegateShowNextOccurrenceOfEvent:v5 forward:1];
}

BOOL __41__EKUIContextMenuActions__allActionInfos__block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 events];
  if ([v3 count] == 1)
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    if ([v4 isExternallyOrganizedInvitation])
    {
      id v5 = *(void **)(a1 + 32);
      int v6 = [v3 objectAtIndexedSubscript:0];
      id v7 = [v5 _organizerContactForEvent:v6];
      BOOL v8 = v7 != 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_29(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = EventKitUIBundle();
  id v5 = [v4 localizedStringForKey:@"Show Organizer - context menu" value:@"Show Organizer" table:0];
  [v3 setTitle:v5];

  id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle"];
  [v3 setImage:v6];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_30(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = NSString;
  id v4 = *(void **)(a1 + 32);
  id v5 = [a2 objectAtIndexedSubscript:0];
  id v6 = [v4 _organizerContactForEvent:v5];
  id v7 = [v6 identifier];
  BOOL v8 = [v3 stringWithFormat:@"contact://show?id=%@", v7];
  id v10 = [v2 URLWithString:v8];

  uint64_t v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v9 openSensitiveURL:v10 withOptions:0];
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = [a2 events];
  if ([v3 count] == 1)
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    if ([v4 isExternallyOrganizedInvitation])
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = [v3 objectAtIndexedSubscript:0];
      id v7 = [v5 _organizerContactForEvent:v6];
      if (v7)
      {
        uint64_t v8 = 0;
      }
      else
      {
        uint64_t v9 = *(void **)(a1 + 32);
        id v10 = [v3 objectAtIndexedSubscript:0];
        uint64_t v8 = [v9 _canEmailOrganizerForEvent:v10];
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_32(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = EventKitUIBundle();
  id v5 = [v4 localizedStringForKey:@"Email Organizer - context menu" value:@"Email Organizer" table:0];
  [v3 setTitle:v5];

  id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"envelope"];
  [v3 setImage:v6];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 objectAtIndexedSubscript:0];
  [v4 _presentMailViewControllerSendingToOrganizer:1 event:v6 presentationController:v5];
}

BOOL __41__EKUIContextMenuActions__allActionInfos__block_invoke_34(uint64_t a1, void *a2)
{
  id v2 = [a2 events];
  if ([v2 count] == 1)
  {
    id v3 = [v2 objectAtIndexedSubscript:0];
    BOOL v4 = +[EKUIEmailCompositionManager canShowViewControllerForEvent:v3 withParticipantRecipients:0];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_35(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  BOOL v4 = EventKitUIBundle();
  id v5 = [v4 localizedStringForKey:@"Email Participants - context menu" value:@"Email Participants" table:0];
  [v3 setTitle:v5];

  id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"envelope"];
  [v3 setImage:v6];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 objectAtIndexedSubscript:0];
  [v4 _presentMailViewControllerSendingToOrganizer:0 event:v6 presentationController:v5];
}

BOOL __41__EKUIContextMenuActions__allActionInfos__block_invoke_37(uint64_t a1, void *a2)
{
  id v2 = [a2 events];
  if ([v2 count] == 1)
  {
    id v3 = [v2 objectAtIndexedSubscript:0];
    BOOL v4 = +[EKUITextSendingManager canSendMessageToRecipientsOnEvent:v3];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_38(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  BOOL v4 = EventKitUIBundle();
  id v5 = [v4 localizedStringForKey:@"Message Participants - context menu" value:@"Message Participants" table:0];
  [v3 setTitle:v5];

  id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"message"];
  [v3 setImage:v6];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [EKUITextSendingManager alloc];
  id v7 = [v4 objectAtIndexedSubscript:0];
  uint64_t v8 = [(EKUITextSendingManager *)v6 initWithEvent:v7];

  uint64_t v9 = [(EKUITextSendingManager *)v8 viewController];
  [v9 setModalPresentationStyle:2];

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__17;
  v13[4] = __Block_byref_object_dispose__17;
  id v10 = v8;
  long long v14 = v10;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_318;
  v12[3] = &unk_1E608A660;
  v12[4] = v13;
  [(EKUITextSendingManager *)v10 setMessageSendingComplete:v12];
  id v11 = [(EKUITextSendingManager *)v10 viewController];
  [v5 presentViewController:v11 animated:1 completion:0];

  _Block_object_dispose(v13, 8);
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_318(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    id v3 = [v2 viewController];
    id v4 = [v3 presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_2_320(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 events];
  id v4 = [v2 presentationController];

  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v4 pasteboardManager], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;
    id v7 = [v5 calendarToPasteTo];
    if (v7) {
      uint64_t v8 = [MEMORY[0x1E4F57BF0] allEventsValidForAction:2 fromEvents:v3];
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_3_326(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = EventKitUIBundle();
  uint64_t v5 = [v4 localizedStringForKey:@"Duplicate - context menu" value:@"Duplicate" table:0];
  [v3 setTitle:v5];

  id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.badge.plus"];
  [v3 setImage:v6];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_4_338(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v4 pasteboardManager];
    if (v5 && [v4 conformsToProtocol:&unk_1F0D58C80])
    {
      id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
      [v5 duplicateEvents:v6 withDateMode:3 delegate:v4];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
}

BOOL __41__EKUIContextMenuActions__allActionInfos__block_invoke_5_395(uint64_t a1, void *a2)
{
  id v2 = [a2 events];
  if ([v2 count] == 1)
  {
    id v3 = [v2 objectAtIndexedSubscript:0];
    id v4 = [v3 virtualConference];
    uint64_t v5 = [v4 joinMethods];
    id v6 = [v5 firstObject];
    id v7 = [v6 URL];
    if (v7)
    {
      BOOL v8 = 1;
    }
    else
    {
      uint64_t v9 = [v2 objectAtIndexedSubscript:0];
      id v10 = [v9 conferenceURLForDisplay];
      BOOL v8 = v10 != 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_6_398(uint64_t a1, void *a2, void *a3)
{
  id v26 = a2;
  id v4 = a3;
  uint64_t v5 = [v26 objectAtIndexedSubscript:0];
  id v6 = [v5 virtualConference];
  id v7 = [v6 joinMethods];
  BOOL v8 = [v7 firstObject];
  uint64_t v9 = [v8 URL];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    long long v12 = [v26 objectAtIndexedSubscript:0];
    id v11 = [v12 conferenceURLForDisplay];
  }
  long long v13 = [v26 objectAtIndexedSubscript:0];
  long long v14 = [v13 virtualConference];
  long long v15 = [v14 joinMethods];
  long long v16 = [v15 firstObject];
  uint64_t v17 = [v16 isBroadcast];

  if (v17)
  {
    uint64_t v18 = EventKitUIBundle();
    id v19 = v18;
    long long v20 = @"Watch Broadcast - context menu";
    long long v21 = @"Watch Broadcast";
  }
  else
  {
    int v22 = objc_msgSend(v11, "cal_hasSchemeTel");
    uint64_t v18 = EventKitUIBundle();
    id v19 = v18;
    if (v22)
    {
      long long v20 = @"Call In - context menu";
      long long v21 = @"Call In";
    }
    else
    {
      long long v20 = @"Join Meeting - context menu";
      long long v21 = @"Join Meeting";
    }
  }
  long long v23 = [v18 localizedStringForKey:v20 value:v21 table:0];

  [v4 setTitle:v23];
  v24 = [MEMORY[0x1E4F57B50] synchronousTitleForURL:v11 incomplete:0];
  [v4 setDiscoverabilityTitle:v24];

  uint64_t v25 = [MEMORY[0x1E4F57B50] synchronousOutlineIconForURL:v11 isBroadcast:v17 outImageName:0 incomplete:0];
  [v4 setImage:v25];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_7_420(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v2 = [v11 objectAtIndexedSubscript:0];
  id v3 = [v2 virtualConference];
  id v4 = [v3 joinMethods];
  uint64_t v5 = [v4 firstObject];
  id v6 = [v5 URL];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    uint64_t v9 = [v11 objectAtIndexedSubscript:0];
    id v8 = [v9 conferenceURLForDisplay];
  }
  id v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v10 openURL:v8 configuration:0 completionHandler:&__block_literal_global_425];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_8_423(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (!v4)
  {
    id v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_ERROR, "Failed to open URL when url link in context menu tapped: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_426(uint64_t a1, void *a2)
{
  id v2 = [a2 events];
  if ([v2 count] == 1)
  {
    id v3 = [v2 objectAtIndexedSubscript:0];
    id v4 = [v3 preferredLocation];
    id v5 = [v4 geoLocation];
    if (v5)
    {
      id v6 = [v2 objectAtIndexedSubscript:0];
      int v7 = [v6 preferredLocation];
      uint64_t v8 = [v7 isPrediction] ^ 1;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_2_429(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = EventKitUIBundle();
  id v5 = [v4 localizedStringForKey:@"Open in Maps - context menu" value:@"Open in Maps" table:0];
  [v3 setTitle:v5];

  id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.forward.app"];
  [v3 setImage:v6];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_3_438(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F25580];
  id v3 = [a2 objectAtIndexedSubscript:0];
  id v5 = [v2 mapsURLForLocation:0 onEvent:v3 hasMapItemLaunchOptionFromTimeToLeaveNotification:0];

  id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v4 openURL:v5 configuration:0 completionHandler:&__block_literal_global_444];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_4_442(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (!v4)
  {
    id v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_ERROR, "Failed to open URL when maps link in context menu tapped: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

BOOL __41__EKUIContextMenuActions__allActionInfos__block_invoke_445(uint64_t a1, void *a2)
{
  id v2 = [a2 events];
  if ([v2 count] == 1)
  {
    id v3 = [v2 objectAtIndexedSubscript:0];
    if ([v3 allowsParticipationStatusModifications])
    {
      id v4 = [v2 objectAtIndexedSubscript:0];
      id v5 = [v4 proposedStartDate];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_2_448(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v3 = EventKitUIBundle();
  id v4 = [v3 localizedStringForKey:@"Cancel Proposed Time - context menu" value:@"Cancel Proposed Time" table:0];
  [v6 setTitle:v4];

  id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
  [v6 setImage:v5];

  [v6 setAttributes:2];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_3_457(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  int v7 = [v6 objectAtIndexedSubscript:0];
  [v7 setProposedStartDate:0];

  id v8 = *(void **)(a1 + 32);
  id v10 = [v6 objectAtIndexedSubscript:0];

  uint64_t v9 = objc_msgSend(v5, "EKUI_editor");

  [v8 _performSaveWithEvent:v10 span:0 editor:v9];
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_4_458(uint64_t a1, void *a2)
{
  id v3 = [a2 events];
  uint64_t v4 = [*(id *)(a1 + 32) eventsAllDeletable:v3];

  return v4;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_5_459(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v4 = a3;
  if ([v10 count] == 1)
  {
    id v5 = EventKitUIBundle();
    id v6 = [v5 localizedStringForKey:@"Delete - context menu" value:@"Delete" table:0];
    [v4 setTitle:v6];
  }
  else
  {
    int v7 = NSString;
    id v5 = EventKitUIBundle();
    id v6 = [v5 localizedStringForKey:@"delete_x_events" value:&stru_1F0CC2140 table:0];
    id v8 = objc_msgSend(v7, "localizedStringWithFormat:", v6, objc_msgSend(v10, "count"));
    [v4 setTitle:v8];
  }
  uint64_t v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
  [v4 setImage:v9];

  [v4 setAttributes:2];
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_6_474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) deleteEvents:a2 presentationController:a3];
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_7_475(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [a2 events];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v6), "calendar", (void)v17);
        id v8 = [v2 objectAtIndexedSubscript:0];
        uint64_t v9 = [v8 calendar];
        int v10 = [v7 isEqual:v9];

        if (!v10)
        {
          uint64_t v15 = 0;
          id v11 = v2;
          goto LABEL_17;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  id v11 = [v2 objectAtIndexedSubscript:0];
  long long v12 = [v11 calendar];
  if ([v12 isSubscribed])
  {
    long long v13 = [v2 objectAtIndexedSubscript:0];
    long long v14 = [v13 calendar];
    if ([v14 isSubscribedHolidayCalendar]) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = [MEMORY[0x1E4F57700] currentProcessIsFirstPartyCalendarApp];
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

LABEL_17:
  return v15;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_8_479(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v4 = a2;
  uint64_t v5 = EventKitUIBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"Unsubscribe from This Calendar - context menu" value:@"Unsubscribe from This Calendar" table:0];
  [v11 setTitle:v6];

  int v7 = [v4 objectAtIndexedSubscript:0];

  id v8 = [v7 calendar];
  uint64_t v9 = CUIKDisplayedTitleForCalendar();
  [v11 setDiscoverabilityTitle:v9];

  int v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
  [v11 setImage:v10];

  [v11 setAttributes:2];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_9_488(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 objectAtIndexedSubscript:0];
  uint64_t v6 = [v5 calendar];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_10_491;
  aBlock[3] = &unk_1E6088638;
  id v12 = v6;
  id v7 = v6;
  id v8 = _Block_copy(aBlock);
  uint64_t v9 = +[EKUIRecurrenceAlertController presentUnsubscribeAlertWithOptions:viewController:sourceView:sourceRect:withCompletionHandler:](EKUIRecurrenceAlertController, "presentUnsubscribeAlertWithOptions:viewController:sourceView:sourceRect:withCompletionHandler:", 0, v4, 0, v8, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  int v10 = (void *)_presentedAlert;
  _presentedAlert = v9;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_10_491(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)_presentedAlert;
  _presentedAlert = 0;

  if (a2 != 3)
  {
    if (a2 == 5)
    {
      uint64_t v5 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        int v9 = 138412290;
        uint64_t v10 = v6;
        _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_DEFAULT, "Removing calendar %@ because the user unsubscribed from event details, and reporting it as junk", (uint8_t *)&v9, 0xCu);
      }
      [MEMORY[0x1E4F57C38] unsubscribeFromCalendar:*(void *)(a1 + 32) reportAsJunk:1];
    }
    else
    {
      id v7 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v9 = 138412290;
        uint64_t v10 = v8;
        _os_log_impl(&dword_1B3F4C000, v7, OS_LOG_TYPE_DEFAULT, "Removing calendar %@ because the user unsubscribed from event details", (uint8_t *)&v9, 0xCu);
      }
      [MEMORY[0x1E4F57C38] unsubscribeFromCalendar:*(void *)(a1 + 32)];
    }
  }
}

uint64_t __41__EKUIContextMenuActions__allActionInfos__block_invoke_495(uint64_t a1, void *a2)
{
  id v2 = [a2 events];
  if ([v2 count] == 1)
  {
    uint64_t v3 = [v2 objectAtIndexedSubscript:0];
    if ([v3 hasAttendees])
    {
      id v4 = [v2 objectAtIndexedSubscript:0];
      uint64_t v5 = [v4 calendar];
      uint64_t v6 = [v5 source];
      uint64_t v7 = [v6 supportsAvailabilityRequests];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_2_498(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = EventKitUIBundle();
  uint64_t v5 = [v4 localizedStringForKey:@"Show Availability - context menu" value:@"Show Availability" table:0];
  [v3 setTitle:v5];

  id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.fill.questionmark"];
  [v3 setImage:v6];
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_3_510(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 firstObject];
  uint64_t v8 = +[EKUIAvailabilityViewController presentAvailabilityViewControllerForEvent:v7 fromViewController:v6];

  objc_initWeak(&location, v8);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__EKUIContextMenuActions__allActionInfos__block_invoke_4_512;
  v10[3] = &unk_1E608A688;
  objc_copyWeak(v12, &location);
  v12[1] = *(id *)(a1 + 32);
  id v9 = v6;
  id v11 = v9;
  [v8 setSaveBlock:v10];

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __41__EKUIContextMenuActions__allActionInfos__block_invoke_4_512(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v8 = [WeakRetained modifiedStartDate];
  [v6 setStartDate:v8];

  id v9 = objc_loadWeakRetained(v5);
  uint64_t v10 = [v9 modifiedEndDate];
  [v6 setEndDateUnadjustedForLegacyClients:v10];

  id v11 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "EKUI_editor");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v11 _performSaveWithEvent:v6 span:a3 editor:v12];
}

+ (int64_t)_menuStateForStatus:(int64_t)a3 events:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v7 = v6;
  char v8 = 0;
  uint64_t v9 = *(void *)v16;
  int v10 = 1;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      BOOL v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) participationStatus] == a3;
      v10 &= v12;
      v8 |= v12;
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v7);
  int64_t v13 = (v8 & 1) != 0 ? 2 : 0;
  if (v10) {
LABEL_12:
  }
    int64_t v13 = 1;

  return v13;
}

+ (id)_filteredSortedActionInfosForEvents:(id)a3 presentationController:(id)a4 isEditMenu:(BOOL)a5
{
  id v8 = a4;
  id v9 = a3;
  int v10 = [[ShouldShowBlockParameters alloc] initWithEvents:v9 presentationController:v8];

  id v11 = [a1 _allActionInfos];
  BOOL v12 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __96__EKUIContextMenuActions__filteredSortedActionInfosForEvents_presentationController_isEditMenu___block_invoke;
  long long v21 = &unk_1E608A6B0;
  BOOL v23 = a5;
  uint64_t v22 = v10;
  int64_t v13 = v10;
  long long v14 = [v12 predicateWithBlock:&v18];
  long long v15 = objc_msgSend(v11, "filteredArrayUsingPredicate:", v14, v18, v19, v20, v21);

  long long v16 = [v15 sortedArrayUsingComparator:&__block_literal_global_522];

  return v16;
}

uint64_t __96__EKUIContextMenuActions__filteredSortedActionInfosForEvents_presentationController_isEditMenu___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 action] == 0x20000)
  {
    uint64_t v4 = 1;
  }
  else if (*(unsigned char *)(a1 + 40) && ![v3 showsInEditMenu])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [v3 shouldShowBlock];
    uint64_t v4 = v5[2](v5, *(void *)(a1 + 32));
  }
  return v4;
}

uint64_t __96__EKUIContextMenuActions__filteredSortedActionInfosForEvents_presentationController_isEditMenu___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 group];
  if (v6 < [v5 group])
  {
LABEL_5:
    uint64_t v8 = -1;
    goto LABEL_6;
  }
  unint64_t v7 = [v4 group];
  if (v7 <= [v5 group])
  {
    unint64_t v9 = [v4 positionInGroup];
    if (v9 >= [v5 positionInGroup])
    {
      unint64_t v11 = [v4 positionInGroup];
      uint64_t v8 = v11 > [v5 positionInGroup];
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v8 = 1;
LABEL_6:

  return v8;
}

+ (id)_createCalendarsMenuForEvents:(id)a3 presentationController:(id)a4 isEditMenu:(BOOL)a5 overrideActionBlock:(id)a6 completionBlock:(id)a7
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v44 = a4;
  id v45 = a6;
  id v13 = a7;
  v46 = v12;
  if (a5)
  {
    long long v14 = 0;
  }
  else
  {
    id val = a1;
    id v43 = v13;
    long long v15 = [v12 objectAtIndexedSubscript:0];
    long long v16 = [v15 calendar];
    uint64_t v47 = [v16 source];

    long long v17 = [MEMORY[0x1E4F1CA80] set];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v18 = v12;
    char v19 = 0;
    uint64_t v20 = [v18 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v59;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v59 != v21) {
            objc_enumerationMutation(v18);
          }
          BOOL v23 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          v24 = [v23 calendar];
          uint64_t v25 = [v24 source];
          int v26 = [v25 isEqual:v47];

          if (!v26
            || ![v23 allowsCalendarModifications]
            || (char v27 = [v23 hasAttendees],
                [v23 isExternallyOrganizedInvitation])
            && ![v23 allowsParticipationStatusModifications]
            || ([v23 isIntegrationEvent] & 1) != 0)
          {
            long long v14 = 0;
            goto LABEL_24;
          }
          v28 = [v23 calendar];
          [v17 addObject:v28];

          v19 |= v27;
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v58 objects:v62 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    uint64_t v29 = [v17 count];
    BOOL v30 = v29 == 1;
    if ((v19 & 1) != 0 || [v47 isDelegate]) {
      v31 = v47;
    }
    else {
      v31 = 0;
    }
    id v32 = v31;
    v33 = [v18 objectAtIndexedSubscript:0];
    v34 = [v33 eventStore];

    v35 = [MEMORY[0x1E4F57B40] calendarsLimitedToSource:v32 writability:2 onlyUnmanagedAccounts:0 forEvents:v18 entityType:0 inEventStore:v34];
    objc_initWeak(&location, val);
    if (v29 == 1)
    {
      v36 = [v17 anyObject];
      v37 = CUIKDisplayedTitleForCalendar();
    }
    else
    {
      v38 = NSString;
      v36 = EventKitUIBundle();
      v39 = [v36 localizedStringForKey:@"x_calendars_selected" value:&stru_1F0CC2140 table:0];
      v37 = objc_msgSend(v38, "localizedStringWithFormat:", v39, objc_msgSend(v17, "count"));
    }
    v40 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __126__EKUIContextMenuActions__createCalendarsMenuForEvents_presentationController_isEditMenu_overrideActionBlock_completionBlock___block_invoke;
    v54[3] = &unk_1E608A6F8;
    id v55 = v17;
    BOOL v56 = v30;
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __126__EKUIContextMenuActions__createCalendarsMenuForEvents_presentationController_isEditMenu_overrideActionBlock_completionBlock___block_invoke_2;
    v48[3] = &unk_1E608A720;
    objc_copyWeak(&v53, &location);
    id v51 = v45;
    id v49 = v44;
    id v50 = v18;
    id v52 = v43;
    long long v14 = +[EKUICalendarMenu calendarSubmenuWithSubtitle:v37 calendars:v35 eventStore:v34 backgroundColor:v40 setupActionHandler:v54 selectionHandler:v48];

    objc_destroyWeak(&v53);
    objc_destroyWeak(&location);

    id v18 = v32;
LABEL_24:

    id v13 = v43;
  }

  return v14;
}

void __126__EKUIContextMenuActions__createCalendarsMenuForEvents_presentationController_isEditMenu_overrideActionBlock_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) containsObject:a3])
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  [v6 setState:v5];
}

void __126__EKUIContextMenuActions__createCalendarsMenuForEvents_presentationController_isEditMenu_overrideActionBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v5 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = 0x20000;
      _os_log_impl(&dword_1B3F4C000, v5, OS_LOG_TYPE_DEBUG, "Context menu action %lu was picked.", buf, 0xCu);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    if (!v6 || ((*(uint64_t (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, 0x20000, v3) & 1) == 0)
    {
      unint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "EKUI_editor");
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v20 = a1;
      id v8 = *(id *)(a1 + 40);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            long long v14 = [v13 calendar];
            char v15 = [v3 isEqual:v14];

            if ((v15 & 1) == 0)
            {
              long long v16 = [v13 calendar];
              int v17 = [v13 requiresCopyToMoveFromCalendar:v16 toCalendar:v3];

              if (v17)
              {
                id v18 = (void *)[v13 copyToCalendar:v3 withOptions:0];
                [WeakRetained _performSaveWithEvent:v18 span:0 editor:v7];
              }
              else
              {
                [v13 setCalendar:v3];
                [WeakRetained _performSaveWithEvent:v13 span:0 editor:v7];
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v10);
      }

      uint64_t v19 = *(void *)(v20 + 56);
      if (v19) {
        (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v19, 0x20000);
      }
    }
  }
}

+ (id)menuForEvents:(id)a3 presentationController:(id)a4 isEditMenu:(BOOL)a5 overrideActionBlock:(id)a6 completionBlock:(id)a7
{
  BOOL v9 = a5;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if ([v12 count])
  {
    v48 = v15;
    long long v16 = [a1 _createCalendarsMenuForEvents:v12 presentationController:v13 isEditMenu:v9 overrideActionBlock:v14 completionBlock:v15];
    id v49 = v13;
    BOOL v46 = v9;
    int v17 = [a1 _filteredSortedActionInfosForEvents:v12 presentationController:v13 isEditMenu:v9];
    uint64_t v47 = [MEMORY[0x1E4F1CA48] array];
    id v18 = [v17 objectAtIndexedSubscript:0];
    uint64_t v19 = [v18 group];

    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = v17;
    uint64_t v21 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v59;
      id v45 = v53;
      do
      {
        uint64_t v24 = 0;
        uint64_t v50 = v22;
        do
        {
          if (*(void *)v59 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void **)(*((void *)&v58 + 1) + 8 * v24);
          uint64_t v26 = objc_msgSend(v25, "action", v45);
          if (v26 != 0x20000 || v16 != 0)
          {
            uint64_t v28 = v26;
            if ([v25 group] != v19)
            {
              uint64_t v29 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F0CC2140 image:0 identifier:0 options:1 children:v20];
              [v47 addObject:v29];

              uint64_t v19 = [v25 group];
              [v20 removeAllObjects];
            }
            if (v28 == 0x20000)
            {
              [v20 addObject:v16];
            }
            else
            {
              BOOL v30 = (void *)MEMORY[0x1E4FB13F0];
              v52[0] = MEMORY[0x1E4F143A8];
              v52[1] = 3221225472;
              v53[0] = __110__EKUIContextMenuActions_menuForEvents_presentationController_isEditMenu_overrideActionBlock_completionBlock___block_invoke;
              v53[1] = &unk_1E608A748;
              v53[2] = v25;
              id v56 = v14;
              uint64_t v31 = v23;
              id v32 = v16;
              v33 = v20;
              uint64_t v34 = v19;
              id v35 = v14;
              id v36 = v12;
              id v37 = v12;
              id v54 = v37;
              id v55 = v49;
              id v57 = v48;
              v38 = [v30 actionWithTitle:&stru_1F0CC2140 image:0 identifier:0 handler:v52];
              v39 = [v25 configureUIActionBlock];
              id v40 = v37;
              id v12 = v36;
              id v14 = v35;
              uint64_t v19 = v34;
              uint64_t v20 = v33;
              long long v16 = v32;
              uint64_t v23 = v31;
              uint64_t v22 = v50;
              ((void (**)(void, id, void *, BOOL))v39)[2](v39, v40, v38, v46);

              [v20 addObject:v38];
            }
          }
          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
      }
      while (v22);
    }

    if (v20)
    {
      v41 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F0CC2140 image:0 identifier:0 options:1 children:v20];
      [v47 addObject:v41];
    }
    uint64_t v42 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F0CC2140 image:0 identifier:0 options:1 children:v47];

    id v15 = v48;
    id v13 = v49;
  }
  else
  {
    id v43 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3F4C000, v43, OS_LOG_TYPE_ERROR, "No events provided for EKUIContextMenuActions menuForEvents. Returning empty context menu.", buf, 2u);
    }
    uint64_t v42 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F0CC2140 image:0 identifier:0 options:1 children:MEMORY[0x1E4F1CBF0]];
  }

  return v42;
}

void __110__EKUIContextMenuActions_menuForEvents_presentationController_isEditMenu_overrideActionBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    int v10 = 134217984;
    uint64_t v11 = [v5 action];
    _os_log_impl(&dword_1B3F4C000, v6, OS_LOG_TYPE_DEBUG, "Context menu action %lu was picked.", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (!v7
    || ((*(uint64_t (**)(uint64_t, uint64_t, void))(v7 + 16))(v7, [*(id *)(a1 + 32) action], 0) & 1) == 0)
  {
    id v8 = [*(id *)(a1 + 32) actionBlock];
    v8[2](v8, *(void *)(a1 + 40), *(void *)(a1 + 48));

    uint64_t v9 = *(void *)(a1 + 64);
    if (v9) {
      (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, [*(id *)(a1 + 32) action]);
    }
  }
}

+ (id)_organizerContactForEvent:(id)a3
{
  id v3 = [a3 organizer];
  id v4 = [MEMORY[0x1E4F576B0] defaultProvider];
  uint64_t v5 = [v3 emailAddress];
  if (!v5
    || ([v4 unifiedContactWithEmailAddress:v5],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v7 = [v3 phoneNumber];
    if (v7)
    {
      uint64_t v6 = [v4 unifiedContactWithPhoneNumber:v7];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)_canEmailOrganizerForEvent:(id)a3
{
  id v3 = [a3 organizer];
  id v4 = v3;
  if (v3 && ([v3 isCurrentUser] & 1) == 0)
  {
    uint64_t v6 = [v4 emailAddress];
    uint64_t v7 = v6;
    if (v6 && [v6 length]) {
      char v5 = [MEMORY[0x1E4F73B40] canSendMail];
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (int64_t)statusButtonsActionFromContextMenuAction:(unint64_t)a3
{
  return a3 & 7;
}

+ (void)_presentMailViewControllerSendingToOrganizer:(BOOL)a3 event:(id)a4 presentationController:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [EKUIEmailCompositionManager alloc];
  int v10 = v9;
  if (a3)
  {
    uint64_t v11 = [v7 organizer];
    v20[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    id v13 = [(EKUIEmailCompositionManager *)v10 initWithEvent:v7 participantRecipients:v12 subjectPrefix:0 bodyPrefix:0];
  }
  else
  {
    id v13 = [(EKUIEmailCompositionManager *)v9 initWithEvent:v7 participantRecipients:0 subjectPrefix:0 bodyPrefix:0];
  }
  id v14 = [(EKUIEmailCompositionManager *)v13 viewController];
  [v14 setModalPresentationStyle:2];

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__17;
  v18[4] = __Block_byref_object_dispose__17;
  id v15 = v13;
  uint64_t v19 = v15;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __100__EKUIContextMenuActions__presentMailViewControllerSendingToOrganizer_event_presentationController___block_invoke;
  v17[3] = &unk_1E608A660;
  v17[4] = v18;
  [(EKUIEmailCompositionManager *)v15 setMessageSendingComplete:v17];
  long long v16 = [(EKUIEmailCompositionManager *)v15 viewController];
  [v8 presentViewController:v16 animated:1 completion:0];

  _Block_object_dispose(v18, 8);
}

void __100__EKUIContextMenuActions__presentMailViewControllerSendingToOrganizer_event_presentationController___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    id v3 = [v2 viewController];
    id v4 = [v3 presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

+ (void)_performSaveWithEvent:(id)a3 span:(int64_t)a4 editor:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v13 = 0;
  LOBYTE(a4) = [a5 saveEvent:v7 span:a4 error:&v13];
  id v8 = v13;
  uint64_t v9 = v8;
  if ((a4 & 1) != 0 || !v8) {
    goto LABEL_9;
  }
  int v10 = [v8 domain];
  if (v10 == (void *)*MEMORY[0x1E4F25338])
  {
    uint64_t v11 = [v9 code];

    if (v11 != 1010) {
      goto LABEL_7;
    }
    int v10 = [v7 eventStore];
    [v10 rollback];
  }

LABEL_7:
  uint64_t v12 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v9;
    _os_log_impl(&dword_1B3F4C000, v12, OS_LOG_TYPE_ERROR, "Error saving event as part of context menu action: %@", buf, 0xCu);
  }
LABEL_9:
}

+ (void)_saveStatus:(int64_t)a3 forEvent:(id)a4 presentationController:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([v8 responseMustApplyToAll])
  {
    uint64_t v10 = 4;
LABEL_6:
    [v8 setParticipationStatus:a3];
    [v8 setInvitationStatus:0];
    uint64_t v16 = objc_msgSend(v9, "EKUI_editor");
    [a1 _performSaveWithEvent:v8 span:v10 editor:v16];

    goto LABEL_7;
  }
  if (![v8 isOrWasPartOfRecurringSeries])
  {
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __70__EKUIContextMenuActions__saveStatus_forEvent_presentationController___block_invoke;
  uint64_t v20 = &unk_1E608A770;
  id v11 = v8;
  id v21 = v11;
  int64_t v23 = a3;
  id v24 = a1;
  id v12 = v9;
  id v22 = v12;
  id v13 = _Block_copy(&v17);
  uint64_t v14 = +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v12, 0, v11, v13, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v17, v18, v19, v20);
  id v15 = (void *)_presentedAlert;
  _presentedAlert = v14;

LABEL_7:
}

void __70__EKUIContextMenuActions__saveStatus_forEvent_presentationController___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  switch(a2)
  {
    case 1:
    case 2:
      goto LABEL_3;
    case 3:
      goto LABEL_4;
    case 4:
    case 5:
      return;
    default:
      uint64_t v3 = 0;
LABEL_3:
      [*(id *)(a1 + 32) setParticipationStatus:*(void *)(a1 + 48)];
      [*(id *)(a1 + 32) setInvitationStatus:0];
      id v4 = *(void **)(a1 + 56);
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = objc_msgSend(*(id *)(a1 + 40), "EKUI_editor");
      [v4 _performSaveWithEvent:v5 span:v3 editor:v6];

LABEL_4:
      id v7 = (void *)_presentedAlert;
      _presentedAlert = 0;

      return;
  }
}

+ (void)_acceptProposedTimeForEvent:(id)a3 presentationController:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _proposedDateForEvent:v6];
  if (v8)
  {
    id v9 = [v6 endDateUnadjustedForLegacyClients];
    uint64_t v10 = [v6 startDate];
    [v9 timeIntervalSinceDate:v10];
    double v12 = v11;

    [v6 setStartDate:v8];
    id v13 = [v8 dateByAddingTimeInterval:v12];
    [v6 setEndDateUnadjustedForLegacyClients:v13];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v14 = [v6 attendees];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v28 + 1) + 8 * v18);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v20 = v19;
            [v20 setCommentChanged:0];
            [v20 setStatusChanged:0];
            [v20 setProposedStartDateChanged:0];
          }
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v16);
    }

    [v6 dismissAcceptedProposeNewTimeNotification];
    if ([v6 isOrWasPartOfRecurringSeries])
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __77__EKUIContextMenuActions__acceptProposedTimeForEvent_presentationController___block_invoke;
      v24[3] = &unk_1E608A798;
      id v27 = a1;
      id v25 = v6;
      id v26 = v7;
      uint64_t v21 = +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v26, 0, v25, v24, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      id v22 = (void *)_presentedAlert;
      _presentedAlert = v21;

      int64_t v23 = v25;
    }
    else
    {
      int64_t v23 = objc_msgSend(v7, "EKUI_editor");
      [a1 _performSaveWithEvent:v6 span:0 editor:v23];
    }
  }
}

void __77__EKUIContextMenuActions__acceptProposedTimeForEvent_presentationController___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 3) >= 3)
  {
    if (a2 == 2) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = a2 == 1;
    }
    uint64_t v5 = (void *)_presentedAlert;
    _presentedAlert = 0;

    id v6 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "EKUI_editor");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v6 _performSaveWithEvent:v7 span:v3 editor:v8];
    id v2 = v8;
  }
  else
  {
    id v2 = (void *)_presentedAlert;
    _presentedAlert = 0;
  }
}

+ (id)_proposedDateForEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = objc_msgSend(v3, "attendees", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          if ([v10 proposedStartDateStatus] == 1
            || ![v10 proposedStartDateStatus])
          {
            uint64_t v11 = [v10 proposedStartDateForEvent:v3];
            if (v11)
            {
              double v12 = (void *)v11;

              goto LABEL_15;
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  double v12 = 0;
LABEL_15:

  return v12;
}

+ (void)deleteEvents:(id)a3 presentationController:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(v6, "EKUI_editor");
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v5];
  id v9 = [MEMORY[0x1E4F1CA80] set];
  id v10 = [MEMORY[0x1E4F1CA80] set];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        char v17 = [v16 isProposedTimeEvent];
        uint64_t v18 = v10;
        if ((v17 & 1) == 0)
        {
          int v19 = objc_msgSend(v16, "CUIK_deleteActionShouldDeclineEvent");
          uint64_t v18 = v9;
          if (!v19) {
            continue;
          }
        }
        [v18 addObject:v16];
        [v8 removeObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v13);
  }

  if ([v11 count] == 1)
  {
    id v20 = [v11 objectAtIndexedSubscript:0];
    uint64_t v21 = [v20 status];

    BOOL v22 = v21 == 3;
    if (v21 == 3) {
      uint64_t v23 = 19;
    }
    else {
      uint64_t v23 = 18;
    }
  }
  else
  {
    BOOL v22 = 0;
    uint64_t v23 = 18;
  }
  id v24 = [[EKUIIntegrationAlertDisplayer alloc] initWithViewController:v6 options:1];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__EKUIContextMenuActions_deleteEvents_presentationController___block_invoke;
  aBlock[3] = &unk_1E608A810;
  id v35 = v7;
  id v36 = v24;
  BOOL v41 = v22;
  id v37 = v10;
  id v38 = v9;
  id v39 = v8;
  id v40 = v6;
  id v25 = v6;
  id v26 = v8;
  id v27 = v9;
  id v28 = v10;
  long long v29 = v24;
  id v30 = v7;
  long long v31 = _Block_copy(aBlock);
  uint64_t v32 = +[EKUIRecurrenceAlertController presentDeleteAlertWithOptions:v23 viewController:v25 forEvents:v11 withCompletionHandler:v31];
  uint64_t v33 = (void *)_presentedAlert;
  _presentedAlert = v32;
}

void __62__EKUIContextMenuActions_deleteEvents_presentationController___block_invoke(uint64_t a1, uint64_t a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v15 = *MEMORY[0x1E4F57A90];
  v16[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__EKUIContextMenuActions_deleteEvents_presentationController___block_invoke_2;
  v7[3] = &unk_1E608A7E8;
  uint64_t v13 = a2;
  char v14 = *(unsigned char *)(a1 + 80);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 72);
  [v5 performWithOptions:v6 block:v7];
}

void __62__EKUIContextMenuActions_deleteEvents_presentationController___block_invoke_2(uint64_t a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 72);
  switch(v2)
  {
    case 0:
      uint64_t v2 = 2 * *(unsigned __int8 *)(a1 + 80);
      goto LABEL_7;
    case 1:
    case 2:
      goto LABEL_7;
    case 3:
    case 4:
    case 5:
      id v3 = (void *)_presentedAlert;
      _presentedAlert = 0;

      return;
    default:
      uint64_t v2 = 0;
LABEL_7:
      if ([*(id *)(a1 + 32) count])
      {
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v4 = *(id *)(a1 + 32);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v58 objects:v64 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v59;
          do
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v59 != v7) {
                objc_enumerationMutation(v4);
              }
              [*(id *)(*((void *)&v58 + 1) + 8 * i) setProposedStartDate:0];
            }
            uint64_t v6 = [v4 countByEnumeratingWithState:&v58 objects:v64 count:16];
          }
          while (v6);
        }

        [*(id *)(a1 + 40) saveChangesToEvents:*(void *)(a1 + 32) span:v2];
      }
      if ([*(id *)(a1 + 48) count])
      {
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v9 = *(id *)(a1 + 48);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v54 objects:v63 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v55;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v55 != v12) {
                objc_enumerationMutation(v9);
              }
              char v14 = *(void **)(*((void *)&v54 + 1) + 8 * j);
              [v14 setParticipationStatus:3];
              [v14 setInvitationStatus:0];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v54 objects:v63 count:16];
          }
          while (v11);
        }

        [*(id *)(a1 + 40) saveChangesToEvents:*(void *)(a1 + 48) span:v2];
      }
      if (![*(id *)(a1 + 56) count]) {
        goto LABEL_43;
      }
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v15 = *(id *)(a1 + 56);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v62 count:16];
      if (!v16) {
        goto LABEL_36;
      }
      uint64_t v17 = *(void *)v51;
      break;
  }
  while (2)
  {
    for (uint64_t k = 0; k != v16; ++k)
    {
      if (*(void *)v51 != v17) {
        objc_enumerationMutation(v15);
      }
      if ([*(id *)(*((void *)&v50 + 1) + 8 * k) hasAttendees])
      {
        LODWORD(v16) = 1;
        goto LABEL_36;
      }
    }
    uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v62 count:16];
    if (v16) {
      continue;
    }
    break;
  }
LABEL_36:

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__EKUIContextMenuActions_deleteEvents_presentationController___block_invoke_3;
  aBlock[3] = &unk_1E6089500;
  id v47 = *(id *)(a1 + 56);
  id v48 = *(id *)(a1 + 40);
  uint64_t v49 = v2;
  int v19 = _Block_copy(aBlock);
  id v20 = v19;
  if (v16)
  {
    uint64_t v21 = [*(id *)(a1 + 56) count];
    BOOL v22 = EventKitUIBundle();
    uint64_t v23 = v22;
    if (v21 == 1)
    {
      id v24 = [v22 localizedStringForKey:@"Are you sure you want to delete this event?" value:&stru_1F0CC2140 table:0];

      id v25 = EventKitUIBundle();
      id v26 = v25;
      id v27 = @"Deleting this event will remove it from your calendar and notify the invitees that this event has been deleted. You can’t undo this action.";
    }
    else
    {
      id v24 = [v22 localizedStringForKey:@"Are you sure you want to delete these events?" value:&stru_1F0CC2140 table:0];

      id v25 = EventKitUIBundle();
      id v26 = v25;
      id v27 = @"Deleting these events will notify the invitees that the events have been deleted. You can’t undo this action.";
    }
    id v28 = [v25 localizedStringForKey:v27 value:&stru_1F0CC2140 table:0];

    long long v29 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v24 message:v28 preferredStyle:1];
    id v30 = (void *)MEMORY[0x1E4FB1410];
    long long v31 = EventKitUIBundle();
    uint64_t v32 = [v31 localizedStringForKey:@"Delete and Notify" value:&stru_1F0CC2140 table:0];
    uint64_t v41 = MEMORY[0x1E4F143A8];
    uint64_t v42 = 3221225472;
    long long v43 = __62__EKUIContextMenuActions_deleteEvents_presentationController___block_invoke_4;
    long long v44 = &unk_1E608A7C0;
    id v45 = v20;
    uint64_t v33 = [v30 actionWithTitle:v32 style:2 handler:&v41];
    objc_msgSend(v29, "addAction:", v33, v41, v42, v43, v44);

    uint64_t v34 = (void *)MEMORY[0x1E4FB1410];
    id v35 = EventKitUIBundle();
    id v36 = [v35 localizedStringForKey:@"Cancel - recurrence alert controller" value:@"Cancel" table:0];
    id v37 = [v34 actionWithTitle:v36 style:1 handler:&__block_literal_global_566];
    [v29 addAction:v37];

    [*(id *)(a1 + 64) presentViewController:v29 animated:1 completion:0];
    id v38 = (void *)_presentedAlert;
    _presentedAlert = (uint64_t)v29;
    id v39 = v29;
  }
  else
  {
    (*((void (**)(void *))v19 + 2))(v19);
  }

LABEL_43:
  id v40 = (void *)_presentedAlert;
  _presentedAlert = 0;
}

void __62__EKUIContextMenuActions_deleteEvents_presentationController___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        id v8 = objc_msgSend(MEMORY[0x1E4F25540], "sharedInstance", (void)v10);
        [v8 handleEventDeletion:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 40) deleteEvents:*(void *)(a1 + 32) span:*(void *)(a1 + 48)];
  id v9 = (void *)_presentedAlert;
  _presentedAlert = 0;
}

uint64_t __62__EKUIContextMenuActions_deleteEvents_presentationController___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__EKUIContextMenuActions_deleteEvents_presentationController___block_invoke_5()
{
  v0 = (void *)_presentedAlert;
  _presentedAlert = 0;
}

+ (void)markReminders:(id)a3 completed:(BOOL)a4 editor:(id)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v15, "isReminderIntegrationEvent", (void)v16)
          && objc_msgSend(v15, "CUIK_reminderShouldBeEditable")
          && [v15 completed] != v6)
        {
          [v15 setCompleted:v6];
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  [v8 saveChangesToEvents:v9 span:0];
}

+ (BOOL)remindersAllTogglable:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (!objc_msgSend(v8, "isReminderIntegrationEvent", (void)v11)
          || !objc_msgSend(v8, "CUIK_reminderShouldBeEditable"))
        {
          BOOL v9 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      BOOL v9 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 1;
  }
LABEL_13:

  return v9;
}

+ (BOOL)remindersAllCompleted:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "completed", (void)v10))
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

+ (BOOL)eventsAllDeletable:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (!objc_msgSend(v8, "isDeletable", (void)v11)
          || [v8 isExternallyOrganizedInvitation]
          && [v8 status] != 3
          && [v8 participationStatus] != 3
          && ![v8 isOrganizedBySharedCalendarOwner]
          || [v8 isReminderIntegrationEvent]
          && !objc_msgSend(v8, "CUIK_reminderShouldBeEditable"))
        {
          BOOL v9 = 0;
          goto LABEL_18;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      BOOL v9 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v9 = 1;
  }
LABEL_18:

  return v9;
}

@end