id SMMessage.init(message:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSURL *v15;
  void *v16;
  void *v17;
  id v18;
  void (*v19)(char *, uint64_t);
  uint64_t v21;

  sub_2C4C(&qword_1C760);
  v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v6 = (char *)&v21 - v5;
  v7 = sub_14EB8();
  v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
LABEL_8:
    sub_2C90((uint64_t)v6);
    return 0;
  }
  v11 = [a1 URL];
  if (v11)
  {
    v12 = v11;
    sub_14E98();

    (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v4, 1, 1, v7);
  }
  sub_2CF0((uint64_t)v4, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {

    goto LABEL_8;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
  v14 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_14E88(v15);
  v17 = v16;
  v18 = [v14 initWithURL:v16];

  v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v13 = v18;
  v19(v10, v7);
  if (v13) {

  }
  return v13;
}

uint64_t sub_2C4C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2C90(uint64_t a1)
{
  uint64_t v2 = sub_2C4C(&qword_1C760);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2C4C(&qword_1C760);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for MessagesViewController()
{
  uint64_t result = qword_1CA40;
  if (!qword_1CA40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2E00()
{
  v1 = v0;
  uint64_t v2 = sub_152B8();
  uint64_t v61 = *(void *)(v2 - 8);
  uint64_t v62 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  v59 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v60 = (char *)&v53 - v5;
  uint64_t v6 = sub_15338();
  uint64_t v56 = *(void *)(v6 - 8);
  uint64_t v57 = v6;
  __chkstk_darwin(v6);
  v58 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2C4C(&qword_1C768);
  __chkstk_darwin(v8 - 8);
  v54 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_14F18();
  uint64_t v53 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v55 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_15388();
  uint64_t v63 = *(void *)(v12 - 8);
  uint64_t v64 = v12;
  __chkstk_darwin(v12);
  v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_15158();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  v19 = (char *)&v53 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v21 = (char *)&v53 - v20;
  uint64_t v23 = v22;
  sub_15218();
  v24 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  v66 = v21;
  v24(v19, v21, v23);
  uint64_t v65 = v16;
  int v25 = (*(uint64_t (**)(char *, uint64_t))(v16 + 88))(v19, v23);
  int v26 = v25;
  int v27 = enum case for SessionViewModel.InitiatorViewType.unknown(_:);
  if (v25 == enum case for SessionViewModel.InitiatorViewType.unknown(_:))
  {
    sub_15368();
    v28 = v0;
    v29 = sub_15378();
    os_log_type_t v30 = sub_15558();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v68 = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315394;
      v60 = (char *)(v31 + 4);
      v32 = v28;
      id v33 = [v32 description];
      LODWORD(v61) = v27;
      id v34 = v33;
      uint64_t v35 = sub_15498();
      LODWORD(v62) = v26;
      unint64_t v37 = v36;

      uint64_t v67 = sub_105C4(v35, v37, &v68);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v31 + 12) = 2080;
      uint64_t v67 = sub_105C4(0xD000000000000029, 0x80000000000170C0, &v68);
      int v27 = v61;
      int v26 = v62;
      sub_155D8();
      _os_log_impl(&dword_0, v29, v30, "%s, %s: Cannot display unknown view type!", (uint8_t *)v31, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v63 + 8))(v14, v64);
      (*(void (**)(char *, uint64_t))(v65 + 8))(v66, v23);
      return v26 != v27;
    }

    (*(void (**)(char *, uint64_t))(v63 + 8))(v14, v64);
LABEL_13:
    (*(void (**)(char *, uint64_t))(v65 + 8))(v66, v23);
    return v26 != v27;
  }
  if (v25 == enum case for SessionViewModel.InitiatorViewType.stagedMessage(_:))
  {
    sub_62E8();
    goto LABEL_13;
  }
  if (v25 == enum case for SessionViewModel.InitiatorViewType.sessionDetails(_:))
  {
    int v38 = v25;
    uint64_t v39 = OBJC_IVAR___MessagesViewController_safetyCacheViewModel;
    v40 = *(void **)((char *)v0 + OBJC_IVAR___MessagesViewController_safetyCacheViewModel);
    if (v40) {
      goto LABEL_17;
    }
    uint64_t v41 = (uint64_t)v54;
    sub_15148();
    uint64_t v42 = v53;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v41, 1, v10) == 1)
    {
      sub_14F08();
      sub_13D54(v41, &qword_1C768);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v42 + 32))(v55, v41, v10);
    }
    (*(void (**)(char *, void, uint64_t))(v56 + 104))(v58, enum case for UserType.initiator(_:), v57);
    id v44 = objc_allocWithZone((Class)sub_15008());
    uint64_t v45 = sub_14FF8();
    v46 = *(void **)((char *)v1 + v39);
    *(void *)((char *)v1 + v39) = v45;

    v40 = *(void **)((char *)v1 + v39);
    if (v40)
    {
LABEL_17:
      id v47 = v40;
      swift_retain();
      swift_retain();
      v48 = v60;
      sub_152A8();
      uint64_t v50 = v61;
      uint64_t v49 = v62;
      (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v59, v48, v62);
      sub_10C1C(&qword_1C780, (void (*)(uint64_t))&type metadata accessor for InitiatorSessionDetailsView);
      uint64_t v68 = sub_153A8();
      id v51 = objc_allocWithZone((Class)sub_2C4C(&qword_1C788));
      v52 = (void *)sub_15398();
      sub_5E30(v52);

      (*(void (**)(char *, uint64_t))(v50 + 8))(v48, v49);
    }
    (*(void (**)(char *, uint64_t))(v65 + 8))(v66, v23);
    int v26 = v38;
    return v26 != v27;
  }
  if (v25 == enum case for SessionViewModel.InitiatorViewType.onboarding(_:))
  {
    (*(void (**)(void))&stru_108.segname[(swift_isaMask & *v0) + 16])();
    goto LABEL_13;
  }
  uint64_t result = sub_156E8();
  __break(1u);
  return result;
}

void sub_3708(char *a1)
{
  uint64_t v2 = sub_14F38();
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v83 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_15478();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_15388();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v87 = v6;
  uint64_t v88 = v7;
  uint64_t v8 = __chkstk_darwin(v6);
  v91 = (char *)&v83 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  v84 = (char *)&v83 - v11;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v83 - v12;
  v14 = (void *)sub_14FA8();
  uint64_t v15 = *(v14 - 1);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v83 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v85 = (id)sub_14F58();
  v89 = v18;
  uint64_t v92 = sub_14F68();
  v90 = v19;
  sub_14F88();
  NSString v20 = sub_15488();
  swift_bridgeObjectRelease();
  id v21 = self;
  uint64_t v22 = [v21 actionWithTitle:v20 style:1 handler:0];

  sub_14FB8();
  int v23 = (*(uint64_t (**)(char *, void *))(v15 + 88))(v17, v14);
  if (v23 == enum case for SendValidity.Case.initiatorIneligible(_:))
  {
    sub_15418();
    sub_13E18(0, &qword_1C8B8);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v25 = [self bundleForClass:ObjCClassFromMetadata];
    sub_14F28();
    sub_154B8();
    uint64_t v26 = sub_14F78();
    if (v27)
    {
      uint64_t v28 = v26;
      uint64_t v29 = v27;
      uint64_t v30 = swift_allocObject();
      *(void *)(v30 + 16) = v28;
      *(void *)(v30 + 24) = v29;
      NSString v31 = sub_15488();
      swift_bridgeObjectRelease();
      aBlock[4] = (uint64_t)sub_13E8C;
      aBlock[5] = v30;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_454C;
      aBlock[3] = (uint64_t)&unk_18C48;
      v32 = _Block_copy(aBlock);
      swift_release();
      id v33 = [v21 actionWithTitle:v31 style:0 handler:v32];
      _Block_release(v32);
    }
    else
    {
      swift_bridgeObjectRelease();
      id v33 = 0;
    }
    goto LABEL_16;
  }
  id v33 = 0;
  if (v23 == enum case for SendValidity.Case.noReceiver(_:))
  {
LABEL_16:
    id v34 = v22;
    unint64_t v35 = (unint64_t)v90;
    goto LABEL_17;
  }
  id v34 = v22;
  unint64_t v35 = (unint64_t)v90;
  if (v23 == enum case for SendValidity.Case.receiverIneligible(_:)
    || v23 == enum case for SendValidity.Case.groupChat(_:)
    || v23 == enum case for SendValidity.Case.missingConfig(_:)
    || v23 == enum case for SendValidity.Case.notReady(_:)
    || v23 == enum case for SendValidity.Case.differentReceiver(_:)
    || v23 == enum case for SendValidity.Case.sessionAlreadyActive(_:)
    || v23 == enum case for SendValidity.Case.invalidETA(_:))
  {
LABEL_17:
    swift_bridgeObjectRetain();
    NSString v45 = sub_15488();
    swift_bridgeObjectRelease();
    NSString v46 = sub_15488();
    swift_bridgeObjectRelease();
    v14 = [self alertControllerWithTitle:v45 message:v46 preferredStyle:1];

    [v14 addAction:v34];
    if (v33) {
      [v14 addAction:v33];
    }
    id v47 = [self sharedApplication];
    id v48 = [v47 connectedScenes];

    sub_13E18(0, &qword_1C8A0);
    sub_13DB0();
    uint64_t v49 = sub_15528();

    uint64_t v13 = (char *)sub_4900(v49);
    swift_bridgeObjectRelease();
    if (v13)
    {
      self;
      uint64_t v50 = (void *)swift_dynamicCastObjCClass();
      id v51 = v50;
      v52 = v91;
      if (v50)
      {
        id v53 = [v50 windows];
        sub_13E18(0, &qword_1C8B0);
        unint64_t v54 = sub_154F8();

        if (v54 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v55 = sub_156A8();
          swift_bridgeObjectRelease();
          if (v55)
          {
LABEL_23:
            unint64_t v56 = v55 - 1;
            if (__OFSUB__(v55, 1))
            {
              __break(1u);
            }
            else if ((v54 & 0xC000000000000001) == 0)
            {
              if ((v56 & 0x8000000000000000) != 0)
              {
                __break(1u);
              }
              else if (v56 < *(void *)((char *)&dword_10 + (v54 & 0xFFFFFFFFFFFFFF8)))
              {
                id v57 = *(id *)(v54 + 8 * v56 + 32);
                goto LABEL_28;
              }
              __break(1u);
              return;
            }
            id v57 = (id)sub_15678();
LABEL_28:
            v58 = v57;
            swift_bridgeObjectRelease();
            uint64_t v4 = (char *)[v58 rootViewController];

            if (v4)
            {
              a1 = v84;
              sub_15368();
              id v21 = v86;
              swift_bridgeObjectRetain();
              uint64_t v22 = sub_15378();
              os_log_type_t v59 = sub_15538();
              int v60 = v59;
              if (os_log_type_enabled(v22, v59))
              {
                uint64_t v61 = swift_slowAlloc();
                v89 = v22;
                uint64_t v62 = v61;
                v91 = (char *)swift_slowAlloc();
                aBlock[0] = (uint64_t)v91;
                *(_DWORD *)uint64_t v62 = 136315650;
                id v85 = (id)(v62 + 4);
                id v63 = v21;
                id v64 = [v63 description];
                v90 = v14;
                id v65 = v64;
                uint64_t v66 = sub_15498();
                LODWORD(v86) = v60;
                uint64_t v67 = v66;
                unint64_t v69 = v68;

                uint64_t v94 = sub_105C4(v67, v69, aBlock);
                sub_155D8();

                swift_bridgeObjectRelease();
                *(_WORD *)(v62 + 12) = 2080;
                uint64_t v94 = sub_105C4(0xD00000000000002ELL, 0x8000000000017440, aBlock);
                sub_155D8();
                *(_WORD *)(v62 + 22) = 2080;
                v14 = v90;
                swift_bridgeObjectRetain();
                uint64_t v94 = sub_105C4(v92, v35, aBlock);
                sub_155D8();
                swift_bridgeObjectRelease_n();
                v70 = v89;
                _os_log_impl(&dword_0, v89, (os_log_type_t)v86, "%s, %s: Presenting failure alert, %s", (uint8_t *)v62, 0x20u);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();

                (*(void (**)(char *, uint64_t))(v88 + 8))(v84, v87);
LABEL_37:
                [v4 presentViewController:v14 animated:1 completion:0];

                return;
              }
LABEL_36:

              swift_bridgeObjectRelease_n();
              (*(void (**)(char *, uint64_t))(v88 + 8))(a1, v87);
              goto LABEL_37;
            }
            goto LABEL_42;
          }
        }
        else
        {
          uint64_t v55 = *(void *)((char *)&dword_10 + (v54 & 0xFFFFFFFFFFFFFF8));
          if (v55) {
            goto LABEL_23;
          }
        }
        swift_bridgeObjectRelease();
      }
      else
      {
      }
    }
    else
    {
      id v51 = 0;
      v52 = v91;
    }
LABEL_42:
    sub_15368();
    id v71 = v86;
    swift_bridgeObjectRetain();
    v72 = sub_15378();
    os_log_type_t v73 = sub_15558();
    if (os_log_type_enabled(v72, v73))
    {
      uint64_t v74 = swift_slowAlloc();
      uint64_t v75 = swift_slowAlloc();
      v90 = v14;
      aBlock[0] = v75;
      *(_DWORD *)uint64_t v74 = 136315650;
      id v86 = v51;
      id v76 = v71;
      id v77 = [v76 description];
      v89 = v34;
      id v78 = v77;
      unint64_t v79 = v35;
      uint64_t v80 = sub_15498();
      id v85 = v33;
      unint64_t v82 = v81;

      uint64_t v94 = sub_105C4(v80, v82, aBlock);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v74 + 12) = 2080;
      uint64_t v94 = sub_105C4(0xD00000000000002ELL, 0x8000000000017440, aBlock);
      sub_155D8();
      *(_WORD *)(v74 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v94 = sub_105C4(v92, v79, aBlock);
      sub_155D8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v72, v73, "%s, %s: Unable to show failure alert, %s", (uint8_t *)v74, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v88 + 8))(v91, v87);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v88 + 8))(v52, v87);
    }
    return;
  }
  if (v23 != enum case for SendValidity.Case.valid(_:))
  {
    id v33 = 0;
    if (v23 != enum case for SendValidity.Case.generalError(_:)
      && v23 != enum case for SendValidity.Case.groupReceiverIneligible(_:))
    {
      sub_156E8();
      __break(1u);
      goto LABEL_36;
    }
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_15368();
  id v36 = v86;
  unint64_t v37 = sub_15378();
  os_log_type_t v38 = sub_15558();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v39 = 136315394;
    v89 = v34;
    id v40 = v36;
    id v41 = [v40 description];
    uint64_t v42 = sub_15498();
    unint64_t v44 = v43;

    uint64_t v94 = sub_105C4(v42, v44, aBlock);
    sub_155D8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v39 + 12) = 2080;
    uint64_t v94 = sub_105C4(0xD00000000000002ELL, 0x8000000000017440, aBlock);
    sub_155D8();
    _os_log_impl(&dword_0, v37, v38, "%s, %s: Failure alert not shown because this is a valid message", (uint8_t *)v39, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v88 + 8))(v13, v87);
}

