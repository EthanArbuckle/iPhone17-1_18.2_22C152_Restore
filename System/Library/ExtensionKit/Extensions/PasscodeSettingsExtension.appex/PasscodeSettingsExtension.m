uint64_t sub_100001D88()
{
  uint64_t vars8;

  qword_100010460 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100002070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002090(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    id v5 = a3;
    v6 = +[NSNumber numberWithBool:a2];
    NSLog(@"Unlock using watch: %@ %@", v6, v5);
  }
  v7 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v7();
}

Class sub_100002124(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_100010478)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100002268;
    v3[4] = &unk_10000C888;
    v3[5] = v3;
    long long v4 = off_10000C8F8;
    uint64_t v5 = 0;
    qword_100010478 = _sl_dlopen();
    if (!qword_100010478)
    {
      abort_report_np();
LABEL_8:
      sub_1000082F0();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("NRPairedDeviceRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_100010470 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100002268()
{
  uint64_t result = _sl_dlopen();
  qword_100010478 = result;
  return result;
}

Class sub_1000022DC(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_100010488)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100002420;
    v3[4] = &unk_10000C888;
    v3[5] = v3;
    long long v4 = off_10000C910;
    uint64_t v5 = 0;
    qword_100010488 = _sl_dlopen();
    if (!qword_100010488)
    {
      abort_report_np();
LABEL_8:
      sub_100008318();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("SFUnlockManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_100010480 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100002420()
{
  uint64_t result = _sl_dlopen();
  qword_100010488 = result;
  return result;
}

void *sub_100002494(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_100010498)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_1000025D4;
    v5[4] = &unk_10000C888;
    v5[5] = v5;
    long long v6 = off_10000C928;
    uint64_t v7 = 0;
    qword_100010498 = _sl_dlopen();
    v3 = (void *)v5[0];
    v2 = (void *)qword_100010498;
    if (qword_100010498)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)qword_100010498;
LABEL_5:
  uint64_t result = dlsym(v2, "IDSDefaultPairedDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100010490 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000025D4()
{
  uint64_t result = _sl_dlopen();
  qword_100010498 = result;
  return result;
}

uint64_t sub_100002648(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return _swift_continuation_resume();
}

id sub_1000026AC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentAvailabilityProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntentAvailabilityProvider()
{
  return self;
}

uint64_t sub_100002704(char a1)
{
  *(unsigned char *)(v1 + 153) = a1;
  sub_100008670();
  *(void *)(v1 + 120) = sub_100008660();
  uint64_t v3 = sub_100008650();
  *(void *)(v1 + 128) = v3;
  *(void *)(v1 + 136) = v2;
  return _swift_task_switch(sub_10000279C, v3, v2);
}

uint64_t sub_10000279C()
{
  switch(*(unsigned char *)(v0 + 153))
  {
    case 4:
      goto LABEL_9;
    case 7:
      swift_release();
      id v4 = [self sharedInstance];
      id v6 = [v4 isFeatureAvailable];
      goto LABEL_17;
    case 8:
    case 9:
    case 0xA:
    case 0xB:
      swift_release();
      if (!PSIsPearlAvailable()) {
        goto LABEL_18;
      }
      id v2 = [self sharedConnection];
      if (v2) {
        goto LABEL_15;
      }
      __break(1u);
LABEL_6:
      swift_release();
      if (PSSupportsMesa())
      {
        id v2 = [self sharedConnection];
        if (v2)
        {
LABEL_15:
          id v4 = v2;
          uint64_t v5 = "isFingerprintModificationAllowed";
        }
        else
        {
          __break(1u);
LABEL_9:
          swift_release();
          id v3 = [self sharedConnection];
          if (!v3)
          {
            __break(1u);
LABEL_26:
            __break(1u);
            JUMPOUT(0x100002A74);
          }
          id v4 = v3;
          uint64_t v5 = "recoveryPasscodeAvailable";
        }
        id v6 = [v4 v5];
LABEL_17:
        uint64_t v1 = (uint64_t)v6;
      }
      else
      {
LABEL_18:
        uint64_t v1 = 0;
      }
LABEL_19:
      uint64_t v7 = *(uint64_t (**)(uint64_t))(v0 + 8);
      return v7(v1);
    case 0xC:
    case 0xD:
      goto LABEL_6;
    case 0xE:
      swift_release();
      if ((PSIsPearlAvailable() & 1) == 0 && !PSSupportsMesa()) {
        goto LABEL_18;
      }
      id v2 = [self sharedConnection];
      if (v2) {
        goto LABEL_15;
      }
      goto LABEL_26;
    case 0x10:
      id v9 = [self sharedInstance];
      *(void *)(v0 + 144) = v9;
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 56) = v0 + 152;
      *(void *)(v0 + 24) = sub_100002AB8;
      uint64_t v10 = swift_continuation_init();
      *(void *)(v0 + 80) = _NSConcreteStackBlock;
      *(void *)(v0 + 88) = 0x40000000;
      *(void *)(v0 + 96) = sub_100002648;
      *(void *)(v0 + 104) = &unk_10000CC30;
      *(void *)(v0 + 112) = v10;
      [v9 canUseWatchToUnlockWithCompletionHandler:v0 + 80];
      return _swift_continuation_await(v0 + 16);
    default:
      swift_release();
      uint64_t v1 = 1;
      goto LABEL_19;
  }
}

uint64_t sub_100002AB8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 136);
  uint64_t v2 = *(void *)(*(void *)v0 + 128);
  return _swift_task_switch(sub_100002BC0, v2, v1);
}

uint64_t sub_100002BC0()
{
  uint64_t v1 = *(void **)(v0 + 144);
  swift_release();
  uint64_t v2 = *(unsigned __int8 *)(v0 + 152);

  id v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t sub_100002C30()
{
  uint64_t v0 = sub_100003168(&qword_1000102C8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  id v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003114();
  sub_1000084A0();
  uint64_t v4 = sub_100008460();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  sub_1000084A0();
  uint64_t v6 = sub_100008460();
  v5(v3, v0);
  sub_100003168(&qword_1000102D0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100008BC0;
  *(void *)(v7 + 32) = v4;
  *(void *)(v7 + 40) = v6;
  uint64_t v8 = sub_100008450();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_100002DE8()
{
  uint64_t v0 = sub_100008480();
  sub_100003168(&qword_1000102B8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100008BD0;
  *(void *)(v1 + 32) = v0;
  uint64_t v2 = sub_100008470();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_100002E6C()
{
  uint64_t v0 = sub_1000084D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_100007630();
  sub_100003114();
  sub_1000084E0();
  uint64_t v4 = sub_1000084C0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100003168(&qword_1000102C0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100008BD0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_1000084B0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_100002FCC()
{
  uint64_t v0 = sub_100008440();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003114();
  sub_100008430();
  uint64_t v4 = sub_100008420();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100003168(&qword_1000102B0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100008BD0;
  *(void *)(v5 + 32) = v4;
  uint64_t v6 = sub_100008410();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for PasscodeAssistantIntentsProvider()
{
  return &type metadata for PasscodeAssistantIntentsProvider;
}

unint64_t sub_100003114()
{
  unint64_t result = qword_1000102A8;
  if (!qword_1000102A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000102A8);
  }
  return result;
}

uint64_t sub_100003168(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000031B0()
{
  unint64_t result = qword_1000102D8;
  if (!qword_1000102D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000102D8);
  }
  return result;
}

unint64_t sub_100003208()
{
  unint64_t result = qword_1000102E0;
  if (!qword_1000102E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000102E0);
  }
  return result;
}

unint64_t sub_100003260()
{
  unint64_t result = qword_1000102E8[0];
  if (!qword_1000102E8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000102E8);
  }
  return result;
}

uint64_t sub_1000032B4@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v69 = a2;
  uint64_t v3 = sub_100003168(&qword_100010418);
  __chkstk_darwin(v3 - 8);
  v70 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100003168(&qword_1000103F0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100008620();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  v71 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)&v66 - v12;
  uint64_t v14 = sub_100008520();
  uint64_t v15 = __chkstk_darwin(v14);
  v17 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v15);
  v20 = (char *)&v66 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  v23 = (char *)&v66 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  v26 = (char *)&v66 - v25;
  uint64_t v27 = __chkstk_darwin(v24);
  v30 = (char *)&v66 - v29;
  switch(a1)
  {
    case 1:
      uint64_t v33 = v28;
      uint64_t v68 = v27;
      id v34 = [self sharedConnection];
      if (!v34)
      {
        __break(1u);
LABEL_18:
        __break(1u);
        JUMPOUT(0x1000053C0);
      }
      v35 = v34;
      [v34 isPasscodeSet];

      sub_100008610();
      sub_100008610();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      v36 = v70;
      sub_1000084F0();
      uint64_t v37 = sub_100008500();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v36, 0, 1, v37);
      sub_100008610();
      sub_100008510();
      uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v33 + 32))(v69, v26, v68);
      break;
    case 2:
    case 4:
    case 10:
    case 16:
      sub_100008610();
      sub_100008610();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      v59 = v70;
      sub_1000084F0();
      uint64_t v60 = sub_100008500();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v59, 0, 1, v60);
      sub_100003168(&qword_100010420);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100008BD0;
      sub_100008610();
      goto LABEL_15;
    case 3:
      sub_100008610();
      sub_100008610();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      v38 = v70;
      sub_1000084F0();
      uint64_t v39 = sub_100008500();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v38, 0, 1, v39);
      sub_100008610();
      goto LABEL_16;
    case 5:
    case 8:
    case 11:
    case 12:
      sub_100008610();
      sub_100008610();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      v57 = v70;
      sub_1000084F0();
      uint64_t v58 = sub_100008500();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v58 - 8) + 56))(v57, 0, 1, v58);
      sub_100003168(&qword_100010420);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100008BD0;
      sub_100008610();
