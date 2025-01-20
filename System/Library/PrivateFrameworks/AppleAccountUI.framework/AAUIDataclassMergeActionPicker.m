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
    v2 = NSString;
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [v3 localizedStringForKey:@"BATCH_MERGE_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
    v5 = objc_msgSend(v2, "stringWithFormat:", v4, @"iCloud");
  }
  else
  {
    v6 = (void *)MEMORY[0x263F23150];
    v7 = [(ACUIDataclassActionPicker *)self affectedDataclasses];
    v8 = [v7 lastObject];
    v3 = [v6 localizedTitleForDataclass:v8];

    v9 = NSString;
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v10 = [v4 localizedStringForKey:@"MERGE_DATA_TO_SERVER_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
    v5 = objc_msgSend(v9, "stringWithFormat:", v10, v3);
  }
  return v5;
}

- (id)message
{
  v3 = (void *)MEMORY[0x263F23150];
  v4 = [(ACUIDataclassActionPicker *)self affectedDataclasses];
  v5 = [v3 localizedTextForDataclasses:v4 usedAtBeginningOfSentence:0];

  if (self->_isPerformingBatchMerge)
  {
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"BATCH_MERGE_FORMAT"];
    v8 = [v6 localizedStringForKey:v7 value:&stru_26BD39CD8 table:@"Localizable"];

    v9 = objc_msgSend(NSString, "stringWithFormat:", v8, v5, @"iCloud");
    goto LABEL_18;
  }
  v10 = (void *)MEMORY[0x263F23150];
  v11 = [(ACUIDataclassActionPicker *)self affectedDataclasses];
  v12 = [v11 lastObject];
  v8 = [v10 localizedReferenceToLocalSourceOfDataclass:v12];

  v13 = NSString;
  v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"MERGE_DATA_TO_SERVER" value:&stru_26BD39CD8 table:@"Localizable"];
  v9 = objc_msgSend(v13, "stringWithFormat:", v15, v5, @"iCloud");

  if (self->_isTetheredSyncingEnabled && !self->_isAnotherAccountSyncingDataclass)
  {
    if ([(NSString *)self->_tetheredSyncingSource isEqualToString:@"OSX"])
    {
      v22 = NSString;
      v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v17 = v23;
      v24 = @"MERGE_TETHERED_DATA_TO_SERVER_MAC";
    }
    else
    {
      if (![(NSString *)self->_tetheredSyncingSource isEqualToString:@"Windows"]) {
        goto LABEL_16;
      }
      v22 = NSString;
      v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v17 = v23;
      v24 = @"MERGE_TETHERED_DATA_TO_SERVER_PC";
    }
    v18 = [v23 localizedStringForKey:v24 value:&stru_26BD39CD8 table:@"Localizable"];
    objc_msgSend(v22, "stringWithFormat:", v18, v5, @"iCloud");
    goto LABEL_14;
  }
  if (!self->_isDataclassSyncingUsingExchangeOnly)
  {
    if (!self->_isAnotherAccountSyncingDataclass) {
      goto LABEL_16;
    }
    v21 = NSString;
    v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"MERGE_DATA_TO_SERVER_OTHER_OTA_ENABLED" value:&stru_26BD39CD8 table:@"Localizable"];
    objc_msgSend(v21, "stringWithFormat:", v18, v5, @"iCloud");
    uint64_t v20 = LABEL_14:;
    goto LABEL_15;
  }
  v16 = NSString;
  v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v18 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"MERGE_DATA_TO_SERVER_EAS_PRESENT"];
  uint64_t v19 = [v17 localizedStringForKey:v18 value:&stru_26BD39CD8 table:@"Localizable"];
  uint64_t v20 = objc_msgSend(v16, "stringWithFormat:", v19, v5, @"iCloud");

  v9 = (void *)v19;
LABEL_15:

  v9 = (void *)v20;
LABEL_16:
  if (self->_localStoreHasReadOnlyCalendars)
  {
    v25 = NSString;
    v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v27 = [v26 localizedStringForKey:@"READ_ONLY_CALENDARS_WILL_BE_DELETED" value:&stru_26BD39CD8 table:@"Localizable"];
    v28 = objc_msgSend(v25, "stringWithFormat:", v27, v8);
    uint64_t v29 = [v25 stringWithFormat:@"%@ %@", v9, v28];

    v9 = (void *)v29;
  }
LABEL_18:

  return v9;
}

- (id)descriptionForDataclassAction:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_isPerformingBatchMerge)
  {
    if ([v4 type] == 5)
    {
      v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"BATCH_MERGE_OK_BUTTON";
      goto LABEL_6;
    }
    if (![v5 type])
    {
      v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v7 = v6;
      v8 = @"BATCH_MERGE_CANCEL_BUTTON";
LABEL_6:
      v9 = [v6 localizedStringForKey:v8 value:&stru_26BD39CD8 table:@"Localizable"];

      if (v9) {
        goto LABEL_8;
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)AAUIDataclassMergeActionPicker;
  v9 = [(ACUIDataclassActionPicker *)&v11 descriptionForDataclassAction:v5];
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