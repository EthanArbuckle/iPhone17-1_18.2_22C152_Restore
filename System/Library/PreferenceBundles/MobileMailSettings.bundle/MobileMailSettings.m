void sub_5C0C(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;
  uint64_t vars8;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v1 = os_log_create("com.apple.mobilemail", (const char *)[v3 UTF8String]);
  v2 = (void *)qword_40A90;
  qword_40A90 = (uint64_t)v1;
}

void sub_5C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_5F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5FF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_61A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6450(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6650(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id -[BlockedSenderSettingsPane _blockedSenderActionOptionsSpecifier](BlockedSenderSettingsPane *self, SEL a2)
{
  v3 = [(BlockedSenderSettingsPane *)self actionOptionsSpecifiers];

  if (!v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = BlockActionRadioGroupID;
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"BLOCKED_SENDER_OPTIONS_HEADER" value:&stru_39200 table:@"Preferences"];
    v8 = +[PSSpecifier groupSpecifierWithID:v5 name:v7];

    [v8 setProperty:&__kCFBooleanTrue forKey:@"AllowMultiLines"];
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"BLOCKED_SENDER_OPTIONS_MARK_AS_BLOCKED" value:&stru_39200 table:@"Preferences"];
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:3 edit:0];

    uint64_t v12 = PSValueKey;
    [v11 setProperty:&off_3B4C8 forKey:PSValueKey];
    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"BLOCKED_SENDER_OPTIONS_MOVE_TO_TRASH" value:&stru_39200 table:@"Preferences"];
    v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v15 setProperty:&off_3B4B0 forKey:v12];
    [v8 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    v16 = [(BlockedSenderSettingsPane *)self blockSenderOptionState];
    if ([v16 integerValue]) {
      v17 = v15;
    }
    else {
      v17 = v11;
    }
    [v8 setProperty:v17 forKey:PSRadioGroupCheckedSpecifierKey];

    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"BLOCKED_SENDER_OPTIONS_DESCRIPTION" value:&stru_39200 table:@"Preferences"];
    [v8 setProperty:v19 forKey:PSFooterTextGroupKey];

    [v4 addObject:v8];
    [v4 addObject:v11];
    [v4 addObject:v15];
    [(BlockedSenderSettingsPane *)self setActionOptionsSpecifiers:v4];
  }

  return [(BlockedSenderSettingsPane *)self actionOptionsSpecifiers];
}

void sub_69A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_70F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_72D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_7368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_7590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_76FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_774C()
{
}

void sub_78EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_79E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7B6C(_Unwind_Exception *a1)
{
  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_7CFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_818C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_86D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_8A7C(_Unwind_Exception *a1)
{
  v9 = v5;

  _Unwind_Resume(a1);
}

void sub_9058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27)
{
  _Unwind_Resume(a1);
}

void sub_9360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_94C0(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.mobilemail", (const char *)[v3 UTF8String]);
  v2 = (void *)qword_40AA0;
  qword_40AA0 = (uint64_t)v1;
}

void sub_9530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_9A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_9B78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_9ECC(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v12 = WeakRetained;
  if (WeakRetained)
  {
    if (v10)
    {
      v13 = +[ExtensionsSettingsPane log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = objc_msgSend(v10, "ef_publicDescription");
        sub_24630(v14, v15, v13);
      }
    }
    else
    {
      [WeakRetained _handleExtensionsAdded:v9];
      [v12[24] addCancelable:v8];
    }
  }
}

void sub_9FD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A0BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_A0E0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 200) addObjectsFromArray:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

void sub_A1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_A200(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 200) removeObjectsInArray:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

void sub_A39C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A8DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_AB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_AD40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_ADD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_ADE0(id a1, MailAccount *a2)
{
  v2 = a2;
  id v3 = [(MailAccount *)v2 primaryMailboxUid];
  id v4 = [[MFNanoBridgeSettingsAccountSpecificMailbox alloc] initWithMailboxUid:v3 account:v2];

  return v4;
}

void sub_AE50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_AE6C(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void sub_AEB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_AF1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B17C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_B4A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B5B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_B67C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_B6FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_B888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B8F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B9FC(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_BAC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_BAD8(void *a1, void *a2)
{
  id v4 = [a1 mailbox];
  v5 = [a2 mailbox];
  unint64_t v6 = (unint64_t)[v4 type];
  unint64_t v7 = (unint64_t)[v5 type];
  if (v6 | v7)
  {
    if (v6) {
      uint64_t v8 = -1;
    }
    else {
      uint64_t v8 = v7 != 0;
    }
  }
  else
  {
    id v9 = [a1 displayName];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v4 displayName];
    }
    uint64_t v12 = v11;

    v13 = [a2 displayName];
    v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [v5 displayName];
    }
    v16 = v15;

    uint64_t v8 = (uint64_t)[v12 localizedCaseInsensitiveCompare:v16];
  }

  return v8;
}

void sub_BBDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BE20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BF70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C1A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_C4E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_C5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_C690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_C960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_CC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_CE0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_D06C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D20C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D6B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_DA04(int a1, int a2)
{
  id v4 = +[NSMutableString stringWithString:@"FOUND_IN_MAILBOX_FORMAT"];
  v5 = v4;
  if (a1) {
    [v4 appendString:@"_WITH_ACCOUNT"];
  }
  if (a2) {
    [v5 appendString:@"_SHORT"];
  }
  unint64_t v6 = +[NSBundle mainBundle];
  unint64_t v7 = [v6 localizedStringForKey:v5 value:&stru_39200 table:@"Main"];

  return v7;
}

void sub_DAC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_DBAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_DCB4(_Unwind_Exception *a1)
{
  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_DD84(_Unwind_Exception *a1)
{
  id v2 = v1;

  _Unwind_Resume(a1);
}

void sub_DF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_DFE8(id a1, NSNumber *a2)
{
  id v2 = a2;
  id v3 = +[EMMailbox predicateForMailboxType:[(NSNumber *)v2 integerValue]];

  return v3;
}

void sub_E044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_E054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

void sub_E248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  _Unwind_Resume(a1);
}

void sub_E280(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _mailAccountsDidChange];
}

void sub_E2C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_E378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MailSettingsPlugin;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_E480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E5E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E9E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37,void *a38,void *a39,void *a40)
{
  _Unwind_Resume(a1);
}

void sub_10FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1133C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_113D8(void *a1, void *a2)
{
  id v5 = a1;
  id v3 = a2;
  id v4 = +[NSUserDefaults em_userDefaults];
  [v4 setValue:v3 forKey:v5];
}

void sub_11454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_11554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_11574(void *a1, uint64_t a2)
{
  id v4 = a1;
  id v3 = +[NSUserDefaults em_userDefaults];
  [v3 setBool:a2 forKey:v4];
}

void sub_115DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_117E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_11A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_11AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_11B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_11C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_11D10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_11DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_11E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_11FC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1212C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_12158(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) getCurrentSignatureSynchronously:*(void *)(a1 + 40)];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12214;
  block[3] = &unk_38D28;
  id v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_12214(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 192) lock];
  id v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 200);
  *(void *)(v3 + 200) = v2;

  [*(id *)(*(void *)(a1 + 32) + 192) unlockWithCondition:2];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);

  return [v5 reloadSpecifier:v6];
}

void sub_12560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_126F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_127B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_12828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_128AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_129C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_12A8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_12B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_12C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_12DF0(_Unwind_Exception *a1)
{
  id v10 = v8;

  _Unwind_Resume(a1);
}

void sub_13284(_Unwind_Exception *a1)
{
  id v7 = v5;

  _Unwind_Resume(a1);
}

void sub_133E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_134CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MFImageForAddressLabelTypeCustomBundleAndBackground(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, double a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  if (!v11)
  {
    v14 = +[UIApplication sharedApplication];
    id v11 = [v14 preferredContentSizeCategory];
  }
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  if (!qword_40AD8) {
    qword_40AD8 = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, &kCFTypeDictionaryValueCallBacks);
  }
  if (a6 == 0.0)
  {
    v18 = (const void *)((997 * a5) ^ (31 * a1) ^ (unint64_t)[v15 hash]);
    v19 = CFDictionaryGetValue((CFDictionaryRef)qword_40AD8, v18);
    if (v19) {
      goto LABEL_13;
    }
    keCGFloat y = (void *)v18;
  }
  else
  {
    keCGFloat y = 0;
  }
  id v20 = v15;
  id v57 = v16;
  v56 = v20;
  id v55 = v17;
  v21 = sub_13DC4((uint64_t)v20);
  v60[0] = NSFontAttributeName;
  v60[1] = NSForegroundColorAttributeName;
  v61[0] = v21;
  v61[1] = v55;
  v22 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];
  id v59 = 0;
  double v23 = sub_13E8C(a1, v22, &v59, v57, a6);
  double v58 = v24;
  double v25 = v23;
  id v26 = v59;
  [v21 pointSize];
  CGFloat v28 = v27 * 0.17;
  v63.origin.CGFloat x = sub_14004(v21);
  CGFloat x = v63.origin.x;
  CGFloat y = v63.origin.y;
  CGFloat height = v63.size.height;
  CGFloat v33 = fmax(a6, v32);
  v63.size.width = v33;
  CGRectGetWidth(v63);
  UIRoundToViewScale();
  double v54 = v34;
  [v21 capHeight];
  double v53 = v35;
  [v21 ascender];
  double v52 = v36;
  v64.origin.CGFloat x = x;
  v64.origin.CGFloat y = y;
  v64.size.width = v33;
  v64.size.CGFloat height = height;
  double v51 = CGRectGetHeight(v64);
  [v21 capHeight];
  double v50 = v37;
  v62.width = v33;
  v62.CGFloat height = height;
  UIGraphicsBeginImageContextWithOptions(v62, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  [v55 setStroke];
  v39 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:v20];
  v40 = +[UIFontMetrics defaultMetrics];
  [v40 scaledValueForValue:v39 compatibleWithTraitCollection:2.0];
  double v42 = v41;

  v65.origin.CGFloat x = x;
  v65.origin.CGFloat y = y;
  v65.size.width = v33;
  v65.size.CGFloat height = height;
  CGRect v66 = CGRectInset(v65, 1.5, 1.5);
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v66.origin.x, v66.origin.y, v66.size.width, v66.size.height, fmax(fmin(v42, 4.0), 2.0));
  id v43 = objc_claimAutoreleasedReturnValue();
  v44 = (const CGPath *)[v43 CGPath];

  CGContextAddPath(CurrentContext, v44);
  CGContextSetLineWidth(CurrentContext, v28);
  CGContextStrokePath(CurrentContext);
  objc_msgSend(v26, "drawWithRect:options:attributes:context:", 33, v22, 0, v54, v53 - v52 + (v51 - v50) * 0.5, v25, v58);
  v19 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  if (a6 == 0.0)
  {
    if (v19)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)qword_40AD8, key, v19);
    }
    else
    {
      v19 = 0;
      CFDictionarySetValue((CFMutableDictionaryRef)qword_40AD8, key, +[NSNull null]);
    }
  }
LABEL_13:
  v45 = +[NSNull null];
  if (v45 == v19) {
    v46 = 0;
  }
  else {
    v46 = v19;
  }
  id v47 = v46;

  return v47;
}

void sub_13A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,_Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

double MFDefaultWidthForAddressLabelType(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  uint64_t v6 = +[NSBundle mainBundle];
  double v7 = MFDefaultWidthForAddressLabelTypeCustomBundle(a1, v5, v6, a3);

  return v7;
}