LABEL_15:
      sub_100008610();
      goto LABEL_16;
    case 6:
      uint64_t v52 = v28;
      uint64_t v68 = v27;
      id v53 = [self sharedConnection];
      if (!v53) {
        goto LABEL_18;
      }
      v54 = v53;
      [v53 effectiveBoolValueForSetting:MCFeatureAllowVoiceDialing];

      sub_100008610();
      sub_100008610();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      v55 = v70;
      sub_1000084F0();
      uint64_t v56 = sub_100008500();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v55, 0, 1, v56);
      sub_100003168(&qword_100010420);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100008BD0;
      sub_100008610();
      sub_100008610();
      uint64_t v65 = v69;
      sub_100008510();
      uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v52 + 32))(v65, v23, v68);
      break;
    case 7:
      uint64_t v40 = v28;
      uint64_t v68 = v27;
      id v41 = [self sharedInstance];
      [v41 isFeatureEnabled];

      sub_100008610();
      sub_100008610();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      v42 = v70;
      sub_1000084F0();
      uint64_t v43 = sub_100008500();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v42, 0, 1, v43);
      sub_100003168(&qword_100010420);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100008BD0;
      sub_100008610();
      sub_100008610();
      uint64_t v64 = v69;
      sub_100008510();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v40 + 32))(v64, v20, v68);
    case 9:
      sub_100008610();
      sub_100008610();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      v44 = v70;
      sub_1000084F0();
      uint64_t v45 = sub_100008500();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v44, 0, 1, v45);
      sub_100003168(&qword_100010420);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100008BC0;
      sub_100008610();
      sub_100008610();
      sub_100008610();
      goto LABEL_16;
    case 13:
      sub_100008610();
      sub_100008610();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      v46 = v70;
      sub_1000084F0();
      uint64_t v47 = sub_100008500();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v46, 0, 1, v47);
      sub_100003168(&qword_100010420);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100008C70;
      sub_100008610();
      sub_100008610();
      sub_100008610();
      sub_100008610();
      sub_100008610();
      goto LABEL_16;
    case 14:
      uint64_t v67 = v28;
      uint64_t v68 = v27;
      PSSupportsMesa();
      v66 = v13;
      sub_100008610();
      sub_100008610();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      v48 = v70;
      sub_1000084F0();
      uint64_t v49 = sub_100008500();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v48, 0, 1, v49);
      sub_100003168(&qword_100010420);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100008C60;
      sub_100008610();
      sub_100008610();
      sub_100008610();
      sub_100008610();
      sub_100008610();
      sub_100008610();
      sub_100008610();
      sub_100008510();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v67 + 32))(v69, v17, v68);
    case 15:
      sub_100008610();
      sub_100008610();
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
      v50 = v70;
      sub_1000084F0();
      uint64_t v51 = sub_100008500();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v50, 0, 1, v51);
      sub_100003168(&qword_100010420);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100008C50;
      sub_100008610();
      sub_100008610();
      sub_100008610();
      sub_100008610();
      sub_100008610();
      sub_100008610();
      sub_100008610();
      sub_100008610();
