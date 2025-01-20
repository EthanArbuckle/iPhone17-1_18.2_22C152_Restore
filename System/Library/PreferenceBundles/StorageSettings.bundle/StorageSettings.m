id STStorageLocStr(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t vars8;

  v1 = qword_3A4D0;
  v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_3A4D0, &stru_2C978);
  }
  v3 = [(id)qword_3A4C8 localizedStringForKey:v2 value:v2 table:0];

  return v3;
}

void sub_2D98(id a1)
{
  qword_3A4C8 = +[NSBundle bundleForClass:NSClassFromString(@"STStorageController")];

  _objc_release_x1();
}

int64_t sub_3678(id a1, PSSpecifier *a2, PSSpecifier *a3)
{
  v4 = a2;
  v5 = a3;
  uint64_t v6 = PSValueKey;
  v7 = [(PSSpecifier *)v4 propertyForKey:PSValueKey];
  id v8 = [v7 longLongValue];

  v9 = [(PSSpecifier *)v5 propertyForKey:v6];
  id v10 = [v9 longLongValue];

  if ((uint64_t)v8 <= (uint64_t)v10)
  {
    if ((uint64_t)v10 <= (uint64_t)v8)
    {
      uint64_t v12 = STStorageAppKey;
      v13 = [(PSSpecifier *)v4 propertyForKey:STStorageAppKey];
      v14 = [(PSSpecifier *)v5 propertyForKey:v12];
      v15 = [v13 name];
      uint64_t v16 = [v14 name];
      v17 = (void *)v16;
      if (v15) {
        BOOL v18 = v16 == 0;
      }
      else {
        BOOL v18 = 1;
      }
      if (v18) {
        int64_t v11 = 0;
      }
      else {
        int64_t v11 = (int64_t)[v15 localizedCaseInsensitiveCompare:v16];
      }
    }
    else
    {
      int64_t v11 = 1;
    }
  }
  else
  {
    int64_t v11 = -1;
  }

  return v11;
}

void sub_37F0(id a1)
{
  qword_3A4D8 = STStorageLocStr(@"LAST_OPENED_FMT");

  _objc_release_x1();
}

void sub_3FC8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) artwork];
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "imageWithSize:", 56.0, 56.0), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = 0;
  }
  else
  {
    unsigned __int16 v6 = (unsigned __int16)[*(id *)(a1 + 32) mediaType];
    CFStringRef v7 = @"book";
    if ((v6 & 4) == 0) {
      CFStringRef v7 = @"music";
    }
    CFStringRef v8 = @"podcasts";
    if ((v6 & 0xA) != 0) {
      CFStringRef v7 = @"podcasts";
    }
    if (!(_BYTE)v6) {
      CFStringRef v7 = 0;
    }
    if ((v6 & 0x1400) == 0) {
      CFStringRef v8 = @"film";
    }
    if ((v6 & 0xFF00) != 0) {
      CFStringRef v9 = v8;
    }
    else {
      CFStringRef v9 = v7;
    }
    v5 = +[UIColor systemGray3Color];
    v4 = +[UIImage _systemImageNamed:v9];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_413C;
  block[3] = &unk_2CA00;
  block[4] = *(void *)(a1 + 40);
  id v13 = v5;
  id v14 = v4;
  id v10 = v4;
  id v11 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_413C(uint64_t a1)
{
  [*(id *)(a1 + 32) setTintColor:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  v3 = *(void **)(a1 + 32);

  return [v3 setIcon:v2];
}

void sub_417C(id a1)
{
  qword_3A4E8 = STStorageLocStr(@"LAST_ACCESSED_FMT");

  _objc_release_x1();
}

void sub_4F74(id a1)
{
  v1 = NSStringFromSelector("documentSize");
  uint64_t v2 = +[NSSortDescriptor sortDescriptorWithKey:v1 ascending:0];
  v3 = NSStringFromSelector("displayName");
  v4 = +[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:", v3, 1, "localizedCaseInsensitiveCompare:", v2);
  v9[1] = v4;
  v5 = NSStringFromSelector("itemIdentifier");
  unsigned __int16 v6 = +[NSSortDescriptor sortDescriptorWithKey:v5 ascending:1];
  v9[2] = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:v9 count:3];
  CFStringRef v8 = (void *)qword_3A500;
  qword_3A500 = v7;
}

id sub_5444(uint64_t a1)
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:"reloadSpecifiers" object:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 performSelector:"reloadSpecifiers" withObject:0 afterDelay:1.0];
}

void sub_5BC4(uint64_t a1)
{
  id v3 = +[FPItemManager defaultManager];
  id v2 = [objc_alloc((Class)FPDeleteOperation) initWithItems:*(void *)(a1 + 32)];
  [v3 scheduleAction:v2];
}

void sub_5C90(id a1)
{
  qword_3A508 = objc_opt_new();

  _objc_release_x1();
}

id sub_67F8(uint64_t a1)
{
  long long v17 = *(_OWORD *)(a1 + 32);
  v16[0] = @"launch_time_start_calculating";
  v16[1] = @"launch_time_end_calculating";
  uint64_t v2 = *(void *)(a1 + 48);
  v16[2] = @"device_capacity";
  v16[3] = @"disk_used_space";
  long long v19 = *(_OWORD *)(a1 + 56);
  v16[4] = @"disk_used_space_percent";
  v16[5] = @"disk_purgeable_space";
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 80);
  uint64_t v18 = v2;
  uint64_t v20 = v3;
  uint64_t v21 = v4;
  v16[6] = @"disk_purgeable_space_percent";
  v16[7] = @"others_size";
  long long v22 = *(_OWORD *)(a1 + 88);
  v16[8] = @"others_size_percent";
  v16[9] = @"media_size";
  uint64_t v23 = *(void *)(a1 + 104);
  long long v5 = *(_OWORD *)(a1 + 112);
  v16[10] = @"media_size_percent";
  v16[11] = @"photos_size";
  v16[12] = @"photos_size_percent";
  v16[13] = @"apps_size";
  uint64_t v6 = *(void *)(a1 + 136);
  uint64_t v25 = *(void *)(a1 + 128);
  uint64_t v26 = v6;
  v16[14] = @"apps_size_percent";
  v16[15] = @"messages_size";
  uint64_t v7 = *(void *)(a1 + 152);
  uint64_t v27 = *(void *)(a1 + 144);
  uint64_t v28 = v7;
  v16[16] = @"messages_size_percent";
  v16[17] = @"mail_size";
  uint64_t v8 = *(void *)(a1 + 168);
  uint64_t v29 = *(void *)(a1 + 160);
  uint64_t v30 = v8;
  v16[18] = @"mail_size_percent";
  v16[19] = @"podcast_size";
  uint64_t v9 = *(void *)(a1 + 184);
  uint64_t v31 = *(void *)(a1 + 176);
  uint64_t v32 = v9;
  v16[20] = @"podcast_size_percent";
  v16[21] = @"music_size";
  uint64_t v10 = *(void *)(a1 + 200);
  uint64_t v33 = *(void *)(a1 + 192);
  uint64_t v34 = v10;
  v16[22] = @"music_size_percent";
  v16[23] = @"icloud_drive_size";
  uint64_t v11 = *(void *)(a1 + 216);
  uint64_t v35 = *(void *)(a1 + 208);
  uint64_t v36 = v11;
  uint64_t v37 = *(void *)(a1 + 224);
  long long v24 = v5;
  v16[24] = @"icloud_drive_size_percent";
  v16[25] = @"apps_count";
  uint64_t v12 = +[NSNumber numberWithLongLong:*(void *)(a1 + 264)];
  uint64_t v13 = *(void *)(a1 + 232);
  v38 = v12;
  uint64_t v39 = v13;
  v16[26] = @"photos_count";
  v16[27] = @"podcast_count";
  long long v40 = *(_OWORD *)(a1 + 240);
  v16[28] = @"music_count";
  v16[29] = @"disk_usage_state";
  uint64_t v41 = *(void *)(a1 + 256);
  id v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:v16 count:30];

  return v14;
}

id sub_6B5C(void *a1)
{
  v10[0] = &off_2FEA0;
  v9[0] = @"action_id";
  v9[1] = @"app_type";
  uint64_t v2 = +[NSNumber numberWithInteger:a1[6]];
  uint64_t v3 = &off_2FE88;
  uint64_t v4 = (void *)a1[5];
  if (a1[4]) {
    uint64_t v3 = (_UNKNOWN **)a1[4];
  }
  v10[1] = v2;
  v10[2] = v3;
  v9[2] = @"detail_action_size";
  void v9[3] = @"detail_action_size_percent";
  long long v5 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v4 deviceSize]);
  uint64_t v6 = STStorageComputePercentage();
  v10[3] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

id sub_6FBC(uint64_t a1)
{
  long long v5 = *(_OWORD *)(a1 + 32);
  v4[0] = @"usage_duration";
  v4[1] = @"done_calculating";
  uint64_t v6 = *(void *)(a1 + 48);
  v4[2] = @"device_capacity";
  v4[3] = @"disk_used_space";
  long long v7 = *(_OWORD *)(a1 + 56);
  v4[4] = @"disk_used_space_percent";
  v4[5] = @"disk_purgeable_space";
  uint64_t v1 = *(void *)(a1 + 80);
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v9 = v1;
  v4[6] = @"disk_purgeable_space_percent";
  v4[7] = @"others_size";
  long long v10 = *(_OWORD *)(a1 + 88);
  v4[8] = @"others_size_percent";
  v4[9] = @"disk_usage_state";
  uint64_t v11 = *(void *)(a1 + 104);
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:v4 count:10];

  return v2;
}

id sub_73CC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setIcon:a2];
}

void sub_8F7C(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = [a3 userTotal];
  if ((uint64_t)v5 >= 1)
  {
    id v6 = v5;
    id v7 = objc_alloc((Class)PSCapacityBarCategory);
    uint64_t v8 = STNameForCategoryKey();
    uint64_t v9 = STColorForCategoryKey();
    id v10 = [v7 initWithIdentifier:v11 title:v8 color:v9 bytes:v6];

    [*(id *)(a1 + 32) addObject:v10];
  }
}

int64_t sub_904C(id a1, PSCapacityBarCategory *a2, PSCapacityBarCategory *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  id v6 = [(PSCapacityBarCategory *)v4 bytes];
  if (v6 <= [(PSCapacityBarCategory *)v5 bytes])
  {
    id v8 = [(PSCapacityBarCategory *)v5 bytes];
    if (v8 <= [(PSCapacityBarCategory *)v4 bytes])
    {
      uint64_t v9 = [(PSCapacityBarCategory *)v4 title];
      id v10 = [(PSCapacityBarCategory *)v5 title];
      int64_t v7 = (int64_t)[v9 localizedCaseInsensitiveCompare:v10];
    }
    else
    {
      int64_t v7 = 1;
    }
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

void sub_9118(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = [v8 identifier];
  unsigned __int8 v6 = [v5 isEqualToString:STCategoryOtherDataKey];

  if ((v6 & 1) == 0)
  {
    int64_t v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    [v8 setColor:v7];
  }
}

void sub_91B4(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 200) propertyForKey:PSTableCellKey];
  [v2 refreshCellContentsWithSpecifier:*(void *)(*(void *)(a1 + 32) + 200)];
}