void sub_13C08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double MFDefaultWidthForAddressLabelTypeCustomBundle(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7 = a2;
  id v8 = a3;
  if (!v7)
  {
    id v9 = +[UIApplication sharedApplication];
    id v7 = [v9 preferredContentSizeCategory];
  }
  id v10 = sub_13DC4((uint64_t)v7);
  NSAttributedStringKey v14 = NSFontAttributeName;
  id v15 = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  sub_13E8C(a1, v11, 0, v8, a4);

  [v10 pointSize];
  v16.origin.CGFloat x = sub_14004(v10);
  double Width = CGRectGetWidth(v16);

  return Width;
}

void sub_13D70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_13DC4(uint64_t a1)
{
  os_log_t v1 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:a1];
  id v2 = +[UIFont boldSystemFontOfSize:7.5];
  uint64_t v3 = +[UIFontMetrics defaultMetrics];
  id v4 = [v3 scaledFontForFont:v2 compatibleWithTraitCollection:v1];

  return v4;
}

void sub_13E60(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

double sub_13E8C(uint64_t a1, void *a2, void *a3, void *a4, double a5)
{
  id v9 = a2;
  id v10 = a4;
  double v11 = 0.0;
  if (a5 > 0.0)
  {
    id v12 = +[UIScreen mainScreen];
    [v12 scale];
    double v14 = 1.0 / (v13 + v13);

    if (v14 + a5 + -6.0 >= 0.0) {
      double v11 = v14 + a5 + -6.0;
    }
    else {
      double v11 = 0.0;
    }
  }
  id v15 = sub_140D8(a1, 0, v10);
  double v16 = sub_1420C(v15, v9, 0.0);
  double v17 = v16;
  if (v11 <= 0.0 || v16 <= v11)
  {
    id v20 = v15;
    if (!a3) {
      goto LABEL_12;
    }
LABEL_11:
    *a3 = v20;
    goto LABEL_12;
  }
  id v20 = sub_140D8(a1, 1, v10);

  double v17 = sub_1420C(v20, v9, v11);
  if (a3) {
    goto LABEL_11;
  }
LABEL_12:

  return v17;
}

void sub_13FD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CGFloat sub_14004(void *a1)
{
  id v1 = a1;
  [v1 capHeight];
  [v1 capHeight];
  UIRoundToViewScale();
  UIRoundToViewScale();
  [v1 capHeight];
  UIRoundToViewScale();

  return CGPointZero.x;
}

void sub_140C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_140D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (a1 == 3 || a1 == 2)
  {
    uint64_t v6 = MFLookupLocalizedString();
  }
  else
  {
    if (a1 != 1)
    {
      id v7 = 0;
      goto LABEL_10;
    }
    uint64_t v6 = [v4 localizedStringForKey:@"FROM_LABEL" value:&stru_39200 table:@"Main"];
  }
  id v7 = (void *)v6;
LABEL_10:

  return v7;
}

void sub_141F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_1420C(void *a1, void *a2, double a3)
{
  id v5 = a1;
  id v6 = a2;
  if (a3 <= 0.0)
  {
    [v5 sizeWithAttributes:v6];
    double v8 = v9;
  }
  else
  {
    objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 33, v6, 0, a3, 0.0);
    double v8 = v7;
  }

  return v8;
}

void sub_142A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14528(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_146B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_147A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_14848(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_14900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_149B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14A64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_14CA4(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_14ED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1513C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1522C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_154B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1585C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_159A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15A28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15B14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15BA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15CF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15D68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15FDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_160B0()
{
  if (qword_40AF0 != -1) {
    dispatch_once(&qword_40AF0, &stru_38D68);
  }
  v0 = (uint64_t (*)())dlsym((void *)qword_40AE8, "BPSBridgeTintColor");
  off_407A8[0] = v0;

  return v0();
}

void sub_16118(id a1)
{
  qword_40AE8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/BridgePreferences.framework/BridgePreferences", 2);
  if (!qword_40AE8) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/BridgePreferences.framework/BridgePreferences");
  }
}

void sub_161A8(id a1)
{
  qword_40AF8 = objc_alloc_init(MFNanoBridgeSettingsManager);

  _objc_release_x1();
}

void sub_16354(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1646C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v10 = v9;

  a9.super_class = (Class)MFNanoBridgeSettingsManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_166CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_169BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_16AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_16C0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_16DD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_17220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_174B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1751C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_17778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_17CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_17DD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17E88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17FF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18094(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_181A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1832C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_185F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1872C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_187C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18D38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18DB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18E4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18F3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class sub_198B4()
{
  if (qword_40B78 != -1) {
    dispatch_once(&qword_40B78, &stru_38DF0);
  }
  Class result = objc_getClass("NPSManager");
  qword_40B68 = (uint64_t)result;
  off_407B0[0] = (uint64_t (*)())sub_19918;
  return result;
}

id sub_19918()
{
  return (id)qword_40B68;
}

void sub_19924(id a1)
{
  qword_40B70 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/NanoPreferencesSync.framework/NanoPreferencesSync", 2);
  if (!qword_40B70) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/NanoPreferencesSync.framework/NanoPreferencesSync");
  }
}

Class sub_19960()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  Class result = objc_getClass("NNMKAccountIdentity");
  qword_40B80 = (uint64_t)result;
  off_407B8[0] = (uint64_t (*)())sub_199C4;
  return result;
}

id sub_199C4()
{
  return (id)qword_40B80;
}

void sub_199D0(id a1)
{
  qword_40B88 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/NanoMailKitServer.framework/NanoMailKitServer", 2);
  if (!qword_40B88) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/NanoMailKitServer.framework/NanoMailKitServer");
  }
}

id sub_19A0C()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  v0 = (id *)dlsym((void *)qword_40B88, "NanoMailLinesOfPreviewKey");
  objc_storeStrong((id *)&qword_40B28, *v0);
  off_407C0[0] = (uint64_t (*)())sub_19AA0;
  id v1 = (void *)qword_40B28;

  return v1;
}

id sub_19AA0()
{
  return (id)qword_40B28;
}

uint64_t sub_19AAC()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  uint64_t result = *(void *)dlsym((void *)qword_40B88, "NanoMailDefaultLinesOfPreview");
  qword_40B98 = result;
  off_407C8[0] = sub_19B1C;
  return result;
}

uint64_t sub_19B1C()
{
  return qword_40B98;
}

id sub_19B28()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  v0 = (id *)dlsym((void *)qword_40B88, "NanoMailAskBeforeDeletingKey");
  objc_storeStrong((id *)&qword_40B30, *v0);
  off_407D0[0] = (uint64_t (*)())sub_19BBC;
  id v1 = (void *)qword_40B30;

  return v1;
}

id sub_19BBC()
{
  return (id)qword_40B30;
}

uint64_t sub_19BC8()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  uint64_t result = *(unsigned __int8 *)dlsym((void *)qword_40B88, "NanoMailDefaultAskBeforeDeleting");
  byte_40BA0 = result;
  off_407D8[0] = sub_19C38;
  return result;
}

uint64_t sub_19C38()
{
  return byte_40BA0;
}

id sub_19C44()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  v0 = (id *)dlsym((void *)qword_40B88, "NanoMailLoadRemoteImagesKey");
  objc_storeStrong((id *)&qword_40B38, *v0);
  off_407E0[0] = (uint64_t (*)())sub_19CD8;
  id v1 = (void *)qword_40B38;

  return v1;
}

id sub_19CD8()
{
  return (id)qword_40B38;
}

uint64_t sub_19CE4()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  uint64_t result = *(unsigned __int8 *)dlsym((void *)qword_40B88, "NanoMailDefaultLoadRemoteImages");
  byte_40BA1 = result;
  off_407E8[0] = sub_19D54;
  return result;
}

uint64_t sub_19D54()
{
  return byte_40BA1;
}

id sub_19D60()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  v0 = (id *)dlsym((void *)qword_40B88, "NanoMailOrganizeByThreadKey");
  objc_storeStrong((id *)&qword_40B08, *v0);
  off_407F0[0] = (uint64_t (*)())sub_19DF4;
  id v1 = (void *)qword_40B08;

  return v1;
}

id sub_19DF4()
{
  return (id)qword_40B08;
}

uint64_t sub_19E00()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  uint64_t result = *(unsigned __int8 *)dlsym((void *)qword_40B88, "NanoMailDefaultOrganizeByThread");
  byte_40BA2 = result;
  off_407F8[0] = sub_19E70;
  return result;
}

uint64_t sub_19E70()
{
  return byte_40BA2;
}

id sub_19E7C()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  v0 = (id *)dlsym((void *)qword_40B88, "NanoMailSwipeRightActionKey");
  objc_storeStrong((id *)&qword_40B10, *v0);
  off_40800[0] = (uint64_t (*)())sub_19F10;
  id v1 = (void *)qword_40B10;

  return v1;
}

id sub_19F10()
{
  return (id)qword_40B10;
}

id sub_19F1C()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  v0 = (id *)dlsym((void *)qword_40B88, "NanoMailDefaultSwipeRightAction");
  objc_storeStrong((id *)&qword_40B58, *v0);
  off_40808[0] = (uint64_t (*)())sub_19FB0;
  id v1 = (void *)qword_40B58;

  return v1;
}

id sub_19FB0()
{
  return (id)qword_40B58;
}

id sub_19FBC()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  v0 = (id *)dlsym((void *)qword_40B88, "NanoMailSignatureKey");
  objc_storeStrong((id *)&qword_40B18, *v0);
  off_40810[0] = (uint64_t (*)())sub_1A050;
  id v1 = (void *)qword_40B18;

  return v1;
}

id sub_1A050()
{
  return (id)qword_40B18;
}

Class sub_1A05C()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  Class result = objc_getClass("NNMKSyncProvider");
  qword_40BA8 = (uint64_t)result;
  off_40818[0] = (uint64_t (*)())sub_1A0C0;
  return result;
}

id sub_1A0C0()
{
  return (id)qword_40BA8;
}

id sub_1A0CC()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  v0 = (id *)dlsym((void *)qword_40B88, "NanoMailDefaultSignatureLocalizationKey");
  objc_storeStrong((id *)&qword_40B60, *v0);
  off_40820[0] = (uint64_t (*)())sub_1A160;
  id v1 = (void *)qword_40B60;

  return v1;
}

id sub_1A160()
{
  return (id)qword_40B60;
}

id sub_1A16C()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  v0 = (id *)dlsym((void *)qword_40B88, "NanoMailAlwaysLoadContentDirectlyKey");
  objc_storeStrong((id *)&qword_40B48, *v0);
  off_40828[0] = (uint64_t (*)())sub_1A200;
  id v1 = (void *)qword_40B48;

  return v1;
}

id sub_1A200()
{
  return (id)qword_40B48;
}

uint64_t sub_1A20C()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  uint64_t result = *(unsigned __int8 *)dlsym((void *)qword_40B88, "NanoMailDefaultAlwaysLoadContentDirectly");
  byte_40BB0 = result;
  off_40830[0] = sub_1A27C;
  return result;
}

uint64_t sub_1A27C()
{
  return byte_40BB0;
}

id sub_1A288()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  v0 = (id *)dlsym((void *)qword_40B88, "NanoMailCloudNotificationsEnabledKey");
  objc_storeStrong((id *)&qword_40B50, *v0);
  off_40838[0] = (uint64_t (*)())sub_1A31C;
  id v1 = (void *)qword_40B50;

  return v1;
}

id sub_1A31C()
{
  return (id)qword_40B50;
}

uint64_t sub_1A328()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  uint64_t result = *(unsigned __int8 *)dlsym((void *)qword_40B88, "NanoMailDefaultCloudNotificationsEnabled");
  byte_40BB1 = result;
  off_40840[0] = sub_1A398;
  return result;
}

uint64_t sub_1A398()
{
  return byte_40BB1;
}

id sub_1A3A4()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  v0 = (id *)dlsym((void *)qword_40B88, "NanoMailPrivacyProtectionKey");
  objc_storeStrong((id *)&qword_40B40, *v0);
  off_40848[0] = (uint64_t (*)())sub_1A438;
  id v1 = (void *)qword_40B40;

  return v1;
}

