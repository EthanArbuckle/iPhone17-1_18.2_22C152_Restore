void sub_483C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_49E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4A08(uint64_t a1)
{
  v2 = (objc_class *)[*(id *)(a1 + 32) accountClass];
  v3 = NSStringFromClass(v2);
  v4 = [(objc_class *)v2 hostname];
  v5 = +[MailAccount existingAccountWithType:v3 hostname:v4 username:*(void *)(a1 + 40)];

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_4D4C;
    v16[3] = &unk_B8C58;
    id v17 = *(id *)(a1 + 72);
    [v6 _showDuplicateAccountAlertForAccount:v5 completion:v16];
    v7 = v17;
  }
  else
  {
    v7 = [(objc_class *)v2 displayedAccountTypeString];
    if ([*(id *)(*(void *)(a1 + 32) + 8) hasAccountWithDescription:v7])
    {
      id v8 = *(id *)(a1 + 40);

      v7 = v8;
    }
    v19 = v7;
    v18[0] = MFMailAccountDescription;
    v18[1] = MFMailAccountUsername;
    long long v20 = *(_OWORD *)(a1 + 40);
    v18[2] = MFOAuth2Token;
    v18[3] = MFOAuth2RefreshToken;
    uint64_t v21 = *(void *)(a1 + 56);
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:v18 count:4];
    id v10 = [(id)v9 mutableCopy];

    v11 = [*(id *)(a1 + 32) grantedDataclasses];
    LOBYTE(v9) = v11 == 0;

    if ((v9 & 1) == 0)
    {
      v12 = [*(id *)(a1 + 32) grantedDataclasses];
      [v10 setValue:v12 forKey:ACAccountPropertyGrantedDataclasses];
    }
    v13 = [(objc_class *)v2 accountWithProperties:v10];
    if ([*(id *)(a1 + 64) length]) {
      [v13 setFullUserName:*(void *)(a1 + 64)];
    }
    uint64_t v14 = *(void *)(a1 + 72);
    if (v13)
    {
      v15 = [v13 persistentAccount];
      (*(void (**)(uint64_t, void *, uint64_t, void))(v14 + 16))(v14, v15, 1, 0);
    }
    else
    {
      (*(void (**)(uint64_t, void, void, void))(v14 + 16))(v14, 0, 0, 0);
    }
  }
}

void sub_4CBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_4D4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_52B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31)
{
  _Unwind_Resume(a1);
}

void sub_5414()
{
}

void sub_5420()
{
}

void sub_542C(uint64_t a1)
{
  id v2 = +[MFPreferencesURL accountURLForAccount:*(void *)(a1 + 32)];
  v1 = +[LSApplicationWorkspace defaultWorkspace];
  [v1 openSensitiveURL:v2 withOptions:0];
}

void sub_54A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_54C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_54D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_5558(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_55D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5A68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5C00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_64B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_6ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_7124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_7450(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_88DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, _Unwind_Exception *exception_object, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_8DA8(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_9308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_9B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,uint64_t a23,void *a24,void *a25)
{
  _Unwind_Resume(a1);
}

void sub_A02C(_Unwind_Exception *a1)
{
  id v8 = v4;

  _Unwind_Resume(a1);
}

void sub_A708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_A8C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A9A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_AB70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_AB94()
{
  v0 = (void *)qword_D7330;
  if (!qword_D7330)
  {
    v1 = [[StoreOnServerSettings alloc] initWithType:5 key:@"StoreDraftsOnServer" mailboxNameKey:@"DraftsMailboxName"];
    id v2 = [[StoreOnServerSettings alloc] initWithType:4, @"StoreSentMessagesOnServer", @"SentMessagesMailboxName", v1 key mailboxNameKey];
    v9[1] = v2;
    v3 = [[StoreOnServerSettings alloc] initWithType:3 key:@"StoreTrashOnServer" mailboxNameKey:@"TrashMailboxName"];
    v9[2] = v3;
    v4 = [[StoreOnServerSettings alloc] initWithType:2 key:@"StoreArchiveOnServer" mailboxNameKey:@"ArchiveMailboxName"];
    v9[3] = v4;
    v5 = [[StoreOnServerSettings alloc] initWithType:-500 key:0 mailboxNameKey:0];
    v9[4] = v5;
    uint64_t v6 = +[NSArray arrayWithObjects:v9 count:5];
    v7 = (void *)qword_D7330;
    qword_D7330 = v6;

    v0 = (void *)qword_D7330;
  }

  return v0;
}

void sub_AD10(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_AEE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_AFF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_B7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_BB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_C3A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33)
{
  _Unwind_Resume(a1);
}

void sub_C60C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C7A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_CA60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_CB00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_CBF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_CD80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_CE60(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_D7338;
  qword_D7338 = (uint64_t)v1;
}

void sub_CED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_D07C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D13C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D1E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D38C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

int64_t sub_D9E8(id a1, NSString *a2, NSString *a3)
{
  v4 = a2;
  v5 = a3;
  uint64_t v6 = v4;
  v7 = [(NSString *)v6 emailAddressValue];
  id v8 = [v7 simpleAddress];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(NSString *)v6 stringValue];
  }
  v11 = v10;

  v12 = v5;
  v13 = [(NSString *)v12 emailAddressValue];
  uint64_t v14 = [v13 simpleAddress];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [(NSString *)v12 stringValue];
  }
  id v17 = v16;

  id v18 = [v11 caseInsensitiveCompare:v17];
  return (int64_t)v18;
}

void sub_DAE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_DB34(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = [(NSString *)v2 emailAddressValue];
  v4 = [v3 simpleAddress];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(NSString *)v2 stringValue];
  }
  v7 = v6;

  return (NSString *)v7;
}

void sub_DBBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_DEF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_E118(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_E1C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E2C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E38C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_ED78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_F01C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F1FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F2C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_FA78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FB90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_FC8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_FD20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FE50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10068(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_101EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_102E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1037C(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_104E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1061C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10638(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  unsigned __int8 v8 = [v5 isEqualToString:MFMailAccountSigningEnabled];
  uint64_t v9 = v6;
  if ((v8 & 1) == 0
    && (v10 = [v5 isEqualToString:MFMailAccountEncryptionEnabled], uint64_t v9 = v7, !v10)
    || (id v11 = v9) == 0)
  {
    __assert_rtn("_ValueForProperty", "AccountPSAdvancedController.m", 280, "nil != result");
  }
  v12 = v11;

  return v12;
}

void sub_10704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1080C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10A18(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_10AB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_10AC0(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = [(NSString *)v2 emailAddressValue];
  v4 = [v3 simpleAddress];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(NSString *)v2 stringValue];
  }
  id v7 = v6;

  return (NSString *)v7;
}

void sub_10B48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10CE4(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_10DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10F10(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_11050(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_111C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_112F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_113A8(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_D7350;
  qword_D7350 = (uint64_t)v1;
}

void sub_11418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_11578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_116C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_117EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *sub_11808(id *result, uint64_t a2)
{
  if (!a2) {
    return (id *)[result[4] reallyDeleteAccount];
  }
  return result;
}

void sub_11ACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11B34(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[AccountPSDetailController log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Save account for mail failed %@, %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

void sub_11C08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_11C20(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_11CF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11F04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_11F50(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_12348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_128E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_12D4C(_Unwind_Exception *a1)
{
  uint64_t v8 = v5;

  _Unwind_Resume(a1);
}

void sub_13768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_13A2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_13E34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1401C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1411C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v10 = v9;

  a9.super_class = (Class)AccountPSDetailController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_14538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_148D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_149B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_14AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_14BC8(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_14C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_14E5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_150DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_152FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1571C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_15A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_15B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_15BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_15E7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15EB4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) specifierForID:MailAccountEmailAddresses];
  os_log_t v1 = [v2 propertyForKey:PSTableCellKey];
  [v1 becomeFirstResponder];
}

void sub_15F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_16184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_16508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_16658(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_16BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_16CB0(uint64_t a1)
{
  id v2 = +[MFPreferencesURL accountURLForAccount:*(void *)(*(void *)(a1 + 32) + 320)];
  os_log_t v1 = +[LSApplicationWorkspace defaultWorkspace];
  [v1 openSensitiveURL:v2 withOptions:0];
}

void sub_16D34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_16D54(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 320);
  *(void *)(v1 + 320) = 0;
}

void sub_16D6C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 320);
  *(void *)(v1 + 320) = 0;
}

void sub_16E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_16F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_170F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_172C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

void sub_1760C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_177B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1794C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_17B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_17D50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17E20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_17FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_180E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1831C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_183EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v11 = v10;

  _Unwind_Resume(a1);
}

void sub_185E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_18838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1890C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18AB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18B9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18CD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_191F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_19304(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_193C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_194A0(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_19670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_199E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_19AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19B14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19EEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A26C(_Unwind_Exception *a1)
{
  int v7 = v5;

  _Unwind_Resume(a1);
}

void sub_1A468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A5AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1ABE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1AF08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)AccountPSDetailControllerBase;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1B2D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5A0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v2 = [v3 localizedStringForKey:@"VERIFYING_ACCOUNT" value:&stru_B9F70 table:@"AccountPreferences"];
  [v1 startValidationWithPrompt:v2];
}

void sub_1B638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B8F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BAF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BD20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BE84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1C3C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1C630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1C690(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) didFinishSaveAccountAnywaysSheetWithResult:a2 == 0];
}

void sub_1CA38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

id sub_1CB40(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleSSLAlertForAccount:*(void *)(a1 + 40) accountValidator:*(void *)(a1 + 48) attemptWithoutSSL:1];
}

id sub_1CB54(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleSSLAlertForAccount:*(void *)(a1 + 40) accountValidator:*(void *)(a1 + 48) attemptWithoutSSL:0];
}

void sub_1CCA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D3CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D40C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "#Warning web login failed for account %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) cancelAccountValidation];
  }
}

void sub_1D4E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D770(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1D814(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelAccountValidation];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);

  return [v2 attemptRecoveryFromError:v3 optionIndex:0 delegate:v4 didRecoverSelector:"_redirectToRecoveryURL:" contextInfo:0];
}

void sub_1D8D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D9CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1D9F4(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "accountPropertiesValueForKey:value:");
  uint64_t v4 = *(void **)(a1 + 32);
  if (v3) {
    [v4 setObject:v3 forKey:v5];
  }
  else {
    [v4 removeObjectForKey:v5];
  }
}

void sub_1DA78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E2B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E3A0()
{
  JUMPOUT(0x1E390);
}

void sub_1EA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1EC08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1ECB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1EDDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1F304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1F4D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1F818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1F9BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1FA68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1FB8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2051C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_207C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20918(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_209B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_212D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v13 = v10;

  _Unwind_Resume(a1);
}

void sub_215C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21AC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21E48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21EE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21F44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *sub_22324(id *result, id a2)
{
  if (result[5] == a2) {
    return (id *)[result[4] _reallyDeleteOutgoingAccount];
  }
  return result;
}

void sub_223F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_224EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_225E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2270C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2281C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22890(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22918(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22A9C(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) viewController];
  [v3 presentViewController:v4 animated:1 completion:0];
}

void sub_22B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22B24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!v3) {
      goto LABEL_7;
    }
    id v5 = [v3 token];

    if (v5)
    {
      uint64_t v6 = [v3 username];
      uint64_t v7 = [v3 displayName];
      int v8 = [v3 token];
      uint64_t v9 = [v3 refreshToken];
      __int16 v10 = [WeakRetained completion];
      [WeakRetained validateUniquenessAndAddAccountWithUsername:v6 fullUserName:v7 token:v8 refreshToken:v9 completion:v10];

LABEL_8:
      goto LABEL_9;
    }
    id v11 = [v3 username];

    if (!v11)
    {
LABEL_7:
      uint64_t v6 = [WeakRetained completion];
      v6[2](v6, 0, 0, 0);
      goto LABEL_8;
    }
    uint64_t v15 = MFMailAccountUsername;
    v12 = [v3 username];
    id v16 = v12;
    v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

    uint64_t v14 = [WeakRetained completion];
    ((void (**)(void, void, uint64_t, void *))v14)[2](v14, 0, 2, v13);
  }
LABEL_9:
}

void sub_22D0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22E84(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2301C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_23050(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) presentViewController:a2 animated:1 completion:0];
}

void sub_23064(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setReAuthenticating:0];
}

void sub_230B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23588(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_D7360;
  qword_D7360 = (uint64_t)v1;
}

void sub_235F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_23774(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) viewController];
  [v3 presentViewController:v4 animated:1 completion:0];
}

void sub_237DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!v3) {
      goto LABEL_7;
    }
    id v5 = [v3 token];

    if (v5)
    {
      uint64_t v6 = [v3 username];
      uint64_t v7 = [v3 displayName];
      int v8 = [v3 token];
      uint64_t v9 = [v3 refreshToken];
      __int16 v10 = [WeakRetained completion];
      [WeakRetained validateUniquenessAndAddAccountWithUsername:v6 fullUserName:v7 token:v8 refreshToken:v9 completion:v10];

LABEL_8:
      goto LABEL_9;
    }
    id v11 = [v3 username];

    if (!v11)
    {
LABEL_7:
      uint64_t v6 = [WeakRetained completion];
      v6[2](v6, 0, 0, 0);
      goto LABEL_8;
    }
    uint64_t v15 = MFMailAccountUsername;
    v12 = [v3 username];
    id v16 = v12;
    v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

    uint64_t v14 = [WeakRetained completion];
    ((void (**)(void, void, uint64_t, void *))v14)[2](v14, 0, 2, v13);
  }
LABEL_9:
}

void sub_239E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23BAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23C88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23D90(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_23E84(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_D7370;
  qword_D7370 = (uint64_t)v1;
}

void sub_23EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_241F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_24470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_247FC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _showVerifyEmailConfirmation:a2];
}

void sub_24AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  _Unwind_Resume(a1);
}

void sub_24B58()
{
}

void sub_24B60(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _populatMemberEmailList];
  [WeakRetained _addEmailForFamily];
  id v2 = WeakRetained[28];
  dispatch_time_t v3 = dispatch_time(0, 1000000000 * (void)[&off_C0348 integerValue]);
  if (dispatch_group_wait(v2, v3))
  {
    id v4 = +[BYODAddEmailViewController log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_7B560(v4);
    }
  }
  if (WeakRetained[29])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_24CF0;
    v7[3] = &unk_B8E88;
    v7[4] = WeakRetained;
    id v5 = +[EFScheduler mainThreadScheduler];
    [v5 performBlock:v7];
  }
  uint64_t v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"BYOD_REFRESH_NOTIFICATION" object:0 userInfo:0];

  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

void sub_24CC0(_Unwind_Exception *a1)
{
  dispatch_time_t v3 = v2;

  _Unwind_Resume(a1);
}

id sub_24CF0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 232) stopSpinner];
}

void sub_2500C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2551C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_25860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25F24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_26030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_26054(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) memberIdentifier];
  uint64_t v6 = +[NSString stringWithFormat:@"MEMBER_%@", v5];
  uint64_t v7 = [v4 specifierForID:v6];

  [v7 setProperty:v3 forKey:PSIconImageKey];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_261D4;
  v10[3] = &unk_B9010;
  v10[4] = *(void *)(a1 + 32);
  id v8 = v7;
  id v11 = v8;
  uint64_t v9 = +[EFScheduler mainThreadScheduler];
  [v9 performBlock:v10];
}

void sub_26184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

id sub_261D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:1];
}

void sub_2628C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2658C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_266FC(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_26944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_26A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_26D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_26DB4(uint64_t a1)
{
}

void sub_26F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_271C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  _Unwind_Resume(a1);
}

void sub_27248(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_27458;
    v19[3] = &unk_B8E88;
    v19[4] = WeakRetained;
    uint64_t v9 = +[EFScheduler mainThreadScheduler];
    [v9 performBlock:v19];

    unsigned __int8 v10 = [v5 success];
    if (v6) {
      unsigned __int8 v11 = 0;
    }
    else {
      unsigned __int8 v11 = v10;
    }
    if (v11)
    {
      v12 = [v5 result];
      [v8 _populateDomainMembersFromDomainResult:v12];

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_2746C;
      v14[3] = &unk_B9088;
      id v15 = a1[5];
      id v16 = v5;
      id v17 = a1[4];
      id v18 = v8;
      v13 = +[EFScheduler mainThreadScheduler];
      [v13 performBlock:v14];
    }
    else
    {
      +[BYODUtil showErrorForPresenter:a1[4] withError:v6 callback:0];
    }
  }
}

void sub_27400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

id sub_27458(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 232) stopSpinner];
}

void sub_2746C(id *a1)
{
  id v6 = [a1[4] normalizedAddress];
  if ([a1[4] kind] == (char *)&dword_0 + 1
    && [v6 containsString:@"+"])
  {
    uint64_t v2 = [v6 stringByReplacingOccurrencesOfString:@"+" withString:&stru_B9F70];

    id v6 = (id)v2;
  }
  id v3 = [a1[5] result];
  id v4 = [v3 getMemberFromIdentifier:v6];

  [a1[6] dismissViewControllerAnimated:1 completion:0];
  if (v4)
  {
    id v5 = [a1[7] _getSpecifierGroupWithMember:v4];
    [a1[7] addSpecifiersFromArray:v5 animated:1];
    [a1[7] _getPhotoForMember:v4];
  }
}

void sub_27580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2776C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_277D4(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_279C8;
    v15[3] = &unk_B8E88;
    id v16 = a1[4];
    id v8 = +[EFScheduler mainThreadScheduler];
    [v8 performBlock:v15];

    unsigned __int8 v9 = [v5 success];
    if (v6) {
      unsigned __int8 v10 = 0;
    }
    else {
      unsigned __int8 v10 = v9;
    }
    if (v10)
    {
      unsigned __int8 v11 = [v5 result];
      [WeakRetained _populateDomainMembersFromDomainResult:v11];

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_279D0;
      v13[3] = &unk_B8C58;
      id v14 = a1[5];
      v12 = +[EFScheduler mainThreadScheduler];
      [v12 performBlock:v13];
    }
    else
    {
      +[BYODUtil showErrorForPresenter:WeakRetained withError:v6 callback:0];
    }
  }
}

void sub_27978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

id sub_279C8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "byod_stopSpinner");
}

uint64_t sub_279D0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_27C34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_27E48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_27F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_283BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,void *a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,id location)
{
  objc_destroyWeak(v42);
  objc_destroyWeak(v44);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_284F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v3 = *(id *)(a1 + 32);
    id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v8;
      do
      {
        id v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(WeakRetained, "removeSpecifier:animated:", *(void *)(*((void *)&v7 + 1) + 8 * (void)v6), 1, (void)v7);
          id v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
}

void sub_28600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_28624(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_28718;
    v4[3] = &unk_B8E88;
    id v5 = *(id *)(a1 + 32);
    id v3 = +[EFScheduler mainThreadScheduler];
    [v3 performBlock:v4];

    [WeakRetained _removeDomainMember:*(void *)(a1 + 40) memberSpecifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
  }
}

void sub_286F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_28718(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "byod_startSpinner");
}

void sub_28720(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained getGroupSpecifierForSpecifier:*(void *)(a1 + 32)];
    [v3 removeSpecifier:*(void *)(a1 + 32) animated:1];
    if (v4)
    {
      uint64_t v9 = 0;
      [v3 getGroup:&v9 row:0 ofSpecifier:v4];
      id v5 = [v3 specifiersInGroup:v9];
      id v6 = [v5 count];
      id v7 = [v3[30] maxEmailsPerUser];

      if (v6 < v7)
      {
        long long v8 = [v3 _getEmailAddressSpecifier];
        [v3 insertSpecifier:v8 atEndOfGroup:v9 animated:1];
      }
    }
  }
}

void sub_28814(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_28B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

uint64_t sub_28C34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_28F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

uint64_t sub_28FD4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_29184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_29384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_293EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void sub_295C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_298F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_29A88(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_29B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_29D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_29E9C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_29FDC(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_D7380;
  qword_D7380 = (uint64_t)v1;
}

void sub_2A04C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2A0D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2A2AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2A6AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2A8A0(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_D7390;
  qword_D7390 = (uint64_t)v1;
}

void sub_2A910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2A9C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2ABC4(_Unwind_Exception *a1)
{
  id v6 = v2;

  _Unwind_Resume(a1);
}

void sub_2B2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_2B5F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_2B778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2B7C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v8 = WeakRetained;
  if (WeakRetained)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_2B96C;
    v14[3] = &unk_B8E88;
    void v14[4] = WeakRetained;
    uint64_t v9 = +[EFScheduler mainThreadScheduler];
    [v9 performBlock:v14];

    long long v10 = [v5 result];
    unsigned int v11 = [v10 purchaseAllowed];

    if (v11)
    {
      v12 = +[EFScheduler mainThreadScheduler];
      [v12 performBlock:&v13];
    }
    else
    {
      +[BYODUtil showErrorForPresenter:v8 withError:v6 callback:0];
    }
  }
}

void sub_2B934(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

id sub_2B96C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) stopSpinner];
}

void sub_2B980(uint64_t a1)
{
  uint64_t v2 = [BYODDomainPurchaseSearchViewController alloc];
  id v3 = [*(id *)(a1 + 32) userAccount];
  id v5 = [(BYODDomainPurchaseSearchViewController *)v2 initWithACAccount:v3 isBuyNewDomainFlow:0 domainPurchaseProviderName:*(void *)(*(void *)(a1 + 32) + 32)];

  id v4 = [*(id *)(a1 + 32) navigationController];
  [v4 pushViewController:v5 animated:1];
}

void sub_2BA2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2BAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2BD84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2C0B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_2C344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2C5D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2C688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2C748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2C818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2C8EC(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_D73A0;
  qword_D73A0 = (uint64_t)v1;
}

void sub_2C95C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2CA0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2CC24(_Unwind_Exception *a1)
{
  long long v8 = v3;

  _Unwind_Resume(a1);
}

void sub_2CF80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_2D20C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2D3A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2D4FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2D6F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  id v18 = v17;

  _Unwind_Resume(a1);
}

id sub_2D748(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) stopSpinner];
}

void sub_2D75C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 pushViewController:*(void *)(a1 + 40) animated:1];
}

void sub_2D7B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2D958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_2D9B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void sub_2DAFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_2DB40(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_2DEB8;
  v25[3] = &unk_B8E88;
  v25[4] = WeakRetained;
  id v7 = +[EFScheduler mainThreadScheduler];
  [v7 performBlock:v25];

  unsigned __int8 v8 = [v5 success];
  if (a3) {
    unsigned __int8 v9 = 0;
  }
  else {
    unsigned __int8 v9 = v8;
  }
  if (v9)
  {
    long long v10 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v11 = +[UIImage imageNamed:@"CustomDomainIcon.png" inBundle:v10];

    v22 = (void *)v11;
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v13 = [v12 localizedStringForKey:@"BYOD_DOMAIN_INVITE_CREATE_EMAIL_BODY" value:&stru_B9F70 table:@"AccountPreferences"];
    id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, WeakRetained[4]);

    id v15 = [BYODCreateNewEmailViewController alloc];
    id v16 = +[NSBundle bundleForClass:objc_opt_class()];
    id v17 = [v16 localizedStringForKey:@"BYOD_DOMAIN_INVITE_CREATE_EMAIL_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
    id v18 = [WeakRetained userAccount];
    v19 = [(BYODCreateNewEmailViewController *)v15 initWithTitle:v17 detailText:v14 icon:v22 adoptTableViewScrollView:1 acAccount:v18 domainName:WeakRetained[4]];

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_2DECC;
    v23[3] = &unk_B9010;
    v23[4] = WeakRetained;
    long long v20 = v19;
    v24 = v20;
    uint64_t v21 = +[EFScheduler mainThreadScheduler];
    [v21 performSyncBlock:v23];
  }
  else
  {
    [WeakRetained _showErrorAlert];
  }
}