void sub_454C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_45B4()
{
  uint64_t v0 = sub_2C4C(&qword_1C760);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_14EB8();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_14EA8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1) {
    return sub_13D54((uint64_t)v2, &qword_1C760);
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  id v8 = [self defaultWorkspace];
  if (v8)
  {
    uint64_t v10 = v8;
    sub_14E88(v9);
    uint64_t v12 = v11;
    sub_47C8((uint64_t)&_swiftEmptyArrayStorage);
    Class isa = sub_153E8().super.isa;
    swift_bridgeObjectRelease();
    [v10 openSensitiveURL:v12 withOptions:isa];
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_47C8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_2C4C(&qword_1C8C0);
  uint64_t v2 = sub_156B8();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_13E94(v6, (uint64_t)&v15, &qword_1C8C8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10C64(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_13EF8(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_4900(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = sub_15608();
    uint64_t v5 = v4;
    sub_15658();
    char v6 = sub_15618();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_13F08(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_10DC0(v3, v5, v2 != 0, a1);
    uint64_t v7 = v11;
    sub_13F08(v3, v5, v2 != 0);
    return v7;
  }
  uint64_t result = sub_11038(a1);
  if ((v10 & 1) == 0)
  {
    uint64_t v5 = v9;
    if (*(_DWORD *)(a1 + 36) == v9)
    {
      uint64_t v3 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_4A10(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v36 = a6;
  unint64_t v37 = a2;
  uint64_t v40 = a4;
  uint64_t v41 = a5;
  uint64_t v39 = a1;
  uint64_t v44 = sub_153B8();
  uint64_t v47 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  unint64_t v43 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_153D8();
  uint64_t v45 = *(void *)(v8 - 8);
  uint64_t v46 = v8;
  __chkstk_darwin(v8);
  uint64_t v42 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_14FD8();
  uint64_t v34 = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  unint64_t v35 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_14F18();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_13E18(0, &qword_1C868);
  uint64_t v38 = sub_15588();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a3, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v36, v10);
  unint64_t v17 = (*(unsigned __int8 *)(v14 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v18 = (v15 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v19 = (v18 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = (*(unsigned __int8 *)(v11 + 80) + v19 + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v21 = swift_allocObject();
  uint64_t v22 = v37;
  *(void *)(v21 + 16) = v37;
  (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v21 + v17, v16, v13);
  uint64_t v23 = v40;
  *(void *)(v21 + v18) = v39;
  v24 = (void *)(v21 + v19);
  uint64_t v25 = v41;
  void *v24 = v23;
  v24[1] = v25;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v21 + v20, v35, v34);
  aBlock[4] = sub_13BA8;
  aBlock[5] = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_5CC4;
  aBlock[3] = &unk_18BF8;
  uint64_t v26 = _Block_copy(aBlock);
  id v27 = v22;
  swift_errorRetain();
  swift_retain();
  swift_release();
  uint64_t v28 = v42;
  sub_153C8();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10C1C(&qword_1C870, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_2C4C(&qword_1C878);
  sub_13CB0();
  uint64_t v30 = v43;
  uint64_t v29 = v44;
  sub_155F8();
  NSString v31 = (void *)v38;
  sub_15598();
  _Block_release(v26);

  (*(void (**)(char *, uint64_t))(v47 + 8))(v30, v29);
  return (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v28, v46);
}

uint64_t sub_4EB4(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void, void, void), uint64_t a5, uint64_t a6)
{
  uint64_t v105 = a6;
  uint64_t v126 = a5;
  uint64_t v108 = sub_2C4C(&qword_1C888);
  __chkstk_darwin(v108);
  uint64_t v109 = (uint64_t)&v101 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2C4C(&qword_1C768);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v104 = (uint64_t)&v101 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v107 = (uint64_t)&v101 - v15;
  __chkstk_darwin(v14);
  uint64_t v113 = (uint64_t)&v101 - v16;
  uint64_t v17 = sub_14FD8();
  uint64_t v119 = *(void *)(v17 - 8);
  v120 = (unsigned int (*)(void, void, void))v17;
  __chkstk_darwin(v17);
  v118 = (char *)&v101 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_14F18();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  v110 = (char *)&v101 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v21);
  v106 = (char *)&v101 - v24;
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)&v101 - v25;
  uint64_t v27 = sub_15388();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = __chkstk_darwin(v27);
  v115 = (char *)&v101 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29);
  v32 = (char *)&v101 - v31;
  sub_15368();
  uint64_t v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
  uint64_t v114 = a2;
  v121 = v33;
  uint64_t v122 = v20 + 16;
  v33((uint64_t)v26, a2, v19);
  id v34 = a1;
  swift_errorRetain();
  unint64_t v35 = v34;
  swift_errorRetain();
  uint64_t v36 = sub_15378();
  LODWORD(v116) = sub_15578();
  BOOL v37 = os_log_type_enabled(v36, (os_log_type_t)v116);
  v125 = v35;
  if (!v37)
  {

    uint64_t v47 = v20;
    unint64_t v54 = v26;
    uint64_t v50 = v19;
    v111 = *(void (**)(char *, uint64_t))(v20 + 8);
    v111(v54, v19);
    swift_errorRelease();
    swift_errorRelease();

    v116 = *(void (**)(char *, uint64_t))(v28 + 8);
    v116(v32, v27);
    uint64_t v55 = a4;
    if (!a3) {
      goto LABEL_8;
    }
LABEL_5:
    v55(0, 0, 0);
    id v57 = v118;
    uint64_t v56 = v119;
    v58 = v120;
    (*(void (**)(char *, void, unsigned int (*)(void, void, void)))(v119 + 104))(v118, enum case for SendValidity.notReady(_:), v120);
    sub_3708(v57);
    return (*(uint64_t (**)(char *, unsigned int (*)(void, void, void)))(v56 + 8))(v57, v58);
  }
  os_log_t v103 = v36;
  uint64_t v117 = v28;
  uint64_t v112 = v27;
  v123 = a4;
  uint64_t v38 = swift_slowAlloc();
  uint64_t v102 = swift_slowAlloc();
  uint64_t v129 = v102;
  *(_DWORD *)uint64_t v38 = 136315906;
  uint64_t v39 = v35;
  id v40 = [v39 description];
  uint64_t v124 = v20;
  id v41 = v40;
  uint64_t v42 = sub_15498();
  unint64_t v44 = v43;

  v128 = (char *)sub_105C4(v42, v44, &v129);
  sub_155D8();

  swift_bridgeObjectRelease();
  *(_WORD *)(v38 + 12) = 2080;
  v128 = (char *)sub_105C4(0xD00000000000004BLL, 0x80000000000170F0, &v129);
  sub_155D8();
  *(_WORD *)(v38 + 22) = 2080;
  sub_10C1C(&qword_1C898, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v45 = sub_156D8();
  v128 = (char *)sub_105C4(v45, v46, &v129);
  sub_155D8();
  swift_bridgeObjectRelease();
  uint64_t v47 = v124;
  id v48 = *(void (**)(char *, uint64_t))(v124 + 8);
  uint64_t v49 = v26;
  uint64_t v50 = v19;
  v48(v49, v19);
  *(_WORD *)(v38 + 32) = 2080;
  v111 = v48;
  if (a3)
  {
    swift_getErrorValue();
    uint64_t v51 = sub_15708();
    unint64_t v53 = v52;
  }
  else
  {
    uint64_t v51 = 7104878;
    unint64_t v53 = 0xE300000000000000;
  }
  uint64_t v55 = v123;
  uint64_t v27 = v112;
  v128 = (char *)sub_105C4(v51, v53, &v129);
  sub_155D8();
  swift_bridgeObjectRelease();
  swift_errorRelease();
  swift_errorRelease();
  os_log_t v60 = v103;
  _os_log_impl(&dword_0, v103, (os_log_type_t)v116, "%s, %s: completionHandler, transactionID, %s, error, %s", (uint8_t *)v38, 0x2Au);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  uint64_t v28 = v117;
  v116 = *(void (**)(char *, uint64_t))(v117 + 8);
  v116(v32, v27);
  if (a3) {
    goto LABEL_5;
  }
LABEL_8:
  v123 = v55;
  uint64_t v117 = v28;
  uint64_t v61 = v113;
  uint64_t v62 = v114;
  uint64_t v63 = v50;
  v121(v113, v114, v50);
  uint64_t v64 = v47;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v47 + 56))(v61, 0, 1, v63);
  id v65 = (char *)v125 + OBJC_IVAR___MessagesViewController_transactionID;
  swift_beginAccess();
  uint64_t v66 = v109;
  uint64_t v67 = v109 + *(int *)(v108 + 48);
  sub_13E94(v61, v109, &qword_1C768);
  sub_13E94((uint64_t)v65, v67, &qword_1C768);
  uint64_t v124 = v64;
  unint64_t v68 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v64 + 48);
  unsigned int v69 = v68(v66, 1, v63);
  v120 = v68;
  if (v69 == 1)
  {
    sub_13D54(v61, &qword_1C768);
    unsigned int v70 = v68(v67, 1, v63);
    id v71 = v115;
    v72 = v110;
    if (v70 == 1)
    {
      sub_13D54(v66, &qword_1C768);
LABEL_15:
      char v78 = sub_14FC8();
      return ((uint64_t (*)(void, void, void))v123)(v78 & 1, 0, 0);
    }
    goto LABEL_13;
  }
  uint64_t v73 = v107;
  sub_13E94(v66, v107, &qword_1C768);
  if (v68(v67, 1, v63) == 1)
  {
    sub_13D54(v61, &qword_1C768);
    v111((char *)v73, v63);
    id v71 = v115;
    v72 = v110;
LABEL_13:
    sub_13D54(v66, &qword_1C888);
    goto LABEL_16;
  }
  uint64_t v74 = v106;
  (*(void (**)(char *, uint64_t, uint64_t))(v124 + 32))(v106, v67, v63);
  sub_10C1C(&qword_1C890, (void (*)(uint64_t))&type metadata accessor for UUID);
  char v75 = sub_15408();
  id v76 = v74;
  id v77 = (void (*)(uint64_t, uint64_t))v111;
  v111(v76, v63);
  sub_13D54(v113, &qword_1C768);
  v77(v73, v63);
  uint64_t v62 = v114;
  sub_13D54(v66, &qword_1C768);
  id v71 = v115;
  v72 = v110;
  if (v75) {
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v112 = v27;
  sub_15368();
  v121((uint64_t)v72, v62, v63);
  unint64_t v79 = v125;
  uint64_t v80 = sub_15378();
  int v81 = sub_15558();
  if (os_log_type_enabled(v80, (os_log_type_t)v81))
  {
    LODWORD(v119) = v81;
    v125 = v80;
    uint64_t v82 = swift_slowAlloc();
    v118 = (char *)swift_slowAlloc();
    v128 = v118;
    *(_DWORD *)uint64_t v82 = 136315906;
    uint64_t v83 = v79;
    id v84 = [v83 description];
    uint64_t v85 = sub_15498();
    uint64_t v86 = v63;
    unint64_t v88 = v87;

    uint64_t v127 = sub_105C4(v85, v88, (uint64_t *)&v128);
    sub_155D8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v82 + 12) = 2080;
    uint64_t v127 = sub_105C4(0xD00000000000004BLL, 0x80000000000170F0, (uint64_t *)&v128);
    sub_155D8();
    *(_WORD *)(v82 + 22) = 2080;
    uint64_t v89 = sub_14EC8();
    uint64_t v127 = sub_105C4(v89, v90, (uint64_t *)&v128);
    sub_155D8();
    swift_bridgeObjectRelease();
    v91 = v72;
    uint64_t v92 = v111;
    v111(v91, v86);
    *(_WORD *)(v82 + 32) = 2080;
    uint64_t v93 = v104;
    sub_13E94((uint64_t)v65, v104, &qword_1C768);
    if (v120(v93, 1, v86))
    {
      uint64_t v94 = 7104878;
      sub_13D54(v93, &qword_1C768);
      unint64_t v95 = 0xE300000000000000;
    }
    else
    {
      v96 = v106;
      v121((uint64_t)v106, v93, v86);
      sub_13D54(v93, &qword_1C768);
      uint64_t v97 = sub_14EC8();
      v98 = v92;
      uint64_t v94 = v97;
      unint64_t v95 = v99;
      v98(v96, v86);
    }
    uint64_t v127 = sub_105C4(v94, v95, (uint64_t *)&v128);
    sub_155D8();

    swift_bridgeObjectRelease();
    v100 = v125;
    _os_log_impl(&dword_0, v125, (os_log_type_t)v119, "%s, %s: Failed to match transactionID %s against %s", (uint8_t *)v82, 0x2Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v116(v115, v112);
    return ((uint64_t (*)(void, void, void))v123)(0, 0, 0);
  }
  else
  {

    v111(v72, v63);
    v116(v71, v112);
    return ((uint64_t (*)(void, void, void))v123)(0, 0, 0);
  }
}

uint64_t sub_5CC4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_5DC4(char a1, uint64_t a2, NSString a3, uint64_t a4)
{
  if (a3) {
    a3 = sub_15488();
  }
  id v6 = a3;
  (*(void (**)(uint64_t, void))(a4 + 16))(a4, a1 & 1);
}

uint64_t sub_5E30(void *a1)
{
  uint64_t v3 = sub_153B8();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_153D8();
  uint64_t v7 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_13E18(0, &qword_1C868);
  uint64_t v10 = (void *)sub_15588();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  *(void *)(v11 + 24) = a1;
  aBlock[4] = sub_14004;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_5CC4;
  aBlock[3] = &unk_18C98;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = v1;
  id v14 = a1;
  swift_release();
  sub_153C8();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10C1C(&qword_1C870, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_2C4C(&qword_1C878);
  sub_13CB0();
  sub_155F8();
  sub_15598();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v17);
}

void sub_60F4()
{
  id v0 = objc_allocWithZone((Class)sub_152F8());
  swift_retain();
  uint64_t v1 = (void *)sub_152E8();
  id v2 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v1];
  sub_5E30(v2);
}

uint64_t sub_6198()
{
  *(void *)(swift_allocObject() + 16) = v0;
  id v1 = v0;
  sub_15098();
  *(void *)(swift_allocObject() + 16) = v1;
  id v2 = v1;
  sub_15088();
  *(void *)(swift_allocObject() + 16) = v2;
  id v3 = v2;
  sub_150A8();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_15078();

  return swift_release();
}

void sub_62E8()
{
  id v1 = v0;
  uint64_t v2 = sub_15388();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  id v6 = &v37[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v8 = &v37[-v7];
  id v9 = [v1 activeConversation];
  if (v9)
  {
    uint64_t v10 = v9;
    type metadata accessor for SMMessagesFactory();
    id v11 = static SMMessagesFactory.startSessionMessage(sessionViewModel:)(*(void **)&v1[OBJC_IVAR___MessagesViewController_sessionViewModel]);
    [v10 insertMessage:v11 completionHandler:0];
    sub_15368();
    uint64_t v12 = v1;
    id v13 = v11;
    id v14 = v12;
    id v15 = v13;
    uint64_t v16 = sub_15378();
    int v17 = sub_15578();
    if (os_log_type_enabled(v16, (os_log_type_t)v17))
    {
      int v38 = v17;
      uint64_t v42 = v3;
      uint64_t v43 = v2;
      uint64_t v18 = swift_slowAlloc();
      uint64_t v39 = (void *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      uint64_t v45 = v40;
      *(_DWORD *)uint64_t v18 = 136315650;
      id v41 = v14;
      uint64_t v19 = v14;
      id v20 = [v19 description];
      uint64_t v21 = sub_15498();
      unint64_t v23 = v22;

      uint64_t v44 = sub_105C4(v21, v23, &v45);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 12) = 2080;
      uint64_t v44 = sub_105C4(0xD000000000000015, 0x8000000000017790, &v45);
      sub_155D8();
      *(_WORD *)(v18 + 22) = 2112;
      id v24 = [v15 session];
      id v25 = v24;
      if (v24) {
        uint64_t v44 = (uint64_t)v24;
      }
      else {
        uint64_t v44 = 0;
      }
      sub_155D8();
      uint64_t v36 = v43;
      *uint64_t v39 = v25;

      _os_log_impl(&dword_0, v16, (os_log_type_t)v38, "%s, %s: inserted startSessionMessage with session %@", (uint8_t *)v18, 0x20u);
      sub_2C4C(&qword_1C790);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(unsigned char *, uint64_t))(v42 + 8))(v8, v36);
      id v14 = v41;
    }
    else
    {

      (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v8, v2);
    }
    [v14 dismiss];
  }
  else
  {
    sub_15368();
    uint64_t v26 = v1;
    uint64_t v27 = sub_15378();
    os_log_type_t v28 = sub_15568();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      uint64_t v43 = v2;
      uint64_t v45 = v30;
      *(_DWORD *)uint64_t v29 = 136315650;
      uint64_t v42 = v3;
      uint64_t v31 = v26;
      id v32 = [v31 description];
      uint64_t v33 = sub_15498();
      unint64_t v35 = v34;

      uint64_t v44 = sub_105C4(v33, v35, &v45);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2080;
      uint64_t v44 = sub_105C4(0xD000000000000015, 0x8000000000017790, &v45);
      sub_155D8();
      *(_WORD *)(v29 + 22) = 2080;
      uint64_t v44 = sub_105C4(0xD000000000000015, 0x8000000000017790, &v45);
      sub_155D8();
      _os_log_impl(&dword_0, v27, v28, "%s, %s: No active conversation in %s.", (uint8_t *)v29, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(unsigned char *, uint64_t))(v42 + 8))(v6, v43);
    }
    else
    {

      (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
    }
  }
}

void sub_6900(uint64_t a1)
{
  uint64_t v2 = sub_15388();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v7 = (void *)Strong;
    sub_15368();
    id v8 = v7;
    swift_errorRetain();
    id v9 = v8;
    swift_errorRetain();
    uint64_t v10 = sub_15378();
    int v11 = sub_15578();
    if (os_log_type_enabled(v10, (os_log_type_t)v11))
    {
      int v32 = v11;
      uint64_t v33 = v2;
      uint64_t v12 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v36 = v31;
      *(_DWORD *)uint64_t v12 = 136315906;
      id v34 = v9;
      id v13 = v9;
      id v14 = [v13 description];
      uint64_t v15 = sub_15498();
      unint64_t v17 = v16;

      uint64_t v35 = sub_105C4(v15, v17, &v36);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2080;
      uint64_t v35 = sub_105C4(0xD000000000000019, 0x80000000000177B0, &v36);
      sub_155D8();
      *(_WORD *)(v12 + 22) = 2080;
      uint64_t v18 = sub_15018();
      uint64_t v35 = sub_105C4(v18, v19, &v36);
      sub_155D8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 32) = 2080;
      if (a1)
      {
        swift_getErrorValue();
        uint64_t v20 = sub_15708();
        unint64_t v22 = v21;
      }
      else
      {
        unint64_t v22 = 0xE300000000000000;
        uint64_t v20 = 7104878;
      }
      uint64_t v35 = sub_105C4(v20, v22, &v36);
      sub_155D8();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v10, (os_log_type_t)v32, "%s, %s: buttonTitle: %s, End session error: %s", (uint8_t *)v12, 0x2Au);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v33);
      id v9 = v34;
      if (!a1) {
        goto LABEL_12;
      }
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      if (!a1)
      {
LABEL_12:

        return;
      }
    }
    unint64_t v23 = self;
    swift_errorRetain();
    id v24 = [v23 standardUserDefaults];
    sub_15048();
    NSString v25 = sub_15488();
    swift_bridgeObjectRelease();
    unsigned int v26 = [v24 BOOLForKey:v25];

    if (v26)
    {
      sub_15028();
      NSString v27 = sub_15488();
      swift_bridgeObjectRelease();
      swift_getErrorValue();
      sub_15708();
      NSString v28 = sub_15488();
      swift_bridgeObjectRelease();
      sub_15018();
      NSString v29 = sub_15488();
      swift_bridgeObjectRelease();
      [v9 _presentAlertWithTitle:v27 message:v28 buttonTitle:v29 completion:0];
      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
    }
    goto LABEL_12;
  }
}

uint64_t sub_6DB8()
{
  uint64_t v1 = sub_15388();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_15368();
  id v5 = v0;
  id v6 = sub_15378();
  os_log_type_t v7 = sub_15578();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v21 = v19;
    *(_DWORD *)uint64_t v8 = 136315394;
    v17[1] = v8 + 4;
    id v9 = v5;
    id v10 = [v9 description];
    uint64_t v11 = sub_15498();
    uint64_t v18 = v1;
    uint64_t v12 = v11;
    unint64_t v14 = v13;

    uint64_t v20 = sub_105C4(v12, v14, &v21);
    sub_155D8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    uint64_t v20 = sub_105C4(0xD00000000000001DLL, 0x8000000000017380, &v21);
    sub_155D8();
    _os_log_impl(&dword_0, v6, v7, "%s, %s: User requested safe to trigger prompt, dismissing", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v18);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  *(void *)(swift_allocObject() + 16) = v5;
  id v15 = v5;
  sub_151D8();
  return swift_release();
}

void sub_7088(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_15388();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_errorRetain();
    sub_15368();
    swift_errorRetain();
    id v8 = a2;
    swift_errorRetain();
    id v9 = v8;
    id v10 = sub_15378();
    os_log_type_t v11 = sub_15558();
    int v12 = v11;
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      uint64_t v34 = v31;
      *(_DWORD *)uint64_t v13 = 136315650;
      uint64_t v29 = v13 + 4;
      id v14 = v9;
      uint64_t v32 = v4;
      id v15 = v14;
      id v16 = [v14 description];
      uint64_t v17 = sub_15498();
      int v30 = v12;
      id v18 = v9;
      unint64_t v20 = v19;

      uint64_t v33 = sub_105C4(v17, v20, &v34);
      sub_155D8();

      id v9 = v18;
      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2080;
      uint64_t v33 = sub_105C4(0xD00000000000001DLL, 0x8000000000017380, &v34);
      sub_155D8();
      *(_WORD *)(v13 + 22) = 2080;
      swift_getErrorValue();
      uint64_t v21 = sub_15708();
      uint64_t v33 = sub_105C4(v21, v22, &v34);
      sub_155D8();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v10, (os_log_type_t)v30, "%s, %s: Continue session error, %s", (uint8_t *)v13, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v32);
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    id v23 = [self standardUserDefaults];
    sub_15048();
    NSString v24 = sub_15488();
    swift_bridgeObjectRelease();
    unsigned int v25 = [v23 BOOLForKey:v24];

    if (v25)
    {
      sub_15038();
      NSString v26 = sub_15488();
      swift_bridgeObjectRelease();
      swift_getErrorValue();
      sub_15708();
      NSString v27 = sub_15488();
      swift_bridgeObjectRelease();
      sub_15018();
      NSString v28 = sub_15488();
      swift_bridgeObjectRelease();
      [v9 _presentAlertWithTitle:v26 message:v27 buttonTitle:v28 completion:0];
      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
    }
  }
}

