id sub_100003970()
{
  id result;

  result = (id)DiagnosticLogHandleForCategory();
  qword_10000CE20 = (uint64_t)result;
  return result;
}

void sub_10000399C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_responder) = a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  if (a1 && (type metadata accessor for OnDemandAudioDiagnosticTriggerInputs(), (uint64_t v4 = swift_dynamicCastClass()) != 0))
  {
    id v5 = *(id *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_inputs);
    *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_inputs) = v4;
    swift_unknownObjectRetain();
  }
  else
  {
    sub_100004978(0);
  }
}

void sub_100003AE8()
{
  v1 = v0;
  uint64_t v2 = sub_100006538();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v41 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_100006568();
  uint64_t v40 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100006588();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  v14 = (char *)&v35 - v13;
  uint64_t v15 = OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_responder;
  v16 = *(void **)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_responder];
  if (!v16)
  {
    __break(1u);
    goto LABEL_9;
  }
  v39 = v6;
  uint64_t v17 = OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_inputs;
  uint64_t v18 = *(void *)&v1[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_inputs];
  if (!v18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (*(unsigned char *)(v18 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeout + 8))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v19 = v12;
  uint64_t v37 = v3;
  uint64_t v38 = v2;
  swift_unknownObjectRetain();
  Class isa = sub_100006658().super.super.isa;
  [v16 allowSessionAccessoryDisconnectForDuration:isa];
  swift_unknownObjectRelease();

  v21 = *(void **)&v1[v15];
  if (!v21)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v1;
  v47 = sub_100005540;
  uint64_t v48 = v22;
  aBlock = _NSConcreteStackBlock;
  uint64_t v44 = 1107296256;
  v45 = sub_1000048E4;
  v46 = &unk_1000084A0;
  v23 = _Block_copy(&aBlock);
  v24 = v1;
  swift_unknownObjectRetain();
  swift_release();
  [v21 requestSessionAccessoryIdentifierWithCompletion:v23];
  _Block_release(v23);
  swift_unknownObjectRelease();
  sub_1000052F4();
  uint64_t v25 = sub_100006638();
  sub_100006578();
  uint64_t v26 = *(void *)&v1[v17];
  if (!v26)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v36 = (void *)v25;
  if ((*(unsigned char *)(v26 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeout + 8) & 1) == 0)
  {
    sub_100006598();
    v27 = *(void (**)(char *, uint64_t))(v8 + 8);
    uint64_t v28 = v19;
    v27(v11, v19);
    uint64_t v29 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v47 = sub_100005548;
    uint64_t v48 = v29;
    aBlock = _NSConcreteStackBlock;
    uint64_t v44 = 1107296256;
    v45 = (void (*)(uint64_t, uint64_t, void *))sub_1000040C4;
    v46 = &unk_1000084C8;
    v30 = _Block_copy(&aBlock);
    swift_release();
    v31 = v39;
    sub_100006558();
    aBlock = (void **)&_swiftEmptyArrayStorage;
    sub_1000053C8();
    sub_100005420(&qword_10000CC70);
    sub_100005464();
    v32 = v41;
    uint64_t v33 = v38;
    sub_100006688();
    v34 = v36;
    sub_100006628();
    _Block_release(v30);

    (*(void (**)(char *, uint64_t))(v37 + 8))(v32, v33);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v31, v42);
    v27(v14, v28);
    return;
  }
LABEL_13:
  __break(1u);
}

void sub_100003FDC()
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v1 = Strong;
    if (([Strong isFinished] & 1) == 0
      && ([v1 isCancelled] & 1) == 0)
    {
      sub_100006608();
      if (qword_10000CBB0 != -1) {
        swift_once();
      }
      sub_100006528();
      sub_100004978(3);
    }
  }
}