void sub_2DE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

id sub_2DEB8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) stopSpinner];
}

id sub_2DECC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showViewController:sender:", *(void *)(a1 + 40));
}

void sub_2E088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_2E0F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void sub_2E1F8(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_D73B0;
  qword_D73B0 = (uint64_t)v1;
}

void sub_2E268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2E318(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2E654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_2E724(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v9 = a2;
  id v7 = [v9 objectForKeyedSubscript:NSInlinePresentationIntentAttributeName];
  unsigned int v8 = [v7 isEqual:&off_C0360];

  if (v8) {
    objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", *(void *)(a1 + 40), a3, a4);
  }
}

void sub_2E7C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2E98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2EB74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_2EBDC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ([v5 verifySuccess])
    {
      if ([WeakRetained showDefaultEmailSelect])
      {
        [WeakRetained _listDefaultEmail];
      }
      else
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_2EE84;
        v18[3] = &unk_B8E88;
        void v18[4] = WeakRetained;
        unsigned int v8 = +[EFScheduler mainThreadScheduler];
        [v8 performBlock:v18];

        id v9 = [BYODDoneSetupDomainViewController alloc];
        long long v10 = [WeakRetained domainName];
        uint64_t v11 = [WeakRetained loggedInUserAccount];
        v12 = [(BYODDoneSetupDomainViewController *)v9 initWithDomainName:v10 acAccount:v11];

        -[BYODDoneSetupDomainViewController setShowDefaultEmailSelect:](v12, "setShowDefaultEmailSelect:", [WeakRetained showDefaultEmailSelect]);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_2EEE4;
        v16[3] = &unk_B9010;
        void v16[4] = WeakRetained;
        uint64_t v13 = v12;
        id v17 = v13;
        id v14 = +[EFScheduler mainThreadScheduler];
        [v14 performBlock:v16];
      }
    }
    else
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_2EEF0;
      v15[3] = &unk_B8E88;
      void v15[4] = WeakRetained;
      +[BYODUtil showErrorForPresenter:WeakRetained withError:v6 callback:v15];
    }
  }
}

void sub_2EE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_2EE84(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) spinner];
  [v1 stopSpinner];
}

void sub_2EED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_2EEE4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showViewController:sender:", *(void *)(a1 + 40));
}

id sub_2EEF0(uint64_t a1)
{
  id result = *(id *)(a1 + 32);
  if (result) {
    return [result dismissViewControllerAnimated:1 completion:0];
  }
  return result;
}

void sub_2F024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_2F068(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v8 = WeakRetained;
  if (WeakRetained)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_2F3E4;
    v24[3] = &unk_B8E88;
    v24[4] = WeakRetained;
    id v9 = +[EFScheduler mainThreadScheduler];
    [v9 performBlock:v24];

    if (v6)
    {
      +[BYODUtil showErrorForPresenter:v8 withError:v6 callback:0];
    }
    else
    {
      long long v10 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v21 = +[UIImage imageNamed:@"CustomDomainIcon.png" inBundle:v10];

      uint64_t v11 = [BYODSelectEmailTableViewController alloc];
      v12 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v13 = [v12 localizedStringForKey:@"BYOD_CHOOSE_DEFAULT_EMAIL_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
      id v14 = +[NSBundle bundleForClass:objc_opt_class()];
      id v15 = [v14 localizedStringForKey:@"BYOD_CHOOSE_DEFAULT_EMAIL_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
      id v16 = [v8 loggedInUserAccount];
      id v17 = [v8 domainName];
      id v18 = [(BYODSelectEmailTableViewController *)v11 initWithTitle:v13 detailText:v15 icon:v21 adoptTableViewScrollView:1 userAccount:v16 emailListResponse:v5 domainName:v17];

      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_2F444;
      v22[3] = &unk_B9010;
      v22[4] = v8;
      v19 = v18;
      v23 = v19;
      long long v20 = +[EFScheduler mainThreadScheduler];
      [v20 performBlock:v22];
    }
  }
}

void sub_2F338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_2F3E4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) spinner];
  [v1 stopSpinner];
}

void sub_2F430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2F444(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 pushViewController:*(void *)(a1 + 40) animated:1];
}

void sub_2F49C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2F648(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_D73C0;
  qword_D73C0 = (uint64_t)v1;
}

void sub_2F6B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2F800(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_2F8CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2F980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2FCB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2FF04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2FFC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_300E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_30274(_Unwind_Exception *a1)
{
  id v4 = v2;

  _Unwind_Resume(a1);
}

void sub_303C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_30518(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_D73D0;
  qword_D73D0 = (uint64_t)v1;
}

void sub_30588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_305F0(id a1)
{
  os_log_t v1 = objc_alloc_init(BYODContactsManager);
  id v2 = (void *)qword_D73E0;
  qword_D73E0 = (uint64_t)v1;
}

void sub_306EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_30794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_308A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_309F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_30BF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_30C64(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_30C74(uint64_t a1)
{
}

void sub_30C7C(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = +[UIImage imageWithData:](UIImage, "imageWithData:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = +[UIImage mf_imageWithImage:scaledToSize:](UIImage, "mf_imageWithImage:scaledToSize:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 38.0, 38.0);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_30D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_30E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_30F30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_31048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_310FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3121C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3145C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_315C4(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_D73F0;
  qword_D73F0 = (uint64_t)v1;
}

void sub_31634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_31720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_319FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_31D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_31E08(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v8 = WeakRetained;
  if (WeakRetained)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_31FC8;
    v15[3] = &unk_B8E88;
    void v15[4] = WeakRetained;
    id v9 = +[EFScheduler mainThreadScheduler];
    [v9 performSyncBlock:v15];

    unsigned __int8 v10 = [v5 success];
    if (v6) {
      unsigned __int8 v11 = 0;
    }
    else {
      unsigned __int8 v11 = v10;
    }
    if (v11)
    {
      v12 = +[NSNotificationCenter defaultCenter];
      [v12 postNotificationName:@"BYOD_REFRESH_NOTIFICATION" object:0 userInfo:0];

      uint64_t v13 = +[EFScheduler mainThreadScheduler];
      [v13 performSyncBlock:&v14];
    }
    else
    {
      +[BYODUtil showErrorForPresenter:v8 withError:v6 callback:0];
    }
  }
}

void sub_31F90(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

id sub_31FC8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) stopSpinner];
}

id sub_31FDC(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_32120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_325F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_32740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_32FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37)
{
  _Unwind_Resume(a1);
}

void sub_332A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_33348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_333D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_33668(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_336E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_33880(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_33D30(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_33F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_34228(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_D7400;
  qword_D7400 = (uint64_t)v1;
}

void sub_34298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_343F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_34554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_34EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_35118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_35520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_357E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_35AE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_35D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  _Unwind_Resume(a1);
}

void sub_35D98(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = [*(id *)(a1 + 32) memberIdentifier];
    id v6 = +[NSString stringWithFormat:@"MEMBER_%@", v5];

    uint64_t v7 = [WeakRetained specifierForID:v6];
    [v7 setProperty:v3 forKey:PSIconImageKey];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_35F28;
    v10[3] = &unk_B9010;
    v10[4] = WeakRetained;
    id v8 = v6;
    id v11 = v8;
    id v9 = +[EFScheduler mainThreadScheduler];
    [v9 performBlock:v10];
  }
}

void sub_35ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

id sub_35F28(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifierID:*(void *)(a1 + 40) animated:1];
}

void sub_36030(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_36194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_369DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_36EA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_371BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_37498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  v23 = v20;

  objc_destroyWeak(v21);
  objc_destroyWeak((id *)(v22 - 56));

  _Unwind_Resume(a1);
}

void sub_37530(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_37804;
  v21[3] = &unk_B8E88;
  id v22 = *(id *)(a1 + 32);
  id v8 = +[EFScheduler mainThreadScheduler];
  [v8 performBlock:v21];

  if (v6)
  {
    id v9 = +[BYODDomainDetailViewController log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_7B5E8((uint64_t)v6, v9);
    }

    +[BYODUtil showErrorForPresenter:WeakRetained withError:v6 callback:0];
  }
  else
  {
    unsigned __int8 v10 = [v5 dnsRecords];
    [WeakRetained setDnsRecords:v10];

    id v11 = [WeakRetained dnsRecords];
    id v12 = [v11 count];

    if (v12)
    {
      uint64_t v13 = [BYODDomainSetupInstructionViewController alloc];
      uint64_t v14 = [WeakRetained dnsRecords];
      id v15 = [(BYODDomainSetupInstructionViewController *)v13 initWithDnsRecords:v14];

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_3780C;
      v19[3] = &unk_B9010;
      v19[4] = WeakRetained;
      id v16 = v15;
      long long v20 = v16;
      id v17 = +[EFScheduler mainThreadScheduler];
      [v17 performBlock:v19];
    }
    else
    {
      id v16 = +[BYODDomainDetailViewController log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v18 = 0;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "0 DNS record returned.", v18, 2u);
      }
    }
  }
}

void sub_3779C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

id sub_37804(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "byod_stopSpinner");
}

id sub_3780C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewInstructionSpecifier];
  [v2 removePropertyForKey:PSBadgeNumberKey];

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 viewInstructionSpecifier];
  [v3 reloadSpecifier:v4];

  if (([(id)_domainResult hasUnverifiedEmail] & 1) == 0)
  {
    id v5 = [*(id *)(a1 + 32) finishSetupSpecifier];
    id v6 = +[NSNumber numberWithBool:1];
    [v5 setProperty:v6 forKey:PSEnabledKey];

    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = [v7 finishSetupSpecifier];
    [v7 reloadSpecifier:v8];
  }
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);

  return [v9 showViewController:v10 sender:v9];
}

void sub_37910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_37938(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showViewController:sender:", *(void *)(a1 + 40));
}

void sub_37DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_382A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_38544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_388D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_38BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_38EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_390B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_391C8(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_39600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  objc_destroyWeak(v21);
  objc_destroyWeak((id *)(v25 - 88));

  _Unwind_Resume(a1);
}

void sub_396F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [WeakRetained _removeDomainMember:*(void *)(a1 + 32)];
  }
}

void sub_39750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_39764(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) propertyForKey:@"MEMBER_DSID"];
  id v2 = objc_msgSend((id)_domainResult, "getMemberFromIdentifier:");
  [*(id *)(a1 + 40) _deleteEmailFromServerForUser:v2 specifier:*(void *)(a1 + 32)];
}

void sub_397E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_39B24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_39C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_39F44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3A014(uint64_t a1)
{
  id v2 = [BYODMemberLeaveRequest alloc];
  id v3 = *(void **)(*(void *)(a1 + 32) + 192);
  uint64_t v4 = [v3 accountStore];
  id v5 = [(id)_domainResult domain];
  id v6 = [v5 name];
  uint64_t v7 = [(BYODMemberLeaveRequest *)v2 initWithAccount:v3 accountStore:v4 domain:v6];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v8 = [[BYODSpinner alloc] initWithViewController:*(void *)(a1 + 32)];
  id v9 = (void *)_byodSpinner;
  _byodSpinner = (uint64_t)v8;

  [(id)_byodSpinner startSpinner];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_3A1C0;
  v10[3] = &unk_B9178;
  objc_copyWeak(&v11, &location);
  [(BYODMemberLeaveRequest *)v7 performRequestWithCallback:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void sub_3A174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_3A1C0(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = +[EFScheduler mainThreadScheduler];
    [v5 performSyncBlock:&stru_B9330];

    if (v7)
    {
      +[BYODUtil showErrorForPresenter:WeakRetained withError:v7 callback:0];
    }
    else
    {
      id v6 = +[NSNotificationCenter defaultCenter];
      [v6 postNotificationName:@"STOP_DOMAIN_NOTIFICATION" object:0 userInfo:0];
    }
  }
}

void sub_3A288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_3A2B8(id a1)
{
}

void sub_3A380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_3A9C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  _Unwind_Resume(a1);
}

void sub_3AB38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [(id)_domainResult domain];
  id v3 = [v2 domainConnectServerUrl];
  id v4 = [v3 length];

  if (v4)
  {
    id v5 = objc_alloc((Class)SFSafariViewController);
    id v6 = [(id)_domainResult domain];
    id v7 = [v6 domainConnectServerUrl];
    id v8 = +[NSURL URLWithString:v7];
    id v9 = [v5 initWithURL:v8];

    [v9 setDelegate:WeakRetained];
    [v9 setModalPresentationStyle:1];
    [WeakRetained presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    uint64_t v10 = +[BYODDomainDetailViewController log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_msgSend((id)_domainResult, "ef_publicDescription");
      int v12 = 138412290;
      uint64_t v13 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "domain connect URL not present. domainInfo %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

void sub_3ACE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_3AD40(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:_selectDefaultEmailNavController animated:1 completion:0];
}

void sub_3AF24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_3B41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_3B4FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 emails];
  id v5 = [v4 count];
  id v6 = [(id)_domainResult maxEmailsPerUser];

  if (v5 < v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v3 memberIdentifier];
    id v9 = [v7 _addExistingAddressButtonSpecifierForMember:v8];

    uint64_t v10 = *(void **)(a1 + 32);
    id v11 = [v3 memberIdentifier];
    int v12 = [v10 specifierForID:v11];

    if (v12)
    {
      uint64_t v13 = 0;
      [*(id *)(a1 + 32) getGroup:&v13 row:0 ofSpecifier:v12];
      [*(id *)(a1 + 32) insertSpecifier:v9 atEndOfGroup:v13 animated:1];
    }
  }
}

void sub_3B600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3B738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3B924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  v19 = v18;
  objc_destroyWeak(v17);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3B984(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = +[EFScheduler mainThreadScheduler];
  [v6 performBlock:&stru_B9378];

  if (v4 && WeakRetained)
  {
    id v7 = +[BYODDomainDetailViewController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Error while resending verification email %@", buf, 0xCu);
    }

    +[BYODUtil showErrorForPresenter:WeakRetained withError:v4 callback:0];
  }
  else if (!v4 && WeakRetained)
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"BYOD_RESEND_EMAIL_SENT_ALERT_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
    uint64_t v10 = +[NSBundle bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"BYOD_RESEND_EMAIL_SENT_ALERT_BYOD" value:&stru_B9F70 table:@"AccountPreferences"];
    int v12 = +[UIAlertController alertControllerWithTitle:v9 message:v11 preferredStyle:1];

    uint64_t v13 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v14 = [v13 localizedStringForKey:@"OK" value:&stru_B9F70 table:@"AccountPreferences"];
    id v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:0];

    [v12 addAction:v15];
    id v16 = v12;
    id v19 = v16;
    id v17 = +[EFScheduler mainThreadScheduler];
    [v17 performBlock:&v18];
  }
}

void sub_3BC7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_3BD30(id a1)
{
}

id sub_3BD3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void sub_3BDD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3BF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

id sub_3BFCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void sub_3C460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3C5B0(uint64_t a1)
{
  id v2 = [objc_alloc((Class)SFSafariViewController) initWithURL:*(void *)(a1 + 32)];
  [v2 setDelegate:*(void *)(a1 + 40)];
  [v2 setModalPresentationStyle:2];
  [*(id *)(a1 + 40) presentViewController:v2 animated:1 completion:0];
}

void sub_3C62C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_3C640(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void sub_3C6BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3C988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_3CA3C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_3CB90;
    v10[3] = &unk_B9010;
    id v7 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v7;
    id v8 = +[EFScheduler mainThreadScheduler];
    [v8 performBlock:v10];

    +[BYODUtil showErrorForPresenter:*(void *)(a1 + 32) withError:v6 callback:0];
  }
  else
  {
    id v9 = [(id)_domainResult domain];
    objc_msgSend(v9, "setCatchAllEnabled:", objc_msgSend(*(id *)(a1 + 48), "BOOLValue"));
  }
}

void sub_3CB50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_3CB90(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40)];
}

void sub_3CB9C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_3CCF0;
    v10[3] = &unk_B9010;
    id v7 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v7;
    id v8 = +[EFScheduler mainThreadScheduler];
    [v8 performBlock:v10];

    +[BYODUtil showErrorForPresenter:*(void *)(a1 + 32) withError:v6 callback:0];
  }
  else
  {
    id v9 = [(id)_domainResult domain];
    objc_msgSend(v9, "setCatchAllEnabled:", objc_msgSend(*(id *)(a1 + 48), "BOOLValue"));
  }
}

void sub_3CCB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_3CCF0(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40)];
}

void sub_3CDFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3CE30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    +[BYODUtil showErrorForPresenter:*(void *)(a1 + 32) withError:v6 callback:0];
  }
  else
  {
    uint64_t v7 = [v5 result];
    id v8 = (void *)_domainResult;
    _domainResult = v7;

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_3CF4C;
    v10[3] = &unk_B8E88;
    void v10[4] = *(void *)(a1 + 32);
    id v9 = +[EFScheduler mainThreadScheduler];
    [v9 performBlock:v10];
  }
}

void sub_3CF24(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

id sub_3CF4C(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  id result = (id)_selectDefaultEmailNavController;
  if (_selectDefaultEmailNavController)
  {
    return [result dismissViewControllerAnimated:1 completion:0];
  }
  return result;
}

void sub_3D0B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3D0D0(id a1)
{
}

void sub_3D0DC(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = +[EFScheduler mainThreadScheduler];
  [v8 performBlock:&stru_B93E0];

  if (v7)
  {
    +[BYODUtil showErrorForPresenter:*(void *)(a1 + 32) withError:v7 callback:0];
  }
  else
  {
    objc_storeStrong((id *)&_emailList, a2);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_3D230;
    v10[3] = &unk_B8E88;
    void v10[4] = *(void *)(a1 + 32);
    id v9 = +[EFScheduler mainThreadScheduler];
    [v9 performBlock:v10];
  }
}

void sub_3D1F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3D224(id a1)
{
}

id sub_3D230(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showEmailSelectWelcomeScreen];
}

void sub_3D4AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, id location, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  objc_destroyWeak(v24);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_3D568(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "byod_startSpinner");
}

void sub_3D570(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_3D74C;
  id v16 = &unk_B8E88;
  id v17 = *(id *)(a1 + 32);
  id v7 = +[EFScheduler mainThreadScheduler];
  [v7 performBlock:&v13];

  if (v6)
  {
    id WeakRetained = +[BYODDomainDetailViewController log];
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      sub_7B660((uint64_t)v6, WeakRetained);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      uint64_t v9 = [v5 result];
      uint64_t v10 = (void *)_domainResult;
      _domainResult = v9;

      uint64_t v11 = +[EFScheduler mainThreadScheduler];
      [v11 performBlock:&v12];
    }
  }
}

void sub_3D6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  id v22 = v21;

  _Unwind_Resume(a1);
}

id sub_3D74C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "byod_stopSpinner");
}

id sub_3D754(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_3D874(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_3DBE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

uint64_t sub_3DCD4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_3DE90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_3DF00(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = +[EFScheduler mainThreadScheduler];
    [v8 performBlock:&stru_B9450];

    unsigned __int8 v9 = [v5 success];
    if (v6) {
      unsigned __int8 v10 = 0;
    }
    else {
      unsigned __int8 v10 = v9;
    }
    if (v10)
    {
      uint64_t v11 = [v5 result];
      uint64_t v12 = (void *)_domainResult;
      _domainResult = v11;

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_3E07C;
      v14[3] = &unk_B8E88;
      void v14[4] = WeakRetained;
      uint64_t v13 = +[EFScheduler mainThreadScheduler];
      [v13 performBlock:v14];
    }
    else
    {
      +[BYODUtil showErrorForPresenter:WeakRetained withError:v6 callback:0];
    }
  }
}

void sub_3E03C(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_3E070(id a1)
{
}

id sub_3E07C(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_3E168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  unsigned __int8 v10 = v9;

  a9.super_class = (Class)BYODDomainDetailViewController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_3E268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3E28C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = [v2 popViewControllerAnimated:1];
}

void sub_3E2E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_3E3D4(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

id sub_3E40C(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_3E84C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_3E9AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_3EB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_3EB58(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[BYODDomainDetailViewController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "error response on updating intro flag %@", buf, 0xCu);
    }

    +[BYODUtil showErrorForPresenter:*(void *)(a1 + 32) withError:v6 callback:0];
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_3ECFC;
  v11[3] = &unk_B9010;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v12 = v8;
  uint64_t v13 = v9;
  unsigned __int8 v10 = +[EFScheduler mainThreadScheduler];
  [v10 performBlock:v11];
}

void sub_3ECC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_3ECFC(uint64_t a1)
{
  [*(id *)(a1 + 32) hidesBusyIndicator];
  id v2 = *(void **)(a1 + 40);

  return [v2 dismissViewControllerAnimated:1 completion:0];
}

void sub_3F0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_3F6E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_3F94C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3FB34(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_D7410;
  qword_D7410 = (uint64_t)v1;
}

void sub_3FBA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_3FC6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3FCE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_401EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_40440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_40490(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadDnsRecords:*(void *)(a1 + 40)];
}

void sub_405B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_405FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void sub_40894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  v23 = v20;

  objc_destroyWeak(v21);
  objc_destroyWeak((id *)(v22 - 72));

  _Unwind_Resume(a1);
}

void sub_40938(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_40BD8;
    v20[3] = &unk_B8E88;
    id v21 = *(id *)(a1 + 32);
    id v8 = +[EFScheduler mainThreadScheduler];
    [v8 performBlock:v20];

    if (v6)
    {
      +[BYODUtil showErrorForPresenter:WeakRetained withError:v6 callback:0];
    }
    else
    {
      uint64_t v9 = [v5 dnsRecords];
      [WeakRetained setDnsRecords:v9];

      unsigned __int8 v10 = [WeakRetained dnsRecords];
      id v11 = [v10 count];

      if (v11)
      {
        id v12 = [BYODDomainSetupInstructionViewController alloc];
        uint64_t v13 = [WeakRetained dnsRecords];
        uint64_t v14 = [(BYODDomainSetupInstructionViewController *)v12 initWithDnsRecords:v13];

        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_40BE0;
        v18[3] = &unk_B9010;
        void v18[4] = WeakRetained;
        id v15 = v14;
        id v19 = v15;
        id v16 = +[EFScheduler mainThreadScheduler];
        [v16 performBlock:v18];
      }
      else
      {
        id v15 = +[BYODDomainManualSetupViewController log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v17 = 0;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "0 DNS record returned.", v17, 2u);
        }
      }
    }
  }
}

void sub_40B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

id sub_40BD8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "byod_stopSpinner");
}

id sub_40BE0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showViewController:sender:", *(void *)(a1 + 40));
}

id sub_40BEC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showViewController:sender:", *(void *)(a1 + 40));
}

void sub_40C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_40CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  unsigned __int8 v10 = v9;

  a9.super_class = (Class)BYODDomainManualSetupViewController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_40F04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_411C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_41390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4146C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_41550(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_41620(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_D7420;
  qword_D7420 = (uint64_t)v1;
}

void sub_41690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_4183C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_41BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_41EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_420DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

void sub_4212C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_423E8;
  v17[3] = &unk_B8E88;
  v17[4] = WeakRetained;
  id v8 = +[EFScheduler mainThreadScheduler];
  [v8 performBlock:v17];

  if (WeakRetained)
  {
    if (v6)
    {
      uint64_t v9 = +[BYODDomainPurchaseSearchViewController log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v6;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "BYODGetPurchaseURLRequest failed to return URL. Error: %@", buf, 0xCu);
      }

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_423FC;
      v13[3] = &unk_B94A8;
      id v14 = v6;
      id v15 = WeakRetained;
      id v16 = *(id *)(a1 + 32);
      +[BYODUtil showErrorForPresenter:WeakRetained withError:v14 callback:v13];
    }
    else
    {
      id v12 = v5;
      unsigned __int8 v10 = +[EFScheduler mainThreadScheduler];
      [v10 performBlock:&v11];
    }
  }
}