id sub_1A438()
{
  return (id)qword_40B40;
}

id sub_1A444()
{
  if (qword_40B90 != -1) {
    dispatch_once(&qword_40B90, &stru_38E10);
  }
  v0 = (id *)dlsym((void *)qword_40B88, "NanoMailDefaultAccountUidKey");
  objc_storeStrong((id *)&qword_40B20, *v0);
  off_40850[0] = (uint64_t (*)())sub_1A4D8;
  id v1 = (void *)qword_40B20;

  return v1;
}

id sub_1A4D8()
{
  return (id)qword_40B20;
}

Class sub_1A4E4()
{
  if (qword_40B78 != -1) {
    dispatch_once(&qword_40B78, &stru_38DF0);
  }
  Class result = objc_getClass("NPSDomainAccessor");
  qword_40BB8 = (uint64_t)result;
  off_40858 = (uint64_t (*)())sub_1A548;
  return result;
}

id sub_1A548()
{
  return (id)qword_40BB8;
}

uint64_t MFSwipeDirectionForLeading(int a1, void *a2)
{
  uint64_t v3 = [a2 traitCollection];
  id v4 = (char *)[v3 layoutDirection];

  uint64_t v5 = 1;
  if (a1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  if (a1) {
    uint64_t v5 = 2;
  }
  if (v4 == (unsigned char *)&dword_0 + 1) {
    return v6;
  }
  else {
    return v5;
  }
}

void sub_1A798(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1A844()
{
  v0 = (void *)qword_40BC0;
  if (!qword_40BC0)
  {
    v4[0] = @"SwipeActionNone";
    v4[1] = @"SwipeActionRead";
    v5[0] = &off_3B630;
    v5[1] = &off_3B648;
    v4[2] = @"SwipeActionFlag";
    v4[3] = @"SwipeActionMove";
    v5[2] = &off_3B660;
    v5[3] = &off_3B678;
    v4[4] = @"SwipeActionTrash";
    v4[5] = @"SwipeActionArchive";
    v5[4] = &off_3B690;
    v5[5] = &off_3B6A8;
    v4[6] = @"SwipeActionAlternateDestructiveAction";
    v5[6] = &off_3B6C0;
    uint64_t v1 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
    id v2 = (void *)qword_40BC0;
    qword_40BC0 = v1;

    v0 = (void *)qword_40BC0;
  }

  return v0;
}

void sub_1AA34(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

id _ConfigurePSSpecifier(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  id v28 = a1;
  id v27 = a11;
  id v26 = a12;
  id v25 = a13;
  v18 = +[PSSpecifier preferenceSpecifierNamed:a2 target:a3 set:a4 get:a5 detail:a8 cell:a9 edit:a10];
  [v18 setKeyboardType:a6 autoCaps:a7 autoCorrection:0];
  v19 = [v27 objectForKey:@"titles"];
  id v20 = v19;
  if (v19 && (id v21 = [v19 count], v21 == objc_msgSend(v25, "count")))
  {
    [v18 setValues:v25 titles:v20];
    [v27 removeObjectForKey:@"titles"];
  }
  else
  {
    [v18 setValues:v25];
  }
  if (v26) {
    [v18 setProperty:v26 forKey:PSKeyNameKey];
  }
  [v18 setUserInfo:v27];
  if (v28) {
    [v28 addObject:v18];
  }

  return v18;
}

void sub_1AC00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

id _ConfigureBooleanPSSpecifier(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  id v23 = a1;
  id v18 = a11;
  id v19 = a12;
  id v20 = +[PSSpecifier preferenceSpecifierNamed:a2 target:a3 set:a4 get:a5 detail:a8 cell:a9 edit:a10];
  [v20 setKeyboardType:a6 autoCaps:a7 autoCorrection:0];
  if (v19) {
    [v20 setProperty:v19 forKey:PSKeyNameKey];
  }
  [v20 setUserInfo:v18];
  if (v23) {
    [v23 addObject:v20];
  }

  return v20;
}

void sub_1AD64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1AE98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B1F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B2F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B42C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B7F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B8C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id getMailPreferenceValueWithDefault(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = +[NSUserDefaults em_userDefaults];
  id v6 = [v5 valueForKey:v3];

  if (!v6) {
    id v6 = v4;
  }

  return v6;
}

void sub_1BC34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getEmailPreferenceValue(void *a1)
{
  id v1 = a1;
  id v2 = +[NSUserDefaults em_userDefaults];
  id v3 = [v2 valueForKey:v1];

  return v3;
}

void sub_1BCC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getEmailPreferenceBoolValue(void *a1)
{
  id v1 = a1;
  id v2 = +[NSUserDefaults em_userDefaults];
  id v3 = [v2 BOOLForKey:v1];

  return v3;
}

void sub_1BD34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void setEmailPreferenceValue(void *a1, void *a2)
{
  id v5 = a1;
  id v3 = a2;
  id v4 = +[NSUserDefaults em_userDefaults];
  [v4 setObject:v3 forKey:v5];
  if (([v4 synchronize] & 1) == 0) {
    NSLog(@"Failed to synchronize");
  }
  CFPreferencesAppSynchronize(EMUserDefaultsMailAppGroup);
}

void sub_1BDF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void setEmailPreferenceBoolValue(void *a1, uint64_t a2)
{
  id v4 = a1;
  id v3 = +[NSNumber numberWithBool:a2];
  setEmailPreferenceValue(v4, v3);
}

void sub_1BE84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id getMailPreferenceValue(void *a1)
{
  id v1 = getMailPreferenceValueWithDefault(a1, 0);

  return v1;
}

id getMailBoolPreferenceValueWithDefault(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[NSNumber numberWithBool:a2];
  id v5 = getMailPreferenceValueWithDefault(v3, v4);

  id v6 = [v5 BOOLValue];
  return v6;
}

void sub_1BF4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getMailBoolPreferenceValue(void *a1)
{
  id v1 = getMailPreferenceValueWithDefault(a1, 0);
  id v2 = [v1 BOOLValue];

  return v2;
}

void sub_1BFB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL showToCCIndicators(int a1)
{
  unsigned int MailBoolPreferenceValue = dword_40860;
  if (dword_40860 < 0 || a1)
  {
    unsigned int MailBoolPreferenceValue = getMailBoolPreferenceValue(@"ShowToCCIndicators");
    dword_40860 = MailBoolPreferenceValue;
  }
  return MailBoolPreferenceValue != 0;
}

BOOL conversationViewShowsNewestAtTop(int a1)
{
  unsigned int MailBoolPreferenceValue = dword_40864;
  if (dword_40864 < 0 || a1)
  {
    unsigned int MailBoolPreferenceValue = getMailBoolPreferenceValue(@"ConversationViewShowsNewestAtTop");
    dword_40864 = MailBoolPreferenceValue;
  }
  return MailBoolPreferenceValue != 0;
}

BOOL conversationViewIncludesRelatedMessages(int a1)
{
  unsigned int v1 = dword_40868;
  if (dword_40868 < 0 || a1)
  {
    unsigned int v1 = getMailBoolPreferenceValue(@"ConversationViewExcludesRelatedMessages") ^ 1;
    dword_40868 = v1;
  }
  return v1 != 0;
}

BOOL collapseReadConversationMessages(int a1)
{
  unsigned int MailBoolPreferenceValueWithDefault = dword_4086C;
  if (dword_4086C < 0 || a1)
  {
    unsigned int MailBoolPreferenceValueWithDefault = getMailBoolPreferenceValueWithDefault(@"CollapseReadConversationMessages", 1);
    dword_4086C = MailBoolPreferenceValueWithDefault;
  }
  return MailBoolPreferenceValueWithDefault != 0;
}

id includeAttachmentsWithReplies(int a1)
{
  id v2 = (void *)qword_40BC8;
  if (qword_40BC8) {
    BOOL v3 = a1 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3)
  {
    id v4 = getMailPreferenceValueWithDefault(@"IncludeAttachmentReplies", @"IncludeAttachmentRepliesWhenAdding");
    id v5 = [v4 copy];
    id v6 = (void *)qword_40BC8;
    qword_40BC8 = (uint64_t)v5;

    id v2 = (void *)qword_40BC8;
  }

  return v2;
}

void sub_1C178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL mutedThreadsMoveToArchive(int a1)
{
  int v1 = dword_40870;
  if (dword_40870 < 0 || a1)
  {
    id v2 = getMailPreferenceValueWithDefault(EMUserDefaultMutedThreadActionKey, EMUserDefaultMutedThreadActionMarkAsRead);
    dword_40870 = [EMUserDefaultMutedThreadActionMoveToArchiveOrDelete isEqual:v2];

    int v1 = dword_40870;
  }
  return v1 != 0;
}

void sub_1C200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id rightSwipeSetting(int a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_40BD8);
  id v2 = (id)qword_40BD0;
  BOOL v3 = v2;
  if (v2) {
    BOOL v4 = a1 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    id v5 = v2;
  }
  else
  {
    id v5 = getMailPreferenceValueWithDefault(@"LeftEdgeSwipeAction", @"SwipeActionRead");

    if ((void *)qword_40BD0 != v5) {
      objc_storeStrong((id *)&qword_40BD0, v5);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_40BD8);

  return v5;
}

void sub_1C2CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id leftSwipeSetting(int a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_40BE8);
  id v2 = (id)qword_40BE0;
  BOOL v3 = v2;
  if (v2) {
    BOOL v4 = a1 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    id v5 = v2;
  }
  else
  {
    id v5 = getMailPreferenceValueWithDefault(@"RightEdgeSwipeAction", @"SwipeActionFlag");

    if ((void *)qword_40BE0 != v5) {
      objc_storeStrong((id *)&qword_40BE0, v5);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_40BE8);

  return v5;
}

void sub_1C398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id preferencesBundle()
{
  v0 = (void *)qword_40BF0;
  if (!qword_40BF0)
  {
    int v1 = UISystemRootDirectory();
    id v2 = [v1 stringByAppendingPathComponent:@"System/Library/PreferenceBundles/MobileMailSettings"];
    BOOL v3 = [v2 stringByAppendingPathExtension:@"bundle"];
    uint64_t v4 = +[NSBundle bundleWithPath:v3];
    id v5 = (void *)qword_40BF0;
    qword_40BF0 = v4;

    v0 = (void *)qword_40BF0;
  }

  return v0;
}

void sub_1C458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double MailTableCellTextLeftForLevel(uint64_t a1)
{
  id v2 = [UIApp preferredContentSizeCategory];
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v2);

  double result = 55.0;
  if (IsAccessibilityCategory) {
    double result = 16.0;
  }
  if (a1 >= 1)
  {
    double result = result + 31.0;
    if (a1 != 1) {
      return result + (float)((float)(a1 - 1) * 30.0);
    }
  }
  return result;
}

void sub_1C508(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double MailTableCellImageCenterForLevel(uint64_t a1)
{
  double v2 = MailTableCellTextLeftForLevel(a1);
  double v3 = 32.0;
  if (a1) {
    double v3 = 23.0;
  }
  return v2 + -9.5 + v3 * -0.5;
}

void sub_1C698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C7FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1CAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1CE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1D010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D11C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D3C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D4E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D590(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1D704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DACC(_Unwind_Exception *a1)
{
  double v9 = v8;

  _Unwind_Resume(a1);
}

void sub_1DCB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DE04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DF20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DFB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1E268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E324(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1E5A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v13 = v11;

  _Unwind_Resume(a1);
}

void sub_1E6F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E7C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1EA18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1EB10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1EF74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1F0EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1F19C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1F4FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, id a12)
{
  _Unwind_Resume(a1);
}

id sub_1F650(void *a1)
{
  id v1 = a1;
  double v2 = +[NSUserDefaults em_userDefaults];
  double v3 = [v2 stringForKey:v1];

  return v3;
}

void sub_1F6BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1F6EC(void *a1, uint64_t a2)
{
  id v4 = a1;
  double v3 = +[NSUserDefaults em_userDefaults];
  [v3 setValue:a2 forKey:v4];
}

void sub_1F754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1F83C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1F920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1F988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1FAF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1FEC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_20050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_200D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2014C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_202C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_204FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_20548(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_206D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20A24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_20D48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void sub_20D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20F44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString sub_210F0()
{
  sub_24920("UICTFontTextStyleShortEmphasizedBody", 0x24uLL, 1);
  swift_bridgeObjectRetain();
  NSString v2 = sub_24900();
  id v0 = v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v2;
}

uint64_t MobileMailSettingsPlacardCell.refreshCellContents(with:)(uint64_t a1)
{
  uint64_t v19 = a1;
  uint64_t v21 = 0;
  id v43 = sub_21E58;
  v46 = sub_22524;
  uint64_t v74 = 0;
  v73 = 0;
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  uint64_t v69 = 0;
  uint64_t v70 = 0;
  v67 = 0;
  v68 = 0;
  uint64_t v51 = sub_21724(&qword_408F0);
  uint64_t v48 = *(void *)(v51 - 8);
  uint64_t v49 = v51 - 8;
  unint64_t v20 = (*(void *)(v48 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  id v1 = (void *)__chkstk_darwin(v53);
  double v50 = (char *)&v19 - v20;
  uint64_t v74 = v2;
  v73 = v1;
  id v3 = v1;
  objc_msgSend(v53, "setSelectionStyle:", v21, v19);

  unint64_t v22 = sub_21794();
  uint64_t v29 = type metadata accessor for MobileMailSettingsPlacardCell();
  id v27 = sub_21824();
  int v33 = 1;
  sub_24920("MAIL", 4uLL, 1);
  uint64_t v23 = v4;
  id v26 = sub_24900();
  swift_bridgeObjectRelease();
  v31 = "Preferences";
  Builtin::Word v32 = 11;
  sub_24920("Preferences", 0xBuLL, v33 & 1);
  uint64_t v24 = v5;
  id v25 = sub_24900();
  swift_bridgeObjectRelease();
  p_base_props = &MFSignatureTextViewTableCell__classData.base_props;
  uint64_t v36 = 0;
  id v28 = objc_msgSend(v27, "localizedStringForKey:value:table:", v26);

  uint64_t v41 = sub_24910();
  uint64_t v56 = v6;
  uint64_t v71 = v41;
  uint64_t v72 = v6;

  id v39 = sub_21824();
  sub_24920("MOBILE_MAIL_SETTINGS_SUBTITLE", 0x1DuLL, v33 & 1);
  uint64_t v30 = v7;
  id v38 = sub_24900();
  swift_bridgeObjectRelease();
  sub_24920(v31, v32, v33 & 1);
  uint64_t v34 = v8;
  id v37 = sub_24900();
  swift_bridgeObjectRelease();
  id v40 = objc_msgSend(v39, (SEL)p_base_props[435], v38, v36, v37);

  uint64_t v42 = sub_24910();
  uint64_t v55 = v9;
  uint64_t v69 = v42;
  uint64_t v70 = v9;

  id v10 = v53;
  swift_bridgeObjectRetain();
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = v41;
  double v13 = v43;
  uint64_t v14 = v56;
  id v15 = (void *)v11;
  id v16 = v53;
  double v54 = v15;
  v15[2] = v53;
  v15[3] = v12;
  v15[4] = v14;
  v67 = v13;
  v68 = v15;
  id v17 = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v44 = &v57;
  uint64_t v58 = v41;
  uint64_t v59 = v56;
  uint64_t v60 = v42;
  uint64_t v61 = v55;
  CGSize v62 = v43;
  CGRect v63 = v54;
  uint64_t v45 = sub_21724(&qword_40900);
  sub_22540();
  sub_24880();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  int v47 = sub_24890();
  double v52 = (uint64_t *)&v64;
  uint64_t v65 = v51;
  unint64_t v66 = sub_2263C();
  sub_226C0(v52);
  sub_24870();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v50, v51);
  sub_24960();

  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21724(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2();
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

unint64_t sub_21794()
{
  uint64_t v2 = qword_408F8;
  if (!qword_408F8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_408F8);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for MobileMailSettingsPlacardCell()
{
  return self;
}

id sub_21824()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v0 = [(id)swift_getObjCClassFromMetadata() bundleForClass:ObjCClassFromMetadata];

  return v0;
}

void sub_2187C(void *a1, uint64_t a2, uint64_t a3, Swift::Double a4)
{
  Swift::Double v47 = a4;
  id v55 = a1;
  uint64_t v49 = a2;
  uint64_t v48 = a3;
  uint64_t v41 = 0;
  id v40 = sub_24084;
  uint64_t v70 = 0;
  uint64_t v69 = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  id v65 = 0;
  id v64 = 0;
  id v63 = 0;
  uint64_t v42 = sub_248A0();
  uint64_t v43 = *(void *)(v42 - 8);
  uint64_t v44 = v42 - 8;
  unint64_t v45 = (*(void *)(v43 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(0);
  v46 = (char *)&v18 - v45;
  uint64_t v50 = sub_248C0();
  uint64_t v51 = *(void *)(v50 - 8);
  uint64_t v52 = v50 - 8;
  unint64_t v53 = (*(void *)(v51 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (void *)__chkstk_darwin(v55);
  double v54 = (char *)&v18 - v53;
  uint64_t v70 = v5;
  uint64_t v69 = v4;
  uint64_t v67 = v6;
  uint64_t v68 = v7;
  id v8 = v4;
  id v66 = [v55 specifier];
  if (v66)
  {
    double v35 = &v66;
    id v36 = v66;
    id v9 = v66;
    sub_23FA8(v35);

    id v37 = [v36 target];
    id v39 = v37;
  }
  else
  {
    id v38 = 0;
    sub_23FA8(&v66);

    id v39 = v38;
  }
  id v34 = v39;
  if (v39)
  {
    id v33 = v34;
    id v30 = v34;
    self;
    uint64_t v10 = swift_dynamicCastObjCClass();
    uint64_t v31 = v10;
    if (v10)
    {
      uint64_t v29 = (void *)v31;
    }
    else
    {
      id v28 = 0;
      swift_unknownObjectRelease();
      uint64_t v29 = v28;
    }
    Builtin::Word v32 = v29;
  }
  else
  {
    Builtin::Word v32 = 0;
  }
  id v27 = v32;
  if (v32)
  {
    id v26 = v27;
    id v25 = v27;
    id v65 = v27;
    id v11 = v27;
    id v24 = [v25 navigationItem];
    id v64 = v24;

    id v23 = sub_22050();
    id v63 = v23;
    id v19 = sub_21E68(v49, v48, v47);
    objc_msgSend(v23, "setAttributedText:");

    uint64_t v20 = 0;
    sub_23FD4();
    id v22 = (id)sub_24970();
    id v12 = v24;
    id v13 = v23;
    uint64_t v14 = swift_allocObject();
    id v15 = v40;
    uint64_t v16 = v14;
    id v17 = v23;
    *(void *)(v16 + 16) = v24;
    *(void *)(v16 + 24) = v17;
    uint64_t v61 = v15;
    uint64_t v62 = v16;
    aBlock = _NSConcreteStackBlock;
    int v57 = 1107296256;
    int v58 = 0;
    uint64_t v59 = sub_22180;
    uint64_t v60 = &unk_39110;
    uint64_t v21 = _Block_copy(&aBlock);
    swift_release();
    sub_221D0();
    sub_221E8();
    sub_24980();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v46, v42);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v54, v50);
    _Block_release(v21);
  }
}

uint64_t sub_21E10()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_21E58(Swift::Double a1)
{
  sub_2187C(*(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), a1);
}

id sub_21E68(uint64_t a1, uint64_t a2, Swift::Double a3)
{
  sub_2274C();
  swift_bridgeObjectRetain();
  sub_21724(&qword_40920);
  sub_24A20();
  id v9 = v3;
  sub_227B4((id *)&NSForegroundColorAttributeName, v3);
  id v7 = [self labelColor];
  id v8 = [v7 colorWithAlphaComponent:sub_24950(a3)];

  v9[4] = sub_227EC();
  v9[1] = v8;
  sub_21FBC();
  type metadata accessor for Key();
  sub_228F8();
  uint64_t v4 = sub_248F0();
  return sub_22000(a1, a2, v4);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_21FBC()
{
}

id sub_22000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_23380(a1, a2, a3);
}

id sub_22050()
{
  sub_241FC();
  id v4 = sub_220F4();
  id v1 = self;
  NSString v2 = sub_210F0();
  id v3 = objc_msgSend(v1, "preferredFontForTextStyle:");

  [v4 setFont:v3];
  return v4;
}

id sub_220F4()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_2346C();
}

void sub_22124(void *a1, id a2)
{
  id v2 = a2;
  [a1 setTitleView:a2];
}

uint64_t sub_22180(uint64_t a1)
{
  id v3 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v1 = swift_retain();
  v3(v1);
  return swift_release();
}

uint64_t sub_221D0()
{
  return sub_248B0();
}

uint64_t sub_221E8()
{
  return sub_24990();
}

uint64_t sub_22280@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v33 = a7;
  uint64_t v21 = a1;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v28 = a5;
  uint64_t v29 = a6;
  id v22 = sub_2297C;
  v46 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v37 = sub_21724(&qword_40900);
  uint64_t v31 = *(void *)(v37 - 8);
  uint64_t v32 = v37 - 8;
  uint64_t v19 = *(void *)(v31 + 64);
  unint64_t v18 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v7 = __chkstk_darwin(v23);
  uint64_t v35 = (uint64_t)&v17 - v18;
  unint64_t v20 = v18;
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v36 = (uint64_t)&v17 - v20;
  v46 = (char *)&v17 - v20;
  uint64_t v44 = v9;
  uint64_t v45 = v8;
  uint64_t v42 = v10;
  uint64_t v43 = v11;
  uint64_t v40 = v12;
  uint64_t v41 = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v30 = (id)kMFMobileMailBundleIdentifier;
  id v14 = kMFMobileMailBundleIdentifier;
  uint64_t v26 = sub_24910();
  uint64_t v27 = v15;
  swift_retain();
  sub_248D0();

  unint64_t v34 = sub_22540();
  sub_22B58(v35, v37, v36);
  id v39 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
  uint64_t v38 = v31 + 8;
  v39(v35, v37);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v35, v36, v37);
  sub_22B58(v35, v37, v33);
  v39(v35, v37);
  return ((uint64_t (*)(uint64_t, uint64_t))v39)(v36, v37);
}

uint64_t sub_22524@<X0>(uint64_t a1@<X8>)
{
  return sub_22280(v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], a1);
}

unint64_t sub_22540()
{
  uint64_t v2 = qword_40908;
  if (!qword_40908)
  {
    sub_225C4(&qword_40900);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_40908);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_225C4(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }
  return v4;
}

unint64_t sub_2263C()
{
  uint64_t v2 = qword_40910;
  if (!qword_40910)
  {
    sub_225C4(&qword_408F0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_40910);
    return WitnessTable;
  }
  return v2;
}

uint64_t *sub_226C0(uint64_t *result)
{
  id v3 = result;
  if ((*(_DWORD *)(*(void *)(result[3] - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v1 = swift_allocBox();
    double result = v2;
    uint64_t *v3 = v1;
  }
  return result;
}

unint64_t sub_2274C()
{
  uint64_t v2 = qword_40918;
  if (!qword_40918)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_40918);
    return ObjCClassMetadata;
  }
  return v2;
}

void *sub_227B4(id *a1, void *a2)
{
  id v4 = *a1;
  id v2 = *a1;
  double result = a2;
  *a2 = v4;
  return result;
}

unint64_t sub_227EC()
{
  uint64_t v2 = qword_40928;
  if (!qword_40928)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_40928);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for Key()
{
  uint64_t v4 = qword_40960;
  if (!qword_40960)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_40960);
      return v1;
    }
  }
  return v4;
}

unint64_t sub_228F8()
{
  uint64_t v2 = qword_40930;
  if (!qword_40930)
  {
    type metadata accessor for Key();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_40930);
    return WitnessTable;
  }
  return v2;
}

void sub_2297C(uint64_t a1)
{
  uint64_t v5 = a1;
  uint64_t v19 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = sub_24860();
  uint64_t v6 = *(void *)(v8 - 8);
  uint64_t v7 = v8 - 8;
  unint64_t v4 = (*(void *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v1 = (char *)&v4 - v4;
  uint64_t v9 = (char *)&v4 - v4;
  uint64_t v19 = __chkstk_darwin(v5);
  id v18 = [self sharedApplication];
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v1, v5, v8);
  sub_24850(v2);
  id v17 = v3;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v8);
  sub_21724(&qword_40990);
  uint64_t v11 = sub_24A20();
  uint64_t v12 = type metadata accessor for OpenExternalURLOptionsKey();
  unint64_t v14 = sub_23F24();
  uint64_t v13 = (char *)&type metadata for Any + 8;
  uint64_t v15 = sub_248F0();
  Class isa = sub_248E0().super.isa;
  swift_bridgeObjectRelease();
  [v18 openURL:v17 options:isa completionHandler:0];
}

uint64_t sub_22B58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1);
}