void sub_100004178(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  if (a3)
  {
    swift_getErrorValue();
    uint64_t v5 = sub_1000066E8();
    unint64_t v7 = v6;
    os_log_type_t v8 = sub_100006608();
    if (qword_10000CBB0 != -1) {
      swift_once();
    }
    uint64_t v9 = qword_10000CE20;
    if (os_log_type_enabled((os_log_t)qword_10000CE20, v8))
    {
      swift_bridgeObjectRetain();
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      swift_bridgeObjectRetain();
      sub_100005558(v5, v7, aBlock);
      sub_100006668();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v9, v8, "Unable to get UUID for session accessory with error %s", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    sub_100004978(2);
  }
  else
  {
    v11 = *(void **)&a4[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_hearingModeClient];
    NSString v12 = sub_1000065B8();
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = a4;
    aBlock[4] = (uint64_t)sub_100005550;
    aBlock[5] = v13;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100004878;
    aBlock[3] = (uint64_t)&unk_100008518;
    v14 = _Block_copy(aBlock);
    uint64_t v15 = a4;
    swift_release();
    [v11 triggerOnDemandDiagnosticCheckForDeviceIdentifier:v12 completion:v14];
    _Block_release(v14);
  }
}

uint64_t sub_100004400(uint64_t a1, char *a2)
{
  if (!a1) {
    return sub_100004978(5);
  }
  swift_getErrorValue();
  swift_errorRetain();
  uint64_t v3 = sub_1000066E8();
  unint64_t v5 = v4;
  os_log_type_t v6 = sub_100006608();
  if (qword_10000CBB0 != -1) {
    swift_once();
  }
  unint64_t v7 = &OnDemandAudioDiagnosticTriggerController__metaData;
  os_log_type_t v8 = qword_10000CE20;
  if (os_log_type_enabled((os_log_t)qword_10000CE20, v6))
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_100005558(v3, v5, aBlock);
    sub_100006668();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v8, v6, "On demand diagnostic check trigger failed with error %s.", v9, 0xCu);
    swift_arrayDestroy();
    unint64_t v7 = &OnDemandAudioDiagnosticTriggerController__metaData;
    swift_slowDealloc();
    uint64_t result = swift_slowDealloc();
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
  }
  uint64_t v11 = *(void *)&a2[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_inputs];
  if (!v11)
  {
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v12 = v11 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCount;
  if (*(unsigned char *)(v12 + 8))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v13 = OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_retryCount;
  unint64_t v14 = *(void *)&a2[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_retryCount];
  if (v14 >= *(void *)v12)
  {
    os_log_type_t v24 = sub_100006608();
    ivar_lyt = v7[50].ivar_lyt;
    os_log_type_t v26 = v24;
    if (os_log_type_enabled(ivar_lyt, v24))
    {
      v27 = a2;
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 134217984;
      aBlock[0] = *(void *)&a2[v13];
      sub_100006668();

      _os_log_impl((void *)&_mh_execute_header, ivar_lyt, v26, "Maximum number or retries reached (%lu). Failing test.", v28, 0xCu);
      swift_slowDealloc();
    }
    id v29 = [a2 result];
    Class isa = sub_1000065F8().super.super.isa;
    [v29 setStatusCode:isa];

    return swift_errorRelease();
  }
  *(void *)&a2[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_retryCount] = v14 + 1;
  os_log_type_t v15 = sub_100006608();
  v16 = v7[50].ivar_lyt;
  os_log_type_t v17 = v15;
  uint64_t result = os_log_type_enabled(v16, v15);
  if (result)
  {
    uint64_t v18 = a2;
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 134217984;
    aBlock[0] = *(void *)&a2[v13];
    sub_100006668();

    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Retrying. Current retry count is now %lu", v19, 0xCu);
    uint64_t result = swift_slowDealloc();
  }
  v20 = *(void **)&a2[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_responder];
  if (v20)
  {
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = a2;
    aBlock[4] = (uint64_t)sub_100005C88;
    aBlock[5] = v21;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1000048E4;
    aBlock[3] = (uint64_t)&unk_100008568;
    uint64_t v22 = _Block_copy(aBlock);
    v23 = a2;
    swift_unknownObjectRetain();
    swift_release();
    [v20 requestSessionAccessoryIdentifierWithCompletion:v22];
    _Block_release(v22);
    swift_unknownObjectRelease();
    return swift_errorRelease();
  }
LABEL_21:
  __break(1u);
  return result;
}