void sub_42384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_423E8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) stopSpinner];
}

id sub_423FC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) code];
  if (result == (id)-5001)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    return [v3 _removeSuggestion:v4];
  }
  return result;
}

void sub_42450(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) result];
  objc_msgSend(v1, "_navigateToProvider:");
}

void sub_424A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_427F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_428B4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) purchaseURL];
  id v4 = +[NSURL URLWithString:v2];

  id v3 = [objc_alloc((Class)SFSafariViewController) initWithURL:v4];
  [v3 setDelegate:*(void *)(a1 + 40)];
  [v3 setModalPresentationStyle:2];
  [*(id *)(a1 + 40) presentViewController:v3 animated:1 completion:0];
}

void sub_4296C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_42A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_42BA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_42C68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_42DF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_42E2C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_43150;
    v20[3] = &unk_B8E88;
    void v20[4] = WeakRetained;
    id v8 = +[EFScheduler mainThreadScheduler];
    [v8 performBlock:v20];

    *((unsigned char *)WeakRetained + 65) = 0;
    if (v6)
    {
      uint64_t v9 = +[BYODDomainPurchaseSearchViewController log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v6;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "BYODSearchDomainRequest failed: %@", buf, 0xCu);
      }

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_43164;
      v19[3] = &unk_B8E88;
      v19[4] = WeakRetained;
      unsigned __int8 v10 = +[EFScheduler mainThreadScheduler];
      [v10 performBlock:v19];

      +[BYODUtil showErrorForPresenter:WeakRetained withError:v6 callback:0];
    }
    else
    {
      uint64_t v11 = [v5 result];
      id v12 = (void *)*((void *)WeakRetained + 4);
      *((void *)WeakRetained + 4) = v11;

      id v13 = objc_alloc((Class)NSMutableArray);
      id v14 = [*((id *)WeakRetained + 4) suggestedDomains];
      id v15 = [v13 initWithArray:v14];
      id v16 = (void *)*((void *)WeakRetained + 5);
      *((void *)WeakRetained + 5) = v15;

      *((unsigned char *)WeakRetained + 48) = 1;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_4316C;
      v18[3] = &unk_B8E88;
      void v18[4] = WeakRetained;
      id v17 = +[EFScheduler mainThreadScheduler];
      [v17 performBlock:v18];
    }
  }
}

void sub_430DC(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

id sub_43150(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) stopSpinner];
}

id sub_43164(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearResults];
}

id sub_4316C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];

  id v3 = *(void **)(a1 + 32);

  return [v3 _updateNextButtonState];
}

void sub_431B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_432D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_432FC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6) {
    goto LABEL_5;
  }
  if (![v5 success]) {
    goto LABEL_5;
  }
  id v8 = [v5 result];
  uint64_t v9 = [v8 domain];
  unsigned __int8 v10 = [v9 status];
  unsigned int v11 = [v10 isEqualToString:@"COMPLETE"];

  if (v11)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_43580;
    v15[3] = &unk_B8E88;
    void v15[4] = WeakRetained;
    id v12 = +[EFScheduler mainThreadScheduler];
    [v12 performBlock:v15];
  }
  else
  {
LABEL_5:
    id v13 = +[BYODDomainPurchaseSearchViewController log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "BYODGetDomainRequest failed: %@", buf, 0xCu);
    }

    id v12 = +[EFScheduler mainThreadScheduler];
    [v12 performBlock:&v14];
  }
}

void sub_43514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_43580(uint64_t a1)
{
  id v3 = [[BYODChooseYouOrFamilyViewController alloc] initWithACAccount:*(void *)(*(void *)(a1 + 32) + 8) domainPurchase:1 domainName:*(void *)(*(void *)(a1 + 32) + 24)];
  id v2 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v3];
  [v2 setModalPresentationStyle:1];
  [*(id *)(a1 + 32) presentViewController:v2 animated:1 completion:0];
}

void sub_43628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_43648(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_4369C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_43768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_43804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_43CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_43EC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_44070(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_44114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_441B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_443BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_44424(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void sub_4457C(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_D7430;
  qword_D7430 = (uint64_t)v1;
}

void sub_445EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_449C4(_Unwind_Exception *a1)
{
  id v7 = v3;

  _Unwind_Resume(a1);
}

void sub_44C80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_44D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_45494(_Unwind_Exception *a1)
{
  id v7 = v3;

  _Unwind_Resume(a1);
}

void sub_45614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_45728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_46038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  id v15 = v11;

  _Unwind_Resume(a1);
}

void sub_46384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_46508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_4681C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4710C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_4742C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_47660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_477C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4787C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4795C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_47B1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_47C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_47E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

void sub_47EC0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) spinner];
  [v1 startSpinner];
}

void sub_47F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_47F20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_480C8;
    v14[3] = &unk_B8E88;
    void v14[4] = WeakRetained;
    uint64_t v9 = +[EFScheduler mainThreadScheduler];
    [v9 performBlock:v14];

    if (v6)
    {
      +[BYODUtil showErrorForPresenter:v8 withError:v6 callback:0];
    }
    else
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_48128;
      v11[3] = &unk_B9010;
      id v12 = v5;
      id v13 = v8;
      unsigned __int8 v10 = +[EFScheduler mainThreadScheduler];
      [v10 performBlock:v11];
    }
  }
}

void sub_48080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  uint64_t v18 = v17;

  _Unwind_Resume(a1);
}

void sub_480C8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) spinner];
  [v1 startSpinner];
}

void sub_48114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_48128(uint64_t a1)
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v2 = [*(id *)(a1 + 32) result];
  [v4 setObject:v2 forKeyedSubscript:@"domainData"];

  if ([*(id *)(a1 + 40) showDefaultEmailSelect])
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 postNotificationName:@"BYOD_DOMAIN_DATA_REFRESH_NOTIFICATION" object:0 userInfo:v4];
  }
  else
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 postNotificationName:@"BYOD_MANUAL_DOMAIN_DATA_REFRESH_NOTIFICATION" object:0 userInfo:0];
  }

  [*(id *)(a1 + 40) dismissViewControllerAnimated:1 completion:0];
}

void sub_4820C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_48938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  id v15 = v12;

  _Unwind_Resume(a1);
}

void sub_48B3C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_48C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_48D24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_48E3C(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_D7440;
  qword_D7440 = (uint64_t)v1;
}

void sub_48EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_48F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_49058(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_49340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_49440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_498DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, id *location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Unwind_Resume(a1);
}

void sub_49A00(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) setProperty:v3 forKey:PSIconImageKey];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_49B18;
    v6[3] = &unk_B9010;
    v6[4] = WeakRetained;
    id v7 = *(id *)(a1 + 32);
    id v5 = +[EFScheduler mainThreadScheduler];
    [v5 performBlock:v6];
  }
}

void sub_49AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  id v17 = v16;

  _Unwind_Resume(a1);
}

id sub_49B18(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:1];
}

void sub_49C3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_49EF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4A000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_4A198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4A450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_4A5E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4A7E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_4A908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_4AA0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_4AA90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4AAFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_4ADF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

id sub_4AEC0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteEmailFromServer:*(void *)(a1 + 40)];
}

void sub_4B0AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_4B138()
{
}

void sub_4B140(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    id v16 = sub_4B31C;
    id v17 = &unk_B8E88;
    id v18 = *(id *)(a1 + 32);
    id v8 = +[EFScheduler mainThreadScheduler];
    [v8 performBlock:&v14];

    if (v6)
    {
      +[BYODUtil showErrorForPresenter:WeakRetained withError:v6 callback:0];
    }
    else
    {
      uint64_t v9 = [v5 result];
      unsigned __int8 v10 = (void *)WeakRetained[24];
      WeakRetained[24] = v9;

      unsigned int v11 = [v5 result];
      [WeakRetained _postNotificationForDomainData:v11];

      id v12 = +[EFScheduler mainThreadScheduler];
      [v12 performBlock:&v13];
    }
  }
}

void sub_4B2DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  id v22 = v21;

  _Unwind_Resume(a1);
}

id sub_4B31C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "byod_stopSpinner");
}

id sub_4B324(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_4B40C(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

id sub_4B444(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_4B4DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_4B570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  unsigned __int8 v10 = v9;

  a9.super_class = (Class)BYODEmailAddressManageViewController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_4B75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_4B7C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void sub_4B9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_4BD30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  _Unwind_Resume(a1);
}

void sub_4BDC0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_4BFB4;
    v15[3] = &unk_B8E88;
    void v15[4] = WeakRetained;
    uint64_t v9 = +[EFScheduler mainThreadScheduler];
    [v9 performBlock:v15];

    if (v6)
    {
      unsigned __int8 v10 = [*(id *)(a1 + 32) chooseContactViewController];
      +[BYODUtil showErrorForPresenter:v10 withError:v6 callback:0];
    }
    else
    {
      unsigned int v11 = [v5 result];
      [v8 _postNotificationForDomainData:v11];

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_4BFC8;
      v13[3] = &unk_B9010;
      void v13[4] = v8;
      id v14 = *(id *)(a1 + 32);
      id v12 = +[EFScheduler mainThreadScheduler];
      [v12 performBlock:v13];
    }
  }
}

void sub_4BF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

id sub_4BFB4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 200) stopSpinner];
}

void sub_4BFC8(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadSpecifiers];
  id v2 = [*(id *)(a1 + 40) chooseContactViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

void sub_4C028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_4C180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4C284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4C3D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4C514(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_D7450;
  qword_D7450 = (uint64_t)v1;
}

void sub_4C584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_4C674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4C858(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4CB30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4CD98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_4CDE4(uint64_t a1)
{
  id v2 = [BYODGetDomainRequest alloc];
  id v3 = *(void **)(*(void *)(a1 + 32) + 184);
  id v4 = [v3 accountStore];
  id v5 = [*(id *)(a1 + 32) _getDomainName];
  id v6 = [(BYODGetDomainRequest *)v2 initWithAccount:v3 accountStore:v4 domain:v5];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4CF3C;
  v7[3] = &unk_B9290;
  objc_copyWeak(&v8, &location);
  [(BYODGetDomainRequest *)v6 performRequestWithCallback:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void sub_4CF04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_4CF3C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_4D1A4;
    v22[3] = &unk_B8E88;
    v22[4] = WeakRetained;
    uint64_t v9 = +[EFScheduler mainThreadScheduler];
    [v9 performBlock:v22];

    if (v6)
    {
      +[BYODUtil showErrorForPresenter:v8 withError:v6 callback:0];
    }
    else
    {
      uint64_t v10 = [v5 result];
      unsigned int v11 = (void *)v8[30];
      v8[30] = v10;

      if (*((unsigned char *)v8 + 192))
      {
        [v8 _fetchFamilyDetails];
      }
      else
      {
        id v12 = [BYODAddEmailViewController alloc];
        uint64_t v13 = v8[23];
        int v14 = *((unsigned __int8 *)v8 + 192);
        uint64_t v15 = v8[28];
        id v16 = [v8 _getDomainName];
        id v17 = [(BYODAddEmailViewController *)v12 initWithACAccount:v13 familyFlow:v14 != 0 familyCircle:v15 domainName:v16 domainResult:v8[30]];

        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_4D1B8;
        v20[3] = &unk_B9010;
        void v20[4] = v8;
        id v18 = v17;
        id v21 = v18;
        id v19 = +[EFScheduler mainThreadScheduler];
        [v19 performBlock:v20];
      }
    }
  }
}

void sub_4D158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

id sub_4D1A4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 232) stopSpinner];
}

id sub_4D1B8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showViewController:sender:", *(void *)(a1 + 40));
}

void sub_4D1C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_4D454;
      v15[3] = &unk_B8E88;
      void v15[4] = WeakRetained;
      uint64_t v9 = +[EFScheduler mainThreadScheduler];
      [v9 performBlock:v15];

      +[BYODUtil showErrorForPresenter:v8 withError:v6 callback:0];
    }
    else
    {
      uint64_t v10 = [v5 result];
      v8[208] = [v10 isDomainConnect];

      if (v8[208])
      {
        if (v8[193])
        {
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        }
        else
        {
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_4D468;
          v14[3] = &unk_B8E88;
          void v14[4] = v8;
          id v12 = +[EFScheduler mainThreadScheduler];
          [v12 performBlock:v14];

          [v8 _fetchDomainDetails];
        }
      }
      else
      {
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_4D47C;
        v13[3] = &unk_B8E88;
        void v13[4] = v8;
        unsigned int v11 = +[EFScheduler mainThreadScheduler];
        [v11 performBlock:v13];

        if (v8[193]) {
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        }
        else {
          [v8 _triggerManualDomainSetupFlow];
        }
      }
    }
  }
}

void sub_4D40C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_4D454(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 232) stopSpinner];
}

id sub_4D468(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 232) stopSpinner];
}

id sub_4D47C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 232) stopSpinner];
}

void sub_4D584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_4D59C(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"BYOD_REFRESH_NOTIFICATION" object:0 userInfo:0];

  id v3 = *(void **)(a1 + 32);

  return [v3 dismissViewControllerAnimated:1 completion:0];
}

void sub_4D604(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4D730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4D770(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      +[BYODUtil showErrorForPresenter:WeakRetained withError:v6 callback:0];
      goto LABEL_10;
    }
    id v8 = v5;
    uint64_t v9 = [v8 result];
    uint64_t v10 = [v9 domain];
    unsigned int v11 = [v10 status];
    if ([v11 isEqualToString:@"IN_PROGRESS"])
    {
      id v12 = [v10 verificationStatus];
      unsigned int v13 = [v12 isEqualToString:@"NOT_STARTED"];

      if (v13)
      {
        [WeakRetained _showDomainConnectSignInAlert:v10];
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
    }
    int v14 = [[BYODDomainDetailViewController alloc] initWithAccount:WeakRetained[23] domain:v9 domainState:0];
    id v17 = v14;
    uint64_t v15 = +[EFScheduler mainThreadScheduler];
    [v15 performBlock:&v16];

    goto LABEL_9;
  }
LABEL_10:
}

void sub_4D934(_Unwind_Exception *a1)
{
  uint64_t v9 = v7;

  _Unwind_Resume(a1);
}

void sub_4D9A4()
{
}

id sub_4D9AC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showViewController:sender:", *(void *)(a1 + 40));
}

void sub_4DDE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4DF1C(uint64_t a1)
{
  id v2 = [objc_alloc((Class)SFSafariViewController) initWithURL:*(void *)(a1 + 32)];
  [v2 setDelegate:*(void *)(a1 + 40)];
  [v2 setModalPresentationStyle:2];
  [*(id *)(a1 + 40) presentViewController:v2 animated:1 completion:0];
}

void sub_4DF98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_4DFAC(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void sub_4E040(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (!v7)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 224), a2);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_4E134;
    v9[3] = &unk_B8E88;
    v9[4] = *(void *)(a1 + 32);
    id v8 = +[EFScheduler mainThreadScheduler];
    [v8 performBlock:v9];
  }
}

void sub_4E118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4E134(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 208)
    || ([*(id *)(v2 + 240) domain],
        id v3 = objc_claimAutoreleasedReturnValue(),
        unsigned int v4 = [v3 withEmailAddress],
        v3,
        v4))
  {
    id v5 = [BYODAddEmailViewController alloc];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(v6 + 184);
    uint64_t v8 = *(unsigned __int8 *)(v6 + 192);
    uint64_t v9 = *(void *)(v6 + 224);
    uint64_t v10 = [(id)v6 _getDomainName];
    id v12 = [(BYODAddEmailViewController *)v5 initWithACAccount:v7 familyFlow:v8 familyCircle:v9 domainName:v10 domainResult:*(void *)(*(void *)(a1 + 32) + 240)];

    [*(id *)(a1 + 32) showViewController:v12 sender:*(void *)(a1 + 32)];
  }
  else
  {
    unsigned int v11 = *(void **)(a1 + 32);
    [v11 _triggerManualDomainSetupFlow];
  }
}

void sub_4E274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4E318(_Unwind_Exception *a1)
{
  unsigned int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_4E3AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4E500(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_D7460;
  qword_D7460 = (uint64_t)v1;
}

void sub_4E570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_4E60C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4E748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4EF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _Unwind_Exception *exception_object, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_4F2F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_4F340(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[BYODFirstTimeIntroViewController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Error, showWelcomeScreen flag has not updated  %@", buf, 0xCu);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4F4B4;
  block[3] = &unk_B94A8;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v12 = v8;
  uint64_t v13 = v9;
  id v14 = v5;
  id v10 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_4F498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4F4B4(uint64_t a1)
{
  [*(id *)(a1 + 32) hidesBusyIndicator];
  uint64_t v2 = *(void **)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_4F568;
  v3[3] = &unk_B9010;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 48);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

void sub_4F554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_4F568(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) callback];
  v2[2](v2, [*(id *)(a1 + 40) success]);
}

void sub_4F5D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_4F658(uint64_t a1)
{
  os_log_t v1 = [*(id *)(a1 + 32) callback];
  v1[2](v1, 0);
}

void sub_4F6B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_4F7C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4F9B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4FB14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4FBF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4FE74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_500C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_50220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5039C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5054C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_506F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5078C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_507FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5088C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_508FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_509B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_50B10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_50BF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_50CE4(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_D7470;
  qword_D7470 = (uint64_t)v1;
}

void sub_50D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_50F88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_511CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

void sub_51230(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_515AC;
  v24[3] = &unk_B8E88;
  id v25 = *(id *)(a1 + 32);
  uint64_t v7 = +[EFScheduler mainThreadScheduler];
  [v7 performBlock:v24];

  if (WeakRetained)
  {
    unsigned __int8 v8 = [v5 success];
    if (a3) {
      unsigned __int8 v9 = 0;
    }
    else {
      unsigned __int8 v9 = v8;
    }
    if (v9)
    {
      id v10 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v11 = +[UIImage imageNamed:@"CustomDomainIcon.png" inBundle:v10];

      id v21 = (void *)v11;
      id v12 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v13 = [v12 localizedStringForKey:@"BYOD_DOMAIN_INVITE_CREATE_EMAIL_BODY" value:&stru_B9F70 table:@"AccountPreferences"];
      id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, WeakRetained[1]);

      uint64_t v15 = [BYODCreateNewEmailViewController alloc];
      id v16 = +[NSBundle bundleForClass:objc_opt_class()];
      id v17 = [v16 localizedStringForKey:@"BYOD_DOMAIN_INVITE_CREATE_EMAIL_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
      id v18 = [(BYODCreateNewEmailViewController *)v15 initWithTitle:v17 detailText:v14 icon:v21 adoptTableViewScrollView:1 acAccount:WeakRetained[2] domainName:WeakRetained[1]];

      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_515B4;
      v22[3] = &unk_B9010;
      v22[4] = WeakRetained;
      id v19 = v18;
      v23 = v19;
      long long v20 = +[EFScheduler mainThreadScheduler];
      [v20 performSyncBlock:v22];
    }
    else
    {
      [WeakRetained _showErrorAlert];
    }
  }
}

void sub_51510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

id sub_515AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) hidesBusyIndicator];
}

id sub_515B4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showViewController:sender:", *(void *)(a1 + 40));
}

void sub_51764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

void sub_517A4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    unsigned __int8 v7 = [v5 success];
    if (a3) {
      unsigned __int8 v8 = 0;
    }
    else {
      unsigned __int8 v8 = v7;
    }
    if (v8)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_518A8;
      v10[3] = &unk_B8E88;
      void v10[4] = WeakRetained;
      unsigned __int8 v9 = +[EFScheduler mainThreadScheduler];
      [v9 performSyncBlock:v10];
    }
    else
    {
      [WeakRetained _showErrorAlert];
    }
  }
}

void sub_51880(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

id sub_518A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_51A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_51AD0(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void sub_51BEC(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_D7480;
  qword_D7480 = (uint64_t)v1;
}

void sub_51C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_51DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_51E90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_520A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_522F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_52B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_52FC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_531B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_53204(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_53408;
      v17[3] = &unk_B8E88;
      id v18 = *(id *)(a1 + 32);
      unsigned __int8 v8 = +[EFScheduler mainThreadScheduler];
      [v8 performBlock:v17];

      +[BYODUtil showErrorForPresenter:WeakRetained withError:v6 callback:0];
      id v9 = v18;
    }
    else
    {
      id v10 = v5;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_53410;
      v12[3] = &unk_B9088;
      id v13 = *(id *)(a1 + 32);
      id v14 = WeakRetained;
      id v15 = v10;
      id v9 = v15;
      id v16 = v9;
      uint64_t v11 = +[EFScheduler mainThreadScheduler];
      [v11 performBlock:v12];
    }
  }
}

void sub_533A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17)
{
  id v22 = v21;

  _Unwind_Resume(a1);
}

id sub_53408(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "byod_stopSpinner");
}

void sub_53410(id *a1)
{
  objc_msgSend(a1[4], "byod_stopSpinner");
  [a1[4] removePropertyForKey:PSBadgeNumberKey];
  [a1[5] reloadSpecifier:a1[4]];
  uint64_t v2 = [a1[6] result];
  id v3 = [*((id *)a1[5] + 32) normalizedDSID];
  id v4 = [v2 getMemberFromDSID:v3];

  v127 = v4;
  if (v4)
  {
    id v5 = [v4 invitationStatus];
    unsigned int v6 = [v5 isEqualToString:@"INVITED"];

    if (v6)
    {
      unsigned __int8 v7 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v124 = +[UIImage imageNamed:@"CustomDomainIcon.png" inBundle:v7];

      v123 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned __int8 v8 = [v123 localizedStringForKey:@"BYOD_DOMAIN_INVITE_BODY" value:&stru_B9F70 table:@"AccountPreferences"];
      id v9 = [a1[6] result];
      id v10 = [v9 domain];
      uint64_t v11 = [v10 owner];
      id v12 = [v11 firstName];
      id v13 = [a1[6] result];
      id v14 = [v13 domain];
      id v15 = [v14 name];
      id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v12, v15);

      id v17 = +[NSBundle bundleForClass:objc_opt_class()];
      id v18 = [v17 localizedStringForKey:@"BYOD_DOMAIN_INVITE_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
      id v19 = [a1[6] result];
      long long v20 = [v19 domain];
      id v21 = [v20 name];
      id v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v21);

      v23 = [BYODInvitationViewController alloc];
      uint64_t v24 = *((void *)a1[5] + 32);
      id v25 = [a1[7] result];
      v26 = [v25 domain];
      v27 = [v26 name];
      v28 = v23;
      v29 = (BYODChooseYouOrFamilyViewController *)v124;
      v30 = [(BYODInvitationViewController *)v28 initWithTitle:v22 detailText:v16 icon:v124 acAccount:v24 domainName:v27];

      id v31 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v30];
      [v31 setModalInPresentation:1];
      [a1[5] presentViewController:v31 animated:1 completion:0];

LABEL_4:
LABEL_12:

      goto LABEL_20;
    }
  }
  v32 = (void *)*((void *)a1[5] + 30);
  if (v32 && ([v32 isEqualToString:@"purchase"] & 1) != 0) {
    goto LABEL_10;
  }
  v33 = [a1[6] result];
  v34 = [v33 domain];
  if ([v34 isDomainModeSet]) {
    goto LABEL_14;
  }
  v35 = [a1[6] result];
  v36 = [v35 domain];
  v37 = [v36 status];
  if (![v37 isEqualToString:@"COMPLETE"])
  {

LABEL_14:
    goto LABEL_15;
  }
  v38 = [a1[6] result];
  v39 = [v38 domain];
  unsigned int v40 = [v39 isDomainPurchased];

  if (v40)
  {
LABEL_10:
    v41 = a1[5];
    v42 = (void *)v41[30];
    v41[30] = 0;

    v43 = [BYODChooseYouOrFamilyViewController alloc];
    uint64_t v44 = *((void *)a1[5] + 32);
    v45 = [a1[7] result];
    v46 = [v45 domain];
    v47 = [v46 name];
    v29 = [(BYODChooseYouOrFamilyViewController *)v43 initWithACAccount:v44 domainPurchase:1 domainName:v47];

    id v48 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v29];
    [v48 setModalInPresentation:1];
    [a1[5] presentViewController:v48 animated:1 completion:0];