LABEL_16:
      uint64_t result = sub_100008510();
      break;
    default:
      uint64_t v31 = v28;
      uint64_t v32 = v27;
      PSSupportsMesa();
      sub_100008610();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
      v61 = v70;
      sub_1000084F0();
      uint64_t v62 = sub_100008500();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56))(v61, 0, 1, v62);
      sub_100008610();
      sub_100008510();
      uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v31 + 32))(v69, v30, v32);
      break;
  }
  return result;
}

uint64_t sub_100005404()
{
  uint64_t v0 = sub_100003168(&qword_1000103F0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100008620();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = sub_1000085F0();
  sub_100007A4C(v5, qword_1000113A0);
  sub_100007A14(v5, (uint64_t)qword_1000113A0);
  sub_100008610();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return sub_1000085E0();
}

uint64_t sub_100005574()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_100010448 + dword_100010448);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100005614;
  return v3();
}

uint64_t sub_100005614(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_100005714(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100010448 + dword_100010448);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_100008114;
  return v4();
}

unint64_t sub_1000057BC()
{
  unint64_t result = qword_100010300;
  if (!qword_100010300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010300);
  }
  return result;
}

uint64_t sub_100005810(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_100010438 + dword_100010438);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  void *v2 = v1;
  v2[1] = sub_1000058B4;
  return v4();
}