id MobileMailSettingsPlacardCell.__allocating_init(style:reuseIdentifier:specifier:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v13 = objc_allocWithZone(v4);
  if (a3)
  {
    NSString v9 = sub_24900();
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(v13, "initWithStyle:reuseIdentifier:specifier:", a1, v9);
  }
  else
  {
    id v5 = objc_msgSend(v13, "initWithStyle:reuseIdentifier:specifier:", a1, 0);
  }
  id v8 = v5;

  return v8;
}

id MobileMailSettingsPlacardCell.init(style:reuseIdentifier:specifier:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v18 = 0;
  uint64_t v17 = a1;
  uint64_t v15 = a2;
  uint64_t v16 = a3;
  unint64_t v14 = a4;
  swift_bridgeObjectRetain();
  if (a3)
  {
    NSString v8 = sub_24900();
    swift_bridgeObjectRelease();
    NSString v9 = v8;
  }
  else
  {
    NSString v9 = 0;
  }
  v13.receiver = 0;
  v13.super_class = (Class)type metadata accessor for MobileMailSettingsPlacardCell();
  id v7 = objc_msgSendSuper2(&v13, "initWithStyle:reuseIdentifier:specifier:", a1, v9, a4);

  if (v7)
  {
    id v4 = v7;
    id v18 = v7;

    swift_bridgeObjectRelease();
    return v7;
  }
  else
  {

    swift_bridgeObjectRelease();
    return 0;
  }
}