LABEL_11:

    goto LABEL_12;
  }
LABEL_15:
  v49 = [a1[6] result];
  if ([v49 isDNSVerfied])
  {

LABEL_18:
    v52 = [BYODDomainDetailViewController alloc];
    uint64_t v53 = *((void *)a1[5] + 32);
    v54 = [a1[7] result];
    v55 = [(BYODDomainDetailViewController *)v52 initWithAccount:v53 domain:v54 domainState:0];

    v56 = a1[5];
    v57 = (void *)v56[30];
    v56[30] = 0;

    [(BYODDomainDetailViewController *)v55 setParentController:a1[5]];
    [(BYODDomainDetailViewController *)v55 setSpecifier:a1[4]];
    [a1[5] showViewController:v55 sender:a1[5]];
LABEL_19:

    goto LABEL_20;
  }
  v50 = [a1[6] result];
  unsigned int v51 = [v50 isDomainInProgress];

  if (v51) {
    goto LABEL_18;
  }
  v58 = [a1[6] result];
  v59 = [v58 domain];
  unsigned int v60 = [v59 isDomainConnect];

  id v61 = a1[6];
  if (!v60)
  {
    v70 = [v61 result];
    v71 = [v70 domain];
    unsigned int v72 = [v71 withEmailAddress];

    id v73 = a1[6];
    if (!v72)
    {
      v82 = [v73 result];
      v83 = [v82 domain];
      v29 = [v83 status];

      v84 = [a1[6] result];
      v85 = [v84 domain];
      id v16 = [v85 verificationStatus];

      if (-[BYODChooseYouOrFamilyViewController isEqualToString:](v29, "isEqualToString:", @"IN_PROGRESS"))id v86 = [v16 isEqualToString:@"NOT_STARTED"]; {
      else
      }
        id v86 = 0;
      id v106 = a1[5];
      v107 = [a1[6] result];
      v108 = [v107 domain];
      [v106 _triggerManualDomainSetupFlow:v108 showRedBadge:v86];

      goto LABEL_4;
    }
    v74 = [v73 result];
    unsigned int v75 = [v74 hasEmails];

    if (!v75)
    {
      v95 = [BYODAddEmailViewController alloc];
      uint64_t v96 = *((void *)a1[5] + 32);
      v125 = [a1[6] result];
      v97 = [v125 domain];
      id v98 = [v97 withFamily];
      uint64_t v99 = *((void *)a1[5] + 25);
      v100 = [a1[6] result];
      v101 = [v100 domain];
      v102 = [v101 name];
      v103 = [a1[6] result];
      v104 = [(BYODAddEmailViewController *)v95 initWithACAccount:v96 familyFlow:v98 familyCircle:v99 domainName:v102 domainResult:v103];

      [(BYODAddEmailViewController *)v104 setShouldShowCancel:1];
      id v105 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v104];
      [a1[5] presentViewController:v105 animated:1 completion:0];

      goto LABEL_20;
    }
    goto LABEL_28;
  }
  v62 = [v61 result];
  v63 = [v62 domain];
  if ([v63 withEmailAddress])
  {
    v64 = [a1[6] result];
    unsigned __int8 v65 = [v64 hasEmails];

    if ((v65 & 1) == 0)
    {
      v66 = [a1[6] result];
      v67 = [v66 domain];
      unsigned int v68 = [v67 withFamily];

      if (!v68)
      {
        v112 = [BYODAddEmailViewController alloc];
        uint64_t v113 = *((void *)a1[5] + 32);
        v126 = [a1[6] result];
        v114 = [v126 domain];
        id v115 = [v114 withFamily];
        uint64_t v116 = *((void *)a1[5] + 25);
        v117 = [a1[6] result];
        v118 = [v117 domain];
        v119 = [v118 name];
        v120 = [a1[6] result];
        v121 = [(BYODAddEmailViewController *)v112 initWithACAccount:v113 familyFlow:v115 familyCircle:v116 domainName:v119 domainResult:v120];

        [(BYODAddEmailViewController *)v121 setShouldShowCancel:1];
        id v122 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v121];
        [v122 setModalInPresentation:1];
        [a1[5] presentViewController:v122 animated:1 completion:0];

        goto LABEL_20;
      }
      id v69 = a1[5];
      v55 = [a1[6] result];
      [v69 _fetchFamilyDetails:v55];
      goto LABEL_19;
    }
  }
  else
  {
  }
  v79 = [a1[6] result];
  v80 = [v79 domain];
  unsigned int v81 = [v80 withEmailAddress];

  if (v81)
  {
LABEL_28:
    v76 = [BYODDomainDetailViewController alloc];
    uint64_t v77 = *((void *)a1[5] + 32);
    v78 = [a1[7] result];
    v29 = [(BYODDomainDetailViewController *)v76 initWithAccount:v77 domain:v78 domainState:*((void *)a1[5] + 30)];

    [a1[5] showViewController:v29 sender:a1[5]];
    goto LABEL_12;
  }
  v87 = [a1[6] result];
  v88 = [v87 domain];
  v89 = [v88 domainConnectServerUrl];
  id v90 = [v89 length];

  if (v90)
  {
    id v91 = objc_alloc((Class)NSURL);
    v92 = [a1[6] result];
    v93 = [v92 domain];
    v94 = [v93 domainConnectServerUrl];
    v29 = (BYODChooseYouOrFamilyViewController *)[v91 initWithString:v94];

    id v48 = [objc_alloc((Class)SFSafariViewController) initWithURL:v29];
    [v48 setDelegate:a1[5]];
    [v48 setModalPresentationStyle:2];
    [a1[5] presentViewController:v48 animated:1 completion:0];
    goto LABEL_11;
  }
  v109 = +[BYODLandingScreenViewController log];
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
  {
    v110 = [a1[6] result];
    v111 = objc_msgSend(v110, "ef_publicDescription");
    *(_DWORD *)buf = 138412290;
    v129 = v111;
    _os_log_impl(&dword_0, v109, OS_LOG_TYPE_DEFAULT, "domain connect server URL is nil. domain info %@", buf, 0xCu);
  }
LABEL_20:
}

void sub_54068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_544A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_544B8(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    unsigned __int8 v8 = +[BYODLandingScreenViewController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "error while fetching family details %@", buf, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 200), a2);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_54668;
    v12[3] = &unk_B9010;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    id v13 = v9;
    uint64_t v14 = v10;
    uint64_t v11 = +[EFScheduler mainThreadScheduler];
    [v11 performBlock:v12];

    unsigned __int8 v8 = v13;
  }
}

void sub_54630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_54668(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) domain];
  unsigned int v3 = [v2 isDomainConnect];

  if (v3)
  {
    id v4 = [BYODAddEmailViewController alloc];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 256);
    id v6 = [*(id *)(a1 + 32) domain];
    id v7 = [v6 withFamily];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 200);
    id v9 = [*(id *)(a1 + 32) domain];
    uint64_t v10 = [v9 name];
    id v15 = [(BYODAddEmailViewController *)v4 initWithACAccount:v5 familyFlow:v7 familyCircle:v8 domainName:v10 domainResult:*(void *)(a1 + 32)];

    [(BYODAddEmailViewController *)v15 setShouldShowCancel:1];
    id v11 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v15];
    [*(id *)(a1 + 40) presentViewController:v11 animated:1 completion:0];

    id v12 = v15;
  }
  else
  {
    id v13 = *(void **)(a1 + 40);
    uint64_t v14 = [*(id *)(a1 + 32) domain];
    [v13 _triggerManualDomainSetupFlow:v14 showRedBadge:0];
    id v12 = (void *)v14;
  }
}

void sub_547C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_54990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_549E0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 pushViewController:*(void *)(a1 + 40) animated:1];
}

void sub_54A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_54D94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_54F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id v16 = v15;
  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_54F9C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_55144;
    v14[3] = &unk_B8E88;
    void v14[4] = WeakRetained;
    id v9 = +[EFScheduler mainThreadScheduler];
    [v9 performBlock:v14];

    uint64_t v10 = [v5 result];
    unsigned int v11 = [v10 purchaseAllowed];

    if (v11)
    {
      id v12 = +[EFScheduler mainThreadScheduler];
      [v12 performBlock:&v13];
    }
    else
    {
      +[BYODUtil showErrorForPresenter:v8 withError:v6 callback:0];
    }
  }
}

void sub_5510C(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

id sub_55144(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 248) stopSpinner];
}

void sub_55158(uint64_t a1)
{
  id v2 = [BYODDomainPurchaseSearchViewController alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 256);
  id v5 = [*(id *)(v3 + 208) domainPurchaseProviderName];
  id v7 = [(BYODDomainPurchaseSearchViewController *)v2 initWithACAccount:v4 isBuyNewDomainFlow:1 domainPurchaseProviderName:v5];

  id v6 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v7];
  [v6 setModalInPresentation:1];
  [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
}

void sub_55228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_5530C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_55474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_554A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      +[BYODUtil showErrorForPresenter:WeakRetained withError:v6 callback:0];
    }
    else
    {
      uint64_t v8 = [v5 result];
      id v9 = (void *)WeakRetained[26];
      WeakRetained[26] = v8;

      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_555D4;
      v11[3] = &unk_B8E88;
      void v11[4] = WeakRetained;
      uint64_t v10 = +[EFScheduler mainThreadScheduler];
      [v10 performBlock:v11];
    }
  }
}

void sub_555A8(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

id sub_555D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_55640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)BYODLandingScreenViewController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_55714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_55794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_55824(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_558AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_55D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_55EC0(id *a1)
{
  id v2 = [BYODMemberLeaveRequest alloc];
  uint64_t v3 = (void *)*((void *)a1[4] + 32);
  uint64_t v4 = [v3 accountStore];
  id v5 = [a1[5] name];
  id v6 = [(BYODMemberLeaveRequest *)v2 initWithAccount:v3 accountStore:v4 domain:v5];

  objc_msgSend(a1[6], "byod_startSpinner");
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, a1[4]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_56044;
  v7[3] = &unk_B9598;
  objc_copyWeak(&v9, &location);
  id v8 = a1[6];
  [(BYODMemberLeaveRequest *)v6 performRequestWithCallback:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void sub_55FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_56044(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_5618C;
    v8[3] = &unk_B8E88;
    id v9 = *(id *)(a1 + 32);
    id v6 = +[EFScheduler mainThreadScheduler];
    [v6 performSyncBlock:v8];

    if (v4)
    {
      +[BYODUtil showErrorForPresenter:WeakRetained withError:v4 callback:0];
    }
    else
    {
      id v7 = +[NSNotificationCenter defaultCenter];
      [v7 postNotificationName:@"BYOD_REFRESH_NOTIFICATION" object:0 userInfo:0];
    }
  }
}

void sub_56158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  id v17 = v16;

  _Unwind_Resume(a1);
}

id sub_5618C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "byod_stopSpinner");
}

void sub_56488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_56564(id *a1)
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_5676C;
  v12[3] = &unk_B8E88;
  id v13 = a1[4];
  id v2 = +[EFScheduler mainThreadScheduler];
  [v2 performBlock:v12];

  uint64_t v3 = [BYODDeleteDomainRequest alloc];
  id v4 = (void *)*((void *)a1[5] + 32);
  id v5 = [v4 accountStore];
  id v6 = [a1[6] name];
  id v7 = [(BYODDeleteDomainRequest *)v3 initWithAccount:v4 accountStore:v5 domain:v6];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, a1[5]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_56774;
  v8[3] = &unk_B9598;
  objc_copyWeak(&v10, &location);
  id v9 = a1[4];
  [(BYODDeleteDomainRequest *)v7 performRequestWithCallback:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void sub_56710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

id sub_5676C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "byod_startSpinner");
}

void sub_56774(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_568BC;
  v8[3] = &unk_B8E88;
  id v9 = *(id *)(a1 + 32);
  id v6 = +[EFScheduler mainThreadScheduler];
  [v6 performBlock:v8];

  if (WeakRetained)
  {
    if (v4)
    {
      +[BYODUtil showErrorForPresenter:WeakRetained withError:v4 callback:0];
    }
    else
    {
      id v7 = +[NSNotificationCenter defaultCenter];
      [v7 postNotificationName:@"BYOD_REFRESH_NOTIFICATION" object:0 userInfo:0];
    }
  }
}

void sub_56888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  id v17 = v16;

  _Unwind_Resume(a1);
}

id sub_568BC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "byod_stopSpinner");
}

void sub_569CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_569F4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (a2)
  {
    [WeakRetained _listDomain];
  }
  else
  {
    id v8 = +[BYODLandingScreenViewController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Upsell flow failed with error: %@.", (uint8_t *)&v9, 0xCu);
    }
  }
}

void sub_56AD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_56BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id v16 = v15;
  objc_destroyWeak(v16);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_56C30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = +[BYODLandingScreenViewController log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v6;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "error while refreshing domain list data error %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v9 = [v5 result];
      id v10 = (void *)WeakRetained[26];
      WeakRetained[26] = v9;

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_56DDC;
      v12[3] = &unk_B8E88;
      void v12[4] = WeakRetained;
      unsigned int v11 = +[EFScheduler mainThreadScheduler];
      [v11 performBlock:v12];
    }
  }
}

void sub_56DA4(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

id sub_56DDC(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_56EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v13 = v12;

  _Unwind_Resume(a1);
}

void sub_57290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_57468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_57628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_57708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_57830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_57938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_57E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5818C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_58530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_58600(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeMemberRequest];
}

void sub_5885C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_588F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resendInviteRequest];
}

void sub_58AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_58B0C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_58D24;
    v17[3] = &unk_B8E88;
    void v17[4] = WeakRetained;
    uint64_t v9 = +[EFScheduler mainThreadScheduler];
    [v9 performBlock:v17];

    unsigned __int8 v10 = [v5 success];
    if (v6) {
      unsigned __int8 v11 = 0;
    }
    else {
      unsigned __int8 v11 = v10;
    }
    if (v11)
    {
      id v12 = objc_alloc_init((Class)NSMutableDictionary);
      id v13 = [v5 result];
      [v12 setObject:v13 forKeyedSubscript:@"domainData"];

      id v14 = +[NSNotificationCenter defaultCenter];
      [v14 postNotificationName:@"BYOD_DOMAIN_DATA_REFRESH_NOTIFICATION" object:0 userInfo:v12];

      id v15 = +[EFScheduler mainThreadScheduler];
      [v15 performBlock:&v16];
    }
    else
    {
      +[BYODUtil showErrorForPresenter:v8 withError:v6 callback:0];
    }
  }
}

void sub_58CD8(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

id sub_58D24(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) stopSpinner];
}

void sub_58D38(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = [v2 popViewControllerAnimated:1];
}

void sub_58D90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_58F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_58FB4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_590B0;
    v8[3] = &unk_B8E88;
    void v8[4] = WeakRetained;
    id v7 = +[EFScheduler mainThreadScheduler];
    [v7 performBlock:v8];

    if (v4) {
      +[BYODUtil showErrorForPresenter:v6 withError:v4 callback:0];
    }
  }
}

void sub_59088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_590B0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) stopSpinner];
}

void sub_5928C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_59388(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_D7490;
  qword_D7490 = (uint64_t)v1;
}

void sub_593F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_59710(_Unwind_Exception *a1)
{
  id v7 = v3;

  _Unwind_Resume(a1);
}

void sub_59890(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_599A8(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)qword_D74A0;
  qword_D74A0 = (uint64_t)v1;
}

void sub_59A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_59CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_59FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5A14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_5A164(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v8 statusCode] == (char *)&stru_158.reloff + 1 && *(unsigned char *)(a1 + 48))
  {
    unsigned __int8 v10 = +[BYODRequest log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v7;
      __int16 v35 = 2112;
      id v36 = v8;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "401 response from server for request %@ response %@", buf, 0x16u);
    }

    v41[0] = &__kCFBooleanTrue;
    v40[0] = kACRenewCredentialsShouldForceKey;
    v40[1] = kACRenewCredentialsServicesKey;
    CFStringRef v39 = @"com.apple.gs.icloud.mail.auth";
    unsigned __int8 v11 = +[NSArray arrayWithObjects:&v39 count:1];
    v41[1] = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];

    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 40);
    uint64_t v15 = *(void *)(v13 + 48);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_5A6AC;
    v28[3] = &unk_B9750;
    id v32 = *(id *)(a1 + 40);
    id v29 = v7;
    id v16 = v8;
    uint64_t v17 = *(void *)(a1 + 32);
    id v30 = v16;
    uint64_t v31 = v17;
    [v14 renewCredentialsForAccount:v15 options:v12 completion:v28];
  }
  else if (*(void *)(a1 + 40))
  {
    if ([v8 statusCode] == stru_B8.segname)
    {
      id v18 = v8;
      if ([v18 success])
      {
        id v12 = 0;
      }
      else
      {
        v23 = [v18 byodError];
        uint64_t v24 = [v23 errorCode];
        signed int v25 = [v24 intValue];
        v26 = [*(id *)(a1 + 32) _errorDictionaryFromServerResponse:v18];
        id v12 = +[NSError errorWithDomain:@"BYODServerErrorDomain" code:v25 userInfo:v26];
      }
    }
    else
    {
      if (v9)
      {
        id v19 = +[BYODRequest log];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [v8 statusCode];
          id v21 = objc_msgSend(v9, "ef_publicDescription");
          *(_DWORD *)buf = 134218242;
          id v34 = v20;
          __int16 v35 = 2114;
          id v36 = v21;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "non 200 response from server responseCode: %ld error: %{public}@", buf, 0x16u);
        }
        id v22 = v9;
      }
      else
      {
        v27 = +[BYODRequest log];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          id v34 = [v8 statusCode];
          _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "non 200 response from server responseCode: %ld. Error object is nil. Constructing local error code", buf, 0xCu);
        }

        id v22 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"BYODServerErrorDomain", [v8 statusCode], 0);
      }
      id v12 = v22;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v12 = +[BYODRequest log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v34 = v8;
      __int16 v35 = 2112;
      id v36 = v7;
      __int16 v37 = 2112;
      id v38 = v9;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "no handler for performRequestWithHandler. Server response %@ for request %@ and error %@", buf, 0x20u);
    }
  }
}

void sub_5A5FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5A6AC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    if (a2 == 1)
    {
      id v6 = +[BYODRequest log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v7 = "auth token renew failed. User rejected";
        id v8 = buf;
        goto LABEL_11;
      }
LABEL_12:

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_13;
    }
    if (a2 == 2)
    {
      id v6 = +[BYODRequest log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = 0;
        id v7 = "auth token renew failed.";
        id v8 = (uint8_t *)&v12;
LABEL_11:
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
    id v9 = +[BYODRequest log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v10 = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "auth token renewed. Retrying request with server", v10, 2u);
    }

    [*(id *)(a1 + 48) _performRequestWithHandler:*(void *)(a1 + 56) renewToken:0];
  }
LABEL_13:
}

void sub_5A7FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5A9C8(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_5ABAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5AC44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5AD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5AD18(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "list domain call response %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  id v9 = v6;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v9, v7);
  }
}

void sub_5AE1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5AF10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5AFAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5B068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5B080(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "get domain call response %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  id v9 = v6;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v9, v7);
  }
}

void sub_5B184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5B200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5B2DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5B378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5B434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5B44C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "get DNS records call response %@ error %@", (uint8_t *)&v15, 0x16u);
  }

  id v9 = v6;
  unsigned __int8 v10 = [v9 success];
  if (v7) {
    unsigned __int8 v11 = 0;
  }
  else {
    unsigned __int8 v11 = v10;
  }
  if (v11)
  {
    id v12 = 0;
  }
  else
  {
    uint64_t v13 = +[NSError errorWithDomain:@"BYODServerErrorDomain" code:500 userInfo:0];

    id v12 = (void *)v13;
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    (*(void (**)(uint64_t, id, void *))(v14 + 16))(v14, v9, v12);
  }
}

void sub_5B59C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5B618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5B6D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5B774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5B824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5B83C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "list email send from call response %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  id v9 = v6;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v9, v7);
  }
}

void sub_5B940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5BA54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5BAF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5BBAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5BBC4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = +[BYODRequest log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "add domain call response %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v8, v7);
  }
}

void sub_5BCC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5BDAC(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_5BE9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5BF38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5BFF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5C00C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = +[BYODRequest log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "domain verify transfer call response %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v8, v7);
  }
}

void sub_5C110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5C188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5C294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5C334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5C3F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5C408(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = +[BYODRequest log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "set default email call response %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v8, v7);
  }
}

void sub_5C50C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5C5A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5C7BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_5C874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5C930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5C948(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = +[BYODRequest log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "delete email  call response %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v8, v7);
  }
}

void sub_5CA4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5CB3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5CD5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_5CE18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5CED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5CEEC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = +[BYODRequest log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "add email  call response %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v8, v7);
  }
}

void sub_5CFF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5D0E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5D2D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5D374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5D430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5D448(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "delete domain call response %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  id v9 = v6;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v9, v7);
  }
}

void sub_5D54C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5D5C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5D6A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5D744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5D800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5D818(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "resend verification email call response %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  id v9 = v6;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v9, v7);
  }
}

void sub_5D91C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5D9A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5DB08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5DBAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5DC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5DC80(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = +[BYODRequest log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "add alias call response %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v8, v7);
  }
}

void sub_5DD84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5DE3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5DFD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5E070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5E12C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5E144(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Enable catch-all call response %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  id v9 = v6;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v9, v7);
  }
}

void sub_5E248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5E2C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5E37C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5E414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5E4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5E4E8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Disable catch-all call response %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  id v9 = v6;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v9, v7);
  }
}

void sub_5E5EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5E668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5E7A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5E844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5E900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5E918(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "invite domain member response %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  id v9 = v6;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v9, v7);
  }
}

void sub_5EA1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5EAD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5EC20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5ECBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5ED78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5ED90(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "update intro flag call response %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  id v9 = v6;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v9, v7);
  }
}

void sub_5EE94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5EF18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5F028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5F0C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5F180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5F198(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend(v7, "ef_publicDescription");
    int v16 = 138412546;
    id v17 = v6;
    __int16 v18 = 2114;
    id v19 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "accept invite call response %@ error %{public}@", (uint8_t *)&v16, 0x16u);
  }
  id v10 = v6;
  unsigned __int8 v11 = [v10 success];
  if (v7) {
    unsigned __int8 v12 = 0;
  }
  else {
    unsigned __int8 v12 = v11;
  }
  if (v12)
  {
    __int16 v13 = 0;
  }
  else
  {
    uint64_t v14 = +[NSError errorWithDomain:@"BYODServerErrorDomain" code:500 userInfo:0];

    __int16 v13 = (void *)v14;
  }
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    (*(void (**)(uint64_t, id, void *))(v15 + 16))(v15, v10, v13);
  }
}