uint64_t sub_1000058B4(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

unint64_t sub_1000059CC()
{
  unint64_t result = qword_100010310;
  if (!qword_100010310)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010310);
  }
  return result;
}

unint64_t sub_100005A24()
{
  unint64_t result = qword_100010318;
  if (!qword_100010318)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010318);
  }
  return result;
}

unint64_t sub_100005A7C()
{
  unint64_t result = qword_100010320;
  if (!qword_100010320)
  {
    sub_100005AF0(qword_100010328);
    sub_100005A24();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010320);
  }
  return result;
}

uint64_t sub_100005AF0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005B38(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000057BC();
  *uint64_t v5 = v2;
  v5[1] = sub_100005BEC;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100005BEC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100005CE0(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_100005D00, 0, 0);
}

uint64_t sub_100005D00()
{
  **(unsigned char **)(v0 + 16) = 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_100005D28()
{
  unint64_t result = qword_100010340;
  if (!qword_100010340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010340);
  }
  return result;
}

uint64_t sub_100005D7C()
{
  uint64_t v0 = sub_100003168(&qword_100010428);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100003168(&qword_100010430);
  __chkstk_darwin(v4);
  sub_100003260();
  sub_1000085C0();
  v7._object = (void *)0x800000010000AED0;
  v7._countAndFlagsBits = 0xD000000000000032;
  sub_1000085B0(v7);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for _EntityURLRepresentation.StringInterpolation.Token.id<A>(_:), v0);
  sub_1000085A0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  sub_1000085B0(v8);
  return sub_1000085D0();
}

unint64_t sub_100005F3C()
{
  unint64_t result = qword_100010348;
  if (!qword_100010348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010348);
  }
  return result;
}

unint64_t sub_100005F94()
{
  unint64_t result = qword_100010350;
  if (!qword_100010350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010350);
  }
  return result;
}

unint64_t sub_100005FEC()
{
  unint64_t result = qword_100010358;
  if (!qword_100010358)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010358);
  }
  return result;
}

unint64_t sub_100006044()
{
  unint64_t result = qword_100010360;
  if (!qword_100010360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010360);
  }
  return result;
}

uint64_t sub_100006098()
{
  sub_1000079C0();
  uint64_t v2 = sub_100008560();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_1000080FC(v3, v0, v2, v1);
}

unint64_t sub_100006130()
{
  unint64_t result = qword_100010370;
  if (!qword_100010370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010370);
  }
  return result;
}

unint64_t sub_100006188()
{
  unint64_t result = qword_100010378;
  if (!qword_100010378)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010378);
  }
  return result;
}

