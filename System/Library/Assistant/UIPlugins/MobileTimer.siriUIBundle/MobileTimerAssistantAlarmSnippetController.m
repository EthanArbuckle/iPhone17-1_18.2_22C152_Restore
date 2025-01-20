@interface MobileTimerAssistantAlarmSnippetController
- (BOOL)_canShowWhileLocked;
- (BOOL)isAX;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (HKHealthStore)healthStore;
- (HKSPSleepStore)sleepStore;
- (MTAlarm)sleepAlarm;
- (MTAlarmManager)alarmManager;
- (MobileTimerAssistantAlarmSnippetController)initWithAlarmSnippet:(id)a3;
- (NSArray)alarms;
- (NSCalendar)calendar;
- (NSMutableArray)sections;
- (double)_cellHeight;
- (double)desiredHeightForWidth:(double)a3;
- (double)headerHeight;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)headerFont;
- (id)headerFontWithTrait:(int)a3;
- (id)otherAlarmsHeaderString;
- (id)sashItem;
- (id)sleepHeaderString;
- (id)sleepMetadata;
- (id)snippetAlarmsFromSourceAlarms:(id)a3 assistantAlarms:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)alarmsChanged:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadAlarmPropertiesWithAssistantAlarms:(id)a3;
- (void)loadView;
- (void)setAlarmActive:(BOOL)a3 forCell:(id)a4;
- (void)setAlarmManager:(id)a3;
- (void)setAlarms:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setSections:(id)a3;
- (void)setSleepAlarm:(id)a3;
- (void)setSleepStore:(id)a3;
- (void)setupSections;
- (void)setupSleep;
- (void)viewDidLoad;
@end

@implementation MobileTimerAssistantAlarmSnippetController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MobileTimerAssistantAlarmSnippetController)initWithAlarmSnippet:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MobileTimerAssistantAlarmSnippetController;
  v5 = [(MobileTimerAssistantAlarmSnippetController *)&v12 init];
  if (v5)
  {
    v6 = MTLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_9694((uint64_t)v5, (uint64_t)v4, v6);
    }

    v7 = [v4 alarms];
    v8 = objc_msgSend(v7, "na_map:", &stru_10460);

    uint64_t v9 = objc_opt_new();
    alarmManager = v5->_alarmManager;
    v5->_alarmManager = (MTAlarmManager *)v9;

    if (MTShouldHandleForEucalyptus()) {
      [(MobileTimerAssistantAlarmSnippetController *)v5 setupSleep];
    }
    [(MobileTimerAssistantAlarmSnippetController *)v5 loadAlarmPropertiesWithAssistantAlarms:v8];
  }
  return v5;
}

- (void)setupSleep
{
  v3 = objc_opt_new();
  [(MobileTimerAssistantAlarmSnippetController *)self setHealthStore:v3];

  id v4 = objc_alloc((Class)HKSPSleepStore);
  v5 = [(MobileTimerAssistantAlarmSnippetController *)self healthStore];
  id v6 = [v4 initWithHealthStore:v5];
  [(MobileTimerAssistantAlarmSnippetController *)self setSleepStore:v6];

  id v7 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  [(MobileTimerAssistantAlarmSnippetController *)self setCalendar:v7];

  id v9 = [(MobileTimerAssistantAlarmSnippetController *)self calendar];
  v8 = +[NSTimeZone systemTimeZone];
  [v9 setTimeZone:v8];
}

- (void)setupSections
{
  v3 = objc_opt_new();
  [(MobileTimerAssistantAlarmSnippetController *)self setSections:v3];

  id v4 = [(MobileTimerAssistantAlarmSnippetController *)self sleepAlarm];

  if (v4)
  {
    v5 = [(MobileTimerAssistantAlarmSnippetController *)self sections];
    [v5 addObject:&off_10AB8];
  }
  id v6 = [(MobileTimerAssistantAlarmSnippetController *)self alarms];
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = [(MobileTimerAssistantAlarmSnippetController *)self sections];
    [v8 addObject:&off_10AD0];
  }
}

