uint64_t sub_4E50(uint64_t a1)
{
  uint64_t v1;

  *(void *)(v1 + 16) = a1;
  return _swift_task_switch(sub_4E70, 0, 0);
}

uint64_t sub_4E70()
{
  sub_762C();
  [*(id *)(v0 + 16) donateInteractionWithCompletion:0];
  sub_75B4();
  return v1();
}

BOOL sub_4ED4()
{
  uint64_t v1 = v0;
  uint64_t v29 = sub_11740();
  sub_7574();
  uint64_t v3 = v2;
  ((void (*)(void))__chkstk_darwin)();
  sub_75C4();
  uint64_t v6 = v5 - v4;
  sub_6E94(&qword_18670);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v28 - v10;
  uint64_t v12 = sub_11170();
  sub_7574();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_75C4();
  uint64_t v18 = v17 - v16;
  sub_11130();
  int v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 88))(v18, v12);
  int v30 = enum case for Parse.directInvocation(_:);
  if (v19 == enum case for Parse.directInvocation(_:))
  {
    (*(void (**)(uint64_t, uint64_t))(v14 + 96))(v18, v12);
    uint64_t v20 = sub_11160();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 32))(v11, v18, v20);
    sub_6ED8((uint64_t)v11, 0, 1, v20);
    sub_744C((uint64_t)v11, (uint64_t)v9);
    sub_75EC();
    sub_73E4((uint64_t)v9, v3);
    swift_endAccess();
  }
  else
  {
    sub_115F0();
    v21 = sub_11730();
    os_log_type_t v22 = sub_11820();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = v1;
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_0, v21, v22, "SiriSuggestionsInvocationFlow :: Unhandled parse type", v23, 2u);
      sub_7668();
    }

    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v29);
    uint64_t v24 = sub_11160();
    sub_7650((uint64_t)v11, v25, v26, v24);
    sub_75EC();
    sub_73E4((uint64_t)v11, v3 + 8);
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v18, v12);
  }
  return v19 == v30;
}

uint64_t sub_51DC(uint64_t a1, uint64_t a2)
{
  sub_75A0();
  uint64_t v6 = v5;
  uint64_t v7 = sub_6E94(&qword_18650);
  __chkstk_darwin(v7 - 8);
  sub_75C4();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_117E0();
  sub_7650(v10, v12, v13, v11);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = v2;
  v14[5] = a1;
  v14[6] = a2;
  v14[7] = v6;
  swift_retain();
  swift_retain();
  sub_67B4(v10, (uint64_t)&unk_18660, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_52C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[20] = a6;
  v7[21] = a7;
  v7[18] = a4;
  v7[19] = a5;
  uint64_t v8 = sub_110F0();
  v7[22] = v8;
  v7[23] = *(void *)(v8 - 8);
  v7[24] = swift_task_alloc();
  sub_6E94(&qword_18668);
  v7[25] = swift_task_alloc();
  uint64_t v9 = sub_114F0();
  v7[26] = v9;
  v7[27] = *(void *)(v9 - 8);
  v7[28] = swift_task_alloc();
  uint64_t v10 = sub_11410();
  v7[29] = v10;
  v7[30] = *(void *)(v10 - 8);
  v7[31] = swift_task_alloc();
  uint64_t v11 = sub_114D0();
  v7[32] = v11;
  v7[33] = *(void *)(v11 - 8);
  v7[34] = swift_task_alloc();
  uint64_t v12 = sub_11510();
  v7[35] = v12;
  v7[36] = *(void *)(v12 - 8);
  v7[37] = swift_task_alloc();
  uint64_t v13 = sub_11740();
  v7[38] = v13;
  v7[39] = *(void *)(v13 - 8);
  v7[40] = swift_task_alloc();
  v7[41] = swift_task_alloc();
  uint64_t v14 = sub_11160();
  v7[42] = v14;
  v7[43] = *(void *)(v14 - 8);
  v7[44] = swift_task_alloc();
  v7[45] = swift_task_alloc();
  sub_6E94(&qword_18670);
  v7[46] = swift_task_alloc();
  v7[47] = swift_task_alloc();
  sub_6E94(&qword_18678);
  v7[48] = swift_task_alloc();
  uint64_t v15 = sub_114A0();
  v7[49] = v15;
  v7[50] = *(void *)(v15 - 8);
  v7[51] = swift_task_alloc();
  return _swift_task_switch(sub_56D0, 0, 0);
}

uint64_t sub_56D0()
{
  uint64_t v1 = *(void *)(v0 + 376);
  uint64_t v2 = *(void *)(v0 + 336);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_directInvocation;
  *(void *)(v0 + 416) = OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_directInvocation;
  uint64_t v5 = v3 + v4;
  swift_beginAccess();
  sub_7044(v5, v1);
  int v6 = sub_701C(v1, 1, v2);
  uint64_t v7 = *(void *)(v0 + 376);
  if (v6)
  {
    sub_70AC(*(void *)(v0 + 376), &qword_18670);
LABEL_3:
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
LABEL_4:
    sub_70AC(v0 + 56, &qword_18680);
LABEL_5:
    sub_7650(*(void *)(v0 + 384), v8, v9, *(void *)(v0 + 392));
    goto LABEL_6;
  }
  uint64_t v21 = *(void *)(v0 + 360);
  uint64_t v22 = *(void *)(v0 + 336);
  uint64_t v23 = *(void *)(v0 + 344);
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
  *(void *)(v0 + 424) = v24;
  *(void *)(v0 + 432) = (v23 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v24(v21, v7, v22);
  sub_70AC(v7, &qword_18670);
  uint64_t v25 = sub_11150();
  uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  *(void *)(v0 + 440) = v26;
  *(void *)(v0 + 448) = (v23 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v26(v21, v22);
  if (!v25) {
    goto LABEL_3;
  }
  sub_65B4(0x6974736567677573, 0xEA00000000006E6FLL, v25, (_OWORD *)(v0 + 56));
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 80)) {
    goto LABEL_4;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v27 = *(void *)(v0 + 384);
  uint64_t v28 = *(void *)(v0 + 392);
  sub_7108();
  sub_11780();
  swift_bridgeObjectRelease();
  if (sub_701C(v27, 1, v28) == 1)
  {
LABEL_6:
    sub_70AC(*(void *)(v0 + 384), &qword_18678);
    sub_115F0();
    uint64_t v10 = sub_11730();
    os_log_type_t v11 = sub_11820();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_0, v10, v11, "SiriSuggestionsInvocationFlow :: Unable to get encoded suggestion for invocation", v12, 2u);
      sub_7668();
    }
    uint64_t v14 = *(void *)(v0 + 184);
    uint64_t v13 = *(void *)(v0 + 192);
    uint64_t v15 = *(void *)(v0 + 176);
    uint64_t v16 = *(void (**)(uint64_t))(v0 + 152);

    uint64_t v17 = sub_75D4();
    v18(v17);
    sub_110D0();
    v16(v13);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    sub_7530();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_75B4();
    sub_7610();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v29 = *(void *)(v0 + 264);
  uint64_t v30 = *(void *)(v0 + 272);
  uint64_t v31 = *(void *)(v0 + 256);
  uint64_t v32 = *(void *)(v0 + 216);
  uint64_t v40 = *(void *)(v0 + 224);
  uint64_t v41 = *(void *)(v0 + 208);
  uint64_t v42 = *(void *)(v0 + 200);
  uint64_t v33 = *(void *)(v0 + 144);
  (*(void (**)(void, void, void))(*(void *)(v0 + 400) + 32))(*(void *)(v0 + 408), *(void *)(v0 + 384), *(void *)(v0 + 392));
  type metadata accessor for InvocationContextHolder();
  sub_11490();
  sub_114C0();
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v31);
  sub_6684();
  swift_bridgeObjectRelease();
  sub_7158((void *)(v33 + OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_dispatcherFactory), *(void *)(v33 + OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_dispatcherFactory + 24));
  sub_11450();
  sub_7158((void *)(v0 + 16), *(void *)(v0 + 40));
  (*(void (**)(uint64_t, void, uint64_t))(v32 + 104))(v40, enum case for InvocationType.unknown(_:), v41);
  uint64_t v34 = sub_10FE0();
  sub_7650(v42, v35, v36, v34);
  sub_113D0();
  v37 = (void *)swift_task_alloc();
  *(void *)(v0 + 456) = v37;
  void *v37 = v0;
  v37[1] = sub_5BB8;
  sub_7610();
  return dispatch thunk of SuggestionDispatcher.dispatch(suggestion:presentationContext:)();
}

uint64_t sub_5BB8()
{
  sub_7518();
  uint64_t v2 = *v1;
  sub_7590();
  *uint64_t v3 = v2;
  *(void *)(v4 + 464) = v0;
  swift_task_dealloc();
  uint64_t v5 = sub_7638();
  v6(v5);
  if (v0) {
    uint64_t v7 = sub_60F4;
  }
  else {
    uint64_t v7 = sub_5CEC;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_5CEC()
{
  uint64_t v1 = *(void *)(v0 + 368);
  uint64_t v2 = *(void *)(v0 + 336);
  uint64_t v3 = *(void *)(v0 + 192);
  uint64_t v4 = *(void (**)(uint64_t))(v0 + 152);
  uint64_t v5 = *(void *)(v0 + 144);
  uint64_t v6 = v5 + *(void *)(v0 + 416);
  sub_110D0();
  v4(v3);
  uint64_t v7 = sub_75D4();
  v8(v7);
  uint64_t v9 = *(int **)(v5 + OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_interactionDonator);
  sub_7044(v6, v1);
  if (sub_701C(v1, 1, v2))
  {
    sub_70AC(*(void *)(v0 + 368), &qword_18670);
  }
  else
  {
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v0 + 440);
    uint64_t v11 = *(void *)(v0 + 368);
    uint64_t v12 = *(void *)(v0 + 352);
    uint64_t v13 = *(void *)(v0 + 336);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 424))(v12, v11, v13);
    sub_70AC(v11, &qword_18670);
    uint64_t v14 = sub_11150();
    v10(v12, v13);
    if (v14) {
      goto LABEL_5;
    }
  }
  sub_11750();
  swift_bridgeObjectRelease();
LABEL_5:
  v15.super.isa = sub_6718().super.isa;
  *(INInteraction *)(v0 + 472) = v15;
  swift_bridgeObjectRelease();
  uint64_t v18 = (uint64_t (*)(Class))((char *)v9 + *v9);
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 480) = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_5F00;
  return v18(v15.super.isa);
}

uint64_t sub_5F00()
{
  sub_762C();
  sub_7518();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_7590();
  *uint64_t v5 = v4;
  *(void *)(v3 + 488) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v6 = sub_6258;
  }
  else
  {

    uint64_t v6 = sub_5FEC;
  }
  return _swift_task_switch(v6, 0, 0);
}

void sub_5FEC()
{
  (*(void (**)(void, void))(v0[36] + 8))(v0[37], v0[35]);
  uint64_t v1 = sub_7638();
  v2(v1);
  sub_719C((uint64_t)(v0 + 2));
  sub_7530();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_75B4();
  sub_7610();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_60F4()
{
  uint64_t v1 = v0[50];
  uint64_t v2 = v0[51];
  uint64_t v3 = v0[49];
  (*(void (**)(void, void))(v0[36] + 8))(v0[37], v0[35]);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  sub_719C((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_6258()
{
  uint64_t v29 = v0;

  sub_115F0();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_11730();
  os_log_type_t v2 = sub_11820();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = *(void *)(v0 + 488);
    uint64_t v24 = *(void *)(v0 + 392);
    uint64_t v26 = *(void *)(v0 + 408);
    uint64_t v4 = *(void *)(v0 + 312);
    uint64_t v18 = *(void *)(v0 + 304);
    uint64_t v19 = *(void *)(v0 + 320);
    uint64_t v22 = *(void *)(v0 + 296);
    uint64_t v23 = *(void *)(v0 + 400);
    uint64_t v20 = *(void *)(v0 + 288);
    uint64_t v21 = *(void *)(v0 + 280);
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v28 = v6;
    *(void *)(v0 + 128) = v3;
    swift_errorRetain();
    sub_6E94(&qword_18690);
    uint64_t v7 = sub_11770();
    *(void *)(v0 + 136) = sub_D33C(v7, v8, &v28);
    sub_11840();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v1, v2, "SiriSuggestionsInvocationFlow :: Error when donating interaction: %s", v5, 0xCu);
    swift_arrayDestroy();
    sub_7668();
    sub_7668();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v19, v18);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v21);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v26, v24);
  }
  else
  {
    uint64_t v9 = *(void *)(v0 + 400);
    uint64_t v25 = *(void *)(v0 + 392);
    uint64_t v27 = *(void *)(v0 + 408);
    uint64_t v10 = *(void *)(v0 + 312);
    uint64_t v11 = *(void *)(v0 + 320);
    uint64_t v13 = *(void *)(v0 + 296);
    uint64_t v12 = *(void *)(v0 + 304);
    uint64_t v15 = *(void *)(v0 + 280);
    uint64_t v14 = *(void *)(v0 + 288);

    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v27, v25);
  }
  sub_719C(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_75B4();
  return v16();
}

