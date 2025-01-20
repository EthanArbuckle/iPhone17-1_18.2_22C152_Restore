uint64_t sub_4C0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = sub_6B68(&qword_C208);
  v3 = sub_72A4(v2);
  __chkstk_darwin(v3);
  sub_7114();
  v4 = sub_7490();
  sub_7088();
  v6 = v5;
  __chkstk_darwin(v7);
  sub_71A8();
  sub_7470();
  v8 = sub_7480();
  v9 = sub_74E0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_0, v8, v9, "getting bridge facade from SiriKit runtime.", v10, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0, v4);
  sub_73B0();
  v11 = enum case for TaskInitiatedParty.user(_:);
  sub_7460();
  sub_721C();
  (*(void (**)(uint64_t, uint64_t))(v12 + 104))(v1, v11);
  v13 = enum case for AssistantTurnState.taskComplete(_:);
  v14 = sub_7450();
  sub_721C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 104))(v1, v13, v14);
  sub_6BAC(v1, 0, 1, v14);
  sub_7370();
  swift_allocObject();
  sub_7360();
  return sub_7390();
}

uint64_t sub_4E30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  sub_7490();
  sub_7088();
  __chkstk_darwin(v4);
  sub_71A8();
  sub_7470();
  v5 = sub_7480();
  os_log_type_t v6 = sub_74E0();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)sub_7184();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "Returning the suggestions SiriKitExecutor bridge", v7, 2u);
    swift_slowDealloc();
  }

  sub_722C();
  v8();
  uint64_t inited = swift_initStaticObject();
  sub_4F84();
  a1[3] = v2;
  uint64_t result = sub_7024(&qword_C200, v10, (void (*)(uint64_t))type metadata accessor for SiriKitExecutorBridge);
  a1[4] = result;
  *a1 = inited;
  return result;
}