id sub_9224(uint64_t a1)
{
  return [*(id *)(a1 + 32) logSplunkData];
}

void sub_A2E0(uint64_t a1)
{
  id v2 = +[NSMutableArray arrayWithCapacity:16];
  uint64_t v3 = +[STStoragePluginManager sharedManager];
  uint64_t v4 = [v3 topTips];

  if ([v4 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v16 = v4;
    id obj = v4;
    id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v5)
    {
      id v6 = v5;
      int v7 = 0;
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        int v17 = v7;
        int v10 = -v7;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v9);
          if (v10 == v9)
          {
            [v2 addObject:*(void *)(*(void *)(a1 + 32) + 216)];
          }
          else
          {
            uint64_t v12 = +[PSSpecifier emptyGroupSpecifier];
            [v2 addObject:v12];
          }
          uint64_t v13 = objc_msgSend(v11, "specifier", v16);
          [v2 addObject:v13];

          id v14 = [v11 infoSpecifier];
          [v2 addObject:v14];

          v15 = +[NSValue valueWithPointer:*(void *)(a1 + 32)];
          [v11 setProperty:v15 forKey:@"_stController"];

          uint64_t v9 = (char *)v9 + 1;
        }
        while (v6 != v9);
        int v7 = v17 + v6;
        id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v6);
    }

    uint64_t v4 = v16;
  }
  objc_msgSend(*(id *)(a1 + 32), "setTipSpecs:", v2, v16);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A56C;
  block[3] = &unk_2CA90;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_A56C(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  id v2 = *(void **)(a1 + 32);

  return [v2 updateShowAllButton];
}

void sub_A624(uint64_t a1)
{
  [*(id *)(a1 + 32) updateCategories:0];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A6B4;
  block[3] = &unk_2CA90;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_A6B4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 264) reloadSpecifiers];
  if (STStorageIsInternalInstall())
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 264) apps];
    uint64_t v3 = +[NSMutableArray arrayWithArray:v2];

    [*(id *)(*(void *)(a1 + 32) + 240) setProperty:v3 forKey:STStorageDetailDataSizeKey];
  }
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 reloadSpecifiers];
}

id sub_A7DC(uint64_t a1)
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:"_updateApps:" object:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 performSelector:"_updateApps:" withObject:0 afterDelay:0.5];
}

int64_t sub_B9D0(id a1, PSSpecifier *a2, PSSpecifier *a3)
{
  uint64_t v4 = STStorageAppKey;
  id v5 = a3;
  id v6 = [(PSSpecifier *)a2 propertyForKey:v4];
  int v7 = [(PSSpecifier *)v5 propertyForKey:v4];

  uint64_t v8 = [v6 name];
  uint64_t v9 = [v7 name];
  id v10 = [v8 localizedCaseInsensitiveCompare:v9];

  return (int64_t)v10;
}

id sub_BA84(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 304), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 48);

  return [v2 becomeFirstResponder];
}

id sub_BB3C(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 304), 0);
}

int64_t sub_BE44(id a1, PSSpecifier *a2, PSSpecifier *a3)
{
  uint64_t v4 = STStorageAppKey;
  id v5 = a3;
  id v6 = [(PSSpecifier *)a2 propertyForKey:v4];
  int v7 = [(PSSpecifier *)v5 propertyForKey:v4];

  uint64_t v8 = [v6 name];
  uint64_t v9 = [v7 name];
  id v10 = [v8 localizedCaseInsensitiveCompare:v9];

  return (int64_t)v10;
}

void sub_BEF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 304));
  [WeakRetained setSpecifiers:*(void *)(a1 + 40)];
}

void sub_C1C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) name];
    id v6 = [v3 description];
    [v3 code];
    STLog();
  }
  else
  {
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_C2BC;
    block[3] = &unk_2CA90;
    block[4] = *(void *)(a1 + 40);
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_C2BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeSpecifier:*(void *)(*(void *)(a1 + 32) + OBJC_IVAR___PSViewController__specifier)];
}

void sub_C7C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v7 = v3;
  if (v3)
  {
    dispatch_time_t v5 = [v4 name];
    id v6 = [v7 description];
    [v7 code];
    STLog();
  }
  else
  {
    [v4 refreshAppState];
    if (([*(id *)(a1 + 32) isDemoted] & 1) == 0)
    {
      do
      {
        usleep(0x7A120u);
        [*(id *)(a1 + 32) refreshAppState];
      }
      while (![*(id *)(a1 + 32) isDemoted]);
    }
    dispatch_time_t v5 = [*(id *)(a1 + 32) name];
    STLog();
  }
}

void sub_CED0(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  uint64_t v9 = a1[4];
  STLog();
  id v7 = (void *)a1[5];
  uint64_t v6 = a1[6];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_CF90;
  v10[3] = &unk_2CD68;
  id v11 = v5;
  id v8 = v5;
  objc_msgSend(v7, "confirmDeleteApp:completionHandler:", v6, v10, v9);
}

uint64_t sub_CF90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_CFA0(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  uint64_t v9 = a1[4];
  STLog();
  id v7 = (void *)a1[5];
  uint64_t v6 = a1[6];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_D060;
  v10[3] = &unk_2CD68;
  id v11 = v5;
  id v8 = v5;
  objc_msgSend(v7, "confirmDemoteApp:completionHandler:", v6, v10, v9);
}

uint64_t sub_D060(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_D46C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setIcon:a2];
}

id sub_D5AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setParentController:*(void *)(a1 + 40)];
}

id sub_D8A4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setIcon:a2];
}

id sub_DA1C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectForKey:a3];
  id v8 = [*(id *)(a1 + 32) objectForKey:v6];

  id v9 = [v7 compare:v8];
  return v9;
}

int64_t sub_DA9C(id a1, id a2, id a3)
{
  return (int64_t)[a3 compare:a2];
}

int64_t sub_DAA8(id a1, id a2, id a3)
{
  uint64_t v4 = MPMediaItemPropertyFileSize;
  id v5 = a2;
  uint64_t v6 = [a3 valueForProperty:v4];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (_UNKNOWN **)v6;
  }
  else {
    id v8 = &off_2FF18;
  }
  id v9 = v8;

  id v10 = [v5 valueForProperty:v4];

  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = &off_2FF18;
  }
  uint64_t v12 = v11;

  id v13 = [v9 compare:v12];
  return (int64_t)v13;
}

void sub_DCE0(id a1)
{
  qword_3A520 = objc_alloc_init(STMediaCache);

  _objc_release_x1();
}

void sub_DD98(id a1)
{
  v11[0] = comAppleiTunesU;
  v10[0] = UsageMediaAudioCourses;
  v10[1] = UsageMediaVideoCourses;
  uint64_t v1 = +[NSArray arrayWithObjects:v10 count:2];
  v12[0] = v1;
  v11[1] = comApplePodcasts;
  v9[0] = UsageMediaAudioPodcasts;
  v9[1] = UsageMediaVideoPodcasts;
  id v2 = +[NSArray arrayWithObjects:v9 count:2];
  v12[1] = v2;
  v11[2] = comAppleBooks;
  uint64_t v8 = UsageMediaAudioBooks;
  id v3 = +[NSArray arrayWithObjects:&v8 count:1];
  v12[2] = v3;
  v11[3] = comAppleTV;
  uint64_t v7 = UsageMediaTVShows;
  uint64_t v4 = +[NSArray arrayWithObjects:&v7 count:1];
  v12[3] = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  uint64_t v6 = (void *)qword_3A530;
  qword_3A530 = v5;
}

uint64_t sub_F004(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 mediaCollectionForKey:a2];
  uint64_t v8 = [*(id *)(a1 + 32) mediaCollectionForKey:v6];

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v7) {
      uint64_t v11 = -1;
    }
    else {
      uint64_t v11 = v8 != 0;
    }
  }
  else
  {
    id v10 = [v7 totalSize];
    uint64_t v11 = (uint64_t)v10 < (uint64_t)[v8 totalSize];
  }

  return v11;
}

uint64_t sub_FE04(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 identifier];
  if (![v4 length])
  {
LABEL_7:
    [*(id *)(a1 + 40) addObject:v3];
    goto LABEL_8;
  }
  if (([v4 isEqualToString:@"com.apple.news"] & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 32) objectForKey:v4];
    id v6 = v5;
    if (v5)
    {
      [v5 addObject:v3];
    }
    else
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = +[NSMutableArray arrayWithObject:v3];
      [v7 setValue:v8 forKey:v4];
    }
    goto LABEL_7;
  }
LABEL_8:

  return 1;
}

int64_t sub_FED8(id a1, LSApplicationRecord *a2, LSApplicationRecord *a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = [(LSApplicationRecord *)a2 localizedName];
  id v6 = [(LSApplicationRecord *)v4 localizedName];

  id v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return (int64_t)v7;
}

int64_t sub_FF48(id a1, CacheManagementAsset *a2, CacheManagementAsset *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = a3;
  id v7 = [(CacheManagementAsset *)v4 consumedDate];
  uint64_t v8 = [(CacheManagementAsset *)v5 consumedDate];
  BOOL v9 = (void *)v8;
  if (!v7 || v8)
  {
    if (!v8 || v7)
    {
      uint64_t v11 = [(CacheManagementAsset *)v4 lastViewedDate];

      uint64_t v12 = [(CacheManagementAsset *)v5 lastViewedDate];

      if (!v11 || v12)
      {
        if (!v12 || v11)
        {
          id v13 = [(CacheManagementAsset *)v4 size];
          id v14 = [(CacheManagementAsset *)v5 size];
          if ((uint64_t)v13 <= (uint64_t)v14)
          {
            if ((uint64_t)v13 < (uint64_t)v14)
            {
              int64_t v10 = 1;
            }
            else
            {
              v15 = [(CacheManagementAsset *)v4 displayName];
              uint64_t v16 = [(CacheManagementAsset *)v5 displayName];
              int64_t v10 = (int64_t)[v15 localizedCaseInsensitiveCompare:v16];
            }
          }
          else
          {
            int64_t v10 = -1;
          }
          id v7 = (void *)v11;
        }
        else
        {
          id v7 = 0;
          int64_t v10 = 1;
        }
        BOOL v9 = (void *)v12;
      }
      else
      {
        BOOL v9 = 0;
        int64_t v10 = -1;
        id v7 = (void *)v11;
      }
    }
    else
    {
      int64_t v10 = 1;
    }
  }
  else
  {
    int64_t v10 = -1;
  }

  return v10;
}

