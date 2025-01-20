int main(int argc, const char **argv, const char **envp)
{
  id v3;

  qword_10000C960 = (uint64_t)[objc_allocWithZone((Class)type metadata accessor for ServiceDelegate()) init];
  v3 = [self serviceListener];
  qword_10000C968 = (uint64_t)v3;
  [v3 setDelegate:qword_10000C960];
  [v3 resume];
  return 0;
}

uint64_t type metadata accessor for ServiceDelegate()
{
  return self;
}

id sub_100002E1C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServiceDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100002FCC(void *a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a3;
  uint64_t v8 = sub_100006940();
  uint64_t v10 = v9;

  v3[4] = v8;
  v3[5] = v10;
  return _swift_task_switch(sub_100003070, 0, 0);
}

uint64_t sub_100003070()
{
  *(void *)(v0 + 48) = *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC13IngestService13IngestService_storage);
  sub_100006A20();
  sub_100004924();
  uint64_t v2 = sub_100006A50();
  return _swift_task_switch(sub_100003108, v2, v1);
}

uint64_t sub_100003108()
{
  uint64_t v1 = sub_100006A00();
  *(void *)(v0 + 56) = 0;
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v0 + 32);
  unint64_t v3 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 24);

  sub_100005700(v4, v3);
  (*(void (**)(uint64_t, uint64_t, void))(v5 + 16))(v5, v2, 0);
  _Block_release(*(const void **)(v0 + 24));
  id v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100003204()
{
  uint64_t v2 = *(void *)(v0 + 32);
  unint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 24);

  sub_100005700(v2, v1);
  uint64_t v4 = (void *)sub_1000068E0();
  swift_errorRelease();
  (*(void (**)(uint64_t))(v3 + 16))(v3);

  _Block_release(*(const void **)(v0 + 24));
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_1000032B4(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_1000069B0();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  sub_1000049E0(&qword_10000C820);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  return _swift_task_switch(sub_1000033C4, 0, 0);
}

uint64_t sub_1000033C4()
{
  *(void *)(v0 + 80) = *(void *)(*(void *)(v0 + 24) + OBJC_IVAR____TtC13IngestService13IngestService_storage);
  sub_100006A20();
  sub_100004924();
  uint64_t v2 = sub_100006A50();
  return _swift_task_switch(sub_10000345C, v2, v1);
}

uint64_t sub_10000345C()
{
  sub_1000069F0();
  *(void *)(v0 + 88) = 0;
  return _swift_task_switch(sub_1000034EC, 0, 0);
}

uint64_t sub_1000034EC()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  sub_100004A80(v0[9], v1);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = v0[7];
    uint64_t v7 = v0[5];
    uint64_t v6 = v0[6];
    uint64_t v8 = v0[4];
    (*(void (**)(uint64_t, void, uint64_t))(v7 + 32))(v5, v0[8], v8);
    sub_1000069C0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v5, v8);
    uint64_t v4 = sub_1000069D0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v8);
  }
  sub_1000050AC(v0[9], &qword_10000C820);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
  return v9(v4);
}

uint64_t sub_10000364C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000384C(uint64_t a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  a3;
  uint64_t v6 = (void *)swift_task_alloc();
  v3[4] = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_100003908;
  return sub_1000032B4(a1);
}

uint64_t sub_100003908(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 16);
  uint64_t v7 = *v2;
  swift_task_dealloc();

  uint64_t v8 = *(void (***)(void, void, void))(v5 + 24);
  if (v3)
  {
    uint64_t v9 = (void *)sub_1000068E0();
    swift_errorRelease();
    ((void (**)(void, void, void *))v8)[2](v8, 0, v9);

    _Block_release(v8);
  }
  else
  {
    ((void (**)(void, void *, void))v8)[2](v8, a1, 0);
    _Block_release(v8);
  }
  uint64_t v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

uint64_t sub_100003AA8()
{
  v1[5] = v0;
  v1[6] = type metadata accessor for InternalLogger();
  v1[7] = swift_task_alloc();
  uint64_t v2 = sub_100006970();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  return _swift_task_switch(sub_100003B98, 0, 0);
}

