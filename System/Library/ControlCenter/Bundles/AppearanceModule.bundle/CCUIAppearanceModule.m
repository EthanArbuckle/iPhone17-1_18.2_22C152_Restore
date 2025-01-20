@interface CCUIAppearanceModule
- (BOOL)_uses24HourTime;
- (BOOL)isSelected;
- (CCUIAppearanceModule)init;
- (id)_subtitleForUserInterfaceStyle:(int64_t)a3 nextTransition:(id)a4;
- (id)_timeFormatter;
- (id)_timeStringForHour:(unint64_t)a3 minute:(unint64_t)a4;
- (id)glyphPackageDescription;
- (id)glyphState;
- (unint64_t)_formattedHourForHour:(unint64_t)a3;
- (void)_observeArbiterStyleChangeNotifications;
- (void)_styleModeDidChange;
- (void)_toggleStyleMode;
- (void)_unobserveArbiterStyleChangeNotifications;
- (void)_updateState;
- (void)dealloc;
- (void)setSelected:(BOOL)a3;
@end

@implementation CCUIAppearanceModule

- (CCUIAppearanceModule)init
{
  v7.receiver = self;
  v7.super_class = (Class)CCUIAppearanceModule;
  v2 = [(CCUIAppearanceModule *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend__observeArbiterStyleChangeNotifications(v2, v3, v4);
  }
  return v5;
}

- (void)dealloc
{
  objc_msgSend__unobserveArbiterStyleChangeNotifications(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)CCUIAppearanceModule;
  [(CCUIAppearanceModule *)&v4 dealloc];
}

- (id)glyphPackageDescription
{
  uint64_t v2 = (void *)MEMORY[0x263F33C68];
  v3 = (void *)MEMORY[0x263F086E0];
  uint64_t v4 = objc_opt_class();
  v6 = objc_msgSend_bundleForClass_(v3, v5, v4);
  v8 = objc_msgSend_descriptionForPackageNamed_inBundle_(v2, v7, @"StyleMode", v6);

  return v8;
}

- (id)glyphState
{
  if (objc_msgSend_appearsSelected(self, a2, v2)) {
    v3 = @"light";
  }
  else {
    v3 = @"dark";
  }

  return v3;
}

- (BOOL)isSelected
{
  v3 = objc_msgSend_sharedInstance(MEMORY[0x263F1CB50], a2, v2);
  uint64_t v6 = objc_msgSend_currentStyle(v3, v4, v5);

  return v6 == 2;
}

- (void)setSelected:(BOOL)a3
{
  if (objc_msgSend_isSelected(self, a2, a3) != a3)
  {
    MEMORY[0x270F9A6D0](self, sel__toggleStyleMode, v4);
  }
}

- (void)_observeArbiterStyleChangeNotifications
{
  objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObserver_selector_name_object_(v5, v4, (uint64_t)self, sel__styleModeDidChange, *MEMORY[0x263F1D7C0], 0);
}

- (void)_unobserveArbiterStyleChangeNotifications
{
  objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v5, v4, (uint64_t)self);
}

- (void)_updateState
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_240626E1C;
  block[3] = &unk_2650C8F78;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)_styleModeDidChange
{
  objc_msgSend__updateState(self, a2, v2);
  uint64_t v6 = objc_msgSend_sharedInstance(MEMORY[0x263F1CB50], v4, v5);
  uint64_t v9 = objc_msgSend_currentStyle(v6, v7, v8);

  v12 = objc_msgSend_sharedInstance(MEMORY[0x263F1CB50], v10, v11);
  objc_msgSend_nextTransition(v12, v13, v14);
  id v26 = (id)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend__subtitleForUserInterfaceStyle_nextTransition_(self, v15, v9, v26);
  if (objc_msgSend_isSelected(self, v17, v18)) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = 2;
  }
  v22 = objc_msgSend_contentModuleContext(self, v19, v20);
  v24 = objc_msgSend_statusUpdateWithMessage_type_(MEMORY[0x263F33CD8], v23, (uint64_t)v16, v21);
  objc_msgSend_enqueueStatusUpdate_(v22, v25, (uint64_t)v24);
}

- (void)_toggleStyleMode
{
  uint64_t v4 = objc_msgSend_sharedInstance(MEMORY[0x263F1CB50], a2, v2);
  objc_msgSend_toggleCurrentStyle(v4, v5, v6);

  objc_msgSend__updateState(self, v7, v8);
}