uint64_t sub_4F84()
{
  uint64_t v0 = sub_6B68(&qword_C1D8);
  uint64_t v1 = sub_72A4(v0);
  __chkstk_darwin(v1);
  v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_74C0();
  sub_6BAC((uint64_t)v3, 1, 1, v4);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = 0;
  if (sub_6C3C((uint64_t)v3, 1, v4) == 1)
  {
    sub_6EF0((uint64_t)v3, &qword_C1D8);
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    sub_74B0();
    (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
    if (*(void *)(v5 + 16))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v6 = sub_74A0();
      uint64_t v7 = v8;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
    }
  }
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = &unk_C1E8;
  *(void *)(v9 + 24) = v5;
  if (v7 | v6)
  {
    v11[0] = 0;
    v11[1] = 0;
    v11[2] = v6;
    v11[3] = v7;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_5178()
{
  sub_70CC();
  uint64_t v1 = sub_7490();
  v0[2] = v1;
  sub_70A4(v1);
  v0[3] = v2;
  v0[4] = swift_task_alloc();
  v0[5] = swift_task_alloc();
  sub_7168();
  return _swift_task_switch();
}

uint64_t sub_5218()
{
  sub_71EC();
  if (sub_73F0())
  {
    uint64_t v1 = (void *)swift_task_alloc();
    *(void *)(v0 + 48) = v1;
    *uint64_t v1 = v0;
    v1[1] = sub_53BC;
    return static StaticSuggestionDialogCache.prewarm()();
  }
  else
  {
    sub_7470();
    uint64_t v2 = (void *)sub_7480();
    os_log_type_t v3 = sub_74D0();
    if (sub_70F8(v3))
    {
      uint64_t v4 = (_WORD *)sub_7184();
      sub_71F8(v4);
      sub_70D8(&dword_0, v5, v6, "StaticSuggestionDialogCache.shouldWarmup() returned false. Not warming up StaticDialogCache");
      sub_712C();
    }

    uint64_t v7 = sub_71C4();
    v8(v7);
    sub_73E0();
    if (sub_73C0())
    {
      sub_73D0();
    }
    else
    {
      sub_7470();
      uint64_t v9 = (void *)sub_7480();
      os_log_type_t v10 = sub_74D0();
      if (sub_70F8(v10))
      {
        v11 = (_WORD *)sub_7184();
        sub_71F8(v11);
        sub_70D8(&dword_0, v12, v13, "CoreSpeechPolicyProvider.shouldWarmup() returned false. Not warming up CoreSpeechPolicyProvider");
        sub_712C();
      }

      uint64_t v14 = sub_7248();
      v15(v14);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    sub_7148();
    return v16();
  }
}

uint64_t sub_53BC()
{
  sub_70CC();
  sub_7070();
  uint64_t v1 = *v0;
  sub_70BC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_7168();
  return _swift_task_switch();
}

uint64_t sub_5484()
{
  sub_71EC();
  sub_73E0();
  if (sub_73C0())
  {
    sub_73D0();
  }
  else
  {
    sub_7470();
    uint64_t v0 = (void *)sub_7480();
    os_log_type_t v1 = sub_74D0();
    if (sub_70F8(v1))
    {
      uint64_t v2 = (_WORD *)sub_7184();
      sub_71F8(v2);
      sub_70D8(&dword_0, v3, v4, "CoreSpeechPolicyProvider.shouldWarmup() returned false. Not warming up CoreSpeechPolicyProvider");
      sub_712C();
    }

    uint64_t v5 = sub_7248();
    v6(v5);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  sub_7148();
  return v7();
}

uint64_t sub_5560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11)
{
  sub_70CC();
  *(void *)(v12 + 104) = a11;
  *(void *)(v12 + 112) = v11;
  *(void *)(v12 + 96) = a10;
  *(_OWORD *)(v12 + 80) = a9;
  *(void *)(v12 + 64) = v13;
  *(void *)(v12 + 72) = v14;
  *(void *)(v12 + 48) = v15;
  *(void *)(v12 + 56) = v16;
  *(void *)(v12 + 32) = v17;
  *(void *)(v12 + 40) = v18;
  *(void *)(v12 + 16) = v19;
  *(void *)(v12 + 24) = v20;
  uint64_t v21 = sub_7300();
  *(void *)(v12 + 120) = v21;
  sub_70A4(v21);
  *(void *)(v12 + 128) = v22;
  *(void *)(v12 + 136) = sub_7204();
  sub_7168();
  return sub_727C();
}

uint64_t sub_5600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10)
{
  sub_71EC();
  swift_bridgeObjectRetain();
  sub_72C0();
  uint64_t v11 = (void *)swift_task_alloc();
  v10[18] = v11;
  void *v11 = v10;
  v11[1] = sub_56EC;
  uint64_t v12 = v10[17];
  uint64_t v13 = v10[7];
  uint64_t v14 = v10[8];
  uint64_t v15 = v10[5];
  uint64_t v16 = v10[6];
  uint64_t v17 = v10[3];
  uint64_t v18 = v10[4];
  uint64_t v19 = v10[2];
  return sub_58BC(v19, v17, v18, v15, v12, v16, v13, v14, a9, a10);
}

uint64_t sub_56EC()
{
  sub_7070();
  uint64_t v3 = v2;
  uint64_t v5 = v4[17];
  uint64_t v6 = v4[16];
  uint64_t v7 = v4[15];
  uint64_t v8 = *v1;
  sub_70BC();
  *uint64_t v9 = v8;
  *(void *)(v3 + 152) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  if (v0)
  {
    sub_7168();
    return _swift_task_switch();
  }
  else
  {
    swift_task_dealloc();
    sub_7148();
    return v10();
  }
}

uint64_t sub_5860()
{
  sub_70CC();
  swift_task_dealloc();
  sub_7148();
  return v0();
}

uint64_t sub_58BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10)
{
  sub_70CC();
  *(void *)(v11 + 136) = a10;
  *(void *)(v11 + 144) = v10;
  *(_OWORD *)(v11 + 120) = a9;
  *(void *)(v11 + 104) = v12;
  *(void *)(v11 + 112) = v13;
  *(void *)(v11 + 88) = v14;
  *(void *)(v11 + 96) = v15;
  *(void *)(v11 + 72) = v16;
  *(void *)(v11 + 80) = v17;
  *(void *)(v11 + 56) = v18;
  *(void *)(v11 + 64) = v19;
  uint64_t v20 = sub_7490();
  *(void *)(v11 + 152) = v20;
  sub_70A4(v20);
  *(void *)(v11 + 160) = v21;
  *(void *)(v11 + 168) = sub_7204();
  uint64_t v22 = sub_7350();
  *(void *)(v11 + 176) = v22;
  sub_70A4(v22);
  *(void *)(v11 + 184) = v23;
  *(void *)(v11 + 192) = sub_7204();
  uint64_t v24 = sub_6B68(&qword_C1A0);
  sub_72A4(v24);
  *(void *)(v11 + 200) = swift_task_alloc();
  *(void *)(v11 + 208) = swift_task_alloc();
  uint64_t v25 = sub_7420();
  *(void *)(v11 + 216) = v25;
  sub_70A4(v25);
  *(void *)(v11 + 224) = v26;
  *(void *)(v11 + 232) = sub_7204();
  sub_7168();
  return sub_727C();
}

uint64_t sub_59F4()
{
  *(void *)(v0 + 240) = (*(uint64_t (**)(void))(*(void *)(v0 + 144) + 16))();
  os_log_type_t v1 = (_OWORD *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 104);
  sub_72D0();
  sub_72E0();
  sub_72F0();
  sub_7410();
  if (v2)
  {
    uint64_t v3 = sub_7430();
    swift_allocObject();
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_7440();
    *(void *)(v0 + 40) = v3;
    *(void *)(v0 + 48) = sub_7024(&qword_C1C8, 255, (void (*)(uint64_t))&type metadata accessor for DomainOwner);
    *(void *)(v0 + 16) = v4;
  }
  else
  {
    *(void *)(v0 + 48) = 0;
    *os_log_type_t v1 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
  }
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 248) = v5;
  void *v5 = v0;
  v5[1] = sub_5CC8;
  uint64_t v6 = *(void *)(v0 + 208);
  uint64_t v7 = *(void *)(v0 + 128);
  uint64_t v8 = *(void *)(v0 + 112);
  uint64_t v9 = *(void *)(v0 + 120);
  uint64_t v10 = *(void *)(v0 + 72);
  uint64_t v11 = *(void *)(v0 + 80);
  uint64_t v12 = *(void *)(v0 + 64);
  return SiriSuggestionsFacade.doSiriHints(requestId:applicationSessionId:sourceOwner:intentProperties:verb:executionProperties:executionContextData:suggestionCallback:)(v6, v12, v10, v11, v1, v8, v9, v7);
}

