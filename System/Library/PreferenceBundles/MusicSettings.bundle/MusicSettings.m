uint64_t sub_1F30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1F44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2224(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2238(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2518(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_252C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_25F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2910(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2924(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2C40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2C54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2F54(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v6.receiver = *(id *)(a1 + 40);
  v6.super_class = (Class)MusicSettingsAudioQualityDetailController;
  objc_msgSendSuper2(&v6, "listItemSelected:", v2);
  v3 = [*(id *)(a1 + 48) propertyForKey:MusicSettingsDidSelectAction];
  SEL v4 = NSSelectorFromString(v3);

  if (v4) {
    id v5 = (id)MusicSettingsPerformSelector();
  }
}

uint64_t sub_2FE4(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

id sub_3658(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1) {
    v3 = v1;
  }
  else {
    v3 = &__kCFBooleanFalse;
  }
  id v4 = v3;
  id v5 = +[UIDevice currentDevice];
  unsigned int v6 = objc_msgSend(v5, "sf_isChinaRegionCellularDevice");

  if (v6)
  {
    unsigned __int8 v7 = [v2 intValue];

    if ((v7 & 2) != 0) {
      id v4 = &__kCFBooleanTrue;
    }
    else {
      id v4 = &__kCFBooleanFalse;
    }
  }

  return v4;
}

id sub_3BB0(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

void sub_41A8(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_4230;
  v2[3] = &unk_186D0;
  id v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _displayDownloadsDialogIfNeededWithCompletion:v2];
}

uint64_t sub_4230(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_4244(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_42CC;
  v2[3] = &unk_186D0;
  id v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _displayDownloadsDialogIfNeededWithCompletion:v2];
}

uint64_t sub_42CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_4374(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_4544(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v6.receiver = *(id *)(a1 + 40);
  v6.super_class = (Class)MusicSettingsAtmosAudioController;
  objc_msgSendSuper2(&v6, "listItemSelected:", v2);
  id v3 = [*(id *)(a1 + 48) propertyForKey:MusicSettingsDidSelectAction];
  SEL v4 = NSSelectorFromString(v3);

  if (v4) {
    id v5 = (id)MusicSettingsPerformSelector();
  }
}

uint64_t sub_45D4(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t sub_4AC4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_4AD8(uint64_t a1)
{
  uint64_t v2 = +[MPPlaybackUserDefaults standardUserDefaults];
  [v2 setPrefersSpatialDownloads:1];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

void sub_4F24(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a3 + 1;
  id v5 = a2;
  objc_super v6 = +[NSString stringWithFormat:@"com.apple.Music:MinimumStorageTier%lu", v4];
  CFStringRef v8 = @"capacity";
  id v9 = v5;
  unsigned __int8 v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

void sub_5B9C(id *a1)
{
  [a1[4] updateVisibleSpecifiers];
  objc_msgSend(a1[5], "footerViewForSection:", objc_msgSend(a1[6], "section"));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 invalidateIntrinsicContentSize];
}

uint64_t sub_6A20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_6A30(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [*(id *)(a1 + 32) countOfEntities]);
  id v3 = *(void **)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_6B7C;
  v10[3] = &unk_187F0;
  id v4 = v2;
  id v11 = v4;
  [v3 enumeratePersistentIDsUsingBlock:v10];
  id v5 = *(void **)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6BDC;
  v7[3] = &unk_18818;
  id v8 = v5;
  id v9 = v4;
  id v6 = v4;
  [v8 performDatabaseTransactionWithBlock:v7];
  [*(id *)(a1 + 40) notifyKeepLocalStateDidChange];
}

void sub_6B7C(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];
}

uint64_t sub_6BDC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  +[ML3Track unlinkRedownloadableAssetsFromLibrary:v3 persistentIDs:v4 deletionType:1 disableKeepLocal:0 deletedFileSize:0];
  uint64_t v8 = ML3EntityPropertyKeepLocalConstraints;
  id v6 = +[NSArray arrayWithObjects:&v8 count:1];
  +[ML3Track setValues:&off_1A998 forProperties:v6 forEntityPersistentIDs:*(void *)(a1 + 40) inLibrary:*(void *)(a1 + 32) usingConnection:v5];

  return 1;
}

int64_t sub_87B8(id a1, MPPlaybackEQSetting *a2, MPPlaybackEQSetting *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  if ([(MPPlaybackEQSetting *)v4 preset])
  {
    id v6 = [(MPPlaybackEQSetting *)v4 localizedName];
    unsigned __int8 v7 = [(MPPlaybackEQSetting *)v5 localizedName];
    int64_t v8 = (int64_t)[v6 caseInsensitiveCompare:v7];
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

id sub_93C4(id a1, id a2)
{
  return +[NSMutableArray array];
}

int64_t sub_93D0(id a1, MSVFrameworkDescription *a2, MSVFrameworkDescription *a3)
{
  uint64_t v4 = a3;
  id v5 = [(MSVFrameworkDescription *)a2 name];
  id v6 = [(MSVFrameworkDescription *)v4 name];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_9D44(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9DBC;
  block[3] = &unk_186F8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_9DBC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAccountStatus];
}

void sub_9DC4(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9E3C;
  block[3] = &unk_186F8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_9E3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAccountStatus];
}

void sub_AD08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 192));
  _Unwind_Resume(a1);
}

id sub_AD30(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

void sub_AD38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_ADDC;
  v3[3] = &unk_18970;
  v3[4] = WeakRetained;
  id v4 = *(id *)(a1 + 32);
  [WeakRetained dismissViewControllerAnimated:1 completion:v3];
}

void sub_ADDC(uint64_t a1)
{
  uint64_t v2 = +[ICPrivacyInfo sharedPrivacyInfo];
  uint64_t v3 = ICPrivacyIdentifierMusic;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_AE9C;
  v5[3] = &unk_18998;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 acknowledgePrivacyPolicyForIdentifier:v3 completionHandler:v5];
}

void sub_AE9C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_AF24;
  v2[3] = &unk_18970;
  id v1 = *(void **)(a1 + 40);
  void v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

id sub_AF24(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:1];
}

id sub_AF34(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 312);
  if (a2) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_AFC0;
  v6[3] = &unk_18948;
  v6[4] = v2;
  return [v3 enableCloudLibraryWithPolicy:v4 startInitialImport:1 completionHandler:v6];
}