uint64_t sub_100003B98()
{
  if (qword_10000C6D0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[5];
  v0[11] = sub_1000048EC(v0[6], (uint64_t)qword_10000C970);
  sub_10000575C(0, 0xE000000000000000, 0xD000000000000050, 0x80000001000072D0, 0x2928747365676E69, 0xE800000000000000);
  sub_100006960();
  v0[12] = *(void *)(v1 + OBJC_IVAR____TtC13IngestService13IngestService_storage);
  sub_100006A20();
  sub_100004924();
  uint64_t v3 = sub_100006A50();
  return _swift_task_switch(sub_100003CC0, v3, v2);
}

uint64_t sub_100003CC0()
{
  sub_1000069E0();
  *(void *)(v0 + 104) = 0;
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100003DAC;
  return IngestionExtensionHost.ingest()();
}

uint64_t sub_100003DAC()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100004130;
  }
  else {
    uint64_t v2 = sub_100003EC0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100003EC0()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  sub_10000578C(0x676E69796C706572, 0xE800000000000000, 0xD000000000000050, 0x80000001000072D0, 0x2928747365676E69, 0xE800000000000000);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100003FA4()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[9];
  uint64_t v5 = v0[7];
  sub_10000497C(v0[11], v5);
  sub_100006AB0(56);
  v0[2] = 0;
  v0[3] = 0xE000000000000000;
  v9._object = (void *)0x8000000100007330;
  v9._countAndFlagsBits = 0xD000000000000036;
  sub_100006A30(v9);
  v0[4] = v1;
  sub_1000049E0(&qword_10000C818);
  sub_100006AE0();
  sub_100005774(v0[2], v0[3], 0xD000000000000050, 0x80000001000072D0, 0x2928747365676E69, 0xE800000000000000);
  swift_bridgeObjectRelease();
  sub_100004A24(v5);
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_100004130()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[10];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[9];
  uint64_t v5 = v0[7];
  sub_10000497C(v0[11], v5);
  sub_100006AB0(56);
  v0[2] = 0;
  v0[3] = 0xE000000000000000;
  v9._object = (void *)0x8000000100007330;
  v9._countAndFlagsBits = 0xD000000000000036;
  sub_100006A30(v9);
  v0[4] = v1;
  sub_1000049E0(&qword_10000C818);
  sub_100006AE0();
  sub_100005774(v0[2], v0[3], 0xD000000000000050, 0x80000001000072D0, 0x2928747365676E69, 0xE800000000000000);
  swift_bridgeObjectRelease();
  sub_100004A24(v5);
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_100004424(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000044CC;
  return sub_100003AA8();
}

uint64_t sub_1000044CC()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc();

  uint64_t v7 = *(void *)(v3 + 24);
  if (v2)
  {
    uint64_t v8 = (void *)sub_1000068E0();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  _Block_release(*(const void **)(v4 + 24));
  Swift::String v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

id sub_100004884()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IngestService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IngestService()
{
  return self;
}

uint64_t sub_1000048EC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100004924()
{
  unint64_t result = qword_10000C810;
  if (!qword_10000C810)
  {
    sub_100006A20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C810);
  }
  return result;
}

uint64_t sub_10000497C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InternalLogger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000049E0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004A24(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InternalLogger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100004A80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000049E0(&qword_10000C820);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004AE8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100004B28()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_100005758;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_10000C838 + dword_10000C838);
  return v5(v2, v3);
}

uint64_t sub_100004BD4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100005758;
  return v6();
}

uint64_t sub_100004CA4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100005758;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10000C848 + dword_10000C848);
  return v6(v2, v3, v4);
}

uint64_t sub_100004D64(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_100005758;
  return v7();
}

uint64_t sub_100004E34(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100005758;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10000C858 + dword_10000C858);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_100004F00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006A70();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100006A60();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000050AC(a1, &qword_10000C830);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100006A50();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1000050AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000049E0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100005108(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000051E4;
  return v6(a1);
}

uint64_t sub_1000051E4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000052DC()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100005314(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000053CC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10000C868 + dword_10000C868);
  return v6(a1, v4);
}

uint64_t sub_1000053CC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000054C0()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100005500()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_100005758;
  uint64_t v6 = (uint64_t (*)(uint64_t, void *, void *))((char *)&dword_10000C878 + dword_10000C878);
  return v6(v2, v3, v4);
}

uint64_t sub_1000055BC()
{
  _Block_release(*(const void **)(v0 + 24));
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100005604()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_1000053CC;
  uint64_t v6 = (uint64_t (*)(void *, void *, void *))((char *)&dword_10000C898 + dword_10000C898);
  return v6(v2, v3, v4);
}

uint64_t sub_1000056C0()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100005700(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_10000575C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_1000057A4(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void))&static os_log_type_t.info.getter);
}

uint64_t sub_100005774(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_1000057A4(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void))&static os_log_type_t.error.getter);
}

uint64_t sub_10000578C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_1000057A4(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void))&static os_log_type_t.debug.getter);
}