id MobileMailSettingsPlacardCell.__allocating_init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v10 = objc_allocWithZone(v3);
  if (a3)
  {
    NSString v6 = sub_24900();
    swift_bridgeObjectRelease();
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  id v5 = objc_msgSend(v10, "initWithStyle:reuseIdentifier:", a1);

  return v5;
}

id MobileMailSettingsPlacardCell.init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v14 = 0;
  uint64_t v13 = a1;
  uint64_t v11 = a2;
  uint64_t v12 = a3;
  swift_bridgeObjectRetain();
  if (a3)
  {
    NSString v6 = sub_24900();
    swift_bridgeObjectRelease();
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  v10.receiver = 0;
  v10.super_class = (Class)type metadata accessor for MobileMailSettingsPlacardCell();
  id v5 = objc_msgSendSuper2(&v10, "initWithStyle:reuseIdentifier:", a1, v7);

  id v3 = v5;
  id v14 = v5;
  swift_bridgeObjectRelease();

  return v5;
}

id MobileMailSettingsPlacardCell.__allocating_init(coder:)(void *a1)
{
  id v4 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v4;
}

id MobileMailSettingsPlacardCell.init(coder:)(void *a1)
{
  id v8 = 0;
  id v7 = a1;
  v6.receiver = 0;
  v6.super_class = (Class)type metadata accessor for MobileMailSettingsPlacardCell();
  id v5 = objc_msgSendSuper2(&v6, "initWithCoder:", a1);
  if (v5)
  {
    id v1 = v5;
    id v8 = v5;

    return v5;
  }
  else
  {

    return 0;
  }
}

id MobileMailSettingsPlacardCell.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MobileMailSettingsPlacardCell();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_23380(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v9 = sub_24900();
  if (a3)
  {
    type metadata accessor for Key();
    sub_228F8();
    Class isa = sub_248E0().super.isa;
    swift_bridgeObjectRelease();
    Class v6 = isa;
  }
  else
  {
    Class v6 = 0;
  }
  id v4 = objc_msgSend(v7, "initWithString:attributes:", v9);

  swift_bridgeObjectRelease();
  return v4;
}

id sub_2346C()
{
  return [v0 init];
}

uint64_t sub_23490()
{
  return sub_24A10();
}

uint64_t sub_234CC()
{
  return sub_249E0();
}

uint64_t sub_23518()
{
  return sub_249F0() & 1;
}

uint64_t sub_23568()
{
  return sub_24A00();
}

uint64_t sub_235B4()
{
  return sub_249A0();
}

uint64_t sub_235F4()
{
  return sub_249D0();
}

uint64_t sub_2363C()
{
  return sub_249B0();
}

uint64_t sub_23684()
{
  return sub_24A10();
}

uint64_t sub_236C0()
{
  return sub_249E0();
}

uint64_t sub_2370C()
{
  return sub_249F0() & 1;
}

uint64_t sub_2375C()
{
  return sub_24A00();
}

uint64_t sub_237A8()
{
  return sub_249A0();
}

uint64_t sub_237E8()
{
  return sub_249D0();
}

uint64_t sub_23830()
{
  return sub_249B0();
}

uint64_t sub_23878()
{
  return sub_24A30() & 1;
}

uint64_t sub_238C4()
{
  return sub_24A30() & 1;
}

NSString sub_23910@<X0>(void *a1@<X8>)
{
  NSString result = sub_23948();
  *a1 = result;
  return result;
}

NSString sub_23948()
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_24900();
  id v0 = v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v2;
}

uint64_t sub_239A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_239D8(*v1);
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_239D8(void *a1)
{
  id v1 = a1;
  uint64_t v4 = sub_24910();

  return v4;
}

uint64_t sub_23A28()
{
  return sub_249C0();
}

unint64_t sub_23A74()
{
  return sub_23A8C();
}