double sub_65B4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_722C(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_72A4(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

double sub_6618@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_722C(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 48 * v6;
    sub_74B4(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    a4[1] = 0u;
    a4[2] = 0u;
    *a4 = 0u;
  }
  return result;
}

uint64_t sub_6684()
{
  sub_11180();
  sub_7158(v1, v1[3]);
  sub_110B0();
  sub_719C((uint64_t)v1);
  swift_bridgeObjectRetain();
  return sub_11500();
}

INInteraction sub_6718()
{
  id v0 = [objc_allocWithZone((Class)sub_11670()) init];
  uint64_t v1 = (void *)sub_11480();
  [v0 setSuggestion:v1];

  os_log_type_t v2 = (objc_class *)[objc_allocWithZone((Class)sub_11680()) init];
  sub_71EC();
  v3.super.isa = (Class)v0;
  v4.super.isa = v2;
  return sub_117F0(v3, v4, 1);
}

uint64_t sub_67B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_117E0();
  if (sub_701C(a1, 1, v5) == 1)
  {
    sub_70AC(a1, &qword_18650);
  }
  else
  {
    sub_117D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_117C0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_68FC()
{
  sub_70AC(v0 + OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_directInvocation, &qword_18670);
  swift_release();
  sub_719C(v0 + OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_dispatcherFactory);
  return v0;
}

uint64_t sub_6950()
{
  sub_68FC();
  sub_75A0();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);

  return _swift_deallocClassInstance(v0, v2, v3);
}

BOOL sub_6988()
{
  return sub_4ED4();
}

uint64_t sub_69B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *char v7 = v3;
  v7[1] = sub_6A60;
  return Flow.onAsync(input:)(a1, a2, a3);
}

uint64_t sub_6A60()
{
  sub_762C();
  uint64_t v2 = v1;
  sub_7518();
  uint64_t v3 = *v0;
  sub_7590();
  *INIntentResponse v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_6B2C(uint64_t a1, uint64_t a2)
{
  return sub_51DC(a1, a2);
}

uint64_t sub_6B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_6C04;
  return Flow.execute()(a1, a2, a3);
}

uint64_t sub_6C04()
{
  sub_762C();
  sub_7518();
  uint64_t v1 = *v0;
  sub_7590();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_6CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for SiriSuggestionsInvocationFlow();

  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_6D08()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t variable initialization expression of SiriSuggestionsFlowPlugin.currentSiriHelpFlow()
{
  return 0;
}

uint64_t sub_6D20()
{
  return type metadata accessor for SiriSuggestionsInvocationFlow();
}

uint64_t type metadata accessor for SiriSuggestionsInvocationFlow()
{
  uint64_t result = qword_184E0;
  if (!qword_184E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_6D70()
{
  sub_6E18();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_6E18()
{
  if (!qword_184F0)
  {
    sub_11160();
    unint64_t v0 = sub_11830();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_184F0);
    }
  }
}

uint64_t type metadata accessor for InvocationContextHolder()
{
  return self;
}

uint64_t sub_6E94(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_6ED8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_6F00()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_6F48(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v9 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_6C04;
  return sub_52C8(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_701C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_7044(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6E94(&qword_18670);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_70AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_6E94(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_7108()
{
  unint64_t result = qword_18688;
  if (!qword_18688)
  {
    sub_114A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18688);
  }
  return result;
}

void *sub_7158(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_719C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_71EC()
{
  unint64_t result = qword_18698;
  if (!qword_18698)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_18698);
  }
  return result;
}

unint64_t sub_722C(uint64_t a1, uint64_t a2)
{
  sub_118B0();
  sub_11790();
  Swift::Int v4 = sub_118C0();

  return sub_7300(a1, a2, v4);
}

uint64_t sub_72A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_7300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_118A0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_118A0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_73E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6E94(&qword_18670);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_744C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6E94(&qword_18670);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_74B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_7530()
{
  return swift_task_dealloc();
}

uint64_t sub_75B4()
{
  return v0 + 8;
}

uint64_t sub_75D4()
{
  return v0;
}

uint64_t sub_75EC()
{
  return swift_beginAccess();
}

uint64_t sub_7638()
{
  return v0;
}

uint64_t sub_7650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_6ED8(a1, 1, 1, a4);
}

uint64_t sub_7668()
{
  return swift_slowDealloc();
}

void *sub_7680(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for EnvironmentRequestIdProvider();
  uint64_t v6 = swift_allocObject();
  type metadata accessor for SiriSuggestionsFlow();
  *(_OWORD *)(v6 + 32) = 0u;
  *(void *)(v6 + 48) = 0;
  *(_OWORD *)(v6 + 16) = 0u;
  uint64_t v7 = (void *)swift_allocObject();
  v7[8] = v5;
  uint64_t v9 = sub_DED0(&qword_18910, v8, (void (*)(uint64_t))type metadata accessor for EnvironmentRequestIdProvider);
  v7[2] = 0;
  v7[3] = a1;
  v7[4] = a2;
  v7[5] = v6;
  v7[9] = v9;
  v7[10] = sub_77EC;
  v7[11] = 0;
  uint64_t v14 = v2;
  uint64_t v15 = sub_DED0(&qword_186E0, v10, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsFlow);
  uint64_t v13 = v7;
  sub_DF18((uint64_t)&v13, (uint64_t)v12);
  swift_beginAccess();
  swift_retain();
  swift_retain();
  sub_DF80((uint64_t)v12, v6 + 16);
  swift_endAccess();
  swift_release();
  return v7;
}

uint64_t sub_77EC()
{
  return sub_11290() & 1;
}

uint64_t sub_781C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, void *a5@<X5>, uint64_t a6@<X6>, uint64_t *a7@<X8>)
{
  uint64_t v29 = a6;
  id v28 = a5;
  uint64_t v27 = a4;
  uint64_t v26 = a3;
  uint64_t v25 = a1;
  uint64_t v30 = a7;
  uint64_t v8 = sub_10FC0();
  sub_E3C4();
  uint64_t v10 = v9;
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  type metadata accessor for SiriSuggestionsFlow();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v16 = self;
  swift_retain();
  id v17 = objc_msgSend(v16, "bundleForClass:", ObjCClassFromMetadata, v25);
  id v18 = [v17 bundleURL];

  sub_10FB0();
  sub_10FA0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v8);
  sub_DE60(a2, (uint64_t)v37);
  sub_11310();
  uint64_t v19 = v35;
  uint64_t v20 = v36;
  sub_7158(v34, v35);
  v33[3] = v19;
  v33[4] = *(void *)(v20 + 24);
  sub_DDFC(v33);
  sub_E9CC();
  (*(void (**)(void))(v21 + 16))();
  sub_DE60(v26, (uint64_t)v32);
  sub_DE60(v27, (uint64_t)v31);
  sub_116B0();
  swift_allocObject();
  id v22 = v28;
  sub_DEC0(v29);
  uint64_t v23 = sub_116A0();
  uint64_t result = sub_719C((uint64_t)v34);
  *uint64_t v30 = v23;
  return result;
}

uint64_t sub_7ADC@<X0>(void (*a1)(char *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15 = a1;
  uint64_t v5 = sub_11410();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_6E94(&qword_186B0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_DD9C(v2, (uint64_t)v11, &qword_186B0);
  uint64_t v12 = 1;
  if (sub_701C((uint64_t)v11, 1, v5) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v5);
    v15(v8);
    if (v3) {
      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v12 = 0;
  }
  return sub_6ED8(a2, v12, 1, v5);
}

uint64_t SiriSuggestionsFlow.on(input:)(uint64_t a1)
{
  void (*v35)(uint64_t *__return_ptr, uint64_t);
  NSObject *v36;
  os_log_type_t v37;
  _WORD *v38;
  void (*v39)(void);
  uint64_t v40;
  _DWORD *v41;
  void *v42;
  os_log_type_t v43;
  _DWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(void);
  void (*v51)(void);
  void *v52;
  os_log_type_t v53;
  _DWORD *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  void (*v62)(void);
  NSObject *v63;
  os_log_type_t v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void v75[4];
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84[5];
  uint64_t v85;

  v81 = a1;
  uint64_t v3 = sub_6E94(&qword_186A8);
  uint64_t v4 = sub_E664(v3);
  __chkstk_darwin(v4);
  sub_75C4();
  v76 = v6 - v5;
  uint64_t v7 = sub_6E94(&qword_186B0);
  uint64_t v8 = sub_E664(v7);
  __chkstk_darwin(v8);
  sub_EAC4();
  v75[3] = v9;
  sub_EAA4();
  __chkstk_darwin(v10);
  v78 = (char *)v75 - v11;
  sub_11740();
  sub_E3C4();
  v82 = v13;
  v83 = v12;
  __chkstk_darwin(v12);
  sub_EAC4();
  v79 = v14;
  sub_EAA4();
  __chkstk_darwin(v15);
  v77 = (char *)v75 - v16;
  sub_EAA4();
  __chkstk_darwin(v17);
  v75[2] = (char *)v75 - v18;
  sub_EAA4();
  uint64_t v20 = __chkstk_darwin(v19);
  id v22 = (char *)v75 - v21;
  uint64_t v23 = __chkstk_darwin(v20);
  __chkstk_darwin(v23);
  uint64_t v25 = (char *)v75 - v24;
  sub_11170();
  sub_E3C4();
  v80 = v26;
  __chkstk_darwin(v27);
  sub_75C4();
  uint64_t v30 = v29 - v28;
  uint64_t v31 = sub_6E94(&qword_186B8);
  sub_E3C4();
  uint64_t v33 = v32;
  __chkstk_darwin(v34);
  sub_E8B4();
  if ((*(uint64_t (**)(void))(v1 + 80))())
  {
    v75[0] = v25;
    v75[1] = v22;
    v79 = v1;
    sub_11220();
    uint64_t v35 = (void (*)(uint64_t *__return_ptr, uint64_t))sub_11240();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v2, v31);
    sub_11130();
    v35(v84, v30);
    swift_release();
    sub_E688();
    v39();
    uint64_t v40 = v84[0];
    sub_115F0();
    uint64_t v41 = (_DWORD *)v79;
    swift_retain_n();
    uint64_t v42 = (void *)sub_11730();
    v43 = sub_11810();
    if (sub_E5E0(v43))
    {
      v44 = (_DWORD *)sub_E694();
      v84[0] = sub_E670();
      *v44 = 136315138;
      uint64_t v41 = v44 + 1;
      v85 = *(void *)(v79 + 16);
      swift_retain();
      sub_6E94(&qword_186C0);
      v45 = sub_11770();
      v85 = sub_D33C(v45, v46, v84);
      sub_EB04();
      swift_release_n();
      swift_bridgeObjectRelease();
      sub_EB48(&dword_0, v47, v48, "Previous intentProperties calculated as %s");
      swift_arrayDestroy();
      sub_7668();
      sub_7668();
    }
    else
    {

      swift_release_n();
    }
    v51 = *(void (**)(void))(v82 + 8);
    sub_E760();
    v51();
    sub_115F0();
    swift_retain_n();
    v52 = (void *)sub_11730();
    v53 = sub_11810();
    if (sub_E5E0(v53))
    {
      v54 = (_DWORD *)sub_E694();
      v84[0] = sub_E670();
      *v54 = 136315138;
      uint64_t v41 = v54 + 1;
      v85 = v40;
      swift_retain();
      sub_6E94(&qword_186C0);
      v55 = sub_11770();
      v85 = sub_D33C(v55, v56, v84);
      sub_EB04();
      swift_release_n();
      swift_bridgeObjectRelease();
      sub_EB48(&dword_0, v57, v58, "new intentProperties calculated as %s");
      sub_EA8C();
      sub_7668();
      sub_7668();
    }
    else
    {

      swift_release_n();
    }
    sub_E760();
    v51();
    v59 = (uint64_t)v78;
    if (*((void *)v41 + 2) && v40)
    {
      swift_retain();
      swift_retain();
      sub_11370();
      swift_release();
      v60 = sub_11410();
      if (sub_701C(v59, 1, v60) == 1)
      {
        sub_E25C(v59, &qword_186B0);
      }
      else
      {
        v61 = sub_113E0();
        sub_E9CC();
        sub_E688();
        v62();
        if (v61)
        {
          sub_115F0();
          v63 = sub_11730();
          v64 = sub_11810();
          if (os_log_type_enabled(v63, v64))
          {
            *(_WORD *)sub_E560() = 0;
            sub_EBE0(&dword_0, v65, v66, "Reusing previous turn's intentProperties as this is a show more request");
            sub_7668();
          }

          sub_E760();
          v51();
          sub_11360();
          sub_11380();
          sub_11390();
          swift_retain();
          sub_11370();
          swift_release();
          if (*(void *)(v79 + 16))
          {
            swift_retain();
            sub_11340();
            swift_release();
          }
          else
          {
            v71 = sub_114B0();
            sub_7650(v76, v72, v73, v71);
          }
          sub_113A0();
          sub_EB30();
          v74 = sub_11350();
          swift_release();
          swift_release();
          *(void *)(v79 + 16) = v74;
          goto LABEL_25;
        }
      }
      swift_release();
    }
    sub_115F0();
    v67 = sub_11730();
    v68 = sub_11810();
    if (os_log_type_enabled(v67, v68))
    {
      *(_WORD *)sub_E560() = 0;
      sub_EBE0(&dword_0, v69, v70, "Using new intentProperties as this is new request");
      sub_7668();
    }

    sub_E760();
    v51();
    *((void *)v41 + 2) = v40;
LABEL_25:
    swift_release();
    return 1;
  }
  sub_115F0();
  uint64_t v36 = sub_11730();
  v37 = sub_11800();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = (_WORD *)sub_E560();
    sub_E88C(v38);
    _os_log_impl(&dword_0, v36, v37, "SiriSuggestionsFlow :: Disabled. Skipping suggestions", (uint8_t *)v33, 2u);
    sub_7668();
  }

  sub_E688();
  v49();
  return 0;
}

uint64_t SiriSuggestionsFlow.execute()()
{
  sub_762C();
  v1[38] = v2;
  v1[39] = v0;
  uint64_t v3 = sub_11060();
  v1[40] = v3;
  sub_E2B8(v3);
  v1[41] = v4;
  v1[42] = sub_E76C();
  uint64_t v5 = sub_6E94(&qword_186D0);
  v1[43] = v5;
  sub_E664(v5);
  v1[44] = sub_E76C();
  uint64_t v6 = sub_6E94(&qword_186D8);
  v1[45] = v6;
  sub_E664(v6);
  v1[46] = sub_E50C();
  v1[47] = swift_task_alloc();
  v1[48] = swift_task_alloc();
  v1[49] = swift_task_alloc();
  uint64_t v7 = sub_11690();
  v1[50] = v7;
  sub_E2B8(v7);
  v1[51] = v8;
  v1[52] = sub_E76C();
  uint64_t v9 = sub_114F0();
  v1[53] = v9;
  sub_E2B8(v9);
  v1[54] = v10;
  v1[55] = sub_E76C();
  uint64_t v11 = sub_11410();
  v1[56] = v11;
  sub_E2B8(v11);
  v1[57] = v12;
  v1[58] = sub_E76C();
  uint64_t v13 = sub_6E94(&qword_186A8);
  sub_E664(v13);
  v1[59] = sub_E50C();
  v1[60] = swift_task_alloc();
  uint64_t v14 = sub_114B0();
  v1[61] = v14;
  sub_E2B8(v14);
  v1[62] = v15;
  v1[63] = sub_E50C();
  v1[64] = swift_task_alloc();
  v1[65] = swift_task_alloc();
  v1[66] = swift_task_alloc();
  uint64_t v16 = sub_6E94(&qword_186B0);
  v1[67] = v16;
  sub_E664(v16);
  v1[68] = sub_E50C();
  v1[69] = swift_task_alloc();
  v1[70] = swift_task_alloc();
  v1[71] = swift_task_alloc();
  v1[72] = swift_task_alloc();
  v1[73] = swift_task_alloc();
  v1[74] = swift_task_alloc();
  uint64_t v17 = sub_11660();
  v1[75] = v17;
  sub_E2B8(v17);
  v1[76] = v18;
  v1[77] = sub_E50C();
  v1[78] = swift_task_alloc();
  uint64_t v19 = sub_6E94(&qword_18668);
  sub_E664(v19);
  v1[79] = sub_E50C();
  v1[80] = swift_task_alloc();
  uint64_t v20 = sub_10FE0();
  v1[81] = v20;
  sub_E2B8(v20);
  v1[82] = v21;
  v1[83] = sub_E50C();
  v1[84] = swift_task_alloc();
  uint64_t v22 = sub_11740();
  v1[85] = v22;
  sub_E2B8(v22);
  v1[86] = v23;
  v1[87] = sub_E50C();
  v1[88] = swift_task_alloc();
  v1[89] = swift_task_alloc();
  v1[90] = swift_task_alloc();
  v1[91] = swift_task_alloc();
  v1[92] = swift_task_alloc();
  v1[93] = swift_task_alloc();
  v1[94] = swift_task_alloc();
  v1[95] = swift_task_alloc();
  v1[96] = swift_task_alloc();
  v1[97] = swift_task_alloc();
  v1[98] = swift_task_alloc();
  uint64_t v24 = sub_11720();
  v1[99] = v24;
  sub_E2B8(v24);
  v1[100] = v25;
  v1[101] = sub_E76C();
  sub_E724();
  return _swift_task_switch(v26, v27, v28);
}

uint64_t sub_8A6C()
{
  v85 = v0;
  uint64_t v1 = v0[39];
  uint64_t v2 = *(void *)(v1 + 24);
  v0[102] = v2;
  if (!v2 || (uint64_t v3 = *(void *)(v1 + 32), (v0[103] = v3) == 0))
  {
    sub_115F0();
    uint64_t v17 = (void *)sub_11730();
    os_log_type_t v18 = sub_11820();
    if (sub_E7B0(v18))
    {
      uint64_t v19 = (_WORD *)sub_E560();
      sub_E88C(v19);
      sub_E6AC(&dword_0, v20, v21, "No suggestions facade set. Cannot continue");
      sub_7668();
    }

    uint64_t v22 = sub_E7E8();
    v23(v22);
    sub_110D0();
LABEL_17:
    sub_E3DC();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_E638();
    sub_E8CC();
    __asm { BRAA            X1, X16 }
  }
  swift_retain();
  swift_retain();
  uint64_t v4 = (void *)sub_11620();
  sub_11600();

  sub_114E0();
  uint64_t v5 = (void *)sub_11620();
  sub_11630();

  sub_115F0();
  swift_retain_n();
  uint64_t v6 = sub_11730();
  os_log_type_t v7 = sub_11810();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[98];
  uint64_t v10 = v0[86];
  uint64_t v11 = v0[85];
  uint64_t v12 = v0[39];
  if (v8)
  {
    uint64_t v82 = v0[98];
    uint64_t v13 = (uint8_t *)sub_E694();
    v84[0] = sub_E670();
    *(_DWORD *)uint64_t v13 = 136315138;
    v0[36] = *(void *)(v12 + 16);
    swift_retain();
    sub_6E94(&qword_186C0);
    uint64_t v14 = sub_11770();
    v0[37] = sub_D33C(v14, v15, v84);
    sub_11840();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v6, v7, "Using intentProperties: %s", v13, 0xCu);
    sub_E7CC();
    sub_7668();
    sub_7668();

    uint64_t v16 = *(void (**)(void))(v10 + 8);
    ((void (*)(uint64_t, uint64_t))v16)(v82, v11);
  }
  else
  {

    swift_release_n();
    uint64_t v16 = *(void (**)(void))(v10 + 8);
    ((void (*)(uint64_t, uint64_t))v16)(v9, v11);
  }
  v0[104] = v16;
  sub_115F0();
  uint64_t v24 = (void *)sub_11730();
  os_log_type_t v25 = sub_11800();
  if (sub_E5E0(v25))
  {
    uint64_t v26 = (_WORD *)sub_E560();
    sub_E9D8(v26);
    sub_EB68(&dword_0, v27, v28, "SiriSuggestionsFlow :: Getting suggestions from sirisuggestions");
    sub_7668();
  }
  uint64_t v29 = v0[86];
  uint64_t v30 = v0[39];

  v0[105] = (v29 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  sub_EB24();
  sub_E830();
  v16();
  sub_7158((void *)(v30 + 40), *(void *)(v30 + 64));
  sub_EB24();
  v0[106] = sub_116C0();
  v0[107] = v31;
  if (!v31)
  {
LABEL_14:
    sub_115F0();
    uint64_t v35 = (void *)sub_11730();
    os_log_type_t v36 = sub_11820();
    if (sub_E5E0(v36))
    {
      v37 = (_WORD *)sub_E560();
      sub_E9D8(v37);
      sub_EB68(&dword_0, v38, v39, "SiriSuggestionsFlow :: No requestId set. Skipping suggestions");
      sub_7668();
    }

    sub_E830();
    v16();
    sub_110D0();
    sub_114E0();
    uint64_t v40 = (void *)sub_11620();
    sub_11610();
    swift_release();
    swift_release();

    uint64_t v41 = sub_EB24();
    v42(v41);
    goto LABEL_17;
  }
  uint64_t v32 = v0[81];
  uint64_t v33 = v0[80];
  sub_10FD0();
  if (sub_701C(v33, 1, v32) == 1)
  {
    uint64_t v34 = v0[80];
    swift_bridgeObjectRelease();
    sub_E25C(v34, &qword_18668);
    goto LABEL_14;
  }
  v83 = v16;
  uint64_t v45 = v0[77];
  uint64_t v51 = v0[76];
  uint64_t v46 = v0[75];
  uint64_t v47 = v0[39];
  (*(void (**)(void, void, void))(v0[82] + 32))(v0[84], v0[80], v0[81]);
  v0[108] = type metadata accessor for SiriSuggestionsFlow();
  sub_DED0(&qword_186E0, v48, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsFlow);
  sub_11200();
  sub_111A0();
  swift_release();
  sub_11650();
  swift_release();
  (*(void (**)(uint64_t, void, uint64_t))(v51 + 104))(v45, enum case for RequestPositionInSession.following(_:), v46);
  sub_DED0(&qword_186E8, 255, (void (*)(uint64_t))&type metadata accessor for RequestPositionInSession);
  sub_117B0();
  sub_117B0();
  uint64_t v49 = v0[30];
  uint64_t v50 = v0[34];
  v52 = *(void (**)(void))(v51 + 8);
  LOBYTE(v51) = v51 + 8;
  sub_E864();
  v52();
  sub_E864();
  v52();
  if (*(void *)(v47 + 16))
  {
    uint64_t v55 = v0[84];
    uint64_t v56 = v0[74];
    uint64_t v51 = v0[73];
    swift_retain();
    sub_11370();
    swift_release();
    uint64_t v57 = swift_task_alloc();
    *(void *)(v57 + 16) = v55;
    *(unsigned char *)(v57 + 24) = v49 == v50;
    sub_7ADC((void (*)(char *))sub_DB24, v56);
    sub_E25C(v51, &qword_186B0);
    swift_task_dealloc();
  }
  else
  {
    sub_7650(v0[74], v53, v54, v0[56]);
  }
  sub_115F0();
  uint64_t v58 = sub_E7E8();
  sub_DD9C(v58, v59, v60);
  v61 = sub_11730();
  os_log_type_t v62 = sub_11800();
  if (sub_E5E0(v62))
  {
    uint64_t v63 = v0[73];
    uint64_t v64 = v0[72];
    v65 = (uint8_t *)sub_E694();
    v84[0] = sub_E670();
    *(_DWORD *)v65 = 136315138;
    sub_DD9C(v64, v63, &qword_186B0);
    uint64_t v66 = sub_11770();
    v0[35] = sub_D33C(v66, v67, v84);
    sub_11840();
    swift_bridgeObjectRelease();
    sub_E25C(v64, &qword_186B0);
    _os_log_impl(&dword_0, v61, (os_log_type_t)v51, "Using presentationContext as: %s", v65, 0xCu);
    sub_E7CC();
    sub_7668();
    sub_7668();
  }
  else
  {
    sub_E25C(v0[72], &qword_186B0);
  }

  sub_E760();
  v83();
  uint64_t v68 = v0[60];
  if (*(void *)(v47 + 16))
  {
    swift_retain();
    sub_11340();
    swift_release();
    sub_E704(v68);
    if (!v69)
    {
      v70 = *(void (**)(void))(v0[62] + 32);
      sub_EAF8();
      v70();
      sub_115F0();
      v71 = (void *)sub_11730();
      os_log_type_t v72 = sub_11810();
      if (sub_E7B0(v72))
      {
        v73 = (_WORD *)sub_E560();
        sub_E88C(v73);
        sub_E6AC(&dword_0, v74, v75, "Using precomputed suggestions from the intent");
        sub_7668();
      }

      sub_E7E8();
      sub_E760();
      v83();
      sub_EAF8();
      v70();
      v0[29] = v0[103];
      sub_6E94(&qword_18700);
      sub_EB30();
      swift_retain();
      v76 = (void *)swift_task_alloc();
      v0[112] = v76;
      void *v76 = v0;
      v76[1] = sub_9918;
      sub_E8CC();
      return SinkDispatcherProvider.init(suggestionDispatcherFactory:)(v77);
    }
  }
  else
  {
    sub_6ED8(v0[60], 1, 1, v0[61]);
  }
  sub_E25C(v0[60], &qword_186A8);
  v0[109] = *(void *)(v47 + 16);
  swift_retain();
  v79 = (void *)swift_task_alloc();
  v0[110] = v79;
  void *v79 = v0;
  v79[1] = sub_9618;
  sub_E8CC();
  return sub_C5F8();
}

uint64_t sub_9618()
{
  sub_E8E8();
  uint64_t v2 = *v1;
  sub_7590();
  *uint64_t v3 = v2;
  *uint64_t v3 = *v1;
  *(void *)(v2 + 888) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0) {
    swift_bridgeObjectRelease();
  }
  sub_E724();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_974C()
{
  uint64_t v1 = v0[39];
  (*(void (**)(void, void, void))(v0[62] + 32))(v0[66], v0[64], v0[61]);
  if (*(void *)(v1 + 16))
  {
    uint64_t v2 = v0[73];
    uint64_t v3 = v0[66];
    uint64_t v4 = v0[61];
    uint64_t v5 = v0[62];
    uint64_t v6 = v0[59];
    uint64_t v7 = v0[56];
    uint64_t v8 = v0[39];
    swift_retain();
    sub_11360();
    sub_11380();
    sub_11390();
    sub_6ED8(v2, 1, 1, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v6, v3, v4);
    sub_6ED8(v6, 0, 1, v4);
    sub_113A0();
    sub_EB30();
    uint64_t v9 = sub_11350();
    swift_release();
    *(void *)(v8 + 16) = v9;
    swift_release();
  }
  v0[29] = v0[103];
  sub_6E94(&qword_18700);
  sub_EB30();
  swift_retain();
  uint64_t v10 = (void *)swift_task_alloc();
  v0[112] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_9918;
  return SinkDispatcherProvider.init(suggestionDispatcherFactory:)(v0 + 29);
}

uint64_t sub_9918()
{
  sub_E8E8();
  uint64_t v2 = v1;
  sub_7518();
  uint64_t v4 = v3;
  uint64_t v5 = v3 + 16;
  uint64_t v6 = *v0;
  sub_7590();
  *uint64_t v7 = v6;
  *(void *)(v4 + 904) = v2;
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of SinkDispatcherProvider.getDispatcher()
                                        + async function pointer to dispatch thunk of SinkDispatcherProvider.getDispatcher());
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 912) = v8;
  *uint64_t v8 = v6;
  v8[1] = sub_9A40;
  return v10(v5);
}

uint64_t sub_9A40()
{
  sub_762C();
  sub_7518();
  uint64_t v1 = *v0;
  sub_7590();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_E724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_9B08()
{
  sub_DD9C(v0 + 16, v0 + 136, &qword_18708);
  if (*(void *)(v0 + 160))
  {
    uint64_t v37 = *(void *)(v0 + 664);
    uint64_t v38 = *(void *)(v0 + 672);
    uint64_t v1 = *(void *)(v0 + 656);
    uint64_t v2 = *(void *)(v0 + 592);
    uint64_t v3 = *(void *)(v0 + 568);
    uint64_t v35 = *(void *)(v0 + 448);
    uint64_t v36 = *(void *)(v0 + 648);
    sub_DBE4((long long *)(v0 + 136), v0 + 176);
    sub_7158((void *)(v0 + 176), *(void *)(v0 + 200));
    uint64_t v4 = sub_E7E8();
    v5(v4);
    sub_DD9C(v2, v3, &qword_186B0);
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
    v6(v37, v38, v36);
    int v7 = sub_701C(v3, 1, v35);
    uint64_t v8 = *(void *)(v0 + 648);
    if (v7 == 1)
    {
      uint64_t v9 = *(void *)(v0 + 632);
      uint64_t v10 = *(void *)(v0 + 568);
      (*(void (**)(void, void, void))(*(void *)(v0 + 432) + 104))(*(void *)(v0 + 440), enum case for InvocationType.siriHelp(_:), *(void *)(v0 + 424));
      uint64_t v11 = sub_EB24();
      ((void (*)(uint64_t))v6)(v11);
      sub_6ED8(v9, 0, 1, v8);
      sub_113D0();
      sub_E830();
      v12();
      sub_E25C(v10, &qword_186B0);
    }
    else
    {
      uint64_t v27 = *(void *)(v0 + 568);
      uint64_t v28 = *(void *)(v0 + 456);
      uint64_t v29 = *(void *)(v0 + 464);
      uint64_t v30 = *(void *)(v0 + 448);
      sub_E830();
      v31();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v29, v27, v30);
    }
    uint64_t v32 = (void *)swift_task_alloc();
    *(void *)(v0 + 920) = v32;
    *uint64_t v32 = v0;
    v32[1] = sub_9E90;
    sub_E898();
    return dispatch thunk of SuggestionsDispatcher.dispatch(suggestions:presentationContext:)();
  }
  else
  {
    sub_E25C(v0 + 136, &qword_18708);
    sub_115F0();
    uint64_t v13 = (void *)sub_11730();
    os_log_type_t v14 = sub_11820();
    if (sub_E7B0(v14))
    {
      unint64_t v15 = (_WORD *)sub_E560();
      sub_E88C(v15);
      sub_E6AC(&dword_0, v16, v17, "No dispatcher returned from factory!");
      sub_7668();
    }
    os_log_type_t v18 = *(void (**)(uint64_t))(v0 + 832);
    uint64_t v19 = *(void *)(v0 + 752);
    uint64_t v20 = *(void *)(v0 + 680);

    uint64_t v21 = sub_E7E8();
    v18(v21);
    sub_E784();
    uint64_t v22 = swift_retain();
    sub_B908(v22, v20, v19, (uint64_t)v18);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    *(void *)(v0 + 936) = sub_11440();
    sub_6E94(&qword_18710);
    sub_DB48();
    sub_117C0();
    sub_E898();
    return _swift_task_switch(v23, v24, v25);
  }
}

uint64_t sub_9E90()
{
  sub_7518();
  uint64_t v3 = v2;
  uint64_t v4 = *v1;
  sub_7590();
  *uint64_t v5 = v4;
  v3[116] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v7 = v3[62];
    uint64_t v6 = v3[63];
    uint64_t v8 = v3[61];
    uint64_t v10 = v3[57];
    uint64_t v9 = v3[58];
    uint64_t v11 = v3[56];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    uint64_t v12 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v3[118] = v12;
    v3[119] = (v7 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v12(v6, v8);
  }
  else
  {
    sub_E760();
    v13();
    sub_E864();
    v14();
  }
  sub_E724();
  return _swift_task_switch(v15, v16, v17);
}

uint64_t sub_A014()
{
  sub_EBD4();
  sub_719C(v2 + 176);
  sub_E784();
  uint64_t v4 = swift_retain();
  sub_B908(v4, v1, v0, v3);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  *(void *)(v2 + 936) = sub_11440();
  sub_6E94(&qword_18710);
  sub_DB48();
  uint64_t v6 = sub_117C0();
  return _swift_task_switch(sub_A0F0, v6, v5);
}

uint64_t sub_A0F0()
{
  sub_762C();
  sub_11330();
  swift_release();
  sub_E724();
  return _swift_task_switch(v0, v1, v2);
}

uint64_t sub_A15C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44)
{
  sub_E968();
  uint64_t v45 = (long long *)(v44 + 7);
  uint64_t v93 = (uint64_t)(v44 + 2);
  if (v44[10])
  {
    v91 = v44 + 12;
    sub_DBE4(v45, (uint64_t)(v44 + 12));
    sub_115F0();
    uint64_t v46 = sub_11730();
    os_log_type_t v47 = sub_11800();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)sub_E560();
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl(&dword_0, v46, v47, "found flow from dispatcher. Returning nextFlow", v48, 2u);
      sub_7668();
    }
    uint64_t v49 = (void (*)(uint64_t, uint64_t))v44[104];
    uint64_t v50 = v44[93];
    uint64_t v51 = v44[85];
    uint64_t v84 = v44[84];
    uint64_t v52 = v44[82];
    uint64_t v79 = v44[74];
    uint64_t v81 = v44[81];
    a29 = v44[66];
    uint64_t v54 = v44[61];
    uint64_t v53 = v44[62];

    v49(v50, v51);
    sub_7158(v91, v44[15]);
    sub_110C0();
    swift_release();
    sub_E25C(v93, &qword_18708);
    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(a29, v54);
    sub_E25C(v79, &qword_186B0);
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v84, v81);
    sub_719C((uint64_t)v91);
    sub_114E0();
    uint64_t v55 = (void *)sub_E814();
    sub_E4E4();

    swift_release();
    swift_release();
  }
  else
  {
    sub_E25C((uint64_t)v45, &qword_18720);
    sub_115F0();
    uint64_t v56 = sub_11730();
    os_log_type_t v57 = sub_11800();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = (_WORD *)sub_E560();
      sub_E9D8(v58);
      sub_E90C(&dword_0, v56, v59, "no flow was returned from the dispatcher");
      sub_7668();
    }
    v60 = (void (*)(uint64_t, uint64_t))v44[104];
    uint64_t v61 = v44[92];
    uint64_t v62 = v44[85];
    uint64_t v82 = v44[74];
    uint64_t v77 = v44[66];
    uint64_t v63 = v44[61];
    uint64_t v64 = v44[62];

    v60(v61, v62);
    sub_110D0();
    swift_release();
    sub_E25C(v93, &qword_18708);
    (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v77, v63);
    sub_E25C(v82, &qword_186B0);
    sub_E5D4();
    v65();
    sub_114E0();
    uint64_t v66 = (void *)sub_E814();
    sub_E4E4();

    swift_release();
    swift_release();
  }
  sub_E688();
  v67();
  sub_E3DC();
  uint64_t v78 = v44[60];
  uint64_t v80 = v44[59];
  uint64_t v83 = v44[58];
  uint64_t v85 = v44[55];
  uint64_t v86 = v44[52];
  uint64_t v87 = v44[49];
  uint64_t v88 = v44[48];
  uint64_t v89 = v44[47];
  uint64_t v90 = v44[46];
  uint64_t v92 = v44[44];
  uint64_t v94 = v44[42];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_E638();
  sub_EA44();
  return v69(v68, v69, v70, v71, v72, v73, v74, v75, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           v78,
           v80,
           v83,
           v85,
           v86,
           v87,
           v88,
           v89,
           v90,
           v92,
           v94,
           a41,
           a42,
           a43,
           a44);
}

