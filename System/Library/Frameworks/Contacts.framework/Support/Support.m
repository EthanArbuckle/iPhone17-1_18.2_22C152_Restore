void sub_100003DF8(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(void);
  void *v6;
  id v7;
  uint64_t vars8;

  v7 = a2;
  v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v5[2](v5);
}

void sub_100003F1C(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 regulatoryLogger];
  [v5 logContactsDataAccessEvent];

  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) dataMapper];
  (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v4);
}

void sub_100004044(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v4 = [*(id *)(a1 + 32) regulatoryLogger];
  [v4 logContactsDataAccessEvent];

  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 32) contactStore];
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  v7[2]();
}

void sub_100004348(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004364(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004374(uint64_t a1)
{
}

void sub_10000437C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) logger];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004420;
  v5[3] = &unk_1000246E8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 servicingContactsRequest:v5];
}

void sub_100004420(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_1000044C8;
  v9 = &unk_1000246C0;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  (*(void (**)(void))(v5 + 16))();
}

void sub_1000044C8(uint64_t a1)
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stop];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  objc_sync_exit(obj);
}

void sub_100004548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000468C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  id v5 = 0;
  id v3 = [v2 unifiedContactCountWithError:&v5];
  id v4 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100004828(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000048D0;
  v3[3] = &unk_100024760;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 performWorkWithDataMapper:v3];
}

void sub_1000048D0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  id v4 = [v2 contactCountForFetchRequest:v3 error:&v6];
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_100004958(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004A84(void *a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004B18;
  v3[3] = &unk_1000247D8;
  uint64_t v1 = a1[6];
  uint64_t v2 = (void *)a1[5];
  id v4 = (id)a1[4];
  uint64_t v6 = v1;
  id v5 = v2;
  [v4 performWorkWithDataMapper:v3];
}

void sub_100004B18(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  uint64_t v3 = *(void *)(a1 + 48);
  id v6 = 0;
  id v4 = [v2 sectionListOffsetsForSortOrder:v3 error:&v6];
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100004BA0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004D90(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004E38;
  v3[3] = &unk_100024760;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 performWorkWithDataMapper:v3];
}

void sub_100004E38(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  id v8 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004F20;
  v6[3] = &unk_100024828;
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  unsigned __int8 v4 = [v2 fetchContactsForFetchRequest:v3 error:&v8 batchHandler:v6];
  id v5 = v8;

  if ((v4 & 1) == 0) {
    (*(void (**)(void, void, void, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, 0, v5);
  }
}

uint64_t sub_100004F20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100004F34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100004F50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005144(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000051EC;
  v3[3] = &unk_100024878;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 performAsyncWorkWithDataMapper:v3];
}

void sub_1000051EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = [*(id *)(a1 + 32) dataMapper];
  uint64_t v9 = *(void *)(a1 + 40);
  id v15 = 0;
  uint64_t v10 = [v8 encodedContactsCursorForFetchRequest:v9 cursorCleanupBlock:v6 error:&v15];
  id v11 = v15;

  if (v10)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100005340;
    v12[3] = &unk_100024850;
    v12[4] = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 48);
    id v13 = v10;
    [v13 fetchNextBatchWithReply:v12];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100005340(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = (void *)a1[4];
  id v8 = a4;
  id v9 = a2;
  uint64_t v10 = [v7 regulatoryLogger];
  id v11 = [v9 identifierAccountingData];
  [v10 logContactsDataAccessEventWithAssetIdentifiers:v11];

  uint64_t v12 = a1[6];
  id v14 = [v9 data];
  id v13 = [v9 matchInfo];

  (*(void (**)(uint64_t, id, void *, void, uint64_t, id))(v12 + 16))(v12, v14, v13, a1[5], a3, v8);
}

uint64_t sub_100005430(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100005454(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000055A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [*(id *)(a1 + 32) dataMapper];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100005744;
  v16[3] = &unk_1000248A0;
  uint64_t v6 = *(void *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005754;
  v13[3] = &unk_1000248C8;
  id v14 = *(id *)(a1 + 48);
  id v7 = v4;
  id v15 = v7;
  id v8 = [v5 executeFetchRequest:v6 progressiveResults:v16 completion:v13];

  [*(id *)(a1 + 56) addCancelable:v8];
  id v9 = *(void **)(a1 + 56);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000579C;
  v11[3] = &unk_1000248F0;
  id v12 = v7;
  id v10 = v7;
  [v9 addCancelationBlock:v11];
}

id sub_100005744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) receiveProgressiveContacts:a2 matchInfos:a3];
}

uint64_t sub_100005754(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) completedWithError:a2];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

uint64_t sub_10000579C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005840(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  id v5 = 0;
  uint64_t v3 = [v2 identifierWithError:&v5];
  id v4 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000059B4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100005A44;
  v2[3] = &unk_100024738;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 performWorkWithDataMapper:v2];
}

void sub_100005A44(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  id v5 = 0;
  id v3 = [v2 meContactIdentifiers:&v5];
  id v4 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100005AC8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005BA0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) contactStore];
  id v9 = 0;
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) accessAuthorization];
  id v5 = [v4 authorizer];
  id v8 = 0;
  [v2 executeSaveRequest:v3 response:&v9 authorizationContext:v5 error:&v8];
  id v6 = v9;
  id v7 = v8;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100005D38(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  id v4 = [v2 containersMatchingPredicate:v3 error:&v6];
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100005E80(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  id v4 = [v2 serverSearchContainersMatchingPredicate:v3 error:&v6];
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100005FC8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  id v4 = [v2 policyForContainerWithIdentifier:v3 error:&v6];
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100006110(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  id v4 = [v2 accountsMatchingPredicate:v3 error:&v6];
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100006258(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  id v4 = [v2 groupsMatchingPredicate:v3 error:&v6];
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000063A0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  id v4 = [v2 subgroupsOfGroupWithIdentifier:v3 error:&v6];
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000064BC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  id v3 = [v2 defaultContainerIdentifier];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100006648(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000066E8;
  v3[3] = &unk_100024738;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 performWorkWithDataMapper:v3];
}

void sub_1000066E8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = 0;
  unsigned int v4 = [a2 setDefaultAccountIdentifier:v3 error:&v7];
  id v5 = v7;
  if (v4) {
    id v6 = &__kCFBooleanTrue;
  }
  else {
    id v6 = 0;
  }
  (*(void (**)(void, void *, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v6, v5);
}

uint64_t sub_100006764(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100006894(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) regulatoryLogger];
  [v2 logContactsDataAccessEvent];

  uint64_t v3 = [*(id *)(a1 + 32) contactStore];
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = 0;
  unsigned int v5 = [v3 setMeContact:v4 error:&v8];
  id v6 = v8;

  if (v5) {
    id v7 = &__kCFBooleanTrue;
  }
  else {
    id v7 = 0;
  }
  (*(void (**)(void, void *, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v7, v6);
}

uint64_t sub_100006938(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100006A8C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006B48;
  v3[3] = &unk_100024990;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 performWorkWithDataMapper:v3];
}

void sub_100006B48(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) contactStore];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v8 = 0;
  unsigned int v5 = [v2 setMeContact:v3 forContainer:v4 error:&v8];
  id v6 = v8;

  if (v5) {
    id v7 = &__kCFBooleanTrue;
  }
  else {
    id v7 = 0;
  }
  (*(void (**)(void, void *, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v7, v6);
}

uint64_t sub_100006BD4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100006D50(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006E20;
  v3[3] = &unk_1000249E0;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 performWorkWithDataMapper:v3];
}

void sub_100006E20(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) contactStore];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v9 = 0;
  unsigned int v6 = [v2 setBestMeIfNeededForGivenName:v3 familyName:v4 email:v5 error:&v9];
  id v7 = v9;

  if (v6) {
    id v8 = &__kCFBooleanTrue;
  }
  else {
    id v8 = 0;
  }
  (*(void (**)(void, void *, id))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v8, v7);
}

uint64_t sub_100006EB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100007004(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000070C0;
  v6[3] = &unk_100024A30;
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v9 = v3;
  void v6[4] = v4;
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  [v2 performWorkWithDataMapper:v6];
}

void sub_1000070C0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  id v4 = [*(id *)(a1 + 32) dataMapper];
  id v3 = [v4 contactWithUserActivityUserInfo:*(void *)(a1 + 40) keysToFetch:*(void *)(a1 + 48)];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

uint64_t sub_100007138(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 logger];
  [v5 internalError:v4];

  unsigned int v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

void sub_1000072C4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000736C;
  v6[3] = &unk_100024A80;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v8 = v3;
  void v6[4] = v4;
  id v7 = v5;
  [v2 performWorkWithDataMapper:v6];
}