id sub_74AC(void *a1)
{
  uint64_t v3 = sub_15388();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_15348();
  id v7 = v1;
  id v8 = sub_15378();
  os_log_type_t v9 = sub_15538();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v56 = swift_slowAlloc();
    uint64_t v60 = v56;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v55 = v10 + 4;
    id v11 = v7;
    v58 = a1;
    id v12 = v11;
    id v13 = [v11 description];
    uint64_t v57 = v3;
    id v14 = v13;
    uint64_t v15 = sub_15498();
    unint64_t v17 = v16;

    uint64_t v59 = sub_105C4(v15, v17, &v60);
    sub_155D8();

    a1 = v58;
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    uint64_t v59 = sub_105C4(0xD000000000000020, 0x80000000000173C0, &v60);
    sub_155D8();
    _os_log_impl(&dword_0, v8, v9, "%s, %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v57);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_AE08();
  [v7 addChildViewController:a1];
  id result = [a1 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_19;
  }
  unint64_t v19 = result;
  id result = [v7 view];
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  unint64_t v20 = result;
  [result bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  objc_msgSend(v19, "setFrame:", v22, v24, v26, v28);
  id result = [v7 view];
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v29 = result;
  id result = [a1 view];
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int v30 = result;
  [v29 addSubview:result];

  id result = [a1 view];
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v31 = result;
  [result setTranslatesAutoresizingMaskIntoConstraints:0];

  sub_2C4C(&qword_1C858);
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_166A0;
  id result = [a1 view];
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v33 = result;
  id v34 = [result leftAnchor];

  id result = [v7 view];
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v35 = result;
  id v36 = [result leftAnchor];

  id v37 = [v34 constraintEqualToAnchor:v36];
  *(void *)(v32 + 32) = v37;
  id result = [a1 view];
  if (!result)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int v38 = result;
  id v39 = [result rightAnchor];

  id result = [v7 view];
  if (!result)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v40 = result;
  id v41 = [result rightAnchor];

  id v42 = [v39 constraintEqualToAnchor:v41];
  *(void *)(v32 + 40) = v42;
  id result = [a1 view];
  if (!result)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v43 = result;
  id v44 = [result topAnchor];

  id result = [v7 view];
  if (!result)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v45 = result;
  id v46 = [result topAnchor];

  id v47 = [v44 constraintEqualToAnchor:v46];
  *(void *)(v32 + 48) = v47;
  id result = [a1 view];
  if (!result)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  id v48 = result;
  id v49 = [result bottomAnchor];

  id result = [v7 view];
  if (result)
  {
    uint64_t v50 = result;
    uint64_t v51 = self;
    id v52 = [v50 bottomAnchor];

    id v53 = [v49 constraintEqualToAnchor:v52];
    *(void *)(v32 + 56) = v53;
    uint64_t v60 = v32;
    sub_15518();
    sub_13E18(0, &qword_1C860);
    Class isa = sub_154E8().super.isa;
    swift_bridgeObjectRelease();
    [v51 activateConstraints:isa];

    [a1 didMoveToParentViewController:v7];
    return [v7 requestResize];
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_7BA8(char *a1)
{
  uint64_t v3 = sub_14EB8();
  uint64_t v98 = *(void *)(v3 - 8);
  uint64_t v99 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  os_log_t v94 = (os_log_t)&v90[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v93 = &v90[-v6];
  uint64_t v7 = sub_15388();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v100 = v7;
  uint64_t v101 = v8;
  uint64_t v9 = __chkstk_darwin(v7);
  id v11 = &v90[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = __chkstk_darwin(v9);
  unint64_t v95 = &v90[-v13];
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v97 = &v90[-v15];
  __chkstk_darwin(v14);
  v96 = &v90[-v16];
  uint64_t v17 = sub_2C4C(&qword_1C7A0);
  __chkstk_darwin(v17 - 8);
  unint64_t v19 = &v90[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v20 = sub_15338();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  double v24 = &v90[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v22);
  double v26 = &v90[-v25];
  uint64_t v27 = (uint64_t)v1 + OBJC_IVAR___MessagesViewController_userType;
  swift_beginAccess();
  sub_13E94(v27, (uint64_t)v19, &qword_1C7A0);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) != 1)
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v21 + 32))(v26, v19, v20);
    id v37 = sub_A5A4(a1);
    if (v37)
    {
      int v38 = v37;
      id v39 = a1;
      sub_74AC(v37);
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v21 + 16))(v24, v26, v20);
      int v40 = (*(uint64_t (**)(unsigned char *, uint64_t))(v21 + 88))(v24, v20);
      if (v40 != enum case for UserType.initiator(_:))
      {
        unint64_t v95 = (unsigned char *)v21;
        uint64_t v71 = v98;
        uint64_t v70 = v99;
        if (v40 == enum case for UserType.receiver(_:))
        {
          v72 = v97;
          sub_15358();
          os_log_t v73 = v94;
          (*(void (**)(os_log_t, char *, uint64_t))(v71 + 16))(v94, a1, v70);
          id v74 = v1;
          char v75 = sub_15378();
          os_log_type_t v76 = sub_15578();
          int v77 = v76;
          if (os_log_type_enabled(v75, v76))
          {
            uint64_t v78 = swift_slowAlloc();
            uint64_t v79 = swift_slowAlloc();
            v96 = v26;
            uint64_t v93 = (unsigned char *)v79;
            os_log_t v103 = (unsigned char *)v79;
            *(_DWORD *)uint64_t v78 = 136315650;
            int v91 = v77;
            uint64_t v80 = v71;
            id v81 = v74;
            id v82 = [v81 description];
            uint64_t v83 = sub_15498();
            uint64_t v92 = v20;
            uint64_t v84 = v83;
            unint64_t v86 = v85;

            uint64_t v102 = sub_105C4(v84, v86, (uint64_t *)&v103);
            sub_155D8();

            swift_bridgeObjectRelease();
            *(_WORD *)(v78 + 12) = 2080;
            uint64_t v102 = sub_105C4(0xD000000000000025, 0x80000000000173F0, (uint64_t *)&v103);
            sub_155D8();
            *(_WORD *)(v78 + 22) = 2080;
            sub_10C1C(&qword_1C840, (void (*)(uint64_t))&type metadata accessor for URL);
            uint64_t v87 = v99;
            uint64_t v88 = sub_156D8();
            uint64_t v102 = sub_105C4(v88, v89, (uint64_t *)&v103);
            sub_155D8();
            swift_bridgeObjectRelease();
            (*(void (**)(os_log_t, uint64_t))(v80 + 8))(v73, v87);
            _os_log_impl(&dword_0, v75, (os_log_type_t)v91, "%s, %s: Presenting transcript for url: %s", (uint8_t *)v78, 0x20u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            (*(void (**)(unsigned char *, uint64_t))(v101 + 8))(v97, v100);
            return (*((uint64_t (**)(unsigned char *, uint64_t))v95 + 1))(v96, v92);
          }
          else
          {

            (*(void (**)(os_log_t, uint64_t))(v71 + 8))(v73, v70);
            (*(void (**)(unsigned char *, uint64_t))(v101 + 8))(v72, v100);
            return (*((uint64_t (**)(unsigned char *, uint64_t))v95 + 1))(v26, v20);
          }
        }
        else
        {
          uint64_t result = sub_156E8();
          __break(1u);
        }
        return result;
      }
      id v41 = v96;
      sub_15368();
      uint64_t v43 = v98;
      uint64_t v42 = v99;
      id v44 = v93;
      (*(void (**)(unsigned char *, char *, uint64_t))(v98 + 16))(v93, v39, v99);
      id v45 = v1;
      id v46 = sub_15378();
      os_log_type_t v47 = sub_15578();
      LODWORD(v97) = v47;
      if (os_log_type_enabled(v46, v47))
      {
        uint64_t v48 = swift_slowAlloc();
        unint64_t v95 = (unsigned char *)swift_slowAlloc();
        os_log_t v103 = v95;
        *(_DWORD *)uint64_t v48 = 136315650;
        os_log_t v94 = v46;
        id v49 = v45;
        id v50 = [v49 description];
        uint64_t v51 = sub_15498();
        uint64_t v92 = v20;
        unint64_t v53 = v52;

        uint64_t v102 = sub_105C4(v51, v53, (uint64_t *)&v103);
        sub_155D8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v48 + 12) = 2080;
        uint64_t v102 = sub_105C4(0xD000000000000025, 0x80000000000173F0, (uint64_t *)&v103);
        sub_155D8();
        *(_WORD *)(v48 + 22) = 2080;
        sub_10C1C(&qword_1C840, (void (*)(uint64_t))&type metadata accessor for URL);
        uint64_t v54 = v99;
        uint64_t v55 = sub_156D8();
        uint64_t v102 = sub_105C4(v55, v56, (uint64_t *)&v103);
        sub_155D8();
        swift_bridgeObjectRelease();
        (*(void (**)(unsigned char *, uint64_t))(v98 + 8))(v44, v54);
        os_log_t v57 = v94;
        _os_log_impl(&dword_0, v94, (os_log_type_t)v97, "%s, %s: Presenting transcript for url: %s", (uint8_t *)v48, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(unsigned char *, uint64_t))(v101 + 8))(v96, v100);
        return (*(uint64_t (**)(unsigned char *, uint64_t))(v21 + 8))(v26, v92);
      }

      (*(void (**)(unsigned char *, uint64_t))(v43 + 8))(v44, v42);
      (*(void (**)(unsigned char *, uint64_t))(v101 + 8))(v41, v100);
    }
    else
    {
      uint64_t v59 = v95;
      sub_15358();
      id v60 = v1;
      uint64_t v61 = sub_15378();
      os_log_type_t v62 = sub_15558();
      if (os_log_type_enabled(v61, v62))
      {
        uint64_t v63 = swift_slowAlloc();
        os_log_t v103 = (unsigned char *)swift_slowAlloc();
        *(_DWORD *)uint64_t v63 = 136315394;
        uint64_t v92 = v20;
        uint64_t v99 = v63 + 4;
        id v64 = v60;
        uint64_t v65 = v21;
        id v66 = [v64 description];
        uint64_t v67 = sub_15498();
        v96 = v26;
        unint64_t v69 = v68;

        uint64_t v102 = sub_105C4(v67, v69, (uint64_t *)&v103);
        sub_155D8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v63 + 12) = 2080;
        uint64_t v102 = sub_105C4(0xD000000000000025, 0x80000000000173F0, (uint64_t *)&v103);
        sub_155D8();
        _os_log_impl(&dword_0, v61, v62, "%s, %s: Unable to present transcript VC because of invalid url", (uint8_t *)v63, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(unsigned char *, uint64_t))(v101 + 8))(v59, v100);
        return (*(uint64_t (**)(unsigned char *, uint64_t))(v65 + 8))(v96, v92);
      }

      (*(void (**)(unsigned char *, uint64_t))(v101 + 8))(v59, v100);
    }
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v21 + 8))(v26, v20);
  }
  sub_13D54((uint64_t)v19, &qword_1C7A0);
  sub_15358();
  id v28 = v1;
  uint64_t v29 = sub_15378();
  os_log_type_t v30 = sub_15558();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = swift_slowAlloc();
    os_log_t v103 = (unsigned char *)swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 136315394;
    id v32 = v28;
    id v33 = [v32 description];
    uint64_t v34 = sub_15498();
    unint64_t v36 = v35;

    uint64_t v102 = sub_105C4(v34, v36, (uint64_t *)&v103);
    sub_155D8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2080;
    uint64_t v102 = sub_105C4(0xD000000000000025, 0x80000000000173F0, (uint64_t *)&v103);
    sub_155D8();
    _os_log_impl(&dword_0, v29, v30, "%s, %s: userType is not initialized", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v101 + 8))(v11, v100);
}

uint64_t sub_88B8@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  v233 = a1;
  uint64_t v234 = a2;
  v221 = (void *)sub_150F8();
  uint64_t v220 = *(v221 - 1);
  __chkstk_darwin(v221);
  v222 = (char *)v205 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_14EB8();
  v230 = *(void (***)(char *, char *, id))(v5 - 8);
  id v231 = (id)v5;
  uint64_t v6 = __chkstk_darwin(v5);
  v225 = (char *)v205 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  v224 = (char *)v205 - v9;
  __chkstk_darwin(v8);
  v213 = (char *)v205 - v10;
  uint64_t v11 = sub_15388();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v236 = v11;
  uint64_t v237 = v12;
  uint64_t v13 = __chkstk_darwin(v11);
  v235 = (char *)v205 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  v226 = (char *)v205 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v219 = (char *)v205 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  v227 = (char *)v205 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  v223 = (char *)v205 - v22;
  __chkstk_darwin(v21);
  v218 = (char *)v205 - v23;
  uint64_t v228 = sub_2C4C(&qword_1C798);
  uint64_t v24 = __chkstk_darwin(v228);
  uint64_t v217 = (uint64_t)v205 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v229 = (uint64_t)v205 - v26;
  uint64_t v27 = sub_2C4C(&qword_1C7A0);
  uint64_t v28 = __chkstk_darwin(v27 - 8);
  uint64_t v212 = (uint64_t)v205 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __chkstk_darwin(v28);
  v216 = (char *)v205 - v31;
  uint64_t v32 = __chkstk_darwin(v30);
  uint64_t v215 = (uint64_t)v205 - v33;
  uint64_t v34 = __chkstk_darwin(v32);
  unint64_t v36 = (char *)v205 - v35;
  __chkstk_darwin(v34);
  int v38 = (char *)v205 - v37;
  uint64_t v39 = sub_15338();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = __chkstk_darwin(v39);
  uint64_t v43 = (char *)v205 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v41);
  id v45 = (char *)v205 - v44;
  uint64_t v46 = (uint64_t)&v3[OBJC_IVAR___MessagesViewController_userType];
  swift_beginAccess();
  sub_13E94(v46, (uint64_t)v38, &qword_1C7A0);
  os_log_type_t v47 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48);
  if (v47(v38, 1, v39) == 1)
  {
    sub_13D54((uint64_t)v38, &qword_1C7A0);
    sub_15358();
    uint64_t v48 = v3;
    id v49 = sub_15378();
    os_log_type_t v50 = sub_15558();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = swift_slowAlloc();
      v239 = (char *)swift_slowAlloc();
      *(_DWORD *)uint64_t v51 = 136315394;
      unint64_t v52 = v48;
      id v53 = [v52 description];
      uint64_t v54 = sub_15498();
      unint64_t v56 = v55;

      uint64_t v238 = sub_105C4(v54, v56, (uint64_t *)&v239);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v51 + 12) = 2080;
      uint64_t v238 = sub_105C4(0xD000000000000014, 0x8000000000017360, (uint64_t *)&v239);
      sub_155D8();
      _os_log_impl(&dword_0, v49, v50, "%s, %s: Expected userType, found nil", (uint8_t *)v51, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v79 = v236;
    uint64_t v80 = *(uint64_t (**)(char *, uint64_t))(v237 + 8);
    id v81 = v235;
LABEL_11:
    uint64_t result = v80(v81, v79);
    uint64_t v83 = (_OWORD *)v234;
    *(void *)(v234 + 32) = 0;
    *uint64_t v83 = 0u;
    v83[1] = 0u;
    return result;
  }
  v208 = v36;
  uint64_t v209 = v46;
  v210 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v47;
  uint64_t v211 = v40 + 48;
  v235 = v3;
  v207 = v43;
  uint64_t v232 = v40;
  uint64_t v58 = v40 + 32;
  os_log_t v57 = *(void (**)(char *, char *, uint64_t))(v40 + 32);
  v57(v45, v38, v39);
  uint64_t v59 = self;
  id v60 = v233;
  sub_14E88(v61);
  uint64_t v63 = v62;
  id v64 = [v59 createMessageFromURL:v62];

  uint64_t v214 = v39;
  uint64_t v65 = v45;
  if (v64)
  {
    v225 = *(char **)&v235[OBJC_IVAR___MessagesViewController_safetyCacheViewModel];
    if (!v225)
    {
      uint64_t v102 = v219;
      sub_15358();
      os_log_t v103 = v235;
      uint64_t v104 = sub_15378();
      os_log_type_t v105 = sub_15558();
      if (os_log_type_enabled(v104, v105))
      {
        uint64_t v106 = swift_slowAlloc();
        v239 = (char *)swift_slowAlloc();
        *(_DWORD *)uint64_t v106 = 136315394;
        v226 = v45;
        uint64_t v107 = v103;
        id v108 = [v107 description];
        uint64_t v109 = sub_15498();
        v110 = v64;
        unint64_t v112 = v111;

        uint64_t v238 = sub_105C4(v109, v112, (uint64_t *)&v239);
        sub_155D8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v106 + 12) = 2080;
        uint64_t v238 = sub_105C4(0xD000000000000014, 0x8000000000017360, (uint64_t *)&v239);
        sub_155D8();
        _os_log_impl(&dword_0, v104, v105, "%s, %s: Expected safetyCacheViewModel, found nil", (uint8_t *)v106, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v237 + 8))(v219, v236);
        uint64_t v80 = *(uint64_t (**)(char *, uint64_t))(v232 + 8);
        id v81 = v226;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v237 + 8))(v102, v236);
        uint64_t v80 = *(uint64_t (**)(char *, uint64_t))(v232 + 8);
        id v81 = v45;
      }
      uint64_t v79 = v214;
      goto LABEL_11;
    }
    uint64_t v66 = v39;
    v226 = v45;
    uint64_t v67 = v232;
    unint64_t v68 = *(char **)(v232 + 104);
    uint64_t v69 = (uint64_t)v208;
    uint64_t v220 = v232 + 104;
    v219 = v68;
    ((void (*)(char *, void, uint64_t))v68)(v208, enum case for UserType.receiver(_:), v39);
    v221 = *(void **)(v67 + 56);
    ((void (*)(uint64_t, void, uint64_t, uint64_t))v221)(v69, 0, 1, v39);
    uint64_t v70 = v229;
    uint64_t v71 = v229 + *(int *)(v228 + 48);
    sub_13E94(v209, v229, &qword_1C7A0);
    sub_13E94(v69, v71, &qword_1C7A0);
    uint64_t v72 = v39;
    os_log_t v73 = v210;
    int v74 = v210(v70, 1, v72);
    v205[1] = v58;
    v205[0] = v57;
    id v206 = v64;
    v222 = (char *)(v67 + 56);
    if (v74 == 1)
    {
      char v75 = v225;
      sub_13D54(v69, &qword_1C7A0);
      int v76 = v73(v71, 1, v66);
      uint64_t v78 = v230;
      id v77 = v231;
      if (v76 == 1)
      {
        sub_13D54(v229, &qword_1C7A0);
LABEL_27:
        v147 = v218;
        sub_15358();
        v148 = v213;
        v78[2](v213, v233, v77);
        v149 = v235;
        id v150 = v77;
        v151 = v78;
        v152 = sub_15378();
        os_log_type_t v153 = sub_15578();
        int v154 = v153;
        if (os_log_type_enabled(v152, v153))
        {
          uint64_t v155 = swift_slowAlloc();
          v239 = (char *)swift_slowAlloc();
          *(_DWORD *)uint64_t v155 = 136315650;
          v156 = v149;
          id v157 = [v156 description];
          uint64_t v158 = sub_15498();
          LODWORD(v233) = v154;
          unint64_t v160 = v159;

          uint64_t v238 = sub_105C4(v158, v160, (uint64_t *)&v239);
          sub_155D8();

          swift_bridgeObjectRelease();
          *(_WORD *)(v155 + 12) = 2080;
          uint64_t v238 = sub_105C4(0xD000000000000014, 0x8000000000017360, (uint64_t *)&v239);
          sub_155D8();
          *(_WORD *)(v155 + 22) = 2080;
          sub_10C1C(&qword_1C840, (void (*)(uint64_t))&type metadata accessor for URL);
          id v161 = v231;
          uint64_t v162 = sub_156D8();
          uint64_t v238 = sub_105C4(v162, v163, (uint64_t *)&v239);
          uint64_t v131 = v232;
          sub_155D8();
          swift_bridgeObjectRelease();
          ((void (*)(char *, id))v151[1])(v148, v161);
          _os_log_impl(&dword_0, v152, (os_log_type_t)v233, "%s, %s: Creating transcript view model with url, %s", (uint8_t *)v155, 0x20u);
          swift_arrayDestroy();
          uint64_t v66 = v214;
          swift_slowDealloc();
          swift_slowDealloc();

          v132 = *(void (***)(char *, char *, id))(v237 + 8);
          v133 = &v240;
          goto LABEL_29;
        }

        ((void (*)(char *, id))v151[1])(v148, v150);
        v141 = *(void (***)(char *, char *, id))(v237 + 8);
        v142 = v147;
        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v113 = v215;
      sub_13E94(v70, v215, &qword_1C7A0);
      if (v73(v71, 1, v66) != 1)
      {
        v143 = v207;
        v57(v207, (char *)v71, v66);
        sub_10C1C(&qword_1C7B0, (void (*)(uint64_t))&type metadata accessor for UserType);
        v144 = v225;
        char v145 = sub_15408();
        v146 = *(void (**)(char *, uint64_t))(v232 + 8);
        v146(v143, v66);
        sub_13D54((uint64_t)v208, &qword_1C7A0);
        v146((char *)v113, v66);
        sub_13D54(v70, &qword_1C7A0);
        uint64_t v78 = v230;
        id v77 = v231;
        v115 = v224;
        v116 = v223;
        if (v145) {
          goto LABEL_27;
        }
LABEL_19:
        sub_15368();
        v78[2](v115, v233, v77);
        uint64_t v117 = v235;
        v118 = v116;
        uint64_t v119 = sub_15378();
        os_log_type_t v120 = sub_15578();
        if (os_log_type_enabled(v119, v120))
        {
          uint64_t v121 = swift_slowAlloc();
          v233 = (char *)swift_slowAlloc();
          v239 = v233;
          *(_DWORD *)uint64_t v121 = 136315650;
          uint64_t v122 = v117;
          id v123 = [v122 description];
          uint64_t v124 = sub_15498();
          id v125 = v77;
          unint64_t v127 = v126;

          uint64_t v238 = sub_105C4(v124, v127, (uint64_t *)&v239);
          sub_155D8();

          swift_bridgeObjectRelease();
          *(_WORD *)(v121 + 12) = 2080;
          uint64_t v238 = sub_105C4(0xD000000000000014, 0x8000000000017360, (uint64_t *)&v239);
          sub_155D8();
          *(_WORD *)(v121 + 22) = 2080;
          sub_10C1C(&qword_1C840, (void (*)(uint64_t))&type metadata accessor for URL);
          v128 = v224;
          uint64_t v129 = sub_156D8();
          uint64_t v238 = sub_105C4(v129, v130, (uint64_t *)&v239);
          uint64_t v131 = v232;
          sub_155D8();
          swift_bridgeObjectRelease();
          ((void (*)(char *, id))v78[1])(v128, v125);
          _os_log_impl(&dword_0, v119, v120, "%s, %s: Creating transcript view model with url, %s", (uint8_t *)v121, 0x20u);
          swift_arrayDestroy();
          uint64_t v66 = v214;
          swift_slowDealloc();
          swift_slowDealloc();

          v132 = *(void (***)(char *, char *, id))(v237 + 8);
          v133 = &v241;
LABEL_29:
          uint64_t v164 = *(v133 - 32);
          v230 = v132;
          ((void (*)(uint64_t, uint64_t))v132)(v164, v236);
          v165 = v227;
          v166 = v206;
          goto LABEL_32;
        }

        ((void (*)(char *, id))v78[1])(v115, v77);
        v141 = *(void (***)(char *, char *, id))(v237 + 8);
        v142 = v118;
LABEL_31:
        v230 = v141;
        ((void (*)(char *, uint64_t))v141)(v142, v236);
        v165 = v227;
        v166 = v206;
        uint64_t v131 = v232;
LABEL_32:
        id v167 = v235;
        id v168 = sub_D1FC();
        (*(void (**)(char *, char *, uint64_t))(v131 + 16))(v207, v226, v66);
        sub_15248();
        swift_allocObject();
        v169 = v225;
        id v170 = v166;
        v171 = (char *)v168;
        swift_retain();
        swift_retain();
        id v231 = v170;
        v233 = v171;
        v172 = (char *)sub_15238();
        [v167 _balloonMaskEdgeInsets];
        uint64_t v174 = v173;
        uint64_t v176 = v175;
        uint64_t v178 = v177;
        uint64_t v180 = v179;
        sub_15368();
        id v181 = v167;
        v182 = sub_15378();
        int v183 = sub_15548();
        if (!os_log_type_enabled(v182, (os_log_type_t)v183))
        {

          ((void (*)(char *, uint64_t))v230)(v165, v236);
          v200 = v233;
          v199 = (uint64_t *)v234;
          v198 = v231;
LABEL_42:
          v199[3] = sub_150E8();
          v199[4] = sub_10C1C(&qword_1C848, (void (*)(uint64_t))&type metadata accessor for TranscriptView);
          sub_13508(v199);
          sub_150D8();

          return (*(uint64_t (**)(char *, uint64_t))(v232 + 8))(v226, v214);
        }
        LODWORD(v229) = v183;
        v235 = v172;
        uint64_t v184 = swift_slowAlloc();
        v225 = (char *)swift_slowAlloc();
        v239 = v225;
        *(_DWORD *)uint64_t v184 = 136316674;
        id v185 = v181;
        id v186 = [v185 description];
        uint64_t v187 = sub_15498();
        unint64_t v189 = v188;

        uint64_t v238 = sub_105C4(v187, v189, (uint64_t *)&v239);
        sub_155D8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v184 + 12) = 2080;
        uint64_t v238 = sub_105C4(0xD000000000000014, 0x8000000000017360, (uint64_t *)&v239);
        sub_155D8();
        *(_WORD *)(v184 + 22) = 2080;
        uint64_t v190 = (uint64_t)v216;
        ((void (*)(char *, void, uint64_t))v219)(v216, enum case for UserType.initiator(_:), v66);
        ((void (*)(uint64_t, void, uint64_t, uint64_t))v221)(v190, 0, 1, v66);
        uint64_t v191 = v217;
        uint64_t v192 = v217 + *(int *)(v228 + 48);
        sub_13E94(v209, v217, &qword_1C7A0);
        sub_13E94(v190, v192, &qword_1C7A0);
        v193 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v210;
        if (v210(v191, 1, v66) == 1)
        {
          if (v193(v192, 1, v66) == 1)
          {
            uint64_t v194 = 0x7265646E6573;
            sub_13D54(v191, &qword_1C7A0);
            sub_13D54(v190, &qword_1C7A0);
            unint64_t v195 = 0xE600000000000000;
            uint64_t v196 = v236;
            v197 = v230;
            v198 = v231;
LABEL_41:
            uint64_t v238 = sub_105C4(v194, v195, (uint64_t *)&v239);
            sub_155D8();

            swift_bridgeObjectRelease();
            *(_WORD *)(v184 + 32) = 2048;
            uint64_t v238 = v176;
            sub_155D8();
            *(_WORD *)(v184 + 42) = 2048;
            uint64_t v238 = v180;
            sub_155D8();
            *(_WORD *)(v184 + 52) = 2048;
            uint64_t v238 = v174;
            sub_155D8();
            *(_WORD *)(v184 + 62) = 2048;
            uint64_t v238 = v178;
            sub_155D8();
            _os_log_impl(&dword_0, v182, (os_log_type_t)v229, "%s, %s: %s insets %f, %f, %f, %f", (uint8_t *)v184, 0x48u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            ((void (*)(char *, uint64_t))v197)(v227, v196);
            v200 = v233;
            v199 = (uint64_t *)v234;
            goto LABEL_42;
          }
        }
        else
        {
          uint64_t v228 = (uint64_t)v169;
          uint64_t v201 = v212;
          sub_13E94(v191, v212, &qword_1C7A0);
          if (v193(v192, 1, v66) != 1)
          {
            v202 = v207;
            ((void (*)(char *, uint64_t, uint64_t))v205[0])(v207, v192, v66);
            sub_10C1C(&qword_1C7B0, (void (*)(uint64_t))&type metadata accessor for UserType);
            LODWORD(v224) = sub_15408();
            uint64_t v203 = v190;
            v204 = *(void (**)(uint64_t, uint64_t))(v232 + 8);
            v204(v201, v66);
            v204((uint64_t)v202, v66);
            sub_13D54(v191, &qword_1C7A0);
            sub_13D54(v203, &qword_1C7A0);
            uint64_t v196 = v236;
            v197 = v230;
            v198 = v231;
            v169 = (char *)v228;
            if (v224)
            {
              uint64_t v194 = 0x7265646E6573;
              unint64_t v195 = 0xE600000000000000;
              goto LABEL_41;
            }
            goto LABEL_40;
          }
          (*(void (**)(uint64_t, uint64_t))(v232 + 8))(v201, v66);
          v169 = (char *)v228;
        }
        sub_13D54(v191, &qword_1C798);
        sub_13D54(v190, &qword_1C7A0);
        uint64_t v196 = v236;
        v197 = v230;
        v198 = v231;
LABEL_40:
        unint64_t v195 = 0xE800000000000000;
        uint64_t v194 = 0x7265766965636572;
        goto LABEL_41;
      }
      uint64_t v114 = v225;
      sub_13D54((uint64_t)v208, &qword_1C7A0);
      (*(void (**)(uint64_t, uint64_t))(v232 + 8))(v113, v66);
      uint64_t v78 = v230;
      id v77 = v231;
    }
    sub_13D54(v229, &qword_1C798);
    v115 = v224;
    v116 = v223;
    goto LABEL_19;
  }
  uint64_t v84 = v60;
  unint64_t v85 = v226;
  sub_15358();
  unint64_t v86 = (void (**)(char *, id))v230;
  id v87 = v231;
  uint64_t v88 = v225;
  v230[2](v225, v84, v231);
  unint64_t v89 = v235;
  unint64_t v90 = sub_15378();
  os_log_type_t v91 = sub_15558();
  int v92 = v91;
  if (os_log_type_enabled(v90, v91))
  {
    uint64_t v93 = swift_slowAlloc();
    v235 = (char *)swift_slowAlloc();
    v239 = v235;
    *(_DWORD *)uint64_t v93 = 136315650;
    os_log_t v94 = v89;
    id v95 = [v94 description];
    uint64_t v96 = sub_15498();
    LODWORD(v233) = v92;
    unint64_t v98 = v97;

    uint64_t v238 = sub_105C4(v96, v98, (uint64_t *)&v239);
    sub_155D8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v93 + 12) = 2080;
    uint64_t v238 = sub_105C4(0xD000000000000014, 0x8000000000017360, (uint64_t *)&v239);
    sub_155D8();
    *(_WORD *)(v93 + 22) = 2080;
    sub_10C1C(&qword_1C840, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v99 = v225;
    uint64_t v100 = sub_156D8();
    uint64_t v238 = sub_105C4(v100, v101, (uint64_t *)&v239);
    sub_155D8();
    swift_bridgeObjectRelease();
    v86[1](v99, v87);
    _os_log_impl(&dword_0, v90, (os_log_type_t)v233, "%s, %s: url is not valid for Zelkova message, %s", (uint8_t *)v93, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v237 + 8))(v226, v236);
  }
  else
  {

    v86[1](v88, v87);
    (*(void (**)(char *, uint64_t))(v237 + 8))(v85, v236);
  }
  v134 = v222;
  v135 = v221;
  uint64_t v136 = v220;
  uint64_t v137 = v232;
  uint64_t v138 = v214;
  (*(void (**)(char *, char *, uint64_t))(v232 + 16))(v222, v65, v214);
  (*(void (**)(char *, void, void *))(v136 + 104))(v134, enum case for CheckInViewState.unknown(_:), v135);
  uint64_t v139 = sub_15068();
  v140 = (uint64_t *)v234;
  *(void *)(v234 + 24) = v139;
  v140[4] = sub_10C1C(&qword_1C838, (void (*)(uint64_t))&type metadata accessor for CheckInView);
  sub_13508(v140);
  sub_15058();
  return (*(uint64_t (**)(char *, uint64_t))(v137 + 8))(v65, v138);
}