void sub_AFC0(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B038;
  block[3] = &unk_186F8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_B038(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAccountStatus];
}

uint64_t sub_B040(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_B054(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:1];
}

id sub_B064(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 312);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_B0E4;
  v4[3] = &unk_18948;
  v4[4] = v1;
  return [v2 disableCloudLibraryWithReason:-1 completionHandler:v4];
}

void sub_B0E4(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B15C;
  block[3] = &unk_186F8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_B15C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAccountStatus];
}

uint64_t sub_B164(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_B174(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:1];
}

void sub_B2A4(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B31C;
  block[3] = &unk_186F8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_B31C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

void sub_B444(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B4BC;
  block[3] = &unk_186F8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_B4BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

void sub_C634(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    v10[9] = v3;
    v10[10] = v4;
    id v6 = a2;
    id v7 = +[HSAccountStore defaultStore];
    int64_t v8 = [v6 objectForKeyedSubscript:AKAuthenticationUsernameKey];
    [v7 setAppleID:v8];

    id v9 = [v6 objectForKeyedSubscript:AKAuthenticationPasswordKey];

    [v7 setPassword:v9];
    if ([v7 canDetermineGroupID])
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_C754;
      v10[3] = &unk_18A60;
      void v10[4] = *(void *)(a1 + 32);
      [v7 determineGroupIDWithCompletionHandler:v10];
    }
  }
}

void sub_C754(uint64_t a1, char a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_C7D0;
  v2[3] = &unk_18A38;
  char v3 = a2;
  void v2[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

id sub_C7D0(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = +[NSBundle bundleForClass:objc_opt_class()];
    char v3 = [v2 localizedStringForKey:@"HOME_SHARING_ERROR_TITLE" value:&stru_18CF0 table:@"MusicSettings"];
    uint64_t v4 = +[UIAlertController alertControllerWithTitle:v3 message:0 preferredStyle:1];

    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"OK" value:&stru_18CF0 table:@"MusicSettings"];
    id v7 = +[UIAlertAction actionWithTitle:v6 style:0 handler:0];
    [v4 addAction:v7];

    [*(id *)(a1 + 32) presentViewController:v4 animated:1 completion:0];
  }
  int64_t v8 = *(void **)(a1 + 32);

  return [v8 _reloadAccountStatus];
}