int64_t sub_100B8(id a1, CacheManagementAsset *a2, CacheManagementAsset *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = a3;
  id v7 = [(CacheManagementAsset *)v4 consumedDate];
  uint64_t v8 = [(CacheManagementAsset *)v5 consumedDate];
  BOOL v9 = (void *)v8;
  if (!v7 || v8)
  {
    if (!v8 || v7)
    {
      uint64_t v11 = [(CacheManagementAsset *)v4 lastViewedDate];

      uint64_t v12 = [(CacheManagementAsset *)v5 lastViewedDate];

      if (!v11 || v12)
      {
        if (!v12 || v11)
        {
          id v13 = [(CacheManagementAsset *)v4 size];
          id v14 = [(CacheManagementAsset *)v5 size];
          if ((uint64_t)v13 <= (uint64_t)v14)
          {
            if ((uint64_t)v13 < (uint64_t)v14)
            {
              int64_t v10 = 1;
            }
            else
            {
              v15 = [(CacheManagementAsset *)v4 displayName];
              uint64_t v16 = [(CacheManagementAsset *)v5 displayName];
              int64_t v10 = (int64_t)[v15 localizedCaseInsensitiveCompare:v16];
            }
          }
          else
          {
            int64_t v10 = -1;
          }
          id v7 = (void *)v11;
        }
        else
        {
          id v7 = 0;
          int64_t v10 = 1;
        }
        BOOL v9 = (void *)v12;
      }
      else
      {
        BOOL v9 = 0;
        int64_t v10 = -1;
        id v7 = (void *)v11;
      }
    }
    else
    {
      int64_t v10 = 1;
    }
  }
  else
  {
    int64_t v10 = -1;
  }

  return v10;
}

void sub_102E8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) hlsSpecifiers];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 192);
  *(void *)(v3 + 192) = v2;

  dispatch_time_t v5 = dispatch_time(0, 10000000);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_103A8;
  v6[3] = &unk_2CF58;
  char v7 = *(unsigned char *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
}

id sub_103A8(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void **)(a1 + 32);
  if (v1) {
    return [v2 setSpecifiers:v2[24]];
  }
  else {
    return [v2 updateSpecifiers:*(void *)((char *)v2 + OBJC_IVAR___PSListController__specifiers) withSpecifiers:v2[24]];
  }
}

void sub_10670(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 code];
    id v6 = [v4 description];
    NSLog(@"Error %d removing video asset: %@", v5, v6);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10740;
    block[3] = &unk_2CA28;
    long long v8 = *(_OWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_10740(uint64_t a1)
{
  [*(id *)(a1 + 32) removeSpecifier:*(void *)(a1 + 40) animated:1];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 updateHLSSpecs];
}

id sub_10B4C(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_1115C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) thumbnailData];
  if (v2
    && (+[UIImage imageWithData:v2],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v4 = (void *)v3;
    id v5 = 0;
  }
  else
  {
    uint64_t v4 = +[UIImage systemImageNamed:@"film"];
    id v5 = +[UIColor systemGray3Color];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1127C;
  block[3] = &unk_2CA00;
  void block[4] = *(void *)(a1 + 40);
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_1127C(uint64_t a1)
{
  [*(id *)(a1 + 32) setTintColor:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setIcon:v2];
}

void sub_112BC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) size];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_11348;
  v3[3] = &unk_2CF88;
  v3[4] = *(void *)(a1 + 40);
  v3[5] = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

id sub_11348(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSize:*(void *)(a1 + 40)];
}

NSNumber *computedSize(void *a1)
{
  return +[NSNumber numberWithLongLong:*a1 - a1[2]];
}

void sub_12E34(uint64_t a1)
{
  uint64_t v2 = +[NSMutableDictionary dictionaryWithCapacity:4];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 232);
  *(void *)(v3 + 232) = v2;

  STMSizeOfFileTree();
  id v5 = +[NSNumber numberWithLongLong:v42 - v43];
  [*(id *)(*(void *)(a1 + 32) + 232) setObject:v5 forKeyedSubscript:@"Siri"];

  STMSizeOfFileTree();
  id v6 = +[NSNumber numberWithLongLong:v40 - v41];
  [*(id *)(*(void *)(a1 + 32) + 232) setObject:v6 forKeyedSubscript:@"MobileAssets"];

  STMSizeOfFileTree();
  id v7 = +[NSNumber numberWithLongLong:v38 - v39];
  [*(id *)(*(void *)(a1 + 32) + 232) setObject:v7 forKeyedSubscript:@"Spotlight"];

  long long v8 = +[NSMutableDictionary dictionaryWithCapacity:16];
  sub_13418(v8, @"/cores");
  sub_13418(v8, @"/var/log");
  sub_13418(v8, @"/var/logs");
  sub_13418(v8, @"/var/db/PanicReporter");
  sub_13418(v8, @"/var/db/systemstats");
  sub_13418(v8, @"/var/db/uuidtext");
  sub_13418(v8, @"/var/tmp/powerlog");
  sub_13418(v8, @"/var/wireless/Library/Logs");
  sub_13418(v8, @"/Library/Logs");
  sub_13418(v8, @"/var/mobile/Library/Logs");
  uint64_t v9 = +[NSMutableDictionary dictionaryWithCapacity:16];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 224);
  *(void *)(v10 + 224) = v9;

  sub_13418(*(void **)(*(void *)(a1 + 32) + 224), @"/var/mobile/Library/Logs/AutoBugCapture");
  sub_13418(*(void **)(*(void *)(a1 + 32) + 224), @"/var/mobile/Library/Logs/CrashReporter");
  uint64_t v12 = +[STStorageCacheDelete sharedMonitor];
  id v13 = [v12 cacheDeleteDict];

  uint64_t v26 = v13;
  uint64_t v25 = [v13 objectForKey:@"CACHE_DELETE_ITEMIZED_NONPURGEABLE"];
  uint64_t v14 = [v25 objectForKey:@"com.apple.logd.cachedelete"];
  if (v14) {
    [v8 setObject:v14 forKey:@"/var/db/diagnostics"];
  }
  uint64_t v27 = v8;
  objc_msgSend(*(id *)(a1 + 32), "setLogSizes:", v8, v14);
  memset(v37, 0, sizeof(v37));
  size_t v36 = 32;
  if (!sysctlbyname("vm.swapusage", v37, &v36, 0, 0)) {
    *(void *)(*(void *)(a1 + 32) + 184) = *(void *)&v37[0];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_134B0;
  block[3] = &unk_2CA90;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 256);
  id v15 = [obj countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v32;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        long long v20 = [*(id *)(*(void *)(a1 + 32) + 256) objectForKeyedSubscript:v19];
        long long v21 = [*(id *)(*(void *)(a1 + 32) + 272) objectForKeyedSubscript:v19];
        [v20 setApp:v21];
        if (v21)
        {
          [v20 setIsAppFound:1];
          long long v22 = [v21 appSize];
          long long v23 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v22 userTotal]);
          [v20 setReportedSize:v23];
        }
        else
        {
          [v20 setReportedSize:&off_2FF30];
        }
        [v20 fetchSize];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_134B8;
        v30[3] = &unk_2CA90;
        v30[4] = *(void *)(a1 + 32);
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v30);
      }
      id v16 = [obj countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v16);
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_134C0;
  v29[3] = &unk_2CA90;
  v29[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v29);
}

void sub_13418(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  STMSizeOfFileTree();
  id v5 = +[NSNumber numberWithLongLong:0];
  [v4 setObject:v5 forKey:v3];
}

id sub_134B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_134B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_134C0(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 200) = 1;
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_134DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

int64_t sub_1444C(id a1, id a2, id a3)
{
  return (int64_t)[a3 compare:a2];
}

void RoundToSignificantDigits(int a1, double a2)
{
  if (a2 != 0.0)
  {
    double v3 = log10(fabs(a2));
    __exp10((double)a1 - ceil(v3));
  }
}

void sub_14960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

uint64_t sub_1498C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1499C(uint64_t a1)
{
}

void sub_149A4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v7 || v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
  }
  else
  {
    uint64_t v11 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id obj = 0;
    uint64_t v12 = +[NSPropertyListSerialization propertyListWithData:v7 options:0 format:0 error:&obj];
    objc_storeStrong(v11, obj);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v13 = [v12 objectForKeyedSubscript:@"bag"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        id v28 = 0;
        id v15 = +[NSPropertyListSerialization propertyListWithData:v13 options:0 format:0 error:&v28];
        objc_storeStrong(v14, v28);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
        {
          id v16 = [v15 objectForKeyedSubscript:@"metrics"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v17 = [v16 objectForKeyedSubscript:@"metricsUrl"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v27 = [v17 stringByAppendingString:@"/2/xp_ios_storage_mgmt"];
              uint64_t v18 = +[NSURL URLWithString:](NSURL, "URLWithString:");
              uint64_t v19 = *(void *)(a1 + 32);
              long long v20 = *(void **)(v19 + 8);
              *(void *)(v19 + 8) = v18;

              long long v21 = [*(id *)(*(void *)(a1 + 32) + 8) scheme];
              unsigned __int8 v26 = [v21 isEqualToString:@"https"];

              if ((v26 & 1) == 0)
              {
                uint64_t v22 = *(void *)(a1 + 32);
                long long v23 = *(void **)(v22 + 8);
                *(void *)(v22 + 8) = 0;
              }
            }
          }
        }
      }
    }
  }
  long long v24 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v24)
  {
    uint64_t v25 = [v24 description];
    NSLog(@"Unable to fetch splunk endpoint: %@", v25);
  }
  else if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    NSLog(@"Malformed iTunes bag payload!");
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_14D14(uint64_t a1)
{
  v22[0] = @"postTime";
  uint64_t v2 = +[NSDate date];
  [v2 timeIntervalSince1970];
  id v4 = +[NSNumber numberWithLong:1000 * (uint64_t)v3];

  v22[1] = @"events";
  v23[0] = v4;
  id v5 = [*(id *)(a1 + 32) events];
  v23[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

  id v7 = [*(id *)(a1 + 32) events];
  if ((unint64_t)[v7 count] >= 0x3E8) {
    sub_1DFC4();
  }

  objc_initWeak(&location, *(id *)(a1 + 32));
  id v8 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  id v9 = objc_loadWeakRetained(&location);
  uint64_t v10 = +[NSURLSession sessionWithConfiguration:v8 delegate:v9 delegateQueue:0];

  uint64_t v11 = [*(id *)(a1 + 32) splunkUploadURL];
  id v12 = objc_alloc_init((Class)NSMutableURLRequest);
  [v12 setURL:v11];
  [v12 setHTTPMethod:@"POST"];
  id v20 = 0;
  id v13 = +[NSJSONSerialization dataWithJSONObject:v6 options:0 error:&v20];
  id v14 = v20;
  id v15 = [*(id *)(a1 + 32) events];
  [v15 removeAllObjects];

  if (!v13 || v14)
  {
    NSLog(@"Failed to serialize Splunk payload: %@", v14);
  }
  else
  {
    if ((unint64_t)[v13 length] >= 0x100000) {
      __assert_rtn("-[SplunkLogger postEvents]_block_invoke", "SplunkLogger.m", 239, "postData.length < MAX_SPLUNK_LOG_SIZE_BYTES");
    }
    [v12 setHTTPBody:v13];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_15070;
    v18[3] = &unk_2CFF8;
    id v16 = dispatch_semaphore_create(0);
    uint64_t v19 = v16;
    uint64_t v17 = [v10 dataTaskWithRequest:v12 completionHandler:v18];
    NSLog(@"Splunk upload start");
    [v17 resume];
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  }
  objc_destroyWeak(&location);
}

void sub_15040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_15070(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v8 = a3;
  if (a4)
  {
    NSLog(@"Error in uploading the events to splunk: %@", a4);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v8;
      if ((uint64_t)[v6 statusCode] < 200 || (uint64_t)objc_msgSend(v6, "statusCode") > 299) {
        NSLog(@"Splunk upload unexpected status: %d", [v6 statusCode]);
      }
      else {
        NSLog(@"Splunk upload success");
      }
    }
    else
    {
      id v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      NSLog(@"Received the wrong kind of response: %@", v6);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_152BC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) events];
  [v2 addObject:*(void *)(a1 + 40)];
}

