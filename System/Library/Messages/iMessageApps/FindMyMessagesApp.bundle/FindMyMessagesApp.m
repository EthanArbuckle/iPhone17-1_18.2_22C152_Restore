uint64_t sub_51D4()
{
  uint64_t v0;

  v0 = sub_11218();
  sub_10EB0(v0, qword_186A8);
  sub_F04C(v0, (uint64_t)qword_186A8);
  return sub_11208();
}

uint64_t variable initialization expression of FindMyMessagesAppViewController.viewModel()
{
  sub_11278();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v0 = sub_110A8();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v6 = (char *)&v10 - v5;
  sub_11158();
  swift_allocObject();
  uint64_t v7 = sub_11148();
  swift_retain();
  sub_11098();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  id v8 = objc_allocWithZone((Class)sub_53FC(&qword_18480));
  sub_11258();
  sub_11268();
  sub_11238();
  sub_11228();
  sub_11248();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v7;
}

uint64_t sub_53FC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

id FindMyMessagesAppViewController.__deallocating_deinit()
{
  uint64_t v1 = sub_11218();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_F04C(v1, (uint64_t)qword_186A8);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  id v6 = v0;
  uint64_t v7 = sub_111F8();
  os_log_type_t v8 = sub_11348();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v17 = v1;
    uint64_t v10 = v9;
    v15 = (void *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v18 = (uint64_t)v6;
    uint64_t v19 = v16;
    *(_DWORD *)uint64_t v10 = 138412546;
    id v11 = v6;
    sub_11388();
    void *v15 = v6;

    *(_WORD *)(v10 + 12) = 2080;
    uint64_t v18 = sub_F0A8(0x74696E696564, 0xE600000000000000, &v19);
    sub_11388();
    _os_log_impl(&dword_0, v7, v8, "FindMyMessagesAppViewController: %@ - %s", (uint8_t *)v10, 0x16u);
    sub_53FC(&qword_18488);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v17);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  sub_58BC();
  MyMessagesAppViewController = (objc_class *)type metadata accessor for FindMyMessagesAppViewController();
  v20.receiver = v6;
  v20.super_class = MyMessagesAppViewController;
  return objc_msgSendSuper2(&v20, "dealloc");
}

void sub_57A4()
{
  uint64_t v1 = self;
  id v2 = [v1 defaultCenter];
  [v2 addObserver:v0 selector:"sceneWillEnterForegroundWithNotification:" name:UISceneWillEnterForegroundNotification object:0];

  id v3 = [v1 defaultCenter];
  [v3 addObserver:v0 selector:"sceneDidEnterBackgroundWithNotification:" name:UISceneDidEnterBackgroundNotification object:0];

  id v4 = [v1 defaultCenter];
  [v4 addObserver:v0 selector:"sceneDidDisconnectWithNotification:" name:UISceneDidDisconnectNotification object:0];
}

void sub_58BC()
{
  uint64_t v1 = self;
  id v2 = [v1 defaultCenter];
  [v2 removeObserver:v0 name:UISceneWillEnterForegroundNotification object:0];

  id v3 = [v1 defaultCenter];
  [v3 removeObserver:v0 name:UISceneDidEnterBackgroundNotification object:0];

  id v4 = [v1 defaultCenter];
  [v4 removeObserver:v0 name:UISceneDidDisconnectNotification object:0];
}

void sub_59BC(uint64_t a1)
{
}

void sub_5A04(uint64_t a1)
{
}