id sub_A5A4(char *a1)
{
  uint64_t v3 = sub_15388();
  uint64_t v57 = *(void *)(v3 - 8);
  uint64_t v58 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v59 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  unint64_t v55 = (char *)&v53 - v6;
  uint64_t v7 = sub_2C4C(&qword_1C810);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_15068();
  uint64_t v56 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v54 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v53 - v13;
  uint64_t v15 = sub_2C4C(&qword_1C818);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_150E8();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v53 - v23;
  sub_88B8(a1, (uint64_t)&v61);
  if (v62)
  {
    sub_1348C(&v61, (uint64_t)v63);
    sub_134A4((uint64_t)v63, (uint64_t)&v61);
    sub_2C4C(&qword_1C828);
    int v25 = swift_dynamicCast();
    uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
    if (v25)
    {
      v26(v17, 0, 1, v18);
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v24, v17, v18);
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v22, v24, v18);
      id v27 = objc_allocWithZone((Class)sub_152D8());
      id v28 = (id)sub_152C8();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v24, v18);
    }
    else
    {
      v26(v17, 1, 1, v18);
      sub_13D54((uint64_t)v17, &qword_1C818);
      sub_134A4((uint64_t)v63, (uint64_t)&v61);
      int v38 = swift_dynamicCast();
      uint64_t v39 = v56;
      uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v56 + 56);
      if (v38)
      {
        v40(v9, 0, 1, v10);
        (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v14, v9, v10);
        (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v54, v14, v10);
        id v41 = objc_allocWithZone((Class)sub_2C4C(&qword_1C830));
        id v28 = (id)sub_15398();
        (*(void (**)(char *, uint64_t))(v39 + 8))(v14, v10);
      }
      else
      {
        v40(v9, 1, 1, v10);
        sub_13D54((uint64_t)v9, &qword_1C810);
        uint64_t v42 = v55;
        sub_15368();
        id v43 = v1;
        uint64_t v44 = sub_15378();
        os_log_type_t v45 = sub_15558();
        if (os_log_type_enabled(v44, v45))
        {
          uint64_t v46 = swift_slowAlloc();
          *(void *)&long long v61 = swift_slowAlloc();
          *(_DWORD *)uint64_t v46 = 136315394;
          id v47 = v43;
          id v48 = [v47 description];
          uint64_t v49 = sub_15498();
          unint64_t v51 = v50;

          uint64_t v60 = sub_105C4(v49, v51, (uint64_t *)&v61);
          sub_155D8();

          swift_bridgeObjectRelease();
          *(_WORD *)(v46 + 12) = 2080;
          uint64_t v60 = sub_105C4(0xD00000000000001ELL, 0x8000000000017340, (uint64_t *)&v61);
          sub_155D8();
          _os_log_impl(&dword_0, v44, v45, "%s, %s: Invalid transcript view", (uint8_t *)v46, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        (*(void (**)(char *, uint64_t))(v57 + 8))(v42, v58);
        id v28 = [objc_allocWithZone((Class)UIViewController) init];
      }
    }
    sub_13F14((uint64_t)v63);
  }
  else
  {
    sub_13D54((uint64_t)&v61, &qword_1C820);
    sub_15368();
    id v29 = v1;
    uint64_t v30 = sub_15378();
    os_log_type_t v31 = sub_15558();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = swift_slowAlloc();
      v63[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 136315394;
      id v33 = v29;
      id v34 = [v33 description];
      uint64_t v35 = sub_15498();
      unint64_t v37 = v36;

      *(void *)&long long v61 = sub_105C4(v35, v37, v63);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 12) = 2080;
      *(void *)&long long v61 = sub_105C4(0xD00000000000001ELL, 0x8000000000017340, v63);
      sub_155D8();
      _os_log_impl(&dword_0, v30, v31, "%s, %s: Unexpected nil transcript view", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v57 + 8))(v59, v58);
    return 0;
  }
  return v28;
}

id sub_AE08()
{
  id v1 = [v0 childViewControllers];
  sub_13E18(0, &qword_1C850);
  unint64_t v2 = sub_154F8();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
    if (v3) {
      goto LABEL_3;
    }
LABEL_10:
    return (id)swift_bridgeObjectRelease();
  }
LABEL_14:
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_156A8();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_10;
  }
LABEL_3:
  uint64_t v4 = 4;
  while (1)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)sub_15678();
    }
    else {
      id v5 = *(id *)(v2 + 8 * v4);
    }
    uint64_t v6 = v5;
    uint64_t v7 = v4 - 3;
    if (__OFADD__(v4 - 4, 1))
    {
      __break(1u);
      goto LABEL_14;
    }
    [v5 willMoveToParentViewController:0];
    id result = [v6 view];
    if (!result) {
      break;
    }
    uint64_t v9 = result;
    [result removeFromSuperview];

    [v6 removeFromParentViewController];
    ++v4;
    if (v7 == v3) {
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

void sub_AF84(void *a1)
{
  uint64_t v3 = sub_2C4C(&qword_1C768);
  __chkstk_darwin(v3 - 8);
  uint64_t v191 = (char *)v182 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v197 = sub_14EB8();
  id v206 = *(void (***)(char *, uint64_t, uint64_t, uint64_t))(v197 - 8);
  uint64_t v5 = __chkstk_darwin(v197);
  uint64_t v187 = (char *)v182 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v186 = v6;
  __chkstk_darwin(v5);
  uint64_t v192 = (char *)v182 - v7;
  uint64_t v8 = sub_2C4C(&qword_1C7A0);
  __chkstk_darwin(v8 - 8);
  v204 = (char *)v182 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v205 = sub_14F18();
  uint64_t v203 = *(void *)(v205 - 8);
  uint64_t v10 = __chkstk_darwin(v205);
  unint64_t v189 = (char *)v182 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  unint64_t v195 = (char *)v182 - v13;
  __chkstk_darwin(v12);
  v208 = ((char *)v182 - v14);
  uint64_t v210 = sub_15338();
  uint64_t v15 = *(void *)(v210 - 8);
  uint64_t v16 = __chkstk_darwin(v210);
  uint64_t v201 = (char *)v182 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)v182 - v18;
  uint64_t v20 = sub_2C4C(&qword_1C760);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  uint64_t v196 = (void (*)(char *, uint64_t, uint64_t, uint64_t))((char *)v182 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)v182 - v23;
  uint64_t v25 = sub_15388();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v190 = (char *)v182 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __chkstk_darwin(v27);
  unint64_t v188 = (char *)v182 - v30;
  uint64_t v31 = __chkstk_darwin(v29);
  id v185 = (char *)v182 - v32;
  uint64_t v33 = __chkstk_darwin(v31);
  v198 = (char *)v182 - v34;
  __chkstk_darwin(v33);
  unint64_t v36 = (char *)v182 - v35;
  sub_15368();
  id v37 = v1;
  id v38 = a1;
  uint64_t v39 = (char *)v37;
  uint64_t v40 = (char *)v38;
  id v41 = sub_15378();
  int v42 = sub_15578();
  BOOL v43 = os_log_type_enabled(v41, (os_log_type_t)v42);
  uint64_t v207 = v15;
  uint64_t v209 = v19;
  uint64_t v199 = v26;
  uint64_t v200 = v25;
  v202 = v39;
  if (v43)
  {
    LODWORD(v184) = v42;
    uint64_t v194 = v24;
    uint64_t v44 = swift_slowAlloc();
    os_log_type_t v45 = v39;
    int v183 = (void (*)(char *, uint64_t))swift_slowAlloc();
    uint64_t v193 = swift_slowAlloc();
    v214[0] = v193;
    *(_DWORD *)uint64_t v44 = 136315650;
    uint64_t v46 = v40;
    id v47 = v45;
    id v48 = [v47 description];
    uint64_t v49 = sub_15498();
    unint64_t v51 = v50;

    uint64_t v212 = sub_105C4(v49, v51, v214);
    sub_155D8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2080;
    uint64_t v212 = sub_105C4(0xD000000000000016, 0x8000000000017420, v214);
    sub_155D8();
    *(_WORD *)(v44 + 22) = 2112;
    unint64_t v52 = &MessagesViewController__metaData;
    id v53 = [v40 selectedMessage];
    id v54 = v53;
    if (v53) {
      uint64_t v212 = (uint64_t)v53;
    }
    else {
      uint64_t v212 = 0;
    }
    sub_155D8();
    uint64_t v56 = v199;
    *(void *)int v183 = v54;
    uint64_t v40 = v46;

    _os_log_impl(&dword_0, v41, (os_log_type_t)v184, "%s, %s: conversation.selectedMessage, %@", (uint8_t *)v44, 0x20u);
    sub_2C4C(&qword_1C790);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    unint64_t v55 = *(void (**)(char *, uint64_t))(v56 + 8);
    v55(v36, v200);
    uint64_t v15 = v207;
    uint64_t v39 = v202;
    uint64_t v24 = v194;
  }
  else
  {

    unint64_t v55 = *(void (**)(char *, uint64_t))(v26 + 8);
    v55(v36, v25);
    unint64_t v52 = &MessagesViewController__metaData;
  }
  id v57 = objc_msgSend(v40, (SEL)v52[11].base_prots);
  uint64_t v58 = v210;
  uint64_t v59 = v208;
  if (!v57)
  {
    uint64_t v64 = (uint64_t)v204;
    (*(void (**)(char *, void, uint64_t))(v15 + 104))(v204, enum case for UserType.initiator(_:), v210);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(v64, 0, 1, v58);
    uint64_t v65 = (uint64_t)&v39[OBJC_IVAR___MessagesViewController_userType];
    swift_beginAccess();
    sub_13850(v64, v65, &qword_1C7A0);
    swift_endAccess();
    return;
  }
  uint64_t v60 = v57;
  uint64_t v194 = v40;
  id v61 = [v57 URL];
  uint64_t v184 = v55;
  if (v61)
  {
    uint64_t v62 = v61;
    sub_14E98();

    uint64_t v63 = 0;
  }
  else
  {
    uint64_t v63 = 1;
  }
  uint64_t v66 = v205;
  uint64_t v67 = v197;
  v206[7](v24, v63, 1, v197);
  uint64_t v68 = (uint64_t)&v39[OBJC_IVAR___MessagesViewController_messageURL];
  swift_beginAccess();
  sub_13850((uint64_t)v24, v68, &qword_1C760);
  swift_endAccess();
  uint64_t v193 = (uint64_t)v60;
  id v69 = [v60 senderParticipantIdentifier];
  sub_14EF8();

  id v70 = [v194 localParticipantIdentifier];
  uint64_t v71 = v195;
  sub_14EF8();

  LOBYTE(v70) = sub_14EE8();
  uint64_t v72 = *(void (**)(char *, uint64_t))(v203 + 8);
  v182[1] = v203 + 8;
  v72(v71, v66);
  int v183 = v72;
  v72((char *)v59, v66);
  os_log_t v73 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 104);
  int v74 = (unsigned int *)&enum case for UserType.receiver(_:);
  if (v70) {
    int v74 = (unsigned int *)&enum case for UserType.initiator(_:);
  }
  uint64_t v75 = *v74;
  int v76 = v209;
  uint64_t v77 = v210;
  unint64_t v195 = *(char **)(v15 + 104);
  v73(v209, v75, v210);
  uint64_t v78 = v76;
  uint64_t v79 = v15;
  uint64_t v80 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
  uint64_t v81 = (uint64_t)v204;
  v80(v204, v78, v77);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v79 + 56))(v81, 0, 1, v77);
  uint64_t v82 = (uint64_t)&v39[OBJC_IVAR___MessagesViewController_userType];
  uint64_t v83 = v206;
  swift_beginAccess();
  sub_13850(v81, v82, &qword_1C7A0);
  swift_endAccess();
  uint64_t v84 = v196;
  sub_13E94(v68, (uint64_t)v196, &qword_1C760);
  if (((unsigned int (*)(void (*)(char *, uint64_t, uint64_t, uint64_t), uint64_t, uint64_t))v83[6])(v84, 1, v67) != 1)
  {
    v204 = (char *)v80;
    id v87 = v83[4];
    uint64_t v88 = v192;
    ((void (*)(char *, void (*)(char *, uint64_t, uint64_t, uint64_t), uint64_t))v87)(v192, v84, v67);
    unint64_t v89 = self;
    sub_14E88(v90);
    int v92 = v91;
    id v93 = [v89 sessionIDFromURL:v91];

    if (v93)
    {
      uint64_t v196 = v87;
      os_log_t v94 = v208;
      sub_14EF8();

      uint64_t v95 = v203;
      uint64_t v96 = (uint64_t)v191;
      unint64_t v97 = v94;
      uint64_t v98 = v205;
      v182[0] = *(void *)(v203 + 32);
      ((void (*)(char *, NSObject *, uint64_t))v182[0])(v191, v97, v205);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v95 + 56))(v96, 0, 1, v98);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v95 + 48))(v96, 1, v98) != 1)
      {
        uint64_t v99 = v189;
        uint64_t v100 = v96;
        uint64_t v101 = v205;
        ((void (*)(char *, uint64_t, uint64_t))v182[0])(v189, v100, v205);
        (*(void (**)(NSObject *, char *, uint64_t))(v95 + 16))(v208, v99, v101);
        uint64_t v102 = v88;
        os_log_t v103 = v83;
        ((void (*)(char *, char *, uint64_t))v204)(v201, v209, v210);
        uint64_t v104 = swift_allocObject();
        os_log_type_t v105 = v202;
        swift_unknownObjectWeakInit();
        uint64_t v106 = v83[2];
        uint64_t v107 = v187;
        ((void (*)(char *, char *, uint64_t))v106)(v187, v102, v67);
        unint64_t v108 = (*((unsigned __int8 *)v103 + 80) + 24) & ~(unint64_t)*((unsigned __int8 *)v103 + 80);
        uint64_t v109 = swift_allocObject();
        *(void *)(v109 + 16) = v104;
        ((void (*)(unint64_t, char *, uint64_t))v196)(v109 + v108, v107, v67);
        uint64_t v86 = v210;
        id v110 = objc_allocWithZone((Class)sub_15008());
        uint64_t v111 = sub_14FF8();
        unint64_t v112 = *(void **)&v105[OBJC_IVAR___MessagesViewController_safetyCacheViewModel];
        *(void *)&v105[OBJC_IVAR___MessagesViewController_safetyCacheViewModel] = v111;

        v183(v189, v205);
        ((void (*)(char *, uint64_t))v103[1])(v102, v67);
LABEL_21:
        unint64_t v85 = (void *)v193;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v96 = (uint64_t)v191;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v203 + 56))(v191, 1, 1, v205);
    }
    ((void (*)(char *, uint64_t))v83[1])(v88, v67);
    sub_13D54(v96, &qword_1C768);
    uint64_t v86 = v210;
    goto LABEL_21;
  }
  sub_13D54((uint64_t)v84, &qword_1C760);
  unint64_t v85 = (void *)v193;
  uint64_t v86 = v210;