void sub_10000736C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) dataMapper];
  id v3 = [v4 userActivityUserInfoForContact:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

uint64_t sub_1000073E4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 logger];
  [v5 internalError:v4];

  unsigned int v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

void sub_100007594(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007650;
  v3[3] = &unk_100024990;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 performWorkWithDataMapper:v3];
}

void sub_100007650(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v8 = 0;
  unsigned int v5 = [v2 registerChangeHistoryClientIdentifier:v3 forContainerIdentifier:v4 error:&v8];
  id v6 = v8;

  if (v5) {
    id v7 = &__kCFBooleanTrue;
  }
  else {
    id v7 = 0;
  }
  (*(void (**)(void, void *, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v7, v6);
}

uint64_t sub_1000076DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100007830(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000078EC;
  v3[3] = &unk_100024990;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 performWorkWithDataMapper:v3];
}

void sub_1000078EC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v8 = 0;
  unsigned int v5 = [v2 unregisterChangeHistoryClientIdentifier:v3 forContainerIdentifier:v4 error:&v8];
  id v6 = v8;

  if (v5) {
    id v7 = &__kCFBooleanTrue;
  }
  else {
    id v7 = 0;
  }
  (*(void (**)(void, void *, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v7, v6);
}

uint64_t sub_100007978(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100007A50(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  uint64_t v4 = [v2 changeHistoryWithFetchRequest:v3 error:&v6];
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100007BF0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007C98;
  v3[3] = &unk_100024760;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 performWorkWithDataMapper:v3];
}

void sub_100007C98(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = 0;
  unsigned int v4 = [v2 executeChangeHistoryClearRequest:v3 error:&v7];
  id v5 = v7;

  if (v4) {
    id v6 = &__kCFBooleanTrue;
  }
  else {
    id v6 = 0;
  }
  (*(void (**)(void, void *, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v6, v5);
}

uint64_t sub_100007D24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100007DD0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  uint64_t v3 = [v2 currentHistoryToken];
  unsigned int v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NSNull null];
  }
  id v6 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100007F04(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  id v6 = [v2 currentHistoryAnchor];

  uint64_t v3 = *(void *)(a1 + 40);
  unsigned int v4 = [v6 value];
  id v5 = [v6 error];
  (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v5);
}

void sub_10000820C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000829C;
  v2[3] = &unk_100024738;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 performWorkWithDataMapper:v2];
}

void sub_10000829C(uint64_t a1)
{
  uint64_t v2 = +[CNFavorites favoritesPath];
  id v3 = +[NSURL fileURLWithPath:v2 isDirectory:0];
  id v8 = 0;
  id v4 = [objc_alloc((Class)NSArray) initWithContentsOfURL:v3 error:&v8];
  id v5 = v8;
  if (v4)
  {
    ABDiagnosticsEnabled();
    [v4 count];
  }
  else
  {
    if (![*(id *)(a1 + 32) shouldNotReportFavoritesError:v5])
    {
      id v6 = *(void **)(a1 + 32);
      id v7 = +[NSString stringWithFormat:@"Error reading favorites file. Add a favorite as workaround. Please open a radar to PEP Contacts (New Bugs).\n\n%@", v5];
      [v6 reportFavoritesIssue:v7];

      goto LABEL_7;
    }
    ABDiagnosticsEnabled();
  }
  _ABLog2();
LABEL_7:
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v4);
}

uint64_t sub_100008410(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100008540(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000085E4;
  v5[3] = &unk_100024760;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  [v2 performWorkWithDataMapper:v5];
}

void sub_1000085E4(uint64_t a1)
{
  uint64_t v2 = +[CNFavorites favoritesPath];
  id v3 = *(void **)(a1 + 32);
  id v14 = 0;
  id v4 = [v3 writeToFile:v2 options:1073741825 error:&v14];
  id v5 = (__CFString *)v14;
  if (!v4)
  {
    if ([*(id *)(a1 + 40) shouldNotReportFavoritesError:v5])
    {
      ABDiagnosticsEnabled();
      CFStringRef v8 = @"no error returned";
      if (v5) {
        CFStringRef v8 = v5;
      }
      CFStringRef v13 = v8;
      goto LABEL_8;
    }
    id v9 = *(void **)(a1 + 40);
    +[NSString stringWithFormat:@"Error saving favorites file. Please open a radar to PEP Contacts (New Bugs).\n\n%@", v5];
    id v10 = LABEL_11:;
    [v9 reportFavoritesIssue:v10];

    goto LABEL_12;
  }
  id v6 = +[NSFileManager defaultManager];
  unsigned int v7 = [v6 fileExistsAtPath:v2];

  if (!v7)
  {
    id v9 = *(void **)(a1 + 40);
    +[NSString stringWithFormat:@"Error saving favorites file\x10. File does not exist after saving. Please open a radar to PEP Contacts (New Bugs).\n\nexpected file: %@", v2];
    goto LABEL_11;
  }
  ABDiagnosticsEnabled();
  CFStringRef v13 = v2;
LABEL_8:
  _ABLog2();
LABEL_12:
  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4, v13);
  (*(void (**)(uint64_t, void *, __CFString *))(v11 + 16))(v11, v12, v5);
}

void sub_100008788(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = +[NSNumber numberWithBool:0];
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v4, v3);
}

void sub_100008924(uint64_t a1)
{
  uint64_t v2 = +[IndexService sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000089D4;
  v4[3] = &unk_1000248F0;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 reindexSearchableItemsWithIdentifiers:v3 completionHandler:v4];
}

uint64_t sub_1000089D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000089E4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 logger];
  [v5 internalError:v4];

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

void sub_100008B40(uint64_t a1)
{
  uint64_t v2 = +[IndexService sharedInstance];
  id v5 = 0;
  uint64_t v3 = [v2 verifyIndexLoggingSummary:0 error:&v5];
  id v4 = v5;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100008BCC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 logger];
  [v4 internalError:v5];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_100009148(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 112);
  if (!v2)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2050000000;
    uint64_t v3 = (void *)qword_10002C9B8;
    uint64_t v13 = qword_10002C9B8;
    if (!qword_10002C9B8)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10000AC70;
      v9[3] = &unk_1000246C0;
      v9[4] = &v10;
      sub_10000AC70((uint64_t)v9);
      uint64_t v3 = (void *)v11[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v10, 8);
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(a1 + 32);
    unsigned int v7 = *(void **)(v6 + 112);
    *(void *)(v6 + 112) = v5;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 112);
  }

  return v2;
}

void sub_100009240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009358(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) backgroundColorAnalyzer];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000940C;
  v5[3] = &unk_100024AF8;
  id v6 = *(id *)(a1 + 56);
  [v2 getBackgroundColorOnImageData:v3 bitmapFormat:v4 reply:v5];
}

void sub_10000940C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2050000000;
  unsigned int v7 = (void *)qword_10002C9C8;
  uint64_t v14 = qword_10002C9C8;
  if (!qword_10002C9C8)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000AE38;
    v10[3] = &unk_1000246C0;
    v10[4] = &v11;
    sub_10000AE38((uint64_t)v10);
    unsigned int v7 = (void *)v12[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);
  id v9 = [v8 dictionariesForColors:v5];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000951C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000964C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000096F4;
  v3[3] = &unk_100024760;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 performWorkWithDataMapper:v3];
}

void sub_1000096F4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  id v3 = [v2 fetchLimitedAccessContactIdentifiersForBundle:*(void *)(a1 + 40)];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_10000976C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000098C0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000997C;
  v3[3] = &unk_100024990;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 performWorkWithDataMapper:v3];
}

uint64_t sub_10000997C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  [v2 addLimitedAccessForBundle:*(void *)(a1 + 40) contactIdentifier:*(void *)(a1 + 48)];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v3();
}

uint64_t sub_1000099DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009B30(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100009BEC;
  v3[3] = &unk_100024990;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 performWorkWithDataMapper:v3];
}

uint64_t sub_100009BEC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  [v2 addLimitedAccessForBundle:*(void *)(a1 + 40) contactIdentifiers:*(void *)(a1 + 48)];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v3();
}

uint64_t sub_100009C4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009D7C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100009E24;
  v3[3] = &unk_100024760;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 performWorkWithDataMapper:v3];
}