void sub_5A34(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  os_log_type_t v8 = v4;
  uint64_t v10 = sub_10FE8();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10FD8();
  if (!v71[3])
  {
    sub_10D3C((uint64_t)v71, &qword_18558);
    goto LABEL_8;
  }
  sub_1081C(0, &qword_18568);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    if (qword_18478 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_11218();
    sub_F04C(v28, (uint64_t)qword_186A8);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
    id v29 = v8;
    v30 = sub_111F8();
    os_log_type_t v31 = sub_11358();
    int v32 = v31;
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v33 = swift_slowAlloc();
      v34 = (void *)swift_slowAlloc();
      v67 = (void (*)(void))swift_slowAlloc();
      uint64_t v70 = (uint64_t)v29;
      v71[0] = (uint64_t)v67;
      *(_DWORD *)uint64_t v33 = 138412802;
      os_log_t v66 = v30;
      uint64_t v68 = a2;
      unint64_t v69 = a3;
      LODWORD(v65) = v32;
      id v35 = v29;
      sub_11388();
      void *v34 = v29;

      *(_WORD *)(v33 + 12) = 2080;
      uint64_t v70 = sub_F0A8(v68, v69, v71);
      sub_11388();
      *(_WORD *)(v33 + 22) = 2080;
      sub_10CF4(&qword_18560, (void (*)(uint64_t))&type metadata accessor for Notification);
      uint64_t v36 = sub_11438();
      uint64_t v70 = sub_F0A8(v36, v37, v71);
      sub_11388();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      os_log_t v38 = v66;
      _os_log_impl(&dword_0, v66, (os_log_type_t)v65, "FindMyMessagesAppViewController: %@ - %s - No Scene %s", (uint8_t *)v33, 0x20u);
      sub_53FC(&qword_18488);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    goto LABEL_28;
  }
  uint64_t v14 = a2;
  v15 = (void *)v70;
  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_11218();
  uint64_t v17 = sub_F04C(v16, (uint64_t)qword_186A8);
  id v18 = v8;
  uint64_t v19 = sub_111F8();
  os_log_type_t v20 = sub_11368();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v68 = v14;
  unint64_t v69 = a3;
  v67 = a4;
  if (v21)
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    os_log_t v64 = v19;
    v24 = (void *)v23;
    uint64_t v65 = swift_slowAlloc();
    uint64_t v70 = (uint64_t)v18;
    v71[0] = v65;
    *(_DWORD *)uint64_t v22 = 138412546;
    os_log_t v66 = v17;
    v25 = v15;
    id v26 = v18;
    sub_11388();
    void *v24 = v18;

    v15 = v25;
    *(_WORD *)(v22 + 12) = 2080;
    uint64_t v70 = sub_F0A8(v14, v69, v71);
    sub_11388();
    os_log_t v27 = v64;
    _os_log_impl(&dword_0, v64, v20, "FindMyMessagesAppViewController: %@ - %s", (uint8_t *)v22, 0x16u);
    sub_53FC(&qword_18488);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v39 = [v18 view];
  if (v39)
  {
    v40 = v39;
    id v41 = [v39 window];

    if (v41 && (id v42 = [v41 windowScene], v41, v42))
    {
      id v43 = [v15 session];
      id v44 = [v43 role];

      NSString v45 = sub_11288();
      uint64_t v46 = sub_11298();
      uint64_t v48 = v47;
      if (v46 == sub_11298() && v48 == v49) {
        char v50 = 1;
      }
      else {
        char v50 = sub_11448();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      sub_1081C(0, &qword_18570);
      if (sub_11378() & 1) != 0 || (v50)
      {
        v67();

        return;
      }
      id v57 = v18;
      v30 = sub_111F8();
      os_log_type_t v58 = sub_11368();
      if (os_log_type_enabled(v30, v58))
      {
        uint64_t v59 = swift_slowAlloc();
        v67 = (void (*)(void))v15;
        uint64_t v60 = v59;
        v61 = (void *)swift_slowAlloc();
        os_log_t v66 = (os_log_t)swift_slowAlloc();
        uint64_t v70 = (uint64_t)v57;
        v71[0] = (uint64_t)v66;
        *(_DWORD *)uint64_t v60 = 138412546;
        id v62 = v57;
        sub_11388();
        void *v61 = v57;

        *(_WORD *)(v60 + 12) = 2080;
        uint64_t v70 = sub_F0A8(v68, v69, v71);
        sub_11388();
        _os_log_impl(&dword_0, v30, v58, "MessagesAppViewController: %@ - %s - Skipping, not same view scene", (uint8_t *)v60, 0x16u);
        sub_53FC(&qword_18488);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        goto LABEL_28;
      }
    }
    else
    {
      id v42 = v18;
      v30 = sub_111F8();
      os_log_type_t v51 = sub_11368();
      if (os_log_type_enabled(v30, v51))
      {
        uint64_t v52 = swift_slowAlloc();
        v67 = (void (*)(void))v15;
        uint64_t v53 = v52;
        v54 = (void *)swift_slowAlloc();
        uint64_t v55 = swift_slowAlloc();
        uint64_t v70 = (uint64_t)v42;
        v71[0] = v55;
        *(_DWORD *)uint64_t v53 = 138412546;
        id v56 = v42;
        sub_11388();
        void *v54 = v42;

        *(_WORD *)(v53 + 12) = 2080;
        uint64_t v70 = sub_F0A8(v68, v69, v71);
        sub_11388();
        _os_log_impl(&dword_0, v30, v51, "MessagesAppViewController: %@ - %s - Can't find view scene", (uint8_t *)v53, 0x16u);
        sub_53FC(&qword_18488);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

LABEL_28:
        return;
      }
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_6488(uint64_t a1)
{
}

uint64_t sub_64D0(void *a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t v6 = sub_10FE8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10FC8();
  id v10 = a1;
  a4(v9);

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

Swift::Void __swiftcall FindMyMessagesAppViewController.willBecomeActive(with:)(MSConversation with)
{
  uint64_t v3 = sub_111C8();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MyMessagesAppViewController = (objc_class *)type metadata accessor for FindMyMessagesAppViewController();
  v20.receiver = v1;
  v20.super_class = MyMessagesAppViewController;
  objc_msgSendSuper2(&v20, "willBecomeActiveWithConversation:", with.super.isa);
  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_11218();
  sub_F04C(v8, (uint64_t)qword_186A8);
  id v9 = v1;
  id v10 = sub_111F8();
  os_log_type_t v11 = sub_11368();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v14 = (void *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v18 = (uint64_t)v9;
    uint64_t v19 = v15;
    *(_DWORD *)uint64_t v12 = 138412546;
    uint64_t v16 = v4;
    uint64_t v17 = v3;
    id v13 = v9;
    sub_11388();
    *uint64_t v14 = v9;

    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v18 = sub_F0A8(0xD000000000000017, 0x8000000000012390, &v19);
    uint64_t v4 = v16;
    uint64_t v3 = v17;
    sub_11388();
    _os_log_impl(&dword_0, v10, v11, "FindMyMessagesAppViewController: %@ - %s", (uint8_t *)v12, 0x16u);
    sub_53FC(&qword_18488);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_9BE8(with.super.isa, (unint64_t)[v9 presentationStyle], (uint64_t)v6);
  sub_110F8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

id FindMyMessagesAppViewController.preferredContentSizeDidChange(forChildContentContainer:)(void *a1)
{
  v19.receiver = v1;
  v19.super_class = (Class)type metadata accessor for FindMyMessagesAppViewController();
  objc_msgSendSuper2(&v19, "preferredContentSizeDidChangeForChildContentContainer:", a1);
  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_11218();
  sub_F04C(v3, (uint64_t)qword_186A8);
  id v4 = v1;
  swift_unknownObjectRetain_n();
  id v5 = v4;
  uint64_t v6 = sub_111F8();
  os_log_type_t v7 = sub_11348();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    id v9 = (void *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v18 = v15;
    *(_DWORD *)uint64_t v8 = 138412802;
    id v10 = v5;
    sub_11388();
    *id v9 = v5;

    *(_WORD *)(v8 + 12) = 2080;
    sub_F0A8(0xD000000000000038, 0x80000000000123B0, &v18);
    sub_11388();
    *(_WORD *)(v8 + 22) = 2080;
    [a1 preferredContentSize];
    uint64_t v17 = v11;
    type metadata accessor for CGSize(0);
    uint64_t v12 = sub_112A8();
    uint64_t v16 = sub_F0A8(v12, v13, &v18);
    sub_11388();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v6, v7, "FindMyMessagesAppViewController: %@ - %s - Request Resize - %s", (uint8_t *)v8, 0x20u);
    sub_53FC(&qword_18488);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  return objc_msgSend(v5, "requestResize", v15, v16, v17, v18);
}

Swift::Void __swiftcall FindMyMessagesAppViewController.didBecomeActive(with:)(MSConversation with)
{
  uint64_t v3 = sub_53FC(&qword_18498);
  __chkstk_darwin(v3 - 8);
  id v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MyMessagesAppViewController = (objc_class *)type metadata accessor for FindMyMessagesAppViewController();
  v24.receiver = v1;
  v24.super_class = MyMessagesAppViewController;
  objc_msgSendSuper2(&v24, "didBecomeActiveWithConversation:", with.super.isa);
  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_11218();
  sub_F04C(v7, (uint64_t)qword_186A8);
  uint64_t v8 = v1;
  id v9 = sub_111F8();
  os_log_type_t v10 = sub_11368();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    BOOL v21 = v5;
    uint64_t v22 = (uint64_t)v8;
    uint64_t v23 = v13;
    *(_DWORD *)uint64_t v11 = 138412546;
    uint64_t v14 = v8;
    sub_11388();
    *uint64_t v12 = v8;

    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v22 = sub_F0A8(0xD000000000000016, 0x80000000000123F0, &v23);
    sub_11388();
    _os_log_impl(&dword_0, v9, v10, "FindMyMessagesAppViewController: %@ - %s", (uint8_t *)v11, 0x16u);
    sub_53FC(&qword_18488);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    id v5 = v21;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if ([v8 presentationStyle] == (char *)&dword_0 + 2)
  {
    uint64_t v15 = *(void **)&v8[OBJC_IVAR____TtC17FindMyMessagesApp31FindMyMessagesAppViewController_hostingViewController];
    [v8 _balloonMaskEdgeInsets];
    objc_msgSend(v15, "setAdditionalSafeAreaInsets:");
  }
  uint64_t v16 = sub_11338();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v5, 1, 1, v16);
  sub_11318();
  uint64_t v17 = v8;
  uint64_t v18 = sub_11308();
  objc_super v19 = (void *)swift_allocObject();
  v19[2] = v18;
  v19[3] = &protocol witness table for MainActor;
  v19[4] = v17;
  sub_73A4((uint64_t)v5, (uint64_t)&unk_184A8, (uint64_t)v19);
  swift_release();
}

uint64_t sub_6FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = sub_113F8();
  v4[3] = v5;
  v4[4] = *(void *)(v5 - 8);
  v4[5] = swift_task_alloc();
  sub_11318();
  v4[6] = sub_11308();
  uint64_t v7 = sub_112F8();
  v4[7] = v7;
  v4[8] = v6;
  return _swift_task_switch(sub_70CC, v7, v6);
}

uint64_t sub_70CC()
{
  sub_113E8();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_185C8 + dword_185C8);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_7194;
  return v3(600000000000000000, 0, 0, 0, 1);
}

uint64_t sub_7194()
{
  uint64_t v3 = (void *)*v1;
  id v2 = (void *)*v1;
  swift_task_dealloc();
  uint64_t v4 = v2[5];
  uint64_t v5 = v2[4];
  uint64_t v6 = v2[3];
  if (v0)
  {
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = v3[7];
    uint64_t v8 = v3[8];
    uint64_t v9 = sub_10F6C;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = v3[7];
    uint64_t v8 = v3[8];
    uint64_t v9 = sub_7328;
  }
  return _swift_task_switch(v9, v7, v8);
}

uint64_t sub_7328()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();
  [v1 setReadyForDisplay];
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_73A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_11338();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_11328();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10D3C(a1, &qword_18498);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_112F8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

Swift::Bool __swiftcall FindMyMessagesAppViewController.displaysAfterAppearance()()
{
  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_11218();
  sub_F04C(v1, (uint64_t)qword_186A8);
  id v2 = v0;
  uint64_t v3 = sub_111F8();
  os_log_type_t v4 = sub_11348();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412546;
    id v7 = v2;
    sub_11388();
    void *v6 = v2;

    *(_WORD *)(v5 + 12) = 2080;
    sub_F0A8(0xD000000000000019, 0x8000000000012410, &v9);
    sub_11388();
    _os_log_impl(&dword_0, v3, v4, "FindMyMessagesAppViewController: %@ - %s", (uint8_t *)v5, 0x16u);
    sub_53FC(&qword_18488);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return 0;
}

Swift::Void __swiftcall FindMyMessagesAppViewController.didResignActive(with:)(MSConversation with)
{
  v11.receiver = v1;
  v11.super_class = (Class)type metadata accessor for FindMyMessagesAppViewController();
  objc_msgSendSuper2(&v11, "didResignActiveWithConversation:", with.super.isa);
  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_11218();
  sub_F04C(v3, (uint64_t)qword_186A8);
  id v4 = v1;
  uint64_t v5 = sub_111F8();
  os_log_type_t v6 = sub_11368();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412546;
    id v9 = v4;
    sub_11388();
    *uint64_t v8 = v4;

    *(_WORD *)(v7 + 12) = 2080;
    sub_F0A8(0xD000000000000016, 0x8000000000012430, &v10);
    sub_11388();
    _os_log_impl(&dword_0, v5, v6, "FindMyMessagesAppViewController: %@ - %s", (uint8_t *)v7, 0x16u);
    sub_53FC(&qword_18488);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_110E8();
}

Swift::Void __swiftcall FindMyMessagesAppViewController.didReceive(_:conversation:)(MSMessage _, MSConversation conversation)
{
}

Swift::Void __swiftcall FindMyMessagesAppViewController.didStartSending(_:conversation:)(MSMessage _, MSConversation conversation)
{
}

Swift::Void __swiftcall FindMyMessagesAppViewController.didCancelSending(_:conversation:)(MSMessage _, MSConversation conversation)
{
}

void sub_7C10(uint64_t a1, uint64_t a2, SEL *a3, uint64_t a4, unint64_t a5)
{
  v19.receiver = v5;
  v19.super_class = (Class)type metadata accessor for FindMyMessagesAppViewController();
  objc_msgSendSuper2(&v19, *a3, a1, a2);
  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_11218();
  sub_F04C(v11, (uint64_t)qword_186A8);
  id v12 = v5;
  uint64_t v13 = sub_111F8();
  os_log_type_t v14 = sub_11368();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 138412546;
    id v16 = v12;
    sub_11388();
    *uint64_t v17 = v12;

    *(_WORD *)(v15 + 12) = 2080;
    sub_F0A8(a4, a5, &v18);
    sub_11388();
    _os_log_impl(&dword_0, v13, v14, "FindMyMessagesAppViewController: %@ - %s", (uint8_t *)v15, 0x16u);
    sub_53FC(&qword_18488);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void FindMyMessagesAppViewController.willTransition(to:)(uint64_t a1)
{
  v13.receiver = v1;
  v13.super_class = (Class)type metadata accessor for FindMyMessagesAppViewController();
  objc_msgSendSuper2(&v13, "willTransitionToPresentationStyle:", a1);
  sub_110D8();
  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_11218();
  sub_F04C(v3, (uint64_t)qword_186A8);
  id v4 = v1;
  uint64_t v5 = sub_111F8();
  os_log_type_t v6 = sub_11368();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412802;
    id v9 = v4;
    sub_11388();
    *uint64_t v8 = v4;

    *(_WORD *)(v7 + 12) = 2080;
    sub_F0A8(0xD000000000000013, 0x80000000000124D0, &v12);
    sub_11388();
    *(_WORD *)(v7 + 22) = 2080;
    type metadata accessor for MSMessagesAppPresentationStyle(0);
    uint64_t v10 = sub_112A8();
    sub_F0A8(v10, v11, &v12);
    sub_11388();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v5, v6, "FindMyMessagesAppViewController: %@ - %s presentationStyle: %s", (uint8_t *)v7, 0x20u);
    sub_53FC(&qword_18488);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void FindMyMessagesAppViewController.didTransition(to:)(uint64_t a1)
{
  v13.receiver = v1;
  v13.super_class = (Class)type metadata accessor for FindMyMessagesAppViewController();
  objc_msgSendSuper2(&v13, "didTransitionToPresentationStyle:", a1);
  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_11218();
  sub_F04C(v3, (uint64_t)qword_186A8);
  id v4 = v1;
  uint64_t v5 = sub_111F8();
  os_log_type_t v6 = sub_11368();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412802;
    id v9 = v4;
    sub_11388();
    *uint64_t v8 = v4;

    *(_WORD *)(v7 + 12) = 2080;
    sub_F0A8(0xD000000000000012, 0x80000000000124F0, &v12);
    sub_11388();
    *(_WORD *)(v7 + 22) = 2080;
    type metadata accessor for MSMessagesAppPresentationStyle(0);
    uint64_t v10 = sub_112A8();
    sub_F0A8(v10, v11, &v12);
    sub_11388();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v5, v6, "FindMyMessagesAppViewController: %@ - %s presentationStyle: %s", (uint8_t *)v7, 0x20u);
    sub_53FC(&qword_18488);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

double FindMyMessagesAppViewController.contentSizeThatFits(_:)(double a1)
{
  if ([v1 presentationStyle] == (char *)&dword_0 + 2)
  {
    [v1 _balloonMaskEdgeInsets];
    double v4 = v3;
    double v6 = v5;
    [*(id *)&v1[OBJC_IVAR____TtC17FindMyMessagesApp31FindMyMessagesAppViewController_hostingViewController] preferredContentSize];
    return v6 + v4 + v7;
  }
  return a1;
}

id FindMyMessagesAppViewController.navigationItem.getter()
{
  id v1 = [*(id *)(v0 + OBJC_IVAR____TtC17FindMyMessagesApp31FindMyMessagesAppViewController_hostingViewController) navigationItem];

  return v1;
}

UIScrollView_optional __swiftcall FindMyMessagesAppViewController.contentScrollView(for:)(NSDirectionalRectEdge a1)
{
  id v2 = [*(id *)(v1 + OBJC_IVAR____TtC17FindMyMessagesApp31FindMyMessagesAppViewController_hostingViewController) contentScrollViewForEdge:a1];

  double v3 = (objc_class *)v2;
  result.value.super.super.super.isa = v3;
  result.is_nil = v4;
  return result;
}

Swift::Void __swiftcall FindMyMessagesAppViewController.viewDidLoad()()
{
  uint64_t v1 = sub_11218();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  Swift::Bool v4 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MyMessagesAppViewController = (objc_class *)type metadata accessor for FindMyMessagesAppViewController();
  v57.receiver = v0;
  v57.super_class = MyMessagesAppViewController;
  objc_msgSendSuper2(&v57, "viewDidLoad");
  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_F04C(v1, (uint64_t)qword_186A8);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v6, v1);
  double v7 = v0;
  uint64_t v8 = sub_111F8();
  os_log_type_t v9 = sub_11368();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v54 = v1;
    uint64_t v11 = v10;
    uint64_t v52 = (void *)swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    uint64_t v55 = (uint64_t)v7;
    uint64_t v56 = v53;
    *(_DWORD *)uint64_t v11 = 138412546;
    uint64_t v12 = v7;
    sub_11388();
    *uint64_t v52 = v7;

    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v55 = sub_F0A8(0x4C64694477656976, 0xED0000292864616FLL, &v56);
    sub_11388();
    _os_log_impl(&dword_0, v8, v9, "FindMyMessagesAppViewController: %@ - %s", (uint8_t *)v11, 0x16u);
    sub_53FC(&qword_18488);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v54);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  objc_super v13 = *(void **)&v7[OBJC_IVAR____TtC17FindMyMessagesApp31FindMyMessagesAppViewController_hostingViewController];
  id v14 = [v13 view];
  if (!v14)
  {
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v15 = v14;
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v16 = [v7 view];
  if (!v16)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v17 = v16;
  id v18 = [v13 view];
  if (!v18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  objc_super v19 = v18;
  [v17 addSubview:v18];

  sub_53FC(&qword_184B8);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_11AF0;
  id v21 = [v13 view];
  if (!v21)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v22 = v21;
  id v23 = [v21 topAnchor];

  id v24 = [v7 view];
  if (!v24)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v25 = v24;
  id v26 = [v24 topAnchor];

  id v27 = [v23 constraintEqualToAnchor:v26];
  *(void *)(v20 + 32) = v27;
  id v28 = [v13 view];
  if (!v28)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  id v29 = v28;
  id v30 = [v28 bottomAnchor];

  id v31 = [v7 view];
  if (!v31)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int v32 = v31;
  id v33 = [v31 bottomAnchor];

  id v34 = [v30 constraintEqualToAnchor:v33];
  *(void *)(v20 + 40) = v34;
  id v35 = [v13 view];
  if (!v35)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v36 = v35;
  id v37 = [v35 leadingAnchor];

  id v38 = [v7 view];
  if (!v38)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  id v39 = v38;
  id v40 = [v38 leadingAnchor];

  id v41 = [v37 constraintEqualToAnchor:v40];
  *(void *)(v20 + 48) = v41;
  id v42 = [v13 view];
  if (!v42)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  id v43 = v42;
  id v44 = [v42 trailingAnchor];

  id v45 = [v7 view];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = self;
    id v48 = [v46 trailingAnchor];

    id v49 = [v44 constraintEqualToAnchor:v48];
    *(void *)(v20 + 56) = v49;
    uint64_t v56 = v20;
    sub_112E8();
    sub_1081C(0, &qword_184C0);
    Class isa = sub_112C8().super.isa;
    swift_bridgeObjectRelease();
    [v47 activateConstraints:isa];

    [v7 addChildViewController:v13];
    [v13 didMoveToParentViewController:v7];
    v7;
    sub_11138();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    sub_11118();
    swift_release_n();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    sub_11128();
    swift_release_n();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    sub_11108();
    swift_release_n();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    sub_110B8();
    swift_release_n();
    sub_57A4();
    return;
  }
LABEL_28:
  __break(1u);
}

uint64_t sub_8F3C(uint64_t a1, uint64_t a2)
{
  v2[5] = a1;
  v2[6] = a2;
  sub_11318();
  v2[7] = sub_11308();
  uint64_t v4 = sub_112F8();
  v2[8] = v4;
  v2[9] = v3;
  return _swift_task_switch(sub_8FD4, v4, v3);
}

uint64_t sub_8FD4()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  v0[10] = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    v0[11] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_90D0;
    uint64_t v3 = v0[5];
    return sub_B164(v3);
  }
  else
  {
    swift_release();
    double v5 = (uint64_t (*)(void))v0[1];
    return v5();
  }
}

uint64_t sub_90D0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 80);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 72);
  uint64_t v4 = *(void *)(v1 + 64);
  return _swift_task_switch(sub_9210, v4, v3);
}

