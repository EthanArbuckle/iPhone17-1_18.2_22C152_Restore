@interface ATXSuggestedPagesStackHeuristicsDataSource
- (BOOL)_hasAlarmActivity;
- (BOOL)_hasSignificantHomeAccessoryEvents;
- (BOOL)_hasTVInterest;
- (id)_widgetsForDrivingMode;
- (id)_widgetsForExerciseMode;
- (id)_widgetsForGamingMode;
- (id)_widgetsForMindfulnessMode;
- (id)_widgetsForPersonalMode;
- (id)_widgetsForReadingMode;
- (id)_widgetsForSleepMode;
- (id)_widgetsForWorkMode;
- (id)provideWidgetsForPageType:(int64_t)a3 environment:(id)a4;
@end

@implementation ATXSuggestedPagesStackHeuristicsDataSource

- (id)provideWidgetsForPageType:(int64_t)a3 environment:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 4:
      uint64_t v7 = [(ATXSuggestedPagesStackHeuristicsDataSource *)self _widgetsForSleepMode];
      goto LABEL_11;
    case 5:
      uint64_t v7 = [(ATXSuggestedPagesStackHeuristicsDataSource *)self _widgetsForDrivingMode];
      goto LABEL_11;
    case 6:
      uint64_t v7 = [(ATXSuggestedPagesStackHeuristicsDataSource *)self _widgetsForExerciseMode];
      goto LABEL_11;
    case 7:
      uint64_t v7 = [(ATXSuggestedPagesStackHeuristicsDataSource *)self _widgetsForWorkMode];
      goto LABEL_11;
    case 8:
      uint64_t v7 = [(ATXSuggestedPagesStackHeuristicsDataSource *)self _widgetsForPersonalMode];
      goto LABEL_11;
    case 9:
      uint64_t v7 = [(ATXSuggestedPagesStackHeuristicsDataSource *)self _widgetsForReadingMode];
      goto LABEL_11;
    case 10:
      uint64_t v7 = [(ATXSuggestedPagesStackHeuristicsDataSource *)self _widgetsForGamingMode];
      goto LABEL_11;
    case 11:
      uint64_t v7 = [(ATXSuggestedPagesStackHeuristicsDataSource *)self _widgetsForMindfulnessMode];
LABEL_11:
      v8 = (void *)v7;
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (id)_widgetsForExerciseMode
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  if (([MEMORY[0x1E4F93B08] isiPad] & 1) == 0)
  {
    v3 = createHeuristicWidget(1, @"com.apple.Fitness", @"com.apple.Fitness.FitnessWidget", @"com.apple.Fitness", 0, 0.8);
    [v2 addObject:v3];

    v4 = createHeuristicWidget(0, @"com.apple.Fitness", @"com.apple.Fitness.FitnessWidget", @"com.apple.Fitness", 0, 0.8);
    [v2 addObject:v4];
  }
  v5 = createHeuristicWidget(1, @"Music.RecentlyPlayedWidget", @"com.apple.Music.MusicWidgets", @"com.apple.Music", 1, 0.3);
  v11[0] = v5;
  id v6 = createHeuristicWidget(0, @"Music.RecentlyPlayedWidget", @"com.apple.Music.MusicWidgets", @"com.apple.Music", 1, 0.3);
  v11[1] = v6;
  uint64_t v7 = createHeuristicWidget(1, @"com.apple.weather", @"com.apple.weather.widget", @"com.apple.weather", 1, 0.2);
  v11[2] = v7;
  v8 = createHeuristicWidget(0, @"com.apple.weather", @"com.apple.weather.widget", @"com.apple.weather", 1, 0.2);
  v11[3] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  [v2 addObjectsFromArray:v9];

  return v2;
}

- (id)_widgetsForReadingMode
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = createHeuristicWidget(2, @"BooksWidget", @"com.apple.iBooks.BooksWidget", @"com.apple.iBooks", 1, 0.8);
  v9[0] = v2;
  v3 = createHeuristicWidget(1, @"BooksWidget", @"com.apple.iBooks.BooksWidget", @"com.apple.iBooks", 1, 0.8);
  v9[1] = v3;
  v4 = createHeuristicWidget(0, @"BooksWidget", @"com.apple.iBooks.BooksWidget", @"com.apple.iBooks", 1, 0.8);
  v9[2] = v4;
  v5 = createHeuristicWidget(1, @"today", @"com.apple.news.widget", @"com.apple.news", 0, 0.4);
  v9[3] = v5;
  id v6 = createHeuristicWidget(0, @"today", @"com.apple.news.widget", @"com.apple.news", 0, 0.4);
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