uint64_t sub_A644(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void (*a37)(void, void),uint64_t a38,void *a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *a50,uint64_t a51,uint64_t a52)
{
  sub_E968();
  a51 = v55;
  a52 = v56;
  a50 = v53;
  os_log_type_t v57 = v53 + 28;
  uint64_t v58 = v53[111];
  uint64_t v59 = (void (*)(void, void))v53[52];
  uint64_t v60 = v53[50];
  v53[32] = v58;
  swift_errorRetain();
  uint64_t v61 = sub_6E94(&qword_18690);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    swift_errorRelease();
    sub_115F0();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v70 = sub_11730();
    os_log_type_t v71 = sub_11820();
    os_log_type_enabled(v70, v71);
    sub_EBC0();
    if (v72)
    {
      a37 = v59;
      a38 = v52;
      a36 = v60;
      sub_E694();
      a35 = v54;
      uint64_t v54 = sub_E670();
      sub_E730(v54, 4.8149e-34);
      uint64_t v73 = sub_11770();
      uint64_t v75 = sub_D33C(v73, v74, &a40);
      sub_E984(v75);
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      sub_EB88(&dword_0, v76, v77, "Unable to execute sirisuggestions: %s");
      sub_E7CC();
      sub_7668();
      sub_7668();

      v59(v60, a35);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();

      v59(v60, v54);
    }
    sub_E5FC();
    swift_errorRelease();
    sub_E25C((uint64_t)(v53 + 28), &qword_186B0);
    sub_E5D4();
    v78();
    sub_114E0();
    uint64_t v79 = (void *)sub_EBA8();
    sub_E644();

    swift_release();
    swift_release();
    uint64_t v80 = *(void (**)(uint64_t, void *))(v54 + 8);
    uint64_t v81 = (uint64_t)v70;
    uint64_t v82 = a39;
LABEL_10:
    v80(v81, v82);
    goto LABEL_11;
  }
  uint64_t v62 = sub_EA08();
  if (v63(v62) != enum case for SiriHelpDispatcherErrors.notEnoughSuggestions(_:))
  {
    uint64_t v68 = sub_EC20();
    v69(v68);
    goto LABEL_6;
  }
  sub_EC00();
  sub_DD9C((uint64_t)(v53 + 32), (uint64_t)v59, &qword_186B0);
  int v64 = sub_701C((uint64_t)v59, 1, v60);
  uint64_t v65 = v53[70];
  if (v64 == 1)
  {
    uint64_t v66 = sub_E25C(v53[70], &qword_186B0);
    uint64_t v67 = 1;
  }
  else
  {
    uint64_t v58 = v53[56];
    uint64_t v92 = v53[57];
    sub_113F0();
    uint64_t v52 = v92 + 8;
    sub_E5D4();
    uint64_t v66 = v93();
    uint64_t v67 = 0;
  }
  sub_E83C(v66, v67);
  uint64_t v94 = sub_E8F4();
  v95(v94);
  sub_EA60();
  v96 = &qword_186D8;
  sub_DD9C((uint64_t)v59, v61, &qword_186D8);
  sub_DD9C(v60, v65, &qword_186D8);
  int v97 = sub_701C(v61, 1, v58);
  v98 = (uint64_t *)v53[53];
  if (v97 == 1)
  {
    uint64_t v59 = (void (*)(void, void))v53[49];
    sub_E25C(v53[48], &qword_186D8);
    sub_E25C((uint64_t)v59, &qword_186D8);
    sub_E704(v65);
    if (!v99) {
      goto LABEL_22;
    }
    sub_E25C(v53[44], &qword_186D8);
  }
  else
  {
    sub_DD9C(v53[44], v53[47], &qword_186D8);
    sub_E704(v65);
    if (v99)
    {
      uint64_t v52 = v53[54];
      v98 = (uint64_t *)v53[49];
      uint64_t v59 = (void (*)(void, void))v53[47];
      sub_E25C(v53[48], &qword_186D8);
      sub_E25C((uint64_t)v98, &qword_186D8);
      uint64_t v100 = sub_EAB0();
      v101(v100);
LABEL_22:
      sub_E25C(v53[44], &qword_186D0);
LABEL_23:
      sub_EAD8();
      sub_DD9C((uint64_t)v98, (uint64_t)v59, &qword_186B0);
      v102 = sub_11730();
      v103 = (void (*)(uint64_t))sub_11800();
      if (os_log_type_enabled(v102, (os_log_type_t)v103))
      {
        a39 = v57;
        uint64_t v104 = v53[69];
        v96 = (uint64_t *)v53[68];
        uint64_t v105 = v53[56];
        v106 = (uint8_t *)sub_E694();
        a40 = sub_E670();
        *(_DWORD *)v106 = 136315138;
        sub_DD9C(v104, (uint64_t)v96, &qword_186B0);
        if (sub_701C((uint64_t)v96, 1, v105) == 1)
        {
          uint64_t v107 = sub_E25C(v53[68], &qword_186B0);
          uint64_t v108 = 1;
        }
        else
        {
          v96 = (uint64_t *)v53[56];
          uint64_t v127 = v53[57];
          sub_113F0();
          uint64_t v52 = v127 + 8;
          sub_E5D4();
          uint64_t v107 = v128();
          uint64_t v108 = 0;
        }
        uint64_t v129 = sub_E578(v107, v108);
        uint64_t v131 = sub_D33C(v129, v130, &a40);
        sub_E9E4(v131);
        swift_bridgeObjectRelease();
        sub_E25C(v105, &qword_186B0);
        _os_log_impl(&dword_0, v102, (os_log_type_t)v103, "No suggestions for invocation type: %s. Marking flow as complete", v106, 0xCu);
        swift_arrayDestroy();
        sub_7668();
        sub_7668();

        ((void (*)(void, uint64_t))v52)(a37, a36);
      }
      else
      {
        uint64_t v109 = sub_E940();
        sub_E25C(v109, &qword_186B0);

        uint64_t v110 = sub_EA20();
        v103(v110);
      }
      sub_E6CC();
      sub_E25C((uint64_t)v96, &qword_186B0);
      uint64_t v132 = sub_EA2C();
      v133(v132);
      swift_errorRelease();
      sub_114E0();
      v134 = (void *)sub_EBA8();
      sub_E644();

      swift_release();
      swift_release();
      uint64_t v81 = sub_EA20();
      goto LABEL_10;
    }
    uint64_t v111 = sub_E528();
    v112(v111);
    sub_DED0(&qword_186F8, 255, (void (*)(uint64_t))&type metadata accessor for InvocationType);
    char v113 = sub_E9A8();
    v114 = *(void (**)(void))(v52 + 8);
    v52 += 8;
    sub_E5D4();
    v114();
    v98 = &qword_186D8;
    sub_E25C(v61, &qword_186D8);
    sub_E25C(v60, &qword_186D8);
    sub_E5D4();
    v114();
    os_log_type_t v57 = a39;
    sub_E25C((uint64_t)(v53 + 28), &qword_186D8);
    if ((v113 & 1) == 0) {
      goto LABEL_23;
    }
  }
  sub_115F0();
  v115 = sub_11730();
  os_log_type_t v116 = sub_11800();
  if (os_log_type_enabled(v115, v116))
  {
    v117 = (_WORD *)sub_E560();
    sub_E9D8(v117);
    sub_E90C(&dword_0, v115, v118, "Unable to render suggestions as there isnt enough for the sirihelp experience. Falling back to server");
    sub_7668();
  }
  sub_E480();
  ((void (*)(uint64_t, uint64_t *))v52)(v61, &qword_186D8);
  uint64_t v119 = sub_E870();
  v120(v119);
  sub_110E0();
  uint64_t v121 = sub_E928();
  v122(v121);
  sub_E25C(a32, &qword_186B0);
  uint64_t v123 = sub_EC34();
  v124(v123);
  swift_errorRelease();
  sub_114E0();
  v125 = (void *)sub_E814();
  sub_E4E4();

  swift_release();
  swift_release();
  sub_E688();
  v126();
