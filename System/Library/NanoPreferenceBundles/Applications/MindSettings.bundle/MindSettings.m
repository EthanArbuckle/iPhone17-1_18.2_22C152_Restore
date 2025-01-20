void sub_2654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2674(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (!WeakRetained[200])
    {
      _HKInitializeLogging();
      v3 = HKLogDeepBreathing;
      if (os_log_type_enabled(HKLogDeepBreathing, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Mind preferences did change; reloading specifiers for top level settings",
          v4,
          2u);
      }
      [v2 reloadSpecifiers];
    }
    v2[200] = 0;
  }
}

void sub_2718(uint64_t a1, void *a2)
{
  id v2 = a2;
  _HKInitializeLogging();
  v3 = HKLogDeepBreathing;
  if (os_log_type_enabled(HKLogDeepBreathing, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "[HPRFMindSettingsController] Received GuidedMeditationPreferencesChangedNotification", v4, 2u);
  }
  [v2 reloadSpecifierID:@"GUIDED_MEDITATION_PREFETCH_LABEL_ID"];
}

void sub_2840(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogDeepBreathing;
  BOOL v7 = os_log_type_enabled(HKLogDeepBreathing, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v10 = 138412290;
      v11[0] = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[HPRFMindSettingsController] Error fetching subscription status: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      int v8 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 216);
      int v10 = 67109376;
      LODWORD(v11[0]) = v8;
      WORD2(v11[0]) = 1024;
      *(_DWORD *)((char *)v11 + 6) = a2;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[HPRFMindSettingsController] Old subscriber status: %d new subscriber status: %d", (uint8_t *)&v10, 0xEu);
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (*(unsigned __int8 *)(v9 + 216) != a2)
    {
      *(unsigned char *)(v9 + 216) = a2;
      [*(id *)(a1 + 32) reloadSpecifiers];
    }
  }
}

void sub_3600(id a1, BOOL a2)
{
  if (!a2)
  {
    _HKInitializeLogging();
    id v2 = HKLogMentalHealth;
    if (os_log_type_enabled(HKLogMentalHealth, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Failed to navigate to State of Mind settings from Bridge", v3, 2u);
    }
  }
}

int64_t sub_3764(id a1, FIMindfulnessReminder *a2, FIMindfulnessReminder *a3)
{
  v4 = a2;
  id v5 = a3;
  v6 = [(FIMindfulnessReminder *)v4 customDateComponents];
  id v7 = [v6 hour];
  int v8 = [(FIMindfulnessReminder *)v5 customDateComponents];
  id v9 = [v8 hour];

  if ((uint64_t)v7 < (uint64_t)v9)
  {
LABEL_5:
    int64_t v14 = -1;
    goto LABEL_6;
  }
  int v10 = [(FIMindfulnessReminder *)v4 customDateComponents];
  id v11 = [v10 hour];
  v12 = [(FIMindfulnessReminder *)v5 customDateComponents];
  id v13 = [v12 hour];

  if ((uint64_t)v11 <= (uint64_t)v13)
  {
    v15 = [(FIMindfulnessReminder *)v4 customDateComponents];
    id v16 = [v15 minute];
    v17 = [(FIMindfulnessReminder *)v5 customDateComponents];
    id v18 = [v17 minute];

    if ((uint64_t)v16 >= (uint64_t)v18)
    {
      v20 = [(FIMindfulnessReminder *)v4 customDateComponents];
      id v21 = [v20 minute];
      v22 = [(FIMindfulnessReminder *)v5 customDateComponents];
      int64_t v14 = (uint64_t)v21 > (uint64_t)[v22 minute];

      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int64_t v14 = 1;
LABEL_6:

  return v14;
}

id sub_38BC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = +[PSSpecifier preferenceSpecifierNamed:@"MIND_REMINDER_SPECIFIER" target:v3 set:0 get:0 detail:0 cell:13 edit:0];
  [v5 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v5 setProperty:v4 forKey:@"HPRFMindSubtitleCellReminderSpecifierKey"];
  v6 = [*(id *)(a1 + 32) _subtitleForCustomReminder:v4];

  [v5 setProperty:v6 forKey:@"HPRFMindSubtitleCellSubtitleSpecifierKey"];
  [v5 setButtonAction:"_reminderTapped:"];

  return v5;
}

id sub_3F80(void *a1)
{
  v11[0] = @"NONE_ID";
  id v1 = a1;
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"MIND_HAPTIC_LEVEL_NONE" value:&stru_150C8 table:@"MindBreathingHapticLevel"];
  v12[0] = v3;
  v11[1] = @"MINIMAL_ID";
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"MIND_HAPTIC_LEVEL_MINIMAL" value:&stru_150C8 table:@"MindBreathingHapticLevel"];
  v12[1] = v5;
  void v11[2] = @"PROMINENT_ID";
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"MIND_HAPTIC_LEVEL_PROMINENT" value:&stru_150C8 table:@"MindBreathingHapticLevel"];
  v12[2] = v7;
  int v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  id v9 = [v8 objectForKey:v1];

  return v9;
}