void sub_5F2FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5F38C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5F49C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5F538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5F5F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5F60C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "decline invite call response %@ error %@", (uint8_t *)&v15, 0x16u);
  }

  id v9 = v6;
  unsigned __int8 v10 = [v9 success];
  if (v7) {
    unsigned __int8 v11 = 0;
  }
  else {
    unsigned __int8 v11 = v10;
  }
  if (v11)
  {
    unsigned __int8 v12 = 0;
  }
  else
  {
    uint64_t v13 = +[NSError errorWithDomain:@"BYODServerErrorDomain" code:500 userInfo:0];

    unsigned __int8 v12 = (void *)v13;
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    (*(void (**)(uint64_t, id, void *))(v14 + 16))(v14, v9, v12);
  }
}

void sub_5F75C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5F7E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5F8C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5F960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5FA1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5FA34(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Update intro flag call response %@ error %@", (uint8_t *)&v15, 0x16u);
  }

  id v9 = v6;
  unsigned __int8 v10 = [v9 success];
  if (v7) {
    unsigned __int8 v11 = 0;
  }
  else {
    unsigned __int8 v11 = v10;
  }
  if (v11)
  {
    unsigned __int8 v12 = 0;
  }
  else
  {
    uint64_t v13 = +[NSError errorWithDomain:@"BYODServerErrorDomain" code:500 userInfo:0];

    unsigned __int8 v12 = (void *)v13;
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    (*(void (**)(uint64_t, id, void *))(v14 + 16))(v14, v9, v12);
  }
}

void sub_5FB84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5FCD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5FD74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5FE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_5FE48(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend(v7, "ef_publicDescription");
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2114;
    int v15 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "add domain member response %@ error %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id v10 = v6;
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v10, v7);
  }
}

void sub_5FF68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6002C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_601CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_60270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6032C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_60344(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend(v7, "ef_publicDescription");
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2114;
    int v15 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "remove domain member response %@ error %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id v10 = v6;
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v10, v7);
  }
}

void sub_60464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_60598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_606F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_60790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6084C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_60864(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "search domain call response %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  id v9 = v6;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v9, v7);
  }
}

void sub_60968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_609EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_60AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_60B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_60C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_60C50(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Request purchase url response %@ error %@", (uint8_t *)&v11, 0x16u);
  }

  id v9 = v6;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v9, v7);
  }
}

void sub_60D54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_60DD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_60EF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_60F90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6104C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_61064(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "update intro flag call response %@ error %@", (uint8_t *)&v15, 0x16u);
  }

  id v9 = v6;
  unsigned __int8 v10 = [v9 success];
  if (v7) {
    unsigned __int8 v11 = 0;
  }
  else {
    unsigned __int8 v11 = v10;
  }
  if (v11)
  {
    id v12 = 0;
  }
  else
  {
    uint64_t v13 = +[NSError errorWithDomain:@"BYODServerErrorDomain" code:500 userInfo:0];

    id v12 = (void *)v13;
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    (*(void (**)(uint64_t, id, void *))(v14 + 16))(v14, v9, v12);
  }
}

void sub_611B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_612AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_61404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_614A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_61564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_6157C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend(v7, "ef_publicDescription");
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2114;
    int v15 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "add domain member response %@ error %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id v10 = v6;
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v10, v7);
  }
}

void sub_6169C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_61760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_618A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_61944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_61A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_61A18(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend(v7, "ef_publicDescription");
    int v12 = 138543362;
    id v13 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "leave member error %{public}@", (uint8_t *)&v12, 0xCu);
  }
  id v10 = v6;
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v10, v7);
  }
}

void sub_61B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_61BBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_61C88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_61D20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_61DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_61DF4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BYODRequest log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend(v7, "ef_publicDescription");
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2114;
    int v15 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "domain purchase eligibility response %@ error %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id v10 = v6;
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v10, v7);
  }
}

void sub_61F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6200C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_620EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_623A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_62594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6288C(_Unwind_Exception *a1)
{
  id v8 = v6;

  _Unwind_Resume(a1);
}

void sub_629A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_62AB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_62C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_62C80(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    uint64_t v11 = sub_62E04;
    int v12 = &unk_B8E88;
    id v13 = *(id *)(a1 + 32);
    id v6 = +[EFScheduler mainThreadScheduler];
    [v6 performBlock:&v9];

    if (v4)
    {
      +[BYODUtil showErrorForPresenter:WeakRetained withError:v4 callback:0];
    }
    else
    {
      id v7 = +[EFScheduler mainThreadScheduler];
      [v7 performBlock:&v8];
    }
  }
}

void sub_62DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  id v21 = v20;

  _Unwind_Resume(a1);
}

id sub_62E04(uint64_t a1)
{
  return [*(id *)(a1 + 32) hidesBusyIndicator];
}

id sub_62E0C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showDefaultEmailDoneScreen];
}

void sub_63118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_63220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_632BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6349C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_634E0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_63638;
  v14[3] = &unk_B97D8;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  id v15 = v9;
  uint64_t v16 = v10;
  id v11 = v8;
  id v17 = v11;
  id v19 = *(id *)(a1 + 40);
  id v12 = v7;
  id v18 = v12;
  id v13 = +[EFScheduler mainThreadScheduler];
  [v13 performBlock:v14];
}

void sub_635F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18)
{
  id v22 = v21;

  _Unwind_Resume(a1);
}

void *sub_63638(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    unsigned int v2 = 0;
  }
  else {
    unsigned int v2 = [*(id *)(a1 + 40) receivedValidResponse:*(void *)(a1 + 48) forRequest:*(void *)(*(void *)(a1 + 40) + 8)];
  }
  id result = *(void **)(a1 + 40);
  if (result[2]) {
    id result = [result _finishedLoading];
  }
  if (v2)
  {
    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
    return (void *)v4();
  }
  return result;
}

void sub_637D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_638D4(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  unsigned int v2 = (void *)qword_D74B0;
  qword_D74B0 = (uint64_t)v1;
}

void sub_63944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_63A34(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

void sub_63C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_63E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_63ED4(id *a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v7 = WeakRetained;
  if (a2)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_640D8;
    v10[3] = &unk_B9828;
    id v11 = WeakRetained;
    id v12 = a1[4];
    id v13 = a1[5];
    id v15 = a1[6];
    char v16 = 1;
    id v14 = v5;
    id v8 = +[EFScheduler mainThreadScheduler];
    [v8 performBlock:v10];
  }
  else
  {
    id v9 = +[BYODSpecifierProvider log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Account upgrade failed with error: %@.", buf, 0xCu);
    }

    (*((void (**)(void))a1[6] + 2))();
  }
}

void sub_64084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_640D8(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadDomainInfo:*(void *)(*(void *)(a1 + 32) + 16) notification:0 targetDomain:*(void *)(a1 + 40) domainState:*(void *)(a1 + 48)];
  unsigned int v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v2();
}

void sub_642BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_64300(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_64480;
    v9[3] = &unk_B9010;
    id v6 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = v6;
    id v7 = +[EFScheduler mainThreadScheduler];
    [v7 performBlock:v9];
  }
  else
  {
    id v8 = +[BYODSpecifierProvider log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Account upgrade failed with error: %@.", buf, 0xCu);
    }
  }
}

void sub_64448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_64480(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadDomainInfo:*(void *)(a1 + 40) notification:0];
}

void sub_64678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  _Unwind_Resume(a1);
}

void sub_646FC(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    if (a3)
    {
      id v7 = +[NSBundle bundleForClass:objc_opt_class()];
      id v8 = [v7 localizedStringForKey:@"BYOD_GENERIC_ERROR_MESSAGE" value:&stru_B9F70 table:@"AccountPreferences"];
      id v9 = +[UIAlertController alertControllerWithTitle:0 message:v8 preferredStyle:1];

      uint64_t v10 = +[NSBundle bundleForClass:objc_opt_class()];
      id v11 = [v10 localizedStringForKey:@"OK" value:&stru_B9F70 table:@"AccountPreferences"];
      id v12 = +[UIAlertAction actionWithTitle:v11 style:1 handler:0];

      [v9 addAction:v12];
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_64E10;
      v57[3] = &unk_B94A8;
      v58[0] = a1[4];
      v58[1] = WeakRetained;
      id v13 = v9;
      id v59 = v13;
      id v14 = +[EFScheduler mainThreadScheduler];
      [v14 performBlock:v57];
      id v15 = (id *)v58;

      char v16 = v59;
LABEL_12:

      goto LABEL_13;
    }
    id v17 = v5;
    id v18 = [v17 result];
    objc_storeStrong(WeakRetained + 3, v18);
    id v19 = +[NSNotificationCenter defaultCenter];
    [v19 removeObserver:WeakRetained name:@"BYOD_REFRESH_NOTIFICATION" object:0];

    id v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:WeakRetained selector:"_refreshByodState:" name:@"BYOD_REFRESH_NOTIFICATION" object:0];

    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_64E58;
    v50[3] = &unk_B98A0;
    id v12 = v18;
    id v51 = v12;
    id v52 = a1[5];
    id v53 = a1[6];
    id v54 = a1[7];
    id v55 = a1[4];
    v56 = WeakRetained;
    id v21 = objc_retainBlock(v50);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_65090;
    v46[3] = &unk_B94A8;
    id v13 = v17;
    id v47 = v13;
    id v48 = a1[5];
    v49 = WeakRetained;
    v33 = objc_retainBlock(v46);
    id v22 = [v13 result];
    unsigned int v23 = [v22 showWelcomeScreen];

    if (v23)
    {
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_651F0;
      v39[3] = &unk_B98F0;
      id v40 = a1[5];
      id v41 = v12;
      uint64_t v44 = v21;
      v45 = v33;
      id v42 = a1[4];
      v43 = WeakRetained;
      id v32 = v21;
      uint64_t v24 = +[EFScheduler mainThreadScheduler];
      [v24 performBlock:v39];
      signed int v25 = &v40;
      v26 = &v41;
      v27 = (id *)&v44;
      v28 = (id *)&v45;
    }
    else
    {
      id v29 = [v12 domains];
      id v30 = [v29 count];

      if (v30)
      {
        if ([a1[6] length]) {
          [WeakRetained _getCustomEmailDomain:a1[4] account:a1[5] callback:v21];
        }
        else {
          ((void (*)(void *, uint64_t, void))v21[2])(v21, 1, 0);
        }
        goto LABEL_11;
      }
      id v32 = v21;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_6546C;
      v34[3] = &unk_B9968;
      id v35 = v13;
      id v36 = a1[5];
      id v38 = v33;
      v37[0] = a1[4];
      v37[1] = WeakRetained;
      uint64_t v31 = objc_retainBlock(v34);
      [WeakRetained _getCustomEmailDomain:a1[4] account:a1[5] callback:v31];
      signed int v25 = &v35;
      v26 = &v36;
      v27 = (id *)&v38;
      v28 = (id *)v37;
    }
    id v21 = v32;
LABEL_11:
    id v15 = &v51;

    char v16 = v52;
    goto LABEL_12;
  }
LABEL_13:
}

void sub_64C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,void *a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,void *a42,void *a43,void *a44,void *a45)
{
  _Unwind_Resume(a1);
}

id sub_64E10(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "byod_stopSpinner");
  [*(id *)(a1 + 40) onByodSpinnerChange:0];
  unsigned int v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 showViewController:v3];
}

void sub_64E58(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [[BYODLandingScreenViewController alloc] initWithDomainListAndTargetDomain:*(void *)(a1 + 32) acAccount:*(void *)(a1 + 40) targetDomain:*(void *)(a1 + 48) domainState:*(void *)(a1 + 56)];
    [(BYODLandingScreenViewController *)v6 setSpecifier:*(void *)(a1 + 64)];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_65048;
    v12[3] = &unk_B94A8;
    id v7 = *(id *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 72);
    id v13 = v7;
    uint64_t v14 = v8;
    id v9 = v6;
    id v15 = v9;
    uint64_t v10 = +[EFScheduler mainThreadScheduler];
    [v10 performBlock:v12];
  }
  else
  {
    id v9 = +[BYODSpecifierProvider log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_msgSend(v5, "ef_publicDescription");
      *(_DWORD *)buf = 138543362;
      id v17 = v11;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Upsell flow failed with error: %{public}@.", buf, 0xCu);
    }
  }
}

void sub_64FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_65048(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "byod_stopSpinner");
  [*(id *)(a1 + 40) onByodSpinnerChange:0];
  unsigned int v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 showViewController:v3];
}

void sub_65090(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) result];
  unsigned int v2 = [v9 enablePurchaseDomain];

  uint64_t v3 = [BYODChooseBuyOrOwnedDomainViewController alloc];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(*(void *)(a1 + 48) + 24) maxDomainsAllowed];
  id v6 = [*(id *)(*(void *)(a1 + 48) + 24) domainPurchaseProviderName];
  uint64_t v10 = [(BYODChooseBuyOrOwnedDomainViewController *)v3 initWithACAccount:v4 maxDomainsAllowed:v5 domainPurchaseProviderName:v6];

  if ((_os_feature_enabled_impl() & v2 & 1) == 0)
  {
    id v7 = [(BYODBaseViewController *)[BYODChooseYouOrFamilyViewController alloc] initWithACAccount:*(void *)(a1 + 40)];

    uint64_t v10 = (BYODChooseBuyOrOwnedDomainViewController *)v7;
  }
  id v8 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v10];
  [v8 setModalPresentationStyle:1];
  [*(id *)(a1 + 48) showViewController:v8];
}

void sub_651BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_651F0(uint64_t a1)
{
  unsigned int v2 = [BYODFirstTimeIntroViewController alloc];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_65348;
  v6[3] = &unk_B98C8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  uint64_t v4 = [(BYODFirstTimeIntroViewController *)v2 initWithACAccount:v3 completion:v6];
  id v5 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v4];
  [v5 setModalPresentationStyle:1];
  objc_msgSend(*(id *)(a1 + 48), "byod_stopSpinner");
  [*(id *)(a1 + 56) onByodSpinnerChange:0];
  [*(id *)(a1 + 56) showViewController:v5];
}

void sub_6530C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_65348(uint64_t a1, int a2)
{
  uint64_t v4 = +[BYODSpecifierProvider log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Intro Acknowledged:%{BOOL}d.", (uint8_t *)v7, 8u);
  }

  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) domains];
    BOOL v6 = [v5 count] == 0;

    if (v6) {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void sub_65454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6546C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!a2)
  {
    id v12 = +[BYODSpecifierProvider log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = objc_msgSend(v5, "ef_publicDescription");
      *(_DWORD *)buf = 138543362;
      id v20 = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Upsell flow failed with error: %{public}@.", buf, 0xCu);
    }
    goto LABEL_8;
  }
  BOOL v6 = [*(id *)(a1 + 32) result];
  unsigned int v7 = [v6 enablePurchaseDomain];

  id v8 = [*(id *)(a1 + 32) result];
  if (![v8 showWelcomeScreen] || !_os_feature_enabled_impl())
  {

    goto LABEL_10;
  }

  if (!v7)
  {
LABEL_10:
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_11;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_656C0;
  v14[3] = &unk_B9940;
  id v15 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  id v16 = v9;
  uint64_t v17 = v10;
  id v11 = +[EFScheduler mainThreadScheduler];
  [v11 performBlock:v14];

  id v12 = v15;
LABEL_8:

LABEL_11:
}

void sub_65658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_656C0(uint64_t a1)
{
  unsigned int v2 = [BYODFirstTimeIntroViewController alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_657E4;
  v6[3] = &unk_B9918;
  id v7 = *(id *)(a1 + 56);
  uint64_t v4 = [(BYODFirstTimeIntroViewController *)v2 initWithACAccount:v3 completion:v6];
  id v5 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v4];
  [v5 setModalPresentationStyle:1];
  objc_msgSend(*(id *)(a1 + 40), "byod_stopSpinner");
  [*(id *)(a1 + 48) onByodSpinnerChange:0];
  [*(id *)(a1 + 48) showViewController:v5];
}

void sub_657B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_657E4(uint64_t a1, int a2)
{
  uint64_t v4 = +[BYODSpecifierProvider log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Intro Acknowledged:%{BOOL}d.", (uint8_t *)v6, 8u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_659E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_65B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_65B48(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_65C64;
  v11[3] = &unk_B99B8;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(void **)(a1 + 48);
  id v12 = v6;
  uint64_t v13 = v7;
  id v15 = v8;
  char v16 = a2;
  id v9 = v5;
  id v14 = v9;
  uint64_t v10 = +[EFScheduler mainThreadScheduler];
  [v10 performBlock:v11];
}

void sub_65C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17)
{
  id v19 = v18;

  _Unwind_Resume(a1);
}

uint64_t sub_65C64(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "byod_stopSpinner");
  [*(id *)(a1 + 40) onByodSpinnerChange:0];
  unsigned int v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

void sub_65E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_65EA4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = +[BYODSpecifierProvider log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Account upgrade to HSA completed successfuly", v7, 2u);
    }
  }
  else
  {
    id v6 = +[BYODSpecifierProvider log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_7B774((uint64_t)v5, v6);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_65F88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_660D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_661E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_66304(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_663CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)BYODSpecifierProvider;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_66564(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  unsigned int v2 = (void *)qword_D74C0;
  qword_D74C0 = (uint64_t)v1;
}

void sub_665D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_666B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6695C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_66B88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_66CB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_66D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_66E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_66F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_67210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_67364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_674D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_67714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6789C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_67A1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_67B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_67E5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_67EFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 208);
  if (!v4)
  {
    id v5 = [[BYODSpinner alloc] initWithViewController:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 208);
    *(void *)(v6 + 208) = v5;

    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 208);
  }
  [v4 startSpinner];
  id v8 = [BYODDeleteDomainRequest alloc];
  id v9 = *(void **)(*(void *)(a1 + 32) + 192);
  uint64_t v10 = [v9 accountStore];
  id v11 = [*(id *)(*(void *)(a1 + 32) + 200) name];
  id v12 = [(BYODDeleteDomainRequest *)v8 initWithAccount:v9 accountStore:v10 domain:v11];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_680C0;
  v13[3] = &unk_B9178;
  objc_copyWeak(&v14, &location);
  [(BYODDeleteDomainRequest *)v12 performRequestWithCallback:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void sub_68078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_680C0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_6825C;
    v11[3] = &unk_B8E88;
    void v11[4] = WeakRetained;
    uint64_t v7 = +[EFScheduler mainThreadScheduler];
    [v7 performBlock:v11];

    if (v4)
    {
      +[BYODUtil showErrorForPresenter:v6 withError:v4 callback:0];
    }
    else
    {
      id v8 = +[NSNotificationCenter defaultCenter];
      [v8 postNotificationName:@"STOP_DOMAIN_NOTIFICATION" object:0 userInfo:0];

      id v9 = +[EFScheduler mainThreadScheduler];
      [v9 performBlock:&v10];
    }
  }
}

void sub_68228(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

id sub_6825C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) stopSpinner];
}

id sub_68270(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_682EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_68458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6856C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_68904(_Unwind_Exception *a1)
{
  uint64_t v7 = v3;

  _Unwind_Resume(a1);
}

void sub_68EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_69104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_692CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_69504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_695C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_698B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_69994(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 25))
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_69B54;
    v13[3] = &unk_B8E88;
    void v13[4] = WeakRetained;
    id v9 = +[EFScheduler mainThreadScheduler];
    [v9 performBlock:v13];
  }
  if ([v5 success])
  {
    uint64_t v10 = [v5 result];
    [v8 _postNotificationForDomainData:v10];

    id v11 = +[EFScheduler mainThreadScheduler];
    [v11 performBlock:&v12];
  }
  else
  {
    +[BYODUtil showErrorForPresenter:v8 withError:v6 callback:0];
  }
}

void sub_69B1C(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

id sub_69B54(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 200) stopSpinner];
}

id sub_69B68(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_69DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_69E60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 25))
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_6A020;
    v13[3] = &unk_B8E88;
    void v13[4] = WeakRetained;
    id v9 = +[EFScheduler mainThreadScheduler];
    [v9 performBlock:v13];
  }
  if ([v5 success])
  {
    uint64_t v10 = [v5 result];
    [v8 _postNotificationForDomainData:v10];

    id v11 = +[EFScheduler mainThreadScheduler];
    [v11 performBlock:&v12];
  }
  else
  {
    +[BYODUtil showErrorForPresenter:v8 withError:v6 callback:0];
  }
}

void sub_69FE8(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

id sub_6A020(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 200) stopSpinner];
}

id sub_6A034(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_6A1EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6A2DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_6A44C(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  unsigned int v2 = (void *)qword_D74D0;
  qword_D74D0 = (uint64_t)v1;
}

void sub_6A4BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6A7A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6A8E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6AA50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6AB5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6B08C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_6B158(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_6B170(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void sub_6B2C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6B448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6B57C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6B698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_6BA78(_Unwind_Exception *a1)
{
  uint64_t v7 = v4;

  _Unwind_Resume(a1);
}

void sub_6BC40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6C064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6C280(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_6C340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6C484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6C4B8(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "row"));
  unint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v2 >= (unint64_t)[*(id *)(a1 + 40) row]) {
    --*(void *)(*(void *)(a1 + 32) + 16);
  }
  id v3 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 40);
  id v4 = +[NSArray arrayWithObjects:&v5 count:1];
  [v3 deleteRowsAtIndexPaths:v4 withRowAnimation:100];
}

void sub_6C598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_6C5B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

void sub_6C610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6C6C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6C7CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6C9E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_6CA00(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) viewController];
  [v3 presentViewController:v4 animated:1 completion:0];
}

void sub_6CA68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6CA88(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v9)
    {
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(WeakRetained, "setGrantedDataclasses:", objc_msgSend(v9, "performSelector:", "grantedDataclasses"));
      }
      id v4 = [v9 username];
      uint64_t v5 = [v9 displayName];
      id v6 = [v9 token];
      uint64_t v7 = [v9 refreshToken];
      id v8 = [WeakRetained completion];
      [WeakRetained validateUniquenessAndAddAccountWithUsername:v4 fullUserName:v5 token:v6 refreshToken:v7 completion:v8];
    }
    else
    {
      id v4 = [WeakRetained completion];
      v4[2](v4, 0, 0, 0);
    }
  }
}

void sub_6CBD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6CD14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6CDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)GoogleAccountSyncController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_6CE88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6CF14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6CF90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6D014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_6D098(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_6D184(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_6D28C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6D630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_6D874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6DA20(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);

  objc_destroyWeak((id *)(v4 - 40));
  _Unwind_Resume(a1);
}

id sub_6DA54(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) presentViewController:a2 animated:1 completion:0];
}

void sub_6DA68(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setReAuthenticating:0];
}

void sub_6DAB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6DC3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6DEB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6E094(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6E1BC(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_D74E0;
  qword_D74E0 = (uint64_t)v1;
}

void sub_6E22C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6E37C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);

  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_6E3B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[GoogleRemoteAccountCreationController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Presenting Google Auth controller", v6, 2u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) viewController];
  [v5 presentViewController:v3 animated:1 completion:0];
}