void sub_15644(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_156BC;
  block[3] = &unk_2CA90;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_156BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 296))
  {
    id v14 = *(id *)(v1 + 184);
    unsigned int v3 = [v14 state];
    BOOL v4 = v3 == 3 || v3 == 0;
    id v5 = v14;
    if (v4)
    {
      id v6 = [v14 appSize];
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(v7 + 248);
      uint64_t v9 = *(void *)(v7 + 256);
      if ([v14 isDemoted])
      {
        *(void *)(*(void *)(a1 + 32) + 248) = 0;
        id v10 = [v6 userTotal];
      }
      else
      {
        *(void *)(*(void *)(a1 + 32) + 248) = [v6 fixed];
        id v10 = [v6 docsAndData];
      }
      *(void *)(*(void *)(a1 + 32) + 256) = v10;
      uint64_t v11 = *(void **)(a1 + 32);
      if (v8 != v11[31])
      {
        uint64_t v12 = v11[28];
        if (v12)
        {
          [v11 reloadSpecifier:v12 animated:0];
          uint64_t v11 = *(void **)(a1 + 32);
        }
      }
      if (v9 != v11[32])
      {
        uint64_t v13 = v11[29];
        if (v13) {
          [v11 reloadSpecifier:v13 animated:0];
        }
      }

      id v5 = v14;
    }
  }
}

id sub_15818(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 184) refreshAppState];
  id v2 = *(void **)(a1 + 32);

  return [v2 syncUI];
}

id sub_15BA4(id result)
{
  uint64_t v1 = *((void *)result + 4);
  int v2 = *((_DWORD *)result + 10);
  if (*(_DWORD *)(v1 + 192) != v2)
  {
    *(_DWORD *)(v1 + 192) = v2;
    return [*((id *)result + 4) reloadSpecifiers];
  }
  return result;
}

void sub_15DE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = [*(id *)(a1 + 32) name];
    id v6 = [v3 description];
    [v3 code];
    STLog();
  }
  else
  {
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_15EE8;
    block[3] = &unk_2CA90;
    void block[4] = *(void *)(a1 + 40);
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 296) = 0;
}

void sub_15EE8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + OBJC_IVAR___PSViewController__parentController));
  [WeakRetained removeSpecifier:*(void *)(*(void *)(a1 + 32) + OBJC_IVAR___PSViewController__specifier)];
  int v2 = [WeakRetained navigationController];
  id v3 = [v2 popViewControllerAnimated:1];
}

void sub_16498(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  id v8 = v3;
  if (v3)
  {
    dispatch_time_t v5 = [v4 name];
    uint64_t v7 = [v8 description];
    [v8 code];
    id v6 = v5;
    STLog();
  }
  else
  {
    [v4 refreshAppState];
    if (([*(id *)(a1 + 32) isDemoted] & 1) == 0)
    {
      do
      {
        usleep(0x7A120u);
        [*(id *)(a1 + 32) refreshAppState];
      }
      while (![*(id *)(a1 + 32) isDemoted]);
    }
    dispatch_time_t v5 = [*(id *)(a1 + 32) name];
    id v6 = v5;
    STLog();
  }

  objc_msgSend(*(id *)(a1 + 40), "syncUI", v6);
  *(unsigned char *)(*(void *)(a1 + 40) + 296) = 0;
}

void sub_16A2C(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    [*(id *)(a1 + 32) setUIState:*(unsigned int *)(a1 + 48)];
    [*(id *)(a1 + 32) showAlertForFailedInstallation];
    id v3 = [v6 code];
    BOOL v4 = [v6 description];
    id v5 = v3;
  }
  else
  {
    [*(id *)(a1 + 40) refreshAppState];
    if ([*(id *)(a1 + 40) isDemoted])
    {
      do
      {
        usleep(0x7A120u);
        [*(id *)(a1 + 40) refreshAppState];
      }
      while (([*(id *)(a1 + 40) isDemoted] & 1) != 0);
    }
    BOOL v4 = [*(id *)(a1 + 40) name];
    id v5 = v4;
  }
  STLog();

  objc_msgSend(*(id *)(a1 + 32), "syncUI", v5);
  *(unsigned char *)(*(void *)(a1 + 32) + 296) = 0;
}

uint64_t sub_16B34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_16BBC(uint64_t a1)
{
  int v2 = STStorageLocStr(@"REINSTALLATION_FAILED_DESCRIPTION");
  id v3 = [*(id *)(*(void *)(a1 + 32) + 184) name];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v4 = STStorageLocStr(@"REINSTALLATION_FAILED_TITLE");
  id v5 = +[UIAlertController alertControllerWithTitle:v4 message:v7 preferredStyle:1];

  id v6 = +[UIAlertAction actionWithTitle:@"Ok" style:1 handler:0];
  [v5 addAction:v6];
  [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
}

uint64_t sub_17328(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 consumedDate];

  uint64_t v5 = 32;
  if (!v4) {
    uint64_t v5 = 40;
  }
  [*(id *)(a1 + v5) addObject:v3];

  return 1;
}

int64_t sub_1738C(id a1, CacheManagementAsset *a2, CacheManagementAsset *a3)
{
  BOOL v4 = a2;
  uint64_t v5 = a3;
  uint64_t v6 = [(CacheManagementAsset *)v4 lastViewedDate];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [(CacheManagementAsset *)v5 lastViewedDate];

    if (!v8) {
      goto LABEL_6;
    }
  }
  uint64_t v9 = [(CacheManagementAsset *)v5 lastViewedDate];
  if (v9)
  {
    id v10 = (void *)v9;
    uint64_t v11 = [(CacheManagementAsset *)v4 lastViewedDate];

    if (!v11)
    {
LABEL_8:
      int64_t v13 = 1;
      goto LABEL_10;
    }
  }
  id v12 = [(CacheManagementAsset *)v4 size];
  if ((uint64_t)v12 <= (uint64_t)[(CacheManagementAsset *)v5 size])
  {
    id v14 = [(CacheManagementAsset *)v4 size];
    if ((uint64_t)v14 >= (uint64_t)[(CacheManagementAsset *)v5 size])
    {
      id v15 = [(CacheManagementAsset *)v4 displayName];
      id v16 = [(CacheManagementAsset *)v5 displayName];
      int64_t v13 = (int64_t)[v15 localizedCaseInsensitiveCompare:v16];

      goto LABEL_10;
    }
    goto LABEL_8;
  }
LABEL_6:
  int64_t v13 = -1;
LABEL_10:

  return v13;
}