void sub_42EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4308(uint64_t a1)
{
  _HKInitializeLogging();
  id v2 = HKLogDeepBreathing;
  if (os_log_type_enabled(HKLogDeepBreathing, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Mind preferences did change; reloading haptic level specifiers",
      v4,
      2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

id sub_4644()
{
  v2[0] = @"NONE_ID";
  v2[1] = @"MINIMAL_ID";
  v2[2] = @"PROMINENT_ID";
  v0 = +[NSArray arrayWithObjects:v2 count:3];

  return v0;
}

PSSpecifier *__cdecl sub_46D4(id a1, NSString *a2)
{
  id v2 = a2;
  uint64_t v3 = sub_3F80(v2);
  id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:0 set:0 get:0 detail:0 cell:3 edit:0];
  [v4 setIdentifier:v2];

  return (PSSpecifier *)v4;
}

id sub_4A04(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 identifier];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

id sub_4BA4(void *a1, int a2)
{
  if (a2) {
    CFStringRef v2 = @"SELECTED_";
  }
  else {
    CFStringRef v2 = &stru_150C8;
  }
  id v3 = a1;
  id v4 = +[NSString stringWithFormat:@"%@MIND_BREATHE_RATE", v2];
  id v5 = [v3 substringFromIndex:objc_msgSend(@"ID_BPM_", "length")];

  id v6 = [v5 integerValue];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  int v8 = [v7 localizedStringForKey:v4 value:&stru_150C8 table:@"MindBreathingBreathRate"];
  id v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v6);

  return v9;
}

void sub_4E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4E78(uint64_t a1)
{
  _HKInitializeLogging();
  CFStringRef v2 = HKLogDeepBreathing;
  if (os_log_type_enabled(HKLogDeepBreathing, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Mind preferences did change; reloading breath rate specifiers",
      v4,
      2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

id sub_51DC(id a1, NSString *a2)
{
  CFStringRef v2 = a2;
  id v3 = sub_4BA4(v2, 0);
  id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:0 set:0 get:0 detail:0 cell:3 edit:0];
  [v4 setIdentifier:v2];

  return v4;
}

id sub_54C8()
{
  id v0 = objc_alloc_init((Class)NSMutableArray);
  for (uint64_t i = 4; i != 11; ++i)
  {
    CFStringRef v2 = +[NSNumber numberWithInteger:i];
    [v0 addObject:v2];
  }

  return v0;
}

id sub_5548(uint64_t a1, void *a2)
{
  id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@%ld", @"ID_BPM_", [a2 integerValue]);
  id v4 = [*(id *)(a1 + 32) identifier];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

id sub_5678(id a1, NSNumber *a2)
{
  return +[NSString stringWithFormat:@"%@%ld", @"ID_BPM_", [(NSNumber *)a2 integerValue]];
}

id sub_56C0(uint64_t a1)
{
  uint64_t v3 = sub_E100();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v1[OBJC_IVAR____TtC12MindSettings34MindWeekdaySelectionViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC12MindSettings34MindWeekdaySelectionViewController_weekdaySelection] = a1;
  id v7 = self;
  int v8 = v1;
  id v9 = [v7 calendarWithIdentifier:NSCalendarIdentifierGregorian];
  if (v9)
  {
    int v10 = v9;
    id v11 = [self currentLocale];
    sub_E0F0();

    Class isa = sub_E0E0().super.isa;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    [v10 setLocale:isa];

    id v13 = [v10 firstWeekday];
    *(void *)&v8[OBJC_IVAR____TtC12MindSettings34MindWeekdaySelectionViewController_firstWeekday] = v13;
  }
  else
  {
    *(void *)&v8[OBJC_IVAR____TtC12MindSettings34MindWeekdaySelectionViewController_firstWeekday] = 1;
  }

  int64_t v14 = (objc_class *)type metadata accessor for MindWeekdaySelectionViewController();
  v16.receiver = v8;
  v16.super_class = v14;
  return objc_msgSendSuper2(&v16, "initWithStyle:", 1);
}

void sub_5930()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for MindWeekdaySelectionViewController();
  objc_msgSendSuper2(&v7, "viewDidLoad");
  id v1 = [v0 tableView];
  if (v1)
  {
    CFStringRef v2 = v1;
    [v1 setEstimatedRowHeight:100.0];

    id v3 = [v0 tableView];
    if (v3)
    {
      uint64_t v4 = v3;
      sub_6550();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      NSString v6 = sub_E340();
      [v4 registerClass:ObjCClassFromMetadata forCellReuseIdentifier:v6];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_5A68(void *a1)
{
  uint64_t v2 = v1;
  Class isa = sub_E180().super.isa;
  id v12 = [a1 cellForRowAtIndexPath:isa];

  if (v12)
  {
    id v5 = v12;
    if ([v5 accessoryType] == (char *)&dword_0 + 3) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = 3;
    }
    [v5 setAccessoryType:v6];
  }
  Class v7 = sub_E180().super.isa;
  [a1 deselectRowAtIndexPath:v7 animated:1];

  uint64_t v8 = sub_E1A0();
  if (__OFADD__(v8, FIMindfulnessDayOffsetFromSunday()))
  {
    __break(1u);
    return;
  }
  uint64_t v9 = FIMindfulnessWeekdaySelectionFromWeekday();
  uint64_t v10 = *(void *)(v2 + OBJC_IVAR____TtC12MindSettings34MindWeekdaySelectionViewController_weekdaySelection);
  if ((v9 & ~v10) != 0)
  {
    v10 |= v9;
    goto LABEL_11;
  }
  if (v9)
  {
    v10 &= ~v9;
LABEL_11:
    *(void *)(v2 + OBJC_IVAR____TtC12MindSettings34MindWeekdaySelectionViewController_weekdaySelection) = v10;
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    *(void *)(Strong + OBJC_IVAR___HPRFMindReminderViewController_weekdaySelection) = v10;
    [*(id *)(Strong + OBJC_IVAR___HPRFMindReminderViewController_tableView) reloadData];
    swift_unknownObjectRelease();
  }
}

uint64_t sub_5D0C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_E310();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  Class v7 = (char *)&v18[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  NSString v8 = sub_E340();
  Class isa = sub_E180().super.isa;
  id v10 = [a1 dequeueReusableCellWithIdentifier:v8 forIndexPath:isa];

  sub_E2E0();
  uint64_t v11 = sub_E1A0();
  uint64_t result = FIMindfulnessDayOffsetFromSunday();
  if (__OFADD__(v11, result))
  {
    __break(1u);
  }
  else
  {
    id v13 = (id)FIMindfulnessLocalizedDay();
    if (v13)
    {
      int64_t v14 = v13;
      sub_E350();
    }
    sub_E2F0();
    v18[3] = v4;
    v18[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
    v15 = sub_64EC(v18);
    (*(void (**)(uint64_t *, char *, uint64_t))(v5 + 16))(v15, v7, v4);
    sub_E3C0();
    if ((FIMindfulnessWeekdaySelectionFromWeekday() & ~*(void *)(v2
                                                                  + OBJC_IVAR____TtC12MindSettings34MindWeekdaySelectionViewController_weekdaySelection)) != 0)
      uint64_t v16 = 0;
    else {
      uint64_t v16 = 3;
    }
    [v10 setAccessoryType:v16];
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return (uint64_t)v10;
  }
  return result;
}

id sub_60C0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MindWeekdaySelectionViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MindWeekdaySelectionViewController()
{
  return self;
}

void type metadata accessor for FIMindfulnessWeekdaySelection(uint64_t a1)
{
}

void type metadata accessor for FIMindfulnessWeekday(uint64_t a1)
{
}

void sub_6150(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void *sub_6198@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_61A4(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_61AC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_61C0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_61D4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_61E8(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_6218@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_6244@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_6268(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_627C(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_6290(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_62A4@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_62B8(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_62CC(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_62E0(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_62F4()
{
  return *v0 == 0;
}

uint64_t sub_6304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_631C(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_6330@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_6340(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_634C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_6360@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_64B4(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_63A0()
{
  return sub_6408(&qword_19E68);
}

uint64_t sub_63D4()
{
  return sub_6408(&qword_19E70);
}

uint64_t sub_6408(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for FIMindfulnessWeekdaySelection(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_644C()
{
  return sub_6408(&qword_19E78);
}

uint64_t sub_6480()
{
  return sub_6408(&qword_19E80);
}

uint64_t sub_64B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t *sub_64EC(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_6550()
{
  unint64_t result = qword_19E88;
  if (!qword_19E88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_19E88);
  }
  return result;
}

uint64_t sub_6590(uint64_t a1)
{
  return a1;
}

NSString sub_65BC()
{
  NSString result = sub_E340();
  qword_1A400 = (uint64_t)result;
  return result;
}

unsigned char *sub_66EC(void *a1, void *a2)
{
  uint64_t v5 = sub_E170();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  NSString v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2[OBJC_IVAR___HPRFMindReminderViewController_reminderEnabled] = 0;
  *(void *)&v2[OBJC_IVAR___HPRFMindReminderViewController_weekdaySelection] = 0;
  id v9 = objc_allocWithZone((Class)UIDatePicker);
  id v10 = v2;
  id v11 = [v9 init];
  *(void *)&v10[OBJC_IVAR___HPRFMindReminderViewController_datePicker] = v11;
  id v12 = [objc_allocWithZone((Class)FIMindfulnessCustomReminderProvider) init];
  *(void *)&v10[OBJC_IVAR___HPRFMindReminderViewController_reminderProvider] = v12;
  *(void *)&v10[OBJC_IVAR___HPRFMindReminderViewController_state] = a2;
  id v13 = objc_allocWithZone((Class)UITableView);
  id v14 = a2;
  id v15 = objc_msgSend(v13, "initWithFrame:style:", 1, 0.0, 0.0, 0.0, 0.0);
  *(void *)&v10[OBJC_IVAR___HPRFMindReminderViewController_tableView] = v15;

  uint64_t v16 = (objc_class *)type metadata accessor for MindReminderViewController();
  v23.receiver = v10;
  v23.super_class = v16;
  v17 = objc_msgSendSuper2(&v23, "initWithNibName:bundle:", 0, 0);
  sub_7570();
  id v18 = *(void **)&v17[OBJC_IVAR___HPRFMindReminderViewController_state];
  if (v18)
  {
    unsigned __int8 v19 = [v18 enabled];
    v17[OBJC_IVAR___HPRFMindReminderViewController_reminderEnabled] = v19;
    id v20 = [v18 customWeekdaySelection];
  }
  else
  {
    v17[OBJC_IVAR___HPRFMindReminderViewController_reminderEnabled] = 1;
    sub_E150();
    Class isa = sub_E120().super.isa;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    id v20 = (id)FIMindfulnessWeekdayDaySelectionForCalendar();
  }
  *(void *)&v17[OBJC_IVAR___HPRFMindReminderViewController_weekdaySelection] = v20;

  return v17;
}

void sub_69C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = (objc_class *)type metadata accessor for MindReminderViewController();
  v89.receiver = v0;
  v89.super_class = v2;
  objc_msgSendSuper2(&v89, "viewDidLoad");
  id v3 = [v0 view];
  if (!v3)
  {
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v4 = v3;
  id v5 = [self systemBackgroundColor];
  [v4 setBackgroundColor:v5];

  id v6 = [v1 navigationItem];
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  NSString v8 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v86._countAndFlagsBits = 0xE000000000000000;
  v90._countAndFlagsBits = 0x5245444E494D4552;
  v90._object = (void *)0xEF4C45434E41435FLL;
  v91.value._countAndFlagsBits = 0x74746553646E694DLL;
  v91.value._object = (void *)0xEC00000073676E69;
  v9.super.Class isa = v8;
  v92._countAndFlagsBits = 0;
  v92._object = (void *)0xE000000000000000;
  sub_E040(v90, v91, v9, v92, v86);

  v88 = v2;
  v87[0] = v1;
  id v10 = v1;
  NSString v11 = sub_E340();
  swift_bridgeObjectRelease();
  if (v2)
  {
    id v12 = sub_C270(v87, (uint64_t)v88);
    uint64_t v13 = *((void *)v2 - 1);
    __chkstk_darwin(v12);
    id v15 = (char *)v87 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    uint64_t v16 = sub_E4E0();
    (*(void (**)(char *, objc_class *))(v13 + 8))(v15, v2);
    sub_C2B4((uint64_t)v87);
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = objc_allocWithZone((Class)UIBarButtonItem);
  id v18 = objc_msgSend(v17, "initWithTitle:style:target:action:", v11, 0, v16, "cancelTapped", v87[0]);

  swift_unknownObjectRelease();
  [v6 setLeftBarButtonItem:v18];

  id v19 = [v10 navigationItem];
  sub_87D4();
  v88 = v2;
  v87[0] = v10;
  id v20 = (char *)v10;
  NSString v21 = sub_E340();
  swift_bridgeObjectRelease();
  uint64_t v22 = (uint64_t)v88;
  if (v88)
  {
    objc_super v23 = sub_C270(v87, (uint64_t)v88);
    uint64_t v24 = *(void *)(v22 - 8);
    __chkstk_darwin(v23);
    v26 = (char *)v87 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v24 + 16))(v26);
    uint64_t v27 = sub_E4E0();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v22);
    sub_C2B4((uint64_t)v87);
  }
  else
  {
    uint64_t v27 = 0;
  }
  id v28 = [objc_allocWithZone((Class)UIBarButtonItem) initWithTitle:v21 style:0 target:v27 action:"rightBarButtonTapped"];

  swift_unknownObjectRelease();
  [v19 setRightBarButtonItem:v28];

  v29 = *(void **)&v20[OBJC_IVAR___HPRFMindReminderViewController_datePicker];
  [v29 setDatePickerMode:0];
  [v29 setPreferredDatePickerStyle:1];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v30 = [v20 view];
  if (!v30) {
    goto LABEL_20;
  }
  v31 = v30;
  [v30 addSubview:v29];

  v32 = *(void **)&v20[OBJC_IVAR___HPRFMindReminderViewController_tableView];
  [v32 setDelegate:v20];
  [v32 setDataSource:v20];
  [v32 setEstimatedRowHeight:100.0];
  [v32 setRowHeight:UITableViewAutomaticDimension];
  [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v33 = [v20 view];
  if (!v33)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v34 = v33;
  [v33 addSubview:v32];

  sub_C148(&qword_19FD8);
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_FDE0;
  id v36 = [v29 topAnchor];
  id v37 = [v20 view];
  if (!v37)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v38 = v37;
  id v39 = [v37 safeAreaLayoutGuide];

  id v40 = [v39 topAnchor];
  id v41 = [v36 constraintEqualToAnchor:v40];

  *(void *)(v35 + 32) = v41;
  id v42 = [v29 leadingAnchor];
  id v43 = [v20 view];
  if (!v43)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v44 = v43;
  id v45 = [v43 leadingAnchor];

  id v46 = [v42 constraintEqualToAnchor:v45];
  *(void *)(v35 + 40) = v46;
  id v47 = [v29 trailingAnchor];
  id v48 = [v20 view];
  if (!v48)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v49 = v48;
  id v50 = [v48 trailingAnchor];

  id v51 = [v47 constraintEqualToAnchor:v50];
  *(void *)(v35 + 48) = v51;
  id v52 = [v29 widthAnchor];
  id v53 = [v20 view];
  if (!v53)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v54 = v53;
  id v55 = [v53 widthAnchor];

  id v56 = [v52 constraintEqualToAnchor:v55];
  *(void *)(v35 + 56) = v56;
  id v57 = [v32 topAnchor];
  id v58 = [v29 bottomAnchor];
  id v59 = [v57 constraintEqualToAnchor:v58];

  *(void *)(v35 + 64) = v59;
  id v60 = [v32 leadingAnchor];
  id v61 = [v20 view];
  if (!v61)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v62 = v61;
  id v63 = [v61 leadingAnchor];

  id v64 = [v60 constraintEqualToAnchor:v63];
  *(void *)(v35 + 72) = v64;
  id v65 = [v32 trailingAnchor];
  id v66 = [v20 view];
  if (!v66)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v67 = v66;
  id v68 = [v66 trailingAnchor];

  id v69 = [v65 constraintEqualToAnchor:v68];
  *(void *)(v35 + 80) = v69;
  id v70 = [v32 widthAnchor];
  id v71 = [v20 view];
  if (!v71)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v72 = v71;
  id v73 = [v71 widthAnchor];

  id v74 = [v70 constraintEqualToAnchor:v73];
  *(void *)(v35 + 88) = v74;
  id v75 = [v32 bottomAnchor];
  id v76 = [v20 view];
  if (v76)
  {
    v77 = v76;
    v78 = self;
    id v79 = [v77 bottomAnchor];

    id v80 = [v75 constraintEqualToAnchor:v79];
    *(void *)(v35 + 96) = v80;
    v87[0] = v35;
    sub_E370();
    sub_C234(0, (unint64_t *)&unk_1A000);
    Class isa = sub_E360().super.isa;
    swift_bridgeObjectRelease();
    [v78 activateConstraints:isa];

    sub_C234(0, (unint64_t *)&qword_19E88);
    uint64_t v82 = swift_getObjCClassFromMetadata();
    NSString v83 = sub_E340();
    [v32 registerClass:v82 forCellReuseIdentifier:v83];

    NSString v84 = sub_E340();
    [v32 registerClass:v82 forCellReuseIdentifier:v84];

    NSString v85 = sub_E340();
    [v32 registerClass:v82 forCellReuseIdentifier:v85];

    return;
  }
LABEL_29:
  __break(1u);
}

uint64_t sub_7570()
{
  uint64_t v1 = sub_E170();
  uint64_t v2 = *(void *)(v1 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_C148(&qword_19FC8);
  ((void (*)(void))__chkstk_darwin)();
  id v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_C148(&qword_19FF8);
  ((void (*)(void))__chkstk_darwin)();
  id v40 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_E0C0();
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  ((void (*)(void))__chkstk_darwin)();
  id v39 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_C148(&qword_19FC0);
  ((void (*)(void))__chkstk_darwin)();
  NSString v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_E030();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v14);
  id v19 = (char *)&v36 - v18;
  id v20 = *(void **)(v0 + OBJC_IVAR___HPRFMindReminderViewController_state);
  if (v20)
  {
    uint64_t v38 = v2;
    id v43 = v20;
    id v21 = [v43 customDateComponents];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v37 = v1;
      sub_E020();

      objc_super v23 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
      v23(v11, v16, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
      {
        v23(v19, v11, v12);
        uint64_t v24 = *(void **)(v0 + OBJC_IVAR___HPRFMindReminderViewController_datePicker);
        id v25 = [v24 calendar];
        if (v25)
        {
          v26 = v25;
          sub_E130();

          uint64_t v27 = v37;
          uint64_t v28 = v38;
          (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v6, v4, v37);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v6, 0, 1, v27);
          uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48))(v6, 1, v27);
          if (result != 1)
          {
            v29 = v40;
            sub_E140();
            (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v27);
            uint64_t v31 = v41;
            uint64_t v30 = v42;
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v29, 1, v42) != 1)
            {
              v34 = v39;
              (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v39, v29, v30);
              Class isa = sub_E090().super.isa;
              [v24 setDate:isa animated:0];

              (*(void (**)(char *, uint64_t))(v31 + 8))(v34, v30);
              return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v19, v12);
            }
            (*(void (**)(char *, uint64_t))(v13 + 8))(v19, v12);

            v32 = &qword_19FF8;
            uint64_t v33 = (uint64_t)v29;
            return sub_C1D8(v33, v32);
          }
        }
        else
        {
          uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v38 + 56))(v6, 1, 1, v37);
        }
        __break(1u);
        return result;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    }

    v32 = &qword_19FC0;
    uint64_t v33 = (uint64_t)v11;
    return sub_C1D8(v33, v32);
  }
  return result;
}

void sub_7B0C()
{
  uint64_t v1 = sub_C148(&qword_19FC0);
  __chkstk_darwin(v1 - 8);
  id v58 = (char *)v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_E0C0();
  uint64_t v55 = *(void *)(v3 - 8);
  uint64_t v56 = v3;
  __chkstk_darwin(v3);
  v54 = (char *)v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_E170();
  uint64_t v5 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v7 = (char *)v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_C148(&qword_19FC8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_E030();
  uint64_t v60 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v59 = (char *)v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void **)&v0[OBJC_IVAR___HPRFMindReminderViewController_reminderProvider];
  id v14 = [v13 reminders];
  uint64_t v15 = sub_C234(0, &qword_19FA8);
  unint64_t v57 = sub_C0E0();
  uint64_t v16 = (void *)sub_E390();

  id v17 = *(void **)&v0[OBJC_IVAR___HPRFMindReminderViewController_state];
  if (v17)
  {
    id v18 = v17;
    id v53 = (void *)sub_BB08((uint64_t)v16, v18);
  }
  else
  {
    id v53 = v16;
  }
  id v19 = *(void **)&v0[OBJC_IVAR___HPRFMindReminderViewController_datePicker];
  id v20 = [v19 calendar];
  uint64_t v21 = v61;
  if (!v20)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, 1, 1, v61);
    goto LABEL_14;
  }
  uint64_t v22 = v20;
  v49[1] = v15;
  id v50 = v13;
  uint64_t v51 = v11;
  id v52 = v0;
  sub_E130();

  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v7, v21);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v21);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v21) == 1)
  {
LABEL_14:
    __break(1u);
    return;
  }
  sub_C148(&qword_19FD0);
  uint64_t v23 = sub_E160();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(void *)(v24 + 72);
  unint64_t v26 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_FDF0;
  unint64_t v28 = v27 + v26;
  v29 = *(void (**)(unint64_t, void, uint64_t))(v24 + 104);
  v29(v28, enum case for Calendar.Component.hour(_:), v23);
  v29(v28 + v25, enum case for Calendar.Component.minute(_:), v23);
  sub_BD28(v27);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  id v30 = [v19 date];
  uint64_t v31 = v54;
  sub_E0A0();

  v32 = v59;
  sub_E110();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v31, v56);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v61);
  uint64_t v33 = v60;
  v34 = v58;
  uint64_t v35 = v51;
  (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v58, v32, v51);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v34, 0, 1, v35);
  uint64_t v36 = v52;
  uint64_t v37 = *(void *)&v52[OBJC_IVAR___HPRFMindReminderViewController_weekdaySelection];
  uint64_t v38 = v52[OBJC_IVAR___HPRFMindReminderViewController_reminderEnabled];
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v34, 1, v35) != 1)
  {
    Class isa = sub_E010().super.isa;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v35);
  }
  id v40 = [objc_allocWithZone((Class)FIMindfulnessReminder) initWithType:1 customDateComponents:isa customWeekdaySelection:v37 enabled:v38];

  sub_C148(&qword_19FD8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_FE00;
  *(void *)(inited + 32) = v40;
  unint64_t v62 = inited;
  sub_E370();
  unint64_t v42 = v62;
  id v43 = v40;
  unint64_t v44 = sub_BEB0(v42);
  swift_bridgeObjectRelease();
  sub_82AC(v44, v53);
  Class v45 = sub_E380().super.isa;
  swift_bridgeObjectRelease();
  [v50 updateReminders:v45];

  id v46 = [self defaultCenter];
  if (qword_19E10 != -1) {
    swift_once();
  }
  [v46 postNotificationName:qword_1A400 object:0];

  id v47 = [v36 presentingViewController];
  if (v47)
  {
    id v48 = v47;
    [v47 dismissViewControllerAnimated:1 completion:0];

    (*(void (**)(char *, uint64_t))(v33 + 8))(v32, v35);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v33 + 8))(v32, v35);
  }
}