- (id)_subtitleForUserInterfaceStyle:(int64_t)a3 nextTransition:(id)a4
{
  id v6 = a4;
  uint64_t v9 = v6;
  if (v6 && (unint64_t v10 = objc_msgSend_type(v6, v7, v8), v10 <= 2)) {
    uint64_t v11 = off_2650C8F98[v10];
  }
  else {
    uint64_t v11 = @"_MANUAL";
  }
  if (a3 == 2) {
    objc_msgSend_stringByAppendingString_(@"CONTROL_CENTER_STATUS_STYLE_MODE", v7, @"_DARK");
  }
  else {
  v12 = objc_msgSend_stringByAppendingString_(@"CONTROL_CENTER_STATUS_STYLE_MODE", v7, @"_LIGHT");
  }
  uint64_t v14 = objc_msgSend_stringByAppendingString_(v12, v13, (uint64_t)v11);

  v15 = (void *)MEMORY[0x263F086E0];
  uint64_t v16 = objc_opt_class();
  uint64_t v18 = objc_msgSend_bundleForClass_(v15, v17, v16);
  uint64_t v20 = objc_msgSend_localizedStringForKey_value_table_(v18, v19, (uint64_t)v14, &stru_26F4C02B8, 0);

  if (objc_msgSend_type(v9, v21, v22))
  {
    id v25 = v20;
  }
  else
  {
    id v26 = NSString;
    uint64_t v27 = objc_msgSend_hour(v9, v23, v24);
    uint64_t v29 = objc_msgSend__formattedHourForHour_(self, v28, v27);
    uint64_t v32 = objc_msgSend_hour(v9, v30, v31);
    uint64_t v35 = objc_msgSend_minute(v9, v33, v34);
    v37 = objc_msgSend__timeStringForHour_minute_(self, v36, v32, v35);
    objc_msgSend_stringWithFormat_(v26, v38, (uint64_t)v20, v29, v37);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

- (id)_timeStringForHour:(unint64_t)a3 minute:(unint64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x263EFF918]);
  objc_msgSend_setHour_(v7, v8, a3);
  objc_msgSend_setMinute_(v7, v9, a4);
  v12 = objc_msgSend_currentCalendar(MEMORY[0x263EFF8F0], v10, v11);
  objc_msgSend_setCalendar_(v7, v13, (uint64_t)v12);

  v15 = objc_msgSend_timeZoneForSecondsFromGMT_(MEMORY[0x263EFFA18], v14, 0);
  objc_msgSend_setTimeZone_(v7, v16, (uint64_t)v15);

  v19 = objc_msgSend__timeFormatter(self, v17, v18);
  uint64_t v22 = objc_msgSend_date(v7, v20, v21);
  uint64_t v24 = objc_msgSend_stringFromDate_(v19, v23, (uint64_t)v22);

  return v24;
}

- (unint64_t)_formattedHourForHour:(unint64_t)a3
{
  int v4 = objc_msgSend__uses24HourTime(self, a2, a3);
  if (a3 < 0xD) {
    int v5 = 1;
  }
  else {
    int v5 = v4;
  }
  if (v5) {
    return a3;
  }
  else {
    return a3 - 12;
  }
}

- (BOOL)_uses24HourTime
{
  v3 = objc_msgSend__timeFormatter(self, a2, v2);
  id v6 = objc_msgSend_dateFormat(v3, v4, v5);

  BOOL v9 = objc_msgSend_rangeOfString_(v6, v7, @"H") != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend_rangeOfString_(v6, v8, @"k") != 0x7FFFFFFFFFFFFFFFLL;

  return v9;
}

- (id)_timeFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  objc_msgSend_setDateStyle_(v2, v3, 0);
  objc_msgSend_setTimeStyle_(v2, v4, 1);
  id v7 = objc_msgSend_currentLocale(MEMORY[0x263EFF960], v5, v6);
  objc_msgSend_setLocale_(v2, v8, (uint64_t)v7);

  unint64_t v10 = objc_msgSend_timeZoneForSecondsFromGMT_(MEMORY[0x263EFFA18], v9, 0);
  objc_msgSend_setTimeZone_(v2, v11, (uint64_t)v10);

  uint64_t v14 = objc_msgSend_currentCalendar(MEMORY[0x263EFF8F0], v12, v13);
  objc_msgSend_setCalendar_(v2, v15, (uint64_t)v14);

  return v2;
}

@end