- (void)loadView
{
  v14.receiver = self;
  v14.super_class = (Class)MobileTimerAssistantAlarmSnippetController;
  [(MobileTimerAssistantAlarmSnippetController *)&v14 loadView];
  v3 = [(MobileTimerAssistantAlarmSnippetController *)self collectionView];
  uint64_t v4 = objc_opt_class();
  v5 = +[MobileTimerAssistantAlarmSnippetCell reuseIdentifier];
  [v3 registerClass:v4 forCellWithReuseIdentifier:v5];

  id v6 = [(MobileTimerAssistantAlarmSnippetController *)self collectionView];
  [v6 registerClass:objc_opt_class() forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MTSnippetHeaderIdentifier"];

  id v7 = [(MobileTimerAssistantAlarmSnippetController *)self sleepAlarm];

  if (v7)
  {
    id v8 = [(MobileTimerAssistantAlarmSnippetController *)self collectionView];
    id v9 = [v8 collectionViewLayout];
    v10 = [(MobileTimerAssistantAlarmSnippetController *)self collectionView];
    [v10 frame];
    double v12 = v11;
    [(MobileTimerAssistantAlarmSnippetController *)self headerHeight];
    objc_msgSend(v9, "setHeaderReferenceSize:", v12, v13);
  }
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)MobileTimerAssistantAlarmSnippetController;
  [(MobileTimerAssistantAlarmSnippetController *)&v4 viewDidLoad];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"alarmsChanged:" name:MTAlarmManagerAlarmsChanged object:self->_alarmManager];
}

- (double)desiredHeightForWidth:(double)a3
{
  objc_super v4 = [(MobileTimerAssistantAlarmSnippetController *)self alarms];
  v5 = (char *)[v4 count];

  id v6 = [(MobileTimerAssistantAlarmSnippetController *)self sleepAlarm];

  if (v6)
  {
    ++v5;
    [(MobileTimerAssistantAlarmSnippetController *)self headerHeight];
    double v8 = v7 + 0.0;
    id v9 = [(MobileTimerAssistantAlarmSnippetController *)self alarms];
    id v10 = [v9 count];

    if (v10)
    {
      [(MobileTimerAssistantAlarmSnippetController *)self headerHeight];
      double v8 = v8 + v11;
    }
  }
  else
  {
    double v8 = 0.0;
  }
  [(MobileTimerAssistantAlarmSnippetController *)self _cellHeight];
  return v8 + (double)(unint64_t)v5 * v12;
}

- (id)sashItem
{
  id v2 = objc_alloc((Class)SiriUISashItem);
  id v3 = [v2 initWithApplicationBundleIdentifier:MTClockBundleID];

  return v3;
}

- (void)loadAlarmPropertiesWithAssistantAlarms:(id)a3
{
  id v4 = a3;
  v5 = dispatch_group_create();
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  double v7 = MTLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[MobileTimerAssistantAlarmSnippetController loadAlarmPropertiesWithAssistantAlarms:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%s %{public}@ fetching alarms", buf, 0x16u);
  }

  v18 = objc_opt_new();
  double v8 = [(MobileTimerAssistantAlarmSnippetController *)self alarmManager];
  id v9 = [v8 alarms];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v44 = sub_4470;
  v45 = sub_4480;
  id v46 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = sub_4470;
  v41[4] = sub_4480;
  id v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_4470;
  v39[4] = sub_4480;
  id v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = sub_4470;
  v37[4] = sub_4480;
  id v38 = 0;
  if (MTShouldHandleForEucalyptus())
  {
    id v10 = [(MobileTimerAssistantAlarmSnippetController *)self alarmManager];
    double v11 = [v10 nextSleepAlarm];

    objc_initWeak(&location, self);
    dispatch_group_enter(v5);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_4488;
    v31[3] = &unk_10488;
    objc_copyWeak(&v35, &location);
    v33 = v39;
    v34 = v37;
    v32 = v5;
    id v12 = [v11 addCompletionBlock:v31];

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  dispatch_group_enter(v5);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_45C4;
  v26[3] = &unk_104B0;
  objc_copyWeak(&v30, &location);
  v28 = buf;
  v29 = v41;
  double v13 = v5;
  v27 = v13;
  id v14 = [v9 addCompletionBlock:v26];
  v15 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_46FC;
  block[3] = &unk_10500;
  v23 = v37;
  v24 = v39;
  block[4] = self;
  id v20 = v4;
  v25 = buf;
  dispatch_semaphore_t v21 = v6;
  v22 = v41;
  v16 = v6;
  id v17 = v4;
  dispatch_group_notify(v13, v15, block);

  dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
  _Block_object_dispose(v37, 8);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(buf, 8);
}

- (id)snippetAlarmsFromSourceAlarms:(id)a3 assistantAlarms:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_49B0;
  v8[3] = &unk_10550;
  id v9 = a3;
  id v5 = v9;
  dispatch_semaphore_t v6 = objc_msgSend(a4, "na_map:", v8);

  return v6;
}

