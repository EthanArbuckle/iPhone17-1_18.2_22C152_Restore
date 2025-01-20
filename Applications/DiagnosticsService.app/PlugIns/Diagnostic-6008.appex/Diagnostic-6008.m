id sub_100003328()
{
  id result;

  result = (id)DiagnosticLogHandleForCategory();
  qword_100011A10 = (uint64_t)result;
  return result;
}

void sub_100003354(uint64_t a1, void *a2)
{
  *(void *)&v2[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_responder] = a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v11[4] = sub_100008150;
  v11[5] = v5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100003708;
  v11[3] = &unk_10000C748;
  v6 = _Block_copy(v11);
  swift_release();
  [a2 requestSessionAccessoryIdentifierWithCompletion:v6];
  _Block_release(v6);
  if (a1 && (type metadata accessor for OnDemandAudioDiagnosticMonitorInputs(), (uint64_t v7 = swift_dynamicCastClass()) != 0))
  {
    v8 = *(void **)&v2[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs];
    *(void *)&v2[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs] = v7;
    swift_unknownObjectRetain();
  }
  else
  {
    id v9 = [v2 result];
    Class isa = sub_100009438().super.super.isa;
    [v9 setStatusCode:isa];

    [v2 setFinished:1];
  }
}

void sub_1000034E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v7 = (void *)Strong;
    if (a3)
    {
      swift_errorRetain();
      os_log_type_t v8 = sub_100009448();
      if (qword_100011350 != -1) {
        swift_once();
      }
      id v9 = qword_100011A10;
      if (os_log_type_enabled((os_log_t)qword_100011A10, v8))
      {
        swift_errorRetain();
        swift_errorRetain();
        v10 = (uint8_t *)swift_slowAlloc();
        uint64_t v14 = swift_slowAlloc();
        *(_DWORD *)v10 = 136315138;
        swift_getErrorValue();
        uint64_t v11 = sub_1000095B8();
        sub_100006DEC(v11, v12, &v14);
        sub_1000094C8();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v9, v8, "Unable to get accessory identifier from host app with error %s", v10, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      sub_1000060C8(0);
      swift_errorRelease();
    }
    else
    {
      v13 = (void *)(Strong + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_targetUUID);
      void *v13 = a1;
      v13[1] = a2;
      swift_bridgeObjectRetain();

      swift_bridgeObjectRelease();
    }
  }
}