void sub_100009E24(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  id v3 = [v2 getLimitedAccessContactsCountForBundle:*(void *)(a1 + 40)];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_100009E9C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009FF0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000A0AC;
  v3[3] = &unk_100024990;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 performWorkWithDataMapper:v3];
}

uint64_t sub_10000A0AC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  [v2 removeLimitedAccessForBundle:*(void *)(a1 + 40) contactIdentifier:*(void *)(a1 + 48)];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v3();
}

uint64_t sub_10000A10C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000A260(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000A31C;
  v3[3] = &unk_100024990;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 performWorkWithDataMapper:v3];
}

uint64_t sub_10000A31C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  [v2 removeLimitedAccessForBundle:*(void *)(a1 + 40) contactIdentifiers:*(void *)(a1 + 48)];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v3();
}

uint64_t sub_10000A37C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000A454(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  id v3 = [v2 populateSyncTableForLimitedAccessAboveSequenceNumber:*(void *)(a1 + 40)];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_10000A58C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  [v2 purgeLimitedAccessRecordsForBundle:*(void *)(a1 + 40)];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

void sub_10000A6B4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  id v3 = [v2 getWatchLimitedAccessSyncDataStartingAtSequenceNumber:*(void *)(a1 + 40)];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_10000A7C8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  [v2 dropAllLimitedAccessRowsAndSyncNotify];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

void sub_10000A8C0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  id v7 = 0;
  id v3 = [v2 shouldAnalyzeDatabaseWithError:&v7];
  id v4 = v7;

  uint64_t v5 = *(void *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v4);
  }
  else
  {
    id v6 = +[NSNumber numberWithBool:v3];
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
  }
}

void sub_10000AA0C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataMapper];
  id v7 = 0;
  id v3 = [v2 analyzeDatabaseWithError:&v7];
  id v4 = v7;

  uint64_t v5 = *(void *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v4);
  }
  else
  {
    id v6 = +[NSNumber numberWithBool:v3];
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
  }
}

void sub_10000AC70(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CNUIImageRemoteBackgroundColorAnalyzer");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10002C9B8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100015CA4();
    sub_10000ACC8();
  }
}

void sub_10000ACC8()
{
  v1[0] = 0;
  if (!qword_10002C9C0)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_10000ADC4;
    v1[4] = &unk_100024B30;
    v1[5] = v1;
    long long v2 = off_100024B18;
    uint64_t v3 = 0;
    qword_10002C9C0 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_10002C9C0)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_10000ADC4()
{
  uint64_t result = _sl_dlopen();
  qword_10002C9C0 = result;
  return result;
}

CNContactStore *sub_10000AE38(uint64_t a1)
{
  sub_10000ACC8();
  uint64_t result = (CNContactStore *)objc_getClass("CNUIColorSerialization");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10002C9C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (CNEnvironment *)sub_100015CCC();
    return [(CNEnvironment *)v3 contactStore];
  }
  return result;
}

CNContactStore *__cdecl sub_10000AEA4(id a1)
{
  return (CNContactStore *)+[CNEnvironment makeDefaultContactStore];
}

uint64_t sub_10000AFE8(uint64_t a1)
{
  qword_10002C9D8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

id sub_10000B258(uint64_t a1)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2050000000;
  long long v2 = (void *)qword_10002C9E0;
  uint64_t v13 = qword_10002C9E0;
  if (!qword_10002C9E0)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10000BE70;
    id v15 = &unk_1000246C0;
    v16 = &v10;
    sub_10000BE70((uint64_t)buf);
    long long v2 = (void *)v11[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v10, 8);
  SEL v4 = +[CNContactsDaemonLogs settingsDefaultApps];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 supportsTelephonyCalls]);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "tuCallCapabilitiesClass = %@, supportsTelephonyCalls = %@", buf, 0x16u);
  }
  [v3 initializeCachedValues];
  id v6 = *(void **)(a1 + 32);
  id v7 = [v6 delegateQueue];
  [v3 addDelegate:v6 queue:v7];

  id v8 = +[CNContactsDaemonLogs settingsDefaultApps];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "event configureCallCapabilites", buf, 2u);
  }

  return [*(id *)(a1 + 32) coalesceChangeEvent];
}

void sub_10000B45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

id sub_10000B504(uint64_t a1)
{
  [*(id *)(a1 + 32) checkForAnyDefaultAppChanged];
  id v3 = [*(id *)(a1 + 32) coalescingInhibitor];
  [v3 stop];

  SEL v4 = *(void **)(a1 + 32);

  return [v4 setCoalescingInhibitor:0];
}

void sub_10000B860(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) coalescingInhibitor];

  if (!v2)
  {
    id v3 = +[CNInhibitor os_transactionInhibitorWithLabel:@"com.apple.contactsd.SettingsDefaultAppsService.PerformCheck"];
    [*(id *)(a1 + 32) setCoalescingInhibitor:v3];

    SEL v4 = [*(id *)(a1 + 32) coalescingInhibitor];
    [v4 start];
  }
  id v6 = [*(id *)(a1 + 32) coalescer];
  uint64_t v5 = +[NSNull null];
  [v6 observerDidReceiveResult:v5];
}

Class sub_10000BE70(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_10002C9E8)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_10000BFB4;
    void v4[4] = &unk_100024B30;
    v4[5] = v4;
    long long v5 = off_100024BB8;
    uint64_t v6 = 0;
    qword_10002C9E8 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!qword_10002C9E8)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("TUCallCapabilities");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)sub_100015D38();
LABEL_8:
    free(v2);
  }
  qword_10002C9E0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000BFB4()
{
  uint64_t result = _sl_dlopen();
  qword_10002C9E8 = result;
  return result;
}

void sub_10000C3C8(id a1)
{
  qword_10002C9F8 = (uint64_t)os_log_create("com.apple.contacts.contactsd", "analyze-database");

  _objc_release_x1();
}

uint64_t sub_10000C4AC(uint64_t a1)
{
  qword_10002CA08 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10000C834(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) coalescer];
  uint64_t v1 = +[NSNull null];
  [v2 observerDidReceiveResult:v1];
}

void sub_10000C998(uint64_t a1)
{
  id v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100015FA4(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  uint64_t v10 = *(void **)(a1 + 40);
  id v17 = 0;
  unsigned int v11 = [v10 shouldAnalyzeDatabaseWithError:&v17];
  id v12 = v17;
  uint64_t v13 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    sub_100015F14(v11, v13);
    if (v12)
    {
LABEL_5:
      uint64_t v14 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100015E9C((uint64_t)v12, v14);
      }
      goto LABEL_10;
    }
  }
  else if (v12)
  {
    goto LABEL_5;
  }
  if (v11)
  {
    id v15 = [*(id *)(a1 + 48) analyzer];
    v16 = +[NSNull null];
    [v15 observerDidReceiveResult:v16];
  }
LABEL_10:
}

void sub_10000CB88(uint64_t a1)
{
  id v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10001608C(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  uint64_t v10 = *(void **)(a1 + 40);
  id v22 = 0;
  unsigned __int8 v11 = [v10 analyzeDatabaseWithError:&v22];
  id v12 = v22;
  uint64_t v13 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    sub_100016054(v13, v14, v15, v16, v17, v18, v19, v20);
    if (v11) {
      goto LABEL_7;
    }
  }
  else if (v11)
  {
    goto LABEL_7;
  }
  v21 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_100015FDC((uint64_t)v12, v21);
  }
LABEL_7:
}

void sub_10000CD1C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t sub_10000CDD8(uint64_t a1)
{
  qword_10002CA18 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

uint64_t sub_10000CEA4(uint64_t a1)
{
  qword_10002CA28 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 32) _getDefaultBatchSize]);

  return _objc_release_x1();
}

id sub_10000D13C(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) fetchContactIdentifiersForContactsMissingBackgroundColors];
  if ([v3 count]) {
    [*(id *)(a1 + 32) batchUpdateBackgroundColorsForContactIdentifiers:v3];
  }

  uint64_t v4 = [*(id *)(a1 + 32) coalescingInhibitor];
  [v4 stop];

  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 setCoalescingInhibitor:0];
}

void sub_10000D314(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) coalescingInhibitor];

  if (!v2)
  {
    uint64_t v3 = +[CNInhibitor os_transactionInhibitorWithLabel:@"com.apple.contactsd.BackgroundColorService.PerformIndexing"];
    [*(id *)(a1 + 32) setCoalescingInhibitor:v3];

    uint64_t v4 = [*(id *)(a1 + 32) coalescingInhibitor];
    [v4 start];
  }
  id v6 = [*(id *)(a1 + 32) coalescer];
  uint64_t v5 = +[NSNull null];
  [v6 observerDidReceiveResult:v5];
}