- (void)alarmsChanged:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:MTAlarmManagerAlarmsKey];

  v28 = v5;
  if ([v5 count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    dispatch_semaphore_t v6 = [(MobileTimerAssistantAlarmSnippetController *)self collectionView];
    double v7 = [v6 visibleCells];

    id v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v27 = *(void *)v32;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(v7);
          }
          double v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v12 = [v11 alarm];
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_4E10;
          v29[3] = &unk_10528;
          id v13 = v12;
          id v30 = v13;
          id v14 = objc_msgSend(v28, "na_firstObjectPassingTest:", v29);
          if (v14)
          {
            v15 = [(MobileTimerAssistantAlarmSnippetController *)self collectionView];
            v16 = [v15 indexPathForCell:v11];

            id v17 = [(MobileTimerAssistantAlarmSnippetController *)self sections];
            v18 = objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v16, "section"));
            v19 = (char *)[v18 integerValue];

            if (v19)
            {
              if (v19 == (unsigned char *)&dword_0 + 1) {
                [(MobileTimerAssistantAlarmSnippetController *)self setSleepAlarm:v14];
              }
            }
            else
            {
              id v20 = [(MobileTimerAssistantAlarmSnippetController *)self alarms];
              id v21 = [v20 mutableCopy];

              id v22 = [v21 indexOfObject:v13];
              [v21 removeObject:v13];
              [v21 insertObject:v14 atIndex:v22];
              v23 = MTAlarmStandardSort();
              v24 = [v21 sortedArrayUsingComparator:v23];
              [(MobileTimerAssistantAlarmSnippetController *)self setAlarms:v24];
            }
            v25 = [(MobileTimerAssistantAlarmSnippetController *)self collectionView];
            id v35 = v16;
            v26 = +[NSArray arrayWithObjects:&v35 count:1];
            [v25 reloadItemsAtIndexPaths:v26];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v9);
    }
  }
}