int64_t sub_174B8(id a1, CacheManagementAsset *a2, CacheManagementAsset *a3)
{
  BOOL v4 = a2;
  uint64_t v5 = a3;
  id v6 = [(CacheManagementAsset *)v4 size];
  if ((uint64_t)v6 <= (uint64_t)[(CacheManagementAsset *)v5 size])
  {
    id v8 = [(CacheManagementAsset *)v4 size];
    if ((uint64_t)v8 >= (uint64_t)[(CacheManagementAsset *)v5 size])
    {
      uint64_t v9 = [(CacheManagementAsset *)v4 displayName];
      id v10 = [(CacheManagementAsset *)v5 displayName];
      int64_t v7 = (int64_t)[v9 localizedCaseInsensitiveCompare:v10];
    }
    else
    {
      int64_t v7 = 1;
    }
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

void sub_17614(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) hlsSpecifiers];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 304);
  *(void *)(v3 + 304) = v2;

  dispatch_time_t v5 = dispatch_time(0, 10000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_176CC;
  block[3] = &unk_2CA90;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_176CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_17990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_179A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_179B8(uint64_t a1)
{
}

intptr_t sub_179C0(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 UIImage];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_time_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

void sub_17B08(uint64_t a1)
{
  STStorageDeviceKey();
  id v58 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [*(id *)(a1 + 32) spinnerSpecifier];
  uint64_t v3 = (void *)qword_3A548;
  qword_3A548 = v2;

  uint64_t v4 = STStorageLocStr(@"UNINSTALL_APP");
  uint64_t v5 = +[PSSpecifier deleteButtonSpecifierWithName:v4 target:*(void *)(a1 + 32) action:"confirmDemoteApp"];
  id v6 = (void *)qword_3A550;
  qword_3A550 = v5;

  int64_t v7 = STStorageLocStr(@"REINSTALL_APP");
  uint64_t v8 = +[PSSpecifier deleteButtonSpecifierWithName:v7 target:*(void *)(a1 + 32) action:"reinstallApp"];
  uint64_t v9 = (void *)qword_3A558;
  qword_3A558 = v8;

  id v10 = STStorageLocStr(@"REINSTALL_HEALTH_APP");
  uint64_t v11 = +[PSSpecifier deleteButtonSpecifierWithName:v10 target:*(void *)(a1 + 32) action:"reinstallApp"];
  id v12 = (void *)qword_3A560;
  qword_3A560 = v11;

  int64_t v13 = STStorageLocStr(@"DELETE_APP");
  uint64_t v14 = +[PSSpecifier deleteButtonSpecifierWithName:v13 target:*(void *)(a1 + 32) action:"confirmDeleteApp"];
  id v15 = (void *)qword_3A568;
  qword_3A568 = v14;

  id v16 = STStorageLocStr(@"DELETE_DATA");
  uint64_t v17 = +[PSSpecifier deleteButtonSpecifierWithName:v16 target:*(void *)(a1 + 32) action:"confirmDeleteApp"];
  uint64_t v18 = (void *)qword_3A570;
  qword_3A570 = v17;

  uint64_t v19 = STStorageLocStr(@"DELETE_APPCLIP");
  uint64_t v20 = +[PSSpecifier deleteButtonSpecifierWithName:v19 target:*(void *)(a1 + 32) action:"confirmDeleteApp"];
  long long v21 = (void *)qword_3A578;
  qword_3A578 = v20;

  uint64_t v22 = +[PSSpecifier emptyGroupSpecifier];
  long long v23 = (void *)qword_3A580;
  qword_3A580 = v22;

  long long v24 = (void *)qword_3A580;
  uint64_t v25 = STStorageLocStr(@"UNINSTALL_INFO");
  uint64_t v26 = PSFooterTextGroupKey;
  [v24 setProperty:v25 forKey:PSFooterTextGroupKey];

  uint64_t v27 = +[PSSpecifier emptyGroupSpecifier];
  id v28 = (void *)qword_3A588;
  qword_3A588 = v27;

  uint64_t v29 = (void *)qword_3A588;
  uint64_t v30 = +[NSString stringWithFormat:@"REINSTALL_INFO_%@", v58];
  long long v31 = STStorageLocStr(v30);
  [v29 setProperty:v31 forKey:v26];

  uint64_t v32 = +[PSSpecifier emptyGroupSpecifier];
  long long v33 = (void *)qword_3A590;
  qword_3A590 = v32;

  long long v34 = (void *)qword_3A590;
  uint64_t v35 = +[NSString stringWithFormat:@"REINSTALL_HEALTH_INFO_%@", v58];
  size_t v36 = STStorageLocStr(v35);
  [v34 setProperty:v36 forKey:v26];

  uint64_t v37 = +[PSSpecifier emptyGroupSpecifier];
  uint64_t v38 = (void *)qword_3A598;
  qword_3A598 = v37;

  uint64_t v39 = (void *)qword_3A598;
  uint64_t v40 = +[NSString stringWithFormat:@"DELETE_INFO_%@", v58];
  uint64_t v41 = STStorageLocStr(v40);
  [v39 setProperty:v41 forKey:v26];

  uint64_t v42 = +[PSSpecifier emptyGroupSpecifier];
  uint64_t v43 = (void *)qword_3A5A0;
  qword_3A5A0 = v42;

  v44 = (void *)qword_3A5A0;
  v45 = +[NSString stringWithFormat:@"DELETE_APPCLIP_INFO_%@", v58];
  v46 = STStorageLocStr(v45);
  [v44 setProperty:v46 forKey:v26];

  uint64_t v47 = +[PSSpecifier emptyGroupSpecifier];
  v48 = (void *)qword_3A5A8;
  qword_3A5A8 = v47;

  v49 = (void *)qword_3A5A8;
  v50 = +[NSString stringWithFormat:@"DELETE_DATA_INFO_%@", v58];
  v51 = STStorageLocStr(v50);
  [v49 setProperty:v51 forKey:v26];

  v52 = (void *)qword_3A558;
  v53 = +[UIColor systemBlueColor];
  [v52 setProperty:v53 forKey:@"buttonColor"];

  v54 = (void *)qword_3A560;
  v55 = +[UIColor systemBlueColor];
  [v54 setProperty:v55 forKey:@"buttonColor"];

  v56 = (void *)qword_3A550;
  v57 = +[UIColor systemBlueColor];
  [v56 setProperty:v57 forKey:@"buttonColor"];
}

void sub_1815C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_18174(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_19858(uint64_t a1)
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:"_syncUI:" object:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 performSelector:"_syncUI:" withObject:0 afterDelay:1.0];
}

id sub_199B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_19CB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 code];
    uint64_t v5 = [v4 description];
    STLog();
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_19D8C;
    block[3] = &unk_2CA28;
    long long v7 = *(_OWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_19D8C(uint64_t a1)
{
  [*(id *)(a1 + 32) removeSpecifier:*(void *)(a1 + 40) animated:1];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 updateHLSSpecs];
}

void sub_19FB0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v9 = 0;
  [v2 removeItemAtURL:v3 error:&v9];
  id v4 = v9;
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 code];
    uint64_t v6 = [v5 description];

    STLog();
    uint64_t v5 = (void *)v6;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1A0A0;
    block[3] = &unk_2CA28;
    long long v8 = *(_OWORD *)(a1 + 48);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_1A0A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeSpecifier:*(void *)(a1 + 40) animated:1];
}

void sub_1A2E4(uint64_t a1)
{
  uint64_t v2 = +[MPMediaLibrary defaultMediaLibrary];
  unsigned int v3 = [v2 removeItems:*(void *)(a1 + 32)];

  if (v3)
  {
    long long v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    id v9 = sub_1A3C4;
    id v10 = &unk_2CA28;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v11 = v4;
    uint64_t v12 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v7);
    uint64_t v6 = +[STMediaCache sharedCache];
    [v6 reload];
  }
}

void sub_1A3C4(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "removeSpecifier:animated:", *(void *)(*((void *)&v7 + 1) + 8 * (void)v6), 1, (void)v7);
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

id sub_1AC3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeSpecifier:*(void *)(a1 + 40) animated:1];
}

void sub_1B46C(id a1)
{
  qword_3A5B0 = objc_alloc_init(STStoragePluginManager);

  _objc_release_x1();
}

void sub_1B69C(uint64_t a1)
{
  uint64_t v43 = +[NSMutableDictionary dictionaryWithCapacity:10];
  uint64_t v1 = +[NSMutableDictionary dictionaryWithCapacity:4];
  id v2 = +[NSMutableDictionary dictionaryWithCapacity:4];
  id v3 = +[NSFileManager defaultManager];
  uint64_t v38 = +[NSURL fileURLWithPath:@"/System/Library/PreferenceBundles/StoragePlugins/" isDirectory:1];
  uint64_t v39 = v3;
  objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v58;
    long long v7 = &AnalyticsSendEventLazy_ptr;
    uint64_t v41 = *(void *)v58;
    do
    {
      long long v8 = 0;
      id v42 = v5;
      do
      {
        if (*(void *)v58 != v6) {
          objc_enumerationMutation(obj);
        }
        long long v9 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v8);
        long long v10 = objc_msgSend(v7[142], "bundleWithURL:", v9, v36, v37);
        id v56 = 0;
        unsigned __int8 v11 = [v10 loadAndReturnError:&v56];
        id v12 = v56;
        int64_t v13 = v12;
        if ((v11 & 1) == 0)
        {
          id v16 = [v9 lastPathComponent];
          [v13 localizedDescription];
          v37 = size_t v36 = v16;
          STLog();

          goto LABEL_38;
        }
        id v46 = v12;
        uint64_t v47 = v10;
        uint64_t v14 = (objc_class *)[v10 principalClass];
        if (v14)
        {
          id v15 = objc_alloc_init(v14);
          id v16 = v15;
          v45 = v8;
          if (v15)
          {
            uint64_t v17 = [v15 identifier];
            [v43 setObject:v16 forKey:v17];

            if (objc_opt_respondsToSelector())
            {
              uint64_t v18 = [v16 documentAppIdentifiers];
              long long v52 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              id v19 = [v18 countByEnumeratingWithState:&v52 objects:v62 count:16];
              if (v19)
              {
                id v20 = v19;
                uint64_t v21 = *(void *)v53;
                do
                {
                  for (i = 0; i != v20; i = (char *)i + 1)
                  {
                    if (*(void *)v53 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    uint64_t v23 = *(void *)(*((void *)&v52 + 1) + 8 * i);
                    long long v24 = [v1 objectForKey:v23];
                    uint64_t v25 = v24;
                    if (v24)
                    {
                      [v24 addObject:v16];
                    }
                    else
                    {
                      uint64_t v26 = +[NSMutableArray arrayWithObject:v16];
                      [v1 setObject:v26 forKey:v23];
                    }
                  }
                  id v20 = [v18 countByEnumeratingWithState:&v52 objects:v62 count:16];
                }
                while (v20);
              }

              uint64_t v6 = v41;
              id v5 = v42;
              long long v7 = &AnalyticsSendEventLazy_ptr;
              long long v8 = v45;
            }
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              goto LABEL_37;
            }
            uint64_t v27 = [v16 externDataSizeAppIdentifiers];
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            id v28 = [v27 countByEnumeratingWithState:&v48 objects:v61 count:16];
            if (v28)
            {
              id v29 = v28;
              uint64_t v30 = *(void *)v49;
              do
              {
                for (j = 0; j != v29; j = (char *)j + 1)
                {
                  if (*(void *)v49 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  uint64_t v32 = *(void *)(*((void *)&v48 + 1) + 8 * (void)j);
                  long long v33 = [v2 objectForKey:v32];
                  long long v34 = v33;
                  if (v33)
                  {
                    [v33 addObject:v16];
                  }
                  else
                  {
                    uint64_t v35 = +[NSMutableArray arrayWithObject:v16];
                    [v2 setObject:v35 forKey:v32];
                  }
                }
                id v29 = [v27 countByEnumeratingWithState:&v48 objects:v61 count:16];
              }
              while (v29);
              uint64_t v6 = v41;
              id v5 = v42;
              long long v7 = &AnalyticsSendEventLazy_ptr;
            }
          }
          else
          {
            uint64_t v27 = [v9 lastPathComponent];
            size_t v36 = v27;
            STLog();
          }

          long long v8 = v45;
        }
        else
        {
          id v16 = [v9 lastPathComponent];
          size_t v36 = v16;
          STLog();
        }
LABEL_37:
        int64_t v13 = v46;
        long long v10 = v47;
LABEL_38:

        long long v8 = (char *)v8 + 1;
      }
      while (v8 != v5);
      id v5 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v5);
  }
  objc_msgSend(*(id *)(a1 + 32), "setPluginsByID:", v43, v36);
  [*(id *)(a1 + 32) setDocPluginsByID:v1];
  [*(id *)(a1 + 32) setExternDataPluginsByID:v2];
}