- (id)_widgetsForWorkMode
{
  v2 = objc_opt_new();
  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    v3 = createHeuristicWidget(2, @"com.apple.CalendarWidget.CalendarUpNextWidget", @"com.apple.mobilecal.CalendarWidgetExtension", @"com.apple.mobilecal", 1, 0.8);
    [v2 addObject:v3];
  }
  v4 = createHeuristicWidget(1, @"com.apple.CalendarWidget.CalendarUpNextWidget", @"com.apple.mobilecal.CalendarWidgetExtension", @"com.apple.mobilecal", 1, 0.8);
  [v2 addObject:v4];

  v5 = createHeuristicWidget(0, @"com.apple.CalendarWidget.CalendarUpNextWidget", @"com.apple.mobilecal.CalendarWidgetExtension", @"com.apple.mobilecal", 1, 0.8);
  [v2 addObject:v5];

  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    id v6 = ATXSpecialWidgetKindFiles();
    uint64_t v7 = createHeuristicWidget(2, v6, @"Files", @"com.apple.DocumentsApp", 1, 0.3);
    [v2 addObject:v7];
  }
  v8 = ATXSpecialWidgetKindFiles();
  v9 = createHeuristicWidget(1, v8, @"Files", @"com.apple.DocumentsApp", 1, 0.3);
  [v2 addObject:v9];

  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    v10 = createHeuristicWidget(0, @"com.apple.CalendarWidget.CalendarMonthWidget", @"com.apple.mobilecal.CalendarWidgetExtension", @"com.apple.mobilecal", 0, 0.2);
    [v2 addObject:v10];

    v11 = createHeuristicWidget(0, @"com.apple.mobiletimer.datetime", @"com.apple.mobiletimer.WorldClockWidget", @"com.apple.mobiletimer", 0, 0.15);
    [v2 addObject:v11];
  }
  return v2;
}

- (id)_widgetsForPersonalMode
{
  v3 = objc_opt_new();
  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    v4 = createHeuristicWidget(2, @"today", @"com.apple.news.widget", @"com.apple.news", 0, 0.75);
    [v3 addObject:v4];
  }
  v5 = createHeuristicWidget(1, @"today", @"com.apple.news.widget", @"com.apple.news", 0, 0.75);
  [v3 addObject:v5];

  id v6 = createHeuristicWidget(0, @"today", @"com.apple.news.widget", @"com.apple.news", 0, 0.75);
  [v3 addObject:v6];

  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    uint64_t v7 = createHeuristicWidget(2, @"Music.RecentlyPlayedWidget", @"com.apple.Music.MusicWidgets", @"com.apple.Music", 1, 0.6);
    [v3 addObject:v7];
  }
  v8 = createHeuristicWidget(1, @"Music.RecentlyPlayedWidget", @"com.apple.Music.MusicWidgets", @"com.apple.Music", 1, 0.6);
  [v3 addObject:v8];

  v9 = createHeuristicWidget(0, @"Music.RecentlyPlayedWidget", @"com.apple.Music.MusicWidgets", @"com.apple.Music", 1, 0.6);
  [v3 addObject:v9];

  if ([(ATXSuggestedPagesStackHeuristicsDataSource *)self _hasTVInterest])
  {
    if ([MEMORY[0x1E4F93B08] isiPad])
    {
      v10 = createHeuristicWidget(2, @"com.apple.tv", @"com.apple.tv.TVWidgetExtension", @"com.apple.tv", 1, 0.8);
      [v3 addObject:v10];
    }
    v11 = createHeuristicWidget(1, @"com.apple.tv", @"com.apple.tv.TVWidgetExtension", @"com.apple.tv", 1, 0.8);
    [v3 addObject:v11];

    v12 = createHeuristicWidget(0, @"com.apple.tv", @"com.apple.tv.TVWidgetExtension", @"com.apple.tv", 1, 0.8);
    [v3 addObject:v12];
  }
  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    v13 = createHeuristicWidget(2, @"com.apple.weather", @"com.apple.weather.widget", @"com.apple.weather", 0, 0.4);
    [v3 addObject:v13];
  }
  v14 = createHeuristicWidget(1, @"com.apple.weather", @"com.apple.weather.widget", @"com.apple.weather", 0, 0.4);
  [v3 addObject:v14];

  v15 = createHeuristicWidget(0, @"com.apple.weather", @"com.apple.weather.widget", @"com.apple.weather", 0, 0.4);
  [v3 addObject:v15];

  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    v16 = createHeuristicWidget(2, @"com.apple.mobileslideshow.PhotosReliveWidget", @"com.apple.mobileslideshow.PhotosReliveWidget", @"com.apple.mobileslideshow", 1, 0.3);
    [v3 addObject:v16];
  }
  v17 = createHeuristicWidget(1, @"com.apple.mobileslideshow.PhotosReliveWidget", @"com.apple.mobileslideshow.PhotosReliveWidget", @"com.apple.mobileslideshow", 1, 0.3);
  [v3 addObject:v17];

  v18 = createHeuristicWidget(0, @"com.apple.mobileslideshow.PhotosReliveWidget", @"com.apple.mobileslideshow.PhotosReliveWidget", @"com.apple.mobileslideshow", 1, 0.3);
  [v3 addObject:v18];

  v19 = objc_opt_new();
  int v20 = [v19 hasiCloudFamily];

  if (v20)
  {
    v21 = __atxlog_handle_modes();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "The user has iCloud Family, considering Contacts widget", v25, 2u);
    }

    v22 = createHeuristicWidget(1, @"MultipleContactWidget_iOS", @"com.apple.PeopleViewService.PeopleWidget-iOS", @"com.apple.PeopleViewService", 0, 0.78);
    [v3 addObject:v22];

    v23 = createHeuristicWidget(0, @"SingleContactWidget_iOS", @"com.apple.PeopleViewService.PeopleWidget-iOS", @"com.apple.PeopleViewService", 0, 0.78);
    [v3 addObject:v23];
  }
  return v3;
}