void sub_100003708(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  uint64_t v5 = sub_1000093E8();
  uint64_t v7 = v6;
  swift_retain();
  id v8 = a3;
  v4(v5, v7, a3);
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_100003824()
{
  uint64_t v1 = v0;
  uint64_t v25 = sub_100009348();
  uint64_t v27 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100009378();
  uint64_t v26 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100009398();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v22 - v12;
  sub_100006C74();
  uint64_t v14 = sub_100009498();
  uint64_t result = sub_100009388();
  uint64_t v16 = *(void *)(v1 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs);
  if (v16)
  {
    v23 = (void *)v14;
    uint64_t v24 = v4;
    if ((*(unsigned char *)(v16 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDuration + 8) & 1) == 0)
    {
      sub_1000093A8();
      v22 = *(void (**)(char *, uint64_t))(v8 + 8);
      uint64_t v17 = v7;
      v22(v11, v7);
      uint64_t v18 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = sub_100008138;
      aBlock[5] = v18;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100004408;
      aBlock[3] = &unk_10000C6D0;
      v19 = _Block_copy(aBlock);
      swift_release();
      sub_100009368();
      aBlock[0] = &_swiftEmptyArrayStorage;
      sub_1000080A0(&qword_100011420, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100006D48(&qword_100011428);
      sub_1000080E8(&qword_100011430, &qword_100011428);
      uint64_t v20 = v25;
      sub_1000094E8();
      v21 = v23;
      sub_100009478();
      _Block_release(v19);

      (*(void (**)(char *, uint64_t))(v27 + 8))(v3, v20);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v6, v24);
      return ((uint64_t (*)(char *, uint64_t))v22)(v13, v17);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_100003C10()
{
  swift_beginAccess();
  uint64_t Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    if (([Strong isFinished] & 1) != 0
      || ([v1 isCancelled] & 1) != 0)
    {
LABEL_15:

      return;
    }
    uint64_t v2 = OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs;
    uint64_t v3 = *(void *)&v1[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs];
    if (v3)
    {
      int v4 = *(unsigned __int8 *)(v3 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioEnabled);
      if (v4 != 2)
      {
        if (v4) {
          sub_1000044A4();
        }
        uint64_t v5 = *(void **)&v1[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_responder];
        if (v5)
        {
          if ([*(id *)&v1[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_responder] respondsToSelector:"displayAlertWithHeader:message:buttonStrings:completion:"])
          {
            uint64_t v6 = *(void *)&v1[v2];
            if (v6)
            {
              if (*(void *)(v6 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertHeader + 8))
              {
                if (*(void *)(v6 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertMessage + 8))
                {
                  sub_100006D48(&qword_100011470);
                  uint64_t v7 = swift_allocObject();
                  *(_OWORD *)(v7 + 16) = xmmword_100009A70;
                  uint64_t v8 = *(void *)(v6 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertButton + 8);
                  if (v8)
                  {
                    *(void *)(v7 + 32) = *(void *)(v6
                                                     + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertButton);
                    *(void *)(v7 + 40) = v8;
                    uint64_t v9 = swift_allocObject();
                    swift_unknownObjectWeakInit();
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    swift_unknownObjectRetain();
                    swift_bridgeObjectRetain();
                    swift_retain();
                    NSString v10 = sub_1000093D8();
                    NSString v11 = sub_1000093D8();
                    Class isa = sub_100009428().super.isa;
                    aBlock[4] = sub_100008140;
                    aBlock[5] = v9;
                    aBlock[0] = _NSConcreteStackBlock;
                    aBlock[1] = 1107296256;
                    aBlock[2] = sub_100003F04;
                    aBlock[3] = &unk_10000C6F8;
                    v13 = _Block_copy(aBlock);
                    swift_retain();
                    [v5 displayAlertWithHeader:v10 message:v11 buttonStrings:isa completion:v13];
                    _Block_release(v13);

                    swift_bridgeObjectRelease();
                    swift_release_n();

                    swift_unknownObjectRelease();
                    swift_release();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    return;
                  }
                  goto LABEL_23;
                }
LABEL_22:
                __break(1u);
LABEL_23:
                __break(1u);
                return;
              }
LABEL_21:
              __break(1u);
              goto LABEL_22;
            }
LABEL_20:
            __break(1u);
            goto LABEL_21;
          }
          goto LABEL_15;
        }
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_19;
  }
}

void sub_100003F04(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, a3);
  swift_release();
}

uint64_t sub_100003F90()
{
  uint64_t v0 = sub_100009348();
  uint64_t v27 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100009378();
  uint64_t v26 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100009398();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  NSString v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v21 - v11;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v14 = (char *)result;
    *(unsigned char *)(result + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_openLidAlertDismissed) = 1;
    sub_100004C7C();
    sub_100006C74();
    uint64_t v15 = sub_100009498();
    uint64_t result = sub_100009388();
    uint64_t v16 = *(void *)&v14[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs];
    if (v16)
    {
      uint64_t v24 = (void *)v15;
      uint64_t v25 = v3;
      if ((*(unsigned char *)(v16 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeout + 8) & 1) == 0)
      {
        sub_1000093A8();
        uint64_t v17 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
        uint64_t v22 = v6;
        v23 = v17;
        v17(v10, v6);
        uint64_t v18 = swift_allocObject();
        swift_unknownObjectWeakInit();
        aBlock[4] = sub_100008148;
        aBlock[5] = v18;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_100004408;
        aBlock[3] = &unk_10000C720;
        v19 = _Block_copy(aBlock);
        swift_release();
        sub_100009368();
        aBlock[0] = &_swiftEmptyArrayStorage;
        sub_1000080A0(&qword_100011420, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_100006D48(&qword_100011428);
        sub_1000080E8(&qword_100011430, &qword_100011428);
        sub_1000094E8();
        uint64_t v20 = v24;
        sub_100009478();
        _Block_release(v19);

        (*(void (**)(char *, uint64_t))(v27 + 8))(v2, v0);
        (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v25);
        return v23(v12, v22);
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

void sub_1000043B0()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_1000060C8(2);
  }
}

void sub_1000044A4()
{
  uint64_t v1 = v0 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_audioAlertPlaybackStartTime;
  if (*(unsigned char *)(v0 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_audioAlertPlaybackStartTime + 8))
  {
    *(void *)uint64_t v1 = 0x41CD27E440000000;
    *(unsigned char *)(v1 + 8) = 0;
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs);
    if (!v2)
    {
LABEL_11:
      __break(1u);
      goto LABEL_12;
    }
LABEL_3:
    uint64_t v3 = v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertSoundID;
    if ((*(unsigned char *)(v3 + 4) & 1) == 0)
    {
      SystemSoundID v4 = *(_DWORD *)v3;
      uint64_t v5 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v7[4] = sub_100008090;
      v7[5] = v5;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 1107296256;
      v7[2] = sub_100004408;
      v7[3] = &unk_10000C680;
      uint64_t v6 = _Block_copy(v7);
      swift_release();
      AudioServicesPlayAlertSoundWithCompletion(v4, v6);
      _Block_release(v6);
      return;
    }
    __break(1u);
    goto LABEL_11;
  }
  if ((*(unsigned char *)(v0 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_openLidAlertDismissed) & 1) == 0)
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs);
    if (!v2)
    {
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
    if (*(unsigned char *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDuration + 8))
    {
LABEL_13:
      __break(1u);
      return;
    }
    if (*(double *)v1
       + (double)*(unint64_t *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDuration) >= 978307200.0)
      goto LABEL_3;
  }
}

void sub_100004634()
{
  uint64_t v0 = sub_100009348();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v33 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_100009378();
  uint64_t v32 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  SystemSoundID v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_100009398();
  uint64_t v31 = *(void *)(v35 - 8);
  uint64_t v5 = __chkstk_darwin(v35);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v28 - v8;
  uint64_t v10 = sub_100009358();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v15 = Strong;
    uint64_t v30 = v1;
    uint64_t v16 = v0;
    uint64_t v17 = OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs;
    uint64_t v18 = *(void *)&Strong[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs];
    if (v18)
    {
      int v19 = *(unsigned __int8 *)(v18 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoops);
      if (v19 != 2)
      {
        if ((v19 & 1) == 0)
        {

          return;
        }
        sub_100006C74();
        (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for DispatchQoS.QoSClass.userInteractive(_:), v10);
        uint64_t v20 = sub_1000094B8();
        (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
        sub_100009388();
        uint64_t v21 = *(void *)&v15[v17];
        if (v21)
        {
          v29 = (void *)v20;
          char v22 = *(unsigned char *)(v21 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelay + 8);
          uint64_t v28 = v16;
          if ((v22 & 1) == 0)
          {
            sub_1000093A8();
            uint64_t v31 = *(void *)(v31 + 8);
            ((void (*)(char *, uint64_t))v31)(v7, v35);
            uint64_t v23 = swift_allocObject();
            swift_unknownObjectWeakInit();
            aBlock[4] = sub_100008098;
            aBlock[5] = v23;
            aBlock[0] = _NSConcreteStackBlock;
            aBlock[1] = 1107296256;
            aBlock[2] = sub_100004408;
            aBlock[3] = &unk_10000C6A8;
            uint64_t v24 = _Block_copy(aBlock);
            swift_retain();
            sub_100009368();
            v36 = &_swiftEmptyArrayStorage;
            sub_1000080A0(&qword_100011420, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
            sub_100006D48(&qword_100011428);
            sub_1000080E8(&qword_100011430, &qword_100011428);
            uint64_t v25 = v33;
            uint64_t v26 = v28;
            sub_1000094E8();
            uint64_t v27 = v29;
            sub_100009478();
            _Block_release(v24);

            (*(void (**)(char *, uint64_t))(v30 + 8))(v25, v26);
            (*(void (**)(char *, uint64_t))(v32 + 8))(v4, v34);
            ((void (*)(char *, uint64_t))v31)(v9, v35);
            swift_release();
            swift_release();
            return;
          }
LABEL_13:
          __break(1u);
          return;
        }
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_12;
  }
}

void sub_100004B64()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_1000044A4();
  }
}

uint64_t sub_100004BB8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_100004C7C()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_hearingModeClient);
  [v1 setDispatchQueue:*(void *)(v0 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_hearingModeDispatchQueue)];
  uint64_t v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = sub_100006DD4;
  uint64_t v13 = v2;
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 1107296256;
  uint64_t v10 = (void (*)(uint64_t, void *))sub_100004408;
  uint64_t v11 = &unk_10000C608;
  uint64_t v3 = _Block_copy(&v8);
  swift_release();
  [v1 setInterruptionHandler:v3];
  _Block_release(v3);
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = sub_100006DDC;
  uint64_t v13 = v4;
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 1107296256;
  uint64_t v10 = sub_100005E1C;
  uint64_t v11 = &unk_10000C630;
  uint64_t v5 = _Block_copy(&v8);
  swift_release();
  [v1 setDeviceDiagnosticRecordFoundHandler:v5];
  _Block_release(v5);
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = sub_100006DE4;
  uint64_t v13 = v6;
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 1107296256;
  uint64_t v10 = sub_10000605C;
  uint64_t v11 = &unk_10000C658;
  uint64_t v7 = _Block_copy(&v8);
  swift_release();
  [v1 activateWithCompletion:v7];
  _Block_release(v7);
}

void sub_100004EC0()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_100009448();
    if (qword_100011350 != -1) {
      swift_once();
    }
    sub_100009338();
    sub_1000060C8(3);
  }
}

void sub_100004F80(void *a1)
{
  uint64_t v2 = sub_100009328();
  uint64_t v117 = *(void *)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v104 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v104 - v6;
  uint64_t v8 = sub_100006D48((uint64_t *)&unk_100011440);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  v114 = (char *)&v104 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v104 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v104 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  int v19 = (char *)&v104 - v18;
  uint64_t v20 = __chkstk_darwin(v17);
  v113 = (char *)&v104 - v21;
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v104 - v22;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v25 = (char *)Strong;
    v111 = v19;
    v110 = v7;
    id v26 = [a1 bluetoothUUID];
    uint64_t v27 = sub_1000093E8();
    uint64_t v29 = v28;

    if (v27 == *(void *)&v25[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_targetUUID]
      && v29 == *(void *)&v25[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_targetUUID + 8])
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v30 = sub_100009598();
      swift_bridgeObjectRelease();
      if ((v30 & 1) == 0)
      {

        return;
      }
    }
    os_log_type_t v31 = sub_100009448();
    if (qword_100011350 != -1) {
      swift_once();
    }
    uint64_t v32 = qword_100011A10;
    BOOL v33 = os_log_type_enabled((os_log_t)qword_100011A10, v31);
    v116 = v25;
    uint64_t v115 = v2;
    v112 = v16;
    v109 = a1;
    if (v33)
    {
      id v34 = a1;
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      v106 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 138412290;
      os_log_t v107 = v32;
      v123[0] = v34;
      id v36 = v34;
      uint64_t v2 = v115;
      sub_1000094C8();
      *(void *)v106 = v34;
      uint64_t v25 = v116;

      a1 = v109;
      _os_log_impl((void *)&_mh_execute_header, v107, v31, "Recieved diagnostic record from HearingModeService client %@", v35, 0xCu);
      sub_100006D48(&qword_100011438);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v16 = v112;
      swift_slowDealloc();
    }
    id v37 = [self sharedFormatter];
    uint64_t v38 = (uint64_t)v111;
    if (v37)
    {
      v39 = v37;
      v40 = (char *)[v37 formatterWithType:0];

      id v41 = [a1 lastMeasurementTimestampLeft];
      v104 = v5;
      v108 = v13;
      if (v41)
      {
        v42 = v41;
        v43 = v113;
        sub_100009318();

        uint64_t v44 = v117;
        v45 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v117 + 56);
        v46 = v43;
        uint64_t v47 = 0;
      }
      else
      {
        uint64_t v44 = v117;
        v45 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v117 + 56);
        v43 = v113;
        v46 = v113;
        uint64_t v47 = 1;
      }
      v106 = v45;
      v45((uint64_t)v46, v47, 1, v2);
      sub_100007444((uint64_t)v43, (uint64_t)v23);
      v105 = v23;
      sub_1000074AC((uint64_t)v23, v38);
      os_log_t v107 = *(os_log_t *)(v44 + 48);
      int v48 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v107)(v38, 1, v2);
      v113 = v40;
      if (v48 == 1)
      {
        sub_100007538(v38, (uint64_t *)&unk_100011440);
        uint64_t v49 = (uint64_t)v114;
        uint64_t v50 = (uint64_t)v108;
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v44 + 32))(v110, v38, v2);
        id v51 = [v25 result];
        *(void *)&long long v121 = 0xD00000000000001CLL;
        *((void *)&v121 + 1) = 0x800000010000A290;
        sub_100009528();
        if (v40)
        {
          v52 = v40;
          Class isa = sub_100009308().super.isa;
          id v54 = [v52 stringFromDate:isa];

          uint64_t v55 = sub_1000093E8();
          uint64_t v57 = v56;

          *((void *)&v122 + 1) = &type metadata for String;
          *(void *)&long long v121 = v55;
          *((void *)&v121 + 1) = v57;
          v40 = v113;
        }
        else
        {
          long long v121 = 0u;
          long long v122 = 0u;
        }
        id v58 = [v51 data:v104];
        uint64_t v59 = sub_1000093C8();

        uint64_t v119 = v59;
        uint64_t v49 = (uint64_t)v114;
        uint64_t v50 = (uint64_t)v108;
        if (v40)
        {
          sub_1000076E4(&v121, v120);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v118 = v59;
          sub_100007BD8(v120, (uint64_t)v123, isUniquelyReferenced_nonNull_native);
          uint64_t v119 = v118;
          swift_bridgeObjectRelease();
          sub_100007690((uint64_t)v123);
        }
        else
        {
          sub_100007538((uint64_t)&v121, (uint64_t *)&unk_100011A00);
          sub_100007594((uint64_t)v123, v120);
          sub_100007690((uint64_t)v123);
          sub_100007538((uint64_t)v120, (uint64_t *)&unk_100011A00);
        }
        uint64_t v25 = v116;
        Class v61 = sub_1000093B8().super.isa;
        swift_bridgeObjectRelease();
        [v51 setData:v61];

        uint64_t v44 = v117;
        (*(void (**)(char *, uint64_t))(v117 + 8))(v110, v115);
        a1 = v109;
      }
      id v62 = [a1 lastMeasurementTimestampRight:v104];
      if (v62)
      {
        v63 = v62;
        sub_100009318();

        uint64_t v64 = 0;
      }
      else
      {
        uint64_t v64 = 1;
      }
      uint64_t v65 = v115;
      v106(v50, v64, 1, v115);
      sub_100007444(v50, (uint64_t)v16);
      sub_1000074AC((uint64_t)v16, v49);
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v107)(v49, 1, v65) == 1)
      {
        sub_100007538(v49, (uint64_t *)&unk_100011440);
        v66 = &OnDemandAudioDiagnosticMonitorController__metaData;
      }
      else
      {
        v67 = a1;
        v68 = v104;
        (*(void (**)(char *, uint64_t, uint64_t))(v44 + 32))(v104, v49, v65);
        id v69 = [v25 result];
        *(void *)&long long v121 = 0xD00000000000001DLL;
        *((void *)&v121 + 1) = 0x800000010000A270;
        sub_100009528();
        if (v40)
        {
          v70 = v40;
          Class v71 = sub_100009308().super.isa;
          id v72 = [v70 stringFromDate:v71];

          uint64_t v73 = sub_1000093E8();
          uint64_t v75 = v74;

          *((void *)&v122 + 1) = &type metadata for String;
          *(void *)&long long v121 = v73;
          *((void *)&v121 + 1) = v75;
          v40 = v113;
        }
        else
        {
          long long v121 = 0u;
          long long v122 = 0u;
        }
        id v76 = [v69 data];
        uint64_t v77 = sub_1000093C8();

        uint64_t v119 = v77;
        if (v40)
        {
          sub_1000076E4(&v121, v120);
          char v78 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v118 = v77;
          sub_100007BD8(v120, (uint64_t)v123, v78);
          uint64_t v119 = v118;
          swift_bridgeObjectRelease();
          sub_100007690((uint64_t)v123);
        }
        else
        {
          sub_100007538((uint64_t)&v121, (uint64_t *)&unk_100011A00);
          sub_100007594((uint64_t)v123, v120);
          sub_100007690((uint64_t)v123);
          sub_100007538((uint64_t)v120, (uint64_t *)&unk_100011A00);
        }
        Class v79 = sub_1000093B8().super.isa;
        swift_bridgeObjectRelease();
        [v69 setData:v79];

        (*(void (**)(char *, uint64_t))(v117 + 8))(v68, v115);
        a1 = v67;
        v66 = &OnDemandAudioDiagnosticMonitorController__metaData;
      }
      unsigned int v80 = [a1 latestMeasurementResultLeft];
      LODWORD(v117) = v80;
      unsigned int v81 = [a1 latestMeasurementResultRight];
      LODWORD(v115) = v81;
      sub_100007514(v80);
      uint64_t v82 = sub_100009408();
      uint64_t v84 = v83;
      sub_100007514(v81);
      v114 = (char *)sub_100009408();
      v111 = v85;
      v86 = v116;
      id v87 = [v116 v66[48].base_prots];
      *(void *)&long long v121 = 0xD00000000000001FLL;
      *((void *)&v121 + 1) = 0x800000010000A220;
      sub_100009528();
      *((void *)&v122 + 1) = &type metadata for String;
      *(void *)&long long v121 = v82;
      *((void *)&v121 + 1) = v84;
      id v88 = [v87 data];
      uint64_t v89 = sub_1000093C8();

      sub_1000076E4(&v121, v120);
      char v90 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v119 = v89;
      sub_100007BD8(v120, (uint64_t)v123, v90);
      swift_bridgeObjectRelease();
      sub_100007690((uint64_t)v123);
      Class v91 = sub_1000093B8().super.isa;
      swift_bridgeObjectRelease();
      [v87 setData:v91];

      id v92 = [v86 v66[48].base_prots];
      *(void *)&long long v121 = 0xD000000000000020;
      *((void *)&v121 + 1) = 0x800000010000A240;
      sub_100009528();
      *((void *)&v122 + 1) = &type metadata for String;
      *(void *)&long long v121 = v114;
      *((void *)&v121 + 1) = v111;
      id v93 = [v92 data];
      uint64_t v94 = sub_1000093C8();

      sub_1000076E4(&v121, v120);
      char v95 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v119 = v94;
      sub_100007BD8(v120, (uint64_t)v123, v95);
      swift_bridgeObjectRelease();
      sub_100007690((uint64_t)v123);
      Class v96 = sub_1000093B8().super.isa;
      uint64_t v97 = v115;
      swift_bridgeObjectRelease();
      [v92 setData:v96];

      uint64_t v98 = v117;
      if ((sub_100005DB8(v98, (uint64_t)&off_10000C540) & 1) != 0
        && (sub_100005DB8(v97, (uint64_t)&off_10000C540) & 1) != 0)
      {
        char v99 = 7;
        uint64_t v100 = (uint64_t)v112;
      }
      else
      {
        char v101 = sub_100005DB8(v98, (uint64_t)&off_10000C568);
        uint64_t v100 = (uint64_t)v112;
        if (v101)
        {
          char v99 = 6;
        }
        else if (sub_100005DB8(v97, (uint64_t)&off_10000C568))
        {
          char v99 = 6;
        }
        else
        {
          char v99 = 5;
        }
      }
      uint64_t v102 = (uint64_t)v105;
      v103 = v116;
      sub_1000060C8(v99);

      sub_100007538(v100, (uint64_t *)&unk_100011440);
      sub_100007538(v102, (uint64_t *)&unk_100011440);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_100005DB8(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(_DWORD *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 9; ; ++i)
  {
    uint64_t v4 = i - 7;
    if (__OFADD__(i - 8, 1)) {
      break;
    }
    BOOL v6 = *(_DWORD *)(a2 + 4 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

void sub_100005E1C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_100005E84(uint64_t a1)
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = Strong;
    if (a1)
    {
      swift_errorRetain();
      os_log_type_t v4 = sub_100009448();
      if (qword_100011350 != -1) {
        swift_once();
      }
      BOOL v5 = qword_100011A10;
      os_log_type_t v6 = v4;
      if (os_log_type_enabled((os_log_t)qword_100011A10, v4))
      {
        swift_errorRetain();
        swift_errorRetain();
        uint64_t v7 = (uint8_t *)swift_slowAlloc();
        uint64_t v8 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v7 = 138412290;
        swift_errorRetain();
        uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
        sub_1000094C8();
        void *v8 = v9;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Failed to activate HearingModeService client with error %@", v7, 0xCu);
        sub_100006D48(&qword_100011438);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      sub_1000060C8(4);

      swift_errorRelease();
    }
    else
    {
    }
  }
}

void sub_10000605C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_1000060C8(char a1)
{
  uint64_t v3 = sub_100009348();
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v46 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100009378();
  uint64_t v45 = *(void *)(v6 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v44 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100009398();
  uint64_t v42 = *(void *)(v8 - 8);
  uint64_t v43 = v8;
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v41 = (char *)&v36 - v12;
  uint64_t v13 = sub_100009358();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = v1;
  uint64_t v17 = *(void **)(v1 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_responder);
  if (!v17)
  {
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    JUMPOUT(0x100006730);
  }
  [v17 clearAllowSessionAccessoryDisconnect];
  double v18 = 0.0;
  uint64_t v19 = -900;
  uint64_t v20 = -901;
  switch(a1)
  {
    case 1:
      goto LABEL_12;
    case 2:
      uint64_t v20 = -5;
      goto LABEL_9;
    case 3:
      uint64_t v20 = -4;
      goto LABEL_9;
    case 4:
      uint64_t v20 = -3;
      goto LABEL_9;
    case 5:
      uint64_t v20 = -2;
      goto LABEL_9;
    case 6:
      uint64_t v20 = -1;
      goto LABEL_9;
    case 7:
      uint64_t v20 = 0;
      goto LABEL_9;
    default:
LABEL_9:
      uint64_t v21 = *(void *)(v47 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs);
      if (!v21) {
        goto LABEL_18;
      }
      uint64_t v22 = v21 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDuration;
      if (*(unsigned char *)(v22 + 8)) {
        goto LABEL_19;
      }
      double v18 = (double)*(unint64_t *)v22;
      uint64_t v19 = v20;
LABEL_12:
      uint64_t v39 = v4;
      uint64_t v40 = v3;
      os_log_type_t v23 = sub_100009458();
      if (qword_100011350 != -1) {
        swift_once();
      }
      uint64_t v38 = v6;
      uint64_t v24 = qword_100011A10;
      if (os_log_type_enabled((os_log_t)qword_100011A10, v23))
      {
        uint64_t v25 = swift_slowAlloc();
        *(_DWORD *)uint64_t v25 = 134218240;
        aBlock[0] = v19;
        sub_1000094C8();
        *(_WORD *)(v25 + 12) = 2048;
        *(double *)aBlock = v18;
        sub_1000094C8();
        _os_log_impl((void *)&_mh_execute_header, v24, v23, "Test finished with status code %ld. Will end test after %f seconds", (uint8_t *)v25, 0x16u);
        swift_slowDealloc();
      }
      sub_100006C74();
      (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, enum case for DispatchQoS.QoSClass.default(_:), v13);
      uint64_t v37 = sub_1000094B8();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
      sub_100009388();
      id v26 = v41;
      sub_1000093A8();
      uint64_t v27 = v43;
      uint64_t v42 = *(void *)(v42 + 8);
      ((void (*)(char *, uint64_t))v42)(v11, v43);
      uint64_t v28 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v29 = swift_allocObject();
      *(void *)(v29 + 16) = v28;
      *(unsigned char *)(v29 + 24) = a1;
      aBlock[4] = sub_100006D24;
      aBlock[5] = v29;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100004408;
      aBlock[3] = &unk_10000C5E0;
      char v30 = _Block_copy(aBlock);
      swift_retain();
      os_log_type_t v31 = v44;
      sub_100009368();
      int v48 = &_swiftEmptyArrayStorage;
      sub_1000080A0(&qword_100011420, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100006D48(&qword_100011428);
      sub_1000080E8(&qword_100011430, &qword_100011428);
      uint64_t v32 = v46;
      uint64_t v33 = v40;
      sub_1000094E8();
      id v34 = (void *)v37;
      sub_100009478();
      _Block_release(v30);

      (*(void (**)(char *, uint64_t))(v39 + 8))(v32, v33);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v31, v38);
      ((void (*)(char *, uint64_t))v42)(v26, v27);
      swift_release();
      return swift_release();
  }
}

void sub_100006750()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    if (([Strong isFinished] & 1) == 0)
    {
      sub_100009458();
      if (qword_100011350 != -1) {
        swift_once();
      }
      sub_100009338();
      id v2 = [v1 result];
      Class isa = sub_100009438().super.super.isa;
      [v2 setStatusCode:isa];

      [v1 setFinished:1];
    }
  }
}

id sub_100006888()
{
  uint64_t v15 = sub_100009488();
  uint64_t v1 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100009468();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_100009378();
  __chkstk_darwin(v5 - 8);
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_inputs] = 0;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_responder] = 0;
  uint64_t v6 = OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_hearingModeClient;
  id v7 = objc_allocWithZone((Class)HMServiceClient);
  uint64_t v8 = v0;
  *(void *)&v0[v6] = [v7 init];
  uint64_t v14 = OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_hearingModeDispatchQueue;
  sub_100006C74();
  sub_100009368();
  uint64_t v17 = &_swiftEmptyArrayStorage;
  sub_1000080A0(&qword_100011458, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100006D48(&qword_100011460);
  sub_1000080E8(&qword_100011468, &qword_100011460);
  sub_1000094E8();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v15);
  *(void *)&v8[v14] = sub_1000094A8();
  uint64_t v9 = &v8[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_audioAlertPlaybackStartTime];
  *(void *)uint64_t v9 = 0;
  v9[8] = 1;
  v8[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_openLidAlertDismissed] = 0;
  uint64_t v10 = &v8[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_targetUUID];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0xE000000000000000;

  uint64_t v11 = (objc_class *)type metadata accessor for OnDemandAudioDiagnosticMonitorController();
  v16.receiver = v8;
  v16.super_class = v11;
  return [super init];
}

