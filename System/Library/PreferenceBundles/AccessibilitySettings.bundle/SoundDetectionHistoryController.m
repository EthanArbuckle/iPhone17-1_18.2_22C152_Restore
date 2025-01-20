@interface SoundDetectionHistoryController
+ (BOOL)_deleteFilesForSpecifier:(id)a3;
+ (id)_axParseSoundDetectionRecordingFiles;
+ (id)_directory;
+ (id)_formatDateFromString:(id)a3;
+ (id)_parseJSONFile:(id)a3;
+ (id)_sortJSONData:(id)a3;
+ (void)_generateRadarForSpecifier:(id)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (id)specifiers;
- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
@end

@implementation SoundDetectionHistoryController

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v25 = OBJC_IVAR___PSListController__specifiers;
    v32 = self;
    v4 = +[NSMutableArray array];
    v24 = +[SoundDetectionHistoryController _axParseSoundDetectionRecordingFiles];
    v5 = +[SoundDetectionHistoryController _sortJSONData:](SoundDetectionHistoryController, "_sortJSONData:");
    v6 = +[PSSpecifier groupSpecifierWithName:0];
    [v6 setProperty:@"Swipe Right on a cell to file a radar for that sound. Swipe Left to delete the recorded sound." forKey:PSFooterTextGroupKey];
    [v4 addObject:v6];
    v7 = +[PSSpecifier groupSpecifierWithName:0];

    v31 = v4;
    [v4 addObject:v7];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = v5;
    id v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v30 = *(void *)v34;
      uint64_t v29 = PSCellClassKey;
      uint64_t v28 = PSTableCellStyleOverrideKey;
      uint64_t v27 = PSEnabledKey;
      uint64_t v10 = PSValueKey;
      do
      {
        v11 = 0;
        v12 = v7;
        do
        {
          if (*(void *)v34 != v30) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v11);
          v14 = [v13 objectForKey:@"listenType"];
          v15 = [v13 objectForKey:@"audioStringDate"];
          v16 = [v13 objectForKey:@"audioFilePath"];
          v17 = [v13 objectForKey:@"jsonFilePath"];
          v18 = [v13 objectForKey:@"isCustomModel"];
          unsigned __int8 v19 = [v18 BOOLValue];

          v20 = &stru_20F6B8;
          if ((v19 & 1) == 0)
          {
            v21 = AXSDSoundDetectionTypeForIdentifier();
            AXSDSoundDetectionLocalizedTitleForType();
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          v7 = +[PSSpecifier preferenceSpecifierNamed:v20 target:v32 set:0 get:0 detail:0 cell:-1 edit:0];

          [v7 setProperty:objc_opt_class() forKey:v29];
          [v7 setProperty:&off_22A308 forKey:v28];
          [v7 setProperty:&__kCFBooleanTrue forKey:v27];
          [v7 setProperty:v15 forKey:v10];
          [v7 setProperty:v16 forKey:@"audioFilePath"];
          [v7 setProperty:v17 forKey:@"jsonFilePath"];
          [v31 addObject:v7];

          v11 = (char *)v11 + 1;
          v12 = v7;
        }
        while (v9 != v11);
        id v9 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v9);
    }

    v22 = *(void **)&v32->PSListController_opaque[v25];
    *(void *)&v32->PSListController_opaque[v25] = v31;

    v3 = *(void **)&v32->PSListController_opaque[v25];
  }

  return v3;
}

+ (id)_directory
{
  char v5 = 1;
  v2 = +[NSFileManager defaultManager];
  CFStringRef v3 = @"/var/mobile/Library/Accessibility/DataCollection/SoundFiles";
  if (![v2 fileExistsAtPath:@"/var/mobile/Library/Accessibility/DataCollection/SoundFiles" isDirectory:&v5])CFStringRef v3 = 0; {

  }
  return (id)v3;
}