void sub_6E45C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6E47C(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v9)
    {
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(WeakRetained, "setGrantedDataclasses:", objc_msgSend(v9, "performSelector:", "grantedDataclasses"));
      }
      uint64_t v4 = [v9 username];
      uint64_t v5 = [v9 displayName];
      id v6 = [v9 token];
      uint64_t v7 = [v9 refreshToken];
      id v8 = [WeakRetained completion];
      [WeakRetained validateUniquenessAndAddAccountWithUsername:v4 fullUserName:v5 token:v6 refreshToken:v7 completion:v8];
    }
    else
    {
      uint64_t v4 = [WeakRetained completion];
      v4[2](v4, 0, 0, 0);
    }
  }
}

void sub_6E5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6E764(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_D74F0;
  qword_D74F0 = (uint64_t)v1;
}

void sub_6E7D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6E944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_6E970(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) viewController];
  [v3 presentViewController:v4 animated:1 completion:0];
}

void sub_6E9D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6E9F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!v3) {
      goto LABEL_7;
    }
    uint64_t v5 = [v3 accessToken];

    if (v5)
    {
      id v6 = [v3 username];
      uint64_t v7 = [v3 displayName];
      id v8 = [v3 accessToken];
      id v9 = [v3 refreshToken];
      uint64_t v10 = [WeakRetained completion];
      [WeakRetained validateUniquenessAndAddAccountWithUsername:v6 fullUserName:v7 token:v8 refreshToken:v9 completion:v10];

LABEL_8:
      goto LABEL_9;
    }
    id v11 = [v3 username];

    if (!v11)
    {
LABEL_7:
      id v6 = [WeakRetained completion];
      v6[2](v6, 0, 0, 0);
      goto LABEL_8;
    }
    uint64_t v15 = MFMailAccountUsername;
    uint64_t v12 = [v3 username];
    char v16 = v12;
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

    id v14 = [WeakRetained completion];
    ((void (**)(void, void, uint64_t, void *))v14)[2](v14, 0, 2, v13);
  }
LABEL_9:
}

void sub_6EBE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class sub_6ED44()
{
  if (qword_D7510 != -1) {
    dispatch_once(&qword_D7510, &stru_B9AE8);
  }
  Class result = objc_getClass("DAEASOAuthWebViewController");
  qword_D7500 = (uint64_t)result;
  off_D7120 = (uint64_t (*)())sub_6EDA8;
  return result;
}

id sub_6EDA8()
{
  return (id)qword_D7500;
}

void sub_6EDB4(id a1)
{
  qword_D7508 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/DAEASOAuthFramework.framework/DAEASOAuthFramework", 2);
  if (!qword_D7508) {
    NSLog(@"### Failed to Soft Linked: /System/Library/PrivateFrameworks/DAEASOAuthFramework.framework/DAEASOAuthFramework");
  }
}

void sub_6EE90(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_D7518;
  qword_D7518 = (uint64_t)v1;
}

void sub_6EF00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6F13C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6F2B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6F7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_6FC54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_6FD10(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_6FE00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6FF44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_70078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_701DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_70384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_705C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_70C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

id sub_70DCC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 name];
  id v4 = [v2 containsObject:v3];

  return v4;
}

void sub_70E14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_70EB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_70F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_71278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7151C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_716CC(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_D7528;
  qword_D7528 = (uint64_t)v1;
}

void sub_7173C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_7180C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_71B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v18);

  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v22 - 112));

  _Unwind_Resume(a1);
}

void sub_71C64(uint64_t a1)
{
  uint64_t v2 = +[AARemoteServer sharedServer];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_71D2C;
  v3[3] = &unk_B9B38;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  [v2 configurationWithCompletion:v3];

  objc_destroyWeak(&v4);
}

void sub_71D14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);

  _Unwind_Resume(a1);
}

void sub_71D2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = [v3 addEmailURL];
    if (v5)
    {
      if (!*((void *)WeakRetained + 1))
      {
        id v6 = objc_alloc_init((Class)UINavigationController);
        uint64_t v7 = (void *)*((void *)WeakRetained + 1);
        *((void *)WeakRetained + 1) = v6;

        if (+[UIDevice mf_isPad]) {
          uint64_t v8 = 2;
        }
        else {
          uint64_t v8 = 0;
        }
        [*((id *)WeakRetained + 1) setModalPresentationStyle:v8];
      }
      id v9 = (void *)*((void *)WeakRetained + 2);
      if (!v9)
      {
        id v10 = objc_alloc_init((Class)RUILoader);
        id v11 = (void *)*((void *)WeakRetained + 2);
        *((void *)WeakRetained + 2) = v10;

        id v9 = (void *)*((void *)WeakRetained + 2);
      }
      [v9 setDelegate:WeakRetained];
      id v12 = [objc_alloc((Class)AAAddEmailUIRequest) initWithURLString:v5 account:*((void *)WeakRetained + 5)];
      uint64_t v13 = (void *)*((void *)WeakRetained + 2);
      id v14 = [v12 urlRequest];
      [v13 loadXMLUIWithRequest:v14];
    }
    else
    {
      uint64_t v15 = +[ICloudMailCreator log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v16 = 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "add email url missing from bag", v16, 2u);
      }
    }
  }
}

void sub_71E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_71EE0(uint64_t a1)
{
  uint64_t v2 = +[ICloudMailCreator log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "user pressed cancel for mail creation", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)WeakRetained + 7);
    [v5 icloudMailCreationNeedsViewUpdate:v4 withAccount:v4[5]];
  }
}

void sub_71F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_71FA0(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (!WeakRetained)
  {
    id v6 = +[ICloudMailCreator log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "self released during account creation", v9, 2u);
    }
    goto LABEL_8;
  }
  id v4 = [WeakRetained[5] identifier];
  if (v4)
  {
    id v5 = objc_msgSend(v3[5], "aa_authToken");

    if (!v5)
    {
      uint64_t v7 = [v3[5] accountStore];
      id v8 = v3[5];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_72124;
      v10[3] = &unk_B9BB0;
      id v11 = *(id *)(a1 + 32);
      [v7 renewCredentialsForAccount:v8 completion:v10];

      id v6 = v11;
LABEL_8:

      goto LABEL_9;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_9:
}

void sub_720F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_72124(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_721E0;
  block[3] = &unk_B9B88;
  uint64_t v11 = a2;
  id v6 = *(id *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_721E0(void *a1)
{
  if (a1[6])
  {
    uint64_t v2 = +[ICloudMailCreator log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = a1[6];
      uint64_t v4 = a1[4];
      int v6 = 134218242;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "renew credentials for create account email failed. renewResult %ld error %@", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    id v5 = *(void (**)(void))(a1[5] + 16);
    v5();
  }
}

void sub_72500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_7256C(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v7 = +[ICloudMailCreator log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = [a1[4] URL];
    uint64_t v9 = objc_msgSend(v5, "ef_publicDescription");
    int v21 = 138412802;
    uint64_t v22 = v8;
    __int16 v23 = 2048;
    uint64_t v24 = a2;
    __int16 v25 = 2114;
    v26 = v9;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "renewing account token for request URL %@ with result %ld error %{public}@", (uint8_t *)&v21, 0x20u);
  }
  if (a2)
  {
    id v10 = +[ICloudMailCreator log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [a1[4] URL];
      int v21 = 138412290;
      uint64_t v22 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "token renew failed for icloud mail create url %@", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    id v12 = [a1[5] URL];
    id v10 = [v12 absoluteString];

    id v13 = [objc_alloc((Class)AAAddEmailUIRequest) initWithURLString:v10 account:*((void *)WeakRetained + 5)];
    id v14 = [v13 urlRequest];
    id v15 = [v14 mutableCopy];

    char v16 = [a1[5] HTTPMethod];
    [v15 setHTTPMethod:v16];

    uint64_t v17 = [a1[5] HTTPMethod];
    unsigned int v18 = [v17 isEqualToString:@"POST"];

    if (v18)
    {
      id v19 = [*((id *)WeakRetained + 3) lastObject];
      id v20 = [v19 postbackData];
      [v15 setHTTPBody:v20];
    }
    [*((id *)WeakRetained + 2) loadXMLUIWithRequest:v15];
  }
}

void sub_727E0(_Unwind_Exception *a1)
{
  __int16 v8 = v5;

  _Unwind_Resume(a1);
}

void sub_72904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_72C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_72C50(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void **)(v2 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_72D44;
  v5[3] = &unk_B9C50;
  v5[4] = v2;
  id v6 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "aa_updatePropertiesForAppleAccount:completion:", v6, v5);

  objc_destroyWeak(&v8);
}

void sub_72D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  objc_destroyWeak(v15);
  _Unwind_Resume(a1);
}

void sub_72D44(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void **)(v2 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_72E38;
  v5[3] = &unk_B9C50;
  v5[4] = v2;
  id v6 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 48);
  [v4 saveVerifiedAccount:v6 withCompletionHandler:v5];

  objc_destroyWeak(&v8);
}

void sub_72E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  objc_destroyWeak(v15);
  _Unwind_Resume(a1);
}

void sub_72E38(uint64_t a1)
{
  v9[0] = kACRenewCredentialsShouldAvoidUIKey;
  v9[1] = kACRenewCredentialsShouldForceKey;
  v10[0] = &__kCFBooleanTrue;
  v10[1] = &__kCFBooleanFalse;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_72FC8;
  v5[3] = &unk_B9C00;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  [v4 renewCredentialsForAccount:v3 options:v2 completion:v5];

  objc_destroyWeak(&v8);
}

void sub_72F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  objc_destroyWeak(v15);
  _Unwind_Resume(a1);
}

void sub_72FC8(id *a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_73084;
  block[3] = &unk_B9C28;
  objc_copyWeak(&v5, a1 + 6);
  id v3 = a1[4];
  id v4 = a1[5];
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v5);
}

void sub_73084(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  [a1[4] stopActivityIndicator];
  id v3 = a1[5];
  if (WeakRetained)
  {
    id v4 = [WeakRetained delegate];
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v5 = +[ICloudMailCreator log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138412290;
        id v8 = v3;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "calling delegate updateViewWithApplAccount %@", (uint8_t *)&v7, 0xCu);
      }

      [v4 icloudMailCreationNeedsViewUpdate:WeakRetained withAccount:v3];
    }
    else
    {
      id v6 = +[ICloudMailCreator log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "delegate doesn't respond to selector updateViewWithApplAccount", (uint8_t *)&v7, 2u);
      }
    }
    [WeakRetained[1] dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    id v4 = +[ICloudMailCreator log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "self missing in dismiss", (uint8_t *)&v7, 2u);
    }
  }
}

void sub_7324C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_733E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_73504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_7361C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_73844(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_73918(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_739F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_73B08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_73BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_73E48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_73F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_740A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_740CC(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = +[UIColor tableCellEligibleColor];
  id v4 = [v7 textProperties];
  [v4 setColor:v3];

  id v5 = [*(id *)(a1 + 32) _mailboxTextFont];
  id v6 = [v7 textProperties];
  [v6 setFont:v5];
}

void sub_7417C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_7423C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7432C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_74414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_74438(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setText:*(void *)(a1 + 32)];
  [v3 setImage:*(void *)(a1 + 40)];
}

void sub_74490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_7450C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_74678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_74704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_74778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v10 = v9;

  a9.super_class = (Class)MailboxGroupedPickerTableCell;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_74854(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(unsigned char *)(a1 + 32)) {
    +[UIColor tableCellEligibleColor];
  }
  else {
  id v3 = +[UIColor tableCellIneligibleColor];
  }
  id v4 = [v5 textProperties];
  [v4 setColor:v3];
}

void sub_748F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_749F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_74A0C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 textProperties];
  [v3 setColor:v2];
}

void sub_74A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_74BC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_74C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  id v10 = v9;

  a9.super_class = (Class)MailboxListViewControllerBase;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_74D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_74D68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_74DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_74E98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_74F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_74FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_75104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_75114(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 10) = [v3 isCancelled];
}

void sub_7516C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_75238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_753B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_75494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_75540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_755C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_75628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_757F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_758C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_75980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_75B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_75C40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_75C8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_75D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_75EF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_76020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_760F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_76300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_763EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_7654C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_76724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7680C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_768A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_769D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_76A78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_76B34(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  uint64_t v2 = (void *)qword_D7540;
  qword_D7540 = (uint64_t)v1;
}

void sub_76BA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_76CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

id sub_76CD0(uint64_t a1, char a2)
{
  if (a2) {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) launchUpgradeFlow:*(void *)(a1 + 40) withCompletion:*(void *)(a1 + 48)];
  }
}

void sub_76E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_76EB8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [v5 setDelegate:WeakRetained];
    id v8 = [*(id *)(a1 + 32) copy];
    [WeakRetained setCompletion:v8];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_77080;
    block[3] = &unk_B8E88;
    id v11 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    uint64_t v9 = +[MatterhornUpsellManager log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Failed to launch journey: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_77044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_77080(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginJourney];
}

void sub_7713C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7720C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_772EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_77310(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if ([v5 status]) {
      BOOL v7 = [v5 status] == (char *)&dword_0 + 1;
    }
    else {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  id v8 = +[MatterhornUpsellManager log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"unavailable";
    id v10 = *(void **)(a1 + 32);
    if (v7) {
      CFStringRef v9 = @"available";
    }
    *(_DWORD *)buf = 138412546;
    id v20 = v10;
    __int16 v21 = 2112;
    CFStringRef v22 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Feature %@ is %@", buf, 0x16u);
  }

  if (v6)
  {
    id v11 = +[MatterhornUpsellManager log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v20 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Error! %@", buf, 0xCu);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_7755C;
  block[3] = &unk_B9D70;
  id v13 = *(id *)(a1 + 40);
  BOOL v18 = v7;
  id v16 = v6;
  id v17 = v13;
  id v14 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_7752C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_7755C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

id _ConfigurePSSpecifier(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  id v28 = a1;
  id v27 = a11;
  id v26 = a12;
  id v25 = a13;
  BOOL v18 = +[PSSpecifier preferenceSpecifierNamed:a2 target:a3 set:a4 get:a5 detail:a8 cell:a9 edit:a10];
  [v18 setKeyboardType:a6 autoCaps:a7 autoCorrection:0];
  id v19 = [v27 objectForKey:@"titles"];
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

void sub_77780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16)
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

void sub_778E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_77A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_77AD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_77BA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_77C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_77E2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_77E54(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accountClass];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [v2 accountTypeIdentifier];
  LOBYTE(v3) = [v3 _isAccountUsernameUnique:v4 typeIdentifer:v5];

  if (v3)
  {
    v33 = [v2 displayedAccountTypeString];
    if ([*(id *)(a1 + 32) _hasAccountWithDescription:v33])
    {
      id v6 = *(id *)(a1 + 40);
    }
    else
    {
      id v6 = v33;
    }
    id v34 = v6;
    id v43 = v6;
    v42[0] = MFMailAccountDescription;
    v42[1] = MFMailAccountUsername;
    long long v44 = *(_OWORD *)(a1 + 40);
    v42[2] = MFOAuth2Token;
    v42[3] = MFOAuth2RefreshToken;
    uint64_t v45 = *(void *)(a1 + 56);
    CFStringRef v9 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:v42 count:4];
    id v31 = [v9 mutableCopy];

    id v10 = [*(id *)(a1 + 32) grantedDataclasses];
    BOOL v11 = v10 == 0;

    if (!v11)
    {
      id v12 = [*(id *)(a1 + 32) grantedDataclasses];
      [v31 setValue:v12 forKey:ACAccountPropertyGrantedDataclasses];
    }
    id v13 = objc_msgSend(v2, "accountWithProperties:", v31, v31);
    if ([*(id *)(a1 + 64) length]) {
      [v13 setFullUserName:*(void *)(a1 + 64)];
    }
    [v13 setUsesSSL:1];
    id v14 = [*(id *)(a1 + 32) supportedDataclasses];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v15 = [v13 persistentAccount];
    id v16 = [v15 accountType];
    id v17 = [v16 supportedDataclasses];

    id v18 = [v17 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v36;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          id v22 = [v14 containsObject:v21];
          id v23 = [v13 persistentAccount];
          [v23 setProvisioned:v22 forDataclass:v21];

          uint64_t v24 = [*(id *)(a1 + 32) grantedDataclasses];
          BOOL v25 = v24 == 0;

          if ((v25 | v22 ^ 1))
          {
            id v26 = (id)(v25 & v22);
          }
          else
          {
            id v27 = [*(id *)(a1 + 32) grantedDataclasses];
            id v26 = [v27 containsObject:v21];
          }
          id v28 = [v13 persistentAccount];
          [v28 setEnabled:v26 forDataclass:v21];
        }
        id v18 = [v17 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v18);
    }

    uint64_t v29 = *(void *)(a1 + 72);
    if (v13)
    {
      id v30 = [v13 persistentAccount];
      (*(void (**)(uint64_t, void *, uint64_t, void))(v29 + 16))(v29, v30, 1, 0);
    }
    else
    {
      (*(void (**)(uint64_t, void, void, void))(v29 + 16))(v29, 0, 0, 0);
    }

    id v8 = v34;
  }
  else
  {
    BOOL v7 = *(void **)(a1 + 32);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_78354;
    v39[3] = &unk_B8C58;
    id v40 = *(id *)(a1 + 72);
    [v7 _showDuplicateAccountAlertWithCompletion:v39];
    id v8 = v40;
  }
}

void sub_7826C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_78354(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_7850C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_786B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_787A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_787CC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v8 localizedStringForKey:@"ALREADY_EXISTING_REMOTE_ACCOUNT_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"ALREADY_EXISTING_ACCOUNT_DESC_WATCH" value:&stru_B9F70 table:@"AccountPreferences"];
  id v6 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "accountClass"), "displayedAccountTypeString");
  BOOL v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6);
  [v2 _displayAlertWithTitle:v3 message:v7 completion:*(void *)(a1 + 40)];
}

void sub_78910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_78A8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_78B48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_78BC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getMailPreferenceValueWithDefault(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = +[NSUserDefaults em_userDefaults];
  id v6 = [v5 valueForKey:v3];

  if (!v6) {
    id v6 = v4;
  }

  return v6;
}

void sub_78D98(_Unwind_Exception *a1)
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

void sub_78E24(_Unwind_Exception *a1)
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

void sub_78E98(_Unwind_Exception *a1)
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

void sub_78F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void setEmailPreferenceBoolValue(void *a1, uint64_t a2)
{
  id v4 = a1;
  id v3 = +[NSNumber numberWithBool:a2];
  setEmailPreferenceValue(v4, v3);
}

void sub_78FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
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

void sub_790B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getMailBoolPreferenceValue(void *a1)
{
  id v1 = getMailPreferenceValueWithDefault(a1, 0);
  id v2 = [v1 BOOLValue];

  return v2;
}

void sub_79118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL showToCCIndicators(int a1)
{
  unsigned int MailBoolPreferenceValue = dword_D7308;
  if (dword_D7308 < 0 || a1)
  {
    unsigned int MailBoolPreferenceValue = getMailBoolPreferenceValue(@"ShowToCCIndicators");
    dword_D7308 = MailBoolPreferenceValue;
  }
  return MailBoolPreferenceValue != 0;
}

BOOL conversationViewShowsNewestAtTop(int a1)
{
  unsigned int MailBoolPreferenceValue = dword_D730C;
  if (dword_D730C < 0 || a1)
  {
    unsigned int MailBoolPreferenceValue = getMailBoolPreferenceValue(@"ConversationViewShowsNewestAtTop");
    dword_D730C = MailBoolPreferenceValue;
  }
  return MailBoolPreferenceValue != 0;
}

BOOL conversationViewIncludesRelatedMessages(int a1)
{
  unsigned int v1 = dword_D7310;
  if (dword_D7310 < 0 || a1)
  {
    unsigned int v1 = getMailBoolPreferenceValue(@"ConversationViewExcludesRelatedMessages") ^ 1;
    dword_D7310 = v1;
  }
  return v1 != 0;
}

BOOL collapseReadConversationMessages(int a1)
{
  unsigned int MailBoolPreferenceValueWithDefault = dword_D7314;
  if (dword_D7314 < 0 || a1)
  {
    unsigned int MailBoolPreferenceValueWithDefault = getMailBoolPreferenceValueWithDefault(@"CollapseReadConversationMessages", 1);
    dword_D7314 = MailBoolPreferenceValueWithDefault;
  }
  return MailBoolPreferenceValueWithDefault != 0;
}

id includeAttachmentsWithReplies(int a1)
{
  id v2 = (void *)qword_D7550;
  if (qword_D7550) {
    BOOL v3 = a1 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3)
  {
    id v4 = getMailPreferenceValueWithDefault(@"IncludeAttachmentReplies", @"IncludeAttachmentRepliesWhenAdding");
    id v5 = [v4 copy];
    id v6 = (void *)qword_D7550;
    qword_D7550 = (uint64_t)v5;

    id v2 = (void *)qword_D7550;
  }

  return v2;
}

void sub_792DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL mutedThreadsMoveToArchive(int a1)
{
  int v1 = dword_D7318;
  if (dword_D7318 < 0 || a1)
  {
    id v2 = getMailPreferenceValueWithDefault(EMUserDefaultMutedThreadActionKey, EMUserDefaultMutedThreadActionMarkAsRead);
    dword_D7318 = [EMUserDefaultMutedThreadActionMoveToArchiveOrDelete isEqual:v2];

    int v1 = dword_D7318;
  }
  return v1 != 0;
}

void sub_79364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id rightSwipeSetting(int a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_D7560);
  id v2 = (id)qword_D7558;
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

    if ((void *)qword_D7558 != v5) {
      objc_storeStrong((id *)&qword_D7558, v5);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_D7560);

  return v5;
}

void sub_79430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id leftSwipeSetting(int a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_D7570);
  id v2 = (id)qword_D7568;
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

    if ((void *)qword_D7568 != v5) {
      objc_storeStrong((id *)&qword_D7568, v5);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_D7570);

  return v5;
}

void sub_794FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id preferencesBundle()
{
  v0 = (void *)qword_D7578;
  if (!qword_D7578)
  {
    int v1 = UISystemRootDirectory();
    id v2 = [v1 stringByAppendingPathComponent:@"System/Library/PreferenceBundles/MobileMailSettings"];
    BOOL v3 = [v2 stringByAppendingPathExtension:@"bundle"];
    uint64_t v4 = +[NSBundle bundleWithPath:v3];
    id v5 = (void *)qword_D7578;
    qword_D7578 = v4;

    v0 = (void *)qword_D7578;
  }

  return v0;
}

void sub_795BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double MailTableCellTextLeftForLevel(uint64_t a1)
{
  id v2 = [UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);

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

void sub_7966C(_Unwind_Exception *a1)
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

void sub_7980C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_79834(uint64_t a1, void *a2)
{
  id v4 = a2;
  double v3 = [*(id *)(a1 + 32) viewController];
  [v3 presentViewController:v4 animated:1 completion:0];
}

void sub_7989C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_798BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!v3) {
      goto LABEL_7;
    }
    id v5 = [v3 token];

    if (v5)
    {
      id v6 = [v3 username];
      BOOL v7 = [v3 displayName];
      id v8 = [v3 token];
      CFStringRef v9 = [v3 refreshToken];
      id v10 = [WeakRetained completion];
      [WeakRetained validateUniquenessAndAddAccountWithUsername:v6 fullUserName:v7 token:v8 refreshToken:v9 completion:v10];

LABEL_8:
      goto LABEL_9;
    }
    BOOL v11 = [v3 username];

    if (!v11)
    {
LABEL_7:
      id v6 = [WeakRetained completion];
      v6[2](v6, 0, 0, 0);
      goto LABEL_8;
    }
    uint64_t v15 = MFMailAccountUsername;
    id v12 = [v3 username];
    id v16 = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

    id v14 = [WeakRetained completion];
    ((void (**)(void, void, uint64_t, void *))v14)[2](v14, 0, 2, v13);
  }