uint64_t sub_5CC8()
{
  sub_70CC();
  sub_7070();
  uint64_t v3 = v2 + 16;
  uint64_t v4 = *v1;
  sub_70BC();
  void *v5 = v4;
  *(void *)(v6 + 256) = v0;
  swift_task_dealloc();
  sub_6EF0(v3, &qword_C1C0);
  sub_7168();
  return _swift_task_switch();
}

uint64_t sub_5DBC()
{
  uint64_t v1 = v0[25];
  uint64_t v2 = v0[22];
  sub_6BD4(v0[26], v1);
  uint64_t v3 = 1;
  if (sub_6C3C(v1, 1, v2) != 1)
  {
    uint64_t v4 = v0[24];
    uint64_t v5 = v0[22];
    uint64_t v6 = v0[23];
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 32))(v4, v0[25], v5);
    sub_7340();
    sub_7330();
    sub_7310();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    uint64_t v3 = 0;
  }
  uint64_t v7 = v0[26];
  uint64_t v8 = v0[7];
  uint64_t v9 = sub_7320();
  sub_6BAC(v8, v3, 1, v9);
  swift_release();
  sub_6EF0(v7, &qword_C1A0);
  sub_722C();
  v10();
  sub_725C();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_7174();
  return v11();
}

uint64_t sub_5F30()
{
  swift_release();
  sub_722C();
  v0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_7148();
  return v1();
}

uint64_t sub_5FF4()
{
  sub_70CC();
  uint64_t v1 = sub_7490();
  v0[2] = v1;
  sub_70A4(v1);
  v0[3] = v2;
  v0[4] = sub_7204();
  sub_7168();
  return _swift_task_switch();
}

uint64_t sub_607C()
{
  sub_71EC();
  sub_7470();
  uint64_t v0 = (void *)sub_7480();
  os_log_type_t v1 = sub_74D0();
  if (sub_70F8(v1))
  {
    uint64_t v2 = (_WORD *)sub_7184();
    sub_71F8(v2);
    sub_70D8(&dword_0, v3, v4, "Engagement submission from SKU is disabled. We expect all domain owners to submit engagements manually.");
    sub_712C();
  }

  uint64_t v5 = sub_71C4();
  v6(v5);
  swift_task_dealloc();
  sub_7174();
  return v7();
}

uint64_t sub_6130@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_7300();
  sub_7088();
  __chkstk_darwin(v9);
  sub_7114();
  swift_bridgeObjectRetain();
  sub_72C0();
  sub_6234(a1, a2, a3, v4, a4);
  sub_722C();
  return v10();
}