LABEL_11:
  sub_E2D0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_E638();
  sub_EA44();
  return v84(v83, v84, v85, v86, v87, v88, v89, v90, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44);
}

uint64_t sub_AEBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52)
{
  sub_E968();
  a51 = v54;
  a52 = v55;
  a50 = v52;
  uint64_t v56 = v52 + 224;
  os_log_type_t v57 = (void (*)(uint64_t, uint64_t))(v52 + 256);
  uint64_t v58 = *(void *)(v52 + 952);
  uint64_t v59 = *(void (**)(uint64_t, uint64_t))(v52 + 944);
  uint64_t v60 = *(void *)(v52 + 528);
  uint64_t v61 = *(void *)(v52 + 488);
  swift_release();
  sub_E25C(v52 + 16, &qword_18708);
  v59(v60, v61);
  sub_719C(v52 + 176);
  uint64_t v62 = *(void *)(v52 + 928);
  uint64_t v63 = *(void *)(v52 + 416);
  uint64_t v64 = *(void *)(v52 + 400);
  *(void *)(v52 + 256) = v62;
  swift_errorRetain();
  uint64_t v65 = sub_6E94(&qword_18690);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    swift_errorRelease();
    sub_115F0();
    swift_errorRetain();
    swift_errorRetain();
    unint64_t v74 = sub_11730();
    os_log_type_t v75 = sub_11820();
    os_log_type_enabled(v74, v75);
    sub_EBC0();
    if (v76)
    {
      a37 = v52 + 256;
      a38 = v58;
      a36 = v64;
      sub_E694();
      a35 = v53;
      uint64_t v53 = sub_E670();
      sub_E730(v53, 4.8149e-34);
      uint64_t v77 = sub_11770();
      uint64_t v79 = sub_D33C(v77, v78, &a40);
      sub_E984(v79);
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      sub_EB88(&dword_0, v80, v81, "Unable to execute sirisuggestions: %s");
      sub_E7CC();
      sub_7668();
      sub_7668();

      ((void (*)(uint64_t, uint64_t))(v52 + 256))(v64, a35);
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();

      v57(v64, v53);
    }
    sub_E5FC();
    swift_errorRelease();
    sub_E25C(v52 + 224, &qword_186B0);
    sub_E5D4();
    v82();
    sub_114E0();
    uint64_t v83 = (void *)sub_EBA8();
    sub_E644();

    swift_release();
    swift_release();
    uint64_t v84 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
    uint64_t v85 = (uint64_t)v74;
    uint64_t v86 = a39;
LABEL_10:
    v84(v85, v86);
    goto LABEL_11;
  }
  uint64_t v66 = sub_EA08();
  if (v67(v66) != enum case for SiriHelpDispatcherErrors.notEnoughSuggestions(_:))
  {
    uint64_t v72 = sub_EC20();
    v73(v72);
    goto LABEL_6;
  }
  sub_EC00();
  sub_DD9C(v63, v52 + 256, &qword_186B0);
  int v68 = sub_701C(v52 + 256, 1, v64);
  uint64_t v69 = *(void *)(v52 + 560);
  if (v68 == 1)
  {
    uint64_t v70 = sub_E25C(*(void *)(v52 + 560), &qword_186B0);
    uint64_t v71 = 1;
  }
  else
  {
    uint64_t v62 = *(void *)(v52 + 448);
    uint64_t v96 = *(void *)(v52 + 456);
    sub_113F0();
    uint64_t v58 = v96 + 8;
    sub_E5D4();
    uint64_t v70 = v97();
    uint64_t v71 = 0;
  }
  sub_E83C(v70, v71);
  uint64_t v98 = sub_E8F4();
  v99(v98);
  sub_EA60();
  uint64_t v100 = &qword_186D8;
  sub_DD9C(v52 + 256, v65, &qword_186D8);
  sub_DD9C(v64, v69, &qword_186D8);
  int v101 = sub_701C(v65, 1, v62);
  v102 = *(uint64_t **)(v52 + 424);
  if (v101 == 1)
  {
    os_log_type_t v57 = *(void (**)(uint64_t, uint64_t))(v52 + 392);
    sub_E25C(*(void *)(v52 + 384), &qword_186D8);
    sub_E25C((uint64_t)v57, &qword_186D8);
    sub_E704(v69);
    if (!v103) {
      goto LABEL_22;
    }
    sub_E25C(*(void *)(v52 + 352), &qword_186D8);
  }
  else
  {
    sub_DD9C(*(void *)(v52 + 352), *(void *)(v52 + 376), &qword_186D8);
    sub_E704(v69);
    if (v103)
    {
      uint64_t v58 = *(void *)(v52 + 432);
      v102 = *(uint64_t **)(v52 + 392);
      os_log_type_t v57 = *(void (**)(uint64_t, uint64_t))(v52 + 376);
      sub_E25C(*(void *)(v52 + 384), &qword_186D8);
      sub_E25C((uint64_t)v102, &qword_186D8);
      uint64_t v104 = sub_EAB0();
      v105(v104);
LABEL_22:
      sub_E25C(*(void *)(v52 + 352), &qword_186D0);
LABEL_23:
      sub_EAD8();
      sub_DD9C((uint64_t)v102, (uint64_t)v57, &qword_186B0);
      v106 = sub_11730();
      uint64_t v107 = (void (*)(uint64_t))sub_11800();
      if (os_log_type_enabled(v106, (os_log_type_t)v107))
      {
        a39 = v56;
        uint64_t v108 = *(void *)(v52 + 552);
        uint64_t v100 = *(uint64_t **)(v52 + 544);
        uint64_t v109 = *(void *)(v52 + 448);
        uint64_t v110 = (uint8_t *)sub_E694();
        a40 = sub_E670();
        *(_DWORD *)uint64_t v110 = 136315138;
        sub_DD9C(v108, (uint64_t)v100, &qword_186B0);
        if (sub_701C((uint64_t)v100, 1, v109) == 1)
        {
          uint64_t v111 = sub_E25C(*(void *)(v52 + 544), &qword_186B0);
          uint64_t v112 = 1;
        }
        else
        {
          uint64_t v100 = *(uint64_t **)(v52 + 448);
          uint64_t v131 = *(void *)(v52 + 456);
          sub_113F0();
          uint64_t v58 = v131 + 8;
          sub_E5D4();
          uint64_t v111 = v132();
          uint64_t v112 = 0;
        }
        uint64_t v133 = sub_E578(v111, v112);
        uint64_t v135 = sub_D33C(v133, v134, &a40);
        sub_E9E4(v135);
        swift_bridgeObjectRelease();
        sub_E25C(v109, &qword_186B0);
        _os_log_impl(&dword_0, v106, (os_log_type_t)v107, "No suggestions for invocation type: %s. Marking flow as complete", v110, 0xCu);
        swift_arrayDestroy();
        sub_7668();
        sub_7668();

        ((void (*)(uint64_t, uint64_t))v58)(a37, a36);
      }
      else
      {
        uint64_t v113 = sub_E940();
        sub_E25C(v113, &qword_186B0);

        uint64_t v114 = sub_EA20();
        v107(v114);
      }
      sub_E6CC();
      sub_E25C((uint64_t)v100, &qword_186B0);
      uint64_t v136 = sub_EA2C();
      v137(v136);
      swift_errorRelease();
      sub_114E0();
      v138 = (void *)sub_EBA8();
      sub_E644();

      swift_release();
      swift_release();
      uint64_t v85 = sub_EA20();
      goto LABEL_10;
    }
    uint64_t v115 = sub_E528();
    v116(v115);
    sub_DED0(&qword_186F8, 255, (void (*)(uint64_t))&type metadata accessor for InvocationType);
    char v117 = sub_E9A8();
    uint64_t v118 = *(void (**)(void))(v58 + 8);
    v58 += 8;
    sub_E5D4();
    v118();
    v102 = &qword_186D8;
    sub_E25C(v65, &qword_186D8);
    sub_E25C(v64, &qword_186D8);
    sub_E5D4();
    v118();
    uint64_t v56 = a39;
    sub_E25C(v52 + 224, &qword_186D8);
    if ((v117 & 1) == 0) {
      goto LABEL_23;
    }
  }
  sub_115F0();
  uint64_t v119 = sub_11730();
  os_log_type_t v120 = sub_11800();
  if (os_log_type_enabled(v119, v120))
  {
    uint64_t v121 = (_WORD *)sub_E560();
    sub_E9D8(v121);
    sub_E90C(&dword_0, v119, v122, "Unable to render suggestions as there isnt enough for the sirihelp experience. Falling back to server");
    sub_7668();
  }
  sub_E480();
  ((void (*)(uint64_t, uint64_t *))v58)(v65, &qword_186D8);
  uint64_t v123 = sub_E870();
  v124(v123);
  sub_110E0();
  uint64_t v125 = sub_E928();
  v126(v125);
  sub_E25C(a32, &qword_186B0);
  uint64_t v127 = sub_EC34();
  v128(v127);
  swift_errorRelease();
  sub_114E0();
  uint64_t v129 = (void *)sub_E814();
  sub_E4E4();

  swift_release();
  swift_release();
  sub_E688();
  v130();