- (id)_widgetsForDrivingMode
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = createHeuristicWidget(2, @"com.apple.Maps", @"com.apple.Maps.GeneralMapsWidget", @"com.apple.Maps", 1, 0.8);
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)_widgetsForGamingMode
{
  v2 = objc_opt_new();
  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    v3 = createHeuristicWidget(2, @"ContinuePlayingWidget", @"com.apple.gamecenter.widgets.extension", @"com.apple.gamecenter.widgets", 0, 0.8);
    [v2 addObject:v3];
  }
  v4 = createHeuristicWidget(1, @"ContinuePlayingWidget", @"com.apple.gamecenter.widgets.extension", @"com.apple.gamecenter.widgets", 0, 0.8);
  [v2 addObject:v4];

  v5 = createHeuristicWidget(0, @"ContinuePlayingWidget", @"com.apple.gamecenter.widgets.extension", @"com.apple.gamecenter.widgets", 0, 0.8);
  [v2 addObject:v5];

  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    id v6 = createHeuristicWidget(2, @"FriendsArePlayingWidget", @"com.apple.gamecenter.widgets.extension", @"com.apple.gamecenter.widgets", 0, 0.6);
    [v2 addObject:v6];
  }
  uint64_t v7 = createHeuristicWidget(1, @"FriendsArePlayingWidget", @"com.apple.gamecenter.widgets.extension", @"com.apple.gamecenter.widgets", 0, 0.6);
  [v2 addObject:v7];

  v8 = createHeuristicWidget(0, @"FriendsArePlayingWidget", @"com.apple.gamecenter.widgets.extension", @"com.apple.gamecenter.widgets", 0, 0.6);
  [v2 addObject:v8];

  return v2;
}

- (id)_widgetsForSleepMode
{
  v3 = objc_opt_new();
  if (([MEMORY[0x1E4F93B08] isiPad] & 1) == 0)
  {
    v4 = createHeuristicWidget(0, @"com.apple.health.SleepWidget", @"com.apple.Health.Sleep.SleepWidgetExtension", @"com.apple.Health.Sleep", 0, 0.8);
    [v3 addObject:v4];
  }
  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    v5 = createHeuristicWidget(2, @"com.apple.mobileslideshow.PhotosReliveWidget", @"com.apple.mobileslideshow.PhotosReliveWidget", @"com.apple.mobileslideshow", 1, 0.7);
    [v3 addObject:v5];
  }
  id v6 = createHeuristicWidget(1, @"com.apple.mobileslideshow.PhotosReliveWidget", @"com.apple.mobileslideshow.PhotosReliveWidget", @"com.apple.mobileslideshow", 1, 0.7);
  [v3 addObject:v6];

  uint64_t v7 = createHeuristicWidget(0, @"com.apple.mobileslideshow.PhotosReliveWidget", @"com.apple.mobileslideshow.PhotosReliveWidget", @"com.apple.mobileslideshow", 1, 0.7);
  [v3 addObject:v7];

  if ([(ATXSuggestedPagesStackHeuristicsDataSource *)self _hasAlarmActivity])
  {
    v8 = createHeuristicWidget(0, @"com.apple.mobiletimer.alarm", @"com.apple.mobiletimer.WorldClockWidget", @"com.apple.mobiletimer", 0, 0.6);
    [v3 addObject:v8];
  }
  v9 = createHeuristicWidget(0, @"BatteriesAvocadoWidget", @"com.apple.Batteries.BatteriesAvocadoWidgetExtension", @"com.apple.Batteries", 0, 0.3);
  [v3 addObject:v9];

  return v3;
}