void sub_100004878(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_1000048E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  uint64_t v5 = sub_1000065C8();
  uint64_t v7 = v6;
  swift_retain();
  id v8 = a3;
  v4(v5, v7, a3);
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_100004978(char a1)
{
  uint64_t v2 = sub_100006538();
  uint64_t v44 = *(void *)(v2 - 8);
  uint64_t v45 = v2;
  ((void (*)(void))__chkstk_darwin)();
  v43 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006568();
  uint64_t v41 = *(void *)(v4 - 8);
  uint64_t v42 = v4;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v40 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006588();
  uint64_t v38 = *(void *)(v6 - 8);
  uint64_t v39 = v6;
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v37 - v10;
  uint64_t v12 = sub_100006548();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  os_log_type_t v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = -901;
  uint64_t v17 = 0;
  char v18 = 0;
  char v19 = a1;
  switch(a1)
  {
    case 1:
      uint64_t v16 = -900;
      char v18 = 1;
      goto LABEL_6;
    case 2:
      char v18 = 0;
      uint64_t v16 = -3;
      goto LABEL_6;
    case 3:
      char v18 = 0;
      uint64_t v16 = -2;
      goto LABEL_6;
    case 4:
      char v18 = 0;
      uint64_t v16 = -1;
      goto LABEL_6;
    case 5:
      goto LABEL_10;
    default:
LABEL_6:
      sub_100006608();
      if (qword_10000CBB0 != -1) {
        swift_once();
      }
      sub_100006528();
      v20 = *(void **)(v46 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_responder);
      if (!v20)
      {
        __break(1u);
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
      [v20 clearAllowSessionAccessoryDisconnect];
      double v21 = 0.0;
      uint64_t v17 = v16;
      if (v18) {
        goto LABEL_13;
      }
LABEL_10:
      uint64_t v22 = *(void *)(v46 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_inputs);
      if (!v22) {
        goto LABEL_19;
      }
      uint64_t v23 = v22 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDuration;
      if (*(unsigned char *)(v23 + 8))
      {
LABEL_20:
        __break(1u);
        JUMPOUT(0x100005004);
      }
      double v21 = (double)*(unint64_t *)v23;
      uint64_t v16 = v17;
LABEL_13:
      os_log_type_t v24 = sub_100006618();
      if (qword_10000CBB0 != -1) {
        swift_once();
      }
      uint64_t v25 = qword_10000CE20;
      if (os_log_type_enabled((os_log_t)qword_10000CE20, v24))
      {
        uint64_t v26 = swift_slowAlloc();
        *(_DWORD *)uint64_t v26 = 134218240;
        aBlock[0] = v16;
        sub_100006668();
        *(_WORD *)(v26 + 12) = 2048;
        *(double *)aBlock = v21;
        sub_100006668();
        _os_log_impl((void *)&_mh_execute_header, v25, v24, "Test finished with status code %ld. Will end test after %f seconds", (uint8_t *)v26, 0x16u);
        swift_slowDealloc();
      }
      sub_1000052F4();
      (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for DispatchQoS.QoSClass.default(_:), v12);
      uint64_t v37 = sub_100006648();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      sub_100006578();
      v27 = v11;
      sub_100006598();
      uint64_t v28 = v39;
      uint64_t v38 = *(void *)(v38 + 8);
      ((void (*)(char *, uint64_t))v38)(v9, v39);
      uint64_t v29 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v30 = swift_allocObject();
      *(void *)(v30 + 16) = v29;
      *(unsigned char *)(v30 + 24) = v19;
      aBlock[4] = sub_1000053A4;
      aBlock[5] = v30;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000040C4;
      aBlock[3] = &unk_100008450;
      v31 = _Block_copy(aBlock);
      swift_retain();
      v32 = v40;
      sub_100006558();
      v47 = &_swiftEmptyArrayStorage;
      sub_1000053C8();
      sub_100005420(&qword_10000CC70);
      sub_100005464();
      uint64_t v33 = v43;
      uint64_t v34 = v45;
      sub_100006688();
      uint64_t v35 = (void *)v37;
      sub_100006628();
      _Block_release(v31);

      (*(void (**)(char *, uint64_t))(v44 + 8))(v33, v34);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v32, v42);
      ((void (*)(char *, uint64_t))v38)(v27, v28);
      swift_release();
      return swift_release();
  }
}

void sub_10000501C()
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v1 = Strong;
    if (([Strong isFinished] & 1) == 0)
    {
      sub_100006618();
      if (qword_10000CBB0 != -1) {
        swift_once();
      }
      sub_100006528();
      id v2 = [v1 result];
      Class isa = sub_1000065F8().super.super.isa;
      [v2 setStatusCode:isa];

      [v1 setFinished:1];
    }
  }
}

uint64_t sub_100005154(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_100005240()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OnDemandAudioDiagnosticTriggerController();
  return [super dealloc];
}

uint64_t type metadata accessor for OnDemandAudioDiagnosticTriggerController()
{
  return self;
}

unint64_t sub_1000052F4()
{
  unint64_t result = qword_10000CC60;
  if (!qword_10000CC60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000CC60);
  }
  return result;
}

uint64_t sub_100005334()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000536C()
{
  swift_release();

  return _swift_deallocObject(v0, 25, 7);
}