LABEL_22:
  uint64_t v113 = v201;
  ((void (*)(char *, void, uint64_t))v195)(v201, enum case for UserType.initiator(_:), v86);
  uint64_t v114 = v209;
  char v115 = sub_15328();
  uint64_t v117 = v207 + 8;
  v116 = *(void (***)(char *, uint64_t, uint64_t, uint64_t))(v207 + 8);
  ((void (*)(char *, uint64_t))v116)(v113, v86);
  v118 = v198;
  if ((v115 & 1) == 0 || ![v85 isPending])
  {
    ((void (*)(char *, uint64_t))v116)(v114, v86);

    return;
  }
  uint64_t v212 = 0;
  uint64_t v213 = 0;
  uint64_t v119 = v194;
  id v120 = [v194 recipientAddresses];
  uint64_t v121 = sub_154F8();

  unint64_t v122 = *(void *)(v121 + 16);
  swift_bridgeObjectRelease();
  id v206 = v116;
  if (v122 < 2)
  {
    v118 = v188;
    sub_15368();
    v128 = v202;
    uint64_t v129 = sub_15378();
    os_log_type_t v130 = sub_15578();
    if (!os_log_type_enabled(v129, v130)) {
      goto LABEL_37;
    }
    uint64_t v131 = swift_slowAlloc();
    v214[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v131 = 136315394;
    v132 = v128;
    id v133 = [v132 description];
    uint64_t v134 = sub_15498();
    unint64_t v136 = v135;

    uint64_t v211 = sub_105C4(v134, v136, v214);
    v116 = v206;
    sub_155D8();

    uint64_t v114 = v209;
    swift_bridgeObjectRelease();
    *(_WORD *)(v131 + 12) = 2080;
    uint64_t v211 = sub_105C4(0xD000000000000016, 0x8000000000017420, v214);
    unint64_t v85 = (void *)v193;
    sub_155D8();
    _os_log_impl(&dword_0, v129, v130, "%s, %s: Do not populate groupID for non-group chats", (uint8_t *)v131, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v137 = v188;
  }
  else
  {
    if ([v119 respondsToSelector:sub_14F48()])
    {
      id v123 = [v119 performSelector:sub_14F48()];
      if (v123)
      {
        uint64_t v124 = (uint64_t)v123;
        swift_bridgeObjectRelease();
        swift_unknownObjectRetain();
        uint64_t v211 = v124;
        int v125 = swift_dynamicCast();
        uint64_t v126 = v214[0];
        uint64_t v127 = v214[1];
        if (!v125)
        {
          uint64_t v126 = 0;
          uint64_t v127 = 0;
        }
        uint64_t v212 = v126;
        uint64_t v213 = v127;
        goto LABEL_39;
      }
      sub_15368();
      v128 = v202;
      uint64_t v129 = sub_15378();
      os_log_type_t v145 = sub_15578();
      if (os_log_type_enabled(v129, v145))
      {
        uint64_t v146 = swift_slowAlloc();
        v214[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v146 = 136315394;
        v147 = v128;
        id v148 = [v147 description];
        uint64_t v149 = sub_15498();
        unint64_t v151 = v150;

        uint64_t v211 = sub_105C4(v149, v151, v214);
        v116 = v206;
        sub_155D8();

        uint64_t v114 = v209;
        swift_bridgeObjectRelease();
        *(_WORD *)(v146 + 12) = 2080;
        uint64_t v211 = sub_105C4(0xD000000000000016, 0x8000000000017420, v214);
        unint64_t v85 = (void *)v193;
        sub_155D8();
        _os_log_impl(&dword_0, v129, v145, "%s, %s: MSConversation groupID is nil", (uint8_t *)v146, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v137 = v198;
        goto LABEL_38;
      }
LABEL_37:

      uint64_t v137 = v118;
      goto LABEL_38;
    }
    v118 = v185;
    sub_15368();
    v128 = v202;
    uint64_t v129 = sub_15378();
    os_log_type_t v138 = sub_15578();
    if (!os_log_type_enabled(v129, v138)) {
      goto LABEL_37;
    }
    uint64_t v139 = swift_slowAlloc();
    v214[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v139 = 136315394;
    v140 = v128;
    id v141 = [v140 description];
    uint64_t v142 = sub_15498();
    unint64_t v144 = v143;

    uint64_t v211 = sub_105C4(v142, v144, v214);
    v116 = v206;
    sub_155D8();

    uint64_t v114 = v209;
    swift_bridgeObjectRelease();
    *(_WORD *)(v139 + 12) = 2080;
    uint64_t v211 = sub_105C4(0xD000000000000016, 0x8000000000017420, v214);
    unint64_t v85 = (void *)v193;
    sub_155D8();
    _os_log_impl(&dword_0, v129, v138, "%s, %s: MSConversation does not respond to groupID", (uint8_t *)v139, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v137 = v185;
  }
LABEL_38:
  v184(v137, v200);
LABEL_39:
  v152 = v190;
  sub_15368();
  unint64_t v153 = v213;
  uint64_t v205 = v212;
  swift_bridgeObjectRetain_n();
  int v154 = v202;
  uint64_t v155 = v194;
  v156 = v154;
  id v157 = v155;
  uint64_t v158 = sub_15378();
  os_log_type_t v159 = sub_15578();
  v208 = v158;
  LODWORD(v204) = v159;
  if (os_log_type_enabled(v158, v159))
  {
    uint64_t v160 = swift_slowAlloc();
    uint64_t v203 = swift_slowAlloc();
    v214[0] = v203;
    *(_DWORD *)uint64_t v160 = 136316418;
    id v161 = v156;
    uint64_t v207 = v117;
    uint64_t v162 = v161;
    id v163 = [v161 description];
    uint64_t v164 = sub_15498();
    unint64_t v166 = v165;

    uint64_t v211 = sub_105C4(v164, v166, v214);
    sub_155D8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v160 + 12) = 2080;
    uint64_t v211 = sub_105C4(0xD000000000000016, 0x8000000000017420, v214);
    sub_155D8();
    *(_WORD *)(v160 + 22) = 2080;
    uint64_t v211 = sub_105C4(0xD000000000000016, 0x8000000000017420, v214);
    sub_155D8();
    *(_WORD *)(v160 + 32) = 2080;
    id v167 = [v157 recipientAddresses];
    sub_154F8();

    uint64_t v168 = sub_15508();
    unint64_t v170 = v169;
    swift_bridgeObjectRelease();
    uint64_t v211 = sub_105C4(v168, v170, v214);
    sub_155D8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v160 + 42) = 2080;
    id v171 = [v157 conversationIdentifier];
    uint64_t v172 = sub_15498();
    unint64_t v174 = v173;

    uint64_t v211 = sub_105C4(v172, v174, v214);
    sub_155D8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v160 + 52) = 2080;
    if (v153) {
      uint64_t v175 = v205;
    }
    else {
      uint64_t v175 = 7104878;
    }
    if (v153) {
      unint64_t v176 = v153;
    }
    else {
      unint64_t v176 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v177 = v175;
    v116 = v206;
    uint64_t v178 = v210;
    uint64_t v211 = sub_105C4(v177, v176, v214);
    uint64_t v114 = v209;
    sub_155D8();
    swift_bridgeObjectRelease_n();
    unint64_t v85 = (void *)v193;
    swift_bridgeObjectRelease();
    uint64_t v179 = v208;
    _os_log_impl(&dword_0, v208, (os_log_type_t)v204, "%s, %s: Setting recipient handles and conversation identifier in %s: Recipient Addresses - %s, Conversation Identifier - %s, Group ID - %s", (uint8_t *)v160, 0x3Eu);
    swift_arrayDestroy();
    uint64_t v180 = v178;
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v199 + 8))(v190, v200);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v184(v152, v200);
    uint64_t v180 = v210;
  }
  id v181 = [v157 recipientAddresses];
  sub_154F8();

  sub_15178();
  swift_beginAccess();
  sub_15208();

  ((void (*)(char *, uint64_t))v116)(v114, v180);
}

void sub_C8CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_15338();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v27[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_2C4C(&qword_1C798);
  __chkstk_darwin(v7);
  uint64_t v9 = &v27[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_2C4C(&qword_1C7A0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = &v27[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = &v27[-v15];
  __chkstk_darwin(v14);
  uint64_t v18 = &v27[-v17];
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v20 = Strong;
    uint64_t v30 = a2;
    uint64_t v31 = v13;
    uint64_t v29 = v6;
    [Strong requestResize];
    uint64_t v21 = (uint64_t)v20 + OBJC_IVAR___MessagesViewController_userType;
    swift_beginAccess();
    sub_13E94(v21, (uint64_t)v18, &qword_1C7A0);
    (*(void (**)(unsigned char *, void, uint64_t))(v4 + 104))(v16, enum case for UserType.receiver(_:), v3);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v4 + 56))(v16, 0, 1, v3);
    uint64_t v22 = (uint64_t)&v9[*(int *)(v7 + 48)];
    sub_13E94((uint64_t)v18, (uint64_t)v9, &qword_1C7A0);
    sub_13E94((uint64_t)v16, v22, &qword_1C7A0);
    uint64_t v23 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
    if (v23((uint64_t)v9, 1, v3) == 1)
    {
      sub_13D54((uint64_t)v16, &qword_1C7A0);
      sub_13D54((uint64_t)v18, &qword_1C7A0);
      if (v23(v22, 1, v3) == 1)
      {
        sub_13D54((uint64_t)v9, &qword_1C7A0);
LABEL_9:
        sub_CD28();
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v24 = (uint64_t)v31;
      sub_13E94((uint64_t)v9, (uint64_t)v31, &qword_1C7A0);
      if (v23(v22, 1, v3) != 1)
      {
        uint64_t v25 = v29;
        (*(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 32))(v29, v22, v3);
        sub_10C1C(&qword_1C7B0, (void (*)(uint64_t))&type metadata accessor for UserType);
        int v28 = sub_15408();
        uint64_t v26 = *(void (**)(unsigned char *, uint64_t))(v4 + 8);
        v26(v25, v3);
        sub_13D54((uint64_t)v16, &qword_1C7A0);
        sub_13D54((uint64_t)v18, &qword_1C7A0);
        v26((unsigned char *)v24, v3);
        sub_13D54((uint64_t)v9, &qword_1C7A0);
        if (v28) {
          goto LABEL_9;
        }
LABEL_10:

        return;
      }
      sub_13D54((uint64_t)v16, &qword_1C7A0);
      sub_13D54((uint64_t)v18, &qword_1C7A0);
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v24, v3);
    }
    sub_13D54((uint64_t)v9, &qword_1C798);
    goto LABEL_10;
  }
}

uint64_t sub_CD28()
{
  id v1 = v0;
  uint64_t v35 = sub_15388();
  uint64_t v2 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2C4C(&qword_1C808);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_15298();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v34 - v13;
  uint64_t v15 = self;
  sub_14E88(v16);
  uint64_t v18 = v17;
  [v15 messageTypeFromURL:v17];

  uint64_t v36 = v2;
  id v37 = v1;
  uint64_t v19 = *(void **)&v1[OBJC_IVAR___MessagesViewController_safetyCacheViewModel];
  if (v19)
  {
    id v20 = v19;
    sub_14FE8();
  }
  sub_15288();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_13D54((uint64_t)v7, &qword_1C808);
    sub_15358();
    id v21 = v37;
    uint64_t v22 = sub_15378();
    os_log_type_t v23 = sub_15578();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136315394;
      id v25 = v21;
      id v26 = [v25 description];
      uint64_t v27 = sub_15498();
      unint64_t v29 = v28;

      uint64_t v38 = sub_105C4(v27, v29, &v39);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2080;
      uint64_t v38 = sub_105C4(0xD00000000000002DLL, 0x8000000000017310, &v39);
      sub_155D8();
      _os_log_impl(&dword_0, v22, v23, "#CriticalAlertOnboarding: Skipping onboarding %s: %s", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v4, v35);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v7, v8);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    id v30 = objc_allocWithZone((Class)sub_15318());
    uint64_t v31 = (void *)sub_15308();
    id v32 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v31];
    [v32 setModalPresentationStyle:-2];
    [v32 setModalInPresentation:1];
    sub_5E30(v32);

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }
}

id sub_D1FC()
{
  id v1 = v0;
  uint64_t v2 = sub_15388();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v54 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v54 - v10;
  id v57 = [objc_allocWithZone((Class)CNContact) init];
  id v12 = [v1 activeConversation];
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = [v12 selectedMessage];

    if (v14)
    {
      id v15 = [v13 selectedMessage];
      if (v15)
      {
        uint64_t v16 = v15;
        id v17 = [v15 senderAddress];

        if (v17)
        {
          sub_15498();

          uint64_t v18 = *(void **)&v1[OBJC_IVAR___MessagesViewController_contactsManager];
          NSString v19 = sub_15488();
          swift_bridgeObjectRelease();
          id v20 = [v18 contactWith:v19];

          return v20;
        }
      }
      sub_15358();
      id v32 = v1;
      uint64_t v33 = sub_15378();
      os_log_type_t v34 = sub_15558();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        uint64_t v59 = v55;
        *(_DWORD *)uint64_t v35 = 136315394;
        uint64_t v54 = v35 + 4;
        uint64_t v36 = v32;
        id v37 = [v36 description];
        uint64_t v38 = sub_15498();
        uint64_t v56 = v2;
        uint64_t v39 = v3;
        uint64_t v40 = v38;
        unint64_t v42 = v41;

        uint64_t v58 = sub_105C4(v40, v42, &v59);
        sub_155D8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v35 + 12) = 2080;
        uint64_t v58 = sub_105C4(0xD00000000000001CLL, 0x80000000000172F0, &v59);
        sub_155D8();
        _os_log_impl(&dword_0, v33, v34, "%s, %s: handle is not available", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v39 + 8))(v11, v56);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
      }
    }
    else
    {
      sub_15358();
      BOOL v43 = v1;
      uint64_t v44 = sub_15378();
      os_log_type_t v45 = sub_15558();
      if (os_log_type_enabled(v44, v45))
      {
        uint64_t v46 = swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        uint64_t v59 = v55;
        *(_DWORD *)uint64_t v46 = 136315394;
        uint64_t v54 = v46 + 4;
        id v47 = v43;
        id v48 = [v47 description];
        uint64_t v56 = v2;
        uint64_t v49 = v3;
        id v50 = v48;
        uint64_t v51 = sub_15498();
        unint64_t v53 = v52;

        uint64_t v58 = sub_105C4(v51, v53, &v59);
        sub_155D8();

        swift_bridgeObjectRelease();
        *(_WORD *)(v46 + 12) = 2080;
        uint64_t v58 = sub_105C4(0xD00000000000001CLL, 0x80000000000172F0, &v59);
        sub_155D8();
        _os_log_impl(&dword_0, v44, v45, "%s, %s: no selected message for setting up message sender contact", (uint8_t *)v46, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v49 + 8))(v9, v56);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
      }
    }
  }
  else
  {
    sub_15358();
    uint64_t v22 = v1;
    os_log_type_t v23 = sub_15378();
    os_log_type_t v24 = sub_15558();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      uint64_t v59 = v55;
      *(_DWORD *)uint64_t v25 = 136315394;
      id v26 = v22;
      id v27 = [v26 description];
      uint64_t v28 = v3;
      uint64_t v29 = sub_15498();
      uint64_t v56 = v2;
      unint64_t v31 = v30;

      uint64_t v58 = sub_105C4(v29, v31, &v59);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2080;
      uint64_t v58 = sub_105C4(0xD00000000000001CLL, 0x80000000000172F0, &v59);
      sub_155D8();
      _os_log_impl(&dword_0, v23, v24, "%s, %s: no active conversation", (uint8_t *)v25, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v56);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
  }
  return v57;
}

id sub_D964(void *a1)
{
  uint64_t v3 = sub_15388();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_15368();
  id v7 = v1;
  id v8 = a1;
  id v9 = v7;
  id v10 = v8;
  uint64_t v11 = sub_15378();
  os_log_type_t v12 = sub_15578();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v27 = v4;
    uint64_t v14 = v13;
    os_log_type_t v24 = (void *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v29 = v25;
    *(_DWORD *)uint64_t v14 = 136315650;
    v23[1] = v14 + 4;
    id v15 = v9;
    uint64_t v26 = v3;
    id v16 = v15;
    id v17 = [v15 description];
    uint64_t v18 = sub_15498();
    unint64_t v20 = v19;

    uint64_t v28 = sub_105C4(v18, v20, &v29);
    sub_155D8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v28 = sub_105C4(0xD000000000000017, 0x8000000000017150, &v29);
    sub_155D8();
    *(_WORD *)(v14 + 22) = 2112;
    uint64_t v28 = (uint64_t)v10;
    id v21 = v10;
    sub_155D8();
    void *v24 = v10;

    _os_log_impl(&dword_0, v11, v12, "%s, %s: conversation, %@", (uint8_t *)v14, 0x20u);
    sub_2C4C(&qword_1C790);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v26);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_AF84(v10);
  return [v9 setNeedsSizeMatchBeforeSnapshotSwap];
}

void sub_DD14(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2C4C(&qword_1C760);
  __chkstk_darwin(v4 - 8);
  uint64_t v109 = (char *)&v103 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_14EB8();
  uint64_t v108 = *(void *)(v110 - 8);
  uint64_t v6 = __chkstk_darwin(v110);
  uint64_t v107 = (char *)&v103 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v104 = (char *)&v103 - v8;
  uint64_t v9 = sub_15278();
  __chkstk_darwin(v9 - 8);
  os_log_t v103 = (char *)&v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_15388();
  uint64_t v114 = *(void *)(v11 - 8);
  uint64_t v115 = v11;
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v103 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  unint64_t v112 = (char *)&v103 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v111 = (char *)&v103 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  os_log_type_t v105 = (char *)&v103 - v20;
  __chkstk_darwin(v19);
  uint64_t v106 = (char *)&v103 - v21;
  uint64_t v22 = sub_15338();
  uint64_t v23 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v103 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_2C4C(&qword_1C798);
  __chkstk_darwin(v26);
  uint64_t v28 = (char *)&v103 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_2C4C(&qword_1C7A0);
  uint64_t v30 = __chkstk_darwin(v29 - 8);
  id v32 = (char *)&v103 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  os_log_type_t v34 = (char *)&v103 - v33;
  id v113 = [a1 selectedMessage];
  if (!v113)
  {
    sub_15368();
    uint64_t v39 = v2;
    uint64_t v40 = sub_15378();
    os_log_type_t v41 = sub_15558();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = swift_slowAlloc();
      v117[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v42 = 136315394;
      BOOL v43 = v39;
      id v44 = [v43 description];
      uint64_t v45 = sub_15498();
      unint64_t v47 = v46;

      uint64_t v118 = sub_105C4(v45, v47, v117);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v42 + 12) = 2080;
      uint64_t v118 = sub_105C4(0xD000000000000016, 0x8000000000017170, v117);
      sub_155D8();
      _os_log_impl(&dword_0, v40, v41, "%s, %s: empty message in conversation", (uint8_t *)v42, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
LABEL_15:
    (*(void (**)(char *, uint64_t))(v114 + 8))(v14, v115);
    return;
  }
  if ([v2 presentationStyle] != (char *)&dword_0 + 2)
  {
    uint64_t v14 = v112;
    sub_15368();
    id v48 = v2;
    uint64_t v49 = sub_15378();
    os_log_type_t v50 = sub_15538();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = swift_slowAlloc();
      v117[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v51 = 136315394;
      unint64_t v52 = v48;
      id v53 = [v52 description];
      uint64_t v54 = sub_15498();
      unint64_t v56 = v55;

      uint64_t v118 = sub_105C4(v54, v56, v117);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v51 + 12) = 2080;
      uint64_t v118 = sub_105C4(0xD000000000000016, 0x8000000000017170, v117);
      sub_155D8();
      _os_log_impl(&dword_0, v49, v50, "%s, %s: presentation style is not transcript", (uint8_t *)v51, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v114 + 8))(v14, v115);
      return;
    }

    goto LABEL_15;
  }
  unint64_t v112 = v2;
  uint64_t v35 = (uint64_t)&v2[OBJC_IVAR___MessagesViewController_userType];
  swift_beginAccess();
  (*(void (**)(char *, void, uint64_t))(v23 + 104))(v34, enum case for UserType.initiator(_:), v22);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v34, 0, 1, v22);
  uint64_t v36 = (uint64_t)&v28[*(int *)(v26 + 48)];
  sub_13E94(v35, (uint64_t)v28, &qword_1C7A0);
  sub_13E94((uint64_t)v34, v36, &qword_1C7A0);
  id v37 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48);
  if (v37((uint64_t)v28, 1, v22) != 1)
  {
    sub_13E94((uint64_t)v28, (uint64_t)v32, &qword_1C7A0);
    if (v37(v36, 1, v22) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v23 + 32))(v25, v36, v22);
      sub_10C1C(&qword_1C7B0, (void (*)(uint64_t))&type metadata accessor for UserType);
      char v57 = sub_15408();
      uint64_t v58 = *(void (**)(char *, uint64_t))(v23 + 8);
      v58(v25, v22);
      sub_13D54((uint64_t)v34, &qword_1C7A0);
      v58(v32, v22);
      sub_13D54((uint64_t)v28, &qword_1C7A0);
      id v38 = v113;
      if ((v57 & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_18;
    }
    sub_13D54((uint64_t)v34, &qword_1C7A0);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v32, v22);
