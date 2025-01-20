@interface SCATModernMenuItemSettingsFactory
+ (id)_stringForGroupEnabled:(BOOL)a3;
+ (id)_stringForSoundEnabled:(BOOL)a3;
+ (id)_stringForSpeechEnabled:(BOOL)a3;
+ (id)itemDetailsForItem:(id)a3 menu:(id)a4;
+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5;
+ (id)updateBlockForIdentifier:(id)a3;
@end

@implementation SCATModernMenuItemSettingsFactory

+ (id)menuItemsForItem:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = objc_msgSend(a1, "itemDetailsForItem:menu:", v8, v9, 0);
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [a1 menuItemWithItemDictionary:*(void *)(*((void *)&v19 + 1) + 8 * i) menu:v9 delegate:v10];
        [v11 addObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v11;
}

+ (id)itemDetailsForItem:(id)a3 menu:(id)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:AXSSwitchControlMenuItemSettingsSpeedUpDown])
  {
    v28[0] = @"settings_decreaseScanSpeed";
    v27[0] = @"identifier";
    v27[1] = @"title";
    v6 = sub_100040EC8(@"Settings-Slow-Down");
    v27[2] = @"activateBehavior";
    v28[1] = v6;
    v28[2] = &off_1001BBCD0;
    v7 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
    v29[0] = v7;
    v26[0] = @"settings_increaseScanSpeed";
    v25[0] = @"identifier";
    v25[1] = @"title";
    id v8 = sub_100040EC8(@"Settings-Speed-Up");
    v25[2] = @"activateBehavior";
    v26[1] = v8;
    v26[2] = &off_1001BBCD0;
    id v9 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
    v29[1] = v9;
    id v10 = +[NSArray arrayWithObjects:v29 count:2];

LABEL_12:
    goto LABEL_13;
  }
  if ([v5 isEqualToString:AXSSwitchControlMenuItemSettingsMoveMenu])
  {
    v23[0] = @"settings_move";
    v22[0] = @"identifier";
    v22[1] = @"title";
    v6 = sub_100040EC8(@"Settings-Move");
    v22[2] = @"activateBehavior";
    v23[1] = v6;
    v23[2] = &off_1001BBCD0;
    v7 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
    v24 = v7;
    id v10 = +[NSArray arrayWithObjects:&v24 count:1];
LABEL_13:

    goto LABEL_14;
  }
  if ([v5 isEqualToString:AXSSwitchControlMenuItemSettingsSpeechOnOff])
  {
    v20[0] = @"settings_speech";
    v19[0] = @"identifier";
    v19[1] = @"title";
    v6 = +[AXSettings sharedInstance];
    v7 = objc_msgSend(a1, "_stringForSpeechEnabled:", objc_msgSend(v6, "assistiveTouchScannerSpeechEnabled"));
    v19[2] = @"activateBehavior";
    v20[1] = v7;
    v20[2] = &off_1001BBCD0;
    id v8 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
    long long v21 = v8;
    id v11 = &v21;
LABEL_11:
    id v10 = +[NSArray arrayWithObjects:v11 count:1];
    goto LABEL_12;
  }
  if ([v5 isEqualToString:AXSSwitchControlMenuItemSettingsSoundOnOff])
  {
    v17[0] = @"settings_sound";
    v16[0] = @"identifier";
    v16[1] = @"title";
    v6 = +[AXSettings sharedInstance];
    v7 = objc_msgSend(a1, "_stringForSoundEnabled:", objc_msgSend(v6, "assistiveTouchScannerSoundEnabled"));
    v16[2] = @"activateBehavior";
    v17[1] = v7;
    v17[2] = &off_1001BBCD0;
    id v8 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
    v18 = v8;
    id v11 = &v18;
    goto LABEL_11;
  }
  if ([v5 isEqualToString:AXSSwitchControlMenuItemSettingsGroupsOnOff])
  {
    v14[0] = @"settings_groupElements";
    v13[0] = @"identifier";
    v13[1] = @"title";
    v6 = +[AXSettings sharedInstance];
    v7 = objc_msgSend(a1, "_stringForGroupEnabled:", objc_msgSend(v6, "assistiveTouchGroupElementsEnabled"));
    v13[2] = @"activateBehavior";
    v14[1] = v7;
    v14[2] = &off_1001BBCD0;
    id v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
    uint64_t v15 = v8;
    id v11 = &v15;
    goto LABEL_11;
  }
  _AXAssert();
  id v10 = 0;
