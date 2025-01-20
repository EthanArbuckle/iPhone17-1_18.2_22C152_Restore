@interface ACUILocalization
+ (id)localizedNameForApplicationBundleID:(id)a3;
+ (id)localizedReferenceToLocalSourceOfDataclass:(id)a3;
+ (id)localizedStringForDataclass:(id)a3 withSuffix:(id)a4 forAccount:(id)a5;
+ (id)localizedTextForDataclasses:(id)a3 usedAtBeginningOfSentence:(BOOL)a4;
+ (id)localizedTextForDataclasses:(id)a3 usedAtBeginningOfSentence:(BOOL)a4 forAccount:(id)a5;
+ (id)localizedTitleForDataclass:(id)a3;
+ (id)localizedTitleForDataclass:(id)a3 forAccount:(id)a4;
+ (id)localizedTitleForLocalSourceOfDataclass:(id)a3 usedAtBeginningOfSentence:(BOOL)a4;
@end

@implementation ACUILocalization

+ (id)localizedTitleForLocalSourceOfDataclass:(id)a3 usedAtBeginningOfSentence:(BOOL)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v15 = a4;
  id v14 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  id v13 = (id)[v14 tetheredSyncSourceTypeForDataclass:location[0]];
  if ([v13 isEqualToString:@"OSX"])
  {
    if (v15)
    {
      id v11 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v17 = (id)[v11 localizedStringForKey:@"FROM_MY_COMPUTER_TYPE_MAC" value:&stru_1F39EF5C0 table:@"Localizable"];
    }
    else
    {
      id v10 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v17 = (id)[v10 localizedStringForKey:@"FROM_MY_COMPUTER_TYPE_MAC_MID_SENTENCE" value:&stru_1F39EF5C0 table:@"Localizable"];
    }
  }
  else if ([v13 isEqualToString:@"Windows"])
  {
    if (v15)
    {
      id v9 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v17 = (id)[v9 localizedStringForKey:@"FROM_MY_COMPUTER_TYPE_PC" value:&stru_1F39EF5C0 table:@"Localizable"];
    }
    else
    {
      id v8 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v17 = (id)[v8 localizedStringForKey:@"FROM_MY_COMPUTER_TYPE_PC_MID_SENTENCE" value:&stru_1F39EF5C0 table:@"Localizable"];
    }
  }
  else if (v15)
  {
    id v7 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v17 = (id)[v7 localizedStringForKey:@"ON_MY_DEVICE_TYPE" value:&stru_1F39EF5C0 table:@"Localizable"];
  }
  else
  {
    id v6 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v17 = (id)[v6 localizedStringForKey:@"ON_MY_DEVICE_TYPE_MID_SENTENCE" value:&stru_1F39EF5C0 table:@"Localizable"];
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  v4 = v17;
  return v4;
}

+ (id)localizedTextForDataclasses:(id)a3 usedAtBeginningOfSentence:(BOOL)a4
{
  id v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = (id)[v8 localizedTextForDataclasses:location[0] usedAtBeginningOfSentence:a4 forAccount:0];
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)localizedTextForDataclasses:(id)a3 usedAtBeginningOfSentence:(BOOL)a4 forAccount:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v37 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v35 = a4;
  id v34 = 0;
  objc_storeStrong(&v34, a5);
  id v33 = (id)[MEMORY[0x1E4F28E78] string];
  id v32 = location[0];
  memset(__b, 0, sizeof(__b));
  id v27 = v32;
  uint64_t v28 = [v27 countByEnumeratingWithState:__b objects:v38 count:16];
  if (v28)
  {
    uint64_t v22 = *(void *)__b[2];
    uint64_t v23 = 0;
    unint64_t v24 = v28;
    while (1)
    {
      uint64_t v21 = v23;
      if (*(void *)__b[2] != v22) {
        objc_enumerationMutation(v27);
      }
      v31 = *(void **)(__b[1] + 8 * v23);
      id v29 = @"WARNING";
      if ([v33 length])
      {
        id v19 = v31;
        id v5 = (id)[v32 lastObject];
        BOOL v20 = v19 != v5;

        if (v20)
        {
          id v13 = v33;
          id v15 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          id v14 = (id)[v15 localizedStringForKey:@"MIDDLE_SEPARATOR" value:&stru_1F39EF5C0 table:@"Localizable"];
          objc_msgSend(v13, "appendString:");
        }
        else
        {
          id v16 = v33;
          id v18 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          id v17 = (id)[v18 localizedStringForKey:@"LAST_SEPARATOR" value:&stru_1F39EF5C0 table:@"Localizable"];
          objc_msgSend(v16, "appendString:");
        }
      }
      else if (v35)
      {
        objc_storeStrong(&v29, @"LABEL");
      }
      id v11 = v33;
      id v12 = (id)objc_msgSend(v37, "localizedStringForDataclass:withSuffix:forAccount:", v31, v29);
      objc_msgSend(v11, "appendString:");

      objc_storeStrong(&v29, 0);
      ++v23;
      if (v21 + 1 >= v24)
      {
        uint64_t v23 = 0;
        unint64_t v24 = [v27 countByEnumeratingWithState:__b objects:v38 count:16];
        if (!v24) {
          break;
        }
      }
    }
  }

  if (![v33 length])
  {
    id v8 = v33;
    id v10 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v9 = (id)[v10 localizedStringForKey:@"DATA" value:&stru_1F39EF5C0 table:@"Localizable"];
    objc_msgSend(v8, "appendString:");
  }
  id v7 = v33;
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  return v7;
}