LABEL_13:
    sub_13D54((uint64_t)v28, &qword_1C798);
    id v38 = v113;
    goto LABEL_21;
  }
  sub_13D54((uint64_t)v34, &qword_1C7A0);
  if (v37(v36, 1, v22) != 1) {
    goto LABEL_13;
  }
  sub_13D54((uint64_t)v28, &qword_1C7A0);
  id v38 = v113;
LABEL_18:
  if ([v38 isPending])
  {
    uint64_t v59 = v106;
    sub_15368();
    uint64_t v60 = v112;
    id v61 = sub_15378();
    os_log_type_t v62 = sub_15578();
    if (os_log_type_enabled(v61, v62))
    {
      uint64_t v63 = swift_slowAlloc();
      uint64_t v118 = swift_slowAlloc();
      *(_DWORD *)uint64_t v63 = 136315394;
      uint64_t v64 = v60;
      id v65 = [v64 description];
      uint64_t v66 = sub_15498();
      unint64_t v68 = v67;

      uint64_t v116 = sub_105C4(v66, v68, &v118);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v63 + 12) = 2080;
      uint64_t v116 = sub_105C4(0xD000000000000016, 0x8000000000017170, &v118);
      sub_155D8();
      _os_log_impl(&dword_0, v61, v62, "%s, %s: calling sessionViewModel.attemptToInitialize", (uint8_t *)v63, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      id v69 = *(void (**)(char *, uint64_t))(v114 + 8);
      v69(v106, v115);
    }
    else
    {

      id v69 = *(void (**)(char *, uint64_t))(v114 + 8);
      v69(v59, v115);
    }
    unint64_t v89 = v105;
    sub_151A8();
    sub_15368();
    unint64_t v90 = v60;
    os_log_type_t v91 = sub_15378();
    os_log_type_t v92 = sub_15578();
    if (os_log_type_enabled(v91, v92))
    {
      uint64_t v93 = swift_slowAlloc();
      uint64_t v94 = swift_slowAlloc();
      unint64_t v112 = (char *)v69;
      uint64_t v118 = v94;
      *(_DWORD *)uint64_t v93 = 136315394;
      uint64_t v111 = (char *)(v93 + 4);
      uint64_t v95 = v90;
      id v96 = [v95 description];
      uint64_t v97 = sub_15498();
      unint64_t v99 = v98;

      uint64_t v116 = sub_105C4(v97, v99, &v118);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v93 + 12) = 2080;
      uint64_t v116 = sub_105C4(0xD000000000000016, 0x8000000000017170, &v118);
      sub_155D8();
      _os_log_impl(&dword_0, v91, v92, "%s, %s: message.isPending, calling presentConfigurationViewController", (uint8_t *)v93, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (*)(char *, uint64_t))v112)(v105, v115);
    }
    else
    {

      v69(v89, v115);
    }
    id v100 = v113;
    sub_151E8();
    swift_retain();
    swift_retain();
    sub_15268();
    id v101 = objc_allocWithZone((Class)sub_2C4C(&qword_1C7A8));
    uint64_t v102 = (void *)sub_15398();
    sub_74AC(v102);

    return;
  }
LABEL_21:
  id v70 = [v38 URL];
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = v107;
    sub_14E98();

    uint64_t v74 = v108;
    uint64_t v73 = (uint64_t)v109;
    uint64_t v75 = *(void (**)(char *, char *, uint64_t))(v108 + 32);
    int v76 = v72;
    uint64_t v77 = v110;
    v75(v109, v76, v110);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v74 + 56))(v73, 0, 1, v77);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v74 + 48))(v73, 1, v77) != 1)
    {
      uint64_t v78 = v104;
      v75(v104, (char *)v73, v77);
      sub_7BA8(v78);

      (*(void (**)(char *, uint64_t))(v74 + 8))(v78, v77);
      return;
    }
  }
  else
  {
    uint64_t v73 = (uint64_t)v109;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v108 + 56))(v109, 1, 1, v110);
  }
  sub_13D54(v73, &qword_1C760);
  uint64_t v79 = v111;
  sub_15358();
  uint64_t v80 = v112;
  uint64_t v81 = sub_15378();
  os_log_type_t v82 = sub_15558();
  if (os_log_type_enabled(v81, v82))
  {
    uint64_t v83 = swift_slowAlloc();
    uint64_t v118 = swift_slowAlloc();
    *(_DWORD *)uint64_t v83 = 136315394;
    uint64_t v84 = v80;
    id v85 = [v84 description];
    uint64_t v86 = sub_15498();
    unint64_t v88 = v87;

    uint64_t v116 = sub_105C4(v86, v88, &v118);
    sub_155D8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v83 + 12) = 2080;
    uint64_t v116 = sub_105C4(0xD000000000000016, 0x8000000000017170, &v118);
    sub_155D8();
    _os_log_impl(&dword_0, v81, v82, "%s, %s: Message url is missing", (uint8_t *)v83, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v114 + 8))(v111, v115);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v114 + 8))(v79, v115);
  }
}

uint64_t sub_EE28(void *a1)
{
  id v91 = a1;
  uint64_t v2 = sub_2C4C(&qword_1C7A0);
  __chkstk_darwin(v2 - 8);
  os_log_type_t v92 = (uint64_t (*)(char *, id))((char *)v82 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_15338();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v86 = (char *)v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  unint64_t v90 = (char *)v82 - v8;
  uint64_t v9 = (void *)sub_15388();
  uint64_t v93 = *(v9 - 1);
  uint64_t v10 = __chkstk_darwin(v9);
  unint64_t v89 = (char *)v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)v82 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)v82 - v16;
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)v82 - v18;
  sub_15368();
  id v20 = v1;
  uint64_t v21 = sub_15378();
  os_log_type_t v22 = sub_15578();
  BOOL v23 = os_log_type_enabled(v21, v22);
  id v85 = v17;
  uint64_t v87 = (uint64_t)v14;
  if (v23)
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v83 = swift_slowAlloc();
    v95[0] = v83;
    *(_DWORD *)uint64_t v24 = 136315394;
    v82[1] = v24 + 4;
    id v84 = v20;
    id v25 = v20;
    id v26 = [v25 description];
    uint64_t v88 = v5;
    id v27 = v26;
    uint64_t v28 = v4;
    uint64_t v29 = v9;
    uint64_t v30 = sub_15498();
    unint64_t v32 = v31;

    uint64_t v33 = v30;
    uint64_t v9 = v29;
    uint64_t v4 = v28;
    uint64_t v96 = sub_105C4(v33, v32, v95);
    sub_155D8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2080;
    uint64_t v96 = sub_105C4(0xD000000000000016, 0x8000000000017190, v95);
    uint64_t v5 = v88;
    sub_155D8();
    _os_log_impl(&dword_0, v21, v22, "%s, %s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    os_log_type_t v34 = *(char **)(v93 + 8);
    ((void (*)(char *, void *))v34)(v19, v9);
    uint64_t v35 = v84;
  }
  else
  {

    os_log_type_t v34 = *(char **)(v93 + 8);
    ((void (*)(char *, void *))v34)(v19, v9);
    uint64_t v35 = v20;
  }
  sub_AE08();
  id v36 = [v91 selectedMessage];
  uint64_t v37 = (uint64_t)v92;
  if (!v36)
  {
    id v53 = v89;
    sub_15368();
    id v54 = v35;
    unint64_t v55 = sub_15378();
    os_log_type_t v56 = sub_15558();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = swift_slowAlloc();
      v95[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v57 = 136315394;
      id v58 = v54;
      id v59 = [v58 description];
      uint64_t v60 = sub_15498();
      os_log_type_t v92 = (uint64_t (*)(char *, id))v34;
      uint64_t v61 = v60;
      unint64_t v63 = v62;

      uint64_t v96 = sub_105C4(v61, v63, v95);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v57 + 12) = 2080;
      uint64_t v96 = sub_105C4(0xD000000000000016, 0x8000000000017190, v95);
      sub_155D8();
      _os_log_impl(&dword_0, v55, v56, "%s, %s: empty message in conversation", (uint8_t *)v57, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v51 = v89;
      id v52 = v9;
      return v92(v51, v52);
    }

    uint64_t v81 = v53;
    return ((uint64_t (*)(char *, void *))v34)(v81, v9);
  }
  id v38 = v36;
  uint64_t v39 = (uint64_t)v35 + OBJC_IVAR___MessagesViewController_userType;
  swift_beginAccess();
  sub_13E94(v39, v37, &qword_1C7A0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v37, 1, v4) == 1)
  {
    sub_13D54(v37, &qword_1C7A0);
    uint64_t v40 = v87;
    sub_15368();
    id v41 = v35;
    uint64_t v42 = sub_15378();
    os_log_type_t v43 = sub_15558();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = swift_slowAlloc();
      uint64_t v96 = swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 136315394;
      unint64_t v90 = (char *)(v44 + 4);
      id v45 = v41;
      id v46 = [v45 description];
      os_log_type_t v92 = (uint64_t (*)(char *, id))v34;
      id v47 = v46;
      uint64_t v48 = sub_15498();
      id v91 = v9;
      unint64_t v50 = v49;

      uint64_t v94 = sub_105C4(v48, v50, &v96);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v44 + 12) = 2080;
      uint64_t v94 = sub_105C4(0xD000000000000016, 0x8000000000017190, &v96);
      sub_155D8();
      _os_log_impl(&dword_0, v42, v43, "%s, %s: userType is not initialized", (uint8_t *)v44, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v51 = (char *)v40;
      id v52 = v91;
      return v92(v51, v52);
    }

    uint64_t v81 = (char *)v40;
    return ((uint64_t (*)(char *, void *))v34)(v81, v9);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v90, v37, v4);
  id v65 = v86;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v86, enum case for UserType.initiator(_:), v4);
  char v66 = sub_15328();
  id v69 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
  uint64_t v67 = v5 + 8;
  unint64_t v68 = v69;
  v69(v65, v4);
  if ((v66 & 1) != 0 && [v38 isPending])
  {
    sub_15188();

    return v68(v90, v4);
  }
  else
  {
    uint64_t v88 = v67;
    unint64_t v89 = (char *)v4;
    id v70 = v85;
    sub_15368();
    id v71 = v35;
    uint64_t v72 = sub_15378();
    os_log_type_t v73 = sub_15538();
    if (os_log_type_enabled(v72, v73))
    {
      uint64_t v74 = swift_slowAlloc();
      uint64_t v87 = swift_slowAlloc();
      uint64_t v96 = v87;
      *(_DWORD *)uint64_t v74 = 136315394;
      uint64_t v86 = (char *)(v74 + 4);
      id v75 = v71;
      id v76 = [v75 description];
      os_log_type_t v92 = (uint64_t (*)(char *, id))v34;
      id v77 = v76;
      uint64_t v78 = sub_15498();
      id v91 = v9;
      unint64_t v80 = v79;

      uint64_t v94 = sub_105C4(v78, v80, &v96);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v74 + 12) = 2080;
      uint64_t v94 = sub_105C4(0xD000000000000016, 0x8000000000017190, &v96);
      sub_155D8();
      _os_log_impl(&dword_0, v72, v73, "%s, %s: no message pending, nothing to do", (uint8_t *)v74, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v92(v70, v91);
    }
    else
    {

      ((void (*)(char *, void *))v34)(v70, v9);
    }
    return v68(v90, (uint64_t)v89);
  }
}

void sub_FA34(double a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_15388();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = [v3 view];
  if (!v10)
  {
LABEL_14:
    __break(1u);
    return;
  }
  uint64_t v11 = v10;
  id v12 = [v10 subviews];

  sub_13E18(0, &qword_1C7B8);
  unint64_t v13 = sub_154F8();

  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_156A8();
    swift_bridgeObjectRelease();
    if (v16) {
      goto LABEL_4;
    }
  }
  else if (*(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFFF8)))
  {
LABEL_4:
    if ((v13 & 0xC000000000000001) != 0)
    {
      id v14 = (id)sub_15678();
      goto LABEL_7;
    }
    if (*(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFFF8)))
    {
      id v14 = *(id *)(v13 + 32);
LABEL_7:
      uint64_t v15 = v14;
      swift_bridgeObjectRelease();
      objc_msgSend(v15, "sizeThatFits:", a1, a2);

      return;
    }
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  sub_15368();
  id v17 = v3;
  uint64_t v18 = sub_15378();
  os_log_type_t v19 = sub_15558();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v24 = (void *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v27 = (uint64_t)v17;
    uint64_t v28 = v25;
    *(_DWORD *)uint64_t v20 = 138412546;
    id v21 = v17;
    uint64_t v26 = v7;
    id v22 = v21;
    sub_155D8();
    void *v24 = v17;

    *(_WORD *)(v20 + 12) = 2080;
    uint64_t v27 = sub_105C4(0xD000000000000017, 0x80000000000171B0, &v28);
    sub_155D8();
    _os_log_impl(&dword_0, v18, v19, "%@,%s,no subviews to calculate size", (uint8_t *)v20, 0x16u);
    sub_2C4C(&qword_1C790);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v6);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

id sub_FE48(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR___MessagesViewController_sessionViewModel;
  sub_15228();
  uint64_t v7 = v3;
  *(void *)&v3[v6] = sub_151F8();
  uint64_t v8 = OBJC_IVAR___MessagesViewController_handlerManager;
  sub_150C8();
  swift_allocObject();
  *(void *)&v7[v8] = sub_150B8();
  uint64_t v9 = OBJC_IVAR___MessagesViewController_contactsManager;
  *(void *)&v7[v9] = [objc_allocWithZone((Class)SMContactsManager) init];
  id v10 = &v7[OBJC_IVAR___MessagesViewController_transactionID];
  uint64_t v11 = sub_14F18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  id v12 = &v7[OBJC_IVAR___MessagesViewController_messageURL];
  uint64_t v13 = sub_14EB8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  *(void *)&v7[OBJC_IVAR___MessagesViewController_safetyCacheViewModel] = 0;
  id v14 = &v7[OBJC_IVAR___MessagesViewController_userType];
  uint64_t v15 = sub_15338();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  *(void *)&v7[OBJC_IVAR___MessagesViewController_cancellables] = &_swiftEmptySetSingleton;

  if (a2)
  {
    NSString v16 = sub_15488();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v16 = 0;
  }
  v19.receiver = v7;
  v19.super_class = (Class)type metadata accessor for MessagesViewController();
  id v17 = objc_msgSendSuper2(&v19, "initWithNibName:bundle:", v16, a3);

  return v17;
}

id sub_100C4(void *a1)
{
  uint64_t v3 = OBJC_IVAR___MessagesViewController_sessionViewModel;
  sub_15228();
  uint64_t v4 = v1;
  *(void *)&v1[v3] = sub_151F8();
  uint64_t v5 = OBJC_IVAR___MessagesViewController_handlerManager;
  sub_150C8();
  swift_allocObject();
  *(void *)&v4[v5] = sub_150B8();
  uint64_t v6 = OBJC_IVAR___MessagesViewController_contactsManager;
  *(void *)&v4[v6] = [objc_allocWithZone((Class)SMContactsManager) init];
  uint64_t v7 = &v4[OBJC_IVAR___MessagesViewController_transactionID];
  uint64_t v8 = sub_14F18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = &v4[OBJC_IVAR___MessagesViewController_messageURL];
  uint64_t v10 = sub_14EB8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(void *)&v4[OBJC_IVAR___MessagesViewController_safetyCacheViewModel] = 0;
  uint64_t v11 = &v4[OBJC_IVAR___MessagesViewController_userType];
  uint64_t v12 = sub_15338();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(void *)&v4[OBJC_IVAR___MessagesViewController_cancellables] = &_swiftEmptySetSingleton;

  v15.receiver = v4;
  v15.super_class = (Class)type metadata accessor for MessagesViewController();
  id v13 = objc_msgSendSuper2(&v15, "initWithCoder:", a1);

  return v13;
}

id sub_102CC(char a1)
{
  uint64_t v3 = OBJC_IVAR___MessagesViewController_sessionViewModel;
  sub_15228();
  uint64_t v4 = v1;
  *(void *)&v1[v3] = sub_151F8();
  uint64_t v5 = OBJC_IVAR___MessagesViewController_handlerManager;
  sub_150C8();
  swift_allocObject();
  *(void *)&v4[v5] = sub_150B8();
  uint64_t v6 = OBJC_IVAR___MessagesViewController_contactsManager;
  *(void *)&v4[v6] = [objc_allocWithZone((Class)SMContactsManager) init];
  uint64_t v7 = &v4[OBJC_IVAR___MessagesViewController_transactionID];
  uint64_t v8 = sub_14F18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = &v4[OBJC_IVAR___MessagesViewController_messageURL];
  uint64_t v10 = sub_14EB8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(void *)&v4[OBJC_IVAR___MessagesViewController_safetyCacheViewModel] = 0;
  uint64_t v11 = &v4[OBJC_IVAR___MessagesViewController_userType];
  uint64_t v12 = sub_15338();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(void *)&v4[OBJC_IVAR___MessagesViewController_cancellables] = &_swiftEmptySetSingleton;

  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for MessagesViewController();
  return objc_msgSendSuper2(&v14, "initWithShouldBeSheetPresentationControllerDelegate:", a1 & 1);
}