- (id)_widgetsForMindfulnessMode
{
  v2 = objc_opt_new();
  if ([MEMORY[0x1E4F93B08] isiPad])
  {
    v3 = createHeuristicWidget(2, @"com.apple.weather", @"com.apple.weather.widget", @"com.apple.weather", 0, 0.6);
    [v2 addObject:v3];
  }
  v4 = createHeuristicWidget(1, @"com.apple.weather", @"com.apple.weather.widget", @"com.apple.weather", 0, 0.6);
  [v2 addObject:v4];

  v5 = createHeuristicWidget(0, @"com.apple.weather", @"com.apple.weather.widget", @"com.apple.weather", 0, 0.6);
  [v2 addObject:v5];

  return v2;
}

- (BOOL)_hasTVInterest
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F4B390] getUpcomingMediaForBundle:@"com.apple.tv" isInternalApplication:1];
  v3 = [v2 sortedUpcomingMedia];
  double v4 = (double)(unint64_t)[v3 count];

  v5 = [MEMORY[0x1E4F4AE38] getActionKeyForBundleId:@"com.apple.tv" actionType:@"INPlayMediaIntent"];
  id v6 = +[_ATXAppLaunchHistogramManager sharedInstance];
  uint64_t v7 = [v6 histogramForLaunchType:17];

  v12[0] = v5;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v7 totalLaunchesForBundleIds:v8];
  double v10 = v9;

  return v10 + v4 > 0.0;
}

- (BOOL)_hasSignificantHomeAccessoryEvents
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v2 = BiomeLibrary();
  v3 = [v2 HomeKit];
  double v4 = [v3 Client];
  v5 = [v4 AccessoryControl];

  id v6 = objc_opt_new();
  uint64_t v7 = objc_msgSend(v5, "atx_publisherFromStartDate:", 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__ATXSuggestedPagesStackHeuristicsDataSource__hasSignificantHomeAccessoryEvents__block_invoke_150;
  v11[3] = &unk_1E68AC690;
  v11[4] = &v12;
  id v8 = (id)[v7 sinkWithCompletion:&__block_literal_global_231 receiveInput:v11];

  unint64_t v9 = v13[3];
  LOBYTE(v9) = v9 > (int)[v6 stackHeuristicsSignificantHomeAccessoryEventCount];

  _Block_object_dispose(&v12, 8);
  return v9;
}

void __80__ATXSuggestedPagesStackHeuristicsDataSource__hasSignificantHomeAccessoryEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    double v4 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__ATXSuggestedPagesStackHeuristicsDataSource__hasSignificantHomeAccessoryEvents__block_invoke_cold_1(v2, v4);
    }
  }
}

void __80__ATXSuggestedPagesStackHeuristicsDataSource__hasSignificantHomeAccessoryEvents__block_invoke_150(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];

  if (v3) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (BOOL)_hasAlarmActivity
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v2 = BiomeLibrary();
  v3 = [v2 App];
  double v4 = [v3 Intent];

  v5 = objc_msgSend(v4, "atx_publisherFromStartDate:", 0);
  id v6 = [v5 filterWithIsIncluded:&__block_literal_global_154];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__ATXSuggestedPagesStackHeuristicsDataSource__hasAlarmActivity__block_invoke_3;
  v9[3] = &unk_1E68B5D30;
  v9[4] = &v10;
  id v7 = (id)[v6 sinkWithCompletion:&__block_literal_global_157 shouldContinue:v9];

  LOBYTE(v5) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v5;
}

uint64_t __63__ATXSuggestedPagesStackHeuristicsDataSource__hasAlarmActivity__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [v2 eventBody];
    id v6 = [v5 bundleID];
    uint64_t v7 = [v6 isEqualToString:@"com.apple.mobiletimer"];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __63__ATXSuggestedPagesStackHeuristicsDataSource__hasAlarmActivity__block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

void __80__ATXSuggestedPagesStackHeuristicsDataSource__hasSignificantHomeAccessoryEvents__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 error];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Could not fetch Home accessory events: %@", (uint8_t *)&v4, 0xCu);
}

@end