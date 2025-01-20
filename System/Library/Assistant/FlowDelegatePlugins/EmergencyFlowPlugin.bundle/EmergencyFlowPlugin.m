uint64_t sub_2940@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void v21[2];
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t __dst[15];

  v8 = sub_53DB0();
  v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_53D90();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  swift_errorRetain();
  swift_errorRetain();
  v13 = sub_53DA0();
  v14 = sub_53EB0();
  if (os_log_type_enabled(v13, v14))
  {
    v24 = a4;
    v15 = swift_slowAlloc();
    v23 = a2;
    v16 = (uint8_t *)v15;
    __dst[0] = swift_slowAlloc();
    v22 = a3;
    *(_DWORD *)v16 = 136315138;
    v21[1] = v16 + 4;
    v25 = a1;
    swift_errorRetain();
    sub_2E18(&qword_6BCA0);
    v17 = sub_53E10();
    v25 = sub_50F10(v17, v18, __dst);
    a3 = v22;
    sub_53EF0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v13, v14, "Execution Error: %s", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a2 = v23;
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v19 = sub_2C00(a3, a3[3]);
  memcpy(__dst, v19, 0x70uLL);
  sub_2C44(a2, __dst);
  sub_53450();
  return swift_release();
}

void *sub_2C00(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2C44(uint64_t a1, const void *a2)
{
  uint64_t v4 = sub_53B50();
  __chkstk_darwin(v4);
  v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_2E18(&qword_6BCA8);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  v10 = &v15[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  v12 = &v15[-v11];
  v16[3] = &type metadata for EmergencyCATProvider;
  v16[4] = &off_66E10;
  v16[0] = swift_allocObject();
  memcpy((void *)(v16[0] + 16), a2, 0x70uLL);
  sub_2C00(v16, (uint64_t)&type metadata for EmergencyCATProvider);
  sub_2EFC((uint64_t)a2);
  swift_retain();
  sub_25818();
  swift_release();
  sub_2FE0((uint64_t)v12, (uint64_t)v10);
  sub_3048(a1, (uint64_t)v15);
  sub_53B40();
  sub_30AC();
  uint64_t v13 = sub_531D0();
  sub_30FC((uint64_t)v6);
  sub_3158((uint64_t)v12);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v16);
  return v13;
}

uint64_t sub_2E18(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2E5C()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 128, 7);
}

uint64_t sub_2EFC(uint64_t a1)
{
  return a1;
}

uint64_t sub_2FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2E18(&qword_6BCA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_3048(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_30AC()
{
  unint64_t result = qword_6BCB0;
  if (!qword_6BCB0)
  {
    sub_53B50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6BCB0);
  }
  return result;
}

uint64_t sub_30FC(uint64_t a1)
{
  uint64_t v2 = sub_53B50();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_3158(uint64_t a1)
{
  uint64_t v2 = sub_2E18(&qword_6BCA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_3208(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_2E18(&qword_6BCB8);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v30 - v10;
  if (sub_53C60())
  {
    uint64_t v12 = a1[3];
    uint64_t v13 = a1[4];
    sub_2C00(a1, v12);
    swift_bridgeObjectRetain();
    sub_53AC0();
    uint64_t v14 = sub_53AD0();
    sub_3564(v14);
    sub_53A10();
    swift_allocObject();
    sub_53A00();
    sub_539F0();
    swift_release();
    uint64_t v15 = sub_539E0();
    swift_release();
    char v16 = sub_43838(a2);
    (*(void (**)(char *, uint64_t, void, uint64_t, uint64_t))(v13 + 24))(v11, v15, v16 & 1, v12, v13);
    swift_release();
LABEL_5:
    uint64_t v9 = v11;
    return sub_3504((uint64_t)v9);
  }
  if (sub_53C70())
  {
    uint64_t v17 = a1[3];
    uint64_t v18 = a1[4];
    sub_2C00(a1, v17);
    swift_bridgeObjectRetain();
    sub_53AC0();
    uint64_t v19 = sub_53AD0();
    sub_3564(v19);
    char v20 = sub_43838(a2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 16))(v11, v20 & 1, v17, v18);
    goto LABEL_5;
  }
  uint64_t v21 = *(void *)(v2 + 96);
  unint64_t v22 = *(void *)(v3 + 104);
  uint64_t v23 = HIBYTE(v22) & 0xF;
  if ((v22 & 0x2000000000000000) == 0) {
    uint64_t v23 = v21 & 0xFFFFFFFFFFFFLL;
  }
  if (v23)
  {
    swift_bridgeObjectRetain();
    sub_53AC0();
    uint64_t v24 = sub_53AD0();
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v24 = sub_53AD0();
    uint64_t v25 = 1;
  }
  sub_34DC((uint64_t)v9, v25, 1, v24);
  uint64_t v26 = a1[3];
  uint64_t v27 = a1[4];
  sub_2C00(a1, v26);
  char v28 = sub_43838(a2);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 8))(v9, v28 & 1, v26, v27);
  return sub_3504((uint64_t)v9);
}

uint64_t sub_34DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_3504(uint64_t a1)
{
  uint64_t v2 = sub_2E18(&qword_6BCB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_3564(uint64_t a1)
{
  return sub_34DC(v1, 0, 1, a1);
}

uint64_t type metadata accessor for CommonCATs()
{
  uint64_t result = qword_6BCC8;
  if (!qword_6BCC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_35CC()
{
  uint64_t result = sub_53B30();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_3670(uint64_t a1, void *a2)
{
  return sub_36BC(a1, a2);
}

uint64_t sub_36BC(uint64_t a1, void *a2)
{
  uint64_t v5 = sub_53B30();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v2 + qword_6BCC0) = a2;
  uint64_t v9 = *(void (**)(void))(v6 + 16);
  sub_3BD0();
  v9();
  uint64_t v10 = sub_53030();
  sub_34DC((uint64_t)v8, 1, 1, v10);
  sub_3BD0();
  v9();
  id v11 = a2;
  uint64_t v12 = sub_53A50();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v12;
}

uint64_t sub_3848()
{
  return sub_3BC8();
}

uint64_t sub_3860()
{
  return sub_389C();
}

uint64_t sub_3884()
{
  return sub_3BC8();
}

uint64_t sub_389C()
{
  uint64_t v1 = v0;
  sub_53A80();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = [self bundleForClass:ObjCClassFromMetadata];
  sub_53DD0();
  uint64_t v4 = *(void **)(v1 + qword_6BCC0);
  if (v4)
  {
    uint64_t v5 = *(void **)(v1 + qword_6BCC0);
  }
  else
  {
    sub_53A40();
    uint64_t v5 = (void *)sub_53A30();
  }
  sub_53AB0();
  uint64_t v9 = 0;
  memset(v8, 0, sizeof(v8));
  id v6 = v4;
  sub_53AA0();

  swift_bridgeObjectRelease();
  return sub_3B68((uint64_t)v8);
}

void sub_39E4()
{
}

uint64_t sub_3A14()
{
  uint64_t v1 = v0 + qword_6E228;
  uint64_t v2 = sub_53B30();
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

uint64_t sub_3A90()
{
  uint64_t v0 = sub_53A90();

  uint64_t v1 = v0 + qword_6E228;
  uint64_t v2 = sub_53B30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_3B0C()
{
  uint64_t v0 = sub_3A90();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_3B60()
{
  return type metadata accessor for CommonCATs();
}

uint64_t sub_3B68(uint64_t a1)
{
  uint64_t v2 = sub_2E18(&qword_6BD18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_3BC8()
{
  return sub_389C();
}

uint64_t sub_3BE4(uint64_t a1)
{
  uint64_t v41 = a1;
  uint64_t v1 = sub_2E18(&qword_6BE58);
  __chkstk_darwin(v1 - 8);
  sub_6140();
  uint64_t v4 = v3 - v2;
  uint64_t v43 = sub_535B0();
  sub_60C0();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_6140();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_53DB0();
  sub_60C0();
  uint64_t v13 = v12;
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)v40 - v18;
  uint64_t v20 = sub_53D90();
  sub_6108();
  v40[1] = *(void *)(v13 + 16);
  v40[2] = v20;
  sub_6164();
  v21();
  unint64_t v22 = sub_53DA0();
  os_log_type_t v23 = sub_53E90();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (_WORD *)sub_61F0();
    v40[0] = v4;
    sub_61CC(v24);
    sub_61D8(&dword_0, v22, v23, "EmergencyConfirmationFlow onInput");
    uint64_t v4 = v40[0];
    sub_60F0();
  }

  uint64_t v25 = *(void (**)(char *, uint64_t))(v13 + 8);
  v25(v19, v11);
  uint64_t v26 = *(unsigned __int8 *)(v42 + 16);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v10, v41, v43);
  if (v26 == 1)
  {
    uint64_t v27 = v11;
    sub_10034();
    uint64_t v28 = sub_6170();
    v29(v28);
    uint64_t v30 = sub_53550();
    int v31 = sub_5800(v4, 1, v30);
    sub_5884(v4, &qword_6BE58);
    if (v31 == 1)
    {
      sub_6108();
      uint64_t v32 = v27;
      sub_6164();
      v33();
      v34 = sub_53DA0();
      os_log_type_t v35 = sub_53E90();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = (_WORD *)sub_61F0();
        sub_61CC(v36);
        sub_61D8(&dword_0, v34, v35, "No confirmation response found in input, ignoring.");
        uint64_t v32 = v27;
        sub_60F0();
      }

      v25(v17, v32);
      return 0;
    }
  }
  else
  {
    uint64_t v37 = sub_6170();
    v38(v37);
    return 1;
  }
  return v26;
}

BOOL sub_3F18(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_3F28(uint64_t a1)
{
  v2[14] = a1;
  v2[15] = v1;
  uint64_t v3 = sub_53DB0();
  v2[16] = v3;
  v2[17] = *(void *)(v3 - 8);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  return _swift_task_switch(sub_4004, 0, 0);
}

uint64_t sub_4004()
{
  uint64_t v29 = v0;
  uint64_t v1 = *(void *)(v0 + 160);
  sub_53D90();
  sub_6108();
  sub_6164();
  v2();
  swift_retain_n();
  uint64_t v3 = sub_53DA0();
  os_log_type_t v4 = sub_53E90();
  if (sub_6198(v4))
  {
    uint64_t v5 = *(void *)(v0 + 120);
    uint64_t v27 = *(void *)(v0 + 136);
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v28 = v7;
    *(unsigned char *)(v0 + 168) = *(unsigned char *)(v5 + 16);
    uint64_t v8 = sub_53E10();
    *(void *)(v0 + 104) = sub_50F10(v8, v9, &v28);
    sub_53EF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v3, (os_log_type_t)v1, "EmergencyConfirmationFlow execute with state: %s", v6, 0xCu);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();

    uint64_t v10 = *(void (**)(void))(v27 + 8);
    sub_6120();
    v10();
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 160);
    uint64_t v12 = *(void *)(v0 + 128);
    uint64_t v13 = *(void *)(v0 + 136);

    swift_release_n();
    uint64_t v10 = *(void (**)(void))(v13 + 8);
    ((void (*)(uint64_t, uint64_t))v10)(v11, v12);
  }
  uint64_t v14 = *(void *)(v0 + 120);
  switch(*(unsigned char *)(v14 + 16))
  {
    case 1:
      uint64_t v20 = *(void *)(v0 + 128);
      sub_6108();
      sub_6164();
      v21();
      unint64_t v22 = sub_53DA0();
      os_log_type_t v23 = sub_53E90();
      if (sub_6198(v23))
      {
        uint64_t v24 = (_WORD *)sub_61F0();
        sub_61CC(v24);
        sub_61D8(&dword_0, v22, (os_log_type_t)v20, "EmergencyConfirmationFlow Didn't receive a valid response. Reprompting user.");
        sub_60F0();
      }

      sub_6120();
      v10();
      *(void *)(v0 + 88) = sub_45B8();
      swift_retain();
      sub_2E18(&qword_6BE78);
      sub_5F88(&qword_6BE88, &qword_6BE78);
      sub_53420();
      swift_release();
      goto LABEL_13;
    case 2:
      *(unsigned char *)(v14 + 16) = 3;
      sub_2C00((void *)(v14 + 152), *(void *)(v14 + 176));
      type metadata accessor for ConfirmationFlowConfigModel();
      swift_retain();
      sub_53450();
      goto LABEL_13;
    case 3:
      uint64_t v15 = *(void *)(v0 + 128);
      sub_6108();
      sub_6164();
      v16();
      uint64_t v17 = sub_53DA0();
      os_log_type_t v18 = sub_53E90();
      if (sub_6198(v18))
      {
        uint64_t v19 = (_WORD *)sub_61F0();
        sub_61CC(v19);
        sub_61D8(&dword_0, v17, (os_log_type_t)v15, "EmergencyConfirmationFlow completed");
        sub_60F0();
      }

      sub_6120();
      v10();
      sub_53460();
      goto LABEL_14;
    default:
      *(unsigned char *)(v14 + 16) = 1;
      *(void *)(v0 + 96) = sub_45B8();
      swift_retain();
      sub_2E18(&qword_6BE78);
      sub_5F88(&qword_6BE88, &qword_6BE78);
      sub_53430();
      swift_release();
LABEL_13:
      swift_release();
LABEL_14:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
      return v25();
  }
}

uint64_t sub_452C()
{
  type metadata accessor for EmergencyConfirmationFlow();
  sub_5F40(&qword_6BE80, v0, (void (*)(uint64_t))type metadata accessor for EmergencyConfirmationFlow);
  return sub_531E0();
}

uint64_t sub_45B8()
{
  sub_2E18(&qword_6BE78);
  memcpy(__dst, v0 + 3, sizeof(__dst));
  memcpy(v18, v0 + 3, sizeof(v18));
  sub_3048((uint64_t)(v0 + 19), (uint64_t)v17);
  sub_3048((uint64_t)(v0 + 24), (uint64_t)v16);
  sub_3048((uint64_t)(v0 + 29), (uint64_t)v15);
  sub_5920((uint64_t)(v0 + 34), (uint64_t)v14);
  sub_597C((uint64_t)v17, v17[3]);
  sub_60C0();
  __chkstk_darwin(v1);
  sub_6140();
  uint64_t v4 = v3 - v2;
  (*(void (**)(uint64_t))(v5 + 16))(v3 - v2);
  sub_597C((uint64_t)v15, v15[3]);
  sub_60C0();
  __chkstk_darwin(v6);
  sub_6140();
  unint64_t v9 = (const void *)(v8 - v7);
  (*(void (**)(uint64_t))(v10 + 16))(v8 - v7);
  memcpy(v19, v9, sizeof(v19));
  sub_5D2C((uint64_t)__dst);
  sub_5AC4(v4, v16, v19, (uint64_t)v14, 0, 0);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v15);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v17);
  uint64_t v11 = v0[27];
  uint64_t v12 = v0[28];
  sub_2C00(v0 + 24, v11);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v12 + 40))(v17, v11, v12);
  return sub_53110();
}

uint64_t sub_47C8(uint64_t a1)
{
  uint64_t v2 = sub_53550();
  sub_60C0();
  uint64_t v75 = v3;
  __chkstk_darwin();
  sub_6150();
  uint64_t v66 = v4;
  uint64_t v72 = sub_2E18(&qword_6BE50);
  sub_6188();
  __chkstk_darwin();
  sub_6150();
  uint64_t v76 = v5;
  sub_2E18(&qword_6BE58);
  __chkstk_darwin();
  sub_612C();
  uint64_t v70 = v6;
  __chkstk_darwin();
  v74 = (char *)v63 - v7;
  type metadata accessor for EmergencyConfirmationResponseProvider();
  __chkstk_darwin();
  sub_6150();
  uint64_t v73 = v8;
  uint64_t v9 = sub_2E18(&qword_6BE60);
  sub_60C0();
  uint64_t v11 = v10;
  __chkstk_darwin();
  sub_612C();
  v80 = v12;
  __chkstk_darwin();
  uint64_t v14 = (char *)v63 - v13;
  uint64_t v15 = sub_53DB0();
  sub_60C0();
  uint64_t v17 = v16;
  __chkstk_darwin();
  sub_612C();
  uint64_t v71 = v18;
  __chkstk_darwin();
  uint64_t v20 = (char *)v63 - v19;
  uint64_t v21 = sub_53D90();
  sub_6108();
  uint64_t v82 = v17;
  unint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  uint64_t v69 = v21;
  uint64_t v68 = v17 + 16;
  v67 = v22;
  v22((uint64_t)v20, v21, v15);
  uint64_t v23 = *(void *)(v11 + 16);
  uint64_t v81 = a1;
  uint64_t v79 = v23;
  sub_6164();
  v24();
  uint64_t v25 = sub_53DA0();
  os_log_type_t v26 = sub_53E90();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v77 = v2;
  if (v27)
  {
    uint64_t v64 = v11;
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    uint64_t v65 = swift_slowAlloc();
    v85[0] = v65;
    *(_DWORD *)uint64_t v28 = 136315138;
    v63[1] = v28 + 4;
    sub_5F88(&qword_6BE70, &qword_6BE60);
    uint64_t v29 = sub_53FD0();
    uint64_t v84 = sub_50F10(v29, v30, v85);
    sub_53EF0();
    swift_bridgeObjectRelease();
    uint64_t v11 = v64;
    int v31 = *(void (**)(void))(v64 + 8);
    sub_6120();
    v31();
    _os_log_impl(&dword_0, v25, v26, "EmergencyConfirmationFlow finished promptFlow with result: %s", v28, 0xCu);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();
  }
  else
  {
    int v31 = *(void (**)(void))(v11 + 8);
    ((void (*)(char *, uint64_t))v31)(v14, v9);
  }

  uint64_t v32 = *(void (**)(void))(v82 + 8);
  sub_6120();
  v32();
  uint64_t v33 = v15;
  v34 = v80;
  sub_6164();
  v35();
  int v36 = (*(uint64_t (**)(uint64_t *, uint64_t))(v11 + 88))(v34, v9);
  if (v36 != enum case for PromptResult.answered<A>(_:))
  {
    if (v36 != enum case for PromptResult.error<A>(_:))
    {
      *(unsigned char *)(v78 + 16) = 3;
      sub_6120();
      return ((uint64_t (*)(void))v31)();
    }
    uint64_t v46 = sub_61B4();
    v47(v46);
    uint64_t v48 = *v34;
    uint64_t v49 = v69;
    sub_6108();
    v67(v71, v49, v33);
    swift_errorRetain();
    swift_errorRetain();
    v50 = sub_53DA0();
    os_log_type_t v51 = sub_53EA0();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc();
      uint64_t v53 = swift_slowAlloc();
      uint64_t v83 = v48;
      uint64_t v84 = v53;
      uint64_t v81 = v33;
      *(_DWORD *)v52 = 136315138;
      swift_errorRetain();
      sub_2E18(&qword_6BCA0);
      uint64_t v54 = sub_53E10();
      uint64_t v83 = sub_50F10(v54, v55, &v84);
      sub_53EF0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v50, v51, "EmergencyConfirmationFlow Error: %s", v52, 0xCu);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    sub_6120();
    uint64_t result = ((uint64_t (*)(void))v32)();
    goto LABEL_22;
  }
  uint64_t v37 = sub_61B4();
  v38(v37);
  uint64_t v39 = v73;
  sub_5E28((uint64_t)v34, v73, (void (*)(void))type metadata accessor for EmergencyConfirmationResponseProvider);
  uint64_t v41 = (uint64_t)v74;
  uint64_t v40 = v75;
  uint64_t v42 = v77;
  (*(void (**)(char *, void, uint64_t))(v75 + 104))(v74, enum case for ConfirmationResponse.confirmed(_:), v77);
  sub_34DC(v41, 0, 1, v42);
  uint64_t v43 = v76;
  uint64_t v44 = v76 + *(int *)(v72 + 48);
  sub_5798(v39, v76);
  sub_5798(v41, v44);
  sub_6208(v43);
  if (!v57)
  {
    uint64_t v56 = v70;
    sub_5798(v43, v70);
    sub_6208(v44);
    if (!v57)
    {
      uint64_t v58 = v66;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v66, v44, v42);
      sub_5F40(&qword_6BE68, 255, (void (*)(uint64_t))&type metadata accessor for ConfirmationResponse);
      uint64_t v59 = v39;
      char v60 = sub_53DE0();
      v61 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
      v61(v58, v42);
      sub_5884(v41, &qword_6BE58);
      sub_5828(v59);
      v61(v56, v42);
      uint64_t result = sub_5884(v43, &qword_6BE58);
      if (v60) {
        goto LABEL_21;
      }
LABEL_22:
      char v62 = 3;
      goto LABEL_23;
    }
    sub_5884(v41, &qword_6BE58);
    sub_5828(v39);
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v56, v42);
LABEL_16:
    uint64_t result = sub_5884(v43, &qword_6BE50);
    goto LABEL_22;
  }
  sub_5884(v41, &qword_6BE58);
  sub_5828(v39);
  sub_6208(v44);
  if (!v57) {
    goto LABEL_16;
  }
  uint64_t result = sub_5884(v43, &qword_6BE58);
LABEL_21:
  char v62 = 2;
LABEL_23:
  *(unsigned char *)(v78 + 16) = v62;
  return result;
}

void sub_5094(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_50BC(unsigned __int8 a1)
{
  return sub_54050();
}

BOOL sub_5104(char *a1, char *a2)
{
  return sub_3F18(*a1, *a2);
}

Swift::Int sub_5110()
{
  return sub_50BC(*v0);
}

void sub_5118(uint64_t a1)
{
  sub_5094(a1, *v1);
}

Swift::Int sub_5120()
{
  Swift::UInt v1 = *v0;
  sub_54030();
  sub_54040(v1);
  return sub_54050();
}

uint64_t sub_5164()
{
  memcpy(v2, (const void *)(v0 + 24), sizeof(v2));
  sub_5FD0((uint64_t)v2);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 152);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 192);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 232);
  sub_6068(v0 + 272);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_51C4()
{
  sub_5164();

  return _swift_deallocClassInstance(v0, 328, 7);
}

uint64_t type metadata accessor for EmergencyConfirmationFlow()
{
  return self;
}

unsigned char *initializeBufferWithCopyOfBuffer for EmergencyConfirmationFlow.EmergencyOfferActionFlowState(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EmergencyConfirmationFlow.EmergencyOfferActionFlowState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 3) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for EmergencyConfirmationFlow.EmergencyOfferActionFlowState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x5380);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_53A8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_53B4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for EmergencyConfirmationFlow.EmergencyOfferActionFlowState()
{
  return &type metadata for EmergencyConfirmationFlow.EmergencyOfferActionFlowState;
}

unint64_t sub_53D0()
{
  unint64_t result = qword_6BE38[0];
  if (!qword_6BE38[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_6BE38);
  }
  return result;
}

uint64_t sub_541C(uint64_t a1)
{
  return sub_3BE4(a1) & 1;
}

uint64_t sub_5444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *BOOL v7 = v3;
  v7[1] = sub_54F4;
  return Flow.onAsync(input:)(a1, a2, a3);
}

uint64_t sub_54F4(uint64_t a1)
{
  sub_60D8();
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_55CC()
{
  return sub_452C();
}

uint64_t sub_55F0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_568C;
  return sub_3F28(a1);
}

uint64_t sub_568C()
{
  sub_60D8();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_575C()
{
  type metadata accessor for EmergencyConfirmationFlow();

  return sub_53230();
}

uint64_t sub_5798(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2E18(&qword_6BE58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_5800(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_5828(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for EmergencyConfirmationResponseProvider();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_5884(uint64_t a1, uint64_t *a2)
{
  sub_2E18(a2);
  sub_6188();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_58D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_5920(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_597C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_59CC(uint64_t a1, long long *a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = (uint64_t *)(a7 + 16);
  *(void *)(a7 + 40) = type metadata accessor for ConfirmationFlowConfigModel();
  *(void *)(a7 + 48) = &off_66C38;
  uint64_t v15 = sub_5DC4(v14);
  sub_5E28(a1, (uint64_t)v15, (void (*)(void))type metadata accessor for ConfirmationFlowConfigModel);
  *(void *)(a7 + 120) = &type metadata for EmergencyCATProvider;
  *(void *)(a7 + 128) = &off_66E10;
  uint64_t v16 = swift_allocObject();
  *(void *)(a7 + 96) = v16;
  memcpy((void *)(v16 + 16), a3, 0x70uLL);
  sub_5F28(a2, a7 + 56);
  long long v17 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(a7 + 136) = *(_OWORD *)a4;
  *(_OWORD *)(a7 + 152) = v17;
  *(void *)(a7 + 168) = *(void *)(a4 + 32);
  *(void *)(a7 + 176) = a5;
  *(void *)(a7 + 184) = a6;
  return a7;
}

uint64_t sub_5AC4(uint64_t a1, long long *a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v26 = type metadata accessor for ConfirmationFlowConfigModel();
  BOOL v27 = &off_66C38;
  uint64_t v12 = sub_5DC4(v25);
  sub_5E28(a1, (uint64_t)v12, (void (*)(void))type metadata accessor for ConfirmationFlowConfigModel);
  v24[3] = &type metadata for EmergencyCATProvider;
  v24[4] = &off_66E10;
  v24[0] = swift_allocObject();
  memcpy((void *)(v24[0] + 16), a3, 0x70uLL);
  type metadata accessor for EmergencyPromptForConfirmationFlowStrategy();
  uint64_t v13 = swift_allocObject();
  uint64_t v14 = sub_597C((uint64_t)v25, v26);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v17 + 16))(v16);
  uint64_t v18 = sub_597C((uint64_t)v24, (uint64_t)&type metadata for EmergencyCATProvider);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v21 + 16))(v20);
  memcpy(__dst, v20, sizeof(__dst));
  uint64_t v22 = sub_59CC((uint64_t)v16, a2, __dst, a4, a5, a6, v13);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v24);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v25);
  return v22;
}

uint64_t sub_5D2C(uint64_t a1)
{
  return a1;
}

uint64_t *sub_5DC4(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_5E28(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_6188();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_5E88()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 128, 7);
}

uint64_t sub_5F28(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_5F40(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_5F88(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_58D8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_5FD0(uint64_t a1)
{
  return a1;
}

uint64_t sub_6068(uint64_t a1)
{
  return a1;
}

uint64_t sub_60F0()
{
  return swift_slowDealloc();
}

uint64_t sub_6108()
{
  return swift_beginAccess();
}

uint64_t sub_6170()
{
  return v0;
}

BOOL sub_6198(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_61B4()
{
  return v0;
}

_WORD *sub_61CC(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

void sub_61D8(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

uint64_t sub_61F0()
{
  return swift_slowAlloc();
}

uint64_t sub_6208(uint64_t a1)
{
  return sub_5800(a1, 1, v1);
}

void sub_6228(unsigned __int8 a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  unsigned int v8 = a1;
  sub_53510();
  sub_53D00();
  sub_534D0();
  sub_2E18(&qword_6BE90);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_547B0;
  *(void *)(v9 + 32) = sub_53D00();
  *(void *)(v9 + 40) = v10;
  sub_53500();
  id v11 = [objc_allocWithZone((Class)SAAceConfirmationContext) init];
  uint64_t v12 = sub_51FBC(a1);
  sub_7408(v12, v13, v11);
  sub_2E18((uint64_t *)&unk_6D490);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_547C0;
  *(void *)(v14 + 32) = v11;
  uint64_t v23 = v14;
  sub_53E80();
  id v15 = v11;
  sub_534E0();
  sub_534C0();
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_547D0;
  *(void *)(v16 + 32) = sub_53C20();
  *(void *)(v16 + 40) = v17;
  *(void *)(v16 + 48) = sub_53C20();
  *(void *)(v16 + 56) = v18;
  if (v8 <= 2)
  {
    sub_7534();
    sub_755C((uint64_t)"com.apple.siri.nl.EmergencyVerb.Value.");
    sub_53F60();
    unint64_t v20 = *(void *)(v16 + 16);
    unint64_t v19 = *(void *)(v16 + 24);
    if (v20 >= v19 >> 1) {
      uint64_t v16 = (uint64_t)sub_718C((char *)(v19 > 1), v20 + 1, 1, v16);
    }
    *(void *)(v16 + 16) = v20 + 1;
    uint64_t v21 = v16 + 16 * v20;
    *(void *)(v21 + 32) = v23;
    *(void *)(v21 + 40) = v24;
    a4 = a2;
    LOBYTE(a2) = v22;
  }
  sub_534F0();
  sub_6474(a1, a2 & 1, a3, a4);
  sub_534B0();
}

char *sub_6474(unsigned __int8 a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v34 = a3;
  unint64_t v35 = a4;
  uint64_t v5 = sub_53DB0();
  uint64_t v37 = *(void *)(v5 - 8);
  uint64_t v38 = v5;
  __chkstk_darwin(v5);
  BOOL v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_536A0();
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_53700();
  uint64_t v11 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_53650();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_2E18(&qword_6BE98);
  uint64_t v19 = __chkstk_darwin(v18 - 8);
  uint64_t v21 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v34 - v22;
  if (a1 - 1 >= 2)
  {
    if (a1) {
      sub_6A08((uint64_t)&v34 - v22);
    }
    else {
      sub_68F4(v34, v35, (uint64_t)&v34 - v22);
    }
  }
  else
  {
    sub_538B0();
    swift_allocObject();
    uint64_t v24 = sub_538A0();
    sub_6E50(v24, (uint64_t)v23);
    swift_release();
  }
  sub_7470((uint64_t)v23, (uint64_t)v21);
  if (sub_5800((uint64_t)v21, 1, v14) == 1)
  {
    sub_74D8((uint64_t)v21, &qword_6BE98);
    uint64_t v25 = sub_53D90();
    swift_beginAccess();
    uint64_t v27 = v37;
    uint64_t v26 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v7, v25, v38);
    uint64_t v28 = sub_53DA0();
    os_log_type_t v29 = sub_53EA0();
    if (os_log_type_enabled(v28, v29))
    {
      unint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v30 = 0;
      _os_log_impl(&dword_0, v28, v29, "Nil serialized UsoGraph for confirmation SDA", v30, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v26);
    int v31 = (char *)&_swiftEmptyArrayStorage;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v21, v14);
    sub_536F0();
    sub_6B94((uint64_t)v17, (uint64_t)v10);
    sub_536E0();
    sub_2E18(&qword_6BEA0);
    unint64_t v32 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    int v31 = (char *)swift_allocObject();
    *((_OWORD *)v31 + 1) = xmmword_547B0;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v31[v32], v13, v36);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  sub_74D8((uint64_t)v23, &qword_6BE98);
  return v31;
}

uint64_t sub_68F4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_53820();
  swift_allocObject();
  sub_53810();
  uint64_t v6 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v6) {
    sub_53800();
  }
  sub_53890();
  swift_allocObject();
  sub_53880();
  swift_retain();
  sub_53870();
  swift_release();
  sub_538D0();
  swift_allocObject();
  uint64_t v7 = sub_538C0();
  sub_53830();
  sub_6E50(v7, a3);
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t sub_6A08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_537A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_538F0();
  swift_allocObject();
  uint64_t v6 = sub_538E0();
  sub_53850();
  swift_allocObject();
  sub_53840();
  sub_53790();
  sub_53780();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_53900();
  sub_6E50(v6, a1);
  swift_release();
  return swift_release();
}

uint64_t sub_6B94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  uint64_t v24 = sub_536D0();
  uint64_t v2 = *(void *)(v24 - 8);
  uint64_t v3 = __chkstk_darwin(v24);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v21 - v6;
  uint64_t v8 = sub_53650();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_53730();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v21 - v17;
  sub_53720();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v22, v8);
  sub_53710();
  sub_536C0();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  sub_536B0();
  sub_53690();
  uint64_t v19 = v24;
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v24);
  sub_53680();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
}

uint64_t sub_6E50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v15 = a2;
  uint64_t v3 = sub_53DB0();
  __chkstk_darwin(v3);
  uint64_t v4 = sub_53650();
  uint64_t v14 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2E18(&qword_6BEA8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2E18((uint64_t *)&unk_6D490);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_547C0;
  *(void *)(v10 + 32) = a1;
  uint64_t v16 = v10;
  sub_53E80();
  uint64_t v11 = sub_537E0();
  sub_34DC((uint64_t)v9, 1, 1, v11);
  swift_retain();
  sub_537D0();
  swift_bridgeObjectRelease();
  sub_74D8((uint64_t)v9, &qword_6BEA8);
  sub_53740();
  swift_release();
  uint64_t v12 = v15;
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v15, v6, v4);
  return sub_34DC(v12, 0, 1, v4);
}

char *sub_718C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_2E18(&qword_6BE90);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_7374((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_727C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_727C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_53F90();
  __break(1u);
  return result;
}

char *sub_7374(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_53F90();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

void sub_7408(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = sub_53DF0();
  swift_bridgeObjectRelease();
  [a3 setReason:v4];
}

uint64_t sub_7470(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2E18(&qword_6BE98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_74D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2E18(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_7534()
{
  sub_53F30(40);
}

void sub_755C(uint64_t a1@<X8>)
{
  v2._countAndFlagsBits = 0xD000000000000026;
  v2._object = (void *)((a1 - 32) | 0x8000000000000000);
  sub_53E50(v2);
}

uint64_t type metadata accessor for EmergencySuicidePreventionBasicIntentCATs()
{
  uint64_t result = qword_6BEB0;
  if (!qword_6BEB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_75C8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_7608(uint64_t a1, char a2)
{
  return sub_7D2C(a1, a2, 0x6372616553626577, 0xEE00797265755168, 48, 0x8000000000057600);
}

uint64_t sub_7640(uint64_t a1, char a2)
{
  return sub_7D2C(a1, a2, 0x656D614E67726FLL, 0xE700000000000000, 49, 0x80000000000575C0);
}

uint64_t sub_766C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v19[0] = a5;
  v19[1] = a6;
  uint64_t v10 = sub_2E18(&qword_6BCB8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2E18(&qword_6BF00);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_547D0;
  uint64_t v14 = (uint64_t *)(v13 + 48);
  *(void *)(v13 + 32) = a3;
  *(void *)(v13 + 40) = a4;
  sub_7C74(a1, (uint64_t)v12, &qword_6BCB8);
  uint64_t v15 = sub_53AD0();
  if (sub_5800((uint64_t)v12, 1, v15) == 1)
  {
    sub_7CD4((uint64_t)v12, &qword_6BCB8);
    *(_OWORD *)uint64_t v14 = 0u;
    *(_OWORD *)(v13 + 64) = 0u;
  }
  else
  {
    *(void *)(v13 + 72) = v15;
    sub_5DC4(v14);
    sub_7D4C();
    (*(void (**)(uint64_t, char *))(v16 + 32))(v17, v12);
  }
  *(void *)(v13 + 80) = 0xD000000000000012;
  *(void *)(v13 + 88) = 0x80000000000575A0;
  *(void *)(v13 + 120) = &type metadata for Bool;
  *(unsigned char *)(v13 + 96) = a2 & 1;
  sub_53A60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_7814(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = sub_2E18(&qword_6BCB8);
  __chkstk_darwin(v7 - 8);
  sub_7D34();
  sub_2E18(&qword_6BF00);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_547E0;
  uint64_t v9 = (uint64_t *)(v8 + 48);
  *(void *)(v8 + 32) = 0x656D614E67726FLL;
  *(void *)(v8 + 40) = 0xE700000000000000;
  sub_7C74(a1, v3, &qword_6BCB8);
  uint64_t v10 = sub_53AD0();
  if (sub_5800(v3, 1, v10) == 1)
  {
    sub_7CD4(v3, &qword_6BCB8);
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v8 + 64) = 0u;
  }
  else
  {
    *(void *)(v8 + 72) = v10;
    sub_5DC4(v9);
    sub_7D4C();
    (*(void (**)(void))(v11 + 32))();
  }
  *(void *)(v8 + 80) = 0x65626D754E67726FLL;
  *(void *)(v8 + 88) = 0xE900000000000072;
  if (a2)
  {
    uint64_t v12 = sub_53A20();
    uint64_t v13 = a2;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    *(void *)(v8 + 104) = 0;
    *(void *)(v8 + 112) = 0;
  }
  *(void *)(v8 + 96) = v13;
  *(void *)(v8 + 120) = v12;
  *(void *)(v8 + 128) = 0xD000000000000012;
  *(void *)(v8 + 136) = 0x80000000000575A0;
  *(void *)(v8 + 168) = &type metadata for Bool;
  *(unsigned char *)(v8 + 144) = a3 & 1;
  swift_retain();
  sub_53A60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_7A10(uint64_t a1, uint64_t a2)
{
  return sub_7A64(a1, a2);
}

uint64_t sub_7A64(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_53B30();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_7D34();
  uint64_t v7 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v7 - 8);
  sub_7C74(a1, (uint64_t)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t *)&unk_6DA80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, a2, v5);
  uint64_t v9 = sub_53A50();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v5);
  sub_7CD4(a1, (uint64_t *)&unk_6DA80);
  return v9;
}

uint64_t sub_7BD0()
{
  uint64_t v0 = sub_53A90();

  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_7C00()
{
  return type metadata accessor for EmergencySuicidePreventionBasicIntentCATs();
}

uint64_t sub_7C08(uint64_t a1, char a2)
{
  return sub_7608(a1, a2);
}

uint64_t sub_7C2C(uint64_t a1, char a2)
{
  return sub_7640(a1, a2);
}

uint64_t sub_7C50(uint64_t a1, uint64_t a2, char a3)
{
  return sub_7814(a1, a2, a3);
}

uint64_t sub_7C74(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_2E18(a3);
  sub_7D4C();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_7CD4(uint64_t a1, uint64_t *a2)
{
  sub_2E18(a2);
  sub_7D4C();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_7D2C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_766C(a1, a2, a3, a4, a5 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a6);
}

uint64_t type metadata accessor for SexualAssaultCATs()
{
  uint64_t result = qword_6BF08;
  if (!qword_6BF08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_7DA0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_7DE0(uint64_t a1, char a2)
{
  uint64_t v4 = sub_2E18(&qword_6BCB8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2E18(&qword_6BF00);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_547D0;
  uint64_t v8 = (uint64_t *)(v7 + 48);
  *(void *)(v7 + 32) = 0x656D614E67726FLL;
  *(void *)(v7 + 40) = 0xE700000000000000;
  sub_7C74(a1, (uint64_t)v6, &qword_6BCB8);
  uint64_t v9 = sub_53AD0();
  if (sub_5800((uint64_t)v6, 1, v9) == 1)
  {
    sub_7CD4((uint64_t)v6, &qword_6BCB8);
    *(_OWORD *)uint64_t v8 = 0u;
    *(_OWORD *)(v7 + 64) = 0u;
  }
  else
  {
    *(void *)(v7 + 72) = v9;
    sub_5DC4(v8);
    sub_7D4C();
    (*(void (**)(void))(v10 + 32))();
  }
  *(void *)(v7 + 80) = 0xD000000000000012;
  *(void *)(v7 + 88) = 0x80000000000575A0;
  *(void *)(v7 + 120) = &type metadata for Bool;
  *(unsigned char *)(v7 + 96) = a2 & 1;
  sub_53A60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_7F94()
{
  sub_840C();
  return sub_8404(v0, v1, v2);
}

uint64_t sub_7FB0(uint64_t a1)
{
  return sub_8404(a1, 0x656D614E67726FLL, 0xE700000000000000);
}

uint64_t sub_7FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_2E18(&qword_6BCB8);
  __chkstk_darwin(v7 - 8);
  sub_7D34();
  sub_2E18(&qword_6BF00);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_547B0;
  uint64_t v9 = (uint64_t *)(v8 + 48);
  *(void *)(v8 + 32) = a2;
  *(void *)(v8 + 40) = a3;
  sub_7C74(a1, v3, &qword_6BCB8);
  uint64_t v10 = sub_53AD0();
  if (sub_5800(v3, 1, v10) == 1)
  {
    sub_7CD4(v3, &qword_6BCB8);
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v8 + 64) = 0u;
  }
  else
  {
    *(void *)(v8 + 72) = v10;
    sub_5DC4(v9);
    sub_7D4C();
    (*(void (**)(void))(v11 + 32))();
  }
  sub_53A60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_8148()
{
  sub_840C();
  return sub_8404(v0, v1, v2);
}

uint64_t sub_8164()
{
  return sub_53A60();
}

uint64_t sub_8188(uint64_t a1, uint64_t a2)
{
  return sub_81DC(a1, a2);
}

uint64_t sub_81DC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_53B30();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_7D34();
  uint64_t v7 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v7 - 8);
  sub_7C74(a1, (uint64_t)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t *)&unk_6DA80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, a2, v5);
  uint64_t v9 = sub_53A50();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v5);
  sub_7CD4(a1, (uint64_t *)&unk_6DA80);
  return v9;
}

uint64_t sub_8348()
{
  return type metadata accessor for SexualAssaultCATs();
}

uint64_t sub_8350(uint64_t a1, char a2)
{
  return sub_7DE0(a1, a2);
}

uint64_t sub_8374()
{
  return sub_7F94();
}

uint64_t sub_8398(uint64_t a1)
{
  return sub_7FB0(a1);
}

uint64_t sub_83BC()
{
  return sub_8148();
}

uint64_t sub_83E0()
{
  return sub_8164();
}

uint64_t sub_8404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_7FDC(a1, a2, a3);
}

uint64_t sub_8438()
{
  type metadata accessor for CsamSituation.Builder();
  swift_initStackObject();
  uint64_t v0 = (unsigned char *)sub_15AB8();
  if (sub_53CF0() == 0xD000000000000013 && v1 == 0x8000000000057760)
  {
    swift_bridgeObjectRelease();
    char v2 = 1;
  }
  else
  {
    char v2 = sub_53FE0();
    swift_bridgeObjectRelease();
  }
  v0[16] = v2 & 1;
  v0[17] = sub_53C10() & 1;
  if (sub_53CF0() == 0x7078655F6D617363 && v3 == 0xED0000746963696CLL)
  {
    swift_bridgeObjectRelease();
    char v5 = 1;
  }
  else
  {
    char v5 = sub_53FE0();
    swift_bridgeObjectRelease();
  }
  v0[18] = v5 & 1;
  if (sub_53CF0() == 0xD000000000000010 && v6 == 0x8000000000057780)
  {
    swift_bridgeObjectRelease();
    char v7 = 1;
  }
  else
  {
    char v7 = sub_53FE0();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v0[19] = v7 & 1;
  type metadata accessor for CsamSituation();
  swift_allocObject();
  return sub_15B00(v0);
}

uint64_t initializeBufferWithCopyOfBuffer for EmergencyFeatureFlagsManager(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for WebsearchFlow(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + 16);
}

uint64_t initializeWithCopy for WebsearchFlow(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = a2 + 16;
  long long v5 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v5;
  uint64_t v6 = v5;
  char v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_bridgeObjectRetain();
  v7(a1 + 16, v4, v6);
  return a1;
}

void *assignWithCopy for WebsearchFlow(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_87A8(a1 + 2, a2 + 2);
  return a1;
}

uint64_t *sub_87A8(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 initializeWithTake for WebsearchFlow(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for WebsearchFlow(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + 16);
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for WebsearchFlow(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WebsearchFlow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WebsearchFlow()
{
  return &type metadata for WebsearchFlow;
}

uint64_t sub_8AE0()
{
  uint64_t v1 = sub_53DB0();
  sub_9120();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  uint64_t v5 = sub_913C();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, v5, v1);
  uint64_t v6 = sub_53DA0();
  os_log_type_t v7 = sub_53E90();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_0, v6, v7, "WebsearchFlow onInput", v8, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return 1;
}

uint64_t sub_8C10(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_53DB0();
  sub_9120();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  uint64_t v9 = sub_913C();
  swift_beginAccess();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v7 + 16))(v2, v9, v5);
  uint64_t v10 = sub_53DA0();
  os_log_type_t v11 = sub_53E90();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_0, v10, v11, "WebsearchFlow execute", v12, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(uint64_t *, uint64_t))(v7 + 8))(v2, v5);
  sub_3048((uint64_t)(v2 + 2), (uint64_t)v20);
  sub_2C00(v20, v20[3]);
  uint64_t v13 = *v2;
  uint64_t v14 = v2[1];
  id v15 = [objc_allocWithZone((Class)SAWebSearch) init];
  sub_8FE4(v13, v14, v15);
  uint64_t v16 = sub_53E00();
  sub_903C(v16, v17, v15);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a1;
  *(void *)(v18 + 24) = a2;
  sub_90E0();
  swift_retain();
  sub_53540();

  swift_release();
  return _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v20);
}

uint64_t sub_8E30(uint64_t a1, void (*a2)(char *))
{
  uint64_t v3 = sub_53490();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_53460();
  a2(v6);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_8F0C()
{
  return 1;
}

uint64_t sub_8F2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_568C;
  return Flow.execute()(a1, a2, a3);
}

void sub_8FE4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = sub_53DF0();
  [a3 setQuery:v4];
}

void sub_903C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = sub_53DF0();
  swift_bridgeObjectRelease();
  [a3 setProvider:v4];
}

uint64_t sub_90A0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_90D8(uint64_t a1)
{
  return sub_8E30(a1, *(void (**)(char *))(v1 + 16));
}

unint64_t sub_90E0()
{
  unint64_t result = qword_6BF68;
  if (!qword_6BF68)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_6BF68);
  }
  return result;
}

uint64_t sub_913C()
{
  return sub_53D90();
}

void sub_9160()
{
  sub_9650();
  sub_9580();
  __chkstk_darwin(v1);
  sub_961C();
  if (!v3 & v2)
  {
    sub_53D90();
    sub_96D4();
    uint64_t v7 = sub_95B8();
    v8(v7);
    uint64_t v9 = sub_53DA0();
    os_log_type_t v10 = sub_53EA0();
    if (os_log_type_enabled(v9, v10))
    {
      swift_slowAlloc();
      v18[0] = swift_slowAlloc();
      sub_95D8(4.8149e-34);
      uint64_t v11 = sub_53E10();
      uint64_t v13 = sub_50F10(v11, v12, v18);
      sub_95F4(v13);
      swift_bridgeObjectRelease();
      sub_968C(&dword_0, v14, v15, "Unsupported situation for Basic CATs: %s");
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();
    }

    uint64_t v16 = sub_9674();
    v17(v16);
    sub_96C0();
    sub_9638();
  }
  else
  {
    switch(v0)
    {
      case 1:
        sub_95A0();
        uint64_t v4 = type metadata accessor for EmergencySexualAssaultBasicIntentCATs();
        uint64_t v5 = &off_66500;
        break;
      case 2:
        sub_95A0();
        uint64_t v4 = type metadata accessor for EmergencyPoisonControlBasicIntentCATs();
        uint64_t v5 = &off_66520;
        break;
      case 3:
        sub_95A0();
        uint64_t v4 = type metadata accessor for EmergencyDomesticViolenceBasicIntentCATs();
        uint64_t v5 = &off_66540;
        break;
      default:
        sub_95A0();
        uint64_t v4 = type metadata accessor for EmergencySuicidePreventionBasicIntentCATs();
        uint64_t v5 = &off_664E0;
        break;
    }
    sub_96AC(v4, (uint64_t)v5);
    sub_9638();
    swift_retain();
  }
}

void sub_9370()
{
  sub_9650();
  sub_9580();
  __chkstk_darwin(v1);
  sub_961C();
  if (!v3 & v2)
  {
    sub_53D90();
    sub_96D4();
    uint64_t v7 = sub_95B8();
    v8(v7);
    uint64_t v9 = sub_53DA0();
    os_log_type_t v10 = sub_53EA0();
    if (os_log_type_enabled(v9, v10))
    {
      swift_slowAlloc();
      v18[0] = swift_slowAlloc();
      sub_95D8(4.8149e-34);
      uint64_t v11 = sub_53E10();
      uint64_t v13 = sub_50F10(v11, v12, v18);
      sub_95F4(v13);
      swift_bridgeObjectRelease();
      sub_968C(&dword_0, v14, v15, "Unsupported situation for Sub-Area CATs: %s");
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();
    }

    uint64_t v16 = sub_9674();
    v17(v16);
    sub_96C0();
    sub_9638();
  }
  else
  {
    switch(v0)
    {
      case 1:
        sub_95A0();
        uint64_t v4 = type metadata accessor for SexualAssaultCATs();
        uint64_t v5 = &off_66678;
        break;
      case 2:
        sub_95A0();
        uint64_t v4 = type metadata accessor for PoisonControlCATs();
        uint64_t v5 = &off_666B0;
        break;
      case 3:
        sub_95A0();
        uint64_t v4 = type metadata accessor for DomesticViolenceCATs();
        uint64_t v5 = &off_666E8;
        break;
      default:
        sub_95A0();
        uint64_t v4 = type metadata accessor for SuicidePreventionCATs();
        uint64_t v5 = &off_66640;
        break;
    }
    sub_96AC(v4, (uint64_t)v5);
    sub_9638();
    swift_retain();
  }
}

void *sub_95A0()
{
  uint64_t v2 = v0[3];
  return sub_2C00(v0, v2);
}

uint64_t sub_95B8()
{
  return v0;
}

void sub_95D8(float a1)
{
  *uint64_t v2 = a1;
  *(void *)(v3 - 128) = v2 + 1;
  *(unsigned char *)(v3 - 120) = v1;
}

uint64_t sub_95F4(uint64_t a1)
{
  *(void *)(v1 - 120) = a1;
  return sub_53EF0();
}

uint64_t sub_9650()
{
  return sub_53DB0();
}

uint64_t sub_9674()
{
  return v0;
}

void sub_968C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_96AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v2[3] = a1;
  v2[4] = a2;
  *uint64_t v2 = v3;
  return v3;
}

double sub_96C0()
{
  *(void *)(v0 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)uint64_t v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  return result;
}

uint64_t sub_96D4()
{
  return swift_beginAccess();
}

uint64_t type metadata accessor for EmergencySexualAssaultBasicIntentModernCATs()
{
  uint64_t result = qword_6BF70;
  if (!qword_6BF70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_973C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_977C(uint64_t a1, uint64_t a2)
{
  return sub_97D0(a1, a2);
}

uint64_t sub_97D0(uint64_t a1, uint64_t a2)
{
  sub_53B30();
  sub_9AD8();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_6140();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v11 - 8);
  sub_6140();
  sub_9A10(a1, v13 - v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v10, a2, v2);
  uint64_t v14 = sub_53AE0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v2);
  sub_9A78(a1);
  return v14;
}

uint64_t sub_98FC(uint64_t a1, uint64_t a2)
{
  sub_53B30();
  sub_9AD8();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_6140();
  uint64_t v9 = v8 - v7;
  swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v9, a2, v2);
  uint64_t v10 = sub_53AF0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v2);
  return v10;
}

uint64_t sub_99D8()
{
  uint64_t v0 = sub_53B00();

  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_9A08()
{
  return type metadata accessor for EmergencySexualAssaultBasicIntentModernCATs();
}

uint64_t sub_9A10(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2E18((uint64_t *)&unk_6DA80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_9A78(uint64_t a1)
{
  uint64_t v2 = sub_2E18((uint64_t *)&unk_6DA80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_9AF8()
{
  if (qword_6B8F8 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_9B54()
{
  sub_2E18(&qword_6C0C8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_549A0;
  if (qword_6B900 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_6BFD0;
  *(void *)(v0 + 56) = sub_2E18(&qword_6C000);
  *(void *)(v0 + 64) = sub_A5C8(&qword_6C0D0, &qword_6C000);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = qword_6B908;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_6BFD8;
  *(void *)(v0 + 96) = sub_2E18(&qword_6C008);
  *(void *)(v0 + 104) = sub_A5C8(&qword_6C0D8, &qword_6C008);
  *(void *)(v0 + 72) = v3;
  uint64_t v4 = qword_6B910;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_6BFE0;
  *(void *)(v0 + 136) = sub_2E18(&qword_6BFF8);
  *(void *)(v0 + 144) = sub_A5C8(&qword_6C0E0, &qword_6BFF8);
  *(void *)(v0 + 112) = v5;
  uint64_t v6 = qword_6B918;
  swift_retain();
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_6BFE8;
  *(void *)(v0 + 176) = sub_2E18(&qword_6C010);
  *(void *)(v0 + 184) = sub_A5C8(&qword_6C0E8, &qword_6C010);
  *(void *)(v0 + 152) = v7;
  uint64_t v8 = qword_6B920;
  swift_retain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_6BFF0;
  *(void *)(v0 + 216) = sub_2E18(&qword_6C018);
  *(void *)(v0 + 224) = sub_A5C8(&qword_6C0F0, &qword_6C018);
  *(void *)(v0 + 192) = v9;
  qword_6BFC0 = v0;

  return swift_retain();
}

uint64_t sub_9DD0()
{
  if (qword_6B8F0 != -1) {
    swift_once();
  }
  sub_53760();
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t result = sub_53750();
  qword_6BFC8 = result;
  return result;
}

uint64_t sub_9E70(uint64_t a1)
{
  return sub_9F44(a1, &qword_6C000, 0x636E656772656D65, 0xED00006272655679, &qword_6BFD0);
}

uint64_t sub_9EA4(uint64_t a1)
{
  return sub_A618(a1, &qword_6C008, 18, 0x8000000000057810, &qword_6BFD8);
}

uint64_t sub_9ECC(uint64_t a1)
{
  return sub_A618(a1, &qword_6BFF8, 21, 0x80000000000577F0, &qword_6BFE0);
}

uint64_t sub_9EF4(uint64_t a1)
{
  return sub_A618(a1, &qword_6C010, 21, 0x8000000000057830, &qword_6BFE8);
}

uint64_t sub_9F1C(uint64_t a1)
{
  return sub_A618(a1, &qword_6C018, 18, 0x8000000000057850, &qword_6BFF0);
}

uint64_t sub_9F44(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  sub_2E18(a2);
  swift_allocObject();
  uint64_t result = sub_53770();
  *a5 = result;
  return result;
}

uint64_t sub_9FA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_53920();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_A00C()
{
  return sub_9AF8();
}

uint64_t sub_A024(uint64_t a1)
{
  uint64_t v2 = sub_A584(&qword_6C0C0);

  return NLIntentWrapper.traversableIntentNode.getter(a1, v2);
}

uint64_t sub_A08C(uint64_t a1)
{
  uint64_t v2 = sub_A584(&qword_6C0C0);

  return NLIntentWrapper.traversableOntologyNode.getter(a1, v2);
}

uint64_t sub_A0E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_53920();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_A154(uint64_t a1)
{
  uint64_t v2 = sub_53920();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_A1B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_53920();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_A21C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_53920();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_A280(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_53920();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_A2E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_53920();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_A348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_A35C);
}

uint64_t sub_A35C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_53920();

  return sub_5800(a1, a2, v4);
}

uint64_t sub_A3A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_A3B8);
}

uint64_t sub_A3B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_53920();

  return sub_34DC(a1, a2, a2, v4);
}

uint64_t type metadata accessor for EmergencyNLIntent()
{
  uint64_t result = qword_6C078;
  if (!qword_6C078) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_A44C()
{
  uint64_t result = sub_53920();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_A4D8()
{
  return sub_A584(&qword_6C0B0);
}

uint64_t sub_A50C()
{
  return sub_A584(&qword_6C0B8);
}

uint64_t sub_A540(uint64_t a1)
{
  uint64_t result = sub_A584(&qword_6C0C0);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_A584(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for EmergencyNLIntent();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_A5C8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_58D8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_A618(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return sub_9F44(a1, a2, a3 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a4, a5);
}

uint64_t type metadata accessor for SuicidePreventionCATs()
{
  uint64_t result = qword_6C0F8;
  if (!qword_6C0F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_A668()
{
  return swift_initClassMetadata2();
}

uint64_t sub_A6A8(char a1)
{
  sub_2E18(&qword_6BF00);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_547B0;
  *(void *)(v2 + 32) = 0xD000000000000012;
  *(void *)(v2 + 40) = 0x80000000000575A0;
  *(void *)(v2 + 72) = &type metadata for Bool;
  *(unsigned char *)(v2 + 48) = a1;
  sub_53A60();

  return swift_bridgeObjectRelease();
}

uint64_t sub_A75C()
{
  sub_840C();
  return sub_AC10(v0, v1, v2);
}

uint64_t sub_A778(uint64_t a1)
{
  return sub_AC10(a1, 0x656D614E67726FLL, 0xE700000000000000);
}

uint64_t sub_A7A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_2E18(&qword_6BCB8);
  __chkstk_darwin(v7 - 8);
  sub_7D34();
  sub_2E18(&qword_6BF00);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_547B0;
  uint64_t v9 = (uint64_t *)(v8 + 48);
  *(void *)(v8 + 32) = a2;
  *(void *)(v8 + 40) = a3;
  sub_ABAC(a1, v3, &qword_6BCB8);
  uint64_t v10 = sub_53AD0();
  if (sub_5800(v3, 1, v10) == 1)
  {
    sub_74D8(v3, &qword_6BCB8);
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v8 + 64) = 0u;
  }
  else
  {
    *(void *)(v8 + 72) = v10;
    uint64_t v11 = sub_5DC4(v9);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v11, v3, v10);
  }
  sub_53A60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_A914()
{
  sub_840C();
  return sub_AC10(v0, v1, v2);
}

uint64_t sub_A930()
{
  return sub_53A60();
}

uint64_t sub_A954(uint64_t a1, uint64_t a2)
{
  return sub_A9A8(a1, a2);
}

uint64_t sub_A9A8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_53B30();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_7D34();
  uint64_t v7 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v7 - 8);
  sub_ABAC(a1, (uint64_t)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t *)&unk_6DA80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, a2, v5);
  uint64_t v9 = sub_53A50();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v5);
  sub_74D8(a1, (uint64_t *)&unk_6DA80);
  return v9;
}

uint64_t sub_AB14()
{
  return type metadata accessor for SuicidePreventionCATs();
}

uint64_t sub_AB1C()
{
  return sub_A75C();
}

uint64_t sub_AB40(uint64_t a1)
{
  return sub_A778(a1);
}

uint64_t sub_AB64()
{
  return sub_A914();
}

uint64_t sub_AB88()
{
  return sub_A930();
}

uint64_t sub_ABAC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_2E18(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_AC10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_A7A4(a1, a2, a3);
}

uint64_t type metadata accessor for EmergencySuicidePreventionBasicIntentCATPatternsExecutor(uint64_t a1)
{
  return sub_B5B4(a1, (uint64_t *)&unk_6C148);
}

uint64_t sub_AC38()
{
  return swift_initClassMetadata2();
}

uint64_t sub_AC78(uint64_t a1, uint64_t a2)
{
  return sub_ACCC(a1, a2);
}

uint64_t sub_ACCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_53B30();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v8 - 8);
  sub_9A10(a1, (uint64_t)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v10 = sub_53A50();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_9A78(a1);
  return v10;
}

uint64_t sub_AE34()
{
  return type metadata accessor for EmergencySuicidePreventionBasicIntentCATPatternsExecutor(0);
}

uint64_t *sub_AE3C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (char *)a1 + v5;
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = sub_53AD0();
    if (sub_5800((uint64_t)v7, 1, v8))
    {
      uint64_t v9 = sub_2E18(&qword_6BCB8);
      memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, char *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
      sub_34DC((uint64_t)v6, 0, 1, v8);
    }
  }
  return v3;
}

uint64_t sub_AF64(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_53AD0();
  uint64_t result = sub_5800(v2, 1, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v5(v2, v3);
  }
  return result;
}

unsigned char *sub_AFF0(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_53AD0();
  if (sub_5800((uint64_t)v6, 1, v7))
  {
    uint64_t v8 = sub_2E18(&qword_6BCB8);
    memcpy(v5, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
    sub_34DC((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

unsigned char *sub_B0C8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_53AD0();
  int v8 = sub_5800((uint64_t)v5, 1, v7);
  int v9 = sub_5800((uint64_t)v6, 1, v7);
  if (!v8)
  {
    uint64_t v10 = *(void *)(v7 - 8);
    if (!v9)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 24))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v9)
  {
LABEL_6:
    uint64_t v11 = sub_2E18(&qword_6BCB8);
    memcpy(v5, v6, *(void *)(*(void *)(v11 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 16))(v5, v6, v7);
  sub_34DC((uint64_t)v5, 0, 1, v7);
  return a1;
}

unsigned char *sub_B228(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_53AD0();
  if (sub_5800((uint64_t)v6, 1, v7))
  {
    uint64_t v8 = sub_2E18(&qword_6BCB8);
    memcpy(v5, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
    sub_34DC((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

unsigned char *sub_B300(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = &a1[v4];
  uint64_t v6 = &a2[v4];
  uint64_t v7 = sub_53AD0();
  int v8 = sub_5800((uint64_t)v5, 1, v7);
  int v9 = sub_5800((uint64_t)v6, 1, v7);
  if (!v8)
  {
    uint64_t v10 = *(void *)(v7 - 8);
    if (!v9)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 40))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v9)
  {
LABEL_6:
    uint64_t v11 = sub_2E18(&qword_6BCB8);
    memcpy(v5, v6, *(void *)(*(void *)(v11 - 8) + 64));
    return a1;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  sub_34DC((uint64_t)v5, 0, 1, v7);
  return a1;
}

uint64_t sub_B460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_B474);
}

uint64_t sub_B474(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *a1;
    BOOL v5 = v4 >= 2;
    int v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5) {
      return (v6 + 1);
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v10 = sub_2E18(&qword_6BCB8);
    uint64_t v11 = (uint64_t)&a1[*(int *)(a3 + 20)];
    return sub_5800(v11, a2, v10);
  }
}

uint64_t sub_B500(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_B514);
}

unsigned char *sub_B514(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  BOOL v5 = result;
  if (a3 == 254)
  {
    *uint64_t result = a2 + 1;
  }
  else
  {
    uint64_t v7 = sub_2E18(&qword_6BCB8);
    uint64_t v8 = (uint64_t)&v5[*(int *)(a4 + 20)];
    return (unsigned char *)sub_34DC(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for EmergencySuicidePreventionBasicIntentNoResourceParameters(uint64_t a1)
{
  return sub_B5B4(a1, (uint64_t *)&unk_6C1F0);
}

uint64_t sub_B5B4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_B5E8()
{
  sub_B680();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_B680()
{
  if (!qword_6C200)
  {
    sub_53AD0();
    unint64_t v0 = sub_53EE0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_6C200);
    }
  }
}

uint64_t type metadata accessor for EmergencyErrorsCATs()
{
  uint64_t result = qword_6C230;
  if (!qword_6C230) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_B720()
{
  return swift_initClassMetadata2();
}

uint64_t sub_B760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2E18(&qword_6BCB8);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  int v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v20 - v10;
  sub_2E18(&qword_6BF00);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_547E0;
  uint64_t v13 = (uint64_t *)(v12 + 48);
  *(void *)(v12 + 32) = 0x656D614E67726FLL;
  *(void *)(v12 + 40) = 0xE700000000000000;
  sub_7C74(a1, (uint64_t)v11, &qword_6BCB8);
  uint64_t v14 = sub_53AD0();
  if (sub_5800((uint64_t)v11, 1, v14) == 1)
  {
    sub_7CD4((uint64_t)v11, &qword_6BCB8);
    *(_OWORD *)uint64_t v13 = 0u;
    *(_OWORD *)(v12 + 64) = 0u;
  }
  else
  {
    *(void *)(v12 + 72) = v14;
    sub_5DC4(v13);
    sub_7D4C();
    (*(void (**)(void))(v15 + 32))();
  }
  *(void *)(v12 + 80) = 0x6D754E656E6F6870;
  *(void *)(v12 + 88) = 0xEB00000000726562;
  if (a2)
  {
    uint64_t v16 = sub_53A20();
    uint64_t v17 = a2;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v16 = 0;
    *(void *)(v12 + 104) = 0;
    *(void *)(v12 + 112) = 0;
  }
  *(void *)(v12 + 96) = v17;
  *(void *)(v12 + 120) = v16;
  *(void *)(v12 + 128) = 0x65746973626577;
  *(void *)(v12 + 136) = 0xE700000000000000;
  sub_7C74(a3, (uint64_t)v9, &qword_6BCB8);
  if (sub_5800((uint64_t)v9, 1, v14) == 1)
  {
    swift_retain();
    sub_7CD4((uint64_t)v9, &qword_6BCB8);
    *(_OWORD *)(v12 + 144) = 0u;
    *(_OWORD *)(v12 + 160) = 0u;
  }
  else
  {
    *(void *)(v12 + 168) = v14;
    sub_5DC4((uint64_t *)(v12 + 144));
    sub_7D4C();
    (*(void (**)(void))(v18 + 32))();
    swift_retain();
  }
  sub_53A60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_BA08(uint64_t a1, uint64_t a2)
{
  return sub_BA5C(a1, a2);
}

uint64_t sub_BA5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_53B30();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v8 - 8);
  sub_7C74(a1, (uint64_t)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t *)&unk_6DA80);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v10 = sub_53A50();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_7CD4(a1, (uint64_t *)&unk_6DA80);
  return v10;
}

uint64_t sub_BBD8()
{
  return type metadata accessor for EmergencyErrorsCATs();
}

uint64_t sub_BBE0(uint64_t a1)
{
  uint64_t v2 = sub_535F0();
  sub_60C0();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v6);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v7);
  v154 = (char *)&v129 - v8;
  uint64_t v9 = type metadata accessor for EmergencyNLIntent();
  uint64_t v10 = sub_FEC4(v9);
  __chkstk_darwin(v10);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v11);
  sub_FE14((uint64_t)&v129 - v12);
  uint64_t v146 = sub_53920();
  sub_60C0();
  uint64_t v150 = v13;
  __chkstk_darwin(v14);
  sub_6150();
  sub_FE14(v15);
  uint64_t v16 = sub_53670();
  uint64_t v17 = sub_FEC4(v16);
  __chkstk_darwin(v17);
  sub_6150();
  sub_FE14(v18);
  uint64_t v19 = sub_53CD0();
  uint64_t v20 = sub_FEC4(v19);
  __chkstk_darwin(v20);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v21);
  sub_FE14((uint64_t)&v129 - v22);
  uint64_t v136 = sub_53620();
  sub_60C0();
  uint64_t v142 = v23;
  __chkstk_darwin(v24);
  sub_6150();
  sub_FE14(v25);
  uint64_t v153 = sub_53600();
  sub_60C0();
  uint64_t v152 = v26;
  __chkstk_darwin(v27);
  sub_6150();
  uint64_t v155 = v28;
  sub_535B0();
  sub_60C0();
  __chkstk_darwin(v29);
  sub_FF48();
  uint64_t v30 = sub_53DB0();
  sub_60C0();
  uint64_t v32 = v31;
  __chkstk_darwin(v33);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v34);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v35);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v36);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v37);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v38);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v39);
  uint64_t v40 = sub_53D90();
  sub_6108();
  uint64_t v41 = *(void (**)(uint64_t))(v32 + 16);
  uint64_t v151 = v40;
  uint64_t v157 = v32 + 16;
  uint64_t v158 = v30;
  v156 = v41;
  sub_FE98();
  v42();
  uint64_t v148 = a1;
  sub_FE98();
  v43();
  uint64_t v44 = sub_53DA0();
  os_log_type_t v45 = sub_53E90();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v132 = v2;
    uint64_t v46 = sub_1001C();
    uint64_t v131 = v4;
    v47 = (uint8_t *)v46;
    uint64_t v48 = swift_slowAlloc();
    uint64_t v130 = v32;
    v159[0] = v48;
    *(_DWORD *)v47 = 136315138;
    v129 = v47 + 4;
    sub_FAFC(&qword_6C3D8, 255, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v49 = sub_53FD0();
    uint64_t v163 = sub_50F10(v49, v50, v159);
    uint64_t v2 = v132;
    sub_53EF0();
    swift_bridgeObjectRelease();
    sub_FF30();
    v51();
    _os_log_impl(&dword_0, v44, v45, "#GeneralEmergencyFlow onInput: %s", v47, 0xCu);
    swift_arrayDestroy();
    sub_60F0();
    uint64_t v4 = v131;
    sub_60F0();

    uint64_t v52 = v130;
    uint64_t v53 = v130;
  }
  else
  {
    sub_FF30();
    v54();

    uint64_t v53 = v32;
    uint64_t v52 = v32;
  }
  unint64_t v55 = *(void (**)(void))(v53 + 8);
  sub_FE88();
  v55();
  uint64_t v56 = v155;
  sub_535A0();
  char v57 = (void (*)(uint64_t))v152;
  uint64_t v58 = v153;
  int v59 = (*(uint64_t (**)(uint64_t, uint64_t))(v152 + 88))(v56, v153);
  char v60 = v154;
  uint64_t v61 = v151;
  if (v59 == enum case for Parse.NLv3IntentOnly(_:))
  {
    uint64_t v62 = sub_FE3C();
    v63(v62);
    sub_FFFC();
    v64();
    sub_6108();
    uint64_t v65 = sub_FF10((uint64_t)&v165);
    v57(v65);
    uint64_t v66 = (void *)sub_53DA0();
    os_log_type_t v67 = sub_53E90();
    if (sub_FF7C(v67))
    {
      *(_WORD *)sub_61F0() = 0;
      sub_FED0(&dword_0, v68, v69, "GeneralEmergencyFlow onInput .NLv3IntentOnly");
      sub_60F0();
    }

    sub_FE88();
    v55();
    uint64_t v70 = v150;
    uint64_t v71 = v145;
    uint64_t v72 = v149;
    sub_FE98();
    v73();
    uint64_t v74 = v144;
    sub_F9E4(v71, v144, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    char v75 = sub_E8D8(v74);
    sub_FA44(v71, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    (*(void (**)(uint64_t, char *))(v70 + 8))(v72, v60);
    goto LABEL_25;
  }
  if (v59 != enum case for Parse.directInvocation(_:))
  {
    if (v59 != enum case for Parse.uso(_:))
    {
      sub_6108();
      v110 = v138;
      sub_FE24();
      v111();
      v112 = (void *)sub_53DA0();
      os_log_type_t v113 = sub_53EA0();
      if (sub_FFD0(v113))
      {
        sub_1001C();
        uint64_t v163 = sub_FF98();
        _DWORD *v110 = 136315138;
        LOBYTE(v160) = 0;
        uint64_t v114 = sub_53E10();
        uint64_t v160 = sub_50F10(v114, v115, &v163);
        uint64_t v58 = v153;
        sub_53EF0();
        char v57 = (void (*)(uint64_t))v152;
        swift_bridgeObjectRelease();
        sub_FEF0(&dword_0, v116, v117, "%s");
        swift_arrayDestroy();
        sub_60F0();
        sub_60F0();
      }

      sub_FE88();
      v55();
      (*((void (**)(uint64_t, uint64_t))v57 + 1))(v155, v58);
      return 0;
    }
    uint64_t v85 = sub_FE3C();
    v86(v85);
    sub_FFFC();
    v87();
    sub_6108();
    uint64_t v88 = sub_FF10((uint64_t)v164);
    v57(v88);
    v89 = (void *)sub_53DA0();
    os_log_type_t v90 = sub_53E90();
    if (sub_FF7C(v90))
    {
      *(_WORD *)sub_61F0() = 0;
      sub_FED0(&dword_0, v91, v92, "#GeneralEmergencyFlow onInput .uso");
      sub_60F0();
    }

    sub_FE88();
    v55();
    uint64_t v93 = v141;
    sub_53610();
    v159[3] = (uint64_t)&type metadata for EmergencyFeatureFlagsKey;
    v159[4] = sub_F998();
    LOBYTE(v159[0]) = 2;
    sub_53640();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v159);
    uint64_t v94 = v135;
    sub_53CC0();
    uint64_t v95 = v134;
    sub_F9E4(v94, v134, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
    char v75 = sub_E628(v95);
    sub_FA44(v94, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
    (*(void (**)(uint64_t, char *))(v142 + 8))(v93, v60);
    goto LABEL_25;
  }
  uint64_t v76 = sub_FE3C();
  v77(v76);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v60, v56, v2);
  sub_6108();
  uint64_t v78 = v140;
  sub_FE24();
  v79();
  v80 = (void *)sub_53DA0();
  os_log_type_t v81 = sub_53E90();
  if (sub_FF7C(v81))
  {
    *(_WORD *)sub_61F0() = 0;
    sub_FED0(&dword_0, v82, v83, "GeneralEmergencyFlow onInput .directInvocation");
    sub_60F0();
  }

  uint64_t v155 = v52 + 8;
  ((void (*)(uint64_t, uint64_t))v55)(v78, v158);
  if (sub_535D0() == 0xD000000000000035 && v84 == 0x8000000000057B10)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v96 = sub_53FE0();
    swift_bridgeObjectRelease();
    if ((v96 & 1) == 0) {
      goto LABEL_20;
    }
  }
  if (sub_2C188() == 35)
  {
LABEL_20:
    uint64_t v153 = (uint64_t)v55;
    sub_6108();
    v97 = v137;
    sub_FE24();
    v98();
    v99 = *(void (**)(uint64_t, char *, uint64_t))(v4 + 16);
    uint64_t v100 = v139;
    v99(v139, v60, v2);
    v101 = (void *)sub_53DA0();
    os_log_type_t v102 = sub_53EA0();
    if (sub_FFD0(v102))
    {
      sub_1001C();
      uint64_t v157 = sub_FF98();
      uint64_t v160 = v157;
      _DWORD *v97 = 136315138;
      v156 = (void (*)(uint64_t))(v97 + 1);
      ((void (*)(uint64_t, uint64_t))v99)(v133, v100);
      uint64_t v103 = sub_53E10();
      uint64_t v162 = sub_50F10(v103, v104, &v160);
      sub_53EF0();
      swift_bridgeObjectRelease();
      v105 = *(void (**)(void))(v4 + 8);
      sub_FF30();
      v105();
      sub_FEF0(&dword_0, v106, v107, "Failed to get emergencySituation from DirectInvocation: %s");
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();

      uint64_t v108 = sub_FEA4();
      v109(v108);
      sub_FF30();
      v105();
    }
    else
    {

      v126 = *(void (**)(void))(v4 + 8);
      sub_FF30();
      v126();
      uint64_t v127 = sub_FEA4();
      v128(v127);
      sub_FF30();
      v126();
    }
    return 0;
  }
  char v75 = sub_53BF0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v60, v2);
  char v57 = v156;
LABEL_25:
  if (v75 != 35)
  {
    *(unsigned char *)(v143 + 216) = v75;
    return 1;
  }
  sub_6108();
  v118 = v147;
  ((void (*)(_DWORD *, uint64_t, uint64_t))v57)(v147, v61, v158);
  v119 = (void *)sub_53DA0();
  os_log_type_t v120 = sub_53EA0();
  if (sub_FFD0(v120))
  {
    sub_1001C();
    uint64_t v162 = sub_FF98();
    _DWORD *v118 = 136315138;
    LOBYTE(v161) = 0;
    uint64_t v121 = sub_53E10();
    uint64_t v161 = sub_50F10(v121, v122, &v162);
    sub_53EF0();
    swift_bridgeObjectRelease();
    sub_FEF0(&dword_0, v123, v124, "%s");
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();
  }

  sub_FE88();
  v55();
  return 0;
}

uint64_t sub_CA64()
{
  sub_10010();
  v1[136] = v0;
  v1[135] = v2;
  uint64_t v3 = sub_2E18(&qword_6BCA8);
  sub_FEC4(v3);
  v1[137] = swift_task_alloc();
  uint64_t v4 = sub_53B50();
  v1[138] = v4;
  sub_FEC4(v4);
  v1[139] = swift_task_alloc();
  uint64_t v5 = sub_539D0();
  v1[140] = v5;
  sub_FDFC(v5);
  v1[141] = v6;
  v1[142] = swift_task_alloc();
  v1[143] = swift_task_alloc();
  uint64_t v7 = sub_53DB0();
  v1[144] = v7;
  sub_FDFC(v7);
  v1[145] = v8;
  v1[146] = swift_task_alloc();
  v1[147] = swift_task_alloc();
  v1[148] = swift_task_alloc();
  v1[149] = swift_task_alloc();
  v1[150] = swift_task_alloc();
  return _swift_task_switch(sub_CBD4, 0, 0);
}

uint64_t sub_CBD4()
{
  uint64_t v1 = v0[150];
  uint64_t v2 = v0[145];
  uint64_t v3 = v0[144];
  uint64_t v4 = sub_53D90();
  v0[151] = v4;
  sub_6108();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v0[152] = v5;
  v0[153] = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v3);
  uint64_t v6 = sub_53DA0();
  os_log_type_t v7 = sub_53E90();
  if (sub_6198(v7))
  {
    uint64_t v8 = (uint8_t *)sub_61F0();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_0, v6, (os_log_type_t)v1, "#GeneralEmergencyFlow execute", v8, 2u);
    sub_60F0();
  }
  uint64_t v9 = v0[150];
  uint64_t v10 = v0[145];
  uint64_t v11 = v0[144];
  uint64_t v12 = v0[136];

  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  v0[154] = v13;
  v0[155] = (v10 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v13(v9, v11);
  int v14 = *(unsigned __int8 *)(v12 + 216);
  if (v14 == 36)
  {
    sub_53460();
    goto LABEL_19;
  }
  if (v14 == 35)
  {
    uint64_t v15 = v0[136];
    uint64_t v16 = v0[135];
    sub_F824();
    uint64_t v17 = swift_allocError();
    *uint64_t v18 = 2;
    sub_2940(v17, v15 + 16, (void *)(v15 + 56), v16);
    swift_errorRelease();
    goto LABEL_19;
  }
  uint64_t v19 = v0[142];
  uint64_t v20 = v0[141];
  uint64_t v55 = v0[143];
  uint64_t v56 = v0[140];
  uint64_t v21 = (void *)v0[136];
  uint64_t v23 = v21[5];
  uint64_t v22 = v21[6];
  sub_2C00(v21 + 2, v23);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v22);
  sub_2C00(v0 + 110, v0[113]);
  sub_53330();
  sub_539C0();
  sub_FAFC(&qword_6C3A8, 255, (void (*)(uint64_t))&type metadata accessor for DeviceRestrictions);
  char v24 = sub_53F10();
  uint64_t v25 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  v25(v19, v56);
  v25(v55, v56);
  if (v24)
  {
    uint64_t v26 = v0[149];
    uint64_t v27 = v0[144];
    sub_6108();
    v5(v26, v4, v27);
    uint64_t v28 = sub_53DA0();
    os_log_type_t v29 = sub_53E90();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)sub_61F0();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_0, v28, v29, "#GeneralEmergencyFlow phoneFeaturesUnavailable, routing to CannedHelp instead", v30, 2u);
      sub_60F0();
    }
    uint64_t v31 = v0[136];

    uint64_t v32 = sub_FF64();
    v33(v32);
    uint64_t v34 = sub_2C00((void *)(v31 + 56), *(void *)(v31 + 80));
    memcpy(v0 + 82, v34, 0x70uLL);
    sub_462A4();
    sub_53450();
    swift_release();
LABEL_18:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v0 + 110));
LABEL_19:
    sub_FE54();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_FFB4();
    __asm { BRAA            X1, X16 }
  }
  if (sub_53CF0() == 0xD00000000000001ALL && v35 == 0x8000000000057AF0)
  {
    swift_bridgeObjectRelease();
    uint64_t v36 = v5;
LABEL_15:
    uint64_t v38 = v0[148];
    uint64_t v39 = v0[144];
    sub_6108();
    v36(v38, v4, v39);
    uint64_t v40 = sub_53DA0();
    os_log_type_t v41 = sub_53E90();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)sub_61F0();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl(&dword_0, v40, v41, "#GeneralEmergencyFlow Providing Low Risk response", v42, 2u);
      sub_60F0();
    }
    uint64_t v43 = v0[139];

    uint64_t v44 = sub_FF64();
    v45(v44);
    sub_D75C();
    sub_FAFC((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
    sub_53440();
    sub_FA44(v43, (void (*)(void))&type metadata accessor for OutputFlow);
    goto LABEL_18;
  }
  char v37 = sub_53FE0();
  swift_bridgeObjectRelease();
  uint64_t v36 = v5;
  if (v37) {
    goto LABEL_15;
  }
  uint64_t v48 = (void *)swift_task_alloc();
  v0[156] = v48;
  *uint64_t v48 = v0;
  v48[1] = sub_D204;
  sub_FFB4();
  return sub_167DC(v49, v50, v51, v52);
}

uint64_t sub_D204()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  return _swift_task_switch(sub_D2D0, 0, 0);
}

void sub_D2D0()
{
  uint64_t v30 = (void *)(v0 + 880);
  sub_F214(v0 + 272, v0 + 528);
  int v1 = sub_F27C(v0 + 528);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1216);
  uint64_t v3 = *(void *)(v0 + 1208);
  uint64_t v4 = *(void *)(v0 + 1152);
  if (v1 == 1)
  {
    __dst = (void *)(v0 + 768);
    uint64_t v29 = v0 + 144;
    uint64_t v5 = *(void *)(v0 + 1168);
    sub_6108();
    v2(v5, v3, v4);
    uint64_t v6 = sub_53DA0();
    os_log_type_t v7 = sub_53E90();
    if (sub_6198(v7))
    {
      uint64_t v8 = (uint8_t *)sub_61F0();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_0, v6, (os_log_type_t)v4, "#GeneralEmergencyFlow No orgInfo found for language/locale. Presenting generic offerEmergencyCall button.", v8, 2u);
      sub_60F0();
    }
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v0 + 1232);
    uint64_t v10 = *(void *)(v0 + 1168);
    uint64_t v11 = *(void *)(v0 + 1152);
    uint64_t v12 = *(void *)(v0 + 1112);
    uint64_t v13 = *(void *)(v0 + 1088);

    v9(v10, v11);
    sub_F294((_OWORD *)(v0 + 400));
    sub_F214(v0 + 400, v29);
    int v14 = sub_2C00((void *)(v13 + 56), *(void *)(v13 + 80));
    memcpy(__dst, v14, 0x70uLL);
    uint64_t v15 = v0 + 880;
    sub_F2AC(v29, v30, __dst);
    sub_2C00((void *)(v13 + 56), *(void *)(v13 + 80));
    swift_retain();
    sub_25BD4();
    swift_release();
    sub_3048(v13 + 16, v0 + 920);
    sub_53B40();
    sub_FAFC((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
    sub_53440();
    sub_FA44(v12, (void (*)(void))&type metadata accessor for OutputFlow);
  }
  else
  {
    uint64_t v16 = *(void *)(v0 + 1176);
    memcpy((void *)(v0 + 16), (const void *)(v0 + 528), 0x80uLL);
    sub_6108();
    v2(v16, v3, v4);
    uint64_t v17 = sub_53DA0();
    os_log_type_t v18 = sub_53E90();
    if (sub_6198(v18))
    {
      uint64_t v19 = (uint8_t *)sub_61F0();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_0, v17, (os_log_type_t)v4, "#GeneralEmergencyFlow Providing High Risk response", v19, 2u);
      sub_60F0();
    }
    uint64_t v20 = *(void (**)(uint64_t, uint64_t))(v0 + 1232);
    uint64_t v21 = *(void *)(v0 + 1176);
    uint64_t v22 = *(void *)(v0 + 1152);
    uint64_t v23 = *(void *)(v0 + 1096);
    char v24 = *(void **)(v0 + 1088);

    v20(v21, v22);
    sub_2C00(v24 + 7, v24[10]);
    swift_retain();
    uint64_t v15 = v0 + 880;
    char v25 = sub_43838(v30);
    sub_283C0(v25 & 1);
    swift_release();
    sub_2C00(v24 + 22, v24[25]);
    sub_DE3C((void *)(v0 + 16), v23);
    sub_F724((uint64_t *)(v0 + 272));
    sub_53450();
    swift_release();
    sub_5884(v23, &qword_6BCA8);
  }
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v15);
  sub_FE54();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_FFB4();
  __asm { BRAA            X1, X16 }
}

uint64_t sub_D6D0()
{
  type metadata accessor for GeneralEmergencyFlow();
  sub_FAFC(&qword_6C3A0, v0, (void (*)(uint64_t))type metadata accessor for GeneralEmergencyFlow);
  return sub_531E0();
}

uint64_t sub_D75C()
{
  uint64_t v1 = sub_2E18(&qword_6BCA8);
  uint64_t v2 = sub_FEC4(v1);
  __chkstk_darwin(v2);
  sub_6140();
  uint64_t v3 = sub_2C00(v0 + 7, v0[10]);
  memcpy(__dst, v3, sizeof(__dst));
  sub_ED0C(v0 + 2, __dst);
  sub_2C00(v0 + 7, v0[10]);
  swift_retain();
  sub_28474();
  swift_release();
  sub_3048((uint64_t)(v0 + 2), (uint64_t)v5);
  return sub_53B40();
}

uint64_t sub_D850()
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 16);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 56);
  sub_6068(v0 + 96);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 136);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 176);
  return v0;
}

uint64_t sub_D890()
{
  sub_D850();

  return _swift_deallocClassInstance(v0, 217, 7);
}

uint64_t type metadata accessor for GeneralEmergencyFlow()
{
  return self;
}

uint64_t getEnumTagSinglePayload for GeneralEmergencyFlow.GeneralEmergencyFlowState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xDC)
  {
    unsigned int v2 = a2 + 36;
    if (a2 + 36 >= 0xFFFF00) {
      unsigned int v3 = 4;
    }
    else {
      unsigned int v3 = 2;
    }
    if (v2 >> 8 < 0xFF) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x100) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = a1[1];
        if (!a1[1]) {
          break;
        }
        return (*a1 | (v5 << 8)) - 36;
      case 2:
        int v5 = *(unsigned __int16 *)(a1 + 1);
        if (*(_WORD *)(a1 + 1)) {
          return (*a1 | (v5 << 8)) - 36;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0xD998);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 8)) - 36;
      default:
        break;
    }
  }
  unsigned int v7 = *a1;
  if (v7 >= 0x23) {
    unsigned int v8 = v7 - 34;
  }
  else {
    unsigned int v8 = 0;
  }
  if (v8 >= 3) {
    return v8 - 2;
  }
  else {
    return 0;
  }
}

unsigned char *storeEnumTagSinglePayload for GeneralEmergencyFlow.GeneralEmergencyFlowState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 36;
  if (a3 + 36 >= 0xFFFF00) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (v3 >> 8 < 0xFF) {
    int v4 = 1;
  }
  if (v3 >= 0x100) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xDC) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xDB)
  {
    unsigned int v7 = ((a2 - 220) >> 8) + 1;
    *uint64_t result = a2 + 36;
    switch(v6)
    {
      case 1:
        result[1] = v7;
        break;
      case 2:
        *(_WORD *)(result + 1) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0xDA80);
      case 4:
        *(_DWORD *)(result + 1) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *uint64_t result = a2 + 36;
        break;
    }
  }
  return result;
}

uint64_t sub_DAA8(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 0x23) {
    return v1 - 34;
  }
  else {
    return 0;
  }
}

unsigned char *sub_DABC(unsigned char *result, int a2)
{
  if (a2) {
    *uint64_t result = a2 + 34;
  }
  return result;
}

ValueMetadata *type metadata accessor for GeneralEmergencyFlow.GeneralEmergencyFlowState()
{
  return &type metadata for GeneralEmergencyFlow.GeneralEmergencyFlowState;
}

uint64_t sub_DADC(uint64_t a1)
{
  return sub_BBE0(a1) & 1;
}

uint64_t sub_DB04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *unsigned int v7 = v3;
  v7[1] = sub_DBB4;
  return Flow.onAsync(input:)(a1, a2, a3);
}

uint64_t sub_DBB4()
{
  sub_10010();
  uint64_t v2 = v1;
  sub_60D8();
  uint64_t v3 = *v0;
  sub_FFEC();
  *int v4 = v3;
  swift_task_dealloc();
  unsigned int v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_DC80()
{
  return sub_D6D0();
}

uint64_t sub_DCA4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_DD40;
  return sub_CA64();
}

uint64_t sub_DD40()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v1 + 8);
  return v3();
}

uint64_t sub_DE04()
{
  type metadata accessor for GeneralEmergencyFlow();

  return sub_53230();
}

uint64_t sub_DE3C(void *__src, uint64_t a2)
{
  memcpy(__dst, __src, sizeof(__dst));
  uint64_t v6 = sub_2E18(&qword_6BCA8);
  uint64_t v7 = sub_FEC4(v6);
  __chkstk_darwin(v7);
  sub_FF48();
  uint64_t v8 = sub_53B50();
  sub_6188();
  __chkstk_darwin(v9);
  sub_6140();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_53DB0();
  sub_60C0();
  uint64_t v55 = v14;
  uint64_t v16 = __chkstk_darwin(v15);
  os_log_type_t v18 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v50 - v19;
  uint64_t v56 = v2;
  sub_E434(__src, a2, (uint64_t)v61);
  if (*((void *)&v61[1] + 1))
  {
    sub_5F28(v61, (uint64_t)v60);
    sub_53D90();
    sub_6108();
    uint64_t v21 = v55;
    sub_FE98();
    v22();
    uint64_t v23 = sub_53DA0();
    os_log_type_t v24 = sub_53E90();
    if (os_log_type_enabled(v23, v24))
    {
      char v25 = (uint8_t *)sub_61F0();
      *(_WORD *)char v25 = 0;
      _os_log_impl(&dword_0, v23, v24, "#GeneralEmergencyFlow preparing for confirmation", v25, 2u);
      sub_60F0();
    }

    (*(void (**)(char *, uint64_t))(v21 + 8))(v20, v13);
    sub_3048((uint64_t)v60, (uint64_t)v62);
    uint64_t v26 = v56;
    sub_3048((uint64_t)v56, (uint64_t)v59);
    sub_3048((uint64_t)(v26 + 5), (uint64_t)v58);
    sub_5920((uint64_t)(v26 + 10), (uint64_t)v57);
    sub_597C((uint64_t)v62, v62[3]);
    sub_60C0();
    __chkstk_darwin(v27);
    sub_6140();
    uint64_t v30 = v29 - v28;
    (*(void (**)(uint64_t))(v31 + 16))(v29 - v28);
    sub_597C((uint64_t)v58, v58[3]);
    sub_60C0();
    __chkstk_darwin(v32);
    sub_6140();
    uint64_t v35 = (const void *)(v34 - v33);
    (*(void (**)(uint64_t))(v36 + 16))(v34 - v33);
    memcpy(v61, v35, 0x70uLL);
    sub_5D2C((uint64_t)__src);
    uint64_t v37 = sub_51858(__src, v30, v59, v61, (uint64_t)v57, 0, 0, 0);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v58);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v62);
    v62[0] = v37;
    type metadata accessor for EmergencyConfirmationFlow();
    sub_FAFC(&qword_6BE80, 255, (void (*)(uint64_t))type metadata accessor for EmergencyConfirmationFlow);
    uint64_t v38 = sub_531D0();
    swift_release();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v60);
  }
  else
  {
    uint64_t v50 = v3;
    uint64_t v51 = v12;
    uint64_t v52 = a2;
    uint64_t v53 = v8;
    uint64_t v54 = __src;
    sub_5884((uint64_t)v61, &qword_6C3C0);
    sub_53D90();
    sub_6108();
    uint64_t v39 = v55;
    sub_FE98();
    v40();
    os_log_type_t v41 = sub_53DA0();
    os_log_type_t v42 = sub_53E90();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)sub_61F0();
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl(&dword_0, v41, v42, "#GeneralEmergencyFlow preparing promptless output", v43, 2u);
      sub_60F0();
    }

    (*(void (**)(char *, uint64_t))(v39 + 8))(v18, v13);
    memcpy(v60, __dst, sizeof(v60));
    nullsub_1(v60);
    sub_F214((uint64_t)v60, (uint64_t)v61);
    uint64_t v44 = v56;
    uint64_t v45 = v56[3];
    uint64_t v46 = v56[4];
    sub_2C00(v56, v45);
    (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(v46 + 8))(v59, v45, v46);
    uint64_t v47 = sub_2C00(v44 + 5, v44[8]);
    memcpy(v62, v47, sizeof(v62));
    sub_F2AC((uint64_t)v61, v59, v62);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v59);
    sub_2FE0(v52, v50);
    sub_3048((uint64_t)v44, (uint64_t)v59);
    sub_53C50();
    uint64_t v48 = v51;
    sub_53B40();
    sub_FAFC((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
    uint64_t v38 = sub_531D0();
    sub_FA44(v48, (void (*)(void))&type metadata accessor for OutputFlow);
  }
  return v38;
}

uint64_t sub_E434@<X0>(void *__src@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = (uint64_t)v3;
  memcpy(__dst, __src, sizeof(__dst));
  uint64_t v8 = v3[3];
  uint64_t v9 = v3[4];
  sub_2C00(v3, v8);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v9 + 8))(v21, v8, v9);
  sub_2C00(v21, v21[3]);
  char v10 = sub_533C0();
  sub_3048((uint64_t)v21, (uint64_t)v20);
  if ((v10 & 1) == 0)
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v20);
    goto LABEL_5;
  }
  char v11 = sub_43838(v20);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v20);
  if ((v11 & 1) == 0)
  {
LABEL_5:
    *(void *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v21);
  }
  sub_3048(v4, (uint64_t)v16);
  sub_3048(v4 + 40, (uint64_t)&v17);
  memcpy(v19, __dst, 0x80uLL);
  sub_F870((uint64_t)v19);
  sub_F87C((uint64_t)v19, (uint64_t)&v18);
  sub_5D2C((uint64_t)__src);
  sub_F8D8();
  uint64_t v12 = sub_531D0();
  sub_F924((uint64_t)v16);
  sub_2C00((void *)(v4 + 40), *(void *)(v4 + 64));
  uint64_t v13 = (int *)type metadata accessor for ConfirmationFlowConfigModel();
  *(void *)(a3 + 24) = v13;
  *(void *)(a3 + 32) = &off_66C38;
  uint64_t v14 = sub_5DC4((uint64_t *)a3);
  swift_retain();
  sub_25C54();
  swift_release();
  sub_2FE0(a2, (uint64_t)v14);
  *(uint64_t *)((char *)v14 + v13[6]) = v12;
  *(uint64_t *)((char *)v14 + v13[7]) = 2;
  *((unsigned char *)v14 + v13[8]) = 0;
  *((unsigned char *)v14 + v13[9]) = 1;
  return _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v21);
}

uint64_t sub_E628(uint64_t a1)
{
  uint64_t v2 = sub_53DB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_53CD0();
  v21[3] = v6;
  void v21[4] = (uint64_t)&protocol witness table for EmergencyDialogAct;
  uint64_t v7 = sub_5DC4(v21);
  sub_FA9C(a1, (uint64_t)v7, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
  uint64_t v8 = sub_53D90();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
  sub_3048((uint64_t)v21, (uint64_t)v20);
  uint64_t v9 = sub_53DA0();
  os_log_type_t v10 = sub_53E90();
  if (os_log_type_enabled(v9, v10))
  {
    v17[1] = v6;
    uint64_t v11 = swift_slowAlloc();
    v17[0] = v7;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    sub_3048((uint64_t)v20, (uint64_t)v18);
    sub_2E18(&qword_6C3E0);
    uint64_t v13 = sub_53E10();
    v18[0] = sub_50F10(v13, v14, &v19);
    sub_53EF0();
    swift_bridgeObjectRelease();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v20);
    _os_log_impl(&dword_0, v9, v10, "Converting EmergencyDialogAct to GeneralEmergencyIntent: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v20);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v15 = sub_53BF0();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v21);
  return v15;
}

uint64_t sub_E8D8(uint64_t a1)
{
  uint64_t v2 = sub_53DB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for EmergencyNLIntent();
  uint64_t v29 = v6;
  uint64_t v30 = sub_FAFC(&qword_6C3E8, 255, (void (*)(uint64_t))type metadata accessor for EmergencyNLIntent);
  uint64_t v7 = sub_5DC4(v28);
  sub_FA9C(a1, (uint64_t)v7, (void (*)(void))type metadata accessor for EmergencyNLIntent);
  uint64_t v8 = sub_53D90();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
  sub_3048((uint64_t)v28, (uint64_t)v27);
  uint64_t v9 = sub_53DA0();
  os_log_type_t v10 = sub_53E90();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v23 = v2;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v24 = v6;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    v22[1] = v12 + 4;
    uint64_t v13 = sub_2C00(v27, v27[3]);
    v22[0] = v22;
    __chkstk_darwin(v13);
    uint64_t v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v16 + 16))(v15);
    uint64_t v17 = sub_3F488();
    unint64_t v19 = v18;
    sub_FA44((uint64_t)v15, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    uint64_t v25 = sub_50F10(v17, v19, &v26);
    sub_53EF0();
    swift_bridgeObjectRelease();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v27);
    _os_log_impl(&dword_0, v9, v10, "Converting EmergencyNLIntent: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v23);
  }
  else
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v27);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_2C00(v28, v29);
  if (qword_6B908 != -1) {
    swift_once();
  }
  sub_FAFC(&qword_6C0B0, 255, (void (*)(uint64_t))type metadata accessor for EmergencyNLIntent);
  sub_537F0();
  uint64_t v20 = sub_53BF0();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v28);
  return v20;
}

void *sub_ED0C(void *a1, const void *a2)
{
  void (*v17)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void v38[4];
  void v39[3];
  ValueMetadata *v40;
  char **v41;

  uint64_t v4 = sub_53DB0();
  uint64_t v35 = *(void *)(v4 - 8);
  uint64_t v36 = v4;
  __chkstk_darwin(v4);
  uint64_t v34 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2E18(&qword_6BCA8);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v34 - v13;
  uint64_t v40 = &type metadata for EmergencyCATProvider;
  os_log_type_t v41 = &off_66E10;
  v39[0] = swift_allocObject();
  memcpy((void *)(v39[0] + 16), a2, 0x70uLL);
  uint64_t v16 = a1[3];
  uint64_t v15 = a1[4];
  sub_2C00(a1, v16);
  uint64_t v17 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v15 + 8);
  sub_2EFC((uint64_t)a2);
  v17(v38, v16, v15);
  sub_2C00(v38, v38[3]);
  if ((sub_53360() & 1) == 0)
  {
LABEL_9:
    uint64_t v25 = &_swiftEmptyArrayStorage;
    goto LABEL_10;
  }
  sub_2C00(v39, (uint64_t)&type metadata for EmergencyCATProvider);
  swift_retain();
  sub_25838();
  swift_release();
  unint64_t v18 = sub_54060();
  uint64_t v20 = v19;
  sub_5884((uint64_t)v14, &qword_6BCA8);
  if (!v20)
  {
LABEL_6:
    uint64_t v26 = sub_53D90();
    swift_beginAccess();
    uint64_t v28 = v34;
    uint64_t v27 = v35;
    uint64_t v29 = v36;
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v34, v26, v36);
    uint64_t v30 = sub_53DA0();
    uint64_t v31 = sub_53E90();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      _os_log_impl(&dword_0, v30, v31, "#GeneralEmergencyFlow Failed to execute goToWebsiteButtonLabel CATs", v32, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
    goto LABEL_9;
  }
  sub_2C00(v39, (uint64_t)v40);
  swift_retain();
  sub_28494();
  swift_release();
  sub_54060();
  uint64_t v22 = v21;
  sub_5884((uint64_t)v12, &qword_6BCA8);
  if (!v22)
  {
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  sub_F1D4();
  sub_53020();
  swift_bridgeObjectRelease();
  uint64_t v23 = sub_2BEAC(v18, v20, (uint64_t)v8);
  sub_2E18((uint64_t *)&unk_6D490);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_547C0;
  *(void *)(v24 + 32) = v23;
  uint64_t v37 = (void *)v24;
  sub_53E80();
  uint64_t v25 = v37;
LABEL_10:
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v38);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v39);
  return v25;
}

uint64_t sub_F134()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 128, 7);
}

unint64_t sub_F1D4()
{
  unint64_t result = qword_6DA90;
  if (!qword_6DA90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_6DA90);
  }
  return result;
}

uint64_t sub_F214(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2E18(&qword_6C3B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_F27C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

double sub_F294(_OWORD *a1)
{
  double result = 0.0;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

void *sub_F2AC(uint64_t a1, void *a2, const void *a3)
{
  uint64_t v37 = (uint8_t *)a1;
  uint64_t v5 = sub_53DB0();
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  __chkstk_darwin(v5);
  uint64_t v34 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2E18(&qword_6BCA8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v33 = (uint64_t)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v32 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v32 - v13;
  v39[3] = &type metadata for EmergencyCATProvider;
  v39[4] = &off_66E10;
  v39[0] = swift_allocObject();
  memcpy((void *)(v39[0] + 16), a3, 0x70uLL);
  sub_2C00(a2, a2[3]);
  sub_2EFC((uint64_t)a3);
  char v15 = sub_53370();
  sub_2C00(v39, (uint64_t)&type metadata for EmergencyCATProvider);
  swift_retain();
  if (v15) {
    sub_257B8();
  }
  else {
    sub_283A0();
  }
  swift_release();
  uint64_t v16 = sub_54060();
  if (v17)
  {
    uint64_t v18 = v16;
    uint64_t v19 = v17;
    sub_F214((uint64_t)v37, (uint64_t)v40);
    if (sub_F27C((uint64_t)v40) == 1)
    {
      sub_F978((uint64_t)__dst);
    }
    else
    {
      memcpy(__dst, v40, 0x80uLL);
      sub_F870((uint64_t)__dst);
    }
    sub_F87C((uint64_t)__dst, (uint64_t)v38);
    sub_F87C((uint64_t)v38, (uint64_t)__dst);
    uint64_t v30 = sub_38F80((uint64_t)__dst, a2, v18, v19);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = sub_53D90();
    swift_beginAccess();
    uint64_t v22 = v34;
    uint64_t v21 = v35;
    uint64_t v23 = v36;
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v34, v20, v36);
    sub_2FE0((uint64_t)v14, (uint64_t)v12);
    uint64_t v24 = sub_53DA0();
    os_log_type_t v25 = sub_53E90();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 136315138;
      uint64_t v37 = v26 + 4;
      v38[0] = v27;
      sub_2FE0((uint64_t)v12, v33);
      uint64_t v28 = sub_53E10();
      v40[0] = sub_50F10(v28, v29, v38);
      sub_53EF0();
      swift_bridgeObjectRelease();
      sub_5884((uint64_t)v12, &qword_6BCA8);
      _os_log_impl(&dword_0, v24, v25, "#GeneralEmergencyFlow Failed to execute CAT: %s", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v35 + 8))(v34, v36);
    }
    else
    {
      sub_5884((uint64_t)v12, &qword_6BCA8);

      (*(void (**)(char *, uint64_t))(v21 + 8))(v22, v23);
    }
    uint64_t v30 = &_swiftEmptyArrayStorage;
  }
  sub_5884((uint64_t)v14, &qword_6BCA8);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v39);
  return v30;
}

uint64_t *sub_F724(uint64_t *a1)
{
  return a1;
}

uint64_t sub_F780(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_F824()
{
  unint64_t result = qword_6C3B8;
  if (!qword_6C3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C3B8);
  }
  return result;
}

uint64_t sub_F870(uint64_t result)
{
  *(unsigned char *)(result + 128) = 1;
  return result;
}

uint64_t sub_F87C(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_F8D8()
{
  unint64_t result = qword_6C3C8;
  if (!qword_6C3C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C3C8);
  }
  return result;
}

uint64_t sub_F924(uint64_t a1)
{
  return a1;
}

double sub_F978(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 128) = 2;
  return result;
}

unint64_t sub_F998()
{
  unint64_t result = qword_6C3D0;
  if (!qword_6C3D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C3D0);
  }
  return result;
}

uint64_t sub_F9E4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_6188();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_FA44(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_6188();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_FA9C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_6188();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_FAFC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t destroy for GeneralEmergencyFlowFollowupProvider(uint64_t a1)
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + 40);

  return _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + 80);
}

_OWORD *initializeWithCopy for GeneralEmergencyFlowFollowupProvider(_OWORD *a1, _OWORD *a2)
{
  long long v4 = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = a2[4];
  a1[4] = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)a1 + 40, (uint64_t)a2 + 40);
  long long v6 = *(_OWORD *)((char *)a2 + 104);
  *(_OWORD *)((char *)a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 5), (uint64_t)(a2 + 5));
  return a1;
}

uint64_t *assignWithCopy for GeneralEmergencyFlowFollowupProvider(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

void *initializeWithTake for GeneralEmergencyFlowFollowupProvider(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x78uLL);
}

uint64_t assignWithTake for GeneralEmergencyFlowFollowupProvider(uint64_t a1, uint64_t a2)
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for GeneralEmergencyFlowFollowupProvider(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 120))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GeneralEmergencyFlowFollowupProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GeneralEmergencyFlowFollowupProvider()
{
  return &type metadata for GeneralEmergencyFlowFollowupProvider;
}

void sub_FDEC()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t sub_FDFC(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_FE14@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t sub_FE3C()
{
  return v0;
}

uint64_t sub_FE54()
{
  return swift_task_dealloc();
}

uint64_t sub_FEA4()
{
  return v0;
}

uint64_t sub_FEC4(uint64_t a1)
{
  return a1 - 8;
}

void sub_FED0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void sub_FEF0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_FF10@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 - 256);
}

uint64_t sub_FF48()
{
  return 0;
}

uint64_t sub_FF64()
{
  return v0;
}

BOOL sub_FF7C(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_FF98()
{
  return swift_slowAlloc();
}

BOOL sub_FFD0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_1001C()
{
  return swift_slowAlloc();
}

void sub_10034()
{
  sub_15308();
  v212 = v0;
  uint64_t v2 = v1;
  uint64_t v234 = v3;
  uint64_t v225 = sub_535F0();
  sub_9120();
  uint64_t v217 = v4;
  ((void (*)(void))__chkstk_darwin)();
  sub_612C();
  sub_FDEC();
  ((void (*)(void))__chkstk_darwin)();
  sub_FF3C();
  sub_FDEC();
  ((void (*)(void))__chkstk_darwin)();
  sub_152E8();
  sub_FE14(v5);
  uint64_t v227 = type metadata accessor for EmergencyNLIntent();
  sub_6188();
  ((void (*)(void))__chkstk_darwin)();
  sub_6150();
  sub_FE14(v6);
  uint64_t v230 = sub_53920();
  sub_9120();
  v240 = v7;
  ((void (*)(void))__chkstk_darwin)();
  sub_612C();
  sub_FDEC();
  ((void (*)(void))__chkstk_darwin)();
  sub_152E8();
  os_log_t v245 = v8;
  uint64_t v9 = sub_53670();
  uint64_t v10 = sub_FEC4(v9);
  __chkstk_darwin(v10);
  sub_6150();
  sub_FE14(v11);
  uint64_t v215 = sub_53CD0();
  sub_6188();
  __chkstk_darwin(v12);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v13);
  sub_152E8();
  sub_FE14(v14);
  uint64_t v222 = sub_53620();
  sub_9120();
  uint64_t v224 = v15;
  __chkstk_darwin(v16);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v17);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v18);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v19);
  sub_152E8();
  sub_FE14(v20);
  uint64_t v239 = sub_53600();
  sub_9120();
  uint64_t v238 = v21;
  __chkstk_darwin(v22);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v23);
  sub_152E8();
  sub_FE14(v24);
  uint64_t v25 = sub_535B0();
  sub_9120();
  uint64_t v27 = v26;
  __chkstk_darwin(v28);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v29);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v30);
  uint64_t v32 = &v210[-v31];
  uint64_t v33 = sub_53DB0();
  sub_9120();
  uint64_t v35 = v34;
  __chkstk_darwin(v36);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v37);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v38);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v39);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v40);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v41);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v42);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v43);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v44);
  uint64_t v46 = &v210[-v45];
  uint64_t v47 = sub_53D90();
  sub_6108();
  uint64_t v246 = v35;
  uint64_t v48 = *(void (**)(void, void, void))(v35 + 16);
  uint64_t v243 = v47;
  uint64_t v244 = v35 + 16;
  v242 = v48;
  v48(v46, v47, v33);
  uint64_t v49 = *(void *)(v27 + 16);
  uint64_t v221 = v27 + 16;
  uint64_t v220 = v49;
  sub_FE98();
  v50();
  uint64_t v51 = sub_53DA0();
  os_log_type_t v52 = sub_53E90();
  BOOL v53 = os_log_type_enabled(v51, v52);
  uint64_t v236 = v33;
  uint64_t v233 = v2;
  uint64_t v232 = v27;
  if (v53)
  {
    uint64_t v54 = (uint8_t *)sub_1001C();
    *(void *)&long long v247 = sub_15284();
    *(_DWORD *)uint64_t v54 = 136315138;
    sub_13C5C(&qword_6C3D8, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v55 = sub_53FD0();
    uint64_t v252 = sub_50F10(v55, v56, (uint64_t *)&v247);
    uint64_t v57 = v232;
    sub_53EF0();
    swift_bridgeObjectRelease();
    v219 = *(void (**)(unsigned char *, uint64_t))(v57 + 8);
    sub_6120();
    v58();
    _os_log_impl(&dword_0, v51, v52, "getConfirmationFromInput input: %s", v54, 0xCu);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();
  }
  else
  {
    v219 = *(void (**)(unsigned char *, uint64_t))(v27 + 8);
    v219(v32, v25);
  }

  v241 = *(void (**)(void))(v246 + 8);
  sub_6120();
  v59();
  uint64_t v60 = v237;
  sub_535A0();
  int v61 = (*(uint64_t (**)(uint64_t, uint64_t))(v238 + 88))(v60, v239);
  uint64_t v62 = v235;
  if (v61 == enum case for Parse.NLv3IntentOnly(_:))
  {
    uint64_t v231 = v25;
    uint64_t v63 = sub_152B0();
    v64(v63);
    uint64_t v65 = v240;
    sub_153A0();
    sub_15408();
    v66();
    sub_15264();
    sub_1523C();
    v67();
    uint64_t v68 = v226;
    uint64_t v239 = *((void *)v65 + 2);
    sub_1547C();
    v69();
    uint64_t v70 = (void *)sub_53DA0();
    os_log_type_t v71 = sub_53E90();
    if (sub_153E0(v71))
    {
      uint64_t v72 = (_DWORD *)sub_1001C();
      *(void *)&long long v247 = sub_15284();
      *uint64_t v72 = 136315138;
      uint64_t v238 = (uint64_t)(v72 + 1);
      sub_13C5C(&qword_6C510, (void (*)(uint64_t))&type metadata accessor for NLIntent);
      uint64_t v73 = sub_53FD0();
      uint64_t v75 = sub_50F10(v73, v74, (uint64_t *)&v247);
      sub_1529C(v75);
      sub_53EF0();
      swift_bridgeObjectRelease();
      uint64_t v76 = (void (*)(void))*((void *)v240 + 1);
      sub_6120();
      v76();
      sub_152C8(&dword_0, v77, v78, "getConfirmationFromInput NLv3IntentOnly nlIntent: %s");
      sub_153AC();
      sub_60F0();
      sub_60F0();
    }
    else
    {
      uint64_t v76 = (void (*)(void))*((void *)v65 + 1);
      ((void (*)(uint64_t, uint64_t))v76)(v68, v25);
    }

    sub_6120();
    v99();
    uint64_t v100 = v229;
    sub_1547C();
    v101();
    if (qword_6B910 != -1) {
      swift_once();
    }
    sub_13C5C(&qword_6C0B0, (void (*)(uint64_t))type metadata accessor for EmergencyNLIntent);
    sub_537F0();
    if (v247 == 2)
    {
      if (qword_6B900 != -1) {
        swift_once();
      }
      sub_537F0();
      if (v247 == 8)
      {
        sub_13D08(v100, (void (*)(void))type metadata accessor for EmergencyNLIntent);
        sub_6120();
        v76();
        sub_1537C();
LABEL_75:
        sub_15264();
        sub_1523C();
        v179();
        sub_FE98();
        v180();
        v181 = (void *)sub_53DA0();
        os_log_type_t v182 = sub_53EA0();
        if (sub_153E0(v182))
        {
          v183 = (_DWORD *)sub_1001C();
          v250[0] = sub_15284();
          _DWORD *v183 = 136315138;
          sub_13C5C(&qword_6C3D8, (void (*)(uint64_t))&type metadata accessor for Input);
          uint64_t v184 = sub_53FD0();
          uint64_t v186 = sub_50F10(v184, v185, v250);
          sub_152F4(v186);
          sub_53EF0();
          swift_bridgeObjectRelease();
          sub_6120();
          v187();
          sub_152C8(&dword_0, v188, v189, "Failed to get confirmation from input: %s");
          sub_153AC();
          sub_60F0();
          sub_60F0();

          sub_15388();
        }
        else
        {
          sub_6120();
          v190();

          sub_15430();
        }
        sub_6120();
        v191();
        sub_53550();
        uint64_t v192 = sub_153C8();
        goto LABEL_92;
      }
      if (sub_53CA0() != 1819042147 || v120 != 0xE400000000000000)
      {
        char v122 = sub_1545C();
        swift_bridgeObjectRelease();
        if (v122)
        {
LABEL_52:
          sub_13D08(v229, (void (*)(void))type metadata accessor for EmergencyNLIntent);
          sub_6120();
          v76();
LABEL_91:
          uint64_t v208 = sub_53550();
          sub_6188();
          sub_15444();
          v209();
          sub_15394();
          uint64_t v195 = v208;
          goto LABEL_92;
        }
        if (sub_53CA0() != 1684957542 || v123 != 0xE400000000000000)
        {
          char v125 = sub_53FE0();
          swift_bridgeObjectRelease();
          sub_13D08(v229, (void (*)(void))type metadata accessor for EmergencyNLIntent);
          sub_6120();
          v76();
          sub_1537C();
          if ((v125 & 1) == 0) {
            goto LABEL_75;
          }
          goto LABEL_91;
        }
      }
      swift_bridgeObjectRelease();
      goto LABEL_52;
    }
    if (v247) {
      sub_15320();
    }
    swift_bridgeObjectRelease();
    sub_13D08(v100, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    sub_6120();
    v76();
    sub_153FC();
LABEL_84:
    uint64_t v199 = sub_53550();
    sub_6188();
    sub_15444();
    v200();
    sub_53550();
    sub_15394();
    uint64_t v195 = v199;
LABEL_92:
    sub_34DC(v192, v193, v194, v195);
    goto LABEL_93;
  }
  if (v61 == enum case for Parse.directInvocation(_:))
  {
    uint64_t v79 = sub_152B0();
    v80(v79);
    uint64_t v81 = v217;
    uint64_t v82 = v228;
    uint64_t v83 = sub_153A0();
    uint64_t v84 = v225;
    v85(v83);
    sub_15264();
    sub_1523C();
    v86();
    v87 = *(void (**)(uint64_t, uint64_t, uint64_t))(v81 + 16);
    uint64_t v88 = v216;
    v87(v216, v82, v84);
    v89 = sub_53DA0();
    os_log_type_t v90 = sub_53E90();
    if (os_log_type_enabled(v89, v90))
    {
      uint64_t v91 = sub_1001C();
      os_log_t v245 = v89;
      uint64_t v92 = (uint8_t *)v91;
      uint64_t v93 = sub_15284();
      uint64_t v231 = v25;
      *(void *)&long long v247 = v93;
      *(_DWORD *)uint64_t v92 = 136315138;
      v240 = v92 + 4;
      v87(v213, v88, v84);
      uint64_t v94 = sub_53E10();
      uint64_t v96 = sub_50F10(v94, v95, (uint64_t *)&v247);
      sub_1529C(v96);
      sub_53EF0();
      swift_bridgeObjectRelease();
      v97 = *(void (**)(void))(v81 + 8);
      sub_6120();
      v97();
      os_log_t v98 = v245;
      _os_log_impl(&dword_0, v245, v90, "getConfirmationFromInput directInvocation: %s", v92, 0xCu);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();
    }
    else
    {
      v97 = *(void (**)(void))(v81 + 8);
      sub_6120();
      v97();
    }
    sub_6120();
    v117();
    uint64_t v118 = v228;
    if (sub_535D0() == 0xD000000000000035 && v119 == 0x8000000000057BA0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v136 = sub_53FE0();
      swift_bridgeObjectRelease();
      if ((v136 & 1) == 0)
      {
        if (sub_535D0() == 0xD000000000000034 && v165 == 0x8000000000057BE0)
        {
          swift_bridgeObjectRelease();
          sub_6120();
          v97();
        }
        else
        {
          char v178 = sub_53FE0();
          swift_bridgeObjectRelease();
          sub_6120();
          v97();
          sub_1537C();
          if ((v178 & 1) == 0) {
            goto LABEL_75;
          }
        }
        goto LABEL_91;
      }
    }
    uint64_t v137 = sub_535E0();
    if (v137)
    {
      uint64_t v138 = v137;
      uint64_t v139 = sub_53D30();
      sub_2C2BC(v139, v140, v138, &v247);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((void *)&v248 + 1))
      {
        if (swift_dynamicCast())
        {
          if (v250[0] != 0x656D7269666E6F63 || v250[1] != 0xE900000000000064) {
            sub_53FE0();
          }
          sub_6120();
          v97();
          swift_bridgeObjectRelease();
          goto LABEL_84;
        }
        goto LABEL_55;
      }
    }
    else
    {
      long long v247 = 0u;
      long long v248 = 0u;
      sub_153FC();
    }
    sub_14A94((uint64_t)&v247, &qword_6C508);
LABEL_55:
    ((void (*)(uint64_t, uint64_t))v97)(v118, v225);
    goto LABEL_84;
  }
  if (v61 == enum case for Parse.uso(_:))
  {
    uint64_t v231 = v25;
    uint64_t v102 = sub_152B0();
    v103(v102);
    uint64_t v104 = v224;
    sub_153A0();
    sub_15408();
    v105();
    sub_15264();
    sub_1523C();
    v106();
    uint64_t v107 = *(void (**)(void))(v104 + 16);
    sub_1547C();
    v107();
    uint64_t v108 = sub_53DA0();
    os_log_type_t v109 = sub_53E90();
    BOOL v110 = os_log_type_enabled(v108, v109);
    v240 = (uint8_t *)(v104 + 16);
    uint64_t v239 = (uint64_t)v107;
    if (v110)
    {
      uint64_t v111 = sub_1001C();
      uint64_t v238 = sub_15284();
      *(void *)&long long v247 = v238;
      *(_DWORD *)uint64_t v111 = 136315138;
      os_log_t v245 = (os_log_t)(v111 + 4);
      sub_1547C();
      v107();
      uint64_t v112 = sub_53E10();
      uint64_t v114 = sub_50F10(v112, v113, (uint64_t *)&v247);
      sub_1529C(v114);
      sub_53EF0();
      unint64_t v115 = v241;
      swift_bridgeObjectRelease();
      os_log_t v245 = *(os_log_t *)(v224 + 8);
      sub_6120();
      v116();
      _os_log_impl(&dword_0, v108, v109, "getConfirmationFromInput usoParse: %s", (uint8_t *)v111, 0xCu);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();

      sub_6120();
      v115();
    }
    else
    {
      os_log_t v245 = *(os_log_t *)(v224 + 8);
      sub_6120();
      v142();

      ((void (*)(uint64_t, uint64_t))v241)(v62, v236);
    }
    sub_53610();
    *((void *)&v248 + 1) = &type metadata for EmergencyFeatureFlagsKey;
    unint64_t v249 = sub_F998();
    LOBYTE(v247) = 2;
    sub_53640();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)&v247);
    uint64_t v143 = v218;
    sub_53CC0();
    int v144 = *(unsigned __int8 *)(v143 + *(int *)(v215 + 36));
    uint64_t v145 = v214;
    if (v144 != 2)
    {
      int v166 = v144 & 1;
      sub_15264();
      sub_1523C();
      v167();
      v168 = sub_53DA0();
      os_log_type_t v169 = sub_53E90();
      if (os_log_type_enabled(v168, v169))
      {
        v170 = (uint8_t *)sub_1001C();
        v250[0] = sub_15284();
        *(_DWORD *)v170 = 136315138;
        char v251 = v166;
        uint64_t v171 = sub_53E10();
        uint64_t v173 = sub_50F10(v171, v172, v250);
        sub_152F4(v173);
        sub_53EF0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v168, v169, "Found confirmation: %s", v170, 0xCu);
        swift_arrayDestroy();
        sub_60F0();
        sub_60F0();

        sub_15388();
      }
      else
      {
      }
      sub_6120();
      v196();
      sub_153FC();
      if (v166) {
        sub_15320();
      }
      uint64_t v197 = swift_bridgeObjectRelease();
      sub_15364(v197, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
      sub_6120();
      v198();
      goto LABEL_84;
    }
    uint64_t v146 = sub_2C00(v212, v212[3]);
    uint64_t v147 = type metadata accessor for ConfirmationFlowConfigModel();
    LODWORD(v146) = *((unsigned __int8 *)v146 + *(int *)(v147 + 32));
    uint64_t v148 = v222;
    sub_FE98();
    v149();
    if (v146 == 1)
    {
      char v150 = sub_44A34();
      ((void (*)(uint64_t, uint64_t))v245)(v145, v148);
      if (v150)
      {
        sub_15264();
        sub_1523C();
        v151();
        uint64_t v152 = sub_53DA0();
        os_log_type_t v153 = sub_53E90();
        BOOL v154 = os_log_type_enabled(v152, v153);
        uint64_t v155 = v223;
        if (v154)
        {
          *(_WORD *)sub_61F0() = 0;
          sub_FED0(&dword_0, v156, v157, "Found webSearch confirmation");
          sub_60F0();
        }
LABEL_90:

        sub_15388();
        sub_6120();
        uint64_t v207 = v206();
        sub_15364(v207, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
        ((void (*)(uint64_t, uint64_t))v245)(v155, v222);
        goto LABEL_91;
      }
    }
    else
    {
      ((void (*)(uint64_t, uint64_t))v245)(v145, v148);
    }
    int v174 = *((unsigned __int8 *)sub_2C00(v212, v212[3]) + *(int *)(v147 + 32));
    uint64_t v175 = v211;
    sub_13CA4(v218, v211);
    uint64_t v155 = v223;
    if (v174)
    {
LABEL_72:
      sub_13D08(v175, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
      sub_1537C();
LABEL_73:
      sub_15364(v176, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
      sub_6120();
      v177();
      goto LABEL_75;
    }
    switch(*(unsigned char *)(v175 + *(int *)(v215 + 20)))
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
        char v201 = sub_1545C();
        swift_bridgeObjectRelease();
        sub_13D08(v175, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
        sub_1537C();
        if ((v201 & 1) == 0) {
          goto LABEL_73;
        }
        break;
      case 8:
        goto LABEL_72;
      default:
        swift_bridgeObjectRelease();
        sub_13D08(v175, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
        break;
    }
    sub_15264();
    sub_1523C();
    v202();
    uint64_t v152 = sub_53DA0();
    os_log_type_t v203 = sub_53E90();
    if (os_log_type_enabled(v152, v203))
    {
      *(_WORD *)sub_61F0() = 0;
      sub_FED0(&dword_0, v204, v205, "Found call confirmation");
      uint64_t v155 = v223;
      sub_60F0();
    }
    goto LABEL_90;
  }
  sub_15264();
  sub_1523C();
  v126();
  sub_FE98();
  v127();
  v128 = sub_53DA0();
  os_log_type_t v129 = sub_53EA0();
  if (os_log_type_enabled(v128, v129))
  {
    uint64_t v130 = sub_1001C();
    uint64_t v231 = v25;
    uint64_t v131 = (uint8_t *)v130;
    uint64_t v252 = sub_15284();
    *(_DWORD *)uint64_t v131 = 136315138;
    sub_535A0();
    uint64_t v132 = sub_53E10();
    uint64_t v134 = sub_50F10(v132, v133, &v252);
    sub_1529C(v134);
    sub_53EF0();
    swift_bridgeObjectRelease();
    sub_6120();
    v135();
    _os_log_impl(&dword_0, v128, v129, "Failed to get confirmation, not a supported parse: %s", v131, 0xCu);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();

    sub_15388();
  }
  else
  {
    sub_6120();
    v158();

    sub_15430();
  }
  sub_6120();
  v159();
  sub_53550();
  uint64_t v160 = sub_153C8();
  sub_34DC(v160, v161, v162, v163);
  sub_15450();
  v164();
LABEL_93:
  sub_9638();
}

uint64_t sub_11DB0@<X0>(uint64_t a1@<X8>)
{
  return sub_13C00(v1, a1, &qword_6BE58);
}

void sub_11DD8()
{
  sub_15308();
  uint64_t v26 = v1;
  uint64_t v2 = sub_2E18(&qword_6BE58);
  uint64_t v3 = sub_FEC4(v2);
  __chkstk_darwin(v3);
  sub_15348();
  uint64_t v4 = sub_53DB0();
  sub_9120();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_612C();
  uint64_t v25 = v8;
  sub_15258();
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v23 - v10;
  uint64_t v12 = sub_53D90();
  sub_6108();
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v24(v11, v12, v4);
  uint64_t v13 = sub_53DA0();
  os_log_type_t v14 = sub_53E90();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)sub_61F0();
    uint64_t v23 = v4;
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl(&dword_0, v13, v14, "EmergencyPromptForConfirmationFlowStrategy actionForInput", v15, 2u);
    uint64_t v4 = v23;
    sub_60F0();
  }

  uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v11, v4);
  sub_10034();
  uint64_t v17 = sub_53550();
  int v18 = sub_5800(v0, 1, v17);
  sub_14A94(v0, &qword_6BE58);
  if (v18 == 1)
  {
    sub_6108();
    uint64_t v19 = v25;
    v24(v25, v12, v4);
    uint64_t v20 = sub_53DA0();
    os_log_type_t v21 = sub_53E90();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)sub_61F0();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_0, v20, v21, "No confirmation response found in input, ignoring.", v22, 2u);
      sub_60F0();
    }

    v16(v19, v4);
    sub_533F0();
  }
  else
  {
    sub_533E0();
  }
  sub_9638();
}

void sub_12060()
{
  sub_15308();
  uint64_t v1 = v0;
  uint64_t v73 = v3;
  unint64_t v74 = v2;
  os_log_type_t v71 = v4;
  uint64_t v70 = sub_2E18(&qword_6BCA8);
  sub_6188();
  __chkstk_darwin(v5);
  sub_6150();
  uint64_t v69 = v6;
  sub_53520();
  sub_9120();
  uint64_t v78 = v8;
  uint64_t v79 = v7;
  __chkstk_darwin(v7);
  sub_612C();
  v68[3] = v9;
  sub_15258();
  __chkstk_darwin(v10);
  sub_152E8();
  uint64_t v84 = v11;
  uint64_t v12 = sub_2E18(&qword_6C4E0);
  uint64_t v13 = sub_FEC4(v12);
  __chkstk_darwin(v13);
  sub_6140();
  uint64_t v76 = (void *)sub_533D0();
  sub_9120();
  uint64_t v15 = v14;
  __chkstk_darwin(v16);
  sub_6140();
  uint64_t v19 = v18 - v17;
  uint64_t v20 = sub_53DB0();
  sub_9120();
  uint64_t v22 = v21;
  __chkstk_darwin(v23);
  sub_612C();
  uint64_t v77 = v24;
  sub_15258();
  __chkstk_darwin(v25);
  sub_FF3C();
  uint64_t v75 = v26;
  sub_15258();
  __chkstk_darwin(v27);
  uint64_t v28 = sub_53D90();
  sub_6108();
  uint64_t v29 = *(void *)(v22 + 16);
  uint64_t v81 = v22 + 16;
  uint64_t v82 = (void *)v28;
  uint64_t v80 = v29;
  sub_FE98();
  v30();
  uint64_t v31 = sub_53DA0();
  os_log_type_t v32 = sub_53E90();
  uint64_t v85 = v20;
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)sub_61F0();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl(&dword_0, v31, v32, "EmergencyPromptForConfirmationFlowStrategy makePromptForConfirmation", v33, 2u);
    uint64_t v20 = v85;
    sub_60F0();
  }

  uint64_t v34 = sub_153A0();
  uint64_t v72 = v22 + 8;
  uint64_t v83 = v35;
  ((void (*)(uint64_t))v35)(v34);
  if (v0[23])
  {
    v68[1] = v0[22];
    swift_bridgeObjectRetain();
    sub_532B0();
    v68[2] = v89[4];
    sub_2C00(v89, v89[3]);
    sub_53300();
    (*(void (**)(uint64_t, void, void *))(v15 + 104))(v19, enum case for ActivityType.confirmation(_:), v76);
    uint64_t v36 = sub_532E0();
    sub_6188();
    sub_15444();
    v37();
    sub_15394();
    sub_34DC(v38, v39, v40, v36);
    sub_532F0();
    uint64_t v20 = v85;
    sub_532C0();
    swift_release();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v89);
  }
  uint64_t v41 = v0 + 2;
  uint64_t v42 = sub_2C00(v0 + 2, v0[5]);
  uint64_t v43 = (int *)type metadata accessor for ConfirmationFlowConfigModel();
  unsigned __int8 v44 = *((unsigned char *)v42 + v43[8]);
  uint64_t v45 = sub_2C00(v1 + 2, v1[5]);
  sub_6228(v44, *((unsigned __int8 *)v45 + v43[9]), *((void *)v71 + 6), *((void *)v71 + 7));
  sub_53C50();
  sub_534A0();
  sub_6108();
  sub_FE98();
  v46();
  uint64_t v47 = sub_53DA0();
  os_log_type_t v48 = sub_53E90();
  uint64_t v76 = v1 + 2;
  if (os_log_type_enabled(v47, v48))
  {
    uint64_t v49 = (uint8_t *)sub_1001C();
    v89[0] = sub_15284();
    *(_DWORD *)uint64_t v49 = 136315138;
    os_log_type_t v71 = v49 + 4;
    sub_6108();
    sub_FE98();
    v50();
    uint64_t v51 = sub_53E10();
    v87[0] = sub_50F10(v51, v52, v89);
    sub_53EF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v47, v48, "EmergencyPromptForConfirmationFlowStrategy preparing contextUpdate: %s", v49, 0xCu);
    swift_arrayDestroy();
    uint64_t v20 = v85;
    sub_60F0();
    uint64_t v41 = v76;
    sub_60F0();
  }

  v83(v75, v20);
  uint64_t v53 = v1[10];
  uint64_t v54 = v1[11];
  sub_2C00(v1 + 7, v53);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v54 + 8))(v88, v53, v54);
  uint64_t v55 = *(void **)((char *)sub_2C00(v41, v1[5]) + v43[7]);
  unint64_t v56 = sub_2C00(v1 + 12, v1[15]);
  memcpy(v89, v56, 0x70uLL);
  sub_149C8((unint64_t)v55);
  uint64_t v57 = sub_14634(v88, (uint64_t)v89, v55);
  sub_149D8((unint64_t)v55);
  sub_6108();
  sub_FE98();
  v58();
  swift_retain_n();
  int v59 = sub_53DA0();
  os_log_type_t v60 = sub_53E90();
  if (os_log_type_enabled(v59, v60))
  {
    int v61 = (uint8_t *)sub_1001C();
    v87[0] = sub_15284();
    uint64_t v82 = v57;
    *(_DWORD *)int v61 = 136315138;
    uint64_t v62 = sub_2C00(v76, v1[5]);
    sub_13C00((uint64_t)v62, v69, &qword_6BCA8);
    uint64_t v63 = sub_53E10();
    uint64_t v86 = sub_50F10(v63, v64, v87);
    uint64_t v57 = v82;
    sub_53EF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v59, v60, "EmergencyPromptForConfirmationFlowStrategy prompting with promptForConfirmationTemplatingResult: %s", v61, 0xCu);
    swift_arrayDestroy();
    uint64_t v41 = v76;
    sub_60F0();
    sub_60F0();

    v83(v77, v85);
  }
  else
  {

    swift_release_n();
    v83(v77, v20);
  }
  uint64_t v65 = v84;
  uint64_t v66 = sub_2C00(v41, v1[5]);
  __chkstk_darwin(v66);
  v68[-4] = v88;
  v68[-3] = v57;
  v68[-2] = v1;
  v68[-1] = v65;
  sub_12A70((void (*)(char *))sub_149E8, (uint64_t)v87);
  swift_bridgeObjectRelease();
  v74(v87);
  sub_14A94((uint64_t)v87, &qword_6C4E8);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v88);
  sub_15450();
  v67();
  sub_9638();
}

uint64_t sub_128A0@<X0>(void *a1@<X1>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v8 = sub_2E18(&qword_6C518);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2C00(a1, a1[3]);
  sub_53340();
  sub_2C00((void *)(a2 + 16), *(void *)(a2 + 40));
  type metadata accessor for ConfirmationFlowConfigModel();
  swift_beginAccess();
  uint64_t v11 = sub_53520();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v10, a3, v11);
  sub_34DC((uint64_t)v10, 0, 1, v11);
  uint64_t v12 = sub_53630();
  memset(v14, 0, sizeof(v14));
  uint64_t v15 = 0;
  a4[3] = v12;
  a4[4] = (uint64_t)&protocol witness table for AceOutput;
  sub_5DC4(a4);
  sub_53410();
  sub_14A94((uint64_t)v14, &qword_6C4F0);
  return sub_14A94((uint64_t)v10, &qword_6C518);
}

uint64_t sub_12A70@<X0>(void (*a1)(char *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_53530();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2E18(&qword_6BCA8);
  __chkstk_darwin(v9);
  uint64_t v11 = (uint64_t *)((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_13C00(v2, (uint64_t)v11, &qword_6BCA8);
  uint64_t result = swift_getEnumCaseMultiPayload();
  int v13 = result;
  if (result == 1)
  {
    *(void *)a2 = *v11;
  }
  else
  {
    (*(void (**)(char *, void *, uint64_t))(v6 + 32))(v8, v11, v5);
    a1(v8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  *(unsigned char *)(a2 + 40) = v13 == 1;
  return result;
}

void sub_12C14()
{
  sub_15308();
  uint64_t v91 = v0;
  uint64_t v98 = v2;
  v99 = v1;
  uint64_t v4 = v3;
  uint64_t v96 = sub_2E18(&qword_6C4F8);
  sub_6188();
  __chkstk_darwin(v5);
  sub_6150();
  v97 = v6;
  uint64_t v7 = sub_2E18(&qword_6BE58);
  uint64_t v8 = sub_FEC4(v7);
  __chkstk_darwin(v8);
  sub_6150();
  sub_FE14(v9);
  uint64_t v103 = sub_53550();
  sub_9120();
  uint64_t v93 = v10;
  __chkstk_darwin(v11);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v12);
  sub_152E8();
  uint64_t v94 = v13;
  uint64_t v14 = sub_535B0();
  sub_9120();
  uint64_t v16 = v15;
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v20 = (char *)v83 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)v83 - v21;
  uint64_t v23 = sub_53DB0();
  sub_9120();
  uint64_t v25 = v24;
  __chkstk_darwin(v26);
  sub_612C();
  v101 = v27;
  sub_15258();
  __chkstk_darwin(v28);
  sub_FF3C();
  uint64_t v100 = v29;
  sub_15258();
  __chkstk_darwin(v30);
  uint64_t v31 = sub_53D90();
  sub_6108();
  uint64_t v32 = *(void *)(v25 + 16);
  uint64_t v89 = v31;
  uint64_t v88 = v25 + 16;
  uint64_t v87 = v32;
  sub_FE98();
  v33();
  uint64_t v34 = *(void *)(v16 + 16);
  uint64_t v92 = v4;
  v83[2] = v16 + 16;
  v83[1] = v34;
  sub_FE98();
  v35();
  uint64_t v36 = sub_53DA0();
  os_log_type_t v37 = sub_53E90();
  BOOL v38 = os_log_type_enabled(v36, v37);
  uint64_t v95 = v23;
  uint64_t v102 = v25;
  uint64_t v85 = v16;
  if (v38)
  {
    uint64_t v39 = (uint8_t *)sub_1001C();
    uint64_t v106 = sub_15284();
    v83[0] = v20;
    *(_DWORD *)uint64_t v39 = 136315138;
    uint64_t v84 = (void (*)(char *, uint64_t))(v39 + 4);
    sub_13C5C(&qword_6C3D8, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v40 = sub_53FD0();
    uint64_t v42 = sub_50F10(v40, v41, &v106);
    sub_152F4(v42);
    sub_53EF0();
    swift_bridgeObjectRelease();
    uint64_t v84 = *(void (**)(char *, uint64_t))(v16 + 8);
    sub_6120();
    v43();
    _os_log_impl(&dword_0, v36, v37, "EmergencyPromptForConfirmationFlowStrategy parseConfirmationResponse. Input: %s", v39, 0xCu);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();

    uint64_t v44 = v102;
  }
  else
  {
    uint64_t v84 = *(void (**)(char *, uint64_t))(v16 + 8);
    v84(v22, v14);

    uint64_t v44 = v25;
  }
  uint64_t v45 = *(void (**)(void))(v44 + 8);
  sub_6120();
  v45();
  uint64_t v46 = v90;
  sub_10034();
  uint64_t v47 = v103;
  int v48 = sub_5800(v46, 1, v103);
  uint64_t v49 = v93;
  if (v48 == 1)
  {
    sub_14A94(v46, &qword_6BE58);
    sub_6108();
    sub_FE98();
    v50();
    sub_FE98();
    v51();
    unint64_t v52 = sub_53DA0();
    os_log_type_t v53 = sub_53EA0();
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v54 = swift_slowAlloc();
      uint64_t v105 = swift_slowAlloc();
      *(_DWORD *)uint64_t v54 = 136315394;
      LOBYTE(v104) = 1;
      uint64_t v55 = sub_53E10();
      uint64_t v104 = sub_50F10(v55, v56, &v105);
      sub_53EF0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v54 + 12) = 2080;
      sub_13C5C(&qword_6C3D8, (void (*)(uint64_t))&type metadata accessor for Input);
      uint64_t v57 = sub_53FD0();
      uint64_t v104 = sub_50F10(v57, v58, &v105);
      sub_53EF0();
      swift_bridgeObjectRelease();
      sub_1541C();
      sub_6120();
      v59();
      _os_log_impl(&dword_0, v52, v53, "%s: No confirmation response found in input: %s", (uint8_t *)v54, 0x16u);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();
    }
    else
    {
      sub_1541C();
      sub_6120();
      v73();
    }

    sub_6120();
    v45();
    sub_F824();
    uint64_t v74 = swift_allocError();
    *uint64_t v75 = 1;
    uint64_t v76 = (uint64_t)v97;
    uint64_t *v97 = v74;
    swift_storeEnumTagMultiPayload();
    v99(v76);
    sub_14A94(v76, &qword_6C4F8);
  }
  else
  {
    v101 = v45;
    uint64_t v60 = v94;
    uint64_t v61 = sub_153A0();
    v62(v61);
    sub_6108();
    sub_FE98();
    v63();
    uint64_t v64 = v86;
    uint64_t v92 = *(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16);
    v92(v86, v60, v47);
    uint64_t v65 = (void *)sub_53DA0();
    os_log_type_t v66 = sub_53E90();
    if (sub_153E0(v66))
    {
      os_log_type_t v67 = (_DWORD *)sub_1001C();
      uint64_t v105 = sub_15284();
      *os_log_type_t v67 = 136315138;
      sub_13C5C(&qword_6C500, (void (*)(uint64_t))&type metadata accessor for ConfirmationResponse);
      uint64_t v68 = sub_53FD0();
      uint64_t v104 = sub_50F10(v68, v69, &v105);
      sub_53EF0();
      swift_bridgeObjectRelease();
      uint64_t v70 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
      v70(v64, v103);
      sub_152C8(&dword_0, v71, v72, "Received confirmation: %s");
      sub_153AC();
      sub_60F0();
      uint64_t v47 = v103;
      sub_60F0();
    }
    else
    {
      uint64_t v70 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
      v70(v64, v47);
    }

    sub_6120();
    v77();
    uint64_t v78 = (uint64_t)v97;
    uint64_t v79 = v94;
    v92((uint64_t)v97, v94, v47);
    sub_15394();
    sub_34DC(v80, v81, v82, v47);
    swift_storeEnumTagMultiPayload();
    v99(v78);
    sub_14A94(v78, &qword_6C4F8);
    v70(v79, v47);
  }
  sub_9638();
}

void sub_13574()
{
  sub_15308();
  uint64_t v1 = v0;
  uint64_t v34 = v3;
  uint64_t v35 = v2;
  uint64_t v4 = sub_2E18(&qword_6C4E0);
  uint64_t v5 = sub_FEC4(v4);
  __chkstk_darwin(v5);
  sub_15348();
  uint64_t v33 = sub_533D0();
  sub_9120();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_6140();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = sub_53DB0();
  sub_9120();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_6140();
  uint64_t v18 = v17 - v16;
  sub_53D90();
  sub_6108();
  sub_FE98();
  v19();
  uint64_t v20 = sub_53DA0();
  os_log_type_t v21 = sub_53E90();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)sub_61F0();
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl(&dword_0, v20, v21, "EmergencyPromptForConfirmationFlowStrategy makeConfirmationRejectedResponse", v22, 2u);
    sub_60F0();
  }

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v18, v12);
  if (v1[23])
  {
    swift_bridgeObjectRetain();
    sub_532B0();
    uint64_t v32 = v36[4];
    sub_2C00(v36, v36[3]);
    sub_53300();
    (*(void (**)(uint64_t, void, uint64_t))(v7 + 104))(v11, enum case for ActivityType.confirmationRejected(_:), v33);
    uint64_t v23 = sub_532E0();
    sub_6188();
    sub_15444();
    v25(v24);
    sub_15394();
    sub_34DC(v26, v27, v28, v23);
    sub_532F0();
    sub_532C0();
    swift_release();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v36);
  }
  uint64_t v29 = v1[10];
  uint64_t v30 = v1[11];
  sub_2C00(v1 + 7, v29);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v30 + 8))(v37, v29, v30);
  sub_2C00(v1 + 2, v1[5]);
  uint64_t v31 = type metadata accessor for ConfirmationFlowConfigModel();
  __chkstk_darwin(v31);
  *(&v32 - 2) = (uint64_t)v37;
  sub_12A70((void (*)(char *))sub_13BF8, (uint64_t)v36);
  v35(v36);
  sub_14A94((uint64_t)v36, &qword_6C4E8);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v37);
  sub_9638();
}

uint64_t sub_138E0@<X0>(void *a1@<X1>, uint64_t *a2@<X8>)
{
  sub_2C00(a1, a1[3]);
  sub_53340();
  memset(v4, 0, sizeof(v4));
  uint64_t v5 = 0;
  a2[3] = sub_53630();
  a2[4] = (uint64_t)&protocol witness table for AceOutput;
  sub_5DC4(a2);
  sub_53400();
  return sub_14A94((uint64_t)v4, &qword_6C4F0);
}

uint64_t sub_139A4()
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 16);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 56);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 96);
  sub_6068(v0 + 136);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_139E4()
{
  sub_139A4();

  return _swift_deallocClassInstance(v0, 192, 7);
}

uint64_t type metadata accessor for EmergencyPromptForConfirmationFlowStrategy()
{
  return self;
}

uint64_t sub_13A3C()
{
  return sub_13C5C(&qword_6C4D8, (void (*)(uint64_t))type metadata accessor for EmergencyConfirmationResponseProvider);
}

uint64_t type metadata accessor for EmergencyConfirmationResponseProvider()
{
  uint64_t result = qword_6C580;
  if (!qword_6C580) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_13AD4(void *__src)
{
  memcpy(v1, __src, sizeof(v1));
  sub_12060();
}

uint64_t sub_13B28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for EmergencyPromptForConfirmationFlowStrategy();

  return PromptForConfirmationFlowStrategy.makeRepromptOnEmptyParse(itemToConfirm:_:)(a1, a2, a3, v9, a5);
}

uint64_t sub_13B8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for EmergencyPromptForConfirmationFlowStrategy();

  return PromptForConfirmationFlowStrategy.makeRepromptOnLowConfidence(itemToConfirm:_:)(a1, a2, a3, v9, a5);
}

uint64_t sub_13BF8@<X0>(uint64_t *a1@<X8>)
{
  return sub_138E0(*(void **)(v1 + 16), a1);
}

uint64_t sub_13C00(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_2E18(a3);
  sub_6188();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_13C5C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_13CA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_53CD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_13D08(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_6188();
  sub_15450();
  v3();
  return a1;
}

void *sub_13D5C(uint64_t a1, const void *a2)
{
  uint64_t v35 = a1;
  uint64_t v3 = sub_53DB0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2E18(&qword_6BCA8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v33 - v11;
  os_log_type_t v37 = &type metadata for EmergencyCATProvider;
  BOOL v38 = &off_66E10;
  v36[0] = swift_allocObject();
  memcpy((void *)(v36[0] + 16), a2, 0x70uLL);
  sub_2C00(v36, (uint64_t)&type metadata for EmergencyCATProvider);
  swift_retain();
  sub_2EFC((uint64_t)a2);
  sub_3848();
  swift_release();
  uint64_t v13 = sub_54060();
  uint64_t v15 = v14;
  sub_14A94((uint64_t)v12, &qword_6BCA8);
  if (v15)
  {
    uint64_t v16 = v13;
    sub_2C00(v36, (uint64_t)v37);
    swift_retain();
    sub_3860();
    swift_release();
    uint64_t v17 = sub_54060();
    uint64_t v19 = v18;
    sub_14A94((uint64_t)v10, &qword_6BCA8);
    if (v19)
    {
      sub_2E18(&qword_6C520);
      uint64_t inited = swift_initStackObject();
      uint64_t v34 = v17;
      os_log_type_t v21 = (void *)inited;
      long long v33 = xmmword_547B0;
      *(_OWORD *)(inited + 16) = xmmword_547B0;
      swift_bridgeObjectRetain();
      void v21[4] = sub_53D30();
      v21[5] = v22;
      v21[9] = &type metadata for String;
      uint64_t v21[6] = 0x656D7269666E6F63;
      v21[7] = 0xE900000000000064;
      uint64_t v23 = sub_53DD0();
      uint64_t v39 = v16;
      uint64_t v40 = v15;
      unint64_t v41 = 0xD000000000000035;
      unint64_t v42 = 0x8000000000057BA0;
      uint64_t v43 = v23;
      uint64_t v24 = swift_initStackObject();
      *(_OWORD *)(v24 + 16) = v33;
      swift_bridgeObjectRetain();
      *(void *)(v24 + 32) = sub_53D30();
      *(void *)(v24 + 40) = v25;
      *(void *)(v24 + 72) = &type metadata for String;
      *(void *)(v24 + 48) = 0x64657463656A6572;
      *(void *)(v24 + 56) = 0xE800000000000000;
      uint64_t v26 = sub_53DD0();
      uint64_t v44 = v34;
      uint64_t v45 = v19;
      unint64_t v46 = 0xD000000000000035;
      unint64_t v47 = 0x8000000000057BA0;
      uint64_t v48 = v26;
      uint64_t v27 = (void *)sub_53BD0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      goto LABEL_8;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v28 = sub_53D90();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v28, v3);
  uint64_t v29 = sub_53DA0();
  os_log_type_t v30 = sub_53EA0();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v31 = 0;
    _os_log_impl(&dword_0, v29, v30, "Failed to execute label CATs for makeYesNoButtons", v31, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v27 = &_swiftEmptyArrayStorage;
LABEL_8:
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v36);
  return v27;
}

void *sub_141C8(uint64_t a1, const void *a2)
{
  uint64_t v35 = a1;
  uint64_t v3 = sub_53DB0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2E18(&qword_6BCA8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v33 - v11;
  os_log_type_t v37 = &type metadata for EmergencyCATProvider;
  BOOL v38 = &off_66E10;
  v36[0] = swift_allocObject();
  memcpy((void *)(v36[0] + 16), a2, 0x70uLL);
  sub_2C00(v36, (uint64_t)&type metadata for EmergencyCATProvider);
  swift_retain();
  sub_2EFC((uint64_t)a2);
  sub_254E4();
  swift_release();
  uint64_t v13 = sub_54060();
  uint64_t v15 = v14;
  sub_14A94((uint64_t)v12, &qword_6BCA8);
  if (v15)
  {
    uint64_t v16 = v13;
    sub_2C00(v36, (uint64_t)v37);
    swift_retain();
    sub_3884();
    swift_release();
    uint64_t v17 = sub_54060();
    uint64_t v19 = v18;
    sub_14A94((uint64_t)v10, &qword_6BCA8);
    if (v19)
    {
      sub_2E18(&qword_6C520);
      uint64_t inited = swift_initStackObject();
      uint64_t v34 = v17;
      os_log_type_t v21 = (void *)inited;
      long long v33 = xmmword_547B0;
      *(_OWORD *)(inited + 16) = xmmword_547B0;
      swift_bridgeObjectRetain();
      void v21[4] = sub_53D30();
      v21[5] = v22;
      v21[9] = &type metadata for String;
      uint64_t v21[6] = 0x656D7269666E6F63;
      v21[7] = 0xE900000000000064;
      uint64_t v23 = sub_53DD0();
      uint64_t v39 = v16;
      uint64_t v40 = v15;
      unint64_t v41 = 0xD000000000000035;
      unint64_t v42 = 0x8000000000057BA0;
      uint64_t v43 = v23;
      uint64_t v24 = swift_initStackObject();
      *(_OWORD *)(v24 + 16) = v33;
      swift_bridgeObjectRetain();
      *(void *)(v24 + 32) = sub_53D30();
      *(void *)(v24 + 40) = v25;
      *(void *)(v24 + 72) = &type metadata for String;
      *(void *)(v24 + 48) = 0x64657463656A6572;
      *(void *)(v24 + 56) = 0xE800000000000000;
      uint64_t v26 = sub_53DD0();
      uint64_t v44 = v34;
      uint64_t v45 = v19;
      unint64_t v46 = 0xD000000000000035;
      unint64_t v47 = 0x8000000000057BA0;
      uint64_t v48 = v26;
      uint64_t v27 = (void *)sub_53BD0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      goto LABEL_8;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v28 = sub_53D90();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v28, v3);
  uint64_t v29 = sub_53DA0();
  os_log_type_t v30 = sub_53EA0();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v31 = 0;
    _os_log_impl(&dword_0, v29, v30, "Failed to execute label CATs for makeStartCancelButtons", v31, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v27 = &_swiftEmptyArrayStorage;
LABEL_8:
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v36);
  return v27;
}

void *sub_14634(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_53DB0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = &type metadata for EmergencyCATProvider;
  uint64_t v26 = &off_66E10;
  v24[0] = swift_allocObject();
  memcpy((void *)(v24[0] + 16), (const void *)a2, 0x70uLL);
  sub_2C00(a1, a1[3]);
  sub_2EFC(a2);
  LOBYTE(a2) = sub_533A0();
  sub_3048((uint64_t)a1, (uint64_t)v23);
  if (a2)
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v23);
LABEL_4:
    uint64_t v11 = sub_53D90();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v11, v6);
    uint64_t v12 = sub_53DA0();
    os_log_type_t v13 = sub_53E90();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_0, v12, v13, "Device is HomePod or AppleTV. Not creating aceViews from ConfirmationSnippets.", v14, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v15 = &_swiftEmptyArrayStorage;
    goto LABEL_7;
  }
  sub_2C00(v23, v23[3]);
  char v10 = sub_53380();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v23);
  if (v10) {
    goto LABEL_4;
  }
  uint64_t v15 = &_swiftEmptyArrayStorage;
  switch((unint64_t)a3)
  {
    case 0uLL:
      break;
    case 1uLL:
      uint64_t v17 = sub_2C00(v24, (uint64_t)v25);
      memcpy(__dst, v17, sizeof(__dst));
      uint64_t v18 = sub_13D5C((uint64_t)a1, __dst);
      goto LABEL_14;
    case 2uLL:
      uint64_t v19 = sub_2C00(v24, (uint64_t)v25);
      memcpy(__dst, v19, sizeof(__dst));
      uint64_t v18 = sub_27348((uint64_t)a1, __dst);
      goto LABEL_14;
    case 3uLL:
      uint64_t v20 = sub_2C00(v24, (uint64_t)v25);
      memcpy(__dst, v20, sizeof(__dst));
      uint64_t v18 = sub_27368((uint64_t)a1, __dst);
      goto LABEL_14;
    case 4uLL:
      os_log_type_t v21 = sub_2C00(v24, (uint64_t)v25);
      memcpy(__dst, v21, sizeof(__dst));
      uint64_t v18 = sub_277B8((uint64_t)a1, __dst);
      goto LABEL_14;
    case 5uLL:
      uint64_t v22 = sub_2C00(v24, (uint64_t)v25);
      memcpy(__dst, v22, sizeof(__dst));
      uint64_t v18 = sub_141C8((uint64_t)a1, __dst);
LABEL_14:
      uint64_t v15 = v18;
      break;
    default:
      swift_bridgeObjectRetain();
      uint64_t v15 = a3;
      break;
  }
LABEL_7:
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v24);
  return v15;
}

unint64_t sub_149C8(unint64_t result)
{
  if (result >= 6) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_149D8(unint64_t result)
{
  if (result >= 6) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_149E8@<X0>(uint64_t *a1@<X8>)
{
  return sub_128A0(*(void **)(v1 + 16), *(void *)(v1 + 32), *(void *)(v1 + 40), a1);
}

uint64_t sub_149F4()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 128, 7);
}

uint64_t sub_14A94(uint64_t a1, uint64_t *a2)
{
  sub_2E18(a2);
  sub_6188();
  sub_15450();
  v3();
  return a1;
}

uint64_t *sub_14AE4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(sub_2E18(&qword_6BE58) - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_53550();
    if (sub_5800((uint64_t)a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      sub_34DC((uint64_t)a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_14BEC(uint64_t a1)
{
  uint64_t v2 = sub_53550();
  uint64_t result = sub_5800(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_14C74(void *a1, const void *a2)
{
  uint64_t v4 = sub_53550();
  if (sub_5800((uint64_t)a2, 1, v4))
  {
    uint64_t v5 = sub_2E18(&qword_6BE58);
    memcpy(a1, a2, *(void *)(*(void *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    sub_34DC((uint64_t)a1, 0, 1, v4);
  }
  return a1;
}

void *sub_14D3C(void *a1, const void *a2)
{
  uint64_t v4 = sub_53550();
  int v5 = sub_5800((uint64_t)a1, 1, v4);
  int v6 = sub_5800((uint64_t)a2, 1, v4);
  if (!v5)
  {
    uint64_t v7 = *(void *)(v4 - 8);
    if (!v6)
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 24))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v6)
  {
LABEL_6:
    uint64_t v8 = sub_2E18(&qword_6BE58);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  sub_34DC((uint64_t)a1, 0, 1, v4);
  return a1;
}

void *sub_14E84(void *a1, const void *a2)
{
  uint64_t v4 = sub_53550();
  if (sub_5800((uint64_t)a2, 1, v4))
  {
    uint64_t v5 = sub_2E18(&qword_6BE58);
    memcpy(a1, a2, *(void *)(*(void *)(v5 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
    sub_34DC((uint64_t)a1, 0, 1, v4);
  }
  return a1;
}

void *sub_14F4C(void *a1, const void *a2)
{
  uint64_t v4 = sub_53550();
  int v5 = sub_5800((uint64_t)a1, 1, v4);
  int v6 = sub_5800((uint64_t)a2, 1, v4);
  if (!v5)
  {
    uint64_t v7 = *(void *)(v4 - 8);
    if (!v6)
    {
      (*(void (**)(void *, const void *, uint64_t))(v7 + 40))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v6)
  {
LABEL_6:
    uint64_t v8 = sub_2E18(&qword_6BE58);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  sub_34DC((uint64_t)a1, 0, 1, v4);
  return a1;
}

uint64_t sub_15094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_150A8);
}

uint64_t sub_150A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2E18(&qword_6BE58);

  return sub_5800(a1, a2, v4);
}

uint64_t sub_150F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_15108);
}

uint64_t sub_15108(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2E18(&qword_6BE58);

  return sub_34DC(a1, a2, a2, v4);
}

void sub_15158()
{
  sub_151E4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_151E4()
{
  if (!qword_6C590)
  {
    sub_53550();
    unint64_t v0 = sub_53EE0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_6C590);
    }
  }
}

uint64_t sub_15264()
{
  return swift_beginAccess();
}

uint64_t sub_15284()
{
  return swift_slowAlloc();
}

uint64_t sub_1529C(uint64_t a1)
{
  *(void *)(v1 - 160) = a1;
  return v1 - 160;
}

uint64_t sub_152B0()
{
  return v0;
}

void sub_152C8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_152F4(uint64_t a1)
{
  *(void *)(v1 - 144) = a1;
  return v1 - 144;
}

uint64_t sub_15320()
{
  return sub_53FE0();
}

uint64_t sub_15348()
{
  return 0;
}

uint64_t sub_15364(uint64_t a1, void (*a2)(void))
{
  uint64_t v4 = *(void *)(v2 - 456);
  return sub_13D08(v4, a2);
}

uint64_t sub_153A0()
{
  return v0;
}

uint64_t sub_153AC()
{
  return swift_arrayDestroy();
}

uint64_t sub_153C8()
{
  return *(void *)(v0 - 312);
}

BOOL sub_153E0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_1541C()
{
  return v0;
}

uint64_t sub_15430()
{
  return v0;
}

uint64_t sub_1545C()
{
  return sub_53FE0();
}

uint64_t sub_15488()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_15490()
{
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_15498()
{
  return _swift_deallocClassInstance(v0, 18, 7);
}

uint64_t type metadata accessor for MockNetworkStatusProvider()
{
  return self;
}

uint64_t sub_154CC()
{
  return sub_15488() & 1;
}

uint64_t sub_154F4()
{
  return sub_15490() & 1;
}

uint64_t type metadata accessor for EmergencyDomesticViolenceBasicIntentModernCATs()
{
  uint64_t result = qword_6C678;
  if (!qword_6C678) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_15564()
{
  return swift_initClassMetadata2();
}

uint64_t sub_155A4(uint64_t a1, uint64_t a2)
{
  return sub_155F8(a1, a2);
}

uint64_t sub_155F8(uint64_t a1, uint64_t a2)
{
  sub_53B30();
  sub_9AD8();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_6140();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v11 - 8);
  sub_6140();
  sub_9A10(a1, v13 - v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v10, a2, v2);
  uint64_t v14 = sub_53AE0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v2);
  sub_9A78(a1);
  return v14;
}

uint64_t sub_15724(uint64_t a1, uint64_t a2)
{
  sub_53B30();
  sub_9AD8();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_6140();
  uint64_t v9 = v8 - v7;
  swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v9, a2, v2);
  uint64_t v10 = sub_53AF0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v2);
  return v10;
}

uint64_t sub_15800()
{
  return type metadata accessor for EmergencyDomesticViolenceBasicIntentModernCATs();
}

uint64_t sub_15808(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000012;
  unint64_t v4 = 0x80000000000571B0;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0xD000000000000012;
      unint64_t v4 = 0x80000000000571D0;
      break;
    case 2:
      uint64_t v5 = "isContentReporting";
      goto LABEL_5;
    case 3:
      uint64_t v5 = "isExplicitSearch";
LABEL_5:
      unint64_t v4 = (unint64_t)v5 | 0x8000000000000000;
      unint64_t v3 = 0xD000000000000010;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xD000000000000012;
  unint64_t v7 = 0x80000000000571B0;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xD000000000000012;
      unint64_t v7 = 0x80000000000571D0;
      break;
    case 2:
      uint64_t v8 = "isContentReporting";
      goto LABEL_10;
    case 3:
      uint64_t v8 = "isExplicitSearch";
LABEL_10:
      unint64_t v7 = (unint64_t)v8 | 0x8000000000000000;
      unint64_t v6 = 0xD000000000000010;
      break;
    default:
      break;
  }
  if (v3 == v6 && v4 == v7) {
    char v10 = 1;
  }
  else {
    char v10 = sub_53FE0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

Swift::Int sub_15964()
{
  return sub_54050();
}

uint64_t sub_159AC()
{
  sub_53E40();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_15A74()
{
  return sub_54050();
}

uint64_t sub_15AB8()
{
  uint64_t result = v0;
  *(_DWORD *)(v0 + 16) = 0;
  return result;
}

uint64_t sub_15AC4()
{
  return _swift_deallocClassInstance(v0, 20, 7);
}

uint64_t sub_15AD4()
{
  return 0x7469532E6D617363;
}

uint64_t sub_15AF8()
{
  return 0;
}

uint64_t sub_15B00(unsigned char *a1)
{
  *(void *)(v1 + 16) = 0;
  *(unsigned char *)(v1 + 24) = a1[16];
  *(unsigned char *)(v1 + 25) = a1[17];
  *(unsigned char *)(v1 + 26) = a1[18];
  char v2 = a1[19];
  swift_release();
  *(unsigned char *)(v1 + 27) = v2;
  return v1;
}

double sub_15B48@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (a1 == 0xD000000000000012 && (sub_16768(), v6) || (sub_16794() & 1) != 0)
  {
    char v7 = v2[24];
LABEL_5:
    *(void *)(a2 + 24) = &type metadata for Bool;
    *(unsigned char *)a2 = v7;
    return result;
  }
  if (a1 == 0xD000000000000012 && (sub_16768(), v6) || (sub_16794() & 1) != 0)
  {
    char v7 = v2[25];
    goto LABEL_5;
  }
  if (a1 == 0xD000000000000010 && (sub_16768(), v6) || (sub_16720() & 1) != 0)
  {
    char v7 = v2[26];
    goto LABEL_5;
  }
  if (a1 == 0xD000000000000010 && (sub_16768(), v6) || (sub_16720() & 1) != 0)
  {
    char v7 = v2[27];
    goto LABEL_5;
  }
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

uint64_t sub_15C44(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_65A40;
  v6._object = a2;
  unint64_t v4 = sub_53FA0(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 4) {
    return 4;
  }
  else {
    return v4;
  }
}

uint64_t sub_15C94()
{
  return 4;
}

uint64_t sub_15C9C()
{
  return 0;
}

void sub_15CA8(char a1)
{
  switch(a1)
  {
    case 1:
      sub_167BC();
      break;
    default:
      return;
  }
}

void sub_15D34(char a1)
{
  switch(a1)
  {
    case 1:
      sub_167BC();
      break;
    default:
      return;
  }
}

uint64_t sub_15DC0(char *a1, char *a2)
{
  return sub_15808(*a1, *a2);
}

Swift::Int sub_15DCC()
{
  return sub_15964();
}

uint64_t sub_15DD4()
{
  return sub_159AC();
}

Swift::Int sub_15DDC()
{
  return sub_15A74();
}

uint64_t sub_15DE4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_15C44(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

void sub_15E14(void *a1@<X8>)
{
  sub_15CA8(*v1);
  *a1 = v3;
  a1[1] = v4;
}

void sub_15E40()
{
  sub_15D34(*v0);
}

uint64_t sub_15E48@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_15C90();
  *a1 = result;
  return result;
}

void sub_15E70(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_15E7C(uint64_t a1)
{
  unint64_t v2 = sub_164E0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_15EB8(uint64_t a1)
{
  unint64_t v2 = sub_164E0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_15EF4()
{
  return _swift_deallocClassInstance(v0, 28, 7);
}

uint64_t type metadata accessor for CsamSituation()
{
  return self;
}

uint64_t sub_15F50(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_2E18(&qword_6C930);
  sub_9120();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  char v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2C00(a1, a1[3]);
  sub_164E0();
  sub_54090();
  uint64_t v11 = v3[24];
  char v20 = 0;
  sub_16778(v11, (uint64_t)&v20);
  if (!v2)
  {
    uint64_t v12 = v3[25];
    char v19 = 1;
    sub_16778(v12, (uint64_t)&v19);
    uint64_t v13 = v3[26];
    char v18 = 2;
    sub_16778(v13, (uint64_t)&v18);
    uint64_t v14 = v3[27];
    char v17 = 3;
    sub_16778(v14, (uint64_t)&v17);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v5);
}

uint64_t sub_160A8(void *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_1611C(a1);
  return v2;
}

uint64_t type metadata accessor for CsamSituation.Builder()
{
  return self;
}

uint64_t sub_1611C(void *a1)
{
  uint64_t v3 = v1;
  sub_2E18(&qword_6C920);
  sub_9120();
  __chkstk_darwin(v5);
  *(void *)(v1 + 16) = 0;
  sub_2C00(a1, a1[3]);
  sub_164E0();
  sub_54080();
  if (v2)
  {

    type metadata accessor for CsamSituation();
    swift_deallocPartialClassInstance();
  }
  else
  {
    char v13 = 0;
    *(unsigned char *)(v1 + 24) = sub_1674C((uint64_t)&v13) & 1;
    char v12 = 1;
    *(unsigned char *)(v1 + 25) = sub_1674C((uint64_t)&v12) & 1;
    char v11 = 2;
    *(unsigned char *)(v1 + 26) = sub_1674C((uint64_t)&v11) & 1;
    char v10 = 3;
    char v7 = sub_1674C((uint64_t)&v10);
    uint64_t v8 = sub_167C8();
    v9(v8);
    *(unsigned char *)(v3 + 27) = v7 & 1;
  }
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)a1);
  return v3;
}

void *sub_162D4()
{
  uint64_t v1 = *v0;
  swift_beginAccess();
  uint64_t v2 = *(void **)(v1 + 16);
  id v3 = v2;
  return v2;
}

void sub_1631C(uint64_t a1)
{
  uint64_t v3 = *v1;
  swift_beginAccess();
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = a1;
}

uint64_t (*sub_16368())()
{
  return j__swift_endAccess;
}

double sub_163C4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_15B48(a1, a2);
}

uint64_t sub_163E8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_160A8(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_16414(void *a1)
{
  return sub_15F50(a1);
}

uint64_t sub_16438()
{
  return sub_164A0(&qword_6C910);
}

uint64_t sub_1646C()
{
  return sub_164A0(&qword_6C918);
}

uint64_t sub_164A0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CsamSituation();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_164E0()
{
  unint64_t result = qword_6C928;
  if (!qword_6C928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C928);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for CsamSituation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x165F8);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CsamSituation.CodingKeys()
{
  return &type metadata for CsamSituation.CodingKeys;
}

unint64_t sub_16634()
{
  unint64_t result = qword_6C938;
  if (!qword_6C938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C938);
  }
  return result;
}

unint64_t sub_16684()
{
  unint64_t result = qword_6C940;
  if (!qword_6C940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C940);
  }
  return result;
}

unint64_t sub_166D4()
{
  unint64_t result = qword_6C948;
  if (!qword_6C948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_6C948);
  }
  return result;
}

uint64_t sub_16720()
{
  return sub_53FE0();
}

uint64_t sub_1674C(uint64_t a1)
{
  return KeyedDecodingContainer.decode(_:forKey:)(a1, v1);
}

uint64_t sub_16778(uint64_t a1, uint64_t a2)
{
  return KeyedEncodingContainer.encode(_:forKey:)(a1, a2, v2);
}

uint64_t sub_16794()
{
  return sub_53FE0();
}

uint64_t sub_167C8()
{
  return v0;
}

uint64_t sub_167DC(uint64_t a1, uint64_t a2, char a3, char a4)
{
  *(unsigned char *)(v4 + 146) = a4;
  *(unsigned char *)(v4 + 145) = a3;
  *(void *)(v4 + 1696) = a2;
  *(void *)(v4 + 1688) = a1;
  uint64_t v5 = sub_53DB0();
  *(void *)(v4 + 1704) = v5;
  *(void *)(v4 + 1712) = *(void *)(v5 - 8);
  *(void *)(v4 + 1720) = swift_task_alloc();
  *(void *)(v4 + 1728) = swift_task_alloc();
  return _swift_task_switch(sub_168B8, 0, 0);
}

uint64_t sub_168B8()
{
  uint64_t v1 = *(void **)(v0 + 1696);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_2C00(v1, v2);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 1736) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_169D8;
  uint64_t v5 = *(unsigned __int8 *)(v0 + 146);
  uint64_t v6 = *(unsigned __int8 *)(v0 + 145);
  return v8(v0 + 424, v6, v5, v2, v3);
}

uint64_t sub_169D8()
{
  uint64_t v1 = *v0 + 16;
  uint64_t v2 = *v0 + 424;
  swift_task_dealloc();
  sub_1701C(v2, v1, &qword_6C958);
  return _swift_task_switch(sub_16AF0, 0, 0);
}

uint64_t sub_16AF0()
{
  uint64_t v35 = v0;
  sub_1701C(v0 + 424, v0 + 288, &qword_6C958);
  if (sub_17014(v0 + 288) == 1)
  {
    uint64_t v32 = *(void *)nullsub_1(v0 + 288);
    sub_53D90();
    sub_17230();
    uint64_t v1 = sub_17214();
    v2(v1);
    sub_1701C(v0 + 16, v0 + 832, &qword_6C958);
    nullsub_1(v0 + 832);
    sub_1701C(v0 + 16, v0 + 968, &qword_6C958);
    nullsub_1(v0 + 968);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v3 = sub_53DA0();
    os_log_type_t v4 = sub_53EA0();
    BOOL v5 = os_log_type_enabled(v3, v4);
    uint64_t v6 = *(void *)(v0 + 1728);
    uint64_t v7 = *(void *)(v0 + 1712);
    uint64_t v8 = *(void *)(v0 + 1704);
    if (v5)
    {
      uint64_t v31 = *(void *)(v0 + 1704);
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315138;
      *(void *)(v0 + 1672) = v32;
      swift_errorRetain();
      sub_2E18(&qword_6BCA0);
      uint64_t v10 = sub_53E10();
      *(void *)(v0 + 1680) = sub_50F10(v10, v11, &v34);
      sub_53EF0();
      swift_bridgeObjectRelease();
      sub_17180(v0 + 424);
      sub_17180(v0 + 424);
      _os_log_impl(&dword_0, v3, v4, "Error while fetching orgInfo: %s", v9, 0xCu);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();

      sub_17180(v0 + 424);
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v31);
    }
    else
    {
      sub_17180(v0 + 424);
      sub_17180(v0 + 424);
      sub_1701C(v0 + 16, v0 + 152, &qword_6C958);
      nullsub_1(v0 + 152);
      swift_errorRelease();

      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    }
    uint64_t v26 = v0 + 1488;
    sub_F294((_OWORD *)(v0 + 1488));
  }
  else
  {
    uint64_t v33 = v0 + 424;
    uint64_t v12 = nullsub_1(v0 + 288);
    sub_1701C(v12, v0 + 1360, &qword_6C3B0);
    sub_53D90();
    sub_17230();
    uint64_t v13 = sub_17214();
    v14(v13);
    sub_1701C(v0 + 16, v0 + 696, &qword_6C958);
    uint64_t v15 = (uint64_t *)nullsub_1(v0 + 696);
    sub_1701C(v0 + 16, v0 + 560, &qword_6C958);
    uint64_t v16 = (uint64_t *)nullsub_1(v0 + 560);
    sub_17080(v16);
    sub_17080(v15);
    char v17 = sub_53DA0();
    os_log_type_t v18 = sub_53E90();
    BOOL v19 = os_log_type_enabled(v17, v18);
    uint64_t v20 = *(void *)(v0 + 1720);
    uint64_t v21 = *(void *)(v0 + 1712);
    uint64_t v22 = *(void *)(v0 + 1704);
    if (v19)
    {
      uint64_t v30 = *(void *)(v0 + 1720);
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315138;
      sub_1701C(v0 + 1360, v0 + 1104, &qword_6C3B0);
      sub_2E18(&qword_6C3B0);
      uint64_t v24 = sub_53ED0();
      *(void *)(v0 + 1664) = sub_50F10(v24, v25, &v34);
      sub_53EF0();
      swift_bridgeObjectRelease();
      sub_17180(v33);
      sub_17180(v33);
      _os_log_impl(&dword_0, v17, v18, "Successfully retrieved organization info: %s", v23, 0xCu);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();

      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v30, v22);
    }
    else
    {
      sub_17180(v33);
      sub_17180(v33);

      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
    }
    uint64_t v26 = v0 + 1360;
  }
  sub_1701C(v26, v0 + 1232, &qword_6C3B0);
  uint64_t v27 = *(void *)(v0 + 1688);
  swift_task_dealloc();
  swift_task_dealloc();
  sub_1701C(v0 + 1232, v27, &qword_6C3B0);
  uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
  return v28();
}

uint64_t sub_17014(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 128);
}

uint64_t sub_1701C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_2E18(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t *sub_17080(uint64_t *a1)
{
  return a1;
}

uint64_t sub_170DC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_17180(uint64_t a1)
{
  return a1;
}

uint64_t sub_171E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a17) {
    return swift_errorRelease();
  }
  else {
    return sub_F780(a1, a2);
  }
}

uint64_t sub_17214()
{
  return v0;
}

uint64_t sub_17230()
{
  return swift_beginAccess();
}

unint64_t sub_17254()
{
  unint64_t result = qword_6C960;
  if (!qword_6C960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C960);
  }
  return result;
}

unint64_t sub_172A4()
{
  unint64_t result = qword_6C968;
  if (!qword_6C968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C968);
  }
  return result;
}

uint64_t sub_172F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1764C(a1, a2, a3, (uint64_t (*)(void))sub_17920, (uint64_t (*)(void))sub_1796C);
}

unint64_t sub_17320()
{
  unint64_t result = qword_6C970;
  if (!qword_6C970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C970);
  }
  return result;
}

unint64_t sub_17370()
{
  unint64_t result = qword_6C978;
  if (!qword_6C978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C978);
  }
  return result;
}

uint64_t sub_173BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1764C(a1, a2, a3, (uint64_t (*)(void))sub_17888, (uint64_t (*)(void))sub_178D4);
}

unint64_t sub_173EC()
{
  unint64_t result = qword_6C980;
  if (!qword_6C980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C980);
  }
  return result;
}

unint64_t sub_1743C()
{
  unint64_t result = qword_6C988;
  if (!qword_6C988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C988);
  }
  return result;
}

uint64_t sub_17488(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1764C(a1, a2, a3, (uint64_t (*)(void))sub_177F0, (uint64_t (*)(void))sub_1783C);
}

unint64_t sub_174B8()
{
  unint64_t result = qword_6C990;
  if (!qword_6C990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C990);
  }
  return result;
}

unint64_t sub_17508()
{
  unint64_t result = qword_6C998;
  if (!qword_6C998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C998);
  }
  return result;
}

uint64_t sub_17554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1764C(a1, a2, a3, (uint64_t (*)(void))sub_17758, (uint64_t (*)(void))sub_177A4);
}

unint64_t sub_17584()
{
  unint64_t result = qword_6C9A0;
  if (!qword_6C9A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C9A0);
  }
  return result;
}

unint64_t sub_175D4()
{
  unint64_t result = qword_6C9A8;
  if (!qword_6C9A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C9A8);
  }
  return result;
}

uint64_t sub_17620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1764C(a1, a2, a3, (uint64_t (*)(void))sub_176C0, (uint64_t (*)(void))sub_1770C);
}

uint64_t sub_1764C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  uint64_t v8 = a4();
  uint64_t v9 = a5();

  return static TerminalNodeBoundedSemanticValue<>.fromIntentNodeValue(_:)(a1, a2, v8, v9);
}

unint64_t sub_176C0()
{
  unint64_t result = qword_6C9B0;
  if (!qword_6C9B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C9B0);
  }
  return result;
}

unint64_t sub_1770C()
{
  unint64_t result = qword_6C9B8;
  if (!qword_6C9B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C9B8);
  }
  return result;
}

unint64_t sub_17758()
{
  unint64_t result = qword_6C9C0;
  if (!qword_6C9C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C9C0);
  }
  return result;
}

unint64_t sub_177A4()
{
  unint64_t result = qword_6C9C8;
  if (!qword_6C9C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C9C8);
  }
  return result;
}

unint64_t sub_177F0()
{
  unint64_t result = qword_6C9D0;
  if (!qword_6C9D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C9D0);
  }
  return result;
}

unint64_t sub_1783C()
{
  unint64_t result = qword_6C9D8;
  if (!qword_6C9D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C9D8);
  }
  return result;
}

unint64_t sub_17888()
{
  unint64_t result = qword_6C9E0;
  if (!qword_6C9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C9E0);
  }
  return result;
}

unint64_t sub_178D4()
{
  unint64_t result = qword_6C9E8;
  if (!qword_6C9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C9E8);
  }
  return result;
}

unint64_t sub_17920()
{
  unint64_t result = qword_6C9F0;
  if (!qword_6C9F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C9F0);
  }
  return result;
}

unint64_t sub_1796C()
{
  unint64_t result = qword_6C9F8;
  if (!qword_6C9F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6C9F8);
  }
  return result;
}

void sub_179B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_15308();
  a19 = v21;
  a20 = v22;
  uint64_t v190 = v20;
  uint64_t v24 = v23;
  uint64_t v192 = sub_535F0();
  sub_60C0();
  uint64_t v26 = v25;
  __chkstk_darwin(v27);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v28);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v29);
  sub_152E8();
  uint64_t v207 = v30;
  uint64_t v31 = type metadata accessor for EmergencyNLIntent();
  uint64_t v32 = sub_FEC4(v31);
  __chkstk_darwin(v32);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v33);
  sub_152E8();
  sub_FE14(v34);
  uint64_t v198 = sub_53920();
  sub_60C0();
  uint64_t v200 = v35;
  __chkstk_darwin(v36);
  sub_6150();
  sub_FE14(v37);
  uint64_t v38 = sub_53670();
  uint64_t v39 = sub_FEC4(v38);
  __chkstk_darwin(v39);
  sub_6150();
  sub_FE14(v40);
  uint64_t v41 = sub_53CD0();
  uint64_t v42 = sub_FEC4(v41);
  __chkstk_darwin(v42);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v43);
  sub_152E8();
  sub_FE14(v44);
  uint64_t v186 = sub_53620();
  sub_60C0();
  uint64_t v191 = v45;
  __chkstk_darwin(v46);
  sub_6150();
  sub_FE14(v47);
  uint64_t v202 = sub_53600();
  sub_60C0();
  uint64_t v204 = v48;
  __chkstk_darwin(v49);
  sub_6150();
  uint64_t v203 = v50;
  uint64_t v51 = sub_535B0();
  sub_60C0();
  uint64_t v53 = v52;
  __chkstk_darwin(v54);
  sub_6140();
  uint64_t v57 = v56 - v55;
  uint64_t v58 = sub_53DB0();
  sub_60C0();
  uint64_t v60 = v59;
  __chkstk_darwin(v61);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v62);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v63);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v64);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v65);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v66);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v67);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v68);
  uint64_t v70 = (char *)&v180 - v69;
  uint64_t v71 = sub_53D90();
  sub_6108();
  uint64_t v72 = *(_DWORD **)(v60 + 16);
  uint64_t v201 = v71;
  uint64_t v205 = v72;
  uint64_t v206 = v60 + 16;
  sub_FE98();
  v73();
  uint64_t v199 = v24;
  sub_FE98();
  v74();
  uint64_t v75 = sub_53DA0();
  os_log_type_t v76 = sub_53E90();
  if (os_log_type_enabled(v75, v76))
  {
    uint64_t v181 = v26;
    uint64_t v77 = sub_1001C();
    uint64_t v193 = v58;
    uint64_t v78 = (uint8_t *)v77;
    uint64_t v79 = sub_15284();
    uint64_t v182 = v60;
    v208[0] = v79;
    *(_DWORD *)uint64_t v78 = 136315138;
    v180 = v78 + 4;
    sub_1B5D4(&qword_6C3D8, 255, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v80 = sub_53FD0();
    uint64_t v210 = sub_50F10(v80, v81, v208);
    uint64_t v26 = v181;
    sub_53EF0();
    swift_bridgeObjectRelease();
    sub_1B668();
    v82();
    _os_log_impl(&dword_0, v75, v76, "#EmergencyOfferCallFlow onInput: %s", v78, 0xCu);
    swift_arrayDestroy();
    uint64_t v60 = v182;
    sub_60F0();
    uint64_t v58 = v193;
    sub_60F0();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v57, v51);
  }

  uint64_t v83 = *(void (**)(char *, uint64_t))(v60 + 8);
  v83(v70, v58);
  uint64_t v84 = v203;
  sub_535A0();
  uint64_t v85 = (void (*)(void))v202;
  int v86 = v204[11](v84, v202);
  uint64_t v87 = v207;
  if (v86 == enum case for Parse.NLv3IntentOnly(_:))
  {
    uint64_t v88 = sub_1B650();
    v89(v88);
    sub_1B888();
    v90();
    sub_6108();
    uint64_t v91 = sub_1B678((uint64_t)&a16);
    ((void (*)(uint64_t))v85)(v91);
    uint64_t v92 = (void *)sub_53DA0();
    os_log_type_t v93 = sub_53E90();
    if (sub_FF7C(v93))
    {
      uint64_t v94 = (_WORD *)sub_61F0();
      sub_61CC(v94);
      sub_FED0(&dword_0, v95, v96, "EmergencyOfferCallFlow onInput .NLv3IntentOnly");
      sub_60F0();
    }

    uint64_t v97 = sub_1B6F0();
    ((void (*)(uint64_t))v83)(v97);
    uint64_t v98 = v197;
    sub_FE98();
    v99();
    sub_1B520(v98, v196, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    sub_24B38();
    unsigned int v101 = v100;
    sub_1B580(v98, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    uint64_t v102 = sub_1B830();
    v103(v102);
LABEL_18:
    unsigned int v131 = v101 >> 8;
    if (v101 == 4 && BYTE1(v101) == 35)
    {
      sub_6108();
      uint64_t v132 = v194;
      sub_1B868();
      v85();
      unint64_t v133 = (void *)sub_53DA0();
      os_log_type_t v134 = sub_53E90();
      if (sub_FF7C(v134))
      {
        uint64_t v135 = (_WORD *)sub_61F0();
        sub_61CC(v135);
        sub_FED0(&dword_0, v136, v137, "#EmergencyOfferCallFlow Produced an empty intent. Ignoring input.");
        uint64_t v132 = v194;
        sub_60F0();
      }

      uint64_t v138 = v132;
      goto LABEL_35;
    }
    if ((v101 & 0x10000) != 0)
    {
      sub_6108();
      uint64_t v139 = v189;
      sub_1B868();
      v85();
      uint64_t v140 = sub_53DA0();
      os_log_type_t v141 = sub_53EA0();
      if (os_log_type_enabled(v140, v141))
      {
        uint64_t v142 = v58;
        uint64_t v143 = (uint8_t *)sub_1001C();
        uint64_t v144 = sub_15284();
        *(_DWORD *)uint64_t v143 = 136315138;
        v211[0] = v144;
        LOWORD(v209) = v101;
        BYTE2(v209) = 1;
        uint64_t v145 = sub_53E10();
        uint64_t v209 = sub_50F10(v145, v146, v211);
        sub_53EF0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v140, v141, "#EmergencyOfferCallFlow Expected a non-DirectCall intent. Aborting flow. Intent: [%s]", v143, 0xCu);
        swift_arrayDestroy();
        sub_60F0();
        sub_60F0();

        uint64_t v138 = v189;
        uint64_t v147 = v142;
LABEL_36:
        ((void (*)(uint64_t, uint64_t))v204)(v138, v147);
        goto LABEL_40;
      }

      uint64_t v138 = v139;
LABEL_35:
      uint64_t v147 = v58;
      goto LABEL_36;
    }
    goto LABEL_33;
  }
  if (v86 == enum case for Parse.directInvocation(_:))
  {
    uint64_t v104 = sub_1B650();
    v105(v104);
    uint64_t v106 = v26;
    uint64_t v107 = v84;
    uint64_t v108 = v192;
    (*(void (**)(uint64_t, uint64_t))(v26 + 32))(v87, v107);
    sub_6108();
    sub_FE98();
    v109();
    BOOL v110 = (void *)sub_53DA0();
    os_log_type_t v111 = sub_53E90();
    if (sub_FF7C(v111))
    {
      uint64_t v112 = (_WORD *)sub_61F0();
      sub_61CC(v112);
      sub_FED0(&dword_0, v113, v114, "EmergencyOfferCallFlow onInput .directInvocation");
      sub_60F0();
    }

    uint64_t v115 = v60 + 8;
    v83(v195, v58);
    if (sub_535D0() == 0xD000000000000035 && v116 == 0x8000000000057B10)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v148 = sub_53FE0();
      swift_bridgeObjectRelease();
      if ((v148 & 1) == 0)
      {
LABEL_28:
        uint64_t v203 = v115;
        uint64_t v204 = (uint64_t (**)(uint64_t, uint64_t))v83;
        sub_6108();
        sub_FE98();
        v150();
        uint64_t v151 = *(void (**)(uint64_t))(v26 + 16);
        uint64_t v152 = v187;
        uint64_t v153 = sub_1B830();
        uint64_t v154 = v108;
        v151(v153);
        uint64_t v155 = sub_53DA0();
        os_log_type_t v156 = sub_53EA0();
        if (os_log_type_enabled(v155, v156))
        {
          uint64_t v157 = (_DWORD *)sub_1001C();
          uint64_t v158 = sub_15284();
          uint64_t v193 = v58;
          uint64_t v206 = v158;
          v211[0] = v158;
          *uint64_t v157 = 136315138;
          uint64_t v205 = v157 + 1;
          ((void (*)(uint64_t, uint64_t, uint64_t))v151)(v183, v152, v154);
          uint64_t v159 = sub_53E10();
          uint64_t v209 = sub_50F10(v159, v160, v211);
          sub_53EF0();
          swift_bridgeObjectRelease();
          uint64_t v161 = *(void (**)(void))(v26 + 8);
          sub_1B668();
          v161();
          sub_FEF0(&dword_0, v162, v163, "Failed to get emergencySituation from DirectInvocation: %s");
          swift_arrayDestroy();
          sub_60F0();
          sub_60F0();

          sub_15450();
          v164();
          sub_1B668();
          v161();
        }
        else
        {

          char v178 = *(void (**)(void))(v26 + 8);
          sub_1B668();
          v178();
          sub_15450();
          v179();
          sub_1B668();
          v178();
        }
        goto LABEL_40;
      }
    }
    __int16 v149 = sub_2C188();
    if (v149 != 35)
    {
      LOWORD(v131) = v149;
      (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v87, v108);
      LOBYTE(v101) = 4;
LABEL_33:
      uint64_t v177 = v190;
      *(unsigned char *)(v190 + 218) = 0;
      *(_WORD *)(v177 + 216) = v101 | (unsigned __int16)((_WORD)v131 << 8);
      goto LABEL_40;
    }
    goto LABEL_28;
  }
  if (v86 == enum case for Parse.uso(_:))
  {
    uint64_t v117 = sub_1B650();
    v118(v117);
    sub_1B888();
    v119();
    sub_6108();
    uint64_t v120 = sub_1B678((uint64_t)&v212);
    ((void (*)(uint64_t))v85)(v120);
    uint64_t v121 = (void *)sub_53DA0();
    os_log_type_t v122 = sub_53E90();
    if (sub_FF7C(v122))
    {
      uint64_t v123 = (_WORD *)sub_61F0();
      sub_61CC(v123);
      sub_FED0(&dword_0, v124, v125, "#EmergencyOfferCallFlow onInput .uso");
      sub_60F0();
    }

    uint64_t v126 = sub_1B6F0();
    ((void (*)(uint64_t))v83)(v126);
    sub_53610();
    v208[3] = (uint64_t)&type metadata for EmergencyFeatureFlagsKey;
    v208[4] = sub_F998();
    LOBYTE(v208[0]) = 2;
    sub_53640();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v208);
    uint64_t v127 = v185;
    sub_53CC0();
    sub_1B520(v127, v184, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
    sub_24844();
    unsigned int v101 = v128;
    sub_1B580(v127, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
    uint64_t v129 = sub_1B830();
    v130(v129);
    goto LABEL_18;
  }
  sub_6108();
  uint64_t v165 = v188;
  sub_FE98();
  v166();
  v167 = sub_53DA0();
  os_log_type_t v168 = sub_53EA0();
  if (os_log_type_enabled(v167, v168))
  {
    os_log_type_t v169 = (_DWORD *)sub_1001C();
    uint64_t v170 = sub_15284();
    uint64_t v193 = v58;
    uint64_t v210 = v170;
    *os_log_type_t v169 = 136315138;
    LOBYTE(v211[0]) = 0;
    uint64_t v171 = sub_53E10();
    v211[0] = sub_50F10(v171, v172, &v210);
    uint64_t v85 = (void (*)(void))v202;
    uint64_t v84 = v203;
    sub_53EF0();
    swift_bridgeObjectRelease();
    sub_FEF0(&dword_0, v173, v174, "%s");
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();

    uint64_t v175 = v188;
    uint64_t v176 = v193;
  }
  else
  {

    uint64_t v175 = v165;
    uint64_t v176 = v58;
  }
  v83(v175, v176);
  v204[1](v84, (uint64_t)v85);
LABEL_40:
  sub_9638();
}

uint64_t sub_18908()
{
  sub_10010();
  v1[148] = v0;
  v1[147] = v2;
  uint64_t v3 = sub_53DB0();
  v1[149] = v3;
  v1[150] = *(void *)(v3 - 8);
  v1[151] = swift_task_alloc();
  v1[152] = swift_task_alloc();
  v1[153] = swift_task_alloc();
  v1[154] = swift_task_alloc();
  return _swift_task_switch(sub_189F0, 0, 0);
}

uint64_t sub_189F0()
{
  uint64_t v1 = *(void *)(v0 + 1232);
  uint64_t v2 = *(void *)(v0 + 1200);
  *(void *)(v0 + 1240) = sub_53D90();
  sub_6108();
  uint64_t v3 = *(void (**)(void))(v2 + 16);
  *(void *)(v0 + 1248) = v3;
  *(void *)(v0 + 1256) = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  sub_1B83C();
  v3();
  os_log_type_t v4 = sub_53DA0();
  os_log_type_t v5 = sub_53E90();
  if (sub_1B708(v5))
  {
    uint64_t v6 = (uint8_t *)sub_61F0();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_0, v4, (os_log_type_t)v1, "#EmergencyOfferCallFlow execute", v6, 2u);
    sub_60F0();
  }
  uint64_t v7 = *(void *)(v0 + 1200);
  uint64_t v8 = *(void *)(v0 + 1184);

  uint64_t v9 = *(void (**)(void))(v7 + 8);
  *(void *)(v0 + 1264) = v9;
  *(void *)(v0 + 1272) = (v7 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  sub_1B758();
  v9();
  int v10 = *(unsigned __int8 *)(v8 + 218);
  if (v10 == 2)
  {
    uint64_t v11 = *(void *)(v0 + 1184);
    uint64_t v12 = *(void *)(v0 + 1176);
    sub_F824();
    uint64_t v13 = swift_allocError();
    *uint64_t v14 = 2;
    sub_2940(v13, v11 + 16, (void *)(v11 + 56), v12);
    swift_errorRelease();
    goto LABEL_20;
  }
  if (v10 == 3)
  {
    sub_53460();
LABEL_20:
    sub_1B8B0();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
    return v26();
  }
  __int16 v15 = *(_WORD *)(v8 + 216);
  if (HIBYTE(v15) == 35 && v15 == 4)
  {
LABEL_17:
    sub_6108();
    sub_1B83C();
    v3();
    uint64_t v21 = sub_53DA0();
    os_log_type_t v22 = sub_53EA0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)sub_61F0();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_0, v21, v22, "#EmergencyOfferCallFlow Intent missing a situation or valid organization", v23, 2u);
      sub_60F0();
    }
    uint64_t v24 = *(void *)(v0 + 1184);

    sub_1B758();
    v9();
    uint64_t v25 = sub_2C00((void *)(v24 + 56), *(void *)(v24 + 80));
    memcpy((void *)(v0 + 768), v25, 0x70uLL);
    sub_2C44(v24 + 16, (const void *)(v0 + 768));
    sub_53450();
    swift_release();
    goto LABEL_20;
  }
  uint64_t v16 = v0 + 960;
  sub_9370();
  if (!*(void *)(v0 + 984))
  {
    uint64_t v20 = (uint64_t *)&unk_6CB20;
LABEL_16:
    sub_14A94(v16, v20);
    goto LABEL_17;
  }
  uint64_t v16 = v0 + 1040;
  sub_5F28((long long *)(v0 + 960), v0 + 880);
  sub_9160();
  if (!*(void *)(v0 + 1064))
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 880);
    uint64_t v20 = (uint64_t *)&unk_6CB28;
    goto LABEL_16;
  }
  uint64_t v17 = *(void *)(v0 + 1184);
  sub_5F28((long long *)(v0 + 1040), v0 + 1000);
  os_log_type_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 1280) = v18;
  *os_log_type_t v18 = v0;
  v18[1] = sub_18DE8;
  return sub_167DC(v0 + 272, v17 + 136, SHIBYTE(v15), v15);
}

uint64_t sub_18DE8()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  return _swift_task_switch(sub_18EB4, 0, 0);
}

uint64_t sub_18EB4()
{
  uint64_t v33 = v0;
  uint64_t v1 = v0 + 110;
  uint64_t v2 = (uint64_t)(v0 + 125);
  sub_1B3C0((uint64_t)(v0 + 34), (uint64_t)(v0 + 66), &qword_6C3B0);
  if (sub_F27C((uint64_t)(v0 + 66)) == 1)
  {
    sub_2C00((void *)(v0[148] + 176), *(void *)(v0[148] + 200));
    sub_1A7E8();
    goto LABEL_17;
  }
  uint64_t v3 = v0[148];
  memcpy(v0 + 2, v0 + 66, 0x80uLL);
  memcpy(__dst, v0 + 66, sizeof(__dst));
  sub_2C00((void *)(v3 + 16), *(void *)(v3 + 40));
  sub_1B764();
  v4();
  sub_2C00(v0 + 115, v0[118]);
  char v5 = sub_53310();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v0 + 115));
  if ((v5 & 1) == 0)
  {
    if (sub_53C60())
    {
      sub_2C00((void *)(v0[148] + 176), *(void *)(v0[148] + 200));
      sub_19700();
    }
    else if (sub_53C70())
    {
      sub_2C00((void *)(v0[148] + 176), *(void *)(v0[148] + 200));
      sub_19F88();
    }
    else
    {
      unint64_t v18 = v0[15];
      if ((v18 & 0x2000000000000000) != 0) {
        uint64_t v19 = HIBYTE(v18) & 0xF;
      }
      else {
        uint64_t v19 = v0[14] & 0xFFFFFFFFFFFFLL;
      }
      if (!v19)
      {
        os_log_type_t v22 = (void (*)(uint64_t))v0[156];
        sub_1B41C(v0 + 34, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_F780);
        sub_6108();
        uint64_t v23 = sub_1B830();
        v22(v23);
        uint64_t v24 = sub_53DA0();
        os_log_type_t v25 = sub_53EA0();
        if (os_log_type_enabled(v24, v25))
        {
          uint64_t v26 = (uint8_t *)sub_61F0();
          *(_WORD *)uint64_t v26 = 0;
          _os_log_impl(&dword_0, v24, v25, "#EmergencyOfferCallFlow OrgInfo had no usable info", v26, 2u);
          sub_60F0();
        }
        uint64_t v27 = (void (*)(uint64_t, uint64_t))v0[158];
        uint64_t v28 = v0[152];
        uint64_t v29 = v0[149];
        uint64_t v30 = v0[148];

        v27(v28, v29);
        uint64_t v31 = sub_2C00((void *)(v30 + 56), *(void *)(v30 + 80));
        memcpy(v0 + 82, v31, 0x70uLL);
        sub_2C44(v3 + 16, v0 + 82);
        uint64_t v2 = (uint64_t)(v0 + 125);
        uint64_t v1 = v0 + 110;
        goto LABEL_17;
      }
      sub_2C00((void *)(v0[148] + 176), *(void *)(v0[148] + 200));
      memcpy(v0 + 50, __dst, 0x80uLL);
      nullsub_1(v0 + 50);
      sub_1B3C0((uint64_t)(v0 + 50), (uint64_t)(v0 + 18), &qword_6C3B0);
      sub_1A7E8();
    }
    sub_1B41C(v0 + 34, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_F780);
LABEL_17:
    sub_53450();
    swift_release();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v2);
    uint64_t v17 = (uint64_t)v1;
    goto LABEL_18;
  }
  uint64_t v6 = (void (*)(uint64_t, uint64_t, uint64_t))v0[156];
  uint64_t v7 = v0[155];
  uint64_t v8 = v0[153];
  uint64_t v9 = v0[149];
  sub_6108();
  v6(v8, v7, v9);
  int v10 = sub_53DA0();
  os_log_type_t v11 = sub_53EA0();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)sub_61F0();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_0, v10, v11, "#EmergencyOfferCallFlow Calling disabled on this device. Not offering a call", v12, 2u);
    sub_60F0();
  }
  uint64_t v13 = (void (*)(uint64_t, uint64_t))v0[158];
  uint64_t v14 = v0[153];
  uint64_t v15 = v0[149];
  uint64_t v16 = v0[148];

  v13(v14, v15);
  sub_2C00((void *)(v16 + 176), *(void *)(v16 + 200));
  sub_1B13C();
  sub_1B41C(v0 + 34, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_F780);
  sub_53450();
  swift_release();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v0 + 125));
  uint64_t v17 = (uint64_t)(v0 + 110);
LABEL_18:
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v17);
  sub_1B8B0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_19378()
{
  type metadata accessor for EmergencyOfferCallFlow();
  sub_1B5D4(&qword_6CB18, v0, (void (*)(uint64_t))type metadata accessor for EmergencyOfferCallFlow);
  return sub_531E0();
}

uint64_t sub_19404()
{
  sub_D850();

  return _swift_deallocClassInstance(v0, 219, 7);
}

uint64_t type metadata accessor for EmergencyOfferCallFlow()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for EmergencyOfferCallFlow.EmergencyOfferCallFlowState(uint64_t result, __int16 *a2)
{
  __int16 v2 = *a2;
  *(unsigned char *)(result + 2) = *((unsigned char *)a2 + 2);
  *(_WORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for EmergencyOfferCallFlow.EmergencyOfferCallFlowState(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD)
  {
    int v2 = (a2 + 16776963) >> 24 == 255 ? 2 : 1;
    int v3 = (a2 + 16776963) >> 24 ? v2 : 0;
    if (v3)
    {
      if (v3 == 2)
      {
        int v4 = *(unsigned __int16 *)((char *)a1 + 3);
        if (*(unsigned __int16 *)((char *)a1 + 3)) {
          return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v4 << 24)) - 16776963;
        }
      }
      else
      {
        int v4 = *((unsigned __int8 *)a1 + 3);
        if (*((unsigned char *)a1 + 3)) {
          return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v4 << 24)) - 16776963;
        }
      }
    }
  }
  unsigned int v6 = *((unsigned __int8 *)a1 + 2);
  if (v6 < 2) {
    return 0;
  }
  unsigned int v7 = (v6 + 2147483646) & 0x7FFFFFFF;
  uint64_t result = v7 - 1;
  if (v7 <= 1) {
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for EmergencyOfferCallFlow.EmergencyOfferCallFlowState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if ((a3 + 16776963) >> 24 == 255) {
    int v3 = 2;
  }
  else {
    int v3 = 1;
  }
  if ((a3 + 16776963) >> 24) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }
  if (a3 < 0xFD) {
    int v4 = 0;
  }
  if (a2 > 0xFC)
  {
    *(_WORD *)uint64_t result = a2 - 253;
    *(unsigned char *)(result + 2) = (a2 - 253) >> 16;
    if (v4)
    {
      unsigned int v5 = ((a2 - 253) >> 24) + 1;
      if (v4 == 2) {
        *(_WORD *)(result + 3) = v5;
      }
      else {
        *(unsigned char *)(result + 3) = v5;
      }
    }
  }
  else
  {
    if (!v4) {
      goto LABEL_13;
    }
    if (v4 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_13:
      if (!a2) {
        return result;
      }
LABEL_19:
      *(unsigned char *)(result + 2) = a2 + 3;
      return result;
    }
    *(unsigned char *)(result + 3) = 0;
    if (a2) {
      goto LABEL_19;
    }
  }
  return result;
}

uint64_t sub_1958C(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 2);
  BOOL v2 = v1 >= 2;
  int v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2) {
    return (v3 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_195A8(uint64_t result, unsigned int a2)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)uint64_t result = a2 - 255;
    unsigned int v2 = (a2 - 255) >> 16;
  }
  else
  {
    if (!a2) {
      return result;
    }
    LOBYTE(v2) = a2 + 1;
  }
  *(unsigned char *)(result + 2) = v2;
  return result;
}

ValueMetadata *type metadata accessor for EmergencyOfferCallFlow.EmergencyOfferCallFlowState()
{
  return &type metadata for EmergencyOfferCallFlow.EmergencyOfferCallFlowState;
}

#error "195F4: call analysis failed (funcsize=10)"

uint64_t sub_19608()
{
  return sub_19378();
}

uint64_t sub_1962C()
{
  unsigned int v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unsigned int v1 = v0;
  v1[1] = sub_DD40;
  return sub_18908();
}

uint64_t sub_196C8()
{
  type metadata accessor for EmergencyOfferCallFlow();

  return sub_53230();
}

void sub_19700()
{
  sub_15308();
  unsigned int v2 = v0;
  uint64_t v4 = (uint64_t)v3;
  memcpy(v86, v3, sizeof(v86));
  uint64_t v71 = type metadata accessor for ConfirmationFlowConfigModel();
  sub_6188();
  __chkstk_darwin(v5);
  sub_1B698(v6, v69[0]);
  uint64_t v8 = __chkstk_darwin(v7);
  v69[1] = sub_1B770(v8, v9, v10, v11, v12, v13, v14, v15, v69[0]);
  sub_6188();
  __chkstk_darwin(v16);
  sub_6150();
  uint64_t v70 = v17;
  uint64_t v18 = sub_2E18(&qword_6BCB8);
  uint64_t v19 = sub_FEC4(v18);
  __chkstk_darwin(v19);
  sub_6150();
  uint64_t v74 = v20;
  uint64_t v21 = sub_2E18(&qword_6BCA8);
  uint64_t v22 = sub_FEC4(v21);
  __chkstk_darwin(v22);
  sub_612C();
  v69[0] = v23;
  __chkstk_darwin(v24);
  sub_152E8();
  uint64_t v75 = v25;
  uint64_t v26 = sub_53DB0();
  sub_60C0();
  uint64_t v28 = v27;
  uint64_t v30 = __chkstk_darwin(v29);
  uint64_t v32 = (char *)v69 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  uint64_t v34 = (char *)v69 - v33;
  uint64_t v78 = sub_53AD0();
  sub_60C0();
  uint64_t v76 = v35;
  __chkstk_darwin(v36);
  sub_1B7C4();
  swift_bridgeObjectRetain();
  uint64_t v77 = v1;
  sub_1B850();
  sub_53A10();
  swift_allocObject();
  sub_53A00();
  uint64_t v79 = (const void *)v4;
  sub_539F0();
  swift_release();
  uint64_t v37 = sub_539E0();
  swift_release();
  sub_2C00(v2, v2[3]);
  sub_1B764();
  v38();
  char v39 = sub_43838(v85);
  sub_53D90();
  if (v39)
  {
    uint64_t v70 = v37;
    sub_6108();
    sub_1B81C();
    v40();
    uint64_t v41 = sub_53DA0();
    os_log_type_t v42 = sub_53E90();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)sub_61F0();
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl(&dword_0, v41, v42, "#EmergencyOfferCallFlow Resource is available. Confirm before calling.", v43, 2u);
      sub_60F0();
    }

    (*(void (**)(char *, uint64_t))(v28 + 8))(v32, v26);
    sub_3048((uint64_t)v2, (uint64_t)v83);
    sub_3048((uint64_t)(v2 + 5), (uint64_t)&v83[40]);
    memcpy(v84, v86, 0x80uLL);
    sub_1B3B8((uint64_t)v84);
    sub_F87C((uint64_t)v84, (uint64_t)&v83[80]);
    sub_5D2C((uint64_t)v79);
    sub_F8D8();
    uint64_t v44 = sub_531D0();
    sub_F924((uint64_t)v83);
    sub_2C00(v2 + 5, v2[8]);
    sub_1B87C();
    uint64_t v45 = v74;
    uint64_t v46 = v78;
    sub_FE98();
    v47();
    sub_34DC(v45, 0, 1, v46);
    swift_retain();
    uint64_t v48 = v75;
    sub_25A64(v45);
    swift_release();
    sub_14A94(v45, &qword_6BCB8);
    sub_2C00(v2 + 5, v2[8]);
    uint64_t v49 = (int *)v71;
    uint64_t v50 = v73;
    swift_retain();
    sub_25C54();
    swift_release();
    sub_1B3C0(v48, v50, &qword_6BCA8);
    *(void *)(v50 + v49[6]) = v44;
    *(void *)(v50 + v49[7]) = 2;
    *(unsigned char *)(v50 + v49[8]) = 0;
    *(unsigned char *)(v50 + v49[9]) = 1;
    sub_3048((uint64_t)v2, (uint64_t)v82);
    sub_3048((uint64_t)(v2 + 5), (uint64_t)v81);
    sub_5920((uint64_t)(v2 + 10), (uint64_t)v80);
    sub_597C((uint64_t)v81, v81[3]);
    sub_60C0();
    __chkstk_darwin(v51);
    sub_1B7AC();
    (*(void (**)(void *))(v52 + 16))(v2 + 5);
    sub_1B520(v50, v72, (void (*)(void))type metadata accessor for ConfirmationFlowConfigModel);
    memcpy(v83, v2 + 5, 0x70uLL);
    uint64_t v53 = v79;
    sub_5D2C((uint64_t)v79);
    swift_retain();
    uint64_t v55 = sub_1B7FC(v53, v54, v82, v83, (uint64_t)v80);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v81);
    *(void *)&v82[0] = v55;
    type metadata accessor for EmergencyConfirmationFlow();
    sub_1B5D4(&qword_6BE80, 255, (void (*)(uint64_t))type metadata accessor for EmergencyConfirmationFlow);
    sub_531D0();
    swift_release();
    swift_release();
    swift_release();
    sub_1B580(v50, (void (*)(void))type metadata accessor for ConfirmationFlowConfigModel);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v85);
    sub_1B758();
    v56();
  }
  else
  {
    sub_6108();
    sub_1B81C();
    v57();
    uint64_t v58 = sub_53DA0();
    os_log_type_t v59 = sub_53E90();
    if (os_log_type_enabled(v58, v59))
    {
      uint64_t v60 = (uint8_t *)sub_61F0();
      *(_WORD *)uint64_t v60 = 0;
      _os_log_impl(&dword_0, v58, v59, "#EmergencyOfferCallFlow Request made on device that doesn't support calling. Give supportive dialog.", v60, 2u);
      sub_60F0();
    }

    (*(void (**)(char *, uint64_t))(v28 + 8))(v34, v26);
    sub_2C00(v2 + 5, v2[8]);
    uint64_t v61 = v76;
    uint64_t v62 = v77;
    uint64_t v63 = v74;
    uint64_t v64 = v78;
    sub_FE98();
    v65();
    sub_34DC(v63, 0, 1, v64);
    swift_retain();
    swift_retain();
    char v66 = sub_43838(v85);
    uint64_t v67 = v75;
    sub_25878(v63, v37, v66 & 1);
    swift_release();
    swift_release();
    sub_14A94(v63, &qword_6BCB8);
    sub_2FE0(v67, v69[0]);
    sub_3048((uint64_t)v2, (uint64_t)v83);
    sub_53C50();
    uint64_t v68 = v70;
    sub_53B40();
    sub_1B5D4((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
    sub_531D0();
    swift_release();
    sub_1B580(v68, (void (*)(void))&type metadata accessor for OutputFlow);
    sub_14A94(v67, &qword_6BCA8);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v85);
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v62, v64);
  }
  sub_9638();
}

void sub_19F88()
{
  sub_15308();
  unsigned int v2 = v1;
  uint64_t v4 = v3;
  uint64_t v75 = sub_53B90();
  sub_6188();
  __chkstk_darwin(v5);
  sub_6150();
  uint64_t v74 = v6;
  uint64_t v7 = sub_2E18((uint64_t *)&unk_6DA80);
  uint64_t v8 = sub_FEC4(v7);
  __chkstk_darwin(v8);
  sub_6150();
  sub_FE14(v9);
  uint64_t v78 = sub_53030();
  sub_60C0();
  uint64_t v73 = v10;
  __chkstk_darwin(v11);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v12);
  sub_152E8();
  sub_FE14(v13);
  uint64_t v80 = sub_53B50();
  sub_6188();
  __chkstk_darwin(v14);
  sub_6150();
  sub_FE14(v15);
  uint64_t v83 = sub_53DB0();
  sub_60C0();
  uint64_t v82 = v16;
  __chkstk_darwin(v17);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v18);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v19);
  sub_152E8();
  uint64_t v86 = v20;
  uint64_t v21 = sub_2E18(&qword_6BCB8);
  uint64_t v22 = sub_FEC4(v21);
  __chkstk_darwin(v22);
  sub_6140();
  uint64_t v25 = v24 - v23;
  uint64_t v26 = sub_2E18(&qword_6BCA8);
  uint64_t v27 = sub_FEC4(v26);
  __chkstk_darwin(v27);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v28);
  uint64_t v30 = (char *)&v72 - v29;
  uint64_t v31 = sub_53AD0();
  sub_60C0();
  __chkstk_darwin(v32);
  sub_1B7AC();
  uint64_t v33 = v0[3];
  uint64_t v85 = v0;
  sub_2C00(v0, v33);
  sub_1B724();
  sub_1B764();
  v34();
  uint64_t v84 = v4;
  swift_bridgeObjectRetain();
  sub_1B850();
  uint64_t v35 = v2[3];
  uint64_t v36 = v2[4];
  sub_2C00(v2, v35);
  sub_FE98();
  v37();
  sub_34DC(v25, 0, 1, v31);
  char v38 = sub_43838(v91);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v36 + 16))(v25, v38 & 1, v35, v36);
  sub_14A94(v25, &qword_6BCB8);
  sub_1B62C(v91);
  LOBYTE(v25) = sub_533A0();
  sub_3048((uint64_t)v91, (uint64_t)v90);
  if (v25)
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v90);
    sub_3048((uint64_t)v91, (uint64_t)v89);
LABEL_4:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v89);
    sub_3048((uint64_t)v91, (uint64_t)v88);
    sub_1B6D4();
LABEL_5:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v88);
    goto LABEL_6;
  }
  sub_1B62C(v90);
  char v39 = sub_53390();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v90);
  sub_3048((uint64_t)v91, (uint64_t)v89);
  if (v39) {
    goto LABEL_4;
  }
  sub_1B62C(v89);
  char v49 = sub_53380();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v89);
  sub_3048((uint64_t)v91, (uint64_t)v88);
  sub_1B6D4();
  if (v49) {
    goto LABEL_5;
  }
  sub_1B62C(v88);
  char v50 = sub_53370();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v88);
  if (v50)
  {
LABEL_6:
    sub_53D90();
    sub_6108();
    sub_1B87C();
    sub_FE98();
    v40();
    uint64_t v41 = (void *)sub_53DA0();
    os_log_type_t v42 = sub_53E90();
    if (sub_FF7C(v42))
    {
      uint64_t v43 = (_WORD *)sub_61F0();
      sub_61CC(v43);
      sub_FED0(&dword_0, v44, v45, "#EmergencyOfferCallFlow Only website resource available on HomePod, ATV, Car, or Watch, offering call.");
      sub_60F0();
    }
LABEL_8:

    sub_1B758();
    v46();
    sub_2FE0((uint64_t)v30, v79);
    sub_3048((uint64_t)v85, (uint64_t)v87);
    sub_53C50();
    uint64_t v47 = v81;
    sub_53B40();
    sub_1B5D4((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
    sub_531D0();
    sub_1B580(v47, (void (*)(void))&type metadata accessor for OutputFlow);
    goto LABEL_9;
  }
  uint64_t v51 = v76;
  sub_53C40();
  uint64_t v52 = v78;
  if (sub_5800(v51, 1, v78) == 1)
  {
    sub_14A94(v51, (uint64_t *)&unk_6DA80);
    sub_53D90();
    sub_6108();
    sub_1B87C();
    sub_FE98();
    v53();
    uint64_t v41 = (void *)sub_53DA0();
    os_log_type_t v54 = sub_53E90();
    if (sub_FF7C(v54))
    {
      uint64_t v55 = (_WORD *)sub_61F0();
      sub_61CC(v55);
      sub_FED0(&dword_0, v56, v57, "#EmergencyOfferCallFlow Missing website resource. Offer supportive dialog.");
      sub_60F0();
    }
    goto LABEL_8;
  }
  uint64_t v58 = v73;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v73 + 32))(v77, v51, v52);
  sub_53D90();
  sub_6108();
  sub_1B87C();
  sub_FE98();
  v59();
  uint64_t v60 = (void *)sub_53DA0();
  os_log_type_t v61 = sub_53E90();
  if (sub_FF7C(v61))
  {
    uint64_t v62 = (_WORD *)sub_61F0();
    sub_61CC(v62);
    sub_FED0(&dword_0, v63, v64, "#EmergencyOfferCallFlow Only website resource available, launching website.");
    sub_60F0();
  }

  sub_1B758();
  v65();
  uint64_t v66 = v85[3];
  uint64_t v67 = v85[4];
  sub_2C00(v85, v66);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v67 + 16))(v87, v66, v67);
  uint64_t v68 = v77;
  uint64_t v69 = v78;
  sub_FE98();
  v70();
  uint64_t v71 = v74;
  sub_53B80();
  sub_1B5D4(&qword_6CB30, 255, (void (*)(uint64_t))&type metadata accessor for AppPunchOutFlow);
  sub_531D0();
  sub_1B580(v71, (void (*)(void))&type metadata accessor for AppPunchOutFlow);
  (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v68, v69);
LABEL_9:
  sub_14A94((uint64_t)v30, &qword_6BCA8);
  sub_1B748();
  v48();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v91);
  sub_9638();
}

void sub_1A7E8()
{
  sub_15308();
  uint64_t v3 = (uint64_t)v0;
  unint64_t v91 = (unint64_t)v4;
  uint64_t v94 = v5;
  uint64_t v84 = type metadata accessor for ConfirmationFlowConfigModel();
  sub_6188();
  __chkstk_darwin(v6);
  sub_1B698(v7, v83[0]);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v90 = sub_1B770(v9, v10, v11, v12, v13, v14, v15, v16, v83[0]);
  sub_6188();
  __chkstk_darwin(v17);
  sub_6150();
  uint64_t v92 = v18;
  sub_53DB0();
  sub_60C0();
  uint64_t v88 = v20;
  uint64_t v89 = v19;
  __chkstk_darwin(v19);
  sub_1B6B8();
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)v83 - v22;
  uint64_t v24 = sub_2E18(&qword_6BCB8);
  uint64_t v25 = sub_FEC4(v24);
  __chkstk_darwin(v25);
  sub_1B794();
  uint64_t v26 = sub_2E18(&qword_6BCA8);
  uint64_t v27 = sub_FEC4(v26);
  uint64_t v28 = __chkstk_darwin(v27);
  uint64_t v30 = (char *)v83 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __chkstk_darwin(v28);
  uint64_t v33 = (char *)v83 - v32;
  __chkstk_darwin(v31);
  sub_152E8();
  uint64_t v93 = v34;
  sub_2C00(v0, v0[3]);
  sub_1B764();
  v35();
  uint64_t v36 = v94;
  sub_1B3C0((uint64_t)v94, (uint64_t)v101, &qword_6C3B0);
  if (sub_F27C((uint64_t)v101) == 1)
  {
    sub_2C00((void *)v91, *(void *)(v91 + 24));
    uint64_t v37 = sub_53AD0();
    sub_34DC(v1, 1, 1, v37);
    uint64_t v38 = sub_1B730();
    v39(v38);
    sub_14A94(v1, &qword_6BCB8);
    sub_2FE0((uint64_t)v33, (uint64_t)v30);
    sub_3048(v3, (uint64_t)v102);
    uint64_t v40 = v92;
    sub_53B40();
    sub_1B5D4((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
    sub_531D0();
    sub_1B580(v40, (void (*)(void))&type metadata accessor for OutputFlow);
    uint64_t v41 = (uint64_t)v33;
    goto LABEL_11;
  }
  v83[1] = (uint64_t)v2;
  v83[2] = (uint64_t)v23;
  uint64_t v87 = v33;
  memcpy(v102, v101, sizeof(v102));
  uint64_t v42 = *(void *)(v91 + 32);
  sub_2C00((void *)v91, *(void *)(v91 + 24));
  uint64_t v43 = v102[12];
  uint64_t v44 = (void *)v102[13];
  sub_1B41C(v36, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_170DC);
  swift_bridgeObjectRetain();
  sub_1B850();
  uint64_t v45 = sub_53AD0();
  sub_34DC(v1, 0, 1, v45);
  uint64_t v46 = sub_1B730();
  v47(v46);
  sub_14A94(v1, &qword_6BCB8);
  sub_2C00(v100, v100[3]);
  sub_1B724();
  char v48 = sub_533A0();
  sub_3048((uint64_t)v100, (uint64_t)v103);
  if (v48)
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v103);
    sub_3048((uint64_t)v100, (uint64_t)&v98);
    sub_1B89C();
LABEL_6:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)&v98);
    sub_3048((uint64_t)v100, (uint64_t)v96);
LABEL_7:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v96);
LABEL_8:
    sub_53D90();
    sub_6108();
    sub_FE98();
    v50();
    uint64_t v51 = (void *)sub_53DA0();
    os_log_type_t v52 = sub_53E90();
    if (sub_1B708(v52))
    {
      *(_WORD *)sub_61F0() = 0;
      sub_1B7DC(&dword_0, v53, v54, "#EmergencyOfferCallFlow No resource available on HomePod, ATV, Car, or Watch, offering call or websearch.");
      sub_60F0();
    }

    sub_1B748();
    v55();
    uint64_t v56 = v93;
    uint64_t v57 = sub_1B724();
    sub_2FE0(v57, v58);
    sub_3048((uint64_t)v2, (uint64_t)v103);
    sub_53C50();
    sub_1B41C(v94, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_F780);
    sub_53B40();
    sub_1B5D4((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
    sub_531D0();
    sub_1B580(v42, (void (*)(void))&type metadata accessor for OutputFlow);
    uint64_t v41 = v56;
    goto LABEL_11;
  }
  unint64_t v91 = (unint64_t)v44;
  sub_2C00(v103, v103[3]);
  sub_1B724();
  char v49 = sub_53390();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v103);
  sub_3048((uint64_t)v100, (uint64_t)&v98);
  sub_1B89C();
  if (v49) {
    goto LABEL_6;
  }
  sub_2C00(&v98, v99);
  sub_1B8D0();
  char v59 = sub_53380();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)&v98);
  sub_3048((uint64_t)v100, (uint64_t)v96);
  if (v59) {
    goto LABEL_7;
  }
  sub_2C00(v96, v97);
  sub_1B8D0();
  char v60 = sub_53370();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v96);
  if (v60) {
    goto LABEL_8;
  }
  unint64_t v61 = HIBYTE(v91) & 0xF;
  if ((v91 & 0x2000000000000000) == 0) {
    unint64_t v61 = v43 & 0xFFFFFFFFFFFFLL;
  }
  if (!v61) {
    goto LABEL_8;
  }
  sub_53D90();
  sub_6108();
  sub_FE98();
  v62();
  uint64_t v63 = (void *)sub_53DA0();
  os_log_type_t v64 = sub_53E90();
  if (sub_1B708(v64))
  {
    *(_WORD *)sub_61F0() = 0;
    sub_1B7DC(&dword_0, v65, v66, "#EmergencyOfferCallFlow No resource available, offering punchout web search");
    sub_60F0();
  }

  sub_1B748();
  v67();
  uint64_t v68 = v2[4];
  sub_2C00(v2, v2[3]);
  uint64_t v69 = *(void (**)(uint64_t))(v68 + 16);
  unint64_t v70 = v91;
  swift_bridgeObjectRetain();
  uint64_t v71 = sub_1B724();
  v69(v71);
  v103[0] = v43;
  v103[1] = v70;
  sub_1B480();
  uint64_t v72 = sub_531D0();
  sub_1B4CC((uint64_t)v103);
  sub_2C00(v2 + 5, v2[8]);
  uint64_t v73 = (int *)v84;
  uint64_t v74 = v86;
  swift_retain();
  sub_25C74();
  swift_release();
  uint64_t v75 = v93;
  sub_2FE0(v93, v74);
  *(void *)(v74 + v73[6]) = v72;
  *(void *)(v74 + v73[7]) = 4;
  *(unsigned char *)(v74 + v73[8]) = 1;
  *(unsigned char *)(v74 + v73[9]) = 1;
  sub_3048((uint64_t)v2, (uint64_t)&v98);
  sub_3048((uint64_t)(v2 + 5), (uint64_t)v96);
  sub_5920((uint64_t)(v2 + 10), (uint64_t)v95);
  sub_597C((uint64_t)v96, v97);
  sub_60C0();
  __chkstk_darwin(v76);
  sub_6140();
  uint64_t v79 = (const void *)(v78 - v77);
  (*(void (**)(uint64_t))(v80 + 16))(v78 - v77);
  sub_1B520(v74, v85, (void (*)(void))type metadata accessor for ConfirmationFlowConfigModel);
  memcpy(v103, v79, 0x70uLL);
  swift_retain();
  uint64_t v82 = sub_1B7FC(v102, v81, &v98, v103, (uint64_t)v95);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v96);
  *(void *)&long long v98 = v82;
  type metadata accessor for EmergencyConfirmationFlow();
  sub_1B5D4(&qword_6BE80, 255, (void (*)(uint64_t))type metadata accessor for EmergencyConfirmationFlow);
  sub_531D0();
  swift_release();
  swift_release();
  sub_1B580(v74, (void (*)(void))type metadata accessor for ConfirmationFlowConfigModel);
  uint64_t v41 = v75;
LABEL_11:
  sub_14A94(v41, &qword_6BCA8);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v100);
  sub_9638();
}

void sub_1B13C()
{
  sub_15308();
  uint64_t v4 = v0;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  v21[2] = sub_53B50();
  sub_6188();
  __chkstk_darwin(v9);
  sub_1B794();
  uint64_t v10 = sub_2E18(&qword_6BCB8);
  uint64_t v11 = sub_FEC4(v10);
  __chkstk_darwin(v11);
  sub_1B7C4();
  uint64_t v12 = sub_2E18(&qword_6BCA8);
  uint64_t v13 = sub_FEC4(v12);
  __chkstk_darwin(v13);
  sub_1B6B8();
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)v21 - v15;
  uint64_t v17 = v6[3];
  uint64_t v18 = v6[4];
  v21[0] = sub_2C00(v6, v17);
  v21[1] = v8;
  swift_bridgeObjectRetain();
  sub_1B850();
  uint64_t v19 = sub_53AD0();
  sub_34DC(v3, 0, 1, v19);
  sub_2C00(v4, v4[3]);
  sub_1B764();
  v20();
  LOBYTE(v8) = sub_43838(v22);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v22);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 8))(v3, v8 & 1, v17, v18);
  sub_14A94(v3, &qword_6BCB8);
  sub_2FE0((uint64_t)v16, v2);
  sub_3048((uint64_t)v4, (uint64_t)v22);
  sub_53C50();
  sub_53B40();
  sub_1B5D4((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
  sub_531D0();
  sub_1B580(v1, (void (*)(void))&type metadata accessor for OutputFlow);
  sub_14A94((uint64_t)v16, &qword_6BCA8);
  sub_9638();
}

uint64_t sub_1B3B8(uint64_t result)
{
  *(unsigned char *)(result + 128) = 0;
  return result;
}

uint64_t sub_1B3C0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_2E18(a3);
  sub_6188();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

void *sub_1B41C(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  return a1;
}

unint64_t sub_1B480()
{
  unint64_t result = qword_6CB38;
  if (!qword_6CB38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6CB38);
  }
  return result;
}

uint64_t sub_1B4CC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1B520(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_6188();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_1B580(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_6188();
  sub_15450();
  v3();
  return a1;
}

uint64_t sub_1B5D4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

ValueMetadata *type metadata accessor for EmergencyOfferCallFlowFollowupProvider()
{
  return &type metadata for EmergencyOfferCallFlowFollowupProvider;
}

uint64_t sub_1B62C(void *a1)
{
  sub_2C00(a1, v1);
  return v1;
}

uint64_t sub_1B650()
{
  return v0;
}

uint64_t sub_1B678@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 - 256);
}

void sub_1B698(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 + 32) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_1B6F0()
{
  uint64_t result = *(void *)(v0 - 256);
  *(void *)(v2 - 224) = v1;
  return result;
}

BOOL sub_1B708(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_1B724()
{
  return v0;
}

uint64_t sub_1B730()
{
  return v0;
}

uint64_t sub_1B770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 + 40) = (char *)&a9 - v9;
  return sub_53B50();
}

void sub_1B7DC(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_1B7FC(const void *a1, uint64_t a2, long long *a3, const void *a4, uint64_t a5)
{
  return sub_51858(a1, v5, a3, a4, a5, 0, 0, 0);
}

uint64_t sub_1B830()
{
  return v0;
}

uint64_t sub_1B850()
{
  return sub_53AC0();
}

uint64_t sub_1B8B0()
{
  return swift_task_dealloc();
}

uint64_t sub_1B8D0()
{
  return v0;
}

uint64_t sub_1B8E4(uint64_t a1)
{
  uint64_t v126 = sub_535F0();
  sub_9120();
  uint64_t v129 = v2;
  __chkstk_darwin(v3);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v4);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v5);
  uint64_t v135 = (char *)&v115 - v6;
  uint64_t v128 = type metadata accessor for EmergencyNLIntent();
  sub_6188();
  __chkstk_darwin(v7);
  sub_6150();
  sub_FE14(v8);
  sub_53920();
  sub_9120();
  uint64_t v133 = v10;
  uint64_t v134 = v9;
  __chkstk_darwin(v9);
  sub_6150();
  uint64_t v140 = v11;
  uint64_t v12 = sub_53670();
  __chkstk_darwin(v12 - 8);
  sub_6150();
  sub_FE14(v13);
  uint64_t v122 = sub_53CD0();
  sub_6188();
  __chkstk_darwin(v14);
  sub_6150();
  sub_FE14(v15);
  uint64_t v120 = sub_53620();
  sub_9120();
  uint64_t v119 = v16;
  __chkstk_darwin(v17);
  sub_6150();
  sub_FE14(v18);
  sub_53600();
  sub_9120();
  uint64_t v136 = v20;
  uint64_t v137 = v19;
  __chkstk_darwin(v19);
  sub_6150();
  uint64_t v138 = v21;
  uint64_t v22 = sub_535B0();
  sub_9120();
  uint64_t v24 = v23;
  __chkstk_darwin(v25);
  uint64_t v27 = (char *)&v115 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_53DB0();
  sub_9120();
  uint64_t v30 = v29;
  __chkstk_darwin(v31);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v32);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v33);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v34);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v35);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v36);
  uint64_t v38 = (char *)&v115 - v37;
  uint64_t v39 = sub_53D90();
  sub_6108();
  uint64_t v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16);
  uint64_t v132 = v39;
  uint64_t v131 = v30 + 16;
  uint64_t v139 = v40;
  v40((uint64_t)v38, v39, v28);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v27, a1, v22);
  uint64_t v41 = sub_53DA0();
  os_log_type_t v42 = sub_53E90();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v117 = a1;
    uint64_t v43 = swift_slowAlloc();
    uint64_t v125 = v28;
    uint64_t v44 = (uint8_t *)v43;
    uint64_t v45 = swift_slowAlloc();
    uint64_t v116 = v30;
    v141[0] = v45;
    *(_DWORD *)uint64_t v44 = 136315138;
    uint64_t v115 = v44 + 4;
    sub_1D544(&qword_6C3D8, 255, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v46 = sub_53FD0();
    uint64_t v143 = sub_50F10(v46, v47, v141);
    sub_53EF0();
    swift_bridgeObjectRelease();
    sub_1D5F0();
    v48();
    _os_log_impl(&dword_0, v41, v42, "#OfflineFlow onInput: %s", v44, 0xCu);
    swift_arrayDestroy();
    sub_60F0();
    uint64_t v28 = v125;
    sub_60F0();

    uint64_t v49 = v116;
    uint64_t v50 = v116;
  }
  else
  {
    sub_1D5F0();
    v51();

    uint64_t v50 = v30;
    uint64_t v49 = v30;
  }
  os_log_type_t v52 = *(void (**)(void))(v50 + 8);
  sub_6120();
  v52();
  uint64_t v53 = v138;
  sub_535A0();
  int v54 = (*(uint64_t (**)(uint8_t *, uint64_t))(v136 + 88))(v53, v137);
  uint64_t v56 = v134;
  uint64_t v55 = v135;
  uint64_t v57 = v133;
  if (v54 == enum case for Parse.NLv3IntentOnly(_:))
  {
    uint64_t v58 = sub_1D5D8();
    v59(v58);
    (*(void (**)(uint64_t, uint8_t *, uint64_t))(v57 + 32))(v140, v53, v56);
    sub_1D5B4();
    uint64_t v60 = sub_1D58C((uint64_t)&v146);
    v61(v60);
    uint64_t v62 = (void *)sub_53DA0();
    os_log_type_t v63 = sub_53E90();
    if (sub_FF7C(v63))
    {
      os_log_type_t v64 = (_WORD *)sub_61F0();
      sub_61CC(v64);
      sub_FED0(&dword_0, v65, v66, "#OfflineFlow onInput .NLv3IntentOnly");
      sub_60F0();
    }

    sub_6120();
    v52();
    uint64_t v67 = v127;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 16))(v127, v140, v56);
    if (qword_6B908 != -1) {
      swift_once();
    }
    sub_1D544(&qword_6C0B0, 255, (void (*)(uint64_t))type metadata accessor for EmergencyNLIntent);
    sub_537F0();
    __int16 v68 = v143;
    if (qword_6B918 != -1) {
      swift_once();
    }
    sub_537F0();
    __int16 v69 = v143;
    sub_FA44(v67, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v140, v56);
    __int16 v70 = v68 | (v69 << 8);
    goto LABEL_29;
  }
  if (v54 == enum case for Parse.directInvocation(_:))
  {
    uint64_t v71 = sub_1D5D8();
    v72(v71);
    (*(void (**)(char *, uint8_t *, uint64_t))(v129 + 32))(v55, v53, v126);
    uint64_t v73 = v132;
    sub_6108();
    v139(v123, v73, v28);
    uint64_t v74 = (void *)sub_53DA0();
    os_log_type_t v75 = sub_53E90();
    if (sub_FF7C(v75))
    {
      uint64_t v76 = (_WORD *)sub_61F0();
      sub_61CC(v76);
      sub_FED0(&dword_0, v77, v78, "#OfflineFlow onInput .directInvocation");
      sub_60F0();
    }

    uint64_t v140 = v49 + 8;
    sub_6120();
    v52();
    if (sub_535D0() == 0xD000000000000035 && v79 == 0x8000000000057B10)
    {
      swift_bridgeObjectRelease();
      sub_1D600();
    }
    else
    {
      char v94 = sub_53FE0();
      swift_bridgeObjectRelease();
      sub_1D600();
      if ((v94 & 1) == 0)
      {
LABEL_24:
        sub_6108();
        v139(v49, v73, v28);
        uint64_t v96 = v129;
        uint64_t v97 = *(void (**)(unint64_t, char *, uint64_t))(v129 + 16);
        uint64_t v98 = v126;
        v97(0xD000000000000035, v55, v126);
        uint64_t v99 = sub_53DA0();
        os_log_type_t v100 = sub_53EA0();
        if (os_log_type_enabled(v99, v100))
        {
          uint64_t v125 = v28;
          unsigned int v101 = (uint8_t *)swift_slowAlloc();
          uint64_t v139 = (void (*)(uint64_t, uint64_t, uint64_t))swift_slowAlloc();
          uint64_t v144 = v139;
          *(_DWORD *)unsigned int v101 = 136315138;
          uint64_t v138 = v101 + 4;
          v97(v118, (char *)0xD000000000000035, v98);
          uint64_t v102 = sub_53E10();
          v142[1] = sub_50F10(v102, v103, (uint64_t *)&v144);
          sub_53EF0();
          swift_bridgeObjectRelease();
          uint64_t v104 = *(void (**)(void))(v129 + 8);
          sub_1D5F0();
          v104();
          _os_log_impl(&dword_0, v99, v100, "Failed to get emergencySituation from DirectInvocation: %s", v101, 0xCu);
          swift_arrayDestroy();
          sub_60F0();
          sub_60F0();

          sub_6120();
          v52();
          sub_1D5F0();
          v104();
        }
        else
        {

          uint64_t v114 = *(void (**)(unint64_t, uint64_t))(v96 + 8);
          v114(0xD000000000000035, v98);
          sub_6120();
          v52();
          v114((unint64_t)v55, v98);
        }
        return 0;
      }
    }
    unsigned __int8 v95 = sub_2C188();
    if (v95 != 35)
    {
      unsigned __int8 v112 = v95;
      (*(void (**)(char *, uint64_t))(v129 + 8))(v55, v126);
      __int16 v70 = v112 | 0x400;
LABEL_29:
      *(_WORD *)(v130 + 176) = v70;
      return 1;
    }
    goto LABEL_24;
  }
  if (v54 == enum case for Parse.uso(_:))
  {
    uint64_t v80 = sub_1D5D8();
    v81(v80);
    uint64_t v82 = v119;
    uint64_t v83 = v120;
    (*(void (**)(uint64_t, uint8_t *, uint64_t))(v119 + 32))(v124, v53, v120);
    sub_1D5B4();
    uint64_t v84 = sub_1D58C((uint64_t)v142);
    v85(v84);
    uint64_t v86 = (void *)sub_53DA0();
    os_log_type_t v87 = sub_53E90();
    if (sub_FF7C(v87))
    {
      uint64_t v88 = (_WORD *)sub_61F0();
      sub_61CC(v88);
      sub_FED0(&dword_0, v89, v90, "#OfflineFlow onInput .uso");
      sub_60F0();
    }

    sub_6120();
    v52();
    uint64_t v91 = v124;
    sub_53610();
    v141[3] = (uint64_t)&type metadata for EmergencyFeatureFlagsKey;
    v142[0] = sub_F998();
    LOBYTE(v141[0]) = 2;
    sub_53640();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v141);
    uint64_t v92 = v121;
    sub_53CC0();
    (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v91, v83);
    __int16 v93 = *(unsigned __int8 *)(v92 + *(int *)(v122 + 24));
    LOWORD(v91) = *(unsigned __int8 *)(v92 + *(int *)(v122 + 28));
    sub_FA44(v92, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
    __int16 v70 = v93 | ((_WORD)v91 << 8);
    goto LABEL_29;
  }
  sub_1D5B4();
  uint64_t v105 = sub_1D58C((uint64_t)v145);
  v106(v105);
  uint64_t v107 = sub_53DA0();
  os_log_type_t v108 = sub_53EA0();
  if (os_log_type_enabled(v107, v108))
  {
    uint64_t v125 = v28;
    os_log_type_t v109 = (uint8_t *)swift_slowAlloc();
    uint64_t v143 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v109 = 136315138;
    LOBYTE(v144) = 0;
    uint64_t v110 = sub_53E10();
    uint64_t v144 = (void (*)(void, void, void))sub_50F10(v110, v111, &v143);
    sub_53EF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v107, v108, "%s", v109, 0xCu);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();
  }

  sub_6120();
  v52();
  (*(void (**)(uint8_t *, uint64_t))(v136 + 8))(v138, v137);
  return 0;
}

uint64_t sub_1C71C()
{
  sub_10010();
  v1[26] = v2;
  v1[27] = v0;
  uint64_t v3 = sub_53DB0();
  v1[28] = v3;
  v1[29] = *(void *)(v3 - 8);
  v1[30] = swift_task_alloc();
  v1[31] = swift_task_alloc();
  return _swift_task_switch(sub_1C7E8, 0, 0);
}

uint64_t sub_1C7E8()
{
  uint64_t v38 = v0;
  uint64_t v1 = *(void *)(v0 + 248);
  uint64_t v2 = *(uint8_t **)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 232);
  uint64_t v4 = sub_53D90();
  sub_6108();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint8_t *))(v3 + 16);
  v5(v1, v4, v2);
  uint64_t v6 = sub_53DA0();
  os_log_type_t v7 = sub_53E90();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (_WORD *)sub_61F0();
    sub_61CC(v8);
    _os_log_impl(&dword_0, v6, v7, "#OfflineFlow execute", v2, 2u);
    sub_60F0();
  }
  uint64_t v9 = *(void *)(v0 + 248);
  uint64_t v10 = *(void *)(v0 + 224);
  uint64_t v11 = *(void *)(v0 + 232);
  uint64_t v12 = *(void *)(v0 + 216);

  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v13(v9, v10);
  unsigned int v14 = *(unsigned __int16 *)(v12 + 176);
  if (v14 >> 8 == 5)
  {
    uint64_t v15 = *(void *)(v0 + 208);
    uint64_t v16 = *(void *)(v0 + 216);
    sub_F824();
    uint64_t v17 = swift_allocError();
    *uint64_t v18 = 2;
    sub_2940(v17, v16 + 16, (void *)(v16 + 56), v15);
    swift_errorRelease();
    goto LABEL_7;
  }
  if (v14 >> 8 == 6)
  {
    sub_53460();
LABEL_7:
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
    return v19();
  }
  uint64_t v21 = *(void *)(v0 + 240);
  uint64_t v22 = *(uint8_t **)(v0 + 224);
  sub_6108();
  v5(v21, v4, v22);
  uint64_t v23 = sub_53DA0();
  os_log_type_t v24 = sub_53E90();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v26 = *(void *)(v0 + 240);
  uint64_t v27 = *(void *)(v0 + 224);
  if (v25)
  {
    uint64_t v28 = swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    *(_DWORD *)uint64_t v28 = 136315394;
    *(unsigned char *)(v0 + 265) = v14;
    sub_2E18(&qword_6CC58);
    uint64_t v29 = sub_53ED0();
    *(void *)(v0 + 200) = sub_50F10(v29, v30, &v37);
    sub_53EF0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2080;
    *(unsigned char *)(v0 + 264) = BYTE1(v14);
    sub_2E18(&qword_6CC60);
    uint64_t v31 = sub_53ED0();
    *(void *)(v0 + 192) = sub_50F10(v31, v32, &v37);
    sub_53EF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v23, v24, "#OfflineFlow needsExecution situation: %s, organization: %s", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();

    uint64_t v34 = v27;
    uint64_t v33 = v26;
  }
  else
  {

    uint64_t v33 = v26;
    uint64_t v34 = v27;
  }
  v13(v33, v34);
  uint64_t v35 = *(void *)(v0 + 216) + 136;
  uint64_t v36 = (void *)swift_task_alloc();
  *(void *)(v0 + 256) = v36;
  void *v36 = v0;
  v36[1] = sub_1CBD8;
  return sub_167DC(v0 + 16, v35, v14, SBYTE1(v14));
}

uint64_t sub_1CBD8()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  return _swift_task_switch(sub_1CCA4, 0, 0);
}

uint64_t sub_1CCA4()
{
  sub_1CDD0(v0 + 16);
  sub_F724((uint64_t *)(v0 + 16));
  sub_53450();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1CD44()
{
  type metadata accessor for OfflineFlow();
  sub_1D544(&qword_6CC50, v0, (void (*)(uint64_t))type metadata accessor for OfflineFlow);
  return sub_531E0();
}

uint64_t sub_1CDD0(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_F214(a1, (uint64_t)v28);
  sub_F214((uint64_t)v28, (uint64_t)v31);
  sub_53B50();
  sub_6188();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2E18(&qword_6BCB8);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v25 - v11;
  uint64_t v13 = sub_2E18(&qword_6BCA8);
  __chkstk_darwin(v13 - 8);
  sub_612C();
  uint64_t v26 = v14;
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v25 - v16;
  sub_2C00((void *)(v2 + 56), *(void *)(v2 + 80));
  sub_F214(a1, (uint64_t)v30);
  if (sub_F27C((uint64_t)v30) == 1)
  {
    uint64_t v18 = sub_53AD0();
    sub_34DC((uint64_t)v12, 1, 1, v18);
    swift_retain();
    uint64_t v19 = 0;
  }
  else
  {
    BOOL v25 = v10;
    swift_retain();
    uint64_t v10 = v25;
    sub_53E20();
    uint64_t v20 = sub_53AD0();
    sub_34DC((uint64_t)v12, 0, 1, v20);
    sub_F214((uint64_t)v31, (uint64_t)v29);
    uint64_t v19 = sub_53E30();
  }
  sub_F214(a1, (uint64_t)v29);
  if (sub_F27C((uint64_t)v29) == 1)
  {
    uint64_t v21 = 1;
  }
  else
  {
    sub_53E20();
    uint64_t v21 = 0;
  }
  uint64_t v22 = sub_53AD0();
  sub_34DC((uint64_t)v10, v21, 1, v22);
  sub_B760((uint64_t)v12, v19, (uint64_t)v10);
  swift_release();
  swift_release();
  sub_5884((uint64_t)v10, &qword_6BCB8);
  sub_5884((uint64_t)v12, &qword_6BCB8);
  sub_2FE0((uint64_t)v17, v26);
  sub_3048(v2 + 16, (uint64_t)&v27);
  sub_53B40();
  sub_1D544((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
  uint64_t v23 = sub_531D0();
  sub_FA44((uint64_t)v6, (void (*)(void))&type metadata accessor for OutputFlow);
  sub_5884((uint64_t)v17, &qword_6BCA8);
  return v23;
}

uint64_t sub_1D164()
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 16);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 56);
  sub_6068(v0 + 96);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 136);
  return v0;
}

uint64_t sub_1D19C()
{
  sub_1D164();

  return _swift_deallocClassInstance(v0, 178, 7);
}

uint64_t type metadata accessor for OfflineFlow()
{
  return self;
}

_WORD *initializeBufferWithCopyOfBuffer for OfflineFlow.OfflineFlowState(_WORD *result, _WORD *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for OfflineFlow.OfflineFlowState(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFA)
  {
    unsigned int v2 = a2 + 65286;
    if (a2 + 65286 <= 0xFFFEFFFF) {
      unsigned int v3 = 2;
    }
    else {
      unsigned int v3 = 4;
    }
    if (v2 < 0xFF0000) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x10000) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = *((unsigned __int8 *)a1 + 2);
        if (!*((unsigned char *)a1 + 2)) {
          break;
        }
        return (*a1 | (v5 << 16)) - 65286;
      case 2:
        int v5 = a1[1];
        if (a1[1]) {
          return (*a1 | (v5 << 16)) - 65286;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x1D2C0);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 16)) - 65286;
      default:
        break;
    }
  }
  if (*((unsigned __int8 *)a1 + 1) <= 4u) {
    int v7 = 4;
  }
  else {
    int v7 = *((unsigned __int8 *)a1 + 1);
  }
  unsigned int v8 = v7 - 4;
  if (*((unsigned __int8 *)a1 + 1) >= 4u) {
    unsigned int v9 = v8;
  }
  else {
    unsigned int v9 = 0;
  }
  if (v9 >= 3) {
    return v9 - 2;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for OfflineFlow.OfflineFlowState(uint64_t result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 65286;
  if (a3 + 65286 <= 0xFFFEFFFF) {
    int v4 = 2;
  }
  else {
    int v4 = 4;
  }
  if (v3 < 0xFF0000) {
    int v4 = 1;
  }
  if (v3 >= 0x10000) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFA) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v7 = ((a2 - 250) >> 16) + 1;
    *(_WORD *)uint64_t result = a2 - 250;
    switch(v6)
    {
      case 1:
        *(unsigned char *)(result + 2) = v7;
        break;
      case 2:
        *(_WORD *)(result + 2) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x1D3A8);
      case 4:
        *(_DWORD *)(result + 2) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *(unsigned char *)(result + 1) = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_1D3D0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 1) <= 4u) {
    int v1 = 4;
  }
  else {
    int v1 = *(unsigned __int8 *)(a1 + 1);
  }
  unsigned int v2 = v1 - 4;
  if (*(unsigned __int8 *)(a1 + 1) >= 4u) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t sub_1D3F0(uint64_t result, unsigned int a2)
{
  if (a2 > 0xFB)
  {
    *(_WORD *)uint64_t result = a2 - 252;
  }
  else if (a2)
  {
    *(unsigned char *)(result + 1) = a2 + 4;
  }
  return result;
}

ValueMetadata *type metadata accessor for OfflineFlow.OfflineFlowState()
{
  return &type metadata for OfflineFlow.OfflineFlowState;
}

uint64_t sub_1D424(uint64_t a1)
{
  return sub_1B8E4(a1) & 1;
}

uint64_t sub_1D44C()
{
  return sub_1CD44();
}

uint64_t sub_1D470()
{
  int v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *int v1 = v0;
  v1[1] = sub_DD40;
  return sub_1C71C();
}

uint64_t sub_1D50C()
{
  type metadata accessor for OfflineFlow();

  return sub_53230();
}

uint64_t sub_1D544(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_1D58C@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 - 256);
}

uint64_t sub_1D5B4()
{
  return swift_beginAccess();
}

uint64_t sub_1D5D8()
{
  return v0;
}

uint64_t type metadata accessor for CommonModernCATs()
{
  uint64_t result = qword_6CC70;
  if (!qword_6CC70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1D65C()
{
  uint64_t result = sub_53B30();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1D700(uint64_t a1, void *a2)
{
  return sub_1D74C(a1, a2);
}

uint64_t sub_1D74C(uint64_t a1, void *a2)
{
  uint64_t v5 = sub_53B30();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v7 - 8);
  unsigned int v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v2 + qword_6CC68) = a2;
  uint64_t v10 = *(void (**)(void))(v6 + 16);
  sub_3BD0();
  v10();
  uint64_t v11 = sub_53030();
  sub_34DC((uint64_t)v9, 1, 1, v11);
  sub_3BD0();
  v10();
  id v12 = a2;
  uint64_t v13 = sub_53AE0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v13;
}

void sub_1D8D8()
{
}

void sub_1D908()
{
}

uint64_t sub_1D938()
{
  uint64_t v1 = v0 + qword_6E2B0;
  uint64_t v2 = sub_53B30();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

uint64_t sub_1D9B4()
{
  uint64_t v0 = sub_53B00();

  uint64_t v1 = v0 + qword_6E2B0;
  uint64_t v2 = sub_53B30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_1DA30()
{
  uint64_t v0 = sub_1D9B4();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_1DA84()
{
  return type metadata accessor for CommonModernCATs();
}

uint64_t type metadata accessor for SexualAssaultModernCATs()
{
  uint64_t result = qword_6CCC0;
  if (!qword_6CCC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1DAD4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1DB14(uint64_t a1, uint64_t a2)
{
  return sub_1DB68(a1, a2);
}

uint64_t sub_1DB68(uint64_t a1, uint64_t a2)
{
  sub_53B30();
  sub_9AD8();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_6140();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v11 - 8);
  sub_6140();
  sub_9A10(a1, v13 - v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v10, a2, v2);
  uint64_t v14 = sub_53AE0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v2);
  sub_9A78(a1);
  return v14;
}

uint64_t sub_1DC94(uint64_t a1, uint64_t a2)
{
  sub_53B30();
  sub_9AD8();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_6140();
  uint64_t v9 = v8 - v7;
  swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v9, a2, v2);
  uint64_t v10 = sub_53AF0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v2);
  return v10;
}

uint64_t sub_1DD70()
{
  return type metadata accessor for SexualAssaultModernCATs();
}

uint64_t type metadata accessor for DomesticViolenceCATs()
{
  uint64_t result = qword_6CD10;
  if (!qword_6CD10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1DDC0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1DE00(uint64_t a1, char a2)
{
  uint64_t v4 = sub_2E18(&qword_6BCB8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2E18(&qword_6BF00);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_547D0;
  uint64_t v8 = (uint64_t *)(v7 + 48);
  *(void *)(v7 + 32) = 0x656D614E67726FLL;
  *(void *)(v7 + 40) = 0xE700000000000000;
  sub_7C74(a1, (uint64_t)v6, &qword_6BCB8);
  uint64_t v9 = sub_53AD0();
  if (sub_5800((uint64_t)v6, 1, v9) == 1)
  {
    sub_7CD4((uint64_t)v6, &qword_6BCB8);
    *(_OWORD *)uint64_t v8 = 0u;
    *(_OWORD *)(v7 + 64) = 0u;
  }
  else
  {
    *(void *)(v7 + 72) = v9;
    sub_5DC4(v8);
    sub_7D4C();
    (*(void (**)(void))(v10 + 32))();
  }
  *(void *)(v7 + 80) = 0xD000000000000012;
  *(void *)(v7 + 88) = 0x80000000000575A0;
  *(void *)(v7 + 120) = &type metadata for Bool;
  *(unsigned char *)(v7 + 96) = a2 & 1;
  sub_53A60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DFB4()
{
  sub_840C();
  return sub_1E424(v0, v1, v2);
}

uint64_t sub_1DFD0(uint64_t a1)
{
  return sub_1E424(a1, 0x656D614E67726FLL, 0xE700000000000000);
}

uint64_t sub_1DFFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_2E18(&qword_6BCB8);
  __chkstk_darwin(v7 - 8);
  sub_7D34();
  sub_2E18(&qword_6BF00);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_547B0;
  uint64_t v9 = (uint64_t *)(v8 + 48);
  *(void *)(v8 + 32) = a2;
  *(void *)(v8 + 40) = a3;
  sub_7C74(a1, v3, &qword_6BCB8);
  uint64_t v10 = sub_53AD0();
  if (sub_5800(v3, 1, v10) == 1)
  {
    sub_7CD4(v3, &qword_6BCB8);
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v8 + 64) = 0u;
  }
  else
  {
    *(void *)(v8 + 72) = v10;
    sub_5DC4(v9);
    sub_7D4C();
    (*(void (**)(void))(v11 + 32))();
  }
  sub_53A60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1E168()
{
  sub_840C();
  return sub_1E424(v0, v1, v2);
}

uint64_t sub_1E184()
{
  return sub_53A60();
}

uint64_t sub_1E1A8(uint64_t a1, uint64_t a2)
{
  return sub_1E1FC(a1, a2);
}

uint64_t sub_1E1FC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_53B30();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_7D34();
  uint64_t v7 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v7 - 8);
  sub_7C74(a1, (uint64_t)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t *)&unk_6DA80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, a2, v5);
  uint64_t v9 = sub_53A50();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v5);
  sub_7CD4(a1, (uint64_t *)&unk_6DA80);
  return v9;
}

uint64_t sub_1E368()
{
  return type metadata accessor for DomesticViolenceCATs();
}

uint64_t sub_1E370(uint64_t a1, char a2)
{
  return sub_1DE00(a1, a2);
}

uint64_t sub_1E394()
{
  return sub_1DFB4();
}

uint64_t sub_1E3B8(uint64_t a1)
{
  return sub_1DFD0(a1);
}

uint64_t sub_1E3DC()
{
  return sub_1E168();
}

uint64_t sub_1E400()
{
  return sub_1E184();
}

uint64_t sub_1E424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1DFFC(a1, a2, a3);
}

BOOL sub_1E42C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for RedirectToCompanionFlow.State(0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v29 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v29 - v11;
  uint64_t v13 = sub_53DB0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_53D90();
  sub_6108();
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v33 = v13;
  v18(v16, v17, v13);
  uint64_t v19 = sub_53DA0();
  os_log_type_t v20 = sub_53E90();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v31 = v12;
    uint64_t v22 = v21;
    v35[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 136315394;
    uint64_t v30 = v2;
    uint64_t v34 = sub_50F10(0xD00000000000007DLL, 0x8000000000058030, v35);
    unint64_t v32 = v10;
    sub_53EF0();
    *(_WORD *)(v22 + 12) = 2080;
    uint64_t v34 = sub_50F10(0x7475706E69286E6FLL, 0xEA0000000000293ALL, v35);
    uint64_t v10 = v32;
    uint64_t v2 = v30;
    sub_53EF0();
    _os_log_impl(&dword_0, v19, v20, "%s:%s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    sub_60F0();
    uint64_t v12 = v31;
    sub_60F0();
  }

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v33);
  uint64_t v23 = v2 + OBJC_IVAR____TtC19EmergencyFlowPlugin23RedirectToCompanionFlow_state;
  sub_6108();
  sub_20998(v23, (uint64_t)v12);
  uint64_t v24 = sub_535B0();
  int v25 = sub_5800((uint64_t)v12, 3, v24);
  if (v25 == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(v10, a1, v24);
    sub_34DC((uint64_t)v10, 0, 3, v24);
    sub_20BE0((uint64_t)v10, (uint64_t)v7);
    swift_beginAccess();
    uint64_t v26 = sub_20CD4();
    sub_20C44(v26, v27);
    swift_endAccess();
  }
  else
  {
    sub_209FC((uint64_t)v12);
  }
  return v25 == 1;
}

uint64_t sub_1E7E8()
{
  sub_10010();
  v1[22] = v2;
  v1[23] = v0;
  uint64_t v3 = sub_53590();
  v1[24] = v3;
  sub_FDFC(v3);
  v1[25] = v4;
  v1[26] = sub_20CA8();
  sub_2E18(&qword_6CF88);
  v1[27] = sub_20CA8();
  uint64_t v5 = sub_53100();
  v1[28] = v5;
  sub_FDFC(v5);
  v1[29] = v6;
  v1[30] = sub_20CA8();
  uint64_t v7 = sub_530E0();
  v1[31] = v7;
  sub_FDFC(v7);
  v1[32] = v8;
  v1[33] = sub_20CA8();
  uint64_t v9 = sub_53580();
  v1[34] = v9;
  sub_FDFC(v9);
  v1[35] = v10;
  v1[36] = sub_20CA8();
  uint64_t v11 = sub_53250();
  v1[37] = v11;
  sub_FDFC(v11);
  v1[38] = v12;
  v1[39] = sub_20CA8();
  type metadata accessor for RedirectToCompanionFlow.State(0);
  v1[40] = sub_20CA8();
  uint64_t v13 = sub_535B0();
  v1[41] = v13;
  sub_FDFC(v13);
  v1[42] = v14;
  v1[43] = swift_task_alloc();
  v1[44] = swift_task_alloc();
  uint64_t v15 = sub_53DB0();
  v1[45] = v15;
  sub_FDFC(v15);
  v1[46] = v16;
  v1[47] = swift_task_alloc();
  v1[48] = swift_task_alloc();
  v1[49] = swift_task_alloc();
  v1[50] = swift_task_alloc();
  return _swift_task_switch(sub_1EA2C, 0, 0);
}

uint64_t sub_1EA2C()
{
  uint64_t v74 = v0;
  uint64_t v1 = v0[50];
  uint64_t v3 = v0[45];
  uint64_t v2 = v0[46];
  uint64_t v4 = sub_53D90();
  sub_6108();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_53DA0();
  os_log_type_t v6 = sub_53E90();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = v0[46];
    uint64_t v67 = v0[45];
    uint64_t v68 = v0[50];
    uint64_t v8 = swift_slowAlloc();
    v73[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315394;
    v0[20] = sub_50F10(0xD00000000000007DLL, 0x8000000000058030, v73);
    sub_53EF0();
    *(_WORD *)(v8 + 12) = 2080;
    v0[21] = sub_50F10(0x2865747563657865, 0xE900000000000029, v73);
    sub_53EF0();
    _os_log_impl(&dword_0, v5, v6, "%s:%s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();

    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v9(v68, v67);
  }
  else
  {
    uint64_t v10 = v0[50];
    uint64_t v12 = v0[45];
    uint64_t v11 = v0[46];

    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v9(v10, v12);
  }
  uint64_t v14 = v0[40];
  uint64_t v13 = v0[41];
  uint64_t v15 = v0[23] + OBJC_IVAR____TtC19EmergencyFlowPlugin23RedirectToCompanionFlow_state;
  sub_6108();
  sub_20998(v15, v14);
  int v16 = sub_5800(v14, 3, v13);
  if (v16)
  {
    if (v16 == 3)
    {
      uint64_t v18 = v0[38];
      uint64_t v17 = v0[39];
      uint64_t v19 = v0[37];
      (*(void (**)(uint64_t, void, uint64_t))(v18 + 104))(v17, enum case for FlowUnhandledReason.needsServerExecution(_:), v19);
      sub_53480();
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    }
    else
    {
      uint64_t v58 = v0[40];
      sub_53460();
      sub_209FC(v58);
    }
  }
  else
  {
    __int16 v69 = v9;
    (*(void (**)(void, void, void))(v0[42] + 32))(v0[44], v0[40], v0[41]);
    sub_20CD4();
    sub_6108();
    sub_20CC0();
    v20();
    uint64_t v21 = sub_53DA0();
    os_log_type_t v22 = sub_53E90();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_0, v21, v22, "get the supported companions", v23, 2u);
      sub_60F0();
    }
    uint64_t v24 = v0[49];
    uint64_t v25 = v0[45];
    uint64_t v26 = v0[35];
    uint64_t v27 = v0[36];
    uint64_t v28 = v0[34];
    uint64_t v29 = v0[32];
    uint64_t v61 = v0[33];
    uint64_t v62 = v0[31];
    uint64_t v30 = v0[27];

    v69(v24, v25);
    sub_53170();
    (*(void (**)(uint64_t, void, uint64_t))(v26 + 104))(v27, enum case for CompanionDeviceInfoRequirement.supportsPeerToPeerHandoff(_:), v28);
    sub_53160();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v28);
    uint64_t v31 = type metadata accessor for SimpleHandoffStrategy();
    uint64_t v32 = swift_allocObject();
    v73[3] = v31;
    v73[4] = sub_20950(&qword_6CF90, v33, (void (*)(uint64_t))type metadata accessor for SimpleHandoffStrategy);
    v73[0] = v32;
    swift_retain();
    sub_530D0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v30, v61, v62);
    sub_34DC(v30, 0, 1, v62);
    sub_530C0();
    sub_530F0();
    sub_6108();
    sub_20CD4();
    sub_20CC0();
    v34();
    uint64_t v35 = sub_53DA0();
    os_log_type_t v36 = sub_53E90();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_0, v35, v36, "going into executeOnRemoteFlow", v37, 2u);
      sub_60F0();
    }
    uint64_t v38 = v0[48];
    uint64_t v40 = v0[44];
    uint64_t v39 = v0[45];
    uint64_t v41 = v0[42];
    uint64_t v42 = v0[43];
    uint64_t v43 = v0[41];
    uint64_t v45 = v0[25];
    uint64_t v44 = v0[26];
    uint64_t v63 = v0[24];

    v69(v38, v39);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v42, v40, v43);
    (*(void (**)(uint64_t, void, uint64_t))(v45 + 104))(v44, enum case for ExecuteOnRemoteDeviceSpecification.userCompanion(_:), v63);
    sub_53570();
    sub_530A0();
    swift_allocObject();
    v0[18] = sub_53090();
    sub_2E18(&qword_6CF98);
    uint64_t v46 = sub_531C0();
    sub_FDFC(v46);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_547D0;
    sub_531A0();
    sub_531B0();
    uint64_t v47 = sub_53080();
    swift_bridgeObjectRelease();
    v0[17] = v47;
    sub_53190();
    uint64_t v65 = sub_53210();
    swift_release();
    swift_release();
    sub_6108();
    sub_20CD4();
    sub_20CC0();
    v48();
    uint64_t v49 = sub_53DA0();
    os_log_type_t v50 = sub_53E90();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v51 = 0;
      _os_log_impl(&dword_0, v49, v50, "finished creating the executeOnRemoteFlow", v51, 2u);
      sub_60F0();
    }
    uint64_t v52 = v0[47];
    uint64_t v53 = v0[45];
    uint64_t v54 = v0[42];
    uint64_t v71 = v0[41];
    uint64_t v72 = v0[44];
    uint64_t v55 = v0[32];
    uint64_t v70 = v0[33];
    uint64_t v66 = v0[31];
    uint64_t v56 = v0[29];
    uint64_t v64 = v0[30];
    uint64_t v57 = v0[28];

    v69(v52, v53);
    v0[19] = v65;
    swift_retain();
    sub_2E18(&qword_6CFA0);
    sub_20A60();
    sub_53430();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v64, v57);
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v70, v66);
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v72, v71);
    swift_release();
  }
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
  char v59 = (uint64_t (*)(void))v0[1];
  return v59();
}

uint64_t sub_1F36C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_53DB0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v72 = (char *)&v62 - v10;
  __chkstk_darwin(v9);
  uint64_t v70 = (char *)&v62 - v11;
  uint64_t v12 = sub_530B0();
  uint64_t v13 = *(void (***)(char *, char *, uint64_t))(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v68 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  __int16 v69 = (char *)&v62 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  os_log_type_t v20 = (uint64_t *)((char *)&v62 - v19);
  __chkstk_darwin(v18);
  os_log_type_t v22 = (char *)&v62 - v21;
  uint64_t v23 = sub_2E18(&qword_6CFB0);
  __chkstk_darwin(v23 - 8);
  uint64_t v25 = (char *)&v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = type metadata accessor for RedirectToCompanionFlow.State(0);
  __chkstk_darwin(v26 - 8);
  uint64_t v73 = (uint64_t)&v62 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20AB4(a1, (uint64_t)v25);
  uint64_t v28 = sub_2E18(&qword_6CFB8);
  if (sub_5800((uint64_t)v25, 1, v28) == 1)
  {
    uint64_t v29 = a2;
    uint64_t v30 = sub_53D90();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v30, v4);
    uint64_t v31 = sub_53DA0();
    os_log_type_t v32 = sub_53EA0();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_0, v31, v32, "ExecuteOnRemote guard flows failed, assuming a server redirect or handoff should have happened, doing nothing.", v33, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    uint64_t v34 = sub_535B0();
    uint64_t v35 = v73;
    sub_34DC(v73, 2, 3, v34);
    sub_20B1C((uint64_t)v25);
  }
  else
  {
    uint64_t v67 = a2;
    v13[4](v22, v25, v12);
    os_log_type_t v36 = v13[2];
    v36((char *)v20, v22, v12);
    uint64_t v37 = v13[11];
    uint64_t v71 = v12;
    if (((unsigned int (*)(uint64_t *, uint64_t))v37)(v20, v12) == enum case for ExecuteOnRemoteFlowResult.remoteFlowFailure(_:))
    {
      ((void (*)(uint64_t *, uint64_t))v13[12])(v20, v71);
      uint64_t v38 = *v20;
      uint64_t v39 = sub_53D90();
      swift_beginAccess();
      uint64_t v40 = v70;
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v70, v39, v4);
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v41 = sub_53DA0();
      os_log_type_t v42 = sub_53EA0();
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v43 = swift_slowAlloc();
        uint64_t v66 = v22;
        uint64_t v44 = (uint8_t *)v43;
        uint64_t v45 = swift_slowAlloc();
        uint64_t v74 = v38;
        v75[0] = v45;
        uint64_t v65 = v4;
        *(_DWORD *)uint64_t v44 = 136315138;
        uint64_t v72 = (char *)(v44 + 4);
        swift_errorRetain();
        sub_2E18(&qword_6BCA0);
        uint64_t v46 = sub_53E10();
        uint64_t v74 = sub_50F10(v46, v47, v75);
        sub_53EF0();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&dword_0, v41, v42, "ExecuteOnRemote failed with an error=%s: Possible server redirect. Will redirect this input to server as a fallback.", v44, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_errorRelease();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v40, v65);
        ((void (*)(char *, uint64_t))v13[1])(v66, v71);
      }
      else
      {

        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v40, v4);
        ((void (*)(char *, uint64_t))v13[1])(v22, v71);
      }
      uint64_t v29 = v67;
      uint64_t v58 = sub_535B0();
      uint64_t v35 = v73;
      sub_34DC(v73, 3, 3, v58);
    }
    else
    {
      uint64_t v70 = (char *)v13;
      uint64_t v48 = sub_53D90();
      swift_beginAccess();
      uint64_t v49 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
      uint64_t v65 = v4;
      v49(v72, v48, v4);
      os_log_type_t v50 = v69;
      uint64_t v66 = v22;
      uint64_t v51 = v71;
      v36(v69, v22, v71);
      uint64_t v52 = sub_53DA0();
      os_log_type_t v53 = sub_53EA0();
      if (os_log_type_enabled(v52, v53))
      {
        uint64_t v54 = (uint8_t *)swift_slowAlloc();
        uint64_t v64 = swift_slowAlloc();
        v75[0] = v64;
        uint64_t v63 = v54;
        *(_DWORD *)uint64_t v54 = 136315138;
        uint64_t v62 = v54 + 4;
        v36(v68, v50, v51);
        uint64_t v55 = sub_53E10();
        uint64_t v74 = sub_50F10(v55, v56, v75);
        sub_53EF0();
        swift_bridgeObjectRelease();
        uint64_t v57 = (void (*)(char *, uint64_t))*((void *)v70 + 1);
        v57(v50, v51);
        _os_log_impl(&dword_0, v52, v53, "ExecuteOnRemote flow completed with: %s", v63, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        uint64_t v57 = (void (*)(char *, uint64_t))*((void *)v70 + 1);
        v57(v50, v51);
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v72, v65);
      v57(v66, v51);
      uint64_t v29 = v67;
      uint64_t v59 = sub_535B0();
      uint64_t v35 = v73;
      sub_34DC(v73, 2, 3, v59);
      v57((char *)v20, v51);
    }
  }
  uint64_t v60 = v29 + OBJC_IVAR____TtC19EmergencyFlowPlugin23RedirectToCompanionFlow_state;
  swift_beginAccess();
  sub_20B7C(v35, v60);
  swift_endAccess();
  return sub_209FC(v35);
}

uint64_t sub_1FC6C()
{
  return sub_531E0();
}

uint64_t sub_1FD00()
{
  sub_209FC(v0 + OBJC_IVAR____TtC19EmergencyFlowPlugin23RedirectToCompanionFlow_state);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_1FD64()
{
  return type metadata accessor for RedirectToCompanionFlow(0);
}

uint64_t type metadata accessor for RedirectToCompanionFlow(uint64_t a1)
{
  return sub_B5B4(a1, (uint64_t *)&unk_6CD88);
}

uint64_t sub_1FD8C()
{
  uint64_t result = type metadata accessor for RedirectToCompanionFlow.State(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for RedirectToCompanionFlow.State(uint64_t a1)
{
  return sub_B5B4(a1, qword_6CF50);
}

uint64_t sub_1FE3C()
{
  return sub_53970();
}

uint64_t sub_1FE60()
{
  return sub_53980();
}

void (*sub_1FE84(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_53960();
  return sub_1FEF8;
}

void sub_1FEF8(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

BOOL sub_1FF40(uint64_t a1)
{
  return sub_1E42C(a1);
}

uint64_t sub_1FF68()
{
  return sub_1FC6C();
}

uint64_t sub_1FF8C()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_DD40;
  return sub_1E7E8();
}

uint64_t sub_20028()
{
  type metadata accessor for RedirectToCompanionFlow(0);

  return sub_53230();
}

uint64_t sub_20064()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SimpleHandoffStrategy()
{
  return self;
}

uint64_t *sub_20098(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = sub_535B0();
    if (sub_5800((uint64_t)a2, 3, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      sub_34DC((uint64_t)a1, 0, 3, v7);
    }
  }
  return a1;
}

uint64_t sub_20194(uint64_t a1)
{
  uint64_t v2 = sub_535B0();
  uint64_t result = sub_5800(a1, 3, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_2021C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_535B0();
  if (sub_5800((uint64_t)a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    sub_34DC((uint64_t)a1, 0, 3, v6);
  }
  return a1;
}

void *sub_202DC(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_535B0();
  int v7 = sub_5800((uint64_t)a1, 3, v6);
  int v8 = sub_5800((uint64_t)a2, 3, v6);
  if (!v7)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  sub_34DC((uint64_t)a1, 0, 3, v6);
  return a1;
}

void *sub_20424(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_535B0();
  if (sub_5800((uint64_t)a2, 3, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    sub_34DC((uint64_t)a1, 0, 3, v6);
  }
  return a1;
}

void *sub_204E4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_535B0();
  int v7 = sub_5800((uint64_t)a1, 3, v6);
  int v8 = sub_5800((uint64_t)a2, 3, v6);
  if (!v7)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  sub_34DC((uint64_t)a1, 0, 3, v6);
  return a1;
}

uint64_t sub_2062C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_20640);
}

uint64_t sub_20640(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_535B0();
  unsigned int v5 = sub_5800(a1, a2, v4);
  if (v5 >= 4) {
    return v5 - 3;
  }
  else {
    return 0;
  }
}

uint64_t sub_20688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_2069C);
}

uint64_t sub_2069C(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 3);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_535B0();

  return sub_34DC(a1, v5, a3, v6);
}

uint64_t sub_206FC(uint64_t a1)
{
  uint64_t v2 = sub_535B0();

  return sub_5800(a1, 3, v2);
}

uint64_t sub_20740(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_535B0();

  return sub_34DC(a1, a2, 3, v4);
}

uint64_t sub_2078C()
{
  uint64_t result = sub_535B0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_20804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *int v7 = v3;
  v7[1] = sub_DD40;
  return HandoffSessionToCompanionFlowStrategyAsync.makeHandoffResponse()(a1, a2, a3);
}

uint64_t sub_208B8()
{
  return sub_20950(&qword_6CF78, 255, (void (*)(uint64_t))type metadata accessor for RedirectToCompanionFlow);
}

uint64_t sub_20904()
{
  return sub_20950(&qword_6CF80, 255, (void (*)(uint64_t))type metadata accessor for RedirectToCompanionFlow);
}

uint64_t sub_20950(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_20998(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RedirectToCompanionFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_209FC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RedirectToCompanionFlow.State(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20A58(uint64_t a1)
{
  return sub_1F36C(a1, v1);
}

unint64_t sub_20A60()
{
  unint64_t result = qword_6CFA8;
  if (!qword_6CFA8)
  {
    sub_58D8(&qword_6CFA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6CFA8);
  }
  return result;
}

uint64_t sub_20AB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2E18(&qword_6CFB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20B1C(uint64_t a1)
{
  uint64_t v2 = sub_2E18(&qword_6CFB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20B7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RedirectToCompanionFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_20BE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RedirectToCompanionFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20C44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RedirectToCompanionFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_20CA8()
{
  return swift_task_alloc();
}

uint64_t sub_20CD4()
{
  return v0;
}

uint64_t type metadata accessor for EmergencyPoisonControlBasicIntentModernCATs()
{
  uint64_t result = qword_6CFC0;
  if (!qword_6CFC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_20D28()
{
  return swift_initClassMetadata2();
}

uint64_t sub_20D68(uint64_t a1, uint64_t a2)
{
  return sub_20DBC(a1, a2);
}

uint64_t sub_20DBC(uint64_t a1, uint64_t a2)
{
  sub_53B30();
  sub_9AD8();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_6140();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v11 - 8);
  sub_6140();
  sub_9A10(a1, v13 - v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v10, a2, v2);
  uint64_t v14 = sub_53AE0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v2);
  sub_9A78(a1);
  return v14;
}

uint64_t sub_20EE8(uint64_t a1, uint64_t a2)
{
  sub_53B30();
  sub_9AD8();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_6140();
  uint64_t v9 = v8 - v7;
  swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v9, a2, v2);
  uint64_t v10 = sub_53AF0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v2);
  return v10;
}

uint64_t sub_20FC4()
{
  return type metadata accessor for EmergencyPoisonControlBasicIntentModernCATs();
}

void sub_20FCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_15308();
  a19 = v21;
  a20 = v22;
  uint64_t v170 = v20;
  uint64_t v24 = v23;
  uint64_t v25 = sub_535F0();
  sub_60C0();
  uint64_t v172 = v26;
  __chkstk_darwin(v27);
  sub_6150();
  sub_FE14(v28);
  uint64_t v29 = type metadata accessor for EmergencyNLIntent();
  uint64_t v30 = sub_FEC4(v29);
  __chkstk_darwin(v30);
  sub_612C();
  uint64_t v174 = v31;
  sub_15258();
  __chkstk_darwin(v32);
  sub_152E8();
  sub_FE14(v33);
  uint64_t v176 = sub_53920();
  sub_60C0();
  uint64_t v173 = v34;
  __chkstk_darwin(v35);
  sub_6150();
  sub_FE14(v36);
  uint64_t v37 = sub_53670();
  uint64_t v38 = sub_FEC4(v37);
  __chkstk_darwin(v38);
  sub_6150();
  sub_FE14(v39);
  uint64_t v40 = sub_53CD0();
  uint64_t v41 = sub_FEC4(v40);
  __chkstk_darwin(v41);
  sub_612C();
  uint64_t v163 = v42;
  sub_15258();
  __chkstk_darwin(v43);
  sub_152E8();
  sub_FE14(v44);
  uint64_t v168 = sub_53620();
  sub_60C0();
  v162[3] = v45;
  __chkstk_darwin(v46);
  sub_6150();
  sub_FE14(v47);
  uint64_t v184 = sub_53600();
  sub_60C0();
  uint64_t v183 = v48;
  __chkstk_darwin(v49);
  sub_6150();
  uint64_t v185 = v50;
  sub_535B0();
  sub_60C0();
  __chkstk_darwin(v51);
  sub_6140();
  uint64_t v52 = sub_53DB0();
  sub_60C0();
  uint64_t v54 = v53;
  __chkstk_darwin(v55);
  sub_612C();
  uint64_t v177 = v56;
  sub_15258();
  __chkstk_darwin(v57);
  sub_FF3C();
  uint64_t v167 = v58;
  sub_15258();
  __chkstk_darwin(v59);
  sub_FF3C();
  v162[2] = v60;
  sub_15258();
  uint64_t v62 = __chkstk_darwin(v61);
  uint64_t v64 = (char *)v162 - v63;
  __chkstk_darwin(v62);
  sub_FF3C();
  uint64_t v169 = v65;
  sub_15258();
  __chkstk_darwin(v66);
  sub_FF3C();
  uint64_t v178 = v67;
  sub_15258();
  __chkstk_darwin(v68);
  sub_FF3C();
  v162[1] = v69;
  sub_15258();
  __chkstk_darwin(v70);
  uint64_t v71 = sub_53D90();
  sub_6108();
  sub_252EC();
  uint64_t v181 = v71;
  uint64_t v187 = v72;
  uint64_t v188 = v52;
  uint64_t v186 = v73;
  sub_FE98();
  v74();
  uint64_t v179 = v24;
  sub_FE98();
  v75();
  uint64_t v76 = sub_53DA0();
  os_log_type_t v77 = sub_53E90();
  BOOL v78 = os_log_type_enabled(v76, v77);
  int v166 = v64;
  if (v78)
  {
    uint64_t v165 = v25;
    uint64_t v79 = (uint8_t *)sub_1001C();
    uint64_t v80 = sub_15284();
    uint64_t v171 = v54;
    *(void *)&long long v189 = v80;
    *(_DWORD *)uint64_t v79 = 136315138;
    v162[0] = v79 + 4;
    sub_2507C(&qword_6C3D8, 255, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v81 = sub_53FD0();
    uint64_t v196 = sub_50F10(v81, v82, (uint64_t *)&v189);
    uint64_t v25 = v165;
    sub_53EF0();
    swift_bridgeObjectRelease();
    uint64_t v83 = sub_25390();
    v84(v83);
    _os_log_impl(&dword_0, v76, v77, "#EmergencyDirectCallFlow onInput: %s", v79, 0xCu);
    sub_25238();
    uint64_t v54 = v171;
    sub_60F0();
    sub_60F0();
  }
  else
  {
    uint64_t v85 = sub_25390();
    v86(v85);
  }

  os_log_type_t v87 = *(void (**)(void))(v54 + 8);
  sub_2512C();
  v87();
  uint64_t v88 = v185;
  sub_535A0();
  int v89 = (*(uint64_t (**)(uint64_t, uint64_t))(v183 + 88))(v88, v184);
  char v90 = v182;
  uint64_t v91 = v186;
  if (v89 == enum case for Parse.NLv3IntentOnly(_:))
  {
    uint64_t v92 = sub_1D5D8();
    v93(v92);
    sub_252CC();
    v94();
    sub_6108();
    sub_250D4();
    v91();
    unsigned __int8 v95 = (void *)sub_53DA0();
    os_log_type_t v96 = sub_53E90();
    if (sub_FF7C(v96))
    {
      uint64_t v97 = (_WORD *)sub_61F0();
      sub_61CC(v97);
      sub_FED0(&dword_0, v98, v99, "EmergencyDirectCallFlow onInput .NLv3IntentOnly");
      sub_60F0();
    }

    sub_2512C();
    v87();
    sub_25324();
    uint64_t v100 = v175;
    sub_FE98();
    v101();
    sub_1B520(v100, v174, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    sub_24B38();
    unsigned int v103 = v102;
    sub_1B580(v100, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    goto LABEL_18;
  }
  if (v89 == enum case for Parse.directInvocation(_:))
  {
    v180 = v87;
    uint64_t v104 = sub_1D5D8();
    v105(v104);
    sub_252CC();
    v106();
    sub_6108();
    sub_250D4();
    v91();
    uint64_t v107 = (void *)sub_53DA0();
    os_log_type_t v108 = sub_53E90();
    if (sub_FF7C(v108))
    {
      os_log_type_t v109 = (_WORD *)sub_61F0();
      sub_61CC(v109);
      sub_FED0(&dword_0, v110, v111, "EmergencyDirectCallFlow onInput .directInvocation");
      sub_60F0();
    }

    unsigned __int8 v112 = v180;
    sub_251A0();
    v112();
    if (sub_535D0() == 0xD00000000000003FLL && v113 == 0x8000000000058140)
    {
      swift_bridgeObjectRelease();
      uint64_t v114 = v186;
    }
    else
    {
      sub_53FE0();
      sub_252F8();
      uint64_t v114 = v186;
      if ((v90 & 1) == 0) {
        goto LABEL_39;
      }
    }
    uint64_t v138 = sub_535E0();
    if (v138)
    {
      uint64_t v139 = v138;
      uint64_t v140 = sub_53D30();
      sub_2C2BC(v140, v141, v139, &v189);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((void *)&v190 + 1))
      {
        if (swift_dynamicCast())
        {
          char v142 = sub_53C30();
          if (v142 != 4)
          {
            LOBYTE(v103) = v142;
            LOWORD(v126) = 35;
LABEL_47:
            uint64_t v158 = sub_251EC();
            v159(v158);
            goto LABEL_48;
          }
        }
LABEL_39:
        if (sub_535D0() == 0xD000000000000035 && v148 == 0x8000000000057B10)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          sub_53FE0();
          sub_252F8();
          if ((v90 & 1) == 0)
          {
LABEL_44:
            sub_6108();
            sub_250D4();
            v114();
            char v150 = sub_53DA0();
            os_log_type_t v151 = sub_53EA0();
            if (!os_log_type_enabled(v150, v151))
            {

              sub_251A0();
              v112();
              uint64_t v156 = sub_251EC();
LABEL_52:
              v155(v156, v161);
              goto LABEL_53;
            }
            uint64_t v152 = (uint8_t *)sub_1001C();
            uint64_t v192 = sub_15284();
            *(_DWORD *)uint64_t v152 = 136315138;
            LOBYTE(v195) = 0;
            uint64_t v153 = sub_53E10();
            uint64_t v165 = v25;
            uint64_t v195 = sub_50F10(v153, v154, &v192);
            sub_53EF0();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_0, v150, v151, "%s", v152, 0xCu);
            swift_arrayDestroy();
            sub_60F0();
            sub_60F0();

            sub_251A0();
            v112();
            uint64_t v155 = *(void (**)(uint64_t, uint64_t))(v172 + 8);
            uint64_t v156 = v182;
            uint64_t v157 = &v193;
LABEL_51:
            uint64_t v161 = *(v157 - 32);
            goto LABEL_52;
          }
        }
        __int16 v149 = sub_2C188();
        if (v149 != 35)
        {
          LOWORD(v126) = v149;
          LOBYTE(v103) = 4;
          goto LABEL_47;
        }
        goto LABEL_44;
      }
    }
    else
    {
      long long v189 = 0u;
      long long v190 = 0u;
    }
    sub_14A94((uint64_t)&v189, &qword_6C508);
    goto LABEL_39;
  }
  if (v89 != enum case for Parse.uso(_:))
  {
    sub_6108();
    sub_250D4();
    v91();
    uint64_t v143 = sub_53DA0();
    os_log_type_t v144 = sub_53EA0();
    if (os_log_type_enabled(v143, v144))
    {
      uint64_t v145 = (uint8_t *)sub_1001C();
      uint64_t v196 = sub_15284();
      *(_DWORD *)uint64_t v145 = 136315138;
      LOBYTE(v192) = 0;
      uint64_t v171 = v54;
      uint64_t v146 = sub_53E10();
      uint64_t v192 = sub_50F10(v146, v147, &v196);
      sub_53EF0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v143, v144, "%s", v145, 0xCu);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();
    }

    sub_2512C();
    v87();
    uint64_t v155 = *(void (**)(uint64_t, uint64_t))(v183 + 8);
    uint64_t v156 = v185;
    uint64_t v157 = &a18;
    goto LABEL_51;
  }
  uint64_t v115 = sub_1D5D8();
  v116(v115);
  sub_252CC();
  v117();
  sub_6108();
  sub_250D4();
  v91();
  unint64_t v118 = (void *)sub_53DA0();
  os_log_type_t v119 = sub_53E90();
  if (sub_FF7C(v119))
  {
    uint64_t v120 = (_WORD *)sub_61F0();
    sub_61CC(v120);
    sub_FED0(&dword_0, v121, v122, "#EmergencyDirectCallFlow onInput .uso");
    sub_60F0();
  }

  sub_2512C();
  v87();
  sub_53610();
  *((void *)&v190 + 1) = &type metadata for EmergencyFeatureFlagsKey;
  unint64_t v191 = sub_F998();
  LOBYTE(v189) = 2;
  sub_53640();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)&v189);
  uint64_t v123 = v164;
  sub_53CC0();
  sub_1B520(v123, v163, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
  sub_24844();
  unsigned int v103 = v124;
  sub_1B580(v123, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
LABEL_18:
  sub_251C8();
  v125();
  unsigned int v126 = v103 >> 8;
  if (v103 != 4 || BYTE1(v103) != 35)
  {
    if ((v103 & 0x10000) == 0)
    {
      sub_6108();
      sub_250D4();
      v91();
      uint64_t v132 = sub_53DA0();
      os_log_type_t v133 = sub_53EA0();
      if (os_log_type_enabled(v132, v133))
      {
        uint64_t v171 = v54;
        uint64_t v134 = (uint8_t *)sub_1001C();
        uint64_t v135 = sub_15284();
        *(_DWORD *)uint64_t v134 = 136315138;
        uint64_t v195 = v135;
        LOBYTE(v194) = v103;
        *(_WORD *)((char *)&v194 + 1) = BYTE1(v103);
        uint64_t v136 = sub_53E10();
        uint64_t v194 = sub_50F10(v136, v137, &v195);
        sub_53EF0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v132, v133, "#EmergencyDirectCallFlow Not a DirectCall intent. Aborting flow. Intent: [%s]", v134, 0xCu);
        swift_arrayDestroy();
        sub_60F0();
        sub_60F0();
      }

      goto LABEL_36;
    }
LABEL_48:
    uint64_t v160 = v170;
    *(unsigned char *)(v170 + 218) = 1;
    *(_WORD *)(v160 + 216) = v103 | (unsigned __int16)((_WORD)v126 << 8);
    goto LABEL_53;
  }
  sub_6108();
  sub_250D4();
  v91();
  uint64_t v127 = (void *)sub_53DA0();
  os_log_type_t v128 = sub_53E90();
  if (sub_FF7C(v128))
  {
    uint64_t v129 = (_WORD *)sub_61F0();
    sub_61CC(v129);
    sub_FED0(&dword_0, v130, v131, "#EmergencyDirectCallFlow Produced an empty intent. Ignoring input.");
    sub_60F0();
  }

LABEL_36:
  sub_2512C();
  v87();
LABEL_53:
  sub_9638();
}

uint64_t sub_21F78()
{
  sub_10010();
  v1[130] = v0;
  v1[129] = v2;
  uint64_t v3 = sub_53DB0();
  v1[131] = v3;
  v1[132] = *(void *)(v3 - 8);
  v1[133] = swift_task_alloc();
  v1[134] = swift_task_alloc();
  v1[135] = swift_task_alloc();
  return _swift_task_switch(sub_22054, 0, 0);
}

uint64_t sub_22054()
{
  uint64_t v1 = *(void *)(v0 + 1056);
  *(void *)(v0 + 1088) = sub_53D90();
  sub_6108();
  uint64_t v2 = *(void (**)(void))(v1 + 16);
  *(void *)(v0 + 1096) = v2;
  *(void *)(v0 + 1104) = (v1 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  sub_2535C();
  v2();
  uint64_t v3 = (void *)sub_53DA0();
  os_log_type_t v4 = sub_53E90();
  if (sub_1B708(v4))
  {
    uint64_t v5 = (_WORD *)sub_61F0();
    sub_25330(v5);
    sub_25160(&dword_0, v6, v7, "#EmergencyDirectCallFlow execute");
    sub_60F0();
  }
  uint64_t v8 = *(void *)(v0 + 1056);
  uint64_t v9 = *(void *)(v0 + 1040);

  uint64_t v10 = *(void (**)(void))(v8 + 8);
  *(void *)(v0 + 1112) = v10;
  *(void *)(v0 + 1120) = (v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  sub_2533C();
  sub_251C8();
  v10();
  int v11 = *(unsigned __int8 *)(v9 + 218);
  if (v11 == 2)
  {
    uint64_t v12 = *(void *)(v0 + 1040);
    uint64_t v13 = *(void *)(v0 + 1032);
    sub_F824();
    uint64_t v14 = swift_allocError();
    *uint64_t v15 = 2;
    sub_2940(v14, v12 + 16, (void *)(v12 + 56), v13);
    swift_errorRelease();
    goto LABEL_17;
  }
  if (v11 == 3)
  {
    sub_53460();
LABEL_17:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
    return v26();
  }
  __int16 v16 = *(_WORD *)(v9 + 216);
  if (HIBYTE(v16) == 35 && v16 == 4)
  {
LABEL_14:
    uint64_t v20 = *(uint8_t **)(v0 + 1048);
    sub_6108();
    sub_2535C();
    v2();
    uint64_t v21 = sub_53DA0();
    os_log_type_t v22 = sub_53EA0();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (_WORD *)sub_61F0();
      sub_25330(v23);
      _os_log_impl(&dword_0, v21, v22, "#EmergencyDirectCallFlow Intent missing a situation or valid organization", v20, 2u);
      sub_60F0();
    }
    uint64_t v24 = *(void *)(v0 + 1040);

    sub_251C8();
    v10();
    uint64_t v25 = sub_2C00((void *)(v24 + 56), *(void *)(v24 + 80));
    memcpy((void *)(v0 + 656), v25, 0x70uLL);
    sub_2C44(v24 + 16, (const void *)(v0 + 656));
    sub_53450();
    swift_release();
    goto LABEL_17;
  }
  sub_9370();
  if (!*(void *)(v0 + 904))
  {
    sub_14A94(v0 + 880, &qword_6CB20);
    goto LABEL_14;
  }
  uint64_t v17 = *(void *)(v0 + 1040);
  sub_5F28((long long *)(v0 + 880), v0 + 920);
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 1128) = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_223E4;
  return sub_167DC(v0 + 528, v17 + 136, SHIBYTE(v16), v16);
}

uint64_t sub_223E4()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  return _swift_task_switch(sub_224B0, 0, 0);
}

uint64_t sub_224B0()
{
  uint64_t v23 = v0;
  uint64_t v1 = sub_2533C();
  sub_247F4(v1, v2, v3);
  if (sub_F27C((uint64_t)(v0 + 2)) == 1)
  {
    sub_251D4((void *)(v0[130] + 176), *(void *)(v0[130] + 200));
    sub_23E18();
    goto LABEL_13;
  }
  memcpy(v0 + 50, v0 + 2, 0x80uLL);
  memcpy(__dst, v0 + 2, sizeof(__dst));
  if (sub_53C60())
  {
    sub_25204();
    sub_2295C();
LABEL_12:
    sub_F724(v0 + 66);
    goto LABEL_13;
  }
  if (sub_53C70())
  {
    sub_25204();
    sub_23328();
    goto LABEL_12;
  }
  unint64_t v4 = v0[63];
  if ((v4 & 0x2000000000000000) != 0) {
    uint64_t v5 = HIBYTE(v4) & 0xF;
  }
  else {
    uint64_t v5 = v0[62] & 0xFFFFFFFFFFFFLL;
  }
  if (v5)
  {
    sub_25204();
    memcpy(v0 + 34, __dst, 0x80uLL);
    nullsub_1(v0 + 34);
    sub_247F4((uint64_t)(v0 + 34), (uint64_t)(v0 + 18), &qword_6C3B0);
    sub_23E18();
    goto LABEL_12;
  }
  uint64_t v8 = (void (*)(uint64_t, uint64_t, uint64_t))v0[137];
  uint64_t v9 = v0[136];
  uint64_t v10 = v0[134];
  uint64_t v11 = v0[131];
  sub_F724(v0 + 66);
  sub_6108();
  v8(v10, v9, v11);
  uint64_t v12 = sub_53DA0();
  os_log_type_t v13 = sub_53EA0();
  if (sub_1B708(v13))
  {
    uint64_t v14 = (uint8_t *)sub_61F0();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_0, v12, (os_log_type_t)((_BYTE)v0 + 16), "#EmergencyDirectCallFlow OrgInfo had no usable info", v14, 2u);
    sub_60F0();
  }
  uint64_t v15 = (void (*)(uint64_t, uint64_t))v0[139];
  uint64_t v16 = v0[134];
  uint64_t v17 = v0[131];
  uint64_t v18 = v0[130];

  v15(v16, v17);
  uint64_t v19 = sub_2C00((void *)(v18 + 56), *(void *)(v18 + 80));
  memcpy(v0 + 96, v19, 0x70uLL);
  uint64_t v20 = sub_2533C();
  sub_2C44(v20, v21);
LABEL_13:
  sub_53450();
  swift_release();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v0 + 115));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_2277C()
{
  type metadata accessor for EmergencyDirectCallFlow();
  sub_2507C(&qword_6D120, v0, (void (*)(uint64_t))type metadata accessor for EmergencyDirectCallFlow);
  return sub_531E0();
}

uint64_t type metadata accessor for EmergencyDirectCallFlow()
{
  return self;
}

ValueMetadata *type metadata accessor for EmergencyDirectCallFlow.EmergencyDirectCallFlowState()
{
  return &type metadata for EmergencyDirectCallFlow.EmergencyDirectCallFlowState;
}

#error "22850: call analysis failed (funcsize=10)"

uint64_t sub_22864()
{
  return sub_2277C();
}

uint64_t sub_22888()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_DD40;
  return sub_21F78();
}

uint64_t sub_22924()
{
  type metadata accessor for EmergencyDirectCallFlow();

  return sub_53230();
}

void sub_2295C()
{
  sub_15308();
  uint64_t v1 = v0;
  uint64_t v3 = (uint64_t)v2;
  memcpy(v100, v2, sizeof(v100));
  uint64_t v84 = sub_53B50();
  sub_6188();
  __chkstk_darwin(v4);
  sub_6150();
  uint64_t v85 = v5;
  uint64_t v6 = sub_2E18(&qword_6BCB8);
  uint64_t v7 = sub_FEC4(v6);
  __chkstk_darwin(v7);
  sub_6150();
  uint64_t v88 = v8;
  uint64_t v9 = sub_2E18(&qword_6BCA8);
  uint64_t v10 = sub_FEC4(v9);
  __chkstk_darwin(v10);
  uint64_t v83 = (uint64_t)v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_15258();
  __chkstk_darwin(v12);
  sub_152E8();
  uint64_t v89 = v13;
  uint64_t v86 = type metadata accessor for ConfirmationFlowConfigModel();
  sub_6188();
  __chkstk_darwin(v14);
  sub_612C();
  uint64_t v87 = v15;
  sub_15258();
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)v82 - v17;
  sub_53DB0();
  sub_60C0();
  uint64_t v20 = v19;
  __chkstk_darwin(v21);
  sub_612C();
  long long v82[2] = v22;
  sub_15258();
  __chkstk_darwin(v23);
  sub_FF3C();
  v82[1] = v24;
  sub_15258();
  __chkstk_darwin(v25);
  uint64_t v94 = sub_53AD0();
  sub_60C0();
  uint64_t v91 = v26;
  __chkstk_darwin(v27);
  sub_6140();
  uint64_t v30 = v29 - v28;
  swift_bridgeObjectRetain();
  uint64_t v93 = v30;
  sub_53AC0();
  sub_53A10();
  swift_allocObject();
  sub_53A00();
  uint64_t v92 = (const void *)v3;
  sub_539F0();
  swift_release();
  uint64_t v90 = sub_539E0();
  swift_release();
  sub_2C00(v1, v1[3]);
  uint64_t v31 = sub_253A4();
  v32(v31);
  uint64_t v33 = (uint8_t *)v97[3];
  sub_251D4(v97, v97[3]);
  sub_253A4();
  char v34 = sub_533A0();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v97);
  if (v34)
  {
    sub_53D90();
    sub_6108();
    sub_252EC();
    sub_FE98();
    v35();
    uint64_t v36 = sub_53DA0();
    os_log_type_t v37 = sub_53E90();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v33 = (uint8_t *)sub_61F0();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_0, v36, v37, "#EmergencyDirectCallFlow Request made on HomePod. Confirm before calling.", v33, 2u);
      sub_60F0();
    }

    sub_251A0();
    v38();
    sub_3048((uint64_t)v1, (uint64_t)v97);
    sub_3048((uint64_t)(v1 + 5), (uint64_t)&v97[5]);
    memcpy(v98, v100, 0x80uLL);
    sub_1B3B8((uint64_t)v98);
    sub_F87C((uint64_t)v98, (uint64_t)&v97[10]);
    sub_5D2C((uint64_t)v92);
    sub_F8D8();
    uint64_t v39 = sub_531D0();
    sub_F924((uint64_t)v97);
    sub_2C00(v1 + 5, v1[8]);
    sub_252D8();
    uint64_t v40 = v88;
    uint64_t v41 = v94;
    sub_FE98();
    v42();
    sub_34DC(v40, 0, 1, v41);
    swift_retain();
    uint64_t v43 = v89;
    sub_25A64(v40);
    swift_release();
    sub_14A94(v40, &qword_6BCB8);
    sub_2C00(v1 + 5, v1[8]);
    uint64_t v44 = (int *)v86;
    swift_retain();
    sub_25C54();
    swift_release();
    sub_247F4(v43, (uint64_t)v18, &qword_6BCA8);
    *(void *)&v18[v44[6]] = v39;
    *(void *)&v18[v44[7]] = 2;
    v18[v44[8]] = 0;
    v18[v44[9]] = 1;
    sub_3048((uint64_t)v1, (uint64_t)v99);
    sub_3048((uint64_t)(v1 + 5), (uint64_t)v96);
    sub_5920((uint64_t)(v1 + 10), (uint64_t)v95);
    sub_597C((uint64_t)v96, v96[3]);
    sub_60C0();
    __chkstk_darwin(v45);
    sub_6140();
    uint64_t v48 = (const void *)(v47 - v46);
    (*(void (**)(uint64_t))(v49 + 16))(v47 - v46);
    sub_1B520((uint64_t)v18, v87, (void (*)(void))type metadata accessor for ConfirmationFlowConfigModel);
    memcpy(v97, v48, 0x70uLL);
    uint64_t v50 = v92;
    sub_5D2C((uint64_t)v92);
    swift_retain();
    uint64_t v52 = sub_1B7FC(v50, v51, v99, v97, (uint64_t)v95);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v96);
    *(void *)&v99[0] = v52;
    type metadata accessor for EmergencyConfirmationFlow();
    sub_2507C(&qword_6BE80, 255, (void (*)(uint64_t))type metadata accessor for EmergencyConfirmationFlow);
    sub_531D0();
    swift_release();
    swift_release();
    swift_release();
    sub_1B580((uint64_t)v18, (void (*)(void))type metadata accessor for ConfirmationFlowConfigModel);
    (*((void (**)(uint64_t, uint64_t))v33 + 1))(v93, v94);
  }
  else
  {
    sub_2C00(v1, v1[3]);
    uint64_t v53 = sub_25310();
    v54(v53);
    char v55 = sub_43838(v99);
    sub_53D90();
    uint64_t v56 = v20 + 16;
    if (v55)
    {
      sub_6108();
      uint64_t v57 = sub_252A0();
      v58(v57);
      uint64_t v59 = (void *)sub_53DA0();
      os_log_type_t v60 = sub_53E90();
      if (sub_1B708(v60))
      {
        *(_WORD *)sub_61F0() = 0;
        sub_1B7DC(&dword_0, v61, v62, "#EmergencyDirectCallFlow Resource is available. Making the call.");
        sub_60F0();
      }

      uint64_t v63 = sub_25114();
      v64(v63);
      sub_3048((uint64_t)v1, (uint64_t)v97);
      sub_3048((uint64_t)(v1 + 5), (uint64_t)&v97[5]);
      memcpy(v98, v100, 0x80uLL);
      sub_1B3B8((uint64_t)v98);
      sub_F87C((uint64_t)v98, (uint64_t)&v97[10]);
      sub_5D2C((uint64_t)v92);
      sub_F8D8();
      sub_531D0();
      swift_release();
      sub_F924((uint64_t)v97);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v99);
      sub_15450();
      v65();
    }
    else
    {
      sub_6108();
      uint64_t v66 = sub_252A0();
      v67(v66);
      uint64_t v68 = (void *)sub_53DA0();
      os_log_type_t v69 = sub_53E90();
      if (sub_1B708(v69))
      {
        uint64_t v56 = sub_61F0();
        *(_WORD *)uint64_t v56 = 0;
        sub_1B7DC(&dword_0, v70, v71, "#EmergencyDirectCallFlow Request made on device that doesn't support calling. Give supportive dialog.");
        sub_60F0();
      }

      uint64_t v72 = sub_25114();
      v73(v72);
      sub_2C00(v1 + 5, v1[8]);
      sub_252D8();
      uint64_t v74 = v88;
      uint64_t v76 = v93;
      uint64_t v75 = v94;
      sub_FE98();
      v77();
      sub_34DC(v74, 0, 1, v75);
      swift_retain();
      uint64_t v78 = v90;
      swift_retain();
      char v79 = sub_43838(v99);
      uint64_t v80 = v89;
      sub_25878(v74, v78, v79 & 1);
      swift_release();
      swift_release();
      sub_14A94(v74, &qword_6BCB8);
      sub_2FE0(v80, v83);
      sub_3048((uint64_t)v1, (uint64_t)v97);
      uint64_t v81 = v85;
      sub_53B40();
      sub_2507C((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
      sub_531D0();
      swift_release();
      sub_1B580(v81, (void (*)(void))&type metadata accessor for OutputFlow);
      sub_14A94(v80, &qword_6BCA8);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v99);
      (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v76, v75);
    }
  }
  sub_9638();
}

void sub_23328()
{
  sub_15308();
  uint64_t v106 = v0;
  uint64_t v2 = v1;
  uint64_t v4 = (uint64_t)v3;
  memcpy(v115, v3, sizeof(v115));
  uint64_t v102 = sub_53B50();
  sub_6188();
  __chkstk_darwin(v5);
  sub_6150();
  uint64_t v101 = v6;
  uint64_t v93 = type metadata accessor for ConfirmationFlowConfigModel();
  sub_6188();
  __chkstk_darwin(v7);
  sub_612C();
  uint64_t v94 = v8;
  sub_15258();
  __chkstk_darwin(v9);
  sub_152E8();
  uint64_t v95 = v10;
  uint64_t v92 = sub_53B90();
  sub_6188();
  __chkstk_darwin(v11);
  sub_6150();
  uint64_t v91 = v12;
  sub_53DB0();
  sub_60C0();
  uint64_t v104 = v14;
  uint64_t v105 = v13;
  __chkstk_darwin(v13);
  sub_25278();
  uint64_t v17 = (uint8_t *)(v15 - v16);
  uint64_t v19 = __chkstk_darwin(v18);
  sub_25348(v19, v20, v21, v22, v23, v24, v25, v26, v90);
  uint64_t v27 = sub_2E18((uint64_t *)&unk_6DA80);
  uint64_t v28 = sub_FEC4(v27);
  __chkstk_darwin(v28);
  sub_25180(v29, v90);
  sub_53030();
  sub_60C0();
  uint64_t v97 = v31;
  uint64_t v98 = v30;
  __chkstk_darwin(v30);
  sub_612C();
  uint64_t v90 = v32;
  sub_15258();
  __chkstk_darwin(v33);
  sub_152E8();
  uint64_t v103 = v34;
  uint64_t v35 = sub_2E18(&qword_6BCB8);
  uint64_t v36 = sub_FEC4(v35);
  __chkstk_darwin(v36);
  sub_6140();
  uint64_t v39 = v38 - v37;
  uint64_t v40 = sub_2E18(&qword_6BCA8);
  uint64_t v41 = sub_FEC4(v40);
  __chkstk_darwin(v41);
  sub_612C();
  uint64_t v99 = v42;
  sub_15258();
  __chkstk_darwin(v43);
  uint64_t v45 = (char *)&v90 - v44;
  uint64_t v46 = sub_53AD0();
  sub_60C0();
  uint64_t v48 = v47;
  __chkstk_darwin(v49);
  sub_6140();
  uint64_t v52 = v51 - v50;
  uint64_t v100 = (const void *)v4;
  swift_bridgeObjectRetain();
  sub_53AC0();
  uint64_t v53 = v2[3];
  uint64_t v54 = v2[4];
  sub_251D4(v2, v53);
  uint64_t v108 = v48;
  uint64_t v55 = (uint64_t)v45;
  uint64_t v107 = v52;
  sub_FE98();
  v56();
  uint64_t v109 = v46;
  sub_34DC(v39, 0, 1, v46);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 32))(v39, v53, v54);
  uint64_t v57 = v106;
  sub_14A94(v39, &qword_6BCB8);
  memcpy(v116, v115, 0x80uLL);
  nullsub_1(v116);
  sub_247F4((uint64_t)v116, (uint64_t)v114, &qword_6C3B0);
  if ((sub_23C1C((uint64_t)v114) & 1) == 0) {
    goto LABEL_4;
  }
  uint64_t v58 = v96;
  sub_53C40();
  if (sub_5800(v58, 1, v98) == 1)
  {
    sub_14A94(v58, (uint64_t *)&unk_6DA80);
LABEL_4:
    sub_53D90();
    sub_6108();
    sub_252EC();
    sub_FE98();
    v59();
    os_log_type_t v60 = (void *)sub_53DA0();
    os_log_type_t v61 = sub_53E90();
    if (sub_1B708(v61))
    {
      uint64_t v62 = (_WORD *)sub_61F0();
      sub_25330(v62);
      sub_25160(&dword_0, v63, v64, "#EmergencyDirectCallFlow Only website available. Returning orgRequestOnlyWebsite.");
      sub_60F0();
    }

    sub_251C8();
    v65();
    sub_2FE0(v55, v99);
    sub_3048((uint64_t)v57, (uint64_t)v113);
    uint64_t v66 = v101;
    sub_53B40();
    sub_2507C((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
    sub_531D0();
    sub_1B580(v66, (void (*)(void))&type metadata accessor for OutputFlow);
    goto LABEL_10;
  }
  sub_252CC();
  v67();
  sub_53D90();
  sub_6108();
  sub_252EC();
  sub_FE98();
  v68();
  os_log_type_t v69 = sub_53DA0();
  os_log_type_t v70 = sub_53E90();
  if (os_log_type_enabled(v69, v70))
  {
    uint64_t v71 = (_WORD *)sub_61F0();
    sub_61CC(v71);
    _os_log_impl(&dword_0, v69, v70, "#EmergencyDirectCallFlow Only website available for VOX request. Offer to open the org's website.", v17, 2u);
    sub_60F0();
  }

  uint64_t v72 = sub_25114();
  v73(v72);
  sub_2C00(v57, v57[3]);
  uint64_t v74 = sub_25310();
  v75(v74);
  uint64_t v76 = v97;
  sub_25324();
  sub_FE98();
  v77();
  uint64_t v78 = v91;
  sub_53B80();
  sub_2507C(&qword_6CB30, 255, (void (*)(uint64_t))&type metadata accessor for AppPunchOutFlow);
  uint64_t v79 = sub_531D0();
  sub_1B580(v78, (void (*)(void))&type metadata accessor for AppPunchOutFlow);
  sub_2C00(v57 + 5, v57[8]);
  uint64_t v80 = (int *)v93;
  uint64_t v81 = v95;
  swift_retain();
  sub_25C74();
  swift_release();
  sub_2FE0(v55, v81);
  *(void *)(v81 + v80[6]) = v79;
  *(void *)(v81 + v80[7]) = 3;
  *(unsigned char *)(v81 + v80[8]) = 2;
  *(unsigned char *)(v81 + v80[9]) = 1;
  sub_3048((uint64_t)v57, (uint64_t)v112);
  sub_3048((uint64_t)(v57 + 5), (uint64_t)v111);
  sub_5920((uint64_t)(v57 + 10), (uint64_t)v110);
  sub_597C((uint64_t)v111, v111[3]);
  sub_60C0();
  __chkstk_darwin(v82);
  uint64_t v84 = sub_250E8(v83, v90);
  v85(v84);
  sub_1B520(v81, v94, (void (*)(void))type metadata accessor for ConfirmationFlowConfigModel);
  memcpy(v113, v57 + 5, sizeof(v113));
  swift_retain();
  uint64_t v86 = v100;
  sub_5D2C((uint64_t)v100);
  uint64_t v88 = sub_1B7FC(v86, v87, v112, v113, (uint64_t)v110);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v111);
  *(void *)&v112[0] = v88;
  type metadata accessor for EmergencyConfirmationFlow();
  sub_2507C(&qword_6BE80, 255, (void (*)(uint64_t))type metadata accessor for EmergencyConfirmationFlow);
  sub_531D0();
  swift_release();
  swift_release();
  sub_1B580(v81, (void (*)(void))type metadata accessor for ConfirmationFlowConfigModel);
  (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v103, v98);
LABEL_10:
  sub_14A94(v55, &qword_6BCA8);
  sub_15450();
  v89();
  sub_9638();
}

uint64_t sub_23C1C(uint64_t a1)
{
  sub_247F4(a1, (uint64_t)__src, &qword_6C3B0);
  if (sub_F27C((uint64_t)__src) == 1) {
    goto LABEL_9;
  }
  memcpy(__dst, __src, sizeof(__dst));
  if ((sub_53C70() & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_2C00(v1, v2);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v3 + 8))(v13, v2, v3);
  sub_2C00(v13, v14);
  char v4 = sub_533A0();
  sub_3048((uint64_t)v13, (uint64_t)v12);
  if (v4)
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v12);
    sub_3048((uint64_t)v13, (uint64_t)v11);
LABEL_6:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v11);
    sub_3048((uint64_t)v13, (uint64_t)v10);
    goto LABEL_7;
  }
  sub_2C00(v12, v12[3]);
  char v5 = sub_53390();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v12);
  sub_3048((uint64_t)v13, (uint64_t)v11);
  if (v5) {
    goto LABEL_6;
  }
  sub_2C00(v11, v11[3]);
  char v8 = sub_53370();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v11);
  sub_3048((uint64_t)v13, (uint64_t)v10);
  if ((v8 & 1) == 0)
  {
    sub_2C00(v10, v10[3]);
    char v9 = sub_53380();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v10);
    if ((v9 & 1) == 0)
    {
      sub_2C00(v13, v14);
      char v6 = sub_533C0();
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v13);
      return v6 & 1;
    }
    goto LABEL_8;
  }
LABEL_7:
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v10);
LABEL_8:
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v13);
LABEL_9:
  char v6 = 0;
  return v6 & 1;
}

void sub_23E18()
{
  sub_15308();
  uint64_t v80 = v1;
  uint64_t v3 = v2;
  sub_247F4(v2, (uint64_t)v85, &qword_6C3B0);
  sub_247F4((uint64_t)v85, (uint64_t)v90, &qword_6C3B0);
  uint64_t v79 = sub_53B50();
  sub_6188();
  __chkstk_darwin(v4);
  sub_25180(v5, v72[0]);
  uint64_t v73 = type metadata accessor for ConfirmationFlowConfigModel();
  sub_6188();
  __chkstk_darwin(v6);
  uint64_t v74 = (uint64_t)v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_15258();
  __chkstk_darwin(v8);
  sub_152E8();
  uint64_t v75 = v9;
  uint64_t v10 = sub_2E18(&qword_6BCB8);
  uint64_t v11 = sub_FEC4(v10);
  __chkstk_darwin(v11);
  sub_25278();
  uint64_t v14 = v12 - v13;
  uint64_t v16 = __chkstk_darwin(v15);
  sub_25348(v16, v17, v18, v19, v20, v21, v22, v23, v72[0]);
  uint64_t v24 = sub_2E18(&qword_6BCA8);
  uint64_t v25 = sub_FEC4(v24);
  __chkstk_darwin(v25);
  sub_612C();
  uint64_t v77 = v26;
  sub_15258();
  uint64_t v28 = __chkstk_darwin(v27);
  uint64_t v30 = (char *)v72 - v29;
  __chkstk_darwin(v28);
  sub_152E8();
  uint64_t v76 = v31;
  sub_53DB0();
  sub_60C0();
  __chkstk_darwin(v32);
  sub_25278();
  __chkstk_darwin(v33);
  uint64_t v81 = v0;
  if ((sub_24630(v3) & 1) != 0
    && (sub_247F4(v3, (uint64_t)v88, &qword_6C3B0), sub_F27C((uint64_t)v88) != 1))
  {
    memcpy(v89, v88, sizeof(v89));
    sub_247F4((uint64_t)v90, (uint64_t)v87, &qword_6C3B0);
    sub_5D2C((uint64_t)v87);
    sub_53D90();
    sub_6108();
    sub_25324();
    sub_FE98();
    v45();
    uint64_t v46 = (void *)sub_53DA0();
    os_log_type_t v47 = sub_53E90();
    if (sub_1B708(v47))
    {
      uint64_t v48 = (_WORD *)sub_61F0();
      sub_25330(v48);
      sub_25160(&dword_0, v49, v50, "#EmergencyDirectCallFlow No resource available for VOX request. Offer to search the web.");
      sub_60F0();
    }

    sub_251C8();
    v51();
    sub_251D4(v80, v80[3]);
    uint64_t v52 = v89[12];
    uint64_t v53 = v89[13];
    swift_bridgeObjectRetain();
    uint64_t v54 = v72[1];
    sub_2533C();
    sub_53AC0();
    uint64_t v55 = sub_53AD0();
    sub_34DC(v54, 0, 1, v55);
    uint64_t v56 = sub_253A4();
    v57(v56);
    sub_14A94(v54, &qword_6BCB8);
    uint64_t v58 = v81;
    uint64_t v59 = v81[4];
    sub_251D4(v81, v81[3]);
    os_log_type_t v60 = *(void (**)(uint64_t))(v59 + 16);
    swift_bridgeObjectRetain();
    uint64_t v61 = sub_253A4();
    v60(v61);
    v86[0] = v52;
    v86[1] = v53;
    sub_1B480();
    uint64_t v62 = sub_531D0();
    sub_1B4CC((uint64_t)v86);
    sub_2C00(v58 + 5, v58[8]);
    uint64_t v63 = (int *)v73;
    uint64_t v64 = v75;
    swift_retain();
    sub_25C74();
    swift_release();
    uint64_t v65 = v76;
    sub_2FE0(v76, v64);
    *(void *)(v64 + v63[6]) = v62;
    *(void *)(v64 + v63[7]) = 4;
    *(unsigned char *)(v64 + v63[8]) = 1;
    *(unsigned char *)(v64 + v63[9]) = 1;
    sub_3048((uint64_t)v58, (uint64_t)v84);
    sub_3048((uint64_t)(v58 + 5), (uint64_t)v83);
    sub_5920((uint64_t)(v58 + 10), (uint64_t)v82);
    sub_597C((uint64_t)v83, v83[3]);
    sub_60C0();
    __chkstk_darwin(v66);
    uint64_t v68 = sub_250E8(v67, v72[0]);
    v69(v68);
    sub_1B520(v64, v74, (void (*)(void))type metadata accessor for ConfirmationFlowConfigModel);
    memcpy(v86, v58 + 5, 0x70uLL);
    swift_retain();
    uint64_t v71 = sub_1B7FC(v89, v70, v84, v86, (uint64_t)v82);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v83);
    *(void *)&v84[0] = v71;
    type metadata accessor for EmergencyConfirmationFlow();
    sub_2507C(&qword_6BE80, 255, (void (*)(uint64_t))type metadata accessor for EmergencyConfirmationFlow);
    sub_531D0();
    swift_release();
    swift_release();
    sub_1B580(v64, (void (*)(void))type metadata accessor for ConfirmationFlowConfigModel);
    uint64_t v44 = v65;
  }
  else
  {
    sub_53D90();
    sub_6108();
    sub_25324();
    sub_FE98();
    v34();
    uint64_t v35 = sub_53DA0();
    os_log_type_t v36 = sub_53E90();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)sub_61F0();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_0, v35, v36, "#EmergencyDirectCallFlow No resource available. Returning orgRequestNoResource.", v37, 2u);
      sub_60F0();
    }

    sub_251C8();
    v38();
    uint64_t v39 = v80[3];
    uint64_t v40 = v80[4];
    sub_251D4(v80, v39);
    sub_247F4(v3, (uint64_t)v89, &qword_6C3B0);
    if (sub_F27C((uint64_t)v89) == 1)
    {
      uint64_t v41 = 1;
    }
    else
    {
      sub_53E20();
      uint64_t v41 = 0;
    }
    uint64_t v42 = sub_53AD0();
    sub_34DC(v14, v41, 1, v42);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 24))(v14, v39, v40);
    sub_14A94(v14, &qword_6BCB8);
    sub_2FE0((uint64_t)v30, v77);
    sub_3048((uint64_t)v81, (uint64_t)v84);
    sub_247F4(v3, (uint64_t)v86, &qword_6C3B0);
    if (sub_F27C((uint64_t)v86) != 1)
    {
      memcpy(v87, v86, sizeof(v87));
      sub_53C50();
    }
    uint64_t v43 = v78;
    sub_53B40();
    sub_2507C((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
    sub_531D0();
    sub_1B580(v43, (void (*)(void))&type metadata accessor for OutputFlow);
    uint64_t v44 = (uint64_t)v30;
  }
  sub_14A94(v44, &qword_6BCA8);
  sub_9638();
}

uint64_t sub_24630(uint64_t a1)
{
  sub_247F4(a1, (uint64_t)v13, &qword_6C3B0);
  if (sub_F27C((uint64_t)v13) == 1) {
    return 0;
  }
  if (!((v15 & 0x2000000000000000) != 0 ? HIBYTE(v15) & 0xF : v14 & 0xFFFFFFFFFFFFLL)) {
    return 0;
  }
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  sub_2C00(v1, v3);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v4 + 8))(v12, v3, v4);
  sub_2C00(v12, v12[3]);
  LOBYTE(v3) = sub_533A0();
  sub_3048((uint64_t)v12, (uint64_t)v11);
  if (v3)
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v11);
    sub_3048((uint64_t)v12, (uint64_t)v10);
LABEL_9:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v10);
    sub_3048((uint64_t)v12, (uint64_t)v9);
    goto LABEL_10;
  }
  sub_2C00(v11, v11[3]);
  char v5 = sub_53390();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v11);
  sub_3048((uint64_t)v12, (uint64_t)v10);
  if (v5) {
    goto LABEL_9;
  }
  sub_2C00(v10, v10[3]);
  char v7 = sub_53370();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v10);
  sub_3048((uint64_t)v12, (uint64_t)v9);
  if ((v7 & 1) == 0)
  {
    sub_2C00(v9, v9[3]);
    char v8 = sub_53380();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v9);
    if ((v8 & 1) == 0)
    {
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v12);
      return 1;
    }
    goto LABEL_11;
  }
LABEL_10:
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v9);
LABEL_11:
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v12);
  return 0;
}

uint64_t sub_247F4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_2E18(a3);
  sub_6188();
  uint64_t v4 = sub_252B8();
  v5(v4);
  return a2;
}

void sub_24844()
{
  sub_15308();
  uint64_t v2 = v1;
  uint64_t v3 = sub_53DB0();
  sub_60C0();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_25288();
  uint64_t v7 = sub_53CD0();
  v20[3] = v7;
  void v20[4] = (uint64_t)&protocol witness table for EmergencyDialogAct;
  char v8 = sub_5DC4(v20);
  sub_25028(v2, (uint64_t)v8, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
  sub_53D90();
  sub_6108();
  sub_FE98();
  v9();
  sub_3048((uint64_t)v20, (uint64_t)v19);
  uint64_t v10 = sub_53DA0();
  os_log_type_t v11 = sub_53E90();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (_DWORD *)sub_1001C();
    uint64_t v18 = sub_15284();
    _DWORD *v12 = 136315138;
    sub_3048((uint64_t)v19, (uint64_t)&v17);
    sub_2E18(&qword_6C3E0);
    uint64_t v13 = sub_53E10();
    uint64_t v17 = sub_50F10(v13, v14, &v18);
    sub_53EF0();
    swift_bridgeObjectRelease();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v19);
    sub_25370(&dword_0, v15, v16, "Converting EmergencyDialogAct to EmergencyCallIntent: %s");
    sub_25238();
    sub_60F0();
    sub_60F0();

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0, v3);
  }
  else
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v19);

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0, v3);
  }
  switch(*((unsigned char *)v8 + *(int *)(v7 + 20)))
  {
    case 1:
    case 2:
    case 3:
    case 4:
      goto LABEL_9;
    case 5:
      sub_25220();
      goto LABEL_9;
    case 6:
      sub_251AC();
      goto LABEL_9;
    case 7:
      sub_2513C();
LABEL_9:
      sub_25254();
      sub_252F8();
      break;
    case 8:
      break;
    default:
      swift_bridgeObjectRelease();
      break;
  }
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v20);
  sub_9638();
}

void sub_24B38()
{
  sub_15308();
  uint64_t v1 = v0;
  uint64_t v2 = sub_53DB0();
  sub_60C0();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for EmergencyNLIntent();
  uint64_t v29 = v8;
  uint64_t v30 = sub_2507C(&qword_6C3E8, 255, (void (*)(uint64_t))type metadata accessor for EmergencyNLIntent);
  uint64_t v9 = sub_5DC4(v28);
  sub_25028(v1, (uint64_t)v9, (void (*)(void))type metadata accessor for EmergencyNLIntent);
  sub_53D90();
  sub_6108();
  sub_FE98();
  v10();
  sub_3048((uint64_t)v28, (uint64_t)v27);
  os_log_type_t v11 = sub_53DA0();
  os_log_type_t v12 = sub_53E90();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v23 = v2;
    uint64_t v13 = sub_1001C();
    uint64_t v24 = v8;
    unint64_t v14 = (_DWORD *)v13;
    uint64_t v26 = sub_15284();
    *unint64_t v14 = 136315138;
    v22[1] = v14 + 1;
    sub_2C00(v27, v27[3]);
    v22[0] = v22;
    sub_60C0();
    __chkstk_darwin(v15);
    sub_25288();
    (*(void (**)(char *))(v16 + 16))(v7);
    uint64_t v17 = sub_3F488();
    unint64_t v19 = v18;
    sub_1B580((uint64_t)v7, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    uint64_t v25 = sub_50F10(v17, v19, &v26);
    sub_53EF0();
    swift_bridgeObjectRelease();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v27);
    sub_25370(&dword_0, v20, v21, "Converting EmergencyNLIntent: %s");
    sub_25238();
    sub_60F0();
    sub_60F0();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v23);
  }
  else
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v27);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
  }
  sub_251D4(v28, v29);
  if (qword_6B918 != -1) {
    swift_once();
  }
  sub_2507C(&qword_6C0B0, 255, (void (*)(uint64_t))type metadata accessor for EmergencyNLIntent);
  sub_537F0();
  sub_251D4(v28, v29);
  if (qword_6B908 != -1) {
    swift_once();
  }
  sub_537F0();
  sub_251D4(v28, v29);
  if (qword_6B900 != -1) {
    swift_once();
  }
  sub_537F0();
  switch(LOBYTE(v27[0]))
  {
    case 1:
    case 2:
    case 3:
    case 4:
      goto LABEL_15;
    case 5:
      sub_25220();
      goto LABEL_15;
    case 6:
      sub_251AC();
      goto LABEL_15;
    case 7:
      sub_2513C();
LABEL_15:
      sub_25254();
      sub_252F8();
      break;
    case 8:
      break;
    default:
      swift_bridgeObjectRelease();
      break;
  }
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v28);
  sub_9638();
}

uint64_t sub_25028(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_6188();
  uint64_t v4 = sub_252B8();
  v5(v4);
  return a2;
}

uint64_t sub_2507C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

ValueMetadata *type metadata accessor for EmergencyDirectCallFlowFollowupProvider()
{
  return &type metadata for EmergencyDirectCallFlowFollowupProvider;
}

char *sub_250E8@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_25114()
{
  return v0;
}

uint64_t sub_2513C()
{
  return 0x6978456B63656863;
}

void sub_25160(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_25180@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 + 56) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return 0;
}

uint64_t sub_251AC()
{
  return 0x736972616D6D7573;
}

void *sub_251D4(void *a1, uint64_t a2)
{
  return sub_2C00(a1, a2);
}

uint64_t sub_251EC()
{
  return v0;
}

void *sub_25204()
{
  uint64_t v2 = *(void *)(v0 + 1040);
  uint64_t v3 = *(void *)(v2 + 200);
  return sub_2C00((void *)(v2 + 176), v3);
}

uint64_t sub_25220()
{
  return 0x656C6261736964;
}

uint64_t sub_25238()
{
  return swift_arrayDestroy();
}

uint64_t sub_25254()
{
  return sub_53FE0();
}

uint64_t sub_252A0()
{
  return v0;
}

uint64_t sub_252B8()
{
  return v0;
}

uint64_t sub_252F8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25310()
{
  return v0;
}

_WORD *sub_25330(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t sub_2533C()
{
  return v0;
}

void sub_25348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 + 8) = (char *)&a9 - v9;
}

void sub_25370(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_25390()
{
  return v0;
}

uint64_t sub_253A4()
{
  return v0;
}

uint64_t sub_253B0(uint64_t a1, char a2)
{
  return sub_A6A8(a2);
}

uint64_t sub_253B8(uint64_t a1, char a2)
{
  return sub_253B0(a1, a2);
}

uint64_t type metadata accessor for SirenCATs()
{
  uint64_t result = qword_6D128;
  if (!qword_6D128) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25424()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25464()
{
  return sub_25728();
}

uint64_t sub_25484()
{
  return sub_25728();
}

uint64_t sub_254A4()
{
  return sub_25728();
}

uint64_t sub_254C4()
{
  return sub_25728();
}

uint64_t sub_254E4()
{
  return sub_25728();
}

uint64_t sub_25504()
{
  return sub_25728();
}

uint64_t sub_25524()
{
  return sub_25728();
}

uint64_t sub_25544()
{
  return sub_25728();
}

uint64_t sub_25564(uint64_t a1, uint64_t a2)
{
  return sub_255B8(a1, a2);
}

uint64_t sub_255B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_53B30();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v8 - 8);
  sub_9A10(a1, (uint64_t)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v10 = sub_53A50();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_9A78(a1);
  return v10;
}

uint64_t sub_25720()
{
  return type metadata accessor for SirenCATs();
}

uint64_t sub_25728()
{
  return sub_53A60();
}

uint64_t type metadata accessor for EmergencyCATs()
{
  uint64_t result = qword_6D178;
  if (!qword_6D178) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25778()
{
  return swift_initClassMetadata2();
}

uint64_t sub_257B8()
{
  return sub_25728();
}

uint64_t sub_257D8()
{
  return sub_25728();
}

uint64_t sub_257F8()
{
  return sub_25728();
}

uint64_t sub_25818()
{
  return sub_25728();
}

uint64_t sub_25838()
{
  return sub_25728();
}

uint64_t sub_25858()
{
  return sub_25728();
}

uint64_t sub_25878(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = sub_2E18(&qword_6BCB8);
  __chkstk_darwin(v7 - 8);
  sub_7D34();
  sub_2E18(&qword_6BF00);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_547E0;
  uint64_t v9 = (uint64_t *)(v8 + 48);
  sub_25E5C(v8);
  sub_7C74(a1, v3, &qword_6BCB8);
  uint64_t v10 = sub_53AD0();
  if (sub_5800(v3, 1, v10) == 1)
  {
    sub_7CD4(v3, &qword_6BCB8);
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v8 + 64) = 0u;
  }
  else
  {
    *(void *)(v8 + 72) = v10;
    sub_5DC4(v9);
    sub_7D4C();
    (*(void (**)(void))(v11 + 32))();
  }
  *(void *)(v8 + 80) = 0x65626D754E67726FLL;
  *(void *)(v8 + 88) = 0xE900000000000072;
  if (a2)
  {
    uint64_t v12 = sub_53A20();
    uint64_t v13 = a2;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    *(void *)(v8 + 104) = 0;
    *(void *)(v8 + 112) = 0;
  }
  *(void *)(v8 + 96) = v13;
  *(void *)(v8 + 120) = v12;
  *(void *)(v8 + 128) = 0xD000000000000012;
  *(void *)(v8 + 136) = 0x80000000000575A0;
  *(void *)(v8 + 168) = &type metadata for Bool;
  *(unsigned char *)(v8 + 144) = a3 & 1;
  swift_retain();
  sub_53A60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A64(uint64_t a1)
{
  uint64_t v2 = sub_2E18(&qword_6BCB8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2E18(&qword_6BF00);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_547B0;
  uint64_t v6 = (uint64_t *)(v5 + 48);
  sub_25E5C(v5);
  sub_7C74(a1, (uint64_t)v4, &qword_6BCB8);
  uint64_t v7 = sub_53AD0();
  if (sub_5800((uint64_t)v4, 1, v7) == 1)
  {
    sub_7CD4((uint64_t)v4, &qword_6BCB8);
    *(_OWORD *)uint64_t v6 = 0u;
    *(_OWORD *)(v5 + 64) = 0u;
  }
  else
  {
    *(void *)(v5 + 72) = v7;
    sub_5DC4(v6);
    sub_7D4C();
    (*(void (**)(void))(v8 + 32))();
  }
  sub_53A60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25BD4()
{
  return sub_25728();
}

uint64_t sub_25BF4()
{
  return sub_25728();
}

uint64_t sub_25C14()
{
  return sub_25728();
}

uint64_t sub_25C34()
{
  return sub_25728();
}

uint64_t sub_25C54()
{
  return sub_25728();
}

uint64_t sub_25C74()
{
  return sub_25728();
}

uint64_t sub_25C94(uint64_t a1, uint64_t a2)
{
  return sub_25CE8(a1, a2);
}

uint64_t sub_25CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_53B30();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_7D34();
  uint64_t v7 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v7 - 8);
  sub_7C74(a1, (uint64_t)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t *)&unk_6DA80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, a2, v5);
  uint64_t v9 = sub_53A50();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v5);
  sub_7CD4(a1, (uint64_t *)&unk_6DA80);
  return v9;
}

uint64_t sub_25E54()
{
  return type metadata accessor for EmergencyCATs();
}

uint64_t sub_25E5C(uint64_t result)
{
  *(void *)(result + 32) = 0x656D614E67726FLL;
  *(void *)(result + 40) = 0xE700000000000000;
  return result;
}

uint64_t type metadata accessor for EmergencySuicidePreventionBasicIntentModernCATs()
{
  uint64_t result = qword_6D1C8;
  if (!qword_6D1C8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25EC0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_25F00(uint64_t a1, uint64_t a2)
{
  return sub_25F54(a1, a2);
}

uint64_t sub_25F54(uint64_t a1, uint64_t a2)
{
  sub_53B30();
  sub_9AD8();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_6140();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v11 - 8);
  sub_6140();
  sub_9A10(a1, v13 - v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v10, a2, v2);
  uint64_t v14 = sub_53AE0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v2);
  sub_9A78(a1);
  return v14;
}

uint64_t sub_26080(uint64_t a1, uint64_t a2)
{
  sub_53B30();
  sub_9AD8();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_6140();
  uint64_t v9 = v8 - v7;
  swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v9, a2, v2);
  uint64_t v10 = sub_53AF0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v2);
  return v10;
}

uint64_t sub_2615C()
{
  return type metadata accessor for EmergencySuicidePreventionBasicIntentModernCATs();
}

uint64_t type metadata accessor for DomesticViolenceModernCATs()
{
  uint64_t result = qword_6D218;
  if (!qword_6D218) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_261AC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_261EC(uint64_t a1, uint64_t a2)
{
  return sub_26240(a1, a2);
}

uint64_t sub_26240(uint64_t a1, uint64_t a2)
{
  sub_53B30();
  sub_9AD8();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_6140();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v11 - 8);
  sub_6140();
  sub_9A10(a1, v13 - v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v10, a2, v2);
  uint64_t v14 = sub_53AE0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v2);
  sub_9A78(a1);
  return v14;
}

uint64_t sub_2636C(uint64_t a1, uint64_t a2)
{
  sub_53B30();
  sub_9AD8();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_6140();
  uint64_t v9 = v8 - v7;
  swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v9, a2, v2);
  uint64_t v10 = sub_53AF0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v2);
  return v10;
}

uint64_t sub_26448()
{
  return type metadata accessor for DomesticViolenceModernCATs();
}

uint64_t sub_26450(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v28)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  void (*v33)(void);
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)();
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t, const void *);
  char *v56;
  void *v57;
  os_log_type_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const void *v76;
  uint64_t v77;
  uint64_t *v78;
  void *v79;
  unsigned char v80[64];
  uint64_t v81[5];
  unsigned char v82[128];
  unsigned char v83[128];
  void v84[16];
  unsigned char v85[128];
  void v86[16];
  long long v87[7];
  unsigned char v88[136];

  uint64_t v4 = v3;
  uint64_t v78 = (uint64_t *)a2;
  uint64_t v79 = a3;
  sub_1B3C0(a2, (uint64_t)v82, &qword_6C3B0);
  sub_1B3C0((uint64_t)v82, (uint64_t)v88, &qword_6C3B0);
  uint64_t v74 = sub_53B50();
  sub_6188();
  __chkstk_darwin(v5);
  sub_6150();
  uint64_t v73 = v6;
  sub_53DB0();
  sub_60C0();
  uint64_t v76 = v7;
  uint64_t v77 = v8;
  __chkstk_darwin(v7);
  sub_2824C(v9, v66);
  __chkstk_darwin(v10);
  uint64_t v67 = (char *)&v66 - v11;
  uint64_t v12 = sub_2E18(&qword_6D268);
  uint64_t v13 = sub_FEC4(v12);
  __chkstk_darwin(v13);
  sub_6150();
  uint64_t v71 = v14;
  uint64_t v70 = type metadata accessor for ConfirmationFlowConfigModel();
  sub_6188();
  __chkstk_darwin(v15);
  sub_612C();
  uint64_t v68 = v16;
  sub_15258();
  __chkstk_darwin(v17);
  os_log_type_t v69 = (uint64_t)&v66 - v18;
  uint64_t v19 = sub_2E18(&qword_6BCA8);
  uint64_t v20 = sub_FEC4(v19);
  __chkstk_darwin(v20);
  sub_612C();
  uint64_t v72 = v21;
  sub_15258();
  __chkstk_darwin(v22);
  uint64_t v24 = (char *)&v66 - v23;
  uint64_t v25 = v3[14];
  sub_2C00(v4 + 10, v4[13]);
  uint64_t v26 = v3[3];
  uint64_t v27 = v3[4];
  sub_2C00(v4, v4[3]);
  uint64_t v28 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v27 + 8);
  uint64_t v29 = v26;
  uint64_t v30 = (uint64_t)v24;
  uint64_t v31 = v27;
  uint64_t v32 = v76;
  v28(v86, v29, v31);
  uint64_t v33 = *(void (**)(void))(v25 + 56);
  uint64_t v79 = v3 + 5;
  uint64_t v34 = v77;
  uint64_t v35 = v75;
  os_log_type_t v36 = v78;
  v33();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v86);
  sub_1B3C0((uint64_t)v36, (uint64_t)v85, &qword_6C3B0);
  if (sub_F27C((uint64_t)v85) == 1) {
    goto LABEL_4;
  }
  uint64_t v37 = v34;
  uint64_t v38 = v32;
  memcpy(v86, v85, sizeof(v86));
  sub_1B3C0((uint64_t)v88, (uint64_t)v84, &qword_6C3B0);
  sub_5D2C((uint64_t)v84);
  uint64_t v39 = v71;
  sub_26BB0(v86, v30, v71);
  if (sub_5800(v39, 1, v70) == 1)
  {
    sub_F724(v36);
    sub_5884(v39, &qword_6D268);
    uint64_t v32 = v38;
LABEL_4:
    uint64_t v40 = sub_53D90();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, const void *))(v34 + 16))(v35, v40, v32);
    uint64_t v41 = (void *)sub_53DA0();
    uint64_t v42 = sub_53E90();
    if (sub_1B708(v42))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      sub_25160(&dword_0, v43, v44, "Emergency followup flow preparing promptless output");
      sub_282C8();
    }

    (*(void (**)(uint64_t, const void *))(v34 + 8))(v35, v32);
    sub_13C00(v30, v72, &qword_6BCA8);
    uint64_t v45 = v4[3];
    uint64_t v46 = v4[4];
    sub_2C00(v4, v45);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v46 + 8))(v84, v45, v46);
    os_log_type_t v47 = sub_2C00(v79, v4[8]);
    memcpy(v87, v47, sizeof(v87));
    sub_277D8((uint64_t)v36, v84, v87);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v84);
    sub_3048((uint64_t)v4, (uint64_t)v81);
    sub_1B3C0((uint64_t)v36, (uint64_t)v83, &qword_6C3B0);
    if (sub_F27C((uint64_t)v83) != 1)
    {
      memcpy(v84, v83, sizeof(v84));
      sub_53C50();
    }
    uint64_t v48 = v73;
    sub_53B40();
    sub_27DD4((unint64_t *)&qword_6BCB0, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
    uint64_t v49 = sub_531D0();
    uint64_t v50 = (uint64_t (*)())&type metadata accessor for OutputFlow;
    uint64_t v51 = v48;
    goto LABEL_12;
  }
  uint64_t v52 = v39;
  uint64_t v53 = v69;
  sub_27CFC(v52, v69);
  uint64_t v54 = sub_53D90();
  swift_beginAccess();
  uint64_t v55 = *(void (**)(char *, uint64_t, const void *))(v34 + 16);
  uint64_t v56 = v67;
  v55(v67, v54, v38);
  uint64_t v57 = (void *)sub_53DA0();
  uint64_t v58 = sub_53E90();
  if (sub_1B708(v58))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    sub_25160(&dword_0, v59, v60, "Emergency followup flow preparing for confirmation");
    sub_282C8();
  }

  (*(void (**)(char *, const void *))(v37 + 8))(v56, v38);
  sub_3048((uint64_t)v4, (uint64_t)v87);
  sub_3048((uint64_t)v79, (uint64_t)v81);
  sub_5920((uint64_t)(v4 + 15), (uint64_t)v80);
  sub_597C((uint64_t)v81, v81[3]);
  sub_60C0();
  __chkstk_darwin(v61);
  sub_1B794();
  (*(void (**)(const void *))(v62 + 16))(v38);
  uint64_t v63 = v68;
  sub_27D60(v53, v68);
  memcpy(v83, v38, 0x70uLL);
  uint64_t v64 = sub_51858(v86, v63, v87, v83, (uint64_t)v80, 0, 0, 0);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v81);
  *(void *)&v87[0] = v64;
  type metadata accessor for EmergencyConfirmationFlow();
  sub_27DD4(&qword_6BE80, (void (*)(uint64_t))type metadata accessor for EmergencyConfirmationFlow);
  uint64_t v49 = sub_531D0();
  swift_release();
  uint64_t v50 = type metadata accessor for ConfirmationFlowConfigModel;
  uint64_t v51 = v53;
LABEL_12:
  sub_27E1C(v51, (void (*)(void))v50);
  sub_5884(v30, &qword_6BCA8);
  return v49;
}

uint64_t sub_26BB0@<X0>(void *__src@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void (*v17)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(void *, unsigned char *, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t);
  uint64_t v47;
  uint64_t result;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t);
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69[2];
  void (*v70)(uint64_t *__return_ptr, uint64_t, uint64_t);
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void v80[2];
  uint64_t v81[3];
  uint64_t v82;
  uint64_t v83;
  unsigned char v84[136];
  unsigned char v85[40];
  unsigned char __dst[128];

  uint64_t v5 = v3;
  uint64_t v74 = a2;
  uint64_t v78 = a3;
  memcpy(__dst, __src, sizeof(__dst));
  uint64_t v7 = sub_2E18(&qword_6BCA8);
  sub_6188();
  __chkstk_darwin(v8);
  sub_612C();
  uint64_t v75 = v9;
  sub_15258();
  __chkstk_darwin(v10);
  uint64_t v73 = (uint64_t)v69 - v11;
  sub_15258();
  __chkstk_darwin(v12);
  uint64_t v72 = (uint64_t)v69 - v13;
  uint64_t v14 = sub_2E18((uint64_t *)&unk_6DA80);
  uint64_t v15 = sub_FEC4(v14);
  __chkstk_darwin(v15);
  sub_1B794();
  uint64_t v71 = (void *)sub_53B90();
  sub_6188();
  __chkstk_darwin(v16);
  sub_6150();
  uint64_t v70 = v17;
  uint64_t v18 = sub_2E18(&qword_6D270);
  uint64_t v19 = sub_FEC4(v18);
  __chkstk_darwin(v19);
  sub_2824C(v20, v69[0]);
  uint64_t v22 = __chkstk_darwin(v21);
  uint64_t v24 = (char *)v69 - v23;
  __chkstk_darwin(v22);
  uint64_t v26 = (char *)v69 - v25;
  sub_2C00(v3, v3[3]);
  uint64_t v27 = sub_28304();
  v28(v27);
  uint64_t v76 = v7;
  sub_34DC((uint64_t)v26, 1, 1, v7);
  uint64_t v29 = v3 + 10;
  uint64_t v31 = v3[13];
  uint64_t v30 = v3[14];
  sub_2C00(v3 + 10, v31);
  uint64_t v32 = *(uint64_t (**)(void *, unsigned char *, uint64_t, uint64_t))(v30 + 8);
  uint64_t v79 = (uint64_t)__src;
  if (v32(__src, v85, v31, v30))
  {
    sub_3048((uint64_t)v3, (uint64_t)v80);
    sub_3048((uint64_t)(v3 + 5), (uint64_t)&v82);
    memcpy(v84, __dst, 0x80uLL);
    sub_1B3B8((uint64_t)v84);
    sub_F87C((uint64_t)v84, (uint64_t)&v83);
    uint64_t v33 = v79;
    sub_5D2C(v79);
    sub_F8D8();
    uint64_t v34 = sub_531D0();
    sub_F924((uint64_t)v80);
    sub_2C00(v3 + 5, v3[8]);
    swift_retain();
    sub_25C54();
    swift_release();
    sub_5884((uint64_t)v26, &qword_6D270);
    uint64_t v35 = v76;
    sub_34DC((uint64_t)v24, 0, 1, v76);
    sub_1B3C0((uint64_t)v24, (uint64_t)v26, &qword_6D270);
    os_log_type_t v36 = v3[13];
    uint64_t v37 = v3[14];
    sub_282E4(v29);
    LODWORD(v79) = (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t, uint64_t))(v38 + 32))(v33, v85, v36, v37);
    uint64_t v39 = 0;
    uint64_t v40 = 2;
    uint64_t v41 = v78;
    uint64_t v29 = (void *)v35;
LABEL_9:
    uint64_t v59 = v77;
    sub_13C00((uint64_t)v26, v77, &qword_6D270);
    if (sub_5800(v59, 1, (uint64_t)v29) != 1)
    {
      os_log_type_t v60 = v72;
      sub_1B3C0(v59, v72, &qword_6BCA8);
      uint64_t v61 = v39;
      uint64_t v62 = v34;
      uint64_t v63 = v73;
      sub_13C00(v74, v73, &qword_6BCA8);
      uint64_t v64 = v75;
      sub_1B3C0(v60, v75, &qword_6BCA8);
      sub_5884((uint64_t)v26, &qword_6D270);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v85);
      sub_1B3C0(v63, v41, &qword_6BCA8);
      uint64_t v65 = (int *)type metadata accessor for ConfirmationFlowConfigModel();
      sub_1B3C0(v64, v41 + v65[5], &qword_6BCA8);
      *(void *)(v41 + v65[6]) = v62;
      *(void *)(v41 + v65[7]) = v40;
      *(unsigned char *)(v41 + v65[8]) = v61;
      *(unsigned char *)(v41 + v65[9]) = v79 & 1;
      uint64_t v66 = v41;
      uint64_t v67 = 0;
      uint64_t v68 = (uint64_t)v65;
      return sub_34DC(v66, v67, 1, v68);
    }
    swift_release();
    sub_27DC4(v40);
    sub_5884((uint64_t)v26, &qword_6D270);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v85);
    sub_5884(v59, &qword_6D270);
LABEL_13:
    uint64_t v68 = type metadata accessor for ConfirmationFlowConfigModel();
    uint64_t v66 = v41;
    uint64_t v67 = 1;
    return sub_34DC(v66, v67, 1, v68);
  }
  v69[1] = (uint64_t)v24;
  uint64_t v42 = (uint64_t)v26;
  uint64_t v43 = v3[13];
  uint64_t v44 = v3[14];
  sub_2C00(v3 + 10, v43);
  if (((*(uint64_t (**)(uint64_t, unsigned char *, uint64_t, uint64_t))(v44 + 16))(v79, v85, v43, v44) & 1) == 0)
  {
    uint64_t v52 = v3[13];
    uint64_t v53 = v3[14];
    sub_2C00(v29, v52);
    if (((*(uint64_t (**)(uint64_t, unsigned char *, uint64_t, uint64_t))(v53 + 24))(v79, v85, v52, v53) & 1) == 0)
    {
      sub_5884(v42, &qword_6D270);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v85);
      uint64_t v41 = v78;
      goto LABEL_13;
    }
    uint64_t v29 = *(void **)(v79 + 96);
    uint64_t v54 = *(void *)(v79 + 104);
    uint64_t v71 = v3 + 10;
    uint64_t v55 = v3[3];
    uint64_t v56 = v3[4];
    sub_2C00(v3, v55);
    uint64_t v70 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v56 + 16);
    swift_bridgeObjectRetain();
    v70(v81, v55, v56);
    v80[0] = v29;
    v80[1] = v54;
    sub_1B480();
    uint64_t v34 = sub_531D0();
    sub_1B4CC((uint64_t)v80);
    sub_2C00(v3 + 5, v3[8]);
    swift_retain();
    sub_25C74();
    swift_release();
    uint64_t v26 = (char *)v42;
    sub_5884(v42, &qword_6D270);
    uint64_t v39 = 1;
    sub_2826C();
    sub_282E4(v71);
    uint64_t v57 = sub_282B0();
    LODWORD(v79) = v58(v57);
    uint64_t v40 = 4;
    goto LABEL_8;
  }
  sub_2C00(v3, v3[3]);
  uint64_t v45 = sub_28304();
  v46(v45);
  sub_53C40();
  os_log_type_t v47 = sub_53030();
  uint64_t result = sub_5800(v4, 1, v47);
  if (result != 1)
  {
    uint64_t v49 = (uint64_t)v70;
    sub_53B80();
    sub_27DD4(&qword_6CB30, (void (*)(uint64_t))&type metadata accessor for AppPunchOutFlow);
    uint64_t v34 = sub_531D0();
    sub_27E1C(v49, (void (*)(void))&type metadata accessor for AppPunchOutFlow);
    sub_2C00(v5 + 5, v5[8]);
    swift_retain();
    sub_25C74();
    swift_release();
    sub_5884((uint64_t)v26, &qword_6D270);
    sub_2826C();
    sub_282E4(v29);
    uint64_t v50 = sub_282B0();
    LODWORD(v79) = v51(v50);
    uint64_t v39 = 2;
    uint64_t v40 = 3;
LABEL_8:
    uint64_t v41 = v78;
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

void *sub_27348(uint64_t a1, const void *a2)
{
  return sub_27388(a1, a2, (void (*)(uint64_t))sub_257B8, (uint64_t)"Failed to execute label CATs for makeCallCancelButtons");
}

void *sub_27368(uint64_t a1, const void *a2)
{
  return sub_27388(a1, a2, (void (*)(uint64_t))sub_25C14, (uint64_t)"Failed to execute label CATs for makeOpenCancelButtons");
}

void *sub_27388(uint64_t a1, const void *a2, void (*a3)(uint64_t), uint64_t a4)
{
  *(void *)&long long v38 = a4;
  uint64_t v39 = a1;
  uint64_t v40 = sub_53DB0();
  sub_60C0();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = &qword_6BCA8;
  sub_2E18(&qword_6BCA8);
  sub_6188();
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v38 - v16;
  uint64_t v42 = &type metadata for EmergencyCATProvider;
  uint64_t v43 = &off_66E10;
  v41[0] = swift_allocObject();
  memcpy((void *)(v41[0] + 16), a2, 0x70uLL);
  sub_2C00(v41, (uint64_t)&type metadata for EmergencyCATProvider);
  swift_retain();
  uint64_t v18 = sub_2EFC((uint64_t)a2);
  a3(v18);
  swift_release();
  uint64_t v19 = sub_54060();
  uint64_t v21 = v20;
  sub_5884((uint64_t)v17, &qword_6BCA8);
  if (v21)
  {
    sub_2C00(v41, (uint64_t)v42);
    swift_retain();
    sub_3884();
    swift_release();
    uint64_t v11 = (uint64_t *)sub_54060();
    uint64_t v23 = v22;
    sub_5884((uint64_t)v15, &qword_6BCA8);
    if (v23)
    {
      sub_2E18(&qword_6C520);
      uint64_t inited = swift_initStackObject();
      uint64_t v40 = (uint64_t)v11;
      uint64_t v25 = (void *)inited;
      long long v38 = xmmword_547B0;
      *(_OWORD *)(inited + 16) = xmmword_547B0;
      swift_bridgeObjectRetain();
      v25[4] = sub_53D30();
      v25[5] = v26;
      v25[9] = &type metadata for String;
      v25[6] = 0x656D7269666E6F63;
      v25[7] = 0xE900000000000064;
      uint64_t v27 = sub_53DD0();
      uint64_t v44 = v19;
      uint64_t v45 = v21;
      unint64_t v46 = 0xD000000000000035;
      unint64_t v47 = 0x8000000000057BA0;
      uint64_t v48 = v27;
      uint64_t v28 = swift_initStackObject();
      *(_OWORD *)(v28 + 16) = v38;
      swift_bridgeObjectRetain();
      *(void *)(v28 + 32) = sub_53D30();
      *(void *)(v28 + 40) = v29;
      *(void *)(v28 + 72) = &type metadata for String;
      *(void *)(v28 + 48) = 0x64657463656A6572;
      *(void *)(v28 + 56) = 0xE800000000000000;
      uint64_t v30 = sub_53DD0();
      uint64_t v49 = v40;
      uint64_t v50 = v23;
      unint64_t v51 = 0xD000000000000035;
      unint64_t v52 = 0x8000000000057BA0;
      uint64_t v53 = v30;
      uint64_t v31 = (void *)sub_53BD0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      goto LABEL_8;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v32 = sub_53D90();
  swift_beginAccess();
  uint64_t v33 = v40;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v32, v40);
  uint64_t v34 = sub_53DA0();
  os_log_type_t v35 = sub_53EA0();
  if (sub_1B708(v35))
  {
    os_log_type_t v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v36 = 0;
    _os_log_impl(&dword_0, v34, (os_log_type_t)v11, (const char *)v38, v36, 2u);
    sub_282C8();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v33);
  uint64_t v31 = &_swiftEmptyArrayStorage;
LABEL_8:
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v41);
  return v31;
}

void *sub_277B8(uint64_t a1, const void *a2)
{
  return sub_27388(a1, a2, (void (*)(uint64_t))sub_25C34, (uint64_t)"Failed to execute label CATs for makeSearchCancelButtons");
}

void *sub_277D8(uint64_t a1, void *a2, const void *a3)
{
  uint64_t v6 = sub_53DB0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)v38 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)v38 - v14;
  uint64_t v39 = &type metadata for EmergencyCATProvider;
  uint64_t v40 = &off_66E10;
  v38[0] = swift_allocObject();
  memcpy((void *)(v38[0] + 16), a3, 0x70uLL);
  sub_1B3C0(a1, (uint64_t)v41, &qword_6C3B0);
  if (sub_F27C((uint64_t)v41) == 1)
  {
    sub_2EFC((uint64_t)a3);
    uint64_t v16 = sub_53D90();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v15, v16, v6);
    uint64_t v17 = sub_53DA0();
    os_log_type_t v18 = sub_53E90();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_0, v17, v18, "orgInfo is nil. Not making snippets.", v19, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v6);
  }
  else
  {
    memcpy(v42, v41, sizeof(v42));
    sub_2C00(a2, a2[3]);
    sub_2EFC((uint64_t)a3);
    char v20 = sub_533A0();
    sub_3048((uint64_t)a2, (uint64_t)__dst);
    if (v20)
    {
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)__dst);
    }
    else
    {
      sub_2C00(__dst, __dst[3]);
      char v21 = sub_53380();
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)__dst);
      if ((v21 & 1) == 0)
      {
        if (sub_53C60())
        {
          uint64_t v28 = sub_2C00(v38, (uint64_t)v39);
          memcpy(__dst, v28, 0x70uLL);
          uint64_t v29 = "Failed to execute label CATs for makeCallCancelButtons";
          uint64_t v30 = sub_257B8;
        }
        else if (sub_53C70())
        {
          uint64_t v31 = sub_2C00(v38, (uint64_t)v39);
          memcpy(__dst, v31, 0x70uLL);
          uint64_t v29 = "Failed to execute label CATs for makeOpenCancelButtons";
          uint64_t v30 = sub_25C14;
        }
        else
        {
          if ((v42[13] & 0x2000000000000000) != 0) {
            uint64_t v32 = HIBYTE(v42[13]) & 0xFLL;
          }
          else {
            uint64_t v32 = v42[12] & 0xFFFFFFFFFFFFLL;
          }
          if (!v32)
          {
            uint64_t v34 = sub_53D90();
            swift_beginAccess();
            (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v34, v6);
            os_log_type_t v35 = sub_53DA0();
            os_log_type_t v36 = sub_53EA0();
            if (os_log_type_enabled(v35, v36))
            {
              uint64_t v37 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v37 = 0;
              _os_log_impl(&dword_0, v35, v36, "orgInfo is in an unknown state. Not making snippets.", v37, 2u);
              swift_slowDealloc();
            }

            (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
            goto LABEL_11;
          }
          uint64_t v33 = sub_2C00(v38, (uint64_t)v39);
          memcpy(__dst, v33, 0x70uLL);
          uint64_t v29 = "Failed to execute label CATs for makeSearchCancelButtons";
          uint64_t v30 = sub_25C34;
        }
        uint64_t v26 = sub_27388((uint64_t)a2, __dst, (void (*)(uint64_t))v30, (uint64_t)v29);
        goto LABEL_12;
      }
    }
    uint64_t v22 = sub_53D90();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v13, v22, v6);
    uint64_t v23 = sub_53DA0();
    os_log_type_t v24 = sub_53E90();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_0, v23, v24, "Device is HomePod or AppleTV. Not making snippets.", v25, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  }
LABEL_11:
  uint64_t v26 = &_swiftEmptyArrayStorage;
LABEL_12:
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v38);
  return v26;
}

uint64_t sub_27CFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmationFlowConfigModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_27D60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ConfirmationFlowConfigModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_27DC4(unint64_t result)
{
  if (result != 6) {
    return sub_149D8(result);
  }
  return result;
}

uint64_t sub_27DD4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_27E1C(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_6188();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_27E74()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 128, 7);
}

uint64_t destroy for EmergencyFlowFollowupProvider(uint64_t a1)
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + 40);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + 80);

  return _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + 120);
}

_OWORD *initializeWithCopy for EmergencyFlowFollowupProvider(_OWORD *a1, _OWORD *a2)
{
  long long v4 = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = a2[4];
  a1[4] = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)a1 + 40, (uint64_t)a2 + 40);
  long long v6 = *(_OWORD *)((char *)a2 + 104);
  *(_OWORD *)((char *)a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 5), (uint64_t)(a2 + 5));
  long long v7 = a2[9];
  a1[9] = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))((uint64_t)a1 + 120, (uint64_t)a2 + 120);
  return a1;
}

uint64_t *assignWithCopy for EmergencyFlowFollowupProvider(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

void *initializeWithTake for EmergencyFlowFollowupProvider(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xA0uLL);
}

uint64_t assignWithTake for EmergencyFlowFollowupProvider(uint64_t a1, uint64_t a2)
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + 80);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + 120);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  return a1;
}

uint64_t getEnumTagSinglePayload for EmergencyFlowFollowupProvider(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 160))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EmergencyFlowFollowupProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 160) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 160) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyFlowFollowupProvider()
{
  return &type metadata for EmergencyFlowFollowupProvider;
}

void sub_2824C(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 + 72) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_2826C()
{
  sub_34DC(v2, 0, 1, *(void *)(v0 + 64));
  return sub_1B3C0(v2, v3, v1);
}

uint64_t sub_282B0()
{
  return *(void *)(v0 + 88);
}

uint64_t sub_282C8()
{
  return swift_slowDealloc();
}

void *sub_282E4(void *a1)
{
  return sub_2C00(a1, v1);
}

uint64_t sub_28304()
{
  return v0;
}

uint64_t type metadata accessor for EmergencyGeneralEmergencyCATs()
{
  uint64_t result = qword_6D278;
  if (!qword_6D278) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_28360()
{
  return swift_initClassMetadata2();
}

uint64_t sub_283A0()
{
  return sub_25728();
}

uint64_t sub_283C0(char a1)
{
  sub_2E18(&qword_6BF00);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_547B0;
  *(void *)(v2 + 32) = 0xD00000000000001BLL;
  *(void *)(v2 + 40) = 0x80000000000586A0;
  *(void *)(v2 + 72) = &type metadata for Bool;
  *(unsigned char *)(v2 + 48) = a1;
  sub_53A60();

  return swift_bridgeObjectRelease();
}

uint64_t sub_28474()
{
  return sub_25728();
}

uint64_t sub_28494()
{
  return sub_25728();
}

uint64_t sub_284B4(uint64_t a1, uint64_t a2)
{
  return sub_28508(a1, a2);
}

uint64_t sub_28508(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_53B30();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  long long v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v8 - 8);
  sub_9A10(a1, (uint64_t)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v10 = sub_53A50();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_9A78(a1);
  return v10;
}

uint64_t sub_28670()
{
  return type metadata accessor for EmergencyGeneralEmergencyCATs();
}

uint64_t getEnumTagSinglePayload for EmergencyFlowError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
    if (a2 + 2 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 2) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for EmergencyFlowError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x287CCLL);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyFlowError()
{
  return &type metadata for EmergencyFlowError;
}

unint64_t sub_2881C()
{
  unint64_t result = qword_6D2C8;
  if (!qword_6D2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6D2C8);
  }
  return result;
}

uint64_t sub_28878(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_53670();
  uint64_t v5 = sub_FEC4(v4);
  __chkstk_darwin(v5);
  sub_6150();
  sub_FE14(v6);
  uint64_t v108 = sub_53CD0();
  sub_6188();
  __chkstk_darwin(v7);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v8);
  sub_FE14((uint64_t)v103 - v9);
  uint64_t v112 = sub_53620();
  sub_9120();
  uint64_t v111 = v10;
  __chkstk_darwin(v11);
  sub_6150();
  sub_FE14(v12);
  sub_53600();
  sub_9120();
  uint64_t v119 = v14;
  uint64_t v120 = v13;
  __chkstk_darwin(v13);
  sub_6150();
  uint64_t v118 = v15;
  uint64_t v16 = sub_535B0();
  sub_9120();
  uint64_t v18 = v17;
  __chkstk_darwin(v19);
  char v21 = (char *)v103 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_53DB0();
  sub_9120();
  uint64_t v24 = v23;
  __chkstk_darwin(v25);
  sub_612C();
  uint64_t v115 = v26;
  __chkstk_darwin(v27);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v28);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v29);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v30);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v31);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v32);
  uint64_t v34 = (char *)v103 - v33;
  uint64_t v35 = sub_53D90();
  sub_6108();
  uint64_t v121 = v24;
  os_log_type_t v36 = *(void (**)(void, void, void))(v24 + 16);
  uint64_t v116 = v35;
  uint64_t v117 = v24 + 16;
  uint64_t v122 = v36;
  v36(v34, v35, v22);
  uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  uint64_t v114 = a1;
  v37(v21, a1, v16);
  long long v38 = sub_53DA0();
  os_log_type_t v39 = sub_53E90();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = swift_slowAlloc();
    uint64_t v107 = v22;
    uint64_t v41 = (_DWORD *)v40;
    uint64_t v42 = swift_slowAlloc();
    uint64_t v104 = v2;
    v125[0] = v42;
    *uint64_t v41 = 136315138;
    v103[1] = v41 + 1;
    sub_2B4C4(&qword_6C3D8, 255, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v43 = sub_53FD0();
    v123[0] = sub_50F10(v43, v44, v125);
    sub_53EF0();
    swift_bridgeObjectRelease();
    uint64_t v45 = sub_2B828();
    v46(v45);
    sub_2B808(&dword_0, v47, v48, "#StopSirenFlow onInput: %s");
    swift_arrayDestroy();
    uint64_t v2 = v104;
    sub_60F0();
    uint64_t v22 = v107;
    sub_60F0();
  }
  else
  {
    uint64_t v49 = sub_2B828();
    v50(v49);
  }

  unint64_t v51 = *(void (**)(void))(v121 + 8);
  sub_6120();
  v51();
  sub_2C00((void *)(v2 + 16), *(void *)(v2 + 40));
  uint64_t v52 = sub_2B7BC();
  v53(v52);
  sub_2C00(v125, (uint64_t)v126);
  sub_2B7BC();
  char v54 = sub_53370();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v125);
  if ((v54 & 1) == 0)
  {
    sub_6108();
    sub_2B550();
    v63();
    uint64_t v64 = (void *)sub_53DA0();
    os_log_type_t v65 = sub_53E90();
    if (sub_FF7C(v65))
    {
      uint64_t v66 = (_WORD *)sub_61F0();
      sub_61CC(v66);
      sub_FED0(&dword_0, v67, v68, "#StopSirenFlow Not on watch. Flagging for remote execution.");
      sub_60F0();
    }

    sub_6120();
    v51();
    *(unsigned char *)(v2 + 136) = 3;
    return 1;
  }
  uint64_t v55 = v118;
  sub_535A0();
  int v56 = (*(uint64_t (**)(uint64_t, uint64_t))(v119 + 88))(v55, v120);
  if (v56 == enum case for Parse.NLv3IntentOnly(_:))
  {
    sub_6108();
    sub_2B550();
    v57();
    uint64_t v58 = (void *)sub_53DA0();
    os_log_type_t v59 = sub_53E90();
    if (sub_FF7C(v59))
    {
      os_log_type_t v60 = (_WORD *)sub_61F0();
      sub_61CC(v60);
      sub_FED0(&dword_0, v61, v62, "#StopSirenFlow onInput .NLv3IntentOnly");
      sub_60F0();
    }
LABEL_15:

    sub_6120();
    v51();
    *(unsigned char *)(v2 + 136) = 2;
    (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v118, v120);
    return 1;
  }
  if (v56 == enum case for Parse.directInvocation(_:))
  {
    sub_6108();
    sub_2B550();
    v69();
    uint64_t v58 = (void *)sub_53DA0();
    os_log_type_t v70 = sub_53E90();
    if (sub_FF7C(v70))
    {
      uint64_t v71 = (_WORD *)sub_61F0();
      sub_61CC(v71);
      sub_FED0(&dword_0, v72, v73, "#StopSirenFlow onInput directInvocation");
      sub_60F0();
    }
    goto LABEL_15;
  }
  if (v56 != enum case for Parse.uso(_:))
  {
    sub_6108();
    sub_2B550();
    v84();
    uint64_t v85 = sub_53DA0();
    os_log_type_t v86 = sub_53EA0();
    if (os_log_type_enabled(v85, v86))
    {
      uint64_t v107 = v22;
      uint64_t v87 = (uint8_t *)swift_slowAlloc();
      v123[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v87 = 136315138;
      LOBYTE(v124) = 0;
      uint64_t v88 = sub_53E10();
      uint64_t v124 = sub_50F10(v88, v89, v123);
      sub_53EF0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v85, v86, "%s", v87, 0xCu);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();
    }

    sub_6120();
    v51();
    goto LABEL_37;
  }
  uint64_t v75 = v118;
  (*(void (**)(uint64_t, uint64_t))(v119 + 96))(v118, v120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v111 + 32))(v113, v75, v112);
  sub_6108();
  sub_2B550();
  v76();
  uint64_t v77 = (void *)sub_53DA0();
  os_log_type_t v78 = sub_53E90();
  if (sub_FF7C(v78))
  {
    uint64_t v79 = (_WORD *)sub_61F0();
    sub_61CC(v79);
    sub_FED0(&dword_0, v80, v81, "#StopSirenFlow onInput .uso");
    sub_60F0();
  }

  ((void (*)(uint64_t, uint64_t))v51)(v110, v22);
  sub_53610();
  unsigned int v126 = &type metadata for EmergencyFeatureFlagsKey;
  unint64_t v127 = sub_F998();
  LOBYTE(v125[0]) = 2;
  sub_53640();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v125);
  uint64_t v82 = v109;
  sub_53CC0();
  if (*(unsigned char *)(v82 + *(int *)(v108 + 24)) == 35)
  {
    uint64_t v83 = v106;
    sub_13CA4(v82, v106);
    goto LABEL_33;
  }
  BOOL v91 = sub_53CF0() == 0x6E65726973 && v90 == 0xE500000000000000;
  uint64_t v83 = v106;
  if (v91)
  {
    swift_bridgeObjectRelease();
    sub_13CA4(v82, v83);
    goto LABEL_32;
  }
  char v92 = sub_53FE0();
  swift_bridgeObjectRelease();
  sub_13CA4(v82, v83);
  if (v92)
  {
LABEL_32:
    switch(*(unsigned char *)(v83 + *(int *)(v108 + 20)))
    {
      case 5:
        swift_bridgeObjectRelease();
        sub_2B470(v83, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
        break;
      case 8:
        goto LABEL_33;
      default:
        char v101 = sub_53FE0();
        swift_bridgeObjectRelease();
        sub_2B470(v83, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
        if ((v101 & 1) == 0) {
          goto LABEL_34;
        }
        break;
    }
    sub_2B470(v82, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
    sub_2B73C();
    sub_15450();
    v102();
    *(unsigned char *)(v2 + 136) = 2;
    return 1;
  }
LABEL_33:
  sub_2B470(v83, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
LABEL_34:
  sub_6108();
  uint64_t v93 = v105;
  sub_2B550();
  v94();
  uint64_t v95 = (void *)sub_53DA0();
  os_log_type_t v96 = sub_53E90();
  if (sub_FF7C(v96))
  {
    uint64_t v97 = (_WORD *)sub_61F0();
    sub_61CC(v97);
    sub_FED0(&dword_0, v98, v99, "#StopSirenFlow Received invalid input. Ignoring.");
    uint64_t v82 = v109;
    sub_60F0();
  }

  ((void (*)(uint64_t, uint64_t))v51)(v93, v22);
  sub_2B470(v82, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
  sub_2B73C();
LABEL_37:
  sub_15450();
  v100();
  return 0;
}

uint64_t sub_294C4()
{
  sub_10010();
  v1[79] = v0;
  v1[78] = v2;
  uint64_t v3 = sub_2E18(&qword_6BCA8);
  sub_FEC4(v3);
  v1[80] = swift_task_alloc();
  v1[81] = swift_task_alloc();
  uint64_t v4 = sub_53B50();
  v1[82] = v4;
  sub_FEC4(v4);
  v1[83] = sub_20CA8();
  uint64_t v5 = sub_53030();
  sub_FEC4(v5);
  v1[84] = sub_20CA8();
  uint64_t v6 = sub_53B90();
  v1[85] = v6;
  sub_FEC4(v6);
  v1[86] = sub_20CA8();
  uint64_t v7 = sub_2E18(&qword_6C4E0);
  sub_FEC4(v7);
  v1[87] = sub_20CA8();
  uint64_t v8 = sub_533D0();
  v1[88] = v8;
  sub_FDFC(v8);
  v1[89] = v9;
  v1[90] = sub_20CA8();
  uint64_t v10 = sub_53DB0();
  v1[91] = v10;
  sub_FDFC(v10);
  v1[92] = v11;
  v1[93] = swift_task_alloc();
  v1[94] = swift_task_alloc();
  v1[95] = swift_task_alloc();
  v1[96] = swift_task_alloc();
  v1[97] = swift_task_alloc();
  sub_2B724();
  return _swift_task_switch(v12, v13, v14);
}

uint64_t sub_29688()
{
  uint64_t v84 = v0;
  uint64_t v80 = v0 + 32;
  uint64_t v81 = v0 + 27;
  uint64_t v1 = v0[97];
  uint64_t v2 = v0[92];
  uint64_t v3 = v0[91];
  uint64_t v4 = sub_53D90();
  sub_6108();
  uint64_t v82 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v82(v1, v4, v3);
  uint64_t v5 = sub_53DA0();
  os_log_type_t v6 = sub_53E90();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)sub_61F0();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "#StopSirenFlow execute", v7, 2u);
    sub_60F0();
  }
  uint64_t v8 = v0[97];
  uint64_t v9 = v0[92];
  uint64_t v10 = v0[91];
  uint64_t v11 = v0[79];

  uint64_t v12 = *(void (**)(void))(v9 + 8);
  ((void (*)(uint64_t, uint64_t))v12)(v8, v10);
  switch(*(unsigned char *)(v11 + 136))
  {
    case 1:
      sub_2B700();
      uint64_t v13 = v0[10];
      uint64_t v14 = v0[11];
      sub_2B5A0();
      uint64_t v22 = sub_2B6E8();
      v23(v22);
      sub_532E0();
      sub_6188();
      uint64_t v24 = sub_2B6D0();
      v25(v24);
      sub_2B5D4();
      uint64_t v19 = sub_2B568();
      v0[100] = v19;
      uint64_t v20 = (void *)swift_task_alloc();
      v0[101] = v20;
      *uint64_t v20 = v0;
      char v21 = sub_2A238;
      goto LABEL_23;
    case 2:
      sub_6108();
      uint64_t v26 = sub_2B5F4();
      v27(v26);
      uint64_t v28 = sub_53DA0();
      os_log_type_t v29 = sub_53E90();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = (_WORD *)sub_61F0();
        sub_61CC(v30);
        sub_2B7E8(&dword_0, v31, v32, "#StopSirenFlow needsExecution");
        sub_60F0();
      }
      uint64_t v33 = (void *)v0[79];

      sub_2B7BC();
      sub_15450();
      v34();
      sub_3048((uint64_t)(v33 + 18), (uint64_t)v81);
      sub_2C00(v81, v0[30]);
      uint64_t v36 = v33[5];
      uint64_t v35 = v33[6];
      uint64_t v79 = v33 + 2;
      sub_2C00(v33 + 2, v36);
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v36, v35);
      char v37 = sub_2E274(v80);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v80);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v81);
      if ((v37 & 1) == 0)
      {
        sub_6108();
        uint64_t v51 = sub_2B5F4();
        v52(v51);
        swift_retain_n();
        uint64_t v53 = sub_53DA0();
        os_log_type_t v54 = sub_53E90();
        if (os_log_type_enabled(v53, v54))
        {
          uint64_t v55 = (_DWORD *)swift_slowAlloc();
          uint64_t v83 = swift_slowAlloc();
          *uint64_t v55 = 136315138;
          int v56 = v33;
          uint64_t v57 = v33[5];
          uint64_t v58 = v56[6];
          sub_2C00(v79, v57);
          (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v58);
          sub_2E18((uint64_t *)&unk_6D410);
          uint64_t v59 = sub_53E10();
          v0[77] = sub_50F10(v59, v60, &v83);
          sub_53EF0();
          swift_bridgeObjectRelease();
          swift_release_n();
          sub_2B808(&dword_0, v61, v62, "#StopSirenFlow Cannot route to Siren from this device: %s");
          swift_arrayDestroy();
          sub_60F0();
          sub_60F0();
        }
        else
        {
          swift_release_n();
        }
        sub_15450();
        v74();
        sub_2B700();
        uint64_t v13 = v0[45];
        uint64_t v14 = v0[46];
        sub_2B5A0();
        uint64_t v75 = sub_2B6E8();
        v76(v75);
        sub_532E0();
        sub_6188();
        uint64_t v77 = sub_2B6D0();
        v78(v77);
        sub_2B5D4();
        uint64_t v19 = sub_2B568();
        v0[105] = v19;
        uint64_t v20 = (void *)swift_task_alloc();
        v0[106] = v20;
        *uint64_t v20 = v0;
        char v21 = sub_2A9B0;
LABEL_23:
        v20[1] = v21;
        return dispatch thunk of SiriKitEventSending.sendAsync(_:)(v19, v13, v14);
      }
      sub_2C00(v33 + 18, *(void *)(v0[79] + 168));
      if ((sub_2E30C() & 1) == 0)
      {
        sub_6108();
        uint64_t v63 = sub_2B5F4();
        v64(v63);
        sub_53DA0();
        os_log_type_t v65 = sub_53E90();
        if (sub_FF7C(v65))
        {
          uint64_t v66 = (_WORD *)sub_61F0();
          sub_61CC(v66);
          sub_FED0(&dword_0, v67, v68, "#StopSirenFlow App not installed on this device nor companion.");
          sub_60F0();
        }
        sub_2B768();
        sub_6120();
        v69();
        sub_532B0();
        uint64_t v13 = v0[60];
        uint64_t v14 = v0[61];
        sub_2B5A0();
        uint64_t v70 = sub_2B7A4();
        v71(v70);
        sub_532E0();
        sub_6188();
        uint64_t v72 = sub_2B78C();
        v73(v72);
        sub_2B5D4();
        uint64_t v19 = sub_2B698();
        v0[103] = v19;
        uint64_t v20 = (void *)swift_task_alloc();
        v0[104] = v20;
        *uint64_t v20 = v0;
        char v21 = sub_2A78C;
        goto LABEL_23;
      }
      long long v38 = (void *)swift_task_alloc();
      v0[102] = v38;
      *long long v38 = v0;
      v38[1] = sub_2A3E4;
      return sub_2AF10();
    case 3:
      uint64_t v40 = v12;
      uint64_t v41 = v0[93];
      uint64_t v42 = v0[91];
      sub_6108();
      v82(v41, v4, v42);
      sub_53DA0();
      os_log_type_t v43 = sub_53E90();
      if (sub_FF7C(v43))
      {
        unint64_t v44 = (_WORD *)sub_61F0();
        sub_61CC(v44);
        sub_FED0(&dword_0, v45, v46, "#StopSirenFlow Phone to watch handoff not enabled.");
        sub_60F0();
      }
      sub_2B768();
      sub_6120();
      v40();
      sub_532B0();
      uint64_t v13 = v0[15];
      uint64_t v14 = v0[16];
      sub_2B5A0();
      uint64_t v47 = sub_2B7A4();
      v48(v47);
      sub_532E0();
      sub_6188();
      uint64_t v49 = sub_2B78C();
      v50(v49);
      sub_2B5D4();
      uint64_t v19 = sub_2B698();
      v0[107] = v19;
      uint64_t v20 = (void *)swift_task_alloc();
      v0[108] = v20;
      *uint64_t v20 = v0;
      char v21 = sub_2ABD4;
      goto LABEL_23;
    default:
      sub_2B700();
      uint64_t v13 = v0[50];
      uint64_t v14 = v0[51];
      sub_2B5A0();
      uint64_t v15 = sub_2B6E8();
      v16(v15);
      sub_532E0();
      sub_6188();
      uint64_t v17 = sub_2B6D0();
      v18(v17);
      sub_2B5D4();
      uint64_t v19 = sub_2B568();
      v0[98] = v19;
      uint64_t v20 = (void *)swift_task_alloc();
      v0[99] = v20;
      *uint64_t v20 = v0;
      char v21 = sub_2A050;
      goto LABEL_23;
  }
}

uint64_t sub_2A050()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_2B724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_2A134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_2B62C();
  sub_2B75C();
  uint64_t v15 = *(void *)(v14 + 632);
  uint64_t v16 = *(void *)(v14 + 624);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v14 + 376);
  sub_F824();
  uint64_t v17 = swift_allocError();
  *uint64_t v18 = 2;
  sub_2940(v17, v15 + 16, (void *)(v15 + 56), v16);
  swift_errorRelease();
  sub_2B50C();
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
  sub_2B730();
  sub_2B610();
  return v20(v19, v20, v21, v22, v23, v24, v25, v26, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_2A238()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_2B724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_2A31C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_2B62C();
  sub_2B75C();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v14 + 56);
  sub_53460();
  sub_2B50C();
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
  sub_2B730();
  sub_2B610();
  return v16(v15, v16, v17, v18, v19, v20, v21, v22, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_2A3E4()
{
  sub_10010();
  sub_60D8();
  *(unsigned char *)(v1 + 872) = v0;
  swift_task_dealloc();
  sub_2B724();
  return _swift_task_switch(v2, v3, v4);
}

uint64_t sub_2A4B8()
{
  uint64_t v12 = v0;
  if (*(unsigned char *)(v0 + 872) == 1)
  {
    uint64_t v1 = *(void *)(v0 + 688);
    uint64_t v2 = *(void *)(v0 + 672);
    uint64_t v3 = *(void **)(v0 + 632);
    uint64_t v4 = v3[5];
    uint64_t v5 = v3[6];
    sub_2C00(v3 + 2, v4);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v5 + 16))(v11, v4, v5);
    sub_2DFEC(v2);
    sub_53B80();
    sub_2B4C4(&qword_6CB30, 255, (void (*)(uint64_t))&type metadata accessor for AppPunchOutFlow);
    sub_531D0();
    uint64_t v6 = &type metadata accessor for AppPunchOutFlow;
  }
  else
  {
    uint64_t v1 = *(void *)(v0 + 664);
    uint64_t v7 = *(void *)(v0 + 632);
    uint64_t v8 = v7 + 16;
    sub_2C00((void *)(v7 + 56), *(void *)(v7 + 80));
    swift_retain();
    sub_254A4();
    swift_release();
    sub_3048(v8, v0 + 176);
    sub_53B40();
    sub_2B4C4((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
    sub_531D0();
    uint64_t v6 = &type metadata accessor for OutputFlow;
  }
  sub_2B470(v1, (void (*)(void))v6);
  sub_53450();
  swift_release();
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
  sub_2B730();
  return v9();
}

uint64_t sub_2A78C()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_2B724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_2A870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_2B62C();
  sub_2B75C();
  sub_2B648(v15 + 456);
  sub_25484();
  swift_release();
  sub_3048(v16, v15 + 296);
  sub_2B83C();
  sub_2B4C4((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
  sub_2B7C8();
  sub_2B470(v14, (void (*)(void))&type metadata accessor for OutputFlow);
  sub_2B50C();
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
  sub_2B730();
  sub_2B610();
  return v18(v17, v18, v19, v20, v21, v22, v23, v24, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_2A9B0()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_2B724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_2AA94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_2B62C();
  sub_2B75C();
  sub_2B648(v15 + 336);
  sub_25544();
  swift_release();
  sub_3048(v16, v15 + 16);
  sub_2B83C();
  sub_2B4C4((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
  sub_2B7C8();
  sub_2B470(v14, (void (*)(void))&type metadata accessor for OutputFlow);
  sub_2B50C();
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
  sub_2B730();
  sub_2B610();
  return v18(v17, v18, v19, v20, v21, v22, v23, v24, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_2ABD4()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_2B724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_2ACB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_2B62C();
  sub_2B75C();
  uint64_t v15 = (void *)v14[79];
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v14 + 12));
  sub_2C00(v15 + 18, v15[21]);
  unsigned __int8 v16 = sub_2E30C();
  sub_2C00(v15 + 7, v15[10]);
  swift_retain();
  if (v16) {
    sub_254C4();
  }
  else {
    sub_25544();
  }
  uint64_t v17 = v14[83];
  uint64_t v18 = v14[81];
  uint64_t v19 = v14[80];
  uint64_t v20 = v14[79];
  swift_release();
  sub_2FE0(v19, v18);
  sub_3048(v20 + 16, (uint64_t)(v14 + 17));
  sub_53B40();
  sub_2B4C4((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
  sub_53440();
  sub_2B470(v17, (void (*)(void))&type metadata accessor for OutputFlow);
  sub_3158(v19);
  sub_2B50C();
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
  sub_2B730();
  sub_2B610();
  return v22(v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12, a13, a14);
}

uint64_t sub_2AE84()
{
  type metadata accessor for StopSirenFlow();
  sub_2B4C4(&qword_6D408, v0, (void (*)(uint64_t))type metadata accessor for StopSirenFlow);
  return sub_531E0();
}

uint64_t sub_2AF10()
{
  sub_10010();
  uint64_t v1 = sub_53DB0();
  v0[5] = v1;
  sub_FDFC(v1);
  v0[6] = v2;
  v0[7] = sub_20CA8();
  sub_2B724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_2AF98()
{
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v3 = v0[5];
  uint64_t v4 = sub_53D90();
  sub_6108();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_53DA0();
  os_log_type_t v6 = sub_53EA0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (_WORD *)sub_61F0();
    sub_61CC(v7);
    sub_2B7E8(&dword_0, v8, v9, "#StopSirenFlow Can't tell if Siren is running from this device.");
    sub_60F0();
  }

  uint64_t v10 = sub_2B7BC();
  v11(v10);
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(uint64_t))v0[1];
  return v12(1);
}

uint64_t sub_2B0AC()
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 16);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 56);
  sub_6068(v0 + 96);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 144);
  return v0;
}

uint64_t sub_2B0E4()
{
  sub_2B0AC();

  return _swift_deallocClassInstance(v0, 184, 7);
}

uint64_t type metadata accessor for StopSirenFlow()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for StopSirenFlow.StopSirenFlowState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x2B208);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StopSirenFlow.StopSirenFlowState()
{
  return &type metadata for StopSirenFlow.StopSirenFlowState;
}

unint64_t sub_2B244()
{
  unint64_t result = qword_6D3F0[0];
  if (!qword_6D3F0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_6D3F0);
  }
  return result;
}

uint64_t sub_2B290(uint64_t a1)
{
  return sub_28878(a1) & 1;
}

uint64_t sub_2B2B8()
{
  return sub_2AE84();
}

uint64_t sub_2B2DC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2B378;
  return sub_294C4();
}

uint64_t sub_2B378()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_2B730();
  return v3();
}

uint64_t sub_2B438()
{
  type metadata accessor for StopSirenFlow();

  return sub_53230();
}

uint64_t sub_2B470(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_6188();
  sub_15450();
  v3();
  return a1;
}

uint64_t sub_2B4C4(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_2B50C()
{
  return swift_task_dealloc();
}

uint64_t sub_2B568()
{
  return sub_532F0();
}

uint64_t sub_2B5A0()
{
  sub_2C00(v1, v0);
  return sub_53300();
}

uint64_t sub_2B5D4()
{
  return sub_34DC(v0, 0, 1, v1);
}

uint64_t sub_2B5F4()
{
  return v0;
}

uint64_t sub_2B648(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 632);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1);
  sub_2C00((void *)(v2 + 56), *(void *)(v2 + 80));
  return swift_retain();
}

uint64_t sub_2B698()
{
  return sub_532F0();
}

uint64_t sub_2B6D0()
{
  return v0;
}

uint64_t sub_2B6E8()
{
  return v0;
}

uint64_t sub_2B700()
{
  return sub_532B0();
}

uint64_t sub_2B730()
{
  return v0 + 8;
}

uint64_t sub_2B73C()
{
  return *(void *)(v0 - 280);
}

void sub_2B768()
{
}

uint64_t sub_2B78C()
{
  return v0;
}

uint64_t sub_2B7A4()
{
  return v0;
}

uint64_t sub_2B7BC()
{
  return v0;
}

uint64_t sub_2B7C8()
{
  return sub_53440();
}

void sub_2B7E8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

void sub_2B808(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_2B828()
{
  return v0;
}

uint64_t sub_2B83C()
{
  return sub_53B40();
}

uint64_t *initializeBufferWithCopyOfBuffer for ConfirmationSnippets(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    uint64_t v3 = swift_bridgeObjectRetain();
  }
  *a1 = v3;
  return a1;
}

unint64_t destroy for ConfirmationSnippets(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t *assignWithCopy for ConfirmationSnippets(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF) {
      swift_bridgeObjectRetain();
    }
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

void *initializeWithTake for ConfirmationSnippets(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

unint64_t *assignWithTake for ConfirmationSnippets(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v3 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfirmationSnippets(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFF9 && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483642);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 5;
  if (v4 >= 7) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ConfirmationSnippets(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFA)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483642;
    if (a3 >= 0x7FFFFFFA) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFA) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 5;
    }
  }
  return result;
}

uint64_t sub_2BA50(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_2BA68(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for ConfirmationSnippets()
{
  return &type metadata for ConfirmationSnippets;
}

uint64_t EmergencyOrganizationInfoProvider.init(flowConfig:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  void (*v15)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void (*v32)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void v40[5];
  void v41[3];
  void *v42;
  void *v43;

  os_log_type_t v39 = a2;
  sub_53DB0();
  sub_9120();
  uint64_t v33 = v4;
  uint64_t v34 = v3;
  __chkstk_darwin(v3);
  uint64_t v35 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_53070();
  sub_9120();
  uint64_t v36 = v7;
  char v37 = v6;
  uint64_t v8 = __chkstk_darwin(v6);
  long long v38 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v28 - v10;
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  uint64_t v14 = sub_2C00(a1, v12);
  uint64_t v15 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v13 + 8);
  v15(v41, v12, v13);
  sub_2C00(v41, (uint64_t)v42);
  sub_53350();
  if (v16)
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v41);
    sub_53050();
  }
  else
  {
    os_log_type_t v29 = v12;
    uint64_t v30 = v13;
    uint64_t v31 = v14;
    uint64_t v32 = v15;
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v41);
    uint64_t v17 = sub_53D90();
    swift_beginAccess();
    uint64_t v18 = v33;
    uint64_t v19 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v35, v17, v34);
    uint64_t v20 = sub_53DA0();
    uint64_t v21 = sub_53EA0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_0, v20, v21, "Failed to fetch preferencesLanguageCode. Falling back to siriLocale.", v22, 2u);
      uint64_t v19 = v34;
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v18 + 8))(v35, v19);
    v32(v41, v29, v30);
    sub_2C00(v41, (uint64_t)v42);
    sub_53320();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v41);
  }
  uint64_t v23 = v36;
  uint64_t v24 = v37;
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v38, v11, v37);
  uint64_t v25 = a1[3];
  uint64_t v26 = a1[4];
  sub_2C00(a1, v25);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v26 + 24))(v40, v25, v26);
  [objc_allocWithZone((Class)CLGeocoder) init];
  (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v24);
  uint64_t v42 = &type metadata for LocationService;
  os_log_type_t v43 = &protocol witness table for LocationService;
  v41[0] = swift_allocObject();
  sub_53BB0();
  sub_53C80();
  return _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)a1);
}

uint64_t sub_2BE5C()
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 16);

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_2BE9C(uint64_t result, unsigned char **a2)
{
  unsigned int v2 = *a2;
  *unsigned int v2 = result;
  *a2 = v2 + 1;
  return result;
}

id sub_2BEAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [objc_allocWithZone((Class)SAUIAppPunchOut) init];
  sub_9A10(a3, (uint64_t)v8);
  uint64_t v10 = sub_53030();
  uint64_t v12 = 0;
  if (sub_5800((uint64_t)v8, 1, v10) != 1)
  {
    sub_53010(v11);
    uint64_t v12 = v13;
    (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v8, v10);
  }
  [v9 setPunchOutUri:v12];

  sub_2E18((uint64_t *)&unk_6D490);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_547C0;
  *(void *)(v14 + 32) = v9;
  uint64_t v18 = v14;
  sub_53E80();
  id v15 = sub_2C038(a1, a2, v18);
  sub_9A78(a3);
  return v15;
}

id sub_2C038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  sub_2C0AC(a1, a2, v6);
  sub_2C110(a3, v6);

  return v6;
}

void sub_2C0AC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = sub_53DF0();
  swift_bridgeObjectRelease();
  [a3 setText:v4];
}

void sub_2C110(uint64_t a1, void *a2)
{
  sub_2E18((uint64_t *)&unk_6D480);
  Class isa = sub_53E70().super.isa;
  swift_bridgeObjectRelease();
  [a2 setCommands:isa];
}

uint64_t sub_2C188()
{
  uint64_t v0 = sub_535E0();
  if (!v0)
  {
    long long v6 = 0u;
    long long v7 = 0u;
    goto LABEL_7;
  }
  uint64_t v1 = v0;
  uint64_t v2 = sub_53D30();
  sub_2C2BC(v2, v3, v1, &v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v7 + 1))
  {
LABEL_7:
    sub_2C25C((uint64_t)&v6);
    return 35;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 35;
  }
  uint64_t v4 = sub_53CE0();
  swift_bridgeObjectRelease();
  if (v4 == 35) {
    return 35;
  }
  return v4;
}

uint64_t sub_2C25C(uint64_t a1)
{
  uint64_t v2 = sub_2E18(&qword_6C508);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double sub_2C2BC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_2D0CC(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_2D144(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_2C320(uint64_t a1)
{
  uint64_t v2 = sub_53DB0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v50 - v7;
  uint64_t v9 = sub_2E18(&qword_6D4B0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_F87C(a1, (uint64_t)v54);
  unsigned int v12 = sub_2D29C((uint64_t)v54);
  uint64_t v51 = v6;
  if (v12 > 1)
  {
    uint64_t v23 = &_swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v13 = (void *)nullsub_1(v54);
    uint64_t v50 = a1;
    uint64_t v14 = v2;
    uint64_t v15 = v13[8];
    uint64_t v16 = v13[9];
    uint64_t v17 = v13[7];
    uint64_t v52 = v13[6];
    sub_2E18((uint64_t *)&unk_6D490);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_547C0;
    id v19 = objc_allocWithZone((Class)INPersonHandle);
    swift_bridgeObjectRetain();
    id v20 = sub_2CDF8(v15, v16, 2);
    uint64_t v21 = sub_53000();
    sub_34DC((uint64_t)v11, 1, 1, v21);
    id v22 = objc_allocWithZone((Class)INPerson);
    swift_bridgeObjectRetain();
    uint64_t v2 = v14;
    a1 = v50;
    *(void *)(v18 + 32) = sub_2CE64(v20, (uint64_t)v11, v52, v17, 0, 0, 0, 0, 0);
    v53[0] = v18;
    sub_53E80();
    uint64_t v23 = (void *)v53[0];
  }
  uint64_t v52 = (uint64_t)v23;
  sub_53D90();
  swift_beginAccess();
  uint64_t v24 = *(void (**)(void))(v3 + 16);
  sub_2D90C();
  v24();
  uint64_t v25 = sub_53DA0();
  os_log_type_t v26 = sub_53E90();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v50 = v3 + 16;
    *(_WORD *)uint64_t v27 = 0;
    _os_log_impl(&dword_0, v25, v26, "Creating INStartCallIntent", v27, 2u);
    swift_slowDealloc();
  }

  uint64_t v28 = *(void (**)(char *, uint64_t))(v3 + 8);
  v28(v8, v2);
  sub_F87C(a1, (uint64_t)v53);
  unsigned int v29 = sub_2D29C((uint64_t)v53);
  if (!v29)
  {
    uint64_t v30 = 1;
    goto LABEL_10;
  }
  if (v29 == 1)
  {
    uint64_t v30 = 2;
LABEL_10:
    nullsub_1(v53);
    goto LABEL_12;
  }
  uint64_t v30 = v29;
LABEL_12:
  id v31 = objc_allocWithZone((Class)INStartCallIntent);
  uint64_t v32 = sub_2CFE8(0, 0, 0, v30, 1, v52, 0, 1);
  uint64_t v33 = sub_2D2B4([v32 backingStore]);
  if (v34 >> 60 == 15)
  {
    swift_beginAccess();
    uint64_t v35 = v51;
    sub_2D90C();
    v24();
    uint64_t v36 = v35;
    char v37 = sub_53DA0();
    os_log_type_t v38 = sub_53EB0();
    if (os_log_type_enabled(v37, v38))
    {
      os_log_type_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v39 = 0;
      _os_log_impl(&dword_0, v37, v38, "Unable to serialize INStartCallIntent", v39, 2u);
      swift_slowDealloc();
      uint64_t v40 = v32;
    }
    else
    {
      uint64_t v40 = v37;
      char v37 = v32;
    }

    v28(v36, v2);
    return 0;
  }
  else
  {
    uint64_t v41 = v33;
    unint64_t v42 = v34;
    sub_2E18(&qword_6C520);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_547E0;
    *(void *)(inited + 32) = 0x6449707061;
    *(void *)(inited + 40) = 0xE500000000000000;
    *(void *)(inited + 48) = 0xD000000000000015;
    *(void *)(inited + 56) = 0x8000000000058750;
    *(void *)(inited + 72) = &type metadata for String;
    strcpy((char *)(inited + 80), "intentTypeName");
    *(unsigned char *)(inited + 95) = -18;
    id v44 = [v32 typeName];
    uint64_t v45 = sub_53E00();
    uint64_t v47 = v46;

    *(void *)(inited + 96) = v45;
    *(void *)(inited + 104) = v47;
    *(void *)(inited + 120) = &type metadata for String;
    *(void *)(inited + 128) = 0x6144746E65746E69;
    *(void *)(inited + 168) = &type metadata for Data;
    *(void *)(inited + 136) = 0xEA00000000006174;
    *(void *)(inited + 144) = v41;
    *(void *)(inited + 152) = v42;
    uint64_t v48 = sub_53DD0();
  }
  return v48;
}

id sub_2C8D8(uint64_t a1, void *a2)
{
  sub_2D324(0, &qword_6D4A0);
  id v4 = sub_4BD40();
  uint64_t v5 = sub_2C320(a1);
  Class isa = (Class)v5;
  if (v5)
  {
    sub_2CA34(v5);
    swift_bridgeObjectRelease();
    Class isa = sub_53DC0().super.isa;
    swift_bridgeObjectRelease();
  }
  [v4 setUserData:isa];

  sub_2C00(a2, a2[3]);
  uint64_t v7 = (void *)sub_533B0();
  uint64_t v8 = self;
  id v9 = [v8 runSiriKitExecutorCommandWithContext:v7 payload:v4];
  id v10 = [v8 wrapCommandInStartLocalRequest:v9];

  return v10;
}

uint64_t sub_2CA34(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_2E18(&qword_6D4A8);
    uint64_t v2 = (void *)sub_53F80();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  unint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_2D144(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v40);
    *(void *)&long long v39 = v17;
    *((void *)&v39 + 1) = v16;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v17;
    *((void *)&v37[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_2D284(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_2D284(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_2D284(v36, v37);
    sub_2D284(v37, &v33);
    uint64_t result = sub_53F20(v2[5]);
    uint64_t v18 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)&v6[8 * (v19 >> 6)]) == 0)
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)&v6[8 * v20];
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)&v6[8 * (v19 >> 6)])) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)&v6[(v21 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v21;
    uint64_t v26 = v2[6] + 40 * v21;
    *(_OWORD *)uint64_t v26 = v29;
    *(_OWORD *)(v26 + 16) = v30;
    *(void *)(v26 + 32) = v31;
    uint64_t result = (uint64_t)sub_2D284(&v33, (_OWORD *)(v2[7] + 32 * v21));
    ++v2[2];
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_36;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_36;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_36;
          }
          unint64_t v12 = *(void *)(v28 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v8 = v13;
  }
  int64_t v14 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_36:
    swift_release();
    sub_2D294();
    return (uint64_t)v2;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

id sub_2CDF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    NSString v5 = sub_53DF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  id v6 = [v3 initWithValue:v5 type:a3];

  return v6;
}

id sub_2CE64(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v10 = v9;
  uint64_t v16 = sub_53000();
  Class v17 = 0;
  if (sub_5800(a2, 1, v16) != 1)
  {
    Class v17 = sub_52FF0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a2, v16);
  }
  if (a4)
  {
    NSString v18 = sub_53DF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v18 = 0;
  }
  if (!a7)
  {
    NSString v19 = 0;
    if (a9) {
      goto LABEL_8;
    }
LABEL_10:
    NSString v20 = 0;
    goto LABEL_11;
  }
  NSString v19 = sub_53DF0();
  swift_bridgeObjectRelease();
  if (!a9) {
    goto LABEL_10;
  }
LABEL_8:
  NSString v20 = sub_53DF0();
  swift_bridgeObjectRelease();
LABEL_11:
  id v21 = [v10 initWithPersonHandle:a1 nameComponents:v17 displayName:v18 image:a5 contactIdentifier:v19 customIdentifier:v20];

  return v21;
}

id sub_2CFE8(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = v8;
  if (a6)
  {
    sub_2D324(0, &qword_6D4B8);
    v17.super.Class isa = sub_53E70().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v17.super.Class isa = 0;
  }
  id v18 = [v9 initWithCallRecordFilter:a1 callRecordToCallBack:a2 audioRoute:a3 destinationType:a4 preferredCallProvider:a5 contacts:v17.super.isa ttyType:a7 callCapability:a8];

  return v18;
}

unint64_t sub_2D0CC(uint64_t a1, uint64_t a2)
{
  sub_54030();
  sub_53E40();
  Swift::Int v4 = sub_54050();

  return sub_2D1A0(a1, a2, v4);
}

uint64_t sub_2D144(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2D1A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_53FE0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_53FE0() & 1) == 0);
    }
  }
  return v6;
}

_OWORD *sub_2D284(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2D294()
{
  return swift_release();
}

uint64_t sub_2D29C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 128) <= 1u) {
    return *(unsigned __int8 *)(a1 + 128);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_2D2B4(void *a1)
{
  id v2 = [a1 data];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_53040();

  return v3;
}

uint64_t sub_2D324(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2D360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unsigned __int8 a17)
{
  if (a17 <= 1u)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for CallContact(uint64_t a1)
{
  return sub_2D474(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(unsigned char *)(a1 + 128));
}

uint64_t sub_2D474(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, unsigned __int8 a17)
{
  if (a17 <= 1u)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for CallContact(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  uint64_t v14 = *(void *)(a2 + 80);
  uint64_t v15 = *(void *)(a2 + 88);
  uint64_t v16 = *(void *)(a2 + 96);
  uint64_t v17 = *(void *)(a2 + 104);
  uint64_t v18 = *(void *)(a2 + 112);
  uint64_t v19 = *(void *)(a2 + 120);
  unsigned __int8 v20 = *(unsigned char *)(a2 + 128);
  sub_2D360(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v14;
  *(void *)(a1 + 88) = v15;
  *(void *)(a1 + 96) = v16;
  *(void *)(a1 + 104) = v17;
  *(void *)(a1 + 112) = v18;
  *(void *)(a1 + 120) = v19;
  *(unsigned char *)(a1 + 128) = v20;
  return a1;
}

uint64_t assignWithCopy for CallContact(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v27 = *(void *)(a2 + 72);
  uint64_t v28 = *(void *)(a2 + 80);
  uint64_t v29 = *(void *)(a2 + 88);
  uint64_t v30 = *(void *)(a2 + 96);
  uint64_t v31 = *(void *)(a2 + 104);
  uint64_t v32 = *(void *)(a2 + 112);
  uint64_t v33 = *(void *)(a2 + 120);
  unsigned __int8 v34 = *(unsigned char *)(a2 + 128);
  sub_2D360(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v27, v28, v29, v30, v31, v32, v33, v34);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  long long v20 = *(_OWORD *)(a1 + 64);
  long long v21 = *(_OWORD *)(a1 + 80);
  long long v22 = *(_OWORD *)(a1 + 96);
  uint64_t v23 = *(void *)(a1 + 112);
  uint64_t v24 = *(void *)(a1 + 120);
  unsigned __int8 v25 = *(unsigned char *)(a1 + 128);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v27;
  *(void *)(a1 + 80) = v28;
  *(void *)(a1 + 88) = v29;
  *(void *)(a1 + 96) = v30;
  *(void *)(a1 + 104) = v31;
  *(void *)(a1 + 112) = v32;
  *(void *)(a1 + 120) = v33;
  *(unsigned char *)(a1 + 128) = v34;
  sub_2D474(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, v24, v25);
  return a1;
}

void *initializeWithTake for CallContact(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x81uLL);
}

uint64_t assignWithTake for CallContact(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 128);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  long long v12 = *(_OWORD *)(a1 + 64);
  long long v13 = *(_OWORD *)(a1 + 80);
  long long v14 = *(_OWORD *)(a1 + 96);
  uint64_t v15 = *(void *)(a1 + 112);
  uint64_t v16 = *(void *)(a1 + 120);
  unsigned __int8 v17 = *(unsigned char *)(a1 + 128);
  long long v18 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v18;
  long long v19 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v19;
  long long v20 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v20;
  long long v21 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v21;
  *(unsigned char *)(a1 + 128) = v3;
  sub_2D474(v4, v6, v5, v7, v8, v9, v10, v11, v12, *((uint64_t *)&v12 + 1), v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v15, v16, v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for CallContact(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 129))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 128);
      if (v3 <= 2) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CallContact(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 128) = 0;
    *(void *)uint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 129) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 129) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 128) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2D8C0(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)uint64_t result = a2 - 2;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    LOBYTE(a2) = 2;
    *(void *)(result + 120) = 0;
  }
  *(unsigned char *)(result + 128) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CallContact()
{
  return &type metadata for CallContact;
}

uint64_t type metadata accessor for EmergencyPoisonControlBasicIntentCATs()
{
  uint64_t result = qword_6D4C0;
  if (!qword_6D4C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2D968()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2D9A8(uint64_t a1, char a2)
{
  return sub_2DA14(a1, a2);
}

uint64_t sub_2D9CC(uint64_t a1, char a2)
{
  return sub_2DA4C(a1, a2);
}

uint64_t sub_2D9F0(uint64_t a1, uint64_t a2, char a3)
{
  return sub_2DC20(a1, a2, a3);
}

uint64_t sub_2DA14(uint64_t a1, char a2)
{
  return sub_2DFE4(a1, a2, 0x6372616553626577, 0xEE00797265755168, 44, 0x8000000000058820);
}

uint64_t sub_2DA4C(uint64_t a1, char a2)
{
  return sub_2DFE4(a1, a2, 0x656D614E67726FLL, 0xE700000000000000, 45, 0x80000000000587F0);
}

uint64_t sub_2DA78(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v19[0] = a5;
  v19[1] = a6;
  uint64_t v10 = sub_2E18(&qword_6BCB8);
  __chkstk_darwin(v10 - 8);
  long long v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2E18(&qword_6BF00);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_547D0;
  long long v14 = (uint64_t *)(v13 + 48);
  *(void *)(v13 + 32) = a3;
  *(void *)(v13 + 40) = a4;
  sub_7C74(a1, (uint64_t)v12, &qword_6BCB8);
  uint64_t v15 = sub_53AD0();
  if (sub_5800((uint64_t)v12, 1, v15) == 1)
  {
    sub_7CD4((uint64_t)v12, &qword_6BCB8);
    *(_OWORD *)long long v14 = 0u;
    *(_OWORD *)(v13 + 64) = 0u;
  }
  else
  {
    *(void *)(v13 + 72) = v15;
    sub_5DC4(v14);
    sub_7D4C();
    (*(void (**)(uint64_t, char *))(v16 + 32))(v17, v12);
  }
  *(void *)(v13 + 80) = 0xD000000000000012;
  *(void *)(v13 + 88) = 0x80000000000575A0;
  *(void *)(v13 + 120) = &type metadata for Bool;
  *(unsigned char *)(v13 + 96) = a2 & 1;
  sub_53A60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2DC20(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = sub_2E18(&qword_6BCB8);
  __chkstk_darwin(v7 - 8);
  sub_7D34();
  sub_2E18(&qword_6BF00);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_547E0;
  uint64_t v9 = (uint64_t *)(v8 + 48);
  *(void *)(v8 + 32) = 0x656D614E67726FLL;
  *(void *)(v8 + 40) = 0xE700000000000000;
  sub_7C74(a1, v3, &qword_6BCB8);
  uint64_t v10 = sub_53AD0();
  if (sub_5800(v3, 1, v10) == 1)
  {
    sub_7CD4(v3, &qword_6BCB8);
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v8 + 64) = 0u;
  }
  else
  {
    *(void *)(v8 + 72) = v10;
    sub_5DC4(v9);
    sub_7D4C();
    (*(void (**)(void))(v11 + 32))();
  }
  *(void *)(v8 + 80) = 0x65626D754E67726FLL;
  *(void *)(v8 + 88) = 0xE900000000000072;
  if (a2)
  {
    uint64_t v12 = sub_53A20();
    uint64_t v13 = a2;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    *(void *)(v8 + 104) = 0;
    *(void *)(v8 + 112) = 0;
  }
  *(void *)(v8 + 96) = v13;
  *(void *)(v8 + 120) = v12;
  *(void *)(v8 + 128) = 0xD000000000000012;
  *(void *)(v8 + 136) = 0x80000000000575A0;
  *(void *)(v8 + 168) = &type metadata for Bool;
  *(unsigned char *)(v8 + 144) = a3 & 1;
  swift_retain();
  sub_53A60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2DE1C(uint64_t a1, uint64_t a2)
{
  return sub_2DE70(a1, a2);
}

uint64_t sub_2DE70(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_53B30();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_7D34();
  uint64_t v7 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v7 - 8);
  sub_7C74(a1, (uint64_t)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t *)&unk_6DA80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, a2, v5);
  uint64_t v9 = sub_53A50();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v5);
  sub_7CD4(a1, (uint64_t *)&unk_6DA80);
  return v9;
}

uint64_t sub_2DFDC()
{
  return type metadata accessor for EmergencyPoisonControlBasicIntentCATs();
}

uint64_t sub_2DFE4(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_2DA78(a1, a2, a3, a4, a5 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a6);
}

uint64_t sub_2DFEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_52FA0();
  sub_9120();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_25288();
  sub_52F90();
  sub_52F80();
  sub_52F60();
  sub_52F70();
  sub_2E18(&qword_6D5B8);
  sub_52F30();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_547D0;
  sub_52F20();
  swift_bridgeObjectRelease();
  sub_52F20();
  sub_52F40();
  sub_52F50();
  uint64_t v10 = sub_53030();
  uint64_t result = sub_5800((uint64_t)v5, 1, v10);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v6);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, v5, v10);
  }
  return result;
}

uint64_t sub_2E274(void *a1)
{
  sub_2C00(a1, a1[3]);
  char v2 = sub_53370();
  sub_3048((uint64_t)a1, (uint64_t)v5);
  if (v2)
  {
    char v3 = 1;
  }
  else
  {
    sub_2C00(v5, v5[3]);
    char v3 = sub_53360();
  }
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v5);
  return v3 & 1;
}

id sub_2E30C()
{
  uint64_t v1 = sub_53DB0();
  sub_9120();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_25288();
  uint64_t v5 = sub_53D90();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, v5, v1);
  uint64_t v6 = sub_53DA0();
  os_log_type_t v7 = sub_53E90();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_0, v6, v7, "#SirenAppProvider Feature enabled. Checking active device for app.", v8, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  return [self activeDeviceHasMandrake];
}

uint64_t type metadata accessor for SirenAppProvider()
{
  return self;
}

uint64_t sub_2E478(char a1)
{
  if (a1) {
    return 1886352499;
  }
  else {
    return 0x7472617473;
  }
}

uint64_t type metadata accessor for EmergencyDomesticViolenceBasicIntentCATs()
{
  uint64_t result = qword_6D5C0;
  if (!qword_6D5C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2E4EC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2E52C(uint64_t a1, char a2)
{
  return sub_2E598(a1, a2);
}

uint64_t sub_2E550(uint64_t a1, char a2)
{
  return sub_2E5D0(a1, a2);
}

uint64_t sub_2E574(uint64_t a1, uint64_t a2, char a3)
{
  return sub_2E7A4(a1, a2, a3);
}

uint64_t sub_2E598(uint64_t a1, char a2)
{
  return sub_2EB68(a1, a2, 0x6372616553626577, 0xEE00797265755168, 47, 0x8000000000058960);
}

uint64_t sub_2E5D0(uint64_t a1, char a2)
{
  return sub_2EB68(a1, a2, 0x656D614E67726FLL, 0xE700000000000000, 48, 0x8000000000058920);
}

uint64_t sub_2E5FC(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v19[0] = a5;
  v19[1] = a6;
  uint64_t v10 = sub_2E18(&qword_6BCB8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2E18(&qword_6BF00);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_547D0;
  long long v14 = (uint64_t *)(v13 + 48);
  *(void *)(v13 + 32) = a3;
  *(void *)(v13 + 40) = a4;
  sub_7C74(a1, (uint64_t)v12, &qword_6BCB8);
  uint64_t v15 = sub_53AD0();
  if (sub_5800((uint64_t)v12, 1, v15) == 1)
  {
    sub_7CD4((uint64_t)v12, &qword_6BCB8);
    *(_OWORD *)long long v14 = 0u;
    *(_OWORD *)(v13 + 64) = 0u;
  }
  else
  {
    *(void *)(v13 + 72) = v15;
    sub_5DC4(v14);
    sub_7D4C();
    (*(void (**)(uint64_t, char *))(v16 + 32))(v17, v12);
  }
  *(void *)(v13 + 80) = 0xD000000000000012;
  *(void *)(v13 + 88) = 0x80000000000575A0;
  *(void *)(v13 + 120) = &type metadata for Bool;
  *(unsigned char *)(v13 + 96) = a2 & 1;
  sub_53A60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2E7A4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = sub_2E18(&qword_6BCB8);
  __chkstk_darwin(v7 - 8);
  sub_7D34();
  sub_2E18(&qword_6BF00);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_547E0;
  uint64_t v9 = (uint64_t *)(v8 + 48);
  *(void *)(v8 + 32) = 0x656D614E67726FLL;
  *(void *)(v8 + 40) = 0xE700000000000000;
  sub_7C74(a1, v3, &qword_6BCB8);
  uint64_t v10 = sub_53AD0();
  if (sub_5800(v3, 1, v10) == 1)
  {
    sub_7CD4(v3, &qword_6BCB8);
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v8 + 64) = 0u;
  }
  else
  {
    *(void *)(v8 + 72) = v10;
    sub_5DC4(v9);
    sub_7D4C();
    (*(void (**)(void))(v11 + 32))();
  }
  *(void *)(v8 + 80) = 0x65626D754E67726FLL;
  *(void *)(v8 + 88) = 0xE900000000000072;
  if (a2)
  {
    uint64_t v12 = sub_53A20();
    uint64_t v13 = a2;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    *(void *)(v8 + 104) = 0;
    *(void *)(v8 + 112) = 0;
  }
  *(void *)(v8 + 96) = v13;
  *(void *)(v8 + 120) = v12;
  *(void *)(v8 + 128) = 0xD000000000000012;
  *(void *)(v8 + 136) = 0x80000000000575A0;
  *(void *)(v8 + 168) = &type metadata for Bool;
  *(unsigned char *)(v8 + 144) = a3 & 1;
  swift_retain();
  sub_53A60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2E9A0(uint64_t a1, uint64_t a2)
{
  return sub_2E9F4(a1, a2);
}

uint64_t sub_2E9F4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_53B30();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_7D34();
  uint64_t v7 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v7 - 8);
  sub_7C74(a1, (uint64_t)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t *)&unk_6DA80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, a2, v5);
  uint64_t v9 = sub_53A50();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v5);
  sub_7CD4(a1, (uint64_t *)&unk_6DA80);
  return v9;
}

uint64_t sub_2EB60()
{
  return type metadata accessor for EmergencyDomesticViolenceBasicIntentCATs();
}

uint64_t sub_2EB68(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_2E5FC(a1, a2, a3, a4, a5 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a6);
}

uint64_t type metadata accessor for PoisonControlModernCATs()
{
  uint64_t result = qword_6D610;
  if (!qword_6D610) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2EBB8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2EBF8(uint64_t a1, uint64_t a2)
{
  return sub_2EC4C(a1, a2);
}

uint64_t sub_2EC4C(uint64_t a1, uint64_t a2)
{
  sub_53B30();
  sub_9AD8();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_6140();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v11 - 8);
  sub_6140();
  sub_9A10(a1, v13 - v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v10, a2, v2);
  uint64_t v14 = sub_53AE0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v2);
  sub_9A78(a1);
  return v14;
}

uint64_t sub_2ED78(uint64_t a1, uint64_t a2)
{
  sub_53B30();
  sub_9AD8();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_6140();
  uint64_t v9 = v8 - v7;
  swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v9, a2, v2);
  uint64_t v10 = sub_53AF0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v2);
  return v10;
}

uint64_t sub_2EE54()
{
  return type metadata accessor for PoisonControlModernCATs();
}

uint64_t sub_2EE5C(uint64_t a1)
{
  uint64_t v144 = sub_535F0();
  sub_9120();
  uint64_t v133 = v2;
  __chkstk_darwin(v3);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v4);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v5);
  sub_152E8();
  uint64_t v147 = v6;
  uint64_t v7 = type metadata accessor for EmergencyNLIntent();
  uint64_t v8 = sub_FEC4(v7);
  __chkstk_darwin(v8);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v9);
  sub_152E8();
  sub_FE14(v10);
  uint64_t v138 = sub_53920();
  sub_9120();
  uint64_t v136 = v11;
  __chkstk_darwin(v12);
  sub_6150();
  sub_FE14(v13);
  uint64_t v14 = sub_53670();
  uint64_t v15 = sub_FEC4(v14);
  __chkstk_darwin(v15);
  sub_FE14((uint64_t)v123 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = sub_53CD0();
  uint64_t v18 = sub_FEC4(v17);
  __chkstk_darwin(v18);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v19);
  sub_152E8();
  sub_FE14(v20);
  uint64_t v128 = sub_53620();
  sub_9120();
  uint64_t v125 = v21;
  __chkstk_darwin(v22);
  sub_6150();
  sub_FE14(v23);
  sub_53600();
  sub_9120();
  uint64_t v148 = v25;
  uint64_t v149 = v24;
  __chkstk_darwin(v24);
  sub_6150();
  uint64_t v146 = v26;
  sub_535B0();
  sub_9120();
  __chkstk_darwin(v27);
  uint64_t v28 = sub_53DB0();
  sub_9120();
  uint64_t v30 = v29;
  __chkstk_darwin(v31);
  sub_612C();
  uint64_t v145 = v32;
  __chkstk_darwin(v33);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v34);
  sub_FF3C();
  char v150 = v35;
  __chkstk_darwin(v36);
  sub_FDEC();
  __chkstk_darwin(v37);
  long long v39 = (char *)v123 - v38;
  uint64_t v40 = sub_53D90();
  sub_6108();
  uint64_t v41 = *(void *)(v30 + 16);
  uint64_t v142 = v40;
  uint64_t v141 = v30 + 16;
  uint64_t v140 = v41;
  sub_FE98();
  v42();
  uint64_t v143 = a1;
  sub_FE98();
  v43();
  id v44 = sub_53DA0();
  os_log_type_t v45 = sub_53E90();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = (uint8_t *)sub_1001C();
    uint64_t v47 = swift_slowAlloc();
    uint64_t v131 = v28;
    v151[0] = v47;
    uint64_t v129 = v30;
    *(_DWORD *)uint64_t v46 = 136315138;
    uint64_t v139 = (void (*)(char *, uint64_t))(v46 + 4);
    sub_3217C(&qword_6C3D8, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v48 = sub_53FD0();
    uint64_t v153 = sub_50F10(v48, v49, v151);
    uint64_t v30 = v129;
    sub_53EF0();
    swift_bridgeObjectRelease();
    uint64_t v50 = sub_322DC();
    v51(v50);
    _os_log_impl(&dword_0, v44, v45, "#EmergencyCSAMFlow onInput: %s", v46, 0xCu);
    swift_arrayDestroy();
    uint64_t v28 = v131;
    sub_60F0();
    sub_60F0();
  }
  else
  {
    uint64_t v52 = sub_322DC();
    v53(v52);
  }

  uint64_t v139 = *(void (**)(char *, uint64_t))(v30 + 8);
  v139(v39, v28);
  os_log_type_t v54 = v146;
  sub_535A0();
  unsigned __int16 v55 = v148;
  int v56 = (*(uint64_t (**)(_DWORD *, uint64_t))(v148 + 88))(v54, v149);
  uint64_t v57 = v144;
  uint64_t v58 = v147;
  uint64_t v59 = v150;
  if (v56 != enum case for Parse.NLv3IntentOnly(_:))
  {
    if (v56 != enum case for Parse.directInvocation(_:))
    {
      uint64_t v67 = v145;
      if (v56 != enum case for Parse.uso(_:))
      {
        sub_321E8();
        uint64_t v110 = (_DWORD *)v123[2];
        sub_321C4();
        v111();
        uint64_t v112 = (void *)sub_53DA0();
        os_log_type_t v113 = sub_53EA0();
        if (sub_FFD0(v113))
        {
          sub_1001C();
          uint64_t v153 = sub_FF98();
          _DWORD *v110 = 136315138;
          LOBYTE(v154) = 0;
          uint64_t v129 = v30;
          uint64_t v114 = sub_53E10();
          uint64_t v154 = sub_50F10(v114, v115, &v153);
          sub_53EF0();
          swift_bridgeObjectRelease();
          sub_FEF0(&dword_0, v116, v117, "%s");
          swift_arrayDestroy();
          os_log_type_t v54 = v146;
          sub_60F0();
          sub_60F0();
        }

        sub_3229C();
        v122();
        (*(void (**)(_DWORD *, uint64_t))(v148 + 8))(v54, v149);
        return 0;
      }
      uint64_t v90 = sub_32254();
      v91(v90);
      uint64_t v92 = v125;
      uint64_t v93 = v123[3];
      uint64_t v94 = v128;
      sub_252CC();
      v95();
      long long v39 = v127;
      unsigned __int16 v55 = v93;
      sub_53610();
      v151[3] = (uint64_t)&type metadata for EmergencyFeatureFlagsKey;
      v151[4] = sub_F998();
      LOBYTE(v151[0]) = 2;
      sub_53640();
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v151);
      uint64_t v96 = v126;
      sub_53CC0();
      uint64_t v65 = v124;
      sub_F9E4(v96, v124, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
      sub_313B0(v65);
      sub_322CC();
      sub_32128(v96, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
      (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v93, v94);
      goto LABEL_7;
    }
    uint64_t v75 = sub_32254();
    v76(v75);
    sub_252CC();
    v77();
    sub_321E8();
    sub_321C4();
    v78();
    uint64_t v79 = sub_53DA0();
    os_log_type_t v80 = sub_53E90();
    if (os_log_type_enabled(v79, v80))
    {
      uint64_t v81 = (uint8_t *)sub_61F0();
      *(_WORD *)uint64_t v81 = 0;
      _os_log_impl(&dword_0, v79, v80, "EmergencyCSAMFlow onInput .directInvocation", v81, 2u);
      sub_60F0();
    }
    long long v39 = (char *)0xD000000000000035;

    uint64_t v82 = v30 + 8;
    v139(v134, v28);
    unsigned __int16 v55 = v58;
    uint64_t v83 = sub_535D0();
    uint64_t v65 = v84;
    if (v83 == 0xD000000000000035 && v84 == 0x8000000000057B10)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      unsigned __int16 v55 = sub_53FE0();
      swift_bridgeObjectRelease();
      if ((v55 & 1) == 0) {
        goto LABEL_22;
      }
    }
    if (sub_2C188() != 35)
    {
      sub_53C00();
      sub_322CC();
      sub_15450();
      v118();
      goto LABEL_6;
    }
LABEL_22:
    sub_321E8();
    sub_321C4();
    v98();
    uint64_t v99 = v133;
    uint64_t v131 = v28;
    uint64_t v100 = *(void (**)(uint64_t, uint64_t, uint64_t))(v133 + 16);
    uint64_t v101 = v130;
    v100(v130, v58, v57);
    uint64_t v102 = (void *)sub_53DA0();
    os_log_type_t v103 = sub_53EA0();
    if (sub_FFD0(v103))
    {
      sub_1001C();
      uint64_t v149 = sub_FF98();
      uint64_t v154 = v149;
      *uint64_t v59 = 136315138;
      uint64_t v146 = v59 + 1;
      uint64_t v148 = v82;
      ((void (*)(void))v100)(v123[1]);
      uint64_t v104 = sub_53E10();
      uint64_t v152 = sub_50F10(v104, v105, &v154);
      sub_53EF0();
      swift_bridgeObjectRelease();
      uint64_t v106 = *(void (**)(void))(v99 + 8);
      sub_FF30();
      v106();
      sub_FEF0(&dword_0, v107, v108, "Failed to get emergencySituation from DirectInvocation: %s");
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();

      sub_322B4();
      sub_15450();
      v109();
      sub_FF30();
      v106();
    }
    else
    {

      uint64_t v119 = *(void (**)(uint64_t, uint64_t))(v99 + 8);
      v119(v101, v57);
      uint64_t v120 = sub_322B4();
      v121(v120);
      v119(v58, v57);
    }
    return 0;
  }
  uint64_t v60 = sub_32254();
  v61(v60);
  sub_252CC();
  v62();
  uint64_t v63 = v137;
  sub_FE98();
  v64();
  uint64_t v65 = v135;
  sub_F9E4(v63, v135, (void (*)(void))type metadata accessor for EmergencyNLIntent);
  sub_31684(v65);
  sub_322CC();
  sub_32128(v63, (void (*)(void))type metadata accessor for EmergencyNLIntent);
  sub_FF30();
  v66();
LABEL_6:
  uint64_t v67 = v145;
LABEL_7:
  if (v39 != (unsigned char *)&dword_0 + 1)
  {
    uint64_t v85 = v132;
    uint64_t v86 = v132[17];
    uint64_t v87 = v132[18];
    uint64_t v88 = v132[19];
    v132[17] = v55;
    v85[18] = v65;
    v85[19] = v39;
    sub_31398(v86, v87, v88);
    return 1;
  }
  sub_321E8();
  sub_321C4();
  v68();
  os_log_type_t v69 = (void *)sub_53DA0();
  os_log_type_t v70 = sub_53EA0();
  if (sub_FFD0(v70))
  {
    sub_1001C();
    uint64_t v154 = sub_FF98();
    *uint64_t v67 = 136315138;
    LOBYTE(v152) = 0;
    uint64_t v71 = sub_53E10();
    uint64_t v152 = sub_50F10(v71, v72, &v154);
    sub_53EF0();
    swift_bridgeObjectRelease();
    sub_FEF0(&dword_0, v73, v74, "%s");
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();
  }

  sub_3229C();
  v97();
  return 0;
}

uint64_t sub_2FBDC(void (*a1)(uint64_t), uint64_t a2)
{
  void (*v48)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v49;
  char v50;
  void (*v51)(void);
  void *v52;
  os_log_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  int v58;
  void (*v59)(uint64_t);
  uint64_t v60;
  uint64_t v61;
  unsigned char *v62;
  void *v63;
  void (*v64)(void);
  void *v65;
  NSObject *v66;
  os_log_type_t v67;
  int v68;
  uint8_t *v69;
  void *v70;
  uint8_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  os_log_t v78;
  void (*v79)(void);
  void (*v80);
  NSObject *v81;
  void (*v82)(void);
  NSObject *v83;
  os_log_type_t v84;
  uint8_t *v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(void);
  os_log_type_t v89;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(void);
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t);
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void (*v103)(uint64_t);
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void (*v109)(void);
  uint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  os_log_t v120;
  uint64_t v121;
  uint64_t v122;
  NSObject *v123;
  void (*v124)(void, void, void);
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void (*v128)(uint64_t);
  uint64_t v129[3];
  void __dst[14];

  uint64_t v4 = v2;
  uint64_t v128 = a1;
  uint64_t v118 = sub_53250();
  sub_9120();
  uint64_t v117 = v6;
  __chkstk_darwin(v7);
  sub_FE14((uint64_t)&v104 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v114 = sub_53B50();
  sub_6188();
  __chkstk_darwin(v9);
  sub_6150();
  unint64_t v115 = v10;
  uint64_t v11 = sub_2E18(&qword_6D270);
  uint64_t v12 = sub_FEC4(v11);
  __chkstk_darwin(v12);
  sub_6150();
  uint64_t v120 = v13;
  uint64_t v119 = sub_2E18(&qword_6BCA8);
  sub_6188();
  __chkstk_darwin(v14);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v15);
  sub_152E8();
  sub_FE14(v16);
  uint64_t v122 = sub_53070();
  sub_9120();
  uint64_t v121 = v17;
  __chkstk_darwin(v18);
  unint64_t v127 = sub_53490();
  sub_9120();
  uint64_t v126 = v19;
  __chkstk_darwin(v20);
  sub_6150();
  sub_FE14(v21);
  uint64_t v22 = sub_53DB0();
  sub_9120();
  uint64_t v24 = v23;
  __chkstk_darwin(v25);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v26);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v27);
  sub_FDEC();
  __chkstk_darwin(v28);
  uint64_t v30 = (char *)&v104 - v29;
  uint64_t v31 = sub_53D90();
  sub_6108();
  uint64_t v32 = *(void (**)(void, void, void))(v24 + 16);
  uint64_t v125 = v31;
  uint64_t v124 = v32;
  v32(v30, v31, v22);
  uint64_t v33 = sub_53DA0();
  os_log_type_t v34 = sub_53E90();
  if (sub_FFD0(v34))
  {
    uint64_t v35 = (uint8_t *)sub_61F0();
    *(_WORD *)uint64_t v35 = 0;
    _os_log_impl(&dword_0, v33, v3, "#EmergencyCSAMFlow execute", v35, 2u);
    sub_60F0();
  }

  uint64_t v36 = *(void (**)(void))(v24 + 8);
  sub_FF30();
  v36();
  uint64_t v37 = v4[19];
  if (v37 == 1)
  {
    sub_F824();
    uint64_t v38 = swift_allocError();
    *long long v39 = 2;
    uint64_t v40 = sub_2C00(v4 + 7, v4[10]);
    memcpy(__dst, v40, sizeof(__dst));
    uint64_t v41 = v38;
    uint64_t v42 = (uint64_t)(v4 + 2);
    os_log_type_t v43 = v128;
    uint64_t v44 = a2;
    goto LABEL_7;
  }
  if (v37 != 2)
  {
    uint64_t v109 = v36;
    uint64_t v107 = a2;
    unint64_t v105 = v4[17];
    uint64_t v106 = v4[18];
    uint64_t v47 = v4[5];
    uint64_t v46 = v4[6];
    uint64_t v111 = v4;
    uint64_t v108 = v4 + 2;
    sub_2C00(v4 + 2, v47);
    uint64_t v48 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v46 + 8);
    uint64_t v110 = v37;
    swift_bridgeObjectRetain();
    v48(__dst, v47, v46);
    sub_2C00(__dst, __dst[3]);
    sub_53350();
    if (v49)
    {
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)__dst);
      sub_53050();
      uint64_t v50 = sub_30E04();
      sub_15450();
      v51();
      if (v50)
      {
        uint64_t v52 = v108;
        uint64_t v53 = v120;
        os_log_type_t v54 = v105;
        unsigned __int16 v55 = v106;
        int v56 = v110;
        uint64_t v57 = v111;
        sub_3074C((uint64_t)v120);
        uint64_t v58 = sub_5800((uint64_t)v53, 1, v119);
        uint64_t v59 = v128;
        uint64_t v60 = v107;
        if (v58 != 1)
        {
          uint64_t v98 = (uint64_t)v53;
          uint64_t v99 = v113;
          sub_32020(v98, v113);
          sub_3097C();
          sub_31398(v54, v55, v56);
          uint64_t v100 = v112;
          sub_2FE0(v99, v112);
          sub_3048((uint64_t)v52, (uint64_t)__dst);
          uint64_t v101 = v115;
          sub_53B40();
          sub_3217C((unint64_t *)&qword_6BCB0, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
          sub_3228C();
          sub_53440();
          v59(v100);
          uint64_t v102 = sub_3226C();
          v103(v102);
          sub_32128(v101, (void (*)(void))&type metadata accessor for OutputFlow);
          return sub_14A94(v99, &qword_6BCA8);
        }
        sub_31398(v54, v55, v56);
        sub_14A94((uint64_t)v53, &qword_6D270);
        sub_F824();
        uint64_t v61 = swift_allocError();
        *uint64_t v62 = 2;
        uint64_t v63 = sub_2C00(v57 + 7, v57[10]);
        memcpy(__dst, v63, sizeof(__dst));
        uint64_t v41 = v61;
        uint64_t v42 = (uint64_t)v52;
        os_log_type_t v43 = v59;
        uint64_t v44 = v60;
LABEL_7:
        sub_31C20(v41, v42, __dst, v43, v44);
        return swift_errorRelease();
      }
    }
    else
    {
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)__dst);
    }
    sub_321E8();
    sub_3223C();
    v64();
    uint64_t v65 = v111;
    swift_retain_n();
    uint64_t v66 = sub_53DA0();
    uint64_t v67 = sub_53EA0();
    uint64_t v68 = v67;
    if (os_log_type_enabled(v66, v67))
    {
      LODWORD(v122) = v68;
      os_log_type_t v69 = (uint8_t *)sub_1001C();
      uint64_t v121 = swift_slowAlloc();
      v129[0] = v121;
      uint64_t v120 = v66;
      os_log_type_t v70 = v65;
      uint64_t v71 = v69;
      *(_DWORD *)os_log_type_t v69 = 136315138;
      uint64_t v73 = v70[5];
      unint64_t v72 = v70[6];
      sub_2C00(v108, v73);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v72 + 8))(__dst, v73, v72);
      sub_2C00(__dst, __dst[3]);
      uint64_t v74 = sub_53350();
      if (v75) {
        uint64_t v76 = v74;
      }
      else {
        uint64_t v76 = 0x3E6C696E3CLL;
      }
      if (v75) {
        uint64_t v77 = v75;
      }
      else {
        uint64_t v77 = 0xE500000000000000;
      }
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)__dst);
      __dst[0] = sub_50F10(v76, v77, v129);
      sub_53EF0();
      swift_release_n();
      swift_bridgeObjectRelease();
      os_log_type_t v78 = v120;
      _os_log_impl(&dword_0, v120, (os_log_type_t)v122, "#EmergencyCSAMFlow execute unsupported locale: %s", v71, 0xCu);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();
    }
    else
    {

      swift_release_n();
    }
    uint64_t v79 = v109;
    sub_FF30();
    v79();
    os_log_type_t v80 = (void (*))v128;
    uint64_t v81 = v123;
    if (v110)
    {
      sub_6108();
      sub_3223C();
      v82();
      uint64_t v83 = sub_53DA0();
      uint64_t v84 = sub_53EA0();
      if (os_log_type_enabled(v83, v84))
      {
        uint64_t v85 = (uint8_t *)sub_61F0();
        *(_WORD *)uint64_t v85 = 0;
        _os_log_impl(&dword_0, v83, v84, "#EmergencyCSAMFlow Falling back to websearch", v85, 2u);
        uint64_t v79 = v109;
        sub_60F0();
      }

      sub_FF30();
      v79();
      uint64_t v86 = v111[5];
      uint64_t v87 = v111[6];
      sub_2C00(v108, v86);
      (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v87 + 16))(&__dst[2], v86, v87);
      __dst[0] = v106;
      __dst[1] = v110;
      sub_1B480();
      sub_3228C();
      sub_53440();
      sub_1B4CC((uint64_t)__dst);
    }
    else
    {
      sub_321E8();
      sub_3223C();
      v88();
      uint64_t v81 = sub_53DA0();
      unint64_t v89 = sub_53EA0();
      if (os_log_type_enabled(v81, v89))
      {
        *(_WORD *)sub_61F0() = 0;
        sub_FED0(&dword_0, v90, v91, "#EmergencyCSAMFlow Falling back to server execution");
        sub_60F0();
      }

      sub_FF30();
      v92();
      uint64_t v93 = v117;
      uint64_t v94 = v116;
      uint64_t v95 = v118;
      (*(void (**)(uint64_t, void, uint64_t))(v117 + 104))(v116, enum case for FlowUnhandledReason.needsServerExecution(_:), v118);
      sub_3228C();
      sub_53480();
      (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v94, v95);
    }
    v80(v81);
    goto LABEL_30;
  }
  sub_3228C();
  sub_53460();
  v128((uint64_t)v36);
LABEL_30:
  uint64_t v96 = sub_3226C();
  return v97(v96);
}

uint64_t sub_3074C@<X0>(uint64_t a1@<X8>)
{
  if (sub_53C10())
  {
    sub_32208();
    sub_43978();
LABEL_8:
    swift_release();
    uint64_t v4 = 0;
    goto LABEL_9;
  }
  if (sub_53CF0() == 0xD000000000000013 && v2 == 0x8000000000057760)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    sub_32208();
    sub_43958();
    goto LABEL_8;
  }
  char v3 = sub_53FE0();
  swift_bridgeObjectRelease();
  if (v3) {
    goto LABEL_7;
  }
  if (sub_53CF0() == 0xD000000000000010 && v7 == 0x8000000000057780)
  {
    swift_bridgeObjectRelease();
LABEL_16:
    sub_32208();
    sub_439B4();
    goto LABEL_8;
  }
  char v8 = sub_53FE0();
  swift_bridgeObjectRelease();
  if (v8) {
    goto LABEL_16;
  }
  if (sub_53CF0() == 0x7078655F6D617363 && v9 == 0xED0000746963696CLL)
  {
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  char v11 = sub_53FE0();
  swift_bridgeObjectRelease();
  if (v11)
  {
LABEL_24:
    sub_32208();
    sub_53A60();
    goto LABEL_8;
  }
  uint64_t v4 = 1;
LABEL_9:
  uint64_t v5 = sub_2E18(&qword_6BCA8);

  return sub_34DC(a1, v4, 1, v5);
}

void *sub_3097C()
{
  uint64_t v1 = v0;
  sub_53DB0();
  sub_9120();
  uint64_t v51 = v3;
  uint64_t v52 = v2;
  __chkstk_darwin(v2);
  sub_6150();
  uint64_t v50 = v4;
  uint64_t v5 = sub_2E18((uint64_t *)&unk_6DA80);
  uint64_t v6 = sub_FEC4(v5);
  __chkstk_darwin(v6);
  sub_612C();
  uint64_t v48 = v7;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v44 - v9;
  uint64_t v49 = sub_53030();
  sub_9120();
  uint64_t v47 = v11;
  __chkstk_darwin(v12);
  sub_6150();
  uint64_t v46 = v13;
  sub_2E18(&qword_6BCA8);
  sub_6188();
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v44 - v18;
  type metadata accessor for CsamSituation();
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_8438();
  sub_2C00(v1 + 7, v1[10]);
  swift_retain();
  uint64_t v21 = swift_retain();
  sub_43998(v21);
  swift_release();
  swift_release();
  uint64_t v22 = sub_54060();
  uint64_t v24 = v23;
  sub_14A94((uint64_t)v19, &qword_6BCA8);
  if (v24)
  {
    uint64_t v45 = v22;
    sub_2C00(v1 + 7, v1[10]);
    swift_retain();
    swift_retain();
    sub_439D4(v20);
    swift_release();
    swift_release();
    sub_54060();
    uint64_t v26 = v25;
    sub_14A94((uint64_t)v17, &qword_6BCA8);
    if (v26)
    {
      sub_53020();
      swift_bridgeObjectRelease();
      uint64_t v27 = v49;
      if (sub_5800((uint64_t)v10, 1, v49) != 1)
      {
        uint64_t v35 = v46;
        uint64_t v36 = v47;
        sub_252CC();
        v37();
        uint64_t v38 = v48;
        uint64_t v39 = v35;
        sub_FE98();
        v40();
        sub_34DC(v38, 0, 1, v27);
        uint64_t v41 = v1[5];
        uint64_t v42 = v1[6];
        sub_2C00(v1 + 2, v41);
        (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v42 + 8))(v53, v41, v42);
        os_log_type_t v34 = sub_391FC(v38, v53, v45, v24);
        swift_release();
        swift_bridgeObjectRelease();
        _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v53);
        sub_14A94(v38, (uint64_t *)&unk_6DA80);
        (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v39, v27);
        return v34;
      }
      swift_bridgeObjectRelease();
      sub_14A94((uint64_t)v10, (uint64_t *)&unk_6DA80);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  sub_53D90();
  sub_6108();
  sub_FE98();
  v28();
  uint64_t v29 = sub_53DA0();
  os_log_type_t v30 = sub_53E90();
  if (os_log_type_enabled(v29, v30))
  {
    *(_WORD *)sub_61F0() = 0;
    sub_FED0(&dword_0, v31, v32, "#EmergencyCSAMFlow Failed to execute CAT");
    sub_60F0();
  }

  sub_FF30();
  v33();
  swift_release();
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_30E04()
{
  if (qword_6B928 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_6D660;
  swift_bridgeObjectRetain();
  uint64_t v1 = sub_53060();
  char v3 = sub_30E94(v1, v2, v0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_30E94(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_53FE0();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_53FE0() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t *sub_30F5C()
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v0 + 2));
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v0 + 7));
  sub_6068((uint64_t)(v0 + 12));
  sub_31398(v0[17], v0[18], v0[19]);
  return v0;
}

uint64_t sub_30F98()
{
  sub_30F5C();

  return _swift_deallocClassInstance(v0, 160, 7);
}

uint64_t type metadata accessor for EmergencyCSAMFlow()
{
  return self;
}

unint64_t destroy for EmergencyCSAMFlow.EmergencyCSAMFlowState(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 16);
  int v2 = -1;
  if (result < 0xFFFFFFFF) {
    int v2 = result;
  }
  if (v2 - 1 < 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s19EmergencyFlowPlugin17EmergencyCSAMFlowC22EmergencyCSAMFlowStateOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 16);
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF) {
    uint64_t v4 = *(void *)(a2 + 16);
  }
  if ((int)v4 - 1 < 0)
  {
    *(_WORD *)a1 = *(_WORD *)a2;
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    *(void *)(a1 + 16) = v3;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
  }
  return a1;
}

uint64_t assignWithCopy for EmergencyCSAMFlow.EmergencyCSAMFlowState(uint64_t a1, long long *a2)
{
  LODWORD(v4) = -1;
  if (*(void *)(a1 + 16) >= 0xFFFFFFFFuLL) {
    LODWORD(v5) = -1;
  }
  else {
    uint64_t v5 = *(void *)(a1 + 16);
  }
  int v6 = v5 - 1;
  if (*((void *)a2 + 2) < 0xFFFFFFFFuLL) {
    uint64_t v4 = *((void *)a2 + 2);
  }
  int v7 = v4 - 1;
  if (v6 < 0)
  {
    if (v7 < 0)
    {
      *(unsigned char *)a1 = *(unsigned char *)a2;
      *(unsigned char *)(a1 + 1) = *((unsigned char *)a2 + 1);
      *(void *)(a1 + 8) = *((void *)a2 + 1);
      *(void *)(a1 + 16) = *((void *)a2 + 2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if ((v7 & 0x80000000) == 0)
  {
LABEL_11:
    long long v8 = *a2;
    *(void *)(a1 + 16) = *((void *)a2 + 2);
    *(_OWORD *)a1 = v8;
    return a1;
  }
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *((unsigned char *)a2 + 1);
  *(void *)(a1 + 8) = *((void *)a2 + 1);
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  swift_bridgeObjectRetain();
  return a1;
}

__n128 initializeWithTake for EmergencyCSAMFlow.EmergencyCSAMFlowState(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for EmergencyCSAMFlow.EmergencyCSAMFlowState(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 16);
  int v5 = -1;
  if (v4 < 0xFFFFFFFF) {
    int v5 = v4;
  }
  if (v5 - 1 < 0)
  {
    unint64_t v6 = *(void *)(a2 + 16);
    LODWORD(v7) = -1;
    if (v6 < 0xFFFFFFFF) {
      uint64_t v7 = *(void *)(a2 + 16);
    }
    if ((int)v7 - 1 < 0)
    {
      *(_WORD *)a1 = *(_WORD *)a2;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      *(void *)(a1 + 16) = v6;
      swift_bridgeObjectRelease();
      return a1;
    }
    swift_bridgeObjectRelease();
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for EmergencyCSAMFlow.EmergencyCSAMFlowState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFD && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  unsigned int v5 = v4 + 1;
  unsigned int v6 = v4 - 1;
  if (v5 >= 3) {
    return v6;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for EmergencyCSAMFlow.EmergencyCSAMFlowState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2 + 2;
    }
  }
  return result;
}

uint64_t sub_3129C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

void *sub_312C0(void *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    result[1] = 0;
    result[2] = 0;
    *__n128 result = a2 - 0x7FFFFFFF;
  }
  else if (a2)
  {
    result[2] = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyCSAMFlow.EmergencyCSAMFlowState()
{
  return &type metadata for EmergencyCSAMFlow.EmergencyCSAMFlowState;
}

uint64_t sub_31300(uint64_t a1)
{
  return sub_2EE5C(a1) & 1;
}

uint64_t sub_31328(void (*a1)(uint64_t), uint64_t a2)
{
  return sub_2FBDC(a1, a2);
}

uint64_t sub_3134C()
{
  type metadata accessor for EmergencyCSAMFlow();

  return sub_53230();
}

void sub_31384()
{
  qword_6D660 = (uint64_t)&off_65AC0;
}

uint64_t sub_31398(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((unint64_t)(a3 - 1) >= 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_313B0(uint64_t a1)
{
  uint64_t v2 = sub_53DB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unsigned int v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[3] = sub_53CD0();
  void v20[4] = (uint64_t)&protocol witness table for EmergencyDialogAct;
  unsigned int v6 = sub_5DC4(v20);
  sub_FA9C(a1, (uint64_t)v6, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
  uint64_t v7 = sub_53D90();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
  sub_3048((uint64_t)v20, (uint64_t)v19);
  long long v8 = sub_53DA0();
  os_log_type_t v9 = sub_53E90();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v16 = v2;
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v15 = v10 + 4;
    sub_3048((uint64_t)v19, (uint64_t)v17);
    sub_2E18(&qword_6C3E0);
    uint64_t v11 = sub_53E10();
    v17[0] = sub_50F10(v11, v12, &v18);
    sub_53EF0();
    swift_bridgeObjectRelease();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v19);
    _os_log_impl(&dword_0, v8, v9, "Converting EmergencyDialogAct to EmergencyCSAMIntent: %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v16);
  }
  else
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v19);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  uint64_t v13 = sub_53C00();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v20);
  return v13;
}

uint64_t sub_31684(uint64_t a1)
{
  uint64_t v2 = sub_53920();
  uint64_t v31 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  os_log_type_t v30 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_53DB0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = type metadata accessor for EmergencyNLIntent();
  uint64_t v37 = sub_3217C(&qword_6C3E8, (void (*)(uint64_t))type metadata accessor for EmergencyNLIntent);
  long long v8 = sub_5DC4(v35);
  sub_FA9C(a1, (uint64_t)v8, (void (*)(void))type metadata accessor for EmergencyNLIntent);
  uint64_t v9 = sub_53D90();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v9, v4);
  sub_3048((uint64_t)v35, (uint64_t)v34);
  uint64_t v10 = sub_53DA0();
  os_log_type_t v11 = sub_53E90();
  if (os_log_type_enabled(v10, v11))
  {
    unint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    uint64_t v33 = v27;
    uint64_t v29 = v2;
    *(_DWORD *)unint64_t v12 = 136315138;
    v25[1] = v12 + 4;
    uint64_t v28 = v8;
    uint64_t v13 = sub_2C00(v34, v34[3]);
    v25[0] = v25;
    __chkstk_darwin(v13);
    uint64_t v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v16 + 16))(v15);
    uint64_t v17 = sub_3F488();
    uint64_t v26 = v4;
    unint64_t v19 = v18;
    sub_32128((uint64_t)v15, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    uint64_t v20 = v17;
    long long v8 = v28;
    uint64_t v32 = sub_50F10(v20, v19, &v33);
    uint64_t v2 = v29;
    sub_53EF0();
    swift_bridgeObjectRelease();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v34);
    _os_log_impl(&dword_0, v10, v11, "Converting EmergencyNLIntent: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v26);
  }
  else
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v34);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_2C00(v35, v36);
  if (qword_6B908 != -1) {
    swift_once();
  }
  sub_3217C(&qword_6C0B0, (void (*)(uint64_t))type metadata accessor for EmergencyNLIntent);
  sub_537F0();
  sub_2C00(v35, v36);
  if (qword_6B900 != -1) {
    swift_once();
  }
  sub_537F0();
  uint64_t v22 = v30;
  uint64_t v21 = v31;
  (*(void (**)(char *, uint64_t *, uint64_t))(v31 + 16))(v30, v8, v2);
  sub_53910();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v22, v2);
  uint64_t v23 = sub_53C00();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v35);
  return v23;
}

uint64_t sub_31C20(uint64_t a1, uint64_t a2, const void *a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v34 = a5;
  uint64_t v9 = sub_53490();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_53DB0();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = &type metadata for EmergencyCATProvider;
  uint64_t v38 = &off_66E10;
  v36[0] = swift_allocObject();
  memcpy((void *)(v36[0] + 16), a3, 0x70uLL);
  sub_2EFC((uint64_t)a3);
  uint64_t v17 = sub_53D90();
  swift_beginAccess();
  unint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v33 = v13;
  v18(v16, v17, v13);
  swift_errorRetain();
  swift_errorRetain();
  unint64_t v19 = sub_53DA0();
  os_log_type_t v20 = sub_53EB0();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v30 = a2;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v31 = v9;
    uint64_t v22 = (uint8_t *)v21;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v32 = a4;
    __dst[0] = v23;
    uint64_t v29 = v12;
    *(_DWORD *)uint64_t v22 = 136315138;
    v28[1] = v22 + 4;
    uint64_t v35 = a1;
    swift_errorRetain();
    sub_2E18(&qword_6BCA0);
    uint64_t v24 = sub_53E10();
    uint64_t v35 = sub_50F10(v24, v25, __dst);
    unint64_t v12 = v29;
    sub_53EF0();
    a2 = v30;
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v19, v20, "Execution Error: %s", v22, 0xCu);
    swift_arrayDestroy();
    a4 = v32;
    swift_slowDealloc();
    uint64_t v9 = v31;
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v33);
  uint64_t v26 = sub_2C00(v36, (uint64_t)v37);
  memcpy(__dst, v26, 0x70uLL);
  sub_2C44(a2, __dst);
  sub_53450();
  swift_release();
  a4(v12);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v36);
}

uint64_t sub_32020(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2E18(&qword_6BCA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_32088()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 128, 7);
}

uint64_t sub_32128(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_6188();
  sub_15450();
  v3();
  return a1;
}

uint64_t sub_3217C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_321E8()
{
  return swift_beginAccess();
}

uint64_t sub_32208()
{
  sub_2C00((void *)(v0 + 56), *(void *)(v0 + 80));
  return swift_retain();
}

uint64_t sub_32254()
{
  return v0;
}

uint64_t sub_3226C()
{
  return v0;
}

uint64_t sub_322B4()
{
  return *(void *)(v0 - 200);
}

uint64_t sub_322DC()
{
  return v0;
}

uint64_t sub_322F0()
{
  uint64_t v0 = swift_allocObject();
  sub_32328();
  return v0;
}

void *sub_32328()
{
  *((void *)&__src[1] + 1) = &type metadata for FlowConfigModel;
  *(void *)&__src[2] = &protocol witness table for FlowConfigModel;
  *(void *)&__src[0] = swift_allocObject();
  sub_53BA0();
  sub_5F28(__src, (uint64_t)(v0 + 2));
  sub_388C8((uint64_t *)__src);
  v0[10] = &type metadata for EmergencyCATProvider;
  v0[11] = &off_66E10;
  uint64_t v1 = swift_allocObject();
  v0[7] = v1;
  memcpy((void *)(v1 + 16), __src, 0x70uLL);
  v0[15] = &type metadata for EmergencyFeatureFlags;
  v0[16] = &off_66C18;
  return v0;
}

uint64_t sub_32444@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v171 = a1;
  uint64_t v174 = a2;
  uint64_t v172 = sub_535F0();
  sub_9120();
  uint64_t v160 = v3;
  __chkstk_darwin(v4);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v5);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v6);
  sub_152E8();
  sub_FE14(v7);
  uint64_t v170 = type metadata accessor for EmergencyNLIntent();
  sub_6188();
  __chkstk_darwin(v8);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v9);
  sub_152E8();
  sub_FE14(v10);
  uint64_t v178 = sub_53920();
  sub_9120();
  uint64_t v177 = v11;
  __chkstk_darwin(v12);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v13);
  sub_152E8();
  sub_FE14(v14);
  uint64_t v156 = sub_53CD0();
  sub_6188();
  __chkstk_darwin(v15);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v16);
  sub_152E8();
  sub_FE14(v17);
  uint64_t v153 = sub_53670();
  sub_9120();
  uint64_t v152 = v18;
  __chkstk_darwin(v19);
  sub_6150();
  sub_FE14(v20);
  uint64_t v162 = sub_53620();
  sub_9120();
  uint64_t v161 = v21;
  __chkstk_darwin(v22);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v23);
  sub_152E8();
  sub_FE14(v24);
  uint64_t v175 = (void (*)(void, void))sub_53600();
  sub_9120();
  uint64_t v26 = v25;
  __chkstk_darwin(v27);
  uint64_t v29 = (char *)&v151 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = (int *)type metadata accessor for FlowRouter();
  sub_6188();
  __chkstk_darwin(v31);
  sub_6150();
  sub_FE14(v32);
  uint64_t v33 = sub_53DB0();
  sub_9120();
  uint64_t v35 = v34;
  __chkstk_darwin(v36);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v37);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v38);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v39);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v40);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v41);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v42);
  uint64_t v44 = (char *)&v151 - v43;
  uint64_t v45 = sub_53D90();
  swift_beginAccess();
  uint64_t v46 = *(void (**)(void, void, void))(v35 + 16);
  os_log_t v183 = v45;
  uint64_t v182 = v35 + 16;
  uint64_t v181 = v46;
  v46(v44, v45, v33);
  uint64_t v47 = sub_53DA0();
  os_log_type_t v48 = sub_53E90();
  if (sub_33C04(v48))
  {
    uint64_t v49 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v49 = 0;
    _os_log_impl(&dword_0, v47, v2, "Emergency Plugin activated", v49, 2u);
    sub_60F0();
  }

  uint64_t v50 = *(void (**)(void))(v35 + 8);
  uint64_t v179 = v35 + 8;
  ((void (*)(char *, uint64_t))v50)(v44, v33);
  uint64_t v51 = v184;
  v184[3] = 0u;
  v51[4] = 0u;
  v51[1] = 0u;
  v51[2] = 0u;
  *uint64_t v51 = 0u;
  uint64_t v158 = (uint64_t)v51 + v30[6];
  uint64_t v52 = v172;
  sub_34DC(v158, 1, 1, v172);
  uint64_t v53 = v176;
  uint64_t v54 = (uint64_t)v176 + 16;
  sub_3048((uint64_t)v176 + 16, (uint64_t)v51 + v30[7]);
  unsigned __int16 v55 = (void *)((char *)v53 + 56);
  sub_3048((uint64_t)v53 + 56, (uint64_t)v51 + v30[8]);
  sub_5920((uint64_t)v53 + 96, (uint64_t)v51 + v30[9]);
  int v56 = v175;
  (*(void (**)(char *, uint64_t, void (*)(void, void)))(v26 + 16))(v29, v171, v175);
  int v57 = (*(uint64_t (**)(char *, void))(v26 + 88))(v29, v56);
  if (v57 == enum case for Parse.NLv3IntentOnly(_:))
  {
    uint64_t v58 = sub_33BB0();
    v59(v58);
    uint64_t v60 = v177;
    sub_1B888();
    v61();
    sub_33B70();
    uint64_t v62 = v165;
    sub_33B50();
    v63();
    uint64_t v64 = v166;
    uint64_t v172 = *(void *)(v60 + 16);
    sub_33BF8();
    v65();
    uint64_t v66 = (void *)sub_53DA0();
    os_log_type_t v67 = sub_53E90();
    if (sub_33C04(v67))
    {
      uint64_t v68 = sub_1001C();
      uint64_t v176 = v50;
      os_log_type_t v69 = (_DWORD *)v68;
      __dst[0] = sub_15284();
      *os_log_type_t v69 = 136315138;
      uint64_t v175 = (void (*)(void, void))(v69 + 1);
      sub_339C8(&qword_6C510, 255, (void (*)(uint64_t))&type metadata accessor for NLIntent);
      uint64_t v70 = sub_53FD0();
      uint64_t v72 = sub_50F10(v70, v71, __dst);
      sub_33BC8(v72);
      sub_53EF0();
      swift_bridgeObjectRelease();
      uint64_t v175 = *(void (**)(void, void))(v177 + 8);
      sub_6120();
      v73();
      sub_33C3C(&dword_0, v74, v75, "Parse had NL intent: %s");
      swift_arrayDestroy();
      sub_60F0();
      uint64_t v50 = v176;
      sub_60F0();
    }
    else
    {
      uint64_t v175 = *(void (**)(void, void))(v60 + 8);
      v175(v64, v56);
    }

    ((void (*)(uint64_t, uint64_t))v50)(v62, v33);
    uint64_t v91 = v169;
    uint64_t v92 = v173;
    sub_33BF8();
    v93();
    sub_33B70();
    uint64_t v94 = v167;
    sub_33B50();
    v95();
    sub_F9E4(v92, v91, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    uint64_t v96 = (void *)sub_53DA0();
    os_log_type_t v97 = sub_53E90();
    if (sub_33C04(v97))
    {
      uint64_t v98 = v50;
      uint64_t v99 = (_DWORD *)sub_1001C();
      __dst[0] = sub_15284();
      uint64_t v171 = v33;
      *uint64_t v99 = 136315138;
      uint64_t v100 = sub_3F488();
      uint64_t v102 = sub_50F10(v100, v101, __dst);
      sub_33BDC(v102);
      sub_53EF0();
      swift_bridgeObjectRelease();
      sub_33914(v91, (void (*)(void))type metadata accessor for EmergencyNLIntent);
      sub_33C3C(&dword_0, v103, v104, "Converting NL Intent → %s");
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();

      sub_6120();
      v98();
    }
    else
    {
      sub_33914(v91, (void (*)(void))type metadata accessor for EmergencyNLIntent);

      ((void (*)(uint64_t, uint64_t))v50)(v94, v33);
    }
    __dst[3] = v170;
    __dst[4] = sub_339C8(&qword_6C3E8, 255, (void (*)(uint64_t))type metadata accessor for EmergencyNLIntent);
    uint64_t v125 = sub_5DC4(__dst);
    uint64_t v126 = v173;
    sub_F9E4(v173, (uint64_t)v125, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    sub_3396C((uint64_t)__dst, (uint64_t)v184, &qword_6D880);
    sub_44B6C();
    sub_33C20();
    swift_release();
    sub_33914(v126, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    sub_6120();
    v127();
  }
  else if (v57 == enum case for Parse.directInvocation(_:))
  {
    uint64_t v176 = v50;
    uint64_t v76 = sub_33BB0();
    v77(v76);
    uint64_t v78 = v160;
    (*(void (**)(uint64_t, char *, uint64_t))(v160 + 32))(v168, v29, v52);
    swift_beginAccess();
    sub_33B50();
    v79();
    os_log_type_t v80 = *(void (**)(void))(v78 + 16);
    uint64_t v81 = v159;
    sub_33BF8();
    v80();
    uint64_t v82 = v52;
    uint64_t v83 = sub_53DA0();
    os_log_type_t v84 = sub_53E90();
    if (os_log_type_enabled(v83, v84))
    {
      os_log_t v183 = v83;
      uint64_t v85 = sub_1001C();
      uint64_t v171 = v33;
      uint64_t v86 = (uint8_t *)v85;
      uint64_t v182 = sub_15284();
      uint64_t v185 = v182;
      *(_DWORD *)uint64_t v86 = 136315138;
      sub_33BF8();
      v80();
      uint64_t v87 = sub_53E10();
      uint64_t v89 = sub_50F10(v87, v88, &v185);
      sub_33BC8(v89);
      sub_53EF0();
      swift_bridgeObjectRelease();
      uint64_t v90 = *(void (**)(void))(v78 + 8);
      ((void (*)(uint64_t, uint64_t))v90)(v81, v82);
      uint64_t v83 = v183;
      _os_log_impl(&dword_0, v183, v84, "Parse had directInvocation: %s", v86, 0xCu);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();
    }
    else
    {
      uint64_t v90 = *(void (**)(void))(v78 + 8);
      sub_6120();
      v90();
    }

    sub_33B94();
    v128();
    uint64_t v129 = v158;
    sub_338B4(v158);
    uint64_t v130 = v168;
    sub_33BF8();
    v80();
    sub_34DC(v129, 0, 1, v82);
    sub_44B6C();
    sub_33C20();
    swift_release();
    ((void (*)(uint64_t, uint64_t))v90)(v130, v82);
  }
  else if (v57 == enum case for Parse.uso(_:))
  {
    uint64_t v176 = v50;
    uint64_t v180 = (uint64_t)v184 + 40;
    uint64_t v105 = sub_33BB0();
    v106(v105);
    uint64_t v107 = v161;
    uint64_t v108 = v164;
    sub_1B888();
    v109();
    sub_33B70();
    sub_33B50();
    v110();
    (*(void (**)(uint64_t, uint64_t, void (*)(void, void)))(v107 + 16))(v157, v108, v56);
    uint64_t v111 = sub_53DA0();
    os_log_type_t v112 = sub_53E90();
    if (os_log_type_enabled(v111, v112))
    {
      os_log_type_t v113 = (_DWORD *)sub_1001C();
      uint64_t v114 = sub_15284();
      uint64_t v171 = v33;
      __dst[0] = v114;
      *os_log_type_t v113 = 136315138;
      uint64_t v178 = (uint64_t)(v113 + 1);
      uint64_t v115 = v154;
      sub_53610();
      sub_339C8(&qword_6D890, 255, (void (*)(uint64_t))&type metadata accessor for Siri_Nlu_External_UserParse);
      uint64_t v116 = v153;
      uint64_t v117 = sub_53D50();
      unint64_t v119 = v118;
      (*(void (**)(uint64_t, uint64_t))(v152 + 8))(v115, v116);
      uint64_t v120 = sub_50F10(v117, v119, __dst);
      sub_33BC8(v120);
      int v56 = (void (*)(void, void))v162;
      sub_53EF0();
      swift_bridgeObjectRelease();
      uint64_t v121 = *(void (**)(void))(v107 + 8);
      sub_6120();
      v121();
      sub_33C5C(&dword_0, v122, v123, "Parse had a uso parse: %s");
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();
    }
    else
    {
      uint64_t v121 = *(void (**)(void))(v107 + 8);
      sub_6120();
      v121();
    }

    sub_33B94();
    v124();
    sub_53610();
    __dst[3] = (uint64_t)&type metadata for EmergencyFeatureFlagsKey;
    __dst[4] = sub_F998();
    LOBYTE(__dst[0]) = 2;
    sub_53640();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)__dst);
    uint64_t v136 = v163;
    sub_53CC0();
    sub_33B70();
    sub_33B50();
    v137();
    uint64_t v138 = v155;
    sub_F9E4(v136, v155, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
    uint64_t v139 = sub_53DA0();
    os_log_type_t v140 = sub_53E90();
    if (os_log_type_enabled(v139, v140))
    {
      uint64_t v141 = (_DWORD *)sub_1001C();
      __dst[0] = sub_15284();
      *uint64_t v141 = 136315138;
      uint64_t v142 = sub_53CB0();
      uint64_t v144 = sub_50F10(v142, v143, __dst);
      sub_33BDC(v144);
      int v56 = (void (*)(void, void))v162;
      sub_53EF0();
      swift_bridgeObjectRelease();
      sub_33914(v138, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
      sub_33C5C(&dword_0, v145, v146, "Converting EmergencyDialogAct: %s");
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();
    }
    else
    {
      sub_33914(v138, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
    }

    sub_33B94();
    v147();
    __dst[3] = v156;
    __dst[4] = (uint64_t)&protocol witness table for EmergencyDialogAct;
    uint64_t v148 = sub_5DC4(__dst);
    uint64_t v149 = v163;
    sub_F9E4(v163, (uint64_t)v148, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
    sub_3396C((uint64_t)__dst, v180, &qword_6D888);
    sub_44B6C();
    sub_33C20();
    swift_release();
    sub_33914(v149, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
    ((void (*)(uint64_t, void))v121)(v164, v56);
  }
  else
  {
    sub_33B70();
    sub_33B50();
    v131();
    uint64_t v132 = sub_53DA0();
    os_log_type_t v133 = sub_53EA0();
    if (os_log_type_enabled(v132, v133))
    {
      uint64_t v134 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v134 = 0;
      _os_log_impl(&dword_0, v132, v133, "Emergency Plugin received unexpected parse", v134, 2u);
      int v56 = v175;
      sub_60F0();
    }

    sub_6120();
    v50();
    sub_3048(v54, (uint64_t)&v185);
    uint64_t v135 = sub_2C00(v55, *((void *)v176 + 10));
    memcpy(__dst, v135, sizeof(__dst));
    sub_2C44((uint64_t)&v185, __dst);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)&v185);
    sub_53240();
    swift_release();
    (*(void (**)(char *, void))(v26 + 8))(v29, v56);
  }
  return sub_33914((uint64_t)v184, (void (*)(void))type metadata accessor for FlowRouter);
}

uint64_t sub_33784()
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 16);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 56);
  sub_6068(v0 + 96);
  return v0;
}

uint64_t sub_337B4()
{
  sub_33784();

  return _swift_deallocClassInstance(v0, 136, 7);
}

uint64_t type metadata accessor for EmergencyFlowPlugin()
{
  return self;
}

uint64_t sub_3380C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_32444(a1, a2);
}

uint64_t sub_33830@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_322F0();
  *a1 = result;
  return result;
}

uint64_t sub_3386C(uint64_t a1, uint64_t a2)
{
  return sub_339C8(&qword_6D870, a2, (void (*)(uint64_t))type metadata accessor for EmergencyFlowPlugin);
}

uint64_t sub_338B4(uint64_t a1)
{
  uint64_t v2 = sub_2E18(&qword_6D878);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_33914(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_6188();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_3396C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_2E18(a3);
  sub_6188();
  (*(void (**)(uint64_t, uint64_t))(v5 + 40))(a2, a1);
  return a2;
}

uint64_t sub_339C8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_33A10()
{
  if (v0[5]) {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v0 + 2));
  }
  if (v0[10]) {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v0 + 7));
  }
  if (v0[15]) {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v0 + 12));
  }
  if (v0[20]) {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v0 + 17));
  }
  if (v0[25]) {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v0 + 22));
  }
  if (v0[30]) {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v0 + 27));
  }
  if (v0[35]) {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v0 + 32));
  }

  return _swift_deallocObject(v0, 296, 7);
}

uint64_t sub_33AB0()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 128, 7);
}

uint64_t sub_33B70()
{
  return swift_beginAccess();
}

uint64_t sub_33BB0()
{
  return v0;
}

uint64_t sub_33BC8(uint64_t a1)
{
  *(void *)(v1 - 248) = a1;
  return v1 - 248;
}

uint64_t sub_33BDC(uint64_t a1)
{
  *(void *)(v1 - 296) = a1;
  return v1 - 296;
}

BOOL sub_33C04(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_33C20()
{
  return sub_53240();
}

void sub_33C3C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void sub_33C5C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

ValueMetadata *type metadata accessor for EmergencyFeatureFlags()
{
  return &type metadata for EmergencyFeatureFlags;
}

unsigned char *storeEnumTagSinglePayload for EmergencyFeatureFlagsKey(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x33D58);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyFeatureFlagsKey()
{
  return &type metadata for EmergencyFeatureFlagsKey;
}

unint64_t sub_33D94()
{
  unint64_t result = qword_6D898;
  if (!qword_6D898)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6D898);
  }
  return result;
}

const char *sub_33DE0()
{
  return "SiriEmergency";
}

const char *sub_33DF4(char a1)
{
  if (!a1) {
    return "emergency_rf";
  }
  if (a1 == 1) {
    return "emergency_mandrake_handoff";
  }
  return "nlv4_migration";
}

const char *sub_33E38()
{
  return sub_33DF4(*v0);
}

void *sub_33E58(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_2E18(&qword_6BCA8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = *a2;
      swift_errorRetain();
      *a1 = v7;
    }
    else
    {
      uint64_t v9 = sub_53530();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v10 = a3[5];
    uint64_t v11 = (void *)((char *)a1 + v10);
    uint64_t v12 = (void *)((char *)a2 + v10);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = *v12;
      swift_errorRetain();
      *uint64_t v11 = v13;
    }
    else
    {
      uint64_t v14 = sub_53530();
      (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v14 - 8) + 16))(v11, v12, v14);
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = a3[7];
    *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
    unint64_t v16 = *(void *)((char *)a2 + v15);
    swift_retain();
    if (v16 >= 6) {
      swift_bridgeObjectRetain();
    }
    *(void *)((char *)a1 + v15) = v16;
    uint64_t v17 = a3[9];
    *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    *((unsigned char *)a1 + v17) = *((unsigned char *)a2 + v17);
  }
  return a1;
}

unint64_t sub_3403C(uint64_t a1, uint64_t a2)
{
  sub_2E18(&qword_6BCA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_errorRelease();
  }
  else
  {
    uint64_t v4 = sub_53530();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_errorRelease();
  }
  else
  {
    uint64_t v6 = sub_53530();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  swift_release();
  unint64_t result = *(void *)(a1 + *(int *)(a2 + 28));
  if (result >= 6)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_3416C(void *a1, void *a2, int *a3)
{
  sub_2E18(&qword_6BCA8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = *a2;
    swift_errorRetain();
    *a1 = v6;
  }
  else
  {
    uint64_t v7 = sub_53530();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v8 = a3[5];
  uint64_t v9 = (void *)((char *)a1 + v8);
  uint64_t v10 = (void *)((char *)a2 + v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = *v10;
    swift_errorRetain();
    *uint64_t v9 = v11;
  }
  else
  {
    uint64_t v12 = sub_53530();
    (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  unint64_t v14 = *(void *)((char *)a2 + v13);
  swift_retain();
  if (v14 >= 6) {
    swift_bridgeObjectRetain();
  }
  *(void *)((char *)a1 + v13) = v14;
  uint64_t v15 = a3[9];
  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  *((unsigned char *)a1 + v15) = *((unsigned char *)a2 + v15);
  return a1;
}

void *sub_34300(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_74D8((uint64_t)a1, &qword_6BCA8);
    sub_2E18(&qword_6BCA8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = *a2;
      swift_errorRetain();
      *a1 = v6;
    }
    else
    {
      uint64_t v7 = sub_53530();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v8 = a3[5];
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    sub_74D8((uint64_t)a1 + v8, &qword_6BCA8);
    sub_2E18(&qword_6BCA8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = *v10;
      swift_errorRetain();
      *uint64_t v9 = v11;
    }
    else
    {
      uint64_t v12 = sub_53530();
      (*(void (**)(void *, uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16))(v9, v10, v12);
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  swift_retain();
  swift_release();
  uint64_t v13 = a3[7];
  unint64_t v14 = (void *)((char *)a1 + v13);
  unint64_t v15 = *(void *)((char *)a2 + v13);
  if (*(void *)((char *)a1 + v13) >= 6uLL)
  {
    if (v15 >= 6)
    {
      *unint64_t v14 = v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_74D8((uint64_t)a1 + v13, &qword_6D8A0);
      *unint64_t v14 = *(void *)((char *)a2 + v13);
    }
  }
  else
  {
    *unint64_t v14 = v15;
    if (v15 >= 6) {
      swift_bridgeObjectRetain();
    }
  }
  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  return a1;
}

char *sub_3452C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_2E18(&qword_6BCA8);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_53530();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v9, v10, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    uint64_t v11 = sub_53530();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v12 = a3[7];
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  *(void *)&a1[v12] = *(void *)&a2[v12];
  uint64_t v13 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  a1[v13] = a2[v13];
  return a1;
}

char *sub_346B0(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_74D8((uint64_t)a1, &qword_6BCA8);
    uint64_t v6 = sub_2E18(&qword_6BCA8);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    else
    {
      uint64_t v7 = sub_53530();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_74D8((uint64_t)&a1[v8], &qword_6BCA8);
    uint64_t v11 = sub_2E18(&qword_6BCA8);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      uint64_t v12 = sub_53530();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
  }
  *(void *)&a1[a3[6]] = *(void *)&a2[a3[6]];
  swift_release();
  uint64_t v13 = a3[7];
  unint64_t v14 = (unint64_t *)&a1[v13];
  unint64_t v15 = *(void *)&a2[v13];
  if (*(void *)&a1[v13] >= 6uLL)
  {
    if (v15 >= 6)
    {
      *unint64_t v14 = v15;
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
    sub_74D8((uint64_t)&a1[v13], &qword_6D8A0);
    unint64_t v15 = *(void *)&a2[v13];
  }
  *unint64_t v14 = v15;
LABEL_13:
  uint64_t v16 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  a1[v16] = a2[v16];
  return a1;
}

uint64_t sub_348AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_348C0);
}

uint64_t sub_348C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2E18(&qword_6BCA8);
  sub_34B64();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    return sub_5800(a1, a2, v6);
  }
  else
  {
    unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v9 >= 0xFFFFFFFF) {
      LODWORD(v9) = -1;
    }
    return (v9 + 1);
  }
}

uint64_t sub_34950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_34964);
}

void sub_34964(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_2E18(&qword_6BCA8);
  sub_34B64();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    sub_34DC(a1, a2, a2, v8);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
}

uint64_t type metadata accessor for ConfirmationFlowConfigModel()
{
  uint64_t result = qword_6D900;
  if (!qword_6D900) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_34A38()
{
  sub_34AF0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_34AF0()
{
  if (!qword_6D910)
  {
    sub_53530();
    sub_58D8(&qword_6BCA0);
    unint64_t v0 = sub_54070();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_6D910);
    }
  }
}

void sub_34B7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_15308();
  a19 = v21;
  a20 = v22;
  uint64_t v176 = v20;
  uint64_t v24 = v23;
  uint64_t v178 = sub_535F0();
  sub_9120();
  uint64_t v177 = v25;
  __chkstk_darwin(v26);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v27);
  sub_FF3C();
  uint64_t v187 = v28;
  sub_15258();
  uint64_t v30 = __chkstk_darwin(v29);
  sub_387BC(v30, v31, v32, v33, v34, v35, v36, v37, v168[0]);
  uint64_t v38 = type metadata accessor for EmergencyNLIntent();
  uint64_t v39 = sub_FEC4(v38);
  __chkstk_darwin(v39);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v40);
  sub_152E8();
  sub_FE14(v41);
  uint64_t v185 = sub_53920();
  sub_9120();
  uint64_t v184 = v42;
  __chkstk_darwin(v43);
  sub_6150();
  sub_FE14(v44);
  uint64_t v45 = sub_53670();
  uint64_t v46 = sub_FEC4(v45);
  __chkstk_darwin(v46);
  sub_6150();
  sub_FE14(v47);
  uint64_t v48 = sub_53CD0();
  uint64_t v49 = sub_FEC4(v48);
  __chkstk_darwin(v49);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v50);
  sub_152E8();
  sub_FE14(v51);
  uint64_t v171 = sub_53620();
  sub_9120();
  uint64_t v174 = v52;
  __chkstk_darwin(v53);
  sub_6150();
  sub_FE14(v54);
  sub_53600();
  sub_9120();
  uint64_t v189 = v56;
  long long v190 = v55;
  __chkstk_darwin(v55);
  sub_6150();
  unint64_t v191 = v57;
  sub_535B0();
  sub_9120();
  __chkstk_darwin(v58);
  sub_1B7AC();
  uint64_t v59 = sub_53DB0();
  sub_9120();
  uint64_t v61 = v60;
  __chkstk_darwin(v62);
  sub_612C();
  sub_FDEC();
  uint64_t v64 = __chkstk_darwin(v63);
  uint64_t v66 = (char *)v168 - v65;
  __chkstk_darwin(v64);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v67);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v68);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v69);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v70);
  uint64_t v71 = sub_53D90();
  sub_6108();
  uint64_t v72 = *(void (**)(uint64_t))(v61 + 16);
  uint64_t v186 = v71;
  uint64_t v192 = v72;
  uint64_t v193 = v61 + 16;
  sub_FE98();
  v73();
  uint64_t v182 = v24;
  sub_FE98();
  v74();
  uint64_t v75 = sub_53DA0();
  os_log_type_t v76 = sub_53E90();
  BOOL v77 = os_log_type_enabled(v75, v76);
  uint64_t v181 = v61;
  if (v77)
  {
    uint64_t v169 = v66;
    uint64_t v78 = sub_1001C();
    uint64_t v175 = v59;
    uint64_t v79 = (uint8_t *)v78;
    v194[0] = sub_15284();
    *(_DWORD *)uint64_t v79 = 136315138;
    v168[1] = (uint64_t)(v79 + 4);
    sub_38424(&qword_6C3D8, 255, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v80 = sub_53FD0();
    uint64_t v195 = sub_50F10(v80, v81, v194);
    uint64_t v66 = v169;
    sub_53EF0();
    swift_bridgeObjectRelease();
    uint64_t v82 = sub_387F0();
    v83(v82);
    _os_log_impl(&dword_0, v75, v76, "EmergencyNumberFlow onInput: %s", v79, 0xCu);
    swift_arrayDestroy();
    sub_60F0();
    uint64_t v59 = v175;
    sub_60F0();

    uint64_t v84 = v181;
    uint64_t v85 = v181;
  }
  else
  {
    uint64_t v86 = sub_387F0();
    v87(v86);

    uint64_t v85 = v61;
    uint64_t v84 = v61;
  }
  unint64_t v88 = *(void (**)(void))(v85 + 8);
  sub_6120();
  v88();
  uint64_t v89 = v191;
  sub_535A0();
  int v90 = (*(uint64_t (**)(void (*)(void), uint8_t *))(v189 + 88))(v89, v190);
  uint64_t v92 = v187;
  uint64_t v91 = v188;
  if (v90 == enum case for Parse.NLv3IntentOnly(_:))
  {
    uint64_t v93 = sub_1D5D8();
    v94(v93);
    (*(void (**)(uint64_t, void (*)(void), uint64_t))(v184 + 32))(v183, v89, v185);
    sub_6108();
    uint64_t v95 = sub_385C8((uint64_t)&a11);
    uint64_t v96 = v192;
    v192(v95);
    os_log_type_t v97 = (void *)sub_53DA0();
    os_log_type_t v98 = sub_53E90();
    if (sub_FF7C(v98))
    {
      uint64_t v99 = (_WORD *)sub_61F0();
      sub_61CC(v99);
      sub_FED0(&dword_0, v100, v101, "EmergencyNumberFlow onInput .NLv3IntentOnly");
      sub_60F0();
    }

    sub_3887C();
    unint64_t v191 = v88;
    sub_6120();
    v88();
    uint64_t v102 = v184;
    uint64_t v103 = v179;
    uint64_t v104 = v183;
    uint64_t v105 = v185;
    sub_FE98();
    v106();
    sub_F9E4(v103, v180, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    sub_42CA0();
    unsigned int v108 = v107;
    sub_38354(v103, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    (*(void (**)(uint64_t, uint64_t))(v102 + 8))(v104, v105);
    goto LABEL_18;
  }
  if (v90 == enum case for Parse.directInvocation(_:))
  {
    uint64_t v109 = sub_1D5D8();
    v110(v109);
    (*(void (**)(uint64_t, void (*)(void), uint64_t))(v177 + 32))(v91, v89, v178);
    sub_6108();
    sub_385C8((uint64_t)&v196);
    sub_FE98();
    v111();
    os_log_type_t v112 = (void *)sub_53DA0();
    os_log_type_t v113 = sub_53E90();
    if (sub_FF7C(v113))
    {
      uint64_t v114 = (_WORD *)sub_61F0();
      sub_61CC(v114);
      sub_FED0(&dword_0, v115, v116, "EmergencyNumberFlow onInput .directInvocation");
      sub_60F0();
    }

    uint64_t v117 = (void (*)(void))(v84 + 8);
    uint64_t v118 = sub_3887C();
    ((void (*)(uint64_t))v88)(v118);
    int v119 = v91;
    if (sub_535D0() == 0xD000000000000035 && v120 == 0x8000000000057B10)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      int v119 = sub_53FE0();
      swift_bridgeObjectRelease();
      if ((v119 & 1) == 0) {
        goto LABEL_25;
      }
    }
    char v143 = sub_2C188();
    if (v143 != 35)
    {
      LOBYTE(v134) = v143;
      (*(void (**)(uint64_t, uint64_t))(v177 + 8))(v91, v178);
      __int16 v133 = 0;
      LOWORD(v135) = 4;
LABEL_30:
      __int16 v165 = v133 | ((_WORD)v135 << 8);
      uint64_t v166 = v176;
      *(unsigned char *)(v176 + 18) = v134;
      *(_WORD *)(v166 + 16) = v165;
      goto LABEL_34;
    }
LABEL_25:
    unint64_t v191 = v117;
    sub_6108();
    sub_388B4((uint64_t)&v199);
    sub_FE98();
    v144();
    uint64_t v145 = v177;
    uint64_t v146 = *(void (**)(uint64_t, uint64_t, uint64_t))(v177 + 16);
    uint64_t v147 = v92;
    uint64_t v148 = v92;
    uint64_t v149 = v178;
    v146(v147, v91, v178);
    char v150 = sub_53DA0();
    os_log_type_t v151 = sub_53EA0();
    if (sub_FF7C(v151))
    {
      uint64_t v152 = sub_1001C();
      LODWORD(v193) = v119;
      uint64_t v153 = (uint8_t *)v152;
      uint64_t v154 = sub_15284();
      uint64_t v175 = v59;
      uint64_t v192 = (void (*)(uint64_t))v154;
      uint64_t v197 = v154;
      *(_DWORD *)uint64_t v153 = 136315138;
      long long v190 = v153 + 4;
      v146(v168[2], v148, v149);
      uint64_t v155 = sub_53E10();
      v194[5] = sub_50F10(v155, v156, &v197);
      sub_53EF0();
      swift_bridgeObjectRelease();
      uint64_t v157 = *(void (**)(void))(v145 + 8);
      sub_385B8();
      v157();
      _os_log_impl(&dword_0, v150, (os_log_type_t)v193, "Failed to get emergencySituation from DirectInvocation: %s", v153, 0xCu);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();

      sub_6120();
      v88();
      sub_385B8();
      v157();
    }
    else
    {

      uint64_t v167 = *(void (**)(uint64_t, uint64_t))(v145 + 8);
      v167(v148, v149);
      sub_6120();
      v88();
      v167(v91, v149);
    }
    goto LABEL_34;
  }
  if (v90 != enum case for Parse.uso(_:))
  {
    sub_6108();
    sub_FE98();
    v158();
    uint64_t v159 = sub_53DA0();
    os_log_type_t v160 = sub_53EA0();
    if (os_log_type_enabled(v159, v160))
    {
      uint64_t v161 = (uint8_t *)sub_1001C();
      uint64_t v162 = sub_15284();
      uint64_t v175 = v59;
      uint64_t v195 = v162;
      uint64_t v169 = v66;
      *(_DWORD *)uint64_t v161 = 136315138;
      LOBYTE(v197) = 0;
      uint64_t v163 = sub_53E10();
      uint64_t v197 = sub_50F10(v163, v164, &v195);
      sub_53EF0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v159, v160, "%s", v161, 0xCu);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();
    }
    else
    {

      sub_3887C();
    }
    sub_6120();
    v88();
    (*(void (**)(void (*)(void), uint8_t *))(v189 + 8))(v191, v190);
    goto LABEL_34;
  }
  uint64_t v121 = sub_1D5D8();
  v122(v121);
  uint64_t v123 = v171;
  (*(void (**)(uint64_t, void (*)(void), uint64_t))(v174 + 32))(v173, v89, v171);
  sub_6108();
  uint64_t v124 = sub_388B4((uint64_t)&v195);
  uint64_t v96 = v192;
  v192(v124);
  uint64_t v125 = (void *)sub_53DA0();
  os_log_type_t v126 = sub_53E90();
  if (sub_FF7C(v126))
  {
    unint64_t v127 = (_WORD *)sub_61F0();
    sub_61CC(v127);
    sub_FED0(&dword_0, v128, v129, "EmergencyNumberFlow onInput .uso");
    sub_60F0();
  }

  unint64_t v191 = v88;
  sub_6120();
  v88();
  uint64_t v130 = v173;
  sub_53610();
  v194[3] = (uint64_t)&type metadata for EmergencyFeatureFlagsKey;
  v194[4] = sub_F998();
  LOBYTE(v194[0]) = 2;
  sub_53640();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v194);
  uint64_t v131 = v170;
  sub_53CC0();
  sub_F9E4(v131, v172, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
  sub_4298C();
  unsigned int v108 = v132;
  sub_38354(v131, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
  (*(void (**)(uint64_t, uint64_t))(v174 + 8))(v130, v123);
LABEL_18:
  __int16 v133 = v108 & 1;
  unsigned int v134 = HIWORD(v108);
  unsigned int v135 = v108 >> 8;
  if (BYTE1(v108) != 4 || BYTE2(v108) != 35) {
    goto LABEL_30;
  }
  sub_6108();
  uint64_t v136 = sub_385C8((uint64_t)&v198);
  v96(v136);
  uint64_t v137 = (void *)sub_53DA0();
  os_log_type_t v138 = sub_53E90();
  if (sub_FF7C(v138))
  {
    uint64_t v139 = (_WORD *)sub_61F0();
    sub_61CC(v139);
    sub_FED0(&dword_0, v140, v141, "#EmergencyNumberFlow Produced an empty intent. Ignoring input.");
    sub_60F0();
  }

  sub_3887C();
  sub_6120();
  v142();
LABEL_34:
  sub_9638();
}

uint64_t sub_3599C()
{
  sub_10010();
  v1[53] = v2;
  v1[54] = v0;
  uint64_t v3 = sub_53DB0();
  v1[55] = v3;
  v1[56] = *(void *)(v3 - 8);
  v1[57] = swift_task_alloc();
  v1[58] = swift_task_alloc();
  v1[59] = swift_task_alloc();
  return _swift_task_switch(sub_35A74, 0, 0);
}

uint64_t sub_35A74()
{
  uint64_t v41 = v0;
  uint64_t v1 = *(void *)(v0 + 472);
  uint64_t v3 = *(void *)(v0 + 440);
  uint64_t v2 = *(void *)(v0 + 448);
  uint64_t v4 = sub_53D90();
  *(void *)(v0 + 480) = v4;
  sub_6108();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  *(void *)(v0 + 488) = v5;
  *(void *)(v0 + 496) = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  uint64_t v38 = v5;
  uint64_t v39 = v4;
  v5(v1, v4, v3);
  swift_retain_n();
  uint64_t v6 = sub_53DA0();
  os_log_type_t v7 = sub_53E90();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v37 = *(void *)(v0 + 448);
    uint64_t v8 = *(void *)(v0 + 432);
    uint64_t v9 = (uint8_t *)sub_1001C();
    uint64_t v40 = sub_15284();
    *(_DWORD *)uint64_t v9 = 136315138;
    char v10 = *(unsigned char *)(v8 + 18);
    *(_WORD *)(v0 + 524) = *(_WORD *)(v8 + 16);
    *(unsigned char *)(v0 + 526) = v10;
    uint64_t v11 = sub_53E10();
    *(void *)(v0 + 408) = sub_50F10(v11, v12, &v40);
    sub_53EF0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v6, v7, "EmergencyNumberFlow execute with state: %s", v9, 0xCu);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();

    uint64_t v13 = *(void (**)(void))(v37 + 8);
    sub_6120();
    v13();
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 472);
    uint64_t v15 = *(void *)(v0 + 440);
    uint64_t v16 = *(void *)(v0 + 448);

    swift_release_n();
    uint64_t v13 = *(void (**)(void))(v16 + 8);
    ((void (*)(uint64_t, uint64_t))v13)(v14, v15);
  }
  *(void *)(v0 + 504) = v13;
  uint64_t v17 = *(void *)(v0 + 432);
  int v18 = *(unsigned __int8 *)(v17 + 18);
  int v19 = *(unsigned __int16 *)(v17 + 16);
  int v20 = v19 | (v18 << 16);
  *(unsigned char *)(v0 + 522) = v18;
  *(_WORD *)(v0 + 520) = v19;
  if (v19 == 2)
  {
    uint64_t v21 = *(void *)(v0 + 424);
    sub_F824();
    uint64_t v22 = swift_allocError();
    *uint64_t v23 = 2;
    sub_2940(v22, v17 + 64, (void *)(v17 + 104), v21);
    swift_errorRelease();
    goto LABEL_8;
  }
  if (v19 == 3)
  {
    sub_53460();
LABEL_8:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
    return v24();
  }
  uint64_t v26 = v0 + 16;
  uint64_t v27 = *(void *)(v0 + 464);
  uint64_t v28 = *(void *)(v0 + 440);
  sub_6108();
  v38(v27, v39, v28);
  uint64_t v29 = sub_53DA0();
  os_log_type_t v30 = sub_53E90();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)sub_1001C();
    uint64_t v32 = sub_15284();
    *(_DWORD *)uint64_t v31 = 136315138;
    uint64_t v40 = v32;
    *(unsigned char *)(v0 + 527) = v20 & 1;
    *(unsigned char *)(v0 + 528) = BYTE1(v20);
    *(unsigned char *)(v0 + 529) = BYTE2(v20);
    uint64_t v33 = sub_53E10();
    *(void *)(v0 + 416) = sub_50F10(v33, v34, &v40);
    sub_53EF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v29, v30, "EmergencyNumberFlow needsExecution intent: %s", v31, 0xCu);
    swift_arrayDestroy();
    sub_60F0();
    uint64_t v26 = v0 + 16;
    sub_60F0();
  }

  sub_6120();
  v13();
  uint64_t v35 = *(void *)(v0 + 432) + 24;
  uint64_t v36 = (void *)swift_task_alloc();
  *(void *)(v0 + 512) = v36;
  void *v36 = v0;
  v36[1] = sub_35F78;
  return sub_167DC(v26, v35, SBYTE2(v20), SBYTE1(v20));
}

uint64_t sub_35F78()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  return _swift_task_switch(sub_36044, 0, 0);
}

uint64_t sub_36044()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 522);
  if (v1 == 35)
  {
    if (HIBYTE(*(_WORD *)(v0 + 520)) == 4)
    {
      sub_F724((uint64_t *)(v0 + 16));
      goto LABEL_8;
    }
    uint64_t v1 = (*(unsigned __int16 *)(v0 + 520) | (*(unsigned __int8 *)(v0 + 522) << 16)) >> 8;
  }
  sub_9370();
  if (*(void *)(v0 + 320))
  {
    uint64_t v2 = *(void *)(v0 + 432);
    sub_5F28((long long *)(v0 + 296), v0 + 256);
    sub_2C00((void *)(v2 + 184), *(void *)(v2 + 208));
    sub_26450(v1, v0 + 16, (void *)(v0 + 256));
    sub_F724((uint64_t *)(v0 + 16));
    sub_53450();
    swift_release();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 256);
    goto LABEL_11;
  }
  sub_F724((uint64_t *)(v0 + 16));
  sub_5884(v0 + 296, &qword_6CB20);
LABEL_8:
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 488);
  uint64_t v4 = *(void *)(v0 + 480);
  uint64_t v5 = *(void *)(v0 + 456);
  uint64_t v6 = *(void *)(v0 + 440);
  sub_6108();
  v3(v5, v4, v6);
  os_log_type_t v7 = (void *)sub_53DA0();
  os_log_type_t v8 = sub_53EA0();
  if (sub_1B708(v8))
  {
    uint64_t v9 = (_WORD *)sub_61F0();
    sub_25330(v9);
    sub_25160(&dword_0, v10, v11, "EmergencyNumberFlow Failed to pick a catWrapper");
    sub_60F0();
  }
  unint64_t v12 = *(void (**)(void))(v0 + 504);
  uint64_t v13 = *(void *)(v0 + 432);

  sub_6120();
  v12();
  uint64_t v14 = sub_2C00((void *)(v13 + 104), *(void *)(v13 + 128));
  memcpy((void *)(v0 + 144), v14, 0x70uLL);
  sub_2C44(v13 + 64, (const void *)(v0 + 144));
  sub_53450();
  swift_release();
LABEL_11:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t sub_36278()
{
  type metadata accessor for EmergencyNumberFlow();
  sub_38424(&qword_6DA60, v0, (void (*)(uint64_t))type metadata accessor for EmergencyNumberFlow);
  return sub_531E0();
}

uint64_t sub_36304()
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 24);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 64);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 104);
  sub_6068(v0 + 144);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 184);
  return v0;
}

uint64_t sub_36344()
{
  sub_36304();

  return _swift_deallocClassInstance(v0, 224, 7);
}

uint64_t type metadata accessor for EmergencyNumberFlow()
{
  return self;
}

uint64_t getEnumTagSinglePayload for EmergencyNumberFlow.EmergencyNumberFlowState(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD)
  {
    int v2 = (a2 + 16776963) >> 24 == 255 ? 2 : 1;
    int v3 = (a2 + 16776963) >> 24 ? v2 : 0;
    if (v3)
    {
      if (v3 == 2)
      {
        int v4 = *(unsigned __int16 *)((char *)a1 + 3);
        if (*(unsigned __int16 *)((char *)a1 + 3)) {
          return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v4 << 24)) - 16776963;
        }
      }
      else
      {
        int v4 = *((unsigned __int8 *)a1 + 3);
        if (*((unsigned char *)a1 + 3)) {
          return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v4 << 24)) - 16776963;
        }
      }
    }
  }
  unsigned int v6 = *(unsigned __int8 *)a1;
  if (v6 >= 2) {
    unsigned int v7 = v6 - 1;
  }
  else {
    unsigned int v7 = 0;
  }
  if (v7 >= 3) {
    return v7 - 2;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for EmergencyNumberFlow.EmergencyNumberFlowState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if ((a3 + 16776963) >> 24 == 255) {
    int v3 = 2;
  }
  else {
    int v3 = 1;
  }
  if ((a3 + 16776963) >> 24) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }
  if (a3 < 0xFD) {
    int v4 = 0;
  }
  if (a2 > 0xFC)
  {
    *(_WORD *)uint64_t result = a2 - 253;
    *(unsigned char *)(result + 2) = (a2 - 253) >> 16;
    if (v4)
    {
      unsigned int v5 = ((a2 - 253) >> 24) + 1;
      if (v4 == 2) {
        *(_WORD *)(result + 3) = v5;
      }
      else {
        *(unsigned char *)(result + 3) = v5;
      }
    }
  }
  else
  {
    if (!v4) {
      goto LABEL_13;
    }
    if (v4 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_13:
      if (!a2) {
        return result;
      }
LABEL_19:
      *(unsigned char *)uint64_t result = a2 + 3;
      return result;
    }
    *(unsigned char *)(result + 3) = 0;
    if (a2) {
      goto LABEL_19;
    }
  }
  return result;
}

uint64_t sub_364B8(unsigned __int8 *a1)
{
  unsigned int v1 = *a1;
  if (v1 >= 2) {
    return v1 - 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_364CC(uint64_t result, unsigned int a2)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)uint64_t result = a2 - 255;
    *(unsigned char *)(result + 2) = (a2 - 255) >> 16;
  }
  else if (a2)
  {
    *(unsigned char *)uint64_t result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyNumberFlow.EmergencyNumberFlowState()
{
  return &type metadata for EmergencyNumberFlow.EmergencyNumberFlowState;
}

#error "3651C: call analysis failed (funcsize=10)"

uint64_t sub_36530()
{
  return sub_36278();
}

uint64_t sub_36554()
{
  unsigned int v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unsigned int v1 = v0;
  v1[1] = sub_DD40;
  return sub_3599C();
}

uint64_t sub_365F0()
{
  type metadata accessor for EmergencyNumberFlow();

  return sub_53230();
}

uint64_t sub_36628(uint64_t a1, void *a2)
{
  sub_53DB0();
  sub_9120();
  __chkstk_darwin(v4);
  sub_25278();
  __chkstk_darwin(v5);
  sub_385DC();
  __chkstk_darwin(v6);
  if (sub_387D4())
  {
    uint64_t v7 = a2[4];
    sub_2C00(a2, a2[3]);
    char v8 = sub_53310();
    sub_3048((uint64_t)a2, (uint64_t)v25);
    if (v8)
    {
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v25);
LABEL_9:
      sub_53D90();
      sub_6108();
      sub_FE98();
      v19();
      uint64_t v10 = sub_53DA0();
      os_log_type_t v20 = sub_53E90();
      if (!sub_38728(v20))
      {
        uint64_t v7 = 0;
        goto LABEL_15;
      }
      uint64_t v21 = (uint8_t *)sub_61F0();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_0, v10, v2, "No prompt needed for this device. Not prompting for call followup.", v21, 2u);
      uint64_t v7 = 0;
      goto LABEL_11;
    }
    char v14 = sub_43838(v25);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v25);
    if ((v14 & 1) == 0) {
      goto LABEL_9;
    }
    sub_53D90();
    sub_6108();
    sub_FE98();
    v15();
    uint64_t v10 = sub_53DA0();
    os_log_type_t v16 = sub_53E90();
    if (!sub_1B708(v16))
    {
      sub_38600();
      goto LABEL_15;
    }
    *(_WORD *)sub_61F0() = 0;
    sub_3883C(&dword_0, v17, v18, "Prompting for call followup.");
    sub_38600();
  }
  else
  {
    sub_53D90();
    sub_6108();
    sub_FE98();
    v9();
    uint64_t v10 = sub_53DA0();
    os_log_type_t v11 = sub_53E90();
    if (!sub_1B708(v11))
    {
      uint64_t v7 = 0;
      goto LABEL_15;
    }
    *(_WORD *)sub_61F0() = 0;
    sub_3883C(&dword_0, v12, v13, "orgInfo does not have name and number. Not prompting for call followup.");
    uint64_t v7 = 0;
  }
LABEL_11:
  sub_60F0();
LABEL_15:

  uint64_t v22 = sub_384D0();
  v23(v22);
  return v7;
}

uint64_t sub_368C0(uint64_t a1, uint64_t a2)
{
  sub_53DB0();
  sub_9120();
  __chkstk_darwin(v4);
  sub_3860C();
  __chkstk_darwin(v5);
  sub_385DC();
  __chkstk_darwin(v6);
  if (sub_387D4() & 1) == 0 && (sub_53C70())
  {
    char v7 = sub_386EC();
    sub_3048(a2, (uint64_t)v31);
    if (v7)
    {
      sub_38500();
LABEL_9:
      sub_38530();
LABEL_10:
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v30);
LABEL_11:
      sub_53D90();
      sub_6108();
      sub_FE98();
      v15();
      uint64_t v9 = (void *)sub_53DA0();
      os_log_type_t v16 = sub_53E90();
      if (!sub_38728(v16))
      {
        uint64_t v2 = 0;
        goto LABEL_14;
      }
      uint64_t v17 = (_WORD *)sub_61F0();
      sub_25330(v17);
      sub_3885C(&dword_0, v18, v19, "No prompt needed for this device. Not prompting for website followup.");
      uint64_t v2 = 0;
      goto LABEL_13;
    }
    char v14 = sub_386B0();
    sub_38500();
    if (v14) {
      goto LABEL_9;
    }
    char v23 = sub_38674();
    sub_38530();
    if (v23) {
      goto LABEL_10;
    }
    char v24 = sub_38638();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v30);
    if (v24) {
      goto LABEL_11;
    }
    sub_53D90();
    sub_6108();
    sub_FE98();
    v25();
    uint64_t v9 = (void *)sub_53DA0();
    os_log_type_t v26 = sub_53E90();
    if (!sub_1B708(v26))
    {
      sub_38600();
      goto LABEL_14;
    }
    uint64_t v27 = (_WORD *)sub_61F0();
    sub_25330(v27);
    sub_25160(&dword_0, v28, v29, "Prompting for website followup.");
    sub_38600();
LABEL_13:
    sub_60F0();
    goto LABEL_14;
  }
  sub_53D90();
  sub_6108();
  sub_FE98();
  v8();
  uint64_t v9 = (void *)sub_53DA0();
  os_log_type_t v10 = sub_53E90();
  if (sub_1B708(v10))
  {
    os_log_type_t v11 = (_WORD *)sub_61F0();
    sub_25330(v11);
    sub_25160(&dword_0, v12, v13, "orgInfo does not have name and website. Not prompting for website followup.");
    sub_38888();
    goto LABEL_13;
  }
  sub_38888();
LABEL_14:

  uint64_t v20 = sub_384D0();
  v21(v20);
  return v2;
}

uint64_t sub_36B3C(uint64_t a1, uint64_t a2)
{
  sub_53DB0();
  sub_9120();
  __chkstk_darwin(v5);
  sub_3860C();
  __chkstk_darwin(v6);
  sub_385DC();
  __chkstk_darwin(v7);
  if ((sub_387D4() & 1) == 0)
  {
    uint64_t v8 = *(void *)(a1 + 104);
    if ((v8 & 0x2000000000000000) != 0)
    {
      if ((v8 & 0xF00000000000000) != 0) {
        goto LABEL_4;
      }
    }
    else if ((*(void *)(a1 + 96) & 0xFFFFFFFFFFFFLL) != 0)
    {
LABEL_4:
      char v9 = sub_386EC();
      sub_3048(a2, (uint64_t)v33);
      if (v9)
      {
        sub_38500();
LABEL_11:
        sub_38530();
LABEL_12:
        _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v32);
LABEL_13:
        sub_53D90();
        sub_6108();
        sub_FE98();
        v17();
        os_log_type_t v11 = (void *)sub_53DA0();
        os_log_type_t v18 = sub_53E90();
        if (!sub_38728(v18))
        {
          uint64_t v2 = 0;
          goto LABEL_17;
        }
        uint64_t v19 = (_WORD *)sub_61F0();
        sub_25330(v19);
        sub_3885C(&dword_0, v20, v21, "No prompt needed for this device. Not prompting for websearch followup.");
        uint64_t v2 = 0;
        goto LABEL_15;
      }
      char v16 = sub_386B0();
      sub_38500();
      if (v16) {
        goto LABEL_11;
      }
      char v25 = sub_38674();
      sub_38530();
      if (v25) {
        goto LABEL_12;
      }
      char v26 = sub_38638();
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v32);
      if (v26) {
        goto LABEL_13;
      }
      sub_53D90();
      sub_6108();
      sub_FE98();
      v27();
      os_log_type_t v11 = (void *)sub_53DA0();
      os_log_type_t v28 = sub_53E90();
      if (!sub_1B708(v28))
      {
        sub_38600();
        goto LABEL_17;
      }
      uint64_t v29 = (_WORD *)sub_61F0();
      sub_25330(v29);
      sub_25160(&dword_0, v30, v31, "Prompting for websearch followup.");
      sub_38600();
LABEL_15:
      sub_60F0();
      goto LABEL_17;
    }
  }
  sub_53D90();
  sub_6108();
  sub_FE98();
  v10();
  os_log_type_t v11 = (void *)sub_53DA0();
  os_log_type_t v12 = sub_53E90();
  if (sub_1B708(v12))
  {
    uint64_t v13 = (_WORD *)sub_61F0();
    sub_25330(v13);
    sub_25160(&dword_0, v14, v15, "orgInfo does not have a websearch query. Not prompting for websearch followup.");
    sub_38888();
    goto LABEL_15;
  }
  sub_38888();
LABEL_17:

  uint64_t v22 = sub_384D0();
  v23(v22);
  return v2;
}

void sub_36DCC()
{
  sub_15308();
  uint64_t v60 = v3;
  uint64_t v63 = v4;
  sub_53DB0();
  sub_9120();
  uint64_t v64 = v6;
  uint64_t v65 = v5;
  __chkstk_darwin(v5);
  sub_612C();
  uint64_t v61 = v7;
  sub_15258();
  __chkstk_darwin(v8);
  sub_FF3C();
  v59[1] = v9;
  sub_15258();
  __chkstk_darwin(v10);
  sub_FF3C();
  long long v59[2] = v11;
  sub_15258();
  __chkstk_darwin(v12);
  sub_152E8();
  uint64_t v62 = v13;
  uint64_t v14 = sub_539B0();
  sub_9120();
  uint64_t v16 = v15;
  __chkstk_darwin(v17);
  uint64_t v18 = sub_2E18(&qword_6DA68);
  sub_6188();
  __chkstk_darwin(v19);
  sub_1B7C4();
  uint64_t v20 = sub_2E18(&qword_6DA70);
  uint64_t v21 = sub_FEC4(v20);
  __chkstk_darwin(v21);
  sub_25278();
  sub_38628();
  uint64_t v23 = __chkstk_darwin(v22);
  char v25 = (char *)v59 - v24;
  __chkstk_darwin(v23);
  sub_38894();
  if (sub_53940())
  {
    sub_53930();
    swift_release();
    sub_53BE0();
    swift_release();
    uint64_t v26 = 0;
  }
  else
  {
    uint64_t v26 = 1;
  }
  sub_34DC(v0, v26, 1, v14);
  sub_539A0();
  sub_38820((uint64_t)v25);
  uint64_t v27 = v2 + *(int *)(v18 + 48);
  sub_383BC(v0, v2);
  sub_383BC((uint64_t)v25, v27);
  sub_38484(v2);
  if (v28)
  {
    sub_5884((uint64_t)v25, &qword_6DA70);
    sub_5884(v0, &qword_6DA70);
    sub_38484(v27);
    if (v28)
    {
      sub_5884(v2, &qword_6DA70);
      goto LABEL_19;
    }
    goto LABEL_12;
  }
  sub_383BC(v2, v1);
  sub_38484(v27);
  if (v28)
  {
    sub_5884((uint64_t)v25, &qword_6DA70);
    sub_5884(v0, &qword_6DA70);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v1, v14);
LABEL_12:
    sub_5884(v2, &qword_6DA68);
    goto LABEL_13;
  }
  sub_38560();
  v39();
  sub_38424(&qword_6DA78, 255, (void (*)(uint64_t))&type metadata accessor for ResponseMode);
  char v40 = sub_53DE0();
  uint64_t v41 = *(void (**)(void))(v16 + 8);
  sub_385B8();
  v41();
  sub_5884((uint64_t)v25, &qword_6DA70);
  sub_5884(v0, &qword_6DA70);
  sub_385B8();
  v41();
  sub_5884(v2, &qword_6DA70);
  if (v40)
  {
LABEL_19:
    sub_53D90();
    sub_6108();
    sub_385F0();
    uint64_t v42 = sub_3846C();
    v43(v42);
    uint64_t v33 = (void *)sub_53DA0();
    os_log_type_t v44 = sub_53E90();
    if (sub_1B708(v44))
    {
      uint64_t v45 = (_WORD *)sub_61F0();
      sub_384C4(v45);
      uint64_t v38 = "DisplayOnly request. Not listening after speaking.";
      goto LABEL_24;
    }
    goto LABEL_26;
  }
LABEL_13:
  if (sub_53C60())
  {
    uint64_t v29 = v60;
    sub_2C00(v60, v60[3]);
    char v30 = sub_53310();
    sub_3048((uint64_t)v29, (uint64_t)v66);
    if (v30)
    {
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v66);
    }
    else
    {
      char v46 = sub_38574(v66);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v66);
      if ((v46 & 1) == 0)
      {
        sub_53D90();
        sub_6108();
        sub_385F0();
        uint64_t v53 = sub_3846C();
        v54(v53);
        uint64_t v33 = (void *)sub_53DA0();
        os_log_type_t v55 = sub_53E90();
        if (!sub_1B708(v55)) {
          goto LABEL_26;
        }
        uint64_t v56 = (_WORD *)sub_61F0();
        sub_384C4(v56);
        sub_384A4(&dword_0, v57, v58, "Will listen after speaking the call followup.");
        goto LABEL_25;
      }
    }
    sub_53D90();
    sub_6108();
    sub_385F0();
    uint64_t v47 = sub_3846C();
    v48(v47);
    uint64_t v33 = (void *)sub_53DA0();
    os_log_type_t v49 = sub_53E90();
    if (sub_1B708(v49))
    {
      uint64_t v50 = (_WORD *)sub_61F0();
      sub_384C4(v50);
      uint64_t v38 = "No prompt needed for this device. Not listening after speaking.";
      goto LABEL_24;
    }
  }
  else
  {
    sub_53D90();
    sub_6108();
    sub_385F0();
    uint64_t v31 = sub_3846C();
    v32(v31);
    uint64_t v33 = (void *)sub_53DA0();
    os_log_type_t v34 = sub_53E90();
    if (sub_1B708(v34))
    {
      uint64_t v35 = (_WORD *)sub_61F0();
      sub_384C4(v35);
      uint64_t v38 = "orgInfo does not have name and number. Not listening after speaking.";
LABEL_24:
      sub_384A4(&dword_0, v36, v37, v38);
LABEL_25:
      sub_60F0();
    }
  }
LABEL_26:

  uint64_t v51 = sub_384E8();
  v52(v51);
  sub_9638();
}

void sub_37364()
{
  sub_15308();
  uint64_t v64 = v3;
  sub_53DB0();
  sub_9120();
  __chkstk_darwin(v4);
  sub_612C();
  sub_15258();
  __chkstk_darwin(v5);
  sub_FDEC();
  __chkstk_darwin(v6);
  sub_FF3C();
  sub_FDEC();
  uint64_t v8 = __chkstk_darwin(v7);
  sub_387BC(v8, v9, v10, v11, v12, v13, v14, v15, v63);
  uint64_t v16 = sub_539B0();
  sub_9120();
  uint64_t v18 = v17;
  __chkstk_darwin(v19);
  sub_38808();
  uint64_t v20 = sub_2E18(&qword_6DA68);
  sub_6188();
  __chkstk_darwin(v21);
  sub_1B7C4();
  uint64_t v22 = sub_2E18(&qword_6DA70);
  uint64_t v23 = sub_FEC4(v22);
  __chkstk_darwin(v23);
  sub_25278();
  uint64_t v26 = v24 - v25;
  __chkstk_darwin(v27);
  sub_38628();
  __chkstk_darwin(v28);
  sub_38894();
  if (sub_53940())
  {
    sub_53930();
    swift_release();
    sub_53BE0();
    swift_release();
    uint64_t v29 = 0;
  }
  else
  {
    uint64_t v29 = 1;
  }
  sub_34DC(v0, v29, 1, v16);
  sub_539A0();
  sub_38820(v1);
  uint64_t v30 = v2 + *(int *)(v20 + 48);
  sub_383BC(v0, v2);
  sub_383BC(v1, v30);
  sub_38484(v2);
  if (v31)
  {
    sub_5884(v1, &qword_6DA70);
    sub_5884(v0, &qword_6DA70);
    sub_38484(v30);
    if (v31)
    {
      sub_5884(v2, &qword_6DA70);
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  sub_383BC(v2, v26);
  sub_38484(v30);
  if (v31)
  {
    sub_5884(v1, &qword_6DA70);
    sub_5884(v0, &qword_6DA70);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v26, v16);
LABEL_12:
    sub_5884(v2, &qword_6DA68);
    goto LABEL_16;
  }
  sub_38560();
  v32();
  sub_38424(&qword_6DA78, 255, (void (*)(uint64_t))&type metadata accessor for ResponseMode);
  char v33 = sub_53DE0();
  os_log_type_t v34 = *(void (**)(void))(v18 + 8);
  sub_385A8();
  v34();
  sub_5884(v1, &qword_6DA70);
  sub_5884(v0, &qword_6DA70);
  sub_385A8();
  v34();
  sub_5884(v2, &qword_6DA70);
  if (v33)
  {
LABEL_14:
    sub_53D90();
    sub_6108();
    uint64_t v35 = sub_3846C();
    v36(v35);
    uint64_t v37 = (void *)sub_53DA0();
    os_log_type_t v38 = sub_53E90();
    if (sub_1B708(v38))
    {
      uint64_t v39 = (_WORD *)sub_61F0();
      sub_384C4(v39);
      uint64_t v42 = "DisplayOnly request. Not listening after speaking.";
LABEL_26:
      sub_384A4(&dword_0, v40, v41, v42);
LABEL_27:
      sub_60F0();
      goto LABEL_28;
    }
    goto LABEL_28;
  }
LABEL_16:
  if (sub_53C70())
  {
    sub_2C00(v64, v64[3]);
    char v43 = sub_533A0();
    sub_3048((uint64_t)v64, (uint64_t)v67);
    if (v43)
    {
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v67);
      sub_3048((uint64_t)v64, (uint64_t)v66);
    }
    else
    {
      char v48 = sub_38780();
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v67);
      sub_3048((uint64_t)v64, (uint64_t)v66);
      if ((v48 & 1) == 0)
      {
        char v55 = sub_38744();
        _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v66);
        sub_3048((uint64_t)v64, (uint64_t)v65);
        if ((v55 & 1) == 0)
        {
          char v56 = sub_38574(v65);
          _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v65);
          if ((v56 & 1) == 0)
          {
            sub_53D90();
            sub_6108();
            uint64_t v57 = sub_3846C();
            v58(v57);
            uint64_t v37 = (void *)sub_53DA0();
            os_log_type_t v59 = sub_53E90();
            if (!sub_1B708(v59)) {
              goto LABEL_28;
            }
            uint64_t v60 = (_WORD *)sub_61F0();
            sub_384C4(v60);
            sub_384A4(&dword_0, v61, v62, "Will listen after speaking the website followup.");
            goto LABEL_27;
          }
LABEL_24:
          sub_53D90();
          sub_6108();
          uint64_t v49 = sub_3846C();
          v50(v49);
          uint64_t v37 = (void *)sub_53DA0();
          os_log_type_t v51 = sub_53E90();
          if (sub_1B708(v51))
          {
            uint64_t v52 = (_WORD *)sub_61F0();
            sub_384C4(v52);
            uint64_t v42 = "No prompt needed for this device. Not listening after speaking.";
            goto LABEL_26;
          }
          goto LABEL_28;
        }
LABEL_23:
        _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v65);
        goto LABEL_24;
      }
    }
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v66);
    sub_3048((uint64_t)v64, (uint64_t)v65);
    goto LABEL_23;
  }
  sub_53D90();
  sub_6108();
  uint64_t v44 = sub_3846C();
  v45(v44);
  uint64_t v37 = (void *)sub_53DA0();
  os_log_type_t v46 = sub_53E90();
  if (sub_1B708(v46))
  {
    uint64_t v47 = (_WORD *)sub_61F0();
    sub_384C4(v47);
    uint64_t v42 = "orgInfo does not have name and website. Not listening after speaking.";
    goto LABEL_26;
  }
LABEL_28:

  uint64_t v53 = sub_384E8();
  v54(v53);
  sub_9638();
}

void sub_37984()
{
  sub_15308();
  uint64_t v66 = v2;
  uint64_t v68 = v3;
  uint64_t v4 = sub_53DB0();
  sub_9120();
  uint64_t v69 = v5;
  __chkstk_darwin(v6);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v7);
  sub_FDEC();
  __chkstk_darwin(v8);
  sub_FF3C();
  uint64_t v67 = v9;
  sub_15258();
  __chkstk_darwin(v10);
  sub_152E8();
  v65[2] = v11;
  uint64_t v12 = sub_539B0();
  sub_9120();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_38808();
  uint64_t v16 = sub_2E18(&qword_6DA68);
  sub_6188();
  __chkstk_darwin(v17);
  sub_1B7C4();
  uint64_t v18 = sub_2E18(&qword_6DA70);
  uint64_t v19 = sub_FEC4(v18);
  __chkstk_darwin(v19);
  sub_25278();
  uint64_t v22 = v20 - v21;
  __chkstk_darwin(v23);
  sub_38628();
  __chkstk_darwin(v24);
  uint64_t v26 = (char *)v65 - v25;
  sub_53950();
  uint64_t v27 = sub_53940();
  uint64_t v70 = v4;
  if (v27)
  {
    sub_53930();
    swift_release();
    sub_53BE0();
    swift_release();
    uint64_t v28 = 0;
  }
  else
  {
    uint64_t v28 = 1;
  }
  sub_34DC((uint64_t)v26, v28, 1, v12);
  sub_539A0();
  sub_38820(v0);
  uint64_t v29 = v1 + *(int *)(v16 + 48);
  sub_383BC((uint64_t)v26, v1);
  sub_383BC(v0, v29);
  sub_38484(v1);
  if (v30)
  {
    sub_5884(v0, &qword_6DA70);
    sub_5884((uint64_t)v26, &qword_6DA70);
    sub_38484(v29);
    if (v30)
    {
      sub_5884(v1, &qword_6DA70);
      goto LABEL_20;
    }
    goto LABEL_12;
  }
  sub_383BC(v1, v22);
  sub_38484(v29);
  if (v30)
  {
    sub_5884(v0, &qword_6DA70);
    sub_5884((uint64_t)v26, &qword_6DA70);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v22, v12);
LABEL_12:
    sub_5884(v1, &qword_6DA68);
    goto LABEL_13;
  }
  sub_38560();
  v35();
  sub_38424(&qword_6DA78, 255, (void (*)(uint64_t))&type metadata accessor for ResponseMode);
  char v36 = sub_53DE0();
  uint64_t v37 = *(void (**)(void))(v14 + 8);
  sub_385A8();
  v37();
  sub_5884(v0, &qword_6DA70);
  sub_5884((uint64_t)v26, &qword_6DA70);
  sub_385A8();
  v37();
  sub_5884(v1, &qword_6DA70);
  if (v36)
  {
LABEL_20:
    sub_53D90();
    sub_6108();
    uint64_t v38 = sub_3846C();
    v39(v38);
    uint64_t v40 = (void *)sub_53DA0();
    os_log_type_t v41 = sub_53E90();
    if (sub_1B708(v41))
    {
      uint64_t v42 = (_WORD *)sub_61F0();
      sub_384C4(v42);
      uint64_t v45 = "DisplayOnly request. Not listening after speaking.";
LABEL_29:
      sub_384A4(&dword_0, v43, v44, v45);
LABEL_30:
      sub_60F0();
      goto LABEL_31;
    }
    goto LABEL_31;
  }
LABEL_13:
  unint64_t v31 = *(void *)(v68 + 104);
  if ((v31 & 0x2000000000000000) != 0) {
    uint64_t v32 = HIBYTE(v31) & 0xF;
  }
  else {
    uint64_t v32 = *(void *)(v68 + 96) & 0xFFFFFFFFFFFFLL;
  }
  char v33 = v66;
  if (v32)
  {
    sub_2C00(v66, v66[3]);
    char v34 = sub_533A0();
    sub_3048((uint64_t)v33, (uint64_t)v73);
    if (v34)
    {
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v73);
      sub_3048((uint64_t)v33, (uint64_t)v72);
    }
    else
    {
      char v50 = sub_38780();
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v73);
      sub_3048((uint64_t)v33, (uint64_t)v72);
      if ((v50 & 1) == 0)
      {
        char v57 = sub_38744();
        _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v72);
        sub_3048((uint64_t)v33, (uint64_t)v71);
        if ((v57 & 1) == 0)
        {
          char v58 = sub_38574(v71);
          _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v71);
          if ((v58 & 1) == 0)
          {
            sub_53D90();
            sub_6108();
            uint64_t v59 = sub_3846C();
            v60(v59);
            uint64_t v40 = (void *)sub_53DA0();
            os_log_type_t v61 = sub_53E90();
            if (!sub_1B708(v61)) {
              goto LABEL_31;
            }
            uint64_t v62 = (_WORD *)sub_61F0();
            sub_384C4(v62);
            sub_384A4(&dword_0, v63, v64, "Will listen after speaking the websearch followup.");
            goto LABEL_30;
          }
LABEL_27:
          sub_53D90();
          sub_6108();
          uint64_t v51 = sub_3846C();
          v52(v51);
          uint64_t v40 = (void *)sub_53DA0();
          os_log_type_t v53 = sub_53E90();
          if (sub_1B708(v53))
          {
            uint64_t v54 = (_WORD *)sub_61F0();
            sub_384C4(v54);
            uint64_t v45 = "No prompt needed for this device. Not listening after speaking.";
            goto LABEL_29;
          }
          goto LABEL_31;
        }
LABEL_26:
        _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v71);
        goto LABEL_27;
      }
    }
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v72);
    sub_3048((uint64_t)v33, (uint64_t)v71);
    goto LABEL_26;
  }
  sub_53D90();
  sub_6108();
  uint64_t v46 = sub_3846C();
  v47(v46);
  uint64_t v40 = (void *)sub_53DA0();
  os_log_type_t v48 = sub_53E90();
  if (sub_1B708(v48))
  {
    uint64_t v49 = (_WORD *)sub_61F0();
    sub_384C4(v49);
    uint64_t v45 = "orgInfo does not have a websearch query. Not listening after speaking.";
    goto LABEL_29;
  }
LABEL_31:

  uint64_t v55 = sub_384E8();
  v56(v55);
  sub_9638();
}

void sub_37FC4()
{
  sub_15308();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = sub_2E18(&qword_6BCB8);
  uint64_t v12 = sub_FEC4(v11);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_53AD0();
  sub_9120();
  uint64_t v17 = v16;
  __chkstk_darwin(v18);
  sub_1B7AC();
  sub_F214(v8, (uint64_t)v30);
  if (sub_F27C((uint64_t)v30) == 1)
  {
    uint64_t v19 = v6[3];
    uint64_t v20 = v6[4];
    sub_2C00(v6, v19);
    sub_34DC((uint64_t)v14, 1, 1, v15);
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 24))(v14, v19, v20);
    sub_5884((uint64_t)v14, &qword_6BCB8);
  }
  else
  {
    v29[2] = v10;
    memcpy(v31, v30, sizeof(v31));
    swift_bridgeObjectRetain();
    sub_53AC0();
    sub_53A10();
    swift_allocObject();
    sub_53A00();
    sub_539F0();
    swift_release();
    uint64_t v21 = sub_539E0();
    swift_release();
    if (sub_53C60())
    {
      sub_2C00(v4, v4[3]);
      sub_FE98();
      v22();
      sub_34DC((uint64_t)v14, 0, 1, v15);
      swift_retain();
      swift_retain();
      char v23 = sub_43838(v2);
      sub_25878((uint64_t)v14, v21, v23 & 1);
      swift_release();
      swift_release_n();
    }
    else
    {
      char v24 = sub_53C70();
      uint64_t v25 = v6[3];
      uint64_t v26 = v6[4];
      uint64_t v27 = sub_2C00(v6, v25);
      if (v24)
      {
        sub_FE98();
        v28();
        sub_34DC((uint64_t)v14, 0, 1, v15);
        (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))(v14, v25, v26);
      }
      else
      {
        v29[1] = v27;
        swift_bridgeObjectRetain();
        sub_53AC0();
        sub_34DC((uint64_t)v14, 0, 1, v15);
        (*(void (**)(char *, uint64_t, uint64_t))(v26 + 24))(v14, v25, v26);
      }
      swift_release();
    }
    sub_5884((uint64_t)v14, &qword_6BCB8);
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v0, v15);
  }
  sub_9638();
}

uint64_t sub_38354(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_6188();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

ValueMetadata *type metadata accessor for EmergencyNumberFlowFollowupConfigModel()
{
  return &type metadata for EmergencyNumberFlowFollowupConfigModel;
}

uint64_t sub_383BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2E18(&qword_6DA70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_38424(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_3846C()
{
  return v0;
}

uint64_t sub_38484(uint64_t a1)
{
  return sub_5800(a1, 1, v1);
}

void sub_384A4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 2u);
}

_WORD *sub_384C4(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t sub_384D0()
{
  return v0;
}

uint64_t sub_384E8()
{
  return v0;
}

uint64_t sub_38500()
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v1 - 104);
  return sub_3048(v0, v1 - 144);
}

uint64_t sub_38530()
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v1 - 144);
  return sub_3048(v0, v1 - 184);
}

uint64_t sub_38574(void *a1)
{
  sub_2C00(a1, v1);
  return sub_53380();
}

uint64_t sub_385C8@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 - 256);
}

uint64_t sub_38638()
{
  sub_2C00((void *)(v0 - 184), *(void *)(v0 - 160));
  return sub_53380();
}

uint64_t sub_38674()
{
  sub_2C00((void *)(v0 - 144), *(void *)(v0 - 120));
  return sub_53370();
}

uint64_t sub_386B0()
{
  sub_2C00((void *)(v0 - 104), *(void *)(v0 - 80));
  return sub_53390();
}

uint64_t sub_386EC()
{
  sub_2C00(v0, v0[3]);
  return sub_533A0();
}

BOOL sub_38728(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_38744()
{
  sub_2C00((void *)(v0 - 168), *(void *)(v0 - 144));
  return sub_53370();
}

uint64_t sub_38780()
{
  sub_2C00((void *)(v0 - 128), *(void *)(v0 - 104));
  return sub_53390();
}

uint64_t sub_387BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 240) = (char *)&a9 - v9;
  return 0;
}

uint64_t sub_387D4()
{
  return sub_53C60();
}

uint64_t sub_387F0()
{
  return v0;
}

uint64_t sub_38820(uint64_t a1)
{
  return sub_34DC(a1, 0, 1, v1);
}

void sub_3883C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void sub_3885C(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_3887C()
{
  return v0;
}

uint64_t sub_38894()
{
  return sub_53950();
}

uint64_t sub_388B4@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 - 256);
}

uint64_t sub_388C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_53B30();
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CsamCATs();
  sub_38F50();
  uint64_t v21 = sub_38F68();
  type metadata accessor for EmergencyCATs();
  sub_38F50();
  uint64_t v20 = sub_38F68();
  type metadata accessor for DomesticViolenceCATs();
  sub_38F50();
  uint64_t v19 = sub_38F68();
  type metadata accessor for PoisonControlCATs();
  sub_38F50();
  uint64_t v18 = sub_38F68();
  type metadata accessor for SexualAssaultCATs();
  sub_38F50();
  uint64_t v17 = sub_38F68();
  type metadata accessor for SuicidePreventionCATs();
  sub_38F50();
  uint64_t v16 = sub_38F68();
  type metadata accessor for EmergencyDomesticViolenceBasicIntentCATs();
  sub_38F50();
  uint64_t v5 = sub_38F68();
  type metadata accessor for EmergencyPoisonControlBasicIntentCATs();
  sub_38F50();
  uint64_t v6 = sub_38F68();
  type metadata accessor for EmergencySexualAssaultBasicIntentCATs();
  sub_38F50();
  uint64_t v7 = sub_38F68();
  type metadata accessor for EmergencySuicidePreventionBasicIntentCATs();
  sub_38F50();
  uint64_t v8 = sub_38F68();
  type metadata accessor for EmergencyGeneralEmergencyCATs();
  sub_38F50();
  uint64_t v9 = sub_38F68();
  type metadata accessor for SirenCATs();
  sub_38F50();
  uint64_t v10 = sub_38F68();
  sub_53B20();
  type metadata accessor for CommonCATs();
  swift_allocObject();
  uint64_t v11 = sub_36BC((uint64_t)v4, 0);
  type metadata accessor for EmergencyErrorsCATs();
  sub_38F50();
  uint64_t result = sub_38F68();
  uint64_t v13 = v20;
  *a1 = v21;
  a1[1] = v13;
  uint64_t v14 = v18;
  a1[2] = v19;
  a1[3] = v14;
  uint64_t v15 = v16;
  a1[4] = v17;
  a1[5] = v15;
  a1[6] = v5;
  a1[7] = v6;
  a1[8] = v7;
  a1[9] = v8;
  a1[10] = v9;
  a1[11] = v10;
  a1[12] = v11;
  a1[13] = result;
  return result;
}

uint64_t destroy for EmergencyCATProvider()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

void *initializeWithCopy for EmergencyCATProvider(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  uint64_t v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  uint64_t v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for EmergencyCATProvider(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  swift_retain();
  swift_release();
  a1[6] = a2[6];
  swift_retain();
  swift_release();
  a1[7] = a2[7];
  swift_retain();
  swift_release();
  a1[8] = a2[8];
  swift_retain();
  swift_release();
  a1[9] = a2[9];
  swift_retain();
  swift_release();
  a1[10] = a2[10];
  swift_retain();
  swift_release();
  a1[11] = a2[11];
  swift_retain();
  swift_release();
  a1[12] = a2[12];
  swift_retain();
  swift_release();
  a1[13] = a2[13];
  swift_retain();
  swift_release();
  return a1;
}

void *initializeWithTake for EmergencyCATProvider(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

_OWORD *assignWithTake for EmergencyCATProvider(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  swift_release();
  a1[1] = a2[1];
  swift_release();
  swift_release();
  a1[2] = a2[2];
  swift_release();
  swift_release();
  a1[3] = a2[3];
  swift_release();
  swift_release();
  a1[4] = a2[4];
  swift_release();
  swift_release();
  a1[5] = a2[5];
  swift_release();
  swift_release();
  a1[6] = a2[6];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for EmergencyCATProvider(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 112))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EmergencyCATProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyCATProvider()
{
  return &type metadata for EmergencyCATProvider;
}

uint64_t sub_38F50()
{
  return sub_53B20();
}

uint64_t sub_38F68()
{
  return CATWrapper.__allocating_init(options:globals:)(v0, 0);
}

void *sub_38F80(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_53DB0();
  sub_9120();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  sub_6140();
  uint64_t v14 = v13 - v12;
  sub_2C00(a2, a2[3]);
  char v15 = sub_533A0();
  sub_3048((uint64_t)a2, (uint64_t)v30);
  if (v15)
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v30);
  }
  else
  {
    char v16 = sub_43838(v30);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v30);
    if (v16)
    {
      id v17 = sub_2C8D8(a1, a2);
      sub_2E18((uint64_t *)&unk_6D490);
      uint64_t v18 = sub_39700();
      *(_OWORD *)(v18 + 16) = xmmword_547C0;
      uint64_t v19 = sub_39700();
      *(_OWORD *)(v19 + 16) = xmmword_547C0;
      *(void *)(v19 + 32) = v17;
      uint64_t v29 = v19;
      sub_53E80();
      sub_2C00(a2, a2[3]);
      id v20 = v17;
      char v21 = sub_53370();
      id v22 = sub_39568(a3, a4, v29, v21 & 1);
      swift_bridgeObjectRelease();
      *(void *)(v18 + 32) = v22;
      sub_53E80();
      uint64_t v23 = v18;

      return (void *)v23;
    }
  }
  uint64_t v24 = sub_53D90();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v14, v24, v8);
  uint64_t v25 = sub_53DA0();
  os_log_type_t v26 = sub_53E90();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v27 = 0;
    _os_log_impl(&dword_0, v25, v26, "Device is HomePod or calling is not supported. Not making call button.", v27, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v14, v8);
  return &_swiftEmptyArrayStorage;
}

void *sub_391FC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v7 - 8);
  sub_6140();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_53DB0();
  sub_9120();
  uint64_t v13 = v12;
  __chkstk_darwin(v14);
  sub_6140();
  uint64_t v17 = v16 - v15;
  sub_2C00(a2, a2[3]);
  char v18 = sub_533A0();
  sub_3048((uint64_t)a2, (uint64_t)v38);
  if (v18)
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v38);
LABEL_4:
    uint64_t v20 = sub_53D90();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v17, v20, v11);
    char v21 = sub_53DA0();
    os_log_type_t v22 = sub_53E90();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_0, v21, v22, "Device is HomePod or AppleTV. Not making website button.", v23, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v17, v11);
    return &_swiftEmptyArrayStorage;
  }
  sub_2C00(v38, v38[3]);
  char v19 = sub_53380();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v38);
  if (v19) {
    goto LABEL_4;
  }
  id v25 = [objc_allocWithZone((Class)SAUIAppPunchOut) init];
  sub_9A10(a1, v10);
  uint64_t v26 = sub_53030();
  uint64_t v28 = 0;
  if (sub_5800(v10, 1, v26) != 1)
  {
    sub_53010(v27);
    uint64_t v28 = v29;
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8))(v10, v26);
  }
  [v25 setPunchOutUri:v28];

  sub_2E18((uint64_t *)&unk_6D490);
  uint64_t v30 = sub_39700();
  *(_OWORD *)(v30 + 16) = xmmword_547C0;
  uint64_t v31 = sub_39700();
  *(_OWORD *)(v31 + 16) = xmmword_547C0;
  *(void *)(v31 + 32) = v25;
  uint64_t v37 = v31;
  sub_53E80();
  sub_2C00(a2, a2[3]);
  id v32 = v25;
  char v33 = sub_53370();
  id v34 = sub_39568(a3, a4, v37, v33 & 1);
  swift_bridgeObjectRelease();
  *(void *)(v30 + 32) = v34;
  sub_53E80();
  uint64_t v24 = v30;

  return (void *)v24;
}

id sub_39568(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4)
  {
    sub_2D324(0, &qword_6DA98);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_53EC0();
    id v8 = [objc_allocWithZone((Class)SASTItemGroup) init];
    sub_2E18((uint64_t *)&unk_6D490);
    uint64_t v9 = sub_39700();
    *(_OWORD *)(v9 + 16) = xmmword_547C0;
    *(void *)(v9 + 32) = v7;
    uint64_t v11 = v9;
    sub_53E80();
    sub_39688(v11, v8);
    return v8;
  }
  else
  {
    sub_2D324(0, (unint64_t *)&qword_6DA90);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return sub_2C038(a1, a2, a3);
  }
}

void sub_39688(uint64_t a1, void *a2)
{
  sub_2E18((uint64_t *)&unk_6DB00);
  Class isa = sub_53E70().super.isa;
  swift_bridgeObjectRelease();
  [a2 setTemplateItems:isa];
}

uint64_t sub_39700()
{
  return swift_allocObject();
}

uint64_t type metadata accessor for SuicidePreventionModernCATs()
{
  uint64_t result = qword_6DB10;
  if (!qword_6DB10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_39760()
{
  return swift_initClassMetadata2();
}

uint64_t sub_397A0(uint64_t a1, uint64_t a2)
{
  return sub_397F4(a1, a2);
}

uint64_t sub_397F4(uint64_t a1, uint64_t a2)
{
  sub_53B30();
  sub_9AD8();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_6140();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v11 - 8);
  sub_6140();
  sub_9A10(a1, v13 - v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v10, a2, v2);
  uint64_t v14 = sub_53AE0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v2);
  sub_9A78(a1);
  return v14;
}

uint64_t sub_39920(uint64_t a1, uint64_t a2)
{
  sub_53B30();
  sub_9AD8();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_6140();
  uint64_t v9 = v8 - v7;
  swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v9, a2, v2);
  uint64_t v10 = sub_53AF0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v2);
  return v10;
}

uint64_t sub_399FC()
{
  return type metadata accessor for SuicidePreventionModernCATs();
}

uint64_t sub_39A04()
{
  uint64_t v121 = sub_535F0();
  sub_60C0();
  uint64_t v116 = v0;
  __chkstk_darwin(v1);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v2);
  sub_FF3C();
  uint64_t v120 = v3;
  __chkstk_darwin(v4);
  sub_152E8();
  sub_FE14(v5);
  uint64_t v6 = type metadata accessor for EmergencyNLIntent();
  uint64_t v7 = sub_FEC4(v6);
  __chkstk_darwin(v7);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v8);
  sub_152E8();
  sub_FE14(v9);
  uint64_t v119 = sub_53920();
  sub_60C0();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_6150();
  sub_FE14(v13);
  uint64_t v14 = sub_53670();
  uint64_t v15 = sub_FEC4(v14);
  __chkstk_darwin(v15);
  sub_6150();
  sub_FE14(v16);
  uint64_t v17 = sub_53CD0();
  uint64_t v18 = sub_FEC4(v17);
  __chkstk_darwin(v18);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v19);
  sub_152E8();
  sub_FE14(v20);
  uint64_t v109 = sub_53620();
  sub_60C0();
  uint64_t v112 = v21;
  __chkstk_darwin(v22);
  sub_6150();
  sub_FE14(v23);
  sub_53600();
  sub_60C0();
  uint64_t v123 = v25;
  uint64_t v124 = v24;
  __chkstk_darwin(v24);
  sub_6150();
  uint64_t v122 = v26;
  sub_535B0();
  sub_60C0();
  __chkstk_darwin(v27);
  sub_6140();
  sub_53DB0();
  sub_60C0();
  uint64_t v29 = v28;
  __chkstk_darwin(v30);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v31);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v32);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v33);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v34);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v35);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v36);
  sub_53D90();
  sub_6108();
  uint64_t v125 = *(void (**)(void))(v29 + 16);
  sub_FE98();
  v37();
  sub_FE98();
  v38();
  uint64_t v39 = sub_53DA0();
  os_log_type_t v40 = sub_53E90();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v110 = v29;
    os_log_type_t v41 = (uint8_t *)sub_1001C();
    uint64_t v126 = sub_15284();
    *(_DWORD *)os_log_type_t v41 = 136315138;
    sub_3F338(&qword_6C3D8, 255, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v42 = sub_53FD0();
    uint64_t v131 = sub_50F10(v42, v43, &v126);
    sub_53EF0();
    swift_bridgeObjectRelease();
    uint64_t v44 = sub_3F474();
    v45(v44);
    _os_log_impl(&dword_0, v39, v40, "#EmergencyBasicFlow onInput: %s", v41, 0xCu);
    swift_arrayDestroy();
    sub_60F0();
    uint64_t v29 = v110;
    sub_60F0();
  }
  else
  {
    uint64_t v46 = sub_3F474();
    v47(v46);
  }

  os_log_type_t v48 = *(void (**)(void))(v29 + 8);
  sub_6120();
  v48();
  uint64_t v49 = v122;
  sub_535A0();
  int v50 = (*(uint64_t (**)(uint64_t, uint64_t))(v123 + 88))(v122, v124);
  if (v50 == enum case for Parse.NLv3IntentOnly(_:))
  {
    uint64_t v51 = sub_3F3EC();
    v52(v51);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v118, v122, v119);
    sub_3F3D0();
    os_log_type_t v53 = v125;
    sub_FE98();
    v125();
    uint64_t v54 = (void *)sub_53DA0();
    os_log_type_t v55 = sub_53E90();
    if (sub_FF7C(v55))
    {
      char v56 = (_WORD *)sub_61F0();
      sub_61CC(v56);
      sub_FED0(&dword_0, v57, v58, "#EmergencyBasicFlow onInput .NLv3IntentOnly");
      sub_60F0();
    }

    sub_6120();
    v48();
    sub_FE98();
    v59();
    sub_3F290(v115, v114, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    __int16 v60 = sub_3EE04(v114);
    int v61 = v60;
    int v62 = HIBYTE(v60);
    sub_1B580(v115, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v118, v119);
    goto LABEL_18;
  }
  if (v50 != enum case for Parse.directInvocation(_:))
  {
    if (v50 != enum case for Parse.uso(_:))
    {
      sub_3F3D0();
      sub_FE98();
      v97();
      os_log_type_t v98 = sub_53DA0();
      os_log_type_t v99 = sub_53EA0();
      if (os_log_type_enabled(v98, v99))
      {
        uint64_t v100 = (uint8_t *)sub_1001C();
        uint64_t v131 = sub_15284();
        *(_DWORD *)uint64_t v100 = 136315138;
        LOBYTE(v132) = 0;
        uint64_t v101 = sub_53E10();
        uint64_t v132 = sub_50F10(v101, v102, &v131);
        uint64_t v49 = v122;
        sub_53EF0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v98, v99, "%s", v100, 0xCu);
        swift_arrayDestroy();
        sub_60F0();
        sub_60F0();
      }

      sub_6120();
      v48();
      (*(void (**)(uint64_t, uint64_t))(v123 + 8))(v49, v124);
      return 0;
    }
    uint64_t v72 = sub_3F3EC();
    v73(v72);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v112 + 32))(v111, v122, v109);
    sub_3F3D0();
    sub_3F404((uint64_t)v127);
    os_log_type_t v53 = v125;
    sub_FE98();
    v125();
    uint64_t v74 = (void *)sub_53DA0();
    os_log_type_t v75 = sub_53E90();
    if (sub_FF7C(v75))
    {
      os_log_type_t v76 = (_WORD *)sub_61F0();
      sub_61CC(v76);
      sub_FED0(&dword_0, v77, v78, "#EmergencyBasicFlow onInput .uso");
      sub_60F0();
    }

    sub_3F450();
    sub_6120();
    v48();
    sub_53610();
    uint64_t v128 = &type metadata for EmergencyFeatureFlagsKey;
    unint64_t v129 = sub_F998();
    LOBYTE(v126) = 2;
    sub_53640();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)&v126);
    sub_53CC0();
    sub_3F290(v108, v107, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
    __int16 v79 = sub_3EB50(v107);
    int v61 = v79;
    int v62 = HIBYTE(v79);
    sub_1B580(v108, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
    sub_15450();
    v80();
LABEL_18:
    if (v61 == 4 && v62 == 35)
    {
      sub_3F3D0();
      sub_3F404((uint64_t)v133);
      sub_FE98();
      v53();
      unint64_t v81 = (void *)sub_53DA0();
      os_log_type_t v82 = sub_53E90();
      if (sub_FF7C(v82))
      {
        uint64_t v83 = (_WORD *)sub_61F0();
        sub_61CC(v83);
        sub_FED0(&dword_0, v84, v85, "#EmergencyBasicFlow Produced an empty intent. Ignoring input.");
        sub_60F0();
      }

      sub_3F450();
      sub_6120();
      v86();
      return 0;
    }
LABEL_30:
    *(_WORD *)(v113 + 216) = v61 | ((_WORD)v62 << 8);
    return 1;
  }
  uint64_t v63 = sub_3F3EC();
  v64(v63);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v116 + 32))(v117, v122, v121);
  sub_3F3D0();
  sub_3F404((uint64_t)&v132);
  sub_FE98();
  v65();
  uint64_t v66 = (void *)sub_53DA0();
  os_log_type_t v67 = sub_53E90();
  if (sub_FF7C(v67))
  {
    uint64_t v68 = (_WORD *)sub_61F0();
    sub_61CC(v68);
    sub_FED0(&dword_0, v69, v70, "EmergencyBasicFlow onInput .directInvocation");
    sub_60F0();
  }

  sub_3F450();
  sub_6120();
  v48();
  if (sub_535D0() == 0xD000000000000035 && v71 == 0x8000000000057B10)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v87 = sub_53FE0();
    swift_bridgeObjectRelease();
    if ((v87 & 1) == 0) {
      goto LABEL_25;
    }
  }
  __int16 v88 = sub_2C188();
  if (v88 != 35)
  {
    LOWORD(v62) = v88;
    sub_15450();
    v103();
    LOWORD(v61) = 4;
    goto LABEL_30;
  }
LABEL_25:
  sub_3F3D0();
  sub_FE98();
  v89();
  int v90 = *(void (**)(uint64_t, uint64_t, uint64_t))(v116 + 16);
  v90(v120, v117, v121);
  uint64_t v91 = sub_53DA0();
  os_log_type_t v92 = sub_53EA0();
  if (os_log_type_enabled(v91, v92))
  {
    uint64_t v93 = (uint8_t *)sub_1001C();
    uint64_t v132 = sub_15284();
    *(_DWORD *)uint64_t v93 = 136315138;
    v90(v106, v120, v121);
    uint64_t v94 = sub_53E10();
    uint64_t v130 = sub_50F10(v94, v95, &v132);
    sub_53EF0();
    swift_bridgeObjectRelease();
    uint64_t v96 = *(void (**)(void))(v116 + 8);
    sub_251C8();
    v96();
    _os_log_impl(&dword_0, v91, v92, "Failed to get emergencySituation from DirectInvocation: %s", v93, 0xCu);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();

    sub_6120();
    v48();
    sub_251C8();
    v96();
  }
  else
  {

    uint64_t v105 = *(void (**)(uint64_t, uint64_t))(v116 + 8);
    v105(v120, v121);
    sub_6120();
    v48();
    v105(v117, v121);
  }
  return 0;
}

uint64_t sub_3A834()
{
  sub_10010();
  v1[132] = v0;
  v1[131] = v2;
  uint64_t v3 = sub_2E18(&qword_6BCB8);
  sub_FEC4(v3);
  v1[133] = swift_task_alloc();
  uint64_t v4 = sub_2E18(&qword_6D270);
  sub_FEC4(v4);
  v1[134] = swift_task_alloc();
  uint64_t v5 = sub_2E18(&qword_6BCA8);
  v1[135] = v5;
  sub_FEC4(v5);
  v1[136] = swift_task_alloc();
  uint64_t v6 = sub_53DB0();
  v1[137] = v6;
  v1[138] = *(void *)(v6 - 8);
  v1[139] = swift_task_alloc();
  v1[140] = swift_task_alloc();
  v1[141] = swift_task_alloc();
  return _swift_task_switch(sub_3A998, 0, 0);
}

uint64_t sub_3A998()
{
  uint64_t v29 = v0;
  uint64_t v1 = *(void *)(v0 + 1128);
  uint64_t v2 = *(void *)(v0 + 1104);
  uint64_t v3 = *(uint8_t **)(v0 + 1096);
  uint64_t v4 = sub_53D90();
  *(void *)(v0 + 1136) = v4;
  sub_6108();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint8_t *))(v2 + 16);
  *(void *)(v0 + 1144) = v5;
  *(void *)(v0 + 1152) = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v5(v1, v4, v3);
  uint64_t v6 = sub_53DA0();
  os_log_type_t v7 = sub_53E90();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (_WORD *)sub_61F0();
    sub_61CC(v8);
    _os_log_impl(&dword_0, v6, v7, "#EmergencyBasicFlow execute", v3, 2u);
    sub_60F0();
  }
  uint64_t v9 = *(void *)(v0 + 1104);
  uint64_t v10 = *(void *)(v0 + 1056);

  uint64_t v11 = *(void (**)(void))(v9 + 8);
  *(void *)(v0 + 1160) = v11;
  *(void *)(v0 + 1168) = (v9 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  sub_251C8();
  v11();
  __int16 v12 = *(_WORD *)(v10 + 216);
  *(_WORD *)(v0 + 1184) = v12;
  if (v12 == 5)
  {
    uint64_t v13 = *(void *)(v0 + 1056);
    uint64_t v14 = *(void *)(v0 + 1048);
    sub_F824();
    uint64_t v15 = swift_allocError();
    *uint64_t v16 = 2;
    sub_2940(v15, v13 + 16, (void *)(v13 + 56), v14);
    swift_errorRelease();
    goto LABEL_7;
  }
  if (v12 == 6)
  {
    sub_53460();
LABEL_7:
    sub_3F418();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
    return v17();
  }
  uint64_t v19 = *(void *)(v0 + 1120);
  uint64_t v20 = *(uint8_t **)(v0 + 1096);
  sub_3F3D0();
  v5(v19, v4, v20);
  uint64_t v21 = sub_53DA0();
  os_log_type_t v22 = sub_53E90();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)sub_1001C();
    uint64_t v28 = sub_15284();
    *(_DWORD *)uint64_t v23 = 136315138;
    *(_WORD *)(v0 + 1186) = v12;
    uint64_t v24 = sub_53E10();
    *(void *)(v0 + 1040) = sub_50F10(v24, v25, &v28);
    sub_53EF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v21, v22, "#EmergencyBasicFlow needsExecution intent: %s", v23, 0xCu);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();
  }
  else
  {
  }
  sub_251C8();
  v11();
  uint64_t v26 = *(void *)(v0 + 1056) + 136;
  uint64_t v27 = (void *)swift_task_alloc();
  *(void *)(v0 + 1176) = v27;
  *uint64_t v27 = v0;
  v27[1] = sub_3AD74;
  return sub_167DC(v0 + 272, v26, SHIBYTE(v12), v12);
}

uint64_t sub_3AD74()
{
  sub_10010();
  sub_60D8();
  uint64_t v2 = v1 + 272;
  uint64_t v3 = v1 + 528;
  uint64_t v4 = *v0;
  sub_FFEC();
  *uint64_t v5 = v4;
  swift_task_dealloc();
  sub_247F4(v2, v3, &qword_6C3B0);
  return _swift_task_switch(sub_3AE5C, 0, 0);
}

uint64_t sub_3AE5C()
{
  unsigned int v1 = sub_53D40();
  if (v1 == 35)
  {
    sub_F724((uint64_t *)(v0 + 272));
  }
  else
  {
    unsigned int v2 = v1;
    sub_9160();
    if (*(void *)(v0 + 912))
    {
      uint64_t v38 = (void *)(v0 + 808);
      uint64_t v3 = *(void **)(v0 + 1056);
      sub_5F28((long long *)(v0 + 888), v0 + 768);
      uint64_t v5 = v3[5];
      uint64_t v4 = v3[6];
      sub_2C00(v3 + 2, v5);
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v4);
      sub_247F4(v0 + 272, v0 + 144, &qword_6C3B0);
      int v6 = sub_F27C(v0 + 144);
      uint64_t v7 = *(void *)(v0 + 1080);
      uint64_t v8 = *(void *)(v0 + 1072);
      if (v6 == 1)
      {
        uint64_t v9 = *(void *)(v0 + 1072);
        uint64_t v10 = 1;
      }
      else
      {
        sub_247F4(v0 + 528, v0 + 400, &qword_6C3B0);
        memcpy((void *)(v0 + 16), (const void *)(v0 + 400), 0x80uLL);
        sub_3208((void *)(v0 + 768), (void *)(v0 + 928));
        uint64_t v9 = v8;
        uint64_t v10 = 0;
      }
      sub_34DC(v9, v10, 1, v7);
      uint64_t v23 = *(void *)(v0 + 1080);
      uint64_t v24 = *(void *)(v0 + 1072);
      sub_3048(v0 + 768, (uint64_t)v38);
      uint64_t v37 = (void *)(v0 + 848);
      sub_3048(v0 + 928, v0 + 848);
      int v25 = sub_5800(v24, 1, v23);
      uint64_t v26 = *(void *)(v0 + 1088);
      uint64_t v27 = *(void *)(v0 + 1072);
      if (v25 == 1)
      {
        uint64_t v28 = *(void *)(v0 + 1064);
        uint64_t v29 = *(void *)(v0 + 832);
        uint64_t v30 = *(void *)(v0 + 840);
        sub_2C00(v38, v29);
        uint64_t v31 = sub_53AD0();
        sub_34DC(v28, 1, 1, v31);
        char v32 = sub_43838(v37);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v30 + 8))(v28, v32 & 1, v29, v30);
        sub_14A94(v28, &qword_6BCB8);
        _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v37);
        sub_14A94(v27, &qword_6D270);
      }
      else
      {
        _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v37);
        sub_247F4(v27, v26, &qword_6BCA8);
      }
      uint64_t v33 = *(void *)(v0 + 1088);
      uint64_t v34 = *(void *)(v0 + 1056);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v38);
      sub_2C00((void *)(v34 + 176), *(void *)(v34 + 200));
      sub_3B6E8(v2, (uint64_t *)(v0 + 272), v33);
      sub_F724((uint64_t *)(v0 + 272));
      sub_53450();
      swift_release();
      sub_14A94(v33, &qword_6BCA8);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 928);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 768);
      goto LABEL_15;
    }
    sub_F724((uint64_t *)(v0 + 272));
    sub_14A94(v0 + 888, &qword_6CB28);
  }
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1144);
  uint64_t v12 = *(void *)(v0 + 1136);
  uint64_t v13 = *(void *)(v0 + 1112);
  uint64_t v14 = *(void *)(v0 + 1096);
  sub_6108();
  v11(v13, v12, v14);
  uint64_t v15 = sub_53DA0();
  os_log_type_t v16 = sub_53EA0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)sub_61F0();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_0, v15, v16, "#EmergencyBasicFlow Failed to pick a catWrapper", v17, 2u);
    sub_60F0();
  }
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v0 + 1160);
  uint64_t v19 = *(void *)(v0 + 1112);
  uint64_t v20 = *(void *)(v0 + 1096);
  uint64_t v21 = *(void *)(v0 + 1056);

  v18(v19, v20);
  os_log_type_t v22 = sub_2C00((void *)(v21 + 56), *(void *)(v21 + 80));
  memcpy((void *)(v0 + 656), v22, 0x70uLL);
  sub_2C44(v21 + 16, (const void *)(v0 + 656));
  sub_53450();
  swift_release();
LABEL_15:
  sub_3F418();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
  return v35();
}

uint64_t sub_3B2C0()
{
  type metadata accessor for EmergencyBasicFlow();
  sub_3F338(&qword_6DC70, v0, (void (*)(uint64_t))type metadata accessor for EmergencyBasicFlow);
  return sub_531E0();
}

uint64_t sub_3B34C()
{
  sub_D850();

  return _swift_deallocClassInstance(v0, 218, 7);
}

uint64_t type metadata accessor for EmergencyBasicFlow()
{
  return self;
}

uint64_t getEnumTagSinglePayload for EmergencyBasicFlow.EmergencyBasicFlowState(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFA)
  {
    unsigned int v2 = a2 + 65286;
    if (a2 + 65286 <= 0xFFFEFFFF) {
      unsigned int v3 = 2;
    }
    else {
      unsigned int v3 = 4;
    }
    if (v2 < 0xFF0000) {
      unsigned int v3 = 1;
    }
    if (v2 >= 0x10000) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
    switch(v4)
    {
      case 1:
        int v5 = *((unsigned __int8 *)a1 + 2);
        if (!*((unsigned char *)a1 + 2)) {
          break;
        }
        return (*a1 | (v5 << 16)) - 65286;
      case 2:
        int v5 = a1[1];
        if (a1[1]) {
          return (*a1 | (v5 << 16)) - 65286;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x3B464);
      case 4:
        int v5 = *(_DWORD *)(a1 + 1);
        if (!v5) {
          break;
        }
        return (*a1 | (v5 << 16)) - 65286;
      default:
        break;
    }
  }
  if (*(unsigned __int8 *)a1 <= 4u) {
    int v7 = 4;
  }
  else {
    int v7 = *(unsigned __int8 *)a1;
  }
  unsigned int v8 = v7 - 4;
  if (*(unsigned __int8 *)a1 >= 4u) {
    unsigned int v9 = v8;
  }
  else {
    unsigned int v9 = 0;
  }
  if (v9 >= 3) {
    return v9 - 2;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for EmergencyBasicFlow.EmergencyBasicFlowState(uint64_t result, unsigned int a2, unsigned int a3)
{
  unsigned int v3 = a3 + 65286;
  if (a3 + 65286 <= 0xFFFEFFFF) {
    int v4 = 2;
  }
  else {
    int v4 = 4;
  }
  if (v3 < 0xFF0000) {
    int v4 = 1;
  }
  if (v3 >= 0x10000) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3 >= 0xFA) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v7 = ((a2 - 250) >> 16) + 1;
    *(_WORD *)uint64_t result = a2 - 250;
    switch(v6)
    {
      case 1:
        *(unsigned char *)(result + 2) = v7;
        break;
      case 2:
        *(_WORD *)(result + 2) = v7;
        break;
      case 3:
LABEL_25:
        __break(1u);
        JUMPOUT(0x3B54CLL);
      case 4:
        *(_DWORD *)(result + 2) = v7;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v6)
    {
      case 1:
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_19;
      case 3:
        goto LABEL_25;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_20;
      default:
LABEL_19:
        if (a2) {
LABEL_20:
        }
          *(unsigned char *)uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_3B574(unsigned __int8 *a1)
{
  if (*a1 <= 4u) {
    int v1 = 4;
  }
  else {
    int v1 = *a1;
  }
  unsigned int v2 = v1 - 4;
  if (*a1 >= 4u) {
    return v2;
  }
  else {
    return 0;
  }
}

_WORD *sub_3B594(_WORD *result, unsigned int a2)
{
  if (a2 > 0xFB)
  {
    *uint64_t result = a2 - 252;
  }
  else if (a2)
  {
    *(unsigned char *)uint64_t result = a2 + 4;
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyBasicFlow.EmergencyBasicFlowState()
{
  return &type metadata for EmergencyBasicFlow.EmergencyBasicFlowState;
}

uint64_t sub_3B5C8()
{
  return sub_39A04() & 1;
}

uint64_t sub_3B5F0()
{
  return sub_3B2C0();
}

uint64_t sub_3B614()
{
  int v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *int v1 = v0;
  v1[1] = sub_DD40;
  return sub_3A834();
}

uint64_t sub_3B6B0()
{
  type metadata accessor for EmergencyBasicFlow();

  return sub_53230();
}

uint64_t sub_3B6E8(unsigned int a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v55 = a3;
  unsigned int v52 = a1;
  sub_247F4((uint64_t)a2, (uint64_t)v61, &qword_6C3B0);
  sub_247F4((uint64_t)v61, (uint64_t)v65, &qword_6C3B0);
  uint64_t v4 = sub_2E18(&qword_6BCA8);
  uint64_t v5 = sub_FEC4(v4);
  __chkstk_darwin(v5);
  sub_6150();
  uint64_t v53 = v6;
  uint64_t v54 = sub_53B50();
  sub_6188();
  __chkstk_darwin(v7);
  sub_6140();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_53DB0();
  sub_60C0();
  uint64_t v13 = v12;
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  sub_152E8();
  uint64_t v50 = v18;
  uint64_t v19 = sub_2E18(&qword_6D268);
  uint64_t v20 = sub_FEC4(v19);
  __chkstk_darwin(v20);
  sub_6140();
  uint64_t v23 = v22 - v21;
  uint64_t v24 = type metadata accessor for ConfirmationFlowConfigModel();
  sub_6188();
  __chkstk_darwin(v25);
  sub_612C();
  uint64_t v51 = v26;
  __chkstk_darwin(v27);
  sub_152E8();
  uint64_t v29 = v28;
  sub_247F4((uint64_t)a2, (uint64_t)v62, &qword_6C3B0);
  if (sub_F27C((uint64_t)v62) == 1) {
    goto LABEL_4;
  }
  memcpy(v63, v62, sizeof(v63));
  sub_247F4((uint64_t)v65, (uint64_t)v60, &qword_6C3B0);
  sub_5D2C((uint64_t)v60);
  sub_3BD0C(v52, v63, v55, v23);
  if (sub_5800(v23, 1, v24) == 1)
  {
    sub_F724(a2);
    sub_14A94(v23, &qword_6D268);
LABEL_4:
    sub_53D90();
    sub_6108();
    sub_FE98();
    v30();
    uint64_t v31 = sub_53DA0();
    os_log_type_t v32 = sub_53E90();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)sub_61F0();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl(&dword_0, v31, v32, "#EmergencyBasicFlow preparing promptless output", v33, 2u);
      sub_60F0();
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v11);
    sub_3EB00(v55, v53, &qword_6BCA8);
    sub_3048(v56, (uint64_t)v60);
    sub_53B40();
    sub_3F338((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
    uint64_t v34 = sub_531D0();
    uint64_t v35 = (uint64_t (*)())&type metadata accessor for OutputFlow;
    goto LABEL_10;
  }
  uint64_t v10 = v29;
  sub_3F2E4(v23, v29, (void (*)(void))type metadata accessor for ConfirmationFlowConfigModel);
  sub_53D90();
  sub_6108();
  uint64_t v36 = v50;
  sub_FE98();
  v37();
  uint64_t v38 = sub_53DA0();
  os_log_type_t v39 = sub_53E90();
  if (os_log_type_enabled(v38, v39))
  {
    os_log_type_t v40 = (uint8_t *)sub_61F0();
    *(_WORD *)os_log_type_t v40 = 0;
    _os_log_impl(&dword_0, v38, v39, "#EmergencyBasicFlow preparing for confirmation", v40, 2u);
    sub_60F0();
  }

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v36, v11);
  uint64_t v41 = v56;
  sub_3048(v56, (uint64_t)v59);
  sub_3048(v41 + 40, (uint64_t)v58);
  sub_5920(v41 + 80, (uint64_t)v57);
  sub_597C((uint64_t)v58, v58[3]);
  sub_60C0();
  __chkstk_darwin(v42);
  sub_6140();
  uint64_t v45 = (const void *)(v44 - v43);
  (*(void (**)(uint64_t))(v46 + 16))(v44 - v43);
  uint64_t v47 = v51;
  sub_3F290(v10, v51, (void (*)(void))type metadata accessor for ConfirmationFlowConfigModel);
  memcpy(v64, v45, sizeof(v64));
  uint64_t v48 = sub_51858(v63, v47, v59, v64, (uint64_t)v57, 0, 0, 0);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v58);
  *(void *)&v59[0] = v48;
  type metadata accessor for EmergencyConfirmationFlow();
  sub_3F338(&qword_6BE80, 255, (void (*)(uint64_t))type metadata accessor for EmergencyConfirmationFlow);
  uint64_t v34 = sub_531D0();
  swift_release();
  uint64_t v35 = type metadata accessor for ConfirmationFlowConfigModel;
LABEL_10:
  sub_1B580(v10, (void (*)(void))v35);
  return v34;
}

uint64_t sub_3BD0C@<X0>(unsigned int a1@<W0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  void (*v51)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v52;
  unsigned int v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void v60[2];
  void v61[3];
  uint64_t v62;
  uint64_t v63;
  unsigned char v64[136];
  unsigned char __dst[128];

  uint64_t v5 = v4;
  uint64_t v56 = a3;
  uint64_t v58 = a4;
  memcpy(__dst, a2, sizeof(__dst));
  uint64_t v8 = sub_2E18(&qword_6BCA8);
  sub_6188();
  __chkstk_darwin(v9);
  sub_6150();
  uint64_t v55 = v10;
  uint64_t v11 = sub_2E18((uint64_t *)&unk_6DA80);
  uint64_t v12 = sub_FEC4(v11);
  __chkstk_darwin(v12);
  sub_6140();
  uint64_t v15 = v14 - v13;
  sub_53B90();
  sub_6188();
  __chkstk_darwin(v16);
  sub_6140();
  uint64_t v19 = v18 - v17;
  uint64_t v20 = sub_2E18(&qword_6D270);
  uint64_t v21 = sub_FEC4(v20);
  __chkstk_darwin(v21);
  sub_612C();
  uint64_t v57 = v22;
  uint64_t v24 = __chkstk_darwin(v23);
  __chkstk_darwin(v24);
  uint64_t v26 = (char *)&v51 - v25;
  uint64_t v59 = v8;
  sub_34DC((uint64_t)&v51 - v25, 1, 1, v8);
  if (sub_3C2EC())
  {
    sub_3048((uint64_t)v5, (uint64_t)v60);
    sub_3048((uint64_t)(v5 + 5), (uint64_t)&v62);
    memcpy(v64, __dst, 0x80uLL);
    sub_1B3B8((uint64_t)v64);
    sub_F87C((uint64_t)v64, (uint64_t)&v63);
    sub_5D2C((uint64_t)a2);
    sub_F8D8();
    uint64_t v27 = sub_531D0();
    sub_F924((uint64_t)v60);
    sub_2C00(v5 + 5, v5[8]);
    swift_retain();
    sub_25858();
    swift_release();
    sub_14A94((uint64_t)v26, &qword_6D270);
    sub_3F390();
    uint64_t v28 = sub_3F440();
    char v30 = sub_3C674(v28, v29);
    char v31 = 0;
    unint64_t v32 = 2;
    goto LABEL_8;
  }
  uint64_t v54 = v26;
  sub_3F440();
  if ((sub_3CD10() & 1) == 0)
  {
    uint64_t v39 = sub_3F440();
    if ((sub_3DBFC(v39, v40) & 1) == 0)
    {
      uint64_t v44 = (uint64_t)v54;
      goto LABEL_12;
    }
    uint64_t v41 = a2[13];
    unsigned int v52 = a2[12];
    uint64_t v53 = a1;
    uint64_t v42 = v5[3];
    uint64_t v43 = v5[4];
    sub_2C00(v5, v42);
    uint64_t v51 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v43 + 16);
    swift_bridgeObjectRetain();
    v51(v61, v42, v43);
    v60[0] = v52;
    v60[1] = v41;
    sub_1B480();
    uint64_t v27 = sub_531D0();
    sub_1B4CC((uint64_t)v60);
    sub_2C00(v5 + 5, v5[8]);
    swift_retain();
    sub_25C74();
    swift_release();
    uint64_t v26 = v54;
    sub_14A94((uint64_t)v54, &qword_6D270);
    char v31 = 1;
    sub_3F390();
    char v30 = sub_3E118(v53, (uint64_t)a2);
    unint64_t v32 = 4;
LABEL_8:
    uint64_t v44 = v57;
    sub_247F4((uint64_t)v26, v57, &qword_6D270);
    if (sub_5800(v44, 1, v59) != 1)
    {
      uint64_t v45 = v55;
      sub_247F4(v44, v55, &qword_6BCA8);
      uint64_t v46 = v58;
      sub_3EB00(v56, v58, &qword_6BCA8);
      uint64_t v47 = (int *)type metadata accessor for ConfirmationFlowConfigModel();
      sub_247F4(v45, v46 + v47[5], &qword_6BCA8);
      *(void *)(v46 + v47[6]) = v27;
      *(void *)(v46 + v47[7]) = v32;
      *(unsigned char *)(v46 + v47[8]) = v31;
      *(unsigned char *)(v46 + v47[9]) = v30 & 1;
      uint64_t v48 = v46;
      uint64_t v49 = 0;
      uint64_t v50 = (uint64_t)v47;
      return sub_34DC(v48, v49, 1, v50);
    }
    sub_27DC4(v32);
    swift_release();
LABEL_12:
    sub_14A94(v44, &qword_6D270);
    uint64_t v50 = type metadata accessor for ConfirmationFlowConfigModel();
    uint64_t v48 = v58;
    uint64_t v49 = 1;
    return sub_34DC(v48, v49, 1, v50);
  }
  uint64_t v53 = a1;
  uint64_t v33 = v5[3];
  uint64_t v34 = v5[4];
  sub_2C00(v5, v33);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v34 + 16))(v60, v33, v34);
  sub_53C40();
  uint64_t v35 = sub_53030();
  uint64_t result = sub_5800(v15, 1, v35);
  if (result != 1)
  {
    sub_53B80();
    sub_3F338(&qword_6CB30, 255, (void (*)(uint64_t))&type metadata accessor for AppPunchOutFlow);
    uint64_t v37 = sub_531D0();
    uint64_t v38 = v19;
    uint64_t v27 = v37;
    sub_1B580(v38, (void (*)(void))&type metadata accessor for AppPunchOutFlow);
    sub_2C00(v5 + 5, v5[8]);
    swift_retain();
    sub_25C74();
    swift_release();
    uint64_t v26 = v54;
    sub_14A94((uint64_t)v54, &qword_6D270);
    sub_3F390();
    char v30 = sub_3D218(v53, (uint64_t)a2);
    char v31 = 2;
    unint64_t v32 = 3;
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t sub_3C2EC()
{
  uint64_t v1 = sub_53DB0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v23 - v6;
  if (sub_53C60())
  {
    uint64_t v8 = v0[3];
    uint64_t v9 = v0[4];
    sub_2C00(v0, v8);
    (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v9 + 8))(v25, v8, v9);
    char v10 = sub_43838(v25);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v25);
    uint64_t v11 = sub_53D90();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v7, v11, v1);
    uint64_t v12 = sub_53DA0();
    os_log_type_t v13 = sub_53E90();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      v23[0] = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      uint64_t v24 = v15;
      if (v10) {
        uint64_t v16 = 0x6E6974706D6F7250;
      }
      else {
        uint64_t v16 = 0x6D6F727020746F4ELL;
      }
      if (v10) {
        unint64_t v17 = 0xE900000000000067;
      }
      else {
        unint64_t v17 = 0xED0000676E697470;
      }
      v23[1] = sub_50F10(v16, v17, &v24);
      sub_53EF0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v12, v13, "%s for call followup.", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  }
  else
  {
    uint64_t v18 = sub_53D90();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v18, v1);
    uint64_t v19 = sub_53DA0();
    os_log_type_t v20 = sub_53E90();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_0, v19, v20, "orgInfo does not have name and number. Not prompting for call followup.", v21, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    char v10 = 0;
  }
  return v10 & 1;
}

uint64_t sub_3C674(uint64_t a1, uint64_t a2)
{
  uint64_t v47 = a2;
  uint64_t v2 = sub_53DB0();
  uint64_t v48 = *(void *)(v2 - 8);
  uint64_t v49 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v45 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v44 = (char *)&v43 - v6;
  __chkstk_darwin(v5);
  uint64_t v46 = (char *)&v43 - v7;
  uint64_t v8 = sub_539B0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2E18(&qword_6DA68);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_2E18(&qword_6DA70);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v18 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v43 - v20;
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v43 - v22;
  sub_53950();
  if (sub_53940())
  {
    sub_53930();
    swift_release();
    sub_53BE0();
    swift_release();
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = 1;
  }
  sub_34DC((uint64_t)v23, v24, 1, v8);
  sub_539A0();
  sub_34DC((uint64_t)v21, 0, 1, v8);
  uint64_t v25 = (uint64_t)&v14[*(int *)(v12 + 48)];
  sub_3EB00((uint64_t)v23, (uint64_t)v14, &qword_6DA70);
  sub_3EB00((uint64_t)v21, v25, &qword_6DA70);
  if (sub_5800((uint64_t)v14, 1, v8) == 1)
  {
    sub_14A94((uint64_t)v21, &qword_6DA70);
    sub_14A94((uint64_t)v23, &qword_6DA70);
    if (sub_5800(v25, 1, v8) == 1)
    {
      sub_14A94((uint64_t)v14, &qword_6DA70);
      uint64_t v27 = v48;
      uint64_t v26 = v49;
      goto LABEL_16;
    }
    goto LABEL_9;
  }
  sub_3EB00((uint64_t)v14, (uint64_t)v18, &qword_6DA70);
  if (sub_5800(v25, 1, v8) == 1)
  {
    sub_14A94((uint64_t)v21, &qword_6DA70);
    sub_14A94((uint64_t)v23, &qword_6DA70);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v18, v8);
LABEL_9:
    sub_14A94((uint64_t)v14, &qword_6DA68);
    uint64_t v27 = v48;
    uint64_t v26 = v49;
    goto LABEL_10;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v11, v25, v8);
  sub_3F338(&qword_6DA78, 255, (void (*)(uint64_t))&type metadata accessor for ResponseMode);
  char v39 = sub_53DE0();
  uint64_t v40 = *(void (**)(char *, uint64_t))(v9 + 8);
  v40(v11, v8);
  sub_14A94((uint64_t)v21, &qword_6DA70);
  sub_14A94((uint64_t)v23, &qword_6DA70);
  v40(v18, v8);
  sub_14A94((uint64_t)v14, &qword_6DA70);
  uint64_t v27 = v48;
  uint64_t v26 = v49;
  if (v39)
  {
LABEL_16:
    uint64_t v41 = sub_53D90();
    swift_beginAccess();
    char v31 = v46;
    (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v46, v41, v26);
    unint64_t v32 = sub_53DA0();
    os_log_type_t v36 = sub_53E90();
    if (os_log_type_enabled(v32, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      uint64_t v38 = "DisplayOnly request. Not listening after speaking.";
      goto LABEL_18;
    }
LABEL_20:
    uint64_t v35 = 0;
    goto LABEL_22;
  }
LABEL_10:
  char v28 = sub_53C60();
  uint64_t v29 = sub_53D90();
  char v30 = (void (**)(char *, uint64_t, uint64_t))(v27 + 16);
  if (v28)
  {
    swift_beginAccess();
    char v31 = v44;
    (*v30)(v44, v29, v26);
    unint64_t v32 = sub_53DA0();
    os_log_type_t v33 = sub_53E90();
    if (!os_log_type_enabled(v32, v33))
    {
      uint64_t v35 = 1;
      goto LABEL_22;
    }
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v34 = 0;
    _os_log_impl(&dword_0, v32, v33, "Will listen after speaking the call followup.", v34, 2u);
    uint64_t v35 = 1;
    goto LABEL_19;
  }
  swift_beginAccess();
  char v31 = v45;
  (*v30)(v45, v29, v26);
  unint64_t v32 = sub_53DA0();
  os_log_type_t v36 = sub_53E90();
  if (!os_log_type_enabled(v32, v36)) {
    goto LABEL_20;
  }
  uint64_t v37 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)uint64_t v37 = 0;
  uint64_t v38 = "orgInfo does not have name and number. Not listening after speaking.";
LABEL_18:
  _os_log_impl(&dword_0, v32, v36, v38, v37, 2u);
  uint64_t v35 = 0;
LABEL_19:
  swift_slowDealloc();
LABEL_22:

  (*(void (**)(char *, uint64_t))(v27 + 8))(v31, v26);
  return v35;
}

uint64_t sub_3CD10()
{
  uint64_t v1 = sub_53DB0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v32[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v32[-1] - v7;
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v32[-1] - v9;
  if ((sub_53C60() & 1) != 0 || (sub_53C70() & 1) == 0)
  {
    uint64_t v14 = sub_53D90();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v14, v1);
    uint64_t v15 = sub_53DA0();
    os_log_type_t v16 = sub_53E90();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_0, v15, v16, "orgInfo does not have name and website. Not prompting for website followup.", v17, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    return 0;
  }
  uint64_t v11 = v0[3];
  uint64_t v12 = v0[4];
  sub_2C00(v0, v11);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v12 + 8))(v36, v11, v12);
  sub_2C00(v36, v36[3]);
  char v13 = sub_533A0();
  sub_3048((uint64_t)v36, (uint64_t)v35);
  if (v13)
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v35);
    sub_3048((uint64_t)v36, (uint64_t)v34);
LABEL_9:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v34);
    sub_3048((uint64_t)v36, (uint64_t)v33);
LABEL_10:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v33);
    sub_3048((uint64_t)v36, (uint64_t)v32);
LABEL_11:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v32);
LABEL_12:
    uint64_t v19 = sub_53D90();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v10, v19, v1);
    uint64_t v20 = sub_53DA0();
    os_log_type_t v21 = sub_53E90();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_0, v20, v21, "No prompt needed for this device. Not prompting for website followup.", v22, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v10, v1);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v36);
    return 0;
  }
  sub_2C00(v35, v35[3]);
  char v18 = sub_53310();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v35);
  sub_3048((uint64_t)v36, (uint64_t)v34);
  if (v18) {
    goto LABEL_9;
  }
  sub_2C00(v34, v34[3]);
  char v24 = sub_53390();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v34);
  sub_3048((uint64_t)v36, (uint64_t)v33);
  if (v24) {
    goto LABEL_10;
  }
  sub_2C00(v33, v33[3]);
  char v25 = sub_53370();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v33);
  sub_3048((uint64_t)v36, (uint64_t)v32);
  if (v25) {
    goto LABEL_11;
  }
  sub_2C00(v32, v32[3]);
  char v26 = sub_53380();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v32);
  if (v26) {
    goto LABEL_12;
  }
  uint64_t v27 = sub_53D90();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v8, v27, v1);
  char v28 = sub_53DA0();
  os_log_type_t v29 = sub_53E90();
  if (os_log_type_enabled(v28, v29))
  {
    char v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v30 = 0;
    _os_log_impl(&dword_0, v28, v29, "Prompting for website followup.", v30, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v8, v1);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v36);
  return 1;
}

uint64_t sub_3D218(uint64_t a1, uint64_t a2)
{
  uint64_t v63 = a2;
  uint64_t v2 = sub_53DB0();
  uint64_t v64 = *(void *)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  int v61 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v58 = (char *)&v58 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v59 = (char *)&v58 - v8;
  __chkstk_darwin(v7);
  int v62 = (char *)&v58 - v9;
  uint64_t v10 = sub_539B0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  char v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2E18(&qword_6DA68);
  __chkstk_darwin(v14);
  os_log_type_t v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_2E18(&qword_6DA70);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v20 = (char *)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v18);
  uint64_t v23 = (char *)&v58 - v22;
  __chkstk_darwin(v21);
  char v25 = (char *)&v58 - v24;
  sub_53950();
  uint64_t v26 = sub_53940();
  uint64_t v65 = v2;
  if (v26)
  {
    sub_53930();
    swift_release();
    sub_53BE0();
    swift_release();
    uint64_t v27 = 0;
  }
  else
  {
    uint64_t v27 = 1;
  }
  sub_34DC((uint64_t)v25, v27, 1, v10);
  sub_539A0();
  sub_34DC((uint64_t)v23, 0, 1, v10);
  uint64_t v28 = (uint64_t)&v16[*(int *)(v14 + 48)];
  sub_3EB00((uint64_t)v25, (uint64_t)v16, &qword_6DA70);
  sub_3EB00((uint64_t)v23, v28, &qword_6DA70);
  if (sub_5800((uint64_t)v16, 1, v10) == 1)
  {
    sub_14A94((uint64_t)v23, &qword_6DA70);
    sub_14A94((uint64_t)v25, &qword_6DA70);
    int v29 = sub_5800(v28, 1, v10);
    uint64_t v30 = v65;
    uint64_t v31 = v64;
    if (v29 == 1)
    {
      sub_14A94((uint64_t)v16, &qword_6DA70);
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  sub_3EB00((uint64_t)v16, (uint64_t)v20, &qword_6DA70);
  if (sub_5800(v28, 1, v10) == 1)
  {
    sub_14A94((uint64_t)v23, &qword_6DA70);
    sub_14A94((uint64_t)v25, &qword_6DA70);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v20, v10);
    uint64_t v30 = v65;
    uint64_t v31 = v64;
LABEL_9:
    sub_14A94((uint64_t)v16, &qword_6DA68);
    goto LABEL_13;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v13, v28, v10);
  sub_3F338(&qword_6DA78, 255, (void (*)(uint64_t))&type metadata accessor for ResponseMode);
  char v32 = sub_53DE0();
  os_log_type_t v33 = *(void (**)(char *, uint64_t))(v11 + 8);
  v33(v13, v10);
  sub_14A94((uint64_t)v23, &qword_6DA70);
  sub_14A94((uint64_t)v25, &qword_6DA70);
  v33(v20, v10);
  sub_14A94((uint64_t)v16, &qword_6DA70);
  uint64_t v30 = v65;
  uint64_t v31 = v64;
  if (v32)
  {
LABEL_11:
    uint64_t v34 = sub_53D90();
    swift_beginAccess();
    uint64_t v35 = v62;
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v62, v34, v30);
    os_log_type_t v36 = sub_53DA0();
    os_log_type_t v37 = sub_53E90();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      char v39 = "DisplayOnly request. Not listening after speaking.";
LABEL_18:
      _os_log_impl(&dword_0, v36, v37, v39, v38, 2u);
      swift_slowDealloc();
      goto LABEL_19;
    }
    goto LABEL_19;
  }
LABEL_13:
  if ((sub_53C70() & 1) == 0)
  {
    uint64_t v42 = sub_53D90();
    swift_beginAccess();
    uint64_t v35 = v61;
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v61, v42, v30);
    os_log_type_t v36 = sub_53DA0();
    os_log_type_t v37 = sub_53E90();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      char v39 = "orgInfo does not have name and website. Not listening after speaking.";
      goto LABEL_18;
    }
LABEL_19:

    (*(void (**)(char *, uint64_t))(v31 + 8))(v35, v30);
    return 0;
  }
  uint64_t v40 = v60[3];
  uint64_t v41 = v60[4];
  sub_2C00(v60, v40);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v41 + 8))(v70, v40, v41);
  sub_2C00(v70, v70[3]);
  LOBYTE(v40) = sub_533A0();
  sub_3048((uint64_t)v70, (uint64_t)v69);
  if (v40)
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v69);
    sub_3048((uint64_t)v70, (uint64_t)v68);
LABEL_21:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v68);
    sub_3048((uint64_t)v70, (uint64_t)v67);
    uint64_t v44 = v59;
LABEL_22:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v67);
    sub_3048((uint64_t)v70, (uint64_t)v66);
LABEL_23:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v66);
LABEL_24:
    uint64_t v45 = sub_53D90();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v44, v45, v30);
    uint64_t v46 = sub_53DA0();
    os_log_type_t v47 = sub_53E90();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl(&dword_0, v46, v47, "No prompt needed for this device. Not listening after speaking.", v48, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v31 + 8))(v44, v30);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v70);
    return 0;
  }
  sub_2C00(v69, v69[3]);
  char v43 = sub_53310();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v69);
  sub_3048((uint64_t)v70, (uint64_t)v68);
  if (v43) {
    goto LABEL_21;
  }
  sub_2C00(v68, v68[3]);
  char v50 = sub_53390();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v68);
  sub_3048((uint64_t)v70, (uint64_t)v67);
  uint64_t v44 = v59;
  if (v50) {
    goto LABEL_22;
  }
  sub_2C00(v67, v67[3]);
  char v51 = sub_53370();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v67);
  sub_3048((uint64_t)v70, (uint64_t)v66);
  if (v51) {
    goto LABEL_23;
  }
  sub_2C00(v66, v66[3]);
  char v52 = sub_53380();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v66);
  if (v52) {
    goto LABEL_24;
  }
  uint64_t v53 = sub_53D90();
  swift_beginAccess();
  uint64_t v54 = v58;
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v58, v53, v30);
  uint64_t v55 = sub_53DA0();
  os_log_type_t v56 = sub_53E90();
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v57 = 0;
    _os_log_impl(&dword_0, v55, v56, "Will listen after speaking the website followup.", v57, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v31 + 8))(v54, v30);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v70);
  return 1;
}

uint64_t sub_3DBFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_53DB0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v37[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v37[-1] - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v37[-1] - v13;
  if (sub_53C60()) {
    goto LABEL_7;
  }
  uint64_t v15 = *(void *)(a2 + 104);
  if ((v15 & 0x2000000000000000) == 0)
  {
    if ((*(void *)(a2 + 96) & 0xFFFFFFFFFFFFLL) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v19 = sub_53D90();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v19, v5);
    uint64_t v20 = sub_53DA0();
    os_log_type_t v21 = sub_53E90();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_0, v20, v21, "orgInfo does not have a websearch query. Not prompting for websearch followup.", v22, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    return 0;
  }
  if ((v15 & 0xF00000000000000) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v16 = v3[3];
  uint64_t v17 = v3[4];
  sub_2C00(v3, v16);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v17 + 8))(v41, v16, v17);
  sub_2C00(v41, v41[3]);
  char v18 = sub_533A0();
  sub_3048((uint64_t)v41, (uint64_t)v40);
  if (v18)
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v40);
    sub_3048((uint64_t)v41, (uint64_t)v39);
LABEL_11:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v39);
    sub_3048((uint64_t)v41, (uint64_t)v38);
LABEL_12:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v38);
    sub_3048((uint64_t)v41, (uint64_t)v37);
LABEL_13:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v37);
LABEL_14:
    uint64_t v24 = sub_53D90();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v14, v24, v5);
    char v25 = sub_53DA0();
    os_log_type_t v26 = sub_53E90();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_0, v25, v26, "No prompt needed for this device. Not prompting for websearch followup.", v27, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v41);
    return 0;
  }
  sub_2C00(v40, v40[3]);
  char v23 = sub_53310();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v40);
  sub_3048((uint64_t)v41, (uint64_t)v39);
  if (v23) {
    goto LABEL_11;
  }
  sub_2C00(v39, v39[3]);
  char v29 = sub_53390();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v39);
  sub_3048((uint64_t)v41, (uint64_t)v38);
  if (v29) {
    goto LABEL_12;
  }
  sub_2C00(v38, v38[3]);
  char v30 = sub_53370();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v38);
  sub_3048((uint64_t)v41, (uint64_t)v37);
  if (v30) {
    goto LABEL_13;
  }
  sub_2C00(v37, v37[3]);
  char v31 = sub_53380();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v37);
  if (v31) {
    goto LABEL_14;
  }
  uint64_t v32 = sub_53D90();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v12, v32, v5);
  os_log_type_t v33 = sub_53DA0();
  os_log_type_t v34 = sub_53E90();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v35 = 0;
    _os_log_impl(&dword_0, v33, v34, "Prompting for websearch followup.", v35, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v5);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v41);
  return 1;
}

uint64_t sub_3E118(uint64_t a1, uint64_t a2)
{
  uint64_t v63 = a2;
  uint64_t v65 = sub_53DB0();
  uint64_t v64 = *(void *)(v65 - 8);
  uint64_t v2 = __chkstk_darwin(v65);
  uint64_t v59 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v58 = (char *)&v58 - v5;
  uint64_t v6 = __chkstk_darwin(v4);
  int v62 = (char *)&v58 - v7;
  __chkstk_darwin(v6);
  __int16 v60 = (char *)&v58 - v8;
  uint64_t v9 = sub_539B0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_2E18(&qword_6DA68);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2E18(&qword_6DA70);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v19 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v22 = (char *)&v58 - v21;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v58 - v23;
  sub_53950();
  if (sub_53940())
  {
    sub_53930();
    swift_release();
    sub_53BE0();
    swift_release();
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v25 = 1;
  }
  sub_34DC((uint64_t)v24, v25, 1, v9);
  sub_539A0();
  sub_34DC((uint64_t)v22, 0, 1, v9);
  uint64_t v26 = (uint64_t)&v15[*(int *)(v13 + 48)];
  sub_3EB00((uint64_t)v24, (uint64_t)v15, &qword_6DA70);
  sub_3EB00((uint64_t)v22, v26, &qword_6DA70);
  if (sub_5800((uint64_t)v15, 1, v9) == 1)
  {
    sub_14A94((uint64_t)v22, &qword_6DA70);
    sub_14A94((uint64_t)v24, &qword_6DA70);
    int v27 = sub_5800(v26, 1, v9);
    uint64_t v28 = v64;
    if (v27 == 1)
    {
      sub_14A94((uint64_t)v15, &qword_6DA70);
      uint64_t v29 = v65;
      goto LABEL_17;
    }
    goto LABEL_9;
  }
  sub_3EB00((uint64_t)v15, (uint64_t)v19, &qword_6DA70);
  if (sub_5800(v26, 1, v9) == 1)
  {
    sub_14A94((uint64_t)v22, &qword_6DA70);
    sub_14A94((uint64_t)v24, &qword_6DA70);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v19, v9);
    uint64_t v28 = v64;
LABEL_9:
    sub_14A94((uint64_t)v15, &qword_6DA68);
    uint64_t v29 = v65;
    goto LABEL_10;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, v26, v9);
  sub_3F338(&qword_6DA78, 255, (void (*)(uint64_t))&type metadata accessor for ResponseMode);
  char v35 = sub_53DE0();
  os_log_type_t v36 = *(void (**)(char *, uint64_t))(v10 + 8);
  v36(v12, v9);
  sub_14A94((uint64_t)v22, &qword_6DA70);
  sub_14A94((uint64_t)v24, &qword_6DA70);
  v36(v19, v9);
  sub_14A94((uint64_t)v15, &qword_6DA70);
  uint64_t v29 = v65;
  uint64_t v28 = v64;
  if (v35)
  {
LABEL_17:
    uint64_t v37 = sub_53D90();
    swift_beginAccess();
    uint64_t v38 = v60;
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v60, v37, v29);
    char v39 = sub_53DA0();
    os_log_type_t v40 = sub_53E90();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v41 = 0;
      uint64_t v42 = "DisplayOnly request. Not listening after speaking.";
LABEL_21:
      _os_log_impl(&dword_0, v39, v40, v42, v41, 2u);
      swift_slowDealloc();
      goto LABEL_22;
    }
    goto LABEL_22;
  }
LABEL_10:
  unint64_t v30 = *(void *)(v63 + 104);
  if ((v30 & 0x2000000000000000) != 0) {
    uint64_t v31 = HIBYTE(v30) & 0xF;
  }
  else {
    uint64_t v31 = *(void *)(v63 + 96) & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v32 = v62;
  if (!v31)
  {
    uint64_t v43 = sub_53D90();
    swift_beginAccess();
    uint64_t v38 = v59;
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v59, v43, v29);
    char v39 = sub_53DA0();
    os_log_type_t v40 = sub_53E90();
    if (os_log_type_enabled(v39, v40))
    {
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v41 = 0;
      uint64_t v42 = "orgInfo does not have a websearch query. Not listening after speaking.";
      goto LABEL_21;
    }
LABEL_22:

    (*(void (**)(char *, uint64_t))(v28 + 8))(v38, v29);
    return 0;
  }
  uint64_t v33 = v61[3];
  uint64_t v34 = v61[4];
  sub_2C00(v61, v33);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v34 + 8))(v70, v33, v34);
  sub_2C00(v70, v70[3]);
  LOBYTE(v33) = sub_533A0();
  sub_3048((uint64_t)v70, (uint64_t)v69);
  if (v33)
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v69);
    sub_3048((uint64_t)v70, (uint64_t)v68);
LABEL_24:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v68);
    sub_3048((uint64_t)v70, (uint64_t)v67);
LABEL_25:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v67);
    sub_3048((uint64_t)v70, (uint64_t)v66);
LABEL_26:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v66);
LABEL_27:
    uint64_t v45 = sub_53D90();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v32, v45, v29);
    uint64_t v46 = sub_53DA0();
    os_log_type_t v47 = sub_53E90();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl(&dword_0, v46, v47, "No prompt needed for this device. Not listening after speaking.", v48, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v28 + 8))(v32, v29);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v70);
    return 0;
  }
  sub_2C00(v69, v69[3]);
  char v44 = sub_53310();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v69);
  sub_3048((uint64_t)v70, (uint64_t)v68);
  if (v44) {
    goto LABEL_24;
  }
  sub_2C00(v68, v68[3]);
  char v50 = sub_53390();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v68);
  sub_3048((uint64_t)v70, (uint64_t)v67);
  if (v50) {
    goto LABEL_25;
  }
  sub_2C00(v67, v67[3]);
  char v51 = sub_53370();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v67);
  sub_3048((uint64_t)v70, (uint64_t)v66);
  if (v51) {
    goto LABEL_26;
  }
  sub_2C00(v66, v66[3]);
  char v52 = sub_53380();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v66);
  if (v52) {
    goto LABEL_27;
  }
  uint64_t v53 = sub_53D90();
  swift_beginAccess();
  uint64_t v54 = v58;
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v58, v53, v29);
  uint64_t v55 = sub_53DA0();
  os_log_type_t v56 = sub_53E90();
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v57 = 0;
    _os_log_impl(&dword_0, v55, v56, "Will listen after speaking the websearch followup.", v57, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v28 + 8))(v54, v29);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v70);
  return 1;
}

uint64_t sub_3EB00(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_2E18(a3);
  sub_6188();
  uint64_t v4 = sub_3F460();
  v5(v4);
  return a2;
}

uint64_t sub_3EB50(uint64_t a1)
{
  uint64_t v2 = sub_53DB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_53CD0();
  v22[3] = v6;
  v22[4] = (uint64_t)&protocol witness table for EmergencyDialogAct;
  uint64_t v7 = sub_5DC4(v22);
  sub_3F2E4(a1, (uint64_t)v7, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
  uint64_t v8 = sub_53D90();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
  sub_3048((uint64_t)v22, (uint64_t)v21);
  uint64_t v9 = sub_53DA0();
  os_log_type_t v10 = sub_53E90();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v18 = v2;
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v17 = v11 + 4;
    sub_3048((uint64_t)v21, (uint64_t)v19);
    sub_2E18(&qword_6C3E0);
    uint64_t v12 = sub_53E10();
    v19[0] = sub_50F10(v12, v13, &v20);
    sub_53EF0();
    swift_bridgeObjectRelease();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v21);
    _os_log_impl(&dword_0, v9, v10, "Converting EmergencyDialogAct to EmergencyBasicIntent: %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v18);
  }
  else
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v21);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  int v14 = *((unsigned __int8 *)v7 + *(int *)(v6 + 28));
  int v15 = *((unsigned __int8 *)v7 + *(int *)(v6 + 24));
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v22);
  return v14 | (v15 << 8);
}

uint64_t sub_3EE04(uint64_t a1)
{
  uint64_t v2 = sub_53DB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for EmergencyNLIntent();
  uint64_t v30 = v6;
  uint64_t v31 = sub_3F338(&qword_6C3E8, 255, (void (*)(uint64_t))type metadata accessor for EmergencyNLIntent);
  uint64_t v7 = sub_5DC4(v29);
  sub_3F2E4(a1, (uint64_t)v7, (void (*)(void))type metadata accessor for EmergencyNLIntent);
  uint64_t v8 = sub_53D90();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
  sub_3048((uint64_t)v29, (uint64_t)v28);
  uint64_t v9 = sub_53DA0();
  os_log_type_t v10 = sub_53E90();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v24 = v2;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v25 = v6;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v27 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    v23[1] = v12 + 4;
    unint64_t v13 = sub_2C00(v28, v28[3]);
    v23[0] = v23;
    __chkstk_darwin(v13);
    int v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v16 + 16))(v15);
    uint64_t v17 = sub_3F488();
    unint64_t v19 = v18;
    sub_1B580((uint64_t)v15, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    uint64_t v26 = sub_50F10(v17, v19, &v27);
    sub_53EF0();
    swift_bridgeObjectRelease();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v28);
    _os_log_impl(&dword_0, v9, v10, "Converting EmergencyNLIntent: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v24);
  }
  else
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v28);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_2C00(v29, v30);
  if (qword_6B918 != -1) {
    swift_once();
  }
  sub_3F338(&qword_6C0B0, 255, (void (*)(uint64_t))type metadata accessor for EmergencyNLIntent);
  sub_537F0();
  int v20 = LOBYTE(v28[0]);
  sub_2C00(v29, v30);
  if (qword_6B908 != -1) {
    swift_once();
  }
  sub_537F0();
  int v21 = LOBYTE(v28[0]);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v29);
  return v20 | (v21 << 8);
}

uint64_t sub_3F290(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_6188();
  uint64_t v4 = sub_3F460();
  v5(v4);
  return a2;
}

uint64_t sub_3F2E4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_6188();
  uint64_t v4 = sub_252B8();
  v5(v4);
  return a2;
}

uint64_t sub_3F338(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

ValueMetadata *type metadata accessor for EmergencyBasicFlowFollowupProvider()
{
  return &type metadata for EmergencyBasicFlowFollowupProvider;
}

uint64_t sub_3F390()
{
  sub_34DC(v3, 0, 1, *(void *)(v0 + 64));
  return sub_247F4(v3, v2, v1);
}

uint64_t sub_3F3D0()
{
  return swift_beginAccess();
}

uint64_t sub_3F3EC()
{
  return v0;
}

uint64_t sub_3F404@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 - 256);
}

uint64_t sub_3F418()
{
  return swift_task_dealloc();
}

uint64_t sub_3F440()
{
  return v0;
}

uint64_t sub_3F450()
{
  return v0;
}

uint64_t sub_3F460()
{
  return v0;
}

uint64_t sub_3F474()
{
  return v0;
}

uint64_t sub_3F488()
{
  sub_53F30(98);
  v1._countAndFlagsBits = 0xD00000000000001ALL;
  v1._object = (void *)0x8000000000058B60;
  sub_53E50(v1);
  if (qword_6B900 != -1) {
    swift_once();
  }
  type metadata accessor for EmergencyNLIntent();
  sub_432C8(&qword_6C0B0, 255, (void (*)(uint64_t))type metadata accessor for EmergencyNLIntent);
  sub_537F0();
  sub_2E18(&qword_6DD90);
  v2._countAndFlagsBits = sub_53ED0();
  sub_434FC(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 0x61757469532D200ALL;
  v3._object = (void *)0xEE00203A6E6F6974;
  sub_53E50(v3);
  if (qword_6B908 != -1) {
    swift_once();
  }
  sub_43314();
  sub_2E18(&qword_6CC58);
  v4._countAndFlagsBits = sub_53ED0();
  sub_434FC(v4);
  swift_bridgeObjectRelease();
  sub_43450((uint64_t)"\n -Confirmation: ");
  if (qword_6B910 != -1) {
    swift_once();
  }
  sub_43314();
  sub_2E18(&qword_6DD98);
  v5._countAndFlagsBits = sub_53ED0();
  sub_434FC(v5);
  swift_bridgeObjectRelease();
  sub_43450((uint64_t)"\n -Organization: ");
  if (qword_6B918 != -1) {
    swift_once();
  }
  sub_43314();
  sub_2E18(&qword_6CC60);
  v6._countAndFlagsBits = sub_53ED0();
  sub_434FC(v6);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 0x69727474412D200ALL;
  v7._object = (void *)0xEE00203A65747562;
  sub_53E50(v7);
  if (qword_6B920 != -1) {
    swift_once();
  }
  sub_43314();
  sub_2E18(&qword_6DDA0);
  v8._countAndFlagsBits = sub_53ED0();
  sub_53E50(v8);
  swift_bridgeObjectRelease();
  return 0;
}

void sub_3F79C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  sub_15308();
  a19 = v22;
  a20 = v23;
  uint64_t v177 = v20;
  sub_434DC();
  uint64_t v183 = sub_535F0();
  sub_9120();
  uint64_t v185 = v24;
  __chkstk_darwin(v25);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v26);
  sub_FF3C();
  sub_FDEC();
  uint64_t v28 = __chkstk_darwin(v27);
  sub_433F4(v28, v29, v30, v31, v32, v33, v34, v35, v164[0]);
  uint64_t v36 = type metadata accessor for EmergencyNLIntent();
  uint64_t v37 = sub_FEC4(v36);
  __chkstk_darwin(v37);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v38);
  sub_FE14((uint64_t)v164 - v39);
  uint64_t v182 = sub_53920();
  sub_9120();
  uint64_t v181 = v40;
  __chkstk_darwin(v41);
  sub_6150();
  sub_FE14(v42);
  uint64_t v43 = sub_53670();
  uint64_t v44 = sub_FEC4(v43);
  __chkstk_darwin(v44);
  sub_6150();
  sub_FE14(v45);
  uint64_t v46 = sub_53CD0();
  uint64_t v47 = sub_FEC4(v46);
  __chkstk_darwin(v47);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v48);
  sub_FE14((uint64_t)v164 - v49);
  uint64_t v170 = sub_53620();
  sub_9120();
  uint64_t v174 = v50;
  __chkstk_darwin(v51);
  sub_6150();
  sub_FE14(v52);
  sub_53600();
  sub_9120();
  uint64_t v186 = v54;
  uint64_t v187 = v53;
  __chkstk_darwin(v53);
  sub_6140();
  uint64_t v57 = v56 - v55;
  uint64_t v58 = sub_535B0();
  sub_9120();
  uint64_t v60 = v59;
  __chkstk_darwin(v61);
  sub_6140();
  uint64_t v64 = v63 - v62;
  uint64_t v65 = sub_53DB0();
  sub_9120();
  uint64_t v67 = v66;
  __chkstk_darwin(v68);
  sub_612C();
  sub_FDEC();
  uint64_t v70 = __chkstk_darwin(v69);
  uint64_t v72 = (char *)v164 - v71;
  __chkstk_darwin(v70);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v73);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v74);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v75);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v76);
  sub_433E4();
  uint64_t v77 = sub_53D90();
  sub_6108();
  uint64_t v190 = v77;
  uint64_t v191 = v67;
  uint64_t v188 = *(void (**)(void))(v67 + 16);
  uint64_t v189 = (uint8_t *)(v67 + 16);
  ((void (*)(uint64_t, uint64_t, uint64_t))v188)(v21, v77, v65);
  uint64_t v180 = v20;
  sub_FE98();
  v78();
  __int16 v79 = sub_53DA0();
  os_log_type_t v80 = sub_53E90();
  if (os_log_type_enabled(v79, v80))
  {
    uint64_t v167 = v72;
    uint64_t v81 = sub_1001C();
    uint64_t v175 = v65;
    os_log_type_t v82 = (uint8_t *)v81;
    uint64_t v83 = sub_15284();
    uint64_t v165 = v57;
    v192[0] = v83;
    *(_DWORD *)os_log_type_t v82 = 136315138;
    v164[1] = (uint64_t)(v82 + 4);
    sub_432C8(&qword_6C3D8, 255, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v84 = sub_53FD0();
    uint64_t v193 = sub_50F10(v84, v85, v192);
    uint64_t v72 = v167;
    sub_53EF0();
    swift_bridgeObjectRelease();
    sub_FF30();
    v86();
    _os_log_impl(&dword_0, v79, v80, "EmergencyWebsiteFlow onInput: %s", v82, 0xCu);
    swift_arrayDestroy();
    uint64_t v57 = v165;
    sub_60F0();
    uint64_t v65 = v175;
    sub_60F0();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v64, v58);
  }

  char v87 = *(void (**)(void))(v191 + 8);
  sub_6120();
  v87();
  sub_535A0();
  int v88 = (*(uint64_t (**)(uint64_t, void (*)(void)))(v186 + 88))(v57, v187);
  uint64_t v89 = v183;
  uint64_t v91 = v184;
  uint64_t v90 = v185;
  if (v88 == enum case for Parse.NLv3IntentOnly(_:))
  {
    uint64_t v92 = sub_43334();
    v93(v92);
    sub_252CC();
    v94();
    sub_6108();
    sub_4349C((uint64_t)&a11);
    unint64_t v95 = v188;
    sub_4340C();
    v95();
    uint64_t v96 = (void *)sub_53DA0();
    os_log_type_t v97 = sub_53E90();
    if (sub_FF7C(v97))
    {
      os_log_type_t v98 = (_WORD *)sub_61F0();
      sub_61CC(v98);
      sub_FED0(&dword_0, v99, v100, "EmergencyWebsiteFlow onInput .NLv3IntentOnly");
      sub_60F0();
    }

    sub_43474();
    uint64_t v187 = v87;
    sub_6120();
    v87();
    sub_25324();
    uint64_t v101 = v179;
    sub_FE98();
    v102();
    sub_431A8(v101, v178);
    sub_42CA0();
    unsigned int v104 = v103;
    sub_43204(v101, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    sub_251C8();
    v105();
    goto LABEL_18;
  }
  if (v88 == enum case for Parse.directInvocation(_:))
  {
    uint64_t v106 = sub_43334();
    v107(v106);
    sub_252CC();
    v108();
    sub_6108();
    uint64_t v109 = v172;
    sub_FE98();
    v110();
    uint64_t v111 = (void *)sub_53DA0();
    os_log_type_t v112 = sub_53E90();
    if (sub_FF7C(v112))
    {
      uint64_t v113 = (_WORD *)sub_61F0();
      sub_61CC(v113);
      sub_FED0(&dword_0, v114, v115, "EmergencyWebsiteFlow onInput .directInvocation");
      sub_60F0();
    }

    uint64_t v116 = v191 + 8;
    ((void (*)(uint64_t, uint64_t))v87)(v109, v65);
    if (sub_535D0() == 0xD000000000000035 && v117 == 0x8000000000057B10)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v139 = sub_53FE0();
      swift_bridgeObjectRelease();
      if ((v139 & 1) == 0) {
        goto LABEL_25;
      }
    }
    char v140 = sub_2C188();
    if (v140 != 35)
    {
      LOBYTE(v131) = v140;
      sub_FF30();
      v160();
      __int16 v130 = 1;
      LOWORD(v132) = 4;
LABEL_30:
      __int16 v161 = v130 | ((_WORD)v132 << 8);
      uint64_t v162 = v177;
      *(unsigned char *)(v177 + 18) = v131;
      *(_WORD *)(v162 + 16) = v161;
      goto LABEL_34;
    }
LABEL_25:
    uint64_t v191 = v116;
    sub_6108();
    os_log_type_t v141 = v176;
    sub_43514();
    sub_FE98();
    v142();
    char v143 = *(void (**)(uint64_t, uint64_t, uint64_t))(v90 + 16);
    uint64_t v144 = v171;
    v143(v171, v91, v89);
    uint64_t v145 = sub_53DA0();
    os_log_type_t v146 = sub_53EA0();
    if (sub_FF7C(v146))
    {
      uint64_t v147 = (uint8_t *)sub_1001C();
      uint64_t v148 = sub_15284();
      uint64_t v175 = v65;
      uint64_t v190 = v148;
      uint64_t v194 = v148;
      uint64_t v149 = v89;
      *(_DWORD *)uint64_t v147 = 136315138;
      uint64_t v189 = v147 + 4;
      v143(v166, v144, v89);
      uint64_t v150 = sub_53E10();
      v192[5] = sub_50F10(v150, v151, &v194);
      sub_53EF0();
      swift_bridgeObjectRelease();
      uint64_t v152 = *(void (**)(uint64_t, uint64_t))(v185 + 8);
      v152(v144, v149);
      _os_log_impl(&dword_0, v145, v141, "Failed to get emergencySituation from DirectInvocation: %s", v147, 0xCu);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();

      sub_6120();
      v87();
      v152(v184, v149);
    }
    else
    {

      uint64_t v163 = *(void (**)(void))(v90 + 8);
      sub_FF30();
      v163();
      sub_6120();
      v87();
      sub_FF30();
      v163();
    }
    goto LABEL_34;
  }
  if (v88 != enum case for Parse.uso(_:))
  {
    sub_6108();
    sub_FE98();
    v153();
    uint64_t v154 = sub_53DA0();
    os_log_type_t v155 = sub_53EA0();
    if (os_log_type_enabled(v154, v155))
    {
      unint64_t v156 = (uint8_t *)sub_1001C();
      uint64_t v157 = sub_15284();
      uint64_t v175 = v65;
      uint64_t v193 = v157;
      *(_DWORD *)unint64_t v156 = 136315138;
      LOBYTE(v194) = 0;
      uint64_t v167 = v72;
      uint64_t v158 = sub_53E10();
      uint64_t v194 = sub_50F10(v158, v159, &v193);
      sub_53EF0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v154, v155, "%s", v156, 0xCu);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();
    }
    else
    {

      sub_43488();
    }
    sub_6120();
    v87();
    (*(void (**)(uint64_t, void (*)(void)))(v186 + 8))(v57, v187);
    goto LABEL_34;
  }
  uint64_t v118 = sub_43334();
  v119(v118);
  uint64_t v120 = v170;
  sub_252CC();
  v121();
  sub_6108();
  unint64_t v95 = v188;
  sub_4340C();
  v95();
  uint64_t v122 = (void *)sub_53DA0();
  os_log_type_t v123 = sub_53E90();
  if (sub_FF7C(v123))
  {
    uint64_t v124 = (_WORD *)sub_61F0();
    sub_61CC(v124);
    sub_FED0(&dword_0, v125, v126, "EmergencyWebsiteFlow onInput .uso");
    sub_60F0();
  }

  sub_43488();
  uint64_t v187 = v87;
  sub_6120();
  v87();
  uint64_t v127 = v173;
  sub_53610();
  v192[3] = (uint64_t)&type metadata for EmergencyFeatureFlagsKey;
  v192[4] = sub_F998();
  LOBYTE(v192[0]) = 2;
  sub_53640();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v192);
  uint64_t v128 = v169;
  sub_53CC0();
  sub_431A8(v128, v168);
  sub_4298C();
  unsigned int v104 = v129;
  sub_43204(v128, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
  (*(void (**)(uint64_t, uint64_t))(v174 + 8))(v127, v120);
LABEL_18:
  __int16 v130 = v104 & 1;
  unsigned int v131 = HIWORD(v104);
  unsigned int v132 = v104 >> 8;
  if (BYTE1(v104) != 4 || BYTE2(v104) != 35) {
    goto LABEL_30;
  }
  sub_6108();
  sub_4349C((uint64_t)&v195);
  sub_4340C();
  v95();
  __int16 v133 = (void *)sub_53DA0();
  os_log_type_t v134 = sub_53E90();
  if (sub_FF7C(v134))
  {
    unsigned int v135 = (_WORD *)sub_61F0();
    sub_61CC(v135);
    sub_FED0(&dword_0, v136, v137, "#EmergencyWebsiteFlow Produced an empty intent. Ignoring input.");
    sub_60F0();
  }

  sub_43474();
  sub_6120();
  v138();
LABEL_34:
  sub_9638();
}

uint64_t sub_405D0()
{
  sub_10010();
  v1[123] = v0;
  v1[122] = v2;
  uint64_t v3 = sub_53B90();
  v1[124] = v3;
  sub_FEC4(v3);
  v1[125] = swift_task_alloc();
  uint64_t v4 = sub_2E18((uint64_t *)&unk_6DA80);
  sub_FEC4(v4);
  v1[126] = swift_task_alloc();
  uint64_t v5 = sub_53030();
  v1[127] = v5;
  sub_FDFC(v5);
  unsigned char v1[128] = v6;
  v1[129] = swift_task_alloc();
  v1[130] = swift_task_alloc();
  uint64_t v7 = sub_53DB0();
  v1[131] = v7;
  sub_FDFC(v7);
  v1[132] = v8;
  v1[133] = swift_task_alloc();
  v1[134] = swift_task_alloc();
  v1[135] = swift_task_alloc();
  return _swift_task_switch(sub_40728, 0, 0);
}

uint64_t sub_40728()
{
  uint64_t v45 = v0;
  uint64_t v1 = *(void *)(v0 + 1080);
  uint64_t v2 = *(void *)(v0 + 1056);
  uint64_t v3 = *(void *)(v0 + 1048);
  uint64_t v4 = sub_53D90();
  *(void *)(v0 + 1088) = v4;
  sub_6108();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  *(void *)(v0 + 1096) = v5;
  *(void *)(v0 + 1104) = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  uint64_t v43 = v5;
  v5(v1, v4, v3);
  swift_retain_n();
  uint64_t v6 = sub_53DA0();
  os_log_type_t v7 = sub_53E90();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v41 = *(void *)(v0 + 1056);
    uint64_t v42 = v4;
    uint64_t v8 = *(void *)(v0 + 984);
    uint64_t v9 = (uint8_t *)sub_1001C();
    uint64_t v44 = sub_15284();
    *(_DWORD *)uint64_t v9 = 136315138;
    char v10 = *(unsigned char *)(v8 + 18);
    *(_WORD *)(v0 + 1132) = *(_WORD *)(v8 + 16);
    *(unsigned char *)(v0 + 1134) = v10;
    uint64_t v11 = sub_53E10();
    *(void *)(v0 + 968) = sub_50F10(v11, v12, &v44);
    sub_53EF0();
    uint64_t v4 = v42;
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v6, v7, "EmergencyWebsiteFlow execute with state: %s", v9, 0xCu);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();

    unint64_t v13 = *(void (**)(void))(v41 + 8);
    sub_6120();
    v13();
  }
  else
  {
    uint64_t v14 = *(void *)(v0 + 1080);
    uint64_t v15 = *(void *)(v0 + 1056);
    uint64_t v16 = *(void *)(v0 + 1048);

    swift_release_n();
    unint64_t v13 = *(void (**)(void))(v15 + 8);
    ((void (*)(uint64_t, uint64_t))v13)(v14, v16);
  }
  *(void *)(v0 + 1112) = v13;
  uint64_t v17 = *(void *)(v0 + 984);
  int v18 = *(unsigned __int8 *)(v17 + 18);
  int v19 = *(unsigned __int16 *)(v17 + 16);
  int v20 = v19 | (v18 << 16);
  *(unsigned char *)(v0 + 1130) = v18;
  *(_WORD *)(v0 + 1128) = v19;
  if (v19 == 2)
  {
    uint64_t v21 = *(void *)(v0 + 976);
    sub_F824();
    uint64_t v22 = swift_allocError();
    *uint64_t v23 = 2;
    sub_2940(v22, v17 + 64, (void *)(v17 + 104), v21);
    swift_errorRelease();
LABEL_8:
    sub_4334C();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_43434();
    __asm { BRAA            X1, X16 }
  }
  if (v19 == 3)
  {
    sub_53460();
    goto LABEL_8;
  }
  uint64_t v26 = *(void *)(v0 + 1072);
  uint64_t v27 = *(void *)(v0 + 1048);
  sub_6108();
  v43(v26, v4, v27);
  uint64_t v28 = sub_53DA0();
  os_log_type_t v29 = sub_53E90();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)sub_1001C();
    uint64_t v31 = sub_15284();
    *(_DWORD *)uint64_t v30 = 136315138;
    uint64_t v44 = v31;
    *(unsigned char *)(v0 + 1135) = v20 & 1;
    *(unsigned char *)(v0 + 1136) = BYTE1(v20);
    *(unsigned char *)(v0 + 1137) = BYTE2(v20);
    uint64_t v32 = sub_53E10();
    *(void *)(v0 + 960) = sub_50F10(v32, v33, &v44);
    sub_53EF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v28, v29, "EmergencyWebsiteFlow needsExecution intent: %s", v30, 0xCu);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();
  }

  sub_6120();
  v13();
  uint64_t v34 = (void *)swift_task_alloc();
  *(void *)(v0 + 1120) = v34;
  void *v34 = v0;
  v34[1] = sub_40C2C;
  sub_43434();
  return sub_167DC(v35, v36, v37, v38);
}

uint64_t sub_40C2C()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  uint64_t v3 = sub_43514();
  sub_F214(v3, v4);
  return _swift_task_switch(sub_40D08, 0, 0);
}

void sub_40D08()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 1130);
  if (v1 == 35)
  {
    if (HIBYTE(*(_WORD *)(v0 + 1128)) == 4)
    {
      sub_F724((uint64_t *)(v0 + 272));
LABEL_10:
      uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1096);
      uint64_t v10 = *(void *)(v0 + 1088);
      uint64_t v11 = *(void *)(v0 + 1064);
      uint64_t v12 = *(void *)(v0 + 1048);
      sub_6108();
      v9(v11, v10, v12);
      unint64_t v13 = (void *)sub_53DA0();
      os_log_type_t v14 = sub_53EA0();
      if (sub_1B708(v14))
      {
        uint64_t v15 = (_WORD *)sub_61F0();
        sub_25330(v15);
        sub_25160(&dword_0, v16, v17, "EmergencyWebsiteFlow Failed to pick a catWrapper");
        sub_60F0();
      }
      int v18 = *(void (**)(void))(v0 + 1112);
      uint64_t v19 = *(void *)(v0 + 984);

      sub_6120();
      v18();
      int v20 = sub_2C00((void *)(v19 + 104), *(void *)(v19 + 128));
      memcpy((void *)(v0 + 656), v20, 0x70uLL);
      uint64_t v21 = sub_43514();
      sub_2C44(v21, v22);
      sub_53450();
      swift_release();
LABEL_19:
      sub_4334C();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      sub_43434();
      __asm { BRAA            X1, X16 }
    }
    uint64_t v1 = (*(unsigned __int16 *)(v0 + 1128) | (*(unsigned __int8 *)(v0 + 1130) << 16)) >> 8;
  }
  sub_9370();
  if (!*(void *)(v0 + 872))
  {
    sub_F724((uint64_t *)(v0 + 272));
    sub_5884(v0 + 848, &qword_6CB20);
    goto LABEL_10;
  }
  uint64_t v2 = (void *)(v0 + 768);
  uint64_t v3 = *(void **)(v0 + 984);
  sub_5F28((long long *)(v0 + 848), v0 + 768);
  uint64_t v4 = v3[11];
  uint64_t v5 = v3[12];
  sub_2C00(v3 + 8, v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  sub_2C00((void *)(v0 + 808), *(void *)(v0 + 832));
  char v6 = sub_53360();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 808);
  if (v6)
  {
    sub_F214(v0 + 272, v0 + 144);
    int v7 = sub_F27C(v0 + 144);
    uint64_t v8 = *(void *)(v0 + 1008);
    if (v7 == 1)
    {
      sub_34DC(*(void *)(v0 + 1008), 1, 1, *(void *)(v0 + 1016));
    }
    else
    {
      uint64_t v35 = *(void *)(v0 + 1016);
      memcpy((void *)(v0 + 16), (const void *)(v0 + 144), 0x80uLL);
      sub_F214(v0 + 528, v0 + 400);
      sub_5D2C(v0 + 400);
      sub_53C40();
      sub_F724((uint64_t *)(v0 + 272));
      sub_434B0(v8, 1, v35);
      if (!v23)
      {
        uint64_t v26 = *(void *)(v0 + 1024);
        uint64_t v27 = *(void *)(v0 + 1016);
        uint64_t v28 = *(void *)(v0 + 1000);
        uint64_t v34 = *(void *)(v0 + 1040);
        sub_F724((uint64_t *)(v0 + 272));
        sub_252CC();
        v29();
        uint64_t v30 = v3[11];
        uint64_t v31 = v3[12];
        sub_2C00(v3 + 8, v30);
        (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v31 + 16))(v36, v30, v31);
        sub_433D8();
        sub_FE98();
        v32();
        sub_53B80();
        sub_432C8(&qword_6CB30, 255, (void (*)(uint64_t))&type metadata accessor for AppPunchOutFlow);
        sub_53440();
        sub_43204(v28, (void (*)(void))&type metadata accessor for AppPunchOutFlow);
        (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v34, v27);
        uint64_t v33 = v0 + 768;
LABEL_18:
        _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v33);
        goto LABEL_19;
      }
      uint64_t v2 = (void *)(v0 + 768);
    }
    sub_5884(*(void *)(v0 + 1008), (uint64_t *)&unk_6DA80);
  }
  sub_2C00((void *)(*(void *)(v0 + 984) + 184), *(void *)(*(void *)(v0 + 984) + 208));
  sub_26450(v1, v0 + 272, v2);
  sub_F724((uint64_t *)(v0 + 272));
  sub_53450();
  swift_release();
  uint64_t v33 = (uint64_t)v2;
  goto LABEL_18;
}

uint64_t sub_411B0()
{
  type metadata accessor for EmergencyWebsiteFlow();
  sub_432C8(&qword_6DD88, v0, (void (*)(uint64_t))type metadata accessor for EmergencyWebsiteFlow);
  return sub_531E0();
}

uint64_t type metadata accessor for EmergencyWebsiteFlow()
{
  return self;
}

ValueMetadata *type metadata accessor for EmergencyWebsiteFlow.EmergencyWebsiteFlowState()
{
  return &type metadata for EmergencyWebsiteFlow.EmergencyWebsiteFlowState;
}

#error "41284: call analysis failed (funcsize=10)"

uint64_t sub_41298()
{
  return sub_411B0();
}

uint64_t sub_412BC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_DD40;
  return sub_405D0();
}

uint64_t sub_41358()
{
  type metadata accessor for EmergencyWebsiteFlow();

  return sub_53230();
}

void sub_41390()
{
  sub_15308();
  uint64_t v2 = v1;
  sub_53DB0();
  sub_9120();
  __chkstk_darwin(v3);
  sub_25278();
  __chkstk_darwin(v4);
  sub_434C8();
  __chkstk_darwin(v5);
  if ((sub_53C60() & 1) == 0)
  {
    sub_53D90();
    sub_6108();
    sub_25324();
    sub_FE98();
    v8();
    uint64_t v9 = sub_53DA0();
    os_log_type_t v10 = sub_53E90();
    if (sub_1B708(v10))
    {
      uint64_t v11 = (_WORD *)sub_61F0();
      sub_25330(v11);
      sub_25160(&dword_0, v12, v13, "orgInfo does not have name and number. Not prompting for call followup.");
      sub_60F0();
    }
    goto LABEL_10;
  }
  if ((sub_43838(v2) & 1) == 0)
  {
    sub_53D90();
    sub_6108();
    sub_25324();
    sub_FE98();
    v14();
    uint64_t v9 = sub_53DA0();
    os_log_type_t v15 = sub_53E90();
    if (sub_1B708(v15))
    {
      uint64_t v16 = (uint8_t *)sub_61F0();
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_0, v9, v0, "No prompt needed for this device. Not prompting for call followup.", v16, 2u);
      sub_60F0();
    }
LABEL_10:

    sub_251C8();
    v17();
    goto LABEL_21;
  }
  sub_2C00(v2, v2[3]);
  char v6 = sub_533A0();
  sub_3048((uint64_t)v2, (uint64_t)v29);
  if (v6)
  {
    char v7 = 1;
  }
  else
  {
    sub_2C00(v29, v29[3]);
    char v7 = sub_53390();
  }
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v29);
  sub_53D90();
  sub_6108();
  sub_25324();
  sub_FE98();
  v18();
  uint64_t v19 = sub_53DA0();
  os_log_type_t v20 = sub_53E90();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)sub_1001C();
    uint64_t v27 = sub_15284();
    *(_DWORD *)uint64_t v21 = 136315138;
    uint64_t v28 = v27;
    if (v7) {
      uint64_t v22 = 0x6E6974706D6F7250;
    }
    else {
      uint64_t v22 = 0x6D6F727020746F4ELL;
    }
    if (v7) {
      unint64_t v23 = 0xE900000000000067;
    }
    else {
      unint64_t v23 = 0xED0000676E697470;
    }
    uint64_t v24 = sub_50F10(v22, v23, &v28);
    sub_434E8(v24);
    sub_53EF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v19, v20, "%s for call followup.", v21, 0xCu);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();
  }

  uint64_t v25 = sub_43540();
  v26(v25);
LABEL_21:
  sub_9638();
}

uint64_t sub_4171C(uint64_t a1, uint8_t *a2)
{
  sub_53DB0();
  sub_9120();
  __chkstk_darwin(v4);
  sub_25278();
  uint64_t v6 = __chkstk_darwin(v5);
  __chkstk_darwin(v6);
  sub_433E4();
  uint64_t v7 = *(void *)(a1 + 104);
  if ((v7 & 0x2000000000000000) == 0)
  {
    if ((*(void *)(a1 + 96) & 0xFFFFFFFFFFFFLL) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    sub_53D90();
    sub_6108();
    sub_FE98();
    v9();
    os_log_type_t v10 = sub_53DA0();
    os_log_type_t v11 = sub_53E90();
    if (!sub_1B708(v11))
    {
      uint64_t v15 = 0;
      goto LABEL_16;
    }
    uint64_t v12 = (_WORD *)sub_61F0();
    sub_25330(v12);
    sub_25160(&dword_0, v13, v14, "orgInfo does not have a websearch query. Not prompting for websearch followup.");
    uint64_t v15 = 0;
    goto LABEL_13;
  }
  if ((v7 & 0xF00000000000000) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  sub_433B4(a2);
  char v8 = sub_533A0();
  sub_3048((uint64_t)a2, (uint64_t)v33);
  if (v8)
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v33);
    sub_3048((uint64_t)a2, (uint64_t)v32);
LABEL_9:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v32);
    sub_3048((uint64_t)a2, (uint64_t)v30);
LABEL_10:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v30);
    goto LABEL_11;
  }
  sub_433B4(v33);
  char v16 = sub_53390();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v33);
  sub_3048((uint64_t)a2, (uint64_t)v32);
  if (v16) {
    goto LABEL_9;
  }
  sub_433B4(v32);
  char v23 = sub_53370();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v32);
  sub_3048((uint64_t)a2, (uint64_t)v30);
  if (v23) {
    goto LABEL_10;
  }
  a2 = v31;
  sub_2C00(v30, (uint64_t)v31);
  char v24 = sub_53380();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v30);
  if ((v24 & 1) == 0)
  {
    sub_53D90();
    sub_6108();
    sub_FE98();
    v25();
    os_log_type_t v10 = sub_53DA0();
    os_log_type_t v26 = sub_53E90();
    if (!sub_1B708(v26))
    {
      uint64_t v15 = 1;
      goto LABEL_16;
    }
    uint64_t v27 = (_WORD *)sub_61F0();
    sub_25330(v27);
    sub_25160(&dword_0, v28, v29, "Prompting for websearch followup.");
    uint64_t v15 = 1;
    goto LABEL_13;
  }
LABEL_11:
  sub_53D90();
  sub_6108();
  sub_FE98();
  v17();
  os_log_type_t v10 = sub_53DA0();
  os_log_type_t v18 = sub_53E90();
  if (!os_log_type_enabled(v10, v18))
  {
    uint64_t v15 = 0;
    goto LABEL_16;
  }
  uint64_t v19 = (_WORD *)sub_61F0();
  sub_25330(v19);
  _os_log_impl(&dword_0, v10, v18, "No prompt needed for this device. Not prompting for websearch followup.", a2, 2u);
  uint64_t v15 = 0;
LABEL_13:
  sub_60F0();
LABEL_16:

  uint64_t v20 = sub_43540();
  v21(v20);
  return v15;
}

void sub_41A78()
{
  sub_15308();
  uint64_t v59 = v1;
  uint64_t v63 = v2;
  sub_53DB0();
  sub_9120();
  uint64_t v64 = v4;
  uint64_t v65 = v3;
  __chkstk_darwin(v3);
  sub_612C();
  uint64_t v60 = v5;
  sub_15258();
  __chkstk_darwin(v6);
  sub_FF3C();
  uint64_t v62 = v7;
  sub_15258();
  __chkstk_darwin(v8);
  uint64_t v61 = (char *)&v59 - v9;
  uint64_t v10 = sub_539B0();
  sub_9120();
  uint64_t v12 = v11;
  __chkstk_darwin(v13);
  sub_1B7C4();
  uint64_t v14 = sub_2E18(&qword_6DA68);
  sub_6188();
  __chkstk_darwin(v15);
  sub_6140();
  uint64_t v18 = v17 - v16;
  uint64_t v19 = sub_2E18(&qword_6DA70);
  uint64_t v20 = sub_FEC4(v19);
  __chkstk_darwin(v20);
  sub_25278();
  uint64_t v23 = v21 - v22;
  uint64_t v25 = __chkstk_darwin(v24);
  uint64_t v27 = (char *)&v59 - v26;
  __chkstk_darwin(v25);
  sub_433E4();
  sub_53950();
  if (sub_53940())
  {
    sub_53930();
    swift_release();
    sub_53BE0();
    swift_release();
    uint64_t v28 = 0;
  }
  else
  {
    uint64_t v28 = 1;
  }
  sub_34DC(v0, v28, 1, v10);
  sub_539A0();
  sub_34DC((uint64_t)v27, 0, 1, v10);
  uint64_t v29 = v18 + *(int *)(v14 + 48);
  sub_383BC(v0, v18);
  sub_383BC((uint64_t)v27, v29);
  sub_434B0(v18, 1, v10);
  if (v32)
  {
    sub_5884((uint64_t)v27, &qword_6DA70);
    sub_5884(v0, &qword_6DA70);
    sub_434B0(v29, 1, v10);
    if (v32)
    {
      sub_5884(v18, &qword_6DA70);
      uint64_t v31 = v64;
      uint64_t v30 = v65;
      goto LABEL_19;
    }
    goto LABEL_12;
  }
  sub_383BC(v18, v23);
  sub_434B0(v29, 1, v10);
  if (v32)
  {
    sub_5884((uint64_t)v27, &qword_6DA70);
    sub_5884(v0, &qword_6DA70);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v23, v10);
LABEL_12:
    sub_5884(v18, &qword_6DA68);
    uint64_t v31 = v64;
    uint64_t v30 = v65;
    goto LABEL_13;
  }
  sub_252CC();
  v44();
  sub_432C8(&qword_6DA78, 255, (void (*)(uint64_t))&type metadata accessor for ResponseMode);
  char v45 = sub_53DE0();
  uint64_t v46 = *(void (**)(void))(v12 + 8);
  sub_FF30();
  v46();
  sub_5884((uint64_t)v27, &qword_6DA70);
  sub_5884(v0, &qword_6DA70);
  sub_FF30();
  v46();
  sub_5884(v18, &qword_6DA70);
  uint64_t v31 = v64;
  uint64_t v30 = v65;
  if (v45)
  {
LABEL_19:
    sub_53D90();
    sub_6108();
    uint64_t v36 = v61;
    sub_FE98();
    v47();
    char v38 = (void *)sub_53DA0();
    os_log_type_t v48 = sub_53E90();
    if (sub_FF7C(v48))
    {
      uint64_t v49 = (_WORD *)sub_61F0();
      sub_61CC(v49);
      uint64_t v43 = "DisplayOnly request. Not listening after speaking.";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
LABEL_13:
  if ((sub_53C60() & 1) == 0)
  {
    sub_53D90();
    sub_6108();
    uint64_t v36 = v60;
    sub_FE98();
    v37();
    char v38 = (void *)sub_53DA0();
    os_log_type_t v39 = sub_53E90();
    if (sub_FF7C(v39))
    {
      uint64_t v40 = (_WORD *)sub_61F0();
      sub_61CC(v40);
      uint64_t v43 = "orgInfo does not have name and number. Not listening after speaking.";
LABEL_21:
      sub_FED0(&dword_0, v41, v42, v43);
      sub_60F0();
    }
LABEL_22:

    (*(void (**)(char *, uint64_t))(v31 + 8))(v36, v30);
    goto LABEL_33;
  }
  uint64_t v33 = v59;
  sub_2C00(v59, v59[3]);
  char v34 = sub_533A0();
  sub_3048((uint64_t)v33, (uint64_t)v67);
  if (v34)
  {
    char v35 = 1;
  }
  else
  {
    sub_2C00(v67, v67[3]);
    char v35 = sub_53390();
  }
  uint64_t v50 = v62;
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v67);
  sub_53D90();
  sub_6108();
  sub_FE98();
  v51();
  uint64_t v52 = sub_53DA0();
  os_log_type_t v53 = sub_53E90();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = (uint8_t *)sub_1001C();
    uint64_t v55 = sub_15284();
    *(_DWORD *)uint64_t v54 = 136315138;
    uint64_t v66 = v55;
    if (v35) {
      uint64_t v56 = 0x73696C206C6C6957;
    }
    else {
      uint64_t v56 = 0x746F6E206C6C6957;
    }
    if (v35) {
      unint64_t v57 = 0xEB000000006E6574;
    }
    else {
      unint64_t v57 = 0xEF6E657473696C20;
    }
    uint64_t v58 = sub_50F10(v56, v57, &v66);
    sub_434E8(v58);
    sub_53EF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v52, v53, "%s after speaking the call followup.", v54, 0xCu);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();

    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v62, v30);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v50, v30);
  }
LABEL_33:
  sub_9638();
}

void sub_42124()
{
  sub_15308();
  uint64_t v70 = v3;
  uint64_t v72 = v4;
  uint64_t v5 = sub_53DB0();
  sub_9120();
  uint64_t v73 = v6;
  __chkstk_darwin(v7);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v8);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v9);
  sub_FF3C();
  uint64_t v71 = v10;
  sub_15258();
  uint64_t v12 = __chkstk_darwin(v11);
  sub_433F4(v12, v13, v14, v15, v16, v17, v18, v19, v69[0]);
  uint64_t v20 = sub_539B0();
  sub_9120();
  uint64_t v22 = v21;
  __chkstk_darwin(v23);
  sub_38808();
  uint64_t v24 = sub_2E18(&qword_6DA68);
  sub_6188();
  __chkstk_darwin(v25);
  sub_1B7C4();
  uint64_t v26 = sub_2E18(&qword_6DA70);
  uint64_t v27 = sub_FEC4(v26);
  __chkstk_darwin(v27);
  sub_43398();
  __chkstk_darwin(v28);
  sub_434C8();
  __chkstk_darwin(v29);
  uint64_t v31 = (char *)v69 - v30;
  sub_53950();
  uint64_t v32 = sub_53940();
  uint64_t v74 = v5;
  if (v32)
  {
    sub_53930();
    swift_release();
    sub_53BE0();
    swift_release();
    uint64_t v33 = 0;
  }
  else
  {
    uint64_t v33 = 1;
  }
  sub_34DC((uint64_t)v31, v33, 1, v20);
  sub_539A0();
  sub_34DC(v1, 0, 1, v20);
  uint64_t v34 = v2 + *(int *)(v24 + 48);
  sub_383BC((uint64_t)v31, v2);
  sub_383BC(v1, v34);
  sub_434B0(v2, 1, v20);
  if (v39)
  {
    uint64_t v35 = sub_43540();
    sub_5884(v35, v36);
    sub_5884((uint64_t)v31, &qword_6DA70);
    sub_434B0(v34, 1, v20);
    if (v39)
    {
      sub_5884(v2, &qword_6DA70);
      uint64_t v38 = v73;
      uint64_t v37 = v74;
      goto LABEL_20;
    }
    goto LABEL_12;
  }
  sub_383BC(v2, v0);
  sub_434B0(v34, 1, v20);
  if (v39)
  {
    sub_5884(v1, &qword_6DA70);
    sub_5884((uint64_t)v31, &qword_6DA70);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v0, v20);
LABEL_12:
    sub_5884(v2, &qword_6DA68);
    uint64_t v38 = v73;
    uint64_t v37 = v74;
    goto LABEL_13;
  }
  sub_252CC();
  v45();
  sub_432C8(&qword_6DA78, 255, (void (*)(uint64_t))&type metadata accessor for ResponseMode);
  char v46 = sub_53DE0();
  uint64_t v47 = *(void (**)(void))(v22 + 8);
  sub_251C8();
  v47();
  sub_5884(v1, &qword_6DA70);
  sub_5884((uint64_t)v31, &qword_6DA70);
  sub_251C8();
  v47();
  sub_5884(v2, &qword_6DA70);
  uint64_t v38 = v73;
  uint64_t v37 = v74;
  if (v46)
  {
LABEL_20:
    sub_53D90();
    sub_6108();
    sub_433D8();
    uint64_t v42 = v69[2];
    sub_FE98();
    v48();
    uint64_t v49 = (void *)sub_53DA0();
    os_log_type_t v50 = sub_53E90();
    if (sub_1B708(v50))
    {
      uint64_t v51 = (_WORD *)sub_61F0();
      sub_384C4(v51);
      uint64_t v54 = "DisplayOnly request. Not listening after speaking.";
LABEL_29:
      sub_384A4(&dword_0, v52, v53, v54);
LABEL_30:
      sub_60F0();
      goto LABEL_31;
    }
    goto LABEL_31;
  }
LABEL_13:
  unint64_t v40 = *(void *)(v72 + 104);
  if ((v40 & 0x2000000000000000) != 0) {
    uint64_t v41 = HIBYTE(v40) & 0xF;
  }
  else {
    uint64_t v41 = *(void *)(v72 + 96) & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v43 = v70;
  uint64_t v42 = v71;
  if (v41)
  {
    sub_2C00(v70, v70[3]);
    char v44 = sub_533A0();
    sub_3048((uint64_t)v43, (uint64_t)v77);
    if (v44)
    {
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v77);
      sub_3048((uint64_t)v43, (uint64_t)v76);
    }
    else
    {
      sub_2C00(v77, v77[3]);
      char v58 = sub_53390();
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v77);
      sub_3048((uint64_t)v43, (uint64_t)v76);
      if ((v58 & 1) == 0)
      {
        sub_2C00(v76, v76[3]);
        char v62 = sub_53370();
        _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v76);
        sub_3048((uint64_t)v43, (uint64_t)v75);
        if ((v62 & 1) == 0)
        {
          sub_2C00(v75, v75[3]);
          char v63 = sub_53380();
          _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v75);
          if ((v63 & 1) == 0)
          {
            sub_53D90();
            sub_6108();
            sub_433D8();
            uint64_t v42 = v69[0];
            sub_FE98();
            v64();
            uint64_t v49 = (void *)sub_53DA0();
            os_log_type_t v65 = sub_53E90();
            if (!sub_1B708(v65)) {
              goto LABEL_31;
            }
            uint64_t v66 = (_WORD *)sub_61F0();
            sub_384C4(v66);
            sub_384A4(&dword_0, v67, v68, "Will listen after speaking the websearch followup.");
            goto LABEL_30;
          }
LABEL_27:
          sub_53D90();
          sub_6108();
          sub_433D8();
          sub_FE98();
          v59();
          uint64_t v49 = (void *)sub_53DA0();
          os_log_type_t v60 = sub_53E90();
          if (sub_1B708(v60))
          {
            uint64_t v61 = (_WORD *)sub_61F0();
            sub_384C4(v61);
            uint64_t v54 = "No prompt needed for this device. Not listening after speaking.";
            goto LABEL_29;
          }
          goto LABEL_31;
        }
LABEL_26:
        _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v75);
        goto LABEL_27;
      }
    }
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v76);
    sub_3048((uint64_t)v43, (uint64_t)v75);
    goto LABEL_26;
  }
  sub_53D90();
  sub_6108();
  sub_433D8();
  uint64_t v42 = v69[1];
  sub_FE98();
  v55();
  uint64_t v49 = (void *)sub_53DA0();
  os_log_type_t v56 = sub_53E90();
  if (sub_1B708(v56))
  {
    unint64_t v57 = (_WORD *)sub_61F0();
    sub_384C4(v57);
    uint64_t v54 = "orgInfo does not have a websearch query. Not listening after speaking.";
    goto LABEL_29;
  }
LABEL_31:

  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v42, v37);
  sub_9638();
}

void sub_427F0()
{
  sub_15308();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = sub_2E18(&qword_6BCB8);
  uint64_t v6 = sub_FEC4(v5);
  __chkstk_darwin(v6);
  sub_38808();
  sub_F214(v4, (uint64_t)v13);
  if (sub_F27C((uint64_t)v13) == 1)
  {
    uint64_t v7 = v2[3];
    uint64_t v8 = v2[4];
    sub_2C00(v2, v7);
    sub_434DC();
    uint64_t v9 = sub_53AD0();
    uint64_t v10 = v0;
    uint64_t v11 = 1;
LABEL_6:
    sub_34DC(v10, v11, 1, v9);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(v0, v7, v8);
    sub_5884(v0, &qword_6BCB8);
    goto LABEL_7;
  }
  memcpy(v14, v13, sizeof(v14));
  char v12 = sub_53C60();
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  sub_2C00(v2, v7);
  if ((v12 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    sub_53AC0();
    uint64_t v9 = sub_53AD0();
    uint64_t v10 = v0;
    uint64_t v11 = 0;
    goto LABEL_6;
  }
  (*(void (**)(uint64_t, uint64_t))(v8 + 48))(v7, v8);
LABEL_7:
  sub_9638();
}

void sub_4298C()
{
  sub_15308();
  uint64_t v1 = v0;
  sub_53DB0();
  sub_9120();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_43398();
  __chkstk_darwin(v5);
  uint64_t v21 = sub_53CD0();
  uint64_t v25[3] = v21;
  v25[4] = (uint64_t)&protocol witness table for EmergencyDialogAct;
  uint64_t v20 = sub_5DC4(v25);
  sub_4325C(v1, (uint64_t)v20);
  sub_53D90();
  sub_6108();
  uint64_t v6 = *(void (**)(void))(v3 + 16);
  sub_4340C();
  v6();
  sub_3048((uint64_t)v25, (uint64_t)v24);
  uint64_t v7 = sub_53DA0();
  os_log_type_t v8 = sub_53E90();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (_DWORD *)sub_1001C();
    uint64_t v23 = sub_15284();
    *uint64_t v9 = 136315138;
    sub_3048((uint64_t)v24, (uint64_t)&v22);
    sub_2E18(&qword_6C3E0);
    uint64_t v10 = sub_53E10();
    uint64_t v22 = sub_50F10(v10, v11, &v23);
    sub_53EF0();
    swift_bridgeObjectRelease();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v24);
    sub_43520(&dword_0, v12, v13, "Converting EmergencyDialogAct to EmergencyInformationIntent: %s");
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();
  }
  else
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v24);
  }

  uint64_t v14 = *(void (**)(void))(v3 + 8);
  sub_6120();
  v14();
  if (*((unsigned char *)v20 + *(int *)(v21 + 32)) == 2)
  {
    sub_6108();
    sub_4340C();
    v6();
    uint64_t v15 = (void *)sub_53DA0();
    os_log_type_t v16 = sub_53E90();
    if (sub_1B708(v16))
    {
      uint64_t v17 = (_WORD *)sub_61F0();
      sub_384C4(v17);
      sub_384A4(&dword_0, v18, v19, "'emergencyAttribute' node was nil, using default value 'phone number'");
      sub_60F0();
    }

    sub_6120();
    v14();
  }
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v25);
  sub_9638();
}

void sub_42CA0()
{
  sub_15308();
  uint64_t v1 = v0;
  uint64_t v2 = sub_53DB0();
  sub_9120();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_612C();
  uint64_t v29 = v6;
  sub_15258();
  __chkstk_darwin(v7);
  v31[3] = type metadata accessor for EmergencyNLIntent();
  v31[4] = sub_432C8(&qword_6C3E8, 255, (void (*)(uint64_t))type metadata accessor for EmergencyNLIntent);
  os_log_type_t v8 = sub_5DC4(v31);
  sub_4325C(v1, (uint64_t)v8);
  uint64_t v9 = (uint8_t *)sub_53D90();
  sub_6108();
  sub_FE98();
  v10();
  sub_3048((uint64_t)v31, (uint64_t)v30);
  unint64_t v11 = sub_53DA0();
  os_log_type_t v12 = sub_53E90();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (_DWORD *)sub_1001C();
    sub_15284();
    *uint64_t v13 = 136315138;
    uint64_t v14 = sub_2C00(v30, v30[3]);
    __chkstk_darwin(v14);
    sub_6140();
    uint64_t v17 = v16 - v15;
    (*(void (**)(uint64_t))(v18 + 16))(v16 - v15);
    sub_3F488();
    sub_43204(v17, (void (*)(void))type metadata accessor for EmergencyNLIntent);
    uint64_t v19 = sub_43540();
    sub_50F10(v19, v20, v21);
    sub_53EF0();
    swift_bridgeObjectRelease();
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v30);
    sub_43520(&dword_0, v22, v23, "Converting EmergencyNLIntent: %s");
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();
  }
  else
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v30);
  }

  uint64_t v24 = *(void (**)(void))(v4 + 8);
  sub_6120();
  v24();
  sub_43378();
  if (qword_6B920 != -1) {
    swift_once();
  }
  sub_432C8(&qword_6C0B0, 255, (void (*)(uint64_t))type metadata accessor for EmergencyNLIntent);
  sub_537F0();
  if (LOBYTE(v30[0]) == 2)
  {
    sub_6108();
    sub_43514();
    sub_FE98();
    v25();
    uint64_t v26 = sub_53DA0();
    os_log_type_t v27 = sub_53E90();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (_WORD *)sub_61F0();
      sub_384C4(v28);
      _os_log_impl(&dword_0, v26, v27, "'emergencyAttribute' node was nil, using default value 'phone number'", v9, 2u);
      sub_60F0();
    }

    ((void (*)(uint64_t, uint64_t))v24)(v29, v2);
  }
  sub_43378();
  sub_43418();
  sub_43378();
  if (qword_6B918 != -1) {
    swift_once();
  }
  sub_43418();
  sub_43378();
  if (qword_6B908 != -1) {
    swift_once();
  }
  sub_43418();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v31);
  sub_9638();
}

uint64_t sub_431A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_434DC();
  v5(v4);
  sub_6188();
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(a2, v2);
  return a2;
}

uint64_t sub_43204(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_6188();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_4325C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_434DC();
  v5(v4);
  sub_6188();
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(a2, v2);
  return a2;
}

ValueMetadata *type metadata accessor for EmergencyWebsiteFlowFollowupConfigModel()
{
  return &type metadata for EmergencyWebsiteFlowFollowupConfigModel;
}

uint64_t sub_432C8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_43314()
{
  return sub_537F0();
}

uint64_t sub_43334()
{
  return v0;
}

uint64_t sub_4334C()
{
  return swift_task_dealloc();
}

void *sub_43378()
{
  return sub_2C00((void *)(v0 - 128), *(void *)(v0 - 104));
}

uint64_t sub_433B4(void *a1)
{
  sub_2C00(a1, v1);
  return v1;
}

uint64_t sub_433F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 256) = (char *)&a9 - v9;
  return 0;
}

uint64_t sub_43418()
{
  return sub_537F0();
}

void sub_43450(uint64_t a1@<X8>)
{
  v2._countAndFlagsBits = 0xD000000000000011;
  v2._object = (void *)((a1 - 32) | 0x8000000000000000);
  sub_53E50(v2);
}

uint64_t sub_43474()
{
  return v0;
}

uint64_t sub_43488()
{
  return v0;
}

uint64_t sub_4349C@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 - 256);
}

uint64_t sub_434B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_5800(a1, a2, a3);
}

uint64_t sub_434DC()
{
  return 0;
}

uint64_t sub_434E8(uint64_t a1)
{
  *(void *)(v1 - 136) = a1;
  return v1 - 136;
}

void sub_434FC(Swift::String a1)
{
  sub_53E50(a1);
}

uint64_t sub_43514()
{
  return v0;
}

void sub_43520(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

uint64_t sub_43540()
{
  return v0;
}

uint64_t type metadata accessor for EmergencyModernCATs()
{
  uint64_t result = qword_6DDA8;
  if (!qword_6DDA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_43594()
{
  return swift_initClassMetadata2();
}

uint64_t sub_435D4(uint64_t a1, uint64_t a2)
{
  return sub_43628(a1, a2);
}

uint64_t sub_43628(uint64_t a1, uint64_t a2)
{
  sub_53B30();
  sub_9AD8();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_6140();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v11 - 8);
  sub_6140();
  sub_9A10(a1, v13 - v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v10, a2, v2);
  uint64_t v14 = sub_53AE0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v2);
  sub_9A78(a1);
  return v14;
}

uint64_t sub_43754(uint64_t a1, uint64_t a2)
{
  sub_53B30();
  sub_9AD8();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_6140();
  uint64_t v9 = v8 - v7;
  swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v9, a2, v2);
  uint64_t v10 = sub_53AF0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v2);
  return v10;
}

uint64_t sub_43830()
{
  return type metadata accessor for EmergencyModernCATs();
}

uint64_t sub_43838(void *a1)
{
  sub_2C00(a1, a1[3]);
  char v2 = sub_53380();
  sub_3048((uint64_t)a1, (uint64_t)v5);
  if (v2)
  {
    char v3 = 0;
  }
  else
  {
    sub_2C00(v5, v5[3]);
    char v3 = sub_53310() ^ 1;
  }
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v5);
  return v3 & 1;
}

uint64_t type metadata accessor for CsamCATs()
{
  uint64_t result = qword_6DDF8;
  if (!qword_6DDF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_43918()
{
  return swift_initClassMetadata2();
}

uint64_t sub_43958()
{
  return sub_25728();
}

uint64_t sub_43978()
{
  return sub_25728();
}

uint64_t sub_43998(uint64_t a1)
{
  return sub_439F8(a1);
}

uint64_t sub_439B4()
{
  return sub_25728();
}

uint64_t sub_439D4(uint64_t a1)
{
  return sub_439F8(a1);
}

uint64_t sub_439F8(uint64_t a1)
{
  sub_2E18(&qword_6BF00);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_547B0;
  *(void *)(v2 + 32) = 0x6F69746175746973;
  *(void *)(v2 + 40) = 0xE90000000000006ELL;
  if (a1)
  {
    uint64_t v3 = type metadata accessor for CsamSituation();
    uint64_t v4 = a1;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
    *(void *)(v2 + 56) = 0;
    *(void *)(v2 + 64) = 0;
  }
  *(void *)(v2 + 48) = v4;
  *(void *)(v2 + 72) = v3;
  swift_retain();
  sub_53A60();

  return swift_bridgeObjectRelease();
}

uint64_t sub_43AD0(uint64_t a1, uint64_t a2)
{
  return sub_43B24(a1, a2);
}

uint64_t sub_43B24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_53B30();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v8 - 8);
  sub_9A10(a1, (uint64_t)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v10 = sub_53A50();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_9A78(a1);
  return v10;
}

uint64_t sub_43C8C()
{
  return type metadata accessor for CsamCATs();
}

uint64_t destroy for CallFlow(uint64_t a1)
{
  return sub_2D474(*(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(void *)(a1 + 160), *(void *)(a1 + 168), *(void *)(a1 + 176), *(void *)(a1 + 184), *(void *)(a1 + 192), *(void *)(a1 + 200), *(unsigned char *)(a1 + 208));
}

uint64_t initializeWithCopy for CallFlow(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, v2 + 40);
  uint64_t v6 = *(void *)(v2 + 80);
  uint64_t v7 = *(void *)(v2 + 88);
  uint64_t v8 = *(void *)(v2 + 96);
  uint64_t v9 = *(void *)(v2 + 104);
  uint64_t v10 = *(void *)(v2 + 112);
  uint64_t v11 = *(void *)(v2 + 120);
  uint64_t v12 = *(void *)(v2 + 128);
  uint64_t v13 = *(void *)(v2 + 136);
  uint64_t v15 = *(void *)(v2 + 144);
  uint64_t v16 = *(void *)(v2 + 152);
  uint64_t v17 = *(void *)(v2 + 160);
  uint64_t v18 = *(void *)(v2 + 168);
  uint64_t v19 = *(void *)(v2 + 176);
  uint64_t v20 = *(void *)(v2 + 184);
  uint64_t v21 = *(void *)(v2 + 192);
  uint64_t v22 = *(void *)(v2 + 200);
  LOBYTE(v2) = *(unsigned char *)(v2 + 208);
  sub_2D360(v6, v7, v8, v9, v10, v11, v12, v13, v15, v16, v17, v18, v19, v20, v21, v22, v2);
  *(void *)(a1 + 80) = v6;
  *(void *)(a1 + 88) = v7;
  *(void *)(a1 + 96) = v8;
  *(void *)(a1 + 104) = v9;
  *(void *)(a1 + 112) = v10;
  *(void *)(a1 + 120) = v11;
  *(void *)(a1 + 128) = v12;
  *(void *)(a1 + 136) = v13;
  *(void *)(a1 + 144) = v15;
  *(void *)(a1 + 152) = v16;
  *(void *)(a1 + 160) = v17;
  *(void *)(a1 + 168) = v18;
  *(void *)(a1 + 176) = v19;
  *(void *)(a1 + 184) = v20;
  *(void *)(a1 + 192) = v21;
  *(void *)(a1 + 200) = v22;
  *(unsigned char *)(a1 + 208) = v2;
  return a1;
}

uint64_t assignWithCopy for CallFlow(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = a2;
  sub_87A8((uint64_t *)a1, a2);
  sub_87A8((uint64_t *)(a1 + 40), v2 + 5);
  uint64_t v4 = v2[10];
  uint64_t v5 = v2[11];
  uint64_t v6 = v2[12];
  uint64_t v7 = v2[13];
  uint64_t v8 = v2[14];
  uint64_t v9 = v2[15];
  uint64_t v10 = v2[16];
  uint64_t v11 = v2[17];
  uint64_t v27 = v2[18];
  uint64_t v28 = v2[19];
  uint64_t v29 = v2[20];
  uint64_t v30 = v2[21];
  uint64_t v31 = v2[22];
  uint64_t v32 = v2[23];
  uint64_t v33 = v2[24];
  uint64_t v34 = v2[25];
  LOBYTE(v2) = *((unsigned char *)v2 + 208);
  sub_2D360(v4, v5, v6, v7, v8, v9, v10, v11, v27, v28, v29, v30, v31, v32, v33, v34, v2);
  uint64_t v12 = *(void *)(a1 + 80);
  uint64_t v13 = *(void *)(a1 + 88);
  uint64_t v14 = *(void *)(a1 + 96);
  uint64_t v15 = *(void *)(a1 + 104);
  uint64_t v16 = *(void *)(a1 + 112);
  uint64_t v17 = *(void *)(a1 + 120);
  uint64_t v18 = *(void *)(a1 + 128);
  uint64_t v19 = *(void *)(a1 + 136);
  long long v20 = *(_OWORD *)(a1 + 144);
  long long v21 = *(_OWORD *)(a1 + 160);
  long long v22 = *(_OWORD *)(a1 + 176);
  uint64_t v23 = *(void *)(a1 + 192);
  uint64_t v24 = *(void *)(a1 + 200);
  unsigned __int8 v25 = *(unsigned char *)(a1 + 208);
  *(void *)(a1 + 80) = v4;
  *(void *)(a1 + 88) = v5;
  *(void *)(a1 + 96) = v6;
  *(void *)(a1 + 104) = v7;
  *(void *)(a1 + 112) = v8;
  *(void *)(a1 + 120) = v9;
  *(void *)(a1 + 128) = v10;
  *(void *)(a1 + 136) = v11;
  *(void *)(a1 + 144) = v27;
  *(void *)(a1 + 152) = v28;
  *(void *)(a1 + 160) = v29;
  *(void *)(a1 + 168) = v30;
  *(void *)(a1 + 176) = v31;
  *(void *)(a1 + 184) = v32;
  *(void *)(a1 + 192) = v33;
  *(void *)(a1 + 200) = v34;
  *(unsigned char *)(a1 + 208) = (_BYTE)v2;
  sub_2D474(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, v24, v25);
  return a1;
}

void *initializeWithTake for CallFlow(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xD1uLL);
}

uint64_t assignWithTake for CallFlow(uint64_t a1, uint64_t a2)
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  char v5 = *(unsigned char *)(a2 + 208);
  uint64_t v6 = *(void *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 88);
  uint64_t v8 = *(void *)(a1 + 96);
  uint64_t v9 = *(void *)(a1 + 104);
  uint64_t v10 = *(void *)(a1 + 112);
  uint64_t v11 = *(void *)(a1 + 120);
  uint64_t v12 = *(void *)(a1 + 128);
  uint64_t v13 = *(void *)(a1 + 136);
  long long v14 = *(_OWORD *)(a1 + 144);
  long long v15 = *(_OWORD *)(a1 + 160);
  long long v16 = *(_OWORD *)(a1 + 176);
  uint64_t v17 = *(void *)(a1 + 192);
  uint64_t v18 = *(void *)(a1 + 200);
  unsigned __int8 v19 = *(unsigned char *)(a1 + 208);
  long long v20 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v20;
  long long v21 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v21;
  long long v22 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v22;
  long long v23 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v23;
  *(unsigned char *)(a1 + 208) = v5;
  sub_2D474(v6, v7, v8, v9, v10, v11, v12, v13, v14, *((uint64_t *)&v14 + 1), v15, *((uint64_t *)&v15 + 1), v16, *((uint64_t *)&v16 + 1), v17, v18, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for CallFlow(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 209))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CallFlow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 200) = 0;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 208) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 209) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 209) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CallFlow()
{
  return &type metadata for CallFlow;
}

uint64_t sub_4417C()
{
  uint64_t v0 = sub_53DB0();
  sub_9120();
  uint64_t v2 = v1;
  __chkstk_darwin(v3);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_53D90();
  sub_6108();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v6, v0);
  uint64_t v7 = sub_53DA0();
  os_log_type_t v8 = sub_53E90();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)sub_61F0();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_0, v7, v8, "CallFlow onInput", v9, 2u);
    sub_60F0();
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v0);
  return 1;
}

uint64_t sub_442A8(uint64_t a1, uint64_t a2)
{
  uint64_t v91 = a2;
  uint64_t v93 = a1;
  sub_53490();
  sub_9120();
  uint64_t v94 = v3;
  uint64_t v95 = v2;
  __chkstk_darwin(v2);
  uint64_t v92 = (char *)&v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_535F0();
  sub_9120();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_612C();
  uint64_t v83 = v8;
  sub_15258();
  __chkstk_darwin(v9);
  uint64_t v84 = (char *)&v81 - v10;
  sub_15258();
  __chkstk_darwin(v11);
  uint64_t v96 = (char *)&v81 - v12;
  uint64_t v13 = sub_53DB0();
  sub_9120();
  uint64_t v15 = v14;
  __chkstk_darwin(v16);
  sub_612C();
  char v87 = v17;
  sub_15258();
  __chkstk_darwin(v18);
  uint64_t v86 = (char *)&v81 - v19;
  sub_15258();
  __chkstk_darwin(v20);
  int v88 = (char *)&v81 - v21;
  sub_15258();
  __chkstk_darwin(v22);
  uint64_t v24 = (char *)&v81 - v23;
  sub_53D90();
  sub_6108();
  uint64_t v90 = *(NSObject **)(v15 + 16);
  sub_1547C();
  v25();
  uint64_t v26 = sub_53DA0();
  os_log_type_t v27 = sub_53E90();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = (uint8_t *)sub_61F0();
    *(_WORD *)uint64_t v28 = 0;
    _os_log_impl(&dword_0, v26, v27, "CallFlow execute", v28, 2u);
    sub_60F0();
  }

  uint64_t v31 = *(void (**)(char *, char *))(v15 + 8);
  uint64_t v29 = (char *)(v15 + 8);
  uint64_t v30 = v31;
  v31(v24, (char *)v13);
  uint64_t v32 = v97;
  sub_F87C((uint64_t)(v97 + 10), (uint64_t)v100);
  if (sub_2C320((uint64_t)v100))
  {
    unint64_t v85 = v30;
    char v87 = v29;
    uint64_t v33 = (char *)v13;
    uint64_t v34 = v96;
    sub_535C0();
    uint64_t v35 = v32[3];
    uint64_t v36 = v32[4];
    sub_2C00(v32, v35);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v36 + 56))(v99, v35, v36);
    uint64_t v37 = v99[3];
    uint64_t v38 = v99[4];
    sub_2C00(v99, v99[3]);
    if ((*(uint64_t (**)(char *, uint64_t, uint64_t))(v38 + 8))(v34, v37, v38))
    {
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v99);
      sub_6108();
      char v39 = v88;
      sub_1547C();
      v40();
      uint64_t v41 = sub_53DA0();
      os_log_type_t v42 = sub_53E90();
      if (os_log_type_enabled(v41, v42))
      {
        *(_WORD *)sub_61F0() = 0;
        sub_1B7DC(&dword_0, v43, v44, "Handing off to phone flow");
        sub_60F0();
      }

      v85(v39, v33);
      sub_53450();
      uint64_t v45 = sub_44A00();
      v46(v45);
      swift_release();
      uint64_t v47 = sub_449E8();
      v48(v47);
      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v96, v89);
    }
    else
    {
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v99);
      sub_6108();
      uint64_t v61 = v86;
      int v88 = v33;
      sub_1547C();
      v62();
      char v63 = *(void (**)(void))(v6 + 16);
      uint64_t v64 = v89;
      sub_1547C();
      v63();
      os_log_type_t v65 = sub_53DA0();
      os_log_type_t v66 = sub_53EB0();
      uint64_t v90 = v65;
      if (os_log_type_enabled(v65, v66))
      {
        uint64_t v67 = (uint8_t *)swift_slowAlloc();
        uint64_t v82 = swift_slowAlloc();
        v99[0] = v82;
        *(_DWORD *)uint64_t v67 = 136315138;
        uint64_t v64 = v89;
        uint64_t v81 = v67 + 4;
        sub_1547C();
        v63();
        uint64_t v68 = sub_53E10();
        char v63 = (void (*)(void))v69;
        uint64_t v98 = sub_50F10(v68, v69, v99);
        sub_53EF0();
        swift_bridgeObjectRelease();
        uint64_t v70 = sub_44A14();
        ((void (*)(uint64_t))v63)(v70);
        uint64_t v71 = v90;
        _os_log_impl(&dword_0, v90, v66, "Phone flow not found for direct invocation %s", v67, 0xCu);
        swift_arrayDestroy();
        uint64_t v72 = v96;
        sub_60F0();
        sub_60F0();

        uint64_t v73 = v86;
      }
      else
      {
        uint64_t v72 = v34;
        uint64_t v74 = sub_44A14();
        ((void (*)(uint64_t))v63)(v74);

        uint64_t v73 = v61;
      }
      v85(v73, v88);
      uint64_t v75 = (uint64_t)v97;
      uint64_t v76 = sub_2C00(v97 + 5, v97[8]);
      memcpy(v99, v76, sizeof(v99));
      sub_2C44(v75, v99);
      sub_53450();
      swift_release();
      uint64_t v77 = sub_44A00();
      v78(v77);
      uint64_t v79 = sub_449E8();
      v80(v79);
      return ((uint64_t (*)(char *, uint64_t))v63)(v72, v64);
    }
  }
  else
  {
    swift_beginAccess();
    os_log_type_t v50 = v87;
    sub_1547C();
    v51();
    uint64_t v52 = sub_53DA0();
    os_log_type_t v53 = sub_53EA0();
    if (os_log_type_enabled(v52, v53))
    {
      *(_WORD *)sub_61F0() = 0;
      sub_1B7DC(&dword_0, v54, v55, "Incorrectly formatted direct invocation payload");
      sub_60F0();
    }

    v30(v50, (char *)v13);
    os_log_type_t v56 = sub_2C00(v32 + 5, v32[8]);
    memcpy(v99, v56, sizeof(v99));
    sub_2C44((uint64_t)v32, v99);
    sub_53450();
    swift_release();
    uint64_t v57 = sub_44A00();
    v58(v57);
    uint64_t v59 = sub_449E8();
    return v60(v59);
  }
}

uint64_t sub_449C8()
{
  return 1;
}

uint64_t sub_449E8()
{
  return v0;
}

uint64_t sub_44A00()
{
  return v0;
}

uint64_t sub_44A14()
{
  return v0;
}

uint64_t sub_44A34()
{
  uint64_t v1 = sub_53670();
  sub_60C0();
  uint64_t v3 = v2;
  __chkstk_darwin();
  sub_38808();
  sub_53610();
  sub_53660();
  uint64_t v5 = v4;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  if (v5)
  {
    if (sub_53D10() == 23)
    {
      LOBYTE(v5) = 0;
    }
    else if (sub_53D20() == 0xD000000000000029 && v6 == 0x8000000000058D30)
    {
      swift_bridgeObjectRelease();
      LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = sub_53FE0();
      swift_bridgeObjectRelease();
    }
  }
  return v5 & 1;
}

void sub_44B6C()
{
  sub_15308();
  uint64_t v3 = v0;
  uint64_t v4 = sub_2E18(&qword_6D878);
  __chkstk_darwin(v4 - 8);
  sub_15348();
  uint64_t v5 = (const void *)sub_535F0();
  sub_60C0();
  uint64_t v22 = v6;
  __chkstk_darwin(v7);
  sub_7D34();
  uint64_t v8 = (int *)type metadata accessor for FlowRouter();
  uint64_t v9 = (void *)(v0 + v8[7]);
  uint64_t v10 = v9[3];
  uint64_t v11 = v9[4];
  sub_2C00(v9, v10);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v11 + 64))(v29, v10, v11);
  uint64_t v12 = v29[3];
  uint64_t v13 = v29[4];
  sub_2C00(v29, v29[3]);
  char v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v12, v13);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v29);
  if ((v14 & 1) == 0)
  {
    sub_3EB00(v3 + v8[6], v1, &qword_6D878);
    if (sub_5800(v1, 1, (uint64_t)v5) == 1)
    {
      sub_5884(v1, &qword_6D878);
      sub_3EB00(v3, (uint64_t)&v27, &qword_6D880);
      if (v28)
      {
        sub_5F28(&v27, (uint64_t)v29);
        uint64_t v20 = sub_2C00(v29, v29[3]);
        sub_483D0((uint64_t)v20);
      }
      else
      {
        sub_5884((uint64_t)&v27, &qword_6D880);
        sub_3EB00(v3 + 40, (uint64_t)&v27, &qword_6D888);
        if (!v28)
        {
          sub_5884((uint64_t)&v27, &qword_6D888);
          goto LABEL_10;
        }
        sub_5F28(&v27, (uint64_t)v29);
        sub_4AD8C(v29);
      }
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v29);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, const void *))(v22 + 32))(v2, v1, v5);
      sub_4A674(v2);
      (*(void (**)(uint64_t, const void *))(v22 + 8))(v2, v5);
    }
LABEL_10:
    sub_44F5C();
    goto LABEL_11;
  }
  sub_3048((uint64_t)v9, (uint64_t)&v27);
  sub_3048(v3 + v8[8], (uint64_t)v26);
  sub_5920(v3 + v8[9], (uint64_t)v25);
  uint64_t v24 = 0;
  memset(v23, 0, sizeof(v23));
  sub_597C((uint64_t)v26, v26[3]);
  sub_60C0();
  __chkstk_darwin(v15);
  uint64_t v17 = sub_49E18(v16, v21);
  v18(v17);
  memcpy(v29, v5, 0x70uLL);
  uint64_t v19 = sub_48258((uint64_t)&v27, v29, (uint64_t)v25, (uint64_t)v23, 1280);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v26);
  *(void *)&long long v27 = v19;
  type metadata accessor for OfflineFlow();
  sub_48E20(&qword_6CC50, (void (*)(uint64_t))type metadata accessor for OfflineFlow);
  sub_531D0();
  swift_release();
LABEL_11:
  sub_9638();
}

uint64_t type metadata accessor for FlowRouter()
{
  uint64_t result = qword_6DEF8;
  if (!qword_6DEF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_44F5C()
{
  sub_15308();
  uint64_t v152 = (_OWORD *)v0;
  uint64_t v3 = v2;
  uint64_t v4 = sub_2E18(&qword_6BCA8);
  __chkstk_darwin(v4 - 8);
  uint64_t v150 = sub_53B50();
  sub_6188();
  __chkstk_darwin(v5);
  sub_15348();
  uint64_t v6 = (const void *)sub_539D0();
  sub_60C0();
  uint64_t v151 = v7;
  __chkstk_darwin(v8);
  sub_49FB4();
  __chkstk_darwin(v9);
  uint64_t v10 = sub_53DB0();
  sub_60C0();
  uint64_t v12 = __chkstk_darwin(v11);
  char v14 = (_OWORD *)((char *)&v150 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v150 - v16;
  switch((char)v3)
  {
    case 1:
      uint64_t v38 = (int *)type metadata accessor for FlowRouter();
      char v39 = v152;
      sub_3048((uint64_t)v152 + v38[7], (uint64_t)v165);
      sub_3048((uint64_t)v39 + v38[8], (uint64_t)v166);
      sub_5920((uint64_t)v39 + v38[9], (uint64_t)&v162);
      sub_597C((uint64_t)v166, v166[3]);
      sub_60C0();
      __chkstk_darwin(v40);
      os_log_type_t v42 = sub_49E18(v41, v150);
      v43(v42);
      v161[3] = &type metadata for EmergencyCATProvider;
      v161[4] = &off_66E10;
      uint64_t v44 = (_OWORD *)sub_49F4C();
      v161[0] = v44;
      long long v45 = v39[1];
      v44[1] = *v39;
      v44[2] = v45;
      long long v46 = v39[3];
      v44[3] = v39[2];
      v44[4] = v46;
      long long v47 = v39[5];
      v44[5] = v39[4];
      v44[6] = v47;
      v44[7] = v39[6];
      type metadata accessor for EmergencyCSAMFlow();
      uint64_t v48 = swift_allocObject();
      sub_597C((uint64_t)v161, (uint64_t)&type metadata for EmergencyCATProvider);
      sub_60C0();
      __chkstk_darwin(v49);
      sub_7D34();
      sub_49ED0();
      v50();
      *(void *)(v48 + 80) = &type metadata for EmergencyCATProvider;
      *(void *)(v48 + 88) = &off_66E10;
      uint64_t v51 = (_OWORD *)sub_49F4C();
      *(void *)(v48 + 56) = v51;
      long long v52 = v14[1];
      v51[1] = *v14;
      v51[2] = v52;
      long long v53 = v14[3];
      v51[3] = v14[2];
      v51[4] = v53;
      long long v54 = v14[5];
      v51[5] = v14[4];
      v51[6] = v54;
      v51[7] = v14[6];
      sub_5F28(v165, v48 + 16);
      long long v55 = v163;
      *(_OWORD *)(v48 + 96) = v162;
      *(_OWORD *)(v48 + 112) = v55;
      *(void *)(v48 + 128) = v164;
      *(void *)(v48 + 136) = 0;
      *(void *)(v48 + 144) = 0;
      *(void *)(v48 + 152) = 1;
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v161);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v166);
      *(void *)&v165[0] = v48;
      uint64_t v18 = (unint64_t *)&unk_6DE70;
      uint64_t v19 = type metadata accessor for EmergencyCSAMFlow;
      goto LABEL_7;
    case 2:
      uint64_t v56 = v15;
      uint64_t v57 = sub_53D90();
      swift_beginAccess();
      uint64_t v58 = v56;
      (*(void (**)(_OWORD *, uint64_t, uint64_t))(v56 + 16))(v14, v57, v10);
      uint64_t v59 = sub_53DA0();
      os_log_type_t v60 = sub_53E90();
      if (os_log_type_enabled(v59, v60))
      {
        uint64_t v61 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v61 = 0;
        _os_log_impl(&dword_0, v59, v60, "Going to EmergencyDirectCallFlow", v61, 2u);
        sub_60F0();
      }

      (*(void (**)(_OWORD *, uint64_t))(v58 + 8))(v14, v10);
      uint64_t v62 = type metadata accessor for FlowRouter();
      sub_49E74(v62);
      sub_49E98();
      sub_49EB4();
      sub_49E44();
      sub_60C0();
      __chkstk_darwin(v63);
      os_log_type_t v65 = sub_49E18(v64, v150);
      v66(v65);
      sub_49EDC();
      sub_49F8C();
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)&v162);
      sub_49EF8();
      type metadata accessor for EmergencyDirectCallFlow();
      uint64_t v36 = &qword_6D120;
      uint64_t v37 = type metadata accessor for EmergencyDirectCallFlow;
      goto LABEL_29;
    case 3:
      uint64_t v67 = type metadata accessor for FlowRouter();
      sub_49E74(v67);
      sub_49E98();
      uint64_t v68 = v3 + *((int *)v17 + 9);
      goto LABEL_19;
    case 4:
      uint64_t v69 = type metadata accessor for FlowRouter();
      sub_49E74(v69);
      sub_49E98();
      sub_49EB4();
      sub_49E44();
      sub_60C0();
      __chkstk_darwin(v70);
      uint64_t v72 = sub_49E18(v71, v150);
      v73(v72);
      uint64_t v74 = sub_49EDC();
      sub_49F64((uint64_t)v74, v75, v76, v77, v78, v79, (uint64_t)type metadata accessor for EmergencyNumberFlow, (uint64_t)&type metadata for EmergencyNumberFlowFollowupConfigModel, (uint64_t)&off_66D20, v149, v150, v151, (uint64_t)v152, v153, v154, v155, v156, v157, v158,
        v159,
        v160);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)&v162);
      sub_49EF8();
      type metadata accessor for EmergencyNumberFlow();
      uint64_t v36 = (unint64_t *)&unk_6DA60;
      uint64_t v37 = type metadata accessor for EmergencyNumberFlow;
      goto LABEL_29;
    case 5:
      uint64_t v80 = type metadata accessor for FlowRouter();
      sub_49E74(v80);
      sub_49E98();
      sub_49EB4();
      sub_49E44();
      sub_60C0();
      __chkstk_darwin(v81);
      uint64_t v83 = sub_49E18(v82, v150);
      v84(v83);
      sub_49EDC();
      sub_49F8C();
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)&v162);
      sub_49EF8();
      type metadata accessor for EmergencyOfferCallFlow();
      uint64_t v36 = &qword_6CB18;
      uint64_t v37 = type metadata accessor for EmergencyOfferCallFlow;
      goto LABEL_29;
    case 6:
      unint64_t v85 = (int *)type metadata accessor for FlowRouter();
      uint64_t v86 = (uint64_t)v152;
      char v87 = (void *)((char *)v152 + v85[7]);
      uint64_t v88 = v87[3];
      uint64_t v89 = v87[4];
      sub_2C00(v87, v88);
      sub_4A048();
      v90(v88, v89);
      sub_2C00(v165, *((uint64_t *)&v165[1] + 1));
      sub_53330();
      sub_539C0();
      sub_48E20(&qword_6C3A8, (void (*)(uint64_t))&type metadata accessor for DeviceRestrictions);
      char v91 = sub_4A028();
      uint64_t v92 = *(void (**)(void))(v151 + 8);
      sub_49F08();
      v92();
      sub_49F08();
      v92();
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v165);
      if (v91)
      {
        sub_3048((uint64_t)v87, (uint64_t)v166);
        sub_3048(v86 + v85[8], (uint64_t)&v162);
        uint64_t v93 = v85[9];
        goto LABEL_18;
      }
      uint64_t v148 = v86 + v85[9];
      sub_49F18((void *)(v86 + v85[8]));
      v166[0] = sub_47B54((uint64_t)v87, v165, v148);
      type metadata accessor for EmergencyConfirmationFlow();
      uint64_t v36 = &qword_6BE80;
      uint64_t v37 = type metadata accessor for EmergencyConfirmationFlow;
      goto LABEL_29;
    case 7:
      uint64_t v94 = (int *)type metadata accessor for FlowRouter();
      uint64_t v86 = (uint64_t)v152;
      uint64_t v95 = (void *)((char *)v152 + v94[7]);
      uint64_t v96 = v95[3];
      uint64_t v97 = v95[4];
      sub_2C00(v95, v96);
      sub_4A048();
      v98(v96, v97);
      sub_2C00(v165, *((uint64_t *)&v165[1] + 1));
      sub_53330();
      sub_539C0();
      sub_48E20(&qword_6C3A8, (void (*)(uint64_t))&type metadata accessor for DeviceRestrictions);
      char v99 = sub_4A028();
      uint64_t v100 = *(void (**)(void))(v151 + 8);
      sub_49F08();
      v100();
      sub_49F08();
      v100();
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v165);
      if (v99)
      {
        sub_3048((uint64_t)v95, (uint64_t)v166);
        sub_3048(v86 + v94[8], (uint64_t)&v162);
        uint64_t v93 = v94[9];
LABEL_18:
        uint64_t v68 = v86 + v93;
LABEL_19:
        sub_5920(v68, (uint64_t)v161);
        sub_49E44();
        sub_60C0();
        __chkstk_darwin(v101);
        unsigned int v103 = sub_49E18(v102, v150);
        v104(v103);
        sub_49EDC();
        uint64_t v105 = (long long *)sub_4A010();
        sub_47538(v105, v106, v107, v108, v109, 35);
        _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)&v162);
        sub_49EF8();
        type metadata accessor for GeneralEmergencyFlow();
        uint64_t v36 = &qword_6C3A0;
        uint64_t v37 = type metadata accessor for GeneralEmergencyFlow;
LABEL_29:
        sub_48E20(v36, (void (*)(uint64_t))v37);
LABEL_30:
        sub_531D0();
LABEL_31:
        swift_release();
      }
      else
      {
        sub_3048((uint64_t)v95, (uint64_t)v165);
        sub_3048(v86 + v94[8], (uint64_t)&v165[2] + 8);
        sub_F978((uint64_t)v166);
        sub_F87C((uint64_t)v166, (uint64_t)&v165[5]);
        sub_F8D8();
        sub_531D0();
        sub_F924((uint64_t)v165);
      }
LABEL_32:
      sub_9638();
      return;
    case 8:
      uint64_t v128 = type metadata accessor for FlowRouter();
      sub_49E74(v128);
      sub_49E98();
      sub_49EB4();
      sub_49E44();
      sub_60C0();
      __chkstk_darwin(v129);
      unsigned int v131 = sub_49E18(v130, v150);
      v132(v131);
      __int16 v133 = sub_49EDC();
      sub_49F64((uint64_t)v133, v134, v135, v136, v137, v138, (uint64_t)type metadata accessor for EmergencyWebsiteFlow, (uint64_t)&type metadata for EmergencyWebsiteFlowFollowupConfigModel, (uint64_t)&off_67060, v149, v150, v151, (uint64_t)v152, v153, v154, v155, v156, v157, v158,
        v159,
        v160);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)&v162);
      sub_49EF8();
      type metadata accessor for EmergencyWebsiteFlow();
      uint64_t v36 = (unint64_t *)&unk_6DD88;
      uint64_t v37 = type metadata accessor for EmergencyWebsiteFlow;
      goto LABEL_29;
    case 9:
      uint64_t v110 = type metadata accessor for FlowRouter();
      sub_49E74(v110);
      sub_49E98();
      sub_49EB4();
      type metadata accessor for SirenAppProvider();
      uint64_t v111 = swift_allocObject();
      sub_53D80();
      uint64_t v112 = sub_53D70();
      sub_597C((uint64_t)&v162, *((uint64_t *)&v163 + 1));
      sub_60C0();
      __chkstk_darwin(v113);
      uint64_t v115 = (char *)&v150 - ((v114 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_49ED0();
      v116();
      memcpy(v165, v115, 0x70uLL);
      uint64_t v117 = (long long *)sub_4A074();
      uint64_t v121 = sub_47F10(v117, v118, v119, v120, v111, v112);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)&v162);
      v166[0] = v121;
      type metadata accessor for StartSirenFlow();
      uint64_t v36 = (unint64_t *)&unk_6DE68;
      uint64_t v37 = type metadata accessor for StartSirenFlow;
      goto LABEL_29;
    case 10:
      uint64_t v139 = type metadata accessor for FlowRouter();
      sub_49E74(v139);
      sub_49E98();
      sub_49EB4();
      type metadata accessor for SirenAppProvider();
      uint64_t v140 = swift_allocObject();
      sub_597C((uint64_t)&v162, *((uint64_t *)&v163 + 1));
      sub_60C0();
      __chkstk_darwin(v141);
      sub_38808();
      sub_49ED0();
      v142();
      memcpy(v165, v6, 0x70uLL);
      char v143 = (long long *)sub_4A074();
      uint64_t v147 = sub_47924(v143, v144, v145, v146, v140);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)&v162);
      v166[0] = v147;
      type metadata accessor for StopSirenFlow();
      uint64_t v36 = &qword_6D408;
      uint64_t v37 = type metadata accessor for StopSirenFlow;
      goto LABEL_29;
    case 11:
    case 12:
    case 13:
      type metadata accessor for InfoDomainFallbackFlow();
      *(void *)&v165[0] = swift_allocObject();
      uint64_t v18 = (unint64_t *)&qword_6DE60;
      uint64_t v19 = type metadata accessor for InfoDomainFallbackFlow;
LABEL_7:
      sub_48E20(v18, (void (*)(uint64_t))v19);
      sub_531D0();
      goto LABEL_31;
    case 14:
      uint64_t v122 = type metadata accessor for FlowRouter();
      sub_49F18((_OWORD *)((char *)v152 + *(int *)(v122 + 32)));
      sub_462A4();
      v166[0] = v123;
      sub_53180();
      goto LABEL_30;
    case 15:
      uint64_t v124 = type metadata accessor for FlowRouter();
      sub_49FD0(v124);
      sub_257D8();
      goto LABEL_24;
    case 16:
      uint64_t v125 = type metadata accessor for FlowRouter();
      sub_49FD0(v125);
      sub_257F8();
LABEL_24:
      swift_release();
      sub_3048((uint64_t)v6 + *(int *)(v3 + 28), (uint64_t)v165);
      sub_53B40();
      sub_48E20((unint64_t *)&qword_6BCB0, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
      sub_531D0();
      sub_48F18(v1, (void (*)(void))&type metadata accessor for OutputFlow);
      goto LABEL_32;
    case 17:
      uint64_t v126 = type metadata accessor for FlowRouter();
      uint64_t v127 = (uint64_t)v152 + *(int *)(v126 + 28);
      sub_49F18((_OWORD *)((char *)v152 + *(int *)(v126 + 32)));
      sub_2C44(v127, v165);
      goto LABEL_32;
    default:
      uint64_t v20 = v15;
      uint64_t v21 = sub_53D90();
      swift_beginAccess();
      uint64_t v22 = v20;
      (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v17, v21, v10);
      uint64_t v23 = sub_53DA0();
      os_log_type_t v24 = sub_53E90();
      if (os_log_type_enabled(v23, v24))
      {
        unsigned __int8 v25 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unsigned __int8 v25 = 0;
        _os_log_impl(&dword_0, v23, v24, "Going to EmergencyBasicFlow", v25, 2u);
        sub_60F0();
      }

      (*(void (**)(char *, uint64_t))(v22 + 8))(v17, v10);
      uint64_t v26 = type metadata accessor for FlowRouter();
      sub_49E74(v26);
      sub_49E98();
      sub_49EB4();
      sub_49E44();
      sub_60C0();
      __chkstk_darwin(v27);
      uint64_t v29 = sub_49E18(v28, v150);
      v30(v29);
      sub_49EDC();
      uint64_t v31 = (long long *)sub_4A010();
      sub_473B8(v31, v32, v33, v34, v35, 5);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)&v162);
      sub_49EF8();
      type metadata accessor for EmergencyBasicFlow();
      uint64_t v36 = (unint64_t *)&unk_6DC70;
      uint64_t v37 = type metadata accessor for EmergencyBasicFlow;
      goto LABEL_29;
  }
}

uint64_t sub_4605C(long long *a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v34 = &type metadata for EmergencyCATProvider;
  uint64_t v35 = &off_66E10;
  *(void *)&long long v33 = swift_allocObject();
  memcpy((void *)(v33 + 16), a2, 0x70uLL);
  sub_3048((uint64_t)a1, a7 + 16);
  sub_3048((uint64_t)&v33, a7 + 56);
  sub_5920(a3, a7 + 96);
  sub_3EB00(a4, (uint64_t)&v28, &qword_6DE58);
  sub_3048((uint64_t)a1, (uint64_t)v27);
  if (v29)
  {
    sub_5884(a4, &qword_6DE58);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v27);
    sub_5F28(&v28, (uint64_t)&v30);
  }
  else
  {
    sub_3048((uint64_t)v27, (uint64_t)&v24);
    uint64_t v31 = sub_53C90();
    uint64_t v32 = &protocol witness table for EmergencyOrganizationInfoProvider;
    char v14 = sub_5DC4((uint64_t *)&v30);
    EmergencyOrganizationInfoProvider.init(flowConfig:)(&v24, (uint64_t)v14);
    sub_5884(a4, &qword_6DE58);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v27);
    sub_5884((uint64_t)&v28, &qword_6DE58);
  }
  sub_5F28(&v30, a7 + 136);
  sub_5F28(a1, (uint64_t)v23);
  sub_5F28(&v33, (uint64_t)v22);
  long long v15 = *(_OWORD *)(a3 + 16);
  long long v19 = *(_OWORD *)a3;
  long long v20 = v15;
  uint64_t v21 = *(void *)(a3 + 32);
  if (*(void *)(a5 + 24))
  {
    sub_6068((uint64_t)&v19);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v22);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v23);
    sub_5F28((long long *)a5, (uint64_t)&v24);
  }
  else
  {
    unsigned __int8 v25 = &type metadata for GeneralEmergencyFlowFollowupProvider;
    uint64_t v26 = &off_66058;
    uint64_t v16 = swift_allocObject();
    *(void *)&long long v24 = v16;
    sub_5F28(v23, v16 + 16);
    sub_5F28(v22, v16 + 56);
    long long v17 = v20;
    *(_OWORD *)(v16 + 96) = v19;
    *(_OWORD *)(v16 + 112) = v17;
    *(void *)(v16 + 128) = v21;
    sub_5884(a5, &qword_6DE98);
  }
  sub_5F28(&v24, a7 + 176);
  *(unsigned char *)(a7 + 216) = a6;
  return a7;
}

void sub_462A4()
{
  sub_15308();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  sub_53DB0();
  sub_60C0();
  uint64_t v49 = v10;
  uint64_t v50 = v9;
  __chkstk_darwin(v9);
  uint64_t v48 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_535F0();
  sub_60C0();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_49FB4();
  uint64_t v17 = __chkstk_darwin(v16);
  long long v47 = (char *)&v41 - v18;
  __chkstk_darwin(v17);
  long long v20 = (char *)&v41 - v19;
  long long v53 = &type metadata for EmergencyCATProvider;
  long long v54 = &off_66E10;
  v52[0] = sub_49F4C();
  memcpy((void *)(v52[0] + 16), v2, 0x70uLL);
  sub_2E18(&qword_6C520);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_547B0;
  sub_2EFC((uint64_t)v2);
  *(void *)(inited + 32) = sub_53D30();
  *(void *)(inited + 40) = v22;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v8;
  *(void *)(inited + 56) = v6;
  swift_bridgeObjectRetain();
  sub_53DD0();
  sub_535C0();
  uint64_t v23 = v4[3];
  uint64_t v24 = v4[4];
  sub_2C00(v4, v23);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v24 + 56))(v55, v23, v24);
  uint64_t v25 = v55[3];
  uint64_t v26 = v55[4];
  sub_2C00(v55, v55[3]);
  if ((*(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 8))(v20, v25, v26))
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v20, v12);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v55);
  }
  else
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v55);
    uint64_t v27 = sub_53D90();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v48, v27, v50);
    long long v28 = *(void (**)(char *, char *))(v14 + 16);
    uint64_t v46 = v12;
    v28(v47, v20);
    uint64_t v29 = sub_53DA0();
    os_log_type_t v30 = sub_53EA0();
    int v31 = v30;
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v32 = swift_slowAlloc();
      int v45 = v31;
      long long v33 = (uint8_t *)v32;
      uint64_t v44 = swift_slowAlloc();
      v55[0] = v44;
      os_log_t v42 = v29;
      uint64_t v43 = v33;
      *(_DWORD *)long long v33 = 136315138;
      uint64_t v41 = v33 + 4;
      uint64_t v34 = v0;
      uint64_t v35 = v46;
      uint64_t v36 = v47;
      ((void (*)(uint64_t, char *, uint64_t))v28)(v34, v47, v46);
      uint64_t v37 = sub_53E10();
      uint64_t v51 = sub_50F10(v37, v38, v55);
      sub_53EF0();
      swift_bridgeObjectRelease();
      char v39 = *(void (**)(char *, uint64_t))(v14 + 8);
      v39(v36, v35);
      uint64_t v29 = v42;
      _os_log_impl(&dword_0, v42, (os_log_type_t)v45, "Canned flow not found for direct invocation %s", v43, 0xCu);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();
    }
    else
    {
      char v39 = *(void (**)(char *, uint64_t))(v14 + 8);
      v39(v47, v46);
    }

    (*(void (**)(char *, uint64_t))(v49 + 8))(v48, v50);
    uint64_t v40 = sub_2C00(v52, (uint64_t)v53);
    memcpy(v55, v40, 0x70uLL);
    uint64_t v51 = sub_2C44((uint64_t)v4, v55);
    sub_53180();
    sub_531D0();
    swift_release();
    v39(v20, v46);
  }
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v52);
  sub_9638();
}

uint64_t sub_4676C(long long *a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  uint64_t v34 = &type metadata for EmergencyCATProvider;
  uint64_t v35 = &off_66E10;
  *(void *)&long long v33 = swift_allocObject();
  memcpy((void *)(v33 + 16), a2, 0x70uLL);
  sub_3048((uint64_t)a1, a7 + 16);
  sub_3048((uint64_t)&v33, a7 + 56);
  sub_5920(a3, a7 + 96);
  sub_3EB00(a4, (uint64_t)&v28, &qword_6DE58);
  sub_3048((uint64_t)a1, (uint64_t)v27);
  if (v29)
  {
    sub_5884(a4, &qword_6DE58);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v27);
    sub_5F28(&v28, (uint64_t)&v30);
  }
  else
  {
    sub_3048((uint64_t)v27, (uint64_t)&v24);
    uint64_t v31 = sub_53C90();
    uint64_t v32 = &protocol witness table for EmergencyOrganizationInfoProvider;
    uint64_t v14 = sub_5DC4((uint64_t *)&v30);
    EmergencyOrganizationInfoProvider.init(flowConfig:)(&v24, (uint64_t)v14);
    sub_5884(a4, &qword_6DE58);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v27);
    sub_5884((uint64_t)&v28, &qword_6DE58);
  }
  sub_5F28(&v30, a7 + 136);
  sub_5F28(a1, (uint64_t)v23);
  sub_5F28(&v33, (uint64_t)v22);
  long long v15 = *(_OWORD *)(a3 + 16);
  long long v19 = *(_OWORD *)a3;
  long long v20 = v15;
  uint64_t v21 = *(void *)(a3 + 32);
  if (*(void *)(a5 + 24))
  {
    sub_6068((uint64_t)&v19);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v22);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v23);
    sub_5F28((long long *)a5, (uint64_t)&v24);
  }
  else
  {
    uint64_t v25 = &type metadata for EmergencyOfferCallFlowFollowupProvider;
    uint64_t v26 = &off_66250;
    uint64_t v16 = swift_allocObject();
    *(void *)&long long v24 = v16;
    sub_5F28(v23, v16 + 16);
    sub_5F28(v22, v16 + 56);
    long long v17 = v20;
    *(_OWORD *)(v16 + 96) = v19;
    *(_OWORD *)(v16 + 112) = v17;
    *(void *)(v16 + 128) = v21;
    sub_5884(a5, &qword_6DE90);
  }
  sub_5F28(&v24, a7 + 176);
  *(unsigned char *)(a7 + 218) = BYTE2(a6);
  *(_WORD *)(a7 + 216) = a6;
  return a7;
}

uint64_t sub_469BC(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, __int16 a5, uint64_t a6)
{
  void v21[3] = &type metadata for EmergencyCATProvider;
  void v21[4] = &off_66E10;
  v21[0] = swift_allocObject();
  memcpy((void *)(v21[0] + 16), a2, 0x70uLL);
  sub_3048(a1, a6 + 16);
  sub_3048((uint64_t)v21, a6 + 56);
  sub_5920(a3, a6 + 96);
  sub_3EB00(a4, (uint64_t)&v16, &qword_6DE58);
  sub_3048(a1, (uint64_t)v15);
  if (v17)
  {
    sub_5884(a4, &qword_6DE58);
    sub_6068(a3);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v21);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v15);
    sub_5F28(&v16, (uint64_t)&v18);
  }
  else
  {
    sub_3048((uint64_t)v15, (uint64_t)v14);
    uint64_t v19 = sub_53C90();
    long long v20 = &protocol witness table for EmergencyOrganizationInfoProvider;
    uint64_t v12 = sub_5DC4((uint64_t *)&v18);
    EmergencyOrganizationInfoProvider.init(flowConfig:)(v14, (uint64_t)v12);
    sub_5884(a4, &qword_6DE58);
    sub_6068(a3);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v21);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v15);
    sub_5884((uint64_t)&v16, &qword_6DE58);
  }
  sub_5F28(&v18, a6 + 136);
  *(_WORD *)(a6 + 176) = a5;
  return a6;
}

uint64_t sub_46B64(long long *a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  uint64_t v34 = &type metadata for EmergencyCATProvider;
  uint64_t v35 = &off_66E10;
  *(void *)&long long v33 = swift_allocObject();
  memcpy((void *)(v33 + 16), a2, 0x70uLL);
  sub_3048((uint64_t)a1, a7 + 16);
  sub_3048((uint64_t)&v33, a7 + 56);
  sub_5920(a3, a7 + 96);
  sub_3EB00(a4, (uint64_t)&v28, &qword_6DE58);
  sub_3048((uint64_t)a1, (uint64_t)v27);
  if (v29)
  {
    sub_5884(a4, &qword_6DE58);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v27);
    sub_5F28(&v28, (uint64_t)&v30);
  }
  else
  {
    sub_3048((uint64_t)v27, (uint64_t)&v24);
    uint64_t v31 = sub_53C90();
    uint64_t v32 = &protocol witness table for EmergencyOrganizationInfoProvider;
    uint64_t v14 = sub_5DC4((uint64_t *)&v30);
    EmergencyOrganizationInfoProvider.init(flowConfig:)(&v24, (uint64_t)v14);
    sub_5884(a4, &qword_6DE58);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v27);
    sub_5884((uint64_t)&v28, &qword_6DE58);
  }
  sub_5F28(&v30, a7 + 136);
  sub_5F28(a1, (uint64_t)v23);
  sub_5F28(&v33, (uint64_t)v22);
  long long v15 = *(_OWORD *)(a3 + 16);
  long long v19 = *(_OWORD *)a3;
  long long v20 = v15;
  uint64_t v21 = *(void *)(a3 + 32);
  if (*(void *)(a5 + 24))
  {
    sub_6068((uint64_t)&v19);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v22);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v23);
    sub_5F28((long long *)a5, (uint64_t)&v24);
  }
  else
  {
    uint64_t v25 = &type metadata for EmergencyDirectCallFlowFollowupProvider;
    uint64_t v26 = &off_66440;
    uint64_t v16 = swift_allocObject();
    *(void *)&long long v24 = v16;
    sub_5F28(v23, v16 + 16);
    sub_5F28(v22, v16 + 56);
    long long v17 = v20;
    *(_OWORD *)(v16 + 96) = v19;
    *(_OWORD *)(v16 + 112) = v17;
    *(void *)(v16 + 128) = v21;
    sub_5884(a5, &qword_6DE80);
  }
  sub_5F28(&v24, a7 + 176);
  *(unsigned char *)(a7 + 218) = BYTE2(a6);
  *(_WORD *)(a7 + 216) = a6;
  return a7;
}

uint64_t sub_46DB4(long long *a1, const void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  *(void *)(a6 + 80) = &type metadata for EmergencyCATProvider;
  *(void *)(a6 + 88) = &off_66E10;
  uint64_t v12 = swift_allocObject();
  *(void *)(a6 + 56) = v12;
  memcpy((void *)(v12 + 16), a2, 0x70uLL);
  uint64_t v16 = type metadata accessor for SirenAppProvider();
  long long v17 = &off_66A48;
  *(void *)&long long v15 = a5;
  sub_5F28(a1, a6 + 16);
  long long v13 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a6 + 96) = *(_OWORD *)a3;
  *(_OWORD *)(a6 + 112) = v13;
  *(void *)(a6 + 128) = *(void *)(a3 + 32);
  *(unsigned char *)(a6 + 136) = a4;
  sub_5F28(&v15, a6 + 144);
  return a6;
}

uint64_t sub_46E88(long long *a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7)
{
  uint64_t v34 = &type metadata for EmergencyCATProvider;
  uint64_t v35 = &off_66E10;
  *(void *)&long long v33 = swift_allocObject();
  memcpy((void *)(v33 + 16), a2, 0x70uLL);
  sub_3048((uint64_t)a1, a7 + 16);
  sub_3048((uint64_t)&v33, a7 + 56);
  sub_5920(a3, a7 + 96);
  sub_3EB00(a4, (uint64_t)&v28, &qword_6DE58);
  sub_3048((uint64_t)a1, (uint64_t)v27);
  if (v29)
  {
    sub_5884(a4, &qword_6DE58);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v27);
    sub_5F28(&v28, (uint64_t)&v30);
  }
  else
  {
    sub_3048((uint64_t)v27, (uint64_t)&v24);
    uint64_t v31 = sub_53C90();
    uint64_t v32 = &protocol witness table for EmergencyOrganizationInfoProvider;
    uint64_t v14 = sub_5DC4((uint64_t *)&v30);
    EmergencyOrganizationInfoProvider.init(flowConfig:)(&v24, (uint64_t)v14);
    sub_5884(a4, &qword_6DE58);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v27);
    sub_5884((uint64_t)&v28, &qword_6DE58);
  }
  sub_5F28(&v30, a7 + 136);
  sub_5F28(a1, (uint64_t)v23);
  sub_5F28(&v33, (uint64_t)v22);
  long long v15 = *(_OWORD *)(a3 + 16);
  long long v19 = *(_OWORD *)a3;
  long long v20 = v15;
  uint64_t v21 = *(void *)(a3 + 32);
  if (*(void *)(a5 + 24))
  {
    sub_6068((uint64_t)&v19);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v22);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v23);
    sub_5F28((long long *)a5, (uint64_t)&v24);
  }
  else
  {
    uint64_t v25 = &type metadata for EmergencyBasicFlowFollowupProvider;
    uint64_t v26 = &off_66FA0;
    uint64_t v16 = swift_allocObject();
    *(void *)&long long v24 = v16;
    sub_5F28(v23, v16 + 16);
    sub_5F28(v22, v16 + 56);
    long long v17 = v20;
    *(_OWORD *)(v16 + 96) = v19;
    *(_OWORD *)(v16 + 112) = v17;
    *(void *)(v16 + 128) = v21;
    sub_5884(a5, &qword_6DE78);
  }
  sub_5F28(&v24, a7 + 176);
  *(_WORD *)(a7 + 216) = a6;
  return a7;
}

void sub_470D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  sub_15308();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  int v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  v60[3] = &type metadata for EmergencyCATProvider;
  v60[4] = &off_66E10;
  v60[0] = sub_49F4C();
  memcpy((void *)(v60[0] + 16), v34, 0x70uLL);
  sub_3048(v36, v24 + 64);
  sub_3048((uint64_t)v60, v24 + 104);
  sub_5920(v32, v24 + 144);
  sub_3EB00(v30, (uint64_t)&v55, &qword_6DE58);
  sub_3048(v36, (uint64_t)v54);
  if (v56)
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v54);
    sub_5F28(&v55, (uint64_t)&v57);
  }
  else
  {
    sub_3048((uint64_t)v54, (uint64_t)&v51);
    uint64_t v58 = sub_53C90();
    uint64_t v59 = &protocol witness table for EmergencyOrganizationInfoProvider;
    uint64_t v37 = sub_5DC4((uint64_t *)&v57);
    EmergencyOrganizationInfoProvider.init(flowConfig:)(&v51, (uint64_t)v37);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v54);
    sub_5884((uint64_t)&v55, &qword_6DE58);
  }
  sub_5F28(&v57, v24 + 24);
  sub_3EB00(v28, (uint64_t)&v49, &qword_6DE88);
  sub_3048(v36, (uint64_t)v48);
  sub_3048((uint64_t)v60, (uint64_t)v47);
  sub_5920(v32, (uint64_t)v45);
  if (v50)
  {
    sub_5884(v28, &qword_6DE88);
    sub_5884(v30, &qword_6DE58);
    sub_6068(v32);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v60);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v36);
    sub_6068((uint64_t)v45);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v47);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v48);
    sub_5F28(&v49, (uint64_t)&v51);
  }
  else
  {
    sub_3048((uint64_t)v48, (uint64_t)v44);
    sub_3048((uint64_t)v47, (uint64_t)v43);
    uint64_t v41 = v22;
    uint64_t v42 = a21;
    sub_5884(v28, &qword_6DE88);
    sub_5884(v30, &qword_6DE58);
    sub_6068(v32);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v60);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v36);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v47);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v48);
    long long v52 = &type metadata for EmergencyFlowFollowupProvider;
    long long v53 = &off_667D0;
    uint64_t v38 = swift_allocObject();
    *(void *)&long long v51 = v38;
    sub_5F28(v44, v38 + 16);
    sub_5F28(v43, v38 + 56);
    sub_5F28(&v40, v38 + 96);
    long long v39 = v45[1];
    *(_OWORD *)(v38 + 136) = v45[0];
    *(_OWORD *)(v38 + 152) = v39;
    *(void *)(v38 + 168) = v46;
    sub_5884((uint64_t)&v49, &qword_6DE88);
  }
  sub_5F28(&v51, v24 + 184);
  *(unsigned char *)(v24 + 18) = BYTE2(v26);
  *(_WORD *)(v24 + 16) = v26;
  sub_9638();
}

uint64_t sub_473B8(long long *a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6)
{
  v20[3] = &type metadata for EmergencyCATProvider;
  void v20[4] = &off_66E10;
  v20[0] = swift_allocObject();
  memcpy((void *)(v20[0] + 16), a2, 0x70uLL);
  type metadata accessor for EmergencyBasicFlow();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = sub_597C((uint64_t)v20, (uint64_t)&type metadata for EmergencyCATProvider);
  __chkstk_darwin(v13);
  long long v15 = (char *)&v20[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v16 + 16))(v15);
  memcpy(__dst, v15, sizeof(__dst));
  uint64_t v17 = sub_46E88(a1, __dst, a3, a4, a5, a6, v12);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v20);
  return v17;
}

uint64_t sub_47538(long long *a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  v20[3] = &type metadata for EmergencyCATProvider;
  void v20[4] = &off_66E10;
  v20[0] = swift_allocObject();
  memcpy((void *)(v20[0] + 16), a2, 0x70uLL);
  type metadata accessor for GeneralEmergencyFlow();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = sub_597C((uint64_t)v20, (uint64_t)&type metadata for EmergencyCATProvider);
  __chkstk_darwin(v13);
  long long v15 = (char *)&v20[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v16 + 16))(v15);
  memcpy(__dst, v15, sizeof(__dst));
  uint64_t v17 = sub_4605C(a1, __dst, a3, a4, a5, a6, v12);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v20);
  return v17;
}

void sub_476B8()
{
  sub_15308();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  sub_4A09C();
  v6[3] = &type metadata for EmergencyCATProvider;
  v6[4] = &off_66E10;
  v6[0] = sub_49F4C();
  sub_4A05C((void *)(v6[0] + 16));
  v3(0);
  swift_allocObject();
  sub_597C((uint64_t)v6, (uint64_t)&type metadata for EmergencyCATProvider);
  sub_60C0();
  __chkstk_darwin(v4);
  sub_49ED0();
  v5();
  sub_4A05C(&v7);
  sub_4A088();
  v1();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v6);
  sub_9638();
}

void sub_477E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  sub_15308();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  sub_4A09C();
  uint64_t v36 = &type metadata for EmergencyCATProvider;
  uint64_t v37 = &off_66E10;
  v35[0] = sub_49F4C();
  sub_4A05C((void *)(v35[0] + 16));
  v24(0);
  swift_allocObject();
  sub_597C((uint64_t)v35, (uint64_t)&type metadata for EmergencyCATProvider);
  sub_60C0();
  __chkstk_darwin(v25);
  sub_49ED0();
  v26();
  sub_4A05C(v38);
  sub_4A088();
  sub_470D0(v27, v28, v29, v30, v31, v32, v33, v22, a21, v34, v35[0], v35[1], v35[2], (uint64_t)v36, (uint64_t)v37, v38[0], v38[1], v38[2], v38[3],
    v38[4],
    v38[5]);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v35);
  sub_9638();
}

uint64_t sub_47924(long long *a1, const void *a2, uint64_t a3, char a4, uint64_t a5)
{
  v23[3] = &type metadata for EmergencyCATProvider;
  void v23[4] = &off_66E10;
  v23[0] = swift_allocObject();
  memcpy((void *)(v23[0] + 16), a2, 0x70uLL);
  uint64_t v10 = type metadata accessor for SirenAppProvider();
  v22[3] = v10;
  v22[4] = &off_66A48;
  v22[0] = a5;
  type metadata accessor for StopSirenFlow();
  uint64_t v11 = swift_allocObject();
  uint64_t v12 = sub_597C((uint64_t)v23, (uint64_t)&type metadata for EmergencyCATProvider);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v15 + 16))(v14);
  uint64_t v16 = sub_597C((uint64_t)v22, v10);
  __chkstk_darwin(v16);
  long long v18 = (void *)((char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v19 + 16))(v18);
  memcpy(__dst, v14, sizeof(__dst));
  uint64_t v20 = sub_46DB4(a1, __dst, a3, a4, *v18, v11);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v22);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v23);
  return v20;
}

uint64_t sub_47B54(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_2E18(&qword_6BCA8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = &v24[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v9 = type metadata accessor for ConfirmationFlowConfigModel();
  uint64_t v10 = (int *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = &v24[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v11);
  uint64_t v15 = &v24[-v14 - 8];
  uint64_t v31 = &type metadata for EmergencyCATProvider;
  uint64_t v32 = &off_66E10;
  v30[0] = swift_allocObject();
  memcpy((void *)(v30[0] + 16), a2, 0x70uLL);
  sub_3048(a1, (uint64_t)v27);
  sub_3048((uint64_t)v30, (uint64_t)v28);
  sub_F978((uint64_t)v34);
  sub_F87C((uint64_t)v34, (uint64_t)v29);
  sub_2EFC((uint64_t)a2);
  sub_F8D8();
  uint64_t v16 = sub_531D0();
  sub_F924((uint64_t)v27);
  sub_2C00(v30, (uint64_t)v31);
  swift_retain();
  sub_25BF4();
  swift_release();
  sub_2C00(v30, (uint64_t)v31);
  swift_retain();
  sub_25C54();
  swift_release();
  sub_32020((uint64_t)v8, (uint64_t)v15);
  *(void *)&v15[v10[8]] = v16;
  *(void *)&v15[v10[9]] = 2;
  v15[v10[10]] = 0;
  v15[v10[11]] = 1;
  v27[0] = 0;
  v27[1] = 0xE000000000000000;
  v27[2] = 0;
  v27[3] = 0xE000000000000000;
  v27[4] = 0;
  v28[0] = 0xE000000000000000;
  v28[1] = 0xD000000000000012;
  void v28[2] = 0x8000000000058CD0;
  uint64_t v28[3] = 0;
  v28[4] = 0xE000000000000000;
  v29[0] = 0;
  v29[1] = 0xE000000000000000;
  v29[2] = 0;
  uint64_t v29[3] = 0xE000000000000000;
  v29[4] = 0;
  void v29[5] = 0xE000000000000000;
  sub_3048(a1, (uint64_t)v26);
  sub_3048((uint64_t)v30, (uint64_t)v25);
  sub_5920(a3, (uint64_t)v24);
  uint64_t v17 = sub_597C((uint64_t)v25, v25[3]);
  __chkstk_darwin(v17);
  uint64_t v19 = &v24[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(unsigned char *))(v20 + 16))(v19);
  sub_48EC4((uint64_t)v15, (uint64_t)v13, (void (*)(void))type metadata accessor for ConfirmationFlowConfigModel);
  memcpy(v33, v19, sizeof(v33));
  swift_retain();
  uint64_t v21 = sub_51858(v27, (uint64_t)v13, v26, v33, (uint64_t)v24, 0, 0, 0);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v25);
  swift_release();
  sub_48F18((uint64_t)v15, (void (*)(void))type metadata accessor for ConfirmationFlowConfigModel);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v30);
  return v21;
}

uint64_t sub_47F10(long long *a1, const void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v25[3] = &type metadata for EmergencyCATProvider;
  v25[4] = &off_66E10;
  v25[0] = swift_allocObject();
  memcpy((void *)(v25[0] + 16), a2, 0x70uLL);
  uint64_t v12 = type metadata accessor for SirenAppProvider();
  void v24[3] = v12;
  v24[4] = &off_66A48;
  v24[0] = a5;
  type metadata accessor for StartSirenFlow();
  uint64_t v13 = swift_allocObject();
  uint64_t v14 = sub_597C((uint64_t)v25, (uint64_t)&type metadata for EmergencyCATProvider);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v17 + 16))(v16);
  uint64_t v18 = sub_597C((uint64_t)v24, v12);
  __chkstk_darwin(v18);
  uint64_t v20 = (void *)((char *)v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v21 + 16))(v20);
  memcpy(__dst, v16, sizeof(__dst));
  uint64_t v22 = sub_48154(a1, __dst, a3, a4, *v20, a6, v13);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v24);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v25);
  return v22;
}

uint64_t sub_48154(long long *a1, const void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v21 = sub_53D80();
  uint64_t v22 = &protocol witness table for DeviceResolutionService;
  *(void *)&long long v20 = a6;
  *(void *)(a7 + 80) = &type metadata for EmergencyCATProvider;
  *(void *)(a7 + 88) = &off_66E10;
  uint64_t v14 = swift_allocObject();
  *(void *)(a7 + 56) = v14;
  memcpy((void *)(v14 + 16), a2, 0x70uLL);
  uint64_t v18 = type metadata accessor for SirenAppProvider();
  uint64_t v19 = &off_66A48;
  *(void *)&long long v17 = a5;
  sub_5F28(a1, a7 + 16);
  long long v15 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a7 + 96) = *(_OWORD *)a3;
  *(_OWORD *)(a7 + 112) = v15;
  *(void *)(a7 + 128) = *(void *)(a3 + 32);
  *(unsigned char *)(a7 + 136) = a4;
  sub_5F28(&v17, a7 + 144);
  sub_5F28(&v20, a7 + 184);
  return a7;
}

uint64_t sub_48258(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, __int16 a5)
{
  v18[3] = &type metadata for EmergencyCATProvider;
  uint64_t v18[4] = &off_66E10;
  v18[0] = swift_allocObject();
  memcpy((void *)(v18[0] + 16), a2, 0x70uLL);
  type metadata accessor for OfflineFlow();
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = sub_597C((uint64_t)v18, (uint64_t)&type metadata for EmergencyCATProvider);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v18[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v14 + 16))(v13);
  memcpy(__dst, v13, sizeof(__dst));
  uint64_t v15 = sub_469BC(a1, __dst, a3, a4, a5, v10);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v18);
  return v15;
}

uint64_t sub_483D0(uint64_t a1)
{
  uint64_t v2 = sub_53DB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = type metadata accessor for EmergencyNLIntent();
  uint64_t v36 = sub_48E20(&qword_6C3E8, (void (*)(uint64_t))type metadata accessor for EmergencyNLIntent);
  uint64_t v6 = sub_5DC4(v34);
  sub_48EC4(a1, (uint64_t)v6, (void (*)(void))type metadata accessor for EmergencyNLIntent);
  sub_2C00(v34, v35);
  if (qword_6B908 != -1) {
    swift_once();
  }
  sub_48E20(&qword_6C0B0, (void (*)(uint64_t))type metadata accessor for EmergencyNLIntent);
  sub_537F0();
  if (LOBYTE(v32[0]) - 6 <= 3)
  {
    uint64_t v7 = 1;
    goto LABEL_18;
  }
  sub_2C00(v34, v35);
  sub_537F0();
  if (LOBYTE(v32[0]) == 35)
  {
    sub_3048((uint64_t)v34, (uint64_t)v32);
  }
  else
  {
    if (sub_53CF0() == 0xD00000000000001ALL && v8 == 0x8000000000057AF0)
    {
      swift_bridgeObjectRelease();
      sub_3048((uint64_t)v34, (uint64_t)v32);
LABEL_16:
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v32);
LABEL_17:
      uint64_t v7 = 3;
      goto LABEL_18;
    }
    char v10 = sub_53FE0();
    swift_bridgeObjectRelease();
    sub_3048((uint64_t)v34, (uint64_t)v32);
    if (v10) {
      goto LABEL_16;
    }
  }
  sub_2C00(v32, v33);
  sub_537F0();
  if (LOBYTE(v31[0]) == 35)
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v32);
    goto LABEL_20;
  }
  if (sub_53CF0() == 0xD00000000000001BLL && v9 == 0x8000000000058CB0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  char v12 = sub_53FE0();
  swift_bridgeObjectRelease();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v32);
  if (v12) {
    goto LABEL_17;
  }
LABEL_20:
  sub_2C00(v34, v35);
  if (qword_6B900 != -1) {
    swift_once();
  }
  sub_537F0();
  if (!LOBYTE(v31[0]))
  {
    uint64_t v7 = 2;
    goto LABEL_18;
  }
  if (LOBYTE(v31[0]) == 1)
  {
    sub_2C00(v34, v35);
    if (qword_6B920 != -1) {
      swift_once();
    }
    sub_537F0();
    if (LOBYTE(v31[0]) == 2) {
      goto LABEL_60;
    }
    if (v31[0])
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v13 = sub_53FE0();
      swift_bridgeObjectRelease();
      if ((v13 & 1) == 0) {
        goto LABEL_60;
      }
    }
LABEL_55:
    uint64_t v7 = 8;
    goto LABEL_18;
  }
  if (LOBYTE(v31[0]) != 8)
  {
    uint64_t v14 = sub_53D90();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v14, v2);
    sub_3048((uint64_t)v34, (uint64_t)v32);
    uint64_t v15 = sub_53DA0();
    os_log_type_t v16 = sub_53EA0();
    if (os_log_type_enabled(v15, v16))
    {
      long long v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      v29[0] = v27;
      int v26 = v17;
      *(_DWORD *)long long v17 = 136315138;
      v25[1] = v17 + 4;
      sub_2C00(v32, v33);
      sub_537F0();
      sub_2E18(&qword_6DD90);
      uint64_t v18 = sub_53ED0();
      uint64_t v28 = sub_50F10(v18, v19, v29);
      sub_53EF0();
      swift_bridgeObjectRelease();
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v32);
      _os_log_impl(&dword_0, v15, v16, "Encountered unsupported verb in NLIntent: %s", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v32);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v7 = 17;
    goto LABEL_18;
  }
  sub_2C00(v34, v35);
  if (qword_6B920 != -1) {
    swift_once();
  }
  sub_537F0();
  if (LOBYTE(v31[0]) == 2)
  {
    sub_3048((uint64_t)v34, (uint64_t)v31);
LABEL_40:
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v31);
    goto LABEL_41;
  }
  if (v31[0])
  {
    swift_bridgeObjectRelease();
    sub_3048((uint64_t)v34, (uint64_t)v31);
  }
  else
  {
    char v20 = sub_53FE0();
    swift_bridgeObjectRelease();
    sub_3048((uint64_t)v34, (uint64_t)v31);
    if ((v20 & 1) == 0) {
      goto LABEL_40;
    }
  }
  sub_2C00(v31, v31[3]);
  if (qword_6B918 != -1) {
    swift_once();
  }
  sub_537F0();
  int v21 = LOBYTE(v29[0]);
  sub_3048((uint64_t)v31, (uint64_t)v29);
  if (v21 != 4)
  {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v29);
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v31);
    goto LABEL_55;
  }
  sub_2C00(v29, v30);
  sub_537F0();
  int v22 = v28;
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v29);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v31);
  if (v22 != 35) {
    goto LABEL_55;
  }
LABEL_41:
  sub_2C00(v34, v35);
  sub_537F0();
  if (LOBYTE(v29[0]) != 2)
  {
    if (v29[0])
    {
      char v23 = sub_53FE0();
      swift_bridgeObjectRelease();
      sub_3048((uint64_t)v34, (uint64_t)v29);
      if ((v23 & 1) == 0) {
        goto LABEL_61;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_3048((uint64_t)v34, (uint64_t)v29);
    }
    sub_2C00(v29, v30);
    if (qword_6B918 != -1) {
      swift_once();
    }
    sub_537F0();
    int v24 = v28;
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v29);
    if (v24 == 4) {
      goto LABEL_62;
    }
LABEL_60:
    uint64_t v7 = 4;
    goto LABEL_18;
  }
  sub_3048((uint64_t)v34, (uint64_t)v29);
LABEL_61:
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v29);
LABEL_62:
  sub_2C00(v34, v35);
  if (qword_6B918 != -1) {
    swift_once();
  }
  sub_537F0();
  if (v28 == 4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 5;
  }
LABEL_18:
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v34);
  return v7;
}

uint64_t sub_48D80()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 128, 7);
}

uint64_t sub_48E20(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_48E70()
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 16);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 56);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 96);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 136);

  return _swift_deallocObject(v0, 176, 7);
}

uint64_t sub_48EC4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_6188();
  uint64_t v4 = sub_3F460();
  v5(v4);
  return a2;
}

uint64_t sub_48F18(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_6188();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_48F74()
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 16);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 56);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 96);

  return _swift_deallocObject(v0, 136, 7);
}

uint64_t sub_48FBC(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = v9 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[3];
    if (v7)
    {
      uint64_t v8 = a2[4];
      *(void *)(a1 + 24) = v7;
      *(void *)(a1 + 32) = v8;
      (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    }
    else
    {
      long long v10 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v10;
      *(void *)(a1 + 32) = a2[4];
    }
    uint64_t v11 = (_OWORD *)(v4 + 40);
    char v12 = a2 + 5;
    uint64_t v13 = a2[8];
    if (v13)
    {
      uint64_t v14 = a2[9];
      *(void *)(v4 + 64) = v13;
      *(void *)(v4 + 72) = v14;
      (**(void (***)(_OWORD *, _OWORD *))(v13 - 8))(v11, v12);
    }
    else
    {
      long long v15 = *(_OWORD *)(a2 + 7);
      *uint64_t v11 = *v12;
      *(_OWORD *)(v4 + 56) = v15;
      *(void *)(v4 + 72) = a2[9];
    }
    uint64_t v16 = a3[6];
    long long v17 = (void *)(v4 + v16);
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = sub_535F0();
    if (sub_5800((uint64_t)v18, 1, v19))
    {
      uint64_t v20 = sub_2E18(&qword_6D878);
      memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
      sub_34DC((uint64_t)v17, 0, 1, v19);
    }
    uint64_t v21 = a3[7];
    long long v22 = *(_OWORD *)((char *)a2 + v21 + 24);
    *(_OWORD *)(v4 + v21 + 24) = v22;
    (**(void (***)(void))(v22 - 8))();
    uint64_t v23 = a3[8];
    long long v24 = *(_OWORD *)((char *)a2 + v23 + 24);
    *(_OWORD *)(v4 + v23 + 24) = v24;
    (**(void (***)(void))(v24 - 8))();
    uint64_t v25 = a3[9];
    long long v26 = *(_OWORD *)((char *)a2 + v25 + 24);
    *(_OWORD *)(v4 + v25 + 24) = v26;
    (**(void (***)(void))(v26 - 8))();
  }
  return v4;
}

uint64_t sub_4927C(uint64_t a1, int *a2)
{
  if (*(void *)(a1 + 24)) {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1);
  }
  if (*(void *)(a1 + 64)) {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + 40);
  }
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_535F0();
  if (!sub_5800(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + a2[7]);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + a2[8]);
  uint64_t v6 = a1 + a2[9];

  return _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v6);
}

uint64_t sub_49350(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 24);
  if (v6)
  {
    uint64_t v7 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v6;
    *(void *)(a1 + 32) = v7;
    (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }
  uint64_t v9 = (_OWORD *)(a1 + 40);
  long long v10 = (_OWORD *)(a2 + 40);
  uint64_t v11 = *(void *)(a2 + 64);
  if (v11)
  {
    uint64_t v12 = *(void *)(a2 + 72);
    *(void *)(a1 + 64) = v11;
    *(void *)(a1 + 72) = v12;
    (**(void (***)(_OWORD *, _OWORD *))(v11 - 8))(v9, v10);
  }
  else
  {
    long long v13 = *(_OWORD *)(a2 + 56);
    *uint64_t v9 = *v10;
    *(_OWORD *)(a1 + 56) = v13;
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
  }
  uint64_t v14 = a3[6];
  long long v15 = (void *)(a1 + v14);
  uint64_t v16 = (const void *)(a2 + v14);
  uint64_t v17 = sub_535F0();
  if (sub_5800((uint64_t)v16, 1, v17))
  {
    uint64_t v18 = sub_2E18(&qword_6D878);
    memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    sub_34DC((uint64_t)v15, 0, 1, v17);
  }
  uint64_t v19 = a3[7];
  long long v20 = *(_OWORD *)(a2 + v19 + 24);
  *(_OWORD *)(a1 + v19 + 24) = v20;
  (**(void (***)(void))(v20 - 8))();
  uint64_t v21 = a3[8];
  long long v22 = *(_OWORD *)(a2 + v21 + 24);
  *(_OWORD *)(a1 + v21 + 24) = v22;
  (**(void (***)(void))(v22 - 8))();
  uint64_t v23 = a3[9];
  long long v24 = *(_OWORD *)(a2 + v23 + 24);
  *(_OWORD *)(a1 + v23 + 24) = v24;
  (**(void (***)(void))(v24 - 8))();
  return a1;
}

uint64_t sub_495C0(uint64_t a1, long long *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 3);
  if (*(void *)(a1 + 24))
  {
    if (v6)
    {
      sub_87A8((uint64_t *)a1, (uint64_t *)a2);
      goto LABEL_8;
    }
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1);
  }
  else if (v6)
  {
    *(void *)(a1 + 24) = v6;
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    (**(void (***)(uint64_t, long long *))(v6 - 8))(a1, a2);
    goto LABEL_8;
  }
  long long v7 = *a2;
  long long v8 = a2[1];
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  *(_OWORD *)a1 = v7;
  *(_OWORD *)(a1 + 16) = v8;
LABEL_8:
  uint64_t v9 = *((void *)a2 + 8);
  if (*(void *)(a1 + 64))
  {
    if (v9)
    {
      sub_87A8((uint64_t *)(a1 + 40), (uint64_t *)a2 + 5);
      goto LABEL_15;
    }
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + 40);
  }
  else if (v9)
  {
    *(void *)(a1 + 64) = v9;
    *(void *)(a1 + 72) = *((void *)a2 + 9);
    (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 40, (uint64_t)a2 + 40);
    goto LABEL_15;
  }
  long long v10 = *(long long *)((char *)a2 + 40);
  long long v11 = *(long long *)((char *)a2 + 56);
  *(void *)(a1 + 72) = *((void *)a2 + 9);
  *(_OWORD *)(a1 + 40) = v10;
  *(_OWORD *)(a1 + 56) = v11;
LABEL_15:
  uint64_t v12 = a3[6];
  long long v13 = (void *)(a1 + v12);
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = sub_535F0();
  int v16 = sub_5800((uint64_t)v13, 1, v15);
  int v17 = sub_5800((uint64_t)v14, 1, v15);
  if (!v16)
  {
    uint64_t v18 = *(void *)(v15 - 8);
    if (!v17)
    {
      (*(void (**)(void *, char *, uint64_t))(v18 + 24))(v13, v14, v15);
      goto LABEL_21;
    }
    (*(void (**)(void *, uint64_t))(v18 + 8))(v13, v15);
    goto LABEL_20;
  }
  if (v17)
  {
LABEL_20:
    uint64_t v19 = sub_2E18(&qword_6D878);
    memcpy(v13, v14, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_21;
  }
  (*(void (**)(void *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  sub_34DC((uint64_t)v13, 0, 1, v15);
LABEL_21:
  sub_87A8((uint64_t *)(a1 + a3[7]), (uint64_t *)((char *)a2 + a3[7]));
  sub_87A8((uint64_t *)(a1 + a3[8]), (uint64_t *)((char *)a2 + a3[8]));
  sub_87A8((uint64_t *)(a1 + a3[9]), (uint64_t *)((char *)a2 + a3[9]));
  return a1;
}

uint64_t sub_49854(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  long long v7 = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v8);
  long long v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 56) = v7;
  uint64_t v11 = sub_535F0();
  if (sub_5800((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = sub_2E18(&qword_6D878);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    sub_34DC((uint64_t)v9, 0, 1, v11);
  }
  uint64_t v13 = a3[7];
  uint64_t v14 = a3[8];
  uint64_t v15 = a1 + v13;
  uint64_t v16 = a2 + v13;
  *(void *)(v15 + 32) = *(void *)(v16 + 32);
  long long v17 = *(_OWORD *)(v16 + 16);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  *(_OWORD *)(v15 + 16) = v17;
  uint64_t v18 = a1 + v14;
  uint64_t v19 = a2 + v14;
  *(void *)(v18 + 32) = *(void *)(v19 + 32);
  long long v20 = *(_OWORD *)(v19 + 16);
  *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  *(_OWORD *)(v18 + 16) = v20;
  uint64_t v21 = a3[9];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  long long v24 = *(_OWORD *)(v23 + 16);
  *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
  *(_OWORD *)(v22 + 16) = v24;
  *(void *)(v22 + 32) = *(void *)(v23 + 32);
  return a1;
}

uint64_t sub_499AC(uint64_t a1, uint64_t a2, int *a3)
{
  if (*(void *)(a1 + 24)) {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1);
  }
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  if (*(void *)(a1 + 64)) {
    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + 40);
  }
  long long v7 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v7;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v8);
  long long v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_535F0();
  int v12 = sub_5800((uint64_t)v9, 1, v11);
  int v13 = sub_5800((uint64_t)v10, 1, v11);
  if (!v12)
  {
    uint64_t v14 = *(void *)(v11 - 8);
    if (!v13)
    {
      (*(void (**)(void *, const void *, uint64_t))(v14 + 40))(v9, v10, v11);
      goto LABEL_11;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v9, v11);
    goto LABEL_10;
  }
  if (v13)
  {
LABEL_10:
    uint64_t v15 = sub_2E18(&qword_6D878);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_11;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  sub_34DC((uint64_t)v9, 0, 1, v11);
LABEL_11:
  uint64_t v16 = a3[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + v16);
  long long v19 = *(_OWORD *)(v18 + 16);
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  *(_OWORD *)(v17 + 16) = v19;
  *(void *)(v17 + 32) = *(void *)(v18 + 32);
  uint64_t v20 = a3[8];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + v20);
  long long v23 = *(_OWORD *)(v22 + 16);
  *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  *(_OWORD *)(v21 + 16) = v23;
  *(void *)(v21 + 32) = *(void *)(v22 + 32);
  uint64_t v24 = a3[9];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1 + v24);
  long long v27 = *(_OWORD *)(v26 + 16);
  *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
  *(_OWORD *)(v25 + 16) = v27;
  *(void *)(v25 + 32) = *(void *)(v26 + 32);
  return a1;
}

uint64_t sub_49BC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_49BDC);
}

uint64_t sub_49BDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2E18(&qword_6D878);
  sub_34B64();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return sub_5800(v9, a2, v8);
  }
  else
  {
    unint64_t v11 = *(void *)(a1 + *(int *)(a3 + 28) + 24);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_49C74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_49C88);
}

void sub_49C88(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_2E18(&qword_6D878);
  sub_34B64();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a4 + 24);
    sub_34DC(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 28) + 24) = (a2 - 1);
  }
}

void sub_49D1C()
{
  sub_49DC0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_49DC0()
{
  if (!qword_6DF08)
  {
    sub_535F0();
    unint64_t v0 = sub_53EE0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_6DF08);
    }
  }
}

char *sub_49E18@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_49E44()
{
  *(void *)(v0 + 128) = 0;
  *(_OWORD *)(v0 + 96) = 0u;
  *(_OWORD *)(v0 + 112) = 0u;
  *(void *)(v0 + 80) = 0;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 64) = 0u;
  uint64_t v2 = *(void *)(v0 + 200);
  return sub_597C(v0 + 176, v2);
}

uint64_t sub_49E74(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16) + *(int *)(a1 + 28);
  return sub_3048(v4, v2 - 224);
}

uint64_t sub_49E98()
{
  uint64_t v4 = v2 + *(int *)(v1 + 32);
  return sub_3048(v4, v0 + 176);
}

uint64_t sub_49EB4()
{
  uint64_t v4 = v2 + *(int *)(v1 + 36);
  return sub_5920(v4, v0 + 136);
}

void *sub_49EDC()
{
  return memcpy((void *)(v0 + 216), v1, 0x70uLL);
}

uint64_t sub_49EF8()
{
  *(void *)(v1 - 224) = v0;
  return 0;
}

void *sub_49F18(void *a1)
{
  uint64_t v2 = sub_2C00(a1, a1[3]);
  return memcpy((void *)(v1 + 216), v2, 0x70uLL);
}

uint64_t sub_49F4C()
{
  return swift_allocObject();
}

void sub_49F64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  sub_477E8(v22 - 224, v21 + 216, v21 + 136, v21 + 96, v21 + 48, 2, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21);
}

void sub_49F8C()
{
  sub_476B8();
}

uint64_t sub_49FD0(uint64_t a1)
{
  sub_2C00((void *)(*(void *)(v1 + 16) + *(int *)(a1 + 32)), *(void *)(*(void *)(v1 + 16) + *(int *)(a1 + 32) + 24));
  return swift_retain();
}

uint64_t sub_4A010()
{
  return v0 - 224;
}

uint64_t sub_4A028()
{
  return sub_53F10();
}

void *sub_4A05C(void *a1)
{
  return memcpy(a1, v1, 0x70uLL);
}

uint64_t sub_4A074()
{
  return v0 - 224;
}

uint64_t sub_4A0B0()
{
  uint64_t v0 = sub_53DB0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_53D90();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = sub_53DA0();
  os_log_type_t v6 = sub_53E90();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "InfoDomainFallbackFlow onInput", v7, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 1;
}

uint64_t sub_4A21C(uint64_t a1)
{
  v1[5] = a1;
  uint64_t v2 = sub_53250();
  v1[6] = v2;
  sub_FDFC(v2);
  v1[7] = v3;
  v1[8] = swift_task_alloc();
  uint64_t v4 = sub_53DB0();
  v1[9] = v4;
  sub_FDFC(v4);
  v1[10] = v5;
  v1[11] = swift_task_alloc();
  return _swift_task_switch(sub_4A2F0, 0, 0);
}

uint64_t sub_4A2F0()
{
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_53D90();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_53DA0();
  os_log_type_t v6 = sub_53E90();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "InfoDomainFallbackFlow execute", v7, 2u);
    swift_slowDealloc();
  }
  uint64_t v9 = v0[10];
  uint64_t v8 = v0[11];
  uint64_t v11 = v0[8];
  uint64_t v10 = v0[9];
  uint64_t v12 = v0[6];
  uint64_t v13 = v0[7];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  (*(void (**)(uint64_t, void, uint64_t))(v13 + 104))(v11, enum case for FlowUnhandledReason.needsInfoDomainFallback(_:), v12);
  sub_53470();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_4A498()
{
  return sub_531E0();
}

uint64_t type metadata accessor for InfoDomainFallbackFlow()
{
  return self;
}

uint64_t sub_4A518()
{
  return 1;
}

uint64_t sub_4A534()
{
  return sub_4A498();
}

uint64_t sub_4A558(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_568C;
  return sub_4A21C(a1);
}

uint64_t sub_4A5F0()
{
  type metadata accessor for InfoDomainFallbackFlow();

  return sub_53230();
}

unint64_t sub_4A628()
{
  unint64_t result = qword_6DE60;
  if (!qword_6DE60)
  {
    type metadata accessor for InfoDomainFallbackFlow();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6DE60);
  }
  return result;
}

uint64_t sub_4A674(uint64_t a1)
{
  uint64_t v2 = sub_535F0();
  sub_9120();
  uint64_t v66 = v3;
  __chkstk_darwin(v4);
  sub_25278();
  uint64_t v7 = (char *)(v5 - v6);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v63 - v9;
  sub_53DB0();
  sub_9120();
  uint64_t v67 = v12;
  uint64_t v68 = v11;
  __chkstk_darwin(v11);
  sub_25278();
  uint64_t v15 = v13 - v14;
  uint64_t v17 = __chkstk_darwin(v16);
  long long v19 = (char *)&v63 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v63 - v20;
  uint64_t v23 = sub_535D0();
  uint64_t v24 = v22;
  if (v23 == 0xD00000000000003FLL && v22 == 0x8000000000058140 || (sub_4BAFC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  if (v23 == 0xD000000000000034 && v24 == 0x8000000000058DA0 || (sub_4BAFC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  if (v23 == 0xD000000000000035 && v24 == 0x8000000000057B10)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v26 = sub_4BAFC();
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0)
    {
      sub_53D90();
      sub_6108();
      uint64_t v47 = v67;
      sub_FE98();
      v48();
      long long v49 = *(void (**)(char *, uint64_t, uint64_t))(v66 + 16);
      v49(v10, a1, v2);
      uint64_t v50 = sub_53DA0();
      os_log_type_t v51 = sub_53EA0();
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v52 = swift_slowAlloc();
        os_log_t v64 = v50;
        long long v53 = (uint8_t *)v52;
        uint64_t v65 = swift_slowAlloc();
        v69[0] = v65;
        *(_DWORD *)long long v53 = 136315138;
        uint64_t v63 = v53 + 4;
        v49(v7, (uint64_t)v10, v2);
        uint64_t v54 = sub_53E10();
        uint64_t v56 = sub_50F10(v54, v55, v69);
        sub_4BBA8(v56);
        sub_53EF0();
        swift_bridgeObjectRelease();
        uint64_t v57 = sub_4BB50();
        v58(v57);
        os_log_t v59 = v64;
        _os_log_impl(&dword_0, v64, v51, "Encountered unsupported invocation in flow router: %s", v53, 0xCu);
        swift_arrayDestroy();
        sub_60F0();
        sub_60F0();

        (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v15, v68);
      }
      else
      {
        uint64_t v60 = sub_4BB50();
        v61(v60);

        (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v15, v68);
      }
      return 17;
    }
  }
  uint64_t v27 = sub_535E0();
  if (!v27)
  {
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v31 = v68;
    goto LABEL_21;
  }
  uint64_t v28 = v27;
  uint64_t v29 = sub_53D30();
  sub_2C2BC(v29, v30, v28, &v70);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v31 = v68;
  if (!*((void *)&v71 + 1))
  {
LABEL_21:
    sub_2C25C((uint64_t)&v70);
    goto LABEL_22;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_22:
    uint64_t v41 = v67;
    sub_53D90();
    sub_6108();
    sub_FE98();
    v42();
    uint64_t v43 = sub_53DA0();
    os_log_type_t v44 = sub_53EA0();
    if (os_log_type_enabled(v43, v44))
    {
      int v45 = (uint8_t *)swift_slowAlloc();
      v69[0] = swift_slowAlloc();
      *(_DWORD *)int v45 = 136315138;
      uint64_t v46 = sub_4BB84((uint64_t)"dispatch(invocation:)");
      sub_4BBA8(v46);
      sub_53EF0();
      _os_log_impl(&dword_0, v43, v44, "%s Missing emergencySituation payload.", v45, 0xCu);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();
    }

    (*(void (**)(char *, uint64_t))(v41 + 8))(v19, v31);
    return 17;
  }
  uint64_t v33 = v69[0];
  unint64_t v32 = v69[1];
  sub_53CE0();
  sub_4BB1C();
  if (!v35)
  {
    char v62 = v34;
    swift_bridgeObjectRelease();
    return sub_4B210(v62, 2);
  }
  sub_53D90();
  sub_6108();
  uint64_t v36 = v67;
  sub_FE98();
  v37();
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_53DA0();
  os_log_type_t v39 = sub_53EA0();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = swift_slowAlloc();
    uint64_t v66 = swift_slowAlloc();
    v69[0] = v66;
    *(_DWORD *)uint64_t v40 = 136315394;
    uint64_t v72 = sub_4BB84((uint64_t)"dispatch(invocation:)");
    sub_53EF0();
    *(_WORD *)(v40 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v72 = sub_50F10(v33, v32, v69);
    sub_53EF0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v38, v39, "%s Failed to create an EmergencySituation enum from payload value: %s.", (uint8_t *)v40, 0x16u);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();

    (*(void (**)(char *, uint64_t))(v36 + 8))(v21, v68);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v21, v31);
  }
  return 17;
}

uint64_t sub_4AD8C(void *a1)
{
  sub_2C00(a1, a1[3]);
  uint64_t v2 = sub_4BAE8();
  char v4 = v3(v2);
  uint64_t result = 17;
  switch(v4)
  {
    case 1:
      uint64_t v15 = sub_4BA68();
      char v17 = v16(v15);
      if (v17 == 2) {
        return 4;
      }
      if (v17) {
        goto LABEL_57;
      }
      char v18 = sub_4BAA4();
      sub_4BB68();
      if (v18) {
        return 8;
      }
      return 4;
    case 2:
    case 6:
    case 7:
      uint64_t v6 = sub_4BA2C();
      v7(v6);
      sub_4BB1C();
      if (v11)
      {
        sub_3048((uint64_t)a1, (uint64_t)v53);
      }
      else
      {
        uint64_t v13 = sub_53CF0();
        if (v13 == 0xD00000000000001ALL && v14 == 0x8000000000057AF0)
        {
          swift_bridgeObjectRelease();
          sub_3048((uint64_t)a1, (uint64_t)v53);
LABEL_36:
          _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v53);
          return 3;
        }
        char v24 = sub_53FE0();
        swift_bridgeObjectRelease();
        sub_3048((uint64_t)a1, (uint64_t)v53);
        if (v24) {
          goto LABEL_36;
        }
      }
      uint64_t v25 = v54;
      uint64_t v26 = v55;
      sub_2C00(v53, v54);
      (*(void (**)(uint64_t, uint64_t))(v26 + 24))(v25, v26);
      sub_4BB1C();
      if (v11)
      {
        _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v53);
      }
      else
      {
        uint64_t v29 = sub_53CF0();
        if (v29 == 0xD00000000000001BLL && v30 == 0x8000000000058CB0)
        {
          swift_bridgeObjectRelease();
          goto LABEL_36;
        }
        char v44 = sub_53FE0();
        swift_bridgeObjectRelease();
        _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v53);
        if (v44) {
          return 3;
        }
      }
      uint64_t v27 = sub_4BA2C();
      if ((v28(v27) - 6) <= 3u) {
        return 1;
      }
      uint64_t v31 = sub_4BA68();
      char v33 = v32(v31);
      if (v33 == 2) {
        goto LABEL_39;
      }
      if ((v33 & 1) == 0)
      {
        sub_4BB68();
        return 4;
      }
      char v46 = sub_53FE0();
      swift_bridgeObjectRelease();
      if (v46) {
        return 4;
      }
LABEL_39:
      uint64_t v34 = sub_4BA68();
      char v36 = v35(v34);
      if (v36 == 2) {
        goto LABEL_40;
      }
      if (v36)
      {
LABEL_57:
        swift_bridgeObjectRelease();
        return 8;
      }
      char v45 = sub_4BAA4();
      sub_4BB68();
      if (v45) {
        return 8;
      }
LABEL_40:
      sub_2C00(a1, a1[3]);
      uint64_t v37 = sub_4BAE8();
      if (v38(v37) != 4) {
        return 5;
      }
      sub_2C00(a1, a1[3]);
      uint64_t v39 = sub_4BAE8();
      if (v40(v39) == 3)
      {
        uint64_t v41 = sub_4BA2C();
        v42(v41);
        sub_4BB1C();
        int v43 = v11;
        return (16 * v43);
      }
      else
      {
        uint64_t v47 = sub_4BA2C();
        char v49 = v48(v47);
        uint64_t v50 = a1[3];
        uint64_t v51 = a1[4];
        sub_2C00(a1, v50);
        int v52 = (*(uint64_t (**)(uint64_t, uint64_t))(v51 + 56))(v50, v51);
        return sub_4B210(v49, v52);
      }
    case 3:
    case 4:
      uint64_t v8 = sub_4BA2C();
      v9(v8);
      sub_4BB1C();
      if (v11) {
        return 17;
      }
      BOOL v11 = sub_53CF0() == 0x6E65726973 && v10 == 0xE500000000000000;
      if (v11)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v12 = sub_4BB28();
        swift_bridgeObjectRelease();
        if ((v12 & 1) == 0) {
          return 17;
        }
      }
      return 9;
    case 5:
      uint64_t v19 = sub_4BA2C();
      v20(v19);
      sub_4BB1C();
      if (v11) {
        return 17;
      }
      if (sub_53CF0() == 0x6E65726973 && v21 == 0xE500000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v23 = sub_4BB28();
        swift_bridgeObjectRelease();
        if ((v23 & 1) == 0) {
          return 17;
        }
      }
      return 10;
    case 8:
      return result;
    default:
      return 2;
  }
}

uint64_t sub_4B210(char a1, int a2)
{
  int v62 = a2;
  uint64_t v3 = sub_53DB0();
  sub_9120();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_25278();
  uint64_t v9 = v7 - v8;
  __chkstk_darwin(v10);
  char v12 = (char *)&v52 - v11;
  if (qword_6B930 != -1) {
    swift_once();
  }
  uint64_t v13 = *(void *)(qword_6E3B0 + 16);
  uint64_t v57 = v9;
  if (!v13)
  {
LABEL_37:
    sub_53D90();
    sub_6108();
    sub_FE98();
    v30();
    uint64_t v31 = sub_53DA0();
    os_log_type_t v32 = sub_53EA0();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 136315394;
      LOBYTE(v63) = a1;
      sub_2E18(&qword_6CC58);
      uint64_t v34 = sub_53ED0();
      uint64_t v63 = sub_4BBBC(v34, v35);
      sub_53EF0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2080;
      LOBYTE(v63) = v62;
      sub_2E18(&qword_6E010);
      uint64_t v36 = sub_53ED0();
      uint64_t v63 = sub_4BBBC(v36, v37);
      sub_53EF0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v31, v32, "No Action found for Situation [%s] and Severity [%s]. Returning Fallback response.", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v57, v3);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
    }
    return 16;
  }
  long long v53 = v12;
  uint64_t v55 = v5;
  uint64_t v56 = v3;
  uint64_t v54 = swift_bridgeObjectRetain();
  uint64_t v14 = (unsigned __int8 *)(v54 + 34);
  uint64_t v61 = (uint64_t)"crisisSituationHigh";
  unint64_t v59 = (unint64_t)"dispatch(invocation:)";
  unint64_t v60 = 0x8000000000058E20;
  unint64_t v58 = 0x8000000000058E00;
  while (1)
  {
    if (a1 != 35)
    {
      int v15 = *(v14 - 1);
      uint64_t v16 = *v14;
      uint64_t v17 = sub_53CF0();
      uint64_t v19 = v18;
      if (v17 == sub_53CF0() && v19 == v20)
      {
        int v23 = v62;
        swift_bridgeObjectRelease_n();
        if (v23 == 3) {
          goto LABEL_35;
        }
      }
      else
      {
        char v22 = sub_53FE0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v22 & 1) == 0 || v62 == 3) {
          goto LABEL_35;
        }
      }
      unint64_t v24 = 0x8000000000058E40;
      if (v15)
      {
        if (v15 == 1) {
          unint64_t v25 = 0xD000000000000015;
        }
        else {
          unint64_t v25 = 0xD000000000000013;
        }
        if (v15 == 1) {
          unint64_t v26 = v61 | 0x8000000000000000;
        }
        else {
          unint64_t v26 = v59 | 0x8000000000000000;
        }
      }
      else
      {
        unint64_t v25 = 0xD000000000000012;
        unint64_t v26 = 0x8000000000058E40;
      }
      if ((_BYTE)v62)
      {
        if (v62 == 1) {
          unint64_t v27 = 0xD000000000000015;
        }
        else {
          unint64_t v27 = 0xD000000000000013;
        }
        if (v62 == 1) {
          unint64_t v24 = v60;
        }
        else {
          unint64_t v24 = v58;
        }
      }
      else
      {
        unint64_t v27 = 0xD000000000000012;
      }
      if (v25 == v27 && v26 == v24)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        goto LABEL_43;
      }
      char v29 = sub_53FE0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v29) {
        break;
      }
    }
LABEL_35:
    v14 += 3;
    if (!--v13)
    {
      swift_bridgeObjectRelease();
      uint64_t v5 = v55;
      uint64_t v3 = v56;
      uint64_t v9 = v57;
      goto LABEL_37;
    }
  }
  swift_bridgeObjectRelease();
LABEL_43:
  sub_53D90();
  sub_6108();
  uint64_t v38 = v55;
  uint64_t v39 = v56;
  uint64_t v40 = v53;
  sub_FE98();
  v41();
  uint64_t v42 = sub_53DA0();
  os_log_type_t v43 = sub_53E90();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = swift_slowAlloc();
    uint64_t v61 = swift_slowAlloc();
    uint64_t v64 = v61;
    *(_DWORD *)uint64_t v44 = 136315650;
    LOBYTE(v63) = v16;
    uint64_t v45 = sub_53E10();
    uint64_t v63 = sub_50F10(v45, v46, &v64);
    sub_53EF0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2080;
    LOBYTE(v63) = a1;
    sub_2E18(&qword_6CC58);
    uint64_t v47 = sub_53ED0();
    uint64_t v63 = sub_4BBBC(v47, v48);
    sub_53EF0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 22) = 2080;
    LOBYTE(v63) = v62;
    sub_2E18(&qword_6E010);
    uint64_t v49 = sub_53ED0();
    uint64_t v63 = sub_4BBBC(v49, v50);
    sub_53EF0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v42, v43, "Found Action [%s] for Situation [%s] and Severity [%s]", (uint8_t *)v44, 0x20u);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();
  }

  (*(void (**)(char *, uint64_t))(v38 + 8))(v40, v39);
  return v16;
}

void sub_4B83C()
{
  qword_6E3B0 = (uint64_t)&off_65BF0;
}

uint64_t getEnumTagSinglePayload for DispatchAction(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xEF)
  {
    if (a2 + 17 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 17) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 18;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x12;
  int v5 = v6 - 18;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for DispatchAction(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 17 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 17) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xEF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEE)
  {
    unsigned int v6 = ((a2 - 239) >> 8) + 1;
    *uint64_t result = a2 + 17;
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
        JUMPOUT(0x4B9A4);
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
          *uint64_t result = a2 + 17;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DispatchAction()
{
  return &type metadata for DispatchAction;
}

unint64_t sub_4B9E0()
{
  unint64_t result = qword_6E018;
  if (!qword_6E018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6E018);
  }
  return result;
}

uint64_t sub_4BA2C()
{
  uint64_t v1 = v0[3];
  sub_2C00(v0, v1);
  return v1;
}

uint64_t sub_4BA68()
{
  uint64_t v1 = v0[3];
  sub_2C00(v0, v1);
  return v1;
}

uint64_t sub_4BAA4()
{
  return sub_53FE0();
}

uint64_t sub_4BAE8()
{
  return v0;
}

uint64_t sub_4BAFC()
{
  return sub_53FE0();
}

uint64_t sub_4BB28()
{
  return sub_53FE0();
}

uint64_t sub_4BB50()
{
  return v0;
}

uint64_t sub_4BB68()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_4BB84@<X0>(uint64_t a1@<X8>)
{
  return sub_50F10(0xD000000000000015, (a1 - 32) | 0x8000000000000000, (uint64_t *)(v1 - 144));
}

uint64_t sub_4BBA8(uint64_t a1)
{
  *(void *)(v1 - 88) = a1;
  return v1 - 88;
}

uint64_t sub_4BBBC(uint64_t a1, unint64_t a2)
{
  return sub_50F10(a1, a2, (uint64_t *)(v2 - 112));
}

uint64_t initializeWithCopy for EmergencyFeatureFlagsManager(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for EmergencyFeatureFlagsManager(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

__n128 initializeWithTake for EmergencyFeatureFlagsManager(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for EmergencyFeatureFlagsManager(uint64_t a1, uint64_t a2)
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for EmergencyFeatureFlagsManager(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EmergencyFeatureFlagsManager(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EmergencyFeatureFlagsManager()
{
  return &type metadata for EmergencyFeatureFlagsManager;
}

id sub_4BD40()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = sub_53DF0();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithIdentifier:v1];

  return v2;
}

uint64_t sub_4BDB4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_53670();
  uint64_t v5 = sub_FEC4(v4);
  __chkstk_darwin(v5);
  sub_6150();
  uint64_t v130 = v6;
  uint64_t v133 = sub_53CD0();
  sub_6188();
  __chkstk_darwin(v7);
  sub_612C();
  sub_FDEC();
  __chkstk_darwin(v8);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v127 - v10;
  uint64_t v136 = sub_53620();
  sub_60C0();
  uint64_t v135 = v12;
  __chkstk_darwin(v13);
  sub_6150();
  uint64_t v137 = v14;
  sub_53600();
  sub_60C0();
  uint64_t v141 = v16;
  uint64_t v142 = v15;
  __chkstk_darwin(v15);
  sub_6150();
  uint64_t v140 = v17;
  uint64_t v18 = sub_535B0();
  sub_60C0();
  uint64_t v20 = v19;
  __chkstk_darwin(v21);
  sub_6140();
  uint64_t v24 = v23 - v22;
  uint64_t v25 = sub_53DB0();
  sub_60C0();
  uint64_t v27 = v26;
  __chkstk_darwin(v28);
  sub_612C();
  uint64_t v139 = v29;
  __chkstk_darwin(v30);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v31);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v32);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v33);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v34);
  sub_FF3C();
  sub_FDEC();
  __chkstk_darwin(v35);
  unint64_t v37 = (char *)&v127 - v36;
  uint64_t v38 = sub_53D90();
  sub_6108();
  uint64_t v144 = v38;
  uint64_t v145 = v27;
  char v146 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 16);
  uint64_t v147 = v25;
  uint64_t v143 = v27 + 16;
  v146(v37, v38, v25);
  uint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
  uint64_t v138 = a1;
  v39(v24, a1, v18);
  uint64_t v40 = sub_53DA0();
  os_log_type_t v41 = sub_53E90();
  BOOL v42 = os_log_type_enabled(v40, v41);
  unsigned int v131 = v11;
  if (v42)
  {
    os_log_type_t v43 = (uint8_t *)sub_1001C();
    uint64_t v44 = sub_15284();
    uint64_t v128 = v2;
    v150[0] = v44;
    *(_DWORD *)os_log_type_t v43 = 136315138;
    uint64_t v127 = v43 + 4;
    sub_51BBC(&qword_6C3D8, 255, (void (*)(uint64_t))&type metadata accessor for Input);
    uint64_t v45 = sub_53FD0();
    v148[0] = sub_50F10(v45, v46, v150);
    sub_53EF0();
    swift_bridgeObjectRelease();
    uint64_t v47 = sub_51F6C();
    v48(v47);
    _os_log_impl(&dword_0, v40, v41, "#StartSirenFlow onInput: %s", v43, 0xCu);
    swift_arrayDestroy();
    uint64_t v2 = v128;
    sub_60F0();
    sub_60F0();
  }
  else
  {
    uint64_t v49 = sub_51F6C();
    v50(v49);
  }

  uint64_t v51 = *(void (**)(void))(v145 + 8);
  sub_6120();
  v51();
  sub_2C00((void *)(v2 + 16), *(void *)(v2 + 40));
  sub_2B7BC();
  sub_1B764();
  v52();
  sub_2C00(v150, (uint64_t)v151);
  sub_2B7BC();
  char v53 = sub_53370();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v150);
  uint64_t v54 = v144;
  if ((v53 & 1) == 0)
  {
    sub_6108();
    uint64_t v64 = sub_51DA8();
    v65(v64);
    uint64_t v66 = (void *)sub_53DA0();
    os_log_type_t v67 = sub_53E90();
    if (sub_FF7C(v67))
    {
      uint64_t v68 = (_WORD *)sub_61F0();
      sub_61CC(v68);
      sub_FED0(&dword_0, v69, v70, "#StartSirenFlow Not on watch. Flagging for remote execution.");
      sub_60F0();
    }

    sub_6120();
    v51();
    *(unsigned char *)(v2 + 136) = 3;
    return 1;
  }
  uint64_t v55 = v140;
  sub_535A0();
  int v56 = (*(uint64_t (**)(uint64_t, uint64_t))(v141 + 88))(v55, v142);
  if (v56 == enum case for Parse.NLv3IntentOnly(_:))
  {
    sub_6108();
    uint64_t v57 = sub_51DA8();
    v58(v57);
    unint64_t v59 = (void *)sub_53DA0();
    os_log_type_t v60 = sub_53E90();
    if (sub_FF7C(v60))
    {
      uint64_t v61 = (_WORD *)sub_61F0();
      sub_61CC(v61);
      sub_FED0(&dword_0, v62, v63, "#StartSirenFlow onInput .NLv3IntentOnly");
      sub_60F0();
    }
LABEL_15:

    sub_6120();
    v51();
    *(unsigned char *)(v2 + 136) = 2;
    (*(void (**)(uint64_t, uint64_t))(v141 + 8))(v140, v142);
    return 1;
  }
  if (v56 == enum case for Parse.directInvocation(_:))
  {
    sub_6108();
    uint64_t v71 = sub_51DA8();
    v72(v71);
    unint64_t v59 = (void *)sub_53DA0();
    os_log_type_t v73 = sub_53E90();
    if (sub_FF7C(v73))
    {
      uint64_t v74 = (_WORD *)sub_61F0();
      sub_61CC(v74);
      sub_FED0(&dword_0, v75, v76, "#StartSirenFlow onInput directInvocation");
      sub_60F0();
    }
    goto LABEL_15;
  }
  if (v56 != enum case for Parse.uso(_:))
  {
    sub_6108();
    v146(v132, v54, v147);
    char v91 = sub_53DA0();
    os_log_type_t v92 = sub_53EA0();
    if (os_log_type_enabled(v91, v92))
    {
      uint64_t v93 = (uint8_t *)sub_1001C();
      v148[0] = sub_15284();
      *(_DWORD *)uint64_t v93 = 136315138;
      LOBYTE(v149) = 0;
      uint64_t v94 = sub_53E10();
      uint64_t v149 = sub_50F10(v94, v95, v148);
      sub_53EF0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v91, v92, "%s", v93, 0xCu);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();
    }

    sub_6120();
    v51();
    uint64_t v109 = v140;
    uint64_t v111 = *(void (**)(uint64_t, uint64_t))(v141 + 8);
    uint64_t v110 = v142;
    goto LABEL_34;
  }
  uint64_t v78 = v140;
  (*(void (**)(uint64_t, uint64_t))(v141 + 96))(v140, v142);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v135 + 32))(v137, v78, v136);
  sub_6108();
  uint64_t v79 = sub_51DA8();
  v80(v79);
  uint64_t v81 = (void *)sub_53DA0();
  os_log_type_t v82 = sub_53E90();
  if (sub_FF7C(v82))
  {
    uint64_t v83 = (_WORD *)sub_61F0();
    sub_61CC(v83);
    sub_FED0(&dword_0, v84, v85, "#StartSirenFlow onInput .uso");
    sub_60F0();
  }

  uint64_t v86 = sub_51F80((uint64_t)&v154);
  ((void (*)(uint64_t))v51)(v86);
  sub_53610();
  uint64_t v151 = &type metadata for EmergencyFeatureFlagsKey;
  unint64_t v152 = sub_F998();
  LOBYTE(v150[0]) = 2;
  uint64_t v87 = sub_53640();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v150);
  uint64_t v88 = (uint64_t)v131;
  sub_53CC0();
  uint64_t v90 = *(unsigned __int8 *)(v88 + *(int *)(v133 + 24));
  if (v90 != 35)
  {
    if (sub_53CF0() == 0x6E65726973 && v96 == 0xE500000000000000)
    {
      uint64_t v112 = swift_bridgeObjectRelease();
      sub_51E54(v112, v113, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
    }
    else
    {
      uint64_t v87 = v96;
      char v98 = sub_53FE0();
      uint64_t v99 = swift_bridgeObjectRelease();
      sub_51E54(v99, v100, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
      if ((v98 & 1) == 0) {
        goto LABEL_29;
      }
    }
    uint64_t v114 = v88;
    switch(*(unsigned char *)(v87 + *(int *)(v133 + 20)))
    {
      case 4:
        uint64_t v115 = swift_bridgeObjectRelease();
        sub_51E94(v115, v116, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
        goto LABEL_40;
      case 7:
        sub_51FA8();
        goto LABEL_39;
      case 8:
        uint64_t v54 = v129;
        sub_51B08(v134, v129, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
        goto LABEL_42;
      default:
LABEL_39:
        char v117 = sub_53FE0();
        uint64_t v118 = swift_bridgeObjectRelease();
        sub_51E94(v118, v119, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
        if (v117)
        {
LABEL_40:
          sub_51B64(v54, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
          uint64_t v120 = sub_43514();
          sub_51B64(v120, v121);
          uint64_t v88 = v114;
        }
        else
        {
LABEL_42:
          uint64_t v122 = v54;
          uint64_t v88 = v114;
          switch(*(unsigned char *)(v54 + *(int *)(v133 + 20)))
          {
            case 3:
              swift_bridgeObjectRelease();
              goto LABEL_40;
            case 7:
              sub_51FA8();
              break;
            case 8:
              sub_51B64(v54, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
              uint64_t v87 = v134;
              goto LABEL_29;
            default:
              break;
          }
          uint64_t v123 = v122;
          sub_20CD4();
          char v124 = sub_53FE0();
          swift_bridgeObjectRelease();
          sub_51B64(v123, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
          sub_51B64(v134, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
          if ((v124 & 1) == 0) {
            goto LABEL_30;
          }
        }
        sub_51B64(v88, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
        uint64_t v125 = sub_51E74();
        v126(v125);
        *(unsigned char *)(v2 + 136) = 2;
        return 1;
    }
  }
  sub_51E54(v90, v89, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
LABEL_29:
  sub_51B64(v87, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
LABEL_30:
  sub_6108();
  uint64_t v101 = sub_51DA8();
  v102(v101);
  unsigned int v103 = (void *)sub_53DA0();
  os_log_type_t v104 = sub_53E90();
  if (sub_FF7C(v104))
  {
    uint64_t v105 = (_WORD *)sub_61F0();
    sub_61CC(v105);
    sub_FED0(&dword_0, v106, v107, "#StartSirenFlow Received invalid input. Ignoring.");
    sub_60F0();
  }

  uint64_t v108 = sub_51F80((uint64_t)v153);
  ((void (*)(uint64_t))v51)(v108);
  sub_51B64(v88, (void (*)(void))&type metadata accessor for EmergencyDialogAct);
  uint64_t v109 = sub_51E74();
LABEL_34:
  v111(v109, v110);
  return 0;
}

uint64_t sub_4CBDC()
{
  sub_10010();
  v1[231] = v0;
  v1[230] = v2;
  uint64_t v3 = sub_53990();
  v1[232] = v3;
  sub_FDFC(v3);
  v1[233] = v4;
  v1[234] = sub_20CA8();
  uint64_t v5 = type metadata accessor for ConfirmationFlowConfigModel();
  v1[235] = v5;
  sub_FEC4(v5);
  v1[236] = sub_51EF4();
  v1[237] = swift_task_alloc();
  uint64_t v6 = sub_53030();
  sub_FEC4(v6);
  v1[238] = sub_20CA8();
  uint64_t v7 = sub_53B90();
  v1[239] = v7;
  sub_FEC4(v7);
  v1[240] = sub_20CA8();
  uint64_t v8 = sub_2E18(&qword_6BCA8);
  sub_FEC4(v8);
  v1[241] = sub_51EF4();
  v1[242] = swift_task_alloc();
  uint64_t v9 = sub_53B50();
  v1[243] = v9;
  sub_FEC4(v9);
  v1[244] = sub_20CA8();
  uint64_t v10 = sub_2E18(&qword_6C4E0);
  sub_FEC4(v10);
  v1[245] = sub_20CA8();
  uint64_t v11 = sub_533D0();
  v1[246] = v11;
  sub_FDFC(v11);
  v1[247] = v12;
  v1[248] = sub_20CA8();
  uint64_t v13 = sub_53DB0();
  v1[249] = v13;
  sub_FDFC(v13);
  v1[250] = v14;
  v1[251] = sub_51EF4();
  v1[252] = swift_task_alloc();
  v1[253] = swift_task_alloc();
  v1[254] = swift_task_alloc();
  v1[255] = swift_task_alloc();
  v1[256] = swift_task_alloc();
  v1[257] = swift_task_alloc();
  v1[258] = swift_task_alloc();
  v1[259] = swift_task_alloc();
  v1[260] = swift_task_alloc();
  v1[261] = swift_task_alloc();
  v1[262] = swift_task_alloc();
  sub_2B724();
  return _swift_task_switch(v15, v16, v17);
}

uint64_t sub_4CE3C()
{
  uint64_t v130 = v0;
  char v124 = v0 + 47;
  uint64_t v125 = v0 + 42;
  uint64_t v127 = v0 + 182;
  uint64_t v1 = v0[250];
  v0[263] = sub_53D90();
  sub_6108();
  v0[264] = *(void *)(v1 + 16);
  v0[265] = (v1 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  uint64_t v2 = sub_43514();
  v3(v2);
  uint64_t v4 = sub_53DA0();
  os_log_type_t v5 = sub_53E90();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)sub_61F0();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_0, v4, v5, "#StartSirenFlow execute", v6, 2u);
    sub_60F0();
  }
  uint64_t v7 = v0[262];
  uint64_t v8 = v0[250];
  uint64_t v9 = v0[249];
  uint64_t v10 = v0[231];

  uint64_t v11 = *(void (**)(void))(v8 + 8);
  v0[266] = v11;
  v0[267] = (v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  ((void (*)(uint64_t, uint64_t))v11)(v7, v9);
  uint64_t v12 = v11;
  switch(*(unsigned char *)(v10 + 136))
  {
    case 1:
      sub_51DEC();
      sub_2B5A0();
      uint64_t v46 = sub_2B6E8();
      v47(v46);
      sub_532E0();
      sub_6188();
      sub_51D98();
      v48();
      sub_2B5D4();
      v0[270] = sub_51D0C();
      uint64_t v16 = (void *)swift_task_alloc();
      v0[271] = v16;
      *uint64_t v16 = v0;
      uint64_t v17 = sub_4E684;
      goto LABEL_35;
    case 2:
      sub_51F40();
      sub_6108();
      uint64_t v18 = sub_51D7C();
      v19(v18);
      uint64_t v20 = sub_53DA0();
      os_log_type_t v21 = sub_53E90();
      if (sub_1B708(v21))
      {
        uint64_t v22 = (uint8_t *)sub_61F0();
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl(&dword_0, v20, (os_log_type_t)((_BYTE)v0 + 104), "#StartSirenFlow needsExecution", v22, 2u);
        sub_60F0();
      }
      uint64_t v23 = (void *)v0[231];

      sub_6120();
      v12();
      sub_3048((uint64_t)(v23 + 18), (uint64_t)v127);
      sub_2C00(v127, v0[185]);
      uint64_t v126 = v23 + 2;
      sub_2C00(v23 + 2, v23[5]);
      sub_1B764();
      v24();
      char v25 = sub_2E274(v0 + 177);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v0 + 177));
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v127);
      if (v25)
      {
        sub_2C00(v23 + 18, *(void *)(v0[231] + 168));
        if (sub_2E30C())
        {
          uint64_t v26 = v23;
          uint64_t v27 = v0[244];
          uint64_t v28 = v0[240];
          uint64_t v118 = v0[242];
          uint64_t v29 = v0[238];
          uint64_t v122 = v0[237];
          uint64_t v128 = v0[236];
          uint64_t v123 = (int *)v0[235];
          uint64_t v30 = v0[231];
          uint64_t v119 = (void *)(v30 + 56);
          uint64_t v120 = v30;
          sub_51DC0((void *)(v30 + 56), *(void *)(v30 + 80));
          sub_25524();
          swift_release();
          sub_3048((uint64_t)v126, (uint64_t)(v0 + 117));
          sub_53B40();
          sub_51BBC((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
          uint64_t v31 = sub_531D0();
          sub_51B64(v27, (void (*)(void))&type metadata accessor for OutputFlow);
          uint64_t v32 = v23[5];
          uint64_t v33 = v23[6];
          sub_2C00(v126, v26[5]);
          (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v33 + 16))(v129, v32, v33);
          sub_2DFEC(v29);
          sub_53B80();
          sub_51BBC(&qword_6CB30, 255, (void (*)(uint64_t))&type metadata accessor for AppPunchOutFlow);
          uint64_t v34 = sub_531D0();
          sub_51B64(v28, (void (*)(void))&type metadata accessor for AppPunchOutFlow);
          sub_2C00(v126, v26[5]);
          uint64_t v35 = sub_51F94();
          v36(v35);
          sub_2E18((uint64_t *)&unk_6D490);
          uint64_t v37 = swift_allocObject();
          *(_OWORD *)(v37 + 16) = xmmword_56F30;
          *(void *)(v37 + 32) = v31;
          *(void *)(v37 + 40) = v34;
          v129[5] = v37;
          sub_53E80();
          sub_53B70();
          swift_allocObject();
          v0[223] = sub_53B60();
          sub_51BBC(&qword_6E170, 255, (void (*)(uint64_t))&type metadata accessor for SequenceFlow);
          swift_retain();
          swift_retain();
          uint64_t v121 = sub_531D0();
          swift_release();
          sub_51DC0(v119, *(void *)(v120 + 80));
          sub_25504();
          swift_release();
          sub_2C00(v119, *(void *)(v120 + 80));
          swift_retain();
          sub_25464();
          swift_release();
          sub_32020(v118, v122);
          *(void *)(v122 + v123[6]) = v121;
          *(void *)(v122 + v123[7]) = 5;
          *(unsigned char *)(v122 + v123[8]) = 3;
          *(unsigned char *)(v122 + v123[9]) = 1;
          v0[2] = 0;
          v0[3] = 0xE000000000000000;
          v0[4] = 0;
          v0[5] = 0xE000000000000000;
          v0[6] = 0;
          v0[7] = 0xE000000000000000;
          v0[8] = 0x636E656772656D45;
          v0[9] = 0xEF6E657269532079;
          v0[10] = 0;
          v0[11] = 0xE000000000000000;
          v0[12] = 0;
          v0[13] = 0xE000000000000000;
          v0[14] = 0;
          v0[15] = 0xE000000000000000;
          v0[16] = 0;
          v0[17] = 0xE000000000000000;
          sub_3048((uint64_t)v126, (uint64_t)(v0 + 97));
          sub_3048((uint64_t)v119, (uint64_t)(v0 + 82));
          sub_5920(v120 + 96, (uint64_t)(v0 + 72));
          uint64_t v38 = v0[85];
          uint64_t v39 = sub_597C((uint64_t)(v0 + 82), v38);
          sub_60C0();
          uint64_t v41 = v40;
          BOOL v42 = (const void *)sub_20CA8();
          (*(void (**)(const void *, uint64_t, uint64_t))(v41 + 16))(v42, v39, v38);
          sub_51B08(v122, v128, (void (*)(void))type metadata accessor for ConfirmationFlowConfigModel);
          memcpy(v0 + 18, v42, 0x70uLL);
          swift_retain();
          uint64_t v43 = sub_51858(v0 + 2, v128, (long long *)(v0 + 97), v0 + 18, (uint64_t)(v0 + 72), 0, 0x7269537472617453, 0xEA00000000006E65);
          _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v0 + 82));
          swift_task_dealloc();
          v0[227] = v43;
          type metadata accessor for EmergencyConfirmationFlow();
          sub_51BBC(&qword_6BE80, 255, (void (*)(uint64_t))type metadata accessor for EmergencyConfirmationFlow);
          sub_53440();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          sub_51B64(v122, (void (*)(void))type metadata accessor for ConfirmationFlowConfigModel);
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
          sub_2B730();
          sub_51ED8();
          __asm { BRAA            X1, X16 }
        }
        sub_51F40();
        sub_6108();
        uint64_t v77 = sub_51D7C();
        v78(v77);
        sub_53DA0();
        os_log_type_t v79 = sub_53E90();
        if (sub_FF7C(v79))
        {
          uint64_t v80 = (_WORD *)sub_61F0();
          sub_61CC(v80);
          sub_FED0(&dword_0, v81, v82, "#StartSirenFlow App not installed on this device nor companion.");
          sub_60F0();
        }
        sub_51E30();
        sub_6120();
        v83();
        sub_532B0();
        sub_2B5A0();
        uint64_t v84 = sub_51E1C();
        v85(v84);
        sub_532E0();
        sub_6188();
        sub_51D98();
        v86();
        sub_2B5D4();
        v0[272] = sub_51CD8();
        uint64_t v16 = (void *)swift_task_alloc();
        v0[273] = v16;
        *uint64_t v16 = v0;
        uint64_t v17 = sub_4E880;
      }
      else
      {
        sub_6108();
        uint64_t v61 = sub_51EBC();
        v62(v61);
        swift_retain_n();
        uint64_t v63 = sub_53DA0();
        os_log_type_t v64 = sub_53E90();
        if (os_log_type_enabled(v63, v64))
        {
          uint64_t v65 = (uint8_t *)sub_1001C();
          v129[0] = sub_15284();
          *(_DWORD *)uint64_t v65 = 136315138;
          sub_2C00(v126, v23[5]);
          sub_1B764();
          v66();
          sub_2E18((uint64_t *)&unk_6D410);
          uint64_t v67 = sub_53E10();
          v0[224] = sub_50F10(v67, v68, v129);
          sub_53EF0();
          swift_bridgeObjectRelease();
          swift_release_n();
          _os_log_impl(&dword_0, v63, v64, "#StartSirenFlow Cannot route to Siren from this device: %s", v65, 0xCu);
          sub_51F4C();
          sub_60F0();
          sub_60F0();
        }
        else
        {
          swift_release_n();
        }
        sub_6120();
        v87();
        sub_51DEC();
        sub_2B5A0();
        uint64_t v88 = sub_2B6E8();
        v89(v88);
        sub_532E0();
        sub_6188();
        sub_51D98();
        v90();
        sub_2B5D4();
        v0[274] = sub_51D0C();
        uint64_t v16 = (void *)swift_task_alloc();
        v0[275] = v16;
        *uint64_t v16 = v0;
        uint64_t v17 = sub_4EAEC;
      }
      goto LABEL_35;
    case 3:
      sub_2B7BC();
      sub_6108();
      uint64_t v49 = sub_51EBC();
      v50(v49);
      uint64_t v51 = sub_53DA0();
      os_log_type_t v52 = sub_53E90();
      if (sub_1B708(v52))
      {
        char v53 = (uint8_t *)sub_61F0();
        *(_WORD *)char v53 = 0;
        _os_log_impl(&dword_0, v51, (os_log_type_t)((_BYTE)v0 + 104), "#StartSirenFlow needsRemoteExecution", v53, 2u);
        sub_60F0();
      }
      uint64_t v54 = (void *)v0[231];

      sub_6120();
      v12();
      sub_3048((uint64_t)(v54 + 18), (uint64_t)v125);
      sub_2C00(v125, v0[45]);
      sub_2C00(v54 + 2, v54[5]);
      sub_1B764();
      v55();
      char v56 = sub_2E274(v124);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v124);
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v125);
      if ((v56 & 1) == 0)
      {
        sub_6108();
        uint64_t v69 = sub_51D7C();
        v70(v69);
        swift_retain_n();
        uint64_t v71 = sub_53DA0();
        os_log_type_t v72 = sub_53E90();
        if (os_log_type_enabled(v71, v72))
        {
          os_log_type_t v73 = (uint8_t *)sub_1001C();
          v129[0] = sub_15284();
          *(_DWORD *)os_log_type_t v73 = 136315138;
          sub_2C00(v54 + 2, v54[5]);
          sub_1B764();
          v74();
          sub_2E18((uint64_t *)&unk_6D410);
          uint64_t v75 = sub_53E10();
          v0[226] = sub_50F10(v75, v76, v129);
          sub_53EF0();
          swift_bridgeObjectRelease();
          swift_release_n();
          _os_log_impl(&dword_0, v71, v72, "#StartSirenFlow Cannot route to Siren from this device: %s", v73, 0xCu);
          sub_51F4C();
          sub_60F0();
          sub_60F0();
        }
        else
        {
          swift_release_n();
        }
        sub_6120();
        v100();
        sub_51DEC();
        sub_2B5A0();
        uint64_t v101 = sub_2B6E8();
        v102(v101);
        sub_532E0();
        sub_6188();
        sub_51D98();
        v103();
        sub_2B5D4();
        v0[300] = sub_51D0C();
        uint64_t v16 = (void *)swift_task_alloc();
        v0[301] = v16;
        *uint64_t v16 = v0;
        uint64_t v17 = sub_50204;
LABEL_35:
        v16[1] = v17;
        sub_51F28();
        sub_51ED8();
        return dispatch thunk of SiriKitEventSending.sendAsync(_:)(v104, v105, v106);
      }
      v0[80] = &type metadata for EmergencyFeatureFlagsKey;
      v0[81] = sub_F998();
      *((unsigned char *)v0 + 616) = 1;
      char v57 = sub_53640();
      _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v0 + 77));
      if ((v57 & 1) == 0)
      {
        sub_51F40();
        sub_6108();
        uint64_t v91 = sub_51D7C();
        v92(v91);
        sub_53DA0();
        os_log_type_t v93 = sub_53E90();
        if (sub_FF7C(v93))
        {
          uint64_t v94 = (_WORD *)sub_61F0();
          sub_61CC(v94);
          sub_FED0(&dword_0, v95, v96, "#StartSirenFlow Phone to watch handoff not enabled.");
          sub_60F0();
        }
        sub_51E30();
        sub_6120();
        v12();
        sub_532B0();
        sub_2B5A0();
        uint64_t v97 = sub_51E1C();
        v98(v97);
        sub_532E0();
        sub_6188();
        sub_51D98();
        v99();
        sub_2B5D4();
        v0[298] = sub_51CD8();
        uint64_t v16 = (void *)swift_task_alloc();
        v0[299] = v16;
        *uint64_t v16 = v0;
        uint64_t v17 = sub_4FF0C;
        goto LABEL_35;
      }
      sub_2C00(v54 + 18, *(void *)(v0[231] + 168));
      if ((sub_2E30C() & 1) == 0)
      {
        sub_51F40();
        sub_6108();
        uint64_t v108 = sub_51D7C();
        v109(v108);
        sub_53DA0();
        os_log_type_t v110 = sub_53E90();
        if (sub_FF7C(v110))
        {
          uint64_t v111 = (_WORD *)sub_61F0();
          sub_61CC(v111);
          sub_FED0(&dword_0, v112, v113, "#StartSirenFlow App not installed on this device nor companion.");
          sub_60F0();
        }
        sub_51E30();
        sub_6120();
        v12();
        sub_532B0();
        sub_2B5A0();
        uint64_t v114 = sub_51E1C();
        v115(v114);
        sub_532E0();
        sub_6188();
        sub_51D98();
        v116();
        sub_2B5D4();
        v0[296] = sub_51CD8();
        uint64_t v16 = (void *)swift_task_alloc();
        v0[297] = v16;
        *uint64_t v16 = v0;
        uint64_t v17 = sub_4FCA0;
        goto LABEL_35;
      }
      uint64_t v58 = v0[231];
      (*(void (**)(void, void, void))(v0[233] + 104))(v0[234], enum case for DeviceIdiom.watch(_:), v0[232]);
      sub_3048(v58 + 184, (uint64_t)(v0 + 112));
      unint64_t v59 = (void *)swift_task_alloc();
      v0[276] = v59;
      *unint64_t v59 = v0;
      v59[1] = sub_4ED58;
      sub_51ED8();
      return findRemoteDevice(with:deviceResolutionService:)();
    default:
      sub_51DEC();
      sub_2B5A0();
      uint64_t v13 = sub_2B6E8();
      v14(v13);
      sub_532E0();
      sub_6188();
      sub_51D98();
      v15();
      sub_2B5D4();
      v0[268] = sub_51D0C();
      uint64_t v16 = (void *)swift_task_alloc();
      v0[269] = v16;
      *uint64_t v16 = v0;
      uint64_t v17 = sub_4E44C;
      goto LABEL_35;
  }
}

uint64_t sub_4E44C()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_2B724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_4E530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_51D60();
  sub_51E10();
  uint64_t v25 = *(void *)(v24 + 1848);
  uint64_t v26 = *(void *)(v24 + 1840);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v24 + 256);
  sub_F824();
  uint64_t v27 = swift_allocError();
  *uint64_t v28 = 2;
  sub_2940(v27, v25 + 16, (void *)(v25 + 56), v26);
  swift_errorRelease();
  sub_51C04();
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
  sub_2B730();
  sub_51D44();
  return v30(v29, v30, v31, v32, v33, v34, v35, v36, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

uint64_t sub_4E684()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_2B724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_4E768(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_51D60();
  sub_51E10();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v24 + 416);
  sub_53460();
  sub_51C04();
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
  sub_2B730();
  sub_51D44();
  return v26(v25, v26, v27, v28, v29, v30, v31, v32, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

uint64_t sub_4E880()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_2B724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_4E964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_51D60();
  sub_51E10();
  sub_51C88(v25 + 1216);
  sub_25484();
  swift_release();
  sub_51F10();
  sub_2B83C();
  sub_51BBC((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
  sub_2B7C8();
  sub_51B64(v24, (void (*)(void))&type metadata accessor for OutputFlow);
  sub_51C04();
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
  sub_2B730();
  sub_51D44();
  return v27(v26, v27, v28, v29, v30, v31, v32, v33, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

uint64_t sub_4EAEC()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_2B724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_4EBD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_51D60();
  sub_51E10();
  sub_51C88(v25 + 1376);
  sub_25544();
  swift_release();
  sub_51F10();
  sub_2B83C();
  sub_51BBC((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
  sub_2B7C8();
  sub_51B64(v24, (void (*)(void))&type metadata accessor for OutputFlow);
  sub_51C04();
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
  sub_2B730();
  sub_51D44();
  return v27(v26, v27, v28, v29, v30, v31, v32, v33, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

uint64_t sub_4ED58()
{
  sub_60D8();
  uint64_t v2 = v1 + 896;
  uint64_t v3 = *v0;
  sub_FFEC();
  *uint64_t v4 = v3;
  *(void *)(v6 + 2216) = v5;
  swift_task_dealloc();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v2);
  uint64_t v7 = sub_2B7BC();
  v8(v7);
  sub_2B724();
  return _swift_task_switch(v9, v10, v11);
}

uint64_t sub_4EE90()
{
  uint64_t v52 = v0;
  uint64_t v1 = *(void **)(v0 + 2216);
  if (v1)
  {
    uint64_t v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2112);
    uint64_t v2 = *(void *)(v0 + 2104);
    uint64_t v46 = *(void *)(v0 + 2056);
    uint64_t v47 = *(void *)(v0 + 1992);
    uint64_t v3 = *(void *)(v0 + 1848);
    sub_2D324(0, &qword_6D4A0);
    id v4 = sub_4BD40();
    *(void *)(v0 + 2224) = v4;
    uint64_t v5 = sub_53DD0();
    sub_516D4(v5, v4);
    uint64_t v6 = self;
    sub_2C00((void *)(v3 + 16), *(void *)(v3 + 40));
    sub_1B764();
    v7();
    sub_2C00((void *)(v0 + 1056), *(void *)(v0 + 1080));
    sub_43514();
    uint64_t v8 = (void *)sub_533B0();
    id v9 = [v6 runSiriKitExecutorCommandWithContext:v8 payload:v4];
    *(void *)(v0 + 2232) = v9;

    _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 1056);
    id v10 = [v6 wrapCommandInStartLocalRequest:v9];
    *(void *)(v0 + 2240) = v10;
    id v11 = [objc_allocWithZone((Class)SAStartUIRequest) init];
    *(void *)(v0 + 2248) = v11;
    [v11 setStartLocalRequest:v10];
    sub_6108();
    v49(v46, v2, v47);
    id v12 = v1;
    uint64_t v13 = sub_53DA0();
    os_log_type_t v14 = sub_53E90();
    BOOL v15 = os_log_type_enabled(v13, v14);
    uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v0 + 2128);
    uint64_t v17 = *(void *)(v0 + 2056);
    uint64_t v18 = *(void *)(v0 + 1992);
    if (v15)
    {
      uint64_t v48 = *(void *)(v0 + 2056);
      uint64_t v19 = (uint8_t *)sub_1001C();
      uint64_t v51 = sub_15284();
      *(_DWORD *)uint64_t v19 = 136315138;
      uint64_t v20 = sub_53D60();
      *(void *)(v0 + 1832) = sub_50F10(v20, v21, &v51);
      sub_53EF0();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_0, v13, v14, "#StartSirenFlow Submitting start siren direct invocation to remote with assistantId: %s", v19, 0xCu);
      swift_arrayDestroy();
      sub_60F0();
      sub_60F0();

      v16(v48, v18);
    }
    else
    {

      v16(v17, v18);
    }
    uint64_t v37 = *(void *)(v0 + 1976);
    sub_532B0();
    *(void *)(v0 + 2256) = sub_2B5A0();
    *(_DWORD *)(v0 + 2432) = enum case for ActivityType.executeOnRemote(_:);
    *(void *)(v0 + 2264) = *(void *)(v37 + 104);
    *(void *)(v0 + 2272) = (v37 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
    uint64_t v38 = sub_51E1C();
    v39(v38);
    *(void *)(v0 + 2280) = sub_532E0();
    sub_6188();
    *(void *)(v0 + 2288) = *(void *)(v40 + 104);
    *(void *)(v0 + 2296) = (v40 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
    sub_51D98();
    v41();
    sub_2B5D4();
    *(void *)(v0 + 2304) = sub_51CD8();
    uint64_t v35 = (void *)swift_task_alloc();
    *(void *)(v0 + 2312) = v35;
    *uint64_t v35 = v0;
    uint64_t v36 = sub_4F478;
  }
  else
  {
    uint64_t v22 = *(void (**)(uint64_t))(v0 + 2112);
    sub_6108();
    uint64_t v23 = sub_20CD4();
    v22(v23);
    uint64_t v24 = (void *)sub_53DA0();
    os_log_type_t v25 = sub_53EA0();
    if (sub_FF7C(v25))
    {
      uint64_t v26 = (_WORD *)sub_61F0();
      sub_61CC(v26);
      sub_FED0(&dword_0, v27, v28, "#StartSirenFlow Failed to find remote device");
      sub_60F0();
    }
    uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v0 + 2128);
    uint64_t v30 = *(void *)(v0 + 2040);
    uint64_t v31 = *(void *)(v0 + 1992);
    uint64_t v32 = *(void *)(v0 + 1984);
    uint64_t v33 = *(void *)(v0 + 1976);
    uint64_t v50 = *(void *)(v0 + 1968);

    v29(v30, v31);
    sub_532B0();
    sub_2B5A0();
    (*(void (**)(uint64_t, void, uint64_t))(v33 + 104))(v32, enum case for ActivityType.handoffToCompanion(_:), v50);
    sub_532E0();
    sub_6188();
    sub_51D98();
    v34();
    sub_2B5D4();
    *(void *)(v0 + 2352) = sub_51CD8();
    uint64_t v35 = (void *)swift_task_alloc();
    *(void *)(v0 + 2360) = v35;
    *uint64_t v35 = v0;
    uint64_t v36 = sub_4FA34;
  }
  v35[1] = v36;
  uint64_t v42 = sub_51F28();
  return dispatch thunk of SiriKitEventSending.sendAsync(_:)(v42, v43, v44);
}

uint64_t sub_4F478()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_2B724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_4F55C()
{
  uint64_t v1 = v0[231];
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v0 + 142));
  sub_2C00((void *)(v1 + 16), *(void *)(v1 + 40));
  uint64_t v2 = sub_51F94();
  v3(v2);
  uint64_t v4 = v0[150];
  uint64_t v5 = v0[151];
  sub_2C00(v0 + 147, v4);
  uint64_t v6 = sub_53D60();
  uint64_t v8 = v7;
  v0[290] = v7;
  id v9 = (void *)swift_task_alloc();
  v0[291] = v9;
  uint64_t v10 = sub_2D324(0, (unint64_t *)&qword_6BF68);
  *id v9 = v0;
  v9[1] = sub_4F6A0;
  uint64_t v11 = v0[281];
  return AceServiceInvokerAsync.submitToRemote<A>(_:_:)(v11, v6, v8, v4, v10, v5);
}

uint64_t sub_4F6A0()
{
  sub_10010();
  sub_60D8();
  *(void *)(v2 + 2336) = v1;
  *(void *)(v2 + 2344) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_bridgeObjectRelease();
  }
  sub_2B724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_4F794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_51D60();
  sub_51E10();
  os_log_type_t v25 = *(void **)(v24 + 2336);
  uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 2112);
  uint64_t v27 = *(void *)(v24 + 2104);
  uint64_t v28 = *(void *)(v24 + 2048);
  uint64_t v29 = *(void *)(v24 + 1992);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v24 + 1176);
  sub_20CD4();
  sub_6108();
  v26(v28, v27, v29);
  id v30 = v25;
  uint64_t v31 = sub_53DA0();
  os_log_type_t v32 = sub_53E90();
  if (sub_1B708(v32))
  {
    uint64_t v33 = *(void **)(v24 + 2336);
    uint64_t v34 = (uint8_t *)sub_1001C();
    uint64_t v35 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v34 = 138412290;
    *(void *)(v24 + 1824) = v33;
    id v36 = v33;
    sub_53EF0();
    *uint64_t v35 = v33;

    uint64_t v54 = v31;
    _os_log_impl(&dword_0, v31, (os_log_type_t)v28, "#StartSirenFlow Received submitToRemote response: %@", v34, 0xCu);
    sub_2E18(&qword_6E168);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();
    uint64_t v37 = *(NSObject **)(v24 + 2336);
  }
  else
  {

    uint64_t v37 = *(NSObject **)(v24 + 2336);
    uint64_t v54 = v37;
  }
  uint64_t v38 = *(void **)(v24 + 2248);
  uint64_t v39 = *(void **)(v24 + 2240);
  uint64_t v40 = *(void **)(v24 + 2232);
  uint64_t v52 = *(void **)(v24 + 2224);
  uint64_t v53 = *(void **)(v24 + 2216);
  uint64_t v41 = *(void (**)(uint64_t))(v24 + 2128);

  uint64_t v42 = sub_2B7BC();
  v41(v42);
  sub_53460();

  sub_51C04();
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
  sub_2B730();
  sub_51D44();
  return v44(v43, v44, v45, v46, v47, v48, v49, v50, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, v52,
           v53,
           v54,
           a22,
           a23,
           a24);
}

uint64_t sub_4FA34()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_2B724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_4FB18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_51D60();
  sub_51E10();
  sub_51C88(v25 + 976);
  sub_254C4();
  swift_release();
  sub_51F10();
  sub_2B83C();
  sub_51BBC((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
  sub_2B7C8();
  sub_51B64(v24, (void (*)(void))&type metadata accessor for OutputFlow);
  sub_51C04();
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
  sub_2B730();
  sub_51D44();
  return v27(v26, v27, v28, v29, v30, v31, v32, v33, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

uint64_t sub_4FCA0()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_2B724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_4FD84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_51D60();
  sub_51E10();
  sub_51C88(v25 + 816);
  sub_25484();
  swift_release();
  sub_51F10();
  sub_2B83C();
  sub_51BBC((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
  sub_2B7C8();
  sub_51B64(v24, (void (*)(void))&type metadata accessor for OutputFlow);
  sub_51C04();
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
  sub_2B730();
  sub_51D44();
  return v27(v26, v27, v28, v29, v30, v31, v32, v33, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

uint64_t sub_4FF0C()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_2B724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_4FFF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_51D60();
  sub_51E10();
  uint64_t v25 = (void *)v24[231];
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v24 + 87));
  sub_2C00(v25 + 18, v25[21]);
  unsigned __int8 v26 = sub_2E30C();
  sub_51DC0(v25 + 7, v25[10]);
  if (v26) {
    sub_254C4();
  }
  else {
    sub_25544();
  }
  uint64_t v27 = v24[244];
  uint64_t v28 = v24[242];
  uint64_t v29 = v24[241];
  swift_release();
  sub_2FE0(v29, v28);
  uint64_t v30 = sub_43514();
  sub_3048(v30, v31);
  sub_53B40();
  sub_51BBC((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
  sub_53440();
  sub_51B64(v27, (void (*)(void))&type metadata accessor for OutputFlow);
  sub_3158(v29);
  sub_51C04();
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
  sub_2B730();
  sub_51D44();
  return v33(v32, v33, v34, v35, v36, v37, v38, v39, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

uint64_t sub_50204()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_2B724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_502E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_51D60();
  sub_51E10();
  sub_51C88(v25 + 456);
  sub_25544();
  swift_release();
  sub_51F10();
  sub_2B83C();
  sub_51BBC((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
  sub_2B7C8();
  sub_51B64(v24, (void (*)(void))&type metadata accessor for OutputFlow);
  sub_51C04();
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
  sub_2B730();
  sub_51D44();
  return v27(v26, v27, v28, v29, v30, v31, v32, v33, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24);
}

uint64_t sub_50470()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 2112);
  uint64_t v2 = *(void *)(v0 + 2104);
  uint64_t v3 = *(void *)(v0 + 2008);
  uint64_t v4 = *(void *)(v0 + 1992);
  swift_bridgeObjectRelease();
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 1176);
  sub_6108();
  v1(v3, v2, v4);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = sub_53DA0();
  os_log_type_t v6 = sub_53EA0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)sub_1001C();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 1800) = v9;
    sub_53EF0();
    *uint64_t v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v5, v6, "#StartSirenFlow Error while submitting to remote: %@", v7, 0xCu);
    sub_2E18(&qword_6E168);
    swift_arrayDestroy();
    sub_60F0();
    sub_60F0();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v10 = v5;
  uint64_t v24 = *(void (**)(uint64_t, void, uint64_t))(v0 + 2288);
  uint64_t v11 = *(void *)(v0 + 2280);
  uint64_t v23 = *(void (**)(uint64_t, void, uint64_t))(v0 + 2264);
  unsigned int v22 = *(_DWORD *)(v0 + 2432);
  id v12 = *(void (**)(uint64_t))(v0 + 2128);
  uint64_t v13 = *(void *)(v0 + 1984);
  uint64_t v14 = *(void *)(v0 + 1968);
  uint64_t v15 = *(void *)(v0 + 1960);

  uint64_t v16 = sub_2B7BC();
  v12(v16);
  sub_532B0();
  uint64_t v17 = *(void *)(v0 + 320);
  uint64_t v18 = *(void *)(v0 + 328);
  sub_2C00((void *)(v0 + 296), v17);
  v23(v13, v22, v14);
  v24(v15, enum case for SiriKitReliabilityCodes.errorSendingExecuteOnRemoteRequest(_:), v11);
  sub_34DC(v15, 0, 1, v11);
  uint64_t v19 = sub_532F0();
  *(void *)(v0 + 2416) = v19;
  uint64_t v20 = (void *)swift_task_alloc();
  *(void *)(v0 + 2424) = v20;
  *uint64_t v20 = v0;
  v20[1] = sub_50794;
  return dispatch thunk of SiriKitEventSending.sendAsync(_:)(v19, v17, v18);
}

uint64_t sub_50794()
{
  sub_10010();
  sub_60D8();
  uint64_t v1 = *v0;
  sub_FFEC();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  swift_release();
  sub_2B724();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_50878(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  sub_51D60();
  sub_51E10();
  uint64_t v38 = v24[293];
  uint64_t v25 = (void *)v24[281];
  uint64_t v40 = (void *)v24[280];
  uint64_t v41 = (void *)v24[279];
  uint64_t v26 = (void *)v24[278];
  uint64_t v39 = (void *)v24[277];
  uint64_t v27 = v24[244];
  uint64_t v28 = v24[231];
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)(v24 + 37));
  sub_51DC0((void *)(v28 + 56), *(void *)(v28 + 80));
  sub_254C4();
  swift_release();
  sub_3048(v28 + 16, (uint64_t)(v24 + 162));
  sub_53B40();
  sub_51BBC((unint64_t *)&qword_6BCB0, 255, (void (*)(uint64_t))&type metadata accessor for OutputFlow);
  sub_53440();

  swift_errorRelease();
  sub_51B64(v27, (void (*)(void))&type metadata accessor for OutputFlow);
  sub_51C04();
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
  sub_2B730();
  sub_51D44();
  return v30(v29, v30, v31, v32, v33, v34, v35, v36, a9, a10, a11, a12, a13, a14, a15, a16, a17, v38, v39,
           v40,
           v41,
           a22,
           a23,
           a24);
}

uint64_t sub_50A9C()
{
  type metadata accessor for StartSirenFlow();
  sub_51BBC(&qword_6DE68, v0, (void (*)(uint64_t))type metadata accessor for StartSirenFlow);
  return sub_531E0();
}

uint64_t sub_50B28()
{
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 16);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 56);
  sub_6068(v0 + 96);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 144);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(v0 + 184);
  return v0;
}

uint64_t sub_50B68()
{
  sub_50B28();

  return _swift_deallocClassInstance(v0, 224, 7);
}

uint64_t type metadata accessor for StartSirenFlow()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for StartSirenFlow.StartSirenFlowState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x50C8CLL);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StartSirenFlow.StartSirenFlowState()
{
  return &type metadata for StartSirenFlow.StartSirenFlowState;
}

unint64_t sub_50CC8()
{
  unint64_t result = qword_6E150[0];
  if (!qword_6E150[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_6E150);
  }
  return result;
}

uint64_t sub_50D14(uint64_t a1)
{
  return sub_4BDB4(a1) & 1;
}

uint64_t sub_50D3C()
{
  return sub_50A9C();
}

uint64_t sub_50D60()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2B378;
  return sub_4CBDC();
}

uint64_t sub_50DFC()
{
  type metadata accessor for StartSirenFlow();

  return sub_53230();
}

uint64_t sub_50E34(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_50E70(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_50E98(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_50F10(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_53EF0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_50F10(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  sub_2B724();
  uint64_t v9 = sub_50FE0(v6, v7, v8, 1, a1, a2);
  uint64_t v10 = v15[0];
  if (v9)
  {
    uint64_t v11 = v9;
    ObjectType = (void *)swift_getObjectType();
    v15[0] = v11;
    uint64_t v12 = *a3;
    if (*a3)
    {
      sub_2D144((uint64_t)v15, *a3);
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
      sub_2D144((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    swift_bridgeObjectRetain();
  }
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v15);
  return v10;
}

uint64_t sub_50FE0(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_51138((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_53F00();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_51210(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_53F50();
    if (!v8)
    {
      uint64_t result = sub_53F70();
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

void *sub_51138(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_53F90();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_51210(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_512A8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_51484(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_51484((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_512A8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_53E60();
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
  unint64_t v3 = sub_5141C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_53F40();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_53F90();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_53F70();
  __break(1u);
  return result;
}

void *sub_5141C(uint64_t a1, uint64_t a2)
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
  sub_2E18(&qword_6E178);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_51484(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_2E18(&qword_6E178);
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
    sub_51634(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_5155C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_5155C(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_53F90();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_51634(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_53F90();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unsigned char **sub_516C4(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void sub_516D4(uint64_t a1, void *a2)
{
  Class isa = sub_53DC0().super.isa;
  swift_bridgeObjectRelease();
  [a2 setUserData:isa];
}

uint64_t sub_51754(const void *a1, uint64_t a2, long long *a3, const void *a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(a9 + 176) = type metadata accessor for ConfirmationFlowConfigModel();
  *(void *)(a9 + 184) = &off_66C38;
  uint64_t v17 = sub_5DC4((uint64_t *)(a9 + 152));
  sub_27CFC(a2, (uint64_t)v17);
  *(void *)(a9 + 256) = &type metadata for EmergencyCATProvider;
  *(void *)(a9 + 264) = &off_66E10;
  uint64_t v18 = swift_allocObject();
  *(void *)(a9 + 232) = v18;
  memcpy((void *)(v18 + 16), a4, 0x70uLL);
  memcpy((void *)(a9 + 24), a1, 0x80uLL);
  sub_5F28(a3, a9 + 192);
  long long v19 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)(a9 + 272) = *(_OWORD *)a5;
  *(_OWORD *)(a9 + 288) = v19;
  uint64_t v20 = *(void *)(a5 + 32);
  *(unsigned char *)(a9 + 16) = a6;
  *(void *)(a9 + 304) = v20;
  *(void *)(a9 + 312) = a7;
  *(void *)(a9 + 320) = a8;
  return a9;
}

uint64_t sub_51858(const void *a1, uint64_t a2, long long *a3, const void *a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v32 = type metadata accessor for ConfirmationFlowConfigModel();
  uint64_t v33 = &off_66C38;
  uint64_t v16 = sub_5DC4(v31);
  sub_27CFC(a2, (uint64_t)v16);
  void v30[3] = &type metadata for EmergencyCATProvider;
  v30[4] = &off_66E10;
  v30[0] = swift_allocObject();
  memcpy((void *)(v30[0] + 16), a4, 0x70uLL);
  type metadata accessor for EmergencyConfirmationFlow();
  uint64_t v17 = swift_allocObject();
  sub_597C((uint64_t)v31, v32);
  sub_60C0();
  __chkstk_darwin(v18);
  sub_6140();
  uint64_t v21 = v20 - v19;
  (*(void (**)(uint64_t))(v22 + 16))(v20 - v19);
  sub_597C((uint64_t)v30, (uint64_t)&type metadata for EmergencyCATProvider);
  sub_60C0();
  __chkstk_darwin(v23);
  sub_6140();
  uint64_t v26 = (const void *)(v25 - v24);
  (*(void (**)(uint64_t))(v27 + 16))(v25 - v24);
  memcpy(__dst, v26, 0x70uLL);
  uint64_t v28 = sub_51754(a1, v21, a3, __dst, a5, a6, a7, a8, v17);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v30);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0((uint64_t)v31);
  return v28;
}

uint64_t sub_51A68()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 128, 7);
}

uint64_t sub_51B08(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_6188();
  uint64_t v4 = sub_20CD4();
  v5(v4);
  return a2;
}

uint64_t sub_51B64(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_6188();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_51BBC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_51C04()
{
  *(void *)(v1 - 80) = *(void *)(v0 + 1872);
  return swift_task_dealloc();
}

uint64_t sub_51C88(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 1848);
  _s19EmergencyFlowPlugin28EmergencyFeatureFlagsManagerVwxx_0(a1);
  sub_2C00((void *)(v2 + 56), *(void *)(v2 + 80));
  return swift_retain();
}

uint64_t sub_51CD8()
{
  return sub_532F0();
}

uint64_t sub_51D0C()
{
  return sub_532F0();
}

uint64_t sub_51D7C()
{
  return v0;
}

uint64_t sub_51DA8()
{
  return v0;
}

uint64_t sub_51DC0(void *a1, uint64_t a2)
{
  sub_2C00(a1, a2);
  return swift_retain();
}

uint64_t sub_51DEC()
{
  return sub_532B0();
}

uint64_t sub_51E1C()
{
  return v0;
}

void sub_51E30()
{
}

uint64_t sub_51E54(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v6 = *(void *)(v4 - 320);
  return sub_51B08(v3, v6, a3);
}

uint64_t sub_51E74()
{
  return *(void *)(v0 - 288);
}

uint64_t sub_51E94(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v5 = *(void *)(v3 - 320);
  uint64_t v6 = *(void *)(v3 - 368);
  return sub_51B08(v5, v6, a3);
}

uint64_t sub_51EBC()
{
  return v0;
}

uint64_t sub_51EF4()
{
  return swift_task_alloc();
}

uint64_t sub_51F10()
{
  return sub_3048(v1, v0);
}

uint64_t sub_51F28()
{
  return v0;
}

uint64_t sub_51F40()
{
  return v0;
}

uint64_t sub_51F4C()
{
  return swift_arrayDestroy();
}

uint64_t sub_51F6C()
{
  return v0;
}

uint64_t sub_51F80@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 - 256);
}

uint64_t sub_51F94()
{
  return v0;
}

uint64_t sub_51FBC(char a1)
{
  uint64_t result = 0x535F48434E55414CLL;
  switch(a1)
  {
    case 3:
      return result;
    default:
      uint64_t result = sub_53E00();
      break;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for ConfirmationType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x52118);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConfirmationType()
{
  return &type metadata for ConfirmationType;
}

unint64_t sub_52154()
{
  unint64_t result = qword_6E180;
  if (!qword_6E180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_6E180);
  }
  return result;
}

uint64_t type metadata accessor for PoisonControlCATs()
{
  uint64_t result = qword_6E188;
  if (!qword_6E188) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_521E8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_52228(uint64_t a1, char a2)
{
  return sub_522DC(a1, a2);
}

uint64_t sub_5224C()
{
  return sub_52490();
}

uint64_t sub_52270(uint64_t a1)
{
  return sub_524AC(a1);
}

uint64_t sub_52294()
{
  return sub_52644();
}

uint64_t sub_522B8()
{
  return sub_52660();
}

uint64_t sub_522DC(uint64_t a1, char a2)
{
  uint64_t v4 = sub_2E18(&qword_6BCB8);
  __chkstk_darwin(v4 - 8);
  unsigned int v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2E18(&qword_6BF00);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_547D0;
  int64_t v8 = (uint64_t *)(v7 + 48);
  *(void *)(v7 + 32) = 0x656D614E67726FLL;
  *(void *)(v7 + 40) = 0xE700000000000000;
  sub_7C74(a1, (uint64_t)v6, &qword_6BCB8);
  uint64_t v9 = sub_53AD0();
  if (sub_5800((uint64_t)v6, 1, v9) == 1)
  {
    sub_7CD4((uint64_t)v6, &qword_6BCB8);
    *(_OWORD *)int64_t v8 = 0u;
    *(_OWORD *)(v7 + 64) = 0u;
  }
  else
  {
    *(void *)(v7 + 72) = v9;
    sub_5DC4(v8);
    sub_7D4C();
    (*(void (**)(void))(v10 + 32))();
  }
  *(void *)(v7 + 80) = 0xD000000000000012;
  *(void *)(v7 + 88) = 0x80000000000575A0;
  *(void *)(v7 + 120) = &type metadata for Bool;
  *(unsigned char *)(v7 + 96) = a2 & 1;
  sub_53A60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_52490()
{
  sub_840C();
  return sub_5284C(v0, v1, v2);
}

uint64_t sub_524AC(uint64_t a1)
{
  return sub_5284C(a1, 0x656D614E67726FLL, 0xE700000000000000);
}

uint64_t sub_524D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_2E18(&qword_6BCB8);
  __chkstk_darwin(v7 - 8);
  sub_7D34();
  sub_2E18(&qword_6BF00);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_547B0;
  uint64_t v9 = (uint64_t *)(v8 + 48);
  *(void *)(v8 + 32) = a2;
  *(void *)(v8 + 40) = a3;
  sub_7C74(a1, v3, &qword_6BCB8);
  uint64_t v10 = sub_53AD0();
  if (sub_5800(v3, 1, v10) == 1)
  {
    sub_7CD4(v3, &qword_6BCB8);
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v8 + 64) = 0u;
  }
  else
  {
    *(void *)(v8 + 72) = v10;
    sub_5DC4(v9);
    sub_7D4C();
    (*(void (**)(void))(v11 + 32))();
  }
  sub_53A60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_52644()
{
  sub_840C();
  return sub_5284C(v0, v1, v2);
}

uint64_t sub_52660()
{
  return sub_53A60();
}

uint64_t sub_52684(uint64_t a1, uint64_t a2)
{
  return sub_526D8(a1, a2);
}

uint64_t sub_526D8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_53B30();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_7D34();
  uint64_t v7 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v7 - 8);
  sub_7C74(a1, (uint64_t)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t *)&unk_6DA80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, a2, v5);
  uint64_t v9 = sub_53A50();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v5);
  sub_7CD4(a1, (uint64_t *)&unk_6DA80);
  return v9;
}

uint64_t sub_52844()
{
  return type metadata accessor for PoisonControlCATs();
}

uint64_t sub_5284C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_524D8(a1, a2, a3);
}

uint64_t type metadata accessor for EmergencySexualAssaultBasicIntentCATs()
{
  uint64_t result = qword_6E1D8;
  if (!qword_6E1D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_5289C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_528DC(uint64_t a1, char a2)
{
  return sub_52948(a1, a2);
}

uint64_t sub_52900(uint64_t a1, char a2)
{
  return sub_52980(a1, a2);
}

uint64_t sub_52924(uint64_t a1, uint64_t a2, char a3)
{
  return sub_52B54(a1, a2, a3);
}

uint64_t sub_52948(uint64_t a1, char a2)
{
  return sub_52F18(a1, a2, 0x6372616553626577, 0xEE00797265755168, 44, 0x80000000000592A0);
}

uint64_t sub_52980(uint64_t a1, char a2)
{
  return sub_52F18(a1, a2, 0x656D614E67726FLL, 0xE700000000000000, 45, 0x8000000000059270);
}

uint64_t sub_529AC(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v19[0] = a5;
  v19[1] = a6;
  uint64_t v10 = sub_2E18(&qword_6BCB8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2E18(&qword_6BF00);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_547D0;
  uint64_t v14 = (uint64_t *)(v13 + 48);
  *(void *)(v13 + 32) = a3;
  *(void *)(v13 + 40) = a4;
  sub_7C74(a1, (uint64_t)v12, &qword_6BCB8);
  uint64_t v15 = sub_53AD0();
  if (sub_5800((uint64_t)v12, 1, v15) == 1)
  {
    sub_7CD4((uint64_t)v12, &qword_6BCB8);
    *(_OWORD *)uint64_t v14 = 0u;
    *(_OWORD *)(v13 + 64) = 0u;
  }
  else
  {
    *(void *)(v13 + 72) = v15;
    sub_5DC4(v14);
    sub_7D4C();
    (*(void (**)(uint64_t, char *))(v16 + 32))(v17, v12);
  }
  *(void *)(v13 + 80) = 0xD000000000000012;
  *(void *)(v13 + 88) = 0x80000000000575A0;
  *(void *)(v13 + 120) = &type metadata for Bool;
  *(unsigned char *)(v13 + 96) = a2 & 1;
  sub_53A60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_52B54(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = sub_2E18(&qword_6BCB8);
  __chkstk_darwin(v7 - 8);
  sub_7D34();
  sub_2E18(&qword_6BF00);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_547E0;
  uint64_t v9 = (uint64_t *)(v8 + 48);
  *(void *)(v8 + 32) = 0x656D614E67726FLL;
  *(void *)(v8 + 40) = 0xE700000000000000;
  sub_7C74(a1, v3, &qword_6BCB8);
  uint64_t v10 = sub_53AD0();
  if (sub_5800(v3, 1, v10) == 1)
  {
    sub_7CD4(v3, &qword_6BCB8);
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v8 + 64) = 0u;
  }
  else
  {
    *(void *)(v8 + 72) = v10;
    sub_5DC4(v9);
    sub_7D4C();
    (*(void (**)(void))(v11 + 32))();
  }
  *(void *)(v8 + 80) = 0x65626D754E67726FLL;
  *(void *)(v8 + 88) = 0xE900000000000072;
  if (a2)
  {
    uint64_t v12 = sub_53A20();
    uint64_t v13 = a2;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    *(void *)(v8 + 104) = 0;
    *(void *)(v8 + 112) = 0;
  }
  *(void *)(v8 + 96) = v13;
  *(void *)(v8 + 120) = v12;
  *(void *)(v8 + 128) = 0xD000000000000012;
  *(void *)(v8 + 136) = 0x80000000000575A0;
  *(void *)(v8 + 168) = &type metadata for Bool;
  *(unsigned char *)(v8 + 144) = a3 & 1;
  swift_retain();
  sub_53A60();
  return swift_bridgeObjectRelease();
}

uint64_t sub_52D50(uint64_t a1, uint64_t a2)
{
  return sub_52DA4(a1, a2);
}

uint64_t sub_52DA4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_53B30();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_7D34();
  uint64_t v7 = sub_2E18((uint64_t *)&unk_6DA80);
  __chkstk_darwin(v7 - 8);
  sub_7C74(a1, (uint64_t)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t *)&unk_6DA80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, a2, v5);
  uint64_t v9 = sub_53A50();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v5);
  sub_7CD4(a1, (uint64_t *)&unk_6DA80);
  return v9;
}

uint64_t sub_52F10()
{
  return type metadata accessor for EmergencySexualAssaultBasicIntentCATs();
}

uint64_t sub_52F18(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_529AC(a1, a2, a3, a4, a5 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a6);
}

uint64_t sub_52F20()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t sub_52F30()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_52F40()
{
  return URLComponents.queryItems.setter();
}

uint64_t sub_52F50()
{
  return URLComponents.url.getter();
}

uint64_t sub_52F60()
{
  return URLComponents.host.setter();
}

uint64_t sub_52F70()
{
  return URLComponents.path.setter();
}

uint64_t sub_52F80()
{
  return URLComponents.scheme.setter();
}

uint64_t sub_52F90()
{
  return URLComponents.init()();
}

uint64_t sub_52FA0()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_52FB0()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_52FC0()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_52FD0()
{
  return LocalizedError.errorDescription.getter();
}

uint64_t sub_52FE0()
{
  return LocalizedError.recoverySuggestion.getter();
}

Class sub_52FF0()
{
  return PersonNameComponents._bridgeToObjectiveC()().super.isa;
}

uint64_t sub_53000()
{
  return type metadata accessor for PersonNameComponents();
}

void sub_53010(NSURL *retstr@<X8>)
{
}

uint64_t sub_53020()
{
  return URL.init(string:)();
}

uint64_t sub_53030()
{
  return type metadata accessor for URL();
}

uint64_t sub_53040()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_53050()
{
  return Locale.init(identifier:)();
}

uint64_t sub_53060()
{
  return Locale.identifier.getter();
}

uint64_t sub_53070()
{
  return type metadata accessor for Locale();
}

uint64_t sub_53080()
{
  return static CommonGuardFlowUtils.makeGuardFlow(withGuards:)();
}

uint64_t sub_53090()
{
  return ExecuteOnRemoteFlow.init(inputToExecute:device:outputPublisher:)();
}

uint64_t sub_530A0()
{
  return type metadata accessor for ExecuteOnRemoteFlow();
}

uint64_t sub_530B0()
{
  return type metadata accessor for ExecuteOnRemoteFlowResult();
}

uint64_t sub_530C0()
{
  return UserIdentityCheckFlowStrategy.init(allowsAnonymousUser:allowsUserInteraction:handoffConfiguration:requireSpeechProfile:)();
}

uint64_t sub_530D0()
{
  return UserIdentityCheckFlowStrategy.HandoffConfiguration.init(companionCompatiblityCheck:handoffStrategy:)();
}

uint64_t sub_530E0()
{
  return type metadata accessor for UserIdentityCheckFlowStrategy.HandoffConfiguration();
}

uint64_t sub_530F0()
{
  return UserIdentityCheckFlowStrategy.requireSpeechProfile.setter();
}

uint64_t sub_53100()
{
  return type metadata accessor for UserIdentityCheckFlowStrategy();
}

uint64_t sub_53110()
{
  return PromptForConfirmationFlow.__allocating_init(itemToConfirm:strategy:outputPublisher:)();
}

uint64_t sub_53120()
{
  return PromptForConfirmationFlowStrategy.makeErrorResponse(_:_:)();
}

uint64_t sub_53160()
{
  return static CompanionCompatibilityCheckFlowStrategy.require(_:redirectToServerOnFailure:)();
}

uint64_t sub_53170()
{
  return type metadata accessor for CompanionCompatibilityCheckFlowStrategy();
}

uint64_t sub_53180()
{
  return type metadata accessor for AnyFlow();
}

uint64_t sub_53190()
{
  return type metadata accessor for GuardFlow();
}

uint64_t sub_531A0()
{
  return static CommonFlowGuard.ensuringUserIdentity(using:)();
}

uint64_t sub_531B0()
{
  return static CommonFlowGuard.ensuringUserHasSupportedCompanion(using:)();
}

uint64_t sub_531C0()
{
  return type metadata accessor for CommonFlowGuard();
}

uint64_t sub_531D0()
{
  return Flow.eraseToAnyFlow()();
}

uint64_t sub_531E0()
{
  return Flow.deferToExecuteAsync(_:)();
}

uint64_t sub_531F0()
{
  return Flow.flexibleExecutionSupport.getter();
}

uint64_t sub_53210()
{
  return Flow.guarded<A>(by:)();
}

uint64_t sub_53230()
{
  return Flow<>.exitValue.getter();
}

uint64_t sub_53240()
{
  return static FlowSearchResult.flow(_:)();
}

uint64_t sub_53250()
{
  return type metadata accessor for FlowUnhandledReason();
}

uint64_t sub_53260()
{
  return FlowPlugin.findFlowFor(parse:)();
}

uint64_t sub_53270()
{
  return FlowPlugin.makeFlowFor(parse:)();
}

uint64_t sub_53280()
{
  return FlowPlugin.makeFlowFrame(parse:)();
}

void sub_53290(Swift::String refId)
{
}

void sub_532A0()
{
}

uint64_t sub_532B0()
{
  return static SiriKitEventSender.current.getter();
}

uint64_t sub_532C0()
{
  return dispatch thunk of SiriKitEventSending.send(_:)();
}

uint64_t sub_532E0()
{
  return type metadata accessor for SiriKitReliabilityCodes();
}

uint64_t sub_532F0()
{
  return SiriKitEvent.__allocating_init(activityType:taskType:statusReason:_:)();
}

uint64_t sub_53300()
{
  return type metadata accessor for SiriKitEvent();
}

uint64_t sub_53310()
{
  return dispatch thunk of DeviceState.isSidekick.getter();
}

uint64_t sub_53320()
{
  return dispatch thunk of DeviceState.siriLocale.getter();
}

uint64_t sub_53330()
{
  return dispatch thunk of DeviceState.restrictions.getter();
}

uint64_t sub_53340()
{
  return dispatch thunk of DeviceState.isTextToSpeechEnabled.getter();
}

uint64_t sub_53350()
{
  return dispatch thunk of DeviceState.preferencesLanguageCode.getter();
}

uint64_t sub_53360()
{
  return dispatch thunk of DeviceState.isPhone.getter();
}

uint64_t sub_53370()
{
  return dispatch thunk of DeviceState.isWatch.getter();
}

uint64_t sub_53380()
{
  return dispatch thunk of DeviceState.isAppleTV.getter();
}

uint64_t sub_53390()
{
  return dispatch thunk of DeviceState.isCarPlay.getter();
}

uint64_t sub_533A0()
{
  return dispatch thunk of DeviceState.isHomePod.getter();
}

uint64_t sub_533B0()
{
  return DeviceState.asInvocationContext.getter();
}

uint64_t sub_533C0()
{
  return DeviceState.isVox.getter();
}

uint64_t sub_533D0()
{
  return type metadata accessor for ActivityType();
}

uint64_t sub_533E0()
{
  return static ActionForInput.handle()();
}

uint64_t sub_533F0()
{
  return static ActionForInput.ignore()();
}

uint64_t sub_53400()
{
  return static AceOutputHelper.makeCancellationViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:canUseServerTTS:flowActivity:)();
}

uint64_t sub_53410()
{
  return static AceOutputHelper.makeConfirmationViewOutput(templateResult:deviceState:ttsEnabled:snippetAceViews:listenAfterSpeaking:canUseServerTTS:nlContextUpdate:additionalCommands:flowActivity:)();
}

uint64_t sub_53420()
{
  return static ExecuteResponse.replan<A>(next:childCompletion:)();
}

uint64_t sub_53430()
{
  return static ExecuteResponse.ongoing<A>(next:childCompletion:)();
}

uint64_t sub_53440()
{
  return static ExecuteResponse.complete<A>(next:)();
}

uint64_t sub_53450()
{
  return static ExecuteResponse.complete(next:)();
}

uint64_t sub_53460()
{
  return static ExecuteResponse.complete()();
}

uint64_t sub_53470()
{
  return static ExecuteResponse.unhandled(reason:isComplete:)();
}

uint64_t sub_53480()
{
  return static ExecuteResponse.unhandled(reason:)();
}

uint64_t sub_53490()
{
  return type metadata accessor for ExecuteResponse();
}

uint64_t sub_534A0()
{
  return NLContextUpdate.rrEntities.setter();
}

uint64_t sub_534B0()
{
  return NLContextUpdate.nluSystemDialogActs.setter();
}

uint64_t sub_534C0()
{
  return NLContextUpdate.weightedPromptStrict.setter();
}

uint64_t sub_534D0()
{
  return NLContextUpdate.weightedPromptTargetDomain.setter();
}

uint64_t sub_534E0()
{
  return NLContextUpdate.conversationStateAttachments.setter();
}

uint64_t sub_534F0()
{
  return NLContextUpdate.weightedPromptResponseOptions.setter();
}

uint64_t sub_53500()
{
  return NLContextUpdate.weightedPromptResponseTargets.setter();
}

uint64_t sub_53510()
{
  return NLContextUpdate.init()();
}

uint64_t sub_53520()
{
  return type metadata accessor for NLContextUpdate();
}

uint64_t sub_53530()
{
  return type metadata accessor for TemplatingResult();
}

uint64_t sub_53540()
{
  return dispatch thunk of AceServiceInvoker.submit<A>(_:completion:)();
}

uint64_t sub_53550()
{
  return type metadata accessor for ConfirmationResponse();
}

uint64_t sub_53570()
{
  return static OutputPublisherFactory.makeOutputPublisherAsync()();
}

uint64_t sub_53580()
{
  return type metadata accessor for CompanionDeviceInfoRequirement();
}

uint64_t sub_53590()
{
  return type metadata accessor for ExecuteOnRemoteDeviceSpecification();
}

uint64_t sub_535A0()
{
  return Input.parse.getter();
}

uint64_t sub_535B0()
{
  return type metadata accessor for Input();
}

uint64_t sub_535C0()
{
  return Parse.DirectInvocation.init(identifier:userData:)();
}

uint64_t sub_535D0()
{
  return Parse.DirectInvocation.identifier.getter();
}

uint64_t sub_535E0()
{
  return Parse.DirectInvocation.userData.getter();
}

uint64_t sub_535F0()
{
  return type metadata accessor for Parse.DirectInvocation();
}

uint64_t sub_53600()
{
  return type metadata accessor for Parse();
}

uint64_t sub_53610()
{
  return USOParse.userParse.getter();
}

uint64_t sub_53620()
{
  return type metadata accessor for USOParse();
}

uint64_t sub_53630()
{
  return type metadata accessor for AceOutput();
}

uint64_t sub_53640()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_53650()
{
  return type metadata accessor for Siri_Nlu_External_UsoGraph();
}

uint64_t sub_53660()
{
  return Siri_Nlu_External_UserParse.catiIntentName.getter();
}

uint64_t sub_53670()
{
  return type metadata accessor for Siri_Nlu_External_UserParse();
}

uint64_t sub_53680()
{
  return Siri_Nlu_External_SystemOffered.offeredAct.setter();
}

uint64_t sub_53690()
{
  return Siri_Nlu_External_SystemOffered.init()();
}

uint64_t sub_536A0()
{
  return type metadata accessor for Siri_Nlu_External_SystemOffered();
}

uint64_t sub_536B0()
{
  return Siri_Nlu_External_UserDialogAct.wantedToProceed.setter();
}

uint64_t sub_536C0()
{
  return Siri_Nlu_External_UserDialogAct.init()();
}

uint64_t sub_536D0()
{
  return type metadata accessor for Siri_Nlu_External_UserDialogAct();
}

uint64_t sub_536E0()
{
  return Siri_Nlu_External_SystemDialogAct.offered.setter();
}

uint64_t sub_536F0()
{
  return Siri_Nlu_External_SystemDialogAct.init()();
}

uint64_t sub_53700()
{
  return type metadata accessor for Siri_Nlu_External_SystemDialogAct();
}

uint64_t sub_53710()
{
  return Siri_Nlu_External_UserWantedToProceed.reference.setter();
}

uint64_t sub_53720()
{
  return Siri_Nlu_External_UserWantedToProceed.init()();
}

uint64_t sub_53730()
{
  return type metadata accessor for Siri_Nlu_External_UserWantedToProceed();
}

uint64_t sub_53740()
{
  return static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)();
}

uint64_t sub_53750()
{
  return DomainOntologyNode.init(name:childNodes:isInEventTree:)();
}

uint64_t sub_53760()
{
  return type metadata accessor for DomainOntologyNode();
}

uint64_t sub_53770()
{
  return TerminalOntologyNode.init(name:multicardinal:)();
}

uint64_t sub_53780()
{
  return dispatch thunk of UsoBuilder.addUsoIdentifier(usoIdentifier:)();
}

uint64_t sub_53790()
{
  return UsoIdentifier.init(value:appBundleId:namespace:)();
}

uint64_t sub_537A0()
{
  return type metadata accessor for UsoIdentifier();
}

uint64_t sub_537D0()
{
  return static UsoGraphBuilder.buildGraphWithOptions(taskBuilders:options:)();
}

uint64_t sub_537E0()
{
  return type metadata accessor for UsoBuilderOptions();
}

uint64_t sub_537F0()
{
  return IntentNodeTraversable.value<A>(forNode:)();
}

uint64_t sub_53800()
{
  return dispatch thunk of UsoEntityBuilder_common_Person.setName(value:)();
}

uint64_t sub_53810()
{
  return UsoEntityBuilder_common_Person.init()();
}

uint64_t sub_53820()
{
  return type metadata accessor for UsoEntityBuilder_common_Person();
}

uint64_t sub_53830()
{
  return dispatch thunk of Uso_VerbTemplateBuilder_Target.setTarget(value:)();
}

uint64_t sub_53840()
{
  return UsoEntityBuilder_common_Setting.init()();
}

uint64_t sub_53850()
{
  return type metadata accessor for UsoEntityBuilder_common_Setting();
}

uint64_t sub_53870()
{
  return dispatch thunk of UsoEntityBuilder_common_PhoneCall.addRecipients(value:)();
}

uint64_t sub_53880()
{
  return UsoEntityBuilder_common_PhoneCall.init()();
}

uint64_t sub_53890()
{
  return type metadata accessor for UsoEntityBuilder_common_PhoneCall();
}

uint64_t sub_538A0()
{
  return UsoTaskBuilder_open_common_Website.init()();
}

uint64_t sub_538B0()
{
  return type metadata accessor for UsoTaskBuilder_open_common_Website();
}

uint64_t sub_538C0()
{
  return UsoTaskBuilder_call_common_PhoneCall.init()();
}

uint64_t sub_538D0()
{
  return type metadata accessor for UsoTaskBuilder_call_common_PhoneCall();
}

uint64_t sub_538E0()
{
  return UsoTaskBuilder_enable_common_Setting.init()();
}

uint64_t sub_538F0()
{
  return type metadata accessor for UsoTaskBuilder_enable_common_Setting();
}

uint64_t sub_53900()
{
  return dispatch thunk of Uso_VerbTemplateBuilder_ReferenceTrigger.setReference(value:)();
}

uint64_t sub_53910()
{
  return NLIntent.originalInput.getter();
}

uint64_t sub_53920()
{
  return type metadata accessor for NLIntent();
}

uint64_t sub_53930()
{
  return SiriEnvironment.currentRequest.getter();
}

uint64_t sub_53940()
{
  return static SiriEnvironment.forCurrentTask.getter();
}

uint64_t sub_53950()
{
  return type metadata accessor for SiriEnvironment();
}

uint64_t sub_53960()
{
  return SiriEnvironmentLocating<>.siriEnvironment.modify();
}

uint64_t sub_53970()
{
  return SiriEnvironmentLocating<>.siriEnvironment.getter();
}

uint64_t sub_53980()
{
  return SiriEnvironmentLocating<>.siriEnvironment.setter();
}

uint64_t sub_53990()
{
  return type metadata accessor for DeviceIdiom();
}

uint64_t sub_539A0()
{
  return static ResponseMode.displayOnly.getter();
}

uint64_t sub_539B0()
{
  return type metadata accessor for ResponseMode();
}

uint64_t sub_539C0()
{
  return static DeviceRestrictions.phoneFeaturesUnavailable.getter();
}

uint64_t sub_539D0()
{
  return type metadata accessor for DeviceRestrictions();
}

uint64_t sub_539E0()
{
  return dispatch thunk of DialogPhoneNumber.Builder.build()();
}

uint64_t sub_539F0()
{
  return dispatch thunk of DialogPhoneNumber.Builder.withValue(print:speak:)();
}

uint64_t sub_53A00()
{
  return DialogPhoneNumber.Builder.init()();
}

uint64_t sub_53A10()
{
  return type metadata accessor for DialogPhoneNumber.Builder();
}

uint64_t sub_53A20()
{
  return type metadata accessor for DialogPhoneNumber();
}

uint64_t sub_53A30()
{
  return CATGlobals.__allocating_init()();
}

uint64_t sub_53A40()
{
  return type metadata accessor for CATGlobals();
}

uint64_t sub_53A50()
{
  return CATWrapper.init(templateDir:options:globals:)();
}

uint64_t sub_53A60()
{
  return dispatch thunk of CATWrapper.execute(catId:parameters:)();
}

uint64_t sub_53A80()
{
  return type metadata accessor for CATWrapper();
}

uint64_t sub_53A90()
{
  return CATWrapper.deinit();
}

uint64_t sub_53AA0()
{
  return static CATExecutor.execute(bundle:catId:parameters:globals:callback:options:)();
}

uint64_t sub_53AB0()
{
  return type metadata accessor for CATExecutor();
}

uint64_t sub_53AC0()
{
  return SpeakableString.init(print:speak:)();
}

uint64_t sub_53AD0()
{
  return type metadata accessor for SpeakableString();
}

uint64_t sub_53AE0()
{
  return CATWrapperSimple.init(templateDir:options:globals:)();
}

uint64_t sub_53AF0()
{
  return CATWrapperSimple.init(useResponseMode:options:)();
}

uint64_t sub_53B00()
{
  return CATWrapperSimple.deinit();
}

uint64_t sub_53B10()
{
  return CATType.toDictionary.getter();
}

uint64_t sub_53B20()
{
  return static CATOption.defaultMode.getter();
}

uint64_t sub_53B30()
{
  return type metadata accessor for CATOption();
}

uint64_t sub_53B40()
{
  return OutputFlow.init(templatingResult:snippets:flowConfig:rrEntities:)();
}

uint64_t sub_53B50()
{
  return type metadata accessor for OutputFlow();
}

uint64_t sub_53B60()
{
  return SequenceFlow.init(aceService:flows:)();
}

uint64_t sub_53B70()
{
  return type metadata accessor for SequenceFlow();
}

uint64_t sub_53B80()
{
  return AppPunchOutFlow.init(aceService:url:instrumentationTask:)();
}

uint64_t sub_53B90()
{
  return type metadata accessor for AppPunchOutFlow();
}

uint64_t sub_53BA0()
{
  return FlowConfigModel.init(deviceState:aceService:aceServiceAsync:sharedContextService:outputPublisher:flowFinder:networkStatusProvider:)();
}

uint64_t sub_53BB0()
{
  return LocationService.init(with:geocoder:)();
}

uint64_t sub_53BD0()
{
  return makeConfirmationButtons(confirmButton:rejectButton:device:)();
}

uint64_t sub_53BE0()
{
  return CurrentRequest.responseMode.getter();
}

uint64_t sub_53BF0()
{
  return GeneralEmergencyIntent.init(emergencySituation:)();
}

uint64_t sub_53C00()
{
  return EmergencyCSAMIntent.init(emergencySituation:emergencyVerb:originalInput:)();
}

uint64_t sub_53C10()
{
  return EmergencyCSAMIntent.isCSAMContentReporting.getter();
}

uint64_t sub_53C20()
{
  return EmergencyConfirmation.toPromptResponseOption()()._countAndFlagsBits;
}

uint64_t sub_53C30()
{
  return EmergencyOrganization.init(rawValue:)();
}

uint64_t sub_53C40()
{
  return EmergencyOrganizationInfo.websiteURL.getter();
}

uint64_t sub_53C50()
{
  return EmergencyOrganizationInfo.asRREntities()();
}

uint64_t sub_53C60()
{
  return EmergencyOrganizationInfo.hasNameAndNumber.getter();
}

uint64_t sub_53C70()
{
  return EmergencyOrganizationInfo.hasNameAndWebsite.getter();
}

uint64_t sub_53C80()
{
  return EmergencyOrganizationInfoProvider.init(siriLocale:locationProvider:resourceDecoder:)();
}

uint64_t sub_53C90()
{
  return type metadata accessor for EmergencyOrganizationInfoProvider();
}

uint64_t sub_53CA0()
{
  return EmergencyVerb.rawValue.getter();
}

uint64_t sub_53CB0()
{
  return EmergencyDialogAct.description.getter();
}

uint64_t sub_53CC0()
{
  return EmergencyDialogAct.init(userParse:nlv4MigrationFeatureFlagIsEnabled:)();
}

uint64_t sub_53CD0()
{
  return type metadata accessor for EmergencyDialogAct();
}

uint64_t sub_53CE0()
{
  return static EmergencySituation.fromValueWithCleanup(_:)();
}

uint64_t sub_53CF0()
{
  return EmergencySituation.rawValue.getter();
}

uint64_t sub_53D00()
{
  return NLConstants.asNamespace.getter();
}

uint64_t sub_53D10()
{
  return CATIIntentName.init(rawValue:)();
}

uint64_t sub_53D20()
{
  return CATIIntentName.rawValue.getter();
}

uint64_t sub_53D30()
{
  return DirectInvocationURI.payloadKey.getter();
}

uint64_t sub_53D40()
{
  return inferUsableSituation(situation:organization:)();
}

uint64_t sub_53D50()
{
  return Message.debugDescription.getter();
}

uint64_t sub_53D60()
{
  return DeviceUnit.assistantId.getter();
}

uint64_t sub_53D70()
{
  return static DeviceResolutionService.sharedService.getter();
}

uint64_t sub_53D80()
{
  return type metadata accessor for DeviceResolutionService();
}

uint64_t sub_53D90()
{
  return Logger.emergency.unsafeMutableAddressor();
}

uint64_t sub_53DA0()
{
  return Logger.logObject.getter();
}

uint64_t sub_53DB0()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_53DC0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_53DD0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_53DE0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_53DF0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_53E00()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_53E10()
{
  return String.init<A>(describing:)();
}

uint64_t sub_53E20()
{
  return String.toSpeakableString.getter();
}

uint64_t sub_53E30()
{
  return String.toDialogPhoneNumber.getter();
}

uint64_t sub_53E40()
{
  return String.hash(into:)();
}

void sub_53E50(Swift::String a1)
{
}

Swift::Int sub_53E60()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_53E70()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_53E80()
{
  return specialized Array._endMutation()();
}

uint64_t sub_53E90()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_53EA0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_53EB0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_53EC0()
{
  return SASTButtonItem.init(label:commands:centered:)();
}

uint64_t sub_53ED0()
{
  return Optional.description.getter();
}

uint64_t sub_53EE0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_53EF0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_53F00()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_53F10()
{
  return dispatch thunk of SetAlgebra.isSuperset(of:)();
}

Swift::Int sub_53F20(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

void sub_53F30(Swift::Int a1)
{
}

uint64_t sub_53F40()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_53F50()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_53F60()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_53F70()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_53F80()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_53F90()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_53FA0(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_53FD0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_53FE0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_53FF0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_54000()
{
  return Error._code.getter();
}

uint64_t sub_54010()
{
  return Error._domain.getter();
}

uint64_t sub_54020()
{
  return Error._userInfo.getter();
}

uint64_t sub_54030()
{
  return Hasher.init(_seed:)();
}

void sub_54040(Swift::UInt a1)
{
}

Swift::Int sub_54050()
{
  return Hasher._finalize()();
}

uint64_t sub_54060()
{
  return Result<>.firstPrint.getter();
}

uint64_t sub_54070()
{
  return type metadata accessor for Result();
}

uint64_t sub_54080()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_54090()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}