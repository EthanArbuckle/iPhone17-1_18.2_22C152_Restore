@interface EKUICalendarMenu
+ (id)_calendarMenuWithCalendars:(id)a3 eventStore:(id)a4 backgroundColor:(id)a5 setupActionHandler:(id)a6 selectionHandler:(id)a7 subtitle:(id)a8;
+ (id)calendarCircleImageForColor:(id)a3;
+ (id)calendarMenuWithCalendars:(id)a3 eventStore:(id)a4 backgroundColor:(id)a5 setupActionHandler:(id)a6 selectionHandler:(id)a7;
+ (id)calendarSubmenuWithSubtitle:(id)a3 calendars:(id)a4 eventStore:(id)a5 backgroundColor:(id)a6 setupActionHandler:(id)a7 selectionHandler:(id)a8;
+ (id)placeholderMenuForCalendar:(id)a3 backgroundColor:(id)a4;
@end

@implementation EKUICalendarMenu

+ (id)calendarMenuWithCalendars:(id)a3 eventStore:(id)a4 backgroundColor:(id)a5 setupActionHandler:(id)a6 selectionHandler:(id)a7
{
  return (id)[a1 _calendarMenuWithCalendars:a3 eventStore:a4 backgroundColor:a5 setupActionHandler:a6 selectionHandler:a7 subtitle:0];
}

+ (id)calendarSubmenuWithSubtitle:(id)a3 calendars:(id)a4 eventStore:(id)a5 backgroundColor:(id)a6 setupActionHandler:(id)a7 selectionHandler:(id)a8
{
  return (id)[a1 _calendarMenuWithCalendars:a4 eventStore:a5 backgroundColor:a6 setupActionHandler:a7 selectionHandler:a8 subtitle:a3];
}

+ (id)calendarCircleImageForColor:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1818];
  id v4 = a3;
  v5 = [v3 systemImageNamed:@"circlebadge.fill"];
  v6 = [v5 imageWithTintColor:v4 renderingMode:1];

  return v6;
}

+ (id)placeholderMenuForCalendar:(id)a3 backgroundColor:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 displayColor];
  v9 = CUIKAdjustedColorForBackgroundColor();

  v10 = [a1 calendarCircleImageForColor:v9];
  v11 = CUIKDisplayedTitleForCalendar();

  v12 = [MEMORY[0x1E4FB13F0] actionWithTitle:v11 image:v10 identifier:0 handler:&__block_literal_global_16];
  v13 = (void *)MEMORY[0x1E4FB1970];
  v17[0] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v15 = [v13 menuWithChildren:v14];

  return v15;
}

+ (id)_calendarMenuWithCalendars:(id)a3 eventStore:(id)a4 backgroundColor:(id)a5 setupActionHandler:(id)a6 selectionHandler:(id)a7 subtitle:(id)a8
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v13 = (void (**)(id, void *, void *))a6;
  id v51 = a7;
  id v42 = a8;
  LOBYTE(v41) = 0;
  v14 = [MEMORY[0x1E4F57B40] generateGroupsForCalendars:a3 eventStore:a4 entityType:0 forMode:0 usingBackgroundColor:a5 includingAccountsWithoutCalendars:0 filterByFocus:v41 usingUnselectedCalendars:0 foundRefreshableCalendar:0 anyGroupsHiddenByFocus:0 numberOfCalendarsHiddenByFocus:0];
  v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v14, "count"));
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v14;
  uint64_t v46 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v46)
  {
    uint64_t v44 = *(void *)v59;
    v45 = v15;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v59 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v48 = v16;
        v17 = *(void **)(*((void *)&v58 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1E4F1CA48];
        v19 = [v17 calendarInfos];
        v20 = objc_msgSend(v18, "arrayWithCapacity:", objc_msgSend(v19, "count"));

        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        v47 = v17;
        id v49 = [v17 calendarInfos];
        uint64_t v21 = [v49 countByEnumeratingWithState:&v54 objects:v62 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v55;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v55 != v23) {
                objc_enumerationMutation(v49);
              }
              v25 = *(void **)(*((void *)&v54 + 1) + 8 * i);
              v26 = (void *)MEMORY[0x1E4FB13F0];
              v27 = [v25 title];
              v28 = [v25 color];
              v29 = [a1 calendarCircleImageForColor:v28];
              v52[0] = MEMORY[0x1E4F143A8];
              v52[1] = 3221225472;
              v52[2] = __119__EKUICalendarMenu__calendarMenuWithCalendars_eventStore_backgroundColor_setupActionHandler_selectionHandler_subtitle___block_invoke;
              v52[3] = &unk_1E6088838;
              v52[4] = v25;
              id v53 = v51;
              v30 = [v26 actionWithTitle:v27 image:v29 identifier:0 handler:v52];

              if ([v25 isShared])
              {
                v31 = [v25 stringForSharedCalendar];
                [v30 setDiscoverabilityTitle:v31];
              }
              if (v13)
              {
                v32 = [v25 calendar];
                v13[2](v13, v30, v32);
              }
              [v20 addObject:v30];
            }
            uint64_t v22 = [v49 countByEnumeratingWithState:&v54 objects:v62 count:16];
          }
          while (v22);
        }

        v33 = [v47 title];
        v15 = v45;
        CalAddInlineMenuItemArrayToArrayWithTitle(v45, (uint64_t)v20, (uint64_t)v33);

        uint64_t v16 = v48 + 1;
      }
      while (v48 + 1 != v46);
      uint64_t v46 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v46);
  }

  if (![v15 count])
  {
    v34 = [MEMORY[0x1E4FB13F0] actionWithTitle:&stru_1F0CC2140 image:0 identifier:0 handler:&__block_literal_global_20_0];
    [v15 addObject:v34];
  }
  v35 = (void *)MEMORY[0x1E4FB1970];
  if (v42)
  {
    v36 = EventKitUIBundle();
    v37 = [v36 localizedStringForKey:@"Calendar - context menu" value:@"Calendar" table:0];
    v38 = [MEMORY[0x1E4FB1818] systemImageNamed:@"calendar"];
    v39 = [v35 menuWithTitle:v37 image:v38 identifier:0 options:0 children:v15];

    [v39 setSubtitle:v42];
  }
  else
  {
    v39 = [MEMORY[0x1E4FB1970] menuWithChildren:v15];
  }

  return v39;
}

void __119__EKUICalendarMenu__calendarMenuWithCalendars_eventStore_backgroundColor_setupActionHandler_selectionHandler_subtitle___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) calendar];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end