- (void)setAlarmActive:(BOOL)a3 forCell:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = [(MobileTimerAssistantAlarmSnippetController *)self collectionView];
  id v17 = [v7 indexPathForCell:v6];

  id v8 = [(MobileTimerAssistantAlarmSnippetController *)self sections];
  id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v17, "section"));
  id v10 = (char *)[v9 integerValue];

  if (v10 != (unsigned char *)&dword_0 + 1)
  {
    double v11 = [(MobileTimerAssistantAlarmSnippetController *)self alarms];
    id v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v17, "row"));

    id v13 = [v12 mutableCopy];
    [v13 setEnabled:v4];
    id v14 = [(MobileTimerAssistantAlarmSnippetController *)self alarmManager];
    id v15 = [v14 updateAlarm:v13];

    v16 = &kMTCASiriAlarmDeactivations;
    if (v4) {
      v16 = &kMTCASiriAlarmActivations;
    }
    +[MTAnalytics incrementEventCount:*v16];
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v3 = [(MobileTimerAssistantAlarmSnippetController *)self sections];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = [(MobileTimerAssistantAlarmSnippetController *)self sections];
  double v7 = [v6 objectAtIndexedSubscript:a4];
  id v8 = [v7 integerValue];

  if (v8) {
    return 1;
  }
  id v10 = [(MobileTimerAssistantAlarmSnippetController *)self alarms];
  id v11 = [v10 count];

  return (int64_t)v11;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[MobileTimerAssistantAlarmSnippetCell reuseIdentifier];
  id v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  id v10 = [(MobileTimerAssistantAlarmSnippetController *)self sections];
  id v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  id v12 = (char *)[v11 integerValue];

  if (v12)
  {
    if (v12 != (unsigned char *)&dword_0 + 1 || !MTShouldHandleForEucalyptus())
    {
      id v13 = 0;
      goto LABEL_8;
    }
    [v9 setKeylineType:0];
    id v13 = [(MobileTimerAssistantAlarmSnippetController *)self sleepAlarm];
    id v14 = [(MobileTimerAssistantAlarmSnippetController *)self sleepMetadata];
    [v9 setSleepMetaData:v14];
  }
  else
  {
    id v15 = (char *)[v6 row];
    v16 = [(MobileTimerAssistantAlarmSnippetController *)self alarms];
    BOOL v17 = v15 != (char *)[v16 count] - 1;

    [v9 setKeylineType:v17];
    id v14 = [(MobileTimerAssistantAlarmSnippetController *)self alarms];
    id v13 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  }