uint64_t sub_9210()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_9274(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  *(void *)(v7 + 88) = a1;
  *(double *)(v7 + 72) = a6;
  *(double *)(v7 + 80) = a7;
  *(double *)(v7 + 56) = a4;
  *(double *)(v7 + 64) = a5;
  *(double *)(v7 + 40) = a2;
  *(double *)(v7 + 48) = a3;
  sub_11318();
  *(void *)(v7 + 96) = sub_11308();
  uint64_t v9 = sub_112F8();
  *(void *)(v7 + 104) = v9;
  *(void *)(v7 + 112) = v8;
  return _swift_task_switch(sub_9318, v9, v8);
}

uint64_t sub_9318()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *((void *)v0 + 15) = Strong;
  if (Strong)
  {
    uint64_t v2 = (void *)swift_task_alloc();
    *((void *)v0 + 16) = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_9418;
    double v3 = v0[9];
    double v4 = v0[10];
    double v5 = v0[7];
    double v6 = v0[8];
    double v7 = v0[5];
    double v8 = v0[6];
    return sub_C794(v7, v8, v5, v6, v3, v4);
  }
  else
  {
    swift_release();
    uint64_t v10 = (uint64_t (*)(void))*((void *)v0 + 1);
    return v10();
  }
}

uint64_t sub_9418()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 120);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 112);
  uint64_t v4 = *(void *)(v1 + 104);
  return _swift_task_switch(sub_9558, v4, v3);
}

uint64_t sub_9558()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_95BC(uint64_t a1)
{
  v1[5] = a1;
  v1[6] = sub_11318();
  v1[7] = sub_11308();
  uint64_t v3 = sub_112F8();
  v1[8] = v3;
  v1[9] = v2;
  return _swift_task_switch(sub_9658, v3, v2);
}

uint64_t sub_9658()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  v0[10] = Strong;
  if (Strong)
  {
    v0[11] = sub_11308();
    uint64_t v3 = sub_112F8();
    return _swift_task_switch(sub_974C, v3, v2);
  }
  else
  {
    swift_release();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
}

uint64_t sub_974C()
{
  uint64_t v1 = (void *)v0[10];
  swift_release();
  [v1 dismissViewControllerAnimated:1 completion:0];

  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  return _swift_task_switch(sub_9210, v2, v3);
}