void sub_CB64(uint64_t a1)
{
  id v2 = +[HSAccountStore defaultStore];
  [v2 clearAllCredentials];
  [*(id *)(a1 + 32) _reloadAccountStatus];
}

void sub_CC74(uint64_t a1, char a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_CCF0;
  v2[3] = &unk_18A38;
  void v2[4] = *(void *)(a1 + 32);
  char v3 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

void sub_CCF0(uint64_t a1)
{
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  char v3 = [v2 localizedStringForKey:@"RESET_MEDIA_LIBRARY" value:&stru_18CF0 table:@"MusicSettings"];
  int v4 = *(unsigned __int8 *)(a1 + 40);
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = v5;
  if (v4) {
    CFStringRef v7 = @"RESET_MEDIA_LIBRARY_SUCCESSFUL";
  }
  else {
    CFStringRef v7 = @"RESET_MEDIA_LIBRARY_FAILED";
  }
  int64_t v8 = [v5 localizedStringForKey:v7 value:&stru_18CF0 table:@"MusicSettings"];
  id v9 = +[UIAlertController alertControllerWithTitle:v3 message:v8 preferredStyle:1];

  [*(id *)(a1 + 32) presentViewController:v9 animated:1 completion:0];
}

id sub_CF08(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAccountStatus];
}

id sub_CF84(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetMLIStatus];
}

id sub_D000(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

id sub_D07C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAccountStatus];
}

id sub_D0F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAccountStatus];
}

id sub_D174(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAccountStatus];
}

id sub_D1F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAccountStatus];
}

id sub_D26C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

id sub_D2E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

id sub_D364(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

id sub_D3E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

void sub_D804(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = [v3 isManagedAppleID];
  id v5 = [v3 DSID];

  if (*(unsigned __int8 *)(a1 + 48) != v4
    || ([v5 isEqual:*(void *)(a1 + 32)] & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_D8E8;
    block[3] = &unk_18AD8;
    block[4] = *(void *)(a1 + 40);
    id v7 = v5;
    char v8 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_D8E8(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 193) = *(void *)(a1 + 40) != 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 201) = *(unsigned char *)(a1 + 48);
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

void sub_D918(id a1, ICStoreRequestContext *a2)
{
  id v11 = a2;
  id v2 = [(ICStoreRequestContext *)v11 clientInfo];
  id v3 = [v2 clientVersion];
  unsigned int v4 = [v3 componentsSeparatedByString:@"."];

  if ([v4 count] == (char *)&dword_0 + 1)
  {
    id v5 = [(ICStoreRequestContext *)v11 clientInfo];
    id v6 = [v5 mutableCopy];

    id v7 = [v4 firstObject];
    char v8 = +[NSString stringWithFormat:@"%@.0", v7];
    [v6 setClientVersion:v8];

    [(ICStoreRequestContext *)v11 setClientInfo:v6];
  }
  id v9 = +[ICUserIdentityStore defaultIdentityStore];
  [(ICStoreRequestContext *)v11 setIdentityStore:v9];

  v10 = +[ICUserIdentity activeAccount];
  [(ICStoreRequestContext *)v11 setIdentity:v10];

  [(ICStoreRequestContext *)v11 setAllowsExpiredBags:1];
}

void sub_DA70(uint64_t a1, void *a2)
{
  id v3 = [a2 dictionaryForBagKey:ICURLBagKeyMusicSubscription];
  unsigned int v4 = [v3 objectForKeyedSubscript:@"mli"];
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = [v4 objectForKeyedSubscript:@"ismliEnabled"];
    id v6 = [v4 objectForKeyedSubscript:@"mliEntryPointText"];

    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      unsigned int v7 = [v5 BOOLValue];
      if (v6) {
        unsigned int v8 = v7;
      }
      else {
        unsigned int v8 = 0;
      }
    }
    else
    {
      unsigned int v8 = 0;
    }
  }
  else
  {
    unsigned int v8 = 0;
  }
  if (*(unsigned __int8 *)(a1 + 40) != v8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_DBF4;
    block[3] = &unk_18AD8;
    block[4] = *(void *)(a1 + 32);
    char v11 = v8;
    id v10 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_DBF4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 205) = *(unsigned char *)(a1 + 48);
  id v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"mliMusicDeepLink"];
  id v3 = [v2 copy];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 248);
  *(void *)(v4 + 248) = v3;

  id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"mliEntryPointText"];
  id v7 = [v6 copy];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 256);
  *(void *)(v8 + 256) = v7;

  id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"mliEntryPointTitle"];
  id v11 = [v10 copy];
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 264);
  *(void *)(v12 + 264) = v11;

  v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"mliEntryPointTitleReview"];
  id v15 = [v14 copy];
  uint64_t v16 = *(void *)(a1 + 32);
  v17 = *(void **)(v16 + 272);
  *(void *)(v16 + 272) = v15;

  v18 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"mliEntryPointFooter"];
  id v19 = [v18 copy];
  uint64_t v20 = *(void *)(a1 + 32);
  v21 = *(void **)(v20 + 280);
  *(void *)(v20 + 280) = v19;

  v22 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"mliReviewCTA"];
  id v23 = [v22 copy];
  uint64_t v24 = *(void *)(a1 + 32);
  v25 = *(void **)(v24 + 288);
  *(void *)(v24 + 288) = v23;

  v26 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"mliReviewTitle"];
  id v27 = [v26 copy];
  uint64_t v28 = *(void *)(a1 + 32);
  v29 = *(void **)(v28 + 296);
  *(void *)(v28 + 296) = v27;

  v30 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"mliReviewDurationInDays"];
  id v31 = [v30 copy];
  uint64_t v32 = *(void *)(a1 + 32);
  v33 = *(void **)(v32 + 304);
  *(void *)(v32 + 304) = v31;

  v34 = *(void **)(a1 + 32);

  return [v34 _determineMLIStatus];
}