LABEL_9:
}

void sub_79AA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_79BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_79C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)YahooAccountSyncController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_79D0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_79D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_79E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_79E98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_79F8C(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_7A094(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7A30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_7A514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7A6E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_7A718(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) presentViewController:a2 animated:1 completion:0];
}

void sub_7A72C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setReAuthenticating:0];
}

void sub_7A778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_7A8F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_7ABB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7AD90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7AEB8(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  double v2 = (void *)qword_D7580;
  qword_D7580 = (uint64_t)v1;
}

void sub_7AF28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_7B078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_7B0A4(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) viewController];
  [v3 presentViewController:v4 animated:1 completion:0];
}

void sub_7B10C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_7B12C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!v3) {
      goto LABEL_7;
    }
    id v5 = [v3 token];

    if (v5)
    {
      id v6 = [v3 username];
      BOOL v7 = [v3 displayName];
      id v8 = [v3 token];
      CFStringRef v9 = [v3 refreshToken];
      id v10 = [WeakRetained completion];
      [WeakRetained validateUniquenessAndAddAccountWithUsername:v6 fullUserName:v7 token:v8 refreshToken:v9 completion:v10];

LABEL_8:
      goto LABEL_9;
    }
    BOOL v11 = [v3 username];

    if (!v11)
    {
LABEL_7:
      id v6 = [WeakRetained completion];
      v6[2](v6, 0, 0, 0);
      goto LABEL_8;
    }
    uint64_t v15 = MFMailAccountUsername;
    id v12 = [v3 username];
    id v16 = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

    id v14 = [WeakRetained completion];
    ((void (**)(void, void, uint64_t, void *))v14)[2](v14, 0, 2, v13);
  }
LABEL_9:
}

void sub_7B314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7B440(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Error from copying signing or encryption identities: %{public}@", buf, 0xCu);
}

void sub_7B498(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "self account set in AccountPSDetailController", v1, 2u);
}

void sub_7B4DC()
{
}

void sub_7B508()
{
}

void sub_7B534()
{
}

void sub_7B560(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "timed out waiting for adding email", v1, 2u);
}

void sub_7B5A4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "selected contacts is not of kind email or phone", v1, 2u);
}

void sub_7B5E8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error while load DNS records %@", (uint8_t *)&v2, 0xCu);
}

void sub_7B660(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "error while deleting email from server %@", (uint8_t *)&v2, 0xCu);
}

void sub_7B6D8(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "domain connect url not present. domain info %@", buf, 0xCu);
}

void sub_7B730(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "unable to sign grandslam request", v1, 2u);
}

void sub_7B774(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to upgrade account to HSA with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_7B7EC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "BYODSpecifierProvider getting dealloc", v1, 2u);
}

uint64_t ACUIDescriptionFromEmailAddress()
{
  return _ACUIDescriptionFromEmailAddress();
}

uint64_t AccountConfigurationServiceCopyAccountsForEmailAddress()
{
  return _AccountConfigurationServiceCopyAccountsForEmailAddress();
}

uint64_t AccountConfigurationServiceCopyAccountsForEmailAddressUsingAccountInfo()
{
  return _AccountConfigurationServiceCopyAccountsForEmailAddressUsingAccountInfo();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return _CFLocaleCopyCurrent();
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return _CFLocaleGetIdentifier(locale);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t MFLogGeneral()
{
  return _MFLogGeneral();
}

uint64_t MFLookupLocalizedString()
{
  return _MFLookupLocalizedString();
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

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

uint64_t PSTextViewInsets()
{
  return _PSTextViewInsets();
}

uint64_t PreferencesTableViewFooterFont()
{
  return _PreferencesTableViewFooterFont();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return _SecIdentityCopyCertificate(identityRef, certificateRef);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return _SecTrustCreateWithCertificates(certificates, policies, trust);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

uint64_t UISystemRootDirectory()
{
  return _UISystemRootDirectory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_msgSend_HTTPMethod(void *a1, const char *a2, ...)
{
  return [a1 HTTPMethod];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__addDomainMemberSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _addDomainMemberSpecifier];
}

id objc_msgSend__addEmailForFamily(void *a1, const char *a2, ...)
{
  return [a1 _addEmailForFamily];
}

id objc_msgSend__addNewDomainSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _addNewDomainSpecifier];
}

id objc_msgSend__appearsToBeEmail(void *a1, const char *a2, ...)
{
  return [a1 _appearsToBeEmail];
}

id objc_msgSend__appearsToBePhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 _appearsToBePhoneNumber];
}

id objc_msgSend__avatarImageRenderer(void *a1, const char *a2, ...)
{
  return [a1 _avatarImageRenderer];
}

id objc_msgSend__beginObservingAccountStoreDidChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 _beginObservingAccountStoreDidChangeNotification];
}

id objc_msgSend__byodSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _byodSpecifier];
}

id objc_msgSend__bypassAccountValidation(void *a1, const char *a2, ...)
{
  return [a1 _bypassAccountValidation];
}

id objc_msgSend__cleanupLoader(void *a1, const char *a2, ...)
{
  return [a1 _cleanupLoader];
}

id objc_msgSend__clearResults(void *a1, const char *a2, ...)
{
  return [a1 _clearResults];
}

id objc_msgSend__createDeliveryAccountWithUIValues(void *a1, const char *a2, ...)
{
  return [a1 _createDeliveryAccountWithUIValues];
}

id objc_msgSend__createDoNotHaveAddress(void *a1, const char *a2, ...)
{
  return [a1 _createDoNotHaveAddress];
}

id objc_msgSend__createHaveExistingAddress(void *a1, const char *a2, ...)
{
  return [a1 _createHaveExistingAddress];
}

id objc_msgSend__createNameInputCell(void *a1, const char *a2, ...)
{
  return [a1 _createNameInputCell];
}

id objc_msgSend__createOnlyForYouView(void *a1, const char *a2, ...)
{
  return [a1 _createOnlyForYouView];
}

id objc_msgSend__createYouAndFamilyView(void *a1, const char *a2, ...)
{
  return [a1 _createYouAndFamilyView];
}

id objc_msgSend__customDomainSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _customDomainSpecifier];
}

id objc_msgSend__defaultKeyDescriptors(void *a1, const char *a2, ...)
{
  return [a1 _defaultKeyDescriptors];
}

id objc_msgSend__domainEmailDetailSpecifierTitle(void *a1, const char *a2, ...)
{
  return [a1 _domainEmailDetailSpecifierTitle];
}

id objc_msgSend__domainNameSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _domainNameSpecifier];
}

id objc_msgSend__domainReverify(void *a1, const char *a2, ...)
{
  return [a1 _domainReverify];
}

id objc_msgSend__domainSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _domainSpecifiers];
}

id objc_msgSend__editableFont(void *a1, const char *a2, ...)
{
  return [a1 _editableFont];
}

id objc_msgSend__emailCount(void *a1, const char *a2, ...)
{
  return [a1 _emailCount];
}

id objc_msgSend__existingEmailAddress(void *a1, const char *a2, ...)
{
  return [a1 _existingEmailAddress];
}

id objc_msgSend__fetchDomainDetails(void *a1, const char *a2, ...)
{
  return [a1 _fetchDomainDetails];
}

id objc_msgSend__fetchFamilyDetails(void *a1, const char *a2, ...)
{
  return [a1 _fetchFamilyDetails];
}

id objc_msgSend__fieldEditor(void *a1, const char *a2, ...)
{
  return [a1 _fieldEditor];
}

id objc_msgSend__finishSetupDomainSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _finishSetupDomainSpecifier];
}

id objc_msgSend__finishedLoading(void *a1, const char *a2, ...)
{
  return [a1 _finishedLoading];
}

id objc_msgSend__font(void *a1, const char *a2, ...)
{
  return [a1 _font];
}

id objc_msgSend__getCreateEmailSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _getCreateEmailSpecifier];
}

id objc_msgSend__getDomainName(void *a1, const char *a2, ...)
{
  return [a1 _getDomainName];
}

id objc_msgSend__getEmailAddressListSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _getEmailAddressListSpecifier];
}

id objc_msgSend__getEmailAddressSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _getEmailAddressSpecifier];
}

id objc_msgSend__getEmailFromSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _getEmailFromSpecifier];
}

id objc_msgSend__getEmailList(void *a1, const char *a2, ...)
{
  return [a1 _getEmailList];
}

id objc_msgSend__getInviteSomeoneElseSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _getInviteSomeoneElseSpecifier];
}

id objc_msgSend__getMailSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _getMailSpecifier];
}

id objc_msgSend__getMemberListSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _getMemberListSpecifier];
}

id objc_msgSend__getMemberPhoto(void *a1, const char *a2, ...)
{
  return [a1 _getMemberPhoto];
}

id objc_msgSend__getMemberPhotos(void *a1, const char *a2, ...)
{
  return [a1 _getMemberPhotos];
}

id objc_msgSend__getMemberSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _getMemberSpecifiers];
}

id objc_msgSend__getOwnerEmailLisSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _getOwnerEmailLisSpecifier];
}

id objc_msgSend__getOwnerEmailSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _getOwnerEmailSpecifier];
}

id objc_msgSend__getOwnerSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _getOwnerSpecifier];
}

id objc_msgSend__getRemoveSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _getRemoveSpecifier];
}

id objc_msgSend__hasCustomDomain(void *a1, const char *a2, ...)
{
  return [a1 _hasCustomDomain];
}

id objc_msgSend__hasEnoughInformationForEasySetup(void *a1, const char *a2, ...)
{
  return [a1 _hasEnoughInformationForEasySetup];
}

id objc_msgSend__hasICloudMailAccount(void *a1, const char *a2, ...)
{
  return [a1 _hasICloudMailAccount];
}

id objc_msgSend__hasIcloudMailConfigured(void *a1, const char *a2, ...)
{
  return [a1 _hasIcloudMailConfigured];
}

id objc_msgSend__hasMultipleEmailAddress(void *a1, const char *a2, ...)
{
  return [a1 _hasMultipleEmailAddress];
}

id objc_msgSend__iCloudMailSettingSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _iCloudMailSettingSpecifiers];
}

id objc_msgSend__incomingSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _incomingSpecifiers];
}

id objc_msgSend__leaveDomainSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _leaveDomainSpecifier];
}

id objc_msgSend__listDefaultEmail(void *a1, const char *a2, ...)
{
  return [a1 _listDefaultEmail];
}

id objc_msgSend__listDomain(void *a1, const char *a2, ...)
{
  return [a1 _listDomain];
}

id objc_msgSend__loadDomainDetails(void *a1, const char *a2, ...)
{
  return [a1 _loadDomainDetails];
}

id objc_msgSend__loadExtraMailboxes(void *a1, const char *a2, ...)
{
  return [a1 _loadExtraMailboxes];
}

id objc_msgSend__loadMailboxes(void *a1, const char *a2, ...)
{
  return [a1 _loadMailboxes];
}

id objc_msgSend__mailSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _mailSwitchSpecifier];
}

id objc_msgSend__mailboxTextFont(void *a1, const char *a2, ...)
{
  return [a1 _mailboxTextFont];
}

id objc_msgSend__manageEmailAddressSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _manageEmailAddressSpecifier];
}

id objc_msgSend__needsReAuthenciationSection(void *a1, const char *a2, ...)
{
  return [a1 _needsReAuthenciationSection];
}

id objc_msgSend__popToMailboxListViewController(void *a1, const char *a2, ...)
{
  return [a1 _popToMailboxListViewController];
}

id objc_msgSend__populatMemberEmailList(void *a1, const char *a2, ...)
{
  return [a1 _populatMemberEmailList];
}

id objc_msgSend__preLoadCancel(void *a1, const char *a2, ...)
{
  return [a1 _preLoadCancel];
}

id objc_msgSend__prepareInviteButton(void *a1, const char *a2, ...)
{
  return [a1 _prepareInviteButton];
}

id objc_msgSend__reAuthenticationSectionSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _reAuthenticationSectionSpecifiers];
}

id objc_msgSend__resendVerificationSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _resendVerificationSpecifier];
}

id objc_msgSend__resetDeliveryAccountsForViewingAccount(void *a1, const char *a2, ...)
{
  return [a1 _resetDeliveryAccountsForViewingAccount];
}

id objc_msgSend__saveAccounts(void *a1, const char *a2, ...)
{
  return [a1 _saveAccounts];
}

id objc_msgSend__shouldHideEnableAndDelete(void *a1, const char *a2, ...)
{
  return [a1 _shouldHideEnableAndDelete];
}

id objc_msgSend__showBackButton(void *a1, const char *a2, ...)
{
  return [a1 _showBackButton];
}

id objc_msgSend__showCreateEmailButton(void *a1, const char *a2, ...)
{
  return [a1 _showCreateEmailButton];
}

id objc_msgSend__showErrorAlert(void *a1, const char *a2, ...)
{
  return [a1 _showErrorAlert];
}

id objc_msgSend__showIntroScreen(void *a1, const char *a2, ...)
{
  return [a1 _showIntroScreen];
}

id objc_msgSend__showMatterhornSubsctiptionState(void *a1, const char *a2, ...)
{
  return [a1 _showMatterhornSubsctiptionState];
}

id objc_msgSend__stopObservingAccountStoreDidChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 _stopObservingAccountStoreDidChangeNotification];
}

id objc_msgSend__stopShowingEasySetup(void *a1, const char *a2, ...)
{
  return [a1 _stopShowingEasySetup];
}

id objc_msgSend__stopUsingDomainSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _stopUsingDomainSpecifier];
}

id objc_msgSend__subtitleFont(void *a1, const char *a2, ...)
{
  return [a1 _subtitleFont];
}

id objc_msgSend__titleFont(void *a1, const char *a2, ...)
{
  return [a1 _titleFont];
}

id objc_msgSend__tobleroneMailSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _tobleroneMailSwitchSpecifier];
}

id objc_msgSend__triggerManualDomainSetupFlow(void *a1, const char *a2, ...)
{
  return [a1 _triggerManualDomainSetupFlow];
}

id objc_msgSend__updateArchiveByDefaultSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _updateArchiveByDefaultSpecifiers];
}

id objc_msgSend__updateDoneButton(void *a1, const char *a2, ...)
{
  return [a1 _updateDoneButton];
}

id objc_msgSend__updateNextButtonState(void *a1, const char *a2, ...)
{
  return [a1 _updateNextButtonState];
}

id objc_msgSend__updateSelection(void *a1, const char *a2, ...)
{
  return [a1 _updateSelection];
}

id objc_msgSend__viewInstructionSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _viewInstructionSpecifier];
}

id objc_msgSend__viewSetupInstructionSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _viewSetupInstructionSpecifier];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accessToken(void *a1, const char *a2, ...)
{
  return [a1 accessToken];
}

id objc_msgSend_accessoryButton(void *a1, const char *a2, ...)
{
  return [a1 accessoryButton];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountClass(void *a1, const char *a2, ...)
{
  return [a1 accountClass];
}

id objc_msgSend_accountDescription(void *a1, const char *a2, ...)
{
  return [a1 accountDescription];
}

id objc_msgSend_accountIsValid(void *a1, const char *a2, ...)
{
  return [a1 accountIsValid];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return [a1 accountStore];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_accountTypeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountTypeIdentifier];
}

id objc_msgSend_accountValidator(void *a1, const char *a2, ...)
{
  return [a1 accountValidator];
}

id objc_msgSend_accountValidatorClass(void *a1, const char *a2, ...)
{
  return [a1 accountValidatorClass];
}

id objc_msgSend_accountValues(void *a1, const char *a2, ...)
{
  return [a1 accountValues];
}

id objc_msgSend_accountValuesAfterFailedValidation(void *a1, const char *a2, ...)
{
  return [a1 accountValuesAfterFailedValidation];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_addAccountFromCurrentSettings(void *a1, const char *a2, ...)
{
  return [a1 addAccountFromCurrentSettings];
}

id objc_msgSend_addAlternateEmailAccountFromCurrentSettings(void *a1, const char *a2, ...)
{
  return [a1 addAlternateEmailAccountFromCurrentSettings];
}

id objc_msgSend_addEmailURL(void *a1, const char *a2, ...)
{
  return [a1 addEmailURL];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_addressIsEditable(void *a1, const char *a2, ...)
{
  return [a1 addressIsEditable];
}

id objc_msgSend_advancedSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 advancedSpecifiers];
}

id objc_msgSend_advancedSpecifiersOptions(void *a1, const char *a2, ...)
{
  return [a1 advancedSpecifiersOptions];
}

id objc_msgSend_aliasesAreEditable(void *a1, const char *a2, ...)
{
  return [a1 aliasesAreEditable];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return [a1 appearance];
}

id objc_msgSend_appleAccount(void *a1, const char *a2, ...)
{
  return [a1 appleAccount];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return [a1 ascender];
}

id objc_msgSend_authSchemeTitles(void *a1, const char *a2, ...)
{
  return [a1 authSchemeTitles];
}

id objc_msgSend_authSchemeValues(void *a1, const char *a2, ...)
{
  return [a1 authSchemeValues];
}

id objc_msgSend_authSchemesForAccountClass(void *a1, const char *a2, ...)
{
  return [a1 authSchemesForAccountClass];
}

