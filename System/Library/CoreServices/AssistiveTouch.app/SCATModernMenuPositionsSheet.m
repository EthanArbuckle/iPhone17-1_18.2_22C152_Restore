@interface SCATModernMenuPositionsSheet
+ (id)menuItemDictionary;
+ (id)menuItemWithIdentifier:(id)a3 menu:(id)a4 delegate:(id)a5;
- (id)makeMenuItemsIfNeeded;
@end

@implementation SCATModernMenuPositionsSheet

+ (id)menuItemDictionary
{
  if (AXDeviceIsPad())
  {
    v15[0] = @"settings_moveOriginal";
    v2 = sub_100040EC8(@"Position-Orig");
    v16[0] = v2;
    v15[1] = @"settings_moveTopLeft";
    v3 = sub_100040EC8(@"Position-Top-Left");
    v16[1] = v3;
    v15[2] = @"settings_moveTop";
    v4 = sub_100040EC8(@"Position-Top");
    v16[2] = v4;
    v15[3] = @"settings_moveTopRight";
    v5 = sub_100040EC8(@"Position-Top-Right");
    v16[3] = v5;
    v15[4] = @"settings_moveRight";
    v6 = sub_100040EC8(@"Position-Right");
    v16[4] = v6;
    v15[5] = @"settings_moveBottomRight";
    v7 = sub_100040EC8(@"Position-Bottom-Right");
    v16[5] = v7;
    v15[6] = @"settings_moveBottom";
    v8 = sub_100040EC8(@"Position-Bottom");
    v16[6] = v8;
    v15[7] = @"settings_moveBottomLeft";
    v9 = sub_100040EC8(@"Position-Bottom-Left");
    v16[7] = v9;
    v15[8] = @"settings_moveLeft";
    v10 = sub_100040EC8(@"Position-Left");
    v16[8] = v10;
    v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:9];
  }
  else
  {
    v13[0] = @"settings_moveOriginal";
    v2 = sub_100040EC8(@"Position-Orig");
    v14[0] = v2;
    v13[1] = @"settings_moveTop";
    v3 = sub_100040EC8(@"Position-Top");
    v14[1] = v3;
    v13[2] = @"settings_moveBottom";
    v4 = sub_100040EC8(@"Position-Bottom");
    v14[2] = v4;
    v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  }

  return v11;
}

+ (id)menuItemWithIdentifier:(id)a3 menu:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [a1 menuItemDictionary];
  v10 = [v9 objectForKey:v7];

  if (v10)
  {
    if ([v7 isEqualToString:@"settings_moveOriginal"])
    {
      v11 = &stru_1001ADF80;
    }
    else if ([v7 isEqualToString:@"settings_moveTopLeft"])
    {
      v11 = &stru_1001ADFA0;
    }
    else if ([v7 isEqualToString:@"settings_moveTop"])
    {
      v11 = &stru_1001ADFC0;
    }
    else if ([v7 isEqualToString:@"settings_moveTopRight"])
    {
      v11 = &stru_1001ADFE0;
    }
    else if ([v7 isEqualToString:@"settings_moveRight"])
    {
      v11 = &stru_1001AE000;
    }
    else if ([v7 isEqualToString:@"settings_moveBottomRight"])
    {
      v11 = &stru_1001AE020;
    }
    else if ([v7 isEqualToString:@"settings_moveBottom"])
    {
      v11 = &stru_1001AE040;
    }
    else if ([v7 isEqualToString:@"settings_moveBottomLeft"])
    {
      v11 = &stru_1001AE060;
    }
    else if ([v7 isEqualToString:@"settings_moveLeft"])
    {
      v11 = &stru_1001AE080;
    }
    else
    {
      v11 = 0;
    }
    v12 = [v9 objectForKeyedSubscript:v7];
    v10 = +[SCATModernMenuItem itemWithIdentifier:v7 delegate:v8 title:v12 imageName:0 activateBehavior:3 activateHandler:v11 updateHandler:0];
  }

  return v10;
}

- (id)makeMenuItemsIfNeeded
{
  v3 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = objc_msgSend((id)objc_opt_class(), "menuItemDictionary", 0);
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_opt_class();
        v11 = [(SCATModernMenuSheet *)self menu];
        v12 = [v10 menuItemWithIdentifier:v9 menu:v11 delegate:self];
        [v3 addObject:v12];
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

@end