uint64_t sub_1000057A4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t (*a7)(void))
{
  uint64_t v34 = a5;
  uint64_t v35 = a1;
  uint64_t v31 = a3;
  uint64_t v11 = sub_100006930();
  uint64_t v32 = *(void *)(v11 - 8);
  uint64_t v33 = v11;
  __chkstk_darwin();
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100006990();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin();
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v7, v14);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v18 = sub_100006980();
  os_log_type_t v19 = a7();
  int v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc();
    unint64_t v28 = a2;
    uint64_t v22 = v21;
    uint64_t v30 = swift_slowAlloc();
    uint64_t v37 = v30;
    *(_DWORD *)uint64_t v22 = 136315650;
    sub_100006900();
    int v29 = v20;
    uint64_t v23 = sub_100006910();
    uint64_t v31 = v14;
    unint64_t v25 = v24;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v13, v33);
    uint64_t v36 = sub_100005CF8(v23, v25, &v37);
    sub_100006A90();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_100005CF8(v34, a6, &v37);
    sub_100006A90();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 22) = 2080;
    unint64_t v26 = v28;
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_100005CF8(v35, v26, &v37);
    sub_100006A90();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v29, "[%s: %s] %s", (uint8_t *)v22, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v31);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
}

uint64_t sub_100005B58()
{
  uint64_t v0 = sub_100006990();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for InternalLogger();
  sub_100006400(v4, qword_10000C970);
  uint64_t v5 = sub_1000048EC(v4, (uint64_t)qword_10000C970);
  if (qword_10000C6D8 != -1) {
    swift_once();
  }
  id v6 = (id)qword_10000C8B8;
  sub_1000069A0();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5, v3, v0);
}

uint64_t sub_100005C8C()
{
  sub_1000064B0();
  uint64_t result = sub_100006A80();
  qword_10000C8B8 = result;
  return result;
}

uint64_t sub_100005CF8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005DCC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000063A0((uint64_t)v12, *a3);
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
      sub_1000063A0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006350((uint64_t)v12);
  return v7;
}

uint64_t sub_100005DCC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100006AA0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100005F88(a5, a6);
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
  uint64_t v8 = sub_100006AD0();
  if (!v8)
  {
    sub_100006AF0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006B00();
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

uint64_t sub_100005F88(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100006020(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006200(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006200(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100006020(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100006198(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100006AC0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100006AF0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100006A40();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006B00();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100006AF0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100006198(uint64_t a1, uint64_t a2)
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
  sub_1000049E0(&qword_10000C8C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006200(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000049E0(&qword_10000C8C0);
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
  uint64_t result = sub_100006B00();
  __break(1u);
  return result;
}

uint64_t sub_100006350(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000063A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100006400(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t type metadata accessor for InternalLogger()
{
  uint64_t result = qword_10000C928;
  if (!qword_10000C928) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_1000064B0()
{
  unint64_t result = qword_10000C8C8;
  if (!qword_10000C8C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000C8C8);
  }
  return result;
}

uint64_t sub_1000064F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006990();
  size_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_10000655C(uint64_t a1)
{
  uint64_t v2 = sub_100006990();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_1000065C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006990();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_100006624(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006990();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100006688(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006990();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000066EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006990();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100006750(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006764);
}

uint64_t sub_100006764(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006990();
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_1000067D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000067E4);
}

uint64_t sub_1000067E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006990();
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_100006854()
{
  uint64_t result = sub_100006990();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000068E0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1000068F0()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_100006900()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t sub_100006910()
{
  return URL.lastPathComponent.getter();
}

uint64_t sub_100006920()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t sub_100006930()
{
  return type metadata accessor for URL();
}

uint64_t sub_100006940()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006960()
{
  return IngestionExtensionHost.init()();
}

uint64_t sub_100006970()
{
  return type metadata accessor for IngestionExtensionHost();
}

uint64_t sub_100006980()
{
  return Logger.logObject.getter();
}

uint64_t sub_100006990()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000069A0()
{
  return Logger.init(_:)();
}

uint64_t sub_1000069B0()
{
  return type metadata accessor for StagingEntry();
}

uint64_t sub_1000069C0()
{
  return type metadata accessor for DEStagingEntry();
}

uint64_t sub_1000069D0()
{
  return DEStagingEntry.__allocating_init(_:)();
}

uint64_t sub_1000069E0()
{
  return dispatch thunk of PersistentStorage.prepareForIngest()();
}

uint64_t sub_1000069F0()
{
  return dispatch thunk of PersistentStorage.fetch(id:)();
}

uint64_t sub_100006A00()
{
  return dispatch thunk of PersistentStorage.create(_:)();
}

uint64_t sub_100006A10()
{
  return PersistentStorage.__allocating_init(internal:)();
}

uint64_t sub_100006A20()
{
  return type metadata accessor for PersistentStorage();
}

void sub_100006A30(Swift::String a1)
{
}

Swift::Int sub_100006A40()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100006A50()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100006A60()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100006A70()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100006A80()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_100006A90()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100006AA0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

void sub_100006AB0(Swift::Int a1)
{
}

uint64_t sub_100006AC0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100006AD0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100006AE0()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100006AF0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100006B00()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}