id objc_msgSend_avatarImageForMeContact(void *a1, const char *a2, ...)
{
  return [a1 avatarImageForMeContact];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_beginAccountCreation(void *a1, const char *a2, ...)
{
  return [a1 beginAccountCreation];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return [a1 beginUpdates];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bodyDictionary(void *a1, const char *a2, ...)
{
  return [a1 bodyDictionary];
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return [a1 boldButton];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_buttonAction(void *a1, const char *a2, ...)
{
  return [a1 buttonAction];
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return [a1 buttonTray];
}

id objc_msgSend_byodDelegate(void *a1, const char *a2, ...)
{
  return [a1 byodDelegate];
}

id objc_msgSend_byodError(void *a1, const char *a2, ...)
{
  return [a1 byodError];
}

id objc_msgSend_callback(void *a1, const char *a2, ...)
{
  return [a1 callback];
}

id objc_msgSend_callingSpecifier(void *a1, const char *a2, ...)
{
  return [a1 callingSpecifier];
}

id objc_msgSend_canBeFallbackAccount(void *a1, const char *a2, ...)
{
  return [a1 canBeFallbackAccount];
}

id objc_msgSend_canUseCarrierDeliveryFallback(void *a1, const char *a2, ...)
{
  return [a1 canUseCarrierDeliveryFallback];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelAccountValidation(void *a1, const char *a2, ...)
{
  return [a1 cancelAccountValidation];
}

id objc_msgSend_cancelValidation(void *a1, const char *a2, ...)
{
  return [a1 cancelValidation];
}

id objc_msgSend_carrierDeliveryAccount(void *a1, const char *a2, ...)
{
  return [a1 carrierDeliveryAccount];
}

id objc_msgSend_catchAllEnabled(void *a1, const char *a2, ...)
{
  return [a1 catchAllEnabled];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_chevronImageView(void *a1, const char *a2, ...)
{
  return [a1 chevronImageView];
}

id objc_msgSend_chooseContactViewController(void *a1, const char *a2, ...)
{
  return [a1 chooseContactViewController];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_configureNavigationItems(void *a1, const char *a2, ...)
{
  return [a1 configureNavigationItems];
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return [a1 contact];
}

id objc_msgSend_contentConfiguration(void *a1, const char *a2, ...)
{
  return [a1 contentConfiguration];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_control(void *a1, const char *a2, ...)
{
  return [a1 control];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_credential(void *a1, const char *a2, ...)
{
  return [a1 credential];
}

id objc_msgSend_credentialAccessibility(void *a1, const char *a2, ...)
{
  return [a1 credentialAccessibility];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 decimalDigitCharacterSet];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultConnectionSettings(void *a1, const char *a2, ...)
{
  return [a1 defaultConnectionSettings];
}

id objc_msgSend_defaultContentConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultContentConfiguration];
}

id objc_msgSend_defaultEmailAddress(void *a1, const char *a2, ...)
{
  return [a1 defaultEmailAddress];
}

id objc_msgSend_defaultPath(void *a1, const char *a2, ...)
{
  return [a1 defaultPath];
}

id objc_msgSend_defaultSendFromEmail(void *a1, const char *a2, ...)
{
  return [a1 defaultSendFromEmail];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultSessionConfiguration];
}

id objc_msgSend_defaultSettings(void *a1, const char *a2, ...)
{
  return [a1 defaultSettings];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deleteButtonSpecifier(void *a1, const char *a2, ...)
{
  return [a1 deleteButtonSpecifier];
}

id objc_msgSend_deleteInPlaceForAllMailboxes(void *a1, const char *a2, ...)
{
  return [a1 deleteInPlaceForAllMailboxes];
}

id objc_msgSend_deliveryAccount(void *a1, const char *a2, ...)
{
  return [a1 deliveryAccount];
}

id objc_msgSend_deliveryAccountAlternates(void *a1, const char *a2, ...)
{
  return [a1 deliveryAccountAlternates];
}

id objc_msgSend_deliveryAccounts(void *a1, const char *a2, ...)
{
  return [a1 deliveryAccounts];
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return [a1 descender];
}

id objc_msgSend_descriptionPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 descriptionPlaceholder];
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return [a1 descriptorForRequiredKeys];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_detailedSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 detailedSpecifiers];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return [a1 deviceClass];
}

id objc_msgSend_directionalLayoutMargins(void *a1, const char *a2, ...)
{
  return [a1 directionalLayoutMargins];
}

id objc_msgSend_disableEmailAliasListChanges(void *a1, const char *a2, ...)
{
  return [a1 disableEmailAliasListChanges];
}

id objc_msgSend_displayHostname(void *a1, const char *a2, ...)
{
  return [a1 displayHostname];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayNameUsingSpecialNames(void *a1, const char *a2, ...)
{
  return [a1 displayNameUsingSpecialNames];
}

id objc_msgSend_displaySaveAccountAnywaysAlertSheet(void *a1, const char *a2, ...)
{
  return [a1 displaySaveAccountAnywaysAlertSheet];
}

id objc_msgSend_displayUsername(void *a1, const char *a2, ...)
{
  return [a1 displayUsername];
}

id objc_msgSend_displayedAccountTypeString(void *a1, const char *a2, ...)
{
  return [a1 displayedAccountTypeString];
}

id objc_msgSend_dnsProviderName(void *a1, const char *a2, ...)
{
  return [a1 dnsProviderName];
}

id objc_msgSend_dnsRecordType(void *a1, const char *a2, ...)
{
  return [a1 dnsRecordType];
}

id objc_msgSend_dnsRecords(void *a1, const char *a2, ...)
{
  return [a1 dnsRecords];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainConnectServerUrl(void *a1, const char *a2, ...)
{
  return [a1 domainConnectServerUrl];
}

id objc_msgSend_domainName(void *a1, const char *a2, ...)
{
  return [a1 domainName];
}

id objc_msgSend_domainPurchaseProviderName(void *a1, const char *a2, ...)
{
  return [a1 domainPurchaseProviderName];
}

id objc_msgSend_domains(void *a1, const char *a2, ...)
{
  return [a1 domains];
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return [a1 dsid];
}

id objc_msgSend_easySetupNote(void *a1, const char *a2, ...)
{
  return [a1 easySetupNote];
}

id objc_msgSend_editButtonItem(void *a1, const char *a2, ...)
{
  return [a1 editButtonItem];
}

id objc_msgSend_editableSuffix(void *a1, const char *a2, ...)
{
  return [a1 editableSuffix];
}

id objc_msgSend_editableTextField(void *a1, const char *a2, ...)
{
  return [a1 editableTextField];
}

id objc_msgSend_email(void *a1, const char *a2, ...)
{
  return [a1 email];
}

id objc_msgSend_emailAddress(void *a1, const char *a2, ...)
{
  return [a1 emailAddress];
}

id objc_msgSend_emailAddressHostPart(void *a1, const char *a2, ...)
{
  return [a1 emailAddressHostPart];
}

id objc_msgSend_emailAddressStrings(void *a1, const char *a2, ...)
{
  return [a1 emailAddressStrings];
}

id objc_msgSend_emailAddressValue(void *a1, const char *a2, ...)
{
  return [a1 emailAddressValue];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return [a1 emailAddresses];
}

id objc_msgSend_emailAddressesAndAliases(void *a1, const char *a2, ...)
{
  return [a1 emailAddressesAndAliases];
}

id objc_msgSend_emailAddressesAndAliasesList(void *a1, const char *a2, ...)
{
  return [a1 emailAddressesAndAliasesList];
}

id objc_msgSend_emails(void *a1, const char *a2, ...)
{
  return [a1 emails];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_enablePurchaseDomain(void *a1, const char *a2, ...)
{
  return [a1 enablePurchaseDomain];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return [a1 endUpdates];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorCode(void *a1, const char *a2, ...)
{
  return [a1 errorCode];
}

id objc_msgSend_errorMessage(void *a1, const char *a2, ...)
{
  return [a1 errorMessage];
}

id objc_msgSend_errorTitle(void *a1, const char *a2, ...)
{
  return [a1 errorTitle];
}

id objc_msgSend_existingAccount(void *a1, const char *a2, ...)
{
  return [a1 existingAccount];
}

id objc_msgSend_existingAccountSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 existingAccountSpecifiers];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return [a1 familyName];
}

id objc_msgSend_featureId(void *a1, const char *a2, ...)
{
  return [a1 featureId];
}

id objc_msgSend_fieldContentsLastLength(void *a1, const char *a2, ...)
{
  return [a1 fieldContentsLastLength];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return [a1 fill];
}

id objc_msgSend_findFirstVisibleResponder(void *a1, const char *a2, ...)
{
  return [a1 findFirstVisibleResponder];
}

id objc_msgSend_finishSetupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 finishSetupSpecifier];
}

id objc_msgSend_firstEmailAddress(void *a1, const char *a2, ...)
{
  return [a1 firstEmailAddress];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return [a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstResponder(void *a1, const char *a2, ...)
{
  return [a1 firstResponder];
}

id objc_msgSend_firstSetupSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 firstSetupSpecifiers];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return [a1 fullName];
}

id objc_msgSend_getDomainOwnerMember(void *a1, const char *a2, ...)
{
  return [a1 getDomainOwnerMember];
}

id objc_msgSend_getOptionsSectionIndex(void *a1, const char *a2, ...)
{
  return [a1 getOptionsSectionIndex];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return [a1 givenName];
}

id objc_msgSend_grantedDataclasses(void *a1, const char *a2, ...)
{
  return [a1 grantedDataclasses];
}

id objc_msgSend_hasCustomDomain(void *a1, const char *a2, ...)
{
  return [a1 hasCustomDomain];
}

id objc_msgSend_hasEmails(void *a1, const char *a2, ...)
{
  return [a1 hasEmails];
}

id objc_msgSend_hasEnoughInformationForEasySetup(void *a1, const char *a2, ...)
{
  return [a1 hasEnoughInformationForEasySetup];
}

id objc_msgSend_hasMarkedText(void *a1, const char *a2, ...)
{
  return [a1 hasMarkedText];
}

id objc_msgSend_hasNoReferences(void *a1, const char *a2, ...)
{
  return [a1 hasNoReferences];
}

id objc_msgSend_hasUnverifiedEmail(void *a1, const char *a2, ...)
{
  return [a1 hasUnverifiedEmail];
}

id objc_msgSend_haveEnoughValues(void *a1, const char *a2, ...)
{
  return [a1 haveEnoughValues];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_helpTitle(void *a1, const char *a2, ...)
{
  return [a1 helpTitle];
}

id objc_msgSend_helpURL(void *a1, const char *a2, ...)
{
  return [a1 helpURL];
}

id objc_msgSend_hidesBusyIndicator(void *a1, const char *a2, ...)
{
  return [a1 hidesBusyIndicator];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_hostname(void *a1, const char *a2, ...)
{
  return [a1 hostname];
}

id objc_msgSend_humanReadableName(void *a1, const char *a2, ...)
{
  return [a1 humanReadableName];
}

id objc_msgSend_iCloudAppleAccount(void *a1, const char *a2, ...)
{
  return [a1 iCloudAppleAccount];
}

id objc_msgSend_iCloudPlusSubscriptionEndTimestamp(void *a1, const char *a2, ...)
{
  return [a1 iCloudPlusSubscriptionEndTimestamp];
}

id objc_msgSend_iCloudPlusSubscriptionExpired(void *a1, const char *a2, ...)
{
  return [a1 iCloudPlusSubscriptionExpired];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_indexPathForSelection(void *a1, const char *a2, ...)
{
  return [a1 indexPathForSelection];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_introScreenIndicator(void *a1, const char *a2, ...)
{
  return [a1 introScreenIndicator];
}

id objc_msgSend_invalidateEmailAliases(void *a1, const char *a2, ...)
{
  return [a1 invalidateEmailAliases];
}

id objc_msgSend_invitationHandle(void *a1, const char *a2, ...)
{
  return [a1 invitationHandle];
}

id objc_msgSend_invitationStatus(void *a1, const char *a2, ...)
{
  return [a1 invitationStatus];
}

id objc_msgSend_invitedEmail(void *a1, const char *a2, ...)
{
  return [a1 invitedEmail];
}

id objc_msgSend_invitedOnDate(void *a1, const char *a2, ...)
{
  return [a1 invitedOnDate];
}

id objc_msgSend_invitedPhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 invitedPhoneNumber];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isAuthenticated(void *a1, const char *a2, ...)
{
  return [a1 isAuthenticated];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return [a1 isAvailable];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isCellEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCellEnabled];
}

id objc_msgSend_isDNSVerfied(void *a1, const char *a2, ...)
{
  return [a1 isDNSVerfied];
}

id objc_msgSend_isDomainConnect(void *a1, const char *a2, ...)
{
  return [a1 isDomainConnect];
}

id objc_msgSend_isDomainInProgress(void *a1, const char *a2, ...)
{
  return [a1 isDomainInProgress];
}

id objc_msgSend_isDomainModeSet(void *a1, const char *a2, ...)
{
  return [a1 isDomainModeSet];
}

id objc_msgSend_isDomainPurchased(void *a1, const char *a2, ...)
{
  return [a1 isDomainPurchased];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return [a1 isEditing];
}

id objc_msgSend_isFamilyMember(void *a1, const char *a2, ...)
{
  return [a1 isFamilyMember];
}

id objc_msgSend_isFirstTimeSetup(void *a1, const char *a2, ...)
{
  return [a1 isFirstTimeSetup];
}

id objc_msgSend_isHighlighted(void *a1, const char *a2, ...)
{
  return [a1 isHighlighted];
}

id objc_msgSend_isKeywordSearch(void *a1, const char *a2, ...)
{
  return [a1 isKeywordSearch];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isManaged(void *a1, const char *a2, ...)
{
  return [a1 isManaged];
}

id objc_msgSend_isMultitaskingSupported(void *a1, const char *a2, ...)
{
  return [a1 isMultitaskingSupported];
}

id objc_msgSend_isNetworkUp(void *a1, const char *a2, ...)
{
  return [a1 isNetworkUp];
}

id objc_msgSend_isOwner(void *a1, const char *a2, ...)
{
  return [a1 isOwner];
}

id objc_msgSend_isPrimaryDeliveryAccountDisabled(void *a1, const char *a2, ...)
{
  return [a1 isPrimaryDeliveryAccountDisabled];
}

id objc_msgSend_isReappearing(void *a1, const char *a2, ...)
{
  return [a1 isReappearing];
}

id objc_msgSend_isSSLEditable(void *a1, const char *a2, ...)
{
  return [a1 isSSLEditable];
}

id objc_msgSend_isShared(void *a1, const char *a2, ...)
{
  return [a1 isShared];
}

id objc_msgSend_isTobleroneEnabled(void *a1, const char *a2, ...)
{
  return [a1 isTobleroneEnabled];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return [a1 kind];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_labelFontSize(void *a1, const char *a2, ...)
{
  return [a1 labelFontSize];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return [a1 lastName];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
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

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return [a1 level];
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return [a1 lightGrayColor];
}

id objc_msgSend_linkButton(void *a1, const char *a2, ...)
{
  return [a1 linkButton];
}

id objc_msgSend_linkSpecifier(void *a1, const char *a2, ...)
{
  return [a1 linkSpecifier];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return [a1 load];
}

id objc_msgSend_localAccount(void *a1, const char *a2, ...)
{
  return [a1 localAccount];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedRecoverySuggestion(void *a1, const char *a2, ...)
{
  return [a1 localizedRecoverySuggestion];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_loggedInUserAccount(void *a1, const char *a2, ...)
{
  return [a1 loggedInUserAccount];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mailAccount(void *a1, const char *a2, ...)
{
  return [a1 mailAccount];
}

id objc_msgSend_mailAccounts(void *a1, const char *a2, ...)
{
  return [a1 mailAccounts];
}

id objc_msgSend_mailDataClassSwitch(void *a1, const char *a2, ...)
{
  return [a1 mailDataClassSwitch];
}

id objc_msgSend_mailboxNameKey(void *a1, const char *a2, ...)
{
  return [a1 mailboxNameKey];
}

id objc_msgSend_mailboxSelectionTarget(void *a1, const char *a2, ...)
{
  return [a1 mailboxSelectionTarget];
}

id objc_msgSend_mailboxType(void *a1, const char *a2, ...)
{
  return [a1 mailboxType];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mainThreadScheduler(void *a1, const char *a2, ...)
{
  return [a1 mainThreadScheduler];
}

id objc_msgSend_managedAccountFooterText(void *a1, const char *a2, ...)
{
  return [a1 managedAccountFooterText];
}

id objc_msgSend_maxDomainsAllowed(void *a1, const char *a2, ...)
{
  return [a1 maxDomainsAllowed];
}

id objc_msgSend_maxEmailsPerUser(void *a1, const char *a2, ...)
{
  return [a1 maxEmailsPerUser];
}

id objc_msgSend_maxMembersPerDomain(void *a1, const char *a2, ...)
{
  return [a1 maxMembersPerDomain];
}

id objc_msgSend_memberIdentifier(void *a1, const char *a2, ...)
{
  return [a1 memberIdentifier];
}

id objc_msgSend_members(void *a1, const char *a2, ...)
{
  return [a1 members];
}

id objc_msgSend_messageDeletionPolicy(void *a1, const char *a2, ...)
{
  return [a1 messageDeletionPolicy];
}

id objc_msgSend_mustArchiveSentMessages(void *a1, const char *a2, ...)
{
  return [a1 mustArchiveSentMessages];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_mutableString(void *a1, const char *a2, ...)
{
  return [a1 mutableString];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_normalizedAddress(void *a1, const char *a2, ...)
{
  return [a1 normalizedAddress];
}

id objc_msgSend_normalizedDSID(void *a1, const char *a2, ...)
{
  return [a1 normalizedDSID];
}

id objc_msgSend_numberOfSections(void *a1, const char *a2, ...)
{
  return [a1 numberOfSections];
}

id objc_msgSend_oauthRefreshToken(void *a1, const char *a2, ...)
{
  return [a1 oauthRefreshToken];
}

id objc_msgSend_oauthToken(void *a1, const char *a2, ...)
{
  return [a1 oauthToken];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_originalAccountValues(void *a1, const char *a2, ...)
{
  return [a1 originalAccountValues];
}

id objc_msgSend_otherTopLevelSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 otherTopLevelSpecifiers];
}

id objc_msgSend_outgoingGroupSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 outgoingGroupSpecifiers];
}

id objc_msgSend_outgoingSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 outgoingSpecifiers];
}

id objc_msgSend_owner(void *a1, const char *a2, ...)
{
  return [a1 owner];
}

id objc_msgSend_parentAccount(void *a1, const char *a2, ...)
{
  return [a1 parentAccount];
}

id objc_msgSend_parentController(void *a1, const char *a2, ...)
{
  return [a1 parentController];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return [a1 password];
}

id objc_msgSend_pendingVerifyEmailCount(void *a1, const char *a2, ...)
{
  return [a1 pendingVerifyEmailCount];
}

id objc_msgSend_persistentAccount(void *a1, const char *a2, ...)
{
  return [a1 persistentAccount];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return [a1 phoneNumbers];
}

id objc_msgSend_portNumber(void *a1, const char *a2, ...)
{
  return [a1 portNumber];
}

id objc_msgSend_postbackData(void *a1, const char *a2, ...)
{
  return [a1 postbackData];
}

id objc_msgSend_preferredAuthScheme(void *a1, const char *a2, ...)
{
  return [a1 preferredAuthScheme];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_price(void *a1, const char *a2, ...)
{
  return [a1 price];
}

id objc_msgSend_primaryAuthKitAccount(void *a1, const char *a2, ...)
{
  return [a1 primaryAuthKitAccount];
}

id objc_msgSend_primaryCell(void *a1, const char *a2, ...)
{
  return [a1 primaryCell];
}

id objc_msgSend_primaryDeliveryAccountIsDynamic(void *a1, const char *a2, ...)
{
  return [a1 primaryDeliveryAccountIsDynamic];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_propertiesWhichRequireValidation(void *a1, const char *a2, ...)
{
  return [a1 propertiesWhichRequireValidation];
}

id objc_msgSend_property(void *a1, const char *a2, ...)
{
  return [a1 property];
}

id objc_msgSend_provisionedDataclasses(void *a1, const char *a2, ...)
{
  return [a1 provisionedDataclasses];
}

id objc_msgSend_purchaseAllowed(void *a1, const char *a2, ...)
{
  return [a1 purchaseAllowed];
}

id objc_msgSend_purchaseURL(void *a1, const char *a2, ...)
{
  return [a1 purchaseURL];
}

id objc_msgSend_pushUpdateForAliasData(void *a1, const char *a2, ...)
{
  return [a1 pushUpdateForAliasData];
}

id objc_msgSend_reAuthenticating(void *a1, const char *a2, ...)
{
  return [a1 reAuthenticating];
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return [a1 recipients];
}

id objc_msgSend_recoveryAttempter(void *a1, const char *a2, ...)
{
  return [a1 recoveryAttempter];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return [a1 refresh];
}

id objc_msgSend_refreshDisplay(void *a1, const char *a2, ...)
{
  return [a1 refreshDisplay];
}

id objc_msgSend_refreshToken(void *a1, const char *a2, ...)
{
  return [a1 refreshToken];
}

id objc_msgSend_reload(void *a1, const char *a2, ...)
{
  return [a1 reload];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_reloadDeliveryAccounts(void *a1, const char *a2, ...)
{
  return [a1 reloadDeliveryAccounts];
}

id objc_msgSend_reloadOutgoingAccounts(void *a1, const char *a2, ...)
{
  return [a1 reloadOutgoingAccounts];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeParentSpecifier(void *a1, const char *a2, ...)
{
  return [a1 removeParentSpecifier];
}

id objc_msgSend_removePersistentAccount(void *a1, const char *a2, ...)
{
  return [a1 removePersistentAccount];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_reverificationStatus(void *a1, const char *a2, ...)
{
  return [a1 reverificationStatus];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return [a1 rootController];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_saveAndDismiss(void *a1, const char *a2, ...)
{
  return [a1 saveAndDismiss];
}

id objc_msgSend_savePersistentAccount(void *a1, const char *a2, ...)
{
  return [a1 savePersistentAccount];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_searchedDomain(void *a1, const char *a2, ...)
{
  return [a1 searchedDomain];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_secondarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 secondarySystemBackgroundColor];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_sectionFooterHeight(void *a1, const char *a2, ...)
{
  return [a1 sectionFooterHeight];
}

id objc_msgSend_sectionHeaderHeight(void *a1, const char *a2, ...)
{
  return [a1 sectionHeaderHeight];
}

id objc_msgSend_selectButton(void *a1, const char *a2, ...)
{
  return [a1 selectButton];
}

id objc_msgSend_selectedMailbox(void *a1, const char *a2, ...)
{
  return [a1 selectedMailbox];
}

id objc_msgSend_selectionTarget(void *a1, const char *a2, ...)
{
  return [a1 selectionTarget];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setupIsAutomated(void *a1, const char *a2, ...)
{
  return [a1 setupIsAutomated];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedInvocationQueue(void *a1, const char *a2, ...)
{
  return [a1 sharedInvocationQueue];
}

id objc_msgSend_sharedServer(void *a1, const char *a2, ...)
{
  return [a1 sharedServer];
}

id objc_msgSend_shouldArchiveByDefault(void *a1, const char *a2, ...)
{
  return [a1 shouldArchiveByDefault];
}

id objc_msgSend_shouldDisplayNextButtonForChosenType(void *a1, const char *a2, ...)
{
  return [a1 shouldDisplayNextButtonForChosenType];
}

id objc_msgSend_shouldSelectResponderOnAppearance(void *a1, const char *a2, ...)
{
  return [a1 shouldSelectResponderOnAppearance];
}

id objc_msgSend_shouldShowCancel(void *a1, const char *a2, ...)
{
  return [a1 shouldShowCancel];
}

id objc_msgSend_showAlertForMailSetup(void *a1, const char *a2, ...)
{
  return [a1 showAlertForMailSetup];
}

id objc_msgSend_showDefaultEmailSelect(void *a1, const char *a2, ...)
{
  return [a1 showDefaultEmailSelect];
}

id objc_msgSend_showExistingAccountError(void *a1, const char *a2, ...)
{
  return [a1 showExistingAccountError];
}

id objc_msgSend_showRedBadge(void *a1, const char *a2, ...)
{
  return [a1 showRedBadge];
}

id objc_msgSend_showWelcomeScreen(void *a1, const char *a2, ...)
{
  return [a1 showWelcomeScreen];
}

id objc_msgSend_showsBusyIndicator(void *a1, const char *a2, ...)
{
  return [a1 showsBusyIndicator];
}

id objc_msgSend_simpleAddress(void *a1, const char *a2, ...)
{
  return [a1 simpleAddress];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_smallSystemFontSize(void *a1, const char *a2, ...)
{
  return [a1 smallSystemFontSize];
}

id objc_msgSend_sortedMailboxes(void *a1, const char *a2, ...)
{
  return [a1 sortedMailboxes];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_specifiersForExistingAccount(void *a1, const char *a2, ...)
{
  return [a1 specifiersForExistingAccount];
}

id objc_msgSend_specifiersForNewAccount(void *a1, const char *a2, ...)
{
  return [a1 specifiersForNewAccount];
}

id objc_msgSend_spinner(void *a1, const char *a2, ...)
{
  return [a1 spinner];
}

id objc_msgSend_stackView(void *a1, const char *a2, ...)
{
  return [a1 stackView];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startActivityIndicator(void *a1, const char *a2, ...)
{
  return [a1 startActivityIndicator];
}

id objc_msgSend_startAddingEmailAlias(void *a1, const char *a2, ...)
{
  return [a1 startAddingEmailAlias];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_startSpinner(void *a1, const char *a2, ...)
{
  return [a1 startSpinner];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stopActivityIndicator(void *a1, const char *a2, ...)
{
  return [a1 stopActivityIndicator];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_stopSpinner(void *a1, const char *a2, ...)
{
  return [a1 stopSpinner];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return [a1 success];
}

id objc_msgSend_suffixString(void *a1, const char *a2, ...)
{
  return [a1 suffixString];
}

id objc_msgSend_suggestedDomains(void *a1, const char *a2, ...)
{
  return [a1 suggestedDomains];
}

id objc_msgSend_supportedDataclasses(void *a1, const char *a2, ...)
{
  return [a1 supportedDataclasses];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemGray2Color(void *a1, const char *a2, ...)
{
  return [a1 systemGray2Color];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_systemMinimumFontSize(void *a1, const char *a2, ...)
{
  return [a1 systemMinimumFontSize];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_tableCellEligibleColor(void *a1, const char *a2, ...)
{
  return [a1 tableCellEligibleColor];
}

id objc_msgSend_tableCellIneligibleColor(void *a1, const char *a2, ...)
{
  return [a1 tableCellIneligibleColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_tableViewStyle(void *a1, const char *a2, ...)
{
  return [a1 tableViewStyle];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return [a1 textColor];
}

id objc_msgSend_textField(void *a1, const char *a2, ...)
{
  return [a1 textField];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return [a1 textProperties];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topSignal(void *a1, const char *a2, ...)
{
  return [a1 topSignal];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_transitionCoordinator(void *a1, const char *a2, ...)
{
  return [a1 transitionCoordinator];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_udid(void *a1, const char *a2, ...)
{
  return [a1 udid];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_updateDomainData(void *a1, const char *a2, ...)
{
  return [a1 updateDomainData];
}

id objc_msgSend_updateDoneButton(void *a1, const char *a2, ...)
{
  return [a1 updateDoneButton];
}

id objc_msgSend_updateEmailAliasesIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 updateEmailAliasesIfNeeded];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_upsellManager(void *a1, const char *a2, ...)
{
  return [a1 upsellManager];
}

id objc_msgSend_urlRequest(void *a1, const char *a2, ...)
{
  return [a1 urlRequest];
}

id objc_msgSend_urlString(void *a1, const char *a2, ...)
{
  return [a1 urlString];
}

id objc_msgSend_userAccount(void *a1, const char *a2, ...)
{
  return [a1 userAccount];
}

id objc_msgSend_userFullName(void *a1, const char *a2, ...)
{
  return [a1 userFullName];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInfoForAccountTopLevelSpecifier(void *a1, const char *a2, ...)
{
  return [a1 userInfoForAccountTopLevelSpecifier];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_usernameIsEmailAddress(void *a1, const char *a2, ...)
{
  return [a1 usernameIsEmailAddress];
}

id objc_msgSend_usesSSL(void *a1, const char *a2, ...)
{
  return [a1 usesSSL];
}

id objc_msgSend_validateAccount(void *a1, const char *a2, ...)
{
  return [a1 validateAccount];
}

id objc_msgSend_validateEasySetupAccounts(void *a1, const char *a2, ...)
{
  return [a1 validateEasySetupAccounts];
}

id objc_msgSend_validateForExistingAccount(void *a1, const char *a2, ...)
{
  return [a1 validateForExistingAccount];
}

id objc_msgSend_validateForNewAccount(void *a1, const char *a2, ...)
{
  return [a1 validateForNewAccount];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_valueLabel(void *a1, const char *a2, ...)
{
  return [a1 valueLabel];
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return [a1 values];
}

id objc_msgSend_verificationStatus(void *a1, const char *a2, ...)
{
  return [a1 verificationStatus];
}

id objc_msgSend_verifySuccess(void *a1, const char *a2, ...)
{
  return [a1 verifySuccess];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return [a1 viewController];
}

id objc_msgSend_viewInstructionSpecifier(void *a1, const char *a2, ...)
{
  return [a1 viewInstructionSpecifier];
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return [a1 visibleCells];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_withEmailAddress(void *a1, const char *a2, ...)
{
  return [a1 withEmailAddress];
}

id objc_msgSend_withFamily(void *a1, const char *a2, ...)
{
  return [a1 withFamily];
}