LABEL_11:
  sub_E2D0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_E638();
  sub_EA44();
  return v88(v87, v88, v89, v90, v91, v92, v93, v94, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44);
}

uint64_t sub_B778(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6E94(&qword_18668);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_11410();
  __chkstk_darwin(v7);
  (*(void (**)(char *, uint64_t))(v9 + 16))((char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  uint64_t v10 = sub_10FE0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v6, a2, v10);
  sub_6ED8((uint64_t)v6, 0, 1, v10);
  return sub_11400();
}

uint64_t sub_B908(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = a4;
  uint64_t v5 = sub_6E94(&qword_18650);
  uint64_t v6 = sub_E664(v5);
  __chkstk_darwin(v6);
  sub_75C4();
  uint64_t v9 = v8 - v7;
  uint64_t v10 = sub_6E94(&qword_18668);
  uint64_t v11 = sub_E664(v10);
  __chkstk_darwin(v11);
  sub_75C4();
  uint64_t v14 = v13 - v12;
  uint64_t v15 = sub_10FE0();
  sub_E3C4();
  uint64_t v17 = v16;
  uint64_t v19 = *(void *)(v18 + 64);
  uint64_t v21 = __chkstk_darwin(v20);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v30 - v22;
  sub_10FD0();
  if (sub_701C(v14, 1, v15) == 1) {
    return sub_E25C(v14, &qword_18668);
  }
  uint64_t v25 = *(void (**)(void))(v17 + 32);
  sub_EAF8();
  v25();
  if (a1)
  {
    uint64_t v26 = sub_117E0();
    sub_7650(v9, v27, v28, v26);
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))((char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v23, v15);
    uint64_t v29 = (void *)swift_allocObject();
    v29[2] = 0;
    v29[3] = 0;
    uint64_t v30 = v9;
    v29[4] = v31;
    v29[5] = a1;
    sub_EAF8();
    v25();
    swift_retain();
    swift_retain_n();
    sub_C488(v30, (uint64_t)&unk_18930, (uint64_t)v29);
    swift_release();
    swift_release();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v23, v15);
}

uint64_t sub_BB80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[20] = a5;
  v6[21] = a6;
  v6[19] = a4;
  uint64_t v7 = sub_11740();
  v6[22] = v7;
  v6[23] = *(void *)(v7 - 8);
  v6[24] = swift_task_alloc();
  v6[25] = swift_task_alloc();
  uint64_t v8 = sub_11260();
  v6[26] = v8;
  v6[27] = *(void *)(v8 - 8);
  v6[28] = swift_task_alloc();
  uint64_t v9 = sub_115E0();
  v6[29] = v9;
  v6[30] = *(void *)(v9 - 8);
  v6[31] = swift_task_alloc();
  v6[32] = swift_task_alloc();
  return _swift_task_switch(sub_BD1C, 0, 0);
}