LABEL_14:

  return v10;
}

+ (id)menuItemWithItemDictionary:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  id v8 = [v7 objectForKey:@"identifier"];
  id v9 = [v7 objectForKey:@"title"];
  id v10 = [v7 objectForKey:@"imageName"];
  id v11 = [v7 objectForKey:@"activateBehavior"];
  id v27 = [v11 unsignedIntegerValue];

  v12 = [v7 objectForKey:@"guidedAccess"];
  id v13 = [v12 BOOLValue];

  id v14 = [v7 objectForKeyedSubscript:@"assistiveAccess"];

  unsigned __int8 v15 = v13;
  if (v14) {
    unsigned __int8 v15 = [v14 BOOLValue];
  }
  if ([v8 isEqualToString:@"settings_increaseScanSpeed"]
    && (+[SCATScannerManager sharedManager],
        v16 = objc_claimAutoreleasedReturnValue(),
        [v16 activeScannerDriver],
        v17 = objc_claimAutoreleasedReturnValue(),
        unsigned int v18 = [v17 driverType],
        v17,
        v16,
        !v18))
  {
    long long v22 = &stru_1001ABE98;
  }
  else if ([v8 isEqualToString:@"settings_decreaseScanSpeed"] {
         && (+[SCATScannerManager sharedManager],
  }
             long long v19 = objc_claimAutoreleasedReturnValue(),
             [v19 activeScannerDriver],
             long long v20 = objc_claimAutoreleasedReturnValue(),
             unsigned int v21 = [v20 driverType],
             v20,
             v19,
             !v21))
  {
    long long v22 = &stru_1001ABEB8;
  }
  else if ([v8 isEqualToString:@"settings_move"])
  {
    long long v22 = &stru_1001ABED8;
  }
  else if ([v8 isEqualToString:@"settings_speech"])
  {
    long long v22 = &stru_1001ABEF8;
  }
  else if ([v8 isEqualToString:@"settings_sound"])
  {
    long long v22 = &stru_1001ABF18;
  }
  else if ([v8 isEqualToString:@"settings_groupElements"])
  {
    long long v22 = &stru_1001ABF38;
  }
  else
  {
    long long v22 = 0;
  }
  v23 = [(id)objc_opt_class() updateBlockForIdentifier:v8];
  LOBYTE(v26) = v15;
  v24 = +[SCATModernMenuItem itemWithIdentifier:v8 delegate:v6 title:v9 imageName:v10 activateBehavior:v27 allowedWithGuidedAccess:v13 allowedWithAssistiveAccess:v26 activateHandler:v22 updateHandler:v23];

  return v24;
}

+ (id)_stringForSpeechEnabled:(BOOL)a3
{
  if (a3) {
    v3 = @"Settings-Speech-On";
  }
  else {
    v3 = @"Settings-Speech-Off";
  }
  v4 = sub_100040EC8(v3);

  return v4;
}

+ (id)_stringForSoundEnabled:(BOOL)a3
{
  if (a3) {
    v3 = @"Settings-Sound-On";
  }
  else {
    v3 = @"Settings-Sound-Off";
  }
  v4 = sub_100040EC8(v3);

  return v4;
}

+ (id)_stringForGroupEnabled:(BOOL)a3
{
  if (a3) {
    v3 = @"Settings-Grouping-On";
  }
  else {
    v3 = @"Settings-Grouping-Off";
  }
  v4 = sub_100040EC8(v3);

  return v4;
}

+ (id)updateBlockForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"settings_speech"])
  {
    id v5 = v11;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    id v6 = sub_1000404DC;
LABEL_7:
    v5[2] = v6;
    v5[3] = &unk_1001ABF58;
    v5[4] = a1;
    id v7 = objc_retainBlock(v5);
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"settings_sound"])
  {
    id v5 = v10;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    id v6 = sub_10004057C;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"settings_groupElements"])
  {
    id v5 = v9;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    id v6 = sub_10004061C;
    goto LABEL_7;
  }
  id v7 = &stru_1001ABF78;
LABEL_8:

  return v7;
}

@end