uint64_t sub_6234@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v45 = a4;
  uint64_t v46 = a1;
  uint64_t v47 = a2;
  uint64_t v48 = a3;
  uint64_t v51 = a5;
  sub_7490();
  sub_7088();
  uint64_t v49 = v9;
  uint64_t v50 = v8;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_7350();
  sub_7088();
  uint64_t v43 = v13;
  uint64_t v44 = v12;
  __chkstk_darwin(v12);
  sub_7114();
  uint64_t v14 = sub_6B68(&qword_C1A0);
  uint64_t v15 = sub_72A4(v14);
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v41 - v19;
  uint64_t v21 = sub_7420();
  sub_7088();
  uint64_t v23 = v22;
  uint64_t v25 = __chkstk_darwin(v24);
  uint64_t v26 = (*(uint64_t (**)(uint64_t))(v5 + 16))(v25);
  if (v6)
  {
    swift_errorRelease();
    sub_7470();
    v27 = sub_7480();
    os_log_type_t v28 = sub_74F0();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_0, v27, v28, "facade not set. Unable to process doContinuousConversationsHints", v29, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v49 + 8))(v11, v50);
    uint64_t v30 = sub_7320();
    return sub_6BAC(v51, 1, 1, v30);
  }
  else
  {
    uint64_t v42 = v7;
    uint64_t v49 = v23;
    uint64_t v50 = v21;
    uint64_t v32 = v26;
    sub_72D0();
    sub_72E0();
    sub_72F0();
    sub_7410();
    sub_73A0();
    uint64_t v48 = v32;
    sub_6BD4((uint64_t)v20, (uint64_t)v18);
    uint64_t v33 = 1;
    uint64_t v34 = v44;
    int v35 = sub_6C3C((uint64_t)v18, 1, v44);
    uint64_t v36 = v51;
    if (v35 != 1)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v43 + 32))(v42, v18, v34);
      sub_7340();
      sub_7330();
      sub_7310();
      sub_722C();
      v37();
      uint64_t v33 = 0;
    }
    uint64_t v38 = sub_7320();
    sub_6BAC(v36, v33, 1, v38);
    swift_release();
    sub_6EF0((uint64_t)v20, &qword_C1A0);
    uint64_t v39 = sub_7290();
    return v40(v39);
  }
}

uint64_t sub_65E8()
{
  swift_release();
  uint64_t v0 = sub_7238();

  return _swift_deallocClassInstance(v0);
}

uint64_t type metadata accessor for SiriKitExecutorBridge()
{
  return self;
}

uint64_t sub_6640()
{
  return sub_4F84();
}

uint64_t sub_6658(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_7154();
  uint64_t v5 = swift_task_alloc();
  uint64_t v6 = (void *)sub_719C(v5);
  *uint64_t v6 = v7;
  v6[1] = sub_6740;
  sub_71DC();
  return SiriSuggestionsBroker.doSiriHints(requestId:applicationSessionId:sourceDomainOwner:intentProperties:verb:executionProperties:dialogPhase:)(v8, v9, v10, v11, a5);
}

uint64_t sub_6740()
{
  sub_70CC();
  uint64_t v3 = v2;
  sub_7070();
  uint64_t v4 = *v1;
  sub_70BC();
  void *v5 = v4;
  uint64_t v6 = swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(uint64_t))(v4 + 8);
  if (!v0) {
    uint64_t v6 = v3;
  }
  return v7(v6);
}

uint64_t sub_6810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_7154();
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)sub_719C(v10);
  void *v11 = v12;
  v11[1] = sub_68F4;
  sub_71DC();
  return sub_5560(v13, v14, v15, v16, a5, a6, a7, a8, v23, a9, a10);
}

uint64_t sub_68F4()
{
  sub_70CC();
  sub_7070();
  uint64_t v1 = *v0;
  sub_70BC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_7148();
  return v3();
}

uint64_t sub_69B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_7154();
  uint64_t v10 = swift_task_alloc();
  uint64_t v11 = (void *)sub_719C(v10);
  void *v11 = v12;
  v11[1] = sub_706C;
  sub_71DC();
  return sub_58BC(v13, v14, v15, v16, a5, a6, a7, a8, v22, a9);
}

uint64_t sub_6A9C()
{
  sub_70CC();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_719C(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_706C;
  return sub_5FF4();
}

uint64_t sub_6B20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_6130(a1, a2, a3, a4);
}

uint64_t sub_6B44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  return sub_6234(a1, a2, a3, a4, a5);
}