unint64_t sub_1000061E0()
{
  unint64_t result = qword_100010380;
  if (!qword_100010380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010380);
  }
  return result;
}

unint64_t sub_100006238()
{
  unint64_t result = qword_100010388;
  if (!qword_100010388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010388);
  }
  return result;
}

void sub_10000628C(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100006298@<X0>(uint64_t a1@<X8>)
{
  return sub_100006F4C(&qword_100010258, (uint64_t (*)(void))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_1000113A0, a1);
}

uint64_t sub_1000062D0()
{
  return sub_100006AD4(&qword_100010390, &qword_100010398);
}

uint64_t sub_10000630C(uint64_t a1)
{
  unint64_t v2 = sub_100003260();

  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000635C()
{
  unint64_t result = qword_1000103A0;
  if (!qword_1000103A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103A0);
  }
  return result;
}

uint64_t sub_1000063B0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000032B4(*v1, a1);
}

uint64_t sub_1000063B8(uint64_t a1)
{
  unint64_t v2 = sub_1000061E0();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100006404(unint64_t result)
{
  unint64_t result = result;
  switch((char)result)
  {
    case 1:
    case 3:
      unint64_t result = 0x45444F4353534150;
      break;
    case 2:
      unint64_t result = 0x505F45474E414843;
      break;
    case 4:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 5:
      unint64_t result = 0x5645445F45504957;
      break;
    case 6:
      unint64_t result = 0x49445F4543494F56;
      break;
    case 7:
      unint64_t result = 0xD000000000000013;
      break;
    case 8:
    case 9:
      unint64_t result = 0xD000000000000011;
      break;
    case 10:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 11:
      unint64_t result = 0x53414C475F444441;
      break;
    case 12:
      unint64_t result = 0x474E49465F444441;
      break;
    case 13:
      unint64_t result = 0xD000000000000012;
      break;
    case 14:
      unint64_t result = 0xD000000000000019;
      break;
    case 15:
      unint64_t result = 0xD000000000000018;
      break;
    case 16:
      unint64_t result = 0xD000000000000019;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10000661C(char a1)
{
  uint64_t result = 1953460082;
  switch(a1)
  {
    case 1:
      uint64_t v3 = 0x656C67676F74;
      goto LABEL_4;
    case 2:
      uint64_t v3 = 0x65676E616863;
LABEL_4:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x6150000000000000;
      break;
    case 3:
      uint64_t result = 0xD00000000000001ELL;
      break;
    case 4:
      uint64_t result = 0xD000000000000016;
      break;
    case 5:
      uint64_t result = 0x7461446573617265;
      break;
    case 6:
      uint64_t result = 0x6F56656C67676F74;
      break;
    case 7:
      uint64_t result = 0xD00000000000001CLL;
      break;
    case 8:
      uint64_t result = 0x4965636146646461;
      break;
    case 9:
      uint64_t result = 0x61466574656C6564;
      break;
    case 10:
    case 11:
    case 16:
      uint64_t result = 0xD000000000000014;
      break;
    case 12:
      uint64_t result = 0x6863756F54646461;
      break;
    case 13:
      uint64_t result = 0x6F546574656C6564;
      break;
    case 14:
      uint64_t result = 0xD000000000000018;
      break;
    case 15:
      uint64_t result = 0xD000000000000015;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100006840(char *a1, char *a2)
{
  char v2 = *a2;
  uint64_t v3 = sub_10000661C(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_10000661C(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_100008680();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_1000068D0()
{
  unint64_t result = qword_1000103A8;
  if (!qword_1000103A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103A8);
  }
  return result;
}

Swift::Int sub_100006924()
{
  char v1 = *v0;
  sub_1000086A0();
  sub_10000661C(v1);
  sub_100008640();
  swift_bridgeObjectRelease();
  return sub_1000086B0();
}

uint64_t sub_100006988()
{
  sub_10000661C(*v0);
  sub_100008640();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000069DC()
{
  char v1 = *v0;
  sub_1000086A0();
  sub_10000661C(v1);
  sub_100008640();
  swift_bridgeObjectRelease();
  return sub_1000086B0();
}

uint64_t sub_100006A3C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000080A8();
  *a1 = result;
  return result;
}

uint64_t sub_100006A6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000661C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100006A98()
{
  return sub_100006AD4(&qword_1000103B0, &qword_1000103B8);
}

uint64_t sub_100006AD4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005AF0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100006B18(void *a1@<X8>)
{
  *a1 = &off_10000CA40;
}

unint64_t sub_100006B28()
{
  return sub_100006404(*v0);
}

uint64_t sub_100006B30@<X0>(unsigned char *a1@<X8>)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000080A8();
  *a1 = result;
  return result;
}

unint64_t sub_100006B7C()
{
  unint64_t result = qword_1000103C0;
  if (!qword_1000103C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103C0);
  }
  return result;
}

uint64_t sub_100006BD0()
{
  uint64_t v0 = sub_100008620();
  sub_100007A4C(v0, qword_1000113B8);
  sub_100007A14(v0, (uint64_t)qword_1000113B8);
  return sub_100008610();
}

uint64_t sub_100006C34@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000083E0();
  *a1 = v3;
  return result;
}

uint64_t sub_100006C70()
{
  return sub_1000083F0();
}

void (*sub_100006CA8(void *a1))(void *a1)
{
  char v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1000083D0();
  return sub_100006D04;
}

void sub_100006D04(void *a1)
{
  char v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100006D58()
{
  unint64_t result = qword_1000103C8;
  if (!qword_1000103C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103C8);
  }
  return result;
}

uint64_t sub_100006DAC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100007918();
  unint64_t v5 = sub_1000079C0();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100006E18()
{
  unint64_t result = qword_1000103D0;
  if (!qword_1000103D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103D0);
  }
  return result;
}

unint64_t sub_100006E70()
{
  unint64_t result = qword_1000103D8;
  if (!qword_1000103D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000103D8);
  }
  return result;
}

uint64_t sub_100006EC4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006F14@<X0>(uint64_t a1@<X8>)
{
  return sub_100006F4C(&qword_100010260, (uint64_t (*)(void))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000113B8, a1);
}

uint64_t sub_100006F4C@<X0>(void *a1@<X2>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v7 = a2(0);
  uint64_t v8 = sub_100007A14(v7, a3);
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16);

  return v9(a4, v8, v7);
}

uint64_t sub_100006FF0()
{
  return 0;
}

uint64_t sub_100006FFC()
{
  return 1;
}

uint64_t sub_10000700C(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_100007918();
  unint64_t v7 = sub_10000796C();
  unint64_t v8 = sub_1000079C0();
  *unint64_t v5 = v2;
  v5[1] = sub_1000070E0;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_1000070E0()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    unint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_1000071E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100007630();
  *a1 = result;
  return result;
}

uint64_t sub_100007210(uint64_t a1)
{
  unint64_t v2 = sub_100003114();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenPasscodeSettingsEntityDeepLinks()
{
  return &type metadata for OpenPasscodeSettingsEntityDeepLinks;
}

unsigned char *initializeBufferWithCopyOfBuffer for PasscodeSettingsEntityDestination(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_100007274(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000727C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PasscodeSettingsEntityDestination()
{
  return &type metadata for PasscodeSettingsEntityDestination;
}

uint64_t _s25PasscodeSettingsExtension33PasscodeSettingsEntityDestinationOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF0) {
    goto LABEL_17;
  }
  if (a2 + 16 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 16) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 16;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 16;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 16;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x11;
  int v8 = v6 - 17;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s25PasscodeSettingsExtension33PasscodeSettingsEntityDestinationOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 16 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 16) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEF)
  {
    unsigned int v6 = ((a2 - 240) >> 8) + 1;
    *uint64_t result = a2 + 16;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1000073F0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 16;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PasscodeSettingsEntity()
{
  return &type metadata for PasscodeSettingsEntity;
}

ValueMetadata *type metadata accessor for PasscodeSettingsEntity.AvailablePasscodeSettingsEntityDestinationQuery()
{
  return &type metadata for PasscodeSettingsEntity.AvailablePasscodeSettingsEntityDestinationQuery;
}

char *sub_100007438(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100003168(&qword_100010440);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_100007524(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100007544(a1, a2, a3, *v3);
  char *v3 = result;
  return result;
}

char *sub_100007544(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100003168(&qword_100010440);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_100007630()
{
  uint64_t v16 = sub_100008550();
  uint64_t v0 = *(void *)(v16 - 8);
  ((void (*)(void))__chkstk_darwin)();
  int v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003168(&qword_1000103E8);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  char v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  int64_t v7 = (char *)&v16 - v6;
  uint64_t v8 = sub_100003168(&qword_1000103F0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100008620();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_100003168(&qword_1000103F8);
  sub_100008610();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  char v17 = 17;
  uint64_t v13 = sub_1000083C0();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  v14(v7, 1, 1, v13);
  v14(v5, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v0 + 104))(v2, enum case for InputConnectionBehavior.default(_:), v16);
  sub_100003260();
  return sub_100008400();
}

unint64_t sub_100007918()
{
  unint64_t result = qword_100010400;
  if (!qword_100010400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010400);
  }
  return result;
}

unint64_t sub_10000796C()
{
  unint64_t result = qword_100010408;
  if (!qword_100010408)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010408);
  }
  return result;
}

unint64_t sub_1000079C0()
{
  unint64_t result = qword_100010410;
  if (!qword_100010410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010410);
  }
  return result;
}