id sub_104C8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessagesViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_105C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10698(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_13F64((uint64_t)v12, *a3);
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
      sub_13F64((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_13F14((uint64_t)v12);
  return v7;
}

uint64_t sub_10698(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_155E8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10854(a5, a6);
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
  uint64_t v8 = sub_15688();
  if (!v8)
  {
    sub_15698();
    __break(1u);
LABEL_17:
    uint64_t result = sub_156C8();
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

uint64_t sub_10854(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_108EC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10ACC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10ACC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_108EC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10A64(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_15668();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_15698();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_154D8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_156C8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_15698();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10A64(uint64_t a1, uint64_t a2)
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
  sub_2C4C(&qword_1C8D0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10ACC(char a1, int64_t a2, char a3, char *a4)
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
    sub_2C4C(&qword_1C8D0);
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
  id v13 = a4 + 32;
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
  uint64_t result = sub_156C8();
  __break(1u);
  return result;
}

uint64_t sub_10C1C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10C64(uint64_t a1, uint64_t a2)
{
  sub_15718();
  sub_154C8();
  Swift::Int v4 = sub_15728();

  return sub_10CDC(a1, a2, v4);
}

unint64_t sub_10CDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_156F8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_156F8() & 1) == 0);
    }
  }
  return v6;
}

void sub_10DC0(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      sub_15648();
      sub_13E18(0, &qword_1C8A0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (sub_15628() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_15638();
  sub_13E18(0, &qword_1C8A0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = sub_155A8(*(void *)(a4 + 40));
  uint64_t v8 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v7 & ~v8;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v9 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v10 = sub_155B8();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v6 = (v6 + 1) & v11;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_23;
      }
      id v12 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v13 = sub_155B8();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  BOOL v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_11038(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  id v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_110C0(void *a1, void *a2, NSObject *a3, NSObject *a4)
{
  id v237 = a2;
  id v224 = a1;
  uint64_t v6 = sub_2C4C(&qword_1C768);
  __chkstk_darwin(v6 - 8);
  v225 = (char *)v215 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v229 = sub_14F18();
  uint64_t v228 = *(void *)(v229 - 8);
  uint64_t v8 = __chkstk_darwin(v229);
  v227 = (char *)v215 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v226 = v9;
  __chkstk_darwin(v8);
  uint64_t v232 = (char *)v215 - v10;
  uint64_t v11 = sub_14FA8();
  uint64_t v239 = *(void *)(v11 - 8);
  uint64_t v240 = (void (*)(void, void))v11;
  __chkstk_darwin(v11);
  uint64_t v238 = (char *)v215 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2C4C(&qword_1C760);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  v233 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))((char *)v215 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v234 = (void (*)(char *, char *, uint64_t))((char *)v215 - v17);
  uint64_t v18 = __chkstk_darwin(v16);
  v222 = (char *)v215 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v223 = (uint64_t)v215 - v21;
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)v215 - v22;
  uint64_t v24 = sub_14EB8();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v244 = v24;
  uint64_t v245 = v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v241 = (char *)v215 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  uint64_t v236 = (char *)v215 - v28;
  uint64_t v29 = sub_14FD8();
  uint64_t v246 = *(void *)(v29 - 8);
  uint64_t v247 = v29;
  uint64_t v30 = *(void *)(v246 + 64);
  uint64_t v31 = __chkstk_darwin(v29);
  v243 = (char *)v215 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __chkstk_darwin(v31);
  id v231 = (char *)v215 - v33;
  uint64_t v34 = __chkstk_darwin(v32);
  id v36 = (char *)v215 - v35;
  __chkstk_darwin(v34);
  id v38 = (char *)v215 - v37;
  uint64_t v39 = sub_15388();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v249 = v39;
  uint64_t v250 = v40;
  uint64_t v41 = __chkstk_darwin(v39);
  os_log_type_t v43 = (char *)v215 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __chkstk_darwin(v41);
  v242 = (char *)v215 - v45;
  uint64_t v46 = __chkstk_darwin(v44);
  v230 = (char *)v215 - v47;
  uint64_t v48 = __chkstk_darwin(v46);
  unint64_t v50 = (char *)v215 - v49;
  __chkstk_darwin(v48);
  id v52 = (char *)v215 - v51;
  uint64_t v251 = swift_allocObject();
  *(void *)(v251 + 16) = a4;
  id v53 = *(Class *)((char *)&a3->isa + OBJC_IVAR___MessagesViewController_sessionViewModel);
  v248 = a4;
  _Block_copy(a4);
  if (sub_15198())
  {
    sub_15368();
    id v54 = a3;
    unint64_t v55 = sub_15378();
    os_log_type_t v56 = sub_15578();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = swift_slowAlloc();
      v253 = (void (*)(void, void))swift_slowAlloc();
      *(_DWORD *)uint64_t v57 = 136315394;
      id v58 = v54;
      id v59 = [v58 description];
      uint64_t v60 = sub_15498();
      unint64_t v62 = v61;

      uint64_t v252 = sub_105C4(v60, v62, (uint64_t *)&v253);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v57 + 12) = 2080;
      uint64_t v252 = sub_105C4(0xD00000000000004BLL, 0x80000000000170F0, (uint64_t *)&v253);
      sub_155D8();
      _os_log_impl(&dword_0, v55, v56, "%s, %s: Unable to send - session is still initializing", (uint8_t *)v57, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v250 + 8))(v52, v249);
    ((void (*)(NSObject *, void, void))v248[2].isa)(v248, 0, 0);
    return swift_release();
  }
  v235 = a3;
  sub_151C8();
  char v63 = sub_14FC8();
  v221 = v38;
  if ((v63 & 1) == 0)
  {
    sub_15368();
    uint64_t v76 = v246;
    uint64_t v77 = v247;
    (*(void (**)(char *, char *, uint64_t))(v246 + 16))(v36, v38, v247);
    uint64_t v78 = v235;
    unint64_t v79 = sub_15378();
    os_log_type_t v80 = sub_15558();
    int v81 = v80;
    if (os_log_type_enabled(v79, v80))
    {
      uint64_t v82 = swift_slowAlloc();
      uint64_t v244 = swift_slowAlloc();
      v253 = (void (*)(void, void))v244;
      *(_DWORD *)uint64_t v82 = 136315650;
      LODWORD(v243) = v81;
      uint64_t v83 = v78;
      uint64_t v245 = (uint64_t)v78;
      id v84 = v83;
      id v85 = [v83 description];
      uint64_t v86 = sub_15498();
      unint64_t v88 = v87;

      uint64_t v252 = sub_105C4(v86, v88, (uint64_t *)&v253);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v82 + 12) = 2080;
      uint64_t v252 = sub_105C4(0xD00000000000004BLL, 0x80000000000170F0, (uint64_t *)&v253);
      sub_155D8();
      *(_WORD *)(v82 + 22) = 2080;
      unint64_t v89 = v238;
      sub_14FB8();
      uint64_t v90 = sub_14F98();
      unint64_t v92 = v91;
      (*(void (**)(char *, void))(v239 + 8))(v89, v240);
      uint64_t v252 = sub_105C4(v90, v92, (uint64_t *)&v253);
      uint64_t v77 = v247;
      sub_155D8();
      swift_bridgeObjectRelease();
      uint64_t v93 = *(void (**)(char *, uint64_t))(v76 + 8);
      v93(v36, v77);
      _os_log_impl(&dword_0, v79, (os_log_type_t)v243, "%s, %s: Start message send invalid: %s", (uint8_t *)v82, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v93 = *(void (**)(char *, uint64_t))(v76 + 8);
      v93(v36, v77);
    }

    (*(void (**)(char *, uint64_t))(v250 + 8))(v50, v249);
    ((void (*)(NSObject *, void, void))v248[2].isa)(v248, 0, 0);
    uint64_t v94 = v221;
    sub_3708(v221);
    v93(v94, v77);
    return swift_release();
  }
  if (([self zelkovaGroupEnabled] & 1) == 0)
  {
    id v64 = [v237 recipientAddresses];
    uint64_t v65 = sub_154F8();

    uint64_t v66 = *(void *)(v65 + 16);
    swift_bridgeObjectRelease();
    if (v66 != 1)
    {
      sub_15368();
      uint64_t v96 = v235;
      uint64_t v97 = sub_15378();
      os_log_type_t v98 = sub_15558();
      if (os_log_type_enabled(v97, v98))
      {
        uint64_t v99 = swift_slowAlloc();
        v253 = (void (*)(void, void))swift_slowAlloc();
        *(_DWORD *)uint64_t v99 = 136315394;
        uint64_t v245 = v99 + 4;
        id v100 = v96;
        id v101 = [v100 description];
        uint64_t v102 = sub_15498();
        unint64_t v104 = v103;

        uint64_t v252 = sub_105C4(v102, v104, (uint64_t *)&v253);
        sub_155D8();

        id v38 = v221;
        swift_bridgeObjectRelease();
        *(_WORD *)(v99 + 12) = 2080;
        uint64_t v252 = sub_105C4(0xD00000000000004BLL, 0x80000000000170F0, (uint64_t *)&v253);
        sub_155D8();
        _os_log_impl(&dword_0, v97, v98, "%s, %s: Cannot start a session with more than one recipient", (uint8_t *)v99, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v250 + 8))(v43, v249);
      uint64_t v149 = v246;
      uint64_t v148 = v247;
      ((void (*)(NSObject *, void, void))v248[2].isa)(v248, 0, 0);
      unint64_t v150 = v243;
      (*(void (**)(char *, void, uint64_t))(v149 + 104))(v243, enum case for SendValidity.groupChat(_:), v148);
      sub_3708(v150);
      unint64_t v151 = *(void (**)(char *, uint64_t))(v149 + 8);
      v151(v150, v148);
      v151(v38, v148);
      return swift_release();
    }
  }
  type metadata accessor for SMMessagesFactory();
  id v67 = static SMMessagesFactory.startSessionMessage(sessionViewModel:)(v53);
  id v68 = [v67 URL];
  if (!v68)
  {
    id v237 = *(id *)(v245 + 56);
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v237)(v23, 1, 1, v244);
    goto LABEL_17;
  }
  id v69 = v68;
  id v220 = v67;
  id v70 = v241;
  sub_14E98();

  uint64_t v71 = v245;
  uint64_t v72 = *(void (**)(char *, char *, uint64_t))(v245 + 32);
  os_log_type_t v73 = v70;
  uint64_t v74 = v244;
  v72(v23, v73, v244);
  id v237 = *(id *)(v71 + 56);
  ((void (*)(char *, void, uint64_t, uint64_t))v237)(v23, 0, 1, v74);
  id v75 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v71 + 48);
  if (v75(v23, 1, v74) == 1)
  {
    id v67 = v220;
LABEL_17:
    sub_13D54((uint64_t)v23, &qword_1C760);
    uint64_t v95 = v247;
LABEL_30:
    v152 = v242;
    sub_15368();
    id v153 = v67;
    int v154 = sub_15378();
    os_log_type_t v155 = sub_15558();
    if (os_log_type_enabled(v154, v155))
    {
      uint64_t v156 = swift_slowAlloc();
      id v157 = (void *)swift_slowAlloc();
      uint64_t v240 = (void (*)(void, void))swift_slowAlloc();
      v253 = v240;
      *(_DWORD *)uint64_t v156 = 136316162;
      uint64_t v252 = sub_105C4(0xD00000000000004BLL, 0x80000000000170F0, (uint64_t *)&v253);
      sub_155D8();
      *(_WORD *)(v156 + 12) = 2080;
      id v158 = [v153 description];
      uint64_t v159 = sub_15498();
      unint64_t v161 = v160;

      uint64_t v252 = sub_105C4(v159, v161, (uint64_t *)&v253);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v156 + 22) = 2112;
      id v162 = [v153 layout];
      id v163 = v162;
      if (v162) {
        uint64_t v252 = (uint64_t)v162;
      }
      else {
        uint64_t v252 = 0;
      }
      sub_155D8();
      uint64_t v164 = (uint64_t)v233;
      *id v157 = v163;

      *(_WORD *)(v156 + 32) = 2080;
      id v165 = [v153 URL];
      uint64_t v166 = (uint64_t)v234;
      if (v165)
      {
        id v167 = v165;
        sub_14E98();

        uint64_t v168 = 0;
      }
      else
      {
        uint64_t v168 = 1;
      }
      uint64_t v170 = v244;
      uint64_t v169 = v245;
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v237)(v164, v168, 1, v244);
      sub_2CF0(v164, v166);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v169 + 48))(v166, 1, v170))
      {
        uint64_t v171 = 0x6C7275206F6ELL;
        sub_13D54(v166, &qword_1C760);
        unint64_t v172 = 0xE600000000000000;
      }
      else
      {
        unint64_t v173 = v241;
        (*(void (**)(char *, uint64_t, uint64_t))(v169 + 16))(v241, v166, v170);
        sub_13D54(v166, &qword_1C760);
        uint64_t v174 = sub_14E78();
        uint64_t v175 = v169;
        uint64_t v171 = v174;
        unint64_t v172 = v176;
        (*(void (**)(char *, uint64_t))(v175 + 8))(v173, v170);
      }
      uint64_t v252 = sub_105C4(v171, v172, (uint64_t *)&v253);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v156 + 42) = 2080;
      id v177 = [v153 summaryText];
      if (v177)
      {
        uint64_t v178 = v177;
        uint64_t v179 = sub_15498();
        unint64_t v181 = v180;
      }
      else
      {
        unint64_t v181 = 0xEF74786574207972;
        uint64_t v179 = 0x616D6D7573206F6ELL;
      }
      uint64_t v252 = sub_105C4(v179, v181, (uint64_t *)&v253);
      sub_155D8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v154, v155, "%s, message:%s, message layout:%@, message url: %s, summary text: %s", (uint8_t *)v156, 0x34u);
      sub_2C4C(&qword_1C790);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v250 + 8))(v242, v249);
      uint64_t v95 = v247;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v250 + 8))(v152, v249);
    }
    ((void (*)(NSObject *, void, void))v248[2].isa)(v248, 0, 0);
    uint64_t v182 = v246;
    int v183 = v243;
    (*(void (**)(char *, void, uint64_t))(v246 + 104))(v243, enum case for SendValidity.notReady(_:), v95);
    sub_3708(v183);

    uint64_t v184 = *(void (**)(char *, uint64_t))(v182 + 8);
    v184(v183, v95);
    v184(v221, v95);
    return swift_release();
  }
  uint64_t v219 = v71 + 56;
  os_log_type_t v105 = v236;
  v72(v236, v23, v74);
  id v67 = v220;
  id v106 = [v220 layout];
  if (!v106)
  {
    (*(void (**)(char *, uint64_t))(v245 + 8))(v105, v74);
LABEL_29:
    uint64_t v95 = v247;
    goto LABEL_30;
  }
  uint64_t v107 = v106;
  v218 = v53;
  id v108 = [v67 summaryText];
  if (!v108)
  {

    (*(void (**)(char *, uint64_t))(v245 + 8))(v236, v74);
    goto LABEL_29;
  }
  uint64_t v109 = v108;
  v233 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v75;
  uint64_t v110 = v236;
  sub_14E88(&var18);
  unint64_t v112 = v111;
  id v113 = v224;
  [v224 setURL:v111];

  [v113 setLayout:v107];
  [v113 setSummaryText:v109];

  uint64_t v114 = v245 + 8;
  uint64_t v217 = *(void (**)(char *, uint64_t))(v245 + 8);
  v217(v110, v74);
  uint64_t v115 = v230;
  sub_15368();
  uint64_t v116 = *(void (**)(char *, char *, uint64_t))(v246 + 16);
  uint64_t v236 = (char *)(v246 + 16);
  uint64_t v234 = v116;
  v116(v231, v38, v247);
  id v117 = v113;
  uint64_t v118 = v235;
  id v119 = v117;
  id v120 = v118;
  uint64_t v121 = (char *)v119;
  unint64_t v122 = sub_15378();
  int v123 = sub_15578();
  BOOL v124 = os_log_type_enabled(v122, (os_log_type_t)v123);
  v248 = v120;
  if (v124)
  {
    v215[1] = v114;
    LODWORD(v224) = v123;
    v235 = v122;
    uint64_t v125 = swift_slowAlloc();
    uint64_t v216 = swift_slowAlloc();
    v253 = (void (*)(void, void))v216;
    *(_DWORD *)uint64_t v125 = 136316162;
    uint64_t v126 = v120;
    v242 = v121;
    uint64_t v127 = v126;
    id v128 = [v126 description];
    uint64_t v129 = sub_15498();
    unint64_t v131 = v130;

    uint64_t v252 = sub_105C4(v129, v131, (uint64_t *)&v253);
    sub_155D8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v125 + 12) = 2080;
    uint64_t v252 = sub_105C4(0xD00000000000004BLL, 0x80000000000170F0, (uint64_t *)&v253);
    sub_155D8();
    *(_WORD *)(v125 + 22) = 2080;
    id v132 = [v242 description];
    uint64_t v133 = sub_15498();
    unint64_t v135 = v134;

    uint64_t v252 = sub_105C4(v133, v135, (uint64_t *)&v253);
    sub_155D8();

    swift_bridgeObjectRelease();
    *(_WORD *)(v125 + 32) = 2080;
    unint64_t v136 = v238;
    uint64_t v137 = v231;
    sub_14FB8();
    uint64_t v138 = sub_14F98();
    unint64_t v140 = v139;
    (*(void (**)(char *, void))(v239 + 8))(v136, v240);
    uint64_t v252 = sub_105C4(v138, v140, (uint64_t *)&v253);
    sub_155D8();
    id v141 = v242;
    swift_bridgeObjectRelease();
    uint64_t v142 = v246 + 8;
    uint64_t v240 = *(void (**)(void, void))(v246 + 8);
    v240(v137, v247);
    *(_WORD *)(v125 + 42) = 2080;
    id v143 = [v141 URL];
    if (v143)
    {
      unint64_t v144 = v143;
      uint64_t v145 = (uint64_t)v222;
      sub_14E98();

      uint64_t v146 = 0;
      uint64_t v147 = v245;
    }
    else
    {
      uint64_t v146 = 1;
      uint64_t v147 = v245;
      uint64_t v145 = (uint64_t)v222;
    }
    uint64_t v188 = v142 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v237)(v145, v146, 1, v74);
    uint64_t v189 = v223;
    sub_2CF0(v145, v223);
    if (v233(v189, 1, v74))
    {
      uint64_t v190 = 0x6C7275206F6ELL;
      sub_13D54(v189, &qword_1C760);
      unint64_t v191 = 0xE600000000000000;
    }
    else
    {
      uint64_t v192 = *(void (**)(char *, uint64_t, uint64_t))(v147 + 16);
      uint64_t v193 = v241;
      v192(v241, v189, v74);
      sub_13D54(v189, &qword_1C760);
      uint64_t v190 = sub_14E78();
      unint64_t v191 = v194;
      v217(v193, v74);
    }
    uint64_t v252 = sub_105C4(v190, v191, (uint64_t *)&v253);
    sub_155D8();

    swift_bridgeObjectRelease();
    unint64_t v195 = v235;
    _os_log_impl(&dword_0, v235, (os_log_type_t)v224, "%s, %s: message, %s, sendValidity, %s, message url, %s", (uint8_t *)v125, 0x34u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v250 + 8))(v230, v249);
    uint64_t v187 = v248;
    uint64_t v245 = v188;
  }
  else
  {

    uint64_t v186 = *(void (**)(void, void))(v246 + 8);
    uint64_t v245 = (v246 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    uint64_t v240 = v186;
    v186(v231, v247);

    (*(void (**)(char *, uint64_t))(v250 + 8))(v115, v249);
    uint64_t v187 = v120;
  }
  uint64_t v196 = v232;
  sub_14F08();
  uint64_t v197 = v228;
  v198 = *(void (**)(char *, char *, uint64_t))(v228 + 16);
  uint64_t v199 = (uint64_t)v225;
  uint64_t v200 = v229;
  v198(v225, v196, v229);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v197 + 56))(v199, 0, 1, v200);
  uint64_t v201 = (uint64_t)v187 + OBJC_IVAR___MessagesViewController_transactionID;
  swift_beginAccess();
  sub_13850(v199, v201, &qword_1C768);
  swift_endAccess();
  v202 = v227;
  v198(v227, v196, v200);
  uint64_t v203 = v243;
  v234(v243, v221, v247);
  unint64_t v204 = (*(unsigned __int8 *)(v197 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v197 + 80);
  unint64_t v205 = (v226 + v204 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v206 = v246;
  unint64_t v207 = (*(unsigned __int8 *)(v246 + 80) + v205 + 16) & ~(unint64_t)*(unsigned __int8 *)(v246 + 80);
  uint64_t v208 = swift_allocObject();
  uint64_t v209 = v248;
  *(void *)(v208 + 16) = v248;
  (*(void (**)(unint64_t, char *, uint64_t))(v197 + 32))(v208 + v204, v202, v200);
  uint64_t v210 = (void (**)(char, uint64_t, void *))(v208 + v205);
  uint64_t v211 = v251;
  *uint64_t v210 = sub_135E4;
  v210[1] = (void (*)(char, uint64_t, void *))v211;
  unint64_t v212 = v208 + v207;
  uint64_t v213 = v247;
  (*(void (**)(unint64_t, char *, uint64_t))(v206 + 32))(v212, v203, v247);
  uint64_t v214 = v209;
  swift_retain();
  sub_15128();

  swift_release();
  (*(void (**)(char *, uint64_t))(v197 + 8))(v232, v200);
  v240(v221, v213);
  return swift_release();
}

void sub_12CB8()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_15388();
  uint64_t v3 = *(void (***)(char *, uint64_t))(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v40 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2C4C(&qword_1C7A0);
  __chkstk_darwin(v5 - 8);
  uint64_t v39 = (void (**)(char *, uint64_t))((char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_14F18();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v37 - v12;
  uint64_t v14 = sub_15338();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = (char *)[v1 activeConversation];
  if (v18)
  {
    id v38 = v1;
    uint64_t v40 = v18;
    id v19 = [v18 selectedMessage];
    if (v19)
    {
      uint64_t v20 = v19;
      id v21 = [v19 senderParticipantIdentifier];
      sub_14EF8();

      id v22 = [v40 localParticipantIdentifier];
      sub_14EF8();

      LOBYTE(v22) = sub_14EE8();
      uint64_t v23 = *(void (**)(char *, uint64_t))(v8 + 8);
      v23(v11, v7);
      v23(v13, v7);
      uint64_t v24 = (unsigned int *)&enum case for UserType.initiator(_:);
      if ((v22 & 1) == 0) {
        uint64_t v24 = (unsigned int *)&enum case for UserType.receiver(_:);
      }
      (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, *v24, v14);
      uint64_t v25 = (uint64_t)v39;
      (*(void (**)(void (**)(char *, uint64_t), char *, uint64_t))(v15 + 16))(v39, v17, v14);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v15 + 56))(v25, 0, 1, v14);
      uint64_t v26 = (uint64_t)v38 + OBJC_IVAR___MessagesViewController_userType;
      swift_beginAccess();
      sub_13850(v25, v26, &qword_1C7A0);
      swift_endAccess();

      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    }
    else
    {
      id v36 = v40;
    }
  }
  else
  {
    uint64_t v39 = v3;
    sub_15368();
    id v27 = v1;
    uint64_t v28 = sub_15378();
    os_log_type_t v29 = sub_15568();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc();
      v41[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 136315650;
      id v31 = v27;
      id v32 = [v31 description];
      uint64_t v33 = sub_15498();
      unint64_t v35 = v34;

      uint64_t v42 = sub_105C4(v33, v35, v41);
      sub_155D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2080;
      uint64_t v42 = sub_105C4(0xD000000000000012, 0x80000000000173A0, v41);
      sub_155D8();
      *(_WORD *)(v30 + 22) = 2080;
      uint64_t v42 = sub_105C4(0xD000000000000012, 0x80000000000173A0, v41);
      sub_155D8();
      _os_log_impl(&dword_0, v28, v29, "%s, %s: No active conversation in %s.", (uint8_t *)v30, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    v39[1](v40, v2);
  }
}

uint64_t sub_132A4()
{
  return type metadata accessor for MessagesViewController();
}

void sub_132AC()
{
  sub_13438(319, &qword_1C7F0, (void (*)(uint64_t))&type metadata accessor for UUID);
  if (v0 <= 0x3F)
  {
    sub_13438(319, &qword_1C7F8, (void (*)(uint64_t))&type metadata accessor for URL);
    if (v1 <= 0x3F)
    {
      sub_13438(319, &qword_1C800, (void (*)(uint64_t))&type metadata accessor for UserType);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_13438(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_155C8();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1348C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_134A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_13508(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1356C()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_135A4(uint64_t a1)
{
  sub_7088(a1, *(void **)(v1 + 16));
}

uint64_t sub_135AC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_135E4(char a1, uint64_t a2, void *a3)
{
  sub_5DC4(a1, a2, a3, *(void *)(v3 + 16));
}

uint64_t sub_135F0()
{
  uint64_t v1 = sub_14F18();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = sub_14FD8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 16) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return _swift_deallocObject(v0, v10, v11);
}

uint64_t sub_13764(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_14F18() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void *)(sub_14FD8() - 8);
  uint64_t v7 = *(void **)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + v5);
  uint64_t v9 = *(void *)(v1 + v5 + 8);
  uint64_t v10 = v1 + ((v5 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));

  return sub_4A10(a1, v7, v1 + v4, v8, v9, v10);
}

uint64_t sub_13850(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_2C4C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_138B4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_138EC()
{
  uint64_t v1 = sub_14EB8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_139B8()
{
  uint64_t v1 = *(void *)(sub_14EB8() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  sub_C8CC(v2, v3);
}

uint64_t sub_13A1C()
{
  uint64_t v1 = sub_14F18();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  unint64_t v5 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = sub_14FD8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 16) & ~v8;
  uint64_t v12 = v9 + *(void *)(v7 + 64);
  uint64_t v10 = v3 | v8 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_errorRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);

  return _swift_deallocObject(v0, v12, v10);
}

uint64_t sub_13BA8()
{
  uint64_t v1 = *(void *)(sub_14F18() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(sub_14FD8() - 8);
  uint64_t v6 = *(void **)(v0 + 16);
  uint64_t v7 = *(void *)(v0 + v3);
  uint64_t v8 = *(void (**)(void, void, void))(v0 + v4);
  uint64_t v9 = *(void *)(v0 + v4 + 8);
  uint64_t v10 = v0 + ((v4 + *(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_4EB4(v6, v0 + v2, v7, v8, v9, v10);
}

uint64_t sub_13C98(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_13CA8()
{
  return swift_release();
}

unint64_t sub_13CB0()
{
  unint64_t result = qword_1C880;
  if (!qword_1C880)
  {
    sub_13D0C(&qword_1C878);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C880);
  }
  return result;
}

uint64_t sub_13D0C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_13D54(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2C4C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_13DB0()
{
  unint64_t result = qword_1C8A8;
  if (!qword_1C8A8)
  {
    sub_13E18(255, &qword_1C8A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1C8A8);
  }
  return result;
}

uint64_t sub_13E18(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_13E54()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_13E8C()
{
  return sub_45B4();
}

uint64_t sub_13E94(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_2C4C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_13EF8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_13F08(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_13F14(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_13F64(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_13FC4()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_14004()
{
  long long v2 = *(void **)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  id v3 = [v2 parentViewController];
  if (v3)
  {
    id v4 = v3;
    [v3 presentViewController:v1 animated:1 completion:0];
  }
  else
  {
    [v2 presentViewController:v1 animated:1 completion:0];
  }
}

id sub_140B4()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_15108();
  swift_release_n();

  return [v1 dismissViewControllerAnimated:1 completion:0];
}

void sub_14160()
{
}

uint64_t sub_14184()
{
  return sub_6DB8();
}

void sub_141A8()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    [Strong requestResize];
  }
}

void sub_14204(uint64_t a1)
{
}

id static SMMessagesFactory.startSessionMessage(sessionViewModel:)(void *a1)
{
  uint64_t v2 = sub_2C4C(&qword_1C760);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)v84 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_14F38();
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_15478();
  __chkstk_darwin(v8 - 8);
  v84[2] = (char *)v84 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_15458();
  __chkstk_darwin(v10 - 8);
  v84[1] = (char *)v84 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_14F18();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v84 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2C4C(&qword_1C768);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  id v19 = (char *)v84 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  id v21 = (char *)v84 - v20;
  uint64_t v22 = sub_2C4C(&qword_1C8D8);
  uint64_t v23 = __chkstk_darwin(v22 - 8);
  uint64_t v85 = (uint64_t)v84 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)v84 - v25;
  id v87 = a1;
  id v27 = (void *)sub_15138();
  uint64_t v28 = v27;
  if (v27)
  {
    id v29 = [v27 outputToURLComponents];
    sub_14E48();

    uint64_t v30 = sub_14E68();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v26, 0, 1, v30);
  }
  else
  {
    uint64_t v31 = sub_14E68();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v26, 1, 1, v31);
  }
  id v32 = [objc_allocWithZone((Class)MSMessageTemplateLayout) init];
  unint64_t v88 = v4;
  id v89 = v28;
  id v86 = v32;
  v84[3] = v7;
  if (!v28)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v21, 1, 1, v12);
    goto LABEL_9;
  }
  id v33 = [v28 sessionID];
  sub_14EF8();

  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v21, v15, v12);
  unint64_t v34 = *(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56);
  v34(v21, 0, 1, v12);
  unint64_t v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v35(v21, 1, v12) == 1)
  {
LABEL_9:
    sub_13D54((uint64_t)v21, &qword_1C768);
    sub_13E18(0, &qword_1C8E0);
    uint64_t v38 = (uint64_t)v26;
    uint64_t v40 = v88;
    id v39 = v89;
LABEL_10:
    id v41 = [objc_allocWithZone((Class)MSSession) init];
    uint64_t v42 = 0;
    goto LABEL_11;
  }
  sub_13D54((uint64_t)v21, &qword_1C768);
  id v36 = [v89 sessionID];
  sub_14EF8();

  v34(v19, 0, 1, v12);
  if (v35(v19, 1, v12) == 1)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = sub_14ED8().super.isa;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v19, v12);
  }
  uint64_t v38 = (uint64_t)v26;
  uint64_t v40 = v88;
  id v83 = [objc_allocWithZone((Class)MSSession) initWithIdentifier:isa];

  sub_13E18(0, &qword_1C8E0);
  id v39 = v89;
  if (!v83) {
    goto LABEL_10;
  }
  id v41 = v83;
  uint64_t v42 = v41;
LABEL_11:
  id v43 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithSession:v41];

  if (v39)
  {
    id v44 = [v39 summaryText];
    sub_15498();
    uint64_t v46 = v45;
  }
  else
  {
    uint64_t v46 = 0;
  }
  uint64_t v47 = sub_15118();
  id v87 = v42;
  if (v47 && (v48 = sub_15258(), swift_release(), v48 == 2) && (uint64_t v49 = sub_151B8(), (v50 & 1) == 0) && v49 == 4)
  {
    uint64_t v51 = (void *)sub_15168();
    if (v51)
    {
      id v52 = v51;
      id v53 = [v51 _shortAddress];

      if (v53)
      {
        uint64_t v54 = sub_15498();
        os_log_type_t v56 = v55;

        swift_bridgeObjectRelease();
        sub_15448();
        v90._countAndFlagsBits = 0x49A0C26B63656843;
        v90._object = (void *)0xAB00000000203A6ELL;
        sub_15438(v90);
        v91._countAndFlagsBits = v54;
        v91._object = v56;
        sub_15428(v91);
        swift_bridgeObjectRelease();
        v92._countAndFlagsBits = 0;
        v92._object = (void *)0xE000000000000000;
        sub_15438(v92);
        sub_15468();
        sub_13E18(0, &qword_1C8B8);
        uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
        id v58 = [self bundleForClass:ObjCClassFromMetadata];
        sub_14F28();
LABEL_26:
        sub_154A8();
        uint64_t v46 = v68;
      }
    }
  }
  else if (sub_15118())
  {
    uint64_t v59 = sub_15258();
    swift_release();
    if (v59 == 3)
    {
      uint64_t v60 = (void *)sub_15168();
      if (v60)
      {
        unint64_t v61 = v60;
        id v62 = [v60 _shortAddress];

        if (v62)
        {
          uint64_t v63 = sub_15498();
          uint64_t v65 = v64;

          swift_bridgeObjectRelease();
          sub_15448();
          v93._object = (void *)0x8000000000017810;
          v93._countAndFlagsBits = 0x1000000000000019;
          sub_15438(v93);
          v94._countAndFlagsBits = v63;
          v94._object = v65;
          sub_15428(v94);
          swift_bridgeObjectRelease();
          v95._countAndFlagsBits = 0;
          v95._object = (void *)0xE000000000000000;
          sub_15438(v95);
          sub_15468();
          sub_13E18(0, &qword_1C8B8);
          uint64_t v66 = swift_getObjCClassFromMetadata();
          id v67 = [self bundleForClass:v66];
          sub_14F28();
          goto LABEL_26;
        }
      }
    }
  }
  uint64_t v69 = v85;
  sub_14D98(v38, v85);
  uint64_t v70 = sub_14E68();
  uint64_t v71 = *(void *)(v70 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v71 + 48))(v69, 1, v70) == 1)
  {
    sub_13D54(v69, &qword_1C8D8);
    uint64_t v72 = sub_14EB8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(v40, 1, 1, v72);
    os_log_type_t v73 = 0;
  }
  else
  {
    sub_14E58();
    (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v69, v70);
    uint64_t v74 = sub_14EB8();
    uint64_t v75 = *(void *)(v74 - 8);
    os_log_type_t v73 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v75 + 48))(v40, 1, v74) != 1)
    {
      sub_14E88(v76);
      os_log_type_t v73 = v77;
      (*(void (**)(char *, uint64_t))(v75 + 8))(v40, v74);
    }
  }
  [v43 setURL:v73];

  if (v46)
  {
    swift_bridgeObjectRetain();
    NSString v78 = sub_15488();
    swift_bridgeObjectRelease();
    [v43 setSummaryText:v78];

    NSString v79 = sub_15488();
    swift_bridgeObjectRelease();
  }
  else
  {
    [v43 setSummaryText:0];
    NSString v79 = 0;
  }
  id v80 = v86;
  [v86 setCaption:v79];

  id v81 = [objc_allocWithZone((Class)MSMessageLiveLayout) initWithAlternateLayout:v80];
  [v43 setLayout:v81];

  [v43 setRequiresValidation:1];
  sub_13D54(v38, &qword_1C8D8);
  return v43;
}