void sub_1BC58(uint64_t a1)
{
  uint64_t v1 = a1;
  id v2 = [*(id *)(a1 + 32) tips];
  id v28 = v2;
  if (![v2 count])
  {
    uint64_t v26 = [*(id *)(v1 + 40) tipsByPluginID];
    uint64_t v27 = [*(id *)(v1 + 32) identifier];
    [v26 removeObjectForKey:v27];
    goto LABEL_34;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v2;
  id v3 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (!v3) {
    goto LABEL_32;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)v36;
  uint64_t v29 = *(void *)v36;
  uint64_t v30 = v1;
  do
  {
    uint64_t v6 = 0;
    id v31 = v4;
    do
    {
      if (*(void *)v36 != v5) {
        objc_enumerationMutation(obj);
      }
      long long v7 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v6);
      long long v8 = [*(id *)(v1 + 32) identifier];
      [v7 setProperty:v8 forKey:@"_stPluginID"];

      long long v9 = [v7 propertyForKey:@"_stTipID"];

      if (!v9)
      {
        long long v10 = [v7 title];
        [v7 setProperty:v10 forKey:@"_stTipID"];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v34 = v6;
        id v11 = v7;
        id v12 = [v11 significantItems];
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v13 = [v12 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v13)
        {
          id v14 = v13;
          long long v33 = v11;
          uint64_t v15 = 0;
          int v16 = 0;
          int v17 = 0;
          uint64_t v18 = 0;
          uint64_t v19 = *(void *)v40;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v40 != v19) {
                objc_enumerationMutation(v12);
              }
              uint64_t v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              unsigned int v22 = [v21 isRecoverable];
              id v23 = [v21 size];
              if (v22)
              {
                ++v17;
              }
              else
              {
                v15 += (uint64_t)v23;
                ++v16;
              }
              if (v22) {
                v18 += (uint64_t)v23;
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v39 objects:v44 count:16];
          }
          while (v14);
          if (v17)
          {
            long long v24 = +[NSNumber numberWithLongLong:v18 / v17];
            id v11 = v33;
            [v33 setProperty:v24 forKey:@"_stRecAvg"];

            uint64_t v5 = v29;
            uint64_t v1 = v30;
            if (!v16) {
              goto LABEL_24;
            }
LABEL_28:
            uint64_t v25 = +[NSNumber numberWithLongLong:v15 / v16];
            [v11 setProperty:v25 forKey:@"_stNonRecAvg"];

            goto LABEL_29;
          }
          uint64_t v5 = v29;
          uint64_t v1 = v30;
          id v11 = v33;
        }
        else
        {
          int v16 = 0;
          uint64_t v15 = 0;
        }
        [v11 setProperty:0 forKey:@"_stRecAvg"];
        if (v16) {
          goto LABEL_28;
        }
LABEL_24:
        [v11 setProperty:0 forKey:@"_stNonRecAvg"];
LABEL_29:
        id v4 = v31;
        uint64_t v6 = v34;
      }
      uint64_t v6 = (char *)v6 + 1;
    }
    while (v6 != v4);
    id v4 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  }
  while (v4);
LABEL_32:

  uint64_t v26 = [*(id *)(v1 + 40) tipsByPluginID];
  uint64_t v27 = [*(id *)(v1 + 32) identifier];
  [v26 setObject:obj forKey:v27];
LABEL_34:
}

void sub_1C3B8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pluginsByID];
  id v3 = [v2 allValues];

  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[v3 count] + 1);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = objc_msgSend(*(id *)(a1 + 32), "loadTipsOperation:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v9), (void)v11);
        [v4 addObject:v10];

        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [*(id *)(*(void *)(a1 + 32) + 16) addOperations:v4 waitUntilFinished:1];
}

id sub_1C528(uint64_t a1)
{
  [*(id *)(a1 + 32) updateTipIndexes];
  id v2 = *(void **)(a1 + 32);

  return [v2 notifyTipsChanged];
}

id sub_1C624(uint64_t a1)
{
  [*(id *)(a1 + 32) updateTipIndexes];
  id v2 = *(void **)(a1 + 32);

  return [v2 notifyTipsChanged];
}

int64_t sub_1C8AC(id a1, STStorageTip *a2, STStorageTip *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  unsigned __int8 v7 = objc_opt_isKindOfClass();
  if (isKindOfClass & 1) != 0 && (v7)
  {
    uint64_t v8 = v4;
    long long v9 = v5;
    if ([(STStorageTip *)v8 immediateGain] || [(STStorageTip *)v9 immediateGain])
    {
      id v10 = [(STStorageTip *)v8 immediateGain];
      id v11 = [(STStorageTip *)v9 immediateGain];
      goto LABEL_6;
    }
    if ([(STStorageTip *)v8 eventualGain] || [(STStorageTip *)v9 eventualGain])
    {
      id v10 = [(STStorageTip *)v8 eventualGain];
      id v11 = [(STStorageTip *)v9 eventualGain];
LABEL_6:
      if ((uint64_t)v10 < (uint64_t)v11) {
        int64_t v12 = 1;
      }
      else {
        int64_t v12 = -1;
      }
      goto LABEL_41;
    }
    int64_t v31 = [(STStorageTip *)v8 sortSize];
    int64_t v32 = [(STStorageTip *)v9 sortSize];
    if (v31 < v32) {
      int64_t v12 = 1;
    }
    else {
      int64_t v12 = -1;
    }
    if (v31 | v32) {
      goto LABEL_41;
    }

LABEL_40:
    uint64_t v8 = [(STStorageTip *)v4 title];
    long long v9 = [(STStorageTip *)v5 title];
    int64_t v12 = (int64_t)[(STStorageTip *)v8 localizedCaseInsensitiveCompare:v9];
LABEL_41:

    goto LABEL_42;
  }
  if (isKindOfClass) {
    long long v13 = v4;
  }
  else {
    long long v13 = v5;
  }
  if ((isKindOfClass | v7))
  {
    if (isKindOfClass) {
      long long v14 = v5;
    }
    else {
      long long v14 = v4;
    }
    uint64_t v8 = v13;
    uint64_t v15 = v14;
    long long v9 = [(STStorageTip *)v15 propertyForKey:@"_stRecAvg"];
    int v16 = [(STStorageTip *)v15 propertyForKey:@"_stNonRecAvg"];

    if (![(STStorageTip *)v8 immediateGain]
      || v9
      && (id v17 = [(STStorageTip *)v9 longLongValue],
          (uint64_t)v17 > (uint64_t)[(STStorageTip *)v8 immediateGain])
      || v16
      && (id v18 = [(STStorageTip *)v9 longLongValue],
          (uint64_t)v18 > (uint64_t)[(STStorageTip *)v8 immediateGain]))
    {
      BOOL v19 = (isKindOfClass & 1) == 0;
      uint64_t v20 = 1;
    }
    else
    {
      BOOL v19 = (isKindOfClass & 1) == 0;
      uint64_t v20 = -1;
    }
    if (v19) {
      int64_t v12 = -v20;
    }
    else {
      int64_t v12 = v20;
    }

    goto LABEL_41;
  }
  uint64_t v21 = v4;
  unsigned int v22 = v5;
  uint64_t v23 = [(STStorageTip *)v21 propertyForKey:@"_stRecAvg"];
  uint64_t v24 = [(STStorageTip *)v22 propertyForKey:@"_stRecAvg"];
  if (v23 | v24
    || ([(STStorageTip *)v21 propertyForKey:@"_stNonRecAvg"],
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        [(STStorageTip *)v22 propertyForKey:@"_stNonRecAvg"],
        uint64_t v24 = objc_claimAutoreleasedReturnValue(),
        v23 | v24))
  {
    uint64_t v25 = (void *)v24;
    id v26 = [(id)v23 longLongValue];
    if ((uint64_t)v26 > (uint64_t)[v25 longLongValue]) {
      int64_t v12 = -1;
    }
    else {
      int64_t v12 = 1;
    }

    BOOL v27 = 0;
  }
  else
  {
    int64_t v28 = [(STStorageTip *)v21 sortSize];
    int64_t v29 = [(STStorageTip *)v22 sortSize];
    BOOL v27 = (v28 | v29) == 0;
    if (v28 < v29) {
      int64_t v12 = 1;
    }
    else {
      int64_t v12 = -1;
    }
  }

  if (v27) {
    goto LABEL_40;
  }
LABEL_42:

  return v12;
}

int64_t sub_1CBC4(id a1, STStorageTip *a2, STStorageTip *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  if ((isKindOfClass & 1) == (objc_opt_isKindOfClass() & 1))
  {
    if (isKindOfClass) {
      goto LABEL_14;
    }
    uint64_t v8 = v4;
    long long v9 = v5;
    uint64_t v10 = [(STStorageTip *)v8 propertyForKey:@"_stRecAvg"];
    uint64_t v11 = [(STStorageTip *)v9 propertyForKey:@"_stRecAvg"];
    if (v10 | v11
      || (int64_t v7 = (int64_t)@"_stNonRecAvg",
          [(STStorageTip *)v8 propertyForKey:@"_stNonRecAvg"],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          [(STStorageTip *)v9 propertyForKey:@"_stNonRecAvg"],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          v10 | v11))
    {
      int64_t v12 = (void *)v11;
      id v13 = [(id)v10 longLongValue];
      int64_t v7 = (uint64_t)v13 > (uint64_t)[v12 longLongValue] ? -1 : 1;

      int v14 = 0;
    }
    else
    {
      int v14 = 1;
    }

    if (v14)
    {
LABEL_14:
      int64_t v15 = [(STStorageTip *)v4 sortSize];
      int64_t v16 = [(STStorageTip *)v5 sortSize];
      if (v15 | v16)
      {
        if (v15 < v16) {
          int64_t v7 = 1;
        }
        else {
          int64_t v7 = -1;
        }
      }
      else
      {
        id v17 = [(STStorageTip *)v4 title];
        id v18 = [(STStorageTip *)v5 title];
        int64_t v7 = (int64_t)[v17 localizedCaseInsensitiveCompare:v18];
      }
    }
  }
  else if (isKindOfClass)
  {
    int64_t v7 = -1;
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

int64_t sub_1D24C(id a1, STStorageTip *a2, STStorageTip *a3)
{
  id v4 = a3;
  id v5 = [(STStorageTip *)a2 title];
  id v6 = [(STStorageTip *)v4 title];

  id v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return (int64_t)v7;
}

void sub_1DE28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DE54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1DF34;
  block[3] = &unk_2D218;
  id v9 = a3;
  id v6 = v9;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  id v10 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v11);
}

void sub_1DF34(uint64_t a1)
{
  if (*(void *)(a1 + 32)
    || ([*(id *)(a1 + 40) UIImage],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    uint64_t v2 = PSBlankIconImage();
  }
  else
  {
    uint64_t v2 = [*(id *)(a1 + 40) UIImage];
  }
  id v5 = (id)v2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setIcon:v5];
}