void sub_10000D5DC(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 addObject:v3];
}

void sub_10000D964(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    uint64_t v7 = (void *)qword_10002CA30;
    uint64_t v23 = qword_10002CA30;
    if (!qword_10002CA30)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000E048;
      v19[3] = &unk_1000246C0;
      v19[4] = &v20;
      sub_10000E048((uint64_t)v19);
      uint64_t v7 = (void *)v21[3];
    }
    uint64_t v8 = v7;
    _Block_object_dispose(&v20, 8);
    id v9 = [v8 alloc];
    uint64_t v10 = [*(id *)(a1 + 32) imageBackgroundColorsData];
    unsigned __int8 v11 = [v9 initWithData:v10];

    [v11 setContactImage:v5];
    id v12 = [v11 data];
    [*(id *)(a1 + 32) setImageBackgroundColorsData:v12];
  }
  else
  {
    unsigned __int8 v11 = +[CNContactsDaemonLogs backgroundColors];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001619C((uint64_t)v6, v11, v13, v14, v15, v16, v17, v18);
    }
  }
}

void sub_10000DAE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_10000DF3C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 _updateBackgroundColorIfNeeded:v5 colorAnalyzer:v4];
  [*(id *)(a1 + 48) updateContact:v5];
}

void sub_10000E048(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CNUIBackgroundColors");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10002CA30 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100016208();
    sub_10000E0A0();
  }
}

void sub_10000E0A0()
{
  v1[0] = 0;
  if (!qword_10002CA38)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_10000E19C;
    v1[4] = &unk_100024B30;
    v1[5] = v1;
    long long v2 = off_100024CD8;
    uint64_t v3 = 0;
    qword_10002CA38 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_10002CA38)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_10000E19C()
{
  uint64_t result = _sl_dlopen();
  qword_10002CA38 = result;
  return result;
}

void sub_10000E210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  sub_10000E0A0();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CNUIImageRemoteBackgroundColorAnalyzer");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10002CA40 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v10 = (void *)sub_100015CA4();
    sub_10000E268(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void sub_10000E268(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_10000E484(uint64_t a1)
{
  return [*(id *)(a1 + 32) countDown];
}

void sub_10000E4E0(id a1)
{
  qword_10002CA50 = (uint64_t)os_log_create("com.apple.contacts.contactsd", "support-connections");

  _objc_release_x1();
}

ContactsSupportService *__cdecl sub_10000E5A0(id a1, CNScheduler *a2, NSXPCConnection *a3)
{
  uint64_t v4 = a3;
  id v5 = a2;
  id v6 = [[ContactsSupportService alloc] initWithWorkQueue:v5 connection:v4];

  return v6;
}

void sub_10000EB6C(id a1)
{
  qword_10002CA60 = (uint64_t)os_log_create("com.apple.contacts.contactsd", "xpc");

  _objc_release_x1();
}

void sub_10000EC04(id a1)
{
  qword_10002CA70 = (uint64_t)os_log_create("com.apple.contacts.contactsd", "backup");

  _objc_release_x1();
}

void sub_10000EC9C(id a1)
{
  qword_10002CA80 = (uint64_t)os_log_create("com.apple.contacts.contactsd", "purge-history");

  _objc_release_x1();
}

void sub_10000ED34(id a1)
{
  qword_10002CA90 = (uint64_t)os_log_create("com.apple.contacts.contactsd", "launch-services");

  _objc_release_x1();
}

void sub_10000EDCC(id a1)
{
  qword_10002CAA0 = (uint64_t)os_log_create("com.apple.contacts.contactsd", "persistence");

  _objc_release_x1();
}

void sub_10000EE64(id a1)
{
  qword_10002CAB0 = (uint64_t)os_log_create("com.apple.contacts.contactsd", "exchange");

  _objc_release_x1();
}

void sub_10000EEFC(id a1)
{
  qword_10002CAC0 = (uint64_t)os_log_create("com.apple.contacts.contactsd", "accounts");

  _objc_release_x1();
}

void sub_10000EF94(id a1)
{
  qword_10002CAD0 = (uint64_t)os_log_create("com.apple.contacts.contactsd.persistence", "removal");

  _objc_release_x1();
}

void sub_10000F02C(id a1)
{
  qword_10002CAE0 = (uint64_t)os_log_create("com.apple.contacts.provider", "synchronize-contact-providers-service");

  _objc_release_x1();
}

void sub_10000F0C4(id a1)
{
  qword_10002CAF0 = (uint64_t)os_log_create("com.apple.contacts.backgroundColors", "background-colors");

  _objc_release_x1();
}

void sub_10000F15C(id a1)
{
  qword_10002CB00 = (uint64_t)os_log_create("com.apple.contacts.contactsd", "settingsDefaultApps");

  _objc_release_x1();
}

void sub_10000F268(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = +[CNInhibitor os_transactionInhibitorWithLabel:*(void *)(a1 + 32)];
  [v4 start];
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  id v6 = +[CNContactsDaemonLogs xpc];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100016468(a1, state);
  }

  if (state == 2)
  {
    [*(id *)(a1 + 48) run];
  }
  else if (state)
  {
    uint64_t v12 = +[CNContactsDaemonLogs xpc];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000162F4(a1, state);
    }
  }
  else
  {
    xpc_object_t v7 = xpc_activity_copy_criteria(v3);
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = xpc_copy_description(v7);
      uint64_t v10 = +[NSString stringWithCString:v9 encoding:1];
      unsigned __int8 v11 = +[CNContactsDaemonLogs xpc];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_1000163B8(a1);
      }

      free(v9);
    }
  }
  [v4 stop];
}

void sub_10000F4AC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t sub_10000F56C(uint64_t a1)
{
  qword_10002CB10 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10000F774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F798(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v2 = [WeakRetained favorites];
  objc_msgSend(v2, "rematchEntriesWithOptions:", objc_msgSend(WeakRetained, "favoritesMatchingOptions"));

  [WeakRetained setFavoritesMatchingOptions:0];
  uint64_t v3 = [WeakRetained coalescingInhibitor];
  [v3 stop];

  [WeakRetained setCoalescingInhibitor:0];
}

void sub_10000F9B8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFavoritesMatchingOptions:", *(void *)(a1 + 40) | (unint64_t)objc_msgSend(*(id *)(a1 + 32), "favoritesMatchingOptions"));
  long long v2 = [*(id *)(a1 + 32) coalescingInhibitor];

  if (!v2)
  {
    uint64_t v3 = +[CNInhibitor os_transactionInhibitorWithLabel:@"com.apple.contactsd.FavoritesService.RematchEntries"];
    [*(id *)(a1 + 32) setCoalescingInhibitor:v3];

    uint64_t v4 = [*(id *)(a1 + 32) coalescingInhibitor];
    [v4 start];
  }
  id v5 = [*(id *)(a1 + 32) coalescingTimer];
  [v5 handleEvent];
}

void sub_10000FDA4(id a1, CNPair *a2)
{
  id v2 = [(CNPair *)a2 first];
  [v2 resume];
}

BOOL sub_10000FE54(id a1, _TtP9contactsd22CNRegisteredXPCService_ *a2)
{
  return [(CNRegisteredXPCService *)a2 beginListening];
}

void sub_10000FF34(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v3 = +[NSString stringWithCString:xpc_dictionary_get_string(xdict, _xpc_event_key_name) encoding:1];
  uint64_t v4 = +[CNContactsDaemonLogs xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10001660C((uint64_t)v3, v4);
  }

  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) handleNotificationName:v3];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void sub_100010150(uint64_t a1, void *a2)
{
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  if (!strcmp(string, "com.apple.LaunchServices.applicationUnregistered"))
  {
    id v5 = +[CNContactsDaemonLogs xpc];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000166BC(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    long long v13 = xpc_dictionary_get_value(v3, "UserInfo");
    uint64_t v14 = v13;
    if (v13 && xpc_get_type(v13) == (xpc_type_t)&_xpc_type_dictionary)
    {
      uint64_t v15 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      uint64_t v16 = v15;
      if (v15)
      {
        uint64_t v17 = [v15 objectForKeyedSubscript:@"isPlaceholder"];
        uint64_t v18 = v17;
        if (!v17 || ([v17 BOOLValue] & 1) == 0)
        {
          uint64_t v19 = [v16 objectForKeyedSubscript:@"bundleIDs"];
          uint64_t v20 = +[CNContactsDaemonLogs xpc];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v32 = v19;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "received application unregistered notification, bundle ids %{public}@", buf, 0xCu);
          }

          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          v21 = objc_msgSend(*(id *)(a1 + 32), "applicationUnregisteredListeners", 0);
          id v22 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v27;
            do
            {
              v25 = 0;
              do
              {
                if (*(void *)v27 != v24) {
                  objc_enumerationMutation(v21);
                }
                [*(id *)(*((void *)&v26 + 1) + 8 * (void)v25) handleBundleIdentifiers:v19];
                v25 = (char *)v25 + 1;
              }
              while (v23 != v25);
              id v23 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
            }
            while (v23);
          }
        }
      }
    }
  }
}