unint64_t sub_23A8C()
{
  uint64_t v2 = qword_40968;
  if (!qword_40968)
  {
    type metadata accessor for Key();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_40968);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_23B10()
{
  return sub_23B28();
}

unint64_t sub_23B28()
{
  uint64_t v2 = qword_40970;
  if (!qword_40970)
  {
    type metadata accessor for Key();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_40970);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_23BAC()
{
  return sub_23BC4();
}

unint64_t sub_23BC4()
{
  uint64_t v2 = qword_40978;
  if (!qword_40978)
  {
    type metadata accessor for Key();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_40978);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_23C48()
{
  uint64_t v2 = qword_40980;
  if (!qword_40980)
  {
    type metadata accessor for Key();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_40980);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_23CCC()
{
  uint64_t v2 = qword_40988;
  if (!qword_40988)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_40988);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_23D48()
{
  return sub_249C0();
}

uint64_t sub_23D94(uint64_t result)
{
  uint64_t v3 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (result > 0)
    {
      sub_248A0();
      uint64_t v1 = sub_24930();
      *(void *)(v1 + 16) = v3;
      uint64_t v2 = (void *)v1;
    }
    else
    {
      swift_retain();
      uint64_t v2 = &_swiftEmptyArrayStorage;
    }
    sub_248A0();
    return (uint64_t)v2;
  }
  return result;
}

void sub_23E74()
{
  void *v0 = *v0;
}

uint64_t type metadata accessor for OpenExternalURLOptionsKey()
{
  uint64_t v4 = qword_409C8;
  if (!qword_409C8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_409C8);
      return v1;
    }
  }
  return v4;
}

unint64_t sub_23F24()
{
  uint64_t v2 = qword_40998;
  if (!qword_40998)
  {
    type metadata accessor for OpenExternalURLOptionsKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_40998);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_23FA8(id *a1)
{
}

unint64_t sub_23FD4()
{
  uint64_t v2 = qword_409A0;
  if (!qword_409A0)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_409A0);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_2403C()
{
  return swift_deallocObject();
}

void sub_24084()
{
  sub_22124(*(void **)(v0 + 16), *(id *)(v0 + 24));
}

uint64_t sub_24090(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_240D8()
{
  return swift_release();
}

unint64_t sub_240F4()
{
  uint64_t v2 = qword_409A8;
  if (!qword_409A8)
  {
    sub_248A0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_409A8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24178()
{
  uint64_t v2 = qword_409B8;
  if (!qword_409B8)
  {
    sub_225C4(&qword_409B0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_409B8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_241FC()
{
  uint64_t v2 = qword_409C0;
  if (!qword_409C0)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_409C0);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_24264()
{
  return sub_2427C();
}

unint64_t sub_2427C()
{
  uint64_t v2 = qword_409D0;
  if (!qword_409D0)
  {
    type metadata accessor for OpenExternalURLOptionsKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_409D0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24300()
{
  return sub_24318();
}

unint64_t sub_24318()
{
  uint64_t v2 = qword_409D8;
  if (!qword_409D8)
  {
    type metadata accessor for OpenExternalURLOptionsKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_409D8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2439C()
{
  return sub_243B4();
}

unint64_t sub_243B4()
{
  uint64_t v2 = qword_409E0;
  if (!qword_409E0)
  {
    type metadata accessor for OpenExternalURLOptionsKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_409E0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_24438()
{
  uint64_t v2 = qword_409E8;
  if (!qword_409E8)
  {
    type metadata accessor for OpenExternalURLOptionsKey();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_409E8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_244BC()
{
  return v0;
}

uint64_t sub_244E0()
{
  return swift_deallocClassInstance();
}

uint64_t sub_24520()
{
  return sub_244BC();
}

id sub_2455C()
{
  sub_21794();
  type metadata accessor for ResourceBundleClass();
  id result = sub_21824();
  qword_409F0 = (uint64_t)result;
  return result;
}

uint64_t *sub_245A4()
{
  if (qword_408E8 != -1) {
    swift_once();
  }
  return &qword_409F0;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_24630(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to register for app extensions changes error: %{public}@", buf, 0xCu);
}

void sub_24688(uint64_t a1, char a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a2 & 1;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "#Nano Attempt to recover mailboxUid for MFNanoBridgeSettingsAccountSpecificMailbox failed. (Id: %{public}@, Active: %lu)", buf, 0x16u);
}

void sub_246E4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "#Nano Attempt to recover mailboxUid for MFNanoBridgeSettingsAccountSpecificMailbox failed. Account did not return valid mailboxUid for mailboxURL: %@", (uint8_t *)&v3, 0xCu);
}

void sub_24760(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "#Nano Unable to decode signature: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_247D8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "#Nano Posting NotificationCenter Notification Bridge Setting has Changed for key: %@", (uint8_t *)&v2, 0xCu);
}

void sub_24850(NSURL *retstr@<X8>)
{
}

uint64_t sub_24860()
{
  return type metadata accessor for URL();
}

uint64_t sub_24870()
{
  return UIHostingConfiguration.margins(_:_:)();
}

uint64_t sub_24880()
{
  return UIHostingConfiguration<>.init(content:)();
}

uint64_t sub_24890()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_248A0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_248B0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_248C0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_248D0()
{
  return SettingsPlacardView<>.init(localizedTitle:localizedSubtitle:applicationBundleIdentifier:updateNavigationTitleAlpha:linkAction:)();
}

NSDictionary sub_248E0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_248F0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

NSString sub_24900()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_24910()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_24920(Builtin::RawPointer _builtinStringLiteral, Builtin::Word utf8CodeUnitCount, Builtin::Int1 isASCII)
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(_builtinStringLiteral, utf8CodeUnitCount, isASCII)._countAndFlagsBits;
}

uint64_t sub_24930()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_24940()
{
  return type metadata accessor for Array();
}

double sub_24950(Swift::Double a1)
{
  return Double.init(_:)(a1);
}

uint64_t sub_24960()
{
  return UITableViewCell.contentConfiguration.setter();
}

uint64_t sub_24970()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_24980()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_24990()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_249A0()
{
  return _SwiftNewtypeWrapper<>.hashValue.getter();
}

uint64_t sub_249B0()
{
  return _SwiftNewtypeWrapper<>._rawHashValue(seed:)();
}

uint64_t sub_249C0()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t sub_249D0()
{
  return _SwiftNewtypeWrapper<>.hash(into:)();
}

uint64_t sub_249E0()
{
  return static _SwiftNewtypeWrapper<>._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_249F0()
{
  return static _SwiftNewtypeWrapper<>._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_24A00()
{
  return static _SwiftNewtypeWrapper<>._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_24A10()
{
  return _SwiftNewtypeWrapper<>._bridgeToObjectiveC()();
}

uint64_t sub_24A20()
{
  return _allocateUninitializedArray<A>(_:)();
}

uint64_t sub_24A30()
{
  return == infix<A>(_:_:)();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t EMBlackPearlIsFeatureEnabled()
{
  return _EMBlackPearlIsFeatureEnabled();
}

uint64_t EMIsGreymatterAvailableWithOverride()
{
  return _EMIsGreymatterAvailableWithOverride();
}

uint64_t MFDeviceSupportsNanoCompanion()
{
  return _MFDeviceSupportsNanoCompanion();
}

uint64_t MFLogGeneral()
{
  return _MFLogGeneral();
}

uint64_t MFLookupLocalizedString()
{
  return _MFLookupLocalizedString();
}

uint64_t MFUserAgent()
{
  return _MFUserAgent();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

uint64_t PSBundlePathForPreferenceBundle()
{
  return _PSBundlePathForPreferenceBundle();
}

uint64_t PSTextViewInsets()
{
  return _PSTextViewInsets();
}

uint64_t SFPerformSelector2()
{
  return _SFPerformSelector2();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t UIRoundToViewScale()
{
  return _UIRoundToViewScale();
}

uint64_t UISystemRootDirectory()
{
  return _UISystemRootDirectory();
}

uint64_t WebThreadLock()
{
  return _WebThreadLock();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _EFLocalizedString()
{
  return __EFLocalizedString();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_main_np(void)
{
  return _pthread_main_np();
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocObject()
{
  return _swift_deallocObject();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return _[a1 CGPath];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLString(void *a1, const char *a2, ...)
{
  return _[a1 URLString];
}

id objc_msgSend_URLStringFromLegacyURLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLStringFromLegacyURLString:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__addChildNode_toParentNode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addChildNode:toParentNode:");
}

id objc_msgSend__addGenericChildrenToMailboxTree_forNode_hideNotes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addGenericChildrenToMailboxTree:forNode:hideNotes:");
}

id objc_msgSend__addSpecialMailbox_toTree_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addSpecialMailbox:toTree:");
}

id objc_msgSend__applicationIconImageForFormat_precomposed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applicationIconImageForFormat:precomposed:");
}

id objc_msgSend__baseSwipeValues(void *a1, const char *a2, ...)
{
  return _[a1 _baseSwipeValues];
}

id objc_msgSend__blockedSenderActionOptionsSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _blockedSenderActionOptionsSpecifier];
}

id objc_msgSend__canSelectOptionAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canSelectOptionAtIndex:");
}

id objc_msgSend__configureSwipeDiagramInCell_atIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureSwipeDiagramInCell:atIndexPath:");
}

id objc_msgSend__descriptionText(void *a1, const char *a2, ...)
{
  return _[a1 _descriptionText];
}

id objc_msgSend__detailedSettingsWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_detailedSettingsWithOptions:");
}

id objc_msgSend__diagramSpecifierWithSwipeDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_diagramSpecifierWithSwipeDirection:");
}

id objc_msgSend__emailAddressStringsFromObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_emailAddressStringsFromObjects:");
}

id objc_msgSend__enableRTL(void *a1, const char *a2, ...)
{
  return _[a1 _enableRTL];
}

id objc_msgSend__findNodeForMailbox_removeNode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findNodeForMailbox:removeNode:");
}

id objc_msgSend__flatImageWithColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_flatImageWithColor:");
}

id objc_msgSend__getValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getValueForKey:");
}

id objc_msgSend__getValueForKey_perGizmo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getValueForKey:perGizmo:");
}

id objc_msgSend__groupTextIndentSize(void *a1, const char *a2, ...)
{
  return _[a1 _groupTextIndentSize];
}

id objc_msgSend__handleExtensionsAdded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleExtensionsAdded:");
}

id objc_msgSend__includeMailMailboxesFromDisk(void *a1, const char *a2, ...)
{
  return _[a1 _includeMailMailboxesFromDisk];
}

id objc_msgSend__includesMeIconImage(void *a1, const char *a2, ...)
{
  return _[a1 _includesMeIconImage];
}

id objc_msgSend__insertMailboxUidsFlattenedFromMailboxNode_intoArray_currentLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertMailboxUidsFlattenedFromMailboxNode:intoArray:currentLevel:");
}

id objc_msgSend__leftSwipeValues(void *a1, const char *a2, ...)
{
  return _[a1 _leftSwipeValues];
}

id objc_msgSend__loadAccounts(void *a1, const char *a2, ...)
{
  return _[a1 _loadAccounts];
}

id objc_msgSend__loadExtensionIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _loadExtensionIfNeeded];
}

id objc_msgSend__loadRemoteContentSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _loadRemoteContentSpecifier];
}

id objc_msgSend__mailAccountsDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _mailAccountsDidChange];
}

id objc_msgSend__mailboxSelectionFromPreviousOSVersion(void *a1, const char *a2, ...)
{
  return _[a1 _mailboxSelectionFromPreviousOSVersion];
}

id objc_msgSend__mailboxUid(void *a1, const char *a2, ...)
{
  return _[a1 _mailboxUid];
}

id objc_msgSend__messageContentAccessPermissionDetailsForExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_messageContentAccessPermissionDetailsForExtension:");
}

id objc_msgSend__messageContentPermissionsForExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_messageContentPermissionsForExtension:");
}

id objc_msgSend__messageModificationPermissionsForExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_messageModificationPermissionsForExtension:");
}

id objc_msgSend__messageRenderingPermissionsForExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_messageRenderingPermissionsForExtension:");
}

id objc_msgSend__mobileMailAskBeforeDeleting(void *a1, const char *a2, ...)
{
  return _[a1 _mobileMailAskBeforeDeleting];
}

id objc_msgSend__mobileMailDefaultAccountId(void *a1, const char *a2, ...)
{
  return _[a1 _mobileMailDefaultAccountId];
}

id objc_msgSend__mobileMailLoadRemoteImages(void *a1, const char *a2, ...)
{
  return _[a1 _mobileMailLoadRemoteImages];
}

id objc_msgSend__mobileMailOrganizeByThread(void *a1, const char *a2, ...)
{
  return _[a1 _mobileMailOrganizeByThread];
}

id objc_msgSend__mobileMailSwipeRightAction(void *a1, const char *a2, ...)
{
  return _[a1 _mobileMailSwipeRightAction];
}

id objc_msgSend__permissionsDetailParagraphStyle(void *a1, const char *a2, ...)
{
  return _[a1 _permissionsDetailParagraphStyle];
}

id objc_msgSend__permissionsSectionGroupTitleAtributedStringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_permissionsSectionGroupTitleAtributedStringWithString:");
}

id objc_msgSend__permissionsText(void *a1, const char *a2, ...)
{
  return _[a1 _permissionsText];
}

id objc_msgSend__preventTrackingSpecifiersWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preventTrackingSpecifiersWithOptions:");
}

id objc_msgSend__putMailboxesRootedAt_intoArray_hideNotes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_putMailboxesRootedAt:intoArray:hideNotes:");
}

id objc_msgSend__registerForExtensionsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _registerForExtensionsIfNeeded];
}

id objc_msgSend__reloadMailAccounts(void *a1, const char *a2, ...)
{
  return _[a1 _reloadMailAccounts];
}

id objc_msgSend__rightSwipeValues(void *a1, const char *a2, ...)
{
  return _[a1 _rightSwipeValues];
}

id objc_msgSend__saveValueToSharedPreference_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveValueToSharedPreference:forKey:");
}

id objc_msgSend__setDefaultAccountId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDefaultAccountId:");
}

id objc_msgSend__setIncludeMailMailboxes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIncludeMailMailboxes:");
}

id objc_msgSend__setSwipeRightAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setSwipeRightAction:");
}

id objc_msgSend__setValue_forKey_syncWithClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setValue:forKey:syncWithClient:");
}

id objc_msgSend__setValue_forKey_syncWithClient_perGizmo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setValue:forKey:syncWithClient:perGizmo:");
}

id objc_msgSend__shouldReverseLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 _shouldReverseLayoutDirection];
}

id objc_msgSend__shouldShowDefaultAccountButton(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowDefaultAccountButton];
}

id objc_msgSend__stringByReplacingCharactersInSet_withCharacter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringByReplacingCharactersInSet:withCharacter:");
}

id objc_msgSend__titlesForSwipeValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_titlesForSwipeValues:");
}

id objc_msgSend__treeOfAllMailboxesIncludingLocals_withOutbox_hideInbox_hideNotes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_treeOfAllMailboxesIncludingLocals:withOutbox:hideInbox:hideNotes:");
}

id objc_msgSend__updateInterfaceColorForTextView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateInterfaceColorForTextView:");
}

id objc_msgSend__writeBlockSenderEnabled_optionValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_writeBlockSenderEnabled:optionValue:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_accessoryType(void *a1, const char *a2, ...)
{
  return _[a1 accessoryType];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountForAccountIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountForAccountIdentifier:");
}

id objc_msgSend_accountRepository(void *a1, const char *a2, ...)
{
  return _[a1 accountRepository];
}

id objc_msgSend_accountSignaturesSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 accountSignaturesSpecifiers];
}

id objc_msgSend_accountUniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 accountUniqueIdentifier];
}

id objc_msgSend_accountWithUniqueId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountWithUniqueId:");
}

id objc_msgSend_actionOptionsSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 actionOptionsSpecifiers];
}

id objc_msgSend_actionWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithHandler:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activeAccounts(void *a1, const char *a2, ...)
{
  return _[a1 activeAccounts];
}

id objc_msgSend_activeAccountsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeAccountsWithError:");
}

id objc_msgSend_addAttributes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttributes:range:");
}

id objc_msgSend_addCancelable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCancelable:");
}

id objc_msgSend_addChild_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChild:");
}

id objc_msgSend_addChildMailbox_forMailboxNode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildMailbox:forMailboxNode:");
}