id sub_100006B9C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OnDemandAudioDiagnosticMonitorController();
  [super dealloc];
}

uint64_t type metadata accessor for OnDemandAudioDiagnosticMonitorController()
{
  return self;
}

unint64_t sub_100006C74()
{
  unint64_t result = qword_100011418;
  if (!qword_100011418)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100011418);
  }
  return result;
}

uint64_t sub_100006CB4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006CEC()
{
  swift_release();

  return _swift_deallocObject(v0, 25, 7);
}

void sub_100006D24()
{
}

uint64_t sub_100006D30(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006D40()
{
  return swift_release();
}

uint64_t sub_100006D48(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006D8C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100006DD4()
{
}

void sub_100006DDC(void *a1)
{
}

void sub_100006DE4(uint64_t a1)
{
}

uint64_t sub_100006DEC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006EC0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100008034((uint64_t)v12, *a3);
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
      sub_100008034((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100007FE4((uint64_t)v12);
  return v7;
}

uint64_t sub_100006EC0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000094D8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000707C(a5, a6);
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
  uint64_t v8 = sub_100009548();
  if (!v8)
  {
    sub_100009558();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100009588();
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

uint64_t sub_10000707C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007114(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000072F4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000072F4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007114(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000728C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100009538();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100009558();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100009418();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100009588();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100009558();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000728C(uint64_t a1, uint64_t a2)
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
  sub_100006D48(&qword_100011478);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000072F4(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006D48(&qword_100011478);
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
  uint64_t result = sub_100009588();
  __break(1u);
  return result;
}

uint64_t sub_100007444(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006D48((uint64_t *)&unk_100011440);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000074AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006D48((uint64_t *)&unk_100011440);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

const char *sub_100007514(unsigned int a1)
{
  if (a1 > 8) {
    return "?";
  }
  else {
    return off_10000C770[a1];
  }
}

uint64_t sub_100007538(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006D48(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

double sub_100007594@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100009040(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v11 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100007DA0();
      uint64_t v9 = v11;
    }
    sub_100007690(*(void *)(v9 + 48) + 40 * v6);
    sub_1000076E4((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_100007A0C(v6, v9);
    uint64_t *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_100007690(uint64_t a1)
{
  return a1;
}

_OWORD *sub_1000076E4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000076F4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100006D48(&qword_100011450);
  uint64_t v6 = sub_100009578();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_1000076E4((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_100007F88(v25, (uint64_t)&v38);
      sub_100008034(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = sub_100009508(*(void *)(v7 + 40));
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_1000076E4(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_100007A0C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1000094F8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_100007F88(*(void *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        Swift::Int v10 = sub_100009508(*(void *)(a2 + 40));
        uint64_t result = sub_100007690((uint64_t)v28);
        Swift::Int v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= v11)
          {
LABEL_16:
            uint64_t v14 = *(void *)(a2 + 48);
            unint64_t v15 = v14 + 40 * v3;
            uint64_t v16 = (long long *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              long long v17 = *v16;
              long long v18 = v16[1];
              *(void *)(v15 + 32) = *((void *)v16 + 4);
              *(_OWORD *)unint64_t v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            unint64_t v20 = (_OWORD *)(v19 + 32 * v3);
            int64_t v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 2))
            {
              long long v9 = v21[1];
              *unint64_t v20 = *v21;
              v20[1] = v9;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << result) - 1;
  }
  *uint64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_100007BD8(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  unint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_100009040(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_100007DA0();
      goto LABEL_7;
    }
    sub_1000076F4(v13, a3 & 1);
    unint64_t v19 = sub_100009040(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      unint64_t v10 = v19;
      uint64_t v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
LABEL_13:
      sub_100007F88(a2, (uint64_t)v21);
      return sub_100007D24(v10, (uint64_t)v21, a1, v16);
    }
LABEL_15:
    uint64_t result = (_OWORD *)sub_1000095A8();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v16 = *v4;
  if ((v14 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  long long v17 = (_OWORD *)(v16[7] + 32 * v10);
  sub_100007FE4((uint64_t)v17);

  return sub_1000076E4(a1, v17);
}

_OWORD *sub_100007D24(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v5 = a4[6] + 40 * a1;
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(void *)(v5 + 32) = *(void *)(a2 + 32);
  uint64_t result = sub_1000076E4(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v8 = a4[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a4[2] = v10;
  }
  return result;
}

void *sub_100007DA0()
{
  uint64_t v1 = v0;
  sub_100006D48(&qword_100011450);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100009568();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_100007F88(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_100008034(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_1000076E4(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100007F88(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100007FE4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100008034(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100008090()
{
}

void sub_100008098()
{
}

uint64_t sub_1000080A0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000080E8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006D8C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100008138()
{
}

uint64_t sub_100008140()
{
  return sub_100003F90();
}

void sub_100008148()
{
}

void sub_100008150(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_1000081A4(uint64_t result)
{
  if (result)
  {
    uint64_t v2 = v1;
    uint64_t v3 = result;
    if (*(void *)(result + 16))
    {
      uint64_t v5 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDurationKey);
      uint64_t v4 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDurationKey + 8);
      swift_bridgeObjectRetain();
      unint64_t v6 = sub_100009084(v5, v4);
      if (v7)
      {
        sub_100008034(*(void *)(v3 + 56) + 32 * v6, (uint64_t)&v77);
        swift_bridgeObjectRelease();
        if (*((void *)&v78 + 1))
        {
          if (swift_dynamicCast())
          {
            uint64_t v8 = v75;
            if (!v75) {
              return 0;
            }
LABEL_12:
            uint64_t v9 = v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDuration;
            *(void *)uint64_t v9 = v8;
            *(unsigned char *)(v9 + 8) = 0;
            if (*(void *)(v3 + 16))
            {
              uint64_t v11 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertHeaderKey);
              uint64_t v10 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertHeaderKey + 8);
              swift_bridgeObjectRetain();
              unint64_t v12 = sub_100009084(v11, v10);
              if (v13)
              {
                sub_100008034(*(void *)(v3 + 56) + 32 * v12, (uint64_t)&v77);
              }
              else
              {
                long long v77 = 0u;
                long long v78 = 0u;
              }
              swift_bridgeObjectRelease();
              if (*((void *)&v78 + 1))
              {
                int v14 = swift_dynamicCast();
                unint64_t v15 = v75;
                unint64_t v16 = v76;
                if (!v14)
                {
                  unint64_t v15 = 0;
                  unint64_t v16 = 0;
                }
LABEL_21:
                uint64_t v17 = (unint64_t *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertHeader);
                *uint64_t v17 = v15;
                v17[1] = v16;
                swift_bridgeObjectRelease();
                if (!v17[1]) {
                  return 0;
                }
                if (*(void *)(v3 + 16))
                {
                  uint64_t v19 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertMessageKey);
                  uint64_t v18 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertMessageKey + 8);
                  swift_bridgeObjectRetain();
                  unint64_t v20 = sub_100009084(v19, v18);
                  if (v21)
                  {
                    sub_100008034(*(void *)(v3 + 56) + 32 * v20, (uint64_t)&v77);
                  }
                  else
                  {
                    long long v77 = 0u;
                    long long v78 = 0u;
                  }
                  swift_bridgeObjectRelease();
                  if (*((void *)&v78 + 1))
                  {
                    int v22 = swift_dynamicCast();
                    unint64_t v23 = v75;
                    unint64_t v24 = v76;
                    if (!v22)
                    {
                      unint64_t v23 = 0;
                      unint64_t v24 = 0;
                    }
LABEL_31:
                    uint64_t v25 = (unint64_t *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertMessage);
                    *uint64_t v25 = v23;
                    v25[1] = v24;
                    swift_bridgeObjectRelease();
                    if (!v25[1]) {
                      return 0;
                    }
                    if (*(void *)(v3 + 16))
                    {
                      uint64_t v27 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertButtonKey);
                      uint64_t v26 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertButtonKey + 8);
                      swift_bridgeObjectRetain();
                      unint64_t v28 = sub_100009084(v27, v26);
                      if (v29)
                      {
                        sub_100008034(*(void *)(v3 + 56) + 32 * v28, (uint64_t)&v77);
                      }
                      else
                      {
                        long long v77 = 0u;
                        long long v78 = 0u;
                      }
                      swift_bridgeObjectRelease();
                      if (*((void *)&v78 + 1))
                      {
                        int v30 = swift_dynamicCast();
                        unint64_t v31 = v75;
                        unint64_t v32 = v76;
                        if (!v30)
                        {
                          unint64_t v31 = 0;
                          unint64_t v32 = 0;
                        }
LABEL_41:
                        BOOL v33 = (unint64_t *)(v2
                                                 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertButton);
                        unint64_t *v33 = v31;
                        v33[1] = v32;
                        swift_bridgeObjectRelease();
                        if (!v33[1]) {
                          return 0;
                        }
                        if (*(void *)(v3 + 16))
                        {
                          uint64_t v35 = *(void *)(v2
                                          + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioEnabledKey);
                          uint64_t v34 = *(void *)(v2
                                          + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioEnabledKey
                                          + 8);
                          swift_bridgeObjectRetain();
                          unint64_t v36 = sub_100009084(v35, v34);
                          if (v37)
                          {
                            sub_100008034(*(void *)(v3 + 56) + 32 * v36, (uint64_t)&v77);
                          }
                          else
                          {
                            long long v77 = 0u;
                            long long v78 = 0u;
                          }
                          swift_bridgeObjectRelease();
                          if (*((void *)&v78 + 1))
                          {
                            if (swift_dynamicCast())
                            {
                              if (*(void *)(v3 + 16))
                              {
                                uint64_t v39 = *(void *)(v2
                                                + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDurationKey);
                                uint64_t v38 = *(void *)(v2
                                                + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDurationKey
                                                + 8);
                                swift_bridgeObjectRetain();
                                unint64_t v40 = sub_100009084(v39, v38);
                                if (v41)
                                {
                                  sub_100008034(*(void *)(v3 + 56) + 32 * v40, (uint64_t)&v77);
                                }
                                else
                                {
                                  long long v77 = 0u;
                                  long long v78 = 0u;
                                }
                                swift_bridgeObjectRelease();
                                if (*((void *)&v78 + 1))
                                {
                                  if (swift_dynamicCast())
                                  {
                                    uint64_t v50 = v75;
                                    if (!v75) {
                                      return 0;
                                    }
LABEL_69:
                                    uint64_t v51 = v2
                                        + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDuration;
                                    *(void *)uint64_t v51 = v50;
                                    *(unsigned char *)(v51 + 8) = 0;
                                    if (*(void *)(v3 + 16))
                                    {
                                      uint64_t v53 = *(void *)(v2
                                                      + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopsKey);
                                      uint64_t v52 = *(void *)(v2
                                                      + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopsKey
                                                      + 8);
                                      swift_bridgeObjectRetain();
                                      unint64_t v54 = sub_100009084(v53, v52);
                                      if (v55)
                                      {
                                        sub_100008034(*(void *)(v3 + 56) + 32 * v54, (uint64_t)&v77);
                                      }
                                      else
                                      {
                                        long long v77 = 0u;
                                        long long v78 = 0u;
                                      }
                                      swift_bridgeObjectRelease();
                                      if (*((void *)&v78 + 1))
                                      {
                                        if (swift_dynamicCast())
                                        {
                                          char v56 = v75;
                                          goto LABEL_79;
                                        }
LABEL_78:
                                        char v56 = 0;
LABEL_79:
                                        *(unsigned char *)(v2
                                                 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoops) = v56;
                                        if (*(void *)(v3 + 16))
                                        {
                                          uint64_t v58 = *(void *)(v2
                                                          + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelayKey);
                                          uint64_t v57 = *(void *)(v2
                                                          + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelayKey
                                                          + 8);
                                          swift_bridgeObjectRetain();
                                          unint64_t v59 = sub_100009084(v58, v57);
                                          if (v60)
                                          {
                                            sub_100008034(*(void *)(v3 + 56) + 32 * v59, (uint64_t)&v77);
                                          }
                                          else
                                          {
                                            long long v77 = 0u;
                                            long long v78 = 0u;
                                          }
                                          swift_bridgeObjectRelease();
                                          if (*((void *)&v78 + 1))
                                          {
                                            if (swift_dynamicCast())
                                            {
                                              uint64_t v61 = v75;
                                              goto LABEL_89;
                                            }
LABEL_88:
                                            uint64_t v61 = 10;
LABEL_89:
                                            uint64_t v62 = v2
                                                + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelay;
                                            *(void *)uint64_t v62 = v61;
                                            *(unsigned char *)(v62 + 8) = 0;
                                            if (*(void *)(v3 + 16))
                                            {
                                              uint64_t v64 = *(void *)(v2
                                                              + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertSoundIDKey);
                                              uint64_t v63 = *(void *)(v2
                                                              + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertSoundIDKey
                                                              + 8);
                                              swift_bridgeObjectRetain();
                                              unint64_t v65 = sub_100009084(v64, v63);
                                              if (v66)
                                              {
                                                sub_100008034(*(void *)(v3 + 56) + 32 * v65, (uint64_t)&v77);
                                              }
                                              else
                                              {
                                                long long v77 = 0u;
                                                long long v78 = 0u;
                                              }
                                              swift_bridgeObjectRelease();
                                              if (*((void *)&v78 + 1))
                                              {
                                                if (swift_dynamicCast())
                                                {
                                                  uint64_t v67 = v2
                                                      + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertSoundID;
                                                  *(_DWORD *)uint64_t v67 = v75;
                                                  *(unsigned char *)(v67 + 4) = 0;
                                                  *(unsigned char *)(v2
                                                           + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioEnabled) = v75;
                                                  if (!*(void *)(v3 + 16)) {
                                                    goto LABEL_97;
                                                  }
                                                  goto LABEL_54;
                                                }
                                                return 0;
                                              }
                                            }
                                            else
                                            {
                                              long long v77 = 0u;
                                              long long v78 = 0u;
                                            }
                                            sub_1000090FC((uint64_t)&v77);
                                            return 0;
                                          }
                                        }
                                        else
                                        {
                                          long long v77 = 0u;
                                          long long v78 = 0u;
                                        }
                                        sub_1000090FC((uint64_t)&v77);
                                        goto LABEL_88;
                                      }
                                    }
                                    else
                                    {
                                      long long v77 = 0u;
                                      long long v78 = 0u;
                                    }
                                    sub_1000090FC((uint64_t)&v77);
                                    goto LABEL_78;
                                  }
LABEL_68:
                                  uint64_t v50 = 10;
                                  goto LABEL_69;
                                }
                              }
                              else
                              {
                                long long v77 = 0u;
                                long long v78 = 0u;
                              }
                              sub_1000090FC((uint64_t)&v77);
                              goto LABEL_68;
                            }
LABEL_53:
                            *(unsigned char *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioEnabled) = 0;
                            uint64_t v42 = v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDuration;
                            *(void *)uint64_t v42 = 10;
                            *(unsigned char *)(v42 + 8) = 0;
                            *(unsigned char *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoops) = 0;
                            uint64_t v43 = v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelay;
                            *(void *)uint64_t v43 = 10;
                            *(unsigned char *)(v43 + 8) = 0;
                            uint64_t v44 = v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertSoundID;
                            *(_DWORD *)uint64_t v44 = 0;
                            *(unsigned char *)(v44 + 4) = 0;
                            if (!*(void *)(v3 + 16))
                            {
LABEL_97:
                              long long v77 = 0u;
                              long long v78 = 0u;
                              goto LABEL_98;
                            }
LABEL_54:
                            uint64_t v46 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeoutKey);
                            uint64_t v45 = *(void *)(v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeoutKey + 8);
                            swift_bridgeObjectRetain();
                            unint64_t v47 = sub_100009084(v46, v45);
                            if (v48)
                            {
                              sub_100008034(*(void *)(v3 + 56) + 32 * v47, (uint64_t)&v77);
                            }
                            else
                            {
                              long long v77 = 0u;
                              long long v78 = 0u;
                            }
                            swift_bridgeObjectRelease();
                            if (*((void *)&v78 + 1))
                            {
                              if (swift_dynamicCast())
                              {
                                uint64_t v49 = v75;
                                if (!v75) {
                                  return 0;
                                }
LABEL_100:
                                uint64_t v68 = v2 + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeout;
                                *(void *)uint64_t v68 = v49;
                                *(unsigned char *)(v68 + 8) = 0;
                                if (*(void *)(v3 + 16))
                                {
                                  uint64_t v70 = *(void *)(v2
                                                  + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationKey);
                                  uint64_t v69 = *(void *)(v2
                                                  + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationKey
                                                  + 8);
                                  swift_bridgeObjectRetain();
                                  unint64_t v71 = sub_100009084(v70, v69);
                                  if (v72)
                                  {
                                    sub_100008034(*(void *)(v3 + 56) + 32 * v71, (uint64_t)&v77);
                                  }
                                  else
                                  {
                                    long long v77 = 0u;
                                    long long v78 = 0u;
                                  }
                                  swift_bridgeObjectRelease();
                                  if (*((void *)&v78 + 1))
                                  {
                                    if (swift_dynamicCast())
                                    {
                                      unint64_t v73 = v75;
                                      if (*(void *)(v2
                                                     + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationMax) < v75
                                        || v75 < *(void *)(v2
                                                           + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationMin))
                                      {
                                        return 0;
                                      }
LABEL_112:
                                      uint64_t v74 = v2
                                          + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDuration;
                                      *(void *)uint64_t v74 = v73;
                                      *(unsigned char *)(v74 + 8) = 0;
                                      return 1;
                                    }
LABEL_111:
                                    unint64_t v73 = *(void *)(v2
                                                    + OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationDefault);
                                    goto LABEL_112;
                                  }
                                }
                                else
                                {
                                  long long v77 = 0u;
                                  long long v78 = 0u;
                                }
                                sub_1000090FC((uint64_t)&v77);
                                goto LABEL_111;
                              }
LABEL_99:
                              uint64_t v49 = 60;
                              goto LABEL_100;
                            }
LABEL_98:
                            sub_1000090FC((uint64_t)&v77);
                            goto LABEL_99;
                          }
                        }
                        else
                        {
                          long long v77 = 0u;
                          long long v78 = 0u;
                        }
                        sub_1000090FC((uint64_t)&v77);
                        goto LABEL_53;
                      }
                    }
                    else
                    {
                      long long v77 = 0u;
                      long long v78 = 0u;
                    }
                    sub_1000090FC((uint64_t)&v77);
                    unint64_t v31 = 0;
                    unint64_t v32 = 0;
                    goto LABEL_41;
                  }
                }
                else
                {
                  long long v77 = 0u;
                  long long v78 = 0u;
                }
                sub_1000090FC((uint64_t)&v77);
                unint64_t v23 = 0;
                unint64_t v24 = 0;
                goto LABEL_31;
              }
            }
            else
            {
              long long v77 = 0u;
              long long v78 = 0u;
            }
            sub_1000090FC((uint64_t)&v77);
            unint64_t v15 = 0;
            unint64_t v16 = 0;
            goto LABEL_21;
          }
LABEL_11:
          uint64_t v8 = 30;
          goto LABEL_12;
        }
      }
      else
      {
        long long v77 = 0u;
        long long v78 = 0u;
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      long long v77 = 0u;
      long long v78 = 0u;
    }
    sub_1000090FC((uint64_t)&v77);
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

id sub_100008B14()
{
  uint64_t v1 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDurationKey];
  *(void *)uint64_t v1 = 0xD00000000000001ALL;
  *((void *)v1 + 1) = 0x800000010000A9F0;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDurationMin] = 1;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDurationMax] = -1;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDurationDefault] = 30;
  uint64_t v2 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertHeaderKey];
  *(void *)uint64_t v2 = 0xD000000000000012;
  *((void *)v2 + 1) = 0x800000010000AA10;
  uint64_t v3 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertMessageKey];
  *(void *)uint64_t v3 = 0xD000000000000013;
  *((void *)v3 + 1) = 0x800000010000AA30;
  uint64_t v4 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertButtonKey];
  *(void *)uint64_t v4 = 0xD000000000000012;
  *((void *)v4 + 1) = 0x800000010000AA50;
  uint64_t v5 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeoutKey];
  strcpy(&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeoutKey], "resultTimeout");
  *((_WORD *)v5 + 7) = -4864;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeoutMin] = 1;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeoutMax] = -1;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeoutDefault] = 60;
  unint64_t v6 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioEnabledKey];
  *(void *)unint64_t v6 = 0xD000000000000018;
  *((void *)v6 + 1) = 0x800000010000AA80;
  v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioEnabledDefault] = 0;
  char v7 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopsKey];
  *(void *)char v7 = 0xD000000000000016;
  *((void *)v7 + 1) = 0x800000010000AB40;
  v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopsDefault] = 0;
  uint64_t v8 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDurationKey];
  *(void *)uint64_t v8 = 0xD000000000000019;
  *((void *)v8 + 1) = 0x800000010000AAA0;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDurationMin] = 1;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDurationMax] = -1;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDurationDefault] = 10;
  uint64_t v9 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelayKey];
  *(void *)uint64_t v9 = 0xD00000000000001ALL;
  *((void *)v9 + 1) = 0x800000010000AAE0;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelayMin] = 0;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelayMax] = -1;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelayDefault] = 10;
  uint64_t v10 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertSoundIDKey];
  *(void *)uint64_t v10 = 0xD000000000000013;
  *((void *)v10 + 1) = 0x800000010000AB00;
  uint64_t v11 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationKey];
  *(void *)uint64_t v11 = 0xD00000000000001BLL;
  *((void *)v11 + 1) = 0x800000010000AB20;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationMin] = 0;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationMax] = 60;
  *(void *)&v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDurationDefault] = 0;
  unint64_t v12 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_diagnosticTestWaitDuration];
  *(void *)unint64_t v12 = 0;
  v12[8] = 1;
  char v13 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertHeader];
  *(void *)char v13 = 0;
  *((void *)v13 + 1) = 0;
  int v14 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertMessage];
  *(void *)int v14 = 0;
  *((void *)v14 + 1) = 0;
  unint64_t v15 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertButton];
  *(void *)unint64_t v15 = 0;
  *((void *)v15 + 1) = 0;
  unint64_t v16 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_resultTimeout];
  *(void *)unint64_t v16 = 0;
  v16[8] = 1;
  v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioEnabled] = 2;
  uint64_t v17 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioDuration];
  *(void *)uint64_t v17 = 0;
  v17[8] = 1;
  v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoops] = 2;
  uint64_t v18 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertAudioLoopDelay];
  *(void *)uint64_t v18 = 0;
  v18[8] = 1;
  uint64_t v19 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_openLidAlertSoundID];
  *(_DWORD *)uint64_t v19 = 0;
  v19[4] = 1;
  unint64_t v20 = &v0[OBJC_IVAR___OnDemandAudioDiagnosticMonitorInputs_delayExitWorkaroundDuration];
  *(void *)unint64_t v20 = 0;
  v20[8] = 1;
  v22.receiver = v0;
  v22.super_class = (Class)type metadata accessor for OnDemandAudioDiagnosticMonitorInputs();
  return [super init];
}