void sub_1000106A8(id a1, Class a2)
{
}

void sub_1000106F8(id a1, _TtP9contactsd30CNBackgroundSystemTaskProtocol_ *a2)
{
  id v2 = a2;
  [(CNBackgroundSystemTaskProtocol *)v2 register];
  if (objc_opt_respondsToSelector()) {
    [(CNBackgroundSystemTaskProtocol *)v2 daemonDidLaunch];
  }
}

void sub_100010A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010A94(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100010AA4(uint64_t a1)
{
}

void sub_100010AAC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:v6];

  [v8 setDelegate:v5];
  uint64_t v7 = +[CNPair pairWithFirst:v8 second:v5];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v7];
}

uint64_t sub_100010FC0(uint64_t a1)
{
  qword_10002CB20 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_1000111C0(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)CNContactStore);
  id v3 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v37 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ContactProviderService handling unregistered applications: %{public}@", buf, 0xCu);
  }

  id v5 = +[CNContainer predicateForContainersWithType:1003 includingDisabledContainers:1];
  id v35 = 0;
  id v6 = [v2 containersMatchingPredicate:v5 error:&v35];
  id v7 = v35;
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000167B0((uint64_t)v8, v9);
    }
  }
  else
  {
    long long v28 = v5;
    long long v29 = v2;
    uint64_t v9 = objc_alloc_init((Class)CNSaveRequest);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v27 = v6;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v32;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v16 = *(void **)(a1 + 40);
          uint64_t v17 = [v15 providerIdentifier];
          LODWORD(v16) = [v16 containsObject:v17];

          if (v16)
          {
            id v18 = [v15 mutableCopy];
            [v9 deleteContainer:v18];
            uint64_t v19 = [*(id *)(a1 + 32) log];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v20 = [v15 providerIdentifier];
              v21 = [v15 name];
              *(_DWORD *)buf = 138543618;
              v37 = v20;
              __int16 v38 = 2114;
              v39 = v21;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Will delete zombie provider container (%{public}@) for unregistered app %{public}@", buf, 0x16u);
            }
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v12);
    }

    id v22 = [v9 deletedContainers];
    id v23 = [v22 count];

    if (v23)
    {
      id v30 = 0;
      id v2 = v29;
      unsigned __int8 v24 = [v29 executeSaveRequest:v9 error:&v30];
      id v8 = v30;
      v25 = [*(id *)(a1 + 32) log];
      long long v26 = v25;
      if (v24)
      {
        id v5 = v28;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Did delete zombie provider containers", buf, 2u);
        }

        +[CNContactProviderSupportManager invalidateCache];
      }
      else
      {
        id v5 = v28;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_100016738((uint64_t)v8, v26);
        }
      }
    }
    else
    {
      id v8 = 0;
      id v5 = v28;
      id v2 = v29;
    }
    id v6 = v27;
  }
}

uint64_t start()
{
  +[CNIOSContactsDaemon enterSandbox];
  signal(15, (void (__cdecl *)(int))1);
  uint64_t v1 = dispatch_get_global_queue(21, 0);
  id v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v1);
  dispatch_source_set_event_handler(v2, &stru_1000250A8);
  dispatch_activate(v2);
  id v3 = objc_alloc_init(CNIOSContactsDaemon);
  uint64_t v4 = +[NSRunLoop mainRunLoop];
  [(CNContactsDaemon *)v3 runOnRunLoop:v4];

  return 0;
}

void sub_100012218(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_1000122D8(uint64_t a1)
{
  qword_10002CB30 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_1000125F4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) coalescingInhibitor];

  if (!v2)
  {
    id v3 = +[CNInhibitor os_transactionInhibitorWithLabel:@"com.apple.contactsd.IndexService.PerformIndexing"];
    [*(id *)(a1 + 32) setCoalescingInhibitor:v3];

    uint64_t v4 = [*(id *)(a1 + 32) coalescingInhibitor];
    [v4 start];
  }
  id v6 = [*(id *)(a1 + 32) coalescer];
  id v5 = +[NSNull null];
  [v6 observerDidReceiveResult:v5];
}

id sub_100012748(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) indexHandler];
  [v3 performIndexing];

  uint64_t v4 = [*(id *)(a1 + 32) coalescingInhibitor];
  [v4 stop];

  id v5 = *(void **)(a1 + 32);

  return [v5 setCoalescingInhibitor:0];
}

id sub_100012904(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) indexHandler];
  id v5 = v4;
  if (v3) {
    [v4 reindexSearchableItemsWithIdentifiers:*(void *)(a1 + 32)];
  }
  else {
    [v4 reindexAllSearchableItems];
  }

  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
  id v7 = *(void **)(a1 + 48);

  return [v7 stop];
}

void sub_100012BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012BD0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100012BE0(uint64_t a1)
{
}

id sub_100012BE8(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) indexHandler];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v3 verifyIndexLoggingSummary:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  return [*(id *)(a1 + 40) finishWithResult:&__kCFBooleanTrue];
}

void sub_100012E3C(id a1)
{
  qword_10002CB40 = (uint64_t)os_log_create("com.apple.contacts", "contactsSync");

  _objc_release_x1();
}

uint64_t sub_100012F20(uint64_t a1)
{
  qword_10002CB50 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_1000131FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  _Unwind_Resume(a1);
}

void sub_10001322C(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained onRapportDeviceFound:v3];
}

void sub_100013288(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained onRapportDeviceLost:v3];
}

void sub_1000132E4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    [*(id *)(a1 + 32) cancelLimitedAccessTableUpdateEventNotifyWatchTimer];
    id v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v6 objectForKeyedSubscript:@"LastSyncedSequenceNumber"];
      *(_DWORD *)buf = 138412290;
      v20[0] = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "prcoessing sync request, last synced sequenceNumber:%@", buf, 0xCu);
    }
    uint64_t v10 = objc_alloc_init((Class)CNContactStore);
    uint64_t v11 = [v6 objectForKeyedSubscript:@"LastSyncedSequenceNumber"];
    id v12 = -[NSObject getWatchLimitedAccessSyncDataStartingAtSequenceNumber:](v10, "getWatchLimitedAccessSyncDataStartingAtSequenceNumber:", [v11 integerValue]);

    uint64_t v13 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      unsigned int v14 = [v12 fullSyncRequired];
      unsigned int v15 = [v12 currentSequenceNumber];
      *(_DWORD *)buf = 67109376;
      LODWORD(v20[0]) = v14;
      WORD2(v20[0]) = 1024;
      *(_DWORD *)((char *)v20 + 6) = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "fullSyncRequired %d currentSequenceNumber %d", buf, 0xEu);
    }

    id v16 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v16 encodeObject:v12 forKey:@"PhoneSyncData"];
    [v16 finishEncoding];
    uint64_t v17 = [v16 encodedData];
    id v18 = +[NSDictionary dictionaryWithObjectsAndKeys:v17, @"PhoneSyncData", 0];

    (*((void (**)(id, void *, void, void))v7 + 2))(v7, v18, 0, 0);
  }
  else
  {
    uint64_t v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "registerRequestID inRequest nil", buf, 2u);
    }
  }
}

void sub_100013584(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() log];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100016C78((uint64_t)v3, v5);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "activateWithCompletion success", v6, 2u);
    }
  }
}

void sub_100013C58(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "connectWithCompanionDevice client invalidated", v2, 2u);
  }
}

void sub_100013CB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR)) {
      sub_100016D24();
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) fDispatchQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100013D94;
    v7[3] = &unk_100024C40;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v8 = v5;
    uint64_t v9 = v6;
    dispatch_async(v4, v7);
  }
}

id sub_100013D94(uint64_t a1)
{
  id v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "connectWithCompanionDevice activated, sendSyncRequest", v4, 2u);
  }
  return [*(id *)(a1 + 40) sendSyncRequest];
}