+ (id)localizedTitleForDataclass:(id)a3
{
  id v6 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)[v6 localizedTitleForDataclass:location[0] forAccount:0];
  objc_storeStrong(location, 0);
  return v4;
}

+ (id)localizedTitleForDataclass:(id)a3 forAccount:(id)a4
{
  id v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v6 = (id)[v9 localizedStringForDataclass:location[0] withSuffix:@"TITLE" forAccount:v7];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)localizedReferenceToLocalSourceOfDataclass:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  id v8 = (id)[v9 tetheredSyncSourceTypeForDataclass:location[0]];
  if ([v8 isEqualToString:@"OSX"])
  {
    id v7 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v11 = (id)[v7 localizedStringForKey:@"SYNCED_WITH_YOUR_COMPUTER_TYPE_MAC_MID_SENTENCE" value:&stru_1F39EF5C0 table:@"Localizable"];
  }
  else if ([v8 isEqualToString:@"Windows"])
  {
    id v6 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v11 = (id)[v6 localizedStringForKey:@"SYNCED_WITH_YOUR_COMPUTER_TYPE_PC_MID_SENTENCE" value:&stru_1F39EF5C0 table:@"Localizable"];
  }
  else
  {
    id v5 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v11 = (id)[v5 localizedStringForKey:@"ON_YOUR_DEVICE_TYPE_MID_SENTENCE" value:&stru_1F39EF5C0 table:@"Localizable"];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  v3 = v11;
  return v3;
}

+ (id)localizedNameForApplicationBundleID:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
    id v6 = (id)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", location[0], 1);
    id v9 = (id)[v6 localizedName];
    int v7 = 1;
    objc_storeStrong(&v6, 0);
  }
  else
  {
    id v9 = 0;
    int v7 = 1;
  }
  objc_storeStrong(location, 0);
  id v4 = v9;
  return v4;
}

+ (id)localizedStringForDataclass:(id)a3 withSuffix:(id)a4 forAccount:(id)a5
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v37 = 0;
  objc_storeStrong(&v37, a4);
  id v36 = 0;
  objc_storeStrong(&v36, a5);
  id v27 = +[ACUIAccountViewProvidersManager sharedInstance];
  id v35 = [(ACUIAccountViewProvidersManager *)v27 localizedStringForDataclass:location[0] withSuffix:v37 forAccount:v36];

  if (v35)
  {
    id v39 = v35;
    int v34 = 1;
  }
  else
  {
    if ([location[0] isEqualToString:*MEMORY[0x1E4F17A98]]) {
      objc_storeStrong(location, (id)*MEMORY[0x1E4F17A90]);
    }
    if ([location[0] isEqualToString:*MEMORY[0x1E4F17B38]]) {
      objc_storeStrong(location, @"com.apple.Dataclass.CloudDrive");
    }
    id v33 = 0;
    if ([location[0] isEqualToString:*MEMORY[0x1E4F17AB0]])
    {
      objc_storeStrong(&v33, @"FIND_MY");
    }
    else if ([location[0] isEqualToString:*MEMORY[0x1E4F175F8]])
    {
      id v23 = (id)[MEMORY[0x1E4F42948] currentDevice];
      BOOL v24 = [v23 userInterfaceIdiom] != 0;

      if (v24)
      {
        id v20 = (id)[MEMORY[0x1E4F42948] currentDevice];
        BOOL v21 = [v20 userInterfaceIdiom] != 4;

        if (v21) {
          objc_storeStrong(&v33, @"FACETIME");
        }
        else {
          objc_storeStrong(&v33, @"PHONE_AND_FACETIME");
        }
      }
      else
      {
        id v32 = @"com.apple.facetime";
        id v31 = 0;
        id v5 = objc_alloc(MEMORY[0x1E4F223C8]);
        id v29 = v31;
        uint64_t v22 = (void *)[v5 initWithBundleIdentifier:v32 allowPlaceholder:0 error:&v29];
        objc_storeStrong(&v31, v29);
        id v30 = v22;
        if (v22) {
          objc_storeStrong(&v33, @"PHONE_AND_FACETIME");
        }
        else {
          objc_storeStrong(&v33, @"PHONE");
        }
        objc_storeStrong(&v30, 0);
        objc_storeStrong(&v31, 0);
        objc_storeStrong(&v32, 0);
      }
    }
    else
    {
      uint64_t v28 = [location[0] rangeOfString:@"." options:4];
      id v6 = (id)[location[0] substringFromIndex:v28 + 1];
      id v7 = v33;
      id v33 = v6;

      id v8 = (id)[v33 uppercaseString];
      id v9 = v33;
      id v33 = v8;
    }
    if ([v37 length])
    {
      id v10 = (id)[v33 stringByAppendingFormat:@"_%@", v37];
      id v11 = v33;
      id v33 = v10;
    }
    id v19 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v12 = (id)[v19 localizedStringForKey:v33 value:&stru_1F39EF5C0 table:@"Localizable"];
    id v13 = v35;
    id v35 = v12;

    if ([v35 isEqualToString:v33])
    {
      id v18 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v14 = (id)[v18 localizedStringForKey:v33 value:&stru_1F39EF5C0 table:@"Payment_Localizable"];
      id v15 = v35;
      id v35 = v14;
    }
    id v39 = v35;
    int v34 = 1;
    objc_storeStrong(&v33, 0);
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  id v16 = v39;
  return v16;
}

@end