void sub_97CC()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    [Strong dismissViewControllerAnimated:1 completion:0];
  }
}

Swift::Void __swiftcall FindMyMessagesAppViewController.viewWillAppear(_:)(Swift::Bool a1)
{
}

Swift::Void __swiftcall FindMyMessagesAppViewController.viewDidDisappear(_:)(Swift::Bool a1)
{
}

uint64_t sub_993C(char a1, SEL *a2, uint64_t a3, unint64_t a4, uint64_t (*a5)(void))
{
  v20.receiver = v5;
  v20.super_class = (Class)type metadata accessor for FindMyMessagesAppViewController();
  objc_msgSendSuper2(&v20, *a2, a1 & 1);
  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_11218();
  sub_F04C(v11, (uint64_t)qword_186A8);
  id v12 = v5;
  objc_super v13 = sub_111F8();
  os_log_type_t v14 = sub_11368();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    id v18 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 138412546;
    id v16 = v12;
    sub_11388();
    *id v18 = v12;

    *(_WORD *)(v15 + 12) = 2080;
    sub_F0A8(a3, a4, &v19);
    sub_11388();
    _os_log_impl(&dword_0, v13, v14, "MessagesAppViewController: %@ - %s", (uint8_t *)v15, 0x16u);
    sub_53FC(&qword_18488);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return a5();
}

uint64_t sub_9BE8@<X0>(void *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v119 = a2;
  uint64_t v5 = sub_53FC(&qword_185E0);
  __chkstk_darwin(v5 - 8);
  v117 = (char *)v99 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_53FC(&qword_185E8);
  __chkstk_darwin(v7 - 8);
  v110 = (char *)v99 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_11178();
  __chkstk_darwin(v9 - 8);
  v109 = (char *)v99 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_11188();
  uint64_t v103 = *(void *)(v104 - 8);
  __chkstk_darwin(v104);
  v106 = (char *)v99 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_11198();
  uint64_t v107 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  v105 = (char *)v99 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_53FC(&qword_185F0);
  __chkstk_darwin(v13 - 8);
  v118 = (char *)v99 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_11088();
  uint64_t v122 = *(void *)(v15 - 8);
  uint64_t v123 = v15;
  __chkstk_darwin(v15);
  v124 = (char *)v99 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = sub_111A8();
  uint64_t v115 = *(void *)(v116 - 8);
  uint64_t v17 = __chkstk_darwin(v116);
  v114 = (char *)v99 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v113 = (char *)v99 - v19;
  uint64_t v128 = sub_111E8();
  uint64_t v20 = *(void *)(v128 - 8);
  uint64_t v21 = __chkstk_darwin(v128);
  v102 = (char *)v99 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v21);
  v111 = (char *)v99 - v24;
  __chkstk_darwin(v23);
  id v26 = (char *)v99 - v25;
  uint64_t v27 = sub_10FB8();
  uint64_t v120 = *(void *)(v27 - 8);
  uint64_t v121 = v27;
  __chkstk_darwin(v27);
  v127 = (char *)v99 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v29 = [a1 recipientAddresses];
  uint64_t v30 = sub_112D8();

  int64_t v31 = *(void *)(v30 + 16);
  uint64_t v126 = (uint64_t)a1;
  uint64_t v112 = a3;
  if (v31)
  {
    v132 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_FB60(0, v31, 0);
    int v32 = v132;
    uint64_t v33 = v30 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_111D8();
      v132 = v32;
      unint64_t v35 = v32[2];
      unint64_t v34 = v32[3];
      if (v35 >= v34 >> 1)
      {
        sub_FB60(v34 > 1, v35 + 1, 1);
        int v32 = v132;
      }
      v33 += 16;
      v32[2] = v35 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v20 + 32))((unint64_t)v32+ ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80))+ *(void *)(v20 + 72) * v35, v26, v128);
      --v31;
    }
    while (v31);
    swift_bridgeObjectRelease();
    a1 = (void *)v126;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  id v36 = [a1 senderAddress];
  sub_11298();

  sub_10FA8();
  if (([a1 respondsToSelector:sub_11018()] & 1) == 0)
  {
    int v39 = 1;
    goto LABEL_23;
  }
  NSString v37 = sub_11288();
  id v38 = [a1 valueForKey:v37];

  if (v38)
  {
    sub_113A8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v130 = 0u;
    long long v131 = 0u;
  }
  sub_10D98((uint64_t)&v130, (uint64_t)&v132);
  if (!v133)
  {
    sub_10D3C((uint64_t)&v132, &qword_18558);
    goto LABEL_17;
  }
  if (!swift_dynamicCast())
  {
LABEL_17:
    int v39 = 1;
    goto LABEL_18;
  }
  int v39 = v129;
LABEL_18:
  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v40 = sub_11218();
  sub_F04C(v40, (uint64_t)qword_186A8);
  id v41 = sub_111F8();
  os_log_type_t v42 = sub_11368();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = swift_slowAlloc();
    v132 = (unint64_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v43 = 136315394;
    *(void *)&long long v130 = sub_F0A8(0xD000000000000035, 0x8000000000012860, (uint64_t *)&v132);
    sub_11388();
    *(_WORD *)(v43 + 12) = 1024;
    LODWORD(v130) = v39;
    a1 = (void *)v126;
    sub_11388();
    _os_log_impl(&dword_0, v41, v42, "FindMyMessagesAppViewController: %s - isiMessage: %{BOOL}d", (uint8_t *)v43, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

LABEL_23:
  if (![a1 respondsToSelector:sub_11018()])
  {
    int v46 = v39 ^ 1;
    goto LABEL_38;
  }
  NSString v44 = sub_11288();
  id v45 = [a1 valueForKey:v44];

  if (v45)
  {
    sub_113A8();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v130 = 0u;
    long long v131 = 0u;
  }
  sub_10D98((uint64_t)&v130, (uint64_t)&v132);
  if (!v133)
  {
    sub_10D3C((uint64_t)&v132, &qword_18558);
    goto LABEL_32;
  }
  if (!swift_dynamicCast())
  {
LABEL_32:
    int v47 = 0;
    goto LABEL_33;
  }
  int v47 = v129;
LABEL_33:
  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v48 = sub_11218();
  sub_F04C(v48, (uint64_t)qword_186A8);
  id v49 = sub_111F8();
  os_log_type_t v50 = sub_11368();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = swift_slowAlloc();
    v132 = (unint64_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v51 = 136315394;
    *(void *)&long long v130 = sub_F0A8(0xD000000000000035, 0x8000000000012860, (uint64_t *)&v132);
    sub_11388();
    *(_WORD *)(v51 + 12) = 1024;
    LODWORD(v130) = v47;
    a1 = (void *)v126;
    sub_11388();
    _os_log_impl(&dword_0, v49, v50, "FindMyMessagesAppViewController: %s - isBusiness: %{BOOL}d", (uint8_t *)v51, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  int v46 = v39 ^ 1 | v47;
LABEL_38:
  int v125 = v46;
  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v52 = sub_11218();
  sub_F04C(v52, (uint64_t)qword_186A8);
  uint64_t v53 = sub_111F8();
  os_log_type_t v54 = sub_11368();
  if (os_log_type_enabled(v53, v54))
  {
    uint64_t v55 = swift_slowAlloc();
    v132 = (unint64_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v55 = 136315394;
    *(void *)&long long v130 = sub_F0A8(0xD000000000000035, 0x8000000000012860, (uint64_t *)&v132);
    sub_11388();
    *(_WORD *)(v55 + 12) = 1024;
    LODWORD(v130) = v125;
    a1 = (void *)v126;
    sub_11388();
    _os_log_impl(&dword_0, v53, v54, "FindMyMessagesAppViewController: %s - disableFindMyFeatures: %{BOOL}d", (uint8_t *)v55, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v56 = v122;
  uint64_t v57 = v123;
  os_log_type_t v58 = v124;
  uint64_t v59 = (uint64_t)v118;
  if (v119 < 2)
  {
    uint64_t v60 = (unsigned int *)&enum case for CompositeAppViewState.app(_:);
LABEL_57:
    uint64_t v70 = v117;
    uint64_t v71 = v116;
    uint64_t v72 = v115;
    v73 = v114;
    v74 = v113;
    goto LABEL_58;
  }
  if (v119 != 2)
  {
    uint64_t v65 = sub_111F8();
    os_log_type_t v66 = sub_11358();
    if (!os_log_type_enabled(v65, v66)) {
      goto LABEL_55;
    }
    uint64_t v68 = (uint8_t *)swift_slowAlloc();
    v132 = (unint64_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v68 = 136315138;
    *(void *)&long long v130 = sub_F0A8(0xD000000000000035, 0x8000000000012860, (uint64_t *)&v132);
    sub_11388();
    unint64_t v69 = "FindMyMessagesAppViewController: %s - Unknown presentation style";
    goto LABEL_54;
  }
  id v61 = [a1 selectedMessage];
  if (!v61)
  {
    uint64_t v65 = sub_111F8();
    os_log_type_t v66 = sub_11358();
    if (os_log_type_enabled(v65, v66))
    {
      uint64_t v68 = (uint8_t *)swift_slowAlloc();
      v132 = (unint64_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v68 = 136315138;
      *(void *)&long long v130 = sub_F0A8(0xD000000000000035, 0x8000000000012860, (uint64_t *)&v132);
      sub_11388();
      unint64_t v69 = "FindMyMessagesAppViewController: %s - No selected message while in transcript";
LABEL_54:
      _os_log_impl(&dword_0, v65, v66, v69, v68, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
LABEL_55:

LABEL_56:
    uint64_t v60 = (unsigned int *)&enum case for CompositeAppViewState.loading(_:);
    goto LABEL_57;
  }
  id v62 = v61;
  sub_11058();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v56 + 48))(v59, 1, v57) == 1)
  {
    sub_10D3C(v59, &qword_185F0);
    uint64_t v65 = sub_111F8();
    os_log_type_t v63 = sub_11358();
    if (!os_log_type_enabled(v65, v63))
    {

      goto LABEL_56;
    }
    os_log_t v64 = (uint8_t *)swift_slowAlloc();
    v132 = (unint64_t *)swift_slowAlloc();
    *(_DWORD *)os_log_t v64 = 136315138;
    *(void *)&long long v130 = sub_F0A8(0xD000000000000035, 0x8000000000012860, (uint64_t *)&v132);
    sub_11388();
    _os_log_impl(&dword_0, v65, v63, "FindMyMessagesAppViewController: %s - No message payload while in transcript", v64, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    goto LABEL_55;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v56 + 32))(v58, v59, v57);
  id v79 = [v62 senderAddress];
  if (!v79)
  {
    v92 = sub_111F8();
    os_log_type_t v93 = sub_11358();
    if (os_log_type_enabled(v92, v93))
    {
      id v100 = v62;
      v94 = (uint8_t *)swift_slowAlloc();
      v132 = (unint64_t *)swift_slowAlloc();
      *(_DWORD *)v94 = 136315138;
      *(void *)&long long v130 = sub_F0A8(0xD000000000000035, 0x8000000000012860, (uint64_t *)&v132);
      sub_11388();
      _os_log_impl(&dword_0, v92, v93, "MessagesAppViewController: %s - No sender address", v94, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v56 + 8))(v124, v57);
    goto LABEL_56;
  }
  v80 = v79;
  sub_11298();

  id v81 = [a1 recipientAddresses];
  uint64_t v82 = sub_112D8();

  id v83 = [a1 conversationIdentifier];
  uint64_t v126 = sub_11298();
  unint64_t v119 = v84;

  v118 = (char *)sub_11048();
  uint64_t v101 = v85;
  sub_111D8();
  int64_t v86 = *(void *)(v82 + 16);
  if (v86)
  {
    id v100 = v62;
    v132 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_FB60(0, v86, 0);
    v87 = v132;
    v99[1] = v82;
    uint64_t v88 = v82 + 40;
    v89 = v102;
    do
    {
      swift_bridgeObjectRetain();
      sub_111D8();
      v132 = v87;
      unint64_t v91 = v87[2];
      unint64_t v90 = v87[3];
      if (v91 >= v90 >> 1)
      {
        sub_FB60(v90 > 1, v91 + 1, 1);
        v87 = v132;
      }
      v88 += 16;
      v87[2] = v91 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v20 + 32))((unint64_t)v87+ ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80))+ *(void *)(v20 + 72) * v91, v89, v128);
      --v86;
    }
    while (v86);
    swift_bridgeObjectRelease();
    id v62 = v100;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  unsigned int v95 = [v62 isFromMe];
  v96 = (unsigned int *)&enum case for CompositeAppViewState.TranscriptInfo.Direction.outgoing(_:);
  if (!v95) {
    v96 = (unsigned int *)&enum case for CompositeAppViewState.TranscriptInfo.Direction.incoming(_:);
  }
  (*(void (**)(char *, void, uint64_t))(v103 + 104))(v106, *v96, v104);
  [v62 isPending];
  v97 = v124;
  sub_11068();
  sub_11078();
  sub_11038();
  sub_FDC0();
  v98 = v105;
  sub_11168();

  (*(void (**)(char *, uint64_t))(v122 + 8))(v97, v123);
  v74 = v113;
  (*(void (**)(char *, char *, uint64_t))(v107 + 32))(v113, v98, v108);
  uint64_t v60 = (unsigned int *)&enum case for CompositeAppViewState.transcript(_:);
  uint64_t v70 = v117;
  uint64_t v71 = v116;
  uint64_t v72 = v115;
  v73 = v114;
LABEL_58:
  (*(void (**)(char *, void, uint64_t))(v72 + 104))(v74, *v60, v71);
  uint64_t v76 = v120;
  uint64_t v75 = v121;
  v77 = v127;
  (*(void (**)(char *, char *, uint64_t))(v120 + 16))(v70, v127, v121);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v76 + 56))(v70, 0, 1, v75);
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v73, v74, v71);
  sub_111B8();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v74, v71);
  return (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v77, v75);
}