void sub_100014020(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "connectWithCompanionDevice client invalidation", v2, 2u);
  }
}

void sub_100014080(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100016D24();
    }
  }
  else
  {
    id v5 = [v3 fDispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100014144;
    block[3] = &unk_100024B98;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v5, block);
  }
}

void sub_100014144(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "sendSyncTableUpdateEvent", buf, 2u);
  }

  uint64_t v9 = RPOptionStatusFlags;
  uint64_t v10 = &off_100025D40;
  id v3 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  uint64_t v4 = +[NSMutableDictionary dictionary];
  [v4 setObject:@"SyncTableUpdate" forKeyedSubscript:@"kABLimitedAccessEventKeyType"];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 16);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000142C0;
  v7[3] = &unk_100025190;
  void v7[4] = v5;
  [v6 sendEventID:@"com.apple.contacts.LimitedAccessSync" event:v4 options:v3 completion:v7];
}

id sub_1000142C0(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "sendEventID Completed", v4, 2u);
  }

  return [*(id *)(a1 + 32) invalidateCompanionClient];
}

void sub_1000144A0(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)CNContactStore);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (v8)
        {
          uint64_t v9 = [(id)objc_opt_class() log];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v15 = v8;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "handleBundleIdentifiers unregistered app, purge records for %@", buf, 0xCu);
          }

          [v2 purgeLimitedAccessRecordsForBundle:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v5);
  }
}

void sub_100014A3C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = [*(id *)(a1 + 32) fDispatchQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100014B28;
  v13[3] = &unk_1000251E0;
  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(void **)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v9;
  id v16 = v6;
  id v17 = v10;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v8, v13);
}

void sub_100014B28(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100016DF4();
    }

    [*(id *)(*(void *)(a1 + 40) + 16) invalidate];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = [(id)objc_opt_class() log];
    id v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "sendSyncRequest, received response, update LimitedAccessTable", buf, 2u);
      }

      id v6 = [*(id *)(a1 + 48) objectForKey:@"PhoneSyncData"];
      id v18 = 0;
      id v7 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v6 error:&v18];
      id v8 = v18;
      uint64_t v9 = self;
      long long v10 = [v7 decodeObjectOfClass:v9 forKey:@"PhoneSyncData"];

      if ([v10 fullSyncRequired])
      {
        id v11 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100016DC0();
        }

        [*(id *)(a1 + 56) dropAllLimitedAccessRows];
      }
      id v12 = [v10 syncEvents];
      long long v13 = [v12 allObjects];

      [*(id *)(a1 + 56) applyLimitedAccessSyncEvents:v13];
      signed int v14 = [v10 currentSequenceNumber];
      uint64_t v15 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        signed int v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "applyLimitedAccessSyncEvents success, save %d", buf, 8u);
      }

      id v16 = *(void **)(a1 + 56);
      id v17 = +[NSNumber numberWithInteger:v14];
      [v16 setLimitedAccessTableCurrentSequenceNumber:v17];
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100016D8C();
      }
    }
  }
}

id sub_100014EC0(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "fLimitedAccessTableUpdateEventNotifyTimer Timeout Callback.", v4, 2u);
  }

  [*(id *)(a1 + 32) cancelLimitedAccessTableUpdateEventNotifyWatchTimer];
  return [*(id *)(a1 + 32) notifyConnectedWatch];
}

void sub_10001509C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100015504(id a1)
{
  qword_10002CB60 = (uint64_t)os_log_create("com.apple.contacts.contactsd", "contacts-connections");

  _objc_release_x1();
}

ContactsService *__cdecl sub_1000155E0(id a1, CNScheduler *a2, CNScheduler *a3, NSXPCConnection *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [[ContactsService alloc] initWithWorkQueue:v8 highPriorityWorkQueue:v7 connection:v6];

  return v9;
}

uint64_t sub_100015CA4()
{
  uint64_t v0 = abort_report_np();
  return sub_100015CCC(v0);
}

uint64_t sub_100015CCC()
{
  uint64_t v0 = abort_report_np();
  return sub_100015CF4(v0);
}

void sub_100015CF4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "An error occurred while configuring sandbox storage for contactsd. tmp and cache directories will be unavailable.", v1, 2u);
}

uint64_t sub_100015D38()
{
  uint64_t v0 = abort_report_np();
  return sub_100015D60(v0);
}

void sub_100015D60(void *a1, uint64_t a2, NSObject *a3)
{
  id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [a1 activityIdentifier]);
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@ has failed to purge change history: %@", (uint8_t *)&v6, 0x16u);
}

void sub_100015E24(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "AddressBook database is nil, error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100015E9C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[contactsd] Error (%@) in database analysis decision.", (uint8_t *)&v2, 0xCu);
}

void sub_100015F14(char a1, NSObject *a2)
{
  CFStringRef v2 = @"NO";
  if (a1) {
    CFStringRef v2 = @"YES";
  }
  int v3 = 138412290;
  CFStringRef v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[contactsd] Done deciding if we should analyze database. Decision: %@", (uint8_t *)&v3, 0xCu);
}

void sub_100015FA4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015FDC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[contactsd] Error (%@) in database analysis.", (uint8_t *)&v2, 0xCu);
}

void sub_100016054(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001608C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000160C4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100016130(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001619C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_100016208()
{
  uint64_t v0 = abort_report_np();
  return sub_100016230(v0);
}

void sub_100016230(void *a1, uint64_t a2, NSObject *a3)
{
  id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [a1 activityIdentifier]);
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@ has failed to synchronize all Contact Provider extensions: %@", (uint8_t *)&v6, 0x16u);
}

void sub_1000162F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 48) _stringFromXPCActivityState:a2];
  long long v10 = +[NSString stringWithUTF8String:*(void *)(a1 + 40)];
  sub_10000F4AC((void *)&_mh_execute_header, v4, v5, "%@ not processing state \"%@\".", v6, v7, v8, v9, 2u);
}

void sub_1000163B8(uint64_t a1)
{
  uint64_t v1 = +[NSString stringWithUTF8String:*(void *)(a1 + 40)];
  sub_10000F4AC((void *)&_mh_execute_header, v2, v3, "%@ has criteria %@.", v4, v5, v6, v7, 2u);
}

void sub_100016468(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = +[NSString stringWithUTF8String:*(void *)(a1 + 40)];
  id v11 = [*(id *)(a1 + 48) _stringFromXPCActivityState:a2];
  sub_10000F4AC((void *)&_mh_execute_header, v5, v6, "%@ is in state \"%@\".", v7, v8, v9, v10, 2u);
}

void sub_100016530(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = +[NSNumber numberWithLong:a1];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Faild to convert unrecognized state \"%@\" to a string. Returning nil as a result.", (uint8_t *)&v4, 0xCu);
}

void sub_1000165D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001660C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "com.apple.notifyd.matching notification named %@", (uint8_t *)&v2, 0xCu);
}

void sub_100016684(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000166BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000166F4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Registering maintenance activities.", v1, 2u);
}

void sub_100016738(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to execute save request, error = %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000167B0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to fetch all provider containers, error = %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100016828(void *a1, NSObject *a2)
{
  uint64_t v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [a1 activityIdentifier]);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@ failed to perform backup configuration.", (uint8_t *)&v4, 0xCu);
}

void sub_1000168D4(void *a1, NSObject *a2)
{
  uint64_t v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [a1 activityIdentifier]);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@ is running backup configuration.", (uint8_t *)&v4, 0xCu);
}

void sub_100016980(void *a1)
{
  uint64_t v1 = [a1 path];
  sub_1000121E8();
  sub_100012218((void *)&_mh_execute_header, v2, v3, "Failed to read resources values for %@, error: %@", v4, v5, v6, v7, v8);
}

void sub_100016A10(void *a1)
{
  uint64_t v2 = +[NSNumber numberWithBool:0];
  uint64_t v3 = [a1 path];
  sub_100012200();
  sub_10000F4AC((void *)&_mh_execute_header, v4, v5, "Set NSURLIsExcludedFromBackupKey to %@ for %@", v6, v7, v8, v9, v10);
}

void sub_100016AC0(void *a1)
{
  uint64_t v1 = [a1 path];
  sub_1000121E8();
  sub_100012218((void *)&_mh_execute_header, v2, v3, "Failed to set resources values for %@, error: %@", v4, v5, v6, v7, v8);
}

void sub_100016B50(void *a1)
{
  uint64_t v2 = +[NSNumber numberWithBool:0];
  uint64_t v3 = [a1 path];
  sub_100012200();
  sub_10000F4AC((void *)&_mh_execute_header, v4, v5, "No change needed, NSURLIsExcludedFromBackupKey already set to %@ for %@", v6, v7, v8, v9, v10);
}