uint64_t sub_100007A14(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100007A4C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100007AB0()
{
  return _swift_task_switch(sub_100007ACC, 0, 0);
}

uint64_t sub_100007ACC()
{
  sub_100008670();
  *(void *)(v0 + 16) = sub_100008660();
  uint64_t v2 = sub_100008650();
  return _swift_task_switch(sub_100007B60, v2, v1);
}

uint64_t sub_100007B60()
{
  swift_release();
  *(void *)(v0 + 24) = [objc_allocWithZone((Class)type metadata accessor for IntentAvailabilityProvider()) init];
  return _swift_task_switch(sub_100007BE4, 0, 0);
}

uint64_t sub_100007BE4()
{
  *(void *)(v0 + 32) = 17;
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 48) = &_swiftEmptyArrayStorage;
  *(unsigned char *)(v0 + 64) = 0;
  uint64_t v3 = (uint64_t (*)(char))((char *)&dword_1000102A0 + dword_1000102A0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100007CF4;
  return v3(0);
}

uint64_t sub_100007CF4(char a1)
{
  *(unsigned char *)(*(void *)v1 + 65) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100007DF4, 0, 0);
}

uint64_t sub_100007DF4()
{
  uint64_t v1 = *(char **)(v0 + 48);
  if (*(unsigned char *)(v0 + 65))
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v1 = *(char **)(v0 + 48);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v1 = sub_100007438(0, *((void *)v1 + 2) + 1, 1, *(char **)(v0 + 48));
    }
    unint64_t v4 = *((void *)v1 + 2);
    unint64_t v3 = *((void *)v1 + 3);
    if (v4 >= v3 >> 1) {
      uint64_t v1 = sub_100007438((char *)(v3 > 1), v4 + 1, 1, v1);
    }
    char v5 = *(unsigned char *)(v0 + 64);
    *((void *)v1 + 2) = v4 + 1;
    v1[v4 + 32] = v5;
  }
  uint64_t v6 = *(void *)(v0 + 40) + 1;
  if (v6 == *(void *)(v0 + 32))
  {

    int64_t v7 = *(uint64_t (**)(char *))(v0 + 8);
    return v7(v1);
  }
  else
  {
    *(void *)(v0 + 40) = v6;
    *(void *)(v0 + 48) = v1;
    char v9 = *((unsigned char *)&off_10000CA40 + v6 + 32);
    *(unsigned char *)(v0 + 64) = v9;
    uint64_t v11 = (uint64_t (*)(char))((char *)&dword_1000102A0 + dword_1000102A0);
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 56) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_100007CF4;
    return v11(v9);
  }
}