LABEL_8:
  [v9 setAlarm:v13];
  [v9 setDelegate:self];

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(MobileTimerAssistantAlarmSnippetController *)self collectionView];
  id v8 = [v7 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MTSnippetHeaderIdentifier" forIndexPath:v6];

  id v9 = [(MobileTimerAssistantAlarmSnippetController *)self sections];
  id v10 = [v6 section];

  id v11 = [v9 objectAtIndexedSubscript:v10];
  id v12 = (char *)[v11 integerValue];

  if (!v12)
  {
    id v14 = [(MobileTimerAssistantAlarmSnippetController *)self sleepAlarm];

    if (!v14) {
      goto LABEL_8;
    }
    uint64_t v13 = [(MobileTimerAssistantAlarmSnippetController *)self otherAlarmsHeaderString];
    goto LABEL_7;
  }
  if (v12 == (unsigned char *)&dword_0 + 1 && MTShouldHandleForEucalyptus())
  {
    uint64_t v13 = [(MobileTimerAssistantAlarmSnippetController *)self sleepHeaderString];
LABEL_7:
    id v15 = (void *)v13;
    v16 = [v8 titleLabel];
    [v16 setAttributedText:v15];
  }
LABEL_8:

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = +[NSURL mtURLForClockAppSection:](NSURL, "mtURLForClockAppSection:", 1, a4);
  id v6 = +[NAScheduler mtMainThreadScheduler];
  id v7 = [v5 reschedule:v6];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_5444;
  v9[3] = &unk_105A0;
  v9[4] = self;
  id v8 = [v7 addSuccessBlock:v9];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = [(MobileTimerAssistantAlarmSnippetController *)self delegate];
  [v6 siriViewControllerExpectedWidth:self];
  double v8 = v7;
  [(MobileTimerAssistantAlarmSnippetController *)self _cellHeight];
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (double)_cellHeight
{
  return 92.0;
}

- (id)sleepMetadata
{
  id v3 = [(MobileTimerAssistantAlarmSnippetController *)self sleepStore];
  id v4 = [(MobileTimerAssistantAlarmSnippetController *)self calendar];
  id v5 = objc_msgSend(v3, "mt_sleepMetaDataForUpcomingAlarmInCalendar:error:", v4, 0);

  return v5;
}

- (id)sleepHeaderString
{
  id v3 = +[UIColor labelColor];
  id v4 = +[UIImage mtui_imageWithSymbolName:@"bed.double.fill" scale:1 textStyle:UIFontTextStyleTitle3 andTintColor:v3];

  id v5 = objc_alloc_init((Class)NSTextAttachment);
  [v5 setImage:v4];
  id v6 = +[NSAttributedString attributedStringWithAttachment:v5];
  id v7 = [v6 mutableCopy];

  double v8 = +[NSBundle bundleWithIdentifier:@"com.apple.MobileTimerUI"];
  double v9 = [v8 localizedStringForKey:@"SLEEP_HEADER_TITLE" value:&stru_10788 table:@"MobileTimerUI_Burrito"];
  double v10 = +[NSString stringWithFormat:@" %@", v9];

  id v11 = objc_alloc((Class)NSMutableAttributedString);
  v27[0] = NSFontAttributeName;
  double v12 = [(MobileTimerAssistantAlarmSnippetController *)self headerFont];
  v28[0] = v12;
  v27[1] = NSForegroundColorAttributeName;
  uint64_t v13 = +[UIColor labelColor];
  v28[1] = v13;
  id v14 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  id v15 = [v11 initWithString:v10 attributes:v14];

  id v16 = [v10 rangeOfString:@"|"];
  if (v16 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v18 = v16;
    uint64_t v19 = v17;
    v25[0] = NSForegroundColorAttributeName;
    id v20 = +[UIColor mtui_secondaryColor];
    v25[1] = NSFontAttributeName;
    v26[0] = v20;
    id v21 = [(MobileTimerAssistantAlarmSnippetController *)self headerFontWithTrait:4];
    v26[1] = v21;
    id v22 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    objc_msgSend(v15, "setAttributes:range:", v22, v18, v19);
  }
  [v7 appendAttributedString:v15];
  id v23 = [v7 copy];

  return v23;
}

- (id)otherAlarmsHeaderString
{
  id v3 = objc_alloc((Class)NSAttributedString);
  id v4 = +[NSBundle bundleWithIdentifier:@"com.apple.MobileTimerUI"];
  id v5 = [v4 localizedStringForKey:@"REGULAR_ALARMS_SECTION_HEADER_TITLE" value:&stru_10788 table:@"MobileTimerUI_Burrito"];
  v11[0] = NSFontAttributeName;
  id v6 = [(MobileTimerAssistantAlarmSnippetController *)self headerFont];
  v12[0] = v6;
  v11[1] = NSForegroundColorAttributeName;
  id v7 = +[UIColor labelColor];
  v12[1] = v7;
  double v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v9 = [v3 initWithString:v5 attributes:v8];

  return v9;
}

- (id)headerFont
{
  return [(MobileTimerAssistantAlarmSnippetController *)self headerFontWithTrait:2];
}

- (id)headerFontWithTrait:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  id v6 = [v5 familyName];
  if ([(MobileTimerAssistantAlarmSnippetController *)self isAX]) {
    double v7 = 32.0;
  }
  else {
    [v5 pointSize];
  }
  double v8 = +[UIFont fontWithFamilyName:v6 traits:v3 size:v7];

  return v8;
}

- (double)headerHeight
{
  unsigned int v2 = [(MobileTimerAssistantAlarmSnippetController *)self isAX];
  double result = 44.0;
  if (v2) {
    return 64.0;
  }
  return result;
}

- (BOOL)isAX
{
  unsigned int v2 = +[UIApplication sharedApplication];
  uint64_t v3 = [v2 preferredContentSizeCategory];

  LOBYTE(v2) = UIContentSizeCategoryIsAccessibilityCategory(v3);
  return (char)v2;
}

- (MTAlarmManager)alarmManager
{
  return self->_alarmManager;
}

- (void)setAlarmManager:(id)a3
{
}

- (NSArray)alarms
{
  return self->_alarms;
}

- (void)setAlarms:(id)a3
{
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (HKSPSleepStore)sleepStore
{
  return self->_sleepStore;
}

- (void)setSleepStore:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (MTAlarm)sleepAlarm
{
  return self->_sleepAlarm;
}

- (void)setSleepAlarm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepAlarm, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_sleepStore, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_alarms, 0);

  objc_storeStrong((id *)&self->_alarmManager, 0);
}

@end