void sub_100016C00(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "AddressBook database is nil, error %@.", (uint8_t *)&v2, 0xCu);
}

void sub_100016C78(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to activate Rapport link Error %@", (uint8_t *)&v2, 0xCu);
}

void sub_100016CF0()
{
  sub_1000150B8();
  sub_10001509C((void *)&_mh_execute_header, v0, v1, "connectWithCompanionDevice device unavailable", v2, v3, v4, v5, v6);
}

void sub_100016D24()
{
  sub_1000150B8();
  sub_10001509C((void *)&_mh_execute_header, v0, v1, "connectWithCompanionDevice activation Failed!", v2, v3, v4, v5, v6);
}

void sub_100016D58()
{
  sub_1000150B8();
  sub_10001509C((void *)&_mh_execute_header, v0, v1, "sendSyncRequest lastSyncedSequenceNumber not available", v2, v3, v4, v5, v6);
}

void sub_100016D8C()
{
  sub_1000150B8();
  sub_10001509C((void *)&_mh_execute_header, v0, v1, "sendSyncRequest responseHandler: response is nil !", v2, v3, v4, v5, v6);
}

void sub_100016DC0()
{
  sub_1000150B8();
  sub_10001509C((void *)&_mh_execute_header, v0, v1, "Full sync needed, drop all rows", v2, v3, v4, v5, v6);
}

void sub_100016DF4()
{
  sub_1000150B8();
  sub_10001509C((void *)&_mh_execute_header, v0, v1, "sendSyncRequest responseHandler received error", v2, v3, v4, v5, v6);
}

void sub_100016E28(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "shouldAcceptNewConnection: Failed check for TCC uncoupled process %@", (uint8_t *)&v2, 0xCu);
}

ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef options, CFErrorRef *error)
{
  return _ABAddressBookCreateWithOptions(options, error);
}

uint64_t ABAddressBookHasLocalContent()
{
  return _ABAddressBookHasLocalContent();
}

uint64_t ABChangeHistoryClearChangesToSequenceNumber()
{
  return _ABChangeHistoryClearChangesToSequenceNumber();
}

uint64_t ABChangeHistoryGetSequenceNumberForClearingChanges()
{
  return _ABChangeHistoryGetSequenceNumberForClearingChanges();
}

uint64_t ABDiagnosticsEnabled()
{
  return _ABDiagnosticsEnabled();
}

uint64_t ABLogDisplayInternalAlert()
{
  return _ABLogDisplayInternalAlert();
}