uint64_t sub_100007F88()
{
  return _swift_task_switch(sub_100007FA4, 0, 0);
}

uint64_t sub_100007FA4()
{
  uint64_t v1 = 17;
  sub_100007524(0, 17, 0);
  uint64_t v2 = &_swiftEmptyArrayStorage;
  unint64_t v3 = *((void *)&_swiftEmptyArrayStorage + 2);
  unint64_t v4 = &byte_10000CA60;
  do
  {
    char v6 = *v4++;
    char v5 = v6;
    uint64_t v10 = v2;
    unint64_t v7 = v2[3];
    if (v3 >= v7 >> 1)
    {
      sub_100007524((char *)(v7 > 1), v3 + 1, 1);
      uint64_t v2 = v10;
    }
    v2[2] = v3 + 1;
    *((unsigned char *)v2 + v3++ + 32) = v5;
    --v1;
  }
  while (v1);
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_1000080A8()
{
  unint64_t v0 = sub_100008690();
  swift_bridgeObjectRelease();
  if (v0 >= 0x11) {
    return 17;
  }
  else {
    return v0;
  }
}

uint64_t sub_1000080FC(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100008118(uint64_t a1)
{
  unint64_t v2 = sub_100008268();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000081C0()
{
  unint64_t result = qword_100010450;
  if (!qword_100010450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010450);
  }
  return result;
}

uint64_t sub_100008218()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100008268()
{
  unint64_t result = qword_100010458;
  if (!qword_100010458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010458);
  }
  return result;
}

ValueMetadata *type metadata accessor for PasscodeSettingsExtensionExtension()
{
  return &type metadata for PasscodeSettingsExtensionExtension;
}

void sub_1000082CC()
{
}

void sub_1000082F0()
{
  uint64_t v0 = abort_report_np();
  sub_100008318(v0);
}

void sub_100008318()
{
}

uint64_t sub_100008340()
{
  return static _AssistantIntentsProvider.uniqueEntities.getter();
}

uint64_t sub_100008360()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100008370()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100008380()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000083C0()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_1000083D0()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_1000083E0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_1000083F0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_100008400()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)();
}

