@interface MapsSuggestionsLockscreenImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsLockscreenImprover

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)improveEntry:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    *(void *)v16 = MEMORY[0x1E4F143A8];
    *(void *)&v16[8] = 3221225472;
    *(void *)&v16[16] = ___MapsSuggestionsBundle_block_invoke_3;
    *(void *)&v16[24] = &__block_descriptor_40_e5_v8__0l;
    *(void *)&v16[32] = "LockscreenImprover";
    if (qword_1EB6F0180 != -1) {
      dispatch_once(&qword_1EB6F0180, v16);
    }
    v4 = objc_msgSend((id)_MergedGlobals_31, "localizedStringForKey:value:table:", @"MAPS_SUGG_SUBTITLE_UNLOCK", @"Unlock device to show details<unlocalized>", 0, *(void *)v16, *(void *)&v16[8], *(void *)&v16[16], *(void *)&v16[24], *(void *)&v16[32], v17);
    v5 = MapsSuggestionsNonNilString(v4, &stru_1EFC640F8);
    [v3 setUndecoratedSubtitleWhenLocked:v5];

    BOOL v6 = 0;
    switch([v3 type])
    {
      case 0:
        goto LABEL_52;
      case 1:
      case 2:
      case 9:
      case 18:
      case 19:
      case 20:
      case 22:
      case 23:
      case 24:
        uint64_t v7 = [v3 undecoratedTitle];
        goto LABEL_6;
      case 3:
        *(void *)v16 = MEMORY[0x1E4F143A8];
        *(void *)&v16[8] = 3221225472;
        *(void *)&v16[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(void *)&v16[24] = &__block_descriptor_40_e5_v8__0l;
        *(void *)&v16[32] = "LockscreenImprover";
        if (qword_1EB6F0180 != -1) {
          dispatch_once(&qword_1EB6F0180, v16);
        }
        v10 = (void *)_MergedGlobals_31;
        v11 = @"MAPS_SUGG_TITLE_CAL";
        v12 = @"Upcoming event<unlocalized>";
        goto LABEL_49;
      case 4:
        *(void *)v16 = MEMORY[0x1E4F143A8];
        *(void *)&v16[8] = 3221225472;
        *(void *)&v16[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(void *)&v16[24] = &__block_descriptor_40_e5_v8__0l;
        *(void *)&v16[32] = "LockscreenImprover";
        if (qword_1EB6F0180 != -1) {
          dispatch_once(&qword_1EB6F0180, v16);
        }
        v10 = (void *)_MergedGlobals_31;
        v11 = @"MAPS_SUGG_TITLE_LOI";
        v12 = @"Significant location<unlocalized>";
        goto LABEL_49;
      case 5:
        *(void *)v16 = MEMORY[0x1E4F143A8];
        *(void *)&v16[8] = 3221225472;
        *(void *)&v16[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(void *)&v16[24] = &__block_descriptor_40_e5_v8__0l;
        *(void *)&v16[32] = "LockscreenImprover";
        if (qword_1EB6F0180 != -1) {
          dispatch_once(&qword_1EB6F0180, v16);
        }
        v10 = (void *)_MergedGlobals_31;
        v11 = @"MAPS_SUGG_TITLE_RECENT";
        v12 = @"Recent place<unlocalized>";
        goto LABEL_49;
      case 6:
        *(void *)v16 = MEMORY[0x1E4F143A8];
        *(void *)&v16[8] = 3221225472;
        *(void *)&v16[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(void *)&v16[24] = &__block_descriptor_40_e5_v8__0l;
        *(void *)&v16[32] = "LockscreenImprover";
        if (qword_1EB6F0180 != -1) {
          dispatch_once(&qword_1EB6F0180, v16);
        }
        v10 = (void *)_MergedGlobals_31;
        v11 = @"MAPS_SUGG_TITLE_FAV";
        v12 = @"Favorite place<unlocalized>";
        goto LABEL_49;
      case 7:
        uint64_t v7 = MapsSuggestionsLocalizedParkedCarString();
        goto LABEL_6;
      case 8:
        *(void *)v16 = MEMORY[0x1E4F143A8];
        *(void *)&v16[8] = 3221225472;
        *(void *)&v16[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(void *)&v16[24] = &__block_descriptor_40_e5_v8__0l;
        *(void *)&v16[32] = "LockscreenImprover";
        if (qword_1EB6F0180 != -1) {
          dispatch_once(&qword_1EB6F0180, v16);
        }
        v10 = (void *)_MergedGlobals_31;
        v11 = @"MAPS_SUGG_TITLE_RESTAURANT_RESERVATION";
        v12 = @"Restaurant reservation<unlocalized>";
        goto LABEL_49;
      case 10:
        v13 = [v3 undecoratedTitle];
        [v3 setUndecoratedTitleWhenLocked:v13];

        v9 = [v3 undecoratedSubtitle];
        [v3 setUndecoratedSubtitleWhenLocked:v9];
        goto LABEL_9;
      case 11:
        uint64_t v7 = MapsSuggestionsLocalizedResumeRouteString();
LABEL_6:
        v8 = (void *)v7;
        [v3 setUndecoratedTitleWhenLocked:v7];
        goto LABEL_50;
      case 12:
        *(void *)v16 = MEMORY[0x1E4F143A8];
        *(void *)&v16[8] = 3221225472;
        *(void *)&v16[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(void *)&v16[24] = &__block_descriptor_40_e5_v8__0l;
        *(void *)&v16[32] = "LockscreenImprover";
        if (qword_1EB6F0180 != -1) {
          dispatch_once(&qword_1EB6F0180, v16);
        }
        v10 = (void *)_MergedGlobals_31;
        v11 = @"MAPS_SUGG_TITLE_DEC";
        v12 = @"Recently viewed location<unlocalized>";
        goto LABEL_49;
      case 13:
        *(void *)v16 = MEMORY[0x1E4F143A8];
        *(void *)&v16[8] = 3221225472;
        *(void *)&v16[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(void *)&v16[24] = &__block_descriptor_40_e5_v8__0l;
        *(void *)&v16[32] = "LockscreenImprover";
        if (qword_1EB6F0180 != -1) {
          dispatch_once(&qword_1EB6F0180, v16);
        }
        v10 = (void *)_MergedGlobals_31;
        v11 = @"MAPS_SUGG_TITLE_HOTEL";
        v12 = @"Hotel reservation<unlocalized>";
        goto LABEL_49;
      case 14:
        *(void *)v16 = MEMORY[0x1E4F143A8];
        *(void *)&v16[8] = 3221225472;
        *(void *)&v16[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(void *)&v16[24] = &__block_descriptor_40_e5_v8__0l;
        *(void *)&v16[32] = "LockscreenImprover";
        if (qword_1EB6F0180 != -1) {
          dispatch_once(&qword_1EB6F0180, v16);
        }
        v10 = (void *)_MergedGlobals_31;
        v11 = @"MAPS_SUGG_TITLE_CAR_RENTAL";
        v12 = @"Car rental<unlocalized>";
        goto LABEL_49;
      case 15:
        *(void *)v16 = MEMORY[0x1E4F143A8];
        *(void *)&v16[8] = 3221225472;
        *(void *)&v16[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(void *)&v16[24] = &__block_descriptor_40_e5_v8__0l;
        *(void *)&v16[32] = "LockscreenImprover";
        if (qword_1EB6F0180 != -1) {
          dispatch_once(&qword_1EB6F0180, v16);
        }
        v10 = (void *)_MergedGlobals_31;
        v11 = @"MAPS_SUGG_TITLE_FLIGHT";
        v12 = @"Flight reservation<unlocalized>";
        goto LABEL_49;
      case 16:
        *(void *)v16 = MEMORY[0x1E4F143A8];
        *(void *)&v16[8] = 3221225472;
        *(void *)&v16[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(void *)&v16[24] = &__block_descriptor_40_e5_v8__0l;
        *(void *)&v16[32] = "LockscreenImprover";
        if (qword_1EB6F0180 != -1) {
          dispatch_once(&qword_1EB6F0180, v16);
        }
        v10 = (void *)_MergedGlobals_31;
        v11 = @"MAPS_SUGG_TITLE_TICKET";
        v12 = @"Ticketed event<unlocalized>";
        goto LABEL_49;
      case 17:
        *(void *)v16 = MEMORY[0x1E4F143A8];
        *(void *)&v16[8] = 3221225472;
        *(void *)&v16[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(void *)&v16[24] = &__block_descriptor_40_e5_v8__0l;
        *(void *)&v16[32] = "LockscreenImprover";
        if (qword_1EB6F0180 != -1) {
          dispatch_once(&qword_1EB6F0180, v16);
        }
        v10 = (void *)_MergedGlobals_31;
        v11 = @"MAPS_SUGG_TITLE_PORTRAIT";
        v12 = @"Siri suggestion<unlocalized>";
        goto LABEL_49;
      case 21:
        *(void *)v16 = MEMORY[0x1E4F143A8];
        *(void *)&v16[8] = 3221225472;
        *(void *)&v16[16] = ___MapsSuggestionsBundle_block_invoke_3;
        *(void *)&v16[24] = &__block_descriptor_40_e5_v8__0l;
        *(void *)&v16[32] = "LockscreenImprover";
        if (qword_1EB6F0180 != -1) {
          dispatch_once(&qword_1EB6F0180, v16);
        }
        v10 = (void *)_MergedGlobals_31;
        v11 = @"MAPS_SUGG_TITLE_RATING";
        v12 = @"Rate<unlocalized>";
LABEL_49:
        v8 = objc_msgSend(v10, "localizedStringForKey:value:table:", v11, v12, 0, *(void *)v16, *(void *)&v16[8], *(void *)&v16[16], *(void *)&v16[24], *(void *)&v16[32]);
        v14 = MapsSuggestionsNonNilString(v8, &stru_1EFC640F8);
        [v3 setUndecoratedTitleWhenLocked:v14];

LABEL_50:
        break;
      default:
        break;
    }
    BOOL v6 = 1;
  }
  else
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v16 = 136446978;
      *(void *)&v16[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLockscreenImprover.m";
      *(_WORD *)&v16[12] = 1024;
      *(_DWORD *)&v16[14] = 21;
      *(_WORD *)&v16[18] = 2082;
      *(void *)&v16[20] = "-[MapsSuggestionsLockscreenImprover improveEntry:]";
      *(_WORD *)&v16[28] = 2082;
      *(void *)&v16[30] = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry", v16, 0x26u);
    }
LABEL_9:

    BOOL v6 = 0;
  }
LABEL_52:

  return v6;
}

@end