uint64_t ABLogSimulateCrashReport()
{
  return _ABLogSimulateCrashReport();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CNImageUtilsCroppedImageDataFromFullSizeImageData()
{
  return _CNImageUtilsCroppedImageDataFromFullSizeImageData();
}

uint64_t CNUnimplementedMethodException()
{
  return _CNUnimplementedMethodException();
}

void NSLog(NSString *format, ...)
{
}

uint64_t _ABLog2()
{
  return __ABLog2();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

uint64_t cn_objectResultWithObjectLock()
{
  return _cn_objectResultWithObjectLock();
}

void dispatch_activate(dispatch_object_t object)
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_exception_throw(id exception)
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_XPCActivities(void *a1, const char *a2, ...)
{
  return [a1 XPCActivities];
}

id objc_msgSend_XPCListenerPairs(void *a1, const char *a2, ...)
{
  return [a1 XPCListenerPairs];
}

id objc_msgSend_XPCServices(void *a1, const char *a2, ...)
{
  return [a1 XPCServices];
}

id objc_msgSend__getDefaultBatchSize(void *a1, const char *a2, ...)
{
  return [a1 _getDefaultBatchSize];
}

id objc_msgSend__notifydListenersByName(void *a1, const char *a2, ...)
{
  return [a1 _notifydListenersByName];
}

id objc_msgSend_accessAuthorization(void *a1, const char *a2, ...)
{
  return [a1 accessAuthorization];
}

id objc_msgSend_activityIdentifier(void *a1, const char *a2, ...)
{
  return [a1 activityIdentifier];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_analyzer(void *a1, const char *a2, ...)
{
  return [a1 analyzer];
}

id objc_msgSend_applicationUnregisteredListeners(void *a1, const char *a2, ...)
{
  return [a1 applicationUnregisteredListeners];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assumedIdentity(void *a1, const char *a2, ...)
{
  return [a1 assumedIdentity];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_authorizer(void *a1, const char *a2, ...)
{
  return [a1 authorizer];
}

id objc_msgSend_await(void *a1, const char *a2, ...)
{
  return [a1 await];
}

id objc_msgSend_backgroundColorAnalyzer(void *a1, const char *a2, ...)
{
  return [a1 backgroundColorAnalyzer];
}

id objc_msgSend_backgroundColorQueue(void *a1, const char *a2, ...)
{
  return [a1 backgroundColorQueue];
}

id objc_msgSend_backgroundColors(void *a1, const char *a2, ...)
{
  return [a1 backgroundColors];
}

id objc_msgSend_backgroundScheduler(void *a1, const char *a2, ...)
{
  return [a1 backgroundScheduler];
}

id objc_msgSend_backgroundSystemTasks(void *a1, const char *a2, ...)
{
  return [a1 backgroundSystemTasks];
}

id objc_msgSend_backup(void *a1, const char *a2, ...)
{
  return [a1 backup];
}

id objc_msgSend_batchSize(void *a1, const char *a2, ...)
{
  return [a1 batchSize];
}

id objc_msgSend_beginService(void *a1, const char *a2, ...)
{
  return [a1 beginService];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_cancelLimitedAccessTableUpdateEventNotifyWatchTimer(void *a1, const char *a2, ...)
{
  return [a1 cancelLimitedAccessTableUpdateEventNotifyWatchTimer];
}

id objc_msgSend_checkAuthorizationStatusOfCurrentProcess(void *a1, const char *a2, ...)
{
  return [a1 checkAuthorizationStatusOfCurrentProcess];
}

id objc_msgSend_checkBackupConfiguration(void *a1, const char *a2, ...)
{
  return [a1 checkBackupConfiguration];
}

id objc_msgSend_checkForAnyDefaultAppChanged(void *a1, const char *a2, ...)
{
  return [a1 checkForAnyDefaultAppChanged];
}

id objc_msgSend_coalesceChangeEvent(void *a1, const char *a2, ...)
{
  return [a1 coalesceChangeEvent];
}

id objc_msgSend_coalescer(void *a1, const char *a2, ...)
{
  return [a1 coalescer];
}

id objc_msgSend_coalescingInhibitor(void *a1, const char *a2, ...)
{
  return [a1 coalescingInhibitor];
}

id objc_msgSend_coalescingTimer(void *a1, const char *a2, ...)
{
  return [a1 coalescingTimer];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connectWithCompanionDevice(void *a1, const char *a2, ...)
{
  return [a1 connectWithCompanionDevice];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_contactProviderManager(void *a1, const char *a2, ...)
{
  return [a1 contactProviderManager];
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return [a1 contactStore];
}

id objc_msgSend_contactsLogger(void *a1, const char *a2, ...)
{
  return [a1 contactsLogger];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_cropRect(void *a1, const char *a2, ...)
{
  return [a1 cropRect];
}

id objc_msgSend_currentEnvironment(void *a1, const char *a2, ...)
{
  return [a1 currentEnvironment];
}

id objc_msgSend_currentHistoryAnchor(void *a1, const char *a2, ...)
{
  return [a1 currentHistoryAnchor];
}

id objc_msgSend_currentHistoryToken(void *a1, const char *a2, ...)
{
  return [a1 currentHistoryToken];
}

id objc_msgSend_currentSequenceNumber(void *a1, const char *a2, ...)
{
  return [a1 currentSequenceNumber];
}

id objc_msgSend_daemonDidLaunch(void *a1, const char *a2, ...)
{
  return [a1 daemonDidLaunch];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataMapper(void *a1, const char *a2, ...)
{
  return [a1 dataMapper];
}

id objc_msgSend_dataMapperConfiguration(void *a1, const char *a2, ...)
{
  return [a1 dataMapperConfiguration];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultContainerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 defaultContainerIdentifier];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultProvider(void *a1, const char *a2, ...)
{
  return [a1 defaultProvider];
}

id objc_msgSend_defaultTCC(void *a1, const char *a2, ...)
{
  return [a1 defaultTCC];
}

id objc_msgSend_delegateQueue(void *a1, const char *a2, ...)
{
  return [a1 delegateQueue];
}

id objc_msgSend_deletedContainers(void *a1, const char *a2, ...)
{
  return [a1 deletedContainers];
}

id objc_msgSend_destinationDevice(void *a1, const char *a2, ...)
{
  return [a1 destinationDevice];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_dropAllLimitedAccessRows(void *a1, const char *a2, ...)
{
  return [a1 dropAllLimitedAccessRows];
}

id objc_msgSend_dropAllLimitedAccessRowsAndSyncNotify(void *a1, const char *a2, ...)
{
  return [a1 dropAllLimitedAccessRowsAndSyncNotify];
}

id objc_msgSend_effectiveIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveIdentifier];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_enterSandbox(void *a1, const char *a2, ...)
{
  return [a1 enterSandbox];
}

id objc_msgSend_entitlementVerifier(void *a1, const char *a2, ...)
{
  return [a1 entitlementVerifier];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return [a1 environment];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_fDispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 fDispatchQueue];
}

id objc_msgSend_favorites(void *a1, const char *a2, ...)
{
  return [a1 favorites];
}

id objc_msgSend_favoritesMatchingOptions(void *a1, const char *a2, ...)
{
  return [a1 favoritesMatchingOptions];
}

id objc_msgSend_favoritesPath(void *a1, const char *a2, ...)
{
  return [a1 favoritesPath];
}

id objc_msgSend_featureFlags(void *a1, const char *a2, ...)
{
  return [a1 featureFlags];
}

id objc_msgSend_fetchContactIdentifiersForContactsMissingBackgroundColors(void *a1, const char *a2, ...)
{
  return [a1 fetchContactIdentifiersForContactsMissingBackgroundColors];
}

id objc_msgSend_finishEncoding(void *a1, const char *a2, ...)
{
  return [a1 finishEncoding];
}

id objc_msgSend_first(void *a1, const char *a2, ...)
{
  return [a1 first];
}

id objc_msgSend_fullSyncRequired(void *a1, const char *a2, ...)
{
  return [a1 fullSyncRequired];
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return [a1 future];
}

id objc_msgSend_handleEvent(void *a1, const char *a2, ...)
{
  return [a1 handleEvent];
}

id objc_msgSend_highPriorityWorkQueue(void *a1, const char *a2, ...)
{
  return [a1 highPriorityWorkQueue];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifierAccountingData(void *a1, const char *a2, ...)
{
  return [a1 identifierAccountingData];
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return [a1 identity];
}

id objc_msgSend_imageBackgroundColorsData(void *a1, const char *a2, ...)
{
  return [a1 imageBackgroundColorsData];
}

id objc_msgSend_imageData(void *a1, const char *a2, ...)
{
  return [a1 imageData];
}

id objc_msgSend_imageKeysToFetch(void *a1, const char *a2, ...)
{
  return [a1 imageKeysToFetch];
}

id objc_msgSend_inMemoryURL(void *a1, const char *a2, ...)
{
  return [a1 inMemoryURL];
}

id objc_msgSend_indexHandler(void *a1, const char *a2, ...)
{
  return [a1 indexHandler];
}

id objc_msgSend_initForContactProvider(void *a1, const char *a2, ...)
{
  return [a1 initForContactProvider];
}

id objc_msgSend_initializeCachedValues(void *a1, const char *a2, ...)
{
  return [a1 initializeCachedValues];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interestedNotifications(void *a1, const char *a2, ...)
{
  return [a1 interestedNotifications];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateCache(void *a1, const char *a2, ...)
{
  return [a1 invalidateCache];
}

id objc_msgSend_invalidateCompanionClient(void *a1, const char *a2, ...)
{
  return [a1 invalidateCompanionClient];
}

id objc_msgSend_isSpotlightIndexingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isSpotlightIndexingEnabled];
}

id objc_msgSend_launchServices(void *a1, const char *a2, ...)
{
  return [a1 launchServices];
}

id objc_msgSend_launchServicesAdapterInterface(void *a1, const char *a2, ...)
{
  return [a1 launchServicesAdapterInterface];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_logContactsDataAccessEvent(void *a1, const char *a2, ...)
{
  return [a1 logContactsDataAccessEvent];
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return [a1 logger];
}

id objc_msgSend_loggerProvider(void *a1, const char *a2, ...)
{
  return [a1 loggerProvider];
}

id objc_msgSend_lowPriorityWorkQueue(void *a1, const char *a2, ...)
{
  return [a1 lowPriorityWorkQueue];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_matchInfo(void *a1, const char *a2, ...)
{
  return [a1 matchInfo];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_notifyConnectedWatch(void *a1, const char *a2, ...)
{
  return [a1 notifyConnectedWatch];
}

id objc_msgSend_notifydListeners(void *a1, const char *a2, ...)
{
  return [a1 notifydListeners];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_performIndexing(void *a1, const char *a2, ...)
{
  return [a1 performIndexing];
}

id objc_msgSend_predicateForContactsMissingBackgroundColors(void *a1, const char *a2, ...)
{
  return [a1 predicateForContactsMissingBackgroundColors];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_providerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 providerIdentifier];
}

id objc_msgSend_purgeHistory(void *a1, const char *a2, ...)
{
  return [a1 purgeHistory];
}

id objc_msgSend_queryAnalyticsLogger(void *a1, const char *a2, ...)
{
  return [a1 queryAnalyticsLogger];
}

id objc_msgSend_register(void *a1, const char *a2, ...)
{
  return [a1 register];
}

id objc_msgSend_registerActivity(void *a1, const char *a2, ...)
{
  return [a1 registerActivity];
}

id objc_msgSend_registerBackgroundSystemTasks(void *a1, const char *a2, ...)
{
  return [a1 registerBackgroundSystemTasks];
}

id objc_msgSend_registerXPCActivities(void *a1, const char *a2, ...)
{
  return [a1 registerXPCActivities];
}

id objc_msgSend_regulatoryLogger(void *a1, const char *a2, ...)
{
  return [a1 regulatoryLogger];
}

id objc_msgSend_reindexAllSearchableItems(void *a1, const char *a2, ...)
{
  return [a1 reindexAllSearchableItems];
}

id objc_msgSend_requiresMeContactAuthorization(void *a1, const char *a2, ...)
{
  return [a1 requiresMeContactAuthorization];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_schedulerProvider(void *a1, const char *a2, ...)
{
  return [a1 schedulerProvider];
}

id objc_msgSend_sendSyncRequest(void *a1, const char *a2, ...)
{
  return [a1 sendSyncRequest];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_serviceProtocolInterface(void *a1, const char *a2, ...)
{
  return [a1 serviceProtocolInterface];
}

id objc_msgSend_serviceProvider(void *a1, const char *a2, ...)
{
  return [a1 serviceProvider];
}

id objc_msgSend_settingsDefaultApps(void *a1, const char *a2, ...)
{
  return [a1 settingsDefaultApps];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_standardPreferences(void *a1, const char *a2, ...)
{
  return [a1 standardPreferences];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_subscribeApplicationUnregisteredListeners(void *a1, const char *a2, ...)
{
  return [a1 subscribeApplicationUnregisteredListeners];
}

id objc_msgSend_subscribeNotifydListeners(void *a1, const char *a2, ...)
{
  return [a1 subscribeNotifydListeners];
}

id objc_msgSend_supportsTelephonyCalls(void *a1, const char *a2, ...)
{
  return [a1 supportsTelephonyCalls];
}

id objc_msgSend_syncEvents(void *a1, const char *a2, ...)
{
  return [a1 syncEvents];
}

id objc_msgSend_synchronizeContactProviders(void *a1, const char *a2, ...)
{
  return [a1 synchronizeContactProviders];
}

id objc_msgSend_tccServices(void *a1, const char *a2, ...)
{
  return [a1 tccServices];
}

id objc_msgSend_thumbnailImageData(void *a1, const char *a2, ...)
{
  return [a1 thumbnailImageData];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_verifyIndex(void *a1, const char *a2, ...)
{
  return [a1 verifyIndex];
}

id objc_msgSend_wakeXPCListeners(void *a1, const char *a2, ...)
{
  return [a1 wakeXPCListeners];
}

id objc_msgSend_wakeXPCServices(void *a1, const char *a2, ...)
{
  return [a1 wakeXPCServices];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}

id objc_msgSend_xpc(void *a1, const char *a2, ...)
{
  return [a1 xpc];
}