@interface AAUIDataclassMergeActionPicker
- (BOOL)isAnotherAccountSyncingDataclass;
- (BOOL)isDataclassSyncingUsingExchangeOnly;
- (BOOL)isPerformingBatchMerge;
- (BOOL)isTetheredSyncingEnabled;
- (BOOL)localStoreHasReadOnlyCalendars;
- (NSString)tetheredSyncingSource;
- (id)descriptionForDataclassAction:(id)a3;
- (id)message;
- (id)title;
- (void)setAnotherAccountIsSyncingDataclass:(BOOL)a3;
- (void)setDataclassIsSyncingUsingExchangeOnly:(BOOL)a3;
- (void)setLocalStoreHasReadOnlyCalendars:(BOOL)a3;
- (void)setPerformingBatchMerge:(BOOL)a3;
- (void)setTetheredSyncingEnabled:(BOOL)a3;
- (void)setTetheredSyncingSource:(id)a3;
@end

@implementation AAUIDataclassMergeActionPicker

- (id)title
{
  if (self->_isPerformingBatchMerge)
  {
    v2 = +[NSBundle bundleForClass:objc_opt_class()];
    v3 = [v2 localizedStringForKey:@"BATCH_MERGE_TITLE" value:&stru_76890 table:@"Localizable"];
    v4 = +[NSString stringWithFormat:v3, @"iCloud"];
  }
  else
  {
    v5 = [(AAUIDataclassMergeActionPicker *)self affectedDataclasses];
    v6 = [v5 lastObject];
    v2 = +[ACUILocalization localizedTitleForDataclass:v6];

    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v3 localizedStringForKey:@"MERGE_DATA_TO_SERVER_TITLE" value:&stru_76890 table:@"Localizable"];
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v2);
  }

  return v4;
}

- (id)message
{
  v3 = [(AAUIDataclassMergeActionPicker *)self affectedDataclasses];
  v4 = +[ACUILocalization localizedTextForDataclasses:v3 usedAtBeginningOfSentence:0];

  if (self->_isPerformingBatchMerge)
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"BATCH_MERGE_FORMAT"];
    v7 = [v5 localizedStringForKey:v6 value:&stru_76890 table:@"Localizable"];

    v8 = +[NSString stringWithFormat:v7, v4, @"iCloud"];
    goto LABEL_18;
  }
  v9 = [(AAUIDataclassMergeActionPicker *)self affectedDataclasses];
  v10 = [v9 lastObject];
  v7 = +[ACUILocalization localizedReferenceToLocalSourceOfDataclass:v10];

  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"MERGE_DATA_TO_SERVER" value:&stru_76890 table:@"Localizable"];
  v8 = +[NSString stringWithFormat:v12, v4, @"iCloud"];

  if (self->_isTetheredSyncingEnabled && !self->_isAnotherAccountSyncingDataclass)
  {
    if ([(NSString *)self->_tetheredSyncingSource isEqualToString:@"OSX"])
    {
      v17 = +[NSBundle bundleForClass:objc_opt_class()];
      v13 = v17;
      CFStringRef v18 = @"MERGE_TETHERED_DATA_TO_SERVER_MAC";
    }
    else
    {
      if (![(NSString *)self->_tetheredSyncingSource isEqualToString:@"Windows"]) {
        goto LABEL_16;
      }
      v17 = +[NSBundle bundleForClass:objc_opt_class()];
      v13 = v17;
      CFStringRef v18 = @"MERGE_TETHERED_DATA_TO_SERVER_PC";
    }
    v14 = [v17 localizedStringForKey:v18 value:&stru_76890 table:@"Localizable"];
    +[NSString stringWithFormat:v14, v4, @"iCloud"];
    goto LABEL_14;
  }
  if (!self->_isDataclassSyncingUsingExchangeOnly)
  {
    if (!self->_isAnotherAccountSyncingDataclass) {
      goto LABEL_16;
    }
    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"MERGE_DATA_TO_SERVER_OTHER_OTA_ENABLED" value:&stru_76890 table:@"Localizable"];
    +[NSString stringWithFormat:v14, v4, @"iCloud"];
    uint64_t v16 = LABEL_14:;
    goto LABEL_15;
  }
  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  v14 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"MERGE_DATA_TO_SERVER_EAS_PRESENT"];
  uint64_t v15 = [v13 localizedStringForKey:v14 value:&stru_76890 table:@"Localizable"];
  uint64_t v16 = +[NSString stringWithFormat:v15, v4, @"iCloud"];

  v8 = (void *)v15;
LABEL_15:

  v8 = (void *)v16;
LABEL_16:
  if (self->_localStoreHasReadOnlyCalendars)
  {
    v19 = +[NSBundle bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"READ_ONLY_CALENDARS_WILL_BE_DELETED" value:&stru_76890 table:@"Localizable"];
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v7);
    uint64_t v22 = +[NSString stringWithFormat:@"%@ %@", v8, v21];

    v8 = (void *)v22;
  }
LABEL_18:

  return v8;
}

- (id)descriptionForDataclassAction:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_isPerformingBatchMerge)
  {
    if ([v4 type] == (char *)&dword_4 + 1)
    {
      v6 = +[NSBundle bundleForClass:objc_opt_class()];
      v7 = v6;
      CFStringRef v8 = @"BATCH_MERGE_OK_BUTTON";
      goto LABEL_6;
    }
    if (![v5 type])
    {
      v6 = +[NSBundle bundleForClass:objc_opt_class()];
      v7 = v6;
      CFStringRef v8 = @"BATCH_MERGE_CANCEL_BUTTON";
LABEL_6:
      v9 = [v6 localizedStringForKey:v8 value:&stru_76890 table:@"Localizable"];

      if (v9) {
        goto LABEL_8;
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)AAUIDataclassMergeActionPicker;
  v9 = [(AAUIDataclassMergeActionPicker *)&v11 descriptionForDataclassAction:v5];
LABEL_8:

  return v9;
}

- (BOOL)isPerformingBatchMerge
{
  return self->_isPerformingBatchMerge;
}

- (void)setPerformingBatchMerge:(BOOL)a3
{
  self->_isPerformingBatchMerge = a3;
}

- (BOOL)isTetheredSyncingEnabled
{
  return self->_isTetheredSyncingEnabled;
}

- (void)setTetheredSyncingEnabled:(BOOL)a3
{
  self->_isTetheredSyncingEnabled = a3;
}

- (BOOL)isAnotherAccountSyncingDataclass
{
  return self->_isAnotherAccountSyncingDataclass;
}

- (void)setAnotherAccountIsSyncingDataclass:(BOOL)a3
{
  self->_isAnotherAccountSyncingDataclass = a3;
}

- (BOOL)isDataclassSyncingUsingExchangeOnly
{
  return self->_isDataclassSyncingUsingExchangeOnly;
}

- (void)setDataclassIsSyncingUsingExchangeOnly:(BOOL)a3
{
  self->_isDataclassSyncingUsingExchangeOnly = a3;
}

- (BOOL)localStoreHasReadOnlyCalendars
{
  return self->_localStoreHasReadOnlyCalendars;
}

- (void)setLocalStoreHasReadOnlyCalendars:(BOOL)a3
{
  self->_localStoreHasReadOnlyCalendars = a3;
}

- (NSString)tetheredSyncingSource
{
  return self->_tetheredSyncingSource;
}

- (void)setTetheredSyncingSource:(id)a3
{
  self->_tetheredSyncingSource = (NSString *)a3;
}

@end