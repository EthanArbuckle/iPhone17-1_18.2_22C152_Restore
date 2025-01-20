@interface BCSLocalizedStringProvider
+ (id)sharedInstance;
- (id)willOpenAtDifferentDayPluralWithFormattedTime:(id)a3 formattedDay:(id)a4;
- (id)willOpenAtDifferentDaySingularWithFormattedTime:(id)a3 formattedDay:(id)a4;
- (id)willOpenAtSameDayPluralWithFormattedTime:(id)a3;
- (id)willOpenAtSameDaySingularWithFormattedTime:(id)a3;
@end

@implementation BCSLocalizedStringProvider

+ (id)sharedInstance
{
  if (qword_26ACEFCF0 != -1) {
    dispatch_once(&qword_26ACEFCF0, &__block_literal_global_8);
  }
  v2 = (void *)_MergedGlobals_39;

  return v2;
}

uint64_t __44__BCSLocalizedStringProvider_sharedInstance__block_invoke()
{
  _MergedGlobals_39 = objc_alloc_init(BCSLocalizedStringProvider);

  return MEMORY[0x270F9A758]();
}

- (id)willOpenAtSameDaySingularWithFormattedTime:(id)a3
{
  v3 = NSString;
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"WILL_OPEN_AT_SAME_DAY_SINGULAR" value:&stru_26C611188 table:0];
  v8 = objc_msgSend(v3, "stringWithFormat:", v7, v5);

  return v8;
}

- (id)willOpenAtSameDayPluralWithFormattedTime:(id)a3
{
  v3 = NSString;
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"WILL_OPEN_AT_SAME_DAY_PLURAL" value:&stru_26C611188 table:0];
  v8 = objc_msgSend(v3, "stringWithFormat:", v7, v5);

  return v8;
}

- (id)willOpenAtDifferentDaySingularWithFormattedTime:(id)a3 formattedDay:(id)a4
{
  id v5 = NSString;
  v6 = (void *)MEMORY[0x263F086E0];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"WILL_OPEN_AT_DIFFERENT_DAY_SINGULAR" value:&stru_26C611188 table:0];
  v11 = objc_msgSend(v5, "stringWithFormat:", v10, v7, v8);

  return v11;
}

- (id)willOpenAtDifferentDayPluralWithFormattedTime:(id)a3 formattedDay:(id)a4
{
  id v5 = NSString;
  v6 = (void *)MEMORY[0x263F086E0];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"WILL_OPEN_AT_DIFFERENT_DAY_PLURAL" value:&stru_26C611188 table:0];
  v11 = objc_msgSend(v5, "stringWithFormat:", v10, v7, v8);

  return v11;
}

@end