uint64_t sub_B164(uint64_t a1)
{
  v2[32] = a1;
  v2[33] = v1;
  uint64_t v3 = sub_11008();
  v2[34] = v3;
  v2[35] = *(void *)(v3 - 8);
  v2[36] = swift_task_alloc();
  uint64_t v4 = sub_11178();
  v2[37] = v4;
  v2[38] = *(void *)(v4 - 8);
  v2[39] = swift_task_alloc();
  uint64_t v5 = sub_11088();
  v2[40] = v5;
  v2[41] = *(void *)(v5 - 8);
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  sub_11318();
  v2[44] = sub_11308();
  uint64_t v7 = sub_112F8();
  v2[45] = v7;
  v2[46] = v6;
  return _swift_task_switch(sub_B320, v7, v6);
}

uint64_t sub_B320()
{
  uint64_t v34 = v0;
  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 344);
  uint64_t v2 = *(void *)(v0 + 320);
  uint64_t v3 = *(void *)(v0 + 328);
  uint64_t v4 = *(void *)(v0 + 256);
  uint64_t v5 = sub_11218();
  *(void *)(v0 + 376) = sub_F04C(v5, (uint64_t)qword_186A8);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v6(v1, v4, v2);
  uint64_t v7 = sub_111F8();
  os_log_type_t v8 = sub_11368();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = *(void *)(v0 + 344);
  if (v9)
  {
    uint64_t v11 = *(void *)(v0 + 336);
    uint64_t v31 = *(void *)(v0 + 328);
    uint64_t v12 = *(void *)(v0 + 320);
    uint64_t v13 = swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v0 + 240) = sub_F0A8(0xD000000000000020, 0x8000000000012770, &v33);
    sub_11388();
    *(_WORD *)(v13 + 12) = 2080;
    v6(v11, v10, v12);
    uint64_t v14 = sub_112A8();
    *(void *)(v0 + 248) = sub_F0A8(v14, v15, &v33);
    sub_11388();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v10, v12);
    _os_log_impl(&dword_0, v7, v8, "FindMyMessagesAppViewController: %s payload: %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 328) + 8))(*(void *)(v0 + 344), *(void *)(v0 + 320));
  }

  id v16 = [*(id *)(v0 + 264) activeConversation];
  *(void *)(v0 + 384) = v16;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v19 = *(void *)(v0 + 304);
    uint64_t v18 = *(void *)(v0 + 312);
    uint64_t v20 = *(void *)(v0 + 296);
    sub_11068();
    int v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 88))(v18, v20);
    uint64_t v22 = *(void *)(v0 + 304);
    uint64_t v23 = *(void **)(v0 + 312);
    uint64_t v24 = *(void *)(v0 + 296);
    if (v21 == enum case for CompositeAppViewState.TranscriptInfo.Kind.share(_:))
    {
      (*(void (**)(void, uint64_t))(v22 + 96))(*(void *)(v0 + 312), v24);
      if (*v23 == 3)
      {
        int v32 = (uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of MessagesAppViewModel.createMapsURLForThisDeviceCurrentLocation()
                                              + async function pointer to dispatch thunk of MessagesAppViewModel.createMapsURLForThisDeviceCurrentLocation());
        uint64_t v25 = (void *)swift_task_alloc();
        *(void *)(v0 + 392) = v25;
        void *v25 = v0;
        v25[1] = sub_B808;
        uint64_t v26 = *(void *)(v0 + 288);
        return v32(v26);
      }
    }
    else
    {
      (*(void (**)(void, uint64_t))(v22 + 8))(*(void *)(v0 + 312), v24);
    }
    Class isa = sub_11028().super.isa;
    *(void *)(v0 + 432) = isa;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 24) = sub_BD9C;
    uint64_t v30 = swift_continuation_init();
    *(void *)(v0 + 144) = _NSConcreteStackBlock;
    *(void *)(v0 + 152) = 0x40000000;
    *(void *)(v0 + 160) = sub_C6FC;
    *(void *)(v0 + 168) = &unk_148D8;
    *(void *)(v0 + 176) = v30;
    [v17 insertMessage:isa completionHandler:v0 + 144];
    return _swift_continuation_await(v0 + 16);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
    return v28();
  }
}

uint64_t sub_B808()
{
  uint64_t v2 = (void *)*v1;
  v2[50] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[45];
    uint64_t v4 = v2[46];
    return _swift_task_switch(sub_BF80, v3, v4);
  }
  else
  {
    uint64_t v5 = (void *)swift_task_alloc();
    v2[51] = v5;
    *uint64_t v5 = v2;
    v5[1] = sub_B974;
    uint64_t v6 = v2[36];
    return sub_100C0(v6);
  }
}

uint64_t sub_B974(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 416) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 368);
  uint64_t v4 = *(void *)(v2 + 360);
  return _swift_task_switch(sub_BA9C, v4, v3);
}

uint64_t sub_BA9C()
{
  uint64_t v1 = v0[52];
  uint64_t v2 = (void *)v0[48];
  v0[10] = v0;
  v0[11] = sub_BB98;
  uint64_t v3 = swift_continuation_init();
  v0[23] = _NSConcreteStackBlock;
  v0[24] = 0x40000000;
  v0[25] = sub_C6FC;
  v0[26] = &unk_148F0;
  v0[27] = v3;
  [v2 insertRichLink:v1 completionHandler:v0 + 23];
  return _swift_continuation_await(v0 + 10);
}