void sub_1DFC4()
{
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyMultiple(keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

uint64_t CacheManagementEnumerateAssets()
{
  return _CacheManagementEnumerateAssets();
}

uint64_t CacheManagementRemove()
{
  return _CacheManagementRemove();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PSBlankIconImage()
{
  return _PSBlankIconImage();
}

uint64_t PreferencesTableViewHeaderColor()
{
  return _PreferencesTableViewHeaderColor();
}

uint64_t PreferencesTableViewHeaderFont()
{
  return _PreferencesTableViewHeaderFont();
}

uint64_t STColorForCategoryKey()
{
  return _STColorForCategoryKey();
}

uint64_t STFormattedShortDate()
{
  return _STFormattedShortDate();
}

uint64_t STFormattedSize()
{
  return _STFormattedSize();
}

uint64_t STLoadTableIconForAppID()
{
  return _STLoadTableIconForAppID();
}

uint64_t STLog()
{
  return _STLog();
}

uint64_t STLogSize()
{
  return _STLogSize();
}

uint64_t STMSizeOfFileTree()
{
  return _STMSizeOfFileTree();
}

uint64_t STNameForCategoryKey()
{
  return _STNameForCategoryKey();
}

uint64_t STSizeOfSystemVolume()
{
  return _STSizeOfSystemVolume();
}

uint64_t STStorageComputePercentage()
{
  return _STStorageComputePercentage();
}

uint64_t STStorageDeviceIsiPad()
{
  return _STStorageDeviceIsiPad();
}

uint64_t STStorageDeviceKey()
{
  return _STStorageDeviceKey();
}

uint64_t STStorageIsInternalInstall()
{
  return _STStorageIsInternalInstall();
}

uint64_t STTapToRadarURLWithTitleAndContent()
{
  return _STTapToRadarURLWithTitleAndContent();
}

uint64_t STTokenLogSize()
{
  return _STTokenLogSize();
}

uint64_t ScreenScale()
{
  return _ScreenScale();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

double __exp10(double a1)
{
  return ___exp10(a1);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

long double log10(long double __x)
{
  return _log10(__x);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_ITunesUAudioQuery(void *a1, const char *a2, ...)
{
  return [a1 ITunesUAudioQuery];
}

id objc_msgSend_UIImage(void *a1, const char *a2, ...)
{
  return [a1 UIImage];
}

id objc_msgSend_activationPercent(void *a1, const char *a2, ...)
{
  return [a1 activationPercent];
}

id objc_msgSend_albumTitle(void *a1, const char *a2, ...)
{
  return [a1 albumTitle];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allTips(void *a1, const char *a2, ...)
{
  return [a1 allTips];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_app(void *a1, const char *a2, ...)
{
  return [a1 app];
}

id objc_msgSend_appIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appIdentifier];
}

id objc_msgSend_appKind(void *a1, const char *a2, ...)
{
  return [a1 appKind];
}

id objc_msgSend_appRecord(void *a1, const char *a2, ...)
{
  return [a1 appRecord];
}

id objc_msgSend_appSize(void *a1, const char *a2, ...)
{
  return [a1 appSize];
}

id objc_msgSend_appSizeIfComputed(void *a1, const char *a2, ...)
{
  return [a1 appSizeIfComputed];
}

id objc_msgSend_appSpecs(void *a1, const char *a2, ...)
{
  return [a1 appSpecs];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_apps(void *a1, const char *a2, ...)
{
  return [a1 apps];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_artwork(void *a1, const char *a2, ...)
{
  return [a1 artwork];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return [a1 ascender];
}

id objc_msgSend_assetPurgeableSize(void *a1, const char *a2, ...)
{
  return [a1 assetPurgeableSize];
}

id objc_msgSend_assetURL(void *a1, const char *a2, ...)
{
  return [a1 assetURL];
}

id objc_msgSend_atcDictionary(void *a1, const char *a2, ...)
{
  return [a1 atcDictionary];
}

id objc_msgSend_audioPodcastsQuery(void *a1, const char *a2, ...)
{
  return [a1 audioPodcastsQuery];
}

id objc_msgSend_audiobooksQuery(void *a1, const char *a2, ...)
{
  return [a1 audiobooksQuery];
}

id objc_msgSend_availableBytes(void *a1, const char *a2, ...)
{
  return [a1 availableBytes];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_buttonAction(void *a1, const char *a2, ...)
{
  return [a1 buttonAction];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cacheDeleteDict(void *a1, const char *a2, ...)
{
  return [a1 cacheDeleteDict];
}

id objc_msgSend_calculatedString(void *a1, const char *a2, ...)
{
  return [a1 calculatedString];
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return [a1 capabilities];
}

id objc_msgSend_categories(void *a1, const char *a2, ...)
{
  return [a1 categories];
}

id objc_msgSend_categorySizes(void *a1, const char *a2, ...)
{
  return [a1 categorySizes];
}

id objc_msgSend_cellIsSwiped(void *a1, const char *a2, ...)
{
  return [a1 cellIsSwiped];
}

id objc_msgSend_cellType(void *a1, const char *a2, ...)
{
  return [a1 cellType];
}

id objc_msgSend_childApps(void *a1, const char *a2, ...)
{
  return [a1 childApps];
}

id objc_msgSend_childItemCount(void *a1, const char *a2, ...)
{
  return [a1 childItemCount];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collections(void *a1, const char *a2, ...)
{
  return [a1 collections];
}

id objc_msgSend_configurationState(void *a1, const char *a2, ...)
{
  return [a1 configurationState];
}

id objc_msgSend_consumedDate(void *a1, const char *a2, ...)
{
  return [a1 consumedDate];
}

id objc_msgSend_contentModificationDate(void *a1, const char *a2, ...)
{
  return [a1 contentModificationDate];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createCollection(void *a1, const char *a2, ...)
{
  return [a1 createCollection];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_darkGrayColor(void *a1, const char *a2, ...)
{
  return [a1 darkGrayColor];
}

id objc_msgSend_dataContainerSize(void *a1, const char *a2, ...)
{
  return [a1 dataContainerSize];
}

id objc_msgSend_dataPurgeableSize(void *a1, const char *a2, ...)
{
  return [a1 dataPurgeableSize];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateDisplayCalculating(void *a1, const char *a2, ...)
{
  return [a1 dateDisplayCalculating];
}

id objc_msgSend_dateDisplayEnd(void *a1, const char *a2, ...)
{
  return [a1 dateDisplayEnd];
}

id objc_msgSend_dateDisplayStart(void *a1, const char *a2, ...)
{
  return [a1 dateDisplayStart];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultMediaLibrary(void *a1, const char *a2, ...)
{
  return [a1 defaultMediaLibrary];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return [a1 descender];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_detailedText(void *a1, const char *a2, ...)
{
  return [a1 detailedText];
}

id objc_msgSend_deviceMediaLibrary(void *a1, const char *a2, ...)
{
  return [a1 deviceMediaLibrary];
}

id objc_msgSend_deviceSize(void *a1, const char *a2, ...)
{
  return [a1 deviceSize];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_docPluginsByID(void *a1, const char *a2, ...)
{
  return [a1 docPluginsByID];
}

id objc_msgSend_docsAndData(void *a1, const char *a2, ...)
{
  return [a1 docsAndData];
}

id objc_msgSend_documentAppIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 documentAppIdentifiers];
}

id objc_msgSend_documentSize(void *a1, const char *a2, ...)
{
  return [a1 documentSize];
}

id objc_msgSend_documents(void *a1, const char *a2, ...)
{
  return [a1 documents];
}

id objc_msgSend_downloadCompletionDate(void *a1, const char *a2, ...)
{
  return [a1 downloadCompletionDate];
}

id objc_msgSend_downloadStartDate(void *a1, const char *a2, ...)
{
  return [a1 downloadStartDate];
}

id objc_msgSend_dynamic(void *a1, const char *a2, ...)
{
  return [a1 dynamic];
}

id objc_msgSend_editButton(void *a1, const char *a2, ...)
{
  return [a1 editButton];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_eventualGain(void *a1, const char *a2, ...)
{
  return [a1 eventualGain];
}

id objc_msgSend_externDataPluginsByID(void *a1, const char *a2, ...)
{
  return [a1 externDataPluginsByID];
}

id objc_msgSend_externDataSizeAppIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 externDataSizeAppIdentifiers];
}

id objc_msgSend_externalPurgeableSize(void *a1, const char *a2, ...)
{
  return [a1 externalPurgeableSize];
}

id objc_msgSend_externalSize(void *a1, const char *a2, ...)
{
  return [a1 externalSize];
}

id objc_msgSend_fetchSize(void *a1, const char *a2, ...)
{
  return [a1 fetchSize];
}

id objc_msgSend_fileProviderTips(void *a1, const char *a2, ...)
{
  return [a1 fileProviderTips];
}

id objc_msgSend_fire(void *a1, const char *a2, ...)
{
  return [a1 fire];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fixed(void *a1, const char *a2, ...)
{
  return [a1 fixed];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return [a1 flush];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_fpDomain(void *a1, const char *a2, ...)
{
  return [a1 fpDomain];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_headerButton(void *a1, const char *a2, ...)
{
  return [a1 headerButton];
}

id objc_msgSend_hlsSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 hlsSpecifiers];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_immediateGain(void *a1, const char *a2, ...)
{
  return [a1 immediateGain];
}

id objc_msgSend_infoSpecifier(void *a1, const char *a2, ...)
{
  return [a1 infoSpecifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAppClip(void *a1, const char *a2, ...)
{
  return [a1 isAppClip];
}

id objc_msgSend_isAsynchronouslyLoaded(void *a1, const char *a2, ...)
{
  return [a1 isAsynchronouslyLoaded];
}

id objc_msgSend_isDeletable(void *a1, const char *a2, ...)
{
  return [a1 isDeletable];
}

id objc_msgSend_isDeleted(void *a1, const char *a2, ...)
{
  return [a1 isDeleted];
}

id objc_msgSend_isDemotable(void *a1, const char *a2, ...)
{
  return [a1 isDemotable];
}

id objc_msgSend_isDemoted(void *a1, const char *a2, ...)
{
  return [a1 isDemoted];
}

id objc_msgSend_isDocumentApp(void *a1, const char *a2, ...)
{
  return [a1 isDocumentApp];
}

id objc_msgSend_isGrouped(void *a1, const char *a2, ...)
{
  return [a1 isGrouped];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isMovingFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 isMovingFromParentViewController];
}

id objc_msgSend_isMovingToParentViewController(void *a1, const char *a2, ...)
{
  return [a1 isMovingToParentViewController];
}

id objc_msgSend_isPseudoApp(void *a1, const char *a2, ...)
{
  return [a1 isPseudoApp];
}

id objc_msgSend_isRecoverable(void *a1, const char *a2, ...)
{
  return [a1 isRecoverable];
}

id objc_msgSend_isRunningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return [a1 isRunningInStoreDemoMode];
}

id objc_msgSend_isSwiped(void *a1, const char *a2, ...)
{
  return [a1 isSwiped];
}

id objc_msgSend_isTrashed(void *a1, const char *a2, ...)
{
  return [a1 isTrashed];
}

id objc_msgSend_isUsageApp(void *a1, const char *a2, ...)
{
  return [a1 isUsageApp];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isVeryLowSpace(void *a1, const char *a2, ...)
{
  return [a1 isVeryLowSpace];
}

id objc_msgSend_itemID(void *a1, const char *a2, ...)
{
  return [a1 itemID];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastUsedDate(void *a1, const char *a2, ...)
{
  return [a1 lastUsedDate];
}

id objc_msgSend_lastViewedDate(void *a1, const char *a2, ...)
{
  return [a1 lastViewedDate];
}

id objc_msgSend_lauchEventDidSend(void *a1, const char *a2, ...)
{
  return [a1 lauchEventDidSend];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_letterCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 letterCharacterSet];
}

id objc_msgSend_libraryDataProvider(void *a1, const char *a2, ...)
{
  return [a1 libraryDataProvider];
}

id objc_msgSend_loadDefaults(void *a1, const char *a2, ...)
{
  return [a1 loadDefaults];
}

id objc_msgSend_loadPlugins(void *a1, const char *a2, ...)
{
  return [a1 loadPlugins];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedLowercaseString(void *a1, const char *a2, ...)
{
  return [a1 localizedLowercaseString];
}

id objc_msgSend_localizedModel(void *a1, const char *a2, ...)
{
  return [a1 localizedModel];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_logAppSizes(void *a1, const char *a2, ...)
{
  return [a1 logAppSizes];
}

id objc_msgSend_logSizes(void *a1, const char *a2, ...)
{
  return [a1 logSizes];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_mediaCache(void *a1, const char *a2, ...)
{
  return [a1 mediaCache];
}

id objc_msgSend_mediaGroups(void *a1, const char *a2, ...)
{
  return [a1 mediaGroups];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return [a1 mediaType];
}

id objc_msgSend_mediaTypes(void *a1, const char *a2, ...)
{
  return [a1 mediaTypes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_numberOfSections(void *a1, const char *a2, ...)
{
  return [a1 numberOfSections];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_otherSize(void *a1, const char *a2, ...)
{
  return [a1 otherSize];
}

id objc_msgSend_parentController(void *a1, const char *a2, ...)
{
  return [a1 parentController];
}

id objc_msgSend_pinnedOnly(void *a1, const char *a2, ...)
{
  return [a1 pinnedOnly];
}

id objc_msgSend_pluginsByID(void *a1, const char *a2, ...)
{
  return [a1 pluginsByID];
}

id objc_msgSend_podcastTitle(void *a1, const char *a2, ...)
{
  return [a1 podcastTitle];
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return [a1 popoverPresentationController];
}

id objc_msgSend_postLoadingComplete(void *a1, const char *a2, ...)
{
  return [a1 postLoadingComplete];
}

id objc_msgSend_postMediaSizesChanged(void *a1, const char *a2, ...)
{
  return [a1 postMediaSizesChanged];
}

id objc_msgSend_postTipsChanged(void *a1, const char *a2, ...)
{
  return [a1 postTipsChanged];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return [a1 principalClass];
}

id objc_msgSend_providerID(void *a1, const char *a2, ...)
{
  return [a1 providerID];
}

id objc_msgSend_purgeable(void *a1, const char *a2, ...)
{
  return [a1 purgeable];
}

id objc_msgSend_purgeableBytes(void *a1, const char *a2, ...)
{
  return [a1 purgeableBytes];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_refreshAppState(void *a1, const char *a2, ...)
{
  return [a1 refreshAppState];
}

id objc_msgSend_reload(void *a1, const char *a2, ...)
{
  return [a1 reload];
}

id objc_msgSend_reloadAllTips(void *a1, const char *a2, ...)
{
  return [a1 reloadAllTips];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllowed(void *a1, const char *a2, ...)
{
  return [a1 removeAllowed];
}

id objc_msgSend_reportedDiff(void *a1, const char *a2, ...)
{
  return [a1 reportedDiff];
}

id objc_msgSend_reportedString(void *a1, const char *a2, ...)
{
  return [a1 reportedString];
}

id objc_msgSend_representativeItem(void *a1, const char *a2, ...)
{
  return [a1 representativeItem];
}

id objc_msgSend_representedApp(void *a1, const char *a2, ...)
{
  return [a1 representedApp];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return [a1 rootController];
}

id objc_msgSend_rootVolume(void *a1, const char *a2, ...)
{
  return [a1 rootVolume];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_searchButtonPressed(void *a1, const char *a2, ...)
{
  return [a1 searchButtonPressed];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_setupSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 setupSpecifiers];
}

id objc_msgSend_sharedCache(void *a1, const char *a2, ...)
{
  return [a1 sharedCache];
}

id objc_msgSend_sharedContainerSize(void *a1, const char *a2, ...)
{
  return [a1 sharedContainerSize];
}

id objc_msgSend_sharedGenerator(void *a1, const char *a2, ...)
{
  return [a1 sharedGenerator];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedMonitor];
}

id objc_msgSend_sharedNotifier(void *a1, const char *a2, ...)
{
  return [a1 sharedNotifier];
}

id objc_msgSend_sharedPurgeableSize(void *a1, const char *a2, ...)
{
  return [a1 sharedPurgeableSize];
}

id objc_msgSend_shouldReturn(void *a1, const char *a2, ...)
{
  return [a1 shouldReturn];
}

id objc_msgSend_showAlertForFailedInstallation(void *a1, const char *a2, ...)
{
  return [a1 showAlertForFailedInstallation];
}

id objc_msgSend_showAllTips(void *a1, const char *a2, ...)
{
  return [a1 showAllTips];
}

id objc_msgSend_significantItems(void *a1, const char *a2, ...)
{
  return [a1 significantItems];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_sortSize(void *a1, const char *a2, ...)
{
  return [a1 sortSize];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifierForCalc(void *a1, const char *a2, ...)
{
  return [a1 specifierForCalc];
}

id objc_msgSend_specifierForOther(void *a1, const char *a2, ...)
{
  return [a1 specifierForOther];
}

id objc_msgSend_specifierForSystem(void *a1, const char *a2, ...)
{
  return [a1 specifierForSystem];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_spinnerSpecifier(void *a1, const char *a2, ...)
{
  return [a1 spinnerSpecifier];
}

id objc_msgSend_splunkUploadURL(void *a1, const char *a2, ...)
{
  return [a1 splunkUploadURL];
}

id objc_msgSend_startMonitor(void *a1, const char *a2, ...)
{
  return [a1 startMonitor];
}

id objc_msgSend_startObserving(void *a1, const char *a2, ...)
{
  return [a1 startObserving];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stopMonitor(void *a1, const char *a2, ...)
{
  return [a1 stopMonitor];
}

id objc_msgSend_stopObserving(void *a1, const char *a2, ...)
{
  return [a1 stopObserving];
}

id objc_msgSend_storageSpace(void *a1, const char *a2, ...)
{
  return [a1 storageSpace];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_supportsEnumeration(void *a1, const char *a2, ...)
{
  return [a1 supportsEnumeration];
}

id objc_msgSend_syncUI(void *a1, const char *a2, ...)
{
  return [a1 syncUI];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemCyanColor(void *a1, const char *a2, ...)
{
  return [a1 systemCyanColor];
}

id objc_msgSend_systemGray3Color(void *a1, const char *a2, ...)
{
  return [a1 systemGray3Color];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_systemIndigoColor(void *a1, const char *a2, ...)
{
  return [a1 systemIndigoColor];
}

id objc_msgSend_systemMintColor(void *a1, const char *a2, ...)
{
  return [a1 systemMintColor];
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return [a1 systemOrangeColor];
}

id objc_msgSend_systemPinkColor(void *a1, const char *a2, ...)
{
  return [a1 systemPinkColor];
}

id objc_msgSend_systemPurpleColor(void *a1, const char *a2, ...)
{
  return [a1 systemPurpleColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_systemTealColor(void *a1, const char *a2, ...)
{
  return [a1 systemTealColor];
}

id objc_msgSend_systemVersion(void *a1, const char *a2, ...)
{
  return [a1 systemVersion];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return [a1 systemYellowColor];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_thumbnailData(void *a1, const char *a2, ...)
{
  return [a1 thumbnailData];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_tipSpecs(void *a1, const char *a2, ...)
{
  return [a1 tipSpecs];
}

id objc_msgSend_tips(void *a1, const char *a2, ...)
{
  return [a1 tips];
}

id objc_msgSend_tipsByAppID(void *a1, const char *a2, ...)
{
  return [a1 tipsByAppID];
}

id objc_msgSend_tipsByPluginID(void *a1, const char *a2, ...)
{
  return [a1 tipsByPluginID];
}

id objc_msgSend_tipsToShow(void *a1, const char *a2, ...)
{
  return [a1 tipsToShow];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topItem(void *a1, const char *a2, ...)
{
  return [a1 topItem];
}

id objc_msgSend_topTips(void *a1, const char *a2, ...)
{
  return [a1 topTips];
}

id objc_msgSend_totalBytes(void *a1, const char *a2, ...)
{
  return [a1 totalBytes];
}

id objc_msgSend_totalSize(void *a1, const char *a2, ...)
{
  return [a1 totalSize];
}

id objc_msgSend_trackDisplayCalculating(void *a1, const char *a2, ...)
{
  return [a1 trackDisplayCalculating];
}

id objc_msgSend_trackDisplayEnd(void *a1, const char *a2, ...)
{
  return [a1 trackDisplayEnd];
}

id objc_msgSend_trackDisplayStart(void *a1, const char *a2, ...)
{
  return [a1 trackDisplayStart];
}

id objc_msgSend_tvShowsQuery(void *a1, const char *a2, ...)
{
  return [a1 tvShowsQuery];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateConstraints(void *a1, const char *a2, ...)
{
  return [a1 updateConstraints];
}

id objc_msgSend_updateConstraintsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 updateConstraintsIfNeeded];
}

id objc_msgSend_updateHLSSpecs(void *a1, const char *a2, ...)
{
  return [a1 updateHLSSpecs];
}

id objc_msgSend_updateOtherDataSize(void *a1, const char *a2, ...)
{
  return [a1 updateOtherDataSize];
}

id objc_msgSend_updateTipIndexes(void *a1, const char *a2, ...)
{
  return [a1 updateTipIndexes];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_usageBundle(void *a1, const char *a2, ...)
{
  return [a1 usageBundle];
}

id objc_msgSend_usageBundleStorageReporter(void *a1, const char *a2, ...)
{
  return [a1 usageBundleStorageReporter];
}

id objc_msgSend_usedBytes(void *a1, const char *a2, ...)
{
  return [a1 usedBytes];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userTotal(void *a1, const char *a2, ...)
{
  return [a1 userTotal];
}

id objc_msgSend_userVisible(void *a1, const char *a2, ...)
{
  return [a1 userVisible];
}

id objc_msgSend_vendorName(void *a1, const char *a2, ...)
{
  return [a1 vendorName];
}

id objc_msgSend_videoITunesUQuery(void *a1, const char *a2, ...)
{
  return [a1 videoITunesUQuery];
}

id objc_msgSend_videoPodcastsQuery(void *a1, const char *a2, ...)
{
  return [a1 videoPodcastsQuery];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewDidLoad(void *a1, const char *a2, ...)
{
  return [a1 viewDidLoad];
}

id objc_msgSend_whackObsoletePrefs(void *a1, const char *a2, ...)
{
  return [a1 whackObsoletePrefs];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}