uint64_t SMMessagesFactory.deinit()
{
  return v0;
}

uint64_t SMMessagesFactory.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_14D98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2C4C(&qword_1C8D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for SMMessagesFactory()
{
  return self;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_14E48()
{
  return static URLComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_14E58()
{
  return URLComponents.url.getter();
}

uint64_t sub_14E68()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_14E78()
{
  return URL.absoluteString.getter();
}

void sub_14E88(NSURL *retstr@<X8>)
{
}

uint64_t sub_14E98()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_14EA8()
{
  return URL.init(string:)();
}

uint64_t sub_14EB8()
{
  return type metadata accessor for URL();
}

uint64_t sub_14EC8()
{
  return UUID.uuidString.getter();
}

NSUUID sub_14ED8()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_14EE8()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_14EF8()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_14F08()
{
  return UUID.init()();
}

uint64_t sub_14F18()
{
  return type metadata accessor for UUID();
}

uint64_t sub_14F28()
{
  return static Locale.current.getter();
}

uint64_t sub_14F38()
{
  return type metadata accessor for Locale();
}

uint64_t sub_14F48()
{
  return Selector.init(_:)();
}

uint64_t sub_14F58()
{
  return static SendValidity.sendMessageFailureAlertCannotSendTitle.getter();
}

uint64_t sub_14F68()
{
  return SendValidity.alertErrorMessage.getter();
}

uint64_t sub_14F78()
{
  return SendValidity.settingsDeepLinkUrl.getter();
}

uint64_t sub_14F88()
{
  return static SendValidity.sendMessageFailureAlertOKButtonText.getter();
}

uint64_t sub_14F98()
{
  return SendValidity.Case.rawValue.getter();
}

uint64_t sub_14FA8()
{
  return type metadata accessor for SendValidity.Case();
}

uint64_t sub_14FB8()
{
  return SendValidity.type.getter();
}

uint64_t sub_14FC8()
{
  return SendValidity.isValid.getter();
}

uint64_t sub_14FD8()
{
  return type metadata accessor for SendValidity();
}

uint64_t sub_14FE8()
{
  return dispatch thunk of SafetyCacheViewModel.receiverSessionStatus.getter();
}

uint64_t sub_14FF8()
{
  return SafetyCacheViewModel.init(sessionID:userType:containerVCHandler:)();
}

uint64_t sub_15008()
{
  return type metadata accessor for SafetyCacheViewModel();
}

uint64_t sub_15018()
{
  return static SafetyMonitorUIConstants.okButtonString.getter();
}

uint64_t sub_15028()
{
  return static SafetyMonitorUIConstants.endSessionErrorTitle.getter();
}

uint64_t sub_15038()
{
  return static SafetyMonitorUIConstants.safeResponseToTriggerErrorTitle.getter();
}

uint64_t sub_15048()
{
  return static SafetyMonitorDefaultsKeys.overrideDebugErrorAlertsKey.getter();
}

uint64_t sub_15058()
{
  return CheckInView.init(state:edgeInsets:buttonAction:)();
}

uint64_t sub_15068()
{
  return type metadata accessor for CheckInView();
}

uint64_t sub_15078()
{
  return dispatch thunk of HandlerManager.resizeViewHandler.setter();
}

uint64_t sub_15088()
{
  return dispatch thunk of HandlerManager.stageMessageHandler.setter();
}

uint64_t sub_15098()
{
  return dispatch thunk of HandlerManager.initiatorEndSessionHandler.setter();
}

uint64_t sub_150A8()
{
  return dispatch thunk of HandlerManager.safeResponseToTriggerPrompt.setter();
}

uint64_t sub_150B8()
{
  return HandlerManager.init()();
}

uint64_t sub_150C8()
{
  return type metadata accessor for HandlerManager();
}

uint64_t sub_150D8()
{
  return TranscriptView.init(viewModel:edgeInsets:)();
}

uint64_t sub_150E8()
{
  return type metadata accessor for TranscriptView();
}

uint64_t sub_150F8()
{
  return type metadata accessor for CheckInViewState();
}

uint64_t sub_15108()
{
  return SessionViewModel.endSession(with:)();
}

uint64_t sub_15118()
{
  return SessionViewModel.userSessionConfiguration.getter();
}

uint64_t sub_15128()
{
  return SessionViewModel.startSession(with:)();
}

uint64_t sub_15138()
{
  return SessionViewModel.startSessionMessage()();
}

uint64_t sub_15148()
{
  return SessionViewModel.currentSessionID.getter();
}

uint64_t sub_15158()
{
  return type metadata accessor for SessionViewModel.InitiatorViewType();
}

uint64_t sub_15168()
{
  return SessionViewModel.endLocation.getter();
}

uint64_t sub_15178()
{
  return SessionViewModel.recipientHandles.setter();
}

void sub_15188()
{
}

uint64_t sub_15198()
{
  return SessionViewModel.isInitiatorLoading.getter();
}

void sub_151A8()
{
}

uint64_t sub_151B8()
{
  return SessionViewModel.sessionDestinationType.getter();
}

uint64_t sub_151C8()
{
  return SessionViewModel.sendStartMessageValidity.getter();
}

uint64_t sub_151D8()
{
  return SessionViewModel.safeResponseToTriggerPrompt(with:)();
}

void sub_151E8()
{
}

uint64_t sub_151F8()
{
  return static SessionViewModel.shared.getter();
}

uint64_t sub_15208()
{
  return SessionViewModel.groupID.setter();
}

uint64_t sub_15218()
{
  return SessionViewModel.viewType(for:withPayloadID:)();
}

uint64_t sub_15228()
{
  return type metadata accessor for SessionViewModel();
}

uint64_t sub_15238()
{
  return TranscriptViewModel.init(message:userType:messageSenderContact:handlerManager:sessionViewModel:safetyCacheViewModel:)();
}

uint64_t sub_15248()
{
  return type metadata accessor for TranscriptViewModel();
}

uint64_t sub_15258()
{
  return dispatch thunk of UserSessionConfiguration.sessionType.getter();
}

uint64_t sub_15268()
{
  return InitiatorConfigurationView.init(sessionViewModel:handlerManager:)();
}

uint64_t sub_15278()
{
  return type metadata accessor for InitiatorConfigurationView();
}

uint64_t sub_15288()
{
  return CriticalAlertOnboardingView.Model.init(for:receiverSessionStatus:)();
}

uint64_t sub_15298()
{
  return type metadata accessor for CriticalAlertOnboardingView.Model();
}

uint64_t sub_152A8()
{
  return InitiatorSessionDetailsView.init(sessionViewModel:handlerManager:safetyCacheViewModel:showCachePersistence:)();
}

uint64_t sub_152B8()
{
  return type metadata accessor for InitiatorSessionDetailsView();
}

uint64_t sub_152C8()
{
  return TranscriptHostingController.init(rootView:)();
}

uint64_t sub_152D8()
{
  return type metadata accessor for TranscriptHostingController();
}

uint64_t sub_152E8()
{
  return CheckInOnboardingViewController.init(with:isInSettings:)();
}

uint64_t sub_152F8()
{
  return type metadata accessor for CheckInOnboardingViewController();
}

uint64_t sub_15308()
{
  return CriticalAlertOnboardingViewController.init(model:)();
}

uint64_t sub_15318()
{
  return type metadata accessor for CriticalAlertOnboardingViewController();
}

uint64_t sub_15328()
{
  return static UserType.== infix(_:_:)();
}

uint64_t sub_15338()
{
  return type metadata accessor for UserType();
}

uint64_t sub_15348()
{
  return static Logger.sharedUI.getter();
}

uint64_t sub_15358()
{
  return static Logger.receiver.getter();
}

uint64_t sub_15368()
{
  return static Logger.initiator.getter();
}

uint64_t sub_15378()
{
  return Logger.logObject.getter();
}

uint64_t sub_15388()
{
  return type metadata accessor for Logger();
}

uint64_t sub_15398()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_153A8()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_153B8()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_153C8()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_153D8()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_153E8()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_153F8()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_15408()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_15418()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

void sub_15428(Swift::String a1)
{
}

void sub_15438(Swift::String a1)
{
}

uint64_t sub_15448()
{
  return String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_15458()
{
  return type metadata accessor for String.LocalizationValue.StringInterpolation();
}

uint64_t sub_15468()
{
  return String.LocalizationValue.init(stringInterpolation:)();
}

uint64_t sub_15478()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_15488()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_15498()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_154A8()
{
  return String.init(localized:defaultValue:table:bundle:locale:comment:)();
}

uint64_t sub_154B8()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_154C8()
{
  return String.hash(into:)();
}

Swift::Int sub_154D8()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_154E8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_154F8()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_15508()
{
  return Array.description.getter();
}

uint64_t sub_15518()
{
  return specialized Array._endMutation()();
}

uint64_t sub_15528()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_15538()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_15548()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_15558()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_15568()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_15578()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_15588()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_15598()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

Swift::Int sub_155A8(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_155B8()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_155C8()
{
  return type metadata accessor for Optional();
}

uint64_t sub_155D8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_155E8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_155F8()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_15608()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_15618()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t sub_15628()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_15638()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_15648()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_15658()
{
  return __CocoaSet.endIndex.getter();
}

uint64_t sub_15668()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_15678()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_15688()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_15698()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_156A8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_156B8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_156C8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_156D8()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_156E8()
{
  return _diagnoseUnexpectedEnumCase<A>(type:)();
}

uint64_t sub_156F8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_15708()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_15718()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_15728()
{
  return Hasher._finalize()();
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
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}