uint64_t sub_BB98()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 112);
  *(void *)(*v0 + 424) = v2;
  uint64_t v3 = *(void *)(v1 + 368);
  uint64_t v4 = *(void *)(v1 + 360);
  if (v2) {
    uint64_t v5 = sub_C1EC;
  }
  else {
    uint64_t v5 = sub_BCC8;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_BCC8()
{
  uint64_t v2 = *(void *)(v0 + 280);
  uint64_t v1 = *(void *)(v0 + 288);
  uint64_t v3 = *(void *)(v0 + 272);

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = *(void **)(v0 + 384);
  [*(id *)(v0 + 264) dismiss];

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_BD9C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 440) = v2;
  uint64_t v3 = *(void *)(v1 + 368);
  uint64_t v4 = *(void *)(v1 + 360);
  if (v2) {
    uint64_t v5 = sub_C484;
  }
  else {
    uint64_t v5 = sub_BECC;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_BECC()
{
  swift_release();
  uint64_t v1 = *(void **)(v0 + 384);
  [*(id *)(v0 + 264) dismiss];

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_BF80()
{
  uint64_t v10 = v0;
  swift_release();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_111F8();
  os_log_type_t v2 = sub_11358();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    *(void *)(v0 + 224) = sub_F0A8(0xD000000000000020, 0x8000000000012770, &v9);
    sub_11388();
    *(_WORD *)(v3 + 12) = 2112;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 232) = v5;
    sub_11388();
    void *v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v1, v2, "FindMyMessagesAppViewController: %s failed to insert message with error: %@", (uint8_t *)v3, 0x16u);
    sub_53FC(&qword_18488);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v6 = *(void **)(v0 + 384);
  [*(id *)(v0 + 264) dismiss];

  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_C1EC()
{
  uint64_t v14 = v0;
  uint64_t v1 = *(void **)(v0 + 416);
  uint64_t v3 = *(void *)(v0 + 280);
  uint64_t v2 = *(void *)(v0 + 288);
  uint64_t v4 = *(void *)(v0 + 272);
  swift_release();
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = sub_111F8();
  os_log_type_t v6 = sub_11358();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    *(void *)(v0 + 224) = sub_F0A8(0xD000000000000020, 0x8000000000012770, &v13);
    sub_11388();
    *(_WORD *)(v7 + 12) = 2112;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 232) = v9;
    sub_11388();
    *uint64_t v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v5, v6, "FindMyMessagesAppViewController: %s failed to insert message with error: %@", (uint8_t *)v7, 0x16u);
    sub_53FC(&qword_18488);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v10 = *(void **)(v0 + 384);
  [*(id *)(v0 + 264) dismiss];

  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_C484()
{
  uint64_t v11 = v0;
  uint64_t v1 = *(void **)(v0 + 432);
  swift_release();
  swift_willThrow();

  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_111F8();
  os_log_type_t v3 = sub_11358();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    *(void *)(v0 + 224) = sub_F0A8(0xD000000000000020, 0x8000000000012770, &v10);
    sub_11388();
    *(_WORD *)(v4 + 12) = 2112;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 232) = v6;
    sub_11388();
    *uint64_t v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v2, v3, "FindMyMessagesAppViewController: %s failed to insert message with error: %@", (uint8_t *)v4, 0x16u);
    sub_53FC(&qword_18488);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v7 = *(void **)(v0 + 384);
  [*(id *)(v0 + 264) dismiss];

  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_C6FC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    sub_53FC(&qword_18550);
    uint64_t v4 = swift_allocError();
    *uint64_t v5 = a2;
    id v6 = a2;
    return _swift_continuation_throwingResumeWithError(v2, v4);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    return _swift_continuation_throwingResume(v7);
  }
}

uint64_t sub_C794(double a1, double a2, double a3, double a4, double a5, double a6)
{
  *(void *)(v7 + 216) = v6;
  *(double *)(v7 + 200) = a5;
  *(double *)(v7 + 208) = a6;
  *(double *)(v7 + 184) = a3;
  *(double *)(v7 + 192) = a4;
  *(double *)(v7 + 168) = a1;
  *(double *)(v7 + 176) = a2;
  uint64_t v8 = sub_11008();
  *(void *)(v7 + 224) = v8;
  *(void *)(v7 + 232) = *(void *)(v8 - 8);
  *(void *)(v7 + 240) = swift_task_alloc();
  sub_11318();
  *(void *)(v7 + 248) = sub_11308();
  uint64_t v10 = sub_112F8();
  *(void *)(v7 + 256) = v10;
  *(void *)(v7 + 264) = v9;
  return _swift_task_switch(sub_C894, v10, v9);
}

uint64_t sub_C894()
{
  uint64_t v15 = v0;
  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_11218();
  *(void *)(v0 + 272) = sub_F04C(v1, (uint64_t)qword_186A8);
  uint64_t v2 = sub_111F8();
  os_log_type_t v3 = sub_11368();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(v0 + 168);
    uint64_t v5 = *(void *)(v0 + 176);
    uint64_t v6 = swift_slowAlloc();
    v14[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315395;
    *(void *)(v0 + 144) = sub_F0A8(0xD000000000000028, 0x80000000000126D0, v14);
    sub_11388();
    *(_WORD *)(v6 + 12) = 2081;
    *(void *)(v0 + 120) = v4;
    *(void *)(v0 + 128) = v5;
    type metadata accessor for CLLocationCoordinate2D(0);
    uint64_t v7 = sub_112A8();
    *(void *)(v0 + 160) = sub_F0A8(v7, v8, v14);
    sub_11388();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v2, v3, "FindMyMessagesAppViewController: %s payload: %{private}s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v9 = [*(id *)(v0 + 216) activeConversation];
  *(void *)(v0 + 280) = v9;
  if (v9)
  {
    sub_110C8();
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 288) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_CD64;
    uint64_t v11 = *(void *)(v0 + 240);
    return sub_100C0(v11);
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
}

uint64_t sub_CD64(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 296) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 264);
  uint64_t v4 = *(void *)(v2 + 256);
  return _swift_task_switch(sub_CE8C, v4, v3);
}

uint64_t sub_CE8C()
{
  uint64_t v1 = v0[37];
  uint64_t v2 = (void *)v0[35];
  v0[2] = v0;
  v0[3] = sub_CF88;
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_C6FC;
  v0[13] = &unk_148A8;
  v0[14] = v3;
  [v2 insertRichLink:v1 completionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_CF88()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 304) = v2;
  uint64_t v3 = *(void *)(v1 + 264);
  uint64_t v4 = *(void *)(v1 + 256);
  if (v2) {
    uint64_t v5 = sub_D170;
  }
  else {
    uint64_t v5 = sub_D0B8;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_D0B8()
{
  uint64_t v1 = (void *)v0[37];
  uint64_t v2 = (void *)v0[35];
  uint64_t v3 = v0[30];
  uint64_t v4 = v0[28];
  uint64_t v5 = v0[29];
  uint64_t v6 = (void *)v0[27];
  swift_release();
  [v6 dismiss];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_D170()
{
  uint64_t v14 = v0;
  uint64_t v1 = *(void **)(v0 + 296);
  uint64_t v2 = *(void *)(v0 + 240);
  uint64_t v3 = *(void *)(v0 + 224);
  uint64_t v4 = *(void *)(v0 + 232);
  swift_release();
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = sub_111F8();
  os_log_type_t v6 = sub_11358();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    unint64_t v8 = (void *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315394;
    *(void *)(v0 + 136) = sub_F0A8(0xD000000000000028, 0x80000000000126D0, &v13);
    sub_11388();
    *(_WORD *)(v7 + 12) = 2112;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 152) = v9;
    sub_11388();
    *unint64_t v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v5, v6, "FindMyMessagesAppViewController: %s failed to insert message with error: %@", (uint8_t *)v7, 0x16u);
    sub_53FC(&qword_18488);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  uint64_t v10 = *(void **)(v0 + 280);
  [*(id *)(v0 + 216) dismiss];

  swift_errorRelease();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_D3E4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_53FC(&qword_18550);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_throwingResume(a1);
  }
}

uint64_t FindMyMessagesAppViewController._validateMessage(forSending:conversation:associatedText:)(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  sub_11318();
  v2[4] = sub_11308();
  uint64_t v4 = sub_112F8();
  v2[5] = v4;
  v2[6] = v3;
  return _swift_task_switch(sub_D53C, v4, v3);
}

uint64_t sub_D53C()
{
  uint64_t v4 = (uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of MessagesAppViewModel.validateAndInitiate(message:)
                                       + async function pointer to dispatch thunk of MessagesAppViewModel.validateAndInitiate(message:));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_D5F4;
  uint64_t v2 = *(void *)(v0 + 16);
  return v4(v2);
}

uint64_t sub_D5F4(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *v3;
  uint64_t v5 = *v3;
  *(unsigned char *)(v5 + 80) = a1;
  *(void *)(v5 + 64) = a2;
  *(void *)(v5 + 72) = a3;
  swift_task_dealloc();
  uint64_t v6 = *(void *)(v4 + 48);
  uint64_t v7 = *(void *)(v4 + 40);
  return _swift_task_switch(sub_D720, v7, v6);
}

uint64_t sub_D720()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = *(unsigned __int8 *)(v0 + 80);
  return v1(v4, v2, v3);
}

uint64_t sub_D920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[9] = a4;
  v5[10] = a5;
  v5[7] = a2;
  v5[8] = a3;
  v5[6] = a1;
  v5[11] = sub_11318();
  v5[12] = sub_11308();
  uint64_t v7 = sub_112F8();
  return _swift_task_switch(sub_D9C4, v7, v6);
}