void sub_1000053A4()
{
}

uint64_t sub_1000053B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000053C0()
{
  return swift_release();
}

unint64_t sub_1000053C8()
{
  unint64_t result = qword_10000CC68;
  if (!qword_10000CC68)
  {
    sub_100006538();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CC68);
  }
  return result;
}

uint64_t sub_100005420(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005464()
{
  unint64_t result = qword_10000CC78;
  if (!qword_10000CC78)
  {
    sub_1000054C0(&qword_10000CC70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000CC78);
  }
  return result;
}

uint64_t sub_1000054C0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005508()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100005540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100004178(a1, a2, a3, *(char **)(v3 + 16));
}

void sub_100005548()
{
}

uint64_t sub_100005550(uint64_t a1)
{
  return sub_100004400(a1, *(char **)(v1 + 16));
}

uint64_t sub_100005558(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000562C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100005838((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100005838((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000057E8((uint64_t)v12);
  return v7;
}

uint64_t sub_10000562C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_100006678();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100005894(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_1000066A8();
  if (!v8)
  {
    sub_1000066B8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000066C8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1000057E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100005838(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100005894(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000592C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005B0C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005B0C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000592C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_100005AA4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006698();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000066B8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000065E8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000066C8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000066B8();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100005AA4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100005420((uint64_t *)&unk_10000CC80);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100005B0C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    sub_100005420((uint64_t *)&unk_10000CC80);
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
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1000066C8();
  __break(1u);
  return result;
}

uint64_t sub_100005C8C(uint64_t result)
{
  if (!result)
  {
    __break(1u);
    return result;
  }
  uint64_t v2 = v1;
  uint64_t v3 = result;
  if (!*(void *)(result + 16))
  {
    long long v30 = 0u;
    long long v31 = 0u;
    goto LABEL_10;
  }
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeoutKey);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeoutKey + 8);
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10000636C(v5, v4);
  if ((v7 & 1) == 0)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  sub_100005838(*(void *)(v3 + 56) + 32 * v6, (uint64_t)&v30);
  swift_bridgeObjectRelease();
  if (!*((void *)&v31 + 1))
  {
LABEL_10:
    sub_1000063E4((uint64_t)&v30);
    goto LABEL_11;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    uint64_t v8 = 10;
    goto LABEL_12;
  }
  uint64_t v8 = v29;
  if (v29 - 61 < 0xFFFFFFFFFFFFFFC4) {
    return 0;
  }
LABEL_12:
  uint64_t v9 = v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeout;
  *(void *)uint64_t v9 = v8;
  *(unsigned char *)(v9 + 8) = 0;
  if (!*(void *)(v3 + 16))
  {
    long long v30 = 0u;
    long long v31 = 0u;
LABEL_21:
    sub_1000063E4((uint64_t)&v30);
    goto LABEL_22;
  }
  uint64_t v11 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCountKey);
  uint64_t v10 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCountKey + 8);
  swift_bridgeObjectRetain();
  unint64_t v12 = sub_10000636C(v11, v10);
  if (v13)
  {
    sub_100005838(*(void *)(v3 + 56) + 32 * v12, (uint64_t)&v30);
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v31 + 1)) {
    goto LABEL_21;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_22:
    os_log_type_t v15 = &OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeout;
    uint64_t v14 = 10;
    goto LABEL_23;
  }
  uint64_t v14 = v29;
  if (!v29) {
    return 0;
  }
  os_log_type_t v15 = &OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCount;
LABEL_23:
  uint64_t v16 = v2 + *v15;
  *(void *)uint64_t v16 = v14;
  *(unsigned char *)(v16 + 8) = 0;
  if (!*(void *)(v3 + 16))
  {
    long long v30 = 0u;
    long long v31 = 0u;
LABEL_32:
    sub_1000063E4((uint64_t)&v30);
    goto LABEL_33;
  }
  uint64_t v18 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeoutKey);
  uint64_t v17 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeoutKey + 8);
  swift_bridgeObjectRetain();
  unint64_t v19 = sub_10000636C(v18, v17);
  if (v20)
  {
    sub_100005838(*(void *)(v3 + 56) + 32 * v19, (uint64_t)&v30);
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v31 + 1)) {
    goto LABEL_32;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_33:
    uint64_t v21 = 300;
    goto LABEL_34;
  }
  uint64_t v21 = v29;
  if (v29 - 601 < 0xFFFFFFFFFFFFFDC5) {
    return 0;
  }