void sub_82AC(unint64_t a1, void *a2)
{
  unint64_t v2 = a1;
  v18[1] = a2;
  if ((a1 & 0xC000000000000001) != 0)
  {
    sub_E420();
    sub_C234(0, &qword_19FA8);
    sub_C0E0();
    sub_E3B0();
    unint64_t v2 = (unint64_t)v18[2];
    id v17 = v18[3];
    uint64_t v3 = (uint64_t)v18[4];
    id v4 = v18[5];
    unint64_t v5 = (unint64_t)v18[6];
  }
  else
  {
    id v4 = 0;
    uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
    id v17 = (void *)(a1 + 56);
    uint64_t v3 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v5 = v8 & *(void *)(a1 + 56);
  }
  int64_t v9 = (unint64_t)(v3 + 64) >> 6;
  if ((v2 & 0x8000000000000000) != 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | ((void)v4 << 6);
      uint64_t v12 = (char *)v4;
      goto LABEL_29;
    }
    uint64_t v14 = (uint64_t)v4 + 1;
    if (__OFADD__(v4, 1)) {
      break;
    }
    if (v14 >= v9) {
      goto LABEL_32;
    }
    unint64_t v15 = v17[v14];
    uint64_t v12 = (char *)v4 + 1;
    if (!v15)
    {
      uint64_t v12 = (char *)v4 + 2;
      if ((uint64_t)v4 + 2 >= v9) {
        goto LABEL_32;
      }
      unint64_t v15 = v17[(void)v12];
      if (!v15)
      {
        uint64_t v12 = (char *)v4 + 3;
        if ((uint64_t)v4 + 3 >= v9) {
          goto LABEL_32;
        }
        unint64_t v15 = v17[(void)v12];
        if (!v15)
        {
          uint64_t v12 = (char *)v4 + 4;
          if ((uint64_t)v4 + 4 >= v9) {
            goto LABEL_32;
          }
          unint64_t v15 = v17[(void)v12];
          if (!v15)
          {
            uint64_t v12 = (char *)v4 + 5;
            if ((uint64_t)v4 + 5 >= v9) {
              goto LABEL_32;
            }
            unint64_t v15 = v17[(void)v12];
            if (!v15)
            {
              uint64_t v16 = (char *)v4 + 6;
              while ((char *)v9 != v16)
              {
                unint64_t v15 = v17[(void)v16++];
                if (v15)
                {
                  uint64_t v12 = v16 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_C18C();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v10 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + ((void)v12 << 6);
LABEL_29:
    id v13 = *(id *)(*(void *)(v2 + 48) + 8 * v11);
    if (!v13) {
      goto LABEL_32;
    }
    while (1)
    {
      sub_A184(v18, v13);

      id v4 = v12;
      unint64_t v5 = v10;
      if ((v2 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (sub_E450())
      {
        sub_C234(0, &qword_19FA8);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v13 = v18[0];
        swift_unknownObjectRelease();
        uint64_t v12 = (char *)v4;
        uint64_t v10 = v5;
        if (v13) {
          continue;
        }
      }
      goto LABEL_32;
    }
  }
  __break(1u);
}

void sub_8604()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR___HPRFMindReminderViewController_reminderProvider];
  id v2 = [v1 reminders];
  sub_C234(0, &qword_19FA8);
  sub_C0E0();
  uint64_t v3 = sub_E390();

  id v4 = *(void **)&v0[OBJC_IVAR___HPRFMindReminderViewController_state];
  if (v4)
  {
    id v5 = v4;
    sub_BB08(v3, v5);
  }
  Class isa = sub_E380().super.isa;
  swift_bridgeObjectRelease();
  [v1 updateReminders:isa];

  id v7 = [self defaultCenter];
  if (qword_19E10 != -1) {
    swift_once();
  }
  [v7 postNotificationName:qword_1A400 object:0];

  id v8 = [v0 presentingViewController];
  if (v8)
  {
    id v9 = v8;
    [v8 dismissViewControllerAnimated:1 completion:0];
  }
}

uint64_t sub_87D4()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___HPRFMindReminderViewController_state);
  type metadata accessor for MindReminderViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v3 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  if (v1) {
    v4._object = (void *)0xED0000454E4F445FLL;
  }
  else {
    v4._object = (void *)0xEC0000004444415FLL;
  }
  v8._countAndFlagsBits = 0xE000000000000000;
  v4._countAndFlagsBits = 0x5245444E494D4552;
  v9.value._countAndFlagsBits = 0x74746553646E694DLL;
  v9.value._object = (void *)0xEC00000073676E69;
  v5.super.Class isa = v3;
  v10._countAndFlagsBits = 0;
  v10._object = (void *)0xE000000000000000;
  uint64_t v6 = sub_E040(v4, v9, v5, v10, v8);

  return v6;
}

id sub_88F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MindReminderViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MindReminderViewController()
{
  return self;
}

void sub_89B8(void *a1)
{
  objc_super v2 = v1;
  uint64_t v4 = sub_E1B0();
  if (v4 == 1)
  {
    sub_8604();
  }
  else if (!v4 && !sub_E1A0())
  {
    uint64_t v5 = *(void *)&v1[OBJC_IVAR___HPRFMindReminderViewController_weekdaySelection];
    id v6 = objc_allocWithZone((Class)type metadata accessor for MindWeekdaySelectionViewController());
    id v7 = (char *)sub_56C0(v5);
    *(void *)&v7[OBJC_IVAR____TtC12MindSettings34MindWeekdaySelectionViewController_delegate + 8] = &off_14DE8;
    swift_unknownObjectWeakAssign();
    id v8 = [v2 navigationController];
    if (v8)
    {
      Swift::String_optional v9 = v8;
      [v8 pushViewController:v7 animated:1];
    }
    Class isa = sub_E180().super.isa;
    [a1 deselectRowAtIndexPath:isa animated:1];
  }
}

uint64_t sub_8C48()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_E170();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v35[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_E310();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  Swift::String v10 = (char *)&v35[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v35[-1] - v11;
  uint64_t v13 = sub_E1A0();
  if (v13 == 1)
  {
    uint64_t v14 = *(void **)(v0 + OBJC_IVAR___HPRFMindReminderViewController_tableView);
    NSString v15 = sub_E340();
    Class isa = sub_E180().super.isa;
    id v17 = [v14 dequeueReusableCellWithIdentifier:v15 forIndexPath:isa];

    sub_E2E0();
    type metadata accessor for MindReminderViewController();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v19 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
    v33._countAndFlagsBits = 0xE000000000000000;
    v38._object = (void *)0x8000000000010700;
    v38._countAndFlagsBits = 0xD000000000000010;
    v40.value._countAndFlagsBits = 0x74746553646E694DLL;
    v40.value._object = (void *)0xEC00000073676E69;
    v20.super.Class isa = v19;
    v42._countAndFlagsBits = 0;
    v42._object = (void *)0xE000000000000000;
    sub_E040(v38, v40, v20, v42, v33);

    sub_E2F0();
    uint64_t v36 = v6;
    uint64_t v37 = &protocol witness table for UIListContentConfiguration;
    uint64_t v21 = sub_64EC(v35);
    (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 16))(v21, v10, v6);
    sub_E3C0();
    [v17 setSelectionStyle:0];
    id v22 = [objc_allocWithZone((Class)UISwitch) init];
    [v22 setOn:*(unsigned __int8 *)(v1 + OBJC_IVAR___HPRFMindReminderViewController_reminderEnabled) animated:0];
    [v22 addTarget:v1 action:"enableSwitchTappedWithEnableSwitch:" forControlEvents:4096];
    [v17 setAccessoryView:v22];

    uint64_t v12 = v10;
LABEL_7:
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    return (uint64_t)v17;
  }
  uint64_t v34 = v6;
  if (!v13)
  {
    uint64_t v23 = *(void **)(v0 + OBJC_IVAR___HPRFMindReminderViewController_tableView);
    NSString v24 = sub_E340();
    Class v25 = sub_E180().super.isa;
    id v17 = [v23 dequeueReusableCellWithIdentifier:v24 forIndexPath:v25];

    sub_E300();
    type metadata accessor for MindReminderViewController();
    uint64_t v26 = swift_getObjCClassFromMetadata();
    uint64_t v27 = (objc_class *)[self bundleForClass:v26];
    v33._countAndFlagsBits = 0xE000000000000000;
    v39._countAndFlagsBits = 0x5245444E494D4552;
    v39._object = (void *)0xEF5441455045525FLL;
    v41.value._countAndFlagsBits = 0x74746553646E694DLL;
    v41.value._object = (void *)0xEC00000073676E69;
    v28.super.Class isa = v27;
    v43._countAndFlagsBits = 0;
    v43._object = (void *)0xE000000000000000;
    sub_E040(v39, v41, v28, v43, v33);

    sub_E2F0();
    sub_E150();
    Class v29 = sub_E120().super.isa;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    id v30 = (id)FIUIMindfulnessLocalizedWeekdaySelection();

    if (v30)
    {
      sub_E350();
    }
    uint64_t v6 = v34;
    sub_E290();
    uint64_t v36 = v6;
    uint64_t v37 = &protocol witness table for UIListContentConfiguration;
    uint64_t v31 = sub_64EC(v35);
    (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 16))(v31, v12, v6);
    sub_E3C0();
    [v17 setAccessoryType:1];
    goto LABEL_7;
  }
  v35[0] = 0;
  v35[1] = 0xE000000000000000;
  sub_E4A0(26);
  swift_bridgeObjectRelease();
  uint64_t result = sub_E4C0();
  __break(1u);
  return result;
}

id sub_9214()
{
  uint64_t v1 = sub_E2A0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v23[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_E310();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v23[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void **)(v0 + OBJC_IVAR___HPRFMindReminderViewController_tableView);
  NSString v10 = sub_E340();
  Class isa = sub_E180().super.isa;
  id v22 = [v9 dequeueReusableCellWithIdentifier:v10 forIndexPath:isa];

  sub_E2E0();
  type metadata accessor for MindReminderViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v13 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v21._countAndFlagsBits = 0xE000000000000000;
  v24._countAndFlagsBits = 0x5245444E494D4552;
  v24._object = (void *)0xEF45564F4D45525FLL;
  v25.value._countAndFlagsBits = 0x74746553646E694DLL;
  v25.value._object = (void *)0xEC00000073676E69;
  v14.super.Class isa = v13;
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  sub_E040(v24, v25, v14, v26, v21);

  sub_E2F0();
  id v15 = [self systemRedColor];
  uint64_t v16 = (void (*)(uint64_t *, void))sub_E2D0();
  sub_E2B0();
  v16(v23, 0);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for UIListContentConfiguration.TextProperties.TextAlignment.center(_:), v1);
  id v17 = (void (*)(uint64_t *, void))sub_E2D0();
  sub_E2C0();
  v17(v23, 0);
  v23[3] = v5;
  v23[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
  id v18 = sub_64EC(v23);
  (*(void (**)(uint64_t *, char *, uint64_t))(v6 + 16))(v18, v8, v5);
  id v19 = v22;
  sub_E3C0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v19;
}

void **initializeBufferWithCopyOfBuffer for MindReminderViewController.State(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void destroy for MindReminderViewController.State(id *a1)
{
}

void **assignWithCopy for MindReminderViewController.State(void **a1, void **a2)
{
  uint64_t v3 = *a2;
  id v4 = *a1;
  *a1 = *a2;
  id v5 = v3;

  return a1;
}

void *initializeWithTake for MindReminderViewController.State(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void **assignWithTake for MindReminderViewController.State(void **a1, void **a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for MindReminderViewController.State(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MindReminderViewController.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = 0;
    *(_DWORD *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

uint64_t sub_97CC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_97E8(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *uint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for MindReminderViewController.State()
{
  return &type metadata for MindReminderViewController.State;
}

uint64_t sub_9818()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_C148(&qword_19FB8);
  uint64_t v3 = sub_E470();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    NSBundle v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_E3E0(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_9AB8()
{
  uint64_t v1 = v0;
  uint64_t v42 = sub_E160();
  uint64_t v2 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  Swift::String_optional v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_C148(&qword_19FF0);
  uint64_t v5 = sub_E470();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    unint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_C194(&qword_19FE0);
      uint64_t result = sub_E320();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v6;
  return result;
}

unint64_t sub_9EA0(uint64_t a1, void *a2)
{
  sub_E3E0(a2[5]);
  unint64_t result = sub_E410();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

uint64_t sub_9F24(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_C148(&qword_19FB8);
  uint64_t result = sub_E490();
  uint64_t v9 = (void *)result;
  unint64_t v29 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v29[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v29[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v29[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    Swift::Int v18 = v9[5];
    id v19 = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t result = sub_E3E0(v18);
    uint64_t v20 = -1 << *((unsigned char *)v9 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v12 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v12 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v12 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v12 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(void *)(v9[6] + 8 * v23) = v19;
    ++v9[2];
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v29[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v29[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_A184(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_E440();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_C234(0, &qword_19FA8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_E430();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_A720(v7, result + 1);
    unint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_9818();
      unint64_t v23 = v28;
    }
    else
    {
      unint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_9EA0((uint64_t)v8, v23);
    uint64_t *v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_E3E0(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_C234(0, &qword_19FA8);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_E3F0();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = sub_E3F0();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    id v8 = a2;
    sub_A918((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_A424(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_E160();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_C194(&qword_19FE0);
  swift_bridgeObjectRetain();
  uint64_t v34 = a2;
  uint64_t v11 = sub_E320();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v33 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v29 = v2;
    uint64_t v30 = a1;
    uint64_t v31 = ~v12;
    uint64_t v28 = v7;
    char v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    unint64_t v14 = v16;
    uint64_t v32 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v27[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v32 * v13;
      unint64_t v20 = *(void *)(v10 + 48) + v32 * v13;
      id v21 = v14;
      v14(v9, v20, v6);
      sub_C194(&qword_19FE8);
      char v22 = sub_E330();
      unint64_t v23 = *v17;
      (*v17)(v9, v6);
      if (v22) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v31;
      unint64_t v14 = v21;
      uint64_t v10 = v18;
      if (((*(void *)(v33 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v29;
        a1 = v30;
        uint64_t v7 = v28;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v23(v34, v6);
    v21(v30, *(void *)(*v29 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v25 = v34;
    v14(v9, v34, v6);
    uint64_t v35 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    sub_AAA0((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v35;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v25, v6);
    return 1;
  }
}

Swift::Int sub_A720(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_C148(&qword_19FB8);
    uint64_t v2 = sub_E480();
    uint64_t v14 = v2;
    sub_E420();
    if (sub_E450())
    {
      sub_C234(0, &qword_19FA8);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_9818();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_E3E0(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_E450());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

void sub_A918(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_9818();
  }
  else
  {
    if (v7 > v6)
    {
      sub_AD18();
      goto LABEL_14;
    }
    sub_B168();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_E3E0(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_C234(0, &qword_19FA8);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_E3F0();

    if (v12)
    {
LABEL_13:
      sub_E500();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_E3F0();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

uint64_t sub_AAA0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = sub_E160();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  Swift::Int v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  uint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_9AB8();
  }
  else
  {
    if (v11 > v10)
    {
      sub_AEC4();
      goto LABEL_12;
    }
    sub_B3E4();
  }
  uint64_t v12 = *v3;
  sub_C194(&qword_19FE0);
  uint64_t v13 = sub_E320();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_C194(&qword_19FE8);
      char v21 = sub_E330();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_E500();
  __break(1u);
  return result;
}

id sub_AD18()
{
  uint64_t v1 = v0;
  sub_C148(&qword_19FB8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_E460();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_AEC4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_E160();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_C148(&qword_19FF0);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_E460();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    id result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  id result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    id result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    id result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    id result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_B168()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_C148(&qword_19FB8);
  uint64_t v3 = sub_E470();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_E3E0(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_B3E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_E160();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_C148(&qword_19FF0);
  uint64_t v7 = sub_E470();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_C194(&qword_19FE0);
    uint64_t result = sub_E320();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_B780(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = 0;
  int64_t v4 = 0;
  uint64_t v5 = a3 + 56;
  uint64_t v6 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a3 + 56);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v11 = v10 | (v4 << 6);
      goto LABEL_5;
    }
    int64_t v15 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v15 >= v9) {
      goto LABEL_24;
    }
    unint64_t v16 = *(void *)(v5 + 8 * v15);
    ++v4;
    if (!v16)
    {
      int64_t v4 = v15 + 1;
      if (v15 + 1 >= v9) {
        goto LABEL_24;
      }
      unint64_t v16 = *(void *)(v5 + 8 * v4);
      if (!v16)
      {
        int64_t v4 = v15 + 2;
        if (v15 + 2 >= v9) {
          goto LABEL_24;
        }
        unint64_t v16 = *(void *)(v5 + 8 * v4);
        if (!v16) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v11 = __clz(__rbit64(v16)) + (v4 << 6);
LABEL_5:
    unint64_t v12 = *(void **)(*(void *)(a3 + 48) + 8 * v11);
    sub_C234(0, &qword_19FA8);
    id v13 = v12;
    char v14 = sub_E3F0();

    if ((v14 & 1) == 0)
    {
      *(unint64_t *)((char *)a1 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      if (__OFADD__(v21++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        sub_9F24(a1, a2, v21, a3);
        return;
      }
    }
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v9) {
    goto LABEL_24;
  }
  unint64_t v16 = *(void *)(v5 + 8 * v17);
  if (v16)
  {
    int64_t v4 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v4 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v4 >= v9) {
      goto LABEL_24;
    }
    unint64_t v16 = *(void *)(v5 + 8 * v4);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
}

uint64_t sub_B954(uint64_t a1, void *a2)
{
  char v4 = *(unsigned char *)(a1 + 32);
  unsigned int v5 = v4 & 0x3F;
  unint64_t v6 = (unint64_t)((1 << v4) + 63) >> 6;
  uint64_t isStackAllocationSafe = a2;
  unint64_t v8 = (void *)isStackAllocationSafe;
  if (v5 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    int64_t v9 = (char *)&v17 - ((8 * v6 + 15) & 0x3FFFFFFFFFFFFFF0);
    bzero(v9, 8 * v6);
    id v10 = v8;
    sub_B780((unint64_t *)v9, v6, a1);
    uint64_t v12 = v11;
    swift_release();

    if (v2) {
      swift_willThrow();
    }
  }
  else
  {
    id v13 = (void *)swift_slowAlloc();
    bzero(v13, 8 * v6);
    id v14 = v8;
    sub_B780((unint64_t *)v13, v6, a1);
    uint64_t v12 = v15;
    swift_release();

    swift_slowDealloc();
  }
  return v12;
}

Swift::Int sub_BB08(uint64_t a1, void *a2)
{
  if ((a1 & 0xC000000000000001) == 0) {
    return sub_B954(a1, a2);
  }
  id v2 = a2;
  sub_E420();
  if (sub_E450())
  {
    sub_C234(0, &qword_19FA8);
    do
    {
      swift_dynamicCast();
      if (sub_E3F0())
      {
      }
      else
      {
        if (*((void *)&_swiftEmptySetSingleton + 3) <= *((void *)&_swiftEmptySetSingleton + 2)) {
          sub_9818();
        }
        Swift::Int result = sub_E3E0(*((void *)&_swiftEmptySetSingleton + 5));
        char v4 = (char *)&_swiftEmptySetSingleton + 56;
        uint64_t v5 = -1 << *((unsigned char *)&_swiftEmptySetSingleton + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*((void *)&_swiftEmptySetSingleton + (v6 >> 6) + 7)) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*((void *)&_swiftEmptySetSingleton + (v6 >> 6) + 7))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)&v4[8 * v7];
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)&v4[(v8 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v8;
        *(void *)(*((void *)&_swiftEmptySetSingleton + 6) + 8 * v8) = v13;
        ++*((void *)&_swiftEmptySetSingleton + 2);
      }
    }
    while (sub_E450());
  }

  swift_release();
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t sub_BD28(uint64_t a1)
{
  uint64_t v2 = sub_E160();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_C194(&qword_19FE0);
  uint64_t result = sub_E3A0();
  uint64_t v17 = result;
  if (v9)
  {
    id v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v12 = v13;
    uint64_t v14 = a1 + ((*(unsigned __int8 *)(v11 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 64));
    uint64_t v15 = *(void *)(v11 + 56);
    do
    {
      v12(v6, v14, v2);
      sub_A424((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v11 - 8))(v8, v2);
      v14 += v15;
      --v9;
    }
    while (v9);
    return v17;
  }
  return result;
}

uint64_t sub_BEB0(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_E4D0();
    swift_bridgeObjectRelease();
  }
  sub_C234(0, &qword_19FA8);
  sub_C0E0();
  uint64_t result = sub_E3A0();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_E4D0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        unint64_t v6 = (void *)sub_E4B0();
        sub_A184(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        unint64_t v8 = *v7++;
        sub_A184(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

id sub_C004()
{
  uint64_t v0 = sub_E1B0();
  if (v0 == 1)
  {
    return sub_9214();
  }
  else if (v0)
  {
    sub_E4A0(30);
    swift_bridgeObjectRelease();
    id result = (id)sub_E4C0();
    __break(1u);
  }
  else
  {
    return (id)sub_8C48();
  }
  return result;
}

unint64_t sub_C0E0()
{
  unint64_t result = qword_19FB0;
  if (!qword_19FB0)
  {
    sub_C234(255, &qword_19FA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_19FB0);
  }
  return result;
}

uint64_t sub_C148(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_C18C()
{
  return swift_release();
}

uint64_t sub_C194(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_E160();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_C1D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_C148(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_C234(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void *sub_C270(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_C2B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

id sub_C5C0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MindfulnessRouting();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MindfulnessRouting()
{
  return self;
}

uint64_t sub_C6F0(uint64_t a1, uint64_t a2)
{
  uint64_t v41 = sub_C148(&qword_1A138);
  uint64_t v5 = *(void *)(v41 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __chkstk_darwin(v41);
  unint64_t v8 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v40 - v9;
  uint64_t v45 = sub_C148(&qword_1A140);
  uint64_t v43 = *(void *)(v45 - 8);
  uint64_t v42 = *(void *)(v43 + 64);
  uint64_t v11 = __chkstk_darwin(v45);
  unint64_t v44 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  int64_t v40 = (char *)&v40 - v14;
  __chkstk_darwin(v13);
  id v46 = (char *)&v40 - v15;
  uint64_t v16 = sub_E230();
  uint64_t v48 = *(void *)(v16 - 8);
  uint64_t v49 = v16;
  __chkstk_darwin(v16);
  id v47 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E220();
  sub_C270((void *)(v2 + OBJC_IVAR___HPRFSeymourSubscriptionProvider_subscriptionClient), *(void *)(v2 + OBJC_IVAR___HPRFSeymourSubscriptionProvider_subscriptionClient + 24));
  sub_E260();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a1;
  *(void *)(v18 + 24) = a2;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_D0AC;
  *(void *)(v19 + 24) = v18;
  uint64_t v20 = v41;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v41);
  unint64_t v21 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v22 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v22 + v21, v8, v20);
  uint64_t v23 = (uint64_t (**)(uint64_t))(v22 + ((v6 + v21 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v23 = sub_D228;
  v23[1] = (uint64_t (*)(uint64_t))v19;
  swift_retain();
  uint64_t v24 = v40;
  sub_E240();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v20);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = a1;
  *(void *)(v25 + 24) = a2;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = sub_D75C;
  *(void *)(v26 + 24) = v25;
  uint64_t v27 = v43;
  unint64_t v28 = v44;
  uint64_t v29 = v45;
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v44, v24, v45);
  uint64_t v30 = v27;
  unint64_t v31 = (*(unsigned __int8 *)(v27 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  unint64_t v32 = (v42 + v31 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v33 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v30 + 32))(v33 + v31, v28, v29);
  uint64_t v34 = (uint64_t (**)(uint64_t))(v33 + v32);
  uint64_t *v34 = sub_D778;
  v34[1] = (uint64_t (*)(uint64_t))v26;
  swift_retain();
  uint64_t v35 = v46;
  sub_E240();
  int64_t v36 = *(void (**)(char *, uint64_t))(v30 + 8);
  v36(v24, v29);
  uint64_t v37 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_E250();
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = 0;
  *(void *)(v38 + 24) = 0;
  v37(sub_DBE0, v38);
  swift_release();
  swift_release();
  v36(v35, v29);
  return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v47, v49);
}

uint64_t sub_CC44(uint64_t a1, uint64_t (*a2)(void, void))
{
  uint64_t v3 = sub_E0C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_E0B0();
  char v7 = sub_E200();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return a2(v7 & 1, 0);
}

uint64_t sub_CD48(uint64_t a1, uint64_t (*a2)(void, uint64_t))
{
  sub_C148(&qword_1A148);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_FE90;
  uint64_t v5 = sub_E050();
  *(void *)(v4 + 56) = sub_C234(0, &qword_1A150);
  *(void *)(v4 + 64) = sub_DC5C();
  *(void *)(v4 + 32) = v5;
  sub_E0D0();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  uint64_t v6 = sub_E520();
  uint64_t v8 = v7;
  sub_DCC4();
  if (v6 == sub_E520() && v8 == v9)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v10 = sub_E4F0();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v10 & 1) == 0) {
      return result;
    }
  }
  swift_getErrorValue();
  uint64_t v12 = sub_E510();
  uint64_t result = sub_E510();
  if (v12 == result) {
    return a2(0, a1);
  }
  return result;
}

void sub_CF9C(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_E050();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

id sub_D00C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SeymourSubscriptionProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SeymourSubscriptionProvider()
{
  return self;
}

uint64_t sub_D074()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_D0AC(uint64_t a1)
{
  return sub_CC44(a1, *(uint64_t (**)(void, void))(v1 + 16));
}

uint64_t sub_D0C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_E210();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  swift_retain();
  return sub_E240();
}

uint64_t sub_D228(uint64_t a1)
{
  return sub_D0C8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_D230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = a1;
  swift_retain();
  swift_errorRetain();

  return sub_E240();
}

uint64_t sub_D2D4(void (*a1)(uint64_t *), uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t), uint64_t a4, uint64_t a5)
{
  a3(&v8, a5);
  uint64_t v6 = v8;
  char v9 = 0;
  a1(&v8);

  return sub_DC04(v6, 0);
}

uint64_t sub_D368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_C148(&qword_1A140);
  char v9 = (void (*)(uint64_t (*)(uint64_t), void *))sub_E250();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a1;
  v10[3] = a2;
  v10[4] = a4;
  v10[5] = a5;
  swift_retain();
  swift_retain();
  v9(sub_DBE8, v10);
  swift_release();

  return swift_release();
}

uint64_t sub_D434(uint64_t a1, char a2, uint64_t (*a3)(uint64_t *), uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v10 = sub_C148(&qword_1A140);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain();
    a5(a1);
    uint64_t v15 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_E250();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = a3;
    *(void *)(v16 + 24) = a4;
    swift_retain();
    v15(sub_DBE0, v16);
    swift_release();
    swift_release();
    sub_DC04(a1, 1);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    uint64_t v17 = a1;
    char v18 = 0;
    return a3(&v17);
  }
}

uint64_t sub_D5D0(void (*a1)(uint64_t *), uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t), uint64_t a4, uint64_t a5)
{
  a3(&v8, a5);
  uint64_t v6 = v8;
  char v9 = 0;
  a1(&v8);

  return sub_DC04(v6, 0);
}

uint64_t sub_D664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_C148(&qword_1A138);
  char v9 = (void (*)(uint64_t (*)(uint64_t), void *))sub_E250();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a4;
  v10[3] = a5;
  v10[4] = a1;
  v10[5] = a2;
  swift_retain();
  swift_retain();
  v9(sub_DD5C, v10);
  swift_release();

  return swift_release();
}

uint64_t sub_D730()
{
  return sub_D78C(&qword_1A138);
}

uint64_t sub_D73C(uint64_t a1, uint64_t a2)
{
  return sub_D850(a1, a2, &qword_1A138, sub_D664);
}

uint64_t sub_D75C(uint64_t a1)
{
  return sub_CD48(a1, *(uint64_t (**)(void, uint64_t))(v1 + 16));
}

uint64_t sub_D778(uint64_t a1)
{
  return sub_D230(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_D780()
{
  return sub_D78C(&qword_1A140);
}

uint64_t sub_D78C(uint64_t *a1)
{
  uint64_t v2 = sub_C148(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v4 | 7;
  unint64_t v7 = ((*(void *)(v3 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  swift_release();

  return _swift_deallocObject(v1, v7, v6);
}

uint64_t sub_D830(uint64_t a1, uint64_t a2)
{
  return sub_D850(a1, a2, &qword_1A140, sub_D368);
}

uint64_t sub_D850(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *(void *)(sub_C148(a3) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = v4 + v8;
  uint64_t v10 = (uint64_t *)(v4 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];

  return a4(a1, a2, v9, v11, v12);
}

uint64_t sub_D914(uint64_t a1, void (*a2)(char *), uint64_t a3, void (*a4)(uint64_t *), uint64_t a5)
{
  uint64_t v22 = a4;
  uint64_t v23 = a5;
  v21[1] = a3;
  uint64_t v7 = sub_C148(&qword_1A140);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_E210();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_C148(&qword_1A168);
  __chkstk_darwin(v15);
  uint64_t v17 = (void *)((char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_DD68(a1, (uint64_t)v17);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = *v17;
    char v25 = 1;
    swift_errorRetain();
    v22(&v24);
    swift_errorRelease();
    return swift_errorRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v12 + 32))(v14, v17, v11);
    a2(v14);
    uint64_t v19 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_E250();
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v22;
    *(void *)(v20 + 24) = v23;
    swift_retain();
    v19(sub_DBE0, v20);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_DBE8(uint64_t a1)
{
  return sub_D434(*(void *)a1, *(unsigned char *)(a1 + 8), *(uint64_t (**)(uint64_t *))(v1 + 16), *(void *)(v1 + 24), *(void (**)(uint64_t))(v1 + 32));
}

uint64_t sub_DC04(uint64_t a1, char a2)
{
  if (a2) {
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_DC10()
{
  swift_release();
  swift_errorRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_DC50(void (*a1)(uint64_t *), uint64_t a2)
{
  return sub_D2D4(a1, a2, *(void (**)(uint64_t *__return_ptr, uint64_t))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

unint64_t sub_DC5C()
{
  unint64_t result = qword_1A158;
  if (!qword_1A158)
  {
    sub_C234(255, &qword_1A150);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1A158);
  }
  return result;
}

unint64_t sub_DCC4()
{
  unint64_t result = qword_1A160;
  if (!qword_1A160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1A160);
  }
  return result;
}

uint64_t sub_DD1C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_DD5C(uint64_t a1)
{
  return sub_D914(a1, *(void (**)(char *))(v1 + 16), *(void *)(v1 + 24), *(void (**)(uint64_t *))(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_DD68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_C148(&qword_1A168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_DDD4()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_DE14(uint64_t result)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  char v3 = *(unsigned char *)(result + 8);
  uint64_t v4 = *(void *)result;
  char v5 = v3;
  if (v2) {
    return v2(&v4);
  }
  return result;
}

uint64_t sub_DE5C()
{
  uint64_t v1 = sub_E210();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_DF28(void (*a1)(uint64_t *), uint64_t a2)
{
  void (*v6)(uint64_t *__return_ptr, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t vars8;

  uint64_t v5 = *(void *)(sub_E210() - 8);
  uint64_t v6 = *(void (**)(uint64_t *__return_ptr, uint64_t))(v2 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  uint64_t v8 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_D5D0(a1, a2, v6, v7, v8);
}

uint64_t sub_DFAC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_DFE4(char a1, uint64_t a2)
{
  sub_CF9C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_DFEC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

NSDateComponents sub_E010()
{
  return DateComponents._bridgeToObjectiveC()();
}

uint64_t sub_E020()
{
  return static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E030()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_E040(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_E050()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_E060()
{
  return static URL.stateOfMind(route:presentWithAnimation:configuration:)();
}

void sub_E070(NSURL *retstr@<X8>)
{
}

uint64_t sub_E080()
{
  return type metadata accessor for URL();
}

NSDate sub_E090()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_E0A0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E0B0()
{
  return Date.init()();
}

uint64_t sub_E0C0()
{
  return type metadata accessor for Date();
}

uint64_t sub_E0D0()
{
  return NSLog(_:_:)();
}

NSLocale sub_E0E0()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_E0F0()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E100()
{
  return type metadata accessor for Locale();
}

uint64_t sub_E110()
{
  return Calendar.dateComponents(_:from:)();
}

NSCalendar sub_E120()
{
  return Calendar._bridgeToObjectiveC()();
}

uint64_t sub_E130()
{
  return static Calendar._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E140()
{
  return Calendar.date(from:)();
}

uint64_t sub_E150()
{
  return static Calendar.current.getter();
}

uint64_t sub_E160()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_E170()
{
  return type metadata accessor for Calendar();
}

NSIndexPath sub_E180()
{
  return IndexPath._bridgeToObjectiveC()();
}

uint64_t sub_E190()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E1A0()
{
  return IndexPath.row.getter();
}

uint64_t sub_E1B0()
{
  return IndexPath.section.getter();
}

uint64_t sub_E1C0()
{
  return type metadata accessor for IndexPath();
}

uint64_t sub_E1D0()
{
  return static Dependencies.standard(queue:)();
}

uint64_t sub_E1E0()
{
  return dispatch thunk of Dependencies.resolve<A>(failureHandler:)();
}

uint64_t sub_E1F0()
{
  return type metadata accessor for Dependencies();
}

uint64_t sub_E200()
{
  return ServiceSubscription.isSubscribed(date:)();
}

uint64_t sub_E210()
{
  return type metadata accessor for ServiceSubscription();
}

uint64_t sub_E220()
{
  return ServiceSubscriptionRequest.init(authenticationBehavior:cacheBehavior:)();
}

uint64_t sub_E230()
{
  return type metadata accessor for ServiceSubscriptionRequest();
}

uint64_t sub_E240()
{
  return Promise.init(asyncOperation:)();
}

uint64_t sub_E250()
{
  return Promise.operation.getter();
}

uint64_t sub_E260()
{
  return dispatch thunk of ServiceSubscriptionClientProtocol.fetchServiceSubscription(with:)();
}

uint64_t sub_E270()
{
  return type metadata accessor for StateOfMindEntryModel.Configuration();
}

uint64_t sub_E280()
{
  return type metadata accessor for Route();
}

uint64_t sub_E290()
{
  return UIListContentConfiguration.secondaryText.setter();
}

uint64_t sub_E2A0()
{
  return type metadata accessor for UIListContentConfiguration.TextProperties.TextAlignment();
}

uint64_t sub_E2B0()
{
  return UIListContentConfiguration.TextProperties.color.setter();
}

uint64_t sub_E2C0()
{
  return UIListContentConfiguration.TextProperties.alignment.setter();
}

uint64_t sub_E2D0()
{
  return UIListContentConfiguration.textProperties.modify();
}

uint64_t sub_E2E0()
{
  return static UIListContentConfiguration.cell()();
}

uint64_t sub_E2F0()
{
  return UIListContentConfiguration.text.setter();
}

uint64_t sub_E300()
{
  return static UIListContentConfiguration.valueCell()();
}

uint64_t sub_E310()
{
  return type metadata accessor for UIListContentConfiguration();
}

uint64_t sub_E320()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_E330()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_E340()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_E350()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

NSArray sub_E360()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_E370()
{
  return specialized Array._endMutation()();
}

NSSet sub_E380()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_E390()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_E3A0()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_E3B0()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_E3C0()
{
  return UITableViewCell.contentConfiguration.setter();
}

uint64_t sub_E3D0()
{
  return static OS_dispatch_queue.main.getter();
}

Swift::Int sub_E3E0(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_E3F0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_E410()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_E420()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_E430()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_E440()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_E450()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_E460()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_E470()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_E480()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_E490()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_E4A0(Swift::Int a1)
{
}

uint64_t sub_E4B0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_E4C0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_E4D0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_E4E0()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_E4F0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_E500()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_E510()
{
  return Error.code.getter();
}

uint64_t sub_E520()
{
  return Error.domain.getter();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t FIMindfulnessDayOffsetFromSunday()
{
  return _FIMindfulnessDayOffsetFromSunday();
}

uint64_t FIMindfulnessLocalizedDay()
{
  return _FIMindfulnessLocalizedDay();
}

uint64_t FIMindfulnessWeekdayDaySelectionForCalendar()
{
  return _FIMindfulnessWeekdayDaySelectionForCalendar();
}

uint64_t FIMindfulnessWeekdaySelectionFromWeekday()
{
  return _FIMindfulnessWeekdaySelectionFromWeekday();
}

uint64_t FIUIIsGuidedMeditationPrefetchEnabled()
{
  return _FIUIIsGuidedMeditationPrefetchEnabled();
}

uint64_t FIUIMindfulnessLocalizedWeekdaySelection()
{
  return _FIUIMindfulnessLocalizedWeekdaySelection();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_HPRFMindfulnessRoutingStateOfMindOptionsRoute(void *a1, const char *a2, ...)
{
  return _[a1 HPRFMindfulnessRoutingStateOfMindOptionsRoute];
}

id objc_msgSend__customReminderSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _customReminderSpecifiers];
}

id objc_msgSend__subtitleForCustomReminder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_subtitleForCustomReminder:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSectionIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSectionIdentifiers:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return _[a1 bundle];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_customDateComponents(void *a1, const char *a2, ...)
{
  return _[a1 customDateComponents];
}

id objc_msgSend_customWeekdaySelection(void *a1, const char *a2, ...)
{
  return _[a1 customWeekdaySelection];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingComponents_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingComponents:toDate:options:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return _[a1 enabled];
}

id objc_msgSend_fetchSubscriptionStatusWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchSubscriptionStatusWithCompletion:");
}

id objc_msgSend_groupSpecifierWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:");
}

id objc_msgSend_hk_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hk_firstObjectPassingTest:");
}

id objc_msgSend_hk_map_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hk_map:");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return _[a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_indexForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexForIndexPath:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithReminderProvider_currentReminder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReminderProvider:currentReminder:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMutedForTodaySectionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMutedForTodaySectionIdentifier:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_loadSpecifiersFromPlist_inBundle_target_stringsTable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadSpecifiersFromPlist:inBundle:target:stringsTable:");
}

id objc_msgSend_localizedPaneTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedPaneTitle];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return _[a1 minute];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openURL_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:withCompletionHandler:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_reloadSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:");
}

id objc_msgSend_reloadSpecifierID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifierID:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_reminders(void *a1, const char *a2, ...)
{
  return _[a1 reminders];
}

id objc_msgSend_remindersDidChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 remindersDidChangeNotification];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeSectionIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSectionIdentifiers:");
}

id objc_msgSend_removeSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSpecifier:animated:");
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityIdentifier:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedNotificationMuteSettingsManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedNotificationMuteSettingsManager];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return _[a1 specifier];
}

id objc_msgSend_specifierAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndexPath:");
}

id objc_msgSend_specifierForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForID:");
}

id objc_msgSend_startOfDayForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startOfDayForDate:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_synchronizeUserDefaultsDomain_keys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeUserDefaultsDomain:keys:");
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayColor];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_updateReminders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateReminders:");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}