id sub_100008EA4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OnDemandAudioDiagnosticMonitorInputs();
  return [super dealloc];
}

uint64_t type metadata accessor for OnDemandAudioDiagnosticMonitorInputs()
{
  return self;
}

unint64_t sub_100009040(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100009508(*(void *)(v2 + 40));

  return sub_10000915C(a1, v4);
}

unint64_t sub_100009084(uint64_t a1, uint64_t a2)
{
  sub_1000095C8();
  sub_1000093F8();
  Swift::Int v4 = sub_1000095D8();

  return sub_100009224(a1, a2, v4);
}

uint64_t sub_1000090FC(uint64_t a1)
{
  uint64_t v2 = sub_100006D48((uint64_t *)&unk_100011A00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000915C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100007F88(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100009518();
      sub_100007690((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100009224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100009598() & 1) == 0)
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
      while (!v14 && (sub_100009598() & 1) == 0);
    }
  }
  return v6;
}

NSDate sub_100009308()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100009318()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100009328()
{
  return type metadata accessor for Date();
}

uint64_t sub_100009338()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100009348()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100009358()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_100009368()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100009378()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100009388()
{
  return static DispatchTime.now()();
}

uint64_t sub_100009398()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_1000093A8()
{
  return + infix(_:_:)();
}

NSDictionary sub_1000093B8()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000093C8()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_1000093D8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000093E8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000093F8()
{
  return String.hash(into:)();
}

uint64_t sub_100009408()
{
  return String.init(cString:)();
}

Swift::Int sub_100009418()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_100009428()
{
  return Array._bridgeToObjectiveC()();
}

NSNumber sub_100009438()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_100009448()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100009458()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100009468()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_100009478()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_100009488()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100009498()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_1000094A8()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_1000094B8()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_1000094C8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000094D8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000094E8()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1000094F8()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_100009508(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100009518()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100009528()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100009538()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100009548()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100009558()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100009568()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100009578()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100009588()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100009598()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000095A8()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_1000095B8()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_1000095C8()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1000095D8()
{
  return Hasher._finalize()();
}

void AudioServicesPlayAlertSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
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

uint64_t swift_release_n()
{
  return _swift_release_n();
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