id objc_msgSend_addInvocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInvocation:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSharedSettingsToArray_ifFilterTypes_containsFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSharedSettingsToArray:ifFilterTypes:containsFilter:");
}

id objc_msgSend_addSpecialMailbox_toArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSpecialMailbox:toArray:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_aggregatedMailboxesFilterTypes(void *a1, const char *a2, ...)
{
  return _[a1 aggregatedMailboxesFilterTypes];
}

id objc_msgSend_allCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 allCapabilities];
}

id objc_msgSend_allKeysForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeysForObject:");
}

id objc_msgSend_allMailboxUids(void *a1, const char *a2, ...)
{
  return _[a1 allMailboxUids];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appPolicy(void *a1, const char *a2, ...)
{
  return _[a1 appPolicy];
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAttributedString:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appsLocalizedTitle(void *a1, const char *a2, ...)
{
  return _[a1 appsLocalizedTitle];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_areAnimationsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 areAnimationsEnabled];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return _[a1 ascender];
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return _[a1 autoupdatingCurrentLocale];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 becomeFirstResponder];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginUpdates];
}

id objc_msgSend_bezierPathWithRoundedRect_cornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithRoundedRect:cornerRadius:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_blockSenderEnabled(void *a1, const char *a2, ...)
{
  return _[a1 blockSenderEnabled];
}

id objc_msgSend_blockSenderOptionState(void *a1, const char *a2, ...)
{
  return _[a1 blockSenderOptionState];
}

id objc_msgSend_blockSenderSwitch(void *a1, const char *a2, ...)
{
  return _[a1 blockSenderSwitch];
}

id objc_msgSend_bodyAccess(void *a1, const char *a2, ...)
{
  return _[a1 bodyAccess];
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_boundingRectWithSize_options_attributes_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_canBecomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 canBecomeFirstResponder];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return _[a1 capHeight];
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return _[a1 capabilities];
}

id objc_msgSend_cellAction(void *a1, const char *a2, ...)
{
  return _[a1 cellAction];
}

id objc_msgSend_cellTarget(void *a1, const char *a2, ...)
{
  return _[a1 cellTarget];
}

id objc_msgSend_childEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 childEnumerator];
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return _[a1 children];
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_commitChangesAndDismissKeyboard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commitChangesAndDismissKeyboard:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_condition(void *a1, const char *a2, ...)
{
  return _[a1 condition];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentAsHTMLString(void *a1, const char *a2, ...)
{
  return _[a1 contentAsHTMLString];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return _[a1 contentOffset];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_customSignature(void *a1, const char *a2, ...)
{
  return _[a1 customSignature];
}

id objc_msgSend_daemonInterface(void *a1, const char *a2, ...)
{
  return _[a1 daemonInterface];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultAccessoryWidth(void *a1, const char *a2, ...)
{
  return _[a1 defaultAccessoryWidth];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultMailAccountForDelivery(void *a1, const char *a2, ...)
{
  return _[a1 defaultMailAccountForDelivery];
}

id objc_msgSend_defaultMetrics(void *a1, const char *a2, ...)
{
  return _[a1 defaultMetrics];
}

id objc_msgSend_defaultParagraphStyle(void *a1, const char *a2, ...)
{
  return _[a1 defaultParagraphStyle];
}

id objc_msgSend_defaultSelectedMailboxes(void *a1, const char *a2, ...)
{
  return _[a1 defaultSelectedMailboxes];
}

id objc_msgSend_defaultSignatureSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 defaultSignatureSpecifiers];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_descriptionText(void *a1, const char *a2, ...)
{
  return _[a1 descriptionText];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_displayNameUsingSpecialNames(void *a1, const char *a2, ...)
{
  return _[a1 displayNameUsingSpecialNames];
}

id objc_msgSend_domainAccessor(void *a1, const char *a2, ...)
{
  return _[a1 domainAccessor];
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawInRect:");
}

id objc_msgSend_drawWithRect_options_attributes_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawWithRect:options:attributes:context:");
}

id objc_msgSend_ea_uncommentedAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ea_uncommentedAddress");
}

id objc_msgSend_editingAccessoryType(void *a1, const char *a2, ...)
{
  return _[a1 editingAccessoryType];
}

id objc_msgSend_ef_filter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ef_filter:");
}

id objc_msgSend_ef_flatten(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ef_flatten");
}

id objc_msgSend_ef_insertObject_usingSortFunction_context_allowDuplicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ef_insertObject:usingSortFunction:context:allowDuplicates:");
}

id objc_msgSend_ef_map_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ef_map:");
}

id objc_msgSend_ef_publicDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ef_publicDescription");
}

id objc_msgSend_effectiveValuesForIntersectionSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveValuesForIntersectionSetting:");
}

id objc_msgSend_em_userDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "em_userDefaults");
}

id objc_msgSend_emailAddressesAndAliasesList(void *a1, const char *a2, ...)
{
  return _[a1 emailAddressesAndAliasesList];
}

id objc_msgSend_emitNavigationEventForRootController(void *a1, const char *a2, ...)
{
  return _[a1 emitNavigationEventForRootController];
}

id objc_msgSend_emitNavigationEventForSpecifier_viewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitNavigationEventForSpecifier:viewController:");
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 emptyGroupSpecifier];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return _[a1 endUpdates];
}

id objc_msgSend_extension(void *a1, const char *a2, ...)
{
  return _[a1 extension];
}

id objc_msgSend_extensionForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionForIdentifier:");
}

id objc_msgSend_extensionID(void *a1, const char *a2, ...)
{
  return _[a1 extensionID];
}

id objc_msgSend_finishWithResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithResult:error:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstResponder(void *a1, const char *a2, ...)
{
  return _[a1 firstResponder];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return _[a1 future];
}

id objc_msgSend_generalPasteboard(void *a1, const char *a2, ...)
{
  return _[a1 generalPasteboard];
}

id objc_msgSend_getCurrentSignatureSynchronously_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCurrentSignatureSynchronously:");
}

id objc_msgSend_groupSpecifierWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:");
}

id objc_msgSend_groupSpecifierWithID_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:name:");
}

id objc_msgSend_groupSpecifierWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithName:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasChildren(void *a1, const char *a2, ...)
{
  return _[a1 hasChildren];
}

id objc_msgSend_hasImages(void *a1, const char *a2, ...)
{
  return _[a1 hasImages];
}

id objc_msgSend_hasMessageContentAccess(void *a1, const char *a2, ...)
{
  return _[a1 hasMessageContentAccess];
}

id objc_msgSend_hasMultipleMailAccounts(void *a1, const char *a2, ...)
{
  return _[a1 hasMultipleMailAccounts];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_htmlSignature(void *a1, const char *a2, ...)
{
  return _[a1 htmlSignature];
}

id objc_msgSend_iconFromBundle_forType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iconFromBundle:forType:");
}

id objc_msgSend_iconString(void *a1, const char *a2, ...)
{
  return _[a1 iconString];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imageFlippedForRightToLeftLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 imageFlippedForRightToLeftLayoutDirection];
}

id objc_msgSend_imageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:");
}

id objc_msgSend_imageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:compatibleWithTraitCollection:");
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_imageWithTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithTintColor:");
}

id objc_msgSend_includeMailMailboxes(void *a1, const char *a2, ...)
{
  return _[a1 includeMailMailboxes];
}

id objc_msgSend_indexForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexForIndexPath:");
}

id objc_msgSend_indexOfGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfGroup:");
}

id objc_msgSend_indexOfSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfSpecifier:");
}

id objc_msgSend_indexPathForIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForIndex:");
}

id objc_msgSend_initSimpleHTMLDocumentWithStyle_frame_preferences_groupName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initSimpleHTMLDocumentWithStyle:frame:preferences:groupName:");
}

id objc_msgSend_initWithAccountUniqueIdentifier_mailboxURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountUniqueIdentifier:mailboxURL:");
}

id objc_msgSend_initWithBarButtonSystemItem_primaryAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:primaryAction:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCondition:");
}

id objc_msgSend_initWithData_options_documentAttributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:options:documentAttributes:error:");
}

id objc_msgSend_initWithDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:");
}

id objc_msgSend_initWithFrame_webView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:webView:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithKey_table_locale_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:table:locale:bundleURL:");
}

id objc_msgSend_initWithMailbox_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMailbox:");
}

id objc_msgSend_initWithMailboxUid_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMailboxUid:account:");
}

id objc_msgSend_initWithMarkdownString_options_baseURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMarkdownString:options:baseURL:error:");
}

id objc_msgSend_initWithName_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:target:set:get:detail:cell:edit:");
}

id objc_msgSend_initWithRootMailbox_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootMailbox:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithTargetClass_predicate_sortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTargetClass:predicate:sortDescriptors:");
}

id objc_msgSend_initWithTitle_detailText_symbolName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:detailText:symbolName:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_insertContiguousSpecifiers_afterSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertContiguousSpecifiers:afterSpecifier:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invocationWithSelector_target_object_taskName_priority_canBeCancelled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invocationWithSelector:target:object:taskName:priority:canBeCancelled:");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return _[a1 isEditing];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMailPrivacyProtectionAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isMailPrivacyProtectionAllowed];
}

id objc_msgSend_isMaild(void *a1, const char *a2, ...)
{
  return _[a1 isMaild];
}

id objc_msgSend_isSettingLockedDownByRestrictions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSettingLockedDownByRestrictions:");
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubclassOfClass:");
}

id objc_msgSend_isSyncingNotes(void *a1, const char *a2, ...)
{
  return _[a1 isSyncingNotes];
}

id objc_msgSend_isUserInteractionEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isUserInteractionEnabled];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 lastBaselineAnchor];
}

id objc_msgSend_layoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 layoutDirection];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return _[a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_legacyMailboxForObjectID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "legacyMailboxForObjectID:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return _[a1 level];
}

id objc_msgSend_linesOfPreviewTitles(void *a1, const char *a2, ...)
{
  return _[a1 linesOfPreviewTitles];
}

id objc_msgSend_localAccount(void *a1, const char *a2, ...)
{
  return _[a1 localAccount];
}

id objc_msgSend_localizedCaseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedCaseInsensitiveCompare:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringForSpecifierID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForSpecifierID:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return _[a1 log];
}

id objc_msgSend_mailAccounts(void *a1, const char *a2, ...)
{
  return _[a1 mailAccounts];
}

id objc_msgSend_mailInteractiveColor(void *a1, const char *a2, ...)
{
  return _[a1 mailInteractiveColor];
}

id objc_msgSend_mailbox(void *a1, const char *a2, ...)
{
  return _[a1 mailbox];
}

id objc_msgSend_mailboxFilterType(void *a1, const char *a2, ...)
{
  return _[a1 mailboxFilterType];
}

id objc_msgSend_mailboxId(void *a1, const char *a2, ...)
{
  return _[a1 mailboxId];
}

id objc_msgSend_mailboxProvider(void *a1, const char *a2, ...)
{
  return _[a1 mailboxProvider];
}

id objc_msgSend_mailboxRepository(void *a1, const char *a2, ...)
{
  return _[a1 mailboxRepository];
}

id objc_msgSend_mailboxType(void *a1, const char *a2, ...)
{
  return _[a1 mailboxType];
}

id objc_msgSend_mailboxURL(void *a1, const char *a2, ...)
{
  return _[a1 mailboxURL];
}

id objc_msgSend_mailboxUidForURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mailboxUidForURL:");
}

id objc_msgSend_mailboxUidOfType_createIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mailboxUidOfType:createIfNeeded:");
}