id sub_E024(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56) && *(unsigned char *)(*(void *)(a1 + 32) + 199))
  {
    [*(id *)(a1 + 40) setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    char v2 = 1;
  }
  else
  {
    [*(id *)(a1 + 40) setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
    char v2 = 0;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 241) = v2;
  id v3 = [*(id *)(a1 + 48) stringForKey:@"mliReview"];
  *(unsigned char *)(*(void *)(a1 + 32) + 206) = v3 != 0;

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 updateVisibleSpecifiers];
}

id sub_E890(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 192) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 193) ^= 1u;
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

id sub_E8C4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 192) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 194) ^= 1u;
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

id sub_E8FC(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 192) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 195) ^= 1u;
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

id sub_E934(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 192) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 198) ^= 1u;
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

id sub_E96C(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 192) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 197) ^= 1u;
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

id sub_E9A4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 192) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 204) ^= 1u;
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

id sub_E9DC(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 192) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 203) ^= 1u;
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

id sub_EA14(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 192) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 199) ^= 1u;
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

id sub_EA4C(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 192) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 202) ^= 1u;
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

id sub_EA84(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 192) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 201) ^= 1u;
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

id sub_EABC(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 192) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 205) ^= 1u;
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

id sub_EAF4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 192) = 1;
  *(unsigned char *)(*(void *)(a1 + 32) + 206) ^= 1u;
  return [*(id *)(a1 + 32) updateVisibleSpecifiers];
}

id sub_EB2C(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 192) = 0;
  return [*(id *)(a1 + 32) _reloadAccountStatus];
}