uint64_t sub_D9C4()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(const void **)(v0 + 72);
  swift_release();
  *(void *)(v0 + 104) = _Block_copy(v2);
  if (v1) {
    sub_11298();
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)(v0 + 112) = v3;
  uint64_t v4 = *(void **)(v0 + 80);
  uint64_t v5 = *(void **)(v0 + 56);
  id v6 = *(id *)(v0 + 48);
  id v7 = v5;
  id v8 = v4;
  *(void *)(v0 + 120) = sub_11308();
  uint64_t v10 = sub_112F8();
  *(void *)(v0 + 128) = v10;
  *(void *)(v0 + 136) = v9;
  return _swift_task_switch(sub_DA98, v10, v9);
}

uint64_t sub_DA98()
{
  uint64_t v4 = (uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of MessagesAppViewModel.validateAndInitiate(message:)
                                       + async function pointer to dispatch thunk of MessagesAppViewModel.validateAndInitiate(message:));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 144) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_DB50;
  uint64_t v2 = *(void *)(v0 + 48);
  return v4(v2);
}

uint64_t sub_DB50(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *v3;
  uint64_t v5 = *v3;
  *(void *)(v5 + 32) = a2;
  *(void *)(v5 + 40) = a3;
  *(unsigned char *)(v5 + 24) = a1;
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 152) = a3;
  swift_task_dealloc();
  uint64_t v6 = *(void *)(v4 + 136);
  uint64_t v7 = *(void *)(v4 + 128);
  return _swift_task_switch(sub_DC7C, v7, v6);
}

uint64_t sub_DC7C()
{
  NSString v1 = *(NSString *)(v0 + 152);
  uint64_t v2 = *(void **)(v0 + 80);
  uint64_t v4 = *(void **)(v0 + 48);
  uint64_t v3 = *(void **)(v0 + 56);
  swift_release();
  swift_bridgeObjectRelease();

  if (v1)
  {
    swift_bridgeObjectRetain();
    NSString v1 = sub_11288();
    swift_bridgeObjectRelease();
  }
  uint64_t v5 = *(void (***)(void, void, void))(v0 + 104);
  ((void (**)(void, void, NSString))v5)[2](v5, *(unsigned __int8 *)(v0 + 24), v1);

  _Block_release(v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

id FindMyMessagesAppViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = sub_11288();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

id FindMyMessagesAppViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  v24[1] = a1;
  uint64_t v6 = sub_11278();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_110A8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v24 - v12;
  sub_11158();
  swift_allocObject();
  uint64_t v14 = v3;
  uint64_t v15 = sub_11148();
  swift_retain();
  sub_11098();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  id v16 = objc_allocWithZone((Class)sub_53FC(&qword_18480));
  uint64_t v17 = sub_11258();
  sub_11268();
  sub_11238();
  sub_11228();
  uint64_t v18 = OBJC_IVAR____TtC17FindMyMessagesApp31FindMyMessagesAppViewController_viewModel;
  uint64_t v19 = OBJC_IVAR____TtC17FindMyMessagesApp31FindMyMessagesAppViewController_hostingViewController;
  sub_11248();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  *(void *)&v14[v18] = v15;
  *(void *)&v14[v19] = v17;

  if (a2)
  {
    NSString v20 = sub_11288();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v20 = 0;
  }
  MyMessagesAppViewController = (objc_class *)type metadata accessor for FindMyMessagesAppViewController();
  v25.receiver = v14;
  v25.super_class = MyMessagesAppViewController;
  id v22 = objc_msgSendSuper2(&v25, "initWithNibName:bundle:", v20, a3);

  return v22;
}

id FindMyMessagesAppViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id FindMyMessagesAppViewController.init(coder:)(void *a1)
{
  uint64_t v3 = sub_11278();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = sub_110A8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v20 - v9;
  sub_11158();
  swift_allocObject();
  uint64_t v11 = v1;
  uint64_t v12 = sub_11148();
  swift_retain();
  sub_11098();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  id v13 = objc_allocWithZone((Class)sub_53FC(&qword_18480));
  uint64_t v14 = sub_11258();
  sub_11268();
  sub_11238();
  sub_11228();
  uint64_t v15 = OBJC_IVAR____TtC17FindMyMessagesApp31FindMyMessagesAppViewController_viewModel;
  uint64_t v16 = OBJC_IVAR____TtC17FindMyMessagesApp31FindMyMessagesAppViewController_hostingViewController;
  sub_11248();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  *(void *)&v11[v15] = v12;
  *(void *)&v11[v16] = v14;

  MyMessagesAppViewController = (objc_class *)type metadata accessor for FindMyMessagesAppViewController();
  v20.receiver = v11;
  v20.super_class = MyMessagesAppViewController;
  id v18 = objc_msgSendSuper2(&v20, "initWithCoder:", a1);

  return v18;
}

id FindMyMessagesAppViewController.__allocating_init(shouldBeSheetPresentationControllerDelegate:)(char a1)
{
  id v3 = objc_allocWithZone(v1);

  return [v3 initWithShouldBeSheetPresentationControllerDelegate:a1 & 1];
}

id FindMyMessagesAppViewController.init(shouldBeSheetPresentationControllerDelegate:)(char a1)
{
  uint64_t v3 = sub_11278();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = sub_110A8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v19 - v9;
  sub_11158();
  swift_allocObject();
  uint64_t v11 = v1;
  uint64_t v12 = sub_11148();
  swift_retain();
  sub_11098();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  id v13 = objc_allocWithZone((Class)sub_53FC(&qword_18480));
  uint64_t v14 = sub_11258();
  sub_11268();
  sub_11238();
  sub_11228();
  uint64_t v15 = OBJC_IVAR____TtC17FindMyMessagesApp31FindMyMessagesAppViewController_viewModel;
  uint64_t v16 = OBJC_IVAR____TtC17FindMyMessagesApp31FindMyMessagesAppViewController_hostingViewController;
  sub_11248();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  *(void *)&v11[v15] = v12;
  *(void *)&v11[v16] = v14;

  MyMessagesAppViewController = (objc_class *)type metadata accessor for FindMyMessagesAppViewController();
  v19.receiver = v11;
  v19.super_class = MyMessagesAppViewController;
  return objc_msgSendSuper2(&v19, "initWithShouldBeSheetPresentationControllerDelegate:", a1 & 1);
}

void *sub_E570@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_E580(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_E58C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_E668;
  return v6(a1);
}

uint64_t sub_E668()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  NSString v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_E760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_113D8();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return _swift_task_switch(sub_E864, 0, 0);
}

uint64_t sub_E864()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_113F8();
  uint64_t v5 = sub_10CF4(&qword_185D0, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
  sub_11458();
  sub_10CF4(&qword_185D8, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
  sub_11408();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_EA04;
  uint64_t v8 = v0[11];
  return dispatch thunk of Clock.sleep(until:tolerance:)(v8, v0 + 2, v4, v5);
}

uint64_t sub_EA04()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return _swift_task_switch(sub_EBC0, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_EBC0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_EC2C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_10F64;
  return v6();
}

uint64_t sub_ECF8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10F64;
  return v7();
}

uint64_t sub_EDC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_11338();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_11328();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10D3C(a1, &qword_18498);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_112F8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_EF70(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10F70;
  return v6(a1);
}

uint64_t sub_F04C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t type metadata accessor for FindMyMessagesAppViewController()
{
  return self;
}

uint64_t sub_F0A8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_F5DC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10E54((uint64_t)v12, *a3);
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
      sub_10E54((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10E04((uint64_t)v12);
  return v7;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t sub_F190()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_F1D0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_F284;
  return sub_6FD8(a1, v4, v5, v6);
}

uint64_t sub_F284()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void type metadata accessor for MSMessagesAppPresentationStyle(uint64_t a1)
{
}

uint64_t sub_F38C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_F3C4(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_F284;
  return sub_8F3C(a1, v1);
}

uint64_t sub_F45C(double a1, double a2, double a3, double a4, double a5, double a6)
{
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v14;
  *uint64_t v14 = v7;
  v14[1] = sub_10F64;
  return sub_9274(v6, a1, a2, a3, a4, a5, a6);
}

uint64_t sub_F534()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10F64;
  return sub_95BC(v0);
}

void sub_F5C4()
{
}