+ (id)_axParseSoundDetectionRecordingFiles
{
  v2 = [a1 _directory];
  CFStringRef v3 = +[NSFileManager defaultManager];
  v4 = [v3 enumeratorAtPath:v2];

  char v5 = objc_opt_new();
  uint64_t v6 = [v4 nextObject];
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      id v8 = [v7 pathExtension];
      unsigned int v9 = [v8 isEqualToString:@"wav"];

      if (!v9)
      {
        uint64_t v10 = [v2 stringByAppendingPathComponent:v7];
        v11 = +[SoundDetectionHistoryController _parseJSONFile:v10];
        if (v11)
        {
          v12 = [v7 stringByDeletingPathExtension];
          v13 = +[NSString stringWithFormat:@"%@.%@", v12, @"wav"];

          v14 = [v2 stringByAppendingPathComponent:v13];
          id v15 = [v11 mutableCopy];
          [v15 setObject:v14 forKey:@"audioFilePath"];
          [v15 setObject:v10 forKey:@"jsonFilePath"];
          [v15 setObject:&off_22A320 forKey:@"isCustomModel"];
          [v5 addObject:v15];
        }
        else
        {
          v13 = AXLogUltron();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "JSON Data is nil", buf, 2u);
          }
        }
      }
      uint64_t v16 = [v4 nextObject];

      v7 = (void *)v16;
    }
    while (v16);
  }

  return v5;
}

+ (id)_parseJSONFile:(id)a3
{
  id v3 = a3;
  v4 = +[NSData dataWithContentsOfFile:v3];
  id v10 = 0;
  char v5 = +[NSJSONSerialization JSONObjectWithData:v4 options:0 error:&v10];
  id v6 = v10;
  if (v6)
  {
    v7 = AXLogUltron();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[SoundDetectionHistoryController _parseJSONFile:]();
    }
LABEL_7:

    id v8 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = AXLogUltron();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[SoundDetectionHistoryController _parseJSONFile:]((uint64_t)v3, v7);
    }
    goto LABEL_7;
  }
  id v8 = v5;
LABEL_8:

  return v8;
}

+ (BOOL)_deleteFilesForSpecifier:(id)a3
{
  id v3 = a3;
  v4 = [v3 propertyForKey:@"audioFilePath"];
  char v5 = +[NSFileManager defaultManager];
  id v19 = 0;
  [v5 removeItemAtPath:v4 error:&v19];
  id v6 = v19;

  BOOL v7 = v6 == 0;
  if (v6)
  {
    id v8 = AXLogUltron();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[SoundDetectionHistoryController _deleteFilesForSpecifier:]();
    }

    unsigned int v9 = AXLogTemp();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v4;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Ultron History - Failed to delete audio file %@. Error: %@", buf, 0x16u);
    }
  }
  id v10 = AXLogTemp();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Successfully deleted file: %@", buf, 0xCu);
  }

  v11 = [v3 propertyForKey:@"jsonFilePath"];

  v12 = +[NSFileManager defaultManager];
  id v18 = v6;
  [v12 removeItemAtPath:v11 error:&v18];
  id v13 = v18;

  if (v13)
  {
    v14 = AXLogUltron();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[SoundDetectionHistoryController _deleteFilesForSpecifier:]();
    }

    id v15 = AXLogTemp();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v11;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Ultron History - Failed to delete json file %@. Error: %@", buf, 0x16u);
    }

    BOOL v7 = 0;
  }
  uint64_t v16 = AXLogTemp();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v11;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Successfully deleted file: %@", buf, 0xCu);
  }

  return v7;
}

+ (id)_sortJSONData:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"listenType" ascending:1];
  id v5 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"audioStringDate" ascending:1];
  v9[0] = v5;
  v9[1] = v4;
  id v6 = +[NSArray arrayWithObjects:v9 count:2];
  BOOL v7 = [v3 sortedArrayUsingDescriptors:v6];

  return v7;
}

+ (id)_formatDateFromString:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSDateFormatter);
  id v5 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v4 setLocale:v5];

  id v6 = +[NSTimeZone systemTimeZone];
  [v4 setTimeZone:v6];

  [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  [v4 setDateStyle:2];
  [v4 setTimeStyle:1];
  BOOL v7 = [v4 dateFromString:v3];

  return v7;
}