UIColor *__cdecl sub_EF10(id a1, UITraitCollection *a2)
{
  char v2 = a2;
  id v3 = [(UITraitCollection *)v2 userInterfaceStyle];
  uint64_t v4 = [(UITraitCollection *)v2 accessibilityContrast];

  if (v3 == (unsigned char *)&dword_0 + 2)
  {
    double v5 = 0.980392157;
    if (v4 == (unsigned char *)&dword_0 + 1)
    {
      double v6 = 0.345098039;
      double v7 = 0.415686275;
    }
    else
    {
      double v6 = 0.176470588;
      double v7 = 0.282352941;
    }
  }
  else if (v4 == (unsigned char *)&dword_0 + 1)
  {
    double v5 = 0.839215686;
    double v7 = 0.0901960784;
    double v6 = 0.0;
  }
  else
  {
    double v5 = 0.980392157;
    double v6 = 0.137254902;
    double v7 = 0.231372549;
  }
  uint64_t v8 = +[UIColor colorWithRed:v5 green:v6 blue:v7 alpha:1.0];

  return (UIColor *)v8;
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t ICEnvironmentNetworkTypeIsCellular()
{
  return _ICEnvironmentNetworkTypeIsCellular();
}

uint64_t ICEnvironmentNetworkTypeIsWiFi()
{
  return _ICEnvironmentNetworkTypeIsWiFi();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t MRGroupSessionNearbyContactDiscoveryEnabled()
{
  return _MRGroupSessionNearbyContactDiscoveryEnabled();
}

uint64_t MSVDeviceOSIsInternalInstall()
{
  return _MSVDeviceOSIsInternalInstall();
}

uint64_t MSVDeviceSupportsEnhancedMusic()
{
  return _MSVDeviceSupportsEnhancedMusic();
}

uint64_t MSVProcessCopyMediaFrameworksDescriptions()
{
  return _MSVProcessCopyMediaFrameworksDescriptions();
}

uint64_t MSVProcessLinkMediaFrameworks()
{
  return _MSVProcessLinkMediaFrameworks();
}

uint64_t MSVSystemRootDirectory()
{
  return _MSVSystemRootDirectory();
}

uint64_t MusicSettingsPerformSelector()
{
  return _MusicSettingsPerformSelector();
}

uint64_t MusicSettingsPerformSelector2()
{
  return _MusicSettingsPerformSelector2();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double exp2(long double __x)
{
  return _exp2(__x);
}

long double log2(long double __x)
{
  return _log2(__x);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_enumerationMutation(id obj)
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

id objc_msgSend_DSID(void *a1, const char *a2, ...)
{
  return [a1 DSID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__determineMLIStatus(void *a1, const char *a2, ...)
{
  return [a1 _determineMLIStatus];
}

id objc_msgSend__hasItems(void *a1, const char *a2, ...)
{
  return [a1 _hasItems];
}

id objc_msgSend__minimumStorageOption(void *a1, const char *a2, ...)
{
  return [a1 _minimumStorageOption];
}

id objc_msgSend__reloadAccountStatus(void *a1, const char *a2, ...)
{
  return [a1 _reloadAccountStatus];
}

id objc_msgSend__resetMLIStatus(void *a1, const char *a2, ...)
{
  return [a1 _resetMLIStatus];
}

id objc_msgSend__supportedStorageOptions(void *a1, const char *a2, ...)
{
  return [a1 _supportedStorageOptions];
}

id objc_msgSend_accessibilityContrast(void *a1, const char *a2, ...)
{
  return [a1 accessibilityContrast];
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return [a1 activeAccount];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allSettings(void *a1, const char *a2, ...)
{
  return [a1 allSettings];
}

id objc_msgSend_allSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 allSpecifiers];
}

id objc_msgSend_appCellularDataModificationDisabled(void *a1, const char *a2, ...)
{
  return [a1 appCellularDataModificationDisabled];
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return [a1 appleID];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_autoupdatingSharedLibrary(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingSharedLibrary];
}

id objc_msgSend_autoupdatingSharedLibraryPath(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingSharedLibraryPath];
}

id objc_msgSend_beginObservingCloudLibraryEnabled(void *a1, const char *a2, ...)
{
  return [a1 beginObservingCloudLibraryEnabled];
}

id objc_msgSend_beginObservingMatchStatus(void *a1, const char *a2, ...)
{
  return [a1 beginObservingMatchStatus];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_canDetermineGroupID(void *a1, const char *a2, ...)
{
  return [a1 canDetermineGroupID];
}

id objc_msgSend_cellularDataEnabled(void *a1, const char *a2, ...)
{
  return [a1 cellularDataEnabled];
}

id objc_msgSend_cellularHighDataModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 cellularHighDataModeEnabled];
}

id objc_msgSend_cellularSettingsAvailable(void *a1, const char *a2, ...)
{
  return [a1 cellularSettingsAvailable];
}

id objc_msgSend_clearAllCredentials(void *a1, const char *a2, ...)
{
  return [a1 clearAllCredentials];
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return [a1 clientInfo];
}

id objc_msgSend_clientVersion(void *a1, const char *a2, ...)
{
  return [a1 clientVersion];
}

id objc_msgSend_cloudAddToPlaylistBehavior(void *a1, const char *a2, ...)
{
  return [a1 cloudAddToPlaylistBehavior];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countOfEntities(void *a1, const char *a2, ...)
{
  return [a1 countOfEntities];
}

id objc_msgSend_crossFadeDuration(void *a1, const char *a2, ...)
{
  return [a1 crossFadeDuration];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentDeviceInfo(void *a1, const char *a2, ...)
{
  return [a1 currentDeviceInfo];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultIdentityStore(void *a1, const char *a2, ...)
{
  return [a1 defaultIdentityStore];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_deviceMediaLibrary(void *a1, const char *a2, ...)
{
  return [a1 deviceMediaLibrary];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_endObservingCloudLibraryEnabled(void *a1, const char *a2, ...)
{
  return [a1 endObservingCloudLibraryEnabled];
}

id objc_msgSend_endObservingMatchStatus(void *a1, const char *a2, ...)
{
  return [a1 endObservingMatchStatus];
}

id objc_msgSend_exactBundleVersion(void *a1, const char *a2, ...)
{
  return [a1 exactBundleVersion];
}

id objc_msgSend_favoriteSongAddToLibraryBehavior(void *a1, const char *a2, ...)
{
  return [a1 favoriteSongAddToLibraryBehavior];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_groupID(void *a1, const char *a2, ...)
{
  return [a1 groupID];
}

id objc_msgSend_hasEntities(void *a1, const char *a2, ...)
{
  return [a1 hasEntities];
}

id objc_msgSend_hasWAPICapability(void *a1, const char *a2, ...)
{
  return [a1 hasWAPICapability];
}

id objc_msgSend_horizontalStack(void *a1, const char *a2, ...)
{
  return [a1 horizontalStack];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 invalidateIntrinsicContentSize];
}

id objc_msgSend_isAutomaticDownloadsEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAutomaticDownloadsEnabled];
}

id objc_msgSend_isChecked(void *a1, const char *a2, ...)
{
  return [a1 isChecked];
}

id objc_msgSend_isCloudLibraryEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCloudLibraryEnabled];
}

id objc_msgSend_isCrossFadeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCrossFadeEnabled];
}

id objc_msgSend_isEnablingCloudLibraryDestructive(void *a1, const char *a2, ...)
{
  return [a1 isEnablingCloudLibraryDestructive];
}

id objc_msgSend_isEnhancedAudioAvailable(void *a1, const char *a2, ...)
{
  return [a1 isEnhancedAudioAvailable];
}

id objc_msgSend_isFocusModePrivateListeningEnabled(void *a1, const char *a2, ...)
{
  return [a1 isFocusModePrivateListeningEnabled];
}

id objc_msgSend_isManagedAppleID(void *a1, const char *a2, ...)
{
  return [a1 isManagedAppleID];
}

id objc_msgSend_isMusicCellularDownloadingAllowed(void *a1, const char *a2, ...)
{
  return [a1 isMusicCellularDownloadingAllowed];
}

id objc_msgSend_isMusicCellularStreamingAllowed(void *a1, const char *a2, ...)
{
  return [a1 isMusicCellularStreamingAllowed];
}

id objc_msgSend_isPrivateListeningEnabled(void *a1, const char *a2, ...)
{
  return [a1 isPrivateListeningEnabled];
}

id objc_msgSend_isSubscriptionAvailable(void *a1, const char *a2, ...)
{
  return [a1 isSubscriptionAvailable];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return [a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedTitle];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_machOUUIDs(void *a1, const char *a2, ...)
{
  return [a1 machOUUIDs];
}

id objc_msgSend_matchStatus(void *a1, const char *a2, ...)
{
  return [a1 matchStatus];
}

id objc_msgSend_maxLabel(void *a1, const char *a2, ...)
{
  return [a1 maxLabel];
}

id objc_msgSend_maximumValue(void *a1, const char *a2, ...)
{
  return [a1 maximumValue];
}

id objc_msgSend_migrateCellularDataPreferencesIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 migrateCellularDataPreferencesIfNeeded];
}

id objc_msgSend_minLabel(void *a1, const char *a2, ...)
{
  return [a1 minLabel];
}

id objc_msgSend_minimumValue(void *a1, const char *a2, ...)
{
  return [a1 minimumValue];
}

id objc_msgSend_musicPurchasesDisabledForJaliscoLibrary(void *a1, const char *a2, ...)
{
  return [a1 musicPurchasesDisabledForJaliscoLibrary];
}

id objc_msgSend_musicSubscriptionStatus(void *a1, const char *a2, ...)
{
  return [a1 musicSubscriptionStatus];
}

id objc_msgSend_musicTintColor(void *a1, const char *a2, ...)
{
  return [a1 musicTintColor];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_networkType(void *a1, const char *a2, ...)
{
  return [a1 networkType];
}

id objc_msgSend_notifyKeepLocalStateDidChange(void *a1, const char *a2, ...)
{
  return [a1 notifyKeepLocalStateDidChange];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_preferredMusicDownloadResolution(void *a1, const char *a2, ...)
{
  return [a1 preferredMusicDownloadResolution];
}

id objc_msgSend_preferredMusicHighBandwidthResolution(void *a1, const char *a2, ...)
{
  return [a1 preferredMusicHighBandwidthResolution];
}

id objc_msgSend_preferredMusicLowBandwidthResolution(void *a1, const char *a2, ...)
{
  return [a1 preferredMusicLowBandwidthResolution];
}

id objc_msgSend_prefersSpatialDownloads(void *a1, const char *a2, ...)
{
  return [a1 prefersSpatialDownloads];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_preset(void *a1, const char *a2, ...)
{
  return [a1 preset];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return [a1 principalClass];
}

id objc_msgSend_privacyAcknowledgementRequiredForMusic(void *a1, const char *a2, ...)
{
  return [a1 privacyAcknowledgementRequiredForMusic];
}

id objc_msgSend_privacyFlow(void *a1, const char *a2, ...)
{
  return [a1 privacyFlow];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_regionCode(void *a1, const char *a2, ...)
{
  return [a1 regionCode];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return [a1 rootController];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedBagProvider(void *a1, const char *a2, ...)
{
  return [a1 sharedBagProvider];
}

id objc_msgSend_sharedCloudController(void *a1, const char *a2, ...)
{
  return [a1 sharedCloudController];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedMediaLibraryService(void *a1, const char *a2, ...)
{
  return [a1 sharedMediaLibraryService];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedMonitor];
}

id objc_msgSend_sharedNetworkObserver(void *a1, const char *a2, ...)
{
  return [a1 sharedNetworkObserver];
}

id objc_msgSend_sharedPrivacyInfo(void *a1, const char *a2, ...)
{
  return [a1 sharedPrivacyInfo];
}

id objc_msgSend_slider(void *a1, const char *a2, ...)
{
  return [a1 slider];
}

id objc_msgSend_songsQuery(void *a1, const char *a2, ...)
{
  return [a1 songsQuery];
}

id objc_msgSend_spacerImage(void *a1, const char *a2, ...)
{
  return [a1 spacerImage];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_statusType(void *a1, const char *a2, ...)
{
  return [a1 statusType];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_totalSize(void *a1, const char *a2, ...)
{
  return [a1 totalSize];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateVisibleSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 updateVisibleSpecifiers];
}

id objc_msgSend_usageBundleApps(void *a1, const char *a2, ...)
{
  return [a1 usageBundleApps];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_valueLabel(void *a1, const char *a2, ...)
{
  return [a1 valueLabel];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_verticalStack(void *a1, const char *a2, ...)
{
  return [a1 verticalStack];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_wifiDataEnabled(void *a1, const char *a2, ...)
{
  return [a1 wifiDataEnabled];
}