uint64_t sub_100008410()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
}

uint64_t sub_100008420()
{
  return static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)();
}

uint64_t sub_100008430()
{
  return _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)();
}

uint64_t sub_100008440()
{
  return type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases();
}

uint64_t sub_100008450()
{
  return static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
}

uint64_t sub_100008460()
{
  return static _AssistantIntent.PhraseBuilder.buildExpression(_:)();
}

uint64_t sub_100008470()
{
  return static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
}

uint64_t sub_100008480()
{
  return static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
}

uint64_t sub_100008490()
{
  return static _AssistantIntent.ParameterValueBuilder.buildBlock()();
}

uint64_t sub_1000084A0()
{
  return _AssistantIntent.Phrase.init(stringLiteral:)();
}

uint64_t sub_1000084B0()
{
  return static _AssistantIntent.Builder.buildBlock(_:)();
}

uint64_t sub_1000084C0()
{
  return static _AssistantIntent.Builder.buildExpression(_:)();
}

uint64_t sub_1000084D0()
{
  return type metadata accessor for _AssistantIntent();
}

uint64_t sub_1000084E0()
{
  return _AssistantIntent.init<A>(_:phrases:parameterValues:)();
}

uint64_t sub_1000084F0()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_100008500()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_100008510()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100008520()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100008530()
{
  return static EnumerableEntityQuery.findIntentDescription.getter();
}

uint64_t sub_100008540()
{
  return static DynamicOptionsProvider.useForParameterResolution.getter();
}

uint64_t sub_100008550()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100008560()
{
  return _URLRepresentableEntity.urlRepresentationParameter.getter();
}

uint64_t sub_100008590()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_1000085A0()
{
  return _EntityURLRepresentation.StringInterpolation.appendInterpolation(_:)();
}

void sub_1000085B0(Swift::String a1)
{
}

uint64_t sub_1000085C0()
{
  return _EntityURLRepresentation.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_1000085D0()
{
  return _EntityURLRepresentation.init(stringInterpolation:)();
}

uint64_t sub_1000085E0()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_1000085F0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_100008610()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100008620()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100008630()
{
  return static AppExtension.main()();
}

uint64_t sub_100008640()
{
  return String.hash(into:)();
}

uint64_t sub_100008650()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100008660()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100008670()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100008680()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100008690()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_1000086A0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1000086B0()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

uint64_t PSIsPearlAvailable()
{
  return _PSIsPearlAvailable();
}

uint64_t PSSupportsMesa()
{
  return _PSSupportsMesa();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

uint64_t self
{
  return _self;
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return _[a1 isPaired];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedUnlockManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedUnlockManager];
}

id objc_msgSend_unlockEnabledWithDevice_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlockEnabledWithDevice:completionHandler:");
}