__n128 sub_F5CC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_F5DC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_11398();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_F798(a5, a6);
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
  uint64_t v8 = sub_113C8();
  if (!v8)
  {
    sub_11418();
    __break(1u);
LABEL_17:
    uint64_t result = sub_11428();
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

uint64_t sub_F798(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_F830(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_FA10(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_FA10(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_F830(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_F9A8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_113B8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_11418();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_112B8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_11428();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_11418();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_F9A8(uint64_t a1, uint64_t a2)
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
  sub_53FC(&qword_18600);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_FA10(char a1, int64_t a2, char a3, char *a4)
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
    sub_53FC(&qword_18600);
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
  uint64_t result = sub_11428();
  __break(1u);
  return result;
}

uint64_t sub_FB60(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_FB80(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_FB80(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    id v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_53FC(&qword_185F8);
  uint64_t v10 = *(void *)(sub_111E8() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  id v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_111E8() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  id v18 = (char *)v13 + v17;
  objc_super v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  int v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_11428();
  __break(1u);
  return result;
}

uint64_t sub_FDC0()
{
  id v0 = [self mainBundle];
  id v1 = [v0 bundleIdentifier];

  if (v1)
  {
    uint64_t v2 = sub_11298();
    uint64_t v4 = v3;

    if (v2 == 0xD000000000000013 && v4 == 0x80000000000128C0)
    {
      char v5 = 1;
    }
    else
    {
      char v5 = sub_11448();
      if (v2 == 0x6C7070612E6D6F63 && v4 == 0xEF74616843692E65)
      {
        char v13 = 1;
        goto LABEL_18;
      }
    }
    char v13 = sub_11448();
    if (v2 == 0xD000000000000012 && v4 == 0x80000000000128E0)
    {
      swift_bridgeObjectRelease();
      char v14 = 1;
LABEL_19:
      char v11 = v5 | v13 | v14;
      return v11 & 1;
    }
LABEL_18:
    char v14 = sub_11448();
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_11218();
  sub_F04C(v6, (uint64_t)qword_186A8);
  int64_t v7 = sub_111F8();
  os_log_type_t v8 = sub_11358();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v16 = v10;
    sub_F0A8(0xD00000000000001FLL, 0x80000000000128A0, &v16);
    sub_11388();
    _os_log_impl(&dword_0, v7, v8, "FindMyMessagesAppViewController: %s - No Bundle Identifier", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  char v11 = 0;
  return v11 & 1;
}

uint64_t sub_100C0(uint64_t a1)
{
  v1[16] = a1;
  sub_11318();
  v1[17] = sub_11308();
  uint64_t v3 = sub_112F8();
  v1[18] = v3;
  v1[19] = v2;
  return _swift_task_switch(sub_10158, v3, v2);
}

uint64_t sub_10158()
{
  id v1 = [objc_allocWithZone((Class)LPMetadataProvider) init];
  v0[20] = v1;
  sub_10FF8(v2);
  uint64_t v4 = v3;
  v0[21] = v3;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_10290;
  uint64_t v5 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_D3E4;
  v0[13] = &unk_148C0;
  v0[14] = v5;
  [v1 startFetchingMetadataForURL:v4 completionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10290()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 176) = v2;
  uint64_t v3 = *(void *)(v1 + 152);
  uint64_t v4 = *(void *)(v1 + 144);
  if (v2) {
    uint64_t v5 = sub_10490;
  }
  else {
    uint64_t v5 = sub_103C0;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_103C0()
{
  uint64_t v1 = (void *)v0[21];
  swift_release();
  uint64_t v2 = (void *)v0[15];

  uint64_t v3 = (void *)v0[20];
  id v4 = objc_allocWithZone((Class)MSRichLink);
  sub_10FF8(v5);
  uint64_t v7 = v6;
  id v8 = [v4 initWithURL:v6];

  objc_msgSend(v8, "set_linkMetadata:", v2);
  uint64_t v9 = (uint64_t (*)(id))v0[1];
  return v9(v8);
}

uint64_t sub_10490()
{
  int v21 = v0;
  uint64_t v1 = (void *)v0[21];
  swift_release();
  swift_willThrow();

  if (qword_18478 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_11218();
  sub_F04C(v2, (uint64_t)qword_186A8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = sub_111F8();
  os_log_type_t v4 = sub_11358();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315394;
    v0[10] = sub_F0A8(0xD000000000000014, 0x8000000000012750, &v20);
    sub_11388();
    *(_WORD *)(v5 + 12) = 2112;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    v0[10] = v7;
    sub_11388();
    void *v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v3, v4, "FindMyMessagesAppViewController: %s failed to insert metadata with error: %@", (uint8_t *)v5, 0x16u);
    sub_53FC(&qword_18488);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  id v8 = [objc_allocWithZone((Class)LPLinkMetadata) init];
  sub_10FF8(v9);
  uint64_t v11 = v10;
  [v8 setOriginalURL:v10];

  swift_errorRelease();
  unint64_t v12 = (void *)v0[20];
  id v13 = objc_allocWithZone((Class)MSRichLink);
  sub_10FF8(v14);
  uint64_t v16 = v15;
  id v17 = [v13 initWithURL:v15];

  objc_msgSend(v17, "set_linkMetadata:", v8);
  id v18 = (uint64_t (*)(id))v0[1];
  return v18(v17);
}

void type metadata accessor for CLLocationCoordinate2D(uint64_t a1)
{
}

void sub_107D4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1081C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10858()
{
  _Block_release(*(const void **)(v0 + 40));

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_108B0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_10F64;
  id v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_18578 + dword_18578);
  return v8(v2, v3, v4, v5, v6);
}

uint64_t sub_1097C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10F64;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_18588 + dword_18588);
  return v6(v2, v3, v4);
}

uint64_t sub_10A40()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10A80(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10F64;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_18598 + dword_18598);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10B4C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10B84(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10F64;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_185A8 + dword_185A8);
  return v6(a1, v4);
}

uint64_t sub_10C3C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10F64;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_185B8 + dword_185B8);
  return v6(a1, v4);
}

uint64_t sub_10CF4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10D3C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_53FC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10D98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_53FC(&qword_18558);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10E04(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10E54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_10EB0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10F14(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10F34(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

uint64_t sub_10F74()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_10FA8()
{
  return Person.Handle.init(rawValue:)();
}

uint64_t sub_10FB8()
{
  return type metadata accessor for Person.Handle();
}

uint64_t sub_10FC8()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10FD8()
{
  return Notification.object.getter();
}

uint64_t sub_10FE8()
{
  return type metadata accessor for Notification();
}

void sub_10FF8(NSURL *retstr@<X8>)
{
}

uint64_t sub_11008()
{
  return type metadata accessor for URL();
}

uint64_t sub_11018()
{
  return Selector.init(_:)();
}

MSMessage sub_11028()
{
  return MessagePayload.createMSMessage()();
}

uint64_t sub_11038()
{
  return MessagePayload.initialLocation.getter();
}

uint64_t sub_11048()
{
  return MessagePayload.id.getter();
}

uint64_t sub_11058()
{
  return MessagePayload.init(from:)();
}

uint64_t sub_11068()
{
  return MessagePayload.kind.getter();
}

uint64_t sub_11078()
{
  return MessagePayload.timestamp.getter();
}

uint64_t sub_11088()
{
  return type metadata accessor for MessagePayload();
}

uint64_t sub_11098()
{
  return MessagesAppView.init(viewModel:)();
}

uint64_t sub_110A8()
{
  return type metadata accessor for MessagesAppView();
}

uint64_t sub_110B8()
{
  return dispatch thunk of MessagesAppViewModel.setDismiss(_:)();
}

uint64_t sub_110C8()
{
  return dispatch thunk of MessagesAppViewModel.createMapsURL(for:region:)();
}

uint64_t sub_110D8()
{
  return dispatch thunk of MessagesAppViewModel.willTransition(to:)();
}

uint64_t sub_110E8()
{
  return dispatch thunk of MessagesAppViewModel.stopSubscriptions()();
}

uint64_t sub_110F8()
{
  return dispatch thunk of MessagesAppViewModel.startSubscriptions(with:)();
}

uint64_t sub_11108()
{
  return dispatch thunk of MessagesAppViewModel.setDidSelectStopSharingHandler(_:)();
}

uint64_t sub_11118()
{
  return dispatch thunk of MessagesAppViewModel.setDidSelectSendLocationMessageHandler(_:)();
}

uint64_t sub_11128()
{
  return dispatch thunk of MessagesAppViewModel.setDidSelectSendStaticLocationMessageHandler(_:)();
}

uint64_t sub_11138()
{
  return dispatch thunk of MessagesAppViewModel.presenter.setter();
}

uint64_t sub_11148()
{
  return MessagesAppViewModel.init()();
}

uint64_t sub_11158()
{
  return type metadata accessor for MessagesAppViewModel();
}

uint64_t sub_11168()
{
  return CompositeAppViewState.TranscriptInfo.init(transcriptID:payloadID:from:to:direction:isPending:kind:timestamp:initialLocation:canShowExpensiveUIAndControls:)();
}

uint64_t sub_11178()
{
  return type metadata accessor for CompositeAppViewState.TranscriptInfo.Kind();
}

uint64_t sub_11188()
{
  return type metadata accessor for CompositeAppViewState.TranscriptInfo.Direction();
}

uint64_t sub_11198()
{
  return type metadata accessor for CompositeAppViewState.TranscriptInfo();
}

uint64_t sub_111A8()
{
  return type metadata accessor for CompositeAppViewState();
}

uint64_t sub_111B8()
{
  return CompositeAppViewInitialInfo.init(callerHandle:groupName:friends:state:areFindMyFeaturesDisable:)();
}

uint64_t sub_111C8()
{
  return type metadata accessor for CompositeAppViewInitialInfo();
}

uint64_t sub_111D8()
{
  return Friend.init(mainHandle:)();
}

uint64_t sub_111E8()
{
  return type metadata accessor for Friend();
}

uint64_t sub_111F8()
{
  return Logger.logObject.getter();
}

uint64_t sub_11208()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_11218()
{
  return type metadata accessor for Logger();
}

uint64_t sub_11228()
{
  return static SafeAreaRegions.container.getter();
}

uint64_t sub_11238()
{
  return dispatch thunk of UIHostingController.sizingOptions.setter();
}

uint64_t sub_11248()
{
  return UIHostingController.safeAreaRegions.setter();
}

uint64_t sub_11258()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_11268()
{
  return static UIHostingControllerSizingOptions.preferredContentSize.getter();
}

uint64_t sub_11278()
{
  return type metadata accessor for UIHostingControllerSizingOptions();
}

NSString sub_11288()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_11298()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_112A8()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_112B8()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_112C8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_112D8()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_112E8()
{
  return specialized Array._endMutation()();
}

uint64_t sub_112F8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_11308()
{
  return static MainActor.shared.getter();
}

uint64_t sub_11318()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_11328()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_11338()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_11348()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_11358()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_11368()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_11378()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_11388()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_11398()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_113A8()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_113B8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_113C8()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_113D8()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t sub_113E8()
{
  return ContinuousClock.init()();
}

uint64_t sub_113F8()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t sub_11408()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t sub_11418()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_11428()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_11438()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_11448()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_11458()
{
  return dispatch thunk of Clock.now.getter();
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}