id objc_msgSend_mailboxesWithAllMessagesSyncEnabledIds(void *a1, const char *a2, ...)
{
  return _[a1 mailboxesWithAllMessagesSyncEnabledIds];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_mainThreadScheduler(void *a1, const char *a2, ...)
{
  return _[a1 mainThreadScheduler];
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeObjectsPerformSelector:");
}

id objc_msgSend_managedEmailDomains(void *a1, const char *a2, ...)
{
  return _[a1 managedEmailDomains];
}

id objc_msgSend_markupDescription(void *a1, const char *a2, ...)
{
  return _[a1 markupDescription];
}

id objc_msgSend_menuIcon(void *a1, const char *a2, ...)
{
  return _[a1 menuIcon];
}

id objc_msgSend_mf_isPad(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mf_isPad");
}

id objc_msgSend_mf_systemImageNamed_forView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mf_systemImageNamed:forView:");
}

id objc_msgSend_mirrorSettingsFromCompanion(void *a1, const char *a2, ...)
{
  return _[a1 mirrorSettingsFromCompanion];
}

id objc_msgSend_moveMailbox_toParent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveMailbox:toParent:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nano_activeMailAccounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nano_activeMailAccounts");
}

id objc_msgSend_nano_bridgeSettingsInboxesFromAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nano_bridgeSettingsInboxesFromAccounts:");
}

id objc_msgSend_nano_mailboxId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nano_mailboxId");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 newlineCharacterSet];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _[a1 nextObject];
}

id objc_msgSend_notifyMobileMailAskBeforeDeletingChanged(void *a1, const char *a2, ...)
{
  return _[a1 notifyMobileMailAskBeforeDeletingChanged];
}

id objc_msgSend_notifyMobileMailDefaultAccountUidChanged(void *a1, const char *a2, ...)
{
  return _[a1 notifyMobileMailDefaultAccountUidChanged];
}

id objc_msgSend_notifyMobileMailLoadRemoteImagesChanged(void *a1, const char *a2, ...)
{
  return _[a1 notifyMobileMailLoadRemoteImagesChanged];
}

id objc_msgSend_notifyMobileMailOrganizeByThreadChanged(void *a1, const char *a2, ...)
{
  return _[a1 notifyMobileMailOrganizeByThreadChanged];
}

id objc_msgSend_notifyMobileMailPrivacyProtectionChanged(void *a1, const char *a2, ...)
{
  return _[a1 notifyMobileMailPrivacyProtectionChanged];
}

id objc_msgSend_notifyMobileMailSwipeRightActionChanged(void *a1, const char *a2, ...)
{
  return _[a1 notifyMobileMailSwipeRightActionChanged];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return _[a1 objectID];
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orPredicateWithSubpredicates:");
}

id objc_msgSend_outboxContainsMessageFromAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outboxContainsMessageFromAccount:");
}

id objc_msgSend_outboxMailboxUid(void *a1, const char *a2, ...)
{
  return _[a1 outboxMailboxUid];
}

id objc_msgSend_outgoingMessageRepository(void *a1, const char *a2, ...)
{
  return _[a1 outgoingMessageRepository];
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return _[a1 parent];
}

id objc_msgSend_parentController(void *a1, const char *a2, ...)
{
  return _[a1 parentController];
}

id objc_msgSend_parentListController(void *a1, const char *a2, ...)
{
  return _[a1 parentListController];
}

id objc_msgSend_parentMailbox(void *a1, const char *a2, ...)
{
  return _[a1 parentMailbox];
}

id objc_msgSend_pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier_title_localizedNavigationComponents_deepLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:");
}

id objc_msgSend_performGetter(void *a1, const char *a2, ...)
{
  return _[a1 performGetter];
}

id objc_msgSend_performQuery_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performQuery:completionHandler:");
}

id objc_msgSend_performSyncBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSyncBlock:");
}

id objc_msgSend_plainTextFromHTMLSnippet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "plainTextFromHTMLSnippet:");
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_predicateForMailboxType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForMailboxType:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_primaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 primaryLabelColor];
}

id objc_msgSend_primaryMailboxUid(void *a1, const char *a2, ...)
{
  return _[a1 primaryMailboxUid];
}

id objc_msgSend_privacyProtectionEnabled(void *a1, const char *a2, ...)
{
  return _[a1 privacyProtectionEnabled];
}

id objc_msgSend_promise(void *a1, const char *a2, ...)
{
  return _[a1 promise];
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_ps_insertObject_afterObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ps_insertObject:afterObject:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_readFromSharedPreferencesValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readFromSharedPreferencesValueForKey:");
}

id objc_msgSend_registerMailAppExtensionsObserver_capabilities_includeDisabled_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerMailAppExtensionsObserver:capabilities:includeDisabled:completion:");
}

id objc_msgSend_reloadAccounts(void *a1, const char *a2, ...)
{
  return _[a1 reloadAccounts];
}

id objc_msgSend_reloadSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeContiguousSpecifiers_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeContiguousSpecifiers:animated:");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeNodeForMailbox_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeNodeForMailbox:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_replaceContiguousSpecifiers_withSpecifiers_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceContiguousSpecifiers:withSpecifiers:animated:");
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 resignFirstResponder];
}

id objc_msgSend_restrictedFromSendingExternally(void *a1, const char *a2, ...)
{
  return _[a1 restrictedFromSendingExternally];
}

id objc_msgSend_result_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "result:");
}

id objc_msgSend_rootDeepLinkURL(void *a1, const char *a2, ...)
{
  return _[a1 rootDeepLinkURL];
}

id objc_msgSend_rootLocalizedTitle(void *a1, const char *a2, ...)
{
  return _[a1 rootLocalizedTitle];
}

id objc_msgSend_rootMailbox(void *a1, const char *a2, ...)
{
  return _[a1 rootMailbox];
}

id objc_msgSend_rootMailboxNode(void *a1, const char *a2, ...)
{
  return _[a1 rootMailboxNode];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scaledFontForFont_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledFontForFont:compatibleWithTraitCollection:");
}

id objc_msgSend_scaledValueForValue_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledValueForValue:compatibleWithTraitCollection:");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_setAcceleratedDrawingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcceleratedDrawingEnabled:");
}

id objc_msgSend_setAcceptsEmoji_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcceptsEmoji:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setActionOptionsSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionOptionsSpecifiers:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setAllowsEditingTextAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsEditingTextAttributes:");
}

id objc_msgSend_setAnimationsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationsEnabled:");
}

id objc_msgSend_setAppPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppPolicy:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAutocapitalizationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocapitalizationType:");
}

id objc_msgSend_setAutocorrectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocorrectionType:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setAutosaves_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutosaves:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBlockSenderEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlockSenderEnabled:");
}

id objc_msgSend_setBlockSenderOptionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlockSenderOptionState:");
}

id objc_msgSend_setBlockSenderSwitch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlockSenderSwitch:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCell:");
}

id objc_msgSend_setClearButtonMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClearButtonMode:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:");
}

id objc_msgSend_setContentToHTMLString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentToHTMLString:");
}

id objc_msgSend_setControllerLoadAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControllerLoadAction:");
}

id objc_msgSend_setDatabasesEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDatabasesEnabled:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisabled:");
}

id objc_msgSend_setDiskImageCacheEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiskImageCacheEnabled:");
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayName:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setFirstLineHeadIndent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstLineHeadIndent:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHeadIndent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeadIndent:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIgnoresFocusingMouse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoresFocusingMouse:");
}

id objc_msgSend_setInboxesFilterTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInboxesFilterTypes:");
}

id objc_msgSend_setIncludeMailMailboxes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeMailMailboxes:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setJavaEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJavaEnabled:");
}

id objc_msgSend_setJavaScriptEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJavaScriptEnabled:");
}

id objc_msgSend_setKeyboardType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardType:");
}

id objc_msgSend_setKeyboardType_autoCaps_autoCorrection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardType:autoCaps:autoCorrection:");
}

id objc_msgSend_setLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLevel:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLoadsSynchronously_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLoadsSynchronously:");
}

id objc_msgSend_setLocalStorageEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalStorageEnabled:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setManagedEmailDomains_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManagedEmailDomains:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsUpdateConstraints];
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOfflineWebApplicationCacheEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOfflineWebApplicationCacheEnabled:");
}

id objc_msgSend_setParentListController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParentListController:");
}

id objc_msgSend_setParentMailbox_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParentMailbox:");
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setPlugInsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlugInsEnabled:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setSelectedMailboxes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedMailboxes:");
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionStyle:");
}

id objc_msgSend_setSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignature:");
}

id objc_msgSend_setSignature_forAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignature:forAccount:");
}

id objc_msgSend_setSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifier:");
}

id objc_msgSend_setSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifiers:");
}

id objc_msgSend_setStroke(void *a1, const char *a2, ...)
{
  return _[a1 setStroke];
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTarget:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTextLoupeVisibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextLoupeVisibility:");
}

id objc_msgSend_setTextView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextView:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUseAccountSignatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseAccountSignatures:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValueChangedTarget_action_specifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValueChangedTarget:action:specifier:");
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:");
}

id objc_msgSend_setValues_titles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:titles:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedInvocationQueue(void *a1, const char *a2, ...)
{
  return _[a1 sharedInvocationQueue];
}

id objc_msgSend_shorcutIconNameForMailboxType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shorcutIconNameForMailboxType:");
}

id objc_msgSend_shouldDisableWhileEditing(void *a1, const char *a2, ...)
{
  return _[a1 shouldDisableWhileEditing];
}

id objc_msgSend_shouldHideInbox(void *a1, const char *a2, ...)
{
  return _[a1 shouldHideInbox];
}

id objc_msgSend_shouldHideNotesForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldHideNotesForAccount:");
}

id objc_msgSend_shouldReloadMailboxesWithOutbox_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldReloadMailboxesWithOutbox:");
}

id objc_msgSend_showsReorderControl(void *a1, const char *a2, ...)
{
  return _[a1 showsReorderControl];
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return _[a1 signature];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeWithAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeWithAttributes:");
}

id objc_msgSend_sourceTypeForMailboxFilterType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceTypeForMailboxFilterType:");
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return _[a1 specifier];
}

id objc_msgSend_specifierAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndex:");
}

id objc_msgSend_specifierForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForID:");
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return _[a1 specifiers];
}

id objc_msgSend_specifiersForPolicyOptions_force_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifiersForPolicyOptions:force:");
}

id objc_msgSend_standardTextViewPreferences(void *a1, const char *a2, ...)
{
  return _[a1 standardTextViewPreferences];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_styleString(void *a1, const char *a2, ...)
{
  return _[a1 styleString];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_swipeActionsAndTitles(void *a1, const char *a2, ...)
{
  return _[a1 swipeActionsAndTitles];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_synchronizeNanoDomain_keys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeNanoDomain:keys:");
}

id objc_msgSend_synchronizeUserDefaultsDomain_keys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeUserDefaultsDomain:keys:");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemFontSize(void *a1, const char *a2, ...)
{
  return _[a1 systemFontSize];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayColor];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return _[a1 table];
}

id objc_msgSend_tableCellGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 tableCellGroupedBackgroundColor];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return _[a1 tag];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return _[a1 target];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textContentViewDidEndEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textContentViewDidEndEditing:");
}

id objc_msgSend_textField(void *a1, const char *a2, ...)
{
  return _[a1 textField];
}

id objc_msgSend_textFieldDidEndEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textFieldDidEndEditing:");
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return _[a1 textView];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollectionWithPreferredContentSizeCategory:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return _[a1 uniqueID];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unlockWithCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlockWithCondition:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateSharedPreferences(void *a1, const char *a2, ...)
{
  return _[a1 updateSharedPreferences];
}

id objc_msgSend_useAccountSignatures(void *a1, const char *a2, ...)
{
  return _[a1 useAccountSignatures];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceLayoutDirection];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithNonretainedObject:");
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return _[a1 values];
}

id objc_msgSend_webView(void *a1, const char *a2, ...)
{
  return _[a1 webView];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}