LABEL_34:
  uint64_t v22 = v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeout;
  *(void *)uint64_t v22 = v21;
  *(unsigned char *)(v22 + 8) = 0;
  if (!*(void *)(v3 + 16))
  {
    long long v30 = 0u;
    long long v31 = 0u;
LABEL_44:
    sub_1000063E4((uint64_t)&v30);
    goto LABEL_45;
  }
  uint64_t v24 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationKey);
  uint64_t v23 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationKey + 8);
  swift_bridgeObjectRetain();
  unint64_t v25 = sub_10000636C(v24, v23);
  if (v26)
  {
    sub_100005838(*(void *)(v3 + 56) + 32 * v25, (uint64_t)&v30);
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v31 + 1)) {
    goto LABEL_44;
  }
  if (swift_dynamicCast())
  {
    unint64_t v27 = v29;
    if (*(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationMax) < v29
      || v29 < *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationMin))
    {
      return 0;
    }
    goto LABEL_46;
  }
LABEL_45:
  unint64_t v27 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationDefault);
LABEL_46:
  uint64_t v28 = v2 + OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDuration;
  *(void *)uint64_t v28 = v27;
  *(unsigned char *)(v28 + 8) = 0;
  return 1;
}

id sub_1000060A0()
{
  uint64_t v1 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeoutKey];
  strcpy(&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeoutKey], "triggerTimeout");
  v1[15] = -18;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeoutMin] = 1;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeoutMax] = 60;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeoutDefault] = 10;
  uint64_t v2 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCountKey];
  *(void *)uint64_t v2 = 0x756F437972746572;
  *((void *)v2 + 1) = 0xEA0000000000746ELL;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCountMin] = 1;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCountMax] = -1;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCountDefault] = 1;
  uint64_t v3 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeoutKey];
  *(void *)uint64_t v3 = 0xD000000000000018;
  *((void *)v3 + 1) = 0x80000001000074A0;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeoutMin] = 30;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeoutMax] = 600;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeoutDefault] = 300;
  uint64_t v4 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationKey];
  *(void *)uint64_t v4 = 0xD00000000000001BLL;
  *((void *)v4 + 1) = 0x80000001000074C0;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationMin] = 0;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationMax] = 60;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDurationDefault] = 0;
  uint64_t v5 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_triggerTimeout];
  *(void *)uint64_t v5 = 0;
  v5[8] = 1;
  unint64_t v6 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_retryCount];
  *(void *)unint64_t v6 = 0;
  v6[8] = 1;
  char v7 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_hostAppDisconnectTimeout];
  *(void *)char v7 = 0;
  v7[8] = 1;
  uint64_t v8 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticTriggerInputs_delayExitWorkaroundDuration];
  *(void *)uint64_t v8 = 0;
  v8[8] = 1;
  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for OnDemandAudioDiagnosticTriggerInputs();
  return [super init];
}

id sub_100006298()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OnDemandAudioDiagnosticTriggerInputs();
  return [super dealloc];
}

uint64_t type metadata accessor for OnDemandAudioDiagnosticTriggerInputs()
{
  return self;
}

unint64_t sub_10000636C(uint64_t a1, uint64_t a2)
{
  sub_1000066F8();
  sub_1000065D8();
  Swift::Int v4 = sub_100006708();

  return sub_100006444(a1, a2, v4);
}

uint64_t sub_1000063E4(uint64_t a1)
{
  uint64_t v2 = sub_100005420(&qword_10000CE18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100006444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    objc_super v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1000066D8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1000066D8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100006528()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100006538()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100006548()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_100006558()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100006568()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100006578()
{
  return static DispatchTime.now()();
}

uint64_t sub_100006588()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_100006598()
{
  return + infix(_:_:)();
}

uint64_t sub_1000065A8()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_1000065B8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000065C8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000065D8()
{
  return String.hash(into:)();
}

Swift::Int sub_1000065E8()
{
  return String.UTF8View._foreignCount()();
}

NSNumber sub_1000065F8()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_100006608()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006618()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100006628()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_100006638()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100006648()
{
  return static OS_dispatch_queue.global(qos:)();
}

NSNumber sub_100006658()
{
  return UInt._bridgeToObjectiveC()();
}

uint64_t sub_100006668()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006678()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100006688()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100006698()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000066A8()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000066B8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000066C8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000066D8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000066E8()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_1000066F8()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100006708()
{
  return Hasher._finalize()();
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}