uint64_t sub_6B68(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_6BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_6BD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6B68(&qword_C1A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_6C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_6C64(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_6D40;
  return v6(a1);
}

uint64_t sub_6D40()
{
  sub_70CC();
  sub_7070();
  uint64_t v1 = *v0;
  sub_70BC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_7174();
  return v3();
}

uint64_t sub_6E00()
{
  return sub_6E34(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_6E34(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_6E3C()
{
  swift_unknownObjectRelease();
  uint64_t v0 = sub_7238();

  return _swift_deallocObject(v0);
}

uint64_t sub_6E6C()
{
  sub_70CC();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_719C(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_68F4;
  return sub_5178();
}

uint64_t sub_6EF0(uint64_t a1, uint64_t *a2)
{
  sub_6B68(a2);
  sub_721C();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_6F44()
{
  swift_release();
  uint64_t v0 = sub_7238();

  return _swift_deallocObject(v0);
}

uint64_t sub_6F74()
{
  sub_71EC();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_719C(v4);
  void *v5 = v6;
  v5[1] = sub_68F4;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_C1F0 + dword_C1F0);
  return v7(v2, v3);
}

uint64_t sub_7024(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_70A4(uint64_t a1)
{
  return a1 - 8;
}

void sub_70D8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

BOOL sub_70F8(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_712C()
{
  return swift_slowDealloc();
}

uint64_t sub_7148()
{
  return v0 + 8;
}

uint64_t sub_7174()
{
  return v0 + 8;
}

uint64_t sub_7184()
{
  return swift_slowAlloc();
}

uint64_t sub_719C(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_71C4()
{
  return v0;
}

_WORD *sub_71F8(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t sub_7204()
{
  return swift_task_alloc();
}

uint64_t sub_7238()
{
  return v0;
}

uint64_t sub_7248()
{
  return v0;
}

uint64_t sub_725C()
{
  return swift_task_dealloc();
}

uint64_t sub_727C()
{
  return ((uint64_t (*)(void))_swift_task_switch)();
}

uint64_t sub_7290()
{
  return v0;
}

uint64_t sub_72A4(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_72C0()
{
  return SuggestionContextData.init(dialogPhase:hasAdditionalCommands:patternId:)();
}

uint64_t sub_72D0()
{
  return SuggestionContextData.dialogPhase.getter();
}

uint64_t sub_72E0()
{
  return SuggestionContextData.hasAdditionalCommands.getter();
}

uint64_t sub_72F0()
{
  return SuggestionContextData.patternId.getter();
}

uint64_t sub_7300()
{
  return type metadata accessor for SuggestionContextData();
}

uint64_t sub_7310()
{
  return HintsUI.init(snippet:supportingCommands:)();
}

uint64_t sub_7320()
{
  return type metadata accessor for HintsUI();
}

uint64_t sub_7330()
{
  return HintsSuggestionsUI.supportingCommands.getter();
}

uint64_t sub_7340()
{
  return HintsSuggestionsUI.aceView.getter();
}

uint64_t sub_7350()
{
  return type metadata accessor for HintsSuggestionsUI();
}

uint64_t sub_7360()
{
  return SiriRuntimeSuggestionsAPIClientProvider.init(assistantTurnState:)();
}

uint64_t sub_7370()
{
  return type metadata accessor for SiriRuntimeSuggestionsAPIClientProvider();
}

uint64_t sub_7390()
{
  return SiriSuggestionsFacade.__allocating_init(clientProvider:)();
}

uint64_t sub_73A0()
{
  return SiriSuggestionsFacade.doContinuousConversationsHint(requestId:applicationSessionId:executionContextData:)();
}

uint64_t sub_73B0()
{
  return type metadata accessor for SiriSuggestionsFacade();
}

uint64_t sub_73C0()
{
  return static CoreSpeechPolicyProvider.shouldWarmup()();
}

uint64_t sub_73D0()
{
  return static CoreSpeechPolicyProvider.warmup()();
}

uint64_t sub_73E0()
{
  return type metadata accessor for CoreSpeechPolicyProvider();
}

uint64_t sub_73F0()
{
  return static StaticSuggestionDialogCache.shouldWarmup()();
}

uint64_t sub_7410()
{
  return SuggestionExecutionContextData.init(dialogPhase:hasAdditionalCommands:patternId:)();
}

uint64_t sub_7420()
{
  return type metadata accessor for SuggestionExecutionContextData();
}

uint64_t sub_7430()
{
  return type metadata accessor for DomainOwner();
}

uint64_t sub_7440()
{
  return DomainOwner.init(_:)();
}

uint64_t sub_7450()
{
  return type metadata accessor for AssistantTurnState();
}

uint64_t sub_7460()
{
  return type metadata accessor for TaskInitiatedParty();
}

uint64_t sub_7470()
{
  return static Logger.siriSuggestionsSupportCategory.getter();
}

uint64_t sub_7480()
{
  return Logger.logObject.getter();
}

uint64_t sub_7490()
{
  return type metadata accessor for Logger();
}

uint64_t sub_74A0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_74B0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_74C0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_74D0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_74E0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_74F0()
{
  return static os_log_type_t.error.getter();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t self
{
  return _self;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
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

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
}

uint64_t swift_release()
{
  return _swift_release();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}