+ (void)_generateRadarForSpecifier:(id)a3
{
  id v3 = a3;
  __int16 v22 = [v3 name];
  id v4 = [v3 propertyForKey:@"audioFilePath"];
  v25[0] = v4;
  id v5 = [v3 propertyForKey:@"jsonFilePath"];

  v25[1] = v5;
  id v23 = +[NSArray arrayWithObjects:v25 count:2];

  v21 = objc_opt_new();
  [v21 setScheme:@"tap-to-radar"];
  [v21 setHost:@"new"];
  id v6 = +[NSString stringWithFormat:@"AX Sound Recognition False Positive: %@", v22];
  v20 = +[NSURLQueryItem queryItemWithName:@"Title" value:v6];

  id v19 = +[NSURLQueryItem queryItemWithName:@"Description" value:@"[Add any details about where you were or what you were doing when the false positive occured. Thanks!]"];
  BOOL v7 = +[NSURLQueryItem queryItemWithName:@"Classification" value:@"Performance"];
  uint64_t v8 = +[NSURLQueryItem queryItemWithName:@"Reproducibility" value:@"I Didn't Try"];
  unsigned int v9 = +[NSURLQueryItem queryItemWithName:@"ComponentName" value:@"Accessibility Sound Detection"];
  id v10 = +[NSURLQueryItem queryItemWithName:@"ComponentID" value:@"1074027"];
  v11 = +[NSURLQueryItem queryItemWithName:@"ComponentVersion" value:@"All"];
  v12 = [v23 componentsJoinedByString:@","];
  id v13 = +[NSURLQueryItem queryItemWithName:@"Attachments" value:v12];

  v14 = +[NSURLQueryItem queryItemWithName:@"AutoDiagnostics" value:@"0"];
  v24[0] = v20;
  v24[1] = v19;
  v24[2] = v8;
  v24[3] = v7;
  id v15 = (void *)v8;
  v24[4] = v9;
  v24[5] = v10;
  v24[6] = v11;
  v24[7] = v13;
  v24[8] = v14;
  uint64_t v16 = +[NSArray arrayWithObjects:v24 count:9];
  [v21 setQueryItems:v16];

  v17 = [v21 URL];
  id v18 = +[LSApplicationWorkspace defaultWorkspace];
  [v18 openURL:v17 withOptions:0];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v7 = [(SoundDetectionHistoryController *)self specifierAtIndex:[(SoundDetectionHistoryController *)self indexForIndexPath:a5]];
    +[SoundDetectionHistoryController _deleteFilesForSpecifier:v7];
    [(SoundDetectionHistoryController *)self removeSpecifier:v7];
  }
}

- (id)tableView:(id)a3 leadingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = __95__SoundDetectionHistoryController_tableView_leadingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
  v14 = &unk_20B858;
  id v15 = self;
  id v16 = a4;
  id v4 = v16;
  uint64_t v5 = +[UIContextualAction contextualActionWithStyle:0 title:@"File Radar" handler:&v11];
  id v6 = +[UIImage systemImageNamed:@"ant.circle.fill", v11, v12, v13, v14, v15];
  [v5 setImage:v6];

  id v7 = +[UIColor purpleColor];
  [v5 setBackgroundColor:v7];

  v17 = v5;
  uint64_t v8 = +[NSArray arrayWithObjects:&v17 count:1];
  unsigned int v9 = +[UISwipeActionsConfiguration configurationWithActions:v8];

  return v9;
}

void __95__SoundDetectionHistoryController_tableView_leadingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a4;
  objc_msgSend(v4, "specifierAtIndex:", objc_msgSend(v4, "indexForIndexPath:", v5));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  +[SoundDetectionHistoryController _generateRadarForSpecifier:v7];
  v6[2](v6, 1);
}

+ (void)_parseJSONFile:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Ultron History - Expected a Dictionary but received an array while parsing: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_parseJSONFile:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_0, v0, v1, "Ultron History - Error while parsing file at %@. Error: %@");
}

+ (void)_deleteFilesForSpecifier:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_0, v0, v1, "Ultron History - Failed to delete json file %@. Error: %@");
}

+ (void)_deleteFilesForSpecifier:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_0, v0, v1, "Ultron History - Failed to delete audio file %@. Error: %@");
}

@end