uint64_t sub_BD1C()
{
  uint64_t v34 = v0;
  if (!*(void *)(v0 + 152))
  {
    *(_OWORD *)(v0 + 96) = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
    *(_OWORD *)(v0 + 80) = 0u;
    goto LABEL_6;
  }
  uint64_t v1 = sub_11360();
  uint64_t v2 = sub_11560();
  sub_6618(v2, v3, v1, (_OWORD *)(v0 + 80));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 104))
  {
LABEL_6:
    sub_E25C(v0 + 80, &qword_18938);
    goto LABEL_7;
  }
  sub_6E94(&qword_18950);
  sub_6E94(&qword_18958);
  sub_E7E8();
  if (swift_dynamicCast())
  {
    uint64_t v4 = *(void **)(v0 + 144);
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v4 = 0;
LABEL_8:
  (*(void (**)(void, void, void))(*(void *)(v0 + 216) + 104))(*(void *)(v0 + 224), enum case for EducationalSuggestions.suggestHelp(_:), *(void *)(v0 + 208));
  sub_11250();
  sub_E5D4();
  v5();
  if (v4)
  {
    if (v4[2])
    {
      uint64_t v6 = v4[4];
      uint64_t v7 = v4[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_6E94(&qword_18948);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_11DC0;
      sub_112C0();
      sub_112B0();
      uint64_t v9 = sub_11550();
      uint64_t v11 = v10;
      swift_release();
      *(void *)(inited + 32) = v9;
      *(void *)(inited + 40) = v11;
      *(void *)(inited + 48) = v6;
      *(void *)(inited + 56) = v7;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  sub_11750();
  uint64_t v13 = *(void *)(v0 + 248);
  uint64_t v12 = *(void *)(v0 + 256);
  uint64_t v15 = *(void *)(v0 + 232);
  uint64_t v14 = *(void *)(v0 + 240);
  sub_115C0();
  sub_115F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v13, v12, v15);
  uint64_t v16 = sub_11730();
  os_log_type_t v17 = sub_11810();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v19 = *(void *)(v0 + 240);
  uint64_t v20 = *(void *)(v0 + 200);
  uint64_t v22 = *(void *)(v0 + 176);
  uint64_t v21 = *(void *)(v0 + 184);
  if (v18)
  {
    uint64_t v32 = *(void *)(v0 + 200);
    log = v16;
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = sub_E670();
    *(_DWORD *)uint64_t v23 = 136315138;
    uint64_t v24 = sub_115D0();
    *(void *)(v0 + 136) = sub_D33C(v24, v25, &v33);
    sub_11840();
    swift_bridgeObjectRelease();
    uint64_t v26 = *(void (**)(void))(v19 + 8);
    sub_E830();
    v26();
    _os_log_impl(&dword_0, log, v17, "Submitting engagement for logging id: '%s'", v23, 0xCu);
    sub_EA8C();
    sub_7668();
    sub_7668();

    uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v27(v32, v22);
  }
  else
  {
    uint64_t v26 = *(void (**)(void))(v19 + 8);
    sub_E830();
    v26();

    uint64_t v27 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v27(v20, v22);
  }
  *(void *)(v0 + 264) = v27;
  *(void *)(v0 + 272) = v26;
  uint64_t v28 = (void *)swift_task_alloc();
  *(void *)(v0 + 280) = v28;
  *uint64_t v28 = v0;
  v28[1] = sub_C108;
  sub_E898();
  return SiriSuggestionsFacade.submitEngagement(for:with:)();
}

uint64_t sub_C108()
{
  sub_762C();
  sub_7518();
  uint64_t v2 = *v1;
  sub_7590();
  *uint64_t v3 = v2;
  *(void *)(v4 + 288) = v0;
  swift_task_dealloc();
  sub_E724();
  return _swift_task_switch(v5, v6, v7);
}

uint64_t sub_C1E8()
{
  sub_EBD4();
  sub_E688();
  v0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_E638();
  return v1();
}

uint64_t sub_C294()
{
  sub_E688();
  v2();
  sub_115F0();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = sub_11730();
  os_log_type_t v4 = sub_11820();
  if (sub_E5E0(v4))
  {
    uint64_t v5 = (uint8_t *)sub_E694();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    swift_errorRetain();
    uint64_t v7 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 128) = v7;
    sub_11840();
    *uint64_t v6 = v7;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v3, v1, "Failed to submit engagement with Siri Help due to error: %@", v5, 0xCu);
    sub_6E94(&qword_18940);
    sub_EA8C();
    sub_7668();
    sub_7668();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  sub_E760();
  v8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_E638();
  return v9();
}

uint64_t sub_C488(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_117E0();
  if (sub_701C(a1, 1, v6) == 1)
  {
    sub_E25C(a1, &qword_18650);
  }
  else
  {
    sub_117D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_117C0();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_C5F8()
{
  sub_762C();
  v0[5] = v1;
  v0[6] = v2;
  v0[3] = v3;
  v0[4] = v4;
  v0[2] = v5;
  uint64_t v6 = sub_11740();
  v0[7] = v6;
  sub_E2B8(v6);
  v0[8] = v7;
  v0[9] = sub_E76C();
  sub_E724();
  return _swift_task_switch(v8, v9, v10);
}

uint64_t sub_C68C()
{
  sub_E8E8();
  sub_115F0();
  uint64_t v1 = (void *)sub_11730();
  os_log_type_t v2 = sub_11800();
  if (sub_E7B0(v2))
  {
    uint64_t v3 = (_WORD *)sub_E560();
    sub_E88C(v3);
    sub_E6AC(&dword_0, v4, v5, "No preGeneration suggestions found on intent. Executing suggestions service...");
    sub_7668();
  }

  sub_E864();
  v6();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[10] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_C794;
  uint64_t v8 = v0[5];
  uint64_t v9 = v0[3];
  uint64_t v10 = v0[4];
  uint64_t v11 = v0[2];
  return SiriSuggestionsFacade.getNextSuggestions(requestId:intentProperties:)(v11, v9, v10, v8);
}

uint64_t sub_C794()
{
  sub_762C();
  sub_7518();
  uint64_t v1 = *v0;
  sub_7590();
  *os_log_type_t v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  sub_E638();
  return v3();
}

uint64_t SiriSuggestionsFlow.execute(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = sub_6E94(&qword_18650);
  uint64_t v7 = sub_E664(v6);
  __chkstk_darwin(v7);
  sub_E8B4();
  uint64_t v8 = sub_117E0();
  sub_7650(v3, v9, v10, v8);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v2;
  v11[5] = a1;
  v11[6] = a2;
  swift_retain();
  swift_retain();
  sub_C488(v3, (uint64_t)&unk_18730, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_C948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[2] = a5;
  v6[3] = a6;
  uint64_t v7 = sub_110F0();
  v6[4] = v7;
  v6[5] = *(void *)(v7 - 8);
  v6[6] = swift_task_alloc();
  uint64_t v8 = (void *)swift_task_alloc();
  v6[7] = v8;
  *uint64_t v8 = v6;
  v8[1] = sub_CA44;
  return SiriSuggestionsFlow.execute()();
}

uint64_t sub_CA44()
{
  sub_762C();
  sub_7518();
  uint64_t v1 = *v0;
  sub_7590();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_E724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_CB0C()
{
  sub_E8E8();
  (*(void (**)(void))(v0 + 16))(*(void *)(v0 + 48));
  sub_E864();
  v1();
  swift_task_dealloc();
  sub_E638();
  return v2();
}

uint64_t SiriSuggestionsFlow.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  sub_719C(v0 + 40);
  swift_release();
  return v0;
}

uint64_t SiriSuggestionsFlow.__deallocating_deinit()
{
  SiriSuggestionsFlow.deinit();

  return _swift_deallocClassInstance(v0, 96, 7);
}

uint64_t sub_CC0C()
{
  return sub_11200();
}

uint64_t sub_CC30()
{
  return sub_11210();
}

void (*sub_CC54(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_111F0();
  return sub_CCC8;
}

void sub_CCC8(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_CD10(uint64_t a1)
{
  return SiriSuggestionsFlow.on(input:)(a1) & 1;
}

uint64_t sub_CD38(uint64_t a1, uint64_t a2)
{
  return SiriSuggestionsFlow.execute(completion:)(a1, a2);
}

uint64_t sub_CD5C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_CDF8;
  return SiriSuggestionsFlow.execute()();
}

uint64_t sub_CDF8()
{
  sub_762C();
  sub_7518();
  uint64_t v1 = *v0;
  sub_7590();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_E638();
  return v3();
}

uint64_t sub_CEB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for SiriSuggestionsFlow();

  return Flow<>.exitValue.getter(v3, a2);
}

uint64_t sub_CEF0()
{
  swift_beginAccess();
  sub_DD9C(v0 + 16, (uint64_t)v10, &qword_18908);
  uint64_t v1 = v11;
  if (v11)
  {
    sub_7158(v10, v11);
    sub_E3C4();
    uint64_t v3 = v2;
    __chkstk_darwin(v4);
    sub_75C4();
    (*(void (**)(uint64_t))(v3 + 16))(v6 - v5);
    sub_E25C((uint64_t)v10, &qword_18908);
    sub_E7E8();
    sub_111E0();
    uint64_t v7 = sub_EA20();
    v8(v7);
    sub_111A0();
    swift_release();
    uint64_t v1 = sub_11640();
    swift_release();
  }
  else
  {
    sub_E25C((uint64_t)v10, &qword_18908);
  }
  return v1;
}

uint64_t sub_D04C()
{
  sub_E25C(v0 + 16, &qword_18908);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t sub_D08C()
{
  return sub_CEF0();
}

uint64_t sub_D0B0(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_D0C0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_D0FC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_D1D8;
  return v6(a1);
}

uint64_t sub_D1D8()
{
  sub_762C();
  sub_7518();
  uint64_t v1 = *v0;
  sub_7590();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_E638();
  return v3();
}

uint64_t sub_D29C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_D2C4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_D33C(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_11840();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_D33C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  sub_E724();
  uint64_t v9 = sub_D40C(v6, v7, v8, 1, a1, a2);
  uint64_t v10 = v15[0];
  if (v9)
  {
    uint64_t v11 = v9;
    ObjectType = (void *)swift_getObjectType();
    v15[0] = v11;
    uint64_t v12 = *a3;
    if (*a3)
    {
      sub_72A4((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v15[0] = a1;
    v15[1] = a2;
    uint64_t v13 = *a3;
    if (*a3)
    {
      sub_72A4((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_719C((uint64_t)v15);
  return v10;
}

uint64_t sub_D40C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_D564((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_11850();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_D63C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_11870();
    if (!v8)
    {
      uint64_t result = sub_11880();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_D564(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_11890();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_D63C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_D6D4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_D8B0(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_D8B0((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_D6D4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_117A0();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_D848(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_11860();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_11890();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_11880();
  __break(1u);
  return result;
}

void *sub_D848(uint64_t a1, uint64_t a2)
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
  sub_6E94(&qword_18960);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_D8B0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_6E94(&qword_18960);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_DA60(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_D988(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_D988(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_11890();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_DA60(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_11890();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unsigned char **sub_DAF0(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t type metadata accessor for SiriSuggestionsFlow()
{
  return self;
}

uint64_t sub_DB24(uint64_t a1)
{
  return sub_B778(a1, *(void *)(v1 + 16));
}

unint64_t sub_DB48()
{
  unint64_t result = qword_18718;
  if (!qword_18718)
  {
    sub_DB9C(&qword_18710);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18718);
  }
  return result;
}

uint64_t sub_DB9C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_DBE4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_DBFC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_DC44()
{
  sub_EBD4();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_E958(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_E2B4;
  uint64_t v3 = sub_E7F4();
  return sub_C948(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_DCE8(uint64_t a1, uint64_t a2)
{
  return sub_DED0(qword_18738, a2, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsFlow);
}

uint64_t sub_DD30(uint64_t a1, uint64_t a2)
{
  return sub_DED0(&qword_186E0, a2, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsFlow);
}

uint64_t type metadata accessor for EnvironmentRequestIdProvider()
{
  return self;
}

uint64_t sub_DD9C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_6E94(a3);
  sub_E9CC();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t *sub_DDFC(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_DE60(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  sub_E9CC();
  (*v3)(a2);
  return a2;
}

uint64_t sub_DEC0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_DED0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_DF18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6E94(&qword_18908);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_DF80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_6E94(&qword_18908);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_DFE8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_E020()
{
  sub_E8E8();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)sub_E958(v4);
  *uint64_t v5 = v6;
  v5[1] = sub_CDF8;
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&dword_18918 + dword_18918);
  return v7(v2, v3);
}

uint64_t sub_E0CC()
{
  sub_10FE0();
  sub_E3C4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 48) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  sub_E864();
  v8();

  return _swift_deallocObject(v0, v6, v7);
}

uint64_t sub_E180()
{
  sub_EBD4();
  sub_10FE0();
  uint64_t v0 = swift_task_alloc();
  uint64_t v1 = (void *)sub_E958(v0);
  *uint64_t v1 = v2;
  v1[1] = sub_E2B4;
  uint64_t v3 = sub_E7F4();
  return sub_BB80(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_E25C(uint64_t a1, uint64_t *a2)
{
  sub_6E94(a2);
  sub_E9CC();
  sub_E688();
  v3();
  return a1;
}

uint64_t sub_E2B8(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_E2D0()
{
  uint64_t v3 = v0[55];
  *(void *)(v1 - 160) = v0[58];
  *(void *)(v1 - 152) = v3;
  uint64_t v4 = v0[49];
  *(void *)(v1 - 144) = v0[52];
  *(void *)(v1 - 136) = v4;
  uint64_t v5 = v0[47];
  *(void *)(v1 - 128) = v0[48];
  *(void *)(v1 - 120) = v5;
  uint64_t v6 = v0[44];
  *(void *)(v1 - 112) = v0[46];
  *(void *)(v1 - 104) = v6;
  *(void *)(v1 - 96) = v0[42];
  return swift_task_dealloc();
}

uint64_t sub_E3DC()
{
  return *(void *)(v0 + 808);
}

void sub_E480()
{
  uint64_t v4 = v1[103];
  *(void *)(v2 - 120) = v1[102];
  *(void *)(v2 - 112) = v4;
  uint64_t v5 = v1[101];
  uint64_t v6 = v1[99];
  *(void *)(v2 - 104) = v1[100];
  *(void *)(v2 - 96) = v6;
  *(void *)(v2 - 136) = v1[84];
  *(void *)(v2 - 128) = v5;
  uint64_t v7 = v1[81];
  *(void *)(v2 - 152) = v1[74];
  *(void *)(v2 - 144) = v7;
}

uint64_t sub_E4E4()
{
  return sub_11610();
}

uint64_t sub_E50C()
{
  return swift_task_alloc();
}

uint64_t sub_E528()
{
  uint64_t v3 = *(void *)(v0 + 440);
  *(void *)(v2 - 96) = v1;
  return v3;
}

uint64_t sub_E560()
{
  return swift_slowAlloc();
}

uint64_t sub_E578(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2[105];
  *(void *)(v3 - 112) = v2[88];
  *(void *)(v3 - 104) = v4;
  *(void *)(v3 - 120) = v2[85];
  sub_6ED8(v2[46], a2, 1, v2[53]);
  return sub_11770();
}

BOOL sub_E5E0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_E5FC()
{
  *(void *)(v1 - 96) = *(void *)(v0 + 792);
  return sub_110D0();
}

uint64_t sub_E638()
{
  return v0 + 8;
}

uint64_t sub_E644()
{
  return sub_11610();
}

uint64_t sub_E664(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_E670()
{
  return swift_slowAlloc();
}

uint64_t sub_E694()
{
  return swift_slowAlloc();
}

void sub_E6AC(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t sub_E6CC()
{
  return sub_110D0();
}

uint64_t sub_E704(uint64_t a1)
{
  return sub_701C(a1, 1, v1);
}

uint64_t sub_E730(uint64_t a1, float a2)
{
  *(void *)(v6 - 96) = v5;
  *(void *)(v6 - 88) = a1;
  *os_log_type_t v4 = a2;
  *(void *)(v6 - 136) = v4 + 1;
  *uint64_t v3 = v2;
  return swift_errorRetain();
}

uint64_t sub_E76C()
{
  return swift_task_alloc();
}

uint64_t sub_E784()
{
  return swift_retain();
}

BOOL sub_E7B0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_E7CC()
{
  return swift_arrayDestroy();
}

uint64_t sub_E7E8()
{
  return v0;
}

uint64_t sub_E7F4()
{
  return v0;
}

uint64_t sub_E814()
{
  return sub_11620();
}

uint64_t sub_E83C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + 392);
  uint64_t v5 = *(void *)(v2 + 424);
  return sub_6ED8(v4, a2, 1, v5);
}

uint64_t sub_E870()
{
  return v0;
}

_WORD *sub_E88C(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t sub_E8F4()
{
  return v0;
}

void sub_E90C(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v5, a4, v4, 2u);
}

uint64_t sub_E928()
{
  return v0;
}

uint64_t sub_E940()
{
  return *(void *)(v0 + 552);
}

uint64_t sub_E958(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t sub_E984(uint64_t a1)
{
  *uint64_t v1 = a1;
  return sub_11840();
}

uint64_t sub_E9A8()
{
  return sub_11760();
}

_WORD *sub_E9D8(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t sub_E9E4(uint64_t a1)
{
  *(void *)(v1 + 224) = a1;
  return sub_11840();
}

uint64_t sub_EA08()
{
  return *(void *)(v0 + 416);
}

uint64_t sub_EA20()
{
  return v0;
}

uint64_t sub_EA2C()
{
  return v0;
}

uint64_t sub_EA60()
{
  return sub_6ED8(v1, 0, 1, v0);
}

uint64_t sub_EA8C()
{
  return swift_arrayDestroy();
}

uint64_t sub_EAB0()
{
  return v0;
}

uint64_t sub_EAD8()
{
  return sub_115F0();
}

uint64_t sub_EB04()
{
  return sub_11840();
}

uint64_t sub_EB24()
{
  return v0;
}

uint64_t sub_EB30()
{
  return swift_allocObject();
}

void sub_EB48(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

void sub_EB68(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 2u);
}

void sub_EB88(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_EBA8()
{
  return sub_11620();
}

void sub_EBE0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_EC00()
{
  return swift_errorRelease();
}

uint64_t sub_EC20()
{
  return *(void *)(v0 + 416);
}

uint64_t sub_EC34()
{
  return *(void *)(v0 - 136);
}

uint64_t sub_EC48@<X0>(uint64_t *a1@<X8>)
{
  sub_11120();
  sub_11110();
  swift_allocObject();
  sub_11100();
  uint64_t v2 = sub_11000();
  swift_allocObject();
  uint64_t result = sub_10FF0();
  a1[3] = v2;
  a1[4] = (uint64_t)&protocol witness table for PatternFlowProvider;
  *a1 = result;
  return result;
}

void *SiriSuggestionsFlowPlugin.__allocating_init()()
{
  sub_11580();
  uint64_t v0 = sub_11570();
  sub_11320();
  swift_retain();
  uint64_t v1 = sub_112F0();

  return sub_10ADC(v0, v1, 0);
}

void *sub_ED8C(uint64_t a1, uint64_t a2)
{
  type metadata accessor for SiriSuggestionsFlow();
  swift_retain();
  uint64_t v3 = swift_retain();
  return sub_7680(v3, a2);
}

uint64_t sub_EDE8(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v66 = a1;
  uint64_t v70 = sub_11740();
  sub_E3C4();
  uint64_t v68 = v4;
  __chkstk_darwin(v5);
  sub_EAC4();
  uint64_t v67 = v6;
  sub_EAA4();
  __chkstk_darwin(v7);
  sub_10F74();
  uint64_t v62 = v8;
  sub_EAA4();
  __chkstk_darwin(v9);
  sub_10F74();
  uint64_t v65 = v10;
  sub_EAA4();
  __chkstk_darwin(v11);
  uint64_t v61 = (char *)&v59 - v12;
  uint64_t v13 = sub_6E94(&qword_186B0);
  uint64_t v14 = sub_E664(v13);
  __chkstk_darwin(v14);
  sub_10E04();
  uint64_t v64 = v15;
  uint64_t v16 = sub_11410();
  sub_E3C4();
  uint64_t v63 = v17;
  __chkstk_darwin(v18);
  sub_10E6C();
  uint64_t v19 = (void *)(v1 + 40);
  sub_7158((void *)(v1 + 40), *(void *)(v1 + 64));
  sub_111D0();
  sub_111C0();
  sub_111B0();
  swift_release();
  char v20 = sub_11520();
  swift_release();
  if ((v20 & 1) == 0)
  {
    sub_115F0();
    uint64_t v38 = (void *)sub_11730();
    os_log_type_t v39 = sub_11810();
    if (sub_10EE8(v39))
    {
      *(_WORD *)sub_E560() = 0;
      sub_10E84(&dword_0, v40, v41, "SiriHelp feature flag NOT enabled");
      sub_7668();
    }

    sub_E688();
    v42();
    sub_11710();
    sub_10E18();
    uint64_t v71 = sub_11700();
    sub_10D60(&qword_18970, (void (*)(uint64_t))&type metadata accessor for NoOpFlow);
    uint64_t v37 = sub_11010();
    swift_release();
    return v37;
  }
  uint64_t v21 = v64;
  uint64_t v22 = v66;
  uint64_t v60 = v2;
  uint64_t v23 = v16;
  uint64_t v24 = *(void *)(v3 + 64);
  uint64_t v67 = v3;
  sub_7158(v19, v24);
  char v25 = sub_11530();
  uint64_t v26 = v68;
  uint64_t v27 = v69;
  if ((v25 & 1) == 0)
  {
    if (v22)
    {
      sub_11370();
      if (sub_701C(v21, 1, v23) != 1)
      {
        uint64_t v28 = v63;
        uint64_t v29 = v60;
        sub_10F68();
        v30();
        if (sub_113E0())
        {
          uint64_t v31 = *(void *)(v67 + 16);
          if (v31)
          {
            swift_retain();
            sub_115F0();
            uint64_t v32 = (void *)sub_11730();
            os_log_type_t v33 = sub_11810();
            if (sub_10EE8(v33))
            {
              *(_WORD *)sub_E560() = 0;
              sub_10E84(&dword_0, v34, v35, "See more request. Using previous request flow");
              uint64_t v28 = v63;
              sub_7668();
            }

            sub_10F1C();
            v36();
            uint64_t v71 = v31;
            type metadata accessor for SiriSuggestionsFlow();
            sub_10D60(qword_18738, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsFlow);
            uint64_t v37 = sub_11010();
            (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v60, v23);
LABEL_26:
            swift_release();
            return v37;
          }
          (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v60, v23);
        }
        else
        {
          (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v29, v23);
        }
        goto LABEL_17;
      }
    }
    else
    {
      sub_6ED8(v21, 1, 1, v23);
    }
    sub_E25C(v21, &qword_186B0);
  }
LABEL_17:
  sub_115F0();
  v43 = (void *)sub_11730();
  os_log_type_t v44 = sub_11810();
  if (sub_10E50(v44))
  {
    uint64_t v45 = (_WORD *)sub_E560();
    sub_10F44(v45);
    sub_EBE0(&dword_0, v46, v47, "Normal flow request. Creating new flow from factory");
    sub_7668();
  }

  uint64_t v48 = *(uint64_t (**)(void))(v26 + 8);
  sub_10F1C();
  uint64_t v49 = v48();
  uint64_t v50 = v67;
  uint64_t v37 = *(void *)(v67 + 32);
  uint64_t v51 = (*(uint64_t (**)(uint64_t))(v67 + 24))(v49);
  if (!v27)
  {
    uint64_t v52 = v51;
    if (v51)
    {
      *(void *)(v50 + 16) = v51;
      swift_retain();
      swift_release();
      uint64_t v71 = v52;
      type metadata accessor for SiriSuggestionsFlow();
      sub_10D60(qword_18738, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsFlow);
      uint64_t v37 = sub_11010();
    }
    else
    {
      sub_115F0();
      uint64_t v53 = (void *)sub_11730();
      os_log_type_t v54 = sub_11810();
      if (sub_10E50(v54))
      {
        uint64_t v55 = (_WORD *)sub_E560();
        sub_10F44(v55);
        sub_EBE0(&dword_0, v56, v57, "No flow could be constructed");
        sub_7668();
      }

      sub_10F1C();
      v48();
      sub_11710();
      sub_10E18();
      uint64_t v71 = sub_11700();
      sub_10D60(&qword_18970, (void (*)(uint64_t))&type metadata accessor for NoOpFlow);
      uint64_t v37 = sub_11010();
    }
    goto LABEL_26;
  }
  return v37;
}

uint64_t SiriSuggestionsFlowPlugin.makeFlowFor(parse:)(uint64_t a1)
{
  void (*v41)(uint64_t *__return_ptr, uint64_t);
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(void);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  void (*v60)(void);
  void (*v61)(void);
  char v62;
  void (*v63)(void);
  uint64_t v65;
  void (*v66)(uint64_t);
  void v67[2];
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  unint64_t v78 = a1;
  uint64_t v73 = sub_114F0();
  sub_E3C4();
  uint64_t v71 = v3;
  __chkstk_darwin(v4);
  sub_10E04();
  v67[1] = v5;
  uint64_t v70 = sub_6E94(&qword_186D0);
  sub_E9CC();
  __chkstk_darwin(v6);
  sub_10E04();
  uint64_t v72 = v7;
  uint64_t v8 = sub_6E94(&qword_186B0);
  uint64_t v9 = sub_E664(v8);
  __chkstk_darwin(v9);
  sub_10E04();
  uint64_t v69 = v10;
  uint64_t v11 = sub_6E94(&qword_186D8);
  uint64_t v12 = sub_E664(v11);
  __chkstk_darwin(v12);
  sub_EAC4();
  uint64_t v68 = v13;
  sub_EAA4();
  __chkstk_darwin(v14);
  sub_10F74();
  unint64_t v74 = v15;
  sub_EAA4();
  __chkstk_darwin(v16);
  os_log_type_t v75 = (uint64_t)v67 - v17;
  uint64_t v18 = sub_6E94(&qword_18968);
  sub_E3C4();
  uint64_t v20 = v19;
  __chkstk_darwin(v21);
  sub_10F2C();
  int v76 = sub_11190();
  sub_E3C4();
  uint64_t v23 = v22;
  __chkstk_darwin(v24);
  sub_10E04();
  uint64_t v77 = v25;
  sub_11160();
  sub_E3C4();
  __chkstk_darwin(v26);
  uint64_t v27 = sub_11170();
  sub_E3C4();
  uint64_t v29 = v28;
  __chkstk_darwin(v30);
  sub_10E6C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v2, v78, v27);
  int v31 = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 88))(v2, v27);
  if (v31 != enum case for Parse.directInvocation(_:))
  {
    if (v31 != enum case for Parse.uso(_:))
    {
      sub_11710();
      sub_10E18();
      uint64_t v79 = sub_11700();
      sub_10D60(&qword_18970, (void (*)(uint64_t))&type metadata accessor for NoOpFlow);
      uint64_t v42 = sub_10EA4();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v2, v27);
      return v42;
    }
    uint64_t v35 = sub_10F04();
    v36(v35);
    uint64_t v37 = v23;
    uint64_t v39 = v76;
    uint64_t v38 = v77;
    sub_10F68();
    v40();
    sub_11230();
    uint64_t v41 = (void (*)(uint64_t *__return_ptr, uint64_t))sub_11240();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v1, v18);
    v41(&v79, v38);
    swift_release();
    unint64_t v78 = v79;
    if (v79)
    {
      swift_retain();
      uint64_t v45 = v69;
      sub_11370();
      swift_release();
      uint64_t v46 = sub_11410();
      uint64_t v47 = sub_701C(v45, 1, v46);
      uint64_t v48 = v75;
      if (v47 == 1)
      {
        sub_E25C(v45, &qword_186B0);
        uint64_t v49 = 1;
      }
      else
      {
        sub_113F0();
        sub_E9CC();
        sub_E688();
        v53();
        uint64_t v49 = 0;
      }
      uint64_t v51 = v72;
      uint64_t v50 = v73;
      uint64_t v52 = v71;
    }
    else
    {
      uint64_t v49 = 1;
      uint64_t v51 = v72;
      uint64_t v50 = v73;
      uint64_t v52 = v71;
      uint64_t v48 = v75;
    }
    os_log_type_t v54 = v74;
    uint64_t v55 = v70;
    sub_6ED8(v48, v49, 1, v50);
    (*(void (**)(uint64_t, void, uint64_t))(v52 + 104))(v54, enum case for InvocationType.siriHelp(_:), v50);
    sub_6ED8(v54, 0, 1, v50);
    uint64_t v56 = v51 + *(int *)(v55 + 48);
    sub_DD9C(v48, v51, &qword_186D8);
    sub_DD9C(v54, v56, &qword_186D8);
    sub_10F80(v51);
    if (v59)
    {
      sub_E25C(v54, &qword_186D8);
      sub_E25C(v48, &qword_186D8);
      sub_10F80(v56);
      uint64_t v57 = v77;
      if (v59)
      {
        sub_E25C(v51, &qword_186D8);
        uint64_t v58 = v78;
LABEL_22:
        uint64_t v42 = sub_EDE8(v58);
        uint64_t v65 = sub_10F50();
        v66(v65);
        swift_release();
        return v42;
      }
    }
    else
    {
      sub_DD9C(v51, v68, &qword_186D8);
      sub_10F80(v56);
      if (!v59)
      {
        sub_10F68();
        v61();
        sub_10D60(&qword_186F8, (void (*)(uint64_t))&type metadata accessor for InvocationType);
        uint64_t v62 = sub_11760();
        uint64_t v63 = *(void (**)(void))(v52 + 8);
        sub_10EC0();
        v63();
        sub_E25C(v74, &qword_186D8);
        sub_E25C(v75, &qword_186D8);
        sub_10EC0();
        v63();
        sub_E25C(v51, &qword_186D8);
        uint64_t v57 = v77;
        uint64_t v58 = v78;
        if (v62) {
          goto LABEL_22;
        }
LABEL_23:
        sub_11710();
        sub_10E18();
        uint64_t v79 = sub_11700();
        sub_10D60(&qword_18970, (void (*)(uint64_t))&type metadata accessor for NoOpFlow);
        uint64_t v42 = sub_10EA4();
        swift_release();
        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v57, v39);
        return v42;
      }
      sub_E25C(v54, &qword_186D8);
      sub_E25C(v75, &qword_186D8);
      sub_10EC0();
      v60();
      uint64_t v57 = v77;
    }
    sub_E25C(v51, &qword_186D0);
    goto LABEL_23;
  }
  uint64_t v32 = sub_10F04();
  v33(v32);
  sub_10F68();
  v34();
  uint64_t v42 = sub_FEC0();
  v43 = sub_10ED0();
  v44(v43);
  return v42;
}

uint64_t sub_FC5C()
{
  uint64_t v1 = sub_11740();
  sub_E3C4();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_10F2C();
  sub_115F0();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = sub_11730();
  os_log_type_t v6 = sub_11820();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v12 = v1;
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_errorRetain();
    sub_6E94(&qword_18690);
    uint64_t v8 = sub_11770();
    sub_D33C(v8, v9, &v13);
    sub_11840();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v5, v6, "Unable to obtain suggestions client: %s. Returning no op flow", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v12);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  }
  sub_11710();
  sub_10E18();
  uint64_t v13 = sub_11700();
  sub_10D60(&qword_18970, (void (*)(uint64_t))&type metadata accessor for NoOpFlow);
  uint64_t v10 = sub_10EA4();
  swift_release();
  return v10;
}

uint64_t sub_FEC0()
{
  sub_11740();
  sub_E3C4();
  uint64_t v72 = v1;
  uint64_t v73 = v2;
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v5 = __chkstk_darwin(v4);
  __chkstk_darwin(v5);
  sub_10F74();
  v69[1] = v6;
  sub_EAA4();
  __chkstk_darwin(v7);
  uint64_t v8 = sub_6E94(&qword_18A68);
  uint64_t v9 = sub_E664(v8);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v71 = (char *)v69 - v13;
  uint64_t v14 = sub_116F0();
  sub_E3C4();
  uint64_t v16 = v15;
  __chkstk_darwin(v17);
  sub_10E6C();
  (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v0, enum case for DirectInvocationUserDataKey.action(_:), v14);
  sub_11140();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v0, v14);
  if (v76[3])
  {
    if (swift_dynamicCast())
    {
      uint64_t v19 = v74;
      uint64_t v18 = v75;
      swift_bridgeObjectRetain();
      uint64_t v20 = (uint64_t)v71;
      sub_116D0();
      uint64_t v21 = sub_116E0();
      if (sub_701C(v20, 1, v21) == 1)
      {
LABEL_4:
        sub_115F0();
        swift_bridgeObjectRetain();
        uint64_t v22 = sub_11730();
        os_log_type_t v23 = sub_11820();
        if (os_log_type_enabled(v22, v23))
        {
          uint64_t v24 = (uint8_t *)swift_slowAlloc();
          v76[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v24 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v74 = sub_D33C(v19, v18, v76);
          sub_11840();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_0, v22, v23, "Unsupported direct invocation action: %s. Returning no op flow", v24, 0xCu);
          swift_arrayDestroy();
          sub_7668();
          sub_7668();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        sub_E688();
        v39();
        sub_11710();
        sub_10E18();
        v76[0] = sub_11700();
        sub_10D60(&qword_18970, (void (*)(uint64_t))&type metadata accessor for NoOpFlow);
        uint64_t v18 = sub_10E34();
        swift_release();
        uint64_t v40 = (uint64_t)v71;
        goto LABEL_14;
      }
      sub_DD9C(v20, (uint64_t)v12, &qword_18A68);
      uint64_t v30 = *(void *)(v21 - 8);
      int v31 = (*(uint64_t (**)(char *, uint64_t))(v30 + 88))(v12, v21);
      if (v31 == enum case for DirectInvocationAction.executeSuggestion(_:))
      {
        swift_bridgeObjectRelease();
        uint64_t v32 = sub_11470();
        swift_allocObject();
        uint64_t v33 = sub_11460();
        type metadata accessor for SiriSuggestionsInvocationFlow();
        uint64_t v34 = sub_10E18();
        uint64_t v35 = (uint64_t *)(v34
                        + OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_dispatcherFactory);
        v35[3] = v32;
        v35[4] = (uint64_t)&protocol witness table for DefaultACECommandSuggestionDispatcherFactory;
        *uint64_t v35 = v33;
        uint64_t v36 = v34 + OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_directInvocation;
        uint64_t v37 = sub_11160();
        sub_6ED8(v36, 1, 1, v37);
        uint64_t v38 = (void *)(v34
                       + OBJC_IVAR____TtC25SiriSuggestionsFlowPlugin29SiriSuggestionsInvocationFlow_interactionDonator);
        *uint64_t v38 = &unk_186A0;
        v38[1] = 0;
        v76[0] = v34;
        sub_10D60(&qword_18A70, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsInvocationFlow);
        uint64_t v18 = sub_10E34();
        swift_release();
        sub_E25C(v20, &qword_18A68);
        return v18;
      }
      if (v31 == enum case for DirectInvocationAction.showSiriHelp(_:))
      {
        swift_bridgeObjectRelease();
        uint64_t v42 = v77;
        uint64_t v43 = sub_EDE8(0);
        if (v42)
        {
LABEL_18:
          sub_E25C(v20, &qword_18A68);
          return v18;
        }
        goto LABEL_30;
      }
      if (v31 == enum case for DirectInvocationAction.showMoreSuggestions(_:))
      {
        swift_bridgeObjectRelease();
        uint64_t v44 = v70;
        uint64_t v18 = *(void *)(v70 + 64);
        sub_7158((void *)(v70 + 40), v18);
        if ((sub_11530() & 1) == 0) {
          goto LABEL_47;
        }
        uint64_t v45 = v77;
        uint64_t v46 = (*(uint64_t (**)(void))(v44 + 24))();
        if (v45) {
          goto LABEL_18;
        }
        uint64_t v47 = v46;
        if (!v46)
        {
LABEL_47:
          if (*(void *)(v44 + 16))
          {
            v76[0] = *(void *)(v44 + 16);
            type metadata accessor for SiriSuggestionsFlow();
            sub_10D60(qword_18738, (void (*)(uint64_t))type metadata accessor for SiriSuggestionsFlow);
            uint64_t v43 = sub_10E34();
LABEL_30:
            uint64_t v18 = v43;
LABEL_41:
            uint64_t v40 = v20;
LABEL_14:
            sub_E25C(v40, &qword_18A68);
            return v18;
          }
          sub_115F0();
          uint64_t v53 = (void *)sub_11730();
          os_log_type_t v58 = sub_11820();
          if (sub_10E50(v58))
          {
            uint64_t v59 = (_WORD *)sub_E560();
            sub_10F44(v59);
            sub_EBE0(&dword_0, v60, v61, "No current suggestions flow. Returning no op flow");
            sub_7668();
          }
          goto LABEL_37;
        }
LABEL_39:
        v76[0] = v47;
        type metadata accessor for SiriSuggestionsFlow();
        uint64_t v63 = qword_18738;
        uint64_t v64 = type metadata accessor for SiriSuggestionsFlow;
        goto LABEL_40;
      }
      if (v31 != enum case for DirectInvocationAction.conversationGetSuggestions(_:))
      {
        (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v21);
        goto LABEL_4;
      }
      swift_bridgeObjectRelease();
      uint64_t v48 = v70;
      sub_7158((void *)(v70 + 40), *(void *)(v70 + 64));
      sub_111D0();
      sub_111C0();
      sub_111B0();
      swift_release();
      char v49 = sub_11540();
      uint64_t v50 = swift_release();
      if (v49)
      {
        uint64_t v51 = v77;
        uint64_t v52 = (*(uint64_t (**)(uint64_t))(v48 + 24))(v50);
        if (v51)
        {
          uint64_t v18 = sub_FC5C();
          swift_errorRelease();
          sub_E25C(v20, &qword_18A68);
          return v18;
        }
        uint64_t v47 = v52;
        if (v52) {
          goto LABEL_39;
        }
        sub_115F0();
        uint64_t v53 = (void *)sub_11730();
        os_log_type_t v65 = sub_11810();
        if (sub_10E50(v65))
        {
          uint64_t v66 = (_WORD *)sub_E560();
          sub_10F44(v66);
          sub_EBE0(&dword_0, v67, v68, "Unable to construct flow");
          sub_7668();
        }
      }
      else
      {
        sub_115F0();
        uint64_t v53 = (void *)sub_11730();
        os_log_type_t v54 = sub_11810();
        if (sub_10E50(v54))
        {
          uint64_t v55 = (_WORD *)sub_E560();
          sub_10F44(v55);
          sub_EBE0(&dword_0, v56, v57, "Continuers feature flag NOT enabled. Returning no op flow");
          sub_7668();
        }
      }
LABEL_37:

      sub_E688();
      v62();
      sub_11710();
      sub_10E18();
      v76[0] = sub_11700();
      uint64_t v63 = &qword_18970;
      uint64_t v64 = (uint64_t (*)())&type metadata accessor for NoOpFlow;
LABEL_40:
      sub_10D60(v63, (void (*)(uint64_t))v64);
      uint64_t v18 = sub_10E34();
      swift_release();
      goto LABEL_41;
    }
  }
  else
  {
    sub_E25C((uint64_t)v76, &qword_18680);
  }
  sub_115F0();
  uint64_t v25 = (void *)sub_11730();
  os_log_type_t v26 = sub_11820();
  if (sub_10EE8(v26))
  {
    *(_WORD *)sub_E560() = 0;
    sub_10E84(&dword_0, v27, v28, "Unavailable direct invocation action. Returning no op flow");
    sub_7668();
  }

  sub_E688();
  v29();
  sub_11710();
  sub_10E18();
  v76[0] = sub_11700();
  sub_10D60(&qword_18970, (void (*)(uint64_t))&type metadata accessor for NoOpFlow);
  uint64_t v18 = sub_10E34();
  swift_release();
  return v18;
}

uint64_t SiriSuggestionsFlowPlugin.deinit()
{
  swift_release();
  swift_release();
  sub_719C(v0 + 40);
  return v0;
}

uint64_t SiriSuggestionsFlowPlugin.__deallocating_deinit()
{
  SiriSuggestionsFlowPlugin.deinit();

  return _swift_deallocClassInstance(v0, 80, 7);
}

void *sub_1094C@<X0>(void *a1@<X8>)
{
  uint64_t result = SiriSuggestionsFlowPlugin.__allocating_init()();
  *a1 = result;
  return result;
}

uint64_t sub_10980(uint64_t a1)
{
  return SiriSuggestionsFlowPlugin.makeFlowFor(parse:)(a1);
}

uint64_t Optional.unwrap(errorIfNotSet:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_E3C4();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v9, a1);
  uint64_t v10 = *(void *)(a1 + 16);
  if (sub_701C((uint64_t)v8, 1, v10) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a1);
    swift_willThrow();
    return swift_errorRetain();
  }
  else
  {
    sub_E9CC();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(a2, v8, v10);
  }
}

void *sub_10ADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_115A0();
  __chkstk_darwin(v6 - 8);
  if (!a3)
  {
    sub_6E94(&qword_18A78);
    sub_6E94(&qword_18A80);
    sub_11750();
    sub_115B0();
    sub_11590();
    uint64_t v7 = sub_11280();
    swift_allocObject();
    uint64_t v8 = sub_11270();
    sub_113C0();
    uint64_t v9 = sub_113B0();
    sub_11120();
    sub_EC48(v15);
    v14[3] = v7;
    v14[4] = sub_10D60(&qword_18A88, (void (*)(uint64_t))&type metadata accessor for AppUtilsService);
    v14[0] = v8;
    if (a2)
    {
      v13[1] = a2;
      swift_retain();
      swift_retain();
      sub_781C(v9, (uint64_t)v14, (uint64_t)v16, (uint64_t)v15, 0, 0, v13);
      swift_release();
      a3 = v13[0];
    }
    else
    {
      swift_retain();
      a3 = 0;
    }
    sub_719C((uint64_t)v14);
    swift_release();
    sub_719C((uint64_t)v15);
    sub_719C((uint64_t)v16);
    swift_release();
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  type metadata accessor for SiriSuggestionsFlowPlugin();
  uint64_t v11 = (void *)swift_allocObject();
  v11[8] = sub_11580();
  v11[9] = &protocol witness table for OSFeatureFlagProvider;
  v11[4] = v10;
  v11[5] = a1;
  v11[2] = 0;
  v11[3] = sub_10DE8;
  return v11;
}

uint64_t type metadata accessor for SiriSuggestionsFlowPlugin()
{
  return self;
}

uint64_t sub_10D60(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10DA8()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void *sub_10DE8()
{
  return sub_ED8C(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10E18()
{
  return swift_allocObject();
}

uint64_t sub_10E34()
{
  return sub_11010();
}

BOOL sub_10E50(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void sub_10E84(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_10EA4()
{
  return sub_11010();
}

uint64_t sub_10ED0()
{
  return v0;
}

BOOL sub_10EE8(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_10F04()
{
  return v0;
}

_WORD *sub_10F44(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t sub_10F50()
{
  return v0;
}

uint64_t sub_10F80(uint64_t a1)
{
  return sub_701C(a1, 1, v1);
}

uint64_t sub_10FA0()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_10FB0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10FC0()
{
  return type metadata accessor for URL();
}

uint64_t sub_10FD0()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_10FE0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10FF0()
{
  return PatternFlowProvider.init(outputPublisher:responseGenerator:)();
}

uint64_t sub_11000()
{
  return type metadata accessor for PatternFlowProvider();
}

uint64_t sub_11010()
{
  return Flow.eraseToAnyFlow()();
}

uint64_t sub_11020()
{
  return Flow.flexibleExecutionSupport.getter();
}

uint64_t sub_11060()
{
  return type metadata accessor for FlowUnhandledReason();
}

uint64_t sub_11070()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_11080()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_11090(Swift::String refId)
{
}

void sub_110A0()
{
}

uint64_t sub_110B0()
{
  return DeviceState.asInvocationContext.getter();
}

uint64_t sub_110C0()
{
  return static ExecuteResponse.complete<A>(next:)();
}

uint64_t sub_110D0()
{
  return static ExecuteResponse.complete()();
}

uint64_t sub_110E0()
{
  return static ExecuteResponse.unhandled(reason:)();
}

uint64_t sub_110F0()
{
  return type metadata accessor for ExecuteResponse();
}

uint64_t sub_11100()
{
  return ResponseFactory.init()();
}

uint64_t sub_11110()
{
  return type metadata accessor for ResponseFactory();
}

uint64_t sub_11120()
{
  return static OutputPublisherFactory.makeOutputPublisherAsync()();
}

uint64_t sub_11130()
{
  return Input.parse.getter();
}

uint64_t sub_11140()
{
  return Parse.DirectInvocation.getUserData(for:)();
}

uint64_t sub_11150()
{
  return Parse.DirectInvocation.userData.getter();
}

uint64_t sub_11160()
{
  return type metadata accessor for Parse.DirectInvocation();
}

uint64_t sub_11170()
{
  return type metadata accessor for Parse();
}

uint64_t sub_11180()
{
  return static Device.current.getter();
}

uint64_t sub_11190()
{
  return type metadata accessor for USOParse();
}

uint64_t sub_111A0()
{
  return SiriEnvironment.currentRequest.getter();
}

uint64_t sub_111B0()
{
  return SiriEnvironment.currentDevice.getter();
}

uint64_t sub_111C0()
{
  return static SiriEnvironment.default.getter();
}

uint64_t sub_111D0()
{
  return type metadata accessor for SiriEnvironment();
}

uint64_t sub_111E0()
{
  return dispatch thunk of SiriEnvironmentLocating.siriEnvironment.getter();
}

uint64_t sub_111F0()
{
  return SiriEnvironmentLocating<>.siriEnvironment.modify();
}

uint64_t sub_11200()
{
  return SiriEnvironmentLocating<>.siriEnvironment.getter();
}

uint64_t sub_11210()
{
  return SiriEnvironmentLocating<>.siriEnvironment.setter();
}

uint64_t sub_11220()
{
  return static Transformer<>.parseToProperties.getter();
}

uint64_t sub_11230()
{
  return static Transformer<>.usoToProperties.getter();
}

uint64_t sub_11240()
{
  return Transformer.transform.getter();
}

uint64_t sub_11250()
{
  return EducationalSuggestions.rawValue.getter();
}

uint64_t sub_11260()
{
  return type metadata accessor for EducationalSuggestions();
}

uint64_t sub_11270()
{
  return AppUtilsService.init(cache:homescreenAppPicker:)();
}

uint64_t sub_11280()
{
  return type metadata accessor for AppUtilsService();
}

uint64_t sub_11290()
{
  return static SuggestionService.isEnabled()();
}

uint64_t sub_112A0()
{
  return type metadata accessor for SuggestionService();
}

uint64_t sub_112B0()
{
  return static ForegroundAppResolver.foregroundAppParamType.getter();
}

uint64_t sub_112C0()
{
  return type metadata accessor for ForegroundAppResolver();
}

uint64_t sub_112F0()
{
  return SiriSuggestionsFacade.__allocating_init(flagProvider:)();
}

uint64_t sub_11310()
{
  return SiriSuggestionsFacade.getClient()();
}

uint64_t sub_11320()
{
  return type metadata accessor for SiriSuggestionsFacade();
}

uint64_t sub_11330()
{
  return SinkCapture.result.getter();
}

uint64_t sub_11340()
{
  return IntentProperties.preComputedSuggestions.getter();
}

uint64_t sub_11350()
{
  return IntentProperties.init(intentProps:verb:owner:presentationContext:preComputedSuggestions:)();
}

uint64_t sub_11360()
{
  return IntentProperties.intentProps.getter();
}

uint64_t sub_11370()
{
  return IntentProperties.presentationContext.getter();
}

uint64_t sub_11380()
{
  return IntentProperties.verb.getter();
}

uint64_t sub_11390()
{
  return IntentProperties.owner.getter();
}

uint64_t sub_113A0()
{
  return type metadata accessor for IntentProperties();
}

uint64_t sub_113B0()
{
  return DispatchSELFLogger.__allocating_init()();
}

uint64_t sub_113C0()
{
  return type metadata accessor for DispatchSELFLogger();
}

uint64_t sub_113D0()
{
  return PresentationContext.init(displayAllSuggestions:invocationType:requestId:dialogContextId:)();
}

uint64_t sub_113E0()
{
  return PresentationContext.displayAllSuggestions.getter();
}

uint64_t sub_113F0()
{
  return PresentationContext.invocationType.getter();
}

uint64_t sub_11400()
{
  return PresentationContext.init(from:requestId:invokedBefore:)();
}

uint64_t sub_11410()
{
  return type metadata accessor for PresentationContext();
}

uint64_t sub_11440()
{
  return SinkDispatcherProvider.capture.getter();
}

uint64_t sub_11450()
{
  return dispatch thunk of ACECommandSuggestionDispatcherFactory.createDispatcher(requirements:)();
}

uint64_t sub_11460()
{
  return DefaultACECommandSuggestionDispatcherFactory.init()();
}

uint64_t sub_11470()
{
  return type metadata accessor for DefaultACECommandSuggestionDispatcherFactory();
}

uint64_t sub_11480()
{
  return SiriSuggestions.Suggestion.toIntentSuggestion()();
}

uint64_t sub_11490()
{
  return SiriSuggestions.Suggestion.presentation.getter();
}

uint64_t sub_114A0()
{
  return type metadata accessor for SiriSuggestions.Suggestion();
}

uint64_t sub_114B0()
{
  return type metadata accessor for SiriSuggestions.SuggestionList();
}

uint64_t sub_114C0()
{
  return SiriSuggestions.SuggestionPresentation.displayText.getter();
}

uint64_t sub_114D0()
{
  return type metadata accessor for SiriSuggestions.SuggestionPresentation();
}

uint64_t sub_114E0()
{
  return static SiriSuggestionsSignpost.flow.getter();
}

uint64_t sub_114F0()
{
  return type metadata accessor for InvocationType();
}

uint64_t sub_11500()
{
  return InvocationContext.init(directInvocationContext:displayedUtterance:)();
}

uint64_t sub_11510()
{
  return type metadata accessor for InvocationContext();
}

uint64_t sub_11520()
{
  return dispatch thunk of FeatureFlagProvider.isSiriHelpEnabled(device:)();
}

uint64_t sub_11530()
{
  return dispatch thunk of FeatureFlagProvider.isSMARTEnabled()();
}

uint64_t sub_11540()
{
  return dispatch thunk of FeatureFlagProvider.isContinuersEnabled(device:)();
}

uint64_t sub_11550()
{
  return ResolvableParameter.typeIdentifier.getter();
}

uint64_t sub_11560()
{
  return static InteractionConstants.MentionedAppIdsKey.getter();
}

uint64_t sub_11570()
{
  return OSFeatureFlagProvider.__allocating_init()();
}

uint64_t sub_11580()
{
  return type metadata accessor for OSFeatureFlagProvider();
}

uint64_t sub_11590()
{
  return ThirdPartyHomeScreenAppPicker.init(randSeed:)();
}

uint64_t sub_115A0()
{
  return type metadata accessor for ThirdPartyHomeScreenAppPicker();
}

uint64_t sub_115B0()
{
  return Cache.__allocating_init(store:)();
}

uint64_t sub_115C0()
{
  return Action.init(actionId:params:)();
}

uint64_t sub_115D0()
{
  return Action.loggingId.getter();
}

uint64_t sub_115E0()
{
  return type metadata accessor for Action();
}

uint64_t sub_115F0()
{
  return static Logger.flowCategory.getter();
}

uint64_t sub_11600()
{
  return static Logger.makeSignpostID(log:)();
}

uint64_t sub_11610()
{
  return static Logger.end(_:_:log:telemetry:)();
}

uint64_t sub_11620()
{
  return static Logger.log.getter();
}

uint64_t sub_11630()
{
  return static Logger.begin(_:_:log:telemetry:)();
}

uint64_t sub_11640()
{
  return CurrentRequest.executionRequestId.getter();
}

uint64_t sub_11650()
{
  return CurrentRequest.positionInSession.getter();
}

uint64_t sub_11660()
{
  return type metadata accessor for RequestPositionInSession();
}

uint64_t sub_11670()
{
  return type metadata accessor for ExecuteSuggestionIntent();
}

uint64_t sub_11680()
{
  return type metadata accessor for ExecuteSuggestionIntentResponse();
}

uint64_t sub_11690()
{
  return type metadata accessor for SiriHelpDispatcherErrors();
}

uint64_t sub_116A0()
{
  return SiriHelpSuggestionsDispatcherFactory.init(logger:templateUrl:siriHelpDispatcherProvider:appUtils:suggestionsLogger:outputPublisher:patternFlowProvider:catGlobals:patternExecutor:)();
}

uint64_t sub_116B0()
{
  return type metadata accessor for SiriHelpSuggestionsDispatcherFactory();
}

uint64_t sub_116C0()
{
  return dispatch thunk of RequestIdProvider.requestId.getter();
}

uint64_t sub_116D0()
{
  return DirectInvocationAction.init(rawValue:)();
}

uint64_t sub_116E0()
{
  return type metadata accessor for DirectInvocationAction();
}

uint64_t sub_116F0()
{
  return type metadata accessor for DirectInvocationUserDataKey();
}

uint64_t sub_11700()
{
  return NoOpFlow.init()();
}

uint64_t sub_11710()
{
  return type metadata accessor for NoOpFlow();
}

uint64_t sub_11720()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_11730()
{
  return Logger.logObject.getter();
}

uint64_t sub_11740()
{
  return type metadata accessor for Logger();
}

uint64_t sub_11750()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_11760()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_11770()
{
  return String.init<A>(describing:)();
}

uint64_t sub_11780()
{
  return String.fromBase64String<A>()();
}

uint64_t sub_11790()
{
  return String.hash(into:)();
}

Swift::Int sub_117A0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_117B0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_117C0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_117D0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_117E0()
{
  return type metadata accessor for TaskPriority();
}

INInteraction sub_117F0(INIntent intent, INIntentResponse response, Swift::Bool donatedBySiri)
{
  return INInteraction.init(intent:response:donatedBySiri:)(intent, response, donatedBySiri);
}

uint64_t sub_11800()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_11810()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_11820()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_11830()
{
  return type metadata accessor for Optional();
}

uint64_t sub_11840()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_11850()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_11860()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_11870()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_11880()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_11890()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_118A0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_118B0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_118C0()
{
  return Hasher._finalize()();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}